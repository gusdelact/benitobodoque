// Sistema         : Clase de CR_CAL_CAPITALIZ
// Fecha de Inicio : 13/06/2005
// Función forma   : Clase de CR_CAL_CAPITALIZ
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrCalCapi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,

IntGenCre,
IntSICC,
IntParamCre
;

Type
 TCrCalCapi= class; 

  TWCrCalCapitaliz=Class(TForm)
    InterForma1             : TInterForma; 
    chB_REG_DEUDA : TCheckBox;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    LBCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    rgSIT_CAL_CAPITALIT: TRadioGroup;
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
    GroupBox1: TGroupBox;
    lbPCT_PONDERA: TLabel;
    edPCT_PONDERA: TInterEdit;
    lbPCT_CAPITALIZA: TLabel;
    edPCT_CAPITALIZA: TInterEdit;
    GroupBox2: TGroupBox;
    lbNUM_MIN_CALIFIC: TLabel;
    lbNUM_MIN_NIVEL: TLabel;
    lbNUM_MAX_NIVEL: TLabel;
    edNUM_MIN_CALIFIC: TInterEdit;
    edNUM_MAX_NIVEL: TInterEdit;
    edNUM_MIN_NIVEL: TInterEdit;
    lbCVE_REGLA: TLabel;
    edCVE_REGLA: TEdit;
    lbPCT_REQUERIDO: TLabel;
    edPCT_REQUERIDO: TInterEdit;
    lbPCT_CAPITALIZA1: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure chB_REG_DEUDAExit(Sender: TObject);
    procedure edNUM_MIN_CALIFICExit(Sender: TObject);
    procedure edPCT_PONDERAExit(Sender: TObject);
    procedure rgSIT_CAL_CAPITALITExit(Sender: TObject);
    procedure edCVE_REGLAExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrCalCapi;
end; 
 TCrCalCapi= class(TInterFrame) 
      private 
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre : TParamCre;
        CVE_REGLA                : TInterCampo;
        B_REG_DEUDA              : TInterCampo;
        NUM_MIN_CALIFIC          : TInterCampo;
        NUM_MIN_NIVEL            : TInterCampo;
        NUM_MAX_NIVEL            : TInterCampo;
        PCT_PONDERA              : TInterCampo;
        PCT_REQUERIDO            : TInterCampo;
        SIT_CAL_CAPITALI         : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;
        PCT_CAPITALIZA           : TInterCampo;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


implementation
{$R *.DFM}


constructor TCrCalCapi.Create( AOwner : TComponent );
begin Inherited;
      CVE_REGLA :=CreaCampo('CVE_REGLA',ftString,tsNinguno,tsNinguno,True);
                CVE_REGLA.Caption:='Clave de regla';
      B_REG_DEUDA :=CreaCampo('B_REG_DEUDA',ftString,tsNinguno,tsNinguno,True);
                B_REG_DEUDA.Caption:='Reg Deuda';
      NUM_MIN_CALIFIC :=CreaCampo('NUM_MIN_CALIFIC',ftFloat,tsNinguno,tsNinguno,True);
                NUM_MIN_CALIFIC.Caption:='Número Min Calific';
      NUM_MIN_NIVEL :=CreaCampo('NUM_MIN_NIVEL',ftFloat,tsNinguno,tsNinguno,True);
                NUM_MIN_NIVEL.Caption:='Número Min Nivel';
      NUM_MAX_NIVEL :=CreaCampo('NUM_MAX_NIVEL',ftFloat,tsNinguno,tsNinguno,True);
                NUM_MAX_NIVEL.Caption:='Número Max Nivel';
      PCT_PONDERA :=CreaCampo('PCT_PONDERA',ftFloat,tsNinguno,tsNinguno,True);
                PCT_PONDERA.Caption:='Pct Pondera';
      PCT_REQUERIDO :=CreaCampo('PCT_REQUERIDO',ftFloat,tsNinguno,tsNinguno,True);
                PCT_REQUERIDO.Caption:='Pct Requerimiento';
      SIT_CAL_CAPITALI := CreaCampo('SIT_CAL_CAPITALI',ftString,tsNinguno,tsNinguno,True);
                SIT_CAL_CAPITALI.Caption:='Situación';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      FKeyFields.Add('CVE_REGLA');
      FKeyFields.Add('B_REG_DEUDA');
      FKeyFields.Add('NUM_MIN_CALIFIC');
      FKeyFields.Add('NUM_MIN_NIVEL');
      FKeyFields.Add('NUM_MAX_NIVEL');

      PCT_CAPITALIZA :=CreaCampo('PCT_CAPITALIZA',ftFloat,tsNinguno,tsNinguno,False);
                PCT_CAPITALIZA.Caption:='Pct Capitaliza';

      With SIT_CAL_CAPITALI do
        Begin
        Size:=3;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
        End;

      TableName := 'ADMIPROD.CR_CAL_CAPITALIZ';
      UseQuery := True;
      HelpFile := 'IntCrCalCapi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCalCapi.Destroy;
begin inherited;
end;

function TCrCalCapi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCalCapitaliz;
begin
   W:=TWCrCalCapitaliz.Create(Self);
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

Function TCrCalCapi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrPaCa.it','S,S,F,F,F');
      Try if Active then begin T.Param(0,CVE_REGLA.AsString);
                               T.Param(1,B_REG_DEUDA.AsString);
                               T.Param(2,NUM_MIN_CALIFIC.AsString);
                               T.Param(3,NUM_MIN_NIVEL.AsString);
                               T.Param(4,NUM_MAX_NIVEL.AsString);
                               end;
          if T.Execute then
           InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3),T.DameCampo(4)]);
      finally
       PCT_CAPITALIZA.AsFloat := PCT_PONDERA.AsFloat * PCT_REQUERIDO.AsFloat / 100;
       T.Free;
      end;
end;

(***********************************************FORMA CR_CAL_CAPITALIZ********************)
(*                                                                              *)
(*  FORMA DE CR_CAL_CAPITALIZ                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CAL_CAPITALIZ********************)

procedure TWCrCalCapitaliz.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  CVE_REGLA.Control          := edCVE_REGLA;
  B_REG_DEUDA.Control        := chB_REG_DEUDA;
  NUM_MIN_CALIFIC.Control    := edNUM_MIN_CALIFIC;
  NUM_MIN_NIVEL.Control      := edNUM_MIN_NIVEL;
  NUM_MAX_NIVEL.Control      := edNUM_MAX_NIVEL;
  PCT_PONDERA.Control        := edPCT_PONDERA;
  PCT_REQUERIDO.Control      := edPCT_REQUERIDO;
  SIT_CAL_CAPITALI.Control   := rgSIT_CAL_CAPITALIT;
  CVE_USU_ALTA.Control       := edCVE_USU_ALTA;
  F_ALTA.Control             := edF_ALTA;
  CVE_USU_MODIFICA.Control   := edCVE_USU_MODIFICA;
  F_MODIFICA.Control         := edF_MODIFICA;
  PCT_CAPITALIZA.Control     := edPCT_CAPITALIZA;  

  Interforma1.MsgPanel := MsgPanel;
  End;
end;

procedure TWCrCalCapitaliz.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  CVE_REGLA.Control          := Nil;
  B_REG_DEUDA.Control        := Nil;
  NUM_MIN_CALIFIC.Control    := Nil;
  NUM_MIN_NIVEL.Control      := Nil;
  NUM_MAX_NIVEL.Control      := Nil;
  PCT_PONDERA.Control        := Nil;
  PCT_REQUERIDO.Control      := Nil;
  SIT_CAL_CAPITALI.Control   := Nil;
  CVE_USU_ALTA.Control       := Nil;
  F_ALTA.Control             := Nil;
  CVE_USU_MODIFICA.Control   := Nil;
  F_MODIFICA.Control         := Nil;
  PCT_CAPITALIZA.Control     := Nil;  

  Interforma1.MsgPanel := Nil;
  End;
end;

procedure TWCrCalCapitaliz.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCalCapitaliz.InterForma1DespuesNuevo(Sender: TObject);
begin If edCVE_REGLA.CanFocus Then edCVE_REGLA.SetFocus;
      Objeto.SIT_CAL_CAPITALI.AsString := CSIT_AC;
end;

procedure TWCrCalCapitaliz.InterForma1DespuesModificar(Sender: TObject);
begin If edPCT_PONDERA.CanFocus Then edPCT_PONDERA.SetFocus;
end;

procedure TWCrCalCapitaliz.edCVE_REGLAExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edCVE_REGLA.Text) = '') Then vlstrMsg := 'Favor de indicar la '+lbCVE_REGLA.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrCalCapitaliz.chB_REG_DEUDAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_REG_DEUDA, True, '',True);
end;

procedure TWCrCalCapitaliz.edNUM_MIN_CALIFICExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edNUM_MIN_CALIFIC.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbNUM_MIN_CALIFIC.Caption
   Else If (Trim(edNUM_MIN_NIVEL.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbNUM_MIN_NIVEL.Caption
   Else If (Trim(edNUM_MAX_NIVEL.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbNUM_MAX_NIVEL.Caption
   Else If (StrToInt(edNUM_MAX_NIVEL.Text) < StrToInt(edNUM_MIN_NIVEL.Text)) Then vlstrMsg := 'El '+lbNUM_MAX_NIVEL.Caption + ' no puede ser < al '+lbNUM_MIN_NIVEL.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrCalCapitaliz.edPCT_PONDERAExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   PCT_PONDERA.GetFromControl;
   PCT_REQUERIDO.GetFromControl;
   If (Trim(PCT_PONDERA.AsString) = '') Then vlstrMsg := 'Favor de indicar el '+lbPCT_PONDERA.Caption
   Else If (Trim(PCT_REQUERIDO.AsString) = '') Then vlstrMsg := 'Favor de indicar el '+lbPCT_REQUERIDO.Caption;
   // Calcula el Porcentaje de Capitalización
   PCT_CAPITALIZA.AsFloat := PCT_PONDERA.AsFloat * PCT_REQUERIDO.AsFloat / 100;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrCalCapitaliz.rgSIT_CAL_CAPITALITExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_CAL_CAPITALIT, True, '',True);
end;

procedure TWCrCalCapitaliz.InterForma1AntesAceptar(Sender: TObject;
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

end.
