// Sistema         : Clase de CR_CAT_SOL
// Fecha de Inicio : 18/01/2007
// Función forma   : Clase de CR_CAT_SOL
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
//Tablas CAT                    
//select * from CR_CAT_SOL
//select * from CR_CAT_SOL_COM
//select * from CR_CAT_REL_COM

unit IntCrCatSol;

Interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
  UnSQL2, InterFun, ComCtrls, IntDtPk, Math, IntParamCre, IntTasIndFin,
  IntCrCatComi, IntGenCre, IntMQrCostAmrt, InterApl, //UnCrFunCAT,
  IntLinkit, InterEdit, IntSGCtrl, //UNIDAD DE CALCULO DEL IVA
  UnTasaimp;

Type
  TArrayString = Array of String;

Type
  TArrayDouble = Array of Double;

Type
  TCrCatSol = class;
    TWCrCatSol = class(TForm)
      InterForma1: TInterForma;
      lbF_SOLICITUD: TLabel;
      edF_SOLICITUD: TEdit;
      lbID_SOL_CAT: TLabel;
      edID_SOL_CAT: TEdit;
      lbCVE_PRODUCTO_CRE: TLabel;
      edCVE_PRODUCTO_CRE: TEdit;
      lbIMP_SOLICITUD: TLabel;
      lbF_INICIO: TLabel;
      dtpF_INICIO: TInterDateTimePicker;
      edF_INICIO: TEdit;
      lbF_FIN: TLabel;
      dtpF_FIN: TInterDateTimePicker;
      edF_FIN: TEdit;
      lbDIAS_PLAZO: TLabel;
      edDIAS_PLAZO: TEdit;
      lbNOMBRE: TLabel;
      edNOMBRE: TEdit;
      lbCVE_MONEDA: TLabel;
      edCVE_MONEDA: TEdit;
      lbUNIDAD_TIEMPO_CP: TLabel;
      lbUNIDAD_TIEMPO_IN: TLabel;
      edUNIDAD_TIEMPO_IN: TEdit;
      lbCVE_TASA_REFER: TLabel;
      edCVE_TASA_REFER: TEdit;
      lbOPER_SOBRETASA: TLabel;
      edOPER_SOBRETASA: TEdit;
      lbSOBRETASA: TLabel;
      edSOBRETASA: TEdit;
      lbTASA_ANUALIZADA: TLabel;
      edTASA_ANUALIZADA: TEdit;
      lbCVE_TIPO_TASA: TLabel;
      lbTASA_REFERENCIA: TLabel;
      edTASA_REFERENCIA: TEdit;
      lbPCT_CAT: TLabel;
      edPCT_CAT: TEdit;
      chB_IMPRESA: TCheckBox;
      lbSIT_SOL_CAT: TLabel;
      edSIT_SOL_CAT: TEdit;
      lbF_ALTA: TLabel;
      edF_ALTA: TEdit;
      lbCVE_USU_ALTA: TLabel;
      edCVE_USU_ALTA: TEdit;
      lbF_MODIFICA: TLabel;
      edF_MODIFICA: TEdit;
      lbCVE_USU_MODIF: TLabel;
      edCVE_USU_MODIF: TEdit;
      chB_IVA: TCheckBox;
      lbSISTEMA: TLabel;
      edSISTEMA: TEdit;
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
      btPRODUCTO: TBitBtn;
      ilTASA_REFER: TInterLinkit;
      btTASA_REFER: TBitBtn;
      edDescProducto: TEdit;
      edDESC_TASA_REFER: TEdit;
      GroupBox1: TGroupBox;
      lbCVE_COMISION: TLabel;
      Label6: TLabel;
      Label11: TLabel;
      edCVE_COMISION: TEdit;
      btCOMISION: TBitBtn;
      edDESC_COMISION: TEdit;
      SGCtrlComis: TSGCtrl;
      ePctComision: TInterEdit;
      ieMonto: TInterEdit;
      bbAgrega: TBitBtn;
      sbBorra: TBitBtn;
      edIMP_SOLICITUD: TInterEdit;
      edCVE_AMORTIZACION: TRadioGroup;
      edCVE_PAGO_INTERES: TRadioGroup;
      edUNIDAD_TIEMPO_CP: TComboBox;
      bbCAT: TBitBtn;
      Label1: TLabel;
      Label2: TLabel;
      edTipoComision: TEdit;
      edPerComision: TEdit;
      Label3: TLabel;
      edMontoPorcComis: TEdit;
      Label4: TLabel;
      bbImprime: TBitBtn;
      ilCOMISION: TInterLinkit;
      Memo1: TMemo;
      Memo2: TMemo;
      Memo3: TMemo;
      Memo4: TMemo;
      Memo5: TMemo;
      cbBCapitaliza: TCheckBox;
      rgCVE_TIPO_TASA: TRadioGroup;
      btnCatNuevo: TButton;
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormDestroy(Sender: TObject);
      procedure InterForma1DespuesNuevo(Sender: TObject);
      procedure InterForma1DespuesModificar(Sender: TObject);
      procedure btPRODUCTOClick(Sender: TObject);
      procedure btCOMISIONClick(Sender: TObject);
      procedure bbAgregaClick(Sender: TObject);
      procedure sbBorraClick(Sender: TObject);
      procedure edNOMBREExit(Sender: TObject);
      procedure edIMP_SOLICITUDExit(Sender: TObject);
      procedure edCVE_TASA_REFERExit(Sender: TObject);
      procedure btTASA_REFERClick(Sender: TObject);
      procedure edOPER_SOBRETASAExit(Sender: TObject);
      procedure edOPER_SOBRETASAKeyPress(Sender: TObject; var Key: Char);
      procedure edSOBRETASAExit(Sender: TObject);
      procedure edF_INICIOExit(Sender: TObject);
      procedure edF_FINExit(Sender: TObject);
      procedure edCVE_AMORTIZACIONClick(Sender: TObject);
      procedure edCVE_AMORTIZACIONExit(Sender: TObject);
      procedure edCVE_PAGO_INTERESClick(Sender: TObject);
      procedure edCVE_PAGO_INTERESExit(Sender: TObject);
      procedure edUNIDAD_TIEMPO_CPExit(Sender: TObject);
      procedure edCVE_COMISIONEnter(Sender: TObject);
      procedure edCVE_COMISIONExit(Sender: TObject);
      procedure ePctComisionExit(Sender: TObject);
      procedure ieMontoExit(Sender: TObject);
      procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
      procedure ilTASA_REFEREjecuta(Sender: TObject);
      procedure ilCOMISIONEjecuta(Sender: TObject);
      procedure bbAgregaExit(Sender: TObject);
      procedure sbBorraExit(Sender: TObject);
      procedure btPRODUCTOExit(Sender: TObject);
      procedure bbCATExit(Sender: TObject);
      procedure InterForma1DespuesAceptar(Sender: TObject);
      procedure bbImprimeClick(Sender: TObject);
      procedure bbCATClick(Sender: TObject);
      procedure edUNIDAD_TIEMPO_CPChange(Sender: TObject);
      procedure rgCVE_TIPO_TASAExit(Sender: TObject);
      procedure rgCVE_TIPO_TASAClick(Sender: TObject);
      procedure btnCatNuevoClick(Sender: TObject);
    procedure btnCatNuevoExit(Sender: TObject);
    procedure edDIAS_PLAZOChange(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    private
      {Private Declarations}
    public
      {Public Declarations}
      Objeto: TCrCatSol;
      SQLComis: String;
      IndexArrayComis: Integer;
      ArrayComisiones: TArrayString;
      ArrayPctComis: TArrayString;
      ArrayImpComis: TArrayString;
      function DameFolioCat: Integer;
      function DameProductoCapit(PPCVeProductoCre: String): String;
      function ValorTasa(pTasa: String): String;
      function TIR(pLineaTiempo: TArrayDouble; pPeriodos: Integer): Double;
      procedure ValorTasaCred;
      procedure LimpiaComisiones;
      procedure ArmaQueryComis;
      procedure GeneraConsulta;
      procedure AsigTipCalcComis;
  end;

  TCrCatSol= class(TInterFrame)
    private
      {Private Declarations}
    protected
      //procedure Notification(AComponent: TComponent; Operation: TOperation); Override;
    public
      {Public Declarations}
      F_SOLICITUD: TInterCampo;
      ID_SOL_CAT: TInterCampo;
      CVE_PRODUCTO_CRE: TInterCampo;
      IMP_SOLICITUD: TInterCampo;
      F_INICIO: TInterCampo;
      F_FIN: TInterCampo;
      DIAS_PLAZO: TInterCampo;
      NOMBRE: TInterCampo;
      CVE_MONEDA: TInterCampo;
      CVE_AMORTIZACION: TInterCampo;
      CVE_PAGO_INTERES: TInterCampo;
      UNIDAD_TIEMPO_CP: TInterCampo;
      UNIDAD_TIEMPO_IN: TInterCampo;
      CVE_TASA_REFER: TInterCampo;
      OPER_SOBRETASA: TInterCampo;
      SOBRETASA: TInterCampo;
      TASA_ANUALIZADA: TInterCampo;
      CVE_TIPO_TASA: TInterCampo;
      TASA_REFERENCIA: TInterCampo;
      PCT_CAT: TInterCampo;
      B_IMPRESA: TInterCampo;
      SIT_SOL_CAT: TInterCampo;
      F_ALTA: TInterCampo;
      CVE_USU_ALTA: TInterCampo;
      F_MODIFICA: TInterCampo;
      CVE_USU_MODIF: TInterCampo;
      B_IVA: TInterCampo;
      SISTEMA: TInterCampo;
      B_CAPITALIZA: TInterCampo;
      ParamCre: TParamCre;
      TasaRefer: TTasIndFin;
      Comisiones: TCrCatComi;
      Memo1, Memo2, Memo3, Memo4, Memo5: TMemo;
      constructor Create(AOwner: TComponent); Override;
      destructor Destroy; Override;
      function ShowWindow(FormaTipo: TFormaTipo): Integer; Override;
      function InternalBusca: Boolean; Override;
      //function InternalPost: Boolean; Override;
      function InternalPostMany: Boolean;
      function Reporte: Boolean; Override;
      function DameImpTrunc(PPImporte: Double): Double;
      procedure CalculaCATSimulador(MontoAutor, TasaAnualizada: Double;
                                    FechaIni, FechaFin: TDate;
                                    TipoAmort, TipoInteres, Periodo: Integer;
                                    PzoGraciaCP, PzoGraciaIN: Integer;
                                    BIVAInteres: String;
                                    PctComisAuto,
                                    PctComisDisp,
                                    PctComisEst,
                                    PctComisAniv,
                                    PctComisFEGA,
                                    PctComisOtros,
                                    ImpSegVida,
                                    ImpSegDanios,
                                    ImpSegAnual,
                                    ImpEstPreInv,
                                    ImpComisOtros: Double);
      //</SST>
      //01/06/11 Nuevo procedimiento para calculo de CAT
      procedure CalculaCATNuevo(MontoAutor, TasaAnualizada: Double;
                                FechaIni, FechaFin: TDate;
                                TipoAmort, TipoInteres, Periodo: Integer;
                                PzoGraciaCP, PzoGraciaIN: Integer;
                                BIVAInteres: String;
                                PctComisAuto,
                                PctComisDisp,
                                PctComisEst,
                                PctComisAniv,
                                PctComisFEGA,
                                PctComisOtros,
                                ImpSegVida,
                                ImpSegDanios,
                                ImpSegAnual,
                                ImpEstPreInv,
                                ImpComisOtros: Double);
      //<SST/>
    published
  end;

// ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16

var
  kTasaIVA: Double;
  vgCAT: Double; //SST250511
//Fin HERJA IVA

Implementation

//Uses RepMon;

{$R *.DFM}

constructor TCrCatSol.Create(AOwner: TComponent);
begin
  Inherited;
  // ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
  kTasaIVA:= 1 + StrtoFloat(fDameIVA(Apli))/100;
  //Fin HERJA IVA
  F_SOLICITUD:= CreaCampo('F_SOLICITUD', ftDate, tsNinguno, tsNinguno, True);
  F_SOLICITUD.Caption:= 'Fecha Solicitud';
  ID_SOL_CAT:= CreaCampo('ID_SOL_CAT', ftFloat, tsNinguno, tsNinguno, True);
  ID_SOL_CAT.Caption:= 'Número de Sol Cat';
  CVE_PRODUCTO_CRE:= CreaCampo('CVE_PRODUCTO_CRE', ftString, tsNinguno, tsNinguno, True);
  CVE_PRODUCTO_CRE.Caption:= 'Clave de Producto Cre';
  IMP_SOLICITUD:= CreaCampo('IMP_SOLICITUD', ftFloat, tsNinguno, tsNinguno, True);
  IMP_SOLICITUD.Caption:= 'Imp Solicitud';
  F_INICIO:=CreaCampo('F_INICIO', ftDate, tsNinguno, tsNinguno, True);
  F_INICIO.Caption:= 'Fecha Inicio';
  F_FIN:= CreaCampo('F_FIN', ftDate, tsNinguno, tsNinguno, True);
  F_FIN.Caption:= 'Fecha Fin';
  DIAS_PLAZO:= CreaCampo('DIAS_PLAZO', ftFloat, tsNinguno, tsNinguno, True);
  DIAS_PLAZO.Caption:= 'Dias Plazo';
  NOMBRE:= CreaCampo('NOMBRE', ftString, tsNinguno, tsNinguno, True);
  NOMBRE.Caption:= 'Nombre';
  CVE_MONEDA:= CreaCampo('CVE_MONEDA', ftFloat, tsNinguno, tsNinguno, True);
  CVE_MONEDA.Caption:= 'Clave de Moneda';
  CVE_AMORTIZACION:= CreaCampo('CVE_AMORTIZACION', ftString, tsNinguno, tsNinguno, True);
  CVE_AMORTIZACION.Caption:= 'Clave de Amortizacion';
  CVE_PAGO_INTERES:= CreaCampo('CVE_PAGO_INTERES', ftString, tsNinguno, tsNinguno, True);
  CVE_PAGO_INTERES.Caption:= 'Clave de Pago Interes';
  UNIDAD_TIEMPO_CP:= CreaCampo('UNIDAD_TIEMPO_CP', ftString, tsNinguno, tsNinguno, True);
  with UNIDAD_TIEMPO_CP do
  begin
    Size:= 2;
    UseCombo:= True;
    ComboLista.Add('Semanal');
    ComboDatos.Add('0');
    ComboLista.Add('Quincenal');
    ComboDatos.Add('1');
    ComboLista.Add('Mensual');
    ComboDatos.Add('2');
    ComboLista.Add('Bimestral');
    ComboDatos.Add('3');
    ComboLista.Add('Trimestral');
    ComboDatos.Add('4');
    ComboLista.Add('Cuatrimetral');
    ComboDatos.Add('5');
    ComboLista.Add('Semestral');
    ComboDatos.Add('6');
    ComboLista.Add('CONVENIO Anual');
    ComboDatos.Add('7');
  end;
  UNIDAD_TIEMPO_CP.Caption:= 'Unidad Tiempo Cp';
  UNIDAD_TIEMPO_IN:= CreaCampo('UNIDAD_TIEMPO_IN',ftString,tsNinguno,tsNinguno,True);
  UNIDAD_TIEMPO_IN.Caption:= 'Unidad Tiempo In';
  CVE_TASA_REFER:= CreaCampo('CVE_TASA_REFER',ftString,tsNinguno,tsNinguno,True);
  CVE_TASA_REFER.Caption:= 'Clave de Tasa Refer';
  OPER_SOBRETASA:= CreaCampo('OPER_SOBRETASA',ftString,tsNinguno,tsNinguno,True);
  OPER_SOBRETASA.Caption:= 'Operación Sobretasa';
  SOBRETASA:= CreaCampo('SOBRETASA',ftFloat,tsNinguno,tsNinguno,True);
  SOBRETASA.Caption:= 'Sobretasa';
  TASA_ANUALIZADA:= CreaCampo('TASA_ANUALIZADA',ftFloat,tsNinguno,tsNinguno,True);
  TASA_ANUALIZADA.Caption:= 'Tasa Anualizada';
  TASA_REFERENCIA:= CreaCampo('TASA_REFERENCIA',ftFloat,tsNinguno,tsNinguno,True);
  TASA_REFERENCIA.Caption:= 'Tasa Referencia';
  PCT_CAT:= CreaCampo('PCT_CAT', ftFloat, tsNinguno, tsNinguno, True);
  PCT_CAT.Caption:= 'Pct Cat';
  B_IMPRESA:= CreaCampo('B_IMPRESA', ftString, tsNinguno, tsNinguno, True);
  B_IMPRESA.Caption:= 'Impresa';
  SIT_SOL_CAT:= CreaCampo('SIT_SOL_CAT',ftString,tsNinguno,tsNinguno,True);
  SIT_SOL_CAT.Caption:= 'Situación Sol Cat';
  F_ALTA:= CreaCampo('F_ALTA', ftDate, tsNinguno, tsNinguno, True);
  F_ALTA.Caption:='Fecha Alta';
  CVE_USU_ALTA:= CreaCampo('CVE_USU_ALTA', ftString, tsNinguno, tsNinguno, True);
  CVE_USU_ALTA.Caption:= 'Clave de Usu Alta';
  F_MODIFICA:= CreaCampo('F_MODIFICA', ftDate, tsNinguno, tsNinguno, True);
  F_MODIFICA.Caption:= 'Fecha Modifica';
  CVE_USU_MODIF:= CreaCampo('CVE_USU_MODIF', ftString, tsNinguno, tsNinguno, True);
  CVE_USU_MODIF.Caption:= 'Clave de Usu Modificación';
  B_IVA:= CreaCampo('B_IVA', ftString, tsNinguno, tsNinguno, True);
  B_IVA.Caption:= 'Iva';
  SISTEMA:= CreaCampo('SISTEMA', ftString, tsNinguno, tsNinguno, True);
  SISTEMA.Caption:= 'Sistema';
  B_CAPITALIZA:= CreaCampo('B_CAPITALIZA', ftString, tsNinguno, tsNinguno, True);
  B_CAPITALIZA.Caption:= 'B CAPITALIZA';
  CVE_TIPO_TASA:= CreaCampo('CVE_TIPO_TASA', ftString, tsNinguno, tsNinguno, True);
  with CVE_TIPO_TASA do
  begin
    Size:= 2;
    UseCombo:= True;
    ComboLista.Add('0');
    ComboDatos.Add('VA');
    ComboLista.Add('1');
    ComboDatos.Add('FI');
  end;
  CVE_TIPO_TASA.Caption:= 'CVE_TIPO_TASA';
  FKeyFields.Add('F_SOLICITUD');
  FKeyFields.Add('ID_SOL_CAT');
  TasaRefer:= TTasIndFin.Create(Self);
  TasaRefer.MasterSource:= Self;
  TasaRefer.FieldByName('CVE_TASA_INDICAD').MasterField:= 'CVE_TASA_REFER';
  Comisiones:= TCrCatComi.Create(Self);
  Comisiones.MasterSource:= self;
  TableName:= 'CR_CAT_SOL';
  UseQuery:= True;
  HelpFile:= 'IntCrCatSol.Hlp';
  ShowMenuReporte:= True;
end;

destructor TCrCatSol.Destroy;
begin Inherited; end;


function TCrCatSol.ShowWindow(FormaTipo: TFormaTipo): Integer;
var
  W: TWCrCatSol;
begin
   W:= TWCrCatSol.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo:= FormaTipo;
      W.InterForma1.ShowBtnEliminar:= False;
      W.InterForma1.ShowBtnModificar:= False;
      W.InterForma1.ShowGrid:= False;
      W.InterForma1.ShowNavigator:= False;
      W.InterForma1.Funcion:= FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow:= W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

function TCrCatSol.InternalBusca: Boolean;
var
  T: TInterFindit;
begin
  InternalBusca:= False;
  T:= CreaBuscador('ICrCaSo.it', 'D,F');
  try
    if Active then
    begin
      T.Param(0, F_SOLICITUD.AsString);
      T.Param(1, ID_SOL_CAT.AsString);
    end;
    if T.Execute then
      InternalBusca:= FindKey([T.DameCampo(0), T.DameCampo(1)]);
  finally
    T.Free;
  end;
end;

function TCrCatSol.Reporte: Boolean;
begin //Execute_Reporte();
end;

Function    TCrCatSol.DameImpTrunc(PPImporte: Double) : Double;
var  VLImporte : Double;
begin
     VLImporte := TRUNC(PPImporte * 100)/100;
  DameImpTrunc:= VLImporte;
end;

procedure TCrCatSol.CalculaCATSimulador(
                   MontoAutor, TasaAnualizada: Double;
                   FechaIni, FechaFin: TDate;
                   TipoAmort, TipoInteres, Periodo: Integer;
                   PzoGraciaCP, PzoGraciaIN: Integer;
                   BIVAInteres: String;
                   PctComisAuto,
                   PctComisDisp,
                   PctComisEst,
                   PctComisAniv,
                   PctComisFEGA,
                   PctComisOtros,
                   ImpSegVida,
                   ImpSegDanios,
                   ImpSegAnual,
                   ImpEstPreInv,
                   ImpComisOtros: Double);
var
  MontosK           : TArrayDouble;
  MontosSI          : TArrayDouble;
  MontosI           : TArrayDouble;
  MontosC           : TArrayDouble;
  MontosCS          : TArrayDouble;
  VLPlazoTot        : Integer;
  VLPlazoPer        : Integer;
  VLPlazoPerAcum    : Integer;
  VLNoPer           : Integer;
  VLNoPerInd        : Integer;
  VLItera           : Integer;
  VLIteraPzo        : Integer;
  VLMontoCapitalPer : Double;
  VLSaldoInsoluto   : Double;
  VLMontoInteresPer : Double;
  VLTasaCAT         : Double;
  VLNoAnulidades    : Integer;
  VLPzoGraciaCP     : Integer;
  VLPzoGraciaIN     : Integer;
  VLFactorIVA       : Double;
  VLContinua        : Boolean;
begin
  //Limia Memos
  Memo1.Clear;
  Memo2.Clear;
  Memo3.Clear;
  Memo4.Clear;
  Memo5.Clear;
  //Inicia
  VLContinua:= True;
  //Determina el plazo
  VLPlazoTot:= Trunc(FechaFin  - FechaIni);
  //Determina Total de Periodos
  if Periodo = 0 then  //SEMANAL
    VLPlazoPer:= 7;
  if Periodo = 1 then  //QUINCENAL
    VLPlazoPer:= 15;
  if Periodo = 2 then  //MENSUAL
    VLPlazoPer:= 30;
  if Periodo = 3 then  //BIMESTRAL
    VLPlazoPer:= 60;
  if Periodo = 4 then  //TRIMESTRAL
    VLPlazoPer:= 90;
  if Periodo = 5 then  //CUATRIMESTRAL
    VLPlazoPer:= 120;
  if Periodo = 6 then  //SEMESTRAL
    VLPlazoPer:= 180;
  if Periodo = 7 then  //ANUAL
    VLPlazoPer:= 360;
  //end if
  //Determina No. de periodos
  VLNoPer:=  Trunc(VLPlazoTot / VLPlazoPer);
  if (VLPlazoTot mod VLPlazoPer) > 0 then
    VLNoPer:= VLNoPer + 1;
  //end if
     SetLength(MontosK,VLPlazoTot+1);
     SetLength(MontosSI,VLPlazoTot+1);
     SetLength(MontosI,VLPlazoTot+1);
     SetLength(MontosC,VLPlazoTot+2);
     SetLength(MontosCS,VLPlazoTot+2);
  try
    //Determina Periodos de CCCC   AAAA   PPPPP   IIII  TTTT  AAAA  LLLL
    if TipoAmort = 0 then // periodica
    begin
      //DETERMINA EL MONTO DE CAPITAL CONSIDERANDO EL PLAZO DE GRACIA
      VLMontoCapitalPer:= Trunc( MontoAutor / (VLNoPer - PzoGraciaCP));
      VLSaldoInsoluto:= MontoAutor;
      VLNoPerInd:= 1;
      VLPlazoPerAcum:= VLPlazoPer;
      for VLItera:= 1 to VLPlazoTot do
      begin
        if ((VLItera = VLPlazoPerAcum) or (VLItera = VLPlazoTot))  then
        begin
          VLPlazoPerAcum:= VLPlazoPerAcum + VLPlazoPer;
          if VLNoPer = VLNoPerInd then
            MontosK[VLItera]:= MontoAutor - (VLMontoCapitalPer * ((VLNoPer - PzoGraciaCP) - 1))
                        else if (VLNoPerInd > PzoGraciaCP) then
              MontosK[VLItera]:= VLMontoCapitalPer
            else
              MontosK[VLItera]:= 0;
          VLNoPerInd:= VLNoPerInd + 1;
        end
        else
          MontosK[VLItera]:= 0;
        //end if;
        if VLItera = 1 then
          MontosSI[VLItera]:= VLSaldoInsoluto;
        //end if;
        VLSaldoInsoluto:= VLSaldoInsoluto - MontosK[VLItera];
        if VLItera < VLPlazoTot then
          MontosSI[VLItera + 1]:= VLSaldoInsoluto;
        //end if;
      end;
    end;
    if TipoAmort = 1 then // Vencimiento
    begin
      VLSaldoInsoluto:= MontoAutor;
      for VLItera:= 1 to VLPlazoTot do
      begin
        if (VLItera = VLPlazoTot) then
          MontosK[VLItera]:= MontoAutor
        else
          MontosK[VLItera]:= 0;
        //end if;
        VLSaldoInsoluto:= VLSaldoInsoluto - MontosK[VLItera];
        MontosSI[VLItera]:= VLSaldoInsoluto;
      end;
    end;
    //Determina Periodos de IIII NNNNN TTTTT EEEEE RRRRR EEEEE SSSSSS
    VLNoPerInd:= 1;
    VLFactorIVA:= 1;
    VLPlazoPerAcum:= VLPlazoPer;
    VLMontoInteresPer:= 0;
    if BIVAInteres  = 'V' then
    //CORRECCION DE IVA DE 15 A 16
    //ASTECI HERJA 16/12/2009
    //  VLFactorIVA:= 1.15;
      VLFactorIVA:= kTasaIVA;
    // FIN DE CORRECCION
    //end if
    for VLItera:= 1 to VLPlazoTot do
    begin
      MontosI[VLItera]:= DameImpTrunc(MontosSI[VLItera] * TasaAnualizada / 36000) * VLFactorIVA;
    end;
    //Determina Periodos de CCCC OOOO  MMMM IIII  SSSSSS  IIIII OOOO NNNNN
    //INICIA
         for VLItera := 1 to VLPlazoTot  + 1 do  //CAMBIO ROIM
    begin
      if VLItera = 1 then
        MontosC[VLItera]:= 0;
      //end if
    end;
    VLItera:= 1;
    //% Comisión Autorización
    if PctComisAuto > 0 then
    //CORRECCION DE IVA DE 15 A 16
    //ASTECI HERJA 16/12/2009
      //MontosC[VLItera]:= MontosC[VLItera] + DameImpTrunc((MontoAutor * PctComisAuto / 100) * 1.15);
      MontosC[VLItera]:= MontosC[VLItera] + DameImpTrunc((MontoAutor * PctComisAuto / 100) * kTasaIVA);
    //FIN DE CORRECCION
    //end if;
    //% Comisión Disposición
    if PctComisDisp > 0 then
    //ASTECI HERJA 16/12/2009
      //MontosC[VLItera]:= MontosC[VLItera] + DameImpTrunc((MontoAutor * PctComisDisp / 100) * 1.15);
      MontosC[VLItera]:= MontosC[VLItera] + DameImpTrunc((MontoAutor * PctComisDisp / 100) * kTasaIVA);
    //FIN DE CORRECCION
    //end if;
    // % Comisión por Estructuración
    if PctComisEst > 0 then
    //CORRECCION DE IVA DE 15 A 16
    //ASTECI HERJA 16/12/2009
      //MontosC[VLItera]:= MontosC[VLItera] + DameImpTrunc((MontoAutor * PctComisEst / 100) * 1.15);
      MontosC[VLItera]:= MontosC[VLItera] + DameImpTrunc((MontoAutor * PctComisEst / 100) * kTasaIVA);
    //FIN DE CORRECCION
    //end if;
    // % Comisión por Aniversario
    if PctComisAniv > 0 then
    begin
             VLNoAnulidades := trunc(VLPlazoTot/365);
      for VLItera:= 1 to VLNoAnulidades do
      begin
        //CORRECCION DE IVA DE 15 A 16
        //ASTECI HERJA 16/12/2009
//                  MontosC[(VLItera * 365)+1] := MontosC[(VLItera * 365)+1] +  DameImpTrunc((MontosSI[VLItera * 365] * PctComisAniv / 100) * 1.15);
                  MontosC[(VLItera * 365)+1] := MontosC[(VLItera * 365)+1] +  DameImpTrunc((MontosSI[VLItera * 365] * PctComisAniv / 100) * kTasaIVA);
      //FIN DE CORRECCION
      end;
    end;
    //% FEGA
    if PctComisFEGA > 0 then
    begin
      for VLItera:= 1 to VLPlazoTot + 1 do    //CAMBIO ROIM
      begin
        if VLItera = 1 then
        begin
          VLIteraPzo:= VLItera + 1;
          while ((MontosK[VLIteraPzo] = 0) or (VLIteraPzo = VLPlazoTot)) do
          begin
            VLIteraPzo:= VLIteraPzo + 1;
          end;
          MontosC[VLItera]:= MontosC[VLItera] + DameImpTrunc(MontosSI[VLItera] * PctComisFEGA * (VLIteraPzo - VLItera) / 36000 );
        end;
        if ((MontosK[VLItera] > 0) and (VLItera <  VLPlazoTot)) then
        begin
          VLIteraPzo:= VLItera + 1;
          while ((MontosK[VLIteraPzo] = 0) or (VLIteraPzo = VLPlazoTot)) do
          begin
            VLIteraPzo:= VLIteraPzo + 1;
          end;
          MontosC[VLItera + 1]:= MontosC[VLItera + 1] + DameImpTrunc((MontosSI[VLItera] - MontosK[VLItera]) * PctComisFEGA * (VLIteraPzo - VLItera) / 36000 );
        end;
      end;
    end;
    //% Otros Comisiones
    if PctComisOtros > 0 then
    begin
      for VLItera:= 1 to VLPlazoTot + 1 do    //CAMBIO ROIM
      begin
        if MontosK[VLItera] > 0 then
        //CORRECCION DE IVA DE 15 A 16
        //ASTECI HERJA 16/12/2009
//                     MontosC[VLItera] := MontosC[VLItera] + DameImpTrunc((MontosSI[VLItera] * PctComisOtros  / 100 ) * 1.15);
          MontosC[VLItera]:= MontosC[VLItera] + DameImpTrunc((MontosSI[VLItera] * PctComisOtros  / 100 ) * kTasaIVA);
      //FIN CORRECCION
      //end if;
      end;
    end;
    // Importe Seguo Vida Periodico Capital
    if ImpSegVida > 0 then
    begin
      for VLItera:= 1 to VLPlazoTot + 1 do    //CAMBIO ROIM
      begin
        if MontosK[VLItera] > 0 then
          MontosC[VLItera]:= MontosC[VLItera] + ImpSegVida;
        //end if;
      end;
    end;
    // Importe Seguro Daños Periodico Capital
    if ImpSegDanios > 0 then
    begin
      for VLItera:= 1 to VLPlazoTot + 1 do  //CAMBIO ROIM
      begin
        if MontosK[VLItera] > 0 then
          MontosC[VLItera]:= MontosC[VLItera] + ImpSegDanios;
        //end if;
      end;
    end;
    // Importe Comisión Seguro Anual
    if ImpSegAnual > 0 then
    begin
      //Primer seguro
      VLItera:= 1;
      //CORRECCION DE IVA DE 15 A 16
      //ASTECI HERJA 16/12/2009
         //    MontosC[VLItera] := MontosC[VLItera] + DameImpTrunc(ImpSegAnual * 1.15);
      MontosC[VLItera]:= MontosC[VLItera] + DameImpTrunc(ImpSegAnual * kTasaIVA);
      //FIN DE CORRECCION
      //Seguros consecutivos
             VLNoAnulidades := trunc(VLPlazoTot/365);
      for VLItera:= 1 to VLNoAnulidades do
      begin
      //CORRECCION DE IVA DE 15 A 16
      //ASTECI HERJA 16/12/2009
         //         MontosC[(VLItera * 365)+1] := MontosC[(VLItera * 365)+1] +  DameImpTrunc(ImpSegAnual * 1.15);
                  MontosC[(VLItera * 365)+1] := MontosC[(VLItera * 365)+1] +  DameImpTrunc(ImpSegAnual * kTasaIVA);
      //FIN DE CORRECCION
      end;
    end;
    VLItera:= 1;
    // Importe Comisión Estudios de Preinversión
    if ImpEstPreInv > 0 then
    //CORRECCION DE IVA DE 15 A 16
    //ASTECI HERJA 16/12/2009
         //   MontosC[VLItera] := MontosC[VLItera] + DameImpTrunc(ImpEstPreInv * 1.15);
      MontosC[VLItera]:= MontosC[VLItera] + DameImpTrunc(ImpEstPreInv * kTasaIVA);
     //FIN DE CORRECCION
     //end if;
     // Importe Comisión Otros Conceptos
    if ImpComisOtros > 0 then
     //CORRECCION DE IVA DE 15 A 16
     //ASTECI HERJA 16/12/2009
         //   MontosC[VLItera] := MontosC[VLItera] + DameImpTrunc(ImpComisOtros * 1.15);
      MontosC[VLItera]:= MontosC[VLItera] + DameImpTrunc(ImpComisOtros * kTasaIVA);
     //FIN DE CORRECCION
     //end if;
     //TTTTT  OOOOO   TTTTT  AAAAAA  LLLLLL
    for VLItera:= 1 to VLPlazoTot do   //CAMBIO ROIM
    begin
      if VLItera = 1 then
      begin
        MontosCS[VLItera]:= ( MontoAutor * (-1) ) + MontosC[VLItera];
        MontosCS[VLItera+1]:= MontosK[VLItera] + MontosI[VLItera] + MontosC[VLItera+1];
      end
      else
        MontosCS[VLItera+1]:= MontosK[VLItera] + MontosI[VLItera] + MontosC[VLItera+1];
              //end if
         end;

         for VLItera := 1 to High(MontosK) do Memo1.Lines.Add(FormatFloat('###,###,###,##0.00',MontosK[VLItera]));
         for VLItera := 1 to High(MontosSI) do Memo2.Lines.Add(FormatFloat('###,###,###,##0.00',MontosSI[VLItera]));
         for VLItera := 1 to High(MontosI) do Memo3.Lines.Add(FormatFloat('###,###,###,##0.00',MontosI[VLItera]));
         for VLItera := 1 to High(MontosC) do Memo5.Lines.Add(FormatFloat('###,###,###,##0.00',MontosC[VLItera]));
         for VLItera := 1 to High(MontosCS) do Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',MontosCS[VLItera]));



     except
    on E: Exception do
    begin
               VLTasaCAT :=0;
      VLContinua:= False;
      ShowMessage('Error al Cálcular CAT, Por Favor Intentelo más Tarde 01.');
      ShowMessage(E.Message);
    end;
  end;
  if VLContinua then
  begin
    try
      // VLTasaCAT:= (TRUNC(InternalRateOfReturn(0.1,MontosCS) * 36000000000) / 1000000);
      PCT_CAT.AsFloat:= (TRUNC(InternalRateOfReturn(0.1,MontosCS) * 36000000000) / 1000000);
    except
      on E: Exception do
      begin
        PCT_CAT.AsFloat:= 0;
        ShowMessage('Error al cálcular CAT, Por favor intentelo más tarde 02.');
        ShowMessage(E.Message);
      end;
    end;
  end;
  //Libera los arreglos de la memoria
  SetLength(MontosK, 0);
  SetLength(MontosSI, 0);
  SetLength(MontosI, 0);
  SetLength(MontosC, 0);

      if MontosK <> nil then  MontosK := Nil;
      if MontosSI <> nil then  MontosSI := Nil;
      if MontosI <> nil then  MontosI := Nil;
      if MontosC <> nil then  MontosC := Nil;
      if MontosCS <> nil then  MontosCS := Nil;

end;


//Function TCrCatSol.InternalPost : Boolean;
Function    TCrCatSol.InternalPostMany  : Boolean;
var    VLSalida     : Boolean;
       Msg          : String;
       VLSql        : String;
begin
//     InternalPost := False;
  InternalPostMany:= False;
  VLSalida:= False;
     if Modo=moAppend then
  begin
    try
                VLSql :=   ' BEGIN ' +
        ' INSERT INTO CR_CAT_SOL VALUES ('+ ID_SOL_CAT.AsSql + ','
                                          + F_SOLICITUD.AsSql + ','
                                          + F_INICIO.AsSql + ','
                                          + F_FIN.AsSql + ','
                                          + DIAS_PLAZO.AsSql + ','
                                          + NOMBRE.AsSql + ','
                                          + CVE_PRODUCTO_CRE.AsSql + ','
                                          + IMP_SOLICITUD.AsSql + ','
                                          + CVE_MONEDA.AsSql + ','
                                          + CVE_TASA_REFER.AsSql + ','
                                          + TASA_REFERENCIA.AsSql + ','
                                          + OPER_SOBRETASA.AsSql + ','
                                          + SOBRETASA.AsSql + ','
                                          + TASA_ANUALIZADA.AsSql + ','
                                          + CVE_TIPO_TASA.AsSql + ','
                                          + '0' + ','
                                          + '0' + ','
                                          + CVE_AMORTIZACION.AsSql + ','
                                          + CVE_PAGO_INTERES.AsSql + ','
                                          + UNIDAD_TIEMPO_CP.AsSql + ','
                                          + UNIDAD_TIEMPO_IN.AsSql + ','
                                          + PCT_CAT.AsSql + ','
                                          + B_IMPRESA.AsSql + ','
                                          + SIT_SOL_CAT.AsSql + ','
                                          + F_ALTA.AsSql + ','
                                          + CVE_USU_ALTA.AsSql + ','
                                          + 'NULL,'
                                          + 'NULL,'
                                          + B_IVA.AsSql + ','
                                          + SISTEMA.AsSql + ','
                                          + B_CAPITALIZA.AsSql
                                          +'); COMMIT; '+
        ' END;';
                RunSQL(VLSql,DataBaseName,SessionName,True);

        VLSalida:= True;
    except
      Beep;Beep;Beep;Beep;
      ShowMessage('Problemas con el Alta del Movimiento. Avise Urgentemente a Sistemas');
    end;
  end;
  AutoRefresh:= False;
//     InternalPost := VLSalida;
  InternalPostMany:= VLSalida;
end;

(****************************************FORMA CR_CAT_SOL********************)
(*                                                                          *)
(*  FORMA DE CR_CAT_SOL                                                     *)
(*                                                                          *)
(****************************************FORMA CR_CAT_SOL********************)

function  TWCrCatSol.DameProductoCapit(PPCVeProductoCre: String): String;
var
  VLSalida: String;
  Q: TQuery;
begin
  VLSalida:= 'F';
  Q:= GetSQLQuery('SELECT B_FINANC_ADIC FROM CR_PRODUCTO WHERE CVE_PRODUCTO_CRE = ' + #39 + PPCVeProductoCre + #39, Objeto.DataBaseName, Objeto.SessionName, True);
  try
    if Q <> nil then
      VLSalida:= Q.FieldByName('B_FINANC_ADIC').AsString
    else
      VLSalida:= 'F';
    //end if
  finally
    if Q <> nil then
      Q.free;
  end;
  DameProductoCapit:= VLSalida;
end;

function TWCrCatSol.DameFolioCat: Integer;
var
  VLSalida: Integer;
  Q: TQuery;
begin
  VLSalida:= 0;
  Q:= GetSQLQuery('SELECT MAX(ID_SOL_CAT) AS ID_SOL_CAT FROM CR_CAT_SOL ', Objeto.DataBaseName, Objeto.SessionName, True);
  try
    if Q <> nil then
      VLSalida:= Q.FieldByName('ID_SOL_CAT').AsInteger
    else
      VLSalida:= 0;
    //end if
  finally
    if Q <> nil then
      Q.free;
  end;
  DameFolioCat:= VLSalida + 1;
end;

function TWCrCatSol.ValorTasa(pTasa: String): String;
var
  vlsql, vlValor: String;
  StpValorTasa: TStoredProc;
begin
  if pTasa <> '' then
  begin
    vlValor:= '0';
    StpValorTasa:= TStoredProc.Create(Nil);
    if Assigned(StpValorTasa) then
    begin
      with StpValorTasa do
      begin
        try
          StoredProcName:= 'PKGCRCREDITOO1.STPCALCTASAREFER';
          DatabaseName:= Objeto.Apli.DataBaseName;
          SessionName:= Objeto.Apli.SessionName;
          Params.Clear;
          Params.CreateParam(ftString, 'peCVE_TASA_INDICAD', ptInput);
          Params.CreateParam(ftDate, 'peF_CALCULO', ptInput);
          Params.CreateParam(ftFloat, 'psVAL_TASA', ptOutput);
          Params.CreateParam(ftFloat, 'PSRESULTADO', ptOutput);
          Params.CreateParam(ftString, 'PSTX_RESULTADO', ptOutput);
          ParamByName('peCVE_TASA_INDICAD').AsString:= pTasa;
          ParamByName('peF_CALCULO').AsDateTime:= Objeto.F_INICIO.AsDateTime;
          ExecProc;
          if (ParamByName('PSRESULTADO').AsFloat = 0) then
            vlValor:= ParamByName('psVAL_TASA').AsString
          else
            showMessage('STPCALCTASAREFER: '+ ParamByName('PSTX_RESULTADO').AsString);
        finally
          Free;
        end;
      end;
    end;
    ValorTasa:= vlValor;
  end;
end;

procedure TWCrCatSol.GeneraConsulta;
var
  Q: TQuery;
begin
  Q:= GetSQLQuery(SQLComis, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
  try
    if Q <> nil then
    begin
      //COLUMNAS OCULTAS
      Q.FieldByName('CVE_TIPO_COM').Visible:= False;
      Q.FieldByName('CVE_COMIS_GPO').Visible:= False;
      //ASIGNACION DE ETIQUETAS
      Q.FieldByName('CVE_COMISION').DisplayLabel:= 'Cve' + #30 +'>C';
      Q.FieldByName('DESC_COMISION').DisplayLabel:= 'Desc' + #30 +'>C';
      Q.FieldByName('PCT_COMISION').DisplayLabel:= 'PCT COM' + #30 +'>C';
      Q.FieldByName('IMP_COMISION').DisplayLabel:= 'IMPORTE' + #30 +'>C';
      //ASIGNACION DE MASCARAS DE EDICION
      TNumericField(Q.FieldByName('IMP_COMISION')).DisplayFormat:= '###,###,###,##0.00';
      //ASIGNACION DE LONGITUD DE COLUMNAS
      Q.FieldByName('CVE_COMISION').DisplayWidth:= 8;
      Q.FieldByName('DESC_COMISION').DisplayWidth:= 30;
      Q.FieldByName('PCT_COMISION').DisplayWidth:= 10;
      Q.FieldByName('IMP_COMISION').DisplayWidth:= 10;
      SGCtrlComis.addQry(Q, True, True, -1, -1, -1, True);
    end
    else
      SGCtrlComis.Clear('NO EXISTEN MOVIMIENTOS'#30'>C');
    //end if
  finally
    if Q<>nil then
      Q.free;
  end;
end;

procedure TWCrCatSol.ArmaQueryComis;
var
  VLItera: Integer;
begin
  SQLComis:= ' SELECT CCC.CVE_COMISION,  ' +
               ' CCC.DESC_COMISION, ' +
               ' DECODE(CCC.CVE_COMISION ' ;
  for VLItera:= 1 to IndexArrayComis - 1 do
  begin
    SQLComis:= SQLComis + ',' + #39 + ArrayComisiones[VLItera] + #39 + ',' + ArrayPctComis[VLItera];
  end;
  SQLComis:= SQLComis +  ') PCT_COMISION, ' +
               ' DECODE(CCC.CVE_COMISION  ' ;
  for VLItera:= 1 to IndexArrayComis - 1 do
  begin
    SQLComis:= SQLComis + ',' + #39 + ArrayComisiones[VLItera] + #39 +',' + ArrayImpComis[VLItera];
  end;
  SQLComis:= SQLComis +  ') IMP_COMISION, ' +
               ' CCC.CVE_TIPO_COM, ' +
               ' CCRC.CVE_COMIS_GPO ' +
             ' FROM CR_CAT_COMISION CCC, CR_CAT_REL_COM CCRC';
  for VLItera:= 1 to IndexArrayComis - 1 do
  begin
    if VLItera = 1 then
      SQLComis:= SQLComis + ' WHERE (CCC.CVE_COMISION = ' + #39 + ArrayComisiones[VLItera] + #39
    else
      SQLComis:= SQLComis + ' OR CCC.CVE_COMISION = ' + #39 + ArrayComisiones[VLItera] + #39;
    //end if
  end;
  if IndexArrayComis - 1 >= 1 then
  begin
    SQLComis:= SQLComis + ')' +
               ' AND CCRC.CVE_COMISION = CCC.CVE_COMISION '
  end
  else
  begin
    SQLComis:= SQLComis + ' WHERE CCRC.CVE_COMISION = CCC.CVE_COMISION '
  end;
end;

procedure TWCrCatSol.LimpiaComisiones;
var  VLItera           : Integer;
//     IndexArrayComis   : Integer;
begin
  for VLItera:= 1 to IndexArrayComis - 1 do
  begin
    ArrayComisiones[VLItera]:= '';
    ArrayPctComis[VLItera]:= '';
    ArrayImpComis[VLItera]:= '';
  end;
  IndexArrayComis:= 1;
  Objeto.Comisiones.Active:= False;
  Objeto.TasaRefer.Active:= False;
  SGCtrlComis.Clear('REGISTRO DE COMISIONES'#30'>C');
end;

procedure TWCrCatSol.ValorTasaCred;
begin
  Objeto.SOBRETASA.GetFromControl;
  if Objeto.OPER_SOBRETASA.AsString = '+' then
    Objeto.TASA_ANUALIZADA.AsFloat:= StrToFloat(edTASA_REFERENCIA.Text) + Objeto.SOBRETASA.AsFloat
     else if Objeto.OPER_SOBRETASA.AsString = '-' then
        Objeto.TASA_ANUALIZADA.AsFloat := StrToFloat(edTASA_REFERENCIA.Text) - Objeto.SOBRETASA.AsFloat
     else if Objeto.OPER_SOBRETASA.AsString = '*' then
        Objeto.TASA_ANUALIZADA.AsFloat := StrToFloat(edTASA_REFERENCIA.Text) * Objeto.SOBRETASA.AsFloat
     else if Objeto.OPER_SOBRETASA.AsString = '/' then
        Objeto.TASA_ANUALIZADA.AsFloat := StrToFloat(edTASA_REFERENCIA.Text) / Objeto.SOBRETASA.AsFloat
     else
        Objeto.TASA_ANUALIZADA.AsFloat := StrToFloat(edTASA_REFERENCIA.Text) + Objeto.SOBRETASA.AsFloat;
end;

procedure TWCrCatSol.FormShow(Sender: TObject);
begin
  lbDempresa.Caption:= Objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption:= Objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption:= Objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption:= Objeto.ParamCre.PERFIL.AsString;
  Objeto.F_SOLICITUD.Control:= edF_SOLICITUD;
  Objeto.ID_SOL_CAT.Control:= edID_SOL_CAT;
  Objeto.CVE_PRODUCTO_CRE.Control:= edCVE_PRODUCTO_CRE;
  Objeto.IMP_SOLICITUD.Control:= edIMP_SOLICITUD;
  Objeto.F_INICIO.Control:= edF_INICIO;
  Objeto.F_FIN.Control:= edF_FIN;
  Objeto.DIAS_PLAZO.Control:= edDIAS_PLAZO;
  Objeto.NOMBRE.Control:= edNOMBRE;
  Objeto.CVE_MONEDA.Control:= edCVE_MONEDA;
  Objeto.CVE_AMORTIZACION.Control:= edCVE_AMORTIZACION;
  Objeto.CVE_PAGO_INTERES.Control:= edCVE_PAGO_INTERES;
  Objeto.UNIDAD_TIEMPO_CP.Control:= edUNIDAD_TIEMPO_CP;
  Objeto.UNIDAD_TIEMPO_IN.Control:= edUNIDAD_TIEMPO_IN;
  Objeto.CVE_TASA_REFER.Control:= edCVE_TASA_REFER;
  Objeto.OPER_SOBRETASA.Control:= edOPER_SOBRETASA;
  Objeto.SOBRETASA.Control:= edSOBRETASA;
  Objeto.TASA_ANUALIZADA.Control:= edTASA_ANUALIZADA;
  Objeto.CVE_TIPO_TASA.Control:= rgCVE_TIPO_TASA;
  Objeto.TASA_REFERENCIA.Control:= edTASA_REFERENCIA;
  Objeto.PCT_CAT.Control:= edPCT_CAT;
  Objeto.B_IMPRESA.Control:= chB_IMPRESA;
  Objeto.SIT_SOL_CAT.Control:= edSIT_SOL_CAT;
  Objeto.F_ALTA.Control:= edF_ALTA;
  Objeto.CVE_USU_ALTA.Control:= edCVE_USU_ALTA;
  Objeto.F_MODIFICA.Control:= edF_MODIFICA;
  Objeto.CVE_USU_MODIF.Control:= edCVE_USU_MODIF;
  Objeto.B_IVA.Control:= chB_IVA;
  Objeto.SISTEMA.Control:= edSISTEMA;
  Objeto.B_CAPITALIZA.Control:= cbBCapitaliza;
  Objeto.TasaRefer.CVE_TASA_INDICAD.Control:= edCVE_TASA_REFER;
  Objeto.TasaRefer.DESC_TASA_INDIC.Control:= edDESC_TASA_REFER;
  Objeto.Comisiones.CVE_COMISION.Control:= edCVE_COMISION;
  Objeto.Comisiones.DESC_COMISION.Control:= edDESC_COMISION;
  Objeto.TasaRefer.GetParams(Objeto);
  Objeto.Comisiones.GetParams(Objeto);
  IndexArrayComis:= 1;
  SetLength(ArrayComisiones, 6);
  SetLength(ArrayPctComis, 6);
  SetLength(ArrayImpComis, 6);
  InterForma1.MsgPanel:= MsgPanel;
  Objeto.Memo1:= Memo1;
  Objeto.Memo2:= Memo2;
  Objeto.Memo3:= Memo3;
  Objeto.Memo4:= Memo4;
  Objeto.Memo5:= Memo5;
end;

procedure TWCrCatSol.FormDestroy(Sender: TObject);
begin
  Objeto.F_SOLICITUD.Control:= nil;
  Objeto.ID_SOL_CAT.Control:= nil;
  Objeto.CVE_PRODUCTO_CRE.Control:= nil;
  Objeto.IMP_SOLICITUD.Control:= nil;
  Objeto.F_INICIO.Control:= nil;
  Objeto.F_FIN.Control:= nil;
  Objeto.DIAS_PLAZO.Control:= nil;
  Objeto.NOMBRE.Control:= nil;
  Objeto.CVE_MONEDA.Control:= nil;
  Objeto.CVE_AMORTIZACION.Control:= nil;
  Objeto.CVE_PAGO_INTERES.Control:= nil;
  Objeto.UNIDAD_TIEMPO_CP.Control:= nil;
  Objeto.UNIDAD_TIEMPO_IN.Control:= nil;
  Objeto.CVE_TASA_REFER.Control:= nil;
  Objeto.OPER_SOBRETASA.Control:= nil;
  Objeto.SOBRETASA.Control:= nil;
  Objeto.TASA_ANUALIZADA.Control:= nil;
  Objeto.CVE_TIPO_TASA.Control:= nil;
  Objeto.TASA_REFERENCIA.Control:= nil;
  Objeto.PCT_CAT.Control:= nil;
  Objeto.B_IMPRESA.Control:= nil;
  Objeto.SIT_SOL_CAT.Control:= nil;
  Objeto.F_ALTA.Control:= nil;
  Objeto.CVE_USU_ALTA.Control:= nil;
  Objeto.F_MODIFICA.Control:= nil;
  Objeto.CVE_USU_MODIF.Control:= nil;
  Objeto.B_IVA.Control:= nil;
  Objeto.SISTEMA.Control:= nil;
  Objeto.B_CAPITALIZA.Control:= nil;
  Objeto.TasaRefer.CVE_TASA_INDICAD.Control:= nil;
  Objeto.TasaRefer.DESC_TASA_INDIC.Control:= nil;
  Objeto.Comisiones.CVE_COMISION.Control:= nil;
  Objeto.Comisiones.DESC_COMISION.Control:= nil;
  //Objeto
end;

procedure TWCrCatSol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TWCrCatSol.InterForma1DespuesNuevo(Sender: TObject);
begin
  Objeto.F_INICIO.AsDateTime:= Objeto.Apli.DameFechaEmpresa;
  Objeto.F_FIN.AsDateTime:= Objeto.Apli.DameFechaEmpresa;
  dtpF_Inicio.Date:= Objeto.Apli.DameFechaEmpresa;
  dtpF_Fin.Date:= Objeto.Apli.DameFechaEmpresa + 360;
  edF_Inicio.text:= FormatDateTime('dd/mm/yyyy', dtpF_Inicio.Date);
  edF_FIN.text:= FormatDateTime('dd/mm/yyyy', dtpF_Fin.Date);
  Objeto.F_INICIO.DrawControl;
  Objeto.OPER_SOBRETASA.AsString:= '+';
  Objeto.SOBRETASA.AsString:= '0';
  Objeto.UNIDAD_TIEMPO_CP.AsInteger:= 2;
  Objeto.UNIDAD_TIEMPO_IN.AsInteger:= Objeto.UNIDAD_TIEMPO_CP.AsInteger;
  rgCVE_TIPO_TASA.ItemIndex:= 0;
  edUNIDAD_TIEMPO_CP.Text:= 'Mensual';
  Objeto.SIT_SOL_CAT.AsString:= 'SO';
  Objeto.CVE_MONEDA.AsInteger:= 484;
  Objeto.F_ALTA.AsDateTime:= Objeto.Apli.DameFechaEmpresa;
  Objeto.CVE_USU_ALTA.AsString:= Objeto.Apli.Usuario;
  Objeto.F_SOLICITUD.AsDateTime:= Objeto.Apli.DameFechaEmpresa;
  edDescProducto.Text:= '';
  chB_IMPRESA.Enabled:= False;
  IndexArrayComis:= 1;
  LimpiaComisiones;
  bbImprime.Enabled:= False;
  edTASA_REFERENCIA.Enabled:= False;
  edTASA_REFERENCIA.Color:= clBtnFace;
  edNombre.SetFocus;
  //</SST>
  btnCatNuevo.Enabled:= True; //SST15042011
  {Memo4.Enabled:= True; //SST18072011
  Memo4.ReadOnly:= False;}
  edTipoComision.Text:= ''; //SST210711 Validaciones
  edPerComision.Text:= '';
  ePctComision.Text:= '0';
  ieMonto.Text:= '0';
  //<SST/>
end;

procedure TWCrCatSol.InterForma1DespuesModificar(Sender: TObject);
begin
  bbImprime.Enabled:= False;
  edNombre.SetFocus;
end;

//procedure TWCrCatSol.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;
procedure TWCrCatSol.btPRODUCTOClick(Sender: TObject);
var
  T: TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRCATSOL_PRDCRE',True,True) then
   begin
      with Objeto do
      begin
        T:= CreaBuscador('ICrPrSub.IT', 'I');
        try
          T.ShowAll:= True;
          if T.Execute then
          begin
            //CVE_PRODUCTO_CRE, DESC_L_PRODUCTO, B_APLICA_IVA,  SISTEMA
            CVE_PRODUCTO_CRE.AsString:= T.DameCampo(0);
            edDescProducto.Text:= T.DameCampo(1);
            B_IVA.AsString:= T.DameCampo(2);
            SISTEMA.AsString:= T.DameCampo(2);
            B_CAPITALIZA.AsString:= DameProductoCapit(CVE_PRODUCTO_CRE.AsString);
            B_IVA.DrawControl;
            SISTEMA.DrawControl;
            B_CAPITALIZA.DrawControl;
            InterForma1.NextTab(btPRODUCTO);
          end;
        finally
          T.Free;
        end;
      end;
   end;
end;

procedure TWCrCatSol.bbAgregaClick(Sender: TObject);
var
  VLBExiste: Boolean;
  VLItera: Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRCATSOL_AGREG',True,True) then
   begin
      if Length(Objeto.Comisiones.CVE_COMISION.AsString) = 0 then
      begin
        ShowMessage('Es Necesario Seleccionar una Comisión para Agregar a la Lista.');
        edCVE_COMISION.SetFocus;
      end
      else
      begin
        VLBExiste:= False;
        //valida que existe la comisión
        if VLItera  > 1 then
        begin
          for VLItera:= 1 to IndexArrayComis - 1 do
          begin
            if ArrayComisiones[VLItera] = Objeto.Comisiones.CVE_COMISION.AsString then
              VLBExiste:= True;
          end;
        end;
        if not(VLBExiste) then
        begin
          if IndexArrayComis < 7 then
          begin
            ArrayComisiones[IndexArrayComis]:= Objeto.Comisiones.CVE_COMISION.AsString;
            ArrayPctComis[IndexArrayComis]:= ePctComision.Text;
            if StrToFloat(ePctComision.Text) <> 0 then
    //          ArrayImpComis[IndexArrayComis]:= FormatFloat('###,###,###,##0.00', ((StrToFloat(ePctComision.Text) * StrToFloat(edIMP_SOLICITUD.Text))/100))
              ArrayImpComis[IndexArrayComis]:= FloatToStr((StrToFloat(ePctComision.Text) * StrToFloat(edIMP_SOLICITUD.Text))/100)
            else
              ArrayImpComis[IndexArrayComis]:= ieMonto.Text;
            IndexArrayComis:= IndexArrayComis + 1;
            ArmaQueryComis;
            GeneraConsulta;
          end
          else
            ShowMessage('Solo puede registrar hasta 6 comisiones en el simulador');
        end
        else
          ShowMessage('La Comisión ya Existe');
         //end if
      end;
   end;
end;

procedure TWCrCatSol.sbBorraClick(Sender: TObject);
var
   Y          :  Integer;
   X          :  Integer;
   VLItera    :  Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRCATSOL_ELIM',True,True) then
   begin
      X:= SGCtrlComis.SG.Selection.Left;
      Y:= SGCtrlComis.SG.Selection.Top;
      for VLItera:= 1 to IndexArrayComis - 1 do
      begin
        if ArrayComisiones[VLItera] = SGCtrlComis.CellStr['CVE_COMISION', Y] then
          ArrayComisiones[VLItera]:= 'XXX';
      end;
      ArmaQueryComis;
      GeneraConsulta;
   end;
end;

procedure TWCrCatSol.edNOMBREExit(Sender: TObject);
var
  VLTxt: String;
  VLValida: Boolean;
begin
  VLTxt:= '';
  VLValida:= True;
  Objeto.NOMBRE.GetFromControl;
  if Length(Objeto.NOMBRE.AsString) = 0 then
  begin
    VLTxt:= 'El Nombre es Campo Obligatorio';
    VLValida:= False;
  end;
  InterForma1.ValidaExit(edNombre, VLValida, VLTxt, True);
end;

procedure TWCrCatSol.edIMP_SOLICITUDExit(Sender: TObject);
var
  VLTxt: String;
  VLValida: Boolean;
begin
  VLTxt:= '';
  VLValida:= True;
  Objeto.IMP_SOLICITUD.GetFromControl;
  if Objeto.IMP_SOLICITUD.AsFloat = 0 then
  begin
    VLTxt:= 'El Importe no Puede ser Igual a 0';
    VLValida:= False;
  end;
  InterForma1.ValidaExit(edIMP_SOLICITUD, VLValida, VLTxt, True);
end;

procedure TWCrCatSol.btTASA_REFERClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCATSOL_TASARF',True,True) then
   begin
      Objeto.TasaRefer.ShowAll:= True;
      if Objeto.TasaRefer.Busca then
        InterForma1.NextTab(btTASA_REFER);
      //end if
   end;
end;

procedure TWCrCatSol.edOPER_SOBRETASAExit(Sender: TObject);
begin
  Objeto.OPER_SOBRETASA.AsString:= edOPER_SOBRETASA.Text; //SST250711 Correccion Sobre Tasa
  ValorTasaCred;
  InterForma1.ValidaExit(edOPER_SOBRETASA, True, '', True);
end;

procedure TWCrCatSol.edOPER_SOBRETASAKeyPress(Sender: TObject;  var Key: Char);
begin
  //</SST250711> Solamente operador + y *
  if not((key = Char(42)) or (key = Char(43)) or (key = Char(8)) or (key = Char(13))) then
  begin
    Key:= Char(0);
    InterForma1.ShowMsgPanel('Solo se permiten + , * ');
  end;
  //<SST/>
end;

procedure TWCrCatSol.edF_INICIOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_Inicio, True, '', True);
end;

procedure TWCrCatSol.edF_FINExit(Sender: TObject);
begin
  Objeto.F_FIN.GetFromControl;
  Objeto.F_INICIO.GetFromControl;
  Objeto.DIAS_PLAZO.AsInteger:= Objeto.F_FIN.AsInteger - Objeto.F_INICIO.AsInteger;
  Objeto.DIAS_PLAZO.DrawControl;
  InterForma1.ValidaExit(edF_FIN, True, '', True);
end;

procedure TWCrCatSol.edCVE_AMORTIZACIONClick(Sender: TObject);
begin
  Objeto.CVE_AMORTIZACION.AsInteger:= edCVE_AMORTIZACION.ItemIndex;
end;

procedure TWCrCatSol.edCVE_AMORTIZACIONExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edCVE_AMORTIZACION, True, '', True);
end;

procedure TWCrCatSol.edCVE_PAGO_INTERESClick(Sender: TObject);
begin
  Objeto.CVE_PAGO_INTERES.AsInteger:= edCVE_PAGO_INTERES.ItemIndex;
end;

procedure TWCrCatSol.edCVE_PAGO_INTERESExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edCVE_PAGO_INTERES, True, '', True);
end;

procedure TWCrCatSol.edUNIDAD_TIEMPO_CPExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edUNIDAD_TIEMPO_CP, True, '', True);
end;

procedure TWCrCatSol.edCVE_COMISIONEnter(Sender: TObject);
begin
  Objeto.Comisiones.FilterString:= ' (CVE_COMISION IN (SELECT CVE_COMISION FROM CR_CAT_REL_COM))';
  Objeto.Comisiones.BuscaWhereString:= ' (CVE_COMISION IN (SELECT CVE_COMISION FROM CR_CAT_REL_COM))'; //SST220611 Para usar todas las comisiones
end;

procedure TWCrCatSol.edCVE_COMISIONExit(Sender: TObject);
begin
  InterForma1.ValidaExit(btCOMISION, True, '', True);
end;

procedure TWCrCatSol.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
  Realizado:= True;
  if IsNewData then
  begin
    try
      {if edUNIDAD_TIEMPO_CP.Text = 'Semanal' then
        Objeto.UNIDAD_TIEMPO_CP.AsInteger:= 0;
      if edUNIDAD_TIEMPO_CP.Text = 'Quincenal' then
         Objeto.UNIDAD_TIEMPO_CP.AsInteger:= 1;
      if edUNIDAD_TIEMPO_CP.Text = 'Mensual' then
         Objeto.UNIDAD_TIEMPO_CP.AsInteger:= 2;
      if edUNIDAD_TIEMPO_CP.Text = 'Bimestral' then
          Objeto.UNIDAD_TIEMPO_CP.AsInteger:= 3;
      if edUNIDAD_TIEMPO_CP.Text = 'Trimestral' then
          Objeto.UNIDAD_TIEMPO_CP.AsInteger:= 4;
      if edUNIDAD_TIEMPO_CP.Text = 'Cuatrimetral' then
         Objeto.UNIDAD_TIEMPO_CP.AsInteger:= 5;
      if edUNIDAD_TIEMPO_CP.Text = 'Semestral' then
         Objeto.UNIDAD_TIEMPO_CP.AsInteger:= 6;
      if edUNIDAD_TIEMPO_CP.Text = 'Anual' then
         Objeto.UNIDAD_TIEMPO_CP.AsInteger:= 7;
      //end if
      Objeto.UNIDAD_TIEMPO_IN.AsInteger:= Objeto.UNIDAD_TIEMPO_CP.AsInteger;
      Objeto.CVE_AMORTIZACION.AsInteger:= edCVE_AMORTIZACION.ItemIndex;
      Objeto.CVE_PAGO_INTERES.AsInteger:= edCVE_PAGO_INTERES.ItemIndex;}
      Objeto.ID_SOL_CAT.AsInteger:= DameFolioCat;
      if MessageDlg('El CAT Obtenido fue: ' + Objeto.PCT_CAT.AsString + ' ¿Desea Guardar el Registro? ',
                     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        Realizado:= False
      else
        Realizado:= True;
      //end if
    except
      on E: Exception do
      begin
        ShowMessage('Error al Cálcular CAT, Por Favor Intentelo más Tarde 03.');
        ShowMessage(E.Message);
      end;
    end;
  end;
end;

procedure TWCrCatSol.ilTASA_REFEREjecuta(Sender: TObject);
begin
  if Objeto.TasaRefer.FindKey([ilTASA_REFER.Buffer]) then
    InterForma1.NextTab(edCVE_TASA_REFER);
   //end if
end;


procedure TWCrCatSol.bbAgregaExit(Sender: TObject);
begin
  InterForma1.ValidaExit(bbAgrega, True, '', True);
end;

procedure TWCrCatSol.sbBorraExit(Sender: TObject);
begin
  InterForma1.ValidaExit(sbBorra, True, '', True);
end;


procedure TWCrCatSol.edSOBRETASAExit(Sender: TObject);
var
  VLTxt: String;
  VLValida: Boolean;
begin
  VLTxt:= '';
  VLValida:= True;
  Objeto.SOBRETASA.GetFromControl;
  if Objeto.SOBRETASA.AsInteger < 0 then
  begin
    VLTxt:= 'La Sobretasa no Puede ser Menor a Cero.';
    VLValida:= False;
  end;
  if VLValida then
    ValorTasaCred;
  //en dif
  InterForma1.ValidaExit(edSOBRETASA, VLValida, VLTxt, True);
end;

procedure TWCrCatSol.btPRODUCTOExit(Sender: TObject);
var
  VLTxt: String;
  VLValida: Boolean;
begin
  VLTxt:= '';
  VLValida:= True;
  Objeto.CVE_PRODUCTO_CRE.GetFromControl;
  if Length(Objeto.CVE_PRODUCTO_CRE.AsString) = 0 then
  begin
    VLTxt:= 'El Producto es Campo Obligatorio';
    VLValida:= False;
  end;
  InterForma1.ValidaExit(btPRODUCTO, VLValida, VLTxt, True);
end;

procedure TWCrCatSol.edCVE_TASA_REFERExit(Sender: TObject);
var
  VLValida: Boolean;
  VLTxt: String;
begin
  VLTxt:= '';
  VLValida:= True;
  Objeto.CVE_TASA_REFER.GetFromControl;
  Objeto.F_INICIO.GetFromControl;
  Objeto.SOBRETASA.GetFromControl;
  if Length(Objeto.CVE_TASA_REFER.AsString) = 0 then
  begin
    VLValida:= False;
    VLTxt:= 'La Tasa de Referencia es Campo Obligatorio';
  end;
  if VLValida then
  begin
    Objeto.F_INICIO.GetFromControl;
    Objeto.TASA_REFERENCIA.AsString:= ValorTasa(Objeto.CVE_TASA_REFER.AsString);
    Objeto.CVE_TASA_REFER.DrawControl;
    ValorTasaCred;
  end;
  InterForma1.ValidaExit(edCVE_TASA_REFER,VLValida,VLTxt,True);
end;

procedure TWCrCatSol.ePctComisionExit(Sender: TObject);
var
  VLTxt: String;
  VLValida: Boolean;
begin
  VLTxt:= '';
  VLValida:= True;
  if ((Length(Objeto.Comisiones.CVE_COMISION.AsString) = 0) and (StrToFloat(ePctComision.Text) > 0)) then
  begin
   VLTxt:= 'Es Necesario Seleccionar una Comisión para Registrar este Campo.';
   VLValida:= False;
  end;
  if ((Length(Objeto.Comisiones.CVE_COMISION.AsString) > 0) and (StrToFloat(ePctComision.Text) = 0)) then
  begin
   VLTxt:= 'El Porcentaje de Comisión debe ser Mayor a Cero.';
   VLValida:= False;
  end;
  if ((Length(Objeto.Comisiones.CVE_COMISION.AsString) = 0) and (Objeto.Comisiones.CVE_COMISION.AsString <> 'CUFEGA')) then
    edMontoPorcComis.Text:= FormatFloat('###,###,##0.00', StrToFloat(ePctComision.Text) * Objeto.IMP_SOLICITUD.AsFloat / 100)
  else
  begin
    if (Length(Objeto.Comisiones.CVE_COMISION.AsString) = 0) then
      edMontoPorcComis.Text:= '0';
  end;
  InterForma1.ValidaExit(ePctComision, VLValida, VLTxt, True);
end;

procedure TWCrCatSol.ieMontoExit(Sender: TObject);
var
  VLTxt: String;
  VLValida: Boolean;
begin
  VLTxt:= '';
  VLValida:= True;
  if ((Length(Objeto.Comisiones.CVE_COMISION.AsString) = 0) and (StrToFloat(ieMonto.Text) > 0)) then
  begin
    VLTxt:= 'Es Necesario Seleccionar una Comisión para Registrar este Campo.';
    VLValida:= False;
  end;
  if ((Length(Objeto.Comisiones.CVE_COMISION.AsString) > 0) and (StrToFloat(ieMonto.Text) = 0)) then
  begin
    VLTxt:= 'El Monto de la Comisión debe ser Mayor a Cero.';
    VLValida:= False;
  end;
  InterForma1.ValidaExit(ieMonto, VLValida, VLTxt, True);
end;

procedure TWCrCatSol.bbCATExit(Sender: TObject);
begin
  InterForma1.ValidaExit(bbCAT, True, '', True);
end;

procedure TWCrCatSol.InterForma1DespuesAceptar(Sender: TObject);
var
  Y, X, MAX, VLCont: Integer;
begin
  try
    X:= SGCtrlComis.SG.Selection.Left;
    Y:= SGCtrlComis.SG.Selection.Top;
    MAX:= SGCtrlComis.SG.RowCount;
    for VLCont:= 1 to MAX - 1 do
    begin
      RunSQL(' BEGIN ' +
             ' INSERT INTO CR_CAT_SOL_COM VALUES ('+ Objeto.ID_SOL_CAT.AsString +
                                                  ','+#39+ SGCtrlComis.CellStr['CVE_COMISION',VLCont] +#39+
                                                  ','+ StringReplace(SGCtrlComis.CellStr['IMP_COMISION',VLCont],',','',[rfIgnoreCase, rfReplaceAll]) +
                                                  ','+ SGCtrlComis.CellStr['PCT_COMISION',VLCont] +');  COMMIT; '+
             ' END;', Objeto.DataBaseName, Objeto.SessionName, True);
    end;
    bbImprime.Enabled:= True;
  except
    on E: Exception do
    begin
      ShowMessage('Error al Cálcular CAT, Por Favor Intentelo más Tarde 04.');
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TWCrCatSol.ilCOMISIONEjecuta(Sender: TObject);
begin
  if Objeto.Comisiones.FindKey([ilCOMISION.Buffer]) then
  begin
    AsigTipCalcComis;
    InterForma1.NextTab(edCVE_COMISION);
  end;
end;

procedure TWCrCatSol.btCOMISIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCATSOL_COMIS',True,True) then
   begin
      edCVE_COMISION.Text:= '';
      edDESC_COMISION.Text:= '';
      edTipoComision.Text:= '';
      edPerComision.Text:= '';
      ePctComision.Text:= '';
      ieMonto.Text:= '';
      edMontoPorcComis.Text:= '';
      Objeto.Comisiones.FilterString:= ' (CVE_COMISION IN (SELECT CVE_COMISION FROM CR_CAT_REL_COM))';
      Objeto.Comisiones.BuscaWhereString:= ' (CVE_COMISION IN (SELECT CVE_COMISION FROM CR_CAT_REL_COM))';//SST220611 Todas las Comisiones
      Objeto.Comisiones.ShowAll:= True;
      if Objeto.Comisiones.Busca then
      begin
        AsigTipCalcComis;
        InterForma1.NextTab(edCVE_COMISION);
      end;
   end;
end;


procedure TWCrCatSol.AsigTipCalcComis;
var
  sSQL, VLB_PORCENTAJE, VLCVE_COMIS_GPO: String;
  qyQuery: TQuery;
begin
  if Length(Objeto.Comisiones.CVE_COMISION.AsString) > 0 then
  begin
    //Busca en la tabla de relación de comisiones si aplica porcentaje
    VLB_PORCENTAJE:= 'F';
    edTipoComision.Text:= '(--)';
    edPerComision.Text:= '(--)';
    sSQL:= 'SELECT B_PORCENTAJE, CVE_COMIS_GPO FROM CR_CAT_REL_COM WHERE CVE_COMISION = ' + Objeto.Comisiones.CVE_COMISION.AsSQL ;
    qyQuery:= GetSQLQuery(sSQL, Objeto.DataBaseName, Objeto.SessionName, False);
    try
      if qyQuery <> Nil then
      begin
        VLB_PORCENTAJE:= qyQuery.FieldByName('B_PORCENTAJE').AsString;
        VLCVE_COMIS_GPO:= qyQuery.FieldByName('CVE_COMIS_GPO').AsString;
      end;
    finally
      qyQuery.Free;
    end;
    //habilita campo de captura para comisión por porcentaje o por importe
    if VLB_PORCENTAJE = 'V' then
    begin
      ieMonto.Enabled:= True;
      ieMonto.Text:= '0';
      ieMonto.Enabled:= False;
      ePctComision.Enabled:= True;
      ePctComision.Text:= Objeto.Comisiones.PCT_COMISION.AsString;
      edTipoComision.Text:= 'X Porcentaje';
    end
    else
    begin
      ePctComision.Enabled:= True;
      ePctComision.Text:= '0';
      ePctComision.Enabled:= False;
      ieMonto.Enabled:= True;
      ieMonto.Text:= Objeto.Comisiones.IMP_COMISION.AsString;
      edTipoComision.Text:= 'X Monto';
    end;
    //Asigna periodicidad en base a Calculo CAT
    if ((VLCVE_COMIS_GPO = 'COMAPE') or (VLCVE_COMIS_GPO = 'COMEST') or (VLCVE_COMIS_GPO = 'COMDIS') or (VLCVE_COMIS_GPO = 'COMFEG')) then
      edPerComision.Text:= 'Al Inicio';
    //end if;
    if ((VLCVE_COMIS_GPO = 'COMANI') or (VLCVE_COMIS_GPO = 'COMOTR') or (VLCVE_COMIS_GPO = 'SEGVID') or (VLCVE_COMIS_GPO = 'SEGDAN')) then
      edPerComision.text:= 'Periodica';
    //end if;
  end
  else
  begin
    ePctComision.Enabled:= True;
    ePctComision.Text:= '0';
    ePctComision.Enabled:= False;
    ieMonto.Enabled:= True;
    ieMonto.Text:= '0';
    ieMonto.Enabled:= False;
    edTipoComision.Text:= '(--)';
    edPerComision.Text:= '(--)';
  end;
end;


procedure TWCrCatSol.bbImprimeClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCATSOL_IMPCAT',True,True) then
   begin
      if Objeto.Active then
        RepCostAmrt(Objeto.ID_SOL_CAT.AsString, Objeto.Apli, True)
      else
        ShowMessage('Debe Seleccionar una Solicitud');
      //end if
   end;
end;

procedure TWCrCatSol.bbCATClick(Sender: TObject);
var
  VLCat, VLCOMAPE, VLCOMEST, VLCOMDIS, VLCOMANI, VLCOMFEG, VLCOMOTR,
  VLSEGVID, VLSEGDAN, VLSEGANU, VLESPRIN, VLIMOTCO: Double;
  Y, X, MAX, VLCont: Integer;
begin
     VLCOMAPE:= 0;
     VLCOMEST:= 0;
     VLCOMDIS:= 0;
     VLCOMANI:= 0;
     VLCOMFEG:= 0;
     VLCOMOTR:= 0;
     VLSEGVID:= 0;
     VLSEGDAN:= 0;
     VLSEGANU:= 0;
     VLESPRIN:= 0;
     VLIMOTCO:= 0;
     VLCat:=0;
     try
         X:= SGCtrlComis.SG.Selection.Left;
         Y:= SGCtrlComis.SG.Selection.Top;
         MAX:= SGCtrlComis.SG.RowCount;
         for VLCont:= 1 to MAX - 1 do
         begin
              if SGCtrlComis.CellStr['CVE_COMIS_GPO',VLCont] = 'COMAPE' then
                 VLCOMAPE:= StrToFloat(StringReplace(SGCtrlComis.CellStr['PCT_COMISION',VLCont],',','',[rfIgnoreCase, rfReplaceAll]))
              else if SGCtrlComis.CellStr['CVE_COMIS_GPO',VLCont] = 'COMEST' then
                 VLCOMEST:= StrToFloat(StringReplace(SGCtrlComis.CellStr['PCT_COMISION',VLCont],',','',[rfIgnoreCase, rfReplaceAll]))
              else if SGCtrlComis.CellStr['CVE_COMIS_GPO',VLCont] = 'COMDIS' then
                 VLCOMDIS:= StrToFloat(StringReplace(SGCtrlComis.CellStr['PCT_COMISION',VLCont],',','',[rfIgnoreCase, rfReplaceAll]))
              else if SGCtrlComis.CellStr['CVE_COMIS_GPO',VLCont] = 'COMANI' then
                 VLCOMANI:= StrToFloat(StringReplace(SGCtrlComis.CellStr['PCT_COMISION',VLCont],',','',[rfIgnoreCase, rfReplaceAll]))
              else if SGCtrlComis.CellStr['CVE_COMIS_GPO',VLCont] = 'COMFEG' then
                 VLCOMFEG:= StrToFloat(StringReplace(SGCtrlComis.CellStr['PCT_COMISION',VLCont],',','',[rfIgnoreCase, rfReplaceAll]))
              else if SGCtrlComis.CellStr['CVE_COMIS_GPO',VLCont] = 'COMOTR' then
                 VLCOMOTR:= StrToFloat(StringReplace(SGCtrlComis.CellStr['PCT_COMISION',VLCont],',','',[rfIgnoreCase, rfReplaceAll]))
              else if SGCtrlComis.CellStr['CVE_COMIS_GPO',VLCont] = 'SEGVID' then
                 VLSEGVID:= StrToFloat(StringReplace(SGCtrlComis.CellStr['IMP_COMISION',VLCont],',','',[rfIgnoreCase, rfReplaceAll]))
              else if SGCtrlComis.CellStr['CVE_COMIS_GPO',VLCont] = 'SEGDAN' then
                 VLSEGDAN:= StrToFloat(StringReplace(SGCtrlComis.CellStr['IMP_COMISION',VLCont],',','',[rfIgnoreCase, rfReplaceAll]))
              else if SGCtrlComis.CellStr['CVE_COMIS_GPO',VLCont] = 'SEGANU' then
                 VLSEGANU:= StrToFloat(StringReplace(SGCtrlComis.CellStr['IMP_COMISION',VLCont],',','',[rfIgnoreCase, rfReplaceAll]))
              else if SGCtrlComis.CellStr['CVE_COMIS_GPO',VLCont] = 'ESPRIN' then
                 VLESPRIN:= StrToFloat(StringReplace(SGCtrlComis.CellStr['IMP_COMISION',VLCont],',','',[rfIgnoreCase, rfReplaceAll]))
              else if SGCtrlComis.CellStr['CVE_COMIS_GPO',VLCont] = 'IMOTCO' then
                 VLIMOTCO:= StrToFloat(StringReplace(SGCtrlComis.CellStr['IMP_COMISION',VLCont],',','',[rfIgnoreCase, rfReplaceAll]));
              //end if
         end;
     except
          on E: Exception do
          begin
               VLCat:=0;
               ShowMessage('Error al Cálcular CAT, Por Favor Intentelo más Tarde 05.');
               ShowMessage(E.Message);
          end;
     end;


     Objeto.IMP_SOLICITUD.GetFromControl;
     Objeto.TASA_ANUALIZADA.GetFromControl;
     Objeto.F_INICIO.GetFromControl;
     Objeto.F_FIN.GetFromControl;
     Objeto.CVE_AMORTIZACION.GetFromControl;
     Objeto.CVE_PAGO_INTERES.GetFromControl;
     Objeto.UNIDAD_TIEMPO_CP.GetFromControl;
     Objeto.B_IVA.GetFromControl;


     try
         Objeto.CalculaCATSimulador(Objeto.IMP_SOLICITUD.AsFloat,
                                    Objeto.TASA_ANUALIZADA.AsFloat,
                                    dtpF_Inicio.Date,
                                    dtpF_Fin.Date,
                                    Objeto.CVE_AMORTIZACION.AsInteger,
                                    Objeto.CVE_PAGO_INTERES.AsInteger,
                                    Objeto.UNIDAD_TIEMPO_CP.AsInteger,
                                    0,
                                    0,
                                    Objeto.B_IVA.AsString,
                                    VLCOMAPE,
                                    VLCOMDIS,
                                    VLCOMEST,
                                    VLCOMANI,
                                    VLCOMFEG,
                                    VLCOMOTR,
                                    VLSEGVID,
                                    VLSEGDAN,
                                    VLSEGANU,
                                    VLESPRIN,
                                    VLIMOTCO);
     except
          on E: Exception do
          begin
               VLCat :=0;
               ShowMessage('Error al Cálcular CAT, Por Favor Intentelo más Tarde 06.');
               ShowMessage(E.Message);
          end;
     end;

    //Objeto.PCT_CAT.AsFloat:= 1;

     Objeto.PCT_CAT.DrawControl;

end;

procedure TWCrCatSol.edUNIDAD_TIEMPO_CPChange(Sender: TObject);
begin
     if edUNIDAD_TIEMPO_CP.Text = 'Semanal' then
        Objeto.UNIDAD_TIEMPO_CP.AsInteger:= 0;
     if edUNIDAD_TIEMPO_CP.Text = 'Quincenal' then
        Objeto.UNIDAD_TIEMPO_CP.AsInteger:= 1;
     if edUNIDAD_TIEMPO_CP.Text = 'Mensual' then
        Objeto.UNIDAD_TIEMPO_CP.AsInteger:= 2;
     if edUNIDAD_TIEMPO_CP.Text = 'Bimestral' then
        Objeto.UNIDAD_TIEMPO_CP.AsInteger:= 3;
     if edUNIDAD_TIEMPO_CP.Text = 'Trimestral' then
        Objeto.UNIDAD_TIEMPO_CP.AsInteger:= 4;
     if edUNIDAD_TIEMPO_CP.Text = 'Cuatrimetral' then
        Objeto.UNIDAD_TIEMPO_CP.AsInteger:= 5;
     if edUNIDAD_TIEMPO_CP.Text = 'Semestral' then
        Objeto.UNIDAD_TIEMPO_CP.AsInteger:= 6;
     if edUNIDAD_TIEMPO_CP.Text = 'Anual' then
        Objeto.UNIDAD_TIEMPO_CP.AsInteger:= 7;

     Objeto.UNIDAD_TIEMPO_IN.AsInteger:= Objeto.UNIDAD_TIEMPO_CP.AsInteger;
end;

procedure TWCrCatSol.rgCVE_TIPO_TASAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(rgCVE_TIPO_TASA, True, '', True);
end;

procedure TWCrCatSol.rgCVE_TIPO_TASAClick(Sender: TObject);
begin
  //VARIABLE
  if rgCVE_TIPO_TASA.ItemIndex = 0 then
  begin
    edCVE_TASA_REFER.Enabled:= True;
    edCVE_TASA_REFER.Color:= clWindow;
    btTASA_REFER.Enabled:= True;
    edTASA_REFERENCIA.Enabled:= False;
    edTASA_REFERENCIA.Color:= clBtnFace;
  end;
  //FIJA
  if rgCVE_TIPO_TASA.ItemIndex = 1 then
  begin
    edCVE_TASA_REFER.Enabled:= False;
    edCVE_TASA_REFER.Color:= clBtnFace;
    btTASA_REFER.Enabled:= False;
    edTASA_REFERENCIA.Enabled:= True;
    edTASA_REFERENCIA.Color:= clWindow;
    edCVE_TASA_REFER.Text:= '';
    edDESC_TASA_REFER.Text:= '';
    edTASA_REFERENCIA.Text:= '0';
    Objeto.TasaRefer.Active:= False;
  end;
end;

function TWCrCatSol.TIR(pLineaTiempo: TArrayDouble; pPeriodos: Integer): Double;
var
  vlTirMayor, vlTirMenor, vlTirTemp, vlTir, vlIncremental, vlTirAnt, x: Double;
  i, vlBan: Integer;
begin
  vlBan:= 0;
  vlTir:= 0.01;
  vlTirTemp:= 0;
  vlTirMayor:= 0;
  vlTirMenor:= 0;
  x:= 0;
  repeat
    vlTirAnt:= vlTirTemp;
    vlTirTemp:= 0;
    for i:= 0 to pPeriodos do
    begin
      x:= pLineaTiempo[i] / Power(1 + vlTir, i);
      vlTirTemp:= vlTirTemp + x;
    end;
    //vlTirTemp:=
    if vlTirTemp > 0 then
      vlTirMenor:= vlTir;
    if vlTirTemp < 0 then
      vlTirMayor:= vlTir;
    if ((vlTirMayor <> 0) and (vlTirMenor <> 0)) then
    begin
      vlIncremental:= ((vlTirMayor - vlTirMenor) / (vlTirTemp - vlTirAnt)) * -1 * vlTirAnt;
      vlTir:= vlTirMenor + vlIncremental;
      vlBan:= 1;
    end;
    if vlTirTemp = 0 then
    begin
      vlBan:= 1;
    end
    else
    begin
      if vlBan <> 1 then
        vlTir:= vlTir + 0.01;
    end;
  until vlBan = 1;
  Result:= vlTir;
end;

procedure TWCrCatSol.btnCatNuevoClick(Sender: TObject);
var
  vlCOMAPE, vlCOMEST, vlCOMDIS, vlCOMANI, vlCOMFEG, vlCOMOTR,
  vlSEGVID, vlSEGDAN, vlSEGANU, vlESPRIN, vlIMOTCO: Double;
  Y, X, MAX, vlCont: Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRCATSOL_CALCAT',True,True) then
   begin
      Memo4.Enabled:= True;
      Memo4.ReadOnly:= False;
    {var
      vlAux, vlCat, vlFormula, vlCapital, vlTasa, vlPagCap, vlInteresTotal,
      vlTir: Double;
      vlMontosIn, vlMontosCa, vlMontosPa: TArrayDouble;
      i, vlPeriodos: Integer;
    begin
      vlCapital:= StrToFloat(edIMP_SOLICITUD.Text);
      vlTasa:= StrToFloat(edTASA_REFERENCIA.Text) * 0.01;
      vlPeriodos:= Trunc(StrToDate(edF_FIN.Text) - StrToDate(edF_INICIO.Text));
      vlInteresTotal:= 0;
      //vlPeriodos:= Trunc(vlPeriodos/Objeto.UNIDAD_TIEMPO_CP.AsInteger); //30 si es mensual
      vlPeriodos:= Trunc(vlPeriodos/30);
      vlPagCap:= vlCapital / vlPeriodos;
      vlFormula:= StrToFloat(edIMP_SOLICITUD.Text) * -1;
      SetLength(vlMontosIn, vlPeriodos + 1);
      SetLength(vlMontosCa, vlPeriodos + 1);
      SetLength(vlMontosPa, vlPeriodos + 1);
      vlAux:= vlCapital+vlPagCap;
      for i:= 0 to vlPeriodos do
      begin
        vlMontosCa[i]:= vlAux - vlPagCap;
        vlAux:= vlMontosCa[i];
      end;
      for i:= 0 to vlPeriodos do
      begin
        vlMontosIn[i]:= vlMontosCa[i] * vlTasa;
        //vlInteresTotal:= vlInteresTotal + vlMontosIn[i];
      end;
      vlInteresTotal:= (vlCapital*vlTasa) / vlPeriodos;
      vlMontosPa[0]:= vlCapital * -1;
      for i:= 1 to vlPeriodos do
      begin
        vlMontosPa[i]:= vlInteresTotal + vlPagCap;
      end;
      vlTir:= TIR(vlMontosPa, vlPeriodos);
      vlCat:= Power(1 + vlTir, 12) - 1;
      vlCat:= vlCat / 0.01;
      edPCT_CAT.Text:= FloatToStr(vlCat);
    end;}

      vlCOMAPE:= 0;
      vlCOMEST:= 0;
      vlCOMDIS:= 0;
      vlCOMANI:= 0;
      vlCOMFEG:= 0;
      vlCOMOTR:= 0;
      vlSEGVID:= 0;
      vlSEGDAN:= 0;
      vlSEGANU:= 0;
      vlESPRIN:= 0;
      vlIMOTCO:= 0;
      try
        X:= SGCtrlComis.SG.Selection.Left;
        Y:= SGCtrlComis.SG.Selection.Top;
        MAX:= SGCtrlComis.SG.RowCount;
        //SST240611 Se Agrega Condición Para Escoger Comisión o Porcentaje Dependiendo de la BD
        for vlCont:= 1 to MAX - 1 do
        begin
          if SGCtrlComis.CellStr['CVE_COMIS_GPO', vlCont] = 'COMAPE' then
          begin
            vlCOMAPE:= StrToFloat(StringReplace(SGCtrlComis.CellStr['PCT_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
            if vlCOMAPE = 0 then
              vlCOMAPE:= StrToFloat(StringReplace(SGCtrlComis.CellStr['IMP_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
          end;
          if SGCtrlComis.CellStr['CVE_COMIS_GPO', vlCont] = 'COMDIS' then
          begin
            vlCOMDIS:= StrToFloat(StringReplace(SGCtrlComis.CellStr['PCT_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
            if vlCOMDIS = 0 then
              vlCOMDIS:= StrToFloat(StringReplace(SGCtrlComis.CellStr['IMP_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
          end;
          if SGCtrlComis.CellStr['CVE_COMIS_GPO', vlCont] = 'COMEST' then
          begin
            vlCOMEST:= StrToFloat(StringReplace(SGCtrlComis.CellStr['PCT_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
            if vlCOMEST = 0 then
              vlCOMEST:= StrToFloat(StringReplace(SGCtrlComis.CellStr['IMP_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
          end;
          if SGCtrlComis.CellStr['CVE_COMIS_GPO', vlCont] = 'COMANI' then
          begin
            vlCOMANI:= StrToFloat(StringReplace(SGCtrlComis.CellStr['PCT_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
            if vlCOMANI = 0 then
              vlCOMANI:= StrToFloat(StringReplace(SGCtrlComis.CellStr['IMP_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
          end;
          if SGCtrlComis.CellStr['CVE_COMIS_GPO', vlCont] = 'COMFEG' then
          begin
            vlCOMFEG:= StrToFloat(StringReplace(SGCtrlComis.CellStr['PCT_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
            if vlCOMFEG = 0 then
              vlCOMFEG:= StrToFloat(StringReplace(SGCtrlComis.CellStr['IMP_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
          end;
          if SGCtrlComis.CellStr['CVE_COMIS_GPO', vlCont] = 'COMOTR' then
          begin
            vlCOMOTR:= StrToFloat(StringReplace(SGCtrlComis.CellStr['PCT_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
            if vlCOMOTR = 0 then
              vlCOMOTR:= StrToFloat(StringReplace(SGCtrlComis.CellStr['IMP_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
          end;
          if SGCtrlComis.CellStr['CVE_COMIS_GPO', vlCont] = 'SEGVID' then
          begin
            vlSEGVID:= StrToFloat(StringReplace(SGCtrlComis.CellStr['PCT_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
            if vlSEGVID = 0 then
              vlSEGVID:= StrToFloat(StringReplace(SGCtrlComis.CellStr['IMP_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
          end;
          if SGCtrlComis.CellStr['CVE_COMIS_GPO', vlCont] = 'SEGDAN' then
          begin
            vlSEGDAN:= StrToFloat(StringReplace(SGCtrlComis.CellStr['PCT_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
            if vlSEGDAN = 0 then
              vlSEGDAN:= StrToFloat(StringReplace(SGCtrlComis.CellStr['IMP_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
          end;
          if SGCtrlComis.CellStr['CVE_COMIS_GPO', vlCont] = 'SEGANU' then
          begin
            vlSEGANU:= StrToFloat(StringReplace(SGCtrlComis.CellStr['PCT_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
            if vlSEGANU = 0 then
              vlSEGANU:= StrToFloat(StringReplace(SGCtrlComis.CellStr['IMP_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
          end;
          if SGCtrlComis.CellStr['CVE_COMIS_GPO', vlCont] = 'ESPRIN' then
          begin
            vlESPRIN:= StrToFloat(StringReplace(SGCtrlComis.CellStr['PCT_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
            if vlESPRIN = 0 then
              vlESPRIN:= StrToFloat(StringReplace(SGCtrlComis.CellStr['IMP_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
          end;
          if SGCtrlComis.CellStr['CVE_COMIS_GPO', vlCont] = 'IMOTCO' then
          begin
            vlIMOTCO:= StrToFloat(StringReplace(SGCtrlComis.CellStr['PCT_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
            if vlIMOTCO = 0 then
              vlIMOTCO:= StrToFloat(StringReplace(SGCtrlComis.CellStr['IMP_COMISION', vlCont],',','',[rfIgnoreCase, rfReplaceAll]));
          end;
        end;
      except
        on E: Exception do
        begin
          vgCat:=0;
          ShowMessage('Error al Cálcular CAT, Por Favor Intentelo más Tarde 05.');
          ShowMessage(E.Message);
        end;
      end;
      Objeto.IMP_SOLICITUD.GetFromControl;
      Objeto.TASA_ANUALIZADA.GetFromControl;
      Objeto.F_INICIO.GetFromControl;
      Objeto.F_FIN.GetFromControl;
      Objeto.CVE_AMORTIZACION.GetFromControl;
      Objeto.CVE_PAGO_INTERES.GetFromControl;
      Objeto.UNIDAD_TIEMPO_CP.GetFromControl;
      Objeto.B_IVA.GetFromControl;
      try
        Objeto.CalculaCATNuevo(Objeto.IMP_SOLICITUD.AsFloat,
                               Objeto.TASA_ANUALIZADA.AsFloat,
                               dtpF_Inicio.Date,
                               dtpF_Fin.Date,
                               Objeto.CVE_AMORTIZACION.AsInteger,
                               Objeto.CVE_PAGO_INTERES.AsInteger,
                               Objeto.UNIDAD_TIEMPO_CP.AsInteger,
                               0,
                               0,
                               Objeto.B_IVA.AsString,
                               vlCOMAPE,
                               vlCOMDIS,
                               vlCOMEST,
                               vlCOMANI,
                               vlCOMFEG,
                               vlCOMOTR,
                               vlSEGVID,
                               vlSEGDAN,
                               vlSEGANU,
                               vlESPRIN,
                               vlIMOTCO);
      except
        on E: Exception do
        begin
          vgCat :=0;
          ShowMessage('Error al Cálcular CAT, Por Favor Intentelo más Tarde 06.');
          ShowMessage(E.Message);
        end;
      end;
      Objeto.PCT_CAT.DrawControl;
   end;
end;

procedure TCrCatSol.CalculaCATNuevo(
                   MontoAutor, TasaAnualizada: Double;
                   FechaIni, FechaFin: TDate;
                   TipoAmort, TipoInteres, Periodo: Integer;
                   PzoGraciaCP, PzoGraciaIN: Integer;
                   BIVAInteres: String;
                   PctComisAuto,
                   PctComisDisp,
                   PctComisEst,
                   PctComisAniv,
                   PctComisFEGA,
                   PctComisOtros,
                   ImpSegVida,
                   ImpSegDanios,
                   ImpSegAnual,
                   ImpEstPreInv,
                   ImpComisOtros: Double);
var
  MontosK, MontosSI, MontosI, MontosC, MontosCS: TArrayDouble;
  vlPlazoTot, vlPlazoPer, vlPlazoPerAcum, vlNoPer, vlNoPerInd, vlItera,
  vlIteraPzo, vlNoAnulidades, vlPzoGraciaCP, vlPzoGraciaIN: Integer;
  vlMontoCapitalPer, vlSaldoInsoluto, vlMontoInteresPer,
  vlTasaCAT, vlFactorIVA: Double;
  vlContinua: Boolean;
  //</SST> Variables CAT nuevo
  vlFactorK, con, vlPlazoFinal: Integer;
  vlTotalComis, vlComisAnt, vlTotalInt, vlIntAnt: Double;
  vlStpLimpiaTabla: TStoredProc;
  vlStpCalculaCat: TStoredProc;
  vlStpAgregaElemento: TStoredProc;
  //<SST/>
begin
  //Limpia Memos
  Memo1.Clear;
  Memo2.Clear;
  Memo3.Clear;
  Memo4.Clear;
  Memo5.Clear;
  vlContinua:= True;
  //Determina el plazo
  vlPlazoTot:= Trunc(FechaFin - FechaIni);
  //Determina Total de Periodos
  if Periodo = 0 then  //SEMANAL
    vlPlazoPer:= 7;
  if Periodo = 1 then  //QUINCENAL
    vlPlazoPer:= 15;
  if Periodo = 2 then  //MENSUAL
    vlPlazoPer:= 30;
  if Periodo = 3 then  //BIMESTRAL
    vlPlazoPer:= 60;
  if Periodo = 4 then  //TRIMESTRAL
    vlPlazoPer:= 90;
  if Periodo = 5 then  //CUATRIMESTRAL
    vlPlazoPer:= 120;
  if Periodo = 6 then  //SEMESTRAL
    vlPlazoPer:= 180;
  if Periodo = 7 then  //ANUAL
    vlPlazoPer:= 360;
  //Determina No. de periodos
  vlNoPer:= Trunc(vlPlazoTot / vlPlazoPer);
  vlPlazoFinal:= 0;
  if (vlPlazoTot mod vlPlazoPer) > 0 then
  begin
    vlPlazoFinal:= vlPlazoTot - (vlNoPer * vlPlazoPer);
    vlNoPer:= vlNoPer + 1;
  end;
  SetLength(MontosK, vlPlazoTot + 1);
  SetLength(MontosSI, vlPlazoTot + 1);
  SetLength(MontosI, vlPlazoTot + 1);
  SetLength(MontosC, vlPlazoTot + 2);
  SetLength(MontosCS, vlPlazoTot + 2);
  try
    //Determina Periodos de CAPITAL
    if TipoAmort = 0 then // periodica
    begin
      //DETERMINA EL MONTO DE CAPITAL CONSIDERANDO EL PLAZO DE GRACIA
      //vlMontoCapitalPer:= Trunc(MontoAutor / (vlNoPer - PzoGraciaCP)); //SST200711
      vlMontoCapitalPer:= MontoAutor / vlNoPer; //SST200711 Se quita Plazo de gracia y el trunc
      vlSaldoInsoluto:= MontoAutor;
      vlNoPerInd:= 1;
      vlPlazoPerAcum:= VLPlazoPer;
      for vlItera:= 1 to vlPlazoTot do
      begin
        if ((vlItera = vlPlazoPerAcum) or (vlItera = vlPlazoTot))  then
        begin
          vlPlazoPerAcum:= vlPlazoPerAcum + vlPlazoPer;
          if vlNoPer = vlNoPerInd then
            MontosK[vlItera]:= MontoAutor - (vlMontoCapitalPer * ((vlNoPer - PzoGraciaCP) - 1))
          else
            if (vlNoPerInd > PzoGraciaCP) then
              MontosK[vlItera]:= vlMontoCapitalPer
            else
              MontosK[vlItera]:= 0;
          vlNoPerInd:= vlNoPerInd + 1;
        end
        else
          MontosK[vlItera]:= 0;
        if VLItera = 1 then
          MontosSI[vlItera]:= vlSaldoInsoluto;
        vlSaldoInsoluto:= vlSaldoInsoluto - MontosK[vlItera];
        if VLItera < VLPlazoTot then
          MontosSI[vlItera + 1]:= vlSaldoInsoluto;
      end;
    end;
    if TipoAmort = 1 then // Vencimiento
    begin
      vlSaldoInsoluto:= MontoAutor;
      for vlItera:= 1 to vlPlazoTot do
      begin
        if (vlItera = vlPlazoTot) then
          MontosK[vlItera]:= MontoAutor
        else
          MontosK[vlItera]:= 0;
        vlSaldoInsoluto:= vlSaldoInsoluto - MontosK[vlItera];
        MontosSI[vlItera]:= vlSaldoInsoluto;
      end;
    end;
    //Determina Periodos de INTERES
    vlNoPerInd:= 1;
    vlFactorIVA:= 1;
    vlPlazoPerAcum:= VLPlazoPer;
    vlMontoInteresPer:= 0;
    if BIVAInteres  = 'V' then
      BIVAInteres:= 'F';
    for vlItera:= 1 to vlPlazoTot do
    begin
      //MontosI[vlItera]:= DameImpTrunc(MontosSI[vlItera] * TasaAnualizada / 36000); //Sin IVA para CAT
      MontosI[vlItera]:= MontosSI[vlItera] * TasaAnualizada / 36000; //SST200711 Sin Trunc
    end;
    //Determina Periodos de COMISION
    {for vlItera:= 1 to vlPlazoTot + 1 do
    begin
      if vlItera = 1 then
        MontosC[vlItera]:= 0;
    end;}//SST230611 No servía este ciclo
    MontosC[1]:= 0;
    vlItera:= 1;
    //% Comisión Autorización
    {if PctComisAuto > 0 then
      MontosC[vlItera]:= MontosC[vlItera] + DameImpTrunc((MontoAutor * PctComisAuto / 100)); //Sin IVA CAT}
    if PctComisAuto > 0 then //SST230611 Se cambia a importe, porque bandera para está comisión es importe
      MontosC[vlItera]:= MontosC[vlItera] + PctComisAuto;
    //% Comisión Disposición
    if PctComisDisp > 0 then
      MontosC[vlItera]:= MontosC[vlItera] + (MontoAutor * PctComisDisp / 100); //Sin IVA CAT
    // % Comisión por Estructuración
    if PctComisEst > 0 then
      MontosC[vlItera]:= MontosC[vlItera] + (MontoAutor * PctComisEst / 100); //Sin IVA CAT
    // % Comisión por Aniversario
    if PctComisAniv > 0 then
    begin
      vlNoAnulidades:= Trunc(vlPlazoTot / 360);
      for vlItera:= 1 to vlNoAnulidades do
      begin
        //MontosC[(VLItera * 365)+1]:= MontosC[(VLItera * 365)+1] + DameImpTrunc((MontosSI[VLItera * 365] * PctComisAniv / 100) * 1.15);
        MontosC[(vlItera * 360) + 0]:= MontosC[(vlItera * 360) + 0] + (MontosSI[VLItera * 360] * PctComisAniv / 100); //Sin IVA
      end;
    end;
    //% FEGA
    if PctComisFEGA > 0 then
    begin
      for vlItera:= 1 to vlPlazoTot + 1 do
      begin
        if vlItera = 1 then
        begin
          vlIteraPzo:= vlItera + 1;
          while ((MontosK[vlIteraPzo] = 0) or (vlIteraPzo = vlPlazoTot)) do
          begin
            vlIteraPzo:= vlIteraPzo + 1;
          end;
          MontosC[vlItera]:= MontosC[vlItera] + MontosSI[vlItera] * PctComisFEGA * (vlIteraPzo - vlItera) / 36000;
        end;
        if ((MontosK[vlItera] > 0) and (vlItera < vlPlazoTot)) then
        begin
          vlIteraPzo:= vlItera + 1;
          while ((MontosK[vlIteraPzo] = 0) or (vlIteraPzo = vlPlazoTot)) do
          begin
            vlIteraPzo:= vlIteraPzo + 1;
          end;
          MontosC[vlItera + 1]:= MontosC[vlItera + 1] + (MontosSI[vlItera] - MontosK[vlItera]) * PctComisFEGA * (vlIteraPzo - vlItera) / 36000;
        end;
      end;
    end;
    //% Otras Comisiones
    if PctComisOtros > 0 then
    begin
      con:= 1;
      for vlItera:= 1 to vlPlazoTot + 1 do
      begin
        if con = vlNoPer then
        begin
          MontosC[vlItera]:= MontosC[vlItera] + (MontosSI[vlItera] * PctComisOtros  / 100 );//Sin IVA
          con:= 1;
        end
        else
          con:= con + 1;
      end;
    end;
    // Importe Seguro Vida Periodico Capital
    // SST230611 se cambio a porcentaje!!!
    if ImpSegVida > 0 then
    begin
      con:= 1;
      for vlItera:= 1 to vlPlazoTot + 1 do
      begin
        if con = vlPlazoPer then
        begin
// RAC          MontosC[vlItera]:= MontosC[vlItera] + (MontosSI[vlItera] * ImpSegVida / 100);
          MontosC[vlItera]:= MontosC[vlItera] + ImpSegVida;
          con:= 1;
        end
        else
         con:= con + 1;
          //MontosC[vlItera]:= MontosC[vlItera] + ImpSegVida;
      end;
// RAC MontosC[vlPlazoTot]:= MontosC[vlPlazoTot] + (MontosSI[vlPlazoTot-1] * ImpSegVida / 100);
      MontosC[vlPlazoTot]:= MontosC[vlPlazoTot] + ImpSegVida;
    end;
    // Importe Seguro Daños Periodico Capital
    if ImpSegDanios > 0 then
    begin
      con:= 1;
      for vlItera:= 1 to vlPlazoTot + 1 do
      begin
        if con = vlPlazoPer then
        begin
          MontosC[vlItera]:= MontosC[vlItera] + ImpSegDanios;
          con:= 1;
        end
        else
          con:= con + 1;
        if vlItera = vlPlazoTot then
          if vlPlazoFinal <> 0 then
            MontosC[vlItera]:= MontosC[vlItera] + ImpSegDanios;
      end;
    end;
    // Importe Comisión Seguro Anual
    if ImpSegAnual > 0 then
    begin
      //Primer seguro
      vlItera:= 1;
      MontosC[vlItera]:= MontosC[vlItera] + ImpSegAnual; //Sin IVA
      //Seguros consecutivos
      vlNoAnulidades:= Trunc(vlPlazoTot / 360);
      for vlItera:= 1 to vlNoAnulidades do
      begin
        MontosC[(vlItera * 360) + 0]:= MontosC[(vlItera * 360) + 0] + ImpSegAnual; //Sin IVA CAT
      end;
    end;
    vlItera:= 1;
    // Importe Comisión Estudios de Preinversión
    if ImpEstPreInv > 0 then
      MontosC[vlItera]:= MontosC[vlItera] + ImpEstPreInv; //Sin IVA CAT
     // Importe Comisión Otros Conceptos
    if ImpComisOtros > 0 then
      MontosC[vlItera]:= MontosC[vlItera] + ImpComisOtros; //Sin IVA CAT
    for vlItera:= 1 to vlPlazoTot do
    begin
      if VLItera = 1 then
      begin
        MontosCS[vlItera]:= ( MontoAutor * (-1) ) + MontosC[vlItera];
        MontosCS[vlItera+1]:= MontosK[vlItera] + MontosI[vlItera] + MontosC[vlItera+1];
      end
      else
        MontosCS[vlItera+1]:= MontosK[vlItera] + MontosI[vlItera] + MontosC[vlItera+1];
    end;
    //SST240611 Se Comenta para Elevar la Velocidad del Simulador
    {for vlItera:= 1 to High(MontosK) do
      Memo1.Lines.Add(FormatFloat('###,###,###,##0.00',MontosK[vlItera]));
    for vlItera:= 1 to High(MontosSI) do
      Memo2.Lines.Add(FormatFloat('###,###,###,##0.00',MontosSI[vlItera]));
    for vlItera:= 1 to High(MontosI) do
      Memo3.Lines.Add(FormatFloat('###,###,###,##0.00',MontosI[vlItera]));
    for vlItera:= 1 to High(MontosC) do
      Memo5.Lines.Add(FormatFloat('###,###,###,##0.00',MontosC[vlItera]));
    {for vlItera:= 1 to High(MontosCS) do
      Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',MontosCS[vlItera]));}
  except
    on E: Exception do
    begin
      vlTasaCAT:= 0;
      vlContinua:= False;
      ShowMessage('Error al Cálcular CAT, Por Favor Intentelo más Tarde 01.');
      ShowMessage(E.Message);
    end;
  end;
  if vlContinua then
  begin
    {try
      PCT_CAT.AsFloat:= (TRUNC(InternalRateOfReturn(0.1,MontosCS) * 36000000000) / 1000000);
    except
      on E: Exception do
      begin
        PCT_CAT.AsFloat:= 0;
        ShowMessage('Error al cálcular CAT, Por favor intentelo más tarde 02.');
        ShowMessage(E.Message);
      end;
    end;}//SST Se cambia valor presente por procedimiento de Costo Anual Total (CAT).
    //</SST>
    //Se agrega paquete de cálculo de nuevo CAT 24MAY2011
    PCT_CAT.AsFloat:= 0;
    try
      vlStpLimpiaTabla:= TStoredProc.Create(nil);
      vlStpCalculaCat:= TStoredProc.Create(nil);
      vlStpAgregaElemento:= TStoredProc.Create(nil);
      with vlStpLimpiaTabla do
      begin
        StoredProcName:= 'PKGCRCAT.STPLIMPIATABLA';
        DatabaseName:= Apli.DataBaseName;
        SessionName:= Apli.SessionName;
        Params.Clear;
        Params.CreateParam(ftInteger, 'psResultado', ptOutput);
        Params.CreateParam(ftString, 'psTxResultado', ptOutput);
        ExecProc;
        if (ParamByName('psResultado').AsInteger <> 0) then
          showMessage('PKGCRCAT.STPLIMPIATABLA: '+ ParamByName('psTxResultado').AsString);
      end;
      with vlStpAgregaElemento do
      begin
        StoredProcName:= 'PKGCRCAT.STPAGREGAELEMENTO';
        DatabaseName:= Apli.DataBaseName;
        SessionName:= Apli.SessionName;
        Params.Clear;
        Params.CreateParam(ftFloat, 'peIMP_CREDITO', ptInput);
        Params.CreateParam(ftInteger, 'psResultado', ptOutput);
        Params.CreateParam(ftString, 'psTxResultado', ptOutput);
        vlTotalComis:= MontosC[1];
        {for vlItera:= 0 to vlPlazoTot + 1 do
        begin
          vlTotalComis:= vlTotalComis + MontosC[vlItera];
        end;}
        //Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',((MontoAutor - vlTotalComis) * -1)));
        ParamByName('peIMP_CREDITO').AsFloat:= (MontoAutor - vlTotalComis) * -1;
        ExecProc;
        vlFactorK:= vlPlazoPer;
        vlTotalComis:= 0;
        vlComisAnt:= 0;
        vlTotalInt:= 0;
        vlIntAnt:= 0;
        for vlItera:= 0 to vlPlazoTot do
        begin
          if vlItera > 1 then
            vlTotalComis:= vlTotalComis + MontosC[vlItera];
          if TipoAmort = 0 then
          begin
            if MontosK[vlItera] <> 0 then
            begin
              if TipoInteres = 0 then
              begin
                if vlItera <> vlPlazoTot then
                begin
                  //Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',MontosK[vlItera] + vlTotalComis + (MontosI[vlItera] * vlPlazoPer)));
                  ParamByName('peIMP_CREDITO').AsFloat:= MontosK[vlItera] + vlTotalComis + (MontosI[vlItera] * vlPlazoPer);
                end
                else
                begin
                  //Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',MontosK[vlItera] + vlTotalComis + (MontosI[vlItera] * vlPlazoFinal)));
                  ParamByName('peIMP_CREDITO').AsFloat:= MontosK[vlItera] + vlTotalComis + (MontosI[vlItera] * vlPlazoFinal);
                end;
              end
              else
              begin
                if vlItera <> vlPlazoTot then
                begin
                  //Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',MontosK[vlItera] + vlTotalComis));
                  ParamByName('peIMP_CREDITO').AsFloat:= MontosK[vlItera] + vlTotalComis;
                  vlTotalInt:= vlTotalInt + (MontosI[vlItera] * vlPlazoPer);
                end
                else
                begin
                  //Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',MontosK[vlItera] + vlTotalComis + vlTotalInt + (MontosI[vlItera] * vlPlazoFinal)));
                  ParamByName('peIMP_CREDITO').AsFloat:= MontosK[vlItera] + vlTotalComis + vlTotalInt + (MontosI[vlItera] * vlPlazoFinal);
                end;
              end;
              ExecProc;
              if (ParamByName('psResultado').AsInteger <> 0) then
                showMessage('PKGCRCAT.STPAGREGAELEMENTO: '+ ParamByName('psTxResultado').AsString);
              if vlItera <> vlPlazoTot then
                vlIntAnt:= MontosI[vlItera] * vlPlazoPer
              else
                vlIntAnt:= MontosI[vlItera] * vlPlazoFinal;
              vlComisAnt:= vlTotalComis;
              vlTotalComis:= 0;
            end;
          end
          else
          begin
            if vlItera = vlFactorK then
            begin
              if MontosI[vlItera] <> 0 then
              begin
                if TipoInteres = 0 then
                begin
                  if vlItera <> vlPlazoTot then
                  begin
                    //Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',MontosK[vlItera] + vlTotalComis + (MontosI[vlItera] * vlPlazoPer)));
                    ParamByName('peIMP_CREDITO').AsFloat:= MontosK[vlItera] + vlTotalComis + (MontosI[vlItera] * vlPlazoPer);
                  end
                  else
                  begin
                    //Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',MontosK[vlItera] + vlTotalComis + (MontosI[vlItera] * vlPlazoFinal)));
                    ParamByName('peIMP_CREDITO').AsFloat:= MontosK[vlItera] + vlTotalComis + (MontosI[vlItera] * vlPlazoFinal);
                  end;
                end
                else
                begin
                  if vlItera <> vlPlazoTot then
                  begin
                    //Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',MontosK[vlItera] + vlTotalComis));
                    ParamByName('peIMP_CREDITO').AsFloat:= MontosK[vlItera] + vlTotalComis;
                    vlTotalInt:= vlTotalInt + (MontosI[vlItera] * vlPlazoPer);
                  end
                  else
                  begin
                    //Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',MontosK[vlItera] + vlTotalComis + vlTotalInt + (MontosI[vlItera] * vlPlazoFinal)));
                    ParamByName('peIMP_CREDITO').AsFloat:= MontosK[vlItera] + vlTotalComis + vlTotalInt + (MontosI[vlItera] * vlPlazoFinal);
                  end;
                end;
              end
              else
              begin
                if TipoInteres = 0 then
                begin
                  //Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',MontosK[vlItera] + vlComisAnt + vlIntAnt));
                  ParamByName('peIMP_CREDITO').AsFloat:= MontosK[vlItera] + vlComisAnt + vlIntAnt;
                end
                else
                begin
                  //Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',MontosK[vlItera] + vlComisAnt + vlIntAnt + vlTotalInt));
                  ParamByName('peIMP_CREDITO').AsFloat:= MontosK[vlItera] + vlComisAnt + vlIntAnt + vlTotalInt;
                end;
              end;
              ExecProc;
              if (ParamByName('psResultado').AsInteger <> 0) then
                showMessage('PKGCRCAT.STPAGREGAELEMENTO: '+ ParamByName('psTxResultado').AsString);
              vlFactorK:= vlFactorK + vlPlazoPer;
              vlIntAnt:= MontosI[vlItera] * vlPlazoPer;
              vlComisAnt:= vlTotalComis;
              vlTotalComis:= 0;
            end
            else
            begin
              if MontosK[vlItera] <> 0 then
              begin
                if MontosI[vlItera] <> 0 then
                begin
                  if TipoInteres = 0 then
                  begin
                    //Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',MontosK[vlItera] + vlTotalComis + (MontosI[vlItera] * vlPlazoPer)));
                    ParamByName('peIMP_CREDITO').AsFloat:= MontosK[vlItera] + vlTotalComis + (MontosI[vlItera] * vlPlazoPer);
                  end
                  else
                  begin
                    if vlItera <> vlPlazoTot then
                    begin
                      //Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',MontosK[vlItera] + vlTotalComis));
                      ParamByName('peIMP_CREDITO').AsFloat:= MontosK[vlItera] + vlTotalComis;
                      vlTotalInt:= vlTotalInt + (MontosI[vlItera] * vlPlazoPer);
                    end
                    else
                    begin
                      //Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',MontosK[vlItera] + vlTotalComis + vlTotalInt));
                      ParamByName('peIMP_CREDITO').AsFloat:= MontosK[vlItera] + vlTotalComis + vlTotalInt;
                    end;
                  end;
                end
                else
                begin
                  if TipoInteres = 0 then
                  begin
                    //Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',MontosK[vlItera] + MontosC[vlItera] + (MontosI[vlItera - 1] * vlPlazoFinal)));
                    ParamByName('peIMP_CREDITO').AsFloat:= MontosK[vlItera] + MontosC[vlItera] + (MontosI[vlItera - 1] * vlPlazoFinal);
                  end
                  else
                  begin
                    //Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',MontosK[vlItera] + MontosC[vlItera] + (MontosI[vlItera - 1] * vlPlazoFinal) + vlTotalInt));
                    ParamByName('peIMP_CREDITO').AsFloat:= MontosK[vlItera] + MontosC[vlItera] + (MontosI[vlItera - 1] * vlPlazoFinal) + vlTotalInt;
                  end;
                end;
                ExecProc;
                if (ParamByName('psResultado').AsInteger <> 0) then
                  showMessage('PKGCRCAT.STPAGREGAELEMENTO: '+ ParamByName('psTxResultado').AsString);
                vlIntAnt:= MontosI[vlItera] * vlPlazoPer;
                vlComisAnt:= vlTotalComis;
                vlTotalComis:= 0;
              end;
            end;
          end;
        end;
      end;
      with vlStpCalculaCat do
      begin
        StoredProcName:= 'PKGCRCAT.STPCALCULACAT';
        DatabaseName:= Apli.DataBaseName;
        SessionName:= Apli.SessionName;
        Params.Clear;
        Params.CreateParam(ftInteger, 'pePeriodos', ptInput);
        Params.CreateParam(ftInteger, 'peFactorAnual', ptInput);
        Params.CreateParam(ftFloat, 'psCat', ptOutput);
        Params.CreateParam(ftInteger, 'psResultado', ptOutput);
        Params.CreateParam(ftString, 'psTxResultado', ptOutput);
        ParamByName('pePeriodos').AsInteger:= vlNoPer;
        if vlPlazoPer = 7 then
          ParamByName('peFactorAnual').AsFloat:= (52)
        else
          ParamByName('peFactorAnual').AsFloat:= (360 / vlPlazoPer);
        ExecProc;
        if (ParamByName('psResultado').AsInteger = 0) then
          PCT_CAT.AsFloat:= ParamByName('psCat').AsFloat
        else
          showMessage('PKGCRCAT.STPLIMPIATABLA: '+ ParamByName('psTxResultado').AsString);
      end;
    finally
      vlStpLimpiaTabla.Free;
      vlStpCalculaCat.Free;
      vlStpAgregaElemento.Free;
    end;
    //<SST/>
  end;
  //Libera los arreglos de la memoria
  SetLength(MontosK, 0);
  SetLength(MontosSI, 0);
  SetLength(MontosI, 0);
  SetLength(MontosC, 0);
  if MontosK <> nil then
    MontosK:= Nil;
  if MontosSI <> nil then
    MontosSI:= Nil;
  if MontosI <> nil then
    MontosI:= Nil;
  if MontosC <> nil then
    MontosC:= Nil;
  if MontosCS <> nil then
    MontosCS:= Nil;
end;

procedure TWCrCatSol.btnCatNuevoExit(Sender: TObject);
begin
  InterForma1.ValidaExit(bbCAT, True, '', True);
end;
procedure TWCrCatSol.edDIAS_PLAZOChange(Sender: TObject);
begin
  if edDIAS_PLAZO.Text <> '' then
  begin
    if StrToInt(edDIAS_PLAZO.Text) < 7 then
    begin
      edDIAS_PLAZO.Text:= '0';
      edF_FIN.Text:= edF_INICIO.Text;
      edF_FIN.SelectAll;
      edF_FIN.SetFocus;
    end;
  end;
end;

procedure TWCrCatSol.InterForma1DespuesCancelar(Sender: TObject);
begin
  edCVE_COMISION.Text:= ''; //SST210711 Validaciones
  edTipoComision.Text:= '';
  edPerComision.Text:= '';
  ePctComision.Text:= '0';
  ieMonto.Text:= '0';
  LimpiaComisiones;
end;

//<SST/>
end.

