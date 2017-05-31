// Sistema         : Clase de CR_SOL_GTIA_NAF
// Fecha de Inicio : 03/10/2005
// Función forma   : Clase de CR_SOL_GTIA_NAF
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     : 01 JUN 2006. CORRECCION CAMPO SOL FONDEO NAFIN
Unit IntCrSoGtNa;

interface

uses
Windows,   Messages,  SysUtils,  Classes,  Graphics,  Controls,  Forms,
Dialogs,   IntFrm,    DB,        DbTables, Mask,      StdCtrls,  Buttons,
ExtCtrls,  InterFor,  IntFind,   UnSQL2,   InterFun,  ComCtrls,  IntDtPk,
InterEdit, IntLinkit,

// Unidades auxiliares
IntCrCredito,
IntCrAcredit,
IntCrCto,
IntParamCre,
IntCrGruCla,
IntDom,
IntPob,
IntGenCre,
IntCrMapCla,
IntSGCtrl, Menus,
IntCrRepres // FJR SE CONECTA LA ADMINISTRACION DE LOS REPRESENTANTES DEL ACREDITADO.
;

Type
  TCrSoGtNa= class;

  TWCrSolGtiaNaf=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CREDITO : TLabel;
    edID_CREDITO : TEdit;
    lbCVE_FUNC_INTER : TLabel;
    edCVE_FUNC_INTER : TEdit;
    lbCVE_INTER_FINAN : TLabel;
    btID_CREDITO: TBitBtn;
    edDESC_CREDITO: TEdit;
    cbSITUACION: TRadioGroup;
    gbDatosAcred: TGroupBox;
    edID_ACREDITADO: TEdit;
    btnID_ACREDITADO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edSiglas_RFC: TEdit;
    Label5: TLabel;
    edCALLE_NUMERO: TEdit;
    Label6: TLabel;
    edCOLONIA: TEdit;
    Label7: TLabel;
    edCODIGO_POSTAL: TEdit;
    edDESC_CIUDAD: TEdit;
    Label8: TLabel;
    edDESC_MUNICIPIO: TEdit;
    Label9: TLabel;
    edDESC_ESTADO: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    edDESC_SECTOR_ECO: TEdit;
    btDESC_SECTOR_ECO: TBitBtn;
    Label12: TLabel;
    btDESC_TIPO_SECTOR: TBitBtn;
    edDESC_TIPO_SECTOR: TEdit;
    cbSolFondeoNafin: TCheckBox;
    cbSolPartRiesgo: TCheckBox;
    gbDatosDisp: TGroupBox;
    lbCVE_TIP_AMORTIZA: TLabel;
    lbIMP_FINANCIAMTO: TLabel;
    lbF_PARTICIPACION: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edIMP_FINANCIAMTO: TInterEdit;
    dtpF_PARTICIPACION: TInterDateTimePicker;
    edF_PARTICIPACION: TEdit;
    edIMP_CREDITO: TInterEdit;
    edDESC_MONEDA: TEdit;
    Label13: TLabel;
    edNUM_MES_PLAZO: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    edSOBRETASA: TEdit;
    Label16: TLabel;
    edID_SOLICITUD: TEdit;
    ilID_CREDITO: TInterLinkit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edCVE_INTER_FINAN: TEdit;
    btCVE_INTER_FINAN: TBitBtn;
    edInterFinan: TEdit;
    MsgPanel: TPanel;
    edF_RFC: TEdit;
    edHomoclave_RFC: TEdit;
    edCVE_SECTOR_ECO: TEdit;
    edCVE_TIPO_SECTOR: TEdit;
    btCVE_FUNC_INTER: TBitBtn;
    edDESC_FUNC_INTER: TEdit;
    edCVE_TIP_AMORTIZA: TEdit;
    btCVE_TIP_AMORTIZA: TBitBtn;
    edDESC_TIP_AMORTIZA: TEdit;
    edCVE_CIUDAD: TEdit;
    edCVE_MUNICIPIO: TEdit;
    edCVE_ESTADO: TEdit;
    edCVE_MONEDA: TEdit;
    ilCVE_TIP_AMORTIZA: TInterLinkit;
    ilCVE_INTER_FINAN: TInterLinkit;
    ilCVE_TIP_AUTORIZA: TInterLinkit;
    ilCVE_FUNC_INTER: TInterLinkit;
    ilCVE_TIP_TASA: TInterLinkit;
    edF_DISP: TEdit;
    Label17: TLabel;
    Shape4: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Shape9: TShape;
    Label22: TLabel;
    Shape14: TShape;
    Label25: TLabel;
    sgcDATA_Dis: TSGCtrl;
    Shape1: TShape;
    Label18: TLabel;
    btPropositos: TBitBtn;
    lbIMP_PROM_VENTAS: TLabel;
    edIMP_PROM_VENTAS: TInterEdit;
    lbNUM_PERSONAL: TLabel;
    lbPCT_PROD_MER_INT: TLabel;
    edPCT_PROD_MER_INT: TInterEdit;
    lbPCT_PROD_MER_EXT: TLabel;
    edPCT_PROD_MER_EXT: TInterEdit;
    lbCVE_TIP_CRED: TLabel;
    edCVE_TIP_CRED: TEdit;
    btCVE_TIP_CRED: TBitBtn;
    edDESC_TIP_CRED: TEdit;
    ilCVE_TIP_CRED: TInterLinkit;
    lbPCT_PART_RIESGO: TLabel;
    edPCT_PART_RIESGO: TInterEdit;
    lbCVE_TIP_TASA: TLabel;
    edCVE_TIP_TASA: TEdit;
    btCVE_TIP_TASA: TBitBtn;
    edDESC_TIP_TASA: TEdit;
    lbCVE_TIP_AUTORIZA: TLabel;
    edCVE_TIP_AUTORIZA: TEdit;
    btCVE_TIP_AUTORIZA: TBitBtn;
    edDESC_TIP_AUTORIZA: TEdit;
    dtpF_DISPOSICION: TInterDateTimePicker;
    lbCVE_CALIF_CRE: TLabel;
    edCVE_CALIF_CRE: TEdit;
    btCVE_MONEDA: TBitBtn;
    lbMESES_ANTIGUEDAD: TLabel;
    edNUM_MES_GRACIA: TInterEdit;
    edNUM_PERSONAL: TInterEdit;
    edMES_ANTIGUEDAD: TInterEdit;
    pmGarantias: TPopupMenu;
    RelacinarGarantas1: TMenuItem;
    lbCVE_PROGRAMA: TLabel;
    edCVE_PROGRAMA: TEdit;
    btCVE_PROGRAMA: TBitBtn;
    ilCVE_PROGRAMA: TInterLinkit;
    edDESC_PROGRAMA: TEdit;
    btnReporte: TBitBtn;
    btReactivaSol: TBitBtn;
    Label23: TLabel;
    edID_REPRESENTANTE: TEdit;
    btnID_REPRESENTANTE: TBitBtn;
    edNOMBRE_REPRESENTANTE: TEdit;
    Label24: TLabel;
    ilID_REPRESENTANTE: TInterLinkit;
    BtnRepr: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure btCVE_INTER_FINANClick(Sender: TObject);
    procedure btCVE_TIP_AUTORIZAClick(Sender: TObject);
    procedure btCVE_PROGRAMAClick(Sender: TObject);
    procedure btCVE_TIP_TASAClick(Sender: TObject);
    procedure btCVE_FUNC_INTERClick(Sender: TObject);
    procedure btCVE_TIP_CREDClick(Sender: TObject);
    procedure btCVE_TIP_AMORTIZAClick(Sender: TObject);
    procedure edPCT_PART_RIESGOExit(Sender: TObject);
    procedure edNUM_PERSONALExit(Sender: TObject);
    procedure edIMP_PROM_VENTASExit(Sender: TObject);
    procedure btCVE_TIP_CREDExit(Sender: TObject);
    procedure edPCT_PROD_MER_INTExit(Sender: TObject);
    procedure edPCT_PROD_MER_EXTExit(Sender: TObject);
    procedure btCVE_TIP_AMORTIZAExit(Sender: TObject);
    procedure edIMP_FINANCIAMTOExit(Sender: TObject);
    procedure edF_PARTICIPACIONExit(Sender: TObject);
    procedure dtpF_PARTICIPACIONExit(Sender: TObject);
    procedure btCVE_INTER_FINANExit(Sender: TObject);
    procedure btCVE_FUNC_INTERExit(Sender: TObject);
    procedure btCVE_TIP_AUTORIZAExit(Sender: TObject);
    procedure btCVE_TIP_TASAExit(Sender: TObject);
    procedure btCVE_PROGRAMAExit(Sender: TObject);
    procedure edCVE_CALIF_CREExit(Sender: TObject);
    procedure edMES_ANTIGUEDADExit(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure ilCVE_TIP_CREDEjecuta(Sender: TObject);
    procedure ilCVE_TIP_AMORTIZAEjecuta(Sender: TObject);
    procedure ilCVE_INTER_FINANEjecuta(Sender: TObject);
    procedure ilCVE_TIP_AUTORIZAEjecuta(Sender: TObject);
    procedure ilCVE_PROGRAMAEjecuta(Sender: TObject);
    procedure ilCVE_FUNC_INTEREjecuta(Sender: TObject);
    procedure ilCVE_TIP_TASAEjecuta(Sender: TObject);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure btPropositosClick(Sender: TObject);
    procedure btPropositosExit(Sender: TObject);
    procedure edNUM_MES_GRACIAExit(Sender: TObject);
    procedure cbSolFondeoNafinExit(Sender: TObject);
    procedure btnReporteExit(Sender: TObject);
    procedure btnReporteClick(Sender: TObject);
    procedure sgcDATA_DisDblClick(Sender: TObject);
    procedure RelacinarGarantas1Click(Sender: TObject);
    procedure edF_DISPExit(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btReactivaSolClick(Sender: TObject);
    procedure BtnReprClick(Sender: TObject);
    procedure btnID_REPRESENTANTEClick(Sender: TObject);
    procedure btnID_REPRESENTANTEExit(Sender: TObject);
    procedure ilID_REPRESENTANTEEjecuta(Sender: TObject);
    procedure edID_REPRESENTANTEExit(Sender: TObject);
  private
    { Private declarations }
    Procedure Buscadatos;
    Procedure VerificaMunicipio;
    Procedure AntigAcred;
    Function LlamaClassCves(sGrupo,sCveCorp,sDesc:String):String;
    Function  CadenaSql_Dis: String;
    Procedure MuestraDatos_Dis;
    Procedure RelGarantias;
    Function ObtieneClave( sClave : String ): String;
    Function ObtieneRepresPred(Acred: integer): integer ;
  public
    { Public declarations }
    Objeto : TCrSoGtNa;
  end;
  //
  TCrSoGtNa= class(TInterFrame)
  private
    function ProcessFindKeys: Boolean;
    Function ObtClaveMap(sGrupo,sCveCorp:String): String;  
  protected
    // procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
    ID_CREDITO               : TInterCampo;
    ID_SOLICITUD             : TInterCampo;
    PCT_PART_RIESGO          : TInterCampo;
    NUM_PERSONAL             : TInterCampo;
    IMP_PROM_VENTAS          : TInterCampo;
    CVE_TIP_CRED             : TInterCampo;
    PCT_PROD_MER_INT         : TInterCampo;
    PCT_PROD_MER_EXT         : TInterCampo;
    CVE_TIP_AMORTIZA         : TInterCampo;
    IMP_FINANCIAMTO          : TInterCampo;
    F_PARTICIPACION          : TInterCampo;
    CVE_FUNC_INTER           : TInterCampo;
    CVE_INTER_FINAN          : TInterCampo;
    CVE_TIP_AUTORIZA         : TInterCampo;
    CVE_PROGRAMA             : TInterCampo;
    CVE_TIP_TASA             : TInterCampo;
    CVE_CALIF_CRE            : TInterCampo;
    MES_ANTIGUEDAD           : TInterCampo;
    NUM_MES_GRACIA           : TInterCampo;
    NUM_MES_PLAZO            : TInterCampo;
    SIT_SOL_GTIA             : TInterCampo;
    ID_REPRESENTANTE         : TInterCampo;

    ParamCre                 : TParamCre;
    CrCredito     : TCrCredito;
    Acreditado    : TCrAcredit;
    CrCto         : TCrCto;
    InterFinan    : TCrGruCla;
    Domicilio     : TDomicilio;
    TipoAut       : TCrGruCla;
    TipoPrograma  : TCrGruCla;
    TipoTasa      : TCrGruCla;
    Funcionario   : TCrGruCla;
    TipoFinan     : TCrGruCla;
    FormaAmort    : TCrGruCla;
    Ciudad        : TPoblacion;
    Municipio     : TPoblacion;
    Estado        : TPoblacion;
    Sector        : TCrGruCla;
    CrRepres      : TCrRepres; // FJR CLASE DE REPRESENTANTES POR ACREDITADO
    Repres        : TCrRepres;
    //
    vgIdCredito   : Integer;
    //
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
    Function    InternalPost:Boolean; override;
    //
    function    stpObtEquivalencia( IdCredito, Metodo : Integer; var PctEquiv : Double) : Boolean;
    function    ReactivaSol: Boolean;
    function    stpObtFondeoNafin( IdCredito : Integer ) : String;
  published
    //
  end;

const
  // Grupos de claves
  coINTERM  = 'INTERM';
  coFUNINT  = 'FUNINT';
  coTIPPRO  = 'TIPPRO';
  coFORAUT  = 'FORAUT';
  coTPTASA  = 'TPTASA';
  coTIP_CR  = 'TIP_CR';
  coCVESEC  = 'CVESEC';
  coTIPAUT  = 'TIPAUT';
  // Valores por default de la solicitud de garantía PYME
  coSOGTNF  = 'SOGTNF'; // Clave del grupo
  coSGCVIN  = 'SGCVIN'; // Clave del intermediario
  coSGFNIN  = 'SGFNIN'; // Clave del funcionario facultado
  coSGFATD  = 'SGFATD'; // Forma de amortizacion tradicional
  coSGFAFN  = 'SGFAFN'; // Forma de amortizacion refinanciamiento de intereses
  coSGCVTA  = 'SGCVTA'; // Tipo de autorizacion
  //
  coMsgReactiva = '¿Está seguro de reactivar la solicitud de participación en el riesgo?' + #13#10 +
                  'Esta operación va a hacer que se envie nuevamente la solicitud a NAFIN.';


implementation
Uses IntCrMapMuni, IntCrExpPPDe, IntQrRepSolid;

{$R *.DFM}


constructor TCrSoGtNa.Create( AOwner : TComponent );
begin
  Inherited;
  ID_CREDITO       := CreaCampo( 'ID_CREDITO',        ftFloat,  tsNinguno, tsNinguno, True );
  ID_SOLICITUD     := CreaCampo( 'ID_SOLICITUD',      ftFloat,  tsNinguno, tsNinguno, True );
  PCT_PART_RIESGO  := CreaCampo( 'PCT_PART_RIESGO',   ftFloat,  tsNinguno, tsNinguno, True );
  NUM_PERSONAL     := CreaCampo( 'NUM_PERSONAL',      ftFloat,  tsNinguno, tsNinguno, True );
  IMP_PROM_VENTAS  := CreaCampo( 'IMP_PROM_VENTAS',   ftFloat,  tsNinguno, tsNinguno, True );
  CVE_TIP_CRED     := CreaCampo( 'CVE_TIP_CRED',      ftString, tsNinguno, tsNinguno, True );
  PCT_PROD_MER_INT := CreaCampo( 'PCT_PROD_MER_INT',  ftFloat,  tsNinguno, tsNinguno, True );
  PCT_PROD_MER_EXT := CreaCampo( 'PCT_PROD_MER_EXT',  ftFloat,  tsNinguno, tsNinguno, True );
  CVE_TIP_AMORTIZA := CreaCampo( 'CVE_TIP_AMORTIZA',  ftString, tsNinguno, tsNinguno, True );
  IMP_FINANCIAMTO  := CreaCampo( 'IMP_FINANCIAMTO',   ftFloat,  tsNinguno, tsNinguno, True );
  F_PARTICIPACION  := CreaCampo( 'F_PARTICIPACION',   ftDate,   tsNinguno, tsNinguno, True );
  CVE_FUNC_INTER   := CreaCampo( 'CVE_FUNC_INTER',    ftString, tsNinguno, tsNinguno, True );
  CVE_INTER_FINAN  := CreaCampo( 'CVE_INTER_FINAN',   ftString, tsNinguno, tsNinguno, True );
  CVE_TIP_AUTORIZA := CreaCampo( 'CVE_TIP_AUTORIZA',  ftString, tsNinguno, tsNinguno, True );
  CVE_PROGRAMA     := CreaCampo( 'CVE_PROGRAMA',      ftString, tsNinguno, tsNinguno, True );
  CVE_TIP_TASA     := CreaCampo( 'CVE_TIP_TASA',      ftString, tsNinguno, tsNinguno, True );
  CVE_CALIF_CRE    := CreaCampo( 'CVE_CALIF_CRE',     ftString, tsNinguno, tsNinguno, True );
  MES_ANTIGUEDAD   := CreaCampo( 'MES_ANTIGUEDAD',    ftFloat,  tsNinguno, tsNinguno, True );
  NUM_MES_GRACIA   := CreaCampo( 'NUM_MES_GRACIA',    ftFloat,  tsNinguno, tsNinguno, True );
  NUM_MES_PLAZO    := CreaCampo( 'NUM_MES_PLAZO',     ftFloat,  tsNinguno, tsNinguno, True );

  SIT_SOL_GTIA     := CreaCampo( 'SIT_SOL_GTIA',      ftString, tsNinguno, tsNinguno, True );
  with SIT_SOL_GTIA do begin
    Size:=2;
    UseCombo:=True;
    ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
    ComboLista.Add('1'); ComboDatos.Add(CSIT_EN);
  End;

  ID_REPRESENTANTE := CreaCampo('ID_REPRESENTANTE', ftInteger, tsNinguno, tsNinguno, True) ;
  //
  ID_CREDITO.Caption       := 'Id. Crédito';
  ID_SOLICITUD.Caption     := 'Id. Solicitud';
  PCT_PART_RIESGO.Caption  := 'PCT Participación en el Riesgo';
  NUM_PERSONAL.Caption     := 'Personal Ocupado';
  IMP_PROM_VENTAS.Caption  := 'Promedio de Ventas Anual';
  CVE_TIP_CRED.Caption     := 'Tipo de Financiamiento';
  PCT_PROD_MER_INT.Caption := 'PCT Producción al Mercado Interno';
  PCT_PROD_MER_EXT.Caption := 'PCT Producción al Mercado Externo';
  CVE_TIP_AMORTIZA.Caption := 'Forma de Amortización';
  IMP_FINANCIAMTO.Caption  := 'Monto de Financiamiento';
  F_PARTICIPACION.Caption  := 'Fecha Participación';
  CVE_FUNC_INTER.Caption   := 'Funcionario de Intermediario Financiero';
  CVE_INTER_FINAN.Caption  := 'Intermediario Financiero';
  CVE_TIP_AUTORIZA.Caption := 'Tipo de Autorización';
  CVE_PROGRAMA.Caption     := 'Tipo Programa';
  CVE_TIP_TASA.Caption     := 'Tipo Tasa';
  CVE_CALIF_CRE.Caption    := 'Calificación Inicial';
  MES_ANTIGUEDAD.Caption   := 'Antiguedad Cliente';
  SIT_SOL_GTIA.Caption     := 'Situación';
  ID_REPRESENTANTE.Caption := 'Representante o Contacto' ;
  //
  FKeyFields.Add('ID_CREDITO');
  FKeyFields.Add('ID_SOLICITUD');
  //
  TableName := 'CR_CB_SOL_GTIA';
  UseQuery := True;
  HelpFile := 'IntCrSoGtNa.Hlp';
  ShowMenuReporte:=True;

  CrCredito := TCrCredito.Create(Self);
  CrCredito.MasterSource:=Self;
  CrCredito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';
  Acreditado := TCrAcredit.Create(Self);
  Acreditado.MasterSource:=Self;
  CrCto := TCrCto.Create(Self);
  CrCto.MasterSource:=Self;
  InterFinan := TCrGruCla.Create(Self);
  InterFinan.MasterSource:=Self;
  Domicilio  := TDomicilio.Create(Self);
  Domicilio.MasterSource:=Self;
  TipoAut    := TCrGruCla.Create(Self);
  TipoAut.MasterSource:=Self;
  TipoPrograma:= TCrGruCla.Create(Self);
  TipoPrograma.MasterSource:=Self;
  TipoTasa   := TCrGruCla.Create(Self);
  TipoTasa.MasterSource:=Self;
  Funcionario := TCrGruCla.Create(Self);
  Funcionario.MasterSource:=Self;
  TipoFinan  := TCrGruCla.Create(Self);
  TipoFinan.MasterSource:=Self;
  FormaAmort := TCrGruCla.Create(Self);
  FormaAmort.MasterSource:=Self;
  Ciudad  := TPoblacion.Create(Self);
  Ciudad.MasterSource:=Self;
  Municipio  := TPoblacion.Create(Self);
  Municipio.MasterSource:=Self;
  Estado  := TPoblacion.Create(Self);
  Estado.MasterSource:=Self;
  Sector := TCrGruCla.Create(Self);
  Sector.MasterSource:=Self;
  CrRepres:= TCrRepres.Create(Self);
  CrRepres.MasterSource:= Self ;
  //CrRepres.BuscaWhereString:= 'B_PREDETERMINADO = ' + QuotedStr(CoVERDAD);
  Repres:= TCrRepres.Create(Self) ;
  //Repres.BuscaWhereString:= 'B_PREDETERMINADO = ' + QuotedStr(CoVERDAD);
  Repres.MasterSource:= Self ;
  vgIdCredito := 0;
end;

Destructor TCrSoGtNa.Destroy;
begin
   If CrCredito <> Nil Then
      CrCredito.Free;
   If Acreditado <> Nil Then
      Acreditado.Free;
   If CrCto <> Nil Then
      CrCto.Free;
   If InterFinan <> Nil Then
      InterFinan.Free;
   If Domicilio <> Nil Then
      Domicilio.Free;
   If TipoAut <> Nil Then
      TipoAut.Free;
   If TipoPrograma <> Nil Then
      TipoPrograma.Free;
   If TipoTasa <> Nil Then
      TipoTasa.Free;
   If Funcionario <> Nil Then
      Funcionario.Free;
   If TipoFinan <> Nil Then
      TipoFinan.Free;
   If FormaAmort <> Nil Then
      FormaAmort.Free;
   If Ciudad <> Nil Then
      Ciudad.Free;
   If Municipio <> Nil Then
      Municipio.Free;
   If Estado <> Nil Then
      Estado.Free;
   If Sector <> Nil Then
      Sector.Free;
   If CrRepres <> Nil Then
      CrRepres.Free;
   If Repres <> Nil then
      Repres.Free ;

inherited;
end;


function TCrSoGtNa.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrSolGtiaNaf;
begin
   W:=TWCrSolGtiaNaf.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrSoGtNa.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrSoGN.it','F,F');
      Try if Active then begin T.Param(0,ID_CREDITO.AsString);
                               T.Param(1,ID_SOLICITUD.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

function TCrSoGtNa.Reporte:Boolean;
begin //Execute_Reporte();
end;

Function TCrSoGtNa.InternalPost : Boolean;
Var
   stpInserta: TStoredProc;
   VLSalida : Boolean;
Begin
   InternalPost := False;
   VLSalida := False;
   If Modo=moEdit Then Begin
        Result:=Inherited InternalPost;
        VLSalida := True;
   End;

   If Modo=moAppEnd Then Begin
      stpInserta:=TStoredProc.Create(Nil);
      Try
         Try
            stpInserta.DatabaseName:=DataBaseName;
            stpInserta.SessionName:=SessionName;
            stpInserta.Active:=False;
            stpInserta.Params.Clear;
            stpInserta.StoredProcName:='PKGCRCREDITOO1.STPINSERTSOLGTIANAF';
            stpInserta.Params.CreateParam(ftInteger, 'PEID_CREDITO',ptInput);
            stpInserta.Params.CreateParam(ftInteger, 'PEID_SOLICITUD',ptInputOutput);
            stpInserta.Params.CreateParam(ftFloat,   'PEPCT_PART_RIESGO',ptInput);
            stpInserta.Params.CreateParam(ftInteger, 'PENUM_PERSONAL',ptInput);
            stpInserta.Params.CreateParam(ftFloat,   'PEIMP_PROM_VENTAS',ptInput);
            stpInserta.Params.CreateParam(ftString,  'PECVE_TIP_CRED',ptInput);
            stpInserta.Params.CreateParam(ftFloat,   'PEPCT_PROD_MER_INT',ptInput);
            stpInserta.Params.CreateParam(ftFloat,   'PEPCT_PROD_MER_EXT',ptInput);
            stpInserta.Params.CreateParam(ftString,  'PECVE_TIP_AMORTIZA',ptInput);
            stpInserta.Params.CreateParam(ftFloat,   'PEIMP_FINANCIAMTO',ptInput);
            stpInserta.Params.CreateParam(ftDate,    'PEF_PARTICIPACION',ptInput);
            stpInserta.Params.CreateParam(ftString,  'PECVE_FUNC_INTER',ptInput);
            stpInserta.Params.CreateParam(ftString,  'PECVE_INTER_FINAN',ptInput);
            stpInserta.Params.CreateParam(ftString,  'PECVE_TIP_AUTORIZA',ptInput);
            stpInserta.Params.CreateParam(ftString,  'PECVE_PROGRAMA',ptInput);
            stpInserta.Params.CreateParam(ftString,  'PECVE_TIP_TASA',ptInput);
            stpInserta.Params.CreateParam(ftString,  'PECVE_CALIF_CRE',ptInput);
            stpInserta.Params.CreateParam(ftFloat,   'PENUM_MES_GRACIA',ptInput);
            stpInserta.Params.CreateParam(ftFloat,   'PENUM_MES_PLAZO',ptInput);
            stpInserta.Params.CreateParam(ftFloat,   'PEMES_ANTIGUEDAD',ptInput);
            stpInserta.Params.CreateParam(ftString,  'PESIT_SOL_GTIA',ptInput);
            stpInserta.Params.CreateParam(ftDate,    'PEF_ALTA',ptInput);
            stpInserta.Params.CreateParam(ftString,  'PECVE_USUA_ALTA',ptInput);
            stpInserta.Params.CreateParam(ftDate,    'PEF_MODIFICA',ptInput);
            stpInserta.Params.CreateParam(ftString,  'PECVE_USU_MODIFICA',ptInput);
            stpInserta.Params.CreateParam(ftInteger, 'PEID_EMPRESA',ptInput);
            //  FJR SE AGREGA EL PARAMETRO DEL ID DE REPRESENTANTE
            stpInserta.Params.CreateParam(ftInteger, 'PEID_REPRESENTANTE',ptInput);
            //  FJR
            stpInserta.Params.CreateParam(ftString,  'PEBCOMMIT',ptInput);
            stpInserta.Params.CreateParam(ftInteger, 'PSRESULTADO',ptOutput);
            stpInserta.Params.CreateParam(ftString,  'PSTX_RESULTADO',ptOutput);
            //
            stpInserta.ParamByName('PEID_CREDITO').AsInteger := ID_CREDITO.AsInteger;
            stpInserta.ParamByName('PEID_SOLICITUD').AsInteger:= ID_SOLICITUD.AsInteger;
            stpInserta.ParamByName('PEPCT_PART_RIESGO').AsFloat := PCT_PART_RIESGO.AsFloat;
            stpInserta.ParamByName('PENUM_PERSONAL').AsInteger := NUM_PERSONAL.AsInteger;
            stpInserta.ParamByName('PEIMP_PROM_VENTAS').AsFloat:= IMP_PROM_VENTAS.AsFloat;
            stpInserta.ParamByName('PECVE_TIP_CRED').AsString:= CVE_TIP_CRED.AsString;
            stpInserta.ParamByName('PEPCT_PROD_MER_INT').AsFloat:= PCT_PROD_MER_INT.AsFloat;
            stpInserta.ParamByName('PEPCT_PROD_MER_EXT').AsFloat:= PCT_PROD_MER_EXT.AsFloat;
            stpInserta.ParamByName('PECVE_TIP_AMORTIZA').AsString:= CVE_TIP_AMORTIZA.AsString;
            stpInserta.ParamByName('PEIMP_FINANCIAMTO').AsFloat:= IMP_FINANCIAMTO.AsFloat;
            stpInserta.ParamByName('PEF_PARTICIPACION').AsDate:= F_PARTICIPACION.AsDateTime;
            stpInserta.ParamByName('PECVE_FUNC_INTER').AsString:= CVE_FUNC_INTER.AsString;
            stpInserta.ParamByName('PECVE_INTER_FINAN').AsString:= CVE_INTER_FINAN.AsString;
            stpInserta.ParamByName('PECVE_TIP_AUTORIZA').AsString:= CVE_TIP_AUTORIZA.AsString;
            stpInserta.ParamByName('PECVE_PROGRAMA').AsString:= CVE_PROGRAMA.AsString;
            stpInserta.ParamByName('PECVE_TIP_TASA').AsString:= CVE_TIP_TASA.AsString;
            stpInserta.ParamByName('PECVE_CALIF_CRE').AsString   := CVE_CALIF_CRE.AsString;
            stpInserta.ParamByName('PENUM_MES_GRACIA').AsInteger := NUM_MES_GRACIA.AsInteger;
            stpInserta.ParamByName('PENUM_MES_PLAZO').AsInteger  := NUM_MES_PLAZO.AsInteger;
            stpInserta.ParamByName('PEMES_ANTIGUEDAD').AsInteger := MES_ANTIGUEDAD.AsInteger;
            stpInserta.ParamByName('PESIT_SOL_GTIA').AsString    := SIT_SOL_GTIA.AsString;
            stpInserta.ParamByName('PEF_ALTA').AsDate            := now();
            stpInserta.ParamByName('PECVE_USUA_ALTA').AsString   := Apli.Usuario;
            stpInserta.ParamByName('PEF_MODIFICA').Clear;
            stpInserta.ParamByName('PECVE_USU_MODIFICA').Clear;
            stpInserta.ParamByName('PEID_EMPRESA').AsInteger     := Apli.IdEmpresa;
            //  FJR SE AGREGA EL PARAMETRO DEL ID DE REPRESENTANTE
            stpInserta.ParamByName('PEID_REPRESENTANTE').AsInteger     := ID_REPRESENTANTE.AsInteger;
            //  FJR
            stpInserta.ParamByName('PEBCOMMIT').AsString         := 'V';
            stpInserta.ExecProc;
            If stpInserta.ParamByName('PSRESULTADO').AsFloat = 0 Then Begin
               ID_SOLICITUD.AsInteger:= stpInserta.ParamByName('PEID_SOLICITUD').AsInteger;
               VLSalida:= True;
            End Else Begin
                ShowMessage('ERROR EN ALTA: ' +  IntToStr(stpInserta.ParamByName('PSRESULTADO').AsInteger)+
                            stpInserta.ParamByName('PSTX_RESULTADO').AsString);
            End;
         Except
            ShowMessage('Problemas con el Alta. Avise Urgentemente a Sistemas');
         End;
      Finally
         If stpInserta <> Nil Then Begin
            stpInserta.UnPrepare;
            stpInserta.Free;
         End;
      End;
   End;
   AutoRefresh  := VLSalida;
   InternalPost := VLSalida;
End;

function  TCrSoGtNa.stpObtEquivalencia( IdCredito, Metodo : Integer; var PctEquiv : Double) : Boolean;
var vlSqlStr : string;
    vlEquiv  : Real;
begin
  //
  Result   := False;       PctEquiv := 0;     vlEquiv := 0;
  //
  vlSqlStr := 'SELECT PKGCRDOCUMENTACION.OBTEQUIVOPERATIVA( ' + IntToStr( IdCredito ) +
              ', ' + IntToStr( Metodo ) + ' ) EQUIVALENCIA FROM DUAL';
  try
    GetSQLFloat( vlSqlStr, Apli.DataBaseName, Apli.SessionName, 'EQUIVALENCIA',
                 vlEquiv,  True );
    Result := True;
  except
    vlEquiv := 0;
  end;
  PctEquiv := vlEquiv;
end;
//
Function TCrSoGtNa.ObtClaveMap( sGrupo, sCveCorp : String ): String;
Var sSQL, sResultado: String; qyQuery: TQuery;
Begin
   sResultado:='';
   sSQL:='SELECT CVE_CLAVE  '+
         '  FROM CR_MAPEO_CLAVE '+
         ' WHERE CVE_GRUPO_CLAVE ='''+  sGrupo +''''+
         '   AND CVE_CORP ='''+  sCveCorp +'''';
   qyQuery:= GetSQLQueryNoNil(sSQL, Apli.DataBaseName, Apli.SessionName, False);
   If qyQuery <> nil Then Begin
      If Trim(qyQuery.FieldByName('CVE_CLAVE').AsString)<>'' Then Begin
         sResultado:= Trim(qyQuery.FieldByName('CVE_CLAVE').AsString);
      End;
      qyQuery.Free;
   End;
   ObtClaveMap:= sResultado;
End;
//
function TCrSoGtNa.ProcessFindKeys: Boolean;
var auxCad  : String;
begin
  Result := CrCredito.FindKey( [ ID_CREDITO.AsInteger ] );
  if Result then
  begin
    TipoFinan.FindKey   ( [ coTIP_CR, CVE_TIP_CRED.AsString      ] );
    FormaAmort.FindKey  ( [ coFORAUT, CVE_TIP_AMORTIZA.AsString  ] );
    InterFinan.FindKey  ( [ coINTERM, CVE_INTER_FINAN.AsString   ] );
    Funcionario.FindKey ( [ coFUNINT, CVE_FUNC_INTER.AsString    ] );
    TipoAut.FindKey     ( [ coTIPAUT, CVE_TIP_AUTORIZA.AsString  ] );
    TipoTasa.FindKey    ( [ coTPTASA, CVE_TIP_TASA.AsString      ] );
    TipoPrograma.FindKey( [ coTIPPRO, CVE_PROGRAMA.AsString      ] );
    Repres.FindKey      ( [ID_REPRESENTANTE.AsInteger            ] );

    //
    If CrCto.FindKey([CrCredito.ID_CONTRATO.AsString, CrCredito.FOL_CONTRATO.AsString]) Then
      If Acreditado.FindKey([CrCto.Contrato.ID_Titular.AsInteger])Then
      begin
        auxCad:= ObtClaveMap( coCVESEC, Acreditado.SectorEco.CVE_TIPO_SECTOR.AsString );
        Sector.FindKey( [ coCVESEC, auxCad ] );
        If Domicilio.FindKey([Acreditado.Persona.Id_Domicilio.AsInteger])Then
        begin
          Ciudad.FindKey([Domicilio.CveCiudad.AsString]);
          Municipio.FindKey([Domicilio.CveCiudad.AsString]);
          Estado.FindKey([Domicilio.CveEstado.AsString]);
        end;
      end;
  end;
end;
//
function  TCrSoGtNa.ReactivaSol: Boolean;
var stpReactiva : TStoredProc;
Begin
  Result      := True;
  stpReactiva := TStoredProc.Create(Nil);
  Try
    stpReactiva.DatabaseName   := Apli.DataBaseName;
    stpReactiva.SessionName    := Apli.SessionName;
    stpReactiva.StoredProcName := 'PKGCRCREDITOO1.STPACTSOLGTIANAF';
    stpReactiva.Params.Clear;
    stpReactiva.Params.CreateParam(ftFloat,   'PEID_METODO',    ptInput  );
    stpReactiva.Params.CreateParam(ftFloat,   'PEID_CREDITO',   ptInput  );
    stpReactiva.Params.CreateParam(ftFloat,   'PEID_SOLICITUD', ptInput  );
    stpReactiva.Params.CreateParam(ftString,  'PEBCOMMIT',      ptInput  );
    stpReactiva.Params.CreateParam(ftFloat,   'PSRESULTADO',    ptOutput );
    stpReactiva.Params.CreateParam(ftString,  'PSTXRESULTADO',  ptOutput );
    //
    stpReactiva.ParamByName( 'PEID_METODO'    ).AsInteger := 2;
    stpReactiva.ParamByName( 'PEID_CREDITO'   ).AsInteger := ID_CREDITO.AsInteger;
    stpReactiva.ParamByName( 'PEID_SOLICITUD' ).AsInteger := ID_SOLICITUD.AsInteger;
    stpReactiva.ParamByName( 'PEBCOMMIT'      ).AsString  := 'V';
    stpReactiva.ParamByName( 'PSRESULTADO'    ).AsInteger := 0;
    stpReactiva.ParamByName( 'PSTXRESULTADO'  ).AsString  := '';
    //
    stpReactiva.ExecProc;
    if stpReactiva.ParamByName( 'PSRESULTADO' ).AsInteger <> 0 then
    begin
      Result := False;
      MessageDlg( 'Error al reactivar la solicitud' + #13#10 +
                  'Código:' + IntToStr(stpReactiva.ParamByName( 'PSRESULTADO' ).AsInteger) + #13#10 +
                  'Msg:'    + stpReactiva.ParamByName( 'PSTXRESULTADO'  ).AsString,
                  mtWarning, [mbOk], 0 );
    end;
  finally
    stpReactiva.Free;
  end;
  //
end;


function TCrSoGtNa.stpObtFondeoNafin(IdCredito: Integer): String;
var vlSql     : String;
    vlBFondeo : String;
begin
  vlSql := 'SELECT DECODE( COUNT(*), 0, ''F'', ''V'' ) B_FONDEO ' + coCRLF +
           'FROM   CR_FND_CREDITO '                               + coCRLF +
           'WHERE  ID_CREDITO =   ' + IntToStr(IdCredito)         + coCRLF + // LOLS 01 JUN 2006
           '  AND  PCT_REDESCONTADO > 0'                                     // LOLS 01 JUN 2006
           //'WHERE  ID_CREDITO =   ' + IntToStr(IdCredito);
           ;
  //
  vlBFondeo := '';
  GetSQLStr( vlSql, Apli.DataBaseName, Apli.SessionName, 'B_FONDEO', vlBFondeo,
             False );
  Result := vlBFondeo;
end;

(***********************************************FORMA CR_SOL_GTIA_NAF********************)
(*                                                                              *)
(*  FORMA DE CR_SOL_GTIA_NAF                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_SOL_GTIA_NAF********************)
//
Function TWCrSolGtiaNaf.ObtieneClave( sClave : String ): String;
Var sSQL   : String;
   qyQuery : TQuery;
Begin
   Result := '';
   sSQL:= 'SELECT VALOR FROM CR_GRUPO_CLAVE '+
          ' WHERE CVE_GRUPO_CLAVE = ' + SQLStr( coSOGTNF ) +
          '   AND CVE_REFERENCIA  = ' + SQLStr( sClave   );
   qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      Result := qyQuery.FieldByName('VALOR').AsString;
      qyQuery.Free;
   End;
   //
End;
//
Procedure TWCrSolGtiaNaf.AntigAcred;
Var sSQL    : String;
    qyQuery : TQuery;
Begin
  Objeto.ID_CREDITO.GetFromControl;
  sSQL := ' SELECT CTO.ID_TITULAR, '+
          ' GREATEST( TRUNC(NVL(( ' + SQLFecha( Objeto.Apli.DameFechaEmpresa ) +
          ' - NVL(MIN(F_INICIO), ' + SQLFecha( Objeto.Apli.DameFechaEmpresa ) + '))/30,0)), 0 ) AS F_INICIO '+
          '   FROM CR_CREDITO CC, CONTRATO CTO '+
          '  WHERE CTO.ID_CONTRATO = CC.ID_CONTRATO '+
          '    AND CC.ID_CREDITO = '+ Objeto.ID_CREDITO.AsString +
          '  GROUP BY CTO.ID_TITULAR ';
   qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> nil Then Begin
      Objeto.MES_ANTIGUEDAD.AsInteger:= qyQuery.FieldByName('F_INICIO').AsInteger;
      qyQuery.Free;
   End;
End;
//FJR
Function TWCrSolGtiaNaf.ObtieneRepresPred(Acred: Integer): Integer ;
var Qry: TQuery;
    SQL: String ;
    cal: Integer ;
begin
   cal:= 0 ;
   SQL  := ' SELECT * FROM CR_REPRESENTANTE WHERE ID_ACREDITADO = '+IntToStr(Acred)+' AND B_PREDETERMINADO = ''V''  ';
   Qry:= GetSQLQueryNoNil(SQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If Qry <> nil Then Begin
      cal:= Qry.FieldByName('ID_REPRESENTANTE').AsInteger ;
      Qry.Free;
   End;

   Result:= cal;
end ;
//
procedure TWCrSolGtiaNaf.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_CREDITO.Control       := edID_CREDITO;
      Objeto.ID_SOLICITUD.Control     := edID_SOLICITUD;
      Objeto.PCT_PART_RIESGO.Control  := edPCT_PART_RIESGO;
      Objeto.NUM_PERSONAL.Control     := edNUM_PERSONAL;
      Objeto.IMP_PROM_VENTAS.Control  := edIMP_PROM_VENTAS;
      Objeto.CVE_TIP_CRED.Control     := edCVE_TIP_CRED;
      Objeto.PCT_PROD_MER_INT.Control := edPCT_PROD_MER_INT;
      Objeto.PCT_PROD_MER_EXT.Control := edPCT_PROD_MER_EXT;
      Objeto.CVE_TIP_AMORTIZA.Control := edCVE_TIP_AMORTIZA;
      Objeto.IMP_FINANCIAMTO.Control  := edIMP_FINANCIAMTO;
      Objeto.F_PARTICIPACION.Control  := edF_PARTICIPACION;
      Objeto.CVE_FUNC_INTER.Control   := edCVE_FUNC_INTER;
      Objeto.CVE_INTER_FINAN.Control  := edCVE_INTER_FINAN;
      Objeto.CVE_TIP_AUTORIZA.Control := edCVE_TIP_AUTORIZA;
      Objeto.CVE_PROGRAMA.Control     := edCVE_PROGRAMA;
      Objeto.CVE_TIP_TASA.Control     := edCVE_TIP_TASA;
      Objeto.CVE_CALIF_CRE.Control    := edCVE_CALIF_CRE;
      Objeto.MES_ANTIGUEDAD.Control   := edMES_ANTIGUEDAD;
      Objeto.NUM_MES_GRACIA.Control   := edNUM_MES_GRACIA;
      Objeto.NUM_MES_PLAZO.Control    := edNUM_MES_PLAZO;
      Objeto.SIT_SOL_GTIA.Control     := cbSITUACION;
      //
      Objeto.ID_REPRESENTANTE.Control := edID_REPRESENTANTE;
      //

      Objeto.CrCredito.ID_CREDITO.Control  := edID_CREDITO;
      Objeto.CrCredito.ContratoCre.Producto.DESC_L_PRODUCTO.Control := edDESC_CREDITO;
      Objeto.CrCredito.IMP_CREDITO.Control := edIMP_CREDITO;
      Objeto.CrCredito.ContratoCre.CVE_MONEDA.Control := edCVE_MONEDA;
      Objeto.CrCredito.ContratoCre.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.CrCredito.SOBRETASA.Control   := edSOBRETASA;
      Objeto.CrCredito.F_INICIO.Control    := edF_DISP;

      Objeto.Acreditado.ID_ACREDITADO.Control  := edID_ACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;
      Objeto.CrCto.Contrato.ID_Titular.Control := edID_ACREDITADO;
      Objeto.InterFinan.CVE_REFERENCIA.Control := edCVE_INTER_FINAN;
      Objeto.InterFinan.VALOR.Control := edInterFinan;

      Objeto.Domicilio.CalleNumero.Control:= edCALLE_NUMERO;
      Objeto.Domicilio.Colonia.Control:= edCOLONIA;
      Objeto.Domicilio.CodigoPostal.Control:= edCODIGO_POSTAL;
      Objeto.Ciudad.Cve_Poblacion.Control:= edCVE_CIUDAD;
      Objeto.Ciudad.Desc_Poblacion.Control:= edDESC_CIUDAD;
      Objeto.Municipio.Cve_Poblacion.Control:= edCVE_MUNICIPIO;
      Objeto.Municipio.Desc_Poblacion.Control:= edDESC_MUNICIPIO;
      Objeto.Estado.Cve_Poblacion.Control:= edCVE_ESTADO;
      Objeto.Estado.Desc_Poblacion.Control:= edDESC_ESTADO;


      Objeto.Acreditado.Persona.Siglas_RFC.Control:= edSiglas_RFC;
      Objeto.Acreditado.Persona.F_RFC.Control:= edF_RFC;
      Objeto.Acreditado.Persona.Homoclave_RFC.Control:= edHomoclave_RFC;
      Objeto.Acreditado.SectorEco.CVE_SECTOR_ECO.Control:= edCVE_SECTOR_ECO;
      Objeto.Acreditado.SectorEco.DESC_SECTOR_ECO.Control:= edDESC_SECTOR_ECO;

      Objeto.Sector.CVE_REFERENCIA.Control:= edCVE_TIPO_SECTOR;
      Objeto.Sector.VALOR.Control:= edDESC_TIPO_SECTOR;

      Objeto.TipoAut.CVE_REFERENCIA.Control:= edCVE_TIP_AUTORIZA;
      Objeto.TipoAut.VALOR.Control:= edDESC_TIP_AUTORIZA;
      Objeto.TipoPrograma.CVE_REFERENCIA.Control:=edCVE_PROGRAMA;
      Objeto.TipoPrograma.VALOR.Control:=edDESC_PROGRAMA;
      Objeto.TipoTasa.CVE_REFERENCIA.Control:=edCVE_TIP_TASA;
      Objeto.TipoTasa.VALOR.Control:=edDESC_TIP_TASA;
      Objeto.Funcionario.CVE_REFERENCIA.Control:=edCVE_FUNC_INTER;
      Objeto.Funcionario.VALOR.Control:=edDESC_FUNC_INTER;
      Objeto.TipoFinan.CVE_REFERENCIA.Control:=edCVE_TIP_CRED;
      Objeto.TipoFinan.VALOR.Control:=edDESC_TIP_CRED;
      Objeto.FormaAmort.CVE_REFERENCIA.Control:=edCVE_TIP_AMORTIZA;
      Objeto.FormaAmort.VALOR.Control:=edDESC_TIP_AMORTIZA;
      Objeto.Repres.ID_REPRESENTANTE.Control := edID_REPRESENTANTE ;
      Objeto.Repres.NOMBRE_REPRESENTANTE.Control := edNOMBRE_REPRESENTANTE;

      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrSolGtiaNaf.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CREDITO.Control       := nil;
      Objeto.ID_SOLICITUD.Control     := nil;
      Objeto.PCT_PART_RIESGO.Control  := nil;
      Objeto.NUM_PERSONAL.Control     := nil;
      Objeto.IMP_PROM_VENTAS.Control  := nil;
      Objeto.CVE_TIP_CRED.Control     := nil;
      Objeto.PCT_PROD_MER_INT.Control := nil;
      Objeto.PCT_PROD_MER_EXT.Control := nil;
      Objeto.CVE_TIP_AMORTIZA.Control := nil;
      Objeto.IMP_FINANCIAMTO.Control  := nil;
      Objeto.F_PARTICIPACION.Control  := nil;
      Objeto.CVE_FUNC_INTER.Control   := nil;
      Objeto.CVE_INTER_FINAN.Control  := nil;
      Objeto.CVE_TIP_AUTORIZA.Control := nil;
      Objeto.CVE_PROGRAMA.Control     := nil;
      Objeto.CVE_TIP_TASA.Control     := nil;
      Objeto.CVE_CALIF_CRE.Control    := nil;
      Objeto.MES_ANTIGUEDAD.Control   := nil;
      Objeto.NUM_MES_GRACIA.Control   := nil;
      Objeto.NUM_MES_PLAZO.Control    := nil;
      Objeto.SIT_SOL_GTIA.Control     := nil;
      //
      Objeto.ID_REPRESENTANTE.Control := nil;
      //

      Objeto.CrCredito.ID_CREDITO.Control:= nil;
      Objeto.CrCredito.ContratoCre.Producto.DESC_L_PRODUCTO.Control:= nil;
      Objeto.CrCredito.IMP_CREDITO.Control:=nil;
      Objeto.CrCredito.ContratoCre.CVE_MONEDA.Control:=nil;
      Objeto.CrCredito.ContratoCre.Moneda.Desc_Moneda.Control:=nil;
      Objeto.CrCredito.SOBRETASA.Control:=nil;
      Objeto.CrCredito.F_INICIO.Control  := nil;

      Objeto.Acreditado.ID_ACREDITADO.Control:= nil;
      Objeto.Acreditado.Persona.Nombre.Control:= nil;
      Objeto.CrCto.Contrato.ID_Titular.Control:= nil;
      Objeto.InterFinan.CVE_REFERENCIA.Control:= nil;
      Objeto.InterFinan.VALOR.Control:= nil;

      Objeto.Domicilio.CalleNumero.Control:= nil;
      Objeto.Domicilio.Colonia.Control:= nil;
      Objeto.Domicilio.CodigoPostal.Control:= nil;
      Objeto.Ciudad.Cve_Poblacion.Control:= nil;
      Objeto.Ciudad.Desc_Poblacion.Control:= nil;
      Objeto.Municipio.Cve_Poblacion.Control:= nil;
      Objeto.Municipio.Desc_Poblacion.Control:= nil;
      Objeto.Estado.Cve_Poblacion.Control:= nil;
      Objeto.Estado.Desc_Poblacion.Control:= nil;

      Objeto.Acreditado.Persona.Siglas_RFC.Control:= nil;
      Objeto.Acreditado.Persona.F_RFC.Control:= nil;
      Objeto.Acreditado.Persona.Homoclave_RFC.Control:= nil;
      Objeto.Acreditado.SectorEco.CVE_SECTOR_ECO.Control:= nil;
      Objeto.Acreditado.SectorEco.DESC_SECTOR_ECO.Control:= nil;
      Objeto.Sector.CVE_REFERENCIA.Control:= nil;
      Objeto.Sector.VALOR.Control:= nil;
      Objeto.TipoAut.CVE_REFERENCIA.Control:= nil;
      Objeto.TipoAut.VALOR.Control:= nil;
      Objeto.TipoPrograma.CVE_REFERENCIA.Control:=nil;
      Objeto.TipoPrograma.VALOR.Control:=nil;
      Objeto.TipoTasa.CVE_REFERENCIA.Control:=nil;
      Objeto.TipoTasa.VALOR.Control:=nil;
      Objeto.Funcionario.CVE_REFERENCIA.Control:=nil;
      Objeto.Funcionario.VALOR.Control:=nil;
      Objeto.TipoFinan.CVE_REFERENCIA.Control:=nil;
      Objeto.TipoFinan.VALOR.Control:=nil;
      Objeto.FormaAmort.CVE_REFERENCIA.Control:=nil;
      Objeto.FormaAmort.VALOR.Control:=nil;
      Objeto.Repres.ID_REPRESENTANTE.Control := nil ;
      Objeto.Repres.NOMBRE_REPRESENTANTE.Control := nil;
end;

procedure TWCrSolGtiaNaf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrSolGtiaNaf.InterForma1DespuesShow(Sender: TObject);
begin
  if Objeto.vgIdCredito > 0 then
  begin
    If Objeto.FindKeyNear([ IntToStr( Objeto.vgIdCredito ) ], [ 'ID_CREDITO' ] ) Then
    begin
      if Objeto.ProcessFindKeys then
        MuestraDatos_Dis;
      //ends_if
    end;
    Objeto.vgIdCredito := 0;
  end;
end;

procedure TWCrSolGtiaNaf.InterForma1DespuesNuevo(Sender: TObject);
Var sInterFinan: String;
begin
  edID_CREDITO.SetFocus;
  cbSITUACION.ItemIndex:= 0;
  Objeto.PCT_PROD_MER_INT.AsInteger := 0;
  Objeto.PCT_PROD_MER_EXT.AsInteger := 0;
  Objeto.NUM_MES_GRACIA.AsInteger   := 0;
  Objeto.IMP_PROM_VENTAS.AsFloat    := 0;
  Objeto.NUM_PERSONAL.AsInteger     := 0;
  If Not Objeto.InterFinan.FindKey( [coINTERM, ObtieneClave( coSGCVIN ) ] ) then
    ShowMessage('No se encontró la clave del intermediario financiero. Avise a sistemas');
  //
end;
//
procedure TWCrSolGtiaNaf.btID_CREDITOClick(Sender: TObject);
Var auxCad:String;
begin
   Objeto.CrCredito.ShowAll := True;
   If Objeto.CrCredito.Busca Then Begin
      Buscadatos;
      InterForma1.NextTab(btID_CREDITO);
   End;
end;

procedure TWCrSolGtiaNaf.edID_CREDITOExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.ID_CREDITO.GetFromControl;
      If Objeto.ID_CREDITO.AsInteger = 0 Then Begin
         vlSalida := False;
         vlmsg := 'Favor de Indicar el Número de Disposición';
      End;
      InterForma1.ValidaExit(edID_CREDITO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrSolGtiaNaf.ilID_CREDITOEjecuta(Sender: TObject);
Var auxCad:String;
begin
   If (Objeto.Modo=moAppend)Then
      If Objeto.CrCredito.FindKey([ilID_CREDITO.Buffer]) Then Begin
         Buscadatos;
         InterForma1.NextTab(edID_CREDITO);
      End;
end;

procedure TWCrSolGtiaNaf.btCVE_INTER_FINANClick(Sender: TObject);
begin
  Objeto.InterFinan.BuscaWhereString := ' CVE_GRUPO_CLAVE = ' + SQLStr( coINTERM );
  If Objeto.InterFinan.Busca Then Begin
     InterForma1.NextTab(btCVE_INTER_FINAN);
  End;
  //T := CreaBuscador('ICRGRCV.IT','S,S');
end;

procedure TWCrSolGtiaNaf.btCVE_TIP_AUTORIZAClick(Sender: TObject);
begin
   Objeto.TipoAut.BuscaWhereString:= ' CVE_GRUPO_CLAVE = ' + SQLStr( coTIPAUT );
   If Objeto.TipoAut.Busca Then Begin
      InterForma1.NextTab(btCVE_TIP_AUTORIZA);
   End;
end;

procedure TWCrSolGtiaNaf.btCVE_PROGRAMAClick(Sender: TObject);
begin
   Objeto.TipoPrograma.BuscaWhereString:= ' CVE_GRUPO_CLAVE = ' + SQLStr( coTIPPRO );
   If Objeto.TipoPrograma.Busca Then Begin
      InterForma1.NextTab(btCVE_PROGRAMA);
   End;
end;

procedure TWCrSolGtiaNaf.btCVE_TIP_TASAClick(Sender: TObject);
begin
   Objeto.TipoTasa.BuscaWhereString:= ' CVE_GRUPO_CLAVE = ' + SQLStr( coTPTASA );
   If Objeto.TipoTasa.Busca Then Begin
      InterForma1.NextTab(btCVE_TIP_TASA);
   End;
end;

procedure TWCrSolGtiaNaf.btCVE_FUNC_INTERClick(Sender: TObject);
begin
   Objeto.Funcionario.BuscaWhereString:= ' CVE_GRUPO_CLAVE = ' + SQLStr( coFUNINT );  
   If Objeto.Funcionario.Busca Then Begin
      InterForma1.NextTab(btCVE_FUNC_INTER);
   End;
end;

procedure TWCrSolGtiaNaf.btCVE_TIP_CREDClick(Sender: TObject);
begin
   Objeto.TipoFinan.BuscaWhereString:= ' CVE_GRUPO_CLAVE = ' + SQLStr( coTIP_CR );
   If Objeto.TipoFinan.Busca Then Begin
      InterForma1.NextTab(btCVE_TIP_CRED);
   End;
end;

procedure TWCrSolGtiaNaf.btCVE_TIP_AMORTIZAClick(Sender: TObject);
begin
   Objeto.FormaAmort.BuscaWhereString:= ' CVE_GRUPO_CLAVE = ' + SQLStr( coFORAUT );
   If Objeto.FormaAmort.Busca Then Begin
      InterForma1.NextTab(btCVE_TIP_AMORTIZA);
   End;
end;

procedure TWCrSolGtiaNaf.edPCT_PART_RIESGOExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.PCT_PART_RIESGO.GetFromControl;
      If (Objeto.PCT_PART_RIESGO.AsInteger > 100)Or(Objeto.PCT_PART_RIESGO.AsInteger < 0) Then Begin
         vlSalida := False;
         vlmsg := 'El porcentaje debe ser > 0 y <= 100';
      End Else If (Objeto.PCT_PART_RIESGO.AsInteger <> 50)Then Begin
         If (Objeto.PCT_PART_RIESGO.AsInteger <> 70)Then Begin
            vlSalida := False;
            vlmsg := 'El porcentaje debe ser igual a 50 o 70 %';
         End;
      End;
      InterForma1.ValidaExit(edPCT_PART_RIESGO,vlSalida,vlMsg,True);
   End;
end;

procedure TWCrSolGtiaNaf.edNUM_PERSONALExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edNUM_PERSONAL,True,'',True);
end;

procedure TWCrSolGtiaNaf.edIMP_PROM_VENTASExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edIMP_PROM_VENTAS,True,'',True);
end;

procedure TWCrSolGtiaNaf.btCVE_TIP_CREDExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btCVE_TIP_CRED,True,'',True);
end;

procedure TWCrSolGtiaNaf.edPCT_PROD_MER_INTExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.PCT_PROD_MER_INT.GetFromControl;
      If (Objeto.PCT_PROD_MER_INT.AsInteger > 100)Or(Objeto.PCT_PROD_MER_INT.AsInteger < 0) Then Begin
         vlSalida := False;
         vlmsg := 'El porcentaje debe ser > 0 y <= 100';
      End;
      InterForma1.ValidaExit(edPCT_PROD_MER_INT,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrSolGtiaNaf.edPCT_PROD_MER_EXTExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.PCT_PROD_MER_EXT.GetFromControl;
      If (Objeto.PCT_PROD_MER_EXT.AsInteger > 100)Or(Objeto.PCT_PROD_MER_EXT.AsInteger < 0) Then Begin
         vlSalida := False;
         vlmsg := 'El porcentaje debe ser > 0 y <= 100';
      End;
      InterForma1.ValidaExit(edPCT_PROD_MER_EXT,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrSolGtiaNaf.btCVE_TIP_AMORTIZAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btCVE_TIP_AMORTIZA, True, '', True);
end;

procedure TWCrSolGtiaNaf.edIMP_FINANCIAMTOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edIMP_FINANCIAMTO,True,'',True);
end;

procedure TWCrSolGtiaNaf.edF_DISPExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_DISP,True,'',True);
end;


procedure TWCrSolGtiaNaf.edF_PARTICIPACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edF_PARTICIPACION,True,'',True);
end;

procedure TWCrSolGtiaNaf.dtpF_PARTICIPACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(dtpF_PARTICIPACION,True,'',True);
end;

procedure TWCrSolGtiaNaf.btCVE_INTER_FINANExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btCVE_INTER_FINAN, True, '', True);
end;

procedure TWCrSolGtiaNaf.btCVE_FUNC_INTERExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btCVE_FUNC_INTER, True, '', True );
end;

procedure TWCrSolGtiaNaf.btCVE_TIP_AUTORIZAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btCVE_TIP_AUTORIZA, True, '', True);
end;

procedure TWCrSolGtiaNaf.btCVE_TIP_TASAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btCVE_TIP_TASA, True, '', True);
end;

procedure TWCrSolGtiaNaf.btCVE_PROGRAMAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btCVE_PROGRAMA, True, '', True);
end;

procedure TWCrSolGtiaNaf.edCVE_CALIF_CREExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_CALIF_CRE,True,'',True);
end;

procedure TWCrSolGtiaNaf.edMES_ANTIGUEDADExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edMES_ANTIGUEDAD,True,'',True);
end;

procedure TWCrSolGtiaNaf.edNUM_MES_GRACIAExit(Sender: TObject);
begin
   InterForma1.ValidaExit( edNUM_MES_GRACIA, True, '', True );
end;

procedure TWCrSolGtiaNaf.cbSolFondeoNafinExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbSolFondeoNafin,True,'',True);
end;

procedure TWCrSolGtiaNaf.InterForma1Buscar(Sender: TObject);
begin
  if Objeto.InternalBusca then
  begin
    if Objeto.ProcessFindKeys then
      MuestraDatos_Dis;
    //ends_if
  end;
end;

procedure TWCrSolGtiaNaf.ilCVE_TIP_CREDEjecuta(Sender: TObject);
begin
   If Objeto.TipoFinan.FindKey( [ coTIP_CR, ilCVE_TIP_CRED.Buffer ] ) Then
      InterForma1.NextTab(btCVE_TIP_CRED);
end;

procedure TWCrSolGtiaNaf.ilCVE_TIP_AMORTIZAEjecuta(Sender: TObject);
begin
   If Objeto.FormaAmort.FindKey( [ coFORAUT, ilCVE_TIP_AMORTIZA.Buffer ] ) Then
      InterForma1.NextTab(btCVE_TIP_AMORTIZA);
end;

procedure TWCrSolGtiaNaf.ilCVE_INTER_FINANEjecuta(Sender: TObject);
begin
   If Objeto.InterFinan.FindKey([coINTERM,ilCVE_INTER_FINAN.Buffer]) Then
      InterForma1.NextTab(btCVE_INTER_FINAN);
end;

procedure TWCrSolGtiaNaf.ilCVE_TIP_AUTORIZAEjecuta(Sender: TObject);
begin
   If Objeto.TipoAut.FindKey( [ coTIPAUT, ilCVE_TIP_AUTORIZA.Buffer ] ) Then
      InterForma1.NextTab(btCVE_TIP_AUTORIZA);
end;

procedure TWCrSolGtiaNaf.ilCVE_PROGRAMAEjecuta(Sender: TObject);
begin
   If Objeto.TipoPrograma.FindKey( [ coTIPPRO, ilCVE_PROGRAMA.Buffer ] ) Then
      InterForma1.NextTab(btCVE_PROGRAMA);
end;

procedure TWCrSolGtiaNaf.ilCVE_FUNC_INTEREjecuta(Sender: TObject);
begin
   If Objeto.Funcionario.FindKey( [ coFUNINT, ilCVE_FUNC_INTER.Buffer] ) Then
      InterForma1.NextTab(btCVE_FUNC_INTER);
end;

procedure TWCrSolGtiaNaf.ilCVE_TIP_TASAEjecuta(Sender: TObject);
begin
   If Objeto.TipoTasa.FindKey ( [ coTPTASA, ilCVE_TIP_TASA.Buffer ] ) Then
      InterForma1.NextTab(btCVE_TIP_TASA);
end;

procedure TWCrSolGtiaNaf.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
   If Objeto.SIT_SOL_GTIA.AsString = CSIT_EN Then Begin
      ShowMessage('No puede modificarse en ésta situación');
      Realizado:= False;
   End Else
      Realizado:= True;
end;

Procedure TWCrSolGtiaNaf.VerificaMunicipio;
Var sSQL: String; qyQueryMun: TQuery; CrMapMuni: TCrMapMuni;
Begin
   sSQL:='SELECT CVE_MPIO_CLAVE  '+
         '  FROM CR_MAP_MUNICIPIO '+
         ' WHERE CVE_ESTADO ='''+  Objeto.Domicilio.CveEstado.AsString +''''+
         '   AND CVE_MPIO_CORP ='''+  Objeto.Domicilio.CveCiudad.AsString +'''';
   qyQueryMun:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQueryMun <> nil Then Begin
      If Trim(qyQueryMun.FieldByName('CVE_MPIO_CLAVE').AsString)='' Then Begin
         If MessageDlg('La clave de municipio de NAFIN no se encuentra',
                   mtInformation, [mbOK], 0) = mrOK then Begin
           CrMapMuni:= TCrMapMuni.Create(nil);
           Try
              CrMapMuni.Apli := Objeto.Apli;
              CrMapMuni.ParamCre:=Objeto.ParamCre;
              CrMapMuni.sEstado:= Objeto.Domicilio.CveEstado.AsString;
              CrMapMuni.sMunicipio:=Objeto.Domicilio.CveCiudad.AsString;
              CrMapMuni.Nuevo;
           Finally
              CrMapMuni.Free;
           End;
         End;
      End;
      qyQueryMun.Free;
   End Else Begin
      If MessageDlg('La clave de municipio de NAFIN no se encuentra',
                mtInformation, [mbOK], 0) = mrOK then Begin
        CrMapMuni:= TCrMapMuni.Create(nil);
        Try
           CrMapMuni.Apli := Objeto.Apli;
           CrMapMuni.ParamCre:=Objeto.ParamCre;
           CrMapMuni.sEstado:= Objeto.Domicilio.CveEstado.AsString;
           CrMapMuni.sMunicipio:=Objeto.Domicilio.CveCiudad.AsString;
           CrMapMuni.Nuevo;
        Finally
           CrMapMuni.Free;
        End;
      End;
   End;
End;



Function TWCrSolGtiaNaf.LlamaClassCves(sGrupo,sCveCorp,sDesc:String):String;
Var  CrMapCla: TCrMapCla; sResultado:String;
Begin
   sResultado:='';
   CrMapCla:= TCrMapCla.Create(nil);
   Try
      CrMapCla.IsCheckSecu:= False;
      CrMapCla.Apli := Objeto.Apli;
      CrMapCla.sGrupo:= sGrupo;
      CrMapCla.sCveCorp:=sCveCorp;
      CrMapCla.sDescripcion:= sDesc;
      CrMapCla.Nuevo;
      sResultado := CrMapCla.CVE_CLAVE.AsString;
   Finally
      CrMapCla.Free;
   End;
   LlamaClassCves:= sResultado;
End;


Function TWCrSolGtiaNaf.CadenaSql_Dis : String;
var
   vlsql : String;
Begin
   vlSql:='';
   If Objeto.CrCredito.ContratoCre.Contrato.ID_Titular.AsInteger <> 0 Then Begin
      vlsql := 'SELECT  '+
					'        CR_GA_REGISTRO.ID_SOLICITUD, '+
					'        CR_GA_GARANTIA.DESC_GARANTIA, '+
               '        DECODE(NVL(CR_GA_NAVE_IND.ID_SOLICITUD,0),0, '+
               '        DECODE(NVL(CR_GA_BI_MUEB.ID_SOLICITUD,0),0, '+
					'  		DECODE(NVL(CR_GA_PRENDARIAS.ID_SOLICITUD,0),0, '+
					'        DECODE(NVL(CR_GA_PERSONALES.ID_SOLICITUD,0),0, '+
					'        DECODE(NVL(CR_GA_CESION.ID_SOLICITUD,0),0, '+
					'        DECODE(NVL(CR_GA_PAR_APOR.ID_SOLICITUD,0),0, '+
               '        DECODE(NVL(CR_GA_SIN_CLAS.ID_SOLICITUD,0),0, '+
               '        DECODE(NVL(CR_GA_BI_INMUEB.ID_SOLICITUD,0),0, '+
               '        DECODE(NVL(CR_GA_DOC_COB.ID_SOLICITUD,0),0,'' '', '+
               '        ''DOCUMENTOS POR COBRAR''),'+
               '        ''BIEN INMUEBLE''),'+
					'        ''SIN CLASIFICACION''), '+
					'        ''PARTICIPACIONES/APORTACIONES FEDERALES''), '+
					'        ''CESION''), '+
					'        ''PERSONALES''), '+
					'        ''PENDARIAS''), '+
					'        ''BIEN MUEBLE''), '+
					'        ''NAVE/UNIDAD INDUSTRIAL'')CLASIFICACION, '+

               '       NVL(CR_GA_DIS_GAR.IMP_GARANTIA,0)IMP_GARANTIA, '+
               //'       CR_GA_DIS_GAR.F_ALTA, '+
               //'       CR_GA_DIS_GAR.F_MODIFICA, '+
               //'       DECODE(CR_GA_DIS_GAR.SIT_REL_DIS_GAR,''AC'',''Activo'',''IN'',''Inactivo'','' '')SIT_REL_DIS_GAR, '+
               '       CR_GA_DIS_GAR.ID_REL_DIS_GAR, GAR.CVE_CLAVE, GPO.VALOR, '+
               '       CR_GA_REGISTRO.CVE_GARANTIA '+

					'   FROM CR_GA_REGISTRO  , CR_GA_BI_INMUEB, CR_GA_BI_MUEB , CR_GA_PRENDARIAS, '+
					'        CR_GA_PERSONALES, CR_GA_CESION   , CR_GA_PAR_APOR, CR_GA_SIN_CLAS, '+
					'        CR_GA_GARANTIA, CR_GA_DIS_GAR, CR_GA_DOC_COB, CR_GA_NAVE_IND, '+
               '        (SELECT * FROM CR_MAPEO_CLAVE WHERE CVE_GRUPO_CLAVE=''CVGTIA'')GAR, '+
               '        CR_GRUPO_CLAVE GPO '+

					'  WHERE CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_BI_INMUEB.ID_SOLICITUD(+) '+
					'    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_BI_MUEB.ID_SOLICITUD(+) '+
					'    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PRENDARIAS.ID_SOLICITUD(+) '+
					'    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PERSONALES.ID_SOLICITUD(+) '+
					'    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_CESION.ID_SOLICITUD(+) '+
					'    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PAR_APOR.ID_SOLICITUD(+) '+
					'    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_SIN_CLAS.ID_SOLICITUD(+) '+
					'    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_DOC_COB.ID_SOLICITUD(+) '+
					'    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_NAVE_IND.ID_SOLICITUD(+) '+
					'    AND CR_GA_REGISTRO.CVE_GARANTIA = CR_GA_GARANTIA.CVE_GARANTIA '+
               '    AND CR_GA_REGISTRO.SIT_REG_GARANTIA=''AC'' '+
               '    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_DIS_GAR.ID_REG_SOL_GAR '+
               '    AND GAR.CVE_CORP (+)= CR_GA_REGISTRO.CVE_GARANTIA '+
               '    AND GPO.CVE_REFERENCIA (+)= GAR.CVE_CLAVE '+
               '    AND GPO.CVE_GRUPO_CLAVE (+)= GAR.CVE_GRUPO_CLAVE '+
               '    AND CR_GA_DIS_GAR.ID_DISPOSICION = '+ Objeto.CrCredito.ID_CREDITO.AsSQL +
               '    AND CR_GA_REGISTRO.ID_ACREDITADO = '+ Objeto.CrCredito.ContratoCre.Contrato.ID_Titular.AsSQL;
         vlsql := vlsql + '  ORDER BY CR_GA_DIS_GAR.ID_REL_DIS_GAR, CR_GA_DIS_GAR.ID_DISPOSICION ';
   End;
   CadenaSql_Dis := vlSql;
end;

Procedure TWCrSolGtiaNaf.MuestraDatos_Dis;
var
   vlQry : TQuery;
   sSQL :String;
begin
   sSQL:= CadenaSql_Dis;
   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      try
         if vlQry <> nil then Begin
         
            vlQry.FieldByName('ID_SOLICITUD').DisplayLabel  := 'ID_SOLICITUD'  + #30 +'>C';
            vlQry.FieldByName('DESC_GARANTIA').DisplayLabel := 'DESC_GARANTIA' + #30 +'>C';
            vlQry.FieldByName('CLASIFICACION').DisplayLabel := 'CLASIFICACION' + #30 +'>C';
            vlQry.FieldByName('IMP_GARANTIA').DisplayLabel  := 'IMP_GARANTIA'  + #30 +'>C';
            vlQry.FieldByName('CVE_CLAVE').DisplayLabel     := 'CVE_CLAVE'     + #30 +'>C';
            vlQry.FieldByName('VALOR').DisplayLabel         := 'VALOR'         + #30 +'>C';
            vlQry.FieldByName('ID_REL_DIS_GAR').Visible     := False;
            vlQry.FieldByName('CVE_GARANTIA').Visible       := False;

            vlQry.FieldByName('ID_SOLICITUD').DisplayWidth  := 12;
            vlQry.FieldByName('DESC_GARANTIA').DisplayWidth := 23;
            vlQry.FieldByName('CLASIFICACION').DisplayWidth := 12;
            vlQry.FieldByName('IMP_GARANTIA').DisplayWidth  := 12;
            vlQry.FieldByName('CVE_CLAVE').DisplayWidth     := 12;
            vlQry.FieldByName('VALOR').DisplayWidth         := 30;

            TNumericField(vlQry.FieldByName('IMP_GARANTIA')).DisplayFormat := '###,###,###,###,###,##0.00';
            sgcDATA_Dis.AddQry( vlQry, True, True, -1, -1, -1, False );
            //
         End Else Begin
            sgcDATA_Dis.Clear('NO SE ENCONTRARON DATOS'#30'>C');
         end;
      finally
         if vlQry <> nil then
            vlQry.free;
      end;
   End;
   //<LOLS 03MAR2006 APLICA FONDEO>
   cbSolFondeoNafin.Checked := ( Objeto.stpObtFondeoNafin( Objeto.ID_CREDITO.AsInteger ) = 'V' );
   //</LOLS>
end;

procedure TWCrSolGtiaNaf.btPropositosExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btPropositos, True, '', True);
end;


Procedure TWCrSolGtiaNaf.Buscadatos;
Var auxCad   : String;
    sDescOpe : String;
    vlPctGar : Double;
    vlMesPlazo, vlRepr : Integer;
Begin
   If InterForma1.IsNewData Then
   Begin
      AntigAcred; // Antiguedad del cliente
      Objeto.CVE_CALIF_CRE.AsString:= Objeto.CrCredito.ContratoCre.Acreditado.CVE_CALIFACION.AsString;
      If Not Objeto.InterFinan.FindKey( [ coINTERM, ObtieneClave( coSGCVIN ) ] ) then
         ShowMessage('No se encontró la clave del intermediario financiero. Avise a sistemas');
      //
      If Not Objeto.Funcionario.FindKey([ coFUNINT, ObtieneClave( coSGFNIN ) ] ) then
         ShowMessage('No se encontró la clave del funcionario facultado. Avise a sistemas');

      //Mapea el Tipo de Programa
      auxCad := Objeto.ObtClaveMap( coTIPPRO, Objeto.CrCredito.CVE_OPERATIVA.AsString );
      If auxCad <> '' Then
         Objeto.TipoPrograma.FindKey( [ coTIPPRO, auxCad ] )
      Else Begin
           Objeto.CrCredito.MFiraOpe.MFiraOpe.FindKey( [ Objeto.CrCredito.CVE_OPERATIVA.AsString ] );
           auxCad:= LlamaClassCves( coTIPPRO, Objeto.CrCredito.CVE_OPERATIVA.AsString,
                                            Objeto.CrCredito.MFiraOpe.MFiraOpe.DESC_OPERATIVA.AsString
                                );
          Objeto.TipoPrograma.FindKey( [ coTIPPRO, auxCad ] );
      End;
      //Fin Mapeo

      //
      if Objeto.CrCredito.B_FINANC_ADIC.AsString = 'V' then
         Objeto.FormaAmort.FindKey  ( [ coFORAUT, ObtieneClave( coSGFAFN ) ] )
      else
         Objeto.FormaAmort.FindKey  ( [ coFORAUT, ObtieneClave( coSGFATD ) ] );
      //
      Objeto.TipoAut.FindKey( [ coTIPAUT, ObtieneClave( coSGCVTA ) ] );
      //
      //Mapea el Tipo de Tasa
      auxCad := Objeto.ObtClaveMap( coTPTASA, Objeto.CrCredito.CVE_TASA_REFER.AsString );
      If auxCad <> '' Then
         Objeto.TipoTasa.FindKey( [ coTPTASA, auxCad ] )
      Else Begin
         auxCad:= LlamaClassCves( coTPTASA, Objeto.CrCredito.CVE_TASA_REFER.AsString,
                                            Objeto.CrCredito.TasaRefer.DESC_TASA_INDIC.AsString
                                );
         Objeto.TipoTasa.FindKey( [ coTPTASA, auxCad ] );
      End;
      //Fin Mapeo
      //
      Objeto.IMP_FINANCIAMTO.AsFloat := Objeto.CrCredito.IMP_CREDITO.AsFloat;
      Objeto.CVE_CALIF_CRE.AsString  := Objeto.CrCredito.ContratoCre.Acreditado.CVE_CALIFACION.AsString;
      // Obtiene los meses de plazo
      vlMesPlazo := 0;
      GetSQLInt( 'SELECT NVL( PKGCRCREDITOO1.funObtMesPlazo('        +
                 SQLFecha(Objeto.CrCredito.F_INICIO.AsDateTime)      + ',' +
                 SQLFecha(Objeto.CrCredito.F_VENCIMIENTO.AsDateTime) + '), 0 ) MES_PLAZO FROM DUAL',
                 Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,  'MES_PLAZO', vlMesPlazo, True );
      Objeto.NUM_MES_PLAZO.AsInteger := vlMesPlazo;
      // Obtiene los meses de plazo
      //
      if Objeto.CrCredito.CVE_OPERATIVA.AsString = '' then
         ShowMessage('Error, la disposición no tiena asociada una operativa.');
      //
      vlPctGar := 0;
      Objeto.PCT_PART_RIESGO.AsFloat := 0;
      if Objeto.stpObtEquivalencia( Objeto.ID_CREDITO.AsInteger, 3, vlPctGar) then
         Objeto.PCT_PART_RIESGO.AsFloat := vlPctGar
      else
         ShowMessage('Error al obtener el porcentaje de participación.');
      //
      //Mapea el Tipo de Financiamiento
      auxCad := Objeto.ObtClaveMap( coTIP_CR, Objeto.CrCredito.ContratoCre.CVE_PRODUCTO_CRE.AsString );
      If auxCad <> '' Then
         Objeto.TipoFinan.FindKey ( [ coTIP_CR, auxCad ] )
      Else Begin
           auxCad:= LlamaClassCves( coTIP_CR, Objeto.CrCredito.ContratoCre.CVE_PRODUCTO_CRE.AsString,
                                            Objeto.CrCredito.ContratoCre.Producto.DESC_L_PRODUCTO.AsString
                                );
           Objeto.TipoFinan.FindKey([ coTIP_CR, auxCad ] );
      End;
      //Fin Mapeo
      Objeto.F_PARTICIPACION.AsDateTime := Objeto.CrCredito.F_INICIO.AsDateTime;
   End; //If IsNewData
   //
   If Objeto.CrCto.FindKey([ Objeto.CrCredito.ID_CONTRATO.AsString,
                             Objeto.CrCredito.FOL_CONTRATO.AsString ] ) Then
      If Objeto.Acreditado.FindKey([Objeto.CrCto.Contrato.ID_Titular.AsInteger])Then
      Begin
         auxCad:= Objeto.ObtClaveMap( coCVESEC, Objeto.Acreditado.SectorEco.CVE_TIPO_SECTOR.AsString);
         Objeto.Sector.FindKey( [ coCVESEC, auxCad ] );
         If Objeto.Domicilio.FindKey([Objeto.Acreditado.Persona.Id_Domicilio.AsInteger])Then
         Begin
            Objeto.Ciudad.FindKey([Objeto.Domicilio.CveCiudad.AsString]);
            Objeto.Municipio.FindKey([Objeto.Domicilio.CveCiudad.AsString]);
            Objeto.Estado.FindKey([Objeto.Domicilio.CveEstado.AsString]);
            VerificaMunicipio;
            vlRepr:=ObtieneRepresPred(Objeto.Acreditado.ID_ACREDITADO.AsInteger) ;
            If (vlRepr <> 0) then
               begin
                 Objeto.Repres.FindKey([vlRepr]) ;
                 Objeto.ID_REPRESENTANTE.AsInteger := Objeto.Repres.ID_REPRESENTANTE.AsInteger ;
               end ;
         End;
      End;
   //

   MuestraDatos_Dis;
   //<LOLS 03MAR2006 APLICA FONDEO>
   cbSolFondeoNafin.Checked := ( Objeto.stpObtFondeoNafin( Objeto.ID_CREDITO.AsInteger ) = 'V' );
   //</LOLS>
End;

procedure TWCrSolGtiaNaf.btnReporteExit(Sender: TObject);
begin
   InterForma1.ValidaExit( btnReporte, True, '', True);
end;

Procedure TWCrSolGtiaNaf.RelGarantias;
var CrMapCla: TCrMapCla;
begin
   If Trim(sgcDATA_Dis.CellStr['CVE_GARANTIA',sgcDATA_Dis.SG.Row])<> '' Then Begin
      If Trim(sgcDATA_Dis.CellStr['CVE_CLAVE',sgcDATA_Dis.SG.Row])= '' Then Begin
         CrMapCla:= TCrMapCla.Create(nil);
         Try
            CrMapCla.IsCheckSecu:= False;
            CrMapCla.Apli := Objeto.Apli;
            CrMapCla.sGrupo:= 'CVGTIA';
            CrMapCla.sCveCorp:= Trim(sgcDATA_Dis.CellStr['CVE_GARANTIA',sgcDATA_Dis.SG.Row]);
            CrMapCla.sDescripcion:= Trim(sgcDATA_Dis.CellStr['DESC_GARANTIA',sgcDATA_Dis.SG.Row]);
            CrMapCla.Nuevo;
         Finally
            CrMapCla.Free;
         End;
         MuestraDatos_Dis;
      End Else Begin
         CrMapCla:= TCrMapCla.Create(nil);
         Try
            CrMapCla.IsCheckSecu:= False;
            CrMapCla.Apli := Objeto.Apli;
            CrMapCla.FindKey(['CVGTIA',Trim(sgcDATA_Dis.CellStr['CVE_GARANTIA',sgcDATA_Dis.SG.Row])]);
            CrMapCla.Consulta;
         Finally
            CrMapCla.Free;
         End;
      End;
   End;
End;
//
//                      RELACIONAR GARANTIAS
//
procedure TWCrSolGtiaNaf.RelacinarGarantas1Click(Sender: TObject);
begin
   RelGarantias;
end;
//
//                      RELACIONAR GARANTIAS
//
procedure TWCrSolGtiaNaf.sgcDATA_DisDblClick(Sender: TObject);
begin
   RelGarantias;
end;
//
//                      PROPOSITOS DEL PROYECTO
//
procedure TWCrSolGtiaNaf.btPropositosClick(Sender: TObject);
Var
   CrExpPPDe : TCrExpPPDe;
begin
  If Objeto.ID_CREDITO.AsInteger > 0 Then Begin
    CrExpPPDe := TCrExpPPDe.Create(self);
    try
      CrExpPPDe.IsCheckSecu:= False;
      CrExpPPDe.Apli :=Objeto.Apli;
      CrExpPPDe.ParamCre:=Objeto.ParamCre;
      CrExpPPDe.iIdCredito := Objeto.ID_CREDITO.AsInteger;
      CrExpPPDe.iIdSolicitud := Objeto.ID_SOLICITUD.AsInteger;
      CrExpPPDe.Catalogo;
    finally
      CrExpPPDe.Free;
    end;
  end;
end;
//
//                      REPORTE DE GARANTIA
//
procedure TWCrSolGtiaNaf.btnReporteClick(Sender: TObject);
begin
   If Objeto.ID_SOLICITUD.AsInteger > 0 Then Begin
      RepSolicitud( Objeto.ID_CREDITO.AsInteger, Objeto.ID_SOLICITUD.AsInteger,
                    Objeto.Apli, True);
   End Else Begin
      ShowMessage('Debe seleccionar una Solicitud');
   End;
end;
//
//                      REACTIVACION DE LA GARANTIA
//
procedure TWCrSolGtiaNaf.btReactivaSolClick(Sender: TObject);
begin
  If Objeto.ID_SOLICITUD.AsInteger > 0 Then Begin
    If Objeto.SIT_SOL_GTIA.AsString = CSIT_EN Then Begin
      IF MessageDlg( coMsgReactiva, mtConfirmation, mbYesNoCancel, 0 ) = mrYes then
        IF Objeto.ReactivaSol THEN
           Objeto.FindKey( [ Objeto.ID_CREDITO.AsString, Objeto.ID_SOLICITUD.AsString ] );
    End;
  End;
{}
end;

// FJR REPRESENTANTES POR ACREDITADO
procedure TWCrSolGtiaNaf.BtnReprClick(Sender: TObject);
var CrRepres: TCrRepres ;
begin
  If Objeto.Active Then Begin
    CrRepres := TCrRepres.Create(self);
    try
      CrRepres.IsCheckSecu:= False;
      CrRepres.Apli := Objeto.Apli;
      CrRepres.ParamCre := Objeto.ParamCre;
      CrRepres.iIdAcred := Objeto.Acreditado.ID_ACREDITADO.AsInteger;
      CrRepres.iIdRepr := Objeto.ID_REPRESENTANTE.AsInteger ;
      CrRepres.Catalogo;
    finally
      CrRepres.Free;
    end;
  end;
end;

procedure TWCrSolGtiaNaf.btnID_REPRESENTANTEClick(Sender: TObject);
begin
   Objeto.Repres.BuscaWhereString:= 'ID_ACREDITADO = ' + (Objeto.Acreditado.ID_ACREDITADO.AsString)+' AND SIT_REPRESENTANTE = ''AC''  ';
   If Objeto.Repres.Busca Then Begin
{      Objeto.ID_REPRESENTANTE.AsInteger:= Objeto.Repres.ID_REPRESENTANTE.AsInteger ;
      Objeto.Repres.FindKey      ( [Objeto.ID_REPRESENTANTE.AsInteger            ] );}
      InterForma1.NextTab(btnID_REPRESENTANTE);
   End;
end;

procedure TWCrSolGtiaNaf.btnID_REPRESENTANTEExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btnID_REPRESENTANTE,True,'',True);
end;

procedure TWCrSolGtiaNaf.ilID_REPRESENTANTEEjecuta(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend) ) Then
      If Objeto.Repres.FindKey([ilID_REPRESENTANTE.Buffer]) Then Begin
         Buscadatos;
         InterForma1.NextTab(edID_REPRESENTANTE);
      End;
end;

procedure TWCrSolGtiaNaf.edID_REPRESENTANTEExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.ID_REPRESENTANTE.GetFromControl;
      If Objeto.ID_REPRESENTANTE.AsInteger = 0 Then Begin
         vlSalida := False;
         vlmsg := 'Favor de Indicar el Representante';
      End;
      InterForma1.ValidaExit(edID_REPRESENTANTE,vlSalida,vlMsg,True);
   end; 
end;

end.
