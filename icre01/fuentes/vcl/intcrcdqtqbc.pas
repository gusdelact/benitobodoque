// Sistema         : Clase de CRQTQEBCAST
// Fecha de Inicio : 18/05/2005
// Función forma   : Clase de CRQTQEBCAST
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrCdQtQbC;

interface

uses
Windows,   Messages,  SysUtils,  Classes,  Graphics,  Controls,  Forms,
Dialogs,   IntFrm,    DB,        DbTables, Mask,      StdCtrls,  Buttons,
ExtCtrls,  InterFor,  IntFind,   UnSQL2,   InterFun,  ComCtrls,  IntDtPk,

IntParamCre,   // Unidad Parametros
IntGenCre,     // Unidad Generica de Crédito
IntMensaje,    // Despliega Mensajes de Error
IntCrCredito,  // Disposición
IntBasicCred,  // Disposición (Clase Ligera)
IntCrcobranz,  // Cobranza de Disposición
IntCrCancCob,  // Cancela Transacciones
IntCrCobConst, // Constantes y procedimientos de la cobranza


IntLinkit, InterEdit, DBCtrls, Grids, DBGrids, Aligrid;

Type
  TTipoParam   = ( tpDate,  tpFactor,  tpImpMora, tpBIVAMora, tpBCondona  );

  TCrCdQtQbC  = class;

  TWCrCdQtQbC = class(TForm)
    InterForma1 : TInterForma;
    lbFiltro : TLabel;
    edValorFiltro: TEdit;
    btBUSCA  : TBitBtn;
    btnFiltro: TBitBtn;
    rgAcreditado: TGroupBox;
    lbDESC_ACREDITADO: TLabel;
    ikValorFiltro: TInterLinkit;
    bvSeparador: TBevel;
    cbFiltro: TCheckBox;
    gbInfGral: TGroupBox;
    lbID_CONTRATO: TLabel;
    lbADEUDO_TOTAL: TLabel;
    lbDESC_MONEDA: TLabel;
    lbSDO_INSOLUTO: TLabel;
    lbF_INICIO: TLabel;
    lbF_VENCIMIENTO: TLabel;
    lbDESC_C_PRODUCTO: TLabel;
    edID_CONTRATO: TEdit;
    edADEUDO_TOTAL: TEdit;
    edDESC_MONEDA: TEdit;
    edSDO_VIG_TOTAL: TEdit;
    edF_INICIO: TEdit;
    edF_VENCIMIENTO: TEdit;
    edDESC_L_PRODUCTO: TEdit;
    gbNvoImporte: TGroupBox;
    lbIMP_CAPITALIZA: TLabel;
    lbIMP_CAPITAL: TLabel;
    lbIMP_INTERES: TLabel;
    lbIMP_COMISION: TLabel;
    lbIMP_TOTAL: TLabel;
    lbIMP_BASE: TLabel;
    lbPCT_IMP_APLICAR: TLabel;
    lbIMP_APLICAR: TLabel;
    lbPCT_IMP_COMISION: TLabel;
    edIMP_COMISION: TInterEdit;
    edPCT_COMISION: TInterEdit;
    edIMP_PCT_COMISION: TInterEdit;
    edIMP_INTERES: TInterEdit;
    edPCT_INTERES: TInterEdit;
    lbPCT_IMP_INTERES: TLabel;
    edIMP_PCT_INTERES: TInterEdit;
    edIMP_CAPITALIZA: TInterEdit;
    edPCT_CAPITALIZA: TInterEdit;
    lbPCT_IMP_CAPITALIZA: TLabel;
    edIMP_PCT_CAPITALIZA: TInterEdit;
    edIMP_CAPITAL: TInterEdit;
    edPCT_CAPITAL: TInterEdit;
    lbPCT_IMP_CAPITAL: TLabel;
    edIMP_PCT_CAPITAL: TInterEdit;
    rgTIPO_MOVIMIENTO: TRadioGroup;
    MErrores: TMemo;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edIMP_TOTAL: TInterEdit;
    edIMP_PCT_TOTAL: TInterEdit;
    edPCT_TOTAL: TInterEdit;
    btnCobra: TBitBtn;
    mTxNota: TMemo;
    lbComentarios: TLabel;
    btCOBRANZA: TBitBtn;
    lbIMP_BASE_MORA: TLabel;
    edIMP_M_COMISION: TInterEdit;
    edIMP_M_INTERES: TInterEdit;
    edIMP_M_CAPITALIZA: TInterEdit;
    edIMP_M_CAPITAL: TInterEdit;
    edIMP_M_TOTAL: TInterEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    rgParametros: TGroupBox;
    lbF_VALOR: TLabel;
    idtF_VALOR: TInterDateTimePicker;
    edF_VALOR: TEdit;
    btCANCELA: TBitBtn;
    rgTIPO_APLICACION: TRadioGroup;
    sagDATOS: TStringAlignGrid;
    pnlDetalle: TPanel;
    edTitTotal: TEdit;
    edTitImpCap: TEdit;
    edTitFinAdic: TEdit;
    edTitInt: TEdit;
    edTitCon: TEdit;
    edTitFVentto: TEdit;
    edTitDocto: TEdit;
    edTitSBar: TEdit;
    cbB_TODOS_PERIODOS: TCheckBox;
    cbSelecciona: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure FormCreate(Sender: TObject);
    procedure ikValorFiltroEjecuta(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure cbFiltroClick(Sender: TObject);
    procedure btBUSCAClick(Sender: TObject);
    procedure edSDO_VIG_TOTALChange(Sender: TObject);
    procedure edPCT_COMISIONEnter(Sender: TObject);
    procedure edPCT_COMISIONExit(Sender: TObject);
    procedure edIMP_PCT_COMISIONEnter(Sender: TObject);
    procedure edIMP_PCT_COMISIONExit(Sender: TObject);
    procedure edPCT_CAPITALEnter(Sender: TObject);
    procedure edPCT_CAPITALExit(Sender: TObject);
    procedure edIMP_PCT_CAPITALExit(Sender: TObject);
    procedure edIMP_PCT_CAPITALEnter(Sender: TObject);
    procedure edGenericKeyPress(Sender: TObject; var Key: Char);
    procedure edPCT_INTERESEnter(Sender: TObject);
    procedure edPCT_INTERESExit(Sender: TObject);
    procedure edIMP_PCT_INTERESEnter(Sender: TObject);
    procedure edIMP_PCT_INTERESExit(Sender: TObject);
    procedure edPCT_CAPITALIZAEnter(Sender: TObject);
    procedure edPCT_CAPITALIZAExit(Sender: TObject);
    procedure edIMP_PCT_CAPITALIZAEnter(Sender: TObject);
    procedure edIMP_PCT_CAPITALIZAExit(Sender: TObject);
    procedure btnCobraClick(Sender: TObject);
    procedure edPCT_TOTALEnter(Sender: TObject);
    procedure edPCT_TOTALExit(Sender: TObject);
    procedure edF_VALOREnter(Sender: TObject);
    procedure edF_VALORExit(Sender: TObject);
    procedure edF_VALORKeyPress(Sender: TObject; var Key: Char);
    procedure rgTIPO_MOVIMIENTOClick(Sender: TObject);
    procedure edValorFiltroExit(Sender: TObject);
    procedure btCOBRANZAClick(Sender: TObject);
    procedure btCANCELAClick(Sender: TObject);
    procedure rgTIPO_APLICACIONClick(Sender: TObject);
    procedure sagDATOSSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure sagDATOSTopLeftChanged(Sender: TObject);
    procedure cbB_TODOS_PERIODOSClick(Sender: TObject);
    procedure MErroresDblClick(Sender: TObject);
    procedure cbSeleccionaClick(Sender: TObject);
  private
    FDataFound  : Boolean;
    FSelected   : Boolean;
  private
    procedure stpObtenMontos(peIdCredito  : Integer; peNumPeriodo : Integer;
                peFCalculo   : TDate;       peFactor     : Double;
                peBIVA       : String;      peBComision  : String;
                peBInteres   : String;      peBFinAdic   : String;
                peBCapital   : String;
                var  psImpComision,  psImpMoraCom,  psImpInteres,
                     psImpMoraInt,   psImpFinAdic,  psImpMorFAdic,
                     psImpCapital,   psImpMoraCap : Double
                );
    procedure LimpiaMontos(BLimpiaPCT : Boolean );
    procedure LimpiaGrid;
    procedure GetFromGrid( peRowGrid, peColGrid : Integer);
    procedure SetToGrid;
    procedure DrawControls;
    procedure ResetWindow;
    procedure UpdateParams;
    procedure ShowData;
    procedure AsignaFVAlor( peFecha : TDateTime);
    procedure FmtCurrEdit( Sender: TEdit );
    function  BeginSearch( BBusca : Boolean; const Llave : array of TVarRec ): Boolean;
    function  ValidateField( IMP_CONCEPTO, IMP_MORATORIO, PCT_X_APLICAR, IMP_X_APLICAR: TInterCampo;
                             MsgMask : String; BPorcentaje : Boolean ): Boolean;
    Procedure OnOfContrImp;

    //procedure setWindowMode;
  public
    Objeto : TCrCdQtQbC;
  published
    property  DataFound : Boolean   read   FDataFound  write FDataFound;
    property  Selected  : Boolean   read   FSelected   write FSelected;
  end;

  //
  TCrCdQtQbC= class(TInterFrame)
  private
    fCurrentValue  : Double;
    fCurrentDate   : TDate;
  private
    function       Searched: Boolean;
    function       BuildSQLStr: String;
    procedure      ReCalculate;
    procedure      setCurrentValue( Sender: TInterCampo );
    function       getCurrentValue: Double;
    procedure      setCurrentDate( Sender: TInterCampo );
    function       getCurrentDate: TDate;
    function       getFacMor : Integer;
    function       getFacImp : Integer;
    function       getAdeudoTotal : Double;
    procedure      stpObtAdeudo(peIdCredito  : Integer;  peNumPeriodo : Integer;
                                peCveComision: String;   pFCalculo    : TDate;
                                pFactor      : Double;   pBIVA        : String;
                                pCveAccesorio: String;   var vlTotal,  vlImporte,
                                vlIVA,         vlBenBco, vlBenGob,     vlMoras,
                                vlIVAMoras   : Double;   var psResult : Integer;
                                var psError  : String );
   procedure       stpClrTbl( var psResult : Integer; var psError  : String );
   procedure       StpAddTbl( pidCredito   : Integer; pNumPeriodo  : Integer;
                              pFVentto     : TDate;   pFValor      : TDate;
                              pTx_Nota     : String;  pPctComision : Double;
                              pPctInteres  : Double;  pPctFinAdic  : Double;
                              pPctCapital  : Double;  pImpXAcplCon : Double;
                              pImpXAplInt  : Double;  pImpXAplFin  : Double;
                              pImpXAplCap  : Double;  var psResult : Integer;
                              var psError  : String );
   procedure       stpAplMovto( pidCredito   : Integer;  pCvemovto    : String;
                                pTipoAplica  : String;   pBTodosPer   : String;
                                var psResult : Integer;  var  vlError : String);
   function        StpObtCntLog : Integer;
   procedure       StpObtLog( peIndice : Integer; var vlError:Integer; var  vlTxError : String );
   {
   procedure       stpAplMovto( pidCredito   : Integer;  pFValor       : TDate;  pTxNota      : String;  pCvemovto    : String;
                                pPctComision : Double;   pPctInteres   : Double; pPctFinAdic  : Double;  pPctCapital  : Double;
                                pImpXAcplCon : Double;   pImpXAplInt   : Double; pImpXAplFin  : Double;  pImpXAplCap  : Double;
                                var  vlError    : String);
   }


  protected
    //
  public
    //
    VALOR_FILTRO             : TInterCampo;
    TIPO_MOVIMIENTO          : TInterCampo;
    TIPO_APLICACION          : TInterCampo;
    B_TODOS_PERIODOS         : TInterCampo;
    // DATO DE CONTROL
    INDICE_GRID              : TInterCampo;
    // DE LA SECCION DE PARAMETROS
    F_VALOR                  : TInterCampo;
    FACT_MORAS               : TInterCampo;
    B_APLICA_IVA             : TInterCampo;
    //
    ADEUDO_TOTAL             : TInterCampo;
    // CAMPOS ESPECIALES
    FAC_M_COMISION           : TInterCampo;
    FAC_M_INTERES            : TInterCampo;
    FAC_M_CAPITALIZA         : TInterCampo;
    FAC_M_CAPITAL            : TInterCampo;
    //
    NUM_PERIODO              : TInterCampo;
    //
    IMP_M_COMISION           : TInterCampo;
    IMP_M_INTERES            : TInterCampo;
    IMP_M_CAPITALIZA         : TInterCampo;
    IMP_M_CAPITAL            : TInterCampo;
    IMP_M_TOTAL              : TInterCampo;
    // DE LA SECCION DE IMPORTES
    IMP_COMISION             : TInterCampo;
    IMP_INTERES              : TInterCampo;
    IMP_CAPITALIZA           : TInterCampo;
    IMP_CAPITAL              : TInterCampo;
    IMP_TOTAL                : TInterCampo;
    //
    PCT_COMISION             : TInterCampo;
    PCT_INTERES              : TInterCampo;
    PCT_CAPITALIZA           : TInterCampo;
    PCT_CAPITAL              : TInterCampo;
    PCT_TOTAL                : TInterCampo;
    //
    IMP_PCT_COMISION         : TInterCampo;
    IMP_PCT_INTERES          : TInterCampo;
    IMP_PCT_CAPITALIZA       : TInterCampo;
    IMP_PCT_CAPITAL          : TInterCampo;
    IMP_PCT_TOTAL            : TInterCampo;
    //
    ParamCre       : TParamCre;
    CatCredito     : TCrCredito;
    Credito        : TBasicCred;
    //
    vgID_CREDITO   : Integer;

    function       InternalBusca : Boolean; override;
    constructor    Create( AOwner : TComponent ); override;
    destructor     Destroy; override;
    function       ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;


const
  coCR          = #13;
  coFmtFloat    = '#######################0.00';
  coFmtCurrency = '###,###,###,###,###,###,###,##0.00';
  coZeroPct     =   0.00;
  co100Pct      = 100.00;
  coDefaultPct  = co100Pct;
  //
  COL_DPER      = 0;
  COL_FVE       = 1;
  COL_CN        = 2;
  COL_IN        = 3;
  COL_FN        = 4;
  COL_CP        = 5;
  COL_TO        = 6;
  COL_VIS       = COL_TO;  // Valor de la ultima columna visible en el Grid
  //--  CAMPOS OCULTOS
  COL_CNIB      = 7;
  COL_INIB      = 8;
  COL_FNIB      = 9;
  COL_CPIB      = 10;
  //
  COL_CNIM      = 11;
  COL_INIM      = 12;
  COL_FNIM      = 13;
  COL_CPIM      = 14;
  //
  COL_CNPC      = 15;
  COL_INPC      = 16;
  COL_FNPC      = 17;
  COL_CPPC      = 18;
  //
  COL_BCN       = 19;
  COL_BIN       = 20;
  COL_BFN       = 21;
  COL_BCP       = 22;
  //
  COL_FVA       = 23;
  COL_PER       = 24;
  //
  coGlobal      = 'GL';
  coDetalle     = 'DE';
  //
  coCondona     = 'CD';
  coQuita       = 'QT';
  coQuebranto   = 'QB';
  coCastigo     = 'CT';
  //RIRA4281 26Oct10
  coDacion      = 'DA';
  coAdjudica    = 'AD';
  //
  coComision    = 'CN';
  coInteres     = 'IN';
  coFinAdic     = 'FN';
  coCapital     = 'CP';
  //
  coUpdFValor        = '¿Deseas actualizar la fecha de aplicación?';
  coUpdFactor        = '¿Deseas modificar el factor de moratorios de %f a %f?';
  coUpdAllFact       = '¿Deseas modificar el factor de moratorios a %f? para todos los conceptos';
  coMsgErrPct        = '¡¡¡¡El valor del porcentaje debe estar entre 0.00 y 100.00!!!!';
  coMsgErrImp        = '¡¡¡¡El importe a aplicar no puede ser mayor al importe' +
                       ' y tampoco puede ser menor a cero!!!!';
  coMsgPctComision   = '¿Deseas modificar el porcentaje de comisión de %f a %f?';
  coMsgPctInteres    = '¿Deseas modificar el porcentaje de interés de %f a %f?';
  coMsgPctCapitaliza = '¿Deseas modificar el porcentaje de financiamiento de %f a %f?';
  coMsgPctCapital    = '¿Deseas modificar el porcentaje de capital de %f a %f?';
  coMsgPctTotal      = '¿Deseas modificar el porcentaje de todos los importes?';
  coMsgImpComision   = '¿Deseas modificar el monto de comisión de %8.2f a %8.2f?';
  coMsgImpInteres    = '¿Deseas modificar el monto de interés de %f a %f?';
  coMsgImpCapitaliza = '¿Deseas modificar el monto de financiamiento de %8.2f a %8.2f?';
  coMsgImpCapital    = '¿Deseas modificar el monto de capital de %8.2f a %8.2f?';
  coNoData           = 'Favor de indicar una Disposición';
  coRealizaProces    = '¿Desea aplicar el Movimiento?';
  coValidaFechaIni   = 'La Fecha de operación no puede ser menor a la fecha de inicio de la Disposición';
  coValidaMovto      = 'La disposición tiene intereses moratorios. No es posible aplicar el movimiento';
  //EASA4011    29/08/2006
  coTxCondona        = 'Condonación de Moratorios de la Disp. ';
  coTxQuita          = 'Quita de la Disp. ';
  coTxQuebranto      = 'Quebranto de la Disp. ';
  coTxCastigo        = 'Castigo de la Disp. ';
  coTxDacion         = 'Dacion  de la Disp. ';
  coTxAdjudica       = 'Adjudicacion de la Disp. ';

  // EASA4011>/
implementation
{$R *.DFM}

constructor TCrCdQtQbC.Create( AOwner : TComponent );
begin
  Inherited;
  VALOR_FILTRO      := CreaCampo( 'VALOR_FILTRO',      ftString,  tsNinguno, tsNinguno, False );
  B_TODOS_PERIODOS  := CreaCampo( 'B_TODOS_PERIODOS',  ftString,  tsNinguno, tsNinguno, False );
  // DE LA SECCION DE PARAMETROS
  F_VALOR           := CreaCampo( 'F_VALOR',           ftDate,    tsNinguno, tsNinguno, False );
  FACT_MORAS        := CreaCampo( 'FACT_MORAS',        ftFloat,   tsNinguno, tsNinguno, False );
  B_APLICA_IVA      := CreaCampo( 'B_APLICA_IVA',      ftString,  tsNinguno, tsNinguno, False );
  //
  NUM_PERIODO       := CreaCampo( 'NUM_PERIODO',       ftInteger, tsNinguno, tsNinguno, False );
  //
  INDICE_GRID       := CreaCampo( 'INDICE_GRID',       ftInteger, tsNinguno, tsNinguno, False );
  //
  ADEUDO_TOTAL      := CreaCampo( 'ADEUDO_TOTAL',      ftFloat,   tsNinguno, tsNinguno, False );
  //
  FAC_M_COMISION    := CreaCampo( 'FAC_M_COMISION',    ftFloat, tsNinguno, tsNinguno, False );
  FAC_M_INTERES     := CreaCampo( 'FAC_M_INTERES',     ftFloat, tsNinguno, tsNinguno, False );
  FAC_M_CAPITALIZA  := CreaCampo( 'FAC_M_CAPITALIZA',  ftFloat, tsNinguno, tsNinguno, False );
  FAC_M_CAPITAL     := CreaCampo( 'FAC_M_CAPITAL',     ftFloat, tsNinguno, tsNinguno, False );
  IMP_M_COMISION    := CreaCampo( 'IMP_M_COMISION',    ftFloat, tsNinguno, tsNinguno, False );
  IMP_M_INTERES     := CreaCampo( 'IMP_M_INTERES',     ftFloat, tsNinguno, tsNinguno, False );
  IMP_M_CAPITALIZA  := CreaCampo( 'IMP_M_CAPITALIZA',  ftFloat, tsNinguno, tsNinguno, False );
  IMP_M_CAPITAL     := CreaCampo( 'IMP_M_CAPITAL',     ftFloat, tsNinguno, tsNinguno, False );
  IMP_M_TOTAL       := CreaCampo( 'IMP_M_TOTAL',       ftFloat, tsNinguno, tsNinguno, False );
  // DE LA SECCION DE IMPORTES
  IMP_COMISION      := CreaCampo( 'IMP_COMISION',      ftFloat, tsNinguno, tsNinguno, False );
  IMP_INTERES       := CreaCampo( 'IMP_INTERES',       ftFloat, tsNinguno, tsNinguno, False );
  IMP_CAPITALIZA    := CreaCampo( 'IMP_CAPITALIZA',    ftFloat, tsNinguno, tsNinguno, False );
  IMP_CAPITAL       := CreaCampo( 'IMP_CAPITAL',       ftFloat, tsNinguno, tsNinguno, False );
  IMP_TOTAL         := CreaCampo( 'IMP_TOTAL',         ftFloat, tsNinguno, tsNinguno, False );
  //
  PCT_COMISION      := CreaCampo( 'PCT_COMISION',      ftFloat, tsNinguno, tsNinguno, False );
  PCT_INTERES       := CreaCampo( 'PCT_INTERES',       ftFloat, tsNinguno, tsNinguno, False );
  PCT_CAPITALIZA    := CreaCampo( 'PCT_CAPITALIZA',    ftFloat, tsNinguno, tsNinguno, False );
  PCT_CAPITAL       := CreaCampo( 'PCT_CAPITAL',       ftFloat, tsNinguno, tsNinguno, False );
  PCT_TOTAL         := CreaCampo( 'PCT_TOTAL',         ftFloat, tsNinguno, tsNinguno, False );
  //
  IMP_PCT_COMISION   := CreaCampo( 'IMP_PCT_COMISION',   ftFloat,  tsNinguno, tsNinguno, False );
  IMP_PCT_INTERES    := CreaCampo( 'IMP_PCT_INTERES',    ftFloat,  tsNinguno, tsNinguno, False );
  IMP_PCT_CAPITALIZA := CreaCampo( 'IMP_PCT_CAPITALIZA', ftFloat,  tsNinguno, tsNinguno, False );
  IMP_PCT_CAPITAL    := CreaCampo( 'IMP_PCT_CAPITAL',    ftFloat,  tsNinguno, tsNinguno, False );
  IMP_PCT_TOTAL      := CreaCampo( 'IMP_PCT_TOTAL',      ftFloat,  tsNinguno, tsNinguno, False );
  //
  TIPO_MOVIMIENTO    := CreaCampo( 'TIPO_MOVIMIENTO',    ftString, tsNinguno, tsNinguno, False );
  with TIPO_MOVIMIENTO do
  begin
    Size     := 2;
    UseCombo := True;         
    ComboLista.Add('0');      ComboDatos.Add(coCondona);
    ComboLista.Add('1');      ComboDatos.Add(coQuita);
    ComboLista.Add('2');      ComboDatos.Add(coQuebranto);
    ComboLista.Add('3');      ComboDatos.Add(coCastigo);
    ComboLista.Add('4');      ComboDatos.Add(coDacion);
    ComboLista.Add('5');      ComboDatos.Add(coAdjudica);

  end;
  //
  TIPO_APLICACION    := CreaCampo( 'TIPO_APLICACION',    ftString, tsNinguno, tsNinguno, False );
  with TIPO_APLICACION do
  begin
    Size     := 2;
    UseCombo := True;
    ComboLista.Add('0');      ComboDatos.Add(coGlobal);
    ComboLista.Add('1');      ComboDatos.Add(coDetalle);
  end;

  // Clases encapsuladas
  {$WARNINGS OFF}
  CatCredito := TCrCredito.Create(Self);       // Clase de disposición
  {$WARNINGS ON}
  CatCredito.MasterSource := Self;
  CatCredito.BuscaWhereString := 'CR_CREDITO.SIT_CREDITO NOT IN ( ''LQ'', ''CA'' ) ';
  CatCredito.FilterString     := CatCredito.BuscaWhereString;
  {}
  vgID_CREDITO := 0;

  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntCrCdQtQbC.Hlp';
  ShowMenuReporte := True;
end;

Destructor TCrCdQtQbC.Destroy;
begin
  if CatCredito <> nil then
     CatCredito.Free;
  //
  inherited;
end;


function TCrCdQtQbC.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCdQtQbC;
begin
  W := TWCrCdQtQbC.Create(Self);
  try
    W.Objeto := Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
    W.InterForma1.ShowGrid  := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion   := FInterFun;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

Function TCrCdQtQbC.InternalBusca:Boolean;
var  T : TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrqtqeb.it','');
  Try
    if Active then
    begin
    end;
    //
    if T.Execute then
      InternalBusca := FindKey([]);
  finally
    T.Free;
  end;
end;
//
procedure TCrCdQtQbC.setCurrentValue( Sender: TInterCampo );
begin
  fCurrentValue := Sender.AsFloat;
end;
//
function TCrCdQtQbC.getCurrentValue: Double;
begin
  Result := fCurrentValue;
end;
//
procedure TCrCdQtQbC.setCurrentDate(Sender: TInterCampo);
begin
  fCurrentDate := Sender.AsDateTime;
end;
//
function TCrCdQtQbC.getCurrentDate: TDate;
begin
  Result := fCurrentDate;
end;
//
function TCrCdQtQbC.getFacMor: Integer;
begin
  result := Word( TIPO_MOVIMIENTO.AsString = coCondona)
end;
//
function TCrCdQtQbC.getFacImp: Integer;
begin
  result := Word( TIPO_MOVIMIENTO.AsString <> coCondona)
end;
// Determina si el filtro de búsqueda retornó información
function TCrCdQtQbC.Searched: Boolean;
begin
  Result := CatCredito.Active;
end;
//
function TCrCdQtQbC.getAdeudoTotal: Double;
var IntVigente : Real;
begin
  GetSQLFloat( 'SELECT  SUM(PKGCRPERIODO.ObtenImpCob( ID_CREDITO, NUM_PERIODO, NULL, ''IN'' ) ) IMP_INTERES ' +
               'FROM    CR_INTERES '   +
               'WHERE   ID_CREDITO = ' + IntToStr( Credito.ID_CREDITO.AsInteger ) +
               '  AND   SIT_INTERES IN (''AC'',''PA'') ',
               Apli.DataBaseName, Apli.SessionName, 'IMP_INTERES', IntVigente, False );


  Result := Credito.IMP_CAPITAL_VDO.AsFloat    +
            Credito.IMP_COMISION_VDO.AsFloat   +
            Credito.IMP_INTERES_VDO.AsFloat    +
            Credito.IMP_IVA_COM_VDO.AsFloat    +
            Credito.IMP_IVA_INT_VDO.AsFloat    +
            Credito.IMP_IVA_MOR_CAP.AsFloat    +
            Credito.IMP_IVA_MOR_COM.AsFloat    +
            Credito.IMP_IVA_MOR_FIN.AsFloat    +
            Credito.IMP_MOR_CAPITAL.AsFloat    +
            Credito.IMP_MOR_COMISION.AsFloat   +
            Credito.IMP_MOR_FINAN_A.AsFloat    +
            Credito.IMP_VDO_FINAN_A.AsFloat    +
            Credito.SDO_VIG_TOTAL.AsFloat      +
            IntVigente;
end;
//
procedure TCrCdQtQbC.ReCalculate;
var vlImpComision    : Double;
    vlImpInteres     : Double;
    vlImpCapitaliza  : Double;
    vlImpCapital     : Double;
    vlImpMComision   : Double;
    vlImpMInteres    : Double;
    vlImpMCapitaliza : Double;
    vlImpMCapital    : Double;
begin
  vlImpComision    := IMP_COMISION.AsFloat     * ( PCT_COMISION.AsFloat   / co100Pct ) * getFacImp;
  vlImpInteres     := IMP_INTERES.AsFloat      * ( PCT_INTERES.AsFloat    / co100Pct ) * getFacImp;
  vlImpCapitaliza  := IMP_CAPITALIZA.AsFloat   * ( PCT_CAPITALIZA.AsFloat / co100Pct ) * getFacImp;
  vlImpCapital     := IMP_CAPITAL.AsFloat      * ( PCT_CAPITAL.AsFloat    / co100Pct ) * getFacImp;
  //
  vlImpMComision   := IMP_M_COMISION.AsFloat   * ( PCT_COMISION.AsFloat   / co100Pct ) * getFacMor;
  vlImpMInteres    := IMP_M_INTERES.AsFloat    * ( PCT_INTERES.AsFloat    / co100Pct ) * getFacMor;
  vlImpMCapitaliza := IMP_M_CAPITALIZA.AsFloat * ( PCT_CAPITALIZA.AsFloat / co100Pct ) * getFacMor;
  vlImpMCapital    := IMP_M_CAPITAL.AsFloat    * ( PCT_CAPITAL.AsFloat    / co100Pct ) * getFacMor;
  //
  IMP_PCT_COMISION.AsString   := FormatFloat( coFmtFloat, vlImpComision   + vlImpMComision   );
  IMP_PCT_INTERES.AsString    := FormatFloat( coFmtFloat, vlImpInteres    + vlImpMInteres    );
  IMP_PCT_CAPITALIZA.AsString := FormatFloat( coFmtFloat, vlImpCapitaliza + vlImpMCapitaliza );
  IMP_PCT_CAPITAL.AsString    := FormatFloat( coFmtFloat, vlImpCapital    + vlImpMCapital    );
  // Totales
  IMP_TOTAL.AsFloat     := IMP_COMISION.AsFloat   +
                           IMP_INTERES.AsFloat    +
                           IMP_CAPITALIZA.AsFloat +
                           IMP_CAPITAL.AsFloat
                           ;
  IMP_M_TOTAL.AsFloat   := IMP_M_COMISION.AsFloat   +
                           IMP_M_INTERES.AsFloat    +
                           IMP_M_CAPITALIZA.AsFloat +
                           IMP_M_CAPITAL.AsFloat
                           ;
  IMP_PCT_TOTAL.AsFloat := IMP_PCT_COMISION.AsFloat   +
                           IMP_PCT_INTERES.AsFloat    +
                           IMP_PCT_CAPITALIZA.AsFloat +
                           IMP_PCT_CAPITAL.AsFloat
                           ;
  PCT_TOTAL.AsFloat     := coZeroPct;
end;

// Construye la cadena
function TCrCdQtQbC.BuildSQLStr: String;
var vlBuscaCred  : String;
    vlBuscaCon   : String;
    vlBuscaInt   : String;
    vlBuscaFin   : String;
    vlBuscaCap   : String;
    vlsql        : String;
Begin
  if Searched = False then exit;  // No ha seleccionado credito
  //
  vlBuscaCred:= 'AND CR.ID_CREDITO = ' + CatCredito.ID_CREDITO.AsString;
  //
  if B_TODOS_PERIODOS.AsString = 'V' then
  begin
    vlBuscaCon := ' WHERE CO.ID_CREDITO   = '   + CatCredito.ID_CREDITO.AsString + coCRLF +
                  '   AND CO.SIT_COMISION NOT IN ( ''CA'', ''LQ'' ) '   + coCRLF +
                  '   AND CO.ID_CREDITO   = CD.ID_CESION(+) '           + coCRLF +
                  '   AND CO.NUM_PERIODO  = CD.NUM_PERIODO_DOC(+) ';
  end else begin
    vlBuscaCon := ' WHERE CO.ID_CREDITO   = '   + CatCredito.ID_CREDITO.AsString + coCRLF +
                  '   AND CO.SIT_COMISION = ''IM'' '                    + coCRLF +
                  '   AND CO.ID_CREDITO   = CD.ID_CESION(+) '           + coCRLF +
                  '   AND CO.NUM_PERIODO  = CD.NUM_PERIODO_DOC(+) ';
  end;
  //
  if B_TODOS_PERIODOS.AsString = 'V' then
  begin
    vlBuscaInt := ' WHERE CI.ID_CREDITO    = '   + CatCredito.ID_CREDITO.AsString + coCRLF  +
                  '   AND CI.SIT_INTERES   NOT IN ( ''CA'', ''LQ'' ) ' + coCRLF +
                  '   AND ( ( CI.IMP_INTERES + CI.IMP_IVA ) - ( CI.IMP_PAGADO  + CI.IMP_IVA_PAGADO ) <> 0 )' + coCRLF  +
                  '   AND  CI.ID_CREDITO   = CD.ID_CESION(+) ' + coCRLF  +
                  '   AND  CI.NUM_PERIODO  = CD.NUM_PERIODO_DOC(+) ';
  end else begin
    vlBuscaInt := ' WHERE CI.ID_CREDITO    = '   + CatCredito.ID_CREDITO.AsString + coCRLF  +
                  '   AND CI.SIT_INTERES   = ''IM'' ' + coCRLF +
                  '   AND CI.ID_CREDITO    = CD.ID_CESION(+) ' + coCRLF  +
                  '   AND CI.NUM_PERIODO   = CD.NUM_PERIODO_DOC(+) ';
  end;
  //
  if B_TODOS_PERIODOS.AsString = 'V' then
  begin
    vlBuscaFin := ' WHERE FN.ID_CREDITO   = '   + CatCredito.ID_CREDITO.AsString + coCRLF +
                  '   AND FN.SIT_FINAN_ADIC NOT IN ( ''CA'', ''LQ'' ) ' + coCRLF +
                  '   AND FN.ID_CREDITO  = CD.ID_CESION(+) '            + coCRLF +
                  '   AND FN.NUM_PERIODO = CD.NUM_PERIODO_DOC(+) ';
  end else begin
    vlBuscaFin := ' WHERE FN.ID_CREDITO     = '   + CatCredito.ID_CREDITO.AsString + coCRLF +
                  '   AND FN.SIT_FINAN_ADIC = ''IM'' '                  + coCRLF +
                  '   AND FN.ID_CREDITO     = CD.ID_CESION(+) '         + coCRLF +
                  '   AND FN.NUM_PERIODO    = CD.NUM_PERIODO_DOC(+) ';
  end;
  //
  if B_TODOS_PERIODOS.AsString = 'V' then
  begin
    vlBuscaCap := ' WHERE CA.ID_CREDITO  = '   + CatCredito.ID_CREDITO.AsString + coCRLF +
                  '   AND CA.SIT_CAPITAL NOT IN ( ''CA'', ''LQ'' ) '   + coCRLF +
                  '   AND CA.ID_CREDITO  = CD.ID_CESION(+) '           + coCRLF +
                  '   AND CA.NUM_PERIODO = CD.NUM_PERIODO_DOC(+) ';
  end else begin
    vlBuscaCap := ' WHERE CA.ID_CREDITO  = '   + CatCredito.ID_CREDITO.AsString + coCRLF +
                  '   AND CA.SIT_CAPITAL = ''IM'' '                    + coCRLF +
                  '   AND CA.ID_CREDITO  = CD.ID_CESION(+) '           + coCRLF +
                  '   AND CA.NUM_PERIODO = CD.NUM_PERIODO_DOC(+) ';
  end;
  //
  // Arma la sentencia SQL.
  vlsql :=' SELECT PERIODO.*, '              + coCRLF +
          '        PKGCRCOMUN.STPOBTENFECHA( CTTO.ID_EMPRESA, ''D000'' ) F_D000 ' + coCRLF +
          ' FROM   CR_CREDITO C, '           + coCRLF +
          '        CR_CONTRATO L, '          + coCRLF +
          '        CONTRATO    CTTO, '       + coCRLF +
          '       ( '                        + coCRLF +
          '        SELECT ID_CREDITO, '      + coCRLF +
          '               NUM_PERIODO, '     + coCRLF +
          '               F_VENCIMIENTO, '   + coCRLF +
          '               ID_DOCUMENTO, '    + coCRLF +
          '               NUM_PERIODO_DOC, ' + coCRLF +
          '               DECODE( SUM(COMISION), 0, ''F'', ''V'' ) COMISION, ' + coCRLF +
          '               DECODE( SUM(INTERES),  0, ''F'', ''V'' ) INTERES, '  + coCRLF +
          '               DECODE( SUM(FIN_ADIC), 0, ''F'', ''V'' ) FIN_ADIC, ' + coCRLF +
          '               DECODE( SUM(CAPITAL),  0, ''F'', ''V'' ) CAPITAL '   + coCRLF +
          '        FROM   ( ' + coCRLF +
          '                 SELECT CO.ID_CREDITO,   CO.NUM_PERIODO,  CO.F_VENCIMIENTO, '   + coCRLF +
          '                        CO.F_PROG_PAGO,  CD.ID_DOCUMENTO, CD.NUM_PERIODO_DOC, ' + coCRLF +
          '                        1 COMISION,      0 INTERES, 0 FIN_ADIC, 0 CAPITAL '     + coCRLF +
          '                        FROM CR_COMISION CO, CR_DOCUMENTO CD '                  + coCRLF +
                            vlBuscaCon                                                     + coCRLF +
          '                 UNION '                                                        + coCRLF +
          '                 SELECT CI.ID_CREDITO,   CI.NUM_PERIODO,  CI.F_VENCIMIENTO, '   + coCRLF +
          '                        CI.F_PROG_PAGO,  CD.ID_DOCUMENTO, CD.NUM_PERIODO_DOC, ' + coCRLF +
          '                        0 COMISION,    1 INTERES, 0 FIN_ADIC, 0 CAPITAL '       + coCRLF +
          '                 FROM   CR_INTERES CI, CR_DOCUMENTO CD '                        + coCRLF +
                            vlBuscaInt                                                     + coCRLF +
          '                 UNION '                                                        + coCRLF +
          '                 SELECT FN.ID_CREDITO,   FN.NUM_PERIODO,   FN.F_VENCIMIENTO, '  + coCRLF +
          '                        FN.F_PROG_PAGO,  CD.ID_DOCUMENTO,  CD.NUM_PERIODO_DOC,' + coCRLF +
          '                        0 COMISION,    0 INTERES, 1 FIN_ADIC, 0 CAPITAL '       + coCRLF +
          '                 FROM   CR_FINAN_ADIC FN, CR_DOCUMENTO CD '                     + coCRLF +
                            vlBuscaFin                                                     + coCRLF +
          '                 UNION '                                                        + coCRLF +
          '                 SELECT CA.ID_CREDITO,   CA.NUM_PERIODO,   CA.F_VENCIMIENTO, '  + coCRLF +
          '                        CA.F_PROG_PAGO,  CD.ID_DOCUMENTO,  CD.NUM_PERIODO_DOC,' + coCRLF +
          '                        0 COMISION,    0 INTERES, 0 FIN_ADIC, 1 CAPITAL '       + coCRLF +
          '                 FROM   CR_CAPITAL CA, CR_DOCUMENTO CD '                        + coCRLF +
                            vlBuscaCap                                                     + coCRLF +
          '               ) CRE '                                                          + coCRLF +
          '        GROUP BY ID_CREDITO,   NUM_PERIODO,     F_VENCIMIENTO, '                + coCRLF +
          '                 ID_DOCUMENTO, NUM_PERIODO_DOC '                                + coCRLF +
          '       ) PERIODO  '                                                             + coCRLF +
          ' WHERE C.ID_CREDITO    =  ' + CatCredito.ID_CREDITO.AsString                    + coCRLF +
          '   AND CTTO.ID_EMPRESA =  ' + IntToStr(Apli.IdEmpresa)                          + coCRLF +
          '   AND C.ID_CONTRATO   = L.ID_CONTRATO   '                                      + coCRLF +
          '   AND C.FOL_CONTRATO  = L.FOL_CONTRATO  '                                      + coCRLF +
          '   AND L.ID_CONTRATO   = CTTO.ID_CONTRATO'
          ;

  //
  Result := vlsql;
end;
//
procedure TCrCdQtQbC.stpObtAdeudo(peIdCredito, peNumPeriodo: Integer;
    peCveComision: String; pFCalculo :  TDate; pFactor : Double; pBIVA,
    pCveAccesorio: String; var vlTotal, vlImporte, vlIVA, vlBenBco, vlBenGob,
    vlMoras, vlIVAMoras: Double; var psResult : Integer; var psError: String );
var  STPObtAdeudo : TStoredProc;
Begin
  psError  := '';
  psResult := 99;
  STPObtAdeudo := TStoredProc.Create(Nil);
  try
    with STPObtAdeudo do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:='PKGCRPERIODO.STPINTOBTADEUDO';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam( ftInteger, 'peIdCredito',    ptInput  );
      Params.CreateParam( ftInteger, 'peNumPeriodo',   ptInput  );
      Params.CreateParam( ftString,  'peCveComision',  ptInput  );
      Params.CreateParam( ftDate,    'peFReferencia',  ptInput  );
      Params.CreateParam( ftDate,    'peFCalculo',     ptInput  );
      Params.CreateParam( ftFloat,   'peFactor',       ptInput  );
      Params.CreateParam( ftString,  'peBIVA',         ptInput  );
      Params.CreateParam( ftString,  'peCveAccesorio', ptInput  );
      Params.CreateParam( ftString,  'peBCobranza',    ptInput  );
      Params.CreateParam( ftFloat,   'psImporte',      ptOutput );
      Params.CreateParam( ftFloat,   'psIVA',          ptOutput );
      Params.CreateParam( ftFloat,   'psBenBco',       ptOutput );
      Params.CreateParam( ftFloat,   'psBenGob',       ptOutput );
      Params.CreateParam( ftFloat,   'psMoras',        ptOutput );
      Params.CreateParam( ftFloat,   'psIVAMoras',     ptOutput );
      Params.CreateParam( ftFloat,   'psTotal',        ptOutput );
      Params.CreateParam( ftFloat,   'psTasa',         ptOutput );
      //
      Params.CreateParam( ftFloat,   'psResultado',   ptOutput);
      Params.CreateParam( ftString,  'psTxResultado', ptOutput);
      //
      ParamByName('peIdCredito').AsInteger  := peIdCredito;
      ParamByName('peNumPeriodo').AsInteger := peNumPeriodo;
      ParamByName('peCveComision').AsString := peCveComision;
      ParamByName('peFReferencia').AsDateTime := Apli.DameFechaEmpresa;
      ParamByName('peFCalculo').AsDate        := pFCalculo;
      ParamByName('peFactor').AsFloat         := pFactor;
      ParamByName('peBIVA').AsString          := pBIVA;
      ParamByName('peCveAccesorio').AsString  := pCveAccesorio;
      ParamByName('peBCobranza').AsString     := 'V';
      ExecProc;
      //
      psResult := ParamByName('PSResultado').AsInteger;
      if ( psResult = 0 ) then
      begin
        vlImporte := ParamByName('psImporte').AsFloat;
        vlIVA     := ParamByName('psIVA').AsFloat;
        vlBenBco  := ParamByName('psBenBco').AsFloat;
        vlBenGob  := ParamByName('psBenGob').AsFloat;
        vlMoras   := ParamByName('psMoras').AsFloat;
        vlIVAMoras:= ParamByName('psIVAMoras').AsFloat;
        vlTotal   := ParamByName('psTotal').AsFloat;
      end
      else
      begin
        psError := 'Problemas al obtener el adeudo: ' + coCRLF +
                   'Código : ' + ParamByName('psRESULTADO').AsString + coCRLF +
                   'Mensaje: ' + ParamByName('psTxResultado').AsString;
      end;
    end;
  finally
    STPObtAdeudo.Free;
  end;
end;
//
procedure TCrCdQtQbC.stpAplMovto( pidCredito   : Integer;  pCvemovto    : String;
                                  pTipoAplica  : String;   pBTodosPer   : String;
                                  var psResult : Integer;  var  vlError : String);
var  STPObtAplMovt : TStoredProc;
Begin
  vlError := '';
  STPObtAplMovt := TStoredProc.Create(Nil);
  try
    with STPObtAplMovt do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:='PKGCRCOBRANZA.STPCONDQTQBCT';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam( ftInteger, 'PEIDCREDITO',    ptInput  );
      Params.CreateParam( ftString,  'PECVETIPMOVTO',  ptInput  );
      Params.CreateParam( ftString,  'PETIPOAPLICA',   ptInput  );
      Params.CreateParam( ftString,  'PEBALLPERIODOS', ptInput  );
      Params.CreateParam( ftString,  'PECVEUSUARIO',   ptInput  );
      Params.CreateParam( ftString,  'PEBCOMMIT',      ptInput  );
      Params.CreateParam( ftFloat,   'PSRESULTADO',    ptOutput);
      Params.CreateParam( ftString,  'PSTXRESULTADO',  ptOutput);
      //
      ParamByName('peIdCredito').AsInteger   := pIdCredito;
      ParamByName('peCveTipMovto').AsString  := pCvemovto;
      ParamByName('peTipoAplica').AsString   := pTipoAplica;
      ParamByName('peBAllPeriodos').AsString := pBTodosPer;
      ParamByName('peCveUsuario').AsString   := Apli.Usuario;
      ParamByName('peBCommit').AsString      := 'V';
      ExecProc;
      if (ParamByName('PSResultado').AsInteger <> 0) then
      begin
        vlError := 'Problemas al aplicar el movimiento: ' + coCRLF +
                   'Código : ' + ParamByName('psRESULTADO').AsString + coCRLF +
                   'Mensaje: ' + ParamByName('psTxResultado').AsString;
      end
      else
      begin
        vlError := 'MOVIMIENTO APLICADO OK ';
      end;
    end;
  finally
    STPObtAplMovt.Free;
  end;
end;
//
{
procedure TCrCdQtQbC.stpAplMovto(pidCredito: Integer;
                                 pFValor: TDate;
                                 pTxNota: String;
                                 pCvemovto    : String;
                                 pPctComision, pPctInteres, pPctFinAdic, pPctCapital,
                                 pImpXAcplCon, pImpXAplInt, pImpXAplFin, pImpXAplCap: Double;
                                 var vlError: String);
}

      //
      {
      Params.CreateParam( ftDate,    'PEFECHAVALOR',   ptInput  );
      Params.CreateParam( ftString,  'PETXNOTA',       ptInput  );
      Params.CreateParam( ftFloat,   'PEPCT_COMISION',ptInput);
      Params.CreateParam( ftFloat,   'PEPCT_INTERES',ptInput);
      Params.CreateParam( ftFloat,   'PEPCT_FIN_ADIC',ptInput);
      Params.CreateParam( ftFloat,   'PEPCT_CAPITAL',ptInput);
      Params.CreateParam( ftFloat,   'PEIMP_X_APL_CON',ptInput);
      Params.CreateParam( ftFloat,   'PEIMP_X_APL_INT',ptInput);
      Params.CreateParam( ftFloat,   'PEIMP_X_APL_FIN',ptInput);
      Params.CreateParam( ftFloat,   'PEIMP_X_APL_CAP',ptInput);
      }
      //
      {
      ParamByName('peFechaValor').AsDateTime := pFValor;
      ParamByName('peTxNota').AsString := pTxNota;
      ParamByName('pePct_Comision').AsFloat := pPctComision;
      ParamByName('pePct_Interes').AsFloat := pPctInteres;
      ParamByName('pePct_Fin_Adic').AsFloat := pPctFinAdic;
      ParamByName('pePct_Capital').AsFloat := pPctCapital;
      ParamByName('peImp_x_Apl_con').AsFloat := pImpXAcplCon;
      ParamByName('peImp_x_Apl_int').AsFloat := pImpXAplInt;
      ParamByName('peImp_x_Apl_fin').AsFloat := pImpXAplFin;
      ParamByName('peImp_x_Apl_cap').AsFloat := pImpXAplCap;
      }
//
procedure TCrCdQtQbC.stpClrTbl(var psResult: Integer; var psError: String);
var  STPClrTbl : TStoredProc;
Begin
  psError   := '';
  psResult  := 99;
  STPClrTbl := TStoredProc.Create(Nil);
  try
    with STPClrTbl do
    begin
      DatabaseName:= Apli.DatabaseName;
      SessionName:= Apli.SessionName;
      StoredProcName:= 'PKGCRCOBRANZA.STPCLRTBLCONDQTQBCT';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam(ftFloat, 'PSRESULTADO',  ptOutput);
      Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
      //
      ExecProc;
      psResult := ParamByName('PSResultado').AsInteger;
      if ( psResult <> 0) then
      begin
        psError := 'Problemas al limpiar tabla de movimientos: '       + coCRLF +
                   'Código : ' + ParamByName('psResultado').AsString   + coCRLF +
                   'Mensaje: ' + ParamByName('psTxResultado').AsString;
      end;
    end;
  finally
    STPClrTbl.Free;
  end;
end;
//
//
procedure TCrCdQtQbC.StpAddTbl(pidCredito, pNumPeriodo: Integer;
                               pFVentto,   pFValor    : TDate;
                               pTx_Nota: String;
                               pPctComision, pPctInteres,  pPctFinAdic,
                               pPctCapital,  pImpXAcplCon, pImpXAplInt,
                               pImpXAplFin,  pImpXAplCap : Double;
                               var psResult: Integer;  var psError: String);
var  STPAddElemento : TStoredProc;
Begin
   STPAddElemento := TStoredProc.Create(Nil);
   psResult:= 99;
   psError := '';
   try
      with STPAddElemento do
      begin
        DatabaseName:= Apli.DatabaseName;
        SessionName:= Apli.SessionName;
        StoredProcName:= 'PKGCRCOBRANZA.STPADDCONDQTQBCT';
        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftInteger, 'id_credito',    ptInput );
        Params.CreateParam(ftInteger, 'num_periodo',   ptInput );
        Params.CreateParam(ftDate,    'f_vencimiento', ptInput );
        Params.CreateParam(ftDate,    'f_valor',       ptInput );
        Params.CreateParam(ftString,  'tx_nota',       ptInput );
        //
        Params.CreateParam(ftFloat,   'pct_comision',  ptInput );
        Params.CreateParam(ftFloat,   'pct_interes',   ptInput );
        Params.CreateParam(ftFloat,   'pct_fin_adic',  ptInput );
        Params.CreateParam(ftFloat,   'pct_capital',   ptInput );
        //
        Params.CreateParam(ftFloat,   'imp_x_apl_con', ptInput );
        Params.CreateParam(ftFloat,   'imp_x_apl_int', ptInput );
        Params.CreateParam(ftFloat,   'imp_x_apl_fin', ptInput );
        Params.CreateParam(ftFloat,   'imp_x_apl_cap', ptInput );
        //
        Params.CreateParam(ftFloat,   'psResultado',   ptOutput );
        Params.CreateParam(ftString,  'psTxResultado', ptOutput );
        //
        //
        ParamByName('id_credito').AsInteger  := pidCredito;
        ParamByName('num_periodo').AsInteger := pNumPeriodo;
        ParamByName('f_vencimiento').AsDate  := pFVentto;
        ParamByName('f_valor').AsDate        := pFValor;
        ParamByName('tx_nota').AsString      := pTx_Nota;
        //
        if TIPO_APLICACION.AsString = coGlobal then
        begin
          ParamByName('num_periodo').Clear;
          ParamByName('f_vencimiento').Clear;
        end;
        //
        ParamByName('pct_comision').AsFloat  := pPctComision;
        ParamByName('pct_interes').AsFloat   := pPctInteres;
        ParamByName('pct_fin_adic').AsFloat  := pPctFinAdic;
        ParamByName('pct_capital').AsFloat   := pPctCapital;
        //
        ParamByName('imp_x_apl_con').AsFloat := pImpXAcplCon;
        ParamByName('imp_x_apl_int').AsFloat := pImpXAplInt;
        ParamByName('imp_x_apl_fin').AsFloat := pImpXAplFin;
        ParamByName('imp_x_apl_cap').AsFloat := pImpXAplCap;
        //
        ParamByName('psResultado').AsFloat    := 0;
        ParamByName('psTxResultado').AsString := '';
        ExecProc;
        psResult:= ParamByName('psResultado').AsInteger;
        if ( psResult <> 0 ) then
        begin
           psError := 'Problemas al agregar datos : '                      + coCRLF +
                      'Código : ' + ParamByName('psRESULTADO').AsString    + coCRLF +
                      'Mensaje: ' + ParamByName('psTxResultado').AsString;
        end;
      end;
   finally
     STPAddElemento.Free;
   end;
end;
//
//
function TCrCdQtQbC.StpObtCntLog: Integer;
var spObtCntlog : TStoredProc;
begin
  spObtCntlog := TStoredProc.Create(Nil);
  try
    with spObtCntlog do
    begin
      DatabaseName   := Apli.DatabaseName;
      SessionName    := Apli.SessionName;
      StoredProcName := 'PKGCRCOBRANZA.STPOBTENCNTLOG';
      Params.Clear;
      Params.CreateParam( ftFloat,  'psNumItems',    ptOutput );
      Params.CreateParam( ftFloat,  'psResultado',   ptOutput );
      Params.CreateParam( ftString, 'psTxResultado', ptOutput );
      ExecProc;
      if ParamByName( 'psResultado' ).AsInteger = 0 then
        Result := ParamByName( 'psNumItems' ).AsInteger
      else
        Result := -1;
      //ends_if
    end;
  finally
    if assigned(spObtCntlog) then
      spObtCntlog.Free;
    //ends_if
  end;
end;
//
//
procedure TCrCdQtQbC.StpObtLog(peIndice: Integer; var vlError: Integer;
  var vlTxError: String);
var spObtlog : TStoredProc;
begin
  spObtlog := TStoredProc.Create(Nil);
  try
    with spObtlog do
    begin
      DatabaseName   := Apli.DatabaseName;
      SessionName    := Apli.SessionName;
      StoredProcName := 'PKGCRCOBRANZA.STPOBTENLOG';
      Params.Clear;
      Params.CreateParam( ftFloat,  'peIndice',      ptInput );
      Params.CreateParam( ftFloat,  'psLogResult',   ptOutput );
      Params.CreateParam( ftString, 'psLogTxResult', ptOutput );
      Params.CreateParam( ftFloat,  'psResultado',   ptOutput );
      Params.CreateParam( ftString, 'psTxResultado', ptOutput );
      ParamByName( 'peIndice' ).AsInteger := peIndice;
      ExecProc;
      if ParamByName( 'psResultado' ).AsInteger = 0 then
      begin
        vlError   := ParamByName( 'psLogResult' ).AsInteger;
        vlTxError := ParamByName( 'psLogTxResult' ).AsString;
      end else begin
        vlError   := ParamByName( 'psResultado' ).AsInteger;
        vlTxError := 'Error Interno: ' + ParamByName( 'psTxResultado' ).AsString;
      end;
      //ends_if
    end;
  finally
    if assigned(spObtlog) then
      spObtlog.Free;
    //ends_if
  end;
end;
{
+ ------------------------- FORMA CRQTQEBCAST -------------------------------- +
+                                                                              +
+                          FORMA DE CRQTQEBCAST                                +
+                                                                              +
+ ---------------------------------------------------------------------------- +
}
//
procedure TWCrCdQtQbC.LimpiaMontos(BLimpiaPCT : Boolean );
begin
  Objeto.IMP_COMISION.AsFloat     := coZeroPct;
  Objeto.IMP_INTERES.AsFloat      := coZeroPct;
  Objeto.IMP_CAPITALIZA.AsFloat   := coZeroPct;
  Objeto.IMP_CAPITAL.AsFloat      := coZeroPct;
  Objeto.IMP_TOTAL.AsFloat        := coZeroPct;
  //
  Objeto.IMP_M_COMISION.AsFloat   := coZeroPct;
  Objeto.IMP_M_INTERES.AsFloat    := coZeroPct;
  Objeto.IMP_M_CAPITALIZA.AsFloat := coZeroPct;
  Objeto.IMP_M_CAPITAL.AsFloat    := coZeroPct;
  Objeto.IMP_M_TOTAL.AsFloat      := coZeroPct;
  //
  Objeto.IMP_PCT_COMISION.AsFloat   := coZeroPct;
  Objeto.IMP_PCT_INTERES.AsFloat    := coZeroPct;
  Objeto.IMP_PCT_CAPITALIZA.AsFloat := coZeroPct;
  Objeto.IMP_PCT_CAPITAL.AsFloat    := coZeroPct;
  Objeto.IMP_PCT_TOTAL.AsFloat      := coZeroPct;
  //
  //
  Objeto.IMP_COMISION.DrawControl;
  Objeto.IMP_INTERES.DrawControl;
  Objeto.IMP_CAPITALIZA.DrawControl;
  Objeto.IMP_CAPITAL.DrawControl;
  Objeto.IMP_TOTAL.DrawControl;
  //
  Objeto.IMP_M_COMISION.DrawControl;
  Objeto.IMP_M_INTERES.DrawControl;
  Objeto.IMP_M_CAPITALIZA.DrawControl;
  Objeto.IMP_M_CAPITAL.DrawControl;
  Objeto.IMP_M_TOTAL.DrawControl;
  //
  Objeto.PCT_COMISION.DrawControl;
  Objeto.PCT_INTERES.DrawControl;
  Objeto.PCT_CAPITALIZA.DrawControl;
  Objeto.PCT_CAPITAL.DrawControl;
  Objeto.PCT_TOTAL.DrawControl;
  //
  Objeto.IMP_PCT_COMISION.DrawControl;
  Objeto.IMP_PCT_INTERES.DrawControl;
  Objeto.IMP_PCT_CAPITALIZA.DrawControl;
  Objeto.IMP_PCT_CAPITAL.DrawControl;
  Objeto.IMP_PCT_TOTAL.DrawControl;
    //
  if BLimpiaPCT then
  begin
    Objeto.PCT_COMISION.AsFloat   := coZeroPct;
    Objeto.PCT_INTERES.AsFloat    := coZeroPct;
    Objeto.PCT_CAPITALIZA.AsFloat := coZeroPct;
    Objeto.PCT_CAPITAL.AsFloat    := coZeroPct;
    Objeto.PCT_TOTAL.AsFloat      := coZeroPct;
  end;
  //
end;
//
procedure TWCrCdQtQbC.AsignaFVAlor(peFecha: TDateTime);
begin
  idtF_VALOR.DateTime := peFecha;
  Objeto.F_VALOR.AsDateTime := peFecha;
end;
//
procedure TWCrCdQtQbC.LimpiaGrid;
var vlCol, vlRow : Integer;
begin
  // Barre el grid de datos y quita la información
  for vlRow := 0 to sagDATOS.RowCount - 1 do
  begin
    for vlCol := 0 to sagDATOS.ColCount - 1 do
    begin
      sagDATOS.Cells    [ vlCol, vlRow ] := '';
      sagDATOS.ColorCell[ vlCol, vlRow ] := clWindow;
      //
      if  vlCol > COL_VIS then
        sagDATOS.ColWidths[vlCol]:= 0;
      //ends_if
    end;
    sagDATOS.RowHeights[ vlRow ] := sagDATOS.DefaultRowHeight;
  end;
  sagDATOS.RowCount := 0;
  //
  Application.ProcessMessages;
end;
//
// Realiza la búsqueda de información a través de un filtro
function TWCrCdQtQbC.BeginSearch(BBusca: Boolean; const Llave: array of TVarRec): Boolean;
begin
  if BBusca then
    Result := Objeto.CatCredito.Busca
  else
    Result := Objeto.CatCredito.FindKey( Llave );
  //
  Objeto.CatCredito.ContratoCre.Acreditado.Persona.Nombre.DrawControl;
  // Obtiene el valor del control
  Objeto.VALOR_FILTRO.GetFromControl;
  cbFiltro.Checked := Result;
end;
//
procedure TWCrCdQtQbC.stpObtenMontos(peIdCredito  : Integer;
                peNumPeriodo : Integer;     peFCalculo   : TDate;
                peFactor     : Double;      peBIVA       : String;
                peBComision  : String;      peBInteres   : String;
                peBFinAdic   : String;      peBCapital   : String;
                var  psImpComision,  psImpMoraCom,
                     psImpInteres,   psImpMoraInt,
                     psImpFinAdic,   psImpMorFAdic,
                     psImpCapital,   psImpMoraCap : Double
                );
var i         : integer;
    vlBCalc   : boolean;
    vlCveAcc  : string;
    vlImpBru,
    vlImpIVA,
    vlImpMor,
    vlIVAMor,
    vlBenBco,
    vlBenGob,
    vlImpTot  : Double;
    vlResult  : Integer;
    vlError   : String;
begin
  psImpComision := 0;      psImpMoraCom  := 0;
  psImpInteres  := 0;      psImpMoraInt  := 0;
  psImpFinAdic  := 0;      psImpMorFAdic := 0;
  psImpCapital  := 0;      psImpMoraCap  := 0;
  //
  for i := 1 to 4 do
  begin
    vlCveAcc := '';
    vlBCalc  := False;
    case i of
      1 : begin
            vlBCalc  := ( peBComision = 'V' );
            vlCveAcc := coComision;
          end;
      2 : begin
            vlBCalc  := ( peBInteres  = 'V' );
            vlCveAcc := coInteres;
          end;
      3 : begin
            vlBCalc  := ( peBFinAdic  = 'V' );
            vlCveAcc := coFinAdic;
          end;
      4 : begin
            vlBCalc  := ( peBCapital  = 'V' );
            vlCveAcc := coCapital;
          end;
    end;
    //
    if vlBCalc then
    begin
      Objeto.stpObtAdeudo( peIdCredito, peNumPeriodo, '', peFCalculo, peFactor,
                           peBIVA,      vlCveAcc,     vlImpTot,       vlImpBru,
                           vlImpIVA,    vlBenBco,     vlBenGob,       vlImpMor,
                           vlIVAMor,    vlResult,     vlError );
      if vlResult <> 0 then
        raise Exception.Create( Format( '%d %s', [ vlResult, vlError ] ) );
      //
      {
      if Objeto.TIPO_MOVIMIENTO.AsString = coCondona then
      begin
        psImpMoraCom  := psImpMoraCom  + ( ( vlImpMor + vlIVAMor ) * word( vlCveAcc = coComision )  );
        psImpMoraInt  := psImpMoraInt  + ( ( vlImpMor + vlIVAMor ) * word( vlCveAcc = coInteres  )  );
        psImpMorFAdic := psImpMorFAdic + ( ( vlImpMor + vlIVAMor ) * word( vlCveAcc = coFinAdic  )  );
        psImpMoraCap  := psImpMoraCap  + ( ( vlImpMor + vlIVAMor ) * word( vlCveAcc = coCapital  )  );
      end else begin
        psImpComision := psImpComision + ( ( vlImpBru + vlImpIVA ) * word( vlCveAcc = coComision )  );
        psImpInteres  := psImpInteres  + ( ( vlImpBru + vlImpIVA ) * word( vlCveAcc = coInteres  )  );
        psImpFinAdic  := psImpFinAdic  + ( ( vlImpBru + vlImpIVA ) * word( vlCveAcc = coFinAdic  )  );
        psImpCapital  := psImpCapital  + ( ( vlImpBru + vlImpIVA ) * word( vlCveAcc = coCapital  )  );
      end;
      }
      psImpMoraCom  := psImpMoraCom  + ( ( vlImpMor + vlIVAMor ) * word( vlCveAcc = coComision )  );
      psImpMoraInt  := psImpMoraInt  + ( ( vlImpMor + vlIVAMor ) * word( vlCveAcc = coInteres  )  );
      psImpMorFAdic := psImpMorFAdic + ( ( vlImpMor + vlIVAMor ) * word( vlCveAcc = coFinAdic  )  );
      psImpMoraCap  := psImpMoraCap  + ( ( vlImpMor + vlIVAMor ) * word( vlCveAcc = coCapital  )  );
      psImpComision := psImpComision + ( ( vlImpBru + vlImpIVA ) * word( vlCveAcc = coComision )  );
      psImpInteres  := psImpInteres  + ( ( vlImpBru + vlImpIVA ) * word( vlCveAcc = coInteres  )  );
      psImpFinAdic  := psImpFinAdic  + ( ( vlImpBru + vlImpIVA ) * word( vlCveAcc = coFinAdic  )  );
      psImpCapital  := psImpCapital  + ( ( vlImpBru + vlImpIVA ) * word( vlCveAcc = coCapital  )  );
    end;
  end;
  //
end;
//
procedure TWCrCdQtQbC.ShowData;
var Qry       : TQuery;
    vlImpCom  : Double;
    vlMorCom  : Double;
    vlImpInt  : Double;
    vlMorInt  : Double;
    vlImpFin  : Double;
    vlMorFin  : Double;
    vlImpCap  : Double;
    vlMorCap  : Double;
    vlImpTotCN: Double;
    vlImpTotIN: Double;
    vlImpTotFN: Double;
    vlImpTotCP: Double;
    vlBAgrega : Boolean;
    nRowCount : Integer;
    R         : TGridRect;
    CanSelect : Boolean;
begin
  Selected  := False;
  DataFound := False;
  // Obtiene la informacion de la disposicion
  Objeto.Credito.LlenaDatos( Objeto.VALOR_FILTRO.AsInteger  );
  // Obtiene tipo de aplicacion y tipo de movimiento
  Objeto.TIPO_MOVIMIENTO.GetFromControl;
  Objeto.TIPO_APLICACION.GetFromControl;
  Objeto.B_TODOS_PERIODOS.GetFromControl;
  //
  Objeto.ADEUDO_TOTAL.AsFloat := Objeto.getAdeudoTotal;
  //
  // Inicializa valores de la sección de parametros
  AsignaFVAlor(Objeto.Apli.DameFechaEmpresa);
  Objeto.FACT_MORAS.AsFloat     := Objeto.Credito.FACT_MORAS.AsFloat;
  Objeto.B_APLICA_IVA.AsString  := Objeto.Credito.B_APLICA_IVA.AsString;
  // Check box selecciona
  cbSelecciona.Checked := True;
  //
  nRowCount := 0;
  //
  LimpiaMontos( True );
  LimpiaGrid;
  // Llena el grid de datos
  Qry := GetSQLQueryNoNil( Objeto.BuildSQLStr, Objeto.Apli.DataBaseName,
                           Objeto.Apli.SessionName,  False );
  if Assigned(Qry) and not( Qry.IsEmpty ) then
  begin
    //try Qry.SQL.SaveToFile('C:\GyM\MODULO CONDONACIONES\SQL\SQLSTR.INI.SQL'); except beep; end;
    Qry.First;
    //
    while not Qry.Eof do
    begin
      //
      stpObtenMontos( Qry.FieldByName('ID_CREDITO').AsInteger,
                      Qry.FieldByName('NUM_PERIODO').AsInteger,
                      Objeto.F_VALOR.AsDateTime,
                      Objeto.FACT_MORAS.AsFloat,
                      Objeto.B_APLICA_IVA.AsString,
                      Qry.FieldByName('COMISION').AsString,
                      Qry.FieldByName('INTERES').AsString,
                      Qry.FieldByName('FIN_ADIC').AsString,
                      Qry.FieldByName('CAPITAL').AsString,
                      vlImpCom,
                      vlMorCom,
                      vlImpInt,
                      vlMorInt,
                      vlImpFin,
                      vlMorFin,
                      vlImpCap,
                      vlMorCap
                    );
      //
      vlBAgrega := ( vlImpCom > 0 ) or ( vlMorCom > 0 ) or ( vlImpInt > 0 ) or
                   ( vlMorInt > 0 ) or ( vlImpFin > 0 ) or ( vlMorFin > 0 ) or
                   ( vlImpCap > 0 ) or ( vlMorCap > 0 );
      //
      if ( Objeto.TIPO_MOVIMIENTO.AsString = coCondona ) and
         ( Qry.FieldByName('F_VENCIMIENTO').AsDateTime >= Qry.FieldByName('F_D000').AsDateTime ) then
      begin
        vlBAgrega := False;
      end;
      //
      if ( Objeto.TIPO_APLICACION.AsString = coDetalle ) then
      begin
        if ( vlBAgrega ) then
        begin
            DataFound := True;
            sagDATOS.RowCount := nRowCount + 1;
            with sagDATOS do
            begin
              AlignCell[COL_CN, nRowCount] := alRight;
              AlignCell[COL_IN, nRowCount] := alRight;
              AlignCell[COL_FN, nRowCount] := alRight;
              AlignCell[COL_CP, nRowCount] := alRight;
              AlignCell[COL_TO, nRowCount] := alRight;
              //
              if Qry.FieldByName('ID_DOCUMENTO').AsString <> '' then
                Cells[ COL_DPER,  nRowCount] := Qry.FieldByName('ID_DOCUMENTO').AsString
              else
                Cells[ COL_DPER,  nRowCount] := Qry.FieldByName('NUM_PERIODO').AsString;
              //ends_if
              vlImpTotCN := ( ( vlImpCom * Objeto.getFacImp ) + ( vlMorCom * Objeto.getFacMor ) );
              vlImpTotIN := ( ( vlImpInt * Objeto.getFacImp ) + ( vlMorInt * Objeto.getFacMor ) );
              vlImpTotFN := ( ( vlImpFin * Objeto.getFacImp ) + ( vlMorFin * Objeto.getFacMor ) );
              vlImpTotCP := ( ( vlImpCap * Objeto.getFacImp ) + ( vlMorCap * Objeto.getFacMor ) );
              //
              Cells[ COL_FVE, nRowCount ]  := Qry.FieldByName('F_VENCIMIENTO').AsString;
              Cells[ COL_CN,  nRowCount ]  := FormatCurr(coFmtCurrency, vlImpTotCN );
              Cells[ COL_IN,  nRowCount ]  := FormatCurr(coFmtCurrency, vlImpTotIN );
              Cells[ COL_FN,  nRowCount ]  := FormatCurr(coFmtCurrency, vlImpTotFN );
              Cells[ COL_CP,  nRowCount ]  := FormatCurr(coFmtCurrency, vlImpTotCP );
              Cells[ COL_TO,  nRowCount ]  := FormatCurr(coFmtCurrency, vlImpTotCN +
                                                                        vlImpTotIN +
                                                                        vlImpTotFN +
                                                                        vlImpTotCP );
              //
              Cells[ COL_CNIB, nRowCount ] := FloatToStr( vlImpCom );
              Cells[ COL_INIB, nRowCount ] := FloatToStr( vlImpInt );
              Cells[ COL_FNIB, nRowCount ] := FloatToStr( vlImpFin );
              Cells[ COL_CPIB, nRowCount ] := FloatToStr( vlImpCap );
              //
              Cells[ COL_CNIM, nRowCount ] := FloatToStr( vlMorCom );
              Cells[ COL_INIM, nRowCount ] := FloatToStr( vlMorInt );
              Cells[ COL_FNIM, nRowCount ] := FloatToStr( vlMorFin );
              Cells[ COL_CPIM, nRowCount ] := FloatToStr( vlMorCap );
              //
              Cells[ COL_CNPC, nRowCount ] := FloatToStr( co100Pct );
              Cells[ COL_INPC, nRowCount ] := FloatToStr( co100Pct );
              Cells[ COL_FNPC, nRowCount ] := FloatToStr( co100Pct );
              Cells[ COL_CPPC, nRowCount ] := FloatToStr( co100Pct );
              //
              Cells[ COL_BCN, nRowCount ] := Qry.FieldByName('COMISION').AsString;
              Cells[ COL_BIN, nRowCount ] := Qry.FieldByName('INTERES').AsString;
              Cells[ COL_BFN, nRowCount ] := Qry.FieldByName('FIN_ADIC').AsString;
              Cells[ COL_BCP, nRowCount ] := Qry.FieldByName('CAPITAL').AsString;
              //
              Cells[ COL_FVA, nRowCount ] := DateToStr(Objeto.F_VALOR.AsDateTime);
              Cells[ COL_PER, nRowCount ] := Qry.FieldByName('NUM_PERIODO').AsString;
            end;
            inc(nRowCount);
        end;//ends_if_(_vlBAgrega_)_then
      end else begin
        Objeto.IMP_COMISION.AsFloat     := Objeto.IMP_COMISION.AsFloat     + vlImpCom;
        Objeto.IMP_M_COMISION.AsFloat   := Objeto.IMP_M_COMISION.AsFloat   + vlMorCom;
        Objeto.IMP_INTERES.AsFloat      := Objeto.IMP_INTERES.AsFloat      + vlImpInt;
        Objeto.IMP_M_INTERES.AsFloat    := Objeto.IMP_M_INTERES.AsFloat    + vlMorInt;
        Objeto.IMP_CAPITALIZA.AsFloat   := Objeto.IMP_CAPITALIZA.AsFloat   + vlImpFin;
        Objeto.IMP_M_CAPITALIZA.AsFloat := Objeto.IMP_M_CAPITALIZA.AsFloat + vlMorFin;
        Objeto.IMP_CAPITAL.AsFloat      := Objeto.IMP_CAPITAL.AsFloat      + vlImpCap;
        Objeto.IMP_M_CAPITAL.AsFloat    := Objeto.IMP_M_CAPITAL.AsFloat    + vlMorCap;
      end;
      //
      Qry.Next;
    end;
    //
    if Objeto.TIPO_APLICACION.AsString = coGlobal then
    begin
        nRowCount := 0;
        sagDATOS.RowCount := 1;
        DataFound := True;
        with sagDATOS do
        begin
          AlignCell[ COL_CN, nRowCount ] := alRight;
          AlignCell[ COL_IN, nRowCount ] := alRight;
          AlignCell[ COL_FN, nRowCount ] := alRight;
          AlignCell[ COL_CP, nRowCount ] := alRight;
          AlignCell[ COL_TO, nRowCount ] := alRight;
          //
          Cells[ COL_DPER,nRowCount ] := 'TODOS';
          Cells[ COL_FVE, nRowCount ] := Objeto.Credito.F_VENCIMIENTO.AsString;
          //
          with Objeto do
          begin
            vlImpTotCN := ( ( IMP_COMISION.AsFloat * getFacImp   ) + ( IMP_M_COMISION.AsFloat * getFacMor   ) );
            vlImpTotIN := ( ( IMP_INTERES.AsFloat * getFacImp    ) + ( IMP_M_INTERES.AsFloat * getFacMor    ) );
            vlImpTotFN := ( ( IMP_CAPITALIZA.AsFloat * getFacImp ) + ( IMP_M_CAPITALIZA.AsFloat * getFacMor ) );
            vlImpTotCP := ( ( IMP_CAPITAL.AsFloat * getFacImp    ) + ( IMP_M_CAPITAL.AsFloat * getFacMor    ) );
          end;
          //
          Cells[ COL_CN,  nRowCount ] := FormatCurr(coFmtCurrency, vlImpTotCN );
          Cells[ COL_IN,  nRowCount ] := FormatCurr(coFmtCurrency, vlImpTotIN );
          Cells[ COL_FN,  nRowCount ] := FormatCurr(coFmtCurrency, vlImpTotFN );
          Cells[ COL_CP,  nRowCount ] := FormatCurr(coFmtCurrency, vlImpTotCP );
          Cells[ COL_TO,  nRowCount ] := FormatCurr(coFmtCurrency, vlImpTotCN   +
                                                                   vlImpTotIN   +
                                                                   vlImpTotFN   +
                                                                   vlImpTotCP
                                                                   );
          //
          Cells[ COL_CNIB, nRowCount ] := Objeto.IMP_COMISION.AsString;
          Cells[ COL_INIB, nRowCount ] := Objeto.IMP_INTERES.AsString;
          Cells[ COL_FNIB, nRowCount ] := Objeto.IMP_CAPITALIZA.AsString;
          Cells[ COL_CPIB, nRowCount ] := Objeto.IMP_CAPITAL.AsString;
          //
          Cells[ COL_CNIM, nRowCount ] := Objeto.IMP_M_COMISION.AsString;
          Cells[ COL_INIM, nRowCount ] := Objeto.IMP_M_INTERES.AsString;
          Cells[ COL_FNIM, nRowCount ] := Objeto.IMP_M_CAPITALIZA.AsString;
          Cells[ COL_CPIM, nRowCount ] := Objeto.IMP_M_CAPITAL.AsString;
          //
          Cells[ COL_CNPC, nRowCount ] := FloatToStr( co100Pct );
          Cells[ COL_INPC, nRowCount ] := FloatToStr( co100Pct );
          Cells[ COL_FNPC, nRowCount ] := FloatToStr( co100Pct );
          Cells[ COL_CPPC, nRowCount ] := FloatToStr( co100Pct );
          //
          Cells[ COL_FVA,  nRowCount ] := DateToStr(Objeto.F_VALOR.AsDateTime);
          //
        end;
        //
        LimpiaMontos( True );
    end;
  end;
  //

  R.TopLeft.X := 0;
  R.TopLeft.Y := 0;
  R.BottomRight.X := COL_VIS;
  R.BottomRight.Y := 0;
  sagDATOS.Selection := R;
  //
  sagDATOSSelectCell( sagDATOS, R.TopLeft.X, R.TopLeft.Y, CanSelect );
end;
//
procedure TWCrCdQtQbC.FmtCurrEdit(Sender: TEdit );
begin
  if Assigned(Sender) then
    if not ( FormatFloat(coFmtCurrency, CurrFromFrmFloat(Sender.Text) ) = Sender.Text  ) then
    begin
      Sender.Text := FormatFloat(coFmtCurrency, CurrFromFrmFloat(Sender.Text));
    end;
end;
//Activa o Inactiva de acuerdo al tipo de movimiento
procedure TWCrCdQtQbC.OnOfContrImp;
begin
   Objeto.TIPO_MOVIMIENTO.GetFromControl;
   if Objeto.TIPO_MOVIMIENTO.AsString = coCondona THEN Begin
      // %
      edPCT_COMISION.Enabled    := True;        edPCT_COMISION.Color    := clWindow;
      //Activa Interes de acuerdo al producto
      IF objeto.CatCredito.ContratoCre.Producto.B_APL_MOR_INT.AsString = 'V' then Begin
         edPCT_INTERES.Enabled     := True;     edPCT_INTERES.Color     := clWindow;
         edIMP_PCT_INTERES.Enabled := True;     edIMP_PCT_INTERES.Color := clWindow;
      end
      ELSE Begin
         edPCT_INTERES.Enabled     := False;    edPCT_INTERES.Color     := clBtnFace;
         edIMP_PCT_INTERES.Enabled := False;    edIMP_PCT_INTERES.Color := clBtnFace;
      end;

      edPCT_CAPITALIZA.Enabled  := True;        edPCT_CAPITALIZA.Color  := clWindow;
      edPCT_CAPITAL.Enabled     := True;        edPCT_CAPITAL.Color     := clWindow;
      //IMPORTES
      edIMP_PCT_COMISION.Enabled   := True;     edIMP_PCT_COMISION.Color   := clWindow;
      edIMP_PCT_CAPITALIZA.Enabled := True;     edIMP_PCT_CAPITALIZA.Color := clWindow;
      edIMP_PCT_CAPITAL.Enabled    := True;     edIMP_PCT_CAPITAL.Color    := clWindow;
   end
   else Begin
      // %
      edPCT_COMISION.Enabled    := True;         edPCT_COMISION.Color   := clWindow;
      edPCT_INTERES.Enabled     := True;         edPCT_INTERES.Color    := clWindow;
      edPCT_CAPITALIZA.Enabled  := True;         edPCT_CAPITALIZA.Color := clWindow;
      edPCT_CAPITAL.Enabled     := True;         edPCT_CAPITAL.Color    := clWindow;
      //IMPORTES
      edIMP_PCT_COMISION.Enabled   := True;     edIMP_PCT_COMISION.Color   := clWindow;
      edIMP_PCT_INTERES.Enabled    := True;     edIMP_PCT_INTERES.Color    := clWindow;
      edIMP_PCT_CAPITALIZA.Enabled := True;     edIMP_PCT_CAPITALIZA.Color := clWindow;
      edIMP_PCT_CAPITAL.Enabled    := True;     edIMP_PCT_CAPITAL.Color    := clWindow;
   end;

{
   if Objeto.TIPO_MOVIMIENTO.AsString = coQuita THEN Begin
      // %
      edPCT_COMISION.Enabled    := False;       edPCT_COMISION.Color    := clBtnFace;      //Objeto.PCT_COMISION.AsFloat := coZeroPct;
      edPCT_INTERES.Enabled     := False;       edPCT_INTERES.Color     := clBtnFace;      //Objeto.PCT_INTERES.AsFloat := coZeroPct;
      edPCT_CAPITALIZA.Enabled  := True;        edPCT_CAPITALIZA.Color  := clWindow;
      edPCT_CAPITAL.Enabled     := True;        edPCT_CAPITAL.Color     := clWindow;
      //IMPORTES
      edIMP_PCT_COMISION.Enabled   := False;    edIMP_PCT_COMISION.Color   := clBtnFace;
      edIMP_PCT_INTERES.Enabled    := False;    edIMP_PCT_INTERES.Color    := clBtnFace;
      edIMP_PCT_CAPITALIZA.Enabled := True;     edIMP_PCT_CAPITALIZA.Color := clWindow;
      edIMP_PCT_CAPITAL.Enabled    := True;     edIMP_PCT_CAPITAL.Color    := clWindow;
   end
   else Begin
      // %
      edPCT_COMISION.Enabled    := True;         edPCT_COMISION.Color   := clWindow;    //Objeto.PCT_COMISION.AsFloat := coDefaultPct;
      edPCT_INTERES.Enabled     := True;         edPCT_INTERES.Color    := clWindow;    //Objeto.PCT_INTERES.AsFloat := coDefaultPct;
      edPCT_CAPITALIZA.Enabled  := True;         edPCT_CAPITALIZA.Color := clWindow;
      edPCT_CAPITAL.Enabled     := True;         edPCT_CAPITAL.Color    := clWindow;
      //IMPORTES
      edIMP_PCT_COMISION.Enabled   := True;     edIMP_PCT_COMISION.Color   := clWindow;
      edIMP_PCT_INTERES.Enabled    := True;     edIMP_PCT_INTERES.Color    := clWindow;
      edIMP_PCT_CAPITALIZA.Enabled := True;     edIMP_PCT_CAPITALIZA.Color := clWindow;
      edIMP_PCT_CAPITAL.Enabled    := True;     edIMP_PCT_CAPITAL.Color    := clWindow;
   end
}
end;
//
procedure TWCrCdQtQbC.DrawControls;
begin
  Objeto.CatCredito.ContratoCre.Acreditado.Persona.Nombre.DrawControl;
  // DE LA SECCION DE INFORMACION GENERAL
  Objeto.Credito.ID_CONTRATO.DrawControl;
  Objeto.Credito.ID_CREDITO.DrawControl;
  Objeto.Credito.F_INICIO.DrawControl;
  Objeto.Credito.DESC_L_PRODUCTO.DrawControl;
  Objeto.Credito.SDO_INSOLUTO.DrawControl;
  Objeto.Credito.F_VENCIMIENTO.DrawControl;
  // DE LA SECCION DE PARAMETROS
  Objeto.F_VALOR.DrawControl;
  Objeto.FACT_MORAS.DrawControl;
  Objeto.B_APLICA_IVA.DrawControl;
  // DE LA SECCION DE IMPORTES
  Objeto.IMP_COMISION.DrawControl;
  Objeto.IMP_INTERES.DrawControl;
  Objeto.IMP_CAPITALIZA.DrawControl;
  Objeto.IMP_CAPITAL.DrawControl;
  Objeto.IMP_TOTAL.DrawControl;
  // DE LA SECCION DE IMPORTES MORATORIOS
  Objeto.IMP_M_COMISION.DrawControl;
  Objeto.IMP_M_INTERES.DrawControl;
  Objeto.IMP_M_CAPITALIZA.DrawControl;
  Objeto.IMP_M_CAPITAL.DrawControl;
  Objeto.IMP_M_TOTAL.DrawControl;
  //
  Objeto.PCT_COMISION.DrawControl;
  Objeto.PCT_INTERES.DrawControl;
  Objeto.PCT_CAPITALIZA.DrawControl;
  Objeto.PCT_CAPITAL.DrawControl;
  //
  Objeto.IMP_PCT_COMISION.DrawControl;
  Objeto.IMP_PCT_INTERES.DrawControl;
  Objeto.IMP_PCT_CAPITALIZA.DrawControl;
  Objeto.IMP_PCT_CAPITAL.DrawControl;
  Objeto.IMP_PCT_TOTAL.DrawControl;
  //
  Objeto.TIPO_MOVIMIENTO.DrawControl;
  //
end;
//
procedure TWCrCdQtQbC.GetFromGrid(peRowGrid, peColGrid: Integer);
begin
  Objeto.INDICE_GRID.AsInteger    := peRowGrid;
  //
  Objeto.NUM_PERIODO.AsString     := sagDATOS.Cells[ COL_PER,  peRowGrid ];
  // DE LA SECCION DE IMPORTE BASE
  Objeto.IMP_COMISION.AsFloat     := CurrFromFrmFloat( sagDATOS.Cells[ COL_CNIB, peRowGrid ] );
  Objeto.IMP_INTERES.AsFloat      := CurrFromFrmFloat( sagDATOS.Cells[ COL_INIB, peRowGrid ] );
  Objeto.IMP_CAPITALIZA.AsFloat   := CurrFromFrmFloat( sagDATOS.Cells[ COL_FNIB, peRowGrid ] );
  Objeto.IMP_CAPITAL.AsFloat      := CurrFromFrmFloat( sagDATOS.Cells[ COL_CPIB, peRowGrid ] );
  //
  // DE LA SECCION DE IMPORTE MORATORIO
  Objeto.IMP_M_COMISION.AsFloat   := CurrFromFrmFloat( sagDATOS.Cells[ COL_CNIM, peRowGrid ] );
  Objeto.IMP_M_INTERES.AsFloat    := CurrFromFrmFloat( sagDATOS.Cells[ COL_INIM, peRowGrid ] );
  Objeto.IMP_M_CAPITALIZA.AsFloat := CurrFromFrmFloat( sagDATOS.Cells[ COL_FNIM, peRowGrid ] );
  Objeto.IMP_M_CAPITAL.AsFloat    := CurrFromFrmFloat( sagDATOS.Cells[ COL_CPIM, peRowGrid ] );
  //
  // DE LA SECCION DE PORCENTAJES
  Objeto.PCT_COMISION.AsFloat   := CurrFromFrmFloat( sagDATOS.Cells[ COL_CNPC, peRowGrid ] );
  Objeto.PCT_INTERES.AsFloat    := CurrFromFrmFloat( sagDATOS.Cells[ COL_INPC, peRowGrid ] );
  Objeto.PCT_CAPITALIZA.AsFloat := CurrFromFrmFloat( sagDATOS.Cells[ COL_FNPC, peRowGrid ] );
  Objeto.PCT_CAPITAL.AsFloat    := CurrFromFrmFloat( sagDATOS.Cells[ COL_CPPC, peRowGrid ] );
  //
  AsignaFVAlor( StrToDate( sagDATOS.Cells[ COL_FVA, peRowGrid ] ) );
  //
  Objeto.ReCalculate;
end;
//
procedure TWCrCdQtQbC.SetToGrid;
var peRowGrid : Integer;
begin
{}
  peRowGrid := Objeto.INDICE_GRID.AsInteger;
  // DE LA SECCION DE IMPORTE X APLICAR
  sagDATOS.Cells[ COL_CN, peRowGrid ] := FormatFloat(coFmtCurrency, Objeto.IMP_PCT_COMISION.AsFloat   );
  sagDATOS.Cells[ COL_IN, peRowGrid ] := FormatFloat(coFmtCurrency, Objeto.IMP_PCT_INTERES.AsFloat    );
  sagDATOS.Cells[ COL_FN, peRowGrid ] := FormatFloat(coFmtCurrency, Objeto.IMP_PCT_CAPITALIZA.AsFloat );
  sagDATOS.Cells[ COL_CP, peRowGrid ] := FormatFloat(coFmtCurrency, Objeto.IMP_PCT_CAPITAL.AsFloat    );
  sagDATOS.Cells[ COL_TO, peRowGrid ] := FormatFloat(coFmtCurrency, Objeto.IMP_PCT_TOTAL.AsFloat      );
  // DE LA SECCION DE IMPORTE BASE
  sagDATOS.Cells[ COL_CNIB, peRowGrid ] := Objeto.IMP_COMISION.AsString;
  sagDATOS.Cells[ COL_INIB, peRowGrid ] := Objeto.IMP_INTERES.AsString;
  sagDATOS.Cells[ COL_FNIB, peRowGrid ] := Objeto.IMP_CAPITALIZA.AsString;
  sagDATOS.Cells[ COL_CPIB, peRowGrid ] := Objeto.IMP_CAPITAL.AsString;
  //
  // DE LA SECCION DE IMPORTE MORATORIO
  sagDATOS.Cells[ COL_CNIM, peRowGrid ] := Objeto.IMP_M_COMISION.AsString;
  sagDATOS.Cells[ COL_INIM, peRowGrid ] := Objeto.IMP_M_INTERES.AsString;
  sagDATOS.Cells[ COL_FNIM, peRowGrid ] := Objeto.IMP_M_CAPITALIZA.AsString;
  sagDATOS.Cells[ COL_CPIM, peRowGrid ] := Objeto.IMP_M_CAPITAL.AsString;
  // DE LA SECCION DE PORCENTAJES
  sagDATOS.Cells[ COL_CNPC, peRowGrid ] := Objeto.PCT_COMISION.AsString;
  sagDATOS.Cells[ COL_INPC, peRowGrid ] := Objeto.PCT_INTERES.AsString;
  sagDATOS.Cells[ COL_FNPC, peRowGrid ] := Objeto.PCT_CAPITALIZA.AsString;
  sagDATOS.Cells[ COL_CPPC, peRowGrid ] := Objeto.PCT_CAPITAL.AsString;
  //
  sagDATOS.Cells[ COL_FVA, peRowGrid ]  := DateToStr( Objeto.F_VALOR.AsDateTime );
end;
//
procedure TWCrCdQtQbC.ResetWindow;
begin
  Objeto.CatCredito.Active := False;
  cbFiltro.Checked         := False;
  // DE LA SECCION DE CONFIGURACION
  Objeto.TIPO_APLICACION.AsString := coGlobal;
  // DE LA SECCION DE INFORMACION GENERAL
  Objeto.Credito.ID_CONTRATO.AsString     := '';
  Objeto.Credito.ID_CREDITO.AsString      := '';
  Objeto.Credito.F_INICIO.AsString        := '';
  Objeto.Credito.DESC_L_PRODUCTO.AsString := '';
  Objeto.Credito.SDO_INSOLUTO.AsString    := '';
  Objeto.Credito.F_VENCIMIENTO.AsString   := '';
  // DE LA SECCION DE PARAMETROS
  AsignaFVAlor(Objeto.Apli.DameFechaEmpresa);
  Objeto.FACT_MORAS.AsString := '';
  Objeto.B_APLICA_IVA.AsString   := '';
  //
  Objeto.FAC_M_COMISION.AsFloat   := coZeroPct;
  Objeto.FAC_M_INTERES.AsFloat    := coZeroPct;
  Objeto.FAC_M_CAPITALIZA.AsFloat := coZeroPct;
  Objeto.FAC_M_CAPITAL.AsFloat    := coZeroPct;
  // DE LA SECCION DE IMPORTES
  LimpiaMontos( True );
  //
  Objeto.ReCalculate;
  //
  LimpiaGrid;
  //
  DrawControls;
  //
  OnOfContrImp;
end;
//
function TWCrCdQtQbC.ValidateField(IMP_CONCEPTO, IMP_MORATORIO, PCT_X_APLICAR,
                       IMP_X_APLICAR: TInterCampo; MsgMask : String;
                       BPorcentaje : Boolean ): Boolean;
var BErrPct     : Boolean;
    BErrImp     : Boolean;
    MsgError    : String;
    vlPctImp    : Double;
begin
  Result := False;
  //
  if Objeto.Searched then
  begin
    PCT_X_APLICAR.GetFromControl;
    IMP_X_APLICAR.GetFromControl;
    IMP_MORATORIO.GetFromControl;
    //
    if BPorcentaje then
      vlPctImp := PCT_X_APLICAR.AsFloat
    else
      vlPctImp := IMP_X_APLICAR.AsFloat
    ;
    //
    if Objeto.getCurrentValue <> vlPctImp then
    begin
      BErrPct := ( ( PCT_X_APLICAR.AsFloat < coZeroPct ) or ( PCT_X_APLICAR.AsFloat > co100Pct  ) );
      //
      if Objeto.TIPO_MOVIMIENTO.AsString = coCondona then
        BErrImp := ( ( IMP_X_APLICAR.AsFloat < coZeroPct ) or ( IMP_X_APLICAR.AsFloat > IMP_MORATORIO.AsFloat ) )
      else
        BErrImp := ( ( IMP_X_APLICAR.AsFloat < coZeroPct ) or ( IMP_X_APLICAR.AsFloat > IMP_CONCEPTO.AsFloat ) );
      //ends_if
      //
      MsgError := '';
      if ( BPorcentaje = True  ) and BErrPct then MsgError := coMsgErrPct;
      if ( BPorcentaje = False ) and BErrImp then MsgError := coMsgErrImp;
      //
      if MsgError <> '' then
      begin
        MessageDlg( MsgError, mtError, [mbOk], 0 );
        if BPorcentaje then PCT_X_APLICAR.AsFloat := Objeto.getCurrentValue
                       else IMP_X_APLICAR.AsFloat := Objeto.getCurrentValue;

      end else begin
        //
        if MessageDlg( Format( MsgMask, [ Objeto.getCurrentValue, vlPctImp ] ),
                       mtConfirmation, [mbYes, mbCancel], 0 ) = mrYes then
        begin
          Result := True;
          if BPorcentaje = False then
            if Objeto.TIPO_MOVIMIENTO.AsString = coCondona then
              PCT_X_APLICAR.AsString := FormatFloat( '###.####', (IMP_X_APLICAR.AsFloat / IMP_MORATORIO.AsFloat) * co100Pct )
            else
              PCT_X_APLICAR.AsString := FormatFloat( '###.####', (IMP_X_APLICAR.AsFloat / IMP_CONCEPTO.AsFloat)  * co100Pct )
            ;//ends_if
          {
          if BPorcentaje then
            Objeto.setCurrentValue( PCT_X_APLICAR )
          else begin
            Objeto.setCurrentValue( IMP_X_APLICAR );
            //
            if Objeto.TIPO_MOVIMIENTO.AsString = coCondona then
               PCT_X_APLICAR.AsString := FormatFloat( '###.####', (IMP_X_APLICAR.AsFloat / IMP_MORATORIO.AsFloat) * co100Pct )
            else
               PCT_X_APLICAR.AsString := FormatFloat( '###.####', (IMP_X_APLICAR.AsFloat / IMP_CONCEPTO.AsFloat)  * co100Pct );
            //ends_if
          end;
          }
        end else begin
          if BPorcentaje then PCT_X_APLICAR.AsFloat := Objeto.getCurrentValue
                         else IMP_X_APLICAR.AsFloat := Objeto.getCurrentValue;
        end;//_if_MessageDlg_(
        //
      end;//_if_MsgError_<>_''_then
      //
    end;//if_Objeto.getCurrentValue_<>_Sender.AsFloat_then
    //
    PCT_X_APLICAR.DrawControl;
    IMP_X_APLICAR.DrawControl;
  end;
end;
{}
procedure TWCrCdQtQbC.UpdateParams;
var Qry       : TQuery;
    vlImpCom  : Double;
    vlMorCom  : Double;
    vlImpInt  : Double;
    vlMorInt  : Double;
    vlImpFin  : Double;
    vlMorFin  : Double;
    vlImpCap  : Double;
    vlMorCap  : Double;
begin
  // IMPORTES
  LimpiaMontos( False );
  //
  if Objeto.TIPO_APLICACION.AsString = coDetalle then
  begin
    stpObtenMontos(   Objeto.Credito.ID_CREDITO.AsInteger, // Qry.FieldByName('ID_CREDITO').AsInteger,
                      Objeto.NUM_PERIODO.AsInteger,        // Qry.FieldByName('NUM_PERIODO').AsInteger,
                      Objeto.F_VALOR.AsDateTime,
                      Objeto.FACT_MORAS.AsFloat,
                      Objeto.B_APLICA_IVA.AsString,
                      sagDATOS.Cells[ COL_BCN, Objeto.INDICE_GRID.AsInteger ], // := Qry.FieldByName('COMISION').AsString;
                      sagDATOS.Cells[ COL_BIN, Objeto.INDICE_GRID.AsInteger ], // := Qry.FieldByName('INTERES').AsString;
                      sagDATOS.Cells[ COL_BFN, Objeto.INDICE_GRID.AsInteger ], // := Qry.FieldByName('FIN_ADIC').AsString;
                      sagDATOS.Cells[ COL_BCP, Objeto.INDICE_GRID.AsInteger ], // := Qry.FieldByName('CAPITAL').AsString;
                      vlImpCom,
                      vlMorCom,
                      vlImpInt,
                      vlMorInt,
                      vlImpFin,
                      vlMorFin,
                      vlImpCap,
                      vlMorCap
                    );
    Objeto.IMP_COMISION.AsFloat     := vlImpCom;
    Objeto.IMP_INTERES.AsFloat      := vlImpInt;
    Objeto.IMP_CAPITALIZA.AsFloat   := vlImpFin;
    Objeto.IMP_CAPITAL.AsFloat      := vlImpCap;
    // MORATORIOS
    Objeto.IMP_M_COMISION.AsFloat   := vlMorCom;
    Objeto.IMP_M_INTERES.AsFloat    := vlMorInt;
    Objeto.IMP_M_CAPITALIZA.AsFloat := vlMorFin;
    Objeto.IMP_M_CAPITAL.AsFloat    := vlMorCap;
  end else begin
    // Sección de importes
    Qry := GetSQLQueryNoNil( Objeto.BuildSQLStr,
                             Objeto.Apli.DataBaseName,
                             Objeto.Apli.SessionName,
                             False );
    if Assigned(Qry) and not( Qry.IsEmpty ) then
    begin
      //try Qry.SQL.SaveToFile('C:\GyM\MODULO CONDONACIONES\SQL\SQLSTR.SQL'); except beep; end;
      Qry.First;
      while not Qry.Eof do
      begin
        stpObtenMontos( Qry.FieldByName('ID_CREDITO').AsInteger,   // Qry.FieldByName('ID_CREDITO').AsInteger,
                        Qry.FieldByName('NUM_PERIODO').AsInteger,  // Qry.FieldByName('NUM_PERIODO').AsInteger,
                        Objeto.F_VALOR.AsDateTime,
                        Objeto.FACT_MORAS.AsFloat,
                        Objeto.B_APLICA_IVA.AsString,
                        Qry.FieldByName('COMISION').AsString,
                        Qry.FieldByName('INTERES').AsString,
                        Qry.FieldByName('FIN_ADIC').AsString,
                        Qry.FieldByName('CAPITAL').AsString,
                        vlImpCom,
                        vlMorCom,
                        vlImpInt,
                        vlMorInt,
                        vlImpFin,
                        vlMorFin,
                        vlImpCap,
                        vlMorCap
                      );
        Objeto.IMP_COMISION.AsFloat     := Objeto.IMP_COMISION.AsFloat     + vlImpCom;
        Objeto.IMP_INTERES.AsFloat      := Objeto.IMP_INTERES.AsFloat      + vlImpInt;
        Objeto.IMP_CAPITALIZA.AsFloat   := Objeto.IMP_CAPITALIZA.AsFloat   + vlImpFin;
        Objeto.IMP_CAPITAL.AsFloat      := Objeto.IMP_CAPITAL.AsFloat      + vlImpCap;
        // MORATORIOS
        Objeto.IMP_M_COMISION.AsFloat   := Objeto.IMP_M_COMISION.AsFloat   + vlMorCom;
        Objeto.IMP_M_INTERES.AsFloat    := Objeto.IMP_M_INTERES.AsFloat    + vlMorInt;
        Objeto.IMP_M_CAPITALIZA.AsFloat := Objeto.IMP_M_CAPITALIZA.AsFloat + vlMorFin;
        Objeto.IMP_M_CAPITAL.AsFloat    := Objeto.IMP_M_CAPITAL.AsFloat    + vlMorCap;
        //
        Qry.Next;
      end;
    end;
    //
  end;
  //
end;
{
+------------------------------------------------------------------------------+
|                                                                              |
|                            EVENTOS DE LA FORMA                               |
|                                                                              |
+------------------------------------------------------------------------------+
}
procedure TWCrCdQtQbC.FormCreate(Sender: TObject);
begin
  DataFound := False;
  Selected  := False;
end;

procedure TWCrCdQtQbC.FormShow(Sender: TObject);
begin
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
  //
  Objeto.Credito  := CreaTBCredito( 0,  Objeto.Apli );     // Clase ligera de crédito
  Objeto.Credito.MasterSource := Objeto;
  // FILTRA DISPOSICIONES POR EMPRESA
  Objeto.CatCredito.BuscaWhereString := '(CR_CREDITO.SIT_CREDITO NOT IN ( ''LQ'', ''CA'' ) )AND '  +
                                        '(PKGCRACTUALIZA.STPOBTEMPCTTO(CR_CREDITO.ID_CONTRATO) = ' +
                                        IntToStr(Objeto.Apli.IdEmpresa) + ' )';
  Objeto.CatCredito.FilterString     := Objeto.CatCredito.BuscaWhereString;
  //
  Objeto.CatCredito.ID_CREDITO.Control   := edValorFiltro;
  Objeto.VALOR_FILTRO.Control            := edValorFiltro;
  Objeto.CatCredito.ContratoCre.Contrato.TITNombre.Control := lbDESC_ACREDITADO;
  //
  Objeto.B_TODOS_PERIODOS.Control        := cbB_TODOS_PERIODOS;
  //
  // DE LA SECCION INFORMACION GENERAL
  Objeto.Credito.ID_CONTRATO.Control     := edID_CONTRATO;
  Objeto.Credito.F_INICIO.Control        := edF_INICIO;
  Objeto.Credito.DESC_L_PRODUCTO.Control := edDESC_L_PRODUCTO;
  Objeto.Credito.SDO_VIG_TOTAL.Control   := edSDO_VIG_TOTAL;
  Objeto.ADEUDO_TOTAL.Control            := edADEUDO_TOTAL;
  Objeto.Credito.F_VENCIMIENTO.Control   := edF_VENCIMIENTO;
  //
  // DE LA SECCION DE PARAMETROS
  Objeto.F_VALOR.Control        := edF_VALOR;
  //
  // DE LA SECCION DE IMPORTES BASES
  Objeto.IMP_COMISION.Control   := edIMP_COMISION;
  Objeto.IMP_INTERES.Control    := edIMP_INTERES;
  Objeto.IMP_CAPITALIZA.Control := edIMP_CAPITALIZA;
  Objeto.IMP_CAPITAL.Control    := edIMP_CAPITAL;
  Objeto.IMP_TOTAL.Control      := edIMP_TOTAL;
  //
  // DE LA SECCION DE IMPORTES DE MORATORIOS
  Objeto.IMP_M_COMISION.Control   := edIMP_M_COMISION;
  Objeto.IMP_M_INTERES.Control    := edIMP_M_INTERES;
  Objeto.IMP_M_CAPITALIZA.Control := edIMP_M_CAPITALIZA;
  Objeto.IMP_M_CAPITAL.Control    := edIMP_M_CAPITAL;
  Objeto.IMP_M_TOTAL.Control      := edIMP_M_TOTAL;
  //
  //
  Objeto.PCT_COMISION.Control   := edPCT_COMISION;
  Objeto.PCT_INTERES.Control    := edPCT_INTERES;
  Objeto.PCT_CAPITALIZA.Control := edPCT_CAPITALIZA;
  Objeto.PCT_CAPITAL.Control    := edPCT_CAPITAL;
  Objeto.PCT_TOTAL.Control      := edPCT_TOTAL;
  //
  Objeto.IMP_PCT_COMISION.Control   := edIMP_PCT_COMISION;
  Objeto.IMP_PCT_INTERES.Control    := edIMP_PCT_INTERES;
  Objeto.IMP_PCT_CAPITALIZA.Control := edIMP_PCT_CAPITALIZA;
  Objeto.IMP_PCT_CAPITAL.Control    := edIMP_PCT_CAPITAL;
  Objeto.IMP_PCT_TOTAL.Control      := edIMP_PCT_TOTAL;
  //
  Objeto.TIPO_MOVIMIENTO.AsString   := coCondona;
  Objeto.TIPO_MOVIMIENTO.Control    := rgTIPO_MOVIMIENTO;
  Objeto.TIPO_APLICACION.Control    := rgTIPO_APLICACION;
  //
  ResetWindow;
  // Inicia Modifiacion SATV4766 el 31Mar2006
  If (Objeto.vgID_CREDITO > 0) Then
   Begin
   ikValorFiltro.Buffer := IntToStr(Objeto.vgID_CREDITO);
   ikValorFiltroEjecuta(Self);
   End;
 // Termina Modifiacion SATV4766 el 31Mar2006 
end;

procedure TWCrCdQtQbC.FormDestroy(Sender: TObject);
begin
  Objeto.CatCredito.ID_CREDITO.Control := nil;
  Objeto.VALOR_FILTRO.Control          := nil;
  Objeto.CatCredito.ContratoCre.Contrato.TITNombre.Control := nil;
  //
  Objeto.B_TODOS_PERIODOS.Control          := nil;
  // DE LA SECCION INFORMACION GENERAL
  Objeto.Credito.ID_CONTRATO.Control     := nil;
  Objeto.Credito.F_INICIO.Control        := nil;
  Objeto.Credito.DESC_L_PRODUCTO.Control := nil;
  Objeto.Credito.SDO_VIG_TOTAL.Control   := nil;
  Objeto.ADEUDO_TOTAL.Control            := nil;
  Objeto.Credito.F_VENCIMIENTO.Control   := nil;
  // DE LA SECCION DE PARAMETROS
  Objeto.F_VALOR.Control        := nil;
  // DE LA SECCION DE IMPORTES
  Objeto.IMP_COMISION.Control   := nil;
  Objeto.IMP_INTERES.Control    := nil;
  Objeto.IMP_CAPITALIZA.Control := nil;
  Objeto.IMP_CAPITAL.Control    := nil;
  Objeto.IMP_TOTAL.Control      := nil;
  // DE LA SECCION DE IMPORTES DE MORATORIOS
  Objeto.IMP_M_COMISION.Control   := nil;
  Objeto.IMP_M_INTERES.Control    := nil;
  Objeto.IMP_M_CAPITALIZA.Control := nil;
  Objeto.IMP_M_CAPITAL.Control    := nil;
  Objeto.IMP_M_TOTAL.Control      := nil;
  //
  Objeto.PCT_COMISION.Control   := nil;
  Objeto.PCT_INTERES.Control    := nil;
  Objeto.PCT_CAPITALIZA.Control := nil;
  Objeto.PCT_CAPITAL.Control    := nil;
  Objeto.PCT_TOTAL.Control      := nil;
  //
  Objeto.IMP_PCT_COMISION.Control   := nil;
  Objeto.IMP_PCT_INTERES.Control    := nil;
  Objeto.IMP_PCT_CAPITALIZA.Control := nil;
  Objeto.IMP_PCT_CAPITAL.Control    := nil;
  Objeto.IMP_PCT_TOTAL.Control      := nil;
  //
  Objeto.TIPO_MOVIMIENTO.Control    := nil;
  Objeto.TIPO_APLICACION.Control    := nil;
  //
  if Objeto.Credito <> nil then
     Objeto.Credito.Free;
  //
end;

procedure TWCrCdQtQbC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
//
{
+------------------------------------------------------------------------------+
|                                                                              |
|                       EVENTOS DE LOS COMPONENTES                             |
|                                                                              |
+------------------------------------------------------------------------------+
}
//
{ DE LA SECCION DE FILTROS Y CONFIGURACION DE TIPO DE MOVIMIENTO Y APLICACION  }
//
// Edit de búsqueda
procedure TWCrCdQtQbC.edValorFiltroExit(Sender: TObject);
begin
  mTxNota.Clear;
end;
// Botón de búsqueda
procedure TWCrCdQtQbC.btnFiltroClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCDQTQBC_DISP',True,True) then
   begin
      if BeginSearch( True, [] ) then begin
        ShowData;
        rgTIPO_MOVIMIENTO.OnClick(Sender);
      end;
   end;
end;
// InterLinkIt de búsqueda
procedure TWCrCdQtQbC.ikValorFiltroEjecuta(Sender: TObject);
begin
  if BeginSearch( False, [ ikValorFiltro.Buffer ] ) then Begin
    ShowData;
    rgTIPO_MOVIMIENTO.OnClick(Sender);
  end;
end;
// Check Box "Aplica Filtro"
procedure TWCrCdQtQbC.cbFiltroClick(Sender: TObject);
begin
  if cbFiltro.Checked and ( Objeto.Searched = False ) then
  begin
    cbFiltro.Checked := False
  end else if ( cbFiltro.Checked = False ) and ( Objeto.Searched = True ) then
  begin
    ResetWindow;
    if edValorFiltro.CanFocus then
      edValorFiltro.SetFocus;
  end;//ends_if
  //
  // Asigna el filtro de búsqueda
  cbFiltro.Enabled := cbFiltro.Checked;
end;
// Botón  "Busqueda"
procedure TWCrCdQtQbC.btBUSCAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCDQTQBC_BUSCA',True,True) then
   begin
      if Objeto.Searched then
        ShowData;
      //ends_if
      mTxNota.Clear;
   end;
end;
// Grupo "Tipo de Movimiento"
procedure TWCrCdQtQbC.rgTIPO_MOVIMIENTOClick(Sender: TObject);
begin
  if Objeto.Searched then begin
     ShowData;
     OnOfContrImp;
     //EASA4011    29/08/2006
     if rgTIPO_MOVIMIENTO.ItemIndex = 0 then
        mTxNota.Lines.Add( coTxCondona + Objeto.Credito.ID_CREDITO.AsString)
     else if rgTIPO_MOVIMIENTO.ItemIndex = 1 then
        mTxNota.Lines.Add( coTxQuita + Objeto.Credito.ID_CREDITO.AsString)
     else if rgTIPO_MOVIMIENTO.ItemIndex = 2 then
        mTxNota.Lines.Add( coTxQuebranto + Objeto.Credito.ID_CREDITO.AsString)
     else if  rgTIPO_MOVIMIENTO.ItemIndex = 3 then
        mTxNota.Lines.Add( coTxCastigo + Objeto.Credito.ID_CREDITO.AsString)
     // EASA4011>/
     //RIRA4281 26Oct10
     else if rgTIPO_MOVIMIENTO.ItemIndex = 4 then
        mTxNota.Lines.Add( coTxDacion + Objeto.Credito.ID_CREDITO.AsString)
     else
        mTxNota.Lines.Add( coTxAdjudica + Objeto.Credito.ID_CREDITO.AsString)
  end;
end;
// Grupo "Tipo de Aplicacion"
procedure TWCrCdQtQbC.rgTIPO_APLICACIONClick(Sender: TObject);
begin
  if Objeto.Searched then
    ShowData;
  //ends_if
end;
//
procedure TWCrCdQtQbC.cbB_TODOS_PERIODOSClick(Sender: TObject);
begin
  if Objeto.Searched then
    ShowData;
  //ends_if
end;
//
{                  DE LA SECCION DE INFORMACION GENERAL                        }
//
// Evento para dar formato al saldo insoluto
procedure TWCrCdQtQbC.edSDO_VIG_TOTALChange(Sender: TObject);
begin
  if Sender is TEdit then
    FmtCurrEdit(Sender as TEdit);
end;
//
//     Evento generico de los edit de importes cuando se teclea un caracter 
//
procedure TWCrCdQtQbC.edGenericKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = coCR ) and ( Sender is TInterEdit ) then
  begin
    ( Sender as TInterEdit ).OnExit(Sender);
    Key := #0;
  end;//ends_if
end;
//
{                         DE LA SECCION DE FECHA VALOR                         }
//
procedure TWCrCdQtQbC.edF_VALOREnter(Sender: TObject);
begin
  Objeto.setCurrentDate(Objeto.F_VALOR);
end;
//
procedure TWCrCdQtQbC.edF_VALORExit(Sender: TObject);
begin
  if Selected then
  begin
    Objeto.F_VALOR.GetFromControl;
    if Objeto.F_VALOR.AsDateTime <> Objeto.getCurrentDate then
      if MessageDlg( coUpdFValor, mtConfirmation, [mbYes, mbCancel], 0 ) = mrYes then
      begin
        Objeto.setCurrentDate(Objeto.F_VALOR);
        UpdateParams;
        Objeto.ReCalculate;
        SetToGrid;
      end else
        Objeto.F_VALOR.AsDateTime := Objeto.getCurrentDate;
      //
    //Valida que la Fecha Valor no se menor a la Fecha de inicio de la disposición
    if Objeto.F_VALOR.AsDateTime < Objeto.Credito.F_INICIO.AsDateTime then
    Begin
       ShowMessage(coValidaFechaIni);
       AsignaFVAlor(Objeto.Apli.DameFechaEmpresa);
    end;
  end else
    ShowMessage('Favor de seleccionar un registro');
end;
//
procedure TWCrCdQtQbC.edF_VALORKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = coCR then
  begin
    edF_VALORExit(Sender);
    Key := #0;
  end;//ends_if
end;
//
{                  DE LA SECCION DE IMPORTES X APLICAR                         }
//                    C O M I S I O N E S
procedure TWCrCdQtQbC.edPCT_COMISIONEnter(Sender: TObject);
begin
  if Selected then
  begin
    Objeto.setCurrentValue(Objeto.PCT_COMISION);
  end;//ends_if_Selected_then
end;
//
procedure TWCrCdQtQbC.edPCT_COMISIONExit(Sender: TObject);
begin
  if Selected then
  begin
    with Objeto do
      if ValidateField( IMP_COMISION, IMP_M_COMISION, PCT_COMISION, IMP_PCT_COMISION, coMsgPctComision, True) then
      begin
        ReCalculate;
        SetToGrid;
        edPCT_COMISIONEnter(Sender);
      end;
  end;//ends_if_Selected_then
end;
//
procedure TWCrCdQtQbC.edIMP_PCT_COMISIONEnter(Sender: TObject);
begin
  if Selected then
  begin
    Objeto.setCurrentValue(Objeto.IMP_PCT_COMISION);
  end;//ends_if_Selected_then
end;
//
procedure TWCrCdQtQbC.edIMP_PCT_COMISIONExit(Sender: TObject);
begin
  if Selected then
  begin
    with Objeto do
      if ValidateField( IMP_COMISION, IMP_M_COMISION, PCT_COMISION, IMP_PCT_COMISION, coMsgImpComision, False) then
      begin
        ReCalculate;
        SetToGrid;
        edIMP_PCT_COMISIONEnter(Sender);
      end;
  end;//ends_if_Selected_then
end;
//
//                   I N T E R E S E S
procedure TWCrCdQtQbC.edPCT_INTERESEnter(Sender: TObject);
begin
  if Selected then
  begin
    Objeto.setCurrentValue(Objeto.PCT_INTERES);
  end;//ends_if_Selected_then
end;

procedure TWCrCdQtQbC.edPCT_INTERESExit(Sender: TObject);
begin
  if Selected then
  begin
    with Objeto do
      if ValidateField( IMP_INTERES, IMP_M_INTERES, PCT_INTERES, IMP_PCT_INTERES, coMsgPctInteres, True) then
      begin
        ReCalculate;
        SetToGrid;
        edPCT_INTERESEnter(Sender);
      end;
  end;//ends_if_Selected_then
end;

procedure TWCrCdQtQbC.edIMP_PCT_INTERESEnter(Sender: TObject);
begin
  if Selected then
  begin
    Objeto.setCurrentValue(Objeto.IMP_PCT_INTERES);
  end;//ends_if_Selected_then
end;

procedure TWCrCdQtQbC.edIMP_PCT_INTERESExit(Sender: TObject);
begin
  if Selected then
  begin
    with Objeto do
      if ValidateField( IMP_INTERES, IMP_M_INTERES, PCT_INTERES, IMP_PCT_INTERES, coMsgImpInteres, False) then
      begin
        ReCalculate;
        SetToGrid;
        edIMP_PCT_INTERESEnter(Sender);
      end;
  end;//ends_if_Selected_then
end;
//
//                   C A P I T A L I Z A
procedure TWCrCdQtQbC.edPCT_CAPITALIZAEnter(Sender: TObject);
begin
  if Selected then
  begin
    Objeto.setCurrentValue(Objeto.PCT_CAPITALIZA);
  end;//ends_if_Selected_then
end;

procedure TWCrCdQtQbC.edPCT_CAPITALIZAExit(Sender: TObject);
begin
  if Selected then
  begin
    with Objeto do
      if ValidateField( IMP_CAPITALIZA, IMP_M_CAPITALIZA, PCT_CAPITALIZA, IMP_PCT_CAPITALIZA, coMsgPctCapitaliza, True) then
      begin
        ReCalculate;
        SetToGrid;
        edPCT_CAPITALIZAEnter(Sender);
      end;
  end;//ends_if_Selected_then
end;

procedure TWCrCdQtQbC.edIMP_PCT_CAPITALIZAEnter(Sender: TObject);
begin
  if Selected then
  begin
    Objeto.setCurrentValue(Objeto.IMP_PCT_CAPITALIZA);
  end;//ends_if_Selected_then
end;

procedure TWCrCdQtQbC.edIMP_PCT_CAPITALIZAExit(Sender: TObject);
begin
  if Selected then
  begin
    with Objeto do
      if ValidateField( IMP_CAPITALIZA, IMP_M_CAPITALIZA, PCT_CAPITALIZA, IMP_PCT_CAPITALIZA, coMsgImpCapitaliza, False) then
      begin
        ReCalculate;
        SetToGrid;
        edIMP_PCT_CAPITALIZAEnter(Sender);
      end;
  end;//ends_if_Selected_then
end;
//
//                   C A P I T A L
procedure TWCrCdQtQbC.edPCT_CAPITALEnter(Sender: TObject);
begin
  if Selected then
  begin
    Objeto.setCurrentValue(Objeto.PCT_CAPITAL);
  end;//ends_if_Selected_then
end;

procedure TWCrCdQtQbC.edPCT_CAPITALExit(Sender: TObject);
begin
  if Selected then
  begin
    with Objeto do
      if ValidateField( IMP_CAPITAL, IMP_M_CAPITAL, PCT_CAPITAL, IMP_PCT_CAPITAL, coMsgPctCapital, True ) then
      begin
        ReCalculate;
        SetToGrid;
        edPCT_CAPITALEnter(Sender);
      end;
  end;//ends_if_Selected_then
end;

procedure TWCrCdQtQbC.edIMP_PCT_CAPITALEnter(Sender: TObject);
begin
  if Selected then
  begin
    Objeto.setCurrentValue(Objeto.IMP_PCT_CAPITAL);
  end;//ends_if_Selected_then
end;
{}
procedure TWCrCdQtQbC.edIMP_PCT_CAPITALExit(Sender: TObject);
begin
  if Selected then
  begin
    with Objeto do
      if ValidateField( IMP_CAPITAL, IMP_M_CAPITAL, PCT_CAPITAL, IMP_PCT_CAPITAL, coMsgImpCapital, False ) then
      begin
        ReCalculate;
        SetToGrid;
        edIMP_PCT_CAPITALEnter(Sender);
      end;
  end;//ends_if_Selected_then
end;
//
//                   P O R C E N T A J E   G L O B A L
procedure TWCrCdQtQbC.edPCT_TOTALEnter(Sender: TObject);
begin
  if Selected then
    Objeto.setCurrentValue(Objeto.PCT_TOTAL);
  //ends_if_Selected_then
end;

procedure TWCrCdQtQbC.edPCT_TOTALExit(Sender: TObject);
begin
  if Selected then
  begin
    with Objeto do
      if ValidateField( IMP_TOTAL, IMP_M_TOTAL, PCT_TOTAL, IMP_PCT_TOTAL, coMsgPctTotal, True ) then
      begin
        PCT_COMISION.AsFloat   := PCT_TOTAL.AsFloat;
        PCT_INTERES.AsFloat    := PCT_TOTAL.AsFloat;
        PCT_CAPITALIZA.AsFloat := PCT_TOTAL.AsFloat;
        PCT_CAPITAL.AsFloat    := PCT_TOTAL.AsFloat;
        ReCalculate;
        SetToGrid;
        setCurrentValue(PCT_TOTAL);
      end;
  end;//ends_if_Selected_then
end;
//
{                E V E N T O   D E L   G R I D   D E   D A T O S               }
//
procedure TWCrCdQtQbC.sagDATOSSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if DataFound then
  begin
    Selected  := True;
    GetFromGrid( ARow, ACol );
    DrawControls;
  end;//ends_if
end;
{

}
procedure TWCrCdQtQbC.sagDATOSTopLeftChanged(Sender: TObject);
begin
 if sagDATOS.LeftCol  > COL_DPER then
    sagDATOS.LeftCol := COL_DPER;
end;
{                         MARCA / DEMARCA PERIODOS                             }
procedure TWCrCdQtQbC.cbSeleccionaClick(Sender: TObject);
var  vlRow    : Integer;
     vlFactor : Integer;
     vlIndex  : Integer;
begin
  if not DataFound then
     exit;
  //
  vlIndex := Objeto.INDICE_GRID.AsInteger;
  for vlRow := 0 to sagDATOS.RowCount - 1 do
  begin
    GetFromGrid( vlRow, 0 );
    vlFactor := Word( cbSelecciona.checked );
    //
    Objeto.PCT_COMISION.AsFloat   := co100Pct * vlFactor;
    Objeto.PCT_INTERES.AsFloat    := co100Pct * vlFactor;
    Objeto.PCT_CAPITALIZA.AsFloat := co100Pct * vlFactor;
    Objeto.PCT_CAPITAL.AsFloat    := co100Pct * vlFactor;
    //
    Objeto.ReCalculate;
    SetToGrid;
  end;
  GetFromGrid( vlIndex, 0 );
end;
{
                           P A R A M E T R O S
}
procedure TWCrCdQtQbC.btnCobraClick(Sender: TObject);
var  vlError  : String;
     vlResult : Integer;
     vlRow    : Integer;
     vlCnt    : Integer;
     vlIndex  : Integer;
     vlsql        : string;
     vlDia        : Integer;
     vlDias       : Integer;

     vlDiaInicial : TDateTime;
     vlstrSQLGtia : String;
     vlQryGtia    : TQuery;
     vlbGtia      :boolean;
begin
   if Objeto.ValidaAccesoEsp('TCRCDQTQBC_APLI',True,True) then
   begin
      if not Objeto.Searched then Begin
         ShowMessage( coNoData );
         exit;
      end;//end_if
      //
      if not ( MessageDlg( coRealizaProces, mtConfirmation, [mbYes, mbNo], 0  ) = mrYes ) then
        exit;
      //end_if

      vlSQL := 'Select CVE_CLAVE From CR_CON_CAT_DATA Where Cve_Con_Gpo_Cat = ''CAT_COB_MAX_FVAL''';
      GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_CLAVE',vlDias,False);

      vlDia := StrToInt (FormatDateTime ('dd', Objeto.Apli.DameFechaEmpresa));

      vlDiaInicial := EncodeDate (StrToInt (FormatDateTime ('yyyy', Objeto.Apli.DameFechaEmpresa)),
                                  StrToInt (FormatDateTime ('mm', Objeto.Apli.DameFechaEmpresa)), 1);

      if (vlDia > vlDias) and (Objeto.F_VALOR.GetAsDateTime < vlDiaInicial) then
      begin
        MessageDlg (Format ('No se puede aplicar una fecha valor antes de este mes despues del día %d.', [vlDias]), mtWarning, [mbOk], 0);
        exit;
      end;

      if (vlDia <= vlDias) and (Objeto.F_VALOR.GetAsDateTime < IncMonth (vlDiaInicial, -1)) then
      begin
        MessageDlg ('No se puede aplicar una fecha valor más atras del mes anterior.', mtWarning, [mbOk], 0);
        exit;
      end;


       // se busca si hay garantías aplicadas
       vlbGtia:=false;
       vlstrSQLGtia:= ' SELECT FN_IMPORTE_GARANTIAS('+edValorFiltro.Text +
                        ', ''TODOS'', ''TODOS'', ''TODOS'', TO_DATE(''' +
                        DateToStr( Objeto.F_VALOR.AsDateTime) + ''', ''DD/MM/YYYY''), ''FV'', '''', '''', '''') IMP_GARANTIAS '+
                        ' FROM DUAL';
       vlQryGtia:= GetSQLQuery(vlstrSQLGtia, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
       try
         If vlQryGtia <> Nil Then
         begin
            if vlQryGtia.FieldByName('IMP_GARANTIAS').AsFloat > 0 then
            begin
               EXECUTE_MUESTRAMENSAJE( Format( 'Error. Existe Aplicación de Garantía por %f : ', [ vlQryGtia.FieldByName('IMP_GARANTIAS').AsFloat] ) );
               AddLine( MErrores, Format( 'Error. Existe Aplicación de Garantía por %f : ', [ vlQryGtia.FieldByName('IMP_GARANTIAS').AsFloat] ) );
               vlbGtia:=true;
            end;
            vlQryGtia.Close;
         end;
       finally
         If vlQryGtia <> Nil Then vlQryGtia.Free;
       end;

       if vlbGtia then exit;

      Objeto.TIPO_MOVIMIENTO.GetFromControl;
      Objeto.TIPO_APLICACION.GetFromControl;
      //EJECUTA PROCEDIMIENTO DEL MOVIENTO A APLICAR
      MessageIniFinProceso( MErrores, cInicio );
      // Limpia la tabla de movimientos
      Objeto.stpClrTbl(vlResult, vlError);
      if vlResult <> 0 then
        raise Exception.create( Format( '%d:%s', [ vlResult, vlError ] ) );
      //ends_if
      //
      for vlRow := 0 to sagDATOS.RowCount - 1 do
      begin
        GetFromGrid( vlRow, 0 );
        //
        if ( Objeto.TIPO_MOVIMIENTO.AsString <> coCondona ) and
           ( ( Objeto.IMP_M_COMISION.AsFloat   <> 0 ) OR
             ( Objeto.IMP_M_INTERES.AsFloat    <> 0 ) OR
             ( Objeto.IMP_M_CAPITALIZA.AsFloat <> 0 ) OR
             ( Objeto.IMP_M_CAPITAL.AsFloat    <> 0 ) ) then
        begin
          MessageDlg(coValidaMovto, mtWarning, [mbOk], 0 );
          exit;
        end;
        //
        Objeto.StpAddTbl( Objeto.Credito.ID_CREDITO.AsInteger,
                          Objeto.NUM_PERIODO.AsInteger,
                          StrToDate(sagDATOS.Cells[COL_FVE, Objeto.INDICE_GRID.AsInteger ]),
                          Objeto.F_VALOR.AsDateTime,
                          mTxNota.Text,
                          Objeto.PCT_COMISION.AsFloat,
                          Objeto.PCT_INTERES.AsFloat,
                          Objeto.PCT_CAPITALIZA.AsFloat,
                          Objeto.PCT_CAPITAL.AsFloat,
                          Objeto.IMP_PCT_COMISION.AsFloat,
                          Objeto.IMP_PCT_INTERES.AsFloat,
                          Objeto.IMP_PCT_CAPITALIZA.AsFloat,
                          Objeto.IMP_PCT_CAPITAL.AsFloat,
                          vlResult,
                          vlError);
        if vlResult <> 0 then
          raise Exception.create( Format( '%d:%s', [ vlResult, vlError ] ) );
        //ends_if
      end;
      //
      Objeto.stpAplMovto( Objeto.Credito.ID_CREDITO.AsInteger,
                          Objeto.TIPO_MOVIMIENTO.AsString,
                          Objeto.TIPO_APLICACION.AsString,
                          Objeto.B_TODOS_PERIODOS.AsString,
                          vlResult,
                          vlError);
      AddLine(MErrores, vlError);
      //
      vlIndex := Objeto.StpObtCntLog;
      for vlCnt := 1 to vlIndex do
      begin
        Objeto.StpObtLog( vlCnt, vlResult, vlError );
        if vlResult <> 0 then
        begin
          EXECUTE_MUESTRAMENSAJE( Format( 'Error %.7d : %s', [ vlResult, vlError ] ) );
          AddLine( MErrores, Format( 'Error %.7d : %s', [ vlResult, vlError ] ) );
        end else
          AddLine( MErrores, Format( '%s', [ vlError ] ) )
      end;//ends_for
      //
      MessageIniFinProceso( MErrores, cFinal );
      // Actualiza la pantalla
      ShowData;
      if vlError <> '' then
        mTxNota.Clear;
   end;
end;
//
//
procedure TWCrCdQtQbC.btCOBRANZAClick(Sender: TObject);
var  Cobranza : TCrcobranz;
begin
   if Objeto.ValidaAccesoEsp('TCRCDQTQBC_COBRA',True,True) then
   begin
      {$WARNINGS OFF}
      Cobranza := TCrcobranz.Create(Self);
      {$WARNINGS ON}
      try
        Cobranza.GetParams(Objeto);
        Cobranza.ParamCre:=Objeto.ParamCre;
        Cobranza.VALOR_FILTRO.AsString := Objeto.CatCredito.ID_CREDITO.AsString;
        Cobranza.COBRANZA.AsString := coCobIM;
        Cobranza.Catalogo;
      finally
             Cobranza.Free;
             ShowData;
      end;
   end;
end;

procedure TWCrCdQtQbC.btCANCELAClick(Sender: TObject);
var  Cancela : TCrCanCob;
begin
   if Objeto.ValidaAccesoEsp('TCRCDQTQBC_CANC',True,True) then
   begin
      {$WARNINGS OFF}
      Cancela := TCrCanCob.Create(Self);
      {$WARNINGS ON}
      try
        Cancela.GetParams(Objeto);
        Cancela.ParamCre:=Objeto.ParamCre;
        Cancela.Credito.ID_CREDITO.AsString := Objeto.CatCredito.ID_CREDITO.AsString;
        Cancela.Catalogo;
      finally
             Cancela.Free;
             ShowData;
      end;
   end;
end;
//
procedure TWCrCdQtQbC.MErroresDblClick(Sender: TObject);
begin
  MErrores.Lines.Clear;
end;






end.
