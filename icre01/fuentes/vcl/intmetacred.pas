unit IntMetAcred;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
  UnSQL2, InterFun, ComCtrls, IntDtPk, uMetComFramework, Grids, Aligrid, ShellAPI,
  RxMemDS, DBGrids, RXDBCtrl, ActnList, ImgList;

type
  TMetAcred = class;

  TWMetAcred = class(TForm)
    InterForma1: TInterForma;
    Modelo1: TModelo;
    Panel1: TPanel;
    Label1: TLabel;
    edtAcreditado: TEdit;
    edtNombre: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    AppModelo1: TAppModelo;
    AppModelo2: TAppModelo;
    Modelo2: TModelo;
    lblPeriodo: TLabel;
    qryMetodologia: TQuery;
    qryMetodologiaID_ACREDITADO: TFloatField;
    qryMetodologiaENTIDADFINANCIERA: TMemoField;
    qryMetodologiaFECHAINFOFINANCIERA: TMemoField;
    qryMetodologiaVENTASTOTALES: TMemoField;
    qryMetodologiaTVENTAS: TStringField;
    qryMetodologiaANEXO: TFloatField;
    qryGarantias: TQuery;
    qryGarantiasIMP_VALUACION: TFloatField;
    qryGarantiasNUEVA_VALUACION: TFloatField;
    qryGarantiasPROMOTOR: TStringField;
    qryGarantiasCVE_ORIGEN: TStringField;
    qryGarantiasCVE_MONEDA: TFloatField;
    qryGarantiasDESC_MONEDA: TStringField;
    qryGarantiasCVE_MONEDA_OTORGANTE: TFloatField;
    qryGarantiasDESC_MONEDA_OTORGANTE: TStringField;
    qryGarantiasID_ACREDITADO: TFloatField;
    qryGarantiasTIPO_CAMBIO: TFloatField;
    qryGarantiasID_OTORGANTE: TFloatField;
    qryGarantiasTIPO_CAMBIO_OTORGANTE: TFloatField;
    qryGarantiasID_CREDITO: TFloatField;
    qryGarantiasOTORGANTE: TFloatField;
    qryGarantiasSDO_INSOLUTO: TFloatField;
    qryGarantiasIMP_CREDITO: TFloatField;
    qryGarantiasSDO_INSOLUTO2: TFloatField;
    qryGarantiasIMP_CREDITO2: TFloatField;
    qryGarantiasIMP_DISPUESTO2: TFloatField;
    qryGarantiasEMISORA: TStringField;
    qryGarantiasSERIE: TStringField;
    qryGarantiasTIPO_VALOR: TStringField;
    qryGarantiasFH_CAPTURA: TDateTimeField;
    qryGarantiasNUM_TITULOS_VIRT: TFloatField;
    qryGarantiasID_CONTRATO: TFloatField;
    qryGarantiasNOMBRE_PROMOTOR: TStringField;
    qryGarantiasNOMBRE_OTORGANTE: TStringField;
    qryGarantiasNOMBRE_ACREDITADO: TStringField;
    qryGarantiasSIT_CREDITO: TStringField;
    qryGarantiasBURSATILIDAD: TStringField;
    qryGarantiasPROPORCION: TFloatField;
    qryGarantiasF_INICIO: TDateTimeField;
    qryGarantiasF_VENCIMIENTO: TDateTimeField;
    qryGarantiasTASA_INTERES: TStringField;
    qryGarantiasID_PERS_ASOCIAD: TFloatField;
    qryGarantiasIMP_DISPUESTO: TFloatField;
    qryGarantiasFACT_PROPOR_GAR: TFloatField;
    qryGarantiasSDO_GRTIA: TFloatField;
    qryGarantiasID_EMPRESA: TFloatField;
    qryGarantiasCVE_DIA_LIQUIDA: TStringField;
    qryGarantiasTIPO_CAMBIO_EMISORA: TFloatField;
    qryGarantiasCVE_MONEDA_EMISORA: TFloatField;
    qryGarantiasABRE_MONEDA_EMISORA: TStringField;
    qryGarantiasDESC_MONEDA_EMISORA: TStringField;
    qryGarantiasEMISORA_SERIE: TStringField;
    qryGarantiasPREC_VALUACION: TFloatField;
    qryGarantiasIMP_VALUACION_ORI: TFloatField;
    qryGarantiasINTERES: TFloatField;
    qryGarantiasIMP_VALUACION_EMISORA: TFloatField;
    qryGarantiasT_IMP_VALUACION: TFloatField;
    qryGarantiasGUBERNAMENTAL: TFloatField;
    qryDetalle: TQuery;
    qryDetalleID_PERSONA: TFloatField;
    qryDetalleID_MODELO: TFloatField;
    qryDetalleID_NODO: TFloatField;
    qryDetalleID_VARIABLE: TFloatField;
    qryDetalleNO_REPETICION: TFloatField;
    qryFecha: TQuery;
    qryNumerico: TQuery;
    qryCadena: TQuery;
    tsAnexo18: TTabSheet;
    tsAnexo19: TTabSheet;
    ModAnexo18: TModelo;
    ModAnexo19: TModelo;
    AppModAnexo18: TAppModelo;
    AppModAnexo19: TAppModelo;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    sagSevPerdida: TStringAlignGrid;
    Label40: TLabel;
    edProbInc: TEdit;
    qryFechaVigente: TQuery;
    qSevPerdida: TQuery;
    btnGenerarLayoutAnexo18: TBitBtn;
    qryGenerarLayoutAnexo18: TQuery;
    SaveDlgLayoutAnexo18: TSaveDialog;
    btnCargarAnexo18: TBitBtn;
    OpenDlgCargaMasivaAnexo18: TOpenDialog;
    ConsoleAnexo18: TMemo;
    Consola: TLabel;
    pgAnexo18: TProgressBar;
    Panel3: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    QContratosAnexo19: TQuery;
    MemContratosAnexo19: TRxMemoryData;
    DSContratosAnexo19: TDataSource;
    MemContratosAnexo19FOL_CONTRATO: TIntegerField;
    MemContratosAnexo19ID_CONTRATO: TIntegerField;
    QProyectosAnexo19: TQuery;
    MemContratosAnexo19Cve_Metodologia: TStringField;
    dbgAnexo19: TDBGrid;
    MemContratosAnexo19ID_PROYECTO: TIntegerField;
    MemContratosAnexo19Nombre: TStringField;
    QMetodologias: TQuery;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ActionList1: TActionList;
    actModificarContratosAnexo19: TAction;
    actAceptarContratosAnexo19: TAction;
    actCancelarContratosAnexo19: TAction;
    ImageList1: TImageList;
    SPActCtoProyAnx19: TStoredProc;
    MemContratosAnexo19Metodologia: TStringField;
    spAltaPersona: TStoredProc;
    QTablaReferenciada: TQuery;
    qryPersona: TQuery;
    btnExportarAnexo18: TBitBtn;
    SaveDlgExportAnexo18XLS: TSaveDialog;
    qryExportAnexo18XLS: TQuery;
    tabConsumoRevolvente: TTabSheet;
    ModConsumoRevolvente: TModelo;
    AppModConsumoRevolvente: TAppModelo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AppModelo1BtnBuscar(Sender: TObject);
    procedure AppModelo1Validacion(AppModelo: TAppModelo;
      Bloque: TAppModeloBloque; Columna: TAppModeloDefColumna;
      var InfoValida: Boolean; var MsgError: String);
    procedure AppModelo1CalcularCampos(AppModelo: TAppModelo;
      AppDataSet: TAppModeloDataSet);
    procedure AppModelo1ActualizaBotones(Sender: TObject;
      BotonesActivos: TBotonesAppModelo);
    procedure btnPersonaClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure AppModelo2CalcularCampos(AppModelo: TAppModelo;
      AppDataSet: TAppModeloDataSet);
    procedure AppModelo1BtnAceptar(Sender: TObject);
    procedure btnGenerarLayoutAnexo18Click(Sender: TObject);
    procedure btnCargarAnexo18Click(Sender: TObject);
    procedure actModificarContratosAnexo19Execute(Sender: TObject);
    procedure actModificarContratosAnexo19Update(Sender: TObject);
    procedure actAceptarContratosAnexo19Execute(Sender: TObject);
    procedure actCancelarContratosAnexo19Execute(Sender: TObject);
    procedure MemContratosAnexo19BeforeInsert(DataSet: TDataSet);
    procedure AppModAnexo19CalcularCampos(AppModelo: TAppModelo;
      AppDataSet: TAppModeloDataSet);
    procedure AppModelo2BtnAceptar(Sender: TObject);
    procedure AppModAnexo18BtnAceptar(Sender: TObject);
    procedure AppModAnexo19BtnAceptar(Sender: TObject);
    procedure btnExportarAnexo18Click(Sender: TObject);
    procedure AppModConsumoRevolventeCalcularCampos(AppModelo: TAppModelo;
      AppDataSet: TAppModeloDataSet);
    procedure AppModConsumoRevolventeBtnAceptar(Sender: TObject);
  private
    { Private declarations }

    procedure LimpiaStoredProc (SP: TStoredProc);
    procedure InicializaQuerysYSPs;
    function ObtenIDPersona (ID_Acreditado: integer): integer;
//    function obtMetPersona(intPersona : integer) : integer;
    function obtMetPeriodoPersona(intPersona, intModelo : integer) : string;
    procedure AppModeloBtnAceptar(AppModelo: TAppModelo);
    procedure ActivaBotones(pgAnexos : TPageControl);
    procedure actualizaInformacion(iPersona : integer);
    function SalvaLayoutAnexo18XLS (FileName: string): boolean;
    function ExportaAnexo18XLS (FileName: string): boolean;
    procedure CargaMasivaAnexo18XLS (FileName: string);
    procedure LogAnexo18 (S: string);
    procedure SalvaContratosAnexo19;
    procedure ActualizaContratosAnexo19;
  public
    { Public declarations }

    Objeto: TMetAcred;
  end;

  TMetAcred = class(TInterFrame)
  private
  protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
    intMetPersona,
    intAnexo,
    intFinan          : Integer;
    fltVentas         : Double;
  public
    { Public declarations }

    intPersona  : Integer;
    strNomPersona : string;
    strCveMetPantAcred: string;

    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

var
  WMetAcred: TWMetAcred;

implementation
{$R *.DFM}
uses ComObj, IntDmMain, IntMain;

const
  xlWBatWorkSheet = -4167;

  coID_Acreditado            =  1;
  coF_Vigente_Desde          =  2;
  coPct_Pgo_Tiem_Ins_Ban     =  3;
  coPct_Pgo_Tiem_Ins_Nban    =  4;
  coDias_Mora_Prom_Ins_Ban   =  5;
  coImp_Deuda_Corto_Plz      =  6;
  coImp_Deuda_Total          =  7;
  coF_Inf_Buro               =  8;
  coImp_Serv_Personales      =  9;
  coImp_Materiales_Sumin     = 10;
  coImp_Servicios_Grales     = 11;
  coImp_Subs_Transf_Ayud     = 12;
  coImp_Adq_Bie_Mue_Inmue    = 13;
  coImp_Obras_Publicas       = 14;
  coImp_Inversion            = 15;
  coImp_Aplic_Rec_Fed_Est    = 16;
  coImp_Otros_Egresos        = 17;
  coImp_Por_Cta_3ros_Egr     = 18;
  coImp_Deuda_Publica        = 19;
  coImp_Disponib_Final       = 20;
  coImp_Impuestos            = 21;
  coImp_Derechos             = 22;
  coImp_Productos            = 23;
  coImp_Aprovechamientos     = 24;
  coImp_Contrib_Mejora       = 25;
  coImp_Particip_Fed_Est     = 26;
  coImp_Aport_Fed_Est        = 27;
  coImp_Otros_Ingresos       = 28;
  coImp_Por_Cta_3ros_Ing     = 29;
  coImp_Financiamiento       = 30;
  coImp_Disponib_Inicial     = 31;
  coImp_Acciones_Soc         = 32;
  coF_Inf_Estados_Finan      = 33;
  coImp_Partici_Eleg_Act     = 34;
  coImp_Partici_Eleg_Ant     = 35;
  coF_Inf_Particip_Eleg      = 36;
  coTasa_Desempleo_Local     = 37;
  coImp_Pob_Desocupada       = 38;
  coImp_Pob_Activa           = 39;
  coF_Tasa_Desempleo         = 40;
  coImp_Serv_Finan_Er        = 41;
  coImp_Oblig_Contingen      = 42;
  coImp_Deu_Pub_Mer_Val      = 43;
  coF_Inf_Servicio_Deuda     = 44;
  coImp_Pib_Local            = 45;
  coImp_Sol_Flex_Imp_Loc     = 46;
  coF_Inf_Sol_Flex_Imp_Loc   = 47;
  coImp_Sol_Flex_Presup      = 48;
  coF_Inf_Sol_Flex_Presup    = 49;
  coImp_Transp_Finan_Deu_Pub = 50;
  coF_Transparencia          = 51;

function LeftTrim (s: string): string;
begin
  while (Length (s) > 0) and (s [1] = ' ') do
    Delete (s, 1, 1);

  result := s;
end;

function RightTrim (s: string): string;
begin
  while (Length (s) > 0) and (s [Length (s)] = ' ') do
    Delete (s, Length (s), 1);

  result := s;
end;

function Trim (s: string): string;
begin
  result := LeftTrim (RightTrim (s));
end;

function TryStrToInt (S: string; var n: integer): boolean;
var
  e: integer;
begin
  s      := Trim (s);
  result := s <> '';
  if not result then exit;

  Val (s, n, e);

  result := e = 0;
end;

function TryStrToFloat (S: string; var d: double): boolean;
var
  e: integer;
begin
  s      := Trim (s);
  result := s <> '';
  if not result then exit;

  Val (s, d, e);

  result := e = 0;
end;

function InRange (v, li, ls: integer): boolean;
begin
  result := (v >= li) and (v <= ls);
end;

function IsValidDate(const S: string): boolean;
var
  y, m, d: Integer;
const
  DAYS_OF_MONTH: array[1..12] of integer = (31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
  result := false;
  if length(S) <> 10 then Exit;

  if (S[3] <> '/') or (S[6] <> '/') then Exit;

  if not TryStrToInt(Copy(S, 7, 4), y) then Exit;
  if not TryStrToInt(Copy(S, 4, 2), m) then Exit;
  if not InRange(m, 1, 12) then Exit;
  if not TryStrToInt(Copy(S, 1, 2), d) then Exit;
  if not InRange(d, 1, DAYS_OF_MONTH[m]) then Exit;
  if (not IsLeapYear(y)) and (m = 2) and (d = 29) then Exit;
  result := true;
end;

function StringToDate (s: string): TDateTime;
var
  Day, Month, Year: word;
begin
  Day    := StrToInt (Copy (s, 1, 2));
  Month  := StrToInt (Copy (s, 4, 2));
  Year   := StrToInt (Copy (s, 7, 5));
  result := EncodeDate (Year, Month, Day);
end;

function ForzeStringToDate (s: string): TDateTime;
var
  Day, Month, Year: word;
begin
  Day    := StrToInt (Copy (s, 1, 2));
  Month  := StrToInt (Copy (s, 4, 2));
  Year   := StrToInt (Copy (s, 7, 5));

  //Esta función toma la fecha de excel y la forza al formato dd/mm/yyyy
  if (Day <= 12) and (Month <= 12) then
    result := EncodeDate (Year, Day, Month)
  else
    result := EncodeDate (Year, Month, Day)
end;

constructor TMetAcred.Create( AOwner : TComponent );
begin
  inherited;
  StpName         := ' ';
  UseQuery        := False;
  HelpFile        := 'IntMetPrueba.Hlp';
  ShowMenuReporte := True;
end;

destructor TMetAcred.Destroy;
begin
  inherited;
end;

function TMetAcred.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWMetAcred;
begin
   W := TWMetAcred.Create(Self);
   try
      W.Objeto                    := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

function TMetAcred.InternalBusca:Boolean;
var
  T: TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('INinguno.it','');

  try
    if Active then 
    begin
    end;

    if T.Execute then
      InternalBusca := FindKey([]);
  finally
    T.Free;
  end;
end;

function TMetAcred.Reporte:Boolean;
begin
  //Execute_Reporte();
end;

(***********************************************FORMA PRUEBA********************)
(*                                                                             *)
(*  FORMA DE PRUEBA                                                            *)
(*                                                                             *)
(***********************************************FORMA PRUEBA********************)


procedure TWMetAcred.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWMetAcred.InicializaQuerysYSPs;
begin
  qryMetodologia.Close;
  qryMetodologia.DatabaseName                             := Objeto.Apli.DataBaseName;
  qryMetodologia.SessionName                              := Objeto.Apli.SessionName;
  qryMetodologia.ParamByName ('peId_acreditado').AsString := IntToStr(Objeto.intPersona);
  qryMetodologia.Open;

  //Obtiene el número de persona del Acreditado
  qryPersona.Close;
  qryPersona.DatabaseName := Objeto.Apli.DataBaseName;
  qryPersona.SessionName  := Objeto.Apli.SessionName;
  qryPersona.ParamByName ('Id_Acreditado').AsString := IntToStr(Objeto.intPersona);
  qryPersona.Open;

  /// consulta para la carga de inf de garantias
  qryGarantias.Close;
  qryGarantias.DatabaseName                       := Objeto.Apli.DataBaseName;
  qryGarantias.SessionName                        := Objeto.Apli.SessionName;
  qryGarantias.ParamByName ('peTITULAR').AsString := IntToStr(Objeto.intPersona);
  qryGarantias.Open;

  //consulta para lista de metodologías
  QMetodologias.Close;
  QMetodologias.DatabaseName := Objeto.Apli.DataBaseName;
  QMetodologias.SessionName  := Objeto.Apli.SessionName;
  QMetodologias.Open;

  //Obtiene el id de la tabla referenciada
  QTablaReferenciada.Close;
  QTablaReferenciada.DatabaseName := Objeto.Apli.DataBaseName;
  QTablaReferenciada.SessionName  := Objeto.Apli.SessionName;
  QTablaReferenciada.Open;

  //Configura el Stored Procedure para actualizar la información de los contratos y proyectos de Anexo 19
  SPActCtoProyAnx19.Close;
  SPActCtoProyAnx19.DatabaseName   := Objeto.Apli.DataBaseName;
  SPActCtoProyAnx19.SessionName    := Objeto.Apli.SessionName;
  SPActCtoProyAnx19.StoredProcName := 'PKGCRCONSOLIDADO1.STP_ACT_PROY_CTO_ANX19';
  SPActCtoProyAnx19.Params.Clear;
  SPActCtoProyAnx19.Params.CreateParam (ftFloat,  'peFol_Contrato',    ptInput);
  SPActCtoProyAnx19.Params.CreateParam (ftFloat,  'peID_Contrato',     ptInput);
  SPActCtoProyAnx19.Params.CreateParam (ftFloat,  'peID_Proyecto',     ptInput);
  SPActCtoProyAnx19.Params.CreateParam (ftString, 'peCve_Metodologia', ptInput);
  SPActCtoProyAnx19.Params.CreateParam (ftString, 'peCve_Usu_Alta',    ptInput);
  SPActCtoProyAnx19.Params.CreateParam (ftDate,   'peFH_Alta',         ptInput);
  SPActCtoProyAnx19.Params.CreateParam (ftFloat,  'psError',           ptOutput);
  SPActCtoProyAnx19.Params.CreateParam (ftString, 'psMsgError',        ptOutput);

  //Inicializa el procedimiento para el alta de personas
  spAltaPersona.Close;
  spAltaPersona.DatabaseName   := Objeto.Apli.DataBaseName;
  spAltaPersona.SessionName    := Objeto.Apli.SessionName;
  spAltaPersona.StoredProcName := 'PKGCRADMINCOMERCIAL.STP_ALTA_PERSONA';
  spAltaPersona.Params.Clear;

  spAltaPersona.Params.CreateParam (ftFloat,    'peID_Persona',       ptInputOutput);
  spAltaPersona.Params.CreateParam (ftFloat,    'peID_Tabla_Referen', ptInput);
  spAltaPersona.Params.CreateParam (ftString,   'peDescripcion',      ptInput);
  spAltaPersona.Params.CreateParam (ftFloat,    'peID1',              ptInput);
  spAltaPersona.Params.CreateParam (ftFloat,    'peID2',              ptInput);
  spAltaPersona.Params.CreateParam (ftFloat,    'peID3',              ptInput);
  spAltaPersona.Params.CreateParam (ftString,   'peKey1',             ptInput);
  spAltaPersona.Params.CreateParam (ftString,   'peKey2',             ptInput);
  spAltaPersona.Params.CreateParam (ftString,   'peKey3',             ptInput);
  spAltaPersona.Params.CreateParam (ftDate,     'peDate1',            ptInput);
  spAltaPersona.Params.CreateParam (ftDate,     'peDate2',            ptInput);
  spAltaPersona.Params.CreateParam (ftDate,     'peDate3',            ptInput);
  spAltaPersona.Params.CreateParam (ftDate,     'peF_Vigente_Desde',  ptInput);
  spAltaPersona.Params.CreateParam (ftString,   'peSit_Persona',      ptInput);
  spAltaPersona.Params.CreateParam (ftString,   'peCve_Usu_Alta',     ptInput);
  spAltaPersona.Params.CreateParam (ftDateTime, 'peFH_Alta',          ptInput);
  spAltaPersona.Params.CreateParam (ftFloat,    'psError',            ptOutput);
  spAltaPersona.Params.CreateParam (ftString,   'psMsgError',         ptOutput);
end;

function TWMetAcred.ObtenIDPersona (ID_Acreditado: integer): integer;
begin
  result := -1;

  qryPersona.Close;
  qryPersona.ParamByName ('ID_Acreditado').AsInteger := ID_Acreditado;
  qryPersona.Open;

  if not qryPersona.Eof then
    result := qryPersona.FieldByName ('ID_Persona').AsInteger
  else
  begin
    LimpiaStoredProc (spAltaPersona);
    spAltaPersona.Prepare;
    spAltaPersona.ParamByName ('PEID_TABLA_REFEREN').AsInteger  := QTablaReferenciada.FieldByName ('ID_Tabla_Referen').AsInteger;
    spAltaPersona.ParamByName ('PEDESCRIPCION'     ).AsString   := Objeto.strNomPersona;
    spAltaPersona.ParamByName ('PEID1'             ).AsInteger  := ID_Acreditado;
    spAltaPersona.ParamByName ('PEF_VIGENTE_DESDE' ).AsDateTime := Objeto.Apli.DameFechaEmpresa;
    spAltaPersona.ParamByName ('PESIT_PERSONA'     ).AsString   := 'AC';
    spAltaPersona.ParamByName ('PECVE_USU_ALTA'    ).AsString   := Objeto.Apli.Usuario;
    spAltaPersona.ParamByName ('PEFH_ALTA'         ).AsDateTime := Objeto.Apli.DameFechaEmpresa;
    spAltaPersona.ExecProc;

    if spAltaPersona.ParamByName ('PSERROR').AsInteger = 0 then
    begin
      qryPersona.Close;
      qryPersona.ParamByName ('ID_Acreditado').AsInteger := ID_Acreditado;
      qryPersona.Open;

      if not qryPersona.Eof then
        result := -qryPersona.FieldByName ('ID_Persona').AsInteger
    end;
  end;
end;


procedure TWMetAcred.FormShow(Sender: TObject);
var
  Encontrado: boolean;
  Error, Row: integer;
  MsgError, strModelo: string;
  myDate : TDateTime;
  intMetPantAcred, PrimerModeloActivo, i: integer;
begin
  InicializaQuerysYSPs;

  if Objeto.Apli.MainForm is TwPrincipal then
    with Objeto.Apli.MainForm as TwPrincipal do
    begin
      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
    end;

  edtAcreditado.Text   := IntToStr(Objeto.intPersona);
  edtNombre.Text       := Objeto.strNomPersona;
  Objeto.intMetPersona := ObtenIDPersona (Objeto.intPersona); //  obtMetPersona(Objeto.intPersona);

  /// Actualiza la informacion de las garantias
  actualizaInformacion(AppModelo2.IDPersona);

  //Determina la metodología
  objeto.intAnexo      := qryMetodologiaANEXO.AsInteger;

  //Toma la metodología de la pantalla de Acreditado
  Val (Objeto.strCveMetPantAcred, intMetPantAcred, Error);

  //Determina los tabs visibles
  TabSheet1.Visible               := not (intMetPantAcred in [3, 6, 4]);
  TabSheet2.Visible               := not (intMetPantAcred in [3, 6, 4]);
  tsAnexo18.Visible               :=     (intMetPantAcred in [3, 6]);
//  tsAnexo19.Visible    := False;  //Para la liberación únicamente de Anexo 18, se desactiva el Anexo 19, cuando se libere Anexo 19 se descomenta la asignación.
  tsAnexo19.Visible               :=     (intMetPantAcred = 4);
  tabConsumoRevolvente.Visible    := True;
  TabSheet1.TabVisible            := not (intMetPantAcred in [3, 6, 4]);
  TabSheet2.TabVisible            := not (intMetPantAcred in [3, 6, 4]);
  tsAnexo18.TabVisible            :=     (intMetPantAcred in [3, 6]);
//  tsAnexo19.TabVisible := False;  //Para la liberación únicamente de Anexo 18, se desactiva el Anexo 19, cuando se libere Anexo 19 se descomenta la asignación.
  tsAnexo19.TabVisible            :=     (intMetPantAcred = 4);;
  tabConsumoRevolvente.TabVisible := True;

  {Modelo 1}
  if TabSheet1.TabVisible then
  begin
    Modelo1.Database  := Objeto.Apli.DataBase;
    Modelo1.ID_Modelo := Objeto.intAnexo;

    case Objeto.intAnexo of
      10 : strModelo := 'ANEXO20';
      2  : strModelo := 'ANEXO21';
      11 : strModelo := 'ANEXO22';
      else strModelo := 'ACREDIT_CARTCOMER';
    end;

    Modelo1.Cargar_Estructura_De_DB (strModelo, Error, MsgError);
    MyDate := StrToDate(obtMetPeriodoPersona(Objeto.intPersona, Modelo1.ID_Modelo));
    if Error <> 0 then
      MessageDlg (Format ('La información del catálogo no pudo cargarse, se generó el error #%d [%s]', [Error, MsgError]),
                  mtError, [mbOk], 0)
    else begin
      PageControl1.ActivePage       := TabSheet1;
      PageControl1.Pages[0].Caption := Modelo1.Descripcion;
      AppModelo1.Consultar (Objeto.intMetPersona, myDate, Encontrado);
    end;
    {//Modelo 1}
  end;

  {Modelo 2}
  if TabSheet2.TabVisible then
  begin
    Modelo2.Database := Objeto.Apli.DataBase;
    //Objeto.intMetPersona := obtMetPersona(Objeto.intPersona);
    Modelo2.ID_Modelo := 22;     ///Modelo generico para la SP

    Modelo2.Cargar_Estructura_De_DB ('GARANT_CARTCOMER', Error, MsgError);
    MyDate := StrToDate(obtMetPeriodoPersona(Objeto.intPersona, Modelo2.ID_Modelo));
    if Error <> 0 then
      MessageDlg (Format ('La información del catálogo no pudo cargarse, se generó el error #%d [%s]', [Error, MsgError]),
                  mtError, [mbOk], 0)
    else begin
      PageControl1.ActivePage       := TabSheet2;
      PageControl1.Pages[1].Caption := Modelo2.Descripcion;
      AppModelo2.Consultar (Objeto.intMetPersona, myDate, Encontrado);
    end;
  end;
  {//Modelo 2}

  {Anexo 18}
  if tsAnexo18.TabVisible then
  begin
    qryFechaVigente.Close;
    qryFechaVigente.DatabaseName                           := Objeto.Apli.DataBaseName;
    qryFechaVigente.SessionName                            := Objeto.Apli.SessionName;
    qryFechaVigente.ParamByName ('ID_Acreditado').AsString := IntToStr(Objeto.intPersona);
    qryFechaVigente.ParamByName ('Nombre_Modelo').AsString := 'ANEXO_18_2015';
    qryFechaVigente.Open;

    ModAnexo18.Database     := Objeto.Apli.DataBase;
    ModAnexo18.FechaEmpresa := Objeto.Apli.DameFechaEmpresa;
    ModAnexo18.Cve_Usuario  := Objeto.Apli.Usuario;
    ModAnexo18.Cargar_Estructura_De_DB ('ANEXO_18_2015', Error, MsgError);
    MyDate := StrToDate(obtMetPeriodoPersona(Objeto.intPersona, ModAnexo18.ID_Modelo));
    if Error <> 0 then
      MessageDlg (Format ('La información del catálogo no pudo cargarse, se generó el error #%d [%s]', [Error, MsgError]),
                  mtError, [mbOk], 0)
    else
    begin
      PageControl1.ActivePage       := tsAnexo18;
      PageControl1.Pages[2].Caption := ModAnexo18.Descripcion;
      AppModAnexo18.Consultar (Objeto.intMetPersona, qryFechaVigente.FieldByName ('Fecha').AsDateTime, Encontrado);

      //¿Qué ocurre si no lo encuentra?
      if not Encontrado then
      begin
      end;
    end;

    qSevPerdida.Close;
    qSevPerdida.DatabaseName                            := Objeto.Apli.DataBaseName;
    qSevPerdida.SessionName                             := Objeto.Apli.SessionName;
    qSevPerdida.ParamByName ('Id_Acreditado').AsInteger := Objeto.intPersona;
    qSevPerdida.Open;

    if qSevPerdida.RecordCount <> 0 Then
      sagSevPerdida.RowCount := qSevPerdida.RecordCount + 1
    else
      sagSevPerdida.RowCount := 2;

    edProbInc.Text := qSevPerdida.FieldByName('PI').AsString;
    for Row := 1 to qSevPerdida.RecordCount + 1  do
    begin
      sagSevPerdida.Cells [1, Row] := qSevPerdida.FieldByName('Id_Contrato').AsString;
      sagSevPerdida.Cells [2, Row] := qSevPerdida.FieldByName('SP').AsString;
      qSevPerdida.Next;
    end;
  end;
  {//Anexo 18}

  {Anexo 19}
  if tsAnexo19.TabVisible then
  begin
    qryFechaVigente.Close;
    qryFechaVigente.DatabaseName                           := Objeto.Apli.DataBaseName;
    qryFechaVigente.SessionName                            := Objeto.Apli.SessionName;
    qryFechaVigente.ParamByName ('ID_Acreditado').AsString := IntToStr(Objeto.intPersona);
    qryFechaVigente.ParamByName ('Nombre_Modelo').AsString := 'ANEXO_19_2015';
    qryFechaVigente.Open;

    ModAnexo19.Database     := Objeto.Apli.DataBase;
    ModAnexo19.FechaEmpresa := Objeto.Apli.DameFechaEmpresa;
    ModAnexo19.Cve_Usuario  := Objeto.Apli.Usuario;
    ModAnexo19.Cargar_Estructura_De_DB ('ANEXO_19_2015', Error, MsgError);
    MyDate := StrToDate(obtMetPeriodoPersona(Objeto.intPersona, ModAnexo19.ID_Modelo));
    if Error <> 0 then
      MessageDlg (Format ('La información del catálogo no pudo cargarse, se generó el error #%d [%s]', [Error, MsgError]),
                  mtError, [mbOk], 0)
    else
    begin
      PageControl1.ActivePage       := tsAnexo19;
      PageControl1.Pages[3].Caption := ModAnexo19.Descripcion;
      AppModAnexo19.Consultar (Objeto.intMetPersona, qryFechaVigente.FieldByName ('Fecha').AsDateTime, Encontrado);

      //¿Qué ocurre si no lo encuentra?
      if not Encontrado then
      begin
      end;
    end;

    QProyectosAnexo19.Close;
    QProyectosAnexo19.DatabaseName                            := Objeto.Apli.DataBaseName;
    QProyectosAnexo19.SessionName                             := Objeto.Apli.SessionName;
    QProyectosAnexo19.ParamByName ('Id_Acreditado').AsInteger := Objeto.intPersona;
    QProyectosAnexo19.Open;

    QContratosAnexo19.Close;
    QContratosAnexo19.DatabaseName                            := Objeto.Apli.DataBaseName;
    QContratosAnexo19.SessionName                             := Objeto.Apli.SessionName;
    QContratosAnexo19.ParamByName ('Id_Acreditado').AsInteger := Objeto.intPersona;
    QContratosAnexo19.Open;

    ActualizaContratosAnexo19;
  end;
  {//Anexo 19}

  {Consumo revolvente}
  if tabConsumoRevolvente.TabVisible then
  begin
    qryFechaVigente.Close;
    qryFechaVigente.DatabaseName                           := Objeto.Apli.DataBaseName;
    qryFechaVigente.SessionName                            := Objeto.Apli.SessionName;
    qryFechaVigente.ParamByName ('ID_Acreditado').AsString := IntToStr(Objeto.intPersona);
    qryFechaVigente.ParamByName ('Nombre_Modelo').AsString := 'CONSUMO_REVOLVENTE';
    qryFechaVigente.Open;

    ModConsumoRevolvente.Database     := Objeto.Apli.DataBase;
    ModConsumoRevolvente.FechaEmpresa := Objeto.Apli.DameFechaEmpresa;
    ModConsumoRevolvente.Cve_Usuario  := Objeto.Apli.Usuario;
    ModConsumoRevolvente.Cargar_Estructura_De_DB ('CONSUMO_REVOLVENTE', Error, MsgError);
    MyDate := StrToDate(obtMetPeriodoPersona(Objeto.intPersona, ModConsumoRevolvente.ID_Modelo));
    if Error <> 0 then
      MessageDlg (Format ('La información del catálogo no pudo cargarse, se generó el error #%d [%s]', [Error, MsgError]),
                  mtError, [mbOk], 0)
    else
    begin
      PageControl1.ActivePage       := tabConsumoRevolvente;
      PageControl1.Pages[4].Caption := ModConsumoRevolvente.Descripcion;
      AppModConsumoRevolvente.Consultar (Objeto.intMetPersona, qryFechaVigente.FieldByName ('Fecha').AsDateTime, Encontrado);

      //¿Qué ocurre si no lo encuentra?
      if not Encontrado then
      begin
      end;
    end;
  end;
  {//Consumo revolvente}

//  PageControl1.ActivePageIndex := 0;

  //Determina el primer modelo activo y se posiciona en esa pestaña
  PrimerModeloActivo := -1;
  if      AppModelo1.ModeloID <> 0 then
    PrimerModeloActivo := 0
  else if AppModelo2.ModeloID <> 0 then
    PrimerModeloActivo := 1
  else if AppModAnexo18.ModeloID <> 0 then
    PrimerModeloActivo := 2
  else if AppModAnexo19.ModeloID <> 0 then
    PrimerModeloActivo := 3
  else if AppModConsumoRevolvente.ModeloID <> 0 then
    PrimerModeloActivo := 4;

  if PrimerModeloActivo <> -1 then
    PageControl1.ActivePageIndex := PrimerModeloActivo;

  ActivaBotones( PageControl1 );

  //Oculta las páginas que no estén activas
  TabSheet1.TabVisible            := AppModelo1.ModeloID <> 0;
  TabSheet2.TabVisible            := AppModelo2.ModeloID <> 0;
  tsAnexo18.TabVisible            := AppModAnexo18.ModeloID <> 0;
  tsAnexo19.TabVisible            := AppModAnexo19.ModeloID <> 0;
  tabConsumoRevolvente.TabVisible := AppModConsumoRevolvente.ModeloID <> 0;
end;

procedure TWMetAcred.ActualizaContratosAnexo19;
begin
  MemContratosAnexo19.Tag := 1;
  dbgAnexo19.ReadOnly     := False;
  QContratosAnexo19.Close;
  QContratosAnexo19.Open;
  QProyectosAnexo19.Close;
  QProyectosAnexo19.Open;

  MemContratosAnexo19.DisableControls;
  MemContratosAnexo19.Close;
  MemContratosAnexo19.EmptyTable;
  MemContratosAnexo19.Open;

  QContratosAnexo19.First;
  while not QContratosAnexo19.Eof do
  begin
    MemContratosAnexo19.Append;
    MemContratosAnexo19.FieldByName ('Fol_Contrato'   ).AsInteger := QContratosAnexo19.FieldByName ('Fol_Contrato'   ).AsInteger;
    MemContratosAnexo19.FieldByName ('ID_Contrato'    ).AsInteger := QContratosAnexo19.FieldByName ('ID_Contrato'    ).AsInteger;
    MemContratosAnexo19.FieldByName ('Cve_Metodologia').AsString  := QContratosAnexo19.FieldByName ('Cve_Metodologia').AsString;

    if QContratosAnexo19.FieldByName ('ID_Proyecto').AsInteger <> 0 then
      MemContratosAnexo19.FieldByName ('ID_Proyecto').AsInteger := QContratosAnexo19.FieldByName ('ID_Proyecto').AsInteger;

    MemContratosAnexo19.Post;
    QContratosAnexo19.Next;
  end;
  MemContratosAnexo19.First;
  MemContratosAnexo19.EnableControls;
  dbgAnexo19.ReadOnly     := True;
  MemContratosAnexo19.Tag := 0;
end;

procedure TWMetAcred.SalvaContratosAnexo19;
var
  i, Errores: integer;
begin
  Errores := 0;
  try
    try
      MemContratosAnexo19.DisableControls;
      MemContratosAnexo19.First;

      while not MemContratosAnexo19.Eof do
      begin
        //Limpia los parámetros de entrada
        LimpiaStoredProc (SPActCtoProyAnx19);

        SPActCtoProyAnx19.Prepare;
        SPActCtoProyAnx19.ParamByName ('peFol_Contrato'   ).AsInteger := MemContratosAnexo19.FieldByName ('Fol_Contrato'   ).AsInteger;
        SPActCtoProyAnx19.ParamByName ('peID_Contrato'    ).AsInteger := MemContratosAnexo19.FieldByName ('ID_Contrato'    ).AsInteger;
        SPActCtoProyAnx19.ParamByName ('peCve_Metodologia').AsString  := MemContratosAnexo19.FieldByName ('Cve_Metodologia').AsString;
        SPActCtoProyAnx19.ParamByName ('peCve_Usu_Alta'   ).AsString  := Objeto.Apli.Usuario;
        SPActCtoProyAnx19.ParamByName ('peFH_Alta'        ).AsDate    := Objeto.Apli.DameFechaEmpresa;

        if MemContratosAnexo19.FieldByName ('ID_Proyecto').AsInteger > 0 then
          SPActCtoProyAnx19.ParamByName ('peID_Proyecto').AsInteger := MemContratosAnexo19.FieldByName ('ID_Proyecto').AsInteger;

        SPActCtoProyAnx19.ExecProc;

        Inc (Errores, Ord (SPActCtoProyAnx19.ParamByName ('psError').AsInteger <> 0));

        MemContratosAnexo19.Next;
      end;
    except
    end
  finally
    MemContratosAnexo19.EnableControls;
    if Errores = 0 then
      MessageDlg ('Salvado de la información de Contratos y Proyectos exitosa!!!', mtInformation, [mbOk], 0)
    else
      MessageDlg ('Se presentaron errores en el salvado de la información de Contratos y Proyectos. Favor de contactar al área de TI', mtError, [mbOk], 0);
  end;
end;

// Obtenemos el id de la persona que le corresponde dentro del modelo
{function TWMetAcred.obtMetPersona(intPersona: integer): integer;
var
  strSQL : string;
  intMetPersona : integer;
begin
  strSQL := 'select ID_PERSONA from CR_MET_PERSONA where 2 = 2 and ID1 = ' + IntToStr(objeto.intPersona);
  GetSQLInt(strSQL,Objeto.DataBaseName,objeto.SessionName,'ID_PERSONA',intMetPersona,false);
  Result := intMetPersona;
end;}

function TWMetAcred.obtMetPeriodoPersona(intPersona, intModelo : integer): string;
var
  strSQL, periodo, resultado : string;
begin
  strSQL := 'select max(periodo) as Periodo from CR_MET_VALOR_VAR where 2 = 2 ' +
    ' and id_modelo = ' + IntToStr(intModelo) + ' and id_persona = ' +
        IntToStr(Objeto.intMetPersona);
  GetSQLStr(strSQL,Objeto.DataBaseName,objeto.SessionName,'Periodo',periodo,false);
  if trim(periodo) = '' then
    periodo := FormatDateTime('dd/mm/yy', Now);
  Result := periodo;
end;

procedure TWMetAcred.AppModeloBtnAceptar(AppModelo: TAppModelo);
var
  Error, ID: integer;
  MsgError: string;
  myDate : TDateTime;
begin
  MyDate := StrToDate(obtMetPeriodoPersona(Objeto.intPersona, AppModelo.Modelo.ID_Modelo));
  Val (IntToStr(Objeto.intMetPersona), ID, Error);
  if Error <> 0 then
  begin
    MessageDlg (Format ('El identificador de persona [%d] no es válido.', [ID]), mtError, [mbOk], 0);
    exit;
  end;

  AppModelo.IDPersona := ID;
  AppModelo.Periodo   := MyDate;
  AppModelo.Aceptar (Error, MsgError);

  if Error = 0 then
    MessageDlg ('Información salvada con éxito!', mtInformation, [mbOk], 0)
  else
    MessageDlg (Format ('Se presentaron errores al salvar la información: Error (%d) "%s"', [Error, MsgError]), mtError, [mbOk], 0);
end;

procedure TWMetAcred.AppModelo1BtnAceptar(Sender: TObject);
begin
  AppModeloBtnAceptar (AppModelo1);
end;

procedure TWMetAcred.AppModelo2BtnAceptar(Sender: TObject);
begin
  AppModeloBtnAceptar (AppModelo2);
end;

procedure TWMetAcred.AppModAnexo18BtnAceptar(Sender: TObject);
begin
  AppModeloBtnAceptar (AppModAnexo18);
end;

procedure TWMetAcred.AppModAnexo19BtnAceptar(Sender: TObject);
begin
  AppModeloBtnAceptar (AppModAnexo19);
  ActualizaContratosAnexo19;
end;


{Modelo 1}
procedure TWMetAcred.AppModelo1BtnBuscar(Sender: TObject);
{var
  Encontrado: boolean;
  Error, ID: integer;}
begin
{  if EPersona.Text = '' then exit;

  Val ('1', ID, Error);
  if Error <> 0 then
  begin
    MessageDlg (Format ('El identificador de persona [%d] no es válido.', [ID]), mtError, [mbOk], 0);
    exit;
  end;
  AppModelo1.Consultar (ID, dpFecha.Date, Encontrado);

  if not Encontrado then
    MessageDlg ('No existe información para la persona y fecha especificada. Favor de verificar los datos.', mtError, [mbOk], 0);
}
end;

procedure TWMetAcred.AppModelo1Validacion(AppModelo: TAppModelo;
  Bloque: TAppModeloBloque; Columna: TAppModeloDefColumna;
  var InfoValida: Boolean; var MsgError: String);
{var
  e: integer;
  f: double;}
begin
{  if Modelo1.Nombre = 'ANEXO20' then
  begin
    if (Bloque.Nombre = 'SECCION_CUANTITATIVO_FINANCIERO') and (Columna.Nombre = 'ACTIVOTOTAL_20') then
    begin
      if Columna.AsString <> '' then
      begin
        Val (Columna.AsString, f, e);
        if e <> 0 then
        begin
          InfoValida := False;
          MsgError   := 'El valor debe ser numérico';
        end;
      end;
    end;
  end;}
end;

procedure TWMetAcred.AppModelo1CalcularCampos(AppModelo: TAppModelo;
  AppDataSet: TAppModeloDataSet);
begin
{
  if Modelo2.Nombre = 'GARANT_CARTCOMER' then
  begin
    if (AppDataSet.ObtenBloque ('GARANT_DETALLE') <> nil  )
      and (AppDataSet.ObtenBloque ('GARANT_DETALLE').ObtenColumna ('GARANT_VENCIMIENTO') <> nil ) then
        ShowMessage(AppDataSet.ObtenBloque('GARANT_DETALLE').ObtenColumna('GARANT_VENCIMIENTO').AsString);
        //AppDataSet.ObtenBloque ('GARANT_DETALLE').ObtenColumna ('GARANT_VENCIMIENTO').AsString :=   Now;
  end;
}
end;

procedure TWMetAcred.AppModelo1ActualizaBotones(Sender: TObject;
  BotonesActivos: TBotonesAppModelo);
begin
//  btnPersona.Enabled := bamConsultar in BotonesActivos;
end;

procedure TWMetAcred.btnPersonaClick(Sender: TObject);
{var
  T: TInterFindit;}
begin
{  T := Objeto.CreaBuscador ('ICRPERVPREV.IT', 'F');
  try
    if AppModelo1.IDPersona <> 0 then
      T.Param (0, IntToStr (AppModelo1.IDPersona));

    if T.Execute then
    begin
      EPersona.Text     := T.DameCampo (0);
      EDescripcion.Text := T.DameCampo (1);
    end;
  finally
    T.Free;
  end;}
end;

{Modelo 2}
procedure TWMetAcred.AppModelo2CalcularCampos(AppModelo: TAppModelo;
  AppDataSet: TAppModeloDataSet);
begin
{
  if Modelo2.Nombre = 'GARANT_CARTCOMER' then
  begin
    if (AppDataSet.ObtenBloque ('GARANT_DETALLE') <> nil  )
      and (AppDataSet.ObtenBloque ('GARANT_DETALLE').ObtenColumna ('GARANT_VENCIMIENTO') <> nil ) then
        ShowMessage(AppDataSet.ObtenBloque('GARANT_DETALLE').ObtenColumna('GARANT_VENCIMIENTO').AsString);
        //AppDataSet.ObtenBloque ('GARANT_DETALLE').ObtenColumna ('GARANT_VENCIMIENTO').AsString :=   Now;
  end;
}
end;

procedure TWMetAcred.PageControl1Change(Sender: TObject);
begin
  ActivaBotones( (Sender as TPageControl) );
end;

procedure TWMetAcred.ActivaBotones(pgAnexos: TPageControl);
begin
  case pgAnexos.ActivePageIndex of
    0 : begin
          AppModelo1.DesplegarBotonesInterformas;
          AppModelo2.OcultarBotonesInterformas;
          AppModAnexo18.OcultarBotonesInterformas;
          AppModAnexo19.OcultarBotonesInterformas;
          AppModConsumoRevolvente.OcultarBotonesInterformas;
          lblPeriodo.Caption := 'Periodo : ' + FormatDateTime('ddddd', AppModelo1.Periodo);
        end;
    1 : begin
          AppModelo2.DesplegarBotonesInterformas;
          AppModelo1.OcultarBotonesInterformas;
          AppModAnexo18.OcultarBotonesInterformas;
          AppModAnexo19.OcultarBotonesInterformas;
          AppModConsumoRevolvente.OcultarBotonesInterformas;
          lblPeriodo.Caption := 'Periodo : '  + FormatDateTime('ddddd', AppModelo2.Periodo);
        end;
    2 : begin
          AppModAnexo18.DesplegarBotonesInterformas;
          AppModelo1.OcultarBotonesInterformas;
          AppModelo2.OcultarBotonesInterformas;
          AppModAnexo19.OcultarBotonesInterformas;
          AppModConsumoRevolvente.OcultarBotonesInterformas;
          lblPeriodo.Caption := 'Periodo : ' + FormatDateTime('ddddd', AppModAnexo18.Periodo);
        end;
    3 : begin
          AppModAnexo19.DesplegarBotonesInterformas;
          AppModelo1.OcultarBotonesInterformas;
          AppModelo2.OcultarBotonesInterformas;
          AppModAnexo18.OcultarBotonesInterformas;
          AppModConsumoRevolvente.OcultarBotonesInterformas;
          lblPeriodo.Caption := 'Periodo : ' + FormatDateTime('ddddd', AppModAnexo19.Periodo);
        end;
    4 : begin
          AppModAnexo19.OcultarBotonesInterformas;
          AppModelo1.OcultarBotonesInterformas;
          AppModelo2.OcultarBotonesInterformas;
          AppModAnexo18.OcultarBotonesInterformas;
          AppModConsumoRevolvente.DesplegarBotonesInterformas;
          lblPeriodo.Caption := 'Periodo : ' + FormatDateTime('ddddd', AppModConsumoRevolvente.Periodo);
        end;
  end;
end;

procedure TWMetAcred.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange :=  not (AppModelo1.Estado              in [emInsertado, emEditado]) and not (AppModelo2.Estado    in [emInsertado, emEditado]) and
                  not (AppModAnexo18.Estado           in [emInsertado, emEditado]) and not (AppModAnexo19.Estado in [emInsertado, emEditado]) and
                  not (AppModConsumoRevolvente.Estado in [emInsertado, emEditado])
end;


procedure TWMetAcred.actualizaInformacion(iPersona : integer);

  //---
  procedure actualizaFecha(vlFecha, vlModelo, vlTitular, vlVariable, vlRepeticion : string);
  begin
    try
      with qryFecha do
      begin
        Close;
        DatabaseName                           := Objeto.Apli.DataBaseName;
        SessionName                            := Objeto.Apli.SessionName;
        ParamByName ('peFecha').AsString       := vlFecha;
        ParamByName ('peModelo').AsString      := vlModelo;
        ParamByName ('peTitular').AsString     := vlTitular;
        ParamByName ('peVariable').AsString    := vlVariable;
        ParamByName ('peRepeticion').AsString  := vlRepeticion;
        ExecSQL;
      end;
    except

    end;
  end;
  //--- actualizaFecha

  //---
  procedure actualizaNumerico(vlNumerico : Double; vlModelo, vlTitular, vlVariable, vlRepeticion : string);
  begin
    try
      with qryNumerico do
      begin
        Close;
        DatabaseName                           := Objeto.Apli.DataBaseName;
        SessionName                            := Objeto.Apli.SessionName;
        ParamByName ('peNumerico').AsFloat    := vlNumerico;
        ParamByName ('peModelo').AsString      := vlModelo;
        ParamByName ('peTitular').AsString     := vlTitular;
        ParamByName ('peVariable').AsString    := vlVariable;
        ParamByName ('peRepeticion').AsString  := vlRepeticion;
        ExecSQL;
      end;
    except

    end;
  end;
  //--- actualizaNumerico

  //---
  procedure actualizaCadena(vlCadena, vlModelo, vlTitular, vlVariable, vlRepeticion : string);
  begin
    try
      with qryCadena do
      begin
        Close;
        DatabaseName                           := Objeto.Apli.DataBaseName;
        SessionName                            := Objeto.Apli.SessionName;
        ParamByName ('peCadena').AsString      := vlCadena;
        ParamByName ('peModelo').AsString      := vlModelo;
        ParamByName ('peTitular').AsString     := vlTitular;
        ParamByName ('peVariable').AsString    := vlVariable;
        ParamByName ('peRepeticion').AsString  := vlRepeticion;
        ExecSQL;
      end;
    except

    end;
  end;
  //--- actualizaCadena

var
  Error : integer;
begin

  while not qryGarantias.Eof do
  begin

    qryDetalle.Close;
    qryDetalle.DatabaseName                           := Objeto.Apli.DataBaseName;
    qryDetalle.SessionName                            := Objeto.Apli.SessionName;
    qryDetalle.ParamByName ('peTITULAR').AsString     := IntToStr(Objeto.intPersona);
    qryDetalle.ParamByName ('peEmisora').AsString     := qryGarantiasEMISORA.AsString;
    qryDetalle.Open;

    actualizaFecha(qryGarantiasF_VENCIMIENTO.AsString, qryDetalleID_MODELO.AsString, qryDetalleID_PERSONA.AsString,
      'GARANT_VENCIMIENTO', qryDetalleNO_REPETICION.AsString);
    actualizaNumerico(qryGarantiasT_IMP_VALUACION.AsFloat, qryDetalleID_MODELO.AsString, qryDetalleID_PERSONA.AsString,
      'MOTO_GARANT_REAL', qryDetalleNO_REPETICION.AsString);
    actualizaCadena(qryGarantiasGUBERNAMENTAL.AsString, qryDetalleID_MODELO.AsString, qryDetalleID_PERSONA.AsString,
      'GARANT_EMISOR', qryDetalleNO_REPETICION.AsString);

    //ShowMessage(qryGarantiasEMISORA.AsString);

    qryGarantias.Next;
  end;
end;

procedure TWMetAcred.btnGenerarLayoutAnexo18Click(Sender: TObject);
begin
  if Objeto.ValidaAccesoEsp('TMETACRED_A18GL', True, True) then
  begin
    if SaveDlgLayoutAnexo18.FileName = '' then
      SaveDlgLayoutAnexo18.FileName := 'LayoutAnexo18.xls';

    if SaveDlgLayoutAnexo18.Execute then
    begin
      if SalvaLayoutAnexo18XLS (SaveDlgLayoutAnexo18.FileName) then
      begin
        if MessageDlg ('¡Layout de Anexo 18 generado exitosamente!. ¿Deseas abrir el archivo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          ShellExecute(Self.WindowHandle, 'open', PChar(SaveDlgLayoutAnexo18.FileName), nil, nil, SW_SHOWNORMAL);
      end
      else
        MessageDlg ('Hubo un problema en la generación del Layout para Anexo 18', mtError, [mbOk], 0);
    end;
  end;
end;

function TWMetAcred.SalvaLayoutAnexo18XLS (FileName: string): boolean;
var
  XLApp, Sheet: Variant;
  Col: integer;
  s: string;
begin
  result := False;

  //Actualiza la información
  qryGenerarLayoutAnexo18.Close;
  qryGenerarLayoutAnexo18.DatabaseName := Objeto.Apli.DataBaseName;
  qryGenerarLayoutAnexo18.SessionName  := Objeto.Apli.SessionName;
  qryGenerarLayoutAnexo18.Open;

  //Crea la aplicación
  XLApp := CreateOleObject('Excel.Application');
  try
    try
      XLApp.Visible := False;
      XLApp.Workbooks.Add(xlWBatWorkSheet);
      Sheet              := XLApp.WorkBooks[1].Worksheets[1];
      Sheet.Name         := 'Anexo 18';
      Sheet.Cells [1, 1] := 'ID_Acreditado';
      Sheet.Cells [1, 2] := 'F_Vigente_Desde';
      Sheet.Cells [1, 1].AddComment ('ID del Acreditado');
      Sheet.Cells [1, 2].AddComment ('Fecha de Inicio de Vigencia. Formato dd/mm/yyyy');

      Col := 2;
      while not qryGenerarLayoutAnexo18.Eof do
      begin
        Inc (Col);
        s := qryGenerarLayoutAnexo18.FieldByName ('Descripcion').AsString;
        if Pos ('DATE', qryGenerarLayoutAnexo18.FieldByName ('Tipo_Dato').AsString) > 0 then
          s := s + ' Formato dd/mm/yyyy';

        Sheet.Cells [1, Col] := qryGenerarLayoutAnexo18.FieldByName ('Nombre').AsString;
        Sheet.Cells [1, Col].AddComment (s);

        qryGenerarLayoutAnexo18.Next;
      end;
      Sheet.Rows [1].Font.Bold := True;
      Sheet.UsedRange.EntireColumn.Autofit;
      Sheet.Cells [2, 3].Select;
      XLApp.ActiveWindow.FreezePanes := True;
      Sheet.Cells [1, 1].Select;
    except
    end;
  finally
    XLApp.Workbooks[1].SaveAs (FileName);
    XLApp.Quit;
    XLApp  := Unassigned;
    Sheet  := Unassigned;
    result := True;
  end;
end;

procedure TWMetAcred.btnExportarAnexo18Click(Sender: TObject);
begin
  if Objeto.ValidaAccesoEsp('TMETACRED_A18XLS', True, True) then
  begin
    if SaveDlgExportAnexo18XLS.FileName = '' then
      SaveDlgExportAnexo18XLS.FileName := Format ('Anexo18_%s.xls', [FormatDateTime ('YYYYMMDD', Now)]);

    if SaveDlgExportAnexo18XLS.Execute then
    begin
      if ExportaAnexo18XLS (SaveDlgExportAnexo18XLS.FileName) then
      begin
        if MessageDlg ('¡Información vigente de Anexo 18 generado exitosamente!. ¿Deseas abrir el archivo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          ShellExecute(Self.WindowHandle, 'open', PChar(SaveDlgExportAnexo18XLS.FileName), nil, nil, SW_SHOWNORMAL);
      end
      else
        MessageDlg ('Hubo un problema en la generación del Layout para Anexo 18', mtError, [mbOk], 0);
    end;
  end;
end;

function TWMetAcred.ExportaAnexo18XLS (FileName: string): boolean;
var
  XLApp, Sheet: Variant;
  Col, Row: integer;
  s: string;
begin
  result := False;

  //Actualiza la información
  qryExportAnexo18XLS.Close;
  qryExportAnexo18XLS.DatabaseName := Objeto.Apli.DataBaseName;
  qryExportAnexo18XLS.SessionName  := Objeto.Apli.SessionName;
  qryExportAnexo18XLS.Open;

  //Crea la aplicación
  XLApp := CreateOleObject('Excel.Application');
  try
    try
      XLApp.Visible := False;
      XLApp.Workbooks.Add(xlWBatWorkSheet);
      Sheet              := XLApp.WorkBooks[1].Worksheets[1];
      Sheet.Name         := 'Anexo 18';

      for Col := 0 to qryExportAnexo18XLS.FieldDefs.Count - 1 do
        Sheet.Cells [1, Col + 1] := qryExportAnexo18XLS.FieldDefs.Items [Col].Name;

      Row := 2;
      while not qryExportAnexo18XLS.Eof do
      begin
        for Col := 0 to qryExportAnexo18XLS.FieldDefs.Count - 1 do
          case qryExportAnexo18XLS.FieldDefs.Items [Col].DataType of
            ftDateTime: Sheet.Cells [Row, Col + 1] := FormatDateTime ('mm/dd/yyyy', qryExportAnexo18XLS.Fields [Col].AsDateTime);
            ftString:   Sheet.Cells [Row, Col + 1] := qryExportAnexo18XLS.Fields [Col].AsString;
            ftInteger:  Sheet.Cells [Row, Col + 1] := qryExportAnexo18XLS.Fields [Col].AsInteger;
            ftFloat:    Sheet.Cells [Row, Col + 1] := qryExportAnexo18XLS.Fields [Col].AsFloat;
          end;

        qryExportAnexo18XLS.Next;
        Inc (Row);
      end;

      Sheet.Rows [1].Font.Bold := True;
      Sheet.UsedRange.EntireColumn.Autofit;
      Sheet.Cells [2, 3].Select;
      XLApp.ActiveWindow.FreezePanes := True;
      Sheet.Cells [1, 1].Select;
    except
    end;
  finally
    XLApp.Workbooks[1].SaveAs (FileName);
    XLApp.Quit;
    XLApp  := Unassigned;
    Sheet  := Unassigned;
    result := True;
  end;
end;

procedure TWMetAcred.btnCargarAnexo18Click(Sender: TObject);
begin
  if Objeto.ValidaAccesoEsp('TMETACRED_A18CM', True, True) and OpenDlgCargaMasivaAnexo18.Execute then
    CargaMasivaAnexo18XLS (OpenDlgCargaMasivaAnexo18.FileName);
end;

procedure TWMetAcred.LimpiaStoredProc (SP: TStoredProc);
var
  i: integer;
begin
  SP.Close;
  for i := 0 to SP.ParamCount - 1 do
    if SP.Params [i].ParamType in [ptInput, ptInputOutput] then
      SP.Params [i].Clear;
end;

procedure TWMetAcred.CargaMasivaAnexo18XLS (FileName: string);
var
  qryModelo: TQuery;
  spLimpiaModelo, spValorVariable, spAltaModelo: TStoredProc;
  XLApp, Sheet: Variant;
  Row, IDPersona, Error: integer;
  HuboErrores: boolean;
  MsgError: string;

  procedure GuardaValorVar (Variable: string; Tipo: Char; Valor: Variant);
  var
    v: TVariable;
    d: double;
    f: TDate;
    s: string;
  begin
    s := Trim (Valor);
    v := ModAnexo18.ObtenVariable (Variable);
    if Assigned (v) and (s <> '') then
    begin
      LimpiaStoredProc (spValorVariable);
      spValorVariable.ParamByName ('peID_Nodo'          ).AsInteger := qryModelo.FieldByName ('ID_Nodo').AsInteger;
      spValorVariable.ParamByName ('peID_Variable'      ).AsInteger := v.ID_Variable;
      spValorVariable.ParamByName ('peNo_Repeticion'    ).AsInteger := 1;
      spValorVariable.ParamByName ('peNo_Rep_Nodo_Padre').AsInteger := 1;

      case Tipo of
        'N': begin
          if TryStrToFloat (Valor, d) then
            spValorVariable.ParamByName ('peValor_Numerico').AsFloat := d
          else
          begin
            HuboErrores := True;
            LogAnexo18 (Format ('Acreditado [%s], Variable [%s], ID: [%d]. Error en la conversión a numérico: [%s]', [Sheet.Cells [Row, 1], Variable, v.ID_Variable, Valor]));
          end
        end;
        'F': begin
          if IsValidDate (Valor) then
            spValorVariable.ParamByName ('peValor_Fecha').AsDate := ForzeStringToDate (Valor)
          else
          begin
            HuboErrores := True;
            LogAnexo18 (Format ('Acreditado [%s], Variable [%s], ID: [%d]. Error en la conversión a fecha: [%s]', [Sheet.Cells [Row, 1], Variable, v.ID_Variable, Valor]));
          end;
        end;
        'S': spValorVariable.ParamByName ('peValor_Cadena').AsString := Valor;
      end;
      spValorVariable.ExecProc;
    end
    else
    begin
      if not Assigned (v) then
        LogAnexo18 (Format ('      Variable [%s], No encontrada', [Variable]))
    end;
  end;

  procedure SalvaInformacionAcreditado;
  var
    s: string;
    FVigenteDesde: TDate;
  begin
    s := Trim (Sheet.Cells [Row, coF_Vigente_Desde]);
    if (s <> '') and IsValidDate (s) then
    begin
      FVigenteDesde := ForzeStringToDate (s);
      spLimpiaModelo.ExecProc;
      GuardaValorVar ('ANX18_PCT_PGO_TIEM_INS_BAN',     'N', Sheet.Cells [Row, coPct_Pgo_Tiem_Ins_Ban]);
      GuardaValorVar ('ANX18_PCT_PGO_TIEM_INS_NBAN',    'N', Sheet.Cells [Row, coPct_Pgo_Tiem_Ins_Nban]);
      GuardaValorVar ('ANX18_DIAS_MORA_PROM_INS_BAN',   'N', Sheet.Cells [Row, coDias_Mora_Prom_Ins_Ban]);
      GuardaValorVar ('ANX18_IMP_DEUDA_CORTO_PLZ',      'S', Sheet.Cells [Row, coImp_Deuda_Corto_Plz]);
      GuardaValorVar ('ANX18_IMP_DEUDA_TOTAL',          'S', Sheet.Cells [Row, coImp_Deuda_Total]);
      GuardaValorVar ('ANX18_F_INF_BURO',               'F', Sheet.Cells [Row, coF_Inf_Buro]);
      GuardaValorVar ('ANX18_IMP_SERV_PERSONALES',      'S', Sheet.Cells [Row, coImp_Serv_Personales]);
      GuardaValorVar ('ANX18_IMP_MATERIALES_SUMIN',     'S', Sheet.Cells [Row, coImp_Materiales_Sumin]);
      GuardaValorVar ('ANX18_IMP_SERVICIOS_GRALES',     'S', Sheet.Cells [Row, coImp_Servicios_Grales]);
      GuardaValorVar ('ANX18_IMP_SUBS_TRANSF_AYUD',     'S', Sheet.Cells [Row, coImp_Subs_Transf_Ayud]);
      GuardaValorVar ('ANX18_IMP_ADQ_BIE_MUE_INMUE',    'S', Sheet.Cells [Row, coImp_Adq_Bie_Mue_Inmue]);
      GuardaValorVar ('ANX18_IMP_OBRAS_PUBLICAS',       'S', Sheet.Cells [Row, coImp_Obras_Publicas]);
      GuardaValorVar ('ANX18_IMP_INVERSION',            'S', Sheet.Cells [Row, coImp_Inversion]);
      GuardaValorVar ('ANX18_IMP_APLIC_REC_FED_EST',    'S', Sheet.Cells [Row, coImp_Aplic_Rec_Fed_Est]);
      GuardaValorVar ('ANX18_IMP_OTROS_EGRESOS',        'S', Sheet.Cells [Row, coImp_Otros_Egresos]);
      GuardaValorVar ('ANX18_IMP_POR_CTA_3ROS_EGR',     'S', Sheet.Cells [Row, coImp_Por_Cta_3Ros_Egr]);
      GuardaValorVar ('ANX18_IMP_DEUDA_PUBLICA',        'S', Sheet.Cells [Row, coImp_Deuda_Publica]);
      GuardaValorVar ('ANX18_IMP_DISPONIB_FINAL',       'S', Sheet.Cells [Row, coImp_Disponib_Final]);
      GuardaValorVar ('ANX18_IMP_IMPUESTOS',            'S', Sheet.Cells [Row, coImp_Impuestos]);
      GuardaValorVar ('ANX18_IMP_DERECHOS',             'S', Sheet.Cells [Row, coImp_Derechos]);
      GuardaValorVar ('ANX18_IMP_PRODUCTOS',            'S', Sheet.Cells [Row, coImp_Productos]);
      GuardaValorVar ('ANX18_IMP_APROVECHAMIENTOS',     'S', Sheet.Cells [Row, coImp_Aprovechamientos]);
      GuardaValorVar ('ANX18_IMP_CONTRIB_MEJORA',       'S', Sheet.Cells [Row, coImp_Contrib_Mejora]);
      GuardaValorVar ('ANX18_IMP_PARTICIP_FED_EST',     'S', Sheet.Cells [Row, coImp_Particip_Fed_Est]);
      GuardaValorVar ('ANX18_IMP_APORT_FED_EST',        'S', Sheet.Cells [Row, coImp_Aport_Fed_Est]);
      GuardaValorVar ('ANX18_IMP_OTROS_INGRESOS',       'S', Sheet.Cells [Row, coImp_Otros_Ingresos]);
      GuardaValorVar ('ANX18_IMP_POR_CTA_3ROS_ING',     'S', Sheet.Cells [Row, coImp_Por_Cta_3Ros_Ing]);
      GuardaValorVar ('ANX18_IMP_FINANCIAMIENTO',       'S', Sheet.Cells [Row, coImp_Financiamiento]);
      GuardaValorVar ('ANX18_IMP_DISPONIB_INICIAL',     'S', Sheet.Cells [Row, coImp_Disponib_Inicial]);
      GuardaValorVar ('ANX18_IMP_ACCIONES_SOC',         'S', Sheet.Cells [Row, coImp_Acciones_Soc]);
      GuardaValorVar ('ANX18_F_INF_ESTADOS_FINAN',      'F', Sheet.Cells [Row, coF_Inf_Estados_Finan]);
      GuardaValorVar ('ANX18_IMP_PARTICI_ELEG_ACT',     'S', Sheet.Cells [Row, coImp_Partici_Eleg_Act]);
      GuardaValorVar ('ANX18_IMP_PARTICI_ELEG_ANT',     'S', Sheet.Cells [Row, coImp_Partici_Eleg_Ant]);
      GuardaValorVar ('ANX18_F_INF_PARTICIP_ELEG',      'F', Sheet.Cells [Row, coF_Inf_Particip_Eleg]);
      GuardaValorVar ('ANX18_TASA_DESEMPLEO_LOCAL',     'S', Sheet.Cells [Row, coTasa_Desempleo_Local]);
      GuardaValorVar ('ANX18_IMP_POB_DESOCUPADA',       'S', Sheet.Cells [Row, coImp_Pob_Desocupada]);
      GuardaValorVar ('ANX18_IMP_POB_ACTIVA',           'S', Sheet.Cells [Row, coImp_Pob_Activa]);
      GuardaValorVar ('ANX18_F_TASA_DESEMPLEO',         'F', Sheet.Cells [Row, coF_Tasa_Desempleo]);
      GuardaValorVar ('ANX18_IMP_SERV_FINAN_ER',        'S', Sheet.Cells [Row, coImp_Serv_Finan_Er]);
      GuardaValorVar ('ANX18_IMP_OBLIG_CONTINGEN',      'S', Sheet.Cells [Row, coImp_Oblig_Contingen]);
      GuardaValorVar ('ANX18_IMP_DEU_PUB_MER_VAL',      'S', Sheet.Cells [Row, coImp_Deu_Pub_Mer_Val]);
      GuardaValorVar ('ANX18_F_INF_SERVICIO_DEUDA',     'F', Sheet.Cells [Row, coF_Inf_Servicio_Deuda]);
      GuardaValorVar ('ANX18_IMP_PIB_LOCAL',            'S', Sheet.Cells [Row, coImp_PIB_Local]);
      GuardaValorVar ('ANX18_IMP_SOL_FLEX_IMP_LOC',     'S', Sheet.Cells [Row, coImp_Sol_Flex_Imp_Loc]);
      GuardaValorVar ('ANX18_F_INF_SOL_FLEX_IMP_LOC',   'F', Sheet.Cells [Row, coF_Inf_Sol_Flex_Imp_Loc]);
      GuardaValorVar ('ANX18_IMP_SOL_FLEX_PRESUP',      'S', Sheet.Cells [Row, coImp_Sol_Flex_Presup]);
      GuardaValorVar ('ANX18_F_INF_SOL_FLEX_PRESUP',    'F', Sheet.Cells [Row, coF_Inf_Sol_Flex_Presup]);
      GuardaValorVar ('ANX18_IMP_TRANSP_FINAN_DEU_PUB', 'S', Sheet.Cells [Row, coImp_Transp_Finan_Deu_Pub]);
      GuardaValorVar ('ANX18_F_TRANSPARENCIA',          'F', Sheet.Cells [Row, coF_Transparencia]);

      LimpiaStoredProc (spAltaModelo);
      spAltaModelo.ParamByName ('peID_Persona'     ).AsInteger  := IDPersona;
      spAltaModelo.ParamByName ('peID_Modelo'      ).AsInteger  := qryModelo.FieldByName ('ID_Modelo').AsInteger;
      spAltaModelo.ParamByName ('pePeriodo'        ).AsDateTime := FVigenteDesde;
      spAltaModelo.ParamByName ('peF_Vigente_Desde').AsDate     := FVigenteDesde;
      spAltaModelo.ParamByName ('peCve_Usu_Alta'   ).AsString   := Objeto.Apli.Usuario;
      spAltaModelo.ExecProc;

      if spAltaModelo.ParamByName ('psError').AsInteger <> 0 then
        LogAnexo18 (Format ('  Carga ID_Acreditado [%s]; ID_Persona [%d]. Error en el salvado del Modelo Dinámico con el mensaje de error #%d: [%s]', [Sheet.Cells [Row, 1], IDPersona, spAltaModelo.ParamByName ('psError').AsInteger, spAltaModelo.ParamByName ('psMsgError').AsString]));
    end
    else
    begin
      HuboErrores := True;
      LogAnexo18 (Format ('  Carga ID_Acreditado [%s]; ID_Persona [%d]. Error en el formato de fecha [%s]', [Sheet.Cells [Row, 1], IDPersona, s]));
    end;
  end;

begin
  //Crea la aplicación
  XLApp := CreateOleObject('Excel.Application');

  //Crea la consulta para el ID de Modelo, Bloque y Tabla Referenciada
  qryModelo := TQuery.Create (Self);
  qryModelo.DatabaseName := Objeto.Apli.DataBaseName;
  qryModelo.SessionName  := Objeto.Apli.SessionName;
  qryModelo.SQL.Clear;
  qryModelo.SQL.Add ('Select M.ID_Modelo, B.ID_Nodo, T.ID_Tabla_Referen');
  qryModelo.SQL.Add ('  From CR_Met_Modelo        M');
  qryModelo.SQL.Add ('  Join CR_Met_Bloque        B On     M.ID_Modelo          = B.ID_Modelo');
  qryModelo.SQL.Add ('                                 And B.Nombre             = ''PRINCIPAL''');
  qryModelo.SQL.Add ('                                 And B.Sit_Bloque         = ''AC''');
  qryModelo.SQL.Add ('  Join CR_Met_Tabla_Referen T On     T.Tabla_Referenciada = ''CR_ACREDITADO''');
  qryModelo.SQL.Add ('                                 And T.Sit_Tabla_Referen  = ''AC''');
  qryModelo.SQL.Add (' Where M.Nombre     = ''ANEXO_18_2015''');
  qryModelo.SQL.Add ('   And M.Sit_Modelo = ''AC''');
  qryModelo.Open;

  //Crea el stored procedure para limpiar la tabla de detalles del modelo
  spLimpiaModelo                := TStoredProc.Create (Self);
  spLimpiaModelo.DatabaseName   := Objeto.Apli.DataBaseName;
  spLimpiaModelo.SessionName    := Objeto.Apli.SessionName;
  spLimpiaModelo.StoredProcName := 'PKGCRADMINCOMERCIAL.STPCLRMODELVAL';
  spLimpiaModelo.Params.Clear;
  spLimpiaModelo.Params.CreateParam (ftFloat,  'peDummy', ptInput);

  //Crea el stored procedure para dar de alta el valor de la variable
  spValorVariable := TStoredProc.Create (Self);
  spValorVariable.DatabaseName   := Objeto.Apli.DataBaseName;
  spValorVariable.SessionName    := Objeto.Apli.SessionName;
  spValorVariable.StoredProcName := 'PKGCRADMINCOMERCIAL.STPNVOVALOR';
  spValorVariable.Params.Clear;
  spValorVariable.Params.CreateParam (ftFloat,    'peID_Nodo',           ptInput);
  spValorVariable.Params.CreateParam (ftFloat,    'peID_Variable',       ptInput);
  spValorVariable.Params.CreateParam (ftFloat,    'peNo_Repeticion',     ptInput);
  spValorVariable.Params.CreateParam (ftFloat,    'peNo_Rep_Nodo_Padre', ptInput);
  spValorVariable.Params.CreateParam (ftFloat,    'peValor_Numerico',    ptInput);
  spValorVariable.Params.CreateParam (ftDateTime, 'peValor_Fecha',       ptInput);
  spValorVariable.Params.CreateParam (ftString,   'peValor_Cadena',      ptInput);

  //Crea el stored procedure para registrar la información completa del modelo dinámico
  spAltaModelo := TStoredProc.Create (Self);
  spAltaModelo.DatabaseName   := Objeto.Apli.DataBaseName;
  spAltaModelo.SessionName    := Objeto.Apli.SessionName;
  spAltaModelo.StoredProcName := 'PKGCRADMINCOMERCIAL.STPALTAMODELOAPP';
  spAltaModelo.Params.Clear;
  spAltaModelo.Params.CreateParam (ftFloat,    'peID_Persona',        ptInput);
  spAltaModelo.Params.CreateParam (ftFloat,    'peID_Modelo',         ptInput);
  spAltaModelo.Params.CreateParam (ftDateTime, 'pePeriodo',           ptInput);
  spAltaModelo.Params.CreateParam (ftDateTime, 'peF_Vigente_Desde',   ptInput);
  spAltaModelo.Params.CreateParam (ftString,   'peCve_Usu_Alta',      ptInput);
  spAltaModelo.Params.CreateParam (ftFloat,    'psError',             ptOutput);
  spAltaModelo.Params.CreateParam (ftString,   'psMsgError',          ptOutput);

  try
    pgAnexo18.Position := 0;
    pgAnexo18.Visible  := True;
    HuboErrores        := False;

    try
      LogAnexo18 (Format ('Inicia carga de Anexo 18 del archivo [%s]', [FileName]));
      XLApp.Visible := False;
      XLApp.Workbooks.Open (FileName);
      Sheet := XLApp.Workbooks [1].Worksheets [1];

      for Row := 2 to Sheet.UsedRange.Rows.Count do
      begin
        LimpiaStoredProc (spAltaPersona);

        IDPersona := ObtenIDPersona (StrToInt (Sheet.Cells [Row, 1]));
        if IDPersona > 0 then
          SalvaInformacionAcreditado
        else
        begin
          HuboErrores := True;
          LogAnexo18 (Format ('  Carga ID_Acreditado [%s]. No se pudo crear la persona para este acreditado, hay que verificar que el acreditado existe.', [Sheet.Cells [Row, 1]]));
        end;

        pgAnexo18.Position := Round ((Row / Sheet.UsedRange.Rows.Count) * 100);
      end;

      LogAnexo18 (Format ('Termina carga de Anexo 18 del archivo [%s]', [FileName]));
      if not HuboErrores then
        MessageDlg ('Proceso de carga concluido exitosamente', mtInformation, [mbOk], 0)
      else
        MessageDlg ('Se presentaron errores durante el proceso de carga. Revisar la consola para más información.', mtError, [mbOk], 0);
    except
    end;
  finally
    qryModelo      .Free;
    spLimpiaModelo .Free;
    spValorVariable.Free;
    spAltaModelo   .Free;
    XLApp.Quit;
    XLApp             := Unassigned;
    Sheet             := Unassigned;
    pgAnexo18.Visible := False;
  end;
end;

procedure TWMetAcred.LogAnexo18 (S: string);
begin
  ConsoleAnexo18.Lines.Add (FormatDateTime ('yyyy/mm/dd hh:nn:ss:zzz', Now) + ' ' + s);
end;

procedure TWMetAcred.actModificarContratosAnexo19Update(Sender: TObject);
begin
  actModificarContratosAnexo19.Enabled := (MemContratosAnexo19.RecordCount > 0) and dbgAnexo19.ReadOnly;
  actAceptarContratosAnexo19.Enabled   := not dbgAnexo19.ReadOnly;
  actCancelarContratosAnexo19.Enabled  := not dbgAnexo19.ReadOnly;
end;

procedure TWMetAcred.actModificarContratosAnexo19Execute(Sender: TObject);
begin
  if Objeto.ValidaAccesoEsp('TMETACRED_CTOA19', True, True) then
    dbgAnexo19.ReadOnly := False;
end;

procedure TWMetAcred.actAceptarContratosAnexo19Execute(Sender: TObject);
begin
  SalvaContratosAnexo19;
  ActualizaContratosAnexo19;
end;

procedure TWMetAcred.actCancelarContratosAnexo19Execute(Sender: TObject);
begin
  ActualizaContratosAnexo19;
end;

procedure TWMetAcred.MemContratosAnexo19BeforeInsert(DataSet: TDataSet);
begin
  if MemContratosAnexo19.Tag = 0 then
    Abort;
end;

procedure TWMetAcred.AppModAnexo19CalcularCampos(AppModelo: TAppModelo;
  AppDataSet: TAppModeloDataSet);
var
  QSecuenciaAnexo19: TQuery;
begin
  if (AppModelo.ModeloNombre = 'ANEXO_19_2015') and (AppModelo.Estado in [emInsertado, emEditado]) and
     Assigned (AppDataSet.ObtenBloque ('PROYECTOS')) and
     Assigned (AppDataSet.ObtenBloque ('PROYECTOS').ObtenColumna ('ANX19_ID_PROYECTO')) and
     (AppDataSet.ObtenBloque ('PROYECTOS').ObtenColumna ('ANX19_ID_PROYECTO').AsString = '') then
  begin
    QSecuenciaAnexo19              := TQuery.Create (Self);
    QSecuenciaAnexo19.DatabaseName := Objeto.Apli.DataBaseName;
    QSecuenciaAnexo19.SessionName  := Objeto.Apli.SessionName;
    QSecuenciaAnexo19.Close;
    QSecuenciaAnexo19.SQL.Clear;
    QSecuenciaAnexo19.SQL.Add ('Select SQ_CR_Per_Proy_Anexo19.NextVal Nvo_ID_Proyecto From Dual');
    QSecuenciaAnexo19.Open;

    AppDataSet.ObtenBloque ('PROYECTOS').ObtenColumna ('ANX19_ID_PROYECTO').AsInteger := QSecuenciaAnexo19.FieldByName ('Nvo_ID_Proyecto').AsInteger;
  end;
end;

procedure TWMetAcred.AppModConsumoRevolventeCalcularCampos(
  AppModelo: TAppModelo; AppDataSet: TAppModeloDataSet);
var
  Bloque: TAppModeloBloque;
  MontoSic, MontoInst: double;
begin
  //Modelo: CONSUMO_REVOLVENTE
  //Bloque: VARIABLES_BURO
  //CNR_VECES_MONTO_BANCO = CNR_MONTO_A_PAGAR_SIC / CNR_MONTO_A_PAGAR_CON_INST
  if AppModelo.ModeloNombre = 'CONSUMO_REVOLVENTE' then
  begin
    Bloque := AppDataSet.ObtenBloque ('VARIABLES_BURO');

    if     Assigned (Bloque)
      and (Bloque.ObtenColumna ('CNR_MONTO_A_PAGAR_SIC')      <> nil)
      and (Bloque.ObtenColumna ('CNR_MONTO_A_PAGAR_CON_INST') <> nil) then
    begin
      MontoSic  := Bloque.ObtenColumna ('CNR_MONTO_A_PAGAR_SIC'     ).AsFloat;
      MontoInst := Bloque.ObtenColumna ('CNR_MONTO_A_PAGAR_CON_INST').AsFloat;

      if MontoInst = 0 then
        Bloque.ObtenColumna ('CNR_VECES_MONTO_BANCO').AsFloat := 0
      else
        Bloque.ObtenColumna ('CNR_VECES_MONTO_BANCO').AsFloat := MontoSic / MontoInst;
    end;
  end;
end;

procedure TWMetAcred.AppModConsumoRevolventeBtnAceptar(Sender: TObject);
begin
  AppModeloBtnAceptar (AppModConsumoRevolvente);
end;

end.
