// Sistema         : Clase de CR_CAPITAL
// Fecha de Inicio : 25/07/2003
// Función forma   : Clase de CR_CAPITAL
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrArchNaf;

interface

uses
  Windows,     Messages,   SysUtils,   Classes,   Graphics,   Controls,
  Forms,       Dialogs,    IntFrm,     DB,        DbTables,   Mask,
  StdCtrls,    Buttons,    ExtCtrls,   InterFor,  IntFind,    UnSQL2,
  InterFun,    ComCtrls,   IntDtPk,    IntGenCre, IntLinkit,  InterEdit,
  IntParamCre, ImgList,    Grids,      Gauges,

IntCrCto,     // Catálogo de Contratos
IntCrEmisor,  // Catálogo de Emsiores
IntCrProveed, // Catálogo de Proveedores
IntCrCarNaf,  // Clase del Header de la Carga de Archivo NAFIN
IntCrFrmtNaf, // Formato de archivo NAFIN
IntCrEmiPro,  // Relación Emisor Proveedor
IntMInstDesc, // Catalogo de Entidad Descontadora       //easa4011 16.05.2008 bancomext descuento
IntCrReAcBu   // <SATV4766 16Jun2008> Buscador de Contrato
;


const C_SEPARATOR = ',';
      C_HEADER  = 'H';
      C_DETALLE = 'D';
      C_TOTAL   = 'T';
      C_LINEA   = 'Autorización';
      C_WIDTH_FECHA  = 64;
      C_WIDTH_DINERO = 74;
      C_WIDTH_TASA = 92;
      C_COLAPLICA = 0;
      C_COLACUSE = 1;
      C_COLLINEA = 3;
      C_COLNOMEPO = 3;
      C_COLEPO   = 2;
      C_COLSIRAC = 6;
      C_COLMENSAJE = 1;
      C_ERROR_INSERT = 3;
      C_ERROR_INSERT_CARGA = 4;
      C_ERROR_CARGA_ACUSE_YA_APLICADOS = 7;
      C_APLICA = '1';
      C_NOAPLICA = '0';

      C_COLGRID_CARGAR     = 0;
      C_COLGRID_EPO        = 2;
      C_COLGRIDDESC_MONEDA = 3;
      C_COLGRIDTOTALDOCS   = 4;
      C_COLGRID_LINEA      = 5;
      C_COLGRID_TITULAR    = 6;
      C_COLGRID_ACREDITADO = 7;
      C_COLGRIDMONEDA      = 8;
      C_COLGRIDFOLCTTO     = 9;
      C_COLGRIDFCARGA      = 10;
      C_COLGRIDCVEEMISOREXT = 11; // <SATV4766 16Jun2008>

      C_COLPYMESIRAC       = 2;


      C_NOMBRE_CAM_BD      = 0;
      C_NOMBRE_CAM_ARC     = 1;
      C_VALOR_OMISON       = 2;
      C_SIT_CONF_ARCNAF    = 3;
      C_B_OBLIGATORIO      = 4;
      C_DATA_TYPE          = 5;
      C_DATA_LENGTH        = 6;
      C_CADENA             = 'CADENA';
      C_CRPYME             = 'CRPYME';
      C_MSG_FMT            = '¡¡¡Debe seleccionar un formato de archivo!!!';
      C_FMT_UNK            = '¡¡¡El formato de archivo no está soportado!!!';
      C_TOT_CTE            = 'Total de Clientes';


Type
  TCrArchNaf= class;

  TWCrArchNaf=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ImgList: TImageList;
    OpenDialog: TOpenDialog;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    gbxArchivo: TGroupBox;
    Label5: TLabel;
    lblLoad: TLabel;
    lblRegisters: TLabel;
    lblCount: TLabel;
    edFileName: TEdit;
    btnFileName: TBitBtn;
    ProgressBar: TProgressBar;
    btnLoadFile: TBitBtn;
    gbxLoadAcuse: TGroupBox;
    opLoadFile: TRadioButton;
    opLoadAcuse: TRadioButton;
    TabSheet2: TTabSheet;
    lblStep2: TLabel;
    lblAcusesER: TLabel;
    lblAcusesAC: TLabel;
    lblAcusesAP: TLabel;
    Bevel1: TBevel;
    lblTotalAcuses: TLabel;
    lblAcusesEncontrados: TLabel;
    Bevel2: TBevel;
    lblOpcion: TLabel;
    strGrdDataErrors: TStringGrid;
    strGrdDataErrors1: TStringGrid;
    edAcusesAC: TEdit;
    edAcusesER: TEdit;
    edAcusesAP: TEdit;
    edLoadedFileName: TEdit;
    edTotalAcuses: TEdit;
    btnEmisor: TButton;
    btnProveedor: TButton;
    memAcuses: TMemo;
    tbshAplicar: TTabSheet;
    Label1: TLabel;
    StringGrid: TStringGrid;
    StringGrid1: TStringGrid;
    Button2: TButton;
    btnId_Contrato: TBitBtn;
    MemoMessages: TMemo;
    gbxLoadAcuseByDate: TGroupBox;
    Label3: TLabel;
    dtpFrom: TDateTimePicker;
    cbxFilter: TComboBox;
    dtpTo: TDateTimePicker;
    btnLoadAcuses: TBitBtn;
    opLoadAcuseByDate: TRadioButton;
    edId_Acuse: TEdit;
    btnID_ACUSE: TBitBtn;
    lblAcuse: TLabel;
    Label2: TLabel;
    edNom_Archivo: TEdit;
    btnLoadAcuse: TBitBtn;
    Label4: TLabel;
    Bevel3: TBevel;
    btnRelacionEmiProv: TButton;
    Label6: TLabel;
    lbFiltro: TLabel;
    edCVE_FORMATO_NAF: TEdit;
    btnCVE_FORMATO_NAF: TBitBtn;
    edDESC_C_FORMATO: TEdit;
    ikCVE_FORMATO_NAF: TInterLinkit;
    cbTokenTexto: TComboBox;
    lbTokenTexto: TLabel;
    chB_OPERA_DIA_SIG: TCheckBox;
    Label7: TLabel;
    Merrores: TMemo;
    edCVE_ENT_DESC: TEdit;
    Label8: TLabel;
    btCVE_ENT_DESC: TBitBtn;
    edDESC_ENT_DESC: TEdit;
    ikCVE_ENT_DESC: TInterLinkit;
    procedure StringGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure StringGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFileNameClick(Sender: TObject);
    procedure edFileNameChange(Sender: TObject);
    procedure btnLoadFileClick(Sender: TObject);
    procedure strGrdDataErrorsSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure strGrdDataErrorsDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure StringGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure btnId_ContratoClick(Sender: TObject);
    procedure tbshAplicarShow(Sender: TObject);
    procedure PageControlChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure strGrdDataErrors1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure StringGridKeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure btnEmisorClick(Sender: TObject);
    procedure btnProveedorClick(Sender: TObject);
    procedure opLoadAcuseClick(Sender: TObject);
    procedure strGrdDataErrorsTopLeftChanged(Sender: TObject);
    procedure StringGrid1TopLeftChanged(Sender: TObject);
    procedure btnLoadAcusesClick(Sender: TObject);
    procedure cbxFilterChange(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnID_ACUSEClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLoadAcuseClick(Sender: TObject);
    procedure btnRelacionEmiProvClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ikCVE_FORMATO_NAFEjecuta(Sender: TObject);
    procedure btnCVE_FORMATO_NAFClick(Sender: TObject);
    procedure btnCVE_FORMATO_NAFExit(Sender: TObject);
    procedure ikCVE_ENT_DESCEjecuta(Sender: TObject);
    procedure btCVE_ENT_DESCExit(Sender: TObject);
    procedure btCVE_ENT_DESCClick(Sender: TObject);
  private
    function  LoadFilePYME( strFileName: String; sTokenTexto: Char; var nIdCargaPYME : Integer) : Integer;
    procedure LoadPYMEErrors(strAcuses : String = ''; nId_Carga_Nafin : Integer = 0);
    function  LoadPYMEDataErr(strAcuses : String; var nDocsAC, nDocsER, nDocsAP : Integer) : Integer;
    function  LoadPYMEAcuses(strAcuses : String) : Integer;
    procedure RevalidatePYME;
  private
    { Private declarations }
     m_nCount,
     m_nMaxCount,
     m_nId_Carga_NAFIN : Integer;

     m_bLoaded : Boolean;

     procedure InvertCheck(StrGrd : TStringGrid; nCol, nRow : Integer);
     procedure ShowProgress;
     procedure Set_Count(nValue : Integer);
     procedure Set_MaxCount(nValue : Integer);
     procedure RevalidateDocuments;
     procedure LoadErrors(strAcuses : String = ''; nId_Carga_Nafin : Integer = 0);
     procedure EnableControls(GroupBox : TGroupBox; bEnabled : Boolean);

     function  GiveAcuses(nId_Carga_Nafin : Integer; var strAcuses : String) : Integer;
     //
     procedure CreateRelationalKey(var A : TArrayString);
     function  CanLoadColumnFile(aRelationalKey : TArrayString; strFieldName : String;
                                 var strB_OBLIGATORIO : String) : Boolean;
     function  FindRelationalField(aRelationalKey : TArrayString; strFieldName : String;
                 var strFileFieldName : String; var nMaxLength : Integer; var strValue : String) : Boolean;
     function  FindColumnFile(aCaptionsFile : TArrayString; strFileFieldName : String; var nFileCol : Integer) : Boolean;
     procedure AddAcuse(StrLstAcuses : TStringList; strId_Acuse : String);
     function  GetFileNameAcuses(strAcuses : String; var nCount : Integer) : String;
     //
     function  LoadFileNafin(strFileName: String; var nId_Carga_Nafin : Integer) : Integer;
     function  LoadDataErrors(strAcuses : String; var nDocsAC, nDocsER, nDocsAP : Integer) : Integer;
     function  LoadAcuses(strAcuses : String) : Integer;
     procedure LoadAcusesByOptionDate;
     procedure Enable_Dtp_BySign(strSign: String; DtpFrom, DtpTo: TDateTimePicker);

     procedure Set_Acuses(strValue : String);
     function  Get_Acuses : String;

     function  GetProveedorByCveNAFIN(nID_PROV_NAFINSA : Integer) : Integer;
     function  GetEmisorByCveNAFIN(strCVE_EMISOR_NAFIN : String) : Integer;
     function  GetPromotorByEmiProv(nID_EMISOR, nID_PROVEEDOR : Integer) : Integer;
     //
     procedure EnableDisableButtons;
  public
    { Public declarations }
     Objeto : TCrArchNaf;
     property Count    : Integer Read m_nCount Write Set_Count;
     property MaxCount : Integer Read m_nMaxCount Write Set_MaxCount;
     property Acuses   : String Read Get_Acuses Write Set_Acuses;
  end;

  TCrArchNaf= class(TInterFrame)
  private
    fInputFormat  : String;
  private
    F_CARGA_PYME_INI : TInterCampo;
    F_CARGA_PYME_FIN : TInterCampo;
  protected
  private
  public
    { Public declarations }
    ParamCre      : TParamCre;
    Contrato      : TCrCto;
    CargaNafin    : TCrCarNaf;
    CrFrmtoNaf    : TCrFrmtNaf;
    MInstDesc     : TMInstDesc; //easa4011 16.05.2008 bancomext descuento

    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
    function    FiltroFmt:Boolean;
    procedure   CreateStpAcusePYME(var Stp : TStoredProc);
    procedure   ClearStpAcusePYME (var Stp : TStoredProc);
    {ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
    procedure   AsignaEntidadDescontadora(var Stp: TStoredProc; StrParamByName : String);
    Function    ObtenEntidadDescontadoraNAFIN: String;
    {/ROIM}
    procedure   GeneraDispPYME(peFCarga       : TDate;   peId_acuse     : String;
                               peId_Contrato  : Integer; peFol_Contrato : Integer;
                               peCve_Usu_Alta : String;  peB_Aplica_Com : String;
                               peBCommit      : String;  var psResultado: Integer;
                               var psTxResultado  : String );
    function    ObtenDisposiciones(sFCarga : TDateTime; strAcuses : String) : String;
  published
    property    InputFormat  : String   read  fInputFormat  write fInputFormat;
  end;



implementation

{$R *.DFM}

constructor TCrArchNaf.Create( AOwner : TComponent );
begin Inherited;
      //
      F_CARGA_PYME_INI := CreaCampo( 'F_CARGA_PYME_INI',   ftDate,  tsNinguno, tsNinguno, False );
      F_CARGA_PYME_FIN := CreaCampo( 'F_CARGA_PYME_FIN',   ftDate,  tsNinguno, tsNinguno, False );
      //

      Contrato := TCrCto.Create(Self);
      Contrato.MasterSource := Self;
      Contrato.ID_CONTRATO.MasterField := 'ID_CONTRATO';

      CargaNafin := TCrCarNaf.Create(Self);
      CargaNafin.MasterSource := Self;
      CargaNafin.ID_ACUSE.MasterField := 'ID_ACUSE';

      CrFrmtoNaf := TCrFrmtNaf.Create(Self);
      CrFrmtoNaf.MasterSource := Self;
      CrFrmtoNaf.CVE_FORMATO_NAF.MasterField := 'CVE_FORMATO_NAF';

      //easa4011 16.05.2008 bancomext descuento
      MInstDesc := TMInstDesc.Create(Self);
      MInstDesc.MasterSource:=Self;
     //end_easa4011

      UseQuery := True;
      HelpFile := 'IntCrArchNaf.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrArchNaf.Destroy;
begin
  if Contrato <> nil then
    Contrato.Free;
  //
  if CargaNafin <> nil then
    CargaNafin.Free;
  //
  if CrFrmtoNaf <> nil then
    CrFrmtoNaf.Free;
  //easa4011 16.05.2008 bancomext descuento
  if MInstDesc <> nil then
     MInstDesc.Free;
  //end_easa

  inherited;
end;

function TCrArchNaf.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrArchNaf;
begin
   W := TWCrArchNaf.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrArchNaf.InternalBusca:Boolean;
//Var T:TInterFindit;
begin InternalBusca := False;
  {    T := CreaBuscador('ICrArchNaf.it','F,F');
      Try if Active then begin T.Param(0,ID_CREDITO.AsString);
                               T.Param(1,NUM_PERIODO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; }
end;

function TCrArchNaf.Reporte:Boolean;
begin Result := False;
end;

function TCrArchNaf.FiltroFmt: Boolean;
begin
  result := ( CrFrmtoNaf.Active) and ( CrFrmtoNaf.CVE_FORMATO_NAF.AsString <> '' );
end;

// Crea el Store
procedure TCrArchNaf.CreateStpAcusePYME(var Stp : TStoredProc);
begin
  Stp := TStoredProc.Create(Self);
  Stp.DatabaseName := Apli.DatabaseName;
  Stp.SessionName  := Apli.SessionName;
  Stp.StoredProcName := 'PKGCRPERIODO.STPCARGAACUSEPYME';
  With Stp Do
  Begin
    Params.CreateParam(ftString,    'PECVE_FND_ENT_DES',   ptInput  );
    Params.CreateParam(ftDateTime,  'PEF_CARGA',           ptInput  );
    Params.CreateParam(ftString,    'PEID_DOCUMENTO',      ptInput  );
    Params.CreateParam(ftString,    'PEID_ACUSE',          ptInput  );
    Params.CreateParam(ftFloat,     'PEID_SIRAC',          ptInput  );
    Params.CreateParam(ftFloat,     'PEID_SUCURSAL',       ptInput  );
    Params.CreateParam(ftFloat,     'PEID_FOLIO',          ptInput  );
    Params.CreateParam(ftFloat,     'PEID_PRESTAMO',       ptInput  );
    Params.CreateParam(ftString,    'PECVE_MONEDA',        ptInput  );
    Params.CreateParam(ftString,    'PEDESC_MONEDA',       ptInput  );
    Params.CreateParam(ftFloat,     'PEIMP_DOCUMENTO',     ptInput  );
    Params.CreateParam(ftFloat,     'PEIMP_DESCUENTO',     ptInput  );
    Params.CreateParam(ftFloat,     'PEID_EMISOR',         ptInput  );
    Params.CreateParam(ftString,    'PECVE_TIPO_CREDITO',  ptInput  );
    Params.CreateParam(ftString,    'PEDESC_TIP_CREDITO',  ptInput  );
    Params.CreateParam(ftString,    'PEDESC_TIEMPO_CP',    ptInput  );
    Params.CreateParam(ftString,    'PEDESC_TIEMPO_IN',    ptInput  );
    Params.CreateParam(ftFloat,     'PEUNIDAD_TIEMPO_CP',  ptInput  );
    Params.CreateParam(ftFloat,     'PEUNIDAD_TIEMPO_IN',  ptInput  );
    Params.CreateParam(ftString,    'PETX_BIEN_SERVICIO',  ptInput  );
    Params.CreateParam(ftString,    'PECVE_TIPO_DOCTO',    ptInput  );
    Params.CreateParam(ftString,    'PETX_DOMICILIO_PAG',  ptInput  );
    Params.CreateParam(ftString,    'PECVE_TASA_REFER',    ptInput  );
    Params.CreateParam(ftString,    'PEOPERADOR_STASA',    ptInput  );
    Params.CreateParam(ftFloat,     'PESOBRETASA',         ptInput  );
    Params.CreateParam(ftString,    'PECVE_TASA_REF_PAS',  ptInput  );
    Params.CreateParam(ftFloat,     'PENUM_AMORTIZACION',  ptInput  );
    Params.CreateParam(ftString,    'PECVE_AMORTIZACION',  ptInput  );
    Params.CreateParam(ftDateTime,  'PEF_INI_PAG_CAP',     ptInput  );
    Params.CreateParam(ftDateTime,  'PEF_INI_PAG_INT',     ptInput  );
    Params.CreateParam(ftFloat,     'PEDIA_PAGO',          ptInput  );
    Params.CreateParam(ftDateTime,  'PEF_VENCTO_DOCTO',    ptInput  );
    Params.CreateParam(ftDateTime,  'PEF_VENCIMIENTO',     ptInput  );
    Params.CreateParam(ftDateTime,  'PEF_EMISION',         ptInput  );
    Params.CreateParam(ftDateTime,  'PEF_OPERACION',       ptInput  );
    Params.CreateParam(ftString,    'PETX_LUGAR_FIRMA',    ptInput  );
    Params.CreateParam(ftString,    'PEB_AMORT_AJUSTE',    ptInput  );
    Params.CreateParam(ftString,    'PEB_RENTA',           ptInput  );
    Params.CreateParam(ftFloat,     'PEIMP_AMORT_AJUSTE',  ptInput  );
    Params.CreateParam(ftFloat,     'PENUM_AMORTIZA',      ptInput  );
    Params.CreateParam(ftFloat,     'PEIMP_AMORTIZA',      ptInput  );
    Params.CreateParam(ftDateTime,  'PEF_AMORTIZA',        ptInput  );
    Params.CreateParam(ftString,    'PECVE_TIP_AMORTIZA',  ptInput  );
    Params.CreateParam(ftString,    'PETX_CAUSA_RECHAZO',  ptInput  );
    Params.CreateParam(ftString,    'PESIT_ARCHIVO',       ptInput  );
    Params.CreateParam(ftString,    'PENOM_ARCHIVO',       ptInput  );
    Params.CreateParam(ftString,    'PECVE_USU_ALTA',      ptInput  );
    Params.CreateParam(ftString,    'PEB_COMMIT',          ptInput  );
    Params.CreateParam(ftFloat,     'PSIDCARGANAFIN',      ptOutput );
    Params.CreateParam(ftFloat,     'PSRESULTADO',         ptOutput );
    Params.CreateParam(ftString,    'PSTXRESULTADO',       ptOutput );
  End;
end;


procedure TCrArchNaf.ClearStpAcusePYME(var Stp: TStoredProc);
begin
  if not Assigned( Stp ) then
    exit;
  //ends_if
  With Stp Do
  Begin
//    Params.ParamByName( 'PECVE_FND_ENT_DES'  ).Clear;  Este parametro no se debe de limpiar
    Params.ParamByName( 'PEF_CARGA'          ).Clear;
    Params.ParamByName( 'PEID_DOCUMENTO'     ).Clear;
    Params.ParamByName( 'PEID_ACUSE'         ).Clear;
    Params.ParamByName( 'PEID_SIRAC'         ).Clear;
    Params.ParamByName( 'PEID_SUCURSAL'      ).Clear;
    Params.ParamByName( 'PECVE_MONEDA'       ).Clear;
    Params.ParamByName( 'PEDESC_MONEDA'      ).Clear;
    Params.ParamByName( 'PEIMP_DOCUMENTO'    ).Clear;
    Params.ParamByName( 'PEIMP_DESCUENTO'    ).Clear;
    Params.ParamByName( 'PEID_EMISOR'        ).Clear;
    Params.ParamByName( 'PECVE_TIPO_CREDITO' ).Clear;
    Params.ParamByName( 'PEDESC_TIP_CREDITO' ).Clear;
    Params.ParamByName( 'PEDESC_TIEMPO_CP'   ).Clear;
    Params.ParamByName( 'PEDESC_TIEMPO_IN'   ).Clear;
    Params.ParamByName( 'PEUNIDAD_TIEMPO_CP' ).Clear;
    Params.ParamByName( 'PEUNIDAD_TIEMPO_IN' ).Clear;
    Params.ParamByName( 'PETX_BIEN_SERVICIO' ).Clear;
    Params.ParamByName( 'PECVE_TIPO_DOCTO'   ).Clear;
    Params.ParamByName( 'PETX_DOMICILIO_PAG' ).Clear;
    Params.ParamByName( 'PECVE_TASA_REFER'   ).Clear;
    Params.ParamByName( 'PEOPERADOR_STASA'   ).Clear;
    Params.ParamByName( 'PESOBRETASA'        ).Clear;
    Params.ParamByName( 'PECVE_TASA_REF_PAS' ).Clear;
    Params.ParamByName( 'PENUM_AMORTIZACION' ).Clear;
    Params.ParamByName( 'PECVE_AMORTIZACION' ).Clear;
    Params.ParamByName( 'PEF_INI_PAG_CAP'    ).Clear;
    Params.ParamByName( 'PEF_INI_PAG_INT'    ).Clear;
    Params.ParamByName( 'PEDIA_PAGO'         ).Clear;
    Params.ParamByName( 'PEF_VENCTO_DOCTO'   ).Clear;
    Params.ParamByName( 'PEF_VENCIMIENTO'    ).Clear;
    Params.ParamByName( 'PEF_EMISION'        ).Clear;
    Params.ParamByName( 'PEF_OPERACION'      ).Clear;
    Params.ParamByName( 'PETX_LUGAR_FIRMA'   ).Clear;
    Params.ParamByName( 'PEB_AMORT_AJUSTE'   ).Clear;
    Params.ParamByName( 'PEB_RENTA'          ).Clear;
    Params.ParamByName( 'PEIMP_AMORT_AJUSTE' ).Clear;
    Params.ParamByName( 'PENUM_AMORTIZA'     ).Clear;
    Params.ParamByName( 'PEIMP_AMORTIZA'     ).Clear;
    Params.ParamByName( 'PEF_AMORTIZA'       ).Clear;
    Params.ParamByName( 'PECVE_TIP_AMORTIZA' ).Clear;
    Params.ParamByName( 'PETX_CAUSA_RECHAZO' ).Clear;
    Params.ParamByName( 'PESIT_ARCHIVO'      ).Clear;
    Params.ParamByName( 'PENOM_ARCHIVO'      ).Clear;
    Params.ParamByName( 'PECVE_USU_ALTA'     ).Clear;
    Params.ParamByName( 'PEB_COMMIT'         ).Clear;
    Params.ParamByName( 'PSIDCARGANAFIN'     ).Clear;
    Params.ParamByName( 'PSRESULTADO'        ).Clear;
    Params.ParamByName( 'PSTXRESULTADO'      ).Clear;
  End;
end;

{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
Function  TCrArchNaf.ObtenEntidadDescontadoraNAFIN: String;
var vlCVE_ENT_DES_BIN : String;
begin
     vlCVE_ENT_DES_BIN := '0';
     try
        GetSQLStr('SELECT CVE_ENT_DES_NAF FROM CR_PARAM_DD', Apli.DataBaseName, Apli.SessionName,
                  'CVE_ENT_DES_NAF',vlCVE_ENT_DES_BIN, False);
     except
        vlCVE_ENT_DES_BIN := '0';
     end;
//   ObtenEntidadDescontadoraNAFIN := vlCVE_ENT_DES_BIN
     ObtenEntidadDescontadoraNAFIN := MInstDesc.CVE_FND_ENT_DES.AsString;
end;
{/ROIM}

{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
procedure TCrArchNaf.AsignaEntidadDescontadora(var Stp: TStoredProc; StrParamByName : String);
begin
   If (Assigned(Stp)) Then
   begin
        Stp.ParamByName(StrParamByName).AsString  := ObtenEntidadDescontadoraNAFIN;
   end;
end;
{/ROIM}

procedure TCrArchNaf.GeneraDispPYME(peFCarga       : TDate;   peId_acuse     : String;
                                    peId_Contrato  : Integer; peFol_Contrato : Integer;
                                    peCve_Usu_Alta : String;  peB_Aplica_Com : String;
                                    peBCommit      : String;  var psResultado: Integer;
                                    var psTxResultado  : String );
var stpGenera : TStoredProc;
begin
  stpGenera := TStoredProc.Create(nil);
  try
    with stpGenera do
    begin
      DatabaseName   := Apli.DataBaseName;
      SessionName    := Apli.SessionName;
      StoredProcName := 'PKGCRPERIODO.STPAPLICAPYMEACUSE';
      Params.Clear;
      //
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
      Params.CreateParam(ftDateTime,  'peCveEntDesc',   ptInput );
{/ROIM}
      Params.CreateParam(ftDateTime,  'peFCarga',       ptInput );
      Params.CreateParam(ftString,    'peId_acuse',     ptInput );
      Params.CreateParam(ftFloat,     'peId_Contrato',  ptInput );
      Params.CreateParam(ftFloat,     'peFol_Contrato', ptInput );
      Params.CreateParam(ftString,    'peCve_Usu_Alta', ptInput );
      Params.CreateParam(ftString,    'peB_Aplica_Com', ptInput );
      Params.CreateParam(ftString,    'peBCommit',      ptInput );
      Params.CreateParam(ftFloat,     'psResultado',    ptOutput );
      Params.CreateParam(ftString,    'psTxResultado',  ptOutput );
      //
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
      ParamByName( 'peCveEntDesc'   ).AsString  := ObtenEntidadDescontadoraNAFIN;
{/ROIM}
      ParamByName( 'peFCarga'       ).AsDate    := peFCarga;
      ParamByName( 'peId_acuse'     ).AsString  := peId_acuse;
      ParamByName( 'peId_Contrato'  ).AsInteger := peId_Contrato;
      ParamByName( 'peFol_Contrato' ).AsInteger := peFol_Contrato;
      ParamByName( 'peCve_Usu_Alta' ).AsString  := peCve_Usu_Alta;
      ParamByName( 'peB_Aplica_Com' ).AsString  := peB_Aplica_Com;
      ParamByName( 'peBCommit'      ).AsString  := peBCommit;
      ParamByName( 'psResultado'    ).AsInteger := 0;
      ParamByName( 'psTxResultado'  ).AsString  := '';
      //
      ExecProc;
      psResultado   := ParamByName( 'psResultado'    ).AsInteger;
      psTxResultado := ParamByName( 'psTxResultado'  ).AsString;
    end;
  finally
    stpGenera.Free;
  end;
end;
//
function TCrArchNaf.ObtenDisposiciones(sFCarga : TDateTime; strAcuses : String) : String;
var Qry     : TQuery;
    strDisp : String;
    strComa : String;
begin
  Result := '';
  Qry := TQuery.Create(Self);
  If Assigned(Qry) Then
    With Qry Do
      Try

        DatabaseName := Apli.DatabaseName;
        SessionName  := Apli.SessionName;
        SQL.Clear;
        SQl.Add(
                      ' SELECT ID_CREDITO '  +
                      ' FROM   CR_ARCHIVO_PYME ' +
                      ' WHERE  F_CARGA  =  '  + SQLFecha(sFCarga) +
                      '   AND  ID_ACUSE =  '  + strAcuses +
                      ' GROUP BY ID_CREDITO ORDER BY ID_CREDITO '
                     );
        Open;
        First;
        //
        strDisp := '';
        strComa := '';
        While Not Eof Do
        Begin
          strDisp := strDisp + strComa + FieldByName('ID_CREDITO').AsString;
          strComa := ', ';
          Next;
        End;

        Result := strDisp;
      Finally
        Close;
        Free;
      End;
end;



(************************FORMA CR_ARCHIVO_NAFIN********************)
(*                                                                *)
(*                       FORMA CR_ARCHIVO_NAFIN                   *)
(*                                                                *)
(************************FORMA CR_ARCHIVO_NAFIN********************)

procedure TWCrArchNaf.Set_Acuses(strValue : String);
var aAcuses : TArrayString;
    I : Integer;
begin
 With memAcuses Do
  Begin
  Lines.Clear;
  ParseStr(aAcuses,strValue,C_SEPARATOR);
  For I := 0 To High(aAcuses) Do
   Lines.Add(Trim(aAcuses[I]));
  SetLength(aAcuses,0);

  If Lines.Count > 3 Then ScrollBars := ssVertical
  Else ScrollBars := ssNone;
  SelStart := 0;
  End;
end;

function TWCrArchNaf.Get_Acuses : String;
var I : Integer;
    strResult, strSeparator : String;
begin
 strResult := ''; strSeparator := '';
 For I := 0 To memAcuses.Lines.Count - 1 Do
  Begin
  strResult := strResult + strSeparator + memAcuses.Lines[I];
  strSeparator := C_SEPARATOR;
  End;
 Result := strResult;
end;



procedure TWCrArchNaf.InvertCheck(StrGrd: TStringGrid; nCol,
  nRow: Integer);
var strBool : String;
begin
 With StrGrd Do
  Begin
   If (Cells[nCol,nRow] = C_APLICA) Then strBool := C_NOAPLICA
   Else strBool := C_APLICA;
   Cells[nCol,nRow] := strBool;
  End;
end;
// Se hace generica la función.
// Crea una Lista de Relación entre el Campo de Archivo y el Campo de la Tabla "CR_ARCHIVO_NAFIN",
// se ideo de esta manera para evitar varias consultas a la Base de Datos de Oracle
procedure TWCrArchNaf.CreateRelationalKey(var A : TArrayString);
var Qry : TQuery;
    nCount : Integer;
    sTName : String;
begin
  sTName := SQLStr( 'CR_ARCHIVO_NAFIN' );
  if Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CRPYME then
    sTName := SQLStr( 'CR_ARCHIVO_PYME' );
  //ends_if
  Qry := TQuery.Create(Self);
  If Assigned(Qry) Then
   With Qry Do
    Try
     DatabaseName := Objeto.DatabaseName;
     SessionName  := Objeto.SessionName;
     SQL.Clear;
     SQL.Add(
             ' SELECT CCAN.NOMBRE_CAM_BD, CCAN.NOMBRE_CAM_ARC, CCAN.VALOR_OMISON,'+
             '        CCAN.SIT_CONF_ARCNAF, CCAN.B_OBLIGATORIO , ATC.*'+
             ' FROM CR_CONF_ARC_NAF CCAN,'+
             '      ('+
             '  SELECT COLUMN_NAME, DATA_TYPE,'+
             '         DECODE(DATA_TYPE,''DATE'', 10,'+
             '                          ''NUMBER'', DATA_PRECISION + DATA_SCALE + 1,'+
             '                          DATA_LENGTH) AS DATA_LENGTH   FROM ALL_TAB_COLUMNS'+
             '  WHERE TABLE_NAME = ' + sTName +
             '      ) ATC'+
             ' WHERE CCAN.NOMBRE_CAM_BD = ATC.COLUMN_NAME ' +
             '   AND CCAN.CVE_FORMATO_NAF = ' + SQLStr(Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString) +
             ' ORDER BY NOMBRE_CAM_ARC'
            );
     Open;

     nCount := 0;
     While Not Eof Do
      Begin
      SetLength(A,nCount+1);
      A[nCount] := FieldByName('NOMBRE_CAM_BD').AsString  + C_SEPARATOR +
                   FieldByName('NOMBRE_CAM_ARC').AsString + C_SEPARATOR +
                   FieldByName('VALOR_OMISON').AsString + C_SEPARATOR +
                   FieldByName('SIT_CONF_ARCNAF').AsString + C_SEPARATOR +
                   FieldByName('B_OBLIGATORIO').AsString + C_SEPARATOR +
                   FieldByName('DATA_TYPE').AsString + C_SEPARATOR +
                   FieldByName('DATA_LENGTH').AsString + C_SEPARATOR;
      Inc(nCount);
      Next;
      End;

    Finally
     Close;
     Free;
    End;
end;
// Se hace generica la función.
function TWCrArchNaf.CanLoadColumnFile(aRelationalKey : TArrayString; strFieldName : String;
                                       var strB_OBLIGATORIO : String) : Boolean;
var I : Integer;
    A : TArrayString;
begin
  Result := False;
  strFieldName := UpperCase(Trim(strFieldName));
  strB_OBLIGATORIO := '';
  For I := 0 To High(aRelationalKey) Do
  Begin
    ParseStr(A, aRelationalKey[I], C_SEPARATOR);
    If ( strFieldName = UpperCase(Trim(A[C_NOMBRE_CAM_BD])) ) Then
    Begin
      strB_OBLIGATORIO := A[C_B_OBLIGATORIO];
      If (A[C_B_OBLIGATORIO] = 'V') Then Result := True
      Else If A[C_SIT_CONF_ARCNAF] = 'AC' Then Result := True;
      Break;
    End;
  End;
End;
//
// Se hace generica la función.
function TWCrArchNaf.FindRelationalField(aRelationalKey : TArrayString; strFieldName : String;
           var strFileFieldName : String; var nMaxLength : Integer; var strValue : String) : Boolean;
var I : Integer;
    A : TArrayString;
begin
  Result := False; strFileFieldName := '';
  For I := 0 To High(aRelationalKey) Do
   Begin
   ParseStr(A, aRelationalKey[I], C_SEPARATOR);
   If (strFieldName = A[C_NOMBRE_CAM_BD]) Then
    Begin
    strFileFieldName := UpperCase(A[C_NOMBRE_CAM_ARC]);
    strValue := A[C_VALOR_OMISON];
    nMaxLength := StrToInt(A[C_DATA_LENGTH]);
    Result := strFileFieldName <> '';
    End;
   SetLength(A,0)
   End;
end;
//
// Se hace generica la función.
function TWCrArchNaf.FindColumnFile(aCaptionsFile : TArrayString; strFileFieldName : String; var nFileCol : Integer) : Boolean;
var I : Integer;
begin
  Result := False; nFileCol := -1;
  For I := 0 To High(aCaptionsFile) Do
   If (UpperCase(Trim(aCaptionsFile[I])) = Trim(strFileFieldName)) Then
    Begin
    nFileCol := I;
    Result := True;
    Break;
    End;
end;
//
// Se hace generica la función.
procedure TWCrArchNaf.AddAcuse(StrLstAcuses : TStringList; strId_Acuse : String);
var nIndex : Integer;
begin
  With StrLstAcuses Do
   Begin
    If Not Find(strId_Acuse, nIndex) Then
     Begin
     Add(strId_Acuse);
     Sort;
     End;
   End;
end;
//
// Se hace generica la función.
function TWCrArchNaf.GetFileNameAcuses(strAcuses: String; var nCount: Integer): String;
var QryCr_Carga_NAFIN : TQuery;
    strResult, strComa : String;
begin
  strResult := ''; strComa := ''; nCount := 0;

  QryCr_Carga_NAFIN := Tquery.Create(Self);
  QryCr_Carga_NAFIN.DatabaseName := Objeto.DatabaseName;
  QryCr_Carga_NAFIN.SessionName  := Objeto.SessionName;

  If Assigned(QryCr_Carga_NAFIN) Then
    With QryCr_Carga_NAFIN Do
     Try
      SQL.Clear;
      SQL.Add(
              ' SELECT DISTINCT(NOM_ARCHIVO) FROM CR_CARGA_NAFIN'#13#10+
              ' WHERE ID_ACUSE IN ('+strAcuses+')'#13#10
             );
      Open;
      While Not Eof Do
       Begin
       strResult := strResult + strComa + FieldByName('NOM_ARCHIVO').AsString;
       strComa := ', '; Inc(nCount);
       Next;
       End;

     Finally
      Close;
      Free;
     End;
  Result := strResult;
end;
//
function TWCrArchNaf.LoadFileNafin(strFileName: String;var nId_Carga_Nafin : Integer) : Integer;
//

 // Crea el Store
 procedure CreateStpCargaAcuse(var Stp : TStoredProc);
 begin
  Stp := TStoredProc.Create(Self);
  Stp.DatabaseName := Objeto.DatabaseName;
  Stp.SessionName  := Objeto.SessionName;
  Stp.StoredProcName := 'PKGCRPERIODO.STPCARGAACUSE';
  With Stp Do
   Begin
    Params.CreateParam(ftString,'PECVE_FND_ENT_DES',ptInput );
    Params.CreateParam(ftString,'PEID_ACUSE',ptInput);
    Params.CreateParam(ftFloat,'PENUM_FOLIO',ptInput);
    Params.CreateParam(ftString,'PECVE_TIPO_REGIS',ptInput);
    Params.CreateParam(ftString,'PEID_DOCUMENTO',ptInput);
    Params.CreateParam(ftString,'PECVE_OFICINA',ptInput);
    Params.CreateParam(ftFloat,'PEID_SIRAC',ptInput);
    Params.CreateParam(ftFloat,'PECVE_PYME',ptInput);
    Params.CreateParam(ftString,'PENOMBRE_PYME',ptInput);
    Params.CreateParam(ftFloat,'PEID_EPO',ptInput);
    Params.CreateParam(ftString,'PENOMBRE_EPO',ptInput);
    Params.CreateParam(ftFloat,'PEID_INTER_FINAN',ptInput);
    Params.CreateParam(ftString,'PENOMBRE_INTER_FINAN',ptInput);
    Params.CreateParam(ftDateTime,'PEF_EMISION_DOC',ptInput);
    Params.CreateParam(ftDateTime,'PEF_VENCIMIENTO_DO',ptInput);
    Params.CreateParam(ftString,'PECVE_MONEDA',ptInput);
    Params.CreateParam(ftString,'PEDESC_MONEDA',ptInput);
    Params.CreateParam(ftString,'PETIPO_FACTORAJE',ptInput);
    Params.CreateParam(ftFloat,'PEIMP_DOCUMENTO',ptInput);
    Params.CreateParam(ftFloat,'PEPCT_DESCUENTO',ptInput);
    Params.CreateParam(ftFloat,'PERECURSO_GARANTIA',ptInput);
    Params.CreateParam(ftFloat,'PEIMP_DESCUENTO',ptInput);
    Params.CreateParam(ftFloat,'PEIMP_INTERES',ptInput);
    Params.CreateParam(ftFloat,'PEIMP_OPERAR',ptInput);
    Params.CreateParam(ftFloat,'PETASA_INTERES',ptInput);
    Params.CreateParam(ftFloat,'PEDIAS_PLAZO',ptInput);
    Params.CreateParam(ftString,'PECVE_STATUS',ptInput);
    Params.CreateParam(ftDateTime,'PEF_ALTA',ptInput);
    Params.CreateParam(ftDateTime,'PEF_SOLICITUD',ptInput);
    Params.CreateParam(ftDateTime,'PEF_OPERA_SIRAC',ptInput);
    Params.CreateParam(ftFloat,'PENUM_PRESTAMO',ptInput);
    Params.CreateParam(ftString,'PEREFERENCIA',ptInput);

    // Parametros que no provienen del Archivo NAFIN
    Params.CreateParam(ftString,'PETIPO_SOLICITUD',ptInput);
    Params.CreateParam(ftString,'PECVE_USU_CARGA',ptInput);
    Params.CreateParam(ftString,'PENOM_ARCHIVO',ptInput);
    Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
    Params.CreateParam(ftFloat,'PSID_CARGA_NAFIN',ptOutput);
    Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
    Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
   End;
 end;



 function CheckFooterFileNafin(var nCountRegisters : Integer) : Boolean;
 var F : TextFile;
     bOpen : Boolean;
     strBuf, strRowType : String;
     aTotal : TArrayString;
     nTotalRegistersNAFIN, nTotalRegistersPesos, nTotalRegistersDolars : Integer;
 begin
  bOpen := False;
  Try
   {$I-}
   nCountRegisters := -1; // No se cuenta el Header
   AssignFile(F,strFileName);
   FileMode := 0;
   Reset(F);
   bOpen := True;

   // Barremos el Archivo de NAFIN
   While Not Eof(F) Do
    Begin
    ReadLn(F,strBuf);
    strRowType := Copy(strBuf,1,Pos(C_SEPARATOR,strBuf)-1);
    If (strRowType = C_DETALLE) Then Inc(nCountRegisters)
    Else If (strRowType = C_TOTAL) Then Begin ParseStr(aTotal,strBuf,C_SEPARATOR); Break; End;
   End;

   // Lee del Renglon de Totales la columna de "Total de Registros" (2)
   If (Trim(aTotal[2]) <> '') Then nTotalRegistersPesos := StrToInt(aTotal[2])
   Else nTotalRegistersPesos  := -1;

   // Lee del Renglon de Totales la columna de "Total de Registros Dólares" (2)  05042004
   If (Trim(aTotal[14]) <> '') Then nTotalRegistersDolars := StrToInt(aTotal[14])
   Else nTotalRegistersDolars  := -1;

   nTotalRegistersNAFIN := nTotalRegistersDolars + nTotalRegistersPesos;

   Result := (nCountRegisters > 0) And (nTotalRegistersNAFIN > 0) And (nTotalRegistersNAFIN = nCountRegisters);

   If (nTotalRegistersNAFIN <> nCountRegisters) Then
     Begin
     If (nTotalRegistersNAFIN < nCountRegisters) Then strBuf := 'menor'
     Else strBuf := 'mayor';
     ShowMessage('El Achivo NAFIN Reporta un Número de registros '+strBuf+' al Indicado. '#13#10+
                 'Se Reportan '+IntToStr(nTotalRegistersNAFIN)+' registros y existen en el archivo '+IntToStr(nCountRegisters));
     End;

  Finally
   If bOpen Then CloseFile(F);
   {$I+}
   SetLength(aTotal,0);
  End;
 end;

  { ALES  : Verifica si en el archivo por lo menos un registro sobrepasa al plazo máximo
            estipulado en los parametros de la aplicación}
  function verificaplazodias(pIdPlazo : Integer) : Boolean;
  var vlresult   : boolean;
      vlsql      : string;
      vlplazoMax : integer;
  Begin
     vlresult := False;
     vlsql := 'SELECT DIAS_MAX_DD_NAFIN FROM CR_PARAMETRO WHERE CVE_PARAMETRO =  ' + #39 + 'CRE' + #39;
     GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'DIAS_MAX_DD_NAFIN',vlplazoMax,False);
     if vlPlazoMax < pIdPlazo then
        vlResult := True;
     //end if
     verificaplazodias := vlresult;
  end;
  //----}

var bOpen : Boolean;
    strBufHeader, strBufCaptions, strBuf,
    strParamName, strValue, strDefaultValue,
    strFileFieldName, strFieldName, strComa,
    strB_OBLIGATORIO, strFiles, strMsg, strMsg1 : String;

    I, J, N, nCount, nMaxCount, nMaxLength, nFileCol, nErrorsLoad : Integer;

    aCaptions, aBuffer, aRelationKey : TArrayString;
    StrLstAcuses : TStringList;
    StpCargaAcuse : TStoredProc;
    F : TextFile;
    vlResult : Boolean; //---ales
begin
  //-----ALES
  vlResult := False;
  //-----}
 Result := 0;
 bOpen := False;

 If Not CheckFooterFileNafin(nMaxCount) Then
  Begin
  Result := 1;
  ShowMessage('El Formato del Archivo no es Correcto... o no Corresponde con un Archivo NAFIN');
  Exit;
  End;

 nErrorsLoad := 0;
 Count    := 0;
 MaxCount := nMaxCount;
 StrLstAcuses := Nil;

 { Abrimos el archivo únicamente de lectura }
 Try
 {$I-}
  AssignFile(F,strFileName);
  FileMode := 0;
  Reset(F);
  bOpen := True;
  ReadLn(F,strBufHeader);
  ReadLn(F,strBufCaptions);
  ParseStr(aCaptions,strBufCaptions,',');

  CreateStpCargaAcuse(StpCargaAcuse); // Crea el StoreProcedure con sus Parametros de Entrada y de Salida
  Objeto.AsignaEntidadDescontadora(StpCargaAcuse, 'PECVE_FND_ENT_DES'); // Asigna la entidad descontadora
  CreateRelationalKey(aRelationKey); // Hace una lista de relación "Nombre Campo de Archivo" con "Nombre Campo Tabla"
  StrLstAcuses := TStringList.Create;

  If Not Assigned(StpCargaAcuse) Then
   Result := 2 // Error
  Else
   Begin
   J := 0;
   While Not Eof(F) Do
    Begin
    ReadLn(F,strBuf);
    ParseStr(aBuffer,strBuf,C_SEPARATOR);

    // Si es el Registro de Totales del Archivo (Último Renglón) Termina...
    If (aBuffer[0] = C_TOTAL) Then
     Break;
    // Barro los Parámetros que me solicita el StoreProcedure desde el PEID_ACUSE hasta el PETIPO_SOLICITUD
    For I := 0 To StpCargaAcuse.Params.Count - 6 Do
     Begin
     Application.ProcessMessages;
     strParamName := UpperCase(Trim(StpCargaAcuse.Params[I].Name));
     strFieldName := Copy(strParamName,3,Length(strParamName));

     // Si no se debe tomar en cuenta la columna actual, CONTINÚA con la siguiente...
     If Not CanLoadColumnFile(aRelationKey,strFieldName, strB_OBLIGATORIO) Then
       Continue;

      // Encuentro el Nombre de la Columna que le corresponde al Archivo, con respecto a los parametros
      // solicitados del StoreProcedure (ver... tabla CR_CONF_ARC_NAF)
      If FindRelationalField(aRelationKey, strFieldName, strFileFieldName, nMaxLength, strDefaultValue) Then
       Begin
         // Busco si en el Archivo Existe ese Nombre de Columna que le corresponde (Paso Anterior) para obtener el valor
         // de lo contrario uso mi valor default, definido en la tabla de CR_CONF_ARC_NAF
         If FindColumnFile(aCaptions, strFileFieldName, nFileCol) Then strValue := aBuffer[nFileCol]
         Else strValue := '';
         If (Trim(strValue) = '') Then strValue := strDefaultValue;

         If (Length(strValue) > nMaxLength) Then
          Begin
              strMsg := 'Formato del Archivo Incorrecto.'#13#10+
                        'El dato de la columna "'+aCaptions[nFileCol]+'" del archivo es mayor que el establecido.';
              strMsg1 := 'Operación terminada por el usuario.';

              If (strB_OBLIGATORIO = 'V') Then
               Begin
                   ShowMessage(strMsg+#13#10+strMsg1);
                   Result := 3;
                   Exit;
               End
              Else
               Begin
                  If MessageDlg(strMsg+#13#10'¿Desea omitir este dato que no es obligatorio y continuar con la carga?',
                                mtConfirmation,[mbYes,mbNo],0) = mrYes Then
                   Continue
                  Else
                   Begin
                   ShowMessage(strMsg1);
                   Result := 3;
                   Exit;
                   End;
               End;
          End;


         Case StpCargaAcuse.ParamByName(strParamName).DataType Of
          ftFloat    : Begin
                       If (Trim(strValue) = '') Then StpCargaAcuse.ParamByName(strParamName).AsFloat := 0
                       Else StpCargaAcuse.ParamByName(strParamName).AsFloat := StrToFloat(strValue);
                       End;

          ftString   : StpCargaAcuse.ParamByName(strParamName).AsString := strValue;

          ftDateTime : Begin
                       If (Trim(strValue) = '') Then StpCargaAcuse.ParamByName(strParamName).Clear
                       Else StpCargaAcuse.ParamByName(strParamName).AsDateTime := StrToDate(Trim(strValue));
                       End;
         End
       End; // End If
     End; // End For

    // No hagas commit hasta que se inserten todos los registros
    StpCargaAcuse.ParamByName('PECVE_USU_CARGA').AsString := Objeto.DameUsuario;
    StpCargaAcuse.ParamByName('PENOM_ARCHIVO').AsString   := UpperCase(ExtractFileName(strFileName));
    StpCargaAcuse.ExecProc;
    Inc(J);
    Count := J;

    If (StpCargaAcuse.ParamByName('PSRESULTADO').AsInteger <> 0) Then
    Begin
       { Si el Acuse Ya Existe }
       If (StpCargaAcuse.ParamByName('PSRESULTADO').AsInteger = C_ERROR_CARGA_ACUSE_YA_APLICADOS) Then
          Begin
            Inc(nErrorsLoad);
            // Agrega a una lista los Acuses ya Aplicados en el Archivo
            AddAcuse(StrLstAcuses, StpCargaAcuse.ParamByName('PEID_ACUSE').AsString);
          End
       Else If (StpCargaAcuse.ParamByName('PSRESULTADO').AsInteger = C_ERROR_INSERT) Or
               (StpCargaAcuse.ParamByName('PSRESULTADO').AsInteger = C_ERROR_INSERT_CARGA) Then
          Begin
            ShowMessage(StpCargaAcuse.ParamByName('PSTXRESULTADO').AsString);
            ShowMessage('El Formato del Archivo Posiblemente tenga Errores. Proceso Abortado...');
            Result := 1;
            Exit;
          End;
    End;
    if  (StpCargaAcuse.ParamByName('PSTXRESULTADO').AsString <> CNULL) Then
    Begin
//       ShowMessage(StpCargaAcuse.ParamByName('PSTXRESULTADO').AsString);
       Merrores.Lines.Add(StpCargaAcuse.ParamByName('PSTXRESULTADO').AsString);
    end;

    nId_Carga_Nafin := StpCargaAcuse.ParamByName('PSID_CARGA_NAFIN').AsInteger;
    Application.ProcessMessages;
    {ALES----}
//    ShowMessage('ID_ACUSE : ' + aBuffer[3] + '                   PLAZO: ' + aBuffer[24]);
       if verificaplazodias( StrToInt(aBuffer[24]) ) Then
          vlResult := True;
       //end if
    //end if
    {-----}
    End; // End While

    if vlResult then
    Begin
       MessageDlg(' El archivo contiene registros con plazos mayor al estipulado ',
                                mtInformation, [mbOK], 0  );
    end;


   End; // End Else

   // Si el número de Registros del Archivo es Igual al Número de Registros que no se Cargaron entonces...
   If (nErrorsLoad = Count) Then
    Begin
    // Concatena los Acuses encontrados en el Archivo
    strBuf := ''; strComa := '';
    For N := 0 To StrLstAcuses.Count - 1 Do
     Begin
     strBuf := strBuf + strComa + #39+StrLstAcuses[N]+#39;
     strComa := ' ,';
     End;

     // Arma Mensaje de Error
    strFiles := GetFileNameAcuses(strBuf, nCount);
    strMsg := 'Los acuses "'+strBuf+'" de este archivo ya fueron Aplicados Previamente '#13#10;
    If (nCount > 1) Then  strMsg := strMsg +  'los archivos : '+strFiles+#13#10
    Else strMsg := strMsg +  'en el archivo : '+strFiles+#13#10;
    strMsg := strMsg + 'No existen Documentos por Aplicar de este Archivo.';

    ShowMessage(strMsg);
    Count := 0;
    Result := 1;
    End;

 Finally
  {$I+}
  If bOpen Then CloseFile(F);
  If Assigned(StpCargaAcuse) Then StpCargaAcuse.Free;
  If Assigned(StrLstAcuses) Then Begin StrLstAcuses.Clear; StrLstAcuses.Free; End;

  SetLength(aRelationKey,0);
  SetLength(aCaptions,0);
  SetLength(aBuffer,0);
 End;

end;


function TWCrArchNaf.GiveAcuses(nId_Carga_Nafin : Integer; var strAcuses : String) : Integer;
var nCount : Integer;
   strComa : String;
   QryDistinct : TQuery;
begin
 strAcuses := ''; strComa := ''; nCount := 0;
 QryDistinct := TQuery.Create(Self);

 If Assigned(QryDistinct) Then
  With (QryDistinct) Do
   Try
    DatabaseName := Objeto.DatabaseName;
    SessionName := Objeto.SessionName;
    SQL.Clear;
    SQL.Add(' SELECT ID_ACUSE '#13#10+
            ' FROM CR_CARGA_NAFIN '#13#10+
            ' WHERE ID_CARGA_NAFIN = '+IntToStr(nId_Carga_Nafin)
            );
    Open;
    While Not Eof Do
     Begin
     strAcuses := strAcuses + strComa + #39 + FieldByName('ID_ACUSE').AsString + #39;
     strComa := ', ';
     Inc(nCount); Next;
     End;

   Finally
    Close;
    Free;
   End;
 Result := nCount;
end;

function TWCrArchNaf.LoadDataErrors(strAcuses : String; var nDocsAC, nDocsER, nDocsAP : Integer) : Integer;
var Qry : TQuery;
    nCol, nRow : Integer;
    strCaption, strTopicSit_Archivo : String;
begin
 Result := 0;

 Qry := TQuery.Create(Self);
 If Assigned(Qry) Then
  With Qry Do
  Try
   DatabaseName := Objeto.DatabaseName;
   SessionName := Objeto.SessionName;
   SQL.Clear;
   SQL.Add(
           '  SELECT'#13#10+
           '   SIT_ARCHIVO        As "Sit.",'#13#10+
           '   ID_ACUSE           As "Número de Acuse",'#13#10+
           '   ID_EPO             As "Cve.EPO ",'#13#10+
           '   NOMBRE_EPO         As "Empresa de Primer Orden",'#13#10+
           '   ID_DOCUMENTO       As "Núm Doc.",'#13#10+
           '   CVE_OFICINA        As "Núm Ofic.",'#13#10+
           '   ID_SIRAC           As "Núm. SIRAC",'#13#10+
           '   TIPO_FACTORAJE     As "Factoraje",'#13#10+
           '   CVE_PYME           As "Cve. PYME",'#13#10+
           '   NOMBRE_PYME        As "Nombre PYME",'#13#10+
           '   ID_INTER_FINAN     As "Cve.Inter. Finan",'#13#10+
           '   NOMBRE_INTER_FINAN As "Nom. InterFinan",'#13#10+
           '   F_EMISION_DOC      As "Fecha Emisión",'#13#10+
           '   F_VENCIMIENTO_DO   As "Fecha Venc.",'#13#10+
           '   CVE_MONEDA         As "Cve. Moneda",'#13#10+
           '   DESC_MONEDA        As "Moneda",'#13#10+
           '   IMP_DOCUMENTO      As "Imp. Documento",'#13#10+
           '   PCT_DESCUENTO      As "Pct. Descuento",'#13#10+
           '   RECURSO_GARANTIA   As "Recurso Gtía.",'#13#10+
           '   IMP_DESCUENTO      As "Imp. Descuento",'#13#10+
           '   IMP_INTERES        As "Imp. Interés",'#13#10+
           '   DIAS_PLAZO         As "Días Plazo",'#13#10+
           '   CVE_STATUS         As "Cve_Status",'#13#10+
           '   TX_CAUSA_RECHAZO   As "Mensaje"'#13#10+
           ' FROM CR_ARCHIVO_NAFIN'#13#10+
           ' WHERE ID_ACUSE IN ('+strAcuses+')'#13#10+
           ' ORDER BY SIT_ARCHIVO DESC'#13#10
          );
   Open;

   ClearGrid(strGrdDataErrors);
   ClearGrid(strGrdDataErrors1);
   strGrdDataErrors.ColCount := Fields.Count;
   strGrdDataErrors.RowCount := 2003;
   strGrdDataErrors1.ColCount := 2;
   strGrdDataErrors1.RowCount := strGrdDataErrors.RowCount;

   strGrdDataErrors.ColWidths [0] := 28;                     // "Sit."
   strGrdDataErrors.ColWidths [1] := 93;                     // "Número de Acuse"
   strGrdDataErrors.ColWidths [C_COLEPO] := 52;              // "Cve.EPO "
   strGrdDataErrors.ColWidths [C_COLNOMEPO] := 290;          // "Empresa de Primer Orden"
   strGrdDataErrors.ColWidths [4] := 56;                     // "Núm Doc."
   strGrdDataErrors.ColWidths [5] := 45;                     // "Núm Ofic."
   strGrdDataErrors.ColWidths [C_COLSIRAC] := 67;            // "Núm. SIRAC"
   strGrdDataErrors.ColWidths [7] := 67;                     // "Factoraje"
   strGrdDataErrors.ColWidths [8] := 64;                     // "Cve. PYME"
   strGrdDataErrors.ColWidths [9] := 282;                    // "Nombre PYME"
   strGrdDataErrors.ColWidths [10] := 64;                    // "Cve.Inter. Finan"
   strGrdDataErrors.ColWidths [11] := 160;                   // "Nom. InterFinan"
   strGrdDataErrors.ColWidths [12] := 64;                    // "Fecha Emisión"
   strGrdDataErrors.ColWidths [13] := 64;                    // "Fecha Venc."
   strGrdDataErrors.ColWidths [14] := 52;                    // "Cve. Moneda"
   strGrdDataErrors.ColWidths [15] := 95;                    // "Moneda"
   strGrdDataErrors.ColWidths [16] := C_WIDTH_DINERO;        // "Imp. Doc."
   strGrdDataErrors.ColWidths [17] := C_WIDTH_TASA;          // "Pct. Descuento"
   strGrdDataErrors.ColWidths [18] := C_WIDTH_DINERO;        // "Recurso Gtía."
   strGrdDataErrors.ColWidths [19] := C_WIDTH_DINERO;        // "Imp. Desc."
   strGrdDataErrors.ColWidths [20] := C_WIDTH_DINERO;        // "Imp. Intéres"
   strGrdDataErrors.ColWidths [21] := 64;                    // "Días Plazo"
   strGrdDataErrors.ColWidths [22] := 64;                    // "Cve_Status"

   strGrdDataErrors1.ColWidths [0] := 0;
   strGrdDataErrors1.ColWidths [C_COLMENSAJE] := 245;        // "Mensaje"

   For nCol := 0 To Fields.Count - 2 Do
    strGrdDataErrors.Cells[nCol,0] := Fields[nCol].FieldName;
   strGrdDataErrors1.Cells[1,0] := Fields[Fields.Count - 1].FieldName;

   nRow := 1;  strTopicSit_Archivo := ''; nDocsAC := 0; nDocsER := 0; nDocsAP := 0;
   While Not Eof Do
    Begin
     If (strTopicSit_Archivo <> FieldByName('Sit.').AsString) Then
      Begin
      { Genera el Header o Titulo de los Bloques de las Situaciones del ACUSE }
      strTopicSit_Archivo := FieldByName('Sit.').AsString;

      If (strTopicSit_Archivo = CSIT_ER) Then strCaption  := 'Documentos con Error'
      Else If (strTopicSit_Archivo = CSIT_AC) Then strCaption := 'Documentos por Aplicar'
      Else If (strTopicSit_Archivo = CSIT_AP) Then strCaption := 'Documentos Ya Aplicados Anteriormente';

      strGrdDataErrors.Cells[0,nRow] := strTopicSit_Archivo;
      strGrdDataErrors.Cells[1,nRow] := strCaption;
      Inc(nRow);
      End;

     For nCol := 0 To Fields.Count - 2 Do
      strGrdDataErrors.Cells[nCol,nRow] := FieldByName(Fields[nCol].FieldName).AsString;

     strGrdDataErrors1.Cells[0,nRow] := strTopicSit_Archivo;
     strGrdDataErrors1.Cells[C_COLMENSAJE,nRow] := FieldByName(Fields[Fields.Count - 1].FieldName).AsString; // Mensaje de Error

    Inc(nRow);
    If strTopicSit_Archivo = CSIT_AC Then Inc(nDocsAC);
    If strTopicSit_Archivo = CSIT_ER Then Inc(nDocsER);
    If strTopicSit_Archivo = CSIT_AP Then Inc(nDocsAP);
    Next;
    End;

    // Ajusta el Grid con los resultados mostrados
    If (nRow > 1) Then  strGrdDataErrors.RowCount := nRow
    Else strGrdDataErrors.RowCount := 2;
    strGrdDataErrors1.RowCount := strGrdDataErrors.RowCount;

    strGrdDataErrors.Row := 1;
    strGrdDataErrors1.Row := 1;
  Finally
   Close;
   Free;
  End;
end;
//
function TWCrArchNaf.LoadAcuses(strAcuses : String) : Integer;
var Qry : TQuery;
    nRow : Integer;
    strComa : string;
    vlsql : string;//ales
begin
 ClearGrid(StringGrid);
 ClearGrid(StringGrid1);

 Result := 0;
 If (Trim(StrAcuses) = '') Then Exit;

 strComa := '';
 Qry := TQuery.Create(Nil);

 If Assigned(Qry) Then
  With Qry Do
   Try
   // Se agrega agrupar por moneda 05042004 SATV4766
{   vlsql :=  ' SELECT CAN.ID_ACUSE,'+coCRLF+
             '        CAN.ID_EPO,'+coCRLF+
             '        CAN.NOMBRE_EPO,'+coCRLF+
             '        CAN.TIPO_FACTORAJE,'+coCRLF+
             '        DECODE(CMN.CVE_MONEDA, 484, ''PESO'','+coCRLF+
             '                               840, ''DLLS'','+coCRLF+
             '                               CMN.CVE_MONEDA) AS DESC_MONEDA,'+coCRLF+ // HARDCODE Vo.Bo. por ROIM748 el 06042004
             '        CMN.CVE_MONEDA,'+coCRLF+
             '        SUM(CAN.IMP_DOCUMENTO) AS IMP_NOMINAL,'+coCRLF+
             '        SUM(PKGCRPERIODO.OBTENIMPAFORO(CAN.IMP_DOCUMENTO,CAN.PCT_DESCUENTO)) AS IMP_AFORADO,'+coCRLF+
             '        COUNT(*) AS TOTAL_DOCS,'+coCRLF+
             '        CE.ID_ACREDITADO'+coCRLF+
             ' FROM CR_ARCHIVO_NAFIN CAN,'+coCRLF+
             '      CR_EMISOR CE,'+coCRLF+
             '      CR_MONEDA_NAFIN CMN'+coCRLF+
             ' WHERE CAN.SIT_ARCHIVO = ''AC'''+coCRLF+
             '   AND CAN.ID_ACUSE IN  ('+strAcuses+')'+coCRLF+
             '   AND CAN.ID_ACUSE NOT IN ( SELECT ID_ACUSE'+coCRLF+
             '                             FROM CR_ARCHIVO_NAFIN'+coCRLF+
             '                             WHERE ID_ACUSE IN ('+strAcuses+')'+coCRLF+
             '                               AND SIT_ARCHIVO IN (''ER'',''AP'')'+coCRLF+
             '                             GROUP BY ID_ACUSE'+coCRLF+
             '                         )'+coCRLF+
             '   AND CE.CVE_EMISOR_NAFIN = CAN.ID_EPO'+coCRLF+
             '   AND CMN.CVE_MONEDA_NAFIN = CAN.CVE_MONEDA'+coCRLF+ //
             '   GROUP BY ID_ACUSE, ID_EPO, NOMBRE_EPO, CMN.CVE_MONEDA, DESC_MONEDA, TIPO_FACTORAJE, CE.ID_ACREDITADO'; }



   vlsql :=  ' SELECT CAN.ID_ACUSE,'+coCRLF+
             '        CAN.ID_EPO,'+coCRLF+
             '        CAN.NOMBRE_EPO,'+coCRLF+
             '        CAN.TIPO_FACTORAJE,'+coCRLF+
             '        DECODE(M.CVE_MONEDA, 484, ''PESO'','+coCRLF+
             '                             840, ''DLLS'','+coCRLF+
             '                             M.CVE_MONEDA) AS DESC_MONEDA,'+coCRLF+ // HARDCODE Vo.Bo. por ROIM748 el 06042004
             '        M.CVE_MONEDA,'+coCRLF+
             '        SUM(CAN.IMP_DOCUMENTO) AS IMP_NOMINAL,'+coCRLF+
             '        SUM(PKGCRPERIODO.OBTENIMPAFORO(CAN.IMP_DOCUMENTO,CAN.PCT_DESCUENTO)) AS IMP_AFORADO,'+coCRLF+
             '        COUNT(*) AS TOTAL_DOCS,'+coCRLF+
             '        CE.ID_ACREDITADO'+coCRLF+
             ' FROM CR_ARCHIVO_NAFIN CAN,'+coCRLF+
             '      CR_EMISOR CE,'+coCRLF+
             '      MONEDA M'+coCRLF+
             ' WHERE CAN.SIT_ARCHIVO = ''AC'''+coCRLF+
             '   AND CAN.ID_ACUSE IN  ('+strAcuses+')'+coCRLF+
             '   AND CAN.ID_ACUSE NOT IN ( SELECT ID_ACUSE'+coCRLF+
             '                             FROM CR_ARCHIVO_NAFIN'+coCRLF+
             '                             WHERE ID_ACUSE IN ('+strAcuses+')'+coCRLF+
             '                               AND SIT_ARCHIVO IN (''ER'',''AP'')'+coCRLF+
             '                             GROUP BY ID_ACUSE'+coCRLF+
             '                         )'+coCRLF+
{ROIM  09042007 CAMBIO POR EMISOR NAFIN}
//             '   AND CE.CVE_EMISOR_NAFIN = CAN.ID_EPO'+coCRLF+
             '   AND CE.CVE_EMISOR_EXT = CAN.ID_EPO'+coCRLF+
{/ROIM}
             '   AND M.CVE_MON_NAFIN = CAN.CVE_MONEDA'+coCRLF+ //          
             '   GROUP BY ID_ACUSE, ID_EPO, NOMBRE_EPO, M.CVE_MONEDA, TIPO_FACTORAJE, CE.ID_ACREDITADO'+coCRLF+
             '   ORDER BY ID_ACUSE, ID_EPO, NOMBRE_EPO, M.CVE_MONEDA, TIPO_FACTORAJE, CE.ID_ACREDITADO';
                          
   DataBaseName := Objeto.DataBaseName;
   SessionName := Objeto.SessionName;
   SQL.Clear;
   SQL.Add(vlSql);
   Open;

   StringGrid.RowCount := 2003;
   StringGrid.ColCount := 9;
   StringGrid1.RowCount := StringGrid.RowCount;
   StringGrid1.ColCount := 2;

   With StringGrid Do
    Begin
    Cells[C_COLGRID_CARGAR     ,0] := 'Cargar';
    Cells[C_COLACUSE           ,0] := 'Acuse';
    Cells[C_COLGRID_EPO        ,0] := 'Empresa de Primer Orden (EPO)';
    Cells[C_COLGRIDDESC_MONEDA ,0] := 'Mon.';
    Cells[C_COLGRIDTOTALDOCS   ,0] := 'Docs.';
    Cells[C_COLGRID_LINEA      ,0] := C_LINEA;
    Cells[C_COLGRID_TITULAR    ,0] := 'Titular de la Autorización';

    ColWidths[C_COLGRID_CARGAR]      := 20;
    ColWidths[C_COLACUSE]            := 91;
    ColWidths[C_COLGRID_EPO]         := 165;
    ColWidths[C_COLGRIDDESC_MONEDA]  := 40;
    ColWidths[C_COLGRIDTOTALDOCS]    := 29;
    ColWidths[C_COLGRID_LINEA]       := 101;
    ColWidths[C_COLGRID_TITULAR]     := 138;
    ColWidths[C_COLGRID_ACREDITADO]  := 0; // ID_ACREDITADO;
    ColWidths[C_COLGRIDMONEDA]       := 0; // CVE_MONEDA
    End;

   With StringGrid1 Do
    Begin
    Cells[0,0] := 'Imp. Nominal';
    ColWidths[0] := C_WIDTH_DINERO;
    Cells[1,0] := 'Imp. Aforado';
    ColWidths[1] := C_WIDTH_DINERO;
    End;

    nRow := 1;
    While Not Eof Do
     Begin
     StringGrid.Cells[C_COLGRID_CARGAR     ,nRow] := C_APLICA;
     StringGrid.Cells[C_COLGRIDTOTALDOCS   ,nRow] := FieldByName('TOTAL_DOCS').AsString;
     StringGrid.Cells[C_COLGRIDDESC_MONEDA ,nRow] := FieldByName('DESC_MONEDA').AsString;
     StringGrid.Cells[C_COLACUSE           ,nRow] := FieldByName('ID_ACUSE').AsString;
     StringGrid.Cells[C_COLGRID_EPO        ,nRow] := FieldByName('NOMBRE_EPO').AsString;
     StringGrid.Cells[C_COLGRID_ACREDITADO ,nRow] := FieldByName('ID_ACREDITADO').AsString;
     StringGrid.Cells[C_COLGRIDMONEDA      ,nRow] := FieldByName('CVE_MONEDA').AsString;

     StringGrid1.Cells[0,nRow] := FieldByName('IMP_NOMINAL').AsString;
     StringGrid1.Cells[1,nRow] := FieldByName('IMP_AFORADO').AsString;
     Inc(nRow);
     Next;
     End;

    // Ajusta el Grid con los resultados mostrados
    If (nRow > 1) Then  StringGrid.RowCount := nRow
    Else StringGrid.RowCount := 2;
    StringGrid1.RowCount := StringGrid.RowCount;

    If (Trim(StringGrid.Cells[C_COLACUSE,1]) = '') Then
     ShowMessage('No existen Acuses por Aplicar');
   Finally
    Close;
    Free;
   End;
end;
//
procedure TWCrArchNaf.LoadAcusesByOptionDate;

  function Get_FilterByFecha(dtpFrom, dtpTo : TDateTimePicker; cbxFilter : TComboBox; strField : String) : String;
  var strSign : String;
  begin
   If UpperCase(Trim(cbxFilter.Text)) = 'ENTRE' Then
    Result := ' TRUNC('+strField+') BETWEEN TO_DATE('#39+FormatDateTime(CFORMAT_FECHA,dtpFrom.Date)+#39+
              ','#39+CFORMAT_FECHA+#39') AND TO_DATE('#39+FormatDateTime(CFORMAT_FECHA,dtpTo.Date)+#39','#39+CFORMAT_FECHA+#39') '
   Else
    Begin
    Case cbxFilter.ItemIndex Of
      1 : strSign := '<';
      2 : strSign := '>';
      3 : strSign := '<=';
      4 : strSign := '>=';
    Else
      strSign := '=';
    End;
    Result := ' TRUNC('+strField+') '+strSign+
              ' TO_DATE('#39+FormatDateTime(CFORMAT_FECHA,dtpTo.Date)+#39','#39+CFORMAT_FECHA+#39') ';
    End;
  end;

var QryFilter : TQuery;
    strAcuses, strComa : String;
begin
  QryFilter := TQuery.Create(Self);
  strAcuses := ''; strComa := '';
  m_bLoaded := False;
  m_nId_Carga_NAFIN := 0;
  
  If Assigned(QryFilter) Then
   With QryFilter Do
    Try
     DatabaseName := Objeto.DatabaseName;
     SessionName  := Objeto.SessionName;
     SQL.Clear;
     SQL.Add(' SELECT DISTINCT(ID_ACUSE) FROM CR_CARGA_NAFIN '#13#10+
             ' WHERE '+Get_FilterByFecha(dtpFrom, dtpTo, cbxFilter ,'F_CARGA'));
     Open;
     While Not Eof Do
      Begin
      strAcuses := strAcuses + strComa + #39 + FieldByName('ID_ACUSE').AsString + #39;
      strComa := ', ';
      Next;
      End;

    Finally
     Close; Free;
    End;

  If (Trim(strAcuses) = '') Then
   ShowMessage('No se encontraron Acuses en ese Rango de Fechas...')
  Else
   Begin
    If (LoadAcuses(strAcuses) = 0) Then
     Begin
     m_bLoaded := True; // Indica que ya fueron cargados los Acuses
     Acuses := strAcuses;
     RevalidateDocuments;
     LoadErrors(strAcuses);
     End;
   End;
end;
//
procedure TWCrArchNaf.EnableControls(GroupBox : TGroupBox; bEnabled : Boolean);
var I : Integer;
begin
 With GroupBox Do
  For I := 0 To ControlCount - 1 Do
   Begin
   Controls[I].Enabled := bEnabled;
   If (Controls[I] Is TEdit) Then
    Begin
    If bEnabled Then (Controls[I] As TEdit).Color := clWindow
    Else (Controls[I] As TEdit).Color := clBtnFace;
    End;

   If (Controls[I] Is TDateTimePicker) Then
    Begin
    If bEnabled Then (Controls[I] As TDateTimePicker).Color := clWindow
    Else (Controls[I] As TDateTimePicker).Color := clBtnFace;
    End;

   If (cbxFilter.Enabled) Then cbxFilter.Color := $00FFD9B3
   Else cbxFilter.Color := clBtnFace;

   If (edId_Acuse.Enabled) Then
    Begin
    edId_Acuse.Color := $00F0F0F0;    
    edNom_Archivo.Color := $00F0F0F0;
    End;
   End;
end;
//
procedure TWCrArchNaf.LoadErrors(strAcuses : String = ''; nId_Carga_Nafin : Integer = 0);
var nDocsAC, nDocsER, nDocsAP, nTotalAcuses : Integer;
    strOpcion, strMsgAcuse : String;
begin
 If (nId_Carga_Nafin > 0) Then
  Begin
  GiveAcuses(nId_Carga_Nafin, strAcuses);
  edLoadedFileName.Text := '"'+edFileName.Text+'"';
  edLoadedFileName.Visible := True;
  strOpcion := 'del Archivo';
  End
 Else
  Begin
  edLoadedFileName.Visible := False;
  strOpcion := 'de la Consulta';
  End;

 lblOpcion.Caption := strOpcion + ' =';
 lblStep2.Caption := 'Al realizar la Carga de los Acuses '+strOpcion+#13#10+
                     'se encontraron los siguientes documentos con Errores...';

 Acuses := strAcuses;
 LoadDataErrors(strAcuses, nDocsAC, nDocsER, nDocsAP);
 edAcusesAC.Text := IntToStr(nDocsAC);
 edAcusesER.Text := IntToStr(nDocsER);
 edAcusesAP.Text := IntToStr(nDocsAP);
 nTotalAcuses := memAcuses.Lines.Count;
 edTotalAcuses.Text := IntToStr(nTotalAcuses);

 // Si Existen errores en el Archivo de NAFIN mandalos a la página de Errores
 // de lo contrario se va a la página de Aplicar Archivo...
 If (nDocsER > 0) Then
  Begin
  PageControl.ActivePageIndex := 1;

  If (nId_Carga_Nafin > 0) Then
   Begin
      If (nDocsER = 1) Then ShowMessage(' Se encontró 1 error en el Archivo. Favor de Corregirlo')
      Else ShowMessage('Se encontraron '+IntToStr(nDocsER)+' errores en el Archivo. Favor de Corregirlos ...');
   End
  Else
   Begin
      If (nTotalAcuses = 1) Then strMsgAcuse := 'el Acuse Seleccionado'
      Else strMsgAcuse := 'los Acuses Seleccionados';

      If (nDocsER = 1) Then ShowMessage(' Se encontró 1 error en los Acuses. Favor de Corregirlos')
      Else ShowMessage('Se encontraron '+IntToStr(nDocsER)+' errores en '+strMsgAcuse+'. Favor de Corregirlos ...');
   End;

  End
 Else PageControl.ActivePageIndex := 2;
end;
//
procedure TWCrArchNaf.RevalidateDocuments;

 procedure CreateStpRevalidaAcuse(var Stp : TStoredProc);
 begin
  Stp := TStoredProc.Create(Self);
  If Assigned(Stp) Then
   Begin
    Stp.DatabaseName := Objeto.DatabaseName;
    Stp.SessionName  := Objeto.SessionName;
    Stp.StoredProcName := 'PKGCRPERIODO.STPREVALIDAACUSE';
    With Stp Do
     Begin
      Params.CreateParam(ftString,'PECVE_FND_ENT_DES',ptInput);
      Params.CreateParam(ftString,'PEID_ACUSE',ptInput);
      Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
      Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
      Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
     End;
   End;
  end;

var I : Integer;
    strAcuses : String;
    aAcuses : TArraYString;
    StpRevalidaAcuse : TStoredProc;
begin
 CreateStpRevalidaAcuse(StpRevalidaAcuse);
 Objeto.AsignaEntidadDescontadora(StpRevalidaAcuse, 'PECVE_FND_ENT_DES');

 If Assigned(StpRevalidaAcuse) Then
  With StpRevalidaAcuse Do
   Try
    strAcuses := Acuses;
    ParseStr(aAcuses,strAcuses,C_SEPARATOR);
    For I := 0 To High(aAcuses) Do
     Begin
     ParamByName('PEID_ACUSE').AsString := TrimChar(aAcuses[I],#39);
     ParamByName('PEBCOMMIT').AsString := 'V';
     ExecProc;
     Application.ProcessMessages;
     End;
   Finally
    SetLength(aAcuses,0);
    Close;
    Free;
   End;
end;
//
procedure TWCrArchNaf.ShowProgress;
begin
 lblCount.Caption := IntToStr(m_nCount)+' de '+IntToStr(m_nMaxCount);
end;
//
procedure TWCrArchNaf.Set_Count(nValue: Integer);
begin
 If (m_nCount <> nValue) Then
  Begin
  m_nCount := nValue;
  ProgressBar.Position  := m_nCount;
  ShowProgress;
  End;
end;
//
procedure TWCrArchNaf.Set_MaxCount(nValue: Integer);
begin
 If (m_nMaxCount <> nValue) Then
  Begin
  m_nMaxCount := nValue;
  ProgressBar.Max := m_nMaxCount;
  ShowProgress;
  End;
end;
//
procedure TWCrArchNaf.tbshAplicarShow(Sender: TObject);
var GridRect : TGridRect;
begin
  if Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CADENA then begin
    LoadAcuses(Acuses);
  end else if Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CRPYME then begin
    LoadPYMEAcuses(Acuses);
  end;


 With StringGrid Do
  Begin
  SetFocus;
  GridRect.Left   := C_COLLINEA;
  GridRect.Top    := 1;
  GridRect.Right  := C_COLLINEA;
  GridRect.Bottom := 1;
  Selection := GridRect;
  Col := C_COLLINEA;
  Row := 1;
  End;
end;
//
procedure TWCrArchNaf.PageControlChanging(Sender: TObject; var AllowChange: Boolean);
begin
 If (PageControl.ActivePageIndex = 0) And Not (m_bLoaded) Then
  Begin
   AllowChange := False;
   ShowMessage('Debe de Realizar la carga de un Archivo o la selección de un Acuse para poder continuar...');
   PageControl.ActivePageIndex := 0;
  End
end;
//
function TWCrArchNaf.GetEmisorByCveNAFIN(strCVE_EMISOR_NAFIN : String) : Integer;
var Qry : TQuery;
begin
Qry := TQuery.Create(Self); Result := 0;
If Assigned(Qry) Then
 With Qry Do
  Try
   DataBaseName := Objeto.DataBaseName;
   SessionName := Objeto.SessionName;
   SQL.Clear;
{ROIM  09042007 CAMBIO POR EMISOR NAFIN}
//   SQL.Add('SELECT ID_ACREDITADO FROM CR_EMISOR WHERE CVE_EMISOR_NAFIN = '#39+strCVE_EMISOR_NAFIN+#39);
   SQL.Add(' SELECT ID_ACREDITADO FROM CR_EMISOR ' +
           ' WHERE  CVE_FND_ENT_DES = ' + #39 + objeto.ObtenEntidadDescontadoraNAFIN + #39 +
           ' AND    CVE_EMISOR_EXT  = ' + #39 + strCVE_EMISOR_NAFIN + #39);
{/ROIM}
   Open;
   Result := FieldByName('ID_ACREDITADO').AsInteger;
  Finally
   Close;
   Free;
  End;
end;

function TWCrArchNaf.GetProveedorByCveNAFIN(nID_PROV_NAFINSA : Integer) : Integer;
var Qry : TQuery;
begin
Qry := TQuery.Create(Self); Result := 0;
If Assigned(Qry) Then
 With Qry Do
  Try
   DataBaseName := Objeto.DataBaseName;
   SessionName := Objeto.SessionName;
   SQL.Clear;
{ROIM  09042007 CAMBIO POR EMISOR NAFIN}
//   SQL.Add('SELECT ID_ACREDITADO FROM CR_PROVEEDOR WHERE ID_PROV_NAFINSA =  '+IntToStr(nID_PROV_NAFINSA));
   SQL.Add(' SELECT ID_ACREDITADO FROM CR_PROVEEDOR ' +
           ' WHERE  CVE_FND_ENT_DES = ' + #39 + objeto.ObtenEntidadDescontadoraNAFIN + #39 +
           ' AND    ID_PROV_EXTERNO =  '+IntToStr(nID_PROV_NAFINSA));
{/ROIM}
   Open;
   Result := FieldByName('ID_ACREDITADO').AsInteger;
  Finally
   Close;
   Free;
  End;
end;
//
function TWCrArchNaf.GetPromotorByEmiProv(nID_EMISOR, nID_PROVEEDOR : Integer) : Integer;
var Qry : TQuery;
begin
Qry := TQuery.Create(Self); Result := 0;
If Assigned(Qry) Then
 With Qry Do
  Try
   DataBaseName := Objeto.DataBaseName;
   SessionName := Objeto.SessionName;
   SQL.Clear;
   SQL.Add( ' SELECT ID_PROMOTOR FROM CR_EMISOR_PROV '#13#10+
            ' WHERE CVE_FND_ENT_DES = ' + #39 + objeto.ObtenEntidadDescontadoraNAFIN + #39 +
            ' AND   ID_EMISOR = '+IntToStr(nID_EMISOR) +
            ' AND   ID_PROMOTOR = '+IntToStr(nID_PROVEEDOR));
   Open;
   Result := FieldByName('ID_PROMOTOR').AsInteger;
  Finally
   Close;
   Free;
  End;
end;
//
procedure TWCrArchNaf.Enable_Dtp_BySign(strSign: String; DtpFrom, DtpTo: TDateTimePicker);
begin
 If (Trim(strSign) <> '') Then
   If (UpperCase(strSign) = 'ENTRE') Then
    Begin
    DtpFrom.Visible := True;
    DtpFrom.Enabled := True;
    End
   Else
    Begin
    DtpFrom.Visible := False;
    DtpFrom.Enabled := False;
    End;
end;
//
procedure TWCrArchNaf.EnableDisableButtons;
var bEnabled : Boolean;
begin
  bEnabled := ( Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CADENA );
  btnEmisor.Enabled    := bEnabled;
  btnProveedor.Enabled := bEnabled;
  btnRelacionEmiProv.Enabled := bEnabled;
end;
//
function TWCrArchNaf.LoadPYMEAcuses(strAcuses: String): Integer;
var Qry : TQuery;
    nRow : Integer;
    strComa : string;
    vlsql : string;//ales
begin
  ClearGrid(StringGrid);
  ClearGrid(StringGrid1);

  Result := 0;
  If (Trim(StrAcuses) = '') Then
    Exit;

  strComa := '';
  Qry := TQuery.Create(Nil);
  If Assigned(Qry) Then
    With Qry Do
      Try
        // Se agrega agrupar por moneda 05042004 SATV4766

        vlsql :='SELECT CAN.F_CARGA, '  + coCRLF +
                '       CAN.ID_ACUSE, ' + coCRLF +
                '       CAN.ID_SIRAC, ' + coCRLF +
                '       PYME.NOMBRE, '  + coCRLF +
                '       '' '' TIPO_FACTORAJE, '  + coCRLF +
                '       DECODE(M.CVE_MONEDA, 484, ''PESO'', ' +coCRLF+
                '                            840, ''DLLS'', ' +coCRLF+
                '                            M.CVE_MONEDA) AS DESC_MONEDA, ' +coCRLF+
                '       M.CVE_MONEDA        , ' +coCRLF+
                '       SUM(CAN.IMP_DOCUMENTO) AS IMP_NOMINAL, ' +coCRLF+
                '       SUM(CAN.IMP_DESCUENTO) AS IMP_AFORADO, ' +coCRLF+
                '       COUNT(*) AS TOTAL_DOCS, ' +coCRLF+
                '       PYME.ID_ACREDITADO ' +coCRLF+
                'FROM   CR_ARCHIVO_PYME CAN, ' +coCRLF+
{ROIM  09042007 CAMBIO POR EMISOR NAFIN}
//                '       (SELECT PROV.ID_ACREDITADO, PROV.ID_PROV_NAFINSA, P.NOMBRE ' +coCRLF+
                '       (SELECT PROV.ID_ACREDITADO, PROV.ID_PROV_EXTERNO, P.NOMBRE ' +coCRLF+
{/ROIM}
                '        FROM   CR_PROVEEDOR PROV, PERSONA P ' +coCRLF+
                '        WHERE  P.ID_PERSONA = PROV.ID_ACREDITADO ' +coCRLF+
                '       )PYME, ' +coCRLF+
                '       (SELECT GC.CVE_REFERENCIA CVE_MONEDA_NAFIN, '     + coCRLF +
                '                  MC.CVE_CORP CVE_MONEDA '         + coCRLF +
                '        FROM   CR_GRUPO_CLAVE GC, '                + coCRLF +
                '                  CR_MAPEO_CLAVE MC '              + coCRLF +
                '        WHERE  GC.CVE_GRUPO_CLAVE = ''MOPYME''  '  + coCRLF +
                '          AND  GC.CVE_GRUPO_CLAVE = MC.CVE_GRUPO_CLAVE ' + coCRLF +
                '          AND  GC.CVE_REFERENCIA  = MC.CVE_CLAVE ' + coCRLF +
                '       )M ' +coCRLF+
                {
                '       (SELECT VALOR CVE_MONEDA_NAFIN, CVE_REFERENCIA CVE_MONEDA ' +coCRLF+
                '        FROM   CR_GRUPO_CLAVE ' +coCRLF+
                '        WHERE  CVE_GRUPO_CLAVE = ''MOPYME'' ' +coCRLF+
                '       )M ' +coCRLF+
                }
                'WHERE  CAN.SIT_ARCHIVO = ''AC'' ' +coCRLF+
                '  AND  CAN.ID_ACUSE IN (' + strAcuses + ')'+coCRLF+
                '  AND  CAN.ID_ACUSE NOT IN ( SELECT ID_ACUSE ' +coCRLF+
                '                             FROM CR_ARCHIVO_PYME ' +coCRLF+
                '                             WHERE ID_ACUSE IN (' + strAcuses + ')'+coCRLF+
                '                               AND SIT_ARCHIVO IN (''ER'',''AP'') ' +coCRLF+
                '                               AND F_CARGA BETWEEN ' + SQLFecha( Objeto.F_CARGA_PYME_INI.AsDateTime ) + coCRLF +
                '                                               AND ' + SQLFecha( Objeto.F_CARGA_PYME_FIN.AsDateTime ) + coCRLF +
                '                             GROUP BY ID_ACUSE ' +coCRLF+
                '                         ) ' + coCRLF+
{ROIM  09042007 CAMBIO POR EMISOR NAFIN}
//                '   AND CAN.ID_SIRAC    = PYME.ID_PROV_NAFINSA(+) ' +coCRLF+
                '   AND CAN.ID_SIRAC    = PYME.ID_PROV_EXTERNO(+) ' +coCRLF+
{/ROIM}
                '   AND CAN.CVE_MONEDA  = M.CVE_MONEDA_NAFIN  (+) ' +coCRLF+
                '   AND CAN.F_CARGA BETWEEN ' + SQLFecha( Objeto.F_CARGA_PYME_INI.AsDateTime ) + coCRLF +
                '                       AND ' + SQLFecha( Objeto.F_CARGA_PYME_FIN.AsDateTime ) + coCRLF +
                '   GROUP BY CAN.F_CARGA, CAN.ID_ACUSE, CAN.ID_SIRAC, PYME.NOMBRE, M.CVE_MONEDA, PYME.ID_ACREDITADO' + coCRLF +
                '   ORDER BY CAN.F_CARGA, CAN.ID_ACUSE, CAN.ID_SIRAC, PYME.NOMBRE, M.CVE_MONEDA, PYME.ID_ACREDITADO';

        DataBaseName := Objeto.DataBaseName;
        SessionName := Objeto.SessionName;
        SQL.Clear;
        SQL.Add(vlSql);
        Open;

        StringGrid.RowCount := 2003;
        StringGrid.ColCount := 12; // <SATV4766 16Jun2008>
        StringGrid1.RowCount := StringGrid.RowCount;
        StringGrid1.ColCount := 2;

        With StringGrid Do
        Begin
          Cells[C_COLGRID_CARGAR     ,0] := 'Cargar';
          Cells[C_COLACUSE           ,0] := 'Acuse';
          Cells[C_COLGRID_EPO        ,0] := 'Acreditado';
          Cells[C_COLGRIDDESC_MONEDA ,0] := 'Mon.';
          Cells[C_COLGRIDTOTALDOCS   ,0] := 'Docs.';
          Cells[C_COLGRID_LINEA      ,0] := C_LINEA;
          Cells[C_COLGRID_TITULAR    ,0] := 'Titular de la Autorización';
          Cells[C_COLGRIDFOLCTTO     ,0] := 'Folio Contrato';
          Cells[C_COLGRIDFCARGA      ,0] := 'Fecha de Carga';
          Cells[C_COLGRIDCVEEMISOREXT,0] := 'Cve. Emisor Ext'; // <SATV4766 16Jun2008>

          ColWidths[C_COLGRID_CARGAR]      := 20;
          ColWidths[C_COLACUSE]            := 91;
          ColWidths[C_COLGRID_EPO]         := 165;
          ColWidths[C_COLGRIDDESC_MONEDA]  := 40;
          ColWidths[C_COLGRIDTOTALDOCS]    := 29;
          ColWidths[C_COLGRID_LINEA]       := 101;
          ColWidths[C_COLGRID_TITULAR]     := 138;
          ColWidths[C_COLGRID_ACREDITADO]  := 0; // ID_ACREDITADO;
          ColWidths[C_COLGRIDMONEDA]       := 0; // CVE_MONEDA
          ColWidths[C_COLGRIDFOLCTTO]      := 0; // FOLIO CTTO
          ColWidths[C_COLGRIDFCARGA]       := 0; // F CARGA
          ColWidths[C_COLGRIDCVEEMISOREXT] := 0; // <SATV4766 16Jun2008>
        End;

        With StringGrid1 Do
        Begin
          Cells[0,0] := 'Imp. Documento';
          ColWidths[0] := C_WIDTH_DINERO;
          Cells[1,0] := 'Imp. Descuento';
          ColWidths[1] := C_WIDTH_DINERO;
        End;

        nRow := 1;
        While Not Eof Do
        Begin
          StringGrid.Cells[C_COLGRID_CARGAR     ,nRow] := C_APLICA;
          StringGrid.Cells[C_COLGRIDTOTALDOCS   ,nRow] := FieldByName('TOTAL_DOCS').AsString;
          StringGrid.Cells[C_COLGRIDDESC_MONEDA ,nRow] := FieldByName('DESC_MONEDA').AsString;
          StringGrid.Cells[C_COLACUSE           ,nRow] := FieldByName('ID_ACUSE').AsString;
          StringGrid.Cells[C_COLGRID_EPO        ,nRow] := FieldByName('NOMBRE').AsString;
          StringGrid.Cells[C_COLGRID_ACREDITADO ,nRow] := FieldByName('ID_ACREDITADO').AsString;
          StringGrid.Cells[C_COLGRIDMONEDA      ,nRow] := FieldByName('CVE_MONEDA').AsString;

          //
          StringGrid.Cells[C_COLGRIDFOLCTTO     ,nRow] := '1';
          StringGrid.Cells[C_COLGRIDFCARGA      ,nRow] := FieldByName('F_CARGA').AsString;

          StringGrid1.Cells[0,nRow] := FieldByName('IMP_NOMINAL').AsString;
          StringGrid1.Cells[1,nRow] := FieldByName('IMP_AFORADO').AsString;
          Inc(nRow);
          Next;
        End;
        // Ajusta el Grid con los resultados mostrados
        If (nRow > 1) Then
          StringGrid.RowCount := nRow
        Else
          StringGrid.RowCount := 2;
        //ENDS_IF
        StringGrid1.RowCount := StringGrid.RowCount;

        If (Trim(StringGrid.Cells[C_COLACUSE,1]) = '') Then
          ShowMessage('No existen Acuses por Aplicar');
      Finally
        Close;
        Free;
      End;
end;
//
function TWCrArchNaf.LoadFilePYME( strFileName: String; sTokenTexto: Char; var nIdCargaPYME : Integer) : Integer;
  //
  function CheckFooterFilePYME(var nRecordNumber : Integer) : Boolean;
  var F          : TextFile;
      bOpen      : Boolean;
      sBuffer    : String;
      aBuffer    : TArrayString;
      nTokens    : Integer;
      strRowType : String;
      nTotalRec  : Integer;
      aTotal     : TArrayString;
  begin
    bOpen := False;
    try
      {$I-}
      nRecordNumber := -1;        // No se cuenta el Header
      nTotalRec     :=  0;
      AssignFile( F, strFileName );
      FileMode := 0;
      Reset( F );
      bOpen := True;
      while not eof( F ) do         // Barremos el Archivo de NAFIN PYME
      begin
        ReadLn( F, sBuffer );
        nTokens := ParseQuotedString( aBuffer, sBuffer, C_SEPARATOR, sTokenTexto );
        if nTokens > 0 then begin
           strRowType := aBuffer[ low( aBuffer ) ];
           if ( UpperCase( strRowType ) = UpperCase( C_TOT_CTE ) ) then
           begin
             // Lee del renglón de totales la cantidad de registros reportada en el archivo (1)
             nTotalRec := StrToIntDef( aBuffer[ 1 ], 0 );
             Break;
           end else
              Inc(nRecordNumber)
           //ends_if_(_strRowType_=_C_DETALLE_)_then
        end;
      end;
      //
      Result := (nRecordNumber > 0);
      {
      Result := (nRecordNumber > 0) And (nTotalRec > 0) And (nTotalRec = nRecordNumber);
      //
      if ( nTotalRec <> nRecordNumber ) then
      begin
        if (nTotalRec < nRecordNumber) then
          sBuffer := 'menor'
        else
          sBuffer := 'mayor';
        //ends_if
        ShowMessage('El Achivo NAFIN Reporta un Número de registros '+ sBuffer +
                    ' al Indicado. '#13#10+ 'Se Reportan ' + IntToStr( nTotalRec ) +
                    ' registros y existen en el archivo '+ IntToStr(nRecordNumber));
      end;
      }
  Finally
   If bOpen Then CloseFile(F);
   {$I+}
   SetLength(aBuffer,0);
  End;
 end;




var bOpen : Boolean;
    strBufHeader, strBufCaptions, strBuf,
    strParamName, strValue, strDefaultValue,
    strFileFieldName, strFieldName, strComa,
    strB_OBLIGATORIO, strFiles, strMsg, strMsg1 : String;

    I, J, N, nCount, nMaxCount, nMaxLength, nFileCol, nErrorsLoad : Integer;

    aCaptions, aBuffer, aRelationKey : TArrayString;
    StrLstAcuses : TStringList;
    StpAcusePYME : TStoredProc;
    F : TextFile;
begin
  Result   := 0;
  bOpen    := False;
  //
  if not CheckFooterFilePYME( nMaxCount ) then
  begin
    Result := 1;
    ShowMessage('El Formato del Archivo no es Correcto... o no Corresponde con un Archivo NAFIN');
    Exit;
  end;
  //
  nErrorsLoad := 0;
  Count    := 0;
  MaxCount := nMaxCount;
  StrLstAcuses := Nil;

  { Abrimos el archivo únicamente de lectura }
  Try
    {$I-}
    AssignFile( F, strFileName );
    FileMode := 0;
    Reset(F);
    bOpen := True;
    ReadLn( F, strBufCaptions );
    ParseQuotedString( aCaptions, strBufCaptions, C_SEPARATOR, sTokenTexto );
    Objeto.CreateStpAcusePYME(StpAcusePYME);  // Crea el StoreProcedure con sus Parametros de Entrada y de Salida
    Objeto.AsignaEntidadDescontadora(StpAcusePYME, 'PECVE_FND_ENT_DES'); // Asigna la entidad descontadora
    CreateRelationalKey(aRelationKey);        // Hace una lista de relación "Nombre Campo de Archivo" con "Nombre Campo Tabla"
    StrLstAcuses := TStringList.Create;

    if not Assigned(StpAcusePYME) then
      Result := 2 // Error
    else
    begin
      J := 0;
      while not Eof(F) do
      begin
        ReadLn( F, strBuf  );
        ParseQuotedString( aBuffer, strBuf, C_SEPARATOR, sTokenTexto );
        //
        // Si es el Registro de Totales del Archivo (Último Renglón) Termina...
        if ( UpperCase( aBuffer[ low(aBuffer) ] ) = UpperCase( C_TOT_CTE ) ) then
          break;
        // Limpia los parametros del Stored Procedure
        Objeto.ClearStpAcusePYME( StpAcusePYME );
        // Barro los Parámetros que me solicita el StoreProcedure desde el PEID_ACUSE hasta el PETIPO_SOLICITUD
        for I := 1 to StpAcusePYME.Params.Count - 8 do
        begin
          Application.ProcessMessages;
          strParamName := UpperCase(Trim(StpAcusePYME.Params[I].Name));
          strFieldName := Copy(strParamName,3,Length(strParamName));

          // Si no se debe tomar en cuenta la columna actual, CONTINÚA con la siguiente...
          If Not CanLoadColumnFile(aRelationKey,strFieldName, strB_OBLIGATORIO) Then
            Continue;

          // Encuentro el Nombre de la Columna que le corresponde al Archivo, con respecto a los parametros
          // solicitados del StoreProcedure (ver... tabla CR_CONF_ARC_NAF)
          if FindRelationalField(aRelationKey, strFieldName, strFileFieldName, nMaxLength, strDefaultValue) Then
          begin
            // Busco si en el Archivo Existe ese Nombre de Columna que le corresponde (Paso Anterior) para obtener el valor
            // de lo contrario uso mi valor default, definido en la tabla de CR_CONF_ARC_NAF
            if FindColumnFile(aCaptions, strFileFieldName, nFileCol) Then
              strValue := aBuffer[nFileCol]
            else
              strValue := '';
            //
            If (Trim(strValue) = '') Then
              strValue := strDefaultValue;
            //
            if (Length(strValue) > nMaxLength) then
            begin
              strMsg := 'Formato del Archivo Incorrecto.'#13#10 + 'El dato de la columna "' +
                        aCaptions[ nFileCol ] + '" del archivo es mayor que el establecido.';
              strMsg1:= 'Operación terminada por el usuario.';

              if (strB_OBLIGATORIO = 'V') then
              begin
                ShowMessage( strMsg + #13#10 + strMsg1 );
                Result := 3;
                Exit;
              end else
              begin
                if MessageDlg(strMsg + #13#10'¿Desea omitir este dato que no es obligatorio y continuar con la carga?',
                              mtConfirmation,[mbYes,mbNo],0) = mrYes then
                  Continue
                else begin
                  ShowMessage(strMsg1);
                  Result := 3;
                  Exit;
                end;
              end;
            end;


            case StpAcusePYME.ParamByName(strParamName).DataType of
              ftFloat    : begin
                             if (Trim(strValue) = '') then
                               StpAcusePYME.ParamByName(strParamName).AsFloat := 0
                             else
                               StpAcusePYME.ParamByName(strParamName).AsFloat := StrToFloat(strValue);
                             //ends_if
                           end;
              ftString   : StpAcusePYME.ParamByName(strParamName).AsString := strValue;
              ftDateTime : begin
                             if (Trim(strValue) = '') then
                               StpAcusePYME.ParamByName(strParamName).Clear
                             else
                               StpAcusePYME.ParamByName(strParamName).AsDateTime := StrToDate(Trim(strValue));
                           end;
            end;//ends_case
          end; // End If
        end; // End For
        //
        StpAcusePYME.ParamByName('PEF_CARGA').AsDateTime     := Objeto.Apli.DameFechaEmpresa;
        StpAcusePYME.ParamByName('PEB_COMMIT').AsString      := 'V';
        StpAcusePYME.ParamByName('PECVE_USU_ALTA').AsString  := Objeto.DameUsuario;
        StpAcusePYME.ParamByName('PENOM_ARCHIVO').AsString   := UpperCase(ExtractFileName(strFileName));
        StpAcusePYME.ExecProc;
        Inc(J);
        Count := J;

        if (StpAcusePYME.ParamByName('PSRESULTADO').AsInteger <> 0) then
        begin
          { Si el Acuse Ya Existe }
          if (StpAcusePYME.ParamByName('PSRESULTADO').AsInteger = C_ERROR_CARGA_ACUSE_YA_APLICADOS) then
          begin
            Inc(nErrorsLoad);
            // Agrega a una lista los Acuses ya Aplicados en el Archivo
            AddAcuse(StrLstAcuses, StpAcusePYME.ParamByName('PEID_ACUSE').AsString);
          end else if (StpAcusePYME.ParamByName('PSRESULTADO').AsInteger = C_ERROR_INSERT) or
                      (StpAcusePYME.ParamByName('PSRESULTADO').AsInteger = C_ERROR_INSERT_CARGA) then
          begin
            ShowMessage(StpAcusePYME.ParamByName('PSTXRESULTADO').AsString);
            ShowMessage('El Formato del Archivo Posiblemente tenga Errores. Proceso Abortado...');
            Result := 1;
            Exit;
          end;
        end;

        if (StpAcusePYME.ParamByName('PSTXRESULTADO').AsString <> CNULL) Then
        begin
          ShowMessage(StpAcusePYME.ParamByName('PSTXRESULTADO').AsString);
        end;
        //
        nIdCargaPYME := StpAcusePYME.ParamByName('PSIDCARGANAFIN').AsInteger;
        Application.ProcessMessages;
      end; // End While
      //
    end; // End Else

    // Si el número de Registros del Archivo es Igual al Número de Registros que no se Cargaron entonces...
    if (nErrorsLoad = Count) then
    begin
      // Concatena los Acuses encontrados en el Archivo
      strBuf := ''; strComa := '';
      for N := 0 To StrLstAcuses.Count - 1 do
      begin
        strBuf := strBuf + strComa + #39 + StrLstAcuses[N] + #39;
        strComa := ' ,';
      end;
      // Arma Mensaje de Error
      strFiles := GetFileNameAcuses(strBuf, nCount);
      strMsg   := 'Los acuses "'+strBuf+'" de este archivo ya fueron Aplicados Previamente '#13#10;
      If (nCount > 1) Then
        strMsg := strMsg +  'los archivos : ' + strFiles + #13#10
      Else
        strMsg := strMsg +  'en el archivo : '+ strFiles + #13#10;
      //ends_if
      strMsg := strMsg + 'No existen Documentos por Aplicar de este Archivo.';
      //
      ShowMessage(strMsg);
      Count := 0;
      Result := 1;
    end;
    //
  Finally
    {$I+}
    If bOpen Then CloseFile(F);
    If Assigned(StpAcusePYME) Then StpAcusePYME.Free;
    If Assigned(StrLstAcuses) Then Begin StrLstAcuses.Clear; StrLstAcuses.Free; End;
    //
    SetLength(aRelationKey,0);
    SetLength(aCaptions,0);
    SetLength(aBuffer,0);
  End;
end;
//
function TWCrArchNaf.LoadPYMEDataErr(strAcuses: String; var nDocsAC, nDocsER, nDocsAP: Integer): Integer;
var Qry : TQuery;
    nCol, nRow : Integer;
    strCaption, strTopicSit_Archivo : String;
begin
  Result := 0;
  Qry := TQuery.Create(Self);
  If Assigned(Qry) Then
  begin
    with Qry do
    begin
      try
        DatabaseName := Objeto.Apli.DatabaseName;
        SessionName  := Objeto.Apli.SessionName;
        SQL.Clear;
        SQL.Add(
                'SELECT'#13#10+
                '  SIT_ARCHIVO        As "Sit.",'#13#10+
                '  ID_ACUSE           As "Número de Acuse",'#13#10+
                '  ID_SIRAC           As "Núm. SIRAC",'#13#10+
                '  ID_DOCUMENTO       As "Núm Doc.",'#13#10+
                '  IMP_DOCUMENTO      As "Imp. Documento",'#13#10+
                '  IMP_DESCUENTO      As "Imp. Descuento",'#13#10+
                '  F_EMISION          As "Fecha Emisión",'#13#10+
                '  F_VENCTO_DOCTO     As "Fecha Venc.",'#13#10+
                '  CVE_MONEDA         As "Cve. Moneda",'#13#10+
                '  DESC_MONEDA        As "Moneda",'#13#10+
                '  ( F_VENCIMIENTO - F_OPERACION ) As "Días Plazo",'#13#10+
                '  TX_CAUSA_RECHAZO   As "Mensaje"'#13#10+
                'FROM CR_ARCHIVO_PYME '#13#10+
                'WHERE ID_ACUSE IN (' + strAcuses + ')'#13#10+
                '  AND F_CARGA BETWEEN ' + SQLFecha( Objeto.F_CARGA_PYME_INI.AsDateTime ) +
                                 ' AND ' + SQLFecha( Objeto.F_CARGA_PYME_FIN.AsDateTime ) +
                'ORDER BY SIT_ARCHIVO DESC'#13#10
               );
        Open;

        ClearGrid(strGrdDataErrors);
        ClearGrid(strGrdDataErrors1);
        strGrdDataErrors.ColCount := Fields.Count;
        strGrdDataErrors.RowCount := 2003;
        strGrdDataErrors1.ColCount := 2;
        strGrdDataErrors1.RowCount := strGrdDataErrors.RowCount;

        strGrdDataErrors.ColWidths [0]  := 28;                     // "Sit."
        strGrdDataErrors.ColWidths [1]  := 93;                     // "Número de Acuse"
        strGrdDataErrors.ColWidths [C_COLPYMESIRAC] := 67;         // "Núm. SIRAC"
        strGrdDataErrors.ColWidths [3]  := 56;                     // "Núm Doc."
        strGrdDataErrors.ColWidths [4]  := C_WIDTH_DINERO;         // "Imp. Doc."
        strGrdDataErrors.ColWidths [5]  := C_WIDTH_DINERO;         // "Imp. Desc."
        strGrdDataErrors.ColWidths [6]  := C_WIDTH_FECHA;          // "Fecha Emisión"
        strGrdDataErrors.ColWidths [7]  := C_WIDTH_FECHA;          // "Fecha Venc."
        strGrdDataErrors.ColWidths [8]  := 52;                     // "Cve. Moneda"
        strGrdDataErrors.ColWidths [9]  := 95;                     // "Moneda"
        strGrdDataErrors.ColWidths [10] := 64;                     // "Días Plazo"
        strGrdDataErrors1.ColWidths [C_COLMENSAJE] := 245;         // "Mensaje"

        strGrdDataErrors1.ColWidths [0] := 0;

        for nCol := 0 To Fields.Count - 2 do
          strGrdDataErrors.Cells[nCol,0] := Fields[nCol].FieldName;
        //
        strGrdDataErrors1.Cells[1,0] := Fields[Fields.Count - 1].FieldName;

        nRow := 1;  strTopicSit_Archivo := ''; nDocsAC := 0; nDocsER := 0; nDocsAP := 0;
        while not Eof do
        begin
          if (strTopicSit_Archivo <> FieldByName('Sit.').AsString) then
          begin
            { Genera el Header o Titulo de los Bloques de las Situaciones del ACUSE }
            strTopicSit_Archivo := FieldByName('Sit.').AsString;

            if (strTopicSit_Archivo = CSIT_ER) then
              strCaption  := 'Documentos con Error'
            else if (strTopicSit_Archivo = CSIT_AC) then
              strCaption := 'Documentos por Aplicar'
            else if (strTopicSit_Archivo = CSIT_AP) then
              strCaption := 'Documentos Ya Aplicados Anteriormente';
            //ends_if
            strGrdDataErrors.Cells[0,nRow] := strTopicSit_Archivo;
            strGrdDataErrors.Cells[1,nRow] := strCaption;
            Inc(nRow);
          end;

          for nCol := 0 To Fields.Count - 2 do
            strGrdDataErrors.Cells[nCol,nRow] := FieldByName(Fields[nCol].FieldName).AsString;
          //ends_for
          strGrdDataErrors1.Cells[0,nRow] := strTopicSit_Archivo;
          strGrdDataErrors1.Cells[C_COLMENSAJE,nRow] := FieldByName(Fields[Fields.Count - 1].FieldName).AsString; // Mensaje de Error

          Inc(nRow);
          If strTopicSit_Archivo = CSIT_AC Then Inc(nDocsAC);
          If strTopicSit_Archivo = CSIT_ER Then Inc(nDocsER);
          If strTopicSit_Archivo = CSIT_AP Then Inc(nDocsAP);
          //
          next;
        end;

        // Ajusta el Grid con los resultados mostrados
        if (nRow > 1) Then
          strGrdDataErrors.RowCount := nRow
        else
          strGrdDataErrors.RowCount := 2;
        //
        strGrdDataErrors1.RowCount := strGrdDataErrors.RowCount;

        strGrdDataErrors.Row := 1;
        strGrdDataErrors1.Row := 1;
      finally
        Close;
        Free;
      end;//ends_try
      //
    end;//ends_with_Qry_do
  end;//ends_If_Assigned(Qry)_Then
end;
//
procedure TWCrArchNaf.LoadPYMEErrors(strAcuses: String; nId_Carga_Nafin: Integer);
var nDocsAC,   nDocsER,   nDocsAP, nTotalAcuses : Integer;
    strOpcion, strMsgAcuse : String;
begin
  if (nId_Carga_Nafin > 0) then
  begin
    GiveAcuses(nId_Carga_Nafin, strAcuses);
    edLoadedFileName.Text := '"'+edFileName.Text+'"';
    edLoadedFileName.Visible := True;
    strOpcion := 'del Archivo';
  End Else Begin
    edLoadedFileName.Visible := False;
    strOpcion := 'de la Consulta';
  End;

  lblOpcion.Caption := strOpcion + ' =';
  lblStep2.Caption := 'Al realizar la Carga de los Acuses '+strOpcion+#13#10+
                      'se encontraron los siguientes documentos con Errores...';

  Acuses := strAcuses;
  LoadPYMEDataErr(strAcuses, nDocsAC, nDocsER, nDocsAP);
  edAcusesAC.Text := IntToStr(nDocsAC);
  edAcusesER.Text := IntToStr(nDocsER);
  edAcusesAP.Text := IntToStr(nDocsAP);
  nTotalAcuses := memAcuses.Lines.Count;
  edTotalAcuses.Text := IntToStr(nTotalAcuses);

  // Si Existen errores en el Archivo de NAFIN mandalos a la página de Errores
  // de lo contrario se va a la página de Aplicar Archivo...
  if (nDocsER > 0) then
  begin
    PageControl.ActivePageIndex := 1;

    if (nId_Carga_Nafin > 0) then
    begin
      if (nDocsER = 1) then
        ShowMessage(' Se encontró 1 error en el Archivo. Favor de Corregirlo')
      else
        ShowMessage('Se encontraron '+IntToStr(nDocsER)+' errores en el Archivo. Favor de Corregirlos ...');
    end
    else
    begin
      If (nTotalAcuses = 1) Then
           strMsgAcuse := 'el Acuse Seleccionado'
      Else
           strMsgAcuse := 'los Acuses Seleccionados';
      //ends_if

      If (nDocsER = 1) Then
           ShowMessage(' Se encontró 1 error en los Acuses. Favor de Corregirlos')
      Else
           ShowMessage('Se encontraron '+IntToStr(nDocsER)+' errores en '+strMsgAcuse+'. Favor de Corregirlos ...');
      //ends_if

    end;//ends_if
  end else
    PageControl.ActivePageIndex := 2;
  //ends_if
end;
//
procedure TWCrArchNaf.RevalidatePYME;
  procedure CreateStpRevalidaPYME(var Stp : TStoredProc);
  begin
    Stp := TStoredProc.Create(Self);
    If Assigned(Stp) Then
    Begin
      Stp.DatabaseName := Objeto.DatabaseName;
      Stp.SessionName  := Objeto.SessionName;
      Stp.StoredProcName := 'PKGCRPERIODO.STPREVALIDAPYME';
      With Stp Do
      Begin
        Params.CreateParam(ftString,'PECVEENTDESC',ptInput);
        Params.CreateParam(ftString,'PEID_ACUSE',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
      End;
    End;
  end;
  //
var I : Integer;
    strAcuses : String;
    aAcuses : TArraYString;
    StpRevalidaPYME : TStoredProc;
begin
  CreateStpRevalidaPYME(StpRevalidaPYME);
  Objeto.AsignaEntidadDescontadora(StpRevalidaPYME, 'PECVEENTDESC');

  If Assigned(StpRevalidaPYME) Then
    with StpRevalidaPYME do
      Try
        strAcuses := Acuses;
        ParseStr(aAcuses,strAcuses,C_SEPARATOR);
        For I := 0 To High(aAcuses) Do
        Begin
          ParamByName('PEID_ACUSE').AsString := TrimChar(aAcuses[I],#39);
          ParamByName('PEBCOMMIT').AsString := 'V';
          ExecProc;
          Application.ProcessMessages;
        End;
      Finally
        SetLength(aAcuses,0);
        Close;
        Free;
      End;
end;
{
+------------------------------------------------------------------------------+
|                                                                              |
|                                                                              |
|                                                                              |
+------------------------------------------------------------------------------+
}
procedure TWCrArchNaf.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.Control := edCVE_FORMATO_NAF;
  Objeto.CrFrmtoNaf.DESC_L_FORMATO.Control  := edDESC_C_FORMATO;
  Objeto.MInstDesc.CVE_FND_ENT_DES.Control := edCVE_ENT_DESC;
  Objeto.MInstDesc.DESC_ENT_DES.Control := edDESC_ENT_DESC;

  dtpTo.Date := Apli.DameFechaEmpresa;
  dtpFrom.Date  :=  dtpTo.Date;

  CargaNafin.ID_ACUSE.Control := edId_Acuse;
  CargaNafin.NOM_ARCHIVO.Control := edNom_Archivo;
  End;
  //
  if Objeto.InputFormat <> '' then
     if Objeto.CrFrmtoNaf.FindKey([Objeto.InputFormat]) then
        EnableDisableButtons;
     //ends_if
  //ends_if
  cbTokenTexto.ItemIndex := 0;
end;
//
procedure TWCrArchNaf.FormDestroy(Sender: TObject);
begin
  Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.Control := nil;
  Objeto.CrFrmtoNaf.DESC_L_FORMATO.Control  := nil;
  Objeto.MInstDesc.CVE_FND_ENT_DES.Control := nil;
  Objeto.MInstDesc.DESC_ENT_DES.Control := nil;
end;
//
procedure TWCrArchNaf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 With Objeto Do
  Begin
  CargaNafin.ID_ACUSE.Control := edId_Acuse;
  CargaNafin.NOM_ARCHIVO.Control := edNom_Archivo;
  End;
end;
{
                  +   Grids del TabSheet 2   +
}
procedure TWCrArchNaf.strGrdDataErrorsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);

 const LIGHT_YELLOW = $00CCFFFF;
       LIGHT_GRAY = $00F0F0F0;
       NAMEGRIDERRORS = 'strGrdDataErrors';

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
    str : String;
    bNoExistenDatos : Boolean;
    dValue : Double;
begin
 If (Sender Is TStringGrid) And (ARow > 0) Then
  With (Sender As TStringGrid) Do
   Begin
    str := Cells[0,ARow];
    If (str = CSIT_AC) Then  Canvas.Font.Color := clBlack;
    If (str = CSIT_ER) Then  Canvas.Font.Color := clRed;
    If (str = CSIT_AP) Then  Canvas.Font.Color := clMaroon;
    If (gdSelected In State) Then Begin Canvas.Font.Color := clWhite; Canvas.Brush.Color := clNavy; End;

    bNoExistenDatos := (Trim(Cells[0,1]) = '');
    If ((bNoExistenDatos) Or ((Cells[1,ARow] <> '') And (Cells[2,ARow] = ''))) And (Name = NAMEGRIDERRORS) Then
     Begin
     Rect1 := Rect_(0, Rect.Top, Width,Rect.Bottom);
     Canvas.FillRect(Rect1);

     If bNoExistenDatos Then
      Begin
      Canvas.TextRect(Rect1, (Rect1.Right - Canvas.TextWidth(str)) div 2,Rect1.Top, CERROR_NOEXISTEN);
      End
     Else
      Begin
      str := Cells[1,ARow];
      Canvas.TextRect(Rect1, Rect1.Left + 10, Rect1.Top, str);
      End;

     End
    Else
     Begin

      With Sender As TStringGrid Do
       Begin
        If (ColWidths[ACol] = C_WIDTH_DINERO) Or (ColWidths[ACol] = C_WIDTH_TASA) Then
         Begin
           If (Trim(Cells[ACol, ARow]) <> '') Then dValue := StrToFloat(Cells[ACol, ARow])
           Else dValue := 0;
           If (ColWidths[ACol] = C_WIDTH_DINERO) Then str := Format(CFORMAT_DINERO,[dValue])
           Else str := Format(CFORMAT_TASA,[dValue]);

           Canvas.TextRect(Rect,Rect.Right - Canvas.TextWidth(str),Rect.Top,str)
         End
        Else
         Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);
       End;

     End;
  End; // End With
end;
// Grids del TabSheet 2
procedure TWCrArchNaf.strGrdDataErrorsSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);

 procedure SelectRect( Sender, Grid : TStringGrid; Rect : TGridRect );
   begin
     Rect.Right  := Grid.ColCount - 1;
     If Sender <> Grid then
      Grid.Selection := Rect;
   end;

var
  Rect : TGridRect;
begin
  Rect.Left   := 0 ;
  Rect.Top    := ARow;
  Rect.Bottom := ARow;

  if Sender is TStringGrid then
  begin
   SelectRect( Sender as TStringGrid, strGrdDataErrors, Rect );
   SelectRect( Sender as TStringGrid, strGrdDataErrors1, Rect );
  end;

 With strGrdDataErrors1 Do
  Begin
  Hint := Cells[C_COLMENSAJE,ARow];
  ShowHint := True;

    if Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CADENA then
    begin
      btnEmisor.Enabled := Trim(Hint) <> '';
      btnProveedor.Enabled := btnEmisor.Enabled;
      btnRelacionEmiProv.Enabled := btnEmisor.Enabled;
    end else if Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CRPYME then
    begin
      btnProveedor.Enabled := Trim(Hint) <> '';
      btnEmisor.Enabled := False;
      btnRelacionEmiProv.Enabled := False;
    end else
      MessageDlg(C_FMT_UNK, mtError, [mbOk], 0);
    //ends_if
  End;
end;
// Grids del TabSheet 2
procedure TWCrArchNaf.strGrdDataErrorsTopLeftChanged(Sender: TObject);

 procedure SelectTopRow( Sender, Grid : TStringGrid );
  begin
   if Sender <> Grid then
      Grid.TopRow := Sender.TopRow
  end;//ends_procedure

begin
 if Sender is TStringGrid then
 begin
    SelectTopRow( Sender as TStringGrid, strGrdDataErrors  );
    SelectTopRow( Sender as TStringGrid, strGrdDataErrors1 );
 end;
end;
// Grids del TabSheet 2 B
procedure TWCrArchNaf.strGrdDataErrors1KeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := #0;
end;

{
                  +   Grids del TabSheet 3   +
}

procedure TWCrArchNaf.StringGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var Bmp : TBitmap;
begin
If (ACol = 0) And (ARow > 0) Then
  If (Trim(StringGrid.Cells[0,ARow]) <> '') Then
   Begin
   Bmp := TBitmap.Create;
   If Assigned(Bmp) Then
    Begin

    If (StringGrid.Cells[0,ARow] = '1') Then ImgList.GetBitmap(1,Bmp)
    Else ImgList.GetBitmap(0,Bmp);
    StringGrid.Canvas.Draw(Rect.Left,Rect.Top,Bmp);

    Bmp.FreeImage;
    Bmp.Free;
    End;
   End;

  If (gdFocused In State) Then
  Begin
   If (StringGrid.Cells[ACol,0] = C_LINEA) Then
   Begin
   btnId_Contrato.Height := Rect.Bottom - Rect.Top;
   btnId_Contrato.Width  := btnId_Contrato.Height;
   btnId_Contrato.Left   := StringGrid.Left + Rect.Right - btnId_Contrato.Width + 1;
   btnId_Contrato.Top    := Rect.Top  + StringGrid.top + 2;
   End;
  End;
end;
// Grids del TabSheet 3
procedure TWCrArchNaf.StringGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Case Key Of
  32 : InvertCheck(StringGrid,0,StringGrid.Row);
 End;
end;
// Grids del TabSheet 3
procedure TWCrArchNaf.StringGridKeyPress(Sender: TObject; var Key: Char);
begin
// With StringGrid Do
//  If Col <> C_COLLINEA Then Key := #0;
 Key := #0;
end;
// Grids del TabSheet 3
procedure TWCrArchNaf.StringGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol, nRow : LongInt;
begin
 With StringGrid Do
  Begin
  MouseToCell(X,Y,nCol, nRow);
  If (nCol = 0) And (nRow > 0) Then
   InvertCheck(StringGrid,0,nRow);
  End;
end;
// Grids del TabSheet 3
procedure TWCrArchNaf.StringGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 CanSelect := ACol > 0;
 btnId_Contrato.Visible := True;
 If StringGrid.Focused Then
  Begin
  StringGrid1.Row := ARow;
  StringGrid1.TopRow := StringGrid.TopRow;
  End;
end;
// Grids del TabSheet 3
procedure TWCrArchNaf.StringGrid1TopLeftChanged(Sender: TObject);
 procedure SelectTopRow( Sender, Grid : TStringGrid );
  begin
   if Sender <> Grid then
      Grid.TopRow := Sender.TopRow
  end;//ends_procedure
begin
 if Sender is TStringGrid then
 begin
    SelectTopRow( Sender as TStringGrid, StringGrid  );
    SelectTopRow( Sender as TStringGrid, StringGrid1 );
 end;
end;
// Grids del TabSheet 3
procedure TWCrArchNaf.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var str : String;
    dValue : Double;
begin
  With Sender As TStringGrid Do
   Begin
   If (ARow > 0) Then
    Begin
    If (ColWidths[ACol] = C_WIDTH_DINERO) Or (ColWidths[ACol] = C_WIDTH_TASA) Then
     Begin
       str := Cells[ACol, ARow];
       If (Trim(str) <> '') Then dValue := StrToFloat(str)
       Else dValue := 0;

       If (ColWidths[ACol] = C_WIDTH_DINERO) Then str := Format(CFORMAT_DINERO,[dValue])
       Else str := Format(CFORMAT_TASA,[dValue]);

       Canvas.TextRect(Rect,Rect.Right - Canvas.TextWidth(str),Rect.Top,str)
     End
    Else
     Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);
    End;
   End;
end;
// Grids del TabSheet 3
procedure TWCrArchNaf.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 If StringGrid1.Focused Then
  Begin
  StringGrid.Row := ARow;
  StringGrid.TopRow := StringGrid1.TopRow;
  End;
end;

{
  + ------------------------------------------------------------------------ +
  |                                                                          |
  |                                                                          |
  + ------------------------------------------------------------------------ +
}
procedure TWCrArchNaf.ikCVE_FORMATO_NAFEjecuta(Sender: TObject);
begin
  if Objeto.CrFrmtoNaf.FindKey( [ ikCVE_FORMATO_NAF.Buffer ] )then
    EnableDisableButtons;
end;
//
procedure TWCrArchNaf.btnCVE_FORMATO_NAFClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRARCHNAF_FMTO',True,True) then
   begin
      if Objeto.CrFrmtoNaf.Busca then
        EnableDisableButtons;
   end;
end;
//
procedure TWCrArchNaf.btnCVE_FORMATO_NAFExit(Sender: TObject);
var VLMsg    : String;
    VlSalida : Boolean;
begin
  VLMsg := 'Favor de indicar el formato del archivo';
  VlSalida := False;
  if Objeto.CrFrmtoNaf.Active then
  begin
    if Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString <> '' then
    begin
      VLMsg    := '';
      VlSalida := True;
    end;//ends_if_Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString_<>_''_then
  end;//ends_if
  InterForma1.ValidaExit(edCVE_FORMATO_NAF, VlSalida, VLMsg, True );
end;
// Opcion carga de archivo
procedure TWCrArchNaf.opLoadAcuseClick(Sender: TObject);
begin
 EnableControls(gbxArchivo, opLoadFile.Checked);
 EnableControls(gbxLoadAcuse, opLoadAcuse.Checked);
 EnableControls(gbxLoadAcuseByDate, opLoadAcuseByDate.Checked);
end;
// Realizar Carga por Archivo 
procedure TWCrArchNaf.edFileNameChange(Sender: TObject);
begin
 btnLoadFile.Enabled := (Trim(edFilename.Text) <> '');
end;
// Realizar Carga por Archivo
procedure TWCrArchNaf.btnFileNameClick(Sender: TObject);
begin
 If OpenDialog.Execute Then
  Begin
  edFileName.Text := OpenDialog.FileName;
  Count := 0; MaxCount := 0;
  btnLoadFile.Enabled := True;
  If btnLoadFile.CanFocus Then btnLoadFile.SetFocus;
  End;
end;
// Realizar Carga por Archivo
procedure TWCrArchNaf.btnLoadFileClick(Sender: TObject);
var nError : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRARCHNAF_CARG1',True,True) then
   begin
      Merrores.Clear;
      if not Objeto.FiltroFmt then
      begin
        MessageDlg(C_MSG_FMT, mtWarning, [mbOk], 0);
        Exit;
      end;
      //
      // Si no existe el Archivo especificado se sale
      m_bLoaded := True; // False;
      m_nId_Carga_Nafin := 0;

      If Not FileExists(edFileName.Text) Or (Trim(edFileName.Text) = '') Then
      Begin
         If (Trim(edFileName.Text) <> '') Then
            ShowMessage('El archivo especificado no existe o no se encuentra Favor de Verificarlo...')
         Else
            ShowMessage('Falta Indicar el Archivo a Cargar');
         btnLoadFile.Enabled := False;
         If edFileName.CanFocus Then edFileName.SetFocus;
         Exit;
      End;
      ClearGrid(StringGrid);

      // Valida el tipo de formato
      if Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CADENA then begin
         nError := LoadFileNafin(edFileName.Text, m_nId_Carga_NAFIN);
         // Si no tuvo problemas al momento de Cargar entonces...
         If (nError = 0) Then
          Begin
          m_bLoaded := True; // Indica que ya fue cargado el Archivo a la Base de Datos correctamente
          LoadErrors('',m_nId_Carga_NAFIN);
          End;
      end else if Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CRPYME then begin
        Objeto.F_CARGA_PYME_INI.AsDateTime := Objeto.Apli.DameFechaEmpresa;
        Objeto.F_CARGA_PYME_FIN.AsDateTime := Objeto.F_CARGA_PYME_INI.AsDateTime;

        nError := LoadFilePYME(edFileName.Text, cbTokenTexto.Text[1], m_nId_Carga_NAFIN);
        // Si no tuvo problemas al momento de Cargar entonces...
        if (nError = 0) Then
        begin
          m_bLoaded := True; // Indica que ya fue cargado el Archivo a la Base de Datos correctamente
          LoadPYMEErrors('',m_nId_Carga_NAFIN);
        end;
        //
      end else
        MessageDlg(C_FMT_UNK, mtError, [mbOk], 0);
      //
   end;
end;
{ Cagar Acuse en Específico }
procedure TWCrArchNaf.btnID_ACUSEClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRARCHNAF_ACUSE',True,True) then
   begin
     With Objeto Do
      If CargaNafin.Busca Then
       If btnLoadAcuse.CanFocus Then btnLoadAcuse.SetFocus;
   end;    
end;
// Cagar Acuse en Específico
procedure TWCrArchNaf.btnLoadAcuseClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRARCHNAF_CARG2',True,True) then
   begin
      Merrores.Clear;
     if not Objeto.FiltroFmt then
     begin
       MessageDlg(C_MSG_FMT, mtWarning, [mbOk], 0);
       Exit;
     end;
     //
     If (Trim(edId_Acuse.Text) <> '') Then
      Begin

        // Valida el tipo de formato
        if Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CADENA then begin
           Acuses := edId_Acuse.Text;
           RevalidateDocuments;
           LoadErrors(#39+edId_Acuse.Text+#39);
        end else if Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CRPYME then begin
           // --
           // dbms_output.put_line(' ');
           // --
        end else
          MessageDlg(C_FMT_UNK, mtError, [mbOk], 0);
        //
      End
     Else
      Begin
      ShowMessage('Favor de Indicar un Acuse...');
      If (edId_Acuse.CanFocus) Then edId_Acuse.SetFocus;
      End;
   end;   
end;
{Cargar Acuses por Fecha}
procedure TWCrArchNaf.cbxFilterChange(Sender: TObject);
begin
 Enable_Dtp_BySign(cbxFilter.Text, dtpFrom, DtpTo);
end;
// Cargar Acuses por Fecha
procedure TWCrArchNaf.btnLoadAcusesClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRARCHNAF_CARG3',True,True) then
   begin
      Merrores.Clear;
     if not Objeto.FiltroFmt then
     begin
       MessageDlg(C_MSG_FMT, mtWarning, [mbOk], 0);
       Exit;
     end;
     //
     if Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CADENA then begin
       LoadAcusesByOptionDate;
     end else if Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CRPYME then begin
       // dbms_output.put_line(' ');
     end else
       MessageDlg(C_FMT_UNK, mtError, [mbOk], 0);
     //
   end;   
end;
// Catalogo de Emisor
procedure TWCrArchNaf.btnEmisorClick(Sender: TObject);
var CrEmisor : TCrEmisor;
    strCve_Emisor_Nafin,
    strNombre_Emisor : String;
    bHasError : Boolean;
    nID_EMISOR : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRARCHNAF_EMIS',True,True) then
   begin
     CrEmisor := TCrEmisor.Create(Self);
     Try
      CrEmisor.GetParams(Objeto);
      CrEmisor.ParamCre := Objeto.ParamCre;

      strCve_Emisor_Nafin := strGrdDataErrors.Cells[C_COLEPO, strGrdDataErrors.Row];
      strNombre_Emisor    := Trim(strGrdDataErrors.Cells[C_COLNOMEPO, strGrdDataErrors.Row]);
      bHasError := (strGrdDataErrors1.Cells[C_COLMENSAJE, strGrdDataErrors.Row] <> '');

      If bHasError Then
       Begin
         nID_EMISOR  := GetEmisorByCveNAFIN(strCve_Emisor_Nafin);
         If (nID_EMISOR <> 0) Then
         Begin
    {ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
    //         CrEmisor.FindKey([nID_EMISOR, strCve_Emisor_Nafin]);
             CrEmisor.FindKey([Objeto.ObtenEntidadDescontadoraNAFIN,nID_EMISOR, strCve_Emisor_Nafin]);
    {/ROIM}
             CrEmisor.Catalogo;
         End
         Else
          Begin
    {ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
    //      CrEmisor.strCve_Emisor_Nafin       := strCve_Emisor_Nafin;
          CrEmisor.strCve_Emisor_Ext       := strCve_Emisor_Nafin;
    {/ROIM}
          CrEmisor.strNombre_Emisor          := strNombre_Emisor;
    {ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
    //      CrEmisor.CVE_EMISOR_NAFIN.AsString := CrEmisor.strCve_Emisor_Nafin;
          CrEmisor.CVE_EMISOR_EXT.AsString := CrEmisor.strCve_Emisor_Ext;
    {/ROIM}
          CrEmisor.NOMBRE_EMISOR.AsString    := CrEmisor.strNombre_Emisor;
          CrEmisor.ShowWindow(ftGrid);
          End;
       End;

     Finally
      RevalidateDocuments;
      LoadErrors(Acuses,m_nId_Carga_NAFIN);
      If Assigned(CrEmisor) Then CrEmisor.Free;
     End;
   end;
end;
// Catalogo de Emisor
procedure TWCrArchNaf.btnProveedorClick(Sender: TObject);
var CrProveed : TCrProveed;
    nID_PROV_NAFINSA, nID_PROVEEDOR : Integer;
    strValue : String;
    bHasError : Boolean;
begin
   if Objeto.ValidaAccesoEsp('TCRARCHNAF_PROVE',True,True) then
   begin
      if Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CADENA then begin
         CrProveed := TCrProveed.Create(Self);
         Try
          CrProveed.GetParams(Objeto);
          CrProveed.ParamCre := Objeto.ParamCre;

          strValue := strGrdDataErrors.Cells[C_COLSIRAC, strGrdDataErrors.Row];
          bHasError := (strGrdDataErrors1.Cells[C_COLMENSAJE, strGrdDataErrors.Row] <> '');

          If IsInteger(strValue) And (bHasError) Then
           Begin
             nID_PROV_NAFINSA := StrToInt(strValue);
             nID_PROVEEDOR :=  GetProveedorByCveNAFIN(nID_PROV_NAFINSA);
             If (nID_PROVEEDOR <> 0) Then
              Begin
    {ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
    //          CrProveed.FindKey([nID_PROVEEDOR]);
              CrProveed.FindKey([Objeto.ObtenEntidadDescontadoraNAFIN,nID_PROVEEDOR]);
    {/ROIM}
              CrProveed.Catalogo;
              End
             Else
              Begin
    {ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
    //          CrProveed.nID_PROV_NAFINSA := nID_PROV_NAFINSA;
              CrProveed.nID_PROV_EXTERNO := nID_PROV_NAFINSA;
    //          CrProveed.ID_PROV_NAFINSA.AsInteger := CrProveed.nId_Prov_Nafinsa;
              CrProveed.ID_PROV_EXTERNO.AsInteger := CrProveed.nID_PROV_EXTERNO;
              CrProveed.m_sCVE_FND_ENT_DES := Objeto.ObtenEntidadDescontadoraNAFIN;
    {/ROIM}
              CrProveed.ShowWindow(ftGrid);
              End;
           End;

         Finally
          RevalidateDocuments;
          LoadErrors(Acuses,m_nId_Carga_NAFIN);
          If Assigned(CrProveed) Then CrProveed.Free;
         End;
      end else if Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CRPYME then begin
        CrProveed := TCrProveed.Create(Self);
        Try
          CrProveed.GetParams(Objeto);
          CrProveed.ParamCre := Objeto.ParamCre;

          strValue  :=  strGrdDataErrors.Cells [C_COLPYMESIRAC, strGrdDataErrors.Row];
          bHasError := (strGrdDataErrors1.Cells[C_COLMENSAJE,   strGrdDataErrors.Row] <> '');

          if IsInteger(strValue) and (bHasError) then
          begin
            nID_PROV_NAFINSA := StrToInt(strValue);
            nID_PROVEEDOR :=  GetProveedorByCveNAFIN(nID_PROV_NAFINSA);
            if (nID_PROVEEDOR <> 0) then
            begin
    {ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
    //          CrProveed.FindKey([nID_PROVEEDOR]);
              CrProveed.FindKey([Objeto.ObtenEntidadDescontadoraNAFIN,nID_PROVEEDOR]);
    {/ROIM}
              CrProveed.Catalogo;
            end
            else
            begin
    {ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
    //          CrProveed.nID_PROV_NAFINSA := nID_PROV_NAFINSA;
              CrProveed.nID_PROV_EXTERNO := nID_PROV_NAFINSA;
    //          CrProveed.ID_PROV_NAFINSA.AsInteger := CrProveed.nId_Prov_Nafinsa;
              CrProveed.ID_PROV_EXTERNO.AsInteger := CrProveed.nID_PROV_EXTERNO;
              CrProveed.m_sCVE_FND_ENT_DES := Objeto.ObtenEntidadDescontadoraNAFIN;
    {/ROIM}
              CrProveed.ShowWindow(ftGrid);
            End;
          End;

        finally
          RevalidatePYME;
          LoadPYMEErrors(Acuses,m_nId_Carga_NAFIN);
          If Assigned(CrProveed) Then
            CrProveed.Free;
        end;
      end else
        MessageDlg(C_FMT_UNK, mtError, [mbOk], 0);
      //ends_if
   end;
end;
// Catalogo de Emisor Proveedor
procedure TWCrArchNaf.btnRelacionEmiProvClick(Sender: TObject);
var CrEmiPro : TCrEmiPro;
    strCve_Proveedor_Nafin, strCve_Emisor_Nafin : String;
    nID_EMISOR, nID_PROVEEDOR : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRARCHNAF_EMPRV',True,True) then
   begin
     CrEmiPro := TCrEmiPro.Create(Self);
     Try
      CrEmiPro.GetParams(Objeto);
      CrEmiPro.ParamCre := Objeto.ParamCre;

      strCve_Emisor_Nafin    := strGrdDataErrors.Cells[C_COLEPO, strGrdDataErrors.Row];
      strCve_Proveedor_Nafin := strGrdDataErrors.Cells[C_COLSIRAC, strGrdDataErrors.Row];

      // Tiene Datos entonces...
      If (Trim(strCve_Proveedor_Nafin) <> '') And (Trim(strCve_Emisor_Nafin) <> '') Then
       Begin
       nID_EMISOR    := GetEmisorByCveNAFIN(strCve_Emisor_Nafin);
       nID_PROVEEDOR := GetProveedorByCveNAFIN(StrToInt(strCve_Proveedor_Nafin));

       // Si encuentra el Promotor entonces
       If GetPromotorByEmiProv(nID_EMISOR, nID_PROVEEDOR) <> 0 Then
        Begin
        // Muestra el Promotor
    {ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
    //    CrEmiPro.FindKey([nID_EMISOR, nID_PROVEEDOR]);
        CrEmiPro.FindKey([Objeto.ObtenEntidadDescontadoraNAFIN,nID_EMISOR, nID_PROVEEDOR]);
    {/ROIM}
        CrEmiPro.Catalogo;
        End
       Else
        Begin
        // Muestra en Modo de Captura
        CrEmiPro.m_nPRE_ID_EMISOR      := nID_EMISOR;
    {ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
    //    CrEmiPro.m_strCve_Emisor_Nafin := strCve_Emisor_Nafin;
        CrEmiPro.m_strCVE_EMISOR_EXT := strCve_Emisor_Nafin;
        CrEmiPro.m_sCVE_FND_ENT_DES := Objeto.ObtenEntidadDescontadoraNAFIN;
    {/ROIM}
        CrEmiPro.m_nPRE_ID_PROVEEDOR   := nID_PROVEEDOR;
        CrEmiPro.ShowWindow(ftCaptura);
        End;

       End
      Else
       CrEmiPro.Catalogo;

     Finally
      RevalidateDocuments;
      LoadErrors(Acuses, m_nId_Carga_NAFIN);
      If Assigned(CrEmiPro) Then CrEmiPro.Free;
     End;
   end;  
end;
// Contrato de NAFIN
procedure TWCrArchNaf.btnId_ContratoClick(Sender: TObject);
var strTitular, strMoneda : String;
    vlID_CONTRATO, vlFOL_CONTRATO : Integer;
    vlNOMB_CONTRATO, vlCVE_FND_ENT_DES, vlCVE_EMISOR_EXT : String;
begin
 strTitular := StringGrid.Cells[C_COLGRID_ACREDITADO, StringGrid.Row];
 strMoneda  := StringGrid.Cells[C_COLGRIDMONEDA, StringGrid.Row];
 If (Trim(strTitular) <> '') Then
  Begin
  // <SATV4766 26May2008>  Inclusión de otros contratos
  If BuscaAutorizacionCADENAS(Objeto.Apli, StrToInt(strTitular), StrToInt(strMoneda),
                              vlID_CONTRATO, vlFOL_CONTRATO,
                              vlNOMB_CONTRATO, vlCVE_FND_ENT_DES, vlCVE_EMISOR_EXT
                             ) Then
    Begin
     If vlID_CONTRATO <> 0 Then
      Begin
        StringGrid.Cells[C_COLGRID_LINEA,       StringGrid.Row] := IntToStr(vlID_CONTRATO);
        StringGrid.Cells[C_COLGRID_TITULAR,     StringGrid.Row] := vlNOMB_CONTRATO;
        StringGrid.Cells[C_COLGRIDCVEEMISOREXT, StringGrid.Row] := vlCVE_EMISOR_EXT;

        If (Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CRPYME) Then
           StringGrid.Cells[C_COLGRIDFOLCTTO,  StringGrid.Row] := IntToStr(vlFOL_CONTRATO);
      End
     Else
      ShowMessage('Su Usuario '+Objeto.DameUsuario+'. No tiene permisos para operar sobre este contrato.'#13#10);
    End;
  End;

{  // <SATV4766 16Jun2008>  Se comenta todo esta sección; puesto que esta parte es la que
   // estaba funcionando originalmente 
begin
 strTitular := StringGrid.Cells[C_COLGRID_ACREDITADO, StringGrid.Row];
 strMoneda  := StringGrid.Cells[C_COLGRIDMONEDA, StringGrid.Row];
 If (Trim(strTitular) <> '') Then
  // <SATV4766 26May2008>  Inclusión de otros contratos
  Objeto.Contrato.BuscaWhereString := ' ( (CONTRATO.ID_TITULAR = ' + strTitular + coCRLF+
                                      '    AND CR_CONTRATO.CVE_MONEDA =  ' + strMoneda + ') OR ' +coCRLF+
                                      '   ( CR_CONTRATO.ID_CONTRATO IN ' +coCRLF+
                                      '       ( SELECT CREC.ID_CONTRATO_REL' +coCRLF+
                                      '         FROM CR_REL_EMI_CTO CREC, CONTRATO CTO1 ' +coCRLF+
                                      '         WHERE CREC.ID_EMISOR = '+strTitular+coCRLF+
                                      '           AND CREC.SIT_REL_EMI_CTO = ''AC'''+coCRLF+
                                      '           AND CTO1.ID_CONTRATO = CREC.ID_CONTRATO_REL '+coCRLF+
                                      '           AND CTO1.CVE_MONEDA =  ' + strMoneda + ' '+coCRLF+
                                      '        )'+coCRLF+
                                      '   )'+coCRLF+
                                      '  )'
                                     ;
  // </SATV4766 26May2008>
 If Objeto.Contrato.Busca Then
  Begin
   If Trim(Objeto.Contrato.ID_CONTRATO.AsString) <> '' Then
    Begin
      StringGrid.Cells[C_COLGRID_LINEA,   StringGrid.Row] := Objeto.Contrato.ID_CONTRATO.AsString;
      StringGrid.Cells[C_COLGRID_TITULAR, StringGrid.Row] := Objeto.Contrato.Acreditado.Persona.Nombre.AsString;
      if Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CRPYME then
         StringGrid.Cells[C_COLGRIDFOLCTTO,  StringGrid.Row] := Objeto.Contrato.FOL_CONTRATO.AsString;
    End
   Else
    ShowMessage('Su Usuario '+Objeto.DameUsuario+'. No tiene permisos para operar sobre este contrato.'#13#10);
  End;
end;
}
end;


// Boton para aplicar el ajuste
procedure TWCrArchNaf.Button2Click(Sender: TObject);

 procedure CreateStpAplicaAcuse(var Stp : TStoredProc);
 begin
  Stp := TStoredProc.Create(Self);
  Stp.DatabaseName := Objeto.DatabaseName;
  Stp.SessionName  := Objeto.SessionName;
  Stp.StoredProcName := 'PKGCRPERIODO.STPAPLICAACUSE';
  With Stp Do
   Begin
   Params.CreateParam(ftString,'PECVE_FND_ENT_DES',ptInput);
   Params.CreateParam(ftString,'PEID_ACUSE',ptInput);
   Params.CreateParam(ftFloat,'PEID_CONTRATO',ptInput);
   Params.CreateParam(ftString,'PECVE_USU_PROCESA',ptInput);
   Params.CreateParam(ftString,'PEB_APLICA_COM',ptInput);
   Params.CreateParam(ftString,'PEB_OPER_DIA_SIG',ptInput); //< EASA 26.ABR.2007 Req. Desc. Dolares
   Params.CreateParam(ftString,'PECVE_EMISOR_EXT',ptInput); //< SATV4766 16.JUN.2008 Req. Rel Emisor-Autorioacion   
   Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
   Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
   Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
   End;
 end;

 function EsValidoAplicaAcuses : Boolean;
 var I, nCount, nChecks : Integer;
 begin
  nCount := 0; nChecks := 0;
  With StringGrid Do
   For I := 1 To RowCount - 1 Do
    Begin
     If (Cells[C_COLAPLICA,I] = C_APLICA) Then
      Begin
       Inc(nChecks);
       If (Trim(Cells[C_COLACUSE,I]) = '') Or (Trim(Cells[C_COLGRID_LINEA,I]) = '') Then
        Begin
        ShowMessage('Falta Indicar la Línea del Acuse a Aplicar');
        Row := I; Col := C_COLGRID_LINEA;
        nCount := 0;
        Break;
        End;
       Inc(nCount);
      End;
    End;

  If (nChecks = 0) Then
   ShowMessage('Favor de Marcar las casillas de los Acuses que desea Aplicar.');

  Result := (nCount > 0) And (nChecks > 0);
 end;

 function ObtenCesiones(strAcuses : String) : String;
 var Qry : TQuery;
     strCesiones, strComa : String;
 begin
  Result := '';
  Qry := TQuery.Create(Self);
  If Assigned(Qry) Then
   With Qry Do
    Try
     DatabaseName := Objeto.DatabaseName;
     SessionName := Objeto.SessionName;
     SQL.Clear;
     SQl.Add(
              ' SELECT ID_CESION '#13#10+
              ' FROM CR_ARCHIVO_NAFIN '#13#10+
              ' WHERE ID_ACUSE = '+strAcuses+#13#10+
              ' GROUP BY ID_CESION ORDER BY ID_CESION '#13#10
             );
     Open;
     First;

     strCesiones := ''; strComa := '';
     While Not Eof Do
      Begin
      strCesiones := strCesiones + strComa + FieldByName('ID_CESION').AsString;
      strComa := ', ';
      Next;
      End;

      Result := strCesiones;
    Finally
     Close;
     Free;

    End;
 end;

 var StpAplicaAcuse : TStoredProc;
     strMessage, strUsuario, strAcuse,
     strLinea : String;
     bOk : Boolean;
     I {, nProcesados } : Integer;
     sFCarga, sFolCtto  : String;
     sTxResult : String;
     iResult   : Integer;
     vlOperaDiaSig : String; //EASA 27.ABR.2007 Req. Desc. Dolares
     vlCveEmisorExt : String; // SATV4766 16.JUN.2008 Req. Rel Emisor-Autorioacion
begin
   if Objeto.ValidaAccesoEsp('TCRARCHNAF_APLIC',True,True) then
   begin
      if Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CADENA then begin
         If (EsValidoAplicaAcuses) Then
          Try
           strUsuario := Objeto.DameUsuario;
           bOk := True; strAcuse := ''; // nProcesados := 0;

           //< EASA 27.ABR.2007 Req. Desc. Dolares
           vlOperaDiaSig := 'F';
           IF chB_OPERA_DIA_SIG.Checked THEN
              vlOperaDiaSig := 'V';
           // END_EASA >/

           CreateStpAplicaAcuse(StpAplicaAcuse);
           Objeto.AsignaEntidadDescontadora(StpAplicaAcuse, 'PECVE_FND_ENT_DES');
           With StringGrid Do
            For I := 1 To RowCount - 1 Do
             Begin
             If (Cells[C_COLAPLICA,I] = C_APLICA) Then
              Begin
               strLinea := Cells[C_COLGRID_LINEA,I];
               strAcuse := Cells[C_COLACUSE,I];
               vlCveEmisorExt := Cells[C_COLGRIDCVEEMISOREXT,I];
               { *** Continue *** }
               { If (IndicaTasa_a_Usar(Objeto.Apli, strAcuse, strLinea, strCVE_TASA_REFER) <> mrYes) Then
                 Begin
                 ShowMessage('Operación cancelada por el usuario.');
                 Continue;
                 End; }

               StpAplicaAcuse.ParamByName('PEID_ACUSE').AsString := strAcuse;
               StpAplicaAcuse.ParamByName('PEID_CONTRATO').AsInteger := StrToInt(strLinea);
        //       StpAplicaAcuse.ParamByName('PECVE_TASA_REFER').AsString := strCVE_TASA_REFER; // SATV4766  06042004
               StpAplicaAcuse.ParamByName('PECVE_USU_PROCESA').AsString := strUsuario;
               StpAplicaAcuse.ParamByName('PEB_APLICA_COM').AsString := 'V';
               StpAplicaAcuse.ParamByName('PEB_OPER_DIA_SIG').AsString := vlOperaDiaSig; //< EASA 26.ABR.2007 Req. Desc. Dolares
               StpAplicaAcuse.ParamByName('PECVE_EMISOR_EXT').AsString := vlCveEmisorExt; //< SATV4766 16.JUN.2008 Req. Rel Emisor-Autorizacion
               StpAplicaAcuse.ParamByName('PEBCOMMIT').AsString := 'V';
               StpAplicaAcuse.ExecProc;

               { Verifica el resultado obtenido al aplicar el Acuse
                  Al control "MemoMessages" se le agregan los errores, si hubo algún problema al aplicar el acuse...
                  de lo contrario se le agregan únicamente las cesiones Creadas del Acuse Aplicado. }
               If (StpAplicaAcuse.ParamByName('PSRESULTADO').AsInteger > 0) Then
                Begin
                MemoMessages.Lines.Add('<'+StpAplicaAcuse.ParamByName('PSRESULTADO').AsString+'> '+
                                       StpAplicaAcuse.ParamByName('PSTXRESULTADO').AsString);
                bOk := False;
                End
               Else
                Begin
                //EASA4011  08.AGO.2007
                If (StpAplicaAcuse.ParamByName('PSTXRESULTADO').AsString <> '') Then
                   MemoMessages.Lines.Add(StpAplicaAcuse.ParamByName('PSTXRESULTADO').AsString);
                //END EASA
                strAcuse := #39+StpAplicaAcuse.ParamByName('PEID_ACUSE').AsString+#39;
                MemoMessages.Lines.Add(' Se ha(n) creado la(s) Cesion(es) '+ObtenCesiones(strAcuse)+' del Acuse "'+strAcuse+'" ... ');
                End;
          //    Inc(nProcesados);

              End;
             End;

        {  If (nProcesados > 0) Then
           Begin }
             If bOk Then strMessage := 'Proceso Terminado Correctamente.'
             Else strMessage := 'Se produjeron errores al Aplicar los Acuses, favor de verificarlos.';
             MemoMessages.Lines.Add(strMessage);
             MemoMessages.Lines.Add('*****************************************************************');
             ShowMessage(strMessage);
        //   End;

          Finally
           If Assigned(StpAplicaAcuse) Then
            Begin
            StpAplicaAcuse.Params.Clear;
            StpAplicaAcuse.Free;
            End;
            tbshAplicarShow(Self);
            btnId_Contrato.Top := 61;
          End;
      end else if Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString = C_CRPYME then begin
        //
        //
        // STPAPLICAPYMEACUSE

        if (EsValidoAplicaAcuses) then
          try
            strUsuario := Objeto.DameUsuario;
            bOk        := True;
            strAcuse   := '';
            with StringGrid do
            begin
              for I := 1 to RowCount - 1 do
              begin
                if (Cells[C_COLAPLICA,I] = C_APLICA) then
                begin
                  strLinea := Cells[C_COLGRID_LINEA,I];
                  strAcuse := Cells[C_COLACUSE,I];
                  sFCarga  := Cells[C_COLGRIDFCARGA,I];
                  sFolCtto := Cells[C_COLGRIDFOLCTTO,I];
                  //
                  Objeto.GeneraDispPYME(StrToDate(sFCarga),  strAcuse,   StrToInt(strLinea),
                                        StrToInt (sFolCtto), strUsuario, 'F',
                                        'V', iResult, sTxResult  );
                  // Verifica el resultado obtenido al aplicar el Acuse
                  // Al control "MemoMessages" se le agregan los errores, si hubo algún problema al aplicar el acuse...
                  // de lo contrario se le agregan únicamente las cesiones Creadas del Acuse Aplicado. }
                  If (  iResult > 0 ) Then
                  Begin
                    MemoMessages.Lines.Add('<' + IntToStr( iResult ) +'> '+ sTxResult );
                    bOk := False;
                  End
                  Else
                  Begin
                    strAcuse := #39 + strAcuse + #39;
                    MemoMessages.Lines.Add(' Se ha(n) creado la(s) disposición(es) ' +
                      Objeto.ObtenDisposiciones( StrToDate(sFCarga),  strAcuse ) + ' del Acuse "'+ strAcuse + '" ... ');
                  End;
                End;
              End;//ends_For_I_:=_1_To_RowCount_-_1_Do
            end;//ends_with_StringGrid_do
            //
            if bOk then
                strMessage := 'Proceso Terminado Correctamente.'
            else
                strMessage := 'Se produjeron errores al Aplicar los Acuses, favor de verificarlos.';
            //
            MemoMessages.Lines.Add(strMessage);
            MemoMessages.Lines.Add('*****************************************************************');
            ShowMessage(strMessage);
            //
          Finally
            tbshAplicarShow(Self);
            btnId_Contrato.Top := 61;
          End;
      end else
        MessageDlg(C_FMT_UNK, mtError, [mbOk], 0);
      //ends_if_Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString_=_C_CADENA_then_begin
   end;   
end;

//easa4011 16.05.2008 bancomext descuento
procedure TWCrArchNaf.ikCVE_ENT_DESCEjecuta(Sender: TObject);
begin
  if Objeto.MInstDesc.FindKey( [ ikCVE_ENT_DESC.Buffer ] )then
    EnableDisableButtons;
end;

procedure TWCrArchNaf.btCVE_ENT_DESCExit(Sender: TObject);
var VLMsg    : String;
    VlSalida : Boolean;
begin
  VLMsg := 'Favor de indicar la entidad descontadora correspondiente';
  VlSalida := False;
  if Objeto.CrFrmtoNaf.Active then
  begin
    if Objeto.MInstDesc.CVE_FND_ENT_DES.AsString <> '' then
    begin
      VLMsg    := '';
      VlSalida := True;
    end;//ends_if_Objeto.AsString_<>_''_then
  end;//ends_if
  InterForma1.ValidaExit(edCVE_ENT_DESC, VlSalida, VLMsg, True );
end;

procedure TWCrArchNaf.btCVE_ENT_DESCClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRARCHNAF_ENTDS',True,True) then
   begin
      if Objeto.MInstDesc.Busca then
        EnableDisableButtons;
   end;     
end;
//end_ easa4011
end.

