// Sistema         : Clase de CRCOBRANZ
// Fecha de Inicio : 13/08/2003
// Función forma   : Clase de CRCOBRANZ
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : José Alejandro González Franco
// Comentarios     :
Unit IntCrVtaCart;

interface

uses
  Windows, Messages, SysUtils, Classes,  Graphics, Controls, Forms,    Dialogs,
  IntFrm,  DB,       DbTables, Mask,     StdCtrls, Buttons,  ExtCtrls, InterFor,
  IntFind, UnSQL2,   InterFun, ComCtrls, IntDtPk,  Grids,    Aligrid,  InterEdit,
  ImgList, Menus,    ToolWin,  StdActns, ActnList, Clipbrd,  Math,


  //Unidades Adicionales
  IntLinkit,     // --
  IntParamCre,   // Unidad de paramétros del Panel
  IntGenCre,     // Unidad genérica de funciones y constantes
  IntCrCobConst, // Constantes y procedimientos de la cobranza
  IntMProdGpo,   // Grupo Producto
  IntCrAcredit,  // Acreditado
  IntCrCto,      // Contrato
  IntCrCredito,  // Disposición
  IntCrConsult   // Catalogo de consultas
  ;

type
  //
  TCrVtaCart  = class;
  //
  TWCrVtaCart = class(TForm)
    InterForma1  : TInterForma;
    btnVentaCartera: TButton;
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
    sbLogCobranza: TSpeedButton;
    cbB_COB_ORD_PER: TCheckBox;
    pnColumnas: TPanel;
    edTitSel: TEdit;
    edTitMorComision: TEdit;
    edTitMorFinanAdic: TEdit;
    edTitImpInteres: TEdit;
    edTitImpCapital: TEdit;
    edTitMorCapital: TEdit;
    edTitCredito: TEdit;
    edTitFinanAdic: TEdit;
    edTitImpComision: TEdit;
    sagDATOS: TStringAlignGrid;
    pupFiltroBusqueda: TPopupMenu;
    pupAcreditado: TMenuItem;
    pupDisposicion: TMenuItem;
    pupGpoProducto: TMenuItem;
    pupContrato: TMenuItem;
    bvSeparador: TBevel;
    edDESC_FILTRO: TEdit;
    btnFiltro: TBitBtn;
    edValorFiltro: TEdit;
    tbarTipoFiltro: TToolBar;
    tbTipoFiltro: TToolButton;
    pnlMsgs: TPanel;
    edTitScroll: TEdit;
    Panel1: TPanel;
    edFootCred: TEdit;
    edFootSel: TEdit;
    edFootMorComision: TEdit;
    edFootMorFinanAdic: TEdit;
    edFootImpInteres: TEdit;
    edFootImpCapital: TEdit;
    edFootMorCapital: TEdit;
    edFootImpFinanAdic: TEdit;
    edFootImpComision: TEdit;
    edFootScroll: TEdit;
    sbLimpiaGrid: TSpeedButton;
    sbSelectAll: TSpeedButton;
    sbUnselectAll: TSpeedButton;
    lbImporteVenta: TLabel;
    edF_VALOR_PAGO: TEdit;
    dtF_VALOR_PAGO: TInterDateTimePicker;
    lbF_VALOR_PAGO: TLabel;
    cbReportaBuro: TCheckBox;
    lbComentarios: TLabel;
    mComentarios: TMemo;
    pupDATOS: TPopupMenu;
    Desplegarlainformacindelcrdito1: TMenuItem;
    Pegarcrditosdelportapapeles1: TMenuItem;
    btnAgregaCreditos: TBitBtn;
    btnReemplazaCreditos: TBitBtn;
    sbPaste: TSpeedButton;
    ActionList1: TActionList;
    actPaste: TAction;
    ilDatos: TImageList;
    actDisplayCred: TAction;
    lbTipoFiltro: TLabel;
    edImporteVenta: TInterEdit;
    edTitTotal: TEdit;
    edFootTotal: TEdit;
    Shape1: TShape;
    lbLeyendaGarantia: TLabel;
    rgOperacion: TRadioGroup;
    tbarTipoConsulta: TToolBar;
    tbTipoConsulta: TToolButton;
    pupTipoConsulta: TPopupMenu;
    Grupodeventa1: TMenuItem;
    Disposicin1: TMenuItem;
    lbTipoConsulta: TLabel;
    edValorConsulta: TEdit;
    btnConsulta: TBitBtn;
    btnCancelaVenta: TButton;
    btnDisplayConsulta: TButton;
    labSit: TLabel;
    labSituacion: TLabel;
    TVerificaCambio: TTimer;
    TInitStatus: TTimer;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure oeTipoFiltroClick(Sender: TObject);
    procedure oeFiltroAdicionalClick(Sender: TObject);
    procedure cbFiltroClick(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure ikValorFiltroEjecuta(Sender: TObject);
    procedure sagDATOSSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure sagDATOSDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure sagDATOSMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MErroresDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure sagDATOSKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbSelectAllClick(Sender: TObject);
    procedure sbUnselectAllClick(Sender: TObject);
    procedure sbLimpiaGridClick(Sender: TObject);
    procedure actPasteExecute(Sender: TObject);
    procedure sbPasteClick(Sender: TObject);
    procedure actDisplayCredExecute(Sender: TObject);
    procedure btnAgregaCreditosClick(Sender: TObject);
    procedure btnReemplazaCreditosClick(Sender: TObject);
    procedure btnVentaCarteraClick(Sender: TObject);
    procedure edF_VALOR_PAGOExit(Sender: TObject);
    procedure edF_VALOR_PAGOKeyPress(Sender: TObject; var Key: Char);
    procedure sagDATOSDblClick(Sender: TObject);
    procedure edF_VALOR_PAGOChange(Sender: TObject);
    procedure edValorFiltroEnter(Sender: TObject);
    procedure pupFiltroBusquedaPopup(Sender: TObject);
    procedure pupTipoConsultaChange(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure edValorConsultaEnter(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure rgOperacionClick(Sender: TObject);
    procedure btnDisplayConsultaClick(Sender: TObject);
    procedure edValorConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelaVentaClick(Sender: TObject);
    procedure TVerificaCambioTimer(Sender: TObject);
    procedure TInitStatusTimer(Sender: TObject);
  private
    fSearching  : Boolean;
    fBolSearch  : Boolean;
    fDataFound  : Boolean;
    FTipoBusqueda: char;
  private
    procedure    SetCurrentSearch (CurrentSearch: char);
    procedure    AddError      ( pMsgError : String);
    Function     ValidaError   ( pMsgError : String): Boolean;
    procedure    LimpiaFiltro;
    procedure    SetTipoFiltro;
    Function     BeginSearch( BBusca : Boolean; const Llave : array of TVarRec ): Boolean;
    procedure    GetFromControls;
    procedure    LimpiaRecord (Completo: boolean = True);
    procedure    LimpiaPantalla (Completo: boolean = False);
  private
    // procedimientos de vaciado de datos
    procedure    DrawControls;

    // procedimientos de calculo de datos
    procedure    PasteFromClipboardToGrid (Sender: TObject);
    function     AddGridCredito (peIDCredito: integer; vlDup: TStringList; var psHayGarantia: boolean): boolean;
    procedure    RecalcGrid;
    procedure    SumaGrid;
    procedure    ClearRecord (peRow: integer);
    procedure    MuestraCredito(nId_Credito : Integer);
    procedure    AgregaCreditosBusqueda (peAgregaGrid: boolean);
    function     SelectedRows: integer;

    procedure    ConsultaVta (peTipoID, peID: integer);
    procedure    LimpiaVentaConsulta;
    function     HayDatos: boolean;
  public
    Objeto       : TCrVtaCart;
  private
    property Searching : Boolean read fSearching write fSearching default true;
    property Searched  : Boolean read fBolSearch write fBolSearch default true;
    property DataFound : Boolean read fDataFound write fDataFound default true;
  end;

  TCrVtaCart= class(TInterFrame)
  public
    // INTERCAMPOS PARA FILTRAR LA BUSQUEDA
    TIPO_FILTRO              : TInterCampo;
    COBRANZA                 : TInterCampo;
    B_OPERADO_NAFIN          : TInterCampo;
    VALOR_FILTRO             : TInterCampo;
    FILTRO_TIPO_INTERES      : TInterCampo;
    FILTRO_OPERADO_NAFIN     : TInterCampo;

    TIPO_CONSULTA            : TInterCampo;
    VALOR_CONSULTA           : TInterCampo;
    //
    INDICE_GRID              : TInterCampo;
    COLUMNA_GRID             : TInterCampo;
    TIPO_PARAM               : TInterCampo;
    F_VALOR_PAGO             : TInterCampo;

    //
    // Clase de los parametros de la aplicacion
    ParamCre                 : TParamCre;
    // Clases utilizadas para el filtro de busqueda
    CatProdGpo               : TMProdGpo;
    CatAcreditado            : TCrAcredit;
    CatContrato              : TCrCto;
    CatCredito               : TCrCredito;
    {}
    // Clases utilizadas como catalogos de la seccion "Informacion General"
    CrContrato               : TCrCto;
    Credito                  : TCrCredito;
  private
    procedure   MuestraError( vlError : String );
    function    BoolToStr( peValor : Boolean ) : String;
    function    StrToBool( peValor : String  ) : Boolean;
  public
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow( FormaTipo : TFormaTipo) : Integer; override;
  public
    procedure   StpObtAdeudo (peIDCredito: integer; peFValor: TDate;
                              var psImpCapital, psImpInteres, psImpFinanAdic, psImpComision,
                                  psMorCapital, psMorInteres, psMorFinanAdic, psMorComision: Double;
                              var psGarantia: boolean;
                              var peResultado: integer; var psError: string);
    procedure   StpCancelaVta( peIDGpoVta : Integer; var vlResult : Double; var vlTxResult : String );
    procedure   LimpiaTablaVta(var  vlError : String);
    procedure   AgregaElemento (peIDCredito: integer; var vlError: string);
    procedure   AplicaVenta (peImporteVta: double; peCveUsuario: string; peFValor: TDate;
                             peDescripcion: string; peBInstRepBuro, peBCommit: boolean;
                             var psIDGrupoVta: integer; var psError: string);
    Procedure   AsignaTipoFiltro( peIdCredito: String; Sender: TInterLinkit);
    //
  published
  end;




const
   // Posicion de los datos en el GRID ( Datos Visibles )
   COL_CRED   = 0;   // ID_Credito
   COL_SEL    = 1;   // Aplica venta
   COL_MORCOM = 2;   // Intereses moratorios de comisión
//   COL_MORINT = 3;   // Intereses moratorios de interés
   COL_MORFIN = 3;   // Intereses moratorios de financiamiento adicional
   COL_MORCAP = 4;   // Intereses moratorios de capital
   COL_IMPCOM = 5;   // Importe de comisión
   COL_IMPINT = 6;   // Importe de interés
   COL_IMPFIN = 7;   // Importe de financiamiento adicional
   COL_IMPCAP = 8;   // Importe de capital
   COL_TOTAL  = 9;   // Importe total
   COL_CLCW   = 10;  // Color del renglon
   COL_VIS    = COL_IMPCAP;

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

   cobpVtaCart   = '5';

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
   //
   //
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
constructor TCrVtaCart.Create( AOwner : TComponent );
begin
  Inherited;

  // Crea los intercampos utilizados para la busqueda
  TIPO_FILTRO    := CreaCampo( 'TIPO_FILTRO',  ftString, tsNinguno, tsNinguno, False);
  COBRANZA       := CreaCampo( 'COBRANZA',     ftString, tsNinguno, tsNinguno, False );
  VALOR_FILTRO   := CreaCampo( 'VALOR_FILTRO', ftString, tsNinguno, tsNinguno, False );

  TIPO_CONSULTA  := CreaCampo( 'TIPO_CONSULTA',  ftString, tsNinguno, tsNinguno, False);
  VALOR_CONSULTA := CreaCampo( 'VALOR_CONSULTA', ftString, tsNinguno, tsNinguno, False );
  //
  FILTRO_TIPO_INTERES  := CreaCampo( 'FILTRO_TIPO_INTERES',   ftString,  tsNinguno, tsNinguno, False );
  FILTRO_OPERADO_NAFIN := CreaCampo( 'FILTRO_OPERADO_NAFIN',  ftString,  tsNinguno, tsNinguno, False );
  //
  //
  // APUNTADOR AL NUMERO DE REGISTRO ACTIVO
  INDICE_GRID       := CreaCampo( 'INDICE_GRID',       ftInteger, tsNinguno, tsNinguno, False );
  COLUMNA_GRID      := CreaCampo( 'COLUMNA_GRID',      ftInteger, tsNinguno, tsNinguno, False );
  TIPO_PARAM        := CreaCampo( 'TIPO_PARAM',        ftInteger, tsNinguno, tsNinguno, False );
  F_VALOR_PAGO      := CreaCampo( 'F_VALOR_PAGO',      ftDate,    tsNinguno, tsNinguno, False );
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
  {   Catalogos   }
  // Autorizacion
  CrContrato := TCrCto.Create(self);
  CrContrato.MasterSource := Self;
  // Credito
  Credito := TCrCredito.Create(Self);
  Credito.MasterSource := Self;
  {$WARNINGS ON}

  StpName    := ' ';
  UseQuery   := False;
  HelpFile   := 'IntCrcobranz.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrVtaCart.Destroy;
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
  // Catalogos de "Informacion General"
  if CrContrato <> nil then
     CrContrato.Free;
  //end if
  if Credito <> nil then
     Credito.free;
  //end if;


  inherited;
end;


function TCrVtaCart.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrVtaCart;
begin
   W := TWCrVtaCart.Create(Self);
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
Function TCrVtaCart.InternalBusca:Boolean;
var T : TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ITVTACART.IT','');
  try
    if Active then begin end;
    if T.Execute then
    begin
      VALOR_CONSULTA.AsString := T.DameCampo (0);
      VALOR_CONSULTA.DrawControl;
    end;
  finally
    T.Free;
  end;
end;
// +---------------------------------------------------------------------------+
// +  Este procedimiento muestra un mensaje de error ocurrido en la aplicacion +
// +---------------------------------------------------------------------------+
procedure TCrVtaCart.MuestraError(vlError: String);
begin
  EXECUTE_MUESTRAMENSAJE( vlError );
end;
// +---------------------------------------------------------------------------+
// +                  Convierte un booleano a una cadena                       +
// +---------------------------------------------------------------------------+
function TCrVtaCart.BoolToStr( peValor : Boolean ) : String;
begin
  if peValor then result := 'V' else result := 'F';
end;
// +---------------------------------------------------------------------------+
// +                  Convierte una cadena a un booleano                       +
// +---------------------------------------------------------------------------+
function TCrVtaCart.StrToBool(peValor: String): Boolean;
begin
  result := ( peValor = 'V' );
end;
// +---------------------------------------------------------------------------+
// +           Trae los datos del adeudo a la pantalla de la cobranza          +
// +---------------------------------------------------------------------------+
procedure TCrVtaCart.StpObtAdeudo (peIDCredito: integer; peFValor: TDate;
                                   var psImpCapital, psImpInteres, psImpFinanAdic, psImpComision,
                                       psMorCapital, psMorInteres, psMorFinanAdic, psMorComision: Double;
                                   var psGarantia: boolean;
                                   var peResultado: integer; var psError: string);
var
  StpProc    : TStoredProc;
  vlSQL      : string;
  vlGarantia : integer;
begin
  psError    := '';
  psGarantia := False;
  StpProc := TStoredProc.Create(Nil);
  try
    with StpProc do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:='PKGCRCOBRANZA.STPOBTTOTVTACRED';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam( ftInteger, 'peIdCredito',    ptInput  );
      Params.CreateParam( ftDate,    'peFValor',       ptInput  );
      Params.CreateParam( ftFloat,   'psImpCapital',   ptOutput );
      Params.CreateParam( ftFloat,   'psImpInteres',   ptOutput );
      Params.CreateParam( ftFloat,   'psImpFinanAdic', ptOutput );
      Params.CreateParam( ftFloat,   'psImpComision',  ptOutput );
      Params.CreateParam( ftFloat,   'psMorCapital',   ptOutput );
      Params.CreateParam( ftFloat,   'psMorInteres',   ptOutput );
      Params.CreateParam( ftFloat,   'psMorFinanAdic', ptOutput );
      Params.CreateParam( ftFloat,   'psMorComision',  ptOutput );
      //
      Params.CreateParam( ftFloat,   'psResultado',   ptOutput);
      Params.CreateParam( ftString,  'psTxResultado', ptOutput);
      //
      ParamByName('peIdCredito').AsInteger := peIdCredito;
      ParamByName('peFValor').AsDateTime   := peFValor;
      ExecProc;

      peResultado := ParamByName('PSResultado').AsInteger;

      if (peResultado = 0) then
      begin
        psImpCapital   := ParamByName('psImpCapital').AsFloat;
        psImpInteres   := ParamByName('psImpInteres').AsFloat;
        psImpFinanAdic := ParamByName('psImpFinanAdic').AsFloat;
        psImpComision  := ParamByName('psImpComision').AsFloat;
        psMorCapital   := ParamByName('psMorCapital').AsFloat;
        psMorInteres   := ParamByName('psMorInteres').AsFloat;
        psMorFinanAdic := ParamByName('psMorFinanAdic').AsFloat;
        psMorComision  := ParamByName('psMorComision').AsFloat;

        vlSQL := 'Select Decode (PkgCrCobranza.StpObtBGarFondo (' + IntToStr (peIDCredito) + '), ''V'', 1, 0) Garantia ' + coCR +
                 '  From Dual ';
        GetSQLInt(vlsql, Apli.DataBaseName, Apli.SessionName, 'Garantia', vlGarantia, False);
        psGarantia := Boolean (vlGarantia);
      end
      else
        psError := 'Problemas al obtener el adeudo: ' + coCRLF +
                   'Código : ' + IntToStr (peResultado) + coCRLF +
                   'Mensaje: ' + ParamByName('psTxResultado').AsString;


    end;
  finally
    StpProc.Free;
  end;
end;

// +---------------------------------------------------------------------------+
// +           Limpia la tabla temporal de la venta de cartera                 +
// +---------------------------------------------------------------------------+
procedure TCrVtaCart.StpCancelaVta( peIDGpoVta : Integer; var vlResult : Double; var vlTxResult : String );
var
  StpProc    : TStoredProc;
begin
  vlResult   := 0;
  vlTxResult := '';
  StpProc    := TStoredProc.Create(Nil);
  try
    with StpProc do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:='PKGCRCOBRANZA.STPCANCELVTACART';
      // Se crean los parametros del StoreProcedure
      Params.Clear;

      Params.CreateParam( ftFloat,  'peIDGpoVta',       ptInput );
      Params.CreateParam( ftString, 'peCveUsuCanc',     ptInput );
      Params.CreateParam( ftString, 'peBCommit',        ptInput );
      Params.CreateParam( ftFloat,  'psResultado',      ptOutput);
      Params.CreateParam( ftString, 'psTxResultado',    ptOutput);

      //ASIGNA LOS VALORES
      ParamByName('peIDGpoVta' ).AsInteger   := peIDGpoVta;
      ParamByName('peCveUsuCanc' ).AsString  := Apli.Usuario;
      ParamByName('peBCommit'    ).AsString  := 'V';

      ExecProc;

      vlResult := ParamByName('PSResultado').AsInteger;

      if vlResult <> 0 then
        vlTxResult := 'Problemas al cancelar la venta: ' + coCRLF +
                   'Código : ' + ParamByName('PSResultado').AsString + coCRLF +
                   'Mensaje: ' + ParamByName('psTxResultado').AsString;


    end;
  finally
    StpProc.Free;
  end;
end;

// +---------------------------------------------------------------------------+
// +           Limpia la tabla temporal de la venta de cartera                 +
// +---------------------------------------------------------------------------+
procedure TCrVtaCart.LimpiaTablaVta( var  vlError : String );
var
  STPLimpTabVta  : TStoredProc;
Begin
  vlError := '';
  STPLimpTabVta := TStoredProc.Create(Nil);
  try
    with STPLimpTabVta do
    begin
      DatabaseName:= Apli.DatabaseName;
      SessionName:= Apli.SessionName;
      StoredProcName:= coPaquete + '.' + 'STPVTACARTTABCLR';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam(ftFloat,  'PSRESULTADO',   ptOutput);
      Params.CreateParam(ftString, 'PSTXRESULTADO', ptOutput);
      //
      ExecProc;
      if (ParamByName('PSResultado').AsInteger <> 0) then
      begin
        vlError := 'Problemas al limpiar tabla de venta de cartera: '  + coCRLF +
                   'Código : ' + ParamByName('psResultado').AsString   + coCRLF +
                   'Mensaje: ' + ParamByName('psTxResultado').AsString;
      end;
    end;
  finally
    STPLimpTabVta.Free;
  end;
end;

procedure TCrVtaCart.AgregaElemento (peIDCredito: integer; var vlError: string);
var
  STPAddTabVta : TStoredProc;
Begin
  vlError := '';
  STPAddTabVta := TStoredProc.Create(Nil);
  try
    with STPAddTabVta do
    begin
      DatabaseName:= Apli.DatabaseName;
      SessionName:= Apli.SessionName;
      StoredProcName:= coPaquete + '.' + 'STPVTACARTTABADD';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam(ftInteger, 'PEIDCREDITO',   ptInput);
      Params.CreateParam(ftFloat,   'PSRESULTADO',   ptOutput);
      Params.CreateParam(ftString,  'PSTXRESULTADO', ptOutput);
      Params.ParamByName('PEIDCREDITO').AsInteger := peIDCredito;
      //
      ExecProc;
      if (ParamByName('PSResultado').AsInteger <> 0) then
      begin
        vlError := 'Problemas al agregar un elemento en la tabla de venta de cartera: '  + coCRLF +
                   'Código : ' + ParamByName('psResultado').AsString                     + coCRLF +
                   'Mensaje: ' + ParamByName('psTxResultado').AsString;
      end;
    end;
  finally
    STPAddTabVta.Free;
  end;
end;

procedure TCrVtaCart.AplicaVenta (peImporteVta: double; peCveUsuario: string; peFValor: TDate;
                                  peDescripcion: string; peBInstRepBuro, peBCommit: boolean;
                                  var psIDGrupoVta: integer; var psError: string);
var
  STPAddTabVta : TStoredProc;
Begin
  psError := '';
  STPAddTabVta := TStoredProc.Create(Nil);
  try
    with STPAddTabVta do
    begin
      DatabaseName:= Apli.DatabaseName;
      SessionName:= Apli.SessionName;
      StoredProcName:= coPaquete + '.' + 'STPVTACARTAPLICA';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam(ftFloat,   'PEIMPORTEVTA',   ptInput);
      Params.CreateParam(ftString,  'PECVEUSUARIO',   ptInput);
      Params.CreateParam(ftDate,    'PEFVALOR',       ptInput);
      Params.CreateParam(ftString,  'PEDESCRIPCION',  ptInput);
      Params.CreateParam(ftString,  'PEBINSTREPBURO', ptInput);
      Params.CreateParam(ftString,  'PEBCOMMIT',      ptInput);
      Params.CreateParam(ftInteger, 'PSIDGPOVTA',     ptOutput);
      Params.CreateParam(ftFloat,   'PSRESULTADO',    ptOutput);
      Params.CreateParam(ftString,  'PSTXRESULTADO',  ptOutput);
      Params.ParamByName('PEIMPORTEVTA').AsFloat    := peImporteVta;
      Params.ParamByName('PECVEUSUARIO').AsString   := peCveUsuario;
      Params.ParamByName('PEFVALOR').AsDate         := peFValor;
      Params.ParamByName('PEDESCRIPCION').AsString  := peDescripcion;
      Params.ParamByName('PEBINSTREPBURO').AsString := BoolToStr (peBInstRepBuro);
      Params.ParamByName('PEBCOMMIT').AsString      := BoolToStr (peBCommit);
      //
      ExecProc;
      psIDGrupoVta := ParamByName('PSIDGPOVTA').AsInteger;
      if (ParamByName('PSResultado').AsInteger <> 0) then
      begin
        psError := 'Problemas al aplicar el proceso de venta de cartera: '  + coCRLF +
                   'Código : ' + ParamByName('psResultado').AsString        + coCRLF +
                   'Mensaje: ' + ParamByName('psTxResultado').AsString;
      end;
    end;
  finally
    STPAddTabVta.Free;
  end;
end;

procedure TCrVtaCart.AsignaTipoFiltro( peIdCredito: String; Sender: TInterLinkit);
begin
   Sender.Buffer := peIdCredito;
   Sender.OnEjecuta(Sender);
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
procedure TWCrVtaCart.AddError(pMsgError : String);
Begin
  AddLine(MErrores, ' *** ' + pMsgError );
end;
// +---------------------------------------------------------------------------+
// +    A partir de una cadena determina si despliega un mensaje de error      +
// +---------------------------------------------------------------------------+
Function TWCrVtaCart.ValidaError( pMsgError : String): Boolean;
begin
  Result := False;
  if pMsgError <> '' then
  begin
    Objeto.MuestraError( pMsgError );
    AddError( pMsgError );
    Result := True;
  end;
end;

procedure TWCrVtaCart.SetCurrentSearch (CurrentSearch: char);
begin
  FTipoBusqueda := CurrentSearch;
end;
// +---------------------------------------------------------------------------+
// +                       Limpia los filtros de busqueda                      +
// +---------------------------------------------------------------------------+
procedure TWCrVtaCart.LimpiaFiltro;
begin
  Objeto.CatProdGpo.Active    := False;
  Objeto.CatAcreditado.Active := False;
  Objeto.CatContrato.Active   := False;
  Objeto.CatCredito.Active    := False;
  if FTipoBusqueda = 'B' then
  begin
    if Objeto.TIPO_FILTRO.AsString = cobpGpoProd then
      lbTipoFiltro.Caption      := 'Grupo de Producto'
    else if Objeto.TIPO_FILTRO.AsString = cobpAcred then
      lbTipoFiltro.Caption      := 'Acreditado'
    else if Objeto.TIPO_FILTRO.AsString = cobpAutor then
      lbTipoFiltro.Caption      := 'Autorización'
    else if Objeto.TIPO_FILTRO.AsString = cobpDisp then
      lbTipoFiltro.Caption      := 'Disposición'
  end
  else if FTipoBusqueda = 'C' then
  begin
    if Objeto.TIPO_CONSULTA.AsString = cobpDisp then
      lbTipoConsulta.Caption    := 'Disposición'
    else if Objeto.TIPO_CONSULTA.AsString = cobpVtaCart then
      lbTipoConsulta.Caption    := 'Venta de cartera';
  end;
  Searched                    := False;
end;
// +---------------------------------------------------------------------------+
// +                       Limpia los filtros de busqueda                      +
// +---------------------------------------------------------------------------+
function TWCrVtaCart.BeginSearch(BBusca: Boolean; const Llave: array of TVarRec): Boolean;
var
  vlWhere, vlSQL: string;
  vlCount: integer;
begin
  Searched := False;
  //
  if FTipoBusqueda = 'B' then
  begin
    edDESC_FILTRO.Font.Color := edDESC_FILTRO.Color;
    // Obtiene el valor del control
    Objeto.VALOR_FILTRO.GetFromControl;
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
      vlWhere := 'Exists (Select 1 From CR_Credito Where ID_Contrato = CR_CONTRATO.ID_Contrato And SIT_CREDITO = ''AC'')';
      if Objeto.CatContrato.BuscaWhereString <> '' then
        Objeto.CatContrato.BuscaWhereString := Objeto.CatContrato.BuscaWhereString + ' AND ' + vlWhere
      else
        Objeto.CatContrato.BuscaWhereString := vlWhere;
      if BBusca then
        Searched := Objeto.CatContrato.Busca
      else
      begin
        Searched := Objeto.CatContrato.FindKeyNear( Llave, [ cID_CONTRATO ] );
        if Searched then
        begin
          vlSQL := 'Select Count (Distinct ID_Credito) '                  + coCR +
                   '  From CR_Credito '                                   + coCR +
                   ' Where ID_Contrato = ' + Objeto.VALOR_FILTRO.AsString + coCR +
                   '   And Sit_Credito = ''AC''';
          GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'Total',vlCount,False);
          if vlCount = 0 then
          begin
            Objeto.VALOR_FILTRO.AsString := '';
            Searched := Objeto.CatCredito.FindKey ( [''] );
          end
        end;
      end
      // ends_if
    end else if Objeto.TIPO_FILTRO.AsString = cobpDisp then                       // Busqueda sobre disposición
    begin
{      if Objeto.CatCredito.BuscaWhereString <> '' then
        Objeto.CatCredito.BuscaWhereString := Objeto.CatCredito.BuscaWhereString + ' AND SIT_CREDITO = ''AC'''
      else
        Objeto.CatCredito.BuscaWhereString := ' SIT_CREDITO = ''AC''';}
      if BBusca then
        Searched := Objeto.CatCredito.Busca
      else
      begin
        Searched := Objeto.CatCredito.FindKey( Llave );
        if Searched and (Objeto.CatCredito.SIT_CREDITO.AsString <> 'AC') then
        begin
          Objeto.VALOR_FILTRO.AsString := '';
          Searched := Objeto.CatCredito.FindKey ( [''] );
        end
      end;
      // ends_if
    end;
    // Obtiene el valor del control
    Objeto.VALOR_FILTRO.GetFromControl;
    if not Searched then
      edDesc_Filtro.Text := '';

    edDESC_FILTRO.Font.Color := clWindowText;
  end
  else if FTipoBusqueda = 'C' then
  begin
    // Obtiene el valor del control
    Objeto.VALOR_CONSULTA.GetFromControl;
    if Objeto.TIPO_CONSULTA.AsString = cobpDisp then                       // Busqueda sobre disposición
    begin
{      if Objeto.CatCredito.BuscaWhereString <> '' then
        Objeto.CatCredito.BuscaWhereString := Objeto.CatCredito.BuscaWhereString + ' AND SIT_CREDITO = ''AC'''
      else
        Objeto.CatCredito.BuscaWhereString := ' SIT_CREDITO = ''AC''';}
      if BBusca then
        Searched := Objeto.CatCredito.Busca
      else
      begin
        Searched := Objeto.CatCredito.FindKey( Llave );
        if Searched and (Objeto.CatCredito.SIT_CREDITO.AsString <> 'AC') then
        begin
          Objeto.VALOR_CONSULTA.AsString := '';
          Searched := Objeto.CatCredito.FindKey ( [''] );
        end
      end;
      // ends_if
    end
    else if Objeto.TIPO_CONSULTA.AsString = cobpVtaCart then                       // Busqueda sobre disposición
    begin
      if BBusca then
        Searched := Objeto.InternalBusca;
    end;
    // Obtiene el valor del control
    Objeto.VALOR_CONSULTA.GetFromControl;
  end;
  //
  Result := Searched;
end;

procedure TWCrVtaCart.SetTipoFiltro;
begin
  case rgOperacion.ItemIndex of
    0: SetCurrentSearch ('B');
    1: SetCurrentSearch ('C');
  end;

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
  if Objeto.CatCredito.ID_CREDITO.Control <> nil then
     Objeto.CatCredito.ID_CREDITO.Control := nil;
  //ends if
  if Objeto.CatCredito.ID_CONTROL_EXT.Control <> nil then
     Objeto.CatCredito.ID_CONTROL_EXT.Control := nil;
  //ends if
  if Objeto.CatCredito.ID_CRED_EXTERNO.Control <> nil then
     Objeto.CatCredito.ID_CRED_EXTERNO.Control := nil;
  //ends if
  //
  // Liga los controles
  if FTipoBusqueda = 'B' then
  begin
    if Objeto.TIPO_FILTRO.AsString = cobpGpoProd then                             // Filtro por grupo producto
    begin
      Objeto.CatProdGpo.CVE_PRODUCTO_GPO.Control := edValorFiltro;
      Objeto.CatProdGpo.DESC_L_PROD_GPO.Control  := edDESC_FILTRO;
      lbTipoFiltro.Caption                       := 'Grupo de Producto';
    end else if Objeto.TIPO_FILTRO.AsString = cobpAcred then                      // Filtro por acreditado
    begin
      Objeto.CatAcreditado.ID_ACREDITADO.Control  := edValorFiltro;
      Objeto.CatAcreditado.Persona.Nombre.Control := edDESC_FILTRO;
      lbTipoFiltro.Caption                       := 'Acreditado';
    end else if Objeto.TIPO_FILTRO.AsString = cobpAutor then                      // Filtro por Autorizacion
    begin
      Objeto.CatContrato.ID_CONTRATO.Control  := edValorFiltro;
      Objeto.CatContrato.Contrato.TITNombre.Control := edDESC_FILTRO;
      lbTipoFiltro.Caption                       := 'Autorización';
    end else if Objeto.TIPO_FILTRO.AsString = cobpDisp then                       // Filtro por disposicion
    begin
      Objeto.CatCredito.ID_CREDITO.Control := edValorFiltro;
      Objeto.CatCredito.ContratoCre.Contrato.TITNombre.Control := edDESC_FILTRO;
      lbTipoFiltro.Caption                       := 'Disposición';
    end;
    //
    if edValorFiltro.CanFocus then
       edValorFiltro.SetFocus;
  end
  else if FTipoBusqueda = 'C' then
  begin
    if Objeto.TIPO_CONSULTA.AsString = cobpDisp then
    begin
      Objeto.CatCredito.ID_CREDITO.Control := edValorConsulta;
      lbTipoConsulta.Caption               := 'Disposición';
    end
    else if Objeto.TIPO_CONSULTA.AsString = cobpVtaCart then
    begin
      Objeto.VALOR_CONSULTA.Control        := edValorConsulta;
      lbTipoConsulta.Caption               := 'Venta de cartera';
    end;
  end;
  //
end;
// +---------------------------------------------------------------------------+
// +                     LIMPIA EL REGISTRO CON LA INFORMACION                 +
// +---------------------------------------------------------------------------+
procedure TWCrVtaCart.LimpiaRecord (Completo: boolean = True);
begin
  Objeto.INDICE_GRID.AsInteger   := 0;
  Objeto.COLUMNA_GRID.AsInteger  := 0;
  Objeto.TIPO_PARAM.AsInteger    := coNone;
  if Completo then
  begin
    Objeto.F_VALOR_PAGO.AsString   := '';
    edImporteVenta.Text            := '0.00';
    cbReportaBuro.Checked          := False;
    mComentarios.Lines.Clear;
  end;
end;
// +---------------------------------------------------------------------------+
// +      Despliega los valores del registro en los edits de la pantalla       +
// +---------------------------------------------------------------------------+
procedure TWCrVtaCart.DrawControls;
begin
  // DE LA SECCION DE INFORMACION GENERAL
  // DE LA SECCION DE PARAMETROS
  Objeto.F_VALOR_PAGO.AsDateTime := Objeto.Apli.DameFechaEmpresa;
  Objeto.F_VALOR_PAGO.DrawControl;
  // DE LA SECCION DE IMPORTES
  //
end;
// +---------------------------------------------------------------------------+
// +                          Limpia la pantalla                               +
// +---------------------------------------------------------------------------+
procedure TWCrVtaCart.LimpiaPantalla (Completo: boolean = False);
begin
  LimpiaRecord (Completo);      // Limpia el registro de datos
  DrawControls;                 // Limpia los edits de la pantalla
  Application.ProcessMessages;
end;
//</LOLS>

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
procedure TWCrVtaCart.FormCreate(Sender: TObject);
begin
  //Alineacion de TEdit a la derecha, junto con BiDiMode dbRightToLeft
  SysLocale.MiddleEast := True;

  FTipoBusqueda := 'C';
end;

// +---------------------------------------------------------------------------+
// +                       Evento OnShow de la forma                           +
// +---------------------------------------------------------------------------+
procedure TWCrVtaCart.FormShow(Sender: TObject);
begin
  Searching := True;
//  lbTipoFiltro.Caption   := '';
//  lbTipoConsulta.Caption := '';
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
  //
  Objeto.CrContrato.ParamCre := Objeto.ParamCre;
  Objeto.Credito.ParamCre    := Objeto.ParamCre;
  //
  {CONTROLES DE FILTROS}
  Objeto.VALOR_FILTRO.Control    := edValorFiltro;
  Objeto.F_VALOR_PAGO.Control    := edF_VALOR_PAGO;
  Objeto.VALOR_CONSULTA.Control  := edValorConsulta;
  Objeto.TIPO_FILTRO.AsString    := cobpGpoProd;
  Objeto.TIPO_CONSULTA.AsString  := cobpVtaCart;
  //

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
  SetCurrentSearch ('B');
  pupGpoProducto.OnClick(pupGpoProducto);       // TWCrcobranz.oeTipoFiltroClick(Sender: TObject);
  //
  {Muestra la información inicial en la pantalla}
  Searching := False;
  //
  InterForma1.MsgPanel := pnlMsgs;
  LimpiaFiltro;
  LimpiaPantalla (True);   //  1. Barre el grid de datos y quita la información;
                           //  2. Limpia el registro de datos;
                           //  3. Limpia los edits de la pantalla;
                           //  4. Limpia la lista de disposiciones con garantia FEGA (vgLGarFEGA.Clear;)

  //
  case rgOperacion.ItemIndex of
    0: edImporteVenta.SetFocus;
    1: edValorConsulta.SetFocus;
  end;

  btnConsulta.Enabled := False;
  rgOperacion.ItemIndex := 0;
  rgOperacionClick(rgOperacion);
  TVerificaCambio.Tag := 0;
  TInitStatus.Enabled := True;
end;
// +---------------------------------------------------------------------------+
// +                   Evento OnClose de la forma                              +
// +---------------------------------------------------------------------------+
procedure TWCrVtaCart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
// +---------------------------------------------------------------------------+
// +                   Evento OnDestroy de la forma                            +
// +---------------------------------------------------------------------------+
procedure TWCrVtaCart.FormDestroy(Sender: TObject);
begin
  {CONTROLES DE FILTROS}
  Objeto.VALOR_FILTRO.Control      := nil;
  Objeto.F_VALOR_PAGO.Control      := nil;
  Objeto.VALOR_CONSULTA.Control    := nil;
  //
end;
// +---------------------------------------------------------------------------+
// +       Evento OnClic para los filtros adicionales de busqueda              +
// +---------------------------------------------------------------------------+
procedure TWCrVtaCart.oeFiltroAdicionalClick(Sender: TObject);
begin
  if ( Sender is TComponent ) then
    if ( Sender is TMenuItem ) then
    begin
      ( Sender as TMenuItem ).Checked := True;
      Objeto.FILTRO_OPERADO_NAFIN.AsString := '';
      Objeto.FILTRO_TIPO_INTERES.AsString  := '';
      //
    end;//ends_if_(_Sender is TMenuItem ) then
    //ends_if_(_Sender_is_TComponent_)_then
end;
// +---------------------------------------------------------------------------+
// +                   Evento OnClic del Tipo de busqueda                      +
// +---------------------------------------------------------------------------+
procedure TWCrVtaCart.oeTipoFiltroClick(Sender: TObject);
begin
  if ( Sender is TComponent ) then
  begin
    if FTipoBusqueda = 'B' then
      Objeto.TIPO_FILTRO.AsInteger :=( Sender as TComponent ).Tag  // 1 si Sender = pupGpoProducto
    else if FTipoBusqueda = 'C' then
      Objeto.TIPO_CONSULTA.AsInteger :=( Sender as TComponent ).Tag;  // 1 si Sender = pupGpoProducto
  end;
  //
  if ( Sender is TMenuItem ) then
     ( Sender as TMenuItem ).Checked := True;
  //
  //
  if ( Sender is TMenuItem ) then
    if ( Sender as TMenuItem ).GroupIndex = 1 then
      LimpiaPantalla;
  //
  SetTipoFiltro;
end;
// +---------------------------------------------------------------------------+
// +          Evento OnClic que activa o desactiva el filtro  de búsqueda      +
// +---------------------------------------------------------------------------+
procedure TWCrVtaCart.cbFiltroClick(Sender: TObject);
begin
  if Searched then
  begin
    LimpiaFiltro;
    LimpiaPantalla;
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +              Evento OnClic del boton de busqueda del filtro               +
// +---------------------------------------------------------------------------+
procedure TWCrVtaCart.btnFiltroClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRVTACART_GPOPR',True,True) then
   begin
      SetCurrentSearch ('B');
      BeginSearch( True, [] );
   end;
end;
// +---------------------------------------------------------------------------+
// +                Evento Ejecuta del InterLinkIt en el filtro                +
// +---------------------------------------------------------------------------+
procedure TWCrVtaCart.ikValorFiltroEjecuta(Sender: TObject);
begin
  //
  if ( StrToIntDef(ikValorFiltro.Buffer, -1 ) <> -1 ) and // Si la entrada es numerica y el
     ( Objeto.TIPO_FILTRO.AsString =  cobpGpoProd ) and
     (FTipoBusqueda = 'B') then  // filtro es grupo producto, asigna
    oeTipoFiltroClick( pupDisposicion )                   // filtro por disposicion
  else if ( StrToIntDef(ikValorFiltro.Buffer, -1 ) <> -1 ) and // Si la entrada es numerica y el
     ( Objeto.TIPO_CONSULTA.AsString =  cobpGpoProd ) and
     (FTipoBusqueda = 'C') then  // filtro es grupo producto, asigna
    oeTipoFiltroClick( Grupodeventa1 );                   // filtro por disposicion

  //
  BeginSearch( False, [ ikValorFiltro.Buffer ] );
end;
//</ENDS_LOLS_01_NOV_2006>

// +---------------------------------------------------------------------------+
// +                 Evento DrawCell del Grid de Datos                         +
// +---------------------------------------------------------------------------+
procedure TWCrVtaCart.sagDATOSDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
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
    if (ACol = COL_SEL) then
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
procedure TWCrVtaCart.sagDATOSMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var ACol  : Integer;
    ARow  : Integer;
begin
    sagDATOS.MouseToCell(X, Y ,ACol, ARow);
    //SELECCIONA LA COBRANZA DE LOS CONCEPTOS
    If (rgOperacion.ItemIndex =  0) and (ACol = COL_SEL) Then //  selecciona la cobranza de los conceptos
    begin
      sagDATOS.Cells [ACol, ARow] := BoolToStr (not StrToBool (sagDATOS.Cells [ACol, ARow]));
      SumaGrid;
    end;
    sagDatos.Row := ARow;
end;
// +---------------------------------------------------------------------------+
// +               Evento DrawCell del Grid de Datos (automatico)              +
// +   Cambia la información en pantalla de acuerdo a la seleccion del usuario +
// +---------------------------------------------------------------------------+
procedure TWCrVtaCart.sagDATOSSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if DataFound then
    DrawControls;
end;
// +---------------------------------------------------------------------------+
// +                Evento onDblClick del memo de mensajes                     +
// +---------------------------------------------------------------------------+
procedure TWCrVtaCart.MErroresDblClick(Sender: TObject);
begin
  MErrores.Lines.Clear;
end;
//
procedure TWCrVtaCart.InterForma1DespuesShow(Sender: TObject);
begin
  if Objeto.VALOR_FILTRO.AsString <> '' then
      Objeto.AsignaTipoFiltro( Objeto.VALOR_FILTRO.AsString,  ikValorFiltro);
end;

procedure TWCrVtaCart.sagDATOSKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((ssCtrl in Shift) and (Key = 86)) or ((ssShift in Shift) and (Key = 45)) then
    PasteFromClipboardToGrid (Sender);
end;

procedure TWCrVtaCart.PasteFromClipboardToGrid (Sender: TObject);
var
  Grid:           TStringAlignGrid;
  vlStr, vlCell:  string;
  i, col:         integer;
  vlExito:        boolean;
  vlHayGarantias: boolean;
  vlFlag:         boolean;
  vlDup:          TStringList;
begin
  vlHayGarantias := False;
  vlFlag         := False;
  Objeto.F_VALOR_PAGO.GetFromControl;

  if (Objeto.F_VALOR_PAGO.AsString = '') or not Clipboard.HasFormat (CF_TEXT) or not (Sender is TStringAlignGrid) then exit;

  Grid := TStringAlignGrid (Sender);
  Grid.Col := COL_CRED;

  col   := Grid.Col;
  vlDup := TStringList.Create;

  vlStr  := Clipboard.AsText;
  vlCell := '';
  for i := 1 to Length (vlStr) do
    case vlStr [i] of
      //Cambio de celda
      #9: begin
        vlExito := False;
        try
          if (col = COL_CRED) and (StrToInt (vlCell) > 0) then
          begin
            vlExito := AddGridCredito (StrToInt (vlCell), vlDup, vlFlag);
            vlHayGarantias := vlHayGarantias or vlFlag;
          end;
        except
          on E: EConvertError do ;
        end;

        vlCell := '';
        if vlExito then
          Inc (col);
      end;
      //Inicio de linea
      #10: begin
        vlCell := '';
        col    := Grid.Col;
      end;
      //Salto de linea
      #13: begin
        try
          if (col = COL_CRED) and (StrToInt (vlCell) > 0) then
          begin
            AddGridCredito (StrToInt (vlCell), vlDup, vlFlag);
            vlHayGarantias := vlHayGarantias or vlFlag;
          end;
        except
          on E: EConvertError do ;
        end;

        vlCell := '';
      end;
      else vlCell := vlCell + vlStr [i];
    end;
  if (vlCell <> '') and (col = COL_CRED) then
  begin
    try
      if (col = COL_CRED) and (StrToInt (vlCell) > 0) then
      begin
        AddGridCredito (StrToInt (vlCell), vlDup, vlFlag);
        vlHayGarantias := vlHayGarantias or vlFlag;
      end;
    except
      on E: EConvertError do ;
    end;
  end;
  SumaGrid;

  if vlDup.Count > 0 then
  begin
    AddError ('Las siguientes disposiciones no están activas: ');

    for i := 0 to vlDup.Count - 1 do
      AddError ('   ' + vlDup [i] + '.');
  end;
  vlDup.Free;

  //Si al final no se ocupó el renglón final, y es más de un renglón, lo elimina
  if (Grid.Cells [COL_CRED, Grid.RowCount -1] = '') and (Grid.RowCount > 1) then
  begin
    Grid.RowCount := Grid.RowCount - 1;
    Grid.Row      := Grid.RowCount - 1;
  end;

  if vlHayGarantias then
    MessageDlg ('Uno o más créditos tienen garantías y no pueden ser procesados hasta que se desasignen', mtWarning, [mbOk], 0);
end;

procedure TWCrVtaCart.ClearRecord (peRow: integer);
var
  i: integer;
begin
  for i := 0 to sagDatos.ColCount - 1 do
    sagDatos.Cells [i, peRow] := '';
end;

procedure TWCrVtaCart.RecalcGrid;
var
  vlImpCapital, vlImpInteres, vlImpFinanAdic, vlImpComision,
  vlMorCapital, vlMorInteres, vlMorFinanAdic, vlMorComision,
  vlTotal: Double;
  vlError: string;
  vlGarantia, vlMsgGarantia: boolean;
  vlResult, i, j, vlIDCredito: integer;
begin
  Application.ProcessMessages;
  //Estable el formato inicial para las celdas numericas
  Objeto.F_VALOR_PAGO.GetFromControl;
  vlMsgGarantia := False;
  for i := 0 to sagDatos.RowCount - 1 do
  begin
    if (sagDatos.Cells [COL_CRED, i] <> '') and StrToBool (sagDatos.Cells [COL_SEL, i]) then
    begin
      vlIDCredito := StrToInt (sagDatos.Cells [COL_CRED, i]);

      Objeto.StpObtAdeudo (vlIDCredito, Objeto.F_VALOR_PAGO.AsDateTime,
                           vlImpCapital, vlImpInteres, vlImpFinanAdic, vlImpComision,
                           vlMorCapital, vlMorInteres, vlMorFinanAdic, vlMorComision,
                           vlGarantia,
                           vlResult, vlError);

      vlMsgGarantia := vlMsgGarantia or vlGarantia;
      if vlGarantia then
        sagDatos.Cells [COL_CLCW, sagDatos.Row] := '1'
      else
        sagDatos.Cells [COL_CLCW, sagDatos.Row] := '0';

      for j := 0 to sagDATOS.ColCount - 1 do
        if j in [COL_CRED, COL_MORCOM, COL_MORFIN, COL_MORCAP, COL_IMPCOM, COL_IMPINT, COL_IMPFIN, COL_IMPCAP, COL_TOTAL] then
        begin
          if vlGarantia then
            sagDatos.CellFont [j, sagDatos.Row].Color := clRed
          else
            sagDatos.CellFont [j, sagDatos.Row].Color := clBlack;
        end;

      vlTotal := vlImpCapital + vlImpInteres + vlImpFinanAdic + vlImpComision +
                 vlMorCapital + vlMorInteres + vlMorFinanAdic + vlMorComision;

      sagDatos.Cells [COL_MORCOM, sagDatos.Row] := Format (CFORMAT_DINERO, [vlMorComision]);
      sagDatos.Cells [COL_MORFIN, sagDatos.Row] := Format (CFORMAT_DINERO, [vlMorFinanAdic]);
      sagDatos.Cells [COL_MORCAP, sagDatos.Row] := Format (CFORMAT_DINERO, [vlMorCapital]);
      sagDatos.Cells [COL_IMPCOM, sagDatos.Row] := Format (CFORMAT_DINERO, [vlImpComision]);
      sagDatos.Cells [COL_IMPINT, sagDatos.Row] := Format (CFORMAT_DINERO, [vlImpInteres]);
      sagDatos.Cells [COL_IMPFIN, sagDatos.Row] := Format (CFORMAT_DINERO, [vlImpFinanAdic]);
      sagDatos.Cells [COL_IMPCAP, sagDatos.Row] := Format (CFORMAT_DINERO, [vlImpCapital]);
      sagDatos.Cells [COL_TOTAL,  sagDatos.Row] := Format (CFORMAT_DINERO, [vlTotal]);

      SumaGrid;
    end;
  end;

  if vlMsgGarantia then
    MessageDlg ('Uno o más créditos tienen garantías y no pueden ser procesados hasta que se desasignen', mtWarning, [mbOk], 0);
end;

function TWCrVtaCart.AddGridCredito (peIDCredito: integer; vlDup: TStringList; var psHayGarantia: boolean): boolean;
var
  vlImpCapital, vlImpInteres, vlImpFinanAdic, vlImpComision,
  vlMorCapital, vlMorInteres, vlMorFinanAdic, vlMorComision,
  vlTotal: Double;
  vlError: string;
  vlGarantia, vlMsgGarantia: boolean;
  vlResult, i: integer;
begin
  result := False;
  vlMsgGarantia := False;

  try
    //Verifica que el credito no se encuentre en la lista
    for i := 0 to sagDatos.RowCount - 1 do
      if (sagDatos.Cells [COL_CRED, i] <> '') and (peIDCredito = StrToInt (sagDatos.Cells [COL_CRED, i])) then
        exit;

    //Estable el formato inicial para las celdas numericas
    Objeto.F_VALOR_PAGO.GetFromControl;

    Objeto.StpObtAdeudo (peIDCredito, Objeto.F_VALOR_PAGO.AsDateTime,
                         vlImpCapital, vlImpInteres, vlImpFinanAdic, vlImpComision,
                         vlMorCapital, vlMorInteres, vlMorFinanAdic, vlMorComision,
                         vlGarantia,
                         vlResult, vlError);

    if vlError = '' then
    begin
      if sagDatos.RowCount = 0 then
      begin
        sagDatos.RowCount := 1;
        ClearRecord (0);
      end;

      if sagDatos.Cells [COL_CRED, sagDatos.RowCount - 1] <> '' then
        sagDatos.RowCount := sagDatos.RowCount + 1;

      sagDatos.Row := sagDatos.RowCount - 1;

      vlMsgGarantia := vlMsgGarantia or vlGarantia;
      if vlGarantia then
        sagDatos.Cells [COL_CLCW, sagDatos.Row] := '1'
      else
        sagDatos.Cells [COL_CLCW, sagDatos.Row] := '0';

      for i := 0 to sagDATOS.ColCount - 1 do
        if i in [COL_CRED, COL_MORCOM, COL_MORFIN, COL_MORCAP, COL_IMPCOM, COL_IMPINT, COL_IMPFIN, COL_IMPCAP, COL_TOTAL] then
        begin
          sagDatos.AlignCell [i, sagDatos.Row] := alRight;
          sagDatos.Cells     [i, sagDatos.Row] := '';
          if vlGarantia then
            sagDatos.CellFont [i, sagDatos.Row].Color := clRed
          else
            sagDatos.CellFont [i, sagDatos.Row].Color := clBlack;
        end;

      sagDATOS.Cells [COL_CRED, sagDatos.Row] := IntToStr (peIDCredito);
      sagDatos.Cells [COL_SEL,  sagDatos.Row] := BoolToStr (True);
      vlTotal := vlImpCapital + vlImpInteres + vlImpFinanAdic + vlImpComision +
                 vlMorCapital + vlMorInteres + vlMorFinanAdic + vlMorComision;

      sagDatos.Cells [COL_MORCOM, sagDatos.Row] := Format (CFORMAT_DINERO, [vlMorComision]);
      sagDatos.Cells [COL_MORFIN, sagDatos.Row] := Format (CFORMAT_DINERO, [vlMorFinanAdic]);
      sagDatos.Cells [COL_MORCAP, sagDatos.Row] := Format (CFORMAT_DINERO, [vlMorCapital]);
      sagDatos.Cells [COL_IMPCOM, sagDatos.Row] := Format (CFORMAT_DINERO, [vlImpComision]);
      sagDatos.Cells [COL_IMPINT, sagDatos.Row] := Format (CFORMAT_DINERO, [vlImpInteres]);
      sagDatos.Cells [COL_IMPFIN, sagDatos.Row] := Format (CFORMAT_DINERO, [vlImpFinanAdic]);
      sagDatos.Cells [COL_IMPCAP, sagDatos.Row] := Format (CFORMAT_DINERO, [vlImpCapital]);
      sagDatos.Cells [COL_TOTAL,  sagDatos.Row] := Format (CFORMAT_DINERO, [vlTotal]);

      result := True;
    end
    else
      if vlResult = 7101 then
        vlDup.Add (IntToStr (peIDCredito))
      else
        AddError (vlError);

  finally
    SumaGrid;
    psHayGarantia := vlMsgGarantia;
  end;
end;

procedure TWCrVtaCart.SumaGrid;
var
  vlImpCapital, vlImpInteres, vlImpFinanAdic, vlImpComision,
  vlMorCapital,               vlMorFinanAdic, vlMorComision,
  vlTotal: Double;
  i, n: integer;
begin
  vlImpCapital   := 0;
  vlImpInteres   := 0;
  vlImpFinanAdic := 0;
  vlImpComision  := 0;
  vlMorCapital   := 0;
  vlMorFinanAdic := 0;
  vlMorComision  := 0;
  vlTotal        := 0;
  n              := 0;

  for i := 0 to sagDatos.RowCount - 1 do
    if StrToBool (sagDatos.Cells [COL_SEL, i]) then
    begin
      Inc (n);
      vlImpCapital   := vlImpCapital   + CurrFromFrmFloat (sagDatos.Cells [COL_IMPCAP, i]);
      vlImpInteres   := vlImpInteres   + CurrFromFrmFloat (sagDatos.Cells [COL_IMPINT, i]);
      vlImpFinanAdic := vlImpFinanAdic + CurrFromFrmFloat (sagDatos.Cells [COL_IMPFIN, i]);
      vlImpComision  := vlImpComision  + CurrFromFrmFloat (sagDatos.Cells [COL_IMPCOM, i]);
      vlMorCapital   := vlMorCapital   + CurrFromFrmFloat (sagDatos.Cells [COL_MORCAP, i]);
      vlMorFinanAdic := vlMorFinanAdic + CurrFromFrmFloat (sagDatos.Cells [COL_MORFIN, i]);
      vlMorComision  := vlMorComision  + CurrFromFrmFloat (sagDatos.Cells [COL_MORCOM, i]);
      vlTotal        := vlTotal        + CurrFromFrmFloat (sagDatos.Cells [COL_TOTAL, i]);
    end;

  edFootCred.Text         := Format ('Total: %d', [n]);
  edFootMorCapital.Text   := Format (CFORMAT_DINERO, [vlMorCapital])   + ' ';
  edFootMorFinanAdic.Text := Format (CFORMAT_DINERO, [vlMorFinanAdic]) + ' ';
  edFootMorComision.Text  := Format (CFORMAT_DINERO, [vlMorComision])  + ' ';
  edFootImpCapital.Text   := Format (CFORMAT_DINERO, [vlImpCapital])   + ' ';
  edFootImpInteres.Text   := Format (CFORMAT_DINERO, [vlImpInteres])   + ' ';
  edFootImpFinanAdic.Text := Format (CFORMAT_DINERO, [vlImpFinanAdic]) + ' ';
  edFootImpComision.Text  := Format (CFORMAT_DINERO, [vlImpComision])  + ' ';
  edFootTotal.Text        := Format (CFORMAT_DINERO, [vlTotal])  + ' ';
end;

procedure TWCrVtaCart.sbSelectAllClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to sagDatos.RowCount - 1 do
    sagDatos.Cells [COL_SEL, i] := BoolToStr (True);
  SumaGrid;
end;

procedure TWCrVtaCart.sbUnselectAllClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to sagDatos.RowCount - 1 do
    sagDatos.Cells [COL_SEL, i] := BoolToStr (False);
  SumaGrid;
end;

procedure TWCrVtaCart.sbLimpiaGridClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to sagDatos.RowCount - 1 do
    ClearRecord (i);
  sagDatos.RowCount := 1;
  ClearRecord (0);
  SumaGrid;
end;

procedure TWCrVtaCart.actPasteExecute(Sender: TObject);
begin
  PasteFromClipboardToGrid (sagDatos);
end;

procedure TWCrVtaCart.sbPasteClick(Sender: TObject);
begin
  actPaste.Execute;
end;

procedure TWCrVtaCart.actDisplayCredExecute(Sender: TObject);
var
  vlIDCredito: integer;
begin
  if sagDatos.Cells [COL_CRED, sagDatos.Row] = '' then exit;
  try
    vlIDCredito := StrToInt (sagDatos.Cells [COL_CRED, sagDatos.Row]);
    MuestraCredito (vlIDCredito);
  except
    on E: EConvertError do;
  end;
end;

procedure TWCrVtaCart.sagDATOSDblClick(Sender: TObject);
begin
  actDisplayCred.Execute;
end;

procedure TWCrVtaCart.MuestraCredito(nId_Credito : Integer);
var
  CrCredito: TCrCredito;
begin
  CrCredito := TCrCredito.Create(Self);
  try
    CrCredito.GetParams(Objeto);
    CrCredito.ID_CREDITO.AsInteger := nId_Credito;
    CrCredito.ParamCre := Objeto.ParamCre;
    CrCredito.FindKey([nId_Credito]);
    CrCredito.Catalogo;
  finally
    if Assigned(CrCredito) then CrCredito.Free;
  end;
end;

procedure TWCrVtaCart.AgregaCreditosBusqueda (peAgregaGrid: boolean);
var
  vlSQL          : string;
  Qry            : TQuery;
  vlDup          : TStringList;
  i              : integer;
  vlFlag         : boolean;
  vlHayGarantias : boolean;
begin
  if Searching then exit; // Valida que no exista una busqueda en curso ...
  vlHayGarantias := False;
  vlFlag         := False;

  Objeto.F_VALOR_PAGO.GetFromControl;

  if (Objeto.F_VALOR_PAGO.AsString = '') or (Objeto.VALOR_FILTRO.AsString = '') or (Objeto.TIPO_FILTRO.AsString = '') then exit;
  vlSQL := '';

  if Objeto.TIPO_FILTRO.AsString = cobpGpoProd then
    vlSQL := 'Select Distinct C.ID_Credito '                                         + coCRLF +
             '  From CR_Producto P'                                                  + coCRLF +
             '  Join CR_Contrato Cto On (P.Cve_Producto_Cre = Cto.Cve_Producto_Cre)' + coCRLF +
             '  Join CR_Credito  C   On (Cto.ID_Contrato    = C.ID_Contrato)'        + coCRLF +
             ' Where P.Cve_Producto_Gpo = ''' + Objeto.VALOR_FILTRO.AsString + ''''  + coCRLF +
             '   And C.Sit_Credito = ''AC'''
  else if Objeto.TIPO_FILTRO.AsString = cobpAcred then
    vlSQL := 'Select Distinct C.ID_Credito'                                            + coCRLF +
             '  From CR_Acreditado A'                                                  + coCRLF +
             '  Join Contrato      Ctto On (A.ID_Acreditado     = Ctto.ID_Titular)'    + coCRLF +
             '  Join CR_Contrato   CC   On (Ctto.ID_Contrato    = CC.ID_Contrato)'     + coCRLF +
             '  Join CR_Credito    C    On (CC.ID_Contrato      = C.ID_Contrato   And' + coCRLF +
             '                              CC.Fol_Contrato     = C.Fol_Contrato)'     + coCRLF +
             ' Where A.ID_Acreditado = ' + Objeto.VALOR_FILTRO.AsString                + coCRLF +
             '   And C.Sit_Credito = ''AC'''
  else if Objeto.TIPO_FILTRO.AsString = cobpAutor then
    vlSQL := 'Select ID_Credito'                                    + coCRLF +
             '  From CR_Credito'                                    + coCRLF +
             ' Where ID_Contrato = ' + Objeto.VALOR_FILTRO.AsString + coCRLF +
             '   And Sit_Credito = ''AC'''
  else if Objeto.TIPO_FILTRO.AsString = cobpDisp then
    vlSQL := 'Select ID_Credito'                                   + coCRLF +
             '  From CR_Credito'                                   + coCRLF +
             ' Where ID_Credito = ' + Objeto.VALOR_FILTRO.AsString + coCRLF +
             '   And Sit_Credito = ''AC''';

  if vlSQL = '' then exit;

  // ---------  Construye la cadena SQL de busqueda y obtiene un Query ---------
  Qry    := GetSQLQueryNoNil( vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
  if Assigned(Qry) then
  try
    if not( Qry.IsEmpty ) then
    begin
      Qry.First;
      DataFound := True;
      vlDup     := TStringList.Create;

      if not peAgregaGrid then
      begin
        for i := 0 to sagDatos.RowCount - 1 do
          ClearRecord (i);
        sagDatos.RowCount := 1;
      end;

      while not Qry.Eof Do
      begin
        AddGridCredito (Qry.FieldByName('ID_CREDITO').AsInteger, vlDup, vlFlag);
        vlHayGarantias := vlHayGarantias or vlFlag;
        Qry.Next;
        //
        Application.ProcessMessages;
      end; //end While
      if (sagDatos.RowCount > 1) and (sagDatos.Cells [COL_CRED, sagDatos.RowCount - 1] = '') then
        sagDatos.RowCount := sagDatos.RowCount - 1;

      if vlDup.Count > 0 then
      begin
        AddError ('Las siguientes disposiciones no están activas: ');

        for i := 0 to vlDup.Count - 1 do
          AddError ('   ' + vlDup [i] + '.');
      end;
      vlDup.Free;
    end;
    Qry.Close;
    Qry.Free;

    if vlHayGarantias then
      MessageDlg ('Uno o más créditos tienen garantías y no pueden ser procesados hasta que se desasignen', mtWarning, [mbOk], 0);
  except
    on e : exception do begin
      DataFound := False;
    end;
  end;
end;

procedure TWCrVtaCart.btnAgregaCreditosClick(Sender: TObject);
begin
  AgregaCreditosBusqueda (True);
end;

procedure TWCrVtaCart.btnReemplazaCreditosClick(Sender: TObject);
begin
  AgregaCreditosBusqueda (False);
end;

function TWCrVtaCart.SelectedRows: integer;
var
  i: integer;
begin
  result := 0;
  for i := 0 to sagDatos.RowCount - 1 do
    if StrToBool (sagDatos.Cells [COL_SEL, i]) then
      Inc (result);
end;

procedure TWCrVtaCart.btnVentaCarteraClick(Sender: TObject);
var
  vlImporteVta : double;
  vlTxResult   : string;
  i            : integer;
  vlsql        : string;
  vlDia        : Integer;
  vlDias       : Integer;
  vlDiaInicial : TDateTime;
  vlIDGpoVta   : integer;
begin
   if Objeto.ValidaAccesoEsp('TCRVTACART_VTACR',True,True) then
   begin
      Objeto.F_VALOR_PAGO.GetFromControl;

      //Valida la fecha valor
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

      //Valida que los datos requeridos tengan valor
      if edImporteVenta.Text = '' then
      begin
        MessageDlg ('Es necesario especificar el importe de la venta.', mtWarning, [mbOk], 0);
        edImporteVenta.SetFocus;
        exit;
      end;

      if edF_VALOR_PAGO.Text = '' then
      begin
        MessageDlg ('La fecha valor es requerida.', mtWarning, [mbOk], 0);
        edF_VALOR_PAGO.SetFocus;
        exit;
      end;

      if SelectedRows = 0 then
      begin
        MessageDlg ('Es necesario al menos una disposición seleccionada en la lista.', mtWarning, [mbOk], 0);
        sagDatos.SetFocus;
        exit;
      end;

      vlImporteVta := CurrFromFrmFloat (edImporteVenta.Text);

      //Verifica que el importe de la venta cubra al menos los intereses
      if (vlImporteVta < CurrFromFrmFloat (edFootImpInteres.Text)) and
         (MessageDlg ('El importe total de la venta no alcanza a cubrir el importe de los intereses. ¿Quiéres aplicar la venta de cartera de cualquier manera?',
                    mtWarning, mbYesNoCancel, 0) <> mrYes) then
        exit;

      //Limpia la tabla de proceso
      Objeto.LimpiaTablaVta (vlTxResult);
      ValidaError (vlTxResult);

      //Agrega los creditos en la tabla
      for i := 0 to sagDatos.RowCount - 1 do
        if StrToBool (sagDatos.Cells [COL_SEL, i]) then
        begin
          if sagDatos.Cells [COL_CLCW, i] = '1' then
          begin
            MessageDlg ('Uno o más créditos tienen garantías y no pueden ser procesados hasta que se desasignen', mtWarning, [mbOk], 0);
            exit;
          end;

          Objeto.AgregaElemento (StrToInt (sagDatos.Cells [COL_CRED, i]), vlTxResult);
          if ValidaError (vlTxResult) then
          begin
            if not ( MessageDlg( coErrorCob, mtConfirmation, [mbYes, mbNo], 0  ) = mrYes ) then
              exit;       // coErrorCob: 'Ha ocurrido un error. ¿Desea continuar?';
            //end_if
          end;//ends_if_ValidaError(_vlTxResult_)_then
        end;

      //Aplica la venta de cartera
      Objeto.AplicaVenta (vlImporteVta,
                          Objeto.Apli.Usuario,
                          Objeto.F_VALOR_PAGO.AsDateTime,
                          mComentarios.Lines.Text,
                          cbReportaBuro.Checked,
                          True,
                          vlIDGpoVta,
                          vlTxResult);

      if ValidaError (vlTxResult) then
        MessageDlg ('Se presentaro errores durante la aplicación de la venta de cartera.', mtError, [mbOk], 0)
      else
      begin
        MessageDlg ('Proceso de venta de cartera realizado con éxito.', mtInformation, [mbOk], 0);

        AddError ('******************************************************************');
        AddError ('Venta de cartera efectuada con la siguiente información:');
        AddError ('Identificador del grupo de venta:          ' +  IntToStr (vlIDGpoVta));
        AddError ('Importe de venta:                          ' +  edImporteVenta.Text);
        AddError ('Fecha valor:                               ' + edF_VALOR_PAGO.Text);
        AddError ('La institución reporta en Buró de Crédito: ' + BoolToStr (cbReportaBuro.Checked));
        AddError ('Comentarios:');

        for i := 0 to MComentarios.Lines.Count - 1 do
          AddError ('  ' + MComentarios.Lines [i]);

        AddError ('Lista de disposiciones:');
        for i := 0 to sagDatos.RowCount - 1 do
          if (sagDatos.Cells [COL_CRED, i] <> '') and StrToBool (sagDatos.Cells [COL_SEL, i]) then
            AddError ('     ' + sagDatos.Cells [COL_CRED, i]);
        AddError ('******************************************************************');
        AddError ('');

        sbLimpiaGridClick (sbLimpiaGrid);
        LimpiaPantalla (True);
      end;
   end;
end;

procedure TWCrVtaCart.edF_VALOR_PAGOExit(Sender: TObject);
begin
  GetFromControls;
end;

procedure TWCrVtaCart.edF_VALOR_PAGOKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = coCR then
  begin
    edF_VALOR_PAGOExit (edF_Valor_Pago); // Procesa una posible modificacion a la fecha  de pago
    Key := #0;
  end;
end;

procedure TWCrVtaCart.GetFromControls;
begin
  // DE LA SECCION DE PARAMETROS
  Objeto.F_VALOR_PAGO.GetFromControl;
end;

procedure TWCrVtaCart.edF_VALOR_PAGOChange(Sender: TObject);
begin
  RecalcGrid;
end;

procedure TWCrVtaCart.edValorFiltroEnter(Sender: TObject);
begin
  SetCurrentSearch ('B');
end;

procedure TWCrVtaCart.pupFiltroBusquedaPopup(Sender: TObject);
begin
  SetCurrentSearch ('B');
end;

procedure TWCrVtaCart.pupTipoConsultaChange(Sender: TObject;
  Source: TMenuItem; Rebuild: Boolean);
begin
  SetCurrentSearch ('C');
end;

procedure TWCrVtaCart.edValorConsultaEnter(Sender: TObject);
begin
  SetCurrentSearch ('C');
end;

procedure TWCrVtaCart.btnConsultaClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRVTACART_BSVTA',True,True) then
   begin
      SetCurrentSearch ('C');
      BeginSearch( True, [] );
   end;
end;

procedure TWCrVtaCart.ConsultaVta (peTipoID, peID: integer);
var
  vlSQL          : string;
  Qry, QGpoVta   : TQuery;
  vlIDGpoVta     : integer;
  vlTotal        : Double;
  i              : integer;
  vlSitVta       : string;
  vlMsgError     : string;
begin
  vlIDGpoVta              := 0;
  vlMsgError              := '';
  btnCancelaVenta.Enabled := False;
  if IntToStr (peTipoID) = cobpDisp then
  begin
    vlSQL := 'Select Max (ID_Grupo_Vta) Ultimo'       + coCRLF +
             '  From CR_Vta_Cartera_Det'              + coCRLF +
             ' Where ID_Credito = ' + IntToStr (peID);
    QGpoVta := GetSQLQueryNoNil( vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
    if Assigned (QGpoVta) then
    begin
      if (QGpoVta.RecordCount = 0) or QGpoVta.FieldByName ('Ultimo').IsNull then
      begin
        MessageDlg ('No se ha encontrado ninguna venta de cartera para esa disposición', mtInformation, [mbOk], 0);
        exit;
      end;
      vlIDGpoVta := QGpoVta.FieldByName ('Ultimo').AsInteger;
      QGpoVta.Free;
    end;
  end
  else
  begin
    vlSQL := 'Select ID_Grupo_Vta'    + coCRLF +
             '  From CR_Vta_Cartera'  + coCRLF +
             ' Where ID_Grupo_Vta = ' + IntToStr (peID);
    QGpoVta := GetSQLQueryNoNil( vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
    if Assigned (QGpoVta) then
    begin
      if (QGpoVta.RecordCount = 0) or QGpoVta.FieldByName ('ID_Grupo_Vta').IsNull then
      begin
        MessageDlg ('No existe la venta de cartera especificada', mtInformation, [mbOk], 0);
        exit;
      end;
      vlIDGpoVta := QGpoVta.FieldByName ('ID_Grupo_Vta').AsInteger;
      QGpoVta.Free;
    end;
  end;

  if vlIDGpoVta = 0 then exit;

  vlSQL := 'Select V.*, PkgCrCobranza.FunObtVtaCartSit (V.ID_Grupo_Vta) Sit_Venta' + coCRLF +
           '  From CR_Vta_Cartera V'                                               + coCRLF +
           ' Where V.ID_Grupo_Vta = ' + IntToStr (vlIDGpoVta);
  Qry := GetSQLQueryNoNil( vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
  if Assigned (Qry) then
  begin
    edImporteVenta.Text     := Qry.FieldByName ('Imp_Venta').AsString;
    dtF_VALOR_PAGO.DateTime := Qry.FieldByName ('F_Valor').AsDateTime;
    cbReportaBuro.Checked   := StrToBool (Qry.FieldByName ('B_Inst_Fin_Rep_Buro').AsString);
    mComentarios.Lines.Text := Qry.FieldByName ('Descripcion').AsString;
    vlSitVta                := Qry.FieldByName ('Sit_Venta').AsString;
    btnCancelaVenta.Enabled := (vlSitVta = 'AC') or (vlSitVta = 'ER');

    labSituacion.Font.Color := clWindowText;
    if vlSitVta = 'AC' then
      labSituacion.Caption := 'ACTIVA'
    else if vlSitVta = 'CA' then
      labSituacion.Caption := 'CANCELADA'
    else
    begin
      labSituacion.Font.Color := clRed;
      if vlSitVta = 'ER' then
      begin
        labSituacion.Caption := 'CON ERROR';
        vlMsgError           := 'La venta presenta inconsistencias, tiene transacciones o disposiciones en estado activo e inactivo.';
      end
      else if vlSitVta = 'UE' then
      begin
        labSituacion.Caption := 'CON ERROR';
        vlMsgError           := 'La venta presenta errores.';
      end
    end;

    vlSQL := 'Select ID_Credito, Imp_Capital, Imp_Interes, Imp_Finan_Adic, Imp_Comision'  + coCRLF +
             '  From CR_Vta_Cartera_Det'                                                  + coCRLF +
             ' Where ID_Grupo_Vta = ' + IntToStr (vlIDGpoVta)                             + coCRLF +
             ' Order By ID_Credito';

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Text := vlSQL;
    Qry.Open;

    sbLimpiaGridClick (sbLimpiaGrid);
    sagDatos.RowCount := 1;

    if Qry.RecordCount > 0 then
    begin
      while not Qry.Eof do
      begin
        sagDatos.Row   := sagDatos.RowCount - 1;
        for i := 0 to sagDATOS.ColCount - 1 do
          if i in [COL_CRED, COL_MORCOM, COL_MORFIN, COL_MORCAP, COL_IMPCOM, COL_IMPINT, COL_IMPFIN, COL_IMPCAP, COL_TOTAL] then
          begin
            sagDatos.AlignCell [i, sagDatos.Row]       := alRight;
            sagDatos.Cells     [i, sagDatos.Row]       := '';
            sagDatos.CellFont  [i, sagDatos.Row].Color := clBlack;
          end;

        vlTotal := Qry.FieldByName ('Imp_Comision').AsFloat   +
                   Qry.FieldByName ('Imp_Interes').AsFloat    +
                   Qry.FieldByName ('Imp_Finan_Adic').AsFloat +
                   Qry.FieldByName ('Imp_Capital').AsFloat;

        sagDATOS.Cells [COL_CRED,   sagDatos.Row] := Qry.FieldByName ('ID_Credito').AsString;
        sagDatos.Cells [COL_SEL,    sagDatos.Row] := BoolToStr (True);
        sagDatos.Cells [COL_MORCOM, sagDatos.Row] := Format (CFORMAT_DINERO, [0.00]);
        sagDatos.Cells [COL_MORFIN, sagDatos.Row] := Format (CFORMAT_DINERO, [0.00]);
        sagDatos.Cells [COL_MORCAP, sagDatos.Row] := Format (CFORMAT_DINERO, [0.00]);
        sagDatos.Cells [COL_IMPCOM, sagDatos.Row] := Format (CFORMAT_DINERO, [Qry.FieldByName ('Imp_Comision').AsFloat]);
        sagDatos.Cells [COL_IMPINT, sagDatos.Row] := Format (CFORMAT_DINERO, [Qry.FieldByName ('Imp_Interes').AsFloat]);
        sagDatos.Cells [COL_IMPFIN, sagDatos.Row] := Format (CFORMAT_DINERO, [Qry.FieldByName ('Imp_Finan_Adic').AsFloat]);
        sagDatos.Cells [COL_IMPCAP, sagDatos.Row] := Format (CFORMAT_DINERO, [Qry.FieldByName ('Imp_Capital').AsFloat]);
        sagDatos.Cells [COL_TOTAL,  sagDatos.Row] := Format (CFORMAT_DINERO, [vlTotal]);

        sagDatos.RowCount := sagDatos.RowCount + 1;
        Qry.Next;
        Application.ProcessMessages;
      end;
      sagDatos.RowCount := sagDatos.RowCount - 1;
      SumaGrid;
      Application.ProcessMessages;
    end;

    if ((vlSitVta = 'ER') or (vlSitVta = 'UR')) and (vlMsgError <> '') then
      MessageDlg (vlMsgError, mtError, [mbOk], 0);

    Qry.Free;
  end;

end;


procedure TWCrVtaCart.btnDisplayConsultaClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRVTACART_CONSU',True,True) then
   begin
      Objeto.VALOR_CONSULTA.GetFromControl;
      ConsultaVta (Objeto.TIPO_CONSULTA.AsInteger, Objeto.VALOR_CONSULTA.AsInteger);
   end;
end;

procedure TWCrVtaCart.edValorConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) and (edValorConsulta.Text <> '') then
    btnDisplayConsultaClick (btnDisplayConsulta);
end;

procedure TWCrVtaCart.btnCancelaVentaClick(Sender: TObject);
var
  vlSQL:      string;
  Qry:        TQuery;
  QGpoVta:    TQuery;
  vlResult:   Double;
  vlTxResult: string;
  vlIDGpoVta: integer;
begin
   if Objeto.ValidaAccesoEsp('TCRVTACART_CANVT',True,True) then
   begin
    vlIDGpoVta := 0;
    Objeto.VALOR_CONSULTA.GetFromControl;
    if Objeto.VALOR_CONSULTA.AsInteger = 0 then
    begin
      MessageDlg ('Es necesario especificar el identificador de una venta', mtInformation, [mbOk], 0);
      exit;
    end;

    if Objeto.TIPO_CONSULTA.AsString = cobpDisp then
    begin
      vlSQL := 'Select Max (ID_Grupo_Vta) Ultimo'       + coCRLF +
               '  From CR_Vta_Cartera_Det'              + coCRLF +
               ' Where ID_Credito = ' + IntToStr (Objeto.VALOR_CONSULTA.AsInteger);
      QGpoVta := GetSQLQueryNoNil( vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
      if Assigned (QGpoVta) then
      begin
        if (QGpoVta.RecordCount = 0) or QGpoVta.FieldByName ('Ultimo').IsNull then
        begin
          MessageDlg ('No se ha encontrado ninguna venta de cartera para esa disposición', mtInformation, [mbOk], 0);
          exit;
        end;
        vlIDGpoVta := QGpoVta.FieldByName ('Ultimo').AsInteger;
        QGpoVta.Free;
      end;
    end
    else
      vlIDGpoVta := Objeto.VALOR_CONSULTA.AsInteger;


    vlSQL := 'Select V.*, PkgCrCobranza.FunObtVtaCartSit (V.ID_Grupo_Vta) Sit_Venta' + coCRLF +
             '  From CR_Vta_Cartera V'                                               + coCRLF +
             ' Where V.ID_Grupo_Vta = ' + IntToStr (vlIDGpoVta);
    Qry := GetSQLQueryNoNil( vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
    if Assigned (Qry) then
      try
        if (Qry.FieldByName ('SIT_VENTA').AsString <> 'AC') and
           (Qry.FieldByName ('SIT_VENTA').AsString <> 'ER') then exit;

        Objeto.StpCancelaVta (vlIDGpoVta, vlResult, vlTxResult);

        AddError ('******************************************************************');
        if vlResult = 0 then
        begin
          AddError ('Cancelación de Venta de cartera efectuada exitosamente con la siguiente información:');
          AddError ('Identificador del grupo de venta:          ' +  IntToStr (vlIDGpoVta));
        end
        else
        begin
          AddError ('Cancelación de Venta de cartera efectuada con error con la siguiente información:');
          AddError ('Identificador del grupo de venta: ' +  IntToStr (vlIDGpoVta));
          AddError ('Código de error:                  ' +  vlTxResult);
        end;
        AddError ('******************************************************************');
        AddError ('');

        if vlResult = 0 then
          MessageDlg ('La venta fue cancelada exitosamente!', mtInformation, [mbOk], 0)
        else
          MessageDlg ('La venta no pudo ser cancelada, se presentaron errores durante la cancelación!', mtError, [mbOk], 0);
        btnDisplayConsultaClick (btnDisplayConsulta);
      finally
        Qry.Free;
      end;
   end;
end;

procedure TWCrVtaCart.rgOperacionClick(Sender: TObject);
begin
  SetTipoFiltro;

  // Controles para la consulta y cancelacion
  tbTipoConsulta.Enabled     := rgOperacion.ItemIndex = 1;
  edValorConsulta.Enabled    := rgOperacion.ItemIndex = 1;
  btnConsulta.Enabled        := rgOperacion.ItemIndex = 1;
  btnDisplayConsulta.Enabled := rgOperacion.ItemIndex = 1;
  btnCancelaVenta.Enabled    := False;

  //Controles para la venta
  edImporteVenta.ReadOnly                 := rgOperacion.ItemIndex <> 0;
  edF_VALOR_PAGO.ReadOnly                 := rgOperacion.ItemIndex <> 0;
  dtF_VALOR_PAGO.Enabled                  := rgOperacion.ItemIndex =  0;
  cbReportaBuro.Enabled                   := rgOperacion.ItemIndex =  0;
  mComentarios.ReadOnly                   := rgOperacion.ItemIndex <> 0;
  tbTipoFiltro.Enabled                    := rgOperacion.ItemIndex =  0;
  edValorFiltro.Enabled                   := rgOperacion.ItemIndex =  0;
  edValorFiltro.ReadOnly                  := rgOperacion.ItemIndex <> 0;
  btnFiltro.Enabled                       := rgOperacion.ItemIndex =  0;
  edDESC_FILTRO.ReadOnly                  := rgOperacion.ItemIndex <> 0;
  btnAgregaCreditos.Enabled               := rgOperacion.ItemIndex =  0;
  btnReemplazaCreditos.Enabled            := rgOperacion.ItemIndex =  0;
  sbLimpiaGrid.Enabled                    := rgOperacion.ItemIndex =  0;
  sbSelectAll.Enabled                     := rgOperacion.ItemIndex =  0;
  sbUnselectAll.Enabled                   := rgOperacion.ItemIndex =  0;
  sbPaste.Enabled                         := rgOperacion.ItemIndex =  0;
  Desplegarlainformacindelcrdito1.Enabled := rgOperacion.ItemIndex =  0;
  Pegarcrditosdelportapapeles1.Enabled    := rgOperacion.ItemIndex =  0;
  btnVentaCartera.Enabled                 := rgOperacion.ItemIndex =  0;

  if not TVerificaCambio.Enabled and (TVerificaCambio.Tag = 0) then
  begin
    TVerificaCambio.Tag     := 1;
    TVerificaCambio.Enabled := True;
  end;
end;

procedure TWCrVtaCart.LimpiaVentaConsulta;
begin
  edImporteVenta.Text               := '0.00';
  edValorConsulta.Text              := '';
  Objeto.VALOR_CONSULTA.AsString    := '';
  Objeto.VALOR_CONSULTA.DrawControl;
  Objeto.F_VALOR_PAGO.AsDateTime    := Objeto.Apli.DameFechaEmpresa;
  Objeto.F_VALOR_PAGO.DrawControl;
  cbReportaBuro.Checked             := False;
  mComentarios.Lines.Clear;
  Objeto.VALOR_FILTRO.AsString      := '';
  Objeto.VALOR_FILTRO.DrawControl;
  sbLimpiaGridClick (sbLimpiaGrid);
  edDESC_FILTRO.Text                := '';
  labSituacion.Caption              := '';
end;

function TWCrVtaCart.HayDatos: boolean;
begin
  result := (CurrFromFrmFloat (edImporteVenta.Text) <> 0)  or
            (Objeto.VALOR_CONSULTA.AsString         <> '') or
            (edValorConsulta.Text                   <> '') or 
            cbReportaBuro.Checked                          or
            (mComentarios.Lines.Text                <> '') or
            (Objeto.VALOR_FILTRO.AsString           <> '') or
            (sagDatos.RowCount                      >  1)  or
            ((sagDatos.RowCount                     =  1) and (sagDatos.Cells [COL_CRED, 0] <> ''));
end;



procedure TWCrVtaCart.TVerificaCambioTimer(Sender: TObject);
begin
  TVerificaCambio.Enabled := False;
  try
    if HayDatos then
    begin
      if MessageDlg ('Ha elegido cambiar de operación, por lo que los datos en pantalla serán borrados. ¿Está seguro de continuar con el cambio de operación?',
                   mtConfirmation, mbYesNoCancel, 0) = mrYes then
        LimpiaVentaConsulta
      else
        rgOperacion.ItemIndex := Ord (not Boolean (rgOperacion.ItemIndex));
    end;
  finally
    TVerificaCambio.Tag := 0;
  end;
end;

procedure TWCrVtaCart.TInitStatusTimer(Sender: TObject);
begin
  TInitStatus.Enabled := False;
  rgOperacionClick(rgOperacion);
end;

end.


