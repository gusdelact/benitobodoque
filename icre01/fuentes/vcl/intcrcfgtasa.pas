// Sistema         : Clase de CR_TASA_CONFIG
// Fecha de Inicio : 03/05/2004
// Función forma   : Clase de CR_TASA_CONFIG
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
// Intercase JMH - se agregan cuatro capos nuevos
Unit IntCrCfgTasa;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

//CLASES ADICIONALES
IntParamCre,  // Parámetros de Crédito
IntGenCre,    // Unidad Genérica de Créditos
IntTasIndFin, // Catálogo de Tasas
IntCrTasGru, InterEdit   // Configura Tasas de Grupo
;

const
    C_OPERACION : Array [0..5] Of String = (C_MENOR, C_MAYOR, C_PROMEDIO, C_INICIAL,
                                            C_FINAL, C_EQUIV);
    C_OPERADOR : Array [0..4] Of String  = ('',C_SUMAR, C_RESTAR, C_MULTPLICAR, C_DIVIDIR);
    C_PERIODO : Array [0..2] Of String   = (C_DIA, C_SEMANA, C_MES);
    C_TASA : Array [0..2] Of String   = (C_PUBLICADAS, C_VIGENTES, C_PUBLICADAS_Y_VIGENTES);
    C_SITUACION : Array [0..1] Of String = (CSIT_AC, CSIT_IN);


Type
 TCrCfgTasa= class;

  TWCrCfgTasa=Class(TForm)
    InterForma1             : TInterForma;
    lblCVE_TASA_INDICAD: TLabel;
    lblCVE_TASA_BASE: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    rgCVE_VALOR_TASA: TRadioGroup;
    gbIntegracion: TGroupBox;
    chbxB_DIA_NATURAL: TCheckBox;
    chbxB_ULTIMO_CICLO: TCheckBox;
    edNUM_PLAZO_PER: TEdit;
    cbCVE_PERIODO: TComboBox;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edCVE_TASA_INDICAD: TEdit;
    btnCVE_TASA_INDICAD: TBitBtn;
    edDESC_TASA_INDICAD: TEdit;
    gbPtosAdic: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    cbOperador: TComboBox;
    edSOBRETASA: TEdit;
    edCVE_TASA_BASE: TEdit;
    btnCVE_TASA_BASE: TBitBtn;
    edDESC_TASA_BASE: TEdit;
    rgCVE_OPERACION: TRadioGroup;
    rgSIT_CFG_TASA: TRadioGroup;
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    btnConfiguraTasasMultiples: TBitBtn;
    MsgPanel: TPanel;
    ilCVE_TASA_BASE: TInterLinkit;
    ilCVE_TASA_INDICAD: TInterLinkit;
    gbxParamCapit: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    ied_Plazo_Inst_Equiv: TInterEdit;
    ied_Num_Dias_Equiv: TInterEdit;
    stpCalculaTasa: TStoredProc;
    gbValorTasa: TGroupBox;
    lblValorTasa: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure ilCVE_TASA_INDICADCapture(Sender: TObject;
      var Show: Boolean);
    procedure ilCVE_TASA_INDICADEjecuta(Sender: TObject);
    procedure ilCVE_TASA_BASEEjecuta(Sender: TObject);
    procedure btnCVE_TASA_INDICADClick(Sender: TObject);
    procedure btnCVE_TASA_BASEClick(Sender: TObject);
    procedure edCVE_TASA_INDICADExit(Sender: TObject);
    procedure edCVE_TASA_BASEExit(Sender: TObject);
    procedure edSOBRETASAExit(Sender: TObject);
    procedure edSOBRETASAKeyPress(Sender: TObject; var Key: Char);
    procedure cbCVE_PERIODOChange(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure btnConfiguraTasasMultiplesClick(Sender: TObject);
    procedure edNUM_PLAZO_PERExit(Sender: TObject);
    procedure cbCVE_PERIODOExit(Sender: TObject);
    procedure rgCVE_OPERACIONExit(Sender: TObject);
    procedure rgCVE_VALOR_TASAExit(Sender: TObject);
    procedure rgSIT_CFG_TASAExit(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure ied_Plazo_Inst_EquivExit(Sender: TObject);
    procedure ied_Num_Dias_EquivExit(Sender: TObject);
    procedure rgCVE_OPERACIONClick(Sender: TObject);
    private
    { Private declarations }

      function Get_Tipo_Operacion : String;
      function Get_Tipo_Periodo : String;
      function Get_Tipo_Tasa : String;
      function Get_Tipo_Operador : String;
      function Get_Situacion : String;

      procedure Set_Tipo_Operacion(pstrValue : String);
      procedure Set_Tipo_Periodo(pstrValue : String);
      procedure Set_Tipo_Tasa(pstrValue : String);
      procedure Set_Tipo_Operador(pstrValue : String);
      procedure Set_Situacion(pstrValue : String);

      function Encuentra_Posicion(pstrBusca : String; pArreglo : Array Of String) : Integer;
      procedure HabilitaOpciones;
      procedure HabilitaTasasMultiples;
      procedure ObtenValorTasa;
    public
    { Public declarations }
    Objeto : TCrCfgTasa;

    property Tipo_Operacion : String Read Get_Tipo_Operacion Write Set_Tipo_Operacion;
    property Tipo_Periodo : String Read Get_Tipo_Periodo Write Set_Tipo_Periodo;
    property Tipo_Tasa : String Read Get_Tipo_Tasa Write Set_Tipo_Tasa;
    property Tipo_Operador : String Read Get_Tipo_Operador Write Set_Tipo_Operador;
    property Situacion : String Read Get_Situacion Write Set_Situacion;
end;
 TCrCfgTasa= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_TASA_INDICAD         : TInterCampo;
        CVE_TASA_BASE            : TInterCampo;
        CVE_OPERACION            : TInterCampo;
        NUM_PLAZO_PER            : TInterCampo;
        CVE_PERIODO              : TInterCampo;
        B_ULTIMO_CICLO           : TInterCampo;
        B_DIA_NATURAL            : TInterCampo;
        CVE_VALOR_TASA           : TInterCampo;
        OPERADOR_S_TASA          : TInterCampo;
        SOBRETASA                : TInterCampo;
        SIT_CFG_TASA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        PLAZO_INST_EQUIV         : TInterCampo;
        NUM_DIAS_EQUIV           : TInterCampo;

        ParamCre         : TParamCre;
        Tasa             : TTasIndFin;
        TasaBase         : TTasIndFin;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrCfgTasa.Create( AOwner : TComponent );
begin Inherited;
      CVE_TASA_INDICAD :=CreaCampo('CVE_TASA_INDICAD',ftString,tsNinguno,tsNinguno,True);
                CVE_TASA_INDICAD.Caption:='Clave de Tasa Indicad';
      CVE_TASA_BASE :=CreaCampo('CVE_TASA_BASE',ftString,tsNinguno,tsNinguno,True);
                CVE_TASA_BASE.Caption:='Clave de Tasa Base';
      CVE_OPERACION :=CreaCampo('CVE_OPERACION',ftString,tsNinguno,tsNinguno,True);
                CVE_OPERACION.Caption:='Clave de Operacion';
      NUM_PLAZO_PER :=CreaCampo('NUM_PLAZO_PER',ftFloat,tsNinguno,tsNinguno,True);
                NUM_PLAZO_PER.Caption:='Número Plazo Per';
      CVE_PERIODO :=CreaCampo('CVE_PERIODO',ftString,tsNinguno,tsNinguno,True);
                CVE_PERIODO.Caption:='Clave de Periodo';
      B_ULTIMO_CICLO :=CreaCampo('B_ULTIMO_CICLO',ftString,tsNinguno,tsNinguno,True);
                B_ULTIMO_CICLO.Caption:='Ultimo ciclo completo';
      B_DIA_NATURAL :=CreaCampo('B_DIA_NATURAL',ftString,tsNinguno,tsNinguno,True);
                B_DIA_NATURAL.Caption:='Dia Natural';
      CVE_VALOR_TASA :=CreaCampo('CVE_VALOR_TASA',ftString,tsNinguno,tsNinguno,True);
                CVE_VALOR_TASA.Caption:='Clave de Valor Tasa';
      OPERADOR_S_TASA :=CreaCampo('OPERADOR_S_TASA',ftString,tsNinguno,tsNinguno,True);
                OPERADOR_S_TASA.Caption:='Operador S Tasa';
      SOBRETASA :=CreaCampo('SOBRETASA',ftFloat,tsNinguno,tsNinguno,True);
                SOBRETASA.Caption:='Sobretasa';
                SOBRETASA.Size:= 9;
      SIT_CFG_TASA :=CreaCampo('SIT_CFG_TASA',ftString,tsNinguno,tsNinguno,True);
                SIT_CFG_TASA.Caption:='Situación Cfg Tasa';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';

      PLAZO_INST_EQUIV :=CreaCampo('PLAZO_INST_EQUIV',ftInteger,tsNinguno,tsNinguno,True);
                PLAZO_INST_EQUIV.Caption:='Plazo del Instrumento';
      NUM_DIAS_EQUIV :=CreaCampo('Num_Dias_Equiv',ftInteger,tsNinguno,tsNinguno,True);
                NUM_DIAS_EQUIV.Caption:='Periodo de cálculo';

      FKeyFields.Add('CVE_TASA_INDICAD');
      FKeyFields.Add('CVE_TASA_BASE');

      Tasa := TTasIndFin.Create(Self);
      Tasa.MasterSource:=Self;
      Tasa.FieldByName('CVE_TASA_INDICAD').MasterField := 'CVE_TASA_INDICAD';
      Tasa.BuscaWhereString := 'TASA_INDIC_FINAN.SIT_TASA_INDIC = '+SQLStr('AC');
      Tasa.FilterString := Tasa.BuscaWhereString;

      TasaBase := TTasIndFin.Create(Self);
      TasaBase.MasterSource:=Self;
      TasaBase.FieldByName('CVE_TASA_INDICAD').MasterField := 'CVE_TASA_BASE';
      TasaBase.BuscaWhereString := 'TASA_INDIC_FINAN.SIT_TASA_INDIC = '+SQLStr('AC');
      TasaBase.FilterString := TasaBase.BuscaWhereString;

      TableName := 'CR_TASA_CONFIG';
      UseQuery := True;
      HelpFile := 'IntCrCfgTasa.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCfgTasa.Destroy;
begin
 If Assigned(Tasa) Then Tasa.Free;
 If Assigned(TasaBase) Then TasaBase.Free;
 Inherited;
end;

function TCrCfgTasa.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCfgTasa;
begin
   W:=TWCrCfgTasa.Create(Self);
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


Function TCrCfgTasa.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCfgTasa.it','S,S');
      Try if Active then begin T.Param(0,CVE_TASA_INDICAD.AsString);
                               T.Param(1,CVE_TASA_BASE.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_TASA_CONFIG********************)
(*                                                                              *)
(*  FORMA DE CR_TASA_CONFIG                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_TASA_CONFIG********************)

procedure TWCrCfgTasa.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

//  Tasa.CVE_TASA_INDICAD.Control := edCVE_TASA_INDICAD;
  Tasa.DESC_TASA_INDIC.Control := edDESC_TASA_INDICAD;

//  TasaBase.CVE_TASA_INDICAD.Control := edCVE_TASA_BASE;
  TasaBase.DESC_TASA_INDIC.Control  := edDESC_TASA_BASE;

  CVE_TASA_INDICAD.Control := edCVE_TASA_INDICAD;
  CVE_TASA_BASE.Control    := edCVE_TASA_BASE;
  NUM_PLAZO_PER.Control    := edNUM_PLAZO_PER;
  SOBRETASA.Control        := edSOBRETASA;
  B_ULTIMO_CICLO.Control   := chbxB_ULTIMO_CICLO;
  B_DIA_NATURAL.Control    := chbxB_DIA_NATURAL;
  F_ALTA.Control           := edF_ALTA;
  CVE_USU_ALTA.Control     := edCVE_USU_ALTA;
  F_MODIFICA.Control       := edF_MODIFICA;
  CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;
  PLAZO_INST_EQUIV.Control := ied_Plazo_Inst_Equiv;
  NUM_DIAS_EQUIV.Control   := ied_Num_Dias_Equiv;

  Interforma1.MsgPanel := MsgPanel;
  End;

  stpCalculaTasa.DatabaseName:= Objeto.Apli.DataBaseName;
  stpCalculaTasa.SessionName := Objeto.Apli.SessionName;
end;

procedure TWCrCfgTasa.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  CVE_TASA_INDICAD.Control := Nil;
  CVE_TASA_BASE.Control    := Nil;
  NUM_PLAZO_PER.Control    := Nil;
  SOBRETASA.Control        := Nil;
  B_ULTIMO_CICLO.Control   := Nil;
  B_DIA_NATURAL.Control    := Nil;
  F_ALTA.Control           := Nil;
  CVE_USU_ALTA.Control     := Nil;
  F_MODIFICA.Control       := Nil;
  CVE_USU_MODIFICA.Control := Nil;
  PLAZO_INST_EQUIV.Control := Nil;
  NUM_DIAS_EQUIV.Control   := Nil;
  End;
end;


procedure TWCrCfgTasa.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCfgTasa.InterForma1DespuesNuevo(Sender: TObject);
begin  If edCVE_TASA_INDICAD.CanFocus Then edCVE_TASA_INDICAD.SetFocus;

       HabilitaOpciones;
       ObtenValorTasa;
       //btnConfiguraTasasMultiples.Enabled := False;
       HabilitaTasasMultiples;
end;

procedure TWCrCfgTasa.InterForma1DespuesModificar(Sender: TObject);
begin  If rgCVE_OPERACION.CanFocus Then rgCVE_OPERACION.SetFocus;
       HabilitaOpciones;
       //btnConfiguraTasasMultiples.Enabled := False;
       HabilitaTasasMultiples;
end;

{ Propiedades }
function TWCrCfgTasa.Get_Situacion: String;
begin
  Case rgSIT_CFG_TASA.ItemIndex Of
   0 : Result := CSIT_AC;
   1 : Result := CSIT_IN;
  Else
   Result := '';
  End;
end;

function TWCrCfgTasa.Get_Tipo_Operacion: String;
begin
  Case rgCVE_OPERACION.ItemIndex Of
    0 : Result := C_MENOR;
    1 : Result := C_MAYOR;
    2 : Result := C_PROMEDIO;
    3 : Result := C_INICIAL;
    4 : Result := C_FINAL;
    5 : Result := C_EQUIV;
  Else
    Result := '';
  End;
end;

function TWCrCfgTasa.Get_Tipo_Operador: String;
begin
  Case cbOperador.ItemIndex Of
    0 : Result := '';
    1 : Result := C_SUMAR;
    2 : Result := C_RESTAR;
    3 : Result := C_MULTPLICAR;
    4 : Result := C_DIVIDIR;
  Else
    Result := '';
  End;
end;

function TWCrCfgTasa.Get_Tipo_Periodo: String;
begin
  Case cbCVE_PERIODO.ItemIndex Of
    0 : Result := C_DIA;
    1 : Result := C_SEMANA;
    2 : Result := C_MES;
  Else
    Result :=  '';
  End;
end;

function TWCrCfgTasa.Get_Tipo_Tasa: String;
begin
  Case rgCVE_VALOR_TASA.ItemIndex Of
    0 : Result := C_PUBLICADAS;
    1 : Result := C_VIGENTES;
    2 : Result := C_PUBLICADAS_Y_VIGENTES;
  Else
   Result := '';
  End;
end;

procedure TWCrCfgTasa.Set_Situacion(pstrValue: String);
begin
// If (Situacion <> pstrValue) Then
  rgSIT_CFG_TASA.ItemIndex := Encuentra_Posicion(pstrValue, C_SITUACION);
end;

procedure TWCrCfgTasa.Set_Tipo_Operacion(pstrValue: String);
begin
// If (Tipo_Operacion <> pstrValue) Then
  rgCVE_OPERACION.ItemIndex := Encuentra_Posicion(pstrValue, C_OPERACION);
end;

procedure TWCrCfgTasa.Set_Tipo_Operador(pstrValue: String);
begin
// If (Tipo_Operacion <> pstrValue) Then
  cbOperador.ItemIndex   := Encuentra_Posicion(pstrValue, C_OPERADOR);
end;

procedure TWCrCfgTasa.Set_Tipo_Periodo(pstrValue: String);
begin
// If (Tipo_Periodo <> pstrValue) Then
  cbCVE_PERIODO.ItemIndex  := Encuentra_Posicion(pstrValue, C_PERIODO);
end;

procedure TWCrCfgTasa.Set_Tipo_Tasa(pstrValue: String);
begin
// If (Tipo_Tasa <> pstrValue) Then
  rgCVE_VALOR_TASA.ItemIndex := Encuentra_Posicion(pstrValue, C_TASA);
end;

{ Funciones y Procedimientos }
function TWCrCfgTasa.Encuentra_Posicion(pstrBusca : String; pArreglo : Array Of String) : Integer;
var I : Integer;
begin
 Result := -1;
 For I := 0 To High(pArreglo) Do
  If (pArreglo[I] = pstrBusca) Then
   Begin
   Result := I;
   Break;
   End;
end;

procedure TWCrCfgTasa.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
 With Objeto Do
  Begin
    If (IsNewData) Then
     Begin
     F_ALTA.AsDateTime     := Apli.DameFechaEmpresa;;
     CVE_USU_ALTA.AsString := Apli.Usuario;
     End
    Else
     Begin
     F_MODIFICA.AsDateTime      := Apli.DameFechaEmpresa;
     CVE_USU_MODIFICA.AsString  := Apli.Usuario;
     End;

     CVE_OPERACION.AsString   := Tipo_Operacion;
     CVE_PERIODO.AsString     := Tipo_Periodo;
     CVE_VALOR_TASA.AsString  := Tipo_Tasa;
     OPERADOR_S_TASA.AsString := Tipo_Operador;
     SIT_CFG_TASA.AsString    := Situacion;
     Realizado := True;
  End;
end;

procedure TWCrCfgTasa.InterForma1Buscar(Sender: TObject);
begin
 With Objeto Do
   If Busca Then
    Begin
    Tipo_Operacion := CVE_OPERACION.AsString;
    Tipo_Periodo   := CVE_PERIODO.AsString;
    Tipo_Tasa      := CVE_VALOR_TASA.AsString;
    Tipo_Operador  := OPERADOR_S_TASA.AsString;
    Situacion      := SIT_CFG_TASA.AsString;

    Tasa.FindKey([ CVE_TASA_INDICAD.AsString ]);
    TasaBase.FindKey([ CVE_TASA_BASE.AsString ]);

    HabilitaTasasMultiples;
    End;
end;

procedure TWCrCfgTasa.ilCVE_TASA_INDICADCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrCfgTasa.ilCVE_TASA_INDICADEjecuta(Sender: TObject);
begin
 If Objeto.Tasa.FindKey([ilCVE_TASA_INDICAD.Buffer]) Then
   InterForma1.NextTab(edCVE_TASA_INDICAD);
end;

procedure TWCrCfgTasa.ilCVE_TASA_BASEEjecuta(Sender: TObject);
begin
 If Objeto.TasaBase.FindKey([ilCVE_TASA_BASE.Buffer]) Then
   InterForma1.NextTab(edCVE_TASA_BASE);
end;

procedure TWCrCfgTasa.btnCVE_TASA_INDICADClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCFGTASA_TASA',True,True) then
   begin
     Objeto.Tasa.ShowAll := True;
     If Objeto.Tasa.Busca Then
       InterForma1.NextTab(edCVE_TASA_INDICAD);
   end;
end;

procedure TWCrCfgTasa.btnCVE_TASA_BASEClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCFGTASA_TSBS',True,True) then
   begin
     Objeto.TasaBase.ShowAll := True;
     If Objeto.TasaBase.Busca Then
       InterForma1.NextTab(edCVE_TASA_BASE);
   end;
end;

procedure TWCrCfgTasa.edCVE_TASA_INDICADExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edCVE_TASA_INDICAD, (Trim(edCVE_TASA_INDICAD.Text) <> '') ,
                        'Favor de indicar la "Tasa".' ,True);
end;

procedure TWCrCfgTasa.edCVE_TASA_BASEExit(Sender: TObject);
var vlbCanExit : Boolean;
    vlStrMsg : String;
begin
 vlbCanExit := True;
 If (Trim(edCVE_TASA_BASE.Text) = '') Then
  Begin
  vlbCanExit := False;
  vlStrMsg := 'Favor de indicar la "Tasa Base".' ;
  End
 Else If (edCVE_TASA_INDICAD.Text = edCVE_TASA_BASE.Text) Then
  Begin
  vlbCanExit := False;
  vlStrMsg := 'La "Tasa Base" debe ser diferente a la "Tasa".' ;
  End;

 InterForma1.ValidaExit(edCVE_TASA_BASE, vlbCanExit,vlStrMSg,True);
end;

procedure TWCrCfgTasa.rgCVE_OPERACIONExit(Sender: TObject);
begin
 InterForma1.ValidaExit(rgCVE_OPERACION, True, '', True);
 InterForma1.NextTab(rgCVE_OPERACION);
end;

procedure TWCrCfgTasa.edNUM_PLAZO_PERExit(Sender: TObject);
var vlstrMsg : String;
    vlbCanExit : Boolean;
begin
 vlstrMsg := '';
 Objeto.NUM_PLAZO_PER.GetFromControl;
 vlbCanExit := Trim(Objeto.NUM_PLAZO_PER.AsString) <> '';
 If Not (vlbCanExit) Then
  vlstrMsg := 'Favor de indicar un "Rango".';
 InterForma1.ValidaExit(edNUM_PLAZO_PER, vlbCanExit, vlstrMsg,True);
end;

procedure TWCrCfgTasa.cbCVE_PERIODOExit(Sender: TObject);
var vlstrMsg : String;
    vlbCanExit : Boolean;
begin
 vlstrMsg := '';
 vlbCanExit := Trim(Tipo_Periodo) <> '';
 If Not (vlbCanExit) Then
  vlstrMsg := 'Favor de indicar un "Tipo de Rango".';
 InterForma1.ValidaExit(cbCVE_PERIODO, vlbCanExit, vlstrMsg,True);
end;

procedure TWCrCfgTasa.rgCVE_VALOR_TASAExit(Sender: TObject);
begin
 InterForma1.ValidaExit(rgCVE_VALOR_TASA, True, '', True);
 InterForma1.NextTab(rgCVE_VALOR_TASA);
end;

procedure TWCrCfgTasa.edSOBRETASAExit(Sender: TObject);
var vlstrMsg : String;
    vlbCanExit : Boolean;
begin
 vlstrMsg := '';
 vlbCanExit := ( (Trim(Tipo_Operador) = '') And (Trim(edSOBRETASA.Text) = '') )
                  Or ( (Trim(Tipo_Operador) <> '') And (Trim(edSOBRETASA.Text) <> '') );
 If Not (vlbCanExit) Then
  vlstrMsg := 'Favor de indicar tanto el "Operador" como su "Sobretasa".';
 InterForma1.ValidaExit(edSOBRETASA, vlbCanExit, vlstrMsg, True);
end;

procedure TWCrCfgTasa.rgSIT_CFG_TASAExit(Sender: TObject);
begin
 InterForma1.ValidaExit(rgSIT_CFG_TASA, True, '', True);
 InterForma1.NextTab(rgSIT_CFG_TASA);
end;

procedure TWCrCfgTasa.edSOBRETASAKeyPress(Sender: TObject; var Key: Char);
begin
 If (Pos(Key,'0123456789.'#8) = 0) Then Key := #0;
end;

procedure TWCrCfgTasa.HabilitaOpciones;
begin
 chbxB_DIA_NATURAL.Enabled := (Tipo_Periodo = C_DIA);
 chbxB_ULTIMO_CICLO.Enabled := Not chbxB_DIA_NATURAL.Enabled;
 If (Objeto.Modo = moEdit) Or (Objeto.Modo = moAppend) Then Begin
   If Get_Tipo_Operacion=C_EQUIV Then Begin
     ied_Plazo_Inst_Equiv.ReadOnly:= False;
     ied_Plazo_Inst_Equiv.Color:= clWhite;
     ied_Num_Dias_Equiv.ReadOnly:= False;
     ied_Num_Dias_Equiv.Color:= clWhite;
   End
   Else Begin
     ied_Plazo_Inst_Equiv.Text:= '';
     ied_Plazo_Inst_Equiv.ReadOnly:= True;
     ied_Plazo_Inst_Equiv.Color:= clBtnFace;
     ied_Num_Dias_Equiv.Text:= '';
     ied_Num_Dias_Equiv.ReadOnly:= True;
     ied_Num_Dias_Equiv.Color:= clBtnFace;
   End;
 End;

end;

procedure TWCrCfgTasa.HabilitaTasasMultiples;
var vliConta : Integer;
    vlstrSQL : String;
begin
 With Objeto Do
   Begin
   vlstrSQL := 'SELECT COUNT(*) AS CONTA'+coCRLF+
               'FROM CR_TASA_CONFIG'+coCRLF+
               'WHERE CVE_TASA_INDICAD = '+SQLStr(CVE_TASA_INDICAD.AsString)+coCRLF+
               '  AND CVE_TASA_BASE <> '+SQLStr(CVE_TASA_BASE.AsString)+coCRLF;
   GetSQLInt(vlstrSQL, DatabaseName, SessionName, 'CONTA', vliConta, False);

   If (Modo = moEdit) Or (Modo = moAppend) Or (Modo = moInActive) Then Begin
     btnConfiguraTasasMultiples.Enabled := False;
   End
   Else Begin
     btnConfiguraTasasMultiples.Enabled := vliConta > 0;
   End;

   End;
 ObtenValorTasa;
end;

procedure TWCrCfgTasa.cbCVE_PERIODOChange(Sender: TObject);
begin
 HabilitaOpciones;
 chbxB_DIA_NATURAL.Checked := False;
 chbxB_ULTIMO_CICLO.Checked := chbxB_DIA_NATURAL.Checked
end;

procedure TWCrCfgTasa.InterForma1DespuesCancelar(Sender: TObject);
begin
 With Objeto Do
  Begin
  Tipo_Operacion := CVE_OPERACION.AsString;
  Tipo_Periodo   := CVE_PERIODO.AsString;
  Tipo_Tasa      := CVE_VALOR_TASA.AsString;
  Tipo_Operador  := OPERADOR_S_TASA.AsString;
  Situacion      := SIT_CFG_TASA.AsString;

  Tasa.FindKey([ CVE_TASA_INDICAD.AsString ]);
  TasaBase.FindKey([ CVE_TASA_BASE.AsString ]);

  HabilitaTasasMultiples;
  End;
end;

procedure TWCrCfgTasa.btnConfiguraTasasMultiplesClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCFGTASA_CNTM',True,True) then
      Configura_Tasas_Mutliples(Objeto.Apli, Objeto.ParamCre, Objeto.CVE_TASA_INDICAD.AsString);
end;

procedure TWCrCfgTasa.InterForma1DespuesAceptar(Sender: TObject);
begin
 HabilitaTasasMultiples;
end;

procedure TWCrCfgTasa.InterForma1DespuesEliminar(Sender: TObject);
begin
 HabilitaTasasMultiples;
end;

procedure TWCrCfgTasa.ied_Plazo_Inst_EquivExit(Sender: TObject);
var vlstrMsg : String;
    vlbCanExit : Boolean;
begin
 vlstrMsg := '';
 vlbCanExit := (rgCVE_OPERACION.ItemIndex<>5) Or (Trim(ied_Plazo_Inst_Equiv.Text)<>'');
 If Not (vlbCanExit) Then
  vlstrMsg := 'Favor de indicar los "Días de Plazo del Instrumento".';
 InterForma1.ValidaExit(ied_Plazo_Inst_Equiv, vlbCanExit, vlstrMsg,True);
end;

procedure TWCrCfgTasa.ied_Num_Dias_EquivExit(Sender: TObject);
var vlstrMsg : String;
    vlbCanExit : Boolean;
begin
 vlstrMsg := '';
 vlbCanExit := (rgCVE_OPERACION.ItemIndex<>5) Or (Trim(ied_Num_Dias_Equiv.Text)<>'');
 If Not (vlbCanExit) Then
  vlstrMsg := 'Favor de indicar los "Días de Periodo de Cálculo".';
 InterForma1.ValidaExit(ied_Num_Dias_Equiv, vlbCanExit, vlstrMsg,True);
end;


procedure TWCrCfgTasa.ObtenValorTasa;
begin
  gbValorTasa.Caption:= 'Valor de la Tasa:';
  If (Not Objeto.Active) Or ((Objeto.Modo<>moEdit) And (Objeto.Modo<>moBrowse))  Then Begin
    lblValorTasa.Caption:= '';
    Exit;
  End;

  gbValorTasa.Caption:= 'Valor de la Tasa "'+Objeto.CVE_TASA_INDICAD.AsString+'"'+
                        ' al ' + DateTimeToStr(Objeto.Apli.DameFechaEmpresa) + ':' ;

  stpCalculaTasa.ParamByName('PECVE_TASA_INDICAD').AsString:= Objeto.CVE_TASA_INDICAD.AsString;
  stpCalculaTasa.ParamByName('PECVE_TASA_BASE').AsString:= Objeto.CVE_TASA_BASE.AsString;
  stpCalculaTasa.ParamByName('PEF_CALCULO').AsDateTime:= Objeto.Apli.DameFechaEmpresa;
  stpCalculaTasa.ExecProc;

  If stpCalculaTasa.ParamByName('PSRESULTADO').AsInteger<>0 Then Begin
    Application.MessageBox(Pchar(stpCalculaTasa.ParamByName('PSTX_RESULTADO').AsString),
                           'Error al obtener el valor de la tasa',MB_OK);
    lblValorTasa.Caption:=  '--';
  End
  Else Begin
    lblValorTasa.Caption:=  FormatFloat('###,###,##0.00',
                            stpCalculaTasa.ParamByName('PSVALOR_TASA').AsFloat) ;
  End;

End;

procedure TWCrCfgTasa.rgCVE_OPERACIONClick(Sender: TObject);
begin
  HabilitaOpciones;
end;

end.


