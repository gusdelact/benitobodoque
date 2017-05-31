// Sistema         : Clase de CR_CON_REG_CCI
// Fecha de Inicio : 25/08/2009
// Función forma   : Clase de CR_CON_REG_CCI
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :                     
Unit IntCrCoReCc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,
Grids, Aligrid,

IntGenCre,
IntPers,
IntParamCre,
IntCrCto,
IntCrProduct,
IntCatClasLegal,
IntCatInfRec,
IntCrAcredit,
IntMGarantia,
IntMon,
IntMInstDesc,
IntCrCciComi,
IntCrCciTran
//
,IntQrConAdeTot
;


const
 CFAVOR = 'Favor de indicar el/la ';
 CSIT_AC = 'AC';
 CSIT_LQ = 'LQ';
 CSIT_CA = 'CA';

Type
 TCrCoReCc= class; 

  TWCrConRegCci=Class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    lbIMP_CREDITO: TLabel;
    lbCVE_IDENTIF_CNBV: TLabel;
    lbID_CREDITO: TLabel;
    lbF_LIQUIDACION: TLabel;
    lbF_DISPOSICION: TLabel;
    edCVE_IDENTIF_CNBV: TEdit;
    edIMP_CREDITO: TInterEdit;
    rgSIT_CON_REG_CCI: TRadioGroup;
    edF_LIQUIDACION: TEdit;
    dtpF_LIQUIDACION: TInterDateTimePicker;
    edID_CREDITO: TEdit;
    edF_DISPOSICION: TEdit;
    dtpF_DISPOSICION: TInterDateTimePicker;
    InterForma1: TInterForma;
    ilID_CONTRATO: TInterLinkit;
    ilDescInfRec: TInterLinkit;
    ilDescClasLegal: TInterLinkit;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbF_AUTORIZA: TLabel;
    edF_AUTORIZA: TEdit;
    dtpF_AUTORIZA: TInterDateTimePicker;
    lbF_CCI_VTO: TLabel;
    edF_CCI_VTO: TEdit;
    dtpF_CCI_VTO: TInterDateTimePicker;
    Label7: TLabel;
    lbFH_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edFH_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    lbSDO_ACTUAL_V: TLabel;
    edSDO_ACTUAL_V: TInterEdit;
    TabSheet3: TTabSheet;
    btnAdicionaConceptos: TButton;
    StrAlgnGrdConceptos: TStringAlignGrid;
    lbCVE_FND_ENT_DES: TLabel;
    btnCVE_FND_ENT_DES: TBitBtn;
    edDESC_ENT_DES: TEdit;
    edIMP_APLICADO_V1: TInterEdit;
    Label9: TLabel;
    Label13: TLabel;
    edSDO_ACTUAL_V1: TInterEdit;
    Bevel1: TBevel;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    edPCT_ADICIONAL: TInterEdit;
    edIMP_ADICIONAL: TInterEdit;
    TabSheet4: TTabSheet;
    StrAlgnGrdComisiones: TStringAlignGrid;
    Label14: TLabel;
    edIMP_TOT_CNIMP_V: TInterEdit;
    btnAdicionaComisiones: TButton;
    Bevel2: TBevel;
    lbTIPO_CAMBIO_DLLS: TLabel;
    lbTIPO_CAMBIO_UDIS: TLabel;
    Bevel3: TBevel;
    edNOM_BENEFICIARIO: TEdit;
    lbIMP_ADICIONAL: TLabel;
    edIMP_ADICIONAL_V: TInterEdit;
    Label20: TLabel;
    lbPCT_ADICIONAL_V: TLabel;
    edPCT_ADICIONAL_V: TInterEdit;
    bvlPrincipal: TBevel;
    edIMP_TOT_CNIVA_V: TInterEdit;
    edIMP_TOT_CNAPL_V: TInterEdit;
    edIMP_TOT_CNSDO_V: TInterEdit;
    edIMP_ADICIONAL_V1: TInterEdit;
    Label22: TLabel;
    Label24: TLabel;
    edIMP_CREDITO_V: TInterEdit;
    lbIMP_DISMINUIDO: TLabel;
    edIMP_APLICADO_V: TInterEdit;
    lbB_AVAL_OTRA_ENT: TLabel;
    opB_AVAL_OTRA_ENT: TRadioButton;
    opB_AVAL_OTRA_ENT1: TRadioButton;
    ilCVE_GARANTIA: TInterLinkit;
    edCVE_FND_ENT_DES: TEdit;
    ilCVE_FND_ENT_DES: TInterLinkit;
    Panel2: TPanel;
    edCVE_MONEDA1: TLabel;
    lbCVE_PRODUCTO_CRE: TLabel;
    lbID_CONTRATO: TLabel;
    lbF_AUT_COMITE: TLabel;
    lbF_VENCIMIENTO: TLabel;
    lbIMP_AUTORIZADO: TLabel;
    lbB_CCI_REFINANC: TLabel;
    lbID_ACREDITADO: TLabel;
    edID_ACREDITADO: TEdit;
    dtpF_AUT_COMITE: TInterDateTimePicker;
    edF_AUT_COMITE: TEdit;
    dtpF_VENCIMIENTO: TInterDateTimePicker;
    edF_VENCIMIENTO: TEdit;
    edNOM_ACREDITADO: TEdit;
    edID_CONTRATO: TInterEdit;
    btID_CONTRATO: TBitBtn;
    edNOM_CONTRATO: TEdit;
    edCVE_MONEDA: TEdit;
    edDESC_MONEDA: TEdit;
    edIMP_AUTORIZADO: TInterEdit;
    edCVE_PRODUCTO_CRE: TEdit;
    edDESC_L_PRODUCTO: TEdit;
    bvlAutirizacion: TBevel;
    lbCVE_GARANTIA: TLabel;
    lbDESC_GTIA_ADIC: TLabel;
    lbIMP_GARANTIA: TLabel;
    lbNUM_GTIA_PROPOR: TLabel;
    btnCVE_GARANTIA: TBitBtn;
    edDESC_GARANTIA: TEdit;
    memDESC_GTIA_ADIC: TMemo;
    edIMP_GARANTIA: TInterEdit;
    edCVE_GARANTIA: TEdit;
    edNUM_GTIA_PROPOR: TInterEdit;
    Bevel5: TBevel;
    Panel1: TPanel;
    btnEditaComisiones: TButton;
    btnEditaConceptos: TButton;
    lbDIAS_PLAZO_V: TLabel;
    edDIAS_PLAZO_V: TInterEdit;
    lbSDO_ACTUAL_MN_V: TLabel;
    edSDO_ACTUAL_MN_V: TInterEdit;
    lblIMP_TOT_GTIA_REQ: TLabel;
    lblIMP_DIF_GTIA_REQ: TLabel;
    edIMP_TOT_GTIA_REQ: TInterEdit;
    edIMP_DIF_GTIA_REQ: TInterEdit;
    lblTC_MES_ANT: TLabel;
    lblTC_MES_ACT: TLabel;
    edTIPO_CAMBIO_DLLS_ANT: TInterEdit;
    edTIPO_CAMBIO_UDIS_ANT: TInterEdit;
    edTIPO_CAMBIO_DLLS: TInterEdit;
    edTIPO_CAMBIO_UDIS: TInterEdit;
    lbSDO_ACTUAL_MN_ANT_V: TLabel;
    edSDO_ACTUAL_MN_ANT_V: TInterEdit;
    TabSheet5: TTabSheet;
    lbCVE_CLAS_LEGAL: TLabel;
    edCVE_CLAS_LEGAL: TEdit;
    btCVE_CLAS_LEGAL: TBitBtn;
    edDESC_CLAS_LEGAL: TEdit;
    btCVE_INF_RECUPERA: TBitBtn;
    edDESC_INF_RECUPERA: TEdit;
    edCVE_INF_RECUPERA: TEdit;
    lbCVE_INF_RECUPERA: TLabel;
    chB_OPER_CORREC_FOR: TCheckBox;
    ChB_EXP_CRED_COMP: TCheckBox;
    edIMP_DISPUESTO: TInterEdit;
    edDISP_LINEA: TInterEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    opB_CCI_REFINANC: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edID_CONTRATOExit(Sender: TObject);
    procedure edCVE_INF_RECUPERAExit(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure rgSIT_CON_REG_CCIExit(Sender: TObject);
    procedure edF_LIQUIDACIONExit(Sender: TObject);
    procedure rgSIT_CON_REG_CCIClick(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure btCVE_INF_RECUPERAClick(Sender: TObject);
    procedure edCVE_CLAS_LEGALExit(Sender: TObject);
    procedure chB_OPER_CORREC_FORExit(Sender: TObject);
    procedure chB_EXP_CRED_COMPExit(Sender: TObject);
    procedure btCVE_CLAS_LEGALClick(Sender: TObject);
    procedure ilDescClasLegalEjecuta(Sender: TObject);
    procedure ilDescInfRecEjecuta(Sender: TObject);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure edIMP_CREDITOExit(Sender: TObject);
    procedure edF_AUTORIZAExit(Sender: TObject);
    procedure edF_CCI_VTOExit(Sender: TObject);
    procedure edF_DISPOSICIONExit(Sender: TObject);
    procedure ilID_CONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure btnAdicionaComisionesClick(Sender: TObject);
    procedure edNOM_BENEFICIARIOExit(Sender: TObject);
    procedure btnCVE_GARANTIAClick(Sender: TObject);
    procedure ilCVE_GARANTIAEjecuta(Sender: TObject);
    procedure edCVE_GARANTIAExit(Sender: TObject);
    procedure edIMP_GARANTIAExit(Sender: TObject);
    procedure edNUM_GTIA_PROPORExit(Sender: TObject);
    procedure memDESC_GTIA_ADICExit(Sender: TObject);
    procedure btnCVE_FND_ENT_DESClick(Sender: TObject);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    procedure edCVE_FND_ENT_DESExit(Sender: TObject);
    procedure StrAlgnGrdComisionesDblClick(Sender: TObject);
    procedure btnEditaComisionesClick(Sender: TObject);
    procedure edPCT_ADICIONALExit(Sender: TObject);
    procedure edIMP_ADICIONALExit(Sender: TObject);
    procedure btnAdicionaConceptosClick(Sender: TObject);
    procedure btnEditaConceptosClick(Sender: TObject);
    procedure edIMP_CREDITOChange(Sender: TObject);
    procedure edIMP_ADICIONAL_VChange(Sender: TObject);
    procedure edIMP_APLICADO_VChange(Sender: TObject);
    procedure edSDO_ACTUAL_VChange(Sender: TObject);
    procedure StrAlgnGrdConceptosDblClick(Sender: TObject);
    procedure edDIAS_PLAZO_VExit(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure opB_CCI_REFINANCExit(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrCoReCc;

    procedure HabiltaCtrls(peBHabilita : Boolean);

    procedure MuestraDatosAutorizacion;
    procedure MuestraDatosComisiones;
    procedure MuestraDatosConceptos;
    procedure LimpiaStringAlignGrid(peStringAlignGrid : TStringAlignGrid);

    function RegistraComisiones(peID_CREDITO : Integer) : Boolean;
    function RegistraConceptos : Boolean;

    procedure MuestraTodo;

    procedure CalculaTotCCI;

  end;
  TCrCoReCc= class(TInterFrame)
    private
    protected
  //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
    public
      { Public declarations }
      FH_ALTA                  : TInterCampo;
      ID_REG_VIGENTE           : TInterCampo;
      ID_CONTRATO              : TInterCampo;
      ID_CREDITO               : TInterCampo;
      IMP_CREDITO              : TInterCampo;
      CVE_CLAS_LEGAL           : TInterCampo;
      CVE_INF_RECUPERA         : TInterCampo;
      CVE_IDENTIF_CNBV         : TInterCampo;
      F_LIQUIDACION            : TInterCampo;
      SIT_CON_REG_CCI          : TInterCampo;
      CVE_USU_MODIFICA         : TInterCampo;
      B_OPER_CORRE_FOR         : TInterCampo;
      B_EXP_CRED_COMP          : TInterCampo;
      F_AUTORIZA               : TInterCampo;
      F_VENCIMIENTO            : TInterCampo;
      F_DISPOSICION            : TInterCampo;

      // Componentes nuevos
      B_CCI_REFINANC           : TInterCampo;
      NOM_BENEFICIARIO         : TInterCampo;
      CVE_GARANTIA             : TInterCampo;
      IMP_GARANTIA             : TInterCampo;
      NUM_GTIA_PROPOR          : TInterCampo;
      DESC_GTIA_ADIC           : TInterCampo;
      CVE_FND_ENT_DES          : TInterCampo;
      B_AVAL_OTRA_ENT          : TInterCampo;
      PCT_ADICIONAL            : TInterCampo;
      IMP_ADICIONAL            : TInterCampo;
      NUM_FACTURA              : TInterCampo;      

      // Componentes calculados
      PCT_ADICIONAL_V          : TInterCampo;
      IMP_ADICIONAL_V          : TInterCampo;
      IMP_APLICADO_V         : TInterCampo;
      SDO_ACTUAL_V             : TInterCampo;
      SDO_ACTUAL_MN_V          : TInterCampo;
      SDO_ACTUAL_MN_ANT_V      : TInterCampo;
      // Componentes calculados para Comisiones
      IMP_TOT_CNIMP_V          : TInterCampo;
      IMP_TOT_CNIVA_V          : TInterCampo;
      IMP_TOT_CNAPL_V          : TInterCampo;
      IMP_TOT_CNSDO_V          : TInterCampo;
      DIAS_PLAZO_V             : TInterCampo;

      IMP_TOT_GTIA_REQ         : TInterCampo;
      IMP_DIF_GTIA_REQ         : TInterCampo;

      TIPO_CAMBIO_DLLS         : TInterCampo;
      TIPO_CAMBIO_UDIS         : TInterCampo;

      TIPO_CAMBIO_DLLS_ANT     : TInterCampo;
      TIPO_CAMBIO_UDIS_ANT     : TInterCampo;

      ParamCre                 : TParamCre;
      Autorizacion             : TCrCto;
      Moneda                   : TMoneda;
      Acreditado               : TCrAcredit;
      Producto                 : TCrProduct;
      CatClasLegal             : TCatClasLegal;
      CatInfRec                : TCatInfRec;
      Garantia                 : TMGarantia;
      EntidadDesc              : TMInstDesc;

      procedure ObtenDescripcion(peStrSQL, peStrNomCampo: String; peCVE_INTERCAMPO, peDESC_INTERCAMPO: TInterCampo);
      procedure CalculaSdoActual;
      procedure CalculaGtiaRequerida;
      procedure CalculaDiasPlazo;
      procedure ObtenTipoCambio;

      function    InternalBusca : Boolean; override;
      function    InternalPost : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      function Redondeos(Var Numero: Double; Cant: Integer; TipoRedondeo: Char): Double;
    published
  end;

var vlSql, vlSql2:string;
    QApoyo: TQuery;

implementation

{$R *.DFM}

constructor TCrCoReCc.Create( AOwner : TComponent );
begin Inherited;
      FH_ALTA :=CreaCampo('FH_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                FH_ALTA.Caption:='Fecha y Hora Alta';
      ID_REG_VIGENTE :=CreaCampo('ID_REG_VIGENTE',ftFloat,tsNinguno,tsNinguno,True);
                ID_REG_VIGENTE.Caption:='Número de Reg Vigente';
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Número de Contrato';
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      IMP_CREDITO :=CreaCampo('IMP_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_CREDITO.Caption:='Imp Credito';
      CVE_CLAS_LEGAL :=CreaCampo('CVE_CLAS_LEGAL',ftString,tsNinguno,tsNinguno,True);

      CVE_IDENTIF_CNBV :=CreaCampo('CVE_IDENTIF_CNBV',ftString,tsNinguno,tsNinguno,True);
                CVE_IDENTIF_CNBV.Caption:='Clave de Identif Cnbv';
      F_LIQUIDACION :=CreaCampo('F_LIQUIDACION',ftDate,tsNinguno,tsNinguno,True);
                F_LIQUIDACION.Caption:='Fecha Liquidacion';
      SIT_CON_REG_CCI :=CreaCampo('SIT_CON_REG_CCI',ftString,tsNinguno,tsNinguno,True);
                SIT_CON_REG_CCI.Caption:='Situación Con Reg Cci';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      CVE_INF_RECUPERA :=CreaCampo('CVE_INF_RECUPERA',ftString,tsNinguno,tsNinguno,True);
                CVE_INF_RECUPERA.Caption:='Clave de Informacion de Recuperacion';
      B_OPER_CORRE_FOR :=CreaCampo('B_OPER_CORRE_FOR',ftString,tsNinguno,tsNinguno,True);
                CVE_INF_RECUPERA.Caption:='Operación Correctamente Formalizado';
      B_EXP_CRED_COMP :=CreaCampo('B_EXP_CRED_COMP',ftString,tsNinguno,tsNinguno,True);
                CVE_INF_RECUPERA.Caption:='Expediente de Crédito Completo';
      F_DISPOSICION   :=CreaCampo('F_DISPOSICION',ftDateTime,tsNinguno,tsNinguno,True);

      B_CCI_REFINANC  :=CreaCampo('B_CCI_REFINANC',ftString,tsNinguno,tsNinguno,True);
      With B_CCI_REFINANC do
      Begin
         Size := 3;
         UseCombo := True;
         ComboLista.Add('0'); ComboDatos.Add('V');
         ComboLista.Add('1'); ComboDatos.Add('F');
      end;

      NOM_BENEFICIARIO:=CreaCampo('NOM_BENEFICIARIO',ftString,tsNinguno,tsNinguno,True);
      CVE_GARANTIA    :=CreaCampo('CVE_GARANTIA',ftString,tsNinguno,tsNinguno,True);
      IMP_GARANTIA    :=CreaCampo('IMP_GARANTIA',ftFloat,tsNinguno,tsNinguno,True);
      NUM_GTIA_PROPOR :=CreaCampo('NUM_GTIA_PROPOR',ftFloat,tsNinguno,tsNinguno,True);
      DESC_GTIA_ADIC  :=CreaCampo('DESC_GTIA_ADIC',ftString,tsNinguno,tsNinguno,True);
      CVE_FND_ENT_DES :=CreaCampo('CVE_FND_ENT_DES',ftString,tsNinguno,tsNinguno,True);
      B_AVAL_OTRA_ENT :=CreaCampo('B_AVAL_OTRA_ENT',ftString,tsNinguno,tsNinguno,True);
      PCT_ADICIONAL   :=CreaCampo('PCT_ADICIONAL',ftFloat,tsNinguno,tsNinguno,True);
      IMP_ADICIONAL   :=CreaCampo('IMP_ADICIONAL',ftFloat,tsNinguno,tsNinguno,True);
      F_AUTORIZA      :=CreaCampo('F_AUTORIZA',ftDate,tsNinguno,tsNinguno,True);
      F_VENCIMIENTO   :=CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,True);

      // Datos de visualización únicamente
      PCT_ADICIONAL_V   :=CreaCampo('PCT_ADICIONAL_V',ftFloat,tsNinguno,tsNinguno,False);
      IMP_ADICIONAL_V   :=CreaCampo('IMP_ADICIONAL_V',ftFloat,tsNinguno,tsNinguno,False);
      IMP_APLICADO_V  :=CreaCampo('IMP_APLICADO_V',ftFloat,tsNinguno,tsNinguno,False);
      SDO_ACTUAL_V      :=CreaCampo('SDO_ACTUAL_V',ftFloat,tsNinguno,tsNinguno,False);
      SDO_ACTUAL_MN_V   :=CreaCampo('SDO_ACTUAL_MN_V',ftFloat,tsNinguno,tsNinguno,False);
      SDO_ACTUAL_MN_ANT_V :=CreaCampo('SDO_ACTUAL_MN_ANT_V',ftFloat,tsNinguno,tsNinguno,False);
      IMP_TOT_CNIMP_V   :=CreaCampo('IMP_TOT_CNIMP_V',ftFloat,tsNinguno,tsNinguno,False);
      IMP_TOT_CNIVA_V   :=CreaCampo('IMP_TOT_CNIVA_V',ftFloat,tsNinguno,tsNinguno,False);
      IMP_TOT_CNAPL_V   :=CreaCampo('IMP_TOT_CNAPL_V',ftFloat,tsNinguno,tsNinguno,False);
      IMP_TOT_CNSDO_V   :=CreaCampo('IMP_TOT_CNSDO_V',ftFloat,tsNinguno,tsNinguno,False);
      DIAS_PLAZO_V      :=CreaCampo('DIAS_PLAZO_V',ftInteger,tsNinguno,tsNinguno,False);

      IMP_TOT_GTIA_REQ  :=CreaCampo('IMP_TOT_GTIA_REQ',ftFloat,tsNinguno,tsNinguno,False);
      IMP_DIF_GTIA_REQ  :=CreaCampo('IMP_DIF_GTIA_REQ',ftFloat,tsNinguno,tsNinguno,False);

      TIPO_CAMBIO_DLLS :=CreaCampo('TIPO_CAMBIO_DLLS',ftFloat,tsNinguno,tsNinguno,False);
      TIPO_CAMBIO_UDIS :=CreaCampo('TIPO_CAMBIO_UDIS',ftFloat,tsNinguno,tsNinguno,False);
      TIPO_CAMBIO_DLLS_ANT :=CreaCampo('TIPO_CAMBIO_DLLS_ANT',ftFloat,tsNinguno,tsNinguno,False);
      TIPO_CAMBIO_UDIS_ANT :=CreaCampo('TIPO_CAMBIO_UDIS_ANT',ftFloat,tsNinguno,tsNinguno,False);

      With SIT_CON_REG_CCI do    
      Begin Size:=2;
           UseCombo:=True;
           ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
           ComboLista.Add('1'); ComboDatos.Add(CSIT_LQ);
           ComboLista.Add('2'); ComboDatos.Add(CSIT_CA);
      End;

      //->Buscadores MAGV 2009-09-25
      {$WARNINGS OFF}
      Autorizacion  := TCrCto.Create(self);
      {$WARNINGS ON}
      Autorizacion.MasterSource:= self;
      Autorizacion.FieldByName('ID_CONTRATO').MasterField:= 'ID_CONTRATO';
//      Autorizacion.FieldByName('FOL_CONTRATO').MasterField:= 'FOL_CONTRATO';

      {$WARNINGS OFF}
      Acreditado := TCrAcredit.Create(self);
      {$WARNINGS ON}
      Acreditado.MasterSource:= self;

      {$WARNINGS OFF}
      Producto := TCrProduct.Create(self);
      {$WARNINGS ON}
      Producto.MasterSource := self;

      {$WARNINGS OFF}
      Moneda :=  TMoneda.Create(Self);
      {$WARNINGS ON}
      Moneda.MasterSource:=Self;

      {$WARNINGS OFF}
      Garantia   := TMGarantia.Create(self);
      {$WARNINGS ON}
      Garantia.MasterSource := self;

      {$WARNINGS OFF}
      EntidadDesc  := TMInstDesc.Create(self);
      {$WARNINGS ON}
      EntidadDesc.MasterSource := self;

      {$WARNINGS OFF}
      CatClasLegal   := TCatClasLegal.Create(self);
      {$WARNINGS ON}
      CatClasLegal.MasterSource := self;

      {$WARNINGS OFF}
      CatInfRec   := TCatInfRec.Create(self);
      {$WARNINGS ON}
      CatInfRec.MasterSource := self;

      //<-Buscadores
//      FKeyFields.Add('FH_ALTA');
      FKeyFields.Add('ID_CREDITO');
      FKeyFields.Add('ID_REG_VIGENTE');
//      FKeyFields.Add('ID_CONTRATO');

      TableName := 'CR_CON_REG_CCI';
      UseQuery := True;
      HelpFile := 'IntCrCoReCc.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCoReCc.Destroy;
begin
   If Assigned(Autorizacion) Then Autorizacion.Free;
   If Assigned(Acreditado) Then Acreditado.Free;
   If Assigned(Producto) Then Producto.Free;
   If Assigned(CatClasLegal) Then CatClasLegal.Free;
   If Assigned(CatInfRec) Then CatInfRec.Free;
   If Assigned(Garantia) Then Garantia.Free;
   If Assigned(EntidadDesc) Then EntidadDesc.Free;
   inherited;
end;


function TCrCoReCc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrConRegCci;
begin
   W:=TWCrConRegCci.Create(Self);
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


Function TCrCoReCc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;

      T := CreaBuscador('ICrCoRC.it','D,F,F,F');
      Try if Active then begin { T.Param(0,FH_ALTA.AsString);
                               T.Param(1,ID_REG_VIGENTE.AsString);
                               T.Param(2,ID_Contrato.AsString);
                               T.Param(3,ID_CREDITO.AsString);
                               }
                               // T.Param(0,FH_ALTA.AsString);
                               T.Param(0,ID_CREDITO.AsString);
                               T.Param(1,ID_REG_VIGENTE.AsString);
                               end;
          if T.Execute then // InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
                            InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;

end;

(***********************************************FORMA CR_CON_REG_CCI********************)
(*                                                                              *)
(*  FORMA DE CR_CON_REG_CCI                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CON_REG_CCI********************)

procedure TWCrConRegCci.CalculaTotCCI;
begin
   edIMP_DISPUESTO.Text:='0.00';
   edDISP_LINEA.Text:='0.00';

   if (Trim(edNOM_ACREDITADO.Text)<>'')and(Trim(edID_CONTRATO.Text)<>'') then
   begin
      vlSql:=QrConAdeTot.FormaQuery('', '', edID_ACREDITADO.Text, Objeto.Apli.DameFechaEmpresa);

      vlSql2:= StringReplace(vlSql, ' WHERE 1=1 ', ' WHERE 1=1  AND DATOS.CONTRATO='+edID_CONTRATO.Text, [rfReplaceAll, rfIgnoreCase]);

      QApoyo := GetSQLQuery(vlSql2, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      try
        if QApoyo <> nil then
        begin
            edIMP_DISPUESTO.Text:=QApoyo.FieldByName('IMP_TOTAL_CCI').AsString;
            edDISP_LINEA.Text:=QApoyo.FieldByName('DISP_LINEA').AsString;
        end
        else
        begin
           edIMP_DISPUESTO.Text:='0.00';
           edDISP_LINEA.Text:=edIMP_AUTORIZADO.Text;
        end;
      finally
          if QApoyo <> nil then QApoyo.free;
      end;
   end;
end;

procedure TWCrConRegCci.FormShow(Sender: TObject);
begin
  With Objeto Do
    Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    InterForma1.BtnEliminar.Visible:=false;

    Autorizacion.ID_CONTRATO.Control  := edID_CONTRATO;
    Autorizacion.Contrato.TITNombre.Control := edNOM_CONTRATO;
    Autorizacion.IMP_AUTORIZADO.Control := edIMP_AUTORIZADO;
    Autorizacion.F_AUT_COMITE.Control := edF_AUT_COMITE;
    Autorizacion.F_VENCIMIENTO.Control := edF_VENCIMIENTO;

    Acreditado.ID_ACREDITADO.Control  := edID_ACREDITADO;
    Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;

    Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
    Producto.DESC_L_PRODUCTO.Control  := edDESC_L_PRODUCTO;

    Moneda.CVE_MONEDA.Control := edCVE_MONEDA;
    Moneda.DESC_MONEDA.Control :=  edDESC_MONEDA;

    Garantia.CVE_GARANTIA.Control  :=  edCVE_GARANTIA;
    Garantia.DESC_GARANTIA.Control :=  edDESC_GARANTIA;

    EntidadDesc.CVE_FND_ENT_DES.Control := edCVE_FND_ENT_DES;
    EntidadDesc.DESC_ENT_DES.Control    := edDESC_ENT_DES;

    ID_CONTRATO.Control         := edID_CONTRATO;
    ID_CREDITO.Control          := edID_CREDITO;
    F_AUTORIZA.Control          := edF_AUTORIZA;
    F_VENCIMIENTO.Control       := edF_CCI_VTO;
    F_DISPOSICION.Control       := edF_DISPOSICION;

    B_CCI_REFINANC.Control      := opB_CCI_REFINANC;
    NOM_BENEFICIARIO.Control    := edNOM_BENEFICIARIO;
    CVE_GARANTIA.Control        := edCVE_GARANTIA;
    IMP_GARANTIA.Control        := edIMP_GARANTIA;
    NUM_GTIA_PROPOR.Control     := edNUM_GTIA_PROPOR;
    DESC_GTIA_ADIC.Control      := memDESC_GTIA_ADIC;
    CVE_FND_ENT_DES.Control     := edCVE_FND_ENT_DES;
    B_AVAL_OTRA_ENT.Control     := opB_AVAL_OTRA_ENT;
    PCT_ADICIONAL.Control       := edPCT_ADICIONAL;
    IMP_ADICIONAL.Control       := edIMP_ADICIONAL;

    PCT_ADICIONAL_V.Control     := edPCT_ADICIONAL_V;
    IMP_ADICIONAL_V.Control     := edIMP_ADICIONAL_V;
    IMP_APLICADO_V.Control    := edIMP_APLICADO_V;
    SDO_ACTUAL_V.Control        := edSDO_ACTUAL_V;
    IMP_TOT_CNIMP_V.Control     := edIMP_TOT_CNIMP_V;
    IMP_TOT_CNIVA_V.Control     := edIMP_TOT_CNIVA_V;
    IMP_TOT_CNAPL_V.Control     := edIMP_TOT_CNAPL_V;
    IMP_TOT_CNSDO_V.Control     := edIMP_TOT_CNSDO_V;
    DIAS_PLAZO_V.Control        := edDIAS_PLAZO_V;
    SDO_ACTUAL_MN_V.Control     := edSDO_ACTUAL_MN_V;
    SDO_ACTUAL_MN_ANT_V.Control     := edSDO_ACTUAL_MN_ANT_V;

    TIPO_CAMBIO_DLLS.Control        := edTIPO_CAMBIO_DLLS;
    TIPO_CAMBIO_UDIS.Control        := edTIPO_CAMBIO_UDIS;
    TIPO_CAMBIO_DLLS_ANT.Control    := edTIPO_CAMBIO_DLLS_ANT;
    TIPO_CAMBIO_UDIS_ANT.Control    := edTIPO_CAMBIO_UDIS_ANT;


    CatClasLegal.CVE_CLAS_LEGAL.Control := edCVE_CLAS_LEGAL;
    CatClasLegal.DESC_CLAS_LEGAL.Control := edDESC_CLAS_LEGAL;

    CatInfRec.CVE_INF_RECUPERA.Control   := edCVE_INF_RECUPERA;
    CatInfRec.DESC_INF_RECUPERA.Control  := edDESC_INF_RECUPERA;

    FH_ALTA.Control             := edFH_ALTA;
    IMP_CREDITO.Control         := edIMP_CREDITO;
    CVE_IDENTIF_CNBV.Control    := edCVE_IDENTIF_CNBV;
    CVE_USU_MODIFICA.Control    := edCVE_USU_MODIFICA;
    SIT_CON_REG_CCI.Control     := rgSIT_CON_REG_CCI;
    F_LIQUIDACION.Control       := edF_LIQUIDACION;
    B_OPER_CORRE_FOR.Control    := chB_OPER_CORREC_FOR;
    B_EXP_CRED_COMP.Control     := ChB_EXP_CRED_COMP;
    IMP_TOT_GTIA_REQ.Control    := edIMP_TOT_GTIA_REQ;
    IMP_DIF_GTIA_REQ.Control    := edIMP_DIF_GTIA_REQ;

    Interforma1.MsgPanel := MsgPanel;
    End;

    TRadioButton(rgSIT_CON_REG_CCI.Controls[0]).Checked := True; //habilita el primer radioboton
end;

procedure TWCrConRegCci.FormDestroy(Sender: TObject);
begin
  With Objeto Do
    Begin
    Autorizacion.ID_CONTRATO.Control  := Nil;
    Autorizacion.Contrato.TITNombre.Control := Nil;
    Autorizacion.IMP_AUTORIZADO.Control := Nil;
    Autorizacion.F_AUT_COMITE.Control := Nil;
    Autorizacion.F_VENCIMIENTO.Control := Nil;

    Acreditado.ID_ACREDITADO.Control  := Nil;
    Acreditado.Persona.Nombre.Control := Nil;

    Producto.CVE_PRODUCTO_CRE.Control := Nil;
    Producto.DESC_L_PRODUCTO.Control  := Nil;

    Moneda.CVE_MONEDA.Control := Nil;
    Moneda.DESC_MONEDA.Control :=  Nil;

    Garantia.CVE_GARANTIA.Control  :=  Nil;
    Garantia.DESC_GARANTIA.Control :=  Nil;

    EntidadDesc.CVE_FND_ENT_DES.Control := Nil;
    EntidadDesc.DESC_ENT_DES.Control    := Nil;

    ID_CONTRATO.Control         := Nil;
    ID_CREDITO.Control          := Nil;
    F_AUTORIZA.Control          := Nil;
    F_VENCIMIENTO.Control       := Nil;
    F_DISPOSICION.Control       := Nil;

    B_CCI_REFINANC.Control      := Nil;
    NOM_BENEFICIARIO.Control    := Nil;
    CVE_GARANTIA.Control        := Nil;
    IMP_GARANTIA.Control        := Nil;
    NUM_GTIA_PROPOR.Control     := Nil;
    DESC_GTIA_ADIC.Control      := Nil;
    CVE_FND_ENT_DES.Control     := Nil;
    B_AVAL_OTRA_ENT.Control     := Nil;
    PCT_ADICIONAL.Control       := Nil;
    IMP_ADICIONAL.Control       := Nil;

    PCT_ADICIONAL_V.Control     := Nil;
    IMP_ADICIONAL_V.Control     := Nil;
    IMP_APLICADO_V.Control      := Nil;
    SDO_ACTUAL_V.Control        := Nil;
    IMP_TOT_CNIMP_V.Control     := Nil;
    IMP_TOT_CNIVA_V.Control     := Nil;
    IMP_TOT_CNAPL_V.Control     := Nil;
    IMP_TOT_CNSDO_V.Control     := Nil;
    DIAS_PLAZO_V.Control        := Nil;
    SDO_ACTUAL_MN_V.Control     := Nil;
    SDO_ACTUAL_MN_ANT_V.Control := Nil;

    TIPO_CAMBIO_DLLS.Control    := Nil;
    TIPO_CAMBIO_UDIS.Control    := Nil;
    TIPO_CAMBIO_DLLS_ANT.Control:= Nil;
    TIPO_CAMBIO_UDIS_ANT.Control:= Nil;

    CatClasLegal.CVE_CLAS_LEGAL.Control := Nil;
    CatClasLegal.DESC_CLAS_LEGAL.Control := Nil;

    CatInfRec.CVE_INF_RECUPERA.Control   := Nil;
    CatInfRec.DESC_INF_RECUPERA.Control  := Nil;

    FH_ALTA.Control             := Nil;
    IMP_CREDITO.Control         := Nil;
    CVE_IDENTIF_CNBV.Control    := Nil;
    CVE_USU_MODIFICA.Control    := Nil;
    SIT_CON_REG_CCI.Control     := Nil;
    F_LIQUIDACION.Control       := Nil;
    B_OPER_CORRE_FOR.Control    := Nil;
    B_EXP_CRED_COMP.Control     := Nil;
    
    IMP_TOT_GTIA_REQ.Control     := Nil;
    IMP_DIF_GTIA_REQ.Control     := Nil;
    End;
end;

procedure TWCrConRegCci.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrConRegCci.InterForma1DespuesNuevo(Sender: TObject);
begin If edID_CREDITO.CanFocus Then edID_CREDITO.SetFocus;
      Objeto.SIT_CON_REG_CCI.AsString := 'AC';
      ClearGrid(StrAlgnGrdComisiones);
      ClearGrid(StrAlgnGrdConceptos);
      edIMP_DISPUESTO.Text:='0.00';
      edDISP_LINEA.Text:='0.00';

      edIMP_CREDITO.tag:=530;
      edIMP_CREDITO.HelpContext:=1400;
      edIMP_CREDITO.Color:=clWindow;
      edIMP_CREDITO.ReadOnly:=false;
end;                                  

procedure TWCrConRegCci.InterForma1DespuesModificar(Sender: TObject);
begin
//      If edIMP_CREDITO.CanFocus Then edIMP_CREDITO.SetFocus;
   edIMP_CREDITO.tag:=0;
   edIMP_CREDITO.HelpContext:=0;
   edIMP_CREDITO.Color:=clBtnFace;
   edIMP_CREDITO.ReadOnly:=true;
end;

procedure TWCrConRegCci.edID_CONTRATOExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
    Begin
    If (Modo = moAppend) Or (Modo = moEdit) Then
      ID_CONTRATO.GetFromControl;

    If (Trim(ID_CONTRATO.AsString) = '') Then
       Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbID_CONTRATO.Caption;
       End
    End;
  InterForma1.ValidaExit(edID_CONTRATO, vlbSalida, vlStrMesg, True);
end;

procedure TWCrConRegCci.edCVE_INF_RECUPERAExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
Begin
  vlbSalida := True;
  vlStrMesg := '';
{
  With Objeto Do
    If Not (Objeto.FCvePerfil <> 101) Then // Si no es de Operaciones, entonces
      Begin
        sText := edCVE_INF_RECUPERA.Text;
        If (Trim(sText) = '') Then
        Begin
          vlbSalida := False;
          vlStrMesg := CFAVOR + lbCVE_INF_RECUPERA.Caption;
        End
        Else
        Begin
          Try
             If (Modo = moAppend) Or (Modo = moEdit) Then
               CVE_INF_RECUPERA.GetFromControl;

             bfind := CatInfRec.FindKey([sText]);
             If not bFind Then
             Begin
                vlbSalida := False;
                vlStrMesg := 'El campo'+lbCVE_INF_RECUPERA.Caption+' no es válido. Favor de verificar';
             End;
          Except
            On EInterFrame Do
            Begin
              vlbSalida := False;
              vlStrMesg := 'El '+lbCVE_INF_RECUPERA.Caption+' no es válido. Favor de verificar';
            End;
          End;
        End;
      End; }
  InterForma1.ValidaExit(edCVE_INF_RECUPERA, vlbSalida, vlStrMesg, True);
end;

procedure TWCrConRegCci.edID_CREDITOExit(Sender: TObject);
{var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
     vlQry : TQuery;}
Begin
{  vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
    If Not (Objeto.FCvePerfil <> 101) Then // Si no es de Operaciones, entonces
      Begin
      If (Modo = moAppend) Or (Modo = moEdit) Then
        ID_CREDITO.GetFromControl;

      If (Trim(ID_CREDITO.AsString) = '') Then
         Begin
         vlbSalida := False;
         vlStrMesg := CFAVOR + lbID_CREDITO.Caption;
         End
      Else
         Begin
         vlQry := GetSQLQueryNoNil(' SELECT CCC.ID_CONTRATO, P.NOMBRE'+coCRLF+
                                   ' FROM CR_CON_REG_CCI CCC,'+coCRLF+
                                   '      CONTRATO CTO,'+coCRLF+
                                   '      PERSONA P'+coCRLF+
                                   ' WHERE CCC.ID_CREDITO = '+ID_CREDITO.AsString+coCRLF+
                                   '   AND CCC.SIT_CON_REG_CCI <> ''CA'''+coCRLF+
                                   '   AND CCC.ID_REG_VIGENTE = 1'+coCRLF+
                                   '   AND CTO.ID_CONTRATO = CCC.ID_CONTRATO'+coCRLF+
                                   '   AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF,
                                   Apli.DatabaseName, Apli.SessionName, True);
         If Assigned(vlQry) Then
          With (vlQry) Do
            If (Trim(FieldByName('NOMBRE').AsString) <> '') Then
               Try
                 vlbSalida := False;
                 vlStrMesg := 'Este No. CCI ya fue asignado al cto. '+FieldByName('ID_CONTRATO').AsString+' "' +FieldByName('NOMBRE').AsString ;
               Finally
                 vlQry.Close;
                 vlQry.Free;
               End;
         End;
      End;
  InterForma1.ValidaExit(edID_CREDITO, vlbSalida, vlStrMesg, True); }
end;

procedure TWCrConRegCci.rgSIT_CON_REG_CCIExit(Sender: TObject);
begin
  InterForma1.ValidaExit(rgSIT_CON_REG_CCI, True, '', True);
end;

procedure TWCrConRegCci.edF_LIQUIDACIONExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  If (edF_LIQUIDACION.HelpContext > 0) Then
     Begin
      With Objeto Do
        Begin
        If (Modo = moAppend) Or (Modo = moEdit) Then
          SIT_CON_REG_CCI.GetFromControl;
        If (Trim(edF_LIQUIDACION.Text) = '') And (SIT_CON_REG_CCI.AsString = 'LQ') Then
           Begin
           vlbSalida := False;
           vlStrMesg := 'Favor de indicar la '+lbF_LIQUIDACION.Caption+'.';
           End;
        End;
    End;
   InterForma1.ValidaExit(edF_LIQUIDACION, vlbSalida, vlStrMesg, True);
end;

procedure TWCrConRegCci.HabiltaCtrls(peBHabilita: Boolean);
var
 vlnHelpContext : Integer;
begin
 vlnHelpContext := rgSIT_CON_REG_CCI.HelpContext + 100;
 If (peBHabilita) Then
   Begin
   edF_LIQUIDACION.Enabled := True;
   edF_LIQUIDACION.Color := clWindow;
   edF_LIQUIDACION.TabStop := True;
   edF_LIQUIDACION.ReadOnly := False;
   edF_LIQUIDACION.Tag := 18;
   edF_LIQUIDACION.HelpContext := vlnHelpContext;

   dtpF_LIQUIDACION.Enabled := True;
   dtpF_LIQUIDACION.TabStop := True;
   dtpF_LIQUIDACION.Tag := 18;
   dtpF_LIQUIDACION.HelpContext := vlnHelpContext+1;
   End
 Else
   Begin
   edF_LIQUIDACION.Enabled := False;
   edF_LIQUIDACION.Color := clBtnFace;
   edF_LIQUIDACION.TabStop := False;
   edF_LIQUIDACION.ReadOnly := True;
   edF_LIQUIDACION.Tag := 0;
   edF_LIQUIDACION.HelpContext := 0;

   dtpF_LIQUIDACION.Enabled := False;
   dtpF_LIQUIDACION.TabStop := False;
   dtpF_LIQUIDACION.Tag := 0;
   dtpF_LIQUIDACION.HelpContext := 0;
   End;
end;

procedure TWCrConRegCci.rgSIT_CON_REG_CCIClick(Sender: TObject);
begin
With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
  Begin
  SIT_CON_REG_CCI.GetFromControl;

  HabiltaCtrls(SIT_CON_REG_CCI.AsString = CSIT_LQ);
  If (SIT_CON_REG_CCI.AsString = CSIT_AC) Then
  Begin
    edF_LIQUIDACION.Text := '';
    F_LIQUIDACION.GetFromControl;
  End;
  End;
end;

function TCrCoReCc.InternalPost: Boolean;

   function ActualizaCartasCredito( var PPResultado: String  ): Boolean;
   var  vlStp : TStoredProc;
        vlResult  : Boolean;
   begin
       PPResultado := '';
       vlStp := TStoredProc.Create(Self);
       Try
        With vlStp Do
        Begin
           DatabaseName:= Apli.DatabaseName;
           SessionName:= Apli.SessionName;
           StoredProcName:= 'ADMIPROD.PKGCRCONSOLIDADO1.STP_INS_CARTAS_CRED';

           Params.Clear;
           Params.CreateParam( ftInteger, 'peID_CONTRATO', ptInput);
           Params.CreateParam( ftInteger, 'peID_CREDITO', ptInput);
           Params.CreateParam( ftFloat, 'peIMP_CREDITO', ptInput);
           Params.CreateParam( ftString, 'peCVE_IDENTIF_CNBV', ptInput);
           Params.CreateParam( ftString, 'peB_OPER_CORRE_FOR', ptInput);
           Params.CreateParam( ftString, 'peB_EXP_CRED_COMP', ptInput);
           Params.CreateParam( ftString, 'peB_CCI_REFINANC', ptInput);
           Params.CreateParam( ftString, 'peB_AVAL_OTRA_ENT', ptInput);
           Params.CreateParam( ftDateTime, 'peF_AUTORIZA', ptInput);
           Params.CreateParam( ftDateTime, 'peF_VENCIMIENTO', ptInput);
           Params.CreateParam( ftDateTime, 'peF_DISPOSICION', ptInput);
           Params.CreateParam( ftDateTime, 'peF_LIQUIDACION', ptInput);
           Params.CreateParam( ftString, 'peNOM_BENEFICIARIO', ptInput);
           Params.CreateParam( ftString, 'peCVE_GARANTIA', ptInput);
           Params.CreateParam( ftFloat, 'peIMP_GARANTIA', ptInput);
           Params.CreateParam( ftInteger, 'peNUM_GTIA_PROPOR', ptInput);
           Params.CreateParam( ftString, 'peDESC_GTIA_ADIC', ptInput);
           Params.CreateParam( ftString, 'peCVE_FND_ENT_DES', ptInput);
           Params.CreateParam( ftFloat, 'pePCT_ADICIONAL', ptInput);
           Params.CreateParam( ftFloat, 'peIMP_ADICIONAL', ptInput);
           Params.CreateParam( ftString, 'peSIT_CON_REG_CCI', ptInput);
           Params.CreateParam( ftString, 'peCVE_USU_MODIFICA', ptInput);
           Params.CreateParam( ftString, 'peCVE_CLAS_LEGAL', ptInput);
           Params.CreateParam( ftString, 'peCVE_INF_RECUPERA', ptInput);
           Params.CreateParam( ftInteger, 'psRESULTADO', ptOutput);
           Params.CreateParam( ftString, 'psTX_RESULTADO', ptOutput);

           Prepare;
           ParamByName('peID_CONTRATO').AsInteger       := Autorizacion.ID_CONTRATO.AsInteger;
           ParamByName('peID_CREDITO').AsInteger        := ID_CREDITO.AsInteger;
           ParamByName('peIMP_CREDITO').AsFloat         := IMP_CREDITO.AsFloat;
           ParamByName('peCVE_IDENTIF_CNBV').AsString   := CVE_IDENTIF_CNBV.AsString;
           ParamByName('peB_OPER_CORRE_FOR').AsString   := B_OPER_CORRE_FOR.AsString;
           ParamByName('peB_EXP_CRED_COMP').AsString    := B_EXP_CRED_COMP.AsString;
           ParamByName('peB_CCI_REFINANC').AsString     := B_CCI_REFINANC.AsString;
           ParamByName('peB_AVAL_OTRA_ENT').AsString    := B_AVAL_OTRA_ENT.AsString;
           ParamByName('peF_AUTORIZA').AsDateTime       := F_AUTORIZA.AsDateTime;
           ParamByName('peF_VENCIMIENTO').AsDateTime    := F_VENCIMIENTO.AsDateTime;
           ParamByName('peF_DISPOSICION').AsDateTime    := F_DISPOSICION.AsDateTime;
           ParamByName('peF_LIQUIDACION').AsDateTime    := F_LIQUIDACION.AsDateTime;
           ParamByName('peNOM_BENEFICIARIO').AsString   := NOM_BENEFICIARIO.AsString;
           ParamByName('peCVE_GARANTIA').AsString       := Garantia.CVE_GARANTIA.AsString;
           ParamByName('peIMP_GARANTIA').AsFloat        := IMP_GARANTIA.AsFloat;
           ParamByName('peNUM_GTIA_PROPOR').AsInteger   := NUM_GTIA_PROPOR.AsInteger;
           ParamByName('peDESC_GTIA_ADIC').AsString     := DESC_GTIA_ADIC.AsString;
           ParamByName('peCVE_FND_ENT_DES').AsString    := EntidadDesc.CVE_FND_ENT_DES.AsString;
           ParamByName('pePCT_ADICIONAL').AsFloat       := PCT_ADICIONAL.AsFloat;
           ParamByName('peIMP_ADICIONAL').AsFloat       := IMP_ADICIONAL.AsFloat;
           ParamByName('peCVE_CLAS_LEGAL').AsString     := CatClasLegal.CVE_CLAS_LEGAL.AsString;
           ParamByName('peCVE_INF_RECUPERA').AsString   := CatInfRec.CVE_INF_RECUPERA.AsString;
           ParamByName('peSIT_CON_REG_CCI').AsString    := SIT_CON_REG_CCI.AsString;
           ParamByName('peCVE_USU_MODIFICA').AsString   := DameUsuario;
           ExecProc;

           If (ParamByName('psRESULTADO').AsInteger <> 0) then
           begin
              PPResultado := 'Error No ' + ParamByName('psTX_RESULTADO').AsString;
              vlResult := False;
           end
           else
           begin
              vlResult := True;
           end;
        end;
      Finally
           If Assigned(vlStp) Then
              vlStp.Free;
      End;
      Result := vlResult;
   end;

var vlStrMsg : String;

begin
  If (Modo = moAppend) Or (Modo = moEdit) Then
     Begin
     FH_ALTA.GetFromControl;
     ID_REG_VIGENTE.GetFromControl;
     ID_CONTRATO.GetFromControl;
     ID_CREDITO.GetFromControl;
     IMP_CREDITO.GetFromControl;
     CVE_CLAS_LEGAL.GetFromControl;
     CVE_INF_RECUPERA.GetFromControl;
     CVE_IDENTIF_CNBV.GetFromControl;
     F_LIQUIDACION.GetFromControl;
     SIT_CON_REG_CCI.GetFromControl;
     CVE_USU_MODIFICA.GetFromControl;
     B_OPER_CORRE_FOR.GetFromControl;
     B_EXP_CRED_COMP.GetFromControl;
     F_AUTORIZA.GetFromControl;
     F_VENCIMIENTO.GetFromControl;
     F_DISPOSICION.GetFromControl;
     B_CCI_REFINANC.GetFromControl;
     NOM_BENEFICIARIO.GetFromControl;
     CVE_GARANTIA.GetFromControl;
     IMP_GARANTIA.GetFromControl;
     NUM_GTIA_PROPOR.GetFromControl;
     DESC_GTIA_ADIC.GetFromControl;
     CVE_FND_ENT_DES.GetFromControl;
     B_AVAL_OTRA_ENT.GetFromControl;
     PCT_ADICIONAL.GetFromControl;
     IMP_ADICIONAL.GetFromControl;
     CVE_CLAS_LEGAL.GetFromControl;
     CVE_INF_RECUPERA.GetFromControl;
     End;

  AutoRefresh := False;   
  Case Modo Of
    moAppend : Begin
               CVE_USU_MODIFICA.AsString := DameUsuario;
               ActualizaCartasCredito(vlStrMsg);
               Result := True;
               End;

    moEdit : Begin
               CVE_USU_MODIFICA.AsString := DameUsuario;
               ActualizaCartasCredito(vlStrMsg);
               Result := True;
               End;
  Else
    Result := False;
  End;
end;

procedure TCrCoReCc.ObtenDescripcion(peStrSQL, peStrNomCampo: String;  peCVE_INTERCAMPO, peDESC_INTERCAMPO: TInterCampo);
var vlStrCampoResult : String;
begin
      GetSQLStr(peStrSQL, Apli.DataBaseName, Apli.SessionName, peStrNomCampo, vlStrCampoResult, False);
      If (Trim(vlStrCampoResult) <> '') Then
      begin
          peDESC_INTERCAMPO.AsString := vlStrCampoResult;
      end;
end;

procedure TWCrConRegCci.InterForma1Buscar(Sender: TObject);
begin
 With Objeto Do
   If Busca Then
     Begin
     MuestraTodo;
     End;
end;

{ MAGV 2009-09-25 }
procedure TWCrConRegCci.btID_CONTRATOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCORECC_AUTOR',True,True) then
   begin
     With Objeto Do
       If Autorizacion.Busca Then
         Begin
         MuestraDatosAutorizacion;
         ObtenTipoCambio;
         End;
   end;
end;

procedure TWCrConRegCci.btCVE_INF_RECUPERAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCORECC_RECINF',True,True) then
   begin
      Objeto.CatInfRec.ShowAll := True;
      Objeto.CatInfRec.busca;
   end;
end;

procedure TWCrConRegCci.edCVE_CLAS_LEGALExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
{     sText : String;
     bFind : Boolean; }
Begin
  vlbSalida := True;
  vlStrMesg := '';
{  With Objeto Do
  Begin
    sText := edCVE_CLAS_LEGAL.Text;
    If (Trim(sText) = '') Then
    Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbCVE_CLAS_LEGAL.Caption;
    End
    Else
    Begin
      Try
         If (Modo = moAppend) Or (Modo = moEdit) Then
           CVE_CLAS_LEGAL.GetFromControl;

         bfind := CatClasLegal.FindKey([sText]);
         If not bFind Then
         Begin
            vlbSalida := False;
            vlStrMesg := 'El campo'+lbCVE_CLAS_LEGAL.Caption+' no es válido. Favor de verificar';
         End;
      Except
        On EInterFrame Do
        Begin
          vlbSalida := False;
          vlStrMesg := 'El '+lbCVE_CLAS_LEGAL.Caption+' no es válido. Favor de verificar';
        End;
      End;
    End;
  End; }
//  InterForma1.ValidaExit(edCVE_CLAS_LEGAL, vlbSalida, vlStrMesg, True);
  InterForma1.ValidaExit(edCVE_CLAS_LEGAL, vlbSalida, vlStrMesg, True);
end;



procedure TWCrConRegCci.chB_OPER_CORREC_FORExit(Sender: TObject);
begin
  InterForma1.ValidaExit(chB_OPER_CORREC_FOR, True, '', True);
end;

procedure TWCrConRegCci.chB_EXP_CRED_COMPExit(Sender: TObject);
begin
  InterForma1.ValidaExit(chB_EXP_CRED_COMP, True, '', True);
end;

procedure TWCrConRegCci.ilID_CONTRATOEjecuta(Sender: TObject);
begin
 With Objeto Do
   If Autorizacion.FindKey([ilID_CONTRATO.buffer,'1']) Then
     Begin
     MuestraDatosAutorizacion;
     ObtenTipoCambio;
     End;      
end;

procedure TWCrConRegCci.btCVE_CLAS_LEGALClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCORECC_CLALEG',True,True) then
   begin
      Objeto.CatClasLegal.ShowAll := True;
      Objeto.CatClasLegal.Busca;
   end;
end;

procedure TWCrConRegCci.ilDescClasLegalEjecuta(Sender: TObject);
begin
  Objeto.CatClasLegal.findKey([ilDescClasLegal.buffer]);
end;

procedure TWCrConRegCci.ilDescInfRecEjecuta(Sender: TObject);
begin
  Objeto.CatInfRec.findKey([ilDescInfRec.buffer]);
end;

// --------------------
// Inicia codigo SATV

procedure TWCrConRegCci.MuestraDatosAutorizacion;
begin
  With Objeto Do
    Begin
    Autorizacion.FindKey([ID_CONTRATO.AsInteger, 1]);
    Acreditado.FindKey([Autorizacion.Contrato.ID_TITULAR.AsInteger]);
    Producto.FindKey([Autorizacion.CVE_PRODUCTO_CRE.AsString]);
    Moneda.FindKey([Autorizacion.Contrato.CVE_MONEDA.AsString]);

    CalculaTotCCI;
    End;
end;

procedure TWCrConRegCci.edIMP_CREDITOExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
     vlTemp1, vlTemp2 : Currency;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
    Begin
    If (Modo = moAppend) Or (Modo = moEdit) Then
      IMP_CREDITO.GetFromControl;

    vlTemp1 := StrToCurr(edDISP_LINEA.Text);
    vlTemp2 := StrToCurr(FloatToStr(IMP_CREDITO.AsFloat));

    If (IMP_CREDITO.AsFloat = 0) Then
       Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbIMP_CREDITO.Caption;
       End
    Else If (IMP_CREDITO.AsFloat < 0) Then
       Begin
       vlbSalida := False;
       vlStrMesg := 'El ' +lbIMP_CREDITO.Caption + ' no puede ser negativo.';
       End
    Else If (IMP_CREDITO.AsFloat > Autorizacion.IMP_AUTORIZADO.AsFloat) Then
       Begin
       vlbSalida := False;
       vlStrMesg := 'El ' +lbIMP_CREDITO.Caption + ' no puede ser mayor que el '+lbIMP_AUTORIZADO.Caption+' de la autorización.';
       End
    //HERJA
    //Else If (StrToFloat(edDISP_LINEA.Text) < IMP_CREDITO.AsFloat) Then
    Else If (vlTemp1 < vlTemp2) Then
       Begin
       vlbSalida := False;
       vlStrMesg := 'El ' +lbIMP_CREDITO.Caption + ' no puede ser mayor que el Importe por Disponer de la autorización.';
       End
    //FIN HERJA
    Else
       CalculaSdoActual;
    End;
  InterForma1.ValidaExit(edIMP_CREDITO, vlbSalida, vlStrMesg, True);
end;

procedure TWCrConRegCci.edF_AUTORIZAExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
Begin
 vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
    Begin
    If (Modo = moAppend) Or (Modo = moEdit) Then
      F_AUTORIZA.GetFromControl;

    If (F_AUTORIZA.AsDateTime = 0) Then
       Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbF_AUTORIZA.Caption;
       End
    Else If (F_AUTORIZA.AsDateTime < Autorizacion.F_AUT_COMITE.AsDateTime) Then
       Begin
       vlbSalida := False;
       vlStrMesg := 'La ' + lbF_AUTORIZA.Caption + ' no debe ser menor a la ' + lbF_AUT_COMITE.Caption + ' de la autorización.';
       End;
    End;
  InterForma1.ValidaExit(edF_AUTORIZA, vlbSalida, vlStrMesg, True);
end;

procedure TWCrConRegCci.edF_CCI_VTOExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
    Begin
    If (Modo = moAppend) Or (Modo = moEdit) Then
       Begin
       F_VENCIMIENTO.GetFromControl;
       F_AUTORIZA.GetFromControl;
       End;

    If (F_VENCIMIENTO.AsDateTime = 0) Then
       Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbF_CCI_VTO.Caption;
       End
    Else If (F_VENCIMIENTO.AsDateTime > Autorizacion.F_VENCIMIENTO.AsDateTime) Then
       Begin
       vlbSalida := False;
       vlStrMesg := 'La ' + lbF_CCI_VTO.Caption + ' no puede ser mayor que la '+lbF_AUT_COMITE.Caption+' de la Autorización (Línea).';
       End;
    End;

  Objeto.CalculaDiasPlazo;
  InterForma1.ValidaExit(edF_CCI_VTO, vlbSalida, vlStrMesg, True);
end;

procedure TWCrConRegCci.edF_DISPOSICIONExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
    Begin
    If (Modo = moAppend) Or (Modo = moEdit) Then
      Begin
      F_DISPOSICION.GetFromControl;
      F_VENCIMIENTO.GetFromControl;
      F_AUTORIZA.GetFromControl;
      CalculaDiasPlazo;
      End;

    If (F_DISPOSICION.AsDateTime = 0) Then
       Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbF_DISPOSICION.Caption;
       End
    Else If (F_DISPOSICION.AsDateTime < Autorizacion.F_AUT_COMITE.AsDateTime) Then
       Begin
       vlbSalida := False;
       vlStrMesg := 'La ' + lbF_DISPOSICION.Caption + ' no puede ser menor que la '+lbF_AUT_COMITE.Caption;
       End
    Else If (F_DISPOSICION.AsDateTime > F_VENCIMIENTO.AsDateTime) And (F_VENCIMIENTO.AsDateTime > 0) Then
       Begin
       vlbSalida := False;
       vlStrMesg := 'La ' + lbF_DISPOSICION.Caption + ' no puede ser mayor que la '+lbF_CCI_VTO.Caption;
       End;
    End;
  InterForma1.ValidaExit(edF_DISPOSICION, vlbSalida, vlStrMesg, True);
end;

procedure TCrCoReCc.CalculaSdoActual;
var vlValor : Double;
begin
  If (Modo = moAppend) Or (Modo = moEdit) Then
    IMP_CREDITO.GetFromControl;

  PCT_ADICIONAL_V.AsFloat := PCT_ADICIONAL.AsFloat;
  IMP_ADICIONAL_V.AsFloat := IMP_ADICIONAL.AsFloat;

  vlValor := IMP_CREDITO.AsFloat + IMP_ADICIONAL_V.AsFloat + IMP_APLICADO_V.AsFloat;
  SDO_ACTUAL_V.AsFloat :=  Redondeos(vlValor,2,'N');

  Case Autorizacion.CVE_MONEDA.AsInteger Of
//        484 : SDO_ACTUAL_MN_V.AsFloat := Trunc(SDO_ACTUAL_V.AsFloat* 100)/100;
//        840 : SDO_ACTUAL_MN_V.AsFloat := Trunc(SDO_ACTUAL_V.AsFloat * TIPO_CAMBIO_DLLS.AsFloat* 100)/100;
//        800 : SDO_ACTUAL_MN_V.AsFloat := Trunc(SDO_ACTUAL_V.AsFloat * TIPO_CAMBIO_UDIS.AsFloat* 100)/100;

        484 : Begin
                vlValor :=  (SDO_ACTUAL_V.AsFloat);
                SDO_ACTUAL_MN_V.AsFloat := Redondeos(vlValor,2,'N');
              end;

        840 : Begin
                vlValor :=  (SDO_ACTUAL_V.AsFloat * TIPO_CAMBIO_DLLS.AsFloat);
                SDO_ACTUAL_MN_V.AsFloat := Redondeos(vlValor,2,'N');
              end;
        800 :  Begin
                vlValor :=  (SDO_ACTUAL_V.AsFloat * TIPO_CAMBIO_UDIS.AsFloat);
                SDO_ACTUAL_MN_V.AsFloat := Redondeos(vlValor,2,'N');
              end;
  Else
    SDO_ACTUAL_MN_V.AsFloat := -1; // Error
  End;

  Case Autorizacion.CVE_MONEDA.AsInteger Of
//    484 : SDO_ACTUAL_MN_ANT_V.AsFloat := Trunc(SDO_ACTUAL_V.AsFloat* 100)/100;
//    840 : SDO_ACTUAL_MN_ANT_V.AsFloat := Trunc(SDO_ACTUAL_V.AsFloat * TIPO_CAMBIO_DLLS_ANT.AsFloat* 100)/100;
//    800 : SDO_ACTUAL_MN_ANT_V.AsFloat := Trunc(SDO_ACTUAL_V.AsFloat * TIPO_CAMBIO_UDIS_ANT.AsFloat* 100)/100;
    484 : Begin
        vlValor :=  (SDO_ACTUAL_V.AsFloat);
        SDO_ACTUAL_MN_ANT_V.AsFloat := Redondeos(vlValor,2,'N');
          End;
    840 : Begin
         vlValor :=  (SDO_ACTUAL_V.AsFloat * TIPO_CAMBIO_DLLS_ANT.AsFloat);
        SDO_ACTUAL_MN_ANT_V.AsFloat := Redondeos(vlValor,2,'N');
          End;
    800 : Begin
        vlValor :=  (SDO_ACTUAL_V.AsFloat * TIPO_CAMBIO_UDIS_ANT.AsFloat);
        SDO_ACTUAL_MN_ANT_V.AsFloat := Redondeos(vlValor,2,'N');
         End;

  Else
    SDO_ACTUAL_MN_ANT_V.AsFloat := -1; // Error
  End;
end;
procedure TWCrConRegCci.ilID_CONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show := True;
end;

procedure TWCrConRegCci.LimpiaStringAlignGrid(peStringAlignGrid : TStringAlignGrid);
var nRow : Integer;
begin
   with peStringAlignGrid do
   begin
     ClearGrid(peStringAlignGrid);
     Application.ProcessMessages;
     for nRow := 1 to RowCount-1 do
       RemoveRow(Row);
     //ends_for
     ColorRow[Row] := clWhite;
     RowFont[Row].Color := clBlack;
   end;
end;

procedure TWCrConRegCci.MuestraDatosComisiones;
var
  vlIMP_TOT_CNIMP_V , vlIMP_TOT_CNIVA_V ,
  vlIMP_TOT_CNAPL_V
  // ,vlIMP_TOT_CNSDO_V
  : Real;
  vlSQL : String;
  vlQry : TQuery;
  vlRow, vlnRecordCount : Integer;
begin
  ClearGrid(StrAlgnGrdComisiones);

  vlIMP_TOT_CNIMP_V := 0; vlIMP_TOT_CNIVA_V := 0;
  vlIMP_TOT_CNAPL_V := 0; // vlIMP_TOT_CNSDO_V := 0;

  vlSQL := ' SELECT ID_CCI_COMIS,'+coCRLF+
           '        CVE_COMISION, F_VENCIMIENTO, F_APLICACION, IMP_COMISION, IMP_IVA,'+coCRLF+
           '       (IMP_COMISION  + IMP_IVA) AS IMP_COBRADO,'+coCRLF+
           '       (IMP_COMIS_PAG + IMP_IVA_PAG) AS IMP_APLICADO,'+coCRLF+
           '       (IMP_COMISION  + IMP_IVA) - (IMP_COMIS_PAG + IMP_IVA_PAG) AS IMP_SALDO,'+coCRLF+
           '       SIT_COMISION'+coCRLF+
           ' FROM CR_CCI_COMIS'+coCRLF+
           ' WHERE ID_CREDITO = '+Objeto.ID_CREDITO.AsString+coCRLF+
           '   AND SIT_COMISION <> ''CA'' '+coCRLF+
           ' ORDER BY F_VENCIMIENTO '+coCRLF;

  vlQry := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);

  If Not Assigned(vlQry) Then
    Exit;

  vlRow := 1;
  With (vlQry) Do
    Try
     Last; First; vlnRecordCount := RecordCount;
     If vlnRecordCount < 2 Then vlnRecordCount := 2
     Else vlnRecordCount := vlnRecordCount + 1;

     StrAlgnGrdComisiones.RowCount := vlnRecordCount;
     While Not vlQry.Eof Do
        Begin
        StrAlgnGrdComisiones.Cells[0, vlRow] := FieldByName('ID_CCI_COMIS').AsString;
        StrAlgnGrdComisiones.Cells[1, vlRow] := FieldByName('CVE_COMISION').AsString;

        If (FieldByName('F_VENCIMIENTO').IsNull) Or (FieldByName('F_VENCIMIENTO').AsDateTime <= StrToDate('01/01/1980')) Then
          StrAlgnGrdComisiones.Cells[2, vlRow] := ''
        Else
          StrAlgnGrdComisiones.Cells[2, vlRow] := DateToStr(FieldByName('F_VENCIMIENTO').AsDateTime);

        If (FieldByName('F_APLICACION').IsNull) Or (FieldByName('F_VENCIMIENTO').AsDateTime <= StrToDate('01/01/1980')) Then
          StrAlgnGrdComisiones.Cells[3, vlRow] := ''
        Else
          StrAlgnGrdComisiones.Cells[3, vlRow] := DateToStr(FieldByName('F_APLICACION').AsDateTime);

        StrAlgnGrdComisiones.Cells[4, vlRow] := Format(CFORMAT_DINERO, [FieldByName('IMP_COMISION').AsFloat]);
        StrAlgnGrdComisiones.Cells[5, vlRow] := Format(CFORMAT_DINERO, [FieldByName('IMP_IVA').AsFloat]);
        StrAlgnGrdComisiones.Cells[6, vlRow] := Format(CFORMAT_DINERO, [FieldByName('IMP_COBRADO').AsFloat]);
        StrAlgnGrdComisiones.Cells[7, vlRow] := Format(CFORMAT_DINERO, [FieldByName('IMP_APLICADO').AsFloat]);
        StrAlgnGrdComisiones.Cells[8, vlRow] := FieldByName('SIT_COMISION').AsString;

        vlIMP_TOT_CNIMP_V := vlIMP_TOT_CNIMP_V + FieldByName('IMP_COMISION').AsFloat;
        vlIMP_TOT_CNIVA_V := vlIMP_TOT_CNIVA_V + FieldByName('IMP_IVA').AsFloat;
        vlIMP_TOT_CNAPL_V := vlIMP_TOT_CNAPL_V + FieldByName('IMP_APLICADO').AsFloat;
        // vlIMP_TOT_CNSDO_V := vlIMP_TOT_CNSDO_V + FieldByName('IMP_SALDO').AsFloat;

        Inc(vlRow);
        Next;
        End; // While Not vlQry.Eof Do

    Finally
      vlQry.Close;
    End; // With (vlQry) Do

  Objeto.IMP_TOT_CNIMP_V.AsFloat := vlIMP_TOT_CNIMP_V;
  Objeto.IMP_TOT_CNIVA_V.AsFloat := vlIMP_TOT_CNIVA_V;
  Objeto.IMP_TOT_CNAPL_V.AsFloat := vlIMP_TOT_CNAPL_V;
//  Objeto.IMP_TOT_CNSDO_V.AsFloat := vlIMP_TOT_CNSDO_V;
end;

procedure TWCrConRegCci.MuestraDatosConceptos;
var
  vlIMP_APLICADO_V : Real;
  vlSQL : String;
  vlQry : TQuery;
  vlRow, vlnRecordCount : Integer;
begin
  ClearGrid(StrAlgnGrdConceptos);

  vlIMP_APLICADO_V := 0;

  vlSQL := ' SELECT CCT.ID_CCI_TRANSAC,'+coCRLF+
           '        CCT.F_OPERACION, CCC.CVE_CCI_CONCEPTO, CCC.DESC_CCI_CONCEPT, CCT.TX_MOTIVO, CCT.IMP_CONCEPTO, CCC.CVE_AFEC_SALDO'+coCRLF+
           ' FROM CR_CCI_TRANSAC CCT,'+coCRLF+
           '      CR_CCI_CONCEPTO CCC'+coCRLF+
           ' WHERE CCT.ID_CREDITO = '+Objeto.ID_CREDITO.AsString+coCRLF+
           '   AND CCT.SIT_CCI_TRANSAC <> ''CA'''+coCRLF+
           '   AND CCC.CVE_CCI_CONCEPTO = CCT.CVE_CCI_CONCEPTO'+coCRLF+
           ' ORDER BY CCT.F_OPERACION';

  vlQry := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);

  If Not Assigned(vlQry) Then
    Exit;

  vlRow := 1;
  With (vlQry) Do
    Try
     Last; First; vlnRecordCount := RecordCount;
     If vlnRecordCount < 2 Then vlnRecordCount := 2
     Else vlnRecordCount := vlnRecordCount + 1;

     StrAlgnGrdConceptos.RowCount := vlnRecordCount;
     While Not vlQry.Eof Do
        Begin
        StrAlgnGrdConceptos.Cells[0, vlRow] := FieldByName('ID_CCI_TRANSAC').AsString;
        StrAlgnGrdConceptos.Cells[1, vlRow] := FieldByName('CVE_CCI_CONCEPTO').AsString;
        StrAlgnGrdConceptos.Cells[2, vlRow] := DateToStr(FieldByName('F_OPERACION').AsDateTime);
        StrAlgnGrdConceptos.Cells[3, vlRow] := FieldByName('DESC_CCI_CONCEPT').AsString;
        StrAlgnGrdConceptos.Cells[4, vlRow] := FieldByName('TX_MOTIVO').AsString;
        StrAlgnGrdConceptos.Cells[5, vlRow] := Format(CFORMAT_DINERO, [FieldByName('IMP_CONCEPTO').AsFloat]);

        If (FieldByName('CVE_AFEC_SALDO').AsString = 'I') Then
          vlIMP_APLICADO_V := vlIMP_APLICADO_V + FieldByName('IMP_CONCEPTO').AsFloat
        Else If (FieldByName('CVE_AFEC_SALDO').AsString = 'D') Then
          vlIMP_APLICADO_V := vlIMP_APLICADO_V - FieldByName('IMP_CONCEPTO').AsFloat;

        Inc(vlRow);
        Next;
        End; // While Not vlQry.Eof Do

    Finally
      vlQry.Close;
    End; // With (vlQry) Do

  Objeto.IMP_APLICADO_V.AsFloat := vlIMP_APLICADO_V;
  Objeto.CalculaSdoActual;
end;

procedure TWCrConRegCci.btnAdicionaComisionesClick(Sender: TObject);
var vlRow : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRCORECC_INPCM',True,True) then
   begin
     With Objeto Do
      Begin
        If (Modo = moAppend) Then
          Begin
          MessageDlg('Debe de "Aceptar" primero los cambios antes de proceder a registrar las Comisiones.', mtWarning, [mbOk], 0);
          Exit;
          End;

        If (ID_CREDITO.AsInteger = 0) Then
          Begin
          MessageDlg('Debe de "Seleccionar" primero una Carta de Crédito.', mtWarning, [mbOk], 0);
          Exit;
          End;

        vlRow := StrAlgnGrdComisiones.Row;
        RegistraComisiones(ID_CREDITO.AsInteger);
        MuestraDatosComisiones;
        StrAlgnGrdComisiones.Row := vlRow;
      End;
   end;
end;

procedure TWCrConRegCci.edNOM_BENEFICIARIOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edNOM_BENEFICIARIO, True, '', True);
end;

procedure TWCrConRegCci.btnCVE_GARANTIAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCORECC_CVEGAR',True,True) then
   begin
      Objeto.Garantia.ShowAll := True;
      Objeto.Garantia.Busca;
   end;
end;

procedure TWCrConRegCci.ilCVE_GARANTIAEjecuta(Sender: TObject);
begin
  Objeto.Garantia.FindKey([ilCVE_GARANTIA.Buffer]);
end;

procedure TWCrConRegCci.edCVE_GARANTIAExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
     sText : String;
     bFind : Boolean;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
  Begin
    sText := edCVE_GARANTIA.Text;
    If (Trim(sText) = '') Then
    Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbCVE_GARANTIA.Caption;
    End
    Else
    Begin
      Try
         If (Modo = moAppend) Or (Modo = moEdit) Then
           CVE_GARANTIA.GetFromControl;
           
         bfind := Garantia.FindKey([sText]);
         If not bFind Then
         Begin
            vlbSalida := False;
            vlStrMesg := 'El campo '+lbCVE_GARANTIA.Caption+' no es válido. Favor de verificar';
         End;
      Except
        On EInterFrame Do
        Begin
          vlbSalida := False;
          vlStrMesg := 'El '+lbCVE_GARANTIA.Caption+' no es válido. Favor de verificar';
        End;
      End;
    End;
  End;
  InterForma1.ValidaExit(edCVE_GARANTIA, vlbSalida, vlStrMesg, True);
end;

procedure TWCrConRegCci.edIMP_GARANTIAExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
    Begin
    If (Modo = moAppend) Or (Modo = moEdit) Then
      Begin
      IMP_GARANTIA.GetFromControl;
      CVE_GARANTIA.GetFromControl;
      End;

    If ((Trim(Garantia.CVE_GARANTIA.AsString) <> 'SCL0') And (IMP_GARANTIA.AsFloat = 0)) Then
       Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbIMP_GARANTIA.Caption;
       End;

    CalculaGtiaRequerida;       
    End;
  InterForma1.ValidaExit(edIMP_GARANTIA, vlbSalida, vlStrMesg, True);
end;

procedure TWCrConRegCci.edNUM_GTIA_PROPORExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
    Begin
    If (Modo = moAppend) Or (Modo = moEdit) Then
       NUM_GTIA_PROPOR.GetFromControl;

    If ((Trim(Garantia.CVE_GARANTIA.AsString) <> 'SCL0') And (NUM_GTIA_PROPOR.AsFloat = 0)) Then
       Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbNUM_GTIA_PROPOR.Caption;
       End;
    CalculaGtiaRequerida;       
    End;
  InterForma1.ValidaExit(edNUM_GTIA_PROPOR, vlbSalida, vlStrMesg, True);
end;

procedure TWCrConRegCci.memDESC_GTIA_ADICExit(Sender: TObject);
begin
  InterForma1.ValidaExit(memDESC_GTIA_ADIC, True, '', True);
end;

procedure TWCrConRegCci.btnCVE_FND_ENT_DESClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCORECC_ENTAVL',True,True) then
   begin
      Objeto.EntidadDesc.Busca;
   end;
end;

procedure TWCrConRegCci.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
  Objeto.EntidadDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]);
end;

procedure TWCrConRegCci.edCVE_FND_ENT_DESExit(Sender: TObject);
Begin
  InterForma1.ValidaExit(edCVE_FND_ENT_DES, True, '', True);
end;

function TWCrConRegCci.RegistraComisiones(peID_CREDITO : Integer) : Boolean;
var CrCciComi : TCrCciComi;
begin
  {$WARNINGS OFF}
  CrCciComi := TCrCciComi.Create(self);
  {$WARNINGS ON}
  Try
    CrCciComi.Apli := Objeto.Apli;
    CrCciComi.ParamCre := Objeto.ParamCre;
    CrCciComi.vgID_CREDITO := Objeto.ID_CREDITO.AsInteger;
    CrCciComi.vgIMP_CREDITO := Objeto.IMP_CREDITO.AsFloat;
    CrCciComi.vgF_DISPOSICION_CCI := Objeto.F_DISPOSICION.AsDateTime;
    Result := CrCciComi.Nuevo;
  Finally
    CrCciComi.Free;
  End;
end;

function TWCrConRegCci.RegistraConceptos  : Boolean;
var CrCciTran : TCrCciTran;
begin
  {$WARNINGS OFF}
  CrCciTran := TCrCciTran.Create(self);
  {$WARNINGS ON}
  Try
    CrCciTran.Apli := Objeto.Apli;
    CrCciTran.ParamCre := Objeto.ParamCre;
    CrCciTran.vgID_CREDITO := Objeto.ID_CREDITO.AsInteger;
    CrCciTran.vgIMP_CREDITO := Objeto.IMP_CREDITO.AsFloat;
    CrCciTran.vgIMP_ADICIONAL := Objeto.IMP_ADICIONAL.AsFloat;
    CrCciTran.vgSDO_ACTUAL_V := Objeto.SDO_ACTUAL_V.AsFloat;
    Result := CrCciTran.Nuevo;
  Finally
    CrCciTran.Free;
  End;
end;

procedure TWCrConRegCci.StrAlgnGrdComisionesDblClick(Sender: TObject);
begin
  btnEditaComisionesClick(Self);
end;

procedure TWCrConRegCci.btnEditaComisionesClick(Sender: TObject);
var CrCciComi : TCrCciComi;
    vlID_CCI_COMIS : Integer;
    vlRow : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRCORECC_EDCOM',True,True) then
   begin
      {$WARNINGS OFF}
      CrCciComi := TCrCciComi.Create(self);
      {$WARNINGS ON}
      Try
        CrCciComi.Apli := Objeto.Apli;
        CrCciComi.ParamCre := Objeto.ParamCre;
        vlRow := StrAlgnGrdComisiones.Row;

        If (StrAlgnGrdComisiones.Cells[0, vlRow] = '') Then
          Exit;

        vlID_CCI_COMIS := StrToInt(StrAlgnGrdComisiones.Cells[0, vlRow]);
        CrCciComi.FindKey([vlID_CCI_COMIS]);
        CrCciComi.vgID_CREDITO := Objeto.ID_CREDITO.AsInteger;
        CrCciComi.vgIMP_CREDITO := Objeto.IMP_CREDITO.AsFloat;
        CrCciComi.vgF_DISPOSICION_CCI := Objeto.F_DISPOSICION.AsDateTime;
        CrCciComi.Modifica;
        MuestraDatosComisiones;
        StrAlgnGrdComisiones.Row := vlRow;
      Finally
        CrCciComi.Free;
      End;
   end;
end;

procedure TWCrConRegCci.edPCT_ADICIONALExit(Sender: TObject);
begin
  With Objeto Do
    Begin
    If (Modo = moAppend) Or (Modo = moEdit) Then
      PCT_ADICIONAL.GetFromControl;

    IMP_ADICIONAL.AsFloat := IMP_CREDITO.AsFloat * PCT_ADICIONAL.AsFloat / 100;

    CalculaSdoActual;
    InterForma1.ValidaExit(edPCT_ADICIONAL, True, '', True);
    End;
end;

procedure TWCrConRegCci.edIMP_ADICIONALExit(Sender: TObject);
begin
  With Objeto Do
    Begin
    If (Modo = moAppend) Or (Modo = moEdit) Then
      PCT_ADICIONAL.GetFromControl;

    PCT_ADICIONAL.AsFloat := IMP_ADICIONAL.AsFloat / IMP_CREDITO.AsFloat * 100;

    CalculaSdoActual;
    InterForma1.ValidaExit(edIMP_ADICIONAL, True, '', True);
    End;
end;

procedure TWCrConRegCci.btnAdicionaConceptosClick(Sender: TObject);
var vlRow : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRCORECC_ALRGCA',True,True) then
   begin
     With Objeto Do
      Begin
        If (Modo = moAppend) Then
          Begin
          MessageDlg('Debe de "Aceptar" primero los cambios antes de proceder a registrar las Comisiones.', mtWarning, [mbOk], 0);
          Exit;
          End;

        If (ID_CREDITO.AsInteger = 0) Then
          Begin
          MessageDlg('Debe de "Seleccionar" primero una Carta de Crédito.', mtWarning, [mbOk], 0);
          Exit;
          End;

        vlRow := StrAlgnGrdConceptos.Row;
        RegistraConceptos;
        MuestraDatosConceptos;
        StrAlgnGrdConceptos.Row := vlRow;
      End;
   end;
end;

procedure TWCrConRegCci.btnEditaConceptosClick(Sender: TObject);
var CrCciTran : TCrCciTran;
    vlRow : Integer;
    vlID_CCI_TRANSAC : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRCORECC_MODAPL',True,True) then
   begin
      {$WARNINGS OFF}
      CrCciTran := TCrCciTran.Create(self);
      {$WARNINGS ON}
      Try
        CrCciTran.Apli := Objeto.Apli;
        CrCciTran.ParamCre := Objeto.ParamCre;
        vlRow := StrAlgnGrdConceptos.Row;

        If (StrAlgnGrdConceptos.Cells[0, vlRow] = '') Then
          Exit;

        vlID_CCI_TRANSAC := StrToInt(StrAlgnGrdConceptos.Cells[0, vlRow]);
        CrCciTran.FindKey([vlID_CCI_TRANSAC]);
        CrCciTran.vgID_CREDITO := Objeto.ID_CREDITO.AsInteger;
        CrCciTran.vgIMP_CREDITO := Objeto.IMP_CREDITO.AsFloat;
        CrCciTran.vgIMP_ADICIONAL := Objeto.IMP_ADICIONAL.AsFloat;
        CrCciTran.vgSDO_ACTUAL_V := Objeto.SDO_ACTUAL_V.AsFloat;
        CrCciTran.Modifica;
        MuestraDatosConceptos;
        StrAlgnGrdConceptos.Row := vlRow;
      Finally
        CrCciTran.Free;
      End;
   end;
end;

procedure TWCrConRegCci.edIMP_CREDITOChange(Sender: TObject);
begin
  edIMP_CREDITO_V.Text := edIMP_CREDITO.Text;
end;

procedure TWCrConRegCci.edIMP_ADICIONAL_VChange(Sender: TObject);
begin
  edIMP_ADICIONAL_V1.Text := edIMP_ADICIONAL_V.Text;
end;

procedure TWCrConRegCci.edIMP_APLICADO_VChange(Sender: TObject);
begin
  edIMP_APLICADO_V1.Text := edIMP_APLICADO_V.Text;
end;

procedure TWCrConRegCci.edSDO_ACTUAL_VChange(Sender: TObject);
begin
  edSDO_ACTUAL_V1.Text := edSDO_ACTUAL_V.Text;
end;

procedure TWCrConRegCci.StrAlgnGrdConceptosDblClick(Sender: TObject);
begin
  btnEditaConceptosClick(Self);
end;

procedure TWCrConRegCci.edDIAS_PLAZO_VExit(Sender: TObject);
begin
  With Objeto Do
    Begin
    If (Modo = moAppend) Or (Modo = moEdit) Then
      Begin
      DIAS_PLAZO_V.GetFromControl;
      F_VENCIMIENTO.AsDateTime := Trunc(F_DISPOSICION.AsDateTime + DIAS_PLAZO_V.AsFloat);
      End;
    End;
  InterForma1.ValidaExit(edDIAS_PLAZO_V, True, '', True);
end;

procedure TCrCoReCc.CalculaDiasPlazo;
begin
  If (Modo = moAppend) Or (Modo = moEdit) Then
    Begin
    F_VENCIMIENTO.GetFromControl;
    F_DISPOSICION.GetFromControl;
    End;

  If (F_VENCIMIENTO.AsDateTime <> 0) Then
    DIAS_PLAZO_V.AsFloat  := Trunc(F_VENCIMIENTO.AsDateTime - F_DISPOSICION.AsDateTime);
end;

procedure TCrCoReCc.ObtenTipoCambio;
var vlwAnio, vlwMes, vlwDia : Word;
    vlTIPO_CAMBIO_DLLS, vlTIPO_CAMBIO_UDIS,
    vlTIPO_CAMBIO_DLLS_ANT, vlTIPO_CAMBIO_UDIS_ANT : Real;
begin
  DecodeDate(Apli.DameFechaEmpresa, vlwAnio, vlwMes, vlwDia);

// Calculo del Tipo de Cambio al Mes Actual

  GetSQLFloat('SELECT PKGCRCONSOLIDADO1.FNC_OBT_TIPO_CAMBIO_REGUL(840, ''FMAC'', '+IntToStr(vlwAnio)+', '+IntToStr(vlwMes)+') AS TIPO_CAMBIO FROM DUAL',
               Apli.DatabaseName, Apli.SessionName, 'TIPO_CAMBIO', vlTIPO_CAMBIO_DLLS, False);

  GetSQLFloat('SELECT PKGCRCONSOLIDADO1.FNC_OBT_TIPO_CAMBIO_REGUL(800, ''FMAC'', '+IntToStr(vlwAnio)+', '+IntToStr(vlwMes)+') AS TIPO_CAMBIO FROM DUAL',
              Apli.DatabaseName, Apli.SessionName, 'TIPO_CAMBIO', vlTIPO_CAMBIO_UDIS, False);

  TIPO_CAMBIO_DLLS.AsFloat  := vlTIPO_CAMBIO_DLLS;
  TIPO_CAMBIO_UDIS.AsFloat  := vlTIPO_CAMBIO_UDIS;

//------------------------------------------------------------------------------------------------------------------------------------------------

// Calculo del Tipo de Cambio al Mes Anterior
  DecodeDate(IncMonth(Apli.DameFechaEmpresa,-1), vlwAnio, vlwMes, vlwDia);

  GetSQLFloat('SELECT PKGCRCONSOLIDADO1.FNC_OBT_TIPO_CAMBIO_REGUL(840, ''FMAC'', '+IntToStr(vlwAnio)+', '+IntToStr(vlwMes)+') AS TIPO_CAMBIO FROM DUAL',
               Apli.DatabaseName, Apli.SessionName, 'TIPO_CAMBIO', vlTIPO_CAMBIO_DLLS_ANT, False);

  GetSQLFloat('SELECT PKGCRCONSOLIDADO1.FNC_OBT_TIPO_CAMBIO_REGUL(800, ''FMAC'', '+IntToStr(vlwAnio)+', '+IntToStr(vlwMes)+') AS TIPO_CAMBIO FROM DUAL',
              Apli.DatabaseName, Apli.SessionName, 'TIPO_CAMBIO', vlTIPO_CAMBIO_UDIS_ANT, False);

  TIPO_CAMBIO_DLLS_ANT.AsFloat  := vlTIPO_CAMBIO_DLLS_ANT;
  TIPO_CAMBIO_UDIS_ANT.AsFloat  := vlTIPO_CAMBIO_UDIS_ANT;
end;

procedure TWCrConRegCci.MuestraTodo;
begin
  With Objeto Do
    Begin

  edIMP_DISPUESTO.Text:='0.00';
  edDISP_LINEA.Text:='0.00';

    MuestraDatosAutorizacion;
    CatClasLegal.FindKey([CVE_CLAS_LEGAL.AsString]);
    CatInfRec.FindKey([CVE_INF_RECUPERA.AsString]);
    Garantia.FindKey([CVE_GARANTIA.AsString]);
    EntidadDesc.FindKey([CVE_FND_ENT_DES.AsString]);
    ObtenTipoCambio;    
    MuestraDatosComisiones;
    MuestraDatosConceptos;
    CalculaDiasPlazo;
    CalculaSdoActual;
    CalculaGtiaRequerida;
    End;
end;

procedure TWCrConRegCci.InterForma1DespuesCancelar(Sender: TObject);
begin
   // edIMP_DISPUESTO.Text:='0.00';
   // edDISP_LINEA.Text:='0.00';

    if (Objeto.Modo = moEdit) Then
        MuestraTodo;
end;

procedure TWCrConRegCci.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlstrMsg : String;
begin
   If IsNewData Then //nuevo
      Begin
      If MessageDlg('¿Desea almacenar los datos capturados?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         Begin
         Objeto.ID_CREDITO.AsInteger := ObtenFolio('CRCCIREG', vlstrMsg, Objeto.Apli);
         Realizado := True;
         End
      Else
         Begin
         Realizado := False;
         End;
      End
   Else
      Begin
      If MessageDlg('¿Desea guardar los cambios realizados?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         Begin
         Realizado := True;
         End
      Else
         Begin
         Realizado := False;
         End;
      End;
end;

procedure TWCrConRegCci.InterForma1DespuesAceptar(Sender: TObject);
begin
//   FindKey([FH_ALTA.AsString,ID_CREDITO.AsString,ID_REG_VIGENTE.AsString]);
end;

procedure TCrCoReCc.CalculaGtiaRequerida;
begin
  If (Modo = moAppend) Or (Modo = moEdit) Then
    Begin
    IMP_GARANTIA.GetFromControl;
    NUM_GTIA_PROPOR.GetFromControl;
    End;

  IMP_TOT_GTIA_REQ.AsFloat := IMP_GARANTIA.AsFloat * NUM_GTIA_PROPOR.AsFloat;
  IMP_DIF_GTIA_REQ.AsFloat := IMP_TOT_GTIA_REQ.AsFloat - IMP_GARANTIA.AsFloat;
end;


Function TCrCoReCc.Redondeos(Var Numero: Double; Cant: Integer; TipoRedondeo: Char): Double;
var
Formato: String;
j: Integer;
Begin
// 'S' o 's' significa Redondeo Simétrico, de lo contrario es Truncado.
if (TipoRedondeo = 's') or (TipoRedondeo = 'S') then
 Begin
        if Cant = 0 then
                Formato := '0'
        else
                Formato := '0.';
                for j:=1 to Cant do
                begin
                        Formato := Formato + '0';
                end;
                Result := StrToFloat (FormatFloat(Formato,Numero));
 End
Else
 Begin
        if Pos('.',FloattoStr(Numero)) > 0 then
                Result := StrToFloat(Copy(FloattoStr(Numero),1,Pos('.',FloattoStr(Numero))-1) + Copy(FloattoStr(Numero),Pos('.',FloattoStr(Numero)),Cant+1))
        else
                Result := Numero;
 End;
End;


procedure TWCrConRegCci.opB_CCI_REFINANCExit(Sender: TObject);
begin
  InterForma1.ValidaExit(opB_CCI_REFINANC, True, '', True);
end;

end.


