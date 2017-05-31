// Sistema         : Clase de CRCOBRANZ
// Fecha de Inicio : 13/08/2003
// Función forma   : Clase de CRCOBRANZ
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
// Modificada      : 03 nov 2004. Pago x disposicion
//                 : 15 sep 2005. Corrección multichequera
Unit IntCrCobPas;

interface

uses
  Windows, Messages, SysUtils, Classes,  Graphics, Controls, Forms,    Dialogs,
  IntFrm,  DB,       DbTables, Mask,     StdCtrls, Buttons,  ExtCtrls, InterFor,
  IntFind, UnSQL2,   InterFun, ComCtrls, IntDtPk,  Grids,    Aligrid,  InterEdit,
  ImgList, Menus,    ToolWin,  StdActns, ActnList,


  //Unidades Adicionales
  IntLinkit,
  IntParamCre,   // Unidad de paramétros del Panel
  IntCrCobConst, // Constantes y procedimientos de la cobranza
  IntGenCre,     // Unidad genérica de funciones y constantes
  IntCrProduct,  // Producto
  IntCrCto,      // Contrato
  IntCrCredito,  // Disposición
  IntMDispFond
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
  TCrCobPas  = class;
  //
  TWCrCobPas = class(TForm)
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
    cbSeleccion: TCheckBox;
    sbLogCobranza: TSpeedButton;
    cbB_COB_ORD_PER: TCheckBox;
    pnColumnas: TPanel;
    edTitDocto: TEdit;
    edTitFVentto: TEdit;
    edTitSEL: TEdit;
    edTitDisp: TEdit;
    edTitInt: TEdit;
    edTitTotal: TEdit;
    edTitImpCap: TEdit;
    edTitComis: TEdit;
    edTitFOper: TEdit;
    edTitFinAdic: TEdit;
    sagDATOS: TStringAlignGrid;
    bvSeparador: TBevel;
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
    btBUSCA: TBitBtn;
    pnlMsgs: TPanel;
    lbCveInstitucion: TLabel;
    edCVE_FND_ENT_DES: TEdit;
    edNOM_FND_ENT_DES: TEdit;
    ilCVE_FND_ENT_DES: TInterLinkit;
    edNOM_FND_PROGRAMA: TEdit;
    ilCVE_FND_PROGRAMA: TInterLinkit;
    edCVE_FND_PROGRAMA: TEdit;
    lbCvePrograma: TLabel;
    lbIdCredito: TLabel;
    edID_CREDITO_PAS: TEdit;
    btID_CREDITO_PAS: TBitBtn;
    ilID_CREDITO_PAS: TInterLinkit;
    edNOM_ACREDITADO: TEdit;
    gbInfGral: TGroupBox;
    lbIdContrato: TLabel;
    lbCveMoneda: TLabel;
    lbSdoVigTotal: TLabel;
    lbFInicio: TLabel;
    lbPlazo: TLabel;
    lbCveProducto: TLabel;
    ldSdoInicial: TLabel;
    edID_CONTRATO_PAS: TEdit;
    edDESC_MONEDA_PAS: TEdit;
    edSDO_VIG_TOTAL_PAS: TEdit;
    edF_INICIO_PAS: TEdit;
    edDIAS_PLAZO_PAS: TEdit;
    edDESC_C_PRODUCTO_PAS: TEdit;
    edIMP_REDESCONTADO_PAS: TEdit;
    lbFVencto: TLabel;
    edF_VENCIMIENTO_PAS: TEdit;
    lbPctRedescto: TLabel;
    edPCT_REDESCONTADO_PAS: TEdit;
    gbParametros: TGroupBox;
    lbF_VALOR: TLabel;
    SpeedButton1: TSpeedButton;
    edFECHA: TEdit;
    dtFECHA: TInterDateTimePicker;
    InterForma1: TInterForma;
    ImageList: TImageList;
    lbDocto: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btBUSCAClick(Sender: TObject);
    procedure sagDATOSSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure btFECHAClick(Sender: TObject);
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure btnCobraClick(Sender: TObject);
    procedure sagDATOSDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure sagDATOSMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btDISPOCISIONClick(Sender: TObject);
    procedure cbSeleccionClick(Sender: TObject);
    procedure sbLogCobranzaClick(Sender: TObject);
    procedure edFECHAExit(Sender: TObject);
    procedure edFECHAKeyPress(Sender: TObject; var Key: Char);
    procedure edFECHAEnter(Sender: TObject);
    procedure MErroresDblClick(Sender: TObject);
    procedure edIMPORTE_TEXTChange(Sender: TObject);
    procedure dtFECHAExit(Sender: TObject);
    procedure ilID_CREDITO_PASEjecuta(Sender: TObject);
    procedure btID_CREDITO_PASClick(Sender: TObject);
    procedure btCONCEPTOSClick(Sender: TObject);
    procedure btINTERESClick(Sender: TObject);
    procedure btFinAdicClick(Sender: TObject);
    procedure btCAPITALClick(Sender: TObject);
  private
    fSearching  : Boolean;
    fDataFound  : Boolean;
  private
    procedure    LimpiaRecord;
    procedure    DrawControls;
    procedure    LimpiaPantalla;
    //
    procedure    AddError   ( pMsgError : String);
    Function     ValidaError( pMsgError : String): Boolean;
    procedure    AsignaFVAlorPago   ( peFecha  : TDateTime );
    procedure    AsignaImpComision  ( peMonto  : Double    );
    procedure    AsignaImpInteres   ( peMonto  : Double    );
    procedure    AsignaImpFinAdic   ( peMonto  : Double    );
    procedure    AsignaImpCapital   ( peMonto  : Double    );
    //
    procedure    MuestraDatos;
    Procedure    SumaImportes;
    procedure    ObtImportes;
    procedure    CalculaCobranza;
    //
    procedure    UpdateToGrid;
    function     ExisteRegActivo : Boolean;
    procedure    FmtCurrEdit( Sender: TEdit );
    function     EsDescuento( peParam   : String ): Boolean;
    procedure    GetFromGrid( peRowGrid, peColGrid : Integer);
    Function     ValFechaOper( peBandera : Boolean ): Boolean;
    procedure    HabilitaChkBox( peHabilita : Boolean );
    //
    //procedure    GetFromControls;
    //procedure    ProcesaCambio;
  private
    vgInfoPer    : PInfoDocto;
  private
    property Searching : Boolean read fSearching write fSearching default true;
    property DataFound : Boolean read fDataFound write fDataFound default true;
  public
    Objeto       : TCrCobPas;
  end;

  TCrCobPas= class(TInterFrame)
  protected
  public
    //
    TIPO_PARAM               : TInterCampo;
    CVE_ACCESORIO            : TInterCampo;
    INDICE_GRID              : TInterCampo;
    COLUMNA_GRID             : TInterCampo;
    //
    ID_DOCUMENTO             : TInterCampo;
    NUM_PER_DOCTO            : TInterCampo;
    F_VENCIMIENTO            : TInterCampo;
    F_PROG_PAGO              : TInterCampo;
    F_VALOR_PAGO             : TInterCampo;
    // 
    IMP_COMISION             : TInterCampo;
    IMP_INTERES              : TInterCampo;
    IMP_FIN_ADIC             : TInterCampo;
    IMP_CAPITAL              : TInterCampo;
    IMP_TOTAL                : TInterCampo;
    //
    B_COB_COMISION           : TInterCampo;
    B_COB_INTERES            : TInterCampo;
    B_COB_FIN_ADIC           : TInterCampo;
    B_COB_CAPITAL            : TInterCampo;
    B_COB_TOTAL              : TInterCampo;
    //
    B_COB_ORD_PER            : TInterCampo;
    B_COB_ORD_ACC            : TInterCampo;
    B_COB_TOT_PER            : TInterCampo;
    B_COB_PARCIAL            : TInterCampo;
    //
    // Clases auxiliares
    ParamCre                 : TParamCre;
    CrContrato               : TCrCto;
    Credito                  : TCrCredito;
    Producto                 : TCrproduct;
    MDispFond                : TMDispFond;
    //
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
                  psubtipcob     : String;  b_transfiere    : String;   var  vlError    : String);
    procedure   StpCobranza( var  vlError : String);
    function    StpObtCntLog : Integer;
    procedure   StpObtLog( peIndice : Integer; var vlError:Integer; var  vlTxError : String );
    function    ValSolDispNaf : Boolean;
  public
    function    BuildSQLString : String;
    procedure   StpObtAdeudo( peIdCredito  : Integer; pEntDesc : String;
                              pPrograma    : String;  peNumPeriodo: Integer;
                              peCveComision: String;  pFCalculo : TDate;
                              pCveAccesorio: String;
                              var vlTotal,  vlImporte,   vlIVA,
                                  vlMoras,  vlIVAMoras : Double;
                              var vlError : String );
  published
  end;




const
   // Posicion de los datos en el GRID ( Datos Visibles )
   COL_SEL  = 0;  // Aplica cobro
   COL_CRED = 1;  // Número de disposición
   COL_DOCU = 2;  // Número de documento
   COL_FVTO = 3;  // Fecha de vencimiento
   COL_FVAL = 4;  // Fecha de operación ( Valor )
   COL_ICAP = 5;  // Importe de Capital
   COL_IFIN = 6;  // Importe de Fin. Adicional
   COL_IINT = 7;  // Importe de Interés
   COL_ICOM = 8;  // Importe de Conceptos
   COL_ITOT = 9;  // Importe Total
   COL_VIS  = COL_ITOT;  // Valor de la ultima columna visible en el Grid
   // Posicion de los datos en el GRID ( Datos no visibles )
   COL_FPPA = 10; // Fecha programada de pago
   COL_NPDO = 11; // Numero de periodo de documento
   COL_BCCO = 12; // B_Concepto
   COL_BCIN = 13; // B_Interes
   COL_BCFA = 14; // B_Financiamiento Adicional
   COL_BCCA = 15; // B_Capital
   //
   // Tipo de Parametro
   coNone        = 0;
   coFecha       = 1;
   coPaquete     = 'PKGCRCOBRANZA';
   //
   coFmtCurrency = '###,###,###,###,###,###,###,##0.00';
   //
   // Mensajes generales desplegados en la pantalla
   coFoD000      = 'La fecha no puede ser mayor al día actual.';
   coFoNoHabil   = 'La fecha de operación debe ser un día hábil.';
   coFoActAll    = '¿Deseas aplicar la fecha de operación %s a todos los períodos?.';
   coRealizaCob  = '¿Desea aplicar la cobranza?';
   coErrorCob    = 'Ha ocurrido un error. ¿Desea continuar?';
   coNoFiltro    = 'Debe indicar un filtro de búsqueda';
   coNoData      = 'No existen datos';
   //
   coSqlPerComPas   = ' SIT_COMISION NOT IN ( ''CA'', ''LQ'' ) AND ' + coCRLF +
                      ' ( ( IMP_COMISION + IMP_IVA ) - ( IMP_PAGADO  + IMP_IVA_PAGADO ) <> 0 ) ';


   coSqlPerIntPas   = ' SIT_INTERES NOT IN ( ''CA'', ''LQ'' ) AND ' + coCRLF +
                      ' ( ( IMP_INTERES + IMP_IVA ) - ( IMP_PAGADO  + IMP_IVA_PAGADO ) <> 0 ) ';


   coSqlPerFinPas   = ' SIT_FINAN_ADIC NOT IN ( ''CA'', ''LQ'' ) AND ' + coCRLF +
                      ' ( ( IMP_FINAN_ADIC - IMP_PAGADO ) <> 0 ) ';

   coSqlPerCapPas   = ' SIT_CAPITAL NOT IN ( ''CA'', ''LQ'' ) AND ' + coCRLF +
                      ' ( ( IMP_CAPITAL - IMP_PAGADO ) <> 0 ) ';
  //
  //
implementation
Uses  IntMensaje;
{$R *.DFM}

{
+------------------------------------------------------------------------------+
|                      METODOS Y PROCEDIMIENTOS DEL OBJETO                     |
+------------------------------------------------------------------------------+
}
constructor TCrCobPas.Create( AOwner : TComponent );
begin
  Inherited;
  //
  INDICE_GRID       := CreaCampo( 'INDICE_GRID',       ftInteger, tsNinguno, tsNinguno, False );
  COLUMNA_GRID      := CreaCampo( 'COLUMNA_GRID',      ftInteger, tsNinguno, tsNinguno, False );
  TIPO_PARAM        := CreaCampo( 'TIPO_PARAM',        ftInteger, tsNinguno, tsNinguno, False );
  ID_DOCUMENTO      := CreaCampo( 'ID_DOCUMENTO',      ftString,  tsNinguno, tsNinguno, False );
  NUM_PER_DOCTO     := CreaCampo( 'NUM_PER_DOCTO',     ftFloat,   tsNinguno, tsNinguno, False );
  F_VENCIMIENTO     := CreaCampo( 'F_VENCIMIENTO',     ftDate,    tsNinguno, tsNinguno, False );
  F_PROG_PAGO       := CreaCampo( 'F_PROG_PAGO',       ftDate,    tsNinguno, tsNinguno, False );
  // DE LA SECCION DE PARAMETROS
  F_VALOR_PAGO      := CreaCampo( 'F_VALOR_PAGO',      ftDate,    tsNinguno, tsNinguno, False );
  //
  IMP_COMISION      := CreaCampo( 'IMP_COMISION',      ftFloat,   tsNinguno, tsNinguno, False );
  IMP_INTERES       := CreaCampo( 'IMP_INTERES',       ftFloat,   tsNinguno, tsNinguno, False );
  IMP_FIN_ADIC      := CreaCampo( 'IMP_FIN_ADIC',      ftFloat,   tsNinguno, tsNinguno, False );
  IMP_CAPITAL       := CreaCampo( 'IMP_CAPITAL',       ftFloat,   tsNinguno, tsNinguno, False );
  IMP_TOTAL         := CreaCampo( 'IMP_TOTAL',         ftFloat,   tsNinguno, tsNinguno, False );
  //
  B_COB_COMISION    := CreaCampo( 'B_COB_COMISION',    ftString,  tsNinguno, tsNinguno, False);
  B_COB_INTERES     := CreaCampo( 'B_COB_INTERES',     ftString,  tsNinguno, tsNinguno, False);
  B_COB_FIN_ADIC    := CreaCampo( 'B_COB_FIN_ADIC',    ftString,  tsNinguno, tsNinguno, False);
  B_COB_CAPITAL     := CreaCampo( 'B_COB_CAPITAL',     ftString,  tsNinguno, tsNinguno, False);
  B_COB_TOTAL       := CreaCampo( 'B_COB_TOTAL',       ftString,  tsNinguno, tsNinguno, False);
  //
  B_COB_ORD_PER     := CreaCampo( 'B_COB_ORD_PER',     ftString,  tsNinguno, tsNinguno, False );
  B_COB_ORD_ACC     := CreaCampo( 'B_COB_ORD_ACC',     ftString,  tsNinguno, tsNinguno, False );
  B_COB_TOT_PER     := CreaCampo( 'B_COB_TOT_PER',     ftString,  tsNinguno, tsNinguno, False );
  B_COB_PARCIAL     := CreaCampo( 'B_COB_PARCIAL',     ftString,  tsNinguno, tsNinguno, False );
  //
  CVE_ACCESORIO     := CreaCampo( 'CVE_ACCESORIO',     ftString,  tsNinguno, tsNinguno, False );

  {   Catalogos   }
  {$WARNINGS OFF}
  // Producto
  Producto := TCrproduct.Create(Self);
  Producto.MasterSource := Self;
  // Autorizacion
  CrContrato := TCrCto.Create(self);
  CrContrato.MasterSource := Self;
  // Credito
  Credito := TCrCredito.Create(Self);
  Credito.MasterSource := Self;
  // Disposicion Pasiva
  MDispFond := TMDispFond.Create(Self);
  MDispFond.MasterSource := Self;
  {$WARNINGS ON}

  StpName    := ' ';
  UseQuery   := False;
  HelpFile   := 'IntCrCobPas.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrCobPas.Destroy;
begin
  if Producto <> nil then
     Producto.free;
  //end if;
  if CrContrato <> nil then
     CrContrato.Free;
  //end if
  if Credito <> nil then
     Credito.Free;
  //end if;
  if MDispFond <> nil then
     MDispFond.Free;
  //end if;
  inherited;
end;


function TCrCobPas.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCobPas;
begin
   W := TWCrCobPas.Create(Self);
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
// +---------------------------------------------------------------------------+
// +                                                                           +
// +---------------------------------------------------------------------------+
Function TCrCobPas.InternalBusca:Boolean;
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
procedure TCrCobPas.MuestraError(vlError: String);
begin
  EXECUTE_MUESTRAMENSAJE( vlError );
end;
// +---------------------------------------------------------------------------+
// +                  Convierte un booleano a una cadena                       +
// +---------------------------------------------------------------------------+
function TCrCobPas.BoolToStr( peValor : Boolean ) : String;
begin
  if peValor then result := 'V' else result := 'F';
end;
// +---------------------------------------------------------------------------+
// +                  Convierte una cadena a un booleano                       +
// +---------------------------------------------------------------------------+
function TCrCobPas.StrToBool(peValor: String): Boolean;
begin
  result := ( peValor = 'V' );
end;
// +---------------------------------------------------------------------------+
// +           Limpia la tabla temporal de la cobranza de creditos             +
// +---------------------------------------------------------------------------+
procedure TCrCobPas.LimpiaTablaCob( var  vlError : String );
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
procedure TCrCobPas.StpAgregaElemento(     pidCredito      : Integer;  pFVentto        : TDate;
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
                  psubtipcob     : String;  b_transfiere    : String;
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
        StoredProcName:= coPaquete + '.' + 'STPAGREGAELEMENTO';
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
// +             Este procedimiento hace el llamado a la cobranza              +
// +---------------------------------------------------------------------------+
procedure TCrCobPas.StpCobranza(var  vlError : String);
var  STPCobranza  : TStoredProc;
Begin
   vlError := '';
   STPCobranza := TStoredProc.Create(Nil);
   try
      with STPCobranza do
      begin
        DatabaseName   := Apli.DatabaseName;
        SessionName    := Apli.SessionName;
        StoredProcName := 'PKGCRCOBRANZA.STPLIQPASIVO';
        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftFloat,  'PEID_CREDITO',        ptInput);
        Params.CreateParam(ftString, 'PECVE_FND_ENT_DES',   ptInput);
        Params.CreateParam(ftString, 'PECVE_FND_PROGRAMA',  ptInput);
        Params.CreateParam(ftDate,   'PEF_VALOR_LIQUIDA',   ptInput);
        Params.CreateParam(ftFloat,  'PE_ID_GPO_LIQUIDA',   ptInput);
        Params.CreateParam(ftString, 'PECVE_USUARIO',       ptInput);
        Params.CreateParam(ftString, 'PEB_COMMIT',          ptInput);
        Params.CreateParam(ftFloat,  'PSRESULTADO',         ptOutput);
        Params.CreateParam(ftString, 'PSTXRESULTADO',       ptOutput);
        //
        ParamByName( 'PEID_CREDITO'       ).AsInteger := MDispFond.ID_CREDITO.AsInteger;
        ParamByName( 'PECVE_FND_ENT_DES'  ).AsString  := MDispFond.CVE_FND_ENT_DES.AsString;
        ParamByName( 'PECVE_FND_PROGRAMA' ).AsString  := MDispFond.CVE_FND_PROGRAMA.AsString;
        ParamByName( 'PEF_VALOR_LIQUIDA'  ).AsDate    := F_VALOR_PAGO.AsDateTime;
        ParamByName( 'PE_ID_GPO_LIQUIDA'  ).Clear;
        ParamByName( 'PECVE_USUARIO'      ).AsString  := Apli.Usuario;
        ParamByName( 'PEB_COMMIT'         ).AsString  := 'V';
        ExecProc;
        if (ParamByName('PSRESULTADO').AsInteger <> 0 ) then
        Begin
           vlError := 'Problemas en la cobranza: '                      + coCRLF +
                      'Código : ' + ParamByName('PSRESULTADO').AsString + coCRLF +
                      'Mensaje: ' + ParamByName('PSTXRESULTADO').AsString;
        end;
      end;
   finally
     STPCobranza.Free;
   end;
end;
// +---------------------------------------------------------------------------+
// +           Procedimiento que obtiene el numero de registros del log        +
// +---------------------------------------------------------------------------+
function TCrCobPas.StpObtCntLog: Integer;
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
procedure TCrCobPas.StpObtLog( peIndice : Integer; var vlError   :Integer;
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
// +           Trae los datos del adeudo a la pantalla de la cobranza          +
// +---------------------------------------------------------------------------+
procedure TCrCobPas.StpObtAdeudo( peIdCredito  : Integer; pEntDesc : String;
                                  pPrograma    : String;  peNumPeriodo: Integer;
                                  peCveComision: String;  pFCalculo : TDate;
                                  pCveAccesorio: String;
                                  var vlTotal,  vlImporte,   vlIVA,
                                      vlMoras,  vlIVAMoras : Double;
                                  var vlError : String );
var  STPObtAdeudo : TStoredProc;
Begin
  vlError := '';
  STPObtAdeudo := TStoredProc.Create(Nil);
  try
    with STPObtAdeudo do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:='PKGCRREDESCTO.STPFNDOBTADEUDO';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam( ftInteger, 'peIdCredito',      ptInput  );
      Params.CreateParam( ftString,  'peCveFndEntDes',   ptInput  );
      Params.CreateParam( ftString,  'peCveFndPrograma', ptInput  );
      Params.CreateParam( ftInteger, 'peNumPeriodo',     ptInput  );
      Params.CreateParam( ftString,  'peCveComision',    ptInput  );
      Params.CreateParam( ftDate,    'peFReferencia',    ptInput  );
      Params.CreateParam( ftDate,    'peFCalculo',       ptInput  );
      Params.CreateParam( ftString,  'peCveAccesorio',   ptInput  );
      Params.CreateParam( ftFloat,   'psImporte',        ptOutput );
      Params.CreateParam( ftFloat,   'psIVA',            ptOutput );
      Params.CreateParam( ftFloat,   'psMoras',          ptOutput );
      Params.CreateParam( ftFloat,   'psIVAMoras',       ptOutput );
      Params.CreateParam( ftFloat,   'psTotal',          ptOutput );
      Params.CreateParam( ftFloat,   'psTasa',           ptOutput );
      //
      Params.CreateParam( ftFloat,   'psResultado',   ptOutput);
      Params.CreateParam( ftString,  'psTxResultado', ptOutput);
      //
      ParamByName('peIdCredito').AsInteger  := peIdCredito;
      ParamByName('peCveFndEntDes'   ).AsString          := pEntDesc;
      ParamByName('peCveFndPrograma' ).AsString          := pPrograma;
      ParamByName('peNumPeriodo').AsInteger := peNumPeriodo;
      ParamByName('peCveComision').AsString := peCveComision;
      ParamByName('peFReferencia').AsDateTime := Apli.DameFechaEmpresa;
      ParamByName('peFCalculo').AsDate        := pFCalculo;
      ParamByName('peCveAccesorio').AsString  := pCveAccesorio;
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
        MuestraError( vlError );
      end;
    end;
  finally
    STPObtAdeudo.Free;
  end;
end;
// +---------------------------------------------------------------------------+
// +         Construye la cadena SQL para realizar la busqueda de registros    +
// +---------------------------------------------------------------------------+
function TCrCobPas.BuildSQLString: String;
var vlsql        : String;
    vlSQLPer     : String;
    vlSqlImpDep  : String;
    vlSelNumPer  : String;
    vlBuscaCred  : String;
Begin
  vlBuscaCred := 'ID_CREDITO = '      + MDispFond.ID_CREDITO.AsString                + ' AND ' +
                 'CVE_FND_ENT_DES = ' + SQLStr( MDispFond.CVE_FND_ENT_DES.AsString ) + ' AND ' +
                 'CVE_FND_PROGRAMA= ' + SQLStr( MDispFond.CVE_FND_PROGRAMA.AsString);
  //
  vlSqlImpDep := '0 IMP_DEPOSITO,';
  //
  vlSelNumPer :=
           '        0 NUM_PER_COM, '         + coCRLF +
           '        0 NUM_PER_INT, '         + coCRLF +
           '        0 NUM_PER_FIN, '         + coCRLF +
           '        0 NUM_PER_CAP, '
           ;
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
           '               SUM(IMP_MOR_CN) IMP_MOR_CN'       + coCRLF +
           '        FROM   ( ' +
           '                 SELECT ID_CREDITO,  C.F_PROG_PAGO, C.NUM_PERIODO, '                 + coCRLF +
           '                        C.F_VENCIMIENTO, '                                           + coCRLF +
           '                        pkgCrRedescto.stpFndImpCob( C.ID_CREDITO, '                  + coCRLF +
           '                          C.CVE_FND_ENT_DES, C.CVE_FND_PROGRAMA, '                   + coCRLF +
           '                          C.NUM_PERIODO, NULL, NULL, NULL, ''RK'') IMP_CAPITAL,'     + coCRLF +
           '                        0 IMP_FIN_ADIC, 0 IMP_INTERES, 0 IMP_COMISION,'              + coCRLF +
           '                        0 IMP_MOR_CP,  0 IMP_MOR_FN,  0 IMP_MOR_IN, 0 IMP_MOR_CN   ' + coCRLF +
           '                 FROM   CR_FND_CAPITAL C   '   + coCRLF +
           '                 WHERE ' + vlBuscaCred         + coCRLF +
           '                   AND ' + coSqlPerCapPas      + coCRLF +
           '                 UNION '                       + coCRLF +
           '                 SELECT FN.ID_CREDITO,  FN.F_PROG_PAGO, FN.NUM_PERIODO, ' + coCRLF +
           '                        FN.F_VENCIMIENTO, '                               + coCRLF +
           '                        0 IMP_CAPITAL, '                                  + coCRLF +
           '                        pkgCrRedescto.stpFndImpCob( FN.ID_CREDITO, '      + coCRLF +
           '                        FN.CVE_FND_ENT_DES, FN.CVE_FND_PROGRAMA, '        + coCRLF +
           '                        FN.NUM_PERIODO, NULL, NULL, NULL, ''RF'' ) IMP_FIN_ADIC, '    + coCRLF  +
           '                        0 IMP_INTERES,  0 IMP_COMISION, 0 IMP_MOR_CP,  '  + coCRLF +
           '                        0 IMP_MOR_FN, ' + coCRLF +
           '                        0 IMP_MOR_IN, 0 IMP_MOR_CN   '   + coCRLF +
           '                 FROM   CR_FND_FIN_ADIC FN ' + coCRLF +
           '                 WHERE ' + vlBuscaCred       + coCRLF +
           '                   AND ' + coSqlPerFinPas    + coCRLF +
           '                 UNION '                     + coCRLF +
           '                 SELECT I.ID_CREDITO,  I.F_PROG_PAGO, I.NUM_PERIODO,' + coCRLF +
           '                        I.F_VENCIMIENTO, '                            + coCRLF +
           '                        0 IMP_CAPITAL, 0 IMP_FIN_ADIC, '              + coCRLF +
           '                        pkgCrRedescto.stpFndImpCob( I.ID_CREDITO,'    + coCRLF +
           '                          I.CVE_FND_ENT_DES, I.CVE_FND_PROGRAMA, '    + coCRLF +
           '                          I.NUM_PERIODO, NULL, NULL, NULL, ''RI'' ) IMP_INTERES,' + coCRLF +
           '                        0 IMP_COMISION, 0 IMP_MOR_CP,  0 IMP_MOR_FN,' + coCRLF +
           '                        0 IMP_MOR_IN, '      + coCRLF +
           '                        0 IMP_MOR_CN   '     + coCRLF +
           '                 FROM   CR_FND_INTERES I   ' + coCRLF +
           '                 WHERE ' + vlBuscaCred       + coCRLF +
           '                   AND ' + coSqlPerIntPas    + coCRLF +
           '                 UNION '                     + coCRLF +
           '                 SELECT CO.ID_CREDITO, CO.F_PROG_PAGO, CO.NUM_PERIODO, ' + coCRLF +
           '                        CO.F_VENCIMIENTO, '                              + coCRLF +
           '                        0 IMP_CAPITAL,  0 IMP_FIN_ADIC, 0 IMP_INTERES, ' + coCRLF +
           '                        SUM( pkgCrRedescto.stpFndImpCob( CO.ID_CREDITO,' + coCRLF +
           '                              CO.CVE_FND_ENT_DES, CO.CVE_FND_PROGRAMA, ' + coCRLF +
           '                              CO.NUM_PERIODO, CO.CVE_COMISION, NULL, NULL, ''RN'' ) ) IMP_COMISION, ' + coCRLF  +
           '                        0 IMP_MOR_CP, 0 IMP_MOR_FN,  '   + coCRLF +
           '                        0 IMP_MOR_IN, '      + coCRLF +
           '                        0 IMP_MOR_CN   '     + coCRLF +
           '                 FROM   CR_FND_COMISION CO ' + coCRLF +
           '                 WHERE ' + vlBuscaCred       + coCRLF +
           '                   AND ' + coSqlPerComPas    + coCRLF +
           '                 GROUP  BY CO.ID_CREDITO, CO.F_PROG_PAGO, CO.F_VENCIMIENTO, CO.NUM_PERIODO ' + coCRLF +
           '               ) CRE, '                                             + coCRLF +
           '               CR_DOCUMENTO D '                                     + coCRLF +
           '        WHERE  CRE.ID_CREDITO  = D.ID_CESION(+) '                   + coCRLF +
           '          AND  CRE.NUM_PERIODO = D.NUM_PERIODO_DOC(+) '             + coCRLF +
           '        GROUP BY ID_CREDITO,     F_VENCIMIENTO,     F_PROG_PAGO, '  + coCRLF +
           '                 D.ID_DOCUMENTO, D.NUM_PERIODO_DOC, D.IMP_NOMINAL '
           ;

   // Arma la sentencia SQL.
   vlsql :=' SELECT CR.ID_CREDITO, '      + coCRLF +
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
           '        CTTO.CVE_MONEDA, '    + coCRLF +
           '        CTTO.ID_CONTRATO, '   + coCRLF +
           '        MON.DESC_MONEDA, '    + coCRLF +
           '        SPF_NOMBRE_CTTE(CTTO.ID_CONTRATO,CTTO.ID_TITULAR) AS NOMBRE, '                      + coCRLF +
           '        PKGCRCOMUN.CTABCO_TO_CHQRA(PKGCRPERIODO.STPObtChqCte( A.ID_ACREDITADO, '            + coCRLF +
           '        NVL( CS.CVE_EMISOR_NAFIN, NVL( PROCAM.CVE_SUB_DIVISION, ''0''  ) ), CR.ID_CREDITO, '+ coCRLF +
           '             DECODE( NVL( PROCAM.CVE_SUB_DIVISION, ''NULL'' ), ''NULL'', ''AC'', ''AP'' ),' + coCRLF +
           '             ''AD'', ''CR'' ) ) AS CHEQUERA, '                                              + coCRLF +
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
           vlSqlImpDep + coCRLF +
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
           '        ''F''  B_APLICA_GF, '      + coCRLF +
           '        PKGCRCOBRANZA.STPOBTBGARFEGA( CR.ID_CREDITO ) GAR_FEGA, '  + coCRLF +
           '        PKGCRCOBRANZA.STPBOBTMULTICHEQUERA( CR.ID_CREDITO ) B_MULTI_CHQRA'  + coCRLF +
           ' FROM  CR_CREDITO CR, '            + coCRLF +
           '       CR_CONTRATO CC, '           + coCRLF +
           '       CONTRATO CTTO, '            + coCRLF +
           '       CR_ACREDITADO A, '          + coCRLF +
           '       PERSONA P, '                + coCRLF +
           '       CR_PRODUCTO PR, '           + coCRLF +
           '       MONEDA MON, '               + coCRLF +
           '       CR_CESION CS, '             + coCRLF +
           '       CR_PROCAMPO PROCAM, '       + coCRLF +
           '( ' + vlSQLPer + ' ) PERIODO '     + coCRLF +
           ' WHERE CR.ID_CREDITO       = PERIODO.ID_CREDITO '                   + coCRLF +
           '   AND CTTO.ID_EMPRESA     = ' + IntToStr(Apli.IdEmpresa)           + coCRLF +
           '   AND CC.ID_CONTRATO      = CR.ID_CONTRATO '           + coCRLF +
           '   AND CC.FOL_CONTRATO     = CR.FOL_CONTRATO '          + coCRLF +
           '   AND CTTO.ID_CONTRATO    = CC.ID_CONTRATO '           + coCRLF +
           '   AND A.ID_ACREDITADO     = CTTO.ID_TITULAR '          + coCRLF +
           '   AND P.ID_PERSONA        = CTTO.ID_TITULAR '          + coCRLF +
           '   AND MON.CVE_MONEDA      = CTTO.CVE_MONEDA '          + coCRLF +
           '   AND PR.CVE_PRODUCTO_CRE = CC.CVE_PRODUCTO_CRE '      + coCRLF +
           '   AND CS.ID_CESION(+)      = CR.ID_CREDITO'            + coCRLF +
           '   AND PROCAM.ID_CREDITO(+) = CR.ID_CREDITO'
           ;
   vlsql  := vlSql + coCRLF + ' ORDER BY CR.ID_CREDITO, PERIODO.F_PROG_PAGO ';
   Result := vlsql;
end;

function TCrCobPas.ValSolDispNaf: Boolean;
var SlqStr : String;
    sBGp    : String;
begin
  result := false;
  //
  SlqStr := 'SELECT DECODE( COUNT(CVE_PRODUCTO_CRE), 1, ''V'', ''F'' ) B_APLICA_GP '    + coCRLF +
            'FROM   CR_PRODUCTO_GTIA '                                                  + coCRLF +
            'WHERE  CVE_PRODUCTO_CRE = ' + SQLStr( Credito.ContratoCre.Producto.CVE_PRODUCTO_CRE.AsString ) + coCRLF +
            '  AND  CVE_GARANTIA     = ''GTPYME'' '                                     + coCRLF +
            '  AND  SIT_PRO_GARANTIA = ''AC'' ';
  GetSQLStr( SlqStr, Apli.DataBaseName, Apli.SessionName,  'B_APLICA_GP' , sBGp, False );
  if sBGp = 'V' then
  begin
    SlqStr := 'SELECT DECODE( COUNT(ID_CREDITO), 1, ''V'', ''F'' ) B_SOL_GP '    + coCRLF +
              'FROM   CR_GA_SOL_NAFIN'                                            + coCRLF +
              'WHERE  ID_CREDITO   = ' + Credito.ID_CREDITO.AsString              + coCRLF +
              '  AND  CVE_TIPO_LIQ = ''LD'' '                                     + coCRLF +
              '  AND  SIT_GA_SOL_NAFIN = ''AC'' ';
    GetSQLStr( SlqStr, Apli.DataBaseName, Apli.SessionName,  'B_SOL_GP' , sBGp, False );
    if sBGp = 'V' then
    begin
      result := true;
    end else
      ShowMessage('Es necesario que exista una solicitud de garantía PYME activa');  
    //ends_if_sBGp_=_'V'_then
  end else
    result := true;
  //ends_if_sBGp_=_'V'_then
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
//
// +---------------------------------------------------------------------------+
// +                 Agrega una linea en el Memo de la pantalla                +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.AddError(pMsgError : String);
Begin
  AddLine(MErrores, ' *** ' + pMsgError );
end;
// +---------------------------------------------------------------------------+
// +         Valida si existe un registro activo en la pantalla                +
// +---------------------------------------------------------------------------+
function TWCrCobPas.ExisteRegActivo : Boolean;
begin
  result := ( DataFound ); // and ( Objeto.INDICE_GRID.AsInteger > 0 );
end;
// +---------------------------------------------------------------------------+
// +                                                                           +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.FmtCurrEdit(Sender: TEdit);
begin
  if Assigned(Sender) then
    if not ( FormatFloat(coFmtCurrency, CurrFromFrmFloat(Sender.Text) ) = Sender.Text  ) then
    begin
      Sender.Text := FormatFloat(coFmtCurrency, CurrFromFrmFloat(Sender.Text));
    end;
end;
// +---------------------------------------------------------------------------+
// +                     LIMPIA EL REGISTRO CON LA INFORMACION                 +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.LimpiaRecord;
begin
  FillChar( vgInfoPer, sizeof(vgInfoPer), #0 );
  Objeto.INDICE_GRID.AsInteger   := 0;
  Objeto.COLUMNA_GRID.AsInteger  := 0;
  Objeto.CVE_ACCESORIO.AsString  := '';
  Objeto.TIPO_PARAM.AsInteger    := coNone;
  Objeto.ID_DOCUMENTO.AsString   := '';
  Objeto.NUM_PER_DOCTO.AsInteger := 0;
  Objeto.F_VENCIMIENTO.AsString  := '';
  Objeto.F_PROG_PAGO.AsString    := '';
  Objeto.F_VALOR_PAGO.AsString   := '';
  //
  Objeto.IMP_COMISION.AsString   := '';
  Objeto.IMP_INTERES.AsString    := '';
  Objeto.IMP_FIN_ADIC.AsString   := '';
  Objeto.IMP_CAPITAL.AsString    := '';
  Objeto.IMP_TOTAL.AsString      := '';
  //
  Objeto.B_COB_COMISION.AsString := '';
  Objeto.B_COB_INTERES.AsString  := '';
  Objeto.B_COB_FIN_ADIC.AsString := '';
  Objeto.B_COB_CAPITAL.AsString  := '';
  Objeto.B_COB_TOTAL.AsString    := '';
  //
end;
// +---------------------------------------------------------------------------+
// +      Despliega los valores del registro en los edits de la pantalla       +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.DrawControls;
begin
  //
  Objeto.F_VALOR_PAGO.DrawControl;
  //
  Objeto.IMP_COMISION.DrawControl;
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
end;
// +---------------------------------------------------------------------------+
// +                          Limpia la pantalla                               +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.LimpiaPantalla;
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
// +            Ejecuta el query y muestra los datos en pantalla               +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.MuestraDatos;
var Qry         : TQuery;
    nRowCount   : Integer;
    vlFHoy      : TDate;
    vlBCobraPer : Boolean;
begin
  if Searching then exit; // Valida que no exista una busqueda en curso ...
  Searching  := True;
  DataFound  := False;
  try
    LimpiaPantalla;
    InterForma1.ShowMsgPanel('');
    if ( Objeto.MDispFond.ID_CREDITO.AsString = '' ) then
    begin
      InterForma1.ShowMsgPanel(coNoFiltro);
      Searching := False;
      Exit;
    end;//ends_if
    //
    Qry    := GetSQLQueryNoNil( Objeto.BuildSQLString, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
    vlFHoy := Objeto.Apli.DameFechaEmpresa;
    nRowCount := 0;
    // ------------------------- Barre el QUERY de datos -------------------------
    if Assigned(Qry) then
    begin
      //try Qry.SQL.SaveToFile('c:\sql_cob_' + FormatDateTime( 'dd_mm_yyyy hh_ss_nn_zzz', Now ) + '.sql' ); except end;
      if not( Qry.IsEmpty ) then
      begin
        DataFound := True;
        while not Qry.Eof Do
        begin
          with sagDATOS do
          begin
            // Asigna los formatos de las celdas
            AlignCell[COL_ICAP, nRowCount] := alRight;
            AlignCell[COL_IFIN, nRowCount] := alRight;
            AlignCell[COL_IINT, nRowCount] := alRight;
            AlignCell[COL_ICOM, nRowCount] := alRight;
            AlignCell[COL_ITOT, nRowCount] := alRight;
            //
            vlBCobraPer := True;
            Cells[COL_SEL, nRowCount] := Objeto.BoolToStr( vlBCobraPer );
            Cells[COL_CRED,nRowCount] := Qry.FieldByName('ID_CREDITO').AsString;
            Cells[COL_DOCU,nRowCount] := Qry.FieldByName('ID_DOCUMENTO').AsString;
            Cells[COL_FVTO,nRowCount] := Qry.FieldByName('F_VENCIMIENTO').AsString;
            Cells[COL_FVAL,nRowCount] := DateToStr( vlFHoy );
            Cells[COL_ICAP,nRowCount] := Format(CFORMAT_DINERO,[ Qry.FieldByName('IMP_CAPITAL').AsFloat ]);
            Cells[COL_IFIN,nRowCount] := Format(CFORMAT_DINERO,[ Qry.FieldByName('IMP_FIN_ADIC').AsFloat ]);
            Cells[COL_IINT,nRowCount] := Format(CFORMAT_DINERO,[ Qry.FieldByName('IMP_INTERES').AsFloat ]);
            Cells[COL_ICOM,nRowCount] := Format(CFORMAT_DINERO,[ Qry.FieldByName('IMP_COMISION').AsFloat ]);
            Cells[COL_ITOT,nRowCount] := Format(CFORMAT_DINERO,[ ( Qry.FieldByName('TOTAL').AsFloat * WORD(vlBCobraPer) )] );
            Cells[COL_BCCO,nRowCount] := Objeto.BoolToStr( vlBCobraPer );
            Cells[COL_BCIN,nRowCount] := Objeto.BoolToStr( vlBCobraPer );
            Cells[COL_BCFA,nRowCount] := Objeto.BoolToStr( vlBCobraPer );
            Cells[COL_BCCA,nRowCount] := Objeto.BoolToStr( vlBCobraPer );
            //  Asigna el remanente
            Cells[COL_FPPA, nRowCount] := Qry.FieldByName('F_PROG_PAGO').AsString;
            Cells[COL_NPDO, nRowCount] := Qry.FieldByName('NUM_PERIODO_DOC').AsString;
          end; //end with
          inc(nRowCount);
          Qry.Next;
          if not Qry.Eof then  //Incrementa un reglon
             sagDATOS.RowCount := sagDATOS.RowCount + 1;
          //
          Application.ProcessMessages;
        end; //end While
        //
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
procedure TWCrCobPas.HabilitaChkBox( peHabilita : Boolean );
begin
  if peHabilita then                      // Habilita los eventos del checkbox
  begin
    cbConceptos.OnClick    := cbSeleccionClick;
    cbInteres.OnClick      := cbSeleccionClick;
    cbFinAdic.OnClick      := cbSeleccionClick;
    cbCapital.OnClick      := cbSeleccionClick;
    cbTotal.OnClick        := cbSeleccionClick;
    cbSeleccion.OnClick    := cbSeleccionClick;
  end else                                // Deshabilita los eventos del checkbox
  begin
    cbConceptos.OnClick    := nil;
    cbInteres.OnClick      := nil;
    cbFinAdic.OnClick      := nil;
    cbCapital.OnClick      := nil;
    cbTotal.OnClick        := nil;
    cbSeleccion.OnClick    := nil;
  end;
end;
// +---------------------------------------------------------------------------+
// +                   VALIDA SI ES DESCUENTO DE DOCUMENTOS                    +
// +---------------------------------------------------------------------------+
function TWCrCobPas.EsDescuento( peParam : String ): Boolean;
begin
  Result := ( peParam <> '' );
end;
// +---------------------------------------------------------------------------+
// +                   ASIGNA EL VALOR DE LA FECHA VALOR DE PAGO               +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.AsignaFVAlorPago( peFecha : TDateTime);
begin
  dtFECHA.DateTime := peFecha;
  vgInfoPer.F_VALOR_PAGO := peFecha;
  Objeto.F_VALOR_PAGO.AsDateTime := peFecha;
end;
// +---------------------------------------------------------------------------+
// +                   ASIGNA EL IMPORTE DE COMISION                           +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.AsignaImpComision(peMonto: Double);
begin
  vgInfoPer.IMP_COMISION := peMonto;
  Objeto.IMP_COMISION.AsFloat := peMonto;
end;
// +---------------------------------------------------------------------------+
// +                   ASIGNA EL IMPORTE DE INTERES                            +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.AsignaImpInteres(peMonto: Double);
begin
  vgInfoPer.IMP_INTERES := peMonto;
  Objeto.IMP_INTERES.AsFloat := peMonto;
end;
// +---------------------------------------------------------------------------+
// +               ASIGNA EL IMPORTE DE FINANCIAMIENTO ADICIONAL               +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.AsignaImpFinAdic(peMonto: Double);
begin
  vgInfoPer.IMP_FIN_ADIC := peMonto;
  Objeto.IMP_FIN_ADIC.AsFloat := peMonto;
end;
// +---------------------------------------------------------------------------+
// +                   ASIGNA EL IMPORTE DE CAPITAL                            +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.AsignaImpCapital(peMonto: Double);
begin
  vgInfoPer.IMP_CAPITAL := peMonto;
  Objeto.IMP_CAPITAL.AsFloat := peMonto;
end;
// +---------------------------------------------------------------------------+
// +              Evento que procesa el cambio en la fecha valor de pago       +
// +---------------------------------------------------------------------------+
Function TWCrCobPas.ValFechaOper( peBandera : Boolean ): Boolean;
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
// +        Actualiza los datos del GRID a la estructura de datos actual       +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.GetFromGrid( peRowGrid, peColGrid : Integer);
var  Accesorio : String;
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
  Objeto.ID_DOCUMENTO.AsString      := sagDATOS.Cells[ COL_DOCU, peRowGrid ];
  Objeto.NUM_PER_DOCTO.AsString     := sagDATOS.Cells[ COL_NPDO, peRowGrid ];
  Objeto.F_VENCIMIENTO.AsString     := sagDATOS.Cells[ COL_FVTO, peRowGrid ];
  Objeto.F_PROG_PAGO.AsString       := sagDATOS.Cells[ COL_FPPA, peRowGrid ];
  //
  HabilitaChkBox( False );      // Deshabilita los eventos de los check boxes para evitar que entre a los eventos
  // DE LA SECCION DE PARAMETROS
  Objeto.CVE_ACCESORIO.AsString     := Accesorio;                                  // Accesorio Activo
  //
  AsignaFVAlorPago  (StrToDate ( sagDATOS.Cells[ COL_FVAL,       peRowGrid ] ) );  // Asigna la fecha valor de pago
  //
  // DE LA SECCION DE IMPORTES
  AsignaImpComision( CurrFromFrmFloat( sagDATOS.Cells[ COL_ICOM, peRowGrid ] ) );  // Asigna el monto de comision
  AsignaImpInteres ( CurrFromFrmFloat( sagDATOS.Cells[ COL_IINT, peRowGrid ] ) );  // Asigna el monto de comision
  AsignaImpFinAdic ( CurrFromFrmFloat( sagDATOS.Cells[ COL_IFIN, peRowGrid ] ) );  // Asigna el monto de comision
  AsignaImpCapital ( CurrFromFrmFloat( sagDATOS.Cells[ COL_ICAP, peRowGrid ] ) );  // Asigna el monto de comision
  Objeto.IMP_TOTAL.AsString         := sagDATOS.Cells[ COL_ITOT, peRowGrid ];
  // NUMEROS DE PERIODO
  //
  Objeto.B_COB_COMISION.AsString    := sagDATOS.Cells[ COL_BCCO, peRowGrid ];
  Objeto.B_COB_INTERES.AsString     := sagDATOS.Cells[ COL_BCIN, peRowGrid ];
  Objeto.B_COB_FIN_ADIC.AsString    := sagDATOS.Cells[ COL_BCFA, peRowGrid ];
  Objeto.B_COB_CAPITAL.AsString     := sagDATOS.Cells[ COL_BCCA, peRowGrid ];
  Objeto.B_COB_TOTAL.AsString       := sagDATOS.Cells[ COL_SEL,  peRowGrid ];
  //
  //
  HabilitaChkBox( True );       // HABILITA NUEVAMENTE LOS EVENTOS DE LOS CHECK BOXES
  //
end;
// +---------------------------------------------------------------------------+
// +                       Regresa  los valores al GRID                        +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.UpdateToGrid;
var peRowGrid : Integer;
begin
  peRowGrid := Objeto.INDICE_GRID.AsInteger;
  // DE LA SECCION DE PARAMETROS
  sagDATOS.Cells[ COL_FVAL, peRowGrid ] := Objeto.F_VALOR_PAGO.AsString;
  //
  sagDATOS.Cells[ COL_ICOM, peRowGrid ] := Format( cFormat_Dinero,[ Objeto.IMP_COMISION.AsFloat  ] );
  sagDATOS.Cells[ COL_IINT, peRowGrid ] := Format( cFormat_Dinero,[ Objeto.IMP_INTERES.AsFloat   ] );
  sagDATOS.Cells[ COL_IFIN, peRowGrid ] := Format( cFormat_Dinero,[ Objeto.IMP_FIN_ADIC.AsFloat  ] );
  sagDATOS.Cells[ COL_ICAP, peRowGrid ] := Format( cFormat_Dinero,[ Objeto.IMP_CAPITAL.AsFloat   ] );
  sagDATOS.Cells[ COL_ITOT, peRowGrid ] := Format( cFormat_Dinero,[ Objeto.IMP_TOTAL.AsFloat     ] );
  //
  sagDATOS.Cells[ COL_BCCO, peRowGrid ] := Objeto.B_COB_COMISION.AsString;
  sagDATOS.Cells[ COL_BCIN, peRowGrid ] := Objeto.B_COB_INTERES.AsString;
  sagDATOS.Cells[ COL_BCFA, peRowGrid ] := Objeto.B_COB_FIN_ADIC.AsString;
  sagDATOS.Cells[ COL_BCCA, peRowGrid ] := Objeto.B_COB_CAPITAL.AsString;
  sagDATOS.Cells[ COL_SEL,  peRowGrid ] := Objeto.B_COB_TOTAL.AsString;
  //
end;
// +---------------------------------------------------------------------------+
// +    Obtiene los importes de capital, interes, conceptos y el monto moras   +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.ObtImportes;
  function _ObtPer( peIdDocumento : String; peNumPerDoc : Integer ): String;
  begin
    if EsDescuento( peIdDocumento ) then
      result := ' AND NUM_PERIODO = ' + IntToStr( peNumPerDoc )
    else
      result := '';
  end;
var  vlError            : String;
     vlImporte          : Double;
     vlIVA              : Double;
     vlMoras            : Double;
     vlIVAMoras         : Double;
     vlTotal            : Double;
     vlBObtImp          : Boolean;
     vlGMoras           : Double;
     vlGIVAMoras        : Double;
     vlGTotal           : Double;
     vlImpComis         : Double;
     vlImpMorCom        : Double;
     vlIVAMorCom        : Double;
     Qry                : TQuery;
     vlSqlPer           : String;
     vlSqlNumPer        : String;
begin
  // Valida si es Descuento de Documentos
  vlSqlNumPer := _ObtPer( Objeto.ID_DOCUMENTO.AsString, Objeto.NUM_PER_DOCTO.AsInteger );
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
    vlSqlPer :=
           'SELECT ID_CREDITO, '        + coCRLF +
           '       CVE_FND_ENT_DES, '   + coCRLF +
           '       CVE_FND_PROGRAMA, '  + coCRLF +
           '       NUM_PERIODO, '       + coCRLF +
           '       CVE_COMISION '       + coCRLF +
           'FROM   CR_FND_COMISION '    + coCRLF +
           'WHERE  ID_CREDITO = '       + Objeto.MDispFond.ID_CREDITO.AsString       + coCRLF +
           '  AND  CVE_FND_ENT_DES  = ' + Objeto.MDispFond.CVE_FND_ENT_DES.AsString  + coCRLF +
           '  AND  CVE_FND_PROGRAMA = ' + Objeto.MDispFond.CVE_FND_PROGRAMA.AsString + coCRLF +
           vlSqlNumPer                                                               + coCRLF +
           '  AND  F_VENCIMIENTO    = ' + SQLFecha( StrToDate( Objeto.F_VENCIMIENTO.AsString ) ) + coCRLF  +
           '  AND  F_PROG_PAGO      = ' + SQLFecha( StrToDate( Objeto.F_PROG_PAGO.AsString ) )   + coCRLF  +
           '  AND  '  + coSqlPerComPas;
    //
    Qry := GetSQLQueryNoNil( vlSqlPer, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
    //
    vlGMoras    := 0;       vlGIVAMoras := 0;       vlGTotal    := 0;
    //
    if Assigned(Qry) and not( Qry.IsEmpty ) then
    begin
      while not Qry.Eof do
      begin
        Objeto.StpObtAdeudo( Qry.FieldByName('ID_CREDITO').AsInteger,
                             Qry.FieldByName('CVE_FND_ENT_DES').AsString,
                             Qry.FieldByName('CVE_FND_PROGRAMA').AsString,
                             Qry.FieldByName('NUM_PERIODO').AsInteger,
                             Qry.FieldByName('CVE_COMISION').AsString,
                             Objeto.F_VALOR_PAGO.AsDateTime,  'RN',
                             vlImpComis,   vlImporte,    vlIVA,
                             vlImpMorCom,  vlIVAMorCom,  vlError
                           );
        vlGMoras    := vlGMoras    + vlMoras;
        vlGIVAMoras := vlGIVAMoras + vlIVAMoras;
        vlGTotal    := vlGTotal    + vlTotal;
        Qry.Next;
      end;//ends_while not Qry.Eof do
    end;
    //
    AsignaImpComision( vlGTotal );
  end;//ends_if
  // +-------------------------------------------------------------------------+
  // |                            INTERES                                      |
  // +-------------------------------------------------------------------------+
  vlBObtImp := ( ( Objeto.TIPO_PARAM.AsInteger   = coFecha    ) or
                 ( Objeto.CVE_ACCESORIO.AsString = coTodos    ) or
                 ( Objeto.CVE_ACCESORIO.AsString = coInteres  ) );
  if vlBObtImp then
  begin
    //
    vlSqlPer :=
           'SELECT ID_CREDITO, '        + coCRLF +
           '       CVE_FND_ENT_DES, '   + coCRLF +
           '       CVE_FND_PROGRAMA, '  + coCRLF +
           '       NUM_PERIODO '        + coCRLF +
           'FROM   CR_FND_INTERES '     + coCRLF +
           'WHERE  ID_CREDITO = '       + Objeto.MDispFond.ID_CREDITO.AsString       + coCRLF +
           '  AND  CVE_FND_ENT_DES  = ' + Objeto.MDispFond.CVE_FND_ENT_DES.AsString  + coCRLF +
           '  AND  CVE_FND_PROGRAMA = ' + Objeto.MDispFond.CVE_FND_PROGRAMA.AsString + coCRLF +
           vlSqlNumPer                                                               + coCRLF +
           '  AND  F_VENCIMIENTO    = ' + SQLFecha( StrToDate( Objeto.F_VENCIMIENTO.AsString ) ) + coCRLF +
           '  AND  F_PROG_PAGO      = ' + SQLFecha( StrToDate( Objeto.F_PROG_PAGO.AsString ) )   + coCRLF +
           '  AND  '  + coSqlPerIntPas;
    //
    Qry := GetSQLQueryNoNil( vlSqlPer, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
    //
    vlGMoras    := 0;     vlGIVAMoras := 0;     vlGTotal    := 0;
    //
    if Assigned(Qry) and (Qry.IsEmpty = False ) then
    begin
      Qry.First;
      while not Qry.eof do
      begin
        // Obtiene los importes de interes
        Objeto.StpObtAdeudo( Qry.FieldByName('ID_CREDITO').AsInteger,
                             Qry.FieldByName('CVE_FND_ENT_DES').AsString,
                             Qry.FieldByName('CVE_FND_PROGRAMA').AsString,
                             Qry.FieldByName('NUM_PERIODO').AsInteger,
                             '',      Objeto.F_VALOR_PAGO.AsDateTime,
                             'RI',    vlTotal,     vlImporte, vlIVA,
                             vlMoras, vlIVAMoras,  vlError );
        vlGMoras    := vlGMoras    + vlMoras;
        vlGIVAMoras := vlGIVAMoras + vlIVAMoras;
        vlGTotal    := vlGTotal    + vlTotal;
        Qry.Next;
      end;
      Qry.Close;
      Qry.Free;
    end;
    AsignaImpInteres( vlGTotal );
  end;
  // +-------------------------------------------------------------------------+
  // |                        FINANCIAMIENTO ADICIONAL                         |
  // +-------------------------------------------------------------------------+
  vlBObtImp := ( ( Objeto.TIPO_PARAM.AsInteger    = coFecha    ) or
                 ( Objeto.CVE_ACCESORIO.AsString  = coTodos    ) or
                 ( Objeto.CVE_ACCESORIO.AsString  = coFinAdic  ) );
  if vlBObtImp then
  begin
    vlSqlPer :=
           'SELECT ID_CREDITO, '        + coCRLF +
           '       CVE_FND_ENT_DES, '   + coCRLF +
           '       CVE_FND_PROGRAMA, '  + coCRLF +
           '       NUM_PERIODO '        + coCRLF +
           'FROM   CR_FND_FIN_ADIC '    + coCRLF +
           'WHERE  ID_CREDITO = '       + Objeto.MDispFond.ID_CREDITO.AsString       + coCRLF  +
           '  AND  CVE_FND_ENT_DES  = ' + Objeto.MDispFond.CVE_FND_ENT_DES.AsString  + coCRLF  +
           '  AND  CVE_FND_PROGRAMA = ' + Objeto.MDispFond.CVE_FND_PROGRAMA.AsString + coCRLF  +
           vlSqlNumPer                                                               + coCRLF  +
           '  AND  F_VENCIMIENTO    = ' + SQLFecha( StrToDate( Objeto.F_VENCIMIENTO.AsString ) ) + coCRLF  +
           '  AND  F_PROG_PAGO      = ' + SQLFecha( StrToDate( Objeto.F_PROG_PAGO.AsString ) )   + coCRLF  +
           '  AND  '  + coSqlPerFinPas;
    //
    Qry := GetSQLQueryNoNil( vlSqlPer, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
    //
    vlGMoras    := 0;     vlGIVAMoras := 0;     vlGTotal    := 0;
    //
    if Assigned(Qry) and (Qry.IsEmpty = False ) then
    begin
      Qry.First;
      while not Qry.eof do
      begin
        // Obtiene los importes de financiamiento adicional
        Objeto.StpObtAdeudo( Qry.FieldByName('ID_CREDITO').AsInteger,
                             Qry.FieldByName('CVE_FND_ENT_DES').AsString,
                             Qry.FieldByName('CVE_FND_PROGRAMA').AsString,
                             Qry.FieldByName('NUM_PERIODO').AsInteger,
                             '',      Objeto.F_VALOR_PAGO.AsDateTime,
                             'RF',    vlTotal,    vlImporte,  vlIVA,
                             vlMoras, vlIVAMoras, vlError );
        //
        vlGMoras    := vlGMoras    + vlMoras;
        vlGIVAMoras := vlGIVAMoras + vlIVAMoras;
        vlGTotal    := vlGTotal    + vlTotal;
        Qry.Next;
      end;
      Qry.Close;
      Qry.Free;
    end;
    AsignaImpFinAdic( vlGTotal );
  end;//ends_if
  // +-------------------------------------------------------------------------+
  // |                            CAPITAL                                      |
  // +-------------------------------------------------------------------------+
  vlBObtImp := ( ( Objeto.TIPO_PARAM.AsInteger   = coFecha    ) or
                 ( Objeto.CVE_ACCESORIO.AsString = coTodos    ) or
                 ( Objeto.CVE_ACCESORIO.AsString = coCapital  ) );
  if vlBObtImp then
  begin
    vlSqlPer :=
           'SELECT ID_CREDITO, '        + coCRLF +
           '       CVE_FND_ENT_DES, '   + coCRLF +
           '       CVE_FND_PROGRAMA, '  + coCRLF +
           '       NUM_PERIODO '        + coCRLF +
           'FROM   CR_FND_CAPITAL '     + coCRLF +
           'WHERE  ID_CREDITO = '       + Objeto.MDispFond.ID_CREDITO.AsString       + coCRLF  +
           '  AND  CVE_FND_ENT_DES  = ' + Objeto.MDispFond.CVE_FND_ENT_DES.AsString  + coCRLF  +
           '  AND  CVE_FND_PROGRAMA = ' + Objeto.MDispFond.CVE_FND_PROGRAMA.AsString + coCRLF  +
           vlSqlNumPer                                                               + coCRLF  +
           '  AND  F_VENCIMIENTO    = ' + SQLFecha( StrToDate( Objeto.F_VENCIMIENTO.AsString ) ) + coCRLF  +
           '  AND  F_PROG_PAGO      = ' + SQLFecha( StrToDate( Objeto.F_PROG_PAGO.AsString ) )   + coCRLF  +
           '  AND  '  + coSqlPerCapPas;
    //
    Qry := GetSQLQueryNoNil( vlSqlPer, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
    //
    vlGMoras    := 0;    vlGIVAMoras := 0;    vlGTotal    := 0;
    //
    // Obtiene los importes de capital
    //
    if Assigned(Qry) and (Qry.IsEmpty = False ) then
    begin
      Qry.First;
      while not Qry.eof do
      begin
        Objeto.StpObtAdeudo( Qry.FieldByName('ID_CREDITO').AsInteger,
                             Qry.FieldByName('CVE_FND_ENT_DES').AsString,
                             Qry.FieldByName('CVE_FND_PROGRAMA').AsString,
                             Qry.FieldByName('NUM_PERIODO').AsInteger,
                             '',  Objeto.F_VALOR_PAGO.AsDateTime, 'RK',
                             vlTotal,    vlImporte,   vlIVA,
                             vlMoras,    vlIVAMoras,  vlError );
        //
        vlGMoras    := vlGMoras    + vlMoras;
        vlGIVAMoras := vlGIVAMoras + vlIVAMoras;
        vlGTotal    := vlGTotal    + vlTotal;
        Qry.Next;
      end;
      Qry.Close;
      Qry.Free;
    end;
    AsignaImpCapital( vlGTotal );
  end;//ends_if
End;
// +---------------------------------------------------------------------------+
// +                      Suma los importes de este pago                       +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.SumaImportes;
  Function FunObtFactor( peBandera : String ): Double;
  begin
    result := 0;
    if peBandera = 'V' then result := 1;
  end;
begin
  with Objeto do
  begin
    //
    IMP_TOTAL.AsFloat := IMP_COMISION.AsFloat * FunObtFactor( B_COB_COMISION.AsString ) +
                         IMP_INTERES.AsFloat  * FunObtFactor( B_COB_INTERES.AsString  ) +
                         IMP_FIN_ADIC.AsFloat * FunObtFactor( B_COB_FIN_ADIC.AsString ) +
                         IMP_CAPITAL.AsFloat  * FunObtFactor( B_COB_CAPITAL.AsString  );
  end;
end;
// +---------------------------------------------------------------------------+
// +    Realiza los calculos derivados de el cambio de valor de un parametro   +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.CalculaCobranza;
begin
  // OBTIENE LOS IMPORTES DE COMISION, INTERES Y CAPITAL DE MANERA GLOBAL
  ObtImportes;
  // CALCULA EL TOTAL DEL PAGO
  SumaImportes;
end;
// +---------------------------------------------------------------------------+
// +    A partir de una cadena determina si despliega un mensaje de error      +
// +---------------------------------------------------------------------------+
Function TWCrCobPas.ValidaError( pMsgError : String): Boolean;
begin
  Result := False;
  if pMsgError <> '' then
  begin
    Objeto.MuestraError( pMsgError );
    AddError( pMsgError );
    Result := True;
  end;
end;
{
// +---------------------------------------------------------------------------+
// +                     Obtiene los valores de la pantalla                    +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.GetFromControls;
begin
  // DE LA SECCION DE PARAMETROS
  Objeto.F_VALOR_PAGO.GetFromControl;
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
}
{
// +---------------------------------------------------------------------------+
// +    Realiza las modificaciones derivadas de un cambio en algun parametro   +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.ProcesaCambio;
begin
  GetFromControls;  // Salva la información de la pantalla al registro actual
  CalculaCobranza;  // Hace el calculo de los importes
  UpdateToGrid;     // Regresa los valores al GRID.
  GetFromGrid( Objeto.INDICE_GRID.AsInteger, Objeto.COLUMNA_GRID.AsInteger );
  DrawControls;     // Regresa los valores a la pantalla
end;
}
//
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
//
//
// +---------------------------------------------------------------------------+
// +                       Evento OnShow de la forma                           +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.FormShow(Sender: TObject);
begin
  Searching := True;
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
  //
  Objeto.MDispFond.ParamCre  := Objeto.ParamCre;
  Objeto.Credito.ParamCre    := Objeto.ParamCre;
  //
  Objeto.MDispFond.ID_CREDITO.Control       := edID_CREDITO_PAS;
  Objeto.MDispFond.CVE_FND_ENT_DES.Control  := edCVE_FND_ENT_DES;
  Objeto.MDispFond.CVE_FND_PROGRAMA.Control := edCVE_FND_PROGRAMA;
  //
  Objeto.MDispFond.MInstDesc.DESC_ENT_DES.Control        := edNOM_FND_ENT_DES;
  Objeto.MDispFond.MPrgApoyo.DESC_PROGRAMA.Control       := edNOM_FND_PROGRAMA;
  Objeto.Credito.ContratoCre.Contrato.TITNombre.Control  := edNOM_ACREDITADO;
  //
  Objeto.Credito.ContratoCre.ID_CONTRATO.Control         := edID_CONTRATO_PAS;
  Objeto.Credito.ContratoCre.Moneda.Desc_Moneda.Control  := edDESC_MONEDA_PAS;
  Objeto.MDispFond.IMP_REDESCONTADO.Control := edIMP_REDESCONTADO_PAS;
  Objeto.MDispFond.SDO_VIG_TOTAL.Control    := edSDO_VIG_TOTAL_PAS;
  Objeto.MDispFond.PCT_REDESCONTADO.Control := edPCT_REDESCONTADO_PAS;
  Objeto.MDispFond.F_INICIO.Control         := edF_INICIO_PAS;
  Objeto.MDispFond.DIAS_PLAZO.Control       := edDIAS_PLAZO_PAS;
  Objeto.MDispFond.F_VENCIMIENTO.Control    := edF_VENCIMIENTO_PAS;
  Objeto.Credito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edDESC_C_PRODUCTO_PAS;
  //
  //Informacion de la seccion de parametros
  Objeto.F_VALOR_PAGO.Control   := edFECHA;
  //Informacion de la seccion de importes
  Objeto.IMP_COMISION.Control   := edCONCEPTOS;
  Objeto.IMP_INTERES.Control    := edINTERES;
  Objeto.IMP_FIN_ADIC.Control   := edFinAdic;
  Objeto.IMP_CAPITAL.Control    := edCAPITAL;
  Objeto.IMP_TOTAL.Control      := edTOTAL;
  //
  Objeto.B_COB_COMISION.Control := cbConceptos;
  Objeto.B_COB_INTERES.Control  := cbInteres;
  Objeto.B_COB_FIN_ADIC.Control := cbFinAdic;
  Objeto.B_COB_CAPITAL.Control  := cbCapital;
  Objeto.B_COB_TOTAL.Control    := cbTotal;
  //
  Objeto.ID_DOCUMENTO.Control   := lbDocto;
  //
  // Muestra la información inicial en la pantalla
  Searching := False;
  //
  InterForma1.MsgPanel := pnlMsgs;
  LimpiaPantalla;
end;
// +---------------------------------------------------------------------------+
// +                   Evento OnClose de la forma                              +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
// +---------------------------------------------------------------------------+
// +                   Evento OnDestroy de la forma                            +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.FormDestroy(Sender: TObject);
begin
  //
  //
  Objeto.MDispFond.ID_CREDITO.Control       := nil;
  Objeto.MDispFond.CVE_FND_ENT_DES.Control  := nil;
  Objeto.MDispFond.CVE_FND_PROGRAMA.Control := nil;
  //
  Objeto.MDispFond.MInstDesc.DESC_ENT_DES.Control        := nil;
  Objeto.MDispFond.MPrgApoyo.DESC_PROGRAMA.Control       := nil;
  Objeto.Credito.ContratoCre.Contrato.TITNombre.Control  := nil;
  //
  Objeto.Credito.ContratoCre.ID_CONTRATO.Control         := nil;
  Objeto.Credito.ContratoCre.Moneda.Desc_Moneda.Control  := nil;
  Objeto.MDispFond.IMP_REDESCONTADO.Control := nil;
  Objeto.MDispFond.SDO_VIG_TOTAL.Control    := nil;
  Objeto.MDispFond.PCT_REDESCONTADO.Control := nil;
  Objeto.MDispFond.F_INICIO.Control         := nil;
  Objeto.MDispFond.DIAS_PLAZO.Control       := nil;
  Objeto.MDispFond.F_VENCIMIENTO.Control    := nil;
  Objeto.Credito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := nil;
  //
  //Informacion de la seccion de parametros
  Objeto.F_VALOR_PAGO.Control   := nil;
  //Informacion de la seccion de importes
  Objeto.IMP_COMISION.Control   := nil;
  Objeto.IMP_INTERES.Control    := nil;
  Objeto.IMP_FIN_ADIC.Control   := nil;
  Objeto.IMP_CAPITAL.Control    := nil;
  Objeto.IMP_TOTAL.Control      := nil;
  //
  Objeto.B_COB_COMISION.Control := nil;
  Objeto.B_COB_INTERES.Control  := nil;
  Objeto.B_COB_FIN_ADIC.Control := nil;
  Objeto.B_COB_CAPITAL.Control  := nil;
  Objeto.B_COB_TOTAL.Control    := nil;


  Objeto.ID_DOCUMENTO.Control   := nil;
end;
// +---------------------------------------------------------------------------+
// +                 Evento DrawCell del Grid de Datos                         +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.sagDATOSDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
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
procedure TWCrCobPas.sagDATOSMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var ACol  : Integer;
    ARow  : Integer;
begin
  if ExisteRegActivo then
  begin
    sagDATOS.MouseToCell(X, Y ,ACol, ARow);
    //SELECCIONA LA COBRANZA DE LOS CONCEPTOS
    If (  ACol = COL_SEL  ) Then //  selecciona la cobranza de los conceptos
    begin
      cbTotal.Checked := not cbTotal.Checked;
    end;
  end;
end;
// +---------------------------------------------------------------------------+
// +               Evento DrawCell del Grid de Datos (automatico)              +
// +   Cambia la información en pantalla de acuerdo a la seleccion del usuario +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.sagDATOSSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if DataFound then
  begin
    GetFromGrid( ARow, ACol );
    DrawControls;
  end;//ends_if
end;
// +---------------------------------------------------------------------------+
// +                   Da Formato de Saldo a los Edits                         +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.edIMPORTE_TEXTChange(Sender: TObject);
begin
  if Sender is TEdit then
    FmtCurrEdit(Sender as TEdit);
end;
// +---------------------------------------------------------------------------+
// +                Evento que llama a la clase de lineas                      +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.btID_CONTRATOClick(Sender: TObject);
begin
  if Objeto.Credito.ContratoCre.ID_CONTRATO.AsString <> '' then
  Begin
    Objeto.CrContrato.FindKey([Objeto.Credito.ContratoCre.ID_CONTRATO.AsInteger,
                               Objeto.Credito.ContratoCre.FOL_CONTRATO.AsInteger ]);
    Objeto.CrContrato.Acreditado.FindKey([Objeto.CrContrato.Contrato.ID_Titular.AsString]);
    Objeto.CrContrato.Catalogo;
  End;
end;
// +---------------------------------------------------------------------------+
// +                Evento que llama a la clase de disposicion                 +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.btDISPOCISIONClick(Sender: TObject);
begin
  if Objeto.Credito.ID_CREDITO.AsString <> '' then
  Begin
    Objeto.Credito.Catalogo;
  end;
end;
// +---------------------------------------------------------------------------+
// +                   Evento que llama a la clase de producto                 +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.btPRODUCTOClick(Sender: TObject);
begin
  if Objeto.Credito.ContratoCre.CVE_PRODUCTO_CRE.AsString <> '' then
  Begin
    Objeto.Producto.FindKey([ Objeto.Credito.ContratoCre.CVE_PRODUCTO_CRE.AsString ]);
    Objeto.Producto.Catalogo;
  end;
end;
// +---------------------------------------------------------------------------+
// +                Evento onClic del check box cbSeleccion                    +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.cbSeleccionClick(Sender: TObject);
var vlRow     : Integer;
    vlCurrRow : Integer;
    vlCurrCol : Integer;
    vlCobra   : String;
begin
  if DataFound then
  begin
    vlCurrRow := Objeto.INDICE_GRID.AsInteger;             // Respalda el indice del registro actual
    vlCurrCol := Objeto.COLUMNA_GRID.AsInteger;            // Respalda el indice de la columna actual
    vlCobra   := Objeto.BoolToStr( False );                // Determina si marca o desmarca los registros
    if Sender is TCheckBox then
      vlCobra := Objeto.BoolToStr( (Sender as TCheckBox).Checked );
    //
    for vlRow := 0 to ( sagDATOS.RowCount - 1 ) do         // Procesa todos los registros
    begin
      GetFromGrid( vlRow, 0 );
      HabilitaChkBox( False ); // Deshabilita los eventos
      //
      Objeto.B_COB_COMISION.AsString := vlCobra;
      Objeto.B_COB_INTERES.AsString  := vlCobra;
      Objeto.B_COB_FIN_ADIC.AsString := vlCobra;
      Objeto.B_COB_CAPITAL.AsString  := vlCobra;
      Objeto.B_COB_TOTAL.AsString    := vlCobra;
      //
      HabilitaChkBox( True ); // Habilita los eventos
      UpdateToGrid;
    end;
    if ExisteRegActivo then
    begin
      GetFromGrid( vlCurrRow, vlCurrCol );   // Obtiene la informacion del registro seleccionado
      DrawControls;                          // Lo dibuja en pantalla
    end;//ends_if
    //
  end;
end;
// +---------------------------------------------------------------------------+
// +                Evento onDblClick del memo de mensajes                     +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.MErroresDblClick(Sender: TObject);
begin
  MErrores.Lines.Clear;
end;
// +---------------------------------------------------------------------------+
// +                Evento onClic del boton de Disposición                     +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.btID_CREDITO_PASClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOBPAS_DISPO',True,True) then
   begin
      if Objeto.MDispFond.Busca then
      begin
        Objeto.Credito.FindKey([ Objeto.MDispFond.ID_CREDITO.AsString ]);
        MuestraDatos;
      end;
   end;
end;
// +---------------------------------------------------------------------------+
// +             Evento onEjecuta del InterLinkIt de Disposición               +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.ilID_CREDITO_PASEjecuta(Sender: TObject);
begin
  if Objeto.MDispFond.FindKeyNear( [ ilID_CREDITO_PAS.Buffer, 'AC' ] ,
                                   [ 'ID_CREDITO',  'SIT_CREDITO'  ]  ) then
  begin
    Objeto.Credito.FindKey([ Objeto.MDispFond.ID_CREDITO.AsString ]);
    MuestraDatos;
  end;
  //
end;
// +---------------------------------------------------------------------------+
// +                Evento onClic del boton de búsqueda                        +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.btBUSCAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOBPAS_BUSCA',True,True) then
      MuestraDatos;
end;
// +---------------------------------------------------------------------------+
// +                   Evento onEnter del Edit edFecha                         +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.edFECHAEnter(Sender: TObject);
begin
  if ExisteRegActivo then
    Objeto.TIPO_PARAM.AsInteger := coFecha;
end;
// +---------------------------------------------------------------------------+
// +                   Evento onExit del EditFecha                             +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.edFECHAExit(Sender: TObject);
begin
  if ValFechaOper(False) then
     btFECHAClick(Sender); // Procesa la modificacion a la fecha de pago para todos los períodos
     //ProcesaCambio;
  //ends_if
end;
// +---------------------------------------------------------------------------+
// +                   Evento onKeyPress  del EditFecha                        +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.edFECHAKeyPress(Sender: TObject; var Key: Char);
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
procedure TWCrCobPas.dtFECHAExit(Sender: TObject);
begin
  edFECHAExit( edFECHA ); // Procesa una posible modificacion a la fecha  de pago
end;
// +---------------------------------------------------------------------------+
// +                   Evento onClic del botón btFECHAClick                    +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.btFECHAClick(Sender: TObject);
var vlRow      : Integer;
    vlCurrRow  : Integer;
    vlCurrCol  : Integer;
    vlFecha    : TDate;
begin
   if Objeto.ValidaAccesoEsp('TCRCOBPAS_FECHA',True,True) then
   begin
      if ExisteRegActivo then
      begin
          vlCurrRow := Objeto.INDICE_GRID.AsInteger;      // Respalda el indice del registro actual
          vlCurrCol := Objeto.COLUMNA_GRID.AsInteger;     // Respalda el indice de la columna actual
          vlFecha   := Objeto.F_VALOR_PAGO.AsDateTime;    // Obtiene la fecha indicada por el usuario
          for vlRow := 0 to ( sagDATOS.RowCount - 1 ) do  // Procesa todos los registros
          begin
            GetFromGrid( vlRow, 0 );
            Objeto.F_VALOR_PAGO.AsDateTime := vlFecha;
            CalculaCobranza;
            UpdateToGrid;
          end;
          GetFromGrid( vlCurrRow, vlCurrCol );            // Obtiene la informacion del registro seleccionado
          DrawControls;                                   // Lo dibuja en pantalla
      end;//ends_if
   end;
end;
// +---------------------------------------------------------------------------+
// +                Evento onClic del boton de cobranza                        +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.btnCobraClick(Sender: TObject);
var vlError      : String;
    vlIndex      : Integer;
    vlCnt        : Integer;
    vlResult     : Integer;
    vlTxResult   : String;
    vlsql        : string;
    vlDia        : Integer;
    vlDias       : Integer;
    vlDiaInicial : TDateTime;
begin
   if Objeto.ValidaAccesoEsp('TCRCOBPAS_COBRA',True,True) then
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
      if not Objeto.ValSolDispNaf then
        exit;
      //end_if
      if Objeto.F_VALOR_PAGO.AsString = '' then
        GetFromGrid( 0, 0 );
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
      Objeto.LimpiaTablaCob(vlError);   // Limpia la tabla de configuración para el cobro de comisiones
      ValidaError( vlError );           // Valida el resultado del procedimiento anterior
      Objeto.StpCobranza(vlError);
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
      // Actualiza la pantalla
      MuestraDatos;
   end;
end;
// +---------------------------------------------------------------------------+
// +                Evento onClic del boton sbLogCobranza                      +
// +---------------------------------------------------------------------------+
procedure TWCrCobPas.sbLogCobranzaClick(Sender: TObject);
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



procedure TWCrCobPas.btCONCEPTOSClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOBPAS_CONC',True,True) then
   begin
       //
   end;
end;

procedure TWCrCobPas.btINTERESClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOBPAS_INT',True,True) then
   begin
       //
   end;
end;

procedure TWCrCobPas.btFinAdicClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOBPAS_FINAD',True,True) then
   begin
       //
   end;
end;

procedure TWCrCobPas.btCAPITALClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCOBPAS_CAP',True,True) then
   begin
       //
   end;
end;

End.


