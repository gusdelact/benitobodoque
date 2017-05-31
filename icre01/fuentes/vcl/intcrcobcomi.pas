// Sistema         : Clase de CR_COB_COMIS
// Fecha de Inicio : 31/07/2004
// Función forma   : Clase de CR_COB_COMIS
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrCobComi;

interface

uses
Windows,  Messages, SysUtils, Classes,  Graphics, Controls,  Forms,     Dialogs,
IntFrm,   DB,       DbTables, Mask,     StdCtrls, Buttons,   ExtCtrls,  InterFor,
IntFind,  UnSQL2,   InterFun, ComCtrls, IntDtPk,  IntLinkit, InterEdit, Grids,
Aligrid,  ImgList,

IntParamCre,   // Unidad de paramétros del Panel
IntCrCobConst, // Unidad genérica de funciones y constantes de cobranza
IntGenCre      // Unidad genérica de funciones y constantes
;

type
  //
  TCrComis = class
    id_credito     : Integer;
    num_periodo    : Integer;
    cve_comision   : String;
    f_vencimiento  : TDate;
    f_prog_pago    : TDate;
    //
    b_comision     : String;
    imp_pago_con   : Double;
    fact_moras_cn  : Double;
    monto_moras    : Double;
    b_iva_mora_cn  : String;
    b_cond_mora_cn : String;
    b_mod_imp_com  : String;
    //
    item_index     : Integer;
  end;
  //
  TCrCobComi   = class;
  //
  TWCrCobComis = class(TForm)
    InterForma1             : TInterForma;
    lbID_CREDITO: TLabel;
    edID_CREDITO: TEdit;
    edNombre: TEdit;
    btnId_Credito: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    pnColumnas: TPanel;
    edTitDocto: TEdit;
    edTitSEL: TEdit;
    edTitDisp: TEdit;
    edTitTotal: TEdit;
    sagDATOS: TStringAlignGrid;
    ImageList: TImageList;
    lbTotal: TLabel;
    rgParametros: TGroupBox;
    lbFacMora: TLabel;
    lbMontoMora: TLabel;
    btFACT_MORAS: TSpeedButton;
    lbIVAMor: TLabel;
    lbCondMora: TLabel;
    edMONTO_MORAS: TInterEdit;
    cbB_COND_MORAS: TCheckBox;
    cbB_IVA_MORA: TCheckBox;
    edFAC_MORAS: TInterEdit;
    grbxFechas: TGroupBox;
    lbF_VENCIMIENTO: TLabel;
    lbF_PROG_PAGO: TLabel;
    edF_VENCIMIENTO: TEdit;
    edF_PROG_PAGO: TEdit;
    InterDateTimePicker2: TInterDateTimePicker;
    InterDateTimePicker3: TInterDateTimePicker;
    Label1: TLabel;
    edF_VALOR_PAGO: TEdit;
    InterDateTimePicker4: TInterDateTimePicker;
    Edit2: TEdit;
    edIMP_COMISION: TInterEdit;
    Label2: TLabel;
    edIMP_PAGO_CN: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure sagDATOSDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure sagDATOSMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sagDATOSSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure edFAC_MORASEnter(Sender: TObject);
    procedure edFAC_MORASExit(Sender: TObject);
    procedure edFAC_MORASKeyPress(Sender: TObject; var Key: Char);
    procedure edMONTO_MORASEnter(Sender: TObject);
    procedure edMONTO_MORASExit(Sender: TObject);
    procedure edMONTO_MORASKeyPress(Sender: TObject; var Key: Char);
    procedure cbB_IVA_MORAClick(Sender: TObject);
    procedure cbB_COND_MORASClick(Sender: TObject);
    procedure edIMP_PAGO_CNEnter(Sender: TObject);
    procedure edIMP_PAGO_CNExit(Sender: TObject);
    procedure edIMP_PAGO_CNKeyPress(Sender: TObject; var Key: Char);
  private
    fDataFound     : Boolean;
    vgFACT_MORAS   : Double;
    vgMONTO_MORAS  : Double;
    vgIMP_PAGO_CON : Double;
  private
    procedure    LimpiaRecord;
    procedure    LimpiaPantalla;
    procedure    MuestraDatos;
    procedure    CalculaCobranza;
    procedure    DrawControls;
    procedure    GetFromControls;
    procedure    UpdateToGrid;
    procedure    ProcesaFacMoras;
    procedure    GetFromGrid( peRowGrid, peColGrid : Integer);
    procedure    ProcesaCambio( peBObtAdeudo : Boolean );
  private
    function     ExisteRegActivo      : Boolean;
    function     OBTEN_IMP_COMISION   : Double;
    function     OBTEN_B_COB_COMISION : String;
  public
    Objeto     : TCrCobComi;
  end;
  //
  TCrCobComi= class(TInterFrame)
  private
  protected
  private
    function    StrToBool( peValor : String ): Boolean;
    function    BoolToStr( peValor : Boolean ) : String;
  private
    procedure   ObtenComisInfo( IdCredito, NumPeriodo : Integer; CveComis : String;
                                var psCrComis : TCrComis; var psBExiste   : Boolean;
                                var psError : String );
    procedure   StpObtAdeudo( peIdCredito  : Integer; peNumPeriodo: Integer;
                              peCveComision: String;  pFCalculo : TDate;
                              pFactor      : Double;  pBIVA     : String;
                              pCveAccesorio: String;  var vlTotal,
                              vlImporte, vlIVA, vlBenBco,  vlBenGob, vlMoras,
                              vlIVAMoras : Double; var  vlError : String );
  private
    function   StpObtFacMora(peIdCredito, peNumPeriodo: Integer; peBAplic : String;
                  peMonto : Double; peFPago: TDate; var psFacMoras: Double):Boolean;
  public
    LCrComis                 : TList;
  public
    ID_CREDITO               : TInterCampo;
    NOMBRE_ACREDITADO        : TInterCampo;
    F_VENCIMIENTO            : TInterCampo;
    F_PROG_PAGO              : TInterCampo;
    F_VALOR_PAGO             : TInterCampo;
    COBRANZA                 : TInterCampo;
    //
    DEF_B_COMISION           : TInterCampo;
    DEF_FAC_MORAS_CO         : TInterCampo;
    DEF_B_IVA_MORA_CO        : TInterCampo;
    DEF_B_COND_MORA_CO       : TInterCampo;
    //
    INDICE_GRID              : TInterCampo;
    B_COMISION               : TInterCampo;
    NUM_PERIODO              : TInterCampo;
    CVE_COMISION             : TInterCampo;
    FACT_MORAS               : TInterCampo;
    MONTO_MORAS              : TInterCampo;
    B_IVA_MORAS              : TInterCampo;
    B_COND_MORAS             : TInterCampo;
    IMP_PAGO_CON             : TInterCampo;
    IMP_COMISION             : TInterCampo;
    IMP_COM_TOT              : TInterCampo;
    B_MOD_IMP_COM            : TInterCampo;
    ITEM_INDEX               : TInterCampo;
    B_COB_COMISION           : TInterCampo;
    //
    ParamCre                 : TParamCre;
    function       InternalBusca  : Boolean; override;
    constructor    Create( AOwner : TComponent ); override;
    destructor     Destroy; override;
    function       ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;

const
   coObtFacMora  = '¿Deseas calcular el factor de moras a partir de la cantidad de %m?.';
   COL_SEL  = 0;   // Aplica cobro
   COL_NPCO = 1;   // Periodo
   COL_CVEC = 2;   // Clave
   COL_DESC = 3;   // Descripción
   COL_ITOT = 4;   // Comision + IVA
   COL_VIS  = COL_ITOT;  // Valor de la ultima columna visible en el Grid
   COL_BMCO = 5;   // Indica si el usuario modifico el importe de comision
   COL_FMCO = 6;   // Factor de moras de comision
   COL_MMCO = 7;   // Moratorios de comisión
   COL_BIVC = 8;   // Aplica IVA de moras de comision
   COL_CMCO = 9;   // Condona moratorios de comision
   COL_IIDX = 10;  // Item Index


//
function    BuildSQLStrCom( peCobranza : String; peIdCredito : Integer;
                            peFVentto  : TDate;  peFProgPg   : TDate ) : String;
//

implementation
{$R *.DFM}

function    BuildSQLStrCom( peCobranza : String; peIdCredito : Integer;
                            peFVentto  : TDate;  peFProgPg   : TDate ) : String;
var vlsql        : String;
    vlBuscaCon   : String;
Begin
  // Impagado
  if peCobranza = cImpagado then
  begin
    vlBuscaCon := '   AND CO.SIT_COMISION  = ''IM'' ';
  end
  // Programado
  else if peCobranza = cProgramado then
  begin
    vlBuscaCon := '   AND CO.SIT_COMISION= ''AC'' ';
  end
  // Anticipado
  else if peCobranza = cAnticipado then
  begin
    vlBuscaCon := '   AND  CO.SIT_COMISION NOT IN( ''LQ'', ''CA'' )';
   end;
   // Arma la sentencia SQL.
   vlsql :=' SELECT CO.ID_CREDITO,'       + coCRLF +
           '        CO.NUM_PERIODO,'      + coCRLF +
           '        CO.CVE_COMISION,'     + coCRLF +
           '        NVL( CAT.DESC_COMISION, ''SIN DESCRIPCION'' ) DESC_COMISION,' + coCRLF +
           '        CO.F_VENCIMIENTO,'    + coCRLF +
           '        CO.F_PROG_PAGO'       + coCRLF +
           ' FROM   CR_COMISION CO, CR_CAT_COMISION CAT '         + coCRLF +
           ' WHERE CO.ID_CREDITO    = ' + IntToStr( peIdCredito ) + coCRLF +
           '   AND CO.F_VENCIMIENTO = ' + SQLFecha( peFVentto   ) + coCRLF +
           '   AND CO.F_PROG_PAGO   = ' + SQLFecha( peFProgPg   ) + coCRLF +
           '   AND  CAT.CVE_COMISION(+) = CO.CVE_COMISION'        + coCRLF +
           vlBuscaCon                   + coCRLF +
           '   ORDER BY DESC_COMISION';
   Result := vlsql;
end;




constructor TCrCobComi.Create( AOwner : TComponent );
begin
  Inherited;
  ID_CREDITO         := CreaCampo( 'ID_CREDITO',         ftFloat,   tsNinguno, tsNinguno, False );
  NOMBRE_ACREDITADO  := CreaCampo( 'NOMBRE_ACREDITADO',  ftString,  tsNinguno, tsNinguno, False );
  F_VENCIMIENTO      := CreaCampo( 'F_VENCIMIENTO',      ftDate,    tsNinguno, tsNinguno, False );
  F_PROG_PAGO        := CreaCampo( 'F_PROG_PAGO',        ftDate,    tsNinguno, tsNinguno, False );
  F_VALOR_PAGO       := CreaCampo( 'F_VALOR_PAGO',       ftDate,    tsNinguno, tsNinguno, False );
  //
  COBRANZA           := CreaCampo( 'COBRANZA',           ftString,  tsNinguno, tsNinguno, False );
  //
  DEF_B_COMISION     := CreaCampo( 'DEF_B_COMISION',     ftString,  tsNinguno, tsNinguno, False );
  DEF_FAC_MORAS_CO   := CreaCampo( 'DEF_FAC_MORAS_CO',   ftFloat,   tsNinguno, tsNinguno, False );
  DEF_B_IVA_MORA_CO  := CreaCampo( 'DEF_B_IVA_MORA_CO',  ftString,  tsNinguno, tsNinguno, False );
  DEF_B_COND_MORA_CO := CreaCampo( 'DEF_B_COND_MORA_CO', ftString,  tsNinguno, tsNinguno, False );
  //
  INDICE_GRID        := CreaCampo( 'INDICE_GRID',       ftInteger, tsNinguno, tsNinguno, False );
  B_COMISION         := CreaCampo( 'B_COMISION',        ftString,  tsNinguno, tsNinguno, False );
  NUM_PERIODO        := CreaCampo( 'NUM_PERIODO',       ftString,  tsNinguno, tsNinguno, False );
  CVE_COMISION       := CreaCampo( 'CVE_COMISION',      ftString,  tsNinguno, tsNinguno, False );
  FACT_MORAS         := CreaCampo( 'FACT_MORAS',        ftFloat,   tsNinguno, tsNinguno, False );
  MONTO_MORAS        := CreaCampo( 'MONTO_MORAS',       ftFloat,   tsNinguno, tsNinguno, False );
  B_IVA_MORAS        := CreaCampo( 'B_IVA_MORAS',       ftString,  tsNinguno, tsNinguno, False );
  B_COND_MORAS       := CreaCampo( 'B_COND_MORAS',      ftString,  tsNinguno, tsNinguno, False );
  IMP_PAGO_CON       := CreaCampo( 'IMP_PAGO_CON',      ftFloat,   tsNinguno, tsNinguno, False );
  IMP_COMISION       := CreaCampo( 'IMP_COMISION',      ftFloat,   tsNinguno, tsNinguno, False );
  IMP_COM_TOT        := CreaCampo( 'IMP_COM_TOT',       ftFloat,   tsNinguno, tsNinguno, False );
  B_MOD_IMP_COM      := CreaCampo( 'B_MOD_IMP_COM',     ftString,  tsNinguno, tsNinguno, False );
  ITEM_INDEX         := CreaCampo( 'ITEM_INDEX',        ftInteger, tsNinguno, tsNinguno, False );
  B_COB_COMISION     := CreaCampo( 'B_COB_COMISION',    ftString,  tsNinguno, tsNinguno, False );
  //
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntCrCobComi.Hlp';
  ShowMenuReporte := True;
end;

Destructor TCrCobComi.Destroy;
begin
  inherited;
end;


function TCrCobComi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCobComis;
begin
  W := TWCrCobComis.Create(Self);
  try
    W.Objeto  := Self;
    W.InterForma1.InterFrame := Self;
    W.InterForma1.FormaTipo  := ftConsulta; //FIJA EL TIPO DE FORMA
    W.InterForma1.ShowGrid   := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;
//
Function TCrCobComi.InternalBusca:Boolean;
var T : TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrCoCo.it','');
  Try
    if Active    then begin end;
    if T.Execute then InternalBusca := FindKey([]);
  finally
    T.Free;
  end;
end;
//
function TCrCobComi.StrToBool(peValor: String): Boolean;
begin
  result := ( peValor = 'V' );
end;
//
function TCrCobComi.BoolToStr(peValor: Boolean): String;
begin
  if peValor then result := 'V' else result := 'F';
end;
//
procedure TCrCobComi.ObtenComisInfo( IdCredito, NumPeriodo : Integer; CveComis : String;
            var psCrComis : TCrComis; var psBExiste   : Boolean; var psError : String );
var i         : integer;
    vlCrComis : TCrComis;
begin
  psBExiste     := False;
  psError       := '';
  //
  if Assigned( LCrComis ) then
  begin
    for i := 0 to LCrComis.Count - 1 do
    begin
      if Assigned( LCrComis.Items[ i ] ) then
      begin
          vlCrComis := LCrComis.Items[ i ];
          if ( vlCrComis.id_credito   = IdCredito  ) and
             ( vlCrComis.num_periodo  = NumPeriodo ) and
             ( vlCrComis.cve_comision = CveComis   ) then
          begin
            psBExiste     := True;
            psCrComis     := vlCrComis;
          end;
      end;
    end;
  end;
  //
end;
//
procedure TCrCobComi.StpObtAdeudo( peIdCredito,  peNumPeriodo: Integer;
                     peCveComision: String; pFCalculo: TDate; pFactor: Double;
                     pBIVA, pCveAccesorio: String; var vlTotal, vlImporte, vlIVA,
                     vlBenBco, vlBenGob, vlMoras, vlIVAMoras: Double; var vlError: String);
var  STPObtAdeudo : TStoredProc;
Begin
  vlError := '';
  STPObtAdeudo := TStoredProc.Create(Nil);
  try
    with STPObtAdeudo do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:='PKGCRPERIODO.STPOBTENADEUDO';
      // Se crean los parametros del StoredProcedure
      Params.Clear;
      Params.CreateParam( ftInteger, 'peIdCredito',    ptInput);
      Params.CreateParam( ftInteger, 'peNumPeriodo',   ptInput);
      Params.CreateParam( ftString,  'peCveComision',  ptInput);
      Params.CreateParam( ftDate,    'peFReferencia',  ptInput);
      Params.CreateParam( ftDate,    'peFCalculo',     ptInput);
      Params.CreateParam( ftFloat,   'peFactor',       ptInput);
      Params.CreateParam( ftString,  'peBIVA',         ptInput);
      Params.CreateParam( ftString,  'peCveAccesorio', ptInput);
      Params.CreateParam( ftFloat,   'psImporte',      ptOutput);
      Params.CreateParam( ftFloat,   'psIVA',          ptOutput);
      Params.CreateParam( ftFloat,   'psBenBco',       ptOutput);
      Params.CreateParam( ftFloat,   'psBenGob',       ptOutput);
      Params.CreateParam( ftFloat,   'psMoras',        ptOutput);
      Params.CreateParam( ftFloat,   'psIVAMoras',     ptOutput);
      Params.CreateParam( ftFloat,   'psTotal',        ptOutput);
      Params.CreateParam( ftFloat,   'psResultado',   ptOutput);
      Params.CreateParam( ftString,  'psTxResultado', ptOutput);
      //
      ParamByName('peIdCredito').AsInteger    := peIdCredito;
      ParamByName('peNumPeriodo').AsInteger   := peNumPeriodo;
      ParamByName('peCveComision').AsString   := peCveComision;
      ParamByName('peFReferencia').AsDateTime := Apli.DameFechaEmpresa;
      ParamByName('peFCalculo').AsDate        := pFCalculo;
      ParamByName('peFactor').AsFloat         := pFactor;
      ParamByName('peBIVA').AsString          := pBIVA;
      ParamByName('peCveAccesorio').AsString  := pCveAccesorio;
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
      end;
    end;
  finally
    STPObtAdeudo.Free;
  end;
end;
//
function TCrCobComi.StpObtFacMora(peIdCredito, peNumPeriodo: Integer; peBAplic: String;
                     peMonto: Double; peFPago: TDate; var psFacMoras: Double): Boolean;
var  STPObtFacMora : TStoredProc;
Begin
  Result := False;
  STPObtFacMora := TStoredProc.Create(Nil);
  try
    with STPObtFacMora do
    begin
      DatabaseName:= Apli.DatabaseName;
      SessionName:= Apli.SessionName;
      StoredProcName := 'PKGCRPERIODO.STPOBTFACMORA';
      // Se crean los parametros del StoredProcedure
      Params.Clear;
      Params.CreateParam( ftInteger, 'PECREDITO',     ptInput  );
      Params.CreateParam( ftInteger, 'PENUMPERIODO',  ptInput  );
      Params.CreateParam( ftString,  'PEBIVA',        ptInput  );
      Params.CreateParam( ftFloat,   'PEIMPMORA',     ptInput  );
      Params.CreateParam( ftDate,    'PEFPAGO',       ptInput  );
      Params.CreateParam( ftFloat,   'PSFACMORA',     ptOutput );
      Params.CreateParam( ftInteger, 'PSRESULTADO',   ptOutput );
      Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput );
      //
      ParamByName('PECREDITO').AsInteger    := peIdCredito;
      ParamByName('PENUMPERIODO').AsInteger := peNumPeriodo;
      ParamByName('PEBIVA').AsString   := peBAplic;
      ParamByName('PEIMPMORA').AsFloat := peMonto;
      ParamByName('PEFPAGO').AsDate    := peFPago;
      //
      ExecProc;
      if ( ParamByName('PSRESULTADO').AsInteger = 0 ) then
      begin
        psFacMoras := ParamByName('PSFACMORA').AsFloat;
        Result := True;
      end else
      begin
        ShowMessage( 'Error al obtener el factor de moras: ' + coCRLF +
                     'Código : ' + ParamByName('PSRESULTADO').AsString + coCRLF +
                     'Mensaje: ' + ParamByName('PSTXRESULTADO').AsString );
      end;
    end;
  finally
    STPObtFacMora.Free;
  end;
end;
// +---------------------------- FORMA CR_COB_COMIS ---------------------------+
// |                                                                           |
// |                           FORMA DE CR_COB_COMIS                           |
// |                                                                           |
// +---------------------------- FORMA CR_COB_COMIS ---------------------------+

function TWCrCobComis.ExisteRegActivo : Boolean;
begin
  result := ( fDataFound ) and ( Objeto.ID_CREDITO.AsInteger > 0 );
end;
//
procedure TWCrCobComis.LimpiaRecord;
begin
  Objeto.INDICE_GRID.AsInteger  := 0;
  Objeto.B_COMISION.AsString    := '';
  Objeto.NUM_PERIODO.AsString   := '';
  Objeto.CVE_COMISION.AsString  := '';
  Objeto.FACT_MORAS.AsString    := '';
  Objeto.MONTO_MORAS.AsString   := '';
  Objeto.B_IVA_MORAS.AsString   := '';
  Objeto.B_COND_MORAS.AsString  := '';
  Objeto.IMP_PAGO_CON.AsString  := '';
  Objeto.IMP_COMISION.AsString  := '';
  Objeto.B_MOD_IMP_COM.AsString := '';
  Objeto.ITEM_INDEX.AsInteger   := 0;
  Objeto.B_COB_COMISION.AsString:= '';
end;
//
procedure TWCrCobComis.DrawControls;
begin
  Objeto.FACT_MORAS.DrawControl;
  Objeto.MONTO_MORAS.DrawControl;
  Objeto.IMP_PAGO_CON.DrawControl;
  Objeto.B_IVA_MORAS.DrawControl;
  Objeto.B_COND_MORAS.DrawControl;
  Objeto.IMP_COMISION.DrawControl;
end;
//
procedure TWCrCobComis.LimpiaPantalla;
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
//
function TWCrCobComis.OBTEN_IMP_COMISION: Double;
var vlRow    : integer;
    vlFactor : Word;
    vlTotCom : Double;
begin
  Result   := 0;
  vlTotCom := 0;
  if fDataFound then
  begin
    for vlRow := 0 to sagDATOS.RowCount - 1 do
    begin
      vlFactor := Word( Objeto.StrToBool( sagDATOS.Cells[ COL_SEL, vlRow ] ) );
      vlTotCom := vlTotCom + ( CurrFromFrmFloat( sagDATOS.Cells[ COL_ITOT, vlRow ] ) );
      Result   := Result   + ( vlFactor * CurrFromFrmFloat( sagDATOS.Cells[ COL_ITOT, vlRow ] ) );
    end;
  end;
  Objeto.IMP_COM_TOT.AsFloat  := vlTotCom;
  Objeto.IMP_COMISION.AsFloat := Result;
end;
//
function TWCrCobComis.OBTEN_B_COB_COMISION: String;
var vlRow    : integer;
    vlResult : Boolean;
begin
  vlResult := False;
  if fDataFound then
  begin
    for vlRow := 0 to sagDATOS.RowCount - 1 do
    begin
      vlResult := vlResult OR Objeto.StrToBool( sagDATOS.Cells[ COL_SEL, vlRow ] );
    end;
  end;
  Objeto.B_COB_COMISION.AsString := Objeto.BoolToStr( vlResult );
end;
//
procedure TWCrCobComis.GetFromGrid( peRowGrid, peColGrid : Integer );
begin
  Objeto.INDICE_GRID.AsInteger  := peRowGrid;
  Objeto.B_COMISION.AsString    := sagDATOS.Cells[ COL_SEL,  peRowGrid ];
  Objeto.NUM_PERIODO.AsString   := sagDATOS.Cells[ COL_NPCO, peRowGrid ];
  Objeto.CVE_COMISION.AsString  := sagDATOS.Cells[ COL_CVEC, peRowGrid ];
  Objeto.FACT_MORAS.AsString    := sagDATOS.Cells[ COL_FMCO, peRowGrid ];
  Objeto.MONTO_MORAS.AsString   := sagDATOS.Cells[ COL_MMCO, peRowGrid ];
  Objeto.B_IVA_MORAS.AsString   := sagDATOS.Cells[ COL_BIVC, peRowGrid ];
  Objeto.B_COND_MORAS.AsString  := sagDATOS.Cells[ COL_CMCO, peRowGrid ];
  Objeto.IMP_PAGO_CON.AsString  := sagDATOS.Cells[ COL_ITOT, peRowGrid ];
  Objeto.B_MOD_IMP_COM.AsString := sagDATOS.Cells[ COL_BMCO, peRowGrid ];
  Objeto.ITEM_INDEX.AsString    := sagDATOS.Cells[ COL_IIDX, peRowGrid ];
  OBTEN_IMP_COMISION;
  OBTEN_B_COB_COMISION;
end;
//
procedure TWCrCobComis.GetFromControls;
begin
  Objeto.FACT_MORAS.GetFromControl;
  Objeto.MONTO_MORAS.GetFromControl;
  Objeto.IMP_PAGO_CON.GetFromControl;
  Objeto.B_IVA_MORAS.GetFromControl;
  Objeto.B_COND_MORAS.GetFromControl;
end;
//
procedure TWCrCobComis.UpdateToGrid;
var vlRowGrid : Integer;
    vlCrComis : TCrComis;
begin
  vlRowGrid := Objeto.INDICE_GRID.AsInteger;
  //
  sagDATOS.Cells[ COL_SEL,  vlRowGrid ] := Objeto.B_COMISION.AsString;
  sagDATOS.Cells[ COL_FMCO, vlRowGrid ] := Objeto.FACT_MORAS.AsString;
  sagDATOS.Cells[ COL_MMCO, vlRowGrid ] := Format( cFORMAT_DINERO,[ Objeto.MONTO_MORAS.AsFloat  ] );
  sagDATOS.Cells[ COL_BIVC, vlRowGrid ] := Objeto.B_IVA_MORAS.AsString;
  sagDATOS.Cells[ COL_CMCO, vlRowGrid ] := Objeto.B_COND_MORAS.AsString;
  sagDATOS.Cells[ COL_ITOT, vlRowGrid ] := Format( cFORMAT_DINERO,[ Objeto.IMP_PAGO_CON.AsFloat ] );
  //
  vlCrComis := Objeto.LCrComis.Items[ Objeto.ITEM_INDEX.AsInteger ];
  vlCrComis.b_comision     := Objeto.B_COMISION.AsString;
  vlCrComis.imp_pago_con   := Objeto.IMP_PAGO_CON.AsFloat;
  vlCrComis.fact_moras_cn  := Objeto.FACT_MORAS.AsFloat;
  vlCrComis.monto_moras    := Objeto.MONTO_MORAS.AsFloat;
  vlCrComis.b_iva_mora_cn  := Objeto.B_IVA_MORAS.AsString;
  vlCrComis.b_cond_mora_cn := Objeto.B_IVA_MORAS.AsString;
  vlCrComis.b_mod_imp_com  := Objeto.B_MOD_IMP_COM.AsString;
  //
end;
//
procedure TWCrCobComis.CalculaCobranza;
var  vlError            : String;
     vlImporte          : Double;
     vlIVA              : Double;
     vlBenBco           : Double;
     vlBenGob           : Double;
     vlMoras            : Double;
     vlIVAMoras         : Double;
     vlTotal            : Double;
begin
  if Objeto.B_MOD_IMP_COM.AsString = 'F' then
  begin
    Objeto.StpObtAdeudo( Objeto.ID_CREDITO.AsInteger,
                         Objeto.NUM_PERIODO.AsInteger,
                         Objeto.CVE_COMISION.AsString,
                         Objeto.F_VALOR_PAGO.AsDateTime,
                         Objeto.FACT_MORAS.AsFloat,
                         Objeto.B_IVA_MORAS.AsString,
                         coComis,  vlTotal,  vlImporte,  vlIVA,  vlBenBco,
                         vlBenGob, vlMoras,  vlIVAMoras, vlError );
    Objeto.MONTO_MORAS.AsFloat := ( vlMoras +  vlIVAMoras );
    Objeto.IMP_PAGO_CON.AsFloat := vlTotal;
  end;//ends_if
end;
//
procedure TWCrCobComis.ProcesaCambio( peBObtAdeudo : Boolean );
begin
  GetFromControls;      // Salva la información de la pantalla al registro actual
  if peBObtAdeudo then
    CalculaCobranza;    // Hace el calculo de los importes
  //ends_if
  DrawControls;         // Regresa los valores a la pantalla
  UpdateToGrid;         // Regresa los valores al GRID.
  OBTEN_IMP_COMISION;   // Obtiene el importe de comision
  OBTEN_B_COB_COMISION; // Cobra comision
end;
//
procedure TWCrCobComis.ProcesaFacMoras;
var vlFacMora : Double;
begin
  //
  if MessageDlg( Format( coObtFacMora, [ Objeto.MONTO_MORAS.AsFloat ] ), mtConfirmation, mbYesNoCancel, 0 ) = mrYes then
    if Objeto.StpObtFacMora( Objeto.ID_CREDITO.AsInteger,    Objeto.NUM_PERIODO.AsInteger,
                             Objeto.B_IVA_MORAS.AsString,    Objeto.MONTO_MORAS.AsFloat,
                             Objeto.F_VALOR_PAGO.AsDateTime, vlFacMora ) then
    begin
      Objeto.FACT_MORAS.AsFloat := vlFacMora;
      Objeto.FACT_MORAS.DrawControl;
      ProcesaCambio( True );
    end;
  //ends_if
end;
//
procedure TWCrCobComis.MuestraDatos;
var Qry           : TQuery;
    nRowCount     : Integer;
    vlError       : String;
    vlBExiste     : Boolean;
    vlTotal       : Double;
    vlImporte     : Double;
    vlIVA         : Double;
    vlBenBco      : Double;
    vlBenGob      : Double;
    vlMoras       : Double;
    vlIVAMoras    : Double;
    vlCrComis     : TCrComis;
begin
  try
    fDataFound := False;
    LimpiaPantalla;
    //
    Qry := GetSQLQueryNoNil( BuildSQLStrCom( Objeto.COBRANZA.AsString, Objeto.ID_CREDITO.AsInteger,
                             Objeto.F_VENCIMIENTO.AsDateTime,  Objeto.F_PROG_PAGO.AsDateTime ),
                             Objeto.Apli.DataBaseName,  Objeto.Apli.SessionName, False );
    nRowCount := 0;
    // ------------------------- Barre el QUERY de datos -------------------------
    if Assigned(Qry) and NOT( Qry.IsEmpty ) THEN
    begin
      fDataFound := True;
      while Not Qry.Eof Do
      begin
        with sagDATOS do
        begin
          // Asigna los formatos de las celdas
          AlignCell[COL_ITOT,nRowCount] := alRight;
          //
          Objeto.ObtenComisInfo( Qry.FieldByName('ID_CREDITO').AsInteger,
                                 Qry.FieldByName('NUM_PERIODO').AsInteger,
                                 Qry.FieldByName('CVE_COMISION').AsString,
                                 vlCrComis, vlBExiste, vlError );

          if not vlBExiste then
          begin
            Objeto.StpObtAdeudo( Qry.FieldByName('ID_CREDITO').AsInteger,
                                 Qry.FieldByName('NUM_PERIODO').AsInteger,
                                 Qry.FieldByName('CVE_COMISION').AsString,
                                 Objeto.F_VALOR_PAGO.AsDateTime,
                                 Objeto.DEF_FAC_MORAS_CO.AsFloat,
                                 Objeto.DEF_B_IVA_MORA_CO.AsString,
                                 'CN',     vlTotal,  vlImporte, vlIVA,
                                 vlBenBco, vlBenGob, vlMoras,   vlIVAMoras,
                                 vlError  );
            //
            vlCrComis := TCrComis.Create;
            vlCrComis.item_index     := Objeto.LCrComis.Count;
            vlCrComis.id_credito     := Qry.FieldByName('ID_CREDITO').AsInteger;
            vlCrComis.num_periodo    := Qry.FieldByName('NUM_PERIODO').AsInteger;
            vlCrComis.cve_comision   := Qry.FieldByName('CVE_COMISION').AsString;
            vlCrComis.f_vencimiento  := Qry.FieldByName('F_VENCIMIENTO').AsDateTime;
            vlCrComis.f_prog_pago    := Qry.FieldByName('F_PROG_PAGO').AsDateTime;
            vlCrComis.b_comision     := Objeto.DEF_B_COMISION.AsString;
            vlCrComis.imp_pago_con   := vlTotal;
            vlCrComis.fact_moras_cn  := Objeto.DEF_FAC_MORAS_CO.AsFloat;
            vlCrComis.monto_moras    := ( vlMoras + vlIVAMoras );
            vlCrComis.b_iva_mora_cn  := Objeto.DEF_B_IVA_MORA_CO.AsString;
            vlCrComis.b_cond_mora_cn := Objeto.DEF_B_COND_MORA_CO.AsString;
            vlCrComis.b_mod_imp_com  := 'F';
            Objeto.LCrComis.Add( vlCrComis );
          end;//ends_if
          //
          Cells[ COL_SEL,  nRowCount] := vlCrComis.b_comision;
          Cells[ COL_NPCO, nRowCount] := IntToStr( vlCrComis.num_periodo );
          Cells[ COL_CVEC, nRowCount] := vlCrComis.cve_comision;
          Cells[ COL_DESC, nRowCount] := Qry.FieldByName('DESC_COMISION').AsString;
          Cells[ COL_ITOT, nRowCount] := Format( cFORMAT_DINERO,[ vlCrComis.imp_pago_con  ] );
          Cells[ COL_BMCO, nRowCount] := vlCrComis.b_mod_imp_com;
          Cells[ COL_FMCO, nRowCount] := Format( cFORMAT_DINERO,[ vlCrComis.fact_moras_cn ] );
          Cells[ COL_MMCO, nRowCount] := Format( cFORMAT_DINERO,[ vlCrComis.monto_moras   ] );
          Cells[ COL_BIVC, nRowCount] := vlCrComis.b_iva_mora_cn;
          Cells[ COL_CMCO, nRowCount] := vlCrComis.b_cond_mora_cn;
          Cells[ COL_IIDX, nRowCount] := IntToStr( vlCrComis.item_index );
          //
        end; //end with
        Qry.Next;
        if not Qry.Eof then
        begin
          nRowCount := sagDATOS.RowCount;
          sagDATOS.RowCount := sagDATOS.RowCount + 1; //Incrementa un reglon
        end;
        Application.ProcessMessages;
      end; //end While
    end;
    if Assigned(Qry) then
    begin
      Qry.Close;
      Qry.Free;
    end;
  except
    on e : exception do
      ShowMessage(  e.Message );
  end;
end;
//
procedure TWCrCobComis.FormShow(Sender: TObject);
begin
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
  {}
  fDataFound := False;
  Objeto.ID_CREDITO.Control         := edID_CREDITO;
  Objeto.NOMBRE_ACREDITADO.Control  := edNombre;
  Objeto.F_VENCIMIENTO.Control      := edF_VENCIMIENTO;
  Objeto.F_PROG_PAGO.Control        := edF_PROG_PAGO;
  Objeto.F_VALOR_PAGO.Control       := edF_VALOR_PAGO;
  //
  Objeto.FACT_MORAS.Control         := edFAC_MORAS;
  Objeto.MONTO_MORAS.Control        := edMONTO_MORAS;
  Objeto.B_IVA_MORAS.Control        := cbB_IVA_MORA;
  Objeto.B_COND_MORAS.Control       := cbB_COND_MORAS;
  Objeto.IMP_PAGO_CON.Control       := edIMP_PAGO_CN;
  //
  Objeto.IMP_COMISION.Control       := edIMP_COMISION;
  //
  MuestraDatos;
end;

procedure TWCrCobComis.FormDestroy(Sender: TObject);
begin
  Objeto.ID_CREDITO.Control         := nil;
  Objeto.NOMBRE_ACREDITADO.Control  := nil;
  Objeto.F_VENCIMIENTO.Control      := nil;
  Objeto.F_PROG_PAGO.Control        := nil;
  Objeto.F_VALOR_PAGO.Control       := nil;
  //
  Objeto.FACT_MORAS.Control         := nil;
  Objeto.MONTO_MORAS.Control        := nil;
  Objeto.B_IVA_MORAS.Control        := nil;
  Objeto.B_COND_MORAS.Control       := nil;
  Objeto.IMP_PAGO_CON.Control       := nil;
  //
  Objeto.IMP_COMISION.Control       := nil;
  //
end;

procedure TWCrCobComis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
//
procedure TWCrCobComis.sagDATOSSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if fDataFound then
  begin
    GetFromGrid( ARow, ACol );
    DrawControls;
  end;//ends_if
end;
//
procedure TWCrCobComis.sagDATOSDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
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
//
procedure TWCrCobComis.sagDATOSMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var ACol  : Integer;
    ARow  : Integer;
begin
  if ExisteRegActivo then
  begin
    sagDATOS.MouseToCell(X, Y ,ACol, ARow);
    If (  ACol = COL_SEL  ) Then //  selecciona la cobranza de los conceptos
    begin
      Objeto.B_COMISION.AsString := Objeto.BoolToStr( not ( Objeto.StrToBool( Objeto.B_COMISION.AsString ) ) );
      ProcesaCambio( False );
    end;
  end;
end;
//
procedure TWCrCobComis.edFAC_MORASEnter(Sender: TObject);
begin
  if ExisteRegActivo then
    vgFACT_MORAS := Objeto.FACT_MORAS.AsFloat;
end;
//
procedure TWCrCobComis.edFAC_MORASExit(Sender: TObject);
begin
  if ExisteRegActivo then
  begin
    Objeto.FACT_MORAS.GetFromControl;
    if Objeto.FACT_MORAS.AsFloat <> vgFACT_MORAS then
    begin
      ProcesaCambio( True );
    end;//ends_if
  end;//ends_if
end;
{}
procedure TWCrCobComis.edFAC_MORASKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = coCR then
  begin
    edFAC_MORASExit( edFAC_MORAS );
    Key := #0;
  end;//ends_if
end;
{}
procedure TWCrCobComis.edMONTO_MORASEnter(Sender: TObject);
begin
  if ExisteRegActivo then
    vgMONTO_MORAS := Objeto.MONTO_MORAS.AsFloat;
end;

procedure TWCrCobComis.edMONTO_MORASExit(Sender: TObject);
begin
  Objeto.MONTO_MORAS.GetFromControl;
  if Objeto.MONTO_MORAS.AsFloat <> vgMONTO_MORAS then
    ProcesaFacMoras;
end;

procedure TWCrCobComis.edMONTO_MORASKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = coCR then
  begin
    edMONTO_MORASExit( edMONTO_MORAS );
    Key := #0;
  end;
end;


procedure TWCrCobComis.edIMP_PAGO_CNEnter(Sender: TObject);
begin
  if ExisteRegActivo then
    vgIMP_PAGO_CON := Objeto.IMP_PAGO_CON.AsFloat;
end;

procedure TWCrCobComis.edIMP_PAGO_CNExit(Sender: TObject);
begin
  if ExisteRegActivo then
  begin
    Objeto.IMP_PAGO_CON.GetFromControl;
    if Objeto.IMP_PAGO_CON.AsFloat <> vgIMP_PAGO_CON then
    begin
      Objeto.B_MOD_IMP_COM.AsString := Objeto.BoolToStr( True );
      ProcesaCambio( False );
    end;//ends_if
  end;
end;

procedure TWCrCobComis.edIMP_PAGO_CNKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = coCR then
  begin
    edIMP_PAGO_CNExit( edIMP_PAGO_CN );
    Key := #0;
  end;//ends_if
end;

procedure TWCrCobComis.cbB_IVA_MORAClick(Sender: TObject);
begin
  if ExisteRegActivo then
    ProcesaCambio( True );
  //ends_if
end;

procedure TWCrCobComis.cbB_COND_MORASClick(Sender: TObject);
begin
  if ExisteRegActivo then
  begin
    ProcesaCambio( False );
  end;
end;



{
    //function    BuildSQLStr : String;
function TCrCobComi.BuildSQLStr: String;
var vlsql        : String;
    vlBuscaCon   : String;
Begin
  // Impagado
  if COBRANZA.AsString = cImpagado then
  begin
    vlBuscaCon := '   AND CO.SIT_COMISION  = ''IM'' ';
  end
  // Programado
  else if COBRANZA.AsString = cProgramado then
  begin
    vlBuscaCon := '   AND CO.SIT_COMISION= ''AC'' ';
  end
  // Anticipado
  else if COBRANZA.AsString = cAnticipado then
  begin
    vlBuscaCon := '   AND  CO.SIT_COMISION NOT IN( ''LQ'', ''CA'' )';
   end;

   // Arma la sentencia SQL.
   vlsql :=' SELECT CO.ID_CREDITO,'       + coCRLF +
           '        CO.NUM_PERIODO,'      + coCRLF +
           '        CO.CVE_COMISION,'     + coCRLF +
           '        NVL( CAT.DESC_COMISION, ''SIN DESCRIPCION'' ) DESC_COMISION,' + coCRLF +
           '        CO.F_VENCIMIENTO,'    + coCRLF +
           '        CO.F_PROG_PAGO'       + coCRLF +
           ' FROM   CR_COMISION CO, CR_CAT_COMISION CAT '        + coCRLF +
           ' WHERE CO.ID_CREDITO    = ' + ID_CREDITO.AsString    + coCRLF +
           '   AND CO.F_VENCIMIENTO = ' + SQLFecha( F_VENCIMIENTO.AsDateTime ) + coCRLF +
           '   AND CO.F_PROG_PAGO   = ' + SQLFecha( F_PROG_PAGO.AsDateTime   ) + coCRLF +
           '   AND  CAT.CVE_COMISION(+) = CO.CVE_COMISION'       + coCRLF +
           vlBuscaCon              + coCRLF +
           '   ORDER BY DESC_COMISION';
   Result := vlsql;
end;
}
//

end.


