// Sistema         : Clase de CRCOBACC
// Fecha de Inicio : 13/08/2003
// Función forma   : Clase de CRCOBACC
// Desarrollo por  : MACV. Class Maker.
// Comentarios     :
//
Unit IntCrCobAcc;

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
  IntCrAcredit,  // Acreditado
  IntCrCto,      // Contrato
  IntConTransa   // Consulta Depositos a la Vista
  ;

type

  PInfoDocto     = record
    F_VALOR_PAGO    : TDateTime;
    FACT_MORAS      : Double;
    IMP_MORA_COMIS  : Double;
    IMP_COMISION    : Double;
  end;
  //
  TCrCobAcc  = class;
  //
  TWCrCobAcc = class(TForm)
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
    pnColumnas: TPanel;
    edTitDocto: TEdit;
    edTitFVentto: TEdit;
    edTitSEL: TEdit;
    edTitTotal: TEdit;
    edTitComis: TEdit;
    edTitRem: TEdit;
    edTitFOper: TEdit;
    sagDATOS: TStringAlignGrid;
    pupFiltroBusqueda: TPopupMenu;
    pupAcreditado: TMenuItem;
    pupContrato: TMenuItem;
    gbNvaInfGral: TGroupBox;
    lbID_CONTRATO: TLabel;
    lbID_CTO_LIQ: TLabel;
    edID_CONTRATO: TEdit;
    edID_CTO_LIQ: TEdit;
    lbDESC_MONEDA: TLabel;
    edDESC_MONEDA: TEdit;
    lbSDO_CHEQUERA: TLabel;
    edSDO_CHEQUERA: TEdit;
    lbDESC_COMISION: TLabel;
    edDESC_COMISION: TEdit;
    bvSeparador: TBevel;
    rgParametros: TGroupBox;
    lbFacMora: TLabel;
    lbFValor: TLabel;
    lbMontoMora: TLabel;
    btFECHA: TSpeedButton;
    btFACT_MORAS: TSpeedButton;
    lbIVAMor: TLabel;
    lbCondMora: TLabel;
    edMONTO_MORAS: TInterEdit;
    edFECHA: TEdit;
    dtFECHA: TInterDateTimePicker;
    cbB_COND_MORAS: TCheckBox;
    cbB_IVA_MORA: TCheckBox;
    edFAC_MORAS: TInterEdit;
    btBUSCA: TBitBtn;
    edDESC_FILTRO: TEdit;
    btnFiltro: TBitBtn;
    edValorFiltro: TEdit;
    lbFiltro: TLabel;
    tbarTipoFiltro: TToolBar;
    tbTipoFiltro: TToolButton;
    pnlMsgs: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    pupTipoCobranza: TPopupMenu;
    pupCobAnticipada: TMenuItem;
    pupCobProgramada: TMenuItem;
    pupCobImpagada: TMenuItem;
    N5: TMenuItem;
    pupCobIndistinta: TMenuItem;
    pupGtiaPYME: TPopupMenu;
    AsignarGarantiaPYME1: TMenuItem;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure oeTipoFiltroClick(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure ikValorFiltroEjecuta(Sender: TObject);
    procedure btBUSCAClick(Sender: TObject);
    procedure sagDATOSSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure btFECHAClick(Sender: TObject);
    procedure btFACT_MORASClick(Sender: TObject);
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure btCHEQUERAClick(Sender: TObject);
    procedure btnCobraClick(Sender: TObject);
    procedure edMONTO_MORASKeyPress(Sender: TObject; var Key: Char);
    procedure cbB_IVA_MORAClick(Sender: TObject);
    procedure sagDATOSDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure sagDATOSMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cbB_COND_MORASClick(Sender: TObject);
    procedure cbSeleccionClick(Sender: TObject);
    procedure sbLogCobranzaClick(Sender: TObject);
    procedure edFAC_MORASKeyPress(Sender: TObject; var Key: Char);
    procedure edFAC_MORASExit(Sender: TObject);
    procedure edMONTO_MORASExit(Sender: TObject);
    procedure edFECHAExit(Sender: TObject);
    procedure edFECHAKeyPress(Sender: TObject; var Key: Char);
    procedure edFECHAEnter(Sender: TObject);
    procedure edFAC_MORASEnter(Sender: TObject);
    procedure edMONTO_MORASEnter(Sender: TObject);
    procedure cbB_IVA_MORAEnter(Sender: TObject);
    procedure cbB_COND_MORASEnter(Sender: TObject);
    procedure MErroresDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edIMPORTE_TEXTChange(Sender: TObject);
    procedure dtFECHAExit(Sender: TObject);
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
  private
    procedure    FmtCurrEdit( Sender: TEdit );
  private
  private
    procedure    AsignaColRow  ( peColor : TColor; peRow : Integer );
    function     ExisteRegActivo : Boolean;
    procedure    DrawControls;
    procedure    GetFromControls;
    //
    procedure    GetFromGrid( peRowGrid, peColGrid : Integer);
    procedure    UpdateToGrid;
    //
    Function     ValFechaOper( peBandera : Boolean ): Boolean;
    // procedimientos de calculo de datos
    procedure    ObtImportes;
    Procedure    SumaImportes;
    procedure    CalculaCobranza( BObtImp : Boolean );
    procedure    ProcesaCambio;
    //
    procedure    UserCambiaFactorMoras( peFactor : Double  );
    procedure    UserCambiaCondMoras  ( peBCondona : String );
  private
    vgInfoPer    : PInfoDocto;
  public
    Objeto       : TCrCobAcc;
  private
    property Searching : Boolean read fSearching write fSearching default true;
    property Searched  : Boolean read fBolSearch write fBolSearch default true;
    property DataFound : Boolean read fDataFound write fDataFound default true;
  end;

  TCrCobAcc = class(TInterFrame)
  protected
  private
  public
    // INTERCAMPOS PARA FILTRAR LA BUSQUEDA
    TIPO_FILTRO              : TInterCampo;
    VALOR_FILTRO             : TInterCampo;
    //
    INDICE_GRID              : TInterCampo;
    COLUMNA_GRID             : TInterCampo;
    TIPO_PARAM               : TInterCampo;
    B_APLICA_PAGO            : TInterCampo;
    //
    ID_ACREDITADO            : TInterCampo;
    ID_CONTRATO              : TInterCampo;
    FOL_CONTRATO             : TInterCampo;
    ID_ACCESORIO             : TInterCampo;
    FOL_ACCESORIO            : TInterCampo;
    CVE_ACCESORIO            : TInterCampo;
    DESC_COMISION            : TInterCampo;
    CVE_COMISION             : TInterCampo;
    NUM_PERIODO              : TInterCampo;
    F_VENCIMIENTO            : TInterCampo;
    F_PROG_PAGO              : TInterCampo;
    ID_CTO_LIQ               : TInterCampo;
    SDO_CHEQUERA             : TInterCampo;
    CVE_MONEDA               : TInterCampo;
    DESC_MONEDA              : TInterCampo;
    B_CUBRE_PAGO             : TInterCampo;
    // DE LA SECCION DE PARAMETROS
    F_VALOR_PAGO             : TInterCampo;
    FACT_MORAS               : TInterCampo;
    B_IVA_MORAS              : TInterCampo;
    B_COND_MORAS             : TInterCampo;
    // DE LA SECCION DE IMPORTES
    IMP_COMISION             : TInterCampo;
    IMP_IVA_COMIS            : TInterCampo;
    IMP_MORA_COMIS           : TInterCampo;
    IMP_TOTAL                : TInterCampo;
    //
    F_MORA_ORI               : TInterCampo;
    B_IVA_M_ORI              : TInterCampo;
    //
    // Clase de los parametros de la aplicacion
    ParamCre                 : TParamCre;
    // Clases utilizadas para el filtro de busqueda
    CatAcreditado            : TCrAcredit;
    CatContrato              : TCrCto;
    // Clases utilizadas como catalogos de la seccion "Informacion General"
    CrContrato               : TCrCto;
    ConTransa                : TConTransa;
  private
    procedure   MuestraError( vlError : String );
    function    BoolToStr( peValor : Boolean ) : String;
    function    StrToBool( peValor : String  ) : Boolean;
  public
    function    BuildSQLStr : String;
    procedure   StpObtAdeudo( peIdAccesorio   : Integer; peFolAccesorio : Integer;
                              peCveAccesorio  : String;  peCveComision  : String;
                              peNumPeriodo    : Integer; pFCalculo  : TDate;
                              pFactor         : Double;  pBIVA      : String;
                              var  vlTotal,     vlImporte,   vlIVA,
                                   vlMoras,     vlIVAMoras : Double;
                              var  vlError    : String );
    function    StpObtFacMora( peIdAccesorio  : Integer;  peFolAccesorio : Integer;
                               peCveAccesorio : String;   peCveComision  : String;
                               peNumPeriodo   : Integer;  peFactMoras    : Double;
                               peBIvaMora     : String;   peMonto        : Double;
                               peFPago        : TDate;    var psFacMoras : Double ) : Boolean;
    procedure   StpCobranza( var  vlError : String);
  public
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow( FormaTipo : TFormaTipo) : Integer; override;
  published
  end;




const
   // Posicion de los datos en el GRID ( Datos Visibles )
   COL_SEL  = 0;         // Aplica cobro
   COL_ACAU = 1;         // Número de acreditado / autorización
   COL_DCOM = 2;         // Descripción de la comisión
   COL_FVTO = 3;         // Fecha de vencimiento
   COL_FVAL = 4;         // Fecha de operación ( Valor )
   COL_ICOM = 5;         // Importe de Comisión
   COL_IIVA = 6;         // Importe de IVA
   COL_IMOR = 7;         // Importe de Moratorios
   COL_ITOT = 8;         // Importe Total
   COL_VIS  = COL_ITOT;  // Valor de la ultima columna visible en el Grid
   COL_IACR = 9;         // Número de acreditado / autorización
   COL_ICTO = 10;        // Número de contrato
   COL_IFOL = 11;        // Número de folio de contrato
   COL_CCOM = 12;        // Clave de comisión
   COL_PCOM = 13;        // Período de comisión
   COL_FPRG = 14;        // Fecha programada
   COL_CMON = 15;        // Clave de moneda
   COL_DMON = 16;        // Descripcion de moneda
   COL_CHQR = 17;        // Número de chequera
   COL_SCHQ = 18;        // Saldo de chequera
   COL_IACC = 19;        // Identificador de Accesorio
   COL_FACC = 20;        // Folio de Accesorio
   COL_CACC = 21;        // Clave de accesorio
   COL_FMOR = 22;        // Factor de Moratorios
   COL_IVMO = 23;        // Aplica IVA de moras de comision
   COL_CMCO = 24;        // Condona moratorios de comision
   COL_BCPG = 25;        // Cubre pago
   COL_TSMR = 26;        // Tasa moratoria
   COL_FMOO = 27;        // Factor de moras
   COL_IMOO = 28;        // Factor de moras
   //
   coFmtCurrency = '###,###,###,###,###,###,###,##0.00';
   //
   // Mensajes generales desplegados en la pantalla
   coNoFiltro    = 'Debe indicar un filtro de búsqueda';
   coFoD000      = 'La fecha no puede ser mayor al día actual.';
   coFoNoHabil   = 'La fecha de operación debe ser un día hábil.';
   coFoActAll    = '¿Deseas aplicar la fecha de operación %s a todos los períodos?.';
   coMorActAll   = '¿Deseas aplicar el factor %s para TODOS los pagos?';
   coObtFacMora  = '¿Deseas calcular el factor de moras a partir de la cantidad de %m?.';
   coRealizaCob  = '¿Desea aplicar la cobranza?';
   coErrorCob    = 'Ha ocurrido un error. ¿Desea continuar?';
   coNoData      = 'No existen datos';
   // Tipo de Parametro
   coNone        = 0;
   coFecha       = 1;
   coFactor      = 2;
   coMonto       = 3;
   coImpDep      = 4;
   coIVAMor      = 5;
   coCondMor     = 6;
   //
   coPaquete     = 'PKGCRCOBRANZA';
   //

implementation
Uses  IntMensaje; //, IntCrCreChe;
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
constructor TCrCobAcc.Create( AOwner : TComponent );
begin
  Inherited;
  // Crea los intercampos utilizados para la busqueda
  TIPO_FILTRO  := CreaCampo( 'TIPO_FILTRO',  ftString, tsNinguno, tsNinguno, False);
  VALOR_FILTRO := CreaCampo( 'VALOR_FILTRO', ftString, tsNinguno, tsNinguno, False );
  //
  // APUNTADOR AL NUMERO DE REGISTRO ACTIVO
  INDICE_GRID       := CreaCampo( 'INDICE_GRID',       ftInteger, tsNinguno, tsNinguno, False );
  COLUMNA_GRID      := CreaCampo( 'COLUMNA_GRID',      ftInteger, tsNinguno, tsNinguno, False );
  //
  TIPO_PARAM        := CreaCampo( 'TIPO_PARAM',        ftInteger, tsNinguno, tsNinguno, False );
  B_CUBRE_PAGO      := CreaCampo( 'B_CUBRE_PAGO',      ftString,  tsNinguno, tsNinguno, False );
  B_APLICA_PAGO     := CreaCampo( 'B_APLICA_PAGO',     ftString,  tsNinguno, tsNinguno, False );
  // DE LA SECCION INFORMACION GENERAL
  ID_ACREDITADO     := CreaCampo( 'ID_ACREDITADO',     ftFloat,   tsNinguno, tsNinguno, False );
  ID_CONTRATO       := CreaCampo( 'ID_CONTRATO',       ftFloat,   tsNinguno, tsNinguno, False );
  FOL_CONTRATO      := CreaCampo( 'ID_CONTRATO',       ftFloat,   tsNinguno, tsNinguno, False );
  ID_ACCESORIO      := CreaCampo( 'ID_ACCESORIO',      ftFloat,   tsNinguno, tsNinguno, False );
  FOL_ACCESORIO     := CreaCampo( 'FOL_ACCESORIO',     ftFloat,   tsNinguno, tsNinguno, False );
  CVE_ACCESORIO     := CreaCampo( 'CVE_ACCESORIO',     ftString,  tsNinguno, tsNinguno, False );
  DESC_COMISION     := CreaCampo( 'DESC_COMISION',     ftString,  tsNinguno, tsNinguno, False );
  CVE_COMISION      := CreaCampo( 'CVE_COMISION',      ftString,  tsNinguno, tsNinguno, False );
  NUM_PERIODO       := CreaCampo( 'NUM_PERIODO',       ftFloat,   tsNinguno, tsNinguno, False );
  F_VENCIMIENTO     := CreaCampo( 'F_VENCIMIENTO',     ftDate,    tsNinguno, tsNinguno, False );
  F_PROG_PAGO       := CreaCampo( 'F_PROG_PAGO',       ftDate,    tsNinguno, tsNinguno, False );
  ID_CTO_LIQ        := CreaCampo( 'ID_CTO_LIQ',        ftFloat,   tsNinguno, tsNinguno, False );
  SDO_CHEQUERA      := CreaCampo( 'SDO_CHEQUERA',      ftFloat,   tsNinguno, tsNinguno, False );
  CVE_MONEDA        := CreaCampo( 'CVE_MONEDA',        ftString,  tsNinguno, tsNinguno, False );
  DESC_MONEDA       := CreaCampo( 'DESC_MONEDA',       ftString,  tsNinguno, tsNinguno, False );
  // DE LA SECCION DE PARAMETROS
  F_VALOR_PAGO      := CreaCampo( 'F_VALOR_PAGO',      ftDate,    tsNinguno, tsNinguno, False );
  FACT_MORAS        := CreaCampo( 'FACT_MORAS',        ftFloat,   tsNinguno, tsNinguno, False );
  B_IVA_MORAS       := CreaCampo( 'B_IVA_MORAS',       ftString,  tsNinguno, tsNinguno, False );
  B_COND_MORAS      := CreaCampo( 'B_COND_MORAS',      ftString,  tsNinguno, tsNinguno, False );
  //
  IMP_COMISION      := CreaCampo( 'IMP_COMISION',      ftFloat,   tsNinguno, tsNinguno, False );
  IMP_IVA_COMIS     := CreaCampo( 'IMP_IVA_COMIS',     ftFloat,   tsNinguno, tsNinguno, False );
  IMP_MORA_COMIS    := CreaCampo( 'IMP_MORA_COMIS',    ftFloat,   tsNinguno, tsNinguno, False );
  IMP_TOTAL         := CreaCampo( 'IMP_TOTAL',         ftFloat,   tsNinguno, tsNinguno, False );
  //
  F_MORA_ORI        := CreaCampo( 'F_MORA_ORI',        ftFloat,   tsNinguno, tsNinguno, False );
  B_IVA_M_ORI       := CreaCampo( 'B_IVA_M_ORI',       ftFloat,   tsNinguno, tsNinguno, False );
  //
  {$WARNINGS OFF}
  {   Clases de busqueda }
  //
  CatAcreditado := TCrAcredit.Create(Self);      // Clase de acreditado
  CatAcreditado.MasterSource := Self;
  //
  CatContrato   := TCrCto.Create(Self);          // Clase de contrato
  CatContrato.MasterSource := Self;
  //
  {   Catalogos   }
  // Autorizacion
  CrContrato := TCrCto.Create(self);
  CrContrato.MasterSource := Self;
  // Chequera
  ConTransa := TConTransa.Create( Self );
  ConTransa.MasterSource := Self;
  {$WARNINGS ON}


  StpName    := ' ';
  UseQuery   := False;
  HelpFile   := 'IntCrCobAcc.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrCobAcc.Destroy;
begin
  // Catalogos de Busqueda
  if CatAcreditado <> nil then
     CatAcreditado.free;
  //end if;

  if CatContrato <> nil then
    CatContrato.Free;
  //end if;
  //
  // Catalogos de "Informacion General"
  if CrContrato <> nil then
     CrContrato.Free;
  //end if
  if ConTransa <> nil then
     ConTransa.free;
  //end if

  inherited;
end;


function TCrCobAcc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCobAcc;
begin
   W := TWCrCobAcc.Create(Self);
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
Function TCrCobAcc.InternalBusca:Boolean;
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
procedure TCrCobAcc.MuestraError(vlError: String);
begin
  EXECUTE_MUESTRAMENSAJE( vlError );
end;
// +---------------------------------------------------------------------------+
// +         Construye la cadena SQL para realizar la busqueda de registros    +
// +---------------------------------------------------------------------------+
Function TCrCobAcc.BuildSQLStr : String;
var vlsql        : String;
    vlBusca      : String;
Begin
  if TIPO_FILTRO.AsString = cobpAcred   then
    vlBusca := 'AND PERIODO.ID_ACREDITADO = '     + VALOR_FILTRO.AsString
  else if TIPO_FILTRO.AsString = cobpAutor   then
    vlBusca := 'AND PERIODO.ID_CONTRATO  = '      + VALOR_FILTRO.AsString
  else
    vlBusca := 'AND 1 = 0 ';
  //
  // Arma la sentencia SQL.
  vlsql :=  'SELECT P.ID_PERSONA,'                                                                                + coCRLF +
            '       P.NOMBRE,'                                                                                    + coCRLF +
            '       MON.DESC_MONEDA,'                                                                             + coCRLF +
            '       PKGCRCOMUN.CTABCO_TO_CHQRA('                                                                  + coCRLF +
            '         PKGCRPERIODO.STPObtChqCte( A.ID_ACREDITADO,'                                                + coCRLF +
            '                                    ''0'', NULL, ''AC'', ''AD'', ''CR'' ) )  AS CHEQUERA,'           + coCRLF +
            '       PKGCRCOMUN.STPOBTENSDOCHQRA( '                                                                + coCRLF +
            '         PKGCRCOMUN.CTABCO_TO_CHQRA('                                                                + coCRLF +
            '           PKGCRPERIODO.STPObtChqCte( A.ID_ACREDITADO,'                                              + coCRLF +
            '                                      ''0'', NULL, ''AC'', ''AD'', ''CR'' ) ) ) AS SDO_CHEQUERA,'    + coCRLF +
            '       PERIODO.*,'                                                                                   + coCRLF +
            '       CAT.DESC_COMISION'                                                                            + coCRLF +
            'FROM   CR_ACREDITADO A,'                                                                             + coCRLF +
            '       PERSONA P,'                                                                                   + coCRLF +
            '       MONEDA MON,'                                                                                  + coCRLF +
            '       CR_CAT_COMISION CAT,'                                                                         + coCRLF +
            '       ('                                                                                            + coCRLF +
            '        SELECT ID_ACREDITADO,'                                                                       + coCRLF +
            '               ID_CONTRATO,'                                                                         + coCRLF +
            '               FOL_CONTRATO,'                                                                        + coCRLF +
            '               ID_ACCESORIO,'                                                                        + coCRLF +
            '               FOL_ACCESORIO,'                                                                       + coCRLF +
            '               CVE_ACCESORIO,'                                                                       + coCRLF +
            '               CVE_COMISION,'                                                                        + coCRLF +
            '               NUM_PERIODO,'                                                                         + coCRLF +
            '               F_PROG_PAGO,'                                                                         + coCRLF +
            '               F_VENCIMIENTO,'                                                                       + coCRLF +
            '               IMP_COMISION,'                                                                        + coCRLF +
            '               IMP_IVA,'                                                                             + coCRLF +
            '               IMP_MORATORIO,'                                                                       + coCRLF +
            '               IMP_IVA_MORA,'                                                                        + coCRLF +
            '               IMP_MORATORIO + IMP_IVA_MORA IMP_MORA,'                                               + coCRLF +
            '               IMP_COMISION + IMP_IVA + IMP_MORATORIO + IMP_IVA_MORA IMP_TOTAL, '                    + coCRLF +
            '               1     FACT_MORAS,'                                                                    + coCRLF +
            '               ''F'' B_IVA_MORAS,'                                                                   + coCRLF +
            '               TASA_APLICADA, '                                                                      + coCRLF +
            '               CVE_MONEDA'                                                                           + coCRLF +
            '        FROM   ('                                                                                    + coCRLF +
            '                SELECT A.ID_ACREDITADO,'                                                             + coCRLF +
            '                       0 ID_CONTRATO,'                                                               + coCRLF +
            '                       0 FOL_CONTRATO,'                                                              + coCRLF +
            '                       CO.ID_ACCESORIO,'                                                             + coCRLF +
            '                       CO.FOL_ACCESORIO,'                                                            + coCRLF +
            '                       CO.CVE_ACCESORIO,'                                                            + coCRLF +
            '                       CO.CVE_COMISION,'                                                             + coCRLF +
            '                       CO.NUM_PERIODO,'                                                              + coCRLF +
            '                       CO.F_PROG_PAGO,'                                                              + coCRLF +
            '                       CO.F_VENCIMIENTO,'                                                            + coCRLF +
            '                       CO.IMP_COMISION  - CO.IMP_PAGADO     IMP_COMISION,'                           + coCRLF +
            '                       CO.IMP_IVA       - CO.IMP_IVA_PAGADO IMP_IVA,'                                + coCRLF +
            '                       CO.IMP_MORATORIO - CO.IMP_PAGADO_MORA  - CO.IMP_COND_MORA     IMP_MORATORIO,' + coCRLF +
            '                       CO.IMP_IVA_MORA  - CO.IMP_PAG_IVA_MORA - CO.IMP_IVA_COND_MOR  IMP_IVA_MORA,'  + coCRLF +
            '                       CO.TASA_APLICADA, '                                                           + coCRLF +
            '                       PROG.CVE_MONEDA'                                                              + coCRLF +
            '                FROM   CR_COMISION_ACC CO,'                                                          + coCRLF +
            '                       CR_ACREDITADO   A,'                                                           + coCRLF +
            '                       CR_COM_PROG_ACC PROG'                                                         + coCRLF +
            '                WHERE  CO.CVE_ACCESORIO  = ''AC'' '                                                  + coCRLF +
            '                  AND  CO.SIT_COMISION  IN (''AC'', ''PA'', ''IM'' )'                                + coCRLF +
            '                  AND  A.ID_ACREDITADO   = CO.ID_ACCESORIO'                                          + coCRLF +
            '                  AND  PROG.CVE_COMISION = CO.CVE_COMISION'                                          + coCRLF +
            '                UNION'                                                                               + coCRLF +
            '                SELECT A.ID_ACREDITADO,'                                                             + coCRLF +
            '                       L.ID_CONTRATO,'                                                               + coCRLF +
            '                       L.FOL_CONTRATO,'                                                              + coCRLF +
            '                       CO.ID_ACCESORIO,'                                                             + coCRLF +
            '                       CO.FOL_ACCESORIO,'                                                            + coCRLF +
            '                       CO.CVE_ACCESORIO,'                                                            + coCRLF +
            '                       CO.CVE_COMISION,'                                                             + coCRLF +
            '                       CO.NUM_PERIODO,'                                                              + coCRLF +
            '                       CO.F_PROG_PAGO,'                                                              + coCRLF +
            '                       CO.F_VENCIMIENTO,'                                                            + coCRLF +
            '                       CO.IMP_COMISION  - CO.IMP_PAGADO     IMP_COMISION,'                           + coCRLF +
            '                       CO.IMP_IVA       - CO.IMP_IVA_PAGADO IMP_IVA,'                                + coCRLF +
            '                       CO.IMP_MORATORIO - CO.IMP_PAGADO_MORA  - CO.IMP_COND_MORA     IMP_MORATORIO,' + coCRLF +
            '                       CO.IMP_IVA_MORA  - CO.IMP_PAG_IVA_MORA - CO.IMP_IVA_COND_MOR  IMP_IVA_MORA,'  + coCRLF +
            '                       CO.TASA_APLICADA, '                                                           + coCRLF +            
            '                       NVL( PROG.CVE_MONEDA, CTTO.CVE_MONEDA ) CVE_MONEDA'                           + coCRLF +
            '                FROM   CR_COMISION_ACC CO,'                                                          + coCRLF +
            '                       CR_COM_PROG_ACC PROG,'                                                        + coCRLF +
            '                       CR_CONTRATO     L,'                                                           + coCRLF +
            '                       CONTRATO        CTTO,'                                                        + coCRLF +
            '                       CR_PRODUCTO     P,'                                                           + coCRLF +
            '                       CR_ACREDITADO   A'                                                            + coCRLF +
            '                WHERE  CO.CVE_ACCESORIO   = ''LN'' '                                                 + coCRLF +
            '                  AND  CO.SIT_COMISION  IN (''AC'', ''PA'', ''IM'' )'                                + coCRLF +
            '                  AND  PROG.ID_ACCESORIO  = CO.ID_ACCESORIO'                                         + coCRLF +
            '                  AND  PROG.FOL_ACCESORIO = CO.FOL_ACCESORIO'                                        + coCRLF +
            '                  AND  PROG.CVE_ACCESORIO = CO.CVE_ACCESORIO'                                        + coCRLF +
            '                  AND  PROG.CVE_COMISION  = CO.CVE_COMISION  '                                       + coCRLF +
            '                  AND  L.ID_CONTRATO      = CO.ID_ACCESORIO'                                         + coCRLF +
            '                  AND  L.FOL_CONTRATO     = CO.FOL_ACCESORIO'                                        + coCRLF +
            '                  AND  CTTO.ID_CONTRATO   = L.ID_CONTRATO'                                           + coCRLF +
            '                  AND  P.CVE_PRODUCTO_CRE = L.CVE_PRODUCTO_CRE'                                      + coCRLF +
            '                  AND  A.ID_ACREDITADO    = CTTO.ID_TITULAR'                                         + coCRLF +
            '               ) CRE'                                                                                + coCRLF +
            '      ) PERIODO'                                                                                     + coCRLF +
            'WHERE A.ID_ACREDITADO  = PERIODO.ID_ACREDITADO'                                                      + coCRLF +
            '  AND P.ID_PERSONA     = A.ID_ACREDITADO'                                                            + coCRLF +
            '  AND MON.CVE_MONEDA   = PERIODO.CVE_MONEDA'                                                         + coCRLF +
            '  AND CAT.CVE_COMISION = PERIODO.CVE_COMISION'                                                       + coCRLF +
            vlBusca                                                                                               + coCRLF +
            'ORDER BY PERIODO.ID_ACREDITADO, PERIODO.ID_CONTRATO, '                                               + coCRLF +
            '         PERIODO.FOL_CONTRATO,  PERIODO.CVE_ACCESORIO, '                                             + coCRLF +
            '         PERIODO.CVE_COMISION,  PERIODO.F_PROG_PAGO, '                                               + coCRLF +
            '         PERIODO.F_VENCIMIENTO, PERIODO.NUM_PERIODO ';
  //
  Result := vlsql;
end;
// +---------------------------------------------------------------------------+
// +           Trae los datos del adeudo a la pantalla de la cobranza          +
// +---------------------------------------------------------------------------+
procedure TCrCobAcc.StpObtAdeudo( peIdAccesorio  : Integer; peFolAccesorio : Integer;
                                  peCveAccesorio : String;  peCveComision  : String;
                                  peNumPeriodo   : Integer; pFCalculo  : TDate;
                                  pFactor        : Double;  pBIVA      : String;
                                  var  vlTotal,    vlImporte,   vlIVA,
                                       vlMoras,    vlIVAMoras : Double;
                                  var  vlError   : String );
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
      Params.CreateParam( ftInteger, 'peIdEmpresa',    ptInput  );
      Params.CreateParam( ftInteger, 'peIdAccesorio',  ptInput  );
      Params.CreateParam( ftInteger, 'peFolAccesorio', ptInput  );
      Params.CreateParam( ftString,  'peCveAccesorio', ptInput  );
      Params.CreateParam( ftString,  'peCveComision',  ptInput  );
      Params.CreateParam( ftInteger, 'peNumPeriodo',   ptInput  );
      Params.CreateParam( ftDate,    'peFReferencia',  ptInput  );
      Params.CreateParam( ftDate,    'peFCalculo',     ptInput  );
      Params.CreateParam( ftFloat,   'peFactor',       ptInput  );
      Params.CreateParam( ftString,  'peBIVA',         ptInput  );
      Params.CreateParam( ftFloat,   'psImporte',      ptOutput );
      Params.CreateParam( ftFloat,   'psIVA',          ptOutput );
      Params.CreateParam( ftFloat,   'psMoras',        ptOutput );
      Params.CreateParam( ftFloat,   'psIVAMoras',     ptOutput );
      Params.CreateParam( ftFloat,   'psTotal',        ptOutput );
      Params.CreateParam( ftFloat,   'psTasa',         ptOutput );
      Params.CreateParam( ftFloat,   'psResultado',    ptOutput);
      Params.CreateParam( ftString,  'psTxResultado',  ptOutput);
      //
      ParamByName( 'peIdEmpresa'    ).AsInteger  := Apli.IdEmpresa;
      ParamByName( 'peIdAccesorio'  ).AsInteger  := peIdAccesorio;
      ParamByName( 'peFolAccesorio' ).AsInteger  := peFolAccesorio;
      ParamByName( 'peCveAccesorio' ).AsString   := peCveAccesorio;
      ParamByName( 'peCveComision'  ).AsString   := peCveComision;
      ParamByName( 'peNumPeriodo'   ).AsInteger  := peNumPeriodo;
      ParamByName( 'peNumPeriodo'   ).AsInteger  := peNumPeriodo;
      ParamByName( 'peFReferencia'  ).AsDateTime := Apli.DameFechaEmpresa;
      ParamByName( 'peFCalculo'     ).AsDate     := pFCalculo;
      ParamByName( 'peFactor'       ).AsFloat    := pFactor;
      ParamByName( 'peBIVA'         ).AsString   := pBIVA;
      ExecProc;
      if (ParamByName('PSResultado').AsInteger = 0) then
      begin
        vlImporte := ParamByName('psImporte').AsFloat;
        vlIVA     := ParamByName('psIVA').AsFloat;
        vlMoras   := ParamByName('psMoras').AsFloat;
        vlIVAMoras:= ParamByName('psIVAMoras').AsFloat;
        vlTotal   := ParamByName('psTotal').AsFloat;
      end
      else
      begin
        vlError := 'Problemas al obtener el adeudo: ' + coCRLF +
                   'Código : ' + ParamByName('psRESULTADO').AsString + coCRLF +
                   'Mensaje: ' + ParamByName('psTxResultado').AsString;
      end;
    end;
  finally
    STPObtAdeudo.Free;
  end;
end;
// +---------------------------------------------------------------------------+
// +             Este procedimiento hace el llamado a la cobranza              +
// +---------------------------------------------------------------------------+
procedure TCrCobAcc.StpCobranza(var  vlError : String);
var  STPCobranza  : TStoredProc;
Begin
   vlError := '';
   STPCobranza := TStoredProc.Create(Nil);
   try
      with STPCobranza do
      begin
        DatabaseName   := Apli.DatabaseName;
        SessionName    := Apli.SessionName;
        StoredProcName := coPaquete + '.' + 'STPCOBRACOMACC';
        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftFloat,  'peIdAccesorio',   ptInput);
        Params.CreateParam(ftFloat,  'peFolAccesorio',  ptInput);
        Params.CreateParam(ftString, 'peCveAccesorio',  ptInput);
        Params.CreateParam(ftString, 'peCveComision',   ptInput);
        Params.CreateParam(ftFloat,  'peNumPeriodo',    ptInput);
        Params.CreateParam(ftFloat,  'peImpPagoCon',    ptInput);
        Params.CreateParam(ftDate,   'peFReferencia',   ptInput);
        Params.CreateParam(ftDate,   'peFValorPago',    ptInput);
        Params.CreateParam(ftFloat,  'peFactMorasCn',   ptInput);
        Params.CreateParam(ftString, 'peBIVAMoraCn',    ptInput);
        Params.CreateParam(ftFloat,  'peBCondMoraCn',   ptInput);
        Params.CreateParam(ftFloat,  'peIdEmpresa',     ptInput);
        Params.CreateParam(ftString, 'peCveUsuario',    ptInput);
        Params.CreateParam(ftString, 'peCveMedio',      ptInput);
        Params.CreateParam(ftFloat,  'peGpoCobranza',   ptInput);
        Params.CreateParam(ftFloat,  'peIdCtoLiq',      ptInput);
        Params.CreateParam(ftString, 'peBCommit',       ptInput);
        Params.CreateParam(ftFloat,  'psResultado',     ptOutput);
        Params.CreateParam(ftString, 'psTxResultado',   ptOutput);
        //
        ParamByName('peIdAccesorio').AsFloat   := ID_ACCESORIO.AsFloat;
        ParamByName('peFolAccesorio').AsFloat  := FOL_ACCESORIO.AsFloat;
        ParamByName('peCveAccesorio').AsString := CVE_ACCESORIO.AsString;
        ParamByName('peCveComision').AsString  := CVE_COMISION.AsString;
        ParamByName('peNumPeriodo').AsFloat    := NUM_PERIODO.AsFloat;
        ParamByName('peImpPagoCon').AsFloat    := IMP_TOTAL.AsFloat;
        ParamByName('peFReferencia').AsDate    := F_VALOR_PAGO.AsDateTime;
        ParamByName('peFValorPago').AsDate     := Apli.DameFechaEmpresa;
        ParamByName('peFactMorasCn').AsFloat   := FACT_MORAS.AsFloat;
        ParamByName('peBIVAMoraCn').AsString   := B_IVA_MORAS.AsString;
        ParamByName('peBCondMoraCn').AsString  := B_COND_MORAS.AsString;
        ParamByName('peIdEmpresa').AsFloat     := Apli.IdEmpresa;
        ParamByName('peCveUsuario').AsString   := Apli.Usuario;
        ParamByName('peCveMedio').AsString     := 'ICRE';
        ParamByName('peGpoCobranza').AsFloat   := 0;
        ParamByName('peIdCtoLiq').Clear;
        ParamByName('peBCommit').AsString      := 'V';
        //
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
// +                  Convierte un booleano a una cadena                       +
// +---------------------------------------------------------------------------+
function TCrCobAcc.BoolToStr( peValor : Boolean ) : String;
begin
  if peValor then result := 'V' else result := 'F';
end;
// +---------------------------------------------------------------------------+
// +                  Convierte una cadena a un booleano                       +
// +---------------------------------------------------------------------------+
function TCrCobAcc.StrToBool(peValor: String): Boolean;
begin
  result := ( peValor = 'V' );
end;
// +---------------------------------------------------------------------------+
// +           Obtiene el factor de moratorios a partir de un monto            +
// +---------------------------------------------------------------------------+
function TCrCobAcc.StpObtFacMora( peIdAccesorio  : Integer;  peFolAccesorio : Integer;
                                  peCveAccesorio : String;   peCveComision  : String;
                                  peNumPeriodo   : Integer;  peFactMoras    : Double;
                                  peBIvaMora     : String;   peMonto        : Double;
                                  peFPago        : TDate;    var psFacMoras : Double ) : Boolean;
var  STPObtFacMora : TStoredProc;
     vlTotal       : Double;
     vlImporte     : Double;
     vlIVA         : Double;
     vlMoras       : Double;
     vlIVAMoras    : Double;
     vlError       : String;
Begin
  //
  Result     := False;
  StpObtAdeudo( peIdAccesorio, peFolAccesorio,  peCveAccesorio, peCveComision,
                peNumPeriodo,  peFPago,         peFactMoras,    peBIvaMora,
                vlTotal,       vlImporte,       vlIVA,          vlMoras,
                vlIVAMoras,    vlError );
  if vlError = '' then
  begin
    psFacMoras := peMonto * peFactMoras / vlMoras;
    Result     := True;
  end else
    MuestraError( vlError );
  //
end;
//
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
procedure TWCrCobAcc.AddError(pMsgError : String);
Begin
  AddLine(MErrores, ' *** ' + pMsgError );
end;
// +---------------------------------------------------------------------------+
// +     Muestra los hints de campos que tienen una longitud más extensa.      +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.MuestraHints;
Begin
   edDESC_FILTRO.Hint     := Objeto.VALOR_FILTRO.AsString;
   edDESC_FILTRO.ShowHint := True;
   //
   edDESC_COMISION.Hint     := Objeto.DESC_COMISION.AsString;
   edDESC_COMISION.ShowHint := True;
end;
// +---------------------------------------------------------------------------+
// +      Despliega los valores del registro en los edits de la pantalla       +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.DrawControls;
begin
  Objeto.ID_CONTRATO.DrawControl;
  Objeto.FOL_CONTRATO.DrawControl;
  Objeto.CVE_MONEDA.DrawControl;
  Objeto.DESC_MONEDA.DrawControl;
  Objeto.ID_CTO_LIQ.DrawControl;
  Objeto.SDO_CHEQUERA.DrawControl;
  Objeto.CVE_COMISION.DrawControl;
  Objeto.DESC_COMISION.DrawControl;
  Objeto.NUM_PERIODO.DrawControl;
  Objeto.ID_ACCESORIO.DrawControl;
  Objeto.FOL_ACCESORIO.DrawControl;
  Objeto.CVE_ACCESORIO.DrawControl;
  Objeto.F_VALOR_PAGO.DrawControl;
  Objeto.FACT_MORAS.DrawControl;
  Objeto.B_IVA_MORAS.DrawControl;
  Objeto.B_COND_MORAS.DrawControl;
  //
  MuestraHints;
end;
// +---------------------------------------------------------------------------+
// +                     LIMPIA EL REGISTRO CON LA INFORMACION                 +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.LimpiaRecord;
begin
  FillChar( vgInfoPer, sizeof(vgInfoPer), #0 );
  Objeto.INDICE_GRID.AsInteger   := 0;
  Objeto.COLUMNA_GRID.AsInteger  := 0;
  Objeto.TIPO_PARAM.AsInteger    := coNone;
  Objeto.B_APLICA_PAGO.AsString  := '';
  // DE LA SECCION INFORMACION GENERAL
  Objeto.ID_CONTRATO.AsString    := '';
  Objeto.FOL_CONTRATO.AsString   := '';
  Objeto.CVE_MONEDA.AsString     := '';
  Objeto.DESC_MONEDA.AsString    := '';
  Objeto.ID_CTO_LIQ.AsString     := '';
  Objeto.SDO_CHEQUERA.AsString   := '';
  Objeto.ID_ACREDITADO.AsString  := '';
  //
  Objeto.ID_ACCESORIO.AsFloat       := 0;
  Objeto.FOL_ACCESORIO.AsFloat      := 0;
  Objeto.CVE_ACCESORIO.AsString     := '';
  Objeto.CVE_COMISION.AsString      := '';
  Objeto.DESC_COMISION.AsString     := '';
  Objeto.NUM_PERIODO.AsFloat        := 0;
  Objeto.F_VENCIMIENTO.AsString     := '';
  Objeto.F_PROG_PAGO.AsString       := '';
  // DE LA SECCION DE PARAMETROS
  Objeto.F_VALOR_PAGO.AsString      := '';
  Objeto.FACT_MORAS.AsString        := '';
  Objeto.B_IVA_MORAS.AsString       := '';
  Objeto.B_COND_MORAS.AsString      := '';
  // DE LA SECCION DE IMPORTES
  Objeto.IMP_COMISION.AsFloat       := 0;
  Objeto.IMP_IVA_COMIS.AsFloat      := 0;
  Objeto.IMP_MORA_COMIS.AsFloat     := 0;
  Objeto.IMP_TOTAL.AsFloat          := 0;
  //
  Objeto.F_MORA_ORI.AsFloat         := 0;
  Objeto.B_IVA_M_ORI.AsString       := '';
end;
// +---------------------------------------------------------------------------+
// +                          Limpia la pantalla                               +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.LimpiaPantalla;
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
  sagDATOS.RowCount := 1;
  //
  LimpiaRecord;      // Limpia el registro de datos
  DrawControls;      // Limpia los edits de la pantalla
  Application.ProcessMessages;
end;
// +---------------------------------------------------------------------------+
// +                   ASIGNA EL VALOR DE LA FECHA VALOR DE PAGO               +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.AsignaFVAlorPago( peFecha : TDateTime);
begin
  dtFECHA.DateTime := peFecha;
  vgInfoPer.F_VALOR_PAGO := peFecha;
  Objeto.F_VALOR_PAGO.AsDateTime := peFecha;
end;
// +---------------------------------------------------------------------------+
// +                 ASIGNA EL COLOR A UN RENGLON DEL GRID                     +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.AsignaColRow( peColor : TColor; peRow : Integer );
var vlCol : Integer;
begin
  for vlCol := 0 to sagDATOS.ColCount - 1 do
    sagDATOS.ColorCell[ vlCol, peRow ] := peColor;
end;
// +---------------------------------------------------------------------------+
// +            Ejecuta el query y muestra los datos en pantalla               +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.MuestraDatos;
var Qry         : TQuery;
    nRowCount   : Integer;
    vlFHoy      : TDate;
    vlRemanente : Double;
    vlEsDescto  : Boolean;
    vlBCobraPer : Boolean;
    vlError     : String;
    vlAcredAut  : String;
begin
  if Searching then exit; // Valida que no exista una busqueda en curso ...
  Searching  := True;
  DataFound  := False;
  try
    LimpiaPantalla;
    InterForma1.ShowMsgPanel('');
    Objeto.VALOR_FILTRO.GetFromControl;
    if ( Objeto.VALOR_FILTRO.AsString = '' ) then
    begin
      InterForma1.ShowMsgPanel(coNoFiltro);
      Searching := False;
      exit;
    end;//ends_if
    // ---------  Construye la cadena SQL de busqueda y obtiene un Query ---------
    Qry    := GetSQLQueryNoNil( Objeto.BuildSQLStr, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
    vlFHoy := Objeto.Apli.DameFechaEmpresa;
    nRowCount  := 0;
    // ------------------------- Barre el QUERY de datos -------------------------
    if Assigned(Qry) then
    begin
      //try Qry.SQL.SaveToFile('c:\sql_cob_acc_' + FormatDateTime( 'dd_mm_yyyy hh_ss_nn_zzz', Now ) + '.sql' ); except end;
      if not( Qry.IsEmpty ) then
      begin
        DataFound := True;
        while not Qry.Eof Do
        begin
          with sagDATOS do
          begin
            // Asigna los formatos de las celdas
            AlignCell[COL_ICOM, nRowCount] := alRight;
            AlignCell[COL_IIVA, nRowCount] := alRight;
            AlignCell[COL_IMOR, nRowCount] := alRight;
            AlignCell[COL_ITOT, nRowCount] := alRight;
            //
            vlBCobraPer := ( Qry.FieldByName('SDO_CHEQUERA').AsFloat >= Qry.FieldByName('IMP_TOTAL').AsFloat );
            vlAcredAut  := '';
            if   Qry.FieldByName('CVE_ACCESORIO').AsString  = 'AC' then vlAcredAut := Qry.FieldByName('ID_ACREDITADO').AsString
            else vlAcredAut := Qry.FieldByName('ID_CONTRATO').AsString;
            //
            if vlBCobraPer then AsignaColRow( cRowColor, nRowCount );
            //
            Cells[ COL_SEL,  nRowCount ] := Objeto.BoolToStr( vlBCobraPer );
            Cells[ COL_ACAU, nRowCount ] := vlAcredAut;
            Cells[ COL_DCOM, nRowCount ] := Qry.FieldByName('DESC_COMISION').AsString;
            Cells[ COL_FVTO, nRowCount ] := Qry.FieldByName('F_VENCIMIENTO').AsString;
            Cells[ COL_FVAL, nRowCount ] := DateToStr( vlFHoy );
            Cells[ COL_ICOM, nRowCount ] := Format( CFORMAT_DINERO,[ Qry.FieldByName('IMP_COMISION').AsFloat ] );
            Cells[ COL_IIVA, nRowCount ] := Format( CFORMAT_DINERO,[ Qry.FieldByName('IMP_IVA').AsFloat ] );
            Cells[ COL_IMOR, nRowCount ] := Format( CFORMAT_DINERO,[ Qry.FieldByName('IMP_MORA').AsFloat ] );
            Cells[ COL_ITOT, nRowCount ] := Format( CFORMAT_DINERO,[ Qry.FieldByName('IMP_TOTAL').AsFloat ] );
            Cells[ COL_IACR, nRowCount ] := Qry.FieldByName('ID_ACREDITADO').AsString;
            Cells[ COL_ICTO, nRowCount ] := Qry.FieldByName('ID_CONTRATO').AsString;
            Cells[ COL_IFOL, nRowCount ] := Qry.FieldByName('FOL_CONTRATO').AsString;
            Cells[ COL_CCOM, nRowCount ] := Qry.FieldByName('CVE_COMISION').AsString;
            Cells[ COL_PCOM, nRowCount ] := Qry.FieldByName('NUM_PERIODO').AsString;
            Cells[ COL_FPRG, nRowCount ] := Qry.FieldByName('F_PROG_PAGO').AsString;
            Cells[ COL_CMON, nRowCount ] := Qry.FieldByName('CVE_MONEDA').AsString;
            Cells[ COL_DMON, nRowCount ] := Qry.FieldByName('DESC_MONEDA').AsString;
            Cells[ COL_CHQR, nRowCount ] := Qry.FieldByName('CHEQUERA').AsString;
            Cells[ COL_SCHQ, nRowCount ] := Qry.FieldByName('SDO_CHEQUERA').AsString;
            Cells[ COL_IACC, nRowCount ] := Qry.FieldByName('ID_ACCESORIO').AsString;
            Cells[ COL_FACC, nRowCount ] := Qry.FieldByName('FOL_ACCESORIO').AsString;
            Cells[ COL_CACC, nRowCount ] := Qry.FieldByName('CVE_ACCESORIO').AsString;
            Cells[ COL_FMOR, nRowCount ] := Qry.FieldByName('FACT_MORAS').AsString;
            Cells[ COL_IVMO, nRowCount ] := Qry.FieldByName('B_IVA_MORAS').AsString;
            Cells[ COL_CMCO, nRowCount ] := 'F';
            Cells[ COL_BCPG, nRowCount ] := BoolToStr( vlBCobraPer );
            Cells[ COL_TSMR, nRowCount ] := Qry.FieldByName('TASA_APLICADA').AsString;
            Cells[ COL_FMOO, nRowCount ] := Qry.FieldByName('FACT_MORAS').AsString;
            Cells[ COL_IMOO, nRowCount ] := Qry.FieldByName('B_IVA_MORAS').AsString;
          end; //end with
          inc(nRowCount);
          Qry.Next;
          if not Qry.Eof then  //Incrementa un reglon
             sagDATOS.RowCount := sagDATOS.RowCount + 1;
          //
          Application.ProcessMessages;
        end; //end While
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
// +                   ASIGNA EL FACTOR DE MORATORIOS                          +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.AsignaFactorMoras( peFactor : Double );
begin
  vgInfoPer.FACT_MORAS := peFactor;
  Objeto.FACT_MORAS.AsFloat := peFactor;
end;
// +---------------------------------------------------------------------------+
// +                   ASIGNA EL MONTO DE MORATORIOS                           +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.AsignaMontoMoras( peMonto : Double );
begin
  vgInfoPer.IMP_MORA_COMIS      := peMonto;
  Objeto.IMP_MORA_COMIS.AsFloat := peMonto;

end;
// +---------------------------------------------------------------------------+
// +        Actualiza los datos del GRID a la estructura de datos actual       +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.GetFromGrid( peRowGrid, peColGrid : Integer);
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
  Objeto.INDICE_GRID.AsInteger      := peRowGrid;
  Objeto.COLUMNA_GRID.AsInteger     := peColGrid;
  //
  Objeto.B_APLICA_PAGO.AsString     := sagDATOS.Cells[ COL_SEL,  peRowGrid ];
  // DE LA SECCION DE INFORMACION GENERAL
  Objeto.ID_ACREDITADO.AsString     := sagDATOS.Cells[ COL_IACR, peRowGrid ];
  Objeto.ID_CONTRATO.AsString       := sagDATOS.Cells[ COL_ICTO, peRowGrid ];
  Objeto.FOL_CONTRATO.AsString      := sagDATOS.Cells[ COL_IFOL, peRowGrid ];
  Objeto.CVE_MONEDA.AsString        := sagDATOS.Cells[ COL_CMON, peRowGrid ];
  Objeto.DESC_MONEDA.AsString       := sagDATOS.Cells[ COL_DMON, peRowGrid ];
  Objeto.F_VENCIMIENTO.AsString     := sagDATOS.Cells[ COL_FVTO, peRowGrid ];
  Objeto.F_PROG_PAGO.AsString       := sagDATOS.Cells[ COL_FPRG, peRowGrid ];
  Objeto.ID_CTO_LIQ.AsString        := sagDATOS.Cells[ COL_CHQR, peRowGrid ];
  Objeto.SDO_CHEQUERA.AsString      := sagDATOS.Cells[ COL_SCHQ, peRowGrid ];
  Objeto.CVE_COMISION.AsString      := sagDATOS.Cells[ COL_CCOM, peRowGrid ];
  Objeto.DESC_COMISION.AsString     := sagDATOS.Cells[ COL_DCOM, peRowGrid ];
  Objeto.NUM_PERIODO.AsString       := sagDATOS.Cells[ COL_PCOM, peRowGrid ];
  //
  Objeto.ID_ACCESORIO.AsString      := sagDATOS.Cells[ COL_IACC, peRowGrid ];
  Objeto.FOL_ACCESORIO.AsString     := sagDATOS.Cells[ COL_FACC, peRowGrid ];
  Objeto.CVE_ACCESORIO.AsString     := sagDATOS.Cells[ COL_CACC, peRowGrid ];
  //
  // DE LA SECCION DE PARAMETROS
  AsignaFVAlorPago ( StringToDate    ( sagDATOS.Cells[ COL_FVAL,  peRowGrid ] ) );  // Asigna la fecha valor de pago
  AsignaFactorMoras( FactFromFrmFloat( sagDATOS.Cells[ COL_FMOR,  peRowGrid ] ) );  // Asigna el factor de moratorios
  Objeto.B_IVA_MORAS.AsString       := sagDATOS.Cells[ COL_IVMO,  peRowGrid ];      // Asigna la bandera de IVA de moratorios
  Objeto.B_COND_MORAS.AsString      := sagDATOS.Cells[ COL_CMCO,  peRowGrid ];      // Asigna la bandera de Cond. de moratorios
  //
  Objeto.IMP_COMISION.AsFloat       := CurrFromFrmFloat( sagDATOS.Cells[ COL_ICOM,  peRowGrid ] );
  Objeto.IMP_IVA_COMIS.AsFloat      := CurrFromFrmFloat( sagDATOS.Cells[ COL_IIVA,  peRowGrid ] );
  AsignaMontoMoras ( CurrFromFrmFloat( sagDATOS.Cells[ COL_IMOR,  peRowGrid ] ) );  // Asigna el monto de moratorios
  Objeto.IMP_TOTAL.AsFloat          := CurrFromFrmFloat( sagDATOS.Cells[ COL_ITOT,  peRowGrid ] );
  //
  Objeto.B_CUBRE_PAGO.AsString      := sagDATOS.Cells[ COL_BCPG,  peRowGrid ];      // Asigna la bandera de Cond. de moratorios
  //
  Objeto.F_MORA_ORI.AsString        := sagDATOS.Cells[ COL_FMOO,  peRowGrid ];      // Asigna la bandera de Cond. de moratorios
  Objeto.B_IVA_M_ORI.AsString       := sagDATOS.Cells[ COL_IMOO,  peRowGrid ];      // Asigna la bandera de Cond. de moratorios
end;
// +---------------------------------------------------------------------------+
// +                       Regresa  los valores al GRID                        +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.UpdateToGrid;
var peRowGrid : Integer;
begin
  peRowGrid := Objeto.INDICE_GRID.AsInteger;
  //
  sagDATOS.Cells[ COL_SEL,  peRowGrid ] := Objeto.B_APLICA_PAGO.AsString;
  // DE LA SECCION DE PARAMETROS
  sagDATOS.Cells[ COL_FVAL, peRowGrid ] := Objeto.F_VALOR_PAGO.AsString;
  sagDATOS.Cells[ COL_FMOR, peRowGrid ] := Objeto.FACT_MORAS.AsString;
  sagDATOS.Cells[ COL_IVMO, peRowGrid ] := Objeto.B_IVA_MORAS.AsString;
  sagDATOS.Cells[ COL_CMCO, peRowGrid ] := Objeto.B_COND_MORAS.AsString;
  //
  sagDATOS.Cells[ COL_ICOM,  peRowGrid ] := Format( cFormat_Dinero,[ Objeto.IMP_COMISION.AsFloat ] );
  sagDATOS.Cells[ COL_IIVA,  peRowGrid ] := Format( cFormat_Dinero,[ Objeto.IMP_IVA_COMIS.AsFloat ] );
  sagDATOS.Cells[ COL_IMOR,  peRowGrid ] := Format( cFormat_Dinero,[ Objeto.IMP_MORA_COMIS.AsFloat ] );
  sagDATOS.Cells[ COL_ITOT,  peRowGrid ] := Format( cFormat_Dinero,[ Objeto.IMP_TOTAL.AsFloat ] );
  //
  sagDATOS.Cells[ COL_BCPG,  peRowGrid ] := Objeto.B_CUBRE_PAGO.AsString;
end;

// +---------------------------------------------------------------------------+
// +                       Limpia los filtros de busqueda                      +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.LimpiaFiltro;
begin
  Objeto.CatAcreditado.Active := False;
  Objeto.CatContrato.Active   := False;
  Searched                    := False;
end;
// +---------------------------------------------------------------------------+
// +                    Asigna el tipo de filtro                               +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.SetTipoFiltro;
begin
  lbFiltro.Caption := '';
  LimpiaFiltro;                           // Desactiva las clases internas de busqueda
  // Libera los controles
  if Objeto.CatAcreditado.ID_ACREDITADO.Control <> nil then
     Objeto.CatAcreditado.ID_ACREDITADO.Control := nil;
  //ends if
  if Objeto.CatContrato.ID_CONTRATO.Control <> nil then
     Objeto.CatContrato.ID_CONTRATO.Control := nil;
  //ends if
  //
  // Liga los controles
  if Objeto.TIPO_FILTRO.AsString = cobpAcred then                               // Filtro por acreditado
  begin
    lbFiltro.Caption := coDescAcred;
    Objeto.CatAcreditado.ID_ACREDITADO.Control  := edValorFiltro;
    Objeto.CatAcreditado.Persona.Nombre.Control := edDESC_FILTRO;
  end else if Objeto.TIPO_FILTRO.AsString = cobpAutor then                      // Filtro por Autorizacion
  begin
    lbFiltro.Caption := coDescAutor;
    Objeto.CatContrato.ID_CONTRATO.Control  := edValorFiltro;
    Objeto.CatContrato.Contrato.TITNombre.Control := edDESC_FILTRO;
  end;
  //
  if edValorFiltro.CanFocus then
     edValorFiltro.SetFocus;
  //
end;
// +---------------------------------------------------------------------------+
// +                       Limpia los filtros de busqueda                      +
// +---------------------------------------------------------------------------+
function TWCrCobAcc.BeginSearch(BBusca: Boolean; const Llave: array of TVarRec): Boolean;
begin
  Searched := False;
  //
  if Objeto.TIPO_FILTRO.AsString = cobpAcred then                               // Busqueda sobre acreditado
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
  end;
  // Obtiene el valor del control
  Objeto.VALOR_FILTRO.GetFromControl;
  //
  Result := Searched;
end;
// +---------------------------------------------------------------------------+
// +         Valida si existe un registro activo en la pantalla                +
// +---------------------------------------------------------------------------+
function TWCrCobAcc.ExisteRegActivo : Boolean;
begin
  result := ( DataFound ) and
            ( ( ( Objeto.CVE_ACCESORIO.AsString = 'AC' ) and ( Objeto.ID_ACREDITADO.AsInteger > 0 ) ) or
              ( ( Objeto.CVE_ACCESORIO.AsString = 'LN' ) and ( Objeto.ID_CONTRATO.AsInteger   > 0 ) ) );
  //
end;
// +---------------------------------------------------------------------------+
// +              Evento que procesa el cambio en la fecha valor de pago       +
// +---------------------------------------------------------------------------+
Function TWCrCobAcc.ValFechaOper( peBandera : Boolean ): Boolean;
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
// +                     Obtiene los valores de la pantalla                    +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.GetFromControls;
begin
  // DE LA SECCION DE PARAMETROS
  Objeto.F_VALOR_PAGO.GetFromControl;
  Objeto.FACT_MORAS.GetFromControl;
  Objeto.IMP_MORA_COMIS.GetFromControl;
  Objeto.B_IVA_MORAS.GetFromControl;
  Objeto.B_COND_MORAS.GetFromControl;
end;
// +---------------------------------------------------------------------------+
// +    Obtiene los importes de capital, interes, conceptos y el monto moras   +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.ObtImportes;
var  vlError            : String;
     vlImpComis         : Double;
     vlImporte          : Double;
     vlIVA              : Double;
     vlMoras            : Double;
     vlIVAMoras         : Double;
begin
  //
  Objeto.StpObtAdeudo( Objeto.ID_ACCESORIO.AsInteger, Objeto.FOL_ACCESORIO.AsInteger,
                       Objeto.CVE_ACCESORIO.AsString, Objeto.CVE_COMISION.AsString,
                       Objeto.NUM_PERIODO.AsInteger,  Objeto.F_VALOR_PAGO.AsDateTime,
                       Objeto.FACT_MORAS.AsFloat,     Objeto.B_IVA_MORAS.AsString,
                       vlImpComis,  vlImporte,        vlIVA,     vlMoras,
                       vlIVAMoras,  vlError );
  if vlError <> '' then Objeto.MuestraError( vlError );
  //
  AsignaMontoMoras( vlMoras + vlIVAMoras );
  Objeto.IMP_COMISION.AsFloat   := vlImporte;
  Objeto.IMP_IVA_COMIS.AsFloat  := vlIVA;
  Objeto.IMP_TOTAL.AsFloat      := Objeto.IMP_COMISION.AsFloat  +
                                   Objeto.IMP_IVA_COMIS.AsFloat +
                                   Objeto.IMP_MORA_COMIS.AsFloat;
End;
// +---------------------------------------------------------------------------+
// +                      Suma los importes de este pago                       +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.SumaImportes;
begin
  with Objeto do
  begin
    //
    IMP_TOTAL.AsFloat := IMP_COMISION.AsFloat  + IMP_IVA_COMIS.AsFloat + IMP_MORA_COMIS.AsFloat;
    //
    if ( IMP_TOTAL.AsFloat <= SDO_CHEQUERA.AsFloat  ) and ( IMP_TOTAL.AsFloat > 0  )  then
    begin
      Objeto.B_CUBRE_PAGO.AsString := 'V';
      AsignaColRow( cRowColor, Objeto.INDICE_GRID.AsInteger );
    end else
    begin
      Objeto.B_CUBRE_PAGO.AsString := 'F';
      AsignaColRow( clWindow, Objeto.INDICE_GRID.AsInteger );
    end;
    //
  end;
end;
// +---------------------------------------------------------------------------+
// +    Realiza los calculos derivados de el cambio de valor de un parametro   +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.CalculaCobranza( BObtImp : Boolean );
var vlImpRem : Double;
    vlError  : String;
begin
  // OBTIENE LOS IMPORTES DE COMISION, INTERES Y CAPITAL DE MANERA GLOBAL
  if BObtImp then ObtImportes;
  //ends_if
  // CALCULA EL TOTAL DEL PAGO
  SumaImportes;
end;
// +---------------------------------------------------------------------------+
// +    Realiza las modificaciones derivadas de un cambio en algun parametro   +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.ProcesaCambio;
begin
  GetFromControls;        // Salva la información de la pantalla al registro actual
  CalculaCobranza(true);  // Hace el calculo de los importes
  UpdateToGrid;     // Regresa los valores al GRID.
  GetFromGrid( Objeto.INDICE_GRID.AsInteger, Objeto.COLUMNA_GRID.AsInteger );
  DrawControls;     // Regresa los valores a la pantalla
end;
// +---------------------------------------------------------------------------+
// +      Realiza los cambios del factor de moras indicado por el usuario      +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.UserCambiaFactorMoras(peFactor: Double);
begin
  Objeto.FACT_MORAS.AsFloat := peFactor;
end;
// +---------------------------------------------------------------------------+
// + Realiza los cambios del Condonación de moratorios indicado por el usuario +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.UserCambiaCondMoras( peBCondona : String);
begin
  Objeto.B_COND_MORAS.AsString := peBCondona;
end;
// +---------------------------------------------------------------------------+
// +                                                                           +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.FmtCurrEdit(Sender: TEdit);
begin
  if Assigned(Sender) then
    if not ( FormatFloat(coFmtCurrency, CurrFromFrmFloat(Sender.Text) ) = Sender.Text  ) then
    begin
      Sender.Text := FormatFloat(coFmtCurrency, CurrFromFrmFloat(Sender.Text));
    end;
end;
//
//
// +---------------------------------------------------------------------------+
// +                                                                           +
// +                                                                           +
// +                          EVENTOS DE LA FORMA                              +
// +                                                                           +
// +                                                                           +
// +---------------------------------------------------------------------------+
//
// +---------------------------------------------------------------------------+
// +                       Evento OnCreate de la forma                         +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.FormCreate(Sender: TObject);
begin
  {}
end;

// +---------------------------------------------------------------------------+
// +                       Evento OnShow de la forma                           +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.FormShow(Sender: TObject);
begin
  Searching := True;
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
  //
  Objeto.CrContrato.ParamCre       := Objeto.ParamCre;
  //
  //CONTROLES DE FILTROS
  Objeto.VALOR_FILTRO.Control     := edValorFiltro;
  //INFORMACION GENERAL DE LA DISPOSICION
  Objeto.ID_CONTRATO.Control       := edID_CONTRATO;
  Objeto.DESC_MONEDA.Control       := edDESC_MONEDA;
  Objeto.ID_CTO_LIQ.Control        := edID_CTO_LIQ;
  Objeto.SDO_CHEQUERA.Control      := edSDO_CHEQUERA;
  Objeto.DESC_COMISION.Control     := edDESC_COMISION;
  //INFORMACION DE LA SECCION DE PARAMETROS
  Objeto.F_VALOR_PAGO.Control      := edFECHA;
  Objeto.FACT_MORAS.Control        := edFAC_MORAS;
  Objeto.IMP_MORA_COMIS.Control    := edMONTO_MORAS;
  Objeto.B_IVA_MORAS.Control       := cbB_IVA_MORA;
  Objeto.B_COND_MORAS.Control      := cbB_COND_MORAS;
  //
  Objeto.CatContrato.BuscaWhereString := 'PKGCRACTUALIZA.STPOBTEMPCTTO(CR_CONTRATO.ID_CONTRATO)= ' +
                                         IntToStr(Objeto.Apli.IdEmpresa);
  Objeto.CatContrato.FilterString     := Objeto.CatContrato.BuscaWhereString;
  // Inicializa valores por default
  pupContrato.OnClick(pupContrato);
  // Muestra la información inicial en la pantalla
  Searching := False;
  //
  InterForma1.MsgPanel := pnlMsgs;
  LimpiaPantalla;
end;
// +---------------------------------------------------------------------------+
// +                   Evento OnClose de la forma                              +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
// +---------------------------------------------------------------------------+
// +                   Evento OnDestroy de la forma                            +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.FormDestroy(Sender: TObject);
var pResult  : Integer;
    pTxResult: String;
begin
  // CONTROLES DE FILTROS
  Objeto.VALOR_FILTRO.Control      := nil;
  // INFORMACION GENERAL DE LA DISPOSICION
  Objeto.ID_CONTRATO.Control       := nil;
  Objeto.DESC_MONEDA.Control       := nil;
  Objeto.ID_CTO_LIQ.Control        := nil;
  Objeto.SDO_CHEQUERA.Control      := nil;
  Objeto.DESC_COMISION.Control     := nil;
  // INFORMACION DE LA SECCION DE PARAMETROS
  Objeto.F_VALOR_PAGO.Control      := nil;
  Objeto.FACT_MORAS.Control        := nil;
  Objeto.IMP_MORA_COMIS.Control    := nil;
  Objeto.B_IVA_MORAS.Control       := nil;
  Objeto.B_COND_MORAS.Control      := nil;
  //
end;
// +---------------------------------------------------------------------------+
// +                   Evento OnClic del Tipo de busqueda                      +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.oeTipoFiltroClick(Sender: TObject);
begin
  if ( Sender is TComponent ) then
    Objeto.TIPO_FILTRO.AsInteger :=( Sender as TComponent ).Tag;
  //
  if ( Sender is TMenuItem ) then
     ( Sender as TMenuItem ).Checked := True;

  if ( Sender is TMenuItem ) then
    if ( Sender as TMenuItem ).GroupIndex = 1 then
      LimpiaPantalla;
  //
  SetTipoFiltro;
end;
// +---------------------------------------------------------------------------+
// +              Evento OnClic del boton de busqueda del filtro               +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.btnFiltroClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOBACC_ACRED',True,True) then
   begin
      if BeginSearch( True, [] ) then
        MuestraDatos;
      //ends_if
   end;
end;
// +---------------------------------------------------------------------------+
// +                Evento Ejecuta del InterLinkIt en el filtro                +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.ikValorFiltroEjecuta(Sender: TObject);
begin
  if BeginSearch( False, [ ikValorFiltro.Buffer ] ) then
    MuestraDatos;
  //ends_if
end;
// +---------------------------------------------------------------------------+
// +                Evento onClic del boton de búsqueda                        +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.btBUSCAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOBACC_BUSCA',True,True) then
      MuestraDatos;
end;
// +---------------------------------------------------------------------------+
// +                Evento que llama a la clase de lineas                      +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.btID_CONTRATOClick(Sender: TObject);
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
procedure TWCrCobAcc.btCHEQUERAClick(Sender: TObject);
begin
  if Objeto.ID_CTO_LIQ.AsString <> ''then
  begin
    if Objeto.CrContrato.Contrato.FindKey([ Objeto.ID_CTO_LIQ.AsString ]) then
    begin
      Objeto.ConTransa.Contrato := Objeto.CrContrato.Contrato;
      Objeto.ConTransa.Catalogo;
    end;
  end;
end;
// +---------------------------------------------------------------------------+
// +                 Da Formato al Saldo de la Chequera                        +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.edIMPORTE_TEXTChange(Sender: TObject);
begin
  if Sender is TEdit then
    FmtCurrEdit(Sender as TEdit);
end;
// +---------------------------------------------------------------------------+
// +                   Evento onEnter del Edit edFecha                         +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.edFECHAEnter(Sender: TObject);
begin
  if ExisteRegActivo then
    Objeto.TIPO_PARAM.AsInteger := coFecha;
end;
// +---------------------------------------------------------------------------+
// +                   Evento onExit del EditFecha                             +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.edFECHAExit(Sender: TObject);
begin
  if ValFechaOper(False) then
  Begin
     ProcesaCambio;         // Procesa la modificacion a la fecha  de pago
  End;
  //ends_if
end;
// +---------------------------------------------------------------------------+
// +                   Evento onKeyPress  del EditFecha                        +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.edFECHAKeyPress(Sender: TObject; var Key: Char);
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
procedure TWCrCobAcc.dtFECHAExit(Sender: TObject);
begin
  edFECHAExit( edFECHA ); // Procesa una posible modificacion a la fecha  de pago
end;
// +---------------------------------------------------------------------------+
// +                   Evento onClic del botón btFECHAClick                    +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.btFECHAClick(Sender: TObject);
var vlRow      : Integer;
    vlCurrRow  : Integer;
    vlCurrCol  : Integer;
    vlFecha    : TDate;
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
        CalculaCobranza(true);
        UpdateToGrid;
      end;
      GetFromGrid( vlCurrRow, vlCurrCol );            // Obtiene la informacion del registro seleccionado
      DrawControls;                                   // Lo dibuja en pantalla
    end;//ends_if
  end;//ends_if
end;

// +---------------------------------------------------------------------------+
// +                   Evento onEnter del edit edFAC_MORAS                     +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.edFAC_MORASEnter(Sender: TObject);
begin
  if ExisteRegActivo then
    Objeto.TIPO_PARAM.AsInteger := coFactor;
end;
// +---------------------------------------------------------------------------+
// +                   Evento onExit del edit edFAC_MORAS                      +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.edFAC_MORASExit(Sender: TObject);
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
procedure TWCrCobAcc.edFAC_MORASKeyPress(Sender: TObject; var Key: Char);
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
procedure TWCrCobAcc.btFACT_MORASClick(Sender: TObject);
var vlRow      : Integer;
    vlCurrRow  : Integer;
    vlCurrCol  : Integer;
    vlFacMoras : Double;
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
        CalculaCobranza(true);  
        UpdateToGrid;
      end;
      GetFromGrid( vlCurrRow, vlCurrCol );           // Obtiene la informacion del registro seleccionado
      DrawControls;                                  // Lo dibuja en pantalla
    end else
      Objeto.FACT_MORAS.AsFloat := vgInfoPer.FACT_MORAS;
    //ends_if
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +                 Evento onEnter del edit edMONTO_MORAS                     +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.edMONTO_MORASEnter(Sender: TObject);
begin
  if ExisteRegActivo then
    Objeto.TIPO_PARAM.AsInteger := coMonto;
end;
// +---------------------------------------------------------------------------+
// +                  Evento onExit del edit edMONTO_MORAS                     +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.edMONTO_MORASExit(Sender: TObject);
var vlFacMora : Double;
begin
  Objeto.IMP_MORA_COMIS.GetFromControl;
  if vgInfoPer.IMP_MORA_COMIS <> Objeto.IMP_MORA_COMIS.AsFloat then
  begin
    if MessageDlg( Format( coObtFacMora, [ Objeto.IMP_MORA_COMIS.AsFloat ] ), mtConfirmation, mbYesNoCancel, 0 ) = mrYes then
    begin
      if Objeto.StpObtFacMora( Objeto.ID_ACCESORIO.AsInteger,  Objeto.FOL_ACCESORIO.AsInteger,
                               Objeto.FOL_ACCESORIO.AsString,  Objeto.CVE_COMISION.AsString,
                               Objeto.NUM_PERIODO.AsInteger,   Objeto.F_MORA_ORI.AsFloat,
                               Objeto.B_IVA_M_ORI.AsString,    Objeto.IMP_MORA_COMIS.AsFloat,
                               Objeto.F_VALOR_PAGO.AsDateTime, vlFacMora ) then
      begin
        UserCambiaFactorMoras( vlFacMora );
        ProcesaCambio;
      end else
        Objeto.IMP_MORA_COMIS.AsFloat := vgInfoPer.IMP_MORA_COMIS;
      //ends_if
    end else
      Objeto.IMP_MORA_COMIS.AsFloat   := vgInfoPer.IMP_MORA_COMIS;
    //ends_if
  end;
end;
// +---------------------------------------------------------------------------+
// +                Evento onKeyPress del edit edMONTO_MORAS                   +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.edMONTO_MORASKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = coCR then
  begin
    edMONTO_MORASExit( edMONTO_MORAS );
    Key := #0;
  end;
end;
// +---------------------------------------------------------------------------+
// +               Evento onClic del check box cbB_IVA_MORA                    +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.cbB_IVA_MORAClick(Sender: TObject);
begin
  if ExisteRegActivo then
  begin
    Objeto.B_IVA_MORAS.GetFromControl;
    ProcesaCambio;
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +               Evento onEnter del check box cbB_IVA_MORA                   +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.cbB_IVA_MORAEnter(Sender: TObject);
begin
  if ExisteRegActivo then
    Objeto.TIPO_PARAM.AsInteger := coIVAMor;
end;
// +---------------------------------------------------------------------------+
// +               Evento onClic del check box cbB_COND_MORAS                  +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.cbB_COND_MORASClick(Sender: TObject);
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
// +                Evento onEnter del check box cbB_COND_MORAS                +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.cbB_COND_MORASEnter(Sender: TObject);
begin
  if ExisteRegActivo then
    Objeto.TIPO_PARAM.AsInteger := coCondMor;
end;
// +---------------------------------------------------------------------------+
// +                 Evento DrawCell del Grid de Datos                         +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.sagDATOSDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
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
procedure TWCrCobAcc.sagDATOSMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var ACol  : Integer;
    ARow  : Integer;
begin
  if ExisteRegActivo then
  begin
    sagDATOS.MouseToCell(X, Y ,ACol, ARow);
    //SELECCIONA LA COBRANZA DE LOS CONCEPTOS
    If (  ACol = COL_SEL  ) Then //  selecciona la cobranza de los conceptos
    begin
      Objeto.B_APLICA_PAGO.AsString := BoolToStr( NOT ( StrToBool( Objeto.B_APLICA_PAGO.AsString ) ) );
      UpdateToGrid;
    end;
  end;
end;
// +---------------------------------------------------------------------------+
// +               Evento DrawCell del Grid de Datos (automatico)              +
// +   Cambia la información en pantalla de acuerdo a la seleccion del usuario +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.sagDATOSSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if DataFound then
  begin
    GetFromGrid( ARow, ACol );
    DrawControls;
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +                Evento onClic del check box cbSeleccion                    +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.cbSeleccionClick(Sender: TObject);
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
      Objeto.B_APLICA_PAGO.AsString := vlCobra;
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
procedure TWCrCobAcc.MErroresDblClick(Sender: TObject);
begin
  MErrores.Lines.Clear;
end;
// +---------------------------------------------------------------------------+
// +    A partir de una cadena determina si despliega un mensaje de error      +
// +---------------------------------------------------------------------------+
Function TWCrCobAcc.ValidaError( pMsgError : String): Boolean;
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
// +                Evento onClic del boton de cobranza                        +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.btnCobraClick(Sender: TObject);
var vlError      : String;
    vlRow        : Integer;
    vlIndex      : Integer;
    vlCnt        : Integer;
    vlResult     : Integer;
    vlTxResult   : String;
    vlAgrega     : Boolean;
    vlsql        : string;
    vlDia        : Integer;
    vlDias       : Integer;
    vlDiaInicial : TDateTime;
begin
   if Objeto.ValidaAccesoEsp('TCRCOBACC_COBRA',True,True) then
   begin
      if not DataFound then  // Valida si tiene datos el grid
      begin
        ShowMessage( coNoData );
        exit;
      end;//end_if
      //
      if not ( MessageDlg( coRealizaCob, mtConfirmation, [mbYes, mbNo], 0  ) = mrYes ) then
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

      MessageIniFinProceso( MErrores, cInicio );
      //
      for vlRow := 0 to sagDATOS.RowCount - 1 do
      begin
        GetFromGrid( vlRow,  0 );
        if ExisteRegActivo then
        begin
          //
          if Objeto.B_APLICA_PAGO.AsString = 'V' then
          begin
              //
              Objeto.StpCobranza( vlError );
              if ValidaError( vlError ) then
              begin
                if not ( MessageDlg( coErrorCob, mtConfirmation, [mbYes, mbNo], 0  ) = mrYes ) then
                  exit;
                //end_if
              end;//ends_if_ValidaError(_vlError_)_then
              //
          end;//ends_if Objeto.B_APLICA_PAGO.AsString = 'V' then
          //
        end;
      end;
      //
      MessageIniFinProceso( MErrores, cFinal );
      // Actualiza la pantalla
      MuestraDatos;
   end;   
end;
// +---------------------------------------------------------------------------+
// +                Evento onClic del boton sbLogCobranza                      +
// +---------------------------------------------------------------------------+
procedure TWCrCobAcc.sbLogCobranzaClick(Sender: TObject);
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
 finally
   fList.Free;
 end;
end;











End.


