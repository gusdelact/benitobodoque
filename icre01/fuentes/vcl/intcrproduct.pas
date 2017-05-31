// Sistema         : Clase de CR_PRODUCTO
// Fecha de Inicio : 05/06/2003
// Función forma   : Clase de CR_PRODUCTO
// Desarrollo por  : MACV. Class Maker.                     
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :                                                                                                                       
//                   07 AGO 2006. ELIMINA CAMPO DIAS_AVIS_DISP
Unit IntCrProduct;
                               
interface
                                                                   
uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,IntLinkit,
//UNIDADES ADICONALES
IntParamCre, //PARAMETRO
IntCrCatMini,//CATALOGO MINIMO
IntCrClaLeg, //CLASIFICACION LEGAL
IntCrOrigRec,//ORIGEN DE RECURSOS
IntCrDestino,//DESTINO
IntGenCre,   //GENERICA
Intempre,    //EMPRESA
IntMProdGpo, //GRUPO PRODUCTO
IntCrTCredit,//TIPO CUENTA BURO CREDITO
IntCrGruCla  //GRUPO CLAVES
{ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}
,
IntTasIndFin // TASA REFERENCIA
{ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}
;

CONST
  C_X_DIA   = 'CD';//CVE_CALCULO_INT
  C_LINEAL  = 'CL';//CVE_CALCULO_INT

  C_CAPITAL = 'SC';//CVE_IMP_CALC_INT
  C_VIGENTE = 'SD';//CVE_IMP_CALC_INT
  C_CREDITO = 'MC';//CVE_IMP_CALC_INT

  C_UDISADO = 'UD';//Cálc. Imp. IVA Interés
  C_PORCENT = 'PC';//Cálc. Imp. IVA Interés

  C_FAVOR_BANCO    = 'I';//CVE_AFEC_REDONDEO
  C_FAVOR_CLIENTE  = 'D';//CVE_AFEC_REDONDEO
  C_NO_APLICA      = 'N';//CVE_AFEC_REDONDEO

  C_PROD_CONT = 'Favor de indicar el producto contable';
  C_IND_CONT  = 'Favor de especificar el indicador adicional contable';

  C_GRUPO_CLAVE_TIPPAG = 'TIPPAG';

  C_ANTICIPADO_HABIL  = 'AH';
  C_POSTERIOR_HABIL   = 'PH';
  C_MISMO_DIA         = 'MD';

  C_MSG_MONEDAS       = 'Es indispensable se especifiquen los horarios para realizar las "Operaciones en Línea"'+
                        'de la(s) moneda(s): ';

  //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
  C_TRADICIONAL = 'TRA';//CVE_CAL_CAPITAL
  C_VPN         = 'VPN';//CVE_CAL_CAPITAL
  //--END


  //HERJA - TIPOA DE FINANCIAMIENTO ADICIONAL
  C_DIRECTO     = 'DR';
  C_PRORRATEO   = 'PR';

  {ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}
  C_PA          = 'PA';
  C_FIJA        = '';  // ESTE ES EL ESQUEMA ACTUAL EN LA TABLA QUEDA EN NULO
  {ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}

Type
 TCrProduct= class;

  TWCrProducto=Class(TForm)
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
    MsgPanel: TPanel;
    ilCLAS_LEGAL: TInterLinkit;
    ilCAT_MINIMO: TInterLinkit;
    pgAltaDatos: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    lbCVE_PRODUCTO_CRE: TLabel;
    lbDESC_L_PRODUCTO: TLabel;
    edDESC_L_PRODUCTO: TEdit;
    edCVE_PRODUCTO_CRE: TEdit;
    lbDESC_C_PRODUCTO: TLabel;
    edDESC_C_PRODUCTO: TEdit;
    btCONFIG_MONEDAS: TBitBtn;
    rgSIT_PRODUCTO: TRadioGroup;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    lbCVE_USU_MODIFICA: TLabel;
    lbCVE_USU_ALTA: TLabel;
    edF_ALTA: TEdit;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    edF_MODIFICA: TEdit;
    edID_EMPRESA: TEdit;
    btEMPRESA: TBitBtn;
    edNOM_EMPRESA: TEdit;
    Label1: TLabel;
    ilEMPRESA: TInterLinkit;
    TabSheet4: TTabSheet;
    GroupBox3: TGroupBox;
    cbB_COB_PARCIAL: TCheckBox;
    cbB_COB_TOT_PER: TCheckBox;
    cbB_COB_ORD_ACC: TCheckBox;
    cbB_COB_ORD_PER: TCheckBox;
    GroupBox6: TGroupBox;
    chB_MOD_TASA_REF_D: TCheckBox;
    chB_MOD_STASA_D: TCheckBox;
    chB_MOD_OP_STASA_D: TCheckBox;
    chB_CONSULTA_CAP: TCheckBox;
    chB_CONSULTA_INT: TCheckBox;
    chB_CONSULTA_COM: TCheckBox;
    chB_CONSULTA_DOC: TCheckBox;
    chB_CONSULTA_FIN: TCheckBox;
    GroupBox5: TGroupBox;
    lbPLAZO_MIN_DISP: TLabel;
    lbPLAZO_MAX_DISP: TLabel;
    IedPLAZO_MIN_DISP: TInterEdit;
    btPLAZOMINDISP: TBitBtn;
    IedPLAZO_MAX_DISP: TInterEdit;
    btPLAZOMAXDISP: TBitBtn;
    cbB_RANGO_PLA_DISP: TCheckBox;
    chB_PLAZO_CREDITO: TCheckBox;
    GroupBox2: TGroupBox;
    chB_GARANTIA: TCheckBox;
    chB_MOD_TASA_REFER: TCheckBox;
    chB_MOD_OPER_STASA: TCheckBox;
    chB_MOD_SOBRETASA: TCheckBox;
    chB_INDICA_TASA_AU: TCheckBox;
    chB_DIAS_ADIC_PAGO: TCheckBox;
    chB_PER_MORAL: TCheckBox;
    chB_PER_FISICA: TCheckBox;
    chB_APLICA_IVA: TCheckBox;
    GroupBox1: TGroupBox;
    lbIMP_MIN_AUT_CRE: TLabel;
    IedIMP_MIN_AUT_CRE: TInterEdit;
    lbIMP_MAX_AUT_CRE: TLabel;
    IedIMP_MAX_AUT_CRE: TInterEdit;
    cbB_RANGO_IMP_CRE: TCheckBox;
    cbB_RANGO_PLA_CRE: TCheckBox;
    btPLAZOMAXCRED: TBitBtn;
    IedPLAZO_MAX_CREDITO: TInterEdit;
    lbPLAZO_MAX_CREDITO: TLabel;
    btPLAZOMINCRED: TBitBtn;
    IedPLAZO_MIN_CREDITO: TInterEdit;
    lbPLAZO_MIN_CREDITO: TLabel;
    lbIMP_MIN_AUT_DIS: TLabel;
    IedIMP_MIN_AUT_DIS: TInterEdit;
    lbIMP_MAX_AUT_DIS: TLabel;
    IedIMP_MAX_AUT_DIS: TInterEdit;
    cbB_RANGO_IMP_DISP: TCheckBox;
    Bevel1: TBevel;
    Label6: TLabel;
    Bevel2: TBevel;
    Label7: TLabel;
    chB_FINANC_ADIC: TCheckBox;
    ilPRODUCTO_GPO: TInterLinkit;
    ilCVE_TIPO_CRED_BC: TInterLinkit;
    chB_APL_CONVE_MOD: TCheckBox;
    chB_APL_EVEN_ACEL: TCheckBox;
    rgCVE_IMP_CALC_INT: TRadioGroup;
    rgCVE_CALC_IVA_INT: TRadioGroup;
    chB_APL_MOR_INT: TCheckBox;
    GroupBox4: TGroupBox;
    edNUM_DMIN_REQ_PER: TInterEdit;
    lbNUM_DMIN_REQ_PER: TLabel;
    edNUM_DIAS_AGR_PER: TInterEdit;
    lbNUM_DIAS_AGR_PER: TLabel;
    lbUNIDAD_REDONDEO: TLabel;
    edUNIDAD_REDONDEO: TInterEdit;
    lbCVE_AFEC_REDONDEO: TLabel;
    cbxCVE_AFEC_REDONDEO: TComboBox;
    chB_APL_RENOVACION: TCheckBox;
    chB_APL_REESTRUCT: TCheckBox;
    cbB_CALI_ACRE_DISP: TCheckBox;
    chB_APL_PRORROGA: TCheckBox;
    GroupBox7: TGroupBox;
    Label2: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edDESC_L_PROD_GPO: TEdit;
    lbCVE_CLAS_CONTAB: TLabel;
    edCVE_CLAS_CONTAB: TEdit;
    btCVE_CLAS_CONTAB: TBitBtn;
    edDESC_CLAS_CONTAB: TEdit;
    lbCVE_CLAS_LEGAL: TLabel;
    edCVE_CLAS_LEGAL: TEdit;
    btCVE_CLAS_LEGAL: TBitBtn;
    edDESC_CLAS_LEGAL: TEdit;
    Label3: TLabel;
    edCVE_TIPO_CRED_BC: TEdit;
    btCVE_TIPO_CRED_BC: TBitBtn;
    edDESC_TIPO_CRED: TEdit;
    rgCVE_REVOLVENCIA: TRadioGroup;
    Label4: TLabel;
    cbxCVE_TIPO_CARTERA: TComboBox;
    lbCVE_PR_CONTABLE: TLabel;
    edCVE_PR_CONTABLE: TEdit;
    lbCVE_IND_ADI_CONT: TLabel;
    edCVE_IND_ADI_CONT: TEdit;
    chB_REDONDEO: TCheckBox;
    lbCVE_GEN_TIP_PAG: TLabel;
    edCVE_GEN_TIP_PAG: TEdit;
    btCVE_GEN_TIP_PAG: TBitBtn;
    edDESC_GEN_TIP_PAG: TEdit;
    ilCVE_GEN_TIP_PAG: TInterLinkit;
    cbB_GENERA_EDOCTA: TCheckBox;
    Label5: TLabel;
    iedDIA_GEN_EDO_CTA: TInterEdit;
    chB_GENERA_CONTA: TCheckBox;
    chB_GEN_CONT_CC: TCheckBox;
    chB_GEN_CONT_PROV: TCheckBox;
    chB_REP_REG_CNBV: TCheckBox;
    chB_EXCESO_EVE: TCheckBox;
    Bevel3: TBevel;
    rgCVE_CALCULO_INT: TRadioGroup;
    rgCVE_AJUSTE_F_VTO: TRadioGroup;
    cbB_DISP_EN_LINEA: TCheckBox;
    Label8: TLabel;
    IedIMP_MIN_DOCTO: TInterEdit;
    chB_SOBREGIRO: TCheckBox;
    //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
    rgCVE_CAL_CAPITAL: TRadioGroup;
    chB_AJU_IMP_U_P: TCheckBox;
    //--END

    rgCVE_FINANC_ADIC: TRadioGroup;
    cbB_ENVIA_FE: TCheckBox;
    ilTASA_REFER_M: TInterLinkit;
    rgCVE_CALCULO_M: TRadioGroup;
    lbCVE_TASA_REFER: TLabel;
    lbOPERADOR_STASA: TLabel;
    edCVE_TASA_REFER_M: TEdit;
    cbOPERADOR_STASA_M: TEdit;
    Label9: TLabel;
    edSOBRETASA_M: TInterEdit;
    btTASA_REFER_M: TBitBtn;
    edDESC_TASA_REFER_M: TEdit;
    chB_REESTRUCTURA: TCheckBox;
    chB_APL_PAG25REN: TCheckBox;
    chB_PLAZO_RE: TCheckBox;
    chB_PLAZO_RS: TCheckBox;
    chB_LINEA_CREDITO: TCheckBox;
    bbtnBitProd: TBitBtn;

    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure edCVE_CLAS_CONTABExit(Sender: TObject);
    procedure edDESC_L_PRODUCTOExit(Sender: TObject);
    procedure edDESC_C_PRODUCTOExit(Sender: TObject);
    procedure edCVE_CLAS_LEGALExit(Sender: TObject);
    procedure btCVE_CLAS_CONTABClick(Sender: TObject);
    procedure ilCAT_MINIMOEjecuta(Sender: TObject);
    procedure btCVE_CLAS_LEGALClick(Sender: TObject);
    procedure ilCLAS_LEGALEjecuta(Sender: TObject);
    procedure chB_GARANTIAExit(Sender: TObject);
    procedure chB_PER_FISICAExit(Sender: TObject);
    procedure chB_PER_MORALExit(Sender: TObject);
    procedure chB_APLICA_IVAExit(Sender: TObject);
    procedure IedIMP_MIN_AUT_CREExit(Sender: TObject);
    procedure IedIMP_MIN_AUT_DISExit(Sender: TObject);
    procedure IedIMP_MAX_AUT_CREExit(Sender: TObject);
    procedure IedIMP_MAX_AUT_DISExit(Sender: TObject);
    procedure IedPLAZO_MIN_CREDITOExit(Sender: TObject);
    procedure IedPLAZO_MIN_DISPExit(Sender: TObject);
    procedure IedPLAZO_MAX_CREDITOExit(Sender: TObject);
    procedure IedPLAZO_MAX_DISPExit(Sender: TObject);
    procedure chB_MOD_TASA_REFERExit(Sender: TObject);
    procedure chB_MOD_OPER_STASAExit(Sender: TObject);
    procedure chB_MOD_SOBRETASAExit(Sender: TObject);
    procedure rgSIT_PRODUCTOExit(Sender: TObject);
    procedure chB_PLAZO_CREDITOExit(Sender: TObject);
    procedure btCONFIG_MONEDASClick(Sender: TObject);
    procedure btPLAZOMINCREDClick(Sender: TObject);
    Function  VentanaCalculo(pDato : String): string;
    procedure btPLAZOMINDISPClick(Sender: TObject);
    procedure btPLAZOMAXCREDClick(Sender: TObject);
    procedure btPLAZOMAXDISPClick(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure rgCVE_REVOLVENCIAExit(Sender: TObject);
    procedure cbB_COB_ORD_PERExit(Sender: TObject);
    procedure cbB_COB_ORD_ACCExit(Sender: TObject);
    procedure cbB_COB_TOT_PERExit(Sender: TObject);
    procedure cbB_COB_PARCIALExit(Sender: TObject);
    procedure cbB_RANGO_IMP_CREExit(Sender: TObject);
    procedure cbB_RANGO_IMP_DISPExit(Sender: TObject);
    procedure cbB_RANGO_PLA_CREExit(Sender: TObject);
    procedure cbB_RANGO_PLA_DISPExit(Sender: TObject);
    procedure cbB_RANGO_IMP_CREClick(Sender: TObject);
    procedure cbB_RANGO_IMP_DISPClick(Sender: TObject);
    procedure cbB_RANGO_PLA_CREClick(Sender: TObject);
    procedure cbB_RANGO_PLA_DISPClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure cbB_CALI_ACRE_DISPExit(Sender: TObject);
    procedure chB_FINANC_ADICExit(Sender: TObject);
    procedure chB_CONSULTA_CAPExit(Sender: TObject);
    procedure chB_CONSULTA_INTExit(Sender: TObject);
    procedure chB_CONSULTA_COMExit(Sender: TObject);
    procedure chB_CONSULTA_DOCExit(Sender: TObject);
    procedure chB_CONSULTA_FINExit(Sender: TObject);
    procedure chB_DIAS_ADIC_PAGOExit(Sender: TObject);
    procedure chB_FINANC_ADICClick(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure chB_INDICA_TASA_AUExit(Sender: TObject);
    procedure chB_MOD_TASA_REF_DExit(Sender: TObject);
    procedure chB_MOD_STASA_DExit(Sender: TObject);
    procedure chB_MOD_OP_STASA_DExit(Sender: TObject);
    procedure btEMPRESAClick(Sender: TObject);
    procedure ilEMPRESAEjecuta(Sender: TObject);
    procedure btEMPRESAExit(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure ilPRODUCTO_GPOEjecuta(Sender: TObject);
    procedure edCVE_PRODUCTO_GPOExit(Sender: TObject);
    procedure btCVE_TIPO_CRED_BCClick(Sender: TObject);
    procedure ilCVE_TIPO_CRED_BCEjecuta(Sender: TObject);
    procedure edCVE_TIPO_CRED_BCExit(Sender: TObject);
    procedure ilPRODUCTO_GPOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCAT_MINIMOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCLAS_LEGALCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_TIPO_CRED_BCCapture(Sender: TObject; var Show: Boolean);
    procedure ilEMPRESACapture(Sender: TObject; var Show: Boolean);
    procedure chB_GENERA_CONTAExit(Sender: TObject);
    procedure chB_APL_CONVE_MODExit(Sender: TObject);
    procedure chB_APL_EVEN_ACELExit(Sender: TObject);
    procedure chB_APL_PRORROGAExit(Sender: TObject);
    procedure chB_APL_RENOVACIONExit(Sender: TObject);
    procedure chB_APL_REESTRUCTExit(Sender: TObject);
    procedure rgCVE_CALCULO_INTExit(Sender: TObject);
    procedure cbxCVE_TIPO_CARTERAExit(Sender: TObject);
    procedure edCVE_PR_CONTABLEExit(Sender: TObject);
    procedure edCVE_IND_ADI_CONTExit(Sender: TObject);
    procedure rgCVE_CALC_IVA_INTExit(Sender: TObject);
    procedure chB_APL_MOR_INTExit(Sender: TObject);
    procedure chB_REDONDEOExit(Sender: TObject);
    procedure edUNIDAD_REDONDEOExit(Sender: TObject);
    procedure cbxCVE_AFEC_REDONDEOExit(Sender: TObject);
    procedure edNUM_DMIN_REQ_PERExit(Sender: TObject);
    procedure edNUM_DIAS_AGR_PERExit(Sender: TObject);
    procedure chB_REDONDEOClick(Sender: TObject);
    procedure chB_AJU_IMP_U_PExit(Sender: TObject);
    procedure btCVE_GEN_TIP_PAGClick(Sender: TObject);
    procedure edCVE_GEN_TIP_PAGExit(Sender: TObject);
    procedure btCVE_GEN_TIP_PAGExit(Sender: TObject);
    procedure ilCVE_GEN_TIP_PAGCapture(Sender: TObject;
      var Show: Boolean);
    procedure ilCVE_GEN_TIP_PAGEjecuta(Sender: TObject);
    procedure cbB_GENERA_EDOCTAExit(Sender: TObject);
    procedure iedDIA_GEN_EDO_CTAExit(Sender: TObject);
    procedure cbB_GENERA_EDOCTAClick(Sender: TObject);
    procedure chB_GEN_CONT_CCExit(Sender: TObject);
    procedure chB_GEN_CONT_PROVExit(Sender: TObject);
    procedure chB_REP_REG_CNBVExit(Sender: TObject);
    procedure chB_EXCESO_EVEExit(Sender: TObject);
    procedure rgCVE_AJUSTE_F_VTOExit(Sender: TObject);
    procedure rgCVE_VTO_COMISIONExit(Sender: TObject);
    procedure rgCVE_IMP_CALC_INTExit(Sender: TObject);
    procedure cbB_DISP_EN_LINEAExit(Sender: TObject);
    procedure IedIMP_MIN_DOCTOExit(Sender: TObject);
    procedure chB_SOBREGIROExit(Sender: TObject);
    //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
    procedure rgCVE_CAL_CAPITALExit(Sender: TObject);
    procedure rgCVE_CAL_CAPITALClick(Sender: TObject);
    procedure rgCVE_FINANC_ADICExit(Sender: TObject);
    procedure cbB_ENVIA_FEExit(Sender: TObject);
    procedure ilTASA_REFER_MCapture(Sender: TObject; var Show: Boolean);
    procedure ilTASA_REFER_MEjecuta(Sender: TObject);
    procedure rgCVE_CALCULO_MClick(Sender: TObject);
    procedure rgCVE_CALCULO_MExit(Sender: TObject);
    procedure edCVE_TASA_REFER_MExit(Sender: TObject);
    procedure btTASA_REFER_MClick(Sender: TObject);
    procedure btTASA_REFER_MExit(Sender: TObject);
    procedure cbOPERADOR_STASA_MExit(Sender: TObject);
    procedure cbOPERADOR_STASA_MKeyPress(Sender: TObject; var Key: Char);
    procedure edSOBRETASA_MExit(Sender: TObject);
    procedure chB_REESTRUCTURAExit(Sender: TObject);
    procedure chB_APL_PAG25RENExit(Sender: TObject);
    procedure chB_PLAZO_REExit(Sender: TObject);
    procedure chB_PLAZO_RSExit(Sender: TObject);
    procedure chB_LINEA_CREDITOExit(Sender: TObject);
    procedure bbtnBitProdClick(Sender: TObject);
    //--END
    private
    { Private declarations }
    public
    { Public declarations }
    vgRevolvente : String;
    Objeto : TCrProduct;

    procedure ActivaControlesRedondeo(peBActiva : Boolean);
    procedure MuestraMsgMonedas;
    function  Monedas_a_Configurar_Horarios(var peCVE_MONEDA : Integer; var peCVE_TASA_REFER : String) : String;
end;
 TCrProduct= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_PRODUCTO_CRE         : TInterCampo;
        CVE_CLAS_CONTAB          : TInterCampo;
        CVE_CLAS_LEGAL           : TInterCampo;
        B_PER_FISICA             : TInterCampo;
        B_PER_MORAL              : TInterCampo;
        B_GARANTIA               : TInterCampo;
        DESC_C_PRODUCTO          : TInterCampo;
        DESC_L_PRODUCTO          : TInterCampo;
        NUM_DIAS_MAX_TOL         : TInterCampo;
        IMP_MAX_AUT_CRE          : TInterCampo;
        IMP_MIN_AUT_CRE          : TInterCampo;
        IMP_MAX_AUT_DIS          : TInterCampo;
        IMP_MIN_AUT_DIS          : TInterCampo;
        PLAZO_MAX_CREDITO        : TInterCampo;
        PLAZO_MIN_CREDITO        : TInterCampo;
        PLAZO_MAX_DISP           : TInterCampo;
        PLAZO_MIN_DISP           : TInterCampo;
        B_PLAZO_CREDITO          : TInterCampo;
        B_MOD_TASA_REFER         : TInterCampo;
        B_MOD_OPER_STASA         : TInterCampo;
        B_MOD_SOBRETASA          : TInterCampo;
        B_APLICA_IVA             : TInterCampo;
        SIT_PRODUCTO             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        B_COB_ORD_PER            : TInterCampo;
        B_COB_ORD_ACC            : TInterCampo;
        B_COB_TOT_PER            : TInterCampo;
        B_COB_PARCIAL            : TInterCampo;
        CVE_REVOLVENCIA          : TInterCampo;
        B_RANGO_IMP_CRE          : TInterCampo;
        B_RANGO_IMP_DISP         : TInterCampo;
        B_RANGO_PLA_CRE          : TInterCampo;
        B_RANGO_PLA_DISP         : TInterCampo;
        B_CALI_ACRE_DISP         : TInterCampo;
        CVE_IMP_CALC_INT         : TInterCampo;
        CVE_PRESUPUESTO          : TInterCampo;
        B_GENERA_CONTA           : TInterCampo;
        B_CONSULTA_CAP           : TInterCampo;
        B_CONSULTA_INT           : TInterCampo;
        B_CONSULTA_COM           : TInterCampo;
        B_CONSULTA_DOC           : TInterCampo;
        B_CONSULTA_FIN           : TInterCampo;
        B_FINANC_ADIC            : TInterCampo;
        B_DIAS_ADIC_PAGO         : TInterCampo;
        B_INDICA_TASA_AU         : TInterCampo;
        B_MOD_OP_STASA_D         : TInterCampo;
        B_MOD_STASA_D            : TInterCampo;
        B_MOD_TASA_BASE          : TInterCampo;
        B_MOD_TASA_BAS_D         : TInterCampo;
        B_MOD_TASA_REF_D         : TInterCampo;
        ID_EMPRESA               : TInterCampo;
        CVE_CALCULO_INT          : TInterCampo;
        CVE_PRODUCTO_GPO         : TInterCampo;
        CVE_TIPO_CRED_BC         : TInterCampo;
        B_APL_PRORROGA           : TInterCampo;
        B_APL_RENOVACION         : TInterCampo;
        B_APL_REESTRUCT          : TInterCampo;
        B_APL_CONVE_MOD          : TInterCampo;
        B_APL_EVEN_ACEL          : TInterCampo;
        CVE_TIPO_CARTERA         : TInterCampo;//SASB
        CVE_PR_CONTABLE          : TInterCampo;
        CVE_IND_ADI_CONT         : TInterCampo;
        CVE_CALC_IVA_INT         : TInterCampo;
        // B_AJU_FVTO_CP            : TInterCampo;
        // B_AJU_FVTO_IN            : TInterCampo;
        // B_AJU_FVTO_CN            : TInterCampo;
        B_APL_MOR_INT            : TInterCampo;
        CVE_GEN_TIP_PAG          : TInterCampo;//SATV
        B_REDONDEO               : TInterCampo;
        UNIDAD_REDONDEO          : TInterCampo;
        CVE_AFEC_REDONDEO        : TInterCampo;
        B_AJU_IMP_U_P            : TInterCampo;
        NUM_DMIN_REQ_PER         : TInterCampo;
        NUM_DIAS_AGR_PER         : TInterCampo;
        B_GENERA_EDOCTA          : TInterCampo;
        DIA_GEN_EDO_CTA          : TInterCampo;
        B_GEN_CONT_CC            : TInterCampo;
        B_GEN_CONT_PROV          : TInterCampo;
        B_REP_REG_CNBV           : TInterCampo;
        B_EXCESO_EVE             : TInterCampo;
        {ROIM 19/01/2007 CAMBIO FACTOREJE}
        IMP_MIN_DOCTO            : TInterCampo;
        {/ROIM}

        // Inicia Modificación SATV4766 el 15May2006 Credito en Línea
        // B_INC_DEC_TEMPO          : TInterCampo; // LOLS 26 DIC 2006. SE MANTIENE LA COLUMNA B_EXCESO_EVE
        CVE_AJUSTE_F_VTO         : TInterCampo;
        B_DISP_EN_LINEA          : TInterCampo;
       // Termina Modificación SATV4766

        //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
        CVE_CAL_CAPITAL          : TInterCampo;
        //--END

        {ROIM 04/05/2007 CAMBIO CHEQUERAS SOBREGIRO}
        B_SOBREGIRO               : TInterCampo;
        {/ROIM}

        B_ENVIA_BNC              : TInterCampo; // LOLS 15 ENE 2007

        {HERJA 25/01/2010 NUEVOS TIPOS DE FINANACIAMIENTO ADICIONAL}
        CVE_FINANC_ADIC          : TInterCampo;
        B_ENVIA_FE               : TInterCampo;
        {/ROIM}

        {ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}
        CVE_TASA_REFER_M         : TInterCampo;
        CVE_CALCULO_M            : TInterCampo;
        OPERADOR_STASA_M         : TInterCampo;
        SOBRETASA_M              : TInterCampo;
        {ASTECI.HEGC}
        B_REESTRUCTURA           : TInterCampo;   //HERJA - BANDERA PARA IDENTIFICAR PROD. DE REESTRUCTURAS

        B_RE_25PCT               : TInterCampo;   //HERJA - BANDERA PARA QUE EL PAGO DEL 25 PARA RENOVACIONES
        B_PLAZO_RE               : TInterCampo;   //HERJA - BANDERA PARA VALIDAR PLAZOS EN RENOVACIONES
        B_PLAZO_RS               : TInterCampo;   //HERJA - BANDERA PARA VALIDAR PLAZOS EN REESTRUCTURAS
        B_LINEA_CREDITO          : TInterCampo;   //ROUY - BANDERA PARA IDENTIFICAR SI EL PRODUCTOS ES UNA LÍNEADE CREDITO

        ParamCre                 : TParamCre;
        CatMini                  : TCrCatMini;
        ClaLegal                 : TCrClaLeg;
        Empresa                  : TEmpresa;
        ProdGpo                  : TMProdGpo;
        TipoCred                 : TCrTCredit;
        TipoPago                 : TCrGruCla;
      {ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}
        TasaRefer_M              : TTasIndFin;
      {ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


implementation
Uses IntCrRePrMn, IntCrCalDia,
IntCrBitProd //REP BITACORA (LOG) DE CAMBIOS PRODUCTO ROUY 082014
;

{$R *.DFM}

constructor TCrProduct.Create( AOwner : TComponent );
begin Inherited;
      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,True);
                CVE_PRODUCTO_CRE.Caption:='Clave de Producto';
      CVE_CLAS_CONTAB :=CreaCampo('CVE_CLAS_CONTAB',ftString,tsNinguno,tsNinguno,True);
                CVE_CLAS_CONTAB.Caption:='Catálogo Mínimo';
      CVE_CLAS_LEGAL :=CreaCampo('CVE_CLAS_LEGAL',ftString,tsNinguno,tsNinguno,True);
                CVE_CLAS_LEGAL.Caption:='Clasificación Legal';
      B_PER_FISICA :=CreaCampo('B_PER_FISICA',ftString,tsNinguno,tsNinguno,True);
                B_PER_FISICA.Caption:='Aplica Persona Física';
      B_PER_MORAL :=CreaCampo('B_PER_MORAL',ftString,tsNinguno,tsNinguno,True);
                B_PER_MORAL.Caption:='Aplica Persona Moral';
      B_GARANTIA :=CreaCampo('B_GARANTIA',ftString,tsNinguno,tsNinguno,True);
                B_GARANTIA.Caption:='Requiere Garantía';
      DESC_C_PRODUCTO :=CreaCampo('DESC_C_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
                DESC_C_PRODUCTO.Caption:='Descripción Corta';
      DESC_L_PRODUCTO :=CreaCampo('DESC_L_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
                DESC_L_PRODUCTO.Caption:='Descripción Larga';
      NUM_DIAS_MAX_TOL :=CreaCampo('NUM_DIAS_MAX_TOL',ftFloat,tsNinguno,tsNinguno,True);
                NUM_DIAS_MAX_TOL.Caption:='Días de Tolerancia pago';
      IMP_MAX_AUT_CRE :=CreaCampo('IMP_MAX_AUT_CRE',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MAX_AUT_CRE.Caption:='Imp. Máximo Disposición';
      IMP_MIN_AUT_CRE :=CreaCampo('IMP_MIN_AUT_CRE',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MIN_AUT_CRE.Caption:='Imp. Mínimo Disposición';
      IMP_MAX_AUT_DIS :=CreaCampo('IMP_MAX_AUT_DIS',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MAX_AUT_DIS.Caption:='Imp. Máx. Disposición';
      IMP_MIN_AUT_DIS :=CreaCampo('IMP_MIN_AUT_DIS',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MIN_AUT_DIS.Caption:='Imp. Mínimo Disposición';
      PLAZO_MAX_CREDITO :=CreaCampo('PLAZO_MAX_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                PLAZO_MAX_CREDITO.Caption:='Plazo Máximo Disposición';
      PLAZO_MIN_CREDITO :=CreaCampo('PLAZO_MIN_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                PLAZO_MIN_CREDITO.Caption:='Plazo Mínimo Disposición';
      PLAZO_MAX_DISP :=CreaCampo('PLAZO_MAX_DISP',ftFloat,tsNinguno,tsNinguno,True);
                PLAZO_MAX_DISP.Caption:='Plazo Máx. Disposición';
      PLAZO_MIN_DISP :=CreaCampo('PLAZO_MIN_DISP',ftFloat,tsNinguno,tsNinguno,True);
                PLAZO_MIN_DISP.Caption:='Plazo Mínimo Disposición';
      B_PLAZO_CREDITO :=CreaCampo('B_PLAZO_CREDITO',ftString,tsNinguno,tsNinguno,True);
                B_PLAZO_CREDITO.Caption:='Permite fecha vencimiento de disposición mayor a la Disposición';
      B_MOD_TASA_REFER :=CreaCampo('B_MOD_TASA_REFER',ftString,tsNinguno,tsNinguno,True);
                B_MOD_TASA_REFER.Caption:='Modifica Tasa Referencia';
      B_MOD_OPER_STASA :=CreaCampo('B_MOD_OPER_STASA',ftString,tsNinguno,tsNinguno,True);
                B_MOD_OPER_STASA.Caption:='Mod Operación Stasa';
      B_MOD_SOBRETASA :=CreaCampo('B_MOD_SOBRETASA',ftString,tsNinguno,tsNinguno,True);
                B_MOD_SOBRETASA.Caption:='Mod Sobretasa';
      B_APLICA_IVA :=CreaCampo('B_APLICA_IVA',ftString,tsNinguno,tsNinguno,True);
                B_APLICA_IVA.Caption:='Aplica Iva';
      SIT_PRODUCTO :=CreaCampo('SIT_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
         With SIT_PRODUCTO do
         Begin  Size := 2;
                UseCombo := True;
                ComboLista.Add('0'); ComboDatos.Add('AC');
                ComboLista.Add('1'); ComboDatos.Add('CA');
         end;
                SIT_PRODUCTO.Caption:='Situación Producto';
      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      B_COB_ORD_PER :=CreaCampo('B_COB_ORD_PER',ftString,tsNinguno,tsNinguno,True);
                B_COB_ORD_PER.Caption:='Aplica Cobrar por Orden Periodo';
      B_COB_ORD_ACC:=CreaCampo('B_COB_ORD_ACC',ftString,tsNinguno,tsNinguno,True);
                B_COB_ORD_ACC.Caption:='Aplica Cobrar por Orden de Prelación';
      B_COB_TOT_PER:=CreaCampo('B_COB_TOT_PER',ftString,tsNinguno,tsNinguno,True);
                B_COB_TOT_PER.Caption:='Aplica Cobrar Todo';
      B_COB_PARCIAL:=CreaCampo('B_COB_PARCIAL',ftString,tsNinguno,tsNinguno,True);
                B_COB_PARCIAL.Caption:='Aplica Cobro Parcial';
    {ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}
     CVE_CALCULO_M:=CreaCampo('CVE_CALCULO_M',ftString,tsNinguno,tsNinguno,True);
     With CVE_CALCULO_M do
     Begin  Size := 2;
            UseCombo := True;
            ComboLista.Add('0'); ComboDatos.Add(C_PA);
            ComboLista.Add('1'); ComboDatos.Add(C_FIJA);
     end;
            CVE_CALCULO_M.Caption:='Clave Tipo Calculo de Moras';

      CVE_TASA_REFER_M :=CreaCampo('CVE_TASA_REFER_M',ftString,tsNinguno,tsNinguno,True);
      CVE_TASA_REFER_M.Caption:='Tasa de Referencia Moras';

      OPERADOR_STASA_M :=CreaCampo('OPERADOR_STASA_M',ftString,tsNinguno,tsNinguno,True);
                OPERADOR_STASA_M.Caption:='Operador Stasa M';
      SOBRETASA_M :=CreaCampo('SOBRETASA_M',ftFloat,tsNinguno,tsNinguno,True);
                SOBRETASA_M.Caption:='Sobretasa M';
      {ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}

      CVE_REVOLVENCIA:=CreaCampo('CVE_REVOLVENCIA',ftString,tsNinguno,tsNinguno,True);
         With CVE_REVOLVENCIA do
         Begin  Size := 2;
                UseCombo := True;
                ComboLista.Add('0'); ComboDatos.Add(CSIT_RE);
                ComboLista.Add('1'); ComboDatos.Add(C_NR);
                ComboLista.Add('2'); ComboDatos.Add(C_AMBOS);
         end;
                CVE_REVOLVENCIA.Caption:='Clave Tipo Revolvencia';
      B_RANGO_IMP_CRE:=CreaCampo('B_RANGO_IMP_CRE',ftString,tsNinguno,tsNinguno,True);
                B_RANGO_IMP_CRE.Caption:='Aplica Rango Importe Credito';
      B_RANGO_IMP_DISP:=CreaCampo('B_RANGO_IMP_DISP',ftString,tsNinguno,tsNinguno,True);
                B_RANGO_IMP_DISP.Caption:='Aplica Rango Importe Disposición';
      B_RANGO_PLA_CRE:=CreaCampo('B_RANGO_PLA_CRE',ftString,tsNinguno,tsNinguno,True);
                B_RANGO_PLA_CRE.Caption:='Aplica Rango Plazo Credito';
      B_RANGO_PLA_DISP:=CreaCampo('B_RANGO_PLA_DISP',ftString,tsNinguno,tsNinguno,True);
                B_RANGO_PLA_DISP.Caption:='Aplica Rango Plazo Disposición';
      B_CALI_ACRE_DISP:=CreaCampo('B_CALI_ACRE_DISP',ftString,tsNinguno,tsNinguno,True);
                B_CALI_ACRE_DISP.Caption:='Aplica Calificación a la Disposición';
      CVE_IMP_CALC_INT :=CreaCampo('CVE_IMP_CALC_INT',ftString,tsNinguno,tsNinguno,True);
         With CVE_IMP_CALC_INT do
         Begin  Size := 2;
                UseCombo := True;
                ComboLista.Add('0'); ComboDatos.Add(C_CAPITAL );
                ComboLista.Add('1'); ComboDatos.Add(C_VIGENTE);
                ComboLista.Add('2'); ComboDatos.Add(C_CREDITO);
         end;
                CVE_IMP_CALC_INT.Caption:='Cve. Imp. Calc. Interes';
      CVE_PRESUPUESTO  :=CreaCampo('CVE_PRESUPUESTO',ftString,tsNinguno,tsNinguno,True);
                CVE_PRESUPUESTO.Caption:='Calve Presupuesto';
      B_GENERA_CONTA :=CreaCampo('B_GENERA_CONTA',ftString,tsNinguno,tsNinguno,True);
                B_GENERA_CONTA.Caption:='Aplica genera contabilidad';
      B_CONSULTA_CAP :=CreaCampo('B_CONSULTA_CAP',ftString,tsNinguno,tsNinguno,True);
                B_CONSULTA_CAP.Caption:='Aplica consulta capital';
      B_CONSULTA_INT :=CreaCampo('B_CONSULTA_INT',ftString,tsNinguno,tsNinguno,True);
                B_CONSULTA_INT.Caption:='Aplica consulta interes';
      B_CONSULTA_COM :=CreaCampo('B_CONSULTA_COM',ftString,tsNinguno,tsNinguno,True);
                B_CONSULTA_COM.Caption:='Aplica consulta comisión';
      B_CONSULTA_DOC :=CreaCampo('B_CONSULTA_DOC',ftString,tsNinguno,tsNinguno,True);
                B_CONSULTA_DOC.Caption:='Aplica consulta documentos';
      B_CONSULTA_FIN :=CreaCampo('B_CONSULTA_FIN',ftString,tsNinguno,tsNinguno,True);
                B_CONSULTA_FIN.Caption:='Aplica consulta financiamiento';
      B_FINANC_ADIC :=CreaCampo('B_FINANC_ADIC',ftString,tsNinguno,tsNinguno,True);
                B_FINANC_ADIC.Caption:='Aplica financ. adic.';
      B_DIAS_ADIC_PAGO :=CreaCampo('B_DIAS_ADIC_PAGO',ftString,tsNinguno,tsNinguno,True);
                B_DIAS_ADIC_PAGO.Caption:='Aplica días adic. pago';
      B_INDICA_TASA_AU :=CreaCampo('B_INDICA_TASA_AU',ftString,tsNinguno,tsNinguno,True);
                B_INDICA_TASA_AU.Caption:='Aplica Autorización';
      B_MOD_TASA_BASE :=CreaCampo('B_MOD_TASA_BASE',ftString,tsNinguno,tsNinguno,True);
                B_MOD_TASA_BASE.Caption:='Aplica Mod. Tasa Base';
      B_MOD_TASA_REF_D :=CreaCampo('B_MOD_TASA_REF_D',ftString,tsNinguno,tsNinguno,True);
                B_MOD_TASA_REF_D.Caption:='Aplica Mod. Tasa Refer';
      B_MOD_OP_STASA_D :=CreaCampo('B_MOD_OP_STASA_D',ftString,tsNinguno,tsNinguno,True);
                B_MOD_OP_STASA_D.Caption:='Aplica Mod. Oper. STasa';
      B_MOD_STASA_D :=CreaCampo('B_MOD_STASA_D',ftString,tsNinguno,tsNinguno,True);
                B_MOD_STASA_D.Caption:='Aplica Mod. STasa';
      B_MOD_TASA_BAS_D :=CreaCampo('B_MOD_TASA_BAS_D',ftString,tsNinguno,tsNinguno,True);
                B_MOD_TASA_BAS_D.Caption:='Aplica Tasa Base Disp';
      ID_EMPRESA  :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
                ID_EMPRESA.Caption:='No. Empresa';
      CVE_CALCULO_INT :=CreaCampo('CVE_CALCULO_INT',ftString,tsNinguno,tsNinguno,True);
         With CVE_CALCULO_INT do
         Begin  Size := 2;
                UseCombo := True;
                ComboLista.Add('0'); ComboDatos.Add(C_X_DIA );
                ComboLista.Add('1'); ComboDatos.Add(C_LINEAL);
         end;
                CVE_CALCULO_INT.Caption:='Cal. Interés';

      //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
      CVE_CAL_CAPITAL :=CreaCampo('CVE_CAL_CAPITAL',ftString,tsNinguno,tsNinguno,True);
         With CVE_CAL_CAPITAL do
         Begin  Size := 3;
                UseCombo := True;
                ComboLista.Add('0'); ComboDatos.Add(C_TRADICIONAL);
                ComboLista.Add('1'); ComboDatos.Add(C_VPN);
         end;
                CVE_CAL_CAPITAL.Caption:='Cálculo Cap.';
      //--END

      CVE_PRODUCTO_GPO :=CreaCampo('CVE_PRODUCTO_GPO',ftString,tsNinguno,tsNinguno,True);
                CVE_PRODUCTO_GPO.Caption:='No. Empresa';
      CVE_TIPO_CRED_BC :=CreaCampo('CVE_TIPO_CRED_BC',ftFloat,tsNinguno,tsNinguno,True);
                CVE_TIPO_CRED_BC.Caption:='Tipo Cuenta';
      B_APL_PRORROGA :=CreaCampo('B_APL_PRORROGA',ftString,tsNinguno,tsNinguno,True);
                B_APL_PRORROGA.Caption:='Aplica Prorrogas';
      B_APL_RENOVACION :=CreaCampo('B_APL_RENOVACION',ftString,tsNinguno,tsNinguno,True);
                B_APL_RENOVACION.Caption:='Aplica Renovación';
      B_APL_REESTRUCT :=CreaCampo('B_APL_REESTRUCT',ftString,tsNinguno,tsNinguno,True);
                B_APL_REESTRUCT.Caption:='Aplica Reestruccturación';
      B_APL_CONVE_MOD :=CreaCampo('B_APL_CONVE_MOD',ftString,tsNinguno,tsNinguno,True);
                B_APL_CONVE_MOD.Caption:='Apl. Conveio Modif.';
      B_APL_EVEN_ACEL :=CreaCampo('B_APL_EVEN_ACEL',ftString,tsNinguno,tsNinguno,True);
                B_APL_EVEN_ACEL.Caption:='Apl. Evento Aceleracion';
      CVE_TIPO_CARTERA :=CreaCampo('CVE_TIPO_CARTERA',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_CARTERA.Caption:='Tipo de Cartera';

      CVE_PR_CONTABLE  := CreaCampo('CVE_PR_CONTABLE',  ftString,  tsNinguno,  tsNinguno,  True );
      CVE_IND_ADI_CONT := CreaCampo('CVE_IND_ADI_CONT', ftString,  tsNinguno,  tsNinguno,  True );
      CVE_CALC_IVA_INT :=CreaCampo('CVE_CALC_IVA_INT',ftString,tsNinguno,tsNinguno,True);
         With CVE_CALC_IVA_INT do
         Begin  Size := 2;
                UseCombo := True;
                ComboLista.Add('0'); ComboDatos.Add(C_UDISADO);
                ComboLista.Add('1'); ComboDatos.Add(C_PORCENT);
                ComboLista.Add('2'); ComboDatos.Add(CSIT_NA);
         end;
                CVE_CALC_IVA_INT.Caption:='Cve. Imp. IVA Interes';

{      B_AJU_FVTO_CP:=CreaCampo('B_AJU_FVTO_CP',ftString,tsNinguno,tsNinguno,True);
                B_AJU_FVTO_CP.Caption:='Ajusta F Vto CP';
      B_AJU_FVTO_IN:=CreaCampo('B_AJU_FVTO_IN',ftString,tsNinguno,tsNinguno,True);
                B_AJU_FVTO_IN.Caption:='Ajusta F Vto IN';
      B_AJU_FVTO_CN:=CreaCampo('B_AJU_FVTO_CN',ftString,tsNinguno,tsNinguno,True);
                B_AJU_FVTO_CN.Caption:='Ajusta F Vto CN';
}
      B_APL_MOR_INT:=CreaCampo('B_APL_MOR_INT',ftString,tsNinguno,tsNinguno,True);
                B_APL_MOR_INT.Caption:='Apl. Moras en Interés';
      CVE_GEN_TIP_PAG:=CreaCampo('CVE_GEN_TIP_PAG',ftString,tsNinguno,tsNinguno,True);
                CVE_GEN_TIP_PAG.Caption:='Tipo de Método a Utilizar';
      B_REDONDEO:=CreaCampo('B_REDONDEO',ftString,tsNinguno,tsNinguno,True);
                B_REDONDEO.Caption:='Aplica o no Redondeo';
      UNIDAD_REDONDEO:=CreaCampo('UNIDAD_REDONDEO',ftFloat,tsNinguno,tsNinguno,True);
                UNIDAD_REDONDEO.Caption:='Número siguiente a aproximar el redondeo';
      CVE_AFEC_REDONDEO:=CreaCampo('CVE_AFEC_REDONDEO',ftString,tsNinguno,tsNinguno,True);
                CVE_AFEC_REDONDEO.Caption:='Dirección del Redondeo';
         With CVE_AFEC_REDONDEO do
         Begin  Size := 2;
                UseCombo := True;
                ComboLista.Add('A Favor Banco'); ComboDatos.Add(C_FAVOR_BANCO);
                ComboLista.Add('A Favor Cliente'); ComboDatos.Add(C_FAVOR_CLIENTE);
                ComboLista.Add('No Aplica'); ComboDatos.Add(C_NO_APLICA);
         end;
      B_AJU_IMP_U_P:=CreaCampo('B_AJU_IMP_U_P',ftString,tsNinguno,tsNinguno,True);
                B_AJU_IMP_U_P.Caption:='Ajuste en el último Periodo (Sólo Aplica para el metódo de Pagos Nivelados)';
      NUM_DMIN_REQ_PER:=CreaCampo('NUM_DMIN_REQ_PER',ftFloat,tsNinguno,tsNinguno,True);
                NUM_DMIN_REQ_PER.Caption:='Número de días mínimo requerido por el periodo';
      NUM_DIAS_AGR_PER:=CreaCampo('NUM_DIAS_AGR_PER',ftFloat,tsNinguno,tsNinguno,True);
                NUM_DIAS_AGR_PER.Caption:='Días a agregar a la Fecha de Vencimiento';
      B_GENERA_EDOCTA :=CreaCampo('B_GENERA_EDOCTA',ftString,tsNinguno,tsNinguno,True);
                B_GENERA_EDOCTA.Caption:='Genera Edo. de cuenta';
      DIA_GEN_EDO_CTA :=CreaCampo('DIA_GEN_EDO_CTA',ftFloat,tsNinguno,tsNinguno,True);
                DIA_GEN_EDO_CTA.Caption:='Dia en el que se genera el Edo de cuenta.';
      B_GEN_CONT_CC :=CreaCampo('B_GEN_CONT_CC',ftString,tsNinguno,tsNinguno,True);
                B_GEN_CONT_CC.Caption:='Genera Conta Centro de Costos';
      B_GEN_CONT_PROV :=CreaCampo('B_GEN_CONT_PROV',ftString,tsNinguno,tsNinguno,True);
                B_GEN_CONT_PROV.Caption:='Genera Conta Centro de Costos';
      B_REP_REG_CNBV :=CreaCampo('B_REP_REG_CNBV',ftString,tsNinguno,tsNinguno,True);
                B_REP_REG_CNBV.Caption:='Genera Reportes Regulatorios';
      B_EXCESO_EVE :=CreaCampo('B_EXCESO_EVE',ftString,tsNinguno,tsNinguno,True);
                B_EXCESO_EVE.Caption:='Permite Excesos';

      // Inicia Modificación SATV4766 el 15May2006 Credito en Línea
        //LOLS 26 DIC 2006. SE MANTIENE LA COLUMNA B_EXCESO_EVE
        //B_INC_DEC_TEMPO := CreaCampo('B_INC_DEC_TEMPO',ftString,tsNinguno,tsNinguno,True);
        //       B_INC_DEC_TEMPO.Caption:='Incremento / Decrementos  de Temporada';

      CVE_AJUSTE_F_VTO := CreaCampo('CVE_AJUSTE_F_VTO',ftString,tsNinguno,tsNinguno,True);
             CVE_AJUSTE_F_VTO.Caption:='Clave de Ajuste de Vencimiento';
             With CVE_AJUSTE_F_VTO do
             Begin  Size := 3;
                    UseCombo := True;
                    ComboLista.Add('0'); ComboDatos.Add(C_ANTICIPADO_HABIL);
                    ComboLista.Add('1'); ComboDatos.Add(C_POSTERIOR_HABIL);
                    ComboLista.Add('2'); ComboDatos.Add(C_MISMO_DIA);
             end;

      B_DISP_EN_LINEA := CreaCampo('B_DISP_EN_LINEA',ftString,tsNinguno,tsNinguno,True);
             B_DISP_EN_LINEA.Caption:='Días Antipación Aviso de Disposición';
      // Termina Modificación SATV4766

      {ROIM 04/05/2007 CAMBIO CHEQUERAS SOBREGIRO}
      B_SOBREGIRO := CreaCampo('B_SOBREGIRO',ftString,tsNinguno,tsNinguno,True);
             B_SOBREGIRO.Caption:='Permite Sibregiro en Chequeras';
      {/ROIM}

      // LOLS 15 ENE 2007. ENVIO A BURO DE CREDITO
      B_ENVIA_BNC  := CreaCampo( 'B_ENVIA_BNC',  ftString, tsNinguno, tsNinguno, True );
      B_ENVIA_BNC.Caption := 'Envío a buro de crédito';
      // ENDS LOLS 15 ENE 2007

      {ROIM 19/01/2007 CAMBIO FACTOREJE}
      IMP_MIN_DOCTO :=CreaCampo('IMP_MIN_DOCTO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MIN_DOCTO.Caption:='Importe Mínimo de Documento';
      {/ROIM}


      //---BEGIN   HERJA - TIPOS DE FINANCIAMIENTO ADICIONAL
      CVE_FINANC_ADIC :=CreaCampo('CVE_FINANC_ADIC',ftString,tsNinguno,tsNinguno,True);
         With CVE_FINANC_ADIC do
         Begin  Size := 3;
                UseCombo := True;
                ComboLista.Add('0'); ComboDatos.Add(C_DIRECTO);
                ComboLista.Add('1'); ComboDatos.Add(C_PRORRATEO);
         end;
                CVE_FINANC_ADIC.Caption:='Tipo de Financiamiento Adicional';

      B_ENVIA_FE:=CreaCampo('B_ENVIA_FE',ftString,tsNinguno,tsNinguno,True);
                B_ENVIA_FE.Caption:='Envia Factura Electronica.........................................................';
      //--END

      B_REESTRUCTURA :=CreaCampo('B_REESTRUCTURA',ftString,tsNinguno,tsNinguno,True);
                B_REESTRUCTURA.Caption:='Producto de Reestructura';

      B_RE_25PCT :=CreaCampo('B_RE_25PCT',ftString,tsNinguno,tsNinguno,True);
                B_RE_25PCT.Caption:='Pago del 25% para Renovacion';
      B_PLAZO_RE :=CreaCampo('B_PLAZO_RE',ftString,tsNinguno,tsNinguno,True);
                B_PLAZO_RE.Caption:='Valida Plazo de Renovaciones';
      B_PLAZO_RS :=CreaCampo('B_PLAZO_RS',ftString,tsNinguno,tsNinguno,True);
                B_PLAZO_RS.Caption:='Valida Plazo de Reestructuras';

      B_LINEA_CREDITO :=CreaCampo('B_LINEA_CREDITO',ftString,tsNinguno,tsNinguno,True);
                B_LINEA_CREDITO.Caption:='Línea de Crédito';

      FKeyFields.Add('CVE_PRODUCTO_CRE');

      TableName := 'CR_PRODUCTO';
      UseQuery := True;
      HelpFile := 'IntCrProduct.Hlp';
      ShowMenuReporte:=True;

      {$WARNINGS OFF}
      CatMini := TCrCatMini.Create(Self);
      {$WARNINGS ON}
      CatMini.MasterSource:=Self;
      CatMini.FieldByName('CVE_CAT_MINIMO').MasterField:='CVE_CLAS_CONTAB';

      {$WARNINGS OFF}
      ClaLegal := TCrClaLeg.Create(Self);
      {$WARNINGS ON}
      ClaLegal.MasterSource:=Self;
      ClaLegal.FieldByName('CVE_CLAS_LEGAL').MasterField:='CVE_CLAS_LEGAL';

      {$WARNINGS OFF}
      Empresa := TEmpresa.Create(Self);
      {$WARNINGS ON}      
      Empresa.MasterSource:=Self;
      Empresa.FieldByName('ID_EMPRESA').MasterField:='ID_EMPRESA';

      {$WARNINGS OFF}
      ProdGpo := TMProdGpo.Create(Self);
      {$WARNINGS ON}      
      ProdGpo.MasterSource:=Self;
      ProdGpo.FieldByName('CVE_PRODUCTO_GPO').MasterField:='CVE_PRODUCTO_GPO';

      {$WARNINGS OFF}
      TipoCred := TCrTCredit.Create(Self);
      {$WARNINGS ON}      
      TipoCred.MasterSource:=Self;
      TipoCred.FieldByName('CVE_TIPO_CRED_BC').MasterField:='CVE_TIPO_CRED_BC';

      {$WARNINGS OFF}
      TipoPago := TCrGruCla.Create(Self);
      {$WARNINGS ON}      
      TipoPago.MasterSource:=Self;
      TipoPago.FieldByName('CVE_REFERENCIA').MasterField:='CVE_GEN_TIP_PAG';
      TipoPago.BuscaWhereString := ' CVE_GRUPO_CLAVE = '+SQlStr(C_GRUPO_CLAVE_TIPPAG);
      TipoPago.ShowAll := True;
    {ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}
      TasaRefer_M := TTasIndFin.Create(Self);
      TasaRefer_M.MasterSource:=Self;
      TasaRefer_M.FieldByName('CVE_TASA_INDICAD').MasterField:='CVE_TASA_REFER_M';
      TasaRefer_M.BuscaWhereString := 'TASA_INDIC_FINAN.B_TASA_CREDITO =' + #39 + 'V'+ #39;
      TasaRefer_M.FilterString := TasaRefer_M.BuscaWhereString;
    {ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}
end;

Destructor TCrProduct.Destroy;
begin
      if CatMini <> nil then
         CatMini.Free;
      //end if
      if ClaLegal <> nil then
         ClaLegal.Free;
      //end if
      if Empresa  <> nil then
         Empresa.Free;
      //end if
      if ProdGpo <> nil then
         ProdGpo.Free;
      //end if
      if TipoCred <> nil then
         TipoCred.Free;
      //end if
      if TipoPago <> nil then
         TipoPago.Free;
      //end if
{ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}
    if TasaRefer_M <> nil then
       TasaRefer_M.Free;
   //end if
{ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}
      inherited;
end;


function TCrProduct.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrProducto;
begin
   W:=TWCrProducto.Create(Self);
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

Function TCrProduct.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrProd.it','S');
      Try if Active then begin T.Param(0,CVE_PRODUCTO_CRE.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;


(***********************************************FORMA CR_PRODUCTO********************)
(*                                                                              *)
(*  FORMA DE CR_PRODUCTO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_PRODUCTO********************)
Procedure TWCrProducto.MuestraHints;
Begin
      edDESC_C_PRODUCTO.Hint := Objeto.DESC_C_PRODUCTO.AsString;
      edDESC_C_PRODUCTO.ShowHint := True;
      edDESC_L_PRODUCTO.Hint := Objeto.DESC_L_PRODUCTO.AsString;
      edDESC_L_PRODUCTO.ShowHint := True;
      edDESC_CLAS_CONTAB.Hint := Objeto.CatMini.DESC_CAT_MINIMO.AsString;
      edDESC_CLAS_CONTAB.ShowHint := True;
      edDESC_CLAS_LEGAL.Hint := Objeto.ClaLegal.DESC_CLAS_LEGAL.AsString;
      edDESC_CLAS_LEGAL.ShowHint := True;
      edDESC_L_PROD_GPO.Hint := Objeto.ProdGpo.DESC_L_PROD_GPO.AsString;
      edDESC_L_PROD_GPO.ShowHint := True;
      edDESC_TIPO_CRED.Hint := Objeto.TipoCred.DESC_TIPO_CRED.AsString;
      edDESC_TIPO_CRED.ShowHint := True;
      Objeto.TipoPago.FindKey([C_GRUPO_CLAVE_TIPPAG, Objeto.CVE_GEN_TIP_PAG.AsString]);
      edDESC_GEN_TIP_PAG.Hint := Objeto.TipoPago.VALOR.AsString;
      edDESC_GEN_TIP_PAG.ShowHint := True;
{ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}
      edDESC_TASA_REFER_M.Hint := Objeto.TasaRefer_M.DESC_TASA_INDIC.AsString;
      edDESC_TASA_REFER_M.ShowHint := True;
{ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}
End;

//Llama la ventana para convertir meses o años a Dias
Function TWCrProducto.VentanaCalculo(pDato : String): string;
var   CalDia : TCrCalDia;
      vlDias : String;
begin
   vlDias := pDato;
   CalDia := TCrCalDia.Create(Self);
   Try
      if CalDia.ShowModal = mrOk then
         if CalDia.edDIAS.Text <>'' then vlDias := CalDia.edDIAS.Text;
      //end if
   finally
      CalDia.Free;
   end;
   VentanaCalculo := vlDias;
end;

procedure TWCrProducto.FormShow(Sender: TObject);
Var
   sSQL: String;
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_PRODUCTO_CRE.Control:=edCVE_PRODUCTO_CRE;
      Objeto.CVE_CLAS_CONTAB.Control:=edCVE_CLAS_CONTAB;
      Objeto.CVE_CLAS_LEGAL.Control:=edCVE_CLAS_LEGAL;
      Objeto.B_PER_FISICA.Control:=chB_PER_FISICA;
      Objeto.B_PER_MORAL.Control:=chB_PER_MORAL;
      Objeto.B_GARANTIA.Control:=chB_GARANTIA;
      Objeto.DESC_C_PRODUCTO.Control:=edDESC_C_PRODUCTO;
      Objeto.DESC_L_PRODUCTO.Control:=edDESC_L_PRODUCTO;
      Objeto.IMP_MAX_AUT_CRE.Control:=IedIMP_MAX_AUT_CRE;
      Objeto.IMP_MIN_AUT_CRE.Control:=IedIMP_MIN_AUT_CRE;
      Objeto.IMP_MAX_AUT_DIS.Control:=IedIMP_MAX_AUT_DIS;
      Objeto.IMP_MIN_AUT_DIS.Control:=IedIMP_MIN_AUT_DIS;
      Objeto.PLAZO_MAX_CREDITO.Control:=IedPLAZO_MAX_CREDITO;
      Objeto.PLAZO_MIN_CREDITO.Control:=IedPLAZO_MIN_CREDITO;
      Objeto.PLAZO_MAX_DISP.Control:=IedPLAZO_MAX_DISP;
      Objeto.PLAZO_MIN_DISP.Control:=IedPLAZO_MIN_DISP;
      Objeto.B_PLAZO_CREDITO.Control:=chB_PLAZO_CREDITO;
      Objeto.B_MOD_TASA_REFER.Control:=chB_MOD_TASA_REFER;
      Objeto.B_MOD_OPER_STASA.Control:=chB_MOD_OPER_STASA;
      Objeto.B_MOD_SOBRETASA.Control:=chB_MOD_SOBRETASA;
      Objeto.B_APLICA_IVA.Control:=chB_APLICA_IVA;
      Objeto.SIT_PRODUCTO.Control:=rgSIT_PRODUCTO;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control:=edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;
      Objeto.B_COB_ORD_PER.Control := cbB_COB_ORD_PER;
      Objeto.B_COB_ORD_ACC.Control := cbB_COB_ORD_ACC;
      Objeto.B_COB_TOT_PER.Control := cbB_COB_TOT_PER;
      Objeto.B_COB_PARCIAL.Control := cbB_COB_PARCIAL;
      Objeto.CVE_REVOLVENCIA.Control := rgCVE_REVOLVENCIA;
      Objeto.B_RANGO_IMP_CRE.Control := cbB_RANGO_IMP_CRE;
      Objeto.B_RANGO_IMP_DISP.Control := cbB_RANGO_IMP_DISP;
      Objeto.B_RANGO_PLA_CRE.Control := cbB_RANGO_PLA_CRE;
      Objeto.B_RANGO_PLA_DISP.Control := cbB_RANGO_PLA_DISP;
      Objeto.B_CALI_ACRE_DISP.Control := cbB_CALI_ACRE_DISP;
      Objeto.CVE_IMP_CALC_INT.Control := rgCVE_IMP_CALC_INT;
      Objeto.CVE_CALCULO_INT.Control := rgCVE_CALCULO_INT;
      Objeto.B_CONSULTA_CAP.Control := chB_CONSULTA_CAP;
      Objeto.B_CONSULTA_INT.Control := chB_CONSULTA_INT;
      Objeto.B_CONSULTA_COM.Control := chB_CONSULTA_COM;
      Objeto.B_CONSULTA_DOC.Control := chB_CONSULTA_DOC;
      Objeto.B_CONSULTA_FIN.Control := chB_CONSULTA_FIN;
      Objeto.B_FINANC_ADIC.Control := chB_FINANC_ADIC;
      Objeto.B_DIAS_ADIC_PAGO.Control := chB_DIAS_ADIC_PAGO;
      Objeto.B_INDICA_TASA_AU.Control := chB_INDICA_TASA_AU;
      Objeto.B_MOD_TASA_REF_D.Control := chB_MOD_TASA_REF_D;
      Objeto.B_MOD_OP_STASA_D.Control := chB_MOD_OP_STASA_D;
      Objeto.B_MOD_STASA_D.Control := chB_MOD_STASA_D;
      Objeto.ID_EMPRESA.Control := edID_EMPRESA;
      Objeto.CVE_PRODUCTO_GPO.Control := edCVE_PRODUCTO_GPO;
      Objeto.CVE_TIPO_CRED_BC.Control := edCVE_TIPO_CRED_BC;
      Objeto.B_APL_PRORROGA.Control := chB_APL_PRORROGA;
      Objeto.B_APL_RENOVACION.Control := chB_APL_RENOVACION;
      Objeto.B_APL_REESTRUCT.Control := chB_APL_REESTRUCT;
      Objeto.B_APL_CONVE_MOD.Control := chB_APL_CONVE_MOD;
      Objeto.B_APL_EVEN_ACEL.Control := chB_APL_EVEN_ACEL;
      Objeto.CVE_TIPO_CARTERA.Control:= cbxCVE_TIPO_CARTERA;
      Objeto.CVE_PR_CONTABLE.Control := edCVE_PR_CONTABLE;
      Objeto.CVE_IND_ADI_CONT.Control:= edCVE_IND_ADI_CONT;
      Objeto.CVE_CALC_IVA_INT.Control := rgCVE_CALC_IVA_INT;
      // Objeto.B_AJU_FVTO_CP.Control := chB_AJU_FVTO_CP;  // F. Vto hábil Sig Cap.
      // Objeto.B_AJU_FVTO_IN.Control := chB_AJU_FVTO_IN;  // F. Vto hábil Sig Int.
      // Objeto.B_AJU_FVTO_CN.Control := chB_AJU_FVTO_CN;  // F. Vto hábil Sig Com.
      Objeto.B_APL_MOR_INT.Control := chB_APL_MOR_INT;
      Objeto.CVE_GEN_TIP_PAG.Control := edCVE_GEN_TIP_PAG;
      Objeto.B_REDONDEO.Control:= chB_REDONDEO;
      Objeto.UNIDAD_REDONDEO.Control:= edUNIDAD_REDONDEO;
      Objeto.CVE_AFEC_REDONDEO.Control:= cbxCVE_AFEC_REDONDEO;
      Objeto.B_AJU_IMP_U_P.Control:= chB_AJU_IMP_U_P;
      Objeto.NUM_DMIN_REQ_PER.Control:= edNUM_DMIN_REQ_PER;
      Objeto.NUM_DIAS_AGR_PER.Control:= edNUM_DIAS_AGR_PER;
      Objeto.B_GENERA_EDOCTA.Control:= cbB_GENERA_EDOCTA;
      Objeto.DIA_GEN_EDO_CTA.Control:= iedDIA_GEN_EDO_CTA;
      Objeto.B_GENERA_CONTA.Control:= chB_GENERA_CONTA;
      Objeto.B_GEN_CONT_CC.Control:= chB_GEN_CONT_CC;
      Objeto.B_GEN_CONT_PROV.Control:= chB_GEN_CONT_PROV;
      Objeto.B_REP_REG_CNBV.Control:= chB_REP_REG_CNBV;
      Objeto.B_EXCESO_EVE.Control:= chB_EXCESO_EVE;

      {ROIM 19/01/2007 CAMBIO FACTOREJE}
      Objeto.IMP_MIN_DOCTO.Control:= IedIMP_MIN_DOCTO;
      {/ROIM}

      //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
      Objeto.CVE_CAL_CAPITAL.Control:= rgCVE_CAL_CAPITAL;
      //--END


      //---BEGIN   HERJA TIPOS DE FINANCIAMIENTO ADICIONAL
      Objeto.CVE_FINANC_ADIC.Control:= rgCVE_FINANC_ADIC;
      Objeto.B_ENVIA_FE.Control := cbB_ENVIA_FE;
      //--END
      Objeto.B_REESTRUCTURA.Control:= chB_REESTRUCTURA;

      Objeto.B_RE_25PCT.Control:= chB_APL_PAG25REN;
      Objeto.B_PLAZO_RE.Control:= chB_PLAZO_RE;
      Objeto.B_PLAZO_RS.Control:= chB_PLAZO_RS;

      sSQL:=   'SELECT CVE_REFERENCIA, VALOR '+     //SASB  09/09/2005
               '  FROM CR_GRUPO_CLAVE '+
               ' WHERE CVE_GRUPO_CLAVE = ''TIPCAR''';
      If Length(sSQL) <> 0 Then
         With Objeto.CVE_TIPO_CARTERA Do Begin
            LoadComboDatos(sSQL,0);
            DrawControl;
         End;

      // Inicia Modificación SATV4766 el 15May2006 Credito en Línea
      //Objeto.B_INC_DEC_TEMPO.Control   := chB_INC_DEC_TEMPO;     //LOLS 26 DIC 2006. SE MANTIENE LA COLUMNA B_EXCESO_EVE
      Objeto.CVE_AJUSTE_F_VTO.Control  := rgCVE_AJUSTE_F_VTO;
      Objeto.B_DISP_EN_LINEA.Control   := cbB_DISP_EN_LINEA;
      // Termina Modificación SATV4766

      {ROIM 04/05/2007 CAMBIO CHEQUERAS SOBREGIRO}
      Objeto.B_SOBREGIRO.Control := chB_SOBREGIRO;
      {/ROIM}


      Interforma1.MsgPanel := MsgPanel;

      Objeto.CatMini.DESC_CAT_MINIMO.Control := edDESC_CLAS_CONTAB;
      Objeto.CatMini.GetParams(Objeto);

      Objeto.ClaLegal.DESC_CLAS_LEGAL.Control := edDESC_CLAS_LEGAL;
      Objeto.ClaLegal.GetParams(Objeto);

      Objeto.Empresa.PersonaMoral.Nombre.Control := edNOM_EMPRESA;
      Objeto.Empresa.GetParams(Objeto);

      Objeto.ProdGpo.DESC_L_PROD_GPO.Control := edDESC_L_PROD_GPO;
      Objeto.ProdGpo.GetParams(Objeto);

      Objeto.TipoCred.DESC_TIPO_CRED.Control := edDESC_TIPO_CRED;
      Objeto.TipoCred.GetParams(Objeto);

      Objeto.TipoPago.VALOR.Control := edDESC_GEN_TIP_PAG;
      Objeto.TipoPago.GetParams(Objeto);

      {ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}
      Objeto.CVE_CALCULO_M.Control := rgCVE_CALCULO_M;
      Objeto.CVE_TASA_REFER_M.Control:=edCVE_TASA_REFER_M;
      Objeto.TasaRefer_M.DESC_TASA_INDIC.Control := edDESC_TASA_REFER_M;
      Objeto.TasaRefer_M.GetParams(Objeto);
      Objeto.OPERADOR_STASA_M.Control:=cbOPERADOR_STASA_M;
      Objeto.SOBRETASA_M.Control:=edSOBRETASA_M;
      if  rgCve_CALCULO_M.ItemIndex =1
         then
         Begin
           cbOPERADOR_STASA_M.Clear;
           edSOBRETASA_M.Clear;
           edCVE_TASA_REFER_M.Clear;
           edDESC_TASA_REFER_M.Clear;
           cbOPERADOR_STASA_M.enabled:=false;
           edSOBRETASA_M.Enabled:=false;
           edCVE_TASA_REFER_M.Enabled:=false;
           btTASA_REFER_M.Enabled:=false;

         End
         else
         Begin
           cbOPERADOR_STASA_M.enabled:=true;
           edSOBRETASA_M.Enabled:=true;
           edCVE_TASA_REFER_M.Enabled:=true;
           btTASA_REFER_M.Enabled:=true;
         End;
    {ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}

      Objeto.B_LINEA_CREDITO.Control:=chB_LINEA_CREDITO;
End;

procedure TWCrProducto.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_PRODUCTO_CRE.Control:=nil;
      Objeto.CVE_CLAS_CONTAB.Control:=nil;
      Objeto.CVE_CLAS_LEGAL.Control:=nil;
      Objeto.B_PER_FISICA.Control:=nil;
      Objeto.B_PER_MORAL.Control:=nil;
      Objeto.B_GARANTIA.Control:=nil;
      Objeto.DESC_C_PRODUCTO.Control:=nil;
      Objeto.DESC_L_PRODUCTO.Control:=nil;
      Objeto.IMP_MAX_AUT_CRE.Control:=nil;
      Objeto.IMP_MIN_AUT_CRE.Control:=nil;
      Objeto.IMP_MAX_AUT_DIS.Control:=nil;
      Objeto.IMP_MIN_AUT_DIS.Control:=nil;
      Objeto.PLAZO_MAX_CREDITO.Control:=nil;
      Objeto.PLAZO_MIN_CREDITO.Control:=nil;
      Objeto.PLAZO_MAX_DISP.Control:=nil;
      Objeto.PLAZO_MIN_DISP.Control:=nil;
      Objeto.B_PLAZO_CREDITO.Control:=nil;
      Objeto.B_MOD_TASA_REFER.Control:=nil;
      Objeto.B_MOD_OPER_STASA.Control:=nil;
      Objeto.B_MOD_SOBRETASA.Control:=nil;
      Objeto.B_APLICA_IVA.Control:=nil;
      Objeto.SIT_PRODUCTO.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
      Objeto.B_COB_ORD_PER.Control := nil;
      Objeto.B_COB_ORD_ACC.Control := nil;
      Objeto.B_COB_TOT_PER.Control := nil;
      Objeto.B_COB_PARCIAL.Control := nil;
      Objeto.CVE_REVOLVENCIA.Control := nil;
      Objeto.B_RANGO_IMP_CRE.Control := nil;
      Objeto.B_RANGO_IMP_DISP.Control := nil;
      Objeto.B_RANGO_PLA_CRE.Control := nil;
      Objeto.B_RANGO_PLA_DISP.Control := nil;
      Objeto.B_CALI_ACRE_DISP.Control := nil;
      Objeto.CVE_IMP_CALC_INT.Control := nil;
      Objeto.CVE_CALCULO_INT.Control := nil;
      Objeto.B_CONSULTA_CAP.Control := nil;
      Objeto.B_CONSULTA_INT.Control := nil;
      Objeto.B_CONSULTA_COM.Control := nil;
      Objeto.B_CONSULTA_DOC.Control := nil;
      Objeto.B_CONSULTA_FIN.Control := nil;
      Objeto.B_FINANC_ADIC.Control := nil;
      Objeto.B_DIAS_ADIC_PAGO.Control := nil;
      Objeto.B_INDICA_TASA_AU.Control := nil;
      Objeto.B_MOD_TASA_REF_D.Control := nil;
      Objeto.B_MOD_OP_STASA_D.Control := nil;
      Objeto.B_MOD_STASA_D.Control := nil;
      Objeto.ID_EMPRESA.Control := nil;
      Objeto.CVE_PRODUCTO_GPO.Control := nil;
      Objeto.CVE_TIPO_CRED_BC.Control := nil;
      Objeto.B_APL_PRORROGA.Control := nil;
      Objeto.B_APL_RENOVACION.Control := nil;
      Objeto.B_APL_REESTRUCT.Control := nil;
      Objeto.B_APL_CONVE_MOD.Control := nil;
      Objeto.B_APL_EVEN_ACEL.Control := nil;
      Objeto.CVE_TIPO_CARTERA.Control:= nil;
      Objeto.CVE_PR_CONTABLE.Control := nil;
      Objeto.CVE_IND_ADI_CONT.Control:= nil;
      Objeto.CVE_CALC_IVA_INT.Control := nil;
      // Objeto.B_AJU_FVTO_CP.Control := nil;
      // Objeto.B_AJU_FVTO_IN.Control := nil;
      // Objeto.B_AJU_FVTO_CN.Control := nil;
      Objeto.B_APL_MOR_INT.Control := nil;
      Objeto.CVE_GEN_TIP_PAG.Control := nil;
      Objeto.B_REDONDEO.Control:= Nil;
      Objeto.UNIDAD_REDONDEO.Control:= Nil;
      Objeto.CVE_AFEC_REDONDEO.Control:= Nil;
      Objeto.B_AJU_IMP_U_P.Control:= Nil;
      Objeto.NUM_DMIN_REQ_PER.Control:= Nil;
      Objeto.NUM_DIAS_AGR_PER.Control:= Nil;
      Objeto.B_GENERA_EDOCTA.Control:= Nil;
      Objeto.DIA_GEN_EDO_CTA.Control:= Nil;
      Objeto.B_GENERA_CONTA.Control:= Nil;
      Objeto.B_GEN_CONT_CC.Control:= Nil;
      Objeto.B_GEN_CONT_PROV.Control:= Nil;
      Objeto.B_REP_REG_CNBV.Control:= Nil;
      Objeto.B_EXCESO_EVE.Control:= Nil;
      {ROIM 19/01/2007 CAMBIO FACTOREJE}
      Objeto.IMP_MIN_DOCTO.Control:= Nil;
      {/ROIM}

      //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
      Objeto.CVE_CAL_CAPITAL.Control:= nil;
      //--END

      //---BEGIN   HERJA TIPOS DE FINANCIAMIENTO ADICIONAL
      Objeto.CVE_FINANC_ADIC.Control:= nil;
      Objeto.B_ENVIA_FE.Control := nil;
      //--END
      Objeto.B_REESTRUCTURA.Control := nil;
      Objeto.B_RE_25PCT.Control := nil;
      Objeto.B_PLAZO_RE.Control := nil;
      Objeto.B_PLAZO_RS.Control := nil;

      Objeto.CatMini.DESC_CAT_MINIMO.Control := nil;
      Objeto.ClaLegal.DESC_CLAS_LEGAL.Control := nil;
      Objeto.Empresa.PersonaMoral.Nombre.Control := nil;
      Objeto.ProdGpo.DESC_L_PROD_GPO.Control := nil;

      Objeto.TipoCred.DESC_TIPO_CRED.Control := nil;

      Objeto.TipoPago.VALOR.Control := nil;

      // Inicia Modificación SATV4766 el 15May2006 Credito en Línea
      //Objeto.B_INC_DEC_TEMPO.Control   := Nil;          //LOLS 26 DIC 2006. SE MANTIENE LA COLUMNA B_EXCESO_EVE
      Objeto.CVE_AJUSTE_F_VTO.Control  := Nil;
      Objeto.B_DISP_EN_LINEA.Control   := Nil;
      // Termina Modificación SATV4766

      {ROIM 04/05/2007 CAMBIO CHEQUERAS SOBREGIRO}
      Objeto.B_SOBREGIRO.Control := Nil;
      {/ROIM}


      Interforma1.MsgPanel := Nil;
      {ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}
      Objeto.CVE_CALCULO_M.Control:=Nil;
      Objeto.CVE_TASA_REFER_M.Control:=Nil;
      Objeto.OPERADOR_STASA_M.Control:=nil;
      Objeto.SOBRETASA_M.Control:=nil;
      {ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}

      Objeto.B_LINEA_CREDITO.Control:=nil;
   //Objeto
end;

procedure TWCrProducto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrProducto.InterForma1DespuesNuevo(Sender: TObject);
begin
   //Asigna valores a los radio groups
   rgSIT_PRODUCTO.ItemIndex := 0;
   rgCVE_REVOLVENCIA.ItemIndex :=2;
   rgCVE_IMP_CALC_INT.ItemIndex := 0;
   rgCVE_CALCULO_INT.ItemIndex := 0;
   rgCVE_AJUSTE_F_VTO.ItemIndex := 2;
   //Prende banderas de  validación
   cbB_RANGO_IMP_CRE.Checked := True;
   cbB_RANGO_IMP_DISP.Checked := True;
   cbB_RANGO_PLA_DISP.Checked := True;
   cbB_RANGO_PLA_CRE.Checked := True;
   //Asinga Valores a importes y plazos
   Objeto.NUM_DIAS_MAX_TOL.AsFloat := 0;
   Objeto.IMP_MAX_AUT_CRE.AsFloat := 0;
   Objeto.IMP_MIN_AUT_CRE.AsFloat := 0;
   Objeto.IMP_MAX_AUT_DIS.AsFloat := 0;
   Objeto.IMP_MIN_AUT_DIS.AsFloat := 0;
   Objeto.PLAZO_MAX_CREDITO.AsFloat := 0;
   Objeto.PLAZO_MIN_CREDITO.AsFloat := 0;
   Objeto.PLAZO_MAX_DISP.AsFloat := 0;
   Objeto.PLAZO_MIN_DISP.AsFloat := 0;
   Objeto.CVE_PRESUPUESTO.AsString:= '';
   //Datos de Control
   Objeto.F_ALTA.AsDateTime := Now;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   //Datos de Ajuste de Plazo y Redondeo
   Objeto.NUM_DMIN_REQ_PER.AsInteger := 0;
   Objeto.NUM_DIAS_AGR_PER.AsInteger := 0;
   Objeto.B_REDONDEO.AsString := CFALSO;
   Objeto.UNIDAD_REDONDEO.AsInteger := 0;
   Objeto.CVE_AFEC_REDONDEO.AsString := C_NO_APLICA;
   Objeto.B_AJU_IMP_U_P.AsString := CFALSO;
   ActivaControlesRedondeo(False);
   //
   edID_EMPRESA.SetFocus;
   MuestraHints;
   pgAltaDatos.ActivePageIndex := 0;
   cbxCVE_TIPO_CARTERA.ItemIndex:=0;
   Objeto.B_GENERA_EDOCTA.AsString := 'F';
   Objeto.DIA_GEN_EDO_CTA.AsFloat := 0;

   Objeto.B_ENVIA_BNC.AsString := 'V';   // LOLS 15 ENE 2007. ENVIO A BURO DE CREDITO

   //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
   rgCVE_CAL_CAPITAL.ItemIndex:= 0;
   //--END

   //HERJA INICIALIZACION DE TIPOS DE FINANCIAMIENTO ADICIONAL
   rgCVE_FINANC_ADIC.Enabled:=false;
   rgCVE_FINANC_ADIC.ItemIndex:=-1;
 {ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}
   rgCVE_CALCULO_M.ItemIndex:=1;
   rgCVE_CALCULO_M.Enabled:=false;
 {ASTECI.HEGC 4/MAR/2010 CALCULO DE MORATORIOS PA}
   
end;

procedure TWCrProducto.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Now;
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   pgAltaDatos.ActivePageIndex := 0;
   ActivaControlesRedondeo(Objeto.B_REDONDEO.AsString = CVERDAD);

   //HERJA
    IF chB_FINANC_ADIC.Checked=false then
    begin
       rgCVE_FINANC_ADIC.Enabled:=false;
       rgCVE_FINANC_ADIC.ItemIndex:=-1;
    end;
   //FIN HERJA
   edDESC_C_PRODUCTO.SetFocus;
end;

procedure TWCrProducto.MuestraMsgMonedas;
var vlOut1 : Integer;
    vlOut2 : String;
    vlstrMonedas : String;
begin
    // Inicia Modificaciones SATV4766 el 05 JUL 2006
    If (Objeto.B_DISP_EN_LINEA.AsString = CVERDAD) Then
      Begin
      vlstrMonedas := Monedas_a_Configurar_Horarios(vlOut1, vlOut2);;
      If (Trim(vlstrMonedas) <> '') Then
        Begin
        MsgPanel.Caption    := C_MSG_MONEDAS + vlstrMonedas;
        MsgPanel.Color      := clYellow;
        MsgPanel.Font.Color := clBlack;
        End;
      End;
   // Termina Modificaciones
end;

procedure TWCrProducto.InterForma1Buscar(Sender: TObject);
begin
 If Objeto.Busca Then
 Begin
    vgRevolvente :=  Objeto.CVE_REVOLVENCIA.AsString;
    MuestraHints;
    MuestraMsgMonedas;
 End;
end;

function TWCrProducto.Monedas_a_Configurar_Horarios(var peCVE_MONEDA : Integer; var peCVE_TASA_REFER : String) : String;
var vlStr, vlstrSQL, vlstrComa : String;
   vlQry : TQuery;
begin
 With Objeto Do
  Begin
  vlStr := ''; vlstrComa := ''; peCVE_MONEDA := 0;
  vlstrSQL := ' SELECT CRPD.CVE_MONEDA, M.DESC_MONEDA, CRPD.CVE_TASA_REFER' + coCRLF +
              ' FROM CR_REL_PROD_MON CRPD,' + coCRLF +
              '      MONEDA M' + coCRLF +
              ' WHERE CRPD.CVE_PRODUCTO_CRE = ' + SQLStr(CVE_PRODUCTO_CRE.AsString) + coCRLF +
              '   AND ( CRPD.H_INI_DISPOS IS NULL OR CRPD.H_FIN_DISPOS IS NULL' + coCRLF +
              '         OR CRPD.H_INI_PAGOS IS NULL OR CRPD.H_FIN_PAGOS IS NULL )' + coCRLF +
              '   AND M.CVE_MONEDA = CRPD.CVE_MONEDA';
  vlQry := GetSQLQuery(vlstrSQL, Apli.DatabaseName, Apli.SessionName, True);
  If Assigned(vlQry) Then
    Begin
    // Si se encontraron monedas pendientes de configurar, indica en los paranetros de salida
    // cuales son...
    vlQry.First;
    peCVE_MONEDA     := vlQry.FieldByName('CVE_MONEDA').AsInteger;
    peCVE_TASA_REFER := vlQry.FieldByName('CVE_TASA_REFER').AsString;
    While Not vlQry.Eof Do
      Begin
      vlStr := vlStr + vlstrComa + vlQry.FieldByName('DESC_MONEDA').AsString;
      vlstrComa := ', ';
      vlQry.Next;
      End;
    End;
  End;
Result := vlStr;
end;

procedure TWCrProducto.InterForma1DespuesAceptar(Sender: TObject);
var RelProdMon : TCrRePrMn;
    vlstrMonedas : String;
    vlCVE_MONEDA : Integer;
    vlCVE_TASA_REFER : String;
    Sp: TStoredProc;
    psResultado : Integer;
    psTxResultado : String;
begin
   pgAltaDatos.ActivePageIndex := 0;
   MuestraHints;
   If (Objeto.B_DISP_EN_LINEA.AsString = CVERDAD) Then
     Begin
     vlstrMonedas := Monedas_a_Configurar_Horarios(vlCVE_MONEDA, vlCVE_TASA_REFER);
     // Si existen monedas por configurar los horarios
     If (Trim(vlstrMonedas) <> '') Then
       Begin
           MessageDlg(C_MSG_MONEDAS + vlstrMonedas, mtWarning, [mbOk], 0);
          {$WARNINGS OFF}
            RelProdMon := TCrRePrMn.Create(self);
          {$WARNINGS ON}
           // Muestra el catálogo de la primera moneda a capturar los horarios 
           If Assigned(RelProdMon) Then
             Begin
                Try
                   RelProdMon.Apli      := Objeto.Apli;
                   RelProdMon.Producto  := Objeto;
                   RelProdMon.ParamCre  := Objeto.ParamCre;
                   If RelProdMon.FindKey([vlCVE_MONEDA, Objeto.CVE_PRODUCTO_CRE.AsString, vlCVE_TASA_REFER]) Then
                      RelProdMon.Catalogo
                   Else
                      btCONFIG_MONEDASClick(Self);
                Finally
                   RelProdMon.Free;
                End;
             End
           Else
             Begin
                btCONFIG_MONEDASClick(Self);
             End;
       End;
     End;
    //Procedimiento para terminar de configurar el Producto
    Sp:= TStoredProc.Create (Self);
    Try
      //if Objeto.Apli.DataBase.Connected then
      //  MessageDlg (Format ('DatabaseName: %s, SessionName: %s, Line0: %s, Line1: %s',
        //                    [Objeto.Apli.DataBase.DatabaseName,
          //                   Objeto.Apli.DataBase.SessionName,
            //                 Objeto.Apli.DataBase.Params [0],
              //               Objeto.Apli.DataBase.Params [1]]), mtInformation, [mbOk], 0);
      Sp.DatabaseName   := Objeto.Apli.DataBaseName;
      Sp.SessionName    := Objeto.Apli.SessionName;
      Sp.StoredProcName := 'PKGCRNVOPRODCRED.STPCONFIGNVOPRODCRED';
      Sp.Params.Clear;
      Sp.Params.CreateParam( ftString,  'peProdNvo',    ptInput  );
      Sp.Params.CreateParam( ftString,  'peProdBase',    ptInput  );
      Sp.Params.CreateParam( ftString,  'peCveMedLiq',    ptInput  );
      Sp.Params.CreateParam( ftString,  'peUser',    ptInput  );
      Sp.Params.CreateParam( ftString,  'peCommit',     ptInput  );
      //
      Sp.Params.CreateParam( ftFloat,   'psResultado',   ptOutput);
      Sp.Params.CreateParam( ftString,  'psTxResultado', ptOutput);
      //
      Sp.ParamByName('peProdNvo').AsString   := edCve_Producto_Cre.Text ;
      Sp.ParamByName('peProdBase').AsString  := '';
      Sp.ParamByName('peCveMedLiq').AsString := '' ;
      Sp.ParamByName('peUser').AsString      := Objeto.Apli.Usuario ;
      Sp.ParamByName('peCommit').AsString    := 'V';
      Sp.ExecProc;

      psResultado   := Sp.ParamByName('psResultado').AsInteger;
      psTxResultado := Sp.ParamByName('psTxResultado').AsString;

      if psResultado = 0 then
        begin
          MessageDlg('El producto ha sido configurado correctamente.', mtConfirmation, [mbOk], 0);
        end
        else
        begin
           if psResultado = 6201 then
              begin
               //MessageDlg('El producto esta correctamente configurado.', mtConfirmation, [mbOk], 0);
              end
              else
          begin
           if psResultado = 6003 then
              begin
               MessageDlg('El producto se debe de terminar de configurar manualmente por el área de sistemas.', mtConfirmation, [mbOk], 0);
              end
              else
                begin
                  MessageDlg('No se logró configurar completamente el producto. Error: '+ IntToStr(psResultado)+' ' + psTxResultado, mtError, [mbOk], 0);
                end;
             end;
          end;
      Finally
      Sp.Free;
    End;
   //Termina parte del nuevo procedimiento
end;

procedure TWCrProducto.InterForma1DespuesCancelar(Sender: TObject);
begin
   pgAltaDatos.ActivePageIndex := 0;
   MuestraMsgMonedas;
end;

procedure TWCrProducto.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Realizado := True
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Realizado := True
      else Realizado := False;
   end;
end;
{ ---------------------- C O N F I G U R A C I Ó N   D E   P R O D U C T O   ---------------------- }
//EMPRESA
procedure TWCrProducto.btEMPRESAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPRODUCT_EMPRE',True,True) then
   begin
     Objeto.Empresa.ShowAll := True;
     if Objeto.Empresa.Busca then
     begin
          Objeto.ID_EMPRESA.AsInteger := Objeto.Empresa.ID_Empresa.AsInteger;
          InterForma1.NextTab(edID_EMPRESA);
     end;
   end;
end;

procedure TWCrProducto.ilEMPRESAEjecuta(Sender: TObject);
begin
    if  Objeto.Empresa.FindKey([ilEmpresa.Buffer]) then
    begin
          Objeto.ID_EMPRESA.AsInteger := Objeto.Empresa.ID_Empresa.AsInteger;
         InterForma1.NextTab(edID_EMPRESA);
    end;
end;

procedure TWCrProducto.btEMPRESAExit(Sender: TObject);
var     VLBandera : Boolean;
        vlMsg     : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLBandera := True;
      vlMsg := '';
      Objeto.ID_EMPRESA.GetFromControl;
      If Objeto.ID_EMPRESA.AsString = '' then
      Begin
         vlMsg := 'Favor de indicar la Empresa';
         VLBandera := False;
      end;
      InterForma1.ValidaExit(edID_EMPRESA,VLBandera,vlMsg,True);
   End;
end;

procedure TWCrProducto.ilEMPRESACapture(Sender: TObject; var Show: Boolean);
begin Show := True;
end;

//PRODUCTO
procedure TWCrProducto.edCVE_PRODUCTO_CREExit(Sender: TObject);
var     VLBandera : Boolean;
        vlMsg     : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLBandera := True;
      vlMsg := '';
      Objeto.CVE_PRODUCTO_CRE.GetFromControl;
      If Objeto.CVE_PRODUCTO_CRE.AsString = '' then
      Begin
         vlMsg := 'Favor de indicar la clave del producto';
         VLBandera := False;
      end;
      InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,VLBandera,vlMsg,True);
   End;
end;

procedure TWCrProducto.edDESC_L_PRODUCTOExit(Sender: TObject);
begin InterForma1.ValidaExit(edDESC_L_PRODUCTO,True,'',True);
end;

procedure TWCrProducto.edDESC_C_PRODUCTOExit(Sender: TObject);
begin InterForma1.ValidaExit(edDESC_C_PRODUCTO,True,'',True);
end;
//GRUPO PRODUCTO
procedure TWCrProducto.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPRODUCT_GPOPD',True,True) then
   begin
     Objeto.ProdGpo.ShowAll := True;
     if Objeto.ProdGpo.Busca then
     BEgin
        MuestraHints;
        InterForma1.NextTab(edCVE_PRODUCTO_GPO);
     end;
   end;
end;

procedure TWCrProducto.ilPRODUCTO_GPOEjecuta(Sender: TObject);
begin
   if Objeto.ProdGpo.FindKey([ilPRODUCTO_GPO.Buffer]) then
       InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   //end if
end;

procedure TWCrProducto.edCVE_PRODUCTO_GPOExit(Sender: TObject);
var     VLBandera : Boolean;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLBandera := True;
      Objeto.CVE_PRODUCTO_GPO.GetFromControl;
      If Objeto.CVE_PRODUCTO_GPO.AsString = '' then
          VLBandera := False;
      InterForma1.ValidaExit(edCVE_PRODUCTO_GPO,VLBandera,' Favor de indicar el Grupo al que pertenece el Producto',True);
   end;
end;

procedure TWCrProducto.ilPRODUCTO_GPOCapture(Sender: TObject; var Show: Boolean);
begin Show := True;
end;
//CATÁLOGO MINIMO
procedure TWCrProducto.btCVE_CLAS_CONTABClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPRODUCT_CATMN',True,True) then
   begin
     Objeto.CatMini.ShowAll := True;
     Objeto.CatMini.BuscaWhereString := 'SIT_CAT_MINIMO=''AC''';
     if Objeto.CatMini.Busca then
     BEgin
        MuestraHints;
        InterForma1.NextTab(edCVE_CLAS_CONTAB);
     end;
   end;
end;

procedure TWCrProducto.ilCAT_MINIMOEjecuta(Sender: TObject);
begin
   if Objeto.CatMini.FindKey([ilCAT_MINIMO.Buffer]) then
       InterForma1.NextTab(edCVE_CLAS_CONTAB);
   //end if
end;

procedure TWCrProducto.edCVE_CLAS_CONTABExit(Sender: TObject);
var     VLBandera : Boolean;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLBandera := True;
      Objeto.CVE_CLAS_CONTAB.GetFromControl;
      If Objeto.CVE_CLAS_CONTAB.AsString = '' then
          VLBandera := False;
      InterForma1.ValidaExit(edCVE_CLAS_CONTAB,VLBandera,
                           'Favor de indicar el catálogo mínimo',True);
   end;
end;

procedure TWCrProducto.ilCAT_MINIMOCapture(Sender: TObject; var Show: Boolean);
begin Show := True;
end;
//CLASIFICACION LEGAL
procedure TWCrProducto.btCVE_CLAS_LEGALClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPRODUCT_CLSLE',True,True) then
   begin
     Objeto.ClaLegal.ShowAll := True;
     if Objeto.ClaLegal.Busca then
        InterForma1.NextTab(edCVE_CLAS_LEGAL);
     //end if
   end;
end;

procedure TWCrProducto.ilCLAS_LEGALEjecuta(Sender: TObject);
begin
   if Objeto.ClaLegal.FindKey([ilCLAS_LEGAL.Buffer]) then
       InterForma1.NextTab(edCVE_CLAS_LEGAL);
   //end if
end;

procedure TWCrProducto.edCVE_CLAS_LEGALExit(Sender: TObject);
var     VLBandera :     Boolean;
        vlMsg     : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      VLBandera := True;
      Objeto.CVE_CLAS_LEGAL.GetFromControl;
      If Objeto.CVE_CLAS_LEGAL.AsString = '' then
      Begin
         vlMsg :='Favor de indicar la clasificación legal';
         VLBandera := False;
      end;
      InterForma1.ValidaExit(edCVE_CLAS_LEGAL,VLBandera,vlMsg,True);
   end;
end;

procedure TWCrProducto.ilCLAS_LEGALCapture(Sender: TObject; var Show: Boolean);
begin
 Show := True;
end;
//TIPO CUENTA BURO CREDITO
procedure TWCrProducto.btCVE_TIPO_CRED_BCClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPRODUCT_TCTAB',True,True) then
   begin
     Objeto.TipoCred.ShowAll := True;
     if Objeto.TipoCred.Busca then
     BEgin
        MuestraHints;
        InterForma1.NextTab(edCVE_TIPO_CRED_BC);
     end;
   end;
end;

procedure TWCrProducto.ilCVE_TIPO_CRED_BCEjecuta(Sender: TObject);
begin
   if Objeto.TipoCred.FindKey([ilCVE_TIPO_CRED_BC.Buffer]) then
       InterForma1.NextTab(edCVE_TIPO_CRED_BC);
   //end if
end;

procedure TWCrProducto.ilCVE_TIPO_CRED_BCCapture(Sender: TObject; var Show: Boolean);
begin Show := True;
end;
//REVOLVENCIA
procedure TWCrProducto.rgCVE_REVOLVENCIAExit(Sender: TObject);
begin
   //pgAltaDatos.ActivePageIndex := 1;  // LOLS 14 SEP 2005
   //chB_DIAS_ADIC_PAGO.SetFocus;       // LOLS 14 SEP 2005
   InterForma1.ValidaExit(rgCVE_REVOLVENCIA,True,'',True);
   edCVE_PR_CONTABLE.SetFocus;
end;

procedure TWCrProducto.cbxCVE_TIPO_CARTERAExit(Sender: TObject);
var     VLBandera : Boolean;
        vlMsg     : String;
begin
   //
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      VLBandera := True;
      vlMsg := '';
      Objeto.CVE_TIPO_CARTERA.GetFromControl;
      If Objeto.CVE_TIPO_CARTERA.AsString = '' Then Begin
         vlMsg := 'Favor de indicar el Tipo de Cartera';
         VLBandera := False;
      End;
      InterForma1.ValidaExit(cbxCVE_TIPO_CARTERA,VLBandera,vlMsg,True);
   End;
end;


procedure TWCrProducto.edCVE_PR_CONTABLEExit(Sender: TObject);
var vlBandera : Boolean;
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  begin
    vlBandera := True;
    Objeto.CVE_PR_CONTABLE.GetFromControl;
    if Objeto.CVE_PR_CONTABLE.AsString = '' then
       vlBandera := False;
    //
    InterForma1.ValidaExit( edCVE_PR_CONTABLE, vlBandera, C_PROD_CONT, True );
  end;
end;

procedure TWCrProducto.edCVE_IND_ADI_CONTExit(Sender: TObject);
var vlBandera : Boolean;
begin
  vlBandera := True;
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  begin
    Objeto.CVE_IND_ADI_CONT.GetFromControl;
    if Objeto.CVE_IND_ADI_CONT.AsString = '' then
       VLBandera := False;
    //
    InterForma1.ValidaExit( edCVE_IND_ADI_CONT, VLBandera, C_IND_CONT, True );
  end;
  //
end;
{ ---------------------- C O N F I G U R A C I Ó N   D E   A U T O R I Z A C I O N    ---------------------- }
//BANDERAS
procedure TWCrProducto.chB_DIAS_ADIC_PAGOExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_DIAS_ADIC_PAGO,True,'',True);
end;

procedure TWCrProducto.chB_PER_MORALExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_PER_MORAL,True,'',True);
end;

procedure TWCrProducto.chB_PER_FISICAExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_PER_FISICA,True,'',True);
end;

procedure TWCrProducto.chB_FINANC_ADICClick(Sender: TObject);
   function verificaAutorizacion(pproducto: String): Integer;
   var vlsql : String;
       vlResult : Integer;
   Begin
      vlsql := ' SELECT COUNT(*) COUNT FROM CR_CONTRATO ' +
               ' WHERE CVE_PRODUCTO_CRE = '+ SQLStr(pProducto) +
               ' AND B_FINANC_ADIC = '+ SQLStr(CVERDAD);
      GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlResult,False);
      verificaAutorizacion:= vlResult;
   end;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin

     Objeto.B_FINANC_ADIC.GetFromControl;

     if Objeto.B_FINANC_ADIC.AsString = CVERDAD then
     begin
        if verificaAutorizacion(Objeto.CVE_PRODUCTO_CRE.AsString) > 0 then
           chB_FINANC_ADIC.Checked := True;

        rgCVE_FINANC_ADIC.Enabled:=true;
        rgCVE_FINANC_ADIC.ItemIndex:=0;
     end;

     if Objeto.B_FINANC_ADIC.AsString = CFALSO then
     begin
        chB_FINANC_ADIC.Checked := False;

        rgCVE_FINANC_ADIC.Enabled:=false;
        rgCVE_FINANC_ADIC.ItemIndex:=-1;
     end;


     if Objeto.B_FINANC_ADIC.AsString = '' then
     begin
        if chB_FINANC_ADIC.Checked then
        begin
           rgCVE_FINANC_ADIC.Enabled:=true;
           rgCVE_FINANC_ADIC.ItemIndex:=0;
        end;

        if NOT (chB_FINANC_ADIC.Checked) then
        begin
           rgCVE_FINANC_ADIC.Enabled:=false;
           rgCVE_FINANC_ADIC.ItemIndex:=-1;
        end;
     end;
     
   end;
end;

procedure TWCrProducto.chB_FINANC_ADICExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_FINANC_ADIC,True,'',True);
end;

procedure TWCrProducto.chB_GARANTIAExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_GARANTIA,True,'',True);
end;

procedure TWCrProducto.chB_INDICA_TASA_AUExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_INDICA_TASA_AU,True,'',True);
end;

procedure TWCrProducto.chB_MOD_TASA_REFERExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_MOD_TASA_REFER,True,'',True);
end;

procedure TWCrProducto.chB_MOD_OPER_STASAExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_MOD_OPER_STASA,True,'',True);
end;

procedure TWCrProducto.chB_MOD_SOBRETASAExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_MOD_SOBRETASA,True,'',True);
end;

procedure TWCrProducto.chB_APLICA_IVAExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_APLICA_IVA,True,'',True);
end;
procedure TWCrProducto.chB_GENERA_CONTAExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_GENERA_CONTA,True,'',True);
end;

procedure TWCrProducto.chB_APL_CONVE_MODExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_APL_CONVE_MOD,True,'',True);
end;

procedure TWCrProducto.chB_APL_EVEN_ACELExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_APL_EVEN_ACEL,True,'',True);
end;

//CALIFICACION
procedure TWCrProducto.cbB_CALI_ACRE_DISPExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_CALI_ACRE_DISP,True,'',True);
end;

//RANGOS DE PLAZO Y MONTO
Procedure TWCrProducto.chB_PLAZO_CREDITOExit(Sender: TObject);
var  VLBandera  :  boolean;
     VLMesg     :  String;
Begin
   VLBandera  := True;
   VLMesg     := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      if not(chB_PLAZO_CREDITO.Checked) then
      Begin
         if Objeto.PLAZO_MAX_CREDITO.AsFloat < Objeto.PLAZO_MAX_DISP.AsFloat then
         Begin
            VLMesg :='El plazo máximo de la disposición no debe de ser menor al plazo máximo dispuesto';
            VLBandera := False;
         end;
      end;
      InterForma1.ValidaExit(chB_PLAZO_CREDITO,VLBandera,VLMesg,True);
   end;
end;

procedure TWCrProducto.IedPLAZO_MIN_CREDITOExit(Sender: TObject);
var  VLBandera  :  boolean;
     VLMesg     :  String;
Begin
   VLMesg     := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.PLAZO_MIN_CREDITO.GetFromControl;
      VLbandera := ValNumPositivo(VLMesg,Objeto.PLAZO_MIN_CREDITO.AsInteger); //Procedimiento extraido de IntGenCre;
      InterForma1.ValidaExit(IedPLAZO_MIN_CREDITO,VLBandera,VLMesg,True);
   end;
end;

procedure TWCrProducto.btPLAZOMINCREDClick(Sender: TObject);
begin
   if Objeto.Active then
      IedPLAZO_MIN_CREDITO.Text := VentanaCalculo(Objeto.PLAZO_MIN_CREDITO.AsString);
   //end if;
end;

procedure TWCrProducto.IedPLAZO_MAX_CREDITOExit(Sender: TObject);
var  VLBandera  :  boolean;
     VLMesg     :  String;
Begin
   VLMesg     := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.PLAZO_MAX_CREDITO.GetFromControl;
      VLbandera := ValNumPositivo(VLMesg,Objeto.PLAZO_MAX_CREDITO.AsInteger); //Procedimiento extraido de IntGenCre;
      If Objeto.PLAZO_MAX_CREDITO.AsInteger < Objeto.PLAZO_MIN_CREDITO.AsInteger then
      Begin
           VLMesg :='El plazo máximo de la disposición no debe de ser menor al plazo mínimo de la disposición';
           VLBandera := False;
      end;
      InterForma1.ValidaExit(IedPLAZO_MAX_CREDITO,VLBandera,VLMesg,True);
   end;
end;

procedure TWCrProducto.IedIMP_MIN_AUT_CREExit(Sender: TObject);
var  VLBandera  :  boolean;
     VLMesg     :  String;
Begin
   VLMesg     := '';
   vlBandera := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.IMP_MIN_AUT_CRE.GetFromControl;
      if Objeto.IMP_MIN_AUT_CRE.AsFloat < 0 then
      Begin
         vlBandera := False;
         vlMesg := 'El importe no puede ser negativo';
      end;
      InterForma1.ValidaExit(IedIMP_MIN_AUT_CRE,VLBandera,VLMesg,True);
   end;
end;

procedure TWCrProducto.IedIMP_MAX_AUT_CREExit(Sender: TObject);
var  VLBandera  :  boolean;
     VLMesg     :  String;
Begin
   VLMesg     := '';
   vlBandera := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.IMP_MAX_AUT_CRE.GetFromControl;
      if Objeto.IMP_MAX_AUT_CRE.AsFloat < 0 then
      Begin
         vlBandera := False;
         vlMesg := 'El importe no puede ser negativo';
      end
      else If Objeto.IMP_MAX_AUT_CRE.AsFloat < Objeto.IMP_MIN_AUT_CRE.AsFloat then
      Begin
           VLMesg :='El importe máximo no debe de ser menor al importe mínimo';
           VLBandera := False;
      end;
      InterForma1.ValidaExit(IedIMP_MAX_AUT_CRE,VLBandera,VLMesg,True);
   end;
end;

procedure TWCrProducto.btPLAZOMAXCREDClick(Sender: TObject);
begin
   if Objeto.Active then
      IedPLAZO_MAX_CREDITO.Text:= VentanaCalculo(Objeto.PLAZO_MAX_CREDITO.AsString);
   //end if
end;
procedure TWCrProducto.cbB_RANGO_PLA_CREExit(Sender: TObject);
begin InterForma1.ValidaExit(cbB_RANGO_PLA_CRE,True,'',True);
end;

procedure TWCrProducto.cbB_RANGO_IMP_CREExit(Sender: TObject);
begin
   pgAltaDatos.ActivePageIndex := 2;
   chB_MOD_TASA_REF_D.SetFocus;
   InterForma1.ValidaExit(cbB_RANGO_IMP_CRE,True,'',True);
end;

procedure TWCrProducto.cbB_RANGO_IMP_CREClick(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       if not (cbB_RANGO_IMP_CRE.Checked) then
       Begin
          IedIMP_MIN_AUT_CRE.Enabled := False;
          IedIMP_MIN_AUT_CRE.Color := clBtnFace;
          IedIMP_MIN_AUT_CRE.ReadOnly := True;
          IedIMP_MAX_AUT_CRE.Enabled := False;
          IedIMP_MAX_AUT_CRE.Color := clBtnFace;
          IedIMP_MAX_AUT_CRE.ReadOnly := True;
       end
       else
       Begin
          IedIMP_MIN_AUT_CRE.Enabled := True;
          IedIMP_MIN_AUT_CRE.Color := clWindow;
          IedIMP_MIN_AUT_CRE.ReadOnly := False;
          IedIMP_MAX_AUT_CRE.Enabled := True;
          IedIMP_MAX_AUT_CRE.Color := clWindow;
          IedIMP_MAX_AUT_CRE.ReadOnly := False;
       end;
   end;
end;
procedure TWCrProducto.cbB_RANGO_PLA_CREClick(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       if not (cbB_RANGO_PLA_CRE.Checked) then
       Begin
          IedPLAZO_MIN_CREDITO.Enabled := False;
          IedPLAZO_MIN_CREDITO.Color := clBtnFace;
          IedPLAZO_MIN_CREDITO.ReadOnly := True;
          IedPLAZO_MAX_CREDITO.Enabled := False;
          IedPLAZO_MAX_CREDITO.Color := clBtnFace;
          IedPLAZO_MAX_CREDITO.ReadOnly := True;
       end
       else
       Begin
          IedPLAZO_MIN_CREDITO.Enabled := True;
          IedPLAZO_MIN_CREDITO.Color := clWindow;
          IedPLAZO_MIN_CREDITO.ReadOnly := False;
          IedPLAZO_MAX_CREDITO.Enabled := True;
          IedPLAZO_MAX_CREDITO.Color := clWindow;
          IedPLAZO_MAX_CREDITO.ReadOnly := False;
       end;
   end;
end;
{ ----------------------  C O N F I G U R A C I Ó N   O P E R A C I O N   ---------------------- }
//BANDERAS
procedure TWCrProducto.chB_CONSULTA_CAPExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_CONSULTA_CAP,True,'',True);
end;

procedure TWCrProducto.chB_CONSULTA_INTExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_CONSULTA_INT,True,'',True);
end;

procedure TWCrProducto.chB_CONSULTA_COMExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_CONSULTA_COM,True,'',True);
end;

procedure TWCrProducto.chB_CONSULTA_DOCExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_CONSULTA_DOC,True,'',True);
end;

procedure TWCrProducto.chB_CONSULTA_FINExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_CONSULTA_FIN,True,'',True);
end;

procedure TWCrProducto.chB_MOD_TASA_REF_DExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_MOD_TASA_REF_D,True,'',True);
end;

procedure TWCrProducto.chB_MOD_STASA_DExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_MOD_STASA_D,True,'',True);
end;

procedure TWCrProducto.chB_MOD_OP_STASA_DExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_MOD_OP_STASA_D,True,'',True);
end;

procedure TWCrProducto.chB_APL_PRORROGAExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_APL_PRORROGA,True,'',True);
end;

procedure TWCrProducto.chB_APL_RENOVACIONExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_APL_RENOVACION,True,'',True);
end;

procedure TWCrProducto.chB_APL_REESTRUCTExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_APL_REESTRUCT,True,'',True);
end;

//CALCULO INTERES
procedure TWCrProducto.rgCVE_IMP_CALC_INTExit(Sender: TObject);
begin InterForma1.ValidaExit(rgCVE_IMP_CALC_INT,True,'',True);
end;

procedure TWCrProducto.rgCVE_CALCULO_INTExit(Sender: TObject);
begin InterForma1.ValidaExit(rgCVE_CALCULO_INT,True,'',True);
end;

//RANGOS DE PLAZO Y MONTO
procedure TWCrProducto.cbB_RANGO_PLA_DISPExit(Sender: TObject);
begin InterForma1.ValidaExit(cbB_RANGO_PLA_DISP,True,'',True);
end;

procedure TWCrProducto.IedIMP_MIN_AUT_DISExit(Sender: TObject);
var  VLBandera  :  boolean;
     VLMesg     :  String;
Begin
   vlBandera := True;
   VLMesg     := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.IMP_MIN_AUT_DIS.GetFromControl;
      if Objeto.IMP_MIN_AUT_DIS.AsFloat < 0 then
      Begin
         vlBandera := False;
         vlMesg := 'El importe no puede ser negativo';
      end;
      InterForma1.ValidaExit(IedIMP_MIN_AUT_DIS,VLBandera,VLMesg,True);
   end;
end;

procedure TWCrProducto.IedIMP_MAX_AUT_DISExit(Sender: TObject);
var  VLBandera  :  boolean;
     VLMesg     :  String;
Begin
   VLMesg     := '';
   vlBandera := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.IMP_MAX_AUT_DIS.GetFromControl;
      if Objeto.IMP_MAX_AUT_DIS.AsFloat < 0 then
      Begin
         vlBandera := False;
         vlMesg := 'El importe no puede ser negativo';
      end
      else If Objeto.IMP_MAX_AUT_DIS.AsFloat < Objeto.IMP_MIN_AUT_DIS.AsFloat then
      Begin
           VLMesg :='El importe máximo dispuesto no debe de ser menor al importe mínimo dispuesto';
           VLBandera := False;
      end
      else
      Begin
         if Objeto.IMP_MAX_AUT_DIS.AsFloat > Objeto.IMP_MAX_AUT_CRE.AsFloat then
         Begin
            VLMesg :='El importe máximo de la disposición no debe de ser mayor al importe máximo de la autorización';
            VLBandera := False;
         end;
      end;
      InterForma1.ValidaExit(IedIMP_MAX_AUT_DIS,VLBandera,VLMesg,True);
   end;
end;

procedure TWCrProducto.IedPLAZO_MIN_DISPExit(Sender: TObject);
var  VLBandera  :  boolean;
     VLMesg     :  String;
Begin
   VLMesg     := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.PLAZO_MIN_DISP.GetFromControl;
      VLbandera := ValNumPositivo(VLMesg,Objeto.PLAZO_MIN_DISP.AsInteger); //Procedimiento extraido de IntGenCre;
      InterForma1.ValidaExit(IedPLAZO_MIN_DISP,VLBandera,VLMesg,True);
   end;
end;

procedure TWCrProducto.IedPLAZO_MAX_DISPExit(Sender: TObject);
var  VLBandera  :  boolean;
     VLMesg     :  String;
Begin
   VLMesg     := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.PLAZO_MAX_DISP.GetFromControl;
      VLbandera := ValNumPositivo(VLMesg,Objeto.PLAZO_MAX_DISP.AsInteger); //Procedimiento extraido de IntGenCre;
      If Objeto.PLAZO_MAX_DISP.AsInteger < Objeto.PLAZO_MIN_DISP.AsInteger then
      Begin
           VLMesg :='El plazo máximo dispuesto no debe de ser menor al plazo mínimo dispuesto';
           VLBandera := False;
      end;
      InterForma1.ValidaExit(IedPLAZO_MAX_DISP,VLBandera,VLMesg,True);
   end;
end;

procedure TWCrProducto.btPLAZOMINDISPClick(Sender: TObject);
begin
   if Objeto.Active then
      IedPLAZO_MIN_DISP.Text:= VentanaCalculo(Objeto.PLAZO_MIN_DISP.AsString);
   //end if
end;

procedure TWCrProducto.btPLAZOMAXDISPClick(Sender: TObject);
begin
   if Objeto.Active then
      IedPLAZO_MAX_DISP.Text:= VentanaCalculo(Objeto.PLAZO_MAX_DISP.AsString);
   //end if
end;

procedure TWCrProducto.cbB_RANGO_IMP_DISPClick(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       if not (cbB_RANGO_IMP_DISP.Checked) then
       Begin
          IedIMP_MIN_AUT_DIS.Enabled := False;
          IedIMP_MIN_AUT_DIS.Color := clBtnFace;
          IedIMP_MIN_AUT_DIS.ReadOnly := True;
          IedIMP_MAX_AUT_DIS.Enabled := False;
          IedIMP_MAX_AUT_DIS.Color := clBtnFace;
          IedIMP_MAX_AUT_DIS.ReadOnly := True;
       end
       else
       Begin
          IedIMP_MIN_AUT_DIS.Enabled := True;
          IedIMP_MIN_AUT_DIS.Color := clWindow;
          IedIMP_MIN_AUT_DIS.ReadOnly := False;
          IedIMP_MAX_AUT_DIS.Enabled := True;
          IedIMP_MAX_AUT_DIS.Color := clWindow;
          IedIMP_MAX_AUT_DIS.ReadOnly := False;
       end;
   end;
end;

procedure TWCrProducto.cbB_RANGO_PLA_DISPClick(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       if not (cbB_RANGO_PLA_DISP.Checked) then
       Begin
          IedPLAZO_MIN_DISP.Enabled := False;
          IedPLAZO_MIN_DISP.Color := clBtnFace;
          IedPLAZO_MIN_DISP.ReadOnly := True;
          IedPLAZO_MAX_DISP.Enabled := False;
          IedPLAZO_MAX_DISP.Color := clBtnFace;
          IedPLAZO_MAX_DISP.ReadOnly := True;
       end
       else
       Begin
          IedPLAZO_MIN_DISP.Enabled := True;
          IedPLAZO_MIN_DISP.Color := clWindow;
          IedPLAZO_MIN_DISP.ReadOnly := False;
          IedPLAZO_MAX_DISP.Enabled := True;
          IedPLAZO_MAX_DISP.Color := clWindow;
          IedPLAZO_MAX_DISP.ReadOnly := False;
       end;
   end;
end;

procedure TWCrProducto.cbB_RANGO_IMP_DISPExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_RANGO_IMP_DISP,True,'',True);
end;
{ ----------------------  C O N F I G U R A C I Ó N   C O B R A N Z A   ---------------------- }
procedure TWCrProducto.cbB_COB_ORD_PERExit(Sender: TObject);
begin InterForma1.ValidaExit(cbB_COB_ORD_PER,True,'',True);
end;

procedure TWCrProducto.cbB_COB_ORD_ACCExit(Sender: TObject);
begin InterForma1.ValidaExit(cbB_COB_ORD_ACC,True,'',True);
end;

procedure TWCrProducto.cbB_COB_TOT_PERExit(Sender: TObject);
begin InterForma1.ValidaExit(cbB_COB_TOT_PER,True,'',True);
end;

procedure TWCrProducto.cbB_COB_PARCIALExit(Sender: TObject);
begin InterForma1.ValidaExit(cbB_COB_PARCIAL,True,'',True);
end;

procedure TWCrProducto.rgSIT_PRODUCTOExit(Sender: TObject);
begin InterForma1.ValidaExit(rgSIT_PRODUCTO,True,'',True);
end;

procedure TWCrProducto.btCONFIG_MONEDASClick(Sender: TObject);
Var     RelProdMon      : TCrRePrMn;
begin
   if Objeto.Active then
   Begin
      {$WARNINGS OFF}
      RelProdMon := TCrRePrMn.Create(self);
      {$WARNINGS ON}      
      try
         RelProdMon.Apli:=Objeto.Apli;
         RelProdMon.ParamCre:=Objeto.ParamCre;
         RelProdMon.Producto := Objeto;
         RelProdMon.Catalogo;
      finally
             RelProdMon.Free;
      end;
   end
   else
       ShowMessage('Debe de seleccionar un producto.');
   //end if;
end;

procedure TWCrProducto.edCVE_TIPO_CRED_BCExit(Sender: TObject);
var     VLBandera : Boolean;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLBandera := True;
      Objeto.CVE_TIPO_CRED_BC.GetFromControl;
      If Objeto.CVE_TIPO_CRED_BC.AsString = '' then
          VLBandera := False;
      InterForma1.ValidaExit(edCVE_TIPO_CRED_BC,VLBandera,
                              'Favor de indicar el tipo de Cuenta que hace referencia al Buró de Crédito',True);
   end;
end;

procedure TWCrProducto.rgCVE_CALC_IVA_INTExit(Sender: TObject);
begin InterForma1.ValidaExit(rgCVE_CALC_IVA_INT,True,'',True);
end;

// Inicia Modificación SATV4766 el 15May2006 Credito en Línea
//CLAVES INTERES
procedure TWCrProducto.rgCVE_AJUSTE_F_VTOExit(Sender: TObject);
var  vlMsg     : String;
begin
 vlMsg     := '';
 If (rgCVE_AJUSTE_F_VTO.ItemIndex < 0) Then
   Begin
   vlMsg := 'Favor de Indicar la '+rgCVE_AJUSTE_F_VTO.Caption;
   rgCVE_AJUSTE_F_VTO.ItemIndex := -1;
   End;
 InterForma1.ValidaExit(rgCVE_AJUSTE_F_VTO,vlMsg = '',vlMsg,True);
end;

procedure TWCrProducto.rgCVE_VTO_COMISIONExit(Sender: TObject);
begin
end;
// Termina Modificación SATV4766


procedure TWCrProducto.chB_APL_MOR_INTExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_APL_MOR_INT,True,'',True);
end;

procedure TWCrProducto.chB_REDONDEOExit(Sender: TObject);
begin
 If Not chB_REDONDEO.Checked Then
  Begin
  pgAltaDatos.ActivePageIndex := 3;
  IF cbB_COB_ORD_PER.CanFocus Then cbB_COB_ORD_PER.SetFocus;
  End;
 InterForma1.ValidaExit(chB_REDONDEO,True,'',True);
end;

procedure TWCrProducto.edUNIDAD_REDONDEOExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edUNIDAD_REDONDEO,True,'',True);
end;

procedure TWCrProducto.cbxCVE_AFEC_REDONDEOExit(Sender: TObject);
begin
 InterForma1.ValidaExit(cbxCVE_AFEC_REDONDEO,True,'',True);
end;

procedure TWCrProducto.edNUM_DMIN_REQ_PERExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edNUM_DMIN_REQ_PER,True,'',True);
end;

procedure TWCrProducto.edNUM_DIAS_AGR_PERExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edNUM_DIAS_AGR_PER,True,'',True);
end;


procedure TWCrProducto.chB_AJU_IMP_U_PExit(Sender: TObject);
begin
 pgAltaDatos.ActivePageIndex := 3;
 IF cbB_COB_ORD_PER.CanFocus Then cbB_COB_ORD_PER.SetFocus;
 InterForma1.ValidaExit(chB_AJU_IMP_U_P,True,'',True);
end;

procedure TWCrProducto.ActivaControlesRedondeo(peBActiva : Boolean);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       if not (peBActiva) then
       Begin
          edUNIDAD_REDONDEO.Enabled := False;
          edUNIDAD_REDONDEO.Color := clBtnFace;
          edUNIDAD_REDONDEO.ReadOnly := True;

          cbxCVE_AFEC_REDONDEO.Enabled := False;
          cbxCVE_AFEC_REDONDEO.Color := clBtnFace;
          Objeto.CVE_AFEC_REDONDEO.AsString := C_NO_APLICA;

          chB_AJU_IMP_U_P.Enabled := False;
          chB_AJU_IMP_U_P.Checked := False;
          //### BEGIN   DEINTEC.DF     30 MAYO.2008   DESCUENTOS MERCANTILES
          if rgCVE_CAL_CAPITAL.ItemIndex = 1 then
          begin
            chB_AJU_IMP_U_P.Enabled := True;
          end;
          //### END   DEINTEC.DF     30 MAYO.2008   DESCUENTOS MERCANTILES
       end
       else
       Begin
          edUNIDAD_REDONDEO.Enabled := True;
          edUNIDAD_REDONDEO.Color := clWindow;
          edUNIDAD_REDONDEO.ReadOnly := False;

          cbxCVE_AFEC_REDONDEO.Enabled := True;
          cbxCVE_AFEC_REDONDEO.Color := clWindow;

          chB_AJU_IMP_U_P.Enabled := True;
       end;
   end;
end;

procedure TWCrProducto.chB_REDONDEOClick(Sender: TObject);
begin
 ActivaControlesRedondeo(chB_REDONDEO.Checked);
end;

procedure TWCrProducto.btCVE_GEN_TIP_PAGClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPRODUCT_TPAGO',True,True) then
   begin
     With Objeto Do
       Begin
       If TipoPago.Busca Then
          Begin
          CVE_GEN_TIP_PAG.AsString := TipoPago.CVE_REFERENCIA.AsString;
          InterForma1.NextTab(edCVE_GEN_TIP_PAG);
          End;
       End;
   end;
end;

procedure TWCrProducto.edCVE_GEN_TIP_PAGExit(Sender: TObject);
var  VLBandera  :  boolean;
     VLMesg     :  String;
Begin
   VLMesg     := '';
   VLbandera := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.CVE_GEN_TIP_PAG.GetFromControl;
      if Objeto.CVE_GEN_TIP_PAG.AsString = '' then Begin
         VLbandera := False;
         VLMesg := 'Favor de indicar el Tipo de Pago a usar';
      end;
      InterForma1.ValidaExit(edCVE_GEN_TIP_PAG,VLBandera,VLMesg,True);
   end;
end;

procedure TWCrProducto.btCVE_GEN_TIP_PAGExit(Sender: TObject);
begin
 InterForma1.ValidaExit(btCVE_GEN_TIP_PAG,True,'',True);
end;

procedure TWCrProducto.ilCVE_GEN_TIP_PAGCapture(
  Sender: TObject; var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrProducto.ilCVE_GEN_TIP_PAGEjecuta(
  Sender: TObject);
begin
 With Objeto Do
  If TipoPago.FindKey([C_GRUPO_CLAVE_TIPPAG, ilCVE_GEN_TIP_PAG.Buffer]) Then
    Begin
    CVE_GEN_TIP_PAG.AsString := TipoPago.CVE_REFERENCIA.AsString;
    End;
end;

procedure TWCrProducto.cbB_GENERA_EDOCTAExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then Begin
     if cbB_GENERA_EDOCTA.Checked then begin
        iedDIA_GEN_EDO_CTA.Enabled := True;
        iedDIA_GEN_EDO_CTA.Color := clWindow;
//        iedDIA_GEN_EDO_CTA.Text := '0';
     end
     else Begin
        iedDIA_GEN_EDO_CTA.Enabled := False;
        iedDIA_GEN_EDO_CTA.Color := clBtnFace;
//        iedDIA_GEN_EDO_CTA.Text := '0';
     end;
   end;
   InterForma1.ValidaExit(cbB_GENERA_EDOCTA,True,'',True);
end;

procedure TWCrProducto.iedDIA_GEN_EDO_CTAExit(Sender: TObject);
var  vlBandera  :  boolean;
     vlMesg     :  String;
Begin
   vlMesg     := ''; vlBandera := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.DIA_GEN_EDO_CTA.GetFromControl;
      If Objeto.DIA_GEN_EDO_CTA.AsInteger < 0 then
      Begin
           vlMesg :='No se Admiten números negativos';
           vlBandera := False;
      end;
      InterForma1.ValidaExit(iedDIA_GEN_EDO_CTA,vlBandera,vlMesg,True);
   end;
end;

procedure TWCrProducto.cbB_GENERA_EDOCTAClick(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
     if cbB_GENERA_EDOCTA.Checked then begin
        iedDIA_GEN_EDO_CTA.Enabled := True;
        iedDIA_GEN_EDO_CTA.Color := clWindow;
//        iedDIA_GEN_EDO_CTA.Text := '0';
     end
     else Begin
        iedDIA_GEN_EDO_CTA.Enabled := False;
        iedDIA_GEN_EDO_CTA.Color := clBtnFace;
//        iedDIA_GEN_EDO_CTA.Text := '0';
     end;
   end;

end;

procedure TWCrProducto.chB_GEN_CONT_CCExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_GEN_CONT_CC,True,'',True);
end;

procedure TWCrProducto.chB_GEN_CONT_PROVExit(Sender: TObject);
begin InterForma1.ValidaExit(chB_GEN_CONT_PROV,True,'',True);
end;

procedure TWCrProducto.chB_REP_REG_CNBVExit(Sender: TObject);
begin
    InterForma1.ValidaExit(chB_REP_REG_CNBV,True,'',True);
{ROIM 04/05/2007 CAMBIO CHEQUERAS SOBREGIRO}
//    pgAltaDatos.ActivePageIndex := 1; //easa4011      23/01/2005
//    if chB_DIAS_ADIC_PAGO.CanFocus then
//       chB_DIAS_ADIC_PAGO.SetFocus;
    //end fi
{/ROIM}
end;

procedure TWCrProducto.chB_EXCESO_EVEExit(Sender: TObject);
begin
    // InterForma1.ValidaExit(chB_EXCESO_EVE,True,'',True);
    pgAltaDatos.ActivePageIndex := 1;
end;

procedure TWCrProducto.cbB_DISP_EN_LINEAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(cbB_DISP_EN_LINEA,True,'',True);  // SATV4766
end;

procedure TWCrProducto.IedIMP_MIN_DOCTOExit(Sender: TObject);
var  VLBandera  :  boolean;
     VLMesg     :  String;
Begin
   VLMesg     := '';
   vlBandera := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.IMP_MIN_DOCTO.GetFromControl;
      if Objeto.IMP_MIN_DOCTO.AsFloat < 0 then
      Begin
         vlBandera := False;
         vlMesg := 'El importe no puede ser negativo';
      end;
      InterForma1.ValidaExit(IedIMP_MIN_DOCTO,VLBandera,VLMesg,True);
   end;
end;

procedure TWCrProducto.chB_SOBREGIROExit(Sender: TObject);
begin
    InterForma1.ValidaExit(chB_SOBREGIRO,True,'',True);
end;

//---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrProducto.rgCVE_CAL_CAPITALExit(Sender: TObject);
begin
    InterForma1.ValidaExit(rgCVE_CAL_CAPITAL,True,'',True);
end;
//--END

//---BEGIN   DEINTEC.DF 28.MAYO.2008    DESCUENTO MERCANTIL
procedure TWCrProducto.rgCVE_CAL_CAPITALClick(Sender: TObject);
begin
   IF rgCVE_CAL_CAPITAL.ItemIndex = 1 then
       chB_AJU_IMP_U_P.Enabled:= True
   else
       chB_AJU_IMP_U_P.Enabled:= False;
end;
//--END

procedure TWCrProducto.rgCVE_FINANC_ADICExit(Sender: TObject);
begin
    InterForma1.ValidaExit(rgCVE_FINANC_ADIC,True,'',True);
end;

procedure TWCrProducto.cbB_ENVIA_FEExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_ENVIA_FE,True,'',True);
end;

procedure TWCrProducto.ilTASA_REFER_MCapture(Sender: TObject;
  var Show: Boolean);
begin Show := True;
end;

procedure TWCrProducto.ilTASA_REFER_MEjecuta(Sender: TObject);
begin
// asteci.hegc  abril 2010 configurar moratorios
 if Objeto.TasaRefer_M.FindKey([ilTASA_REFER_M.Buffer]) then
       InterForma1.NextTab(edCVE_TASA_REFER_M);
   //end if

end;

procedure TWCrProducto.rgCVE_CALCULO_MClick(Sender: TObject);
begin
   if  rgCve_CALCULO_M.ItemIndex =1
   then
   Begin
     cbOPERADOR_STASA_M.Clear;
     edSOBRETASA_M.Clear;
     edCVE_TASA_REFER_M.Clear;
     edDESC_TASA_REFER_M.Clear;
     cbOPERADOR_STASA_M.enabled:=false;
     edSOBRETASA_M.Enabled:=false;
     edCVE_TASA_REFER_M.Enabled:=false;
     btTASA_REFER_M.Enabled:=false;

   End
   else
   Begin
     cbOPERADOR_STASA_M.enabled:=true;
     edSOBRETASA_M.Enabled:=true;
     edCVE_TASA_REFER_M.Enabled:=true;
     btTASA_REFER_M.Enabled:=true;
   End

end;

procedure TWCrProducto.rgCVE_CALCULO_MExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_CALCULO_M,True,'',True);
if  rgCve_CALCULO_M.ItemIndex =1
   then
   Begin
     cbOPERADOR_STASA_M.Clear;
     edSOBRETASA_M.Clear;
     edCVE_TASA_REFER_M.Clear;
     edDESC_TASA_REFER_M.Clear;
     cbOPERADOR_STASA_M.enabled:=false;
     edSOBRETASA_M.Enabled:=false;
     edCVE_TASA_REFER_M.Enabled:=false;
     btTASA_REFER_M.Enabled:=false;

   End
   else
   Begin
     cbOPERADOR_STASA_M.enabled:=true;
     edSOBRETASA_M.Enabled:=true;
     edCVE_TASA_REFER_M.Enabled:=true;
     btTASA_REFER_M.Enabled:=true;
end;

end;

procedure TWCrProducto.edCVE_TASA_REFER_MExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     Objeto.CVE_TASA_REFER_M.GetFromControl;
     InterForma1.ValidaExit(edCVE_TASA_REFER_M,True,'',True);
   end;

end;

procedure TWCrProducto.btTASA_REFER_MClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPRODUCT_TSREF',True,True) then
   begin
     Objeto.TasaRefer_M.ShowAll := True;
     if Objeto.TasaRefer_M.Busca then
     Begin
        MuestraHints;
        InterForma1.NextTab(edCVE_TASA_REFER_M);
     end;
   end;
end;

procedure TWCrProducto.btTASA_REFER_MExit(Sender: TObject);
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     Objeto.CVE_TASA_REFER_M.GetFromControl;
     InterForma1.ValidaExit(edCVE_TASA_REFER_M,True,'',True);
   end;
end;

procedure TWCrProducto.cbOPERADOR_STASA_MExit(Sender: TObject);
var vlSalida : Boolean;
    vlMesg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlMesg   := '';
     vlSalida := True;
     Objeto.OPERADOR_STASA_M.GetFromControl;
     if (Objeto.OPERADOR_STASA_M.AsString = '') AND ( rgCVE_CALCULO_M.ItemIndex=0) then
     Begin
        vlSalida := False;
        vlMesg := 'Indique el Operador de la Sobretasa';
     end;
     InterForma1.ValidaExit(cbOPERADOR_STASA_M,vlSalida,vlMesg,True);
   end;
end;

procedure TWCrProducto.cbOPERADOR_STASA_MKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Not((key=Char(42)) or (key=Char(43)) or (key=Char(45)) or (key=Char(47)) or (key=Char(8)) or (key=Char(13)))  then
     begin
          Key:=Char(0);
          InterForma1.ShowMsgPanel('Solo se permiten + , - , / , * ');
     end;
end;

procedure TWCrProducto.edSOBRETASA_MExit(Sender: TObject);
var     vlSalida        : Boolean;
        VlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlMsg   := '';
     vlSalida := True;
     Objeto.SOBRETASA_M.GetFromControl;
     Objeto.CVE_TASA_REFER_M.GetFromControl;
     if (Objeto.SOBRETASA_M.AsString = '') and (rgCve_calculo_m.ItemIndex=0) then
     Begin
        vlSalida := False;
        vlMsg := 'Indique de favor la Sobretasa';
     end;
     InterForma1.ValidaExit(edSOBRETASA_M,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrProducto.chB_REESTRUCTURAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(chB_REESTRUCTURA,True,'',True);

    //ROUY4095 082014 Se mueve salto de página al nuevo campo B_LINEA_CREDITO
end;

procedure TWCrProducto.chB_APL_PAG25RENExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_APL_PAG25REN,True,'',True);
end;

procedure TWCrProducto.chB_PLAZO_REExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_PLAZO_RE,True,'',True);
end;

procedure TWCrProducto.chB_PLAZO_RSExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_PLAZO_RS,True,'',True);
end;

procedure TWCrProducto.chB_LINEA_CREDITOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(chB_LINEA_CREDITO,True,'',True);

    //ROUY4095 082014 Se mueve salto de página al nuevo campo B_LINEA_CREDITO
    {ROIM 04/05/2007 CAMBIO CHEQUERAS SOBREGIRO}
    pgAltaDatos.ActivePageIndex := 1;
    if chB_DIAS_ADIC_PAGO.CanFocus then
       chB_DIAS_ADIC_PAGO.SetFocus
    else
       chB_PER_MORAL.CanFocus;
    //   end fi
{/ROIM}
end;

procedure TWCrProducto.bbtnBitProdClick(Sender: TObject);
Var
    BitUpdProd : TCrbitprod;
begin
   If Objeto.ValidaAccesoEsp('TCRPRODUCT_RBIT',True,True) then
   Begin
       {$WARNINGS OFF}
       BitUpdProd := TCrbitprod.Create(Self);
       {$WARNINGS ON}
       try
          BitUpdProd.Apli:=Objeto.Apli;
          BitUpdProd.ParamCre:=Objeto.ParamCre;
          BitUpdProd.Catalogo;
       finally
             if BitUpdProd <> nil then
                BitUpdProd.Free;
             //end if
       end;
   end;
end;

end.
