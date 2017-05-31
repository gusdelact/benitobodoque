// Sistema         : Clase de CR_TIPO_RIESGO
// Fecha de Inicio : 01/06/2005
// Función forma   : Clase de CR_TIPO_RIESGO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrTRiesgo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntGenCre,
IntParamCre;

Type
 TCrTRiesgo= class; 

  TWCrTRiesgo=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_TIPO_RIESGO : TLabel; 
    edCVE_TIPO_RIESGO : TEdit;
    lbDESC_TIPO_RIESGO : TLabel; 
    edDESC_TIPO_RIESGO : TEdit;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    LBCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    rgSIT_TIPO_RIESGO: TRadioGroup;
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
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edCVE_TIPO_RIESGOExit(Sender: TObject);
    procedure edDESC_TIPO_RIESGOExit(Sender: TObject);
    procedure rgSIT_TIPO_RIESGOExit(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrTRiesgo;
end; 
 TCrTRiesgo= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre  : TParamCre;         
        CVE_TIPO_RIESGO          : TInterCampo;
        DESC_TIPO_RIESGO         : TInterCampo;
        SIT_TIPO_RIESGO          : TInterCampo;
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

constructor TCrTRiesgo.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_TIPO_RIESGO :=CreaCampo('CVE_TIPO_RIESGO',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_RIESGO.Caption:='Clave de Tipo Riesgo';
      DESC_TIPO_RIESGO :=CreaCampo('DESC_TIPO_RIESGO',ftString,tsNinguno,tsNinguno,True);
                DESC_TIPO_RIESGO.Caption:='Descripción Tipo Riesgo';
      SIT_TIPO_RIESGO :=CreaCampo('SIT_TIPO_RIESGO',ftString,tsNinguno,tsNinguno,True);
                SIT_TIPO_RIESGO.Caption:='Situación Tipo Riesgo';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      FKeyFields.Add('CVE_TIPO_RIESGO');

      With SIT_TIPO_RIESGO do
        Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
        End;

      TableName := 'CR_TIPO_RIESGO';
      UseQuery := True; 
      HelpFile := 'IntCrTRiesgo.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrTRiesgo.Destroy;
begin inherited;
end;

function TCrTRiesgo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTRiesgo;
begin
   W:=TWCrTRiesgo.Create(Self);
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


Function TCrTRiesgo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrTRies.it','S');
      Try if Active then begin T.Param(0,CVE_TIPO_RIESGO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_TIPO_RIESGO********************)
(*                                                                              *)
(*  FORMA DE CR_TIPO_RIESGO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_TIPO_RIESGO********************)

procedure TWCrTRiesgo.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  CVE_TIPO_RIESGO.Control     := edCVE_TIPO_RIESGO;
  DESC_TIPO_RIESGO.Control    := edDESC_TIPO_RIESGO;
  SIT_TIPO_RIESGO.Control     := rgSIT_TIPO_RIESGO;
  CVE_USU_ALTA.Control        := edCVE_USU_ALTA;
  F_ALTA.Control              := edF_ALTA;
  CVE_USU_MODIFICA.Control    := edCVE_USU_MODIFICA;
  F_MODIFICA.Control          := edF_MODIFICA;

  Interforma1.MsgPanel := MsgPanel;
  End;
end;

procedure TWCrTRiesgo.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  CVE_TIPO_RIESGO.Control     := Nil;
  DESC_TIPO_RIESGO.Control    := Nil;
  SIT_TIPO_RIESGO.Control     := Nil;
  CVE_USU_ALTA.Control        := Nil;
  F_ALTA.Control              := Nil;
  CVE_USU_MODIFICA.Control    := Nil;
  F_MODIFICA.Control          := Nil;

  Interforma1.MsgPanel := MsgPanel;
  End;
end;

procedure TWCrTRiesgo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrTRiesgo.InterForma1DespuesNuevo(Sender: TObject);
begin If edCVE_TIPO_RIESGO.CanFocus Then edCVE_TIPO_RIESGO.SetFocus;
      Objeto.SIT_TIPO_RIESGO.AsString := CSIT_AC;
end;

procedure TWCrTRiesgo.InterForma1DespuesModificar(Sender: TObject);
begin If edDESC_TIPO_RIESGO.CanFocus Then edDESC_TIPO_RIESGO.SetFocus;
end;

procedure TWCrTRiesgo.InterForma1AntesAceptar(Sender: TObject;
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
       F_ALTA.AsDateTime      := Apli.DameFechaEmpresa;
       CVE_USU_ALTA.AsString  := Apli.Usuario;
       End
      Else
       Begin
       F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresa;
       CVE_USU_MODIFICA.AsString := Apli.Usuario;
       End;
     End;
 Realizado  := mrResult = mrYes;
end;

procedure TWCrTRiesgo.edCVE_TIPO_RIESGOExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   CVE_TIPO_RIESGO.GetFromControl;
   If (Trim(CVE_TIPO_RIESGO.AsString) = '') Then vlstrMsg := 'Favor de indicar la '+lbCVE_TIPO_RIESGO.Caption;
   InterForma1.ValidaExit(edCVE_TIPO_RIESGO, (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrTRiesgo.edDESC_TIPO_RIESGOExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   DESC_TIPO_RIESGO.GetFromControl;
   If (Trim(DESC_TIPO_RIESGO.AsString) = '') Then vlstrMsg := 'Favor de indicar el '+lbDESC_TIPO_RIESGO.Caption;
   InterForma1.ValidaExit(edDESC_TIPO_RIESGO, (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrTRiesgo.rgSIT_TIPO_RIESGOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_TIPO_RIESGO, True, '',True);
end;

end.
