// Sistema         : Clase de CRCONSULTA
// Fecha de Inicio : 13/04/2004
// Función forma   : Clase de CRCONSULTA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrconsult;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Tabs, Grids, DBGrids,
InterApl, IntCtoPanel, IntCtoHeader, IntGenCre, ImgList, Menus,

Gauges, Excel97, OleServer, IntCrActPa,

IntParamCre,   // Objeto de Parametros
IntCrCapital,  // Periodos de Capital
IntCrInteres,  // Periodos de Interés
IntCrComisio,  // Periodos de Comisión
IntCrDocto,    // Alta de Documentos
IntPrgaVenci,  // Prórroga por Fecha de Vencimiento
IntPrgaajust,  // Prórroga por Ajuste de Importe
IntPrgaincre;  // Prórroga por Incremento de Periodo

const
//   CO_A_SITUACION : Array [0..5] of String = ('',CSIT_AC, CSIT_LQ, CSIT_IM, CSIT_PA, CSIT_CA);  RABA JUN 2015 SE AGREGA SITUACIÓN FA (FINANCIAMIENTO ADICIONAL)
   CO_A_SITUACION : Array [0..6] of String = ('',CSIT_AC, CSIT_LQ, CSIT_IM, CSIT_PA, CSIT_CA, CSIT_FA);
   CO_A_LBL_DOCTO : Array[0..9] of String = ('','','','Nominal','Aforado','Remanente','Compra','Interés','Pagado','Vencido');

   CO_WORDIMP = 'Importe';
   CO_WORDIVA = 'IVA';
   CO_WORDSUB = 'Subtotal';
   CO_WORDTOT = 'Total';
   CO_WORDPDO = 'Periodo ';
   CO_WORDTPD = 'Tot. Per.';
{EASA4011       02112005
   CO_CAP_OCULTAR = '<<';
   CO_WIDTH_1_BTN = 22;
   CO_LEFT_1_BTN = 150;
   CO_CAP_MOSTRAR = 'Mostrar Capital >>';
   CO_WIDTH_2_BTN = 171;
   CO_LEFT_2_BTN = 0;
OFF EASA}
   CO_DEBE_ESTAR_ACTIVO = 'Para realizar la prórroga, debe de encontrarse el registro "Activo" ó "Por Activar".';

   CO_CHECKED   = 'V';
   CO_UNCHECKED = 'F';
   CO_NOTCHECK  = '-';

   CO_ROWSEP = 5;
   CO_ROWSEP2 = 1;
   CO_WIDTH_FECHA  = 64;
   CO_WIDTH_DINERO = 74;
   CO_WIDTH_DINERO2= 60;
   CO_WIDTH_DINERO3= 100;

   CO_COL1 = 0;
   CO_COL2 = CO_COL1 + 1;
   CO_COL3 = CO_COL2 + 1; // Se ocupa para la Situacion
   CO_COL4 = CO_COL3 + 1; // Num_Periodo únicamente para Interés
   CO_COL5 = CO_COL4 + 1; // Fecha de Vencimiemto únicamente para Interés

   CO_ERROR     = 'ERR';  // Mensaje de Error
   CO_CORTE     = 'COR';  // Corte de Periodo
   CO_CORTE1    = 'COR1'; // Corte 1 de Periodo ( Se usa para la descrpcion de la comisión )
   CO_DETALLE   = 'DET';  // Detalle
   CO_SUBTOTAL  = 'SUB';  // Subtotal
   CO_TOTAL     = 'TOT';  // Total
   CO_SEPARADOR = 'SEP';  // Separador

  { INICIO Constantes Capital }
   CO_CAP_NUM_PERIODO       = CO_COL3 + 1;
   CO_CAP_F_VENCIMIENTO     = CO_COL3 + 2;
   CO_CAP_F_PROG_PAGO       = CO_COL3 + 3;
   CO_CAP_F_PAGO            = CO_COL3 + 4;

   CO_CAP_TITULO            = CO_COL3 + 5;

   CO_CAP_IMP_CAPITAL       = CO_COL3 + 6;
   CO_CAP_IMP_PAGADO        = CO_COL3 + 7;
   CO_CAP_IMP_VENCIDO       = CO_COL3 + 8;

   CO_CAP_IMP_MORATORIO     = CO_COL3 + 9;
   CO_CAP_IMP_PAGADO_MORA   = CO_COL3 + 10;
   CO_CAP_IMP_CONDONADO_MORA= CO_COL3 + 11;
   CO_CAP_IMP_VENCIDO_MORA  = CO_COL3 + 12;

   CO_CAP_SIT_CAPITAL       = CO_COL3 + 13;

   CO_CAP_IMP_IVA_MORA      = CO_COL3 + 9;
   CO_CAP_IMP_PAG_IVA_MORA  = CO_COL3 + 10;
  { FIN Constantes Capital }


  { INICIO Constantes Interés }
   CO_INT_NUM_PERIODO       = CO_COL5 + 1;

   CO_INT_F_VENCIMIENTO     = CO_COL5 + 2;
   CO_INT_F_PROG_PAGO       = CO_COL5 + 3;
   CO_INT_F_PAGO            = CO_COL5 + 4;

   CO_INT_TITULO            = CO_COL5 + 5;

   CO_INT_IMP_INTERES       = CO_COL5 + 6;
   CO_INT_IMP_PAGADO        = CO_COL5 + 7;
   CO_INT_IMP_VENCIDO       = CO_COL5 + 8;

   CO_INT_IMP_IVA           = CO_COL5 + 6;
   CO_INT_IMP_IVA_PAGADO    = CO_COL5 + 7;
   CO_INT_IMP_IVA_VENCIDO   = CO_COL5 + 8;

   CO_INT_B_FINANC          = CO_COL5 + 9;

   CO_INT_CVE_FINANC        = CO_COL5 + 10;

//   CO_INT_SIT_INTERES       = CO_COL5 + 10;
   CO_INT_SIT_INTERES       = CO_COL5 + 11;

   CO_MENSAJE_FIN  = 'Esta séguro de modificar el Financiamiento Adicional.';

   {ON CONSTANTES DE MORATORIOS DE INTERES EASA4011 02112005}
   CO_INT_IMP_MORATORIO     = CO_COL3 + 1;
   CO_INT_IMP_PAGADO_MORA   = CO_COL3 + 2;
   CO_INT_IMP_CONDONADO_MORA= CO_COL3 + 3;

   CO_INT_IMP_IVA_MORA      = CO_COL3 + 1;
   CO_INT_IMP_PAG_IVA_MORA  = CO_COL3 + 2;
   CO_INT_IMP_IVA_COND_MOR  = CO_COL3 + 3;
   {OFF CONSTANTES DE MORATORIOS DE INTERES EASA4011}

  { FIN Constantes Interés }

  { INICIO Constantes Capital Adicional }
   CO_CAP2_IMP_CAPITAL      = CO_COL3 + 1;
   CO_CAP2_F_VENCIMIENTO    = CO_COL3 + 2;
  { INICIO Constantes Capital Adicional }

  { INICIO Constantes Comisión }
   CO_COM_NUM_PERIODO      = CO_COL3 + 1;
   CO_COM_DESC_COMISION    = CO_COL3 + 1;

   CO_COM_F_VENCIMIENTO    = CO_COL3 + 2;
   CO_COM_F_PROG_PAGO      = CO_COL3 + 3;
   CO_COM_F_PAGO           = CO_COL3 + 4;

   CO_COM_TITULO           = CO_COL3 + 5;

   CO_COM_IMP_COMISION     = CO_COL3 + 6;
   CO_COM_IMP_PAGADO       = CO_COL3 + 7;
   CO_COM_IMP_VENCIDO      = CO_COL3 + 8;

   CO_COM_IMP_IVA          = CO_COL3 + 6;
   CO_COM_IMP_IVA_PAGADO   = CO_COL3 + 7;
   CO_COM_IMP_IVA_VENCIDO  = CO_COL3 + 8;

   CO_COM_IMP_MORATORIO    = CO_COL3 + 9;
   CO_COM_IMP_PAGADO_MORA  = CO_COL3 + 10;
   CO_COM_IMP_VENCIDO_MORA = CO_COL3 + 11;

   CO_COM_IMP_IVA_MORA     = CO_COL3 + 9;
   CO_COM_IMP_PAG_IVA_MORA = CO_COL3 + 10;
   CO_COM_IMP_VEN_IVA_MORA = CO_COL3 + 11;

   CO_COM_SIT_COMISION     = CO_COL3 + 12;

   CO_COM_CVE_COMISION     = CO_COL3 + 13;
  { FIN Constantes Comisión }

  { INICIO Constantes Documentos }
   CO_DOC_ID_DOCUMENTO       = CO_COL3 + 1;
   CO_DOC_CVE_TIPO_INTERES   = CO_COL3 + 2;
   CO_DOC_F_COMPRA           = CO_COL3 + 3;
   CO_DOC_F_PROG_PAGO        = co_col3 + 4;
   CO_DOC_F_PAGO             = co_col3 + 5;

   CO_DOC_TITULO             = co_col3 + 5;

   CO_DOC_IMP_NOMINAL        = CO_COL3 + 1;
   CO_DOC_IMP_AFORADO        = CO_COL3 + 2;
   CO_DOC_IMP_REMANENTE      = CO_COL3 + 3;
   CO_DOC_IMP_COMPRA         = CO_COL3 + 4;
   CO_DOC_IMP_INTERES        = CO_COL3 + 5;
   CO_DOC_IMP_PAGADO         = CO_COL3 + 6;
   CO_DOC_IMP_VENCIDO        = CO_COL3 + 7;

   CO_DOC_SIT_DOCUMENTO      = CO_COL3 + 1;
  { FIN Constantes Documentos }


  { INICIO Constantes Financiamiento }
   CO_NUM_PERIODO            = CO_COL3 + 1;
   CO_F_VENCIMIENTO          = CO_COL3 + 2;
   CO_F_PROG_PAGO            = CO_COL3 + 3;
   CO_F_PAGO                 = CO_COL3 + 4;

   CO_FIN_TITULO             = co_col3 + 5;

   CO_IMP_FINAN_ADIC         = CO_COL3 + 6;
   CO_IMP_PAGADO             = CO_COL3 + 7;
   CO_IMP_FINAN_VENCIDO      = CO_COL3 + 8;
   CO_SIT_FINAN_ADIC         = CO_COL3 + 9;
  { FIN Constantes Financiamiento }

  CO_MENSAJE_CVEFIN  = 'Esta séguro de modificar el Tipo de Financiamiento Adicional.';
  Co_Verdad = 'V';
  Co_Falso  = 'F';
  Co_Directo    = 'DR';
  Co_Prorrateo  = 'PR';

Type
 TConsulta = (ftCapital, ftInteres, ftComision, ftDocumentos, ftFinanciamiento, ftNone);
 TArrayDouble = Array of Double;

Type
 TCrconsult= class;

  TWCrconsulta=Class(TForm)
    InterForma1             : TInterForma;
    pgctrlConsulta: TPageControl;
    tbstSituacion: TTabSet;
    tbshtCapital: TTabSheet;
    tbshtInteres: TTabSheet;
    tbshtComision: TTabSheet;
    tbshtDocumentos: TTabSheet;
    tbshtFinanciamiento: TTabSheet;
    PnlTitulos: TPanel;
    shp5: TShape;
    shp4: TShape;
    shp6: TShape;
    shp7: TShape;
    shp9: TShape;
    shp10: TShape;
    Shape8: TShape;
    shp11: TShape;
    shp8: TShape;
    Shape17: TShape;
    lblFecha: TLabel;
    lblVencimiento: TLabel;
    lblProgramado: TLabel;
    lblPago: TLabel;
    lblImpProgramado: TLabel;
    lblImpPagado: TLabel;
    lblImpVencido: TLabel;
    lblImpCapital: TLabel;
    lblSituacion: TLabel;
    Shape10: TShape;
    shp12: TShape;
    shp13: TShape;
    shp14: TShape;
    lblImporteMora: TLabel;
    lblMoraAcumulado: TLabel;
    lblMOraPAgado: TLabel;
    lblMoraVencido: TLabel;
    strgrdCapital: TStringGrid;
    Shape2: TShape;
    Label2: TLabel;
    strgrdInteres: TStringGrid;
    pnlTitulosInteres: TPanel;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape9: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblImpInteres: TLabel;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Label16: TLabel;
    lbl3: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    Shape24: TShape;
    Label17: TLabel;
    Shape25: TShape;
    Label18: TLabel;
    Shape26: TShape;
    lbl4: TLabel;
    strgrdDocumentos1: TStringGrid;
    strgrdDocumentos2: TStringGrid;
    strgrdDocumentos3: TStringGrid;
    Shape27: TShape;
    Shape28: TShape;
    shp3: TShape;
    lblDescripcion: TLabel;
    Shape29: TShape;
    Shape30: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Shape33: TShape;
    Shape34: TShape;
    Shape35: TShape;
    Shape36: TShape;
    Shape37: TShape;
    Shape38: TShape;
    Shape39: TShape;
    Shape40: TShape;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    lblImpComision: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    strgrdComision: TStringGrid;
    lbID_CREDITO: TLabel;
    icpCONTRATO: TInterCtoPanel;
    edID_CREDITO        : TEdit;
    lblPeriodos: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label31: TLabel;
    Shape41: TShape;
    Shape42: TShape;
    Label32: TLabel;
    strgrdFinanciamiento: TStringGrid;
    Panel2: TPanel;
    Shape43: TShape;
    Shape44: TShape;
    Shape45: TShape;
    Shape46: TShape;
    Shape47: TShape;
    Shape48: TShape;
    Shape49: TShape;
    Shape50: TShape;
    Shape51: TShape;
    Shape52: TShape;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Panel3: TPanel;
    btnRefrescar: TBitBtn;
    btnExcellSelected: TBitBtn;
    btnExcellAll: TBitBtn;
    lblPeriodo: TLabel;
    edNum_Periodo: TEdit;
    btnIr: TBitBtn;
    Shape1: TShape;
    Label1: TLabel;
    ImageList: TImageList;
    tbshtNone: TTabSheet;
    lblMsgError: TLabel;
    Shape53: TShape;
    PopupMenuCapital: TPopupMenu;
    ProrrogaxFechadeVencimiento1: TMenuItem;
    ProrrogaxAjustedeImporte1: TMenuItem;
    ProrrogaxIncdePeriodo1: TMenuItem;
    ConsultadePeriodo1: TMenuItem;
    N1: TMenuItem;
    PopupMenuInteres: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    ProrrogaxFechadeVencimiento2: TMenuItem;
    PanelSituacion: TPanel;
    shp17: TShape;
    Label10: TLabel;
    shpLiquidados: TShape;
    lblLiquidados: TLabel;
    lblActivos: TLabel;
    shpActivos: TShape;
    lblNoAutorizados: TLabel;
    shpNoAutorizados: TShape;
    lblCancelados: TLabel;
    shpCancelados: TShape;
    Shape56: TShape;
    Label44: TLabel;
    Shape57: TShape;
    lblMOraCondonado: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Shape54: TShape;
    Label42: TLabel;
    Shape55: TShape;
    Label43: TLabel;
    strgrdCapital2: TStringGrid;
    TabSheet2: TTabSheet;
    Panel4: TPanel;
    Shape69: TShape;
    Shape71: TShape;
    Shape72: TShape;
    Label55: TLabel;
    Label58: TLabel;
    Shape73: TShape;
    Label59: TLabel;
    strgrdMorasInt: TStringGrid;
    Label57: TLabel;
    Shape58: TShape;
    Label45: TLabel;
    Rtfinan: TRadioGroup;
    cbAllFA: TCheckBox;
    GBFProg: TGroupBox;
    lbArchivoEntrada: TLabel;
    sbArchivoEntrada: TSpeedButton;
    edArchivoEntrada: TEdit;
    bbImportar: TBitBtn;
    pAniBar: TPanel;
    Rconcepto: TRadioGroup;
    bbCamFhProg: TBitBtn;
    odArchivoEntrada: TOpenDialog;
    ExcelWorksheetI: TExcelWorksheet;
    ExcelApplicationI: TExcelApplication;
    ExcelWorkbookI: TExcelWorkbook;
    Label46: TLabel;
    edF_FIN_PERGRA_FA: TEdit;         // --- ASOR --- MAYO 2016 ---
    Label47: TLabel;                  // --- ASOR --- MAYO 2016 ---
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure btnRefrescarClick(Sender: TObject);
    procedure pgctrlConsultaChange(Sender: TObject);
    procedure tbstSituacionChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure strgrdCapitalDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure edNum_PeriodoKeyPress(Sender: TObject; var Key: Char);
    procedure btnIrClick(Sender: TObject);
    procedure strgrdDocumentos1SelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure strgrdCapitalDblClick(Sender: TObject);
    procedure strgrdCapitalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgrdDocumentos3TopLeftChanged(Sender: TObject);
    procedure ConsultadePeriodo1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure PopupMenuCapitalPopup(Sender: TObject);
    procedure ProrrogaxAjustedeImporte1Click(Sender: TObject);
    procedure ProrrogaxIncdePeriodo1Click(Sender: TObject);
    procedure ProrrogaxFechadeVencimiento1Click(Sender: TObject);
    procedure ProrrogaxFechadeVencimiento2Click(Sender: TObject);
    procedure strgrdInteresMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure strgrdInteresSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure strgrdInteresTopLeftChanged(Sender: TObject);
    procedure strgrdInteresClick(Sender: TObject);
    procedure RtfinanClick(Sender: TObject);
    procedure cbAllFAClick(Sender: TObject);
    procedure sbArchivoEntradaClick(Sender: TObject);
    procedure bbImportarClick(Sender: TObject);
    procedure bbCamFhProgClick(Sender: TObject);
    private
    { Private declarations }
     vg_Credito : Integer;
     vg_bMuestraIva : Boolean;
     vgGrid : TStringGrid;

     function Get_SituacionActual : String;
     procedure Set_SituacionActual(pValor : String);

     function Get_ConsultaActual : TConsulta;
     procedure Set_ConsultaActual(pValor : TConsulta);

     procedure Set_Credito(pValor : Integer);

     function Get_Aplica_IVA : Boolean;

     procedure MuestraCapital(pID_CREDITO : Integer; pSIT_CREDITO : String);
     procedure MuestraInteres(pID_CREDITO : Integer; pSIT_CREDITO : String);
     procedure MuestraComision(pID_CREDITO : Integer; pSIT_CREDITO : String);
     procedure MuestraDocumentos(pID_CESION : Integer; pSIT_DOCUMENTO : String);
     procedure MuestraFinanciamiento(pID_CREDITO : Integer; pSIT_CREDITO : String);

     procedure Mostrar(pstrSituacion  : String);
     procedure MostrarDetallePeriodo(StrGrd : TStringGrid);
     procedure MostrarTotalPeriodos(pStrSituacion : String);
     procedure MostrarPaginaError;

     procedure MuestraTabuladores(pID_CREDITO : Integer);
     procedure IniciaError(var StrGrd : TStringGrid);
     procedure AgregaEspacioParaTotales( var StrGrd : TStringGrid; var nRow : Integer; nColTitulo : Integer);
     procedure CalculaTotales(var StrGrd : TStringGrid; nRowTotales : Integer; const AColumnasTotales : Array of Integer );

     procedure InvertCheck(StrinGrid : TStringGrid; nCol, nRow : Integer);

    public
    { Public declarations }
    Objeto : TCrconsult;
    VGI_RENGLON : Integer;
    Procedure   ActualizaCveFinAdic(PEIDCredito, PEnumperiodo : Integer; PEFinAdic:String);
    Procedure   ActualizaINT_FND(PEIDCredito, PENUM_PERIODO : Integer);
    Procedure   ModFProgCuota(PPNumCuota : Integer;PPAccesorio : String;PPProgCuota :Double; PPAutomat : Integer);

    published
    { Published daclarations }
     property SituacionActual : String Read Get_SituacionActual Write Set_SituacionActual;
     property ConsultaActual : TConsulta Read Get_ConsultaActual Write Set_ConsultaActual;
     property Credito : Integer Read vg_Credito Write Set_Credito;
     property Aplica_IVA : Boolean Read Get_Aplica_IVA;
    end;

 TCrconsult= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre                     : TParamCre;
        Contrato                     : TCtrlCto;
        Opcion                       : TConsulta;

        ID_CREDITO                   : TInterCampo;
        NUM_PERIODO                  : TInterCampo;
        SIT_CREDITO                  : TInterCampo;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

function Consulta_Credito(pOpcion : TConsulta; pID_CREDITO, pNUM_PERIODO : Integer;
                  pSIT_CREDITO, pCVE : String; pApli : TInterApli; pParamCre : TParamCre) : TModalResult;

implementation
{$R *.DFM}


function Consulta_Credito(pOpcion : TConsulta; pID_CREDITO, pNUM_PERIODO : Integer;
                  pSIT_CREDITO, pCVE : String; pApli : TInterApli; pParamCre : TParamCre) : TModalResult;
var Crconsult : TCrconsult;
begin
  Crconsult := TCrconsult.Create(Nil);
  Crconsult.Apli := pApli;
  Crconsult.ParamCre := pParamCre;
  Crconsult.ID_CREDITO.AsInteger  := pID_CREDITO;
  Crconsult.NUM_PERIODO.AsInteger := pNUM_PERIODO;
  Crconsult.SIT_CREDITO.AsString  := pSIT_CREDITO;
  Crconsult.Opcion := pOpcion;
  Crconsult.ShowWindow(ftConsulta);
end;


constructor TCrconsult.Create( AOwner : TComponent );
begin Inherited;
  ID_CREDITO    := CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
  NUM_PERIODO   := CreaCampo('NUM_PERIODO',ftInteger,tsNinguno,tsNinguno,False);
  SIT_CREDITO   := CreaCampo('SIT_CREDITO',ftString,tsNinguno,tsNinguno,False);

  Contrato := TCtrlCto.Create(Self);
  Contrato.MasterSource := Self;
  Contrato.ID_CONTRATO.MasterField := 'ID_CONTRATO';

  { Inicializa Valores }
  ID_CREDITO.AsInteger  := -1;
  NUM_PERIODO.AsInteger := -1;
  SIT_CREDITO.AsString  := '';
end;

Destructor TCrconsult.Destroy;
begin inherited;
end;

function TCrconsult.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrconsulta;
begin
   W:=TWCrconsulta.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;

      W.Credito            := W.Objeto.ID_CREDITO.AsInteger;
      W.edNum_Periodo.Text := IntToStr(W.Objeto.NUM_PERIODO.AsInteger);
      W.SituacionActual    := W.Objeto.SIT_CREDITO.AsString;
      W.ConsultaActual     := W.Objeto.Opcion;
      W.btnRefrescarClick(Self);

      // Si llegase a no mostrarse la consulta que solicito el usuario
      // debido a que las banderas de CR_PRODUCTO no lo permiten mostrar entonces
      // Muestra la página de Error
      If (W.ConsultaActual <> W.Objeto.Opcion) Then
        W.MostrarPaginaError;

      W.btnIrClick(Self);

      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrconsult.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrconsu.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CRCONSULTA********************)
(*                                                                              *)
(*  FORMA DE CRCONSULTA                                                            *)
(*                                                                              *)
(***********************************************FORMA CRCONSULTA********************)

Procedure TWCrconsulta.ModFProgCuota(PPNumCuota : Integer;PPAccesorio : String;PPProgCuota:Double; PPAutomat : Integer);
var STPObtSuc  : TStoredProc;
begin
     try
        STPObtSuc:=TStoredProc.Create(Nil);
        STPObtSuc.DatabaseName:=Objeto.Apli.DatabaseName;
        STPObtSuc.SessionName:=Objeto.Apli.SessionName;

        STPObtSuc.StoredProcName:='PKGCRCUOTAS.STPMODFPROGCONC_CRED';
        //
        STPObtSuc.Params.CreateParam(ftInteger,'PEIDCredito',ptInput);
        STPObtSuc.Params.CreateParam(ftString, 'PECveAccesorio',ptInput);
        STPObtSuc.Params.CreateParam(ftInteger,'PENumPeriodo',ptInput);
        STPObtSuc.Params.CreateParam(ftFloat,  'PEFProgCuota',ptInput);
        STPObtSuc.Params.CreateParam(ftInteger,'PEModoAut',ptInput);
        STPObtSuc.Params.CreateParam(ftString, 'PECommit',ptInput);
        STPObtSuc.Params.CreateParam(ftFloat,  'PSResultado',ptOutput);
        STPObtSuc.Params.CreateParam(ftString, 'PSTXResultado',ptOutput);
        //
        STPObtSuc.Prepare;
        //
        STPObtSuc.ParamByName('PEIDCredito').AsInteger := Credito;
        STPObtSuc.ParamByName('PECveAccesorio').AsString := PPAccesorio;
        STPObtSuc.ParamByName('PENumPeriodo').AsFloat := PPNumCuota;
        STPObtSuc.ParamByName('PEFProgCuota').AsFloat := PPProgCuota;
        STPObtSuc.ParamByName('PEModoAut').AsInteger := PPAutomat;
        STPObtSuc.ParamByName('PECommit').AsString := 'V';

        STPObtSuc.ExecProc;
        if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
            ShowMessage('PROBLEMAS AL MODIFICAR CUOTA ' + IntToStr(STPObtSuc.ParamByName('PSResultado').AsInteger) + STPObtSuc.ParamByName('PSTXResultado').AsString);

        if (PPAutomat=1) and (STPObtSuc.ParamByName('PSResultado').AsInteger = 0) then
            ShowMessage('Fechas Programadas actualizadas con Exito');

    finally
        STPObtSuc.Free;
    end;
end;


//procedimiento para actulizar periodos de interes en pasivos
Procedure TWCrconsulta.ActualizaINT_FND(PEIDCredito, PENUM_PERIODO : Integer);
var STPActINT_FND  : TStoredProc;
begin
   try
     STPActINT_FND:=TStoredProc.Create(Nil);
     STPActINT_FND.DatabaseName:=Objeto.Apli.DatabaseName;
     STPActINT_FND.SessionName:=Objeto.Apli.SessionName;

     with STPActINT_FND do
     begin
        StoredProcName:='PKGCRREDESCTO.STPACTUALIZA_BANDCVE_FA';
        Params.CreateParam(ftInteger,'PEIDCredito'  ,ptInput);
        Params.CreateParam(ftInteger,'PENUMPERIODO'  ,ptInput);
        Params.CreateParam(ftString, 'PEBaut'       ,ptInput);
        Params.CreateParam(ftString, 'PEBCOMMIT'    ,ptInput);
        Params.CreateParam(ftFloat,  'PSResultado'    ,ptOutput);
        Params.CreateParam(ftString, 'PSTxResultado' ,ptOutput);

        Prepare;

        ParamByName('PEIDCredito').AsInteger := PEIDCredito;
        ParamByName('PENUMPERIODO').AsInteger := PENUM_PERIODO;
        ParamByName('PEBaut').AsString     := 'V';
        ParamByName('PEBCOMMIT').AsString    := 'V';
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
           ShowMessage(ParamByName('PSTxResultado').AsString+'. ACTUALIZE EL PASIVO DE FORMA MANUAL');
     end;

   finally
     STPActINT_FND.Free;
   end;
end;


Procedure TWCrconsulta.ActualizaCveFinAdic(PEIDCredito, PEnumperiodo : Integer; PEFinAdic:String);
var STPActCveFinAdic  : TStoredProc;
begin
   try
     STPActCveFinAdic:=TStoredProc.Create(Nil);
     STPActCveFinAdic.DatabaseName:=Objeto.Apli.DatabaseName;
     STPActCveFinAdic.SessionName:=Objeto.Apli.SessionName;
     STPActCveFinAdic.StoredProcName:='PKGCRCUOTAS.STP_UPDCVEFINADIC';
     STPActCveFinAdic.Params.CreateParam(ftInteger,'peIdRefSolCuota',ptInput);
     STPActCveFinAdic.Params.CreateParam(ftString, 'peCveFinanAdic'   ,ptInput);
     STPActCveFinAdic.Params.CreateParam(ftInteger,'peNumPeriodo'   ,ptInput);
     STPActCveFinAdic.Params.CreateParam(ftInteger,'peTabla'   ,ptInput);
     STPActCveFinAdic.Params.CreateParam(ftString, 'PEBCOMMIT'     ,ptInput);

     STPActCveFinAdic.Params.CreateParam(ftFloat,'psResultado',ptOutput);
     STPActCveFinAdic.Params.CreateParam(ftString,'psTxResultado',ptOutput);

     STPActCveFinAdic.Prepare;

     STPActCveFinAdic.ParamByName('peIdRefSolCuota').AsInteger := PEIDCredito;
     STPActCveFinAdic.ParamByName('peCveFinanAdic').AsString     := PEFinAdic;
     STPActCveFinAdic.ParamByName('peNumPeriodo').AsInteger    := PEnumperiodo;
     STPActCveFinAdic.ParamByName('peTabla').AsInteger         := 1; //MODIFICA CR_INTERESES
     STPActCveFinAdic.ParamByName('PEBCOMMIT').AsString        := Co_Verdad;
     STPActCveFinAdic.ExecProc;

     if (STPActCveFinAdic.ParamByName('psResultado').AsInteger <> 0) then
     begin
        if (STPActCveFinAdic.ParamByName('psResultado').AsInteger = 1) then
            ShowMessage(STPActCveFinAdic.ParamByName('psTxResultado').AsString + ' No se modifico la Clave de Financiamiento Adicional')
        else
            ShowMessage(STPActCveFinAdic.ParamByName('psTxResultado').AsString);
     end;

   finally
     STPActCveFinAdic.Free;
   end;

   ActualizaINT_FND(PEIDCredito, PEnumperiodo);
end;

procedure TWCrconsulta.FormShow(Sender: TObject);
var vlsql: String;
    vlCount: Integer;
    vlQry : TQuery;
begin
   With Objeto Do
   Begin
      icpCONTRATO.Frame := Contrato;

      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
  End;

  vlsql:= ' SELECT COUNT(*) COUNT FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE = ''CRCONS'' '+
          '  AND VALOR = ' + IntToStr(Objeto.Apli.CvePerfil);
  GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlCount,False);
  if vlCount > 0 then
  begin
     GBFProg.Enabled:=true;
     Rconcepto.Enabled:=true;
     sbArchivoEntrada.Enabled:=true;
     bbImportar.Enabled:=true;
     bbCamFhProg.Enabled:=true;
  end
  else
  begin
     GBFProg.Enabled:=false;
     Rconcepto.Enabled:=false;
     sbArchivoEntrada.Enabled:=false;
     bbImportar.Enabled:=false;
     bbCamFhProg.Enabled:=false;
  end;
  // --- INICIO --- ASOR --- MAYO 2016 --- LLENADO DE FECHA DE FIN DE PERIODO DE GRACIA DE F.A. SIEMPRE Y CUANDO TENGA F.A.
  vlsql  := 'SELECT NVL(CC.B_FINANC_ADIC, ''F'') B_FINANC_ADIC, F_FIN_PERGRA_FA FROM   CR_CREDITO CC WHERE  CC.ID_CREDITO = ' + edID_CREDITO.Text;
  vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
  if (vlQry.FieldByName('B_FINANC_ADIC').AsString = 'V') then
     begin
          Label47.Visible:= True;
          edF_FIN_PERGRA_FA.Text:= vlQry.FieldByName('F_FIN_PERGRA_FA').AsString;
          edF_FIN_PERGRA_FA.Visible:= True;
     end
  else
     begin
          Label47.Visible:= false;
          edF_FIN_PERGRA_FA.Text:= '';
          edF_FIN_PERGRA_FA.Visible:= false;
  end;
  // --- FIN --- ASOR --- MAYO 2016 ---
end;

procedure TWCrconsulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

{ ******** Declaración de Propiedades ******** }

procedure TWCrconsulta.Set_Credito(pValor : Integer);
begin
 If (pValor <> vg_Credito) Then
  Begin
  vg_Credito := pValor;
  edID_CREDITO.Text := IntToStr(vg_Credito);
  Objeto.Contrato.FindKey([Obten_Contrato(vg_Credito, Objeto.Apli)]);
  icpCONTRATO.RefrescaInfo;
  End;
end;    

function TWCrconsulta.Get_SituacionActual : String;
begin
 Result := CO_A_SITUACION[tbstSituacion.TabIndex];
end;

procedure TWCrconsulta.Set_SituacionActual(pValor : String);
var I : Integer;
begin
 If (pValor <> SituacionActual) Then
   For I := 0 To High(CO_A_SITUACION) Do
    If pValor = CO_A_SITUACION[I] Then
     Begin
     tbstSituacion.TabIndex := I;
     Break;
     End;
end;

function TWCrconsulta.Get_ConsultaActual : TConsulta;
begin
  Case pgctrlConsulta.ActivePageIndex Of
    0 : Result := ftCapital;
    1 : Result := ftInteres;
    2 : Result := ftComision;
    3 : Result := ftDocumentos;
    4 : Result := ftFinanciamiento;
   Else
    Result := ftNone;
  End;
end;

procedure TWCrconsulta.Set_ConsultaActual(pValor : TConsulta);
begin
 If (ConsultaActual <> pValor) Then
  Case pValor Of
    ftCapital        : pgctrlConsulta.ActivePageIndex := 0;
    ftInteres        : pgctrlConsulta.ActivePageIndex := 1;
    ftComision       : pgctrlConsulta.ActivePageIndex := 2;
    ftDocumentos     : pgctrlConsulta.ActivePageIndex := 3;
    ftFinanciamiento : pgctrlConsulta.ActivePageIndex := 4;
    ftNone           : pgctrlConsulta.ActivePageIndex := 5;
  End;
end;

function TWCrconsulta.Get_Aplica_IVA : Boolean;
var vlB_APLICA_IVA : String;
begin
 GetSQLStr('SELECT B_APLICA_IVA FROM CR_CREDITO WHERE ID_CREDITO = '+IntToStr(Credito),
           Objeto.DatabaseName,Objeto.SessionName,'B_APLICA_IVA',vlB_APLICA_IVA,False);
 Result := vlB_APLICA_IVA = 'V';
end;

{ Procedimientos }

procedure TWCrconsulta.MuestraCapital(pID_CREDITO : Integer; pSIT_CREDITO : String);
var vlstrSQL : String;
    vlQry : TQuery;
    nRow : Integer;
    nWidthColPeriodo : Integer;
begin
 vlstrSQL := 'SELECT * FROM CR_CAPITAL WHERE ID_CREDITO = '+IntToStr(pID_CREDITO);
 If (Trim(pSIT_CREDITO) <> '') Then
  vlstrSQL :=  vlstrSQL + ' AND SIT_CAPITAL = '+SQLSTR(pSIT_CREDITO);
 vlstrSQL :=   vlstrSQL + ' ORDER BY F_VENCIMIENTO, NUM_PERIODO';

 vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
 ClearGrid(strgrdCapital,0);

 // El Capital nunca tiene IVA ROIM748  el 27/04/2004
 vg_bMuestraIva := False;

 // Mueve el Panel para ocultar el titulo de la coumna Pdo. de Color Amarillo
 If (vg_bMuestraIva) Then
  Begin PnlTitulos.Left := 4;  nWidthColPeriodo := 0; End
 Else
  Begin PnlTitulos.Left := 28; nWidthColPeriodo := 24; End;

  With strgrdCapital Do
   Begin
   RowHeights[0] := DefaultRowHeight;
   RowCount := 1;   //  DESCRIPCION DE LAS COLUMNAS
   ColCount := 16;
   RowCount := 9999;

   ColWidths[CO_COL1 ] := 0;
   ColWidths[CO_COL2 ] := 0;
   ColWidths[CO_COL3 ] := 0;
   ColWidths[CO_CAP_NUM_PERIODO       ] := nWidthColPeriodo;  // Indica el Número de Periodo
   ColWidths[CO_CAP_F_VENCIMIENTO     ] := CO_WIDTH_FECHA;     // Fecha de Vencimiento
   ColWidths[CO_CAP_F_PROG_PAGO       ] := CO_WIDTH_FECHA;     // Fecha Programada
   ColWidths[CO_CAP_F_PAGO            ] := CO_WIDTH_FECHA;     // Fecha de Pago
   ColWidths[CO_CAP_TITULO            ] := 30;                 // Titulos de (IMPORTE, IVA, TOTAL) unicamente se muestra si Aplica IVA
   ColWidths[CO_CAP_IMP_CAPITAL       ] := CO_WIDTH_DINERO;    // Importe de Capital Programado
   ColWidths[CO_CAP_IMP_PAGADO        ] := CO_WIDTH_DINERO;    // Importe de Capital Pagado
   ColWidths[CO_CAP_IMP_VENCIDO       ] := CO_WIDTH_DINERO;    // Importe de Capital  Vencido
   ColWidths[CO_CAP_IMP_MORATORIO     ] := CO_WIDTH_DINERO;    // Importe de Mora Programada
   ColWidths[CO_CAP_IMP_PAGADO_MORA   ] := CO_WIDTH_DINERO;    // Importe de Mora Pagada
   ColWidths[CO_CAP_IMP_CONDONADO_MORA] := CO_WIDTH_DINERO;    // Importe Condonado de Mora
   ColWidths[CO_CAP_IMP_VENCIDO_MORA  ] := CO_WIDTH_DINERO;    // Importe de Mora Vencido
   ColWidths[CO_CAP_SIT_CAPITAL       ] := 17;                // Situación
   End;

 nRow := 0;
 IniciaError(strgrdCapital);

 If Assigned(vlQry) Then
   With strgrdCapital, vlQry Do
     While Not vlQry.Eof Do
      Begin
      // Si Muestra el Iva entonces...
      If (vg_bMuestraIva) Then
       Begin
       // Coloca Identificador de Periodo
       Cells[CO_COL1, nRow] := CO_CORTE;                                          // Identificador de Corte
       Cells[CO_COL2, nRow] := CO_WORDPDO + FieldByName('NUM_PERIODO').AsString;  // Identificador de Periodo
       Cells[CO_COL3, nRow] := FieldByName('SIT_CAPITAL').AsString;               // Identificador de Situación
       Inc(nRow);
       End;

      Cells[CO_COL1, nRow] := CO_DETALLE;                           // Identificador de Corte
      Cells[CO_COL2, nRow] := FieldByName('NUM_PERIODO').AsString;  // Identificador de Periodo
      Cells[CO_COL3, nRow] := FieldByName('SIT_CAPITAL').AsString;  // Identificador de Situación

      // LLena registros
      Cells[CO_CAP_NUM_PERIODO,nRow] := FieldByName('NUM_PERIODO').AsString;
      If (FieldByName('F_VENCIMIENTO').AsDateTime > 0) Then Cells[CO_CAP_F_VENCIMIENTO   ,nRow] := FormatDateTime(CFORMAT_FECHA,FieldByName('F_VENCIMIENTO').AsDateTime);
      If (FieldByName('F_PROG_PAGO').AsDateTime > 0)   Then Cells[CO_CAP_F_PROG_PAGO     ,nRow] := FormatDateTime(CFORMAT_FECHA,FieldByName('F_PROG_PAGO').AsDateTime);
      If (FieldByName('F_PAGO').AsDateTime > 0)        Then Cells[CO_CAP_F_PAGO          ,nRow] := FormatDateTime(CFORMAT_FECHA,FieldByName('F_PAGO').AsDateTime);

      Cells[CO_CAP_TITULO          ,nRow] := CO_WORDIMP;
      Cells[CO_CAP_IMP_CAPITAL     ,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_CAPITAL').AsFloat]);
      Cells[CO_CAP_IMP_PAGADO      ,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_PAGADO').AsFloat]);
      Cells[CO_CAP_IMP_MORATORIO   ,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_MORATORIO').AsFloat]);
      Cells[CO_CAP_IMP_PAGADO_MORA ,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_PAGADO_MORA').AsFloat]);
      Cells[CO_CAP_IMP_CONDONADO_MORA,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_COND_MORA').AsFloat]);

      Cells[CO_CAP_SIT_CAPITAL    , nRow] := FieldByName('SIT_CAPITAL').AsString;  // Identificador de Situación

      If (FieldByName('SIT_CAPITAL').AsString = CSIT_IM) Or (FieldByName('SIT_CAPITAL').AsString = CSIT_LQ) Then
       Begin
       // Calcula el Importe Vencido y el Importe Vencido de Mora
       Cells[CO_CAP_IMP_VENCIDO     ,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_CAPITAL').AsFloat   - FieldByName('IMP_PAGADO').AsFloat]);
       Cells[CO_CAP_IMP_VENCIDO_MORA,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_MORATORIO').AsFloat - FieldByName('IMP_PAGADO_MORA').AsFloat - FieldByName('IMP_COND_MORA').AsFloat]);
       End
      Else
       Begin
       Cells[CO_CAP_IMP_VENCIDO     ,nRow] := C_STRZERO;
       Cells[CO_CAP_IMP_VENCIDO_MORA,nRow] := C_STRZERO;
       End;

      If (vg_bMuestraIva) Then
        Begin
        // Agrega los Importes de IVA
        Inc(nRow);

        Cells[CO_COL1, nRow] := CO_DETALLE; // Identificador de Detalle
        Cells[CO_COL2, nRow] := FieldByName('NUM_PERIODO').AsString;  // Identificador de Periodo
        Cells[CO_COL3, nRow] := FieldByName('SIT_CAPITAL').AsString;  // Identificador de Situación
        Cells[CO_CAP_TITULO,nRow]          := CO_WORDIVA;

        Cells[CO_CAP_IMP_MORATORIO,nRow]   := Format(CFORMAT_DINERO,[FieldByName('IMP_IVA_MORA').AsFloat]);
        Cells[CO_CAP_IMP_PAGADO_MORA,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_PAG_IVA_MORA').AsFloat]);

        // Calcula el Importe de Mora Vencido de IVA del Importe de Comisión
        If (FieldByName('SIT_CAPITAL').AsString = CSIT_IM) Or (FieldByName('SIT_CAPITAL').AsString = CSIT_LQ) Then
         Cells[CO_CAP_IMP_VENCIDO_MORA, nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_IVA_MORA').AsFloat - FieldByName('IMP_PAG_IVA_MORA').AsFloat])
        Else
         Cells[CO_CAP_IMP_VENCIDO_MORA, nRow]  := C_STRZERO;

        // Pequeño Renglon Separador;
        Inc(nRow);
        Cells[CO_COL1, nRow] := CO_SEPARADOR; // Identificador de Separador
        RowHeights[nRow] := CO_ROWSEP;

        // Agrega los Totales
        Inc(nRow);
        Cells[CO_COL1, nRow] := CO_SUBTOTAL; // Identificador de Subtotal
        Cells[CO_COL2, nRow] := FieldByName('NUM_PERIODO').AsString;  // Identificador de Periodo
        Cells[CO_COL3, nRow] := FieldByName('SIT_CAPITAL').AsString;  // Identificador de Situación
        Cells[CO_CAP_TITULO,nRow] := CO_WORDSUB;

        Cells[CO_CAP_IMP_CAPITAL    , nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_CAPITAL').AsFloat]);
        Cells[CO_CAP_IMP_PAGADO     , nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_PAGADO').AsFloat]);
        Cells[CO_CAP_IMP_MORATORIO  , nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_MORATORIO').AsFloat + FieldByName('IMP_IVA_MORA').AsFloat]);
        Cells[CO_CAP_IMP_PAGADO_MORA, nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_PAGADO_MORA').AsFloat + FieldByName('IMP_PAG_IVA_MORA').AsFloat]);

        If (FieldByName('SIT_CAPITAL').AsString = CSIT_IM) Or (FieldByName('SIT_CAPITAL').AsString = CSIT_LQ) Then
         Begin
         Cells[CO_CAP_IMP_VENCIDO,     nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_CAPITAL').AsFloat - FieldByName('IMP_PAGADO').AsFloat]);
         Cells[CO_CAP_IMP_VENCIDO_MORA,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_MORATORIO').AsFloat - FieldByName('IMP_PAGADO_MORA').AsFloat +
                                                       FieldByName('IMP_IVA_MORA').AsFloat - FieldByName('IMP_PAG_IVA_MORA').AsFloat]);
         End
        Else
         Begin
         Cells[CO_CAP_IMP_VENCIDO     ,nRow] := C_STRZERO;
         Cells[CO_CAP_IMP_VENCIDO_MORA,nRow] := C_STRZERO;
         End;

        End;

      Inc(nRow);
      Next;
      End;

 // Ajusta el tamaño del Grid a la cantidad de Resultados Mostrados
 If (nRow = 0) Then strgrdCapital.RowCount := 1
 Else
  Begin
  // Agrega Pequeño Renglon Separador;
  AgregaEspacioParaTotales(strgrdCapital, nRow, CO_CAP_TITULO);
  CalculaTotales( strgrdCapital, nRow,
                  [CO_CAP_IMP_CAPITAL,  CO_CAP_IMP_PAGADO, CO_CAP_IMP_VENCIDO,  CO_CAP_IMP_MORATORIO,
                   CO_CAP_IMP_PAGADO_MORA,  CO_CAP_IMP_CONDONADO_MORA, CO_CAP_IMP_VENCIDO_MORA ] ); // Calcula los Totales
  strgrdCapital.RowCount := nRow + 1;
  End;

 If Assigned(vlQry) Then vlQry.Free;
end;


procedure TWCrconsulta.MuestraInteres(pID_CREDITO : Integer; pSIT_CREDITO : String);

    procedure AgregaRegistroInteres(Qry : TQuery; var nRow : Integer);
    Var nRowTemp : Integer;
    begin
      With strgrdInteres, Qry Do
       Begin
          nRowTemp := nRow;
          If (vg_bMuestraIva) Then
           Begin
           // Coloca Identificador de Periodo
           Cells[CO_COL1,nRow] := CO_CORTE;
           Cells[CO_COL2,nRow] := CO_WORDPDO + FieldByName('NUM_PERIODO').AsString;
           Cells[CO_COL3,nRow] := FieldByName('SIT_INTERES').AsString;
           Cells[CO_COL4,nRow] := FieldByName('NUM_PERIODO').AsString;
           Cells[CO_COL5,nRow] := FieldByName('F_VENCIMIENTO').AsString;
           Inc(nRow);
           End;

          Cells[CO_COL1,nRow] := CO_DETALLE;
          Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO').AsString;
          Cells[CO_COL3,nRow] := FieldByName('SIT_INTERES').AsString;
          Cells[CO_COL4,nRow] := FieldByName('NUM_PERIODO').AsString;
          Cells[CO_COL5,nRow] := FieldByName('F_VENCIMIENTO').AsString;
          Cells[CO_INT_NUM_PERIODO,nRow] := FieldByName('NUM_PERIODO').AsString;

          If (FieldByName('F_VENCIMIENTO').AsDateTime > 0) Then Cells[CO_INT_F_VENCIMIENTO ,nRow] := FormatDateTime(CFORMAT_FECHA,FieldByName('F_VENCIMIENTO').AsDateTime);
          If (FieldByName('F_PROG_PAGO').AsDateTime > 0)   Then Cells[CO_INT_F_PROG_PAGO   ,nRow] := FormatDateTime(CFORMAT_FECHA,FieldByName('F_PROG_PAGO').AsDateTime);
          If (FieldByName('F_PAGO').AsDateTime > 0)        Then Cells[CO_INT_F_PAGO        ,nRow] := FormatDateTime(CFORMAT_FECHA,FieldByName('F_PAGO').AsDateTime);

          Cells[CO_INT_TITULO,nRow]      := CO_WORDIMP;
          Cells[CO_INT_IMP_INTERES,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_INTERES').AsFloat]);
          Cells[CO_INT_IMP_PAGADO,nRow]  := Format(CFORMAT_DINERO,[FieldByName('IMP_PAGADO').AsFloat]);
          Cells[CO_INT_B_FINANC,nRow]    := FieldByName('B_FINAN_ADIC').AsString;
          Cells[CO_INT_CVE_FINANC,nRow]  := FieldByName('CVE_FINAN_ADIC').AsString; //TIPO DE FINANCIAMIENTO ADICIONAL
          Cells[CO_INT_SIT_INTERES,nRow] := FieldByName('SIT_INTERES').AsString;

          // Calcula el Importe Vencido
          If (FieldByName('SIT_INTERES').AsString = CSIT_IM) Or (FieldByName('SIT_INTERES').AsString = CSIT_LQ) Then
           Cells[CO_INT_IMP_VENCIDO,nRow]  := Format(CFORMAT_DINERO,[FieldByName('IMP_INTERES').AsFloat - FieldByName('IMP_PAGADO').AsFloat])
          Else
           Cells[CO_INT_IMP_VENCIDO,nRow]  := C_STRZERO;

          // Si Tiene Iva entonces...
          If vg_bMuestraIva Then
            Begin
            // Agrega los Importes de IVA
            Inc(nRow);
            Cells[CO_COL1,nRow] := CO_DETALLE;
            Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO').AsString;
            Cells[CO_COL3,nRow] := FieldByName('SIT_INTERES').AsString;
            Cells[CO_COL4,nRow] := FieldByName('NUM_PERIODO').AsString;
            Cells[CO_COL5,nRow] := FieldByName('F_VENCIMIENTO').AsString;

            Cells[CO_INT_TITULO,nRow]         := CO_WORDIVA;
            Cells[CO_INT_IMP_IVA,nRow]        := Format(CFORMAT_DINERO,[FieldByName('IMP_IVA').AsFloat]);
            Cells[CO_INT_IMP_IVA_PAGADO,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_IVA_PAGADO').AsFloat]);

            // Calcula el Importe de Vencido de IVA del Importe de Comisión
            If (FieldByName('SIT_INTERES').AsString = CSIT_IM) Or (FieldByName('SIT_INTERES').AsString = CSIT_LQ) Then
             Cells[CO_INT_IMP_IVA_VENCIDO, nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_IVA').AsFloat - FieldByName('IMP_IVA_PAGADO').AsFloat])
            Else
             Cells[CO_INT_IMP_IVA_VENCIDO,nRow]  := C_STRZERO;

            // Pequeño Renglon Separador;
            Inc(nRow);
            Cells[CO_COL1,nRow] := CO_SEPARADOR;
            RowHeights[nRow]    := CO_ROWSEP;

            // Agrega los Totales
            Inc(nRow);
            Cells[CO_COL1,nRow] := CO_SUBTOTAL;
            Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO').AsString;
            Cells[CO_COL3,nRow] := FieldByName('SIT_INTERES').AsString;
            Cells[CO_COL4,nRow] := FieldByName('NUM_PERIODO').AsString;
            Cells[CO_COL5,nRow] := FieldByName('F_VENCIMIENTO').AsString;

            Cells[CO_INT_TITULO,nRow]  := CO_WORDTOT;
            Cells[CO_INT_IMP_IVA,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_INTERES').AsFloat + FieldByName('IMP_IVA').AsFloat]);
            Cells[CO_INT_IMP_IVA_PAGADO,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_PAGADO').AsFloat + FieldByName('IMP_IVA_PAGADO').AsFloat]);

            If (FieldByName('SIT_INTERES').AsString = CSIT_IM) Or (FieldByName('SIT_INTERES').AsString = CSIT_LQ) Then
             Cells[CO_INT_IMP_IVA_VENCIDO,nRow]  := Format(CFORMAT_DINERO,[FieldByName('IMP_INTERES').AsFloat - FieldByName('IMP_PAGADO').AsFloat +
                                                                           FieldByName('IMP_IVA').AsFloat - FieldByName('IMP_IVA_PAGADO').AsFloat])
            Else
             Cells[CO_INT_IMP_IVA_VENCIDO,nRow]  := C_STRZERO;
            End;
       End;
//       Inc(nRow);

    {ON MORAROTIOS INTERES EASA4011     02112005}
      With strgrdMorasInt, Qry Do
       Begin
          If (vg_bMuestraIva) Then
           Begin
           // Coloca Identificador de Periodo
           Cells[CO_COL1,nRowTemp] := CO_CORTE;
           Cells[CO_COL2,nRowTemp] := CO_WORDPDO + FieldByName('NUM_PERIODO').AsString;
           Cells[CO_COL3,nRowTemp] := FieldByName('SIT_INTERES').AsString;
           Inc(nRowTemp);
           End;

          Cells[CO_COL1,nRowTemp] := CO_DETALLE;
          Cells[CO_COL2,nRowTemp] := FieldByName('NUM_PERIODO').AsString;
          Cells[CO_COL3,nRowTemp] := FieldByName('SIT_INTERES').AsString;

          Cells[CO_INT_TITULO,nRowTemp]      := CO_WORDIMP;
          Cells[CO_INT_IMP_MORATORIO,nRowTemp] := Format(CFORMAT_DINERO,[FieldByName('IMP_MORATORIO').AsFloat]);
          Cells[CO_INT_IMP_PAGADO_MORA,nRowTemp] := Format(CFORMAT_DINERO,[FieldByName('IMP_PAGADO_MORA').AsFloat]);
          Cells[CO_INT_IMP_CONDONADO_MORA,nRowTemp] := Format(CFORMAT_DINERO,[FieldByName('IMP_COND_MORA').AsFloat]);

          // Si Tiene Iva entonces...
          If vg_bMuestraIva Then
            Begin
            // Agrega los Importes de IVA
            Inc(nRowTemp);
            Cells[CO_COL1,nRowTemp] := CO_DETALLE;
            Cells[CO_COL2,nRowTemp] := FieldByName('NUM_PERIODO').AsString;
            Cells[CO_COL3,nRowTemp] := FieldByName('SIT_INTERES').AsString;

//            Cells[CO_INT_TITULO,nRowTemp]            := CO_WORDIVA;
            Cells[CO_INT_IMP_IVA_MORA,nRowTemp]      := Format(CFORMAT_DINERO,[FieldByName('IMP_IVA_MORA').AsFloat]);
            Cells[CO_INT_IMP_PAG_IVA_MORA,nRowTemp]  := Format(CFORMAT_DINERO,[FieldByName('IMP_PAG_IVA_MORA').AsFloat]);
            Cells[CO_INT_IMP_IVA_COND_MOR,nRowTemp]  := Format(CFORMAT_DINERO,[FieldByName('IMP_IVA_COND_MOR').AsFloat]);
            // Pequeño Renglon Separador;
            Inc(nRowTemp);
            Cells[CO_COL1,nRowTemp] := CO_SEPARADOR;
            RowHeights[nRowTemp]    := CO_ROWSEP;

            // Agrega los Totales
            Inc(nRowTemp);
            Cells[CO_COL1,nRowTemp] := CO_SUBTOTAL;
            Cells[CO_COL2,nRowTemp] := FieldByName('NUM_PERIODO').AsString;
            Cells[CO_COL3,nRowTemp] := FieldByName('SIT_INTERES').AsString;

//            Cells[CO_INT_TITULO,nRowTemp]           := CO_WORDTOT;
            Cells[CO_INT_IMP_IVA_MORA,nRowTemp]     := Format(CFORMAT_DINERO,[FieldByName('IMP_MORATORIO').AsFloat   + FieldByName('IMP_IVA_MORA').AsFloat]);
            Cells[CO_INT_IMP_PAG_IVA_MORA,nRowTemp] := Format(CFORMAT_DINERO,[FieldByName('IMP_PAGADO_MORA').AsFloat + FieldByName('IMP_PAG_IVA_MORA').AsFloat]);
            Cells[CO_INT_IMP_IVA_COND_MOR,nRowTemp] := Format(CFORMAT_DINERO,[FieldByName('IMP_COND_MORA').AsFloat   + FieldByName('IMP_IVA_COND_MOR').AsFloat]);
            End;
       End;
       Inc(nRow);
    {OFF MORAROTIOS INTERES EASA4011     02112005}
    end;

    procedure AgregaRegistroCapital(Qry : TQuery; var nRow : Integer);
    begin
      With strgrdCapital2, Qry Do
       Begin
          If (vg_bMuestraIva) Then
           Begin
           // Coloca Identificador de Periodo
           Cells[CO_COL1,nRow] := CO_CORTE;
           Cells[CO_COL2,nRow] := CO_WORDPDO + FieldByName('NUM_PERIODO').AsString;
           Cells[CO_COL3,nRow] := FieldByName('SIT_CAPITAL').AsString;
           Inc(nRow);
           End;

          Cells[CO_COL1,nRow] := CO_DETALLE;
          Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO').AsString;
          Cells[CO_COL3,nRow] := FieldByName('SIT_CAPITAL').AsString;

          If (FieldByName('F_VENCIMIENTO').AsDateTime > 0) Then
             Cells[CO_CAP2_F_VENCIMIENTO ,nRow] := FormatDateTime(CFORMAT_FECHA,FieldByName('F_VENCIMIENTO').AsDateTime);
             Cells[CO_CAP2_IMP_CAPITAL,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_CAPITAL').AsFloat]);

          // Si Tiene Iva entonces...
          If vg_bMuestraIva Then
            Begin
            // Agrega los Importes de IVA
            Inc(nRow);
            Cells[CO_COL1,nRow] := CO_DETALLE;
            Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO').AsString;
            Cells[CO_COL3,nRow] := FieldByName('SIT_CAPITAL').AsString;

            // Pequeño Renglon Separador;
            Inc(nRow);
            Cells[CO_COL1,nRow] := CO_SEPARADOR;
            RowHeights[nRow]    := CO_ROWSEP;

            // Agrega los Totales
            Inc(nRow);
            Cells[CO_COL1,nRow] := CO_SUBTOTAL;
            Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO').AsString;
            Cells[CO_COL3,nRow] := FieldByName('SIT_CAPITAL').AsString;
            End;
       End;
       Inc(nRow);
    end;

    procedure AgregaRegVacio(pStrGrd : TStringGrid; nRow : Integer);
    begin
       With (pStrGrd) Do
         If vg_bMuestraIva Then
           Begin
           Cells[CO_COL1,nRow+3] := CO_SEPARADOR;
           RowHeights[nRow+3]    := CO_ROWSEP;
           End;
    end;

var vlstrSQL, vlstrSQL2  : String;
    vlQryI, vlQryK, vlQryFA : TQuery;
    nRow, nRowTemp, nWidthColPeriodo, nWidthColFinanciamiento : Integer;
begin
 { Inicializa Query de Interés }
// RABA MAY 2015 REQ. FINAN_ADIC,
// SE CAMBIA LA FORMA DE OBTENER LA SITUACIÓN DEL INTERES, LA CONSULTA SE TRAE TODOS LOS CAMPOS
// AUNQUE NO SON USADOS TODOS, POR LO QUE LA NUEVA CONSULTA SE ESPECIFICAN TODOS LOS CAMPOS DE LA TABLA
// Y LA COLUMNA DE INTERES SE SUSTITUYE POR UNA FUNCIÓN SOLO EN CASO DE QUE LA SITUACIÓN SEA "LQ" Y APLIQUE FINANCIAMIENTO
// vlstrSQL := 'SELECT * FROM CR_INTERES WHERE ID_CREDITO = '+IntToStr(pID_CREDITO);
 vlstrSQL := 'SELECT ID_CREDITO,          NUM_PERIODO,        B_COB_AUT,          PLAZO,          F_VENCIMIENTO, ' + coCRLF +
             '       F_PROG_PAGO,         F_PAGO,             IMP_INTERES,        IMP_PAGADO,     IMP_INTERES_DIA, ' + coCRLF +
             '       IMP_INTERES_PROY,    IMP_IVA,            IMP_IVA_PAGADO,     IMP_IVA_PROY,   IMP_BENEF_BCO, ' + coCRLF +
             '       IMP_BENEF_GOB,       IMP_MORATORIO,      IMP_PAGADO_MORA,    IMP_COND_MORA,  TASA_APLICADA, ' + coCRLF +
             '       --SIT_INTERES, ' + coCRLF +
             '       CAST((CASE WHEN SIT_INTERES = ''LQ'' AND B_FINAN_ADIC = ''V'' THEN FUN_CR_SIT_INT(ID_CREDITO, NUM_PERIODO) ' + coCRLF +
             '             ELSE SIT_INTERES END) AS VARCHAR2(2)) SIT_INTERES, ' + coCRLF +
             '       F_ALTA,              CVE_USU_ALTA,       F_MODIFICA,         CVE_USU_MODIFICA, ' + coCRLF +
             '       IMP_IVA_MORA,        IMP_PAG_IVA_MORA,   IMP_IVA_COND_MOR,   B_FINAN_ADIC,   F_VALOR_PAGO, ' + coCRLF +
             '       NUM_DIAS_VENCIDO,    SIT_INTERES_DET,    IMP_CONDONA,        CVE_FINAN_ADIC, TASA_APLICADA6 ' + coCRLF +
             'FROM   CR_INTERES ' + coCRLF +
             'WHERE  ID_CREDITO = '+IntToStr(pID_CREDITO);
//FIN RABA
 If (Trim(pSIT_CREDITO) <> '') Then
  vlstrSQL :=  vlstrSQL + ' AND SIT_INTERES = '+SQLSTR(pSIT_CREDITO);
 vlstrSQL :=   vlstrSQL + ' ORDER BY F_VENCIMIENTO, NUM_PERIODO';
 vlQryI := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

 { Inicializa Query de Capital }
 vlstrSQL := 'SELECT * FROM CR_CAPITAL WHERE ID_CREDITO = '+IntToStr(pID_CREDITO);
 If (Trim(pSIT_CREDITO) <> '') Then
  vlstrSQL :=  vlstrSQL + ' AND SIT_CAPITAL = '+SQLSTR(pSIT_CREDITO);
 vlstrSQL :=   vlstrSQL + ' ORDER BY F_VENCIMIENTO, NUM_PERIODO';
 vlQryK := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

 { Limpia los GRIDS }
 ClearGrid(strgrdInteres,0);
 ClearGrid(strgrdCapital2,0);
 ClearGrid(strgrdMorasInt,0); //EASA4011        02112005

 { Recorre los Titulos Amarillos de la Forma }
 If (vg_bMuestraIva) Then
  Begin pnlTitulosInteres.Left := 3;  nWidthColPeriodo := 0; End
 Else
  Begin pnlTitulosInteres.Left := 28; nWidthColPeriodo := 23; End;

 { Aplica Financiamiento }
 If (tbshtFinanciamiento.TabVisible) Then
  Begin PanelSituacion.Left := 530; nWidthColFinanciamiento := 30; End   //526  60
 Else
  Begin PanelSituacion.Left := 464; nWidthColFinanciamiento := 0; End;

 { Inicializa las columnas del GRID de Interés }
 With strgrdInteres Do
  Begin
  RowHeights[0] := DefaultRowHeight;
  RowCount := 1;   //  DESCRIPCION DE LAS COLUMNAS
  ColCount := 16; //15
  RowCount := 9999;

  ColWidths[CO_COL1] := 0;
  ColWidths[CO_COL2] := 0;
  ColWidths[CO_COL3] := 0;
  ColWidths[CO_COL4] := 0;
  ColWidths[CO_COL5] := 0;
  ColWidths[CO_INT_NUM_PERIODO    ] := nWidthColPeriodo;
  ColWidths[CO_INT_F_VENCIMIENTO  ] := CO_WIDTH_FECHA;     // Fecha de Vencimiento
  ColWidths[CO_INT_F_PROG_PAGO    ] := CO_WIDTH_FECHA;     // Fecha Programada
  ColWidths[CO_INT_F_PAGO         ] := CO_WIDTH_FECHA;     // Fecha de Pago
  ColWidths[CO_INT_TITULO         ] := 42;                // Titulos de (IMPORTE, IVA, TOTAL) unicamente se muestra si Aplica IVA
  ColWidths[CO_INT_IMP_INTERES    ] := CO_WIDTH_DINERO;    // Importe de Interes Programado
  ColWidths[CO_INT_IMP_PAGADO     ] := CO_WIDTH_DINERO;    // Importe de Interes Pagado
  ColWidths[CO_INT_IMP_VENCIDO    ] := CO_WIDTH_DINERO;    // Importe de Interes Vencido
  ColWidths[CO_INT_B_FINANC       ] := nWidthColFinanciamiento;
  ColWidths[CO_INT_CVE_FINANC     ] := nWidthColFinanciamiento;
  ColWidths[CO_INT_SIT_INTERES    ] := 17;                // Situación
  End;

 { Inicializa las columnas del Grid de Moras de Interés}        //EASA4011      02112005
 With strgrdMorasInt Do
  Begin
  RowHeights[0] := DefaultRowHeight;
  RowCount := 1;   //Descripción de columnas
  ColCount := 6;   //Npumero de Columnas del grid
  RowCount := 9999;

  ColWidths[CO_COL1] := 0;
  ColWidths[CO_COL2] := 0;
  ColWidths[CO_COL3] := 0;
  ColWidths[CO_INT_IMP_MORATORIO]      := CO_WIDTH_DINERO2;
  ColWidths[CO_INT_IMP_PAGADO_MORA]    := CO_WIDTH_DINERO2;
  ColWidths[CO_INT_IMP_CONDONADO_MORA] := CO_WIDTH_DINERO2;
  End;

 { Inicializa las columnas del GRID de Capital }
 With strgrdCapital2 Do
  Begin
  RowHeights[0] := DefaultRowHeight;
  RowCount := 1;   //  DESCRIPCION DE LAS COLUMNAS
  ColCount := 5;
  RowCount := 9999;

  ColWidths[CO_COL1] := 0;
  ColWidths[CO_COL2] := 0;
  ColWidths[CO_COL3] := 0;
  ColWidths[CO_CAP2_IMP_CAPITAL] := CO_WIDTH_DINERO3;
  End;

 nRow := 0;
 IniciaError(strgrdInteres);

 // Agrega los registros a los Grids
 If (Assigned(vlQryI)) And (Assigned(vlQryK)) Then
   While Not vlQryI.Eof Do
     Begin

     If (vlQryI.FieldByName('F_VENCIMIENTO').AsDateTime
             = vlQryK.FieldByName('F_VENCIMIENTO').AsDateTime) Then
         Begin
            nRowTemp := nRow;
            AgregaRegistroInteres(vlQryI, nRow);
            AgregaRegistroCapital(vlQryK, nRowTemp);
            vlQryK.Next;
         End
      Else If (vlQryI.FieldByName('F_VENCIMIENTO').AsDateTime
                < vlQryK.FieldByName('F_VENCIMIENTO').AsDateTime) Then
         Begin
            AgregaRegVacio(StrGrdCapital2, nRow);
            AgregaRegistroInteres(vlQryI, nRow);
         End
      Else If (vlQryI.FieldByName('F_VENCIMIENTO').AsDateTime
                > vlQryK.FieldByName('F_VENCIMIENTO').AsDateTime) Then
         Begin
            AgregaRegVacio(StrGrdInteres, nRow);
            AgregaRegVacio(strgrdMorasInt, nRow);//EASA4011      02112005
            AgregaRegistroCapital(vlQryK, nRow);

            AgregaRegVacio(StrGrdCapital2, nRow);
            AgregaRegistroInteres(vlQryI, nRow);
            vlQryK.Next;
         End;

     vlQryI.Next;
     End;

 // Avanza el último periodo de Capital
 nRowTemp := nRow - 1;
 vlQryK.Next;
 AgregaRegistroCapital(vlQryK, nRowTemp);
 // Ajusta el tamaño del Grid a la cantidad de Resultados Mostrados
 If (nRow = 0) Then strgrdInteres.RowCount := 1
 Else
  Begin
  nRowTemp := nRow;
  AgregaEspacioParaTotales(strgrdInteres, nRow, CO_INT_TITULO);
  CalculaTotales( strgrdInteres, nRow,
                  [CO_INT_IMP_INTERES,  CO_INT_IMP_PAGADO,   CO_INT_IMP_VENCIDO ] ); // Calcula los Totales
  { ON EASA4011      02112005}
  AgregaEspacioParaTotales(strgrdMorasInt, nRowTemp, -1);
  CalculaTotales( strgrdMorasInt, nRowTemp,
                  [CO_INT_IMP_MORATORIO,  CO_INT_IMP_PAGADO_MORA, CO_INT_IMP_CONDONADO_MORA ] ); // Calcula los Totales
  nRowTemp := nRow - 1;
  { OFF EASA4011      02112005}
  AgregaEspacioParaTotales(strgrdCapital2, nRowTemp, -1);
  CalculaTotales( strgrdCapital2, nRowTemp,
                  [CO_CAP2_IMP_CAPITAL] ); // Calcula los Totales

  strgrdInteres.RowCount := nRow + 1;
  strgrdCapital2.RowCount := strgrdInteres.RowCount;
  strgrdMorasInt.RowCount := strgrdInteres.RowCount;

  End;
  //--- INICIO --- ASOR --- MAYO 2016 --- VALIDACION DE FECHA FIN DE PERIODO DE GRACIA DE F.A. SIEMPRE Y CUANDO TENGA F.A. ---
  Try
     vlstrSQL2:='SELECT NVL(B_FINANC_ADIC, ''F'') B_FINANC_ADIC, F_FIN_PERGRA_FA FROM CR_CREDITO WHERE ID_CREDITO = ' + edID_CREDITO.Text;
     vlQryFA := GetSQLQuery(vlstrSQL2,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     if vlQryFA.FieldByName('B_FINANC_ADIC').AsString = 'V' then
      begin
        Label47.Visible:= True;
        edF_FIN_PERGRA_FA.Visible:= True;
        if vlQryFA.FieldByName('F_FIN_PERGRA_FA').AsString <> '' then
           edF_FIN_PERGRA_FA.text:=  vlQryFA.FieldByName('F_FIN_PERGRA_FA').AsString
        else
            edF_FIN_PERGRA_FA.text:=  '';
      end
     else
       begin
          Label47.Visible:= False;
          edF_FIN_PERGRA_FA.text:=  '';
          edF_FIN_PERGRA_FA.Visible:= False;
     end;
     If Assigned(vlQryFA) Then vlQryFA.Free;
  except
     edF_FIN_PERGRA_FA.text:=  '';
     If Assigned(vlQryFA) Then vlQryFA.Free;
  end;
  //--- FIN --- ASOR --- MAYO 2016 ---

  If Assigned(vlQryI) Then vlQryI.Free;
  If Assigned(vlQryK) Then vlQryK.Free;
end;




procedure TWCrconsulta.MuestraComision(pID_CREDITO : Integer; pSIT_CREDITO : String);
var vlstrSQL, strSIT_COMISION, strCVE_COMISION : String;
    vlQry : TQuery;
    nRow, nPeriodoActual : Integer;
    bPrimero : Boolean;
    vldTotImpProgramado ,  vldTotImpPagado  ,  vldTotImpVencido  ,
    vldTotMoraProgramado,  vldTotMoraPagado ,  vldTotMoraVencido ,
    vldImpProgramado  ,    vldImpPagado      ,    vldMoraProgramado ,
    vldMoraPagado     ,    vldImpVencido     ,    vldMoraVencido    : Double;
begin
 vlstrSQL := ' SELECT NVL(CA.DESC_COMISION,'+SQLStr(CERROR_CLAVE)+') AS DESC_COMISION, CO.*'+coCRLF+
             ' FROM CR_COMISION CO,'+coCRLF+
             '      CR_CAT_COMISION CA'+coCRLF+
             ' WHERE CO.ID_CREDITO = '+IntToStr(pID_CREDITO)+coCRLF+
             '      AND CA.CVE_COMISION (+)= CO.CVE_COMISION'+coCRLF;
 If (Trim(pSIT_CREDITO) <> '') Then
  vlstrSQL :=  vlstrSQL + ' AND CO.SIT_COMISION = '+SQLSTR(pSIT_CREDITO);
 vlstrSQL :=   vlstrSQL + ' ORDER BY CO.F_VENCIMIENTO, CO.NUM_PERIODO, CO.CVE_COMISION';

 vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
 ClearGrid(strgrdComision,0);

 // La comisión siempre tendrá IVA ROIM748 el 27/04/2004
 vg_bMuestraIva := True;

 With (strgrdComision) Do
  Begin
  ColCount := 16;
  RowCount := 9999;
  ColWidths[CO_COL1] := 0;
  ColWidths[CO_COL2] := 0;
  ColWidths[CO_COL3] := 0;

  ColWidths[CO_COM_DESC_COMISION]    := 60;                // Descripción de la Clave
  ColWidths[CO_COM_F_VENCIMIENTO]    := CO_WIDTH_FECHA;     // Fecha de Vencimiento
  ColWidths[CO_COM_F_PROG_PAGO]      := CO_WIDTH_FECHA;     // Fecha Programada
  ColWidths[CO_COM_F_PAGO]           := CO_WIDTH_FECHA;     // Fecha de Pago
  ColWidths[CO_COM_TITULO]           := 42;                // Titulos de (IMPORTE, IVA, TOTAL) unicamente se muetsra si Aplica IVA
  ColWidths[CO_COM_IMP_COMISION]     := CO_WIDTH_DINERO;    // Importe de Comision Programado
  ColWidths[CO_COM_IMP_PAGADO]       := CO_WIDTH_DINERO;    // Importe de Comision Pagado
  ColWidths[CO_COM_IMP_VENCIDO]      := CO_WIDTH_DINERO;    // Importe de Comision Vencido
  ColWidths[CO_COM_IMP_MORATORIO]    := CO_WIDTH_DINERO;    // Importe de Mora Programada
  ColWidths[CO_COM_IMP_PAGADO_MORA]  := CO_WIDTH_DINERO;    // Importe de Mora Pagada
  ColWidths[CO_COM_IMP_VENCIDO_MORA] := CO_WIDTH_DINERO;    // Importe de Mora Vencido
  ColWidths[CO_COM_SIT_COMISION]     := 17;                // Situación
  ColWidths[CO_COM_CVE_COMISION]     := 0;                // Situación
  End;

 // Inicia Totales Variables
 vldTotImpProgramado  := 0;  vldTotImpPagado  := 0;  vldTotImpVencido  := 0;
 vldTotMoraProgramado := 0;  vldTotMoraPagado := 0;  vldTotMoraVencido := 0;

 nRow := 0; bPrimero := True; nPeriodoActual := -1;
 IniciaError(strgrdComision);

 If Assigned(vlQry) Then
   With strgrdComision, vlQry Do
      While Not vlQry.Eof Do
       Begin
         If (nPeriodoActual <> FieldByName('NUM_PERIODO').AsInteger) Then
          Begin
          // Si no es el Primer Registro entonces...
          If Not bPrimero Then
               Begin
               // Agrega un Pequeño Salto de Línea
               Inc(nRow);
               Cells[CO_COL1,nRow]  := CO_SEPARADOR;
               RowHeights[nRow]     := CO_ROWSEP;

               Inc(nRow);
               Cells[CO_COL1,nRow]  := CO_SUBTOTAL;
               Cells[CO_COL2,nRow]  := IntToStr(nPeriodoActual);
               Cells[CO_COL3,nRow]  := FieldByName('SIT_COMISION').AsString;
               Cells[CO_COM_CVE_COMISION,nRow] := FieldByName('CVE_COMISION').AsString;
               Cells[CO_COM_TITULO,nRow]  := CO_WORDTPD;
               Cells[CO_COM_IMP_COMISION,nRow]    := Format(CFORMAT_DINERO,[vldTotImpProgramado]);
               Cells[CO_COM_IMP_PAGADO,nRow]      := Format(CFORMAT_DINERO,[vldTotImpPagado]);
               Cells[CO_COM_IMP_MORATORIO,nRow]   := Format(CFORMAT_DINERO,[vldTotMoraProgramado]);
               Cells[CO_COM_IMP_PAGADO_MORA,nRow] := Format(CFORMAT_DINERO,[vldTotMoraPagado]);

              If (FieldByName('SIT_COMISION').AsString = CSIT_IM) Or (FieldByName('SIT_COMISION').AsString = CSIT_LQ) Then
               Begin
                Cells[CO_COM_IMP_VENCIDO,nRow]      := Format(CFORMAT_DINERO,[vldTotImpVencido]);
                Cells[CO_COM_IMP_VENCIDO_MORA,nRow] := Format(CFORMAT_DINERO,[vldTotMoraVencido]);
               End
              Else
               Begin
                Cells[CO_COM_IMP_VENCIDO,nRow]      := C_STRZERO;
                Cells[CO_COM_IMP_VENCIDO_MORA,nRow] := C_STRZERO;
               End;

               // Reinicia Totales Variables
               vldTotImpProgramado  := 0;  vldTotImpPagado  := 0;  vldTotImpVencido  := 0;
               vldTotMoraProgramado := 0;  vldTotMoraPagado := 0;  vldTotMoraVencido := 0;
               Inc(nRow);
           End;

          // Agrega Identificador del Periodo
          bPrimero := False;
          nPeriodoActual       := FieldByName('NUM_PERIODO').AsInteger;
          Cells[CO_COL1,nRow]  := CO_CORTE;
          Cells[CO_COL2,nRow]  := CO_WORDPDO + ' ' + FieldByName('NUM_PERIODO').AsString;
          End;

         // Separador
         Inc(nRow);
         Cells[CO_COL1,nRow] := CO_SEPARADOR;
         RowHeights[nRow] := CO_ROWSEP2;

         // Coloca Todos los datos del Importe
         Inc(nRow);
         Cells[CO_COL1,nRow] := CO_CORTE1;
         Cells[CO_COL2,nRow] := FieldByName('DESC_COMISION').AsString;
         Cells[CO_COL3,nRow] := FieldByName('SIT_COMISION').AsString;
         Cells[CO_COM_CVE_COMISION,nRow]  := FieldByName('CVE_COMISION').AsString;

         //Detalle
         Inc(nRow);
         Cells[CO_COL1,nRow] := CO_DETALLE;
         Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO').AsString;
         Cells[CO_COL3,nRow] := FieldByName('SIT_COMISION').AsString;
         Cells[CO_COM_CVE_COMISION,nRow] := FieldByName('CVE_COMISION').AsString;
         Cells[CO_COM_CVE_COMISION,nRow] := FieldByName('CVE_COMISION').AsString;
         If (FieldByName('F_VENCIMIENTO').AsDateTime > 0) Then Cells[CO_COM_F_VENCIMIENTO,nRow] := FormatDateTime(CFORMAT_FECHA,FieldByName('F_VENCIMIENTO').AsDateTime);
         If (FieldByName('F_PROG_PAGO').AsDateTime > 0)   Then Cells[CO_COM_F_PROG_PAGO,nRow]   := FormatDateTime(CFORMAT_FECHA,FieldByName('F_PROG_PAGO').AsDateTime);
         If (FieldByName('F_PAGO').AsDateTime > 0)        Then Cells[CO_COM_F_PAGO,nRow]        := FormatDateTime(CFORMAT_FECHA,FieldByName('F_PAGO').AsDateTime);
         Cells[CO_COM_TITULO,nRow]          := CO_WORDIMP;
         Cells[CO_COM_IMP_COMISION,nRow]    := Format(CFORMAT_DINERO,[FieldByName('IMP_COMISION').AsFloat]);
         Cells[CO_COM_IMP_PAGADO,nRow]      := Format(CFORMAT_DINERO,[FieldByName('IMP_PAGADO').AsFloat]);
         Cells[CO_COM_IMP_MORATORIO,nRow]   := Format(CFORMAT_DINERO,[FieldByName('IMP_MORATORIO').AsFloat]);
         Cells[CO_COM_IMP_PAGADO_MORA,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_PAGADO_MORA').AsFloat]);
         If (FieldByName('SIT_COMISION').AsString = CSIT_IM) Or (FieldByName('SIT_COMISION').AsString = CSIT_LQ) Then
          Begin
          // Calcula el Importe Vencido y el Importe Vencido de Mora
          Cells[CO_COM_IMP_VENCIDO,nRow]      := Format(CFORMAT_DINERO,[FieldByName('IMP_COMISION').AsFloat - FieldByName('IMP_PAGADO').AsFloat]);
          Cells[CO_COM_IMP_VENCIDO_MORA,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_MORATORIO').AsFloat - FieldByName('IMP_PAGADO_MORA').AsFloat]);
          End
         Else
          Begin
          Cells[CO_COM_IMP_VENCIDO,nRow]      := C_STRZERO;
          Cells[CO_COM_IMP_VENCIDO_MORA,nRow] := C_STRZERO;
          End;

          Cells[CO_COM_SIT_COMISION,nRow]  := FieldByName('SIT_COMISION').AsString;

          // Calcula los Totales
          If vg_bMuestraIva Then
           Begin
            vldImpProgramado  := FieldByName('IMP_COMISION').AsFloat + FieldByName('IMP_IVA').AsFloat;
            vldImpPagado      := FieldByName('IMP_PAGADO').AsFloat + FieldByName('IMP_IVA_PAGADO').AsFloat;
            vldMoraProgramado := FieldByName('IMP_MORATORIO').AsFloat + FieldByName('IMP_IVA_MORA').AsFloat;
            vldMoraPagado     := FieldByName('IMP_PAGADO_MORA').AsFloat + FieldByName('IMP_PAG_IVA_MORA').AsFloat;
            vldImpVencido     := FieldByName('IMP_COMISION').AsFloat - FieldByName('IMP_PAGADO').AsFloat +
                                 FieldByName('IMP_IVA').AsFloat - FieldByName('IMP_IVA_PAGADO').AsFloat;
            vldMoraVencido    := FieldByName('IMP_MORATORIO').AsFloat - FieldByName('IMP_PAGADO_MORA').AsFloat +
                                 FieldByName('IMP_IVA_MORA').AsFloat - FieldByName('IMP_PAG_IVA_MORA').AsFloat;
           End
          Else
           Begin
            vldImpProgramado  := FieldByName('IMP_COMISION').AsFloat;
            vldImpPagado      := FieldByName('IMP_PAGADO').AsFloat;
            vldMoraProgramado := FieldByName('IMP_MORATORIO').AsFloat;
            vldMoraPagado     := FieldByName('IMP_PAGADO_MORA').AsFloat;
            vldImpVencido     := FieldByName('IMP_COMISION').AsFloat - FieldByName('IMP_PAGADO').AsFloat;
            vldMoraVencido    := FieldByName('IMP_MORATORIO').AsFloat - FieldByName('IMP_PAGADO_MORA').AsFloat;
           End;

         If vg_bMuestraIva Then
          Begin
          // Agrega los Importes de IVA
          Inc(nRow);
          Cells[CO_COL1,nRow] := CO_DETALLE;
          Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO').AsString;
          Cells[CO_COL3,nRow] := FieldByName('SIT_COMISION').AsString;
          Cells[CO_COM_CVE_COMISION,nRow] := FieldByName('CVE_COMISION').AsString;
          Cells[CO_COM_TITULO,nRow]           := CO_WORDIVA;
          Cells[CO_COM_IMP_IVA,nRow]          := Format(CFORMAT_DINERO,[FieldByName('IMP_IVA').AsFloat]);
          Cells[CO_COM_IMP_IVA_PAGADO,nRow]   := Format(CFORMAT_DINERO,[FieldByName('IMP_IVA_PAGADO').AsFloat]);
          Cells[CO_COM_IMP_IVA_MORA,nRow]     := Format(CFORMAT_DINERO,[FieldByName('IMP_IVA_MORA').AsFloat]);
          Cells[CO_COM_IMP_PAG_IVA_MORA,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_PAG_IVA_MORA').AsFloat]);

          If (FieldByName('SIT_COMISION').AsString = CSIT_IM) Or (FieldByName('SIT_COMISION').AsString = CSIT_LQ) Then
           Begin
           // Calcula el Importe Vencido de IVA del Importe de Comisión y el Importe de Mora Vencido de IVA del Importe de Comisión
           Cells[CO_COM_IMP_IVA_VENCIDO,nRow]  := Format(CFORMAT_DINERO,[FieldByName('IMP_IVA').AsFloat - FieldByName('IMP_IVA_PAGADO').AsFloat]);
           Cells[CO_COM_IMP_VEN_IVA_MORA,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_IVA_MORA').AsFloat - FieldByName('IMP_PAG_IVA_MORA').AsFloat]);
           End
          Else
           Begin
           Cells[CO_COM_IMP_IVA_VENCIDO,nRow]  := C_STRZERO;
           Cells[CO_COM_IMP_VEN_IVA_MORA,nRow] := C_STRZERO;
           End;

          Inc(nRow);
          Cells[CO_COL1,nRow] := CO_SUBTOTAL;
          Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO').AsString;
          Cells[CO_COL3,nRow] := FieldByName('SIT_COMISION').AsString;
          Cells[CO_COM_CVE_COMISION,nRow] := FieldByName('CVE_COMISION').AsString;          
          Cells[CO_COM_TITULO,nRow]           := CO_WORDTOT;
          Cells[CO_COM_IMP_COMISION,nRow]     := Format(CFORMAT_DINERO,[vldImpProgramado]);
          Cells[CO_COM_IMP_PAGADO,nRow]       := Format(CFORMAT_DINERO,[vldImpPagado]);
          Cells[CO_COM_IMP_MORATORIO,nRow]    := Format(CFORMAT_DINERO,[vldMoraProgramado]);
          Cells[CO_COM_IMP_PAGADO_MORA,nRow]  := Format(CFORMAT_DINERO,[vldMoraPagado]);
          If (FieldByName('SIT_COMISION').AsString = CSIT_IM) Or (FieldByName('SIT_COMISION').AsString = CSIT_LQ) Then
           Begin
           Cells[CO_COM_IMP_VENCIDO,nRow]      := Format(CFORMAT_DINERO,[vldImpVencido]);
           Cells[CO_COM_IMP_VENCIDO_MORA,nRow] := Format(CFORMAT_DINERO,[vldMoraVencido]);
           End
          Else
           Begin
           Cells[CO_COM_IMP_VENCIDO,nRow]      := C_STRZERO;
           Cells[CO_COM_IMP_VENCIDO_MORA,nRow] := C_STRZERO;
           End;
          End;

          vldTotImpProgramado   := vldTotImpProgramado + vldImpProgramado;
          vldTotImpPagado       := vldTotImpPagado + vldImpPagado;
          vldTotImpVencido      := vldTotImpVencido + vldImpVencido;
          vldTotMoraProgramado  := vldTotMoraProgramado + vldMoraProgramado;
          vldTotMoraPagado      := vldTotMoraPagado + vldMoraPagado;
          vldTotMoraVencido     := vldTotMoraVencido + vldMoraVencido;

       strSIT_COMISION := FieldByName('SIT_COMISION').AsString;
       strCVE_COMISION := FieldByName('CVE_COMISION').AsString;
       Next;
       End;

   // Agrega últimos Subtotales por periodo
   If (nRow > 0) Then
    With StrGrdComision Do
    Begin
     // Agrega un Pequeño Salto de Línea
     Inc(nRow);
     Cells[CO_COL1,nRow]  := CO_SEPARADOR;
     Cells[CO_COL2,nRow]  := IntToStr(nPeriodoActual);
     RowHeights[nRow]     := CO_ROWSEP;

     Inc(nRow);
     Cells[CO_COL1,nRow]  := CO_SUBTOTAL;
     Cells[CO_COL2,nRow]  := IntToStr(nPeriodoActual);
     Cells[CO_COL3,nRow]  := strSIT_COMISION;
     Cells[CO_COM_CVE_COMISION,nRow] := strCVE_COMISION;
     Cells[CO_COM_TITULO,nRow]  := CO_WORDTPD;
     Cells[CO_COM_IMP_COMISION,nRow]    := Format(CFORMAT_DINERO,[vldTotImpProgramado]);
     Cells[CO_COM_IMP_PAGADO,nRow]      := Format(CFORMAT_DINERO,[vldTotImpPagado]);
     Cells[CO_COM_IMP_MORATORIO,nRow]   := Format(CFORMAT_DINERO,[vldTotMoraProgramado]);
     Cells[CO_COM_IMP_PAGADO_MORA,nRow] := Format(CFORMAT_DINERO,[vldTotMoraPagado]);

    If (strSIT_COMISION = CSIT_IM) Or (strSIT_COMISION = CSIT_LQ) Then
     Begin
      Cells[CO_COM_IMP_VENCIDO,nRow]      := Format(CFORMAT_DINERO,[vldTotImpVencido]);
      Cells[CO_COM_IMP_VENCIDO_MORA,nRow] := Format(CFORMAT_DINERO,[vldTotMoraVencido]);
     End
    Else
     Begin
      Cells[CO_COM_IMP_VENCIDO,nRow]      := C_STRZERO;
      Cells[CO_COM_IMP_VENCIDO_MORA,nRow] := C_STRZERO;
     End;
    End;

 // Ajusta el tamaño del Grid a la cantidad de Resultados Mostrados
 If (nRow = 0) Then strgrdComision.RowCount := 1
 Else
  Begin
  Inc(nRow);
  AgregaEspacioParaTotales(strgrdComision, nRow, CO_INT_TITULO);
  CalculaTotales( strgrdComision, nRow,
                  [   CO_COM_IMP_COMISION     ,   CO_COM_IMP_PAGADO       ,   CO_COM_IMP_VENCIDO      ,
                      CO_COM_IMP_MORATORIO    ,   CO_COM_IMP_PAGADO_MORA  ,   CO_COM_IMP_VENCIDO_MORA] ); // Calcula los Totales
  strgrdComision.RowCount := nRow + 1;
  End;

 If Assigned(vlQry) Then vlQry.Free;
end;





procedure TWCrconsulta.MuestraDocumentos(pID_CESION : Integer; pSIT_DOCUMENTO : String);
var vlstrSQL : String;
    vlQry : TQuery;
    nRow, nTempRow : Integer;
begin
 vlstrSQL :=  ' SELECT'+coCRLF+
              '        CD.ID_CESION,'+coCRLF+
              '        CD.ID_DOCUMENTO,'+coCRLF+
              '        CD.NUM_PERIODO_DOC,'+coCRLF+
              '        CD.CVE_TIPO_INTERES,'+coCRLF+
              '        DECODE(CD.CVE_TIPO_INTERES,''IN'',''Inicio'','+coCRLF+
              '                                   ''VE'',''Venc.'',''Error'') AS DESC_TIPO_INTERES,'+coCRLF+
              '        CD.CVE_DOCUMENTO,'+coCRLF+
              '        CD.F_COMPRA,'+coCRLF+
              '        CD.F_EMISION,'+coCRLF+
              '        CD.IMP_NOMINAL,'+coCRLF+
              '        CD.IMP_COMPRA,'+coCRLF+
              '        CD.TASA_DESCUENTO,'+coCRLF+
              '        CD.TASA_AFORO,'+coCRLF+
              '        CD.SIT_DOCUMENTO,'+coCRLF+
              '        CA.IMP_CAPITAL,'+coCRLF+
              '        CA.IMP_CAPITAL AS IMP_AFORADO,'+coCRLF+
              '        CA.F_VENCIMIENTO,'+coCRLF+
              '        CA.F_PROG_PAGO,'+coCRLF+
              '        CA.F_PAGO,'+coCRLF+
              '        CA.IMP_PAGADO,'+coCRLF+
              '        CA.IMP_MORATORIO,'+coCRLF+
              '        CA.IMP_PAGADO_MORA,'+coCRLF+
              '        CA.SIT_CAPITAL,'+coCRLF+
              '        CA.F_ALTA,'+coCRLF+
              '        CI.IMP_INTERES,'+coCRLF+
              '        CR.IMP_REMANENTE'+coCRLF+
              'FROM CR_DOCUMENTO CD,'+coCRLF+
              '     CR_CAPITAL CA,'+coCRLF+
              '     CR_INTERES CI,'+coCRLF+
              '     CR_REMANENTE CR'+coCRLF+
              '  WHERE CD.ID_CESION = '+IntToStr(pID_CESION)+coCRLF+
              '  AND CA.ID_CREDITO = CD.ID_CESION'+coCRLF+
              '  AND CI.ID_CREDITO = CD.ID_CESION'+coCRLF+
              '  AND CA.NUM_PERIODO = CD.NUM_PERIODO_DOC'+coCRLF+
              '  AND CI.NUM_PERIODO = CD.NUM_PERIODO_DOC'+coCRLF+
              '  AND CR.ID_CESION (+)= CD.ID_CESION'+coCRLF+
              '  AND CR.ID_DOCUMENTO (+)= CD.CVE_DOCUMENTO'+coCRLF;

 // Los documentos no tienen IVA
 vg_bMuestraIva := False;
 If (Trim(pSIT_DOCUMENTO) <> '') Then
  vlstrSQL :=  vlstrSQL + ' AND SIT_DOCUMENTO = '+SQLSTR(pSIT_DOCUMENTO)+coCRLF;
 vlstrSQL :=   vlstrSQL + ' ORDER BY F_VENCIMIENTO, NUM_PERIODO_DOC';

 vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
 ClearGrid(strgrdDocumentos1,0);
 ClearGrid(strgrdDocumentos2,0);
 ClearGrid(strgrdDocumentos3,0);

 With strgrdDocumentos1 Do
   Begin
   ColCount := 8;
   RowCount := 9999;
   ColWidths[CO_COL1] := 0;
   ColWidths[CO_COL2] := 0;
   ColWidths[CO_COL3] := 0;
   ColWidths[CO_DOC_ID_DOCUMENTO]     := 165;                // Indica el Identificador de Documento
   ColWidths[CO_DOC_CVE_TIPO_INTERES] := 48;                 // Tipo de Interés
   ColWidths[CO_DOC_F_COMPRA]         := CO_WIDTH_FECHA;     // Fecha de Compra
   ColWidths[CO_DOC_F_PROG_PAGO]      := CO_WIDTH_FECHA;     // Fecha Programada
   ColWidths[CO_DOC_F_PAGO]           := CO_WIDTH_FECHA;     // Fecha de Pago
   End;

 With strgrdDocumentos2 Do
   Begin
   ColCount := 10;
   RowCount := strgrdDocumentos1.RowCount;
   ColWidths[CO_COL1] := 0;
   ColWidths[CO_COL2] := 0;
   ColWidths[CO_COL3] := 0;
   ColWidths[CO_DOC_IMP_NOMINAL]   := CO_WIDTH_DINERO;    // Importe Nominal
   ColWidths[CO_DOC_IMP_AFORADO]   := CO_WIDTH_DINERO;    // Importe Aforado
   ColWidths[CO_DOC_IMP_REMANENTE] := CO_WIDTH_DINERO;    // Importe Remanente
   ColWidths[CO_DOC_IMP_COMPRA]    := CO_WIDTH_DINERO;    // Importe Compra
   ColWidths[CO_DOC_IMP_INTERES]   := CO_WIDTH_DINERO;    // Importe Interés
   ColWidths[CO_DOC_IMP_PAGADO]    := CO_WIDTH_DINERO;    // Importe Pagado
   ColWidths[CO_DOC_IMP_VENCIDO]   := CO_WIDTH_DINERO;    // Importe Vencido
   End;

 With strgrdDocumentos3 Do
   Begin
   ColCount := 3;
   RowCount := strgrdDocumentos1.RowCount;
   ColWidths[CO_COL1] := 0;
   ColWidths[CO_COL2] := 0;
   ColWidths[CO_COL3] := 17; // Situación
   End;

 nRow := 0;
 IniciaError(strgrdDocumentos1);
 IniciaError(strgrdDocumentos2);
 IniciaError(strgrdDocumentos3);

 If Assigned(vlQry) Then
  With vlQry Do
   While Not Eof Do
    Begin
     strgrdDocumentos1.Cells[CO_COL1,nRow] := CO_DETALLE;
     strgrdDocumentos1.Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO_DOC').AsString;
     strgrdDocumentos1.Cells[CO_COL3,nRow] := FieldByName('SIT_DOCUMENTO').AsString;
     strgrdDocumentos1.Cells[CO_DOC_ID_DOCUMENTO,nRow]     := FieldByName('ID_DOCUMENTO').AsString;
     strgrdDocumentos1.Cells[CO_DOC_CVE_TIPO_INTERES,nRow] := FieldByName('DESC_TIPO_INTERES').AsString;
     If (FieldByName('F_COMPRA').AsDateTime > 0)      Then strgrdDocumentos1.Cells[CO_DOC_F_COMPRA,nRow]    := FormatDateTime(CFORMAT_FECHA, FieldByName('F_COMPRA').AsDateTime);
     If (FieldByName('F_PROG_PAGO').AsDateTime > 0)   Then strgrdDocumentos1.Cells[CO_DOC_F_PROG_PAGO,nRow] := FormatDateTime(CFORMAT_FECHA, FieldByName('F_PROG_PAGO').AsDateTime);
     If (FieldByName('F_PAGO').AsDateTime > 0)        Then strgrdDocumentos1.Cells[CO_DOC_F_PAGO,nRow]      := FormatDateTime(CFORMAT_FECHA, FieldByName('F_PAGO').AsDateTime);

     strgrdDocumentos2.Cells[CO_COL1,nRow] := CO_DETALLE;
     strgrdDocumentos2.Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO_DOC').AsString;
     strgrdDocumentos2.Cells[CO_COL3,nRow] := FieldByName('SIT_DOCUMENTO').AsString;
     strgrdDocumentos2.Cells[CO_DOC_IMP_NOMINAL,nRow]   := Format(CFORMAT_DINERO,[FieldByName('IMP_NOMINAL').AsFloat]);
     strgrdDocumentos2.Cells[CO_DOC_IMP_AFORADO,nRow]   := Format(CFORMAT_DINERO,[FieldByName('IMP_AFORADO').AsFloat]);
     strgrdDocumentos2.Cells[CO_DOC_IMP_REMANENTE,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_REMANENTE').AsFloat]);
     strgrdDocumentos2.Cells[CO_DOC_IMP_COMPRA,nRow]    := Format(CFORMAT_DINERO,[FieldByName('IMP_COMPRA').AsFloat]);
     strgrdDocumentos2.Cells[CO_DOC_IMP_INTERES,nRow]   := Format(CFORMAT_DINERO,[FieldByName('IMP_INTERES').AsFloat]);
     strgrdDocumentos2.Cells[CO_DOC_IMP_PAGADO,nRow]    := Format(CFORMAT_DINERO,[FieldByName('IMP_PAGADO').AsFloat]);

     If (FieldByName('SIT_DOCUMENTO').AsString <> CSIT_AC) Then
      strgrdDocumentos2.Cells[CO_DOC_IMP_VENCIDO,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_AFORADO').AsFloat - FieldByName('IMP_PAGADO').AsFloat]);

     strgrdDocumentos3.Cells[CO_COL1,nRow] := CO_DETALLE;
     strgrdDocumentos3.Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO_DOC').AsString;
     strgrdDocumentos3.Cells[CO_COL3,nRow] := FieldByName('SIT_DOCUMENTO').AsString;
   Inc(nRow);
   Next;
   End;

 // Ajusta el tamaño del Grid a la cantidad de Resultados Mostrados
 If (nRow = 0) Then
  Begin
  strgrdDocumentos1.RowCount := 1;
  strgrdDocumentos2.RowCount := 1;
  strgrdDocumentos3.RowCount := 1;
  End
 Else
  Begin
  // Agrega Pequeño Renglon Separador;
  nTempRow := nRow;  AgregaEspacioParaTotales(strgrdDocumentos1, nTempRow, CO_DOC_TITULO);
  nTempRow := nRow;  AgregaEspacioParaTotales(strgrdDocumentos2, nTempRow, -1);
  nTempRow := nRow;  AgregaEspacioParaTotales(strgrdDocumentos3, nTempRow, -1);

  // Calcula los Totales
  CalculaTotales( strgrdDocumentos2, nTempRow,
                  [   CO_DOC_IMP_NOMINAL   ,   CO_DOC_IMP_AFORADO   ,   CO_DOC_IMP_REMANENTE ,
                      CO_DOC_IMP_COMPRA    ,   CO_DOC_IMP_INTERES   ,   CO_DOC_IMP_PAGADO    ,
                      CO_DOC_IMP_VENCIDO  ] );

  strgrdDocumentos1.RowCount := nTempRow + 1;
  strgrdDocumentos2.RowCount := nTempRow + 1;
  strgrdDocumentos3.RowCount := nTempRow + 1;
  End;

 If Assigned(vlQry) Then vlQry.Free;
end;

procedure TWCrconsulta.MuestraFinanciamiento(pID_CREDITO : Integer; pSIT_CREDITO : String);
var vlstrSQL : String;
    vlQry : TQuery;
    nRow : Integer;
begin
 vlstrSQL :=  ' SELECT * FROM CR_FINAN_ADIC '+coCRLF+
              ' WHERE ID_CREDITO = '+IntToStr(pID_CREDITO);
 If (Trim(pSIT_CREDITO) <> '') Then
  vlstrSQL :=  vlstrSQL + ' AND SIT_FINAN_ADIC = '+SQLSTR(pSIT_CREDITO)+coCRLF;
 vlstrSQL := vlstrSQL + ' ORDER BY F_VENCIMIENTO, NUM_PERIODO ';

 vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

  ClearGrid(strgrdFinanciamiento, 0);

  vg_bMuestraIva := False;
  With strgrdFinanciamiento Do
   Begin
   RowHeights[0] := DefaultRowHeight;
   RowCount := 1;   //  DESCRIPCION DE LAS COLUMNAS
   ColCount := 12;
   RowCount := 9999;

   ColWidths[CO_COL1] := 0;
   ColWidths[CO_COL2] := 0;
   ColWidths[CO_COL3] := 0;
   ColWidths[CO_NUM_PERIODO]        := 24;
   ColWidths[CO_F_VENCIMIENTO]      := CO_WIDTH_FECHA;
   ColWidths[CO_F_PROG_PAGO]        := CO_WIDTH_FECHA;
   ColWidths[CO_F_PAGO]             := CO_WIDTH_FECHA;
   ColWidths[CO_FIN_TITULO]         := 42;
   ColWidths[CO_IMP_FINAN_ADIC]     := CO_WIDTH_DINERO;
   ColWidths[CO_IMP_PAGADO]         := CO_WIDTH_DINERO;
   ColWidths[CO_IMP_FINAN_VENCIDO]  := CO_WIDTH_DINERO;
   ColWidths[CO_SIT_FINAN_ADIC]     := 17;
   End;
 IniciaError(strgrdFinanciamiento);

 nRow := 0;
 If Assigned(vlQry) then
  With (vlQry) Do
   While Not Eof Do
    Begin
      strgrdFinanciamiento.Cells[CO_COL1,nRow] := CO_DETALLE;
      strgrdFinanciamiento.Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO').AsString;
      strgrdFinanciamiento.Cells[CO_COL3,nRow] := FieldByName('SIT_FINAN_ADIC').AsString;

      strgrdFinanciamiento.Cells[CO_NUM_PERIODO, nRow] := FieldByName('NUM_PERIODO').AsString;

      If (FieldByName('F_VENCIMIENTO').AsDateTime > 0) Then strgrdFinanciamiento.Cells[CO_F_VENCIMIENTO, nRow]  := FormatDateTime(CFORMAT_FECHA, FieldByName('F_VENCIMIENTO').AsDateTime);
      If (FieldByName('F_PROG_PAGO').AsDateTime > 0)   Then strgrdFinanciamiento.Cells[CO_F_PROG_PAGO, nRow]    := FormatDateTime(CFORMAT_FECHA, FieldByName('F_PROG_PAGO').AsDateTime);
      If (FieldByName('F_PAGO').AsDateTime > 0)        Then strgrdFinanciamiento.Cells[CO_F_PAGO, nRow]         := FormatDateTime(CFORMAT_FECHA, FieldByName('F_PAGO').AsDateTime);

      strgrdFinanciamiento.Cells[CO_IMP_FINAN_ADIC, nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_FINAN_ADIC').AsFloat]);
      strgrdFinanciamiento.Cells[CO_IMP_PAGADO, nRow]     := Format(CFORMAT_DINERO,[FieldByName('IMP_PAGADO').AsFloat]);

      If (FieldByName('SIT_FINAN_ADIC').AsString <> CSIT_AC) Then
       strgrdFinanciamiento.Cells[CO_IMP_FINAN_VENCIDO,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_FINAN_ADIC').AsFloat - FieldByName('IMP_PAGADO').AsFloat]);

      strgrdFinanciamiento.Cells[CO_SIT_FINAN_ADIC, nRow] := FieldByName('SIT_FINAN_ADIC').AsString;
      Inc(nRow);
      Next;
    End;

 // Ajusta el tamaño del Grid a la cantidad de Resultados Mostrados
 If (nRow = 0) Then
  strgrdFinanciamiento.RowCount := 1
 Else
  Begin
  // Agrega Pequeño Renglon Separador;
  AgregaEspacioParaTotales( strgrdFinanciamiento, nRow, CO_FIN_TITULO);
  // Calcula los Totales
  CalculaTotales( strgrdFinanciamiento, nRow, [ CO_IMP_FINAN_ADIC, CO_IMP_PAGADO, CO_IMP_FINAN_VENCIDO ] );
  strgrdFinanciamiento.RowCount := nRow + 1;
  End;

 If Assigned(vlQry) Then vlQry.Free;
end;

procedure TWCrconsulta.MuestraTabuladores(pID_CREDITO : Integer);
var vlstrSQL : String;
    vlQry : TQuery;
begin
   vlstrSQL :=
                ' SELECT CC.ID_CREDITO,'+coCRLF+
                '        CO.ID_CONTRATO,'+coCRLF+
                '        CP.CVE_PRODUCTO_CRE,'+coCRLF+
                '        CP.B_CONSULTA_CAP,'+coCRLF+
                '        CP.B_CONSULTA_INT,'+coCRLF+
                '        CP.B_CONSULTA_COM,'+coCRLF+
                '        CP.B_CONSULTA_DOC,'+coCRLF+
                '        CP.B_CONSULTA_FIN'+coCRLF+
                ' FROM CR_CREDITO CC,'+coCRLF+
                '      CR_CONTRATO CO,'+coCRLF+
                '      CR_PRODUCTO CP'+coCRLF+
                ' WHERE CC.ID_CREDITO = '+IntToStr(pID_CREDITO)+coCRLF+
                '   AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
                '   AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE';
  vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
  If Assigned(vlQry) Then
   Begin
     With (vlQry) Do
      Begin
      tbshtCapital.TabVisible        := FieldByName('B_CONSULTA_CAP').AsString = 'V';
      tbshtInteres.TabVisible        := FieldByName('B_CONSULTA_INT').AsString = 'V';
      tbshtComision.TabVisible       := FieldByName('B_CONSULTA_COM').AsString = 'V';
      tbshtDocumentos.TabVisible     := FieldByName('B_CONSULTA_DOC').AsString = 'V';
      tbshtFinanciamiento.TabVisible := FieldByName('B_CONSULTA_FIN').AsString = 'V';

      //HERJA
      if not(tbshtFinanciamiento.TabVisible) then
      begin
        Shape41.Visible:=false;
        Shape58.Visible:=false;
        Label31.Visible:=false;
        Label45.Visible:=false;
        Rtfinan.Visible:=false;
        cbAllFA.Visible:=false;
      end;

      Close;
      Free;
      End;
    End;
end;

procedure TWCrconsulta.IniciaError(var StrGrd : TStringGrid);
begin
 If Assigned(StrGrd) Then
  Begin
  StrGrd.Cells[CO_COL1, 0] := CO_ERROR;
  StrGrd.Cells[CO_COL2, 0] := CERROR_NOEXISTEN;
  End;
end;

procedure TWCrconsulta.AgregaEspacioParaTotales( var StrGrd : TStringGrid; var nRow : Integer; nColTitulo : Integer);
begin
  // Agrega Pequeño Renglon Separador;
  If Assigned(StrGrd) Then
   Begin
   StrGrd.Cells[CO_COL1, nRow] := CO_SEPARADOR; // Identificador de Separador
   StrGrd.RowHeights[nRow] := CO_ROWSEP; // Tamaño del Separador
   Inc(nRow);
   If (nColTitulo > -1) Then
    StrGrd.Cells[nColTitulo,nRow] := CO_WORDTOT; // Word Total
   StrGrd.Cells[CO_COL1,   nRow] := CO_TOTAL; // Identificador de Separador
   End;
end;

procedure TWCrconsulta.CalculaTotales(var StrGrd : TStringGrid; nRowTotales : Integer; const AColumnasTotales : Array of Integer );
var I, J, nColumnas : Integer;
    ASumaColIndividual : TArrayDouble;
    str : String;
begin
  If Assigned(StrGrd) Then
   Begin
   nColumnas := High(AColumnasTotales)+1;  // Obtiene el total de columnas
   SetLength(ASumaColIndividual, nColumnas); // Crea un arreglo de variables Flotantes para llevar la cuenta de cada columna
   For J := 0 To nColumnas-1 Do // Inicializa sus valores en 0
    ASumaColIndividual[J] := 0;

    With StrGrd Do
      Begin
       For I := 0 To RowCount-1 Do
        If ( Cells[CO_COL1,I] = CO_DETALLE ) And ( Cells[CO_COL3,I] <> CSIT_CA ) Then
         For J := 0 To nColumnas-1 Do
          Begin
           str := TrimChar( Cells[AColumnasTotales[J], I], '$,'#32);
           If (str <> '') Then
            ASumaColIndividual[J] := ASumaColIndividual[J] + StrToFloat(str);
          End;

        For J := 0 To nColumnas-1 Do
         Cells[AColumnasTotales[J],nRowTotales] := Format(CFORMAT_DINERO,[ASumaColIndividual[J]]);
      End;
   // Libera Espacio
   SetLength(ASumaColIndividual, 0);
   End;
end;

procedure TWCrconsulta.MostrarDetallePeriodo(StrGrd : TStringGrid);
var CrCapital : TCrCapital;
    CrInteres : TCrInteres;
    CrComisio : TCrComisio;
    CrDocto   : TCrDocto;
    nNUM_PERIODO : Integer;
    strID_DOCUMENTO : String;
    strCVE_COMISION : String;
begin
  If Assigned(StrGrd) Then
   With StrGrd Do
    If IsInteger(Cells[CO_COL2,Row]) Then
      Begin
        nNUM_PERIODO    := StrToInt(Cells[CO_COL2,Row]);

        Case ConsultaActual Of
         ftCapital        : Try
                             CrCapital := TCrCapital.Create(Self);
                             CrCapital.ParamCre := Objeto.ParamCre;
                             CrCapital.GetParams(Objeto);
                             CrCapital.FindKey([Credito, nNUM_PERIODO]);
                             CrCapital.Consulta;
                            Finally
                             If Assigned(CrCapital) Then CrCapital.Free;
                            End;

         ftInteres        : Try
                             CrInteres := TCrInteres.Create(Self);
                             CrInteres.GetParams(Objeto);
                             CrInteres.ParamCre := Objeto.ParamCre;
                             CrInteres.FindKey([Credito, nNUM_PERIODO]);
                             CrInteres.Consulta;
                            Finally
                             If Assigned(CrInteres) Then CrInteres.Free;
                            End;

         ftComision       : Try
                              strCVE_COMISION := strgrdComision.Cells[CO_COM_CVE_COMISION, Row];
                              CrComisio := TCrComisio.Create(Self);
                              CrComisio.GetParams(Objeto);
                              CrComisio.ParamCre := Objeto.ParamCre;
                              CrComisio.FindKey([Credito, nNUM_PERIODO, strCVE_COMISION]);
                              CrComisio.Consulta;
                             Finally
                              If Assigned(CrComisio) Then CrComisio.Free;
                             End;

         ftDocumentos     : Try
                              strID_DOCUMENTO := strgrdDocumentos1.Cells[CO_DOC_ID_DOCUMENTO ,Row];
                              CrDocto := TCrDocto.Create(Self);
                              CrDocto.GetParams(Objeto);
                              CrDocto.ParamCre := Objeto.ParamCre;
                              CrDocto.FindKey([Credito, strID_DOCUMENTO]);
                              CrDocto.Cesion.CreCto.FindKey([Obten_Contrato(Credito, Objeto.Apli),'1']);
                              CrDocto.Consulta;
                            Finally
                              If Assigned(CrDocto) Then CrDocto.Free;
                            End;
        End; // Case
      End; // If
end;

procedure TWCrconsulta.MostrarTotalPeriodos(pStrSituacion : String);
var I, J, vlnTabIndex : Integer;
    vlStrGrd : TStringGrid;
    vlnPeriodoActual, vlnPeriodo,
    vlnTotPeriodoSit, vlnTotPeriodo : Integer;
begin
  vlStrGrd := Nil;
   Case ConsultaActual Of
    ftCapital        : vlStrGrd := StrGrdCapital;
    ftInteres        : vlStrGrd := StrGrdInteres;
    ftComision       : vlStrGrd := StrGrdComision;
    ftDocumentos     : vlStrGrd := StrGrdDocumentos1;
    ftFinanciamiento : vlStrGrd := StrGrdFinanciamiento;
   End;

  vlnPeriodoActual := -1; vlnTotPeriodo := 0; vlnTotPeriodoSit := 0;

  If Assigned(vlStrGrd) Then
   With (vlStrGrd) Do
     For I := 0 To RowCount-1 Do
      If IsInteger(Cells[CO_COL2,I]) Then
       Begin
        vlnPeriodo := StrToInt(Cells[CO_COL2,I]);
        If (vlnPeriodoActual <> vlnPeriodo) Then
         Begin
         vlnPeriodoActual := vlnPeriodo;
         Inc(vlnTotPeriodo);

         If (pStrSituacion = Cells[CO_COL3,I]) Then
            Inc(vlnTotPeriodoSit);
         End;
       End;

  vlnTabIndex := 0;
  For J := 0 To High(CO_A_SITUACION) Do
   If (CO_A_SITUACION[J] = pStrSituacion) Then
    Begin
    vlnTabIndex := J;
    Break;
    End;

  lblPeriodos.Caption := 'Total de Periodos = '+IntToStr(vlnTotPeriodo);
  If (pStrSituacion <> '') Then
   lblPeriodos.Caption := lblPeriodos.Caption +
                          '          Total de Periodos '+tbstSituacion.Tabs[vlnTabIndex]+' = '+IntToStr(vlnTotPeriodoSit);
end;

procedure TWCrconsulta.MostrarPaginaError;

  procedure ActivaUltimaPagina(pstrCaption1, pstrCaption2 : String);
  var vlstrSQL, vlCVE_PRODUCTO_CRE : String;
  begin
    vlstrSQL := ' SELECT CO.CVE_PRODUCTO_CRE '+coCRLF+
                ' FROM CR_CREDITO CC,'+coCRLF+
                '      CR_CONTRATO CO'+coCRLF+
                ' WHERE ID_CREDITO = '+IntToStr(Credito)+coCRLF+
                '   AND CO.ID_CONTRATO  = CC.ID_CONTRATO';
   GetSQLStr(vlstrSQL, Objeto.DataBaseName, Objeto.SessionName, 'CVE_PRODUCTO_CRE', vlCVE_PRODUCTO_CRE, False);

   tbshtNone.Caption := pstrCaption1;
   lblMsgError.Caption := 'No existen ó no esta configurada la vista "'+pstrCaption2+'" para el producto "'+
                          vlCVE_PRODUCTO_CRE+'"'+coCRLF+' de está disposición : '+IntToStr(Credito);
  end;

begin
 If (Credito > -1) Then
  Begin
   tbshtNone.TabVisible := True;
   ConsultaActual := ftNone; // Muestra el tbshtNone de Error
   Case Objeto.Opcion Of
                        ftCapital        : ActivaUltimaPagina(tbshtCapital.Caption,'Periodos de Capital');
                        ftInteres        : ActivaUltimaPagina(tbshtInteres.Caption,'Periodos de Interés');
                        ftComision       : ActivaUltimaPagina(tbshtComision.Caption,'Periodos de Comisión');
                        ftDocumentos     : ActivaUltimaPagina(tbshtDocumentos.Caption,'Documentos');
                        ftFinanciamiento : ActivaUltimaPagina(tbshtFinanciamiento.Caption,'Financiamiento');
                       End;
  End;
end;

procedure TWCrconsulta.Mostrar(pStrSituacion  : String);
begin
 If (Credito > -1) And (ConsultaActual <> ftNone) Then
  Begin
   tbshtNone.TabVisible := False;
   vg_bMuestraIva := Aplica_IVA;
   MuestraTabuladores(Credito);
   Case ConsultaActual Of
    ftCapital        : If tbshtCapital.TabVisible        Then MuestraCapital(Credito,pStrSituacion);
    ftInteres        : If tbshtInteres.TabVisible        Then MuestraInteres(Credito,pStrSituacion);
    ftComision       : If tbshtComision.TabVisible       Then MuestraComision(Credito,pStrSituacion);
    ftDocumentos     : If tbshtDocumentos.TabVisible     Then MuestraDocumentos(Credito,pStrSituacion);
    ftFinanciamiento : If tbshtFinanciamiento.TabVisible Then MuestraFinanciamiento(Credito,pStrSituacion);
    End;
   MostrarTotalPeriodos(pStrSituacion);
  End;
end;


{ Eventos }

procedure TWCrconsulta.pgctrlConsultaChange(Sender: TObject);
begin
 btnRefrescarClick(Self);
end;

procedure TWCrconsulta.btnRefrescarClick(Sender: TObject);
begin
 Mostrar(SituacionActual);
end;

procedure TWCrconsulta.tbstSituacionChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
begin
 Mostrar(CO_A_SITUACION[NewTab]);
end;

procedure TWCrconsulta.strgrdCapitalDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
const LIGHT_YELLOW = $00CCFFFF;
      LIGHT_GRAY = $00F0F0F0;

 // Esta función se hizo con el fin de reemplazar a la conocida función RECT()
 // debido a que el compilador confunde el llamado entre la variable y la función
 // en este procedimiento...
 function Rect_(nLeft, nTop, nRight, nBottom : Integer) : TRect;
 var R : TRect;
 begin
  R.Left := nLeft;
  R.Top := nTop;
  R.Right := nRight;
  R.Bottom := nBottom;
  Result := R;
 end;

var Rect1 : TRect;
    str, strIdentificador : String;
    nLeftCol : Integer;
    Bmp : TBitmap;
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin
    strIdentificador := Cells[CO_COL1,ARow];

    If (gdSelected In State) Then Canvas.Brush.Color := clNavy;

    // Separador
    If (strIdentificador = CO_SEPARADOR) Then
     Begin
         Rect1 := Rect_(0, Rect.Top, Width,Rect.Bottom);
         Canvas.Brush.Color := clWhite;
         Canvas.FillRect(Rect1);
     End

    // Titulo de Periodo o Mensaje de que No Existen Datos
    Else If (strIdentificador = CO_CORTE) Or (strIdentificador = CO_ERROR) Then
     Begin
         str := Cells[CO_COL2, ARow];
         Rect1 := Rect_(0, Rect.Top, Width,Rect.Bottom);
         Canvas.Brush.Color := LIGHT_YELLOW;
         Canvas.FillRect(Rect1);
         Canvas.Font.Style := [fsBold];
         Canvas.Font.Color := clBlack;
         Canvas.TextRect(Rect1, (Rect1.Right - Canvas.TextWidth(str)) div 2, Rect1.Top, str);
     End

    // Suttitulo de Periodo
    Else If (strIdentificador = CO_CORTE1) Then
     Begin
         str := Cells[CO_COL2, ARow];
         Rect1 := Rect_(0, Rect.Top, Width,Rect.Bottom);
         Canvas.Brush.Color := clWhite;
         Canvas.FillRect(Rect1);
         Canvas.Font.Style := [fsItalic];
         Canvas.Font.Color := clBlack;
         Canvas.TextRect(Rect1, Rect1.Left + 10, Rect1.Top, str);
     End

    // Cambio de Color del Detalle
    Else If (strIdentificador = CO_DETALLE) Or (strIdentificador = CO_SUBTOTAL) Or (strIdentificador = CO_TOTAL)Then
     Begin
          str := Cells[CO_COL3,ARow];
          If (str = CSIT_AC) Then  Canvas.Font.Color := clGreen;
          If (str = CSIT_LQ) Then  Canvas.Font.Color := clBlue;
          If (str = CSIT_IM) Then  Canvas.Font.Color := clRed;
          If (str = CSIT_CA) Then  Canvas.Font.Color := clDkGray;
          If (str = CSIT_PA) Or (str = '') Then  Canvas.Font.Color := clBlack;
          If (gdSelected In State) Then Canvas.Font.Color := clWhite;

          If Not (gdSelected In State) And Not (vg_bMuestraIva) And (Sender <> strgrdComision) Then
           Begin
           If ((ARow Mod 2) = 0) Then Canvas.Brush.Color := LIGHT_GRAY
           Else Canvas.Brush.Color := clWhite;
           End;

          If (ColWidths[ACol] = CO_WIDTH_DINERO) OR(ColWidths[ACol] = CO_WIDTH_DINERO2)
          OR (ColWidths[ACol] = CO_WIDTH_DINERO3) Then
           Canvas.TextRect(Rect,Rect.Right - Canvas.TextWidth(Cells[ACol, ARow]),Rect.Top,Cells[ACol, ARow])
          Else
           Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);
     End;

    // Unicamente para el GRID 2 de Documentos, pinta los titulos
     If (Sender = strgrdDocumentos2) Then
     Begin
     If (strgrdDocumentos2.LeftCol < 3) Then strgrdDocumentos2.LeftCol := 3;
     nLeftCol := strgrdDocumentos2.LeftCol;

     lbl1.Caption := CO_A_LBL_DOCTO[nLeftCol];
     lbl2.Caption := CO_A_LBL_DOCTO[nLeftCol+1];
     lbl3.Caption := CO_A_LBL_DOCTO[nLeftCol+2];
     lbl4.Caption := CO_A_LBL_DOCTO[nLeftCol+3];
     End;

     If (Sender = strgrdInteres) Then
      If (ACol = CO_INT_B_FINANC) And (strIdentificador = CO_DETALLE)
          And (strgrdInteres.Cells[CO_INT_TITULO,Arow] = CO_WORDIMP) Then
        Begin
        Bmp := TBitmap.Create;
        If (Cells[CO_INT_B_FINANC,ARow] = CO_CHECKED) Then ImageList.GetBitmap(1,Bmp)
        Else ImageList.GetBitmap(0,Bmp);
        strgrdInteres.Canvas.Draw(Rect.Left,Rect.Top,Bmp);
        Bmp.FreeImage;
        Bmp.Free;
        End;
   End;
end;

procedure TWCrconsulta.edNum_PeriodoKeyPress(Sender: TObject;
  var Key: Char);
begin
 If Key = #13 Then btnIrClick(Self);
 If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
end;

procedure TWCrconsulta.btnIrClick(Sender: TObject);
var StrGrd : TStringGrid;
    I : Integer;
begin
 StrGrd := Nil;
 Case ConsultaActual Of
  ftCapital        : StrGrd := strGrdCapital;
  ftInteres        : StrGrd := strGrdInteres;
  ftComision       : StrGrd := strGrdComision;
  ftDocumentos     : StrGrd := strGrdDocumentos1;
  ftFinanciamiento : StrGrd := strGrdFinanciamiento;
 End;

 If Assigned(StrGrd) Then
   If (edNum_Periodo.Text <> '') Then
     With StrGrd Do
      For I := 0 To RowCount - 1 Do
        If (Cells[CO_COL2,I] = edNum_Periodo.Text) Then
          Begin
          Row := I;
          Break;
          End;
end;

procedure TWCrconsulta.strgrdDocumentos1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);

  procedure AsignaSeleccion( Sender, Grid : TStringGrid );
  begin
    if Sender <> Grid then
     Begin
     Grid.Row := ARow;
     End;
  end;
var
  Rect : TGridRect;
begin
 If Sender Is TStringGrid  Then
  Begin

    If Not Assigned(vgGrid) Then
     vgGrid := (Sender As TStringGrid);

    If (vgGrid = Sender) Then
     Begin
     AsignaSeleccion( Sender As TStringGrid, strgrdDocumentos1 );
     AsignaSeleccion( Sender As TStringGrid, strgrdDocumentos2 );
     AsignaSeleccion( Sender As TStringGrid, strgrdDocumentos3 );
     vgGrid := Nil;
     End;
  End;

 If (Sender = strgrdDocumentos2) Then
  CanSelect := ACol > 2;
end;

procedure TWCrconsulta.strgrdDocumentos3TopLeftChanged(Sender: TObject);

  procedure AsignaTopRow( Sender, Grid : TStringGrid );
  begin
    if Sender <> Grid then
      Grid.TopRow := Sender.TopRow
  end;

begin
 If Sender Is TStringGrid Then
   Try
    AsignaTopRow( Sender As TStringGrid, strgrdDocumentos1 );
    AsignaTopRow( Sender As TStringGrid, strgrdDocumentos2 );
    AsignaTopRow( Sender As TStringGrid, strgrdDocumentos3 );
   Finally
   End;
end;

procedure TWCrconsulta.strgrdCapitalDblClick(Sender: TObject);
begin
 If (Sender Is TStringGrid) Then
  MostrarDetallePeriodo((Sender As TStringGrid));
end;

procedure TWCrconsulta.strgrdCapitalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vlnTabIndex : Integer;
begin
 If (Sender Is TStringGrid) Then
   Begin
   vlnTabIndex := tbstSituacion.TabIndex;

   If Key = VK_RETURN Then MostrarDetallePeriodo(Sender As TStringGrid)
   Else If ((ssCtrl In Shift) And (ssShift In Shift) And (Key = VK_TAB))
           Or ((ssCtrl In Shift) And (Key = VK_PRIOR)) Then Dec(vlnTabIndex)
   Else If ((ssCtrl In Shift) And (Key = VK_TAB))
           Or ((ssCtrl In Shift) And (Key = VK_NEXT)) Then Inc(vlnTabIndex);

   If (vlnTabIndex > tbstSituacion.Tabs.Count-1) Then vlnTabIndex := 0
   Else If (vlnTabIndex < 0) Then vlnTabIndex := tbstSituacion.Tabs.Count-1;
   tbstSituacion.TabIndex := vlnTabIndex;
   End;
end;

procedure TWCrconsulta.ConsultadePeriodo1Click(Sender: TObject);
begin
  MostrarDetallePeriodo(strGrdCapital);
end;

procedure TWCrconsulta.MenuItem1Click(Sender: TObject);
begin
  MostrarDetallePeriodo(strGrdInteres);
end;

procedure TWCrconsulta.PopupMenuCapitalPopup(Sender: TObject);
var vlQry : TQuery;
    vlstrSQL : String;
begin
 vlstrSQL :=
            ' SELECT CP.CVE_PRORROGA,'+coCRLF+
            '        CP.DESC_PRORROGA'+coCRLF+
            ' FROM CR_CREDITO CC,'+coCRLF+
            '      CR_CONTRATO CO,'+coCRLF+
            '      CR_PRGA_PRODUCTO CPP,'+coCRLF+
            '      CR_PRORROGA CP'+coCRLF+
            ' WHERE CC.ID_CREDITO = '+IntToStr(Credito)+coCRLF+
            '   AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
            '   AND CPP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE'+coCRLF+
            '   AND CP.CVE_PRORROGA = CPP.CVE_PRORROGA'+coCRLF;

 vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

 ProrrogaxFechadeVencimiento1.Visible := False;
 ProrrogaxAjustedeImporte1.Visible := False;
 ProrrogaxIncdePeriodo1.Visible := False;

 If Assigned(vlQry) Then
   With (vlQry) Do
    Try
     While Not EOF Do
      Begin
        If (FieldByName('CVE_PRORROGA').AsString = 'PROFVE') Then
         Begin
         { Capital }
         ProrrogaxFechadeVencimiento1.Caption := FieldByName('DESC_PRORROGA').AsString;
         ProrrogaxFechadeVencimiento1.Visible := True;

         { Interés }
         ProrrogaxFechadeVencimiento2.Caption := FieldByName('DESC_PRORROGA').AsString;
         ProrrogaxFechadeVencimiento2.Visible := True;
         End;

        If (FieldByName('CVE_PRORROGA').AsString = 'PROIMP') Then
         Begin
         ProrrogaxAjustedeImporte1.Caption := FieldByName('DESC_PRORROGA').AsString;
         ProrrogaxAjustedeImporte1.Visible := True;
         End;

        If (FieldByName('CVE_PRORROGA').AsString = 'PROINC') Then
         Begin
         ProrrogaxIncdePeriodo1.Caption := FieldByName('DESC_PRORROGA').AsString;
         ProrrogaxIncdePeriodo1.Visible := True;
         End;
        Next;
      End;
    Finally
     Close;
     Free;
    End;
end;

procedure TWCrconsulta.ProrrogaxFechadeVencimiento1Click(Sender: TObject);
var Prgavenci : TPrgavenci;
    nRow : Integer;
begin
 nRow := strgrdCapital.Row;
 If (strgrdCapital.Cells[CO_COL3, nRow] = CSIT_AC)  Or
     (strgrdCapital.Cells[CO_COL3, nRow] = CSIT_PA)  Then
   Begin
     Prgavenci := TPrgavenci.Create(Self);
     Try
      Prgavenci.GetParams(Objeto);
      Prgavenci.ID_CREDITO.AsInteger := Credito;
      Prgavenci.NUM_PERIODO.AsInteger := StrToInt(strgrdCapital.Cells[CO_CAP_NUM_PERIODO, nRow]);
      Prgavenci.F_VENCIMIENTO.AsDateTime := StrToDate(strgrdCapital.Cells[CO_CAP_F_VENCIMIENTO, nRow]);
      Prgavenci.CVE_CONCEPTO.AsString := 'KA';
      Prgavenci.ParamCre := Objeto.ParamCre;
      Prgavenci.ShowWindow(ftGrid);
      btnRefrescarClick(Self);      
     Finally
      If Assigned(Prgavenci) Then Prgavenci.Free;
     End;
   End
  Else
   MessageDlg(CO_DEBE_ESTAR_ACTIVO, mtError, [mbOk], 0);
end;

procedure TWCrconsulta.ProrrogaxAjustedeImporte1Click(Sender: TObject);
var Prgaajust : TPrgaajust;
    nRow : Integer;
begin
 nRow := strgrdCapital.Row;
 If (strgrdCapital.Cells[CO_COL3, nRow] = CSIT_AC) Or
     (strgrdCapital.Cells[CO_COL3, nRow] = CSIT_PA) Then
   Begin
     Prgaajust := TPrgaajust.Create(Self);
     Try
      Prgaajust.GetParams(Objeto);
      Prgaajust.ID_CREDITO.AsInteger := Credito;
      Prgaajust.NUM_PERIODO.AsInteger := StrToInt(strgrdCapital.Cells[CO_CAP_NUM_PERIODO, nRow]);
      Prgaajust.IMP_CAPITAL.AsFloat := StrToFloat(TrimChar(strgrdCapital.Cells[CO_CAP_IMP_CAPITAL, nRow], #32','));
      Prgaajust.ParamCre := Objeto.ParamCre;
      Prgaajust.ShowWindow(ftGrid);
      btnRefrescarClick(Self);
     Finally
      If Assigned(Prgaajust) Then Prgaajust.Free;
     End;
   End
  Else
   MessageDlg(CO_DEBE_ESTAR_ACTIVO, mtError, [mbOk], 0);
end;

procedure TWCrconsulta.ProrrogaxIncdePeriodo1Click(Sender: TObject);
var Prgaincre : TPrgaincre;
    nRow : Integer;
begin
 nRow := strgrdCapital.Row;
 If (strgrdCapital.Cells[CO_COL3, nRow] = CSIT_AC) Or
     (strgrdCapital.Cells[CO_COL3, nRow] = CSIT_PA) Then
   Begin
     Prgaincre := TPrgaincre.Create(Self);
     Try
      Prgaincre.GetParams(Objeto);
      Prgaincre.ID_CREDITO.AsInteger := Credito;
      Prgaincre.NUM_PERIODO.AsInteger := StrToInt(strgrdCapital.Cells[CO_CAP_NUM_PERIODO, nRow]);
      Prgaincre.F_VENCIMIENTO.AsDateTime := StrToDate(strgrdCapital.Cells[CO_CAP_F_VENCIMIENTO, nRow]);
      Prgaincre.IMP_CAPITAL.AsFloat := StrToFloat(TrimChar(strgrdCapital.Cells[CO_CAP_IMP_CAPITAL, nRow], #32','));
      Prgaincre.ParamCre := Objeto.ParamCre;
      Prgaincre.ShowWindow(ftGrid);
      btnRefrescarClick(Self);      
     Finally
      If Assigned(Prgaincre) Then Prgaincre.Free;
     End;
   End
  Else
   MessageDlg(CO_DEBE_ESTAR_ACTIVO, mtError, [mbOk], 0);
end;

procedure TWCrconsulta.ProrrogaxFechadeVencimiento2Click(Sender: TObject);
var Prgavenci : TPrgavenci;
    nRow : Integer;
begin
 nRow := strgrdInteres.Row;
 If (strgrdInteres.Cells[CO_COL3, nRow] = CSIT_AC) Or
     (strgrdInteres.Cells[CO_COL3, nRow] = CSIT_PA) Then
   Begin
     Prgavenci := TPrgavenci.Create(Self);
     Try
      Prgavenci.GetParams(Objeto);
      Prgavenci.ID_CREDITO.AsInteger := Credito;
      Prgavenci.NUM_PERIODO.AsInteger := StrToInt(strgrdInteres.Cells[CO_COL4, nRow]);
      Prgavenci.F_VENCIMIENTO.AsDateTime := StrToDate(strgrdInteres.Cells[CO_COL5, nRow]);
      Prgavenci.CVE_CONCEPTO.AsString := 'IN';
      Prgavenci.ParamCre := Objeto.ParamCre;
      Prgavenci.ShowWindow(ftGrid);
      btnRefrescarClick(Self);
     Finally
      If Assigned(Prgavenci) Then Prgavenci.Free;
     End;
   End
  Else
   MessageDlg(CO_DEBE_ESTAR_ACTIVO, mtError, [mbOk], 0);
end;

procedure TWCrconsulta.InvertCheck(StrinGrid : TStringGrid; nCol, nRow : Integer);

 function ActualizaBanderaFinanc(pID_CREDITO, pNUM_PERIODO : Integer; pstrB_FINAN_ADIC : String) : Boolean;
 var StpActFinanAdic : TStoredProc;
     vlSql       : String;
 begin

   Result := False;
   StpActFinanAdic := TStoredProc.Create(Nil);
   If Assigned(StpActFinanAdic) Then
   begin
     With StpActFinanAdic Do
      Try
       StoredProcName := 'PKGCRCREDITOO1.STP_ACT_FINAN_ADIC';
       DatabaseName := Objeto.Apli.DatabaseName;
       SessionName := Objeto.Apli.SessionName;
       Params.Clear;
       Params.CreateParam(ftInteger,'PEID_CREDITO',ptInput);
       Params.CreateParam(ftInteger,'PENUM_PERIODO',ptInput);
       Params.CreateParam(ftString,'PEB_FINAN_ADIC',ptInput);
       Params.CreateParam(ftString,'PEB_COMMIT',ptInput);
       Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
       Params.CreateParam(ftString,'PSTX_RESULTADO',ptOutput);

       ParamByName('PEID_CREDITO').AsInteger := pID_CREDITO;
       ParamByName('PENUM_PERIODO').AsInteger := pNUM_PERIODO;
       ParamByName('PEB_FINAN_ADIC').AsString := pstrB_FINAN_ADIC;
       ParamByName('PEB_COMMIT').AsString := CVERDAD;
       ExecProc;

       If ( ParamByName('PSRESULTADO').AsInteger <> 0) Then
        ShowMessage(ParamByName('PSTX_RESULTADO').AsString)
       Else
        Result := True;
      Finally
       Free;
      End;

      vlSql := ' UPDATE CR_INTERES ' +
               ' SET CVE_USU_MODIFICA  = '''  + Objeto.Apli.Usuario +''''+
               '        ,F_MODIFICA    = '  +  SQLFecha(Objeto.Apli.DameFechaEmpresa) +
               ' WHERE  ID_CREDITO = ' + IntToStr(pID_CREDITO) +
               '   AND  NUM_PERIODO = ' + IntToStr(pNUM_PERIODO);
   RunSQL(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);

     ActualizaINT_FND(pID_CREDITO, pNUM_PERIODO);
   end
   else
   Result := True;
 end;





var vlstrB_FINAN_ADIC : String;
    vlsql, vtempcve : String;
    vlQry : TQuery;
begin
 vlstrB_FINAN_ADIC := '';
 With (StrinGrid) Do
  If (Cells[nCol, nRow] <>  CO_NOTCHECK) Then
   Begin
     If (Cells[nCol, nRow] = CO_CHECKED) Then
        Begin
        Cells[nCol, nRow] := CO_UNCHECKED;
        vlstrB_FINAN_ADIC := cFALSO;

        ActualizaCveFinAdic(Objeto.ID_CREDITO.AsInteger,StrToInt(Cells[CO_INT_NUM_PERIODO, nRow]),'');
        Cells[CO_INT_CVE_FINANC, nRow] := '';

        Rtfinan.Enabled:=false;
        Rtfinan.ItemIndex:=-1;
        End
     Else
        Begin
        Cells[nCol, nRow] := CO_CHECKED;
        vlstrB_FINAN_ADIC := cVERDAD;

        vtempcve:=Co_Directo;

        vlsql:= ' SELECT P.CVE_FINANC_ADIC ' +
                ' FROM CR_CREDITO C, ' +
                '      CR_CONTRATO L, ' +
                '      CR_PRODUCTO P, ' +
                '      CONTRATO CTTO ' +
                ' WHERE CTTO.ID_EMPRESA =  ' + IntToStr(Objeto.Apli.IdEmpresa) +
                '       AND L.ID_CONTRATO   = C.ID_CONTRATO ' +
                '       AND L.FOL_CONTRATO  = C.FOL_CONTRATO ' +
                '       AND L.CVE_PRODUCTO_CRE  = P.CVE_PRODUCTO_CRE ' +
                '       AND CTTO.ID_CONTRATO    = L.ID_CONTRATO ' +
                '       AND P.B_FINANC_ADIC =  ''' + Co_Verdad + '''' +
                '       AND L.B_FINANC_ADIC =  ''' + Co_Verdad + '''' +
                '       AND C.B_FINANC_ADIC =  ''' + Co_Verdad + '''' +
                '       AND C.ID_CREDITO = '+ IntToStr(Objeto.ID_CREDITO.AsInteger);

        vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
        try
           if vlQry <> nil then
              if Trim(vlQry.FieldByName('CVE_FINANC_ADIC').AsString)<>'' then vtempcve:=vlQry.FieldByName('CVE_FINANC_ADIC').AsString;
        finally
           if vlQry <> nil then vlQry.free;
        end;

        ActualizaCveFinAdic(Objeto.ID_CREDITO.AsInteger,StrToInt(Cells[CO_INT_NUM_PERIODO, nRow]),vtempcve);
        Cells[CO_INT_CVE_FINANC, nRow] := vtempcve;

        Rtfinan.Enabled:=true;
        if (Cells[ CO_INT_CVE_FINANC, nRow ]=Co_Directo) then Rtfinan.ItemIndex:=0;
        if (Cells[ CO_INT_CVE_FINANC, nRow ]=Co_Prorrateo) then Rtfinan.ItemIndex:=1;


        End;

     If (StrinGrid = strgrdInteres) And (vlstrB_FINAN_ADIC <> '') Then
      ActualizaBanderaFinanc(Objeto.ID_CREDITO.AsInteger, StrToInt(Cells[CO_COL4,Row]), vlstrB_FINAN_ADIC);
   End;
end;

procedure TWCrconsulta.strgrdInteresMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var I, nCol, nRow, nMax_Periodo : Integer;
    str, vlsql, vlsql2, slNumPer : String;
    B_periodo_K : Integer;
    vlQry, vlQry2 : TQuery;
begin
 { Aplica Financiamiento }
 If tbshtFinanciamiento.TabVisible Then
  With strgrdInteres Do
  Begin
    MouseToCell(X, Y, nCol, nRow);
    //--- INICIO --- ASOR --- MAYO 2016 --- VALIDA EL NUMERO DE RENGLON ---
    if nRow <> VGI_RENGLON then
       nRow:= VGI_RENGLON;
    //--- FIN --- ASOR --- VALIDA EL NUMERO DE RENGLON ---
    If (nCol = CO_INT_B_FINANC) Then
     Begin
       nMax_Periodo := 0;
       For I := 0 To RowCount - 1 Do
        Begin
        str := Cells[CO_INT_NUM_PERIODO, I];
        If IsInteger(str) Then
          If (StrToInt(str) > nMax_Periodo) Then
            nMax_Periodo := StrToInt(str);
        End;

        vlsql:= ' SELECT COUNT(*) AS COUNT ' +
                ' FROM CR_CAPITAL ' +
                ' WHERE F_VENCIMIENTO = TO_DATE(''' + Cells[CO_INT_F_VENCIMIENTO, nRow] + ''', ''DD/MM/YYYY'') '+
                ' AND ID_CREDITO = '+ IntToStr(Objeto.ID_CREDITO.AsInteger);

        vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
        try
           if vlQry <> nil then
              B_periodo_K:=vlQry.FieldByName('COUNT').AsInteger;
        finally
           if vlQry <> nil then vlQry.free;
       end;


       If (nMax_Periodo = StrToInt(Cells[CO_INT_NUM_PERIODO, nRow])) Then
       begin
          Rtfinan.Enabled:=false;
          Rtfinan.ItemIndex:=-1;
          MessageDlg('El último periodo no se puede Financiar.', mtError, [mbOk], 0);
       end
//       Else If(Cells[CO_INT_SIT_INTERES, nRow] = CSIT_LQ) Then
       Else If (Cells[CO_INT_SIT_INTERES, nRow] = CSIT_LQ) or (Cells[CO_INT_SIT_INTERES, nRow] = CSIT_FA) Then
       begin
          Rtfinan.Enabled:=false;
          Rtfinan.ItemIndex:=-1;
          MessageDlg('No se puede modificar el Financiamiento de un periodo liquidado o refinanciado.', mtError, [mbOk], 0);
       end
       Else If(B_periodo_K > 0) Then
       begin
          Rtfinan.Enabled:=false;
          Rtfinan.ItemIndex:=-1;
          MessageDlg('No se puede modificar el Financiamiento de un periodo de Capital.'
                     + #13 + 'Periodo : ' + Cells[ CO_INT_NUM_PERIODO,nRow]
                     + ', Fecha vencimiento : ' + Cells[ CO_INT_F_VENCIMIENTO, nRow]
                     , mtError, [mbOk], 0);
       end
       Else
         begin
              // --- INICIO --- ASOR --- ABRIL 2016 --- VALIDACIÓN DE LA ACTIVACION DE UN PERIODO DE F.A. ---
              if ( strgrdInteres.Cells[CO_INT_B_FINANC, strgrdInteres.Row] = Co_Falso ) then
               begin
                   vlsql2 := 'SELECT F_FIN_PERGRA_FA FROM CR_CREDITO WHERE ID_CREDITO = ' + edID_CREDITO.Text;
                   vlQry2 := GetSQLQuery(vlsql2,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
                   if (vlQry2.FieldByName('F_FIN_PERGRA_FA').AsString <> '') then
                      if StrToDateTime(strgrdInteres.Cells[ CO_INT_F_VENCIMIENTO, strgrdInteres.Row]) >
                            vlQry2.FieldByName('F_FIN_PERGRA_FA').AsDateTime then
                        begin

                         MessageDlg('La fecha del vencimeinto del periodo seleccionado es mayor a  ' + #13 +
                                    '         la fecha de fin de periodo de gracia de F. A. ' + #13 +
                                    ' ' + #13 +
                                    'No se puede activar el financiamiento para este periodo'
                                    + #13 + 'Periodo : ' + Cells[ CO_INT_NUM_PERIODO,nRow]
                                    + ', Fecha vencimiento : ' + Cells[ CO_INT_F_VENCIMIENTO, nRow]
                                  , mtWarning, [mbOK], 0);
                         vlQry2:= NIL;
                         Exit;
                   end;
                 vlQry2:= NIL;
              end;
              // --- FIN --- ASOR ---

              If (MessageDlg(CO_MENSAJE_FIN
                             + #13 + 'Periodo : ' + strgrdInteres.Cells[ CO_INT_NUM_PERIODO, nRow]
                             + ', Fecha vencimiento : ' + strgrdInteres.Cells[ CO_INT_F_VENCIMIENTO, nRow]
                             , mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
              begin
                 InvertCheck(strgrdInteres, CO_INT_B_FINANC, nRow);
              end
              else
              begin
                 if (strgrdInteres.Cells[ CO_INT_B_FINANC, nRow ])=Co_Verdad then
                 begin
                    Rtfinan.Enabled:=true;
                    if (strgrdInteres.Cells[ CO_INT_CVE_FINANC, nRow ]=Co_Directo) then Rtfinan.ItemIndex:=0;
                    if (strgrdInteres.Cells[ CO_INT_CVE_FINANC, nRow ]=Co_Prorrateo) then Rtfinan.ItemIndex:=1;
                 end;

                 if (strgrdInteres.Cells[ CO_INT_B_FINANC, nRow ])=Co_Falso then
                 begin
                    Rtfinan.Enabled:=false;
                    Rtfinan.ItemIndex:=-1;
                 end;
         end;
     end;
    End;
  End;

end;

procedure TWCrconsulta.strgrdInteresSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);

  procedure AsignaSeleccion( Sender, Grid : TStringGrid );
  begin
    if Sender <> Grid then
     Grid.Row := ARow;
  end;

var
  Rect : TGridRect;
begin
 If Sender Is TStringGrid  Then
  Begin
    If Not Assigned(vgGrid) Then
     vgGrid := (Sender As TStringGrid);

    If (vgGrid = Sender) Then
     Begin
     AsignaSeleccion( Sender As TStringGrid, strgrdInteres );
     AsignaSeleccion( Sender As TStringGrid, strgrdMorasInt );
     AsignaSeleccion( Sender As TStringGrid, strgrdCapital2 );
     vgGrid := Nil;
     End;
 End;
 VGI_RENGLON := ARow;
end;

procedure TWCrconsulta.strgrdInteresTopLeftChanged(Sender: TObject);

  procedure AsignaTopRow( Sender, Grid : TStringGrid );
  begin
    if Sender <> Grid then
      Grid.TopRow := Sender.TopRow
  end;

begin
 If Sender Is TStringGrid Then
   Try
    AsignaTopRow( Sender As TStringGrid, strgrdInteres );
    AsignaTopRow( Sender As TStringGrid, strgrdCapital2 );
   Finally
   End;

end;

procedure TWCrconsulta.strgrdInteresClick(Sender: TObject);
begin
   if (strgrdInteres.Cells[CO_INT_B_FINANC, strgrdInteres.row] = Co_Verdad) then
   begin
//RABA JUN 2015 TAMPOCO SE PUEDE MODIFICAR UN PERIODO EN SITUACIÓN DE REFINANCIADO
//      If(strgrdInteres.Cells[CO_INT_SIT_INTERES, strgrdInteres.row] <> CSIT_LQ) Then
      If(strgrdInteres.Cells[CO_INT_SIT_INTERES, strgrdInteres.row] <> CSIT_LQ)
         OR
        (strgrdInteres.Cells[CO_INT_SIT_INTERES, strgrdInteres.row] <> CSIT_FA) Then
      begin
         Rtfinan.Enabled:=true;
         if (strgrdInteres.Cells[CO_INT_CVE_FINANC, strgrdInteres.row]=Co_Directo) then Rtfinan.ItemIndex:=0;
         if (strgrdInteres.Cells[CO_INT_CVE_FINANC, strgrdInteres.row]=Co_Prorrateo) then Rtfinan.ItemIndex:=1;
      end;
//      If(strgrdInteres.Cells[CO_INT_SIT_INTERES, strgrdInteres.row] = CSIT_LQ) Then  //RABA JUN 2015
      If(strgrdInteres.Cells[CO_INT_SIT_INTERES, strgrdInteres.row] = CSIT_LQ)
         OR
        (strgrdInteres.Cells[CO_INT_SIT_INTERES, strgrdInteres.row] = CSIT_FA) Then
      begin
         Rtfinan.Enabled:=false;
         Rtfinan.ItemIndex:=-1;
      end;
   end;
   if (strgrdInteres.Cells[CO_INT_B_FINANC, strgrdInteres.row] = Co_Falso) then
   begin
      Rtfinan.Enabled:=false;
      Rtfinan.ItemIndex:=-1;
   end;
end;

procedure TWCrconsulta.RtfinanClick(Sender: TObject);
var I:integer;
begin
   if Rtfinan.ItemIndex=0 then
   begin
      if (cbAllFA.Checked) then
      begin
         If (MessageDlg(CO_MENSAJE_CVEFIN
                        , mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
         begin
            For I := 0 To strgrdInteres.RowCount - 1 Do
            Begin
               if (strgrdInteres.Cells[CO_INT_B_FINANC, I] = Co_Verdad) then
               begin
                  If(strgrdInteres.Cells[CO_INT_SIT_INTERES, I] <> CSIT_LQ) Then
                  begin
                    if (strgrdInteres.Cells[CO_INT_SIT_INTERES, I] <> CSIT_FA) Then // -- ASOR -- VALIDA PERIODOS YA CAPITALIZADOS
                      begin
                        ActualizaCveFinAdic(StrToInt(edID_CREDITO.Text),StrToInt(strgrdInteres.Cells[CO_INT_NUM_PERIODO, I]),Co_Directo);
                        strgrdInteres.Cells[CO_INT_CVE_FINANC, I] := Co_Directo;
                    end;
                  end;
               end;
            End;
            Rtfinan.Enabled:=false;
            Rtfinan.ItemIndex:=-1;
         end
         else
         begin
            Rtfinan.Enabled:=false;
            Rtfinan.ItemIndex:=-1;
         end;
         cbAllFA.Checked:=false;
      end;

      if not(cbAllFA.Checked) then
      begin
         if strgrdInteres.Cells[CO_INT_CVE_FINANC, strgrdInteres.row] = Co_Prorrateo then
         begin
            If (strgrdInteres.Cells[CO_INT_SIT_INTERES, strgrdInteres.row] = CSIT_LQ) Then
            begin
               MessageDlg('No se puede modificar el Financiamiento de un periodo liquidado.', mtError, [mbOk], 0);
               Rtfinan.ItemIndex:=1;
            end
            else
            begin
              if (strgrdInteres.Cells[CO_INT_SIT_INTERES, strgrdInteres.row] = CSIT_FA) Then // -- ASOR -- VALIDA PERIODOS YA CAPITALIZADOS
                 begin
                       MessageDlg('No se puede modificar el Financiamiento de un periodo ya financiado.', mtError, [mbOk], 0);
                       Rtfinan.ItemIndex:=1;
                 end
              else
                 begin
                       If (MessageDlg(CO_MENSAJE_CVEFIN
                                      + #13 + 'Periodo : ' + strgrdInteres.Cells[CO_INT_NUM_PERIODO, strgrdInteres.Row] +
                                      ', Vencimiento : ' + strgrdInteres.Cells[CO_INT_F_VENCIMIENTO, strgrdInteres.Row]
                                      , mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
                           begin
                          ActualizaCveFinAdic(StrToInt(edID_CREDITO.Text),StrToInt(strgrdInteres.Cells[CO_INT_NUM_PERIODO, strgrdInteres.row]),Co_Directo);
                          strgrdInteres.Cells[CO_INT_CVE_FINANC, strgrdInteres.row] := Co_Directo;
                       end
                       else Rtfinan.ItemIndex:=1;
              end;
            end;
         end;
      end;
   end;

   if Rtfinan.ItemIndex=1 then
   begin
      if (cbAllFA.Checked) then
      begin
         If (MessageDlg(CO_MENSAJE_CVEFIN
                        , mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
         begin
            For I := 0 To strgrdInteres.RowCount - 1 Do
            Begin
               if (strgrdInteres.Cells[CO_INT_B_FINANC, I] = Co_Verdad) then
               begin
                  If(strgrdInteres.Cells[CO_INT_SIT_INTERES, I] <> CSIT_LQ) Then
                  begin
                    if (strgrdInteres.Cells[CO_INT_SIT_INTERES, I] <> CSIT_FA) Then // -- ASOR -- VALIDA PERIODOS YA CAPITALIZADOS
                      begin
                           ActualizaCveFinAdic(StrToInt(edID_CREDITO.Text),StrToInt(strgrdInteres.Cells[CO_INT_NUM_PERIODO, I]),Co_Prorrateo);
                           strgrdInteres.Cells[CO_INT_CVE_FINANC, I] := Co_Prorrateo;
                    end;
                  end;
               end;
            End;
            Rtfinan.Enabled:=false;
            Rtfinan.ItemIndex:=-1;
         end
         else
         begin
            Rtfinan.Enabled:=false;
            Rtfinan.ItemIndex:=-1;
         end;
         cbAllFA.Checked:=false;
      end;

      if not(cbAllFA.Checked) then
      begin
         if strgrdInteres.Cells[CO_INT_CVE_FINANC, strgrdInteres.row] = Co_Directo then
         begin
            If (strgrdInteres.Cells[CO_INT_SIT_INTERES, strgrdInteres.row] = CSIT_LQ) Then
            begin
               MessageDlg('No se puede modificar el Financiamiento de un periodo liquidado.', mtError, [mbOk], 0);
               Rtfinan.ItemIndex:=0;
            end
            else
            begin
              if (strgrdInteres.Cells[CO_INT_SIT_INTERES, strgrdInteres.row] = CSIT_FA) Then // -- ASOR -- VALIDA PERIODOS YA CAPITALIZADOS
                 begin
                       MessageDlg('No se puede modificar el Financiamiento de un periodo ya financiado.', mtError, [mbOk], 0);
                       Rtfinan.ItemIndex:=0;
                 end
              else
                 begin
                     If (MessageDlg(CO_MENSAJE_CVEFIN
                                    + #13 + 'Periodo : ' + strgrdInteres.Cells[CO_INT_NUM_PERIODO, strgrdInteres.Row] +
                                    ', Vencimiento : ' + strgrdInteres.Cells[CO_INT_F_VENCIMIENTO, strgrdInteres.Row]
                                    , mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
                     begin
                        ActualizaCveFinAdic(StrToInt(edID_CREDITO.Text),StrToInt(strgrdInteres.Cells[CO_INT_NUM_PERIODO, strgrdInteres.row]),Co_Prorrateo);
                        strgrdInteres.Cells[CO_INT_CVE_FINANC, strgrdInteres.row] := Co_Prorrateo;
                     end
                     else Rtfinan.ItemIndex:=0;
              end;
            end;
         end;
      end;
   end;
end;

procedure TWCrconsulta.cbAllFAClick(Sender: TObject);
begin
   if cbAllFA.Checked then
   begin
      Rtfinan.ItemIndex:=-1;
      Rtfinan.Enabled:=true;
   end;
end;

procedure TWCrconsulta.sbArchivoEntradaClick(Sender: TObject);
var
  correcto: boolean;
begin
  correcto := False;
  while not correcto and odArchivoEntrada.Execute do
  begin
    edArchivoEntrada.Text := odArchivoEntrada.FileName;
    if FileExists(odArchivoEntrada.FileName) then
      correcto := True
    else
    begin
      edArchivoEntrada.Text := '';
      ShowMessage('Reporte inexistente. Por favor seleccione un reporte existente');
    end;
  end;
end;

procedure TWCrconsulta.bbImportarClick(Sender: TObject);
var
  LCID: integer;
  fila: integer;
  vlAccesorio : string;

  //Variables del reporte
  vlNUM_PERIODO   : String;
  vlF_VENCIMIENTO : String;
  vlF_PROGRAMADA  : String;

  valida: String;

  //Para la inserción a la base de datos
  vlSQL: string;
  vlQry : TQuery;

  //Para la barra de progreso
  ani: TAniBarThread;
  r: TRect;

  vlMesg:string;
begin
   if Objeto.ValidaAccesoEsp('TCRCONSULT_IMPOR',True,True) then
   begin
      if Trim(edArchivoEntrada.Text) = '' then Exit;

      if Rconcepto.ItemIndex=0 then
      begin
         vlAccesorio :='CP';
         vlMesg:='Este proceso actualizara las Fechas Programadas de Capital. ¿Desea continuar?';
      end;   
      if Rconcepto.ItemIndex=1 then
      begin
         vlAccesorio :='IN';
         vlMesg:='Este proceso actualizara las Fechas Programadas de Interes. ¿Desea continuar?';
      end;

      if MessageDlg(vlMesg, mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin

      {* Inicia las variables para actualizar el medidor *}

      r := pAniBar.ClientRect;
      InflateRect(r, -pAniBar.BevelWidth, -pAniBar.BevelWidth);
      ani := TAniBarThread.Create(pAniBar, r, pAniBar.color, clBlue, 100);
      bbImportar.Enabled := False;
      Application.ProcessMessages;

      LCID := GetUserDefaultLCID;
      //Si el campo con el nombre del reporte está vacio lee la información de
      //de la base de datos y utiliza el reporte
      if edArchivoEntrada.Text <> '' then
      begin
        {* Instrucciones para el archivo excel de entrada
         *}
        ExcelApplicationI.Connect;
        // Hace a Excel invisible
        ExcelApplicationI.Visible[LCID] := False;
        ExcelApplicationI.DisplayAlerts[LCID] := False;

        // Abre el archivo
        ExcelApplicationI.Workbooks.Open(edArchivoEntrada.Text,
          EmptyParam, //UpdateLinks: OleVariant
          EmptyParam, //ReadOnly: OleVariant
          EmptyParam, //Format: OleVariant
          EmptyParam, //Password: OleVariant
          EmptyParam, //WriteResPassword: OleVariant
          EmptyParam, //IgnoreReadOnlyRecommended: OleVariant
          EmptyParam, //Orign: OleVariant
          EmptyParam, //Delimiter: OleVariant
          EmptyParam, //Editable: OleVariant
          EmptyParam, //Notify: OleVariant
          EmptyParam, //Converter: OleVariant
          EmptyParam, //AddToMru: OleVariant
          LCID
          );
        ExcelWorkbookI.ConnectTo(ExcelApplicationI.ActiveWorkbook);
        ExcelWorksheetI.ConnectTo(ExcelApplicationI.ActiveSheet as _Worksheet);
      end;

      {* Extrae la información del archivo Excel *}
      fila := 2;
      try
        try
          //Para cada renglón con información

          valida := ExcelWorksheetI.Cells.Item[fila, 'A']; //PERIODO
          while (valida <> '') do
          begin
            // Extrae la información
            vlNUM_PERIODO    := ExcelWorksheetI.Cells.Item[fila, 'A'];
            vlF_VENCIMIENTO  := ExcelWorksheetI.Cells.Item[fila, 'B'];
            //vlIMP_CUOTA      := ExcelWorksheetI.Cells.Item[fila, 'C'];
            vlF_PROGRAMADA   := ExcelWorksheetI.Cells.Item[fila, 'D'];

            ModFProgCuota(StrToInt(vlNUM_PERIODO), vlAccesorio, StrToInt(vlF_PROGRAMADA), 0);

            inc(fila);
            valida := ExcelWorksheetI.Cells.Item[fila, 'A']; //PERIODO
          end;

        finally
          //detiene la barra de progreso
          bbImportar.Enabled := True;
          ani.Terminate;

          ExcelApplicationI.Visible[LCID] := True;
          ExcelWorksheetI.Disconnect;
          ExcelWorkbookI.Disconnect;
          ExcelApplicationI.Disconnect;
        end;

        //Si no existe error notifica al usuario que se generó el reporte
        ShowMessage('Informacion leida con Exito');
        edArchivoEntrada.Text:='';
        btnRefrescarClick(Self);

      except
        on e: Exception do
        begin
          MessageDlg('No se importó completo el archivo.' +
            IntToStr(Fila) + e.Message, mtError, [mbOK], 0);
        end;
      end;
      end;
   end;
end;

procedure TWCrconsulta.bbCamFhProgClick(Sender: TObject);
var vlAccesorio : string;
    vlMesg:string;
begin                          
   if Objeto.ValidaAccesoEsp('TCRCONSULT_FHPRO',True,True) then
   begin

      if Rconcepto.ItemIndex=0 then
      begin
         vlAccesorio :='CP';
         vlMesg:='Este proceso actualizara las Fechas Programadas de Capital. ¿Desea continuar?';
      end;   
      if Rconcepto.ItemIndex=1 then
      begin
         vlAccesorio :='IN';
         vlMesg:='Este proceso actualizara las Fechas Programadas de Interes. ¿Desea continuar?';
      end;
                              
      if MessageDlg(vlMesg, mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
          ModFProgCuota(0, vlAccesorio, 0, 1);
          btnRefrescarClick(Self);
      end;
   end;
end;

end.
