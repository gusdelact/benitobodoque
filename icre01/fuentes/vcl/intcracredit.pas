// Sistema         : Clase de CR_ACREDITADO
// Fecha de Inicio : 16/05/2003
// Función forma   : Clase de CR_ACREDITADO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
//Modificaciones   : EASA4011 07/05/2004 modificacion Agro negocios
//                   EASA4011 10/05/2004 modificacion Agro negocios
//                   EASA4011 16/03/2005 modificacion Gobiernos
//                   EASA4011 23/01/2006 modificacion Requerimiento de Excesos
Unit IntCrAcredit;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,Menus,
IntDmMain, comObj,

//Clases Adicionales
        IntPers,        //PERSONA
        IntParamCre,
        IntCrTAcreR,    //Tamaño del Acreditado
        IntCrGrupEco,   //Grupo Económico
        IntCrSectEco,   //Sector Económico
        IntCrSeTaAc,    //Tamaño por Sector
        IntCrCalAcr,    //Calificación del Acreditado
        IntGenCre,
        IntCrPctCapi,   //Porcentaje de Capitalización
        IntCrRePaCnb,
        IntCrSen,       //Región
        IntCrTipRel,    //Tipo de Relación
     //   IntSICC,        //Unidad con funciones de uso común para la interfaz SICC
        IntCrCartrIm, Grids, Aligrid, DBGrids, jpeg, ImgList, ToolWin;

const
        C_MONTO_ASIGNADO = 'MA'; // Clave de Tipo de Disposición por "Monto Asignado"

// Declaracion de las constantes para las columnas del grid de Metodologías
   const_No_Columnas = 5;
   col_No_Variable   = 0;
   col_Desc_Var      = 1;
   col_Valor         = 2;
   col_Nombre_Var    = 3;
   col_Tipo_Dato     = 4;

Type
 TEstadoAnexo19 = (eaInactivo, eaBusqueda, eaInsercion, eaEdicion);

 TCrAcredit= class;

  TWCrAcreditado=Class(TForm)
    InterForma1 : TInterForma;
    lbID_ACREDITADO : TLabel;
    edID_ACREDITADO : TEdit;
    rgSIT_ACREDITADO : TRadioGroup;
    btACREDITADO: TBitBtn;
    edDESC_ACREDITADO: TEdit;
    btDATOSADD: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilPERSONA: TInterLinkit;
    MsgPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    IEUsuarioModifica: TEdit;
    IEUsuarioAlta: TEdit;
    IEfechaAlta: TEdit;
    IEfechaModifica: TEdit;
    ilCALIFICA: TInterLinkit;
    btCONFIG_MONEDAS: TBitBtn;
    btCTRL_DOCTOS: TBitBtn;
    pmPERSONA: TPopupMenu;
    ConsultaSectorPersona1: TMenuItem;
    pgAltaDatos: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ilTIPOACRED: TInterLinkit;
    ilGrupoEco: TInterLinkit;
    ilSectorEco: TInterLinkit;
    ilTamAcred: TInterLinkit;
    ilCVE_LOCAL_CNBV: TInterLinkit;
    ilSENICREB: TInterLinkit;
    btCALIF_CALIFICA: TBitBtn;
    edSECTOR_CORP: TEdit;
    TabSheet3: TTabSheet;
    gbPlazo: TGroupBox;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    Label21: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label26: TLabel;
    edIMP_CAP_ACTUAL: TInterEdit;
    edIMP_CAP_IMP: TInterEdit;
    edIMP_CAP_VIG: TInterEdit;
    edIMP_CAP_VEN: TInterEdit;
    edIMP_TOT_ACTUAL: TInterEdit;
    edIMP_REF_ACTUAL: TInterEdit;
    edIMP_REF_VIG: TInterEdit;
    edIMP_REF_VEN: TInterEdit;
    edIMP_REF_IMP: TInterEdit;
    edIMP_TOT_VIG: TInterEdit;
    edIMP_TOT_VEN: TInterEdit;
    edIMP_TOT_IMP: TInterEdit;
    gbArt73: TGroupBox;
    lbTIPO_ACRED_REL: TLabel;
    lbCVE_GRUPO_ECO: TLabel;
    lbCVE_SECTOR_ECO: TLabel;
    lbCVE_TAM_ACRED: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label27: TLabel;
    btTIPOACREDITADO: TBitBtn;
    edTIPO_ACREDITADO: TEdit;
    chB_ACREDITADO_REL: TCheckBox;
    edTIPO_ACRED_REL: TEdit;
    edCVE_GRUPO_ECO: TEdit;
    btGRUPOECO: TBitBtn;
    edGRUPOECO: TEdit;
    edCVE_SECTOR_ECO: TEdit;
    btSECTORECO: TBitBtn;
    edDESCRIPSEC: TEdit;
    edCVE_TAM_ACRED: TEdit;
    btTAMACRED: TBitBtn;
    edDESCTAMACRED: TEdit;
    edIMP_MAX_OPERA: TInterEdit;
    edCVE_LOCAL_CNBV: TEdit;
    btnCVE_LOCAL_CNBV: TBitBtn;
    edDESC_LOCAL_CNBV: TEdit;
    edCVE_SENICREB: TEdit;
    btSENICREB: TBitBtn;
    edSENICREB: TEdit;
    grbxCalificacion: TGroupBox;
    lbCVE_CALIFACION: TLabel;
    edCVE_CALIFACION: TEdit;
    btCalifica: TBitBtn;
    edDESC_CALIFICA: TEdit;
    chB_AVALA_GOB_EDO: TCheckBox;
    edPONDERACION: TEdit;
    Label23: TLabel;
    chB_AUTORIZADO: TCheckBox;
    edDESC_C_TIPO_REL: TEdit;
    btCVE_TIPO_RELAC: TBitBtn;
    edCVE_TIPO_RELAC: TEdit;
    Label28: TLabel;
    gbImporteAutor: TGroupBox;
    lbIMP_MINIMO_AUTOR: TLabel;
    lbIMP_MAX_AUTOR: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label32: TLabel;
    lbF_VENCIMIENTO: TLabel;
    Bevel4: TBevel;
    Label31: TLabel;
    Label9: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edIMP_MINIMO_AUTOR: TInterEdit;
    edIMP_MAX_AUTOR: TInterEdit;
    cbDIAS_PAGO: TComboBox;
    cbB_ACT_EMP: TCheckBox;
    edIMP_EXCESO_EVE: TInterEdit;
    btExceso: TBitBtn;
    edIMP_TOT_AUT: TInterEdit;
    ilCVE_TIPO_RELAC: TInterLinkit;
    edF_VTO_EXCESO: TEdit;
    dtpF_VTO_EXCESO: TInterDateTimePicker;
    rgCVE_TIP_DISPOS: TRadioGroup;
    lbIMP_TOT_DISPONIB: TLabel;
    edIMP_TOT_DISPONIB: TInterEdit;
    lbPesos: TLabel;
    Bevel5: TBevel;
    Label35: TLabel;
    edIMP_TOT_BLOQUEADO: TInterEdit;
    Label36: TLabel;
    cbCVE_AFEC_INC_DEC: TComboBox;
    btComisiones: TBitBtn;
    edDIAS_ADICIONALES: TInterEdit;
    edCVE_PER_JUR_REG: TEdit;
    btCVE_PER_JUR_REG: TBitBtn;
    edDESC_CVE_PER_JUR_REG: TEdit;
    lbCVE_PER_JUR_REG: TLabel;
    edNOM_ACRED_REG: TEdit;
    btNOM_ACRED_REG: TBitBtn;
    lbNUM_EMPLEADOS: TLabel;
    Label29: TLabel;
    ilCVE_PER_JUR_REG: TInterLinkit;
    edNUM_EMPLEADOS: TInterEdit;
    LRFC_CNBV: TLabel;
    edRFC_CNBV: TEdit;
    lblCVE_RIESGO_PAIS: TLabel;
    edCVE_RIESGO_PAIS: TEdit;
    edCVE_RIESGO_FINAN: TEdit;
    lbCVE_RIESGO_FINAN: TLabel;
    lbCVE_RIESGO_INDUS: TLabel;
    edCVE_RIESGO_INDUS: TEdit;
    Label37: TLabel;
    bvlRiesgo: TBevel;
    Label38: TLabel;
    edCVE_METODOLOGIA: TEdit;
    btCVE_METODOLOGIA: TBitBtn;
    edDESC_METODOLOGIA: TEdit;
    chkB_ENTIDAD_FIN: TCheckBox;
    ilCVE_METODOLOGIA: TInterLinkit;
    ed_SiglasRFC: TEdit;
    Label39: TLabel;
    edF_RFC: TEdit;
    ed_HomoRFC: TEdit;
    btRECUP_ACREDITA: TBitBtn;
    tsEstadosyMunc: TTabSheet;
    qEstados: TQuery;
    dsEstados: TDataSource;
    spLimpia_Tabla: TStoredProc;
    spAgrega_Detalle: TStoredProc;
    spInsert_Detalle: TStoredProc;
    Timer1: TTimer;
    ImageList: TImageList;
    OpenDialog1: TOpenDialog;
    pmCarga: TPopupMenu;
    CargadearchivoExcel1: TMenuItem;
    qValidaEstadosMun: TQuery;
    gbInfoAcreditado: TGroupBox;
    btCargaMasiva: TBitBtn;
    lbAviso: TLabel;
    btSalvaCambiosAnexo18: TBitBtn;
    btCancelarAnexo18: TBitBtn;
    GroupBox1: TGroupBox;
    sagSevPerdida: TStringAlignGrid;
    qSevPerdida: TQuery;
    Label40: TLabel;
    edProbInc: TEdit;
    sagAnexo18: TStringAlignGrid;
    lbAve: TLabel;
    qAve: TQuery;
    btCve_ave: TBitBtn;
    edCve_Ave: TEdit;
    edDesc_Cve_Ave: TEdit;
    tsAnexo19: TTabSheet;
    gbInfoProyecto: TGroupBox;
    bbBuscar_Proy: TBitBtn;
    bbAlta_Proy: TBitBtn;
    bbModificar_Proy: TBitBtn;
    bbGuardar_Proy: TBitBtn;
    bbCancelar_Proy: TBitBtn;
    gbContProy: TGroupBox;
    sagContProy: TStringAlignGrid;
    bbProyectos_ContProy: TBitBtn;
    bbGuardar_ContProy: TBitBtn;
    bbCancelar_ContProy: TBitBtn;
    lblIdentificador_Proy: TLabel;
    edIdentificador_Proy: TEdit;
    lblNombre_Proy: TLabel;
    edNombre_Proy: TEdit;
    lblDescripcion_Proy: TLabel;
    edDescripcion_Proy: TEdit;
    Label42: TLabel;
    rdgEtapa_Proy: TRadioGroup;
    lblImp_Sobrecosto_Proy: TLabel;
    edImp_Sobrecosto_Proy: TEdit;
    lblImp_Cub3ros_Proy: TLabel;
    edImp_Cub3ros_Proy: TEdit;
    lblUtilidDefic_Proy: TLabel;
    edUtilidDefic_Proy: TEdit;
    bbMetodologia_ContProy: TBitBtn;
    Label41: TLabel;
    edClave_Buro: TEdit;
    btCve_Buro: TBitBtn;
    edDesc_Buro: TEdit;
    Label43: TLabel;
    edCVE_ACREDIT_CNBV: TEdit;
    BitBtn2: TBitBtn;
    edDESC_ACREDIT_CNBV: TEdit;
    edCVE_CARTERA_R04: TEdit;
    btCVE_CARTERA_R04: TBitBtn;
    edDESC_CARTERA_R04: TEdit;
    Label44: TLabel;
    MainMenu1: TMainMenu;
    Autorizacin1: TMenuItem;
    mnuSPPIXAcreditados: TMenuItem;
    mnuConfiguracionModelos: TMenuItem;
    N1: TMenuItem;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    mnuRegistrodeGarantas: TMenuItem;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure btTIPOACREDITADOClick(Sender: TObject);
    procedure btGRUPOECOClick(Sender: TObject);
    procedure btSECTORECOClick(Sender: TObject);
    procedure btTAMACREDClick(Sender: TObject);
    procedure edID_ACREDITADOExit(Sender: TObject);
    procedure ilPERSONAEjecuta(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure ilGrupoEcoEjecuta(Sender: TObject);
    procedure ilTIPOACREDEjecuta(Sender: TObject);
    procedure ilSectorEcoEjecuta(Sender: TObject);
    procedure ilTamAcredEjecuta(Sender: TObject);
    procedure edIMP_MAX_AUTORExit(Sender: TObject);
    procedure chB_ACREDITADO_RELExit(Sender: TObject);
    procedure edTIPO_ACRED_RELExit(Sender: TObject);
    procedure edCVE_SECTOR_ECOExit(Sender: TObject);
    procedure rgSIT_ACREDITADOExit(Sender: TObject);
    procedure edCVE_GRUPO_ECOExit(Sender: TObject);
    procedure edCVE_TAM_ACREDExit(Sender: TObject);
    procedure edCVE_CALIFACIONExit(Sender: TObject);
    procedure chB_AUTORIZADOExit(Sender: TObject);
    procedure chB_ACREDITADO_RELClick(Sender: TObject);
    procedure edIMP_MINIMO_AUTORExit(Sender: TObject);
    procedure chB_ACREDITADO_RELEnter(Sender: TObject);
    procedure btDATOSADDClick(Sender: TObject);
    procedure btCalificaClick(Sender: TObject);
    procedure ilCALIFICAEjecuta(Sender: TObject);
    Function  VentanaCalculo(pDato : String): string;
    procedure InterForma1Buscar(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure cbB_ACT_EMPExit(Sender: TObject);
    procedure btCONFIG_MONEDASClick(Sender: TObject);
    procedure cbDIAS_PAGOExit(Sender: TObject);
    procedure edDIAS_ADICIONALESExit(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure ilCVE_LOCAL_CNBVEjecuta(Sender: TObject);
    procedure btnCVE_LOCAL_CNBVClick(Sender: TObject);
    procedure btnCVE_LOCAL_CNBVExit(Sender: TObject);
    procedure edCVE_LOCAL_CNBVExit(Sender: TObject);
    procedure ConsultaSectorPersona1Click(Sender: TObject);
    procedure btCTRL_DOCTOSClick(Sender: TObject);
    procedure chB_AUTORIZADOClick(Sender: TObject);
    procedure btSENICREBClick(Sender: TObject);
    procedure ilSENICREBEjecuta(Sender: TObject);
    procedure chB_AVALA_GOB_EDOExit(Sender: TObject);
    procedure edCVE_SENICREBExit(Sender: TObject);
    procedure btCALIF_CALIFICAClick(Sender: TObject);
    procedure btCVE_TIPO_RELACClick(Sender: TObject);
    procedure ilCVE_TIPO_RELACEjecuta(Sender: TObject);
    procedure edCVE_TIPO_RELACExit(Sender: TObject);
    procedure edCVE_TIPO_RELACKeyPress(Sender: TObject; var Key: Char);
    procedure edIMP_EXCESO_EVEExit(Sender: TObject);
    procedure edF_VTO_EXCESOExit(Sender: TObject);
    procedure btExcesoClick(Sender: TObject);
    procedure rgCVE_TIP_DISPOSClick(Sender: TObject);
    procedure cbCVE_AFEC_INC_DECChange(Sender: TObject);
    procedure cbCVE_AFEC_INC_DECExit(Sender: TObject);
    procedure rgCVE_TIP_DISPOSExit(Sender: TObject);
    procedure grbxCalificacionExit(Sender: TObject);
    procedure InterForma1ErrorAceptar(Sender: TObject);
    procedure btComisionesClick(Sender: TObject);
    procedure btCVE_PER_JUR_REGClick(Sender: TObject);
    procedure edCVE_PER_JUR_REGExit(Sender: TObject);
    procedure btNOM_ACRED_REGClick(Sender: TObject);
    procedure edNOM_ACRED_REGExit(Sender: TObject);
    procedure edNUM_EMPLEADOSExit(Sender: TObject);
    procedure btNOM_ACRED_REGExit(Sender: TObject);
    procedure ilCVE_PER_JUR_REGEjecuta(Sender: TObject);
    procedure edRFC_CNBVExit(Sender: TObject);
    procedure edCVE_METODOLOGIAExit(Sender: TObject);
    procedure edCVE_RIESGO_PAISExit(Sender: TObject);
    procedure edCVE_RIESGO_FINANExit(Sender: TObject);
    procedure edCVE_RIESGO_INDUSExit(Sender: TObject);
    procedure chkB_ENTIDAD_FINExit(Sender: TObject);
    procedure btCVE_METODOLOGIAClick(Sender: TObject);
    procedure ilCVE_METODOLOGIAEjecuta(Sender: TObject);
    procedure btRECUP_ACREDITAClick(Sender: TObject);
    procedure MetVar_GridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure pgAltaDatosChange(Sender: TObject);
    procedure btCargaMasivaClick(Sender: TObject);
    procedure MetVar_GridValidateEdit(Sender: TObject; col, row: Integer;
      var result: Boolean);
    procedure btSalvaCambiosAnexo18Click(Sender: TObject);
    procedure btCancelarAnexo18Click(Sender: TObject);
    procedure MetVar_GridAfterEdit(Sender: TObject; col, row: Integer);
    procedure btCve_aveClick(Sender: TObject);
    procedure edCve_AveExit(Sender: TObject);
    procedure MetVar_GridShowHintCell(Sender: TObject; col, row: Integer;
      var HintStr: String; var CanShow: Boolean; var HintInfo: THintInfo);
    procedure pgAltaDatosChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure bbAlta_ProyClick(Sender: TObject);
    procedure bbModificar_ProyClick(Sender: TObject);
    procedure bbGuardar_ProyClick(Sender: TObject);
    procedure bbCancelar_ProyClick(Sender: TObject);
    procedure bbBuscar_ProyClick(Sender: TObject);
    procedure bbProyectos_ContProyClick(Sender: TObject);
    procedure bbMetodologia_ContProyClick(Sender: TObject);
    procedure bbGuardar_ContProyClick(Sender: TObject);
    procedure bbCancelar_ContProyClick(Sender: TObject);
    procedure btCve_BuroClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btCVE_CARTERA_R04Click(Sender: TObject);
    procedure mnuSPPIXAcreditadosClick(Sender: TObject);
    procedure mnuConfiguracionModelosClick(Sender: TObject);
    procedure mnuRegistrodeGarantasClick(Sender: TObject);
    private
    { Private declarations }
       bB_AUTORIZADO : Boolean;
       EstadoAnexo19: TEstadoAnexo19;
       Procedure verificadatos;
       Procedure ConciliaSaldos;
       function  AplicaExcesos : Boolean;
       Procedure BitExcesos;
       Procedure CalculaImpDisponible;
       procedure MuestraImportes;
       procedure HabilitaIncreDecre;
       procedure HabilitaEdityFechaIncreDecre( peB_HABILITA : Boolean );
       procedure HabilitaCtrlsIncreDecre( peB_HABILITA : Boolean );
       procedure HabilitaEstadosyMunicipios (peB_Habilita: boolean);
       procedure HabilitaAnexo19 (peB_Habilita: boolean);
       function ValidaRFC(sPerJur, sS_RFC, sF_RFC, sH_RFC: String): Boolean;
       function GuardaBitacoraRFC: Boolean;
       function validaDireccionCNBV(strAcreditado : string) : string;
       function MetVar_ValidaCamposObligatorios: boolean;
       function MetVar_ValidaCampos_Anexo19: boolean;
       procedure MetVar_ConfiguraGrid (Grid: TStringAlignGrid);
       procedure MetVar_CargaGrid (Grid: TStringAlignGrid; Id_Acreditado: Integer; Met: String);
       procedure MetVar_GuardarDatos (Grid: TStringAlignGrid; Id_Acreditado: Integer; Met: String; var psError: Integer; var psMsgError: String);
       procedure MetVar_CargaGridAnexo19 (Grid: TStringAlignGrid);
       procedure Application_Idle (Sender: TObject; var Done: Boolean);
       procedure MetVar_ValidaCveMetodologia;
       procedure MetVar_CargaContratosAnexo19;
       function MetVar_HayContratosAmbiguosAnexo19: boolean;
    public
    { Public declarations }
    Objeto : TCrAcredit;
end;
 TCrAcredit= class(TInterFrame)
      private
        vgCalif     : String;
        vgActualiza : Boolean;
        vgActExceso : Boolean;
        vgImpExcOld : Double;
        vgCveAfecIncDec : String;
        vgFvtExcOld : TDateTime;
        vgFIniExcOld: TDateTime;
    procedure ObtenDescripcion(peStrSQL, peStrNomCampo: String;
      peCVE_INTERCAMPO, peDESC_INTERCAMPO: TInterCampo);
    function ObtenNombre(peID_PERSONA: String; var PPResultado: String): Boolean;
    function ObtenPerJuriica(peID_PERSONA: String;
      var PPResultado: String): Boolean;
      protected
      public
        { Public declarations }
        ID_ACREDITADO            : TInterCampo;
        IMP_MAX_AUTOR            : TInterCampo;
        IMP_MINIMO_AUTOR         : TInterCampo;
        IMP_DISPUESTO            : TInterCampo;
        IMP_CAP_VIG              : TInterCampo;//EASA4011 21/05/2004
        IMP_CAP_IMP              : TInterCampo;//EASA4011 21/05/2004
        IMP_CAP_VEN              : TInterCampo;//EASA4011 21/05/2004
        IMP_CAP_ACTUAL           : TInterCampo;//EASA4011 07/05/2004
        IMP_REF_VIG              : TInterCampo;//EASA4011 21/05/2004
        IMP_REF_IMP              : TInterCampo;//EASA4011 21/05/2004
        IMP_REF_VEN              : TInterCampo;//EASA4011 21/05/2004
        IMP_REF_ACTUAL           : TInterCampo;//EASA4011 21/05/2004
        IMP_TOT_VIG              : TInterCampo;//EASA4011 21/05/2004
        IMP_TOT_IMP              : TInterCampo;//EASA4011 21/05/2004
        IMP_TOT_VEN              : TInterCampo;//EASA4011 21/05/2004
        IMP_TOT_ACTUAL           : TInterCampo;//EASA4011 21/05/2004
        PLAZO_MAX_LINEA          : TInterCampo;
        PLAZO_MIN_LINEA          : TInterCampo;
        B_ACREDITADO_REL         : TInterCampo;
        TIPO_ACRED_REL           : TInterCampo;
        CVE_GRUPO_ECO            : TInterCampo;
        CVE_SECTOR_ECO           : TInterCampo;
        CVE_TAM_ACRED            : TInterCampo;
        CVE_CALIFACION           : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        B_AUTORIZADO             : TInterCampo;
        F_AUTORIZACION           : TInterCampo;
        CVE_USU_AUTORIZA         : TInterCampo;
        SIT_ACREDITADO           : TInterCampo;
        CVE_GPO_CAPITALIZ        : TInterCampo;//ELIMINAR
        B_ACT_EMP                : TInterCampo;
        B_APLI_REL_MON           : TInterCampo;
        DIAS_PAGO                : TInterCampo;
        DIAS_ADICIONALES         : TInterCampo;
        CVE_LOCAL_CNBV           : TInterCampo;
        CVE_SENICREB             : TInterCampo;
        CVE_TIPO_RELAC           : TInterCampo;
        B_INF_EXP_PAGO           : TInterCampo;
        B_AVALA_GOB_EDO          : TInterCampo;//EASA4011       18/02/2005      GOBIERNOS
        CALIF_CALIFICADORA       : TInterCampo;//EASA4011       18/02/2005      GOBIERNOS
        PCT_PONDERACION          : TInterCampo;//EASA4011       18/02/2005      GOBIERNOS
        IMP_EXCESO_EVE           : TInterCampo;//EASA4011       23/01/2006
        F_VTO_EXCESO             : TInterCampo;//EASA4011       23/01/2006
        F_INI_EXCESO             : TInterCampo;//EASA4011       23/01/2006
        IMP_TOT_AUT              : TInterCampo;//EASA4011       23/01/2006

        CVE_TIP_DISPOS           : TInterCampo;//SATV4766       19/05/2006    CREDITO EN LINEA
        IMP_TOT_DISPONIB         : TInterCampo;//SATV4766       19/05/2006    CREDITO EN LINEA
        IMP_TOT_BLOQUEADO        : TInterCampo;//SATV4766       19/05/2006    CREDITO EN LINEA
        CVE_AFEC_INC_DEC         : TInterCampo;//SATV4766       19/05/2006    CREDITO EN LINEA

        CVE_PER_JUR_REG          : TInterCampo;
        DESC_CVE_PER_JUR_REG     : TInterCampo;
        NOM_ACRED_REG            : TInterCampo;
        NUM_EMPLEADOS            : TInterCampo;
        RFC_CNBV                 : TInterCampo;

        CVE_RIESGO_PAIS          : TInterCampo;//SATV4766       18/08/2009
        CVE_RIESGO_FINAN         : TInterCampo;//SATV4766       18/08/2009
        CVE_RIESGO_INDUS         : TInterCampo;//SATV4766       18/08/2009
        CVE_METODOLOGIA          : TInterCampo;//SATV4766       18/08/2009
        B_ENTIDAD_FIN            : TInterCampo;//SATV4766       18/08/2009
        DESC_METODOLOGIA         : TInterCampo;//SATV4766       18/08/2009
        RFC_ACRED                : TInterCampo;
        //SIGLAS_RFC               : TInterCampo;

        CVE_BURO                 : TInterCampo;
        DESC_BURO                : TInterCampo;

        //Campo AVE
        CVE_AVE                  :TInterCampo;
        //NUEVOS REPORTES COMERCIAL
        CVE_ACREDIT_CNBV         : TInterCampo;
        DESC_ACREDIT_CNBV        : TInterCampo;
        CVE_CARTERA_R04          : TInterCampo;
        DESC_CARTERA_R04         : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Persona                  : TPersona;
        TipoAcred                : TCrTAcre;
        GrupoEco                 : TCrGrupEco;
        SectorEco                : TCrSectEco;
        SecTamAcre               : TCrSeTaAc;
        CalAcr                   : TCrCalAcr;
        PctCapitaliza            : TCrPctCapi;
        LocalCNBV                : TCrRePaCnb;
        Senicreb                 : TCrSen;
        TipoRel                  : TCrTipRel;
        DetImpagado              : TCrCartrIm;


        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    SusContratosAplicanIncDec : Boolean;
        Procedure   ObtenSaldoSitDisp(pIdAcreditado : Integer);
        procedure   RestauraValoresOriginales;
        function    StpImpAcredTotDisp(peNUM_METODO      : Integer;
                                       peID_ACREDITADO   : Integer;
                                       peID_CONTRATO     : Integer;
                                       peCVE_TIP_DISPOS  : String;
                                       peIMP_MAX_AUTOR   ,
                                       peIMP_EXCESO_EVE  : Double;
                                       peCVE_AFEC_INC_DEC: String;
                                       peB_TIPO_CAMBIO   : String;
                                       var psIMP_DISPONIBLE : Double;
                                       var psRESULTADO   : Integer;
                                       var psTX_RESULTADO : String
                                       ) : Boolean;
        function    StpImpAcredTotBloq(var psIMP_BLOQUEADO   : Double;
                                       var psRESULTADO       : Integer;
                                       var psTX_RESULTADO    : String
                                       ) : Boolean;
      published
      end;                                    


implementation             

uses  IntCrCalDia,    //Calculo de los días
      IntCrCnPrAcc,   //Comisiones x acreditado
      IntCrAccioni,
      IntCrReAcMn,    //Relación Moneda Acreditado
      IntMRecTra,     //Tramites de Documentos
      IntCrCalCons,   //Consulta Calificaciones por Acreditado
      IntCrCalAcre,   //Calificación Acreditado por Calificadora
      IntCrAutExAc,   //Módulo de Excesos

      IntCrAcreRe,    //Acreditados Recuperación

      IntAcreditSPPI,    // Unidad de Severidad de la Perdida y Probabilidad de Incumplimiento
      IntCrAcrCarMas,    // Unidad para la carga masiva de la Informacion de Estados y Municipios
      IntMetAcred,       // Asignacion de Modelos - Metodología Comercial
      IntMRegistro,      // Registro de Garantias

      IntCrSoExAc;    //Bitácora de Excesos



{$R *.DFM}

constructor TCrAcredit.Create( AOwner : TComponent );
begin Inherited;
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
                ID_ACREDITADO.Caption:='Acreditado';
      IMP_MAX_AUTOR :=CreaCampo('IMP_MAX_AUTOR',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MAX_AUTOR.Caption:='Máximo';
      IMP_MINIMO_AUTOR :=CreaCampo('IMP_MINIMO_AUTOR',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MINIMO_AUTOR.Caption:='Minimo';
      IMP_DISPUESTO :=CreaCampo('IMP_DISPUESTO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_DISPUESTO.Caption:='Imp. Dispuesto';
      IMP_CAP_VIG :=CreaCampo('IMP_CAP_VIG',ftFloat,tsNinguno,tsNinguno,False);
      IMP_CAP_IMP :=CreaCampo('IMP_CAP_IMP',ftFloat,tsNinguno,tsNinguno,False);
      IMP_CAP_VEN :=CreaCampo('IMP_CAP_VEN',ftFloat,tsNinguno,tsNinguno,False);
      IMP_CAP_ACTUAL :=CreaCampo('IMP_CAP_ACTUAL',ftFloat,tsNinguno,tsNinguno,False);
      IMP_REF_VIG :=CreaCampo('IMP_REF_VIG',ftFloat,tsNinguno,tsNinguno,False);
      IMP_REF_IMP :=CreaCampo('IMP_REF_IMP',ftFloat,tsNinguno,tsNinguno,False);
      IMP_REF_VEN :=CreaCampo('IMP_REF_VEN',ftFloat,tsNinguno,tsNinguno,False);
      IMP_REF_ACTUAL :=CreaCampo('IMP_REF_ACTUAL',ftFloat,tsNinguno,tsNinguno,False);
      IMP_TOT_VIG :=CreaCampo('IMP_TOT_VIG',ftFloat,tsNinguno,tsNinguno,False);
      IMP_TOT_IMP :=CreaCampo('IMP_TOT_IMP',ftFloat,tsNinguno,tsNinguno,False);
      IMP_TOT_VEN :=CreaCampo('IMP_TOT_VEN',ftFloat,tsNinguno,tsNinguno,False);
      IMP_TOT_ACTUAL :=CreaCampo('IMP_TOT_ACTUAL',ftFloat,tsNinguno,tsNinguno,False);
      PLAZO_MAX_LINEA :=CreaCampo('PLAZO_MAX_LINEA',ftFloat,tsNinguno,tsNinguno,True);
                PLAZO_MAX_LINEA.Caption:='Máximo';
      PLAZO_MIN_LINEA :=CreaCampo('PLAZO_MIN_LINEA',ftFloat,tsNinguno,tsNinguno,True);
                PLAZO_MIN_LINEA.Caption:='Minimo';
      B_ACREDITADO_REL :=CreaCampo('B_ACREDITADO_REL',ftString,tsNinguno,tsNinguno,True);
                B_ACREDITADO_REL.Caption:='Aplica Articulo';
      TIPO_ACRED_REL :=CreaCampo('TIPO_ACRED_REL',ftString,tsNinguno,tsNinguno,True);
                TIPO_ACRED_REL.Caption:='Tipo Acreditado';
      CVE_GRUPO_ECO :=CreaCampo('CVE_GRUPO_ECO',ftString,tsNinguno,tsNinguno,True);
                CVE_GRUPO_ECO.Caption:='Grupo Económico';
      CVE_SECTOR_ECO :=CreaCampo('CVE_SECTOR_ECO',ftString,tsNinguno,tsNinguno,True);
                CVE_SECTOR_ECO.Caption:='Sector Económico';
      CVE_TAM_ACRED :=CreaCampo('CVE_TAM_ACRED',ftString,tsNinguno,tsNinguno,True);
                CVE_TAM_ACRED.Caption:='Tamaño Acreditado';
      CVE_LOCAL_CNBV :=CreaCampo('CVE_LOCAL_CNBV',ftString,tsNinguno,tsNinguno,True);
                CVE_LOCAL_CNBV.Caption:='Región Acreditado';
      CVE_CALIFACION :=CreaCampo('CVE_CALIFACION',ftString,tsNinguno,tsNinguno,True);
                CVE_CALIFACION.Caption:='Califación';
      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Usuario';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      B_AUTORIZADO :=CreaCampo('B_AUTORIZADO',ftString,tsNinguno,tsNinguno,True);
                B_AUTORIZADO.Caption:='Autorizado por disposiciones';
      F_AUTORIZACION :=CreaCampo('F_AUTORIZACION',ftDateTime,tsNinguno,tsNinguno,True);
                F_AUTORIZACION.Caption:='Fecha Autorizacion';
      CVE_USU_AUTORIZA :=CreaCampo('CVE_USU_AUTORIZA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_AUTORIZA.Caption:='Usu Autoriza';
      SIT_ACREDITADO :=CreaCampo('SIT_ACREDITADO',ftString,tsNinguno,tsNinguno,True);
         With SIT_ACREDITADO do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
                ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
          end;
                SIT_ACREDITADO.Caption:='Situación del Acreditado';
      CVE_GPO_CAPITALIZ :=CreaCampo('CVE_GPO_CAPITALIZ',ftString,tsNinguno,tsNinguno,True);//ELIMINAR
                CVE_GPO_CAPITALIZ.Caption:='Grupo de Capitalización';
      B_ACT_EMP :=CreaCampo('B_ACT_EMP',ftString,tsNinguno,tsNinguno,True);
                B_ACT_EMP.Caption:='Persona Física con Actividad Empresarial';
      B_APLI_REL_MON :=CreaCampo('B_APLI_REL_MON',ftString,tsNinguno,tsNinguno,True);
                B_APLI_REL_MON.Caption:='Autorizado por Disposiciones';
      DIAS_PAGO :=CreaCampo('DIAS_PAGO',ftInteger,tsNinguno,tsNinguno,True);
         With DIAS_PAGO do
          begin Size:=1;
                UseCombo:=True;
                ComboLista.Add('NO APLICA');    ComboDatos.Add('0');
                ComboLista.Add('LUNES');        ComboDatos.Add('2');
                ComboLista.Add('MARTES');       ComboDatos.Add('3');
                ComboLista.Add('MIERCOLES');    ComboDatos.Add('4');
                ComboLista.Add('JUEVES');       ComboDatos.Add('5');
                ComboLista.Add('VIERNES');      ComboDatos.Add('6');
          end;
                DIAS_PAGO.Caption:='Día de Pago';
      DIAS_ADICIONALES :=CreaCampo('DIAS_ADICIONALES',ftInteger,tsNinguno,tsNinguno,True);
                DIAS_ADICIONALES.Caption:='Días Adicionales de Pago';

      CVE_SENICREB :=CreaCampo('CVE_SENICREB',ftString,tsNinguno,tsNinguno,True);
                CVE_SENICREB.Caption:='Cve. SENICREB';
      CVE_TIPO_RELAC :=CreaCampo('CVE_TIPO_RELAC',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_RELAC.Caption:='Cve. Tipo Relac';
      B_INF_EXP_PAGO :=CreaCampo('B_INF_EXP_PAGO',ftString,tsNinguno,tsNinguno,True);
                B_INF_EXP_PAGO.Caption:='Aplica Informe Experienci de Pago';
      B_AVALA_GOB_EDO :=CreaCampo('B_AVALA_GOB_EDO',ftString,tsNinguno,tsNinguno,True);
                B_AVALA_GOB_EDO.Caption:='Avala gobierno del Edo.';
      CALIF_CALIFICADORA :=CreaCampo('CALIF_CALIFICADORA',ftString,tsNinguno,tsNinguno,False);
      PCT_PONDERACION :=CreaCampo('PCT_PONDERACION',ftFloat,tsNinguno,tsNinguno,False);
      IMP_EXCESO_EVE :=CreaCampo('IMP_EXCESO_EVE',ftFloat,tsNinguno,tsNinguno,True);
                IMP_EXCESO_EVE.Caption:='Importe del Exceso Eventual';
      F_VTO_EXCESO :=CreaCampo('F_VTO_EXCESO',ftDate,tsNinguno,tsNinguno,True);
                F_VTO_EXCESO.Caption:='Fecha Vto. del Exceso';
      F_INI_EXCESO :=CreaCampo('F_INI_EXCESO',ftDate,tsNinguno,tsNinguno,True);
                B_AVALA_GOB_EDO.Caption:='Fecha Inicio del Exceso';
      IMP_TOT_AUT :=CreaCampo('IMP_TOT_AUT',ftFloat,tsNinguno,tsNinguno,False);

      CVE_TIP_DISPOS :=CreaCampo('CVE_TIP_DISPOS',ftString,tsNinguno,tsNinguno,True);
                CVE_TIP_DISPOS.Caption:='Tipo de Disposición de Autorización';
     With CVE_TIP_DISPOS do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0');    ComboDatos.Add('MA');
                ComboLista.Add('1');    ComboDatos.Add('IN');
          end;
      CVE_AFEC_INC_DEC := CreaCampo('CVE_AFEC_INC_DEC',ftString,tsNinguno,tsNinguno,True);
                CVE_AFEC_INC_DEC.Caption:='Afectación de Incremento/Decremento';
      With CVE_AFEC_INC_DEC Do
         Begin  Size := 1;
                UseCombo := True;
                ComboLista.Add('Inc/Dec No Aplica'); ComboDatos.Add('N');
                ComboLista.Add('Imp. Incremento');   ComboDatos.Add('I');
                ComboLista.Add('Imp. Decremento');   ComboDatos.Add('D');
         End;
      IMP_TOT_DISPONIB :=CreaCampo('IMP_TOT_DISPONIB',ftFloat,tsNinguno,tsNinguno,False);
                IMP_TOT_DISPONIB.Caption:='Importe Total Disponible';
      IMP_TOT_BLOQUEADO :=CreaCampo('IMP_TOT_BLOQUEADO',ftFloat,tsNinguno,tsNinguno,False);
                IMP_TOT_BLOQUEADO.Caption:='Importe Total Bloqueado';


      CVE_PER_JUR_REG          := CreaCampo('CVE_PER_JUR_REG',ftString,tsNinguno,tsNinguno,True);
      DESC_CVE_PER_JUR_REG     := CreaCampo('DESC_CVE_PER_JUR_REG',ftString,tsNinguno,tsNinguno,False);
      NOM_ACRED_REG            := CreaCampo('NOM_ACRED_REG',ftString,tsNinguno,tsNinguno,True);
      NUM_EMPLEADOS            := CreaCampo('NUM_EMPLEADOS',ftInteger,tsNinguno,tsNinguno,True);
      RFC_CNBV                 := CreaCampo('RFC_CNBV',ftString,tsNinguno,tsNinguno,True); //MAGV 2009-10-22

      //Campo clave AVE
      CVE_AVE                  := CreaCampo('Cve_Ave',ftInteger,tsNinguno,tsNinguno,True);

      // NUEVA METODOLOGIA COMERCIAL
      CVE_ACREDIT_CNBV         := CreaCampo('CVE_ACREDIT_CNBV',ftString,tsNinguno,tsNinguno,True);
      DESC_ACREDIT_CNBV        := CreaCampo('DESC_ACREDIT_CNBV',ftString,tsNinguno,tsNinguno,false);
      CVE_CARTERA_R04         := CreaCampo('CVE_CARTERA_R04',ftString,tsNinguno,tsNinguno,True);
      DESC_CARTERA_R04        := CreaCampo('DESC_CARTERA_R04',ftString,tsNinguno,tsNinguno,false);

      // Inicia Cambios <SATV4766  18 Ago 2009>
      CVE_RIESGO_PAIS          := CreaCampo('CVE_RIESGO_PAIS',ftString,tsNinguno,tsNinguno,True);
      CVE_RIESGO_FINAN         := CreaCampo('CVE_RIESGO_FINAN',ftString,tsNinguno,tsNinguno,True);
      CVE_RIESGO_INDUS         := CreaCampo('CVE_RIESGO_INDUS',ftString,tsNinguno,tsNinguno,True);
      CVE_METODOLOGIA          := CreaCampo('CVE_METODOLOGIA',ftString,tsNinguno,tsNinguno,True);
      B_ENTIDAD_FIN            := CreaCampo('B_ENTIDAD_FIN',ftString,tsNinguno,tsNinguno,True);
      DESC_METODOLOGIA         := CreaCampo('DESC_METODOLOGIA',ftString,tsNinguno,tsNinguno,False);
      // Termina Cambios  <SATV4766  18 Ago 2009>
      RFC_ACRED                := CreaCampo('RFC_ACRED',ftString,tsNinguno,tsNinguno,False);
      //SIGLAS_RFC             := CreaCampo('SIGLAS_RFC',ftString,tsNinguno,tsNinguno,True);

      CVE_BURO                 := CreaCampo('CVE_BURO',  ftString, tsNinguno, tsNinguno, True);
      CVE_BURO.Caption         := 'Clave Buró';
      DESC_BURO                := CreaCampo('DESC_BURO', ftString, tsNinguno, tsNinguno, False);

      FKeyFields.Add('ID_ACREDITADO');

      TableName := 'CR_ACREDITADO';
      UseQuery := True;
      HelpFile := 'IntCrAcredit.Hlp';
      ShowMenuReporte:=True;

      {$WARNINGS OFF}
      Persona := TPersona.Create(Self);
      {$WARNINGS ON}
      Persona.MasterSource:=Self;
      Persona.FieldByName('ID_PERSONA').MasterField:='ID_ACREDITADO';
      //RIRA4281 17Jun2010 Se filtran los acreditados activos y las personas activas
      Persona.BuscaWhereString := ' PERSONA.ID_PERSONA IN (SELECT ID_ACREDITADO FROM CR_ACREDITADO WHERE SIT_ACREDITADO = ''AC'') AND PERSONA.SIT_PERSONA = ''AC''';
      Persona.FilterString := Persona.BuscaWhereString;

      {$WARNINGS OFF}
      TipoAcred := TCrTAcre.Create(Self);
      {$WARNINGS ON}
      TipoAcred.MasterSource:=Self;
      TipoAcred.FieldByName('TIPO_ACRED_REL').MasterField:='TIPO_ACRED_REL';

      {$WARNINGS OFF}
      GrupoEco := TCrGrupEco.Create(Self);
      {$WARNINGS ON}
      GrupoEco.MasterSource:=Self;
      GrupoEco.FieldByName('CVE_GRUPO_ECO').MasterField:='CVE_GRUPO_ECO';

      {$WARNINGS OFF}
      SectorEco := TCrSectEco.Create(Self);
      {$WARNINGS ON}
      SectorEco.MasterSource:=Self;
      SectorEco.FieldByName('CVE_SECTOR_ECO').MasterField:='CVE_SECTOR_ECO';

      {$WARNINGS OFF}
      SecTamAcre := TCrSeTaAc.Create(Self);
      {$WARNINGS ON}      
      SecTamAcre.MasterSource:=Self;
      SecTamAcre.FieldByName('CVE_TAM_ACRED').MasterField:='CVE_TAM_ACRED';

      {$WARNINGS OFF}
      CalAcr := TCrCalAcr.Create(Self);
      {$WARNINGS ON}
      CalAcr.MasterSource:= Self;
      CalAcr.FieldByName('CVE_CALIFICACION').MasterField:= 'CVE_CALIFACION';

      {$WARNINGS OFF}
      PctCapitaliza := TCrPctCapi.Create(Self);//ELIMINAR
      {$WARNINGS ON}
      PctCapitaliza.MasterSource:= Self;
      PctCapitaliza.FieldByName('CVE_GPO_CAPITALIZ').MasterField:= 'CVE_GPO_CAPITALIZ';

      {$WARNINGS OFF}
      LocalCNBV := TCrRePaCnb.Create(Self);
      {$WARNINGS ON}
      LocalCNBV.MasterSource:= Self;
      LocalCNBV.FieldByName('CVE_LOCAL_CNBV').MasterField:= 'CVE_LOCAL_CNBV';

      {$WARNINGS OFF}
      Senicreb := TCrSen.Create(Self);
      {$WARNINGS ON}
      Senicreb.MasterSource:=Self;
      Senicreb.FieldByName('CVE_SENICREB').MasterField:='CVE_SENICREB';

      {$WARNINGS OFF}
      TipoRel := TCrTipRel.Create(Self);
      {$WARNINGS ON}
      TipoRel.MasterSource:=Self;
      TipoRel.FieldByName('CVE_TIPO_RELAC').MasterField:='CVE_TIPO_RELAC';

      {$WARNINGS OFF}
      DetImpagado := TCrCartrIm.Create(Self);
      {$WARNINGS ON}
      DetImpagado.MasterSource:=Self;
      DetImpagado.FieldByName('ID_ACREDITADO').MasterField:='ID_ACREDITADO';

      DecimalSeparator:= '.';
  thousandseparator:=',';


end;

Destructor TCrAcredit.Destroy;
begin
     if Persona <> nil then
        Persona.free;
     //end if;

     if TipoAcred <> nil then
        TipoAcred.Free;
     //end if;

     if GrupoEco <> nil then
        GrupoEco.Free;
     //end if;

     if SectorEco <> nil then
        SectorEco.Free;
     //end if;

     if SecTamAcre <> nil then
        SecTamAcre.Free;
     //end if;

     if CalAcr <> nil then
        CalAcr.Free;
     //end if

     if PctCapitaliza <> nil then
        PctCapitaliza.free;
     //en if

     if LocalCNBV <> nil then
        LocalCNBV.free;
     //en if

     if Senicreb <> nil then
        Senicreb.Free;
     //en if

     if TipoRel <> nil then
        TipoRel.Free;
     //en if

     inherited;
end;


function TCrAcredit.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAcreditado;
begin
   W:=TWCrAcreditado.Create(Self);
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

Function TCrAcredit.InternalBusca:Boolean;
begin
   Result := False;
   if Persona.Busca then
      InternalBusca := FindKey([Persona.ID_PERSONA.AsInteger]);
   //end if
end;

{----------------------------------------------------------------------------------------------------------------------
                OBTIENE LO DISPONIBLE DEL ACREDITADO Y EL DISPONIBLE POR GRUPO
----------------------------------------------------------------------------------------------------------------------}
Procedure   TCrAcredit.ObtenSaldoSitDisp(pIdAcreditado : Integer);
var StpObtSaldosAcred :  TStoredProc;
Begin
    StpObtSaldosAcred := TStoredProc.Create(Self);
    try
       with StpObtSaldosAcred do
       begin
          StpObtSaldosAcred.DatabaseName:= Apli.DatabaseName;
          StpObtSaldosAcred.SessionName:= Apli.SessionName;
          StpObtSaldosAcred.StoredProcName:='PKGCRSALDOS.STPOBTSALDOSACRED';

          Params.Clear;
          Params.CreateParam(ftFloat,'PEIDACREDITADO',ptInput);
          Params.CreateParam(ftFloat,'PSCAPVIGENTE',ptOutput);
          Params.CreateParam(ftFloat,'PSCAPIMPAGADO',ptOutput);
          Params.CreateParam(ftFloat,'PSCAPVENCIDO',ptOutput);
          Params.CreateParam(ftFloat,'PSCAPACTUAL',ptOutput);  // EASA4011 07/05/2004
          Params.CreateParam(ftFloat,'PSFINVIGENTE',ptOutput);
          Params.CreateParam(ftFloat,'PSFINIMPAGADO',ptOutput);
          Params.CreateParam(ftFloat,'PSFINVENCIDO',ptOutput);
          Params.CreateParam(ftFloat,'psFINACTUAL',ptOutput); // EASA4011 07/05/2004
          Params.CreateParam(ftFloat,'PSTOTVIGENTE',ptOutput);
          Params.CreateParam(ftFloat,'PSTOTIMPAGADO',ptOutput);
          Params.CreateParam(ftFloat,'PSTOTVENCIDO',ptOutput);
          Params.CreateParam(ftFloat,'PSTOTACTUAL',ptOutput);      // EASA4011 07/05/2004
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peIdAcreditado').AsInteger := pIdAcreditado;
          ExecProc;

          if ParamByName('PSResultado').AsInteger = 0 then
          begin
             IMP_CAP_VIG.AsFloat := ParambyName('PSCAPVIGENTE').AsFloat;
             IMP_CAP_IMP.AsFloat := ParamByName('PSCAPIMPAGADO').AsFloat;
             IMP_CAP_VEN.AsFloat := ParambyName('PSCAPVENCIDO').AsFloat;
             IMP_CAP_ACTUAL.AsFloat := ParamByName('PSCAPACTUAL').AsFloat;
             IMP_REF_VIG.AsFloat := ParamByName('PSFINVIGENTE').AsFloat;
             IMP_REF_IMP.AsFloat := ParamByName('PSFINIMPAGADO').AsFloat;
             IMP_REF_VEN.AsFloat := ParamByName('PSFINVENCIDO').AsFloat;
             IMP_REF_ACTUAL.AsFloat := ParamByName('psFINACTUAL').AsFloat; // EASA4011 07/05/2004
             IMP_TOT_VIG.AsFloat := ParamByName('PSTOTVIGENTE').AsFloat;
             IMP_TOT_IMP.AsFloat := ParamByName('PSTOTIMPAGADO').AsFloat;
             IMP_TOT_VEN.AsFloat := ParamByName('PSTOTVENCIDO').AsFloat;
             IMP_TOT_ACTUAL.AsFloat := ParamByName('PSTOTACTUAL').AsFloat;      // EASA4011 07/05/2004
          end
          else
          Begin
             ShowMessage('Error en ' + ParamByName('psRESULTADO').AsString +
                         ': ' + ParamByName('psTxResultado').AsString);
          end;
          UnPrepare;
       end;
    finally
       StpObtSaldosAcred.Free;
    end;
end;

procedure TCrAcredit.RestauraValoresOriginales;
begin
  CVE_AFEC_INC_DEC.AsString := vgCveAfecIncDec;
  IMP_EXCESO_EVE.AsFloat    := vgImpExcOld;
  F_VTO_EXCESO.AsDateTime   := vgFvtExcOld;
  F_INI_EXCESO.AsDateTime   := vgFIniExcOld;
end;

// Inicia Modificaciones por SATV4766 el 19JUL2006
function TCrAcredit.StpImpAcredTotBloq(var psIMP_BLOQUEADO   : Double;
                                       var psRESULTADO       : Integer;
                                       var psTX_RESULTADO    : String
                                       ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := True; psIMP_BLOQUEADO := -1;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRSALDOS.STPOBTIMPACREDTOTBLOQ';
       DataBaseName   := Apli.DataBaseName;
       SessionName    := Apli.SessionName;
       Params.CreateParam(ftInteger ,'peID_ACREDITADO'  , ptInput);
       Params.CreateParam(ftFloat   ,'psIMP_BLOQUEADO'  , ptOutput);
       Params.CreateParam(ftString  ,'psRESULTADO'      , ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO'   , ptOutput);
       // Asigna Valores
       ParamByName('peID_ACREDITADO').AsInteger := ID_ACREDITADO.AsInteger;
       ExecProc;

       vlbResult := (ParamByName('psRESULTADO').AsInteger = 0);
       If Not vlbResult Then
         MessageDlg(ParamByName('psTX_RESULTADO').AsString, mtError, [mbOk], 0)
       Else
         psIMP_BLOQUEADO := ParamByName('psIMP_BLOQUEADO').AsFloat;
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
End;

function TCrAcredit.StpImpAcredTotDisp(peNUM_METODO      : Integer;
                                       peID_ACREDITADO   : Integer;
                                       peID_CONTRATO     : Integer;
                                       peCVE_TIP_DISPOS  : String;
                                       peIMP_MAX_AUTOR   ,
                                       peIMP_EXCESO_EVE  : Double;
                                       peCVE_AFEC_INC_DEC: String;
                                       peB_TIPO_CAMBIO   : String;
                                       var psIMP_DISPONIBLE : Double;
                                       var psRESULTADO   : Integer;
                                       var psTX_RESULTADO : String
                                       ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := True; psIMP_DISPONIBLE := 0;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRSALDOS.STPIMPACREDTOTDISP';
       DataBaseName   := Apli.DataBaseName;
       SessionName    := Apli.SessionName;
       Params.CreateParam(ftInteger ,'peNUM_METODO'     , ptInput);
       Params.CreateParam(ftInteger ,'peID_ACREDITADO'  , ptInput);
       Params.CreateParam(ftInteger ,'peID_CONTRATO'    , ptInput);
       Params.CreateParam(ftString  ,'peCVE_TIP_DISPOS' , ptInput);
       Params.CreateParam(ftFloat   ,'peIMP_MAX_AUTOR'  , ptInput);
       Params.CreateParam(ftFloat   ,'peIMP_EXCESO_EVE' , ptInput);
       Params.CreateParam(ftString  ,'peCVE_AFEC_INC_DEC', ptInput);
       Params.CreateParam(ftString  ,'peB_TIPO_CAMBIO'  , ptInput);
       Params.CreateParam(ftFloat   ,'psIMP_DISPONIBLE' , ptOutput);
       Params.CreateParam(ftInteger ,'psRESULTADO'      , ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO'   , ptOutput);
       // Asigna Valores
       ParamByName('peID_ACREDITADO').AsInteger := peID_ACREDITADO;
       // Asigna el número de Autorización
       If (peID_CONTRATO <= 0) Then
         ParamByName('peID_CONTRATO').Clear
       Else
         ParamByName('peID_CONTRATO').AsInteger := peID_CONTRATO;
       // Asigna el Tipo de Disposición
       If (Trim(peCVE_TIP_DISPOS) = '') Then
         ParamByName('peCVE_TIP_DISPOS').Clear
       Else
         ParamByName('peCVE_TIP_DISPOS').AsString := peCVE_TIP_DISPOS;
       // Asigna el importe Máximo Autorizado
       If (peIMP_MAX_AUTOR < 0) Then
         ParamByName('peIMP_MAX_AUTOR').Clear
       Else
         ParamByName('peIMP_MAX_AUTOR').AsFloat := peIMP_MAX_AUTOR;
       // Asigna el Importe de Incremento/Decremento
       If (peIMP_EXCESO_EVE < 0) Then
         ParamByName('peIMP_EXCESO_EVE').Clear
       Else
         ParamByName('peIMP_EXCESO_EVE').AsFloat := peIMP_EXCESO_EVE;
       // Asigna el Tipo de Cambio si no se indico
       If (Trim(peB_TIPO_CAMBIO) = '') Then
         peB_TIPO_CAMBIO := CFALSO;

       ParamByName('peNUM_METODO').AsInteger      := peNUM_METODO;
       ParamByName('peCVE_AFEC_INC_DEC').AsString := peCVE_AFEC_INC_DEC;
       ParamByName('peB_TIPO_CAMBIO').AsString    := peB_TIPO_CAMBIO;
       // LOLS 15 NOV 2006. Anteriormente asigna nulo o el valor correspondiente
       // dependiendo del valor de entrada (menor a cero o no), por lo tanto
       // esta nueva asignacion ya no es necesaria.
       //ParamByName('peIMP_MAX_AUTOR').AsFloat     := peIMP_MAX_AUTOR;
       //ParamByName('peIMP_EXCESO_EVE').AsFloat    := peIMP_EXCESO_EVE;
       // ENDS LOLS 15 NOV 2006 
       ExecProc;

       vlbResult := (ParamByName('psRESULTADO').AsInteger = 0);
       If vlbResult Then
         psIMP_DISPONIBLE := ParamByName('psIMP_DISPONIBLE').AsFloat
       Else
         MessageDlg(ParamByName('psTX_RESULTADO').AsString, mtError, [mbOk], 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

function  TCrAcredit.SusContratosAplicanIncDec : Boolean;
var vlSQL : String;
    vlTotal : Integer; 
begin
  Result := False;
  vlSQL := ' SELECT COUNT(*) AS TOTAL'+cocRLF+
           ' FROM ( SELECT ID_CONTRATO FROM CONTRATO'+cocRLF+
           '        WHERE ID_TITULAR = '+ID_ACREDITADO.AsString+cocRLF+
           '          AND CVE_TIP_CONTRATO = '+SQLStr('CRED')+cocRLF+
           '      ) CTO,'+cocRLF+
           '      CR_CONTRATO CO,'+cocRLF+
           '      CR_PRODUCTO CP'+cocRLF+
           ' WHERE CO.ID_CONTRATO = CTO.ID_CONTRATO'+cocRLF+
           '   AND CO.SIT_LINEA = '+SQLStr(CSIT_AU)+cocRLF+
           '   AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE'+cocRLF+
           '   AND CP.B_EXCESO_EVE = '+SQLStr(CVERDAD)+cocRLF;


  If GetSQLInt(vlSQL, Apli.DatabaseName, Apli.SessionName, 'TOTAL', vlTOTAL, True) Then
     Result := vlTOTAL > 0;
end;
// Termina Modificaciones por SATV4766

(***********************************************FORMA CR_ACREDITADO********************)
(*                                                                              *)
(*  FORMA DE CR_ACREDITADO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_ACREDITADO********************)

procedure TWCrAcreditado.FormShow(Sender: TObject);
var i: Integer;
begin
   tsEstadosyMunc.TabVisible := False;
   tsAnexo19.TabVisible      := False;
   EstadoAnexo19             := eaInactivo;
   With Objeto Do
     Begin
     lbDempresa.Caption := ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := ParamCre.FECHA.AsString;
     lbDUsuario.Caption := ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

     ID_ACREDITADO.Control:=edID_ACREDITADO;
     IMP_MAX_AUTOR.Control:=edIMP_MAX_AUTOR;
     IMP_MINIMO_AUTOR.Control:=edIMP_MINIMO_AUTOR;
     IMP_CAP_VIG.Control:=edIMP_CAP_VIG;
     IMP_CAP_IMP.Control:=edIMP_CAP_IMP;
     IMP_CAP_VEN.Control:=edIMP_CAP_VEN;
     IMP_CAP_ACTUAL.Control := edIMP_CAP_ACTUAL;
     IMP_REF_VIG.Control:=edIMP_REF_VIG;
     IMP_REF_IMP.Control:=edIMP_REF_IMP;
     IMP_REF_VEN.Control:=edIMP_REF_VEN;
     IMP_REF_ACTUAL.Control := edIMP_REF_ACTUAL;
     IMP_TOT_VIG.Control:=edIMP_TOT_VIG;
     IMP_TOT_IMP.Control:=edIMP_TOT_IMP;
     IMP_TOT_VEN.Control:=edIMP_TOT_VEN;
     IMP_TOT_ACTUAL.Control := edIMP_TOT_ACTUAL;
     B_ACREDITADO_REL.Control:=chB_ACREDITADO_REL;
     TIPO_ACRED_REL.Control:=edTIPO_ACRED_REL;
     CVE_GRUPO_ECO.Control:=edCVE_GRUPO_ECO;
     CVE_SECTOR_ECO.Control:=edCVE_SECTOR_ECO;
     CVE_TAM_ACRED.Control:=edCVE_TAM_ACRED;
     CVE_LOCAL_CNBV.Control:=edCVE_LOCAL_CNBV;
     CVE_SENICREB.Control:=edCVE_SENICREB;
     CVE_TIPO_RELAC.Control:=edCVE_TIPO_RELAC;
     CVE_CALIFACION.Control:=edCVE_CALIFACION;
     B_AUTORIZADO.Control:=chB_AUTORIZADO;
     SIT_ACREDITADO.Control:=rgSIT_ACREDITADO;
     F_ALTA.Control := IEFechaAlta;
     CVE_USU_ALTA.Control := IEUsuarioAlta;
     F_MODIFICA.Control := IEFechaModifica;
     CVE_USU_MODIFICA.Control := IEUsuarioModifica;
     B_ACT_EMP.Control := cbB_ACT_EMP;
     DIAS_PAGO.Control := cbDIAS_PAGO;
     DIAS_ADICIONALES.Control := edDIAS_ADICIONALES;
     B_AVALA_GOB_EDO.Control := chB_AVALA_GOB_EDO;
     IMP_EXCESO_EVE.Control := edIMP_EXCESO_EVE;
     F_VTO_EXCESO.Control := edF_VTO_EXCESO;
     IMP_TOT_AUT.Control := edIMP_TOT_AUT;
     CVE_TIP_DISPOS.Control := rgCVE_TIP_DISPOS; // SATV4766
     IMP_TOT_DISPONIB.Control := edIMP_TOT_DISPONIB; // SATV4766
     IMP_TOT_BLOQUEADO.Control := edIMP_TOT_BLOQUEADO; // SATV4766
     CVE_AFEC_INC_DEC.Control := cbCVE_AFEC_INC_DEC; // SATV4766

     CVE_PER_JUR_REG.Control          := edCVE_PER_JUR_REG;
     DESC_CVE_PER_JUR_REG.Control     := edDESC_CVE_PER_JUR_REG;
     NOM_ACRED_REG.Control            := edNOM_ACRED_REG;
     NUM_EMPLEADOS.Control            := edNUM_EMPLEADOS;
     RFC_CNBV.Control                 := edRFC_CNBV;

     //Campo CVE_AVE
     CVE_AVE.Control                  := edCve_Ave;
     // RUCJ4248 :: NUEVA METODOLOGIA COMERCIAL
     CVE_ACREDIT_CNBV.Control         := edCVE_ACREDIT_CNBV;
     DESC_ACREDIT_CNBV.Control        := edDESC_ACREDIT_CNBV;
     CVE_CARTERA_R04.Control          := edCVE_CARTERA_R04;
     DESC_CARTERA_R04.Control         := edDESC_CARTERA_R04;

     CVE_BURO.Control                 := edClave_Buro;
     DESC_BURO.Control                := edDesc_Buro;

     Persona.Nombre.Control := edDESC_ACREDITADO;
     Persona.Cve_Tipo_Sector.Control := edSECTOR_CORP;

     Persona.Siglas_RFC.Control := ed_SiglasRFC;
     Persona.F_RFC.Control := edF_RFC;
     Persona.Homoclave_RFC.Control := ed_HomoRFC;

     Persona.GetParams(Objeto);

     TipoAcred.DESC_TIPO_ACRED.Control := edTIPO_ACREDITADO;
     TipoAcred.GetParams(Objeto);

     GrupoEco.DESC_AGRUPO_ECO.Control := edGRUPOECO;
     GrupoEco.IMP_MAX_AUTOR.Control := edIMP_MAX_OPERA;
     GrupoEco.GetParams(Objeto);

     SectorEco.DESC_SECTOR_ECO.Control := edDESCRIPSEC;
     SectorEco.GetParams(Objeto);

     SecTamAcre.TamAcred.CVE_TAM_ACRED.Control := edCVE_TAM_ACRED;
     SecTamAcre.TamAcred.DESC_TAM_ACRED.Control := edDESCTAMACRED;
     SecTamAcre.GetParams(Objeto);

     CalAcr.CVE_CALIFICACION.Control := edCVE_CALIFACION;
     CalAcr.DESC_CALIFICA.Control := edDESC_CALIFICA;
     CalAcr.GetParams(Objeto);

     LocalCNBV.CVE_LOCAL_CNBV.Control := edCVE_LOCAL_CNBV;
     LocalCNBV.DESC_LOCAL_CNBV.Control := edDESC_LOCAL_CNBV;
     LocalCNBV.GetParams(Objeto);

     Senicreb.DESC_SENICREB.Control := edSENICREB;
     Senicreb.GetParams(Objeto);

     TipoRel.DESC_C_TIPO_REL.Control:= edDESC_C_TIPO_REL;
     TipoRel.GetParams(Objeto);


      // Inicia Cambios <SATV4766  18 Ago 2009>
      CVE_RIESGO_PAIS.Control  := edCVE_RIESGO_PAIS;
      CVE_RIESGO_FINAN.Control := edCVE_RIESGO_FINAN;
      CVE_RIESGO_INDUS.Control := edCVE_RIESGO_INDUS;
      CVE_METODOLOGIA.Control  := edCVE_METODOLOGIA;
      B_ENTIDAD_FIN.Control    := chkB_ENTIDAD_FIN;
      DESC_METODOLOGIA.Control := edDESC_METODOLOGIA;
      // Termina Cambios  <SATV4766  18 Ago 2009>

      //SIGLAS_RFC.Control := edSiglas_RFC;

     Interforma1.MsgPanel := MsgPanel;

     End;

     Application.OnIdle := Application_Idle;
end;

procedure TWCrAcreditado.FormDestroy(Sender: TObject);
begin
   Application.OnIdle := Nil;

   With Objeto Do
     Begin
     ID_ACREDITADO.Control:=nil;
     IMP_MAX_AUTOR.Control:=nil;
     IMP_MINIMO_AUTOR.Control:=nil;
     IMP_CAP_VIG.Control:=nil;
     IMP_CAP_IMP.Control:=nil;
     IMP_CAP_VEN.Control:=nil;
     IMP_CAP_ACTUAL.Control := nil;
     IMP_REF_VIG.Control:=nil;
     IMP_REF_IMP.Control:=nil;
     IMP_REF_VEN.Control:=nil;
     IMP_REF_ACTUAL.Control := nil;
     IMP_TOT_VIG.Control:=nil;
     IMP_TOT_IMP.Control:=nil;
     IMP_TOT_VEN.Control:=nil;
     IMP_TOT_ACTUAL.Control := nil;
     B_ACREDITADO_REL.Control:=nil;
     TIPO_ACRED_REL.Control:=nil;
     CVE_GRUPO_ECO.Control:=nil;
     CVE_SECTOR_ECO.Control:=nil;
     CVE_TAM_ACRED.Control:=nil;
     CVE_LOCAL_CNBV.Control:=nil;
     CVE_SENICREB.Control:=nil;
     CVE_TIPO_RELAC.Control:=nil;
     CVE_CALIFACION.Control:=nil;
     B_AUTORIZADO.Control:=nil;
     SIT_ACREDITADO.Control:=nil;
     F_ALTA.Control := nil;
     CVE_USU_ALTA.Control := nil;
     F_MODIFICA.Control := nil;
     CVE_USU_MODIFICA.Control := nil;
     B_ACT_EMP.Control := nil;
     DIAS_PAGO.Control := nil;
     DIAS_ADICIONALES.Control := nil;
     B_AVALA_GOB_EDO.Control := nil;
     IMP_EXCESO_EVE.Control := nil;
     F_VTO_EXCESO.Control := nil;
     IMP_TOT_AUT.Control := nil;

     CVE_TIP_DISPOS.Control := nil;   // SATV4766 el 23MAY2006
     IMP_TOT_DISPONIB.Control := nil; // SATV4766 el 23MAY2006
     IMP_TOT_BLOQUEADO.Control := nil; // SATV4766 el 23MAY2006
     CVE_AFEC_INC_DEC.Control := nil; // SATV4766 el 23MAY2006

     CVE_PER_JUR_REG.Control          := nil;
     DESC_CVE_PER_JUR_REG.Control     := nil;
     NOM_ACRED_REG.Control            := nil;
     NUM_EMPLEADOS.Control            := nil;
     RFC_CNBV.Control                 := nil;

     //CVE_AVE
     CVE_AVE.Control                  := nil;
     
     CVE_BURO.Control                 := nil;
     DESC_BURO.Control                := nil;
     CVE_ACREDIT_CNBV.Control         := nil;
     DESC_ACREDIT_CNBV.Control        := nil;
     CVE_CARTERA_R04.Control          := nil;
     DESC_CARTERA_R04.Control         := nil;


     Persona.Nombre.Control := nil;
     Persona.Cve_Tipo_Sector.Control := nil;

     TipoAcred.DESC_TIPO_ACRED.Control := nil;

     GrupoEco.DESC_AGRUPO_ECO.Control := nil;
     GrupoEco.IMP_MAX_AUTOR.Control := nil;

     SectorEco.DESC_SECTOR_ECO.Control := nil;

     SecTamAcre.TamAcred.CVE_TAM_ACRED.Control := nil;
     SecTamAcre.TamAcred.DESC_TAM_ACRED.Control := nil;

     CalAcr.CVE_CALIFICACION.Control := nil;
     CalAcr.DESC_CALIFICA.Control := nil;

     LocalCNBV.CVE_LOCAL_CNBV.Control := nil;
     LocalCNBV.DESC_LOCAL_CNBV.Control := nil;
     Senicreb.DESC_SENICREB.Control := nil;
     TipoRel.DESC_C_TIPO_REL.Control:= nil;

      // Inicia Cambios <SATV4766  18 Ago 2009>
      CVE_RIESGO_PAIS.Control  := nil;
      CVE_RIESGO_FINAN.Control := nil;
      CVE_RIESGO_INDUS.Control := nil;
      CVE_METODOLOGIA.Control  := nil;
      B_ENTIDAD_FIN.Control    := nil;
      DESC_METODOLOGIA.Control := nil;
      // Termina Cambios  <SATV4766  18 Ago 2009>

     End;
end;

procedure TWCrAcreditado.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

// PROCEDIMIENTOS DE ACREDITADO
procedure TWCrAcreditado.InterForma1DespuesNuevo(Sender: TObject);
begin
   with Objeto do
   Begin
       //btDATOSADD.Enabled := true;
       rgSIT_ACREDITADO.ItemIndex := 0;
       IMP_MINIMO_AUTOR.AsFloat := 0;
       IMP_MAX_AUTOR.AsFloat := 0;
       PLAZO_MIN_LINEA.AsFloat := 0;
       PLAZO_MAX_LINEA.AsFloat := 0;
       IMP_DISPUESTO.AsFloat := 0;
       IMP_CAP_VIG.AsFloat := 0;
       IMP_CAP_IMP.AsFloat := 0;
       IMP_CAP_VEN.AsFloat := 0;
       IMP_CAP_ACTUAL.AsFloat := 0;
       IMP_REF_VIG.AsFloat := 0;
       IMP_REF_IMP.AsFloat := 0;
       IMP_REF_VEN.AsFloat := 0;
       IMP_REF_ACTUAL.AsFloat := 0;
       IMP_TOT_VIG.AsFloat := 0;
       IMP_TOT_IMP.AsFloat := 0;
       IMP_TOT_VEN.AsFloat := 0;
       IMP_TOT_ACTUAL.AsFloat := 0;
       SIT_ACREDITADO.AsString := 'AC';
       CVE_BURO.AsString := '';
       DESC_BURO.AsString := '';
       CVE_ACREDIT_CNBV.AsString  := '';
       DESC_ACREDIT_CNBV.AsString := '';
       CVE_CARTERA_R04.AsString   := '';
       DESC_CARTERA_R04.AsString  := '';
       F_ALTA.AsDateTime := Now;
       CVE_USU_ALTA.AsString := Apli.Usuario;
       TIPO_ACRED_REL.AsString := '8'; //4281 16Jun2010 Se pone por default 8 para matchear con catalogo de siti
       TipoAcred.FindKey(['8']);   //RIRA4281 16Jun2010 Se pone por default 8 para matchear con catalogo de siti
       edTIPO_ACRED_REL.Enabled := False;
       btTIPOACREDITADO.Enabled := False;
       edTIPO_ACRED_REL.Color := clBtnFace;
       edF_VTO_EXCESO.Enabled := False;
       edF_VTO_EXCESO.Color := clBtnFace;
       dtpF_VTO_EXCESO.Enabled := False;
       dtpF_VTO_EXCESO.Color := clBtnFace;
       btExceso.Enabled := False;
       if edID_ACREDITADO.CanFocus then //LOLS 17 NOV 2006. Valida si puede poner el foco
         edID_ACREDITADO.SetFocus;
       cbDIAS_PAGO.Text := 'NO APLICA';
       rgCVE_TIP_DISPOS.ItemIndex := 0;
       edIMP_TOT_DISPONIB.Text    := '0';

//       CVE_SENICREB.AsString := '00000000000'//EASA ABRIL 24042004
       HabilitaCtrlsIncreDecre(False); // SATV4766 19JUL2006
       CVE_AFEC_INC_DEC.AsString := 'N'; // No Aplica al principio debido a que se requieren conocer las autorizaciones

       if chB_AUTORIZADO.Checked then
         bB_AUTORIZADO := True
       else
         bB_AUTORIZADO := False;
   end;
end;

procedure TWCrAcreditado.InterForma1DespuesModificar(Sender: TObject);
var
     VLSalida  :  boolean;
     VLMesg     :  String;
begin
  bB_AUTORIZADO := chB_AUTORIZADO.Checked;
  with Objeto.Persona do
  if not Self.ValidaRFC(Trim(Cve_Per_Juridica.AsString), trim(Siglas_RFC.AsString), Trim(F_RFC.AsString), trim(Homoclave_RFC.AsString)) then
  begin
    VLMesg := 'El Acreditado no tiene RFC o está incompleto';
    VlSalida := False;
    InterForma1.ValidaExit(edID_ACREDITADO,VLSalida,VLMesg,True);
  end
  else
    With Objeto Do
      Begin
        F_MODIFICA.AsDateTime := Now;
        CVE_USU_MODIFICA.AsString := Apli.Usuario;
        vgCalif := CVE_CALIFACION.AsString;
        vgActualiza:= False;
        vgActExceso:= False;
        vgCveAfecIncDec := CVE_AFEC_INC_DEC.AsString; // SATV4766
        vgImpExcOld := IMP_EXCESO_EVE.AsFloat;
        vgFvtExcOld := F_VTO_EXCESO.AsDateTime;
        vgFIniExcOld:= F_INI_EXCESO.AsDateTime;
        pgAltaDatos.ActivePageIndex := 0;
         if btCve_Ave.CanFocus then //LOLS 17 NOV 2006. Valida si puede poner el foco
            btCve_Ave.SetFocus;
        //if edIMP_MINIMO_AUTOR.CanFocus then //LOLS 17 NOV 2006. Valida si puede poner el foco
          //edIMP_MINIMO_AUTOR.SetFocus;
        HabilitaIncreDecre; // SATV4766 19JUL2006
      End;
end;

procedure TWCrAcreditado.ilPERSONAEjecuta(Sender: TObject);
Begin
 With Objeto Do
   Begin
        Persona.BuscaWhereString := '';
        Persona.FilterString := Persona.BuscaWhereString;
        If ((Persona.FindKey([ilPersona.Buffer]))  and (PERSONA.SIT_PERSONA.AsString = 'AC')) Then   //Se forza a que sólo muestre activos RIRA4281 09Jun2010
        Begin
                Persona.BuscaWhereString := ' PERSONA.ID_PERSONA IN (SELECT ID_ACREDITADO FROM CR_ACREDITADO) ';
                Persona.FilterString := Persona.BuscaWhereString;
                InterForma1.NextTab(edID_ACREDITADO);
        End
        else
                Persona.FieldsClear;

   End;
end;

procedure TWCrAcreditado.btACREDITADOClick(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_ACRED',True,True) then
   begin
     Objeto.Persona.ShowAll := True;
     Objeto.Persona.BuscaWhereString := ' PERSONA.SIT_PERSONA = ''AC'' ';   //Se forza a que sólo muestre activos RIRA4281 09Jun2010
     Objeto.Persona.FilterString := Objeto.Persona.BuscaWhereString;
     if Objeto.Persona.Busca then
     begin
          Objeto.Persona.BuscaWhereString := ' PERSONA.ID_PERSONA IN (SELECT ID_ACREDITADO FROM CR_ACREDITADO) ';
          Objeto.Persona.FilterString := Objeto.Persona.BuscaWhereString;
          with Objeto.Persona do
          begin
            if not Self.ValidaRFC(Trim(Cve_Per_Juridica.AsString), trim(Siglas_RFC.AsString), Trim(F_RFC.AsString), trim(Homoclave_RFC.AsString)) then
            begin
              VLMesg := 'El Acreditado no tiene RFC o está incompleto';
              VlSalida := False;
              InterForma1.ValidaExit(edID_ACREDITADO,VLSalida,VLMesg,True);
            end;
          end;
          //InterForma1.NextTab(edID_ACREDITADO);
     end;
   end;
end;


//TIPO ACREDITADO
procedure TWCrAcreditado.btTIPOACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_TACRE',True,True) then
   begin
     Objeto.TipoAcred.ShowAll := True;
     if Objeto.TipoAcred.Busca then
     Begin
        InterForma1.NextTab(edTIPO_ACRED_REL);
     end;
     //end if
   end;
end;

procedure TWCrAcreditado.ilTIPOACREDEjecuta(Sender: TObject);
begin
   if Objeto.TipoAcred.FindKey([ilTipoAcred.Buffer]) then
       InterForma1.NextTab(edTIPO_ACRED_REL);
   //end if
end;

// GRUPO ECONOMICO
procedure TWCrAcreditado.btGRUPOECOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_GPOEC',True,True) then
   begin
     Objeto.GrupoEco.ShowAll := True;
     if Objeto.GrupoEco.Busca then
     Begin
        InterForma1.NextTab(edCVE_GRUPO_ECO);
     end;
     //end if
   end;
end;

procedure TWCrAcreditado.ilGrupoEcoEjecuta(Sender: TObject);
begin
   if Objeto.GrupoEco.FindKey([ilGrupoEco.Buffer]) then
       InterForma1.NextTab(edCVE_GRUPO_ECO);
   //end if
end;

// SECTOR ECONOMICO
procedure TWCrAcreditado.btSECTORECOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_SECEC',True,True) then
   begin
      Objeto.SectorEco.ShowAll := True;
      if Objeto.SectorEco.Busca then
      Begin
          InterForma1.NextTab(edCVE_SECTOR_ECO);
      end;
      //end if
   end;
end;

procedure TWCrAcreditado.ilSectorEcoEjecuta(Sender: TObject);
begin
   if Objeto.SectorEco.FindKey([ilSectorEco.Buffer])then
       InterForma1.NextTab(edCVE_SECTOR_ECO);
   //end if
end;

//TAMAÑO ACREDITADO
procedure TWCrAcreditado.btTAMACREDClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_TMACR',True,True) then
   begin
     Objeto.SecTamAcre.ShowAll := True;
     if Objeto.SecTamAcre.Busca then
     Begin
        InterForma1.NextTab(edCVE_TAM_ACRED);
     end;
     //end if
   end;
end;

procedure TWCrAcreditado.ilTamAcredEjecuta(Sender: TObject);
begin
   if Objeto.SecTamAcre.FindKey([ilTamAcred.Buffer]) then
      InterForma1.NextTab(edCVE_TAM_ACRED);
    //end if
end;

procedure TWCrAcreditado.edID_ACREDITADOExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      with Objeto.Persona do
        if not Self.ValidaRFC(Trim(Cve_Per_Juridica.AsString), trim(Siglas_RFC.AsString), Trim(F_RFC.AsString), trim(Homoclave_RFC.AsString)) then
        begin
            VlSalida := False;
            VLMesg := 'El Acreditado no tiene RFC o está incompleto';
        end
        else
        begin
              VLMesg     := '';
              Objeto.ID_ACREDITADO.GetFromControl;
              If Objeto.ID_ACREDITADO.AsString = '' then
              Begin
                 VLMesg := 'Favor de Indicar el Acreditado';
                 VlSalida := False;
              end
              else
              begin
                if InterForma1.IsNewData then
                begin
                     Objeto.ObtenNombre( Objeto.ID_ACREDITADO.AsString, VLMesg );
                     Objeto.ObtenPerJuriica( Objeto.ID_ACREDITADO.AsString, VLMesg );
                end;
                if Objeto.Persona.Sit_Persona.AsString <> 'AC' then
                Begin
                        VLMesg := 'Persona no Activa';
                        VlSalida := False;
                end
                else
                if Objeto.Persona.Cve_Per_Juridica.AsString = CPER_MORAL then
                Begin
                        cbB_ACT_EMP.Enabled := False;
                        cbB_ACT_EMP.Checked := False;
                        cbB_ACT_EMP.Color := clBtnFace;
                end
                else if Objeto.Persona.Cve_Per_Juridica.AsString = CPER_FISICA then
                Begin
                        cbB_ACT_EMP.Enabled := true;
                        cbB_ACT_EMP.Checked := True;
                end;
                VLSalida := True;
                Objeto.CalAcr.BuscaWhereString := ('(CR_CALIF_ACRED.CVE_PER_JURIDICA = '+
                                                #39 + Objeto.Persona.Cve_Per_Juridica.AsString + #39 +')');
                Objeto.CalAcr.FilterString := Objeto.CalAcr.BuscaWhereString;
             end;
        end;
      InterForma1.ValidaExit(edID_ACREDITADO,VLSalida,VLMesg,True);
   end;
end;

procedure TWCrAcreditado.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var
     VLSalida  :  boolean;
     VLMesg     :  String;
     function ActualizaCalif : Boolean;
     var vlsql : String;
         vlSalida : Boolean;
     Begin
        vlSalida := False;
        vlsql := ' UPDATE CR_CREDITO ' +
                 ' SET CVE_CALIF_CRE = ' + SQLStr(edCVE_CALIFACION.Text) +
                 ' WHERE CVE_CALIF_CRE = '+ SQLStr(Objeto.vgCalif) +
                 '   AND ID_CONTRATO IN ( SELECT ID_CONTRATO '+
                 '                        FROM CONTRATO ' +
                 '                        WHERE ID_TITULAR = ' + Objeto.ID_ACREDITADO.AsString + ')';
        if RunSQL(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,False) then
          vlSalida := True;
        ActualizaCalif := vlSalida;
     end;

     function RegAcExce : Integer;
     var vlsql , vlCount: String;
     Begin
        vlsql := ' SELECT COUNT(*) REG FROM CR_SOL_EXCESO_AC' +
                 ' WHERE ID_ACREDITADO = ' + Objeto.ID_ACREDITADO.AsString+ coCRLF +
                 '   AND SIT_SOL_EXCESO = ''AC''';
        GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'REG',vlCount,False);
        RegAcExce := StrToInt(vlCount);
     end;

     // Codigo nuevo MAMG
     // funcion que valida la persona juridica del acreditado
     function ValPerJurAcr : string;
     var query, TipJur: string;
     begin
        query := ' SELECT CVE_PER_JURIDICA as REG FROM PERSONA' +
                 ' where id_persona =' +  Objeto.ID_ACREDITADO.AsString + ' ';
        GetSQLStr(query,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'REG',TipJur,False);
        // ValPerJurAcr := StrToInt(TipJur);
        ValPerJurAcr := TipJur;
        ValPerJurAcr := trim(TipJur);
     end;

     // funcion que que valida el numero de accionistas del acreditado
     function ValContAcr : Integer;
     var vlsql , vlCount: String;
     Begin
        vlsql := ' SELECT COUNT(*) REG FROM CR_ACCIONISTA' +
                 ' WHERE ID_ACREDITADO = ' + Objeto.ID_ACREDITADO.AsString  +
                 ' AND SIT_ACCIONISTA = ''AC'' ';
        GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'REG',vlCount,False);
        ValContAcr := StrToInt(vlCount);
     end;
     // Termina el codigo nuevo

     function HayClaveBuro: boolean;
     var
       SQL, s: string;
     begin
       SQL := 'Select Count (*) Renglones' + #13#10 +
              '  From CR_Edos_Mpios_Buro';
       GetSQLStr(SQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'RENGLONES', s, False);
       result := StrToInt(s) > 0;
     end;

begin
   //nuevo
   with Objeto.Persona do
     if not Self.ValidaRFC(Trim(Cve_Per_Juridica.AsString), trim(Siglas_RFC.AsString), Trim(F_RFC.AsString), trim(Homoclave_RFC.AsString)) then
     begin
         VlSalida := False;
         VLMesg := 'El Acreditado no tiene RFC o está incompleto';
         InterForma1.ValidaExit(edID_ACREDITADO,VLSalida,VLMesg,True);
     end
     else
     begin
            //La Clave de Buró es requerida si es Anexo 18 (3, 6)
            Objeto.Cve_Buro.IsRequiered := HayClaveBuro and ((Objeto.Cve_Metodologia.AsString = '3') or (Objeto.Cve_Metodologia.AsString = '6')) and (Objeto.Cve_Buro.AsString = '');

            //Si es anexo 18, debe tener capturada la Clave de Buró
            if Objeto.Cve_Buro.IsRequiered then
            begin
              MessageDlg ('Es necesario capturar la Clave Buró', mtWarning, [mbOk], 0);
              Realizado              := False;
              pgAltaDatos.ActivePage := TabSheet2;
              edClave_Buro.SetFocus;
              exit;
            end;

            if MetVar_HayContratosAmbiguosAnexo19 then
            begin
              MessageDlg ('En la metodología de Anexo 19 hay más de un proyecto y hay contratos que no tienen asignado proyecto ni metodología. Es necesario asignarlos', mtWarning, [mbOk], 0);
              Realizado              := False;

(*            Migración de Anexo 19 a Modelos Dinámicos
              pgAltaDatos.ActivePage := tsAnexo19;
              pgAltaDatosChange (tsAnexo19);*)
              exit;
            end;

            if IsNewData then
            Begin
                if MessageDlg('¿Desea almacenar los datos capturados?',
                     mtConfirmation,[mbYes, mbNo], 0) = mrYes then
                Begin
                  if chB_AUTORIZADO.Checked then // si está autorizado
                    GuardaBitacoraRFC;
                  Objeto.IMP_DISPUESTO.AsFloat := 0;
                  Realizado := True;
                End;
            end
            else
            Begin
            if MessageDlg('¿Desea guardar los datos modificados?',
                 mtConfirmation,[mbYes, mbNo], 0) = mrYes then
            Begin
                   if (chB_AUTORIZADO.Checked <> bB_AUTORIZADO) then // si cambió el valor del check durante la modificación
                         GuardaBitacoraRFC;
                   if Objeto.vgActualiza then
                   begin
                      if ActualizaCalif then
                         ShowMessage('Se ha actualizado la calificación del Acreditado de sus disposiciones')
                      else edCVE_CALIFACION.Text := Objeto.vgCalif;

                   end;
                   // { EASA4011     23/01/2005      EXCESOS
                   if objeto.IMP_EXCESO_EVE.AsFloat > 0 then begin
                      if Objeto.vgActExceso then Begin
                        if MessageDlg('¿Desea realizar el '+cbCVE_AFEC_INC_DEC.Text+' en el monto Autorizado?', // Modificado por SATV4766
                          mtConfirmation,[mbYes, mbNo], 0) = mrYes then
                        Begin
                           //llama pantalla de excesos
                           if not AplicaExcesos then
                           Begin
                              Objeto.RestauraValoresOriginales; // SATV4766
                              Realizado := True;
                              ShowMessage('No se Aplicó ningun cambio');
                           end
                           else
                           Begin
                              Objeto.F_INI_EXCESO.AsDateTime := Now;
                              BitExcesos;
                           end;
                           MuestraImportes;
                        end
                        else
                           Begin
                           Objeto.RestauraValoresOriginales;
                           Realizado := True;
                           End;
                      end;
                   end
                   else Realizado := True;
                   /// EASA4011 }
                end
                else Realizado := False;
             end
           // end if
     end;
end;

procedure TWCrAcreditado.edIMP_MAX_AUTORExit(Sender: TObject);
var  VLSAlida   :  boolean;
     VLMesg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlSalida := True;
      Objeto.IMP_MAX_AUTOR.GetFromControl;
      if InterForma1.IsNewData then
      Begin
         if Objeto.IMP_MAX_AUTOR.AsFloat < 0 then
         Begin
            vlSalida := False;
            vlMesg := 'El importe máximo autorizado no puede ser negativo';
         end
         else If Objeto.IMP_MAX_AUTOR.AsFloat < Objeto.IMP_MINIMO_AUTOR.AsFloat then
         Begin
            VLMesg :='El importe máximo no debe de ser menor al importe mínimo';
            VLSalida := False;
         end;
      end;
      // SATV4766
      If (VLSalida) Then CalculaImpDisponible;

      InterForma1.ValidaExit(edIMP_MAX_AUTOR,VLSAlida,VLMesg,True);
   end;
end;

procedure TWCrAcreditado.chB_ACREDITADO_RELExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_ACREDITADO_REL,True,'',True);
end;
procedure TWCrAcreditado.chB_ACREDITADO_RELClick(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      if chB_ACREDITADO_REL.Checked = False then
      Begin
         Objeto.TipoAcred.FindKey(['8']);      //RIRA4281 16Jun2010 Se pone por default 8 para matchear con catalogo de siti
         Objeto.TIPO_ACRED_REL.AsString := '8'; //RIRA4281 16Jun2010 Se pone por default 8 para matchear con catalogo de siti
         edTIPO_ACRED_REL.Enabled := False;
         btTIPOACREDITADO.Enabled := False;
         edTIPO_ACRED_REL.Color := clBtnFace;
      end
      else
      Begin
         Objeto.TipoAcred.Active := False;
         edTIPO_ACRED_REL.Text := '';
         edTIPO_ACRED_REL.Enabled := True;
         btTIPOACREDITADO.Enabled := True;
         edTIPO_ACRED_REL.Color := clWindow;
      end;
   end;
end;

procedure TWCrAcreditado.edTIPO_ACRED_RELExit(Sender: TObject);
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      if ((chB_ACREDITADO_REL.Checked = True) and (Objeto.TIPO_ACRED_REL.AsString = '8'))  then
         InterForma1.ValidaExit(edTIPO_ACRED_REL,False,'El Tipo de Acreditado debe ser diferente a 8',True)
      else
         InterForma1.ValidaExit(edTIPO_ACRED_REL,True,'',True)
end;

procedure TWCrAcreditado.edCVE_SECTOR_ECOExit(Sender: TObject);
begin
   Objeto.SecTamAcre.BuscaWhereString := ('CR_SEC_TAM_ACRED.CVE_TIPO_SECTOR = ' +
                                      #39 + Objeto.SectorEco.CVE_TIPO_SECTOR.AsString + #39);
   Objeto.SecTamAcre.FilterString := Objeto.SecTamAcre.BuscaWhereString;
   InterForma1.ValidaExit(edCVE_SECTOR_ECO,True,'',True);
end;

procedure TWCrAcreditado.rgSIT_ACREDITADOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_ACREDITADO,True,'',True);
end;

procedure TWCrAcreditado.edCVE_GRUPO_ECOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_GRUPO_ECO,True,'',True);
end;

procedure TWCrAcreditado.edCVE_TAM_ACREDExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_TAM_ACRED,True,'',True);
end;

procedure TWCrAcreditado.edCVE_CALIFACIONExit(Sender: TObject);
     function cont: Integer;
     var vlsql : String;
         vlCount : Integer;
     Begin
        vlsql := ' SELECT COUNT(*) CONT FROM CR_CREDITO ' +
                 ' WHERE CVE_CALIF_CRE = '+ SQLStr(Objeto.vgCalif) +
                 '   AND ID_CONTRATO IN ( SELECT ID_CONTRATO '+
                 '                        FROM CONTRATO ' +
                 '                        WHERE ID_TITULAR = ' + Objeto.ID_ACREDITADO.AsString + ')';
        GetSQLInt(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,'CONT',vlCount,False);
        cont:= vlCount;
     end;
Begin
   IF  InterForma1.ShowBtnModificar then
   begin
       Objeto.CVE_CALIFACION.GetFromControl;
       IF Objeto.CVE_CALIFACION.AsString <> Objeto.vgCalif THEN
         if cont > 0 then
            if MessageDlg('¿Al modificar la Calificación, se modificará en todas sus disposiciones',
                      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
               Objeto.vgActualiza := True
            else edCVE_CALIFACION.Text := Objeto.vgCalif;
      //end if
   end;
   InterForma1.ValidaExit(edCVE_CALIFACION,True,'',True);
end;

procedure TWCrAcreditado.chB_AUTORIZADOExit(Sender: TObject);
begin
   if chB_ACREDITADO_REL.CanFocus then //LOLS 17 NOV 2006. Valida si puede poner el foco
     chB_ACREDITADO_REL.SetFocus;
   InterForma1.ValidaExit(chB_AUTORIZADO,true,'',True);
end;

procedure TWCrAcreditado.edIMP_MINIMO_AUTORExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   VLMesg     := '';
   vlSalida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.IMP_MINIMO_AUTOR.GetFromControl;
      if Objeto.IMP_MINIMO_AUTOR.AsFloat < 0 then
      Begin
         vlSalida := False;
         vlMesg := 'EL importe mínimo autorizado no puede ser negativo';
      end;
      InterForma1.ValidaExit(edIMP_MINIMO_AUTOR,VLSalida,VLMesg,True);
   end;
end;

procedure TWCrAcreditado.chB_ACREDITADO_RELEnter(Sender: TObject);
begin
   if chB_ACREDITADO_REL.Checked then
   begin
      edTIPO_ACRED_REL.Enabled := True;
      btTIPOACREDITADO.Enabled := True;
   end
   else //Desactiva la captura del tipo Acreditado
   begin
      edTIPO_ACRED_REL.Enabled := False;
      edTIPO_ACREDITADO.Color := clBtnFace;
      btTIPOACREDITADO.Enabled := False;
      Objeto.TipoAcred.FindKey(['0']);
   end;
end;

procedure TWCrAcreditado.btDATOSADDClick(Sender: TObject);
var  Accionistas  : TCrAccioni;
begin
   if Objeto.Active then
   begin
      if Objeto.Persona.Cve_Per_Juridica.AsString = CPER_MORAL then
      Begin
          {$WARNINGS OFF}
          Accionistas := TCrAccioni.Create(self);
          {$WARNINGS ON}
          try
             Accionistas.Apli:=Objeto.Apli;
             Accionistas.ParamCre:=Objeto.ParamCre;
             Accionistas.Acreditado := Objeto;
             Accionistas.Catalogo;

          finally
                 Accionistas.Free;
          end;
      end
      else ShowMessage('El Acreditado no es una persona moral.');
   end
   else
      ShowMessage('Debe de seleccionar un Acreditado.');
   //end if;
end;

procedure TWCrAcreditado.btCalificaClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_CALDE',True,True) then
   begin
     Objeto.CalAcr.ShowAll := True;
     if Objeto.CalAcr.Busca then
        InterForma1.NextTab(edCVE_CALIFACION);
     //end if
   end;
end;

procedure TWCrAcreditado.ilCALIFICAEjecuta(Sender: TObject);
begin
   if Objeto.CalAcr.FindKey([ilCALIFICA.Buffer])then
      InterForma1.NextTab(edCVE_CALIFACION);
   //end if
end;

//Llama la ventana para convertir meses o años a Dias
Function TWCrAcreditado.VentanaCalculo(pDato : String): string;
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

procedure TWCrAcreditado.InterForma1Buscar(Sender: TObject);
var vlMensaje : String;
begin
   Objeto.Persona.BuscaWhereString := ' PERSONA.ID_PERSONA IN (SELECT ID_ACREDITADO FROM CR_ACREDITADO) ';
   Objeto.Persona.FilterString := Objeto.Persona.BuscaWhereString;
   if Objeto.Busca then
   begin
        Objeto.ObtenSaldoSitDisp(Objeto.ID_ACREDITADO.AsInteger);
        MuestraHints;
        Objeto.SecTamAcre.FindKey([Objeto.CVE_TAM_ACRED.AsString,Objeto.SectorEco.CVE_TIPO_SECTOR.AsString]);
        Objeto.CalAcr.FindKey([Objeto.CVE_CALIFACION.AsString,Objeto.Persona.Cve_Per_Juridica.AsString]);
        ConciliaSaldos;
        CalculaImpDisponible;
        //EASA  REQ. 20007 - 07 / 018   CARTERA IMPAGADA
        InterForma1.MsgPanel.Caption := '';
        InterForma1.MsgPanel.Color := clBtnFace;
        InterForma1.MsgPanel.Font.Color := clWhite;
        if not ( FindDispIM(Objeto.ID_ACREDITADO.AsInteger,Objeto.Apli, vlMensaje)) then
        Begin
           InterForma1.MsgPanel.Caption := vlMensaje;
           InterForma1.MsgPanel.Color := clRed;
           InterForma1.MsgPanel.Font.Color := clWhite;
           if MessageDlg(vlMensaje + ', desea ver el detalle?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Begin
              {$WARNINGS OFF}
              Objeto.DetImpagado := TCrCartrIm.Create(self);
              {$WARNINGS ON}
              Try
                Objeto.DetImpagado.Apli:= Objeto.Apli;
                Objeto.DetImpagado.ID_ACREDITADO.AsString := Objeto.ID_ACREDITADO.ASstring;
                Objeto.DetImpagado.NOM_ACREDITADO.AsString := Objeto.persona.nombre.asstring;
                Objeto.DetImpagado.ParamCre:=Objeto.ParamCre;
                Objeto.DetImpagado.Catalogo;
              finally
                Objeto.DetImpagado.Free;
              end;
           end;
        end;
        //END EASA
        with Objeto do
        begin
        CVE_PER_JUR_REG.GetControl;
        ObtenDescripcion( ' SELECT CR.DESC_CLAVE AS DESC_CVE'+coCRLF+
                          ' FROM CR_CON_CAT_DATA CR'+coCRLF+
                          ' WHERE CR.CVE_CON_GPO_CAT = ''CAT_PERS_JURID'' AND CR.CVE_CLAVE = '+CVE_PER_JUR_REG.AsString+coCRLF,
                          'DESC_CVE',
                          CVE_PER_JUR_REG,
                          DESC_CVE_PER_JUR_REG
                         );

         CVE_BURO.GetControl;
         ObtenDescripcion( 'Select Cve_Edo_Mpio Cve_Buro, Desc_Edo_Mpio Desc_Buro'+coCRLF+
                           '  From CR_Edos_Mpios_Buro'+coCRLF+
                           ' Where Cve_Edo_Mpio = ''' + CVE_BURO.AsString + '''' + coCRLF,
                           'Desc_Buro',
                           CVE_BURO,
                           DESC_BURO
                          );

         CVE_ACREDIT_CNBV.GetControl;
         ObtenDescripcion( ' SELECT CVE_ACREDIT_CNBV, DESC_ACREDITADO ACREDIT_CNBV '+coCRLF+
                           '  FROM CR_ACREDITADO_CNBV '+coCRLF+
                           ' where CVE_ACREDIT_CNBV = ' + QuotedStr(CVE_ACREDIT_CNBV.AsString) + coCRLF,
                           'ACREDIT_CNBV',
                           CVE_ACREDIT_CNBV,
                           DESC_ACREDIT_CNBV
                          );

         CVE_CARTERA_R04.GetControl;
         ObtenDescripcion( ' SELECT CVE_CLAVE, DESC_CLAVE, CVE_VALOR_ADIC '+coCRLF+
                           '  FROM CR_CON_CAT_DATA '+coCRLF+
                           ' WHERE CVE_CON_GPO_CAT = ' + QuotedStr('CAT_TIPO_CARTERA') +
                           ' AND CVE_CLAVE = ' + QuotedStr(CVE_CARTERA_R04.AsString) + coCRLF,
                           'DESC_CLAVE',
                           CVE_CARTERA_R04,
                           DESC_CARTERA_R04
                          );

        end;

        if MetVar_HayContratosAmbiguosAnexo19 then
          MessageDlg ('En la metodología de Anexo 19 hay más de un proyecto y hay contratos que no tienen asignado proyecto ni metodología. Es necesario asignarlos', mtWarning, [mbOk], 0);

        MetVar_ValidaCveMetodologia;
//end;
   end;
   MuestraImportes;
   pgAltaDatosChange(Self);
end;

Procedure TWCrAcreditado.MuestraHints;
Begin
      edDESC_ACREDITADO.Hint := Objeto.Persona.Nombre.AsString;
      edDESC_ACREDITADO.ShowHint := True;
      edTIPO_ACREDITADO.Hint := Objeto.TipoAcred.DESC_TIPO_ACRED.AsString;
      edTIPO_ACREDITADO.ShowHint := True;
      edGRUPOECO.Hint := Objeto.GrupoEco.DESC_AGRUPO_ECO.AsString;
      edGRUPOECO.ShowHint := True;
      edDESCRIPSEC.Hint := Objeto.SectorEco.DESC_SECTOR_ECO.AsString;
      edDESCRIPSEC.ShowHint := True;
      edDESCTAMACRED.Hint := Objeto.SecTamAcre.TamAcred.DESC_TAM_ACRED.AsString;
      edDESCTAMACRED.ShowHint := True;
      edDESC_CALIFICA.Hint := Objeto.CalAcr.DESC_CALIFICA.AsString;
      edDESC_CALIFICA.ShowHint := True;
      edDESC_LOCAL_CNBV.Hint := Objeto.LocalCNBV.DESC_LOCAL_CNBV.AsString;
      edDESC_LOCAL_CNBV.ShowHint := True;
      edSENICREB.Hint := Objeto.Senicreb.DESC_SENICREB.AsString;
      edSENICREB.ShowHint := True;
      edCVE_SENICREB.Hint := Objeto.Senicreb.CVE_SENICREB.AsString;
      edCVE_SENICREB.ShowHint := True;
      edCVE_TIPO_RELAC.Hint := Objeto.TipoRel.CVE_TIPO_RELAC.AsString;
      edCVE_TIPO_RELAC.ShowHint := True;
End;

procedure TWCrAcreditado.InterForma1DespuesAceptar(Sender: TObject);
  procedure MonedaBase;
  var vlsql    : String;
      vlMoneda : integer;
  Begin
     vlsql := '';
     vlsql := 'SELECT CVE_MON_BASE_ACR FROM CR_PARAMETRO';
     GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_MON_BASE_ACR',vlMoneda,False);
     vlsql := 'INSERT INTO CR_REL_ACRE_MON(ID_ACREDITADO,CVE_MONEDA) VALUES ('+
              Objeto.ID_ACREDITADO.AsString + ',' + IntToStr(vlMoneda) + ')';
     RunSQL(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
  end;
begin
   MuestraHints;
   MonedaBase;
   Objeto.SecTamAcre.FindKey([Objeto.CVE_TAM_ACRED.AsString,Objeto.SectorEco.CVE_TIPO_SECTOR.AsString]);
   Objeto.CalAcr.FindKey([Objeto.CVE_CALIFACION.AsString,Objeto.Persona.Cve_Per_Juridica.AsString]);
   btExceso.Enabled := True;
   pgAltaDatos.ActivePageIndex := 0;
   MuestraImportes;
   CalculaImpDisponible;
   HabilitaEstadosyMunicipios (False);
   HabilitaAnexo19 (False);

   MetVar_ValidaCveMetodologia;
end;

procedure TWCrAcreditado.cbB_ACT_EMPExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_ACT_EMP,True,'',True);
end;

procedure TWCrAcreditado.btCONFIG_MONEDASClick(Sender: TObject);
Var     RelAcreMon      : TCrReAcMn;
begin
   if Objeto.Active then
      Begin
        if Objeto.SIT_ACREDITADO.AsString = CSIT_AC then
         Begin
           {$WARNINGS OFF}
            RelAcreMon := TCrReAcMn.Create(self);
           {$WARNINGS ON}
            try
               RelAcreMon.Apli:=Objeto.Apli;
               RelAcreMon.ParamCre:=Objeto.ParamCre;
               RelAcreMon.ID_ACREDITADO.AsString := Objeto.ID_ACREDITADO.AsString;
               RelAcreMon.B_APLI_REL_MON.AsString := Objeto.B_APLI_REL_MON.AsString;
               RelAcreMon.Acreditado := Objeto;
               RelAcreMon.Catalogo;
            finally
                   RelAcreMon.Free;
                   Objeto.FindKey([Objeto.ID_ACREDITADO.AsString]);
            end;
         end
       else ShowMessage('Acreditado Inactivo.');
       end
   else
       ShowMessage('Debe de seleccionar un Acreditado.');
   //end if;
end;

procedure TWCrAcreditado.cbDIAS_PAGOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbDIAS_PAGO,True,'',True);
end;

procedure TWCrAcreditado.edDIAS_ADICIONALESExit(Sender: TObject);
var  VLSAlida   :  boolean;
     VLMesg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.DIAS_ADICIONALES.GetFromControl;
      VLSalida  := ValNumPositivo(VLMesg,Objeto.DIAS_ADICIONALES.AsInteger);//Procedimiento extraido de IntGenCre;
      InterForma1.ValidaExit(edDIAS_ADICIONALES,VLSAlida,VLMesg,True);
   end;
end;

procedure TWCrAcreditado.InterForma1DespuesShow(Sender: TObject);
begin
   if Objeto.ID_ACREDITADO.AsString <> '' then Begin
      Objeto.ObtenSaldoSitDisp(Objeto.ID_ACREDITADO.AsInteger);
      MuestraImportes;
   end;
   //end if
   MuestraHints;

   //Valida si aparece activa la pestaña de estados y municipios



   qValidaEstadosMun.Close;
   qValidaEstadosMun.DatabaseName := Objeto.Apli.DataBaseName;
   qValidaEstadosMun.SessionName  := Objeto.Apli.SessionName;
   qValidaEstadosMun.sql.text:= ' SELECT cve_usuario '+
                           ' FROM SECU_OPER_ACC '+
                           ' WHERE cve_funcion  = ''CLASE_TACREDITAD'' '+
                           '  AND cve_oper_acc = ''R0'' '+
                           '  AND cve_usuario = '''+Objeto.Apli.Usuario+'''';
      qValidaEstadosMun.Open;

      If  qValidaEstadosMun.FieldByName('cve_usuario').AsString = '' Then
      begin
      tsEstadosyMunc.Enabled := False;
      tsEstadosyMunc.Visible := False;
      tsEstadosyMunc.TabVisible:=False;
      end;

   qValidaEstadosMun.Close;


end;

procedure TWCrAcreditado.InterForma1DespuesCancelar(Sender: TObject);
begin
  if Objeto.Modo = moAppend then
    edID_ACREDITADO.Text := '';

   Objeto.SecTamAcre.FindKey([Objeto.CVE_TAM_ACRED.AsString,Objeto.SectorEco.CVE_TIPO_SECTOR.AsString]);
   Objeto.CalAcr.FindKey([Objeto.CVE_CALIFACION.AsString,Objeto.Persona.Cve_Per_Juridica.AsString]);
   HabilitaEstadosyMunicipios (False);
   HabilitaAnexo19 (False);

   MetVar_ValidaCveMetodologia;
end;

Procedure TWCrAcreditado.verificadatos;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      if ( edID_ACREDITADO.Text    = '' ) OR
         ( edIMP_MAX_AUTOR.Text    = '' ) OR
         ( edIMP_MINIMO_AUTOR.Text = '' ) OR
         ( edTIPO_ACRED_REL.Text   = '' ) OR
         ( edCVE_GRUPO_ECO.Text    = '' ) OR
         ( edCVE_SECTOR_ECO.Text   = '' ) OR
         ( edCVE_TAM_ACRED.Text    = '' ) OR
         ( edCVE_LOCAL_CNBV.Text   = '' ) then
{         (
           not((Objeto.CVE_GRUPO_ECO.AsString = '0')OR(Objeto.CVE_GRUPO_ECO.AsString ='5190'))
           And(edCVE_TIPO_RELAC.Text   = '')
         ) then}
      Begin
           ShowMessage('No puede autorizar el acreditado por falta de datos');
           chB_AUTORIZADO.Checked := False;
      end
      else
      Begin
         chB_AUTORIZADO.Checked := True;
         Objeto.F_AUTORIZACION.AsDateTime := Now;
         Objeto.CVE_USU_AUTORIZA.AsString := Objeto.Apli.Usuario;
      end;
   end;
end;
procedure TWCrAcreditado.ilCVE_LOCAL_CNBVEjecuta(Sender: TObject);
begin
 if Objeto.LocalCNBV.FindKey([ilCVE_LOCAL_CNBV.Buffer]) then
   InterForma1.NextTab(edCVE_LOCAL_CNBV);
end;

procedure TWCrAcreditado.btnCVE_LOCAL_CNBVClick(Sender: TObject);
var
  strClave : string;
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_REGN',True,True) then
   begin
      //strClave := validaDireccionCNBV(objeto.ID_ACREDITADO.asString);
      strClave := '';
      if strClave <> '' then
      begin
        Objeto.LocalCNBV.BuscaWhereString := format(' cve_local_cnbv between %s and %s', [quotedstr(strClave), quotedstr(strClave + 'Z')] );
        Objeto.LocalCNBV.FilterString := Objeto.LocalCNBV.BuscaWhereString;
      end else
        Objeto.LocalCNBV.ShowAll := True;

       if Objeto.LocalCNBV.Busca then
       Begin
          InterForma1.NextTab(edCVE_LOCAL_CNBV);
       end else
       //end if
   end;
end;

procedure TWCrAcreditado.btnCVE_LOCAL_CNBVExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edCVE_LOCAL_CNBV,True,'',True);
end;

procedure TWCrAcreditado.edCVE_LOCAL_CNBVExit(Sender: TObject);
begin
 InterForma1.ValidaExit(edCVE_LOCAL_CNBV,True,'',True);
end;

//EASA ABRIL 24042004
procedure TWCrAcreditado.ConciliaSaldos;
var vlsql       : String;
    vlDispuesto : String;
begin
   vlsql := 'SELECT PKGCRSALDOS.stpObtDispuestoAcred( ' + Objeto.ID_ACREDITADO.AsString + ' ) DISPUESTO_ACRED FROM DUAL';
   GetSQLStr(vlsql,objeto.Apli.DataBaseName, Objeto.apli.SessionName,'DISPUESTO_ACRED', vlDispuesto, False);
   if vlDispuesto = '' then
      vlDispuesto := '0';
   vlsql := ' UPDATE  CR_ACREDITADO ' +
            ' SET   IMP_DISPUESTO = ' + vlDispuesto +
            ' WHERE ID_ACREDITADO = ' + Objeto.ID_ACREDITADO.AsString  ;

   RunSQL(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
   Objeto.FindKey([Objeto.ID_ACREDITADO.AsString]);
end;

//Llamado a la clase de persona para consultar principalmente su sector. -- EASA4011 10/05/2004
procedure TWCrAcreditado.ConsultaSectorPersona1Click(Sender: TObject);
begin
      Objeto.Persona.GetParams(Objeto);
      Objeto.Persona.FindKey([Objeto.ID_ACREDITADO.AsString]);
      Objeto.Persona.Catalogo;
      Objeto.FindKey([Objeto.ID_ACREDITADO.AsString]);
end;

procedure TWCrAcreditado.btCTRL_DOCTOSClick(Sender: TObject);
Var   DoctosAcred : TMRecTra;
begin
   if Objeto.Active then
      Begin
         IF Objeto.SIT_ACREDITADO.AsString = CSIT_AC THEN
         Begin
           {$WARNINGS OFF}
            DoctosAcred := TMRecTra.Create(self);
           {$WARNINGS ON}
            try
               DoctosAcred.Apli:=Objeto.Apli;
               DoctosAcred.ParamCre:=Objeto.ParamCre;
               DoctosAcred.iIdEmpresa:= Objeto.Apli.IdEmpresa;
               DoctosAcred.iIdAcreditado:= Objeto.ID_ACREDITADO.AsInteger;
               DoctosAcred.sCveMedio:= 'ALTACR';
               DoctosAcred.iReferencia:= Objeto.ID_ACREDITADO.AsInteger;
               DoctosAcred.Catalogo;
            finally
                   DoctosAcred.Free;
            end;
         end
         else ShowMessage('Acreditado Inactivo.');
      end
   else
       ShowMessage('Debe de seleccionar un Acreditado.');
   //end if;
end;

procedure TWCrAcreditado.chB_AUTORIZADOClick(Sender: TObject);
begin
   if chB_AUTORIZADO.Checked then
      Begin
         verificadatos;
      end;
end;

procedure TWCrAcreditado.btSENICREBClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_SENIC',True,True) then
   begin
       Objeto.Senicreb.ShowAll := True;
       if Objeto.Senicreb.Busca then
          InterForma1.NextTab(edCVE_SENICREB);
       //end if
   end;
end;

procedure TWCrAcreditado.ilSENICREBEjecuta(Sender: TObject);
begin
   if Objeto.Senicreb.FindKey([ilSENICREB.Buffer]) then
      InterForma1.NextTab(edCVE_SENICREB);
   //end if
end;
             
procedure TWCrAcreditado.chB_AVALA_GOB_EDOExit(Sender: TObject);
begin
   pgAltaDatos.ActivePageIndex := 1;
   InterForma1.ValidaExit(chB_AVALA_GOB_EDO,True,'',True);
end;

procedure TWCrAcreditado.edCVE_SENICREBExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_SENICREB,True,'',True);
end;

procedure TWCrAcreditado.btCALIF_CALIFICAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_CALCL',True,True) then
   begin
     MuestraConsultaCalificaciones(objeto.ID_ACREDITADO.AsInteger,
                                   Objeto.Apli.DameFechaEmpresa,
                                   Objeto.Paramcre,
                                   Objeto.Apli);
   end;
end;

procedure TWCrAcreditado.btCVE_TIPO_RELACClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_TREL',True,True) then
   begin
     Objeto.TipoRel.ShowAll := True;
     If Objeto.TipoRel.Busca Then Begin
        InterForma1.NextTab(edCVE_TIPO_RELAC);
     End;
   end;
end;

procedure TWCrAcreditado.ilCVE_TIPO_RELACEjecuta(Sender: TObject);
begin
   If Objeto.TipoRel.FindKey([ilCVE_TIPO_RELAC.Buffer]) Then
      InterForma1.NextTab(edCVE_TIPO_RELAC);
end;

procedure TWCrAcreditado.edCVE_TIPO_RELACExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_TIPO_RELAC,True,'',True);
end;

procedure TWCrAcreditado.edCVE_TIPO_RELACKeyPress(Sender: TObject;
  var Key: Char);
begin
   If ((Pos(Key,'0123456789'#8)) = 0) Then Key := #0;
end;

// Inicia Modificaciones por SATV4766 el 19JUL2006
procedure TWCrAcreditado.cbCVE_AFEC_INC_DECExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbCVE_AFEC_INC_DEC,True,'',True);
end;

procedure TWCrAcreditado.edIMP_EXCESO_EVEExit(Sender: TObject);
var  vlMsg     :  String;
Begin
  vlMsg := '';
  With Objeto Do
     Begin
       If ((Modo = moEdit) Or (Modo = moAppend)) Then
           Begin
           IMP_EXCESO_EVE.GetFromControl;
           CVE_AFEC_INC_DEC.GetFromControl;
           If ((IMP_EXCESO_EVE.AsFloat = 0) And (CVE_AFEC_INC_DEC.AsString <> 'N')) Then
               vlMsg := 'Favor de indicar el '+cbCVE_AFEC_INC_DEC.Text
           //LOLS 17 NOV 2006. Si no aplica el incremento / decremento entonces no debe aplicar esta
           //                  validación.
           Else If (IMP_EXCESO_EVE.AsFloat < IMP_MINIMO_AUTOR.AsFloat) And (CVE_AFEC_INC_DEC.AsString <> 'N') Then
           //Else If (IMP_EXCESO_EVE.AsFloat < IMP_MINIMO_AUTOR.AsFloat) Then
           //ENDS LOLS 17 NOV 2006.
               vlMsg := 'El '+cbCVE_AFEC_INC_DEC.Text+' no debe de ser menor al importe mínimo.';

               
           If (vlMsg = '') And (CVE_AFEC_INC_DEC.AsString <> 'N') Then
              Begin
              MuestraImportes;
              CalculaImpDisponible;
              vgActExceso := False;
              If (vgImpExcOld <> IMP_EXCESO_EVE.AsFloat) Then
                 vgActExceso := True;
              End;
           End;
     End;
     InterForma1.ValidaExit(edIMP_EXCESO_EVE,vlMsg = '',vlMsg,True);
end;
// Termina Modificaciones por SATV4766

// Inicia Modificaciones por SATV4766 el 19JUL2006
procedure TWCrAcreditado.edF_VTO_EXCESOExit(Sender: TObject);
var vlMsg : String;
    vlFD000 : TDateTime;
Begin
  vlMsg := '';
  With Objeto Do
    If ((Modo = moEdit) Or (Modo = moAppend)) Then
       Begin
       F_VTO_EXCESO.GetFromControl;
       vlFD000 := Apli.DameFechaEmpresa;

       If (F_VTO_EXCESO.AsString <> '') Then
          Begin
          If (F_VTO_EXCESO.AsDateTime <= vlFD000) Then
             vlMsg := ' La '+lbF_VENCIMIENTO.Caption+' no puede ser menor o igual que hoy '+DateToStr(vlFD000)
          Else If (ValidaFecha(F_VTO_EXCESO.AsDateTime, Apli) <> 0) Then
             vlMsg := ' La '+lbF_VENCIMIENTO.Caption+' es un día no hábil';
          End;
       End;
  InterForma1.ValidaExit(edF_VTO_EXCESO, VlMsg = '', VlMsg, True);       
end;
// Termina Modificaciones por SATV4766

function TWCrAcreditado.AplicaExcesos : Boolean;
begin
  With Objeto Do
    Begin
    GetFromControl;
    Result := MuestraPantallaExcesos(Apli,                           // peApli : TInterApli;
                                     ParamCre,                       // ParamCre : TParamCre;
                                     ID_ACREDITADO.AsInteger,        // peID_ACREDITADO
                                     0,                              // peID_CONTRATO
                                     IMP_EXCESO_EVE.AsFloat,         // peIMP_EXCESO_EVE
                                     CVE_AFEC_INC_DEC.AsString,      // peCVE_AFEC_INC_DEC
                                     CVE_TIP_DISPOS.AsString,        // peCVE_TIP_DISPOS
                                     CVERDAD,                        // peB_AFEC_ACRED
                                     F_VTO_EXCESO.AsDateTime,        // peF_VTO_EXCESO
                                     False                           // peB_MODIFICA_DATOS
                                     );
    End;
end;

procedure TWCrAcreditado.btExcesoClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_INDC',True,True) then
   begin
      BitExcesos;
   end;
end;

procedure TWCrAcreditado.BitExcesos;
var  BitExceso : TCrSoExAc;
begin
   {$WARNINGS OFF}
   BitExceso := TCrSoExAc.Create(self);
   {$WARNINGS ON}
   Try
      BitExceso.Apli:=Objeto.Apli;
      BitExceso.ParamCre:=Objeto.ParamCre;
      BitExceso.ID_ACREDITADO.AsFloat := Objeto.ID_ACREDITADO.AsFloat;
      BitExceso.NOMBRE.AsString := Objeto.Persona.Nombre.AsString;
      BitExceso.Catalogo;
   finally
      BitExceso.Free;
   end;
end;

// Inicia Modificaciones por SATV4766 el 19JUL2006
procedure TWCrAcreditado.CalculaImpDisponible;
var vlIMP_TOT_DISPONIB : Double;
    vlRESULTADO    : Integer;
    vlTX_RESULTADO : String;
begin
 With Objeto Do
   Begin
    If (Modo = moAppend) Then
      IMP_TOT_DISPONIB.AsFloat := IMP_MAX_AUTOR.AsFloat
    Else
      Begin
      If (Modo = moEdit) Then
        GetFromControl;
      If StpImpAcredTotDisp(1,                          // peNUM_METODO      : Integer;
                            ID_ACREDITADO.AsInteger,    // peID_ACREDITADO   : Integer;
                            -1,                         // peID_CONTRATO     : Integer;
                            CVE_TIP_DISPOS.AsString,    // peCVE_TIP_DISPOS  : String;
                            IMP_MAX_AUTOR.AsFloat,      // peIMP_MAX_AUTOR   ,
                            IMP_EXCESO_EVE.AsFloat,     // peIMP_EXCESO_EVE  : Double;
                            CVE_AFEC_INC_DEC.AsString,  // peCVE_AFEC_INC_DEC: String;
                            CVERDAD,                    // peB_TIPO_CAMBIO   : String;
                            vlIMP_TOT_DISPONIB,         // var psIMP_DISPONIBLE : Double;
                            vlRESULTADO,                // var psRESULTADO   : Integer;
                            vlTX_RESULTADO              // var psTX_RESULTADO : String
                           ) Then
         IMP_TOT_DISPONIB.AsFloat := vlIMP_TOT_DISPONIB
      Else
         MessageDlg(vlTX_RESULTADO, mtError, [mbOk], 0);
      End;
   End;
end;

procedure TWCrAcreditado.MuestraImportes;
var vlIMP_TOT_BLOQUEADO : Double;
    vlRESULTADO    : Integer;
    vlTX_RESULTADO : String;
begin
  With Objeto Do
    Begin
    // LOLS 15 NOV 2006. Inicializa el importe total autorizado ya que en caso de no tener
    //                   incrementos / decrementos el campo IMP_TOT_AUT aparece como 0 (cero).
    IMP_TOT_AUT.AsFloat := IMP_MAX_AUTOR.AsFloat;
    // ENDS_LOLS_15_NOV_2006
    // 
    If (CVE_AFEC_INC_DEC.AsString = 'I') Then
      IMP_TOT_AUT.AsFloat := IMP_MAX_AUTOR.AsFloat + IMP_EXCESO_EVE.AsFloat
    Else If (CVE_AFEC_INC_DEC.AsString = 'D') Then
      IMP_TOT_AUT.AsFloat := IMP_MAX_AUTOR.AsFloat - IMP_EXCESO_EVE.AsFloat;

    If StpImpAcredTotBloq(vlIMP_TOT_BLOQUEADO,
                          vlRESULTADO,
                          vlTX_RESULTADO
                         ) Then
       IMP_TOT_BLOQUEADO.AsFloat := vlIMP_TOT_BLOQUEADO
     Else
       MessageDlg(vlTX_RESULTADO, mtError, [mbOk], 0);
    End;
end;

procedure TWCrAcreditado.HabilitaIncreDecre;
begin
 With Objeto Do
  If (Modo = moEdit) Then
  begin
    If (SusContratosAplicanIncDec) Then
    Begin
      HabilitaCtrlsIncreDecre( IMP_EXCESO_EVE.AsFloat = 0 );
      HabilitaEdityFechaIncreDecre( (CVE_AFEC_INC_DEC.AsString <> 'N') And (IMP_EXCESO_EVE.AsFloat = 0));
    End
    else  // LOLS 18 NOV 2006. CL
      HabilitaEdityFechaIncreDecre( False );
    //

    HabilitaEstadosyMunicipios (Modo = moEdit);
    HabilitaAnexo19 (Modo = moEdit);
  end;
end;

procedure TWCrAcreditado.HabilitaEstadosyMunicipios (peB_Habilita: boolean);
begin
(* Código original antes de la migración de Anexo 18 a Modelos Dinámicos
  tsEstadosyMunc.Enabled        := peB_Habilita;
  sagAnexo18.Enabled            := peB_Habilita;
  sagSevPerdida.Enabled         := peB_Habilita;
  edProbInc.ReadOnly            := not peB_Habilita;
  btCargaMasiva.Enabled         := peB_Habilita;
  btSalvaCambiosAnexo18.Enabled := peB_Habilita;
  sagContProy.Enabled           := peB_Habilita;
*)

  tsEstadosyMunc.Enabled        := False;
  sagAnexo18.Enabled            := False;
  sagSevPerdida.Enabled         := False;
  edProbInc.ReadOnly            := True;
  btCargaMasiva.Enabled         := False;
  btSalvaCambiosAnexo18.Enabled := False;
  sagContProy.Enabled           := peB_Habilita;
end;

procedure TWCrAcreditado.HabilitaAnexo19 (peB_Habilita: boolean);
begin
  if peB_Habilita then
    EstadoAnexo19 := eaBusqueda
  else
    EstadoAnexo19 := eaInactivo;

  sagContProy.Enabled            := peB_Habilita;
  bbProyectos_ContProy.Enabled   := peB_Habilita;
  bbMetodologia_ContProy.Enabled := peB_Habilita;
end;


procedure TWCrAcreditado.HabilitaEdityFechaIncreDecre( peB_HABILITA : Boolean );
begin
  edIMP_EXCESO_EVE.Enabled    := peB_HABILITA;
  edIMP_EXCESO_EVE.ReadOnly   := Not peB_HABILITA;
  edIMP_EXCESO_EVE.TabStop    := peB_HABILITA;
  If (peB_HABILITA) Then
    edIMP_EXCESO_EVE.Color := clWindow
  Else
    edIMP_EXCESO_EVE.Color := clBtnFace;

  edF_VTO_EXCESO.Color    := edIMP_EXCESO_EVE.Color;
  edF_VTO_EXCESO.Enabled  := edIMP_EXCESO_EVE.Enabled;
  edF_VTO_EXCESO.ReadOnly := edIMP_EXCESO_EVE.ReadOnly;
  edF_VTO_EXCESO.TabStop  := edIMP_EXCESO_EVE.TabStop;

  dtpF_VTO_EXCESO.Enabled := edIMP_EXCESO_EVE.Enabled;
end;

procedure TWCrAcreditado.HabilitaCtrlsIncreDecre( peB_HABILITA : Boolean );
begin
  HabilitaEdityFechaIncreDecre(peB_HABILITA);
  cbCVE_AFEC_INC_DEC.Color    := edIMP_EXCESO_EVE.Color;
  cbCVE_AFEC_INC_DEC.Enabled  := edIMP_EXCESO_EVE.Enabled;
  cbCVE_AFEC_INC_DEC.TabStop  := edIMP_EXCESO_EVE.TabStop;
end;

procedure TWCrAcreditado.rgCVE_TIP_DISPOSClick(Sender: TObject);
begin
 If (rgCVE_TIP_DISPOS.ItemIndex > -1) Then
  CalculaImpDisponible;
end;

procedure TWCrAcreditado.cbCVE_AFEC_INC_DECChange(Sender: TObject);
var vlBAplicaAfecIncDec : Boolean;
begin
  With Objeto Do
     If (Modo = moEdit) Then
        Begin
        CVE_AFEC_INC_DEC.GetFromControl;
        F_VTO_EXCESO.AsDateTime := Apli.DameFechaEmpresa;
        vlBAplicaAfecIncDec := CVE_AFEC_INC_DEC.AsString <> 'N';
        HabilitaEdityFechaIncreDecre(vlBAplicaAfecIncDec);
        If Not vlBAplicaAfecIncDec Then IMP_EXCESO_EVE.AsFloat := 0;
        MuestraImportes;
        CalculaImpDisponible;
        End;
end;

procedure TWCrAcreditado.rgCVE_TIP_DISPOSExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_TIP_DISPOS, True,'',True);
end;

procedure TWCrAcreditado.grbxCalificacionExit(Sender: TObject);
begin
   InterForma1.ValidaExit(grbxCalificacion, True,'',True);
end;
// Termina Modificaciones por SATV4766

procedure TWCrAcreditado.InterForma1ErrorAceptar(Sender: TObject);
begin
   Objeto.RestauraValoresOriginales;
end;

procedure TWCrAcreditado.btComisionesClick(Sender: TObject);
var CrCnPrAcc : TCrCnPrAcc;
begin
    if Objeto.Active then
    begin
      {$WARNINGS OFF}
      CrCnPrAcc := TCrCnPrAcc.Create(Self);
      {$WARNINGS ON}
      try
        CrCnPrAcc.Apli:=Objeto.Apli;
        CrCnPrAcc.ParamCre:=Objeto.ParamCre;
        CrCnPrAcc.CVE_ACCESORIO.AsString  := C_ACCESORIO_ACREDITADO;
        CrCnPrAcc.ID_ACCESORIO.AsInteger  := Objeto.ID_ACREDITADO.AsInteger;
        CrCnPrAcc.FOL_ACCESORIO.AsInteger := 0;
        CrCnPrAcc.Catalogo;
      finally
        CrCnPrAcc.Free;
      end;
    end else
      ShowMessage('Debe de seleccionar un acreditado');
    //end if;
end;

procedure TWCrAcreditado.btCVE_PER_JUR_REGClick(Sender: TObject);
Var T : TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_PJUR',True,True) then
   begin
      With Objeto Do
        begin
          T := CreaBuscador('ICrCoCD.it','I');
          T.WhereString := ' CVE_CON_GPO_CAT = ''CAT_PERS_JURID''' ;
          T.ShowAll := True;
          Try
            If T.Execute Then
               Begin
                 CVE_PER_JUR_REG.AsString := T.DameCampo(0);
                 DESC_CVE_PER_JUR_REG.AsString := T.DameCampo(1);
                 InterForma1.NextTab(btNOM_ACRED_REG);
               end;
          finally
            T.Free;
          end;
        end;
   end;
end;

procedure TWCrAcreditado.edCVE_PER_JUR_REGExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_PER_JUR_REG,True,'',True);
end;

procedure TCrAcredit.ObtenDescripcion( peStrSQL, peStrNomCampo: String; peCVE_INTERCAMPO, peDESC_INTERCAMPO: TInterCampo);
var vlStrCampoResult : String;
begin
      GetSQLStr(peStrSQL, Apli.DataBaseName, Apli.SessionName, peStrNomCampo, vlStrCampoResult, False);
      If (Trim(vlStrCampoResult) <> '') Then
      begin
          peDESC_INTERCAMPO.AsString := vlStrCampoResult;
      end;
end;

function TCrAcredit.ObtenNombre( peID_PERSONA: String; var PPResultado: String ): Boolean;
var  vlStpValNombre : TStoredProc;
     vlResult     : Boolean;
begin
  PPResultado := '';
  vlStpValNombre := TStoredProc.Create(Self);  
  Try
     With vlStpValNombre Do
     Begin
        //Inicia el SPT
        vlStpValNombre.DatabaseName:= Apli.DatabaseName;
        vlStpValNombre.SessionName:= Apli.SessionName;
        vlStpValNombre.StoredProcName:= 'ADMIPROD.PKGCRCONSOLIDADO1.STP_VALIDA_NOM_ACRED';

        Params.Clear;
        Params.CreateParam( ftString,   'peID_PERSONA',     ptInput);
        Params.CreateParam( ftString,  'psNOMBRE',    ptOutput);
        Params.CreateParam( ftFloat, 'psRESULTADO', ptOutput);
        Params.CreateParam( ftString, 'psTX_RESULTADO', ptOutput);

        Prepare;
        ParamByName('peID_PERSONA').AsString    := peID_PERSONA;
        ExecProc;

        If (ParamByName('psRESULTADO').AsInteger <> 0) then
        begin
           PPResultado := 'Error No ' + ParamByName('psTX_RESULTADO').AsString;
           vlResult := False;
        end
        else
        begin
             vlResult := True;
             NOM_ACRED_REG.AsString := ParamByName('psNOMBRE').AsString;
        end;

     end;
   Finally
        If Assigned(vlStpValNombre) Then
           vlStpValNombre.Free;
   End;
   Result := vlResult;
end;

function TCrAcredit.ObtenPerJuriica( peID_PERSONA: String; var PPResultado: String ): Boolean;
var  vlStpPersJuridica : TStoredProc;
     vlResult     : Boolean;
begin
  PPResultado := '';
  vlStpPersJuridica := TStoredProc.Create(Self);  
    Try
     With vlStpPersJuridica Do
     Begin
        //Inicia el SPT
        vlStpPersJuridica.DatabaseName:= Apli.DatabaseName;
        vlStpPersJuridica.SessionName:= Apli.SessionName;
        vlStpPersJuridica.StoredProcName:= 'ADMIPROD.PKGCRCONSOLIDADO1.STP_PER_JUR_ACRED';

        Params.Clear;
        Params.CreateParam( ftString,   'peID_PERSONA',     ptInput);
        Params.CreateParam( ftString,  'psCVE_PER_JUR_REG',    ptOutput);
        Params.CreateParam( ftFloat, 'psRESULTADO', ptOutput);
        Params.CreateParam( ftString, 'psTX_RESULTADO', ptOutput);

        Prepare;
        ParamByName('peID_PERSONA').AsString    := peID_PERSONA;
        ExecProc;

        If (ParamByName('psRESULTADO').AsInteger <> 0) then
        begin
           PPResultado := 'Error No ' + ParamByName('psTX_RESULTADO').AsString;
           vlResult := False;
        end
        else
        begin
             vlResult := True;
             CVE_PER_JUR_REG.AsString := ParamByName('psCVE_PER_JUR_REG').AsString;
             ObtenDescripcion( ' SELECT CR.DESC_CLAVE AS DESC_CVE'+coCRLF+
                       ' FROM CR_CON_CAT_DATA CR'+coCRLF+
                       ' WHERE CR.CVE_CON_GPO_CAT = ''CAT_PERS_JURID'' AND CR.CVE_CLAVE = '+CVE_PER_JUR_REG.AsString+coCRLF,
                        'DESC_CVE',
                       CVE_PER_JUR_REG,
                       DESC_CVE_PER_JUR_REG
                     );
        end;

     end;
   Finally
        If Assigned(vlStpPersJuridica) Then
           vlStpPersJuridica.Free;
   End;
   Result := vlResult;
end;

procedure TWCrAcreditado.btNOM_ACRED_REGClick(Sender: TObject);
var  VLMesg     :  String;
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_FMTNM',True,True) then
   begin
      VLMesg := '';
      Objeto.ID_ACREDITADO.GetFromControl;
      If Objeto.ID_ACREDITADO.AsString <> '' then
      begin
           if Messagedlg('¿Desea cambiar el nombre CNBV?',mtConfirmation,[mbYES, mbNO], 0) = mrYes then
           begin
                Objeto.ObtenNombre( Objeto.ID_ACREDITADO.AsString, VLMesg );
           end;
      end
      else
        ShowMessage('No. de acreditado vacío');
   end;
end;

procedure TWCrAcreditado.edNOM_ACRED_REGExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edNOM_ACRED_REG, True,'',True);
end;

procedure TWCrAcreditado.edNUM_EMPLEADOSExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   VLMesg     := '';
   vlSalida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.NUM_EMPLEADOS.GetFromControl;
      Objeto.CVE_PER_JUR_REG.GetFromControl;
      if Objeto.NUM_EMPLEADOS.AsFloat <= 0 then
      Begin
         vlSalida := False;
         vlMesg := 'El numero de debe ser mayor a cero';
      end;
      //SASG4921 23/11/2015 Se valida si eS Persona fisica el valor solo puede ser 1
      if (Objeto.CVE_PER_JUR_REG.AsString = '1') and (Objeto.NUM_EMPLEADOS.AsFloat <>1) then
      Begin
         vlSalida := False;
         vlMesg := 'Cuando la clave juridica 1 (Persona fisica), el valor sólo puede ser 1';
      end;
      {
      //RIRA4281 16Jun2010 Se valida si es fideicomiso o Persona fisica y el valor solo puede ser 1
      if ((Objeto.CVE_PER_JUR_REG.AsString = '4') OR (Objeto.CVE_PER_JUR_REG.AsString = '1')) and (Objeto.NUM_EMPLEADOS.AsFloat <>1) then
      Begin
         vlSalida := False;
         vlMesg := 'Cuando la clave juridica es 4(Fideicomiso) ó 1 (Persona fisica), el valor sólo puede ser 1';
      end;
       //RIRA4281 16Jun2010 Se valida si es  11 Gobierno Federal, 12 gobiernos del dpto del df, 13 gob est y fed, 14 organismos descentralizado solo puede ser 1
      if (((Objeto.Persona.Cve_Tipo_Sector.AsString = '11') OR
           (Objeto.Persona.Cve_Tipo_Sector.AsString = '12') OR
           (Objeto.Persona.Cve_Tipo_Sector.AsString = '13') OR
           (Objeto.Persona.Cve_Tipo_Sector.AsString = '14')) and
           (Objeto.NUM_EMPLEADOS.AsFloat <>1)) then
      Begin
         vlSalida := False;
         vlMesg := 'Si el sector es 11, 12, 13 ó 14 de la persona corporativa, el valor solo puede ser 1';
      end;
      }
      InterForma1.ValidaExit(edNUM_EMPLEADOS,VLSalida,VLMesg,True);
   end;
end;


procedure TWCrAcreditado.btNOM_ACRED_REGExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edNOM_ACRED_REG, True,'',True);
end;

procedure TWCrAcreditado.ilCVE_PER_JUR_REGEjecuta(Sender: TObject);
begin
     with Objeto do
     begin
        CVE_PER_JUR_REG.GetControl;
        ObtenDescripcion( ' SELECT CR.DESC_CLAVE AS DESC_CVE'+coCRLF+
                       ' FROM CR_CON_CAT_DATA CR'+coCRLF+
                       ' WHERE CR.CVE_CON_GPO_CAT = ''CAT_PERS_JURID'' AND CR.CVE_CLAVE = '''+edCVE_PER_JUR_REG.Text+''''+coCRLF,
                        'DESC_CVE',
                       CVE_PER_JUR_REG,
                       DESC_CVE_PER_JUR_REG
                     );
         InterForma1.NextTab(edCVE_PER_JUR_REG);
     end;
end;

procedure TWCrAcreditado.edRFC_CNBVExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edRFC_CNBV, True,'',True);
end;

procedure TWCrAcreditado.edCVE_METODOLOGIAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_METODOLOGIA, True,'',True);
end;

procedure TWCrAcreditado.edCVE_RIESGO_PAISExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_RIESGO_PAIS, True,'',True);
end;

procedure TWCrAcreditado.edCVE_RIESGO_FINANExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edCVE_RIESGO_FINAN, True,'',True);
end;

procedure TWCrAcreditado.edCVE_RIESGO_INDUSExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edCVE_RIESGO_INDUS, True,'',True);
end;

procedure TWCrAcreditado.chkB_ENTIDAD_FINExit(Sender: TObject);
begin
  InterForma1.ValidaExit(chkB_ENTIDAD_FIN, True,'',True);
end;

procedure TWCrAcreditado.btCVE_METODOLOGIAClick(Sender: TObject);
Var T : TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_METOD',True,True) then
   begin
      With Objeto Do
        begin
          T := CreaBuscador('ICrCoCD.it','S');
          T.WhereString := ' CVE_CON_GPO_CAT = ''CAT_METODOLOGIA''' ;
          T.ShowAll := True;
          Try
            If T.Execute Then
               Begin
                 CVE_METODOLOGIA.AsString := T.DameCampo(0);
                 DESC_METODOLOGIA.AsString := T.DameCampo(1);
                 InterForma1.NextTab(btCVE_METODOLOGIA);
               end;
          finally
            T.Free;
          end;
        end;
   end;
end;

procedure TWCrAcreditado.ilCVE_METODOLOGIAEjecuta(Sender: TObject);
begin
 With Objeto Do
    Begin
    CVE_METODOLOGIA.GetFromControl;
    ObtenDescripcion( ' SELECT CR.DESC_CLAVE AS DESC_CVE'+coCRLF+
                      ' FROM CR_CON_CAT_DATA CR'+coCRLF+
                      ' WHERE CR.CVE_CON_GPO_CAT = ''CAT_METODOLOGIA'' AND CR.CVE_CLAVE = '''+CVE_METODOLOGIA.AsString+''''+coCRLF,
                      'DESC_CVE',
                      CVE_METODOLOGIA,
                      DESC_METODOLOGIA
                   );
     InterForma1.NextTab(edCVE_METODOLOGIA);
    End;
end;

Function  TWCrAcreditado.ValidaRFC(sPerJur, sS_RFC, sF_RFC, sH_RFC : String) : Boolean; //Validación del RFC de la persona 5 de Abril de 2010 EISBDT04 (ORG)
Var
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
  with Objeto.Persona do
  begin
    if sPerJur = 'PF' then //si es persona física
    begin
      if (Length(sS_RFC) = 4) and (Length(sF_RFC) = 6) and (Length(sH_RFC) = 3) then //todo: investigar si hay constante para este valor y para el de persona física
        bLongOK := True;
    end
    else // si es persona moral
    begin
      if (Length(sS_RFC) = 3) and (Length(sF_RFC) = 6) and (Length(sH_RFC) = 3) then //todo: investigar si hay constante para este valor y para el de persona física
        bLongOK := True;
    end;
    if bLongOK then
      if CompruebaAlfa(sS_RFC) then
        if CompruebaNum(sF_RFC) then  // Longitud de la fecha de RFC        
          Result := True;
  end; //with
end;

Function  TWCrAcreditado.GuardaBitacoraRFC : Boolean;
Var
  sSQL, sRFC, sSelec : String;
  QryTmp : TQuery;
Begin
  Result := True;
  QryTmp := TQuery.Create(Application);
  QryTmp.DatabaseName := Objeto.DataBaseName;
  QryTmp.SessionName := Objeto.SessionName;
  With Objeto.Persona do
        sRFC :=  Trim(Siglas_RFC.AsString) + (F_RFC.AsString) + (Homoclave_RFC.AsString);
  if chB_AUTORIZADO.Checked then
    sSelec := 'V'
  else
    sSelec := 'F';
  sSQL := 'INSERT INTO ADMIPROD.CR_BIT_AUTO_RFC(F_ALTA, ID_ACREDITADO, CVE_USU_AUTORIZA, RFC, B_AUTORIZADO) VALUES (' +
          'SYSDATE, ' +
          Trim(edID_ACREDITADO.Text) + ', ' +
          QuotedStr(Objeto.Apli.Usuario) + ', ' +
          QuotedStr(sRFC) + ', ' +
          QuotedStr(sSelec) + ')';
  try
        QryTmp.SQL.Text := sSQL;
        QryTmp.ExecSQL;
  except
        ShowMessage('Error al insertar datos en bitácora');
        Result := False;
  end;
  QryTmp.Free;
end;

procedure TWCrAcreditado.btRECUP_ACREDITAClick(Sender: TObject);
Var     RelReAcre      : TCrAcreRe;
begin
  if Objeto.Active then
  begin
    {$WARNINGS OFF}
     RelReAcre := TCrAcreRe.Create(self);
    {$WARNINGS ON}
    try
       RelReAcre.Apli:=Objeto.Apli;
       RelReAcre.ParamCre:=Objeto.ParamCre;
       RelReAcre.ID_ACREDITADO.AsString := Objeto.ID_ACREDITADO.AsString;
       RelReAcre.vldescripcion_Acre:= edDESC_ACREDITADO.Text;
       RelReAcre.Catalogo;
    finally
      RelReAcre.Free;
      Objeto.FindKey([Objeto.ID_ACREDITADO.AsString]);
    end;
  end else
    ShowMessage('Debe de seleccionar un acreditado');
  //end if;
end;

function TWCrAcreditado.validaDireccionCNBV(strAcreditado: string): string;
Var
  strSQL, strValor : string;
Begin
  strSQL :=  ' ' +
      ' SELECT * FROM ( ' +
      '	select cve_cnbv from ( ' +
      '		SELECT (   484 ' +
      '		        || TRIM (TO_CHAR (t3.id_estado_pml, ' + quotedstr('00') +')) ' +
      '		        || TRIM (TO_CHAR (t3.id_poblacion_pml, ' + quotedstr('000') +')) ' +
      '		       ) AS cve_cnbv ' +
      '		  FROM persona t1 INNER JOIN domicilio t2 ' +
      '		       ON (t2.id_domicilio = NVL (t1.id_dom_fiscal, t1.id_domicilio)) ' +
      '		       INNER JOIN codigo_postal t3 ON (t3.codigo_postal = t2.codigo_postal) ' +
      '		 WHERE t1.id_persona = %s AND ROWNUM = 1 ' +
      '		 ) lc where lc.cve_cnbv in (select substr(cve_local_cnbv, 1, 8)  FROM CR_LOCAL_CNBV) ' +
      '	union all ' +
      '	select cve_cnbv from ( ' +
      '		SELECT (   484 ' +
      '		        || TRIM (TO_CHAR (t3.id_estado_pml, ' + quotedstr('00') + ')) ' +
      '		       ) AS cve_cnbv ' +
      '		  FROM persona t1 INNER JOIN domicilio t2 ' +
      '		       ON (t2.id_domicilio = NVL (t1.id_dom_fiscal, t1.id_domicilio)) ' +
      '		       INNER JOIN codigo_postal t3 ON (t3.codigo_postal = t2.codigo_postal) ' +
      '		 WHERE t1.id_persona = %s AND ROWNUM = 1 ' +
      '		 ) lc where lc.cve_cnbv in (select substr(cve_local_cnbv, 1, 5)  FROM CR_LOCAL_CNBV) ' +
      '	) qry where rownum = 1 ' +
      ' order by qry.cve_cnbv desc ';

  strSQL := format(strSQL, [strAcreditado, strAcreditado]);

  GetSQLStr(strSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'CVE_CNBV', strValor, false);

  result := strValor;
end;


procedure TWCrAcreditado.pgAltaDatosChange(Sender: TObject);
var
  vID_Acreditado: String;
  psMsgResultado : String;
  psResultado, Row: Integer;
begin
  //Reinicia los componentes
  DecimalSeparator:= '.';
  thousandseparator:=',';

  if pgAltaDatos.ActivePage = tsEstadosyMunc then
  begin
    sagAnexo18.Refresh;
    MetVar_ConfiguraGrid (sagAnexo18);
    MetVar_CargaGrid (sagAnexo18, Objeto.Id_Acreditado.AsInteger, Objeto.CVE_METODOLOGIA.AsString);

    qEstados.Close;
    qEstados.DatabaseName := Objeto.Apli.DataBaseName;
    qEstados.SessionName  := Objeto.Apli.SessionName;

    If Objeto.Id_Acreditado.AsString <> '' then
    begin
      lbAviso.Visible := False;

      qEstados.ParamByName ('Id_Acreditado').AsInteger:= Objeto.Id_Acreditado.AsInteger;
      qEstados.Open;

      qSevPerdida.Close;
      qSevPerdida.DatabaseName := Objeto.Apli.DataBaseName;
      qSevPerdida.SessionName  := Objeto.Apli.SessionName;

      qSevPerdida.ParamByName ('Id_Acreditado').AsInteger:= Objeto.Id_Acreditado.AsInteger;
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
  end
  (* Migración de Anexo 19 a Modelos Dinámicos
  else if pgAltaDatos.ActivePage = tsAnexo19 then
  begin
    edIdentificador_Proy.Text  := '';
    edNombre_Proy.Text         := '';
    edDescripcion_Proy.Text    := '';
    rdgEtapa_Proy.ItemIndex    := -1;
    edImp_Sobrecosto_Proy.Text := '';
    edImp_Cub3ros_Proy.Text    := '';
    edUtilidDefic_Proy.Text    := '';
    MetVar_CargaContratosAnexo19;
  end;*)
end;

procedure TWCrAcreditado.btCargaMasivaClick(Sender: TObject);
var
  AcreditCargaMas : TFormCarMas;
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_CGAMS', True, True) then
     try
       AcreditCargaMas              := TFormCarMas.Create(Nil);
       AcreditCargaMas.DatabaseName := Objeto.Apli.DataBaseName;
       AcreditCargaMas.SessionName  := Objeto.Apli.SessionName;
       AcreditCargaMas.Metodologia  := Objeto.CVE_METODOLOGIA.AsString;
       AcreditCargaMas.Usuario      := Objeto.DameUsuario;
       AcreditCargaMas.ShowModal;
     finally
       if Assigned (AcreditCargaMas) then
          AcreditCargaMas := nil;
     end;
end;

function TryStrToInt (S: string; var n: integer): boolean;
var
  e: integer;
begin
  Val (s, n, e);

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

procedure TWCrAcreditado.btSalvaCambiosAnexo18Click(Sender: TObject);
var
  psMsgResultado : String;
  psResultado:     Integer;
  paquete:         String;
  proc_alta:       String;
  vlQry_Pkg_Proc:  TQuery;
  Stored_Proc:     TStoredProc;
  row:             Integer;
  NomVariable:     String;
  TipoDato:        String;
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_SLVCB',True,True) then
   begin
     MetVar_GuardarDatos (sagAnexo18, Objeto.ID_ACREDITADO.AsInteger, Objeto.CVE_METODOLOGIA.AsString, psResultado, psMsgResultado);

     if psResultado = 0 then
     begin
       MessageDlg('Se guardaron con éxito los cambios', mtInformation, [mbOk], 0);
       btSalvaCambiosAnexo18.Enabled := False;
       btCancelarAnexo18.Enabled     := False;
     end
     else
       MessageDlg('Hubo un error :  '+ psMsgResultado, mtError, [mbOk], 0);
   end;
end;

procedure TWCrAcreditado.btCancelarAnexo18Click(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_CANC',True,True) then
   begin
      pgAltaDatosChange(Self);
      btSalvaCambiosAnexo18.Enabled := False;
      btCancelarAnexo18.Enabled     := False;
   end;
end;

procedure TWCrAcreditado.btCve_aveClick(Sender: TObject);

Var T : TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_AVE',True,True) then
   begin
      With Objeto Do
        begin
          T := CreaBuscador('ICRTAVE.IT','I');
          T.ShowAll := True;
          Try
            If T.Execute Then
               Begin
                  Cve_Ave.AsString :=  T.DameCampo(0);
                  edDesc_Cve_Ave.Text := T.DameCampo(1);
                 //InterForma1.NextTab(edCve_Ave);
               end;
          finally
            T.Free;
          end;
        end;
   end;
end;

procedure TWCrAcreditado.edCve_AveExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edCve_Ave,True,'',True);
end;

procedure TWCrAcreditado.pgAltaDatosChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
(* Migración de Anexos 18 y 19 a Modelos Dinámicos
  if (pgAltaDatos.ActivePage = tsEstadosyMunc) and btSalvaCambiosAnexo18.Enabled then
  begin
    AllowChange := False;
    MessageDlg ('Se han realizado cambios, es necesario guardarlos o cancelarlos', mtWarning, [mbOk], 0);
  end
  else if (pgAltaDatos.ActivePage = tsAnexo19) and (EstadoAnexo19 in [eaInsercion, eaEdicion]) then
  begin
    AllowChange := False;
    MessageDlg ('Se han realizado cambios, es necesario guardarlos o cancelarlos', mtWarning, [mbOk], 0);
  end;*)
end;

//Manejadores de eventos genéricos para los grids de variables de las Metodologías de Comercial
procedure TWCrAcreditado.MetVar_GridAfterEdit(Sender: TObject; col,
  row: Integer);
begin
  //Valida si ya fue seleccionado un acreditado
  btSalvaCambiosAnexo18.Enabled := Objeto.ID_ACREDITADO.AsString <> '';
  btCancelarAnexo18.Enabled     := Objeto.ID_ACREDITADO.AsString <> '';
end;

procedure TWCrAcreditado.MetVar_GridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ACol = col_Valor then
    (Sender as TStringAlignGrid).Options := (Sender as TStringAlignGrid).Options + [goEditing]
  else
    (Sender as TStringAlignGrid).Options := (Sender as TStringAlignGrid).Options - [goEditing]
end;

procedure TWCrAcreditado.MetVar_GridShowHintCell(Sender: TObject; col,
  row: Integer; var HintStr: String; var CanShow: Boolean;
  var HintInfo: THintInfo);
begin
  HintStr := '';

  if (col = col_Desc_Var) and (row > 0) then
    HintStr := (Sender as TStringAlignGrid).Cells [col, row];
end;

procedure TWCrAcreditado.MetVar_GridValidateEdit(Sender: TObject; col,
  row: Integer; var result: Boolean);
var
  s, s2: string;
  e: integer;
  r: real;
  Query: TQuery;
  Year, Month, Day: word;
begin
  s := (Sender as TStringAlignGrid).Cells [col, row];

  if s = '' then exit;

  if UpperCase ((Sender as TStringAlignGrid).Cells [col_Tipo_Dato, row]) = 'DATE' then
  begin
    if not IsValidDate (s) then
    begin
      MessageDlg (Format ('[%s] no es una fecha válida', [s]), mtError, [mbOk], 0);
      result := False;
    end
    else
    begin
      s2    := FormatDateTime ('dd/mm/yyyy', Objeto.Apli.DameFechaEmpresa);
      Year  := StrToInt (Copy (s2, 7, 4));
      Month := StrToInt (Copy (s2, 4, 2));
      Day   := StrToInt (Copy (s2, 1, 2));

      Query              := TQuery.Create (Self);
      Query.DatabaseName := Objeto.Apli.DataBaseName;
      Query.SessionName  := Objeto.Apli.SessionName;
      Query.SQL.Add ('Select Case When Trunc (To_Date (:F_Prueba, ''dd/mm/yyyy''), ''mm'') > Trunc (:F_Empresa, ''mm'') Then ''V'' Else ''F'' End Es_Mayor From Dual');
      Query.ParamByName ('F_Prueba').AsString := s;
      Query.ParamByName ('F_Empresa').AsDate  := EncodeDate (Year, Month, Day);
      Query.Open;

      if Query.FieldByName ('Es_Mayor').AsString = 'V' then
      begin
        MessageDlg (Format ('La fecha [%s] no puede ser mayor que la fecha actual', [s]), mtError, [mbOk], 0);
        result := False;
      end;
    end;
  end
  else
  begin
    val (s, r, e);

    result := e = 0;
    if not result then
    begin
      MessageDlg (Format ('[%s] no es un numero válido', [s]), mtError, [mbOk], 0);
      result := False;
    end
  end;
end;

//Procedimientos genéricos para la configuración, despliegue, validaciones y salvado de los Grids de Variables
//de las Metodologías de Comercial
procedure TWCrAcreditado.MetVar_ConfiguraGrid (Grid: TStringAlignGrid);
begin
  Grid.Options        := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing];
  Grid.OnSelectCell   := MetVar_GridSelectCell;
  Grid.OnShowHintCell := MetVar_GridShowHintCell;
  Grid.OnAfterEdit    := MetVar_GridAfterEdit;
  Grid.OnValidateEdit := MetVar_GridValidateEdit;
end;

procedure TWCrAcreditado.MetVar_CargaGrid (Grid: TStringAlignGrid; Id_Acreditado: Integer; Met: String);
var
  vlQry_Tabla:   TQuery;
  vlQry_Vars:    TQuery;
  vlQry_Valores: TQuery;
  NoRegistros:   Integer;
  col, row:      Integer;
  NomVariable:   String;
  TipoDato:      String;
  Tabla_Vigente: String;
begin
  try
    // Establece el número de columnas
    Grid.ColCount  := const_No_Columnas;
    // Establece el número de filas inicial
    Grid.RowCount  := 1;
    // Establece el ancho de las columnas
    Grid.ColWidths [col_No_Variable] := 30;
    Grid.ColWidths [col_Desc_Var]    := 310;
    Grid.ColWidths [col_Valor]       := 180;
    Grid.ColWidths [col_Nombre_Var]  := 0;
    Grid.ColWidths [col_Tipo_Dato]   := 0;

    // Establece los títulos de las columnas
    Grid.Cells [col_No_Variable, 0] := 'No.';
    Grid.Cells [col_Desc_Var,    0] := 'Variable';
    Grid.Cells [col_Valor,       0] := 'Valor';
    Grid.Cells [col_Nombre_Var,  0] := 'Nombre Var';
    Grid.Cells [col_Tipo_Dato,   0] := 'Tipo Dato';
    // Centra los títulos
    Grid.AlignRow [0]               := alCenter;
    Grid.AlignCol [col_No_Variable] := alRight;
    Grid.AlignCol [col_Desc_Var]    := alLeft;
    Grid.AlignCol [col_Valor]       := alRight;
    Grid.FixColorRow [0]            := clBtnFace;

    // Activan ambas barras de desplazamiento (vertical y horizontal)
    Grid.ScrollBars := ssBoth;

    //Consulta para obtener el nombre de la tabla de viegentes correspondiente a la metodología
    vlQry_Tabla              := TQuery.Create (Self);
    vlQry_Tabla.DatabaseName := Objeto.Apli.DataBaseName;
    vlQry_Tabla.SessionName  := Objeto.Apli.SessionName;
    vlQry_Tabla.SQL.Add ('Select Tabla_Vigente     ' +
                         'From CR_Per_Metodologias ' +
                         'Where Cve_Metodologia = ''' + Met + '''');
    vlQry_Tabla.Open;

    if not vlQry_Tabla.Eof then
      Tabla_Vigente := vlQry_Tabla.FieldByName ('Tabla_Vigente').AsString;

    vlQry_Tabla.Free;

    // Consulta para obtener las variables correspondientes a la metodología del Acreditado
    vlQry_Vars              := TQuery.Create (Self);
    vlQry_Vars.DatabaseName := Objeto.Apli.DataBaseName;
    vlQry_Vars.SessionName  := Objeto.Apli.SessionName;
    vlQry_Vars.SQL.Add ('Select Row_Number () Over (Order By CPVXM.Orden Asc) As No_Var,     ' +
                        '       CPVXM.Orden,                                                 ' +
                        '       CPVM.Variable,                                               ' +
                        '       CPVM.Desc_Variable,                                          ' +
                        '       CPVM.Tipo_Dato                                               ' +
                        '  From CR_Per_Vars_X_Met    CPVXM                                   ' +
                        '  Join Cr_Per_Variables_Met CPVM  On CPVXM.Variable = CPVM.Variable ' +
                        ' Where CPVXM.Cve_Metodologia = ''' + Met + '''                      ' +
                        '   And CPVM.Variable <> ''' + 'ID_ACREDITADO' + '''                 ' +
                        ' Order By CPVXM.Orden Asc');
    vlQry_Vars.Open;

    // Extrae el número de registros que se obtuvieron de la consulta  
    NoRegistros := vlQry_Vars.RecordCount;

    // Para validar que la consulta haya devuelto al menos 1 registro
    if not vlQry_Vars.Eof then
    begin
      // Establece el número de renglones en base al número de registros obtenidos en la consulta
      Grid.RowCount := NoRegistros + 1;

      // Fija la primer columna y el primer renglon
      Grid.FixedCols := 1;
      Grid.FixedRows := 1;

      // Limpia los registros del grid antes de insertar los datos para no guardar basura
      For row := 1 to NoRegistros do
        For col := 0 to const_No_Columnas - 1 do
          Grid.Cells [col, row] := '';

      // Se posiciona en el primer registro obtenido de la consulta
      vlQry_Vars.First;

      For row := 1 to NoRegistros do
      begin
        //For col := 1 to const_No_Columnas do
        //begin
          Grid.Cells [col_No_Variable, row] := vlQry_Vars.FieldByName ('No_Var')       .AsString;
          Grid.Cells [col_Desc_Var, row]    := vlQry_Vars.FieldByName ('Desc_Variable').AsString;
          Grid.Cells [col_Nombre_Var, row]  := vlQry_Vars.FieldByName ('Variable')     .AsString;
          Grid.Cells [col_Tipo_Dato, row]   := vlQry_Vars.FieldByName ('Tipo_Dato')    .AsString;

          vlQry_Vars.Next;
        //end;
      end;

      // Libera el objeto creado de tipo TQuery para obtener las variables
      vlQry_Vars.Free;

      // Consulta para obtener los valores de las variables correspondientes a la metodología del Acreditado
      vlQry_Valores              := TQuery.Create (Self);
      vlQry_Valores.DatabaseName := Objeto.Apli.DataBaseName;
      vlQry_Valores.SessionName  := Objeto.Apli.SessionName;
      vlQry_Valores.SQL.Add ('Select *             ' +
                             '  From ' + Tabla_Vigente +
                             ' Where Id_Acreditado = ' + IntToStr (Id_Acreditado));
      vlQry_Valores.Open;

      if not vlQry_Valores.Eof then
      begin
        // Se posiciona en el primer registro obtenido de la consulta que obtiene los valores de las variables
        vlQry_Valores.First;

        For row := 1 to NoRegistros do
        begin
          // Obtiene el Nombre de la variable y el tipo de dato
          NomVariable := Grid.Cells [col_Nombre_Var, row];
          TipoDato    := Grid.Cells [col_Tipo_Dato,  row];

          if not vlQry_Valores.FieldByName (NomVariable).IsNull then
          begin
            if (UpperCase (TipoDato) = 'FLOAT') or (UpperCase (TipoDato) = 'INTEGER') then
              Grid.Cells [col_Valor, row] := vlQry_Valores.FieldByName (NomVariable).AsString
            else if UpperCase (TipoDato) = 'DATE' then
              Grid.Cells [col_Valor, row] := FormatDateTime ('dd/mm/yyyy', vlQry_Valores.FieldByName (NomVariable).AsDateTime);
          end;
        end;
      end;
      // Libera el objeto creado de tipo TQuery para obtener los valores de las variables
      vlQry_Valores.Free;
    end;
  finally
    Application.ProcessMessages;
  end;
end;

procedure TWCrAcreditado.MetVar_GuardarDatos (Grid: TStringAlignGrid; Id_Acreditado: Integer; Met: String; var psError: Integer; var psMsgError: String);
var
  psMsgResultado : String;
  psResultado:     Integer;
  paquete:         String;
  proc_alta:       String;
  vlQry_Pkg_Proc:  TQuery;
  Stored_Proc:     TStoredProc;
  row:             Integer;
  NomVariable:     String;
  TipoDato:        String;
begin
  try
    vlQry_Pkg_Proc              := TQuery.Create (Self);
    vlQry_Pkg_Proc.DatabaseName := Objeto.Apli.DataBaseName;
    vlQry_Pkg_Proc.SessionName  := Objeto.Apli.SessionName;
    vlQry_Pkg_Proc.SQL.Add ('Select Paquete,            ' +
                            '       Proc_Alta           ' +
                            '  From CR_Per_Metodologias ' +
                            ' Where Cve_Metodologia = ''' + Met + '''');
    vlQry_Pkg_Proc.Open;

    if not vlQry_Pkg_Proc.Eof then
    begin
      paquete   := vlQry_Pkg_Proc.FieldByName ('Paquete')  .AsString;
      proc_alta := vlQry_Pkg_Proc.FieldByName ('Proc_Alta').AsString;

      Stored_Proc                := TStoredProc.Create (Self);
      Stored_Proc.DatabaseName   := Objeto.Apli.DataBaseName;
      Stored_Proc.SessionName    := Objeto.Apli.SessionName;
      Stored_Proc.StoredProcName := 'SISTEMAS.' + paquete + '.' + proc_alta;
      Stored_Proc.Params.Clear;

      // Creación de parámetros
      Stored_Proc.Params.CreateParam (ftString, 'peCve_Usu_Alta',    ptInput);
      Stored_Proc.ParamByName ('peCve_Usu_Alta').AsString := Objeto.DameUsuario;
      Stored_Proc.Params.CreateParam (ftDate,   'peF_Vigente_Desde', ptInput);
      Stored_Proc.Params.CreateParam (ftFloat,  'peId_Acreditado',   ptInput);
      Stored_Proc.ParamByName ('peId_Acreditado').AsFloat := Id_Acreditado;

      For row := 1 to Grid.RowCount - 1 do
      begin
        // Obtiene el Nombre de la variable y el tipo de dato
        NomVariable := 'pe' + Grid.Cells [col_Nombre_Var, row];
        TipoDato    := Grid.Cells [col_Tipo_Dato,  row];

        if (UpperCase (TipoDato) = 'FLOAT') or (UpperCase (TipoDato) = 'INTEGER') then
        begin
          Stored_Proc.Params.CreateParam (ftFloat, NomVariable, ptInput);
          if Grid.Cells [col_Valor, row] <> '' then
            Stored_Proc.ParamByName (NomVariable).AsString := Grid.Cells [col_Valor, row];
        end
        else if UpperCase (TipoDato) = 'DATE' then
        begin
          Stored_Proc.Params.CreateParam (ftDate, NomVariable, ptInput);
          if Grid.Cells [col_Valor, row] <> '' then
            Stored_Proc.ParamByName (NomVariable).AsDate := StringToDate (Grid.Cells [col_Valor, row]);
        end;
      end;

      Stored_Proc.Params.CreateParam (ftFloat,  'psError',    ptOutput);
      Stored_Proc.Params.CreateParam (ftString, 'psMsgError', ptOutput);

      //Stored_Proc.Prepare;
      Stored_Proc.ExecProc;

      psError    := Stored_Proc.ParamByName ('psError')   .AsInteger;
      psMsgError := Stored_Proc.ParamByName ('psMsgError').AsString;
    end;
  except
    on E: Exception do
      Application.MessageBox( PChar( E.Message ), 'Error', MB_ICONSTOP );
  end;
end;

procedure TWCrAcreditado.MetVar_CargaGridAnexo19 (Grid: TStringAlignGrid);
begin
  //Llena la columna de No. de Variable
  Grid.Cells [0, 1] := '1';
  Grid.Cells [0, 2] := '2';
  Grid.Cells [0, 3] := '3';
  Grid.Cells [0, 4] := '4';
  Grid.Cells [0, 5] := '5';
  Grid.Cells [0, 6] := '6';
  Grid.Cells [0, 7] := '7';

  //Llena la columna de Variable
  Grid.Cells [1, 1] := 'Identificador';
  Grid.Cells [1, 2] := 'Nombre';
  Grid.Cells [1, 3] := 'Descripción';
  Grid.Cells [1, 4] := 'Etapa';
  Grid.Cells [1, 5] := 'Importe Sobre Costo';
  Grid.Cells [1, 6] := 'Importe Cubierto por 3ros.';
  Grid.Cells [1, 7] := 'Utilidad/Deficit';

  //Alineación de columnas
  Grid.AlignCol [0] := alLeft;
  Grid.AlignCol [1] := alLeft;
  Grid.AlignCol [2] := alRight;
end;

procedure TWCrAcreditado.MetVar_ValidaCveMetodologia;
var
  vlCve_Ave: String;
begin
  with Objeto do
  begin
    CVE_METODOLOGIA.GetControl;
    ObtenDescripcion( ' SELECT INITCAP (CR.DESC_CLAVE) AS DESC_CVE'+coCRLF+
                      ' FROM CR_CON_CAT_DATA CR'+coCRLF+
                      ' WHERE CR.CVE_CON_GPO_CAT = ''CAT_METODOLOGIA'' AND CR.CVE_CLAVE = '+CVE_METODOLOGIA.AsString+coCRLF,
                      'DESC_CVE',
                   CVE_METODOLOGIA,
                   DESC_METODOLOGIA
                 );
    end;
    //edID_ACREDITADO.OnExit;

    //Trae la incormacion de la Descripion del campo Cve_Ave

    vlSql := 'Select * From Cr_Tipo_Ave Where Folio=' +  quotedstr(Objeto.CVE_AVE.AsString);
    If GetSQLStr(vlSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'Cve_Ave', vlCve_Ave, True) Then
     edDesc_Cve_Ave.Text := vlCve_Ave;

(* Código original de Anexo 18 antes de migrarlo a Modelos Dinámicos
    tsEstadosyMunc.TabVisible := (Objeto.Cve_Metodologia.AsString = '3') or //Anexo 18
                                 (Objeto.Cve_Metodologia.AsString = '6');   //Anexo 18-A
    tsEstadosyMunc.Caption    := Objeto.Desc_Metodologia.AsString;
*)
    tsEstadosyMunc.TabVisible := False;
    tsAnexo19.TabVisible      := False;

(*  Migración de Anexo 19 a Modelos Dinámicos
    tsAnexo19.TabVisible      := Objeto.CVE_METODOLOGIA.AsString = '4';
*)
end;

procedure TWCrAcreditado.Application_Idle (Sender: TObject; var Done: Boolean);
begin
  //Habilita los botones
  bbBuscar_Proy.Enabled    := EstadoAnexo19 in [eaInactivo, eaBusqueda];
  bbAlta_Proy.Enabled      := EstadoAnexo19 = eaBusqueda;
  bbModificar_Proy.Enabled := (EstadoAnexo19 = eaBusqueda) and (edIdentificador_Proy.Text <> '');

  bbGuardar_Proy.Enabled   := ((EstadoAnexo19 = eaInsercion) and (MetVar_ValidaCamposObligatorios)) or
                              ((EstadoAnexo19 = eaEdicion)   and (MetVar_ValidaCamposObligatorios));

  bbCancelar_Proy.Enabled  := EstadoAnexo19 in [eaInsercion, eaEdicion];

  //Habilita los campos de captura del Proyecto
  edNombre_Proy        .Enabled  := EstadoAnexo19 in [eaInsercion, eaEdicion];
  edDescripcion_Proy   .Enabled  := EstadoAnexo19 in [eaInsercion, eaEdicion];
  rdgEtapa_Proy        .Enabled  := EstadoAnexo19 in [eaInsercion, eaEdicion];
  edImp_Sobrecosto_Proy.Enabled  := EstadoAnexo19 in [eaInsercion, eaEdicion];
  edImp_Cub3ros_Proy   .Enabled  := EstadoAnexo19 in [eaInsercion, eaEdicion];
  edUtilidDefic_Proy   .Enabled  := EstadoAnexo19 in [eaInsercion, eaEdicion];
  
  bbMetodologia_ContProy.Enabled := bbProyectos_ContProy.Enabled and (sagContProy.Cells [3, sagContProy.Row] = '');

  if edIdentificador_Proy.Enabled then
    edIdentificador_Proy.Color := clWhite
  else
    edIdentificador_Proy.Color := clBtnFace;

  if edNombre_Proy.Enabled then
    edNombre_Proy.Color := clWhite
  else
    edNombre_Proy.Color := clBtnFace;

  if edDescripcion_Proy.Enabled then
    edDescripcion_Proy.Color := clWhite
  else
    edDescripcion_Proy.Color := clBtnFace;

  if edImp_Sobrecosto_Proy.Enabled then
    edImp_Sobrecosto_Proy.Color := clWhite
  else
    edImp_Sobrecosto_Proy.Color := clBtnFace;

  if edImp_Cub3ros_Proy.Enabled then
    edImp_Cub3ros_Proy.Color := clWhite
  else
    edImp_Cub3ros_Proy.Color := clBtnFace;

  if edUtilidDefic_Proy.Enabled then
    edUtilidDefic_Proy.Color := clWhite
  else
    edUtilidDefic_Proy.Color := clBtnFace;
end;

procedure TWCrAcreditado.bbAlta_ProyClick(Sender: TObject);
var
  Query: TQuery;
begin
  if Objeto.ValidaAccesoEsp('TCRACREDIT_ADPRY', True, True) then
  begin
    Query := TQuery.Create (Self);

    try
      // Valida si al agregar un nuevo proyecto no hay más proyectos que contratos activos.
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add ('Select Case When (Select Count (*) + 1 Proyectos');
      Query.SQL.Add ('                    From CR_Per_Proy_Anexo19');
      Query.SQL.Add ('                   Where ID_Acreditado = :ID_Acreditado');
      Query.SQL.Add ('                 ) >');
      Query.SQL.Add ('                 (Select Count (Distinct Cto.ID_Contrato) Contratos');
      Query.SQL.Add ('                    From            Contrato    Cto');
      Query.SQL.Add ('                    Join            CR_Contrato C    On Cto.ID_Contrato  = C.ID_Contrato');
      Query.SQL.Add ('                    Join            CR_Credito  Cred On C.ID_Contrato    = Cred.ID_Contrato   And');
      Query.SQL.Add ('                                                        C.Fol_Contrato   = Cred.Fol_Contrato  And');
      Query.SQL.Add ('                                                        Cred.Sit_Credito = ''AC''');
      Query.SQL.Add ('                   Where Cto.ID_Titular = :ID_Acreditado');
      Query.SQL.Add ('                 ) Then ''V''');
      Query.SQL.Add ('            Else ''F''');
      Query.SQL.Add ('       End                                                              Excede');
      Query.SQL.Add ('  From Dual');
      Query.DatabaseName   := Objeto.Apli.DataBaseName;
      Query.SessionName    := Objeto.Apli.SessionName;
      Query.ParamByName ('ID_Acreditado').AsFloat := Objeto.ID_ACREDITADO.AsFloat;;
      Query.Open;

      if Query.FieldByName ('Excede').AsString = 'V' then
        MessageDlg ('No puede haber mayor cantidad de proyectos que de contratos activos', mtInformation, [mbOk], 0)
      else
      begin
        edIdentificador_Proy.Text  := '';
        edNombre_Proy.Text         := '';
        edDescripcion_Proy.Text    := '';
        rdgEtapa_Proy.ItemIndex    := -1;
        edImp_Sobrecosto_Proy.Text := '';
        edImp_Cub3ros_Proy.Text    := '';
        edUtilidDefic_Proy.Text    := '';

        EstadoAnexo19         := eaInsercion;
        edNombre_Proy.Enabled := True;
        edNombre_Proy.SetFocus;
      end;
    finally
      Query.Free;
    end;
  end;
end;

procedure TWCrAcreditado.bbModificar_ProyClick(Sender: TObject);
begin
  if Objeto.ValidaAccesoEsp('TCRACREDIT_UPPRY', True, True) then
    EstadoAnexo19 := eaEdicion;
end;

procedure TWCrAcreditado.bbGuardar_ProyClick(Sender: TObject);
var
  vlMensaje       : string;
  vlIdentificador : string;
  vlNombre        : string;
  vlDescripcion   : string;
  vlSQL           : string;
  vlEtapa         : integer;
  vlImp_Sobrecosto: double;
  vlImp_Cubier3ros: double;
  vlUtil_Defic    : double;
  Stored_Proc     : TStoredProc;
  Query           : TQuery;
  psError         : double;
  psMsgError      : string;

begin
  if Objeto.ValidaAccesoEsp('TCRACREDIT_OKPRY', True, True) then
  begin
    if EstadoAnexo19 = eaInsercion then
      vlMensaje := '¿Desea dar de alta los valores capturados?'
    else
      vlMensaje := '¿Desea guardar los cambios?';

    //Valida que se hayan ingresado valores correctos en los campos numéricos
    if MetVar_ValidaCampos_Anexo19 then
    begin
      //Si el usuario confirma que desea salvar los cambios, se ejecuta el procedimiento PkgCrComercial.ActAgrVarsAnexo19
      if MessageDlg (vlMensaje, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        vlNombre         := edNombre_Proy.Text;
        vlDescripcion    := edDescripcion_Proy.Text;
        vlEtapa          := rdgEtapa_Proy.ItemIndex + 1;
        vlImp_Sobrecosto := StrToFloat (edImp_Sobrecosto_Proy.Text);
        vlImp_Cubier3ros := StrToFloat (edImp_Cub3ros_Proy.Text);
        vlUtil_Defic     := StrToFloat (edUtilidDefic_Proy.Text);

        //Llamada al procedimiento que se encarga de insertar o actualizar los proyectos correspondientes al Anexo 19
        Stored_Proc                := TStoredProc.Create (Self);
        Stored_Proc.DatabaseName   := Objeto.Apli.DataBaseName;
        Stored_Proc.SessionName    := Objeto.Apli.SessionName;
        Stored_Proc.StoredProcName := 'SISTEMAS.PKGCRCOMERCIAL.ACTAGRVARSANEXO19';
        Stored_Proc.Params.Clear;

        //Crea los parámetros para el procedimiento
        Stored_Proc.Params.CreateParam (ftString, 'peCve_Usu_Alta',      ptInput);
        Stored_Proc.Params.CreateParam (ftDate,   'peF_Vigente_Desde',   ptInput);
        Stored_Proc.Params.CreateParam (ftFloat,  'peId_Proyecto',       ptInput);
        Stored_Proc.Params.CreateParam (ftFloat,  'peId_Acreditado',     ptInput);
        Stored_Proc.Params.CreateParam (ftString, 'peNom_Proyecto',      ptInput);
        Stored_Proc.Params.CreateParam (ftString, 'peDesc_Proyecto',     ptInput);
        Stored_Proc.Params.CreateParam (ftFloat,  'peEtapa',             ptInput);
        Stored_Proc.Params.CreateParam (ftFloat,  'peImp_Sobrecosto',    ptInput);
        Stored_Proc.Params.CreateParam (ftFloat,  'peImp_Cubierto_3ros', ptInput);
        Stored_Proc.Params.CreateParam (ftFloat,  'peVp_Util_Deficit',   ptInput);
        Stored_Proc.Params.CreateParam (ftString, 'peB_Usar_Secuencia',  ptInput);
        Stored_Proc.Params.CreateParam (ftFloat,  'psError',             ptOutput);
        Stored_Proc.Params.CreateParam (ftString, 'psMsgError',          ptOutput);

        Stored_Proc.ParamByName ('peCve_Usu_Alta')     .AsString := Objeto.DameUsuario;

        if edIdentificador_Proy.Text <> '' then
          Stored_Proc.ParamByName ('peId_Proyecto').AsFloat := StrToFloat (edIdentificador_Proy.Text);

        Stored_Proc.ParamByName ('peId_Acreditado')    .AsFloat  := Objeto.ID_ACREDITADO.AsFloat;
        Stored_Proc.ParamByName ('peNom_Proyecto')     .AsString := vlNombre;
        Stored_Proc.ParamByName ('peDesc_Proyecto')    .AsString := vlDescripcion;
        Stored_Proc.ParamByName ('peEtapa')            .AsFloat  := vlEtapa;
        Stored_Proc.ParamByName ('peImp_Sobrecosto')   .AsFloat  := vlImp_Sobrecosto;
        Stored_Proc.ParamByName ('peImp_Cubierto_3ros').AsFloat  := vlImp_Cubier3ros;
        Stored_Proc.ParamByName ('peVp_Util_Deficit')  .AsFloat  := vlUtil_Defic;
        Stored_Proc.ParamByName ('peB_Usar_Secuencia') .AsString := 'V';

        Stored_Proc.ExecProc;

        psError    := Stored_Proc.ParamByName ('psError')   .AsInteger;
        psMsgError := Stored_Proc.ParamByName ('psMsgError').AsString;

        if psError = 0 then
        begin
          MessageDlg('Se guardaron con éxito los cambios', mtInformation, [mbOk], 0);

          //Si fue una inserción, obtiene el número de proyecto como el máximo número de proyecto del acreditado
          if EstadoAnexo19 = eaInsercion then
          begin
            Query := TQuery.Create (Self);

            try
              Query.Close;
              Query.SQL.Clear;
              Query.SQL.Add ('Select Max (ID_Proyecto) ID_Proyecto');
              Query.SQL.Add ('  From CR_Per_Proy_Anexo19');
              Query.SQL.Add (' Where ID_Acreditado = :ID_Acreditado');
              Query.ParamByName ('ID_Acreditado').AsFloat := Objeto.ID_ACREDITADO.AsFloat;
              Query.DatabaseName                          := Objeto.Apli.DataBaseName;
              Query.SessionName                           := Objeto.Apli.SessionName;
              Query.Open;

              if not Query.Eof then
                edIdentificador_Proy.Text := Query.FieldByName ('ID_Proyecto').AsString;

            finally
              Query.free;
            end;
          end;

          EstadoAnexo19 := eaBusqueda;
        end
        else
          MessageDlg('Hubo un error :  '+ psMsgError, mtError, [mbOk], 0);
      end;
    end;
  end;
end;

procedure TWCrAcreditado.bbCancelar_ProyClick(Sender: TObject);
begin
  if Objeto.ValidaAccesoEsp('TCRACREDIT_CNPRY', True, True) then
  begin
    if EstadoAnexo19 = eaInsercion then
    begin
      edNombre_Proy.Text         := '';
      edDescripcion_Proy.Text    := '';
      rdgEtapa_Proy.ItemIndex    := -1;
      edImp_Sobrecosto_Proy.Text := '';
      edImp_Cub3ros_Proy.Text    := '';
      edUtilidDefic_Proy.Text    := '';
    end;

    EstadoAnexo19 := eaBusqueda;
  end;
end;

function TWCrAcreditado.MetVar_ValidaCamposObligatorios: boolean;
begin
  result := (edNombre_Proy.Text         <> '') and (edDescripcion_Proy.Text <> '') and (rdgEtapa_Proy.ItemIndex <> -1) and
            (edImp_Sobrecosto_Proy.Text <> '') and (edImp_Cub3ros_Proy.Text <> '') and (edUtilidDefic_Proy.Text <> '');
end;

function TWCrAcreditado.MetVar_ValidaCampos_Anexo19: boolean;
var
  Imp_Sobrecosto:       double;
  Imp_Sobrecosto_Str:   string;
  Imp_Cubier3ros:       double;
  Imp_Cubier3ros_Str:   string;
  Imp_Utilidad_Def:     double;
  Imp_Utilidad_Def_Str: string;
  error:                integer;
begin
  result := True;

  //Validación del campo Importe Sobrecosto
  Val (edImp_Sobrecosto_Proy.Text, Imp_Sobrecosto, error);

  if error <> 0 then
  begin
    MessageDlg ('El valor ingresado en el campo [Importe Sobre Costo] es incorrecto. Sólo se permiten valores númericos.', mtError, [mbOK], 0);
    edImp_Sobrecosto_Proy.SetFocus;
    result := False;
    exit;
  end;

  //Validación del campo Importe Cubierto por Terceros
  Val (edImp_Cub3ros_Proy.Text, Imp_Cubier3ros, error);

  if error <> 0 then
  begin
    MessageDlg ('El valor ingresado en el campo [Importe Cubierto 3ros] es incorrecto. Sólo se permiten valores númericos.', mtError, [mbOK], 0);
    edImp_Cub3ros_Proy.SetFocus;
    result := False;
    exit;
  end;

  //Validación del campo Importe de Utilidad/Deficit
  Val (edUtilidDefic_Proy.Text, Imp_Utilidad_Def, error);

  if error <> 0 then
  begin
    MessageDlg ('El valor ingresado en el campo [Utilidad/Deficit] es incorrecto. Sólo se permiten valores númericos.', mtError, [mbOK], 0);
    edUtilidDefic_Proy.SetFocus;
    result := False;
    exit;
  end;
end;

procedure TWCrAcreditado.bbBuscar_ProyClick(Sender: TObject);
var
  Proy:  string;
  Query: TQuery;
  T: TInterFindit;
begin
  if Objeto.ValidaAccesoEsp('TCRACREDIT_FNPRY', True, True) then
  begin
    T := Objeto.CreaBuscador('ICrPePA.it','F');
    try
      T.WhereString := 'ID_Acreditado = ' + Objeto.ID_ACREDITADO.AsString;
      T.ShowAll     := True;
      if T.Execute then
      begin
        Proy  := T.DameCampo (0);
        Query := TQuery.Create (Self);

        try
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add ('Select *');
          Query.SQL.Add ('  From CR_Per_Proy_Anexo19');
          Query.SQL.Add (' Where ID_Proyecto   = :ID_Proyecto');
          Query.SQL.Add ('   And ID_Acreditado = :ID_Acreditado');
          Query.ParamByName ('ID_Proyecto').AsString  := Proy;
          Query.ParamByName ('ID_Acreditado').AsFloat := Objeto.ID_ACREDITADO.AsFloat;
          Query.DatabaseName                          := Objeto.Apli.DataBaseName;
          Query.SessionName                           := Objeto.Apli.SessionName;
          Query.Open;

          if Query.Eof then
            MessageDlg ('El proyecto no existe para este acreditado', mtError, [mbOk], 0)
          else
          begin
            edIdentificador_Proy.Text  := Proy;
            edNombre_Proy.Text         := Query.FieldByName ('Nom_Proyecto' ).AsString;
            edDescripcion_Proy.Text    := Query.FieldByName ('Desc_Proyecto').AsString;
            rdgEtapa_Proy.ItemIndex    := Query.FieldByName ('Etapa').AsInteger - 1;
            edImp_Sobrecosto_Proy.Text := Query.FieldByName ('Imp_Sobrecosto').AsString;
            edImp_Cub3ros_Proy.Text    := Query.FieldByName ('Imp_Cubierto_3ros').AsString;
            edUtilidDefic_Proy.Text    := Query.FieldByName ('VP_Util_Deficit').AsString;
          end;
        finally
          Query.Free;
        end;
      end;
    finally
      T.Free;
    end;
  end;
end;

procedure TWCrAcreditado.bbProyectos_ContProyClick(Sender: TObject);
var
  Proy: string;
  T: TInterFindit;
  Query: TQuery;
begin
  if Objeto.ValidaAccesoEsp('TCRACREDIT_CTPRY', True, True) then
  begin
    T := Objeto.CreaBuscador('ICrPePA.it','F');
    try
      T.WhereString := 'ID_Acreditado = ' + Objeto.ID_ACREDITADO.AsString;
      T.ShowAll     := True;
      if T.Execute then
      begin
        Proy  := T.DameCampo (0);
        Query := TQuery.Create (Self);

        try
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add ('Select *');
          Query.SQL.Add ('  From CR_Per_Proy_Anexo19');
          Query.SQL.Add (' Where ID_Proyecto   = :ID_Proyecto');
          Query.SQL.Add ('   And ID_Acreditado = :ID_Acreditado');
          Query.ParamByName ('ID_Proyecto').AsString  := Proy;
          Query.ParamByName ('ID_Acreditado').AsFloat := Objeto.ID_ACREDITADO.AsFloat;
          Query.DatabaseName                          := Objeto.Apli.DataBaseName;
          Query.SessionName                           := Objeto.Apli.SessionName;
          Query.Open;

          if Query.Eof then
            MessageDlg ('El proyecto no existe para este acreditado', mtError, [mbOk], 0)
          else
          begin
            sagContProy.Cells [1, sagContProy.Row] := Proy;
            sagContProy.Cells [2, sagContProy.Row] := Query.FieldByName ('Nom_Proyecto' ).AsString;
            bbGuardar_ContProy.Enabled             := True;
            bbCancelar_ContProy.Enabled            := True;
          end;
        finally
          Query.Free;
        end;
      end;
    finally
      T.Free;
    end;
  end;
end;

procedure TWCrAcreditado.bbMetodologia_ContProyClick(Sender: TObject);
var
  T: TInterFindit;
begin
  if Objeto.ValidaAccesoEsp('TCRACREDIT_CTMET', True, True) then
  begin
    T := Objeto.CreaBuscador('ICrCoCD.it','S');
    T.WhereString := ' CVE_CON_GPO_CAT = ''CAT_METODOLOGIA''' ;
    T.ShowAll := True;
    try
      if T.Execute then
      begin
        sagContProy.Cells [3, sagContProy.Row] := T.DameCampo (0);
        sagContProy.Cells [4, sagContProy.Row] := T.DameCampo (1);
        bbGuardar_ContProy.Enabled             := True;
        bbCancelar_ContProy.Enabled            := True;
      end;
    finally
      T.Free;
    end;
  end;
end;

procedure TWCrAcreditado.bbGuardar_ContProyClick(Sender: TObject);
var
  SP: TStoredProc;
  Row: integer;
  Errores: Boolean;
begin
  if Objeto.ValidaAccesoEsp('TCRACREDIT_OKCTM', True, True) then
  begin
    SP      := TStoredProc.Create (Self);
    Errores := False;
    try
      for Row := 1 to sagContProy.RowCount - 1 do
        if sagContProy.Cells [0, Row] <> '' then
        begin
          SP.Close;
          SP.DatabaseName   := Objeto.Apli.DataBaseName;
          SP.SessionName    := Objeto.Apli.SessionName;
          SP.StoredProcName := 'SISTEMAS.PKGCRCOMERCIAL.ACTAGRPROYANEXO19';
          SP.Params.Clear;

          SP.Params.CreateParam (ftString, 'peCve_Usu_Alta',    ptInput);
          SP.Params.CreateParam (ftFloat,  'peId_Contrato',     ptInput);
          SP.Params.CreateParam (ftFloat,  'peFol_Contrato',    ptInput);
          SP.Params.CreateParam (ftFloat,  'peId_Proyecto',     ptInput);
          SP.Params.CreateParam (ftString, 'peCve_Metodologia', ptInput);
          SP.Params.CreateParam (ftFloat,  'psError',           ptOutput);
          SP.Params.CreateParam (ftFloat,  'psMsgError',        ptOutput);

          SP.ParamByName ('peCve_Usu_Alta').AsString := Objeto.DameUsuario;
          SP.ParamByName ('peId_Contrato').AsString  := sagContProy.Cells [0, Row];
          SP.ParamByName ('peFol_Contrato').AsFloat  := 1;

          if sagContProy.Cells [1, Row] <> '' then
            SP.ParamByName ('peId_Proyecto').AsString  := sagContProy.Cells [1, Row];

          if sagContProy.Cells [3, Row] <> '' then
            SP.ParamByName ('peCve_Metodologia').AsString  := sagContProy.Cells [3, Row];

          SP.ExecProc;

          if SP.ParamByName ('psError').AsInteger <> 0 then
          begin
            Errores := True;
            MessageDlg ('Ha ocurrido un error: ' + SP.ParamByName ('psMsgError').AsString, mtWarning, [mbOk], 0);
          end;
        end;

      if not Errores then
        MessageDlg ('Los cambios fueron guardados con éxito', mtInformation, [mbOk], 0)
    finally
      SP.Free;
    end;

    bbGuardar_ContProy.Enabled  := False;
    bbCancelar_ContProy.Enabled := False;
  end;
end;

procedure TWCrAcreditado.bbCancelar_ContProyClick(Sender: TObject);
begin
  if Objeto.ValidaAccesoEsp('TCRACREDIT_CNCTM', True, True) then
  begin
    bbGuardar_ContProy.Enabled  := False;
    bbCancelar_ContProy.Enabled := False;
    MetVar_CargaContratosAnexo19;
  end;
end;

procedure TWCrAcreditado.MetVar_CargaContratosAnexo19;
var
  Query: TQuery;
  Row, Col: integer;
begin
  Query := TQuery.Create (Self);

  try
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add ('Select Distinct C.Fol_Contrato, C.ID_Contrato, Anx19.ID_Proyecto, Proy.Nom_Proyecto, Anx19.Cve_Metodologia, InitCap (Cat.Desc_Clave) Metodologia');
    Query.SQL.Add ('  From            Contrato                Cto');
    Query.SQL.Add ('  Join            CR_Contrato             C     On Cto.ID_Contrato       = C.ID_Contrato');
    Query.SQL.Add ('  Join            CR_Credito              Cred  On C.ID_Contrato         = Cred.ID_Contrato   And');
    Query.SQL.Add ('                                                   C.Fol_Contrato        = Cred.Fol_Contrato  And');
    Query.SQL.Add ('                                                   Cred.Sit_Credito      = ''AC''');
    Query.SQL.Add ('  Left Outer Join CR_Per_Proy_Cto_Anexo19 Anx19 On C.Fol_Contrato        = Anx19.Fol_Contrato And');
    Query.SQL.Add ('                                                   C.ID_Contrato         = Anx19.ID_Contrato');
    Query.SQL.Add ('  Left Outer Join CR_Per_Proy_Anexo19     Proy  On Anx19.ID_Proyecto     = Proy.ID_Proyecto');
    Query.SQL.Add ('  Left Outer Join Cr_Con_Cat_Data         Cat   On Anx19.Cve_Metodologia = Cat.Cve_Clave And');
    Query.SQL.Add ('                                                   Cat.Cve_Con_Gpo_Cat   = ''CAT_METODOLOGIA''');
    Query.SQL.Add (' Where Cto.ID_Titular = :ID_Acreditado');
    Query.ParamByName ('ID_Acreditado').AsFloat := Objeto.ID_ACREDITADO.AsFloat;
    Query.DatabaseName                          := Objeto.Apli.DataBaseName;
    Query.SessionName                           := Objeto.Apli.SessionName;
    Query.Open;

    if Query.Eof then
    begin
      sagContProy.RowCount := 2;

      for Col := 0 to sagContProy.ColCount - 1 do
        sagContProy.Cells [Col, 1] := '';

      sagContProy.Enabled := False;
    end
    else
    begin
      Query.Last;
      Query.First;
      if Query.RecordCount <= 0 then
        sagContProy.RowCount := 2
      else
        sagContProy.RowCount := Query.RecordCount + 1;

      for Row := 1 to sagContProy.RowCount - 1 do
        for Col := 0 to sagContProy.ColCount - 1 do
          sagContProy.Cells [Col, Row] := '';

      Row := 1;
      while not Query.Eof do
      begin
        sagContProy.Cells [0, Row] := Query.FieldByName ('ID_Contrato').AsString;
        sagContProy.Cells [1, Row] := Query.FieldByName ('ID_Proyecto').AsString;
        sagContProy.Cells [2, Row] := Query.FieldByName ('Nom_Proyecto').AsString;
        sagContProy.Cells [3, Row] := Query.FieldByName ('Cve_Metodologia').AsString;
        sagContProy.Cells [4, Row] := Query.FieldByName ('Metodologia').AsString;

        Query.Next;
        Inc (Row);
      end;
    end;
  finally
    Query.Free;
  end;
end;

function TWCrAcreditado.MetVar_HayContratosAmbiguosAnexo19: boolean;
var
  Query: TQuery;
begin
  result := False;
  if Objeto.CVE_METODOLOGIA.AsString <> '4' then exit;

  Query := TQuery.Create (Self);
  try
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add ('Select Case When (Select Count (Distinct Cto.ID_Contrato)');
    Query.SQL.Add ('                    From            Contrato                Cto');
    Query.SQL.Add ('                    Join            CR_Contrato             C     On Cto.ID_Contrato       = C.ID_Contrato');
    Query.SQL.Add ('                    Join            CR_Credito              Cred  On C.ID_Contrato         = Cred.ID_Contrato   And');
    Query.SQL.Add ('                                                                     C.Fol_Contrato        = Cred.Fol_Contrato  And');
    Query.SQL.Add ('                                                                     Cred.Sit_Credito      = ''AC''');
    Query.SQL.Add ('                    Left Outer Join CR_Per_Proy_Cto_Anexo19 Anx19 On C.Fol_Contrato        = Anx19.Fol_Contrato And');
    Query.SQL.Add ('                                                                     C.ID_Contrato         = Anx19.ID_Contrato');
    Query.SQL.Add ('                   Where Cto.ID_Titular        = :ID_Acreditado');
    Query.SQL.Add ('                     And Anx19.ID_Proyecto     Is Null');
    Query.SQL.Add ('                     And Anx19.Cve_Metodologia Is Null');
    Query.SQL.Add ('                 ) > 0 And');
    Query.SQL.Add ('                 (Select Count (*) Proyectos');
    Query.SQL.Add ('                    From CR_Per_Proy_Anexo19');
    Query.SQL.Add ('                   Where ID_Acreditado = :ID_Acreditado');
    Query.SQL.Add ('                 ) > 1 Then ''V''');
    Query.SQL.Add ('            Else ''F''');
    Query.SQL.Add ('       End                                                                     Ambiguos');
    Query.SQL.Add ('  From Dual');
    Query.DatabaseName   := Objeto.Apli.DataBaseName;
    Query.SessionName    := Objeto.Apli.SessionName;
    Query.ParamByName ('ID_Acreditado').AsFloat := Objeto.ID_ACREDITADO.AsFloat;;
    Query.Open;

    result := Query.FieldByName ('Ambiguos').AsString = 'V';
  finally
    Query.Free;
  end;
end;



procedure TWCrAcreditado.btCve_BuroClick(Sender: TObject);
var
  T: TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRACREDIT_CVBUR', True, True) then
   begin
     T         := Objeto.CreaBuscador('IEDOSMPIOSBURO.IT', 'S');
     T.ShowAll := True;
     try
       if T.Execute then
       begin
         Objeto.CVE_BURO.AsString  := T.DameCampo(0);
         Objeto.DESC_BURO.AsString := T.DameCampo(1);
         InterForma1.NextTab(btCve_Buro);
       end;
     finally
       T.Free;
     end;
   end;
end;

procedure TWCrAcreditado.BitBtn2Click(Sender: TObject);
var
  T : TInterFindit;
begin

  with Objeto do
    begin
      T := CreaBuscador('ICRCNBVACRE.IT','S');
      T.ShowAll := True;
      try
        if T.Execute then
           begin
              Objeto.CVE_ACREDIT_CNBV.AsString :=  T.DameCampo(0);
              Objeto.DESC_ACREDIT_CNBV.AsString := T.DameCampo(1);
             //InterForma1.NextTab(edCve_Ave);
           end;
      finally
        T.Free;
      end;
    end;

end;

procedure TWCrAcreditado.btCVE_CARTERA_R04Click(Sender: TObject);
var
  T : TInterFindit;
begin

  with Objeto do
    begin
      T := CreaBuscador('ICRTIPCART.IT','S');
      T.ShowAll := True;
      try
        if T.Execute then
           begin
              Objeto.CVE_CARTERA_R04.AsString :=  T.DameCampo(0);
              Objeto.DESC_CARTERA_R04.AsString := T.DameCampo(1);
             //InterForma1.NextTab(edCve_Ave);
           end;
      finally
        T.Free;
      end;
    end;

end;

procedure TWCrAcreditado.mnuSPPIXAcreditadosClick(Sender: TObject);
var
  AcreditPI : TAcreditPI;
begin

  if Objeto.ValidaAccesoEsp('TCRACREDIT_SPPI',True,True) then
  begin
    Try
     AcreditPI := TAcreditPI.Create(Nil);
     AcreditPI.Apli:=Objeto.Apli;
     AcreditPI.ParamCre:=Objeto.ParamCre;
     AcreditPI.Catalogo;

     //AcreditPI.varAcreditado := Objeto.ID_ACREDITADO.AsInteger;
     //AcreditPI.ejecutaConsulta(objeto.Apli);
    finally
     if AcreditPI <> nil then
        AcreditPI := Nil;
    end;
  end

end;

procedure TWCrAcreditado.mnuConfiguracionModelosClick(Sender: TObject);
var
  MetAcred : TMetAcred;
  strSQL : string;
  intMetodologia : integer;
begin
{  strSQL := '' +
      ' select count(acre.id_acreditado) Existe from cr_acreditado acre ' +
      '     inner join contrato cto on (cto.id_titular = acre.id_acreditado) ' +
      '     inner join cr_contrato ccto on (ccto.id_contrato = cto.id_contrato) ' +
      '     inner join cr_producto prod on (prod.cve_producto_cre = ccto.cve_producto_cre) ' +
      '     inner join (SELECT CRC.cve_cat_minimo, cve_agrupacion, desc_cat_minimo FROM ADMIPROD. CR_REG_CARTERA CRC ' +
      '          where cve_agrupacion = ' + QuotedStr('CARTCOME') +
      '          and substr(cve_cat_minimo,1,6) in (' + QuotedStr('130105') + ', ' + QuotedStr('130106') + ', ' + QuotedStr('130121') + ') ' +
      '           ) gpo on (gpo.cve_cat_minimo = prod.cve_clas_contab) ' +
      ' where acre.id_acreditado =  ' + Objeto.ID_ACREDITADO.AsString;


   GetSQLInt(strSQL,Objeto.DataBaseName,objeto.SessionName,'Existe',intMetodologia,false);

  if  intMetodologia <= 0 then
  begin
    ShowMessage('El Acreditado NO corresponde a la Metodología Comercial');
    Exit;
  end;
}

  if Objeto.Active then
  begin
    if Objeto.ValidaAccesoEsp('TCRACREDIT_MR04',True,True) then
    begin
      MetAcred := TMetAcred.Create (Self);
      try
        MetAcred.Apli               := dmMain.apMain;
        MetAcred.Apli               := Objeto.Apli;
        MetAcred.intPersona         := Objeto.ID_ACREDITADO.AsInteger;
        MetAcred.strNomPersona      := Objeto.Persona.Nombre.AsString;
        MetAcred.strCveMetPantAcred := Objeto.CVE_METODOLOGIA.AsString;
        MetAcred.Catalogo;
      finally
        MetAcred.Free;
      end;
    end;
  end else //// if Objeto.Active then
    MessageDlg(''+#13+#10+'Debe de seleccionar un Acreditado', mtInformation, [mbOK], 0);

end;


// RUCJ4248 :: funcion para mostrar los datos de las garantias asociadas al acreditado
procedure TWCrAcreditado.mnuRegistrodeGarantasClick(Sender: TObject);
var
  T : TInterFindit;
  strSolicitud,
  strAcredit    : String;
begin

  with Objeto do
  begin
    if Active then
    begin

      T := CreaBuscador('IMREGISTRO.IT', 'I,I');
      T.WhereString := ' CR_GA_REGISTRO.ID_ACREDITADO = ' + Objeto.ID_ACREDITADO.AsString;
      T.ShowAll := True;
      try
        if T.Execute then
           begin
              strSolicitud  := T.DameCampo(0);
              strAcredit    := T.DameCampo(1);
             //InterForma1.NextTab(edCve_Ave);
           end;
      finally
        T.Free;
      end;

      if Trim(strSolicitud) <> '' then
        MuestraRegGarantias(objeto.ID_ACREDITADO.AsInteger,
                                     StrToInt(strSolicitud),
                                     Objeto.ParamCre,
                                     Objeto.Apli);

    end else //// if Objeto.Active then
    MessageDlg(''+#13+#10+'Debe de seleccionar un Acreditado', mtInformation, [mbOK], 0);

  end; /// With Objeto do

end;

end.
