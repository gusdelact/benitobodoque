// Sistema         : Clase de CR_FID_DELEGADO
// Fecha de Inicio : 20/07/2005
// Función forma   : Clase de CR_FID_DELEGADO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrFidDele;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

IntPers,       // Persona
IntParamCre,
IntGenCre,
IntSICC
;

Type
 TCrFidDele= class; 

  TWCrFidDeleg=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_PERSONA : TLabel; 
    edID_PERSONA : TEdit;
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
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    LBCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    rgSIT_FID_DELEGADO: TRadioGroup;
    btID_PERSONA: TBitBtn;
    edNOMBRE: TEdit;
    ilID_PERSONA: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ilID_PERSONACapture(Sender: TObject;
      var Show: Boolean);
    procedure ilID_PERSONAEjecuta(Sender: TObject);
    procedure btID_PERSONAClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edID_PERSONAExit(Sender: TObject);
    procedure rgSIT_FID_DELEGADOExit(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrFidDele;
end; 
 TCrFidDele= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre : TParamCre;
        Persona : TPersona;

        ID_PERSONA               : TInterCampo;
        SIT_FID_DELEGADO         : TInterCampo;
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
//Uses RepMon;

{$R *.DFM}


constructor TCrFidDele.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_PERSONA :=CreaCampo('ID_PERSONA',ftFloat,tsNinguno,tsNinguno,True);
                ID_PERSONA.Caption:='Número de Persona';
      SIT_FID_DELEGADO :=CreaCampo('SIT_FID_DELEGADO',ftString,tsNinguno,tsNinguno,True);
                SIT_FID_DELEGADO.Caption:='Situación Fid Deleg';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      FKeyFields.Add('ID_PERSONA');

      With SIT_FID_DELEGADO do
        Begin
        Size:=3;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
        End;

      Persona := TPersona.Create(Self);
      Persona.MasterSource:=Self;
      Persona.FieldByName('ID_PERSONA').MasterField := 'ID_PERSONA';
      Persona.BuscaWhereString := ' CVE_PER_JURIDICA = ' + SQLStr('PF');
      Persona.FilterString := Persona.BuscaWhereString;

      TableName := 'CR_FID_DELEGADO';
      UseQuery := True;
      HelpFile := 'IntCrFidDele.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrFidDele.Destroy;
begin
 If Assigned(Persona) Then Persona.Free; 
 inherited;
end;

function TCrFidDele.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrFidDeleg;
begin
   W:=TWCrFidDeleg.Create(Self);
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


Function TCrFidDele.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrFiDe.it','F');
      Try if Active then begin T.Param(0,ID_PERSONA.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_FID_DELEGADO ********************)
(*                                                                              *)
(*  FORMA DE CR_FID_DELEG                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FID_DELEGADO ********************)

procedure TWCrFidDeleg.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
  
  ID_PERSONA.Control       := edID_PERSONA;
  SIT_FID_DELEGADO.Control := rgSIT_FID_DELEGADO;
  CVE_USU_ALTA.Control     := edCVE_USU_ALTA;
  F_ALTA.Control           := edF_ALTA;
  CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;
  F_MODIFICA.Control       := edF_MODIFICA;

  Persona.ID_PERSONA.Control := edID_PERSONA;
  Persona.Nombre.Control := edNOMBRE;

  Interforma1.MsgPanel := MsgPanel;
  End;
end;

procedure TWCrFidDeleg.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_PERSONA.Control       := Nil;
  SIT_FID_DELEGADO.Control := Nil;
  CVE_USU_ALTA.Control     := Nil;
  F_ALTA.Control           := Nil;
  CVE_USU_MODIFICA.Control := Nil;
  F_MODIFICA.Control       := Nil;

  Interforma1.MsgPanel := Nil;  
  End;
end;

procedure TWCrFidDeleg.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrFidDeleg.InterForma1DespuesNuevo(Sender: TObject);
begin If edID_PERSONA.CanFocus Then edID_PERSONA.SetFocus;
      Objeto.SIT_FID_DELEGADO.AsString := CSIT_AC;
end;

procedure TWCrFidDeleg.InterForma1DespuesModificar(Sender: TObject);
begin If rgSIT_FID_DELEGADO.CanFocus Then rgSIT_FID_DELEGADO.SetFocus;
end;

procedure TWCrFidDeleg.ilID_PERSONACapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrFidDeleg.ilID_PERSONAEjecuta(Sender: TObject);
begin
 With Objeto Do
  If Persona.FindKey([ilID_PERSONA.Buffer]) Then
   If rgSIT_FID_DELEGADO.CanFocus Then rgSIT_FID_DELEGADO.SetFocus;
end;

procedure TWCrFidDeleg.btID_PERSONAClick(Sender: TObject);
begin
 With Objeto Do
  If Persona.Busca Then
   If rgSIT_FID_DELEGADO.CanFocus Then rgSIT_FID_DELEGADO.SetFocus;
end;

procedure TWCrFidDeleg.InterForma1AntesAceptar(Sender: TObject;
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

procedure TWCrFidDeleg.edID_PERSONAExit(Sender: TObject);
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

procedure TWCrFidDeleg.rgSIT_FID_DELEGADOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_FID_DELEGADO, True, '',True);
end;

procedure TWCrFidDeleg.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
  Objeto.Active := False;
end;

procedure TWCrFidDeleg.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);

  function SePuedeEliminar : Boolean;
  var vlQry : TQuery;
      vlstrSQL, vlstrBuffer, vlstrComa : String;
  begin
   Result := False; vlstrBuffer := ''; vlstrComa := '';
   vlstrSQL := ' SELECT CFM.NUM_FOL_ADHESION'+coCRLF+
               ' FROM CR_FID_REL_DEL CFRD,'+coCRLF+
               '      CR_FID_MAESTRO CFM'+coCRLF+
               ' WHERE CFRD.ID_PERSONA = '+Objeto.ID_PERSONA.AsString+coCRLF+
               '   AND CFRD.SIT_FID_REL_DEL = '+SQLStr(CSIT_AC)+coCRLF+
               '   AND CFM.ID_FID_MAESTRO = CFRD.ID_FID_MAESTRO'+coCRLF+
               '   AND CFM.SIT_FID_MAESTRO = '+SQLStr(CSIT_AC)+coCRLF+
               ' GROUP BY NUM_FOL_ADHESION'+coCRLF
               ;
   vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
   If Not Assigned(vlQry) Then
    Result := True
   Else
    With vlQry Do
     Try
      vlQry.First;
      While Not vlQry.Eof Do
       Begin
       vlstrBuffer := vlstrBuffer + vlstrComa + '"' + FieldByName('NUM_FOL_ADHESION').AsString + '"';
       vlstrComa := ',';
       Next;
       End;
     Finally
       vlQry.Close;
       vlQry.Free;
       MessageDlg(' El Delegado Fiduciario, se encuentra vinculado con los siguiente(s) FIDEICOMISO(s): '+coCRLF+
                  coCRLF+
                  vlstrBuffer+coCRLF+coCRLF+
                  ' No se puede Eliminar.' , mtWarning, [mbOk], 0);
     End;

  end;

begin
  Realizado := SePuedeEliminar;
end;

end.
