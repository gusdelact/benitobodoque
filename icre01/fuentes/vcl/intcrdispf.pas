// Sistema         : Clase de CR_AM_BITACORA
// Fecha de Inicio : 17/03/2010
// Función forma   : Clase de CR_AM_BITACORA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntCrDispF;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,     IntParamCre,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntCrCredito, IntLinkit, InterEdit, IntSGCtrl, Grids, Aligrid,
IntGenCre,
IntPers,       //PERSON
IntMPers,       //PERSON
IntCatSPGarF,   //Catálogo de causas de pago
IntCatCPGarF,   //Catálogo de subcausas de pago
IntCatViaRec,   //Catálogo de vías de recuperación
IntMQrTasaActB //Pronóstico de Adeudos
;

Type
 TCrDispF= class;

  TWCrDispF=Class(TForm)
    InterForma1             : TInterForma;
    Panel1: TPanel;
    Estado: TLabel;
    btID_CREDITO: TBitBtn;
    Label27: TLabel;
    edID_CREDITO: TEdit;
    Label3: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    DispInf: TPageControl;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    edID_CRED_FIRA_N: TInterEdit;
    edNOM_DESPACHO: TEdit;
    edCONT_FIRAII: TEdit;
    edID_CONTRATO: TEdit;
    edID_ACREDITADO: TEdit;
    edNOM_ACREDITADO: TEdit;
    edID_PROMOTOR: TEdit;
    edNOM_PROMOTOR: TEdit;
    edNUM_CONTROL_FIRA: TInterEdit;
    btID_DESPACHO: TBitBtn;
    edID_DESPACHO: TEdit;
    ilID_DESPACHO: TInterLinkit;
    edCONT_FIRAI: TInterEdit;
    edCONT_FIRAIII: TInterEdit;
    edCONT_FIRAIV: TInterEdit;
    Label4: TLabel;
    edIMP_CREDITO: TEdit;
    edF_INICIO: TEdit;
    edF_VENCIMIENTO: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    edTASA_BASE: TEdit;
    Label10: TLabel;
    edSOBRETASA: TEdit;
    Label11: TLabel;
    edTASA_CREDITO: TEdit;
    Label12: TLabel;
    edCUENTA_BANCO: TEdit;
    Label13: TLabel;
    edNOM_BANCO_CHQRA: TEdit;
    Label14: TLabel;
    edGAR_LIQ_ORIG: TEdit;
    Label15: TLabel;
    edGAR_LIQ_ORIG_PCT: TEdit;
    Label16: TLabel;
    edGAR_LIQ_ACT: TEdit;
    Label21: TLabel;
    edGAR_LIQ_ACT_PCT: TEdit;
    Label18: TLabel;
    edGAR_FIDUC_ORIG: TInterEdit;
    Label19: TLabel;
    Label20: TLabel;
    edGAR_FIDUC_ACT: TInterEdit;
    Label17: TLabel;
    Label22: TLabel;
    edNOM_FIDEICOM: TInterEdit;
    Label24: TLabel;
    edNUM_FIDEICOM: TInterEdit;
    Label25: TLabel;
    edNOM_FIDUC: TInterEdit;
    edB_GAR_HIPO: TCheckBox;
    Label26: TLabel;
    edIMP_AVALUO: TInterEdit;
    Label28: TLabel;
    edIMP_COB_ORIG: TEdit;
    Label29: TLabel;
    edIMP_COB_ACT: TEdit;
    Label30: TLabel;
    edIMP_FND_CONT_ORIG: TInterEdit;
    Label66: TLabel;
    Label31: TLabel;
    Label67: TLabel;
    edTIPO_POLIZA: TRadioGroup;
    Label33: TLabel;
    edASEGURADORA: TInterEdit;
    edIMP_FND_CONT_ORIG_PC: TEdit;
    TabSheet1: TTabSheet;
    Label23: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    edIMP_CAP: TEdit;
    edIMP_FINADIC: TEdit;
    edIMP_INT: TEdit;
    edIMP_SEG: TEdit;
    edIMP_CUOT_FEGA: TEdit;
    edIMP_OTR_ADEU_FIRA: TEdit;
    edIMP_OTR_ADEU_BIN: TEdit;
    edIMP_CAP_VDO: TEdit;
    edIMP_FINADIC_VDO: TEdit;
    edIMP_INT_VDO: TEdit;
    edDIAS_VENC: TEdit;
    edIMP_CUOT_FEGA_VDO: TEdit;
    III: TTabSheet;
    edB_GAR_VIGENTE: TCheckBox;
    Label65: TLabel;
    edID_CRED_FIRA_GAR: TInterEdit;
    Label45: TLabel;
    edCVE_CPGARF: TInterEdit;
    edDESC_CPGARF: TEdit;
    Label46: TLabel;
    edCVE_SPGARF: TInterEdit;
    edDESC_SPGARF: TEdit;
    Label47: TLabel;
    edCVE_VIAREC: TInterEdit;
    edDESC_VIAREC: TEdit;
    Label51: TLabel;
    edIMP_GAR_FIRA: TInterEdit;
    Label52: TLabel;
    edIMP_REC_GAR_FIRA: TInterEdit;
    Label53: TLabel;
    edF_PAGO_GAR_FIRA: TEdit;
    InterDateTimePicker3: TInterDateTimePicker;
    Label54: TLabel;
    edF_VEN_GAR_FIRA: TEdit;
    InterDateTimePicker4: TInterDateTimePicker;
    Label55: TLabel;
    edF_LIM_ENTRG_INF: TEdit;
    InterDateTimePicker5: TInterDateTimePicker;
    Label56: TLabel;
    edF_SOL_CAST_FIRA: TEdit;
    InterDateTimePicker6: TInterDateTimePicker;
    Label57: TLabel;
    edF_LIM_INI_AC_JUD: TEdit;
    InterDateTimePicker7: TInterDateTimePicker;
    Label58: TLabel;
    edF_CAST_FIRA: TEdit;
    InterDateTimePicker8: TInterDateTimePicker;
    Label59: TLabel;
    edF_PRESEN_DMDA: TEdit;
    InterDateTimePicker9: TInterDateTimePicker;
    Label60: TLabel;
    edF_LIM_PRSTN_P_R: TEdit;
    InterDateTimePicker10: TInterDateTimePicker;
    Label61: TLabel;
    edF_DICT_INCOBR: TEdit;
    InterDateTimePicker11: TInterDateTimePicker;
    Label62: TLabel;
    edF_RESC_GAR_FIRA: TEdit;
    InterDateTimePicker12: TInterDateTimePicker;
    Label63: TLabel;
    edF_PROG_RECUP: TEdit;
    InterDateTimePicker13: TInterDateTimePicker;
    Label64: TLabel;
    edF_ENV_RECUP: TEdit;
    InterDateTimePicker14: TInterDateTimePicker;
    btCVE_CPGARF: TBitBtn;
    btCVE_SPGARF: TBitBtn;
    btCVE_VIAREC: TBitBtn;
    ilID_CREDITO: TInterLinkit;
    ilCVE_CPGARF: TInterLinkit;
    ilCVE_SPGARF: TInterLinkit;
    ilCVE_VIAREC: TInterLinkit;
    edGAR_FIDUC_ORIG_PC: TEdit;
    edIMP_CONT_ACT_PC: TEdit;
    MsgPanel: TPanel;
    edGAR_FIDUC_ACT_PC: TEdit;
    Label48: TLabel;
    edGAR_FEGA_NOM_PCT: TEdit;
    Label49: TLabel;
    edGAR_FONAGA_PCT: TInterEdit;
    Label50: TLabel;
    edESTRATO: TEdit;
    edIMP_FND_CONT_ACT: TEdit;
    Label32: TLabel;
    edIMP_MORA_CAPITAL: TEdit;
    Label68: TLabel;
    edIMP_MORA_FINAN_A: TEdit;
    Label69: TLabel;
    edIMP_MORA_INTERES: TEdit;
    Label70: TLabel;
    edIMP_MORA_CONCEPTOS: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label71: TLabel;
    GroupBox1: TGroupBox;
    Label72: TLabel;
    Label73: TLabel;
    edF_ENVIO_CC: TEdit;
    InterDateTimePicker1: TInterDateTimePicker;
    Label74: TLabel;
    edF_ACUSE_CC: TEdit;
    InterDateTimePicker2: TInterDateTimePicker;
    Label75: TLabel;
    edTotal2: TEdit;
    Label76: TLabel;
    edTotal1: TEdit;
    TabSheet3: TTabSheet;
    edABOG_RESP: TInterEdit;
    Label77: TLabel;
    Label78: TLabel;
    edTEL_ABOG: TInterEdit;
    Label79: TLabel;
    edF_T_ABOG_EX: TEdit;
    InterDateTimePicker15: TInterDateTimePicker;
    Label80: TLabel;
    edF_T_DESP_EX: TEdit;
    InterDateTimePicker16: TInterDateTimePicker;
    Label81: TLabel;
    edF_DEMANDA: TEdit;
    InterDateTimePicker17: TInterDateTimePicker;
    Label82: TLabel;
    edNUM_EXP: TInterEdit;
    Label83: TLabel;
    Label84: TLabel;
    edJUZGADO: TInterEdit;
    Label85: TLabel;
    edTIPO_JUZ: TInterEdit;
    Label86: TLabel;
    Label87: TLabel;
    edIMP_DEMAN: TInterEdit;
    Label88: TLabel;
    edMUN_EXH: TInterEdit;
    Label89: TLabel;
    Label90: TLabel;
    edF_INF_PROC: TEdit;
    InterDateTimePicker18: TInterDateTimePicker;
    Label91: TLabel;
    Label92: TLabel;
    edEST_PROC: TMemo;
    edProducto: TEdit;
    Label93: TLabel;
    Label94: TLabel;
    edEXHORTO: TInterEdit;
    Label95: TLabel;
    edF_EXH: TEdit;
    InterDateTimePicker19: TInterDateTimePicker;
    Label96: TLabel;
    edENV_EXH: TInterEdit;
    edOBSERVACIONES: TMemo;
    Label97: TLabel;
    edCRED_DEM: TRadioGroup;
    Label98: TLabel;
    Label99: TLabel;
    edTEL_DESP: TInterEdit;
    Label100: TLabel;
    edDESP_RESP: TInterEdit;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    edF_AUTO_AD: TEdit;
    InterDateTimePicker20: TInterDateTimePicker;
    Label104: TLabel;
    edEST_EXH: TInterEdit;
    Label105: TLabel;
    Label106: TLabel;
    edBIEN_EMB: TMemo;
    edREGION: TComboBox;
    edTIPO_JUICIO: TComboBox;
    edMONEDA: TComboBox;
    edTIPO_GAR: TInterEdit;
    Label107: TLabel;
    edSTATUS: TInterEdit;
    edIMP_MNTO_REC: TInterEdit;
    Label108: TLabel;
    Label109: TLabel;
    edRES_DICT: TInterEdit;
    edPCT_COB_EFEC: TInterEdit;
    edPCT_COB_NOM: TInterEdit;
    Label110: TLabel;
    Label111: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure edCONT_FIRAIExit(Sender: TObject);
    procedure edCONT_FIRAIIIExit(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure edNUM_CONTROL_FIRAExit(Sender: TObject);
    procedure edID_CRED_FIRA_NExit(Sender: TObject);
    procedure edID_DESPACHOExit(Sender: TObject);
    procedure btID_DESPACHOClick(Sender: TObject);
    procedure ilID_DESPACHOEjecuta(Sender: TObject);
    procedure edIMP_AVALUOExit(Sender: TObject);
    procedure edIMP_FND_CONT_ORIGExit(Sender: TObject);
    procedure btCVE_CPGARFClick(Sender: TObject);
    procedure btCVE_SPGARFClick(Sender: TObject);
    procedure btCVE_VIARECClick(Sender: TObject);
    procedure ilCVE_CPGARFEjecuta(Sender: TObject);
    procedure ilCVE_SPGARFEjecuta(Sender: TObject);
    procedure ilCVE_VIARECEjecuta(Sender: TObject);
    procedure edTIPO_POLIZAExit(Sender: TObject);
    procedure edASEGURADORAExit(Sender: TObject);
    procedure edID_CRED_FIRA_GARExit(Sender: TObject);
    procedure edCVE_CPGARFExit(Sender: TObject);
    procedure edCVE_SPGARFExit(Sender: TObject);
    procedure edCVE_VIARECExit(Sender: TObject);
    procedure edGAR_FONAGA_PCTExit(Sender: TObject);
    procedure edIMP_GAR_FIRAExit(Sender: TObject);
    procedure edIMP_REC_GAR_FIRAExit(Sender: TObject);
    procedure edF_PAGO_GAR_FIRAExit(Sender: TObject);
    procedure edF_LIM_ENTRG_INFExit(Sender: TObject);
    procedure edF_LIM_INI_AC_JUDExit(Sender: TObject);
    procedure edF_PRESEN_DMDAExit(Sender: TObject);
    procedure edF_DICT_INCOBRExit(Sender: TObject);
    procedure edF_RESC_GAR_FIRAExit(Sender: TObject);
    procedure edF_PROG_RECUPExit(Sender: TObject);
    procedure edF_ENV_RECUPExit(Sender: TObject);
    procedure edF_VEN_GAR_FIRAExit(Sender: TObject);
    procedure edF_SOL_CAST_FIRAExit(Sender: TObject);
    procedure edF_CAST_FIRAExit(Sender: TObject);
    procedure edF_LIM_PRSTN_P_RExit(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edCVE_SPGARFChange(Sender: TObject);
    procedure edIMP_AVALUOChange(Sender: TObject);
    procedure edIMP_FND_CONT_ORIGChange(Sender: TObject);
    procedure edIMP_FND_CONT_ACTExit(Sender: TObject);
    procedure edIMP_CONT_ACT_PCExit(Sender: TObject);
    procedure edNUM_CONTROL_FIRAChange(Sender: TObject);
    procedure edB_GAR_VIGENTEClick(Sender: TObject);
    procedure edGAR_FIDUC_ORIGExit(Sender: TObject);
    procedure edGAR_FIDUC_ACTExit(Sender: TObject);
    procedure edNOM_FIDEICOMExit(Sender: TObject);
    procedure edNUM_FIDEICOMExit(Sender: TObject);
    procedure edNOM_FIDUCExit(Sender: TObject);
    procedure edB_GAR_HIPOExit(Sender: TObject);
    procedure edGAR_FIDUC_ORIGChange(Sender: TObject);
    procedure edIMP_FND_CONT_ACTChange(Sender: TObject);
    procedure edGAR_FIDUC_ACTChange(Sender: TObject);
    procedure edB_GAR_VIGENTEExit(Sender: TObject);
    procedure edCVE_VIARECChange(Sender: TObject);
    procedure edCVE_CPGARFChange(Sender: TObject);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure edCONT_FIRAIVExit(Sender: TObject);
    procedure edF_ENVIO_CCExit(Sender: TObject);
    procedure edF_ACUSE_CCExit(Sender: TObject);
    procedure edABOG_RESPExit(Sender: TObject);
    procedure edTEL_ABOGExit(Sender: TObject);
    procedure edF_T_ABOG_EXExit(Sender: TObject);
    procedure edF_T_DESP_EXExit(Sender: TObject);
    procedure edF_DEMANDAExit(Sender: TObject);
    procedure edTIPO_JUICIOExit(Sender: TObject);
    procedure edNUM_EXPExit(Sender: TObject);
    procedure edJUZGADOExit(Sender: TObject);
    procedure edTIPO_JUZExit(Sender: TObject);
    procedure edTIPO_GARExit(Sender: TObject);
    procedure edIMP_DEMANExit(Sender: TObject);
    procedure edMUN_EXHExit(Sender: TObject);
    procedure edMONEDAExit(Sender: TObject);
    procedure edF_INF_PROCExit(Sender: TObject);
    procedure edEST_PROCExit(Sender: TObject);
    procedure edOBSERVACIONESExit(Sender: TObject);
    procedure edEXHORTOExit(Sender: TObject);
    procedure edF_EXHExit(Sender: TObject);
    procedure edENV_EXHExit(Sender: TObject);
    procedure edCRED_DEMExit(Sender: TObject);
    procedure edREGIONExit(Sender: TObject);
    procedure edBIEN_EMBExit(Sender: TObject);
    procedure edTEL_DESPExit(Sender: TObject);
    procedure edDESP_RESPExit(Sender: TObject);
    procedure edF_AUTO_ADExit(Sender: TObject);
    procedure edEST_EXHExit(Sender: TObject);
    procedure edSTATUSExit(Sender: TObject);
    procedure edIMP_MNTO_RECExit(Sender: TObject);
    procedure edRES_DICTExit(Sender: TObject);
    procedure edPCT_COB_NOMExit(Sender: TObject);
    procedure edPCT_COB_EFECExit(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrDispF;
    saldototal : Double;
    procedure MuestraDatosCredito;
    procedure BorraCampos;
    procedure GeneraNumControlFIRA;
    procedure HabiltaCtrls(habilita:Boolean);
    procedure HabiltaCtrl(ctrl : TWinControl; habilita: Boolean; hc : Integer);
end;
 TCrDispF= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CREDITO               : TInterCampo;
        NUM_CONTROL_FIRA         : TInterCampo;
        ID_CRED_FIRA_N           : TInterCampo;
        ID_DESPACHO              : TInterCampo;

        //Pestaña I
        GAR_FIDUC_ORIG           : TInterCampo;
        GAR_FIDUC_ACT		         : TInterCampo;
        NOM_FIDEICOM		         : TInterCampo;
        NUM_FIDEICOM		         : TInterCampo;
        NOM_FIDUC		             : TInterCampo;
        B_GAR_HIPO		           : TInterCampo;
        IMP_AVALUO		           : TInterCampo;
        IMP_FND_CONT_ORIG		     : TInterCampo;
        IMP_FND_CONT_ACT		     : TInterCampo;
        TIPO_POLIZA		           : TInterCampo;
        ASEGURADORA		           : TInterCampo;

        STATUS                   :TInterCampo;
        ID_CRED_FIRA_GAR         :TInterCampo;
        CVE_CPGARF				       :TInterCampo;
        CVE_SPGARF				       :TInterCampo;
        CVE_VIAREC				       :TInterCampo;
        GAR_FONAGA_PCT		       :TInterCampo;
        IMP_GAR_FIRA			       :TInterCampo;
        IMP_MNTO_REC             :TInterCampo;
        IMP_REC_GAR_FIRA	       :TInterCampo;
        F_PAGO_GAR_FIRA		       :TInterCampo;
        F_VEN_GAR_FIRA		       :TInterCampo;
        F_LIM_ENTRG_INF		       :TInterCampo;
        F_SOL_CAST_FIRA		       :TInterCampo;
        F_LIM_INI_AC_JUD	       :TInterCampo;
        F_CAST_FIRA				       :TInterCampo;
        F_PRESEN_DMDA			       :TInterCampo;
        F_LIM_PRSTN_P_R		       :TInterCampo;
        F_ACUSE_CC               :TInterCampo;
        F_ENVIO_CC               :TInterCampo;
        RES_DICT                 :TInterCampo;
        PCT_COB_NOM              :TInterCampo;
        PCT_COB_EFEC             :TInterCampo;
        F_DICT_INCOBR			       :TInterCampo;
        F_RESC_GAR_FIRA		       :TInterCampo;
        F_PROG_RECUP			       :TInterCampo;
        F_ENV_RECUP              :TInterCampo;
        B_GAR_VIGENTE            :TInterCampo;
        //Pestaña IV Demanda
        CRED_DEM			:TInterCampo;
        ABOG_RESP			:TInterCampo;
        TEL_ABOG			:TInterCampo;
        DESP_RESP			:TInterCampo;
        REGION			:TInterCampo;
        TEL_DESP			:TInterCampo;
        F_T_ABOG_EX			:TInterCampo;
        F_T_DESP_EX			:TInterCampo;
        F_DEMANDA			:TInterCampo;
        F_AUTO_AD			:TInterCampo;
        F_EXH			:TInterCampo;
        ENV_EXH			:TInterCampo;
        EXHORTO			:TInterCampo;
        MUN_EXH			:TInterCampo;
        EST_EXH			:TInterCampo;
        TIPO_JUICIO			:TInterCampo;
        NUM_EXP			:TInterCampo;
        JUZGADO			:TInterCampo;
        TIPO_JUZ			:TInterCampo;
        TIPO_GAR			:TInterCampo;
        IMP_DEMAN			:TInterCampo;
        MONEDA			:TInterCampo;
        BIEN_EMB			:TInterCampo;
        F_INF_PROC			:TInterCampo;
        EST_PROC			:TInterCampo;
        OBSERVACIONES			:TInterCampo;

        ParamCre                 : TParamCre;
        Credito                  : TCrCredito;//Disposición
        PromotorAdm              : TPersona;  //Promotor Administrativo
        PersonaDesp              : TPersona;   //Persona Moral para despacho
        CPGarF                   : TCatCPGarF;
        SPGarF                   : TCatSPGarF;
        ViaRec                   : TCatViaRec;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;


implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrDispF.Create( AOwner : TComponent );
begin Inherited;
  ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
  ID_CREDITO.Caption:='Número de Credito';

  ID_DESPACHO  := CreaCampo('ID_DESPACHO', ftFloat, tsNinguno, tsNinguno, True);
  ID_DESPACHO.Caption := 'Número de Despacho';

  //Pestaña I
  NUM_CONTROL_FIRA :=CreaCampo('NUM_CONTROL_FIRA',ftString,tsNinguno,tsNinguno,True);
  NUM_CONTROL_FIRA.Caption:='Número de control de FIRA';

  ID_CRED_FIRA_N :=CreaCampo('ID_CRED_FIRA_N',ftString,tsNinguno,tsNinguno,True);
  ID_CRED_FIRA_N.Caption:='ID crédito FIRA normal';

  GAR_FIDUC_ORIG  := CreaCampo('GAR_FIDUC_ORIG', ftFloat, tsNinguno, tsNinguno, True);
  GAR_FIDUC_ORIG.Caption := 'Garantía Fiduciaria Original';


  GAR_FIDUC_ACT  := CreaCampo('GAR_FIDUC_ACT', ftFloat, tsNinguno, tsNinguno, True);
  GAR_FIDUC_ACT.Caption := 'Garantía fiduciaria actual';

  NOM_FIDEICOM  := CreaCampo('NOM_FIDEICOM', ftString, tsNinguno, tsNinguno, True);
  NOM_FIDEICOM.Caption := 'Fideicomiso';

  NUM_FIDEICOM  := CreaCampo('NUM_FIDEICOM', ftString, tsNinguno, tsNinguno, True);
  NUM_FIDEICOM.Caption := 'Número de Fideicomiso';

  NOM_FIDUC  := CreaCampo('NOM_FIDUC', ftString, tsNinguno, tsNinguno, True);
  NOM_FIDUC.Caption := 'Nombre del fiduciario';

  B_GAR_HIPO  := CreaCampo('B_GAR_HIPO', ftString, tsNinguno, tsNinguno, True);
  B_GAR_HIPO.Caption := 'Garantía hipotecaria';
  with B_GAR_HIPO do
  begin
    Size := 2;
    UseCombo := True;
    ComboLista.Add('0');    ComboDatos.Add('V');
    ComboLista.Add('1');    ComboDatos.Add('F');
  end;

  IMP_AVALUO  := CreaCampo('IMP_AVALUO', ftFloat, tsNinguno, tsNinguno, True);
  IMP_AVALUO.Caption := 'Importe de avalúo';

  IMP_FND_CONT_ORIG  := CreaCampo('IMP_FND_CONT_ORIG', ftFloat, tsNinguno, tsNinguno, True);
  IMP_FND_CONT_ORIG.Caption := 'Fondo de contingencia original';

  IMP_FND_CONT_ACT  := CreaCampo('IMP_FND_CONT_ACT', ftFloat, tsNinguno, tsNinguno, False);
  IMP_FND_CONT_ACT.Caption := 'Fondo de contingencia original';


  TIPO_POLIZA  := CreaCampo('TIPO_POLIZA', ftString, tsNinguno, tsNinguno, True);
  TIPO_POLIZA.Caption := 'Tipo de Poliza';
  with TIPO_POLIZA do
  begin
    Size := 2;
    UseCombo := True;
    ComboLista.Add('0');    ComboDatos.Add('AN');
    ComboLista.Add('1');    ComboDatos.Add('MU');
  end;

  ASEGURADORA  := CreaCampo('ASEGURADORA', ftString, tsNinguno, tsNinguno, True);
  ASEGURADORA.Caption := 'Aseguradora';

  STATUS  := CreaCampo('STATUS', ftString, tsNinguno, tsNinguno, True);

  ID_CRED_FIRA_GAR  := CreaCampo('ID_CRED_FIRA_GAR', ftFloat, tsNinguno, tsNinguno, True);
  ID_CRED_FIRA_GAR.Caption := 'ID crédito garantía FIRA';

  CVE_CPGARF  := CreaCampo('CVE_CPGARF', ftString, tsNinguno, tsNinguno, True);
  CVE_CPGARF.Caption := 'Causa de pago de garantía';

  CVE_SPGARF  := CreaCampo('CVE_SPGARF', ftString, tsNinguno, tsNinguno, True);
  CVE_SPGARF.Caption := 'Subcausa de pago de garantía';

  CVE_VIAREC  := CreaCampo('CVE_VIAREC', ftString, tsNinguno, tsNinguno, True);
  CVE_VIAREC.Caption := 'Vía de recuperación';

  GAR_FONAGA_PCT  := CreaCampo('GAR_FONAGA_PCT', ftFloat, tsNinguno, tsNinguno, True);
  GAR_FONAGA_PCT.Caption := 'Garantía FONAGA %';

  IMP_GAR_FIRA  := CreaCampo('IMP_GAR_FIRA', ftFloat, tsNinguno, tsNinguno, True);
  IMP_GAR_FIRA.Caption := 'Importe de garantía';

  IMP_MNTO_REC  := CreaCampo('IMP_MNTO_REC', ftFloat, tsNinguno, tsNinguno, True);

  IMP_REC_GAR_FIRA  := CreaCampo('IMP_REC_GAR_FIRA', ftFloat, tsNinguno, tsNinguno, True);
  IMP_REC_GAR_FIRA.Caption := 'Saldo de garantía FIRA por recuperar';

  F_PAGO_GAR_FIRA  := CreaCampo('F_PAGO_GAR_FIRA', ftDate, tsNinguno, tsNinguno, True);
  F_PAGO_GAR_FIRA.Caption := 'Fecha de pago de garantía';

  F_VEN_GAR_FIRA  := CreaCampo('F_VEN_GAR_FIRA', ftDate, tsNinguno, tsNinguno, True);
  F_VEN_GAR_FIRA.Caption := 'Fecha de vencimiento de garantía';

  F_LIM_ENTRG_INF  := CreaCampo('F_LIM_ENTRG_INF', ftDate, tsNinguno, tsNinguno, True);
  F_LIM_ENTRG_INF.Caption := 'Fecha límite para presentar informe de seguimiento';

  F_SOL_CAST_FIRA  := CreaCampo('F_SOL_CAST_FIRA', ftDate, tsNinguno, tsNinguno, True);
  F_SOL_CAST_FIRA.Caption := 'Fecha de solicitud de castigo a FIRA';

  F_LIM_INI_AC_JUD  := CreaCampo('F_LIM_INI_AC_JUD', ftDate, tsNinguno, tsNinguno, True);
  F_LIM_INI_AC_JUD.Caption := 'Fecha límite para iniciar acciones judiciales';

  F_CAST_FIRA  := CreaCampo('F_CAST_FIRA', ftDate, tsNinguno, tsNinguno, True);
  F_CAST_FIRA.Caption := 'Fecha de castigo';

  F_PRESEN_DMDA  := CreaCampo('F_PRESEN_DMDA', ftDate, tsNinguno, tsNinguno, True);
  F_PRESEN_DMDA.Caption := 'Fecha de presentación de demanda';

  F_LIM_PRSTN_P_R  := CreaCampo('F_LIM_PRSTN_P_R', ftDate, tsNinguno, tsNinguno, True);
  F_LIM_PRSTN_P_R.Caption := 'Fecha límite para presentar reestructura';

  F_ENVIO_CC  := CreaCampo('F_ENVIO_CC', ftDate, tsNinguno, tsNinguno, True);
  F_ACUSE_CC  := CreaCampo('F_ACUSE_CC', ftDate, tsNinguno, tsNinguno, True);

  RES_DICT  := CreaCampo('RES_DICT', ftString, tsNinguno, tsNinguno, True);
  PCT_COB_NOM  := CreaCampo('PCT_COB_NOM', ftFloat, tsNinguno, tsNinguno, True);
  PCT_COB_EFEC  := CreaCampo('PCT_COB_EFEC', ftFloat, tsNinguno, tsNinguno, True);

  F_DICT_INCOBR  := CreaCampo('F_DICT_INCOBR', ftDate, tsNinguno, tsNinguno, True);
  F_DICT_INCOBR.Caption := 'Fecha de dictamen de incobrabilidad';

  F_RESC_GAR_FIRA  := CreaCampo('F_RESC_GAR_FIRA', ftDate, tsNinguno, tsNinguno, True);
  F_RESC_GAR_FIRA.Caption := 'Fecha de rescate';

  F_PROG_RECUP  := CreaCampo('F_PROG_RECUP', ftDate, tsNinguno, tsNinguno, True);
  F_PROG_RECUP.Caption := 'Fecha programada de recuperación';

  F_ENV_RECUP  := CreaCampo('F_ENV_RECUP', ftDate, tsNinguno, tsNinguno, True);
  F_ENV_RECUP.Caption := 'Fecha de envío a recuperación de cartera';

  B_GAR_VIGENTE  := CreaCampo('B_GAR_VIGENTE', ftString, tsNinguno, tsNinguno, True);
  B_GAR_VIGENTE.Caption := 'Garantía Vigente';
  //Pestaña IV demanda
  CRED_DEM := CreaCampo('CRED_DEM', ftString, tsNinguno, tsNinguno, True);
  with CRED_DEM do
  begin
    Size := 2;
    UseCombo := True;
    ComboLista.Add('0');    ComboDatos.Add('SI');
    ComboLista.Add('1');    ComboDatos.Add('NO');
  end;
  ABOG_RESP := CreaCampo('ABOG_RESP', ftString, tsNinguno, tsNinguno, True);
  TEL_ABOG := CreaCampo('TEL_ABOG', ftString, tsNinguno, tsNinguno, True);
  DESP_RESP := CreaCampo('DESP_RESP', ftString, tsNinguno, tsNinguno, True);
  REGION := CreaCampo('REGION', ftString, tsNinguno, tsNinguno, True);
  TEL_DESP := CreaCampo('TEL_DESP', ftString, tsNinguno, tsNinguno, True);
  F_T_ABOG_EX := CreaCampo('F_T_ABOG_EX', ftDate, tsNinguno, tsNinguno, True);
  F_T_DESP_EX := CreaCampo('F_T_DESP_EX', ftDate, tsNinguno, tsNinguno, True);
  F_DEMANDA := CreaCampo('F_DEMANDA', ftDate, tsNinguno, tsNinguno, True);
  F_AUTO_AD := CreaCampo('F_AUTO_AD', ftDate, tsNinguno, tsNinguno, True);
  F_EXH := CreaCampo('F_EXH', ftDate, tsNinguno, tsNinguno, True);
  ENV_EXH := CreaCampo('ENV_EXH', ftString, tsNinguno, tsNinguno, True);
  EXHORTO := CreaCampo('EXHORTO', ftString, tsNinguno, tsNinguno, True);
  MUN_EXH := CreaCampo('MUN_EXH', ftString, tsNinguno, tsNinguno, True);
  EST_EXH := CreaCampo('EST_EXH', ftString, tsNinguno, tsNinguno, True);
  TIPO_JUICIO := CreaCampo('TIPO_JUICIO', ftString, tsNinguno, tsNinguno, True);
  NUM_EXP := CreaCampo('NUM_EXP', ftString, tsNinguno, tsNinguno, True);
  JUZGADO := CreaCampo('JUZGADO', ftString, tsNinguno, tsNinguno, True);
  TIPO_JUZ := CreaCampo('TIPO_JUZ', ftString, tsNinguno, tsNinguno, True);
  TIPO_GAR := CreaCampo('TIPO_GAR', ftString, tsNinguno, tsNinguno, True);
  IMP_DEMAN := CreaCampo('IMP_DEMAN', ftFloat, tsNinguno, tsNinguno, True);
  MONEDA := CreaCampo('MONEDA', ftString, tsNinguno, tsNinguno, True);
  BIEN_EMB := CreaCampo('BIEN_EMB', ftString, tsNinguno, tsNinguno, True);
  F_INF_PROC := CreaCampo('F_INF_PROC', ftDate, tsNinguno, tsNinguno, True);
  EST_PROC := CreaCampo('EST_PROC', ftString, tsNinguno, tsNinguno, True);
  OBSERVACIONES := CreaCampo('OBSERVACIONES', ftString, tsNinguno, tsNinguno, True);


  FKeyFields.Add('ID_CREDITO');

  { Buscadores
  --> }
  Credito := TCrCredito.Create(Self);
  Credito.MasterSource:=Self;
  Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

  PersonaDesp := TPersona.Create(Self);
//  PersonaDesp.FilterBy := fbTMPersonaMoral;
  PersonaDesp.MasterSource := Self;
  PersonaDesp.Id_Persona.MasterField := 'ID_DESPACHO';

  PromotorAdm := TPersona.Create(Self);
  PromotorAdm.MasterSource := Self;

  CPGarF := TCatCPGarF.Create(Self);
  CPGarF.MasterSource := Self;
  CPGarF.CVE_CPGARF.MasterField := 'CVE_CPGARF';

  SPGarF := TCatSPGarF.Create(Self);
  SPGarF.MasterSource := Self;
  SPGarF.SUBCVE_SPGARF.MasterField := 'CVE_SPGARF';

  ViaRec := TCatViaRec.Create(Self);
  ViaRec.MasterSource := Self;
  ViaRec.CVE_VIAREC.MasterField := 'CVE_VIAREC';

  TableName := 'ADMIPROD.CR_AM_DISPF';
  UseQuery := True;
  HelpFile := 'IntCrDispF.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrDispF.Destroy;
begin
   if Credito <> nil then
      Credito.Free;

   if PromotorAdm <> nil then
      PromotorAdm.Free;

   if PersonaDesp <> nil then
      PersonaDesp.Free;

   if CPGarF <> nil then
      CPGarF.Free;

   if SPGarF <> nil then
      SPGarF.Free;

   if ViaRec <> nil then
      ViaRec.Free;

   inherited;
end;


function TCrDispF.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrDispF;
begin
   W:=TWCrDispF.Create(Self);
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


Function TCrDispF.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrAmDispF.it','F');
      Try if Active then begin T.Param(0,ID_CREDITO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TCrDispF.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CR_AM_BITACORA********************)
(*                                                                              *)
(*  FORMA DE CR_AM_BITACORA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_AM_BITACORA********************)

procedure TWCrDispF.FormShow(Sender: TObject);
begin
  //Datos del panel de la parte inferior de la forma
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

  with Objeto do
  begin
    Credito.ID_CREDITO.Control := edID_CREDITO;
    Credito.ContratoCre.ID_CONTRATO.Control := edID_CONTRATO;
    Credito.ContratoCre.Contrato.ID_Titular.Control := edID_ACREDITADO;
    Credito.ContratoCre.Contrato.TITNombre.Control := edNOM_ACREDITADO;

    PromotorAdm.ID_Persona.Control := edID_PROMOTOR;
    PromotorAdm.Nombre.Control := edNOM_PROMOTOR;

    PersonaDesp.ID_Persona.Control := edID_DESPACHO;
    PersonaDesp.Nombre.Control := edNOM_DESPACHO;

    //Pestaña I
    NUM_CONTROL_FIRA.Control := edNUM_CONTROL_FIRA;
    ID_CRED_FIRA_N.Control := edID_CRED_FIRA_N;

    Credito.IMP_CREDITO.Control := edIMP_CREDITO;
    Credito.F_INICIO.Control := edF_INICIO;
    Credito.F_VENCIMIENTO.Control := edF_VENCIMIENTO;
    Credito.SOBRETASA.Control := edSOBRETASA;
    Credito.TASA_CREDITO.Control := edTASA_CREDITO;

    GAR_FIDUC_ORIG.Control := edGAR_FIDUC_ORIG;
    GAR_FIDUC_ACT.Control := edGAR_FIDUC_ACT;
    NOM_FIDEICOM.Control := edNOM_FIDEICOM;
    NUM_FIDEICOM.Control := edNUM_FIDEICOM;
    NOM_FIDUC.Control := edNOM_FIDUC;
    B_GAR_HIPO.Control := edB_GAR_HIPO;
    IMP_AVALUO.Control := edIMP_AVALUO;
    IMP_FND_CONT_ORIG.Control := edIMP_FND_CONT_ORIG;
//    IMP_FND_CONT_ACT.Control := edIMP_FND_CONT_ACT;
    TIPO_POLIZA.Control := edTIPO_POLIZA;
    ASEGURADORA.Control := edASEGURADORA;

    //Pestaña III
    STATUS.Control := edSTATUS;
    ID_CRED_FIRA_GAR.Control := edID_CRED_FIRA_GAR;

    CVE_CPGARF.Control := edCVE_CPGARF;
    CPGARF.DESC_CPGARF.Control := edDESC_CPGARF;

    CVE_SPGARF.Control := edCVE_SPGARF;
    SPGARF.DESC_SPGARF.Control := edDESC_SPGARF;

    CVE_VIAREC.Control := edCVE_VIAREC;
    VIAREC.DESC_VIAREC.Control := edDESC_VIAREC;

    GAR_FONAGA_PCT.Control := edGAR_FONAGA_PCT;
    IMP_GAR_FIRA.Control := edIMP_GAR_FIRA;
    IMP_MNTO_REC.Control := edIMP_MNTO_REC;
    IMP_REC_GAR_FIRA.Control := edIMP_REC_GAR_FIRA;
    F_PAGO_GAR_FIRA.Control := edF_PAGO_GAR_FIRA;
    F_VEN_GAR_FIRA.Control := edF_VEN_GAR_FIRA;
    F_LIM_ENTRG_INF.Control := edF_LIM_ENTRG_INF;
    F_SOL_CAST_FIRA.Control := edF_SOL_CAST_FIRA;
    F_LIM_INI_AC_JUD.Control := edF_LIM_INI_AC_JUD;
    F_CAST_FIRA.Control := edF_CAST_FIRA;
    F_PRESEN_DMDA.Control := edF_PRESEN_DMDA;
    F_LIM_PRSTN_P_R.Control := edF_LIM_PRSTN_P_R;
    F_ENVIO_CC.Control := edF_ENVIO_CC;
    F_ACUSE_CC.Control := edF_ACUSE_CC;
    RES_DICT.Control := edRES_DICT;
    PCT_COB_NOM.Control := edPCT_COB_NOM;
    PCT_COB_EFEC.Control := edPCT_COB_EFEC;
    F_DICT_INCOBR.Control := edF_DICT_INCOBR;
    F_RESC_GAR_FIRA.Control := edF_RESC_GAR_FIRA;
    F_PROG_RECUP.Control := edF_PROG_RECUP;
    F_ENV_RECUP.Control := edF_ENV_RECUP;
    B_GAR_VIGENTE.Control := edB_GAR_VIGENTE;

    //Pestaña IV
    CRED_DEM.Control := edCRED_DEM;
    ABOG_RESP.Control := edABOG_RESP;
    TEL_ABOG.Control := edTEL_ABOG;
    DESP_RESP.Control := edDESP_RESP;
    REGION.Control := edREGION;
    TEL_DESP.Control := edTEL_DESP;
    F_T_ABOG_EX.Control := edF_T_ABOG_EX;
    F_T_DESP_EX.Control := edF_T_DESP_EX;
    F_DEMANDA.Control := edF_DEMANDA;
    F_AUTO_AD.Control := edF_AUTO_AD;
    F_EXH.Control := edF_EXH;
    ENV_EXH.Control := edENV_EXH;
    EXHORTO.Control := edEXHORTO;
    MUN_EXH.Control := edMUN_EXH;
    EST_EXH.Control := edEST_EXH;
    TIPO_JUICIO.Control := edTIPO_JUICIO;
    NUM_EXP.Control := edNUM_EXP;
    JUZGADO.Control := edJUZGADO;
    TIPO_JUZ.Control := edTIPO_JUZ;
    TIPO_GAR.Control := edTIPO_GAR;
    IMP_DEMAN.Control := edIMP_DEMAN;
    MONEDA.Control := edMONEDA;
    BIEN_EMB.Control := edBIEN_EMB;
    F_INF_PROC.Control := edF_INF_PROC;
    EST_PROC.Control := edEST_PROC;
    OBSERVACIONES.Control := edOBSERVACIONES;
    Credito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edProducto;
  end;

  Interforma1.MsgPanel := MsgPanel;

end;

procedure TWCrDispF.FormDestroy(Sender: TObject);
begin
  with Objeto do
  begin
    Credito.ID_CREDITO.Control := nil;
    Credito.ContratoCre.ID_CONTRATO.Control := nil;
    Credito.ContratoCre.Contrato.ID_Titular.Control := nil;
    Credito.ContratoCre.Contrato.TITNombre.Control := nil;

    PromotorAdm.ID_Persona.Control := nil;
    PromotorAdm.Nombre.Control := nil;

    PersonaDesp.ID_Persona.Control := nil;
    Personadesp.Nombre.Control := nil;

    //Pestaña I
    NUM_CONTROL_FIRA.Control := nil;
    ID_CRED_FIRA_N.Control := nil;
    
    Credito.IMP_CREDITO.Control := nil;
    Credito.F_INICIO.Control := nil;
    Credito.F_VENCIMIENTO.Control := nil;
    Credito.SOBRETASA.Control := nil;
    Credito.TASA_CREDITO.Control := nil;

    GAR_FIDUC_ORIG.Control := nil;
    GAR_FIDUC_ACT.Control := nil;
    NOM_FIDEICOM.Control := nil;
    NUM_FIDEICOM.Control := nil;
    NOM_FIDUC.Control := nil;
    B_GAR_HIPO.Control := nil;
    IMP_AVALUO.Control := nil;
    IMP_FND_CONT_ORIG.Control := nil;
//    IMP_FND_CONT_ACT.Control := nil;
    TIPO_POLIZA.Control := nil;
    ASEGURADORA.Control := nil;

    //Pestaña III
    STATUS.Control := nil;
    ID_CRED_FIRA_GAR.Control := nil;

    CVE_CPGARF.Control := nil;
    CPGARF.DESC_CPGARF.Control := nil;

    CVE_SPGARF.Control := nil;
    SPGARF.DESC_SPGARF.Control := nil;

    CVE_VIAREC.Control := nil;
    VIAREC.DESC_VIAREC.Control := nil;

    GAR_FONAGA_PCT.Control := nil;
    IMP_GAR_FIRA.Control := nil;
    IMP_MNTO_REC.Control := nil;
    IMP_REC_GAR_FIRA.Control := nil;
    F_PAGO_GAR_FIRA.Control := nil;
    F_VEN_GAR_FIRA.Control := nil;
    F_LIM_ENTRG_INF.Control := nil;
    F_SOL_CAST_FIRA.Control := nil;
    F_LIM_INI_AC_JUD.Control := nil;
    F_CAST_FIRA.Control := nil;
    F_PRESEN_DMDA.Control := nil;
    F_LIM_PRSTN_P_R.Control := nil;
    F_ENVIO_CC.Control := nil;
    F_ACUSE_CC.Control := nil;
    RES_DICT.Control := nil;
    PCT_COB_NOM.Control := nil;
    PCT_COB_EFEC.Control := nil;
    F_DICT_INCOBR.Control := nil;
    F_RESC_GAR_FIRA.Control := nil;
    F_PROG_RECUP.Control := nil;
    F_ENV_RECUP.Control := nil;
    B_GAR_VIGENTE.Control := nil;

    //Pestaña IV
    CRED_DEM.Control := nil;
    ABOG_RESP.Control := nil;
    TEL_ABOG.Control := nil;
    DESP_RESP.Control := nil;
    REGION.Control := nil;
    TEL_DESP.Control := nil;
    F_T_ABOG_EX.Control := nil;
    F_T_DESP_EX.Control := nil;
    F_DEMANDA.Control := nil;
    F_AUTO_AD.Control := nil;
    F_EXH.Control := nil;
    ENV_EXH.Control := nil;
    EXHORTO.Control := nil;
    MUN_EXH.Control := nil;
    EST_EXH.Control := nil;
    TIPO_JUICIO.Control := nil;
    NUM_EXP.Control := nil;
    JUZGADO.Control := nil;
    TIPO_JUZ.Control := nil;
    TIPO_GAR.Control := nil;
    IMP_DEMAN.Control := nil;
    MONEDA.Control := nil;
    BIEN_EMB.Control := nil;
    F_INF_PROC.Control := nil;
    EST_PROC.Control := nil;
    OBSERVACIONES.Control := nil;
    Credito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := nil;

  end;

end;

procedure TWCrDispF.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrDispF.InterForma1DespuesNuevo(Sender: TObject);
begin
  HabiltaCtrls(false);

  edTIPO_POLIZA.ItemIndex := 0;
  Objeto.TIPO_POLIZA.GetFromControl;

  //edCONT_FIRAIV.Text := FormatDateTime('yy', Date);
  BorraCampos;

  edREGION.ItemIndex := 0;
  edTIPO_JUICIO.ItemIndex := 0;
  edMONEDA.ItemIndex := 0;
  
  edID_CREDITO.SetFocus;
end;

procedure TWCrDispF.InterForma1DespuesModificar(Sender: TObject);
begin
  edB_GAR_VIGENTEClick(nil);
end;

//procedure TWCrDispF.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;

procedure TWCrDispF.MuestraDatosCredito;
var
  vlSQL : String;
  vlQry : TQuery;
  sText : String;
  VLIntProyFinan   : Double;
  VLInteresFinan   : Double;
  VLBFechaProg : Boolean;
  BNivela      : String;
  fecha        : String;
  RProAdeu     : TQrTasaActB;
  StpValorTasa : TStoredProc;
  vlwAnio, vlwMes, vlwDia : Word;
  vlTIPO_CAMBIO_UDIS : Real;
  vlIMPORTE : Real;

begin
  if trim (edID_CREDITO.Text) = '' then
    exit;

  Objeto.PromotorAdm.FindKey([Objeto.Credito.ID_PROM_ADM.AsString]);



  { --> SEGURO }
  vlSQL :=
      ' select pol.id_credito, pol.unidad, sum (prima) as prima '+coCRLF +
      ' from   cr_am_segupol pol, '+coCRLF +
      '        (select   id_credito,num_poliza, '+coCRLF +
      '                  max (secuencia) as secuencia '+coCRLF +
      '         from     cr_am_segupol '+coCRLF +
      '         group by id_credito,num_poliza) polis '+coCRLF +
      ' where  f_cobro is null '+coCRLF +
      ' and		 pol.secuencia = polis.secuencia '+coCRLF +
      ' and		 pol.id_credito = polis.id_credito '+coCRLF +
      ' and		 pol.id_credito = ' + edID_CREDITO.Text+
      ' group by pol.id_credito,unidad ';
  vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
  if Assigned(vlQry) then
  begin
    try
    edIMP_SEG.Text := FormatFloat('###,###,###,###,##0.00',vlQry.FieldByName('prima').AsFloat);
    finally vlQry.Free;
    end;
  end;
  { <-- SEGURO}

  {-->Otros adeudos}
  vlSQL := 'select nvl(sum(importe),0) as importe from cr_am_otradeu where tipo_adeu = ''BI'' and	f_cobro is null and id_credito = ' + edID_CREDITO.Text;
  vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
  if Assigned(vlQry) then
  begin
    try
    edIMP_OTR_ADEU_BIN.Text := vlQry.FieldByName('importe').AsString;
    finally vlQry.Free;
    end;
  end;

  vlSQL := 'select nvl(sum(importe),0) as importe from cr_am_otradeu where tipo_adeu = ''FI'' and	f_cobro is null and id_credito = ' + edID_CREDITO.Text;
  vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
  if Assigned(vlQry) then
  begin
    try
    edIMP_OTR_ADEU_FIRA.Text := vlQry.FieldByName('importe').AsString;
    finally vlQry.Free;
    end;
  end;
  {<--Otros adeudos}

  { --> PRONOSTICO DE ADEUDOS}
  //--> Nivelación
  BNivela := 'T';
  vlSQL := 'SELECT CVE_GEN_TIP_PAG FROM CR_PRODUCTO WHERE CVE_PRODUCTO_CRE = (SELECT CVE_PRODUCTO_CRE FROM CR_CONTRATO WHERE ID_CONTRATO IN  (SELECT ID_CONTRATO FROM CR_CREDITO WHERE ID_CREDITO = ' + edID_CREDITO.Text + '))';
  vlQry := GetSQLQuery(vlSQL,Objeto.Apli.DataBaseName,  Objeto.Apli.SessionName, False );
  if Assigned(vlQry) and not( vlQry.IsEmpty ) then
  begin
    try
    vlQry.First;
    if not vlQry.FieldByName('CVE_GEN_TIP_PAG').IsNull then
      if vlQry.FieldByName('CVE_GEN_TIP_PAG').AsString = 'PAGNIV' then
        BNivela := 'N';
    finally
    vlQry.Free;
    end;
  end;
  //<-- Nivelación

  //-> Reporte
  fecha := FormatDateTime('dd/mm/yyyy', Date);

  RProAdeu := TQrTasaActB.Create(nil);
  RProAdeu.Apli := Objeto.Apli;

  RProAdeu.BNivela := BNivela;
  RProAdeu.QRInterEncabezado1.Apli:=Objeto.Apli;
  RProAdeu.VGFechaIni := fecha;
  RProAdeu.qyEncabezado.DatabaseName := Objeto.Apli.DataBaseName;
  RProAdeu.qyEncabezado.SessionName := Objeto.Apli.SessionName;
  RProAdeu.qyEncabezado.Active:=False;
  RProAdeu.qyEncabezado.SQL.Text:= RProAdeu.LlenaEncabezado(edID_CREDITO.Text,fecha,fecha,objeto.Apli );
  RProAdeu.qyEncabezado.Active:=True;

  RProAdeu.qyConsulta.DatabaseName := Objeto.Apli.DataBaseName;
  RProAdeu.qyConsulta.SessionName := Objeto.Apli.SessionName;
  RProAdeu.qyConsulta.Active:=False;
  RProAdeu.qyConsulta.SQL.Text:= RProAdeu.LlenaConsulta(edID_CREDITO.Text,fecha,fecha,
                                  '1', '1',Objeto.Apli );
  RProAdeu.qyConsulta.Active:=True;

  RProAdeu.Prepare;

  //Saldo
  edIMP_CAP.Text := FormatFloat('###,###,###,###,##0.00',RProAdeu.qyEncabezadoSDO_INSOLUTO.AsFloat);
  //Saldo vencido
  edIMP_CAP_VDO.Text := FormatFloat('###,###,###,###,##0.00',RProAdeu.qyEncabezadoIMP_CAPITAL_VDO.AsFloat);
  //Refinanciamiento
  edIMP_FINADIC.Text := FormatFloat('###,###,###,###,##0.00',RProAdeu.qyEncabezadoSDO_FINAN_ADIC.AsFloat);
  //Refinanciamiento vencido
  edIMP_FINADIC_VDO.Text := FormatFloat('###,###,###,###,##0.00',RProAdeu.qyEncabezadoIMP_VDO_FINAN_A.AsFloat);
  //Interes
  edIMP_INT.Text := FormatFloat('###,###,###,###,##0.00',StrToFloat(StringReplace(RProAdeu.QRIntVig.Caption,',','',[rfReplaceAll]))+StrToFloat(StringReplace(RProAdeu.QRIntVigIVA.Caption,',','',[rfReplaceAll])));
  //Interes vencido
  edIMP_INT_VDO.Text := FormatFloat('###,###,###,###,##0.00',RProAdeu.qyEncabezadoIMP_INTERES_VDO.AsFloat+RProAdeu.qyEncabezadoIMP_IVA_INT_VDO.AsFloat);
  //Cuota FEGA
  edIMP_CUOT_FEGA.Text := FormatFloat('###,###,###,###,##0.00',RProAdeu.qyEncabezadoIMP_COMISION.AsFloat+RProAdeu.qyEncabezadoIMP_IVACOM.AsFloat);
  //Cuota FEGA vencido
  edIMP_CUOT_FEGA_VDO.Text := FormatFloat('###,###,###,###,##0.00',RProAdeu.qyEncabezadoIMP_COMISION_VDO.AsFloat+RProAdeu.qyEncabezadoIMP_IVA_COM_VDO.AsFloat);
  //Para cobertura actual
  saldototal := StrToFloat(StringReplace(RProAdeu.QRLabel122.Caption,',','',[rfReplaceAll]));
  //Moras
  edIMP_MORA_CAPITAL.Text := FormatFloat('###,###,###,###,##0.00',RProAdeu.qyEncabezadoIMP_MOR_CAPITAL.AsFloat+RProAdeu.qyEncabezadoIMP_IVA_MOR_CAP.AsFloat);
  edIMP_MORA_FINAN_A.Text := FormatFloat('###,###,###,###,##0.00',RProAdeu.qyEncabezadoIMP_MOR_FINAN_A.AsFloat+RProAdeu.qyEncabezadoIMP_IVA_MOR_FIN.AsFloat);
  edIMP_MORA_INTERES.Text := FormatFloat('###,###,###,###,##0.00',RProAdeu.qyEncabezadoIMP_MOR_INTERES.AsFloat+RProAdeu.qyEncabezadoIMP_IVA_MOR_INT.AsFloat);
  edIMP_MORA_CONCEPTOS.Text := FormatFloat('###,###,###,###,##0.00',RProAdeu.qyEncabezadoIMP_MOR_COMISION.AsFloat+RProAdeu.qyEncabezadoIMP_IVA_MOR_COM.AsFloat);

  edTotal1.Text := FormatFloat('###,###,###,###,##0.00',
                    RProAdeu.qyEncabezadoSDO_INSOLUTO.AsFloat +
                    RProAdeu.qyEncabezadoSDO_FINAN_ADIC.AsFloat +
                    StrToFloat(StringReplace(RProAdeu.QRIntVig.Caption,',','',[rfReplaceAll]))+StrToFloat(StringReplace(RProAdeu.QRIntVigIVA.Caption,',','',[rfReplaceAll])) +
                    RProAdeu.qyEncabezadoIMP_COMISION.AsFloat+RProAdeu.qyEncabezadoIMP_IVACOM.AsFloat +
                    StrToFloat(StringReplace(edIMP_SEG.Text,',','',[rfReplaceAll])) +
                    StrToFloat(StringReplace(edIMP_OTR_ADEU_BIN.Text,',','',[rfReplaceAll])) +
                    StrToFloat(StringReplace(edIMP_OTR_ADEU_FIRA.Text,',','',[rfReplaceAll])) 
                  );

  edTotal2.Text := FormatFloat('###,###,###,###,##0.00',
                    RProAdeu.qyEncabezadoIMP_CAPITAL_VDO.AsFloat +
                    RProAdeu.qyEncabezadoIMP_MOR_CAPITAL.AsFloat+RProAdeu.qyEncabezadoIMP_IVA_MOR_CAP.AsFloat +
                    RProAdeu.qyEncabezadoIMP_VDO_FINAN_A.AsFloat +
                    RProAdeu.qyEncabezadoIMP_MOR_FINAN_A.AsFloat+RProAdeu.qyEncabezadoIMP_IVA_MOR_FIN.AsFloat +
                    RProAdeu.qyEncabezadoIMP_INTERES_VDO.AsFloat+RProAdeu.qyEncabezadoIMP_IVA_INT_VDO.AsFloat +
                    RProAdeu.qyEncabezadoIMP_MOR_INTERES.AsFloat+RProAdeu.qyEncabezadoIMP_IVA_MOR_INT.AsFloat +
                    RProAdeu.qyEncabezadoIMP_COMISION_VDO.AsFloat+RProAdeu.qyEncabezadoIMP_IVA_COM_VDO.AsFloat +
                    RProAdeu.qyEncabezadoIMP_MOR_COMISION.AsFloat+RProAdeu.qyEncabezadoIMP_IVA_MOR_COM.AsFloat
                  );

  edIMP_AVALUOChange(nil);

  { <-- PRONOSTICO DE ADEUDOS}

  { --> Estrato UDIS }
  if not edB_GAR_VIGENTE.Checked then
  begin
    vlSQL :=
      ' select tipo_cambio ' +
      ' from   (select   tipo_cambio ' +
      '         from     Tipo_Cambio_Mon ' +
      '         where    fh_actualiza < sysdate ' +
      '         and			cve_moneda_refer = 800 ' +
      '         order by fh_actualiza desc) ' +
      ' where  rownum = 1 ';
    vlIMPORTE := RProAdeu.qyEncabezadoSDO_INSOLUTO.AsFloat + RProAdeu.qyEncabezadoIMP_CAPITAL_VDO.AsFloat +
              RProAdeu.qyEncabezadoSDO_FINAN_ADIC.AsFloat +
              RProAdeu.qyEncabezadoIMP_VDO_FINAN_A.AsFloat +
              StrToFloat(StringReplace(RProAdeu.QRIntVig.Caption,',','',[rfReplaceAll]))+StrToFloat(StringReplace(RProAdeu.QRIntVigIVA.Caption,',','',[rfReplaceAll])) +
              RProAdeu.qyEncabezadoIMP_INTERES_VDO.AsFloat+RProAdeu.qyEncabezadoIMP_IVA_INT_VDO.AsFloat;
  end
  else
  begin
    vlSQL :=
      ' select tipo_cambio ' +
      ' from   (select   tipo_cambio ' +
      '         from     Tipo_Cambio_Mon ' +
      '         where    fh_actualiza < to_date('''+edF_PAGO_GAR_FIRA.Text+''',''dd/mm/yyyy'') ' +
      '         and			cve_moneda_refer = 800 ' +
      '         order by fh_actualiza desc) ' +
      ' where  rownum = 1 ';
    if trim(edIMP_GAR_FIRA.Text) = '' then edIMP_GAR_FIRA.Text := '0';
    vlIMPORTE := StrToFloat(StringReplace(edIMP_GAR_FIRA.Text,',','',[rfReplaceAll]));
  end;
  GetSQLFloat(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, 'TIPO_CAMBIO', vlTIPO_CAMBIO_UDIS, False);

  if (vlIMPORTE/vlTIPO_CAMBIO_UDIS) <= 25000 then
    edESTRATO.Text := '1'
  else if (vlIMPORTE/vlTIPO_CAMBIO_UDIS) <= 250000 then
    edESTRATO.Text := '2'
  else
    edESTRATO.Text := '3';
    
  RProAdeu.free;
  { <-- Estrato UDIS }


  { --> CLABE }
  //CLABE I
  sText := '';
  vlSQL :=
    ' select cuenta_banco ' +
    ' from   cr_cred_cheq ' +
    ' where  cve_tipo_acred = ''AC'' and cve_tipo_cheq = ''LQ'' and b_predeterminada = ''V'' ' +
    ' and		 id_credito = ' + edID_CREDITO.Text;
  vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
  if Assigned(vlQry) then
  begin
    try
    sText := vlQry.FieldByName('cuenta_banco').AsString;
    finally vlQry.Free;
    end;
  end;

  if sText = '' then
  begin
    //CLABE II
    vlSQL :=
      ' select ccc.cuenta_banco ' +
      ' from   cr_cred_cheq ccc, ' +
      ' 			 cr_credito cred, ' +
      ' 			 contrato cto ' +
      ' where  ccc.cve_tipo_acred = ''AC'' and ccc.cve_tipo_cheq = ''LQ'' and ccc.b_predeterminada = ''V'' ' +
      ' and		 ccc.id_acreditado = cto.id_titular ' +
      ' and		 cto.id_contrato = cred.id_contrato ' +
      ' and		 cred.id_credito = ' + edID_CREDITO.Text;
    vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
    if Assigned(vlQry) then
    begin
      try
      sText := vlQry.FieldByName('cuenta_banco').AsString;
      finally vlQry.Free;
      end;
    end;
  end;

  edCUENTA_BANCO.Text := sText;
  { <-- CLABE }

  { --> BANCO DESTINO }
  //BANCO DESTINO I
  sText := '';
  vlSQL :=
    ' select ccc.id_banco_chqra, p.nombre ' +
    ' from   cr_cred_cheq ccc, ' +
    ' 			 persona p ' +
    ' where  ccc.cve_tipo_acred = ''AC'' and ccc.cve_tipo_cheq = ''LQ'' and ccc.b_predeterminada = ''V'' ' +
    ' and		 ccc.id_banco_chqra = p.id_persona ' +
    ' and		 id_credito = ' + edID_CREDITO.Text;
  vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
  if Assigned(vlQry) then
  begin
    try
    sText := vlQry.FieldByName('nombre').AsString;
    finally vlQry.Free;
    end;
  end;

  if sText = '' then
  begin
    //BANCO DESTINO II
    vlSQL :=
      ' select ccc.id_banco_chqra, p.nombre ' +
      ' from   cr_cred_cheq ccc, ' +
      ' 			 cr_credito cred, ' +
      ' 			 contrato cto, ' +
      ' 			 persona p ' +
      ' where  ccc.cve_tipo_acred = ''AC'' and ccc.cve_tipo_cheq = ''LQ'' and ccc.b_predeterminada = ''V'' ' +
      ' and		 ccc.id_acreditado = cto.id_titular ' +
      ' and		 cto.id_contrato = cred.id_contrato ' +
      ' and		 ccc.id_banco_chqra = p.id_persona ' +
      ' and		 cred.id_credito = ' + edID_CREDITO.Text;
    vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
    if Assigned(vlQry) then
    begin
      try
      sText := vlQry.FieldByName('nombre').AsString;
      finally vlQry.Free;
      end;
    end;
  end;

  edNOM_BANCO_CHQRA.Text := sText;
  { <-- BANCO DESTINO }

  { --> GARANTÍAS}
  sText := '';
  vlSQL :=
    ' select sum (imp_saldo) as imp_bloq ' +
    ' from   (select cc.id_credito, ' +
    '                cp.cve_producto_gpo, ' +
    '                co.cve_producto_cre, ' +
    '                cp.desc_c_producto, ' +
    '                cbt.id_blq_transac, ' +
    '                cbt.cve_blq_cpto, ' +
    '                cbt.cve_blq_operacion, ' +
    '                cbt.id_contrato_dv, ' +
    '                (cbt.imp_saldo * decode (cbt.tipo_afectacion, ''I'', 1, -1) ) as imp_saldo, ' +
    '                cbt.fh_activacion, ' +
    '                cbt.cve_usu_activacion, ' +
    '                cbt.desc_blq_cpto, ' +
    '                cbt.tipo_afectacion ' +
    '         from   (select cbt.*, ' +
    '                        cbo.tipo_afectacion, ' +
    '                        cbc.desc_blq_cpto ' +
    '                 from   cr_blq_transac cbt, ' +
    '                        cr_blq_operacion cbo, ' +
    '                        cr_blq_concepto cbc ' +
    '                 where  cbo.cve_blq_operacion = cbt.cve_blq_operacion ' +
    '                 and    cbt.sit_trans_bloq not in (''PA'', ''ER'') ' +
    '                 and    cbc.cve_blq_cpto = cbt.cve_blq_cpto ' +
    '                 and    cbc.cve_blq_cpto in (''BLGTIA'', ''BLPRLV'', ''SUSTGT'') ) cbt, ' +
    '                cr_credito cc, ' +
    '                cr_contrato co, ' +
    '                cr_producto cp ' +
    '         where  cc.id_credito = cbt.id_credito and co.id_contrato = cc.id_contrato and cp.cve_producto_cre = co.cve_producto_cre) ' +
    ' where  id_credito = ' + edID_CREDITO.Text;
  vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
  if Assigned(vlQry) then
  begin
    try
    edGAR_LIQ_ACT.Text := vlQry.FieldByName('IMP_BLOQ').AsString;
    if (trim(edIMP_CAP.Text) = '') or (StrToFloat(StringReplace(edIMP_CAP.Text,',','',[rfReplaceAll])) = 0) then
      edGAR_LIQ_ACT_PCT.Text := '--'
    else
      edGAR_LIQ_ACT_PCT.Text := FormatFloat('###,###,###,###,##0.00',100*vlQry.FieldByName('IMP_BLOQ').AsFloat/StrToFloat(StringReplace(edIMP_CAP.Text,',','',[rfReplaceAll])));
    finally vlQry.Free;
    end;
  end;

  //Porcentajes
  vlSQL :=
    ' select distinct cgfc.id_contrato, ' +
    '                 cgfc.cve_operativa, ' +
    '                 cgfc.sit_ga_fira, ' +
    '                 cgfc.pct_gtia_liq as proporcion ' +
    ' from            cr_ga_fira_cto cgfc, ' +
    ' 								cr_credito cc ' +
    ' where           cgfc.sit_ga_fira = ''AC'' ' +
    ' and							cgfc.id_contrato = cc.id_contrato ' +
    ' and							cc.id_credito = ' + edID_CREDITO.Text;

  vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
  if Assigned(vlQry) then
  begin
    try
    edGAR_LIQ_ORIG_PCT.Text := vlQry.FieldByName('PROPORCION').AsString;
    edGAR_LIQ_ORIG.Text := FormatFloat('###,###,###,###,##0.00',StrToFloat(StringReplace(edIMP_CREDITO.Text,',','',[rfReplaceAll]))*vlQry.FieldByName('PROPORCION').AsFloat/100);
    finally vlQry.Free;
    end;
  end;

  //Porcentaje de la garantía nominal
  vlSQL := ' select PCT_GTIA_FEGA_NO from	 cr_fira_equiv cfe, cr_credito cc where cc.cve_operativa = cfe.cve_operativa ' +
           ' and		cc.id_credito = ' + edID_CREDITO.Text;
  vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
  if Assigned(vlQry) then
  begin
    try
      edGAR_FEGA_NOM_PCT.Text := vlQry.FieldByName('PCT_GTIA_FEGA_NO').AsString;
    finally vlQry.Free;
    end;
  end;
  { <-- GARANTÍAS}

  { --> FONDO DE CONTINGENCIA}
  //Saldo bloqueado por seguro
  vlSQL :=
    ' select sum (imp_saldo) as imp_bloq ' +
    ' from   (select cc.id_credito, ' +
    '                cp.cve_producto_gpo, ' +
    '                co.cve_producto_cre, ' +
    '                cp.desc_c_producto, ' +
    '                cbt.id_blq_transac, ' +
    '                cbt.cve_blq_cpto, ' +
    '                cbt.cve_blq_operacion, ' +
    '                cbt.id_contrato_dv, ' +
    '                (cbt.imp_saldo * decode (cbt.tipo_afectacion, ''I'', 1, -1) ) as imp_saldo, ' +
    '                cbt.fh_activacion, ' +
    '                cbt.cve_usu_activacion, ' +
    '                cbt.desc_blq_cpto, ' +
    '                cbt.tipo_afectacion ' +
    '         from   (select cbt.*, ' +
    '                        cbo.tipo_afectacion, ' +
    '                        cbc.desc_blq_cpto ' +
    '                 from   cr_blq_transac cbt, ' +
    '                        cr_blq_operacion cbo, ' +
    '                        cr_blq_concepto cbc ' +
    '                 where  cbo.cve_blq_operacion = cbt.cve_blq_operacion ' +
    '                 and    cbt.sit_trans_bloq not in (''PA'', ''ER'') ' +
    '                 and    cbc.cve_blq_cpto = cbt.cve_blq_cpto ' +
    '                 and    cbc.cve_blq_cpto in (''BLSEGU'') ) cbt, ' +
    '                cr_credito cc, ' +
    '                cr_contrato co, ' +
    '                cr_producto cp ' +
    '         where  cc.id_credito = cbt.id_credito and co.id_contrato = cc.id_contrato and cp.cve_producto_cre = co.cve_producto_cre) ' +
    ' where  id_credito = ' + edID_CREDITO.Text;
  vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
  if Assigned(vlQry) then
  begin
    try
      edIMP_FND_CONT_ACT.Text := vlQry.FieldByName('imp_bloq').AsString;
      if trim(edIMP_FND_CONT_ACT.Text) = '' then
        edIMP_FND_CONT_ACT.Text := '0';
      edIMP_CONT_ACT_PC.Text :=
      FormatFloat('###,###,###,###,##0.00',100*StrToFloat(edIMP_FND_CONT_ACT.Text)/StrToFloat(edIMP_CREDITO.Text));
    finally vlQry.Free;
    end;
  end;
  { <-- FONDO DE CONTINGENCIA}

  { --> TASA }
    edTASA_BASE.Text := FormatFloat('###,###,###,###,##0.00',StrToFloat(edTASA_CREDITO.Text) - StrToFloat(edSOBRETASA.Text));
  { <-- TASA}

  { --> DIAS VENCIDO }
  vlSQL :=
    ' select nvl(floor(sysdate - f_vencimiento),0) as dias_vdo from ( ' +
    '   select min(f_vencimiento) as f_vencimiento from cr_capital ' +
    '   where f_vencimiento < sysdate ' +
    ' 	and 	sit_capital = ''IM'' ' +
    '   and		id_credito = ' + edID_CREDITO.Text +
    ' ) ';
  GetSQLStr(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, 'DIAS_VDO', sText, False);
  edDIAS_VENC.Text := sText;
{
  vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
  if Assigned(vlQry) then
  begin
    try
    edDIAS_VENC.Text := vlQry.FieldByName('dias_vdo').AsString;
    finally vlQry.Free;
    end;
  end;
}
  { <-- DIAS VENCIDO }

  //Actualiza el porcentaje de la garantía fiduciaria actual
  edGAR_FIDUC_ACTChange(nil);
  edB_GAR_VIGENTEClick(nil);

end;


procedure TWCrDispF.btID_CREDITOClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
     MuestraDatosCredito;
     edID_CREDITOExit(nil);
     InterForma1.NextTab(edID_CREDITO);
   End;
end;

procedure TWCrDispF.ilID_CREDITOEjecuta(Sender: TObject);
begin
  if Objeto.Credito.findKey([ilID_CREDITO.buffer]) then
  begin
    MuestraDatosCredito;
    InterForma1.NextTab(edID_CREDITO);
  end;
end;

procedure TWCrDispF.GeneraNumControlFIRA;
var
  sText : String;
begin
  sText := edCONT_FIRAI.Text + '/' + edCONT_FIRAII.Text + '/' + edCONT_FIRAIII.Text + '/' +
  edCONT_FIRAIV.Text;
  //  SysUtils.Format('%.*d', [2,StrToInt(edCONT_FIRAIV.Text)]) ;
  edNUM_CONTROL_FIRA.Text := sText;
end;

procedure TWCrDispF.edCONT_FIRAIExit(Sender: TObject);
var
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
begin
  vlbSalida := True;
  vlStrMesg := '';

  if not((edCONT_FIRAI.Text = '1') or (edCONT_FIRAI.Text = '2') or (edCONT_FIRAI.Text = '3')) then
  begin
    edCONT_FIRAI.Text := '';
    vlbSalida := False;
    vlStrMesg := 'Solo se permiten valores: 1,2 y 3';
  end;
  GeneraNumControlFIRA;
  InterForma1.ValidaExit(edCONT_FIRAI, vlbSalida, vlStrMesg, True);
end;

procedure TWCrDispF.edCONT_FIRAIIIExit(Sender: TObject);
var
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
begin
  vlbSalida := True;
  vlStrMesg := '';

  if Length(edCONT_FIRAIII.Text) <> 6 then
  begin
    edCONT_FIRAIII.Text := '';
    vlbSalida := False;
    vlStrMesg := 'Deben ser 6 dígitos';
  end;
  GeneraNumControlFIRA;
  InterForma1.ValidaExit(edCONT_FIRAIII, vlbSalida, vlStrMesg, True);
end;

procedure TWCrDispF.edCONT_FIRAIVExit(Sender: TObject);
var
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
begin
  vlbSalida := True;
  vlStrMesg := '';

  if Length(edCONT_FIRAIV.Text) <> 2 then
  begin
    edCONT_FIRAIV.Text := '';
    vlbSalida := False;
    vlStrMesg := 'Deben ser 2 dígitos';
  end;
  GeneraNumControlFIRA;
  InterForma1.ValidaExit(edCONT_FIRAIV, vlbSalida, vlStrMesg, True);
end;

procedure TWCrDispF.edID_CREDITOExit(Sender: TObject);
var
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
  vlSQL : String;
  vlQry  : TQuery;
  count : Integer;
begin
  vlbSalida := True;
  vlStrMesg := '';

  if (objeto.Modo = moAppend) or (objeto.Modo = moEdit) then
  begin
    objeto.ID_CREDITO.GetFromControl;

  if trim(edID_CREDITO.text) = '' then
  begin
    vlbSalida := False;
    vlStrMesg := 'El crédito no puede ser nulo';
  end
  else if (objeto.Modo = moAppend) then
  begin
    //Verifica que no exista en la tabla
    vlSQL :=
      ' select count(*) as count from cr_am_dispf where id_credito = ' + edID_CREDITO.Text;
    vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );
    if Assigned(vlQry) then
    begin
      try
      count := vlQry.FieldByName('count').AsInteger;
      finally vlQry.Free;
      end;
    end;

    if (count <> 0) then
    begin
      vlbSalida := False;
      vlStrMesg := 'La disposición ya existe';
    end;
  end;

  end;

  InterForma1.ValidaExit(edID_CREDITO, vlbSalida, vlStrMesg, True);
end;

procedure TWCrDispF.btID_DESPACHOClick(Sender: TObject);
begin
  Objeto.PersonaDesp.ShowAll := True;
  if Objeto.PersonaDesp.Busca then
  begin
    InterForma1.NextTab(edID_DESPACHO);
  end;
end;

procedure TWCrDispF.ilID_DESPACHOEjecuta(Sender: TObject);
begin
  if Objeto.PersonaDesp.findKey([ilID_DESPACHO.buffer]) then
    InterForma1.NextTab(edID_DESPACHO);
end;

procedure TWCrDispF.edNUM_CONTROL_FIRAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edNUM_CONTROL_FIRA, True, '', True);
end;

procedure TWCrDispF.edID_CRED_FIRA_NExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edID_CRED_FIRA_N, True, '', True);
end;

procedure TWCrDispF.edID_DESPACHOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edID_CRED_FIRA_N, True, '', True);
end;

procedure TWCrDispF.edIMP_AVALUOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edIMP_AVALUO, True, '', True);
end;

procedure TWCrDispF.edIMP_FND_CONT_ORIGExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edIMP_FND_CONT_ORIG, True, '', True);
end;

procedure TWCrDispF.edIMP_FND_CONT_ACTExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edIMP_FND_CONT_ACT, True, '', True);
end;

procedure TWCrDispF.edIMP_CONT_ACT_PCExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edIMP_CONT_ACT_PC, True, '', True);
end;

procedure TWCrDispF.btCVE_CPGARFClick(Sender: TObject);
begin
  Objeto.CPGARF.ShowAll := True;
  if Objeto.CPGARF.Busca then
  begin
    InterForma1.NextTab(edCVE_CPGARF);
  end;
end;

procedure TWCrDispF.btCVE_SPGARFClick(Sender: TObject);
begin
  Objeto.SPGARF.ShowAll := True;
  if Objeto.SPGARF.Busca then
  begin
    InterForma1.NextTab(edCVE_SPGARF);
  end;
end;

procedure TWCrDispF.btCVE_VIARECClick(Sender: TObject);
begin
  Objeto.VIAREC.ShowAll := True;
  if Objeto.VIAREC.Busca then
  begin
    InterForma1.NextTab(edCVE_VIAREC);
  end;
end;

procedure TWCrDispF.ilCVE_CPGARFEjecuta(Sender: TObject);
begin
  if Objeto.CPGARF.findKey([ilCVE_CPGARF.buffer]) then
  begin
    InterForma1.NextTab(edCVE_CPGARF);
  end;
end;

procedure TWCrDispF.ilCVE_SPGARFEjecuta(Sender: TObject);
begin
  if Objeto.SPGARF.findKey([edCVE_CPGARF.Text,ilCVE_SPGARF.buffer]) then
  begin
    InterForma1.NextTab(edCVE_SPGARF);
  end;
end;

procedure TWCrDispF.ilCVE_VIARECEjecuta(Sender: TObject);
begin
  if Objeto.VIAREC.findKey([ilCVE_VIAREC.buffer]) then
  begin
    InterForma1.NextTab(edCVE_VIAREC);
  end;
end;

procedure TWCrDispF.edTIPO_POLIZAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edTIPO_POLIZA, True, '', True);
end;

procedure TWCrDispF.edASEGURADORAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edASEGURADORA, True, '', True);
end;

procedure TWCrDispF.edID_CRED_FIRA_GARExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edID_CRED_FIRA_GAR, True, '', True);
end;

procedure TWCrDispF.edCVE_CPGARFExit(Sender: TObject);
begin
  if trim(edCVE_CPGARF.Text) = '' then
      edDESC_CPGARF.Text := '';
  InterForma1.ValidaExit(edCVE_CPGARF, True, '', True);
end;

procedure TWCrDispF.edCVE_SPGARFExit(Sender: TObject);
begin
  if (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
  begin
    if trim(edCVE_SPGARF.Text) = '' then
      edDESC_SPGARF.Text := '';
  end;
  InterForma1.ValidaExit(edCVE_SPGARF, True, '', True);
end;

procedure TWCrDispF.edCVE_VIARECExit(Sender: TObject);
begin
 if (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
  begin
    if trim(edCVE_VIAREC.Text) = '' then
      edDESC_VIAREC.Text := '';
  end;

  InterForma1.ValidaExit(edCVE_VIAREC, True, '', True);
end;

procedure TWCrDispF.edGAR_FONAGA_PCTExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edGAR_FONAGA_PCT, True, '', True);
end;

procedure TWCrDispF.edIMP_GAR_FIRAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edIMP_GAR_FIRA, True, '', True);
end;

procedure TWCrDispF.edIMP_REC_GAR_FIRAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edIMP_REC_GAR_FIRA, True, '', True);
end;

procedure TWCrDispF.edF_PAGO_GAR_FIRAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_PAGO_GAR_FIRA, True, '', True);
end;

procedure TWCrDispF.edF_LIM_ENTRG_INFExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_LIM_ENTRG_INF, True, '', True);
end;

procedure TWCrDispF.edF_LIM_INI_AC_JUDExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_LIM_INI_AC_JUD, True, '', True);
end;

procedure TWCrDispF.edF_PRESEN_DMDAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_PRESEN_DMDA, True, '', True);
end;

procedure TWCrDispF.edF_DICT_INCOBRExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_DICT_INCOBR, True, '', True);
end;

procedure TWCrDispF.edF_RESC_GAR_FIRAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_RESC_GAR_FIRA, True, '', True);
end;

procedure TWCrDispF.edF_PROG_RECUPExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_PROG_RECUP, True, '', True);
end;

procedure TWCrDispF.edF_ENV_RECUPExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_ENV_RECUP, True, '', True);
end;

procedure TWCrDispF.edF_VEN_GAR_FIRAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_VEN_GAR_FIRA, True, '', True);
end;

procedure TWCrDispF.edF_SOL_CAST_FIRAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_SOL_CAST_FIRA, True, '', True);
end;

procedure TWCrDispF.edF_CAST_FIRAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_CAST_FIRA, True, '', True);
end;

procedure TWCrDispF.edF_LIM_PRSTN_P_RExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_LIM_PRSTN_P_R, True, '', True);
end;

procedure TWCrDispF.edF_ENVIO_CCExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_ENVIO_CC, True, '', True);
end;

procedure TWCrDispF.edF_ACUSE_CCExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_ACUSE_CC, True, '', True);
end;

procedure TWCrDispF.InterForma1Buscar(Sender: TObject);
var
  encontrado: Boolean;
begin
  encontrado := objeto.InternalBusca;
  if encontrado then
    MuestraDatosCredito;
end;

procedure TWCrDispF.edCVE_SPGARFChange(Sender: TObject);
begin
  if objeto.Modo = moBrowse Then
  begin
    if Objeto.SPGARF.findKey([edCVE_CPGARF.Text,edCVE_SPGARF.Text]) then
  end;

  if (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
  begin
    if trim(edCVE_SPGARF.Text) = '' then
      edDESC_SPGARF.Text := '';
  end;

end;

procedure TWCrDispF.edIMP_AVALUOChange(Sender: TObject);
begin
  if (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
    objeto.IMP_AVALUO.GetFromControl;
  //Cobertura original
  if (trim(edIMP_AVALUO.Text) <> '') and (trim(edIMP_CREDITO.Text) <> '') then
    edIMP_COB_ORIG.Text :=
      FormatFloat('###,###,###,###,##0.00',StrToFloat(edIMP_AVALUO.Text)/StrToFloat(edIMP_CREDITO.Text));
  //Cobertura actual
  if (trim(edIMP_AVALUO.Text) <> '') and (saldototal <> 0) then
    edIMP_COB_ACT.Text :=
      FormatFloat('###,###,###,###,##0.00',StrToFloat(edIMP_AVALUO.Text)/saldototal);
end;

procedure TWCrDispF.edIMP_FND_CONT_ORIGChange(Sender: TObject);
begin
  if (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
    objeto.IMP_FND_CONT_ORIG.GetFromControl;
  if (trim(edIMP_FND_CONT_ORIG.Text) <> '') and (trim(edIMP_CREDITO.Text) <> '') then
    edIMP_FND_CONT_ORIG_PC.Text :=
      FormatFloat('###,###,###,###,##0.00',100*StrToFloat(edIMP_FND_CONT_ORIG.Text)/StrToFloat(edIMP_CREDITO.Text));
end;

procedure TWCrDispF.edNUM_CONTROL_FIRAChange(Sender: TObject);
type
  TStrArray = array of string;
var
  tokens : TStrArray;
  function Explode(var a: TStrArray; Border, S: string): Integer;
  var
    S2: string;
  begin
    Result  := 0;
    S2 := S + Border;
    repeat
      SetLength(A, Length(A) + 1);
      a[Result] := Copy(S2, 0,Pos(Border, S2) - 1);
      Delete(S2, 1,Length(a[Result] + Border));
      Inc(Result);
    until S2 = '';
  end;

begin
  if objeto.Modo = moBrowse Then
  begin
    Explode(tokens, '/', edNUM_CONTROL_FIRA.Text);
    edCONT_FIRAI.Text := tokens[0];
    edCONT_FIRAIII.Text := tokens[3];
    edCONT_FIRAIV.Text := tokens[4];
  end;
end;

procedure TWCrDispF.HabiltaCtrl(ctrl : TWinControl; habilita: Boolean; hc : Integer);
begin
  If (habilita) Then
  Begin
    ctrl.Enabled := True;
    if ctrl is TInterEdit then (ctrl as TInterEdit).Color := clWindow;
    if ctrl is TEdit then (ctrl as TEdit).Color := clWindow;
    if ctrl is TInterDateTimePicker then (ctrl as TInterDateTimePicker).Color := clWindow;
    ctrl.TabStop := True;
    ctrl.Tag := 18;
    ctrl.HelpContext := hc;
  End
  Else
  Begin
    ctrl.Enabled := False;
    if ctrl is TInterEdit then (ctrl as TInterEdit).Color := clBtnFace;
    if ctrl is TEdit then (ctrl as TEdit).Color := clBtnFace;
    if ctrl is TInterDateTimePicker then (ctrl as TInterDateTimePicker).Color := clBtnFace;
    ctrl.TabStop := False;
    //ctrl.ReadOnly := True;
    ctrl.Tag := 0;
    ctrl.HelpContext := 0;
  End;
end;

procedure TWCrDispF.HabiltaCtrls(habilita: Boolean);
begin
 HabiltaCtrl(edSTATUS, habilita, 4000);
 HabiltaCtrl(edID_CRED_FIRA_GAR, habilita, 4100);
 HabiltaCtrl(edCVE_CPGARF, habilita, 4200);
 HabiltaCtrl(btCVE_CPGARF, habilita, 4202);
 HabiltaCtrl(edCVE_SPGARF, habilita, 4300);
 HabiltaCtrl(btCVE_SPGARF, habilita, 4302);
 HabiltaCtrl(edCVE_VIAREC, habilita, 4400);
 HabiltaCtrl(btCVE_VIAREC, habilita, 4402);
 HabiltaCtrl(edIMP_GAR_FIRA, habilita, 4500);
 HabiltaCtrl(edIMP_MNTO_REC, habilita, 4550);
 HabiltaCtrl(edIMP_REC_GAR_FIRA, habilita, 4600);
 HabiltaCtrl(edF_PAGO_GAR_FIRA, habilita, 4700);
 HabiltaCtrl(InterDateTimePicker3, habilita, 4702);
 HabiltaCtrl(edF_VEN_GAR_FIRA, habilita, 4800);
 HabiltaCtrl(InterDateTimePicker4, habilita, 4802);
 HabiltaCtrl(edF_LIM_ENTRG_INF, habilita, 4900);
 HabiltaCtrl(InterDateTimePicker5, habilita, 4902);
 HabiltaCtrl(edF_SOL_CAST_FIRA, habilita, 5000);
 HabiltaCtrl(InterDateTimePicker6, habilita, 5002);
 HabiltaCtrl(edF_LIM_INI_AC_JUD, habilita, 5100);
 HabiltaCtrl(InterDateTimePicker7, habilita, 5102);
 HabiltaCtrl(edF_CAST_FIRA, habilita, 5200);
 HabiltaCtrl(InterDateTimePicker8, habilita, 5202);
 HabiltaCtrl(edF_PRESEN_DMDA, habilita, 5300);
 HabiltaCtrl(InterDateTimePicker9, habilita, 5302);
 HabiltaCtrl(edF_LIM_PRSTN_P_R, habilita, 5400);
 HabiltaCtrl(InterDateTimePicker10, habilita, 5402);
 HabiltaCtrl(edF_DICT_INCOBR, habilita, 5500);
 HabiltaCtrl(InterDateTimePicker11, habilita, 5502);
 HabiltaCtrl(edF_RESC_GAR_FIRA, habilita, 5600);
 HabiltaCtrl(InterDateTimePicker12, habilita, 5602);
 HabiltaCtrl(edF_PROG_RECUP, habilita, 5700);
 HabiltaCtrl(InterDateTimePicker13, habilita, 5702);
 HabiltaCtrl(edF_ENV_RECUP, habilita, 5800);
 HabiltaCtrl(InterDateTimePicker14, habilita, 5802);
 HabiltaCtrl(edF_ENVIO_CC, habilita, 5900);
 HabiltaCtrl(InterDateTimePicker1, habilita, 5902);
 HabiltaCtrl(edF_ACUSE_CC, habilita, 6000);
 HabiltaCtrl(InterDateTimePicker2, habilita, 6002);
 HabiltaCtrl(edRES_DICT, habilita, 6100);
 HabiltaCtrl(edPCT_COB_NOM, habilita, 6200);
 HabiltaCtrl(edPCT_COB_EFEC, habilita, 6300);
end;

procedure TWCrDispF.edB_GAR_VIGENTEClick(Sender: TObject);
begin
  If (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
    HabiltaCtrls(edB_GAR_VIGENTE.Checked);
end;

procedure TWCrDispF.edGAR_FIDUC_ORIGExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edGAR_FIDUC_ORIG, True, '', True);
end;

procedure TWCrDispF.edGAR_FIDUC_ACTExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edGAR_FIDUC_ACT, True, '', True);
end;

procedure TWCrDispF.edNOM_FIDEICOMExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edNOM_FIDEICOM, True, '', True);
end;

procedure TWCrDispF.edNUM_FIDEICOMExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edNUM_FIDEICOM, True, '', True);
end;

procedure TWCrDispF.edNOM_FIDUCExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edNOM_FIDUC, True, '', True);
end;

procedure TWCrDispF.edB_GAR_HIPOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edB_GAR_HIPO, True, '', True);
end;

procedure TWCrDispF.edGAR_FIDUC_ORIGChange(Sender: TObject);
begin
  if (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
    objeto.GAR_FIDUC_ORIG.GetFromControl;

  if (trim(edGAR_FIDUC_ORIG.Text) <> '') and (trim(edIMP_CREDITO.Text) <> '') then
    edGAR_FIDUC_ORIG_PC.Text :=
      FormatFloat('###,###,###,###,##0.00',100*StrToFloat(edGAR_FIDUC_ORIG.Text)/StrToFloat(edIMP_CREDITO.Text));
end;

procedure TWCrDispF.edGAR_FIDUC_ACTChange(Sender: TObject);
begin
  if (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
    objeto.GAR_FIDUC_ACT.GetFromControl;

  if (trim(edGAR_FIDUC_ACT.Text) <> '') and (trim(edIMP_CREDITO.Text) <> '') then
    edGAR_FIDUC_ACT_PC.Text :=
      FormatFloat('###,###,###,###,##0.00',100*StrToFloat(edGAR_FIDUC_ACT.Text)/StrToFloat(edIMP_CREDITO.Text));
end;

procedure TWCrDispF.edIMP_FND_CONT_ACTChange(Sender: TObject);
begin
  if (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
    objeto.IMP_FND_CONT_ACT.GetFromControl;

  if (trim(edIMP_FND_CONT_ACT.Text) <> '') and (trim(edIMP_CREDITO.Text) <> '') then
    edIMP_CONT_ACT_PC.Text :=
      FormatFloat('###,###,###,###,##0.00',100*StrToFloat(edIMP_FND_CONT_ACT.Text)/StrToFloat(edIMP_CREDITO.Text));
end;

procedure TWCrDispF.edB_GAR_VIGENTEExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edB_GAR_VIGENTE, True, '', True);
end;

procedure TWCrDispF.edCVE_VIARECChange(Sender: TObject);
begin

 if (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
  begin
    if trim(edCVE_VIAREC.Text) = '' then
      edDESC_VIAREC.Text := '';
  end;

end;

procedure TWCrDispF.edCVE_CPGARFChange(Sender: TObject);
begin

 if (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
  begin
    if trim(edCVE_CPGARF.Text) = '' then
      edDESC_CPGARF.Text := '';
  end;

end;

procedure TWCrDispF.BorraCampos;
begin
 if (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
  begin
    edCONT_FIRAI.Text := '';
    edCONT_FIRAIII.Text := '';
    edCONT_FIRAIV.Text := '';
    edNUM_CONTROL_FIRA.Text := '';
    edIMP_CREDITO.Text := '';
    edF_INICIO.Text := '';
    edF_VENCIMIENTO.Text := '';
    edTASA_BASE.Text := '';
    edSOBRETASA.Text := '';
    edTASA_CREDITO.Text := '';
    edCUENTA_BANCO.Text := '';
    edNOM_BANCO_CHQRA.Text := '';
    edGAR_LIQ_ORIG.Text := '';
    edGAR_LIQ_ORIG_PCT.Text := '';
    edGAR_LIQ_ACT.Text := '';
    edGAR_LIQ_ACT_PCT.Text := '';
    edGAR_FIDUC_ORIG_PC.Text := '';
    edGAR_FIDUC_ACT_PC.Text := '';
    edGAR_FEGA_NOM_PCT.Text := '';
    edIMP_COB_ORIG.Text := '';
    edIMP_COB_ACT.Text := '';
    edIMP_FND_CONT_ORIG_PC.Text := '';
    edIMP_FND_CONT_ACT.Text := '';
    edIMP_CONT_ACT_PC.Text := '';
    edIMP_CAP.Text := '';
    edIMP_FINADIC.Text := '';
    edIMP_INT.Text := '';
    edIMP_SEG.Text := '';
    edIMP_CUOT_FEGA.Text := '';
    edIMP_OTR_ADEU_FIRA.Text := '';
    edIMP_OTR_ADEU_BIN.Text := '';
    edIMP_CAP_VDO.Text := '';
    edIMP_FINADIC_VDO.Text := '';
    edIMP_INT_VDO.Text := '';
    edDIAS_VENC.Text := '';
    edIMP_CUOT_FEGA_VDO.Text := '';
    edIMP_MORA_CAPITAL.Text := '';
    edIMP_MORA_FINAN_A.Text := '';
    edIMP_MORA_INTERES.Text := '';
    edIMP_MORA_CONCEPTOS.Text := '';
    edESTRATO.Text := '';
  end;

end;

procedure TWCrDispF.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
  edB_GAR_VIGENTEClick(nil);
end;

procedure TWCrDispF.edABOG_RESPExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edABOG_RESP, True, '', True);
end;

procedure TWCrDispF.edTEL_ABOGExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edTEL_ABOG, True, '', True);
end;

procedure TWCrDispF.edF_T_ABOG_EXExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_T_ABOG_EX, True, '', True);
end;

procedure TWCrDispF.edF_T_DESP_EXExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_T_DESP_EX, True, '', True);
end;

procedure TWCrDispF.edF_DEMANDAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_DEMANDA, True, '', True);
end;

procedure TWCrDispF.edTIPO_JUICIOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edTIPO_JUICIO, True, '', True);
end;

procedure TWCrDispF.edNUM_EXPExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edNUM_EXP, True, '', True);
end;

procedure TWCrDispF.edJUZGADOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edJUZGADO, True, '', True);
end;

procedure TWCrDispF.edTIPO_JUZExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edTIPO_JUZ, True, '', True);
end;

procedure TWCrDispF.edTIPO_GARExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edTIPO_GAR, True, '', True);
end;

procedure TWCrDispF.edIMP_DEMANExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edIMP_DEMAN, True, '', True);
end;

procedure TWCrDispF.edMUN_EXHExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edMUN_EXH, True, '', True);
end;

procedure TWCrDispF.edMONEDAExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edMONEDA, True, '', True);
end;

procedure TWCrDispF.edF_INF_PROCExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_INF_PROC, True, '', True);
end;

procedure TWCrDispF.edEST_PROCExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edEST_PROC, True, '', True);
end;

procedure TWCrDispF.edOBSERVACIONESExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edOBSERVACIONES, True, '', True);
end;

procedure TWCrDispF.edEXHORTOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edEXHORTO, True, '', True);
end;

procedure TWCrDispF.edF_EXHExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_EXH, True, '', True);
end;

procedure TWCrDispF.edENV_EXHExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edENV_EXH, True, '', True);
end;

procedure TWCrDispF.edCRED_DEMExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edCRED_DEM, True, '', True);
end;

procedure TWCrDispF.edREGIONExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edREGION, True, '', True);
end;

procedure TWCrDispF.edBIEN_EMBExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edBIEN_EMB, True, '', True);
end;

procedure TWCrDispF.edTEL_DESPExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edTEL_DESP, True, '', True);
end;

procedure TWCrDispF.edDESP_RESPExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edDESP_RESP, True, '', True);
end;

procedure TWCrDispF.edF_AUTO_ADExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edF_AUTO_AD, True, '', True);
end;

procedure TWCrDispF.edEST_EXHExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edEST_EXH, True, '', True);
end;

procedure TWCrDispF.edSTATUSExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edSTATUS, True, '', True);
end;

procedure TWCrDispF.edIMP_MNTO_RECExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edIMP_MNTO_REC, True, '', True);
end;

procedure TWCrDispF.edRES_DICTExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edRES_DICT, True, '', True);
end;

procedure TWCrDispF.edPCT_COB_NOMExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edPCT_COB_NOM, True, '', True);
end;

procedure TWCrDispF.edPCT_COB_EFECExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edPCT_COB_EFEC, True, '', True);
end;

end.

