// Sistema         : Clase de CRCOBRANZ
// Fecha de Inicio : 13/08/2003
// Función forma   : Clase de CRCOBRANZ
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
// Modificada      : 03 nov 2004. Pago x disposicion
//                 : 15 sep 2005. Corrección multichequera
//                 : 28 nov 2005. Garantías PYME
//                 : 02 AGO 2006. Credito en Línea
Unit IntCrcobranz;

interface
                              
uses
  Windows, Messages, SysUtils, Classes,  Graphics, Controls, Forms,    Dialogs,
  IntFrm,  DB,       DbTables, Mask,     StdCtrls, Buttons,  ExtCtrls, InterFor,
  IntFind, UnSQL2,   InterFun, ComCtrls, IntDtPk,  Grids,    Aligrid,  InterEdit,
  ImgList, Menus,    ToolWin,  StdActns, ActnList,


  //Unidades Adicionales
  IntLinkit,     // --
  IntParamCre,   // Unidad de paramétros del Panel
  IntGenCre,     // Unidad genérica de funciones y constantes
  IntCrCobConst, // Constantes y procedimientos de la cobranza
  IntMProdGpo,   // Grupo Producto
  IntCrProduct,  // Producto
  IntCrAcredit,  // Acreditado
  IntCrCto,      // Contrato
  IntCrCredito,  // Disposición
  IntCrProveed,  // Proveedor
  IntCrEmisor,   // Emisor - NAFINSA
  IntConTransa,  // Consulta Depositos a la Vista
  IntCrCesion,   // Cesion
  IntCrDocto,    // Documento
  IntCrCobComi,  // Comisiones
  IntCrConsult,  // Catalogo de consultas
  IntCrCobMchq,  // Cobranza MultiChequera
  IntCrGaSoApl,  // Cátalog de solicitud de garantías
  IntCrCobAnti   // <LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
  ;

type

  PInfoDocto     = record
    F_VALOR_PAGO : TDateTime;
    FACT_MORAS   : Double;
    MONTO_MORAS  : Double;
    IMP_DEPOSITO : Double;
    IMP_COMISION : Double;
    IMP_INTERES  : Double;
    IMP_FIN_ADIC : Double;
    IMP_CAPITAL  : Double;
  end;
  //
  TCrcobranz  = class;
  //
  TWCrcobranz = class(TForm)
    InterForma1  : TInterForma;
    btnCobra     : TButton;
    MErrores : TMemo;
    PnDatos  : TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha  : TLabel;
    lbPerfil : TLabel;
    lbDUsuario: TLabel;
    lbDPerfil : TLabel;
    lbDFecha  : TLabel;
    lbDEmpresa: TLabel;
    ikValorFiltro: TInterLinkit;
    ImageList : TImageList;
    cbSeleccion: TCheckBox;
    sbLogCobranza: TSpeedButton;
    cbB_COB_ORD_PER: TCheckBox;
    rgAcreditado: TGroupBox;
    lbNOMBRE_ACREDITADO: TLabel;
    pnColumnas: TPanel;
    edTitDocto: TEdit;
    edTitFVentto: TEdit;
    edTitImpDep: TEdit;
    edTitSEL: TEdit;
    edTitLN: TEdit;
    edTitDisp: TEdit;
    edTitInt: TEdit;
    edTitTotal: TEdit;
    edTitImpCap: TEdit;
    edTitGF: TEdit;
    edTitComis: TEdit;
    edTitRem: TEdit;
    edTitFOper: TEdit;
    edTitFinAdic: TEdit;
    sagDATOS: TStringAlignGrid;
    pupFiltroBusqueda: TPopupMenu;
    pupAcreditado: TMenuItem;
    pupDisposicion: TMenuItem;
    N1: TMenuItem;
    pupProveedor: TMenuItem;
    pupEmisNafin: TMenuItem;
    N2: TMenuItem;
    pupIDFIRA: TMenuItem;
    pupNoCtrl: TMenuItem;
    pupGpoProducto: TMenuItem;
    pupTipoCobranza: TPopupMenu;
    pupCobAnticipada: TMenuItem;
    pupCobProgramada: TMenuItem;
    pupCobImpagada: TMenuItem;
    N5: TMenuItem;
    pupCobIndistinta: TMenuItem;
    pupContrato: TMenuItem;
    gbNvaInfGral: TGroupBox;
    lbID_CONTRATO: TLabel;
    lbID_CTO_LIQ: TLabel;
    lbID_CREDITO: TLabel;
    edID_CONTRATO: TEdit;
    edID_CTO_LIQ: TEdit;
    edID_CREDITO: TEdit;
    lbDESC_MONEDA: TLabel;
    edDESC_MONEDA: TEdit;
    lbSDO_CHEQUERA: TLabel;
    edSDO_CHEQUERA: TEdit;
    lbIMP_VIG_DISP: TLabel;
    edIMP_VIG_DISP: TEdit;
    lbF_INICIO: TLabel;
    edF_INICIO: TEdit;
    lbF_VENTTO_DISP: TLabel;
    edF_VENTTO_DISP: TEdit;
    lbID_CRED_EXTERNO: TLabel;
    edID_CRED_EXTERNO: TEdit;
    lbID_CONTROL_EXT: TLabel;
    edID_CONTROL_EXT: TEdit;
    lbDESC_C_PRODUCTO: TLabel;
    edDESC_C_PRODUCTO: TEdit;
    bvSeparador: TBevel;
    lbIMP_INI_DISP: TLabel;
    edIMP_INI_DISP: TEdit;
    btCESION: TBitBtn;
    btDOCTO: TBitBtn;
    rgParametros: TGroupBox;
    lbFacMora: TLabel;
    lbFValor: TLabel;
    lbMontoMora: TLabel;
    btFECHA: TSpeedButton;
    btFACT_MORAS: TSpeedButton;
    lbImpDep: TLabel;
    lbIVAMor: TLabel;
    lbCondMora: TLabel;
    btImpDeposito: TSpeedButton;
    edMONTO_MORAS: TInterEdit;
    edFECHA: TEdit;
    dtFECHA: TInterDateTimePicker;
    cbB_COND_MORAS: TCheckBox;
    cbB_IVA_MORA: TCheckBox;
    edIMP_DEPOSITO: TInterEdit;
    edFAC_MORAS: TInterEdit;
    cbGarFEGA: TCheckBox;
    rgImporte: TGroupBox;
    lbCobra: TLabel;
    lbTotal: TLabel;
    lbNumPerCom: TLabel;
    lbNumPerInt: TLabel;
    lbNumPerCap: TLabel;
    lbNumPerFin: TLabel;
    edCAPITAL: TInterEdit;
    edINTERES: TInterEdit;
    edCONCEPTOS: TInterEdit;
    btCAPITAL: TBitBtn;
    btINTERES: TBitBtn;
    btCONCEPTOS: TBitBtn;
    edTOTAL: TInterEdit;
    cbCONCEPTOS: TCheckBox;
    cbINTERES: TCheckBox;
    cbCAPITAL: TCheckBox;
    cbTotal: TCheckBox;
    btFinAdic: TBitBtn;
    edFinAdic: TInterEdit;
    cbFinAdic: TCheckBox;
    rgTIPO_COB_ANT: TRadioGroup;
    rgSUB_TIPO_COB_ANT: TRadioGroup;
    cbB_TRANSFERENCIA: TCheckBox;
    cbReportados: TCheckBox;
    cbFiltro: TCheckBox;
    btBUSCA: TBitBtn;
    edDESC_FILTRO: TEdit;
    btnFiltro: TBitBtn;
    edValorFiltro: TEdit;
    lbFiltro: TLabel;
    tbarTipoFiltro: TToolBar;
    tbTipoFiltro: TToolButton;
    tbarTipoCobranza: TToolBar;
    tbTipoCobranza: TToolButton;
    N3: TMenuItem;
    Nafin: TMenuItem;
    IdNafin: TMenuItem;
    OrigenRecursos: TMenuItem;
    RecNAFIN: TMenuItem;
    RecPropios: TMenuItem;
    N4: TMenuItem;
    IntTodos: TMenuItem;
    IntVentto: TMenuItem;
    IntAnticipado: TMenuItem;
    pnlMsgs: TPanel;
    pupGtiaPYME: TPopupMenu;
    AsignarGarantiaPYME1: TMenuItem;
    lbPagoAnt: TLabel;
    ieIMP_COM_PGAN: TInterEdit;
    rgTipoComision: TRadioGroup;
    cbFiltroChqra: TCheckBox;
    btnAParcialATodos: TButton;
    btnAParcialXDisp: TBitBtn;
    Edit1: TEdit;
    cbMuestraRSRE: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure oeTipoFiltroClick(Sender: TObject);
    procedure oeFiltroAdicionalClick(Sender: TObject);
    procedure oeCOBRANZAClick(Sender: TObject);
    procedure cbFiltroClick(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure ikValorFiltroEjecuta(Sender: TObject);
    procedure btBUSCAClick(Sender: TObject);
    procedure sagDATOSSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure btFECHAClick(Sender: TObject);
    procedure btFACT_MORASClick(Sender: TObject);
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure btCHEQUERAClick(Sender: TObject);
    procedure btnCobraClick(Sender: TObject);
    procedure cbCONCEPTOSClick(Sender: TObject);
    procedure cbINTERESClick(Sender: TObject);
    procedure cbCAPITALClick(Sender: TObject);
    procedure edMONTO_MORASKeyPress(Sender: TObject; var Key: Char);
    procedure btCONCEPTOSClick(Sender: TObject);
    procedure btINTERESClick(Sender: TObject);
    procedure btCAPITALClick(Sender: TObject);
    procedure cbTotalClick(Sender: TObject);
    procedure cbB_IVA_MORAClick(Sender: TObject);
    procedure sagDATOSDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure sagDATOSMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cbB_COND_MORASClick(Sender: TObject);
    procedure edCONCEPTOSExit(Sender: TObject);
    procedure edINTERESExit(Sender: TObject);
    procedure edCAPITALExit(Sender: TObject);
    procedure btDISPOCISIONClick(Sender: TObject);
    procedure cbSeleccionClick(Sender: TObject);
    procedure sbLogCobranzaClick(Sender: TObject);
    procedure edFAC_MORASKeyPress(Sender: TObject; var Key: Char);
    procedure edFAC_MORASExit(Sender: TObject);
    procedure edMONTO_MORASExit(Sender: TObject);
    procedure btImpDepositoClick(Sender: TObject);
    procedure cbReportadosClick(Sender: TObject);
    procedure btFinAdicClick(Sender: TObject);
    procedure edFECHAExit(Sender: TObject);
    procedure edFECHAKeyPress(Sender: TObject; var Key: Char);
    procedure edIMP_DEPOSITOKeyPress(Sender: TObject; var Key: Char);
    procedure edIMP_DEPOSITOExit(Sender: TObject);
    procedure cbGarFEGAClick(Sender: TObject);
    procedure edFinAdicExit(Sender: TObject);
    procedure edCONCEPTOSKeyPress(Sender: TObject; var Key: Char);
    procedure edINTERESKeyPress(Sender: TObject; var Key: Char);
    procedure edFinAdicKeyPress(Sender: TObject; var Key: Char);
    procedure edCAPITALKeyPress(Sender: TObject; var Key: Char);
    procedure cbFinAdicClick(Sender: TObject);
    procedure edFECHAEnter(Sender: TObject);
    procedure edFAC_MORASEnter(Sender: TObject);
    procedure edMONTO_MORASEnter(Sender: TObject);
    procedure edIMP_DEPOSITOEnter(Sender: TObject);
    procedure cbB_IVA_MORAEnter(Sender: TObject);
    procedure cbB_COND_MORASEnter(Sender: TObject);
    procedure cbGarFEGAEnter(Sender: TObject);
    procedure MErroresDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sagDATOSDblClick(Sender: TObject);
    //procedure pmCndMoraATodosClick(Sender: TObject);
    procedure rgTIPO_COB_ANTClick(Sender: TObject);
    procedure edIMPORTE_TEXTChange(Sender: TObject);
    procedure btCESIONClick(Sender: TObject);
    procedure btDOCTOClick(Sender: TObject);
    procedure dtFECHAExit(Sender: TObject);
    procedure OrigenRecursosClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure AsignarGarantiaPYME1Click(Sender: TObject);
    procedure rgTipoComisionClick(Sender: TObject);
    procedure ieIMP_COM_PGANEnter(Sender: TObject);
    procedure ieIMP_COM_PGANExit(Sender: TObject);
    procedure ieIMP_COM_PGANKeyPress(Sender: TObject; var Key: Char);
    procedure rgSUB_TIPO_COB_ANTClick(Sender: TObject);
    procedure cbFiltroChqraClick(Sender: TObject);
    procedure btnAParcialATodosClick(Sender: TObject);
    procedure btnAParcialXDispClick(Sender: TObject);
    procedure cbMuestraRSREClick(Sender: TObject);
  private
    fSearching  : Boolean;
    fBolSearch  : Boolean;
    fDataFound  : Boolean;
  private
    procedure    AddError      ( pMsgError : String);
    Function     ValidaError   ( pMsgError : String): Boolean;
    procedure    LimpiaFiltro;
    procedure    SetTipoFiltro;
    Function     BeginSearch( BBusca : Boolean; const Llave : array of TVarRec ): Boolean;
    procedure    LimpiaRecord;
    procedure    LimpiaPantalla;
    procedure    MuestraHints;
    procedure    MuestraDatos;
    procedure    AsignaFVAlorPago   ( peFecha  : TDateTime );
    procedure    AsignaFactorMoras  ( peFactor : Double    );
    procedure    AsignaMontoMoras   ( peMonto  : Double    );
    procedure    AsignaMontoDeposito( peMonto  : Double    );
    procedure    AsignaImpComision  ( peMonto  : Double    );
    procedure    AsignaImpInteres   ( peMonto  : Double    );
    procedure    AsignaImpFinAdic   ( peMonto  : Double    );
    procedure    AsignaImpCapital   ( peMonto  : Double    );
    function     AsignaMontoCredito( peIdCredito, pIni, pFin : Integer; Saldo : Double ) : Boolean;
    function     ValidaSaldoChqra(bBandera : Boolean ) : Boolean;
    function     ValidaPagoAnticipado : Boolean;
    function     EsPagoAnticipado(FVencto, FProgPago, FOperacion : TDateTime ): Boolean;
    function     CalcImpBaseAN(idcredito, fo, ff : Integer; bFAdic, bCapital : String; CurrRow : Integer ): Double;
  private
    procedure    FmtCurrEdit( Sender: TEdit );
  private
    function     ValidaGFEjercida ( peIdCredito : Integer ): Boolean;
  private
    //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
    procedure    ResetCobAN;
    procedure    ValidaCobAN;
    //<ENDS_LOLS_24_AGO_2006>
    procedure    HabilitaCobAN;
    procedure    HabilitaChkBox ( peHabilita : Boolean );
    //<LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
    procedure    HabilitaEvPgAN( peHabilita : Boolean );
    procedure    ShowHideEditPgAN;
    procedure    ShowHideComPgAN;
    procedure    UpdateComPgAN( peMetodo     : Integer; b_pct_c_pgan : string;
                                pct_comision : Double;  imp_comision : double );
    //</LOLS>
    procedure    AsignaColRow  ( peColor : TColor; peRow : Integer );
    // procedimientos de vaciado de datos
    function     ExisteRegActivo : Boolean;
    function     EsDescuento( peParam   : String ): Boolean;
    function     ObtenPestana : String;
    procedure    ObtenIndicesParams( var idxFM, idxMM, idxIM, idxCM : Integer;
                                     var Accesorio : String );
    procedure    GetFromGrid( peRowGrid, peColGrid : Integer);
    procedure    DrawControls;
    procedure    GetFromControls;
    procedure    UpdateToGrid;
    Function     ValFechaOper( peBandera : Boolean ): Boolean;
    // procedimientos de calculo de datos
    procedure    ObtImportes;
    Procedure    SumaImportes;
    function     TipoCapitalVPN: Boolean;
    procedure    CalculaCobranza( BObtImp : Boolean );
    procedure    ProcesaCambio;
    procedure    ProcesaImportes;
    procedure    ValidaChkCobranza( pRoot : Boolean );
    //
    procedure    UserCambiaFactorMoras( peFactor : Double  );
    procedure    UserCambiaIVAMoras   ( peBIVA : String );
    procedure    UserCambiaCondMoras  ( peBCondona : String );
  private
    vgInfoPer    : PInfoDocto;
    vgLGarFEGA   : TStringList;
    vgLInfoCred  : TStringList;
    vgPctImpCom  : Double;
    vgAplicaAsignacionAtodos : Boolean;
    vgHuboGarantias : Boolean;
  public
    Objeto       : TCrcobranz;
    CrCobAnti    : TCrCobAnti;
  private
    property Searching : Boolean read fSearching write fSearching default true;
    property Searched  : Boolean read fBolSearch write fBolSearch default true;
    property DataFound : Boolean read fDataFound write fDataFound default true;
  end;

  TCrcobranz= class(TInterFrame)
  protected
  private
    vgLCrComis               : TList;
  public
    // INTERCAMPOS PARA FILTRAR LA BUSQUEDA
    TIPO_FILTRO              : TInterCampo;
    COBRANZA                 : TInterCampo;
    B_OPERADO_NAFIN          : TInterCampo;
    VALOR_FILTRO             : TInterCampo;
    TIPO_COB_ANT             : TInterCampo;
    SUB_TIPO_COB_ANT         : TInterCampo;
    B_TRANSFERENCIA          : TInterCampo;
    B_HABILITA_AN            : TInterCampo;
    B_REPORTADOS             : TInterCampo;
    FILTRO_TIPO_INTERES      : TInterCampo;
    FILTRO_OPERADO_NAFIN     : TInterCampo;
    //
    INDICE_GRID              : TInterCampo;
    COLUMNA_GRID             : TInterCampo;
    TIPO_PARAM               : TInterCampo;
    NUM_PER_DOCTO            : TInterCampo;
    F_VENCIMIENTO            : TInterCampo;
    F_PROG_PAGO              : TInterCampo;
    // DE LA SECCION INFORMACION GENERAL
    ID_CONTRATO              : TInterCampo;
    FOL_CONTRATO             : TInterCampo;
    CVE_MONEDA               : TInterCampo;
    DESC_MONEDA              : TInterCampo;
    ID_CTO_LIQ               : TInterCampo;
    SDO_CHEQUERA             : TInterCampo;
    ID_CREDITO               : TInterCampo;
    ID_CESION                : TInterCampo;
    ID_DOCUMENTO             : TInterCampo;
    ID_CRED_EXTERNO          : TInterCampo;
    ID_CONTROL_EXT           : TInterCampo;
    IMP_INI_DISP             : TInterCampo;
    IMP_VIG_DISP             : TInterCampo;
    F_INICIO                 : TInterCampo;
    F_VENTTO_DISP            : TInterCampo;
    CVE_PRODUCTO_CRE         : TInterCampo;
    DESC_C_PRODUCTO          : TInterCampo;
    ID_ACREDITADO            : TInterCampo;
    NOMBRE_ACREDITADO        : TInterCampo;
    B_MULTI_CHQRA            : TInterCampo;
    // DE LA SECCION DE PARAMETROS
    F_VALOR_PAGO             : TInterCampo;
    FACT_MORAS               : TInterCampo;
    MONTO_MORAS              : TInterCampo;
    IMP_DEP_GAR_FEGA         : TInterCampo;
    B_IVA_MORAS              : TInterCampo;
    B_COND_MORAS             : TInterCampo;
    B_GARANTIA_FEGA          : TInterCampo;
    // PARAMETROS DE COMISION
    FAC_MORAS_CO             : TInterCampo;
    IMP_MORAS_CO             : TInterCampo;
    B_IVA_MORA_CO            : TInterCampo;
    B_COND_MORA_CO           : TInterCampo;
    // PARAMETROS DE INTERES
    FAC_MORAS_IN             : TInterCampo;
    IMP_MORAS_IN             : TInterCampo;
    B_IVA_MORA_IN            : TInterCampo;
    B_COND_MORA_IN           : TInterCampo;
    // PARAMETROS DE FINANCIAMIENTO ADICIONAL
    FAC_MORAS_FA             : TInterCampo;
    IMP_MORAS_FA             : TInterCampo;
    B_IVA_MORA_FA            : TInterCampo;
    B_COND_MORA_FA           : TInterCampo;
    // PARAMETROS DE CAPITAL
    FAC_MORAS_CA             : TInterCampo;
    IMP_MORAS_CA             : TInterCampo;
    B_IVA_MORA_CA            : TInterCampo;
    B_COND_MORA_CA           : TInterCampo;
    // DE LA SECCION DE IMPORTES
    IMP_COMISION             : TInterCampo;
    IMP_COM_EVENTO           : TInterCampo;
    IMP_INTERES              : TInterCampo;
    IMP_FIN_ADIC             : TInterCampo;
    IMP_CAPITAL              : TInterCampo;
    IMP_TOTAL                : TInterCampo;
    IMP_REMANENTE            : TInterCampo;
    // NUMEROS DE PERIODOS DE LA SECCION DE IMPORTES
    NUM_PER_COM              : TInterCampo;
    NUM_PER_INT              : TInterCampo;
    NUM_PER_FIN              : TInterCampo;
    NUM_PER_CAP              : TInterCampo;
    //
    B_COB_COMISION           : TInterCampo;
    B_COB_INTERES            : TInterCampo;
    B_COB_FIN_ADIC           : TInterCampo;
    B_COB_CAPITAL            : TInterCampo;
    B_COB_TOTAL              : TInterCampo;
    //
    B_MOD_IMP_COM            : TInterCampo;
    B_MOD_IMP_INT            : TInterCampo;
    B_MOD_IMP_FIN            : TInterCampo;
    B_MOD_IMP_CAP            : TInterCampo;
    //
    B_COB_ORD_PER            : TInterCampo;
    B_COB_ORD_ACC            : TInterCampo;
    B_COB_TOT_PER            : TInterCampo;
    B_COB_PARCIAL            : TInterCampo;
    //
    B_CUBRE_PAGO             : TInterCampo;
    B_APLICA_GF              : TInterCampo;
    //
    CVE_ACCESORIO            : TInterCampo;
    // NO VISIBLES
    IMP_NOMINAL              : TInterCampo;
    CVE_TIPO_INTERES         : TInterCampo;
    TIPO_DETALLE             : TInterCampo;
    // TIPO DE GARANTIAS DE LA DISPOSICION
    B_GTIA_PYME              : TInterCampo;
    //<LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
    B_COM_X_PGAN             : TInterCampo;
    B_PCT_C_PGAN             : TInterCampo;
    PCT_COM_PGAN             : TInterCampo;
    IMP_COM_PGAN             : TInterCampo;
    B_PA_MOD_PCT_COM         : TInterCampo;
    B_PA_MOD_IMP_COM         : TInterCampo;
    //</LOLS>

    //LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT
    CVE_SUB_TIP_COB          : TInterCampo;
    //</ENDS_LOLS_24_AGO_2006>


    //
    // Clase de los parametros de la aplicacion
    ParamCre                 : TParamCre;
    // Clases utilizadas para el filtro de busqueda
    CatProdGpo               : TMProdGpo;
    CatAcreditado            : TCrAcredit;
    CatContrato              : TCrCto;
    CatCredito               : TCrCredito;
    {}
    CatProveedor             : TCrProveed;
    CatEmisor                : TCrEmisor;
    // Clases utilizadas como catalogos de la seccion "Informacion General"
    CrContrato               : TCrCto;
    ConTransa                : TConTransa;
    Credito                  : TCrCredito;
    Cesion                   : TCrCesion;
    Documento                : TCrDocto;
    Producto                 : TCrproduct;
  private
    procedure   MuestraError( vlError : String );
    function    CobToCveCob( peValor : String) : String;
    function    BoolToStr( peValor : Boolean ) : String;
    function    StrToBool( peValor : String  ) : Boolean;
  public
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow( FormaTipo : TFormaTipo) : Integer; override;
  public
    function    BuildSQLStr(bSaldoChqra : Boolean ) : String;
    procedure   stpLimpiaMultiChqra( var pResult    : Integer;
                                     var pTxResult  : String );
    procedure   StpObtAdeudo( peIdCredito  : Integer; peNumPeriodo: Integer;
                              peCveComision: String;  pFCalculo : TDate;
                              pFactor      : Double;  pBIVA     : String;
                              pCveAccesorio: String;  var vlTotal,
                              vlImporte, vlIVA, vlBenBco,  vlBenGob, vlMoras,
                              vlIVAMoras : Double; var  vlError : String );
    procedure   StpObtRemanente( pIdCesion:  Integer; pIdDocumento: String;
                                 pFPago: TDate;       pImpDepositado: Double;
                                 pFactMoras: Double;  var psImpTotal: Double;
                                 var vlError: String );
    function    StpObtFacMora(peIdCredito, peNumPeriodo: Integer; peBAplic : String;
                   peMonto : Double; peFPago: TDate; peCveAccesorio : String;
                   var psFacMoras: Double):Boolean;
    procedure   LimpiaTablaCob(var  vlError : String);
    procedure   StpAgregaElemento( pidCredito  : Integer;   pFVentto       : TDate;
                  pFProgPago     : TDate;   pFValor         : TDate;    pdocto         : String;
                  pNumPerDoc     : Integer; pImpdeposito    : Double;   pbComis         : String;
                  pbInteres      : String;  pbFinAdic       : String;   pbCapital       : String;
                  pImpPagoCon    : Double;  pImpPagoInt     : Double;   pImpPagoFin     : Double;
                  pImpPagoCap    : Double;  pfact_moras_cn  : Double;   pfact_moras_in  : Double;
                  pfact_moras_fn : Double;  pfact_moras_cp  : Double;   pb_iva_mora_cn  : String;
                  pb_iva_mora_in : String;  pb_iva_mora_fn  : String;   pb_iva_mora_cp  : String;
                  pb_cond_mora_cn: String;  pb_cond_mora_in : String;   pb_cond_mora_fn : String;
                  pb_cond_mora_cp: String;  pb_garantia_fega: String;   pbCobOrdPer     : String;
                  pbCobOrdAcc    : String;  pbCobTotPer     : String;   pbCobParcial    : String;
                  pbCondAut      : String;  ptipodet        : String;   ptipo_cob       : String;
                  psubtipcob     : String;  b_transfiere    : String;   pb_com_pago_an  : String;
                  pb_pct_comision: String;  ppct_com_pago_an: Double;   pimp_com_pago_an: Double;
                  var  vlError    : String);
    procedure   StpObtImpGPYME(
                  pidCredito     : Integer; pFVentto        : TDate;    pFProgPago      : TDate;
                  pFValor        : TDate;   pdocto          : String;   pNumPerDoc      : Integer;
                  pImpdeposito   : Double;  pbComis         : String;   pbInteres      : String;
                  pbFinAdic      : String;  pbCapital       : String;   pfact_moras_cn : Double;
                  pfact_moras_in : Double;  pfact_moras_fn  : Double;   pfact_moras_cp  : Double;
                  pb_iva_mora_cn : String;  pb_iva_mora_in  : String;   pb_iva_mora_fn  : String;
                  pb_iva_mora_cp : String;
                  var pImpPagoCon: Double;  var pImpPagoInt : Double;   var pImpPagoFin : Double;
                  var pImpPagoCap: Double;  var  vlError    : String);
    procedure   StpAsignaCob( IdCredito : Integer; ImpPago: Double; var  vlError : String);
    procedure   StpObtImpCob( IdCredito    : Integer; f_vencimiento : TDate;
                              f_prog_pago  : TDate;   id_documento : string;
                              var imp_pago_con : Double; var imp_pago_int : Double;
                              var imp_pago_fin : Double; var imp_pago_cap : Double;
                              var imp_mora_con : Double; var imp_mora_int : Double;
                              var imp_mora_fin : Double; var imp_mora_cap : Double;
                              var fac_mora_con : Double; var fac_mora_int : Double;
                              var fac_mora_fin : Double; var fac_mora_cap : Double;
                              var imp_pago_tot : Double; var vlError : String );
    procedure   StpCobranza( var  vlError : String);
    function    StpObtCntLog : Integer;
    procedure   StpObtLog( peIndice : Integer; var vlError:Integer; var  vlTxError : String );
    Procedure   AsignaTipoFiltro( peIdCredito: String; Sender: TInterLinkit);
    //
    function    StpCalcMontoCN(peIdCredito   : Integer;
                               peCveComision : String;
                               peBPorcentaje : String;
                               pePorcentaje  : Double;
                               peImpBaseCalc : Double;
                               peImpComision : Double;
                               var psImpComision : Double;
                               var psImpIVAComis : Double
                              ):Boolean;
    // RABA FEB 2012 PPP
    Function    StpValImpBloq (peIdCredito   : Integer;
                               peFCobranza   : TDate):Double;
  published
  end;




const
   // Posicion de los datos en el GRID ( Datos Visibles )

   COL_RECU = 0;//0;  // Se encuentra en Recuperacion

   COL_GF   = COL_RECU + 1; // Tiene GF Ejercida
   COL_MCQR = COL_GF + 1;//1;  // Multi Chequera
   COL_SEL  = COL_MCQR + 1;//2;  // Aplica cobro
   COL_CRED = COL_SEL + 1;//3;  // Número de disposición
   COL_DOCU = COL_CRED + 1;//4;  // Número de documento
   COL_FVTO = COL_DOCU + 1;//5;  // Fecha de vencimiento
   COL_FVAL = COL_FVTO + 1;//6;  // Fecha de operación ( Valor )
   COL_IDEP = COL_FVAL + 1;//7;  // Importe de depósito / Garantía FEGA
   COL_ICAP = COL_IDEP + 1;//8;  // Importe de Capital
   COL_IFIN = COL_ICAP + 1;//9;  // Importe de Fin. Adicional
   COL_IINT = COL_IFIN + 1;//10; // Importe de Interés
   COL_ICOM = COL_IINT + 1;//11; // Importe de Conceptos
   COL_ITOT = COL_ICOM + 1;//12; // Importe Total
   COL_IREM = COL_ITOT + 1;//13; // Importe de remanente

   COL_VIS  = COL_IREM;  // Valor de la ultima columna visible en el Grid
   // Posicion de los datos en el GRID ( Datos no visibles )
   COL_IACR = COL_VIS + 1; //14; // Id del Acreditado
   COL_ACRE = COL_IACR + 1;//15; // Nombre del Acreditado
   COL_CTTO = COL_ACRE + 1;//16; // Linea
   COL_FCTO = COL_CTTO + 1;//17; // Folio_contrato
   COL_CPRO = COL_FCTO + 1;//18; // Clave de producto de credito
   COL_DPRO = COL_CPRO + 1;//19; // Desc_c_producto
   COL_CMON = COL_DPRO + 1;//20; // Clave de Moneda
   COL_DMON = COL_CMON + 1;//21; // Descripcion de la moneda
   COL_CHEQ = COL_DMON + 1;//22; // Chequera
   COL_SALD = COL_CHEQ + 1;//23; // Saldo de la chequera
   COL_CREX = COL_SALD + 1;//24; // Credito Externo
   COL_CTEX = COL_CREX + 1;//25; // Control Externo
   COL_IMIN = COL_CTEX + 1;//26; // Monto Inicial
   COL_IMVI = COL_IMIN + 1;//27; // Importe Vigente
   COL_FINI = COL_IMVI + 1;//28; // Fecha Inicial
   COL_FFIN = COL_FINI + 1;//29; // Fecha de vencimiento
   COL_FMOR = COL_FFIN + 1;//30; // Factor de Moratorios
   COL_CESI = COL_FMOR + 1;//31; // Id Cesion
   COL_BNAF = COL_CESI + 1;//32; // Operado por NAFIN
   COL_EMIS = COL_BNAF + 1;//33; // Emisor
   COL_FPPA = COL_EMIS + 1;//34; // Fecha programada de pago
   COL_NPCO = COL_FPPA + 1;//35; // Numero de periodo de comision
   COL_NPIN = COL_NPCO + 1;//36; // Numero de periodo de interes
   COL_NPFA = COL_NPIN + 1;//37; // Numero de periodo de Fin. Adicional
   COL_NPCP = COL_NPFA + 1;//38; // Numero de periodo de capital
   COL_NPDO = COL_NPCP + 1;//39; // Numero de periodo de documento
   COL_BCOP = COL_NPDO + 1;//40; // Cobra en orden de periodo
   COL_BCOA = COL_BCOP + 1;//41; // Cobra en orde de prelacion
   COL_BCTP = COL_BCOA + 1;//42; // Cobra totalidad del periodo
   COL_BCPA = COL_BCTP + 1;//43; // Cobra parcialidad
   COL_BCCO = COL_BCPA + 1;//44; // B_Concepto
   COL_BCIN = COL_BCCO + 1;//45; // B_Interes
   COL_BCFA = COL_BCIN + 1;//46; // B_Financiamiento Adicional
   COL_BCCA = COL_BCFA + 1;//47; // B_Capital
   COL_BMCO = COL_BCCA + 1;//48; // Indica si el usuario modifico el importe de capital
   COL_BMIN = COL_BMCO + 1;//49; // Indica si el usuario modifico el importe de interes
   COL_BMFA = COL_BMIN + 1;//50; // Indica si el usuario modifico el importe de financiamiento adicional
   COL_BMCA = COL_BMFA + 1;//51; // Indica si el usuario modifico el importe de capital
   COL_FMCO = COL_BMCA + 1;//52; // Factor de moras de comision
   COL_FMIN = COL_FMCO + 1;//53; // Factor de moras de interes
   COL_FMFA = COL_FMIN + 1;//54; // Factor de moras de financiamiento adicional
   COL_FMCA = COL_FMFA + 1;//55; // Factor de moras de capital
   COL_MMCO = COL_FMCA + 1;//56; // Moratorios de comisión
   COL_MMIN = COL_MMCO + 1;//57; // Moratorios de interes
   COL_MMFA = COL_MMIN + 1;//58; // Moratorios de financimiento adicional
   COL_MMCA = COL_MMFA + 1;//59; // Moratorios de capital
   COL_IVCO = COL_MMCA + 1;//60; // Aplica IVA de moras de comision
   COL_IVIN = COL_IVCO + 1;//61; // Aplica IVA de moras de Interes
   COL_IVFA = COL_IVIN + 1;//62; // Aplica IVA de moras de financiamiento adicional
   COL_IVCA = COL_IVFA + 1;//63; // Aplica IVA de moras de capital
   COL_CMCO = COL_IVCA + 1;//64; // Condona moratorios de comision
   COL_CMIN = COL_CMCO + 1;//65; // Condona moratorios de Interes
   COL_CMFA = COL_CMIN + 1;//66; // Condona moratorios de financiamiento adicional
   COL_CMCA = COL_CMFA + 1;//67; // Condona moratorios de capital
   COL_BGFE = COL_CMCA + 1;//68; // Es garantía FEGA ?
   COL_BGRF = COL_BGFE + 1;//69; // Aplicar de manera real la garantía FEGA ?
   COL_FCAM = COL_BGRF + 1;//70; // Factor de condonacion automatica de moratorios ?
   COL_BCAU = COL_FCAM + 1;//71; // Condonación Automática de moratorios
   COL_CPAG = COL_BCAU + 1;//72; // Cubre el pago
   COL_BAGF = COL_CPAG + 1;//73; // Aplica garantía FEGA ?
   COL_TREC = COL_BAGF + 1;//74; // Tipo de Informacion de los periodos
   COL_INOM = COL_TREC + 1;//75; // Importe Nominal del Documento
   COL_TPIN = COL_INOM + 1;//76; // Tipo de Pago de Interes
   COL_LCM  = COL_TPIN + 1;//77; // Aplica linea de condonación de moratorios
   COL_GPY  = COL_LCM + 1;//78; // Aplica garantia PYME
   //
   COL_BCPG = COL_GPY + 1;//79; // Aplica comisión por pago anticipado
   COL_BPCT = COL_BCPG + 1;//80; // Aplica Porcentaje de comisión
   COL_PCTC = COL_BPCT + 1;//81; // Porcentaje de comisión (configurado en la disposición)
   COL_IMPC = COL_PCTC + 1;//82; // Importe de comisión    (configurado en la disposición)
   COL_BMPC = COL_IMPC + 1;//83; // Modifica porcentaje de comisión
   COL_BMIM = COL_BMPC + 1;//84; // Modifica importe de comisión
   COL_BPAN = COL_BMIM + 1;//85; // Es pago anticipado
   COL_CCPA = COL_BPAN + 1;//86; // Clave de comisión de pago anticipado
   COL_CPAN = COL_CCPA + 1;//87; // Importe de Comisión total   por pago anticipado para esta cobranza
   COL_CLCA = COL_CPAN + 1;//88; // Tipo de cobranza anticipada
   COL_CLCW = COL_CLCA + 1;//89; // Tipo de cobranza anticipada
   COL_CCAC = COL_CLCW + 1;//90; // Tiene períodos de comisión a nivel acreditado y/o autorizacion
   //
   coFmtCurrency = '###,###,###,###,###,###,###,##0.00';
   //
   // Mensajes generales desplegados en la pantalla
   coNoFiltro    = 'Debe indicar un filtro de búsqueda';
   coWarningAnt  = '¿Deseas buscar TODOS los períodos ANTICIPADOS? ';
   coFoD000      = 'La fecha no puede ser mayor al día actual.';
   coFoNoHabil   = 'La fecha de operación debe ser un día hábil.';
   coFoNoValid   = 'La fecha de operación debe ser mayor o igual al inicio del período actual.';
   coFoActAll    = '¿Deseas aplicar la fecha de operación %s a todos los períodos?.';
   coMorActAll   = '¿Deseas aplicar el factor %s para TODOS los pagos?';
   coACondMorAll = '¿Deseas *** CONDONAR *** los moratorios a *** TODOS *** los pagos?';
   coDCondMorAll = '¿Deseas *** QUITAR *** la condonación de moratorios a *** TODOS *** los pagos?';
   coImpDepMnr   = 'Aviso: El importe depositado es menor al importe total.';
   coObtFacMora  = '¿Deseas calcular el factor de moras a partir de la cantidad de %m?.';
   coAsgImpDep   = '¿Deseas asignar el valor del IMPORTE TOTAL al importe de depósito' + coCRLF +
                   'de todos los créditos cuyo importe deposito sea menor al total?.';
   coRealizaCob  = '¿Desea aplicar la cobranza?';
   coErrorCob    = 'Ha ocurrido un error. ¿Desea continuar?';
   coNoData      = 'No existen datos';
   coNoApGF      = 'La disposición %d no tiene una solicitud de Gar. FEGA ó PYME activa.' + coCRLF +
                   'No es posible marcar el registro';
   coGFAplicada  = 'La disposición %d tiene garantía FEGA ejercida.' + coCRLF +
                   '¿Desea realizar la cobranza?';
   coBComAcrAut  = 'La disposición %d tiene comisiones pendientes de cobro a nivel acreditado o autorización.' + coCRLF +
                   '¿Desea continuar con el proceso de cobranza para esta disposición?';
   coPgAnPlazo   = 'La disposición %s aplica cobranza anticipada por la opción acortar plazo.';
   coPgAnProrr   = 'La disposición %s aplica cobranza anticipada por la opción prorrateo.';
   coPgAnErr     = 'Error al determinar el pago anticipado de la disposición %s.';
   // Tipo Parametro
   coDetalle     = 'DE';
   coResumen     = 'RS';
   // Tipo de Parametro
   coNone        = 0;
   coFecha       = 1;
   coFactor      = 2;
   coMonto       = 3;
   coImpDep      = 4;
   coIVAMor      = 5;
   coCondMor     = 6;
   coGarFEGA     = 7;
   coApGFEGA     = 8;
   coPctPGAN     = 9;
   coImpPGAN     = 10;
   coTipoPGAN    = 12;
   //
   coPaquete     = 'PKGCRCOBRANZA';
   //
   //coMultiChqra  = 'X';
   coMultiChqra  = chr($A4);
   //
   coSqlPagoANSitCN = ' CO.SIT_COMISION   NOT IN ( ''CA'', ''LQ'', ''PA'', ''IM'' ) ';
   coSqlPagoANSitIN = ' I.SIT_INTERES     NOT IN ( ''CA'', ''LQ'', ''PA'', ''IM'' ) AND ' + coCRLF +
                      ' ( ( I.IMP_INTERES + I.IMP_IVA ) - ( I.IMP_PAGADO  + I.IMP_IVA_PAGADO ) <> 0 ) ';
   coSqlPagoANSitFN = ' FN.SIT_FINAN_ADIC NOT IN ( ''CA'', ''LQ'', ''IM'' ) ';
   coSqlPagoANSitCP = ' C.SIT_CAPITAL     NOT IN ( ''CA'', ''LQ'', ''IM'' ) ';
   //
   //
var vlMuestraRSRE : String; //HERJA ABRIL 201

implementation
Uses  IntMensaje,
      IntCrCreChe,
      IntVcrIntere,
      IntVcrcomisi,
      IntVcrcapita;
{$R *.DFM}

function StringToDate(const S: string): TDateTime;
begin
  try result := StrToDate( S );  except  FillChar( result, sizeof(result), #0 ) end;
end;
{
+------------------------------------------------------------------------------+
|                      METODOS Y PROCEDIMIENTOS DEL OBJETO                     |
+------------------------------------------------------------------------------+
}
constructor TCrcobranz.Create( AOwner : TComponent );
begin
  Inherited;
  // Crea los intercampos utilizados para la busqueda
  TIPO_FILTRO  := CreaCampo( 'TIPO_FILTRO',  ftString, tsNinguno, tsNinguno, False);
  COBRANZA     := CreaCampo( 'COBRANZA',     ftString, tsNinguno, tsNinguno, False );
  VALOR_FILTRO := CreaCampo( 'VALOR_FILTRO', ftString, tsNinguno, tsNinguno, False );
  TIPO_COB_ANT := CreaCampo( 'TIPO_COB_ANT', ftString, tsNinguno, tsNinguno, False );
  SUB_TIPO_COB_ANT := CreaCampo( 'SUB_TIPO_COB_ANT',   ftString,  tsNinguno, tsNinguno, False );
  B_REPORTADOS     := CreaCampo( 'B_REPORTADOS',       ftString,  tsNinguno, tsNinguno, False );
  B_TRANSFERENCIA  := CreaCampo( 'B_TRANSFERENCIA',    ftString,  tsNinguno, tsNinguno, False );
  B_HABILITA_AN    := CreaCampo( 'B_HABILITA_AN',      ftString,  tsNinguno, tsNinguno, False );
  //
  FILTRO_TIPO_INTERES  := CreaCampo( 'FILTRO_TIPO_INTERES',   ftString,  tsNinguno, tsNinguno, False );
  FILTRO_OPERADO_NAFIN := CreaCampo( 'FILTRO_OPERADO_NAFIN',  ftString,  tsNinguno, tsNinguno, False );
  //
  with TIPO_COB_ANT do
  begin
    Size := 2;
    UseCombo:=True;                       // Constantes en IntCrCobConst
    ComboLista.Add('0');      ComboDatos.Add(coTD);
    ComboLista.Add('1');      ComboDatos.Add(coPA);
    ComboLista.Add('2');      ComboDatos.Add(coMA);
  end;
  //
  with SUB_TIPO_COB_ANT do
  begin
    Size := 2;
    UseCombo:=True;                       // Constantes en IntCrCobConst
    ComboLista.Add('0');      ComboDatos.Add(coAP);
    ComboLista.Add('1');      ComboDatos.Add(coDM);
  end;
  //
  // APUNTADOR AL NUMERO DE REGISTRO ACTIVO
  INDICE_GRID       := CreaCampo( 'INDICE_GRID',       ftInteger, tsNinguno, tsNinguno, False );
  COLUMNA_GRID      := CreaCampo( 'COLUMNA_GRID',      ftInteger, tsNinguno, tsNinguno, False );
  TIPO_PARAM        := CreaCampo( 'TIPO_PARAM',        ftInteger, tsNinguno, tsNinguno, False );
  NUM_PER_DOCTO     := CreaCampo( 'NUM_PER_DOCTO',     ftFloat,   tsNinguno, tsNinguno, False );
  F_VENCIMIENTO     := CreaCampo( 'F_VENCIMIENTO',     ftDate,    tsNinguno, tsNinguno, False );
  F_PROG_PAGO       := CreaCampo( 'F_PROG_PAGO',       ftDate,    tsNinguno, tsNinguno, False );
  // DE LA SECCION INFORMACION GENERAL
  ID_CONTRATO       := CreaCampo( 'ID_CONTRATO',       ftFloat,   tsNinguno, tsNinguno, False );
  FOL_CONTRATO      := CreaCampo( 'ID_CONTRATO',       ftFloat,   tsNinguno, tsNinguno, False );
  CVE_MONEDA        := CreaCampo( 'CVE_MONEDA',        ftString,  tsNinguno, tsNinguno, False );
  DESC_MONEDA       := CreaCampo( 'DESC_MONEDA',       ftString,  tsNinguno, tsNinguno, False );
  ID_CTO_LIQ        := CreaCampo( 'ID_CTO_LIQ',        ftFloat,   tsNinguno, tsNinguno, False );
  SDO_CHEQUERA      := CreaCampo( 'SDO_CHEQUERA',      ftFloat,   tsNinguno, tsNinguno, False );
  ID_CREDITO        := CreaCampo( 'ID_CREDITO',        ftFloat,   tsNinguno, tsNinguno, False );
  ID_CESION         := CreaCampo( 'ID_CESION',         ftFloat,   tsNinguno, tsNinguno, False );
  ID_DOCUMENTO      := CreaCampo( 'ID_DOCUMENTO',      ftString,  tsNinguno, tsNinguno, False );
  ID_CRED_EXTERNO   := CreaCampo( 'ID_CRED_EXTERNO',   ftString,  tsNinguno, tsNinguno, False );
  ID_CONTROL_EXT    := CreaCampo( 'ID_CONTROL_EXT',    ftString,  tsNinguno, tsNinguno, False );
  IMP_INI_DISP      := CreaCampo( 'IMP_INI_DISP',      ftFloat,   tsNinguno, tsNinguno, False );
  IMP_VIG_DISP      := CreaCampo( 'IMP_VIG_DISP',      ftFloat,   tsNinguno, tsNinguno, False );
  F_INICIO          := CreaCampo( 'F_INICIO',          ftFloat,   tsNinguno, tsNinguno, False );
  F_VENTTO_DISP     := CreaCampo( 'F_VENTTO_DISP',     ftFloat,   tsNinguno, tsNinguno, False );
  CVE_PRODUCTO_CRE  := CreaCampo( 'CVE_PRODUCTO_CRE',  ftString,  tsNinguno, tsNinguno, False );
  DESC_C_PRODUCTO   := CreaCampo( 'DESC_C_PRODUCTO',   ftString,  tsNinguno, tsNinguno, False );
  ID_ACREDITADO     := CreaCampo( 'ID_ACREDITADO',     ftFloat,   tsNinguno, tsNinguno, False );
  NOMBRE_ACREDITADO := CreaCampo( 'NOMBRE_ACREDITADO', ftString,  tsNinguno, tsNinguno, False );
  B_MULTI_CHQRA     := CreaCampo( 'B_MULTI_CHQRA',     ftString,  tsNinguno, tsNinguno, False );
  // DE LA SECCION DE PARAMETROS
  F_VALOR_PAGO      := CreaCampo( 'F_VALOR_PAGO',      ftDate,    tsNinguno, tsNinguno, False );
  FACT_MORAS        := CreaCampo( 'FACT_MORAS',        ftFloat,   tsNinguno, tsNinguno, False );
  MONTO_MORAS       := CreaCampo( 'MONTO_MORAS',       ftFloat,   tsNinguno, tsNinguno, False );
  IMP_DEP_GAR_FEGA  := CreaCampo( 'IMP_DEP_GAR_FEGA',  ftFloat,   tsNinguno, tsNinguno, False );
  B_IVA_MORAS       := CreaCampo( 'B_IVA_MORAS',       ftString,  tsNinguno, tsNinguno, False );
  B_COND_MORAS      := CreaCampo( 'B_COND_MORAS',      ftString,  tsNinguno, tsNinguno, False );
  B_GARANTIA_FEGA   := CreaCampo( 'B_GARANTIA_FEGA',   ftString,  tsNinguno, tsNinguno, False );
  // PARAMETROS DE COMISION
  FAC_MORAS_CO      := CreaCampo( 'FAC_MORAS_CO',      ftFloat,   tsNinguno, tsNinguno, False );
  IMP_MORAS_CO      := CreaCampo( 'IMP_MORAS_CO',      ftFloat,   tsNinguno, tsNinguno, False );
  B_IVA_MORA_CO     := CreaCampo( 'B_IVA_MORA_CO',     ftString,  tsNinguno, tsNinguno, False );
  B_COND_MORA_CO    := CreaCampo( 'B_COND_MORA_CO',    ftString,  tsNinguno, tsNinguno, False );
  // PARAMETROS DE INTERES
  FAC_MORAS_IN      := CreaCampo( 'FAC_MORAS_IN',      ftFloat,   tsNinguno, tsNinguno, False );
  IMP_MORAS_IN      := CreaCampo( 'IMP_MORAS_IN',      ftFloat,   tsNinguno, tsNinguno, False );
  B_IVA_MORA_IN     := CreaCampo( 'B_IVA_MORA_IN',     ftString,  tsNinguno, tsNinguno, False );
  B_COND_MORA_IN    := CreaCampo( 'B_COND_MORA_IN',    ftString,  tsNinguno, tsNinguno, False );
  // PARAMETROS DE FINANCIAMIENTO ADICIONAL
  FAC_MORAS_FA      := CreaCampo( 'FAC_MORAS_FA',      ftFloat,   tsNinguno, tsNinguno, False );
  IMP_MORAS_FA      := CreaCampo( 'IMP_MORAS_FA',      ftFloat,   tsNinguno, tsNinguno, False );
  B_IVA_MORA_FA     := CreaCampo( 'B_IVA_MORA_FA',     ftString,  tsNinguno, tsNinguno, False );
  B_COND_MORA_FA    := CreaCampo( 'B_COND_MORA_FA',    ftString,  tsNinguno, tsNinguno, False );
  // PARAMETROS DE CAPITAL
  FAC_MORAS_CA      := CreaCampo( 'FAC_MORAS_CA',      ftFloat,   tsNinguno, tsNinguno, False );
  IMP_MORAS_CA      := CreaCampo( 'IMP_MORAS_CA',      ftFloat,   tsNinguno, tsNinguno, False );
  B_IVA_MORA_CA     := CreaCampo( 'B_IVA_MORA_CA',     ftString,  tsNinguno, tsNinguno, False );
  B_COND_MORA_CA    := CreaCampo( 'B_COND_MORA_CA',    ftString,  tsNinguno, tsNinguno, False );
  //
  IMP_COMISION      := CreaCampo( 'IMP_COMISION',      ftFloat,   tsNinguno, tsNinguno, False );
  IMP_COM_EVENTO    := CreaCampo( 'IMP_COM_EVENTO',    ftFloat,   tsNinguno, tsNinguno, False );
  IMP_INTERES       := CreaCampo( 'IMP_INTERES',       ftFloat,   tsNinguno, tsNinguno, False );
  IMP_FIN_ADIC      := CreaCampo( 'IMP_FIN_ADIC',      ftFloat,   tsNinguno, tsNinguno, False );
  IMP_CAPITAL       := CreaCampo( 'IMP_CAPITAL',       ftFloat,   tsNinguno, tsNinguno, False );
  IMP_TOTAL         := CreaCampo( 'IMP_TOTAL',         ftFloat,   tsNinguno, tsNinguno, False );
  IMP_REMANENTE     := CreaCampo( 'IMP_REMANENTE',     ftFloat,   tsNinguno, tsNinguno, False );
  //
  NUM_PER_COM       := CreaCampo( 'NUM_PER_COM',       ftString,  tsNinguno, tsNinguno, False );
  NUM_PER_INT       := CreaCampo( 'NUM_PER_INT',       ftString,  tsNinguno, tsNinguno, False );
  NUM_PER_FIN       := CreaCampo( 'NUM_PER_FIN',       ftString,  tsNinguno, tsNinguno, False );
  NUM_PER_CAP       := CreaCampo( 'NUM_PER_CAP',       ftString,  tsNinguno, tsNinguno, False );
  //
  B_COB_COMISION    := CreaCampo( 'B_COB_COMISION',    ftString,  tsNinguno, tsNinguno, False);
  B_COB_INTERES     := CreaCampo( 'B_COB_INTERES',     ftString,  tsNinguno, tsNinguno, False);
  B_COB_FIN_ADIC    := CreaCampo( 'B_COB_FIN_ADIC',    ftString,  tsNinguno, tsNinguno, False);
  B_COB_CAPITAL     := CreaCampo( 'B_COB_CAPITAL',     ftString,  tsNinguno, tsNinguno, False);
  B_COB_TOTAL       := CreaCampo( 'B_COB_TOTAL',       ftString,  tsNinguno, tsNinguno, False);
  //
  B_MOD_IMP_COM     := CreaCampo( 'B_MOD_IMP_COM',     ftString,  tsNinguno, tsNinguno, False );
  B_MOD_IMP_INT     := CreaCampo( 'B_MOD_IMP_INT',     ftString,  tsNinguno, tsNinguno, False );
  B_MOD_IMP_FIN     := CreaCampo( 'B_MOD_IMP_FIN',     ftString,  tsNinguno, tsNinguno, False );
  B_MOD_IMP_CAP     := CreaCampo( 'B_MOD_IMP_CAP',     ftString,  tsNinguno, tsNinguno, False );
  //
  B_COB_ORD_PER     := CreaCampo( 'B_COB_ORD_PER',     ftString,  tsNinguno, tsNinguno, False );
  B_COB_ORD_ACC     := CreaCampo( 'B_COB_ORD_ACC',     ftString,  tsNinguno, tsNinguno, False );
  B_COB_TOT_PER     := CreaCampo( 'B_COB_TOT_PER',     ftString,  tsNinguno, tsNinguno, False );
  B_COB_PARCIAL     := CreaCampo( 'B_COB_PARCIAL',     ftString,  tsNinguno, tsNinguno, False );
  B_CUBRE_PAGO      := CreaCampo( 'B_CUBRE_PAGO',      ftString,  tsNinguno, tsNinguno, False );
  B_APLICA_GF       := CreaCampo( 'B_APLICA_GF',       ftString,  tsNinguno, tsNinguno, False );
  CVE_ACCESORIO     := CreaCampo( 'CVE_ACCESORIO',     ftString,  tsNinguno, tsNinguno, False );
  IMP_NOMINAL       := CreaCampo( 'IMP_NOMINAL',       ftFloat,   tsNinguno, tsNinguno, False );
  CVE_TIPO_INTERES  := CreaCampo( 'CVE_TIPO_INTERES',  ftString,  tsNinguno, tsNinguno, False );
  TIPO_DETALLE      := CreaCampo( 'TIPO_DETALLE',      ftString,  tsNinguno, tsNinguno, False );
  B_GTIA_PYME       := CreaCampo( 'B_GTIA_PYME',       ftString,  tsNinguno, tsNinguno, False );
  //<LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
  B_COM_X_PGAN      := CreaCampo( 'B_COM_X_PGAN',      ftString,  tsNinguno, tsNinguno, False );
  B_PCT_C_PGAN      := CreaCampo( 'B_PCT_C_PGAN',      ftString,  tsNinguno, tsNinguno, False );
  PCT_COM_PGAN      := CreaCampo( 'PCT_COM_PGAN',      ftFloat,   tsNinguno, tsNinguno, False );
  IMP_COM_PGAN      := CreaCampo( 'IMP_COM_PGAN',      ftFloat,   tsNinguno, tsNinguno, False );
  B_PA_MOD_PCT_COM  := CreaCampo( 'B_PA_MOD_PCT_COM',  ftString,  tsNinguno, tsNinguno, False );
  B_PA_MOD_IMP_COM  := CreaCampo( 'B_PA_MOD_IMP_COM',  ftString,  tsNinguno, tsNinguno, False );
  //
  with B_PCT_C_PGAN do
  begin
    Size     := 2;
    UseCombo := True;         // Constantes en IntCrCobConst
    ComboLista.Add('0');      ComboDatos.Add('V');
    ComboLista.Add('1');      ComboDatos.Add('F');
  end;
  //</LOLS>
  //
  //LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT
  CVE_SUB_TIP_COB   := CreaCampo( 'CVE_SUB_TIP_COB',  ftString,  tsNinguno, tsNinguno, False );
  //</ENDS_LOLS_24_AGO_2006>
  //
  {$WARNINGS OFF}
  {   Clases de busqueda }
  CatProdGpo := TMProdGpo.Create(Self);          // Clase de Producto Grupo
  CatProdGpo.MasterSource := Self;
  //
  CatAcreditado := TCrAcredit.Create(Self);      // Clase de acreditado
  CatAcreditado.MasterSource := Self;
  //
  CatContrato   := TCrCto.Create(Self);          // Clase de contrato
  CatContrato.MasterSource := Self;
  //
  CatCredito := TCrCredito.Create(Self);         // Clase de disposición
  CatCredito.MasterSource := Self;
  //
  CatEmisor := TCrEmisor.Create(Self);           // Clase de Emisor
  CatEmisor.MasterSource := Self;
  //
  CatProveedor := TCrProveed.Create(Self);       // Clase de Proveedor
  CatProveedor.MasterSource := Self;
  {   Catalogos   }
  // Autorizacion
  CrContrato := TCrCto.Create(self);
  CrContrato.MasterSource := Self;
  // Chequera
  ConTransa := TConTransa.Create( Self );
  ConTransa.MasterSource := Self;
  // Credito
  Credito := TCrCredito.Create(Self);
  Credito.MasterSource := Self;
  // Cesion
  Cesion := TCrCesion.Create(Self);
  Cesion.MasterSource := Self;
  // Documento
  Documento := TCrDocto.Create(Self);
  Documento.MasterSource := Self;
  // Producto
  Producto := TCrproduct.Create(Self);
  Producto.MasterSource := Self;
  {$WARNINGS ON}

  vgLCrComis := TList.Create;
  //

  StpName    := ' ';
  UseQuery   := False;
  HelpFile   := 'IntCrcobranz.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrcobranz.Destroy;
begin
  // Catalogos de Busqueda
  if CatProdGpo <> nil then
     CatProdGpo.free;
  //end if;
  if CatAcreditado <> nil then
     CatAcreditado.free;
  //end if;

  if CatContrato <> nil then
    CatContrato.Free;
  //end if;
  
  if CatCredito <> nil then
     CatCredito.free;
  //end if;
  if CatEmisor <> nil then
     CatEmisor.free;
  //end if;
  if CatProveedor <> nil then
     CatProveedor.free;
  //end if;
  // Catalogos de "Informacion General"
  if CrContrato <> nil then
     CrContrato.Free;
  //end if
  if ConTransa <> nil then
     ConTransa.free;
  //end if
  if Credito <> nil then
     Credito.free;
  //end if;
  if Cesion <> nil then
     Cesion.Free;
  //end if;
  if Documento <> nil then
     Documento.Free;
  //end if;
  if Producto <> nil then
     Producto.free;
  //end if;

  if Producto <> nil then
     vgLCrComis.Free;
  //end if;

  inherited;
end;


function TCrcobranz.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrcobranz;
begin
   W := TWCrcobranz.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;
// +---------------------------------------------------------------------------+
// +                                                                           +
// +---------------------------------------------------------------------------+
Function TCrcobranz.InternalBusca:Boolean;
var T : TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrcobra.it','');
  try
    if Active then begin end;
    if T.Execute then
      InternalBusca := FindKey([]);
  finally
    T.Free;
  end;
end;
// +---------------------------------------------------------------------------+
// +  Este procedimiento muestra un mensaje de error ocurrido en la aplicacion +
// +---------------------------------------------------------------------------+
procedure TCrcobranz.MuestraError(vlError: String);
begin
  EXECUTE_MUESTRAMENSAJE( vlError );
end;
// +---------------------------------------------------------------------------+
// +                Convierte un Tipo Cobranza a una Clave Cobranza            +
// +---------------------------------------------------------------------------+
function TCrcobranz.CobToCveCob(peValor: String): String;
begin
  Result := '';
  //
  if peValor = coCobAN then Result := 'AN'
  else if peValor = coCobMD then Result := 'MD'
  else if peValor = coCobIM then Result := 'IM';
end;
// +---------------------------------------------------------------------------+
// +                  Convierte un booleano a una cadena                       +
// +---------------------------------------------------------------------------+
function TCrcobranz.BoolToStr( peValor : Boolean ) : String;
begin
  if peValor then result := 'V' else result := 'F';
end;
// +---------------------------------------------------------------------------+
// +                  Convierte una cadena a un booleano                       +
// +---------------------------------------------------------------------------+
function TCrcobranz.StrToBool(peValor: String): Boolean;
begin
  result := ( peValor = 'V' );
end;
// +---------------------------------------------------------------------------+
// +         Construye la cadena SQL para realizar la busqueda de registros    +
// +---------------------------------------------------------------------------+
Function TCrcobranz.BuildSQLStr(bSaldoChqra : Boolean ) : String; // BuildSQLStr : String; // LOLS 01 NOV
var vlsql        : String;
    vlBusca      : String;
    vlFEmpre     : TDate;
    // Condiciones a las tablas cr capital financiamiento interes y comision
    vlBuscaInt   : String;
    vlBuscaCon   : String;
    vlBuscaFin   : String;
    vlBuscaCap   : String;
    // Subquery a las tablas cr capital financiamiento interes y comision
    vlSQLPer     : String;
    // Reportados ?
    vlSQLRep     : String;
    vlBuscaRep   : String;
    // Importe de deposito
    vlSqlImpDep  : String;
    // Número de periodo
    vlSelNumPer   : String;
    vlSQLNumPer   : String;
    vlBuscaNumPer : String;
    //
    vlBuscaCred  : String;
Begin
  vlBuscaCon   := '';
  vlBuscaInt   := '';
  vlBuscaFin   := '';
  vlBuscaCap   := '';
  vlSelNumPer  := '';
  vlSQLNumPer  := '';
  vlBuscaNumPer  := '';
  vlFEmpre       := Apli.DameFechaEmpresa;
  //

  vlBuscaCred := '';
  //
  if ( ( TIPO_FILTRO.AsString = cobpDisp   ) or ( TIPO_FILTRO.AsString = cobpNoCtrl ) or
       ( TIPO_FILTRO.AsString = cobpIdFIRA ) ) and ( VALOR_FILTRO.AsString <> '' ) and
       ( CatCredito.Active ) then
  begin
    vlBuscaCred := 'ID_CREDITO = ' + CatCredito.ID_CREDITO.AsString + ' AND ';
  end;
  //
  //
  // Todas los periodos de una disposicion
  if ( COBRANZA.AsString = coCobGN ) and ( CatCredito.Active ) and
     ( ( TIPO_FILTRO.AsString = cobpDisp   ) or
       ( TIPO_FILTRO.AsString = cobpNoCtrl ) or
       ( TIPO_FILTRO.AsString = cobpIdFIRA )
     ) then
  begin
    vlBuscaCon := ' WHERE ' + vlBuscaCred + ' CO.SIT_COMISION   NOT IN ( ''CA'', ''LQ'' ) ';
    vlBuscaInt := ' WHERE ' + vlBuscaCred + ' I.SIT_INTERES     NOT IN ( ''CA'', ''LQ'' ) ' + coCRLF +
                  '   AND ( ( I.IMP_INTERES + I.IMP_IVA ) - ( I.IMP_PAGADO  + I.IMP_IVA_PAGADO ) <> 0 ) ';
    vlBuscaFin := ' WHERE ' + vlBuscaCred + ' FN.SIT_FINAN_ADIC NOT IN ( ''CA'', ''LQ'' ) ';
    vlBuscaCap := ' WHERE ' + vlBuscaCred + ' C.SIT_CAPITAL     NOT IN ( ''CA'', ''LQ'' ) ';
  end
  // Impagado
  else if COBRANZA.AsString = coCobIM then
  begin
    vlBuscaCap := ' WHERE ' + vlBuscaCred + ' C.SIT_CAPITAL  = ''IM'' ';
    vlBuscaInt := ' WHERE ' + vlBuscaCred + ' I.SIT_INTERES  = ''IM'' ';
    vlBuscaCon := ' WHERE ' + vlBuscaCred + ' CO.SIT_COMISION= ''IM'' ';
    vlBuscaFin := ' WHERE ' + vlBuscaCred + ' FN.SIT_FINAN_ADIC= ''IM'' ';
  end
  // Programado
  else if COBRANZA.AsString = coCobMD then
  begin
    vlBuscaCon := ' WHERE ' + vlBuscaCred + ' CO.F_PROG_PAGO =' + SQLFecha( vlFEmpre ) + coCRLF  +
                  '   AND CO.SIT_COMISION= ''AC'' ';
    vlBuscaInt := ' WHERE ' + vlBuscaCred + ' I.F_PROG_PAGO = ' + SQLFecha( vlFEmpre ) + coCRLF  +
                  '   AND I.SIT_INTERES  = ''AC'' ';
    vlBuscaFin := ' WHERE ' + vlBuscaCred + ' FN.F_PROG_PAGO= ' + SQLFecha( vlFEmpre ) + coCRLF  +
                  '   AND FN.SIT_FINAN_ADIC = ''AC'' ';
    vlBuscaCap := ' WHERE ' + vlBuscaCred + ' C.F_PROG_PAGO = ' + SQLFecha( vlFEmpre ) + coCRLF  +
                  '   AND C.SIT_CAPITAL = ''AC'' ';
  end
  // Anticipado
  else if COBRANZA.AsString = coCobAN then
  begin
    vlBuscaCon := ' WHERE ' + vlBuscaCred + ' CO.F_PROG_PAGO > ' + SQLFecha( vlFEmpre ) + coCRLF  +
                  '   AND  CO.SIT_COMISION NOT IN( ''LQ'', ''CA'' )';
    vlBuscaInt := ' WHERE ' + vlBuscaCred + ' I.F_PROG_PAGO  > ' + SQLFecha( vlFEmpre ) + coCRLF  +
                  '   AND I.SIT_INTERES NOT IN( ''LQ'', ''CA'', ''PA'' )'  + coCRLF  +
                  '   AND ( ( I.IMP_INTERES + I.IMP_IVA ) - ( I.IMP_PAGADO  + I.IMP_IVA_PAGADO ) <> 0 )';
    vlBuscaFin := ' WHERE ' + vlBuscaCred + ' FN.F_PROG_PAGO  > ' + SQLFecha( vlFEmpre ) + coCRLF  +
                  '   AND FN.SIT_FINAN_ADIC NOT IN( ''LQ'', ''CA'' )';
    vlBuscaCap := ' WHERE ' + vlBuscaCred + ' C.F_PROG_PAGO  > ' + SQLFecha( vlFEmpre ) + coCRLF  +
                  '   AND C.SIT_CAPITAL NOT IN( ''LQ'', ''CA'' )';
  end;
   // Sólo los reportados ?
   vlSQLRep   :=  '';
   vlBuscaRep :=  '';
   if B_REPORTADOS.AsString = 'V' then
   begin
     vlSQLRep   :=  '( ' + coCRLF +
                    'SELECT DISTINCT ID_CREDITO ' + coCRLF +
                    'FROM   CR_BIT_SEGUIMIENTO '  + coCRLF +
                    'WHERE  F_COBRANZA     = '    + SQLFecha( vlFEmpre  ) + coCRLF +
                    '  AND  CVE_TIPO_PAGO  = '    + SQLStr ( CobToCveCob(COBRANZA.AsString) )     + coCRLF +
                    ') REP, ';
     vlBuscaRep :=  ' AND REP.ID_CREDITO = CR.ID_CREDITO ';
   end;//ends_if

   // Aplica busqueda especifica
   vlBusca := '';
   if VALOR_FILTRO.AsString <> '' then
   begin
      if TIPO_FILTRO.AsString = cobpGpoProd      then
         vlBusca := 'AND PR.CVE_PRODUCTO_GPO = '   + SQLStr( VALOR_FILTRO.AsString )
      else if TIPO_FILTRO.AsString = cobpAcred   then
         vlBusca := 'AND A.ID_ACREDITADO = '      + VALOR_FILTRO.AsString
      else if TIPO_FILTRO.AsString = cobpAutor   then
         vlBusca := 'AND CC.ID_CONTRATO  = '      + VALOR_FILTRO.AsString
      else if TIPO_FILTRO.AsString = cobpDisp    then
         vlBusca := 'AND CR.ID_CREDITO = '        + VALOR_FILTRO.AsString
      // FACTORAJE
      else if TIPO_FILTRO.AsString = cobpProv    then   // Proveedor
         vlBusca := 'AND CS.ID_PROVEEDOR = '      + VALOR_FILTRO.AsString
      else if TIPO_FILTRO.AsString = cobpEmNaf   then   // Emisor / Nafin ( ID_EMISOR )
         vlBusca := 'AND CS.ID_EMISOR    = '  + VALOR_FILTRO.AsString
      else if TIPO_FILTRO.AsString = cobpIdNafin then   // ID Nafin ( CVE_EMISOR_NAFIN )
         vlBusca := 'AND CS.CVE_EMISOR_NAFIN = '  + VALOR_FILTRO.AsString
      // AGRONEGOCIO
      else if TIPO_FILTRO.AsString = cobpIdFIRA  then
         vlBusca := 'AND CR.ID_CRED_EXTERNO = '   + SQLStr( VALOR_FILTRO.AsString )
      else if TIPO_FILTRO.AsString = cobpNoCtrl  then
         vlBusca := 'AND CR.ID_CONTROL_EXT  = '   + SQLStr( VALOR_FILTRO.AsString )
      ;
   end;
   //
   if ( ( TIPO_COB_ANT.AsString = coPA ) OR   // Pago Anticipado
        ( TIPO_COB_ANT.AsString = coMA )      // Mensualidad Anticipada
      ) then
   begin
     //
     vlSqlImpDep:= '0 IMP_DEPOSITO,';
     vlBuscaCon := ' WHERE ' + vlBuscaCred + coSqlPagoANSitCN ;
     vlBuscaInt := ' WHERE ' + vlBuscaCred + coSqlPagoANSitIN;
     vlBuscaFin := ' WHERE ' + vlBuscaCred + coSqlPagoANSitFN;
     vlBuscaCap := ' WHERE ' + vlBuscaCred + coSqlPagoANSitCP;
     //
     // Arma la sub sentencia SQL para obtener la información de los períodos
     vlSQLPer :=
               '        SELECT C.ID_CREDITO,'                    + coCRLF +
               '               C.F_VENCIMIENTO,'                 + coCRLF +
               '               C.F_VENCIMIENTO F_PROG_PAGO,'     + coCRLF +
               '               '' '' ID_DOCUMENTO,'              + coCRLF +
               '               0 IMP_NOMINAL,'                   + coCRLF +
               '               0 NUM_PERIODO_DOC,'               + coCRLF +
               '               ''RS'' TIPO_DETALLE,'             + coCRLF +
               '               SUM(IMP_CAPITAL)  IMP_CAPITAL,'   + coCRLF +
               '               SUM(IMP_FIN_ADIC) IMP_FIN_ADIC, ' + coCRLF +
               '               SUM(IMP_INTERES)  IMP_INTERES,'   + coCRLF +
               '               SUM(IMP_COMISION) IMP_COMISION,'  + coCRLF +
               '               SUM(IMP_MOR_CP) IMP_MOR_CP,'      + coCRLF +
               '               SUM(IMP_MOR_FN) IMP_MOR_FN,'      + coCRLF +
               '               SUM(IMP_MOR_IN) IMP_MOR_IN,'      + coCRLF +
               '               SUM(IMP_MOR_CN) IMP_MOR_CN'       + coCRLF +
               '        FROM   ( ' +
               '                 SELECT ID_CREDITO,  C.F_PROG_PAGO, C.NUM_PERIODO, '    + coCRLF +
               '                        C.F_VENCIMIENTO, '                              + coCRLF +
               '                        PKGCRPERIODO.ObtenImpCob( C.ID_CREDITO,    '    + coCRLF +
               '                          C.NUM_PERIODO, NULL, ''CP'') IMP_CAPITAL,'    + coCRLF +
               '                        0 IMP_FIN_ADIC, 0 IMP_INTERES, 0 IMP_COMISION,' + coCRLF +
               '                        IMP_MORATORIO - ( IMP_PAGADO_MORA + IMP_COND_MORA ) IMP_MOR_CP, ' + coCRLF +
               '                        0 IMP_MOR_FN,  0 IMP_MOR_IN, 0 IMP_MOR_CN   ' + coCRLF +
               '                 FROM   CR_CAPITAL C   '   + coCRLF +
                                 vlBuscaCap + coCRLF  +
               '                 UNION '    + coCRLF  +
               '                 SELECT FN.ID_CREDITO,  FN.F_PROG_PAGO, FN.NUM_PERIODO, ' + coCRLF  +
               '                        FN.F_VENCIMIENTO, '                               + coCRLF  +
               '                        0 IMP_CAPITAL, '                                  + coCRLF  +
               '                        PKGCRPERIODO.ObtenImpCob( FN.ID_CREDITO, '        + coCRLF  +
               '                        FN.NUM_PERIODO, NULL, ''FN'' ) IMP_FIN_ADIC, '    + coCRLF  +
               '                        0 IMP_INTERES,  0 IMP_COMISION, 0 IMP_MOR_CP,  '  + coCRLF +
               '                        IMP_MORATORIO - ( IMP_PAGADO_MORA + IMP_COND_MORA ) IMP_MOR_FN, ' + coCRLF +
               '                        0 IMP_MOR_IN, 0 IMP_MOR_CN   '   + coCRLF +
               '                 FROM   CR_FINAN_ADIC FN ' + coCRLF +
                                 vlBuscaFin                + coCRLF +
               '                 UNION '                   + coCRLF +
               '                 SELECT I.ID_CREDITO,  I.F_PROG_PAGO, I.NUM_PERIODO,' + coCRLF +
               '                        I.F_VENCIMIENTO, '                            + coCRLF +
               '                        0 IMP_CAPITAL, 0 IMP_FIN_ADIC, '              + coCRLF +
               '                        PKGCRPERIODO.ObtenImpCob( I.ID_CREDITO,  '    + coCRLF +
               '                          I.NUM_PERIODO, NULL, ''IN'' ) IMP_INTERES,' + coCRLF +
               '                        0 IMP_COMISION, 0 IMP_MOR_CP,  0 IMP_MOR_FN,' + coCRLF +
               '                        IMP_MORATORIO - ( IMP_PAGADO_MORA + IMP_COND_MORA ) IMP_MOR_IN, ' + coCRLF +
               '                        0 IMP_MOR_CN   ' + coCRLF +
               '                 FROM   CR_INTERES I   ' + coCRLF  +
                                 vlBuscaInt              + coCRLF  +
               '                 UNION '                 + coCRLF  +
               '                 SELECT CO.ID_CREDITO, CO.F_PROG_PAGO, CO.NUM_PERIODO, ' + coCRLF +
               '                        CO.F_VENCIMIENTO, '                              + coCRLF +
               '                        0 IMP_CAPITAL,  0 IMP_FIN_ADIC, 0 IMP_INTERES, ' + coCRLF +
               '                        SUM( PKGCRPERIODO.ObtenImpCob( CO.ID_CREDITO, CO.NUM_PERIODO, CO.CVE_COMISION, ''CN'' ) ) IMP_COMISION, ' + coCRLF  +
               '                        0 IMP_MOR_CP, 0 IMP_MOR_FN,  '   + coCRLF +
               '                        0 IMP_MOR_IN, ' + coCRLF +
               '                        SUM( IMP_MORATORIO - ( IMP_PAGADO_MORA + IMP_COND_MORA ) ) IMP_MOR_CN   '   + coCRLF +
               '                 FROM   CR_COMISION CO ' + coCRLF +
                                 vlBuscaCon              + coCRLF +
               '                 GROUP  BY CO.ID_CREDITO, CO.F_PROG_PAGO, CO.F_VENCIMIENTO, CO.NUM_PERIODO ' + coCRLF +
               '               ) CRE, '                                             + coCRLF +
               '               CR_CREDITO C '                                       + coCRLF +
               '        WHERE  CRE.ID_CREDITO  = C.ID_CREDITO '                     + coCRLF +
               '        GROUP BY C.ID_CREDITO,   C.F_VENCIMIENTO '
               ;
     //
     vlSelNumPer  :=
           '        0 NUM_PER_COM, '         + coCRLF +
           '        0 NUM_PER_INT, '         + coCRLF +
           '        0 NUM_PER_FIN, '         + coCRLF +
           '        0 NUM_PER_CAP, '
           ;
   end else begin

//ROIM 012009 DESC MERCANTIL, SE INCORPORA COBRANZA POR MONTO NOMINAL
//     vlSqlImpDep := 'NVL( PERIODO.IMP_NOMINAL + PERIODO.IMP_INTERES, NVL( NVL( GF.IMP_SOLICITAR, GFN.IMP_SOLICITAR ), 0 ) ) IMP_DEPOSITO,';
     vlSqlImpDep := '     DECODE(PR.CVE_CAL_CAPITAL,''VPN'', ' + coCRLF +
                    '            DECODE( LEAST(PERIODO.F_VENCIMIENTO, PERIODO.F_PROG_PAGO, ' + SQLFecha( Apli.DameFechaEmpresa )   + '),'   + coCRLF +
                    '                    PERIODO.F_VENCIMIENTO, NVL( PERIODO.IMP_NOMINAL, NVL( NVL( GF.IMP_SOLICITAR, GFN.IMP_SOLICITAR ), 0 ) ), ' + coCRLF +
                    '                    PERIODO.F_PROG_PAGO,   NVL( PERIODO.IMP_NOMINAL, NVL( NVL( GF.IMP_SOLICITAR, GFN.IMP_SOLICITAR ), 0 ) ), ' + coCRLF +
                                         SQLFecha( Apli.DameFechaEmpresa ) + ', NVL( PERIODO.IMP_CAPITAL, NVL( NVL( GF.IMP_SOLICITAR, GFN.IMP_SOLICITAR ), 0 ) ) ' + coCRLF +
                    '                      ) , ' + coCRLF +
                    '            NVL( PERIODO.IMP_NOMINAL + PERIODO.IMP_INTERES, NVL( NVL( GF.IMP_SOLICITAR, GFN.IMP_SOLICITAR ), 0 ) ) )' + coCRLF +
                    '            AS IMP_DEPOSITO,';
////ROIM
     
     // Arma la sub sentencia SQL para obtener la información de los períodos
     vlSQLPer :=
               '        SELECT ID_CREDITO,'        + coCRLF +
               '               F_VENCIMIENTO,'     + coCRLF +
               '               F_PROG_PAGO,'       + coCRLF +
               '               D.ID_DOCUMENTO,'    + coCRLF +
               '               D.IMP_NOMINAL,'     + coCRLF +
               '               D.NUM_PERIODO_DOC,' + coCRLF +
               '               ''DE'' TIPO_DETALLE,'             + coCRLF +               
               '               SUM(IMP_CAPITAL)  IMP_CAPITAL,'   + coCRLF +
               '               SUM(IMP_FIN_ADIC) IMP_FIN_ADIC, ' + coCRLF +
               '               SUM(IMP_INTERES)  IMP_INTERES,'   + coCRLF +
               '               SUM(IMP_COMISION) IMP_COMISION,'  + coCRLF +
               '               SUM(IMP_MOR_CP) IMP_MOR_CP,'      + coCRLF +
               '               SUM(IMP_MOR_FN) IMP_MOR_FN,'      + coCRLF +
               '               SUM(IMP_MOR_IN) IMP_MOR_IN,'      + coCRLF +
               '               SUM(IMP_MOR_CN) IMP_MOR_CN'      + coCRLF +
               '        FROM   ( ' +
               '                 SELECT ID_CREDITO,  C.F_PROG_PAGO, C.NUM_PERIODO, '    + coCRLF +
               '                        C.F_VENCIMIENTO, '                              + coCRLF +
               '                        PKGCRPERIODO.ObtenImpCob( C.ID_CREDITO,    '    + coCRLF +
               '                          C.NUM_PERIODO, NULL, ''CP'') IMP_CAPITAL,'    + coCRLF +
               '                        0 IMP_FIN_ADIC, 0 IMP_INTERES, 0 IMP_COMISION,' + coCRLF +
               '                        IMP_MORATORIO - ( IMP_PAGADO_MORA + IMP_COND_MORA ) IMP_MOR_CP, ' + coCRLF +
               '                        0 IMP_MOR_FN,  0 IMP_MOR_IN, 0 IMP_MOR_CN   ' + coCRLF +
               '                 FROM   CR_CAPITAL C   '   + coCRLF +
                                 vlBuscaCap + coCRLF  +
               '                 UNION '    + coCRLF  +
               '                 SELECT FN.ID_CREDITO,  FN.F_PROG_PAGO, FN.NUM_PERIODO, ' + coCRLF  +
               '                        FN.F_VENCIMIENTO, '                               + coCRLF  +
               '                        0 IMP_CAPITAL, '                                  + coCRLF  +
               '                        PKGCRPERIODO.ObtenImpCob( FN.ID_CREDITO, '        + coCRLF  +
               '                        FN.NUM_PERIODO, NULL, ''FN'' ) IMP_FIN_ADIC, '    + coCRLF  +
               '                        0 IMP_INTERES,  0 IMP_COMISION, 0 IMP_MOR_CP,  '  + coCRLF +
               '                        IMP_MORATORIO - ( IMP_PAGADO_MORA + IMP_COND_MORA ) IMP_MOR_FN, ' + coCRLF +
               '                        0 IMP_MOR_IN, 0 IMP_MOR_CN   '   + coCRLF +
               '                 FROM   CR_FINAN_ADIC FN ' + coCRLF +
                                 vlBuscaFin                + coCRLF +
               '                 UNION '                   + coCRLF +
               '                 SELECT I.ID_CREDITO,  I.F_PROG_PAGO, I.NUM_PERIODO,' + coCRLF +
               '                        I.F_VENCIMIENTO, '                            + coCRLF +
               '                        0 IMP_CAPITAL, 0 IMP_FIN_ADIC, '              + coCRLF +
               '                        PKGCRPERIODO.ObtenImpCob( I.ID_CREDITO,  '    + coCRLF +
               '                          I.NUM_PERIODO, NULL, ''IN'' ) IMP_INTERES,' + coCRLF +
               '                        0 IMP_COMISION, 0 IMP_MOR_CP,  0 IMP_MOR_FN,' + coCRLF +
               '                        IMP_MORATORIO - ( IMP_PAGADO_MORA + IMP_COND_MORA ) IMP_MOR_IN, ' + coCRLF +
               '                        0 IMP_MOR_CN   ' + coCRLF +
               '                 FROM   CR_INTERES I   ' + coCRLF  +
                                 vlBuscaInt              + coCRLF  +
               '                 UNION '                 + coCRLF  +
               '                 SELECT CO.ID_CREDITO, CO.F_PROG_PAGO, CO.NUM_PERIODO, ' + coCRLF +
               '                        CO.F_VENCIMIENTO, '                              + coCRLF +
               '                        0 IMP_CAPITAL,  0 IMP_FIN_ADIC, 0 IMP_INTERES, ' + coCRLF +
               '                        SUM( PKGCRPERIODO.ObtenImpCob( CO.ID_CREDITO, CO.NUM_PERIODO, CO.CVE_COMISION, ''CN'' ) ) IMP_COMISION, ' + coCRLF  +
               '                        0 IMP_MOR_CP, 0 IMP_MOR_FN,  '   + coCRLF +
               '                        0 IMP_MOR_IN, ' + coCRLF +
               '                        SUM( IMP_MORATORIO - ( IMP_PAGADO_MORA + IMP_COND_MORA ) ) IMP_MOR_CN   '   + coCRLF +
               '                 FROM   CR_COMISION CO ' + coCRLF +
                                 vlBuscaCon              + coCRLF +
               '                 GROUP  BY CO.ID_CREDITO, CO.F_PROG_PAGO, CO.F_VENCIMIENTO, CO.NUM_PERIODO ' + coCRLF +
               '               ) CRE, '                                             + coCRLF +
               '               CR_DOCUMENTO D '                                     + coCRLF +
               '        WHERE  CRE.ID_CREDITO  = D.ID_CESION(+) '                   + coCRLF +
               '          AND  CRE.NUM_PERIODO = D.NUM_PERIODO_DOC(+) '             + coCRLF +
               '        GROUP BY ID_CREDITO,     F_VENCIMIENTO,     F_PROG_PAGO, '  + coCRLF +
               '                 D.ID_DOCUMENTO, D.NUM_PERIODO_DOC, D.IMP_NOMINAL '
               ;

     //
     vlSelNumPer :=
           '        PKGCRCOBRANZA.STPOBNUMPERCN( PERIODO.ID_CREDITO,  PERIODO.F_VENCIMIENTO,  ' + coCRLF +
           '          PERIODO.F_PROG_PAGO, PERIODO.NUM_PERIODO_DOC ' + coCRLF +
           '        )   NUM_PER_COM, '         + coCRLF +
           '        INT.NUM_PER_INT, '         + coCRLF +
           '        PKGCRCOBRANZA.STPOBNUMPERFN( PERIODO.ID_CREDITO,  PERIODO.F_VENCIMIENTO, '  + coCRLF +
           '          PERIODO.F_PROG_PAGO, PERIODO.NUM_PERIODO_DOC'   + coCRLF +
           '        )   NUM_PER_FIN, '                              + coCRLF +
           '        CAP.NUM_PER_CAP, '
           ;
     vlSQLNumPer :=
           '       ( SELECT ID_CREDITO, F_VENCIMIENTO, NUM_PERIODO NUM_PER_CAP' + coCRLF +
           '         FROM   CR_CAPITAL '                                        + coCRLF +
           '       )CAP, '                                                      + coCRLF +
           '       ( SELECT ID_CREDITO, F_VENCIMIENTO, NUM_PERIODO NUM_PER_INT' + coCRLF +
           '         FROM   CR_INTERES '                                        + coCRLF +
           '       )INT, '
           ;
     vlBuscaNumPer :=
           '   AND CAP.ID_CREDITO   (+)= PERIODO.ID_CREDITO '       + coCRLF +
           '   AND CAP.F_VENCIMIENTO(+)= PERIODO.F_VENCIMIENTO '    + coCRLF +
           '   AND ( PERIODO.NUM_PERIODO_DOC IS NULL OR '           + coCRLF +
           '         PERIODO.NUM_PERIODO_DOC = CAP.NUM_PER_CAP ) '  + coCRLF +
           '   AND INT.ID_CREDITO   (+)= PERIODO.ID_CREDITO '       + coCRLF +
           '   AND INT.F_VENCIMIENTO(+)= PERIODO.F_VENCIMIENTO'     + coCRLF +
           '   AND ( PERIODO.NUM_PERIODO_DOC IS NULL OR '           + coCRLF +
           '         PERIODO.NUM_PERIODO_DOC = INT.NUM_PER_INT ) '
           ;
   end;
   // Arma la sentencia SQL.
   //LOLS 01-NOV-2006 CREDITO EN LINEA
   vlsql :=' SELECT * FROM ( SELECT CR.ID_CREDITO, '      + coCRLF +
   //vlsql :=' SELECT CR.ID_CREDITO, '      + coCRLF +
   //ENDS_LOLS
           '        CR.FOL_CONTRATO, '    + coCRLF +
           '        CR.ID_CRED_EXTERNO, ' + coCRLF +
           '        CR.ID_CONTROL_EXT, '  + coCRLF +
           '        CR.IMP_CREDITO, '     + coCRLF +
           '        CR.SDO_INSOLUTO, '    + coCRLF +
           '        CR.F_INICIO, '        + coCRLF +
           '        CR.F_VENCIMIENTO F_VENTTO_DISP, '   + coCRLF +
           '        CR.B_APLICA_IVA, '    + coCRLF +
           '        CR.FACT_MORAS, '      + coCRLF +
           '        A.ID_ACREDITADO, '    + coCRLF +
 //HERJA 11.04.2011 - MODIFICACION PARA QUE MUESTRE SI EL ACREDITADO SE ENCUENTRA EN RECUPERACION
	   '	    (SELECT  (CASE  WHEN COUNT(ID_ACREDITADO) = 0 THEN '' '' '    + coCRLF +
           '                      WHEN COUNT(ID_ACREDITADO) > 0 THEN ''R'' '    + coCRLF +
           '                ELSE '' ''  '    + coCRLF +
           '               END) AS Status  '    + coCRLF +
           '         FROM CR_ACRE_RE  '    + coCRLF +
           '        WHERE '+SQLFecha( Apli.DameFechaEmpresa ) +' >= F_ALTA_RECU '    + coCRLF +
//           '          AND ('+SQLFecha( Apli.DameFechaEmpresa ) +' <= F_BAJA_RECU OR F_BAJA_RECU IS NULL) '    + coCRLF +
           '          AND F_BAJA_RECU IS NULL '    + coCRLF +
           '          AND ID_ACREDITADO = A.ID_ACREDITADO '    + coCRLF +
	   '		     ) AS EN_RECUPERACION, '    + coCRLF +
 //FIN HERJA 11.04.2011
           '        CTTO.CVE_MONEDA, '    + coCRLF +
           '        CTTO.ID_CONTRATO, '   + coCRLF +
           '        MON.DESC_MONEDA, '    + coCRLF +
           '        SPF_NOMBRE_CTTE(CTTO.ID_CONTRATO,CTTO.ID_TITULAR) AS NOMBRE, '                      + coCRLF +
           '        PKGCRCOMUN.CTABCO_TO_CHQRA(PKGCRPERIODO.STPObtChqCte( A.ID_ACREDITADO, '            + coCRLF +
           '        NVL( CS.CVE_EMISOR_NAFIN, NVL( PROCAM.CVE_SUB_DIVISION, ''0''  ) ), CR.ID_CREDITO, '+ coCRLF + // '          NVL(CS.CVE_EMISOR_NAFIN, 0 ),
           '             DECODE( NVL( PROCAM.CVE_SUB_DIVISION, ''NULL'' ), ''NULL'', ''AC'', ''AP'' ),' + coCRLF + // '             ''AC'',
           '             ''AD'', ''CR'' ) ) AS CHEQUERA, '                                              + coCRLF +
           // SALDO DE LA CHEQUERA
           {
           '        PKGCRCOMUN.STPOBTENSDOCHQRA(PKGCRCOMUN.CTABCO_TO_CHQRA(PKGCRPERIODO.STPObtChqCte( A.ID_ACREDITADO, ' + coCRLF +
           '        NVL( CS.CVE_EMISOR_NAFIN, NVL( PROCAM.CVE_SUB_DIVISION, ''0''  ) ), CR.ID_CREDITO, '                 + coCRLF + //'          NVL(CS.CVE_EMISOR_NAFIN, 0 ),
           '             DECODE( NVL( PROCAM.CVE_SUB_DIVISION, ''NULL'' ), ''NULL'', ''AC'', ''AP'' ),' + coCRLF + // '             ''AC'',
           '             ''AD'', ''CR'' ) ) ) AS SALDO_CHEQ, '         + coCRLF +
           }
           '        PKGCRCOBRANZA.FUNOBTSDOCREDCHEQRA( CR.ID_CREDITO, PKGCRCOMUN.CTABCO_TO_CHQRA( '     + coCRLF +
           '          PKGCRPERIODO.STPObtChqCte( A.ID_ACREDITADO,  NVL( CS.CVE_EMISOR_NAFIN, '          + coCRLF +
           '          NVL( PROCAM.CVE_SUB_DIVISION, ''0''  ) ), CR.ID_CREDITO, '                        + coCRLF + //'          NVL(CS.CVE_EMISOR_NAFIN, 0 ),
           '             DECODE( NVL( PROCAM.CVE_SUB_DIVISION, ''NULL'' ), ''NULL'', ''AC'', ''AP'' ),' + coCRLF + // '             ''AC'',
           '             ''AD'', ''CR'' ) ) ) AS SALDO_CHEQ, '         + coCRLF +
           '        PERIODO.F_VENCIMIENTO,'    + coCRLF +
           '        PERIODO.F_PROG_PAGO,  '    + coCRLF +
           '        PERIODO.ID_DOCUMENTO, '    + coCRLF +
           '        PERIODO.NUM_PERIODO_DOC, ' + coCRLF +
           '        PERIODO.IMP_NOMINAL,  '    + coCRLF +
           '        PERIODO.IMP_CAPITAL,  '    + coCRLF +
           '        PERIODO.IMP_FIN_ADIC, '    + coCRLF +
           '        PERIODO.IMP_INTERES,  '    + coCRLF +
           '        PERIODO.IMP_COMISION, '    + coCRLF +
           '        PERIODO.IMP_COMISION + PERIODO.IMP_INTERES + '        + coCRLF +
           '        PERIODO.IMP_FIN_ADIC + PERIODO.IMP_CAPITAL TOTAL, '   + coCRLF +
           vlSqlImpDep + coCRLF + // '        NVL( PERIODO.IMP_NOMINAL + PERIODO.IMP_INTERES, NVL( GF.IMP_SOLICITAR, 0 ) ) IMP_DEPOSITO, '         + coCRLF +
           '        CS.CVE_TIPO_INTERES,  '    + coCRLF +
           '        PERIODO.TIPO_DETALLE, '    + coCRLF +
           vlSelNumPer + coCRLF +
           '        PERIODO.IMP_MOR_CP,  '     + coCRLF +
           '        PERIODO.IMP_MOR_FN,  '     + coCRLF +
           '        PERIODO.IMP_MOR_IN,  '     + coCRLF +
           '        PERIODO.IMP_MOR_CN,  '     + coCRLF +
           '        PR.CVE_PRODUCTO_CRE, '     + coCRLF +
           '        PR.DESC_C_PRODUCTO,'       + coCRLF +
           '        PR.B_COB_ORD_PER , '       + coCRLF +
           '        PR.B_COB_ORD_ACC, '        + coCRLF +
           '        PR.B_COB_TOT_PER, '        + coCRLF +
           '        PR.B_COB_PARCIAL, '        + coCRLF +
           '        CS.ID_EMISOR, '            + coCRLF +
           '        CS.CVE_EMISOR_NAFIN, '     + coCRLF +
           '        CS.ID_PROVEEDOR, '         + coCRLF +
           '        CS.B_OPERADO_NAFIN, '      + coCRLF +
           '        CS.ID_CESION,  '           + coCRLF +
           '        NVL( NVL( GF.B_APLICA_GF, GFN.B_APLICA_GF ), ''F'' ) B_APLICA_GF, ' + coCRLF +
           '        NVL( GFN.B_APLICA_GF, ''F'' ) B_APLICA_GP, '                        + coCRLF +
           //<LOLS 07 MAR 2006 COMISION POR PAGO ANTICIPADO>
           '        DECODE( COMPROG.CVE_COMISION_PGAN, NULL, ''F'', '                   + coCRLF +
           '                DECODE( LEAST(PERIODO.F_VENCIMIENTO, PERIODO.F_PROG_PAGO, ' +
                            SQLFecha( Apli.DameFechaEmpresa )   + '),'                  + coCRLF +
           '                        PERIODO.F_VENCIMIENTO, ''F'', '                     + coCRLF +
           '                        PERIODO.F_PROG_PAGO,   ''F'', '                     + coCRLF +
                            SQLFecha( Apli.DameFechaEmpresa ) + ', ''V'' '              + coCRLF +
           '                      ) '                                                   + coCRLF +
           '              ) B_PAGO_ANT, '                                               + coCRLF +
           '        COMPROG.CVE_COMISION_PGAN, '        + coCRLF +
           '        COMPROG.CVE_TIPO_APLICA_PGAN, '     + coCRLF +
           '        COMPROG.CVE_DIA_APLICA_PGAN, '      + coCRLF +
           '        COMPROG.PCT_COMISION_PGAN, '        + coCRLF +
           '        COMPROG.IMP_COMISION_PGAN, '        + coCRLF +
           '        COMPROG.CVE_IMP_CALC_COM_PROD, '    + coCRLF +
           '        COMPROG.B_MODIFICA_PCT_PROD, '      + coCRLF +
           '        COMPROG.B_MODIFICA_IMP_PROD, '      + coCRLF +
           '        COMPROG.B_PORCENTAJE_PROD, '        + coCRLF +
           '        COMPROG.PCT_COMISION_PROD, '        + coCRLF +
           //</LOLS>
           //<LOLS 15 ENE 2005. OBTIENE GARANTIA APLICADA PYME O FEGA>
           //'        PKGCRCOBRANZA.STPOBTBGARFEGA( CR.ID_CREDITO ) GAR_FEGA, '           + coCRLF +
           '        PKGCRCOBRANZA.STPOBTBGARFONDO(CR.ID_CREDITO ) GAR_FEGA, '                  + coCRLF +
           //</LOLS>
           //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
           '        CC.CVE_SUB_TIP_COB, '      + coCRLF +
           //</ENDS_LOLS>
           //<LOLS 02 AGO 2006. CREDITO EN LINEA VALIDA COMISIONES X ACRED. Y AUTORIZACIÓN >
           '        NVL( PKGCRCOMISIONES.FUNBCOMISACC( CR.ID_CREDITO ), ''F'' ) B_COMIS_ACC,'  + coCRLF +
           //</LOLS>
           '        PKGCRCOBRANZA.STPBOBTMULTICHEQUERA( CR.ID_CREDITO ) B_MULTI_CHQRA'         + coCRLF +
           ' FROM  CR_CREDITO CR, '            + coCRLF +
           '       CR_CONTRATO CC, '           + coCRLF +
           '       CONTRATO CTTO, '            + coCRLF +
           '       CR_ACREDITADO A, '          + coCRLF +
           '       PERSONA P, '                + coCRLF +
           '       CR_PRODUCTO PR, '           + coCRLF +
           '       MONEDA MON, '               + coCRLF +
           '       CR_CESION CS, '             + coCRLF +
           //'       CR_SRG_CESION CS, '             + coCRLF +
           '       CR_PROCAMPO PROCAM, '       + coCRLF +
           '( ' + vlSQLPer + ' ) PERIODO, '    + coCRLF +
           vlSQLRep                            + coCRLF +
           //
           vlSQLNumPer                         + coCRLF +
           '       ( SELECT CA.ID_CREDITO, '                                    + coCRLF +
           '                CA.F_VENCIMIENTO, '                                 + coCRLF +
           '                SUM( GSF.IMP_SOLICITAR - GSF.IMP_APLICADO ) IMP_SOLICITAR, ' + coCRLF +
           '                ''V'' B_APLICA_GF '                                 + coCRLF +
           '         FROM   CR_GA_SOL_FEGA GSF, CR_CAPITAL CA '                 + coCRLF +
           '         WHERE  GSF.SIT_GAR_SOL_FEG = ''AC'' '                      + coCRLF +
           '           AND   CA.ID_CREDITO  = GSF.ID_CREDITO '                  + coCRLF +
           '           AND   CA.NUM_PERIODO = GSF.NUM_PERIODO '                 + coCRLF +
           '         GROUP BY CA.ID_CREDITO, CA.F_VENCIMIENTO '                 + coCRLF +
           '       )GF,'                                                        + coCRLF +
           '       ( SELECT ID_CREDITO, '                                       + coCRLF +
           '                SUM( IMP_SOLICITAR - IMP_APLICADO ) IMP_SOLICITAR, '+ coCRLF +
           '                ''V'' B_APLICA_GF '                                 + coCRLF +
           '         FROM   CR_GA_SOL_NAFIN   '                                 + coCRLF +
           '         WHERE  SIT_GA_SOL_NAFIN = ''AC'' '                         + coCRLF +
           '         GROUP BY ID_CREDITO '                                      + coCRLF +
           '       )GFN, '                                                      + coCRLF +
           //<LOLS 08 MAR 2006. COMISION POR PAGO ANTICIPADO>
           '       ( '                                                          + coCRLF +
           '        SELECT CP.ID_CREDITO, '                                     + coCRLF +
           '               CP.CVE_COMISION       CVE_COMISION_PGAN, '           + coCRLF +
           '               CP.CVE_TIPO_APLICA    CVE_TIPO_APLICA_PGAN, '        + coCRLF +
           '               CP.CVE_DIA_APLICA     CVE_DIA_APLICA_PGAN, '         + coCRLF +
           '               CP.PCT_COMISION       PCT_COMISION_PGAN, '           + coCRLF +
           '               CP.IMP_COMISION       IMP_COMISION_PGAN, '           + coCRLF +
           '               CCOM.CVE_IMP_CALC_COM CVE_IMP_CALC_COM_PROD, '       + coCRLF +
           '               CCOM.B_MODIFICA_PCT   B_MODIFICA_PCT_PROD, '         + coCRLF +
           '               CCOM.B_MODIFICA_IMP   B_MODIFICA_IMP_PROD, '         + coCRLF +
           '               CCOM.B_PORCENTAJE     B_PORCENTAJE_PROD, '           + coCRLF +
           '               CCOM.PCT_COMISION     PCT_COMISION_PROD '            + coCRLF +
           '        FROM   CR_COMIS_PROG CP, '                                  + coCRLF +
           '               CR_CAT_COMISION CCOM '                               + coCRLF +
           '        WHERE  CCOM.CVE_COMISION   = PKGCRCOMUN.STPOBTCOMPAGAN( CP.ID_CREDITO ) ' + coCRLF +
           '          AND  CP.SIT_COMIS_PROG   = ''AC'' '                       + coCRLF +
           '          AND  CP.CVE_COMISION     = CCOM.CVE_COMISION '            + coCRLF +
           '       ) COMPROG '                                                  + coCRLF +
           //</LOLS>

           ' WHERE CR.ID_CREDITO       = PERIODO.ID_CREDITO '                   + coCRLF +

          //HERJA ABRIL 2013
          //SE PONEN FILTROS PARA NO TOMAR CREDITOS EN PROCESO DE REESTRUCTURA/RECUPERACION
           vlMuestraRSRE + coCRLF +
          //FIN HERJA ABRIL 2013

           '   AND CTTO.ID_EMPRESA     = ' + IntToStr(Apli.IdEmpresa)           + coCRLF +
            vlBuscaRep  + coCRLF +
            vlBusca     + coCRLF +
            FILTRO_OPERADO_NAFIN.AsString + coCRLF +
            FILTRO_TIPO_INTERES.AsString  + coCRLF +
           '   AND GF.ID_CREDITO   (+) = PERIODO.ID_CREDITO '       + coCRLF +
           '   AND GF.F_VENCIMIENTO(+) = PERIODO.F_VENCIMIENTO '    + coCRLF +
           '   AND GFN.ID_CREDITO  (+) = CR.ID_CREDITO '            + coCRLF +
           '   AND CC.ID_CONTRATO      = CR.ID_CONTRATO '           + coCRLF +
           '   AND CC.FOL_CONTRATO     = CR.FOL_CONTRATO '          + coCRLF +
           '   AND CTTO.ID_CONTRATO    = CC.ID_CONTRATO '           + coCRLF +
           '   AND A.ID_ACREDITADO     = CTTO.ID_TITULAR '          + coCRLF +
           '   AND P.ID_PERSONA        = CTTO.ID_TITULAR '          + coCRLF +
           '   AND MON.CVE_MONEDA      = CTTO.CVE_MONEDA '          + coCRLF +
           '   AND PR.CVE_PRODUCTO_CRE = CC.CVE_PRODUCTO_CRE '      + coCRLF +
           vlBuscaNumPer                                            + coCRLF +
           //
           '   AND CS.ID_CESION(+)      = CR.ID_CREDITO'            + coCRLF +
           '   AND PROCAM.ID_CREDITO(+) = CR.ID_CREDITO'            + coCRLF +
           //<LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
           '   AND COMPROG.ID_CREDITO(+) = CR.ID_CREDITO'           
           //</LOLS>
           ;
   //LOLS 01-NOV-2006 CREDITO EN LINEA
   vlsql  := vlSql + coCRLF + ' ) ';
   if bSaldoChqra then
     vlsql  := vlSql + coCRLF + ' WHERE SALDO_CHEQ > 0 ';
   //
   vlsql  := vlSql + coCRLF + 'ORDER BY ID_CREDITO, F_PROG_PAGO ';
   //vlsql  := vlSql + coCRLF + ' ORDER BY CR.ID_CREDITO, PERIODO.F_PROG_PAGO ';
   //ENDS LOLS
   Result := vlsql;
end;
// +---------------------------------------------------------------------------+
// +           Trae los datos del adeudo a la pantalla de la cobranza          +
// +---------------------------------------------------------------------------+
procedure TCrcobranz.StpObtAdeudo( peIdCredito  : Integer; peNumPeriodo: Integer;
                                   peCveComision: String;  pFCalculo : TDate;
                                   pFactor      : Double;  pBIVA     : String;
                                   pCveAccesorio: String;  var  vlTotal,  vlImporte,
                                   vlIVA,         vlBenBco,     vlBenGob, vlMoras,
                                   vlIVAMoras :   Double;  var  vlError : String );
var  STPObtAdeudo : TStoredProc;
Begin
  vlError := '';
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

      if (ParamByName('PSResultado').AsInteger = 0) then
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
        vlError := 'Problemas al obtener el adeudo: ' + coCRLF +
                   'Código : ' + ParamByName('psRESULTADO').AsString + coCRLF +
                   'Mensaje: ' + ParamByName('psTxResultado').AsString;
        MuestraError( vlError );
      end;
    end;
  finally
    STPObtAdeudo.Free;
  end;
end;
// +---------------------------------------------------------------------------+
// +                           Obtiene el remanente                            +
// +---------------------------------------------------------------------------+
procedure TCrcobranz.StpObtRemanente( pIdCesion   : Integer; pIdDocumento   : String;
                                      pFPago      : TDate;   pImpDepositado : Double;
                                      pFactMoras  : Double;  var psImpTotal : Double;
                                      var vlError : String);
var  STPObtRem : TStoredProc;
Begin
  STPObtRem := TStoredProc.Create(Nil);
  try
    with STPObtRem do
    begin
      DatabaseName:= Apli.DatabaseName;
      SessionName:= Apli.SessionName;
      StoredProcName:='PKGCRPERIODO.STPOBTENREMANENTE';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam(ftInteger, 'PEMETODO',        ptInput );
      Params.CreateParam(ftFloat,   'PEIMP_NOMINAL',   ptInput );
      Params.CreateParam(ftFloat,   'PETASA_AFORO',    ptInput );
      Params.CreateParam(ftInteger, 'PEIDCESION',      ptInput );
      Params.CreateParam(ftString,  'PEIDDOCUMENTO',   ptInput );
      Params.CreateParam(ftDate,    'PEFPAGO',         ptInput );
      Params.CreateParam(ftFloat,   'PEIMPDEPOSITADO', ptInput );
      Params.CreateParam(ftFloat,   'PEFACTORMORAS',   ptInput );
      Params.CreateParam(ftFloat,   'PSIMPREMANENTE',  ptOutput);
      Params.CreateParam(ftFloat,   'PSIMPREMINTERES', ptOutput);
      Params.CreateParam(ftFloat,   'PSRESULTADO',     ptOutput);
      Params.CreateParam(ftString,  'PSTXRESULTADO',   ptOutput);
      //
      ParamByName('PEMETODO').AsInteger    := StrToInt( CMETODO2 );
      ParamByName('PEIMP_NOMINAL').AsFloat := 0;
      ParamByName('PETASA_AFORO').AsFloat  := 0;
      ParamByName('PEIDCESION').AsInteger   := pIdCesion;
      ParamByName('PEIDDOCUMENTO').AsString := pIdDocumento;
      ParamByName('PEFPAGO').AsDate         := pFPago;
      ParamByName('PEIMPDEPOSITADO').AsFloat:= pImpDepositado;
      ParamByName('PEFACTORMORAS').AsFloat  := pFactMoras;
      ExecProc;
      if (ParamByName('PSRESULTADO').AsInteger = 0) then
      Begin
        psImpTotal := ParamByName('PSIMPREMANENTE').AsFloat +
                      ParamByName('PSIMPREMINTERES').AsFloat;
      end
      else
      Begin
        vlError := 'Problemas al obtener el remanente: ' + coCRLF +
                   'Código : ' + ParamByName('psRESULTADO').AsString + coCRLF +
                   'Mensaje: ' + ParamByName('psTxResultado').AsString;
        MuestraError( vlError );
      end;
    end;
  finally
    STPObtRem.Free;
  end;
end;
// +---------------------------------------------------------------------------+
// +           Obtiene el factor de moratorios a partir de un monto            +
// +---------------------------------------------------------------------------+
function TCrcobranz.StpObtFacMora(peIdCredito, peNumPeriodo: Integer; peBAplic     : String;
                                  peMonto : Double; peFPago: TDate; peCveAccesorio : String;
                                  var psFacMoras: Double):Boolean;
var  STPObtFacMora : TStoredProc;
Begin
  Result := False;
  STPObtFacMora := TStoredProc.Create(Nil);
  try
    with STPObtFacMora do
    begin
      DatabaseName:= Apli.DatabaseName;
      SessionName:= Apli.SessionName;
      StoredProcName := 'PKGCRINET.STPOBTFACMORA';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam( ftInteger, 'PEIDCREDITO',    ptInput  );
      Params.CreateParam( ftInteger, 'PENUMPERIODO',   ptInput  );
      Params.CreateParam( ftString,  'PECVECOMISION',  ptInput  );
      Params.CreateParam( ftString,  'PEBIVA',         ptInput  );
      Params.CreateParam( ftDate,    'PEFPAGO',        ptInput  );
      Params.CreateParam( ftFloat,   'PEIMPMORA',      ptInput  );
      Params.CreateParam( ftString,  'PECVEACCESORIO', ptInput  );
      Params.CreateParam( ftFloat,   'PSIMPMORA',      ptOutput );
      Params.CreateParam( ftFloat,   'PSFACMORA',      ptOutput );
      Params.CreateParam( ftInteger, 'PSRESULTADO',    ptOutput );
      Params.CreateParam( ftString,  'PSTXRESULTADO',  ptOutput );
      //
      ParamByName('PEIDCREDITO').AsInteger   := peIdCredito;
      ParamByName('PENUMPERIODO').AsInteger  := peNumPeriodo;
      ParamByName('PECVECOMISION').AsString  := '';
      ParamByName('PEBIVA').AsString         := peBAplic;
      ParamByName('PEIMPMORA').AsFloat       := peMonto;
      ParamByName('PEFPAGO').AsDate          := peFPago;
      if peCveAccesorio = coTodos then
        peCveAccesorio := coCapital;
      //ends_if
      ParamByName('PECVEACCESORIO').AsString := peCveAccesorio;
      //
      ExecProc;
      if ( ParamByName('PSRESULTADO').AsInteger = 0 ) then
      begin
        psFacMoras := ParamByName('PSFACMORA').AsFloat;
        Result := True;
      end else
      begin
        MuestraError( 'Error al obtener el factor de moras: ' + coCRLF +
                      'Código : ' + ParamByName('PSRESULTADO').AsString + coCRLF +
                      'Mensaje: ' + ParamByName('PSTXRESULTADO').AsString );
      end;
    end;
  finally
    STPObtFacMora.Free;
  end;
end;
// +---------------------------------------------------------------------------+
// +           Limpia la tabla temporal de la cobranza de creditos             +
// +---------------------------------------------------------------------------+
procedure TCrcobranz.LimpiaTablaCob( var  vlError : String );
var  STPLimpTabCob  : TStoredProc;
Begin
  vlError := '';
  STPLimpTabCob := TStoredProc.Create(Nil);
  try
    with STPLimpTabCob do
    begin
      DatabaseName:= Apli.DatabaseName;
      SessionName:= Apli.SessionName;
      StoredProcName:= coPaquete + '.' + 'STPLIMPIATABLACOB';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
      Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
      //
      ExecProc;
      if (ParamByName('PSResultado').AsInteger <> 0) then
      begin
        vlError := 'Problemas al limpiar tabla de cobranza: '          + coCRLF +
                   'Código : ' + ParamByName('psResultado').AsString   + coCRLF +
                   'Mensaje: ' + ParamByName('psTxResultado').AsString;
      end;
    end;
  finally
    STPLimpTabCob.Free;
  end;
end;
// +---------------------------------------------------------------------------+
// + Este procedimiento sirve para agregar al cursor todos los elementos de la +
// +                     pantalla con su respectiva informacion                +
// +---------------------------------------------------------------------------+
procedure TCrcobranz.StpAgregaElemento(     pidCredito      : Integer;  pFVentto        : TDate;
                  pFProgPago     : TDate;   pFValor         : TDate;    pdocto          : String;
                  pNumPerDoc     : Integer; pImpdeposito    : Double;   pbComis         : String;
                  pbInteres      : String;  pbFinAdic       : String;   pbCapital       : String;
                  pImpPagoCon    : Double;  pImpPagoInt     : Double;   pImpPagoFin     : Double;
                  pImpPagoCap    : Double;  pfact_moras_cn  : Double;   pfact_moras_in  : Double;
                  pfact_moras_fn : Double;  pfact_moras_cp  : Double;   pb_iva_mora_cn  : String;
                  pb_iva_mora_in : String;  pb_iva_mora_fn  : String;   pb_iva_mora_cp  : String;
                  pb_cond_mora_cn: String;  pb_cond_mora_in : String;   pb_cond_mora_fn : String;
                  pb_cond_mora_cp: String;  pb_garantia_fega: String;   pbCobOrdPer     : String;
                  pbCobOrdAcc    : String;  pbCobTotPer     : String;   pbCobParcial    : String;
                  pbCondAut      : String;  ptipodet        : String;   ptipo_cob       : String;
                  psubtipcob     : String;  b_transfiere    : String;   pb_com_pago_an  : String;
                  pb_pct_comision: String;  ppct_com_pago_an: Double;   pimp_com_pago_an: Double;
                  var  vlError    : String);
var  STPAddElemento : TStoredProc;
Begin
   STPAddElemento := TStoredProc.Create(Nil);
   vlError := '';
   try
      with STPAddElemento do
      begin
        DatabaseName:= Apli.DatabaseName;
        SessionName:= Apli.SessionName;
        StoredProcName:= coPaquete + '.' + 'STPAGREGAELEMENTO'; //    coPaquete     = 'PKGCRCOBRANZA';
        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftInteger, 'id_credito',    ptInput );
        Params.CreateParam(ftDate,    'f_vencimiento', ptInput );
        Params.CreateParam(ftDate,    'f_prog_pago',   ptInput );
        Params.CreateParam(ftDate,    'f_valor_pago',  ptInput );
        Params.CreateParam(ftString,  'id_documento',  ptInput );
        Params.CreateParam(ftInteger, 'num_per_doc',   ptInput );
        Params.CreateParam(ftFloat,   'imp_deposito',  ptInput );
        // BANDERA PARA SABER SI LO COBRA O NO LO COBRA
        Params.CreateParam(ftString,  'b_comision',    ptInput );
        Params.CreateParam(ftString,  'b_interes',     ptInput );
        Params.CreateParam(ftString,  'b_fin_adic',    ptInput );
        Params.CreateParam(ftString,  'b_capital',     ptInput );
        // IMPORTE QUE DESEA CUBRIR EL CLIENTE(PARCIALIDAD).
        Params.CreateParam(ftFloat,   'imp_pago_con',  ptInput);
        Params.CreateParam(ftFloat,   'imp_pago_int',  ptInput);
        Params.CreateParam(ftFloat,   'imp_pago_fin',  ptInput);
        Params.CreateParam(ftFloat,   'imp_pago_cap',  ptInput);
        //
        // FACTOR DE MORATORIOS X CADA UNO DE LOS CONCEPTOS
        Params.CreateParam(ftFloat,   'fact_moras_cn', ptInput );
        Params.CreateParam(ftFloat,   'fact_moras_in', ptInput );
        Params.CreateParam(ftFloat,   'fact_moras_fn', ptInput );
        Params.CreateParam(ftFloat,   'fact_moras_cp', ptInput );
        // APLICA IVA DE MORATORIOS ?
        Params.CreateParam(ftString,  'b_iva_mora_cn',  ptInput );
        Params.CreateParam(ftString,  'b_iva_mora_in',  ptInput );
        Params.CreateParam(ftString,  'b_iva_mora_fn',  ptInput );
        Params.CreateParam(ftString,  'b_iva_mora_cp',  ptInput );
        // BANDERAS DE CONDONACION DE MORATORIOS
        Params.CreateParam(ftString,  'b_cond_mora_cn', ptInput );
        Params.CreateParam(ftString,  'b_cond_mora_in', ptInput );
        Params.CreateParam(ftString,  'b_cond_mora_fn', ptInput );
        Params.CreateParam(ftString,  'b_cond_mora_cp', ptInput );
        // APLICA GARANTIA FEGA
        Params.CreateParam(ftString,  'b_garantia_fega',ptInput );
        //BANDERAS DEL PRODUCTO POR DISPOSICION
        Params.CreateParam(ftString,  'b_cob_ord_per',  ptInput );
        Params.CreateParam(ftString,  'b_cob_ord_acc',  ptInput );
        Params.CreateParam(ftString,  'b_cob_tot_per',  ptInput );
        Params.CreateParam(ftString,  'b_cob_parcial',  ptInput );
        //BANDERAS DE CONDONACION DE MORATORIOS
        Params.CreateParam(ftString,  'b_cond_auto',    ptInput );
        //CHEQUERA DE CARGO
        Params.CreateParam(ftFloat,   'id_cto_liq',    ptInput );
        //PARAMETROS COBRANZA ANTICIPADA
        Params.CreateParam(ftString,  'tipo_detalle',  ptInput );
        Params.CreateParam(ftString,  'tipo_cob',      ptInput );
        Params.CreateParam(ftString,  'sub_tipo_cob',  ptInput );
        Params.CreateParam(ftString,  'b_transfiere',  ptInput );
        //PARAMETROS COMISION POR PAGO ANTICIPADO
        Params.CreateParam(ftString,  'b_com_pago_an',    ptInput );
        Params.CreateParam(ftString,  'b_pct_comision',   ptInput );
        Params.CreateParam(ftFloat,   'pct_com_pago_an',  ptInput );
        Params.CreateParam(ftFloat,   'imp_com_pago_an',  ptInput );
        //VARIABLES DE SALIDA                             
        Params.CreateParam(ftFloat,   'psResultado',    ptOutput );
        Params.CreateParam(ftString,  'psTxResultado',  ptOutput );
        //
        ParamByName('id_credito').AsInteger  := pidCredito;
        ParamByName('f_vencimiento').AsDate  := pFVentto;
        ParamByName('f_prog_pago').AsDate    := pFProgPago;
        ParamByName('f_valor_pago').AsDate   := pFValor;
        ParamByName('id_documento').AsString := pdocto;
        ParamByName('num_per_doc').AsInteger := pnumPerDoc;
        ParamByName('imp_deposito').AsFloat  := pImpdeposito;
        ParamByName('b_comision').AsString   := pbComis;
        ParamByName('b_interes').AsString    := pbInteres;
        ParamByName('b_fin_adic').AsString   := pbFinAdic;
        ParamByName('b_capital').AsString    := pbCapital;
        ParamByName('imp_pago_con').AsFloat  := pImpPagoCon;
        ParamByName('imp_pago_int').AsFloat  := pImpPagoInt;
        ParamByName('imp_pago_fin').AsFloat  := pImpPagoFin;
        ParamByName('imp_pago_cap').AsFloat  := pImpPagoCap;
        ParamByName('fact_moras_cn').AsFloat := pfact_moras_cn;
        ParamByName('fact_moras_in').AsFloat := pfact_moras_in;
        ParamByName('fact_moras_fn').AsFloat := pfact_moras_fn;
        ParamByName('fact_moras_cp').AsFloat := pfact_moras_cp;
        ParamByName('b_iva_mora_cn').AsString  := pb_iva_mora_cn;
        ParamByName('b_iva_mora_in').AsString  := pb_iva_mora_in;
        ParamByName('b_iva_mora_fn').AsString  := pb_iva_mora_fn;
        ParamByName('b_iva_mora_cp').AsString  := pb_iva_mora_cp;
        ParamByName('b_cond_mora_cn').AsString := pb_cond_mora_cn;
        ParamByName('b_cond_mora_in').AsString := pb_cond_mora_in;
        ParamByName('b_cond_mora_fn').AsString := pb_cond_mora_fn;
        ParamByName('b_cond_mora_cp').AsString := pb_cond_mora_cp;
        ParamByName('b_garantia_fega').AsString:= pb_garantia_fega;
        ParamByName('b_cob_ord_per').AsString  := pbCobOrdPer;
        ParamByName('b_cob_ord_acc').AsString  := pbCobOrdAcc;
        ParamByName('b_cob_tot_per').AsString  := pbCobTotPer;
        ParamByName('b_cob_parcial').AsString  := pbCobParcial;
        ParamByName('b_cond_auto').AsString    := pbCondAut;
        ParamByName('id_cto_liq').Clear;
        ParamByName('tipo_detalle').AsString   := ptipodet;
        ParamByName('tipo_cob').AsString       := ptipo_cob;
        ParamByName('sub_tipo_cob').AsString   := psubtipcob;
        ParamByName('b_transfiere').AsString   := b_transfiere;
        //
        ParamByName('b_com_pago_an').AsString  := pb_com_pago_an;
        ParamByName('b_pct_comision').AsString := pb_pct_comision;
        ParamByName('pct_com_pago_an').AsFloat := ppct_com_pago_an;
        ParamByName('imp_com_pago_an').AsFloat := pimp_com_pago_an;
        ExecProc;
        if ( ParamByName('psResultado').AsInteger <> 0 ) then
        begin
           vlError := 'Problemas al agregar datos : '                      + coCRLF +
                      'Código : ' + ParamByName('psRESULTADO').AsString    + coCRLF +
                      'Mensaje: ' + ParamByName('psTxResultado').AsString;
        end;
      end;
   finally
     STPAddElemento.Free;
   end;
end;
// +---------------------------------------------------------------------------+
// +             Asigan el importe de garantía PYME x periodo                  +
// +---------------------------------------------------------------------------+
procedure TCrcobranz.StpObtImpGPYME(
                  pidCredito     : Integer; pFVentto        : TDate;    pFProgPago      : TDate;
                  pFValor        : TDate;   pdocto          : String;   pNumPerDoc      : Integer;
                  pImpdeposito   : Double;  pbComis         : String;   pbInteres      : String;
                  pbFinAdic      : String;  pbCapital       : String;   pfact_moras_cn : Double;
                  pfact_moras_in : Double;  pfact_moras_fn  : Double;   pfact_moras_cp  : Double;
                  pb_iva_mora_cn : String;  pb_iva_mora_in  : String;   pb_iva_mora_fn  : String;
                  pb_iva_mora_cp : String;
                  var pImpPagoCon: Double;  var pImpPagoInt : Double;   var pImpPagoFin : Double;
                  var pImpPagoCap: Double;  var  vlError    : String);
var  STPAsgGtiaPYME : TStoredProc;
   ListParam : TStringList;
Begin
   //
   ListParam := TStringList.Create;
   ListParam.Clear;


   pImpPagoCon := 0;   pImpPagoInt := 0;
   pImpPagoFin := 0;   pImpPagoCap := 0;
   //
   vlError := '';
   STPAsgGtiaPYME := TStoredProc.Create(Nil);
   try
      with STPAsgGtiaPYME do
      begin
        DatabaseName:= Apli.DatabaseName;
        SessionName:= Apli.SessionName;
        StoredProcName:= 'PKGCRCREDITOO1.STPASIGNAGPYME';
        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftInteger, 'id_credito',    ptInput );
        Params.CreateParam(ftDate,    'f_vencimiento', ptInput );
        Params.CreateParam(ftDate,    'f_prog_pago',   ptInput );
        Params.CreateParam(ftDate,    'f_valor_pago',  ptInput );
        Params.CreateParam(ftString,  'id_documento',  ptInput );
        Params.CreateParam(ftInteger, 'num_per_doc',   ptInput );
        Params.CreateParam(ftFloat,   'imp_deposito',  ptInput );
        // BANDERA PARA SABER SI LO COBRA O NO LO COBRA
        Params.CreateParam(ftString,  'b_comision',    ptInput );
        Params.CreateParam(ftString,  'b_interes',     ptInput );
        Params.CreateParam(ftString,  'b_fin_adic',    ptInput );
        Params.CreateParam(ftString,  'b_capital',     ptInput );
        // FACTOR DE MORATORIOS X CADA UNO DE LOS CONCEPTOS
        Params.CreateParam(ftFloat,   'fact_moras_cn', ptInput );
        Params.CreateParam(ftFloat,   'fact_moras_in', ptInput );
        Params.CreateParam(ftFloat,   'fact_moras_fn', ptInput );
        Params.CreateParam(ftFloat,   'fact_moras_cp', ptInput );
        // APLICA IVA DE MORATORIOS ?
        Params.CreateParam(ftString,  'b_iva_mora_cn',  ptInput );
        Params.CreateParam(ftString,  'b_iva_mora_in',  ptInput );
        Params.CreateParam(ftString,  'b_iva_mora_fn',  ptInput );
        Params.CreateParam(ftString,  'b_iva_mora_cp',  ptInput );
        //
        Params.CreateParam(ftString,  'peBCommit',      ptInput );
        //VARIABLES DE SALIDA
        Params.CreateParam(ftFloat,   'psimp_pago_con', ptOutput );
        Params.CreateParam(ftFloat,   'psimp_pago_int', ptOutput );
        Params.CreateParam(ftFloat,   'psimp_pago_fin', ptOutput );
        Params.CreateParam(ftFloat,   'psimp_pago_cap', ptOutput );
        //
        Params.CreateParam(ftFloat,   'psResultado',    ptOutput );
        Params.CreateParam(ftString,  'psTxResultado',  ptOutput );
        //
        ParamByName('id_credito').AsInteger    := pidCredito;
        ParamByName('f_vencimiento').AsDate    := pFVentto;
        ParamByName('f_prog_pago').AsDate      := pFProgPago;
        ParamByName('f_valor_pago').AsDate     := pFValor;
        ParamByName('id_documento').AsString   := pdocto;
        ParamByName('num_per_doc').Clear;
        if pnumPerDoc > 0 then
          ParamByName('num_per_doc').AsInteger := pnumPerDoc;
        ParamByName('imp_deposito').AsFloat    := pImpdeposito;
        ParamByName('b_comision').AsString     := pbComis;
        ParamByName('b_interes').AsString      := pbInteres;
        ParamByName('b_fin_adic').AsString     := pbFinAdic;
        ParamByName('b_capital').AsString      := pbCapital;
        ParamByName('fact_moras_cn').AsFloat   := pfact_moras_cn;
        ParamByName('fact_moras_in').AsFloat   := pfact_moras_in;
        ParamByName('fact_moras_fn').AsFloat   := pfact_moras_fn;
        ParamByName('fact_moras_cp').AsFloat   := pfact_moras_cp;
        ParamByName('b_iva_mora_cn').AsString  := pb_iva_mora_cn;
        ParamByName('b_iva_mora_in').AsString  := pb_iva_mora_in;
        ParamByName('b_iva_mora_fn').AsString  := pb_iva_mora_fn;
        ParamByName('b_iva_mora_cp').AsString  := pb_iva_mora_cp;
        ParamByName('peBCommit').AsString      := 'V';

        ListParam.Add('id_credito    : ' + IntToStr(pidCredito));
        ListParam.Add('f_vencimiento : ' + DateToStr(pFVentto));
        ListParam.Add('f_prog_pago   : ' + DateToStr(pFProgPago));
        ListParam.Add('f_valor_pago  : ' + DateToStr(pFValor));
        ListParam.Add('id_documento  : ' + pdocto);
        ListParam.Add('num_per_doc   : ' + IntToStr(pnumPerDoc));
        ListParam.Add('imp_deposito  : ' + FloatToStr(pImpdeposito));
        ListParam.Add('b_comision    : ' + pbComis);
        ListParam.Add('b_interes     : ' + pbInteres);
        ListParam.Add('b_fin_adic    : ' + pbFinAdic);
        ListParam.Add('b_capital     : ' + pbCapital);
        ListParam.Add('fact_moras_cn : ' + FloatToStr(pfact_moras_cn));
        ListParam.Add('fact_moras_in : ' + FloatToStr(pfact_moras_in));
        ListParam.Add('fact_moras_fn : ' + FloatToStr(pfact_moras_fn));
        ListParam.Add('fact_moras_cp : ' + FloatToStr(pfact_moras_cp));
        ListParam.Add('b_iva_mora_cn : ' + pb_iva_mora_cn);
        ListParam.Add('b_iva_mora_in : ' + pb_iva_mora_in);
        ListParam.Add('b_iva_mora_fn : ' + pb_iva_mora_fn);
        ListParam.Add('b_iva_mora_cp : ' + pb_iva_mora_cp);
        ListParam.Add('peBCommit     : ' + 'V');
        //ListParam.SaveToFile('c:\Parametros' + FormatDateTime( 'hhnnss', now )  + '.txt');
        ListParam.Free;

        ExecProc;
        if ( ParamByName('psResultado').AsInteger <> 0 ) then
        begin
           vlError := 'Problemas al agregar datos : '                      + coCRLF +
                      'Código : ' + ParamByName('psRESULTADO').AsString    + coCRLF +
                      'Mensaje: ' + ParamByName('psTxResultado').AsString;
        end else begin
          pImpPagoCon := ParamByName('psimp_pago_con').AsFloat;
          pImpPagoInt := ParamByName('psimp_pago_int').AsFloat;
          pImpPagoFin := ParamByName('psimp_pago_fin').AsFloat;
          pImpPagoCap := ParamByName('psimp_pago_cap').AsFloat;
        end;
      end;
   finally
     STPAsgGtiaPYME.Free;
   end;
end;
// +---------------------------------------------------------------------------+
// +  Este procedimiento asigna de manera automática los montos de la cobranza +
// +---------------------------------------------------------------------------+
procedure TCrcobranz.StpAsignaCob( IdCredito : Integer; ImpPago: Double; var  vlError : String);
var  stpAsignaCob : TStoredProc;
Begin
   vlError := '';
   stpAsignaCob := TStoredProc.Create(Nil);
   try
      with stpAsignaCob do
      begin
        DatabaseName   := Apli.DatabaseName;
        SessionName    := Apli.SessionName;
        StoredProcName := 'PKGCRINET.STPASIGNACOBPER';
        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftFloat,  'peIdCredito',   ptInput);
        Params.CreateParam(ftFloat,  'peImpPago',     ptInput);
        Params.CreateParam(ftString, 'peBCommit',     ptInput);
        Params.CreateParam(ftFloat,  'psResultado',   ptOutput);
        Params.CreateParam(ftString, 'psTxResultado', ptOutput);
        //
        ParamByName('peIdCredito').AsInteger := IdCredito;
        ParamByName('peImpPago').AsFloat     := ImpPago;
        ParamByName('peBCommit').AsString    := cVerdad;
        ExecProc;
        if (ParamByName('PSResultado').AsInteger <> 0 ) then
        Begin
           vlError := 'Problemas en la asignación de montos: '          + coCRLF +
                      'Código : ' + ParamByName('psRESULTADO').AsString + coCRLF +
                      'Mensaje: ' + ParamByName('psTxResultado').AsString;
        end;
      end;
   finally
     stpAsignaCob.Free;
   end;
end;
// +---------------------------------------------------------------------------+
// +  Este procedimiento lee el monto de pago correspondiente a un periodo     +
// +---------------------------------------------------------------------------+
procedure TCrcobranz.StpObtImpCob( IdCredito    : Integer; f_vencimiento : TDate;
                                   f_prog_pago  : TDate;   id_documento : string;
                                   var imp_pago_con : Double; var imp_pago_int : Double;
                                   var imp_pago_fin : Double; var imp_pago_cap : Double;
                                   var imp_mora_con : Double; var imp_mora_int : Double;
                                   var imp_mora_fin : Double; var imp_mora_cap : Double;
                                   var fac_mora_con : Double; var fac_mora_int : Double;
                                   var fac_mora_fin : Double; var fac_mora_cap : Double;
                                   var imp_pago_tot : Double; var vlError : String );
var  stpObtImp : TStoredProc;
Begin
   vlError := '';
   imp_pago_con := 0;    imp_pago_int := 0;    imp_pago_fin := 0;
   imp_pago_cap := 0;    imp_mora_con := 0;    imp_mora_int := 0;
   imp_mora_fin := 0;    imp_mora_cap := 0;    imp_pago_tot := 0;
   stpObtImp := TStoredProc.Create(Nil);
   try
      with stpObtImp do
      begin
        DatabaseName   := Apli.DatabaseName;
        SessionName    := Apli.SessionName;
        StoredProcName := 'PKGCRINET.STPOBTENIMPORTE';
        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftFloat,  'id_credito',     ptInput  );
        Params.CreateParam(ftDate,   'f_vencimiento',  ptInput  );
        Params.CreateParam(ftDate,   'f_prog_pago',    ptInput  );
        Params.CreateParam(ftString, 'id_documento',   ptInput  );
        Params.CreateParam(ftString, 'b_comision',     ptOutput );
        Params.CreateParam(ftString, 'b_interes',      ptOutput );
        Params.CreateParam(ftString, 'b_fin_adic',     ptOutput );
        Params.CreateParam(ftString, 'b_capital',      ptOutput );
        Params.CreateParam(ftFloat,  'imp_pago_con',   ptOutput );
        Params.CreateParam(ftFloat,  'imp_pago_int',   ptOutput );
        Params.CreateParam(ftFloat,  'imp_pago_fin',   ptOutput );
        Params.CreateParam(ftFloat,  'imp_pago_cap',   ptOutput );
        Params.CreateParam(ftFloat,  'imp_mora_con',   ptOutput );
        Params.CreateParam(ftFloat,  'imp_mora_int',   ptOutput );
        Params.CreateParam(ftFloat,  'imp_mora_fin',   ptOutput );
        Params.CreateParam(ftFloat,  'imp_mora_cap',   ptOutput );
        //        
        Params.CreateParam(ftFloat,  'fac_mora_con',   ptOutput );
        Params.CreateParam(ftFloat,  'fac_mora_int',   ptOutput );
        Params.CreateParam(ftFloat,  'fac_mora_fin',   ptOutput );
        Params.CreateParam(ftFloat,  'fac_mora_cap',   ptOutput );
        //
        Params.CreateParam(ftFloat,  'imp_pago_tot',   ptOutput );
        Params.CreateParam(ftFloat,  'psResultado',    ptOutput );
        Params.CreateParam(ftString, 'psTxResultado',  ptOutput );
        //
        ParamByName('id_credito'    ).AsInteger := IdCredito;
        ParamByName('f_vencimiento' ).AsDate    := f_vencimiento;
        ParamByName('f_prog_pago'   ).AsDate    := f_prog_pago;
        ParamByName('id_documento'  ).AsString  := id_documento;
        ExecProc;
        if (ParamByName('PSResultado').AsInteger = 0 ) then
        begin
           imp_pago_con := ParamByName('imp_pago_con').AsFloat;
           imp_pago_int := ParamByName('imp_pago_int').AsFloat;
           imp_pago_fin := ParamByName('imp_pago_fin').AsFloat;
           imp_pago_cap := ParamByName('imp_pago_cap').AsFloat;
           imp_mora_con := ParamByName('imp_mora_con').AsFloat;
           imp_mora_int := ParamByName('imp_mora_int').AsFloat;
           imp_mora_fin := ParamByName('imp_mora_fin').AsFloat;
           imp_mora_cap := ParamByName('imp_mora_cap').AsFloat;
           imp_pago_tot := ParamByName('imp_pago_tot').AsFloat;
           if not ParamByName('fac_mora_con').IsNull then fac_mora_con := ParamByName('fac_mora_con').AsFloat;
           if not ParamByName('fac_mora_int').IsNull then fac_mora_int := ParamByName('fac_mora_int').AsFloat;
           if not ParamByName('fac_mora_fin').IsNull then fac_mora_fin := ParamByName('fac_mora_fin').AsFloat;
           if not ParamByName('fac_mora_cap').IsNull then fac_mora_cap := ParamByName('fac_mora_cap').AsFloat;
        end else
        Begin
           vlError := 'Problemas al obtener el monto de pago: '          + coCRLF +
                      'Código : ' + ParamByName('psRESULTADO').AsString + coCRLF +
                      'Mensaje: ' + ParamByName('psTxResultado').AsString;
        end;
      end;
   finally
     stpObtImp.Free;
   end;
end;
// +---------------------------------------------------------------------------+
// +             Este procedimiento hace el llamado a la cobranza              +
// +---------------------------------------------------------------------------+
procedure TCrcobranz.StpCobranza(var  vlError : String);
var  STPCobranza  : TStoredProc;
Begin
   vlError := '';
   STPCobranza := TStoredProc.Create(Nil);
   try
      with STPCobranza do
      begin
        DatabaseName   := Apli.DatabaseName;
        SessionName    := Apli.SessionName;
        StoredProcName := coPaquete + '.' + 'STPCOBRANZA'; // coPaquete  = 'PKGCRCOBRANZA';
        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftString, 'peCveUsuario',   ptInput);
        Params.CreateParam(ftString, 'peCveMedio',     ptInput);
        Params.CreateParam(ftFloat,  'peGpoCobranza',  ptInput);
        Params.CreateParam(ftString, 'peBCommit',      ptInput);

        Params.CreateParam(ftFloat,  'PSRESULTADO',    ptOutput);
        Params.CreateParam(ftString, 'PSTXRESULTADO',  ptOutput);
        //
        ParamByName('peCveUsuario').AsString := Apli.Usuario;
        ParamByName('peCveMedio').AsString   := 'COBRAN';
        ParamByName('peBCommit').AsString    := cVerdad;
        ExecProc;
        if (ParamByName('PSResultado').AsInteger <> 0 ) then
        Begin
           vlError := 'Problemas en la cobranza: '                      + coCRLF +
                      'Código : ' + ParamByName('psRESULTADO').AsString + coCRLF +
                      'Mensaje: ' + ParamByName('psTxResultado').AsString;
        end;
      end;
   finally
     STPCobranza.Free;
   end;
end;
// +---------------------------------------------------------------------------+
// +           Procedimiento que obtiene el numero de registros del log        +
// +---------------------------------------------------------------------------+
function TCrcobranz.StpObtCntLog: Integer;
var spObtCntlog : TStoredProc;
begin
  spObtCntlog := TStoredProc.Create(Nil);
  try
    with spObtCntlog do
    begin
      DatabaseName:= Apli.DatabaseName;
      SessionName:= Apli.SessionName;
      StoredProcName:=coPaquete + '.' + 'STPOBTENCNTLOG';
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
// +---------------------------------------------------------------------------+
// +       Procedimiento que obtiene el mensaje del log con base a un indice   +
// +---------------------------------------------------------------------------+
procedure TCrcobranz.StpObtLog( peIndice : Integer; var vlError   :Integer;
                                                    var vlTxError : String );
var spObtlog : TStoredProc;
begin
  spObtlog := TStoredProc.Create(Nil);
  try
    with spObtlog do
    begin
      DatabaseName:= Apli.DatabaseName;
      SessionName:= Apli.SessionName;
      StoredProcName:=coPaquete + '.' + 'STPOBTENLOG';
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
// +---------------------------------------------------------------------------+
// +                 Agrega una linea en el Memo de la pantalla                +
// +---------------------------------------------------------------------------+
procedure TCrcobranz.stpLimpiaMultiChqra(var pResult: Integer;  var pTxResult: String);
var spLimpia : TStoredProc;
begin
  pResult   := 0;
  pTxResult := '';
  spLimpia := TStoredProc.Create(Nil);
  try
    with spLimpia do
    begin
      DatabaseName   := Apli.DatabaseName;
      SessionName    := Apli.SessionName;
      StoredProcName := coPaquete + '.' + 'STPLIMPIAMULTICHQRA';
      Params.Clear;
      Params.CreateParam( ftFloat,  'psResultado',   ptOutput );
      Params.CreateParam( ftString, 'psTxResultado', ptOutput );
      ExecProc;
      pResult   := ParamByName( 'psResultado' ).AsInteger;
      pTxResult := ParamByName( 'psTxResultado' ).AsString;
    end;
  finally
    if assigned(spLimpia) then
      spLimpia.Free;
    //ends_if
  end;
end;


procedure TCrcobranz.AsignaTipoFiltro( peIdCredito: String; Sender: TInterLinkit);
begin
   Sender.Buffer := peIdCredito;
   Sender.OnEjecuta(Sender);
end;
//
//
function TCrcobranz.StpCalcMontoCN(peIdCredito: Integer; peCveComision,
           peBPorcentaje: String; pePorcentaje, peImpBaseCalc, peImpComision: Double;
           var psImpComision, psImpIVAComis: Double): Boolean;
var stpCalcCom : TStoredProc;
begin
  Result := False;
  psImpComision := 0;
  psImpIVAComis := 0;
  try
    stpCalcCom := TStoredProc.Create(Nil);
    try
      with stpCalcCom do
      begin
        DatabaseName   := Apli.DatabaseName;
        SessionName    := Apli.SessionName;
        StoredProcName := 'PKGCRCOMUN.STPCALCMONTOCN';
        Params.Clear;
        //
        Params.CreateParam( ftFloat,  'PEIDCREDITO',   ptInput  );
        Params.CreateParam( ftString, 'PECVECOMISION', ptInput  );
        Params.CreateParam( ftString, 'PEBPORCENTAJE', ptInput  );
        Params.CreateParam( ftFloat,  'PEPORCENTAJE',  ptInput  );
        Params.CreateParam( ftFloat,  'PEIMPBASECALC', ptInput  );
        Params.CreateParam( ftFloat,  'PEIMPCOMISION', ptInput  );
        //
        Params.CreateParam( ftFloat,  'PSIMPCOMISION', ptOutput );
        Params.CreateParam( ftFloat,  'PSIMPIVACOMIS', ptOutput );
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput );
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput );
        //
        ParamByName( 'PEIDCREDITO'    ).AsInteger := peIdCredito;
        ParamByName( 'PECVECOMISION'  ).AsString  := peCveComision;
        ParamByName( 'PEBPORCENTAJE'  ).AsString  := peBPorcentaje;
        ParamByName( 'PEPORCENTAJE'   ).AsFloat   := pePorcentaje;
        ParamByName( 'PEIMPBASECALC'  ).AsFloat   := peImpBaseCalc;
        ParamByName( 'PEIMPCOMISION'  ).AsFloat   := peImpComision;
        //
        ExecProc;
        //
        if ParamByName( 'PSRESULTADO' ).AsInteger = 0 then
        begin
          Result := True;
          psImpComision := ParamByName( 'PSIMPCOMISION' ).AsFloat;
          psImpIVAComis := ParamByName( 'PSIMPIVACOMIS' ).AsFloat;
        end else begin
          MessageDlg('Error: '   + coCRLF +
                     'Código : ' + ParamByName('PSRESULTADO').AsString   + coCRLF +
                     'Mensaje: ' + ParamByName('PSTXRESULTADO').AsString,
                     mtError, [mbOk], 0 );
        end;
      end;
    finally
      if assigned(stpCalcCom) then
        stpCalcCom.Free;
      //ends_if
    end;
  except
    on e : exception do
    begin
      MessageDlg( 'Error al calcular el monto de comisión >>' + e.Message,
                  mtError, [mbOk],  0 );
    end;
    //
  end;
  //
end;
//
//
// +--------------------------- FORMA CRCOBRANZ -------------------------------+
// +                                                                           +
// +                                                                           +
// +                                                                           +
// +                                                                           +
// +                                                                           +
// +                           FORMA DE CRCOBRANZ                              +
// +                                                                           +
// +                                                                           +
// +                                                                           +
// +                                                                           +
// +                                                                           +
// +--------------------------- FORMA CRCOBRANZ -------------------------------+
//
//
// +---------------------------------------------------------------------------+
// +                 Agrega una linea en el Memo de la pantalla                +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.AddError(pMsgError : String);
Begin
  AddLine(MErrores, ' *** ' + pMsgError );
end;
// +---------------------------------------------------------------------------+
// +    A partir de una cadena determina si despliega un mensaje de error      +
// +---------------------------------------------------------------------------+
Function TWCrcobranz.ValidaError( pMsgError : String): Boolean;
begin
  Result := False;
  if pMsgError <> '' then
  begin
    Objeto.MuestraError( pMsgError );
    AddError( pMsgError );
    Result := True;
  end;
end;
// +---------------------------------------------------------------------------+
// +                       Limpia los filtros de busqueda                      +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.LimpiaFiltro;
begin
  Objeto.CatProdGpo.Active    := False;
  Objeto.CatAcreditado.Active := False;
  Objeto.CatContrato.Active   := False;
  Objeto.CatCredito.Active    := False;
  Objeto.CatEmisor.Active     := False;
  Objeto.CatProveedor.Active  := False;
  Searched         := False;
  cbFiltro.Checked := False;
end;
// +---------------------------------------------------------------------------+
// +                       Limpia los filtros de busqueda                      +
// +---------------------------------------------------------------------------+
function TWCrcobranz.BeginSearch(BBusca: Boolean; const Llave: array of TVarRec): Boolean;
begin
  Searched := False;
  //
  if Objeto.TIPO_FILTRO.AsString = cobpGpoProd then                             // Busqueda sobre grupo producto
  begin
    if BBusca then
      Searched := Objeto.CatProdGpo.Busca
    else
      Searched := Objeto.CatProdGpo.FindKey( Llave  );
    // ends_if
  end else if Objeto.TIPO_FILTRO.AsString = cobpAcred then                      // Busqueda sobre acreditado
  begin
    if BBusca then
      Searched := Objeto.CatAcreditado.Busca
    else
      Searched := Objeto.CatAcreditado.FindKey( Llave  );
    // ends_if
  end else if Objeto.TIPO_FILTRO.AsString = cobpAutor then                      // Busqueda sobre autorizacion
  begin
    if BBusca then
      Searched := Objeto.CatContrato.Busca
    else
      Searched := Objeto.CatContrato.FindKeyNear( Llave, [ cID_CONTRATO ] );
    // ends_if
  end else if Objeto.TIPO_FILTRO.AsString = cobpProv then                       // Busqueda sobre proveedor
  begin
    if BBusca then
      Searched := Objeto.CatProveedor.Busca
    else
      Searched := Objeto.CatProveedor.FindKey( Llave  );
    // ends_if
  end else if Objeto.TIPO_FILTRO.AsString = cobpDisp then                       // Busqueda sobre disposición
  begin
    if BBusca then
      Searched := Objeto.CatCredito.Busca
    else
      Searched := Objeto.CatCredito.FindKey( Llave );
    // ends_if
  end else if Objeto.TIPO_FILTRO.AsString = cobpNoCtrl then                     // Busqueda por No de Control
  begin
    if BBusca then
      Searched := Objeto.CatCredito.Busca
    else
      Searched := Objeto.CatCredito.FindKeyNear( Llave, [ cID_CONTROL_EXT  ] );
    // ends_if
  end else if Objeto.TIPO_FILTRO.AsString = cobpIdFIRA then                     // Busqueda por un ID-FIRA determinado
  begin
    if BBusca then
      Searched := Objeto.CatCredito.Busca
    else
      Searched := Objeto.CatCredito.FindKeyNear( Llave, [ cID_CRED_EXTERNO ] );
    // ends_if
  end else if Objeto.TIPO_FILTRO.AsString = cobpEmNaf then                      // Busqueda sobre CR_EMISOR.ID_ACREDITADO
  begin
    if BBusca then
      Searched := Objeto.CatEmisor.Busca
    else
      Searched := Objeto.CatEmisor.FindKeyNear(  Llave, [ cID_ACREDITADO ] );
    // ends_if

  end else if Objeto.TIPO_FILTRO.AsString = cobpIdNafin then                    // Busqueda sobre CVE_EMISOR_NAFIN
  begin
    if BBusca then
      Searched := Objeto.CatEmisor.Busca
    else
      Searched := Objeto.CatEmisor.FindKeyNear(  Llave, [ cCVE_EMISOR_NAFIN ] );
    // ends_if
  end;
  // Obtiene el valor del control
  Objeto.VALOR_FILTRO.GetFromControl;
  cbFiltro.Checked := Searched;
  //
  Result := Searched;
end;

procedure TWCrcobranz.SetTipoFiltro;
begin
  lbFiltro.Caption := '';
  LimpiaFiltro;                           // Desactiva las clases internas de busqueda
  // Libera los controles
  if Objeto.CatProdGpo.CVE_PRODUCTO_GPO.Control <> nil then
     Objeto.CatProdGpo.CVE_PRODUCTO_GPO.Control := nil;
  //ends if
  if Objeto.CatAcreditado.ID_ACREDITADO.Control <> nil then
     Objeto.CatAcreditado.ID_ACREDITADO.Control := nil;
  //ends if
  if Objeto.CatContrato.ID_CONTRATO.Control <> nil then
     Objeto.CatContrato.ID_CONTRATO.Control := nil;
  //ends if
  if Objeto.CatProveedor.ID_ACREDITADO.Control <> nil then
     Objeto.CatProveedor.ID_ACREDITADO.Control := nil;
  //ends if
  if Objeto.CatCredito.ID_CREDITO.Control <> nil then
     Objeto.CatCredito.ID_CREDITO.Control := nil;
  //ends if
  if Objeto.CatCredito.ID_CONTROL_EXT.Control <> nil then
     Objeto.CatCredito.ID_CONTROL_EXT.Control := nil;
  //ends if
  if Objeto.CatCredito.ID_CRED_EXTERNO.Control <> nil then
     Objeto.CatCredito.ID_CRED_EXTERNO.Control := nil;
  //ends if
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//  if Objeto.CatEmisor.CVE_EMISOR_NAFIN.Control <> nil then
//     Objeto.CatEmisor.CVE_EMISOR_NAFIN.Control := nil;
  if Objeto.CatEmisor.CVE_EMISOR_EXT.Control <> nil then
     Objeto.CatEmisor.CVE_EMISOR_EXT.Control := nil;
  //ends if
{/ROIM}
  //
  // Liga los controles
  if Objeto.TIPO_FILTRO.AsString = cobpGpoProd then                             // Filtro por grupo producto
  begin
    lbFiltro.Caption := coDescPGpo;
    Objeto.CatProdGpo.CVE_PRODUCTO_GPO.Control := edValorFiltro;
    Objeto.CatProdGpo.DESC_L_PROD_GPO.Control  := edDESC_FILTRO;
  end else if Objeto.TIPO_FILTRO.AsString = cobpAcred then                      // Filtro por acreditado
  begin
    lbFiltro.Caption := coDescAcred;
    Objeto.CatAcreditado.ID_ACREDITADO.Control  := edValorFiltro;
    Objeto.CatAcreditado.Persona.Nombre.Control := edDESC_FILTRO;
  end else if Objeto.TIPO_FILTRO.AsString = cobpAutor then                      // Filtro por Autorizacion
  begin
    lbFiltro.Caption := coDescAutor;
    Objeto.CatContrato.ID_CONTRATO.Control  := edValorFiltro;
    Objeto.CatContrato.Contrato.TITNombre.Control := edDESC_FILTRO;
  end else if Objeto.TIPO_FILTRO.AsString = cobpDisp then                       // Filtro por disposicion
  begin
    lbFiltro.Caption := coDescDisp;
    Objeto.CatCredito.ID_CREDITO.Control := edValorFiltro;
    Objeto.CatCredito.ContratoCre.Contrato.TITNombre.Control := edDESC_FILTRO;
  end else if Objeto.TIPO_FILTRO.AsString = cobpProv then                       // Filtro por Proveedor
  begin
    lbFiltro.Caption := coDescProv;
    Objeto.CatProveedor.ID_ACREDITADO.Control  := edValorFiltro;
    Objeto.CatProveedor.Persona.Nombre.Control := edDESC_FILTRO;
  end else if Objeto.TIPO_FILTRO.AsString = cobpEmNaf then                       // Filtro por Emisor NAFIN
  begin
    lbFiltro.Caption := coDescEmNaf;
    Objeto.CatEmisor.ID_ACREDITADO.Control := edValorFiltro;
    Objeto.CatEmisor.NOMBRE_EMISOR.Control := edDESC_FILTRO;

  end else if Objeto.TIPO_FILTRO.AsString = cobpIdNafin then                       // Filtro por Id NAFIN
  begin
    lbFiltro.Caption := coDescIdNafin;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//    Objeto.CatEmisor.CVE_EMISOR_NAFIN.Control := edValorFiltro;
    Objeto.CatEmisor.CVE_EMISOR_EXT.Control := edValorFiltro;
{/ROIM}
    Objeto.CatEmisor.NOMBRE_EMISOR.Control := edDESC_FILTRO;
  end else if Objeto.TIPO_FILTRO.AsString = cobpNoCtrl then                     // Filtro por No. Control
  begin
    lbFiltro.Caption := coDescNoCtrl;
    Objeto.CatCredito.ID_CONTROL_EXT.Control := edValorFiltro;
    Objeto.CatCredito.ContratoCre.Contrato.TITNombre.Control := edDESC_FILTRO;
  end else if Objeto.TIPO_FILTRO.AsString = cobpIdFIRA then                     // Filtro por ID Fira
  begin
    lbFiltro.Caption := coDescIdFIRA;
    Objeto.CatCredito.ID_CRED_EXTERNO.Control := edValorFiltro;
    Objeto.CatCredito.ContratoCre.Contrato.TITNombre.Control := edDESC_FILTRO;
  end;
  //
  if edValorFiltro.CanFocus then
     edValorFiltro.SetFocus;
  //
end;
// +---------------------------------------------------------------------------+
// +                   VALIDA SI ES DESCUENTO DE DOCUMENTOS                    +
// +---------------------------------------------------------------------------+
function TWCrcobranz.EsDescuento( peParam : String ): Boolean;
begin
  Result := ( peParam <> '' );
end;
// +---------------------------------------------------------------------------+
// +                 ASIGNA EL COLOR A UN RENGLON DEL GRID                     +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.AsignaColRow( peColor : TColor; peRow : Integer );
var vlCol : Integer;
begin
  //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
  if sagDATOS.Cells[ COL_CLCW, peRow ] = cDescRowWColor then
    peColor := cRowWColor;        
  //</ENDS_LOLS_24_AGO_2006>
  //
  for vlCol := 0 to sagDATOS.ColCount - 1 do
    sagDATOS.ColorCell[ vlCol, peRow ] := peColor;
end;
// +---------------------------------------------------------------------------+
// +                   ASIGNA EL VALOR DE LA FECHA VALOR DE PAGO               +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.AsignaFVAlorPago( peFecha : TDateTime);
begin
  dtFECHA.DateTime := peFecha;
  vgInfoPer.F_VALOR_PAGO := peFecha;
  Objeto.F_VALOR_PAGO.AsDateTime := peFecha;
end;
// +---------------------------------------------------------------------------+
// +                   ASIGNA EL IMPORTE DE DEPOSITO                           +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.AsignaMontoDeposito( peMonto : Double );
begin
  vgInfoPer.IMP_DEPOSITO := peMonto;
  Objeto.IMP_DEP_GAR_FEGA.AsFloat := peMonto;
end;
// +---------------------------------------------------------------------------+
// +                   ASIGNA EL IMPORTE DE COMISION                           +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.AsignaImpComision(peMonto: Double);
begin
  vgInfoPer.IMP_COMISION := peMonto;
  Objeto.IMP_COMISION.AsFloat := peMonto;
end;
// +---------------------------------------------------------------------------+
// +                   ASIGNA EL IMPORTE DE INTERES                            +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.AsignaImpInteres(peMonto: Double);
begin
  vgInfoPer.IMP_INTERES := peMonto;
  Objeto.IMP_INTERES.AsFloat := peMonto;
end;
// +---------------------------------------------------------------------------+
// +               ASIGNA EL IMPORTE DE FINANCIAMIENTO ADICIONAL               +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.AsignaImpFinAdic(peMonto: Double);
begin
  vgInfoPer.IMP_FIN_ADIC := peMonto;
  Objeto.IMP_FIN_ADIC.AsFloat := peMonto;
end;
// +---------------------------------------------------------------------------+
// +                   ASIGNA EL IMPORTE DE CAPITAL                            +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.AsignaImpCapital(peMonto: Double);
begin
  vgInfoPer.IMP_CAPITAL := peMonto;
  Objeto.IMP_CAPITAL.AsFloat := peMonto;
end;
// +---------------------------------------------------------------------------+
// +                   ASIGNA EL FACTOR DE MORATORIOS                          +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.AsignaFactorMoras( peFactor : Double );
begin
  vgInfoPer.FACT_MORAS := peFactor;
  Objeto.FACT_MORAS.AsFloat := peFactor;
end;
// +---------------------------------------------------------------------------+
// +                   ASIGNA EL MONTO DE MORATORIOS                           +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.AsignaMontoMoras( peMonto : Double );
begin
  vgInfoPer.MONTO_MORAS      := peMonto;
  Objeto.MONTO_MORAS.AsFloat := peMonto;
end;
// +---------------------------------------------------------------------------+
// +                        DETERMINA SI ES PAGO ANTICIPADO                    +
// +---------------------------------------------------------------------------+
function TWCrcobranz.EsPagoAnticipado(FVencto, FProgPago, FOperacion : TDateTime ): Boolean;
begin
  Result := False;
  if ( FOperacion < FVencto ) and ( FOperacion < FProgPago ) then
      Result := True;
  //
end;
// +---------------------------------------------------------------------------+
// +                 SUMA EL IMPORTE BASE DE LA COBRANZA ANTICIPADA            +
// +---------------------------------------------------------------------------+
function TWCrcobranz.CalcImpBaseAN(idcredito, fo, ff : Integer; bFAdic,
                                   bCapital : String; CurrRow : Integer ): Double;
var i      : integer;
    idCred : integer;
    iRow   : integer;
    vlICom : Double;
    vlIVaC : Double;
    sbFAdic   : String;
    sbCapital : String;
begin
  Result := 0;
  // 
  if idcredito > 0 then
  begin
    fo := -1;
    ff := -1;
    idCred := 0;
    for  i := 0 to sagDATOS.RowCount - 1 do
    begin
      if ( StrToIntDef ( sagDATOS.Cells[ COL_CRED,  i ], 0 ) = idcredito ) and
         ( idCred = 0 ) then
      begin
        fo     := i;
        idCred := idcredito;
      end;
      //
      if ( StrToIntDef ( sagDATOS.Cells[ COL_CRED,  i ], 0 ) <> idcredito ) and ( idCred > 0 ) then
      begin
        ff     := i - 1;
        break;
      end;
      //
      if ( i = sagDATOS.RowCount - 1 ) and ( idCred > 0 ) then
      begin
        ff     := i;
        break;
      end;
    end;
    //
    if ( fo >= 0 ) and ( ff >= 0 ) then
    begin
      Result := CalcImpBaseAN(0, fo, ff, bFAdic, bCapital, CurrRow );
    end;
  end else begin
    if ( sagDATOS.Cells[COL_BCPG, fo ] = 'V' )  then
    begin
      //
      iRow := -1;
      for i := fo to ff do
      begin
        if ( sagDATOS.Cells[COL_BPAN, i ] = 'V' ) then
        begin
          //
          sbFAdic   := sagDATOS.Cells[ COL_BCFA,  i ];
          sbCapital := sagDATOS.Cells[ COL_BCCA,  i ];
          //
          if ( bFAdic   <> '' ) and ( CurrRow = i )  then sbFAdic   := bFAdic;
          if ( bCapital <> '' ) and ( CurrRow = i )  then sbCapital := bCapital;
          //
          if sbFAdic = 'V' then
            Result := Result + CurrFromFrmFloat( sagDATOS.Cells[ COL_IFIN,  i ] );
          //
          if sbCapital = 'V' then
            Result := Result + CurrFromFrmFloat( sagDATOS.Cells[ COL_ICAP,  i ] );
          //
          if iRow < 0 then iRow := i;
        end;
      end;
      //
      if iRow >= 0 then
      begin
        vlICom := 0;           vlIVaC := 0;
        Objeto.StpCalcMontoCN(
          StrToIntDef( sagDATOS.Cells[ COL_CRED,  iRow ], 0 ),            // peIdCredito: Integer;
          sagDATOS.Cells[ COL_CCPA,  iRow ],                              // peCveComision,
          sagDATOS.Cells[ COL_BPCT,  iRow ],                              // peBPorcentaje: String;
          CurrFromFrmFloat( sagDATOS.Cells[ COL_PCTC,  iRow ] ),          // pePorcentaje,
          Result,                                                         // peImpBaseCalc,
          CurrFromFrmFloat( sagDATOS.Cells[ COL_IMPC,  iRow ] ),          // peImpComision: Double;
          vlICom,
          vlIVaC
        );
        //
        for i := fo to ff do
          sagDATOS.Cells[ COL_CPAN, iRow ] := Format( CFORMAT_DINERO, [ vlICom + vlIVaC ] );
        //
      end;
    end;
    //
  end;
  //
end;
// +---------------------------------------------------------------------------+
// +                          ASIGNA MONTO CREDITO                             +
// +---------------------------------------------------------------------------+
function TWCrcobranz.AsignaMontoCredito( peIdCredito, pIni, pFin : Integer; Saldo : Double ) : Boolean;
var i, j : Integer;
    s, scred : string;
    iPini : integer;
    iPfin : integer;
    vlSdo : Extended;
    vlAde : Extended;
    vlError : String;
    imp_pago_con : Double;
    imp_pago_int : Double;
    imp_pago_fin : Double;
    imp_pago_cap : Double;
    imp_mora_con : Double;
    imp_mora_int : Double;
    imp_mora_fin : Double;
    imp_mora_cap : Double;
    fac_mora_con : Double;
    fac_mora_int : Double;
    fac_mora_fin : Double;
    fac_mora_cap : Double;
    imp_pago_tot : Double;
begin
  iPini := pIni;
  iPfin := pFin;
  vlSdo := Saldo;
  if not ( ( iPini >= 0 ) and ( iPfin >= 0 ) ) then
    for i := 0 to vgLInfoCred.Count - 1 do
    begin
      s     := vgLInfoCred.Strings[i];
      scred := Copy( s, 1,  Pos('=', s ) - 1 );
      s     := Copy( s, Pos('=', s ) + 1, length( s ) );
      iPini := StrToIntDef( Copy( s, 1,  Pos('-', s ) - 1 ), -1 );
      iPfin := StrToIntDef( Copy( s, Pos('-', s ) + 1, length( s ) ), -1 );
      if StrToIntDef( scred, -1 ) = peIdCredito then
      begin
        vlSdo := CurrFromFrmFloat( sagDATOS.Cells[ COL_SALD, iPini ] );
        break;
      end;//
    end;
  //
  if ( ( iPini >= 0 ) and ( iPfin >= 0 ) ) then
  begin
      Objeto.LimpiaTablaCob(vlError);   // Limpia la tabla de configuración para el cobro de comisiones
      ValidaError(vlError);
      for j := iPini to iPfin do
      begin
        GetFromGrid( j,  0 );
        Objeto.StpAgregaElemento(
          Objeto.ID_CREDITO.AsInteger,      Objeto.F_VENCIMIENTO.AsDateTime,
          Objeto.F_PROG_PAGO.AsDateTime,    Objeto.F_VALOR_PAGO.AsDateTime,
          Objeto.ID_DOCUMENTO.AsString,     Objeto.NUM_PER_DOCTO.AsInteger,
          Objeto.IMP_DEP_GAR_FEGA.AsFloat,  Objeto.B_COB_COMISION.AsString,
          Objeto.B_COB_INTERES.AsString,    Objeto.B_COB_FIN_ADIC.AsString,
          Objeto.B_COB_CAPITAL.AsString,    Objeto.IMP_COMISION.AsFloat,
          Objeto.IMP_INTERES.AsFloat,       Objeto.IMP_FIN_ADIC.AsFloat,
          Objeto.IMP_CAPITAL.AsFloat,       Objeto.FAC_MORAS_CO.AsFloat,
          Objeto.FAC_MORAS_IN.AsFloat,      Objeto.FAC_MORAS_FA.AsFloat,
          Objeto.FAC_MORAS_CA.AsFloat,      Objeto.B_IVA_MORA_CO.AsString,
          Objeto.B_IVA_MORA_IN.AsString,    Objeto.B_IVA_MORA_FA.AsString,
          Objeto.B_IVA_MORA_CA.AsString,    Objeto.B_COND_MORA_CO.AsString,
          Objeto.B_COND_MORA_IN.AsString,   Objeto.B_COND_MORA_FA.AsString,
          Objeto.B_COND_MORA_CA.AsString,   Objeto.B_GARANTIA_FEGA.AsString,
          Objeto.B_COB_ORD_PER.AsString,    Objeto.B_COB_ORD_ACC.AsString,
          Objeto.B_COB_TOT_PER.AsString,    Objeto.B_COB_PARCIAL.AsString,
          sagDATOS.Cells[ COL_BCAU, j ],    Objeto.TIPO_DETALLE.AsString,
          Objeto.TIPO_COB_ANT.AsString,     Objeto.SUB_TIPO_COB_ANT.AsString,
          Objeto.B_TRANSFERENCIA.AsString,  sagDATOS.Cells[ COL_BCPG, j ],
          sagDATOS.Cells[ COL_BPCT, j ],    CurrFromFrmFloat( sagDATOS.Cells[ COL_PCTC, j ] ),
          CurrFromFrmFloat( sagDATOS.Cells[ COL_IMPC, j ] ), vlError
        );
        ValidaError(vlError);
      end;//ends_for_j_:=_iPini_to_iPfin_do
      Objeto.StpAsignaCob( Objeto.ID_CREDITO.AsInteger, vlSdo, vlError);   // Asigna montos
      ValidaError(vlError);
      for j := iPini to iPfin do
      begin
        GetFromGrid( j,  0 );
        fac_mora_con := Objeto.FAC_MORAS_CO.AsFloat;
        fac_mora_int := Objeto.FAC_MORAS_IN.AsFloat;
        fac_mora_fin := Objeto.FAC_MORAS_FA.AsFloat;
        fac_mora_cap := Objeto.FAC_MORAS_CA.AsFloat;
        Objeto.StpObtImpCob( Objeto.ID_CREDITO.AsInteger,   Objeto.F_VENCIMIENTO.AsDateTime,
                             Objeto.F_PROG_PAGO.AsDateTime, Objeto.ID_DOCUMENTO.AsString,
                             imp_pago_con, imp_pago_int, imp_pago_fin, imp_pago_cap,
                             imp_mora_con, imp_mora_int, imp_mora_fin, imp_mora_cap,
                             fac_mora_con, fac_mora_int, fac_mora_fin, fac_mora_cap,
                             imp_pago_tot, vlError );
        if not ValidaError(vlError) then
        begin
          Objeto.IMP_COMISION.AsFloat    := imp_pago_con;
          Objeto.IMP_INTERES.AsFloat     := imp_pago_int;
          Objeto.IMP_FIN_ADIC.AsFloat    := imp_pago_fin;
          Objeto.IMP_CAPITAL.AsFloat     := imp_pago_cap;
          Objeto.IMP_TOTAL.AsFloat       := imp_pago_tot;
          Objeto.IMP_MORAS_CO.AsFloat    := imp_mora_con;
          Objeto.IMP_MORAS_IN.AsFloat    := imp_mora_int;
          Objeto.IMP_MORAS_FA.AsFloat    := imp_mora_fin;
          Objeto.IMP_MORAS_CA.AsFloat    := imp_mora_cap;
          Objeto.FAC_MORAS_CO.AsFloat    := fac_mora_con;
          Objeto.FAC_MORAS_IN.AsFloat    := fac_mora_int;
          Objeto.FAC_MORAS_FA.AsFloat    := fac_mora_fin;
          Objeto.FAC_MORAS_CA.AsFloat    := fac_mora_cap;
          Objeto.B_COB_COMISION.AsString := BoolToStr( Objeto.IMP_COMISION.AsFloat > 0 );
          Objeto.B_COB_INTERES.AsString  := BoolToStr( Objeto.IMP_INTERES.AsFloat  > 0 );
          Objeto.B_COB_FIN_ADIC.AsString := BoolToStr( Objeto.IMP_FIN_ADIC.AsFloat > 0 );
          Objeto.B_COB_CAPITAL.AsString  := BoolToStr( Objeto.IMP_CAPITAL.AsFloat  > 0 );
          SumaImportes; // Suma los importes de este pago
          UpdateToGrid;
        end;
      end;
      //
  end;
end;
// +---------------------------------------------------------------------------+
// +                          VALIDA SALDO CHEQUERA                            +
// +---------------------------------------------------------------------------+
function TWCrcobranz.ValidaSaldoChqra(bBandera : Boolean ) : Boolean;
var i, j : Integer;
    s, scred : string;
    iPini : integer;
    iPfin : integer;
    vlSdo : Double;
    vlAde : Double;
    vlError : String;
begin
  Result := True;
  // Valida que este el filtro con saldo en la chequera
  if not cbFiltroChqra.Checked then
     Exit;
  //
  for i := 0 to vgLInfoCred.Count - 1 do
  begin
    s     := vgLInfoCred.Strings[i];
    scred := Copy( s, 1,  Pos('=', s ) - 1 );
    s     := Copy( s, Pos('=', s ) + 1, length( s ) );
    iPini := StrToIntDef( Copy( s, 1,  Pos('-', s ) - 1 ), -1 );
    iPfin := StrToIntDef( Copy( s, Pos('-', s ) + 1, length( s ) ), -1 );
    //
    FillChar(vlAde, sizeof(vlAde), #0 );
    FillChar(vlSdo, sizeof(vlSdo), #0 );
    vlAde := 0;
    vlSdo := CurrFromFrmFloat( sagDATOS.Cells[ COL_SALD, iPini ] );
    for j := iPini to iPfin do
      vlAde := vlAde + CurrFromFrmFloat( sagDATOS.Cells[ COL_ICAP, j ] ) +
                       CurrFromFrmFloat( sagDATOS.Cells[ COL_IFIN, j ] ) +
                       CurrFromFrmFloat( sagDATOS.Cells[ COL_IINT, j ] ) +
                       CurrFromFrmFloat( sagDATOS.Cells[ COL_ICOM, j ] );
    //
    if ( vlAde > vlSdo ) or ( bBandera ) then
    begin
      AsignaMontoCredito( StrToInt( scred ), iPini, iPfin, vlSdo );
    end;//ends_if_vlAde_>_vlSdo_then
    //
  end;
  //
end;
// +---------------------------------------------------------------------------+
// +                        VALIDA PAGO ANTICIPADO                             +
// +---------------------------------------------------------------------------+
function TWCrcobranz.ValidaPagoAnticipado : Boolean;
var i, vlRow    : Integer;
    vlFVencto   : TDate;
    vlFProgPg   : TDate;
    vlFValor    : TDate;
    vlIdCredit  : Integer;
    vlCtrlRow   : Integer;
    vlCtrlCred  : Integer;
    //
    vlBPGAN       : String;
    vlBComision   : String;
    vlBPorcentaje : String;
    vlPctComision : Double;
    vlImpComision : Double;
    //
    //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
    vlTipoPagoCN  : String;
    vlColor       : TColor;
    vlBPregunta   : Boolean;
    //</LOLS_24_AGO_2006>
begin
  Result  := False;
  vlColor := clWhite;
  if DataFound then
  Begin
    CrCobAnti.InicializaDatos; //<LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
    //
    vlCtrlRow  := 0;
    vlCtrlCred := StrToIntDef ( sagDATOS.Cells[ COL_CRED,  0 ], 0 );
    for vlRow  := 0 to sagDATOS.RowCount - 1 do
    Begin
      if ( vlCtrlCred <> StrToIntDef ( sagDATOS.Cells[ COL_CRED,  vlRow ], 0 ) ) then
      Begin
        {
        if Result then
           CalcImpBaseAN( 0, vlCtrlRow, vlRow - 1, '', '', -1 );
        //
        }
        vlCtrlRow  := vlRow;
        vlCtrlCred := StrToIntDef ( sagDATOS.Cells[ COL_CRED,  vlRow ], 0 );
        //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
        vlColor    := clWhite;
        //</LOLS_24_AGO_2006>
      End;
      //
      vlIdCredit  := StrToIntDef ( sagDATOS.Cells[ COL_CRED,  vlRow ], 0 );
      vlFVencto   := StringToDate( sagDATOS.Cells[ COL_FVTO,  vlRow ] );
      vlFProgPg   := StringToDate( sagDATOS.Cells[ COL_FPPA,  vlRow ] );
      vlFValor    := StringToDate( sagDATOS.Cells[ COL_FVAL,  vlRow ] );
      vlBPGAN     := BoolToStr( EsPagoAnticipado( vlFVencto, vlFProgPg, vlFValor ) );
      //
      //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
      vlBPregunta   := True;
      if ( vlBPGAN = 'V' ) then
      begin
        vlTipoPagoCN  := sagDATOS.Cells[COL_CLCA, vlRow ];
        if vlTipoPagoCN <> '' then
        begin
          //
          if ( Objeto.TIPO_COB_ANT.AsString <> coPA ) or
             ( Objeto.SUB_TIPO_COB_ANT.AsString <> vlTipoPagoCN ) then
          begin
            vlColor      := cRowWColor;
            vlBPregunta  := False;
            //
            if vlTipoPagoCN = coAP then
              AddError( Format( coPgAnPlazo, [ sagDATOS.Cells[COL_CRED, vlRow ] ] ) )
            else if vlTipoPagoCN = coDM then
              AddError( Format( coPgAnProrr, [ sagDATOS.Cells[COL_CRED, vlRow ] ] ) )
            else
              AddError( Format( coPgAnErr,   [ sagDATOS.Cells[COL_CRED, vlRow ] ] ) );
            //
            //Actualiza registros previos del mismo crédito ( cobranza indistinta )
            for i := vlCtrlRow to vlRow - 1 do
              sagDATOS.Cells[COL_CLCW, i ] := cDescRowWColor;
            //
          end;
          //
        end;
        //
      end;
      //</LOLS_24_AGO_2006>
      //
      if ( sagDATOS.Cells[ COL_BCPG,  vlRow ]  = '' ) and   // No ha preguntado si genera Com Pg Ant
         ( sagDATOS.Cells[ COL_CCPA,  vlRow ] <> '' ) then  // Tiene asociada una Com Pg Ant
      begin
        //
        if ( vlBPGAN = 'V' ) then
        Begin
          //
          vlBComision   := sagDATOS.Cells[COL_BCPG, vlRow ];
          vlBPorcentaje := sagDATOS.Cells[COL_BPCT, vlRow ];
          vlPctComision := CurrFromFrmFloat( sagDATOS.Cells[COL_PCTC, vlRow ] );
          vlImpComision := CurrFromFrmFloat( sagDATOS.Cells[COL_IMPC, vlRow ] );
          //
          //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
          if vlBPregunta then
          begin
          //</ENDS_LOLS_24_AGO_2006>
            CrCobAnti.StpObtenComPagoAn( vlIdCredit,    vlBComision, vlBPorcentaje,
                                         vlPctComision, vlImpComision );

          //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
          end else
            vlBComision := 'F';
          //</ENDS_LOLS_24_AGO_2006>
          //
          if vlBComision = 'V' then  // Si al menos una de las disposiciones
            Result := True;          // en el grid aplica pago anticipado
          //                         // la rutina retorna True
          sagDATOS.Cells[COL_BCPG, vlRow ] := vlBComision;
          sagDATOS.Cells[COL_BPCT, vlRow ] := vlBPorcentaje;
          sagDATOS.Cells[COL_PCTC, vlRow ] := FloatToStr( vlPctComision );
          sagDATOS.Cells[COL_IMPC, vlRow ] := FloatToStr( vlImpComision );
          //
          //Actualiza registros previos del mismo crédito ( cobranza indistinta )
          for i := vlCtrlRow to vlRow - 1 do
          Begin
            sagDATOS.Cells[COL_BCPG, i ] := vlBComision;
            sagDATOS.Cells[COL_BPCT, i ] := vlBPorcentaje;
            sagDATOS.Cells[COL_PCTC, i ] := FloatToStr( vlPctComision );
            sagDATOS.Cells[COL_IMPC, i ] := FloatToStr( vlImpComision );
          End;
          //
        End;
        //
      End;
      //
      sagDATOS.Cells[COL_BPAN, vlRow ] := vlBPGAN;
      //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
      if vlColor = cRowWColor then
      begin
        sagDATOS.Cells[COL_CLCW, vlRow ] := cDescRowWColor;
        AsignaColRow( cRowWColor, vlRow );
      end else
      begin
        sagDATOS.Cells[COL_CLCW, vlRow ] := '';
        if Objeto.StrToBool( sagDATOS.Cells[COL_CPAG, vlRow ] ) then
          AsignaColRow( cRowColor, vlRow )
        else
          AsignaColRow( clWindow, vlRow );
        //
      end; 
      //</ENDS_LOLS_24_AGO_2006>
    End;
    {
    if Result then
       CalcImpBaseAN( 0, vlCtrlRow, sagDATOS.RowCount - 1, '', '', -1 );
    //
    }
  End;
  //
End;
// +---------------------------------------------------------------------------+
// +                     LIMPIA EL REGISTRO CON LA INFORMACION                 +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.LimpiaRecord;
begin
  FillChar( vgInfoPer, sizeof(vgInfoPer), #0 );
  Objeto.INDICE_GRID.AsInteger   := 0;
  Objeto.COLUMNA_GRID.AsInteger  := 0;
  Objeto.TIPO_PARAM.AsInteger    := coNone;
  Objeto.NUM_PER_DOCTO.AsInteger := 0;
  Objeto.F_VENCIMIENTO.AsString  := '';
  Objeto.F_PROG_PAGO.AsString    := '';
  // DE LA SECCION INFORMACION GENERAL
  Objeto.ID_CONTRATO.AsString    := '';
  Objeto.FOL_CONTRATO.AsString   := '';
  Objeto.CVE_MONEDA.AsString     := '';
  Objeto.DESC_MONEDA.AsString    := '';
  Objeto.ID_CTO_LIQ.AsString     := '';
  Objeto.SDO_CHEQUERA.AsString   := '';
  Objeto.ID_CREDITO.AsString     := '';
  Objeto.ID_CESION.AsString      := '';
  Objeto.ID_DOCUMENTO.AsString   := '';
  Objeto.ID_CRED_EXTERNO.AsString   := '';
  Objeto.ID_CONTROL_EXT.AsString    := '';
  Objeto.IMP_INI_DISP.AsString      := '';
  Objeto.IMP_VIG_DISP.AsString      := '';
  Objeto.F_INICIO.AsString          := '';
  Objeto.F_VENTTO_DISP.AsString     := '';
  Objeto.CVE_PRODUCTO_CRE.AsString  := '';
  Objeto.DESC_C_PRODUCTO.AsString   := '';
  Objeto.ID_ACREDITADO.AsString     := '';
  Objeto.NOMBRE_ACREDITADO.AsString := '';
  // DE LA SECCION DE PARAMETROS
  Objeto.F_VALOR_PAGO.AsString      := '';
  Objeto.FACT_MORAS.AsString        := '';
  Objeto.MONTO_MORAS.AsString       := '';
  Objeto.IMP_DEP_GAR_FEGA.AsString  := '';
  Objeto.B_IVA_MORAS.AsString       := '';
  Objeto.B_COND_MORAS.AsString      := '';
  Objeto.B_GARANTIA_FEGA.AsString   := '';
  // DE LA SECCION DE IMPORTES
  Objeto.IMP_COMISION.AsString      := '';
  Objeto.IMP_COM_EVENTO.AsString    := '';
  Objeto.IMP_INTERES.AsString       := '';
  Objeto.IMP_FIN_ADIC.AsString      := '';
  Objeto.IMP_CAPITAL.AsString       := '';
  Objeto.IMP_TOTAL.AsString         := '';
  //
  Objeto.B_COB_COMISION.AsString    := '';
  Objeto.B_COB_INTERES.AsString     := '';
  Objeto.B_COB_FIN_ADIC.AsString    := '';
  Objeto.B_COB_CAPITAL.AsString     := '';
  Objeto.B_COB_TOTAL.AsString       := '';
  //
  Objeto.CVE_ACCESORIO.AsString     := '';
  Objeto.IMP_NOMINAL.AsString       := '';
  Objeto.CVE_TIPO_INTERES.AsString  := '';
  Objeto.TIPO_DETALLE.AsString      := '';
  //
  Objeto.B_GTIA_PYME.AsString       := '';

  //<LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
  Objeto.B_COM_X_PGAN.AsString      := '';
  Objeto.B_PCT_C_PGAN.AsString      := '';
  Objeto.PCT_COM_PGAN.AsFloat       := 0;
  Objeto.IMP_COM_PGAN.AsFloat       := 0;
  Objeto.B_PA_MOD_PCT_COM.AsString  := '';
  Objeto.B_PA_MOD_IMP_COM.AsString  := '';
  //</LOLS>
  //LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT
  Objeto.CVE_SUB_TIP_COB.AsString   := '';
  //</ENDS_LOLS_24_AGO_2006>

  //<AARJ 03 DIC 2009. ADECUACIONES PARA HABILITAR EL BOTON QUE ASIGNA IMPORTES POR ORDEN DE PRELACION CUANDO EL SALDO NO CUBRE EL PAGO TOTAL>
  btnAParcialXDisp.Enabled := False ;
  //</ENDS AARJ 03 DIC 2009>

end;
// +---------------------------------------------------------------------------+
// +     Muestra los hints de campos que tienen una longitud más extensa.      +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.MuestraHints;
Begin
   edDESC_FILTRO.Hint     := Objeto.VALOR_FILTRO.AsString;
   edDESC_FILTRO.ShowHint := True;
   //
   edDESC_C_PRODUCTO.Hint     := Objeto.DESC_C_PRODUCTO.AsString;
   edDESC_C_PRODUCTO.ShowHint := True;
   //
   lbNOMBRE_ACREDITADO.Hint     := Objeto.NOMBRE_ACREDITADO.AsString;
   lbNOMBRE_ACREDITADO.ShowHint := True;
end;
// +---------------------------------------------------------------------------+
// +      Despliega los valores del registro en los edits de la pantalla       +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.DrawControls;
begin
  // DE LA SECCION DE INFORMACION GENERAL
  Objeto.ID_CONTRATO.DrawControl;
  Objeto.DESC_MONEDA.DrawControl;
  Objeto.ID_CTO_LIQ.DrawControl;
  Objeto.SDO_CHEQUERA.DrawControl;
  Objeto.ID_CREDITO.DrawControl;
  Objeto.ID_CRED_EXTERNO.DrawControl;
  Objeto.ID_CONTROL_EXT.DrawControl;
  Objeto.IMP_INI_DISP.DrawControl;
  Objeto.IMP_VIG_DISP.DrawControl;
  Objeto.F_INICIO.DrawControl;
  Objeto.F_VENTTO_DISP.DrawControl;
  Objeto.DESC_C_PRODUCTO.DrawControl;
  Objeto.NOMBRE_ACREDITADO.DrawControl;
  // DE LA SECCION DE PARAMETROS
  Objeto.F_VALOR_PAGO.DrawControl;
  Objeto.FACT_MORAS.DrawControl;
  Objeto.MONTO_MORAS.DrawControl;
  Objeto.IMP_DEP_GAR_FEGA.DrawControl;
  Objeto.B_IVA_MORAS.DrawControl;
  Objeto.B_COND_MORAS.DrawControl;
  Objeto.B_GARANTIA_FEGA.DrawControl;
  // DE LA SECCION DE IMPORTES
  Objeto.IMP_COMISION.DrawControl;
  Objeto.IMP_COM_EVENTO.DrawControl;
  Objeto.IMP_INTERES.DrawControl;
  Objeto.IMP_FIN_ADIC.DrawControl;
  Objeto.IMP_CAPITAL.DrawControl;
  Objeto.IMP_TOTAL.DrawControl;
  //
  Objeto.B_COB_COMISION.DrawControl;
  Objeto.B_COB_INTERES.DrawControl;
  Objeto.B_COB_FIN_ADIC.DrawControl;
  Objeto.B_COB_CAPITAL.DrawControl;
  Objeto.B_COB_TOTAL.DrawControl;
  //
  MuestraHints;
end;
// +---------------------------------------------------------------------------+
// +                          Limpia la pantalla                               +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.LimpiaPantalla;
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
      if  vlCol > COL_VIS then  // COL_VIS  = 13 (COL_IREM); --> Valor de la ultima columna visible en el Grid
        sagDATOS.ColWidths[vlCol]:= 0;
      //ends_if
    end;
    sagDATOS.RowHeights[ vlRow ] := sagDATOS.DefaultRowHeight;
  end;
  sagDATOS.RowCount := 1;
  //
  LimpiaRecord;      // Limpia el registro de datos
  DrawControls;      // Limpia los edits de la pantalla
  vgLGarFEGA.Clear;  // Limpia la lista de disposiciones con garantia FEGA
  Application.ProcessMessages;
end;
// +---------------------------------------------------------------------------+
// +            Ejecuta el query y muestra los datos en pantalla               +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.MuestraDatos;
var Qry         : TQuery;
    nRowCount   : Integer;
    vlFHoy      : TDate;
    vlRemanente : Double;
    vlEsDescto  : Boolean;
    vlBCobraPer : Boolean;
    vlError     : String;
    vlICredit   : Integer;
    vlIniPos    : Integer;
    vlFinPos    : Integer;
    vlImpBlqCom : Double;  // RABA FEB 2012 PPP
begin
  if Searching then exit; // Valida que no exista una busqueda en curso ...
  Searching  := True;
  DataFound  := False;
  try
    LimpiaPantalla;
    vgLInfoCred.Clear;
    InterForma1.ShowMsgPanel('');
    Objeto.B_REPORTADOS.GetFromControl;
    Objeto.TIPO_COB_ANT.GetFromControl;
    Objeto.VALOR_FILTRO.GetFromControl;
    if ( Objeto.VALOR_FILTRO.AsString = '' ) then
    begin
      //MessageDlg( coNoFiltro, mtInformation, [mbOK], 0 );
      InterForma1.ShowMsgPanel(coNoFiltro);
      Searching := False;
      exit;
    end;//ends_if
    // Valida si desea obtener todos los movimientos anticipados
    if ( Objeto.COBRANZA.AsString     = coCobAN ) and
       ( Objeto.VALOR_FILTRO.AsString = ''      ) and
       ( Objeto.B_REPORTADOS.AsString = cFalso  ) then
    begin
      if MessageDlg( coWarningAnt, mtConfirmation, mbYesNoCancel, 0 ) <> mrYes then
      begin
        Searching := False;
        exit;
      end;//ends_if
    end;

    // ---------  Construye la cadena SQL de busqueda y obtiene un Query ---------
    Qry    := GetSQLQueryNoNil( Objeto.BuildSQLStr( cbFiltroChqra.Checked ), Objeto.Apli.DataBaseName,
                                Objeto.Apli.SessionName, False );
    vlFHoy := Objeto.Apli.DameFechaEmpresa;
    nRowCount  := 0;
    // ------------------------- Barre el QUERY de datos -------------------------
    if Assigned(Qry) then
    begin
      try Qry.SQL.SaveToFile('c:\sql_cob_' + FormatDateTime( 'dd_mm_yyyy hh_ss_nn_zzz', Now ) + '.sql' ); except end;
      if not( Qry.IsEmpty ) then
      begin
        Qry.First;
        DataFound := True;
        vlIniPos  := 0;
        vlFinPos  := 0;
        vlICredit := Qry.FieldByName('ID_CREDITO').AsInteger;
        while not Qry.Eof Do
        begin
          with sagDATOS do
          begin
            // Asigna los formatos de las celdas
            AlignCell[COL_IDEP, nRowCount] := alRight;
            AlignCell[COL_ICAP, nRowCount] := alRight;
            AlignCell[COL_IFIN, nRowCount] := alRight;
            AlignCell[COL_IINT, nRowCount] := alRight;
            AlignCell[COL_ICOM, nRowCount] := alRight;
            AlignCell[COL_ITOT, nRowCount] := alRight;
            AlignCell[COL_IREM, nRowCount] := alRight;
            // Guarda la referencia de la posición inicial y final del crédito
            // en el grid
            if Qry.FieldByName('ID_CREDITO').AsInteger <> vlICredit then
            begin
              vgLInfoCred.Add( Format('%d=%d-%d',[vlICredit, vlIniPos, vlFinPos ] ) );
              vlIniPos  := nRowCount;
              vlICredit := Qry.FieldByName('ID_CREDITO').AsInteger;
              vgLInfoCred.Sort;
            end;
            //
            // Valida Descuento de documentos
            vlEsDescto := EsDescuento( Qry.FieldByName('ID_DOCUMENTO').AsString );
            // Determina si el saldo en la chequera cubre el adeudo de este pago
            vlBCobraPer:= ( Qry.FieldByName('SALDO_CHEQ').AsFloat >= Qry.FieldByName('TOTAL').AsFloat );
            // Determina si cambia el color del renglon
            if vlBCobraPer then AsignaColRow( cRowColor, nRowCount );
            //  Datos visibles en pantalla
            if Qry.FieldByName('GAR_FEGA').AsString = 'V' then
            begin
              Cells[ COL_GF, nRowCount ] := coPagoGF;
              vgLGarFEGA.Values[Qry.FieldByName('ID_CREDITO').AsString] := coPagoGF;  //'GF'
            end;//ends_if

            //HERJA 11/04/2011
            //- SE LLENA LA INFORMACION SI EL ACREDITADO ESTA EN RECUPERACION Y DESACTIVA LA
            //- CASILLA DE SELECCION
            Cells[COL_RECU,nRowCount] := Qry.FieldByName('EN_RECUPERACION').AsString;
            if Qry.FieldByName('EN_RECUPERACION').AsString='R' then
               vlBCobraPer:=FALSE;
            //FIN HERJA 11/04/2011               

            Cells[COL_LCM, nRowCount] := Objeto.BoolToStr( False );
            Cells[COL_SEL, nRowCount] := Objeto.BoolToStr( vlBCobraPer );
            Cells[COL_CRED,nRowCount] := Qry.FieldByName('ID_CREDITO').AsString;
            Cells[COL_DOCU,nRowCount] := Qry.FieldByName('ID_DOCUMENTO').AsString;
            Cells[COL_FVTO,nRowCount] := Qry.FieldByName('F_VENCIMIENTO').AsString;
            Cells[COL_FVAL,nRowCount] := DateToStr( vlFHoy );
            Cells[COL_IDEP,nRowCount] := Format(CFORMAT_DINERO,[ Qry.FieldByName('IMP_DEPOSITO').AsFloat ] );
            Cells[COL_ICAP,nRowCount] := Format(CFORMAT_DINERO,[ Qry.FieldByName('IMP_CAPITAL').AsFloat ]);
            Cells[COL_IFIN,nRowCount] := Format(CFORMAT_DINERO,[ Qry.FieldByName('IMP_FIN_ADIC').AsFloat ]);
            Cells[COL_IINT,nRowCount] := Format(CFORMAT_DINERO,[ Qry.FieldByName('IMP_INTERES').AsFloat ]);
            Cells[COL_ICOM,nRowCount] := Format(CFORMAT_DINERO,[ Qry.FieldByName('IMP_COMISION').AsFloat ]);
            Cells[COL_ITOT,nRowCount] := Format(CFORMAT_DINERO,[ ( Qry.FieldByName('TOTAL').AsFloat * WORD(vlBCobraPer) )] );
            //  Asigna el remanente
            vlRemanente := 0;
            if vlEsDescto then
            begin
              Objeto.StpObtRemanente( Qry.FieldByName('ID_CREDITO').AsInteger,
                     Qry.FieldByName('ID_DOCUMENTO').AsString, vlFHoy,
                     Qry.FieldByName('IMP_DEPOSITO').AsFloat,
                     Qry.FieldByName('FACT_MORAS').AsFloat,
                     vlRemanente, vlError );
            end;
            Cells[COL_IREM,nRowCount] := Format(CFORMAT_DINERO,[ vlRemanente ] );
            // Datos no visibles
            Cells[COL_IACR, nRowCount] := Qry.FieldByName('ID_ACREDITADO').AsString;
            Cells[COL_ACRE, nRowCount] := Qry.FieldByName('NOMBRE').AsString;
            Cells[COL_CTTO, nRowCount] := Qry.FieldByName('ID_CONTRATO').AsString;
            Cells[COL_FCTO, nRowCount] := Qry.FieldByName('FOL_CONTRATO').AsString;
            Cells[COL_CPRO, nRowCount] := Qry.FieldByName('CVE_PRODUCTO_CRE').AsString;
            Cells[COL_DPRO, nRowCount] := Qry.FieldByName('DESC_C_PRODUCTO').AsString;
            Cells[COL_CMON, nRowCount] := Qry.FieldByName('CVE_MONEDA').AsString;
            Cells[COL_DMON, nRowCount] := Qry.FieldByName('DESC_MONEDA').AsString;
            Cells[COL_CHEQ, nRowCount] := Qry.FieldByName('CHEQUERA').AsString;
            Cells[COL_SALD, nRowCount] := Qry.FieldByName('SALDO_CHEQ').AsString;
            Cells[COL_CREX, nRowCount] := Qry.FieldByName('ID_CRED_EXTERNO').AsString;
            Cells[COL_CTEX, nRowCount] := Qry.FieldByName('ID_CONTROL_EXT').AsString;
            Cells[COL_IMIN, nRowCount] := Qry.FieldByName('IMP_CREDITO').AsString;
            Cells[COL_IMVI, nRowCount] := Qry.FieldByName('SDO_INSOLUTO').AsString;
            Cells[COL_FINI, nRowCount] := Qry.FieldByName('F_INICIO').AsString;
            Cells[COL_FFIN, nRowCount] := Qry.FieldByName('F_VENTTO_DISP').AsString;
            Cells[COL_FMOR, nRowCount] := Qry.FieldByName('FACT_MORAS').AsString;
            Cells[COL_CESI, nRowCount] := Qry.FieldByName('ID_CESION').AsString;
            Cells[COL_BNAF, nRowCount] := Qry.FieldByName('B_OPERADO_NAFIN').AsString;
            Cells[COL_EMIS, nRowCount] := Qry.FieldByName('ID_EMISOR').AsString;
            Cells[COL_FPPA, nRowCount] := Qry.FieldByName('F_PROG_PAGO').AsString;
            Cells[COL_NPCO, nRowCount] := Qry.FieldByName('NUM_PER_COM').AsString;
            Cells[COL_NPIN, nRowCount] := Qry.FieldByName('NUM_PER_INT').AsString;
            Cells[COL_NPFA, nRowCount] := Qry.FieldByName('NUM_PER_FIN').AsString;
            Cells[COL_NPCP, nRowCount] := Qry.FieldByName('NUM_PER_CAP').AsString;
            Cells[COL_NPDO, nRowCount] := Qry.FieldByName('NUM_PERIODO_DOC').AsString;
            // Datos modificables de acuerdo a la selección del usuario
            Cells[COL_BCOP, nRowCount] := Qry.FieldByName('B_COB_ORD_PER').AsString;
            Cells[COL_BCOA, nRowCount] := Qry.FieldByName('B_COB_ORD_ACC').AsString;
            Cells[COL_BCTP, nRowCount] := Qry.FieldByName('B_COB_TOT_PER').AsString;
            Cells[COL_BCPA, nRowCount] := Qry.FieldByName('B_COB_PARCIAL').AsString;
            Cells[COL_BCCO, nRowCount] := Objeto.BoolToStr( vlBCobraPer );
            Cells[COL_BCIN, nRowCount] := Objeto.BoolToStr( vlBCobraPer );
            Cells[COL_BCFA, nRowCount] := Objeto.BoolToStr( vlBCobraPer );
            Cells[COL_BCCA, nRowCount] := Objeto.BoolToStr( vlBCobraPer );
            Cells[COL_BMCO, nRowCount] := Objeto.BoolToStr( False );
            Cells[COL_BMIN, nRowCount] := Objeto.BoolToStr( False );
            Cells[COL_BMFA, nRowCount] := Objeto.BoolToStr( False );
            Cells[COL_BMCA, nRowCount] := Objeto.BoolToStr( False );
            Cells[COL_FMCO, nRowCount] := Qry.FieldByName('FACT_MORAS').AsString;    // Factor de moratorios de comision
            Cells[COL_FMIN, nRowCount] := Qry.FieldByName('FACT_MORAS').AsString;    // Factor de moratorios de interes
            Cells[COL_FMFA, nRowCount] := Qry.FieldByName('FACT_MORAS').AsString;    // Factor de moratorios de financiamiento adicional
            Cells[COL_FMCA, nRowCount] := Qry.FieldByName('FACT_MORAS').AsString;    // Factor de moratorios de capital
            Cells[COL_MMCO, nRowCount] := Qry.FieldByName('IMP_MOR_CN').AsString;    // Moratorios de comision
            Cells[COL_MMIN, nRowCount] := Qry.FieldByName('IMP_MOR_IN').AsString;    // Moratorios de interes
            Cells[COL_MMFA, nRowCount] := Qry.FieldByName('IMP_MOR_FN').AsString;    // Moratorios de financiamiento adicional
            Cells[COL_MMCA, nRowCount] := Qry.FieldByName('IMP_MOR_CP').AsString;    // Moratorios de capital
            Cells[COL_IVCO, nRowCount] := Qry.FieldByName('B_APLICA_IVA').AsString;  // Aplica IVA de Moras de comision
            Cells[COL_IVIN, nRowCount] := Qry.FieldByName('B_APLICA_IVA').AsString;  // Aplica IVA de Moras de interes
            Cells[COL_IVFA, nRowCount] := Qry.FieldByName('B_APLICA_IVA').AsString;  // Aplica IVA de Moras de financiamiento adicional
            Cells[COL_IVCA, nRowCount] := Qry.FieldByName('B_APLICA_IVA').AsString;  // Aplica IVA de Moras de capital
            Cells[COL_CMCO, nRowCount] := Objeto.BoolToStr( False );                 // Condona moras de comision
            Cells[COL_CMIN, nRowCount] := Objeto.BoolToStr( False );                 // Condona moras de interes
            Cells[COL_CMFA, nRowCount] := Objeto.BoolToStr( False );                 // Condona moras de financiamiento adicional
            Cells[COL_CMCA, nRowCount] := Objeto.BoolToStr( False );                 // Condona moras de capital
            Cells[COL_BGFE, nRowCount] := Objeto.BoolToStr( False );
            Cells[COL_BGRF, nRowCount] := Objeto.BoolToStr( False );
            Cells[COL_FCAM, nRowCount] := Qry.FieldByName('FACT_MORAS').AsString;    // Factor de condonacion automatica de moratorios
            Cells[COL_BCAU, nRowCount] := Objeto.BoolToStr( False );
            Cells[COL_CPAG, nRowCount] := Objeto.BoolToStr( vlBCobraPer );
            Cells[COL_BAGF, nRowCount] := Qry.FieldByName('B_APLICA_GF').AsString;        // Aplica garantía FEGA
            Cells[COL_TREC, nRowCount] := Qry.FieldByName('TIPO_DETALLE').AsString;       // Tipo de Informacion de los periodos
            Cells[COL_INOM, nRowCount] := Qry.FieldByName('IMP_NOMINAL').AsString;        // Importe Nominal del documento
            Cells[COL_TPIN, nRowCount] := Qry.FieldByName('CVE_TIPO_INTERES').AsString;   // Tipo de pago de Interes
            if Qry.FieldByName('B_MULTI_CHQRA').AsString = 'V' THEN
              Cells[COL_MCQR, nRowCount] := coMultiChqra;
            //ends_if
            Cells[COL_GPY,  nRowCount] := Qry.FieldByName('B_APLICA_GP').AsString;   // Soporta Gtía PYME
            //<LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
            Cells[COL_BCPG, nRowCount] := '';
            Cells[COL_BPCT, nRowCount] := Qry.FieldByName('B_PORCENTAJE_PROD').AsString;
            Cells[COL_PCTC, nRowCount] := Qry.FieldByName('PCT_COMISION_PGAN').AsString;
            Cells[COL_IMPC, nRowCount] := Qry.FieldByName('IMP_COMISION_PGAN').AsString;
            Cells[COL_BMPC, nRowCount] := Qry.FieldByName('B_MODIFICA_PCT_PROD').AsString;
            Cells[COL_BMIM, nRowCount] := Qry.FieldByName('B_MODIFICA_IMP_PROD').AsString;
            Cells[COL_BPAN, nRowCount] := Qry.FieldByName('B_PAGO_ANT').AsString;
            Cells[COL_CCPA, nRowCount] := Qry.FieldByName('CVE_COMISION_PGAN').AsString;
            Cells[COL_CPAN, nRowCount] := '0.00';
            Cells[COL_CCAC, nRowCount] := Qry.FieldByName('B_COMIS_ACC').AsString;
            //</LOLS>
            //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
            Cells[COL_CLCA, nRowCount] := Qry.FieldByName('CVE_SUB_TIP_COB').AsString;
            //</LOLS>
            //
            // </ RABA > FEB 2011 PPP
            IF vlBCobraPer THEN
            Begin
              vlImpBlqCom := Objeto.StpValImpBloq(Qry.FieldByName('ID_CREDITO').AsInteger, Objeto.Apli.DameFechaEmpresa);
              If vlImpBlqCom  > 0 then
              Begin
                 MessageDlg('Existe importe comprometido en chequera del crédito:' +
                              Qry.FieldByName('ID_CREDITO').AsString +
                             ' por concepto de comisión: $' + FloatToStrF(vlImpBlqCom, ffNumber, 10,2),
                   mtInformation, [mbOK],0);
                 AddLine( MErrores, 'Existe importe comprometido en chequera del crédito:' +
                                    Qry.FieldByName('ID_CREDITO').AsString +
                                    ' por concepto de comisión: $' + FloatToStrF(vlImpBlqCom, ffNumber, 10,2) );
              End;
            end;
            // < RABA />
            vlFinPos  := nRowCount;
          end; //end with
          inc(nRowCount);
          Qry.Next;
          if not Qry.Eof then  //Incrementa un reglon
             sagDATOS.RowCount := sagDATOS.RowCount + 1;
          //
          Application.ProcessMessages;
        end; //end While
        //
        vgLInfoCred.Add( Format('%d=%d-%d',[vlICredit, vlIniPos, vlFinPos ] ) );
        //<LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
        ValidaPagoAnticipado;
        //</LOLS>
        //
        //<LOLS 03 NOV 2006 CREDITO EN LINEA>
        ValidaSaldoChqra(False);
        //</LOLS>
      end;
      Qry.Close;
      Qry.Free;
    end;
    //
  except
    on e : exception do begin
      DataFound := False;
    end;
  end;
  Searching := False;
end;
// +---------------------------------------------------------------------------+
// +       Habilita o deshabilita el evento onClic de los check box de cobro   +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.HabilitaChkBox( peHabilita : Boolean );
begin
  if peHabilita then                          // Habilita los eventos del checkbox
  begin
    cbB_IVA_MORA.OnClick   := cbB_IVA_MORAClick;
    cbB_COND_MORAS.OnClick := cbB_COND_MORASClick;
    cbGarFEGA.OnClick      := cbGarFEGAClick;
    //
    cbConceptos.OnClick    := cbCONCEPTOSClick;
    cbInteres.OnClick      := cbINTERESClick;
    cbFinAdic.OnClick      := cbFinAdicClick;
    cbCapital.OnClick      := cbCAPITALClick;
    cbTotal.OnClick        := cbTOTALClick;
  end else                                    // Deshabilita los eventos del checkbox
  begin
    cbB_IVA_MORA.OnClick   := nil;
    cbB_COND_MORAS.OnClick := nil;
    cbGarFEGA.OnClick      := nil;
    //
    cbConceptos.OnClick    := nil;
    cbInteres.OnClick      := nil;
    cbFinAdic.OnClick      := nil;
    cbCapital.OnClick      := nil;
    cbTotal.OnClick        := nil;
  end;
end;
//<LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
// +---------------------------------------------------------------------------+
// +          Habilita o deshabilita el evento OnClic del  rgTipoComision      +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.HabilitaEvPgAN(peHabilita: Boolean);
begin
  if peHabilita then
     rgTipoComision.OnClick := rgTipoComisionClick
  else
     rgTipoComision.OnClick := nil;
end;
// +---------------------------------------------------------------------------+
// +          Habilita o deshabilita el edit ieIMP_COM_PGAN                    +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.ShowHideEditPgAN;
begin
  if Objeto.StrToBool( Objeto.B_COM_X_PGAN.AsString ) then
  Begin
    ieIMP_COM_PGAN.ReadOnly := (  Objeto.StrToBool( Objeto.B_PCT_C_PGAN.AsString ) AND
                                ( Objeto.StrToBool( Objeto.B_PA_MOD_PCT_COM.AsString ) = False )
                               )OR
                               (  Objeto.StrToBool( Objeto.B_PCT_C_PGAN.AsString ) AND
                                ( Objeto.StrToBool( Objeto.B_PA_MOD_PCT_COM.AsString ) = False )
                               );
    //
    if Objeto.PCT_COM_PGAN.Control <> nil then
       Objeto.PCT_COM_PGAN.Control := nil;
    if Objeto.IMP_COM_PGAN.Control <> nil then
       Objeto.IMP_COM_PGAN.Control := nil;
    //
    if Objeto.StrToBool( Objeto.B_PCT_C_PGAN.AsString ) then
    Begin
       Objeto.PCT_COM_PGAN.Control := ieIMP_COM_PGAN;
       Objeto.PCT_COM_PGAN.DrawControl;
    End else
    Begin
       Objeto.IMP_COM_PGAN.Control := ieIMP_COM_PGAN;
       Objeto.IMP_COM_PGAN.DrawControl;
    End;
    //
  End;
  //
End;
// +---------------------------------------------------------------------------+
// +         Oculta o muestra los componente de pago anticipado                +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.ShowHideComPgAN;
begin
  lbPagoAnt.Visible       := Objeto.StrToBool( Objeto.B_COM_X_PGAN.AsString );
  ieIMP_COM_PGAN.Visible  := Objeto.StrToBool( Objeto.B_COM_X_PGAN.AsString );
  rgTipoComision.Visible  := Objeto.StrToBool( Objeto.B_COM_X_PGAN.AsString );
  ShowHideEditPgAN;
end;
//</LOLS>
// +---------------------------------------------------------------------------+
// +         Valida si existe un registro activo en la pantalla                +
// +---------------------------------------------------------------------------+
function TWCrcobranz.ExisteRegActivo : Boolean;
begin
  result := ( DataFound ) and ( Objeto.ID_CREDITO.AsInteger > 0 );
end;
// +---------------------------------------------------------------------------+
// + Obtiene los indices en el grid para obtener los valores de los parametros +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.ObtenIndicesParams( var idxFM, idxMM, idxIM, idxCM : Integer;
                                          var Accesorio : String );
begin
  Accesorio := '';
  case Objeto.COLUMNA_GRID.AsInteger of
    COL_ICOM : begin
                 idxFM     := COL_FMCO;
                 idxMM     := COL_MMCO;
                 idxIM     := COL_IVCO;
                 idxCM     := COL_CMCO;
                 Accesorio := coComis;
               end;
    COL_IINT : begin
                 idxFM     := COL_FMIN;
                 idxMM     := COL_MMIN;
                 idxIM     := COL_IVIN;
                 idxCM     := COL_CMIN;
                 Accesorio := coInteres;
               end;
    COL_IFIN : begin
                 idxFM     := COL_FMFA;
                 idxMM     := COL_MMFA;
                 idxIM     := COL_IVFA;
                 idxCM     := COL_CMFA;
                 Accesorio := coFinAdic;
               end;
    COL_ICAP : begin
                 idxFM     := COL_FMCA;
                 idxMM     := COL_MMCA;
                 idxIM     := COL_IVCA;
                 idxCM     := COL_CMCA;
                 Accesorio := coCapital;
               end
    else       begin
                 idxFM     := COL_FMCA;
                 idxMM     := COL_MMCA;
                 idxIM     := COL_IVCA;
                 idxCM     := COL_CMCA;
                 Accesorio := coTodos;
               end;
  end;
end;
// +---------------------------------------------------------------------------+
// +        Actualiza los datos del GRID a la estructura de datos actual       +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.GetFromGrid( peRowGrid, peColGrid : Integer);
var  idxFM  : Integer;
     idxMM  : Integer;
     idxIM  : Integer;
     idxCM  : Integer;
     Accesorio : String;
      //  Formato de moratorios
      function FactFromFrmFloat( FrmFloat: String ): Double;
      var c : variant;
      begin
        result := 0;
        try
          if FrmFloat <> '' then
          begin
            c      := FrmFloat;
            result := Double(c);
          end;//ends_if
        except
          result := 0;
        end;//ends_try..except
      end;//ends_function
begin
  Objeto.INDICE_GRID.AsInteger      := peRowGrid; // pasada por parámetro
  Objeto.COLUMNA_GRID.AsInteger     := peColGrid; // pasada por parámetro, generalmente se pasa como 0
  Objeto.NUM_PER_DOCTO.AsString     := sagDATOS.Cells[ COL_NPDO, peRowGrid ];
  Objeto.F_VENCIMIENTO.AsString     := sagDATOS.Cells[ COL_FVTO, peRowGrid ];
  Objeto.F_PROG_PAGO.AsString       := sagDATOS.Cells[ COL_FPPA, peRowGrid ];
  // DE LA SECCION DE INFORMACION GENERAL
  Objeto.ID_CONTRATO.AsString       := sagDATOS.Cells[ COL_CTTO, peRowGrid ];
  Objeto.FOL_CONTRATO.AsString      := sagDATOS.Cells[ COL_FCTO, peRowGrid ];
  Objeto.CVE_MONEDA.AsString        := sagDATOS.Cells[ COL_CMON, peRowGrid ];
  Objeto.DESC_MONEDA.AsString       := sagDATOS.Cells[ COL_DMON, peRowGrid ];
  Objeto.ID_CTO_LIQ.AsString        := sagDATOS.Cells[ COL_CHEQ, peRowGrid ];
  Objeto.SDO_CHEQUERA.AsString      := sagDATOS.Cells[ COL_SALD, peRowGrid ];
  Objeto.ID_CREDITO.AsString        := sagDATOS.Cells[ COL_CRED, peRowGrid ];
  Objeto.ID_CESION.AsString         := sagDATOS.Cells[ COL_CESI, peRowGrid ];
  Objeto.ID_DOCUMENTO.AsString      := sagDATOS.Cells[ COL_DOCU, peRowGrid ];
  Objeto.ID_CRED_EXTERNO.AsString   := sagDATOS.Cells[ COL_CREX, peRowGrid ];
  Objeto.ID_CONTROL_EXT.AsString    := sagDATOS.Cells[ COL_CTEX, peRowGrid ];
  Objeto.IMP_INI_DISP.AsString      := sagDATOS.Cells[ COL_IMIN, peRowGrid ];
  Objeto.IMP_VIG_DISP.AsString      := sagDATOS.Cells[ COL_IMVI, peRowGrid ];
  Objeto.F_INICIO.AsString          := sagDATOS.Cells[ COL_FINI, peRowGrid ];
  Objeto.F_VENTTO_DISP.AsString     := sagDATOS.Cells[ COL_FFIN, peRowGrid ];
  Objeto.CVE_PRODUCTO_CRE.AsString  := sagDATOS.Cells[ COL_CPRO, peRowGrid ];
  Objeto.DESC_C_PRODUCTO.AsString   := sagDATOS.Cells[ COL_DPRO, peRowGrid ];
  Objeto.ID_ACREDITADO.AsString     := sagDATOS.Cells[ COL_IACR, peRowGrid ];
  Objeto.NOMBRE_ACREDITADO.AsString := sagDATOS.Cells[ COL_ACRE, peRowGrid ];
  Objeto.B_MULTI_CHQRA.AsString     := Objeto.BoolToStr(sagDATOS.Cells[ COL_MCQR, peRowGrid ] = coMultiChqra);
  //
  HabilitaChkBox( False );      // Deshabilita los eventos de los check boxes para evitar que entre a los eventos
  // DE LA SECCION DE PARAMETROS
  ObtenIndicesParams(idxFM, idxMM, idxIM, idxCM, Accesorio );                      // Obtiene el valor de los indices
  Objeto.CVE_ACCESORIO.AsString     := Accesorio;                                  // Accesorio Activo
  //
  AsignaFVAlorPago  (StringToDate( sagDATOS.Cells[ COL_FVAL,     peRowGrid ] ) );  // Asigna la fecha valor de pago
  //
  AsignaFactorMoras (FactFromFrmFloat( sagDATOS.Cells[ idxFM,    peRowGrid ] ) );  // Asigna el factor de moratorios
  AsignaMontoMoras  (CurrFromFrmFloat( sagDATOS.Cells[ idxMM,    peRowGrid ] ) );  // Asigna el monto de moratorios  , pero la asignación es en base a los datos que se encuentran en ese momento en el grid
  Objeto.B_IVA_MORAS.AsString       := sagDATOS.Cells[ idxIM,    peRowGrid ];      // Asigna la bandera de IVA de moratorios
  Objeto.B_COND_MORAS.AsString      := sagDATOS.Cells[ idxCM,    peRowGrid ];      // Asigna la bandera de Cond. de moratorios
  //
  Objeto.B_GARANTIA_FEGA.AsString   := sagDATOS.Cells[ COL_BGFE, peRowGrid ];      // Asigna la bandera de Garantía FEGA
  AsignaMontoDeposito(CurrFromFrmFloat(sagDATOS.Cells[ COL_IDEP, peRowGrid ] ) );  // Asigna el monto de deposito
  // PARAMETROS DE COMISION
  Objeto.FAC_MORAS_CO.AsString      := sagDATOS.Cells[ COL_FMCO, peRowGrid ];
  Objeto.IMP_MORAS_CO.AsFloat       := CurrFromFrmFloat( sagDATOS.Cells[ COL_MMCO, peRowGrid ] );
  Objeto.B_IVA_MORA_CO.AsString     := sagDATOS.Cells[ COL_IVCO, peRowGrid ];
  Objeto.B_COND_MORA_CO.AsString    := sagDATOS.Cells[ COL_CMCO, peRowGrid ];
  // PARAMETROS DE INTERES
  Objeto.FAC_MORAS_IN.AsString      := sagDATOS.Cells[ COL_FMIN, peRowGrid ];
  Objeto.IMP_MORAS_IN.AsFloat       := CurrFromFrmFloat( sagDATOS.Cells[ COL_MMIN, peRowGrid ] );
  Objeto.B_IVA_MORA_IN.AsString     := sagDATOS.Cells[ COL_IVIN, peRowGrid ];
  Objeto.B_COND_MORA_IN.AsString    := sagDATOS.Cells[ COL_CMIN, peRowGrid ];
  // PARAMETROS DE FINANCIAMIENTO ADICIONAL
  Objeto.FAC_MORAS_FA.AsString      := sagDATOS.Cells[ COL_FMFA, peRowGrid ];
  Objeto.IMP_MORAS_FA.AsFloat       := CurrFromFrmFloat( sagDATOS.Cells[ COL_MMFA, peRowGrid ] );
  Objeto.B_IVA_MORA_FA.AsString     := sagDATOS.Cells[ COL_IVFA, peRowGrid ];
  Objeto.B_COND_MORA_FA.AsString    := sagDATOS.Cells[ COL_CMFA, peRowGrid ];
  // PARAMETROS DE CAPITAL
  Objeto.FAC_MORAS_CA.AsString      := sagDATOS.Cells[ COL_FMCA, peRowGrid ];
  Objeto.IMP_MORAS_CA.AsFloat       := CurrFromFrmFloat( sagDATOS.Cells[ COL_MMCA, peRowGrid ] );
  Objeto.B_IVA_MORA_CA.AsString     := sagDATOS.Cells[ COL_IVCA, peRowGrid ];
  Objeto.B_COND_MORA_CA.AsString    := sagDATOS.Cells[ COL_CMCA, peRowGrid ];
  // DE LA SECCION DE IMPORTES
  AsignaImpComision( CurrFromFrmFloat( sagDATOS.Cells[ COL_ICOM, peRowGrid ] ) );  // Asigna el monto de comision
  AsignaImpInteres ( CurrFromFrmFloat( sagDATOS.Cells[ COL_IINT, peRowGrid ] ) );  // Asigna el monto de comision
  AsignaImpFinAdic ( CurrFromFrmFloat( sagDATOS.Cells[ COL_IFIN, peRowGrid ] ) );  // Asigna el monto de comision
  AsignaImpCapital ( CurrFromFrmFloat( sagDATOS.Cells[ COL_ICAP, peRowGrid ] ) );  // Asigna el monto de comision
  Objeto.IMP_TOTAL.AsString         := sagDATOS.Cells[ COL_ITOT, peRowGrid ];
  Objeto.IMP_REMANENTE.AsString     := sagDATOS.Cells[ COL_IREM, peRowGrid ];
  //
  Objeto.IMP_COM_EVENTO.AsString    := sagDATOS.Cells[ COL_CPAN, peRowGrid ];
  // NUMEROS DE PERIODO
  Objeto.NUM_PER_COM.AsString       := sagDATOS.Cells[ COL_NPCO, peRowGrid ];
  Objeto.NUM_PER_INT.AsString       := sagDATOS.Cells[ COL_NPIN, peRowGrid ];
  Objeto.NUM_PER_FIN.AsString       := sagDATOS.Cells[ COL_NPFA, peRowGrid ];
  Objeto.NUM_PER_CAP.AsString       := sagDATOS.Cells[ COL_NPCP, peRowGrid ];
  //
  Objeto.B_MOD_IMP_COM.AsString     := sagDATOS.Cells[ COL_BMCO, peRowGrid ];
  Objeto.B_MOD_IMP_INT.AsString     := sagDATOS.Cells[ COL_BMIN, peRowGrid ];
  Objeto.B_MOD_IMP_FIN.AsString     := sagDATOS.Cells[ COL_BMFA, peRowGrid ];
  Objeto.B_MOD_IMP_CAP.AsString     := sagDATOS.Cells[ COL_BMCA, peRowGrid ];
  //
  Objeto.B_COB_COMISION.AsString    := sagDATOS.Cells[ COL_BCCO, peRowGrid ];
  Objeto.B_COB_INTERES.AsString     := sagDATOS.Cells[ COL_BCIN, peRowGrid ];
  Objeto.B_COB_FIN_ADIC.AsString    := sagDATOS.Cells[ COL_BCFA, peRowGrid ];
  Objeto.B_COB_CAPITAL.AsString     := sagDATOS.Cells[ COL_BCCA, peRowGrid ];
  Objeto.B_COB_TOTAL.AsString       := sagDATOS.Cells[ COL_SEL,  peRowGrid ];
  //
  Objeto.B_COB_ORD_PER.AsString     := sagDATOS.Cells[ COL_BCOP,  peRowGrid ];        // Banderas de cobranza 1
  Objeto.B_COB_ORD_ACC.AsString     := sagDATOS.Cells[ COL_BCOA,  peRowGrid ];        // Banderas de cobranza 2
  Objeto.B_COB_TOT_PER.AsString     := sagDATOS.Cells[ COL_BCTP,  peRowGrid ];        // Banderas de cobranza 3
  Objeto.B_COB_PARCIAL.AsString     := sagDATOS.Cells[ COL_BCPA,  peRowGrid ];        // Banderas de cobranza 4
  //
  HabilitaChkBox( True );       // HABILITA NUEVAMENTE LOS EVENTOS DE LOS CHECK BOXES
  //
  Objeto.B_CUBRE_PAGO.AsString      := sagDATOS.Cells[ COL_CPAG, peRowGrid ];
  Objeto.B_APLICA_GF.AsString       := sagDATOS.Cells[ COL_BAGF, peRowGrid ];
  Objeto.IMP_NOMINAL.AsString       := sagDATOS.Cells[ COL_INOM, peRowGrid ];
  Objeto.CVE_TIPO_INTERES.AsString  := sagDATOS.Cells[ COL_TPIN, peRowGrid ];
  Objeto.TIPO_DETALLE.AsString      := sagDATOS.Cells[ COL_TREC, peRowGrid ];
  //
  Objeto.B_GTIA_PYME.AsString       := sagDATOS.Cells[ COL_GPY,  peRowGrid ];
  //<LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
  HabilitaEvPgAN(False);
  Objeto.B_COM_X_PGAN.AsString      := sagDATOS.Cells[ COL_BCPG, peRowGrid ];
  Objeto.B_PCT_C_PGAN.AsString      := sagDATOS.Cells[ COL_BPCT, peRowGrid ];
  Objeto.PCT_COM_PGAN.AsFloat       := CurrFromFrmFloat( sagDATOS.Cells[ COL_PCTC, peRowGrid ] );
  Objeto.IMP_COM_PGAN.AsFloat       := CurrFromFrmFloat( sagDATOS.Cells[ COL_IMPC, peRowGrid ] );
  Objeto.B_PA_MOD_PCT_COM.AsString  := sagDATOS.Cells[ COL_BMPC, peRowGrid ];
  Objeto.B_PA_MOD_IMP_COM.AsString  := sagDATOS.Cells[ COL_BMIM, peRowGrid ];
  ShowHideComPgAN;
  HabilitaEvPgAN(True);
  //</LOLS>
  //
  //LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT
  Objeto.CVE_SUB_TIP_COB.AsString   := sagDATOS.Cells[ COL_CLCA, peRowGrid ];
  //</ENDS_LOLS_24_AGO_2006>
  //
  //<AARJ 03 DIC 2009 SE HABILITA BOTON PARA ASIGNAR IMPORTES EN ORDEN DE PRELACION CUANDO EL SALDO DE LA CHEQUERA NO CUBRE EL PAGO TOTAL>
  // Sólo si no se cubre el pago con el saldo de la chequera, se puede asignar los importes en el orden de prelacion  y además el saldo en chequera > 0
  btnAParcialXDisp.Enabled := ((Objeto.B_CUBRE_PAGO.AsString = 'F') and (Objeto.SDO_CHEQUERA.AsFloat > 0) );
  //</ENDS AARJ 03 DIC 2009>
end;
// +---------------------------------------------------------------------------+
// +                     Obtiene los valores de la pantalla                    +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.GetFromControls;
begin
  // DE LA SECCION DE PARAMETROS
  Objeto.F_VALOR_PAGO.GetFromControl;
  Objeto.FACT_MORAS.GetFromControl;
  Objeto.MONTO_MORAS.GetFromControl;
  Objeto.IMP_DEP_GAR_FEGA.GetFromControl;
  Objeto.B_IVA_MORAS.GetFromControl;
  Objeto.B_COND_MORAS.GetFromControl;
  Objeto.B_GARANTIA_FEGA.GetFromControl;
  // DE LA SECCION DE IMPORTES
  Objeto.IMP_COMISION.GetFromControl;
  Objeto.IMP_INTERES.GetFromControl;
  Objeto.IMP_FIN_ADIC.GetFromControl;
  Objeto.IMP_CAPITAL.GetFromControl;
  Objeto.IMP_TOTAL.GetFromControl;
  //
  Objeto.B_COB_COMISION.GetFromControl;
  Objeto.B_COB_INTERES.GetFromControl;
  Objeto.B_COB_FIN_ADIC.GetFromControl;
  Objeto.B_COB_CAPITAL.GetFromControl;
  Objeto.B_COB_TOTAL.GetFromControl;
end;
// +---------------------------------------------------------------------------+
// +                       Regresa  los valores al GRID                        +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.UpdateToGrid;
var peRowGrid : Integer;
begin
  peRowGrid := Objeto.INDICE_GRID.AsInteger;
  // DE LA SECCION DE PARAMETROS
  sagDATOS.Cells[ COL_FVAL, peRowGrid ] := Objeto.F_VALOR_PAGO.AsString;
  sagDATOS.Cells[ COL_IDEP, peRowGrid ] := Format( cFormat_Dinero,[ Objeto.IMP_DEP_GAR_FEGA.AsFloat ] );
  sagDATOS.Cells[ COL_BGFE, peRowGrid ] := Objeto.B_GARANTIA_FEGA.AsString;
  // Factor de moras
  sagDATOS.Cells[ COL_FMCO, peRowGrid ] := Objeto.FAC_MORAS_CO.AsString;
  sagDATOS.Cells[ COL_FMIN, peRowGrid ] := Objeto.FAC_MORAS_IN.AsString;
  sagDATOS.Cells[ COL_FMFA, peRowGrid ] := Objeto.FAC_MORAS_FA.AsString;
  sagDATOS.Cells[ COL_FMCA, peRowGrid ] := Objeto.FAC_MORAS_CA.AsString;
  // Monto de moras
  sagDATOS.Cells[ COL_MMCO, peRowGrid ] := Objeto.IMP_MORAS_CO.AsString;
  sagDATOS.Cells[ COL_MMIN, peRowGrid ] := Objeto.IMP_MORAS_IN.AsString;
  sagDATOS.Cells[ COL_MMFA, peRowGrid ] := Objeto.IMP_MORAS_FA.AsString;
  sagDATOS.Cells[ COL_MMCA, peRowGrid ] := Objeto.IMP_MORAS_CA.AsString;
  // IVA de Moras
  sagDATOS.Cells[ COL_IVCO, peRowGrid ] := Objeto.B_IVA_MORA_CO.AsString;
  sagDATOS.Cells[ COL_IVIN, peRowGrid ] := Objeto.B_IVA_MORA_IN.AsString;
  sagDATOS.Cells[ COL_IVFA, peRowGrid ] := Objeto.B_IVA_MORA_FA.AsString;
  sagDATOS.Cells[ COL_IVCA, peRowGrid ] := Objeto.B_IVA_MORA_CA.AsString;
  // Condona moratorios
  sagDATOS.Cells[ COL_CMCO, peRowGrid ] := Objeto.B_COND_MORA_CO.AsString;
  sagDATOS.Cells[ COL_CMIN, peRowGrid ] := Objeto.B_COND_MORA_IN.AsString;
  sagDATOS.Cells[ COL_CMFA, peRowGrid ] := Objeto.B_COND_MORA_FA.AsString;
  sagDATOS.Cells[ COL_CMCA, peRowGrid ] := Objeto.B_COND_MORA_CA.AsString;
  //
  // DE LA SECCION DE IMPORTES
  sagDATOS.Cells[ COL_ICOM, peRowGrid ] := Format( cFormat_Dinero,[ Objeto.IMP_COMISION.AsFloat  ] );
  sagDATOS.Cells[ COL_IINT, peRowGrid ] := Format( cFormat_Dinero,[ Objeto.IMP_INTERES.AsFloat   ] );
  sagDATOS.Cells[ COL_IFIN, peRowGrid ] := Format( cFormat_Dinero,[ Objeto.IMP_FIN_ADIC.AsFloat  ] );
  sagDATOS.Cells[ COL_ICAP, peRowGrid ] := Format( cFormat_Dinero,[ Objeto.IMP_CAPITAL.AsFloat   ] );
  sagDATOS.Cells[ COL_ITOT, peRowGrid ] := Format( cFormat_Dinero,[ Objeto.IMP_TOTAL.AsFloat     ] );
  sagDATOS.Cells[ COL_IREM, peRowGrid ] := Format( cFormat_Dinero,[ Objeto.IMP_REMANENTE.AsFloat ] );
  //
  sagDATOS.Cells[ COL_BMCO, peRowGrid ] := Objeto.B_MOD_IMP_COM.AsString;
  sagDATOS.Cells[ COL_BMIN, peRowGrid ] := Objeto.B_MOD_IMP_INT.AsString;
  sagDATOS.Cells[ COL_BMFA, peRowGrid ] := Objeto.B_MOD_IMP_FIN.AsString;
  sagDATOS.Cells[ COL_BMCA, peRowGrid ] := Objeto.B_MOD_IMP_CAP.AsString;
  //
  sagDATOS.Cells[ COL_BCCO, peRowGrid ] := Objeto.B_COB_COMISION.AsString;
  sagDATOS.Cells[ COL_BCIN, peRowGrid ] := Objeto.B_COB_INTERES.AsString;
  sagDATOS.Cells[ COL_BCFA, peRowGrid ] := Objeto.B_COB_FIN_ADIC.AsString;
  sagDATOS.Cells[ COL_BCCA, peRowGrid ] := Objeto.B_COB_CAPITAL.AsString;
  sagDATOS.Cells[ COL_SEL,  peRowGrid ] := Objeto.B_COB_TOTAL.AsString;
  //
  sagDATOS.Cells[ COL_CPAG, peRowGrid ] := Objeto.B_CUBRE_PAGO.AsString;
  //<LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
  sagDATOS.Cells[ COL_BPCT, peRowGrid ] := Objeto.B_PCT_C_PGAN.AsString;
  sagDATOS.Cells[ COL_PCTC, peRowGrid ] := Objeto.PCT_COM_PGAN.AsString;
  sagDATOS.Cells[ COL_IMPC, peRowGrid ] := Objeto.IMP_COM_PGAN.AsString;
  sagDATOS.Cells[ COL_BMPC, peRowGrid ] := Objeto.B_PA_MOD_PCT_COM.AsString;
  sagDATOS.Cells[ COL_BMIM, peRowGrid ] := Objeto.B_PA_MOD_IMP_COM.AsString;
  //</LOLS>
end;
// +---------------------------------------------------------------------------+
// +    Obtiene los importes de capital, interes, conceptos y el monto moras   +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.ObtImportes;
  function _ObtPer( peIdDocumento : String; peNumPerX : Integer; peNumPerDoc : Integer ): Integer;
  begin
    if EsDescuento( peIdDocumento ) then
      result := peNumPerDoc
    else
      result := peNumPerX;
  end;
var  vlError            : String;
     vlImporte          : Double;
     vlIVA              : Double;
     vlBenBco           : Double;
     vlBenGob           : Double;
     vlMoras            : Double;
     vlIVAMoras         : Double;
     vlTotal            : Double;
     vlPeriodo          : Integer;
     vlBObtImp          : Boolean;
     vlGMoras           : Double;
     vlGIVAMoras        : Double;
     vlGTotal           : Double;
     //
     i                  : integer;
     vlCrComis          : TCrComis;
     vlImpComis         : Double;
     vlImpMorCom        : Double;
     vlIVAMorCom        : Double;
     Qry                : TQuery;
     //
     vlBComision        : Boolean;
     //
     vlSqlPer           : String;
begin
  // +-------------------------------------------------------------------------+
  // |                            COMISION                                     |
  // +-------------------------------------------------------------------------+
  // Obtiene el importe de financiamiento adicional
  vlBObtImp := ( ( Objeto.TIPO_PARAM.AsInteger    = coFecha    ) or
                 ( Objeto.CVE_ACCESORIO.AsString  = coTodos    ) or
                 ( Objeto.CVE_ACCESORIO.AsString  = coComis  ) );
  // Obtiene el importe de comisión
  if ( vlBObtImp ) then
  begin
    vlBComision := True;
    vlTotal     := 0;
    vlMoras     := 0;
    vlIVAMoras  := 0;
    //
    if Assigned( Objeto.vgLCrComis ) then
    begin
      for i := 0 to Objeto.vgLCrComis.count - 1 do
      begin
        if Assigned( Objeto.vgLCrComis.Items[ i ] ) then
        begin
          vlCrComis := Objeto.vgLCrComis.Items[ i ];
          if ( vlCrComis.id_credito    = Objeto.ID_CREDITO.AsInteger     ) and
             ( vlCrComis.f_vencimiento = Objeto.F_VENCIMIENTO.AsDateTime ) and
             ( vlCrComis.f_prog_pago   = Objeto.F_PROG_PAGO.AsDateTime   ) then
          begin
            vlBComision   := False;
            Objeto.StpObtAdeudo( Objeto.ID_CREDITO.AsInteger,
                                 vlCrComis.num_periodo,                         // vlPeriodo,
                                 vlCrComis.cve_comision,                        // '',
                                 Objeto.F_VALOR_PAGO.AsDateTime,
                                 vlCrComis.fact_moras_cn,                       // Objeto.FAC_MORAS_CO.AsFloat,
                                 vlCrComis.b_iva_mora_cn,                       // Objeto.B_IVA_MORA_CO.AsString,
                                 coComis,    vlImpComis,  vlImporte,   vlIVA,
                                 vlBenBco,   vlBenGob,    vlImpMorCom, vlIVAMorCom,
                                 vlError );
            vlCrComis.monto_moras := vlImpMorCom + vlIVAMorCom;
            //
            if vlCrComis.b_mod_imp_com = 'F' then
              vlCrComis.imp_pago_con  := vlImpComis;
            //ends_if
            vlTotal     := vlTotal    + vlCrComis.imp_pago_con;
            vlMoras     := vlMoras    + vlImpMorCom;
            vlIVAMoras  := vlIVAMoras + vlIVAMorCom;
          end;
        end;
      end;
    end;
    //
    if vlBComision then
    begin
      Qry := GetSQLQueryNoNil( BuildSQLStrCom( Objeto.CobToCveCob( Objeto.COBRANZA.AsString),
                             Objeto.ID_CREDITO.AsInteger, Objeto.F_VENCIMIENTO.AsDateTime,
                             Objeto.F_PROG_PAGO.AsDateTime ), Objeto.Apli.DataBaseName,
                             Objeto.Apli.SessionName, False );
      //
      if Assigned(Qry) and not( Qry.IsEmpty ) then
      begin
        while not Qry.Eof do
        begin
          Objeto.StpObtAdeudo( Qry.FieldByName('ID_CREDITO').AsInteger,
                               Qry.FieldByName('NUM_PERIODO').AsInteger,
                               Qry.FieldByName('CVE_COMISION').AsString,
                               Objeto.F_VALOR_PAGO.AsDateTime,
                               Objeto.FAC_MORAS_CO.AsFloat,
                               Objeto.B_IVA_MORA_CO.AsString,
                               coComis,  vlImpComis, vlImporte,   vlIVA,
                               vlBenBco, vlBenGob,   vlImpMorCom, vlIVAMorCom,
                               vlError  );
          vlTotal     := vlTotal    + vlImpComis;
          vlMoras     := vlMoras    + vlImpMorCom;
          vlIVAMoras  := vlIVAMoras + vlIVAMorCom;
          Qry.Next;
        end;//ends_if
      end;
      if Assigned(Qry) then
      begin
        Qry.Close;        Qry.Free;
      end;
    end;
    //
    if ( Objeto.B_MOD_IMP_COM.AsString = cFalso ) then
      AsignaImpComision( vlTotal );
    //ends_if
    Objeto.IMP_MORAS_CO.AsFloat := vlMoras + vlIVAMoras;
    if Objeto.CVE_ACCESORIO.AsString = coComis then
      AsignaMontoMoras ( Objeto.IMP_MORAS_CO.AsFloat );
    //ends_if
    //
  end;//ends_if
  //
  // Obtiene el importe de interes
  vlBObtImp := ( ( Objeto.TIPO_PARAM.AsInteger   = coFecha    ) or
                 ( Objeto.CVE_ACCESORIO.AsString = coTodos    ) or
                 ( Objeto.CVE_ACCESORIO.AsString = coInteres  ) );
  if vlBObtImp then
  begin
    if Objeto.TIPO_DETALLE.AsString = coDetalle then
    begin
      with Objeto do
        vlPeriodo := _ObtPer( ID_DOCUMENTO.AsString, NUM_PER_INT.AsInteger, NUM_PER_DOCTO.AsInteger );
      //
      vlSqlPer := Format( 'SELECT %d NUM_PERIODO FROM DUAL', [ vlPeriodo ] );
    end else if Objeto.TIPO_DETALLE.AsString = coResumen then begin
      vlSqlPer := Format( 'SELECT I.NUM_PERIODO FROM CR_INTERES I WHERE I.ID_CREDITO = %d AND %s',
                          [ Objeto.ID_CREDITO.AsInteger, coSqlPagoANSitIN ] );
    end;
    //
    Qry := GetSQLQueryNoNil( vlSqlPer, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
    //
    vlGMoras    := 0;
    vlGIVAMoras := 0;
    vlGTotal    := 0;
    //
    if Assigned(Qry) and (Qry.IsEmpty = False ) then
    begin
      Qry.First;
      while not Qry.eof do
      begin
        // Obtiene los importes de interes
        Objeto.StpObtAdeudo( Objeto.ID_CREDITO.AsInteger,
                             Qry.FieldByName('NUM_PERIODO').AsInteger,
                             '',
                             Objeto.F_VALOR_PAGO.AsDateTime,
                             Objeto.FAC_MORAS_IN.AsFloat,
                             Objeto.B_IVA_MORA_IN.AsString,
                             coInteres,  vlTotal,     vlImporte,
                             vlIVA,      vlBenBco,    vlBenGob,
                             vlMoras,    vlIVAMoras,  vlError );
        vlGMoras    := vlGMoras    + vlMoras;
        vlGIVAMoras := vlGIVAMoras + vlIVAMoras;
        vlGTotal    := vlGTotal    + vlTotal;
        Qry.Next;
      end;
      Qry.Close;
      Qry.Free;
    end;
    // Modificación sobre intereses
    if ( Objeto.B_MOD_IMP_INT.AsString = cFalso ) then
      AsignaImpInteres ( vlGTotal );
    //ends_if

    Objeto.IMP_MORAS_IN.AsFloat := vlGMoras + vlGIVAMoras;
    if Objeto.CVE_ACCESORIO.AsString = coInteres then
       AsignaMontoMoras ( Objeto.IMP_MORAS_IN.AsFloat );
    //ends_if
  end;
  //
  // Obtiene el importe de financiamiento adicional
  vlBObtImp := ( ( Objeto.TIPO_PARAM.AsInteger    = coFecha    ) or
                 ( Objeto.CVE_ACCESORIO.AsString  = coTodos    ) or
                 ( Objeto.CVE_ACCESORIO.AsString  = coFinAdic  ) );
  if vlBObtImp then
  begin
    if Objeto.TIPO_DETALLE.AsString = coDetalle then
    begin
      with Objeto do
        vlPeriodo := _ObtPer( ID_DOCUMENTO.AsString, NUM_PER_FIN.AsInteger, NUM_PER_DOCTO.AsInteger );
      //
      vlSqlPer := Format( 'SELECT %d NUM_PERIODO FROM DUAL', [ vlPeriodo ] );
    end else if Objeto.TIPO_DETALLE.AsString = coResumen then begin
      vlSqlPer := Format( 'SELECT FN.NUM_PERIODO FROM CR_FINAN_ADIC FN WHERE FN.ID_CREDITO = %d AND %s',
                          [ Objeto.ID_CREDITO.AsInteger, coSqlPagoANSitFN ] );
    end;
    //
    Qry := GetSQLQueryNoNil( vlSqlPer, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
    //
    vlGMoras    := 0;
    vlGIVAMoras := 0;
    vlGTotal    := 0;
    //
    if Assigned(Qry) and (Qry.IsEmpty = False ) then
    begin
      Qry.First;
      while not Qry.eof do
      begin
        // Obtiene los importes de financiamiento adicional
        Objeto.StpObtAdeudo( Objeto.ID_CREDITO.AsInteger,
                             Qry.FieldByName('NUM_PERIODO').AsInteger,
                             '',
                             Objeto.F_VALOR_PAGO.AsDateTime,
                             Objeto.FAC_MORAS_FA.AsFloat,
                             Objeto.B_IVA_MORA_FA.AsString,
                             coFinAdic, vlTotal,    vlImporte,
                             vlIVA,     vlBenBco,   vlBenGob,
                             vlMoras,   vlIVAMoras, vlError );
        //
        vlGMoras    := vlGMoras    + vlMoras;
        vlGIVAMoras := vlGIVAMoras + vlIVAMoras;
        vlGTotal    := vlGTotal    + vlTotal;
        Qry.Next;
      end;
      Qry.Close;
      Qry.Free;
    end;
    // Modificacion sobre financiamiento adicional
    if ( Objeto.B_MOD_IMP_FIN.AsString = cFalso ) then
      AsignaImpFinAdic ( vlGTotal );
    //ends_if

    Objeto.IMP_MORAS_FA.AsFloat := vlGMoras + vlGIVAMoras;
    if Objeto.CVE_ACCESORIO.AsString = coFinAdic then
      AsignaMontoMoras ( Objeto.IMP_MORAS_FA.AsFloat );
    //ends_if
  end;//ends_if
  //
  // Obtiene el importe de Capital
  vlBObtImp := ( ( Objeto.TIPO_PARAM.AsInteger   = coFecha    ) or
                 ( Objeto.CVE_ACCESORIO.AsString = coTodos    ) or
                 ( Objeto.CVE_ACCESORIO.AsString = coCapital  ) );
  if vlBObtImp then
  begin
    //
    if Objeto.TIPO_DETALLE.AsString = coDetalle then
    begin
      with Objeto do
        vlPeriodo := _ObtPer( ID_DOCUMENTO.AsString, NUM_PER_CAP.AsInteger, NUM_PER_DOCTO.AsInteger );
      //
      vlSqlPer := Format( 'SELECT %d NUM_PERIODO FROM DUAL', [ vlPeriodo ] );
    end else if Objeto.TIPO_DETALLE.AsString = coResumen then begin
      vlSqlPer := Format( 'SELECT C.NUM_PERIODO FROM CR_CAPITAL C WHERE C.ID_CREDITO = %d AND %s',
                          [ Objeto.ID_CREDITO.AsInteger, coSqlPagoANSitCP ] );
    end;
    //
    Qry := GetSQLQueryNoNil( vlSqlPer, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
    //
    vlGMoras    := 0;
    vlGIVAMoras := 0;
    vlGTotal    := 0;
    //
    // Obtiene los importes de capital
    //
    if Assigned(Qry) and (Qry.IsEmpty = False ) then
    begin
      Qry.First;
      while not Qry.eof do
      begin
        Objeto.StpObtAdeudo( Objeto.ID_CREDITO.AsInteger,
                             Qry.FieldByName('NUM_PERIODO').AsInteger,
                             '',
                             Objeto.F_VALOR_PAGO.AsDateTime,
                             Objeto.FAC_MORAS_CA.AsFloat,
                             Objeto.B_IVA_MORA_CA.AsString,
                             coCapital,  vlTotal,      vlImporte,
                             vlIVA,      vlBenBco,     vlBenGob,
                             vlMoras,    vlIVAMoras,   vlError );
        //
        vlGMoras    := vlGMoras    + vlMoras;
        vlGIVAMoras := vlGIVAMoras + vlIVAMoras;
        vlGTotal    := vlGTotal    + vlTotal;
        Qry.Next;
      end;
      Qry.Close;
      Qry.Free;
    end;
    //
    if ( Objeto.B_MOD_IMP_CAP.AsString = cFalso ) then
       AsignaImpCapital ( vlGTotal );
    //ends_if
    Objeto.IMP_MORAS_CA.AsFloat := vlGMoras + vlGIVAMoras;
    if ( Objeto.CVE_ACCESORIO.AsString = coCapital ) or( Objeto.CVE_ACCESORIO.AsString = coTodos ) then
      AsignaMontoMoras ( Objeto.IMP_MORAS_CA.AsFloat );
    //
  end;//ends_if
End;

// +---------------------------------------------------------------------------+
// +                      Suma los importes de este pago                       +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.SumaImportes;
var vlImpTotal    : Double;
    vlTmpImpTotal : Double;
    vlUsrImpTotal : Double;
    vlSdoChequera : Double;
  //
  Function FunObtFactor( peBandera : String ): Double;
  begin
    result := 0;
    if peBandera = 'V' then
      result := 1;
    //ends_if
  end;
begin
  with Objeto do
  begin
    //
    vlTmpImpTotal     := IMP_COMISION.AsFloat + IMP_INTERES.AsFloat +
                         IMP_FIN_ADIC.AsFloat + IMP_CAPITAL.AsFloat;
    //
    IMP_TOTAL.AsFloat := IMP_COMISION.AsFloat * FunObtFactor( B_COB_COMISION.AsString ) +
                         IMP_INTERES.AsFloat  * FunObtFactor( B_COB_INTERES.AsString  ) +
                         IMP_FIN_ADIC.AsFloat * FunObtFactor( B_COB_FIN_ADIC.AsString ) +
                         IMP_CAPITAL.AsFloat  * FunObtFactor( B_COB_CAPITAL.AsString  );
    //
    FillChar( vlUsrImpTotal, sizeof( vlUsrImpTotal ), #0 );
    FillChar( vlSdoChequera, sizeof( vlSdoChequera ), #0 );
    FillChar( vlImpTotal,    sizeof( vlImpTotal ),    #0 );
    //
    vlUsrImpTotal  := StrToFloat( FloatToStr( IMP_TOTAL.AsFloat     ) );
    vlSdoChequera  := StrToFloat( FloatToStr( SDO_CHEQUERA.AsFloat  ) );
    vlImpTotal     := StrToFloat( FloatToStr( vlTmpImpTotal         ) );
    //
  end;
  //
  if ( ( vlUsrImpTotal <= vlSdoChequera  ) and ( vlUsrImpTotal > 0  ) ) or    // ¿ alcanza para cobrarlo ?
     ( ( vlImpTotal    <= vlSdoChequera  ) and ( vlImpTotal    > 0  ) ) then  // ¿ Puede ser cobrado ?
  begin
    Objeto.B_CUBRE_PAGO.AsString := 'V';
    AsignaColRow( cRowColor, Objeto.INDICE_GRID.AsInteger );
  end else
  begin
    Objeto.B_CUBRE_PAGO.AsString := 'F';
    AsignaColRow( clWindow, Objeto.INDICE_GRID.AsInteger );
  end;
end;


function TWCrcobranz.TipoCapitalVPN: Boolean;
var vlsql       : String;
    vlResult    : Boolean;
    Qry         : TQuery;
begin
   vlsql:= 'SELECT CVE_CAL_CAPITAL FROM CR_PRODUCTO WHERE CVE_PRODUCTO_CRE = ' +  Objeto.CVE_PRODUCTO_CRE.AsSQL;
   Qry := TQuery.Create(Self);
   Try
     Qry.SessionName := Objeto.SessionName;
     Qry.DataBaseName := Objeto.DataBaseName;
     Qry.SQL.Clear;
     Qry.SQL.Add(vlSql);
     Qry.Open;
     While Not Qry.Eof Do
      Begin
         if Qry.FieldByName('CVE_CAL_CAPITAL').AsString = 'VPN' THEN
            vlResult := True;
     Qry.Next;
     End;
   Finally
     If Assigned(Qry) Then
     Begin Qry.Close; Qry.Free; End;
   End;
   TipoCapitalVPN := vlResult;
end;



// +---------------------------------------------------------------------------+
// +    Realiza los calculos derivados de el cambio de valor de un parametro   +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.CalculaCobranza( BObtImp : Boolean );
var vlImpRem : Double;
    vlError  : String;
begin
  // OBTIENE LOS IMPORTES DE COMISION, INTERES Y CAPITAL DE MANERA GLOBAL
  if BObtImp then
    ObtImportes;
  //ends_if
  // CALCULA EL TOTAL DEL PAGO
  SumaImportes;
  // OBTIENE EL REMANENTE SI SE TRATA DE DESCUENTO DE DOCUMENTOS.
  if EsDescuento( Objeto.ID_DOCUMENTO.AsString ) then
  begin
   { EASA4011  31.ENE.2007
    if Objeto.CVE_TIPO_INTERES.AsString = 'VE' then
      Objeto.IMP_DEP_GAR_FEGA.AsFloat := Objeto.IMP_NOMINAL.AsFloat +
                                         Objeto.IMP_INTERES.AsFloat;
    //ends_if
   EASA4011  31.ENE.2007 }
    Objeto.StpObtRemanente( Objeto.ID_CREDITO.AsInteger,
                            Objeto.ID_DOCUMENTO.AsString,
                            Objeto.F_VALOR_PAGO.AsDateTime,
                            Objeto.IMP_DEP_GAR_FEGA.AsFloat,
                            Objeto.FACT_MORAS.AsFloat,
                            vlImpRem,  vlError );
    Objeto.IMP_REMANENTE.AsFloat := vlImpRem;
  end;//ends_if




//ROIM 012009 DESC MERCANTIL, SE INCORPORA COBRANZA POR MONTO NOMINAL
//EN EL CASO DE QUE SE TRATE DE UN PAGO ANTICIPADO FECHA VALOR...

    if ((TipoCapitalVPN) and (Objeto.F_VENCIMIENTO.AsDateTime > Objeto.F_VALOR_PAGO.AsDateTime))  then
       Objeto.IMP_DEP_GAR_FEGA.AsFloat := Objeto.IMP_CAPITAL.AsFloat;
    //end if       

////ROIM

end;
// +---------------------------------------------------------------------------+
// +    Realiza las modificaciones derivadas de un cambio en algun parametro   +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.ProcesaCambio;
begin
  GetFromControls;        // Salva la información de la pantalla al registro actual
  if not cbFiltroChqra.Checked then
    CalculaCobranza(true);  // Hace el calculo de los importes
  UpdateToGrid;     // Regresa los valores al GRID.
  //
  if cbFiltroChqra.Checked then
  begin
    AsignaMontoCredito( Objeto.ID_CREDITO.AsInteger, -1, -1, Objeto.SDO_CHEQUERA.AsFloat );
  end;
  //
  GetFromGrid( Objeto.INDICE_GRID.AsInteger, Objeto.COLUMNA_GRID.AsInteger );
  DrawControls;     // Regresa los valores a la pantalla
end;
// +---------------------------------------------------------------------------+
// +  Realiza las modificaciones derivadas de un cambio en el importe x cobrar +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.ProcesaImportes;
begin
  GetFromControls;
  SumaImportes;
  DrawControls;
  UpdateToGrid;
end;
// +---------------------------------------------------------------------------+
// +       Marca o desmarca los check boxes de la cobranza segun sea el caso   +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.ValidaChkCobranza(pRoot: Boolean);
var
  vlImpBlqCom:Double;
begin
  HabilitaChkBox( False ); // Deshabilita los eventos
  //
  Objeto.B_COB_COMISION.GetFromControl;
  Objeto.B_COB_INTERES.GetFromControl;
  Objeto.B_COB_FIN_ADIC.GetFromControl;
  Objeto.B_COB_CAPITAL.GetFromControl;
  Objeto.B_COB_TOTAL.GetFromControl;
  //
  if ( pRoot ) then        // Asigna la informacion
  begin
    Objeto.B_COB_COMISION.AsString := Objeto.B_COB_TOTAL.AsString;
    Objeto.B_COB_INTERES.AsString  := Objeto.B_COB_TOTAL.AsString;
    Objeto.B_COB_FIN_ADIC.AsString := Objeto.B_COB_TOTAL.AsString;
    Objeto.B_COB_CAPITAL.AsString  := Objeto.B_COB_TOTAL.AsString;
  end else
  begin
    Objeto.B_COB_TOTAL.AsString := Objeto.BoolToStr(
                                     Objeto.StrToBool( Objeto.B_COB_COMISION.AsString ) or
                                      Objeto.StrToBool( Objeto.B_COB_INTERES.AsString  ) or
                                     Objeto.StrToBool( Objeto.B_COB_FIN_ADIC.AsString ) or
                                     Objeto.StrToBool( Objeto.B_COB_CAPITAL.AsString  )
                                   );
  end;//ends_if
  HabilitaChkBox( True ); // Habilita los eventos
  SumaImportes;
  //
  UpdateToGrid;        // Regresa los valores al GRID.
  DrawControls;        // y los pinta en pantalla
  {
  //<LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
  CalcImpBaseAN( Objeto.ID_CREDITO.AsInteger, 0, 0, Objeto.B_COB_FIN_ADIC.AsString,
                 Objeto.B_COB_CAPITAL.AsString,  Objeto.INDICE_GRID.AsInteger );
  //</LOLS>
  }
  // </ RABA > FEB 2012 PPP
  IF Objeto.StrToBool( Objeto.B_COB_COMISION.AsString ) THEN
  Begin
    vlImpBlqCom := Objeto.StpValImpBloq(Objeto.ID_CREDITO.AsInteger, Objeto.Apli.DameFechaEmpresa);
    If vlImpBlqCom  > 0 then
       MessageDlg('Existe importe bloqueado en chequera por concepto de comisión por: $' + FloatToStrF(vlImpBlqCom, ffNumber, 10,2),
                   mtInformation, [mbOK],0);
  End;
  // < RABA />

end;
// +---------------------------------------------------------------------------+
// +   Valida si una disposicion tiene GF ejercida, pide la confirmacion del   +
// +                            usuario para cobrarla                          +
// +---------------------------------------------------------------------------+
function TWCrcobranz.ValidaGFEjercida( peIdCredito : Integer ): Boolean;
begin
  Result := True;  // por default regresa True,
  if vgLGarFEGA.IndexOfName( IntToStr( peIdCredito ) ) >= 0  then
  begin
    if ( vgLGarFEGA.Values[ IntToStr( peIdCredito ) ] = coPagoGF ) then //    coPagoGF = 'GF'
    begin
      Result := ( MessageDlg( Format( coGFAplicada, [ peIdCredito ] ),
                                      mtConfirmation, mbYesNoCancel, 0 ) = mrYes ); // 'La disposición %d tiene garantía FEGA ejercida.' + coCRLF +
      vgLGarFEGA.Values[ IntToStr( peIdCredito ) ] := Objeto.BoolToStr(Result);  // Regresa 'V' si se pasa TRUE como parámetro o 'F'
    end else
      Result := Objeto.StrToBool( vgLGarFEGA.Values[ IntToStr( peIdCredito ) ] ); // result := ( peValor = 'V' );
    //ends_if
  end;
end;
// +---------------------------------------------------------------------------+
// +      Realiza los cambios del factor de moras indicado por el usuario      +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.UserCambiaFactorMoras(peFactor: Double);
var i  : integer;
    vlCrComis : TCrComis;
begin
  if      ( Objeto.CVE_ACCESORIO.AsString = coComis   ) or ( Objeto.CVE_ACCESORIO.AsString = coTodos ) then
  begin
    Objeto.FAC_MORAS_CO.AsFloat := peFactor;
    if Assigned( Objeto.vgLCrComis ) then
    begin
      for i := 0 to Objeto.vgLCrComis.count - 1 do
      begin
        if Assigned( Objeto.vgLCrComis.Items[ i ] ) then
        begin
          vlCrComis := Objeto.vgLCrComis.Items[ i ];
          if ( vlCrComis.id_credito    = Objeto.ID_CREDITO.AsInteger     ) and
             ( vlCrComis.f_vencimiento = Objeto.F_VENCIMIENTO.AsDateTime ) and
             ( vlCrComis.f_prog_pago   = Objeto.F_PROG_PAGO.AsDateTime   ) then
          begin
            vlCrComis.fact_moras_cn := Objeto.FAC_MORAS_CO.AsFloat;
          end;
        end;
      end;
    end;
  end;
  if ( Objeto.CVE_ACCESORIO.AsString = coInteres ) or ( Objeto.CVE_ACCESORIO.AsString = coTodos ) then
    Objeto.FAC_MORAS_IN.AsFloat := peFactor;
  //ends_if
  if ( Objeto.CVE_ACCESORIO.AsString = coFinAdic ) or ( Objeto.CVE_ACCESORIO.AsString = coTodos ) then
    Objeto.FAC_MORAS_FA.AsFloat := peFactor;
  //ends_if
  if ( Objeto.CVE_ACCESORIO.AsString = coCapital ) or ( Objeto.CVE_ACCESORIO.AsString = coTodos ) then
    Objeto.FAC_MORAS_CA.AsFloat := peFactor;
  //ends_if
end;
// +---------------------------------------------------------------------------+
// +        Realiza los cambios del IVA de moras indicado por el usuario       +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.UserCambiaIVAMoras( peBIVA : String );
var i  : integer;
    vlCrComis : TCrComis;
begin
  if      ( Objeto.CVE_ACCESORIO.AsString = coComis   ) or ( Objeto.CVE_ACCESORIO.AsString = coTodos ) then
  begin
    Objeto.B_IVA_MORA_CO.AsString := peBIVA;
    if Assigned( Objeto.vgLCrComis ) then
    begin
      for i := 0 to Objeto.vgLCrComis.count - 1 do
      begin
        if Assigned( Objeto.vgLCrComis.Items[ i ] ) then
        begin
          vlCrComis := Objeto.vgLCrComis.Items[ i ];
          if ( vlCrComis.id_credito    = Objeto.ID_CREDITO.AsInteger     ) and
             ( vlCrComis.f_vencimiento = Objeto.F_VENCIMIENTO.AsDateTime ) and
             ( vlCrComis.f_prog_pago   = Objeto.F_PROG_PAGO.AsDateTime   ) then
          begin
            vlCrComis.b_iva_mora_cn := Objeto.B_IVA_MORA_CO.AsString;
          end;
        end;
      end;
    end;
  end;
  if ( Objeto.CVE_ACCESORIO.AsString = coInteres ) or ( Objeto.CVE_ACCESORIO.AsString = coTodos ) then
    Objeto.B_IVA_MORA_IN.AsString := peBIVA;
  //
  if ( Objeto.CVE_ACCESORIO.AsString = coFinAdic ) or ( Objeto.CVE_ACCESORIO.AsString = coTodos ) then
    Objeto.B_IVA_MORA_FA.AsString := peBIVA;
  //
  if ( Objeto.CVE_ACCESORIO.AsString = coCapital ) or ( Objeto.CVE_ACCESORIO.AsString = coTodos ) then
    Objeto.B_IVA_MORA_CA.AsString := peBIVA;
  //ends_if
end;
// +---------------------------------------------------------------------------+
// + Realiza los cambios del Condonación de moratorios indicado por el usuario +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.UserCambiaCondMoras( peBCondona : String);
var i  : integer;
    vlCrComis : TCrComis;
begin
  if      ( Objeto.CVE_ACCESORIO.AsString = coComis   ) or ( Objeto.CVE_ACCESORIO.AsString = coTodos ) then
  begin
    Objeto.B_COND_MORA_CO.AsString := peBCondona;
    if Assigned( Objeto.vgLCrComis ) then
    begin
      for i := 0 to Objeto.vgLCrComis.count - 1 do
      begin
        if Assigned( Objeto.vgLCrComis.Items[ i ] ) then
        begin
          vlCrComis := Objeto.vgLCrComis.Items[ i ];
          if ( vlCrComis.id_credito    = Objeto.ID_CREDITO.AsInteger     ) and
             ( vlCrComis.f_vencimiento = Objeto.F_VENCIMIENTO.AsDateTime ) and
             ( vlCrComis.f_prog_pago   = Objeto.F_PROG_PAGO.AsDateTime   ) then
          begin
            vlCrComis.b_cond_mora_cn := Objeto.B_COND_MORA_CO.AsString;
          end;
        end;
      end;
    end;
  end;
  //
  if ( Objeto.CVE_ACCESORIO.AsString = coInteres ) or ( Objeto.CVE_ACCESORIO.AsString = coTodos ) then
    Objeto.B_COND_MORA_IN.AsString := peBCondona;
  //
  if ( Objeto.CVE_ACCESORIO.AsString = coFinAdic ) or ( Objeto.CVE_ACCESORIO.AsString = coTodos ) then
    Objeto.B_COND_MORA_FA.AsString := peBCondona;
  //
  if ( Objeto.CVE_ACCESORIO.AsString = coCapital ) or ( Objeto.CVE_ACCESORIO.AsString = coTodos ) then
    Objeto.B_COND_MORA_CA.AsString := peBCondona;
  //ends_if
end;
// +---------------------------------------------------------------------------+
// +     Obtiene la pestaña en la que se va a ubicar al realiar una consulta   +
// +---------------------------------------------------------------------------+
function TWCrcobranz.ObtenPestana: String;
begin
  Result := '';
  if Objeto.COBRANZA.AsString = coCobMD then
    Result := 'AC'
  else if Objeto.COBRANZA.AsString = coCobAN then
  begin
    if Objeto.ID_CESION.AsInteger > 0 then
      Result := 'AC'
    else
      Result := 'PA';
  end else if Objeto.COBRANZA.AsString = coCobIM then
    Result := 'IM'
  else
    Result := '';
  //ends_if
end;
//
//
procedure TWCrcobranz.FmtCurrEdit(Sender: TEdit);
begin
  if Assigned(Sender) then
    if not ( FormatFloat(coFmtCurrency, CurrFromFrmFloat(Sender.Text) ) = Sender.Text  ) then
    begin
      Sender.Text := FormatFloat(coFmtCurrency, CurrFromFrmFloat(Sender.Text));
    end;
end;

procedure TWCrcobranz.HabilitaCobAN;
begin
  if Searching then exit; // Valida que no exista una busqueda en curso ...
  Objeto.TIPO_COB_ANT.GetFromControl;

  rgSUB_TIPO_COB_ANT.Enabled := ( Objeto.COBRANZA.AsString = coCobAN ) AND
                                //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
                                ( Objeto.StrToBool( Objeto.B_HABILITA_AN.AsString) ) AND
                                ( Objeto.TIPO_FILTRO.AsString = cobpDisp ) AND
                                //<ENDS_LOLS_24_AGO_2006>
                                ( Objeto.TIPO_COB_ANT.AsString = coPA );
  cbB_TRANSFERENCIA.Enabled  := ( Objeto.COBRANZA.AsString = coCobAN  ) AND
                                //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
                                ( Objeto.StrToBool( Objeto.B_HABILITA_AN.AsString) ) AND
                                ( Objeto.TIPO_FILTRO.AsString = cobpDisp ) AND
                                //<ENDS_LOLS_24_AGO_2006>
                                ( Objeto.TIPO_COB_ANT.AsString = coMA );
  //
  if ( rgSUB_TIPO_COB_ANT.Enabled ) then
  begin
    Objeto.SUB_TIPO_COB_ANT.GetFromControl;
    if ( Objeto.SUB_TIPO_COB_ANT.AsString = '' ) then
      Objeto.SUB_TIPO_COB_ANT.AsString := coAP;
  end;
end;

//<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
procedure TWCrcobranz.ResetCobAN;
var NE1 : TNotifyEvent;
begin
  NE1 := rgTIPO_COB_ANT.OnClick;
  rgTIPO_COB_ANT.OnClick := nil;
  Objeto.TIPO_COB_ANT.AsString := coTD;
  Objeto.TIPO_COB_ANT.DrawControl;
  rgTIPO_COB_ANT.OnClick := NE1;
end;


procedure TWCrcobranz.ValidaCobAN;
const coSqlSubTipCob = 'SELECT L.CVE_SUB_TIP_COB'     + coCRLF +
                       'FROM   CR_CREDITO C,    '     + coCRLF +
                       '       CR_CONTRATO L    '     + coCRLF +
                       'WHERE  C.ID_CREDITO   = %d '  + coCRLF +
                       '  AND  L.ID_CONTRATO  = C.ID_CONTRATO' + coCRLF +
                       '  AND  L.FOL_CONTRATO = C.FOL_CONTRATO';
var vlSubTipCob    : String;
    vlSqlSubTipCob : String;
    NotifyEvent1   : TNotifyEvent;
    NotifyEvent2   : TNotifyEvent;
begin
  try
    Objeto.B_HABILITA_AN.AsString := Objeto.BoolToStr(False); // <-- 'F'
    if ( Objeto.TIPO_FILTRO.AsString = cobpDisp ) and ( Objeto.COBRANZA.AsString = coCobAN ) then  // Disposicion y tipo de cobranza Anticipada
    begin
      vlSqlSubTipCob := Format(coSqlSubTipCob, [ Objeto.VALOR_FILTRO.AsInteger ] );
      GetSQLStr( vlSqlSubTipCob, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
                 'CVE_SUB_TIP_COB', vlSubTipCob, False );
      if ( vlSubTipCob = coAP ) or ( vlSubTipCob = coDM ) then
      begin
        NotifyEvent1 := rgTIPO_COB_ANT.OnClick;
        NotifyEvent2 := rgSUB_TIPO_COB_ANT.OnClick;
        rgTIPO_COB_ANT.OnClick     := nil;
        rgSUB_TIPO_COB_ANT.OnClick := nil;
        //
        Objeto.TIPO_COB_ANT.AsString     := coPA;
        Objeto.SUB_TIPO_COB_ANT.AsString := vlSubTipCob;
        //
        Objeto.TIPO_COB_ANT.GetFromControl;
        Objeto.SUB_TIPO_COB_ANT.GetFromControl;
        //
        rgTIPO_COB_ANT.OnClick     := NotifyEvent1;
        rgSUB_TIPO_COB_ANT.OnClick := NotifyEvent2;
      end else
        Objeto.B_HABILITA_AN.AsString    := Objeto.BoolToStr(True);
    end;
  except
      on e : exception do
        MessageDlg( e.Message, mtError, [mbOk], 0 );
  end;
end;
//</ENDS_LOLS_24_AGO_2006>
// +---------------------------------------------------------------------------+
// +                                                                           +
// +                                                                           +
// +                          EVENTOS DE LA FORMA                              +
// +                                                                           +
// +                                                                           +
// +---------------------------------------------------------------------------+
//
//
// +---------------------------------------------------------------------------+
// +                       Evento OnCreate de la forma                         +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.FormCreate(Sender: TObject);
begin
  vgLGarFEGA  := TStringList.Create;
  vgLInfoCred := TStringList.Create;
  vgAplicaAsignacionAtodos := False;
  vgHuboGarantias := False;
  {$WARNINGS OFF}
  CrCobAnti  := TCrCobAnti.Create(nil); //<LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
  {$WARNINGS ON}
end;

// +---------------------------------------------------------------------------+
// +                       Evento OnShow de la forma                           +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.FormShow(Sender: TObject);
begin
  Searching := True;
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
  //
  Objeto.CrContrato.ParamCre := Objeto.ParamCre;
  Objeto.Credito.ParamCre    := Objeto.ParamCre;
  Objeto.Cesion.ParamCre     := Objeto.ParamCre;
  Objeto.Documento.ParamCre  := Objeto.ParamCre;
  Objeto.Producto.ParamCre   := Objeto.ParamCre;
  //
  {CONTROLES DE FILTROS}
  Objeto.VALOR_FILTRO.Control     := edValorFiltro;
  Objeto.TIPO_COB_ANT.Control     := rgTIPO_COB_ANT;
  Objeto.SUB_TIPO_COB_ANT.Control := rgSUB_TIPO_COB_ANT;
  Objeto.B_TRANSFERENCIA.Control  := cbB_TRANSFERENCIA;
  Objeto.B_REPORTADOS.Control     := cbReportados;
  //
  {INFORMACION GENERAL DE LA DISPOSICION}
  Objeto.ID_CONTRATO.Control       := edID_CONTRATO;
  Objeto.DESC_MONEDA.Control       := edDESC_MONEDA;
  Objeto.ID_CTO_LIQ.Control        := edID_CTO_LIQ;
  Objeto.SDO_CHEQUERA.Control      := edSDO_CHEQUERA;
  Objeto.ID_CREDITO.Control        := edID_CREDITO;
  Objeto.ID_CRED_EXTERNO.Control   := edID_CRED_EXTERNO;
  Objeto.ID_CONTROL_EXT.Control    := edID_CONTROL_EXT;
  Objeto.IMP_INI_DISP.Control      := edIMP_INI_DISP;
  Objeto.IMP_VIG_DISP.Control      := edIMP_VIG_DISP;
  Objeto.F_INICIO.Control          := edF_INICIO;
  Objeto.F_VENTTO_DISP.Control     := edF_VENTTO_DISP;
  Objeto.DESC_C_PRODUCTO.Control   := edDESC_C_PRODUCTO;
  Objeto.NOMBRE_ACREDITADO.Control := lbNOMBRE_ACREDITADO;
  //Informacion de la seccion de parametros
  Objeto.F_VALOR_PAGO.Control      := edFECHA;
  Objeto.FACT_MORAS.Control        := edFAC_MORAS;
  Objeto.MONTO_MORAS.Control       := edMONTO_MORAS;
  Objeto.IMP_DEP_GAR_FEGA.Control  := edIMP_DEPOSITO;
  Objeto.B_IVA_MORAS.Control       := cbB_IVA_MORA;
  Objeto.B_COND_MORAS.Control      := cbB_COND_MORAS;
  Objeto.B_GARANTIA_FEGA.Control   := cbGarFEGA;
  //Informacion de la seccion de importes
  Objeto.IMP_COMISION.Control  := edCONCEPTOS;
  Objeto.IMP_INTERES.Control   := edINTERES;
  Objeto.IMP_FIN_ADIC.Control  := edFinAdic;
  Objeto.IMP_CAPITAL.Control   := edCAPITAL;
  Objeto.IMP_TOTAL.Control     := edTOTAL;
  //
  Objeto.NUM_PER_COM.Control  := lbNumPerCom;
  Objeto.NUM_PER_INT.Control  := lbNumPerInt;
  Objeto.NUM_PER_FIN.Control  := lbNumPerFin;
  Objeto.NUM_PER_CAP.Control  := lbNumPerCap;
  //
  Objeto.B_COB_COMISION.Control := cbConceptos;
  Objeto.B_COB_INTERES.Control  := cbInteres;
  Objeto.B_COB_FIN_ADIC.Control := cbFinAdic;
  Objeto.B_COB_CAPITAL.Control  := cbCapital;
  Objeto.B_COB_TOTAL.Control    := cbTotal;
  //<LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
  Objeto.B_PCT_C_PGAN.Control   := rgTipoComision;
  //</LOLS>
  
  {Inicializa filtros de los buscadores en pantalla}
  Objeto.CatProdGpo.BuscaWhereString := 'CR_PRODUCTO_GPO.CVE_PRODUCTO_GPO IN ' +
                                        '(SELECT DISTINCT CVE_PRODUCTO_GPO ' +
                                        'FROM CR_PRODUCTO '    +
                                        'WHERE ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa)+
                                        ')';
  Objeto.CatProdGpo.FilterString      := Objeto.CatProdGpo.BuscaWhereString;
  //
  Objeto.CatContrato.BuscaWhereString := 'PKGCRACTUALIZA.STPOBTEMPCTTO(CR_CONTRATO.ID_CONTRATO)= ' + // LOLS 08 SEP 2005
                                         IntToStr(Objeto.Apli.IdEmpresa);                            // LOLS 08 SEP 2005
  Objeto.CatContrato.FilterString     := Objeto.CatContrato.BuscaWhereString;
  //
  Objeto.CatCredito.BuscaWhereString  := 'PKGCRACTUALIZA.STPOBTEMPCTTO(CR_CREDITO.ID_CONTRATO)= ' +  // LOLS 08 SEP 2005
                                         IntToStr(Objeto.Apli.IdEmpresa);                            // LOLS 08 SEP 200
  Objeto.CatCredito.FilterString      := Objeto.CatCredito.BuscaWhereString;
  //
  // Inicializa valores por default
  pupGpoProducto.OnClick(pupGpoProducto);       // TWCrcobranz.oeTipoFiltroClick(Sender: TObject);
  pupCobProgramada.OnClick(pupCobProgramada);   // TWCrcobranz.oeCOBRANZAClick(Sender: TObject); 
  Objeto.B_REPORTADOS.AsString := CVerdad;      // En IntGenCre CVERDAD = 'V';
  Objeto.TIPO_COB_ANT.AsString := coTD;         // Tipo de Cobranza Anticipada : coTD = 'TD';  // Tradicional
  //
  {Muestra la información inicial en la pantalla}
  Searching := False;
  //
  InterForma1.MsgPanel := pnlMsgs;
  LimpiaPantalla;   //  1. Barre el grid de datos y quita la información;
                    //  2. Limpia el registro de datos;
                    //  3. Limpia los edits de la pantalla;
                    //  4. Limpia la lista de disposiciones con garantia FEGA (vgLGarFEGA.Clear;)

  CrCobAnti.Apli := Objeto.Apli; //<LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
  //
  //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
  Objeto.B_HABILITA_AN.AsString := Objeto.BoolToStr(True); // Regresa 'V'|'F'
  //<ENDS_LOLS_24_AGO_2006>
  cbMuestraRSRE.Checked:=false;
end;
// +---------------------------------------------------------------------------+
// +                   Evento OnClose de la forma                              +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
// +---------------------------------------------------------------------------+
// +                   Evento OnDestroy de la forma                            +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.FormDestroy(Sender: TObject);
var pResult  : Integer;
    pTxResult: String;
begin
  {CONTROLES DE FILTROS}
  Objeto.VALOR_FILTRO.Control    := nil;
  Objeto.TIPO_COB_ANT.Control    := nil;
  Objeto.SUB_TIPO_COB_ANT.Control:= nil;
  Objeto.B_TRANSFERENCIA.Control := nil;
  Objeto.B_REPORTADOS.Control    := nil;
  {INFORMACION GENERAL DE LA DISPOSICION}
  Objeto.ID_CONTRATO.Control       := nil;
  Objeto.DESC_MONEDA.Control       := nil;
  Objeto.ID_CTO_LIQ.Control        := nil;
  Objeto.SDO_CHEQUERA.Control      := nil;
  Objeto.ID_CREDITO.Control        := nil;
  Objeto.ID_CRED_EXTERNO.Control   := nil;
  Objeto.ID_CONTROL_EXT.Control    := nil;
  Objeto.IMP_INI_DISP.Control      := nil;
  Objeto.IMP_VIG_DISP.Control      := nil;
  Objeto.F_INICIO.Control          := nil;
  Objeto.F_VENTTO_DISP.Control     := nil;
  Objeto.DESC_C_PRODUCTO.Control   := nil;
  Objeto.NOMBRE_ACREDITADO.Control := nil;
  {INFORMACION DE LA SECCION DE PARAMETROS}
  Objeto.F_VALOR_PAGO.Control      := nil;
  Objeto.FACT_MORAS.Control        := nil;
  Objeto.MONTO_MORAS.Control       := nil;
  Objeto.IMP_DEP_GAR_FEGA.Control  := nil;
  Objeto.B_IVA_MORAS.Control       := nil;
  Objeto.B_COND_MORAS.Control      := nil;
  Objeto.B_GARANTIA_FEGA.Control   := nil;
  {INFORMACION DE LA SECCION DE IMPORTES}
  Objeto.IMP_COMISION.Control      := nil;
  Objeto.IMP_INTERES.Control       := nil;
  Objeto.IMP_FIN_ADIC.Control      := nil;
  Objeto.IMP_CAPITAL.Control       := nil;
  Objeto.IMP_TOTAL.Control         := nil;
  //
  Objeto.NUM_PER_COM.Control       := nil;
  Objeto.NUM_PER_INT.Control       := nil;
  Objeto.NUM_PER_FIN.Control       := nil;
  Objeto.NUM_PER_CAP.Control       := nil;
  //
  Objeto.B_COB_COMISION.Control    := nil;
  Objeto.B_COB_INTERES.Control     := nil;
  Objeto.B_COB_FIN_ADIC.Control    := nil;
  Objeto.B_COB_CAPITAL.Control     := nil;
  Objeto.B_COB_TOTAL.Control       := nil;
  //<LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
  Objeto.B_PCT_C_PGAN.Control      := nil;
  if Objeto.PCT_COM_PGAN.Control <> nil then Objeto.PCT_COM_PGAN.Control := nil;
  if Objeto.IMP_COM_PGAN.Control <> nil then Objeto.IMP_COM_PGAN.Control := nil;
  //</LOLS>
  //
  Objeto.stpLimpiaMultiChqra(pResult, pTxResult );
  //
  if Assigned(vgLGarFEGA) then
    vgLGarFEGA.Free;
  //
  if Assigned(vgLInfoCred) then
    vgLInfoCred.Free;
  //
  //<LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
  if Assigned(CrCobAnti) then
    CrCobAnti.Free;
  //</LOLS>
end;
// +---------------------------------------------------------------------------+
// +       Evento OnClic para los filtros adicionales de busqueda              +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.oeFiltroAdicionalClick(Sender: TObject);
begin
  if ( Sender is TComponent ) then
    if ( Sender is TMenuItem ) then
    begin
      ( Sender as TMenuItem ).Checked := True;
      Objeto.FILTRO_OPERADO_NAFIN.AsString := '';
      Objeto.FILTRO_TIPO_INTERES.AsString  := '';
      { OPERADO NAFIN / NO OPERADO NAFIN }
      if RecNafin.Checked then
        Objeto.FILTRO_OPERADO_NAFIN.AsString := ' AND CS.B_OPERADO_NAFIN  (+)= ''V'' ';

      if RecPropios.Checked then
        Objeto.FILTRO_OPERADO_NAFIN.AsString := ' AND CS.B_OPERADO_NAFIN  (+)= ''F'' ';
      { INTERESES ANTICIPADOS / INTERESES AL VENCIMIENTO }
      if IntAnticipado.Checked then
        Objeto.FILTRO_TIPO_INTERES.AsString  := ' AND CS.CVE_TIPO_INTERES (+)= ''AN'' ';
      if IntVentto.Checked then
        Objeto.FILTRO_TIPO_INTERES.AsString  := ' AND CS.CVE_TIPO_INTERES (+)= ''VE'' ';
      //
      MuestraDatos;
    end;//ends_if_(_Sender is TMenuItem ) then
    //ends_if_(_Sender_is_TComponent_)_then
end;
// +---------------------------------------------------------------------------+
// +                   Evento OnClic del Tipo de busqueda                      +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.oeTipoFiltroClick(Sender: TObject);
begin
  if ( Sender is TComponent ) then
    Objeto.TIPO_FILTRO.AsInteger :=( Sender as TComponent ).Tag;  // 1 si Sender = pupGpoProducto
  //
  if ( Sender is TMenuItem ) then
     ( Sender as TMenuItem ).Checked := True;
  //
  ResetCobAN; //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
  rgTIPO_COB_ANT.Enabled    := False; 
  //
  pupCobIndistinta.Enabled  := ( ( Objeto.TIPO_FILTRO.AsString = cobpDisp   ) OR   // 4
                                 ( Objeto.TIPO_FILTRO.AsString = cobpIdFIRA ) OR   // 7
                                 ( Objeto.TIPO_FILTRO.AsString = cobpNoCtrl )      // 8
                               );

  if ( (pupCobIndistinta.Enabled = False ) and ( pupCobIndistinta.Checked ) ) then
  begin
    Searching  := True;
    pupCobProgramada.OnClick(pupCobProgramada); //  TWCrcobranz.oeCOBRANZAClick(Sender: TObject);
    Searching  := False;
  end;//
  //
  if ( Sender is TMenuItem ) then
    if ( Sender as TMenuItem ).GroupIndex = 1 then
      LimpiaPantalla;
  //
  SetTipoFiltro;
end;
// +---------------------------------------------------------------------------+
// +                   Evento OnClic para Filtros Especiales                   +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.OrigenRecursosClick(Sender: TObject);
begin
{
  if ( Sender is TComponent ) then
    Objeto.COBRANZA.AsInteger :=( Sender as TComponent ).Tag;
  //
  if ( Sender is TMenuItem ) then
     ( Sender as TMenuItem ).Checked := True;
  //
}

end;
// +---------------------------------------------------------------------------+
// +                Evento Onclic del Botón de Busqueda                        +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.oeCOBRANZAClick(Sender: TObject);
begin
  if ( Sender is TComponent ) then
    Objeto.COBRANZA.AsInteger :=( Sender as TComponent ).Tag;
  //
  if ( Sender is TMenuItem ) then
     ( Sender as TMenuItem ).Checked := True;
  //
  //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
  //rgTIPO_COB_ANT.Enabled     := ( Objeto.COBRANZA.AsString = coCobAN );
  //
  ResetCobAN;
  ValidaCobAN;
  rgTIPO_COB_ANT.Enabled     := ( Objeto.COBRANZA.AsString = coCobAN ) AND
                                ( Objeto.StrToBool( Objeto.B_HABILITA_AN.AsString) );
  //</LOLS_24_AGO_2006>
  //
  HabilitaCobAN;
  //
  MuestraDatos;
end;
// +---------------------------------------------------------------------------+
// +          Evento OnClic que activa o desactiva el filtro  de búsqueda      +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.cbFiltroClick(Sender: TObject);
begin
  if cbFiltro.Checked and ( Searched = False ) then
  begin
    cbFiltro.Checked := False
  end else if ( cbFiltro.Checked = False ) and ( Searched = True ) then
  begin
    LimpiaFiltro;
    LimpiaPantalla;
  end;//ends_if
  cbFiltro.Enabled := cbFiltro.Checked;
  MuestraHints;
end;
// +---------------------------------------------------------------------------+
// +              Evento OnClic del boton de busqueda del filtro               +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.btnFiltroClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOBRANZ_FILTR',True,True) then
   begin
      if BeginSearch( True, [] ) then
      begin
        //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
        if ( Objeto.COBRANZA.AsString = coCobAN ) then
        begin
          ValidaCobAN;
          rgTIPO_COB_ANT.Enabled := ( Objeto.StrToBool( Objeto.B_HABILITA_AN.AsString) );
          HabilitaCobAN;
        end;
        //</LOLS 24 AGO 2006>
        MuestraDatos;
      end;//ends_if
   end;
end;
// +---------------------------------------------------------------------------+
// +                Evento Ejecuta del InterLinkIt en el filtro                +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.ikValorFiltroEjecuta(Sender: TObject);
begin
  //
  if ( StrToIntDef(ikValorFiltro.Buffer, -1 ) <> -1 ) and // Si la entrada es numerica y el
     ( Objeto.TIPO_FILTRO.AsString =  cobpGpoProd ) then  // filtro es grupo producto, asigna
    oeTipoFiltroClick( pupDisposicion );                  // filtro por disposicion
  //
  if BeginSearch( False, [ ikValorFiltro.Buffer ] ) then
  begin
    //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
    if ( Objeto.COBRANZA.AsString = coCobAN ) then
    begin
      ValidaCobAN;
      rgTIPO_COB_ANT.Enabled := ( Objeto.StrToBool( Objeto.B_HABILITA_AN.AsString) );
      HabilitaCobAN;
    end;
    //</LOLS 24 AGO 2006>
    MuestraDatos;
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +                Evento Onclic del GroupBox Tipo Cob Ant                    +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.rgTIPO_COB_ANTClick(Sender: TObject);
begin
  HabilitaCobAN;
  MuestraDatos;
end;
//<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
procedure TWCrcobranz.rgSUB_TIPO_COB_ANTClick(Sender: TObject);
begin
  if DataFound then
  begin
    Objeto.SUB_TIPO_COB_ANT.GetFromControl;
    ValidaPagoAnticipado;
  end;
end;
//</ENDS_LOLS_24_AGO_2006>
// +---------------------------------------------------------------------------+
// +                Evento Onclic del CheckBox Reportados                      +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.cbReportadosClick(Sender: TObject);
begin
  MuestraDatos;
end;
//<LOLS 01 NOV 2006. CREDITO EN LINEA>
// +---------------------------------------------------------------------------+
// +                Evento Onclic del CheckBox Con Saldo en Chequera           +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.cbFiltroChqraClick(Sender: TObject);
begin
  MuestraDatos;
end;
//</ENDS_LOLS_01_NOV_2006>
// +---------------------------------------------------------------------------+
// +                 Da Formato al Saldo de la Chequera                        +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edIMPORTE_TEXTChange(Sender: TObject);
begin
  if Sender is TEdit then
    FmtCurrEdit(Sender as TEdit);
end;

// +---------------------------------------------------------------------------+
// +                 Evento DrawCell del Grid de Datos                         +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.sagDATOSDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var Bmp   : TBitmap;
    vlCol : Integer;
  function Rect_(ALeft, ATop, ARight, ABottom : Integer) : TRect;
  var R : TRect;
  begin
    R.Left := ALeft;
    R.Top := ATop;
    R.Right := ARight;
    R.Bottom := ABottom;
    Result := R;
  end;
begin
  with (Sender As TStringGrid) Do
  begin
    if (ACol = COL_LCM) or (ACol = COL_SEL) then
    begin
      vlCol := ACol;
      Bmp := TBitmap.Create;
      if Assigned(Bmp) then
      begin
        // Determina la imagen a utilizar
        If Objeto.StrToBool( Cells[ vlCol, ARow ] ) then
           ImageList.GetBitmap( 1, Bmp )
        else
           ImageList.GetBitmap( 0, Bmp);
        //ends_if
        Canvas.FillRect( Rect_( Rect.Left - 2, Rect.Top - 2, Rect.Right + 2, Rect.Bottom + 2 ) );
        Bmp.TransparentColor := $00E7EFF7; //color de imagelist
        Bmp.Transparent := True;
        Canvas.Draw(Rect.Left,Rect.Top,Bmp);  Bmp.FreeImage;
        Canvas.Brush.Color := color;
        Bmp.Free;
      end;
    end;
  end;
end;
// +---------------------------------------------------------------------------+
// +                Evento MouseDown del Grid de Datos (automatico)            +
// +   Al selecionar la columna SEL, se desmarca o se marca segun sea el caso  +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.sagDATOSMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var ACol  : Integer;
    ARow  : Integer;
begin
  if ExisteRegActivo then
  begin
    sagDATOS.MouseToCell(X, Y ,ACol, ARow);
    //SELECCIONA LA CONDONACION AUTOMATICA DE MORATORIOS
    if (ACol = COL_LCM) then
    begin
     {PENDIENTE}
    end;
    //SELECCIONA LA COBRANZA DE LOS CONCEPTOS
    If (  ACol = COL_SEL  ) Then //  selecciona la cobranza de los conceptos
    begin
       //HERJA 11/04/2011
       //- PREGUNTA SI QUIERE REALIZAR LA COBRANZA A PESAR DE QUE
       //- EL ACREDITADO SE ENCUENTRE EN RECUPERACION
       if sagDATOS.Cells[COL_RECU, ARow] = 'R' then
       begin
          if sagDATOS.Cells[COL_SEL, ARow] = 'F' then
          begin
             if MessageDlg('El Acreditado se encuentra en RECUPERACION. ¿Desea realizar la Cobranza?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
             Begin
                sagDATOS.Cells[COL_SEL, ARow] := 'V';
                cbTotal.Checked := true;
                AsignaColRow( cRowColor, ARow );
             end;
          end
          else
          begin
             sagDATOS.Cells[COL_SEL, ARow] := 'F';
             cbTotal.Checked := false;
             AsignaColRow( clWindow, ARow );             
          end
       end
       else
       //FIN HERJA 11/04/2011
         cbTotal.Checked := not cbTotal.Checked;
    end;
  end;
end;
// +---------------------------------------------------------------------------+
// +               Evento DrawCell del Grid de Datos (automatico)              +
// +   Cambia la información en pantalla de acuerdo a la seleccion del usuario +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.sagDATOSSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if DataFound then
  begin
    GetFromGrid( ARow, ACol );
    DrawControls;
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +                   Cobro parametrico de comisiones                         +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.sagDATOSDblClick(Sender: TObject);
var CrGaSoApl : TCrGaSoApl;
begin
  if ExisteRegActivo then
  begin
    if Objeto.COLUMNA_GRID.AsInteger = COL_ICOM then
    begin
      {}
    end;
    //
    if Objeto.COLUMNA_GRID.AsInteger = COL_GF then
    begin
      if Objeto.ID_CESION.AsInteger = 0 then
      begin
        {$WARNINGS OFF}
        CrGaSoApl := TCrGaSoApl.Create(self);
        {$WARNINGS ON}
        try
          CrGaSoApl.Apli     := Objeto.Apli;
          CrGaSoApl.ParamCre := Objeto.ParamCre;
          CrGaSoApl.Catalogo;
        finally
          CrGaSoApl.Free;
        end;
      end;//ends_if_Objeto.ID_CESION.AsInteger_=_0_then
      //
    end;
    //
  end;
end;
// +---------------------------------------------------------------------------+
// +                Evento que llama a la clase de lineas                      +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.btID_CONTRATOClick(Sender: TObject);
begin
  if Objeto.ID_CONTRATO.AsString <> '' then
  Begin
    Objeto.CrContrato.FindKey([Objeto.ID_CONTRATO.AsInteger, Objeto.FOL_CONTRATO.AsInteger ]);
    Objeto.CrContrato.Acreditado.FindKey([Objeto.CrContrato.Contrato.ID_Titular.AsString]);
    Objeto.CrContrato.Catalogo;
  End;
end;
// +---------------------------------------------------------------------------+
// +              Evento que llama a la clase de depositos a la vista          +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.btCHEQUERAClick(Sender: TObject);
var CobMcHQ : TCrCobMchq;
begin
  if Objeto.ID_CTO_LIQ.AsString <> ''then
  begin
    if not Objeto.StrToBool( Objeto.B_MULTI_CHQRA.AsString ) then
    begin
      //
      if Objeto.CrContrato.Contrato.FindKey([ Objeto.ID_CTO_LIQ.AsString ]) then
      begin
        Objeto.ConTransa.Contrato := Objeto.CrContrato.Contrato;
        Objeto.ConTransa.Catalogo;
      end;
      //
    end else begin
      //
      {$WARNINGS OFF}
      CobMcHQ := TCrCobMchq.Create(nil);
      {$WARNINGS ON}
      CobMcHQ.Apli := Objeto.Apli;
      CobMcHQ.ID_CREDITO.AsInteger := Objeto.ID_CREDITO.AsInteger;
      CobMcHQ.IMP_COBRANZA.AsFloat := Objeto.IMP_TOTAL.AsFloat;
      CobMcHQ.COBRANZA.AsString    := Objeto.COBRANZA.AsString;
      CobMcHQ.TIPO_FILTRO.AsString := Objeto.TIPO_FILTRO.AsString;
      CobMcHQ.ShowWindow( ftGrid );
      //
    end;
  end;
end;
// +---------------------------------------------------------------------------+
// +                Evento que llama a la clase de disposicion                 +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.btDISPOCISIONClick(Sender: TObject);
begin
  if Objeto.ID_CREDITO.AsString <> '' then
  Begin
    Objeto.Credito.FindKey([Objeto.ID_CREDITO.AsInteger]);
    Objeto.Credito.Catalogo;
  end;
end;
// +---------------------------------------------------------------------------+
// +                  Evento que llama a la clase de cesion                    +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.btCESIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOBRANZ_CESN',True,True) then
   begin
      if Objeto.ID_CESION.AsString <> '' then
      Begin
        Objeto.Cesion.ID_CESION.AsInteger := Objeto.ID_CESION.AsInteger;
        Objeto.Cesion.FindKey([Objeto.ID_CESION.AsInteger]);
        Objeto.Cesion.CreCto.FindKey([ Objeto.ID_CREDITO.AsString,
                                       Objeto.FOL_CONTRATO.AsString  ]);
        Objeto.Cesion.Catalogo;
      end;
   end;
end;
// +---------------------------------------------------------------------------+
// +                   Evento que llama a la clase de documento                +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.btDOCTOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOBRANZ_DOCTO',True,True) then
   begin
      if ( Objeto.ID_CESION.AsString <> '' ) and ( EsDescuento( Objeto.ID_DOCUMENTO.AsString ) ) then
      Begin
        Objeto.Documento.vgCesion := Objeto.ID_CESION.AsString;
        Objeto.Documento.FindKey( [ Objeto.ID_CESION.AsString, Objeto.ID_DOCUMENTO.AsString ] );
        Objeto.Documento.Cesion.CreCto.FindKey([ Objeto.ID_CREDITO.AsString,
                                                 Objeto.FOL_CONTRATO.AsString  ]);
        Objeto.Documento.Cesion.EmiProv.FindKey([ Objeto.Documento.Cesion.ID_PROVEEDOR.AsString ] );
        Objeto.Documento.Catalogo;
      end;
   end;
end;
// +---------------------------------------------------------------------------+
// +                   Evento que llama a la clase de producto                 +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.btPRODUCTOClick(Sender: TObject);
begin
  if Objeto.CVE_PRODUCTO_CRE.AsString <> '' then
  Begin
    Objeto.Producto.FindKey([ Objeto.CVE_PRODUCTO_CRE.AsString ]);
    Objeto.Producto.Catalogo;
  end;
end;
// +---------------------------------------------------------------------------+
// +              Evento que muestra la clase de comisiones                    +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.btCONCEPTOSClick(Sender: TObject);
var vlPestana  : String;
    vlPeriodo  : String;
    vlPosicion : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRCOBRANZ_CN',True,True) then
   begin
   //
      if ExisteRegActivo then
      begin
        vlPestana   := ObtenPestana;
        //
        vlPosicion  := Pos( ',' , Objeto.NUM_PER_COM.AsString );
        if vlPosicion > 0 then
          vlPeriodo := copy( Objeto.NUM_PER_COM.AsString, 1, vlPosicion - 1 )
        else
          vlPeriodo := Objeto.NUM_PER_COM.AsString;
        //ends_if
        Consulta_Credito( ftComision,
                          Objeto.ID_CREDITO.AsInteger,
                          StrToIntDef( vlPeriodo, 0 ),
                          vlPestana,
                          '',
                          Objeto.Apli,
                          Objeto.ParamCre );
      end;
      //
   end;
end;
// +---------------------------------------------------------------------------+
// +                Evento que muestra la clase de interés                     +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.btINTERESClick(Sender: TObject);
var vlPestana : String;
begin
   if Objeto.ValidaAccesoEsp('TCRCOBRANZ_IN',True,True) then
   begin
      if ExisteRegActivo then
      begin
        vlPestana := ObtenPestana;
        Consulta_Credito( ftInteres,
                          Objeto.ID_CREDITO.AsInteger,
                          Objeto.NUM_PER_INT.AsInteger,
                          vlPestana,
                          '',
                          Objeto.Apli,
                          Objeto.ParamCre );
      end;
   end;
end;
// +---------------------------------------------------------------------------+
// +             Evento que muestra la clase de Financiamiento Adicional       +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.btFinAdicClick(Sender: TObject);
var vlPestana : String;
begin
   if Objeto.ValidaAccesoEsp('TCRCOBRANZ_FN',True,True) then
   begin
      if ExisteRegActivo then
      begin
        vlPestana := ObtenPestana;
        Consulta_Credito( ftFinanciamiento,
                          Objeto.ID_CREDITO.AsInteger,
                          Objeto.NUM_PER_FIN.AsInteger,
                          vlPestana,
                          '',
                          Objeto.Apli,
                          Objeto.ParamCre );
      end;
   end;
end;
// +---------------------------------------------------------------------------+
// +                     Evento que muestra la clase de capital                +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.btCAPITALClick(Sender: TObject);
var vlPestana : String;
begin
   if Objeto.ValidaAccesoEsp('TCRCOBRANZ_CP',True,True) then
   begin
      if ExisteRegActivo then
      begin
        vlPestana := ObtenPestana;
        Consulta_Credito( ftCapital,
                          Objeto.ID_CREDITO.AsInteger,
                          Objeto.NUM_PER_CAP.AsInteger,
                          vlPestana,
                          '',
                          Objeto.Apli,
                          Objeto.ParamCre );
      end;
   end;
end;
// +---------------------------------------------------------------------------+
// +              Evento que procesa el cambio en la fecha valor de pago       +
// +---------------------------------------------------------------------------+
Function TWCrcobranz.ValFechaOper( peBandera : Boolean ): Boolean;
var vlSqlFMin : String;
    vlStrFMin : String;
begin
  Result := False;
  if ExisteRegActivo then
  begin
    Objeto.F_VALOR_PAGO.GetFromControl;
    if ( Objeto.F_VALOR_PAGO.AsDateTime <> vgInfoPer.F_VALOR_PAGO ) or ( peBandera ) then
    begin
      if Objeto.F_VALOR_PAGO.AsDateTime > Objeto.Apli.DameFechaEmpresa then
      begin
        Showmessage( coFOD000 );
        AddError   ( coFOD000 );
        AsignaFVAlorPago(  vgInfoPer.F_VALOR_PAGO );        // Devuelve el valor del respaldo
      end
      else if ValidaFecha( Objeto.F_VALOR_PAGO.AsDateTime, Objeto.Apli ) <> 0 then
      begin
        Showmessage( coFONoHabil );
        AddError   ( coFONoHabil );
        AsignaFVAlorPago(  vgInfoPer.F_VALOR_PAGO );        // Devuelve el valor del respaldo
      end
      else if ( ( Objeto.TIPO_COB_ANT.AsString = coPA ) OR ( Objeto.TIPO_COB_ANT.AsString = coMA ) ) then   // Pago Anticipado // Mensualidad Anticipada
      begin
        vlSqlFMin := 'SELECT MIN(F_VENCIMIENTO - PLAZO) F_INICIO ' +
                     'FROM   CR_INTERES I   ' +
                     'WHERE  I.ID_CREDITO = ' + Objeto.ID_CREDITO.AsString +
                     '  AND  I.SIT_INTERES     NOT IN ( ''CA'', ''LQ'', ''IM'' ) ';
        GetSQLStr( vlSqlFMin,  Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
                   'F_INICIO', vlStrFMin, False );

        if Objeto.F_VALOR_PAGO.AsDateTime < StringToDate(vlStrFMin) then
        begin
          Showmessage( coFoNoValid );
          AddError   ( coFoNoValid );
          AsignaFVAlorPago(  vgInfoPer.F_VALOR_PAGO );        // Devuelve el valor del respaldo
        end else
          Result := True;
      end
      else
      begin
        Result := True;
        AsignaFVAlorPago( Objeto.F_VALOR_PAGO.AsDateTime ); // Toma el nuevo valor
      end;
      //ends_if
    end;
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +                   Evento onEnter del Edit edFecha                         +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edFECHAEnter(Sender: TObject);
begin
  if ExisteRegActivo then
    Objeto.TIPO_PARAM.AsInteger := coFecha;
end;
// +---------------------------------------------------------------------------+
// +                   Evento onExit del EditFecha                             +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edFECHAExit(Sender: TObject);
begin
  if ValFechaOper(False) then
  Begin
     ProcesaCambio;         // Procesa la modificacion a la fecha  de pago
     //<LOLS 09 MAR 2006 COMISION X PAGO ANTICIPADO>
     if ValidaPagoAnticipado then
        GetFromGrid( Objeto.INDICE_GRID.AsInteger, Objeto.COLUMNA_GRID.AsInteger );
     //</LOLS>
  End;
  //ends_if
end;
// +---------------------------------------------------------------------------+
// +                   Evento onKeyPress  del EditFecha                        +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edFECHAKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = coCR then
  begin
    edFECHAExit( edFECHA ); // Procesa una posible modificacion a la fecha  de pago
    Key := #0;
  end;
end;
// +---------------------------------------------------------------------------+
// +                   Evento onExit del DateTimePicker                        +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.dtFECHAExit(Sender: TObject);
begin
  edFECHAExit( edFECHA ); // Procesa una posible modificacion a la fecha  de pago
end;
// +---------------------------------------------------------------------------+
// +                   Evento onClic del botón btFECHAClick                    +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.btFECHAClick(Sender: TObject);
var vlRow      : Integer;
    vlCurrRow  : Integer;
    vlCurrCol  : Integer;
    vlFecha    : TDate;
begin
   if Objeto.ValidaAccesoEsp('TCRCOBRANZ_FVAL',True,True) then
   begin
      if ExisteRegActivo then
      begin
        Objeto.TIPO_PARAM.AsInteger := coFecha;
        if ValFechaOper( True ) and ( MessageDlg( Format( coFOActAll, [ Objeto.F_VALOR_PAGO.AsString ] ),
                                                  mtConfirmation, mbYesNoCancel, 0 ) = mrYes ) then
        begin
          vlCurrRow := Objeto.INDICE_GRID.AsInteger;      // Respalda el indice del registro actual
          vlCurrCol := Objeto.COLUMNA_GRID.AsInteger;     // Respalda el indice de la columna actual
          vlFecha   := Objeto.F_VALOR_PAGO.AsDateTime;    // Obtiene la fecha indicada por el usuario
          for vlRow := 0 to ( sagDATOS.RowCount - 1 ) do  // Procesa todos los registros
          begin
            GetFromGrid( vlRow, 0 );
            Objeto.F_VALOR_PAGO.AsDateTime := vlFecha;
            if not cbFiltroChqra.Checked then
              CalculaCobranza(true);
            //
            UpdateToGrid;
          end;
          //
          if cbFiltroChqra.Checked then ValidaSaldoChqra(True);
          GetFromGrid( vlCurrRow, vlCurrCol );            // Obtiene la informacion del registro seleccionado
          DrawControls;                                   // Lo dibuja en pantalla
          //
          if ValidaPagoAnticipado then //<LOLS 09 MAR 2006 COMISION POR PAGO ANTICIPADO>
             GetFromGrid( Objeto.INDICE_GRID.AsInteger, Objeto.COLUMNA_GRID.AsInteger );
          //
        end;//ends_if
      end;//ends_if
   end;
end;
// +---------------------------------------------------------------------------+
// +                   Evento onEnter del edit edFAC_MORAS                     +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edFAC_MORASEnter(Sender: TObject);
begin
  if ExisteRegActivo then
    Objeto.TIPO_PARAM.AsInteger := coFactor;
end;
// +---------------------------------------------------------------------------+
// +                   Evento onExit del edit edFAC_MORAS                      +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edFAC_MORASExit(Sender: TObject);
begin
  if ExisteRegActivo then
  begin
    Objeto.FACT_MORAS.GetFromControl;
    if Objeto.FACT_MORAS.AsFloat <> vgInfoPer.FACT_MORAS then
    begin
      UserCambiaFactorMoras( Objeto.FACT_MORAS.AsFloat );
      ProcesaCambio;
    end;//ends_if
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +                Evento onKeyPress del edit edFAC_MORAS                     +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edFAC_MORASKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = coCR then
  begin
    edFAC_MORASExit( edFAC_MORAS );
    Key := #0;
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +                Evento onClick del boton btFACT_MORAS                      +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.btFACT_MORASClick(Sender: TObject);
var vlRow      : Integer;
    vlCurrRow  : Integer;
    vlCurrCol  : Integer;
    vlFacMoras : Double;
begin
   if Objeto.ValidaAccesoEsp('TCRCOBRANZ_FCMOR',True,True) then
   begin
      if ExisteRegActivo then
      begin
        Objeto.TIPO_PARAM.AsInteger := coFactor;
        Objeto.FACT_MORAS.GetFromControl;
        if MessageDlg( Format( coMorActAll, [ Objeto.FACT_MORAS.AsString ] ), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          vlCurrRow  := Objeto.INDICE_GRID.AsInteger;    // Respalda el indice del registro actual
          vlCurrCol  := Objeto.COLUMNA_GRID.AsInteger;   // Respalda el indice de la columna actual
          vlFacMoras := Objeto.FACT_MORAS.AsFloat;       // Respalda el factor de moras
          for vlRow := 0 to ( sagDATOS.RowCount - 1 ) do // Procesa todos los registros
          begin
            GetFromGrid( vlRow, 0 );
            UserCambiaFactorMoras( vlFacMoras );
            if not cbFiltroChqra.Checked then
              CalculaCobranza(true);
            //
            UpdateToGrid;
          end;
          if cbFiltroChqra.Checked then ValidaSaldoChqra(True);
          GetFromGrid( vlCurrRow, vlCurrCol );           // Obtiene la informacion del registro seleccionado
          DrawControls;                                  // Lo dibuja en pantalla
        end else
          Objeto.FACT_MORAS.AsFloat := vgInfoPer.FACT_MORAS;
        //ends_if
      end;//ends_if
   end;
end;
// +---------------------------------------------------------------------------+
// +                 Evento onEnter del edit edMONTO_MORAS                     +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edMONTO_MORASEnter(Sender: TObject);
begin
  if ExisteRegActivo then
    Objeto.TIPO_PARAM.AsInteger := coMonto;
end;
// +---------------------------------------------------------------------------+
// +                  Evento onExit del edit edMONTO_MORAS                     +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edMONTO_MORASExit(Sender: TObject);
var vlFacMora : Double;
begin
  Objeto.MONTO_MORAS.GetFromControl;
  if vgInfoPer.MONTO_MORAS <> Objeto.MONTO_MORAS.AsFloat then
  begin
    if MessageDlg( Format( coObtFacMora, [ Objeto.MONTO_MORAS.AsFloat ] ), mtConfirmation, mbYesNoCancel, 0 ) = mrYes then
    begin
      if Objeto.StpObtFacMora( Objeto.ID_CREDITO.AsInteger,    Objeto.NUM_PER_CAP.AsInteger,
                               Objeto.B_IVA_MORAS.AsString,    Objeto.MONTO_MORAS.AsFloat,
                               Objeto.F_VALOR_PAGO.AsDateTime, Objeto.CVE_ACCESORIO.AsString,
                               vlFacMora ) then
      begin
        UserCambiaFactorMoras( vlFacMora );
        ProcesaCambio;
      end else
        Objeto.MONTO_MORAS.AsFloat := vgInfoPer.MONTO_MORAS;
      //ends_if
    end else
      Objeto.MONTO_MORAS.AsFloat := vgInfoPer.MONTO_MORAS;
    //ends_if
  end;
end;
// +---------------------------------------------------------------------------+
// +                Evento onKeyPress del edit edMONTO_MORAS                   +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edMONTO_MORASKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = coCR then
  begin
    edMONTO_MORASExit( edMONTO_MORAS );
    Key := #0;
  end;
end;
// +---------------------------------------------------------------------------+
// +                  Evento onEnter del edit edIMP_DEPOSITO                   +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edIMP_DEPOSITOEnter(Sender: TObject);
begin
  if ExisteRegActivo then
    Objeto.TIPO_PARAM.AsInteger := coImpDep;
end;
// +---------------------------------------------------------------------------+
// +                Evento onExit del edit edIMP_DEPOSITO                      +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edIMP_DEPOSITOExit(Sender: TObject);
var vlRow     : integer;
    vlCurrCr  : integer;
    vlCurrRow : integer;
    vlCurrCol : integer;
    vlImpGtia : Currency;
begin
  if ExisteRegActivo then
  begin
    Objeto.IMP_DEP_GAR_FEGA.GetFromControl;
    if Objeto.IMP_DEP_GAR_FEGA.AsFloat <> vgInfoPer.IMP_DEPOSITO then
    begin
      if ( Objeto.IMP_TOTAL.AsFloat > Objeto.IMP_DEP_GAR_FEGA.AsFloat ) and
         ( EsDescuento( Objeto.ID_DOCUMENTO.AsString ) ) then
        MessageDlg( coImpDepMnr, mtWarning, [ mbOk ], 0  );
      //ends_if
      ProcesaCambio;
      //
      // Para disposiciones con créditos PYME actualiza el importe de la garantia
      // a todos los períodoso debido a que la garantía es por liquidación total
      if Objeto.StrToBool( Objeto.B_GTIA_PYME.AsString ) then
      begin
        vlCurrCr  := Objeto.ID_CREDITO.AsInteger;
        vlImpGtia := Objeto.IMP_DEP_GAR_FEGA.AsFloat;
        vlCurrRow := Objeto.INDICE_GRID.AsInteger;       // Respalda el indice del registro actual
        vlCurrCol := Objeto.COLUMNA_GRID.AsInteger;      // Respalda el indice de la columna actual
        for vlRow := 0 to ( sagDATOS.RowCount - 1 ) do   // Procesa todos los registros
        begin
          GetFromGrid( vlRow, 0 );
          if Objeto.ID_CREDITO.AsInteger = vlCurrCr then
          begin
            Objeto.IMP_DEP_GAR_FEGA.AsFloat := vlImpGtia;
            UpdateToGrid;
          end;//ends_if_Objeto.ID_CREDITO.AsInteger_=_vlCurrCr_then
        end;
        GetFromGrid( vlCurrRow, vlCurrCol );             // Obtiene la informacion del registro seleccionado
        DrawControls;                                    // Lo dibuja en pantalla
      end;//ends_if_Objeto.StrToBool( Objeto.B_GTIA_PYME.AsString ) then
      //
    end;//ends_if
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +               Evento onKeyPress del edit edIMP_DEPOSITO                   +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edIMP_DEPOSITOKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = coCR then
  begin
    edIMP_DEPOSITOExit( edIMP_DEPOSITO );
    Key := #0;
  end;
end;
// +---------------------------------------------------------------------------+
// +               Evento onClick del boton btImpDeposito                      +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.btImpDepositoClick(Sender: TObject);
var  vlRow     : Integer;
     vlCurrRow : Integer;
     vlCurrCol : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRCOBRANZ_GARFG',True,True) then
   begin
      if ExisteRegActivo then
      begin
        Objeto.TIPO_PARAM.AsInteger := coImpDep;
        if EsDescuento( Objeto.ID_DOCUMENTO.AsString ) then
        begin
          if MessageDlg( coAsgImpDep, mtConfirmation, mbYesNoCancel, 0 ) = mrYes then
          begin
            vlCurrRow := Objeto.INDICE_GRID.AsInteger;       // Respalda el indice del registro actual
            vlCurrCol := Objeto.COLUMNA_GRID.AsInteger;      // Respalda el indice de la columna actual
            for vlRow := 0 to ( sagDATOS.RowCount - 1 ) do   // Procesa todos los registros
            begin
              GetFromGrid( vlRow, 0 );
              Objeto.IMP_DEP_GAR_FEGA.AsFloat := Objeto.IMP_TOTAL.AsFloat;
              CalculaCobranza(true);
              UpdateToGrid;
            end;
            GetFromGrid( vlCurrRow, vlCurrCol );             // Obtiene la informacion del registro seleccionado
            DrawControls;                                    // Lo dibuja en pantalla
          end;//ends_if
        end;//ends_if
      end;//ends_if
   end;
end;
// +---------------------------------------------------------------------------+
// +               Evento onEnter del check box cbB_IVA_MORA                   +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.cbB_IVA_MORAEnter(Sender: TObject);
begin
  if ExisteRegActivo then
    Objeto.TIPO_PARAM.AsInteger := coIVAMor;
end;
// +---------------------------------------------------------------------------+
// +               Evento onClic del check box cbB_IVA_MORA                    +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.cbB_IVA_MORAClick(Sender: TObject);
begin
  if ExisteRegActivo then
  begin
    Objeto.B_IVA_MORAS.GetFromControl;
    UserCambiaIVAMoras( Objeto.B_IVA_MORAS.AsString );
    ProcesaCambio;
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +                Evento onEnter del check box cbB_COND_MORAS                +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.cbB_COND_MORASEnter(Sender: TObject);
begin
  if ExisteRegActivo then
    Objeto.TIPO_PARAM.AsInteger := coCondMor;
end;
// +---------------------------------------------------------------------------+
// +               Evento onClic del check box cbB_COND_MORAS                  +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.cbB_COND_MORASClick(Sender: TObject);
begin
  if ExisteRegActivo then
  begin
    Objeto.B_COND_MORAS.GetFromControl;
    UserCambiaCondMoras( Objeto.B_COND_MORAS.AsString );
    GetFromControls;  // Salva la información de la pantalla al registro actual
    UpdateToGrid;     // Regresa los valores al GRID.
    DrawControls;     // Regresa los valores a la pantalla
  end;
end;
// +---------------------------------------------------------------------------+
// +                Evento onEnter del check box cbGarFEGA                     +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.cbGarFEGAEnter(Sender: TObject);
begin
  if ExisteRegActivo then
    Objeto.TIPO_PARAM.AsInteger := coGarFEGA;
end;
// +---------------------------------------------------------------------------+
// +               Evento onClic del check box cbGarFEGA                       +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.cbGarFEGAClick(Sender: TObject);
var vlRow     : integer;
    vlCurrCr  : integer;
    vlCurrRow : integer;
    vlCurrCol : integer;
    vlBGtiaPyme : String;
begin
  if ExisteRegActivo then
  begin
    Objeto.B_GARANTIA_FEGA.GetFromControl;
    if ( Objeto.B_GARANTIA_FEGA.AsString = 'V' ) and ( Objeto.B_APLICA_GF.AsString     = 'F' ) then
    begin
      ShowMessage( Format( coNoApGF, [ Objeto.ID_CREDITO.AsInteger ] ) );
      cbGarFEGA.Checked := False;
    end else begin
      GetFromControls;  // Salva la información de la pantalla al registro actual
      UpdateToGrid;     // Regresa los valores al GRID.
      DrawControls;     // Regresa los valores a la pantalla
      //
      // Para disposiciones con créditos PYME actualiza el importe de la garantia
      // a todos los períodoso debido a que la garantía es por liquidación total
      if Objeto.StrToBool( Objeto.B_GTIA_PYME.AsString ) then
      begin
        vlCurrCr    := Objeto.ID_CREDITO.AsInteger;
        vlBGtiaPyme := Objeto.B_GARANTIA_FEGA.AsString;
        vlCurrRow   := Objeto.INDICE_GRID.AsInteger;       // Respalda el indice del registro actual
        vlCurrCol   := Objeto.COLUMNA_GRID.AsInteger;      // Respalda el indice de la columna actual
        for vlRow   := 0 to ( sagDATOS.RowCount - 1 ) do   // Procesa todos los registros
        begin
          if Objeto.ID_CREDITO.AsInteger = vlCurrCr then
          begin
            GetFromGrid( vlRow, 0 );
            Objeto.B_GARANTIA_FEGA.AsString := vlBGtiaPyme;
            UpdateToGrid;
          end;//ends_if_Objeto.ID_CREDITO.AsInteger_=_vlCurrCr_then
        end;
        GetFromGrid( vlCurrRow, vlCurrCol );             // Obtiene la informacion del registro seleccionado
        DrawControls;                                    // Lo dibuja en pantalla
      end;//ends_if_Objeto.StrToBool( Objeto.B_GTIA_PYME.AsString ) then
      //
    end;
  end;
end;
// +---------------------------------------------------------------------------+
// +               Evento onClic del popup memu de cbGarFEGA                   +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.AsignarGarantiaPYME1Click(Sender: TObject);
var vlRow       : integer;
    vlCurrRow   : integer;
    vlCurrCol   : integer;
    pImpPagoCon : Double;
    pImpPagoInt : Double;
    pImpPagoFin : Double;
    pImpPagoCap : Double;
    vlError     : String;
    vlImpAplica : Double;
    vlImpProc   : Double;
    vlRemanente : Double;
    vlLastRec   : Integer;
begin
  if ExisteRegActivo then
  begin
    if Objeto.COBRANZA.AsString <> coCobGN then
    begin
      ShowMessage('El tipo de cobranza debe ser indistinta');
      exit;
    end;
    //
    if not Objeto.StrToBool( Objeto.B_GARANTIA_FEGA.AsString ) then
    begin
      ShowMessage('Debe marcar la opción de Garantía FEGA / PYME');
      exit;
    end;
    //
    if Objeto.StrToBool( Objeto.B_GTIA_PYME.AsString ) then
    begin
      //
      // Para disposiciones con créditos PYME actualiza el importe de la garantia
      // a todos los períodoso debido a que la garantía es por liquidación total
      if Objeto.StrToBool( Objeto.B_GTIA_PYME.AsString ) then
      begin
        vlImpProc   := 0;
        vlImpAplica := Objeto.IMP_DEP_GAR_FEGA.AsFloat;
        vlCurrRow   := Objeto.INDICE_GRID.AsInteger;       // Respalda el indice del registro actual
        vlCurrCol   := Objeto.COLUMNA_GRID.AsInteger;      // Respalda el indice de la columna actual
        vlLastRec   := -1;                                 // <LOLS 10 MAR 2006. INICIALIZA VARIABLE>
        for vlRow   := 0 to ( sagDATOS.RowCount - 1 ) do   // Procesa todos los registros ; pero lo hace de 0 a n-1, por estar cero-indexado
        begin
          GetFromGrid( vlRow, 0 );
          Objeto.StpObtImpGPYME(
            Objeto.ID_CREDITO.AsInteger,     Objeto.F_VENCIMIENTO.AsDateTime, Objeto.F_PROG_PAGO.AsDateTime,
            Objeto.F_VALOR_PAGO.AsDateTime,  Objeto.ID_DOCUMENTO.AsString,    Objeto.NUM_PER_DOCTO.AsInteger,
            Objeto.IMP_DEP_GAR_FEGA.AsFloat, Objeto.B_COB_COMISION.AsString,  Objeto.B_COB_INTERES.AsString,
            Objeto.B_COB_FIN_ADIC.AsString,  Objeto.B_COB_CAPITAL.AsString,   Objeto.FAC_MORAS_CO.AsFloat,
            Objeto.FAC_MORAS_IN.AsFloat,     Objeto.FAC_MORAS_FA.AsFloat,     Objeto.FAC_MORAS_CA.AsFloat,
            Objeto.B_IVA_MORA_CO.AsString,   Objeto.B_IVA_MORA_IN.AsString,   Objeto.B_COND_MORA_FA.AsString,
            Objeto.B_IVA_MORA_CA.AsString,   pImpPagoCon,                     pImpPagoInt,
            pImpPagoFin,                     pImpPagoCap,                     vlError );

          if vlError = '' then
          begin
            Objeto.IMP_COMISION.AsFloat := pImpPagoCon;
            Objeto.IMP_INTERES.AsFloat  := pImpPagoInt;
            Objeto.IMP_FIN_ADIC.AsFloat := pImpPagoFin;
            Objeto.IMP_CAPITAL.AsFloat  := pImpPagoCap;
            CalculaCobranza(false);  // Hace el calculo de los importes
            UpdateToGrid;            // Regresa los valores al GRID.
            vlImpProc := vlImpProc + pImpPagoCon + pImpPagoInt + pImpPagoFin + pImpPagoCap;
            if ( pImpPagoCon > 0 ) or ( pImpPagoInt > 0 ) or
               ( pImpPagoFin > 0 ) or ( pImpPagoCap > 0 ) then //or  ( vlImpAplica > 0 )
              vlLastRec := vlRow;
            //
          end else
          begin
            ShowMessage( 'Error al asignar los importes. Avise a sistemas ' + coCRLF +
                         vlError + coCRLF + 'El proceso no continua!!!');
            exit;
          end;
        end;
        vlRemanente := vlImpAplica - vlImpProc;
        if vlRemanente <> 0 then
        begin
          GetFromGrid( vlLastRec, 0 );
          if Objeto.IMP_CAPITAL.AsFloat > 0 then
            Objeto.IMP_CAPITAL.AsFloat  := Objeto.IMP_CAPITAL.AsFloat  + vlRemanente
          else if Objeto.IMP_FIN_ADIC.AsFloat > 0 then
            Objeto.IMP_FIN_ADIC.AsFloat := Objeto.IMP_FIN_ADIC.AsFloat + vlRemanente
          else if Objeto.IMP_INTERES.AsFloat > 0 then
            Objeto.IMP_INTERES.AsFloat  := Objeto.IMP_INTERES.AsFloat  + vlRemanente
          else if Objeto.IMP_COMISION.AsFloat > 0 then
            Objeto.IMP_COMISION.AsFloat := Objeto.IMP_COMISION.AsFloat + vlRemanente;
          //
          CalculaCobranza(false);  // Hace el calculo de los importes
          UpdateToGrid;            // Regresa los valores al GRID.
        end;
        GetFromGrid( vlCurrRow, vlCurrCol );             // Obtiene la informacion del registro seleccionado
        DrawControls;                                    // Lo dibuja en pantalla
      end;//ends_if_Objeto.StrToBool( Objeto.B_GTIA_PYME.AsString ) then
      //
    end else
      ShowMessage('No aplica garantía PYME');
    //ends_if

  end;//ends_if
end;
//<LOLS 08 MAR 2006 COMISION POR PAGO ANTICIPADO>
//
procedure TWCrcobranz.UpdateComPgAN( peMetodo     : Integer; b_pct_c_pgan : string;
                                     pct_comision : Double;  imp_comision : double );
var vlRow     : integer;
    vlCurrCr  : integer;
    vlCurrRow : integer;
    vlCurrCol : integer;
begin
  if ExisteRegActivo then
  begin
    vlCurrCr  := Objeto.ID_CREDITO.AsInteger;
    vlCurrRow := Objeto.INDICE_GRID.AsInteger;       // Respalda el indice del registro actual
    vlCurrCol := Objeto.COLUMNA_GRID.AsInteger;      // Respalda el indice de la columna actual
    for vlRow := 0 to ( sagDATOS.RowCount - 1 ) do   // Procesa todos los registros
    begin
      GetFromGrid( vlRow, 0 );
      if Objeto.ID_CREDITO.AsInteger = vlCurrCr then
      begin
        case peMetodo of
          coPctPGAN  : Objeto.PCT_COM_PGAN.AsFloat  := pct_comision;
          coImpPGAN  : Objeto.IMP_COM_PGAN.AsFloat  := imp_comision;
          coTipoPGAN : Objeto.B_PCT_C_PGAN.AsString := b_pct_c_pgan;
        end;
        UpdateToGrid;
      end;//ends_if_Objeto.ID_CREDITO.AsInteger_=_vlCurrCr_then
    end;
    GetFromGrid( vlCurrRow, vlCurrCol );             // Obtiene la informacion del registro seleccionado
    DrawControls;                                    // Lo dibuja en pantalla
  end;
end;
// +---------------------------------------------------------------------------+
// +               Evento onClic del popup memu de cbGarFEGA                   +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.rgTipoComisionClick(Sender: TObject);
begin
  if ExisteRegActivo then
  begin
    Objeto.B_PCT_C_PGAN.GetFromControl;
    ShowHideEditPgAN;
    UpdateToGrid;
    UpdateComPgAN( coTipoPGAN, Objeto.B_PCT_C_PGAN.AsString,
                   Objeto.PCT_COM_PGAN.AsFloat, Objeto.IMP_COM_PGAN.AsFloat );
  End;
End;
//
procedure TWCrcobranz.ieIMP_COM_PGANEnter(Sender: TObject);
begin
  if ExisteRegActivo then
     vgPctImpCom := CurrFromFrmFloat( ieIMP_COM_PGAN.Text );
end;
//
procedure TWCrcobranz.ieIMP_COM_PGANExit(Sender: TObject);
var vlDouble  : Double;
    vlMetodo  : Integer;
begin
  if ExisteRegActivo then
  begin
    //
    if Objeto.StrToBool( Objeto.B_PCT_C_PGAN.AsString ) then
    Begin
      Objeto.PCT_COM_PGAN.GetFromControl;
      vlDouble := Objeto.PCT_COM_PGAN.AsFloat;
      vlMetodo := coPctPGAN;
    End else
    Begin
      Objeto.IMP_COM_PGAN.GetFromControl;
      vlDouble := Objeto.IMP_COM_PGAN.AsFloat;
      vlMetodo := coImpPGAN;
    End;
    //
    if vlDouble <> vgPctImpCom then
    begin
      UpdateToGrid;
      UpdateComPgAN( vlMetodo, Objeto.B_PCT_C_PGAN.AsString, vlDouble, vlDouble );
    end;//ends_if
  end;//ends_if
end;
//
procedure TWCrcobranz.ieIMP_COM_PGANKeyPress(Sender: TObject;  var Key: Char);
begin
  if ExisteRegActivo then
  Begin
    if Key = coCR then
    Begin
      ieIMP_COM_PGANExit( edIMP_DEPOSITO );
      Key := #0;
    End;
  End;
  //
End;
//</LOLS>
// +---------------------------------------------------------------------------+
// +                  Evento onExit del edit edCONCEPTOS                       +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edCONCEPTOSExit(Sender: TObject);
begin
  if ExisteRegActivo then
  begin
    Objeto.IMP_COMISION.GetFromControl;
    if Objeto.IMP_COMISION.AsFloat <> vgInfoPer.IMP_COMISION then
    begin
      Objeto.B_MOD_IMP_COM.AsString := Objeto.BoolToStr( True );
      ProcesaImportes;
    end;//ends_if
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +                Evento onKeyPress del edit edCONCEPTOS                     +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edCONCEPTOSKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = coCR then
  begin
    edConceptosExit( edCONCEPTOS );
    Key := #0;
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +                  Evento onExit del edit edINTERES                         +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edINTERESExit(Sender: TObject);
begin
  if ExisteRegActivo then
  begin
    Objeto.IMP_INTERES.GetFromControl;
    if Objeto.IMP_INTERES.AsFloat <> vgInfoPer.IMP_INTERES then
    begin
      Objeto.B_MOD_IMP_INT.AsString := Objeto.BoolToStr( True );
      ProcesaImportes;
    end;//ends_if
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +                Evento onKeyPress del edit edINTERES                       +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edINTERESKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = coCR then
  begin
    edInteresExit( edInteres );
    Key := #0;
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +                  Evento onExit del edit edFinAdic                         +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edFinAdicExit(Sender: TObject);
begin
  if ExisteRegActivo then
  begin
    Objeto.IMP_FIN_ADIC.GetFromControl;
    if Objeto.IMP_FIN_ADIC.AsFloat <> vgInfoPer.IMP_FIN_ADIC then
    begin
      Objeto.B_MOD_IMP_FIN.AsString := Objeto.BoolToStr( True );
      ProcesaImportes;
    end;//ends_if
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +                Evento onKeyPress del edit edFinAdic                       +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edFinAdicKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = coCR then
  begin
    edFinAdicExit( edFinAdic );
    Key := #0;
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +                  Evento onExit del edit edCAPITAL                         +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edCAPITALExit(Sender: TObject);
begin
  if ExisteRegActivo then
  begin
    Objeto.IMP_CAPITAL.GetFromControl;
    if Objeto.IMP_CAPITAL.AsFloat <> vgInfoPer.IMP_CAPITAL then
    begin
      Objeto.B_MOD_IMP_CAP.AsString := Objeto.BoolToStr( True );
      ProcesaImportes;
    end;//ends_if
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +                Evento onKeyPress del edit edCAPITAL                       +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.edCAPITALKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = coCR then
  begin
    edCapitalExit( edCapital );
    Key := #0;
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +                Evento onClic del check box cbConceptos                    +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.cbCONCEPTOSClick(Sender: TObject);
begin
  if ExisteRegActivo then
    ValidaChkCobranza( False );
end;
// +---------------------------------------------------------------------------+
// +                Evento onClic del check box cbInteres                      +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.cbINTERESClick(Sender: TObject);
begin
  if ExisteRegActivo then
    ValidaChkCobranza( False );
end;
// +---------------------------------------------------------------------------+
// +                Evento onClic del check box cbFinAdic                      +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.cbFinAdicClick(Sender: TObject);
begin
  if ExisteRegActivo then
    ValidaChkCobranza( False );
end;
// +---------------------------------------------------------------------------+
// +                Evento onClic del check box cbCapital                      +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.cbCAPITALClick(Sender: TObject);
begin
  if ExisteRegActivo then
    ValidaChkCobranza( False );
end;
// +---------------------------------------------------------------------------+
// +                Evento onClic del check box cbTotal                        +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.cbTotalClick(Sender: TObject);
begin
  if ExisteRegActivo then
    ValidaChkCobranza( True );
end;
// +---------------------------------------------------------------------------+
// +                Evento onClic del check box cbSeleccion                    +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.cbSeleccionClick(Sender: TObject);
var vlRow     : Integer;
    vlCurrRow : Integer;
    vlCurrCol : Integer;
    vlCobra   : String;
begin
  if DataFound then
  begin
    vlCurrRow := Objeto.INDICE_GRID.AsInteger;             // Respalda el indice del registro actual
    vlCurrCol := Objeto.COLUMNA_GRID.AsInteger;            // Respalda el indice de la columna actual
    vlCobra   := Objeto.BoolToStr( cbSeleccion.Checked );  // Determina si marca o desmarca los registros
    for vlRow := 0 to ( sagDATOS.RowCount - 1 ) do         // Procesa todos los registros
    begin
      GetFromGrid( vlRow, 0 );
      case cbSeleccion.State of
        cbUnchecked : vlCobra   := Objeto.BoolToStr( False );
        cbChecked   : vlCobra   := Objeto.BoolToStr( True );
        cbGrayed    : vlCobra   := Objeto.B_CUBRE_PAGO.AsString;
      end;
      Objeto.B_COB_COMISION.AsString := vlCobra;
      Objeto.B_COB_INTERES.AsString  := vlCobra;
      Objeto.B_COB_FIN_ADIC.AsString := vlCobra;
      Objeto.B_COB_CAPITAL.AsString  := vlCobra;
      Objeto.B_COB_TOTAL.AsString    := vlCobra;
      UpdateToGrid;
    end;
    if ExisteRegActivo then
    begin
      GetFromGrid( vlCurrRow, vlCurrCol );   // Obtiene la informacion del registro seleccionado
      DrawControls;                          // Lo dibuja en pantalla
    end;//ends_if
  end;
end;
// +---------------------------------------------------------------------------+
// +                Evento onDblClick del memo de mensajes                     +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.MErroresDblClick(Sender: TObject);
begin
  MErrores.Lines.Clear;
end;
// +---------------------------------------------------------------------------+
// +                Evento onClic del boton de búsqueda                        +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.btBUSCAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOBRANZ_BUSCA',True,True) then
   begin
      MuestraDatos;
   end;
end;
// +---------------------------------------------------------------------------+
// +                Evento onClic del boton de cobranza                        +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.btnCobraClick(Sender: TObject);
var vlError      : String;
    vlRow        : Integer;
    vlIndex      : Integer;
    vlCnt        : Integer;
    vlResult     : Integer;
    vlTxResult   : String;
    vlAgrega     : Boolean;
    vlBComAcc    : Boolean;
    vlCCrCnAcc   : Integer;
    vlCntAdd     : Integer; //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
    vlsql        : string;
    vlDia        : Integer;
    vlDias       : Integer;
    vlDiaInicial : TDateTime;
    vlclave      : String;
begin
//JFOF VALIDA USUARIO 12/10/2011
    vlClave := '02';
// if ValidaUsuario(Objeto.Apli, vlClave) then
   if Objeto.ValidaAccesoEsp('TCRCOBRANZ_COBRA',True,True) then
//JFOF VALIDA USUARIO 12/10/2011
   begin

      if not DataFound then  // Valida si tiene datos el grid , DataFound es una property , se le asigna el valor en MuestraDatos
      begin
        ShowMessage( coNoData );  // constante en IntCrcobranz : 'No existen datos'
        exit;
      end;//end_if
      //
      if not ( MessageDlg( coRealizaCob, mtConfirmation, [mbYes, mbNo], 0  ) = mrYes ) then    // constante en IntCrcobranz : '¿Desea aplicar la cobranza?'
        exit;
      //end_if
      //
    // JAGF: PARA VALIDAR LA FECHA VALOR PARA EL PERIODO CONTABLE
      vlSQL := 'Select CVE_CLAVE From CR_CON_CAT_DATA Where Cve_Con_Gpo_Cat = ''CAT_COB_MAX_FVAL''';
      GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_CLAVE',vlDias,False);

      vlDia := StrToInt (FormatDateTime ('dd', Objeto.Apli.DameFechaEmpresa));

      vlDiaInicial := EncodeDate (StrToInt (FormatDateTime ('yyyy', Objeto.Apli.DameFechaEmpresa)),
                                  StrToInt (FormatDateTime ('mm', Objeto.Apli.DameFechaEmpresa)), 1);

      if (vlDia > vlDias) and (Objeto.F_VALOR_PAGO.GetAsDateTime < vlDiaInicial) then
      begin
        MessageDlg (Format ('No se puede aplicar una fecha valor antes de este mes despues del día %d.', [vlDias]), mtWarning, [mbOk], 0);
        exit;
      end;

      if (vlDia <= vlDias) and (Objeto.F_VALOR_PAGO.GetAsDateTime < IncMonth (vlDiaInicial, -1)) then
      begin
        MessageDlg ('No se puede aplicar una fecha valor más atras del mes anterior.', mtWarning, [mbOk], 0);
        exit;
      end;

      Objeto.SUB_TIPO_COB_ANT.GetFromControl;    // Recupera el valor capturado en su control vinculado
      Objeto.B_TRANSFERENCIA.GetFromControl;     // Recupera el valor capturado en su control vinculado
      //
      MessageIniFinProceso( MErrores, cInicio ); // Inicio del log de mensajes presentado en el TMemo MErrores
      Objeto.LimpiaTablaCob(vlError);   // Limpia la tabla de configuración para el cobro de comisiones , ejecuta el SP PKGCECOBRANZA.STPLIMPIATABLACOB
      ValidaError( vlError );           // Valida el resultado del procedimiento anterior
      vgLGarFEGA.Sort;                  // Ordena la lista de disposiciones con garantia FEGA
      vlCCrCnAcc := 0;                  // Guarda el número de crédito actual para comisión por Acred / Aut.
      //
      vlBComAcc := True;
      vlCntAdd  := 0; //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
      for vlRow := 0 to sagDATOS.RowCount - 1 do // se barre todo el grid para recuperar los datos y porcesarlos en función de los checks
      begin
        GetFromGrid( vlRow,  0 );  // Actualiza los datos del GRID a la estructura de datos actual, es posible que los valores originales del grid hayan cambiado debido a los checks
        if ExisteRegActivo then    // ( DataFound ) and ( Objeto.ID_CREDITO.AsInteger > 0 ); , DataFound := True|False en MuestraDatos
        begin
          if Objeto.StrToBool( Objeto.B_COB_TOTAL.AsString ) then  //validación de que el control cbTotal se encuentre en Checked, este control es el Total del grupo Importe-----Cobrar, el cual si existe algun rubro a cobrar, entonces se mantiene como check sin importar la cantidad presentada en el text box
          begin
            vlAgrega  := ValidaGFEjercida( Objeto.ID_CREDITO.AsInteger ); // Por default es TRUE, pero Valida si una disposicion tiene GF ejercida y pide la confirmacion del usuario para cobrarla, o si vgLGarFEGA.Values[ IntToStr( peIdCredito ) ] <> coPagoGF hace la conversion  Objeto.StrToBool( vgLGarFEGA.Values[ IntToStr( peIdCredito ) ] );
            //
            //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
            if vlAgrega then
              vlAgrega := ( sagDATOS.Cells[ COL_CLCW, vlRow ] = '' ); // COL_CLCW: Tipo_cobranza anticipada, verifica que no se haya cobrado anticipadamente, por lo que la badera correspondiente estará en blanco.
            //</ENDS_LOLS_24_AGO_2006>
            // SI Tiene períodos de comisión a nivel acreditado y/o autorizacion, se debe aplicar la validación
            if ( vlAgrega = true ) and ( sagDATOS.Cells[ COL_CCAC, vlRow ] = 'V' ) then   // COL_CCAC: Tiene períodos de comisión a nivel acreditado y/o autorizacion
            begin
              if vlCCrCnAcc = Objeto.ID_CREDITO.AsInteger then
                begin
                  vlAgrega := vlBComAcc;
                end
              else
                begin
                  vlCCrCnAcc := Objeto.ID_CREDITO.AsInteger;
                  vlBComAcc  := MessageDlg( Format( coBComAcrAut, [Objeto.ID_CREDITO.AsInteger] ),
                                           mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes;
                                           // coBComAcrAut: 'La disposición %d tiene comisiones pendientes de cobro a nivel acreditado o autorización.' '¿Desea continuar con el proceso de cobranza para esta disposición?';
                  vlAgrega   := vlBComAcc; // Si el usuario acepto continuar con la cobranza aun cuando tiene cobros pendientes de comisiones
                end;
            end;
            //
            // Hasta este punto ya se han cumplido las validaciones, que pueden ser 2 ó 3, por lo que se puede aplicar la agregación del registro en tablas temporales del SP
            if vlAgrega then
            begin
              inc( vlCntAdd ); //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
              // ejecuta el sp PKGCRCOBRANZA.STPAGREGAELEMENTO : Agrega registros a las tablas temporales, con los datos del objeto Cobranza.
              // las tablas inicializadas  son :  vgTablaCobranza, vgTblCtrlPago y vgTablaChequera
              Objeto.StpAgregaElemento( Objeto.ID_CREDITO.AsInteger,                     // Numero de disposicion
                                        Objeto.F_VENCIMIENTO.AsDateTime,                 // Fecha de vencimiento
                                        Objeto.F_PROG_PAGO.AsDateTime,                   // Fecha programada de pago
                                        Objeto.F_VALOR_PAGO.AsDateTime,                  // Fecha valor de pago
                                        Objeto.ID_DOCUMENTO.AsString,                    // Numero de documento
                                        Objeto.NUM_PER_DOCTO.AsInteger,                  // Numero de periodo de documento
                                        Objeto.IMP_DEP_GAR_FEGA.AsFloat,                 // Importe de deposito
                                        Objeto.B_COB_COMISION.AsString,                  // Cobra comision
                                        Objeto.B_COB_INTERES.AsString,                   // Cobra interes
                                        Objeto.B_COB_FIN_ADIC.AsString,                  // Cobra financiamiento adicional
                                        Objeto.B_COB_CAPITAL.AsString,                   // Cobra capital
                                        Objeto.IMP_COMISION.AsFloat,                     // Importe de comision
                                        Objeto.IMP_INTERES.AsFloat,                      // Importe de interes
                                        Objeto.IMP_FIN_ADIC.AsFloat,                     // Importe de Fin. Adicional
                                        Objeto.IMP_CAPITAL.AsFloat,                      // Importe de capital
                                        Objeto.FAC_MORAS_CO.AsFloat,                     // Factor de moras de comision
                                        Objeto.FAC_MORAS_IN.AsFloat,                     // Factor de moras de interes
                                        Objeto.FAC_MORAS_FA.AsFloat,                     // Factor de moras de fin. adic
                                        Objeto.FAC_MORAS_CA.AsFloat,                     // Factor de moras de capital
                                        Objeto.B_IVA_MORA_CO.AsString,                   // Aplica IVA de moras de comisión
                                        Objeto.B_IVA_MORA_IN.AsString,                   // Aplica IVA de moras de interes
                                        Objeto.B_IVA_MORA_FA.AsString,                   // Aplica IVA de moras de Fin. Adicional
                                        Objeto.B_IVA_MORA_CA.AsString,                   // Aplica IVA de moras de Capital
                                        Objeto.B_COND_MORA_CO.AsString,                  // Condona moratorios de comision
                                        Objeto.B_COND_MORA_IN.AsString,                  // Condona moratorios de interes
                                        Objeto.B_COND_MORA_FA.AsString,                  // Condona moratorios de Fin. Adicional
                                        Objeto.B_COND_MORA_CA.AsString,                  // Condona moratorios de Capital
                                        Objeto.B_GARANTIA_FEGA.AsString,
                                        //'V', //
                                        Objeto.B_COB_ORD_PER.AsString,                   // Banderas de cobranza 1
                                        //'V', //
                                        Objeto.B_COB_ORD_ACC.AsString,                   // Banderas de cobranza 2
                                        //'F', //
                                        Objeto.B_COB_TOT_PER.AsString,                   // Banderas de cobranza 3
                                        //'V', //
                                        Objeto.B_COB_PARCIAL.AsString,                   // Banderas de cobranza 4
                                        sagDATOS.Cells[ COL_BCAU, vlRow ],               // Condonacion automatica de moratorios
                                        Objeto.TIPO_DETALLE.AsString,                    // Tipo detalle
                                        Objeto.TIPO_COB_ANT.AsString,                    // Tipo de cobranza anticipada
                                        Objeto.SUB_TIPO_COB_ANT.AsString,                // Sub Tipo de cobranza anticipada
                                        Objeto.B_TRANSFERENCIA.AsString,                 // Con transferencia ?
                                        //
                                        sagDATOS.Cells[ COL_BCPG, vlRow ],                     // Comisión por pago anticipado
                                        sagDATOS.Cells[ COL_BPCT, vlRow ],                     // B Porcentaje ?
                                        CurrFromFrmFloat( sagDATOS.Cells[ COL_PCTC, vlRow ] ), // Porcentaje de comisión
                                        CurrFromFrmFloat( sagDATOS.Cells[ COL_IMPC, vlRow ] ), // Importe de comisión
                                        //
                                        vlError );
              if ValidaError( vlError ) then
              begin
                if not ( MessageDlg( coErrorCob, mtConfirmation, [mbYes, mbNo], 0  ) = mrYes ) then
                  exit;       // coErrorCob: 'Ha ocurrido un error. ¿Desea continuar?';
                //end_if
              end;//ends_if_ValidaError(_vlError_)_then
            end;//ends_if_vlAgrega_then
          end;//ends_if_Objeto.StrToBool( Objeto.B_COB_TOTAL.AsString ) then
        end;// if ExisteRegActivo
      end; // for
      //
      //<LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT>
      vlError := '';
      if vlCntAdd > 0 then   // si el contador vlCntAdd es mayor a 0, se deduce que StpAgregaElemento fue ejecutado al menos una vez
        Objeto.StpCobranza(vlError);
      //</ENDS_LOLS_24_AGO_2006>
      //
      ValidaError( vlError );
      // --

      vlIndex := Objeto.StpObtCntLog;
      for vlCnt := 1 to vlIndex do
      begin
        Objeto.StpObtLog( vlCnt, vlResult, vlTxResult );
        if vlResult <> 0 then
          AddLine( MErrores, Format( 'Error %.7d : %s', [ vlResult, vlTxResult ] ) )
        else
          AddLine( MErrores, Format( '%s', [ vlTxResult ] ) )
      end;//ends_for
      MessageIniFinProceso( MErrores, cFinal );
      //
      Objeto.stpLimpiaMultiChqra( vlResult, vlTxResult );
      // Actualiza la pantalla
      MuestraDatos;
  end;
  {
  else begin
  ShowMessage('    No tiene suficientes permisos para esta Acción')
  end;
  }
end;
// +---------------------------------------------------------------------------+
// +                Evento onClic del boton sbLogCobranza                      +
// +---------------------------------------------------------------------------+
procedure TWCrcobranz.sbLogCobranzaClick(Sender: TObject);
var fList      : TStringList;
    fcol, frow : integer;
    Str        : String;
    Token      : String;
begin
 fList := TStringList.Create;
 try
  fList.Clear;
  for frow := 0 to sagDATOS.RowCount - 1 do
  begin
    Str := '';
    for fcol := 0 to sagDATOS.ColCount - 1 do
    begin
      Token := sagDATOS.cells[ fcol, frow ];
      Token := Trim( Token );
      Token := StringReplace( Token, '"', '""', [ rfReplaceAll, rfIgnoreCase ] );
      //
      if Str = '' then
        Str := '"' + Token + '"'
      else
        Str := Str + ',"' + Token + '"';
    end;
    // Delete( Str, length(Str) - 1, 1 );
    fList.Add(Str);
  end;
  fList.SaveToFile('c:\grig_cobra_' + FormatDateTime( 'hhnnss', now )  + '.csv');
  vgLInfoCred.SaveToFile('c:\info_cobra_' + FormatDateTime( 'hhnnss', now )  + '.txt');
 finally
   fList.Free;
 end;
end;


procedure TWCrcobranz.InterForma1DespuesShow(Sender: TObject);
begin
  if Objeto.VALOR_FILTRO.AsString <> '' then Begin
      Objeto.AsignaTipoFiltro( Objeto.VALOR_FILTRO.AsString,  ikValorFiltro);
      if Objeto.COBRANZA.AsString = coCobIM then begin
         oeCOBRANZAClick(pupCobImpagada);
         cbReportados.Checked:= False;
      end;
  end ;
  cbMuestraRSRE.Checked:=false;
end;


procedure TWCrcobranz.btnAParcialXDispClick(Sender: TObject);
var
  Qry            : TQuery;
  strCadSQL      : String;
  // Para determinar cual es el saldo del que se dispone para asignar a cada
  // uno de los posibles rubros.
  SaldoARepartir : Double;

  // Para indicar el importe asignado al rubro que se encuentra en el orden
  // de asignación de la prelación. Este puede ser por el total del rubro si
  // es que el saldo a repartir es >= a éste, o por una parte cuando el saldo
  // es < a importe total del rubro
  ImporteAsignado: Double;

  // En caso de que NO SE MANEJE Garantía FEGA, Liquida o PYME se puede
  // asignar importes del saldo disponible por orden de prelación, en caso
  // contrario, no se asignarán importes y se saldrá del procedure.
  bol_MANEJA_GARANTIA : Boolean;
  bol_B_COB_ORD_ACC   : Boolean;


  // Existen 4 ó 6 rubros del saldo a cobrar, aparecen en pantalla y cuando
  // el orden de prelación esta en falso, sólo se consideran 4 rubros.
  // la variable bol_B_COB_ORD_ACC se emplea para determinar como llevar a
  // cabo el ordenamiento.
  // En caso de que se lleve a cabo el ordenamiento cuando bol_B_COB_ORD_ACC
  // es True, se considera el reparto entre 6 rubros por lo que se emplean:
  // en este caao Capital y el FA se desglosan en Moras y Bruto.
  {sólo se emplean si bol_B_COB_ORD_ACC = F}
  Imp_COMISION   : Double;
  Imp_INTERES    : Double;
  Imp_FINADIC    : Double;
  Imp_CAPITAL    : Double;

  {sólo se emplean si bol_B_COB_ORD_ACC = V}
  // Analizando la funcion ObtImportes y la forma en que el PKGCRCOBRANZA obtienen el orden de prelacion
  // se identificó que los importes de las claves de concepto :
  // IMPBRU + IMPIVA se consideran en conjunto como IMPBRU
  // IMPMOR + IVAMOR se consideran en conjunto como IMPMOR
  // Por lo anterior se requiere el uso de las siguientes 8 variables 2 por cada clave de accesorio

  // CP
  ImpMor_CAPITAL : Double;
  ImpBru_CAPITAL : Double;
  // FN
  ImpMor_FINADIC : Double;
  ImpBru_FINADIC : Double;
  // IN
  ImpMor_INTERES : Double;
  ImpBru_INTERES : Double;
  // CN
  ImpMor_COMISION : Double;
  ImpBru_COMISION : Double;

  // Para indicar el importe asignado a cada rubro en función del Orden de
  // prelación y el saldo disponible, en posible que se empleen para Capital
  // y Finaciamiento Adicional el capital desglosado (Moratorio y BRUTO) o
  // el TOTAL

  {sólo se emplean si bol_B_COB_ORD_ACC = F}
  ImpAsign_COMISION : Double;
  ImpAsign_INTERES   : Double;
  ImpAsign_FINADIC   : Double;
  ImpAsign_CAPITAL   : Double;

  {sólo se emplean si bol_B_COB_ORD_ACC = V}
  ImpAsign_Mor_CAPITAL : Double;
  ImpAsign_Bru_CAPITAL : Double;

  ImpAsign_Mor_FINADIC : Double;
  ImpAsign_Bru_FINADIC : Double;

  ImpAsign_Mor_INTERES : Double;
  ImpAsign_Bru_INTERES : Double;

  ImpAsign_Mor_COMISION : Double;
  ImpAsign_Bru_COMISION : Double;


  {sólo se emplean si bol_B_COB_ORD_ACC = F}
  bol_COMISION  : Boolean;
  bol_INTERES   : Boolean;
  bol_FINADIC   : Boolean;
  bol_CAPITAL   : Boolean;

  {sólo se emplean si bol_B_COB_ORD_ACC = V}
  bol_Bru_FINADIC : Boolean;
  bol_Mor_FINADIC : Boolean;

  bol_Bru_CAPITAL : Boolean;
  bol_Mor_CAPITAL : Boolean;

  bol_Bru_INTERES : Boolean;
  bol_Mor_INTERES : Boolean;

  bol_Bru_COMISION : Boolean;
  bol_Mor_COMISION : Boolean;

  vlclave : String;

begin
//JFOF VALIDA USUARIO 12/10/2011
  vlclave := '03';
   if Objeto.ValidaAccesoEsp('TCRCOBRANZ_PARXD',True,True) then
//  if ValidaUsuario(Objeto.Apli,vlclave) then
//JFOF VALIDA USUARIO 12/10/2011
     begin
   // < AARJ 04 DIC 2009 IMPLEMENTACIÓN DEL EVENTO CLICK DE ASIGNACIÓN DE IMPORTES EN ORDEN DE PRELACION>
   //   Funcionalidad:
   //   Recupera el orden de la prelación en función de la clave del producto
   //   Establece reglas de asignación de los montos en función de los registros
   //   recuperados de la consulta: se puede recuperar 0 , 3 y 4 o 6 claves de
   //   accesorio ordenados por prelación.

   //   La habilitación de este botón está condicionada a que el saldo de la
   //   chequera del acreditado no alcance a cubrir el pago total correspondiente
   //   y que el saldo de la chequera sea > 0.

   //   La asignación de las cantidades se basa en:
   //   Para las que tengan un importe asignado mayor a 0, mientras haya saldo
   //   suficiente, se les asignara en el orden de la prelación recuperado
   //   Si el orden de prelación no puede ser recuperado de la bd, entonces
   //   la asignación de los importes se hará en el orden en que aparecen los
   //   rubros en la pantalla : Conceptos, Interés, F.Adicional, Capital.


   // MODIFICACIONES: (buscar comentarios marcados con < AARJ 03 DIC 2009 >
   // LimpiaRecord:
   // al final del código se deshabilita el botón de prelacion por default.
   // LimpiaRecord se emplea en LimpiaPantalla y esta se encuentra en FormShow

   // GetFromGrid:
   // Modificada para que se habilite el botón en función del saldo de la chequera
   // y si cubre o no el pago total. GetFromGrid se invoca al momento de seleccionar
   // uno de los renglones del grid de datos ver sagDATOSSelectCell

   // </ENDS AARJ 04 DIC 2009>

   SaldoARepartir := Objeto.SDO_CHEQUERA.AsFloat;

   Imp_COMISION  := Objeto.IMP_COMISION.AsFloat;
   Imp_INTERES    := Objeto.IMP_INTERES.AsFloat;
   Imp_FINADIC    := Objeto.IMP_FIN_ADIC.AsFloat;
   Imp_CAPITAL    := Objeto.IMP_CAPITAL.AsFloat;

   // Se desglosan los importes para se consideren los
   // Importes por Moras y los Brutos
   ImpMor_CAPITAL := Objeto.IMP_MORAS_CA.AsFloat;
   ImpBru_CAPITAL := Objeto.IMP_CAPITAL.AsFloat  - Objeto.IMP_MORAS_CA.AsFloat;

   ImpMor_FINADIC := Objeto.IMP_MORAS_FA.AsFloat;
   ImpBru_FINADIC := Objeto.IMP_FIN_ADIC.AsFloat - Objeto.IMP_MORAS_FA.AsFloat;

   ImpMor_INTERES := Objeto.IMP_MORAS_IN.AsFloat;
   ImpBru_INTERES := Objeto.IMP_INTERES.AsFloat  - Objeto.IMP_MORAS_IN.AsFloat;

   ImpMor_COMISION := Objeto.IMP_MORAS_CO.AsFloat;
   ImpBru_COMISION := Objeto.IMP_COMISION.AsFloat  - Objeto.IMP_MORAS_CO.AsFloat;

   // Importes que realmente se asignan, si no alcanza el saldo de la chequera,
   // o no aparecen en la lista del orden de la prelación, el Importe Asignado
   // se encontrará en 0.
   ImpAsign_COMISION    := 0;
   ImpAsign_INTERES     := 0;
   ImpAsign_FINADIC     := 0;
   ImpAsign_CAPITAL     := 0;

   // Importes desglosados
   ImpAsign_Mor_CAPITAL := 0;
   ImpAsign_Bru_CAPITAL := 0;

   ImpAsign_Mor_FINADIC := 0;
   ImpAsign_Bru_FINADIC := 0;

   ImpAsign_Mor_INTERES := 0;
   ImpAsign_Bru_INTERES := 0;

   ImpAsign_Mor_COMISION := 0;
   ImpAsign_Bru_COMISION := 0;


   // Para saber si ya fue asignado algun importe a los rubros,
   // Se emplea especialmente cuando bol_B_COB_ORD_ACC se encuentra en FALSE
   bol_COMISION        := False;
   bol_INTERES         := False;
   bol_FINADIC         := False;
   bol_CAPITAL         := False;

   // Importes desglosados
   bol_Mor_FINADIC     := False;
   bol_Bru_FINADIC     := False;

   bol_Mor_CAPITAL     := False;
   bol_Bru_CAPITAL     := False;

   bol_Mor_INTERES     := False;
   bol_Bru_INTERES     := False;

   bol_Mor_COMISION    := False;
   bol_Bru_COMISION    := False;


   // En caso de que se maneje garantía no se asignarán montos en prelación.
   bol_MANEJA_GARANTIA := True;

   // Si bol_B_COB_ORD_ACC = TRUE, se recupera el orden como en curOrdPrelacion (6 rubros)
   // Si bol_B_COB_ORD_ACC = FALSE, se recupera el orden como en curOrdGenTrn   (4 rubros)
   bol_B_COB_ORD_ACC   := False;


   // Recuperar las banderas para determinar si se permitirá la asignación por prelación
   // REGLA 1: Descartar la asignación de la prelación SI MANEJAN GARANTIA FEGA, LIQUIDA o PYME
   // IF (peRowDisp.b_aplica_gliqu= 'V') OR (peRowDisp.b_aplica_gfega= 'V') THEN
   // ESTOS VALORES SE PUEDEN RECUPERAR POR MEDIO DE LA SIGUIENTE CONSULTA,
   // DONDE SE DEVUELVE F SI NO MANEJAN GARANTIAS O SE DEVUELVE V SI MANEJA CUALQUIERA DE LAS 3.
   strCadSQL := ' SELECT DECODE( COUNT(*), 0, ''F'',''V'' ) B_APLICA_GTIA ' + coCRLF +
                ' FROM   CR_PRODUCTO_GTIA ' + coCRLF +
                ' WHERE  CVE_PRODUCTO_CRE =  ''' + Objeto.CVE_PRODUCTO_CRE.AsString + ''''   + coCRLF + //'035AGR' Ó PEC_CVEPRODUCTO
                '   AND  CVE_GARANTIA in ( ''GTLIQU'',''GTFEGA'',''GTPYME'') ' + coCRLF +
                '   AND  SIT_PRO_GARANTIA = ''AC'' ';
   Qry := GetSQLQueryNoNil( strCadSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );


   if Assigned(Qry) and (Qry.IsEmpty = False) then
   begin
     Qry.First;
     bol_MANEJA_GARANTIA := (Qry.FieldByName('B_APLICA_GTIA').AsString = 'V');
   end;

   if (bol_MANEJA_GARANTIA) then
   begin
     Qry.Close;
     Qry.Free;
     vgHuboGarantias := True;
     if not (vgAplicaAsignacionAtodos) then begin
       ShowMessage(' El crédito maneja Garantía Liquida, FEGA o PYME'+ coCRLF +
                   ' No se permite asignar automáticamente los '+ coCRLF +
                   ' importes en orden de prelación.');

     end;
     exit;
   end;


   // Se continua con el proceso solo si bol_MANEJA_GARANTIA = F
   // REGLA 2: El Orden de la prelación se deberá asignar en función de
   // Si peBCobOrdPre : V emplear  curOrdPrelacion
   // Si peBCobOrdPre : F emplear  curOrdGenTrn
   Qry.Close;
   Qry.Free;
   strCadSQL := ' SELECT PROD.CVE_PRODUCTO_CRE, PROD.B_COB_ORD_ACC ' + coCRLF +
                ' FROM CR_PRODUCTO   PROD ' + coCRLF +
                ' WHERE  PROD.CVE_PRODUCTO_CRE = ''' + Objeto.CVE_PRODUCTO_CRE.AsString + '''' ; //'035AGR' Ó pecCveProducto
   Qry := GetSQLQueryNoNil( strCadSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );

   if Assigned(Qry) and (Qry.IsEmpty = False) then
   begin
     Qry.First;
     bol_B_COB_ORD_ACC := (Qry.FieldByName('B_COB_ORD_ACC').AsString = 'V');
   end;


   Qry.Close;
   Qry.Free;
   if bol_B_COB_ORD_ACC then
     begin
       strCadSQL := ' SELECT CVE_PRODUCTO_CRE, ORD_PRELACION, CVE_ACCESORIO, CVE_CONCEPTO, B_GRUPO  ' + coCRLF +
                    ' FROM (SELECT CVE_PRODUCTO_CRE,  MIN(ORD_PRELACION) ORD_PRELACION, CVE_ACCESORIO,''IMPBRU'' CVE_CONCEPTO, ''V'' B_GRUPO ' + coCRLF +
                    '       FROM   CR_COB_PRELACION COB   ' + coCRLF +
                    '       WHERE  CVE_PRODUCTO_CRE = ''' + Objeto.CVE_PRODUCTO_CRE.AsString + ''''   + coCRLF + //'035AGR' Ó pecCveProducto
                    '       AND  CVE_ACCESORIO IN    ' + coCRLF +
                    '                     (SELECT CVE_ACCESORIO     ' + coCRLF +
                    '                      FROM   CR_COB_PRELACION     ' + coCRLF +
                    '                      WHERE  CVE_PRODUCTO_CRE = ''' + Objeto.CVE_PRODUCTO_CRE.AsString + ''' ' + coCRLF + //'035AGR' Ó pecCveProducto
                    '                        AND  CVE_CONCEPTO NOT IN (''IMPIVA'',''IVAMOR'') ' + coCRLF +
                    '                        AND  B_GRUPO = ''V'' ) ' + coCRLF +
                    '       AND  CVE_CONCEPTO NOT IN (''IMPIVA'', 	''IVAMOR'') '  + coCRLF +
                    '       GROUP BY CVE_PRODUCTO_CRE, CVE_ACCESORIO  '  + coCRLF +
                    '       UNION  '  + coCRLF +
                    '       SELECT CVE_PRODUCTO_CRE, ORD_PRELACION, CVE_ACCESORIO, CVE_CONCEPTO, B_GRUPO ' + coCRLF +
                    '       FROM   CR_COB_PRELACION COB ' + coCRLF +
                    '       WHERE  CVE_PRODUCTO_CRE = ''' + Objeto.CVE_PRODUCTO_CRE.AsString + ''''   + coCRLF + //'035AGR' Ó pecCveProducto
                    '       AND  CVE_ACCESORIO NOT IN ' + coCRLF +
                    '                     (SELECT CVE_ACCESORIO ' + coCRLF +
                    '                      FROM   CR_COB_PRELACION ' + coCRLF +
                    '                      WHERE  CVE_PRODUCTO_CRE = ''' + Objeto.CVE_PRODUCTO_CRE.AsString + ''' ' + coCRLF + //'035AGR' Ó pecCveProducto
                    '                      AND  CVE_CONCEPTO NOT IN (''IMPIVA'', ''IVAMOR'')  ' + coCRLF +
                    '                      AND  B_GRUPO = ''V'' )  ' + coCRLF +
                    '       AND  CVE_CONCEPTO NOT IN (''IMPIVA'',''IVAMOR'') ' + coCRLF +
                    '       )  ' + coCRLF +
                    ' WHERE CVE_ACCESORIO IN (''CN'',''IN'',''FN'',''CP'') ' + coCRLF +
                    ' ORDER BY ORD_PRELACION ';
     end
   else
     begin
       // --------- Construye la cadena SQL de busqueda y obtiene un Query ---------
       // Para la extracción del orden de la prelación se revisó el sp STPCRCOBRANZA y en la revisión
       // se econtro 2 formas de obtener la prelación por medio de los cursores: curOrdPrelacion y
       // curOrdGenTrn, el siguiente Qry corresponde a la prelación en base a curOrdGenTrn que se
       // encuentra en el Header PKGCRCOBRANZA.
       // Este cursor se encuentra en en STPVALORDPRELACION, que se invoca en STPCOBRADISPO.
       strCadSQL := '  SELECT CVE_PRODUCTO_CRE, CVE_ACCESORIO, MIN(ORD_PRELACION) ORD_PRELACION ' + coCRLF +
                    '  FROM   CR_COB_PRELACION '                                                  + coCRLF +
                    '  WHERE  CVE_PRODUCTO_CRE = ''' + Objeto.CVE_PRODUCTO_CRE.AsString + ''''    + coCRLF + // '001AGR' Ó pecCveProducto
                    '   AND   CVE_ACCESORIO IN (''CN'',''IN'',''FN'',''CP'' ) '                   + coCRLF + // pecB_COMISION, pecB_INTERES, pecB_FIN_ADIC, pecB_CAPITAL
                    '  GROUP BY CVE_PRODUCTO_CRE, CVE_ACCESORIO  '                                + coCRLF +
                    '  ORDER BY ORD_PRELACION ';
     end;

   Qry := GetSQLQueryNoNil( strCadSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );


   // Si bol_B_COB_ORD_ACC = False el orden se recupera como en curOrdGenTrn
   if (not bol_B_COB_ORD_ACC) then
   begin

     // CASO 1: Se regresaron 4 elementos en la lista (a lo mas: CN,IN, FN, CP),
     // y es posible que no se hayan recuperado las 4 claves de accesorio, pues existen
     // productos que no tienen FN: financiamiento adicional, por ejemplo : CVE_PRODUCTO_CRE = '001FAC'
     if Assigned(Qry) and (Qry.IsEmpty = False) then
     begin
       Qry.First;
       // mientras haya claves de accesorio y haya Saldo A repartir
       while (not Qry.eof) and (SaldoARepartir > 0.0099) do
       begin
         ImporteAsignado := 0;

         if ((Qry.FieldByName('CVE_ACCESORIO').AsString = 'CN')
             AND (Imp_COMISION > 0))then
         begin
           // asigna el monto que alcance a cubrir
           if (SaldoARepartir >= Imp_COMISION) then
             ImporteAsignado := Imp_COMISION
           else
             ImporteAsignado := SaldoARepartir;

           ImpAsign_COMISION := ImporteAsignado;
           bol_COMISION  := True; // CONCEPTOS FUE PROCESADO
         end

         else begin
           if ((Qry.FieldByName('CVE_ACCESORIO').AsString = 'FN')
                AND (Imp_FINADIC > 0)) then
           begin
             // asigna el monto que alcance a cubrir
             if (SaldoARepartir >= Imp_FINADIC) then
               ImporteAsignado := Imp_FINADIC
             else
               ImporteAsignado := SaldoARepartir;
             ImpAsign_FINADIC := ImporteAsignado;
             bol_FINADIC := True; // FINANCIAMIENTO FUE PROCESADO
           end
           else begin
             if ((Qry.FieldByName('CVE_ACCESORIO').AsString = 'CP')
                  AND (Imp_CAPITAL > 0)) then
             begin
               // asigna el monto que alcance a cubrir
               if (SaldoARepartir >= Imp_CAPITAL) then
                  ImporteAsignado := Imp_CAPITAL
               else
                  ImporteAsignado := SaldoARepartir;
               ImpAsign_CAPITAL := ImporteAsignado;
               bol_CAPITAL := True;  // CAPITAL FUE PROCESADO
             end
             else begin
               if ((Qry.FieldByName('CVE_ACCESORIO').AsString = 'IN')
                    AND (Imp_INTERES > 0)) then
               begin
                 // asigna el monto que alcance a cubrir
                 if (SaldoARepartir >= Imp_INTERES) then
                   ImporteAsignado := Imp_INTERES
                 else
                   ImporteAsignado := SaldoARepartir;
                 ImpAsign_INTERES := ImporteAsignado;
                 bol_INTERES := True; // INTERES FUE PROCESADO
               end;
             end;
           end;
         end;

         Qry.Next;
         SaldoARepartir := SaldoARepartir - ImporteAsignado;
       end; // while (not Qry.eof) and (SaldoARepartir > 0.0099) do
     end; // if Assigned(Qry) and (Qry.IsEmpty = False) then


     // CASO 2 : Si no se regresaron las  claves de accesorio (CN, IN, FA, CP) para determinar el orden entonces:
     // El orden de prelación se encuentra en función del producto, y no todos tienen los 4 rubros,
     // hay productos que solo tienen indicados 3 rubros,  por ejemplo:
     // 001BCP, 001FAC, 001PPI , 002BCP, 002FAC, 002PPI, 003FAC - 018FAC, CREDIV, CRPRTE, REECDV.
     // No se identificaron productos que tuvieran solo 1 o 2, claves de accesorio indicados.
     // Pero si existen productos que no estan indicados en la tabla de ordenes de prelación,
     // Por ejemplo: 007FAC, 012FAC,  015BCE, 016BCE, 001CCI, DUMMY

     // Las Variables booleanas  bol_COMISION , bol_INTERES , bol_FINADIC, bol_CAPITAL
     // pueden estar en falso, debido  a que no se encontraron en el
     // query o debido a que el saldo en chequera no fue suficiente

     // Es posible que haya un sobrante en caso de haber 4 rubros que requieren del pago, pero
     // solo 2 de ellos se encuentran indicados en la base de datos, por lo que 2 de los 4 rubros
     // estarán sin asignar un monto (bol_"RUBRO" = Falso). Esto se cumple si SaldoARepartir > 0
     // Se revisa a que rubros no se les aplico algun importe y se les asigna
     // lo que sea posible en el siguiente orden: CN, IN, FN, CP , esto siempre que el importe
     // requerido sea mayor a 0 : por ejemplo Imp_COMISION > 0.

     if ((not bol_COMISION) OR (not bol_INTERES) OR
           (not bol_FINADIC) OR (not bol_CAPITAL) ) AND
         (SaldoARepartir > 0.0099) then
     begin
       if ((not bol_COMISION) AND (SaldoARepartir > 0.0099) AND (Imp_COMISION > 0)) then
       begin
           ImporteAsignado := 0;
           if (SaldoARepartir >= Imp_COMISION) then
             ImporteAsignado := Imp_COMISION
           else
             ImporteAsignado := SaldoARepartir;
           ImpAsign_COMISION  := ImporteAsignado;
           bol_COMISION  := True;
           SaldoARepartir := SaldoARepartir - ImporteAsignado;
       end;

       if ((not bol_INTERES) AND (SaldoARepartir > 0.0099) AND (Imp_INTERES > 0)) then
       begin
           ImporteAsignado := 0;
           if (SaldoARepartir >= Imp_INTERES) then
             ImporteAsignado := Imp_INTERES
           else
             ImporteAsignado := SaldoARepartir;
           ImpAsign_INTERES := ImporteAsignado;
           bol_INTERES := True;
           SaldoARepartir := SaldoARepartir - ImporteAsignado;
       end;

       if ((not bol_FINADIC) AND (SaldoARepartir > 0.0099) AND (Imp_FINADIC > 0)) then
       begin
           ImporteAsignado := 0;
           if (SaldoARepartir >= Imp_FINADIC) then
             ImporteAsignado := Imp_FINADIC
           else
             ImporteAsignado := SaldoARepartir;
           ImpAsign_FINADIC := ImporteAsignado;
           bol_FINADIC := True;
           SaldoARepartir := SaldoARepartir - ImporteAsignado;
       end;

       if ((not bol_CAPITAL) AND (SaldoARepartir > 0.0099) AND (Imp_CAPITAL > 0)) then
       begin
           ImporteAsignado := 0;
           if (SaldoARepartir >= Imp_CAPITAL) then
             ImporteAsignado := Imp_CAPITAL
           else
             ImporteAsignado := SaldoARepartir;
           ImpAsign_CAPITAL := ImporteAsignado;
           bol_CAPITAL := True;
           SaldoARepartir := SaldoARepartir - ImporteAsignado;
       end;
     end; // CASO 2
   end

   // if (not bol_B_COB_ORD_ACC) then begin ... end  else
   // el orden se recupera como en curOrdPrelacion
   // No se considerará el reparto entre las claves de accesorio
   // que no se recuperen en la consulta del orden de prelacion.
   // Para IMPBRU se consideran los conceptos : IMPBRU e IMPIVA
   // Para IMPMOR se consideran los conceptos : IMPMOR e IVAMOR
   else
   begin
     // CASO UNICO: Se regresaron N claves de accesorio - clave de concepto
     // solo se considerará el reparto entre estos elementos en la lista
     // No se considera la posibilidad de que no se hayan recuperado las
     // todas las claves de accesorio y haya que repartir el saldo entro los
     // accesorios que no se hayan recuperado.
     if Assigned(Qry) and (Qry.IsEmpty = False) then
     begin
       Qry.First;
       // mientras haya claves de accesorio y haya Saldo A repartir
       while (not Qry.eof) and (SaldoARepartir > 0.0099) do
       begin
         ImporteAsignado := 0;

         if (Qry.FieldByName('CVE_ACCESORIO').AsString = 'CN') then
         begin
           if ((Qry.FieldByName('CVE_CONCEPTO').AsString = 'IMPBRU')
              AND (ImpBru_COMISION > 0)) then
           begin
             // asigna el monto que alcance a cubrir
             if (SaldoARepartir >= ImpBru_COMISION) then
               ImporteAsignado := ImpBru_COMISION
             else ImporteAsignado := SaldoARepartir;

             ImpAsign_Bru_COMISION := ImporteAsignado;
             bol_Bru_COMISION := True;
           end;

           if ((Qry.FieldByName('CVE_CONCEPTO').AsString = 'IMPMOR')
               AND (ImpMor_COMISION > 0)) then
           begin
             // asigna el monto que alcance a cubrir
             if (SaldoARepartir >= ImpMor_COMISION) then
               ImporteAsignado := ImpMor_COMISION
             else ImporteAsignado := SaldoARepartir;

             ImpAsign_Mor_COMISION  := ImporteAsignado;
             bol_Mor_COMISION := True;
           end;
         end;


         if (Qry.FieldByName('CVE_ACCESORIO').AsString = 'FN') then
         begin
           if ((Qry.FieldByName('CVE_CONCEPTO').AsString = 'IMPBRU')
              AND (ImpBru_FINADIC > 0)) then
           begin
             // asigna el monto que alcance a cubrir
             if (SaldoARepartir >= ImpBru_FINADIC) then
               ImporteAsignado := ImpBru_FINADIC
             else ImporteAsignado := SaldoARepartir;

             ImpAsign_Bru_FINADIC := ImporteAsignado;
             bol_Bru_FINADIC := True;
           end;

           if ((Qry.FieldByName('CVE_CONCEPTO').AsString = 'IMPMOR')
               AND (ImpMor_FINADIC > 0)) then
           begin
             // asigna el monto que alcance a cubrir
             if (SaldoARepartir >= ImpMor_FINADIC) then
               ImporteAsignado := ImpMor_FINADIC
             else ImporteAsignado := SaldoARepartir;

             ImpAsign_Mor_FINADIC  := ImporteAsignado;
             bol_Mor_FINADIC := True;
           end;
         end;

         if (Qry.FieldByName('CVE_ACCESORIO').AsString = 'CP') then
         begin
           if ((Qry.FieldByName('CVE_CONCEPTO').AsString = 'IMPBRU')
              AND (ImpBru_CAPITAL > 0)) then
           begin
             // asigna el monto que alcance a cubrir
             if (SaldoARepartir >= ImpBru_CAPITAL) then
               ImporteAsignado := ImpBru_CAPITAL
             else ImporteAsignado := SaldoARepartir;

             ImpAsign_Bru_CAPITAL := ImporteAsignado;
             bol_Bru_CAPITAL := True;
           end;

           if ((Qry.FieldByName('CVE_CONCEPTO').AsString = 'IMPMOR')
               AND (ImpMor_CAPITAL > 0)) then
           begin
             // asigna el monto que alcance a cubrir
             if (SaldoARepartir >= ImpMor_CAPITAL) then
               ImporteAsignado := ImpMor_CAPITAL
             else ImporteAsignado := SaldoARepartir;

             ImpAsign_Mor_CAPITAL  := ImporteAsignado;
             bol_Mor_CAPITAL := True;
           end;
         end;


         if (Qry.FieldByName('CVE_ACCESORIO').AsString = 'IN') then
         begin
           if ((Qry.FieldByName('CVE_CONCEPTO').AsString = 'IMPBRU')
              AND (ImpBru_INTERES > 0)) then
           begin
             // asigna el monto que alcance a cubrir
             if (SaldoARepartir >= ImpBru_INTERES) then
               ImporteAsignado := ImpBru_INTERES
             else ImporteAsignado := SaldoARepartir;

             ImpAsign_Bru_INTERES := ImporteAsignado;
             bol_Bru_INTERES := True;
           end;

           if ((Qry.FieldByName('CVE_CONCEPTO').AsString = 'IMPMOR')
               AND (ImpMor_INTERES > 0)) then
           begin
             // asigna el monto que alcance a cubrir
             if (SaldoARepartir >= ImpMor_INTERES) then
               ImporteAsignado := ImpMor_INTERES
             else ImporteAsignado := SaldoARepartir;

             ImpAsign_Mor_INTERES  := ImporteAsignado;
             bol_Mor_INTERES := True;
           end;
         end;

         Qry.Next;
         SaldoARepartir := SaldoARepartir - ImporteAsignado;
       end; //while
     end; // if Assigned(Qry) and (Qry.IsEmpty = False) then
   end; // if (not bol_B_COB_ORD_ACC) then bEgin ... end  else begin ... end;


   // se libera el Query empleado para la consulta del orden de prelación
   Qry.Close;
   Qry.Free;

   // Hasta este punto ya se cuenta con los importes que se puede asignar
   // a cada uno de los rubros, despues de asignar los valores a cada uno de
   // los controles, se ejecuta ProcesaImportes indirectamente, mediante el
   // evento Exit de cada control: Conceptos, Interes, FinAdic, Capital, para
   // actualizar los datos indicados en el grid de datos.

   if bol_B_COB_ORD_ACC then
   begin
     edFINADIC.Text   := FloatToStr(ImpAsign_Mor_FINADIC + ImpAsign_Bru_FINADIC);
     edFinAdicExit(edFinAdic);

     edCAPITAL.Text   := FloatToStr(ImpAsign_Mor_CAPITAL + ImpAsign_Bru_CAPITAL);
     edCapitalExit(edCapital);

     edINTERES.Text   := FloatToStr(ImpAsign_Mor_INTERES + ImpAsign_Bru_INTERES);
     edInteresExit(edInteres);

     edCONCEPTOS.Text := FloatToStr(ImpAsign_Mor_COMISION + ImpAsign_Bru_COMISION);
     edConceptosExit(edCONCEPTOS);
   end
   else begin
     edCONCEPTOS.Text:= FloatToStr(ImpAsign_COMISION);
     edConceptosExit(edCONCEPTOS);

     edINTERES.Text  := FloatToStr(ImpAsign_INTERES);
     edInteresExit(edInteres);

     edFINADIC.Text  := FloatToStr(ImpAsign_FINADIC);
     edFinAdicExit(edFinAdic);

     edCAPITAL.Text  := FloatToStr(ImpAsign_CAPITAL);
     edCapitalExit(edCapital);
   end;

   // Una vez asignados los valores en los controles, se marcan los
   // check boxes correspondientes para que sean aplicados en la cobranza.
   if ((bol_CAPITAL)      and (ImpAsign_CAPITAL     > 0)) OR    // En caso de asignar unicamente a CAPITAL       cuando bol_B_COB_ORD_ACC = False
      ((bol_Mor_CAPITAL ) and (ImpAsign_Mor_CAPITAL > 0)) OR    // En caso de asignar unicamente a Mora  CAPITAL cuando bol_B_COB_ORD_ACC = True
      ((bol_Bru_CAPITAL ) and (ImpAsign_Bru_CAPITAL > 0)) then  // En caso de asignar unicamente a Bruto CAPITAL cuando bol_B_COB_ORD_ACC = True
     cbCAPITAL.Checked := True
   else
     cbCAPITAL.Checked := False;
   cbCAPITALClick(cbCAPITAL);


   if ((bol_FINADIC)     and (ImpAsign_FINADIC     > 0)) OR     // En caso de asignar unicamente a FINADIC      cuando bol_B_COB_ORD_ACC = False
      ((bol_Mor_FINADIC) and (ImpAsign_Mor_FINADIC > 0)) OR     // En caso de asignar unicamente a Mora  FINADIC cuando bol_B_COB_ORD_ACC = True
      ((bol_Bru_FINADIC) and (ImpAsign_Bru_FINADIC > 0)) then   // En caso de asignar unicamente a Bruto FINADIC cuando bol_B_COB_ORD_ACC = True
     cbFinAdic.Checked := True
   else
     cbFinAdic.Checked := False;
   cbFinAdicClick(cbFinAdic);


   if ((bol_INTERES)     and (ImpAsign_INTERES     > 0)) OR     // En caso de asignar unicamente a INTERES      cuando bol_B_COB_ORD_ACC = False
      ((bol_Mor_INTERES) and (ImpAsign_Mor_INTERES > 0)) OR     // En caso de asignar unicamente a Mora  INTERES cuando bol_B_COB_ORD_ACC = True
      ((bol_Bru_INTERES) and (ImpAsign_Bru_INTERES > 0)) then   // En caso de asignar unicamente a Bruto INTERES cuando bol_B_COB_ORD_ACC = True
     cbINTERES.Checked := True
   else
     cbINTERES.Checked := False;
   cbINTERESClick(cbINTERES);


   if ((bol_COMISION )    and (ImpAsign_COMISION     > 0)) OR     // En caso de asignar unicamente a COMISION      cuando bol_B_COB_ORD_ACC = False
      ((bol_Mor_COMISION) and (ImpAsign_Mor_COMISION > 0)) OR     // En caso de asignar unicamente a Mora  COMISION cuando bol_B_COB_ORD_ACC = True
      ((bol_Bru_COMISION) and (ImpAsign_Bru_COMISION > 0)) then   // En caso de asignar unicamente a Bruto COMISION cuando bol_B_COB_ORD_ACC = True
     cbCONCEPTOS.Checked := True
   else
     cbCONCEPTOS.Checked := False;
   cbCONCEPTOSClick(cbCONCEPTOS);
  end;
  {else
  begin
  ShowMessage('    No tiene suficientes permisos para esta Acción');
  end;}
end;


procedure TWCrcobranz.btnAParcialATodosClick(Sender: TObject);
var vlRow      : Integer;
    vlCurrRow  : Integer;
    vlCurrCol  : Integer;
    vlFecha    : TDate;
    vlClave    : String;
begin
//JFOF VALIDA USUARIO 12/10/2011
    vlClave := '04';
// if ValidaUsuario(Objeto.Apli,vlclave) then
   if Objeto.ValidaAccesoEsp('TCRCOBRANZ_PARTD',True,True) then
//JFOF VALIDA USUARIO 12/10/2011
   begin
     vgAplicaAsignacionAtodos := True;

     if ( MessageDlg( ('Confirma asignar a todos los pagos que tienen ' + coCRLF +
                        'saldo en chequera insuficiente, la asignación ' + coCRLF +
                       'de importes en orden de la prelación ?'),
                       mtConfirmation, mbYesNoCancel, 0 ) = mrYes ) then
     begin
       for vlRow := 0 to ( sagDATOS.RowCount - 1 ) do  // Procesa todos los registros
       begin
         GetFromGrid( vlRow, 0 );
         if ((Objeto.B_CUBRE_PAGO.AsString = 'F') and (Objeto.SDO_CHEQUERA.AsFloat > 0) ) then
         begin
              btnAParcialXDispClick(self);
         end;
       end;
     end;
     if vgHuboGarantias then begin
       ShowMessage(' Hubo creditos con Garantía Liquida, FEGA o PYME'+ coCRLF +
                   ' No se permitió asignar automáticamente los '+ coCRLF +
                   ' importes en orden de prelación.');
     end;

     vgAplicaAsignacionAtodos := False;
     vgHuboGarantias := False;

     ShowMessage(' Fin de proceso: "Asignación Parcial Todos"'+ coCRLF +
                 '  '+ coCRLF +
                 '  ');
   end;
{ else
 begin
  ShowMessage('    No tiene suficientes permisos para esta Acción');
 end;}
end;
 
function TCrcobranz.StpValImpBloq(peIdCredito: Integer;
                                  peFCobranza: TDate): Double;
var
  stpImpBloqCom : TStoredProc;
begin
  Result := -1;
  try
    stpImpBloqCom := TStoredProc.Create(Nil);
    try
      with stpImpBloqCom do
      begin
        DatabaseName   := Apli.DatabaseName;
        SessionName    := Apli.SessionName;
        StoredProcName := 'PKGCRCOMISIONES.STPIMPBLOQCOM';
        Params.Clear;
        //
        Params.CreateParam( ftFloat,  'PEIDCREDITO',   ptInput  );
        Params.CreateParam( ftDate,   'PEFCOBRANZA',   ptInput  );
        Params.CreateParam( ftFloat,  'PSSDOBLOQ',     ptOutput  );
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput );
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput );
        //
        ParamByName( 'PEIDCREDITO' ).AsInteger := peIdCredito;
        ParamByName( 'PEFCOBRANZA' ).AsDate  := peFCobranza;
        //
        ExecProc;
        //
        if ParamByName( 'PSRESULTADO' ).AsInteger = 0 then
        begin
          Result := ParamByName( 'PSSDOBLOQ' ).AsFloat;
        end else begin
          MessageDlg('Error: '   + coCRLF +
                     'Código : ' + ParamByName('PSRESULTADO').AsString   + coCRLF +
                     'Mensaje: ' + ParamByName('PSTXRESULTADO').AsString,
                     mtError, [mbOk], 0 );
        end;
      end;
    finally
      if assigned(stpImpBloqCom) then
        stpImpBloqCom.Free;
    end;
  except
    on e : exception do
    begin
      MessageDlg( 'Error al buscar el monto de comisión bloqueado en chequeras >>' + e.Message,
                  mtError, [mbOk],  0 );
    end;
    //
  end;
  //

end;

procedure TWCrcobranz.cbMuestraRSREClick(Sender: TObject);
begin
  //HERJA ABRIL 2013
  //SE PONEN FILTROS PARA NO TOMAR CREDITOS EN PROCESO DE REESTRUCTURA/RECUPERACION
  if cbMuestraRSRE.Checked=false then
     vlMuestraRSRE:= '   AND CR.ID_CREDITO NOT IN (SELECT ID_CRED_RENOVADO FROM CR_RR_CREDITO WHERE SIT_RENUEVA=''NA'' ) '
  else
     vlMuestraRSRE:='';
  MuestraDatos;     
  //FIN HERJA ABRIL 2013
end;

End.


