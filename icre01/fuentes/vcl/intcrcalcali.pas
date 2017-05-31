// Sistema         : Clase de CR_CAL_CALIFICA
// Fecha de Inicio : 24/05/2005
// Función forma   : Clase de CR_CAL_CALIFICA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrCalCali;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit,

IntGenCre,
IntSICC,
IntParamCre,
IntCrCalific, // Catálogo de Calificadoras
IntCrTRiesgo  // Catálogo Tipo de Riesgo
;

Type
 TCrCalCali= class;

  TWCrCalCalifica=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CALIFICADORA : TLabel; 
    edID_CALIFICADORA : TEdit;
    lbCVE_TIPO_RIESGO: TLabel;
    edCVE_TIPO_RIESGO: TEdit;
    lbCVE_CALIFICACION : TLabel; 
    edCVE_CALIFICACION : TEdit;
    lbNUM_PUNTOS_DIST : TLabel;
    lbNUM_NIVEL: TLabel;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    LBCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    MsgPanel: TPanel;
    rgSIT_CAL_CALIFICA: TRadioGroup;
    btID_CALIFICADORA: TBitBtn;
    edNOM_CALIFICADORA: TEdit;
    Label1: TLabel;
    edNUM_PUNTOS_DIST: TInterEdit;
    ilID_CALIFICADORA: TInterLinkit;
    btCVE_TIPO_RIESGO: TBitBtn;
    edDESC_TIPO_RIESGO: TEdit;
    ilCVE_TIPO_RIESGO: TInterLinkit;
    edNUM_NIVEL: TInterEdit;
    lbCVE_TIPO_ESCALA: TLabel;
    lbCVE_PONDERACION: TLabel;
    lbCVE_ORDENACION: TLabel;
    edCVE_TIPO_ESCALA: TInterEdit;
    edCVE_PONDERACION: TInterEdit;
    edCVE_ORDENACION: TInterEdit;
    Ver: TButton;
    Imprimir: TButton;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure edID_CALIFICADORAExit(Sender: TObject);
    procedure btID_CALIFICADORAClick(Sender: TObject);
    procedure ilID_CALIFICADORACapture(Sender: TObject; var Show: Boolean);
    procedure ilID_CALIFICADORAEjecuta(Sender: TObject);
    procedure rgSIT_CAL_CALIFICAExit(Sender: TObject);
    procedure edCVE_CALIFICACIONExit(Sender: TObject);
    procedure edCVE_TIPO_RIESGOExit(Sender: TObject);
    procedure ilCVE_TIPO_RIESGOEjecuta(Sender: TObject);
    procedure btCVE_TIPO_RIESGOClick(Sender: TObject);
    procedure VerClick(Sender: TObject);
    procedure ImprimirClick(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrCalCali;
end; 
 TCrCalCali= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre : TParamCre; 
        ID_CALIFICADORA          : TInterCampo;
        CVE_TIPO_RIESGO          : TInterCampo;
        CVE_CALIFICACION         : TInterCampo;
        NUM_PUNTOS_DIST          : TInterCampo;
        NUM_NIVEL                : TInterCampo;
        SIT_CAL_CALIFICA         : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_TIPO_ESCALA          : TInterCampo;
        CVE_PONDERACION          : TInterCampo;
        CVE_ORDENACION           : TInterCampo;

        Calificadora : TCrCalific;  // Calificadora
        TipoRiesgo : TCrTRiesgo;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published 
      end;

implementation
Uses IntQrCrCalCali;

{$R *.DFM}

constructor TCrCalCali.Create( AOwner : TComponent );
begin Inherited;
      ID_CALIFICADORA :=CreaCampo('ID_CALIFICADORA',ftFloat,tsNinguno,tsNinguno,True);
                ID_CALIFICADORA.Caption:='Número de Calificadora';
      CVE_TIPO_RIESGO :=CreaCampo('CVE_TIPO_RIESGO',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_RIESGO.Caption:='Clave de Cal Riesgo';
      CVE_CALIFICACION :=CreaCampo('CVE_CALIFICACION',ftString,tsNinguno,tsNinguno,True);
                CVE_CALIFICACION.Caption:='Clave de Calificacion';
      NUM_PUNTOS_DIST :=CreaCampo('NUM_PUNTOS_DIST',ftFloat,tsNinguno,tsNinguno,True);
                NUM_PUNTOS_DIST.Caption:='Número Puntos Dist';
      NUM_NIVEL :=CreaCampo('NUM_NIVEL',ftInteger,tsNinguno,tsNinguno,True);
                NUM_NIVEL.Caption:='Nivel';
      SIT_CAL_CALIFICA :=CreaCampo('SIT_CAL_CALIFICA',ftString,tsNinguno,tsNinguno,True);
                SIT_CAL_CALIFICA.Caption:='Situación Cal Califica';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_TIPO_ESCALA :=CreaCampo('CVE_TIPO_ESCALA',ftInteger,tsNinguno,tsNinguno,True);
                CVE_TIPO_ESCALA.Caption:='Clave de Tipo de Escala';
      CVE_PONDERACION :=CreaCampo('CVE_PONDERACION',ftInteger,tsNinguno,tsNinguno,True);
                CVE_PONDERACION.Caption:='Clave de Ponderación';
      CVE_ORDENACION :=CreaCampo('CVE_ORDENACION',ftInteger,tsNinguno,tsNinguno,True);
                CVE_ORDENACION.Caption:='Clave de Ordenación';

      FKeyFields.Add('ID_CALIFICADORA');
      FKeyFields.Add('CVE_TIPO_RIESGO');
      FKeyFields.Add('CVE_CALIFICACION');

      With SIT_CAL_CALIFICA do
        Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
        End;

      Calificadora := TCrCalific.Create(Self);
      Calificadora.MasterSource:=Self;
      Calificadora.FieldByName('ID_CALIFICADORA').MasterField:='ID_CALIFICADORA';
      Calificadora.ShowAll := True;

      TipoRiesgo := TCrTRiesgo.Create(Self);
      TipoRiesgo.MasterSource:=Self;
      TipoRiesgo.FieldByName('CVE_TIPO_RIESGO').MasterField:='CVE_TIPO_RIESGO';
      TipoRiesgo.ShowAll := True;

      TableName := 'CR_CAL_CALIFICA';
      UseQuery := True;
      HelpFile := 'IntCrCalCali.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCalCali.Destroy;
begin
  If Assigned(Calificadora) Then Calificadora.Free;
  If Assigned(TipoRiesgo)   Then TipoRiesgo.Free;
  inherited;
end;

function TCrCalCali.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCalCalifica;
begin
   W:=TWCrCalCalifica.Create(Self);
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

Function TCrCalCali.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCaCa.it','F,S,S');
      Try if Active then begin T.Param(0,ID_CALIFICADORA.AsString); 
                               T.Param(1,CVE_TIPO_RIESGO.AsString); 
                               T.Param(2,CVE_CALIFICACION.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_CAL_CALIFICA********************)
(*                                                                              *)
(*  FORMA DE CR_CAL_CALIFICA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CAL_CALIFICA********************)

procedure TWCrCalCalifica.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  ID_CALIFICADORA.Control   := edID_CALIFICADORA;
  CVE_TIPO_RIESGO.Control   := edCVE_TIPO_RIESGO;
  CVE_CALIFICACION.Control  := edCVE_CALIFICACION;
  NUM_PUNTOS_DIST.Control   := edNUM_PUNTOS_DIST;
  NUM_NIVEL.Control         := edNUM_NIVEL;
  SIT_CAL_CALIFICA.Control  := rgSIT_CAL_CALIFICA;
  CVE_USU_ALTA.Control      := edCVE_USU_ALTA;
  F_ALTA.Control            := edF_ALTA;
  CVE_USU_MODIFICA.Control  := edCVE_USU_MODIFICA;
  F_MODIFICA.Control        := edF_MODIFICA;
  CVE_TIPO_ESCALA.control   := edCVE_TIPO_ESCALA;
  CVE_PONDERACION.control   := edCVE_PONDERACION;
  CVE_ORDENACION.control    := edCVE_ORDENACION;

  Calificadora.ID_CALIFICADORA.Control := edID_CALIFICADORA;
  Calificadora.Persona.NOMBRE.Control  := edNOM_CALIFICADORA;

  TipoRiesgo.CVE_TIPO_RIESGO.Control   := edCVE_TIPO_RIESGO;
  TipoRiesgo.DESC_TIPO_RIESGO.Control  := edDESC_TIPO_RIESGO;

  Interforma1.MsgPanel := MsgPanel;
  End;
end;

procedure TWCrCalCalifica.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_CALIFICADORA.Control   := Nil;
  CVE_TIPO_RIESGO.Control   := Nil;
  CVE_CALIFICACION.Control  := Nil;
  NUM_PUNTOS_DIST.Control   := Nil;
  NUM_NIVEL.Control         := Nil;
  SIT_CAL_CALIFICA.Control  := Nil;
  CVE_USU_ALTA.Control      := Nil;
  F_ALTA.Control            := Nil;
  CVE_USU_MODIFICA.Control  := Nil;
  F_MODIFICA.Control        := Nil;
  CVE_TIPO_ESCALA.control   := Nil;
  CVE_PONDERACION.control   := Nil;
  CVE_ORDENACION.control    := Nil;

  Calificadora.ID_Calificadora.Control := Nil;
  Calificadora.Persona.NOMBRE.Control  := Nil;

  TipoRiesgo.CVE_TIPO_RIESGO.Control  := Nil;
  TipoRiesgo.DESC_TIPO_RIESGO.Control := Nil;

  Interforma1.MsgPanel := Nil;
  End;
end;

procedure TWCrCalCalifica.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCalCalifica.InterForma1DespuesNuevo(Sender: TObject);
begin If edID_CALIFICADORA.CanFocus Then edID_CALIFICADORA.SetFocus;
      Objeto.SIT_CAL_CALIFICA.AsString  := CSIT_AC;
end;

procedure TWCrCalCalifica.InterForma1DespuesModificar(Sender: TObject);
begin If edNUM_PUNTOS_DIST.CanFocus Then edNUM_PUNTOS_DIST.SetFocus;
end;

procedure TWCrCalCalifica.InterForma1AntesAceptar(Sender: TObject;
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
 Realizado  := mrResult = mrYes;
end;

procedure TWCrCalCalifica.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
  Objeto.Active := False;
end;

procedure TWCrCalCalifica.edID_CALIFICADORAExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   ID_CALIFICADORA.GetFromControl;
   If (Trim(edID_CALIFICADORA.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbID_CALIFICADORA.Caption;
   InterForma1.ValidaExit(edID_CALIFICADORA, (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrCalCalifica.btID_CALIFICADORAClick(Sender: TObject);
begin
 Objeto.Calificadora.Busca;
end;

procedure TWCrCalCalifica.btCVE_TIPO_RIESGOClick(Sender: TObject);
begin
 Objeto.TipoRiesgo.Busca;
end;

procedure TWCrCalCalifica.ilID_CALIFICADORACapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrCalCalifica.ilID_CALIFICADORAEjecuta(Sender: TObject);
begin
 Objeto.Calificadora.FindKey([ilID_CALIFICADORA.Buffer]);
end;

procedure TWCrCalCalifica.ilCVE_TIPO_RIESGOEjecuta(Sender: TObject);
begin
 Objeto.TipoRiesgo.FindKey([ilCVE_TIPO_RIESGO.Buffer]);
end;

procedure TWCrCalCalifica.rgSIT_CAL_CALIFICAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(rgSIT_CAL_CALIFICA, True, '',True);
end;

procedure TWCrCalCalifica.edCVE_TIPO_RIESGOExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   CVE_TIPO_RIESGO.GetFromControl;
   If (Trim(CVE_TIPO_RIESGO.AsString) = '') Then vlstrMsg := 'Favor de indicar el '+lbCVE_TIPO_RIESGO.Caption;
   InterForma1.ValidaExit(edCVE_TIPO_RIESGO, (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrCalCalifica.edCVE_CALIFICACIONExit(Sender: TObject);
var vlstrMsg, vlstrMsg1 : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   // Lee valor del Control
   CVE_CALIFICACION.GetFromControl;
   NUM_PUNTOS_DIST.GetFromControl;
   NUM_NIVEL.GetFromControl;
   // Válida que no se encuentren vacíos
   vlstrMsg1 := 'Favor de indicar ';
   If (Trim(edCVE_CALIFICACION.Text) = '') Then vlstrMsg := vlstrMsg1 + lbCVE_CALIFICACION.Caption
   Else If (Trim(edNUM_PUNTOS_DIST.Text)  = '') Then vlstrMsg := vlstrMsg1 + lbNUM_PUNTOS_DIST.Caption
   Else If (Trim(edNUM_NIVEL.Text) = '') Then vlstrMsg := vlstrMsg1 + lbNUM_NIVEL.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrCalCalifica.VerClick(Sender: TObject);

begin
      RepCalificadoras( Objeto.Apli, True);
end;

procedure TWCrCalCalifica.ImprimirClick(Sender: TObject);
begin
      RepCalificadoras( Objeto.Apli, False);
end;

end.
