// Compatible Redescuento
// Sistema         : Clase de CrFinAdic
// Fecha de Inicio : 23/09/2003
// Función forma   : Clase de CrFinAdic
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Sergio E. López                                                         
// Comentarios     : Modificada a partir del 13 -Julio - 2004
//                   por Intercase - Javier Martínez
// Modificaciones  : 11 11 2004. Corrección al importe de capitalizacion
//                   25 MAY 2006. Refinanciamiento a tasa pasiva

Unit IntCrFinAdic;

interface          

uses
Windows,  Messages, SysUtils,  Classes,  Graphics,  Controls,  Forms,     Dialogs,
IntFrm,   DB,       DbTables,  Mask,     StdCtrls,  Buttons,   ExtCtrls,  InterFor,
IntFind,  UnSQL2,   InterFun,  ComCtrls, IntDtPk,   IntSGCtrl, IntLinkit, InterEdit,

//
//Unidades Adicionales
IntCrProduct,  //Producto,
IntCrAcredit,  //Acrediado
IntGenCre,
IntCrCredito, Grids, Aligrid,   //Disposición
IntParamCre,
IntVcrIntere,
IntCrCto, ImgList      // Consulta Contrato
;

Type
  TCrFinAdic  = class;

  TWCrFinAdic = Class(TForm)
    InterForma1             : TInterForma;
    Label10: TLabel;
    btBUSCA: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilCveProdCre: TInterLinkit;
    btProcesa: TBitBtn;
    MErrores: TMemo;
    rgTipoFiltro: TRadioGroup;
    Label2: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btCVE_PRODUCTO: TBitBtn;
    edDESC_PRODUCTO: TEdit;
    cbPRODUCTO: TCheckBox;
    lbFiltro: TLabel;
    edValorFiltro: TEdit;
    btnFiltro: TBitBtn;
    edDESC_FILTRO: TEdit;
    cbFiltro: TCheckBox;
    gbParametros: TGroupBox;
    lbFOpera: TLabel;
    btFECHA: TSpeedButton;
    edFECHA_VALOR: TEdit;
    dtFECHA: TInterDateTimePicker;
    gbImporte: TGroupBox;
    Label8: TLabel;
    edTOTAL: TInterEdit;
    Label6: TLabel;
    btINTERES: TBitBtn;
    edINTERES: TInterEdit;
    cbINTERES: TCheckBox;
    gbGeneral: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edCredito: TInterEdit;
    edIdContrato: TInterEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    edMoneda: TEdit;
    edIDFira: TInterEdit;
    edSdoInsoluto: TInterEdit;
    edFFin: TInterEdit;
    edMonto: TInterEdit;
    edFInicio: TInterEdit;
    BitBtn4: TBitBtn;
    edProducto: TInterEdit;
    gbAcreditado: TGroupBox;
    lbAcreditado: TLabel;
    Label3: TLabel;
    edNoCtrlFIRA: TInterEdit;
    ikValorFiltro: TInterLinkit;
    Label1: TLabel;
    edFechaVig: TEdit;
    dtFechaVig: TInterDateTimePicker;
    cbAplicaVig: TCheckBox;
    sagDATOS: TStringAlignGrid;
    ImageList: TImageList;
    cbSeleccion: TCheckBox;
    sbLogCobranza: TSpeedButton;
    cbB_TASA_PASIVA: TCheckBox;
    lbB_TASA_PASIVA: TLabel;
    CBtodos: TCheckBox;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure btBUSCAClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rgTipoFiltroClick(Sender: TObject);
    procedure ikValorFiltroEjecuta(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure btProcesaClick(Sender: TObject);
    procedure ilCveProdCreEjecuta(Sender: TObject);
    procedure btCVE_PRODUCTOClick(Sender: TObject);
    procedure cbFiltroClick(Sender: TObject);
    procedure cbPRODUCTOClick(Sender: TObject);
    procedure dtFechaVigClick(Sender: TObject);
    procedure edFechaVigChange(Sender: TObject);
    procedure cbINTERESClick(Sender: TObject);
    procedure btFECHAClick(Sender: TObject);
    procedure edINTERESExit(Sender: TObject);
    procedure cbAplicaVigClick(Sender: TObject);
    procedure sagDATOSSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btINTERESClick(Sender: TObject);
    procedure sagDATOSDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sagDATOSMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edFECHA_VALORExit(Sender: TObject);
    procedure dtFECHAExit(Sender: TObject);
    procedure cbSeleccionClick(Sender: TObject);
    procedure sbLogCobranzaClick(Sender: TObject);
    procedure cbB_TASA_PASIVAClick(Sender: TObject);
    procedure CBtodosClick(Sender: TObject);
  private
    fSearching  : Boolean;
    fBolSearch  : Boolean;
    fDataFound  : Boolean;
    fRefrescando: Boolean;
  private
    procedure   LimpiaFiltro;
    procedure   SetTipoFiltro;
    Function    BeginSearch( BBusca : Boolean; const Llave : array of TVarRec ): Boolean;
    procedure   MuestraDatos;
    Procedure   LimpiaDatos;
    Function    BuildSQLStr : String;
    procedure   GridToRecord(peRowGrid: Integer);
    procedure   RecordToWindow;
    Function    ValFechaOper( peBandera : Boolean ): Boolean;
    procedure   CalculaImportes;
    function    ImpDerecha(sImp: String): String;

  public
    Objeto : TCrFinAdic;
  end;
  //
  //
  TCrFinAdic = class(TInterFrame)
  private
    dtHoy: TDateTime;
    procedure StpObtAdeudo( peIdCredito: Integer; peNumPeriodo: Integer;
                   peCveComision: String; pFCalculo: TDate; pFactor: Double;
                   pBIVA: String; pMetodo: String; var vlTotal, //vlCapital,
                   // vlInteres, vlConcepto,
                   vlImporte, vlIVA, vlBenBco, vlBenGob,
                   vlMoras, vlIVAMoras : Double; var  vlError : String );
  protected
  public
    TIPO_FILTRO              : TInterCampo;
    //VALOR_FILTRO             : TInterCampo;

    FECHA                    : TInterCampo;
    FECHA_VIG                : TInterCampo;

    B_SELECCIONADO           : TInterCampo;
    ID_CREDITO               : TInterCampo;
    NUM_PERIODO              : TInterCampo;
    F_VENCIMIENTO            : TInterCampo;
    F_VALOR                  : TInterCampo;
    SIT_INTERES              : TInterCampo;
    IMP_INTERES              : TInterCampo;
    IMP_IVA                  : TInterCampo;
    IMP_TOTAL                : TInterCampo;
    NOM_ACREDITADO           : TInterCampo;
    ID_CONTRATO              : TInterCampo;
    FOL_CONTRATO             : TInterCampo;
    ID_CRED_EXTERNO          : TInterCampo;
    ID_CONTROL_EXT           : TInterCampo;
    ID_ACREDITADO            : TInterCampo;
    IMP_CREDITO              : TInterCampo;
    SDO_INSOLUTO             : TInterCampo;
    CVE_PRODUCTO_CRE         : TInterCampo;
    CVE_MONEDA               : TInterCampo;
    DESC_MONEDA              : TInterCampo;
    F_INICIO                 : TInterCampo;
    F_FIN                    : TInterCampo;
    B_FINAN_ADIC             : TInterCampo;
    B_TASA_PASIVA            : TInterCampo;

    //
    Producto             : TCrproduct;
    Acreditado           : TCrAcredit;
    Credito              : TCrCredito;
    //
    CrContrato           : TCrCto;
    ParamCre                 : TParamCre;
    
  public
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;


const
  coF_Acred   = 'AC';
  coF_Disp    = 'CR';
  coF_IdFIRA  = 'IF';
  coF_NoCtrl  = 'NC';
  cRowColor = TColor( 195 or  ( 230 shl 8 ) or ( 200 shl 16 ) );

  COL_SEL  = 0;  // Aplica proceso
  COL_CRED = 1;  // Número de disposición
  COL_PERI = 2;  // Número de periodo
  COL_FVTO = 3;  // Fecha de vencimiento
  COL_FVAL = 4;  // Fecha de operación ( Valor )
  COL_ITOT = 5;  // Importe de Fin. Adicional
  COL_ACRE = 6;  // Acreditado
  COL_VIS  = COL_ACRE;  // Ultima columna visible
  // Posicion de los datos en el GRID ( Datos no visibles )
  COL_CTTO = 7; // Id Contrato
  COL_FCTO = 8; // Folio_contrato
  COL_CREX = 9; // Credito Externo
  COL_CTEX = 10; // Control Externo
  COL_IACR = 11; // Id del Acreditado
  COL_ICRE = 12; // Importe del Credito
  COL_SALD = 13; // Saldo Insoluto
  COL_CPRO = 14; // Clave de producto de credito
  COL_CMON = 15; // Clave de Moneda
  COL_DMON = 16; // Descripcion de la moneda
  COL_FINI = 17; // Fecha Inicial
  COL_FFIN = 18; // Fecha de vencimiento
  COL_FADI = 19; // Aplica Financiamiento Adicional
  COL_SIT  = 20;  // Situacion periodo
  COL_IINT = 21;  // Importe de Interes
  COL_IIVA = 22;  // Importe de IVA
  COL_BTP  = 23;  // Capitaliza a tasa activa ?
  COL_MAX  = COL_BTP;  // Ultima columna visible

  coVERDAD   = 'V';
  coIMPAGADO = 'IM';

var WCrFinAdic : TWCrFinAdic;
    Bselperiodo : boolean;

implementation
{$R *.DFM}


constructor TCrFinAdic.Create( AOwner : TComponent );
begin
  Inherited;
  //VALOR_FILTRO   := CreaCampo('VALOR_FILTRO', ftString, tsNinguno, tsNinguno, False );
  TIPO_FILTRO    := CreaCampo('TIPO_FILTRO',  ftString, tsNinguno, tsNinguno, False);
  With TIPO_FILTRO do
  begin
    Size     := 2;
    UseCombo := True;                       //Constantes en IntGenCre
    ComboLista.Add('0');      ComboDatos.Add( coF_Acred  );
    ComboLista.Add('1');      ComboDatos.Add( coF_Disp   );
    ComboLista.Add('2');      ComboDatos.Add( coF_IdFIRA );
    ComboLista.Add('3');      ComboDatos.Add( coF_NoCtrl );
  end;

  FECHA             :=CreaCampo('FECHA',ftDate,tsNinguno,tsNinguno,False);
  FECHA_VIG         :=CreaCampo('FECHA_VIG',ftDate,tsNinguno,tsNinguno,False);

  B_SELECCIONADO    := CreaCampo( 'B_SELECCIONADO',   ftString,  tsNinguno, tsNinguno, False );
  ID_CREDITO        := CreaCampo( 'ID_CREDITO',       ftFloat,  tsNinguno, tsNinguno, False );
  NUM_PERIODO       := CreaCampo( 'NUM_PERIODO',      ftFloat,  tsNinguno, tsNinguno, False );
  F_VENCIMIENTO     := CreaCampo( 'F_VENCIMIENTO',    ftDate,  tsNinguno, tsNinguno, False );
  F_VALOR           := CreaCampo( 'F_VALOR',          ftDate,  tsNinguno, tsNinguno, False );
  SIT_INTERES       := CreaCampo( 'SIT_INTERES',      ftString,  tsNinguno, tsNinguno, False );
  IMP_INTERES       := CreaCampo( 'IMP_INTERES',      ftFloat,  tsNinguno, tsNinguno, False );
  IMP_IVA           := CreaCampo( 'IMP_IVA',          ftFloat,  tsNinguno, tsNinguno, False );
  IMP_TOTAL         := CreaCampo( 'IMP_TOTAL',        ftFloat,  tsNinguno, tsNinguno, False );
  NOM_ACREDITADO    := CreaCampo( 'NOM_ACREDITADO',       ftString,  tsNinguno, tsNinguno, False );
  ID_CONTRATO       := CreaCampo( 'ID_CONTRATO',      ftFloat,  tsNinguno, tsNinguno, False );
  FOL_CONTRATO      := CreaCampo( 'FOL_CONTRATO',     ftFloat,  tsNinguno, tsNinguno, False );
  ID_CRED_EXTERNO   := CreaCampo( 'ID_CRED_EXTERNO',  ftFloat,  tsNinguno, tsNinguno, False );
  ID_CONTROL_EXT    := CreaCampo( 'ID_CONTROL_EXT',   ftFloat,  tsNinguno, tsNinguno, False );
  ID_ACREDITADO     := CreaCampo( 'ID_ACREDITADO',    ftFloat,  tsNinguno, tsNinguno, False );
  IMP_CREDITO       := CreaCampo( 'IMP_CREDITO',      ftFloat,  tsNinguno, tsNinguno, False );
  SDO_INSOLUTO      := CreaCampo( 'SDO_INSOLUTO',     ftFloat,  tsNinguno, tsNinguno, False );
  CVE_PRODUCTO_CRE  := CreaCampo( 'CVE_PRODUCTO_CRE', ftString,  tsNinguno, tsNinguno, False );
  CVE_MONEDA        := CreaCampo( 'CVE_MONEDA',       ftString,  tsNinguno, tsNinguno, False );
  DESC_MONEDA       := CreaCampo( 'DESC_MONEDA',       ftString,  tsNinguno, tsNinguno, False );
  F_INICIO          := CreaCampo( 'F_INICIO',         ftDate,   tsNinguno, tsNinguno, False );
  F_FIN             := CreaCampo( 'F_FIN',         ftDate,   tsNinguno, tsNinguno, False );
  B_FINAN_ADIC      := CreaCampo( 'B_FINAN_ADIC',     ftString,  tsNinguno, tsNinguno, False );
  B_TASA_PASIVA     := CreaCampo( 'B_TASA_PASIVA',    ftString,  tsNinguno, tsNinguno, False );

  {$WARNINGS OFF}
  Producto := TCrProduct.Create(Self);
  Producto.MasterSource := Self;

  Credito := TCrCredito.Create(Self);
  Credito.MasterSource := Self;

  Acreditado := TCrAcredit.Create(Self);
  Acreditado.MasterSource:= Self;
  {$WARNINGS ON}

  // Autorizacion
  CrContrato := TCrCto.Create(self);
  CrContrato.MasterSource := Self;



  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntCrFinAdic.Hlp';
  ShowMenuReporte:=True;

end;


Destructor TCrFinAdic.Destroy;
begin
  if Producto <> nil then
    Producto.free;
  //end if;
  if Acreditado <> nil then
    Acreditado.free;
  //end if;
  if Credito <> nil then
    Credito.free;
  //end if;
  if CrContrato <> nil then
     CrContrato.Free;


  inherited;
end;


function TCrFinAdic.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrFinAdic;
begin
   W := TWCrFinAdic.Create(Self);
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


Function TCrFinAdic.InternalBusca:Boolean;
var  T : TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICraucac.it','');
  try
    if Active then
    begin
    end;
    //
    if T.Execute then
      InternalBusca := FindKey([]);
    //ends_if
  finally
    T.Free;
  end;
end;

(***********************************************FORMA CRAUCACS********************)
(*                                                                              *)
(*  FORMA DE CRAUCACS                                                            *)
(*                                                                              *)
(***********************************************FORMA CRAUCACS********************)
procedure TWCrFinAdic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrFinAdic.FormShow(Sender: TObject);
begin

  Objeto.dtHoy:= Objeto.Apli.DameFechaEmpresa;
  fRefrescando:= False;

  Objeto.CrContrato.ParamCre := Objeto.ParamCre;
  Objeto.Credito.ParamCre    := Objeto.ParamCre;
  Objeto.Producto.ParamCre   := Objeto.ParamCre;

  lbDempresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := Objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := Objeto.ParamCre.PERFIL.AsString;

  Objeto.TIPO_FILTRO.Control  := rgTipoFiltro;
  //Objeto.VALOR_FILTRO.Control := edValorFiltro;
  {}
  Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
  Objeto.Producto.DESC_C_PRODUCTO.Control  := edDESC_PRODUCTO;
  {}
  Objeto.FECHA_VIG.Control := edFechaVig;

  Objeto.B_SELECCIONADO.Control   := cbINTERES;
  Objeto.ID_CREDITO.Control       := edCredito;
  Objeto.F_VALOR.Control          := edFECHA_VALOR;
  Objeto.IMP_INTERES.Control      := edINTERES;
  Objeto.IMP_TOTAL.Control        := edTOTAL;
  Objeto.ID_CONTRATO.Control      := edIdContrato;
  Objeto.ID_CRED_EXTERNO.Control  := edIDFira;
  Objeto.ID_CONTROL_EXT.Control   := edNoCtrlFIRA;
  Objeto.IMP_CREDITO.Control      := edMonto;
  Objeto.SDO_INSOLUTO.Control     := edSdoInsoluto;
  Objeto.DESC_MONEDA.Control      := edMoneda ;
  Objeto.F_INICIO.Control         := edFInicio;
  Objeto.F_FIN.Control            := edFFin;
  Objeto.CVE_PRODUCTO_CRE.control := edProducto;
  Objeto.NOM_ACREDITADO.control   := lbAcreditado;
  Objeto.B_TASA_PASIVA.control    := cbB_TASA_PASIVA;

  Objeto.TIPO_FILTRO.AsString := coF_Disp;
  Objeto.FECHA_VIG.AsDateTime := objeto.dtHoy;

  //
  Objeto.Producto.BuscaWhereString := 'CR_PRODUCTO.ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa);  // LOLS 08 SEP 2005
  Objeto.Producto.FilterString     := Objeto.Producto.BuscaWhereString;
  Objeto.Credito.BuscaWhereString  := 'PKGCRACTUALIZA.STPOBTEMPCTTO(CR_CREDITO.ID_CONTRATO)= ' +  // LOLS 08 SEP 2005
                                      IntToStr(Objeto.Apli.IdEmpresa);                            // LOLS 08 SEP 200
  Objeto.Credito.FilterString      := Objeto.Credito.BuscaWhereString;
  //
  cbAplicaVig.Checked:= False;
  cbAplicaVigClick(Self);


  LimpiaDatos;
 // MuestraDatos;
end;
//
procedure TWCrFinAdic.FormDestroy(Sender: TObject);
begin
  Objeto.TIPO_FILTRO.Control  := nil;
  //Objeto.VALOR_FILTRO.Control := nil;
  //
  Objeto.Producto.CVE_PRODUCTO_CRE.Control := nil;
  Objeto.Producto.DESC_C_PRODUCTO.Control  := nil;

  Objeto.FECHA_VIG.Control := nil;

  Objeto.B_SELECCIONADO.Control   := nil;
  Objeto.ID_CREDITO.Control       := nil;
  Objeto.F_VALOR.Control          := nil;
  Objeto.IMP_INTERES.Control      := nil;
  Objeto.IMP_TOTAL.Control        := nil;
  Objeto.ID_CONTRATO.Control      := nil;
  Objeto.ID_CRED_EXTERNO.Control  := nil;
  Objeto.ID_CONTROL_EXT.Control   := nil;
  Objeto.IMP_CREDITO.Control      := nil;
  Objeto.SDO_INSOLUTO.Control     := nil;
  Objeto.DESC_MONEDA.Control      := nil ;
  Objeto.F_INICIO.Control         := nil;
  Objeto.F_FIN.Control            := nil;
  Objeto.CVE_PRODUCTO_CRE.control := nil;
  Objeto.NOM_ACREDITADO.control   := nil;
  Objeto.B_TASA_PASIVA.control    := nil;

  If Objeto.Credito.ID_CREDITO.Control<> nil Then Objeto.Credito.ID_CREDITO.Control:= nil;
  If Objeto.Credito.ContratoCre.Contrato.TITNombre.Control<>nil Then Objeto.Credito.ContratoCre.Contrato.TITNombre.Control:= nil;
  If Objeto.Credito.ID_CRED_EXTERNO.Control<>nil Then Objeto.Credito.ID_CRED_EXTERNO.Control:= nil;
  If Objeto.Credito.ID_CONTROL_EXT.Control<>nil Then Objeto.Credito.ID_CONTROL_EXT.Control:= nil;
  If Objeto.Acreditado.ID_ACREDITADO.Control<>nil Then Objeto.Acreditado.ID_ACREDITADO.Control:= nil;
  If Objeto.Acreditado.Persona.Nombre.Control<>nil Then Objeto.Acreditado.Persona.Nombre.Control:= nil;

end;


{
                 E     V     E      N       T        O        S
}

procedure TWCrFinAdic.LimpiaFiltro;
begin
  Objeto.Credito.Active    := False;
  Objeto.Acreditado.Active := False;
  fBolSearch       := False;
  cbFiltro.Checked := False;
end;


procedure TWCrFinAdic.SetTipoFiltro;
  {$HINTS OFF}
  procedure LiberaControl( peControl : TControl );
  begin
    if peControl<> nil then peControl := nil;
    //ends_if
  end;
  {$HINTS ON}
begin
  lbFiltro.Caption := '';
  Objeto.TIPO_FILTRO.GetFromControl;      // Obtiene el valor del filtro
  LimpiaFiltro;                           // Desactiva las clases internas de busqueda
  // Relaciona ó Libera los controles
  If Objeto.Credito.ID_CREDITO.Control<> nil Then Objeto.Credito.ID_CREDITO.Control:= nil;
  If Objeto.Credito.ContratoCre.Contrato.TITNombre.Control<>nil Then Objeto.Credito.ContratoCre.Contrato.TITNombre.Control:= nil;
  If Objeto.Credito.ID_CRED_EXTERNO.Control<>nil Then Objeto.Credito.ID_CRED_EXTERNO.Control:= nil;
  If Objeto.Credito.ID_CONTROL_EXT.Control<>nil Then Objeto.Credito.ID_CONTROL_EXT.Control:= nil;
  If Objeto.Acreditado.ID_ACREDITADO.Control<>nil Then Objeto.Acreditado.ID_ACREDITADO.Control:= nil;
  If Objeto.Acreditado.Persona.Nombre.Control<>nil Then Objeto.Acreditado.Persona.Nombre.Control:= nil;
  //
  if Objeto.TIPO_FILTRO.AsString = coF_Acred then
  begin
    lbFiltro.Caption := 'Acreditado';
    Objeto.Acreditado.ID_ACREDITADO.Control := edValorFiltro;
    Objeto.Acreditado.Persona.Nombre.Control := edDESC_FILTRO;
  end else if Objeto.TIPO_FILTRO.AsString = coF_Disp then
  begin
    lbFiltro.Caption := 'Disposición';
    Objeto.Credito.ID_CREDITO.Control := edValorFiltro;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edDESC_FILTRO;
  end else if Objeto.TIPO_FILTRO.AsString = coF_IdFIRA then
  begin
    lbFiltro.Caption := 'ID FIRA';
    Objeto.Credito.ID_CRED_EXTERNO.Control := edValorFiltro;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edDESC_FILTRO;
  end else if Objeto.TIPO_FILTRO.AsString = coF_NoCtrl then
  begin
    lbFiltro.Caption := 'No. Control';
    Objeto.Credito.ID_CONTROL_EXT.Control := edValorFiltro;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edDESC_FILTRO;
  end;
  //
  if edValorFiltro.CanFocus then
    edValorFiltro.SetFocus;
  //ends_if
end;


// FILTRO POR PRODUCTO
procedure TWCrFinAdic.ilCveProdCreEjecuta(Sender: TObject);
begin
  If Objeto.Producto.FindKey( [ ilCveProdCre.Buffer ] ) Then cbPRODUCTO.Checked:= True
  Else  cbPRODUCTO.Checked:= False;

  LimpiaDatos;
end;
//
procedure TWCrFinAdic.btCVE_PRODUCTOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRFINADIC_PROD',True,True) then
   begin
      If Objeto.Producto.Busca Then cbPRODUCTO.Checked:= True
      Else  cbPRODUCTO.Checked:= False;
      LimpiaDatos;
   end;
end;

procedure TWCrFinAdic.rgTipoFiltroClick(Sender: TObject);
begin
  SetTipoFiltro;
  LimpiaDatos;
end;
{}
Function  TWCrFinAdic.BeginSearch( BBusca : Boolean; const Llave : array of TVarRec ): Boolean;
begin
  fBolSearch := False;
  //
  if Objeto.TIPO_FILTRO.AsString = coF_Acred then
  begin
    // Busqueda sobre acreditado
    if BBusca then
      fBolSearch := Objeto.Acreditado.Busca
    else
      fBolSearch := Objeto.Acreditado.FindKey( Llave  );
    // ends_if
  end else if Objeto.TIPO_FILTRO.AsString = coF_Disp then
  begin
    // Busqueda sobre disposición
    if BBusca then
      fBolSearch := Objeto.Credito.Busca
    else
      fBolSearch := Objeto.Credito.FindKey( Llave );
    // ends_if
  end else if Objeto.TIPO_FILTRO.AsString = coF_IdFIRA then
  begin
    // Busqueda sobre disposición
    if BBusca then
      fBolSearch := Objeto.Credito.Busca
    else
      fBolSearch := Objeto.Credito.FindKeyNear( Llave, ['ID_CRED_EXTERNO'] );
    // ends_if
  end else if Objeto.TIPO_FILTRO.AsString = coF_NoCtrl then
  begin
    // Busqueda sobre disposición
    if BBusca then
      fBolSearch := Objeto.Credito.Busca
    else
      fBolSearch := Objeto.Credito.FindKeyNear( Llave, ['ID_CONTROL_EXT'] );
    // ends_if
  end;
  // Obtiene el valor del control
  //Objeto.VALOR_FILTRO.GetFromControl;
  cbFiltro.Checked := fBolSearch;
  //
  Result := fBolSearch;
end;


procedure TWCrFinAdic.btnFiltroClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRFINADIC_DISP',True,True) then
   begin
      BeginSearch( True, [] );
      LimpiaDatos;
      if fBolSearch then
        btBUSCAClick(nil);
   end;
end;
//
procedure TWCrFinAdic.ikValorFiltroEjecuta(Sender: TObject);
begin
  BeginSearch( False, [ ikValorFiltro.Buffer ] );
  LimpiaDatos;
  if fBolSearch then
    btBUSCAClick(nil);

end;

procedure TWCrFinAdic.cbFiltroClick(Sender: TObject);
begin
  if cbFiltro.Checked and ( fBolSearch = False ) then
  begin
    cbFiltro.Checked := False
  end else if ( cbFiltro.Checked = False ) and ( fBolSearch = True ) then
  begin
    LimpiaFiltro;
    LimpiaDatos;
  end;//ends_if
  cbFiltro.Enabled := cbFiltro.Checked;
end;

procedure TWCrFinAdic.btProcesaClick(Sender: TObject);
Var
  iRenglon: Integer;
  STPProceso : TStoredProc;
  vlError: String;

  vlQry : TQuery;
  vlsql : string;
  vlCount : Integer;
  vlDia: Integer;
  vlDias: Integer;
  vlDiaInicial: TDateTime;
begin
   if Objeto.ValidaAccesoEsp('TCRFINADIC_PROC',True,True) then
   begin
      if fSearching then exit; // Si esta haciendo una busqueda no entra al evento
      fSearching := True;

    // JAGF: PARA VALIDAR LA FECHA VALOR PARA EL PERIODO CONTABLE
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

      MErrores.Lines.Add('====================================================');
      MErrores.Lines.Add('***                 INICIA PROCESO               ***');
      MErrores.Lines.Add('    Hora inicio:' + TimeToStr(Time));

      STPProceso := TStoredProc.Create(Nil);
      try
        For iRenglon:= 1 To sagDATOS.RowCount-1 DO
        begin
          If (sagDatos.Cells[COL_CRED,iRenglon]<>'') And (sagDatos.Cells[COL_SEL, iRenglon] = 'V') Then Begin
            GridToRecord(iRenglon);

             vlsql:= ' SELECT COUNT(*) COUNT FROM CR_INTERES WHERE ID_CREDITO = '+ IntToStr(Objeto.ID_CREDITO.AsInteger) +
                     ' AND B_FINAN_ADIC = ''V'' '+
                     ' AND F_VENCIMIENTO < TO_DATE('''+Objeto.F_VALOR.AsString+''',''DD/MM/YYYY'')'+
                     ' AND SIT_INTERES = ''IM'' '+
                     ' AND NUM_PERIODO < '+ IntToStr(Objeto.NUM_PERIODO.AsInteger)+
                     ' AND (IMP_INTERES- PKGCRCOMUN.STPOBTIMPPAG(''IN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO, NULL, TO_DATE('''+Objeto.F_VALOR.AsString+''',''DD/MM/YYYY''),''V'',''F'')) > 0 ';

            GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlCount,False);
            if vlCount=0 then
            begin
               with STPProceso do
               begin
                 DatabaseName:= Objeto.Apli.DatabaseName;
                 SessionName:= Objeto.Apli.SessionName;
                 StoredProcName:='PKGCRCOBRANZA.STPPROCDETFINANADIC';
                 // Se crean los parametros del StoreProcedure
                 Params.Clear;
                 Params.CreateParam( ftDate,    'peFAplicacon',  ptInput);
                 Params.CreateParam( ftDate,    'peFHoy',        ptInput);
                 Params.CreateParam( ftString,  'peCveUsuario',  ptInput);
                 Params.CreateParam( ftInteger, 'peIdCredito',   ptInput);
                 Params.CreateParam( ftInteger, 'peNumPeriodo',  ptInput);
                 Params.CreateParam( ftFloat,   'peImpInteres',  ptInput);
                 Params.CreateParam( ftFloat,   'peImpIVA',      ptInput);
                 Params.CreateParam( ftString,  'peBTasaActiva', ptInput);
                 Params.CreateParam( ftString,  'peBCommit',     ptInput);
                 Params.CreateParam( ftFloat,   'psResultado',   ptOutput);
                 Params.CreateParam( ftString,  'psTxResultado', ptOutput);
                 //
                 ParamByName('peFAplicacon').AsDateTime := Objeto.F_VALOR.AsDateTime;
                 ParamByName('peFHoy').AsDateTime := Objeto.dtHoy;
                 ParamByName('peCveUsuario').AsString  := Objeto.Apli.Usuario;
                 ParamByName('peIdCredito').AsInteger  := Objeto.ID_CREDITO.AsInteger;
                 ParamByName('peNumPeriodo').AsInteger := Objeto.NUM_PERIODO.AsInteger;
                 ParamByName('peImpInteres').AsFloat   := Objeto.IMP_INTERES.AsFloat;
                 ParamByName('peImpIVA').AsFloat       := 0.0;
                 ParamByName('peBTasaActiva').AsString := 'V';
                 if Objeto.B_TASA_PASIVA.AsString = 'V' then
                    ParamByName('peBTasaActiva').AsString := 'F';
                 //
                 ParamByName('peBCommit').AsString     := 'V';
                 ExecProc;
                 if (ParamByName('PSResultado').AsInteger <> 0) then
                 begin
                   vlError := 'PROBLEMAS AL Procesar Dispocición: ' + Objeto.ID_CREDITO.Asstring + coCRLF +
                              'Periodo: '+ Objeto.NUM_PERIODO.AsString +  coCRLF +
                              'Código : ' + ParamByName('psRESULTADO').AsString + coCRLF +
                              'Mensaje: ' + ParamByName('PSTXRESULTADO').AsString;
                   MessageDlg( vlError, mtError, [mbOK],0 );
                 end;
               end;
             end
             else
             begin
                vlError := 'Hay periodos de interes Impagados anteriores al seleccionado.';
                MessageDlg( vlError, mtError, [mbOK],0 );
             end;
          end;
        end;
      finally
        STPProceso.Free;
      end;

      MessageDlg( 'Proceso Terminado', mtInformation, [mbOK],0 );

      MErrores.Lines.Add('    Hora Final:' + TimeToStr(Time));
      MErrores.Lines.Add('***               TERMINA PROCESO                ***');
      MErrores.Lines.Add('====================================================');

      fSearching := False;

      MuestraDatos;
   end;   
end;

procedure TWCrFinAdic.LimpiaDatos;
var vlCol, vlRow : Integer;
begin
  sagDATOS.ColorRow[ sagDATOS.Row ] := clWhite;

  vlRow:= 1;
  for vlCol := 0 to COL_MAX do
  begin
    sagDatos.Cells    [ vlCol, vlRow ] := '';
  end;
  sagDatos.RowCount := vlRow+1;

  GridToRecord( sagDatos.RowCount-1);
  RecordToWindow;

End;





procedure TWCrFinAdic.MuestraDatos;
var Qry         : TQuery;
    nRowCount   : Integer;
    vlFHoy      : TDate;
    vlRemanente : Double;
    vlEsDescto  : Boolean;
    vlBCobraPer : Boolean;
    vlError     : String;
  //vlImporte          : Double;
  vlIVA              : Double;
  vlBenBco           : Double;
  vlBenGob           : Double;
  vlMoras            : Double;
  vlIVAMoras         : Double;
  vlTotal            : Double;
  vlTotCap           : Double;
  vlTotInt           : Double;
  vlTotCom           : Double;
  iCredLlave         : Integer;
begin
  if fSearching then exit; // Si esta haciendo una busqueda no entra al evento
  fSearching := True;
  fDataFound := False;
  try
    LimpiaDatos;
    Bselperiodo:=false;    

    // ---------  Construye la cadena SQL de busqueda y obtiene un Query ---------
    MErrores.Lines.Add('====================================================');
    MErrores.Lines.Add('***                 INICIA PROCESO               ***');
    MErrores.Lines.Add('    Hora inicio:' + TimeToStr(Time));

    Qry := GetSQLQueryNoNil( BuildSQLStr, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
    nRowCount := 1;
    //MErrores.Lines.Assign( Qry.SQL );
    // ------------------------- Barre el QUERY de datos -------------------------
    if Assigned(Qry) and NOT( Qry.IsEmpty ) THEN
    begin
      fDataFound := True;
      iCredLlave := 0;
      while Not Qry.Eof Do
      begin
        with sagDatos do
        begin
          If Cells[COL_CRED,nRowCount]<>'' Then nRowCount:= nRowCount+1;
          sagDatos.RowCount:= nRowCount+1;
          ColorRow[ nRowCount ] := clWhite;

          // Asigna los formatos de las celdas
          vlTotal:= Qry.FieldByName('IMP_NETO').AsFloat;
          vlTotInt:= Qry.FieldByName('IMP_INTERES').AsFloat;
          vlIVA:= Qry.FieldByName('IMP_INTERES').AsFloat;

          Cells[COL_SEL, nRowCount] := 'F';
          // Valida Descuento de documentos
          If Qry.FieldByName('B_FINAN_ADIC').AsString='V' then Begin
            ColorRow[ nRowCount ] := cRowColor;
            If (Qry.FieldByName('F_VALOR').AsDateTime<= Objeto.dtHoy) Then Begin
              If iCredLlave<>Qry.FieldByName('ID_CREDITO').AsInteger Then Begin //para que sólo el primer periodo seleccione
                Objeto.StpObtAdeudo( Qry.FieldByName('ID_CREDITO').AsInteger,
                                     Qry.FieldByName('NUM_PERIODO').AsInteger,
                                     '',
                                     Qry.FieldByName('F_VALOR').AsDateTime,
                                     0,
                                     '',
                                     'IN', //2,
                                     vlTotal,   // vlTotCap,    vlTotInt,  vlTotCom,
                                     vlTotInt,  vlIVA,       vlBenBco,  vlBenGob,
                                     vlMoras,   vlIVAMoras,  vlError );
                Cells[COL_SEL, nRowCount] := 'V';
                iCredLlave:= Qry.FieldByName('ID_CREDITO').AsInteger;
              End;
            End;
          End;
          //  Datos visibles en pantalla
          Cells[COL_CRED,nRowCount] := Qry.FieldByName('ID_CREDITO').AsString;
          Cells[COL_PERI,nRowCount] := Qry.FieldByName('NUM_PERIODO').AsString;
          Cells[COL_FVTO,nRowCount] := Qry.FieldByName('F_VENCIMIENTO').AsString;
          Cells[COL_FVAL,nRowCount] := Qry.FieldByName('F_VALOR').AsString;
          Cells[COL_SIT,nRowCount]  := Qry.FieldByName('SIT_INTERES').AsString;
          Cells[COL_IINT,nRowCount] := Format(CFORMAT_DINERO,[ vlTotInt]);
          Cells[COL_IIVA,nRowCount] := Format(CFORMAT_DINERO,[ vlIVA ]);
          Cells[COL_ITOT,nRowCount] := Format(CFORMAT_DINERO,[ vlTotal ]);
          Cells[COL_ACRE,nRowCount] := Qry.FieldByName('NOM_ACREDITADO').AsString;
          //  Datos No visibles en pantalla
          Cells[COL_CTTO,nRowCount] := Qry.FieldByName('ID_CONTRATO').AsString;
          Cells[COL_FCTO,nRowCount] := Qry.FieldByName('FOL_CONTRATO').AsString;
          Cells[COL_CREX,nRowCount] := Qry.FieldByName('ID_CRED_EXTERNO').AsString;
          Cells[COL_CTEX,nRowCount] := Qry.FieldByName('ID_CONTROL_EXT').AsString;
          Cells[COL_IACR,nRowCount] := Qry.FieldByName('ID_ACREDITADO').AsString;
          Cells[COL_ICRE,nRowCount] := Format(CFORMAT_DINERO,[ Qry.FieldByName('IMP_CREDITO').AsFloat ]);
          Cells[COL_SALD,nRowCount] := Format(CFORMAT_DINERO,[ Qry.FieldByName('SDO_INSOLUTO').AsFloat ]);
          Cells[COL_CPRO,nRowCount] := Qry.FieldByName('CVE_PRODUCTO_CRE').AsString;
          Cells[COL_CMON,nRowCount] := Qry.FieldByName('CVE_MONEDA').AsString;
          Cells[COL_DMON,nRowCount] := Qry.FieldByName('DESC_MONEDA').AsString;
          Cells[COL_CPRO,nRowCount] := Qry.FieldByName('CVE_PRODUCTO_CRE').AsString;
          Cells[COL_FINI,nRowCount] := Qry.FieldByName('F_INICIO').AsString;
          Cells[COL_FFIN,nRowCount] := Qry.FieldByName('F_VENCIMIENTO').AsString;
          Cells[COL_FADI,nRowCount] := Qry.FieldByName('B_FINAN_ADIC').AsString;
          Cells[COL_BTP,nRowCount]  := 'F';
        end; //end with
        Qry.Next;
        Application.ProcessMessages;
        Bselperiodo:=true;
      end; //end While
    end;
    if Assigned(Qry) then
    begin
      Qry.Close;
      Qry.Free;
    end;                

    MErrores.Lines.Add('    Hora Final:' + TimeToStr(Time));
    MErrores.Lines.Add('***               TERMINA PROCESO                ***');
    MErrores.Lines.Add('====================================================');
  except
    on e : exception do
      fDataFound := False;
  end;
  fSearching := False;
//  sagDatos.;
end;

//  --
procedure TWCrFinAdic.btBUSCAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRFINADIC_BUSCA',True,True) then
      MuestraDatos;
end;

procedure TWCrFinAdic.cbPRODUCTOClick(Sender: TObject);
begin
  If Not cbPRODUCTO.Checked Then Objeto.Producto.Active:= False;
end;

procedure TWCrFinAdic.dtFechaVigClick(Sender: TObject);
begin
  LimpiaDatos;
end;

procedure TWCrFinAdic.edFechaVigChange(Sender: TObject);
begin
  LimpiaDatos;
end;


Function TWCrFinAdic.BuildSQLStr : String;
var vlsql        : String;
Begin
  Objeto.GetFromControl;
  Objeto.FECHA.AsDateTime := Objeto.dtHoy;

  // Arma la sentencia SQL.
  vlsql := ' SELECT CRI.ID_CREDITO, ' +
          '        CRI.NUM_PERIODO, ' +
          '        CRI.F_VENCIMIENTO, ' +
          '        CRI.SIT_INTERES, ' +
          '        CRI.IMP_INTERES - CRI.IMP_PAGADO IMP_INTERES, '+
          '        CRI.IMP_IVA - CRI.IMP_IVA_PAGADO IMP_IVA, '+
          '        ( CRI.IMP_INTERES - CRI.IMP_PAGADO ) + ( CRI.IMP_IVA - CRI.IMP_IVA_PAGADO ) AS IMP_NETO, '+
          '        CR.ID_CONTRATO, '+
          '        CR.FOL_CONTRATO, '+
          '        CR.ID_CRED_EXTERNO, ' +
          '        CR.ID_CONTROL_EXT, '  +
          '        CR.IMP_CREDITO, '     +
          '        CR.SDO_INSOLUTO, '    +
          '        CC.CVE_PRODUCTO_CRE, '+
          '        CC.CVE_MONEDA, ' +
          '        MON.DESC_MONEDA, '+
          '        CRI.F_VENCIMIENTO-CRI.PLAZO AS F_INICIO, ' +
          //'        PKGCRCOBRANZA.UltimoDiaMes(CRI.F_VENCIMIENTO-CRI.PLAZO+1) As F_VALOR, ' + // LOLS 27 05 2005     

          //COMENTADO YA QUE DEVUELVE LA FECHA VALOR PARA EL ULTIMO DIA DE MES
         { '        LEAST( CRI.F_VENCIMIENTO, ' +
          '               PKGCRCOBRANZA.UltimoDiaMes(CRI.F_VENCIMIENTO-CRI.PLAZO+1) ) As F_VALOR, ' +}

          '        CRI.F_VENCIMIENTO As F_VALOR, ' +

          '        CTTO.ID_TITULAR AS ID_ACREDITADO, '+
          '        SPF_NOMBRE_CTTE(CTTO.ID_CONTRATO,CTTO.ID_TITULAR) AS NOM_ACREDITADO, ' +
          '        CRI.B_FINAN_ADIC ' +
          '   FROM CR_INTERES CRI, '+
          '        CR_CREDITO CR, '+
          '        CR_CONTRATO CC, ' +
          '        CR_PRODUCTO PROD, ' +
          '        CONTRATO CTTO, '+
          '        MONEDA MON '+
          '  WHERE CRI.ID_CREDITO = CR.ID_CREDITO ' +
          '    AND CR.ID_CONTRATO = CC.ID_CONTRATO ' +
          '    AND CR.FOL_CONTRATO = CC.FOL_CONTRATO ' +
          '    AND CC.ID_CONTRATO  = CTTO.ID_CONTRATO ' +
          '    AND PROD.CVE_PRODUCTO_CRE = CC.CVE_PRODUCTO_CRE ' +
          '    AND CC.CVE_MONEDA   = MON.CVE_MONEDA ' +
          '    AND PROD.B_FINANC_ADIC = ''V'' ' +
          '    AND CC.B_FINANC_ADIC = ''V'' ' +
          '    AND CR.B_FINANC_ADIC = ''V'' ' +
          '    AND CRI.B_FINAN_ADIC = ''V'' ' +
          '    AND CR.SIT_CREDITO   = ''AC'' ' +
          '    AND CTTO.ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa) + // LOLS 09 SEP 2005
          '    AND CRI.F_VENCIMIENTO-CRI.PLAZO <= '+ Objeto.FECHA.AsSQL  + ' ';

  If cbAplicaVig.Checked Then Begin
    vlsql  := vlSql +
          '    AND CRI.F_VENCIMIENTO-CRI.PLAZO < '+ Objeto.FECHA_VIG.AsSQL+' '+
          '    AND CRI.F_VENCIMIENTO  >=  '+ Objeto.FECHA_VIG.AsSQL+' ';
  End;

    vlsql  := vlSql +
          '    AND SIT_INTERES IN (''AC'',''IM'') ';

  If Trim(edCVE_PRODUCTO_CRE.Text) <> '' Then Begin
    vlsql  := vlSql + ' AND CC.CVE_PRODUCTO_CRE = ''' + Trim(edCVE_PRODUCTO_CRE.Text) + ''' ';
  End;

//  If Objeto.VALOR_FILTRO.AsString <> '' Then Begin
  If Trim(edValorFiltro.text) <> '' Then Begin
    if Objeto.TIPO_FILTRO.AsString = coF_Acred        then
       vlsql  := vlSql + 'AND CTTO.ID_TITULAR = '      + Trim(edValorFiltro.text)
    else if Objeto.TIPO_FILTRO.AsString = coF_Disp    then
       vlsql  := vlSql + 'AND CR.ID_CREDITO = '        + Trim(edValorFiltro.text)
    else if Objeto.TIPO_FILTRO.AsString = coF_NoCtrl  then
       vlsql  := vlSql + 'AND CR.ID_CONTROL_EXT  = '   + Trim(edValorFiltro.text)
    else if Objeto.TIPO_FILTRO.AsString = coF_IdFIRA  then
       vlsql  := vlSql + 'AND CR.ID_CRED_EXTERNO = '   + Trim(edValorFiltro.text);
  End;

   vlsql  := vlSql + ' ORDER BY CRI.ID_CREDITO, CRI.NUM_PERIODO';
   Result := vlsql;
end;

procedure TCrFinAdic.StpObtAdeudo( peIdCredito: Integer; peNumPeriodo: Integer;
                   peCveComision: String; pFCalculo: TDate; pFactor: Double;
                   pBIVA: String; pMetodo: String; var vlTotal, //vlCapital,
                   //vlInteres, vlConcepto,
                   vlImporte, vlIVA, vlBenBco, vlBenGob,
                   vlMoras, vlIVAMoras : Double; var  vlError : String );
var  STPObtAdeudo : TStoredProc;
Begin
  STPObtAdeudo := TStoredProc.Create(Nil);
  try
    with STPObtAdeudo do
    begin
      DatabaseName:= Apli.DatabaseName;
      SessionName:= Apli.SessionName;
      StoredProcName:='PKGCRPERIODO.STPOBTENADEUDO';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam( ftInteger, 'peIdCredito',   ptInput);
      Params.CreateParam( ftInteger, 'peNumPeriodo',  ptInput);
      Params.CreateParam( ftString,  'peCveComision', ptInput);
      Params.CreateParam( ftDate,    'peFReferencia', ptInput);
      Params.CreateParam( ftDate,    'peFCalculo',    ptInput);
      Params.CreateParam( ftFloat,   'peFactor',      ptInput);
      Params.CreateParam( ftString,  'peBIVA',        ptInput);
      //Params.CreateParam( ftInteger, 'peMetodo',      ptInput);
      Params.CreateParam( ftString,  'peCveAccesorio',ptInput);
      Params.CreateParam( ftFloat,   'psImporte',     ptOutput);
      Params.CreateParam( ftFloat,   'psIVA',         ptOutput);
      Params.CreateParam( ftFloat,   'psBenBco',      ptOutput);
      Params.CreateParam( ftFloat,   'psBenGob',      ptOutput);
      Params.CreateParam( ftFloat,   'psMoras',       ptOutput);
      Params.CreateParam( ftFloat,   'psIVAMoras',    ptOutput);
      Params.CreateParam( ftFloat,   'psTotal',       ptOutput);
      //Params.CreateParam( ftFloat,   'psConcepto',    ptOutput);
      //Params.CreateParam( ftFloat,   'psInteres',     ptOutput);
      //Params.CreateParam( ftFloat,   'psCapital',     ptOutput);
      Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
      Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
      //
      ParamByName('peIdCredito').AsInteger  := peIdCredito;
      ParamByName('peNumPeriodo').AsInteger := peNumPeriodo;
      ParamByName('peCveComision').Clear;// AsString := peCveComision;
      ParamByName('peFReferencia').AsDateTime := dtHoy;
      ParamByName('peFCalculo').AsDate  := pFCalculo;
      ParamByName('peFactor').Clear;// AsFloat   := pFactor;
      ParamByName('peBIVA').Clear;// AsString    := pBIVA;
      //ParamByName('peMetodo').AsInteger := pMetodo;
      ParamByName('peCveAccesorio').AsString := pMetodo;


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

        //vlConcepto:= ParamByName('psConcepto').AsFloat;
        //vlInteres := ParamByName('psInteres').AsFloat;
        //vlCapital := ParamByName('psCapital').AsFloat;

      end
      else
      begin
        vlError := 'PROBLEMAS AL OBTENER DATOS: ' + coCRLF +
                   'Código : ' + ParamByName('psRESULTADO').AsString + coCRLF +
                   'Mensaje: ' + ParamByName('psTxResultado').AsString;
        MessageDlg( vlError, mtError, [mbOK],0 );
      end;
    end;
  finally
    STPObtAdeudo.Free;
  end;
end;


procedure TWCrFinAdic.GridToRecord(peRowGrid: Integer);
begin
  fRefrescando:= True;

  Objeto.B_SELECCIONADO.AsString    := sagDatos.Cells[ COL_SEL, peRowGrid ];
  Objeto.ID_CREDITO.AsString        := sagDatos.Cells[ COL_CRED, peRowGrid ];
  Objeto.NUM_PERIODO.AsString       := sagDatos.Cells[ COL_PERI, peRowGrid ];
  Objeto.F_VENCIMIENTO.AsString     := sagDatos.Cells[ COL_FVTO, peRowGrid ];
  Objeto.F_VALOR.AsString           := sagDatos.Cells[ COL_FVAL, peRowGrid ];
  Objeto.SIT_INTERES.AsString       := sagDatos.Cells[ COL_SIT, peRowGrid ];
  Objeto.IMP_INTERES.AsString       := sagDatos.Cells[ COL_IINT, peRowGrid ];
  Objeto.IMP_IVA.AsString           := sagDatos.Cells[ COL_IIVA, peRowGrid ];
  Objeto.IMP_TOTAL.AsString         := sagDatos.Cells[ COL_ITOT, peRowGrid ];
  Objeto.ID_CONTRATO.AsString       := sagDatos.Cells[ COL_CTTO, peRowGrid ];
  Objeto.FOL_CONTRATO.AsString      := sagDatos.Cells[ COL_FCTO, peRowGrid ];
  Objeto.ID_CRED_EXTERNO.AsString   := sagDatos.Cells[ COL_CREX, peRowGrid ];
  Objeto.ID_CONTROL_EXT.AsString    := sagDatos.Cells[ COL_CTEX, peRowGrid ];
  Objeto.NOM_ACREDITADO.AsString    := sagDatos.Cells[ COL_ACRE, peRowGrid ];
  Objeto.ID_ACREDITADO.AsString     := sagDatos.Cells[ COL_IACR, peRowGrid ];
  Objeto.IMP_CREDITO.AsString       := sagDatos.Cells[ COL_ICRE, peRowGrid ];
  Objeto.SDO_INSOLUTO.AsString      := sagDatos.Cells[ COL_SALD, peRowGrid ];
  Objeto.CVE_PRODUCTO_CRE.AsString  := sagDatos.Cells[ COL_CPRO, peRowGrid ];
  Objeto.CVE_MONEDA.AsString        := sagDatos.Cells[ COL_CMON, peRowGrid ];
  Objeto.DESC_MONEDA.AsString       := sagDatos.Cells[ COL_DMON, peRowGrid ];
  Objeto.F_INICIO.AsString          := sagDatos.Cells[ COL_FINI, peRowGrid ];
  Objeto.F_FIN.AsString             := sagDatos.Cells[ COL_FFIN, peRowGrid ];
  Objeto.B_FINAN_ADIC.AsString      := sagDatos.Cells[ COL_FADI, peRowGrid ];
  Objeto.B_TASA_PASIVA.AsString     := sagDatos.Cells[ COL_BTP,  peRowGrid ];

  fRefrescando:= False;

end;

procedure TWCrFinAdic.RecordToWindow;
begin
  fRefrescando:= True;
  Objeto.B_SELECCIONADO.DrawControl;
  Objeto.ID_CREDITO.DrawControl;
  Objeto.NUM_PERIODO.DrawControl;
  Objeto.F_VENCIMIENTO.DrawControl;
  Objeto.F_VALOR.DrawControl;
  Objeto.SIT_INTERES.DrawControl;
  Objeto.IMP_INTERES.DrawControl;
  Objeto.IMP_IVA.DrawControl;
  Objeto.IMP_TOTAL.DrawControl;
  Objeto.ID_CONTRATO.DrawControl;
  Objeto.FOL_CONTRATO.DrawControl;
  Objeto.ID_CRED_EXTERNO.DrawControl;
  Objeto.ID_CONTROL_EXT.DrawControl;
  Objeto.NOM_ACREDITADO.DrawControl;
  Objeto.ID_ACREDITADO.DrawControl;
  Objeto.IMP_CREDITO.DrawControl;
  Objeto.SDO_INSOLUTO.DrawControl;
  Objeto.CVE_PRODUCTO_CRE.DrawControl;
  Objeto.CVE_MONEDA.DrawControl;
  Objeto.DESC_MONEDA.DrawControl;
  Objeto.F_INICIO.DrawControl;
  Objeto.F_FIN.DrawControl;
  Objeto.B_FINAN_ADIC.DrawControl;
  Objeto.B_TASA_PASIVA.DrawControl;
  fRefrescando:= False;
End;


Function TWCrFinAdic.ValFechaOper( peBandera : Boolean ): Boolean;
Var
  Year, Month, Day: Word;
  fFinMes: tDateTime;
begin
  Result := False;
  if Objeto.ID_CREDITO.AsString<>'' then
  begin
    Objeto.F_VALOR.GetFromControl;
//    If Objeto.F_VALOR.asString = sagDatos.Cells[ COL_FVAL, sagDatos.Row ] Then Exit;

    if Objeto.F_VALOR.AsDateTime > Objeto.dtHoy then
    begin
      Showmessage( 'La fecha no puede ser mayor al día actual.' );
      MErrores.Lines.Add('La fecha no puede ser mayor al día actual.');
      Objeto.F_VALOR.AsString    := sagDatos.Cells[ COL_FVAL, sagDatos.Row ];
      Objeto.F_VALOR.DrawControl;
    end
{    else if ValidaFecha( Objeto.F_VALOR.AsDateTime, Objeto.Apli ) <> 0 then
    begin
      Showmessage( 'La fecha de operación debe ser un día hábil.' );
      MErrores.Lines.Add('La fecha de operación debe ser un día hábil.');
      Objeto.F_VALOR.AsString    := sagDATOS.Cells[ COL_FVAL, sagDATOS.Row ];
      Objeto.F_VALOR.DrawControl;
    end}
    else Begin
      DecodeDate(Objeto.F_VALOR.AsDateTime, Year, Month, Day);

      If Month >= 12 Then fFinMes := EncodeDate(Year, Month, 31)
      Else  fFinMes := EncodeDate(Year, Month+1, 1)-1;

      //If Objeto.F_VALOR.AsDateTime <> fFinMes then
      If  False then // LOLS 29 04 2005
      begin
        Showmessage( 'La fecha no puede ser diferente al fin de mes.' );
        MErrores.Lines.Add('La fecha no puede ser diferente al fin de mes.');
        Objeto.F_VALOR.AsString    := sagDatos.Cells[ COL_FVAL, sagDatos.Row ];
        Objeto.F_VALOR.DrawControl;
      end
      else
      begin
        Result := True;
        If peBandera Then CalculaImportes;
      End;
    end;
  end;//ends_if
end;

procedure TWCrFinAdic.cbINTERESClick(Sender: TObject);
begin
  If   fRefrescando Then Exit;

  If (cbINTERES.Checked) And  (Objeto.B_FINAN_ADIC.AsString = 'V') And
                              (Objeto.F_VALOR.AsDateTime<= Objeto.dtHoy)  Then Begin
    If ValFechaOper(True) Then
    Begin
       if Bselperiodo=False then
       begin
          Objeto.B_SELECCIONADO.AsString := 'V';
          sagDatos.Cells[ COL_SEL, sagDatos.Row ]:= Objeto.B_SELECCIONADO.AsString;
       end;
       if Bselperiodo=True then
       begin
          cbINTERES.Checked:= False;
          Objeto.B_SELECCIONADO.AsString := 'F';
          sagDatos.Cells[COL_SEL, sagDatos.Row]:= 'F';
       end;

       if Bselperiodo=False then Bselperiodo:=true;
    End
    Else
    begin
      if Bselperiodo=True then Bselperiodo:=False;
      cbINTERES.Checked:= False;
      Objeto.B_SELECCIONADO.AsString := 'F';
      sagDatos.Cells[COL_SEL, sagDatos.Row]:= 'F';
    End;
  End
  Else
  Begin
    if Objeto.B_SELECCIONADO.AsString = 'V' then Bselperiodo:=False;
    cbINTERES.Checked:= False;
    Objeto.B_SELECCIONADO.AsString := 'F';
    sagDatos.Cells[ COL_SEL, sagDatos.Row ]:= 'F';
  End;
end;

procedure TWCrFinAdic.CalculaImportes;
var  vlError            : String;
     vlImporte          : Double;
     vlIVA              : Double;
     vlBenBco           : Double;
     vlBenGob           : Double;
     vlMoras            : Double;
     vlIVAMoras         : Double;
     vlTotal            : Double;
     //vlTotCap           : Double;  // LOLS 11 11 20004
     //vlTotInt           : Double;  // LOLS 11 11 20004
     //vlTotCom           : Double;  // LOLS 11 11 20004
begin
  // Obtiene los importes de conceptos, interes y capital
  If (Trim(sagDatos.Cells[COL_SEL, sagDatos.Row])<>'V') Then Exit;

  Objeto.StpObtAdeudo( Objeto.ID_CREDITO.AsInteger,
                       Objeto.NUM_PERIODO.AsInteger,
                       '',
                       Objeto.F_VALOR.AsDateTime,
                       0,
                       '',
                       'IN', //2,
                       vlTotal,   //vlTotCap,    vlTotInt,  vlTotCom,
                       vlImporte, vlIVA,       vlBenBco,  vlBenGob,
                       vlMoras,   vlIVAMoras,  vlError );
  //

  sagDatos.Cells[ COL_FVAL, sagDatos.Row ]:= Objeto.F_VALOR.AsString;
  sagDatos.Cells[ COL_IINT, sagDatos.Row ]:=  Format(CFORMAT_DINERO,[ vlImporte]); // vlTotInt //  LOLS 11 11 2004
  sagDatos.Cells[ COL_IIVA, sagDatos.Row ]:=  Format(CFORMAT_DINERO,[ vlIVA ]);
  sagDatos.Cells[ COL_ITOT, sagDatos.Row ]:=  Format(CFORMAT_DINERO,[ vlTotal ]);

  GridToRecord(sagDatos.Row);
  RecordToWindow;

End;



procedure TWCrFinAdic.btFECHAClick(Sender: TObject);
var vlRow      : Integer;
    vlCurrRow  : Integer;
    vlCurrCol  : Integer;
    vlFecha    : TDate;
begin
    if ValFechaOper( False ) and ( MessageDlg( '¿Deseas aplicar la fecha de operación ' +
                                   Objeto.F_VALOR.AsString + ' a todos los períodos?.',
                                   mtConfirmation, mbYesNoCancel, 0 ) = mrYes ) then
    begin
      vlCurrRow := sagDATOS.Row;      // Respalda el indice del registro actual
      vlCurrCol := sagDATOS.Col;     // Respalda el indice de la columna actual
      vlFecha   := Objeto.F_VALOR.AsDateTime;    // Obtiene la fecha indicada por el usuario
      for vlRow := 1 to ( sagDATOS.RowCount - 1 ) do  // Procesa todos los registros
      begin
        sagDATOS.Row := vlRow;
        GridToRecord( vlRow );

        Objeto.F_VALOR.AsDateTime := vlFecha;

        ValFechaOper(True);   // Procesa la modificacion a la fecha  de pago

      end;

      sagDATOS.Row := vlCurrRow;
      GridToRecord( vlCurrRow );
      RecordToWindow;
    end;

end;

procedure TWCrFinAdic.cbB_TASA_PASIVAClick(Sender: TObject);
begin
  If   fRefrescando Then Exit;
  Objeto.B_TASA_PASIVA.GetFromControl;
  sagDatos.Cells[ COL_BTP, sagDatos.Row ] :=  Objeto.B_TASA_PASIVA.AsString;
end;

function  TWCrFinAdic.ImpDerecha(sImp: String): String;
Var
  iCont, iLargoMaximo: Integer;
  sCadTexto, sCadRes: String;
Begin
  sCadTexto:= '';
  sCadRes:= '';

  iLargoMaximo:= 13;
  For iCont:= 1 To iLargoMaximo Do sCadTexto:= sCadTexto+ ' ';

  sCadTexto:= COPY(sCadTexto,1, Length(sCadTexto)-Length(Trim(sImp)))+ Trim(sImp);

  For iCont:= 1 To Length(sCadTexto) Do Begin
    If POS(COPY(sCadTexto,iCont,1), ',. ')>0 Then
      sCadRes:= ' '+sCadRes+ COPY(sCadTexto,iCont,1)
    Else sCadRes:= sCadRes+ COPY(sCadTexto,iCont,1);

  End;

  Result:= sCadRes;


End;


procedure TWCrFinAdic.edINTERESExit(Sender: TObject);
begin
  If (cbINTERES.Checked) And  (Objeto.B_FINAN_ADIC.AsString = 'V') And
                              (Objeto.F_VALOR.AsDateTime<= Objeto.dtHoy)  Then Begin
    If ValFechaOper(False) Then Begin
      Objeto.B_SELECCIONADO.AsString := 'V';
      sagDatos.Cells[ COL_SEL, sagDatos.Row ]:= 'V';
      Objeto.IMP_INTERES.GetFromControl;
      Objeto.IMP_TOTAL.AsFloat:= Objeto.IMP_INTERES.AsFloat+Objeto.IMP_IVA.AsFloat;

      sagDatos.Cells[COL_IINT,sagDatos.Row] :=  Format(CFORMAT_DINERO,[ Objeto.IMP_INTERES.AsFloat]);
      sagDatos.Cells[COL_IIVA,sagDatos.Row] :=  Format(CFORMAT_DINERO,[ Objeto.IMP_IVA.AsFloat ]);
      sagDatos.Cells[COL_ITOT,sagDatos.Row] :=  Format(CFORMAT_DINERO,[ Objeto.IMP_TOTAL.AsFloat ]);
    End
    Else Begin
      GridToRecord( sagDatos.Row );
      RecordToWindow;
    End;
  End
  Else Begin
    GridToRecord( sagDatos.Row );
    RecordToWindow;
  End;
end;

procedure TWCrFinAdic.cbAplicaVigClick(Sender: TObject);
begin
  If cbAplicaVig.Checked Then Begin
    edFechaVig.Enabled:= True;
    dtFechaVig.Enabled:= True;
  End
  Else Begin
    edFechaVig.Enabled:= False;
    dtFechaVig.Enabled:= False;
  End;
  LimpiaDatos;
end;


procedure TWCrFinAdic.sagDATOSSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  GridToRecord( ARow );
  RecordToWindow;
end;

procedure TWCrFinAdic.BitBtn2Click(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRFINADIC_AUTOR',True,True) then
   begin
      if Objeto.ID_CONTRATO.AsString <> '' then
      Begin
        Objeto.CrContrato.FindKey([Objeto.ID_CONTRATO.AsInteger, Objeto.FOL_CONTRATO.AsInteger ]);
        Objeto.CrContrato.Acreditado.FindKey([Objeto.CrContrato.Contrato.ID_Titular.AsString]);
        Objeto.CrContrato.Catalogo;
      End;
   end;
end;

procedure TWCrFinAdic.BitBtn3Click(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRFINADIC_DISP2',True,True) then
   begin
      if Objeto.ID_CREDITO.AsString <> '' then
      Begin
        Objeto.Credito.FindKey([Objeto.ID_CREDITO.AsInteger]);
        Objeto.Credito.Catalogo;
      end;
   end;
end;

procedure TWCrFinAdic.BitBtn4Click(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRFINADIC_PROD2',True,True) then
   begin
      if Objeto.CVE_PRODUCTO_CRE.AsString <> '' then
      Begin
        Objeto.Producto.FindKey([ Objeto.CVE_PRODUCTO_CRE.AsString ]);
        Objeto.Producto.Catalogo;
      end;
   end;
end;

procedure TWCrFinAdic.btINTERESClick(Sender: TObject);
var VCrIntere : TVCrIntere;
begin
   if Objeto.ValidaAccesoEsp('TCRFINADIC_INTER',True,True) then
   begin
       if (Objeto.ID_CREDITO.AsInteger<>0) And (Objeto.NUM_PERIODO.AsInteger<>0) then
       Begin
         {$WARNINGS OFF}
         VCrIntere := TVCrIntere.Create(Self);
         {$WARNINGS ON}
         Try
          VCrIntere.GetParams(Objeto);
          VCrIntere.ID_CREDITO.AsInteger  := Objeto.ID_CREDITO.AsInteger;
          VCrIntere.NUM_PERIODO.AsInteger := Objeto.NUM_PERIODO.AsInteger;
          VCrIntere.ParamCre := Objeto.ParamCre;
          VCrIntere.Catalogo;
         Finally
          If Assigned(VCrIntere) Then VCrIntere.Free;
         End;
       end;
   end;
end;

procedure TWCrFinAdic.sagDATOSDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
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
  If ARow = 0 Then Exit;

  with (Sender As TStringGrid) Do
  begin
    if (ACol = COL_SEL) then
    begin
      vlCol := ACol;
      Bmp := TBitmap.Create;
      if Assigned(Bmp) then
      begin
        // Determina la imagen a utilizar
        If (Cells[ vlCol, ARow ]= 'V') then
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

procedure TWCrFinAdic.sagDATOSMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var ACol  : Integer;
    ARow  : Integer;
begin
  if Objeto.ID_CREDITO.AsInteger > 0 then
  begin
    sagDATOS.MouseToCell(X, Y ,ACol, ARow);

    If ARow = 0 Then Exit;

    //SELECCIONA LA COBRANZA DE LOS CONCEPTOS
    If (  ACol = COL_SEL  ) Then //  selecciona la cobranza de los conceptos
    begin
      cbINTERES.Checked := not cbINTERES.Checked;
    end;
  end;
end;

procedure TWCrFinAdic.edFECHA_VALORExit(Sender: TObject);
begin
  ValFechaOper(True);   // Procesa la modificacion a la fecha  de pago
end;

procedure TWCrFinAdic.dtFECHAExit(Sender: TObject);
begin
  edFECHA_VALORExit( edFECHA_VALOR );
end;

procedure TWCrFinAdic.cbSeleccionClick(Sender: TObject);
{var vlRow     : Integer;
    vlCurrRow : Integer;
    vlCurrCol : Integer;
    vlCobra   : String;}
begin
{  vlCurrRow := sagDatos.Row;
  vlCurrCol := sagDatos.Col;
  for vlRow := 1 to ( sagDATOS.RowCount - 1 ) do         // Procesa todos los registros
  begin
    sagDatos.Row:= vlRow;
    GridToRecord( vlRow);
    RecordToWindow;

    if Objeto.ID_CREDITO.AsInteger > 0 then
    begin
      cbINTERES.Checked:= cbSeleccion.Checked;
    End;

  end;
  sagDatos.Row:=  vlCurrRow;
  sagDatos.Col:=  vlCurrCol;
  GridToRecord( vlRow);
  RecordToWindow;
 }
end;

procedure TWCrFinAdic.sbLogCobranzaClick(Sender: TObject);
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
  fList.SaveToFile('c:\grig_finan_' + FormatDateTime( 'hhnnss', now )  + '.csv');
 finally
   fList.Free;
 end;
end;


procedure TWCrFinAdic.CBtodosClick(Sender: TObject);
begin
   if CBtodos.Checked then
   begin
      //
      Objeto.Producto.BuscaWhereString := 'CR_PRODUCTO.ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa);  // LOLS 08 SEP 2005
      Objeto.Producto.FilterString     := Objeto.Producto.BuscaWhereString;
      Objeto.Credito.BuscaWhereString  := 'PKGCRACTUALIZA.STPOBTEMPCTTO(CR_CREDITO.ID_CONTRATO)= ' +  // LOLS 08 SEP 2005
                                          IntToStr(Objeto.Apli.IdEmpresa);                            // LOLS 08 SEP 200
      Objeto.Credito.FilterString      := Objeto.Credito.BuscaWhereString;
      //
      cbAplicaVig.Checked:= False;
      cbAplicaVigClick(Self);

      LimpiaDatos;
      MuestraDatos;
      CBtodos.Checked:=false;
   end;
end;

end.
