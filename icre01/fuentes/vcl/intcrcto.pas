{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}                              //intscreccaj
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
// Sistema         : Clase de CR_CONTRATO
// Fecha de Inicio : 06/06/2003
// Función forma   : Clase de CR_CONTRATO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
//Modificaciones   : EASA4011 23/01/2006 modificacion Requerimiento de Excesos
//                   LOLS4601 28/06/2006 crédito en linea - comisiones

Unit IntCrCto;

interface 

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntCtoPanel,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Menus, InterEdit, IntLinkit,ToolWin,

//Unidades Adicionales
        IntParamCre, IntGenCre,
        IntCrProduct,   //Producto Credito
        IntCrAcredit,   //acreditado
        IntCtoHeader,   //Contrato
        IntCrOrigRec,   //Origen de Recursos
        IntCrDestino,   //Destino
        IntMon,         //Moneda
        IntTasIndFin,   //Tasa Refer
        IntPers,        //Personas
        IntMPers, //PROM ADMON
        IntMRecTra,     //Tramites de Documentos
        IntCrCreMar,    //Disposición marco LOLS CREDITO EN LINEA
        IntCrPctCapi,   //Grupo Porcentaje de Capitalización
        IntCrCartrIm,
        IntCrCtoEstruc, //Calificacion de contratos estrucutrados
        IntCrPortafo,   // Asociación de la Linea con el Portafolio de Crédito
        IntCrprodbca,   // Catálogo Producto BCA 017
        IntCrUniTie     //Unidad de tiempo
        ;

CONST
   //TIPO INSCRIPCION
   CO_FEDERAL = 'FE';
   CO_FED_EST = 'ES';
   //FUENTE DE PAGO
   CO_F_MAESTRO = 'FM';
   CO_C_MANDATO = 'CM';
   CO_CARTA = 'CT';
Type
 TCrCto= class;

  TBlinkLabel = class (TLabel)
  private
    Timer: TTimer;
    procedure TimerTimer (Sender: TObject);
    procedure SetInterval (Value: cardinal);
    procedure SetActive (Value: boolean);
    function GetInterval: cardinal;
    function GetActive: boolean;
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Active: boolean read GetActive write SetActive;
    property Interval: cardinal read GetInterval write SetInterval;
  end;

  TWCrCto=Class(TForm)
    InterForma1 : TInterForma;
    gbFOLIO: TGroupBox;
    lbFOL_CONTRATO: TLabel;
    icpCONTRATO: TInterCtoPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilPRODUCTO: TInterLinkit;
    ilACREDITADO: TInterLinkit;
    pmAcreditado: TPopupMenu;
    ConsultaSectorPersona1: TMenuItem;
    CatlogodePersona1: TMenuItem;
    ilTASA_REFER: TInterLinkit;
    MainMenu1: TMainMenu;
    Autorizacin1: TMenuItem;
    Documentacin1: TMenuItem;
    Agronegocios1: TMenuItem;
    Garantas1: TMenuItem;
    SIEBAN1: TMenuItem;
    ilREQ_PCT_CAPITALIZ: TInterLinkit;
    ilMONEDA: TInterLinkit;
    N1: TMenuItem;
    Comisiones1: TMenuItem;
    IncrementoDecementodeTemporada1: TMenuItem;
    AccesoProducto1: TMenuItem;
    ilORIG_REC: TInterLinkit;
    InterLinkit1: TInterLinkit;
    InterLinkit2: TInterLinkit;
    N2: TMenuItem;
    CalificacionCreditoEstructurado1: TMenuItem;
    N3: TMenuItem;
    DarVistoBuenodelAnalista1: TMenuItem;
    VerVistosBuenosdelAnalista1: TMenuItem;
    EstadosyMunicipios1: TMenuItem;
    N4: TMenuItem;
    spElimina: TStoredProc;
    PortafoliodeCrdito1: TMenuItem;
    ilCVE_PRODUCTO_BCA: TInterLinkit;
    mnComplementos: TMenuItem;
    ilDEST_CRED: TInterLinkit;
    InterLinkit3: TInterLinkit;
    qEstadosMpios: TQuery;
    lbSITLINEA: TLabel;
    MsgPanel: TPanel;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    lbSIT_LINEA: TLabel;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    lbCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    lbCVE_USU_AUTORIZA: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_AUTORIZA: TEdit;
    PageCon_Datos: TPageControl;
    TabSheet1: TTabSheet;
    lbCVE_PRODUCTO_CRE: TLabel;
    Label7: TLabel;
    lbCVE_ORIGEN_REC: TLabel;
    lbCVE_DESTINO: TLabel;
    lbPromAdmon: TLabel;
    lbCVE_CARACT_CTO: TLabel;
    lbCVE_COMPROB_ING: TLabel;
    lbCVE_SEC_LABORAL: TLabel;
    LBIMP_INGRESOS_ACR: TLabel;
    Label25: TLabel;
    Bevel9: TBevel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO: TEdit;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    edCVE_ORIGEN_REC: TEdit;
    edCVE_DESTINO: TEdit;
    btCVE_ORIGEN_REC: TBitBtn;
    btCVE_DESTINO: TBitBtn;
    edDESC_ORIGEN_REC: TEdit;
    edDESC_DESTINO: TEdit;
    edSECTOR_CORP: TEdit;
    btPROM_ADM: TBitBtn;
    edNAME_PROM_ADM: TEdit;
    edID_PROM_ADM: TEdit;
    edCVE_CARACT_CTO: TEdit;
    btCVE_CARACT_CTO: TBitBtn;
    edDES_CVE_CARACT_CTO: TEdit;
    btCVE_COMPROB_ING: TBitBtn;
    btCVE_SEC_LABORAL: TBitBtn;
    edCVE_COMPROB_ING: TEdit;
    edCVE_SEC_LABORAL: TEdit;
    edDESC_CVE_SEC_LABORAL: TEdit;
    edDES_CVE_COMPROB_ING: TEdit;
    edIMP_INGRESOS_ACR: TInterEdit;
    chB_ESTRUCTURADO: TCheckBox;
    chB_EVENTUAL: TCheckBox;
    chB_REESTRUCTURA: TCheckBox;
    chB_PARAMETRICO: TCheckBox;
    chB_FINAN_CALIF: TCheckBox;
    chB_APL_CONVE_MOD: TCheckBox;
    chB_APL_RENOVACION: TCheckBox;
    cbB_DISP_EN_LINEA: TCheckBox;
    chB_EMPLEADO: TCheckBox;
    TabSheet2: TTabSheet;
    gbCONFIG_CRED: TGroupBox;
    Bevel3: TBevel;
    lbOPERADOR_STASA: TLabel;
    lbSOBRETASA: TLabel;
    lbTX_COND_GRALES: TLabel;
    lbCVE_TASA_REFER: TLabel;
    lbCVE_MONEDA: TLabel;
    Label8: TLabel;
    Label23: TLabel;
    Label10: TLabel;
    lbCVE_SUB_TIP_COB: TLabel;
    lbID_CREDITO_MARCO: TLabel;
    lbROE_BRUTA: TLabel;
    lbROE_NETA: TLabel;
    lbPCT_REQ_CAP_MER: TLabel;
    lbPCT_REQ_CAP_CRE: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label9: TLabel;
    lbNO_CONSUL_BURO: TLabel;
    Bevel6: TBevel;
    Label11: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    btTASA_REFER: TBitBtn;
    edDESC_TASA_REFER: TEdit;
    cbOPERADOR_STASA: TComboBox;
    mTX_COND_GRALES: TMemo;
    edCVE_TASA_REFER: TEdit;
    edSOBRETASA: TInterEdit;
    edDESC_MONEDA: TEdit;
    edTASA_BASE: TInterEdit;
    btCVE_GPO_CAPITALIZ: TBitBtn;
    edPCT_CAPITALIZA: TEdit;
    edDESC_CAPITALIZA: TEdit;
    edCVE_GPO_CAPITALIZ: TEdit;
    edCVE_MONEDA: TEdit;
    btMONEDA: TBitBtn;
    edMAX_PZO_DISP: TInterEdit;
    edMAX_DIAS_DISPON: TInterEdit;
    edMAX_TASA: TInterEdit;
    cbMAX_TASA: TCheckBox;
    cbMAX_DIAS_DISPON: TCheckBox;
    cbMAX_PZO_DISP: TCheckBox;
    cbCVE_SUB_TIP_COB: TComboBox;
    btnCREDITO_MARCO: TBitBtn;
    edID_CREDITO_MARCO: TEdit;
    edROE_BRUTA: TInterEdit;
    edROE_NETA: TInterEdit;
    edPCT_REQ_CAP_MER: TInterEdit;
    edPCT_REQ_CAP_CRE: TInterEdit;
    BitBtn1: TBitBtn;
    edDESC_TIPO_ALTA: TEdit;
    edCVE_TIPO_ALTA: TEdit;
    edPCT_CAPITALIZ: TInterEdit;
    edID_AVAL_GOB: TEdit;
    chkB_HIT_SIC: TCheckBox;
    edNO_CONSUL_BURO: TInterEdit;
    edCVE_PRODUCTO_BCA: TEdit;
    btnCVE_PRODUCTO_BCA: TBitBtn;
    edDESC_PROD_BCA: TEdit;
    edPeriodicidad_CAT: TEdit;
    btnPeriodicidad_CAT: TBitBtn;
    edDesc_Periodicidad_CAT: TEdit;
    edPeriodicidad_Interes: TEdit;
    edDesc_Periodicidad_Interes: TEdit;
    btnPeriodicidad_Interes: TBitBtn;
    EdCod_CNBV: TEdit;
    edDESC_ACRED_GOB: TEdit;
    btnID_ACRED_GOB: TBitBtn;
    edCVE_ANALISTA_RES: TEdit;
    btCVE_ANALISTA_RES: TBitBtn;
    Bevel1: TBevel;
    lbIMP_AUTORIZADO: TLabel;
    lbIMP_DISPUESTO: TLabel;
    Label12: TLabel;
    lbIMP_TRANSITO: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label17: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbBloqueado: TLabel;
    Label19: TLabel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    edIMP_AUTORIZADO: TInterEdit;
    edIMP_DISPUESTO: TInterEdit;
    iedDISPONIBLE_AUT: TInterEdit;
    edIMP_FINANC_ADIC: TInterEdit;
    iedRIESGO_TOTAL: TInterEdit;
    iedDISPONIBLE_ACRED: TInterEdit;
    edDISPONIBLE_GRUPO_ECO: TInterEdit;
    edIMP_BLOQUEADO: TInterEdit;
    Bevel4: TBevel;
    lbF_AUT_COMITE: TLabel;
    lbDIAS_PLAZO: TLabel;
    lbF_VENCIMIENTO: TLabel;
    Bevel5: TBevel;
    lbCVE_COMITE_AUT: TLabel;
    dtpF_AUT_COMITE: TInterDateTimePicker;
    edF_AUT_COMITE: TEdit;
    edDIAS_PLAZO: TInterEdit;
    btPLAZOCREDITO: TBitBtn;
    edF_VENCIMIENTO: TEdit;
    dtpF_VENCIMIENTO: TInterDateTimePicker;
    edCVE_COMITE_AUT: TEdit;
    Label26: TLabel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Label29: TLabel;
    Label18: TLabel;
    Label31: TLabel;
    SpeedButton1: TSpeedButton;
    edIMP_EXCESO_EVE: TInterEdit;
    edF_VTO_EXCESO: TEdit;
    edIMP_AUT_ORIG: TInterEdit;
    Label27: TLabel;
    Bevel12: TBevel;
    chB_REVOLVENTE: TCheckBox;
    chB_APL_PRORROGA: TCheckBox;
    chB_FINANC_ADIC: TCheckBox;
    chB_APL_EVEN_ACEL: TCheckBox;
    chB_EMPROBLEMADA: TCheckBox;
    chB_RAMO_28: TCheckBox;
    chCVE_FORMA_DISP: TCheckBox;
    chB_LITIGIOSO: TCheckBox;
    chkB_TIPO_LINEA: TCheckBox;
    chkB_PRELACION_PGO: TCheckBox;
    chkB_REPORTE_SIC: TCheckBox;
    edF_REP_SIC: TEdit;
    Fecha: TLabel;
    edpF_REP_SIC: TInterDateTimePicker;
    Label21: TLabel;
    edCve_Tipo_Baja: TEdit;
    btnCve_Tipo_Baja: TBitBtn;
    edDesc_Tipo_Baja: TEdit;
    Label28: TLabel;
    edF_Baja: TEdit;
    edpF_Baja: TInterDateTimePicker;

    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure edF_AUT_COMITEExit(Sender: TObject);
    procedure edCVE_COMITE_AUTExit(Sender: TObject);
    procedure edDIAS_PLAZOExit(Sender: TObject);
    procedure edF_VENCIMIENTOExit(Sender: TObject);
    procedure chB_EVENTUALExit(Sender: TObject);
    procedure chB_LITIGIOSOExit(Sender: TObject);
    procedure chB_REESTRUCTURAExit(Sender: TObject);
    procedure edCVE_TASA_REFERExit(Sender: TObject);
    procedure cbOPERADOR_STASAExit(Sender: TObject);
    procedure edSOBRETASAExit(Sender: TObject);
    procedure edIMP_AUTORIZADOExit(Sender: TObject);
    procedure mTX_COND_GRALESExit(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilTASA_REFEREjecuta(Sender: TObject);
    procedure btTASA_REFERClick(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure edACREDITADOExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure mTX_COND_GRALESKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    Function  VentanaCalculo(pDato : String): string;
    procedure btPLAZOCREDITOClick(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure btCVE_ORIGEN_RECClick(Sender: TObject);
    procedure ilORIG_RECEjecuta(Sender: TObject);
    procedure btCVE_DESTINOClick(Sender: TObject);
    procedure ilDEST_CREDEjecuta(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure chB_FINANC_ADICExit(Sender: TObject);
    procedure chB_REVOLVENTEExit(Sender: TObject);
    procedure btDOCUMENTOSClick(Sender: TObject);
    procedure btGARANTIASClick(Sender: TObject);
    procedure btSIEBANClick(Sender: TObject);
    procedure btPOLIZASClick(Sender: TObject);
    procedure edTASA_BASEExit(Sender: TObject);
    procedure ConsultaSectorPersona1Click(Sender: TObject);
    procedure CatlogodePersona1Click(Sender: TObject);
    procedure Documentacin1Click(Sender: TObject);
    procedure Garantas1Click(Sender: TObject);
    procedure SIEBAN1Click(Sender: TObject);
    procedure CheckBox3Exit(Sender: TObject);
    procedure chB_FINAN_CALIFExit(Sender: TObject);
    procedure chB_APL_CONVE_MODExit(Sender: TObject);
    procedure chB_APL_PRORROGAExit(Sender: TObject);
    procedure chB_PARAMETRICOExit(Sender: TObject);
    procedure chB_APL_EVEN_ACELExit(Sender: TObject);
    procedure btCVE_GPO_CAPITALIZClick(Sender: TObject);
    procedure ilREQ_PCT_CAPITALIZEjecuta(Sender: TObject);
    procedure chB_APL_RENOVACIONExit(Sender: TObject);
    procedure chB_APL_INSCR_DEUDClick(Sender: TObject);
    procedure btMONEDAClick(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure Comisiones1Click(Sender: TObject);
    procedure cbB_DISP_EN_LINEAExit(Sender: TObject);
    procedure cbMAX_PZO_DISPExit(Sender: TObject);
    procedure edMAX_PZO_DISPExit(Sender: TObject);
    procedure cbMAX_DIAS_DISPONExit(Sender: TObject);
    procedure edMAX_DIAS_DISPONExit(Sender: TObject);
    procedure cbMAX_TASAExit(Sender: TObject);
    procedure edMAX_TASAExit(Sender: TObject);
    procedure cbMAX_PZO_DISPClick(Sender: TObject);
    procedure cbMAX_DIAS_DISPONClick(Sender: TObject);
    procedure cbMAX_TASAClick(Sender: TObject);
    procedure IncrementoDecementodeTemporada1Click(Sender: TObject);
    procedure cbCVE_SUB_TIP_COBExit(Sender: TObject);
    procedure btnCREDITO_MARCOClick(Sender: TObject);
    procedure btnCREDITO_MARCOExit(Sender: TObject);
    procedure AccesoProducto1Click(Sender: TObject);
    procedure btPROM_ADMClick(Sender: TObject);
    procedure edROE_BRUTAExit(Sender: TObject);
    procedure edROE_NETAExit(Sender: TObject);
    procedure edPCT_REQ_CAP_MERExit(Sender: TObject);
    procedure edPCT_REQ_CAP_CREExit(Sender: TObject);
    procedure btCVE_CARACT_CTOClick(Sender: TObject);
    procedure btCVE_SEC_LABORALClick(Sender: TObject);
    procedure btCVE_COMPROB_INGClick(Sender: TObject);
    procedure edCVE_CARACT_CTOExit(Sender: TObject);
    procedure edCVE_COMPROB_INGExit(Sender: TObject);
    procedure edCVE_SEC_LABORALExit(Sender: TObject);
    procedure edIMP_INGRESOS_ACRExit(Sender: TObject);
    procedure edNO_CONSUL_BUROExit(Sender: TObject);
    procedure ilCVE_COMPROB_INGCapture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit1Ejecuta(Sender: TObject);
    procedure InterLinkit3Ejecuta(Sender: TObject);
    procedure InterLinkit2Ejecuta(Sender: TObject);
    procedure edPCT_CAPITALIZExit(Sender: TObject);
    procedure chB_EMPROBLEMADAExit(Sender: TObject);
    procedure chB_EMPLEADOExit(Sender: TObject);
    procedure chB_RAMO_28Exit(Sender: TObject);
    procedure chB_ESTRUCTURADOExit(Sender: TObject);
    procedure CalificacionCreditoEstructurado1Click(Sender: TObject);
    procedure edID_AVAL_GOBExit(Sender: TObject);
    procedure btnID_ACRED_GOBClick(Sender: TObject);
    procedure btnID_ACRED_GOBExit(Sender: TObject);
    procedure btCVE_ANALISTA_RESClick(Sender: TObject);
    procedure DarVistoBuenodelAnalista1Click(Sender: TObject);
    procedure VerVistosBuenosdelAnalista1Click(Sender: TObject);
    procedure btCVE_ANALISTA_RESExit(Sender: TObject);
    procedure EstadosyMunicipios1Click(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure PortafoliodeCrdito1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure btnCVE_PRODUCTO_BCAClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_BCAEjecuta(Sender: TObject);
    procedure edCVE_PRODUCTO_BCAExit(Sender: TObject);
    procedure mnComplementosClick(Sender: TObject);
    procedure edPeriodicidad_CATExit(Sender: TObject);
    procedure btnPeriodicidad_CATClick(Sender: TObject);
    procedure edPeriodicidad_InteresExit(Sender: TObject);
    procedure btnPeriodicidad_InteresClick(Sender: TObject);
    // --- INICIO --- ASOR --- MAYO 2016 ---
    procedure EdCod_CNBVExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure chkB_PRELACION_PGOExit(Sender: TObject);
    procedure edCVE_ORIGEN_RECExit(Sender: TObject);
    procedure edCVE_DESTINOExit(Sender: TObject);
    procedure edDESC_ORIGEN_RECExit(Sender: TObject);
    procedure edDESC_DESTINOExit(Sender: TObject);
    procedure btCVE_DESTINOExit(Sender: TObject);
    procedure edID_PROM_ADMExit(Sender: TObject);
    procedure edPROM_ADMExit(Sender: TObject);
    procedure edNAME_PROM_ADMExit(Sender: TObject);
    procedure edDES_CVE_CARACT_CTOExit(Sender: TObject);
    procedure edDES_CVE_COMPROB_INGExit(Sender: TObject);
    procedure edDESC_CVE_SEC_LABORALExit(Sender: TObject);
    procedure edIMP_DISPUESTOExit(Sender: TObject);
    procedure edIMP_BLOQUEADOExit(Sender: TObject);
    procedure iedDISPONIBLE_AUTExit(Sender: TObject);
    procedure iedDISPONIBLE_ACREDExit(Sender: TObject);
    procedure edDISPONIBLE_GRUPO_ECOExit(Sender: TObject);
    procedure edIMP_FINANC_ADICExit(Sender: TObject);
    procedure iedRIESGO_TOTALExit(Sender: TObject);
    procedure edF_VTO_EXCESOExit(Sender: TObject);
    procedure edIMP_AUT_ORIGExit(Sender: TObject);
    procedure edIMP_EXCESO_EVEExit(Sender: TObject);
    procedure chCVE_FORMA_DISPExit(Sender: TObject);
    procedure chkB_TIPO_LINEAExit(Sender: TObject);
    procedure btPROM_ADMExit(Sender: TObject);
    procedure edDESC_MONEDAExit(Sender: TObject);
    procedure edDESC_TASA_REFERExit(Sender: TObject);
    procedure edCVE_GPO_CAPITALIZExit(Sender: TObject);
    procedure edPCT_CAPITALIZAExit(Sender: TObject);
    procedure edDESC_CAPITALIZAExit(Sender: TObject);
    procedure edID_CREDITO_MARCOExit(Sender: TObject);
    procedure edDESC_ACRED_GOBExit(Sender: TObject);
    procedure edCVE_ANALISTA_RESExit(Sender: TObject);
    procedure edDESC_TIPO_ALTAExit(Sender: TObject);
    procedure chkB_HIT_SICExit(Sender: TObject);
    procedure edF_REP_SICExit(Sender: TObject);
    procedure edpF_REP_SICExit(Sender: TObject);
    procedure edDESC_PROD_BCAExit(Sender: TObject);
    procedure edDesc_Periodicidad_CATExit(Sender: TObject);
    procedure edCVE_TIPO_ALTAExit(Sender: TObject);
    procedure chkB_REPORTE_SICExit(Sender: TObject);
    procedure edCve_Tipo_BajaExit(Sender: TObject);
    procedure edF_BajaExit(Sender: TObject);
    procedure edpF_BajaExit(Sender: TObject);
    procedure edDesc_Tipo_BajaExit(Sender: TObject);
    procedure btnCve_Tipo_BajaClick(Sender: TObject);
    // --- FIN --- ASOR --- MAYO 2016 ---

    private
    { Private declarations }
       lblProducto: TBlinkLabel;
       vgAcreditado : String;
       vIdContrato : Integer;
       Procedure VerificaTasaRefer;
       Procedure VerfBanderas;
       Procedure ObtenExceso(peIdAcreditado, peIdContrato: String);
       //LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT
       procedure OnOffTipoCobAn;
       //ENDS_LOLS
        procedure HabilitaCtrlDispLinea;
       procedure HabilitaCtrlInscDeuda(peB_HABILITA : Boolean);
       procedure HabilitaCtrl(peInterEdit : TInterEdit; peB_HABILITA : Boolean);
       procedure HabilitaControles;
       function ValidaRFC: Boolean;
       // Se agrega validacion para que solo personas autorizadas puedan dar el VObo del analista RIRA4281 4Jun2010
       Function  ObtPermisoMod(peCVE_OPER_ACC: String): Boolean;

       procedure ObtenProductoEdosMun;

    public
    { Public declarations }
    Objeto : TCrCto;
    Procedure MuestraHints;
end;
 TCrCto= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CONTRATO              : TInterCampo;
        FOL_CONTRATO             : TInterCampo;
        CVE_PRODUCTO_CRE         : TInterCampo;
        B_EVENTUAL               : TInterCampo;
        B_LITIGIOSO              : TInterCampo;
        B_REESTRUCTURA           : TInterCampo;
        F_AUT_COMITE             : TInterCampo;
        CVE_COMITE_AUT           : TInterCampo;
        CVE_USU_AUTORIZA         : TInterCampo;
        DIAS_PLAZO               : TInterCampo;
        F_VENCIMIENTO            : TInterCampo;
        CVE_TASA_REFER           : TInterCampo;
        OPERADOR_STASA           : TInterCampo;
        SOBRETASA                : TInterCampo;
        DIAS_TOLERANCIA          : TInterCampo;
        IMP_AUTORIZADO           : TInterCampo;
        IMP_DISPUESTO            : TInterCampo;
        IMP_TRANSITO             : TInterCampo;
        TX_COND_GRALES           : TInterCampo;
        SIT_LINEA                : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_CANCELA                : TInterCampo;
        CVE_USU_CANCELA          : TInterCampo;
        DISPONIBLE_AUT           : TInterCampo;
        DISPONIBLE_ACRED         : TInterCampo;
        CVE_ORIGEN_REC           : TInterCampo;
        CVE_DESTINO              : TInterCampo;
        DISPONIBLE_GRUPO_ECO     : TInterCampo;
        CVE_MONEDA               : TInterCampo;
        B_REVOLVENTE             : TInterCampo;
        B_FINANC_ADIC            : TInterCampo;
        TOTAL_FINANC_ADIC        : TInterCampo;
        RIESGO_TOTAL             : TInterCampo;
        TASA_BASE                : TInterCampo; //EASA 28052004
        //B_APL_INSCR_DEUD         : TInterCampo; //EASA 13042005 GOBMUN
        //CVE_TIP_INSCR_D          : TInterCampo; //EASA 13042005 GOBMUN
        //NUM_INSCR_DEUDA          : TInterCampo; //EASA 13042005 GOBMUN
        //F_ALTA_INSCR_DEU         : TInterCampo; //EASA 13042005 GOBMUN
        //F_PROG_INSCR_D           : TInterCampo; //EASA 13042005 GOBMUN
        B_PARAMETRICO            : TInterCampo; //EASA 13042005 GOBMUN
        B_FINAN_CALIF            : TInterCampo; //EASA 13042005 GOBMUN
        B_APL_CONVE_MOD          : TInterCampo; //EASA 13042005 GOBMUN
        B_APL_EVEN_ACEL          : TInterCampo; //EASA 13042005 GOBMUN
        B_APL_PRORROGA           : TInterCampo; //EASA 13042005 GOBMUN
        //CVE_FUENTE_PAGO          : TInterCampo; //EASA 13042005 GOBMUN
        CVE_GPO_CAPITALIZ        : TInterCampo; //EASA 13042005 GOBMUN
        B_APL_RENOVACION         : TInterCampo; //EASA 22042005 GOBMUN
        IMP_EXCESO_EVE           : TInterCampo;//EASA4011       23/01/2006
        F_VTO_EXCESO             : TInterCampo;//EASA4011       23/01/2006
        IMP_AUT_ORIG             : TInterCampo;//EASA4011       23/01/2006

        //Campos nuevos garantias 26/10/2011
       // B_Ins_Irrev         : TInterCampo;
        //B_Mandato           : TInterCampo;
        //B_Gar_Part          : TInterCampo;
        //B_Gar_Aport         : TInterCampo;


        CVE_SUB_TIP_COB          : TInterCampo;//LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT

        IMP_BLOQUEADO            : TInterCampo;//SATV4766       11/JUL/2006
        B_DISP_EN_LINEA          : TInterCampo;//SATV4766       11/JUL/2006
        MAX_PZO_DISP             : TInterCampo;//SATV4766       11/JUL/2006
        MAX_DIAS_DISPON          : TInterCampo;//SATV4766       11/JUL/2006
        MAX_TASA                 : TInterCampo;//SATV4766       11/JUL/2006
        NUM_METODO_DISP          : TInterCampo;//SATV4766       01/AGO/2006
        //
        ID_CREDITO_MARCO         : TInterCampo;//LOLS4601       04/AGO/2006
        //
        ID_PROM_ADMON            : TInterCampo;//EASA4011       09.MAR.2007      Req. Promotor asignado
        NOM_PROM_ADM             : TInterCampo;//EASA4011       09.MAR.2007      Req. Promotor asignado


        ROE_BRUTA                : TInterCampo;
        ROE_NETA                 : TInterCampo;
        PCT_REQ_CAP_MER          : TInterCampo;
        PCT_REQ_CAP_CRE          : TInterCampo;
        PCT_CAPITALIZ            : TIntercampo;
        CVE_CARACT_CTO           : TInterCampo;
        DES_CVE_CARACT_CTO       : TInterCampo;
        CVE_COMPROB_ING          : TInterCampo;
        DES_CVE_COMPROB_ING      : TInterCampo;
        CVE_SEC_LABORAL          : TInterCampo;
        DESC_CVE_SEC_LABORAL     : TInterCampo;
        IMP_INGRESOS_ACR         : TInterCampo;
        NO_CONSUL_BURO           : TInterCampo;

        B_EMPROBLEMADA           : TInterCampo;
        B_EMPLEADO               : TInterCampo;

        B_RAMO_28                : TInterCampo;//SATV4766       03/DIC/2006
        B_ESTRUCTURADO           : TInterCampo;//SATV4766       03/DIC/2006

        ID_AVAL_GOB              : TInterCampo;//RIRA4281 01/06/2010
        DESC_ACRED_GOB           : TInterCampo;

        CVE_ANALISTA_RES         : TInterCampo; //RIRA4281 15/06/2010

        B_TIPO_LINEA             : TInterCampo; //RUCJ4248 22/OCT/2013
        B_PRELACION_PGO          : TInterCampo; //RUCJ4248 22/OCT/2013
        CVE_FORMA_DISP           : TInterCampo; //RUCJ4248 22/OCT/2013
        CVE_TIPO_ALTA            : TInterCampo; //RUCJ4248 22/OCT/2013
        DESC_TIPO_ALTA           : TInterCampo; //RUCJ4248 22/OCT/2013
        B_HIT_SIC                : TInterCampo; //RUCJ4248 26/NOV/2013
        F_REP_SIC                : TInterCampo; //RUCJ4248 22/NOV/2013
        B_REPORTE_SIC            : TInterCampo; //RUCJ4248 22/NOV/2013
        CVE_PRODUCTO_BCA         : TInterCampo;
        DESC_PROD_BCA            : TInterCampo;
        Periodicidad_CAT         : TInterCampo; //AGF 12/05/2016
        Periodicidad_Interes     : TInterCampo; //AGF 24/05/2016
        CODIGO_CNBV              : TInterCampo; // --- ASOR --- MAYO 2016 ---

        CVE_TIPO_BAJA            : TInterCampo; //AGF 27/06/2016
        DESC_TIPO_BAJA           : TInterCampo; //AGF 28/06/2016
        F_BAJA                   : TInterCampo; //AGF 27/06/2016


        ParamCre                 : TParamCre;
        Acreditado               : TCrAcredit;
        Producto                 : TCrProduct;
        Moneda                   : TMoneda;
        TasaRefer                : TTasIndFin;

//        ProdMoneda               : TCrRePrMn;
//        TasReferPrMn             : TCrRePrMn;
        Contrato                 : TCtrlCto;
        OrigRec                  : TCrOrigRec;
        Destino                  : TCrDestino;
        PctCapiliz               : TCrPctCapi;
        CrCreMar                 : TCrCreMar;
        PromAdm                  : TMPersona;  //Promotor Administrativo EASA4011  09.MAR.2007      Req. Promotor asignado
        DetImpagado              : TCrCartrIm;
        ProductoBCA              : TCrprodbca;
        UTiempoPeriodicidadCAT   : TCrUniTie;  //AGF 12/05/2016 Unidad de Tiempo
        UTiempoPeriodicidadINT   : TCrUniTie;  //AGF 24/05/2016 Unidad de Tiempo

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        procedure   CambioSituacion(Sender: TObject);
        Function    GeneraContratoCorp : Boolean;
        Procedure   ObtenDisponibleAcred(peIdAcreditado : String);
        Function    ObtenImpMaxDispAcred(peIdAcreditado : String):Double;
        Procedure   ObtenDisponibleGpo(peCveGpoEconom : String);
        Function    ObtenPerJuridica : String;
        Function    ObtenProdCorp : String;
        Procedure   ObtenDisponibleAut(peIdContrato, peFolContrato : String);
        FUNCTION    VerfVencimiento(peIdContrato, peFolContrato: String) : BOOLEAN;
        procedure   RefinanAut(peIdContrato, peFolContrato : String);
        Procedure   ValidaDatosInscripcion;
        procedure ObtenDescripcion(peStrSQL,
                  peStrNomCampo: String; peCVE_INTERCAMPO,
                  peDESC_INTERCAMPO: TInterCampo);
        //
        //LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT
        function    BObtenCobAn( peCveMoneda : String; peImpAutorizado : Double ): String;
        //ENDS_LOLS
        //
        //RIRA4281 30Jun10 se valida el tipo de cartera del producto
        function   ObtenTipoCarteraProd(peCVE_CAT_MINIMO : String):String;
        function   ValidaDestino(peCveDestino: String;peTipoCartera : String): Integer;

      published
      end;


implementation

Uses IntCrcttoc,IntCrCalDia,IntMEstSieb,IntMFiraCto, IntCrCnPrAcc, IntMExpOper, IntCrAutExAc,
      IntCrAnalist,   // Ver Vobos del analista;
      IntCrTipGar,    // Garantías a Estados y Municipios
      IntCrCtoAdd     // Datos complementarios de la línea de crédito
      ;


{$R *.DFM}

constructor TCrCto.Create( AOwner : TComponent );
begin Inherited;
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Autorización';
      FOL_CONTRATO :=CreaCampo('FOL_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                FOL_CONTRATO.Caption:='Folio';
      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,True);
                CVE_PRODUCTO_CRE.Caption:='Producto de la disposición';
      B_EVENTUAL :=CreaCampo('B_EVENTUAL',ftString,tsNinguno,tsNinguno,True);
                B_EVENTUAL.Caption:='Eventual';
      B_LITIGIOSO:=CreaCampo('B_LITIGIOSO',ftString,tsNinguno,tsNinguno,True);
                B_LITIGIOSO.Caption:='Litigioso';
      B_REESTRUCTURA :=CreaCampo('B_REESTRUCTURA',ftString,tsNinguno,tsNinguno,True);
                B_REESTRUCTURA.Caption:='Reestructura';
      F_AUT_COMITE :=CreaCampo('F_AUT_COMITE',ftDate,tsNinguno,tsNinguno,True);
                F_AUT_COMITE.Caption:='Fecha Autorización';
      CVE_COMITE_AUT :=CreaCampo('CVE_COMITE_AUT',ftString,tsNinguno,tsNinguno,True);
                CVE_COMITE_AUT.Caption:='Clave de Autorización de Comité';
      CVE_USU_AUTORIZA :=CreaCampo('CVE_USU_AUTORIZA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_AUTORIZA.Caption:='Usuario Autoriza';
      DIAS_PLAZO :=CreaCampo('DIAS_PLAZO',ftFloat,tsNinguno,tsNinguno,True);
                DIAS_PLAZO.Caption:='Plazo de la Disposición';
      F_VENCIMIENTO :=CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,True);
                F_VENCIMIENTO.Caption:='Fecha de Vencimiento';
      CVE_TASA_REFER :=CreaCampo('CVE_TASA_REFER',ftString,tsNinguno,tsNinguno,True);
                CVE_TASA_REFER.Caption:='Tasa de Referencia';
      OPERADOR_STASA :=CreaCampo('OPERADOR_STASA',ftString,tsNinguno,tsNinguno,True);
         With OPERADOR_STASA do
         Begin  Size := 1;
                UseCombo := True;
                ComboLista.Add('+'); ComboDatos.Add('+');
                ComboLista.Add('-'); ComboDatos.Add('-');
                ComboLista.Add('*'); ComboDatos.Add('*');
                ComboLista.Add('/'); ComboDatos.Add('/');
                ComboLista.Add('%'); ComboDatos.Add('%');
         end;
                OPERADOR_STASA.Caption:='Operador Sobre - Tasa';
      SOBRETASA :=CreaCampo('SOBRETASA',ftFloat,tsNinguno,tsNinguno,True);
                SOBRETASA.Caption:='Sobre-Tasa';
      DIAS_TOLERANCIA :=CreaCampo('DIAS_TOLERANCIA',ftFloat,tsNinguno,tsNinguno,True);
                DIAS_TOLERANCIA.Caption:='Días de Tolerancia pago de Periodo';
      IMP_AUTORIZADO :=CreaCampo('IMP_AUTORIZADO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_AUTORIZADO.Caption:='Importe Autorizado';
      IMP_DISPUESTO :=CreaCampo('IMP_DISPUESTO',ftFloat,tsNinguno,tsNinguno,False);
                IMP_DISPUESTO.Caption:='Importe Dispuesto';

      DISPONIBLE_AUT :=CreaCampo('DISPONIBLE_AUT',ftFloat,tsNinguno,tsNinguno,False);
                DISPONIBLE_AUT.Caption:='Importe Disponible a la Disposición';
      DISPONIBLE_ACRED :=CreaCampo('DISPONIBLE_ACRED',ftFloat,tsNinguno,tsNinguno,False);
                DISPONIBLE_ACRED.Caption:='Importe Disponible al Acreditado';

      IMP_TRANSITO :=CreaCampo('IMP_TRANSITO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_TRANSITO.Caption:='Importe en Tránsito';
      TX_COND_GRALES :=CreaCampo('TX_COND_GRALES',ftString,tsNinguno,tsNinguno,True);
                TX_COND_GRALES.Caption:='Condiciones Generales';
      SIT_LINEA :=CreaCampo('SIT_LINEA',ftString,tsNinguno,tsNinguno,True);
        With SIT_LINEA do
           begin Size:=2;
                 UseCombo:=True;
                 ComboLista.Add('NO AUTORIZADO');      ComboDatos.Add('NA');
                 ComboLista.Add('AUTORIZADO');         ComboDatos.Add('AU');
           end;
                SIT_LINEA.Caption:='Situación';
      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      F_CANCELA :=CreaCampo('F_CANCELA',ftDate,tsNinguno,tsNinguno,True);
                F_CANCELA.Caption:='Fecha Cancela';
      CVE_USU_CANCELA :=CreaCampo('CVE_USU_CANCELA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_CANCELA.Caption:='Clave de Usu Cancela';
      CVE_ORIGEN_REC :=CreaCampo('CVE_ORIGEN_REC',ftString,tsNinguno,tsNinguno,True);
                CVE_ORIGEN_REC.Caption:='Origen de Recursos';
      CVE_DESTINO :=CreaCampo('CVE_DESTINO',ftString,tsNinguno,tsNinguno,True);
                CVE_DESTINO.Caption:='Destino de la Disposición';
      DISPONIBLE_GRUPO_ECO :=CreaCampo('DISPONIBLE_GRUPO_ECO',ftFloat,tsNinguno,tsNinguno,False);
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA.Caption:='Moneda';
      B_REVOLVENTE :=CreaCampo('B_REVOLVENTE',ftString,tsNinguno,tsNinguno,True);
                B_REVOLVENTE.Caption:='Revolvente';
      B_FINANC_ADIC :=CreaCampo('B_FINANC_ADIC',ftString,tsNinguno,tsNinguno,True);
                B_FINANC_ADIC.Caption:='Aplica financ. adic.';
      TOTAL_FINANC_ADIC :=CreaCampo('TOTAL_FINANC_ADIC',ftFloat,tsNinguno,tsNinguno,False);
      RIESGO_TOTAL :=CreaCampo('RIESGO_TOTAL',ftFloat,tsNinguno,tsNinguno,False);
      TASA_BASE :=CreaCampo('TASA_BASE',ftFloat,tsNinguno,tsNinguno,True);
                TASA_BASE.Caption:='Tasa Base';
    //EASA 13042005 GOBMUN
      //B_APL_INSCR_DEUD :=CreaCampo('B_APL_INSCR_DEUD',ftString,tsNinguno,tsNinguno,True);
               // B_APL_INSCR_DEUD.Caption:='Aplica Inscrip. Deuda';
      //CVE_TIP_INSCR_D :=CreaCampo('CVE_TIP_INSCR_D',ftString,tsNinguno,tsNinguno,True);
        //        CVE_TIP_INSCR_D.Caption:='Tipo Inscrp. Deuda';
      //NUM_INSCR_DEUDA :=CreaCampo('NUM_INSCR_DEUDA',ftString,tsNinguno,tsNinguno,True);
        //        NUM_INSCR_DEUDA.Caption:='Num. Inscrip. Deuda';
      //F_ALTA_INSCR_DEU :=CreaCampo('F_ALTA_INSCR_DEU',ftDate,tsNinguno,tsNinguno,True);
        //        F_ALTA_INSCR_DEU.Caption:='Fecha de Alta Inscr. Deuda';
      //F_PROG_INSCR_D :=CreaCampo('F_PROG_INSCR_D',ftDate,tsNinguno,tsNinguno,True);
        //        F_PROG_INSCR_D.Caption:='F. Prog. Inscr. Deuda';
      B_PARAMETRICO :=CreaCampo('B_PARAMETRICO',ftString,tsNinguno,tsNinguno,True);
                B_PARAMETRICO.Caption:='Es Paramétrico';
      B_FINAN_CALIF :=CreaCampo('B_FINAN_CALIF',ftString,tsNinguno,tsNinguno,True);
                B_FINAN_CALIF.Caption:='Aplica Finan. Adic';
      B_APL_CONVE_MOD :=CreaCampo('B_APL_CONVE_MOD',ftString,tsNinguno,tsNinguno,True);
                B_APL_CONVE_MOD.Caption:='Apl. Conv. Modif.';
      B_APL_EVEN_ACEL :=CreaCampo('B_APL_EVEN_ACEL',ftString,tsNinguno,tsNinguno,True);
                B_APL_EVEN_ACEL.Caption:='Apl. Even. Acel.';
      B_APL_PRORROGA :=CreaCampo('B_APL_PRORROGA',ftString,tsNinguno,tsNinguno,True);
                B_APL_PRORROGA.Caption:='Apl. Prorroga';
      //CVE_FUENTE_PAGO :=CreaCampo('CVE_FUENTE_PAGO',ftString,tsNinguno,tsNinguno,True);
        //        CVE_FUENTE_PAGO.Caption:='Fuente Pago';
      B_APL_RENOVACION :=CreaCampo('B_APL_RENOVACION',ftString,tsNinguno,tsNinguno,True);
                B_APL_RENOVACION.Caption:='Apl. Renovación';

      //Creamos los campos nuevo 26/10/2011
     // B_Ins_Irrev :=CreaCampo('B_Ins_Irrev',ftString,tsNinguno,tsNinguno,True);
       //         B_Ins_Irrev.Caption:='Instr. Irrevocables';
      //B_Mandato :=CreaCampo('B_Mandato',ftString,tsNinguno,tsNinguno,True);
        //        B_Mandato.Caption:='Mandato';
      //B_Gar_Part:=CreaCampo('B_Gar_Part',ftString,tsNinguno,tsNinguno,True);
       //         B_Gar_Part.Caption:='Garantia con Participación';
      //B_Gar_Aport:=CreaCampo('B_Gar_Aport',ftString,tsNinguno,tsNinguno,True);
        //        B_Gar_Aport.Caption:='Garantía con Aport e I.L.';


      CVE_GPO_CAPITALIZ :=CreaCampo('CVE_GPO_CAPITALIZ',ftString,tsNinguno,tsNinguno,True);
                CVE_GPO_CAPITALIZ.Caption:='Gpo Capitaliz.';
      IMP_EXCESO_EVE :=CreaCampo('IMP_EXCESO_EVE',ftFloat,tsNinguno,tsNinguno,False);
      F_VTO_EXCESO :=CreaCampo('F_VTO_EXCESO',ftDate,tsNinguno,tsNinguno,False);
      IMP_AUT_ORIG :=CreaCampo('IMP_AUT_ORIG',ftFloat,tsNinguno,tsNinguno,False);
      //
      //LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT
      CVE_SUB_TIP_COB := CreaCampo( 'CVE_SUB_TIP_COB',  ftString,  tsNinguno, tsNinguno, True );
      With CVE_SUB_TIP_COB do begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('Acortar Plazo');      ComboDatos.Add('AP'); // Acortar plazo
        ComboLista.Add('Disminuir Monto');    ComboDatos.Add('DM'); // Disminuir monto
      end;
      //ENDS_LOLS_24_AGO_2006
      //

      // Inicia modificaciones SATV4766 el 11JUL2006
      IMP_BLOQUEADO   :=CreaCampo('IMP_BLOQUEADO',ftFloat,tsNinguno,tsNinguno,True);
      B_DISP_EN_LINEA :=CreaCampo('B_DISP_EN_LINEA',ftString,tsNinguno,tsNinguno,True);
      MAX_PZO_DISP    :=CreaCampo('MAX_PZO_DISP',ftInteger,tsNinguno,tsNinguno,True);
      MAX_DIAS_DISPON :=CreaCampo('MAX_DIAS_DISPON',ftInteger,tsNinguno,tsNinguno,True);
      MAX_TASA        :=CreaCampo('MAX_TASA',ftFloat,tsNinguno,tsNinguno,True);
      // Inicia modificaciones SATV4766 el 01AGO2006
      NUM_METODO_DISP :=CreaCampo('NUM_METODO_DISP',ftInteger,tsNinguno,tsNinguno,False);
      NUM_METODO_DISP.AsInteger := 1;
      // Termina modificaciones

      //LOLS 04AGO2006 CREDITO EN LINEA. AGREGA NUMERO DE DISPOSICION MARCO
      ID_CREDITO_MARCO := CreaCampo('ID_CREDITO_MARCO', ftFloat, tsNinguno, tsNinguno, True );
      ID_CREDITO_MARCO.Caption := 'Crédito Marco';
      //ENDS_LOLS

      // </ EASA4011  09.MAR.2007      Req. Promotor asignado
      ID_PROM_ADMON := CreaCampo('ID_PROM_ADMON', ftFloat, tsNinguno, tsNinguno, True );
      ID_PROM_ADMON.Caption := 'Prom. Admon.';
      NOM_PROM_ADM := CreaCampo('NOM_PROM_ADM', ftString, tsNinguno, tsNinguno, False );
      //END_EASA


      ROE_BRUTA := CreaCampo('ROE_BRUTA', ftFloat, tsNinguno, tsNinguno, True );
      ROE_NETA := CreaCampo('ROE_NETA', ftFloat, tsNinguno, tsNinguno, True );
      PCT_REQ_CAP_MER := CreaCampo('PCT_REQ_CAP_MER', ftFloat, tsNinguno, tsNinguno, True );
      PCT_REQ_CAP_CRE := CreaCampo('PCT_REQ_CAP_CRE', ftFloat, tsNinguno, tsNinguno, True );
      PCT_CAPITALIZ := CreaCampo('PCT_CAPITALIZ', ftFloat, tsNinguno, tsNinguno, True );
      CVE_CARACT_CTO  := CreaCampo('CVE_CARACT_CTO', ftString, tsNinguno, tsNinguno, True );
      DES_CVE_CARACT_CTO := CreaCampo('DES_CVE_CARACT_CTO', ftString, tsNinguno, tsNinguno, False );
      CVE_COMPROB_ING := CreaCampo('CVE_COMPROB_ING', ftInteger, tsNinguno, tsNinguno, True );
      DES_CVE_COMPROB_ING := CreaCampo('DES_CVE_COMPROB_ING', ftString, tsNinguno, tsNinguno, False );
      CVE_SEC_LABORAL := CreaCampo('CVE_SEC_LABORAL', ftInteger, tsNinguno, tsNinguno, True );
      DESC_CVE_SEC_LABORAL := CreaCampo('DESC_CVE_SEC_LABORAL', ftString, tsNinguno, tsNinguno, False );
      IMP_INGRESOS_ACR := CreaCampo('IMP_INGRESOS_ACR', ftFloat, tsNinguno, tsNinguno, True );
      NO_CONSUL_BURO := CreaCampo('NO_CONSUL_BURO', ftFloat, tsNinguno, tsNinguno, True );
      B_EMPROBLEMADA := CreaCampo('B_EMPROBLEMADA', ftString, tsNinguno, tsNinguno, True );
      B_EMPLEADO := CreaCampo('B_EMPLEADO', ftString, tsNinguno, tsNinguno, True );

      //SATV4766 03 DIC 2009 ADECUACIONES DE ACUERDO AL REQUERIMIENTO DE LA CERTIFICACION R04
      //INICIO MODIFICACIONES
      B_RAMO_28       := CreaCampo('B_RAMO_28', ftString, tsNinguno, tsNinguno, True );
      B_ESTRUCTURADO  := CreaCampo('B_ESTRUCTURADO', ftString, tsNinguno, tsNinguno, True );
      //FIN MODIFICACIONES
      //SATV4766 03 DIC 2009 ADECUACIONES DE ACUERDO AL REQUERIMIENTO DE LA CERTIFICACION R04

      //RIRA4281 01 JUN 2010 ADECUACIONES DE ACUERDO AL REQUERIMIENTO DE LA CERTIFICACION R04
      ID_AVAL_GOB := CreaCampo('ID_AVAL_GOB', ftFloat, tsNinguno, tsNinguno, True );
      DESC_ACRED_GOB := CreaCampo('DESC_ACRED_GOB', ftString, tsNinguno, tsNinguno, False );


      {RIRA4281  Se agrega para el analista 26/05/2010}
       CVE_ANALISTA_RES :=CreaCampo('CVE_ANALISTA_RES',ftString,tsNinguno,tsNinguno,true);
                CVE_ANALISTA_RES.Caption:='Clave Analista Asignado';

      {RUCJ4248 22/OCT/2013}
      B_TIPO_LINEA := CreaCampo('B_TIPO_LINEA', ftString, tsNinguno, tsNinguno, True );
      B_PRELACION_PGO := CreaCampo('B_PRELACION_PGO', ftString, tsNinguno, tsNinguno, True );
      CVE_FORMA_DISP  := CreaCampo('CVE_FORMA_DISP', ftString, tsNinguno, tsNinguno, True );
      CVE_TIPO_ALTA := CreaCampo('CVE_TIPO_ALTA', ftString, tsNinguno, tsNinguno, True );
      DESC_TIPO_ALTA := CreaCampo('DESC_TIPO_ALTA', ftString, tsNinguno, tsNinguno, false );
      B_HIT_SIC := CreaCampo('B_HIT_SIC', ftString, tsNinguno, tsNinguno, True );
      F_REP_SIC	:= CreaCampo('F_REP_SIC',ftDate,tsNinguno,tsNinguno,true);
      B_REPORTE_SIC := CreaCampo('B_REPORTE_SIC', ftString, tsNinguno, tsNinguno, True );
      {/RUCJ4248 22/OCT/2013}

      Periodicidad_CAT :=CreaCampo('PERIODICIDAD_CAT',ftString,tsNinguno,tsNinguno,True);
                Periodicidad_CAT.Caption:='Periodicidad CAT';
      Periodicidad_Interes :=CreaCampo('PERIODICIDAD_INTERES',ftString,tsNinguno,tsNinguno,True);
                Periodicidad_Interes.Caption:='Periodicidad Interés';

      CVE_PRODUCTO_BCA :=CreaCampo('CVE_PRODUCTO_BCA',ftString,tsNinguno,tsNinguno,True);
      CVE_PRODUCTO_BCA.Caption:='Producto Banca';

      DESC_PROD_BCA :=CreaCampo('DESC_PROD_BCA',ftString,tsNinguno,tsNinguno,False);
      DESC_PROD_BCA.Caption:='Desc Prod Banca';

      CODIGO_CNBV  := CreaCampo('CODIGO_CNBV',ftString,tsNinguno,tsNinguno,True); // --- ASOR  --- MAYO 2016 ---
      CODIGO_CNBV.Caption:='Codigo CNBV';                                         // --- ASOR  --- MAYO 2016 ---

      CVE_TIPO_BAJA :=CreaCampo('CVE_TIPO_BAJA',ftString,tsNinguno,tsNinguno,True);           //AGF 27/06/2016
      CVE_TIPO_BAJA.Caption:='Baja de la Dispos';                                             //AGF 27/06/2016
      DESC_TIPO_BAJA := CreaCampo('DESC_TIPO_BAJA', ftString, tsNinguno, tsNinguno, false );  //AGF 28/06/2016

      F_BAJA :=CreaCampo('F_BAJA',ftDate,tsNinguno,tsNinguno,True);                           //AGF 27/06/2016
      F_BAJA.Caption:='Fecha de Baja';                                                        //AGF 27/06/2016

      FKeyFields.Add('ID_CONTRATO');
      FKeyFields.Add('FOL_CONTRATO');

      TableName := 'CR_CONTRATO';
      UseQuery := True;
      HelpFile := 'IntCrCto.Hlp';
      ShowMenuReporte:=True;

      {$WARNINGS OFF}
      Acreditado := TCrAcredit.Create(Self);
      {$WARNINGS ON}
      Acreditado.MasterSource := Self;

      {$WARNINGS OFF}
      Producto :=  TCrProduct.Create(Self);
      {$WARNINGS ON}
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField      :='CVE_PRODUCTO_CRE';

      {$WARNINGS OFF}
      Moneda :=  TMoneda.Create(Self);
      {$WARNINGS ON}
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField :='CVE_MONEDA';

      {$WARNINGS OFF}
      TasaRefer := TTasIndFin.Create(Self);
      {$WARNINGS ON}
      TasaRefer.MasterSource:=Self;
      TasaRefer.FieldByName('CVE_TASA_INDICAD').MasterField:='CVE_TASA_REFER';

      {$WARNINGS OFF}
      Contrato := TCtrlCto.Create(Self);
      {$WARNINGS ON}
      Contrato.MasterSource:=Self;
      Contrato.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';

      {$WARNINGS OFF}
      OrigRec := TCrOrigRec.Create(Self);
      {$WARNINGS ON}
      OrigRec.MasterSource:=Self;
      OrigRec.FieldByName('CVE_ORIGEN_REC').MasterField:='CVE_ORIGEN_REC';

      {$WARNINGS OFF}
      Destino := TCrDestino.Create(Self);
      {$WARNINGS ON}
      Destino.MasterSource:=Self;
      Destino.FieldByName('CVE_DESTINO').MasterField:='CVE_DESTINO';

      SIT_LINEA.OnChange := CambioSituacion;

      {$WARNINGS OFF}
      PctCapiliz := TCrPctCapi. Create(Self);
      {$WARNINGS ON}
      PctCapiliz.MasterSource:=Self;
      PctCapiliz.FieldByName('CVE_GPO_CAPITALIZ').MasterField:='CVE_GPO_CAPITALIZ';

      {$WARNINGS OFF}
      CrCreMar   := TCrCreMar.Create(Self);
      {$WARNINGS ON}
      CrCreMar.MasterSource:=Self;
      CrCreMar.FieldByName('ID_CREDITO_MARCO').MasterField := 'ID_CREDITO_MARCO';

      {$WARNINGS OFF}
      DetImpagado := TCrCartrIm.Create(Self);
      {$WARNINGS ON}
      DetImpagado.MasterSource:=Self;

      {$WARNINGS OFF}
      UTiempoPeriodicidadCAT := TCrUniTie.Create (Self);
      {$WARNINGS ON}
      UTiempoPeriodicidadCAT.MasterSource := Self;
      UTiempoPeriodicidadCAT.FieldByName('CVE_UNIDAD_TIEMP').MasterField := 'PERIODICIDAD_CAT';

      {$WARNINGS OFF}
      UTiempoPeriodicidadINT := TCrUniTie.Create (Self);
      {$WARNINGS ON}
      UTiempoPeriodicidadINT.MasterSource := Self;
      UTiempoPeriodicidadINT.FieldByName('CVE_UNIDAD_TIEMP').MasterField := 'PERIODICIDAD_INTERES';


      // </ EASA4011  09.MAR.2007      Req. Promotor asignado
      {$WARNINGS OFF}
      PromAdm := TMPersona.Create(Self);
      {$WARNINGS ON}
      PromAdm.FilterBy := fbTMPersonaEmpleado;
      PromAdm.MasterSource := Self;
      PromAdm.FieldByName('ID_PERSONA').MasterField := 'ID_PROM_ADMON';
      PromAdm.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      {$WARNINGS OFF}
      ProductoBCA :=  TCrprodbca.Create(Self);
      {$WARNINGS ON}
      ProductoBCA.MasterSource:=Self;
      ProductoBCA.FieldByName('CVE_PRODUCTO_BCA').MasterField :='CVE_PRODUCTO_BCA';
end;

Destructor TCrCto.Destroy;
begin
        if Acreditado <> nil then
           Acreditado.Free;
        //end if

        if Producto <> nil then
           Producto.Free;
        //end if

        if Moneda <> nil then
           Moneda.Free;
        //en if

        if TasaRefer <> nil then
           TasaRefer.Free;
        //end if

        if Contrato <> nil then
           Contrato.Free;
        //end if

      if OrigRec <> nil then
         OrigRec.Free;
      //end if

      if Destino <> nil then
         Destino.Free;
      //end if

      if PctCapiliz <> nil then
         PctCapiliz.Free;
      //end if

      //<LOLS 07 AGO 2006.Libera el objeto>
      if CrCreMar <> nil then                           
         CrCreMar.Free;
      //end if

      if PromAdm <> nil then
         PromAdm.Free;
      //end if

      if ProductoBCA <> nil then
         ProductoBCA.Free;
      //en if

      if UTiempoPeriodicidadCAT <> nil then
        UTiempoPeriodicidadCAT.Free;

      if UTiempoPeriodicidadINT <> nil then
        UTiempoPeriodicidadINT.Free;

      inherited;
end;


function TCrCto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCto;
begin
   W:=TWCrCto.Create(Self);
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

Function TCrCto.InternalBusca:Boolean;
Var T        : TInterFindit;
    vlSalida : Boolean;
begin InternalBusca := False;
      T := CreaBuscador('ICrCto.it','F,F');
      Try if Active then begin T.Param(0,ID_CONTRATO.AsString);
                               T.Param(1,FOL_CONTRATO.AsString);
                               end;
          if T.Execute then
          Begin
             VLSalida := FindKey([T.DameCampo(0),T.DameCampo(1)]);
             if VLSalida then
                 if Not Acreditado.FindKey([Contrato.ID_Titular.AsString]) then
                    Active := False;
                 //end if;
             //end if
             InternalBusca := VLSalida;
          end;

      finally  T.Free;
      end;
end;

procedure TCrCto.CambioSituacion(Sender: TObject);
begin
     If (SIT_LINEA.Control<>nil) and (SIT_LINEA.Control is TLabel) then
        TLabel(SIT_LINEA.Control).Caption:=SIT_LINEA.AsCombo;
     //END IF
end;
{----------------------------------------------------------------------------------------------------------------------
                                GENERA CONTRATO CORPORATIVO
----------------------------------------------------------------------------------------------------------------------}
Function    TCrCto.GeneraContratoCorp : Boolean;
var VLSalida :   Boolean;
    InfContrato  : TCrcttoc;
begin
     VLSalida := False;
     if Active then
     begin
          {$WARNINGS OFF}
          InfContrato := TCrcttoc.Create(self);
          {$WARNINGS ON}
          try
             InfContrato.Apli:=Apli;
             InfContrato.ParamCre:=ParamCre;
             InfContrato.ContrCred := Self;
             InfContrato.CVE_PRODUCTO.AsString := ObtenProdCorp;
             InfContrato.CVE_MONEDA.AsString := CVE_MONEDA.AsString;
             InfContrato.Catalogo;

             if InfContrato.ID_CONTRATO.AsFloat > 330000000 then
             begin
                  //falta asigna el valor de ctto corp al ctto cre
                  ID_CONTRATO.AsInteger := InfContrato.ID_CONTRATO.AsInteger;
                  ID_PROM_ADMON.AsInteger := InfContrato.ID_PROM_ADMON.AsInteger;
                  VLSalida := True;
             end;

          finally
                 if InfContrato <> nil then
                        InfContrato.Free;
                 //end if
          end;
     end
     else
         ShowMessage('Debe de capturar una Autorización de la Disposición.');
     //end if;

     GeneraContratoCorp := VLSalida;
end;
{----------------------------------------------------------------------------------------------------------------------
                                OBTIENE EL IMPORTE DISPONIBLE DEL ACREDITADO
¿----------------------------------------------------------------------------------------------------------------------}
Procedure TCrCto.ObtenDisponibleAcred(peIdAcreditado : String);
var vlSql         : String;
    vlDispAcred   : String;
Begin
   //LOLS 25 AGO 2006 --> INVIERTE EL ORDEN DE LOS PARAMETROS
   //vlSql := 'SELECT PKGCRSALDOS.StpObtDisponibleAcre( '+ peIdAcreditado + ',' + NUM_METODO_DISP.AsString +') DISPONIBLE_ACRED FROM DUAL';
   //
   // LOLS 18 NOV 2006. CL. INVARIABLEMENTA LLAMA LA RUTINA CON EL METODO 1
   vlSql := 'SELECT PKGCRSALDOS.StpObtDisponibleAcre( 1, ' + peIdAcreditado +') DISPONIBLE_ACRED FROM DUAL';
   //vlSql := 'SELECT PKGCRSALDOS.StpObtDisponibleAcre( '+ NUM_METODO_DISP.AsString + ',' + peIdAcreditado +') DISPONIBLE_ACRED FROM DUAL';
   //
   GetSqlStr(vlSqL,Apli.DataBaseName,Apli.SessionName,'DISPONIBLE_ACRED',vlDispAcred,False);
   if vlDispAcred = CNULL then
      vlDispAcred := '0';
   //end if
   DISPONIBLE_ACRED.AsFloat := StrToFloat(vlDispAcred);
end;
{-------------------------------------------------------------------------------
               OBTIENE EL IMPORTE MAXIMO DISPONIBLE DEL ACREDITADO
-------------------------------------------------------------------------------}
function TCrCto.ObtenImpMaxDispAcred(peIdAcreditado: String): Double;
var vlSql      : String;
    vlMaxAcred : String;
Begin
   vlSql := 'SELECT PKGCRSALDOS.StpObtDisponibleAcre( 2, ' + peIdAcreditado +') DISPONIBLE_ACRED FROM DUAL';
   GetSqlStr( vlSqL,  Apli.DataBaseName, Apli.SessionName, 'DISPONIBLE_ACRED', vlMaxAcred, False);
   if vlMaxAcred = CNULL then vlMaxAcred := '0';
   Result := StrToFloat(vlMaxAcred);
end;
{----------------------------------------------------------------------------------------------------------------------
                           OBTIENE EL IMPORTE DISPONIBLE DEL GRUPO DEL ACEDITADO
----------------------------------------------------------------------------------------------------------------------}
Procedure TCrCto.ObtenDisponibleGpo(peCveGpoEconom : String);
var vlSql         : String;
    vlDispGpo     : String;
Begin
   vlSql := 'SELECT PKGCRSALDOS.StpObtDisponibleGpo( '+ peCveGpoEconom + ') DISPONIBLE_GPO FROM DUAL';
   GetSqlStr(vlSqL,Apli.DataBaseName,Apli.SessionName,'DISPONIBLE_GPO',vlDispGpo,False);
   if vlDispGpo = CNULL then
      vlDispGpo := '0';
   //end if
   DISPONIBLE_GRUPO_ECO.AsFloat := StrToFloat(vlDispGpo);
end;
{----------------------------------------------------------------------------------------------------------------------
                OBTIENE LA PERSONALIDAD JURIDICA DEL ACREDITADO
----------------------------------------------------------------------------------------------------------------------}
Function TCrCto.ObtenPerJuridica : String;
var vlSql         : String;
    vlPerJuridica : String;
Begin
   vlSql := 'SELECT PKGCRCOMUN.STPOBTPERSJURIDICA( '+Acreditado.ID_ACREDITADO.AsString+') CVE_PER_JURIDICA FROM DUAL';
   GetSqlStr(vlSqL,Apli.DataBaseName,Apli.SessionName,'CVE_PER_JURIDICA',vlPerJuridica,False);
   ObtenPerJuridica := vlPerJuridica;
end;
{----------------------------------------------------------------------------------------------------------------------
                OBTIENE EL PRODUCTO CORPORATIVO
----------------------------------------------------------------------------------------------------------------------}
function TCrCto.ObtenProdCorp: String;
var vlSql         : String;
    vlProdCorp    : String;
Begin
   vlSql := 'SELECT PKGCRCOMUN.StpObtProdCorp( '+ CVE_MONEDA.AsString + ',' + #39 + ObtenPerJuridica + #39 +
                                            ') CVE_PROD_CORP FROM DUAL';
   GetSqlStr(vlSqL,Apli.DataBaseName,Apli.SessionName,'CVE_PROD_CORP',vlProdCorp,False);
   ObtenProdCorp := vlProdCorp;
end;
{----------------------------------------------------------------------------------------------------------------------
                        OBTIENE EL TOTAL DE REFINANCIAMIENTO POR AUTORIZACION
----------------------------------------------------------------------------------------------------------------------}
procedure TCrCto.RefinanAut(peIdContrato, peFolContrato : String);
var StpRefinanAut :  TStoredProc;
Begin
    StpRefinanAut := TStoredProc.Create(Self);
    try
       with StpRefinanAut do
       begin
          StpRefinanAut.DatabaseName:= Apli.DatabaseName;
          StpRefinanAut.SessionName:= Apli.SessionName;
          StpRefinanAut.StoredProcName:='PKGCRSALDOS.STPOBTFINANADICAUT';

          Params.Clear;
          Params.CreateParam(ftFloat,'PEIDCONTRATO',ptInput);
          Params.CreateParam(ftFloat,'PEFOLCONTRATO',ptInput);
          Params.CreateParam(ftFloat,'PSFINADICAUT',ptOutput);
          Params.CreateParam(ftFloat,'PSRIESGOTOTAL',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peIdContrato').AsString := peIdContrato;
          ParamByName('peFolcontrato').AsString := peFolContrato;
          ExecProc;

          if ParamByName('PSResultado').AsInteger = 0 then
          begin
             TOTAL_FINANC_ADIC.AsFloat := ParamByName('PSFINADICAUT').AsFloat;
             RIESGO_TOTAL.AsFloat := ParamByName('PSRIESGOTOTAL').AsFloat;
             if ( ( Modo = moEdit ) or ( Modo = moAppend ) ) then
               if ParamByName('psTxResultado').AsString <> CNULL then
                  MessageDlg(ParamByName('psTxResultado').AsString,mtInformation, [ mbOK ], 0);
               //end if
             //end if
          end
          else
          Begin
             ShowMessage('PROBLEMAS AL OBTENER EL REFINANCIAMIENTO: ' +
                         ParamByName('psRESULTADO').AsString);
             ShowMessage(ParamByName('psTxResultado').AsString);
          end;
          UnPrepare;
       end;
    finally
       StpRefinanAut.Free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------
                                OBTIENE EL IMPORTE DISPONIBLE
----------------------------------------------------------------------------------------------------------------------}
Procedure TCrCto.ObtenDisponibleAut(peIdContrato, peFolContrato : String);
var vlSql     : String;
    vlDisponibleAut : String;
    vlDispuestoAut : String;
Begin
   vlSql := 'SELECT PKGCRSALDOS.STPOBTDISPONIBLEAUT( '+ peIdContrato + ','
                                                      + peFolContrato + ') DISPONIBLE_AUT FROM DUAL';
   GetSqlStr(vlSqL,Apli.DataBaseName,Apli.SessionName,'DISPONIBLE_AUT',vlDisponibleAut,False);
   if vlDisponibleAut = CNULL then
      vlDisponibleAut := '0';
   //end if
   DISPONIBLE_AUT.AsString := vlDisponibleAut;

   vlSql := 'SELECT PKGCRSALDOS.STPOBTDISPUESTOAUT( '+ peIdContrato + ','
                                                     + peFolContrato + ') DISPUESTO_AUT FROM DUAL';
   GetSqlStr(vlSqL,Apli.DataBaseName,Apli.SessionName,'DISPUESTO_AUT',vlDispuestoAut,False);
   if vlDispuestoAut = CNULL then
      vlDispuestoAut := '0';
   //end if
   IMP_DISPUESTO.AsString := vlDispuestoAut;
end;
{----------------------------------------------------------------------------------------------------------------------
                                VERIFICA SI LA AUTORIZACIÓN YA HA VENCIDO
----------------------------------------------------------------------------------------------------------------------}
FUNCTION TCrCto.VerfVencimiento(peIdContrato, peFolContrato: String) : BOOLEAN;
var vlSql    : String;
    vlCtoVdo : String;
    vlResult : Boolean;
Begin
   vlResult := False;

   vlSql := 'SELECT pkgcrperiodo.StpVerifCtoAC('+ peIdContrato + ',' + peFolContrato +') VDO FROM DUAL';
   GetSqlStr(vlSqL,Apli.DataBaseName,Apli.SessionName,'VDO',vlCtoVdo,False);
   if (vlCtoVdo = CFALSO) then
      vlResult := False
   else if vlCtoVdo = CVERDAD then
      vlResult := True;

   VerfVencimiento := vlResult;
end;

Procedure TCrCto.ValidaDatosInscripcion;
begin

end;
//
//LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT
function TCrCto.BObtenCobAn(peCveMoneda: String; peImpAutorizado: Double): String;
var SqlStr  : String;
begin
  Result := '';
  SqlStr := 'SELECT PKGCRCOMUN.FUNOBTENSUBTIPOCOB( ' + peCveMoneda + ', '     +
            FloatToStr(peImpAutorizado) + ', ' + SQLFecha(Apli.DameFechaEmpresa) +
            ' ) BOBTENCOBAN FROM DUAL';
  GetSQLStr( SqlStr,  Apli.DataBaseName, Apli.SessionName, 'BOBTENCOBAN',
             Result,  False );
end;
//ENDS_LOLS
//
(***********************************************FORMA CR_CONTRATO********************)
(*                                                                              *)
(*  FORMA DE CR_CONTRATO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CONTRATO********************)
//
//LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT
procedure TWCrCto.OnOffTipoCobAn;
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  begin
    //
    cbCVE_SUB_TIP_COB.Enabled := (Objeto.BObtenCobAn( Objeto.CVE_MONEDA.AsString,
                                  Objeto.IMP_AUTORIZADO.AsFloat ) = 'V' ) AND
                                 (Objeto.B_REVOLVENTE.AsString   <> 'V' );
    if not cbCVE_SUB_TIP_COB.Enabled then
      Objeto.CVE_SUB_TIP_COB.AsString := '';
    //
  end;
end;
//ENDS_LOLS
//
procedure TWCrCto.ObtenExceso(peIdAcreditado, peIdContrato: String);
var vlQry : TQuery;
    vlsql : String;
begin
     vlsql:= ' SELECT CDA.IMP_ORIG_AUT, CDA.F_ORIG_VTO_AUT ' + coCRLF +
           ' FROM CR_SOL_EXCESO_AC CSE, ' + coCRLF +
           '      CR_DET_EXCESO_AU CDA ' + coCRLF +
           ' WHERE CSE.ID_ACREDITADO  = ' + peIdAcreditado + coCRLF +
           '   AND CSE.SIT_SOL_EXCESO = ''AC'' ' + coCRLF +
           '   AND CDA.ID_CONTRATO    = ' + peIdContrato + coCRLF +
           '   AND CSE.ID_SOL_EXCESO  = CDA.ID_SOL_EXCESO ' + coCRLF +
           '   AND CSE.ID_ACREDITADO  = CDA.ID_ACREDITADO ' + coCRLF ;

     vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
           Objeto.IMP_EXCESO_EVE.AsFloat  := Objeto.IMP_AUTORIZADO.AsFloat - vlQry.FieldByName('IMP_ORIG_AUT').AsFloat;
           Objeto.F_VTO_EXCESO.AsDateTime := vlQry.FieldByName('F_ORIG_VTO_AUT').AsDateTime;
           Objeto.IMP_AUT_ORIG.AsFloat    := Objeto.IMP_AUTORIZADO.AsFloat - Objeto.IMP_EXCESO_EVE.AsFloat;
        end
        else
        Begin
              Objeto.IMP_EXCESO_EVE.AsFloat := 0 ;
              Objeto.F_VTO_EXCESO.AsString := '';
              Objeto.IMP_AUT_ORIG.AsFloat := 0;
        end;
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;
end;

procedure TWCrCto.HabilitaCtrlInscDeuda(peB_HABILITA : Boolean);
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo = moAppend)) then
   Begin
     If peB_HABILITA Then
        Begin
        //activa datos de inscripción de deuda
        //cbCVE_TIP_INSCR_D.Enabled    := True;              cbCVE_TIP_INSCR_D.Color := clWindow;
        //edF_ALTA_INSCR_DEU.Enabled   := True;             edF_ALTA_INSCR_DEU.Color := clWindow;
       // idtpF_ALTA_INSCR_DEU.Enabled := True;           idtpF_PROG_INSCR_D.Enabled := True;
        //edNUM_INSCR_DEUDA.Enabled := True;              edNUM_INSCR_DEUDA.Color := clWindow;
        //edF_PROG_INSCR_D.Enabled := True;               edF_PROG_INSCR_D.Color := clWindow;
        End
     Else
        Begin
        //desactiva datos de inscripción de deuda
        //cbCVE_TIP_INSCR_D.Enabled := False;             cbCVE_TIP_INSCR_D.Color := clBtnFace;
        //cbCVE_TIP_INSCR_D.Text := 'No Aplica';
        //edF_ALTA_INSCR_DEU.Enabled := False;            edF_ALTA_INSCR_DEU.Color := clBtnFace;
        //idtpF_ALTA_INSCR_DEU.Enabled := False;          idtpF_PROG_INSCR_D.Enabled := False;
        //edNUM_INSCR_DEUDA.Enabled := False;             edNUM_INSCR_DEUDA.Color := clBtnFace;
        //edF_PROG_INSCR_D.Enabled := False;              edF_PROG_INSCR_D.Color := clBtnFace;
        End;
   End;
end;

// Inicia modificaciones SATV4766 el 11JUL2006
procedure TWCrCto.HabilitaCtrlDispLinea;
begin
  With Objeto Do
   If (Modo = moAppend) Or (Modo = moEdit) Then
     cbB_DISP_EN_LINEA.Enabled := Producto.B_DISP_EN_LINEA.AsString = CVERDAD;
end;


procedure TWCrCto.HabilitaCtrl(peInterEdit : TInterEdit; peB_HABILITA : Boolean);
begin
  With Objeto Do
   If (Modo = moAppend) Or (Modo = moEdit) Then
     If Assigned(peInterEdit) Then
      Begin
      peInterEdit.Enabled  := peB_HABILITA;
      peInterEdit.ReadOnly := Not peB_HABILITA;
      peInterEdit.TabStop  := peB_HABILITA;
      If (peB_HABILITA) Then peInterEdit.Color := clWindow
      Else Begin peInterEdit.Color := clBtnFace; peInterEdit.Text := '0'; End;
      End;
end;

procedure TWCrCto.HabilitaControles;
begin
  With Objeto Do
    If Objeto.Active Then
      Begin
      HabilitaCtrlDispLinea;

      cbMAX_PZO_DISP.Checked := MAX_PZO_DISP.AsInteger <> 0;
      cbMAX_DIAS_DISPON.Checked := MAX_DIAS_DISPON.AsInteger <> 0;
      cbMAX_TASA.Checked := MAX_TASA.AsFloat <> 0;

      HabilitaCtrl(edMAX_PZO_DISP   , cbMAX_PZO_DISP.Checked);
      HabilitaCtrl(edMAX_DIAS_DISPON, cbMAX_DIAS_DISPON.Checked);
      HabilitaCtrl(edMAX_TASA       , cbMAX_TASA.Checked);
      End;
end;

// Termina modificaciones SATV4766

procedure TWCrCto.FormShow(Sender: TObject);
begin
      icpCONTRATO.Frame := Objeto.Contrato;
      icpCONTRATO.RefrescaInfo;

      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_CONTRATO.Control:=icpCONTRATO;
      Objeto.FOL_CONTRATO.Control:=lbFOL_CONTRATO;
      Objeto.CVE_PRODUCTO_CRE.Control:=edCVE_PRODUCTO_CRE;
      Objeto.B_EVENTUAL.Control:=chB_EVENTUAL;
      Objeto.B_LITIGIOSO.Control:=chB_LITIGIOSO;
      Objeto.B_REESTRUCTURA.Control:=chB_REESTRUCTURA;
      Objeto.F_AUT_COMITE.Control:= edF_AUT_COMITE;
      Objeto.CVE_COMITE_AUT.Control:=edCVE_COMITE_AUT;
      Objeto.CVE_USU_AUTORIZA.Control:=edCVE_USU_AUTORIZA;
      Objeto.DIAS_PLAZO.Control:=edDIAS_PLAZO;
      Objeto.F_VENCIMIENTO.Control:=edF_VENCIMIENTO;
      Objeto.CVE_TASA_REFER.Control:=edCVE_TASA_REFER;
      Objeto.OPERADOR_STASA.Control:=cbOPERADOR_STASA;
      Objeto.SOBRETASA.Control:=edSOBRETASA;
      Objeto.IMP_AUTORIZADO.Control:=edIMP_AUTORIZADO;
      Objeto.IMP_DISPUESTO.Control:=edIMP_DISPUESTO;
      Objeto.TOTAL_FINANC_ADIC.Control:=edIMP_FINANC_ADIC;
      Objeto.TX_COND_GRALES.Control:=mTX_COND_GRALES;
      Objeto.SIT_LINEA.Control:=lbSIT_LINEA;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control:=edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;
      Objeto.DISPONIBLE_AUT.Control:=iedDISPONIBLE_AUT;
      Objeto.DISPONIBLE_ACRED.Control:=iedDISPONIBLE_ACRED;
      Objeto.CVE_ORIGEN_REC.Control:=edCVE_ORIGEN_REC;
      Objeto.CVE_DESTINO.Control:=edCVE_DESTINO;
      Objeto.DISPONIBLE_GRUPO_ECO.Control := edDISPONIBLE_GRUPO_ECO;
      Objeto.CVE_MONEDA.Control:=edCVE_MONEDA;
      Objeto.B_REVOLVENTE.Control:=chB_REVOLVENTE;
      Objeto.B_FINANC_ADIC.Control:=chB_FINANC_ADIC;
      Objeto.RIESGO_TOTAL.Control:=iedRIESGO_TOTAL;
      Objeto.TASA_BASE.Control := edTASA_BASE;
      //Objeto.B_APL_INSCR_DEUD.Control := chB_APL_INSCR_DEUD;
      //Objeto.CVE_TIP_INSCR_D.Control := cbCVE_TIP_INSCR_D;
      //Objeto.NUM_INSCR_DEUDA.Control := edNUM_INSCR_DEUDA;
      //Objeto.F_ALTA_INSCR_DEU.Control := edF_ALTA_INSCR_DEU;
      //Objeto.F_PROG_INSCR_D.Control := edF_PROG_INSCR_D;
      Objeto.B_PARAMETRICO.Control := chB_PARAMETRICO;
      Objeto.B_FINAN_CALIF.Control := chB_FINAN_CALIF;
      Objeto.B_APL_CONVE_MOD.Control := chB_APL_CONVE_MOD;
      Objeto.B_APL_EVEN_ACEL.Control := chB_APL_EVEN_ACEL;
      Objeto.B_APL_PRORROGA.Control := chB_APL_PRORROGA;
      //Objeto.CVE_FUENTE_PAGO.Control := cbCVE_FUENTE_PAGO;
      Objeto.B_APL_RENOVACION.Control := chB_APL_RENOVACION;
      Objeto.CVE_GPO_CAPITALIZ.Control := edCVE_GPO_CAPITALIZ;
      Objeto.IMP_EXCESO_EVE.Control := edIMP_EXCESO_EVE;
      Objeto.F_VTO_EXCESO.Control := edF_VTO_EXCESO;
      Objeto.IMP_AUT_ORIG.Control := edIMP_AUT_ORIG;

      //Nuevos check Box Agregados    26/10/2011
      //Objeto.B_Ins_Irrev.Control := chB_Ins_Irrev;
      //Objeto.B_Mandato.Control   := chB_Mandato;
      //Objeto.B_Gar_Part.Control  := chB_Gar_Part;
      //Objeto.B_Gar_Aport.Control := chB_Gar_Aport;


      //LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT
      Objeto.CVE_SUB_TIP_COB.Control := cbCVE_SUB_TIP_COB;
      //ENDS_LOLS

      // Inicia modificaciones SATV4766 el 11JUL2006
      Objeto.IMP_BLOQUEADO.Control := edIMP_BLOQUEADO;
      Objeto.B_DISP_EN_LINEA.Control := cbB_DISP_EN_LINEA;
      Objeto.MAX_PZO_DISP.Control := edMAX_PZO_DISP;
      Objeto.MAX_DIAS_DISPON.Control := edMAX_DIAS_DISPON;
      Objeto.MAX_TASA.Control := edMAX_TASA;
      // Termina modificaciones SATV4766

      Objeto.Periodicidad_CAT.Control     := edPeriodicidad_CAT;       //AGF 12/05/2016
      Objeto.Periodicidad_Interes.Control := edPeriodicidad_Interes;

      Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.Acreditado.Persona.Cve_Tipo_Sector.Control := edSECTOR_CORP;
      Objeto.GetParams(Objeto);

      Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO;
      Objeto.Producto.GetParams(Objeto);

      Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);

      Objeto.TasaRefer.CVE_TASA_INDICAD.Control := edCVE_TASA_REFER;
      Objeto.TasaRefer.DESC_TASA_INDIC.Control := edDESC_TASA_REFER;
      Objeto.TasaRefer.GetParams(Objeto);

      Objeto.OrigRec.DESC_ORIGEN_REC.Control := edDESC_ORIGEN_REC;
      Objeto.OrigRec.GetParams(Objeto);

      Objeto.Destino.DESC_DESTINO.Control := edDESC_DESTINO;
      Objeto.Destino.GetParams(Objeto);

      Objeto.PctCapiliz.PCT_CAPITALIZA.Control := edPCT_CAPITALIZA;
      Objeto.PctCapiliz.DESC_CAPITALIZA.Control := edDESC_CAPITALIZA;
      Objeto.PctCapiliz.GetParams(Objeto);

      //<LOLS 07 AGO 2006. CREDITO EN LINEA DISPOSICION MARCO>
      Objeto.ID_CREDITO_MARCO.Control := edID_CREDITO_MARCO;
      Objeto.CrCreMar.ID_CREDITO_MARCO.Control := edID_CREDITO_MARCO;
      //<ENDS_LOLS>

      Objeto.NOM_PROM_ADM.Control := edNAME_PROM_ADM; // </ EASA4011  09.MAR.2007      Req. Promotor asignado
      Objeto.ID_PROM_ADMON.Control := edID_PROM_ADM; // </ EASA4011  09.MAR.2007      Req. Promotor asignado

      //
      Objeto.ROE_BRUTA.Control := edROE_BRUTA;
      Objeto.ROE_NETA.Control := edROE_NETA;
      Objeto.PCT_REQ_CAP_MER.Control := edPCT_REQ_CAP_MER;
      Objeto.PCT_REQ_CAP_CRE.Control := edPCT_REQ_CAP_CRE;
      Objeto.PCT_CAPITALIZ.Control := edPCT_CAPITALIZ;

      Objeto.CVE_CARACT_CTO.Control := edCVE_CARACT_CTO;
      Objeto.DES_CVE_CARACT_CTO.Control := edDES_CVE_CARACT_CTO;
      Objeto.CVE_COMPROB_ING.Control := edCVE_COMPROB_ING;
      Objeto.DES_CVE_COMPROB_ING.Control := edDES_CVE_COMPROB_ING;
      Objeto.CVE_SEC_LABORAL.Control := edCVE_SEC_LABORAL;
      Objeto.DESC_CVE_SEC_LABORAL.Control := edDESC_CVE_SEC_LABORAL;
      Objeto.IMP_INGRESOS_ACR.Control := edIMP_INGRESOS_ACR;
      Objeto.NO_CONSUL_BURO.Control := edNO_CONSUL_BURO;

      Objeto.B_EMPROBLEMADA.Control := chB_EMPROBLEMADA;
      Objeto.B_EMPLEADO.Control := chB_EMPLEADO;

      //SATV4766 03 DIC 2009 ADECUACIONES DE ACUERDO AL REQUERIMIENTO DE LA CERTIFICACION R04
      //INICIO MODIFICACIONES
      Objeto.B_RAMO_28.Control := chB_RAMO_28;
      Objeto.B_ESTRUCTURADO.Control := chB_ESTRUCTURADO;
      //FIN MODIFICACIONES
      //SATV4766 03 DIC 2009 ADECUACIONES DE ACUERDO AL REQUERIMIENTO DE LA CERTIFICACION R04

       //RIRA4281 01 JUN 2010 ADECUACIONES DE ACUERDO AL REQUERIMIENTO DE LA CERTIFICACION R04
       Objeto.ID_AVAL_GOB.Control     := edID_AVAL_GOB;
       Objeto.DESC_ACRED_GOB.Control := edDESC_ACRED_GOB;

       //RIRA4281 18Jun2010 Se agrega el analista responsable
       Objeto.CVE_ANALISTA_RES.Control := edCVE_ANALISTA_RES;

       {RUCJ4248 22/OCT/2013}
       Objeto.B_TIPO_LINEA.Control := chkB_TIPO_LINEA;
       Objeto.B_PRELACION_PGO.Control := chkB_PRELACION_PGO;
       Objeto.CVE_FORMA_DISP.Control := chCVE_FORMA_DISP;
       Objeto.CVE_TIPO_ALTA.Control := edCVE_TIPO_ALTA;
       Objeto.DESC_TIPO_ALTA.Control := edDESC_TIPO_ALTA;
       Objeto.CODIGO_CNBV.Control := EdCod_CNBV;
       Objeto.B_HIT_SIC.Control := chkB_HIT_SIC;
       Objeto.F_REP_SIC.Control	:= edF_REP_SIC;
       Objeto.B_REPORTE_SIC.Control := chkB_REPORTE_SIC;
       {RUCJ4248 22/OCT/2013}

       Objeto.CODIGO_CNBV.Control := EdCod_CNBV; //--- ASOR --- MAYO 2016 --

      Objeto.CVE_PRODUCTO_BCA.Control:=edCVE_PRODUCTO_BCA;
      Objeto.DESC_PROD_BCA.Control:=edDESC_PROD_BCA;

      Objeto.ProductoBCA.CVE_PRODUCTO_BCA.Control := edCVE_PRODUCTO_BCA;
      Objeto.ProductoBCA.DESC_L_PRODUCTO.Control := edDESC_PROD_BCA;
      Objeto.ProductoBCA.GetParams(Objeto);

      Objeto.UTiempoPeriodicidadCAT.DESCRIPCION.Control := edDesc_Periodicidad_CAT;       //AGF 12/05/2016
      Objeto.UTiempoPeriodicidadCAT.GetParams(Objeto);                                    //AGF 12/05/2016
      Objeto.UTiempoPeriodicidadINT.DESCRIPCION.Control := edDesc_Periodicidad_Interes;   //AGF 24/05/2016
      Objeto.UTiempoPeriodicidadINT.GetParams(Objeto);                                    //AGF 24/05/2016

      Objeto.CVE_TIPO_BAJA.Control  := edCve_Tipo_Baja;                                   //AGF 27/06/2016
      Objeto.DESC_TIPO_BAJA.Control := edDesc_Tipo_Baja;                                  //AGF 28/06/2016
      Objeto.F_BAJA.Control         := edF_Baja;                                          //AGF 27/06/2016

      InterForma1.MsgPanel := MsgPanel;

      lblProducto            := TBlinkLabel.Create (Self);
      lblProducto.Parent     := Interforma1.BtnNuevo.Parent;
      lblProducto.Height     := 50;
      lblProducto.Left       := Interforma1.BtnNuevo.Left;
      lblProducto.Width      := Interforma1.BtnNuevo.Width;
      lblProducto.Top        := Interforma1.BtnCancelar.Top +
                                Interforma1.BtnCancelar.Height + 10;
      lblProducto.AutoSize   := False;
      lblProducto.Visible    := False;
      lblProducto.Active     := False;
      lblProducto.WordWrap   := True;
      lblProducto.Interval   := 500;
      lblProducto.Font.Color := clRed;
end;

procedure TWCrCto.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CONTRATO.Control:=nil;
      Objeto.FOL_CONTRATO.Control:=nil;
      Objeto.CVE_PRODUCTO_CRE.Control:=nil;
      Objeto.B_EVENTUAL.Control:=nil;
      Objeto.B_LITIGIOSO.Control:=nil;
      Objeto.B_REESTRUCTURA.Control:=nil;
      Objeto.F_AUT_COMITE.Control:=nil;
      Objeto.CVE_COMITE_AUT.Control:=nil;
      Objeto.CVE_USU_AUTORIZA.Control:=nil;
      Objeto.DIAS_PLAZO.Control:=nil;
      Objeto.F_VENCIMIENTO.Control:=nil;
      Objeto.CVE_TASA_REFER.Control:=nil;
      Objeto.OPERADOR_STASA.Control:=nil;
      Objeto.SOBRETASA.Control:=nil;
      Objeto.IMP_AUTORIZADO.Control:=nil;
      Objeto.IMP_DISPUESTO.Control:=nil;
      Objeto.TOTAL_FINANC_ADIC.Control:=nil;
      Objeto.TX_COND_GRALES.Control:=nil;
      Objeto.SIT_LINEA.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
      Objeto.DISPONIBLE_AUT.Control:=nil;
      Objeto.DISPONIBLE_ACRED.Control:=nil;
      Objeto.CVE_ORIGEN_REC.Control:=nil;
      Objeto.CVE_DESTINO.Control:=nil;
      Objeto.DISPONIBLE_GRUPO_ECO.Control := nil;
      Objeto.CVE_MONEDA.Control:=nil;
      Objeto.B_REVOLVENTE.Control:=nil;
      Objeto.B_FINANC_ADIC.Control:=nil;
      Objeto.RIESGO_TOTAL.Control:=nil;
      Objeto.TASA_BASE.Control := nil;
      //Objeto.B_APL_INSCR_DEUD.Control :=nil;
      //Objeto.CVE_TIP_INSCR_D.Control :=nil;
      //Objeto.NUM_INSCR_DEUDA.Control :=nil;
      //Objeto.F_ALTA_INSCR_DEU.Control :=nil;
      //Objeto.F_PROG_INSCR_D.Control :=nil;
      Objeto.B_PARAMETRICO.Control :=nil;
      Objeto.B_FINAN_CALIF.Control :=nil;
      Objeto.B_APL_CONVE_MOD.Control :=nil;
      Objeto.B_APL_EVEN_ACEL.Control :=nil;
      Objeto.B_APL_PRORROGA.Control :=nil;
      //Objeto.CVE_FUENTE_PAGO.Control :=nil;
      Objeto.B_APL_RENOVACION.Control := nil;
      Objeto.CVE_GPO_CAPITALIZ.Control :=nil;
      Objeto.IMP_EXCESO_EVE.Control := nil;
      Objeto.F_VTO_EXCESO.Control := nil;
      Objeto.IMP_AUT_ORIG.Control := nil;

       //Nuevos check Box Agregados    26/10/2011
      //Objeto.B_Ins_Irrev.Control := nil;
      //Objeto.B_Mandato.Control   := nil;
      //Objeto.B_Gar_Part.Control  := nil;
      //Objeto.B_Gar_Aport.Control := nil;

      //LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT
      Objeto.CVE_SUB_TIP_COB.Control := nil;
      //ENDS_LOLS


      // Inicia modificaciones SATV4766 el 11JUL2006
      Objeto.IMP_BLOQUEADO.Control := nil;
      Objeto.B_DISP_EN_LINEA.Control := nil;
      Objeto.MAX_PZO_DISP.Control := nil;
      Objeto.MAX_DIAS_DISPON.Control := nil;
      Objeto.MAX_TASA.Control := nil;
      // Termina modificaciones

      Objeto.Periodicidad_CAT.Control     := nil;    //AGF 12/05/2016
      Objeto.Periodicidad_Interes.Control := nil;    //AGF 24/05/2016

      Objeto.Acreditado.ID_ACREDITADO.Control := nil;
      Objeto.Acreditado.Persona.Nombre.Control := nil;
      Objeto.Acreditado.Persona.Cve_Tipo_Sector.Control := nil;

      Objeto.Producto.DESC_C_PRODUCTO.Control := nil;

      Objeto.Moneda.Cve_Moneda.Control := nil;
      Objeto.Moneda.Desc_Moneda.Control := nil;
      Objeto.TasaRefer.CVE_TASA_INDICAD.Control := nil;
      Objeto.TasaRefer.DESC_TASA_INDIC.Control := nil;

      Objeto.OrigRec.DESC_ORIGEN_REC.Control := nil;
      Objeto.Destino.DESC_DESTINO.Control := nil;

      Objeto.PctCapiliz.PCT_CAPITALIZA.Control := nil;
      Objeto.PctCapiliz.DESC_CAPITALIZA.Control := nil;

      //<LOLS 07 AGO 2006. CREDITO EN LINEA DISPOSICION MARCO>
      Objeto.ID_CREDITO_MARCO.Control := nil;
      Objeto.CrCreMar.ID_CREDITO_MARCO.Control := nil;
      //<ENDS_LOLS>
      Objeto.NOM_PROM_ADM.Control := nil; // </ EASA4011  09.MAR.2007      Req. Promotor asignado
      Objeto.ID_PROM_ADMON.Control := nil; // </ EASA4011  09.MAR.2007      Req. Promotor asignado

      Objeto.ROE_BRUTA.Control := nil;
      Objeto.ROE_NETA.Control := nil;
      Objeto.PCT_REQ_CAP_MER.Control := nil;
      Objeto.PCT_REQ_CAP_CRE.Control := nil;
      Objeto.PCT_CAPITALIZ.Control := nil;
      Objeto.CVE_CARACT_CTO.Control := nil;
      Objeto.DES_CVE_CARACT_CTO.Control := nil;
      Objeto.CVE_COMPROB_ING.Control := nil;
      Objeto.DES_CVE_COMPROB_ING.Control := nil;
      Objeto.CVE_SEC_LABORAL.Control := nil;
      Objeto.DESC_CVE_SEC_LABORAL.Control := nil;
      Objeto.IMP_INGRESOS_ACR.Control := nil;
      Objeto.NO_CONSUL_BURO.Control := nil;

      Objeto.B_EMPROBLEMADA.Control := nil;
      Objeto.B_EMPLEADO.Control := nil;

      //SATV4766 03 DIC 2009 ADECUACIONES DE ACUERDO AL REQUERIMIENTO DE LA CERTIFICACION R04
      //INICIO MODIFICACIONES
      Objeto.B_RAMO_28.Control := nil;
      Objeto.B_ESTRUCTURADO.Control := nil;
      //FIN MODIFICACIONES
      //SATV4766 03 DIC 2009 ADECUACIONES DE ACUERDO AL REQUERIMIENTO DE LA CERTIFICACION R04

      //RIRA4281
      Objeto.DESC_ACRED_GOB.Control := nil;
      Objeto.ID_AVAL_GOB.Control := nil;
      Objeto.CVE_ANALISTA_RES.Control := nil;

      {RUCJ4248 22/OCT/2013}
      Objeto.B_TIPO_LINEA.Control := nil;
      Objeto.B_PRELACION_PGO.Control := nil;
      Objeto.CVE_FORMA_DISP.Control := nil;
      oBJETO.CVE_TIPO_ALTA.Control := nil;
      Objeto.DESC_TIPO_ALTA.Control := nil;
      Objeto.B_HIT_SIC.Control := nil;
      Objeto.F_REP_SIC.Control := nil;
      Objeto.B_REPORTE_SIC.Control := nil;
      {RUCJ4248 22/OCT/2013}

      Objeto.CVE_PRODUCTO_BCA.Control:= nil;
      Objeto.DESC_PROD_BCA.Control:= nil;
      Objeto.ProductoBCA.CVE_PRODUCTO_BCA.Control := nil;
      Objeto.ProductoBCA.DESC_L_PRODUCTO.Control := nil;
      Objeto.CODIGO_CNBV.Control := Nil;     // --- ASOR --- MAYO 2016 ---

      Objeto.CVE_TIPO_BAJA.Control  := nil;  //AGF 26/06/2016
      Objeto.DESC_TIPO_BAJA.Control := nil;  //AGF 28/06/2016
      Objeto.F_BAJA.Control         := nil;  //AGF 26/06/2016
end;

procedure TWCrCto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCto.InterForma1DespuesNuevo(Sender: TObject);
begin
        Objeto.Acreditado.BuscaWhereString := 'CR_ACREDITADO.SIT_ACREDITADO =' + SQLStr(CSIT_AC) ;
        Objeto.Acreditado.FilterString := Objeto.Acreditado.BuscaWhereString;
        MuestraHints;
        Objeto.CVE_PRODUCTO_CRE.AsString := Objeto.Producto.CVE_PRODUCTO_CRE.AsString;
        Objeto.F_AUT_COMITE.AsDateTime := Objeto.Apli.DameFechaEmpresa;
        Objeto.F_VENCIMIENTO.AsDateTime := Objeto.Apli.DameFechaEmpresa;
      	Objeto.SIT_LINEA.AsString := 'NA';
        Objeto.F_ALTA.AsDateTime := Now;
        Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;

        Objeto.IMP_AUTORIZADO.AsFloat := 0;
        Objeto.IMP_DISPUESTO.AsFloat := 0;
        Objeto.IMP_TRANSITO.AsFloat := 0;
        Objeto.TOTAL_FINANC_ADIC.AsFloat := 0;
        Objeto.RIESGO_TOTAL.AsFloat := 0;

        Objeto.DISPONIBLE_AUT.AsFloat:= 0;
        Objeto.DISPONIBLE_ACRED.AsFloat:= 0;

        Objeto.DIAS_TOLERANCIA.AsInteger := 0;
        Objeto.TASA_BASE.AsFloat := 0;
        edTASA_BASE.Enabled := True;
        edACREDITADO.SetFocus;
        //EASA4011 GOBYMUN      22042005
        //Objeto.CVE_TIP_INSCR_D.AsString:= 'No Aplica';
        //Objeto.CVE_FUENTE_PAGO.AsString:= '';

        // Inicia modificaciones SATV4766 el 11JUL2006
        HabilitaControles;
        Objeto.B_DISP_EN_LINEA.AsString := Objeto.Producto.B_DISP_EN_LINEA.AsString;
        Objeto.IMP_BLOQUEADO.AsFloat := 0;
        //HabilitaCtrlInscDeuda(Objeto.B_APL_INSCR_DEUD.AsString = CVERDAD);
        // Inicia modificaciones SATV4766 el 01AGO2006
        Objeto.NUM_METODO_DISP.AsInteger    := 2; // Metodo para obtener disponible para realizar el alta de Autorizaciones
        // Termina modificaciones SATV4766

        // </ EASA4011  09.MAR.2007      Req. Promotor asignado
        lbPromAdmon.Visible := False;
        edID_PROM_ADM.Visible := False;
        btPROM_ADM.Visible := False;
        edNAME_PROM_ADM.Visible := False;
        //  EDN_EASA >/

end;

procedure TWCrCto.InterForma1DespuesModificar(Sender: TObject);
var     VLSalida    : Boolean;
        VLMsg       : String;
begin
        if not ValidaRFC then
        begin
                VlSalida := False;
                VLMsg := 'El Acreditado no tiene RFC o está incompleto';
                InterForma1.ValidaExit(edACREDITADO,VLSalida,VLMsg,True);
        end;
        Objeto.F_MODIFICA.AsDateTime := Now;
        Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
        Objeto.ObtenDisponibleAut(Objeto.ID_CONTRATO.AsString,Objeto.FOL_CONTRATO.AsString);
        Objeto.RefinanAut(Objeto.ID_CONTRATO.AsString, Objeto.FOL_CONTRATO.AsString);
        validaTasaFija(Objeto.CVE_TASA_REFER.AsString,edTASA_BASE);
        VerificaTasaRefer;
       if ( Objeto.Producto.CVE_REVOLVENCIA.AsString = C_NR  ) or
          ( Objeto.Producto.CVE_REVOLVENCIA.AsString = CNULL ) then
          chB_REVOLVENTE.Enabled := False
       else
          chB_REVOLVENTE.Enabled := True;

       if ( Objeto.Producto.B_FINANC_ADIC.AsString = CFALSO ) or
          ( Objeto.Producto.B_FINANC_ADIC.AsString = CNULL  ) then
          chB_FINANC_ADIC.Enabled := False
       else
          chB_FINANC_ADIC.Enabled := true;
       edCVE_PRODUCTO_CRE.SetFocus;

       HabilitaControles; // SATV4766 el 12Jul2006
       //HabilitaCtrlInscDeuda(Objeto.B_APL_INSCR_DEUD.AsString = CVERDAD);
end;

procedure TWCrCto.edCVE_PRODUCTO_CREExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
  Function ValidaSector(var vlMsg: String): Boolean;
  var vlCount : Integer;
      vlResult: Boolean;
  Begin
     vlCount:= 0;
     vlResult:= True;
     vlMsg:='';
     GetSQLInt(' SELECT COUNT(*) COUNT FROM CR_PROD_SEC_CONT ' +
               ' WHERE CVE_PRODUCTO_CRE = ' + SQLStr(Objeto.Producto.CVE_PRODUCTO_CRE.AsString) +
               ' AND CVE_SECTOR_CONTAB  = ' + Objeto.Acreditado.Persona.Cve_Tipo_Sector.AsString,
               Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,'COUNT',vlCount ,False);
     If vlCount = 0 Then
     Begin
        vlMsg:='Sector contable no permitido en este producto';
        ShowMessage(vlMsg);
        vlResult:= False;
     end;
     Result := vlResult;
  end;

  Function ObtTipoCartera(vlCVE_CAT_MINIMO: String): String;
  var vlResult: String;
  Begin
     vlResult:= '';
     vlMsg:='';

     GetSQLStr(' SELECT CVE_AGRUPACION  FROM CR_REG_CARTERA ' +
               ' WHERE CVE_CAT_MINIMO = ' + SQLStr(vlCVE_CAT_MINIMO),
               Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,'CVE_AGRUPACION',vlResult ,False);
     Result := vlResult;
  end;
begin
   VLMsg := '';
   VLValida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
//      VLMsg := '';
//      VLValida := True;
      Objeto.CVE_PRODUCTO_CRE.GetFromControl;
      If Objeto.CVE_PRODUCTO_CRE.AsString = '' then
      begin
         VLMsg := 'Favor de Indicar la Clave del Producto';
         VLValida := False;
      end;

      Objeto.Moneda.BuscaWhereString := '';
      Objeto.Moneda.FilterString := Objeto.Moneda.BuscaWhereString;

      if ( Objeto.Acreditado.B_APLI_REL_MON.AsString <> CVERDAD ) then
      Begin
         Objeto.Moneda.BuscaWhereString := 'MONEDA.CVE_MONEDA IN ( SELECT CVE_MONEDA FROM CR_REL_ACRE_MON ' +
                                           ' WHERE ID_ACREDITADO = ' + Objeto.Acreditado.ID_ACREDITADO.AsString +
                                           ' UNION ' +
                                           ' SELECT CVE_MONEDA FROM CR_REL_PROD_MON  ' +
                                           ' WHERE CVE_PRODUCTO_CRE = ' + SQLSTR(Objeto.Producto.CVE_PRODUCTO_CRE.AsString) + ')';
         Objeto.Moneda.FilterString := Objeto.Moneda.BuscaWhereString;
      end;

      if InterForma1.IsNewData then
      Begin
         VerfBanderas;
         if edCVE_PRODUCTO_CRE.Text <> '' then
           VLValida := ValidaSector(VLMsg);
         //end if
      end

      else
      Begin
         edCVE_TASA_REFER.Color := clWindow;
         edCVE_TASA_REFER.Enabled :=True;
         btTASA_REFER.Enabled := True;
         Objeto.TasaRefer.Active := True;
         cbOPERADOR_STASA.Color := clWindow;
         cbOPERADOR_STASA.Enabled :=True;
         edSOBRETASA.Color := clWindow;
         edSOBRETASA.Enabled :=True;
         VerificaTasaRefer;
      end;

      if ObtTipoCartera(objeto.Producto.CVE_CLAS_CONTAB.AsString) <> 'CARTHIPO' then
      begin
           edCVE_SEC_LABORAL.Enabled := False;
           edCVE_SEC_LABORAL.Color := clBtnFace;
           btCVE_SEC_LABORAL.Enabled :=False;

           edCVE_COMPROB_ING.Enabled := False;
           edCVE_COMPROB_ING.Color := clBtnFace;
           btCVE_COMPROB_ING.Enabled := False;

           chB_EMPLEADO.Enabled := False;
      end
      else
      begin
           edCVE_SEC_LABORAL.Enabled := True;
           edCVE_SEC_LABORAL.Color := clWindow;
           btCVE_SEC_LABORAL.Enabled :=True;

           edCVE_COMPROB_ING.Enabled := True;
           edCVE_COMPROB_ING.Color := clWindow;
           btCVE_COMPROB_ING.Enabled := True;

           chB_EMPLEADO.Enabled := True;
      end;
   end;
      InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,VLValida,VLMsg,True);
end;

procedure TWCrCto.edF_AUT_COMITEExit(Sender: TObject);
Var     VLValida        : Boolean;
        VLMsg           : String;
begin
   VLMsg := '';
   VLValida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     Objeto.F_AUT_COMITE.GetFromControl;

     If Objeto.F_AUT_COMITE.AsString <> '' then
        if (ValidaFecha(Objeto.F_AUT_COMITE.AsDateTime,Objeto.Apli) >= 1) then
        Begin
           VLMsg := 'La fecha de autorización no es válida';
           VLValida := False;
        end;
   end;
   InterForma1.ValidaExit(edF_AUT_COMITE,VLValida,VLMsg,True);
end;

procedure TWCrCto.edCVE_COMITE_AUTExit(Sender: TObject);
var     VLValida  :     Boolean;
        VLMsg     :     String;
begin
   VLMsg := '';
   VLValida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.F_AUT_COMITE.GetFromControl;
      Objeto.CVE_COMITE_AUT.GetFromControl;

      if (Objeto.F_AUT_COMITE.AsString <> '') and
         (Objeto.CVE_COMITE_AUT.AsString <> '') then
             Objeto.SIT_LINEA.AsString := 'AU'
      else   Objeto.SIT_LINEA.AsString := 'NA';
      //end if;

      if (Objeto.F_AUT_COMITE.AsString <> '') and
         (Objeto.CVE_COMITE_AUT.AsString = '') then
      Begin
         VLMsg := 'Necesita la Clave de Autorización del Comité';
         VLValida := False;
      end
      else if (Objeto.F_AUT_COMITE.AsString = '') and
              (Objeto.CVE_COMITE_AUT.AsString <> '') then
      Begin
         VLMsg := 'Necesita la Fecha de Autorización del Comité';
         VLValida := False;
      end;
   end;
   InterForma1.ValidaExit(edCVE_COMITE_AUT,VLValida,VLMsg,True);
end;

procedure TWCrCto.edDIAS_PLAZOExit(Sender: TObject);
var     VLFVencimiento : TDate;
        VLValida      : Boolean;
        VLMsg          : String;
begin
   VLMsg := '';
   VLValida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.DIAS_PLAZO.GetFromControl;
      Objeto.F_AUT_COMITE.GetFromControl;
      If Objeto.F_AUT_COMITE.AsString <> '' then
      Begin
         if Objeto.Producto.B_RANGO_PLA_CRE.AsString = CVERDAD THEN
         Begin //Procedimiento extraido de IntGenCre;
           if not ValNumPositivo(VLMsg,Objeto.DIAS_PLAZO.AsInteger) then
              vlValida := False
           else
           if Objeto.DIAS_PLAZO.AsInteger = 0 then
              Objeto.DIAS_PLAZO.AsInteger := Objeto.Producto.PLAZO_MIN_CREDITO.AsInteger;
           //end if;
           if ((Objeto.DIAS_PLAZO.AsInteger < Objeto.Producto.PLAZO_MIN_CREDITO.AsInteger)or
               (Objeto.DIAS_PLAZO.AsInteger > Objeto.Producto.PLAZO_MAX_CREDITO.AsInteger)) then
           Begin
              VLMsg :=' El Plazo de la Disposición no está dentro del rango del Plazo del Producto ' +
                      ' ( ' + Objeto.Producto.PLAZO_MIN_CREDITO.AsString + ' - ' +
                              Objeto.Producto.PLAZO_MAX_CREDITO.AsString + ' ) ' ;
              VLValida := False;
           end;

           if VLValida then
           Begin
              VLFVencimiento := Objeto.F_AUT_COMITE.AsDateTime + Objeto.DIAS_PLAZO.AsInteger;
              if ValidaFecha(VLFVencimiento,Objeto.Apli) <> 0 then
              Begin
                   VLMsg := ' La fecha de vencimiento es un día no hábil';
                   VLValida := False;
              end
              else
                   Objeto.F_VENCIMIENTO.AsDateTime := VLFVencimiento;
              //end if
           end;
         end;
      end;
   end;
   InterForma1.ValidaExit(edDIAS_PLAZO,VLValida,VLMsg,True);
end;

procedure TWCrCto.edF_VENCIMIENTOExit(Sender: TObject);
var     VLValida        : Boolean;
        VlMsg           : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VlMsg := '';
      VLValida := True;
      Objeto.DIAS_PLAZO.GetFromControl;
      Objeto.F_AUT_COMITE.GetFromControl;
      Objeto.F_VENCIMIENTO.GetFromControl;
      If Objeto.F_AUT_COMITE.AsString <> '' then
      Begin
//<EASA401     22 DIC 2005   >
//         if Objeto.F_VENCIMIENTO.AsDateTime <> Objeto.F_AUT_COMITE.AsDateTime + Objeto.DIAS_PLAZO.AsInteger then
//         Begin
            if ValidaFecha(Objeto.F_VENCIMIENTO.AsDateTime,Objeto.Apli) <> 0 then
            Begin
               VLMsg := ' La fecha de vencimiento es un día no hábil';
               VLValida := False;
            end
            else
               Objeto.DIAS_PLAZO.AsInteger := Objeto.F_VENCIMIENTO.AsInteger - Objeto.F_AUT_COMITE.AsInteger;
            //end if

            if VLValida then
            Begin
               if ((Objeto.DIAS_PLAZO.AsInteger < Objeto.Producto.PLAZO_MIN_CREDITO.AsInteger)or
                   (Objeto.DIAS_PLAZO.AsInteger > Objeto.Producto.PLAZO_MAX_CREDITO.AsInteger)) then
               Begin
                  VLMsg :=' El Plazo de la disposición no está dentro del rango del Plazo del Producto ' +
                          ' ( ' + Objeto.Producto.PLAZO_MIN_CREDITO.AsString + ' - ' +
                                  Objeto.Producto.PLAZO_MAX_CREDITO.AsString + ' ) ' ;
                  VLValida := False;
               end;
            end;
//         end;
      end
      else
         Objeto.F_VENCIMIENTO.AsDateTime := Objeto.Apli.DameFechaEmpresa;
      //end if;
         InterForma1.ValidaExit(edF_VENCIMIENTO,VLValida,VlMsg,True);
   end;
end;

procedure TWCrCto.chB_EVENTUALExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_EVENTUAL,true,'',True);
end;

procedure TWCrCto.chB_LITIGIOSOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_LITIGIOSO,true,'',True);
end;

procedure TWCrCto.chB_REESTRUCTURAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_REESTRUCTURA,true,'',True);
end;

procedure TWCrCto.edCVE_TASA_REFERExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
    vlSpredProd : String;
begin
   vlSalida := True;
   vlMsg := CNULL;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin

     IF Objeto.Producto.B_INDICA_TASA_AU.AsString = CVERDAD then
     Begin
       Objeto.CVE_TASA_REFER.GetFromControl;
       if Objeto.CVE_TASA_REFER.AsString = CNULL then
       Begin
          vlSalida := False;
          vlMsg := 'Favor de Indicar la Tasa de Referencia';
       end;
     end;
      if Objeto.Producto.B_MOD_TASA_BASE.AsString = CFALSO then
      Begin
         edTASA_BASE.Color := clBtnFace;
         edTASA_BASE.Enabled :=False;
      end
      else
      Begin
         validaTasaFija(Objeto.CVE_TASA_REFER.AsString,edTASA_BASE);
      end;

      //EASA4011 09.ENE.2007 ASIGNACION SOBRETASA PRODUCTO MONEDA
      if InterForma1.IsNewData then
      Begin
         vlSpredProd:= '0';
         GetSqlStr(' SELECT NVL(SOBRETASA,0) SOBRETASA FROM CR_REL_PROD_MON WHERE CVE_MONEDA = ' + Objeto.CVE_MONEDA.AsString +
                   '   AND CVE_PRODUCTO_CRE = '+ SQLSTR(Objeto.Producto.CVE_PRODUCTO_CRE.AsString) +
                   '   AND CVE_TASA_REFER = '+ SQLSTR(Objeto.CVE_TASA_REFER.AsString),
                  Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'SOBRETASA',vlSpredProd,False);
         IF vlSpredProd = '' THEN
            vlSpredProd := '0';
         //
         Objeto.SOBRETASA.AsFloat := StrToFloat(vlspredProd);
      end;
      //OFF ESAS.09.ENE.2007
   end;
   InterForma1.ValidaExit(edCVE_TASA_REFER,vlSalida,vlMsg,True);
end;

procedure TWCrCto.cbOPERADOR_STASAExit(Sender: TObject);
var vlSalida : Boolean;
    vlMesg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlMesg   := CNULL;
     vlSalida := True;
     IF Objeto.Producto.B_INDICA_TASA_AU.AsString = CVERDAD then
     Begin
        Objeto.OPERADOR_STASA.GetFromControl;
        if Objeto.OPERADOR_STASA.AsString = CNULL then
        Begin
           vlSalida := False;
           vlMesg := 'Indique el Operador de la Sobretasa';
        end;
     end;
     InterForma1.ValidaExit(cbOPERADOR_STASA,vlSalida,vlMesg,True);
   end;
end;

procedure TWCrCto.edSOBRETASAExit(Sender: TObject);
var     vlSalida        : Boolean;
        VlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlMsg   := CNULL;
     vlSalida := True;
     IF Objeto.Producto.B_INDICA_TASA_AU.AsString = CVERDAD then
     Begin
        Objeto.SOBRETASA.GetFromControl;
        if Objeto.SOBRETASA.AsString = CNULL then
        Begin
           vlSalida := False;
           vlMsg := 'Indique de favor la Sobretasa';
        end;
     end;
     InterForma1.ValidaExit(edSOBRETASA,vlSalida,vlMsg,True);
   end;
end;

// Inicia modificaciones SATV4766 el 11JUL2006
procedure TWCrCto.cbMAX_PZO_DISPExit(Sender: TObject);
begin
  InterForma1.ValidaExit(cbMAX_PZO_DISP,True,'',True);
end;

procedure TWCrCto.edMAX_PZO_DISPExit(Sender: TObject);
var
   vlMsg      : String;
   vlSalida   : Boolean;
begin
  vlMsg := '';
  vlSalida := True;
  With Objeto Do
   If (Modo = moAppend) Or (Modo = moEdit) Then
    Begin
    MAX_PZO_DISP.GetFromControl;
    If (cbMAX_PZO_DISP.Enabled) And (cbMAX_PZO_DISP.Checked) And (MAX_PZO_DISP.AsInteger = 0) Then
        Begin
             vlMsg := 'Favor de indicar el '+cbMAX_PZO_DISP.Caption;
        End;
    End;
  //InterForma1.ValidaExit(edMAX_PZO_DISP,vlMsg = '',vlMsg,True);
  InterForma1.ValidaExit(edMAX_PZO_DISP,vlSalida,vlMsg,True);
end;

procedure TWCrCto.cbMAX_DIAS_DISPONExit(Sender: TObject);
begin
  InterForma1.ValidaExit(cbMAX_DIAS_DISPON,True,'',True);
end;

procedure TWCrCto.edMAX_DIAS_DISPONExit(Sender: TObject);
var
   vlMsg      : String;
   vlSalida   : Boolean;
begin
  vlMsg := '';
  vlSalida := True;
  With Objeto Do
   If (Modo = moAppend) Or (Modo = moEdit) Then
    Begin
    MAX_DIAS_DISPON.GetFromControl;
    If (cbMAX_DIAS_DISPON.Enabled) And (cbMAX_DIAS_DISPON.Checked) And (MAX_DIAS_DISPON.AsInteger = 0) Then
        Begin
              vlMsg := 'Favor de indicar el '+cbMAX_DIAS_DISPON.Caption;
              vlSalida := False;
        End;
    End;
  InterForma1.ValidaExit(edMAX_DIAS_DISPON, vlSalida,vlMsg,True);
end;

procedure TWCrCto.cbMAX_TASAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(cbMAX_TASA,True,'',True);
end;

procedure TWCrCto.edMAX_TASAExit(Sender: TObject);
var vlMsg : String;
begin
  vlMsg := '';
  With Objeto Do
   If (Modo = moAppend) Or (Modo = moEdit) Then
    Begin
    MAX_TASA.GetFromControl;
    If (cbMAX_TASA.Enabled) And (cbMAX_TASA.Checked) And (MAX_TASA.AsFloat = 0) Then
        Begin
        vlMsg := 'Favor de indicar la '+cbMAX_TASA.Caption;
        End;
    End;
  InterForma1.ValidaExit(edMAX_TASA,vlMsg = '',vlMsg,True);
end;

procedure TWCrCto.cbMAX_PZO_DISPClick(Sender: TObject);
begin
  HabilitaCtrl(edMAX_PZO_DISP, cbMAX_PZO_DISP.Checked);
end;

procedure TWCrCto.cbMAX_DIAS_DISPONClick(Sender: TObject);
begin
  HabilitaCtrl(edMAX_DIAS_DISPON, cbMAX_DIAS_DISPON.Checked);
end;

procedure TWCrCto.cbMAX_TASAClick(Sender: TObject);
begin
  HabilitaCtrl(edMAX_TASA, cbMAX_TASA.Checked);
end;
// Termina modificaciones SATV4766

procedure TWCrCto.edIMP_AUTORIZADOExit(Sender: TObject);
var     VLValida :     Boolean;
        VLMsg    :     String;
        vlMaxAc  :     Double;
Begin
   VLMsg    := '';
   VLValida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     Objeto.IMP_AUTORIZADO.GetFromControl;
     If Objeto.IMP_AUTORIZADO.AsFloat <> 0 then
     Begin
        if Objeto.IMP_AUTORIZADO.AsFloat > 0 then
        Begin
           if Objeto.Producto.B_RANGO_IMP_CRE.AsString = CVERDAD THEN
           Begin
             If (Objeto.IMP_AUTORIZADO.AsFloat < Objeto.Producto.IMP_MIN_AUT_CRE.AsFloat) or
                (Objeto.IMP_AUTORIZADO.AsFloat > Objeto.Producto.IMP_MAX_AUT_CRE.AsFloat) then
             Begin
                VLMsg := 'El Importe Autorizado no está dentro del Rango del Importe del Producto '+
                         ' ( ' + format(CFORMAT_DINERO,[StrToFloat(Objeto.Producto.IMP_MIN_AUT_CRE.AsString)]) + ' - ' +
                                 format(CFORMAT_DINERO,[StrToFloat(Objeto.Producto.IMP_MAX_AUT_CRE.AsString)]) + ' ) ' ;
                VLValida := False;
             end
             else
             begin
                Objeto.ObtenDisponibleAut(Objeto.ID_CONTRATO.AsString,Objeto.FOL_CONTRATO.AsString);
             end;
           end;
        end
        else
        Begin
           vlMsg := 'EL importe no puede ser negativo';
           vlValida := False;
        end;
     end;
     // Inicia modificaciones SATV4766 el 11JUL2006
     If (vlMsg = '') And (Objeto.IMP_AUTORIZADO.AsFloat = 0) Then
       Begin
       vlMsg := 'Favor de indicar el Imp. de la Autorización';
       VLValida := False;
       End;

     // LOLS 18 NOV 2006
     FillChar(vlMaxAc, sizeof(vlMaxAc), #0 );
     If (vlMsg = '') then
       vlMaxAc := Objeto.ObtenImpMaxDispAcred(Objeto.Acreditado.ID_ACREDITADO.AsString);
     // ENDS LOLS 18 NOV 2006

     If (vlMsg = '') And (Objeto.IMP_AUTORIZADO.AsFloat > vlMaxAc ) Then //Objeto.DISPONIBLE_ACRED.AsFloat) Then // LOLS 18 NOV 2006
       Begin
       vlMsg := 'El Imp. de la Autorización sobrepasa el Imp. disponible del Acreditado de:'+
                Format(CFORMAT_DINERO,[vlMaxAc]);
       VLValida := False;
       End;
     // Termina modificaciones SATV4766
     Objeto.ObtenDisponibleAut(Objeto.ID_CONTRATO.AsString,Objeto.FOL_CONTRATO.AsString);
     //LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT
     OnOffTipoCobAn;
     //ENDS_LOLS
   end;
   InterForma1.ValidaExit(edIMP_AUTORIZADO,VLValida,VLmsg,True);
end;

procedure TWCrCto.mTX_COND_GRALESExit(Sender: TObject);
begin
   mTX_COND_GRALES.Text:= Trim(mTX_COND_GRALES.Text); 
   Objeto.TX_COND_GRALES.GetFromControl;
   InterForma1.ValidaExit(mTX_COND_GRALES,true,'',True);
end;

procedure TWCrCto.btPRODUCTOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCTO_PRODUC',True,True) then
   begin
     if Objeto.ObtenPerJuridica = CPER_FISICA then
     Begin
        Objeto.Producto.BuscaWhereString:= ' CR_PRODUCTO.B_PER_FISICA = '
                                         + #39 + CVERDAD + #39
                                         + ' AND CR_PRODUCTO.SIT_PRODUCTO ='
                                         + #39 + CSIT_AC + #39 ;
        Objeto.Producto.FilterString := Objeto.Producto.BuscaWhereString;
     end
     else if Objeto.ObtenPerJuridica = CPER_MORAL then
     Begin
        Objeto.Producto.BuscaWhereString:= ' CR_PRODUCTO.B_PER_MORAL = '
                                         + #39 + CVERDAD + #39
                                         + ' AND CR_PRODUCTO.SIT_PRODUCTO ='
                                         + #39 + CSIT_AC + #39 ;
        Objeto.Producto.FilterString := Objeto.Producto.BuscaWhereString;
     end;
     //end if

     Objeto.Producto.ShowAll := True;
     if Objeto.Producto.Busca then
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
     HabilitaCtrlDispLinea; // SATV4766 el 11JUL2006
     //end if
   end;
end;

procedure TWCrCto.ilPRODUCTOEjecuta(Sender: TObject);
begin
   if Objeto.Producto.FindKey([ilPRODUCTO.Buffer])then
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   HabilitaCtrlDispLinea; // SATV4766 el 11JUL2006
   //end if
end;

procedure TWCrCto.ilTASA_REFEREjecuta(Sender: TObject);
begin
   if Objeto.TasaRefer.FindKey([ilTASA_REFER.Buffer]) Then
      InterForma1.NextTab(edCVE_TASA_REFER);
   //end if
end;

procedure TWCrCto.btTASA_REFERClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCTO_TASAREF',True,True) then
   begin
       Objeto.TasaRefer.ShowAll := True;
       if Objeto.TasaRefer.Busca then
          InterForma1.NextTab(edCVE_TASA_REFER);
       //end if
   end;    
end;

procedure TWCrCto.ilACREDITADOEjecuta(Sender: TObject);
begin
   if Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) then
      InterForma1.NextTab(edACREDITADO);
   //end if
end;

procedure TWCrCto.btACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCTO_ACREDIT',True,True) then
   begin
     Objeto.Acreditado.ShowAll := True;
     if Objeto.Acreditado.Busca then
     begin

        InterForma1.NextTab(edACREDITADO);
     end;
     //end if
   end;
end;

procedure TWCrCto.edACREDITADOExit(Sender: TObject);
var     VLValida    : Boolean;
        VLMsg       : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      if not ValidaRFC then
      begin
          VlValida := False;
          VLMsg := 'El Acreditado no tiene RFC o está incompleto';
      end
      else
      begin
              VLMsg := '';
              VLValida := True;
              If Objeto.Acreditado.ID_ACREDITADO.AsString = '' then
              Begin
                 vlMsg := 'Favor de indicar el Acreditado';
                 VLValida := False;
              end
              else if Objeto.Acreditado.SIT_ACREDITADO.AsString = CSIT_CA then
              Begin
                 vlMsg := 'Acreditado inactivo';
                 vlValida := False;
              end
              else if not(ValTramites(Objeto.Acreditado.ID_ACREDITADO.AsString,'ALTACR', Objeto.Apli, vlMsg)) then
              Begin
                 vlValida := False;
              end;
              //02DIC2004
              if Objeto.Acreditado.B_AUTORIZADO.AsString = CFALSO then
                 ShowMessage('El Acreditado no se encuentra Autorizado por el Área de Créditos');
              //end if
              Objeto.ObtenDisponibleAcred(Objeto.Acreditado.ID_ACREDITADO.AsString);
              Objeto.ObtenDisponibleGpo(Objeto.Acreditado.CVE_GRUPO_ECO.AsString);

              //EASA  REQ. 20007 - 07 / 018   CARTERA IMPAGADA
              InterForma1.MsgPanel.Caption := '';
              InterForma1.MsgPanel.Color := clBtnFace;
              InterForma1.MsgPanel.Font.Color := clWhite;
              if not ( FindDispIM(Objeto.Acreditado.ID_ACREDITADO.AsInteger,Objeto.Apli, vlMsg)) then
              Begin
                 if MessageDlg(vlMsg + ', desea ver el detalle?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
                 Begin
                    Objeto.DetImpagado := TCrCartrIm.Create(self);
                    Try
                      Objeto.DetImpagado.Apli:= Objeto.Apli;
                      Objeto.DetImpagado.ID_ACREDITADO.AsString := Objeto.Acreditado.ID_ACREDITADO.ASstring;
                      Objeto.DetImpagado.NOM_ACREDITADO.AsString := Objeto.Acreditado.persona.nombre.asstring;
                      Objeto.DetImpagado.ParamCre:=Objeto.ParamCre;
                      Objeto.DetImpagado.Catalogo;
                    finally
                      Objeto.DetImpagado.Free;
                    end;
                 end;
              end;
              //END EASA
           End;
           InterForma1.ValidaExit(edACREDITADO,VLValida,vlMsg,True);
      end;
end;

procedure TWCrCto.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var
     VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   if not ValidaRFC then
   begin
       VlSalida := False;
       VLMesg := 'El Acreditado no tiene RFC o está incompleto';
       Realizado := False;
       InterForma1.ValidaExit(edACREDITADO,VLSalida,VLMesg,True);
   end
   else
   begin
   //nuevo
      if IsNewData then
      Begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then
          Begin
             Realizado := False;
             Objeto.CVE_USU_AUTORIZA.AsString := Objeto.Apli.Usuario;
             if (Objeto.F_AUT_COMITE.AsString <> '') and (Objeto.CVE_COMITE_AUT.AsString <> '') then
                Objeto.SIT_LINEA.AsString := 'AU'
             else
                Objeto.SIT_LINEA.AsString := 'NA';
             //end if

             // Inicia modificaciones SATV4766 el 11JUL2006
             If (Not cbMAX_PZO_DISP.Checked    ) Then Objeto.MAX_PZO_DISP.AsInteger    := 0;
             If (Not cbMAX_DIAS_DISPON.Checked ) Then Objeto.MAX_DIAS_DISPON.AsInteger := 0;
             If (Not cbMAX_TASA.Checked        ) Then Objeto.MAX_TASA.AsFloat          := 0;
             // Termina modificaciones

             if  Objeto.GeneraContratoCorp then
             begin
                Objeto.CONTRATO.findkey([Objeto.ID_CONTRATO.AsString]);
                icpCONTRATO.RefrescaInfo;
                Objeto.FOL_CONTRATO.AsInteger := 1;//ObtenFolio(CEXCECRE,'FOLIO: ', Objeto.Apli);
                Objeto.DIAS_TOLERANCIA.AsInteger := 0;
                Realizado := True;
                // </ EASA4011  09.MAR.2007      Req. Promotor asignado
                lbPromAdmon.Visible := True;
                edID_PROM_ADM.Visible := True;
                btPROM_ADM.Visible := True;
                edNAME_PROM_ADM.Visible := True;
                Objeto.PromAdm.FindKey([Objeto.ID_PROM_ADMON.AsString]);
                Objeto.NOM_PROM_ADM.AsString := Objeto.PromAdm.Nombre.AsString;
                //  EDN_EASA >/

                Objeto.CODIGO_CNBV.AsString:= EdCod_CNBV.Text;


                ShowMessage('Terminó el Alta de la Autorización : ' + Objeto.ID_CONTRATO.AsString);


             end;
         end
         else Realizado := False;
      end
      else
      Begin
         if MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         Begin
              Realizado := True;
         end
         else Realizado := False;
       end
   end;
end;

procedure TWCrCto.mTX_COND_GRALESKeyPress(Sender: TObject; var Key: Char);
begin
     Key := (UpperCase(Key))[1];
     if ( key=Char(39) ) OR ( key=Char(39) ) then
          Key:=Char(0);
end;

procedure TWCrCto.Button1Click(Sender: TObject);
var  InfContrato  : TCrcttoc;
begin
     if Objeto.Active then
     begin
          {$WARNINGS OFF}
          InfContrato := TCrcttoc.Create(self);
          {$WARNINGS ON}
          try
             InfContrato.Apli:=Objeto.Apli;
             InfContrato.ParamCre:=Objeto.ParamCre;
             InfContrato.ContrCred := Objeto;
             InfContrato.Catalogo;
          finally
                 InfContrato.Free;
          end;
     end
     else
         ShowMessage('Debe de seleccionar un Acreditado.');
     //end if;
end;

procedure TWCrCto.InterForma1DespuesCancelar(Sender: TObject);
begin
   icpCONTRATO.RefrescaInfo;
   Objeto.TasaRefer.BuscaWhereString := '';
   Objeto.TasaRefer.FilterString := Objeto.TasaRefer.BuscaWhereString;
   Objeto.TasaRefer.FindKey([ Objeto.CVE_TASA_REFER.AsString ]);
   IF vgAcreditado <> '' THEN
   Begin
        Objeto.ObtenDisponibleAcred(vgAcreditado);
        Objeto.ObtenDisponibleGpo(Objeto.Acreditado.CVE_GRUPO_ECO.AsString);
        Objeto.Acreditado.FindKey([vgAcreditado]);
   end;
   HabilitaControles; // SATV4766 el 12Jul2006
end;

procedure TWCrCto.InterForma1Buscar(Sender: TObject);
var vlMensaje : string;

begin
   MsgPanel.Caption := '';
   MsgPanel.Color := clBtnFace;
   lblProducto.Visible := False;
   lblProducto.Caption := '';

   Objeto.Moneda.BuscaWhereString := '';
   Objeto.Moneda.FilterString := Objeto.Moneda.BuscaWhereString;

   Objeto.TasaRefer.BuscaWhereString := '';
   Objeto.TasaRefer.FilterString := Objeto.TasaRefer.BuscaWhereString;

   Objeto.ProductoBca.BuscaWhereString := '';
   Objeto.ProductoBca.FilterString := Objeto.ProductoBca.BuscaWhereString;

   if Objeto.Busca then
   Begin
      icpCONTRATO.RefrescaInfo;
      edDESC_TASA_REFER.Text := Objeto.TasaRefer.DESC_TASA_INDIC.AsString;

      if Objeto.Acreditado.ID_ACREDITADO.AsString <> CNULL then
      Begin
        Objeto.ObtenDisponibleAcred(Objeto.Acreditado.ID_ACREDITADO.AsString);
        Objeto.ObtenDisponibleGpo(Objeto.Acreditado.CVE_GRUPO_ECO.AsString);
        Objeto.ObtenDisponibleAut(Objeto.ID_CONTRATO.AsString,Objeto.FOL_CONTRATO.AsString);
        vgAcreditado := Objeto.Acreditado.ID_ACREDITADO.AsString;
        ObtenExceso(Objeto.Acreditado.ID_ACREDITADO.AsString, Objeto.ID_CONTRATO.AsString);
        end ;




      if not Objeto.VerfVencimiento(Objeto.ID_CONTRATO.AsString, Objeto.FOL_CONTRATO.AsString ) then
      Begin
         MsgPanel.Caption := 'El plazo de la Autorización venció el día: ' + Objeto.F_VENCIMIENTO.AsString;
         MsgPanel.Font.Color := clWhite;
         MsgPanel.Color := clRed;



      end;
      Objeto.RefinanAut(Objeto.ID_CONTRATO.AsString, Objeto.FOL_CONTRATO.AsString);
      Objeto.ValidaDatosInscripcion;
      MuestraHints;
      // </ EASA4011  09.MAR.2007      Req. Promotor asignado
      lbPromAdmon.Visible := True;
      edID_PROM_ADM.Visible := True;
      btPROM_ADM.Visible := True;
      edNAME_PROM_ADM.Visible := True;

      Objeto.PromAdm.FindKey([Objeto.ID_PROM_ADMON.AsString]);
      Objeto.NOM_PROM_ADM.AsString := Objeto.PromAdm.Nombre.AsString;
      //  EDN_EASA >/





     with Objeto do
     begin

     ObtenDescripcion( ' SELECT CR.DESC_CLAVE AS DESC_CVE'+coCRLF+
                       ' FROM CR_CON_CAT_DATA CR'+coCRLF+
                       ' WHERE CR.CVE_CON_GPO_CAT = ''CAT_COMP_INGRESO'' AND CR.CVE_CLAVE = '+CVE_COMPROB_ING.AsString+coCRLF,
                        'DESC_CVE',
                       CVE_COMPROB_ING,
                       DES_CVE_COMPROB_ING
                     );
     ObtenDescripcion( ' SELECT CR.DESC_CLAVE AS DESC_CVE'+coCRLF+
                       ' FROM CR_CON_CAT_DATA CR'+coCRLF+
                       ' WHERE CR.CVE_CON_GPO_CAT = ''CAT_CAR_DISPOSIC'' AND CR.CVE_CLAVE = '+CVE_CARACT_CTO.AsString+coCRLF,
                        'DESC_CVE',
                       CVE_CARACT_CTO,
                       DES_CVE_CARACT_CTO
                     );
     ObtenDescripcion( ' SELECT CR.DESC_CLAVE AS DESC_CVE'+coCRLF+
                       ' FROM CR_CON_CAT_DATA CR'+coCRLF+
                       ' WHERE CR.CVE_CON_GPO_CAT = ''CAT_SECT_LABORAL'' AND  CR.CVE_CLAVE = '+CVE_SEC_LABORAL.AsString+coCRLF,
                        'DESC_CVE',
                       CVE_SEC_LABORAL,
                       DESC_CVE_SEC_LABORAL
                     );
     //RIRA4281 01jun2010
     edDESC_ACRED_GOB.Text := '';
     ObtenDescripcion( ' SELECT DISTINCT P.NOMBRE AS DESC_CVE '+coCRLF+
                       ' FROM CR_REL_CAL_ACRE CRCA, PERSONA P'+coCRLF+
                       ' WHERE P.ID_PERSONA =  CRCA.ID_ACREDITADO AND P.ID_PERSONA =  '+ID_AVAL_GOB.AsString+coCRLF,
                       'DESC_CVE',
                       ID_AVAL_GOB,
                       DESC_ACRED_GOB
                     );

     //RUCJ4248 22/OCT/2013
     edDESC_TIPO_ALTA.Text := '';
     ObtenDescripcion(
                      ' select CVE_CLAVE, substr(DESC_CLAVE,1,255) DESC_CLAVE ' + coCRLF +
                      ' from CR_CON_CAT_DATA ' + coCRLF +
                      ' where 2 = 2 and CVE_CON_GPO_CAT = ' + QuotedStr('CAT_ALTA_DISPOS') + coCRLF +
                      ' AND CVE_CLAVE = ' + Objeto.CVE_TIPO_ALTA.AsString + coCRLF,
                       'DESC_CLAVE',
                       CVE_TIPO_ALTA,
                       DESC_TIPO_ALTA
                     );


     //AGF 26/06/2016                                 
     edDESC_TIPO_BAJA.Text := '';
     ObtenDescripcion(
                      ' select CVE_CLAVE, substr(DESC_CLAVE,1,255) DESC_CLAVE ' + coCRLF +
                      ' from CR_CON_CAT_DATA ' + coCRLF +
                      ' where 2 = 2 and CVE_CON_GPO_CAT = ' + QuotedStr('CAT_TIPO_LIQ_CTO') + coCRLF +
                      ' AND CVE_CLAVE = ' + Objeto.CVE_TIPO_BAJA.AsString + coCRLF,
                       'DESC_CLAVE',
                       CVE_TIPO_BAJA,
                       DESC_TIPO_BAJA
                     );
        ObtenDescripcion( ' SELECT ' + coCRLF +
                          ' CR_PRODUCTO_BCA.DESC_L_PRODUCTO ' + coCRLF +
                          ' FROM CR_REL_PROD_BCA, CR_PRODUCTO_BCA ' + coCRLF +
                          ' WHERE ' + coCRLF +
                          '       CR_REL_PROD_BCA.CVE_PRODUCTO_BCA = CR_PRODUCTO_BCA.CVE_PRODUCTO_BCA ' + coCRLF +
                          '   AND CR_REL_PROD_BCA.CVE_PRODUCTO_CRE = ' + #39 + edCVE_PRODUCTO_CRE.Text + #39 + coCRLF +
                          '   AND CR_REL_PROD_BCA.CVE_PRODUCTO_BCA = ' + #39 + edCVE_PRODUCTO_BCA.Text + #39 + coCRLF,
                          'DESC_L_PRODUCTO',
                          CVE_PRODUCTO_BCA,
                         DESC_PROD_BCA
                        );
     end;

      //EASA  REQ. 20007 - 07 / 018   CARTERA IMPAGADA
      if not ( FindDispIM(Objeto.Acreditado.ID_ACREDITADO.AsInteger,Objeto.Apli, vlMensaje)) then
      Begin
         InterForma1.MsgPanel.Caption := vlMensaje;
         InterForma1.MsgPanel.Color := clRed;
         InterForma1.MsgPanel.Font.Color := clWhite;
         if MessageDlg(vlMensaje + ', desea ver el detalle?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         Begin
            Objeto.DetImpagado := TCrCartrIm.Create(self);
            Try
              Objeto.DetImpagado.Apli:= Objeto.Apli;
              Objeto.DetImpagado.ID_ACREDITADO.AsString := Objeto.Acreditado.ID_ACREDITADO.ASstring;
              Objeto.DetImpagado.NOM_ACREDITADO.AsString := Objeto.Acreditado.persona.nombre.asstring;
              Objeto.DetImpagado.ParamCre:=Objeto.ParamCre;
              Objeto.DetImpagado.Catalogo;
            finally
              Objeto.DetImpagado.Free;
            end;
         end;
      end;
      //END EASA
   End;

   //Valida que el contrato pertenece a estados y municipios para habilitar la opcion de garantias
   qEstadosMpios.Close;
   qEstadosMpios.DatabaseName := Objeto.DataBaseName;
   qEstadosMpios.SessionName  := Objeto.SessionName;
   qEstadosMpios.sql.Clear;
   qEstadosMpios.sql.Add  ('Select Ac.ID_Acreditado, Ac.Nom_Acred_Reg, C.ID_Contrato '+
                           'From CR_Acreditado Ac '+
                           'Join Contrato      Cto On (Ac.ID_Acreditado = Cto.ID_Titular)'+
                           'Join CR_Contrato   C   On (Cto.ID_Contrato  = C.ID_Contrato)' +
                           ' Where Ac.Cve_Metodologia In (3, 6) And C.Id_Contrato = ' + quotedstr(IntToStr(Objeto.Id_Contrato.AsInteger)));
   qEstadosMpios.Open;

   if qEstadosMpios.RecordCount = 1 Then
   begin
      Estadosymunicipios1.Enabled := True;
      ObtenProductoEdosMun;
   end
   else
      Estadosymunicipios1.Enabled := False;

   HabilitaControles; // SATV4766 11JUL2006
end;

//Llama la ventana para convertir meses o años a Dias
Function TWCrCto.VentanaCalculo(pDato : String): string;
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

procedure TWCrCto.btPLAZOCREDITOClick(Sender: TObject);
begin
   if Objeto.Active then
      edDIAS_PLAZO.Text:= VentanaCalculo(Objeto.DIAS_PLAZO.AsString);
   //end if
end;

Procedure TWCrCto.MuestraHints;
Begin
      edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;
      edDESC_PRODUCTO.Hint := Objeto.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO.ShowHint := True;
      edDESC_TASA_REFER.Hint := Objeto.TasaRefer.DESC_TASA_INDIC.AsString;
      edDESC_TASA_REFER.ShowHint := True;
      mTX_COND_GRALES.Hint := Objeto.TX_COND_GRALES.AsString;
      mTX_COND_GRALES.ShowHint := True;
      edDESC_ORIGEN_REC.Hint := Objeto.OrigRec.DESC_ORIGEN_REC.AsString;
      edDESC_ORIGEN_REC.ShowHint := True;
      edDESC_DESTINO.Hint := Objeto.Destino.DESC_DESTINO.AsString;
      edDESC_DESTINO.ShowHint := True;
End;

procedure TWCrCto.InterForma1DespuesAceptar(Sender: TObject);
//var EdoMun : TFormEdosMun;
begin
   MuestraHints;
   Objeto.ObtenDisponibleAut(Objeto.ID_CONTRATO.AsString,Objeto.FOL_CONTRATO.AsString);
   // RIRA4281 01Jun10 Se agrega el llamado a la Cali de Ctos Estructurados
      if ((InterForma1.IsNewData) and (Objeto.B_ESTRUCTURADO.AsString = 'V'))then Begin
          CalificacionCreditoEstructurado1Click(Self);
      End;

     MessageDlg(Objeto.ID_CONTRATO.AsString , mtConfirmation,[mbOk],0 );
    //Llenado de datos de la garantia
    //Verifica si se esta insertando un nuevo dato

   If   (InterForma1.IsNewData) then
     EstadosyMunicipios1Click(Sender);

   If Objeto.Modo= moBrowse then
      edpF_REP_SIC.Enabled:= False;


end;

procedure TWCrCto.btCVE_ORIGEN_RECClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCTO_ORIREC',True,True) then
   begin
     Objeto.OrigRec.ShowAll := True;
     if Objeto.OrigRec.Busca then
        InterForma1.NextTab(edCVE_ORIGEN_REC);
     //end if
   end;
end;

procedure TWCrCto.ilORIG_RECEjecuta(Sender: TObject);
begin
   if Objeto.OrigRec.FindKey([ilORIG_REC.Buffer]) then
       InterForma1.NextTab(edCVE_ORIGEN_REC);
   //end if
end;

procedure TWCrCto.btCVE_DESTINOClick(Sender: TObject);
var vlTipoCartera : string;
begin
   if Objeto.ValidaAccesoEsp('TCRCTO_COMPING',True,True) then
   begin
       //RIRA4281 22JUL10 Para que se filtre por el tipo de cartera, el tipo "otros" se usa como registros comunes a todos los tipos de carteras
       Objeto.Destino.BuscaWhereString := '';
       vlTipoCartera := Objeto.ObtenTipoCarteraProd(objeto.Producto.CVE_CLAS_CONTAB.AsString) ;
       if (vlTipoCartera = 'CARTCOME') then
            Objeto.Destino.BuscaWhereString :='(CVE_AGRUPACION = ''CARTCOME'' OR CVE_AGRUPACION = ''OTROS'')'
       else if  (vlTipoCartera = 'CARTHIPO') then
            Objeto.Destino.BuscaWhereString :='(CVE_AGRUPACION = ''CARTHIPO'' OR CVE_AGRUPACION = ''OTROS'')'
       else if   (vlTipoCartera = 'CARTCONS') then
            Objeto.Destino.BuscaWhereString :='(CVE_AGRUPACION = ''CARTCONS'' OR CVE_AGRUPACION = ''OTROS'')'
       else
            Objeto.Destino.BuscaWhereString :='(CVE_AGRUPACION = ''OTROS'')';

       Objeto.Destino.ShowAll := True;
       if Objeto.Destino.Busca then
          InterForma1.NextTab(edCVE_DESTINO);
       //end if
   end;    
end;

procedure TWCrCto.ilDEST_CREDEjecuta(Sender: TObject);
var vlTipoCartera : string;
begin
//RIRA4281 22Jul10 Se modifica para que valide el tipo de cartera del destino
   vlTipoCartera := Objeto.ObtenTipoCarteraProd(objeto.Producto.CVE_CLAS_CONTAB.AsString) ;
   if (Objeto.ValidaDestino(ilDEST_CRED.Buffer, vlTipoCartera) = 0) then
        Objeto.Destino.FindKey([-1]) //Para que no encuentre nada ya que no pertenece al mismo Tipo de cartera
   else
        if Objeto.Destino.FindKey([ilDEST_CRED.Buffer]) then
                InterForma1.NextTab(edCVE_DESTINO);

end;

//Verifica banderas de la configuración de la Tasa de referencia del Producto
procedure TWCrCto.VerificaTasaRefer;
begin
      if Objeto.Producto.B_MOD_TASA_REFER.AsString = CFALSO then
      Begin
         edCVE_TASA_REFER.Color := clBtnFace;
         edCVE_TASA_REFER.Enabled :=False;
         btTASA_REFER.Enabled := False;
//         Objeto.TasaRefer.Active := False;
      end
      else
      Begin
         edCVE_TASA_REFER.Color := clWindow;
         edCVE_TASA_REFER.Enabled :=True;
         btTASA_REFER.Enabled := True;
         Objeto.TasaRefer.Active := True;
      end;

      if Objeto.Producto.B_MOD_OPER_STASA.AsString = CFALSO then
      Begin
         cbOPERADOR_STASA.Color := clBtnFace;
         cbOPERADOR_STASA.Enabled :=False;
      end
      else
      Begin
         cbOPERADOR_STASA.Color := clWindow;
         cbOPERADOR_STASA.Enabled :=True;
      end;

      if Objeto.Producto.B_MOD_SOBRETASA.AsString = CFALSO then
      Begin
         edSOBRETASA.Color := clBtnFace;
         edSOBRETASA.Enabled :=False;
      end
      else
      Begin
         edSOBRETASA.Color := clWindow;
         edSOBRETASA.Enabled :=True;
      end;
end;

procedure TWCrCto.ObtenProductoEdosMun;
var
  vlQProducto: TQuery;
begin
  lblProducto.Visible := False;
  lblProducto.Active  := False;
  lblProducto.Caption := '';
  vlQProducto         := TQuery.Create (Self);

  try
    vlQProducto.Close;
    vlQProducto.DatabaseName := Objeto.DataBaseName;
    vlQProducto.SessionName  := Objeto.SessionName;
    vlQProducto.SQL.Clear;
    vlQProducto.SQL.Add ('Select Case When G.Producto = ''No Aplica''    Then ''Producto no configurado''');
    vlQProducto.SQL.Add ('            When G.Producto Like ''Producto_'' Then ''Producto '' || Substr (G.Producto, 9, 1)');
    vlQProducto.SQL.Add ('            Else G.Producto');
    vlQProducto.SQL.Add ('       End                                                                                            Producto,');
    vlQProducto.SQL.Add ('       Case When Ac.Cve_Metodologia In (3, 6) Then ''V'' Else ''F'' End                               B_Edos_Mun');
    vlQProducto.SQL.Add ('  From CR_Contrato   C');
    vlQProducto.SQL.Add ('  Join Contrato      Cto On C.ID_Contrato = Cto.ID_Contrato');
    vlQProducto.SQL.Add ('  Join CR_Acreditado Ac  On Cto.ID_Titular = Ac.ID_Acreditado');
    vlQProducto.SQL.Add ('  Left Outer Join Table (PkgCrGPViews.VW_CR_GP_Histo_Garan (:peFecha)) G On C.ID_Contrato = G.ID_Contrato');
    vlQProducto.SQL.Add (' Where C.ID_Contrato = ' + IntToStr (Objeto.Id_Contrato.AsInteger));
    vlQProducto.ParamByName ('peFecha').AsDate := Objeto.Apli.DameFechaEmpresa;
    vlQProducto.Open;

     if not vlQProducto.Eof and (vlQProducto.FieldByName ('B_Edos_Mun').AsString = 'V') then
     begin
       lblProducto.Visible := True;
       lblProducto.Active  := True;

       if vlQProducto.FieldByName ('Producto').IsNull then
       begin
         lblProducto.Caption := 'Producto no configurado';
       end
       else
         lblProducto.Caption := vlQProducto.FieldByName ('Producto').AsString;
     end;

  finally
    vlQProducto.Free;
  end;
end;

procedure TWCrCto.InterForma1DespuesShow(Sender: TObject);
begin
   Objeto.ObtenDisponibleAut(Objeto.ID_CONTRATO.AsString,Objeto.FOL_CONTRATO.AsString);
   IF Objeto.Acreditado.ID_ACREDITADO.AsString <> CNULL then
      Begin
        Objeto.ObtenDisponibleAcred(Objeto.Acreditado.ID_ACREDITADO.AsString);
        Objeto.ObtenDisponibleGpo(Objeto.Acreditado.CVE_GRUPO_ECO.AsString);
        ObtenExceso(Objeto.Acreditado.ID_ACREDITADO.AsString, Objeto.ID_CONTRATO.AsString);
      end;

   Objeto.BuscaWhereString := ' CR_CONTRATO.CVE_PRODUCTO_CRE IN ( '+
                                             ' SELECT CVE_PRODUCTO FROM CR_PERF_PROD_USU WHERE ' +
                                             ' CVE_GPO_ACCESO = ' + IntToStr(Objeto.Apli.CvePerfil)+ ' )';
   Objeto.FilterString := Objeto.BuscaWhereString ;

   ObtenProductoEdosMun;
end;

procedure TWCrCto.chB_FINANC_ADICExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_FINANC_ADIC,true,'',True);
end;

procedure TWCrCto.chB_REVOLVENTEExit(Sender: TObject);
Begin
   InterForma1.ValidaExit(chB_REVOLVENTE,True,'',True);
end;

procedure TWCrCto.btDOCUMENTOSClick(Sender: TObject);
Var   DoctosAcred : TMRecTra;
begin
   if Objeto.Active then
      Begin
            {$WARNINGS OFF}
            DoctosAcred := TMRecTra.Create(self);
            {$WARNINGS ON}            
            try
               DoctosAcred.Apli:=Objeto.Apli;
               DoctosAcred.ParamCre:=Objeto.ParamCre;
               DoctosAcred.iIdEmpresa:= Objeto.Contrato.Id_Empresa.AsInteger;
               DoctosAcred.iIdAcreditado:= Objeto.Contrato.ID_Titular.AsInteger;
               DoctosAcred.sCveMedio:= 'ALTAUT';
               DoctosAcred.iReferencia := Objeto.ID_CONTRATO.AsInteger;
               DoctosAcred.sCveProduct := Objeto.CVE_PRODUCTO_CRE.AsString;
               DoctosAcred.Catalogo;
            finally
                   DoctosAcred.Free;
            end;
       end
   else
       ShowMessage('Debe de seleccionar una Autorización.');
   //end if;
end;

procedure TWCrCto.btGARANTIASClick(Sender: TObject);
Var
   MExpOper : TMExpOper;
begin

   If Objeto.Active Then Begin
      Objeto.ID_CONTRATO.GetFromControl;
      {$WARNINGS OFF}
      MExpOper := TMExpOper.Create(self);
      {$WARNINGS ON}
      Try
         MExpOper.IsCheckSecu:= False;
         MExpOper.Apli:=Objeto.Apli;
         MExpOper.ParamCre:=Objeto.ParamCre;
         MExpOper.ID_CONTRATO.AsInteger := Objeto.ID_CONTRATO.AsInteger;
         MExpOper.FOL_CONTRATO.AsInteger := Objeto.FOL_CONTRATO.AsInteger;
         MExpOper.CrCto:= Objeto;
         MExpOper.Catalogo;
      Finally
         MExpOper.Free;
      End;
   End
   else  ShowMessage('Debe de seleccionar una Autorización.');
   icpCONTRATO.RefrescaInfo;
end;

procedure TWCrCto.btSIEBANClick(Sender: TObject);
Var
   MEstSieb  : TMEstSieb;
   sSQL : String;
   qyQuery : TQuery;
begin
   If Objeto.Active Then Begin
      {$WARNINGS OFF}
      MEstSieb := TMEstSieb.Create(self);
      {$WARNINGS ON}      
      Try
         MEstSieb.Apli :=Objeto.Apli;
         MEstSieb.ParamCre:=Objeto.ParamCre;
         MEstSieb.ID_CONTRATO.AsInteger := Objeto.ID_CONTRATO.AsInteger;
         MEstSieb.Autorizacion:= Objeto;

         sSQL:= 'SELECT MAX(ID_SOLICITUD)ID_SOLICITUD FROM CR_REL_CTO_SIEB WHERE ID_CONTRATO='+ Objeto.ID_CONTRATO.AsString;
         qyQuery:= GetSQLQuery(sSQL, Objeto.DataBaseName, Objeto.SessionName, False);
         If qyQuery <> Nil Then Begin
            If qyQuery.FieldByName('ID_SOLICITUD').AsFloat <> 0 Then Begin
               MEstSieb.FindKey([qyQuery.FieldByName('ID_SOLICITUD').AsString]);
               MEstSieb.Catalogo;
            End Else MEstSieb.Nuevo;
            qyQuery.Free;
         End Else
            MEstSieb.Nuevo;
      Finally
         MEstSieb.Free;
      End;
   End Else Begin
      ShowMessage('Debe seleccionar una Autorización');
   End;
end;

procedure TWCrCto.btPOLIZASClick(Sender: TObject);
//Var   Seguros : T;
begin
   if Objeto.Active then
      Begin
  {
            Seguros := TCr.Create(self);
            try
               Seguros.Apli:=Objeto.Apli;
               Seguros.ParamCre:=Objeto.ParamCre;
               Seguros.Catalogo;
            finally
                   Seguros.Free;
            end;
            }
            ShowMessage('Llamado a la clase de Seguros.');
       end
   else
       ShowMessage('Debe de seleccionar una Autorización.');
   //end if;
end;

procedure TWCrCto.VerfBanderas;
begin
   //VERIFICA REVOLVENCIA DEL PRODUCTO
   if Objeto.Producto.CVE_REVOLVENCIA.AsString = C_NR then Begin
      Objeto.B_REVOLVENTE.AsString := CFALSO;
      chB_REVOLVENTE.Enabled := False;
   end
   else Begin
      Objeto.B_REVOLVENTE.AsString := CVERDAD;
      chB_REVOLVENTE.Enabled := True;
   end;
   //VERIFICA FINANCIAMIENTO ADICIONAL DEL PRODUCTO
   if Objeto.Producto.B_FINANC_ADIC.AsString = CFALSO then Begin
      Objeto.B_FINANC_ADIC.AsString := CFALSO;
      chB_FINANC_ADIC.Enabled := False;
   end
   else Begin
      Objeto.B_FINANC_ADIC.AsString := CVERDAD;
      chB_FINANC_ADIC.Enabled := true;
   end;
   //VERIFICA PRORROGA          EASA4011        22042005
   if Objeto.Producto.B_APL_PRORROGA.AsString = CFALSO then
   Begin
      Objeto.B_APL_PRORROGA.AsString := CFALSO;
      chB_APL_PRORROGA.Enabled := False;
   end
   else
   Begin
      Objeto.B_APL_PRORROGA.AsString := CVERDAD;
      chB_APL_PRORROGA.Enabled := true;
   end;
   //VERIFICA RENOVACION
   if Objeto.Producto.B_APL_RENOVACION.AsString = CFALSO then
   Begin
      Objeto.B_APL_RENOVACION.AsString := CFALSO;
      chB_APL_RENOVACION.Enabled := False;
   end
   else
   Begin
      Objeto.B_APL_RENOVACION.AsString := CVERDAD;
      chB_APL_RENOVACION.Enabled := true;
   end;

    //VERIFICA REESTRUCTURACION
   if Objeto.Producto.B_APL_REESTRUCT.AsString = CFALSO then
   Begin
      Objeto.B_REESTRUCTURA.AsString := CFALSO;
      chB_REESTRUCTURA.Enabled := False;
   end
   else
   Begin
      Objeto.B_REESTRUCTURA.AsString := CVERDAD;
      chB_REESTRUCTURA.Enabled := true;
   end;
   //VERIFICA CONVENIO MODIFICATORIO
   if Objeto.Producto.B_APL_CONVE_MOD.AsString = CFALSO then
   Begin
      Objeto.B_APL_CONVE_MOD.AsString := CFALSO;
      chB_APL_CONVE_MOD.Enabled := False;
   end
   else
   Begin
      Objeto.B_APL_CONVE_MOD.AsString := CVERDAD;
      chB_APL_CONVE_MOD.Enabled := true;
   end;
   //VERIFICA EVENTO DE ACELERACION
   if Objeto.Producto.B_APL_EVEN_ACEL.AsString = CFALSO then
   Begin
      Objeto.B_APL_EVEN_ACEL.AsString := CFALSO;
      chB_APL_EVEN_ACEL.Enabled := False;
   end
   else
   Begin
      Objeto.B_APL_EVEN_ACEL.AsString := CVERDAD;
      chB_APL_EVEN_ACEL.Enabled := true;
   end;
end;

procedure TWCrCto.edTASA_BASEExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMesg    :  String;
Begin
   vlMesg   := CNULL;
   vlSalida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     IF Objeto.Producto.B_INDICA_TASA_AU.AsString = CVERDAD then
     Begin
        Objeto.TASA_BASE.GetFromControl;
        if Objeto.TASA_BASE.AsFloat < 0 then
        Begin
           vlSalida := False;
           vlMesg := 'La tasa base no debe de ser negativa';
        end;
     end;
   end;
   InterForma1.ValidaExit(edTASA_BASE,vlSalida,vlMesg,True);
end;

procedure TWCrCto.ConsultaSectorPersona1Click(Sender: TObject);
begin
      Objeto.Acreditado.GetParams(Objeto);
      Objeto.Acreditado.FindKey([Objeto.Contrato.ID_Titular.AsString]);
      Objeto.Acreditado.ParamCre := Objeto.ParamCre;
      Objeto.Acreditado.Catalogo;
      Objeto.FindKey([Objeto.ID_CONTRATO.AsString]);
      Objeto.ObtenDisponibleAcred(Objeto.Contrato.ID_Titular.AsString);
      Objeto.ObtenDisponibleGpo(Objeto.Acreditado.CVE_GRUPO_ECO.AsString);
      Objeto.ObtenDisponibleAut(Objeto.ID_CONTRATO.AsString,Objeto.FOL_CONTRATO.AsString);
end;

procedure TWCrCto.CatlogodePersona1Click(Sender: TObject);
var  Persona : TPersona;
begin
      {$WARNINGS OFF}
      Persona := TPersona.Create(Self);
      {$WARNINGS ON}      
      try
        Persona.GetParams(Objeto);
        Persona.FindKey([Objeto.Contrato.ID_Titular.AsString]);
        Persona.Catalogo;
      finally
             Persona.Free;
             Objeto.FindKey([Objeto.ID_CONTRATO.AsString]);
      end;
end;

procedure TWCrCto.Documentacin1Click(Sender: TObject);
Var   DoctosAcred : TMRecTra;
begin
   if Objeto.Active then
      Begin
            {$WARNINGS OFF}
            DoctosAcred := TMRecTra.Create(self);
            {$WARNINGS ON}
            try
               DoctosAcred.Apli:=Objeto.Apli;
               DoctosAcred.ParamCre:=Objeto.ParamCre;
               DoctosAcred.iIdEmpresa:= Objeto.Contrato.Id_Empresa.AsInteger;
               DoctosAcred.iIdAcreditado:= Objeto.Contrato.ID_Titular.AsInteger;
               DoctosAcred.sCveMedio:= 'ALTAUT';
               DoctosAcred.iReferencia := Objeto.ID_CONTRATO.AsInteger;
               DoctosAcred.sCveProduct := Objeto.CVE_PRODUCTO_CRE.AsString;
               DoctosAcred.Catalogo;
            finally
                   DoctosAcred.Free;
            end;
       end
   else
       ShowMessage('Debe de seleccionar una Autorización.');
   //end if;
end;

procedure TWCrCto.Garantas1Click(Sender: TObject);
Var
   MExpOper : TMExpOper;
begin

   If Objeto.Active Then Begin
      Objeto.ID_CONTRATO.GetFromControl;
      {$WARNINGS OFF}
      MExpOper := TMExpOper.Create(self);
      {$WARNINGS ON}
      Try
         MExpOper.IsCheckSecu:= False;
         MExpOper.Apli:=Objeto.Apli;
         MExpOper.ParamCre:=Objeto.ParamCre;
         MExpOper.ID_CONTRATO.AsInteger := Objeto.ID_CONTRATO.AsInteger;
         MExpOper.FOL_CONTRATO.AsInteger := Objeto.FOL_CONTRATO.AsInteger;
         MExpOper.CrCto:= Objeto;
         MExpOper.Catalogo;
      Finally
         MExpOper.Free;
      End;
   End
   else  ShowMessage('Debe de seleccionar una Autorización.');
   icpCONTRATO.RefrescaInfo;
end;

procedure TWCrCto.SIEBAN1Click(Sender: TObject);
Var
   MEstSieb  : TMEstSieb;
   sSQL : String;
   qyQuery : TQuery;
begin
   If Objeto.Active Then Begin
      {$WARNINGS OFF}
      MEstSieb := TMEstSieb.Create(self);
      {$WARNINGS ON}
      Try
         MEstSieb.Apli :=Objeto.Apli;
         MEstSieb.ParamCre:=Objeto.ParamCre;
         MEstSieb.ID_CONTRATO.AsInteger := Objeto.ID_CONTRATO.AsInteger;
         MEstSieb.Autorizacion:= Objeto;

         sSQL:= 'SELECT MAX(ID_SOLICITUD)ID_SOLICITUD FROM CR_REL_CTO_SIEB WHERE ID_CONTRATO='+ Objeto.ID_CONTRATO.AsString;
         qyQuery:= GetSQLQuery(sSQL, Objeto.DataBaseName, Objeto.SessionName, False);
         If qyQuery <> Nil Then Begin
            If qyQuery.FieldByName('ID_SOLICITUD').AsFloat <> 0 Then Begin
               MEstSieb.FindKey([qyQuery.FieldByName('ID_SOLICITUD').AsString]);
               MEstSieb.Catalogo;
            End Else MEstSieb.Nuevo;
            qyQuery.Free;
         End Else
            MEstSieb.Nuevo;
      Finally
         MEstSieb.Free;
      End;
   End Else Begin
      ShowMessage('Debe seleccionar una Autorización');
   End;
end;

procedure TWCrCto.CheckBox3Exit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_EVENTUAL,true,'',True);
end;

procedure TWCrCto.chB_FINAN_CALIFExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_FINAN_CALIF,true,'',True);
end;

procedure TWCrCto.chB_APL_CONVE_MODExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_APL_CONVE_MOD,true,'',True);
end;

procedure TWCrCto.chB_APL_PRORROGAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_APL_PRORROGA,true,'',True);
end;


procedure TWCrCto.chB_PARAMETRICOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_PARAMETRICO,true,'',True);
end;

procedure TWCrCto.chB_APL_EVEN_ACELExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_APL_EVEN_ACEL,true,'',True);
end;

procedure TWCrCto.cbB_DISP_EN_LINEAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_DISP_EN_LINEA,true,'',True);
end;

procedure TWCrCto.btCVE_GPO_CAPITALIZClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCTO_REQCAPIT',True,True) then
   begin
       Objeto.PctCapiliz.ShowAll := True;
       if Objeto.PctCapiliz.Busca then
          InterForma1.NextTab(edCVE_GPO_CAPITALIZ);
       //end if;
   end;
end;

procedure TWCrCto.ilREQ_PCT_CAPITALIZEjecuta(Sender: TObject);
begin
   if Objeto.PctCapiliz.FindKey([ilREQ_PCT_CAPITALIZ]) then
      InterForma1.NextTab(edCVE_GPO_CAPITALIZ);
   //end if;
end;

procedure TWCrCto.chB_APL_RENOVACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_APL_RENOVACION,true,'',True);

end;

procedure TWCrCto.chB_APL_INSCR_DEUDClick(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     //if chB_APL_INSCR_DEUD.Checked then begin
        //activa datos de inscripción de deuda
        //cbCVE_TIP_INSCR_D.Enabled := True;                cbCVE_TIP_INSCR_D.Color := clWindow;
        //edF_ALTA_INSCR_DEU.Enabled := True;               edF_ALTA_INSCR_DEU.Color := clWindow;
        //idtpF_ALTA_INSCR_DEU.Enabled := True;             idtpF_PROG_INSCR_D.Enabled := True;
        //edNUM_INSCR_DEUDA.Enabled := True;                edNUM_INSCR_DEUDA.Color := clWindow;
        //edF_PROG_INSCR_D.Enabled := True;                 edF_PROG_INSCR_D.Color := clWindow;
     end
     else
     Begin
        //desactiva datos de inscripción de deuda
        //cbCVE_TIP_INSCR_D.Enabled := False;               cbCVE_TIP_INSCR_D.Color := clBtnFace;
        //cbCVE_TIP_INSCR_D.Text := 'No Aplica';
        //edF_ALTA_INSCR_DEU.Enabled := False;              edF_ALTA_INSCR_DEU.Color := clBtnFace;
        //idtpF_ALTA_INSCR_DEU.Enabled := False;            idtpF_PROG_INSCR_D.Enabled := False;
        //edNUM_INSCR_DEUDA.Enabled := False;               edNUM_INSCR_DEUDA.Color := clBtnFace;
        //edF_PROG_INSCR_D.Enabled := False;                edF_PROG_INSCR_D.Color := clBtnFace;
     end;
   //end;
end;

procedure TWCrCto.btMONEDAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCTO_MONEDA',True,True) then
   begin
      Objeto.Moneda.ShowAll := True;
      if Objeto.Moneda.Busca then
         InterForma1.NextTab(edCVE_MONEDA);
      //end if;
   end;
end;

procedure TWCrCto.ilMONEDAEjecuta(Sender: TObject);
begin
   if Objeto.Moneda.FindKey([ilMONEDA.Buffer]) then
      InterForma1.NextTab(edCVE_MONEDA);
    //end if;
end;

procedure TWCrCto.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrCto.edCVE_MONEDAExit(Sender: TObject);
var  VLSalida  :  boolean;
     vlMsg : String;
Begin
   VlSalida   := True;
   vlMsg := ''; 

   if ( Objeto.Modo=moAppend ) then begin
      Objeto.CVE_MONEDA.GetFromControl;
      if Objeto.CVE_MONEDA.AsString = '' then
      Begin
         vlMsg := ('Favor de Indicar la Moneda');
         VlSalida := False;
      end; //end if
      Objeto.TasaRefer.Active := False;
      //LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT
      OnOffTipoCobAn;
      //ENDS_LOLS
   end;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then Begin
      Objeto.TasaRefer.BuscaWhereString := ' TASA_INDIC_FINAN.B_TASA_CREDITO =' + SQLStr('V') + ' AND ' +
                                           ' TASA_INDIC_FINAN.CVE_TASA_INDICAD IN  ' +
                                           '         ( ' + ' SELECT CVE_TASA_REFER FROM CR_REL_PROD_MON ' +
                                           ' WHERE  CR_REL_PROD_MON.CVE_MONEDA = ' + Objeto.CVE_MONEDA.AsString+
                                           '   AND  CR_REL_PROD_MON.CVE_PRODUCTO_CRE = ' + SQLStr(Objeto.CVE_PRODUCTO_CRE.AsString ) +  ')';
      Objeto.TasaRefer.FilterString := Objeto.TasaRefer.BuscaWhereString;
   end;
   InterForma1.ValidaExit(edCVE_MONEDA,vlSalida,vlMsg,True);
end;



//<LOLS CREDITO EN LINEA. 10 JUL 2006. AGREGA COMISIONES X ACREDITADO>
procedure TWCrCto.Comisiones1Click(Sender: TObject);
var CrCnPrAcc : TCrCnPrAcc;
begin
  if Objeto.Active then
  begin
    CrCnPrAcc := TCrCnPrAcc.Create(Self);
    try
      CrCnPrAcc.Apli:=Objeto.Apli;
      CrCnPrAcc.ParamCre:=Objeto.ParamCre;
      CrCnPrAcc.CVE_ACCESORIO.AsString  := C_ACCESORIO_AUTORIZACION;
      CrCnPrAcc.ID_ACCESORIO.AsInteger  := Objeto.ID_CONTRATO.AsInteger;
      CrCnPrAcc.FOL_ACCESORIO.AsInteger := Objeto.FOL_CONTRATO.AsInteger;
      CrCnPrAcc.Catalogo;
    finally
      CrCnPrAcc.Free;
    end;
  end else
    ShowMessage('Debe de seleccionar una Autorización.');
  //end if;
End;
// AGREGA DISPOSICION MARCO
procedure TWCrCto.btnCREDITO_MARCOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCTO_DISPMARC',True,True) then
   begin
      Objeto.CrCreMar.ShowAll := True;
      if Objeto.CrCreMar.Busca then
        InterForma1.NextTab(btnCREDITO_MARCO);
      //end if;
   end;   
end;

procedure TWCrCto.btnCREDITO_MARCOExit(Sender: TObject);
begin
  InterForma1.ValidaExit( btnCREDITO_MARCO, True, '', True );
end;
//</ENDS_LOLS>

procedure TWCrCto.IncrementoDecementodeTemporada1Click(Sender: TObject);
begin
  With Objeto Do
    MuestraPantallaExcesos(Apli,                               // peApli : TInterApli;
                           ParamCre,                           // ParamCre : TParamCre;
                           Acreditado.ID_ACREDITADO.AsInteger, // peID_ACREDITADO
                           ID_CONTRATO.AsInteger,              // peID_CONTRATO
                           0,                                  // peIMP_EXCESO_EVE
                           'I',                                // peCVE_AFEC_INC_DEC
                           '',                                 // peCVE_TIP_DISPOS
                           CFALSO,                             // peB_AFEC_ACRED
                           Apli.DameFechaEmpresa,              // peF_VTO_EXCESO
                           True                                // peB_MODIFICA_DATOS
                           );
end;

//LOLS 24 AGO 2006. ADECUACIONES DE ACUERDO AL REQ. DE CAT
procedure TWCrCto.cbCVE_SUB_TIP_COBExit(Sender: TObject);
var vlSalida : Boolean;
    VlMsg    : String;
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
  begin
{    vlMsg   := CNULL;
    vlSalida := True;
    Objeto.CVE_SUB_TIP_COB.GetFromControl;
    if Objeto.CVE_SUB_TIP_COB.AsString = CNULL then
    begin
      vlMsg    := 'Favor de indicar el tipo de afectación para cobranza anticipada';
      vlSalida := False;
    end;    }
    //InterForma1.ValidaExit( cbCVE_SUB_TIP_COB, vlSalida, VlMsg, True );
    InterForma1.ValidaExit( cbCVE_SUB_TIP_COB, True, '', True );
  end;
end;
//ENDS_LOLS

//EASA 18 ENE 2006

procedure TWCrCto.AccesoProducto1Click(Sender: TObject);
begin
        Objeto.Producto.GetParams(Objeto);
        Objeto.Producto.ParamCre:=Objeto.ParamCre;
        Objeto.Producto.BuscaWhereString := ' CR_PRODUCTO.CVE_PRODUCTO_CRE IN ( '+
                                     ' SELECT CVE_PRODUCTO FROM CR_PERF_PROD_USU WHERE ' +
                                     ' CVE_GPO_ACCESO = ' + IntToStr(Objeto.Apli.CvePerfil)+ ' )';
        Objeto.Producto.FilterString := Objeto.Producto.BuscaWhereString ;
        Objeto.Producto.FindKey([Objeto.Producto.CVE_PRODUCTO_CRE.AsString]);
        Objeto.Producto.Catalogo;
end;
//ENDS_EASA
procedure TWCrCto.btPROM_ADMClick(Sender: TObject);
Var T : TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRCTO_PRMADM',True,True) then
   begin
      With Objeto Do
      Begin
        T := CreaBuscador('CRGPOPROM.IT','I');
        T.WhereString := ' GPO_CONTRATO.ID_PERS_PROM_AUT = ' + Objeto.Contrato.Id_Pers_Asociad.AsString +
                          ' AND ID_GRUPO = ' + Objeto.Contrato.Id_Grupo.AsString ;
        Try
          If T.Execute Then
             Begin
               ID_PROM_ADMON.AsString := T.DameCampo(2);
               NOM_PROM_ADM.AsString := T.DameCampo(3);
               InterForma1.NextTab(btPROM_ADM);
             End;
        Finally
          T.Free;
        End;
      End;
   end;
end;

procedure TWCrCto.edROE_BRUTAExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
begin
     VLSalida := True;
     VLMesg := '';
    if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
    Begin
     Objeto.ROE_BRUTA.GetFromControl;
      if Objeto.ROE_BRUTA.AsInteger < 0 then
      Begin
         VLMesg := 'La clave Roe Bruta debe ser mayor a 0';
         VlSalida := False;
      end;
    end;
    InterForma1.ValidaExit(edROE_BRUTA,VlSalida,VLMesg,True);
end;

procedure TWCrCto.edROE_NETAExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
begin
     VLSalida := True;
     VLMesg := '';
    if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
    Begin
         Objeto.ROE_NETA.GetFromControl;
      if Objeto.ROE_NETA.AsInteger < 0 then
      Begin
         VLMesg := 'La clave Roe Neta debe ser mayor a 0';
         VlSalida := False;
      end;
    end;
    InterForma1.ValidaExit(edROE_NETA,VlSalida,VLMesg,True);
end;

procedure TWCrCto.edPCT_REQ_CAP_MERExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
begin
     VLSalida := True;
     VLMesg := '';
    if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
    Begin
         Objeto.PCT_REQ_CAP_MER.GetFromControl;
      if Objeto.PCT_REQ_CAP_MER.AsInteger < 0 then
      Begin
         VLMesg := 'El % de Req. de Mercado debe ser mayor a 0';
         VlSalida := False;
      end
      else
      Begin
         edPCT_CAPITALIZ.Text := FloatToStr(StrToFloat(edPCT_REQ_CAP_MER.Text) + StrToFloat(edPCT_REQ_CAP_CRE.Text));
      end;
    end;
    InterForma1.ValidaExit(edPCT_REQ_CAP_MER,VlSalida,VLMesg,True);

end;

procedure TWCrCto.edPCT_REQ_CAP_CREExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
begin
     VLSalida := True;
     VLMesg := '';
    if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
    Begin
         Objeto.PCT_REQ_CAP_CRE.GetFromControl;
      if Objeto.PCT_REQ_CAP_CRE.AsInteger < 0 then
      Begin
         VLMesg := 'El % de Req. de Crédito debe ser mayor a 0';
         VlSalida := False;
      end
      else
      Begin
        edPCT_CAPITALIZ.Text := FloatToStr(StrToFloat(edPCT_REQ_CAP_MER.Text) + StrToFloat(edPCT_REQ_CAP_CRE.Text));
      end;
    end;
    InterForma1.ValidaExit(edPCT_REQ_CAP_CRE,VlSalida,VLMesg,True);
end;

procedure TWCrCto.btCVE_CARACT_CTOClick(Sender: TObject);
Var T : TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRCTO_CARACCTO',True,True) then
   begin
      With Objeto Do
        begin
          T := CreaBuscador('ICRCOCD.IT','I');
          T.WhereString := ' CVE_CON_GPO_CAT = ''CAT_CAR_DISPOSIC''' ;
          T.ShowAll := True;
          Try
            If T.Execute Then
               Begin
                 CVE_CARACT_CTO.AsString := T.DameCampo(0);
                 DES_CVE_CARACT_CTO.AsString := T.DameCampo(1);
                 InterForma1.NextTab(btCVE_CARACT_CTO);
               end;
          finally
            T.Free;
          end;
        end;
   end;    
end;

procedure TWCrCto.btCVE_SEC_LABORALClick(Sender: TObject);
Var T : TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRCTO_SECLAB',True,True) then
   begin
      With Objeto Do
        begin
          T := CreaBuscador('ICRCOCD.IT','I');
          T.WhereString := ' CVE_CON_GPO_CAT = ''CAT_SECT_LABORAL''' ;
          T.ShowAll := True;
          Try
            If T.Execute Then
               Begin
                 CVE_SEC_LABORAL.AsString := T.DameCampo(0);
                 DESC_CVE_SEC_LABORAL.AsString := T.DameCampo(1);
                 InterForma1.NextTab(btCVE_SEC_LABORAL);
               end;
          finally
            T.Free;
          end;
        end;
   end;     
end;

procedure TWCrCto.btCVE_COMPROB_INGClick(Sender: TObject);
Var T : TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRCTO_COMPING',True,True) then
   begin
      With Objeto Do
        begin
          T := CreaBuscador('ICRCOCD.IT','I');
          T.WhereString := ' CVE_CON_GPO_CAT = ''CAT_COMP_INGRESO''' ;
          T.ShowAll := True;
          Try
            If T.Execute Then
               Begin
                 CVE_COMPROB_ING.AsString := T.DameCampo(0);
                 DES_CVE_COMPROB_ING.AsString := T.DameCampo(1);
                 InterForma1.NextTab(btCVE_COMPROB_ING);
               end;
          finally
            T.Free;
          end;
        end;
   end;     
end;

procedure TWCrCto.edCVE_CARACT_CTOExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
begin
   VlSalida   := True;
   VLMesg     := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.CVE_CARACT_CTO.GetFromControl;
      If Objeto.CVE_CARACT_CTO.AsString = '' then
      Begin
         VLMesg := 'La clave de la autorización no puede quedar vacía';
         VlSalida := False;
      end;
      If Objeto.CVE_CARACT_CTO.AsString = '0' then
      Begin
         VLMesg := 'La clave de la autorización no puede ser cero';
         VlSalida := False;
      end;
   end;
   InterForma1.ValidaExit(edCVE_CARACT_CTO,VLSalida,VLMesg,True);
end;

procedure TWCrCto.edCVE_COMPROB_INGExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
begin
   VlSalida   := True;
   VLMesg     := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.CVE_COMPROB_ING.GetFromControl;
      If Objeto.CVE_COMPROB_ING.AsString = '' then
      Begin
         VLMesg := 'La clave del tipo de ingresos no puede quedar vacía';
         VlSalida   := False;
      end;
      If Objeto.CVE_COMPROB_ING.AsString = '0' then
      Begin
         VLMesg := 'La clave del tipo de ingresos no puede ser cero';
         VlSalida   := False;
      end;
      InterForma1.ValidaExit(edCVE_COMPROB_ING,VLSalida,VLMesg,True);
   end;
end;



procedure TWCrCto.edCVE_SEC_LABORALExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
begin
   VLSalida := True;
   VLMesg     := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.CVE_SEC_LABORAL.GetFromControl;
      If Objeto.CVE_SEC_LABORAL.AsString = '' then
      Begin
         VLMesg := 'La clave del sector laboral no puede quedar vacía';
         VlSalida   := False;
      end;
   end;
   InterForma1.ValidaExit(edCVE_SEC_LABORAL,VLSalida,VLMesg,True);
end;

procedure TWCrCto.edIMP_INGRESOS_ACRExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
begin
     VLSalida := True;
     VLMesg := '';
    if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
    Begin
     Objeto.IMP_INGRESOS_ACR.GetFromControl;
      //if Objeto.IMP_INGRESOS_ACR.AsInteger <= 0 then
      if Objeto.IMP_INGRESOS_ACR.AsFloat <= 0.00 then
      Begin
         VLMesg := 'Los ingresos brutos deben ser mayor a 0';
         VlSalida := False;
      end;
    end;
    InterForma1.ValidaExit(edIMP_INGRESOS_ACR,VlSalida,VLMesg,True);
end;

procedure TWCrCto.edNO_CONSUL_BUROExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
begin
     VLSalida := True;
     VLMesg := '';
    if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
    Begin
     Objeto.NO_CONSUL_BURO.GetFromControl;
      if Objeto.NO_CONSUL_BURO.AsFloat <= 0 then
      Begin
         VLMesg := 'El número de consultas deden de ser mayor  a 0';
         VlSalida := False;
      end;
    end;
    InterForma1.ValidaExit(edNO_CONSUL_BURO,VlSalida,VLMesg,True);
end;

procedure TWCrCto.ilCVE_COMPROB_INGCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show := True;
end;

procedure TCrCto.ObtenDescripcion( peStrSQL,
  peStrNomCampo: String; peCVE_INTERCAMPO, peDESC_INTERCAMPO: TInterCampo);
var vlStrCampoResult : String;
begin
      GetSQLStr(peStrSQL, Apli.DataBaseName, Apli.SessionName, peStrNomCampo, vlStrCampoResult, False);
      If (Trim(vlStrCampoResult) <> '') Then
      begin
          peDESC_INTERCAMPO.AsString := vlStrCampoResult;
      end;
end;

procedure TWCrCto.InterLinkit1Ejecuta(Sender: TObject);
begin
     with Objeto do
     begin
     ObtenDescripcion( ' SELECT CR.DESC_CLAVE AS DESC_CVE'+coCRLF+
                       ' FROM CR_CON_CAT_DATA CR'+coCRLF+
                       ' WHERE CR.CVE_CON_GPO_CAT = ''CAT_CAR_DISPOSIC'' AND CR.CVE_CLAVE = '''+edCVE_CARACT_CTO.Text+''''+coCRLF,
                        'DESC_CVE',
                       CVE_CARACT_CTO,
                       DES_CVE_CARACT_CTO
                     );
         InterForma1.NextTab(edCVE_CARACT_CTO);
     end;

end;

procedure TWCrCto.InterLinkit3Ejecuta(Sender: TObject);
begin
     with Objeto do
     begin
     ObtenDescripcion( ' SELECT CR.DESC_CLAVE AS DESC_CVE'+coCRLF+
                       ' FROM CR_CON_CAT_DATA CR'+coCRLF+
                       ' WHERE CR.CVE_CON_GPO_CAT = ''CAT_SECT_LABORAL'' AND  CR.CVE_CLAVE = '''+edCVE_SEC_LABORAL.Text+''''+coCRLF,
                        'DESC_CVE',
                       CVE_SEC_LABORAL,
                       DESC_CVE_SEC_LABORAL
                     );
         InterForma1.NextTab(edCVE_SEC_LABORAL);
     end;
end;

procedure TWCrCto.InterLinkit2Ejecuta(Sender: TObject);
begin
     with Objeto do
     begin
         ObtenDescripcion( ' SELECT CR.DESC_CLAVE AS DESC_CVE'+coCRLF+
                       ' FROM CR_CON_CAT_DATA CR'+coCRLF+
                       ' WHERE CR.CVE_CON_GPO_CAT = ''CAT_COMP_INGRESO'' AND CR.CVE_CLAVE = '''+edCVE_COMPROB_ING.Text+''''+coCRLF,
                        'DESC_CVE',
                       CVE_COMPROB_ING,
                       DES_CVE_COMPROB_ING
                     );
         InterForma1.NextTab(edCVE_COMPROB_ING);
     end;
end;

procedure TWCrCto.edPCT_CAPITALIZExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
begin
     VLSalida := True;
     VLMesg := '';
    if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
    Begin
         Objeto.PCT_CAPITALIZ.GetFromControl;
      if Objeto.PCT_CAPITALIZ.AsInteger < 0 then
      Begin
         VLMesg := 'El % de Capitalización debe ser mayor a 0';
         VlSalida := False;
      end;
    end;
    InterForma1.ValidaExit(edPCT_CAPITALIZ,VlSalida,VLMesg,True);
end;

procedure TWCrCto.chB_EMPROBLEMADAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_EMPROBLEMADA,true,'',True);
end;

procedure TWCrCto.chB_EMPLEADOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_EMPLEADO,true,'',True);
end;

//SATV4766 03 DIC 2009 ADECUACIONES DE ACUERDO AL REQUERIMIENTO DE LA CERTIFICACION R04
//INICIO MODIFICACIONES
procedure TWCrCto.chB_RAMO_28Exit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_RAMO_28,true,'',True);
end;

procedure TWCrCto.chB_ESTRUCTURADOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_ESTRUCTURADO,true,'',True);
end;
//FIN MODIFICACIONES
//SATV4766 03 DIC 2009 ADECUACIONES DE ACUERDO AL REQUERIMIENTO DE LA CERTIFICACION R04

Function  TWCrCto.ValidaRFC() : Boolean; //Validación del RFC de la persona 5 de Abril de 2010 EISBDT04 (ORG)
Var
  sRFC : String;
  bLongOK : Boolean;
  Function CompruebaAlfa(pSiglas : String) : Boolean;
  Var
    i : Integer;
  Begin
    Result := True;
    for i := 1 to length(pSiglas) do
    begin
      if not (pSiglas[i] in ['A'..'Z']) then
        Result := False;
    end;
  end;
  Function CompruebaNum(pFecha : String) : Boolean;
  Var
    i : Integer;
  Begin
    Result := True;
    for i := 1 to length(pFecha) do
    begin
      if not (pFecha[i] in ['0'..'9']) then
        Result := False;
    end;
  end;
  Function CompruebaAlfaNum(pHomo : String) : Boolean;
  Var
    i : Integer;
  Begin
    Result := True;
    for i := 1 to length(pHomo) do
    begin
      if (not (pHomo[i] in ['0'..'9'])) and (not (pHomo[i] in ['A'..'Z'])) then
        Result := False;
    end;
  end;
begin
  Result := False;
  bLongOK := False;
  with Objeto.Acreditado.Persona do
  begin
    sRFC := Trim(Siglas_RFC.AsString) + Trim(F_RFC.AsString) + Trim(Homoclave_RFC.AsString);
    if Cve_Per_Juridica.AsString = 'PF' then //si es persona física
    begin
      if Length(sRFC) = 13 then //todo: investigar si hay constante para este valor y para el de persona física
        bLongOK := True;
    end
    else // si es persona moral
      if Length(sRFC) = 12 then //todo: investigar si hay constante para este valor y para el de persona física
        bLongOK := True;
    if bLongOK then
      if CompruebaAlfa(Trim(Siglas_RFC.AsString)) then
        if CompruebaNum(Trim(F_RFC.AsString)) then
          if CompruebaAlfaNum(Trim(Homoclave_RFC.AsString)) then
            Result := True;
  end; //with
end;


procedure TWCrCto.CalificacionCreditoEstructurado1Click(Sender: TObject);
var ContratoEst : TCrCtoEst;
begin
     if  ((Objeto.Active = true) and (Objeto.B_ESTRUCTURADO.AsString = 'V')) then
     begin
          {$WARNINGS OFF}
          ContratoEst := TCrCtoEst.Create(self);
          {$WARNINGS ON}
          try
             ContratoEst.Apli:=Objeto.Apli;
             ContratoEst.ParamCre:=Objeto.ParamCre;
             ContratoEst.ID_CONTRATO.AsString := Objeto.ID_CONTRATO.AsString;
             ContratoEst.Catalogo;
          finally
                 ContratoEst.Free;
          end;
     end
     else
         ShowMessage('Debe de seleccionar un Contrato que sea Estrucuturado.');

end;

procedure TWCrCto.edID_AVAL_GOBExit(Sender: TObject);
var     VLSalida    : Boolean;
        VLMsg       : String;
begin
     VLSalida := True;
     VLMsg    := '';
     Objeto.DESC_ACRED_GOB.AsString := '';
     Objeto.ObtenDescripcion( ' SELECT DISTINCT P.NOMBRE AS DESC_CVE '+coCRLF+
                       ' FROM CR_REL_CAL_ACRE CRCA, PERSONA P'+coCRLF+
                       ' WHERE P.ID_PERSONA =  CRCA.ID_ACREDITADO AND P.ID_PERSONA =  '+edID_AVAL_GOB.Text+coCRLF,
                       'DESC_CVE',
                       objeto.ID_AVAL_GOB,
                       objeto.DESC_ACRED_GOB
                     );

     if ((Objeto.DESC_ACRED_GOB.AsString = '') AND (trim(edID_AVAL_GOB.Text)<>''))then
     Begin
         VLSalida := False;
         VLMsg    := 'La Entidad de Gobierno no Existe';
     end
     Else
     Begin
        VLSalida := True;
        VLMsg    := '';
     End;
     InterForma1.ValidaExit(edID_AVAL_GOB,VLSalida,VLMsg,True);
end;

procedure TWCrCto.btnID_ACRED_GOBClick(Sender: TObject);
Var T1:TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRCTO_GTIAGOB',True,True) then
   begin
      T1 := objeto.CreaBuscador('ICrEntGOB.it','I;S');
      T1.WhereString := '';
      Try
         if Active then
         begin
            T1.Param(0,objeto.ID_AVAL_GOB.AsString);
            T1.Param(1,objeto.DESC_ACRED_GOB.AsString);
         end;
         if T1.Execute then
         Begin
            objeto.ID_AVAL_GOB.AsString    := T1.DameCampo(0);
            objeto.DESC_ACRED_GOB.AsString := T1.DameCampo(1);
         End;
      finally
         T1.Free;
      end;
       edID_AVAL_GOB.SetFocus;
   end;
end;

procedure TWCrCto.btnID_ACRED_GOBExit(Sender: TObject);
begin
//     InterForma1.ValidaExit(btnID_ACRED_GOB,true,'',True);
end;

procedure TWCrCto.btCVE_ANALISTA_RESClick(Sender: TObject);
  Var T1:TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRCTO_ANALISTA',True,True) then
   begin
        if ObtPermisoMod('AS') = false then
        Begin
                ShowMessage('No cuenta con permisos para asignar al Analista, solicite a seguridad ' + coCRLF+
                            'el acceso a Operaciones Especiales, con las siguentes caracteristicas: '+ coCRLF+
                            'Función: '+  Objeto.Apli.LastFuncion + coCRLF+
                            'Clave Operacion: AS'+coCRLF+
                            'Usuario: '+ Objeto.Apli.Usuario);
            Exit;
        End;


      T1 := objeto.CreaBuscador('IUSUARIO.IT','S;F;S');
      T1.WhereString := '';
      Try
         if T1.Execute then
         Begin
            objeto.CVE_ANALISTA_RES.AsString    := T1.DameCampo(0);

         End;
      finally
         T1.Free;
      end;
   end;
end;

procedure TWCrCto.DarVistoBuenodelAnalista1Click(Sender: TObject);
Var
  sSQL,sOk : String;
  QryTmp : TQuery;
  vlF_ANALISTA : String;
Begin

   if Objeto.Active then
   begin
        if (Trim(Objeto.Apli.Usuario)= '' ) then
        Begin
                ShowMessage('No existe un analista asignado para este contrato, por lo que no se permite dar el visto bueno');
            Exit;
        End;

        if Trim(Objeto.CVE_ANALISTA_RES.AsString) <> Trim(Objeto.Apli.Usuario) then
        Begin
                ShowMessage('Solamente el usuario con clave ' + Objeto.CVE_ANALISTA_RES.AsString + ' puede dar el visto bueno');
            Exit;
        End;


        if ObtPermisoMod('VB') = false then
        Begin
                ShowMessage('No cuenta con permisos para var el visto bueno del analista.Solicite a seguridad ' + coCRLF+
                            'el acceso a Operaciones Especiales, con las siguentes caracteristicas: '+ coCRLF+
                            'Función: '+  Objeto.Apli.LastFuncion + coCRLF+
                            'Clave Operacion: VB'+coCRLF+
                            'Usuario: '+ Objeto.Apli.Usuario);
            Exit;
        End;

        if MessageDlg('¿Desea dar el Visto Bueno de Analista?',
                 mtConfirmation,[mbYes, mbNo], 0) = mrYes then
        Begin
                vlF_ANALISTA := FormatDateTime('DD/MM/YYYY HH:NN:SS AMPM', Objeto.Apli.SysDateTime);
                QryTmp := TQuery.Create(Application);
                QryTmp.DatabaseName := Objeto.DataBaseName;
                QryTmp.SessionName := Objeto.SessionName;
                sOk := 'V';
                sSQL := 'INSERT INTO CR_VOBO_ANALIST( ID_CONTRATO, CVE_ANALISTA, FH_VOBO) VALUES (' +
                        Trim(Objeto.ID_CONTRATO.AsString) + ', ' +
                        QuotedStr(trim(Objeto.Apli.Usuario)) + ', ' +
	                'TO_DATE('+QuotedStr(vlF_ANALISTA)+ ', ''DD/MM/YYYY HH:MI:SS PM''))';
                try
                        QryTmp.SQL.Text := sSQL;
                        QryTmp.ExecSQL;
                except
                        sOk := 'F';
                        ShowMessage('Error al registrar el Visto Bueno, intente más tarde');
                end;

                if  sOk = 'V' then
                Begin
                        sSQL := 'UPDATE CR_CONTRATO SET F_ANALISTA = TO_DATE('+QuotedStr(vlF_ANALISTA)+ ', ''DD/MM/YYYY HH:MI:SS PM'')' +
                                ', CVE_USU_ANALIST =' + QuotedStr(trim(Objeto.Apli.Usuario)) +
                                ' WHERE ID_CONTRATO = ' + Trim(Objeto.ID_CONTRATO.ASSTRING) ;
                        try
                                QryTmp.SQL.Text := sSQL;
                                QryTmp.ExecSQL;
                        except
                                sOk := 'F';
                                ShowMessage('Error al Actualizar el Vobo del Analista en CR_CONTRATO, intente más tarde');
                        end;
                End;
                QryTmp.Free;
        End;
   end
   else
      ShowMessage('Debe de seleccionar un Contrato.');
end;

procedure TWCrCto.VerVistosBuenosdelAnalista1Click(Sender: TObject);
var  Analista  : TCrAnalist;
begin
   if Objeto.Active then
   begin
          {$WARNINGS OFF}
          Analista := TCrAnalist.Create(self);
          {$WARNINGS ON}
          try
             Analista.Apli:=Objeto.Apli;
             Analista.ParamCre:=Objeto.ParamCre;
             Analista.Acreditado := Objeto.Acreditado;
             Analista.ID_CONTRATO.AsString := Objeto.ID_CONTRATO.AsString;
             Analista.Catalogo;

          finally
                 Analista.Free;
          end;
   end
   else
      ShowMessage('Debe de seleccionar un Acreditado.');

end;

function TWCrCto.ObtPermisoMod(peCVE_OPER_ACC: String): Boolean;
var cnt : Integer;
begin
 GetSQLInt( 'SELECT count(*) VECES ' +
            'FROM   SECU_OPER_ACC  ' +
            'WHERE (CVE_FUNCION =  ' + QuotedStr(objeto.Apli.LastFuncion) +  '  ) ' +
            'AND   (CVE_USUARIO =  ' + QuotedStr(objeto.Apli.Usuario    ) +  '  ) ' +
            'AND   (CVE_OPER_ACC = ' + QuotedStr(peCVE_OPER_ACC  ) + ' ) ', objeto.Apli.DataBaseName,
            objeto.Apli.SessionName, 'VECES', cnt, False );
 Result :=  ( cnt = 1 );
end;

procedure TWCrCto.btCVE_ANALISTA_RESExit(Sender: TObject);
begin
     InterForma1.ValidaExit(btCVE_ANALISTA_RES,true,'',True);
end;

function TCrCto.ObtenTipoCarteraProd(peCVE_CAT_MINIMO : String): String;
var vlSql         : String;
    vlCVE_AGRUPACION   : String;
Begin
   vlSql := 'SELECT CVE_AGRUPACION  FROM CR_REG_CARTERA WHERE CVE_CAT_MINIMO = SUBSTR(' +QuotedStr(Trim(peCVE_CAT_MINIMO)) + '|| ''000000000000'', 1, 12)';

   GetSqlStr(vlSqL,Apli.DataBaseName,Apli.SessionName,'CVE_AGRUPACION',vlCVE_AGRUPACION,False);
   if vlCVE_AGRUPACION = CNULL then
      vlCVE_AGRUPACION := 'OTROS';
   result := vlCVE_AGRUPACION;
end;


function TCrCto.ValidaDestino(peCveDestino: String;peTipoCartera : String): Integer;
var vlSql         : String;
    vlcontador   : Integer;
Begin
   vlSql := 'SELECT COUNT(1) AS CUENTA FROM CR_DESTINO  WHERE CVE_DESTINO = '+QuotedStr(Trim(peCveDestino))+' AND CVE_AGRUPACION IN ('+QuotedStr(Trim(peTipoCartera))+ ', ''OTROS'')';
   GetSQLInt(vlSqL,Apli.DataBaseName,Apli.SessionName,'CUENTA',vlcontador,True);
   result := vlcontador;
end;



procedure TWCrCto.EstadosyMunicipios1Click(Sender: TObject);
var
  CrTipGar : TCrTipGar;
  strSQL : String;
  qryDatos : TQuery;
begin
  { RUCJ4248 :: Se migra a interformas }
  if Objeto.Active then
  begin
    {$WARNINGS OFF}
    CrTipGar := TCrTipGar.Create(self);
    {$WARNINGS ON}
    try
      CrTipGar.Apli := Objeto.Apli;
      CrTipGar.ParamCre := Objeto.ParamCre;
      CrTipGar.ID_CONTRATO.AsString := Objeto.ID_CONTRATO.AsString;
      CrTipGar.strContrato := Objeto.ID_CONTRATO.AsString;

      strSQL := 'select nvl(max(ID_CONTRATO),0) as ID_CONTRATO from ADMIPROD.CR_TIPOS_GARAN WHERE ID_CONTRATO = '+ Objeto.ID_CONTRATO.AsString;
      qryDatos := GetSQLQuery(strSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, True);
      if Assigned(qryDatos) and NOT( qryDatos.IsEmpty ) THEN
      begin
        if qryDatos.FieldByName('ID_CONTRATO').AsFloat <> 0 then
        begin
          //CrTipGar.FindKey([qryDatos.FieldByName('ID_CONTRATO').AsString]);
          CrTipGar.BuscaWhereString := ' ID_REG_VIGENTE = 1 AND ID_CONTRATO = ' + QuotedStr( Objeto.ID_CONTRATO.AsString );
          CrTipGar.FilterString := CrTipGar.BuscaWhereString;
          CrTipGar.FindKey([Objeto.ID_CONTRATO.AsString]);
          CrTipGar.Catalogo;
        end
        else begin
          CrTipGar.bolEsNuevo := true;
          CrTipGar.Nuevo;
        end;

        qryDatos.Free;

      end
      else begin
        CrTipGar.bolEsNuevo := true;
        CrTipGar.Nuevo;
      end;

    finally
      CrTipGar.Free;
    end;
  end
end;



procedure TWCrCto.InterForma1DespuesEliminar(Sender: TObject);
var
 psResultado : Integer;
 psMsgResultado : String;
begin

  if Objeto.Id_Contrato.Asstring = '' then
   begin
  //Una vez eliminada la información del contrato se elimina la informacion de garantías
  spElimina.DatabaseName     := Objeto.DataBaseName;
    spElimina.SessionName    := Objeto.SessionName;
    spElimina.StoredProcName :=  'SISTEMAS.PKGCRREGULATORIOSR04.ELIMINA';
    spElimina.Params.Clear;

     spElimina.Params.CreateParam (ftFloat, 'peIdContrato', ptInput);

     spElimina.Params.CreateParam (ftInteger, 'psError',ptOutput);
     spElimina.Params.CreateParam (ftString,  'psMsg',  ptOutput);

     spElimina.ParamByName('peIdContrato').AsFloat := vIdContrato ;

     spElimina.ExecProc;
      psResultado    := spElimina.ParamByName('psError').AsInteger;
      psMsgResultado := spElimina.ParamByName('psMsg').AsString;

      if psResultado = 0 then
          begin
            MessageDlg('Se han eliminado los datos de las garantías con exito. '+ psMsgResultado, mtInformation, [mbOk], 0);
          end
          else
          MessageDlg('Hubo un error con el mensaje '+ psMsgResultado, mtError, [mbOk], 0);
    end;
  end;

procedure TWCrCto.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
begin
   vIdContrato :=  Objeto.Id_Contrato.AsInteger;
end;

//RUCJ4248
procedure TWCrCto.PortafoliodeCrdito1Click(Sender: TObject);
var
  CrPortafo : TCrPortafo;
   strSQL : String;
   qryDatos : TQuery;
begin
  if Objeto.Active then
  begin
    {$WARNINGS OFF}
    CrPortafo := TCrPortafo.Create(self);
    {$WARNINGS ON}
    try
      CrPortafo.Apli := Objeto.Apli;
      CrPortafo.ParamCre := Objeto.ParamCre;
      CrPortafo.ID_CONTRATO.AsString := Objeto.ID_CONTRATO.AsString;

      strSQL := 'select nvl(max(ID_CONTRATO),0) as ID_CONTRATO from ADMIPROD.CR_PORTAFOLIO WHERE ID_CONTRATO = '+ Objeto.ID_CONTRATO.AsString;
      qryDatos := GetSQLQuery(strSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, True);
      if Assigned(qryDatos) and NOT( qryDatos.IsEmpty ) THEN
      begin
        if qryDatos.FieldByName('ID_CONTRATO').AsFloat <> 0 then
        begin
           CrPortafo.FindKey([qryDatos.FieldByName('ID_CONTRATO').AsString]);
           CrPortafo.Catalogo;
        end
        else begin
          CrPortafo.Nuevo;
        end;

        qryDatos.Free;

      end else CrPortafo.Nuevo;

    finally
      CrPortafo.Free;
    end;
  end
end;

{TBlinkLabel}
constructor TBlinkLabel.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);

  Timer         := TTimer.Create (Self);
  Timer.OnTimer := TimerTimer;
end;

destructor TBlinkLabel.Destroy;
begin
  Timer.Free;

  inherited;
end;

procedure TBlinkLabel.SetInterval (Value: cardinal);
begin
  Timer.Interval := Value;
end;

procedure TBlinkLabel.SetActive (Value: boolean);
begin
  Timer.Enabled := Value;
end;

function TBlinkLabel.GetInterval: cardinal;
begin
  result := Timer.Interval;
end;

function TBlinkLabel.GetActive: boolean;
begin
  result := Timer.Enabled;
end;

procedure TBlinkLabel.TimerTimer (Sender: TObject);
begin
  Visible := not Visible;
end;



procedure TWCrCto.BitBtn1Click(Sender: TObject);
var
  T:TInterFindit;
begin

  with Objeto do
  begin
    if Active then
    begin

      //BuscaWhereString := ' 1=1 ';
      //FilterString := Objeto.BuscaWhereString ;
      T := CreaBuscador('ICRALTADIS.IT', 'S,S');
      T.WhereString := 'CVE_CON_GPO_CAT = ' + QuotedStr('CAT_ALTA_DISPOS');
      T.ShowAll := True;
      try
        if T.Execute then
           begin
              objeto.CVE_TIPO_ALTA.AsString  := T.DameCampo(0);
              objeto.DESC_TIPO_ALTA.AsString := T.DameCampo(1);
           end;
      finally
        T.Free;
      end;

    end else //// if Objeto.Active then
    MessageDlg(''+#13+#10+'Debe de seleccionar un Contrato', mtInformation, [mbOK], 0);

  end; /// With Objeto do

   ///// eSTE CODIGO SE MANTUVO PORQUE AL RECARGAR LA FORMA MANDABA A EJECUTAR EL EVENTO "InterForma1DespuesShow"
   //// LO QUE SE HIZO FUE LIMPIAR EL WHERE STRING PARA DESPUES PONERLO COMO ESTABA
   Objeto.BuscaWhereString := ' CR_CONTRATO.CVE_PRODUCTO_CRE IN ( '+
                                             ' SELECT CVE_PRODUCTO FROM CR_PERF_PROD_USU WHERE ' +
                                             ' CVE_GPO_ACCESO = ' + IntToStr(Objeto.Apli.CvePerfil)+ ' )';
   Objeto.FilterString := Objeto.BuscaWhereString ;


end;

procedure TWCrCto.DateTimePicker1Exit(Sender: TObject);
Var     VLValida        : Boolean;
        VLMsg           : String;
begin
{   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     VLMsg := '';
     VLValida := True;
     Objeto.F_REP_SIC.GetFromControl;

     If Objeto.F_REP_SIC.AsString <> '' then
        if (ValidaFecha(Objeto.F_REP_SIC.AsDateTime,Objeto.Apli) >= 1) then
        Begin
           VLMsg := 'La fecha no es válida';
           VLValida := False;
        end;
     //end if;
     InterForma1.ValidaExit(edF_REP_SIC,VLValida,VLMsg,True);
   end;
}
end;

procedure TWCrCto.btnCVE_PRODUCTO_BCAClick(Sender: TObject);
Var T : TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRCTO_PRBCA',True,True) then
   begin
      With Objeto Do
      Begin
        T := CreaBuscador('ICRRELPRBCA.IT','S');
        T.WhereString := ' CR_REL_PROD_BCA.CVE_PRODUCTO_CRE = ' + #39 + edCVE_PRODUCTO_CRE.Text + #39;
        Try
          If T.Execute Then
             Begin
               CVE_PRODUCTO_BCA.AsString := T.DameCampo(1);

               if ProductoBCA.FindKey([CVE_PRODUCTO_BCA.AsString]) then
                   edDESC_PROD_BCA.Text := ProductoBCA.DESC_L_PRODUCTO.AsString
               else
                   edDESC_PROD_BCA.Text := '';

               InterForma1.NextTab(btnCVE_PRODUCTO_BCA);
             End;
        Finally
          T.Free;
        End;
      End;
   end;
end;

procedure TWCrCto.ilCVE_PRODUCTO_BCAEjecuta(Sender: TObject);
begin
     with Objeto do
     begin
        ObtenDescripcion( ' SELECT ' + coCRLF +
                          ' CR_PRODUCTO_BCA.DESC_L_PRODUCTO ' + coCRLF +
                          ' FROM CR_REL_PROD_BCA, CR_PRODUCTO_BCA ' + coCRLF +
                          ' WHERE ' + coCRLF +
                          '       CR_REL_PROD_BCA.CVE_PRODUCTO_BCA = CR_PRODUCTO_BCA.CVE_PRODUCTO_BCA ' + coCRLF +
                          '   AND CR_REL_PROD_BCA.CVE_PRODUCTO_CRE = ' + #39 + edCVE_PRODUCTO_CRE.Text + #39 + coCRLF +
                          '   AND CR_REL_PROD_BCA.CVE_PRODUCTO_BCA = ' + #39 + edCVE_PRODUCTO_BCA.Text + #39 + coCRLF,
                          'DESC_L_PRODUCTO',
                          CVE_PRODUCTO_BCA,
                         DESC_PROD_BCA
                        );
         InterForma1.NextTab(edCVE_PRODUCTO_BCA);
     end;
end;

procedure TWCrCto.edCVE_PRODUCTO_BCAExit(Sender: TObject);
begin

  With Objeto Do
  Begin
       if ((Modo = moEdit) or (Modo = moAppend)) then
       begin
          CVE_PRODUCTO_BCA.GetFromControl;

          if ProductoBCA.FindKey([CVE_PRODUCTO_BCA.AsString]) then
          begin
              edDESC_PROD_BCA.Text := ProductoBCA.DESC_L_PRODUCTO.AsString;
          end
          else
          begin
              edDESC_PROD_BCA.Text := '';
              edCVE_PRODUCTO_BCA.Text := '';
          end;
       end;
  end;
  InterForma1.ValidaExit(edCVE_PRODUCTO_BCA,True,'',True);
end;

procedure TWCrCto.mnComplementosClick(Sender: TObject);
var
  CrCtoAdd : TCrCtoAdd;
  strSQL : String;
  qryDatos : TQuery;
begin

  if Objeto.Active then
  begin
    {$WARNINGS OFF}
    CrCtoAdd := TCrCtoAdd.Create(self);
    {$WARNINGS ON}
    try
      CrCtoAdd.Apli := Objeto.Apli;
      CrCtoAdd.ParamCre:=Objeto.ParamCre;
      CrCtoAdd.ID_CONTRATO.AsString := Objeto.ID_CONTRATO.AsString;
      CrCtoAdd.strContrato := Objeto.ID_CONTRATO.AsString;
      CrCtoAdd.strClasCont := Objeto.Producto.CVE_CLAS_CONTAB.AsString;
      CrCtoAdd.strLocalidad := Objeto.Acreditado.CVE_LOCAL_CNBV.AsString;

      strSQL := 'select nvl(max(ID_CONTRATO),0) as ID_CONTRATO from ADMIPROD.CR_CONTRATO_ADD WHERE ID_CONTRATO = '+ Objeto.ID_CONTRATO.AsString;
      qryDatos := GetSQLQuery(strSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, True);
      if Assigned(qryDatos) and NOT( qryDatos.IsEmpty ) THEN
      begin
        if qryDatos.FieldByName('ID_CONTRATO').AsFloat <> 0 then
        begin
          //CrTipGar.FindKey([qryDatos.FieldByName('ID_CONTRATO').AsString]);
          CrCtoAdd.BuscaWhereString := ' ID_CONTRATO = ' + QuotedStr( Objeto.ID_CONTRATO.AsString );
          CrCtoAdd.FilterString := CrCtoAdd.BuscaWhereString;
          CrCtoAdd.FindKey([Objeto.ID_CONTRATO.AsString]);
          CrCtoAdd.Catalogo;
        end
        else begin
          CrCtoAdd.Nuevo;
        end;

        qryDatos.Free;

      end
      else begin
        CrCtoAdd.Nuevo;
      end;

    finally
      CrCtoAdd.Free;
    end;
  end
  else ShowMessage('Debe de seleccionar una Autorización.');

end;


procedure TWCrCto.edPeriodicidad_CATExit(Sender: TObject);
var
  vlValida: boolean;
  vlMsg: string;
begin
  VLMsg    := '';
  VLValida := True;
  if ((Objeto.Modo = moEdit) or (Objeto.Modo = moAppend)) then
  begin
     Objeto.Periodicidad_CAT.GetFromControl;

     if Objeto.UTiempoPeriodicidadCAT.FindKey([Objeto.Periodicidad_CAT.AsString]) then
     begin
       edDesc_Periodicidad_CAT.Text := Objeto.UTiempoPeriodicidadCAT.DESCRIPCION.AsString;
     end
     else
     begin
         edPeriodicidad_CAT.Text := '';
         edDesc_Periodicidad_CAT.Text := '';
     end;
  end;
  InterForma1.ValidaExit(edPeriodicidad_CAT,VLValida,vlMsg,True);
end;

procedure TWCrCto.btnPeriodicidad_CATClick(Sender: TObject);
begin
  if Objeto.ValidaAccesoEsp('TCRCTO_UNTMPCAT',True,True) then
  begin
    Objeto.UTiempoPeriodicidadCAT.ShowAll := True;
    if Objeto.UTiempoPeriodicidadCAT.Busca then
    begin
       InterForma1.NextTab(edPeriodicidad_CAT);
    end;
  end;
end;

procedure TWCrCto.edPeriodicidad_InteresExit(Sender: TObject);
var
  vlValida: boolean;
  vlMsg: string;
begin
  VLMsg    := '';
  VLValida := True;
  if ((Objeto.Modo = moEdit) or (Objeto.Modo = moAppend)) then
  begin
     Objeto.Periodicidad_Interes.GetFromControl;

     if Objeto.UTiempoPeriodicidadINT.FindKey([Objeto.Periodicidad_Interes.AsString]) then
     begin
       edDesc_Periodicidad_Interes.Text := Objeto.UTiempoPeriodicidadINT.DESCRIPCION.AsString;
     end
     else
     begin
         edPeriodicidad_Interes.Text := '';
         edDesc_Periodicidad_Interes.Text := '';
     end;
  end;
  InterForma1.ValidaExit(edPeriodicidad_Interes,VLValida,vlMsg,False);
end;

procedure TWCrCto.btnPeriodicidad_InteresClick(Sender: TObject);
begin
  if Objeto.ValidaAccesoEsp('TCRCTO_UNTMPINT',True,True) then
  begin
    Objeto.UTiempoPeriodicidadint.ShowAll := True;
    if Objeto.UTiempoPeriodicidadint.Busca then
    begin
       InterForma1.NextTab(edPeriodicidad_Interes);
    end;
  end;
end;

procedure TWCrCto.EdCod_CNBVExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo = moAppend)) then
     begin
      Objeto.CODIGO_CNBV.GetFromControl;
//      chkB_REPORTE_SIC.SetFocus;
      InterForma1.ValidaExit(EdCod_CNBV,True,'',True);
   End;
end;

procedure TWCrCto.FormCreate(Sender: TObject);
begin
      PageCon_Datos.ActivePage:= TabSheet1;
      edpF_REP_SIC.Enabled:= False;

end;

procedure TWCrCto.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
     PageCon_Datos.ActivePage:= TabSheet1;
     edpF_REP_SIC.Enabled:= True;
end;

procedure TWCrCto.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
  PageCon_Datos.ActivePage:= TabSheet1;
  edpF_REP_SIC.Enabled:= True;
end;

procedure TWCrCto.chkB_PRELACION_PGOExit(Sender: TObject);
begin
     //PageCon_Datos.ActivePage:= TabSheet2;
     PageCon_Datos.ActivePageIndex := 1 ;
     InterForma1.ValidaExit(chkB_PRELACION_PGO, true, '', true);
     edCVE_MONEDA.SetFocus;
end;

procedure TWCrCto.edCVE_ORIGEN_RECExit(Sender: TObject);
begin
    Objeto.CVE_ORIGEN_REC.GetFromControl;
    InterForma1.ValidaExit(edCVE_ORIGEN_REC, True, '', true);
end;

procedure TWCrCto.edDESC_ORIGEN_RECExit(Sender: TObject);
begin
    // --- CHECAR ---  ASOR -- JUNIO 2016 ---
    Objeto.OrigRec.DESC_ORIGEN_REC.GetFromControl;
    Interforma1.ValidaExit(edDESC_ORIGEN_REC, True, '', True);
end;

procedure TWCrCto.edCVE_DESTINOExit(Sender: TObject);
begin
    Objeto.CVE_DESTINO.GetFromControl;
    InterForma1.ValidaExit(edCVE_DESTINO, True, '', True);
end;

procedure TWCrCto.btCVE_DESTINOExit(Sender: TObject);
begin
    Objeto.CVE_DESTINO.GetFromControl;
    InterForma1.ValidaExit(btCVE_DESTINO, True, '', True);
end;

procedure TWCrCto.edDESC_DESTINOExit(Sender: TObject);
begin
    // --- CHECAR --- ASOR --- JUNIO 2016 ---
    Objeto.Destino.DESC_DESTINO.GetFromControl;
    InterForma1.ValidaExit(edDESC_DESTINO, True, '', True);
end;

procedure TWCrCto.edID_PROM_ADMExit(Sender: TObject);
begin
    Objeto.ID_PROM_ADMON.GetFromControl;
    InterForma1.ValidaExit(edID_PROM_ADM, True, '', True);
end;

procedure TWCrCto.edPROM_ADMExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_PROM_ADM, True, '', True);
end;

procedure TWCrCto.edNAME_PROM_ADMExit(Sender: TObject);
begin
     Objeto.NOM_PROM_ADM.GetFromControl;
     InterForma1.ValidaExit(edNAME_PROM_ADM, True, '', True);
end;

procedure TWCrCto.edDES_CVE_CARACT_CTOExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edDES_CVE_CARACT_CTO,True,'',True);
end;

procedure TWCrCto.edDES_CVE_COMPROB_INGExit(Sender: TObject);
begin
     Objeto.DES_CVE_COMPROB_ING.GetFromControl;
     InterForma1.ValidaExit(edDES_CVE_COMPROB_ING,True,'',True);
end;

procedure TWCrCto.edDESC_CVE_SEC_LABORALExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edDESC_CVE_SEC_LABORAL,True,'',True);
end;

procedure TWCrCto.edIMP_DISPUESTOExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edIMP_DISPUESTO, true, '', true);
end;

procedure TWCrCto.edIMP_BLOQUEADOExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edIMP_BLOQUEADO, true, '', true);

end;

procedure TWCrCto.iedDISPONIBLE_AUTExit(Sender: TObject);
begin
     InterForma1.ValidaExit(iedDISPONIBLE_AUT, true, '', true);
end;

procedure TWCrCto.iedDISPONIBLE_ACREDExit(Sender: TObject);
begin
     InterForma1.ValidaExit(iedDISPONIBLE_ACRED, true, '', true);
end;

procedure TWCrCto.edDISPONIBLE_GRUPO_ECOExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edDISPONIBLE_GRUPO_ECO, true, '', true);
end;

procedure TWCrCto.edIMP_FINANC_ADICExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edIMP_FINANC_ADIC, true, '', true);
end;

procedure TWCrCto.iedRIESGO_TOTALExit(Sender: TObject);
begin
     InterForma1.ValidaExit(iedRIESGO_TOTAL, true, '', true);
end;

procedure TWCrCto.edF_VTO_EXCESOExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edF_VTO_EXCESO, true, '', true);
end;

procedure TWCrCto.edIMP_AUT_ORIGExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edIMP_AUT_ORIG, true, '', true);
end;

procedure TWCrCto.edIMP_EXCESO_EVEExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edIMP_EXCESO_EVE, true, '', true);
end;

procedure TWCrCto.chCVE_FORMA_DISPExit(Sender: TObject);
begin
     InterForma1.ValidaExit(chCVE_FORMA_DISP, true, '', true);
end;

procedure TWCrCto.chkB_TIPO_LINEAExit(Sender: TObject);
begin
     InterForma1.ValidaExit(chkB_TIPO_LINEA, true, '', true);
end;

procedure TWCrCto.btPROM_ADMExit(Sender: TObject);
begin
     InterForma1.ValidaExit(btPROM_ADM, true, '', true);
end;

procedure TWCrCto.edDESC_MONEDAExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edDESC_MONEDA, true, '', true);
end;

procedure TWCrCto.edDESC_TASA_REFERExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edDESC_TASA_REFER, True, '', True);
end;

procedure TWCrCto.edCVE_GPO_CAPITALIZExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edCVE_GPO_CAPITALIZ,True,'',True);
end;

procedure TWCrCto.edPCT_CAPITALIZAExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edPCT_CAPITALIZA,True,'',True);
end;

procedure TWCrCto.edDESC_CAPITALIZAExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edDESC_CAPITALIZA,True,'',True);
end;

procedure TWCrCto.edID_CREDITO_MARCOExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edID_CREDITO_MARCO,True,'',True);
end;

procedure TWCrCto.edDESC_ACRED_GOBExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edDESC_ACRED_GOB,True,'',True);
end;

procedure TWCrCto.edCVE_ANALISTA_RESExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edCVE_ANALISTA_RES,True,'',True);
end;

procedure TWCrCto.edDESC_TIPO_ALTAExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edDESC_TIPO_ALTA,True,'',True);
end;

procedure TWCrCto.chkB_HIT_SICExit(Sender: TObject);
begin
     Objeto.B_HIT_SIC.GetFromControl;
     edF_REP_SIC.SetFocus;
     //InterForma1.ValidaExit(chkB_HIT_SIC,True,'',True);
end;

procedure TWCrCto.edF_REP_SICExit(Sender: TObject);
begin
     Objeto.F_REP_SIC.GetFromControl;
     InterForma1.ValidaExit(edF_REP_SIC,True,'',True);
end;

procedure TWCrCto.edpF_REP_SICExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edpF_REP_SIC,True,'',True);
end;

procedure TWCrCto.edDESC_PROD_BCAExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edDESC_PROD_BCA, True, '', True);
end;

procedure TWCrCto.edDesc_Periodicidad_CATExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edDesc_Periodicidad_CAT, True, '', True);
end;

procedure TWCrCto.edCVE_TIPO_ALTAExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edCVE_TIPO_ALTA, True, '', True);
end;

procedure TWCrCto.chkB_REPORTE_SICExit(Sender: TObject);
begin
     Objeto.B_REPORTE_SIC.GetFromControl;
     chkB_HIT_SIC.SetFocus;
     //InterForma1.ValidaExit(chkB_REPORTE_SIC,True,'',True);
end;



procedure TWCrCto.edCve_Tipo_BajaExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edCVE_TIPO_BAJA, True, '', True);
end;

procedure TWCrCto.edF_BajaExit(Sender: TObject);
begin
   Objeto.F_BAJA.GetFromControl;
   InterForma1.ValidaExit(edF_Baja,True,'',True);
end;

procedure TWCrCto.edpF_BajaExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edpF_Baja,True,'',True);
end;

procedure TWCrCto.edDesc_Tipo_BajaExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edDesc_Tipo_Baja,True,'',True);
end;

procedure TWCrCto.btnCve_Tipo_BajaClick(Sender: TObject);
var
  T1:TInterFindit;
begin
  with Objeto do
  begin
    if Active then
    begin
      T1 := CreaBuscador('ICRBAJALIN.IT', 'S,S');

      //Se requiere establecer el WhereString, porque trae uno integrado por hardcode, aunque el buscador se cree al momento
      T1.WhereString := 'CVE_CON_GPO_CAT = ' + QuotedStr('CAT_TIPO_LIQ_CTO');
      T1.ShowAll := True;
      try
        if T1.Execute then
        begin
           objeto.CVE_TIPO_BAJA.AsString  := T1.DameCampo(0);
           objeto.DESC_TIPO_BAJA.AsString := T1.DameCampo(1);
        end;
      finally
        T1.Free;
      end;

    end else //// if Objeto.Active then
    MessageDlg(''+#13+#10+'Debe de seleccionar un Contrato', mtInformation, [mbOK], 0);

  end; /// With Objeto do
end;

end.

