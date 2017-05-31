// Sistema         : Clase de CR_FID_CORREO
// Fecha de Inicio : 25/07/2005
// Función forma   : Clase de CR_FID_CORREO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrFidCorr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

IntPers,       // Persona
IntCrFidMae,   // Alta FIDEICOMISO Maestro
IntParamCre,
IntGenCre,
IntSICC
;

Type
 TCrFidCorr= class; 

  TWCrFidCorreo=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_PERSONA : TLabel;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    LBCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    rgSIT_FID_CORREO: TRadioGroup;
    edID_PERSONA: TEdit;
    btID_PERSONA: TBitBtn;
    edNOMBRE: TEdit;
    edEMAIL: TEdit;
    ilID_PERSONA: TInterLinkit;
    lbEMAIL: TLabel;
    lbID_FID_MAESTRO: TLabel;
    edID_FID_MAESTRO: TEdit;
    btID_FID_MAESTRO: TBitBtn;
    lbNUM_FOL_ADHESION: TLabel;
    lbNOM_FIDEICOMITEN: TLabel;
    edNOM_FIDEICOMITEN: TEdit;
    edNUM_FOL_ADHESION: TEdit;
    ilID_FID_MAESTRO: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btID_PERSONAClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure ilID_PERSONACapture(Sender: TObject; var Show: Boolean);
    procedure ilID_PERSONAEjecuta(Sender: TObject);
    procedure edID_PERSONAExit(Sender: TObject);
    procedure edEMAILExit(Sender: TObject);
    procedure rgSIT_FID_CORREOExit(Sender: TObject);
    procedure btID_FID_MAESTROClick(Sender: TObject);
    procedure ilID_FID_MAESTROEjecuta(Sender: TObject);
    procedure edID_FID_MAESTROExit(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrFidCorr;
end;
 TCrFidCorr= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre : TParamCre;
        Persona : TPersona;
        Fideicomiso : TCrFidMae;

        ID_FID_MAESTRO           : TInterCampo;
        ID_PERSONA               : TInterCampo;
        EMAIL                    : TInterCampo;
        SIT_FID_CORREO           : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation

{$R *.DFM}

constructor TCrFidCorr.Create( AOwner : TComponent );
begin Inherited;
      ID_FID_MAESTRO :=CreaCampo('ID_FID_MAESTRO',ftFloat,tsNinguno,tsNinguno,True);
                ID_FID_MAESTRO.Caption:='Folio de Fideicomiso Maestro';
      ID_PERSONA :=CreaCampo('ID_PERSONA',ftFloat,tsNinguno,tsNinguno,True);
                ID_PERSONA.Caption:='Número de Persona';
      EMAIL :=CreaCampo('EMAIL',ftString,tsNinguno,tsNinguno,True);
                EMAIL.Caption:='Em@il';
      SIT_FID_CORREO :=CreaCampo('SIT_FID_CORREO',ftString,tsNinguno,tsNinguno,True);
                SIT_FID_CORREO.Caption:='Situación Fid Correo';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      FKeyFields.Add('ID_FID_MAESTRO');
      FKeyFields.Add('ID_PERSONA');

      With SIT_FID_CORREO do
        Begin
        Size:=3;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
        End;

      Fideicomiso := TCrFidMae.Create(Self);
      Fideicomiso.MasterSource:=Self;
      Fideicomiso.FieldByName('ID_FID_MAESTRO').MasterField := 'ID_FID_MAESTRO';
      Fideicomiso.BuscaWhereString := '  PKGCRGYM.GET_ES_VALIDO_FIDEICOMISO(CR_FID_MAESTRO.ID_FID_MAESTRO) = '+SQLStr(CVERDAD)+coCRLF+
                                      '  AND CR_FID_MAESTRO.SIT_FID_MAESTRO <> '+SQLStr(CSIT_CA)+coCRLF;
      Fideicomiso.FilterString := Fideicomiso.BuscaWhereString;
      
      Persona := TPersona.Create(Self);
      Persona.MasterSource:=Self;
      Persona.FieldByName('ID_PERSONA').MasterField := 'ID_PERSONA';
      Persona.BuscaWhereString := ' CVE_PER_JURIDICA = ' + SQLStr('PF')+' AND PERSONA_FISICA.ID_PERSONA IN (SELECT ID_PERSONA FROM EMPLEADO)';
      Persona.FilterString := Persona.BuscaWhereString;

      TableName := 'CR_FID_CORREO';
      UseQuery := True;
      HelpFile := 'IntCrFidCorr.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrFidCorr.Destroy;
begin
 If Assigned(Fideicomiso) Then Fideicomiso.Free;
 If Assigned(Persona) Then Persona.Free;
 inherited;
end;


function TCrFidCorr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrFidCorreo;
begin
   W:=TWCrFidCorreo.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Function TCrFidCorr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrFiCo.it','F,F');
      Try if Active then begin T.Param(0,ID_FID_MAESTRO.AsString);
                               T.Param(0,ID_PERSONA.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_FID_CORREO********************)
(*                                                                              *)
(*  FORMA DE CR_FID_CORREO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FID_CORREO********************)

procedure TWCrFidCorreo.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  ID_FID_MAESTRO.Control  := edID_FID_MAESTRO;
  ID_PERSONA.Control      := edID_PERSONA;
  EMAIL.Control           := edEMAIL;
  SIT_FID_CORREO.Control  := rgSIT_FID_CORREO;
  CVE_USU_ALTA.Control    := edCVE_USU_ALTA;
  F_ALTA.Control          := edF_ALTA;
  CVE_USU_MODIFICA.Control:= edCVE_USU_MODIFICA;
  F_MODIFICA.Control      := edF_MODIFICA;

  Fideicomiso.ID_FID_MAESTRO.Control   := edID_FID_MAESTRO;
  Fideicomiso.NUM_FOL_ADHESION.Control := edNUM_FOL_ADHESION;
  Fideicomiso.NOM_FIDEICOMITEN.Control := edNOM_FIDEICOMITEN;

  Persona.ID_PERSONA.Control := edID_PERSONA;
  Persona.Nombre.Control := edNOMBRE;

  Interforma1.MsgPanel := MsgPanel;
  End;
end;

procedure TWCrFidCorreo.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_FID_MAESTRO.Control  := Nil;
  ID_PERSONA.Control      := Nil;
  EMAIL.Control           := Nil;
  SIT_FID_CORREO.Control  := Nil;
  CVE_USU_ALTA.Control    := Nil;
  F_ALTA.Control          := Nil;
  CVE_USU_MODIFICA.Control:= Nil;
  F_MODIFICA.Control      := Nil;

  Persona.ID_PERSONA.Control := Nil;
  Persona.Nombre.Control := Nil;

  Fideicomiso.ID_FID_MAESTRO.Control   := Nil;
  Fideicomiso.NUM_FOL_ADHESION.Control := Nil;
  Fideicomiso.NOM_FIDEICOMITEN.Control := Nil;

  Interforma1.MsgPanel := Nil;
  End;
end;

procedure TWCrFidCorreo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrFidCorreo.InterForma1DespuesNuevo(Sender: TObject);
begin If edID_FID_MAESTRO.CanFocus Then edID_FID_MAESTRO.SetFocus;
      Objeto.SIT_FID_CORREO.AsString := CSIT_AC;
end;

procedure TWCrFidCorreo.InterForma1DespuesModificar(Sender: TObject);
begin If edEMAIL.CanFocus Then edEMAIL.SetFocus;
end;

procedure TWCrFidCorreo.btID_PERSONAClick(Sender: TObject);
begin
 With Objeto Do
  Begin
  If Persona.Busca Then
   If edEMAIL.CanFocus Then edEMAIL.SetFocus;
  End;
end;

procedure TWCrFidCorreo.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlstrMessage : String;
    mrResult : Word;
begin
 If IsNewData Then vlstrMessage := CCONFIRM_ALMACENA_INS
 Else vlstrMessage := CCONFIRM_ALMACENA_MOD;
 mrResult := MessageDlg(vlstrMessage, mtConfirmation, [mbYes, mbNo], 0);
 With Objeto Do
   If (mrResult = mrYes) Then
    Begin
      If (IsNewData) Then
       Begin
       F_ALTA.AsDateTime        := Apli.DameFechaEmpresa;
       CVE_USU_ALTA.AsString    := Apli.Usuario;
       End
      Else
       Begin
       F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresa;
       CVE_USU_MODIFICA.AsString := Apli.Usuario;
       End;
     End;
 Realizado := mrResult = mrYes;
end;

procedure TWCrFidCorreo.ilID_PERSONACapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrFidCorreo.ilID_PERSONAEjecuta(Sender: TObject);
begin
 With Objeto Do
  If Persona.FindKey([ilID_PERSONA.Buffer]) Then;
   If edEMAIL.CanFocus Then edEMAIL.SetFocus; 
end;

procedure TWCrFidCorreo.edID_FID_MAESTROExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edID_FID_MAESTRO.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbID_FID_MAESTRO.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrFidCorreo.edID_PERSONAExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edID_PERSONA.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbID_PERSONA.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrFidCorreo.edEMAILExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edEMAIL.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbEMAIL.Caption+'.'
   Else If (Pos('@',edEMAIL.Text) = 0) Then vlstrMsg := 'Favor de indicar un '+lbEMAIL.Caption+' válido.';
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrFidCorreo.rgSIT_FID_CORREOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_FID_CORREO, True, '',True);
end;

procedure TWCrFidCorreo.btID_FID_MAESTROClick(Sender: TObject);
begin
 If Objeto.Fideicomiso.Busca Then
  If edID_PERSONA.CanFocus Then edID_PERSONA.SetFocus;
end;

procedure TWCrFidCorreo.ilID_FID_MAESTROEjecuta(Sender: TObject);
begin
 With Objeto Do
  If Fideicomiso.FindKey([ilID_FID_MAESTRO.Buffer]) Then
    If edID_PERSONA.CanFocus Then edID_PERSONA.SetFocus;
end;

end.
