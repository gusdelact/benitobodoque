// Sistema         : Clase de Contrato
// Fecha de Inicio : 29 de Diciembre de 1997
// Función forma   : Clase de Contrato
// Desarrollo por  : Victor Martinez
// Comentarios     :
// Modificado      : 18 Abril 2000 B.M.R.
//                   2 Sept. 2002 F.R.M.
//                   Noviembre del 2003, Carlos Adrian Mejía Ledón
//                   Nov 23, 2005 Alberto Ramírez
//                   Marzo 14, 2008 Yadira Roque
// Modificación    : MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES
//                   ROUY4095 14032008 Se agrega la pantalla para el registro de la Visita Domiciliaria,
//                   por Cliente/Contrato vía botón <Visita Domiciliaria>
//                   Luis Alberto Hernandez Mackan    Enero 2010
//                   Para validar que la unidad de negocio pertenezca a la misma empresa del contrato

unit IntCtto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, IntFind, InterFun, DBCtrls, Menus,
  IntDtPk, IntLinkit, InterEdit, InterApl, InterFor, IntFrm, UnGene, UnSQL2,

  dmCttoEstado,        { Data Module del Sistema}
  IntMPers,            { Objeto Multipersona }
  IntCtoConPro,        { Configuración de Captura de Contratos por Producto }
  { Catálogos Corporativos}
  IntDom,              { Domicilios }
  IntProd,             { Productos }
  IntUnNeg,            { Unidades de Negocio - Entidad }
  IntSegm,             { Segmentos }
  IntMon,              { Monedas }
  IntGCto,             { Grupos de Contrato - Promotor }
  IntConceCtte,        { Conceptos Segmentos }
  IntActiv,            { Actividades }
  IntMotIna,           { Motivos de Inactivación }
  IntCtoDesRec,        { Destino de Recursos - KYC }
  IntCtoOriRec,        { Origen de Recursos - KYC }
  UnFunProcICB,        { Constantes, Funciones y Procedimientos generales (ICB) }
  IntSGCtrl,
  IntSbSerFin,         { SB_SERVICIO_FIN }
  IntSbTipCte,         { SB_TIPO_CLIENTE}
  IntMotivo,           { Motivos }
  RepCProm,            { Reporte de Cambios de Promotor}
  IntPsiEvalua,        { Folio de Cuestionario Perfil Servicios de Inversion}
  IntPcTPerfil,        { Perfiles de Asignacion }
  IntPcLimDisc,        { Montos Maximos de Perfiles de Servicios de Inversion }
  IntDatoFiscalUbiCte, { Datos Fiscales de Ubicacion o Residencia en Contratantes }
  IntPers,             { Persona }
  IntAcuseRecibo,      { Acuse de Recibo (Cancelación de Contrato)}   
  //IntRepCprom ,

  capturamail,UnMail,RegExpr,
  IntCarpdfImp;

Const
  WM_DespuesShow = WM_USER+1;
  SeguCto : Boolean = True; // ACTIVACION DE SEGUIRDADES PARA CONTRATOS...
                            // ACTIVADAS= TRUE
                            // DESACTIVADAS = FALSE
type
  TContrato= Class;

  // CZR 01-abr-2013
  TString = class(TObject)
  private
    vStr : String;
  public
    constructor Create(const cStr : String);
    property    pStr : String read vStr write vStr;
  end;

  TWContrato = class(TForm)
    btnContratante       : TBitBtn;
    btnDocCtte           : TBitBtn;
    btnDocCtto           : TBitBtn;
    bInternet            : TBitBtn;
    btnRepCtto           : TBitBtn;
    BitBtn2              : TBitBtn;
    btnDocAdicional      : TBitBtn;
    btnCtoAsociado       : TBitBtn;
    btConcepto           : TSpeedButton;
    btCveSegObjetivo     : TSpeedButton;
    btPromotor           : TSpeedButton;
    btSegmento           : TSpeedButton;
    btUnNegocio          : TSpeedButton;
    Catlogo1             : TMenuItem;
    cbCorrespondencia    : TComboBox;
    cbCveDiscrecional    : TComboBox;
    cbCveRegimen         : TComboBox;
    cbCveTipoFide        : TComboBox;
    cbTipoCuenta         : TComboBox;
    chImpreso            : TCheckBox;
    chkSegmentoAut       : TCheckBox;
    DatePicker1          : MacvDatePicker;
    DatePicker2          : MacvDatePicker;
    DatePicker3          : MacvDatePicker;
    DatePicker4          : MacvDatePicker;
    dtpExpiracion        : MacvDatePicker;
    dtpPrimerEnvio       : MacvDatePicker;
    edCalleNumero        : TEdit;
    edCombFirmas         : TEdit;
    edContrato           : TEdit;
    edContratoLiq        : TEdit;
    edCve_Activ_Cto      : TEdit;
    edCveSegObjetivo     : TEdit;
    edCveUsuario         : TEdit;
    edCveUsuarModif      : TEdit;
    edTipoCliente        : TEdit;
    edResidencia         : TEdit;
    edTipoSector         : TEdit;
    edSector             : TEdit;
    edSubSector          : TEdit;
    edRama               : TEdit;
    edSubRama            : TEdit;
    edDescConcepto       : TEdit;
    edDescProducto       : TEdit;
    edFAlta              : TEdit;
    edFBaja              : TEdit;
    edFExpiracion        : TEdit;
    edFHModificacion     : TEdit;
    edFIniPzoObj         : TEdit;
    edFPrimerEnvio       : TEdit;
    edGrupo              : TEdit;
    edIdContraDV         : TEdit;
    edIDContraIB         : TEdit;
    EdIdContrato         : TEdit;
    edIdDomicilio        : TEdit;
    edIdTitular          : TEdit;
    edModifica           : TEdit;
    edMoneda             : TEdit;
    edCveTipoCliente     : TEdit;
    edCveResidencia      : TEdit;
    edCveTipoSector      : TEdit;
    edCveSector          : TEdit;
    edCveSubSector       : TEdit;
    edCveRama            : TEdit;
    edCveSubRama         : TEdit;
    edNombreContrato     : TEdit;
    edNombreEmpresa      : TEdit;
    edNombrePromotor     : TEdit;
    edNombreTitular      : TEdit;
    edNumEnvios          : TEdit;
    edPlazoObjetivo      : TEdit;
    edPrefijo            : TEdit;
    edReact              : TEdit;
    edSdoPatrimonio      : TEdit;
    edSdoPosLiquida      : TEdit;
    edSegmento           : TEdit;
    edTipoContrato       : TEdit;
    edTotEnviados        : TEdit;
    edTXComentario       : TMemo;
    edUnNegocio          : TEdit;
    gbCDVI               : TGroupBox;
    gbCIBC               : TGroupBox;
    gbFIDE               : TGroupBox;
    gbINET               : TGroupBox;
    gbMETA               : TGroupBox;
    gbSSER               : TGroupBox;
    GroupBox1            : TGroupBox;
    GroupBox2            : TGroupBox;
    GroupBox3            : TGroupBox;
    GroupBox4            : TGroupBox;
    GroupBox5            : TGroupBox;
    gbComentario         : TGroupBox;
    GroupBox7            : TGroupBox;
    GroupBox8            : TGroupBox;
    GroupBox9            : TGroupBox;
    Label1               : TLabel;
    Label10              : TLabel;
    Label11              : TLabel;
    Label12              : TLabel;
    Label13              : TLabel;
    Label15              : TLabel;
    Label16              : TLabel;
    Label17              : TLabel;
    Label18              : TLabel;
    Label19              : TLabel;
    Label2               : TLabel;
    Label21              : TLabel;
    Label22              : TLabel;
    Label23              : TLabel;
    Label24              : TLabel;
    Label25              : TLabel;
    Label26              : TLabel;
    Label31              : TLabel;
    Label32              : TLabel;
    Label33              : TLabel;
    Label34              : TLabel;
    Label35              : TLabel;
    Label36              : TLabel;
    Label37              : TLabel;
    Label38              : TLabel;
    Label39              : TLabel;
    Label4               : TLabel;
    Label40              : TLabel;
    Label41              : TLabel;
    Label42              : TLabel;
    Label43              : TLabel;
    Label44              : TLabel;
    Label45              : TLabel;
    Label46              : TLabel;
    Label5               : TLabel;
    Label6               : TLabel;
    Label7               : TLabel;
    Label8               : TLabel;
    Label9               : TLabel;
    lbICveRequisito      : TLabel;
    LimpiarRegistro1     : TMenuItem;
    InterForma1          : TInterForma;
    N1                   : TMenuItem;
    pageInfo             : TPageControl;
    PopTitular           : TPopupMenu;
    PopTitularCatalogo   : TMenuItem;
    PopupMenuCtoLiq      : TPopupMenu;
    PopupMenuGpoCto      : TPopupMenu;
    PopupReportes        : TPopupMenu;
    RepContrato          : TMenuItem;
    RepDocumentacion     : TMenuItem;
    RepInformacion       : TMenuItem;
    rgCveTipSuscr        : TRadioGroup;
    rgSitDocumentos      : TRadioGroup;
    rgSituacion          : TRadioGroup;
    sbTipoCliente        : TSpeedButton;
    sbResidencia         : TSpeedButton;
    sbTipoSector         : TSpeedButton;
    sbSector             : TSpeedButton;
    sbSubSector          : TSpeedButton;
    sbRama               : TSpeedButton;
    sbSubRama            : TSpeedButton;
    sbTitular            : TSpeedButton;
    sbEmpresa            : TSpeedButton;
    sbProducto           : TSpeedButton;
    sbDomicilio          : TSpeedButton;
    sbContratoLiq        : TSpeedButton;
    SpeedButton6         : TSpeedButton;
    SpeedButton7         : TSpeedButton;
    SpeedButton8         : TSpeedButton;
    tabInfoContrato      : TTabSheet;
    tabInfoProducto      : TTabSheet;
    TabSheet3            : TTabSheet;
    iCteAAA              : TAnimate;
    edModSit             : TEdit;
    qInsertaMotivo       : TQuery;
    tabMotivo            : TTabSheet;
    gInactiva            : TGroupBox;
    sbMotivo             : TSpeedButton;
    edNbrInactiva        : TEdit;
    edTxInactiva         : TEdit;
    Label27              : TLabel;
    Label28              : TLabel;
    chbB_ASESOR_INV      : TCheckBox;
    PopupOrigenRec       : TPopupMenu;
    CatalogoOrigenRec    : TMenuItem;
    LimpiarOrigenRec     : TMenuItem;
    PopupDestinoRec      : TPopupMenu;
    CatalogoDestinoRec   : TMenuItem;
    LimpiarDestinoRec    : TMenuItem;
    btnKYC               : TBitBtn;
    btnDiagnosticoKYC    : TBitBtn;
    Label47              : TLabel;
    edCveInciso          : TEdit;
    sbInciso             : TSpeedButton;
    edInciso             : TEdit;
    Label48              : TLabel;
    edCveSITI            : TEdit;
    edDescSITI           : TEdit;
    Label49              : TLabel;
    PopUpActividad       : TPopupMenu;
    LimpiarActividad     : TMenuItem;
    CatalogoActividad    : TMenuItem;
    linkActividad        : TInterLinkit;
    gbProspecto          : TGroupBox;
    btnAsignarProspecto  : TButton;
    btnEliminarProspecto : TButton;
    edContratoProspecto  : TEdit;
    Label50              : TLabel;
    edPrefijoProspecto   : TEdit;
    Label51              : TLabel;
    Bevel1               : TBevel;
    gbErrorProspecto     : TGroupBox;
    Label52              : TLabel;
    chkSolAccesoILine    : TCheckBox;
    BitBtn1              : TBitBtn;
    Label53              : TLabel;
    Label54              : TLabel;
    edID_CTO_FDOS        : TEdit;
    edID_CTO_PRLV        : TEdit;
    sbCTOFONDOS          : TSpeedButton;
    sbCTOPRLV            : TSpeedButton;
    edFONDO              : TEdit;
    edNomPRLV            : TEdit;
    Label55              : TLabel;
    rgB_SOBREGIRO        : TRadioGroup;
    lbF_INICIO           : TLabel;
    edF_ANIVERSARIO      : TEdit;
    dtpF_INICIO          : TInterDateTimePicker;
    Label56              : TLabel;
    rgCVE_TP_COMISION    : TRadioGroup;
    btnVisitaDomi        : TBitBtn;
    chIlocalizable       : TCheckBox;
    Label57              : TLabel;
    edldProspecto        : TEdit;
    sbProspecto          : TSpeedButton;
    PopUpProspecto       : TPopupMenu;
    MenuItem2            : TMenuItem;
    btnMail              : TButton;
    cbEDC                : TCheckBox;
    chkCreaIFS           : TCheckBox;
    tabInfoKYC           : TTabSheet;
    bOrigRec             : TButton;
    bDestRec             : TButton;
    bProdSolic           : TButton;
    bTrans               : TButton;
    bPerExt              : TButton;
    bRecExt              : TButton;
    bTipOp               : TButton;
    bRelComer            : TButton;
    bTarSolic            : TButton;
    bImpto               : TButton;
    gbSitKYC             : TGroupBox;
    cbSitKYC             : TComboBox;
    bAsigSitKYC          : TButton;
    Label3               : TLabel;
    Label20              : TLabel;
    Label14              : TLabel;
    gpoServicios         : TGroupBox;
    lblTipServicio       : TLabel;
    gpoAtributos         : TGroupBox;
    chkCI                : TCheckBox;
    chkELE               : TCheckBox;
    chkCLISOF            : TCheckBox;
    chkCLIECA            : TCheckBox;
    edCveServicioFin     : TEdit;
    sbServicioFin        : TSpeedButton;
    edDescServicioFin    : TEdit;
    edCveTipCte          : TEdit;
    sbTipCte             : TSpeedButton;
    edDescTipCte         : TEdit;
    Label29              : TLabel;
    Label30              : TLabel;
    gpoMotCambioProm     : TGroupBox;
    sbMotCamProm         : TSpeedButton;
    Label58              : TLabel;
    edMotivoProm         : TEdit;
    edCveMotivoProm      : TEdit;
    edCveGpoMotivo       : TEdit;
    edNivelRiesgo        : TEdit;
    lNivelRiesgo         : TLabel;
    lv_PcLimDicLim       : TListView;
    gpPerfilCuestionario : TGroupBox;
    Label59              : TLabel;
    sbPsiEvalua          : TSpeedButton;
    edIdEvaluacion       : TEdit;
    Label60              : TLabel;
    edIdTipoPerfil       : TEdit;
    sbMaxPerfil          : TSpeedButton;
    edDescTipoPerfil     : TEdit;
    BitBtn3              : TBitBtn;
    bbAcuseRecibo        : TBitBtn;
    bbMotivos            : TBitBtn;
    procedure btnContratanteClick(Sender: TObject);
    procedure btnDocCtteClick(Sender: TObject);
    procedure btnDocCttoClick(Sender: TObject);
    procedure bInternetClick(Sender: TObject);
    procedure btnRepCttoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnDocAdicionalClick(Sender: TObject);
    procedure btnCtoAsociadoClick(Sender: TObject);
    procedure btConceptoClick(Sender: TObject);
    procedure btCveSegObjetivoClick(Sender: TObject);
    procedure btPromotorClick(Sender: TObject);
    procedure btSegmentoClick(Sender: TObject);
    procedure btUnNegocioClick(Sender: TObject);
    procedure Catlogo1Click(Sender: TObject);
    procedure cbSitDocumentosChange(Sender: TObject);
    procedure edPlazoObjetivoExit(Sender: TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender : TObject);
    procedure Informaciongeneral1Click(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
    procedure InterForma1CanEdit(Sender: TObject; CanEdit: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure LimpiarRegistro1Click(Sender: TObject);
    procedure PopTitularCatalogoClick(Sender: TObject);
    procedure PopupMenuGpoCtoPopup(Sender: TObject);
    procedure PopupReportesPopup(Sender: TObject);
    procedure RepDocumentacionClick(Sender: TObject);
    procedure rgCveTipSuscrClick(Sender: TObject);
    procedure rgSituacionClick(Sender: TObject);
    procedure sbTipoClienteClick(Sender: TObject);
    procedure sbResidenciaClick(Sender: TObject);
    procedure sbTipoSectorClick(Sender: TObject);
    procedure sbSectorClick(Sender: TObject);
    procedure sbSubSectorClick(Sender: TObject);
    procedure sbRamaClick(Sender: TObject);
    procedure sbSubRamaClick(Sender: TObject);
    procedure sbTitularClick(Sender: TObject);
    procedure sbEmpresaClick(Sender: TObject);
    procedure sbProductoClick(Sender: TObject);
    procedure sbDomicilioClick(Sender: TObject);
    procedure sbContratoLiqClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure sbMotivoClick(Sender: TObject);
    procedure CatalogoOrigenRecClick(Sender: TObject);
    procedure LimpiarOrigenRecClick(Sender: TObject);
    procedure CatalogoDestinoRecClick(Sender: TObject);
    procedure LimpiarDestinoRecClick(Sender: TObject);
    procedure edIdTitularContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure edNombreTitularContextPopup(Sender: TObject;
      MousePos: TPoint; var Handled: Boolean);
    procedure edContratoLiqContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure edCalleNumeroContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure edNombreEmpresaContextPopup(Sender: TObject;
      MousePos: TPoint; var Handled: Boolean);
    procedure edMonedaContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure edGrupoContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure edNombrePromotorContextPopup(Sender: TObject;
      MousePos: TPoint; var Handled: Boolean);
    procedure edDescProductoContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure edTipoContratoContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure edUnNegocioContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure edSegmentoContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure edDescConceptoContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure btnKYCClick(Sender: TObject);
    procedure btnDiagnosticoKYCClick(Sender: TObject);
    procedure sbIncisoClick(Sender: TObject);
    procedure CatalogoActividadClick(Sender: TObject);
    procedure LimpiarActividadClick(Sender: TObject);
    procedure linkActividadCapture(Sender: TObject; var Show: Boolean);
    procedure linkActividadEjecuta(Sender: TObject);
    procedure btnAsignarProspectoClick(Sender: TObject);
    procedure btnEliminarProspectoClick(Sender: TObject);
    procedure sbCTOPRLVClick(Sender: TObject);
    procedure sbCTOFONDOSClick(Sender: TObject);
    procedure edID_CTO_PRLVChange(Sender: TObject);
    procedure edID_CTO_FDOSChange(Sender: TObject);
    procedure btnVisitaDomiClick(Sender: TObject);
    procedure cbCveRegimenDropDown(Sender: TObject);
    procedure cbCveRegimenDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cbCveRegimenClick(Sender: TObject);
    procedure sbProspectoClick(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure btnMailClick(Sender: TObject);
    procedure cbEDCClick(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure bOrigRecClick(Sender: TObject);
    procedure bDestRecClick(Sender: TObject);
    procedure bProdSolicClick(Sender: TObject);
    procedure bTransClick(Sender: TObject);
    procedure bPerExtClick(Sender: TObject);
    procedure bRecExtClick(Sender: TObject);
    procedure bTipOpClick(Sender: TObject);
    procedure bRelComerClick(Sender: TObject);
    procedure bTarSolicClick(Sender: TObject);
    procedure bImptoClick(Sender: TObject);
    procedure bAsigSitKYCClick(Sender: TObject);
    procedure sbServicioFinClick(Sender: TObject);
    procedure sbTipCteClick(Sender: TObject);
    procedure edCveServicioFinChange(Sender: TObject);
    procedure sbMotCamPromClick(Sender: TObject);
    procedure edNombrePromotorChange(Sender: TObject);
    procedure edNombrePromotorDblClick(Sender: TObject);
    procedure sbPsiEvaluaClick(Sender: TObject);
    procedure sbMaxPerfilClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure cbTipoCuentaChange(Sender: TObject);
    procedure chkCIClick(Sender: TObject);
    procedure bbAcuseReciboClick(Sender: TObject);
    procedure bbMotivosClick(Sender: TObject);

  private
    vIdTitularOld : Integer;
    vB_AperturaRec,
    vB_AsignacionCtoApRec : Boolean; { CAPM }

    procedure pActualizaStockCtosAperturaReciente;
    function fEsPromotor : Boolean;
    Procedure LocalizaActividad;
    procedure ValidaSeleccionTitular(vlSIT_PERSONA : String);
    Procedure ValidaEmpresaUnidadNegocio;
    procedure OnAfterLocalizaEmpresa(Sender:TObject);

    function fUsuarioConCtaAperRec() : Boolean;
    function fEsCtoAperturaReciente( aIdContrato : Integer ) : Boolean;
    function fObtenCtoDpVista : String;
    function solicitaCuestionario() : Boolean;
    function validacionesPerfil(): Boolean;
  public
//    cveCorreo : string  ;
//    pass:String;
    bandElim  : boolean;
    tipoOper  : boolean;
    Apli      : TInterApli;
    objeto    : TContrato;
    Motivo    : TMotIna;
    G_Activo  : boolean;
    sitCambio : boolean;
    cambProm  : boolean;

    procedure CambioContrato(Sender:TObject);
    Procedure ValidaProspectos;
    procedure DespuesShow(Var Msg:TMessage); Message WM_DESPUESSHOW;
    procedure EstadoContrato;
    procedure HabilitaPopUpMenu;
    Function  Verifica_ProspectoTitular : String;        // CZR 26-feb-2009
    procedure Visibilidad_Prospecto(pVisible : Boolean); // CZR 06-mar-2009
    procedure AcuseRecibo(pPreview : Boolean);           // CZR 17-feb-2015
    function  GeneraMensaje(Mensaje:String;idCtto,cveCorreo,descPeriodo:String):string;
    function  GetBodyMail(idCtto,cveCorreo,descPeriodo:String): String;
    function  solicitaMail():String;
    function  ValidarInsertMail(idcontrato:string):integer;
    Function  Verifica_Configuracion_Documentos(vTipoPerfil  : Integer;        //rohs4279 nov/2015 req. PMO150817
                                                vCveElemento : String;
                                                vIdCto       : Integer) : String;
    procedure Valida_Atributos;                                                //rohs4279 nov/2015 req. PMO150817
    procedure Inhabilita_Atributos;                                            //rohs4279 nov/2015 req. PMO150817
  end;

  TContrato= class(TInterFrame)
  private
    TitularAnt: Integer;
    SitContratoAnt: String;
    Procedure IniciaConfigContrato;
  protected
    // CZR 01-abr-2013
    vTabInfoKYC    : TTabSheet;
    vcbSitKYC      : TComboBox;
    // CZR 03-oct-2013
    vlNivelRiesgo  : TLabel;    
    vEdNivelRiesgo : TEdit;
    // CZR 17-feb-2015
    vBAcuseRecibo  : TBitBtn;

    FOnCambioContrato:TNotifyEvent;
    procedure InternalDespuesLocaliza(Sender:TObject);
    procedure RefrescaPrefijo;
    Function  GetCampo(FieldName:String):String; override;
  public
    ID_Contrato          : TInterCampo;
    Cve_Moneda           : TInterCampo;
    Cve_Segmento         : TInterCampo;
    Cve_Tip_Contrato     : TInterCampo;
    Id_Cto_Liq           : TInterCampo;
    Id_Pers_Asociad      : TInterCampo;
    Id_Grupo             : TInterCampo;
    Id_Domicilio         : TInterCampo;
    Id_Empresa           : TInterCampo;
    Id_Entidad           : TInterCampo;
    Cve_Corresp          : TInterCampo;
    Cve_Producto         : TInterCampo;
    Cve_Tipo_Cta         : TInterCampo;
    B_Asig_Seg_Aut       : TInterCampo;
    B_Impreso            : TInterCampo;
    F_Alta               : TInterCampo;
    F_Baja               : TInterCampo;
    ID_Titular           : TInterCampo;
    Nomb_Contrato        : TInterCampo;
    Sit_Contrato         : TInterCampo;
    Sit_Documentos       : TInterCampo;
    FH_Modificacion      : TInterCampo;
    Cve_Usuar_Modif      : TInterCampo;
    B_Doctos_Verif       : TInterCampo;
    F_Traspaso           : TInterCampo;
    F_Reactivacion       : TInterCampo;
    B_Restringido        : TInterCampo;
    CVE_REGIMEN          : TInterCampo;
    COMB_FIRMAS          : TInterCampo;
    CVE_TIPO_FIDE        : TInterCampo;
    ID_CONTRA_DV         : TInterCampo;
    ID_CONTRA_IB         : TInterCampo;
    SDO_PATRIMONIO       : TInterCampo;
    CVE_DISCRECIONAL     : TInterCampo;
    CVE_SEG_OBJETIVO     : TInterCampo;
    F_INI_PZO_OBJ        : TInterCampo;
    PLAZO_OBJETIVO       : TInterCampo;
    SDO_POS_LIQUIDA      : TInterCampo;
    TX_COMENTARIO        : TInterCampo;
    CVE_CONCEP_CTO       : TInterCampo;
    CVE_ACTIV_CTO        : TInterCampo;  // BMR 17/04/2000
    B_ASESOR_INV         : TInterCampo;
    ID_ORIGEN_REC        : TInterCampo;
    ID_DESTINO_REC       : TInterCampo;
    B_SOL_ILINE          : TInterCampo;
    SEGU_CHECAR          : TInterCampo;
    SEGU_CVE_USUARIO     : TInterCampo;
    SEGU_ID_EMPRESA      : TInterCampo;
    TITNOMBRE            : TInterCampo;
    EMPNOMBRE            : TInterCampo;
    PROMNOMBRE           : TInterCampo;
    ES_EMPLEADO          : TInterCampo;
    DESC_MONEDA          : TInterCampo;
    DESC_PRODUCTO        : TInterCampo;
    CodResp              : TInterCampo;
    Cve_Usuario          : TInterCampo;//USUARIO DE NET_CONTRATO
    Cve_Tip_Suscr        : TInterCampo;
    F_Primer_Envio       : TInterCampo;
    F_Expiracion         : TInterCampo;
    Num_Envios           : TInterCampo;
    Tot_Enviados         : TInterCampo;
    Cve_Motivo           : TInterCampo;
    Tx_Motivo            : TInterCampo;
    B_Ilocalizable       : TInterCampo;     // CZR 29-ene-2009
    ID_Prospecto         : TInterCampo;     // CZR 25-feb-2009

    B_ICreaIFS           : TInterCampo; //SACA4984


    {-- Checks para Atributos de Ctto [SACA4984 Septiembre 2013]--}
    B_CteInstitucional   : TInterCampo; {<--- Atributo Cliente Institucional      }
    B_CteSofisticado     : TInterCampo; {<--- Atributo Cliente Sofisticado        }
    B_CteCalificado      : TInterCampo; {<--- Atributo Cliente Calificado         }
    B_Elegible           : TInterCampo; {<--- Atributo Elegible                   }
    Cve_ServicioFin      : TInterCampo;
    Cve_Tip_Cte          : TInterCampo;
    Cve_Gpo_Motivo       : TInterCampo;
    Cve_MotivoProm       : TInterCampo;
    Id_Evaluacion        : TInterCampo;
    Id_Tipo_Perfil       : TInterCampo;


    Titular              : TMPersona;
    Grupo                : TGpoCto;
    Domicilio            : TDomicilio;
    Empresa              : TMPersona;
    UnNegocio            : TUnNegocio;
    Producto             : TProducto;
    Moneda               : TMoneda;
    Segmento             : TSegmento;
    CIBCSegmento         : TSegmento;
    Concepto             : TConcCtte;
    Actividad            : TActividad;
    ConfigCaptura        : TCtoConPro;
    Prospecto            : TMPersona; // CZR 25-feb-2009
    Email                : TInterCampo;
    DocumentoClave       : TCarPdfImp;
    Servicio             : TSerFin;
    TipoServicio         : TTipCte;
    MotCambPromotor      : TMotivo;
    PsiEvaluacion        : TPsiEvalua;
    PsiMaxPerfil         : TPcTPerfil;

    EditIdContrato       : TEdit;
    EditPrefijo          : TEdit;
    vlSituacion          : String;
    ApNet                : TInterApli;

    //MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES SE AGREGA EL SIGUIENTE CODIGO
    B_SOBREGIRO     : TInterCampo;
    ID_CTO_PRLV     : TInterCampo;
    ID_CTO_FDOS     : TInterCampo;
    F_ANIVERSARIO   : TInterCampo;
    CVE_TP_COMISION : TInterCampo;
    cvecorreo       : String;
    pass            : string;
    //MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES HASTA AQUI LOS CAMBIOS
    vg_perfil       : Integer;                                                 //rohs4279 nov/2015 req.PMO150817
    vg_subserv      : String;                                                  //rohs4279 nov/2015 req.PMO150817

    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    Procedure   DataBaseChange; override;
    function    InternalLocaliza:Boolean; override;
    function    InternalBusca : Boolean; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
    procedure   OnProductoDespuesBusca(Sender:TObject);
    function    InternalEdit:Boolean; override;
    function    InternalPost:Boolean; override;
    function    InternalAppend:Boolean; override;
    procedure   OnTitularDespuesBusca(Sender:TObject);
    procedure   LocalizaCurrent; override;
    function    InternalCancel:Boolean; override;
    function    InternalDelete:Boolean; override;
    function    ValidaLocaliza:Boolean; override;
    function    Localiza:Boolean; override;
    Property    OnCambioContrato:TNotifyEvent Read FOnCambioContrato Write FOnCambioContrato;
    function    EsClienteAAA : boolean;

    Function    AsignaProspecto(pNuevoContrato: Real): Boolean;
    Function    EliminaProspecto: Boolean;
    // < Inicia Modificación por SATV el 18Sep2006 >
    function    StpTieneCtosBlqAut( peID_TITULAR           : Integer;
                                    peDataBaseName         ,
                                    peSessionName          : String;
                                    var psTOTAL_CTOS_BLOQ  : Integer;
                                    var psRESULTADO        : Integer;
                                    var psTX_RESULTADO     : String
                                   ) : Boolean;
    // < Termina Modificación por SATV >

    // CZR 05-ago-2010
    function    ObtenerRFC : String;
    procedure   FormatearUsrINET;
    // CZR 01-abr-2013   PLD
    function  Existe_OrigenRecursos(pIdContrato : String; pIdOrigenRec : String) : String;
    function  TieneAcceso(pAcceso : String) : Boolean;
    procedure CargarSituacionKYC;
    procedure ObtenerSituacionKYC;
    procedure Visibilidad_NivelRiesgo(pVisible : Boolean; pObtNivelRiesgo : Boolean); // CZR 03-oct-2013
    // CZR 26-nov-2014
    function  ValidaTitularPLD(pAccion : String; pMostrarCat : Boolean = True) : Boolean;
    function  ValidaCttePLD(pAccion : String) : Boolean;

    Procedure ValidaIdFiscalCttes;  // Luis Hernandez Mar 2016

    // CZR 01-abr-2013   PLD
    property  pTabInfoKYC    : TTabSheet read vTabInfoKYC    write vTabInfoKYC;
    property  pcbSitKYC      : TComboBox read vcbSitKYC      write vcbSitKYC;
    // CZR 03-oct-2013
    property  plNivelRiesgo  : TLabel    read vlNivelRiesgo  write vlNivelRiesgo;
    property  pEdNivelRiesgo : TEdit     read vEdNivelRiesgo write vEdNivelRiesgo;
    // CZR 17-feb-2015
    property  pBAcuseRecibo  : TBitBtn   read vBAcuseRecibo  write vBAcuseRecibo;
  published
  end;

Function GetCtoHavingStr(Frame:TInterFrame; TablaCto:String; Var ExtraCampos: String):String;

implementation

uses
  IntCtte,          { Contratantes }
  IntDCtte,         { Documentación de Contratantes }
  IntDCtto,         { Documentación del Contrato }
  IntChCteCto,      { Chequeras asociadas a los contratantes del Contrato }
  IntDocAdic,       { Documentación adicional de los Contratantes del Contrato }
  IntMetaCtoAsoc,   { Contratos Asociados a un Metacontrato }
  IntNetCto,        { Información adicional para contratos de Internet }
  { Reportes }
  RepCtto,          { General del Contrato }
  RepCtto2,         { Adicional de Contratos }
  UnRpKYCPF,        { Información KYC P Fisicas Interno }
  UnRpKYCPFEmp,     { Información KYC P Fisicas con Actividad Empresarial Interno }
  UnRpKYCPM,        { Información KYC P Morales Interno }
  UnRpDiagKYCPF,    { Diagnostico KYC P Fisicas }
  UnRpDiagKYCPFEmp, { Diagnostico KYC P Fisicas con Actividad Empresarial }
  UnRpDiagKYCPM,    { Diagnostico KYC P Morales }
  { Pantallas de Impresion de Proemio }
  IntProemioICB,     { Impresion del Proemio de Intermediacion Bursatil }

  RepCttoSelRep,     { Proemio Casa de Bolsa }
  RepCttofoToluca,   { Proemio Cuenta Interacciones - Servicios Bancarios }
  RepCttofoOMSC,     { Proemio Operaciones de Mercado de Dinero sin Contrato}
  RepCttofoInterFin, { Proemio Interfinancial services }
  RepCttofoILine,    { Proemio Internet con operaciones de MCAP }
  IntProemioGen,     { Proemio General } // CZR 09-nov-2010
  IntCtoVisDom,      { Visita Domiciliaria }

  IntCtoOriRecursos, { Origen de Recursos por Contrato }      // CZR 13-feb-2013
  IntCtoDesRecursos, { Destino de Recursos por Contrato }     // CZR 13-feb-2013
  IntCtoProdSol,     { Productos solicitados por Contrato }   // CZR 19-feb-2013
  IntCtoOp,          { Transaccionalidad por Contrato }       // CZR 18-feb-2013
  IntCtoPerExt,      { Persona Extranjera }                   // CZR 12-abr-2013
  IntCtoRecExt,      { Recursos Extranjeros }                 // CZR 15-abr-2013
  IntCtoOpAux,       { Operacion por Contrato }               // CZR 03-abr-2013
  IntCtoSolTar,      { Tarjetas solicitadas por Contrato }    // CZR 19-feb-2013
  IntCtoImpto,       { Impuesto por Contrato }                // CZR 20-feb-2013
  IntCtoOpRelCom,    { Relacion Comercial por Contrato }      // CZR 21-mar-2013
  UnCtoBitInactiva;  { Bitácora de Inactivación de Contratos} // CZR 04-mar-2013

var
   vgValEnvEdoCta : Boolean; // CZR 16-may-2013   Bandera para Activar o Desactivar validacion de checkbox, para Envio de EDC por Email
{$R *.DFM}

constructor TString.Create(const cStr : String); // CZR 01-abr-2013
begin
  inherited Create;
  vStr := cStr;
end;

procedure TContrato.CargarSituacionKYC; // CZR 01-abr-2013
var Qry : TQuery;

begin
  pcbSitKYC.Items.Clear;
  try
    Qry := GetSQLQuery('select * from cto_tipo_situacion_kyc order by orden_asig, desc_sit_kyc',
                       Self.Apli.DataBaseName, Self.Apli.SessionName, False);
    if Qry <> nil then
      while not Qry.eof do begin
        pcbSitKYC.Items.AddObject(trim(Qry.FieldByName('DESC_SIT_KYC').AsString),
                                  TString.Create(trim(Qry.FieldByName('CVE_SIT_KYC').AsString)));
        Qry.next;
      end;
  finally
    if Qry <> nil then
      Qry.Free;
  end;
end;

procedure TContrato.ObtenerSituacionKYC; // CZR 01-abr-2013
var vCtoSitKYC : String;
    vItemIndex : Integer;

begin
  if (pTabInfoKYC <> nil) and (pcbSitKYC <> nil) then begin
    vCtoSitKYC := trim(CtoSituacionKYC(Self, ID_Contrato.AsInteger, cClave));
    for vItemIndex := 0 to pcbSitKYC.Items.Count-1  do begin
      if trim(vCtoSitKYC) = trim(TString(pcbSitKYC.Items.Objects[vItemIndex]).pStr) then
        pcbSitKYC.ItemIndex := vItemIndex;
    end;
    if (trim(vCtoSitKYC) = cSinAutor) or (trim(vCtoSitKYC) = cRecContratos) then
      pTabInfoKYC.Enabled := TieneAcceso(cRolUsrPromocion);
    if (trim(vCtoSitKYC) = cAutPromocion) or (trim(vCtoSitKYC) = cAutContratos) then
      pTabInfoKYC.Enabled := TieneAcceso(cRolUsrContratos);
  end;
end;

procedure TContrato.FormatearUsrINET; // CZR 05-ago-2010
var vAux : String;
    vCon : Integer;
    vPos : Integer;

begin
  vAux := trim(Cve_Usuario.AsString);
  vCon := 1;
  vPos := 1;

  if pos('X', vAux) = 0 then
    vAux := copy(vAux, 1, 4) + 'X' + copy(vAux, 6, length(vAux))
  else begin
    while vCon <= length(vAux) do begin
      if copy(vAux, vCon, 1) = 'X' then
        vPos := vCon;
      inc(vCon);
    end;
    if length(vAux) <> vPos then begin
      if vPos <= 4 then
        vAux := copy(vAux, 1, 4) + 'X' + copy(vAux, 6, length(vAux))
      else begin
        if (vPos + 2) > length(vAux) then
          vAux := copy(vAux, 1, vPos) + 'X'
        else
          vAux := copy(vAux, 1, vPos) + 'X' + copy(vAux, (vPos+2), length(vAux)) ;
      end;
    end;
  end;

  Cve_Usuario.AsString := trim(vAux);
  Cve_Usuario.DrawControl;
end;

function TContrato.ObtenerRFC : String;   // CZR 05-ago-2010
var
   Stp        : TStoredProc;
   Qry        : TQuery;
   vFecha     : String;
   vRazSocial : String;
   vNombre    : String;
   vApPaterno : String;
   vApMaterno : String;
begin
   try
      try
         vFecha     := '';
         vRazSocial := '';
         vNombre    := '';
         vApPaterno := '';
         vApMaterno := '';

         Qry := GetSQLQuery(' select per.cve_per_juridica, '
                          + '        pf.nombre_persona, '
                          + '        pf.apellido_paterno, '
                          + '        pf.apellido_materno, '
                          + '        pf.f_nacimiento, '
                          + '        pm.nom_razon_social, '
                          + '        pm.f_constitucion '
                          + ' from persona       per, '
                          + '      persona_fisica pf, '
                          + '      persona_moral  pm '
                          + ' where per.id_persona   = ' + Titular.ID_Persona.AsSQL
                          + '   and pf.id_persona(+) = per.id_persona '
                          + '   and pm.id_persona(+) = per.id_persona', Apli.DataBaseName, Apli.SessionName, False);
         with Qry do
         begin
            if Qry <> nil then
            begin
               if trim(FieldByName('CVE_PER_JURIDICA').AsString) = 'PF' then
               begin
                  vFecha     := trim(FieldByName('F_NACIMIENTO').AsString);
                  vNombre    := trim(FieldByName('NOMBRE_PERSONA').AsString);
                  vApPaterno := trim(FieldByName('APELLIDO_PATERNO').AsString);
                  vApMaterno := trim(FieldByName('APELLIDO_MATERNO').AsString);
               end
               else
               begin
                  vFecha     := trim(FieldByName('F_CONSTITUCION').AsString);
                  vRazSocial := trim(FieldByName('NOM_RAZON_SOCIAL').AsString);
               end;
            end;
         end;

         with Stp do
         begin
            Stp := TStoredProc.Create(Self);

            Params.Clear;
            StoredProcName := 'PKGCORPRFC.CALCULARFC';
            DatabaseName   := SeguDataBaseName;
            SessionName    := SeguSessionName;
            Params.CreateParam(ftString,  'pNomRazonSocial',  ptInput);
            Params.CreateParam(ftString,  'pApellidoPaterno', ptInput);
            Params.CreateParam(ftString,  'pApellidoMaterno', ptInput);
            Params.CreateParam(ftString,  'pNombrePersona',   ptInput);
            Params.CreateParam(ftDate,    'pFRfc',            ptInput);
            Params.CreateParam(ftString,  'pSiglas',          ptOutput);
            Params.CreateParam(ftString,  'pNumeros',         ptOutput);
            Params.CreateParam(ftString,  'pHomoclave',       ptOutput);
            Params.CreateParam(ftInteger, 'pResultado',       ptOutput);
            Params.CreateParam(ftString,  'pDescResultado',   ptOutput);

            Params.ParamByName('pNomRazonSocial').AsString  := vRazSocial;
            Params.ParamByName('pApellidoPaterno').AsString := vApPaterno;
            Params.ParamByName('pApellidoMaterno').AsString := vApMaterno;
            Params.ParamByName('pNombrePersona').AsString   := vNombre;
            if trim(vFecha) = '' then
               Params.ParamByName('pFRfc').AsString := trim(vFecha)
            else
               Params.ParamByName('pFRfc').AsDate   := StrToDate(vFecha);

            ExecProc;

            if Params.ParamByName('pResultado').AsInteger = 0 then
               Result := trim(Params.ParamByName('pSiglas').asString)
            else
               raise EInterFrame.Create('Error al obtener el RFC. ' + chr(VK_RETURN) + trim(Params.ParamByName('pDescResultado').asString));
         end;
      finally
         if Qry <> nil then   Qry.Free;   Qry := nil;
         if Stp <> nil then   Stp.Free;   Stp := nil;
      end
   except
      Result := '';
   end;
end;

Constructor TContrato.Create( AOwner : TComponent );
begin
  Inherited Create(AOwner);
  FOnCambioContrato      := nil;
  ID_Contrato            := CreaCampo('ID_CONTRATO',ftFloat,tsConsulta+tsNuevo+tsModifica+tsElimina,tsNuevo,True);
  ID_Contrato.TipoReader := trContrato;
  Cve_Moneda    :=CreaCampo('CVE_MONEDA',ftInteger,tsModifica+tsNuevo,tsConsulta,True);
  Cve_Segmento    :=CreaCampo('CVE_SEGMENTO',ftString,tsModifica+tsNuevo,tsConsulta,True);
  Cve_Segmento.Size:=4;
  Cve_TiP_Contrato:=CreaCampo('CVE_TIP_CONTRATO',ftString,tsModifica+tsNuevo,tsConsulta,True);
  Cve_TiP_Contrato.Size:=4;
  Id_Cto_Liq      :=CreaCampo('ID_CTO_LIQ',ftFloat,tsModifica+tsNuevo,tsConsulta,True);
  Id_Pers_Asociad :=CreaCampo('ID_PERS_ASOCIAD',ftFloat,tsModifica+tsNuevo,tsConsulta,True);
  Id_Grupo        :=CreaCampo('ID_GRUPO',ftInteger,tsModifica+tsNuevo,tsConsulta,True);
  Id_Domicilio    :=CreaCampo('ID_DOMICILIO',ftFloat,tsModifica+tsNuevo,tsConsulta,True);
  Id_Empresa      :=CreaCampo('ID_EMPRESA',ftFloat,tsModifica+tsNuevo,tsConsulta,True);
  Id_Entidad      :=CreaCampo('ID_ENTIDAD',ftInteger,tsModifica+tsNuevo,tsConsulta,True);

  Cve_Corresp     :=CreaCampo('CVE_CORRESP',ftString,tsModifica+tsNuevo,tsConsulta,True);
  with Cve_Corresp do begin
    Size:=2;
    UseCombo:=True;
    ComboLista.Add('RETENER');                  ComboDatos.Add('RT');
    ComboLista.Add('CORREO');                   ComboDatos.Add('CR');
    ComboLista.Add('DHL');                      ComboDatos.Add('DH');
    ComboLista.Add('FEDERAL EXPRESS');          ComboDatos.Add('FX');
    ComboLista.Add('LIQUIDACION');              ComboDatos.Add('LQ');
    ComboLista.Add('RET. DE BANCO');            ComboDatos.Add('RB');
    ComboLista.Add('RET. DE CTAS. PROPIAS');    ComboDatos.Add('RP');
    ComboLista.Add('RET. DE CTES. MENSAJEROS'); ComboDatos.Add('RC');
    ComboLista.Add('APARTADO POSTAL');          ComboDatos.Add('AP');
    ComboLista.Add('CONSULTA PORTAL');          ComboDatos.Add('WW');
  end;
  Cve_Producto    :=CreaCampo('CVE_PRODUCTO',ftString,tsModifica+tsNuevo,tsConsulta,True);
  Cve_Producto.Size:=4;
  Cve_Tipo_Cta    :=CreaCampo('CVE_TIPO_CTA',ftString,tsModifica+tsNuevo,tsConsulta,True);
  with Cve_Tipo_Cta do begin
    Size:=2;
    UseCombo:=True;
    ComboLista.Add('ADMINISTRATIVO'); ComboDatos.Add('AD');
    ComboLista.Add('EMPLEADO');       ComboDatos.Add('EM');
    ComboLista.Add('NORMAL');         ComboDatos.Add('NO');
  end;
  B_Asig_Seg_Aut  :=CreaCampo('B_ASIG_SEG_AUT',ftString,tsModifica+tsNuevo,tsConsulta,True);
  with B_Asig_Seg_Aut do begin
    Size:=1;
    UseCombo:=True;
    ComboLista.Add('SI');                  ComboDatos.Add('V');
    ComboLista.Add('NO');                  ComboDatos.Add('F');
  end;
  B_Impreso       :=CreaCampo('B_IMPRESO',ftString,tsModifica+tsNuevo,tsConsulta,True);
  B_Impreso.Size:=1;
  F_Alta          :=CreaCampo('F_ALTA',ftDate,tsModifica+tsNuevo,tsConsulta,True);
  F_Baja          :=CreaCampo('F_BAJA',ftDate,tsModifica+tsNuevo,tsConsulta,True);
  ID_Titular      :=CreaCampo('ID_TITULAR',ftInteger,tsModifica+tsNuevo,tsConsulta,True);

  // CZR 25-feb-09
  ID_Prospecto           := CreaCampo('ID_PROSPECTO', ftInteger, tsModifica+tsNuevo, tsConsulta, True);
  ID_PROSPECTO.Parametro := 'P_ID_PROSPECTO';

  Nomb_Contrato   :=CreaCampo('NOMB_CONTRATO',ftString,tsModifica+tsNuevo,tsConsulta,True);
  Sit_Contrato    :=CreaCampo('SIT_CONTRATO',ftString,tsModifica+tsNuevo,tsConsulta,True);
  with Sit_Contrato do begin Size:=2;
    UseCombo:=True;
    ComboLista.Add('0');  ComboDatos.Add('AC');
    ComboLista.Add('1');  ComboDatos.Add('IN');
    ComboLista.Add('2');  ComboDatos.Add('CA'); // CZR 17-feb-2015
  end;
  //LISTAS CON EL FRAME
  Sit_Documentos  :=CreaCampo('SIT_DOCUMENTOS',ftString,tsModifica+tsNuevo,tsConsulta,True);
  with Sit_Documentos do begin
    Size:=2;
    UseCombo:=True;
    ComboLista.Add('0');  ComboDatos.Add('CO');
    ComboLista.Add('1');  ComboDatos.Add('IN');
  end;
  Cve_Usuar_Modif :=CreaCampo('CVE_USUAR_MODif',ftString,tsModifica+tsNuevo,tsConsulta,True);
  Cve_Usuar_Modif.Size:=8;
  FH_Modificacion :=CreaCampo('FH_Modificacion',ftDatetime,tsModifica+tsNuevo,tsConsulta,True);
  B_Doctos_Verif  :=CreaCampo('B_DOCTOS_VERif',ftString,tsModifica+tsNuevo,tsConsulta,True);
  B_Doctos_Verif.Size:=1;
  F_Traspaso      :=CreaCampo('F_TRASPASO',ftDate,tsModifica+tsNuevo,tsConsulta,True);
  F_Reactivacion  :=CreaCampo('F_REACTIVACION',ftDate,tsModifica+tsNuevo,tsConsulta,True);
  B_Restringido   :=CreaCampo('B_RESTRINGIDO',ftstring,tsModifica+tsNuevo,tsConsulta,True);
  B_Restringido.Size:=1;
  TX_COMENTARIO   :=CreaCampo('TX_COMENTARIO',ftstring,tsModifica+tsNuevo,tsConsulta,True);
  CVE_REGIMEN                :=CreaCampo('CVE_REGIMEN',ftString,tsNuevo+tsModifica,tsConsulta,False);
  with CVE_REGIMEN do begin
    Size:=2;
    UseCombo:=True;
    ComboLista.Add('INDIVIDUAL');  ComboDatos.Add('IN');
    //ComboLista.Add('INDISTINTA');  ComboDatos.Add('ID');
    ComboLista.Add('SOLIDARIO');  ComboDatos.Add('SO');
    ComboLista.Add('MANCOMUNADA');  ComboDatos.Add('MA');
  end;
  COMB_FIRMAS                :=CreaCampo('COMB_FIRMAS',ftString,tsNuevo+tsModifica,tsConsulta,False);
  CVE_DISCRECIONAL           :=CreaCampo('CVE_DISCRECIONAL',ftString,tsNuevo+tsModifica,tsConsulta,False);
  with CVE_DISCRECIONAL do begin Size:=4;
    UseCombo:=True;
    ComboLista.Add('DISCRECIONAL');  ComboDatos.Add('DIS');
    ComboLista.Add('NO DISCRECIONAL');  ComboDatos.Add('NDIS');
    ComboLista.Add('LIMITADA');  ComboDatos.Add('LIMI');
  end;
  CVE_SEG_OBJETIVO           :=CreaCampo('CVE_SEG_OBJETIVO',ftString,tsNuevo+tsModifica,tsConsulta,False);
  CVE_SEG_OBJETIVO.Size:=4;
  F_INI_PZO_OBJ              :=CreaCampo('F_INI_PZO_OBJ',ftDate,tsNuevo+tsModifica,tsConsulta,False);
  PLAZO_OBJETIVO             :=CreaCampo('PLAZO_OBJETIVO',ftInteger,tsNuevo+tsModifica,tsConsulta,False);
  SDO_POS_LIQUIDA            :=CreaCampo('SDO_POS_LIQUIDA',ftFloat,tsNuevo+tsModifica,tsConsulta,False);
  CVE_TIPO_FIDE              :=CreaCampo('CVE_TIPO_FIDE',ftString,tsNuevo+tsModifica,tsConsulta,False);
  with CVE_TIPO_FIDE do begin
    Size:=4;
    UseCombo:=True;
    ComboLista.Add('GARANTIA');       ComboDatos.Add('GARA');
    ComboLista.Add('INVERSION');      ComboDatos.Add('INVE');
    ComboLista.Add('ADMINISTRACION'); ComboDatos.Add('ADMO');
    ComboLista.Add('OTROS');          ComboDatos.Add('OTRO');
  end;
  ID_CONTRA_DV   := CreaCampo('ID_CONTRA_DV',ftInteger,tsNuevo+tsModifica,tsConsulta,False);
  ID_CONTRA_IB   := CreaCampo('ID_CONTRA_IB',ftInteger,tsNuevo+tsModifica,tsConsulta,False);
  SDO_PATRIMONIO := CreaCampo('SDO_PATRIMONIO',ftFloat,tsNuevo+tsModifica,tsConsulta,False);
  CVE_CONCEP_CTO := CreaCampo('CVE_CONCEP_CTO',ftString,tsNuevo+tsModifica,tsConsulta,False);
  CVE_CONCEP_CTO.Size:=4;
  CVE_CONCEP_CTO.Parametro := 'P_CVE_CONCEPTO';
  CVE_ACTIV_CTO := CreaCampo('CVE_ACTIV_CTO',ftString,tsNuevo+tsModifica,tsConsulta,False);
  CVE_ACTIV_CTO.Size:=12;
  CVE_ACTIV_CTO.Parametro := 'P_CVE_ACTIV_CTO';
  B_ASESOR_INV := CreaCampo('B_ASESOR_INV',ftString,tsNuevo+tsModifica,tsConsulta,False);
  ID_DESTINO_REC := CreaCampo('ID_DESTINO_REC',ftInteger,tsNuevo+tsModifica,tsConsulta,False);
  ID_ORIGEN_REC := CreaCampo('ID_ORIGEN_REC',ftInteger,tsNuevo+tsModifica,tsConsulta,False);
  B_SOL_ILINE:= CreaCampo('B_SOL_ILINE', ftString, tsNuevo+tsModifica, tsConsulta, False);
  CodResp:=CreaCampo('CODRESP',ftInteger,tsNinguno,tsConsulta+tsNuevo+tsModifica+tsElimina,True);
  CodResp.Size:=1;
  SEGU_CVE_USUARIO:=CreaCampo('SEGU_CVE_USUARIO' ,ftString,tsConsulta,tsNinguno,False);
  SEGU_CVE_USUARIO.Parametro:='P_SEGU_CVE_USUARIO';
  SEGU_ID_EMPRESA:=CreaCampo('SEGU_ID_EMPRESA' ,ftString,tsConsulta,tsNinguno,False);
  SEGU_ID_EMPRESA.Parametro:='P_SEGU_ID_EMPRESA';
  SEGU_CHECAR    :=CreaCampo('SEGU_CHECAR' ,ftString,tsConsulta,tsNinguno,False);
  SEGU_CHECAR.Parametro:='P_SEGU_CHECAR';
  SEGU_CHECAR.Size:=1;
  TITNOMBRE :=CreaCampo('TITNOMBRE' ,ftString,tsNinguno,tsConsulta,False);
  TITNOMBRE.Parametro:='P_NOM_TITULAR';
  EMPNOMBRE :=CreaCampo('EMPNOMBRE' ,ftString,tsNinguno,tsConsulta,False);
  EMPNOMBRE.Parametro:='P_NOM_EMPRESA';
  PROMNOMBRE:=CreaCampo('PROMNOMBRE',ftString,tsNinguno,tsConsulta,False);
  PROMNOMBRE.Parametro:='P_NOM_PROMOTOR';
  DESC_MONEDA:=CreaCampo('DESC_MONEDA',ftString,tsNinguno,tsNinguno,False);
  DESC_MONEDA.Parametro:='DESC_MONEDA';
  DESC_PRODUCTO:=CreaCampo('DESC_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
  DESC_PRODUCTO.Parametro:='DESC_PRODUCTO';
  ES_EMPLEADO := CreaCampo('ES_EMPLEADO',ftString,tsNinguno,tsConsulta,False);
  ES_EMPLEADO.Size:=1;
  ES_EMPLEADO.Parametro:='P_ES_EMPLEADO';
  Cve_Tip_Suscr:= CreaCampo('CVE_TIP_SUSCR',ftString,tsModifica+tsNuevo,tsConsulta, False);
  with Cve_Tip_Suscr do begin
    Size:= 1;
    UseCombo:= True;
    ComboDatos.Add('N');ComboLista.Add('0');
    ComboDatos.Add('F');ComboLista.Add('1');
  end;
  F_Primer_Envio:= CreaCampo('F_PRIMER_ENVIO',ftDate,tsModifica+tsNuevo,tsConsulta, False);
  F_Expiracion:= CreaCampo('F_EXPIRACION',ftDate,tsModifica+tsNuevo,tsConsulta, False);
  Num_Envios:= CreaCampo('NUM_ENVIOS',ftInteger,tsModifica+tsNuevo,tsConsulta, False);
  Tot_Enviados:= CreaCampo('TOT_ENVIADOS',ftInteger,tsModifica+tsNuevo,tsConsulta, False);
  Cve_Motivo:= CreaCampo('CVE_MOTIVO', ftString, tsModifica, tsNinguno, False);
  Tx_Motivo:= CreaCampo('TX_MOTIVO', ftString, tsModifica, tsNinguno, False);
  Email := CreaCampo('Email', ftString, tsNinguno, tsNinguno, False);

  //MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES SE AGREGA EL SIGUIENTE CODIGO
  B_SOBREGIRO     :=CreaCampo('B_SOBREGIRO',    ftString,tsModifica+ tsNuevo,tsConsulta,True);
  with B_SOBREGIRO do begin
    Size:= 1;
    UseCombo:= True;
    ComboDatos.Add('V');ComboLista.Add('0');
    ComboDatos.Add('F');ComboLista.Add('1');
  end;
  ID_CTO_PRLV     :=CreaCampo('ID_CTO_PRLV',    ftInteger,tsModifica+tsNuevo,tsConsulta,True);
  ID_CTO_FDOS     :=CreaCampo('ID_CTO_FDOS',    ftInteger,tsModifica+tsNuevo,tsConsulta,True);
  F_ANIVERSARIO   :=CreaCampo('F_ANIVERSARIO',  ftDate,   tsModifica+tsNuevo,tsConsulta,True);
  CVE_TP_COMISION :=CreaCampo('CVE_TP_COMISION',ftString, tsModifica+tsNuevo,tsConsulta,True);//tsModifica+tsNuevo,tsConsulta,True);
  with CVE_TP_COMISION do begin
    Size:= 2;
    UseCombo:= True;
    ComboDatos.Add('AN');ComboLista.Add('0');
    ComboDatos.Add('ME');ComboLista.Add('1');
  end;
  //MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES HASTA AQUI LOS CAMBIOS

  B_Ilocalizable := CreaCampo('B_Ilocalizable', ftString, tsModifica, tsConsulta, False);     //CZR 29-ene-2009

  B_ICreaIFS := CreaCampo('B_CREAIFSM', ftString, tsModifica + tsNuevo, tsNinguno, False); //SACA4984

 {-- Checks para Atributos de Ctto [SACA4984 Septiembre 2013]--}
  B_CteInstitucional := CreaCampo('B_CTEINSTITUCIONAL', ftString, tsModifica + tsNuevo, tsConsulta, False);
  B_CteSofisticado   := CreaCampo('B_CTESOFISTICADO'  , ftString, tsModifica + tsNuevo, tsConsulta, False);
  B_CteCalificado    := CreaCampo('B_CTECALIFICADO'   , ftString, tsModifica + tsNuevo, tsConsulta, False);
  B_Elegible         := CreaCampo('B_ELEGIBLE'        , ftString, tsModifica + tsNuevo, tsConsulta, False);

  Cve_ServicioFin    := CreaCampo('CVE_SERVICIO_FIN'  , ftString, tsModifica + tsNuevo, tsConsulta, False);
  Cve_Tip_Cte        := CreaCampo('CVE_TIP_CTE'       , ftString, tsModifica + tsNuevo, tsConsulta, False);
  Cve_Gpo_Motivo     := CreaCampo('CVE_GPO_MOTIVO'    , ftString, tsModifica , tsConsulta, False);
  Cve_MotivoProm     := CreaCampo('CVE_MOTIV'         , ftString, tsModifica , tsConsulta, False);

  {-- Folio de Cuestionario Servicios de Inversion ---}
  //Id_Evaluacion  := CreaCampo('ID_EVALUACION', ftInteger, tsModifica + tsNuevo, tsConsulta, False);
  //Id_Tipo_Perfil := CreaCampo('ID_TIPO_PERFIL',ftInteger, tsModifica + tsNuevo, tsConsulta, False);

  Id_Evaluacion  := CreaCampo('ID_EVALUACION', ftInteger, tsModifica + tsNuevo, tsConsulta, False);
  Id_Tipo_Perfil := CreaCampo('ID_TIPO_PERFIL',ftInteger, tsModifica + tsNuevo, tsConsulta, False);


  FKeyFields.Add('ID_CONTRATO');
  TableName := 'CONTRATO';
  STPName:= 'PKGCORPORATIVO.CONCONTRATO';
  StpAlName:= 'PKGCORPORATIVO.ALTACONTRATO';
  StpMoName:= 'PKGCORPORATIVO.MODCONTRATO';

  HelpFile := 'IntCtto.hlp';
  ShowMenuReporte:=False;

  Titular:=TMPersona.Create(Self);
  Titular.MasterSource:=Self;
  Titular.FieldByName('ID_PERSONA').MasterField:='ID_TITULAR';
  Titular.OnDespuesBusca:=OnTitularDespuesBusca;

  //CZR 29-feb-2009
  Prospecto := TMPersona.Create(Self);
  Prospecto.MasterSource   := Self;
  Prospecto.FieldByName('ID_PERSONA').MasterField := 'ID_PROSPECTO';

  Domicilio:=TDomicilio.Create(Self);
  Domicilio.MasterSource:=Self;
  Domicilio.FieldByName('ID_DOMICILIO').MasterField:='ID_DOMICILIO';

  Empresa:=TMPersona.Create(Self);
  Empresa.FilterBy:=fbTMPersonaEmpresa;
  Empresa.MasterSource:=Self;
  Empresa.FieldByName('ID_PERSONA').MasterField:='ID_EMPRESA';

  UnNegocio:=TUnNegocio.Create(Self);
  UnNegocio.MasterSource:=Self;
  UnNegocio.FieldByName('ID_ENTIDAD').MasterField:='ID_ENTIDAD';

  Producto:=TProducto.Create(Self);
  Producto.BuscaWhereString := '(PRODUCTO.SIT_PRODUCTO = ''AC'') and (Prod_Aut_Empresa.Sit_Prod_Aut = ''AC'')';
  Producto.MasterSource:=Self;
  Producto.FieldByName('CVE_PRODUCTO').MasterField:='CVE_PRODUCTO';
  Producto.OnDespuesBusca:=OnProductoDespuesBusca;

  Moneda:=TMoneda.Create(Self);
  Moneda.MasterSource:=Self;
  Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

  Segmento:=TSegmento.Create(Self);
  Segmento.MasterSource:=Self;
  Segmento.FieldByName('CVE_SEGMENTO').MasterField:='CVE_SEGMENTO';

  Actividad:= TActividad.Create(Self, True);
  Actividad.MasterSource:=Self;
  Actividad.FieldByName('CVE_ACTIV_CTO').MasterField:= 'CVE_ACTIV_CTO';

  CIBCSegmento:=TSegmento.Create(Self);
  CIBCSegmento.MasterSource:=Self;
  CIBCSegmento.FieldByName('CVE_SEGMENTO').MasterField:='CVE_SEG_OBJETIVO';

  Grupo:=TGpoCto.Create(Self);
  Grupo.MasterSource:=Self;
  Grupo.FieldByName('ID_PERS_ASOCIAD').MasterField:='ID_PERS_ASOCIAD';
  Grupo.FieldByName('ID_GRUPO').MasterField:='ID_GRUPO';

  Concepto:=TConcCtte.Create(Self);
  Concepto.MasterSource:=Self;
  Concepto.FieldByName('CVE_CONCEP_CTTE').MasterField:='CVE_CONCEP_CTO';
  Concepto.BuscaWhereString:='CVE_CTTE=''TI''';

  Servicio := TSerFin.Create(Self);
  Servicio.MasterSource:=Self;
  Servicio.FieldByName('CVE_SERVICIO_FIN').MasterField:='CVE_SERVICIO_FIN';
  
  TipoServicio:= TTipCte.Create(Self);
  TipoServicio.MasterSource:=Self;
  TipoServicio.FieldByName('CVE_TIP_CTE').MasterField:='CVE_TIP_CTE';
  TipoServicio.BuscaWhereString := '(CVE_SERVICIO_FIN IS NOT NULL)';

  PsiEvaluacion:= TPsiEvalua.Create(Self);
  PsiEvaluacion.MasterSource := Self;
  PsiEvaluacion.FieldByName('ID_EVALUACION').MasterField := 'ID_EVALUACION';

  PsiMaxPerfil := TPcTPerfil.Create(Self);
  PsiMaxPerfil.MasterSource := Self;
  PsiMaxPerfil.FieldByName('ID_TIPO_PERFIL').MasterField := 'ID_TIPO_PERFIL';

  ConfigCaptura:= TCtoConPro.Create(Self);

  Cve_Usuario:=CreaCampo('CVE_USUARIO',ftString,tsNinguno,tsNinguno,False);

  DocumentoClave := TCarPdfImp.Create(Self);
  DocumentoClave.MasterSource:=Self;


  MotCambPromotor  := TMotivo.Create(Self);
  MotCambPromotor.MasterSource := Self;
  MotCambPromotor.FieldByName('CVE_MOTIVO').MasterField:='CVE_MOTIV';
  MotCambPromotor.FieldByName('CVE_GPO_MOTIVO').MasterField:='CVE_GPO_MOTIVO';
  MotCambPromotor.BuscaWhereString := '(CVE_APLICACION =''CORP'')';

  IsCorp:=True;
  FStpRespuesta:='CODRESP';
  OnAfterLocaliza:=InternalDespuesLocaliza;
  vlSituacion:='';
  Debug:= False;
end;


Destructor TContrato.Destroy;
begin
  if Titular<>nil then Titular.Free; Titular:=nil;
  if Domicilio<>nil then Domicilio.Free; Domicilio:=nil;
  if Empresa<>nil then Empresa.Free; Empresa:=nil;
  if Grupo<>nil then Grupo.Free; Grupo:=nil;
  if Producto<>nil then Producto.Free; Producto:=nil;
  if UnNegocio<>nil then UnNegocio.Free; UnNegocio:=nil;
  if Moneda<>nil then Moneda.Free;  Moneda:=nil;
  if Segmento<>nil then Segmento.Free; Segmento:=nil;
  if Actividad<>nil then Actividad.Free; Actividad:=nil;
  if CIBCSegmento<>nil then CIBCSegmento.Free; CIBCSegmento:=nil;
  if Concepto<>nil then Concepto.Free; Concepto:=nil;
  If ConfigCaptura <> nil then ConfigCaptura.Free; ConfigCaptura:= nil;
  If DocumentoClave <> nil then DocumentoClave.Free;
  if Servicio<> nil then Servicio.Free;
  if TipoServicio<>nil then TipoServicio.Free;
  if MotCambPromotor<>nil then MotCambPromotor.Free;
  If PsiEvaluacion<>nil then PsiEvaluacion.Free; PsiEvaluacion:=nil;


  inherited;
end;//Desctructor


Procedure TContrato.DataBaseChange;
Begin
  inherited;
  ConfigCaptura.GetParams(Self);

end;


function TContrato.GetCampo(FieldName:String):String;
begin
  if FieldName='DESC_GPO_CONTRAT' then
    Result:=GRUPO.DESC_GPO_CONTRAT.AsString
  else if FieldName='DESC_SEGMENTO' then
    Result:=SEGMENTO.DESC_SEGMENTO.AsString
  else Result:=Inherited GetCampo(FieldName);
end;


Function TContrato.Localiza:Boolean;
begin
  SEGU_CHECAR.AsString:='V';
  SEGU_ID_EMPRESA.AsString:= DameEmpresa;
  SEGU_CVE_USUARIO.AsString:= DameUsuario;
  Result:= Inherited Localiza;
end;


Function TContrato.EsClienteAAA : boolean;
var Stp: TStoredProc;
begin
  Result := FALSE;
  STP := TStoredProc.Create(Self);
  Try
    with STP do
    begin
      Params.Clear;
      StoredProcName := 'STPVERIFICACTEAAA';
      DatabaseName   := Apli.DataBaseName;
      SessionName    := Apli.SessionName;
      Params.CreateParam(ftInteger,'PIDENTIFICADOR',ptInput);
      Params.CreateParam(ftString,'PTIPOIDENTIFICADOR',ptInput);
      Params.CreateParam(ftString,'PESCTEAAA', ptOutput);
      Params.ParamByName('PIDENTIFICADOR').AsInteger    := ID_CONTRATO.AsInteger;
      Params.ParamByName('PTIPOIDENTIFICADOR').AsString := 'C';

      ExecProc;

      Result:= (trim(Params.ParamByName('PESCTEAAA').AsString) = 'V');
      Close;
    end;
  Finally
    If Stp <> nil Then Stp.Free; Stp:= nil;
  end;
end;


Function TContrato.InternalPost:Boolean;
begin
  Result:= Inherited InternalPost;
  Try
    if (Result) and (modo = moAppend) and (Id_Empresa.AsInteger = 5) then
    begin
       RunSQL('INSERT INTO Doc_Contrato(ID_CONTRATO,CVE_DOCUMENTO,DOCUMENTO_NA)'+
	      '	VALUES ( '+ID_Contrato.asString + ',''D154'',''V'')', DataBaseName, SessionName,False);
    end;

    if (Result) and (modo = moAppend) then
       if (trim(Cve_Tip_Contrato.AsString) = 'INET') then
          RunSQL(' INSERT INTO NET_CONTRATO(ID_CONTRATO, CVE_USUARIO, NOMBRE, SIT_CONTRATO, ID_EMPRESA, REC_PASSWORD)'+  // CZR 06-ago-2010   Replicar la Cve_Usuario en Rec_Password
                 ' VALUES (' + ID_Contrato.asString + ', ''' + trim(Cve_Usuario.AsString) + ''', ''' + Titular.Nombre.AsString + ''', ''AC'', ' + Id_Empresa.AsString + ', ''' + trim(Cve_Usuario.AsString) + ''')',
                 ApNet.DataBaseName, ApNet.SessionName, False);

    if (Result) and (modo = moAppend) and (Id_Empresa.AsInteger = 1) then
    	//Da de alta el documento del contrato  D160 Reimpresion de Contrato
       RunSQL('INSERT INTO Doc_Contrato(ID_CONTRATO,CVE_DOCUMENTO,DOCUMENTO_NA)'+
              ' VALUES ( '+ID_Contrato.asString+',''D160'',''V'')',DataBaseName, SessionName,False);
  Except
  end;
end;


Function TContrato.InternalEdit:Boolean;
var S:String;
begin
  if GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(ClassName)+''') AND (CVE_USUARIO='''+DameUsuario+''') and (CVE_OPER_ACC=''MM'')',
            SeguDataBaseName,SeguSessionName,True) then
  begin
     if Trunc(F_Alta.AsDateTime)<>Trunc(Apli.SysDateTime) then
        Raise EInterFrame.Create('Este Contrato fue Creado otro Dia. No tiene Derecho para Modificarlo, Solo el Mismo día de Creación. Verifique con su Administrador');
  end;
  Result:= Inherited InternalEdit;
  vlSituacion:= UpperCase(Trim(SIT_CONTRATO.AsString));
end;


Function TContrato.InternalAppend:Boolean;
begin
  Result:= Inherited InternalAppend;
  vlSituacion:= UpperCase(Trim(SIT_CONTRATO.AsString));
end;

// CZR 03-oct-2013
procedure TContrato.Visibilidad_NivelRiesgo(pVisible : Boolean; pObtNivelRiesgo : Boolean);
var
   vVisible : Boolean;
begin
   if (plNivelRiesgo <> nil) and (pEdNivelRiesgo <> nil) then
   begin
      pEdNivelRiesgo.Clear;
      vVisible := pVisible;
      //------------------------------------------------------------------------
      if Active then
         if pObtNivelRiesgo then // Obtener Nivel de Riesgo del Contrato
         begin
            pEdNivelRiesgo.Text := trim(NivelRiesgoCto(Self, ID_Contrato.AsInteger, cDescripcion));
            vVisible            := (trim(pEdNivelRiesgo.Text) <> '');
            if pos('ALTO', pEdNivelRiesgo.Text) = 0 then
               pEdNivelRiesgo.Color := clLime
            else
               pEdNivelRiesgo.Color := clRed;
         end;
      //------------------------------------------------------------------------
      pEdNivelRiesgo.Visible := vVisible;
      plNivelRiesgo.Visible  := vVisible;
   end;
end;

procedure TContrato.InternalDespuesLocaliza(Sender:TObject);
var
   vlQueryCmd : Tquery;
   strSql     : String;
begin
   if Active then
   begin
      if Producto.Active then
      begin
         if Producto.Cve_Per_Jur_Prod.AsString='PF' then
         begin
            Titular.FilterBy   := fbTMPersonaFisica;
            Prospecto.FilterBy := fbTMProspectoFisica; // CZR 26-feb-09
         end
         else
         begin
            Titular.FilterBy   := fbTMPersonaMoral;
            Prospecto.FilterBy := fbTMProspectoMoral; // CZR 26-feb-09
         end;
      end;
      ObtenerSituacionKYC; // CZR 03-may-2013

     //Busqueda de correos electronicos JHMM
    //Procedo a buscarlo en la bd de correos
      strSql := '';
      strSql := strSql + 'select Correo,clave_Correo Pass from cto_email_edc where id_contrato =  '+ SELF.ID_Contrato.AsString+' and id_producto = 0';

      vlQueryCmd              := TQuery.Create(Nil);
      vlQueryCmd.SessionName  := Apli.SessionName;
      vlQueryCmd.DatabaseName := Apli.DataBaseName;
      vlQueryCmd.SQL.Clear;
      vlQueryCmd.Close;
      vlQueryCmd.SQL.Add(strSql);
      vlQueryCmd.open   ;

      if not vlQueryCmd.IsEmpty then
         begin
           cvecorreo := vlQueryCmd.FieldByName('Correo').AsString;
           pass      := vlQueryCmd.FieldByName('Pass').AsString;
           if cvecorreo = '' Then email.asString:='F'
           else
             Begin
              email.asString:='V';
              //email.enabled :=true;
             end;
         end
      else
       begin
         cvecorreo :=  '' ;
         pass :='';
         email.asString:='F';
       end;
      //JHMM

      Visibilidad_NivelRiesgo(False, True); // CZR 03-oct-2013
      if pBAcuseRecibo <> nil then // CZR 17-feb-2015
         pBAcuseRecibo.Enabled := (trim(Sit_Contrato.AsString) = cCancelado);
   end;
end;

procedure TContrato.RefrescaPrefijo;
begin
  if Active then begin
     if EditPrefijo<>nil then begin
        EditPrefijo.Text:=Producto.TipoContrato.Id_Prefijo_contr.AsString;
        if EditIdContrato<>nil then begin
           EditIdContrato.Text:=Copy(Id_Contrato.AsString,Length(Trim(EditPrefijo.Text))+1,12);
        end;//if
     end;//if
  end;//if
end;//procedure

procedure TContrato.LocalizaCurrent;
begin
  Inherited;
  RefrescaPRefijo;
  DESC_MONEDA.AsString:=MONEDA.Desc_Moneda.AsString;
  DESC_PRODUCTO.AsString:=PRODUCTO.Desc_Producto.AsString;
  IniciaConfigContrato;
end;

procedure TContrato.OnTitularDespuesBusca(Sender:TObject);
var qCtoLiq: TQuery;
begin
  if (Modo = moEdit) or (modo = moAppend) then
  begin
     if (Titular.Persona <> nil) and
        (Titular.MasterSourceEditControl <> nil) and
        (Titular.MasterSourceEditControl.Enabled = True) then
     begin
        Domicilio.FindKey([Titular.Persona.FieldByName('ID_DOMICILIO').AsString]);
        GetFromControl;
{RAPA
        if(Trim(Id_Cto_Liq.AsString)='')and((Trim(Producto.Cve_Tip_Contrato.AsString)='INPA')or
          (Trim(Producto.Cve_Tip_Contrato.AsString)='INIF')or(Trim(Producto.Cve_Tip_Contrato.AsString)='BPAG'))then begin
           Q1:=GetSqlQuery('SELECT ID_CONTRATO FROM CONTRATO WHERE ((CONTRATO.CVE_TIP_CONTRATO=''CDVI'') '+
                           ' or (CONTRATO.CVE_TIP_CONTRATO=''IDVI'') or (CONTRATO.CVE_TIP_CONTRATO=''BDVI'')) AND '+
                           ' (CONTRATO.ID_TITULAR='+Titular.Persona.FieldByName('ID_PERSONA').AsSql+')',DataBaseName,SessionName,False);
}

        { Obtiene un contrato de liquidación default para los contratos que lo requieran }
        if (Trim(Id_Cto_Liq.AsString) = '') and
           (ConfigCaptura.B_Val_Cto_Liq.AsString = 'V') Then
        Begin
          qCtoLiq:= GetSqlQuery(' SELECT Id_Contrato ' +
                                ' FROM Contrato, Cto_Config_Prod ' +
                                ' WHERE Contrato.Id_Empresa = Cto_Config_Prod.Id_Empresa ' +
                                '   AND Contrato.Cve_Producto = Cto_Config_Prod.Cve_Producto ' +
                                '   AND Cto_Config_Prod.B_Cto_Liq = ''V'' ' +
                                '   AND Contrato.Id_Titular = ' + Titular.Persona.FieldByName('ID_PERSONA').AsSql,
                        DataBaseName, SessionName, False);
          Try
            if qCtoLiq <> nil then Id_Cto_Liq.AsString:= qCtoLiq.FieldbyName('ID_CONTRATO').AsString;
          Finally
            qCtoLiq.Free;
	        end;
        end;

     end;
  end;
end;

procedure TContrato.OnProductoDespuesBusca(Sender:TObject);
var
  Query1:TQuery;
begin
  if (Modo = moEdit) or (modo = moAppend) then
  begin
     if Producto.Active then
     begin
          Cve_Tip_Contrato.AsString:= Producto.TipoContrato.Cve_Tip_Contrato.AsString;
          Query1:= GetSQLQuery('SELECT * FROM PROD_AUT_EMPRESA WHERE CVE_PRODUCTO = '''+Producto.Cve_Producto.AsString+'''',
          DataBaseName,SessionName,False);
        Try
          if(Query1<>nil)and(Not Query1.IsEmpty) then
             Empresa.FindKey([Query1.FieldByName('ID_EMPRESA').AsString])
          else Empresa.Active:= False;
        Finally
          if Query1<>nil then Query1.Free; Query1:= nil;
        end;

        if Moneda.FindKey([Producto.Cve_Moneda.AsString]) then
           Cve_Moneda.AsString:= Producto.Cve_Moneda.AsString;

        if Active then
        begin
          if Producto.Active then
          begin
            if Producto.Cve_Per_Jur_Prod.AsString= 'PF' then
            begin
              Titular.FilterBy   := fbTMPersonaFisica;
              Prospecto.FilterBy := fbTMProspectoFisica; // CZR 26-feb-2009
            end
            else
            begin
              Titular.FilterBy   := fbTMPersonaMoral;
              Prospecto.FilterBy := fbTMProspectoMoral;  // CZR 26-feb-2009
            end;
          end;//if

          Titular.Active:=False;
          Domicilio.Active:=False;
          ID_Titular.AsString:='';
          Id_Domicilio.AsString:='';

          // CZR 03-mar-2009   Limpia Datos de Prospecto
          Prospecto.Active      := False;
          ID_Prospecto.AsString := '';
          ID_Prospecto.GetFromControl;

          if (EditPrefijo <> nil) then
             EditPrefijo.Text:=Producto.TipoContrato.Id_Prefijo_contr.AsString;

          if (modo = moAppend) and (EditIdContrato <> nil) then
          begin
              if Producto.TipoContrato.Folio_Contrato.AsInteger = -1 then
              begin
                EditIdContrato.Text:= '';
                EditIdContrato.ReadOnly:= False;
                EditIdContrato.Color:= clWindow;
              end
              else
              begin
                 EditIdContrato.Text:= IntToStr(Producto.TipoContrato.Folio_Contrato.AsInteger + 1);
                 EditIdContrato.ReadOnly:= True;
                 EditIdContrato.Color:= clBtnFace;
              end;
          end;
        end;
     end
     else
     begin
        Moneda.Active:=False;
        Empresa.Active:=False;
        Titular.Active:=False;
        Domicilio.Active:=False;
     end;

{RAPA
     if Assigned(FOnCambioContrato) then FOnCambioContrato(Self);
}

     // Modifica la configuración de captura del contrato
     IniciaConfigContrato;
  end;
end;

function TContrato.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWContrato;
begin
   W := TWContrato.Create(Self);
   try
      W.objeto                      := Self;
      W.InterForma1.InterFrame      := Self;
      if SeguCto then     W.Caption := 'Contrato.'
      else                W.Caption := 'Contrato';
      W.InterForma1.FormaTipo       := FormaTipo;     
      W.InterForma1.ShowGrid        := False;
      W.InterForma1.ShowNavigator   := False;
      W.InterForma1.Funcion         := FInterFun;
      W.InterForma1.ShowBtnEliminar := False;
      W.InterForma1.ShowBtnAyuda    := False;
      // CZR 06-mar-2013   (PLD) Configuracion Inicial
      pTabInfoKYC    := W.tabInfoKYC;
      pcbSitKYC      := W.cbSitKYC;
      CargarSituacionKYC;
      ObtenerSituacionKYC;
      // CZR 03-oct-2013
      plNivelRiesgo  := W.lNivelRiesgo;
      pEdNivelRiesgo := W.edNivelRiesgo;
      Visibilidad_NivelRiesgo(False, True);
      // CZR 17-feb-2015
      pBAcuseRecibo  := W.bbAcuseRecibo;

      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;//function

function TContrato.InternalLocaliza:Boolean;
var
  Nom, CveUsuarioINET:String;
  OK : Boolean;
begin
  if(ID_Contrato.AsString <> '')and(ApNet <> nil)then begin
     CveUsuarioINET := '';
     if GetSqlStr('Select Cve_Usuario from Net_Contrato Where Id_contrato = '+ ID_Contrato.AsString,
     	ApNet.DataBaseName, ApNet.SessionName, 'CVE_USUARIO', CveUsuarioINET, False) then
     begin
        Cve_Usuario.asString := CveUsuarioINET;
        Cve_Usuario.DrawControl;
     end;//if
  end//if
  else
    Cve_Usuario.asString := '';
  InternalLocaliza:=Inherited InternalLocaliza;
end;//function

function GetCtoHavingStr(Frame:TInterFrame; TablaCto:String; Var ExtraCampos:String):String;
var
  Q1:TQuery;
begin
  Result:='';
  Q1 := GetSQLQuery('SELECT B_EMPRESA,B_CONTRATO,B_UNID_NEG,B_USR_USR,USUARIO.ID_PERSONA, USUARIO.ID_EMPRESA, EMPLEADO.ID_EMPRESA AS EMPRESA_EMPLEADO,EMPLEADO.ID_ENTIDAD, USUARIO.CVE_TIPO_USUARIO FROM USUARIO,EMPLEADO WHERE (USUARIO.CVE_USUARIO='''+Frame.DameUsuario+''') and (Empleado.Id_Persona=Usuario.Id_Persona)',
                    Frame.DataBaseName,Frame.SessionName,True);
  if Q1=nil then begin
     Raise EInterFrame.Create('Posiblemente el Usuario y el Empleado tiene Id_Personas Diferentes o no Existe el Usuario');
     Exit;
  end;//if
  ExtraCampos:=','+TablaCto+'.ID_ENTIDAD'+','+TablaCto+'.ID_EMPRESA'+','+TablaCto+'.B_RESTRINGIDO'+
               ','+TablaCto+'.ID_PERS_ASOCIAD'+','+TablaCto+'.CVE_SEGMENTO'+','+TablaCto+'.ID_GRUPO';
  Try
    Result := '(PKG_ACCECONTRATO.TIENEACCESO('''+Frame.DameUsuario+''','+TablaCto+'.ID_CONTRATO,'+Frame.DameEmpresa+
              ','+TablaCto+'.ID_ENTIDAD,'+TablaCto+'.ID_EMPRESA,'+TablaCto+'.B_RESTRINGIDO,'+TablaCto+'.ID_PERS_ASOCIAD'+
              ','+TablaCto+'.CVE_SEGMENTO,'+TablaCto+'.ID_GRUPO,'''+Q1.FieldByName('CVE_TIPO_USUARIO').AsString+''''+
              ','''+Q1.FieldByName('B_EMPRESA').AsString+''','''+Q1.FieldByName('B_CONTRATO').AsString+''''+
              ','''+Q1.FieldByName('B_UNID_NEG').AsString+''','''+Q1.FieldByName('B_USR_USR').AsString+''''+
              ','+Q1.FieldByName('ID_PERSONA').AsString+','+Q1.FieldByName('ID_EMPRESA').AsString+
              ','+Q1.FieldByName('EMPRESA_EMPLEADO').AsString+','+Q1.FieldByName('ID_ENTIDAD').AsString+')=1)';
  Finally
    Q1.Free;
  end;//Try & Finally
end;//function

function TContrato.InternalBusca:Boolean;
Var
  T:TInterFindit;
  s:String;
  Q1:TQuery;
begin
  InternalBusca := False;
  T:=CreaBuscador('IntCtto.it','S,S');
  S:=T.WhereString;
  if SeguCto then begin
     Q1:=GetSQLQuery('SELECT B_EMPRESA,B_CONTRATO,B_UNID_NEG,B_USR_USR,USUARIO.ID_PERSONA, USUARIO.ID_EMPRESA, EMPLEADO.ID_EMPRESA AS EMPRESA_EMPLEADO,EMPLEADO.ID_ENTIDAD, USUARIO.CVE_TIPO_USUARIO FROM USUARIO,EMPLEADO WHERE (USUARIO.CVE_USUARIO='''+
                     DameUsuario+''') and (Empleado.Id_Persona=Usuario.Id_Persona)',DataBaseName,SessionName,True);
     if Q1=nil then begin
        Raise EInterFrame.Create('Posiblemente el Usuario y el Empleado tiene Id_Personas Diferentes o no Existe el Usuario');
        Exit;
     end;//if
     Try
       T.GroupQuery := True;
       T.HavingString := '(PKG_ACCECONTRATO.TIENEACCESO('''+DameUsuario+''',ID_CONTRATO,'+DameEmpresa+
                         ',ID_ENTIDAD,ID_EMPRESA,B_RESTRINGIDO,ID_PERS_ASOCIAD,CVE_SEGMENTO,ID_GRUPO'+
                         ','''+Q1.FieldByName('CVE_TIPO_USUARIO').AsString+''','''+Q1.FieldByName('B_EMPRESA').AsString+''''+
                         ','''+Q1.FieldByName('B_CONTRATO').AsString+''','''+Q1.FieldByName('B_UNID_NEG').AsString+''''+
                         ','''+Q1.FieldByName('B_USR_USR').AsString+''','+Q1.FieldByName('ID_PERSONA').AsString+
                         ','+Q1.FieldByName('ID_EMPRESA').AsString+','+Q1.FieldByName('EMPRESA_EMPLEADO').AsString+
                         ','+Q1.FieldByName('ID_ENTIDAD').AsString+')=1)';
     Finally
       Q1.Free;
     end;//Try & Finally
  end;//if
  T.WhereString:=S;
  T.CamposResultado:='';
  try
    if Active then
       T.Param(0,ID_Contrato.AsString);
    if T.Execute then begin
       vgValEnvEdoCta := False; // CZR 16-may-2013
       InternalBusca:=FindKey([T.DameCampo(0)]);
       vgValEnvEdoCta := True; // CZR 16-may-2013
       vg_Perfil      := -9999;                                                //rohs4279 nov/2015 req.PMO150817
       vg_subserv     := Emptystr;                                             //rohs4279 nov/2015 req.PMO150817
       if Sit_Contrato.AsString = 'AC' then Begin                              //rohs4279 nov/2015 req.PMO150817
         vg_Perfil  := PsiMaxPerfil.ID_TIPO_PERFIL.AsInteger;
         vg_subserv := TipoServicio.CVE_TIP_CTE.AsString;
       end;
    end;//if
  finally
    T.Free;
  end; {end-try}
  InternalBusca := True;
end;//function

function TContrato.Reporte:Boolean;
begin
  if Active then
     Execute_RepCtto(True, Self, Id_contrato.AsInteger)
  else
     Raise EInterFrame.create('No hay un contrato activo para reportar');
end;//function

function TContrato.InternalCancel:Boolean;
begin
  if EditIdContrato <> nil then EditIdContrato.Clear;
  if EditPrefijo <> nil then EditPrefijo.Clear;
  InternalCancel:= Inherited InternalCancel;
end;//function

function TContrato.InternalDelete:Boolean;
begin
  if EditIdContrato <> nil then EditIdContrato.Clear;
  if EditPrefijo <> nil then EditPrefijo.Clear;
  InternalDelete:= Inherited InternalDelete;
end;//function

function TContrato.ValidaLocaliza:Boolean;
begin
  ValidaLocaliza:=(FieldByName(FStpRespuesta).AsInteger = 0);
end;//function


Function TContrato.AsignaProspecto(pNuevoContrato: Real): Boolean;
var stpProspecto: TStoredProc;
begin
  If Active and ConfigCaptura.Active Then
  Begin
{RAPA.
    If (Cve_Tip_Contrato.AsString = 'PRCB') OR
       (Cve_Tip_Contrato.AsString = 'PRBC') OR
       (Cve_Tip_Contrato.AsString = 'PROF') OR
       (Cve_Tip_Contrato.AsString = 'PRMD') THEN
}
    If ConfigCaptura.B_Prospecto.AsString = 'V' Then
    Begin
      stpProspecto:= TStoredProc.Create(nil);
      Try
        With stpProspecto do
        Begin
          DatabaseName:= Self.DataBaseName;
          SessionName:= Self.SessionName;
          StoredProcName:= 'PKGCORPORATIVO.CREACTOPROSPECTO';

          Params.CreateParam(ftFloat,   'PIDPROSPECTO', ptInput);
          Params.CreateParam(ftFloat,   'PIDCONTRATO',  ptInput);
          Params.CreateParam(ftInteger, 'PRESULTADO',   ptOutput);

          ParamByName('PIDPROSPECTO').AsFloat:= ID_Contrato.AsFloat;
          ParamByName('PIDCONTRATO').AsFloat:=  pNuevoContrato;

          Prepare;
          ExecProc;
        end;

        Self.FindKey([pNuevoContrato]);
      Finally
        stpProspecto.Free;
      End;
    end
    else messagedlg('El Contrato no puede asignarse debido a que no es un Contrato de Prospectos', mtInformation, [mbOK], 0);
  end
  else messagedlg('No existe un Contrato activo para Asignar', mtInformation, [mbOK], 0);
end;

Function TContrato.EliminaProspecto: Boolean;
var stpProspecto: TStoredProc;
begin
  If Active and ConfigCaptura.Active Then
  Begin
{RAPA.
    If (Cve_Tip_Contrato.AsString = 'PRCB') OR
       (Cve_Tip_Contrato.AsString = 'PRBC') OR
       (Cve_Tip_Contrato.AsString = 'PROF') OR
       (Cve_Tip_Contrato.AsString = 'PRMD') THEN
}
    If ConfigCaptura.B_Prospecto.AsString = 'V' Then
    Begin
      stpProspecto:= TStoredProc.Create(nil);
      Try
        With stpProspecto do
        Begin
          DatabaseName:= Self.DataBaseName;
          SessionName:= Self.SessionName;
          StoredProcName:= 'PKGCORPORATIVO.ELIMINAPROSPECTO';

          Params.CreateParam(ftFloat,  'PIDPROSPECTO', ptInput);
          Params.CreateParam(ftString, 'PCVEUSUARIO',  ptInput);
          Params.CreateParam(ftInteger,'PRESULTADO',   ptOutput);

          ParamByName('PIDPROSPECTO').AsFloat:= ID_Contrato.AsFloat;
          ParamByName('PCVEUSUARIO').AsString:= Apli.Usuario;

          Prepare;
          ExecProc;
        end;

        Self.Active:= False;
      Finally
        stpProspecto.Free;
      End;
    end
    else messagedlg('El Contrato no puede asignarse debido a que no es un Contrato de Prospectos', mtInformation, [mbOK], 0);
  end
  else messagedlg('No existe un Contrato de Prospecto activo para Eliminar', mtInformation, [mbOK], 0);
end;

// < Inicia Modificación por SATV el 18Sep2006 >
function TContrato.StpTieneCtosBlqAut( peID_TITULAR           : Integer;
                                       peDataBaseName         ,
                                       peSessionName          : String;
                                       var psTOTAL_CTOS_BLOQ  : Integer;
                                       var psRESULTADO        : Integer;
                                       var psTX_RESULTADO     : String
                                      ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := True;
  psTOTAL_CTOS_BLOQ := -1;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGADMCTA.STP_TIENE_CTOS_BLQAUT';
       DataBaseName   := peDataBaseName;
       SessionName    := peSessionName;
       Params.CreateParam(ftInteger ,'peID_TITULAR'     , ptInput);
       Params.CreateParam(ftInteger ,'psTOTAL_CTOS_BLOQ', ptOutput);
       Params.CreateParam(ftInteger ,'psRESULTADO'      , ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO'   , ptOutput);
       // Asigna Valores
       ParamByName('peID_TITULAR').AsInteger  := peID_TITULAR;
       ExecProc;
       // Asigna Valores de Salida
       psRESULTADO    := ParamByName('psRESULTADO').AsInteger;
       psTX_RESULTADO := ParamByName('psTX_RESULTADO').AsString;

       vlbResult := (ParamByName('psRESULTADO').AsInteger = 0);
       If Not vlbResult Then
          MessageDlg(ParamByName('psTX_RESULTADO').AsString, mtError, [mbOk], 0)
       Else
         Begin
         psTOTAL_CTOS_BLOQ  := ParamByName('psTOTAL_CTOS_BLOQ').AsInteger;
         End;
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
End;
// < Termina Modificación por SATV >

Procedure TContrato.IniciaConfigContrato;
Begin
  Try
    Try
      ConfigCaptura.Active:= False;

      If Active and Producto.Active then
        ConfigCaptura.FindKey([Id_Empresa.AsString, Cve_Producto.AsString]);
    Except
      ConfigCaptura.Active:= False;
    end;

    Try
      { Asigna valores por default en caso de apertura de contrato }
      If (Modo = moAppend) then
      Begin
        If (ConfigCaptura.Active) Then
        Begin
          with ConfigCaptura do
          Begin
            If (Not Id_Pers_Asociad.IsNull) and (Not Id_Grupo.IsNull) Then
              Self.Grupo.FindKey([Id_Pers_Asociad.asString, Id_Grupo.asString]);

            If (Not Id_Entidad.IsNull) Then
              Self.UnNegocio.FindKey([Id_Entidad.asString]);

            If (Not Cve_Segmento.IsNull) Then
              Self.Segmento.FindKey([Cve_Segmento.asString]);

            If (Not Cve_Concepto.IsNull) Then
              Self.Concepto.FindKey([Cve_Concepto.asString]);

            If (Not Cve_Tipo_Cta.IsNull) Then
              Self.Cve_Tipo_Cta.AsString:= Cve_Tipo_Cta.AsString;

            If (Not Cve_Corresp.IsNull) Then
              Self.Cve_Corresp.AsString:= Cve_Corresp.AsString;

            If (Not Sit_Contrato.IsNull) Then
              Self.Sit_Contrato.AsString:= Sit_Contrato.AsString;
          end;
        end
        else
        Begin
          Self.Grupo.Active:= False;
          Self.UnNegocio.Active:= False;
          Self.Segmento.Active:= False;
          Self.Concepto.Active:= False;
          Self.Cve_Tipo_Cta.FieldsClear;
          Self.Cve_Corresp.FieldsClear;
          Self.Sit_Contrato.FieldsClear;
        end;
      end;
    Except
      {No se inicializaron los valores por default... no se requiere realizar ninguna accion }
    end;
  Finally
    if Assigned(FOnCambioContrato) then FOnCambioContrato(Self);
  end;
end;

// CZR 06-mar-2009     Visibilidad de campos de Prospecto
procedure TWContrato.Visibilidad_Prospecto(pVisible : Boolean);
begin
   if pVisible then
   begin
      Label57.Visible        := True;
      edldProspecto.Visible  := True;
      sbProspecto.Visible    := True;
      edNombreTitular.Width  := 286;
   end
   else
   begin
      Label57.Visible       := False;
      edldProspecto.Visible := False;
      sbProspecto.Visible   := False;
      edNombreTitular.Width := 427;
   end;
end;

(*******************************************************************************
 Forma de contratos
*******************************************************************************)
procedure TWContrato.FormShow(Sender: TObject);
var
  vPerModSitKYC : Boolean; // CZR 03-abr-2013
  vHabLimpProsp : Integer;
begin
   with Objeto do
   begin
      OnCambioContrato                                := CambioContrato;
      ID_Contrato.Control                             := edContrato;
      EditPrefijo                                     := edPrefijo;
      EditIdContrato                                  := EdIdContrato;
      ID_Domicilio.Control                            := edIDDomicilio;
      ID_Titular.Control                              := edIDTitular;
      ID_Prospecto.Control                            := edldProspecto; // CZR 25-feb-2009
      Nomb_Contrato.Control                           := edNombreContrato;
      Sit_Documentos.Control                          := rgSitDocumentos;

      Cve_Corresp.Control                             := cbCorrespondencia;
      B_Asig_Seg_Aut.Control                          := chkSegmentoAut;
      Sit_Contrato.Control                            := rgSituacion;
      Id_Cto_Liq.Control                              := edContratoLiq;
      F_Alta.Control                                  := edFAlta;
      F_Baja.Control                                  := edFBaja;
      FH_Modificacion.Control                         := edFHModificacion;
      Cve_Usuar_Modif.Control                         := edCveUsuarModif;
      B_Impreso.Control                               := chImpreso;
      TX_COMENTARIO.Control                           := edTxComentario;
      Cve_Tipo_Cta.Control                            := cbTipoCuenta;
      CVE_TIPO_FIDE.Control                           := cbCveTipoFide;
      ID_CONTRA_DV.Control                            := edIdContraDv;
      ID_CONTRA_IB.Control                            := edIdContraIB;
      SDO_PATRIMONIO.Control                          := edSdoPatrimonio;
      B_ASESOR_INV.Control                            := chbB_ASESOR_INV;
      B_SOL_ILINE.Control                             := chkSolAccesoILine;
      F_Reactivacion.Control                          := edReact;
      Titular.Nombre.Control                          := edNombreTitular;
      Titular.MasterSourceEditControl                 := sbTitular;
      Domicilio.CalleNumero.Control                   := edCalleNumero;
      edCalleNumero.PopupMenu                         := Domicilio.PopMenu;
      Domicilio.MasterSourceEditControl               := sbDomicilio;
      Empresa.Nombre.Control                          := edNombreEmpresa;
      Empresa.MasterSourceEditControl                 := sbEmpresa;
      edNombreEmpresa.PopupMenu                       := Empresa.PopMenu;
      Moneda.MasterSourceEditControl                  := SpeedButton8;
      edMoneda.PopupMenu                              := Moneda.PopMenu;
      Grupo.Desc_Gpo_Contrat.Control                  := edGrupo;
      Grupo.PromAsociado.Nombre.Control               := edNombrePromotor;
      Grupo.MasterSourceEditControl                   := btPromotor;
      edGrupo.PopupMenu                               := PopupMenuGpoCto;
      edNombrePromotor.PopupMenu                      := PopupMenuGpoCto;
      Producto.Desc_Producto.Control                  := edDescProducto;
      edDescProducto.PopupMenu                        := Producto.PopMenu;
      edTipoContrato.PopupMenu                        := Producto.PopMenu;
      Producto.MasterSourceEditControl                := sbProducto;
      Producto.TipoContrato.Desc_Tipo_Contra.Control  := edTipoContrato;
      UnNegocio.Desc_Entidad.Control                  := edUnNegocio;
      UnNegocio.MasterSourceEditControl               := btUnNegocio;
      edUnNegocio.PopupMenu                           := UnNegocio.PopMenu;
      Segmento.Desc_Segmento.Control                  := edSegmento;
      Segmento.MasterSourceEditControl                := btSegmento;
      edSegmento.PopupMenu                            := Segmento.PopMenu;
      email.Control                                   := cbEDC;
      CVE_ACTIV_CTO.Control                           := edCve_Activ_Cto;
      Actividad.Cve_Activ_SITI.Control                := edCveSITI;
      Actividad.ActividadSITI.DESC_ACTIV_ECON.Control := edDescSITI;
      Actividad.TipoCliente.CveSeccion.Control        := edCveTipoCliente;
      Actividad.TipoCliente.DESC_ACTIVIDAD.Control    := edTipoCliente;
      Actividad.Residencia.CveSeccion.Control         := edCveResidencia;
      Actividad.Residencia.DESC_ACTIVIDAD.Control     := edResidencia;
      Actividad.TipoSector.CveSeccion.Control         := edCveTipoSector;
      Actividad.TipoSector.DESC_ACTIVIDAD.Control     := edTipoSector;
      Actividad.Sector.CveSeccion.Control             := edCveSector;
      Actividad.Sector.DESC_ACTIVIDAD.Control         := edSector;
      Actividad.SubSector.CveSeccion.Control          := edCveSubSector;
      Actividad.SubSector.DESC_ACTIVIDAD.Control      := edSubSector;
      Actividad.Rama.CveSeccion.Control               := edCveRama;
      Actividad.Rama.DESC_ACTIVIDAD.Control           := edRama;
      Actividad.SubRama.CveSeccion.Control            := edCveSubRama;
      Actividad.SubRama.DESC_ACTIVIDAD.Control        := edSubRama;
      Actividad.Inciso.CveSeccion.Control             := edCveInciso;
      Actividad.Inciso.DESC_ACTIVIDAD.Control         := edInciso;
      CIBCSEgmento.Desc_Segmento.Control              := edCveSegObjetivo;
      CIBCSEgmento.MasterSourceEditControl            := btCveSegObjetivo;
      Moneda.Desc_Moneda.Control                      := edMoneda;
      CVE_REGIMEN.Control                             := cbCveRegimen;
      COMB_FIRMAS.Control                             := edCombFirmas;
      CVE_DISCRECIONAL.Control                        := cbCVEDISCRECIONAL;
      F_INI_PZO_OBJ.Control                           := edFINIPZOOBJ;
      PLAZO_OBJETIVO.Control                          := edPLAZOOBJETIVO;
      SDO_POS_LIQUIDA.Control                         := edSDOPOSLIQUIDA;
      Concepto.MasterSourceEditControl                := btConcepto;
      Concepto.FieldByName('DESC_CONCEPTO').Control   := edDescConcepto;
      edDescConcepto.PopupMenu                        := Concepto.PopMenu;
      CambioContrato(nil);
      PostMessage(Handle,WM_DESPUESSHOW,0,0);
      RefrescaPrefijo;
      Cve_Usuario.Control                             := edCveUsuario;
      F_Expiracion.Control                            := edFExpiracion;
      F_Primer_Envio.Control                          := edFPrimerEnvio;
      Num_Envios.Control                              := edNumEnvios;
      Tot_Enviados.Control                            := edTotEnviados;
      Cve_Tip_Suscr.Control                           := rgCveTipSuscr;
      Motivo := TMotIna.Create(Self);
      Motivo.GetParams(Objeto);

      // MARA4356 dic 2006   Nuevo producto de cheques
      B_SOBREGIRO.Control                             := rgB_SOBREGIRO;
      ID_CTO_PRLV.Control                             := edID_CTO_PRLV;
      ID_CTO_FDOS.Control                             := edID_CTO_FDOS;
      F_ANIVERSARIO.Control                           := edF_ANIVERSARIO;
      CVE_TP_COMISION.Control                         := rgCVE_TP_COMISION;

      B_Ilocalizable.Control                          := chIlocalizable; // CZR 29-ene-2009
      Visibilidad_Prospecto(False);                                      // CZR 05-mar-2009
      B_ICreaIFS.Control                              := chkCreaIFS ;    // SACA4984

      {-- Checks para Atributos de Ctto [SACA4984 Septiembre 2013]--}
      B_CteInstitucional.Control    := chkCI;
      B_CteSofisticado.Control      := chkCLISOF;
      B_CteCalificado.Control       := chkCLIECA;
      B_Elegible.Control            := chkELE;


      
      Servicio.MasterSourceEditControl                  := sbServicioFin;
      TipoServicio.MasterSourceEditControl              := sbTipCte;
      Servicio.CVE_SERVICIO_FIN.Control                 := edCveServicioFin;
      Servicio.DESC_SERVICIO_FIN.Control                := edDescServicioFin;
      TipoServicio.CVE_TIP_CTE.Control                  := edCveTipCte;
      tipoServicio.DESC_TIP_CTE.Control                 := edDescTipCte;

      PsiEvaluacion.MasterSourceEditControl             := sbPsiEvalua;
      PsiEvaluacion.ID_EVALUACION.Control               := edIdEvaluacion;

      PsiMaxPerfil.MasterSourceEditControl              := sbMaxPerfil;
      PsiMaxPerfil.ID_TIPO_PERFIL.Control               := edIdTipoPerfil;
      PsiMaxPerfil.DESC_TIPO_PERFIL.Control             := edDescTipoPerfil;

      MotCambPromotor.CVE_GPO_MOTIVO.Control            := edCveGpoMotivo;
      MotCambPromotor.CVE_MOTIVO.Control                := edCveMotivoProm;
      MotCambPromotor.DESC_MOTIVO.Control               := edMotivoProm;

      sitCambio := false;
      cambProm  := false;

      Empresa.OnAfterLocaliza                         := OnAfterLocalizaEmpresa;
      GetSQLInt('SELECT COUNT(1) AS NUM FROM DV_PARAM WHERE CVE_GRUPO = ''ACCESO'' AND CVE_PARAM = ''PROSCORP'' AND SECUENCIA = 1 '+
                ' AND SIT_PARAMETRO = ''AC'' ', Objeto.DataBaseName, Objeto.SessionName, 'NUM', vHabLimpProsp, False);
      if vHabLimpProsp > 0 then
         edldProspecto.PopupMenu := PopUpProspecto;

      // CZR 03-abr-2013   Valida si el usuario tiene permiso para Modificar la Situacion KYC
      vPerModSitKYC := GetSQL('select *'
                            + '  from secu_oper_acc '
                            + ' where cve_funcion  = ' + QuotedStr('CLASE_' + UpperCase(objeto.ClassName))
                            + '   and cve_usuario  = ' + QuotedStr(UpperCase(objeto.DameUsuario))
                            + '   and cve_oper_acc = ' + QuotedStr('PL'),
                              objeto.SeguDataBaseName, objeto.SeguSessionName, True);
      if vPerModSitKYC then cbSitKYC.Color := clWindow
      else                  cbSitKYC.Color := clBtnFace;
      bAsigSitKYC.Enabled   := vPerModSitKYC;
      cbSitKYC.Enabled      := vPerModSitKYC;

      if pBAcuseRecibo <> nil then // CZR 17-feb-2015
         pBAcuseRecibo.Enabled := (trim(Sit_Contrato.AsString) = cCancelado);
   end;

   try
      solicitaCuestionario();
   except
   end;

   try
      iCteAAA.Active:= true;
   except
      on e: exception do
         messagedlg('Error al activar animación de clientes AAA [' + iCteAAA.FileName + ']' +
                    chr(VK_RETURN) + e.message, mtWarning, [mbOK], 0);
   end;
end;

procedure TWContrato.OnAfterLocalizaEmpresa(Sender:TObject);
var x:string;
Begin
x:='';
  ValidaEmpresaUnidadNegocio;
end;

procedure TWContrato.FormDestroy(Sender: TObject);
begin
  objeto.OnCambioContrato:=nil;
  objeto.ID_Contrato.Control :=nil;
  objeto.EditPrefijo:=nil;
  objeto.EditIdContrato:=nil;
  objeto.ID_Domicilio.Control      :=nil;
  objeto.ID_Titular.Control      :=nil;
  objeto.ID_Prospecto.Control := nil;     // CZR 25-feb-2009
  objeto.Nomb_Contrato.Control      :=nil;
  objeto.Sit_Documentos.Control:=nil;
  objeto.Cve_Corresp.Control:=nil;
  objeto.B_Asig_Seg_Aut.Control:=nil;
  objeto.Sit_Contrato.Control:=nil;
  objeto.Id_Cto_Liq.Control:=nil;
  objeto.F_Alta.Control:=nil;
  objeto.F_Baja.Control:=nil;
  objeto.FH_Modificacion.Control:=nil;
  objeto.Cve_Usuar_Modif.Control:=nil;
  objeto.B_Impreso.Control :=nil;
  objeto.B_ASESOR_INV.Control:=nil;
  objeto.B_Sol_ILine.Control:= nil;
  objeto.TX_COMENTARIO.Control:=nil;
  objeto.F_Reactivacion.Control:=nil;
  objeto.Cve_Tipo_Cta.Control:=nil;
  objeto.CVE_TIPO_FIDE.Control:=nil;
  objeto.ID_CONTRA_DV.Control:=nil;
  objeto.ID_CONTRA_IB.Control:=nil;
  objeto.SDO_PATRIMONIO.Control:=nil;
  objeto.Titular.Nombre.Control:=nil;
  objeto.Titular.MasterSourceEditControl:=nil;
  objeto.Domicilio.CalleNumero.Control:=nil;
  objeto.Domicilio.MasterSourceEditControl:=nil;
  objeto.Empresa.Nombre.Control:=nil;
  objeto.Empresa.MasterSourceEditControl:=nil;
  objeto.Moneda.MasterSourceEditControl:=nil;
  objeto.Grupo.Desc_Gpo_Contrat.Control:=nil;
  objeto.Grupo.PromAsociado.Nombre.Control:=nil;
  objeto.Grupo.MasterSourceEditControl:=nil;
  objeto.Producto.Desc_Producto.Control:=nil;
  objeto.Producto.MasterSourceEditControl:=nil;
  objeto.Producto.TipoContrato.Desc_Tipo_Contra.Control:=nil;
  objeto.UnNegocio.Desc_Entidad.Control:=nil;
  objeto.UnNegocio.MasterSourceEditControl:=nil;
  objeto.Segmento.Desc_Segmento.Control:=nil;
  objeto.Segmento.MasterSourceEditControl:=nil;
  objeto.email.control :=nil;


  Objeto.CVE_ACTIV_CTO.Control:= nil;
  With Objeto.Actividad do
  Begin
    //CVE_ACTIV_CTO.Control:= nil;

    Cve_Activ_SITI.Control:= nil;
    ActividadSITI.DESC_ACTIV_ECON.Control:= nil;
    TipoCliente.CveSeccion.Control:= nil;
    TipoCliente.DESC_ACTIVIDAD.Control:= nil;
    Residencia.CveSeccion.Control:= nil;
    Residencia.DESC_ACTIVIDAD.Control:= nil;
    TipoSector.CveSeccion.Control:= nil;
    TipoSector.DESC_ACTIVIDAD.Control:= nil;
    Sector.CveSeccion.Control:= nil;
    Sector.DESC_ACTIVIDAD.Control:= nil;
    SubSector.CveSeccion.Control:= nil;
    SubSector.DESC_ACTIVIDAD.Control:= nil;
    Rama.CveSeccion.Control:= nil;
    Rama.DESC_ACTIVIDAD.Control:= nil;
    SubRama.CveSeccion.Control:= nil;
    SubRama.DESC_ACTIVIDAD.Control:= nil;
    Inciso.CveSeccion.Control:= nil;
    Inciso.DESC_ACTIVIDAD.Control:= nil;
  end;

  objeto.CIBCSEgmento.Desc_Segmento.Control:=nil;
  objeto.CIBCSEgmento.MasterSourceEditControl:=nil;
  objeto.Moneda.Desc_Moneda.Control:=nil;
  objeto.CVE_REGIMEN.Control:=nil;
  objeto.COMB_FIRMAS.Control:=nil;
  objeto.CVE_DISCRECIONAL.Control:=nil;
  objeto.F_INI_PZO_OBJ.Control:=nil;
  objeto.PLAZO_OBJETIVO.Control:=nil;
  objeto.SDO_POS_LIQUIDA.Control:=nil;
  objeto.Concepto.MasterSourceEditControl:=nil;
  objeto.Concepto.FieldByName('DESC_CONCEPTO').Control:=nil;
  objeto.Cve_Usuario.Control := nil;
  //PUBLICACIONES
  objeto.F_Expiracion.Control:= nil;
  objeto.F_Primer_Envio.Control:= nil;
  objeto.Num_Envios.Control:= nil;
  objeto.Tot_Enviados.Control:= nil;
  objeto.Cve_Tip_Suscr.Control:= nil;

  if Motivo <> nil then Motivo.Free;

  //MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES SE AGREGA EL SIGUIENTE CODIGO
  Objeto.B_SOBREGIRO.Control    :=nil;
  Objeto.ID_CTO_PRLV.Control    :=nil;
  Objeto.ID_CTO_FDOS.Control    :=nil;
  Objeto.F_ANIVERSARIO.Control  :=nil;
  Objeto.CVE_TP_COMISION.Control:=nil;
  //MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES HASTA AQUI LOS CAMBIOS
  Objeto.B_Ilocalizable.Control := nil;     // CZR 29-ene-2009
  Objeto.B_ICreaIFS.Control := nil;      //SACA4984

  {-- Checks para Atributos de Ctto [SACA4984 Septiembre 2013]--}
  Objeto.B_CteInstitucional.Control := nil;
  Objeto.B_CteSofisticado.Control   := nil;
  Objeto.B_CteCalificado.Control    := nil;
  Objeto.B_Elegible.Control         := nil;

  {-- Obetos para Servicios de Ctto [SACA4984 Septiembre 2013]--}
  Objeto.Servicio.CVE_SERVICIO_FIN.Control  := nil;
  Objeto.Servicio.DESC_SERVICIO_FIN.Control := nil;
  Objeto.TipoServicio.CVE_TIP_CTE.Control   := nil;
  Objeto.TipoServicio.DESC_TIP_CTE.Control  := nil;

  Objeto.PsiEvaluacion.MasterSourceEditControl := nil;
  Objeto.PsiEvaluacion.ID_EVALUACION.Control := nil;

  Objeto.MotCambPromotor.CVE_GPO_MOTIVO.Control            := nil;
  Objeto.MotCambPromotor.CVE_MOTIVO.Control                := nil;
  Objeto.MotCambPromotor.DESC_MOTIVO.Control               := nil;
end;//procedure

procedure TWContrato.DespuesShow(Var Msg:TMessage);
begin
  pageInfo.ActivePage:= tabInfoProducto;
  pageInfo.ActivePage:= tabInfoContrato;
  //Application.ProcessMessages;
  Interforma1.F.OnKeyDown:=FormKeyDown;
end;//procedure


Procedure TWContrato.ValidaProspectos;
Var objQuery: TQuery;
Begin
  gbProspecto.Visible:= False;
  gbErrorProspecto.Visible:= False;

  If (Objeto.Modo = moBrowse) and
     (Objeto.Active) and
     (Objeto.ConfigCaptura.B_Prospecto.AsString = 'V') Then
{
     ( (Objeto.Cve_Tip_Contrato.AsString='PRCB') OR
       (Objeto.Cve_Tip_Contrato.AsString='PRBC') OR
       (Objeto.Cve_Tip_Contrato.AsString='PROF') OR
       (Objeto.Cve_Tip_Contrato.AsString='PRMD')
     ) THEN
}
      Try
        objQuery:= GetSQLQuery(
            ' SELECT Producto.Cve_Producto, Producto.Cve_Tip_Contrato,' +
            '   Id_Prefijo_Contr, Folio_Contrato' +
            ' FROM Producto, Tipo_Contrato' +
            ' WHERE Producto.Cve_Prod_Prospec = ' + Objeto.Cve_Producto.AsSQL +
            '   and Producto.Cve_Tip_Contrato = Tipo_Contrato.Cve_Tip_Contrato'
          , Objeto.DataBaseName, Objeto.SessionName, False);

        If (objQuery <> nil) and (Not objQuery.IsEmpty) Then
        Begin
          gbProspecto.Visible:= True;
          edPrefijoProspecto.Text:= objQuery.FieldByName('Id_Prefijo_Contr').AsString;
          If objQuery.FieldByName('Folio_Contrato').AsInteger >= 0 Then
          Begin
            edContratoProspecto.Text:= objQuery.FieldByName('Folio_Contrato').AsString;
            edContratoProspecto.Color:= clBtnFace;
            edContratoProspecto.ReadOnly:= True;
          end
          else
          Begin
            edContratoProspecto.Text:= '';
            edContratoProspecto.Color:= clWindow;
            edContratoProspecto.ReadOnly:= False;
          end;
        end;
        //else MessageDlg('El Producto de Prospectos no ha sido asignado a ningún Producto Real', mtWarning, [mbOK], 0);
      Finally
        if objQuery <> nil Then objQuery.Free; objQuery:= nil;
        gbErrorProspecto.Visible:= not gbProspecto.Visible;
      end;
end;

procedure TWContrato.CambioContrato(Sender:TObject);
var intIndex: Integer;
begin
  tabMotivo.PageControl:= nil;
  pageInfo.ActivePage.Refresh;

  For intIndex:= 0 to tabInfoProducto.ControlCount - 1 do
    with tabInfoProducto.Controls[intIndex] do
      Visible:= (Name = 'gb' + Objeto.ConfigCaptura.Tipo_Captura.AsString);

  ValidaProspectos;
  sbContratoLiq.Enabled:= Interforma1.CanEdit and (Objeto.ConfigCaptura.B_Cto_Liq.AsString = 'F');
  gbComentario.Visible:= True;

{
     gbCDVI.Visible:=((objeto.Cve_Tip_Contrato.AsString='CDVI') or (objeto.Cve_Tip_Contrato.AsString='IDVI') or (objeto.Cve_Tip_Contrato.AsString='BDVI'));
     if Interforma1.CanEdit then
     begin
        sbContratoLiq.Enabled:=Not (gbCDVI.Visible);
     end;//if
     gbCIBC.Visible:=  (objeto.Cve_Tip_Contrato.AsString='CIBC') OR (objeto.Cve_Tip_Contrato.AsString='CSIL')
                    OR (objeto.Cve_Tip_Contrato.AsString='IFSM') OR (objeto.Cve_Tip_Contrato.AsString='INIF')
                    OR (objeto.Cve_Tip_Contrato.AsString='OMDC') OR (objeto.Cve_Tip_Contrato.AsString='OMDI')
                    OR (objeto.Cve_Tip_Contrato.AsString='OMSC') OR (objeto.Cve_Tip_Contrato.AsString='IFON')
                    OR (objeto.Cve_Tip_Contrato.AsString='OFON') OR (objeto.Cve_Tip_Contrato.AsString='DFID')
                    OR (objeto.Cve_Tip_Contrato.AsString='AIVA') OR (objeto.Cve_Tip_Contrato.AsString='CIGI')
                    OR (Objeto.Cve_Tip_Contrato.AsString='PRCB') OR (Objeto.Cve_Tip_Contrato.AsString='PRBC')
                    OR (Objeto.Cve_Tip_Contrato.AsString='PRMD') OR (Objeto.Cve_Tip_Contrato.AsString='PROF')
                    OR (Objeto.Cve_Tip_Contrato.AsString='IVAL');
     gbFIDE.Visible := (objeto.Cve_Tip_Contrato.AsString='FIDE');
     gbINET.Visible := (objeto.Cve_Tip_Contrato.AsString='INET');
     gbMETA.Visible := (objeto.Cve_Tip_Contrato.AsString='GRUP');
     gbSSER.Visible := (objeto.Cve_Tip_Contrato.AsString='SSER');
}
end;

procedure TWContrato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;//procedure

procedure TWContrato.InterForma1DespuesNuevo(Sender: TObject);
  Function GetEntidadSucursal(pIdEntidad: Integer): Integer;
  Var qSucursal: TQuery;
  Begin
    Try
      qSucursal:= GetSQLQuery(
                              ' SELECT Id_Entidad ' +
                                ' FROM Unidad_Negocio ' +
                               ' WHERE Cve_Tipo_Entidad = ''SUCU'' ' +
                              ' START WITH Id_Entidad = ' + IntToStr(pIdEntidad) +
                              ' CONNECT BY Id_Entidad = PRIOR Id_Ent_Ubica ',
                              objeto.DataBaseName, objeto.SessionName, False);
      If (qSucursal <> nil) and (Not qSucursal.Eof) Then
        GetEntidadSucursal:= qSucursal.FieldByName('ID_ENTIDAD').asInteger
      else GetEntidadSucursal:= pIdEntidad;
    Finally
      If qSucursal <> nil Then qSucursal.Free; qSucursal:= nil;
    end;
  end;

var Q1,
    Q2  : TQuery;

begin
  //objeto.Cve_Tipo_Cta.AsString:='NO';
  //objeto.Cve_Corresp.AsString:='CR';
  //objeto.Concepto.FindKey(['T001']);
  //objeto.Segmento.FindKey(['EP']);

  tipoOper         := false ;
  objeto.pass      := '';
  objeto.cveCorreo := '' ;
//  cbedc.checked  := false;
  cbEDC.enabled    :=  false ;


  edModifica.Text                 := 'F';
  objeto.SitContratoAnt           := 'AC';
  objeto.Sit_Contrato.AsString    := 'AC';
  objeto.B_Asig_Seg_Aut.AsString  := 'V';
  objeto.B_Impreso.AsString       := 'F';
  objeto.B_Restringido.AsString   := 'F';
  objeto.B_Doctos_Verif.AsString  := 'F';
  objeto.Sit_Documentos.AsString  := 'IN';
  objeto.CIBCSegmento.FindKey([' 0  ']);
  objeto.FH_Modificacion.AsString := FormatDateTime('DD/MM/YYYY HH:MM',Now);
  objeto.F_Alta.AsString          := FormatDateTime('DD/MM/YYYY',Date);
  objeto.F_Baja.AsString          := '';

  if objeto.Apli<>nil then begin
    objeto.Cve_Usuar_Modif.AsString:= objeto.Apli.Usuario;
    if objeto.Apli.Usuario <> '' then begin
      if objeto.Cve_Tip_Contrato.AsString <> 'CRED' then begin
        Q1 := GetSQLQuery('SELECT ID_PERSONA,CVE_SUCURSAL FROM USUARIO WHERE CVE_USUARIO='''+objeto.Apli.Usuario+'''',
                          objeto.DataBaseName,objeto.SessionName,True);
        Try
          if (Q1 <> nil) and (Not Q1.IsEmpty) then begin
            //objeto.UnNegocio.FindKey([Q1.FieldByName('CVE_SUCURSAL').AsString]);
            objeto.UnNegocio.FindKey([IntToStr(GetEntidadSucursal(Q1.FieldByName('CVE_SUCURSAL').AsInteger))]);
            Q2 := GetSQLQuery('SELECT ID_PERS_ASOCIAD, ID_GRUPO FROM GPO_CONTRATO '+
                               'WHERE ID_PERS_ASOCIAD = '+ Q1.FieldByName('ID_PERSONA').AsString,
                              objeto.DataBaseName,objeto.SessionName,True);
            Try
              if(Q2<>nil)and(Not Q2.IsEmpty)then begin
                objeto.Grupo.FindKey([Q2.FieldByName('ID_PERS_ASOCIAD').AsString,Q2.FieldByName('ID_GRUPO').AsString]);
                objeto.Grupo.DrawControl;
              end;
            Finally
              Q2.Free;
            end;
          end;
        Finally
          Q1.Free;
        end;
      end;
    end;
  end
  else begin
    objeto.Cve_Usuar_Modif.AsString := ObtenUsuario;
  end;

  sbContratoLiq.Enabled := False;

  // Publicaciones
  rgCveTipSuscr.ItemIndex := 0;
  edTotEnviados.Text      := '0';

  chIlocalizable.Enabled  := False;              // CZR 16-feb-2009
  Visibilidad_Prospecto(False);                 // CZR 05-mar-2009
  Objeto.Visibilidad_NivelRiesgo(False, False); // CZR 03-oct-2013

  //valida si se habilitan o no los checks de Atributos  rohs4279 nov/2015 req. PMO150817
  Valida_Atributos;
end;

procedure TWContrato.InterForma1DespuesModificar(Sender: TObject);
Var vlQueryCmd:Tquery;
    idctto,strSql:string;
    tipoAccesoM:boolean;
    Qry :TQuery;
    SQL : String;
    vExiste : Integer;
begin
  objeto.TitularAnt := objeto.ID_Titular.AsInteger;
  Objeto.SitContratoAnt:= Objeto.Sit_Contrato.AsString;
  edModifica.Text := 'V';
  {* SACA4984
   * verificamos que el contrato sea prefijo 1 y que no este asociado con un contrato
   * para poder habilitar el chek
  }

  vExiste := 0;
  chkCreaIFS.Enabled := False;
  chkCreaIFS.Checked := False;

  if(edPrefijo.Text = '1' ) then begin
    Qry := GetSqlQuery('SELECT COUNT(1) EXISTE FROM CTO_IFS_ICB WHERE ID_CONTRATO=' +  edContrato.text,
                       objeto.DataBaseName, objeto.SessionName, True);
    if Qry <> nil then begin
      try
        vExiste := Qry.FieldByName('EXISTE').AsInteger;
      Finally
        Qry.Free;
      end;
    end;

    if(vExiste > 0) then begin
      chkCreaIFS.Checked := True;
      chkCreaIFS.Enabled := False;
    end
    else begin
      chkCreaIFS.Checked := False;
      chkCreaIFS.Enabled := True;
    end;
  end;

  //CambioContrato(nil);
  sbContratoLiq.Enabled:= Interforma1.CanEdit and (Objeto.ConfigCaptura.B_Cto_Liq.AsString = 'F');

  //Publicaciones
  Case rgCveTipSuscr.ItemIndex of
    0 :  begin
      edFExpiracion.Enabled:= False;
      dtpExpiracion.Enabled:= False;
      edFExpiracion.Color:= clBtnFace;
    end;
    1 : begin
      edNumEnvios.Enabled:= False;
      edNumEnvios.Color:= clBtnFace;
    end;
  end;

  // CZR 06-mar-2009   Valida si el usuario tiene permiso para Modificar el Prospecto
  sbProspecto.Enabled := False;
  if GetSQL('select *'
           + '  from secu_oper_acc '
           + ' where cve_funcion  = ' + QuotedStr('CLASE_' + UpperCase(objeto.ClassName))
           + '   and cve_usuario  = ' + QuotedStr(UpperCase(objeto.DameUsuario))
           + '   and cve_oper_acc = ' + QuotedStr('PR'),
             objeto.SeguDataBaseName, objeto.SeguSessionName, True) then begin
    if trim(objeto.ConfigCaptura.B_VAL_PRECALIFICA.AsString) = 'V' then
      sbProspecto.Enabled := True;
  end;

  // CZR 24-feb-2010   Valida si el usuario tiene permiso para modificar la situacion del Contrato
  if trim(objeto.ConfigCaptura.B_VAL_SITUACION.AsString) = 'V' then begin
    if not GetSQL('select *'
                  + '  from secu_oper_acc '
                  + ' where cve_funcion  = ' + QuotedStr('CLASE_' + UpperCase(objeto.ClassName))
                  + '   and cve_usuario  = ' + QuotedStr(UpperCase(objeto.DameUsuario))
                  + '   and cve_oper_acc = ' + QuotedStr('SC'),
                    objeto.SeguDataBaseName, objeto.SeguSessionName, True) then
      rgSituacion.Enabled := False;
  end;

  //JHMM
  if GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(objeto.ClassName)+
            ''') AND (CVE_USUARIO='''+objeto.DameUsuario+''') and (CVE_OPER_ACC=''WW'')',
    objeto.SeguDataBaseName,objeto.SeguSessionName,True) then
    tipoAccesoM := True
  else
    tipoAccesoM := False;

  if not tipoAccesoM Then
    cbEDC.enabled := false     ;
  tipoOper  := True    ;

   {
   EstadoContrato;
   tipoOper  := True ;
   passCto   := '';

        //Obtengo el contrato para setear el correo a la variable global
      idctto := trim(EdIdContrato.Text);
  if trim(idctto)<>'' Then
     Begin
      //Procedo a buscarlo en la bd de correos
      strSql := '';
      strSql := strSql + 'select Correo from cto_email_edc where id_contrato =  '+ objeto.ID_Contrato.AsString+' and id_producto = 0';

      vlQueryCmd              := TQuery.Create(Nil);
      vlQueryCmd.SessionName  := Apli.SessionName;
      vlQueryCmd.DatabaseName := Apli.DataBaseName;
      vlQueryCmd.SQL.Clear;
      vlQueryCmd.Close;
      vlQueryCmd.SQL.Add(strSql);
      vlQueryCmd.open   ;

      if not vlQueryCmd.IsEmpty then
         begin
           cvecorreo := vlQueryCmd.FieldByName('Correo').AsString;
           if cvecorreo = '' Then
              Begin
               cbEDC.Checked := false;
               cbEDC.enabled := false;
              end
           else
             Begin
              cbEDC.Checked :=true;
              cbEDC.enabled :=true;
             end;
         end
      else
       begin
         cvecorreo :=  '' ;
         cbEDC.Checked := false;
         cbEDC.enabled := false;
       end;
    end
  else
     begin
         cvecorreo :=  '' ;
         cbEDC.Checked := false;
         cbEDC.enabled :=true;
     end;
}
  //valida si se habilitan o no los checks de Atributos  rohs4279 nov/2015 req. PMO150817
  Valida_Atributos;
end;

// < Inicia Modificación por SATV el 10Oct2006 >
procedure TWContrato.ValidaSeleccionTitular(vlSIT_PERSONA : String);
var vlB_BLOQUEADA      : String;
    vlTOTAL_CTOS_BLOQ  : Integer;
    vlRESULTADO        : Integer;
    vlTX_RESULTADO     : String;

  procedure Limpia_Datos;
  begin
    // Limpia los datos del Titular
    Objeto.Titular.Active       := False;
    Objeto.ID_TITULAR.AsInteger := 0;

    // Limpia Datos del Domicilio
    Objeto.Domicilio.Active       := False;
    Objeto.ID_DOMICILIO.AsInteger := 0;

    // CZR 26-feb-2009   Limpia Datos de Prospecto
    Objeto.Prospecto.Active := False;
    edldProspecto.Text      := '';
    objeto.ID_Prospecto.GetFromControl;
  end;

begin
   // CZR 26-feb-2009
   if (Objeto.Modo = moAppend) or (Objeto.Modo = moEdit) then
   begin
      if (objeto.Prospecto.Active) and (objeto.ID_Prospecto.AsInteger > 0) then
         if Verifica_ProspectoTitular = 'F' then
            exit;
   end;

  // Evita que se seleccione una persona que tenga Contratos previamente bloqueados por Auditoría, con la
  // finalidad de evitar la apertura de estos.
  If (Objeto.StpTieneCtosBlqAut( Objeto.Titular.ID_Persona.AsInteger, // peID_TITULAR           : Integer;
                                 Objeto.DatabaseName,                 // peDataBaseName         ,
                                 Objeto.SessionName,                  // peSessionName          : String;
                                 vlTOTAL_CTOS_BLOQ,                   // var psTOTAL_CTOS_BLOQ  : Integer;
                                 vlRESULTADO,                         // var psRESULTADO        : Integer;
                                 vlTX_RESULTADO                       // var psTX_RESULTADO     : String
                                )) Then
      Begin
      // Si tiene contratos bloqueados, entonces...
      If (vlTOTAL_CTOS_BLOQ > 0) Then
         Begin
         Messagedlg(' La persona seleccionada tiene cuentas bloqueadas por instrucciones de la Autoridad, por lo que no se le pueden aperturar nuevas cuentas.'+
                    ' Para mayor información consultar con Auditoria.',
                    mtWarning, [mbOK], 0);
         // Limpia los datos del Titular
         Limpia_Datos;
         End;
      End;

  // La situación de la persona no está "Activa", entonces...
  If (Objeto.Titular.ID_Persona.AsInteger > 0) And (vlSIT_PERSONA <> 'AC') Then
     Begin
     // Válida que la situación es debido a que esta bloqueada la persona por la autoridad
     GetSQLStr('SELECT PKGADMCTA.GET_PERSONA_BLOQUEADA_ID( '+Objeto.Titular.ID_PERSONA.AsString +
               ' ) AS  B_BLOQUEADA FROM DUAL',
               Objeto.DatabaseName, Objeto.SessionName, 'B_BLOQUEADA', vlB_BLOQUEADA, True);
     // Válida q la persona está inactiva porque ha sido bloqueada por la autoridad...
      //[SACA4984 -  LN y PEPS ]La situación de la persona simpre debe ser ACTIVA para poder continuar.
     If ( vlB_BLOQUEADA = 'V' ) Or (vlSIT_PERSONA <> 'AC') Then
        Begin
        Messagedlg(' Imposible aperturar contrato para esta persona. Para mayor información consultar con Auditoria u Oficialia de Cumplimiento.',
                   mtWarning, [mbOK], 0);
        // Limpia los datos del Titular
        Limpia_Datos;
        End;
    End;
end;
// < Termina Modificación por SATV >

procedure TWContrato.sbTitularClick(Sender: TObject);
var
  Sit_Titular: STring;
  vIdProspectoCtaApertRec : Integer; {CAPM}
begin
  If Objeto.ValidaAccesoEsp('CTTO_TITULAR',True,True) Then
  Begin
    if objeto.Producto.Active = False then
       MessageDlg('Debe de Seleccionar un Producto.',mtError,[mbOK],0)
    else
    begin

     {*************************************************************************************************}

     objeto.Titular.BuscaWhereString := 'PERSONA.SIT_PERSONA = ''AC'' '+            {CAPM} { NO ASIGNAR CUENTAS DE }
                                        ' AND PERSONA.ID_PERSONA NOT IN (20842, 373456) '; { APERTURA RECIENTE }

     //vIdTitularOld := objeto.Titular.ID_Persona.AsInteger; { SE TRASTALA A BUSCAR CONTRATO }

     {*************************************************************************************************}

       if (InterForma1.CanEdit) and (Not InterForma1.IsNewData) and
          (objeto.Titular.FilterBy = fbTMPersonaFisica) then
       begin
          Try
              if objeto.Producto.Cve_Per_Jur_Prod.asString = 'PF' then
                objeto.Titular.FilterBy:= fbTMPersonaFisica
              else if objeto.Producto.Cve_Per_Jur_Prod.asString = 'PM' then
                objeto.Titular.FilterBy:= fbTMPersonaMoral
              else objeto.Titular.FilterBy:= fbNinguno;

              objeto.Titular.Busca;
          Finally
            objeto.Titular.BuscaWhereString:= '';
          end;
       end
     else
       begin
         objeto.Titular.Busca;
       end;

    {*************************************************************************************************}
    vB_AsignacionCtoApRec :=                                     { SE GUARDA EN UNA VARIUABLE BOOLEANA                }
          (vIdTitularOld <> Objeto.Titular.ID_Persona.AsInteger); { SI EL TITULAR DEL CONTRATO FUE CAMBIADO (ASIGNADO) }

    if vB_AperturaRec and vB_AsignacionCtoApRec then
    begin
      {GetSQLInt(Format('SELECT ID_PROSPECTO FROM PR_DET_PROSPECTO WHERE ID_TITULAR = %d  AND SIT_PROSPECTO = ''AC''',
                      [Objeto.Titular.ID_Persona.AsInteger]),
                 Objeto.DataBaseName, Objeto.SessionName, 'ID_PROSPECTO', vIdProspectoCtaApertRec, False);} //Luis Hernandez Abr 2013
      
	  
	  GetSQLInt(Format('SELECT ID_PROSPECTO FROM PLD_DET_PROSPECTO@LCORPOC WHERE ID_TITULAR = %d  AND SIT_PROSPECTO = ''AC''',
                      [Objeto.Titular.ID_Persona.AsInteger]),
                 Objeto.DataBaseName, Objeto.SessionName, 'ID_PROSPECTO', vIdProspectoCtaApertRec, False);

      if (vIdProspectoCtaApertRec <= 0) then
      begin
        MessageDlg('Sin ID Prospecto.'+#13+#10+'El Titular seleccionado no se encuentra precalificado.', mtWarning, [mbOK], 0);
        objeto.Titular.ID_Persona.AsInteger := vIdTitularOld;
        Abort;
      end
      else
        Objeto.ID_Prospecto.AsInteger := vIdProspectoCtaApertRec;

    end;
    {*************************************************************************************************}
    end;

    if(GetSqlStr('Select Sit_Persona from persona where id_persona = ' + objeto.Titular.ID_Persona.AsString,
       objeto.DataBaseName, objeto.SessionName, 'SIT_PERSONA', Sit_Titular, False)) and (Sit_Titular <> 'AC') then
       messagedlg('La persona seleccionada no esta activa',mtInformation,[mbOK],0);

    // < Inicia Modificación por SATV el 18Sep2006 >
    ValidaSeleccionTitular(Sit_Titular);
    // < Termina Modificación por SATV >
  End;
end;

procedure TWContrato.PopTitularCatalogoClick(Sender: TObject);
var
  Sit_Titular: String;
begin
  if(InterForma1.CanEdit)and(Not InterForma1.IsNewData)and(objeto.Titular.FilterBy=fbTMPersonaFisica)then begin
     Try
       objeto.Titular.BuscaWhereString := 'PERSONA.ID_PERSONA IN (SELECT ID_PERSONA FROM CONTRATANTE '+
                                          ' WHERE ID_CONTRATO = '+objeto.ID_Contrato.AsString+' )';
       objeto.Titular.Busca;
     Finally
       objeto.Titular.BuscaWhereString := '';
     end;
  end
  else
  begin
     if(InterForma1.CanEdit) and (InterForma1.IsNewData) and (objeto.Producto.Active=False) then
        MessageDlg('Debe de Seleccionar un Producto.',mtError,[mbOK],0)
     else
        objeto.Titular.Catalogo;
  end;

  if(GetSqlStr('Select Sit_Persona from persona where id_persona='+objeto.Titular.ID_Persona.AsString,
     objeto.DataBaseName,objeto.SessionName,'SIT_PERSONA',Sit_Titular, False))and(Sit_Titular <> 'AC')then
     messagedlg('La persona seleccionada no esta activa',mtInformation,[mbOK],0);

  // < Inicia Modificación por SATV el 18Sep2006 >
  ValidaSeleccionTitular(Sit_Titular);
  // < Termina Modificación por SATV >
end;

procedure TWContrato.sbDomicilioClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('CTTO_DOMICILIO',True,True) Then
  Begin
    objeto.Domicilio.Busca;
  End;
end;

procedure TWContrato.sbProductoClick(Sender: TObject);
var
  vB_ChequeraFis, vParamObtCto : String;    { CAPM }
  vB_BuscaProducto : Boolean; { CAPM }
begin
  If Objeto.ValidaAccesoEsp('CTTO_PRODUCTO',True,True) Then
begin

   //objeto.Producto.Busca;
   if objeto.Producto.Busca then  {CAPM}
   begin
        {  EdIdContrato.ReadOnly := False;
       {***********************************************************************************************************************}
       if (objeto.Producto.CVE_TIP_CONTRATO.AsString = 'CDVI') then  { Producto Tipo Contrato 'CDVI' }
       begin { PRODUCTO SELECCIONADO CON TIPÓ DE CONTRATO DE DPVISTA }
           GetSQLStr(Format( ' SELECT B_CHEQUERA_FIS '+          { SE CONSULTA EN PRODUCTOS DPVISTA }
                             '   FROM DV_PRODUCTO '+             { BANDERA QUE INDICA CON CHERQUERA FISICA }
                             '  WHERE CVE_PRODUCTO = %s', [QuotedStr(Objeto.Producto.CVE_PRODUCTO.AsString)]),
                     Objeto.DataBaseName, Objeto.SessionName, 'B_CHEQUERA_FIS', vB_ChequeraFis, False);

           if vB_ChequeraFis = 'V' then
           begin { CAPM } { EL PRODUCTO SELECCIONADO ES CON CHEQUERA FISICA } { --> SALIR }

             objeto.Producto.Active := False;    { SE REINICIAN LOS FINDIT's }
             objeto.Concepto.Active := False;
             edPrefijo.Clear;

             MessageDlg('Para nuevos contratos de Depósitos a la Vista con Producto con Chequera fisica:'+#13+#10+
                        'Usar el esquema de Control de Medios para su creación y/o usar el buscador de '+
                        'esta pantalla para acceder a Cuentas de Apertura Reciente.',
                          mtInformation, [mbOK], 0);
             Exit;
           end
           else
           begin
               GetSQLStr('SELECT VALOR FROM DV_PARAM WHERE CVE_PARAM = ''OBTCTO'' AND CVE_GRUPO = ''CTRLME'' AND SIT_PARAMETRO = ''AC'' ',
                          Objeto.DataBaseName, Objeto.SessionName, 'VALOR', vParamObtCto, False);
               if vParamObtCto = 'V' then
               begin
                 EdIdContrato.Text := fObtenCtoDpVista;  { GENERA CONTRATO DPVISTA CON NUMERO VERIFICADOR }
                 EdIdContrato.ReadOnly := True;
               end;
           end;
       end;
       {***********************************************************************************************************************}

    // CZR 05-mar-2009
    if trim(objeto.ConfigCaptura.B_VAL_PRECALIFICA.AsString) = 'V' then
      Visibilidad_Prospecto(True)
    else
      Visibilidad_Prospecto(False);

    // CZR 24-feb-2010
    if trim(objeto.ConfigCaptura.B_VAL_SITUACION.AsString) = 'V' then
    begin
      if not GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION = ''CLASE_' + UpperCase(objeto.ClassName) + ''') AND (CVE_USUARIO = ''' + objeto.DameUsuario + ''') and (CVE_OPER_ACC = ''SC'')',
                    objeto.SeguDataBaseName, objeto.SeguSessionName, True) then
         rgSituacion.Enabled   := False;
         rgSituacion.ItemIndex := 1;
    end;


    if edPrefijo.Text = '1' then
    begin
        chkCreaIFS.Enabled := True;
        chkCreaIFS.Checked := False;
        chkCreaIFS.Visible := True;
    end
    else
    begin
        chkCreaIFS.Visible := False;
        chkCreaIFS.Enabled := False;
        chkCreaIFS.Checked := False;
    end;
   end;

   {Validacion de Folio Cuestionario y Perfil Asignado }
   solicitaCuestionario();
  {* If (Objeto.Cve_Tip_Contrato.AsString = 'CIBC') Or
      (Objeto.Cve_Tip_Contrato.AsString = 'OMSC') Or
      (Objeto.Cve_Tip_Contrato.AsString = 'IFON') Or
      (cbTipoCuenta.Text = 'ADMINISTRATIVO')      Or
      (chkCteInstitucional.Checked)               then
   Begin
       gpPerfilCuestionario.Visible := True;
   End
   Else
   Begin
      gpPerfilCuestionario.Visible := False;
   End;  *}




   gpoServicios.Visible := True;
    {RAPA
    CambioContrato(nil);
    if (objeto.Producto.Cve_Tip_Contrato.AsString = 'INIF') or
       (objeto.Producto.Cve_Tip_Contrato.AsString = 'BDVI') or
       (objeto.Producto.Cve_Tip_Contrato.AsString = 'IVAL') Then
    Begin
       edUnNegocio.Text := 'INTERFINANCIAL SERVICES';
       objeto.Id_Entidad.AsString := '7';
    End;
    }
  End;
end;

procedure TWContrato.sbEmpresaClick(Sender: TObject);
var intEmpresa: Integer;
begin
  If Objeto.ValidaAccesoEsp('CTTO_EMPRESA',True,True) Then
  Begin
    if objeto.Producto.Active=False then
       MessageDlg('Debe de Seleccionar un Producto.',mtError,[mbOK],0)
    else
    begin
      objeto.Empresa.BuscaWhereString:= '(EMPRESA.ID_EMPRESA IN (SELECT ID_EMPRESA ' +
                                        '                          FROM PROD_AUT_EMPRESA ' +
                                        '                         WHERE CVE_PRODUCTO = '+ objeto.Producto.Cve_Producto.AsSQL + '))';
      intEmpresa:= Objeto.Empresa.ID_Persona.AsInteger;
      objeto.Empresa.Busca;
      //ValidaEmpresaUnidadNegocio;
      if intEmpresa <> Objeto.Empresa.ID_Persona.AsInteger Then
        objeto.IniciaConfigContrato;
    end;
  End;
end;

procedure TWContrato.Catlogo1Click(Sender: TObject);
begin objeto.Titular.Catalogo;
end;

procedure TWContrato.cbSitDocumentosChange(Sender: TObject);
begin objeto.Sit_Documentos.ComboChange;
end;

procedure TWContrato.btPromotorClick(Sender: TObject);
Var q: TQuery;
begin
  If Objeto.ValidaAccesoEsp('CTTO_PROMOTOR',True,True) Then
  Begin
    if objeto.Grupo.Busca and objeto.Grupo.Active then
    begin
       q:= GetSQLQuery('SELECT Id_entidad, B_Eventual FROM Empleado WHERE Id_Persona = '''+ objeto.Grupo.Id_Pers_Asociad.AsString + '''',
                       objeto.DataBaseName, objeto.SessionName, True);

       //Repinta la unidad de negocio de las promotorias.- Cuando el promotor es un comisionista}
       if q.FieldByName('B_EVENTUAL').asString = 'C' then
          objeto.UnNegocio.FindKey([q.FieldByName('ID_ENTIDAD').asString]);
    end;
  End;
end;

procedure TWContrato.btSegmentoClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('CTTO_SEGMENTO',True,True) Then
  Begin
    if objeto.Segmento.Busca then
    begin
       solicitaCuestionario();
        {* if (objeto.Segmento.Cve_Segmento.AsString = 'PR') Or
           (objeto.Segmento.Cve_Segmento.AsString = 'LQ') Or
           (objeto.Segmento.Cve_Segmento.AsString = 'CP') Then
           Begin
             gpPerfilCuestionario.Visible := False;
           End;  *}
    End;
  End;
end;

procedure TWContrato.btUnNegocioClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('CTTO_UNNEGOCIO',True,True) Then
  Begin
    IF objeto.Empresa.Active then
      objeto.UnNegocio.BuscaWhereString := 'UN_NEG.CVE_TIPO_ENTIDAD = ''SUCU'' AND UN_NEG.ID_EMPRESA = ' + objeto.Empresa.Id_Persona.AsString
    else
      objeto.UnNegocio.BuscaWhereString := 'UN_NEG.CVE_TIPO_ENTIDAD = ''SUCU'' ';
    objeto.UnNegocio.Busca;
  End;
end;

procedure TWContrato.sbContratoLiqClick(Sender: TObject);
Var Cto:TContrato;
begin
  If Objeto.ValidaAccesoEsp('CTTO_CONTRATOLIQ',True,True) Then
  Begin
    if objeto.Titular.Active=False then begin
       MessageDlg('Debe de Seleccionar un Titular',mtError,[mbOK],0);
       exit;
    end;

    Cto:=TContrato.Create(objeto);
    Try
      Cto.GetParams(objeto);
      if objeto.Cve_Tip_Contrato.AsString = 'FIDE'  then
         //Cto.BuscaWhereString:='((CONTRATO.CVE_TIP_CONTRATO=''CDVI'') or (CONTRATO.CVE_TIP_CONTRATO=''IDVI'') or (CONTRATO.CVE_TIP_CONTRATO=''BDVI''))'
         Cto.BuscaWhereString:=' (Id_Empresa, Cve_Producto) in ( Select Id_Empresa, Cve_Producto ' +
                                                               ' From Cto_Config_Prod ' +
                                                               ' Where B_Cto_Liq = ''V'' ) )'
      else
         //Cto.BuscaWhereString:='((CONTRATO.CVE_TIP_CONTRATO=''CDVI'')  or (CONTRATO.CVE_TIP_CONTRATO=''IDVI'') or (CONTRATO.CVE_TIP_CONTRATO=''BDVI'')) AND (CONTRATO.ID_TITULAR='+objeto.Titular.ID_Persona.AsString+')';
         Cto.BuscaWhereString:=' (Contrato.Id_Empresa, Contrato.Cve_Producto) in ' +
                               '        ( Select Id_Empresa, Cve_Producto ' +
                               '          From Cto_Config_Prod ' +
                               '          Where B_Cto_Liq = ''V'' ) ' +
                               ' AND Contrato.Id_Titular = ' + objeto.Titular.Id_Persona.AsString;

      Cto.MasterSourceEnabled:=False;
      Cto.Busca;
      if Cto.Active then
        objeto.Id_Cto_Liq.AsString:= Cto.ID_Contrato.AsString;
    Finally
      Cto.Free;
    end;
  End;
end;


procedure TWContrato.InterForma1CanEdit(Sender: TObject; CanEdit: Boolean);
begin
  if CanEdit then
  begin
     if not InterForma1.IsNewData then begin
     end;
     edIdContrato.ReadOnly := True;
     edIdContrato.Color := clBtnFace;
     edFBaja.ReadOnly := True;
     edFBaja.Color := clBtnFace;
     DatePicker2.Enabled := False;
     edReact.ReadOnly := True;
     edReact.Color := clBtnFace;
     DatePicker4.Enabled := False;
  end
  else
  begin
     edIdContrato.ReadOnly := True;
     edIdContrato.Color := clBtnFace;
     edFBaja.ReadOnly := True;
     edFBaja.Color := clBtnFace;
     DatePicker2.Enabled := False;
     edReact.ReadOnly := True;
     edReact.Color := clBtnFace;
     DatePicker4.Enabled := False;
  end;
end;

function TContrato.Existe_OrigenRecursos(pIdContrato : String; pIdOrigenRec : String) : String; // CZR 13-feb-2013
var
   Qry        : TQuery;
   vResultado : String;
begin
   vResultado := 'F';
   try
      Qry := GetSQLQuery('SELECT * '
                       + '  FROM CTO_ORIGEN_RECURSOS '
                       + ' WHERE ID_CONTRATO   = ' + Trim(pIdContrato)
                       + '   AND ID_ORIGEN_REC = ' + Trim(pIdOrigenRec),
                         SeguDataBaseName, SeguSessionName, True);
      if Qry <> nil then
         vResultado := 'V';
   finally
      if Qry <> nil then
      begin
         Qry.Close;
         Qry.Free;
      end;
   end;
   result := vResultado;
end;

function TContrato.TieneAcceso(pAcceso : String) : Boolean;
var
   vResultado : Boolean;
begin
   try
      vResultado := GetSQL('select *'
                         + '  from secu_oper_acc'
                         + ' where cve_funcion  = ' + QuotedStr('CLASE_' + UpperCase(Self.ClassName))
                         + '   and cve_usuario  = ' + QuotedStr(UpperCase(Self.DameUsuario))
                         + '   and cve_oper_acc = ' + QuotedStr(pAcceso),
                           SeguDataBaseName, SeguSessionName, False);
   except
      vResultado := False;
   end;
   result := vResultado;
end;

function TContrato.ValidaTitularPLD(pAccion : String; pMostrarCat : Boolean = True) : Boolean;
var
   PerTitular  : TPersona;
   vMostrarCat : Boolean;
   vResult     : Boolean;
begin
   vMostrarCat := True;
   vResult     := True;
   try
      try
         PerTitular := TPersona.Create(self);
         PerTitular.GetParams(self); 
         if Producto.Active then
         begin
            if trim(Producto.Cve_Per_Jur_Prod.AsString) = cPerFisica then
               PerTitular.FilterBy := fbTMPersonaFisica
            else
               PerTitular.FilterBy := fbTMPersonaMoral;
         end;
         PerTitular.FindKey([Titular.ID_Persona.AsInteger]);

         // Validar captura de Registro CONDUSEF
         if (trim(Concepto.B_CONDUSEF.AsString)                         = cVerdadero) or // Concepto Contrato
            (trim(Actividad.TipoCliente.B_CONDUSEF.AsString)            = cVerdadero) or // Sector/Actividad Contrato
            (trim(Actividad.Residencia.B_CONDUSEF.AsString)             = cVerdadero) or
            (trim(Actividad.TipoSector.B_CONDUSEF.AsString)             = cVerdadero) or
            (trim(Actividad.Sector.B_CONDUSEF.AsString)                 = cVerdadero) or
            (trim(Actividad.SubSector.B_CONDUSEF.AsString)              = cVerdadero) or
            (trim(Actividad.Rama.B_CONDUSEF.AsString)                   = cVerdadero) or
            (trim(Actividad.SubRama.B_CONDUSEF.AsString)                = cVerdadero) or
            (trim(Actividad.Inciso.B_CONDUSEF.AsString)                 = cVerdadero) or
            (trim(PerTitular.Actividad.TipoCliente.B_CONDUSEF.AsString) = cVerdadero) or // Sector/Actividad Titular
            (trim(PerTitular.Actividad.Residencia.B_CONDUSEF.AsString)  = cVerdadero) or
            (trim(PerTitular.Actividad.TipoSector.B_CONDUSEF.AsString)  = cVerdadero) or
            (trim(PerTitular.Actividad.Sector.B_CONDUSEF.AsString)      = cVerdadero) or
            (trim(PerTitular.Actividad.SubSector.B_CONDUSEF.AsString)   = cVerdadero) or
            (trim(PerTitular.Actividad.Rama.B_CONDUSEF.AsString)        = cVerdadero) or
            (trim(PerTitular.Actividad.SubRama.B_CONDUSEF.AsString)     = cVerdadero) or
            (trim(PerTitular.Actividad.Inciso.B_CONDUSEF.AsString)      = cVerdadero) then
         begin
            if trim(PerTitular.CONDUSEF.AsString) = '' then
               raise EInterFrame.Create('Para ' + trim(pAccion) + ' el contrato es necesario capturar el registro ante la CONDUSEF del Titular');
            if trim(Concepto.B_CONDUSEF.AsString) = cFalso then
            begin
               vMostrarCat := False;
               raise EInterFrame.Create('No coincide la actividad del ID Persona contra el Concepto capturado en el Contrato, favor de homologar');
            end;
         end
         else // Por peticion de Victor Hugo Reyes Rodriguez, se valida el GIIN solo cuando no valida Registro CONDUSEF
         begin
            if (trim(Concepto.B_GIIN.AsString) = cVerdadero) and (trim(PerTitular.GIIN.AsString) = '') then // Validar captura de GINN
               raise EInterFrame.Create('Para ' + trim(pAccion) + ' el contrato es necesario capturar el GIIN del Titular');
         end;      
      except
         on e: EInterFrame do
         begin
            MessageDlg(e.Message, mtInformation, [mbOK], 0);
            if (pMostrarCat) and (vMostrarCat) then
            begin
               PerTitular.DespuesLocaliza(Self);
               PerTitular.ShowWindow(ftModifica);
            end;
            vResult := False;
         end;
      end;
   finally
      PerTitular.Free;
   end;
   Result := vResult;
end;

function TContrato.ValidaCttePLD(pAccion : String) : Boolean; // CZR 26-nov-2014
var
   DatFisUbiCte : TDatFisUbiCte;
   vResult      : Boolean;
begin
   vResult := True;
   try
      try
         DatFisUbiCte := TDatFisUbiCte.Create(self);
         DatFisUbiCte.GetParams(self);
         DatFisUbiCte.pIdContrato := ID_Contrato.AsInteger;
         // Valida si estan cubiertos los Datos Fiscales de Ubicacion o Residencia
         if GetSQL('select *'
                 + '  from contratante        cte'
                 + '       inner join persona per on per.id_persona = cte.id_persona'
                 + ' where cte.id_contrato     = ' + IntToStr(ID_Contrato.AsInteger)
                 + '   and cte.sit_contratante = ' + QuotedStr(cActivo)
                 + '   and per.sit_persona     = ' + QuotedStr(cActivo)
                 + '   and per.cve_residencia   not in(' + QuotedStr(cPaisEUA) + ')'
                 + '   and per.cve_nacionalidad not in(' + QuotedStr(cPaisEUA) + ', ' + QuotedStr(cPaisMexico) + ')'
                 + '   and per.no_id_fiscal_ext is null',
                   SeguDataBaseName, SeguSessionName, False) then
         begin
            raise EInterFrame.Create('Para ' + trim(pAccion) + ' el contrato es necesario capturar el Número de Identificación Fiscal Extranjero en los Contratantes');
         end;
         if GetSQL('select *'
                 + '  from contratante        cte'
                 + '       inner join persona per on per.id_persona = cte.id_persona'
                 + ' where cte.id_contrato     = ' + IntToStr(ID_Contrato.AsInteger)
                 + '   and cte.sit_contratante = ' + QuotedStr(cActivo)
                 + '   and per.sit_persona     = ' + QuotedStr(cActivo)
                 + '   and per.cve_residencia   not in(' + QuotedStr(cPaisEUA) + ')'
                 + '   and per.cve_nacionalidad not in(' + QuotedStr(cPaisEUA) + ', ' + QuotedStr(cPaisMexico) + ')'
                 + '   and per.cve_pais_exp is null',
                   SeguDataBaseName, SeguSessionName, False) then
         begin
            raise EInterFrame.Create('Para ' + trim(pAccion) + ' el contrato es necesario seleccionar el Pais de Expedicion del Número de Identificación Fiscal Extranjero en los Contratantes');
         end;
      except
         on e: EInterFrame do
         begin
            MessageDlg(e.Message, mtInformation, [mbOK], 0);
            DatFisUbiCte.ShowWindow(ftImprimir);
            vResult := False;
         end;
      end;
   finally
      DatFisUbiCte.Free;
   end;
   Result := vResult;
end;

Procedure TContrato.ValidaIdFiscalCttes; // Luis Hernandez Mar 2016
Var
  DatFisUbiCte : TDatFisUbiCte;
Begin
  Try
    DatFisUbiCte := TDatFisUbiCte.Create(self);
    DatFisUbiCte.GetParams(self);
    DatFisUbiCte.pIdContrato := ID_Contrato.AsInteger;
    try
      If GetSQL('SELECT * FROM TABLE(PkgCorporativo.getContratoNoIdFiscal(' + ID_Contrato.AsString +' ))',
               SeguDataBaseName, SeguSessionName, False) then
      Begin
        MessageDlg('Existen Contratantes a los que les falta capturar Identificaciones Fiscales', mtInformation, [mbOK], 0);
        DatFisUbiCte.ShowWindow(ftImprimir);
      End;
    except
      on E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  Finally
    if DatFisUbiCte <> nil then DatFisUbiCte.Free;   DatFisUbiCte := nil;
  End;
End; // End Procedure

procedure TWContrato.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
Var
  Pre,
  Ctto                : String;
  Falta               : Integer;
  CveUsuarioINET_SIVA : String;
  dbSivaCtto          : TDataBase;
  strSql              : String;
  strSqlMail          : String;
  objRecSet           : TQuery;
  vMonto              : Extended;
  vIdProspecto        : String; // CZR 10-mar-2009
  vOriRec             : String; // CZR 10-mar-2009

  respVal             : boolean;
  //JHMM
  vlQueryCmd          : TQuery;
  strRes              : String;
  strdesc             : String;
  vlQueryCmdAux       : Tquery;
  strPass             : String;
  strSqlEDC           : String;
  qValidaPromotor     : TQuery;
  qValidaCuest        : TQuery;
  pResCambiPerf       : Integer;

Begin
  vIdProspecto := '0';     // CZR 10-mar-2009
  vOriRec      := '0';     // CZR 10-mar-2009
  strRes       := '';
  strSqlMail   := '';

  if IsNewData then begin
    Realizado := False;
    tipoOper  := False ;
    { envio mail edc }
    respVal:=false;
    //objeto.ServsAsesorados.GetFromControl;
    //objeto.ServsNoAsesorados.GetFromControl;

    if edCveServicioFin.Text <> '' then Begin
      If edCveTipCte.Text = '' then Begin
        Realizado := False;
        MessageDlg('Debe de proporcionar un sub-servicio',mtError,[mbOK],0);
        InterForma1.ShowError:=False;
        exit;
      End;
    End;

    if (chkCreaIFS.Checked ) then begin
      if MessageDlg('¿Está seguro de que desea crear y asociar un contrato 201 con este contrato?',
                    mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
        Realizado:=False;
        exit;
      end;
    end;

    if objeto.cveCorreo<>'' Then begin
      respVal := ExecRegExpr('[\w\d\-\.]+@[\w\d\-]+(\.[\w\d\-]+)+', objeto.cveCorreo);
      if not respVal Then begin
        Realizado := False;
        MessageDlg('Debe de proporcionar un correo valido.',mtError,[mbOK],0);
        InterForma1.ShowError:=False;
        exit;
      end;
    end;
    { Producto }
    if Not objeto.Producto.Active then begin
      Realizado := False;
      MessageDlg('Debe de Seleccionar un Producto.',mtError,[mbOK],0);
      InterForma1.ShowError:=False;
      exit;
    end;
    { Concepto }
    if Not objeto.Concepto.Active then begin
      Realizado := False;
      MessageDlg('Debe de Seleccionar el Concepto del Contrato.',mtError,[mbOK],0);
      InterForma1.ShowError:=False;
      exit;
    end;
    { Número de Contrato }
    Ctto:=Trim(edIdContrato.Text);
    if Ctto='' then begin
      MessageDlg('Debe de Teclear un Número de Contrato.',mtError,[mbOK],0);
      InterForma1.ShowError:=False;
      exit;
    end;
    { Titular }
    if Not objeto.Titular.Active then begin
      Realizado:=False;
      MessageDlg('Debe de Seleccionar un Titular.',mtError,[mbOK],0);
      InterForma1.ShowError:=False;
       exit;
    end;
    { Domicilio }
    if Not objeto.Domicilio.Active then begin
      Realizado:=False;
      MessageDlg('Debe de Seleccionar un Domicilio.',mtError,[mbOK],0);
      InterForma1.ShowError := False;
      exit;
    end;
    { Grupo de Contrato }
    if Not objeto.Grupo.Active then begin
      Realizado:= False;
      MessageDlg('Debe seleccionar un Promotor para el contrato.',mtError,[mbOK],0);
      InterForma1.ShowError := False;
      exit;
    end;
    { Segmento }
    if Not objeto.Segmento.Active then begin
      Realizado:= False;
      MessageDlg('Debe seleccionar un Segmento para el contrato.',mtError,[mbOK],0);
      InterForma1.ShowError := False;
      exit;
    end;
    { Clave de Correspondencia }
    objeto.Cve_Corresp.GetFromControl;
    if objeto.Cve_Corresp.AsString = '' then begin
      Realizado:= False;
      MessageDlg('Debe seleccionar un Tipo de Correspondencia.',mtError,[mbOK],0);
      InterForma1.ShowError := False;
      exit;
    end;
    { Tipo de Cuenta }
    objeto.Cve_Tipo_Cta.GetFromControl;
    if objeto.Cve_Tipo_Cta.AsString = '' then begin
      Realizado:= False;
      MessageDlg('Debe seleccionar un Tipo de Cuenta.',mtError,[mbOK],0);
      InterForma1.ShowError := False;
      exit;
    end;
    { Unidad de Negocio }
    if Not objeto.UnNegocio.Active then begin
      Realizado := False;
      MessageDlg('Debe de Seleccionar una Unidad de Negocio.',mtError,[mbOK],0);
      InterForma1.ShowError:=False;
      exit;
    end;

    objeto.Cve_Tipo_Cta.GetFromControl;
   { Folio de Cuestionario y Perfil Asignado }
   if gpPerfilCuestionario.Visible then begin
     objeto.Id_Evaluacion.GetFromControl;
     if objeto.Id_Evaluacion.AsString = '' then begin
       Realizado := False;
       MessageDlg('Debe seleccionar un Folio de Cuestionario.',mtError,[mbOK],0);
       InterForma1.ShowError := False;
       exit;
     end;

     objeto.Id_Tipo_Perfil.GetFromControl;
     if objeto.Id_Tipo_Perfil.AsString = '' then begin
       Realizado := False;
       MessageDlg('Debe Asignar un Tipo de Perfil.',mtError,[mbOK],0);
       InterForma1.ShowError := False;
       exit;
     end;
   end
   //rohs4279 nov/2015 req. PMO150817
   else Begin
     If ((Objeto.Cve_Tip_Contrato.AsString = 'CIBC') Or (Objeto.Cve_Tip_Contrato.AsString = 'OMSC') Or
        (Objeto.Cve_Tip_Contrato.AsString = 'IFON')) And
        ((cbTipoCuenta.Text <> 'ADMINISTRATIVO') And (chkCI.Checked = False ) And
          {(chkCteSofisticado.Checked   = False )   And}
         (Objeto.Cve_Segmento.AsString <> 'PR') And (Objeto.Cve_Segmento.AsString <> 'CP') And
         (Objeto.Cve_Segmento.AsString <> 'LQ') And
         (Objeto.TipoServicio.CVE_TIP_CTE.AsString <> 'EJEOPE')) then Begin
//        gpPerfilCuestionario.Visible := True;
//        vResultado := True;
     End
     Else Begin
       Objeto.Id_Evaluacion.AsInteger  := -1;
       Objeto.Id_Tipo_Perfil.AsInteger := -1;
       objeto.Cve_Tipo_Cta.GetFromControl;
       objeto.Id_Tipo_Perfil.GetFromControl;
     End;
   end;

     {RAPA
     if((objeto.Cve_Tip_Contrato.asString = 'INPA') or (objeto.Cve_Tip_Contrato.asString = 'INIF') or
       (objeto.Cve_Tip_Contrato.asString = 'BPAG')) and (Trim(objeto.Id_Cto_Liq.AsString) = '') then
}
    { Contrato de Liquidación }
    If (objeto.ConfigCaptura.B_Val_Cto_Liq.AsString = 'V') and
       (Trim(objeto.Id_Cto_Liq.AsString) = '') Then begin
      Realizado:=False;
      MessageDlg('El Contrato Requiere de un Contrato de Liquidación.',mtError,[mbOK],0);
      InterForma1.ShowError:=False;
      exit;
    end;//if

    // CONTRATOS DE INTERNET
    if(objeto.Cve_Tip_Contrato.asString = 'INET') then begin
      // CZR 05-ago-2010
      Objeto.Cve_Usuario.GetFromControl;
      if trim(Objeto.Cve_Usuario.AsString) = '' then begin
        Objeto.Cve_Usuario.AsString := Objeto.ObtenerRFC + copy(EdIdContrato.text, (length(EdIdContrato.text) - 3), length(EdIdContrato.text));
        Objeto.Cve_Usuario.DrawControl;
      end;

      if(Trim(edCveUsuario.Text) = '') then begin
        Realizado:=False;
        MessageDlg('El Contrato de Internet Requiere la Clave del Usuario.',mtError,[mbOK],0);
        InterForma1.ShowError:=False;
        exit;
      end//if
      else begin
        CveUsuarioINET_SIVA := '';
        GetSqlStr('Select Cve_Usuario from Net_Contrato Where Cve_Usuario = '''+ edCveUsuario.Text + '''',
                  objeto.ApNet.DataBaseName, objeto.ApNet.SessionName, 'CVE_USUARIO', CveUsuarioINET_SIVA, False);
        if CveUsuarioINET_SIVA = edCveUsuario.Text then begin
          Realizado:=False;

          // CZR 05-ago-2010
//           MessageDlg('La Clave de Usuario de internet está duplicado. Por favor seleccione otra clave.',mtError,[mbOK],0);
          MessageDlg('La Clave de Usuario de internet está duplicada. Se actualizara automaticamente intente de nuevo.', mtInformation, [mbOK], 0);
          Objeto.FormatearUsrINET;

          InterForma1.ShowError:=False;
          exit;
        end//if
        else begin
          dbSivaCtto:= TDataBase.Create(nil);
          Try
            dbSivaCtto.DriverName := 'ORACLE';
            dbSivaCtto.DatabaseName := 'SIVA_CTTO';
            dbSivaCtto.SessionName := '';
            dbSivaCtto.Params.Clear;
            //CREACION DE LA BASE SIVA
            if ParamStr(1) = 'P' then begin
//RAPA4293
//                    dbSivaCtto.Params.Add('SERVER NAME=PSIVA');
              dbSivaCtto.Params.Add('PASSWORD=DEVELOP');
            end//if
            else begin
//RAPA429
//                    dbSivaCtto.Params.Add('SERVER NAME=DSIVA');
              dbSivaCtto.Params.Add('PASSWORD=DESARROLLO');
            end;//else
            dbSivaCtto.Params.Add('SERVER NAME=' + ParamStr(1) + 'MCAP');
            dbSivaCtto.Params.Add('USER NAME=SISTEMAS');
            dbSivaCtto.Params.Add('LANGDRIVER=DBWINWE0');
            dbSivaCtto.KeepConnection:= True;
            dbSivaCtto.LoginPrompt := False;
            dbSivaCtto.Connected := True;
            Try
              CveUsuarioINET_SIVA:= '';
              GetSqlStr('Select Cve_Usuario from Siv_Usuario where Cve_Usuario = '''+ edCveUsuario.Text + '''',
                        dbSivaCtto.DataBaseName, dbSivaCtto.SessionName,'CVE_USUARIO',CveUsuarioINET_SIVA,False);
              if CveUsuarioINET_SIVA = edCveUsuario.Text then begin
                Realizado:=False;

                      // CZR 05-ago-2010
//                    MessageDlg('La clave de usuario de internet está duplicado. Por favor seleccione otra clave.',mtError,[mbOK],0);
                MessageDlg('La Clave de Usuario de internet está duplicada. Se actualizara automaticamente intente de nuevo.', mtInformation, [mbOK], 0);
                Objeto.FormatearUsrINET;

                InterForma1.ShowError:=False;
                exit;
              end;
            Except
              Realizado:=False;
              MessageDlg('Ocurrió un error al revisar el usuario de Internet. Consulte a su administrador',mtError,[mbOK],0);
              InterForma1.ShowError:=False;
              exit;
            end;
          Finally
            dbSivaCtto.Connected := False;
            if dbSivaCtto<> nil then
              dbSivaCtto.Free;
          end;//Try & Finally
        end;//if
      end;//if
    end;//if

     { if(chkCreaIFS.Checked) then
        objeto.B_ICreaIFS.SetAsBoolean(True)
     else
       objeto.B_ICreaIFS.SetAsBoolean(False);}

     //MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES
    Objeto.GetFromControl;
    If (objeto.ConfigCaptura.B_SOBREGIRO.AsString = 'V') and
       (Trim(objeto.B_SOBREGIRO.AsString) = '') Then begin
      Realizado:=False;
      MessageDlg('Debe indicar si el Cliente tiene permitido el Sobregiro',mtError,[mbOK],0);
      InterForma1.ShowError:=False;
      exit;
    end;//if
    If (objeto.ConfigCaptura.B_CTO_PRLV.AsString = 'V') and
       (Trim(objeto.ID_CTO_PRLV.AsString) = '') Then begin
      Realizado:=False;
      MessageDlg('El Contrato Requiere ser Asociado a un Contrato de PRLV',mtError,[mbOK],0);
      InterForma1.ShowError:=False;
      exit;
    end;//if
    If (objeto.ConfigCaptura.B_CTO_FDOS.AsString = 'V') and
       (Trim(objeto.ID_CTO_FDOS.AsString) = '') Then begin
      Realizado:=False;
      MessageDlg('El Contrato Requiere ser Asociado a un Contrato de Fondos de Inversión',mtError,[mbOK],0);
      InterForma1.ShowError:=False;
      exit;
    end;//if
    If (objeto.ConfigCaptura.B_FANIVERSARIO.AsString = 'V') and
       (Trim(objeto.F_ANIVERSARIO.AsString) = '') Then begin
      Realizado:=False;
      MessageDlg('El Contrato Requiere se indique una Fecha de Aniversario',mtError,[mbOK],0);
      InterForma1.ShowError:=False;
      exit;
    end;//if
    If (objeto.ConfigCaptura.B_COMISION.AsString = 'V') and
       (Trim(objeto.CVE_TP_COMISION.AsString) = '') Then begin
      Realizado:=False;
      MessageDlg('El Contrato Requiere se indique el Tipo de Comisión',mtError,[mbOK],0);
      InterForma1.ShowError:=False;
      exit;
    end;//if
    //MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES

    // --> CZR 24-feb-2009     Valida Prospecto y Origen de Recursos en caso de ser necesario
    if trim(Objeto.ConfigCaptura.B_VAL_PRECALIFICA.AsString) = 'V' then begin
      if objeto.ID_Prospecto.AsInteger = 0 then begin
        Realizado:= False;
        MessageDlg('Debe Seleccionar un Prospecto.', mtError, [mbOK], 0);
        InterForma1.ShowError:= False;
        exit;
      end;
        {else
        begin
           // Validar el Origen de Recursos
           GetSqlStr('Select ID_ORIGEN_REC From PR_V_DATGRALBASICOS Where ID_PROSPECTO = ' + IntToStr(objeto.ID_Prospecto.AsInteger),
                     objeto.DataBaseName, objeto.SessionName, 'ID_ORIGEN_REC', vOriRec, False);
           if trim(vOriRec) = '' then
              vOriRec := '0';

           // Metodo para obtener el Id_Contrato
           Pre   := trim(edPrefijo.Text);
           Ctto  := '00000000000'+Ctto;
           Falta := 9-Length(Pre);
           Ctto  := Pre + Copy(Ctto,(Length(Ctto)-Falta)+1,Falta);
           if objeto.Existe_OrigenRecursos(trim(Ctto), trim(vOriRec)) = 'F' then // CZR 13-feb-2013
           begin
              MessageDlg('El Origen de Recursos ' + trim(vOriRec) + ' del Prospecto, debe darse de Alta en el Contrato', mtInformation, [mbOk], 0);
              Realizado             := False;
              InterForma1.ShowError := False;
              exit;
           end;
           objeto.ID_ORIGEN_REC.AsInteger := StrToInt(vOriRec); // CZR 13-feb-2013
        end;}
    end;
    // <-- CZR 24-FEB-09


    // MOAA4820 NOV 2008 MODIFICACION PARA CONFIRMAR MONEDA EXTRANJERA
    if OBJETO.Producto.Cve_Moneda.AsInteger <> 484 then begin
      if MessageDlg('Se dará de alta un contrato en moneda extranjera, ¿desea continuar?',
                    mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
        Realizado:=False;
        MessageDlg('El contrato no se dio de alta',mtInformation,[mbOK],0);
        InterForma1.ShowError:=False;
        exit;
      end;
    end;
    // MOAA4820 NOV 2008 TERMINA MODIFICACION

    // Modificacion para contratos de Inversion para replicar informacion
    if OBJETO.Producto.Cve_Tip_Contrato.AsString = 'INPA' then begin
      if MessageDlg('¿Está seguro de que desea crear este contrato asociado a la chequera: ' + edContratoLiq.Text + '?',
                    mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
        Realizado:=False;
        MessageDlg('El contrato no se dio de alta, favor de verificar la chequera asociada',mtInformation,[mbOK],0);
        InterForma1.ShowError:=False;
        exit;
      end;
    end;
    // Termina modificacion

    Pre:=Trim(edPrefijo.Text);
    Ctto:='00000000000'+Ctto;
    Falta:=9-Length(Pre);
    Ctto:=Pre+Copy(Ctto,(Length(Ctto)-Falta)+1,Falta);
    edContrato.Text:=Ctto;
    Realizado:=True;
    //JHMMNUEVO Envio de edc por email
    Apli  := objeto.Apli;
    //se procede a grabar en la tabla de correos el nuevo contrato y su respectivo correo
    If trim(objeto.cveCorreo)<>'' Then Begin
      strSql := ' INSERT INTO CTO_EMAIL_EDC(id_contrato,correo,clave_correo,enviar,confirmado,f_confirmacion,id_producto,f_captura,imp_pass) VALUES('+trim(edContrato.text) +','+chr(39)+objeto.cveCorreo+chr(39)+',NULL,'+chr(39)+'V'+chr(39)+','+chr(39)+'F'+chr(39)+',NULL,0,sysdate,'+chr(39)+'F'+chr(39)+')';
      strSqlEDC := 'INSERT INTO edc_email_detalle(cve_operacion,id_contrato,fecha_operacion,usuario,periodo) VALUES('+chr(39)+'EQ'+chr(39)+','+trim(edContrato.text) +',sysdate,'+chr(39)+objeto.Apli.Usuario+chr(39)+'to_char(sysdate,'+chr(39)+'yyyyMM'+chr(39)+'))';
      if ValidarInsertMail(trim(edContrato.text)) <= 0 Then Begin
        vlQueryCmd              := TQuery.Create(Nil);
        vlQueryCmd.SessionName  := objeto.SessionName;
        vlQueryCmd.DatabaseName := objeto.DataBaseName;
        vlQueryCmd.SQL.Clear;
        vlQueryCmd.Close;
        vlQueryCmd.SQL.Add(strSql);
        vlQueryCmd.ExecSQL;
        vlQueryCmd.Close;
        vlQueryCmd.Free;
        //Inserta bitacora
        vlQueryCmd              := TQuery.Create(Nil);
        vlQueryCmd.SessionName  := objeto.SessionName;
        vlQueryCmd.DatabaseName := objeto.DataBaseName;
        vlQueryCmd.SQL.Clear;
        vlQueryCmd.Close;
        vlQueryCmd.SQL.Add(strSqlEDC);
        vlQueryCmd.ExecSQL;
        vlQueryCmd.Close;
        vlQueryCmd.Free;
        //Fin de Bitacora
        //Proceder a obtener la descripcion del periodo para mandarla en el correo
        strSql := ' SELECT desc_Periodo  Periodo  FROM hist_periodo@hist WHERE Ano_mes= (SELECT trim(TO_CHAR(f_referencia,'+chr(39)+'YYYYMM'+chr(39)+')) Periodo ';
        strSql := strSql + 'FROM FECHA_EMPRESA WHERE cve_dia_liquida='+chr(39)+'FMAN'+chr(39)+' AND id_empresa=1)';

        vlQueryCmd              := TQuery.Create(Nil);
        vlQueryCmd.SessionName  := objeto.SessionName;
        vlQueryCmd.DatabaseName := objeto.DataBaseName;
        vlQueryCmd.SQL.Clear;
        vlQueryCmd.Close;
        vlQueryCmd.SQL.Add(strSql);
        vlQueryCmd.open   ;

        if not vlQueryCmd.IsEmpty then begin
          strRes := vlQueryCmd.FieldByName('Periodo').AsString;
        end;

        vlQueryCmd.Close;
        vlQueryCmd.Free;

        //Se procede a enviar el mail
        GeneraMensaje('',trim(edContrato.text),objeto.cveCorreo,strRes);
        //JHMM Envio de edc por email
        objeto.cveCorreo := '';
        objeto.pass := '';
      end;
    end;
  end
  {=============================================}
  else begin   {Modificacion}
  {=============================================}
    if edCveServicioFin.Text <> '' then Begin
      If edCveTipCte.Text = '' then Begin
        Realizado := False;
        MessageDlg('Debe de proporcionar un sub-servicio',mtError,[mbOK],0);
        InterForma1.ShowError:=False;
        exit;
      End;
    End;

   if vB_AperturaRec and vB_AsignacionCtoApRec then
     if not fEsPromotor then begin
       MessageDlg(Format('Imposible guardar los cambios.'
                         +#13+#10+'La persona del usuario %s, no se encuentra '+
                         'como promotor en GPO_CONTRATO.', [objeto.DameUsuario]), mtWarning, [mbOK], 0);
       Abort;
     end;

    if( chkCreaIFS.Checked  )  and ( chkCreaIFS.Enabled ) then begin
      if MessageDlg('¿Está seguro de que desea crear y asociar un contrato 201 con este contrato?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
        Realizado:=False;
        exit;
      end;
    end;

    { Folio de Cuestionario y Perfil Asignado }
{    if gpPerfilCuestionario.Visible then begin   //original rohs4279
      objeto.Id_Evaluacion.GetFromControl;
      if objeto.Id_Evaluacion.AsString <> '' then begin
        objeto.Id_Tipo_Perfil.GetFromControl;
        if objeto.Id_Tipo_Perfil.AsString = '' then begin
          Realizado := False;
          MessageDlg('Debe Asignar un Perfil.',mtError,[mbOK],0);
          InterForma1.ShowError := False;
          exit;
        end;
      end;
    end;}
    if gpPerfilCuestionario.Visible then begin                                 //rohs4279 nov/2015 req. PMO150817
      objeto.Id_Evaluacion.GetFromControl;
      if objeto.Id_Evaluacion.AsString = '' then begin
        Realizado := False;
        MessageDlg('Debe asignar un Folio de Cuestionario.', mtError, [mbOK], 0);
        InterForma1.ShowError := False;
        exit;
      end;
      objeto.Id_Tipo_Perfil.GetFromControl;
      if objeto.Id_Tipo_Perfil.AsString = '' then begin
        Realizado := False;
        MessageDlg('Debe Asignar un Tipo de Perfil.', mtError, [mbOK], 0);
        InterForma1.ShowError := False;
        exit;
      end;
    end;

    { Unidad de Negocio }
    if Not objeto.UnNegocio.Active then begin
      Realizado := False;
      MessageDlg('Debe de Seleccionar una Unidad de Negocio.',mtError,[mbOK],0);
      InterForma1.ShowError:=False;
      exit;
    end;

    //Valido si se trata de Cliente Institucional o si el subservicio es EJEOPE rohs4279 nov/2015 req. PMO150817
    If ((Objeto.Cve_Tip_Contrato.AsString = 'CIBC') Or (Objeto.Cve_Tip_Contrato.AsString = 'OMSC') Or
       (Objeto.Cve_Tip_Contrato.AsString = 'IFON')) And
       ((cbTipoCuenta.Text <> 'ADMINISTRATIVO') And (chkCI.Checked = False ) And
         {(chkCteSofisticado.Checked   = False )   And}
        (Objeto.Cve_Segmento.AsString <> 'PR') And (Objeto.Cve_Segmento.AsString <> 'CP') And
        (Objeto.Cve_Segmento.AsString <> 'LQ') And
        (Objeto.TipoServicio.CVE_TIP_CTE.AsString <> 'EJEOPE')) then Begin
//       gpPerfilCuestionario.Visible := True;
//       vResultado := True;
    End
    Else Begin
      Objeto.Id_Evaluacion.AsInteger  := -1;
      Objeto.Id_Tipo_Perfil.AsInteger := -1;
      objeto.Cve_Tipo_Cta.GetFromControl;
      objeto.Id_Tipo_Perfil.GetFromControl;
    end;

    {SACA4984-062014}
    // Validacion si el estatus del cuestionario no esta AU - Autorizado mostrar el mensaje de que el
    // perfil asignado sera 101 -> I-BASICO
    if objeto.Sit_Contrato.ComboDatos.Strings[rgSituacion.ItemIndex] = 'AC' then begin
      {llamar funcion de Validaciones de Perfil}
      If (gpPerfilCuestionario.Visible = True) Then Begin                      //rohs4279 nov/2015 req. PMO150817
        if Objeto.vg_Perfil <> Objeto.Id_Tipo_Perfil.AsInteger then Begin
          strSql := Verifica_Configuracion_Documentos(2,
                                                      objeto.Id_Tipo_Perfil.AsString,
                                                      Objeto.ID_Contrato.AsInteger);
//        if (validacionesPerfil() = False) Then Begin
          if strSql = 'F' Then Begin
            Realizado  := False;
            MessageDlg('Falta Documentación para el Tipo de Perfil, ¡Verificar!', mtError, [mbOK], 0);
            InterForma1.ShowError := False;
            exit;
          End;
        end;
      End;
      if (Objeto.TipoServicio.CVE_TIP_CTE.AsString <> 'EJEOPE') then Begin
        if Objeto.vg_subserv <> Objeto.TipoServicio.CVE_TIP_CTE.AsString then Begin
          strSql := Verifica_Configuracion_Documentos(3,
                                                      Objeto.TipoServicio.CVE_TIP_CTE.AsString,
                                                      Objeto.ID_Contrato.AsInteger);
//        if (validacionesPerfil() = False) Then Begin
          if strSql = 'F' Then Begin
            Realizado  := False;
            MessageDlg('Falta Documentación para el Tipo de Subservicio, ¡Verificar!', mtError, [mbOK], 0);
            InterForma1.ShowError := False;
            exit;
          End;
        end;
      end;
    end;

    // --> CZR 26-feb-2009
    if (trim(Objeto.ConfigCaptura.B_VAL_PRECALIFICA.AsString) = 'V') And (objeto.ID_Prospecto.AsInteger > 0) then Begin
    //if trim(Objeto.ConfigCaptura.B_VAL_PRECALIFICA.AsString) = 'V' then
       // Si el Prospecto cambio Validar que coincida con el Titular
       {GetSqlStr('Select ID_PROSPECTO From PR_DET_PROSPECTO Where ID_CONTRATO = ' + IntToStr(objeto.ID_Contrato.AsInteger) + ' And SIT_PROSPECTO = ''AC''',
                 objeto.DataBaseName, objeto.SessionName, 'ID_PROSPECTO', vIdProspecto, False);} //Luis Hernandez Abr 2013
      GetSqlStr('Select ID_PROSPECTO From PLD_DET_PROSPECTO@LCORPOC Where ID_CONTRATO = ' +
                IntToStr(objeto.ID_Contrato.AsInteger) + ' And SIT_PROSPECTO = ''AC''',
                objeto.DataBaseName, objeto.SessionName, 'ID_PROSPECTO', vIdProspecto, False);
      if trim(vIdProspecto) = '' then
        vIdProspecto := '0';
      if StrToInt(vIdProspecto) <> objeto.ID_Prospecto.AsInteger then
        if Verifica_ProspectoTitular = 'F' then begin
          Realizado             := False;
          InterForma1.ShowError := False;
          exit;
        end;

       // Validar el Origen de Recursos
       {GetSqlStr('Select ID_ORIGEN_REC From PR_V_DATGRALBASICOS Where ID_PROSPECTO = ' + IntToStr(objeto.ID_Prospecto.AsInteger),
                 objeto.DataBaseName, objeto.SessionName, 'ID_ORIGEN_REC', vOriRec, False);
       if trim(vOriRec) = '' then
          vOriRec := '0';
       if objeto.Existe_OrigenRecursos(trim(objeto.ID_Contrato.AsString), trim(vOriRec)) = 'F' then // CZR 13-feb-2013
       begin
          MessageDlg('El Origen de Recursos ' + trim(vOriRec) + ' del Prospecto, debe darse de Alta en el Contrato', mtInformation, [mbOk], 0);
          Realizado             := False;
          InterForma1.ShowError := False;
          exit;
       end;
       objeto.ID_ORIGEN_REC.AsInteger := StrToInt(vOriRec);} // CZR 13-feb-2013

       {Objeto.Sit_Contrato.GetFromControl;
       if trim(Objeto.Sit_Contrato.AsString) = 'AC' then
       begin
          if objeto.ID_Prospecto.AsInteger = 0 then
          begin
             MessageDlg('Debe Seleccionar un Prospecto.', mtError, [mbOK], 0);
             Realizado             := False;
             InterForma1.ShowError := False;
             exit;
          end;
          if Verifica_ProspectoTitular = 'F' then
          begin
             Realizado             := False;
             InterForma1.ShowError := False;
             exit;
          end;
          // Validar Origen de Recursos
          GetSqlStr('Select ID_ORIGEN_REC From PR_V_DATGRALBASICOS Where ID_PROSPECTO = ' + IntToStr(objeto.ID_Prospecto.AsInteger),
                    objeto.DataBaseName, objeto.SessionName, 'ID_ORIGEN_REC', vOriRec, False);

          if trim(vOriRec) = '' then
             vOriRec := '0';
          if StrToInt(vOriRec) <> objeto.ID_ORIGEN_REC.AsInteger then
          begin
             MessageDlg('El Origen de Recursos del Prospecto no coincide con el del Contrato', mtError, [mbYes], 0);
             Realizado             := False;
             InterForma1.ShowError := False;
             exit;
          end;
       end;}
    end;
    // <-- CZR 26-feb-2009

    if objeto.B_Restringido.AsString ='' then
      objeto.B_Restringido.AsString  := 'F';
    if objeto.B_Doctos_Verif.AsString='' then
      objeto.B_Doctos_Verif.AsString := 'F';
    objeto.FH_Modificacion.AsString:=FormatDateTime('DD/MM/YYYY HH:MM',Now);

    if objeto.Apli=nil then
      objeto.Cve_Usuar_Modif.AsString:=ObtenUsuario
    else
      objeto.Cve_Usuar_Modif.AsString:=objeto.Apli.Usuario;

    //Cambio la situacion del contrato
    { Valida que el promotor este activo }
    if objeto.Sit_Contrato.ComboDatos.Strings[rgSituacion.ItemIndex] = 'AC' then begin
      if Objeto.Grupo.Sit_Gpo_Contrato.AsString <> 'AC' then begin
        MessageDlg('La dupla Promotor Asociado/Promotor autorizado no está activa.', mtError, [mbOK], 0);
        Realizado             := False;
        InterForma1.ShowError := False;
        exit;
      end;

      qValidaPromotor := TQuery.Create(nil);
      qValidaPromotor.DatabaseName := Objeto.DataBaseName;
      qValidaPromotor.SessionName  := Objeto.SessionName;
      qValidaPromotor.SQL.Clear;
      qValidaPromotor.SQL.Add('SELECT SIT_EMPLEADO FROM EMPLEADO WHERE ID_PERSONA =');
      qValidaPromotor.SQL.Add(Objeto.Grupo.PromAsociado.ID_Persona.AsString);
      qValidaPromotor.Open;
      if qValidaPromotor.FieldByName('SIT_EMPLEADO').AsString <> 'AC' then begin
        MessageDlg('El Promotor Asociado no está activo.', mtError, [mbOK], 0);
        Realizado             := False;
        InterForma1.ShowError := False;
        exit;
      end;

      qValidaPromotor.SQL.Clear;
      qValidaPromotor.SQL.Add('SELECT SIT_EMPLEADO FROM EMPLEADO WHERE ID_PERSONA =');
      qValidaPromotor.SQL.Add(Objeto.Grupo.PromAutorizado.ID_Persona.AsString);
      qValidaPromotor.Open;
      if qValidaPromotor.FieldByName('SIT_EMPLEADO').AsString <> 'AC' then begin
        MessageDlg('El Promotor Autorizado no está activo.', mtError, [mbOK], 0);
        Realizado             := False;
        InterForma1.ShowError := False;
        exit;
      end;
    end;

    if (objeto.SitContratoAnt <> objeto.Sit_Contrato.ComboDatos.Strings[rgSituacion.ItemIndex]) Then Begin
(* RAPA. Feb27,2006 - Las validaciones para inactivar contratos se movieron a PkgCorporativo.ModContrato
      if(rgSituacion.ItemIndex in [1,2]) then {Inactivacion o cancelacion}
      begin
          // inicio bmr 15/06/2000
          strSql:= 'SELECT NVL(IMP_VALUACION,0) IMP_VAL FROM CONTRATO WHERE ID_CONTRATO = ' + objeto.ID_Contrato.AsString;
          objRecSet:= GetSQLQuery(strSql, objeto.DataBaseName, objeto.SessionName, True);
          if objRecSet <> nil then
          begin
             Try
               vMonto:= objRecSet.FieldByName('IMP_VAL').AsFloat;
             Finally
               objRecSet.Free;
             end;
             objRecSet:= nil;
          end;
          // fin bmr 15/06/2000

          if vMonto <> 0 then
          begin
            MessageDlg('Imposible Cancelar o Inactivar el Contrato debido a que el Monto Valuación no es cero',mtError,[mbOK],0);
            InterForma1.ShowError:=False;
            Realizado := False;
            exit;
          end;
      end;
*)
      If Motivo.Active  Then begin
        objeto.Cve_Motivo.AsString:= Motivo.CVE_MOTIVO.AsString;
        objeto.Tx_Motivo.AsString:= edTxInactiva.Text;
      end
      else Begin
        Realizado := False;
        MessageDlg('Imposible modificar el contrato debido a que no ha seleccionado un ' +  tabMotivo.Caption ,mtError,[mbOK],0);
        InterForma1.ShowError:=False;
        exit;
      end;
    end
    else Begin
      objeto.Cve_Motivo.AsString := '';
      objeto.Tx_Motivo.AsString  := '';
    end;

    //Obtengo validación de FATCA/CRS, Tipo_Persona, Giin rohs4279 feb/2016 req. PMO151201
    vlQueryCmd    := TQuery.Create(nil);
    Try
      strSql := 'SELECT * ' +
                 ' FROM TABLE(pkgcorporativo.getfatcatippers( ' + Objeto.ID_Contrato.AsSQL + ')) ';
      vlQueryCmd.SessionName  := objeto.Apli.SessionName;
      vlQueryCmd.DatabaseName := objeto.Apli.DataBaseName;
      vlQueryCmd.Close;
      vlQueryCmd.SQL.Clear;
      vlQueryCmd.SQL.Add(strSql);
      vlQueryCmd.Open;
      strSql    := Emptystr;
      strSqlEDC := Emptystr;
      if Not vlQueryCmd.Fields[0].IsNull then Begin
        vlQueryCmd.First;
        While Not vlQueryCmd.Eof do Begin
          if strSqlEDC <> vlQueryCmd.FieldByName('tipo_reg').AsString then Begin
            if vlQueryCmd.FieldByName('tipo_reg').AsInteger = 1 then
              strSql := strSql + 'Tipo Persona' + #13#10
            else if vlQueryCmd.FieldByName('tipo_reg').AsInteger = 2 then
              strSql := strSql + 'Estatus FATCA/CRS' + #13#10
            else if vlQueryCmd.FieldByName('tipo_reg').AsInteger = 3 then
              strSql := strSql + 'GIIN de estatus FATCA/CRS' + #13#10;
            strSqlEDC := vlQueryCmd.FieldByName('tipo_reg').AsString;
          end;
          strSql := strSql + vlQueryCmd.FieldByName('cve_contratante').AsString + ' | Persona: ' +
                    vlQueryCmd.FieldByName('id_persona').AsString + ' | ' +
                    vlQueryCmd.FieldByName('nombre').AsString + #13#10;
          vlQueryCmd.Next;
        end;
      end;
    Finally
      vlQueryCmd.Close;
      vlQueryCmd.Free;
    end;
    if strSql <> Emptystr then
      ShowMessage('Falta la configuración de los siguientes contratantes: ' + #13#10 + strSql);
  end;//fin de else begin -- modificación

  // CZR 26-nov-2014   Validaciones PLD en Titular
  if not Objeto.ValidaTitularPLD('guardar') then begin
    Realizado             := False;
    InterForma1.ShowError := False;
    exit;
  end;

  // CZR 26-nov-2014   Validaciones PLD en Contratantes
  {if not Objeto.ValidaCttePLD('guardar') then begin
    Realizado             := False;
    InterForma1.ShowError := False;
    exit;
  end;}

  Objeto.ValidaIdFiscalCttes; // Luis Hernandez Mar 2016

  // VALIDACION DE MOTIVO DE CAMBIO DE PROMOTOR
  Objeto.Cve_MotivoProm.GetFromControl;
  objeto.Cve_Gpo_Motivo.GetFromControl;
  if cambProm then begin
    if Objeto.Cve_MotivoProm.AsString = '' then begin
      Realizado := False;
      MessageDlg('Imposible modificar el contrato debido a que no ha seleccionado un motivo de Cambio de Promotor'  ,mtError,[mbOK],0);
      InterForma1.ShowError:=False;
      exit;
    End
  end;

  //Validación actividad economica... solo claves de último nivel
  If objeto.Actividad.Active Then Begin
    if Objeto.Actividad.B_PRESENTA.AsString <> 'V' Then Begin
      Realizado := False;
      MessageDlg('Imposible modificar el contrato.' + chr(VK_RETURN) + 'La clave de actividad económica no esta especificada al último nivel', mtError, [mbOK], 0);
      InterForma1.ShowError:=False;
      exit;
    end;
  end;

  // --> CZR 28-ene-2009     Regimen de Cuenta obligatorio para Contratos de Chequera
  if trim(OBJETO.Producto.Cve_Tip_Contrato.AsString) = 'CDVI' then begin
    if trim(cbCveRegimen.Text) = '' then begin
      Realizado := False;
      MessageDlg('Debe de Seleccionar un Regimen de Cuenta', mtError, [mbOK], 0);
      InterForma1.ShowError := False;
      exit;
    end;
  end;
  // <-- CZR 28-ene-2009
  //JHMMMODIFICAR 30032009
  if (not cbEDC.Checked) and (trim(objeto.cveCorreo)<>'') Then Begin
    //Se elimina el correo electronico
    if trim(edContrato.text)='' Then
      strSql := 'delete from cto_email_edc where id_contrato= '+objeto.ID_Contrato.AsString+' and id_producto=0'
    else
      strSql := 'delete from cto_email_edc where id_contrato= '+trim(edContrato.text)+' and id_producto=0';
    try
      vlQueryCmd              := TQuery.Create(Nil);
      vlQueryCmd.SessionName  := objeto.SessionName;
      vlQueryCmd.DatabaseName := objeto.DataBaseName;
      vlQueryCmd.SQL.Clear;
      vlQueryCmd.Close;
      vlQueryCmd.SQL.Add(strSql);
      vlQueryCmd.ExecSQL;
      objeto.cveCorreo := '';
      objeto.pass := '';
    finally
      vlQueryCmd.Close;
      vlQueryCmd.Free;
    end;
  End;
  //JHMM
  if (cbEDC.Checked) and (trim(objeto.cveCorreo)<>'') Then Begin
    //Recupero el registro actual para compararlo contra el correo recuperado de la ventana de captura
    try
      if trim(edContrato.text)='' Then
        strSql := 'select Correo,Clave_Correo Pass from cto_email_edc where id_contrato= '+objeto.ID_Contrato.AsString+' and id_producto=0'
      else
        strSql := 'select Correo,Clave_Correo Pass from cto_email_edc where id_contrato= '+trim(edContrato.text)+' and id_producto=0';

      vlQueryCmd              := TQuery.Create(Nil);
      vlQueryCmd.SessionName  := objeto.SessionName;
      vlQueryCmd.DatabaseName := objeto.DataBaseName;
      vlQueryCmd.SQL.Clear;
      vlQueryCmd.Close;
      vlQueryCmd.SQL.Add(strSql);
      vlQueryCmd.open   ;
      if not vlQueryCmd.IsEmpty then begin
        strRes := vlQueryCmd.FieldByName('Correo').AsString;
        strPass := vlQueryCmd.FieldByName('Pass').AsString;
      end
      else
        strRes := '' ;
      if (strRes='') and  (objeto.cveCorreo<>'') Then Begin
        strSql := ' INSERT INTO CTO_EMAIL_EDC(id_contrato,correo,clave_correo,enviar,confirmado,f_confirmacion,id_producto,f_captura,imp_pass) VALUES('+trim(edContrato.text) +','+chr(39)+objeto.cveCorreo+chr(39)+',NULL,'+chr(39)+'V'+chr(39)+','+chr(39)+'F'+chr(39)+',NULL,0,sysdate,'+chr(39)+'F'+chr(39)+')';
        strSqlEDC := 'INSERT INTO edc_email_detalle(cve_operacion,id_contrato,fecha_operacion,usuario,periodo) VALUES('+chr(39)+'EQ'+chr(39)+','+trim(edContrato.text) +',sysdate,'+chr(39)+objeto.Apli.Usuario+chr(39)+',to_char(sysdate,'+chr(39)+'yyyyMM'+chr(39)+'))';
        if ValidarInsertMail(trim(edContrato.text)) <= 0 Then Begin
          vlQueryCmd              := TQuery.Create(Nil);
          vlQueryCmd.SessionName  := objeto.SessionName;
          vlQueryCmd.DatabaseName := objeto.DataBaseName;
          vlQueryCmd.SQL.Clear;
          vlQueryCmd.Close;
          vlQueryCmd.SQL.Add(strSql);
          vlQueryCmd.ExecSQL;
          vlQueryCmd.Close;
          vlQueryCmd.Free;
          //Inserta bitacora
          vlQueryCmd              := TQuery.Create(Nil);
          vlQueryCmd.SessionName  := objeto.SessionName;
          vlQueryCmd.DatabaseName := objeto.DataBaseName;
          vlQueryCmd.SQL.Clear;
          vlQueryCmd.Close;
          vlQueryCmd.SQL.Add(strSqlEDC);
          vlQueryCmd.ExecSQL;
          vlQueryCmd.Close;
          vlQueryCmd.Free;
          //Fin de Bitacora

          strDesc := '' ;

          //Inicia Envio de Correo
          //Proceder a obtener la descripcion del periodo para mandarla en el correo
          strSql := ' SELECT desc_Periodo  Periodo  FROM hist_periodo@hist WHERE Ano_mes= (SELECT trim(TO_CHAR(f_referencia,'+
                    chr(39)+'YYYYMM'+chr(39)+')) Periodo ';
          strSql := strSql + 'FROM FECHA_EMPRESA WHERE cve_dia_liquida='+chr(39)+'FMAN'+chr(39)+' AND id_empresa=1)';

          vlQueryCmd              := TQuery.Create(Nil);
          vlQueryCmd.SessionName  := objeto.SessionName;
          vlQueryCmd.DatabaseName := objeto.DataBaseName;
          vlQueryCmd.SQL.Clear;
          vlQueryCmd.Close;
          vlQueryCmd.SQL.Add(strSql);
          vlQueryCmd.open   ;

          if not vlQueryCmd.IsEmpty then begin
            strDesc := vlQueryCmd.FieldByName('Periodo').AsString;
          end;

          //Enviar el mensaje de nuevo correo electronico
          //Se procede a enviar el mail
          GeneraMensaje('',objeto.ID_Contrato.AsString,objeto.cveCorreo,strDesc);
          //JHMM Envio de edc por email
        end;
      end;
      if (objeto.cveCorreo <> strRes) and (strRes <>'') Then Begin
        if (trim(objeto.pass)<>'') and (strpass<>objeto.pass) Then Begin
          //jhmm 15062009
          strSqlMail := 'update cto_email_edc set clave_correo='+chr(39)+objeto.pass+chr(39)+' where correo= '+chr(39)+objeto.cveCorreo+chr(39)+' and id_producto=0';
          if trim(edContrato.text)='' Then Begin
            strSql  := 'update cto_email_edc set correo = '+chr(39)+objeto.cveCorreo+chr(39)+',clave_correo='+chr(39)+objeto.pass+chr(39)+' where id_contrato= '+objeto.ID_Contrato.AsString+' and id_producto=0';
          end
          else begin
            strSql := 'update cto_email_edc set correo = '+chr(39)+objeto.cveCorreo+chr(39)+',clave_correo='+chr(39)+objeto.pass+chr(39)+' where id_contrato= '+trim(edContrato.text)+' and id_producto=0';
          end;
        end
        else Begin
          strSqlMail := '';
          If trim(edContrato.text)='' Then
            strSql := 'update cto_email_edc set correo = '+chr(39)+objeto.cveCorreo+chr(39)+' where id_contrato= '+objeto.ID_Contrato.AsString +' and id_producto=0'
          else
            strSql  := 'update cto_email_edc set correo = '+chr(39)+objeto.cveCorreo+chr(39)+' where id_contrato= '+trim(edContrato.text)+' and id_producto=0';
        end;

        //Se actualiza el correo electronico con la nueva version
        vlQueryCmdAux              := TQuery.Create(Nil);
        vlQueryCmdAux.SessionName  := objeto.SessionName;
        vlQueryCmdAux.DatabaseName := objeto.DataBaseName;
        vlQueryCmdAux.SQL.Clear;
        vlQueryCmdAux.Close;
        vlQueryCmdAux.SQL.Add(strSql);
        vlQueryCmdAux.ExecSQL;
        vlQueryCmdAux.SQL.clear;
        vlQueryCmdAux.Close;
        //jhmm 15062009
        if  trim(strSqlMail) = '' Then Begin
          vlQueryCmdAux.SQL.Add(strSqlMail);
          vlQueryCmdAux.ExecSQL;
          vlQueryCmdAux.Close;
        end;
        vlQueryCmdAux.Free;
      end
      else begin
        if (objeto.cveCorreo<>'') and (strpass<>objeto.pass) and (strPass<>'') Then Begin
          strSqlMail := 'update cto_email_edc set clave_correo='+chr(39)+objeto.pass+chr(39)+' where correo = '+chr(39)+objeto.cveCorreo+chr(39)+' and id_producto=0';
          if trim(edContrato.text)='' Then Begin
            strSql     := 'update cto_email_edc set correo = '+chr(39)+objeto.cveCorreo+chr(39)+',clave_correo='+chr(39)+objeto.pass+chr(39)+' where id_contrato= '+objeto.ID_Contrato.AsString+' and id_producto=0';
          end
          else Begin
            strSql := 'update cto_email_edc set correo = '+chr(39)+objeto.cveCorreo+chr(39)+',clave_correo='+chr(39)+objeto.pass+chr(39)+' where id_contrato= '+trim(edContrato.text)+' and id_producto=0';
          end;

          vlQueryCmdAux              := TQuery.Create(Nil);
          vlQueryCmdAux.SessionName  := objeto.SessionName;
          vlQueryCmdAux.DatabaseName := objeto.DataBaseName;
          vlQueryCmdAux.SQL.Clear;
          vlQueryCmdAux.Close;
          vlQueryCmdAux.SQL.Add(strSql);
          vlQueryCmdAux.ExecSQL;
          vlQueryCmdAux.SQL.clear;
          vlQueryCmdAux.Close;
          //jhmm 15062009
          if  trim(strSqlMail) = '' Then Begin
            vlQueryCmdAux.SQL.Add(strSqlMail);
            vlQueryCmdAux.ExecSQL;
            vlQueryCmdAux.Close;
          end;
          vlQueryCmdAux.Free;
        end
        else Begin
          if  (objeto.cveCorreo<>'') and (objeto.pass<>'') Then begin
            strSqlMail := 'update cto_email_edc set clave_correo='+chr(39)+objeto.pass+chr(39)+' where correo = '+chr(39)+objeto.cveCorreo+chr(39)+' and id_producto=0';
            if trim(edContrato.text)='' Then
              strSql := 'update cto_email_edc set correo = '+chr(39)+objeto.cveCorreo+chr(39)+',clave_correo='+chr(39)+objeto.pass+chr(39)+' where id_contrato= '+objeto.ID_Contrato.AsString+' and id_producto=0'
            else
              strSql := 'update cto_email_edc set correo = '+chr(39)+objeto.cveCorreo+chr(39)+',clave_correo='+chr(39)+objeto.pass+chr(39)+' where id_contrato= '+trim(edContrato.text)+' and id_producto=0';

            vlQueryCmdAux              := TQuery.Create(Nil);
            vlQueryCmdAux.SessionName  := objeto.SessionName;
            vlQueryCmdAux.DatabaseName := objeto.DataBaseName;
            vlQueryCmdAux.SQL.Clear;
            vlQueryCmdAux.Close;
            vlQueryCmdAux.SQL.Add(strSql);
            vlQueryCmdAux.ExecSQL;
            vlQueryCmdAux.SQL.clear;
            vlQueryCmdAux.Close;
            //jhmm 15062009
            if  trim(strSqlMail) = '' Then Begin
              vlQueryCmdAux.SQL.Add(strSqlMail);
              vlQueryCmdAux.ExecSQL;
              vlQueryCmdAux.Close;
            end;
            vlQueryCmdAux.Free;
          end
          else Begin
            strSql := ' INSERT INTO CTO_EMAIL_EDC(id_contrato,correo,clave_correo,enviar,confirmado,f_confirmacion,id_producto,f_Captura,imp_pass) VALUES('+trim(edContrato.text) +','+chr(39)+objeto.cveCorreo+chr(39)+',NULL,'+chr(39)+'V'+chr(39)+','+chr(39)+'F'+chr(39)+',NULL,0,sysdate,'+chr(39)+'F'+chr(39)+')';
            //Se actualiza el correo electronico con la nueva version
            strSqlEDC := 'INSERT INTO edc_email_detalle(cve_operacion,id_contrato,fecha_operacion,usuario,periodo) VALUES('+chr(39)+'EQ'+chr(39)+','+trim(edContrato.text) +',sysdate,'+chr(39)+objeto.Apli.Usuario+chr(39)+'to_char(sysdate,'+chr(39)+'yyyyMM'+chr(39)+'))';
            if ValidarInsertMail(trim(edContrato.text)) <= 0 Then Begin
              vlQueryCmd              := TQuery.Create(Nil);
              vlQueryCmd.SessionName  := objeto.SessionName;
              vlQueryCmd.DatabaseName := objeto.DataBaseName;
              vlQueryCmd.SQL.Clear;
              vlQueryCmd.Close;
              vlQueryCmd.SQL.Add(strSql);
              vlQueryCmd.ExecSQL;
              vlQueryCmd.Close;
              vlQueryCmd.Free;
              //Inserta bitacora
              vlQueryCmd              := TQuery.Create(Nil);
              vlQueryCmd.SessionName  := objeto.SessionName;
              vlQueryCmd.DatabaseName := objeto.DataBaseName;
              vlQueryCmd.SQL.Clear;
              vlQueryCmd.Close;
              vlQueryCmd.SQL.Add(strSqlEDC);
              vlQueryCmd.ExecSQL;
              vlQueryCmd.Close;
              vlQueryCmd.Free;
              //Fin de Bitacora
              strRes := '' ;

              //Inicia Envio de Correo
              //Proceder a obtener la descripcion del periodo para mandarla en el correo
              strSql := ' SELECT desc_Periodo  Periodo  FROM hist_periodo@hist WHERE Ano_mes= (SELECT trim(TO_CHAR(f_referencia,'+chr(39)+'YYYYMM'+chr(39)+')) Periodo ';
              strSql := strSql + 'FROM FECHA_EMPRESA WHERE cve_dia_liquida='+chr(39)+'FMAN'+chr(39)+' AND id_empresa=1)';

              vlQueryCmd              := TQuery.Create(Nil);
              vlQueryCmd.SessionName  := objeto.SessionName;
              vlQueryCmd.DatabaseName := objeto.DataBaseName;
              vlQueryCmd.SQL.Clear;
              vlQueryCmd.Close;
              vlQueryCmd.SQL.Add(strSql);
              vlQueryCmd.open   ;

              if not vlQueryCmd.IsEmpty then begin
                strRes := vlQueryCmd.FieldByName('Periodo').AsString;
              end;

              //Se procede a enviar el mail
              GeneraMensaje('',trim(edContrato.text),objeto.cveCorreo,strRes);
              //JHMM Envio de edc por email
              //Finaliza Envio de correo
              cbEDC.Enabled := true ;
            end;
          end;
        end;
      end;
    finally
      vlQueryCmd.Close;
      vlQueryCmd.Free;
    end;
    objeto.cveCorreo := '';
    objeto.pass := '';
  end
  else
    cbEDC.Enabled := false ;
  objeto.cveCorreo := '' ;
  objeto.pass := '';
end;

procedure TWContrato.rgSituacionClick(Sender: TObject);
var
   Q : Tquery;
   SQL: string;
   TabCtrl: TTabSheet;
   qValidaPromotor : TQuery;
begin
  objeto.Sit_Contrato.ComboChange;
  if (objeto.Modo = moAppend) then
  begin
     edReact.ReadOnly:=True;
     edReact.Color:=clBtnFace;
     edReact.Text:='';
     DatePicker4.Enabled:=False;
  end;

  if (objeto.Modo = moAppend) or (objeto.Modo = moEdit) then
  begin
     Motivo.Active:= False; 
     edNbrInactiva.Text := '';
     edTxInactiva.Text := '';

     If (objeto.SitContratoAnt <> objeto.Sit_Contrato.ComboDatos.Strings[rgSituacion.ItemIndex]) Then
     begin
        sitCambio := true;
        tabMotivo.PageControl:= pageInfo;
        gpoMotCambioProm.Visible := cambProm;
        gpoMotCambioProm.Top := 96;
        tabMotivo.Caption:= 'Motivos';
     end
     else
     Begin
         TabCtrl:= pageInfo.ActivePage;

         if cambProm = false then
         begin
            tabMotivo.PageControl:= nil;
            sitCambio := False;
         end
         else
            gpoMotCambioProm.Top := 8;


          If TabCtrl <> tabMotivo Then
            pageInfo.ActivePageIndex:= TabCtrl.TabIndex;
          TabCtrl:= nil;
     end;

     case rgSituacion.ItemIndex of
        0: gInactiva.Caption := 'Motivo de Reactivación';
        1: gInactiva.Caption := 'Motivo de Inactivación';
        2: gInactiva.Caption := 'Motivo de Cancelación';
     end;

     if(rgSituacion.ItemIndex in [1,2]) then
     begin
        edFBaja.ReadOnly:=False;
        edFBaja.Color:= clWindow;
        edFBaja.Text := FormatDateTime('DD/MM/YYYY',Now);
        DatePicker2.Enabled := True;
        if (objeto.Modo = moEdit) and
           ( (objeto.vlSituacion = 'IN') or (objeto.vlSituacion = 'CA') ) then
        begin
          edReact.ReadOnly:=True;
          edReact.Color:=clBtnFace;
          edReact.Text:='';
          DatePicker4.Enabled:=False;
        end;//if
     end;//if

     if(rgSituacion.ItemIndex in [0]) then
     begin
        edFBaja.ReadOnly:=True;
        edFBaja.Color:=clbtnFace;
        edFBaja.Text:='';
        DatePicker2.Enabled:=False;
        if (objeto.Modo = moEdit) and
           ( (objeto.vlSituacion = 'IN') or (objeto.vlSituacion = 'CA') ) then
        begin
          edReact.ReadOnly:=False;
          edReact.Color:=clWindow;
          edReact.Text:=FormatDateTime('DD/MM/YYYY',Now);
          DatePicker4.Enabled:=True;
        end;
     end;

     { Valida que al re-activar un contrato los promotores esten activos}
     if(rgSituacion.ItemIndex in [0]) and (objeto.Modo = moEdit) then
     begin
       if Objeto.Grupo.Sit_Gpo_Contrato.AsString <> 'AC' then
       begin
         MessageDlg('La dupla Promotor Asociado/Promotor autorizado no está activa.', mtError, [mbOK], 0);
       end;

       qValidaPromotor := TQuery.Create(nil);
       qValidaPromotor.DatabaseName := Objeto.DataBaseName;
       qValidaPromotor.SessionName  := Objeto.SessionName;
       qValidaPromotor.SQL.Clear;
       qValidaPromotor.SQL.Add('SELECT SIT_EMPLEADO FROM EMPLEADO WHERE ID_PERSONA =');
       qValidaPromotor.SQL.Add(Objeto.Grupo.PromAsociado.ID_Persona.AsString);
       qValidaPromotor.Open;
       if qValidaPromotor.FieldByName('SIT_EMPLEADO').AsString <> 'AC' then
       begin
         MessageDlg('El Promotor Asociado no está activo', mtError, [mbOK], 0);

       end;

       qValidaPromotor.SQL.Clear;
       qValidaPromotor.SQL.Add('SELECT SIT_EMPLEADO FROM EMPLEADO WHERE ID_PERSONA =');
       qValidaPromotor.SQL.Add(Objeto.Grupo.PromAutorizado.ID_Persona.AsString);
       qValidaPromotor.Open;
       if qValidaPromotor.FieldByName('SIT_EMPLEADO').AsString <> 'AC' then
         MessageDlg('El Promotor Autorizado no está activo', mtError, [mbOK], 0);

     end;
  end;
end;

procedure TWContrato.AcuseRecibo(pPreview : Boolean); // CZR 17-feb-2015
var
   AcuseRecibo : TAcuseRec;
   Qry         : TQuery;
begin
   if Objeto.ValidaAccesoEsp('CLASE_TACUSEREC', True, True) then
   begin
      if Objeto.Active then
      begin
         try
            Qry := GetSQLQuery('select * from contrato_can where id_contrato = ' + Objeto.ID_Contrato.AsSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            if Qry <> nil then
            begin
               AcuseRecibo := TAcuseRec.Create(self);
               AcuseRecibo.GetParams(Objeto);
               AcuseRecibo.pPrevio := pPreview;
               AcuseRecibo.FindKey([Qry.FieldByName('ID_CANCELADO').AsInteger, Qry.FieldByName('ID_CONTRATO').AsInteger]);
               AcuseRecibo.Catalogo;
            end;
         finally
            if Qry <> nil then
               FreeAndNil(Qry);
         end;
      end
      else
         raise EInterFrame.Create('No hay un contrato activo');
   end;
end;

procedure TWContrato.InterForma1DespuesAceptar(Sender: TObject);
var vlQueryCmd : TQuery;
    strSql     : String;
    Qry        : TQuery;
    vFolio     : Integer;
    SQL        : String;
    vExiste    : Integer;

begin
  objeto.DrawControl;
  { * SACA4984
    * Deshabilitamos el check
  }

  vExiste            := 0;
  chkCreaIFS.Enabled := False;
  chkCreaIFS.Checked := False;
  if Objeto.pBAcuseRecibo <> nil then // CZR 17-feb-2015
    Objeto.pBAcuseRecibo.Enabled := (trim(Objeto.Sit_Contrato.AsString) = cCancelado);

  if(edPrefijo.Text = '1' ) then begin
      chkCreaIFS.Visible := True;
      
      Qry := GetSqlQuery('SELECT COUNT(1) EXISTE FROM CTO_IFS_ICB WHERE ID_CONTRATO=' +  edContrato.text,
                         objeto.DataBaseName, objeto.SessionName, True);
      if Qry <> nil then
      begin
         try
            vExiste := Qry.FieldByName('EXISTE').AsInteger;
         Finally
            Qry.Free;
         end;
      end;

      if(vExiste > 0) then
         chkCreaIFS.Checked := True
      else
         chkCreaIFS.Checked := False;
   end
   else
      chkCreaIFS.Visible := False;

   if trim(edModifica.Text) = 'V' then
   begin
      Qry := GetSqlQuery('SELECT (NUM_FOLIO+1) as CONSECUTIVO FROM FOLIO_CORP WHERE ID_EMPRESA = 2 AND CVE_FOLIO = ''BITCTO''',
                         objeto.DataBaseName, objeto.SessionName, True);
      if Qry <> nil then
      begin
         try
            vFolio := Qry.FieldByName('CONSECUTIVO').AsInteger;
         Finally
            Qry.Free;
         end;
      end;
      // CZR 13-feb-2009   Modificación en datos que se almacenan en el campo DESC_MODIF
      RunSQL(' INSERT INTO CONTRATO_BIT (ID_CONTRATO, CONSECUTIVO, CVE_USUARIO, FH_REGISTRO, DESC_MODIF)' +
             ' VALUES (' + trim(edContrato.text) + ', '
                         + InttoStr(vFolio) + ', '
                         + chr(39) + trim(edCVEUsuarModif.Text) + chr(39) + ', '
                         + 'to_date(to_char(sysdate,''dd/mm/yyyy hh:mi:ss AM''),''dd/mm/yyyy hh:mi:ss AM'')' + ', '
                         + 'substr(' + chr(39) + ' Titular[' + trim(edIdTitular.Text) + '-' + trim(edNombreTitular.Text) + ']'
                                               + ' Dom[' + trim(edIdDomicilio.Text) + ']'
                                               + ' UnNeg[' + trim(edUnNegocio.Text) + ']'
                                               + ' Promotor[' + trim(Objeto.Id_Grupo.AsString) + '-' + trim(objeto.Id_Pers_Asociad.AsString) + ']'
                                               + ' Segmento[' + trim(Objeto.Cve_Segmento.AsString) + ']'
                                               + ' Corresp[' + trim(Objeto.Cve_Corresp.AsString) + ']'
                                               + ' Ilocalizable[' + trim(Objeto.B_Ilocalizable.AsString) + ']'
                                               + ' Act.Eco.Cto[' + trim(Objeto.CVE_ACTIV_CTO.AsString) + ']'
                         + chr(39) + ', 1, 2000))', objeto.DataBaseName, objeto.SessionName, True);
      RunSQL('UPDATE FOLIO_CORP SET NUM_FOLIO = '+ InttoStr(vFolio) + ' WHERE ID_EMPRESA = 2 AND CVE_FOLIO = ''BITCTO''',
             objeto.DataBaseName, objeto.SessionName, True);
      // CZR 17-feb-2015   Cancelación de Contrato
      if trim(Objeto.SitContratoAnt) <> trim(Objeto.Sit_Contrato.AsString) then
      begin
         if trim(Objeto.Sit_Contrato.AsString) = cCancelado then
            AcuseRecibo(True);
      end;
   end;

  {************************************************************************************}
  if vB_AperturaRec and vB_AsignacionCtoApRec then
  begin
    // Procedimiento para Actualizar (Disminuir)     { SI ES UN CONTRATO DE APERTURA RECIENTE }
    // Contrato del Stock Control de Medios          { Y EL TITULAR FUE CAMBIADO:
    pActualizaStockCtosAperturaReciente;             { SE ACTUALIZA EL STOCK DE CONTROL DE MEDIOS }
    vB_AperturaRec := False;
  end;
  {************************************************************************************}

  cambProm  := false;
  sitCambio := false;

  Objeto.Visibilidad_NivelRiesgo(False, True); // CZR 03-oct-2013

  Inhabilita_Atributos;                                                        //rohs4279 nov/2015 req. PMO150817
end;

procedure TWContrato.btnContratanteClick(Sender: TObject);
var
   Contratantes : TCtte;
begin
   if Objeto.ValidaAccesoEsp('CTTO_NCONTRATANT', True, True) then
   begin
      if objeto.Active then
      begin
         // CZR 26-nov-2014
         if not Objeto.ValidaTitularPLD('configurar', False) then exit; // Validaciones PLD en Titular
         //if not Objeto.ValidaCttePLD   ('configurar')        then exit; // Validaciones PLD en Contratantes
         Objeto.ValidaIdFiscalCttes; // Luis Hernandez Mar 2016
         Contratantes := TCtte.Create(self);
         try
            Contratantes.GetParams(objeto);
            Contratantes.Contrato := objeto;
            Contratantes.Catalogo;
         finally
            Contratantes.Free;
         end;
      end
      else
         raise EInterFrame.Create('No hay un contrato activo');
   end;
end;

procedure TWContrato.btnDocCtteClick(Sender: TObject);
var
   DocCtte : TDocCtte;
begin
   if Objeto.ValidaAccesoEsp('CTTO_NDOCCTTE', True, True) then
   begin
      if objeto.Active then
      begin
         // CZR 26-nov-2014
         if not Objeto.ValidaTitularPLD('configurar', False) then exit; // Validaciones PLD en Titular
         //if not Objeto.ValidaCttePLD   ('configurar')        then exit; // Validaciones PLD en Contratantes
         Objeto.ValidaIdFiscalCttes; // Luis Hernandez Mar 2016
         DocCtte := TDocCtte.Create(self);
         try
            DocCtte.GetParams(objeto);
            DocCtte.Contrato := objeto;
            DocCtte.Catalogo;
         finally
            DocCtte.Free;
         end;
      end
      else
         raise EInterFrame.Create('No hay un contrato activo');
   end;
end;

procedure TWContrato.btnDocCttoClick(Sender: TObject);
var
   DocCtto : TDocCtto;
begin
   if Objeto.ValidaAccesoEsp('CTTO_NDOCCTTO', True, True) then
   begin
      if objeto.Active then
      begin
         // CZR 26-nov-2014
         if not Objeto.ValidaTitularPLD('configurar', False) then exit; // Validaciones PLD en Titular
         //if not Objeto.ValidaCttePLD   ('configurar')        then exit; // Validaciones PLD en Contratantes
         Objeto.ValidaIdFiscalCttes; // Luis Hernández Mar 2016
         DocCtto := TDocCtto.Create(self);
         try
            DocCtto.GetParams(objeto);
            DocCtto.Contrato := objeto;
            DocCtto.Catalogo;
         finally
            DocCtto.Free;
         end;
      end
      else
         raise EInterFrame.Create('No hay un contrato activo');
   end;
end;

procedure TWContrato.btnDocAdicionalClick(Sender: TObject);
var DoctosAdic : TDocAdic;
    qDatos     : TQuery;
    sql        : String;

begin
  if Objeto.ValidaAccesoEsp('CTTO_NDOCADICION',True,True) then begin
    if objeto.Active then begin
      // CZR 26-nov-2014
      if not Objeto.ValidaTitularPLD('configurar', False) then       // Validaciones PLD en Titular
        exit;
      {if not Objeto.ValidaCttePLD   ('configurar') then              // Validaciones PLD en Contratantes
        exit;}
      Objeto.ValidaIdFiscalCttes; // Luis Hernández Mar 2016
      DoctosAdic := TDocAdic.Create(self);
      try
        DoctosAdic.GetParams(objeto);
        DoctosAdic.Contrato := objeto;
        DoctosAdic.Catalogo;
      finally
        DoctosAdic.Free;
        qDatos := TQuery.Create(nil);                                          //rohs4279 nov/2015 req. PMO150817
        Try
          sql := 'SELECT * '  +
                  ' FROM contrato_serv ' +
                 ' WHERE id_contrato = ' + Objeto.ID_Contrato.AsSQL +
                   ' AND sit_servicio = ' + Quotedstr('AC');
          qDatos.DatabaseName := Objeto.Apli.DataBaseName;
          qDatos.SessionName  := Objeto.Apli.SessionName;
          qDatos.Close;
          qDatos.SQL.Clear;
          qDatos.SQL.Add(sql);
          qDatos.Open;
          Objeto.B_CteInstitucional.AsString := 'F';
          Objeto.B_CteSofisticado.AsString   := 'F';
          Objeto.B_CteCalificado.AsString    := 'F';
          Objeto.B_Elegible.AsString         := 'F';
          if Not qDatos.Fields[0].IsNull then Begin
            qDatos.First;
            While not qDatos.Eof do Begin
              if qDatos.FieldByName('cve_tip_cte').AsString = 'CI' then
                Objeto.B_CteInstitucional.AsString := 'V'
              else if qDatos.FieldByName('cve_tip_cte').AsString = 'CLISOF' then
                Objeto.B_CteSofisticado.AsString := 'V'
              else if qDatos.FieldByName('cve_tip_cte').AsString = 'CLIECA' then
                Objeto.B_CteCalificado.AsString := 'V'
              else if qDatos.FieldByName('cve_tip_cte').AsString = 'ELE' then
                Objeto.B_Elegible.AsString := 'V';
              qDatos.Next;
            end;
          end;
        finally
          qDatos.Close;
          qDatos.Free;
        end;
      end;
    end
    else
      raise EInterFrame.Create('No hay un contrato activo');
  end;
end;

procedure TWContrato.Informaciongeneral1Click(Sender: TObject);
begin objeto.Reporte;
end;

procedure TWContrato.btnRepCttoClick(Sender: TObject);
var
   vl_Proemio:  TImprimir;
   vl_InterFin: TIntFin;
   vl_ILine:    TIline;
   vl_Toluca:   TToluca;
   vl_OMSC:     TOMSC;
   vl_DocumentoCve : TCarPdfImp;
begin
  If Objeto.ValidaAccesoEsp('CTTO_NREPCTTO',True,True) Then
  Begin
    if not objeto.Active then
    begin
       Raise EInterFrame.Create('No existe un Contrato Activo.');
       Exit;
    end;//if

    {RAPA - Pruebas para impresion de contrato }
    {
    }

    { de aqui
      //Clase especial de Contrato
      if GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(objeto.ClassName)+''') AND (CVE_USUARIO='''+objeto.DameUsuario+''') and (CVE_OPER_ACC=''IC'')',
         objeto.SeguDataBaseName,objeto.SeguSessionName,True) OR
      //Convenio Modificatorio para el Envío de Estados de Cuenta por Medios Electrónicos
      GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(objeto.ClassName)+''') AND (CVE_USUARIO='''+objeto.DameUsuario+''') and (CVE_OPER_ACC=''CN'')',
         objeto.SeguDataBaseName,objeto.SeguSessionName,True) THEN
         RepContrato.Enabled := True
      else begin
         RepContrato.Enabled := False;
         Raise EInterFrame.Create('El Usuario no tiene permiso para imprimir el contrato. Consulte con su administrador');
         Exit;
      end;//else
      aca }


    {RAPA - Pruebas para impresion de contrato }
    {
    RepContrato.Enabled := True;
    }

    { Imprine documentos clave, requerimiento Alejandro Costal }
    If (Objeto.ConfigCaptura.Tipo_Proemio.AsString = 'ICB') or
       (Objeto.ConfigCaptura.Tipo_Proemio.AsString = 'BCO') Then
    Begin
      if objeto.Active then
      begin
        vl_DocumentoCve := TCarPdfImp.Create(self);
        try
          vl_DocumentoCve.GetParams(objeto);
          vl_DocumentoCve.Id_persona := Objeto.Titular.ID_Persona.AsInteger;
          vl_DocumentoCve.Catalogo;
        finally
          vl_DocumentoCve.Free;
        end;
      end
      else Raise EInterFrame.Create('No hay un contrato activo');
    end; { documentos clave }

    //*****************PROEMIO CASA DE BOLSA****************
    If Objeto.ConfigCaptura.Tipo_Proemio.AsString = 'ICB' Then
    Begin
  (*
      vl_Proemio := TImprimir.Create;
      Application.CreateForm(TdmPorta,dmPorta);
      Try
        vl_Proemio.DatabaseName := objeto.DataBaseName;
        vl_Proemio.SessionName  := objeto.SessionName;
        vl_Proemio.ID_CONTRATO  := objeto.ID_Contrato.AsInteger;
        vl_Proemio.Frame:= objeto;
        dmPorta.AsignaDataBaseNames(objeto.DataBaseName, objeto.SessionName);
        dmPorta.qContrato.ParamByName('ID_CONTRATO').AsInteger :=objeto.ID_Contrato.AsInteger;
        dmPorta.qContrato.Active:=True;
        if dmPorta.qContrato.IsEmpty then
        Begin
          InterMsg(tmMal,'',0,'No existe información completa para presentar en proemio. Verifique...');
          dmPorta.qContrato.Active:=False;
        end//if
        else
        begin
          dmPorta.qContrato.Active:=False;
          vl_Proemio.Catalogo;
        end;//else
      Finally
        dmPorta.Free;
        vl_Proemio.Free;
      end;//try & finally
  *)

      ImpresionProemioICB(Objeto);

    end//if


    else //*****************PROEMIO INTERFINANCIAL******************


  {
    if (objeto.Cve_Tip_Contrato.asString = 'IFSM') or
       (objeto.Cve_Tip_Contrato.asString = 'INIF') Then
  }
    If Objeto.ConfigCaptura.Tipo_Proemio.AsString = 'IFS' Then
    Begin
      vl_InterFin:= TIntFin.Create(self);
      Try
        vl_InterFin.Id_Contrato.asInteger := objeto.ID_Contrato.asInteger;
        vl_InterFin.Apli := objeto.Apli;
        vl_InterFin.Catalogo;
      Finally
        vl_InterFin.Free;
      end;//try & finally
    end//if


    else//*****************PROEMIO CUENTA INTERACCIONES******************


  {
    If (Objeto.Cve_Tip_Contrato.asString = 'IFON') OR
       (Objeto.Cve_Tip_Contrato.asString = 'OFON') OR
       (Objeto.Cve_Tip_Contrato.asString = 'PRBC') OR
       (Objeto.Cve_Tip_Contrato.asString = 'PROF') THEN
  }
    If Objeto.ConfigCaptura.Tipo_Proemio.AsString = 'BCO' Then
    Begin
      vl_Toluca := TToluca.Create(Self);
      Application.CreateForm(TdmPorta,dmPorta);
      Try
        {Asignacion de Intercampos }
        vl_Toluca.Id_Contrato.asInteger := objeto.ID_Contrato.asInteger;
        vl_Toluca.Id_Ctto.AsInteger:= StrToInt( Copy(Objeto.Id_Contrato.asString, 2, 9) );
        vl_Toluca.Nom_Contrato.AsString := objeto.TITNOMBRE.AsString;
        vl_Toluca.Cve_Tipo_Contrato.AsString := objeto.Cve_Tip_Contrato.AsString;
        vl_Toluca.F_Alta.AsDateTime:= Objeto.F_Alta.AsDateTime;

        vl_Toluca.Apli := objeto.Apli;

        dmPorta.AsignaDataBaseNames(objeto.DataBaseName, objeto.SessionName);
        dmPorta.qContrato.ParamByName('ID_CONTRATO').AsInteger :=objeto.ID_Contrato.AsInteger;
        dmPorta.qContrato.Active:=True;

        vl_Toluca.Catalogo;
      Finally
        dmPorta.Free;
        if vl_Toluca <> nil then vl_Toluca.Free;
      end;
    end


    else//*****************PROEMIO PARA INTERNET CON EL SERVICIO ORDENES DE MERCADO DE CAPITALES*******


  {
    if(objeto.Cve_Tip_Contrato.asString = 'INET') then
  }
    If Objeto.ConfigCaptura.Tipo_Proemio.AsString = 'NET' Then
    Begin //¿Validar Servicio?
      vl_ILine:= TILine.Create(self);
      Try
        vl_ILine.Id_Contrato.asInteger := objeto.ID_Contrato.asInteger;
        vl_ILine.Apli := objeto.Apli;
        vl_ILine.ApliNet := objeto.ApNet;
        vl_ILine.Catalogo;
      Finally
         vl_ILine.Free;
      end;//try & finally
    end//if


    else//*****************OPERACIONES DE MERCADO DE DINERO SIN CONTRATO*******


  {
    if (objeto.Cve_Tip_Contrato.asString = 'OMSC') OR
       (objeto.Cve_Tip_Contrato.asString = 'PRMD') THEN
  }

    // CZR 07-dic-2010
    if (Objeto.ConfigCaptura.Tipo_Proemio.AsString = 'DIN') or (Objeto.ConfigCaptura.Tipo_Proemio.AsString = 'DINICB') then
    begin
       ImpresionProemioMDin(Objeto);
    end

    // CZR 09-nov-2010
    else //***************** PROEMIO GENERAL *****************
    if (trim(Objeto.ConfigCaptura.Tipo_Proemio.AsString) = 'CHE') or (trim(Objeto.ConfigCaptura.Tipo_Proemio.AsString) = 'INV') then
    begin
       ImpresionProemioGen(Objeto);
    end


    else//*****************OTROS CONTRATOS*******


      Execute_RepCtto2(True, objeto, objeto.Id_contrato.AsInteger);
  End;
end;


procedure TWContrato.btCveSegObjetivoClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('CTTO_CVESEGOBJET',True,True) Then
  Begin
    objeto.CIBCSegmento.BuscaWhereString := '(CVE_SEGMENTO = '' 0'') OR (CVE_SEGMENTO = '' 1'') OR (CVE_SEGMENTO = '' 2'') OR (CVE_SEGMENTO = '' 3'') OR (CVE_SEGMENTO = '' 4'')';
    objeto.CIBCSegmento.Busca;
  End;
end;//procedure


procedure TWContrato.SpeedButton6Click(Sender: TObject);
Var
  Cto:TContrato;
begin
{RAPA.  No se utiliza
  if not objeto.Titular.Active then begin
     MessageDlg('Debe de Seleccionar un Titular',mtError,[mbOK],0);
     exit;
  end;//if
  Cto:=TContrato.Create(objeto);
  Try
     Cto.GetParams(objeto);
     if objeto.Cve_Tip_Contrato.AsString = 'FIDE' then
       	Cto.BuscaWhereString:='((CONTRATO.CVE_TIP_CONTRATO=''CDVI'') or (CONTRATO.CVE_TIP_CONTRATO=''IDVI'') or (CONTRATO.CVE_TIP_CONTRATO=''BDVI''))'
     else
 	Cto.BuscaWhereString:='((CONTRATO.CVE_TIP_CONTRATO=''CDVI'') or  (CONTRATO.CVE_TIP_CONTRATO=''IDVI'') or (CONTRATO.CVE_TIP_CONTRATO=''BDVI'')) AND (CONTRATO.ID_TITULAR='+objeto.Titular.ID_Persona.AsString+')';
     Cto.MasterSourceEnabled:=False;
     Cto.Busca;
     if Cto.Active then
        objeto.ID_CONTRA_DV.AsString:=Cto.ID_Contrato.AsString;
  Finally
    Cto.Free;
  end;
}
end;


procedure TWContrato.SpeedButton7Click(Sender: TObject);
Var
  Cto:TContrato;
begin
{ RAPA. No se utiliza
  if not objeto.Titular.Active then begin
     MessageDlg('Debe de Seleccionar un Titular',mtError,[mbOK],0);
     exit;
  end;//if
  Cto:=TContrato.Create(objeto);
  Try
    Cto.GetParams(objeto);
    if objeto.Cve_Tip_Contrato.AsString = 'FIDE' then
       Cto.BuscaWhereString:='(CONTRATO.CVE_TIP_CONTRATO=''CIBC'') OR (CONTRATO.CVE_TIP_CONTRATO=''CSIL'')'
    else
       Cto.BuscaWhereString:='((CONTRATO.CVE_TIP_CONTRATO=''CIBC'') OR (CONTRATO.CVE_TIP_CONTRATO=''CSIL'')) AND (CONTRATO.ID_TITULAR='+objeto.Titular.ID_Persona.AsString+')';
    Cto.MasterSourceEnabled:=False;
    Cto.Busca;
    if Cto.Active then
       objeto.ID_CONTRA_IB.AsString:=Cto.ID_Contrato.AsString;
  Finally
    Cto.Free;
  end;
}
end;


procedure TWContrato.LimpiarRegistro1Click(Sender: TObject);
begin
  if InterForma1.CanEdit then
  begin
     objeto.ID_CTO_LIQ.AsString:= '';
     objeto.ID_CTO_LIQ.IsNull:= True;
  end;
end;


procedure TWContrato.PopupMenuGpoCtoPopup(Sender: TObject);
begin objeto.Grupo.Catalogo;
end;


procedure TWContrato.RepDocumentacionClick(Sender: TObject);
begin //Execute_RepCtto3(True,Self, Id_contrato.AsInteger);
end;


procedure TWContrato.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F2) and (ssCtrl in Shift) then
    SeguCto:= Not SeguCto;

  if SeguCto then
    Interforma1.F.Caption:='Contrato.'
  else Interforma1.F.Caption:='Contrato';
end;


procedure TWContrato.BitBtn2Click(Sender: TObject);
Var
  Chequera: TCheCteCto;
begin
  If Objeto.ValidaAccesoEsp('CTTO_TBTN1',True,True) Then
  Begin
    if objeto.Active then
    begin
       Chequera:= TCheCteCto.Create(self);
       Try
         Chequera.GetParams(objeto);
         Chequera.Contrato := objeto;
         Chequera.Catalogo;
       Finally
         Chequera.Free;
       end;
    end
    else Raise EInterFrame.Create('No hay un contrato activo');
  End;
end;

procedure TWContrato.btConceptoClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('CTTO_CONCEPTO',True,True) Then
  Begin
    objeto.Concepto.Busca;
  End;
end;

procedure TWContrato.PopupReportesPopup(Sender: TObject);
begin
  RepContrato.Enabled:= GetSQL(' SELECT CVE_OPER_ACC ' +
                               ' FROM SECU_OPER_ACC ' +
                               ' WHERE CVE_FUNCION = ''CLASE_' + UpperCase(objeto.ClassName) + ''' ' +
                               '   AND CVE_USUARIO = ''' + objeto.DameUsuario + ''' ' +
                               '   AND CVE_OPER_ACC = ''IC''',
                          objeto.SeguDataBaseName, objeto.SeguSessionName, True);
end;
  
procedure TWContrato.bInternetClick(Sender: TObject);
Var
  NetCtto: TNetCto;
begin
  If Objeto.ValidaAccesoEsp('CTTO_NTERNET',True,True) Then
  Begin
    NetCtto:= TNetCto.Create(self);
    Try
      objeto.ApNet.ClasePerfil := objeto.Apli.ClasePerfil;
      objeto.ApNet.Usuario     := objeto.Apli.Usuario;
      objeto.ApNet.IdEmpresa   := objeto.Apli.IdEmpresa;
      objeto.ApNet.Indicador   := objeto.Apli.Indicador;
      objeto.ApNet.CvePerfil   := objeto.Apli.CvePerfil;
      objeto.ApNet.UsuarioID   := objeto.Apli.UsuarioID;
      objeto.ApNet.UsuarioNombre    := objeto.Apli.UsuarioNombre;
      objeto.ApNet.SeguDataBaseName := objeto.Apli.SeguDataBAseName;
      objeto.ApNet.SeguSessionName  := objeto.Apli.SeguSessionName;
      objeto.ApNet.Active := True;

      NetCtto.Apli := objeto.ApNet;
      NetCtto.ContratoPadre := objeto;
      NetCtto.FindKey([objeto.ID_Contrato.AsString]);
      NetCtto.FLastPass := NetCtto.PASSWORD.AsString;
      NetCtto.Catalogo;
    Finally
      NetCtto.Free;
    end;
  End;
end;

procedure TWContrato.btnCtoAsociadoClick(Sender: TObject);
var
  MetaCtto: TMetaCtoAs;
begin
  If Objeto.ValidaAccesoEsp('CTTO_NCTOASOCIAD',True,True) Then
  Begin
    MetaCtto:= TMetaCtoAs.Create(self);
    Try
      MetaCtto.GetParams(objeto);
      MetaCtto.Contrato:= objeto;
      MetaCtto.Catalogo;
    Finally
      MetaCtto.Free;
    end;
  End;
end;

procedure TWContrato.rgCveTipSuscrClick(Sender: TObject);
begin
  if objeto.Modo in [moEdit, moAppend] then
  begin
     edNumEnvios.Enabled:= (rgCveTipSuscr.ItemIndex = 0);
     edFExpiracion.Enabled:= (rgCveTipSuscr.ItemIndex = 1);
     dtpExpiracion.Enabled:= (rgCveTipSuscr.ItemIndex = 1);
     Case rgCveTipSuscr.ItemIndex of
       0 : begin
             edFExpiracion.Clear;
             edFExpiracion.Color:= clBtnFace;
             edNumEnvios.Color:= clWindow;
           end;//case 0

       1 : begin
             edNumEnvios.Clear;
             edNumEnvios.Color:= clBtnFace;
             edFExpiracion.Color:= clWindow;
           end;//case 1
     end;
  end;
end;

procedure TWContrato.LocalizaActividad;
Begin
  With Objeto.Actividad do
  Begin
    FindKey([TipoCliente.CveSeccion.AsString +
             Residencia.CveSeccion.AsString +
             TipoSector.CveSeccion.AsString +
             Sector.CveSeccion.AsString +
             SubSector.CveSeccion.AsString +
             Rama.CveSeccion.AsString +
             SubRama.CveSeccion.AsString +
             Inciso.CveSeccion.AsString]);
  end;
end;

procedure TWContrato.ValidaEmpresaUnidadNegocio;
Begin
  If (objeto.Modo = moAppend) or (Objeto.Modo = moEdit) Then
  Begin
    if objeto.Empresa.Active then
      If objeto.UnNegocio.Id_Empresa.AsInteger <>  objeto.Empresa.ID_Persona.AsInteger then
        objeto.UnNegocio.Active := False;
    objeto.UnNegocio.DrawControl;
  end; // end if
end;


procedure TWContrato.sbTipoClienteClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('CTTO_TIPOCLIENTE',True,True) Then
  Begin
    If Objeto.Actividad.TipoCliente.Busca Then LocalizaActividad;
  End;
end;

procedure TWContrato.sbResidenciaClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('CTTO_RESIDENCIA',True,True) Then
  Begin
    If Objeto.Actividad.Residencia.Busca Then LocalizaActividad;
  End;
end;

procedure TWContrato.sbTipoSectorClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('CTTO_TIPOSECTOR',True,True) Then
  Begin
    If Objeto.Actividad.TipoSector.Busca Then LocalizaActividad;
  End;
end;

procedure TWContrato.sbSectorClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('CTTO_SECTOR',True,True) Then
  Begin
    If Objeto.Actividad.Sector.Busca Then LocalizaActividad;
  End;
end;

procedure TWContrato.sbSubSectorClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('CTTO_SUBSECTOR',True,True) Then
  Begin
    If Objeto.Actividad.SubSector.Busca Then LocalizaActividad;
  End;
end;

procedure TWContrato.sbRamaClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('CTTO_RAMA',True,True) Then
  Begin
    If Objeto.Actividad.Rama.Busca Then LocalizaActividad;
  End;
end;

procedure TWContrato.sbSubRamaClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('CTTO_SUBRAMA',True,True) Then
  Begin
    If Objeto.Actividad.SubRama.Busca Then LocalizaActividad;
  End;
end;

procedure TWContrato.sbIncisoClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('CTTO_INCISO',True,True) Then
  Begin
    If Objeto.Actividad.Inciso.Busca Then LocalizaActividad;
  End;
end;

procedure TWContrato.edPlazoObjetivoExit(Sender: TObject);
begin
  if (Length(edPlazoObjetivo.Text) > 0) and (StrtoInt(edPlazoObjetivo.Text) > 6) then
  Begin
     ShowMessage('El máximo de meses permitido es 6');
     edPlazoObjetivo.Text := '';
     exit;
  end;
end;


procedure TWContrato.InterForma1Buscar(Sender: TObject);
Var idctto     : String;
    strSql     : String;
    vlQueryCmd : Tquery;
    Qry        : TQuery;
    SQL        : String;
    vExiste    : Integer;

begin
  Apli            := objeto.Apli;
  iCteAAA.Visible := FALSE;
  Inhabilita_atributos;                                                        //rosh4279 nov/20125 req. PMO150817

  {-----------------------------------------------------------------------------------------------------------}
  if fUsuarioConCtaAperRec then { <- Usuario en esquema de apertura reciente }
    Objeto.BuscaWhereString := Format('ID_CONTRATO NOT IN ( '+
     { SI EL USUARIO SE ENCUENTRA DENTRO   }       {------------------}
     { DEL ESQUEMA DE CONTROL DE MEDIOS:   }   ' SELECT CO.ID_CONTRATO '+
     { SE AJUSTA EL "WhereString" DEL      }   '   FROM DV_MD_BIT_CTOS B, '+
     { FINDIT PARA QUE LE MUESTRE          }   '         CONTRATO CO '+
     { LOS CONTRATOS DE APERTURA RECIENTER }   '    WHERE B.SIT_CTO_SOLIC = 1  '+ { INDICA CUENTA DE APERTURA RECIENTE DISPONIBLE }
     { A LOS CUALES TIENE ACCESO EL        }   '      AND CO.ID_CONTRATO = B.ID_CONTRATO '+
     { USUARIO EN CUESTION                 }   '      AND CO.ID_ENTIDAD NOT IN  '+ {  FILTRO DE CONTRATO DE APERTURA RECIENTE POR USARIO }
                                               '              (SELECT DECODE(PARAMETRO_1, '+
                                               '                             ''ADMON'', CO.ID_ENTIDAD '+
                                               '                             ,PARAMETRO_2) '+
                                               '               FROM DV_USU_PROCE UP '+
                                               '               WHERE UP.CVE_USUARIO = %s '+
                                               '                  AND UP.CVE_PROCESO = ''MEDIODIS''    ) '+
                                  ')', [QuotedStr(Objeto.DameUsuario)])

  else
    {-----------------------------------------------------------------------------------------------------------}
    Objeto.BuscaWhereString := 'ID_CONTRATO NOT IN ( '+                { SI EL USUARIO NO SE ENCUENTRA EN EL ESQUEMA }
                               ' SELECT ID_CONTRATO '+                 { DE CONTROL DE MEDIOS:                       }
                               ' FROM DV_MD_BIT_CTOS B '+              { SE AJUSTA EL "WhereString" DEL FINDIT       }
                               ' WHERE SIT_CTO_SOLIC = 1 )';           { PARA QUE NO MUESTRE LOS CONTRATOS DE        }
                                                                        { APERTURA RECIENTE                           }
  if Objeto.Busca then begin
    {*  SACA4984
    {-----------------------------------------------------------------------------------------------------------}
    { Asignacion de contrato de apertura reciente }
    { CUANDO EL CONTRATO ES SELECCIONADO:                                                 }
    { SE GUARDA EN UNA VARIABLE BOOLEANA SI ES UN CONTRATO DE CUENTA DE APERTURA RECIENTE }
    vB_AperturaRec := fEsCtoAperturaReciente(Objeto.ID_CONTRATO.AsInteger);
    vIdTitularOld := objeto.Titular.ID_Persona.AsInteger; { SE GUARDA TITULAR ORIGINAL DEL CONTRATO }
    {-----------------------------------------------------------------------------------------------------------}

    vExiste := 0;

    chkCreaIFS.Enabled := False;
    chkCreaIFS.Checked := False;

    if(edPrefijo.Text = '1' ) then begin
      chkCreaIFS.Visible := True;

      Qry := GetSqlQuery('SELECT COUNT(1) EXISTE FROM CTO_IFS_ICB WHERE ID_CONTRATO=' +  edContrato.text,
                         objeto.DataBaseName, objeto.SessionName, True);
      if Qry <> nil then begin
        try
          vExiste := Qry.FieldByName('EXISTE').AsInteger;
        Finally
          Qry.Free;
        end;
      end;

      if(vExiste > 0) then
        chkCreaIFS.Checked := True
      else
        chkCreaIFS.Checked := False;
    end
    else
      chkCreaIFS.Visible := False;


    {Validacion de Folio Cuestionario y Perfil Asignado }
    {*If (Objeto.Cve_Tip_Contrato.AsString = 'CIBC') Or
      (Objeto.Cve_Tip_Contrato.AsString = 'OMSC') Or
      (Objeto.Cve_Tip_Contrato.AsString = 'IFON') Or
      (cbTipoCuenta.Text = 'ADMINISTRATIVO')      Or
      (chkCteInstitucional.Checked)               Then
   Begin
       gpPerfilCuestionario.Visible := True;
   End
   Else
   Begin
      gpPerfilCuestionario.Visible := False;
   End;+}

    solicitaCuestionario();

   {
      //Obtengo el contrato para setear el correo a la variable global
      idctto := trim(EdIdContrato.Text);
      //Procedo a buscarlo en la bd de correos
      strSql := '';
      strSql := strSql + 'select Correo from cto_email_edc where id_contrato =  '+ objeto.ID_Contrato.AsString+' and id_producto = 0';

      vlQueryCmd              := TQuery.Create(Nil);
      vlQueryCmd.SessionName  := Apli.SessionName;
      vlQueryCmd.DatabaseName := Apli.DataBaseName;
      vlQueryCmd.SQL.Clear;
      vlQueryCmd.Close;
      vlQueryCmd.SQL.Add(strSql);
      vlQueryCmd.open   ;

      if not vlQueryCmd.IsEmpty then
         begin
           cvecorreo := vlQueryCmd.FieldByName('Correo').AsString;
           if cvecorreo = '' Then cbEDC.Checked := false
           else
             Begin
              cbEDC.Checked :=true;
              cbEDC.enabled :=true;
             end;
         end
      else
       begin
         cvecorreo :=  '' ;
         cbEDC.Checked := false;
       end;
                 }
    iCteAAA.Visible := Objeto.EsClienteAAA;
    //edModSit.Text   := Objeto.Sit_Contrato.AsString;
    // CZR 05-mar-2009
    if trim(objeto.ConfigCaptura.B_VAL_PRECALIFICA.AsString) = 'V' then
      Visibilidad_Prospecto(True)
    else
      Visibilidad_Prospecto(False);
  end;
end;

procedure TWContrato.sbMotivoClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('CTTO_MOTIVO', True, True) then
   begin
      case rgSituacion.ItemIndex of
         0: Motivo.BuscaWhereString := 'Tipo_Proceso = ''AC''';
         1: Motivo.BuscaWhereString := 'Tipo_Proceso = ''IN''';
         2: Motivo.BuscaWhereString := 'Tipo_Proceso = ''CA'''; // CZR 17-feb-2015
      end;
      if Motivo.Busca then
         edNbrInactiva.Text := Motivo.DESC_MOTIVO.AsString;
   end;
end;


procedure TWContrato.EstadoContrato;
begin
  if rgSituacion.ItemIndex = 0 then
     G_Activo := TRUE
  else
     G_Activo := FALSE;
end;//procedure


procedure TWContrato.CatalogoOrigenRecClick(Sender: TObject);
begin
  {if edIdOrigenRec.Text <> '' then
    Objeto.CtoOriRec.FindKey([edIdOrigenRec.Text]);
  Objeto.CtoOriRec.Catalogo;
  if InterForma1.CanEdit and Objeto.CtoOriRec.Active then
    Objeto.ID_ORIGEN_REC.AsString:= Objeto.CtoOriRec.ID_ORIGEN_REC.AsString;}
end;


procedure TWContrato.LimpiarOrigenRecClick(Sender: TObject);
begin
  {edIdOrigenRec.Text := '';
  edDescOrigenRec.Text := '';
  Objeto.ID_ORIGEN_REC.AsString := '';}
end;


procedure TWContrato.CatalogoDestinoRecClick(Sender: TObject);
begin
  {if edIdDestinoRec.Text <> '' then
    Objeto.CtoDesRec.FindKey([edIdDestinoRec.Text]);
  Objeto.CtoDesRec.Catalogo;
  if InterForma1.CanEdit and Objeto.CtoDesRec.Active then
    Objeto.ID_DESTINO_REC.AsString := Objeto.CtoDesRec.ID_DESTINO_REC.AsString;}
end;


procedure TWContrato.LimpiarDestinoRecClick(Sender: TObject);
begin
  {edIdDestinoRec.Text := '';
  edDescDestinoRec.Text := '';
  Objeto.ID_DESTINO_REC.AsString := '';}
end;

procedure TWContrato.edIdTitularContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin HabilitaPopUpMenu;
end;


procedure TWContrato.edNombreTitularContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin HabilitaPopUpMenu;
end;


procedure TWContrato.edContratoLiqContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin HabilitaPopUpMenu;
end;


procedure TWContrato.edCalleNumeroContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin HabilitaPopUpMenu;
end;


procedure TWContrato.edNombreEmpresaContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin HabilitaPopUpMenu;
end;


procedure TWContrato.edMonedaContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin HabilitaPopUpMenu;
end;


procedure TWContrato.edGrupoContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin HabilitaPopUpMenu;
end;


procedure TWContrato.edNombrePromotorContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin HabilitaPopUpMenu;
end;


procedure TWContrato.edDescProductoContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin HabilitaPopUpMenu;
end;


procedure TWContrato.edTipoContratoContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin HabilitaPopUpMenu;
end;


procedure TWContrato.edUnNegocioContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin HabilitaPopUpMenu;
end;


procedure TWContrato.edSegmentoContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin HabilitaPopUpMenu;
end;


procedure TWContrato.edDescConceptoContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin HabilitaPopUpMenu;
end;


procedure TWContrato.HabilitaPopUpMenu;
begin
  PopupDestinoRec.AutoPopup := InterForma1.BtnAceptar.Enabled;
  PopupOrigenRec.AutoPopup := InterForma1.BtnAceptar.Enabled;
end;

procedure TWContrato.btnKYCClick(Sender: TObject);
var
  vlQuery : TQuery;
begin
  If Objeto.ValidaAccesoEsp('CTTO_NKYC',True,True) Then
  Begin
    If Objeto.Active Then
    begin
      vlQuery := TQuery.Create(Nil);
      vlQuery.DataBaseName := Objeto.Apli.DataBaseName;
      vlQuery.SQL.Text := 'SELECT PERSONA.CVE_PER_JURIDICA, '
                        + '       PERSONA_FISICA.B_ACTIV_EMPRESA '
                        + 'FROM PERSONA, '
                        + '     PERSONA_FISICA '
                        + 'WHERE PERSONA.ID_PERSONA = ' + Trim(edIdTitular.Text)
                        + '  AND PERSONA.ID_PERSONA = PERSONA_FISICA.ID_PERSONA(+)';
      vlQuery.Close;
      vlQuery.Open;
      if not vlQuery.IsEmpty then
      begin
        if vlQuery.FieldByName('CVE_PER_JURIDICA').AsString = 'PM' then
          EXECUTE_RP_KYCPM(Objeto.Apli,'Ver',Objeto.ID_Contrato.AsInteger)
        else if vlQuery.FieldByName('CVE_PER_JURIDICA').AsString = 'PF' then
        begin
          if vlQuery.FieldByName('B_ACTIV_EMPRESA').AsString = 'V' then
            EXECUTE_RP_KYCPFEMP(Objeto.Apli,'Ver',Objeto.ID_Contrato.AsInteger)
          else if vlQuery.FieldByName('B_ACTIV_EMPRESA').AsString = 'F' then
            EXECUTE_RP_KYCPF(Objeto.Apli,'Ver',Objeto.ID_Contrato.AsInteger);
        end;
      end;
      vlQuery.Close;
      vlQuery.Free;
    end
    else
    begin
      raise EInterFrame.create('No hay un contrato activo para reportar');
    end;
  End;
end;

procedure TWContrato.btnDiagnosticoKYCClick(Sender: TObject);
var
  vlQuery : TQuery;
begin
  If Objeto.ValidaAccesoEsp('CTTO_NDIAGNOSKYC',True,True) Then
  Begin
    If Objeto.Active Then
    begin
      {vlQuery := TQuery.Create(Nil);
      vlQuery.DataBaseName := Objeto.Apli.DataBaseName;
      vlQuery.SQL.Text := 'SELECT PERSONA.CVE_PER_JURIDICA, '
                        + '       PERSONA_FISICA.B_ACTIV_EMPRESA '
                        + 'FROM PERSONA, '
                        + '     PERSONA_FISICA '
                        + 'WHERE PERSONA.ID_PERSONA = ' + Trim(edIdTitular.Text)
                        + '  AND PERSONA.ID_PERSONA = PERSONA_FISICA.ID_PERSONA(+)';
      vlQuery.Close;
      vlQuery.Open;
      if not vlQuery.IsEmpty then
      begin
        if vlQuery.FieldByName('CVE_PER_JURIDICA').AsString = 'PM' then
          EXECUTE_RP_DIAGKYCPM(Objeto.Apli,'Ver',Objeto.ID_Contrato.AsInteger)
        else if vlQuery.FieldByName('CVE_PER_JURIDICA').AsString = 'PF' then
        begin
          if vlQuery.FieldByName('B_ACTIV_EMPRESA').AsString = 'V' then
            EXECUTE_RP_DIAGKYCPFEMP(Objeto.Apli,'Ver',Objeto.ID_Contrato.AsInteger)
          else if vlQuery.FieldByName('B_ACTIV_EMPRESA').AsString = 'F' then}
            EXECUTE_RP_DIAGKYCPF(Objeto.Apli,'Ver',Objeto.ID_Contrato.AsInteger);
        {end;
      end;
      vlQuery.Close;
      vlQuery.Free;}
    end
    {else
    begin
      raise EInterFrame.create('No hay un contrato activo para reportar');
    end;}
  End;
end;


procedure TWContrato.CatalogoActividadClick(Sender: TObject);
begin Objeto.Actividad.Catalogo;
end;


procedure TWContrato.LimpiarActividadClick(Sender: TObject);
begin
  If (objeto.Modo = moAppend) or (Objeto.Modo = moEdit) Then
  Begin
    Objeto.Actividad.Active:= False;
    edCve_Activ_Cto.Text:= '';
  end;
end;


procedure TWContrato.linkActividadCapture(Sender: TObject;
  var Show: Boolean);
begin Show:= (objeto.Modo = moAppend) Or (Objeto.Modo = moEdit);
end;


procedure TWContrato.linkActividadEjecuta(Sender: TObject);
begin Objeto.Actividad.FindKey([linkActividad.Buffer]);
end;


procedure TWContrato.btnAsignarProspectoClick(Sender: TObject);
Var strPrefijo: String;
    strCtto: String;
    intFalta: Integer;
begin
  If Objeto.ValidaAccesoEsp('CTTO_NASIGNARPRO',True,True) Then
  Begin
    { Validación del Acceso de la Operación Especial AP-Asignacion de Prospectos}
    if GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(objeto.ClassName)+''') AND (CVE_USUARIO='''+objeto.DameUsuario+''') and (CVE_OPER_ACC=''AP'')',
       objeto.SeguDataBaseName,objeto.SeguSessionName,True) then
       btnAsignarProspecto.Enabled := True
    else begin
       btnAsignarProspecto.Enabled := False;
       Raise EInterFrame.Create('El Usuario no tiene permiso para Asignar un Contrato de Prospectos. Consulte con su administrador');
    end;//else


    if (Length(edPrefijoProspecto.Text) > 0) and
       (Length(edContratoProspecto.Text) > 0) Then
    Begin
      strPrefijo:= Trim(edPrefijoProspecto.Text);
      strCtto:= '00000000000' + edContratoProspecto.Text;
      intFalta:= 9 - Length(strPrefijo);
      strCtto:= strPrefijo + Copy(strCtto, (Length(strCtto)- intFalta) + 1, intFalta);

      if MessageDlg('¿Esta seguro de Asignar el Prospecto  ' + objeto.ID_Contrato.AsString + ' al Contrato ' + strCtto + ' ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
        Objeto.AsignaProspecto(StrToFloat(strCtto));
    end
    else MessageDlg('Revise que el contrato haya sido capturado',mtWarning,[mbOK],0);
  End;
end;


procedure TWContrato.btnEliminarProspectoClick(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('CTTO_NELIMINAPRO',True,True) Then
  Begin
    { Validación del Acceso de la Operación Especial EP-Eliminación de Prospectos}
    if GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(objeto.ClassName)+''') AND (CVE_USUARIO='''+objeto.DameUsuario+''') and (CVE_OPER_ACC=''EP'')',
       objeto.SeguDataBaseName,objeto.SeguSessionName,True) then
       btnEliminarProspecto.Enabled := True
    else begin
       btnEliminarProspecto.Enabled := False;
       Raise EInterFrame.Create('El Usuario no tiene permiso para Eliminar un Contrato de Prospectos. Consulte con su administrador');
    end;//else

    if MessageDlg('¿Esta seguro de eliminar el Prospecto ' + objeto.ID_Contrato.AsString + ' ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Objeto.EliminaProspecto;
  End;
end;

procedure TWContrato.sbCTOPRLVClick(Sender: TObject);  //MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES
var  T:TInterFindit;
     s,SIN:String;
     Q1:TQuery;
begin
  If Objeto.ValidaAccesoEsp('CTTO_CTOPRLV',True,True) Then
  Begin
    T:=Objeto.CreaBuscador('IntCtto.it','S,S');
    S:=T.WhereString;
    if SeguCto then begin
       Q1:=GetSQLQuery('SELECT B_EMPRESA,B_CONTRATO,B_UNID_NEG,B_USR_USR,USUARIO.ID_PERSONA, USUARIO.ID_EMPRESA, EMPLEADO.ID_EMPRESA AS EMPRESA_EMPLEADO,EMPLEADO.ID_ENTIDAD, USUARIO.CVE_TIPO_USUARIO FROM USUARIO,EMPLEADO WHERE (USUARIO.CVE_USUARIO='''+
                       Objeto.DameUsuario+''') and (Empleado.Id_Persona=Usuario.Id_Persona)',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
       if Q1=nil then begin
          Raise EInterFrame.Create('Posiblemente el Usuario y el Empleado tiene Id_Personas Diferentes o no Existe el Usuario');
          Exit;
       end;//if
       Try
         T.GroupQuery := True;
         T.HavingString := '(PKG_ACCECONTRATO.TIENEACCESO('''+Objeto.DameUsuario+''',ID_CONTRATO,'+Objeto.DameEmpresa+
                           ',ID_ENTIDAD,ID_EMPRESA,B_RESTRINGIDO,ID_PERS_ASOCIAD,CVE_SEGMENTO,ID_GRUPO'+
                           ','''+Q1.FieldByName('CVE_TIPO_USUARIO').AsString+''','''+Q1.FieldByName('B_EMPRESA').AsString+''''+
                           ','''+Q1.FieldByName('B_CONTRATO').AsString+''','''+Q1.FieldByName('B_UNID_NEG').AsString+''''+
                           ','''+Q1.FieldByName('B_USR_USR').AsString+''','+Q1.FieldByName('ID_PERSONA').AsString+
                           ','+Q1.FieldByName('ID_EMPRESA').AsString+','+Q1.FieldByName('EMPRESA_EMPLEADO').AsString+
                           ','+Q1.FieldByName('ID_ENTIDAD').AsString+')=1)';
       Finally
         Q1.Free;
       end; //Try & Finally
    end;//if segucto
    T.WhereString:=S;
    T.CamposResultado:='';
    try
      GetSQLStr('SELECT TX_CTO_PRLV FROM DV_PARAMETRO WHERE ID_PARAMETRO=''00'' ',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'TX_CTO_PRLV',SIN,False);
      T.WhereString:=' ID_TITULAR='+Objeto.ID_Titular.AsString+ ' AND  CONTRATO.CVE_TIP_CONTRATO IN '+SIN;
      if T.Execute then
      begin
         Objeto.ID_CTO_PRLV.AsString:=T.DameCampo(0);
         Q1:=GetSQLQuery('SELECT NOMBRE FROM PERSONA WHERE ID_PERSONA = '+T.DameCampo(1),Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
         edNomPRLV.Text:=Q1.FieldByName('NOMBRE').AsString;
         Q1.Free;
      end;//if
    finally
      T.Free;
    end; {end-try}
  End;
end;

procedure TWContrato.sbCTOFONDOSClick(Sender: TObject);  //MARA4356 DIC 2006 PARA NUEVO PRODUCTO DE CHEQUES
var  T:TInterFindit;
     s,SIN:String;
     Q1:TQuery;
begin
  If Objeto.ValidaAccesoEsp('CTTO_CTOFONDOS',True,True) Then
  Begin
    T:=Objeto.CreaBuscador('IntCtto.it','S,S');
    S:=T.WhereString;
    if SeguCto then begin
       Q1:=GetSQLQuery('SELECT B_EMPRESA,B_CONTRATO,B_UNID_NEG,B_USR_USR,USUARIO.ID_PERSONA, USUARIO.ID_EMPRESA, EMPLEADO.ID_EMPRESA AS EMPRESA_EMPLEADO,EMPLEADO.ID_ENTIDAD, USUARIO.CVE_TIPO_USUARIO FROM USUARIO,EMPLEADO WHERE (USUARIO.CVE_USUARIO='''+
                       Objeto.DameUsuario+''') and (Empleado.Id_Persona=Usuario.Id_Persona)',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
       if Q1=nil then begin
          Raise EInterFrame.Create('Posiblemente el Usuario y el Empleado tiene Id_Personas Diferentes o no Existe el Usuario');
          Exit;
       end;//if
       Try
         T.GroupQuery := True;
         T.HavingString := '(PKG_ACCECONTRATO.TIENEACCESO('''+Objeto.DameUsuario+''',ID_CONTRATO,'+Objeto.DameEmpresa+
                           ',ID_ENTIDAD,ID_EMPRESA,B_RESTRINGIDO,ID_PERS_ASOCIAD,CVE_SEGMENTO,ID_GRUPO'+
                           ','''+Q1.FieldByName('CVE_TIPO_USUARIO').AsString+''','''+Q1.FieldByName('B_EMPRESA').AsString+''''+
                           ','''+Q1.FieldByName('B_CONTRATO').AsString+''','''+Q1.FieldByName('B_UNID_NEG').AsString+''''+
                           ','''+Q1.FieldByName('B_USR_USR').AsString+''','+Q1.FieldByName('ID_PERSONA').AsString+
                           ','+Q1.FieldByName('ID_EMPRESA').AsString+','+Q1.FieldByName('EMPRESA_EMPLEADO').AsString+
                           ','+Q1.FieldByName('ID_ENTIDAD').AsString+')=1)';
       Finally
         Q1.Free;
       end;//Try & Finally
    end;//if
    T.WhereString:=S;
    T.CamposResultado:='';
    try
      GetSQLStr('SELECT TX_CTO_FONDO FROM DV_PARAMETRO WHERE ID_PARAMETRO=''00'' ',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'TX_CTO_FONDO',SIN,False);
      T.WhereString:=' ID_TITULAR='+Objeto.ID_Titular.AsString+
                     ' AND  CONTRATO.CVE_TIP_CONTRATO IN '+SIN;// ''CIBC'' ';
      if T.Execute then
      begin
         Objeto.ID_CTO_FDOS.AsString:=T.DameCampo(0);
         Q1:=GetSQLQuery('SELECT NOMBRE FROM PERSONA WHERE ID_PERSONA = '+T.DameCampo(1),Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
         edFONDO.Text:=Q1.FieldByName('NOMBRE').AsString;
         Q1.Free;
      end;//if
    finally
      T.Free;
    end; {end-try}
  End;
end;

procedure TWContrato.edID_CTO_PRLVChange(Sender: TObject);
VAR  Q1:TQuery;
begin
   IF TRIM(edID_CTO_PRLV.Text)<>'' THEN
   BEGIN
       Q1:=GetSQLQuery('SELECT NOMBRE FROM PERSONA WHERE ID_PERSONA = (SELECT ID_TITULAR FROM CONTRATO WHERE ID_CONTRATO ='+ edID_CTO_PRLV.Text +')'
           ,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
       edNomPRLV.Text:=Q1.FieldByName('NOMBRE').AsString;
       Q1.Free;
   END
   ELSE
       edNomPRLV.Text:='';
end;

procedure TWContrato.edID_CTO_FDOSChange(Sender: TObject);
VAR  Q1:TQuery;
begin
   IF TRIM(edID_CTO_FDOS.Text)<>'' THEN
   BEGIN
       Q1:=GetSQLQuery('SELECT NOMBRE FROM PERSONA WHERE ID_PERSONA = (SELECT ID_TITULAR FROM CONTRATO WHERE ID_CONTRATO ='+ edID_CTO_FDOS.Text +')'
           ,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
       edFONDO.Text:=Q1.FieldByName('NOMBRE').AsString;
       Q1.Free;
   END
   ELSE
       edFONDO.Text:='';
end;

procedure TWContrato.btnVisitaDomiClick(Sender: TObject);
Var
  VisitaDomi: TCtoVisDom;
begin
  If Objeto.ValidaAccesoEsp('CTTO_NVISITADOMI',True,True) Then
  Begin
    if objeto.Active then
    begin
        Try
          VisitaDomi:= TCtoVisDom.Create(Self);
          VisitaDomi.MasterSource:= Objeto;
          VisitaDomi.GetParams(Objeto);

          if Length(edContrato.Text) > 0 then
            VisitaDomi.vpIdContrato := StrToInt(edContrato.Text)
          else
            VisitaDomi.vpIdContrato := 0;

          VisitaDomi.Catalogo;
        Finally
          if VisitaDomi <> nil then
            VisitaDomi.Free;
        end;
    end
    else Raise EInterFrame.Create('No hay un contrato activo');
  End;
end;

procedure TWContrato.cbCveRegimenDropDown(Sender: TObject);
begin
  //
end;

procedure TWContrato.cbCveRegimenDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
    if (odSelected in state) Then
    begin
      cbCveRegimen.Canvas.Brush.Color := clHighlight;
      cbCveRegimen.Canvas.Font.Color := clHighlightText;
    end
    else if (odDisabled in state) Then
    begin
      cbCveRegimen.Canvas.Brush.Color := clBtnFace;
      cbCveRegimen.Canvas.Font.Color := clWindowText;
    end
    else
    begin
      cbCveRegimen.Canvas.Brush.Color := clWindow;
      cbCveRegimen.Canvas.Font.Color := clWindowText;
    end;

    If Index = 2 then
    Begin
      cbCveRegimen.Canvas.Brush.Color := clBtnFace;
      cbCveRegimen.Canvas.Font.Color := clWindowText;
    end;

    cbCveRegimen.Canvas.FillRect(Rect);
    cbCveRegimen.Canvas.TextOut(rect.Left, rect.Top, objeto.Cve_Regimen.ComboLista.Strings[index]);
end;

procedure TWContrato.cbCveRegimenClick(Sender: TObject);
begin
  if (objeto.Modo = moEdit) or (objeto.modo = moAppend) then
  Begin
    If (cbCveRegimen.ItemIndex = 2) and (objeto.Cve_Regimen.AsString <> 'MA') Then
      cbCveRegimen.ItemIndex:= 1;
  end;
end;

//--> CZR 26-feb-2009   Compara que la informacion del Propecto y Titular sea igual
Function TWContrato.Verifica_ProspectoTitular : String;
var
   Qry        : TQuery;
   vResultado : String;
   vOriRec    : String;
begin
   Try
      Try
         vResultado := 'F';

         If ((Objeto.Modo = moEdit) or (Objeto.Modo = moAppend)) and (Objeto.Prospecto.Active) Then
            with Qry do
            begin
               Qry          := TQuery.Create(Nil);
               DataBaseName := objeto.DataBaseName;
               SessionName  := objeto.SessionName;
               SQL.Clear;
               SQL.Text     := 'Select PKGCORPORATIVO.VERIFICA_PROSPECTOTITULAR'
                             + '(' + IntToStr(objeto.ID_Titular.AsInteger) + ', '
                                   + IntToStr(objeto.ID_Prospecto.AsInteger) + ', '''
                                   + trim(objeto.CVE_ACTIV_CTO.AsString) + ''', '''
                                   + trim(objeto.CONCEPTO.CVE_CONCEP_CTTE.AsString) + ''') RESULTADO '
                             + 'From DUAL';
               Open;
               vResultado   := trim(FieldByName('RESULTADO').AsString);
            end;
      except
         on e : exception do
         begin
            MessageDlg(e.Message, mtError, [mbOK], 0);
            vResultado := 'F';
         end;
      end;
   Finally
      if trim(vResultado) = 'F' then
         if (Objeto.Modo = moAppend) and (Objeto.Prospecto.Active) then
         begin
            Objeto.Prospecto.Active := False;
            edldProspecto.Text      := '';
            objeto.ID_Prospecto.GetFromControl;
         end;
      Qry.Free;
      result := vResultado;
   end;
end;
//--> CZR 26-feb-2009

//--> CZR 25-feb-2009  Buscador de Prospecto
procedure TWContrato.sbProspectoClick(Sender: TObject);
var
   vOriRec : String;
begin
  If Objeto.ValidaAccesoEsp('CTTO_PROSPECTO',True,True) Then
  Begin
     if objeto.Titular.Active = False then
        MessageDlg('Debe de Seleccionar un Titular.', mtError, [mbOK], 0)
     else
     begin
        if (InterForma1.CanEdit) and (Not InterForma1.IsNewData) then
        begin
           Try
              if objeto.Producto.Cve_Per_Jur_Prod.asString = 'PF' then
                 objeto.Prospecto.FilterBy      := fbTMProspectoFisica
              else if objeto.Producto.Cve_Per_Jur_Prod.asString = 'PM' then
                 objeto.Prospecto.FilterBy      := fbTMProspectoMoral
              else
                 objeto.Prospecto.FilterBy      := fbNinguno;
           Finally
              objeto.Prospecto.BuscaWhereString := '';
           end;
        end
        else
        begin
           if objeto.Producto.Cve_Per_Jur_Prod.asString = 'PF' then
              objeto.Prospecto.FilterBy := fbTMProspectoFisica
           else if objeto.Producto.Cve_Per_Jur_Prod.asString = 'PM' then
              objeto.Prospecto.FilterBy := fbTMProspectoMoral
           else
              objeto.Prospecto.FilterBy := fbNinguno;
        end;
        objeto.Prospecto.Busca;
     end;
  End;
end;
//<-- CZR 25-feb-2009

// CZR 05-mar-2009     Despues de Cancelar
procedure TWContrato.InterForma1DespuesCancelar(Sender: TObject);
var Qry :TQuery;
vExiste :Integer;
SQL :String;

begin
  if trim(objeto.ConfigCaptura.B_VAL_PRECALIFICA.AsString) = 'V' then
    Visibilidad_Prospecto(True)
  else
    Visibilidad_Prospecto(False);

  { * SACA4984
    * Deshabilitamos el check
  }

  vExiste := 0;
  chkCreaIFS.Enabled := False;
  chkCreaIFS.Checked := False;

  if(edPrefijo.Text = '1' ) then begin
    chkCreaIFS.Visible := True;

    Qry := GetSqlQuery('SELECT COUNT(1) EXISTE FROM CTO_IFS_ICB WHERE ID_CONTRATO=' +  edContrato.text,
                       objeto.DataBaseName, objeto.SessionName, True);
    if Qry <> nil then begin
      try
        vExiste := Qry.FieldByName('EXISTE').AsInteger;
      Finally
        Qry.Free;
      end;
    end;

    if(vExiste > 0) then
      chkCreaIFS.Checked := True
    else
      chkCreaIFS.Checked := False;
  end
  else
    chkCreaIFS.Visible := False;

  cambProm  := false;
  sitCambio := false;

  Objeto.Visibilidad_NivelRiesgo(False, True); // CZR 03-oct-2013

  Inhabilita_Atributos;                                                        //rohs4279 nov/2015 req. PMO150817
end;

// CZR 06-mar-2009     PopMenu de Prospecto
procedure TWContrato.MenuItem2Click(Sender: TObject);
begin
   if (objeto.Modo = moAppend) or (Objeto.Modo = moEdit) then
   begin
      Objeto.Prospecto.Active := False;
      edldProspecto.Text      := '';
      objeto.ID_Prospecto.GetFromControl;
   end;
end;

     //Procede a validar si el contrato se encuentra en la tabla de inet, habilita o deshabilita
     //la modificacion del password.

        //Validar si viene del boton modificar para habilitar toda esta parte
{
           Begin
            try
               strSql := 'select id_cto_asoc Contrato from net_cto_asoc where id_cto_asoc='+objeto.id_contrato.asString;
               vlQueryCmd              := TQuery.Create(Nil);
               vlQueryCmd.SessionName  := Apli.SessionName;
               vlQueryCmd.DatabaseName := Apli.DataBaseName;
               vlQueryCmd.SQL.Clear;
               vlQueryCmd.Close;
               vlQueryCmd.SQL.Add(strSql);
               vlQueryCmd.open   ;

             if not vlQueryCmd.IsEmpty then
                 ctoNet := vlQueryCmd.FieldByName('Contrato').AsString;
            finally
                 vlQueryCmd.Close;
                 vlQueryCmd.Free;
            end;

 }
procedure TWContrato.btnMailClick(Sender: TObject);
var w:TEmail;
    resp        :integer;
    vlQueryCmd  :Tquery;
    ctoNet      :string;
    strSql      :String;
    tipoAccesoM  :Boolean;
    habilita : boolean;
    idctto:String;
    isNuevo:boolean;

    strSqlCtto:String;
    vlQueryCtto:Tquery;
    vlProductoCtto:String;

begin
  If Objeto.ValidaAccesoEsp('CTTO_NMAIL',True,True) Then
  Begin
    habilita := false;
    w:=  TEmail.create(self);
    isNuevo := false;

    if not objeto.Active then
    begin
       Raise EInterFrame.Create('No existe un Contrato Activo.');
       Exit;
    end;//if

    //Wlopez [
    //Verifica Producto [
        strSqlCtto := ' SELECT CVE_TIP_CONTRATO FROM CONTRATO WHERE ID_CONTRATO = ' + objeto.ID_Contrato.AsString + ' AND SIT_CONTRATO = ' + chr(39) + 'AC' + chr(39);
        strSqlCtto := ' SELECT CVE_TIP_CONTRATO FROM EDC_PRODUCTO_EMAIL WHERE ID_EMPRESA = ' + objeto.Id_Empresa.AsString + ' AND CVE_TIP_CONTRATO = ' + chr(39) + objeto.Cve_Tip_Contrato.AsString + chr(39);
        vlQueryCtto              := TQuery.Create(Nil);
        vlQueryCtto.SessionName  := objeto.SessionName;
        vlQueryCtto.DatabaseName := objeto.DataBaseName;
        vlQueryCtto.SQL.Clear;
        vlQueryCtto.Close;
        vlQueryCtto.SQL.Add(strSqlCtto);
        //vlQueryCtto.ExecSQL;
        vlQueryCtto.open ;
        {if not vlQueryCtto.IsEmpty then
        begin
           vlProductoCtto := vlQueryCtto.FieldByName('CVE_TIP_CONTRATO').AsString;
        end;

        vlQueryCtto.Close;
        vlQueryCtto.Free;
        IF (vlProductoCtto <> 'CIBC') AND    //INTERMEDIACION BURSATIL
           (vlProductoCtto <> 'IFON') AND    //PRESTACION DE SERVICIOS BANCARIOS
           (vlProductoCtto <> 'OMSC') AND    //OPERACIONES DE MER. DIN. SIN CONTRATO
           (vlProductoCtto <> 'CDVI') AND    //DEPOSITOS A LA VISTA
           (vlProductoCtto <> 'INPA') THEN   //INVERSIONES A PLAZO
        BEGIN
           Raise EInterFrame.Create('Este prodcto no está configurado para envío de Estados de Cuenta vía eMail.');
           Exit;
        END;}

        if vlQueryCtto.IsEmpty then
        begin
           Raise EInterFrame.Create('Este prodcto no está configurado para envío de Estados de Cuenta vía eMail.');
           Exit;
        end;
    //Verifica Producto ]
    //Wlopez ]

       w.mail := objeto.cveCorreo;
       w.edMail.text := objeto.cveCorreo;
       w.mePass.text := objeto.pass;

    if GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(objeto.ClassName)+''') AND (CVE_USUARIO='''+objeto.DameUsuario+''') and (CVE_OPER_ACC=''WW'')',
       objeto.SeguDataBaseName,objeto.SeguSessionName,True) then
       tipoAccesoM := True
    else begin
       tipoAccesoM := False;
       objeto.cveCorreo := '';
       objeto.pass := '';
         messagedlg('El Usuario no tiene permiso para Capturar el Email para envios de EDC. Consulte con su administrador', mtInformation, [mbOK], 0);
    end;

  //Tipo oper = true es modificar de otro caso es nuevo
     try
        //Obtengo el contrato para setear el correo a la variable global
    if   tipoOper = true then
    begin
       //validar que si no esta confirmado el correo mandar error
       {
          strSql := '';
          strSql := strSql + 'select Correo,clave_correo Clave from cto_email_edc where id_contrato =  '+ objeto.ID_Contrato.AsString+' and id_producto = 0';

          vlQueryCmd              := TQuery.Create(Nil);
          vlQueryCmd.SessionName  := objeto.SessionName;
          vlQueryCmd.DatabaseName := objeto.DataBaseName;
          vlQueryCmd.SQL.Clear;
          vlQueryCmd.Close;
          vlQueryCmd.SQL.Add(strSql);
          vlQueryCmd.open   ;

          if not vlQueryCmd.IsEmpty then
             begin
               objeto.cvecorreo := vlQueryCmd.FieldByName('Correo').AsString;
               objeto.pass      := vlQueryCmd.FieldByName('Clave').AsString;
             end;
        }


       idctto := trim(EdIdContrato.Text);
          //Procedo a buscarlo en la bd de correos
       if (TRIM(idctto) <> '') and (trim(objeto.cveCorreo) = '') Then
       begin
          strSql := '';
          strSql := strSql + 'select Correo,clave_correo Clave from cto_email_edc where id_contrato =  '+ objeto.ID_Contrato.AsString+' and id_producto = 0';

          vlQueryCmd              := TQuery.Create(Nil);
          vlQueryCmd.SessionName  := objeto.SessionName;
          vlQueryCmd.DatabaseName := objeto.DataBaseName;
          vlQueryCmd.SQL.Clear;
          vlQueryCmd.Close;
          vlQueryCmd.SQL.Add(strSql);
          vlQueryCmd.open   ;

          if not vlQueryCmd.IsEmpty then
             begin
               objeto.cvecorreo := vlQueryCmd.FieldByName('Correo').AsString;
               objeto.pass      := vlQueryCmd.FieldByName('Clave').AsString;
               if objeto.cvecorreo = '' Then
                  Begin
                   cbEDC.Checked := false;
                   tipoOper := FALSE;
                   messagedlg('El Usuario no Cuenta con email para el envio de EDC.', mtInformation, [mbOK], 0);
                   end
               else
                 Begin
                 tipoOper := true;
                 If tipoAccesoM Then
                    Begin
                      cbEDC.Checked :=true;
                      cbEDC.enabled :=true;
                    end
                 else
                    Begin
                      //cbEDC.Checked := false;
                      cbEDC.enabled := false;
                    End;
                 end;
             end
          else
           begin
             cbEDC.Checked := false;
             isnuevo := true;
             iF not tipoAccesoM Then
                messagedlg('El Usuario no Cuenta con email para el envio de EDC.', mtInformation, [mbOK], 0);
           end;
       end
       else
       begin
       if  TRIM(idctto) = '' Then
           isNuevo  :=true ;
       end;
     end
     else
       begin
        isnuevo:=true;
       end;
      w.mepass.text  := objeto.pass ;
      w.mecpass.text := objeto.pass ;
      w.edMail.text  := objeto.cvecorreo;

        if tipoAccesoM Then
           Begin
             If not isNuevo Then
                Begin
                  if trim(w.mecpass.text)<>'' Then
                     Begin
                       w.lbpass.visible  := true;
                       w.lbcpass.visible := true;
                       w.mepass.visible  := true;
                       w.mecpass.visible := true;
                       w.lbMsg.visible := false;
                       ////////////////////////w.lbMensaje.visible := true;
                     end
                   Else
                      Begin
                        w.lbpass.visible  := false;
                        w.mepass.visible  := false;
                        w.lbcpass.visible := false;
                        w.mecpass.visible := false;
                        w.lbMsg.visible   := false;
                        //////////////////////w.lbMensaje.visible := false;
                      end;
                     w.btnAceptar.visible  := true;
                     w.btnCancelar.visible := true;
                     w.edMail.Enabled      := true;
                     cbEDC.enabled := true;
                end
             else
                Begin
                  w.lbpass.visible  := false;
                  w.mepass.visible  := false;
                  w.lbcpass.visible := false;
                  w.mecpass.visible := false;
                  ///////////////////////w.lbMensaje.visible := false;
                  w.lbMsg.visible   := false;

                  w.btnAceptar.visible  := true;
                  w.btnCancelar.visible := true;
                  w.edMail.Enabled      := true;
                  cbEDC.enabled := true;
                end;
            if (trim(objeto.cveCorreo)='') and (not isNuevo) and (TRIM(idctto)='') Then
                habilita := false
            else
                habilita := true;

          end
        else
          Begin
             w.lbpass.visible      := false;
             w.lbcpass.visible     := false;
             w.mepass.visible      := false;
             w.mecpass.visible     := false;
             w.btnAceptar.visible  := false;
             w.btnCancelar.visible := false;
             w.edMail.Enabled      := false;
             ////////////////////w.lbMensaje.visible := false;
             cbEDC.enabled := false;
             if trim(objeto.cveCorreo)='' Then
                habilita := false
             else
                habilita := true;
          end;

       If habilita Then
          Begin
             if w.ShowModal = mrOk Then
             begin
                  objeto.cveCorreo := trim(w.mail);
                  objeto.pass      := trim(w.mePass.Text);
                  cbEDC.Checked := true ;
                  bandElim := false;
                  if trim(objeto.cveCorreo)<>'' Then
                     begin
                        cbEDC.Enabled := true ;
                     end
                  else
                      cbEDC.Enabled := false ;
             end;
          end;
       finally
       w.free;
       end;
  End;
end;

//Funciones para el envio de correos
function TWContrato.GeneraMensaje(Mensaje:String;idCtto,cveCorreo,descPeriodo:String):string;
Var bodyHTML : string;
    para     : String;
    desc     : String;
    direcciones : Array[0..1] of string;
Begin
      direcciones[0] := cveCorreo;
      //desc := 'Envio de Estado de cuenta Correspondiente al periodo: ' + descPeriodo;

      //Esto es lo que aparece en el ASUNTO (SUBJECT) del eMail
      //desc := 'CONFIRMACION DE CUENTA DE CORREO PARA ICB ';
      //Esto es lo que aparece en el ASUNTO (SUBJECT) del eMail
      //Wlopez [
      //Verifica Producto [
          {strSqlCtto := ' SELECT CVE_TIP_CONTRATO FROM CONTRATO WHERE ID_CONTRATO = ' + idCtto + ' AND SIT_CONTRATO = ' + chr(39) + 'AC' + chr(39);
          vlQueryCtto              := TQuery.Create(Nil);
          vlQueryCtto.SessionName  := objeto.SessionName;
          vlQueryCtto.DatabaseName := objeto.DataBaseName;
          vlQueryCtto.SQL.Clear;
          vlQueryCtto.Close;
          vlQueryCtto.SQL.Add(strSqlCtto);
          //vlQueryCtto.ExecSQL;
          vlQueryCtto.open ;
          if not vlQueryCtto.IsEmpty then
          begin
             vlProductoCtto := vlQueryCtto.FieldByName('CVE_TIP_CONTRATO').AsString;
          end;

          vlQueryCtto.Close;
          vlQueryCtto.Free; }
          {IF (objeto.Id_Empresa.AsInteger = 1) THEN   //INTERMEDIACION BURSATIL
             desc := 'CONFIRMACION DE CUENTA DE CORREO PARA INTERACCIONES CASA DE BOLSA'
          ELSE
             desc := 'CONFIRMACION DE CUENTA DE CORREO PARA BANCO INTERACCIONES'; }

          IF (objeto.Id_Empresa.AsInteger = 1) THEN   //INTERMEDIACION BURSATIL
             desc := 'Servicio estado de cuenta vía Correo Electrónico Grupo Financiero Interacciones. Grupo Financiero Interacciones. Casa de Bolsa'
          ELSE
             desc := 'Servicio estado de cuenta vía Correo Electrónico Grupo Financiero Interacciones. Banco';
      //Verifica Producto ]
      //Wlopez ]

      bodyHTML := GetBodyMail(idCtto,cveCorreo,descPeriodo);
      para := chr(39)+cveCorreo+chr(39) ;
      Try
          SendMailExt('envioedc@interacciones.com','Estados de Cuenta por Email',direcciones,desc,bodyHTML);
      Except
          //No genera errores si no se puede enviar el mail o no puede reconectar la base de datos
          messagedlg('Existio un error al enviar el correo, avisarle al administrador', mtInformation, [mbOK], 0);
      end;
result:='';
end;

//Arma el cuerpo del correo
function TWContrato.GetBodyMail(idCtto,cveCorreo,descPeriodo:string):String;
var mensajeBody : string;
    httpMsg     : string;
    strSql:String;
    vlQueryCmd:Tquery;
    Servidor:String;
    puerto:string;
    ip:String;
    ServAux:String;

    strSqlCtto:String;
    vlQueryCtto:Tquery;
    vlProductoCtto:String;
begin
      //Wlopez [
      //Verifica Producto [
          strSqlCtto := ' SELECT CVE_TIP_CONTRATO FROM CONTRATO WHERE ID_CONTRATO = ' + idCtto + ' AND SIT_CONTRATO = ' + chr(39) + 'AC' + chr(39);
          vlQueryCtto              := TQuery.Create(Nil);
          vlQueryCtto.SessionName  := objeto.SessionName;
          vlQueryCtto.DatabaseName := objeto.DataBaseName;
          vlQueryCtto.SQL.Clear;
          vlQueryCtto.Close;
          vlQueryCtto.SQL.Add(strSqlCtto);
          vlQueryCtto.open ;
          //vlQueryCtto.ExecSQL;

          if not vlQueryCtto.IsEmpty then
          begin
             vlProductoCtto := vlQueryCtto.FieldByName('CVE_TIP_CONTRATO').AsString;
          end;

          vlQueryCtto.Close;
          vlQueryCtto.Free;
      //Verifica Producto ]
    //Wlopez ]
      Servidor:='';
      strSql := '';
      strSql := strSql + 'SELECT direccion_ip IP,Puerto FROM secu_servidor  where nom_servicio='+chr(39)+'EDCWEB'+chr(39);

      vlQueryCmd              := TQuery.Create(Nil);
      vlQueryCmd.SessionName  := objeto.SessionName;
      vlQueryCmd.DatabaseName := objeto.DataBaseName;
      vlQueryCmd.SQL.Clear;
      vlQueryCmd.Close;
      vlQueryCmd.SQL.Add(strSql);
      vlQueryCmd.open   ;

      // ----------------------[
      //Este bloque no quedo implementado, aqui es donde define produccion o desarrollo.
      //Ah, si seras de wey harpic.
      if not vlQueryCmd.IsEmpty then
      begin
           ip := vlQueryCmd.FieldByName('IP').AsString;
           puerto   := vlQueryCmd.FieldByName('Puerto').AsString;
      end;
      Servidor := ip + ':' + puerto;
      if Servidor = '' Then
         Servidor := '200.33.202.79:7035';

      // ----------------------]
    //Producción
    ServAux := 'www.interacciones.com';

    //QA
    //ServAux := '172.20.21.5:8002';

    //Desarrollo Wlopez
    //ServAux := '172.20.24.2:7001';

    httpMsg     := 'http://'+ ServAux +'/EDCWEBSERV/interServlet?Contrato='+idCtto+'&Correo='+cveCorreo;

    mensajeBody := mensajeBody + ('<html>');
    mensajeBody := mensajeBody + ('<head>');
    mensajeBody := mensajeBody + ('<title>Estados de Cuenta por Correo Electr&oacute;nico</title>');
    mensajeBody := mensajeBody + ('<style type="text/css">');
    mensajeBody := mensajeBody + ('.style1 {color: #FF9900}');
    mensajeBody := mensajeBody + ('.style2 {font-size: 10px;font-family: Arial, Helvetica, sans-serif;	color: #FFFFFF;	font-style: normal;	text-decoration: none;');
    mensajeBody := mensajeBody + ('}');
    mensajeBody := mensajeBody + ('</style>');
    mensajeBody := mensajeBody + ('</head>');
    mensajeBody := mensajeBody + ('<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">');
    mensajeBody := mensajeBody + ('<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-width: 0" bordercolor="#111111" width="100%" id="AutoNumber1" height="244">');
    mensajeBody := mensajeBody + ('<tr>');
    mensajeBody := mensajeBody + ('<td width="100%" style="border-style: none; border-width: medium" bgcolor="#E2E2E2" height="68" valign="top">');
    mensajeBody := mensajeBody + ('<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-width: 0" bordercolor="#111111" width="100%" id="AutoNumber5" height="72">');
    mensajeBody := mensajeBody + ('<tr>');
    mensajeBody := mensajeBody + ('<td width="33%" style="border-style: none; border-width: medium" height="70" bgcolor="#FF9900">');
    mensajeBody := mensajeBody + ('<p style="margin-left: 7">');
    //Wlopez [
    IF vlProductoCtto = 'CIBC' THEN
       mensajeBody := mensajeBody + ('<b><font face="Verdana, Arial, Helvetica, sans-serif" size="4" color="#FFFFFF">Interacciones Casa de Bolsa</font></b></td>')
    ELSE
       mensajeBody := mensajeBody + ('<b><font face="Verdana, Arial, Helvetica, sans-serif" size="4" color="#FFFFFF">Banco Interacciones</font></b></td>');
    //Wlopez ]
    mensajeBody := mensajeBody + ('<td width="16%" style="border-style: none; border-width: medium" height="70" bgcolor="#FF9900">&nbsp;</td>');
    mensajeBody := mensajeBody + ('<td width="51%" style="border-style: none; border-width: medium" height="70" bgcolor="#FF9900">');
    mensajeBody := mensajeBody + ('<p align="center" style="margin-top: 0; margin-bottom: 0"><b><i>');
    mensajeBody := mensajeBody + ('<font face="Verdana" color="#FFFFFF" size="2"></font></i></b><b><i><font face="Verdana" color="#FFFFFF"></font></i></b></p>');
    mensajeBody := mensajeBody + ('</td>');
    mensajeBody := mensajeBody + ('</tr>');
    mensajeBody := mensajeBody + ('</table>');
    mensajeBody := mensajeBody + ('</td>');
    mensajeBody := mensajeBody + ('</tr>');
    mensajeBody := mensajeBody + ('<tr>');
    mensajeBody := mensajeBody + ('<td width="100%" style="border-style: none; border-width: medium" height="14">');
    mensajeBody := mensajeBody + ('<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-width: 0" bordercolor="#111111" width="100%" id="AutoNumber2">');
    mensajeBody := mensajeBody + ('<tr>');
    mensajeBody := mensajeBody + ('<td width="20%" bgcolor="#000000" bordercolor="#E2E2E2" style="border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" align="center">');
    mensajeBody := mensajeBody + ('<b><font face="Arial" size="2" color="#FFFFFF"></font></b></td>');
    mensajeBody := mensajeBody + ('<td width="20%" bgcolor="#000000" bordercolor="#E2E2E2" style="border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" align="center">');
    mensajeBody := mensajeBody + ('<b><font face="Arial" size="2" color="#FFFFFF"></font></b></td>');
    mensajeBody := mensajeBody + ('<td width="20%" bgcolor="#000000" bordercolor="#E2E2E2" style="border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" align="center">');
    mensajeBody := mensajeBody + ('<b><font face="Arial" size="2" color="#FFFFFF"></font></b></td>');
    mensajeBody := mensajeBody + ('<td width="20%" bgcolor="#000000" bordercolor="#E2E2E2" style="border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" align="center">');
    mensajeBody := mensajeBody + ('<b><font face="Arial" size="2" color="#FFFFFF"></font></b></td>');
    mensajeBody := mensajeBody + ('<td width="20%" bgcolor="#000000" bordercolor="#E2E2E2" style="border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" align="center">');
    mensajeBody := mensajeBody + ('<b><font face="Arial" size="2" color="#FFFFFF">.</font></b></td>');
    mensajeBody := mensajeBody + ('</tr>');
    mensajeBody := mensajeBody + ('</table>');
    mensajeBody := mensajeBody + ('</td>');
    mensajeBody := mensajeBody + ('</tr>');
    mensajeBody := mensajeBody + ('<tr>');
    mensajeBody := mensajeBody + ('<td width="100%" style="border-style: none; border-width: medium" height="123" valign="top">');
    mensajeBody := mensajeBody + ('<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-width: 0" bordercolor="#111111" width="100%" id="AutoNumber6">');
    mensajeBody := mensajeBody + ('<tr>');
    mensajeBody := mensajeBody + ('<td width="10%" style="border-style: none; border-width: medium" bgcolor="#FF9900" valign="top">');
    mensajeBody := mensajeBody + ('<div align="center">');
    mensajeBody := mensajeBody + ('<center>');
    mensajeBody := mensajeBody + ('<p>&nbsp;</p>');
    mensajeBody := mensajeBody + ('</center>');
    mensajeBody := mensajeBody + ('</div>');
    mensajeBody := mensajeBody + ('<p>&nbsp;</p>');
    mensajeBody := mensajeBody + ('<p>&nbsp;</p>        </td>');
    
//    servidor = buscarServidor();

    mensajeBody := mensajeBody + ('<td width="80%" rowspan="2" valign="top" bgcolor="#FFFFFF" style="border-style: none; border-width: medium"> ');
 //   <h1 align="center" style="margin-left: 4; margin-top: 5; margin-bottom: 2; margin-right:5">');
   // mensajeBody := mensajeBody + ('<font face="Verdana, Arial, Helvetica, sans-serif"></font><font size="3" face="Verdana, Arial, Helvetica, sans-serif" color="#000000">');
    //mensajeBody := mensajeBody + ('</font></h1>');
    //mensajeBody := mensajeBody + ('<h1 align="center" style="margin-left: 4; margin-top: 5; margin-bottom: 2; margin-right:5">&nbsp;</h1>');
    //mensajeBody := mensajeBody + ('<h1 align="center" style="margin-left: 4; margin-top: 5; margin-bottom: 2; margin-right:5"><font size="3" face="Verdana, Arial, Helvetica, sans-serif" color="#000000"><br>');
   // mensajeBody := mensajeBody + ('<font color="#CC0000">BIENVENIDO AL ENVIO DE ESTADOS DE CUENTA POR CORREO</font></font></h1>');
   // mensajeBody := mensajeBody + ('<p align="center" style="margin-left: 4; margin-top: 5; margin-bottom: 2; margin-right:5">&nbsp;</p>');
   // mensajeBody := mensajeBody + ('<p align="center" style="margin-left: 4; margin-top: 5; margin-bottom: 2; margin-right:5">&nbsp;</p>');
   // mensajeBody := mensajeBody + ('<p align="center" style="margin-left: 4; margin-top: 5; margin-bottom: 2; margin-right:5"></p>');
   // mensajeBody := mensajeBody + ('<p align="center" style="margin-left: 4; margin-top: 5; margin-bottom: 2; margin-right:5">&nbsp;</p>');
   // mensajeBody := mensajeBody + ('<p align="center" style="margin-left: 4; margin-top: 5; margin-bottom: 2; margin-right:5">&nbsp;</p>');
    mensajeBody := mensajeBody + ('<table width="100%" border="0" cellpadding="20" cellspacing="0" style="margin-bottom: 2">    		');
    mensajeBody := mensajeBody + ('<tr>');
    mensajeBody := mensajeBody + ('<td><p align="left" style="margin-left: 4; margin-top: 5; margin-bottom: 2; margin-right:5"><font face="Verdana, Arial, Helvetica, sans-serif">');
    mensajeBody := mensajeBody + ('<font size="2" > <p><b> Estimado Cliente. </b></p></font>');
    mensajeBody := mensajeBody + ('</td>');
    mensajeBody := mensajeBody + ('</tr>');
    mensajeBody := mensajeBody + ('<tr>');
    mensajeBody := mensajeBody + ('<td><p align="left" style="margin-left: 4; margin-top: 5; margin-bottom: 2; margin-right:5"><font face="Verdana, Arial, Helvetica, sans-serif">');
    //Wlopez [
    IF (vlProductoCtto = 'CIBC') THEN
    BEGIN
       mensajeBody := mensajeBody + ('<font size="2" >Interacciones Casa de Bolsa, en atenci&oacute;n a su solicitud del servicio de </font>');

    END
    ELSE
    BEGIN
       mensajeBody := mensajeBody + ('<font size="2">Banco Interacciones, en atenci&oacute;n a su solicitud del servicio de </font>');
    END;


    mensajeBody := mensajeBody + ('<font size="2"><b>Env&iacute;o de Estados de Cuenta Mensual por Correo Electr&oacute;nico</b></font>');
    mensajeBody := mensajeBody + ('<font size="2"> y comprometido con su seguridad y confidencialidad le informamos que para poder desencriptar el archivo que contendr&aacute; su Estado de Cuenta requerir&aacute; de una contrase&ntilde;a.</font>');
    mensajeBody := mensajeBody + ('</td>');
    mensajeBody := mensajeBody + ('</tr>');

    mensajeBody := mensajeBody + ('<tr>');
    mensajeBody := mensajeBody + ('<td><p align="left" style="margin-left: 4; margin-top: 5; margin-bottom: 2; margin-right:5"><font face="Verdana, Arial, Helvetica, sans-serif">');
    mensajeBody := mensajeBody + ('<font size="2"> Favor de confirmar al siguiente link y la contrase&ntilde;a se enviar&aacute; a su correo electr&oacute;nico: </font>');
    mensajeBody := mensajeBody + (' </font><font face="Verdana, Arial, Helvetica, sans-serif"><font face="Verdana, Arial, Helvetica, sans-serif"><font face="Verdana, Arial, Helvetica, sans-serif"></font></font></font></p>');
    //Wlopez ]
   // mensajeBody := mensajeBody + ('<p align="left" style="margin-left: 4; margin-top: 5; margin-bottom: 2; margin-right:5">&nbsp;</p>');
   // mensajeBody := mensajeBody + ('</p>');
    mensajeBody := mensajeBody + ('</td>');
    mensajeBody := mensajeBody + ('</tr>');

    mensajeBody := mensajeBody + ('<tr>');
    mensajeBody := mensajeBody + ('<td align="center" >');
    mensajeBody := mensajeBody + ('<p> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"> <i>');
    mensajeBody := mensajeBody +  '<a href='+httpMsg+' target="_self">Generaci&oacute;n de Contrase&ntilde;a</a>';
    mensajeBody := mensajeBody + ('</i></font></p>');
   // mensajeBody := mensajeBody + ('<p></p>');
    mensajeBody := mensajeBody + ('<p></p></td>');
    mensajeBody := mensajeBody + ('</tr>');

    mensajeBody := mensajeBody + ('<td>');
    mensajeBody := mensajeBody + ('<tr>');
    mensajeBody := mensajeBody + ('<td><p align="left" style="margin-left: 4; margin-top: 5; margin-bottom: 2; margin-right:5"><font face="Verdana, Arial, Helvetica, sans-serif">');
    mensajeBody := mensajeBody + ('<font size="1"> <i>Nota:');
//    mensajeBody := mensajeBody + ('Posteriormente a su confirmaci&ón, se le  enviar&aacute; a trav&eacute;s de su correo electr&oacute;nico confirmado, la clave necesaria para  que pueda visualizar el archivo que contendr&aacute; su Estado de Cuenta mensual');
    mensajeBody := mensajeBody + ('Por favor, no responda a este mensaje ya que fue enviado desde una cuenta de correo electr&oacute;nico no monitoreada.');
    mensajeBody := mensajeBody + ('</i></font><font face="Verdana, Arial, Helvetica, sans-serif"><font face="Verdana, Arial, Helvetica, sans-serif"><font face="Verdana, Arial, Helvetica, sans-serif"></font></font></font></p>');
    mensajeBody := mensajeBody + ('<p align="left" style="margin-left: 4; margin-top: 5; margin-bottom: 2; margin-right:5">&nbsp;</p>');
    //mensajeBody := mensajeBody + ('</p>');
    //mensajeBody := mensajeBody + ('<p></p>');
    mensajeBody := mensajeBody + ('<p></p></td>');

    mensajeBody := mensajeBody + ('</tr>');

    mensajeBody := mensajeBody + ('</table>        </td>');
    mensajeBody := mensajeBody + ('</tr>');
    mensajeBody := mensajeBody + ('<tr>');
    mensajeBody := mensajeBody + ('<td style="border-style: none; border-width: medium" bgcolor="#FF9900" valign="bottom"><p></p>          </td>');
    mensajeBody := mensajeBody + ('</tr>');
    mensajeBody := mensajeBody + ('</table>');
    mensajeBody := mensajeBody + ('</td>');
    mensajeBody := mensajeBody + ('</tr>');
    mensajeBody := mensajeBody + ('<tr>');
    mensajeBody := mensajeBody + ('<td width="100%" style="border-style: none; border-width: medium" height="17">');
    mensajeBody := mensajeBody + ('<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-width: 0" bordercolor="#111111" width="100%" id="AutoNumber3" height="1">');
    mensajeBody := mensajeBody + ('<tr>');
    mensajeBody := mensajeBody + ('<td width="100%" height="1" style="border-style: none; border-width: medium" valign="top" bgcolor="#111111">');
    mensajeBody := mensajeBody + ('<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-width: 0" bordercolor="#111111" width="100%" id="AutoNumber8">');
    mensajeBody := mensajeBody + ('<tr>');
    mensajeBody := mensajeBody + ('<td width="20%" bgcolor="#000000" bordercolor="#E2E2E2" style="border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" align="center">');
    mensajeBody := mensajeBody + ('<b></b></td>');
    mensajeBody := mensajeBody + ('<td width="20%" bgcolor="#000000" bordercolor="#E2E2E2" style="border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" align="center">');
    mensajeBody := mensajeBody + ('<b><font face="Arial" size="2" color="#FFFFFF"></font></b></td>');
    mensajeBody := mensajeBody + ('<td width="20%" bgcolor="#000000" bordercolor="#E2E2E2" style="border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" align="center">');
    mensajeBody := mensajeBody + ('<b><font face="Arial" size="2" color="#FFFFFF"></font></b></td>');
    mensajeBody := mensajeBody + ('<td width="20%" bgcolor="#000000" bordercolor="#E2E2E2" style="border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" align="center">');
    mensajeBody := mensajeBody + ('<b><font face="Arial" size="2" color="#FFFFFF">.</font></b></td>');
    mensajeBody := mensajeBody + ('<td width="20%" bgcolor="#000000" bordercolor="#E2E2E2" style="border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" align="center">');
    mensajeBody := mensajeBody + ('<b></b></td>');
    mensajeBody := mensajeBody + ('</tr>');
    mensajeBody := mensajeBody + ('</table>');
    mensajeBody := mensajeBody + ('</td>');
    mensajeBody := mensajeBody + ('</tr>');
    mensajeBody := mensajeBody + ('<tr>');
    mensajeBody := mensajeBody + ('<td width="100%" height="18" style="border-style: none; border-width: medium" bgcolor="#FF9900">');
    mensajeBody := mensajeBody + ('<p align="center"><b><font face="Arial" size="1" color="#FFFFFF">');
    mensajeBody := mensajeBody + ('Copyright 2010 Grupo Financiero Interacciones. All Rights Reserved. - </font></b>www.interacciones.com</td>');
    mensajeBody := mensajeBody + ('</tr>');
    mensajeBody := mensajeBody + ('</table>');
    mensajeBody := mensajeBody + ('</td>');
    mensajeBody := mensajeBody + ('</tr>');
    mensajeBody := mensajeBody + ('</table>');
    mensajeBody := mensajeBody + ('</body>');
    mensajeBody := mensajeBody + ('</html>	');


    result := mensajeBody;
end;
procedure TWContrato.cbEDCClick(Sender: TObject);
Var w:TEmail;
    resp       :integer;
    vlQueryCmd :Tquery;
    ctoNet     :string;
    strSql     :String;
    tipoAccesoM:boolean;
begin
if not vgValEnvEdoCta then   exit; // CZR 16-may-2013

If objeto.Active Then                      
Begin

  if GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(objeto.ClassName)+''') AND (CVE_USUARIO='''+objeto.DameUsuario+''') and (CVE_OPER_ACC=''WW'')',
     objeto.SeguDataBaseName, objeto.SeguSessionName,True) then
     tipoAccesoM := True
  else
     tipoAccesoM := False;

if tipoAccesoM Then
begin
If (not cbedc.checked)  Then
   Begin
    if trim(objeto.cveCorreo)<>'' Then
       begin
         if MessageDlg('Se eliminara el correo asociado a este correo para el envío del estado de cuenta, ¿desea continuar?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
            begin
             bandElim := true ;
             cbEDC.OnClick := nil;        // CZR 16-may-2013   Evitar que el evento se ejecute nuevamente, al activar el checkbox.
             cbEDC.Checked :=true ;
             cbEDC.OnClick := cbEDCClick; // CZR 16-may-2013
           end
         else
         begin
         bandElim := false ;
         end;
       end;
//     else
//    if trim(edContrato.text)<>'' Then  solicitaMail();
   End;
end;
end;
end;

function TWContrato.ValidarInsertMail(idContrato:String):integer;
Var resp       :integer;
    vlQueryCmd :Tquery;
    ctoIns     :integer;
    strSql     :String;
begin
  strSql := 'select Count(id_Contrato) Total from CTO_EMAIL_EDC where id_contrato='+idContrato+' and id_producto = 0';
  try
    vlQueryCmd              := TQuery.Create(Nil);
    vlQueryCmd.SessionName  := objeto.SessionName;
    vlQueryCmd.DatabaseName := objeto.DataBaseName;
    vlQueryCmd.SQL.Clear;
    vlQueryCmd.Close;
    vlQueryCmd.SQL.Add(strSql);
    vlQueryCmd.open   ;
    if not vlQueryCmd.IsEmpty then
       ctoIns := vlQueryCmd.FieldByName('Total').AsInteger;
  finally
   vlQueryCmd.Close;
   vlQueryCmd.Free;
  end;
  result := ctoIns;
end;

function TWContrato.solicitaMail():String;
Var w:TEmail;
    resp       :integer;
    vlQueryCmd :Tquery;
    ctoNet     :string;
    strSql     :String;
begin
     begin
     //Inicia
      ctoNet := '';
      w:=  TEmail.create(self);
      try
        w.mail := objeto.cveCorreo;
        w.edMail.text := objeto.cveCorreo;
        w.mePass.text := objeto.pass;
        //Procede a validar si el contrato se encuentra en la tabla de inet, habilita o deshabilita
       //la modificacion del password.

       //Validar si viene del boton modificar para habilitar toda esta parte

        If tipoOper  Then
           Begin
            try

             strSql := 'select id_cto_asoc Contrato from net_cto_asoc where id_cto_asoc='+objeto.id_contrato.asString;
             vlQueryCmd              := TQuery.Create(Nil);
             vlQueryCmd.SessionName  := objeto.SessionName;
             vlQueryCmd.DatabaseName := objeto.DataBaseName;
             vlQueryCmd.SQL.Clear;
             vlQueryCmd.Close;
             vlQueryCmd.SQL.Add(strSql);
             vlQueryCmd.open   ;

             if not vlQueryCmd.IsEmpty then
                 ctoNet := vlQueryCmd.FieldByName('Contrato').AsString;
             finally
                 vlQueryCmd.Close;
                 vlQueryCmd.Free;
             end;
             if trim(ctoNet) = '' Then
                Begin
                  //Hablita los controles y busca el password para modificarlo si es el caso
                  objeto.pass := '';
                  try
                    strSql := 'select Clave_Correo Pass from CTO_EMAIL_EDC where id_contrato='+objeto.id_contrato.asString;
                    vlQueryCmd              := TQuery.Create(Nil);
                    vlQueryCmd.SessionName  := objeto.SessionName;
                    vlQueryCmd.DatabaseName := objeto.DataBaseName;
                    vlQueryCmd.SQL.Clear;
                    vlQueryCmd.Close;
                    vlQueryCmd.SQL.Add(strSql);
                    vlQueryCmd.open   ;

                    if not vlQueryCmd.IsEmpty then
                       objeto.pass  := vlQueryCmd.FieldByName('Pass').AsString
                    else
                       objeto.pass  := '';
                  finally
                        vlQueryCmd.Close;
                        vlQueryCmd.Free;
                  end;

                  w.lbpass.visible  := true;
                  w.lbcpass.visible := true;
                  w.mepass.visible  := true;
                  w.mecpass.visible := true;

                  w.mepass.text  := objeto.pass ;
                  w.mecpass.text := objeto.pass ;

                  w.lbMsg.visible := false;

                end
                else
                begin
                  w.lbpass.visible  := false ;
                  w.lbcpass.visible := false;
                  w.mepass.visible  := false;
                  w.mecpass.visible := false;
                  w.lbMsg.visible := true;
                end;
           end
          else
            begin
                  w.lbpass.visible  := false ;
                  w.lbcpass.visible := false;
                  w.mepass.visible  := false;
                  w.mecpass.visible := false;
                  w.lbMsg.visible := true;
            end;


        if w.ShowModal = mrOk Then
           begin
              objeto.cveCorreo := trim(w.mail);
              objeto.pass := trim(w.mepass.text);
              MessageDlg(objeto.cveCorreo, mtError, [mbOK], 0);
              cbEDC.Checked := true ;
              bandElim := false;
           end
        else
           MessageDlg(objeto.cveCorreo, mtError, [mbOK], 0);
   finally
   w.free;
   end;
//Finaliza
     end;
result := '';
end;

procedure TWContrato.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
  objeto.cvecorreo := '' ;
  objeto.pass      :='';
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
function TWContrato.fUsuarioConCtaAperRec: Boolean;
var { VALIDA SI EL USUARIO SE ENCUENTRA EN EL ESQUEMA DE CONTROL DE MEDIOS DE DPVISTA }
  vResult : Integer;
begin
  GetSQLInt(Format(
                    ' SELECT COUNT(1) AS NUM FROM DV_USU_PROCE S '+
                    ' WHERE S.CVE_PROCESO = ''MEDIODIS'' '+
                    ' AND B_USU_ACTIVO = ''V''  AND S.CVE_USUARIO = ''%s'' ', [objeto.DameUsuario]
                   ),
                   Objeto.DataBaseName, objeto.SessionName,
                   'NUM', vResult, False);
  Result := (vResult > 0);

end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
function TWContrato.fEsCtoAperturaReciente( aIdContrato : Integer ): Boolean;
var { VALIDA SI LA CHEQUERA ES CONTRATO DE DEPOSITOS A LA VISTA }
  vResult : Integer;
begin
  GetSQLInt(Format(
                    ' SELECT COUNT(1) AS NUM FROM DV_MD_BIT_CTOS B '+
                    ' WHERE SIT_CTO_SOLIC = 1 '+
                    '   AND ID_CONTRATO = ''%d'' ', [aIdContrato]
                   ),
                   Objeto.DataBaseName, objeto.SessionName,
                   'NUM', vResult, False);
  Result := (vResult > 0);
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWContrato.pActualizaStockCtosAperturaReciente;
var
  stpNom : TStoredProc;
  vCodResp : Integer;
begin
  stpNom:=TStoredProc.Create(nil);
  stpNom.DatabaseName   := Objeto.Apli.DataBaseName;
  stpNom.SessionName    := Objeto.Apli.SessionName;
  stpNom.StoredProcName := 'PKGCTRLMEDIOS.STPACTUALIZASTOCKAPERREC';

  stpNom.Params.CreateParam(ftInteger, 'peID_CONTRATO'  , ptinput);
  stpNom.Params.CreateParam(ftString,  'peCVE_USUARIO'  , ptinput);

  stpNom.Params.CreateParam(ftInteger, 'psCOD_RESP'  , ptOutput);
  stpNom.Params.CreateParam(ftString,  'psSTR_RESP'  , ptOutput);

  stpNom.ParamByName('peID_CONTRATO').AsInteger := Objeto.ID_Contrato.AsInteger;
  stpNom.ParamByName('peCVE_USUARIO').AsString  := Objeto.DameUsuario;

  try
    try
      stpNom.ExecProc;
      vCodResp := stpNom.ParamByName('psCOD_RESP').AsInteger;
      if vCodResp <> 0 then
         MessageDlg(stpNom.ParamByName('psSTR_RESP').AsString+'-['+
         IntToStr(vCodResp)+']', mtWarning, [mbOK], 0);
    except
      on E: Exception do
      begin
        MessageDlg(E.Message, mtWarning, [mbOK], 0);
      end;
    end;
  finally
    stpNom.Free;
  end;

end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
function TWContrato.fObtenCtoDpVista: String;
var { OBTIENE CONTRATO DPVISTA CONSECUTIVO CON DIGITO VERIDICADOR }
  vContrato : String;
begin
  GetSQLStr(' SELECT PKGCTRLMEDIOS.FDAMENOCTAAPREC AS RESULT FROM DUAL',
            Objeto.DataBaseName, Objeto.SessionName, 'RESULT', vContrato, False);
  Result := vContrato;
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
function TWContrato.fEsPromotor: Boolean;
var { VALIDA SI LA PERSONA DEL USUARIO SE ENCUENTRA EN LA TABLA GPO_CONTRATO COMO PROMOTOR - PARA CTOS DPVISTA }
  vExiste : Integer;
begin
  GetSQLInt(Format('SELECT COUNT(1) AS NUM FROM GPO_CONTRATO WHERE '+
            'ID_PERS_ASOCIAD = %d',[objeto.DameUsuarioID]),
            Objeto.DataBaseName, Objeto.SessionName, 'NUM', vExiste, False);
  Result := (vExiste > 0 );
end;

procedure TWContrato.bOrigRecClick(Sender: TObject); // CZR 13-feb-2013
var
   OrigRec : TCOriRec;
begin
   if (not Objeto.Active) or (Objeto.Id_Contrato.AsInteger <= 0) then
   begin
      MessageDlg('No existe un Contrato Activo', mtInformation, [mbOK], 0);
      exit;
   end;
   if Objeto.ValidaAccesoEsp('CTTO_ORIGENREC', True, True) then
   begin
      OrigRec := TCOriRec.Create(Self);
      with OrigRec do
         try
            MasterSource := Objeto;
            GetParams(Objeto);
            pContrato    := Objeto;
            Catalogo;
         finally
            if OrigRec <> nil then   OrigRec.Free;   OrigRec := nil;
         end;
   end;
end;

procedure TWContrato.bDestRecClick(Sender: TObject); // CZR 13-feb-2013
var
   DestRec : TCDesRec;
begin
   if (not Objeto.Active) or (Objeto.Id_Contrato.AsInteger <= 0) then
   begin
      MessageDlg('No existe un Contrato Activo', mtInformation, [mbOK], 0);
      exit;
   end;
   if Objeto.ValidaAccesoEsp('CTTO_DESTINOREC', True, True) then
   begin
      DestRec := TCDesRec.Create(Self);
      with DestRec do
         try
            MasterSource := Objeto;
            GetParams(Objeto);
            pContrato    := Objeto;
            Catalogo;
         finally
            if DestRec <> nil then   DestRec.Free;   DestRec := nil;
         end;
   end;
end;

procedure TWContrato.bProdSolicClick(Sender: TObject); // CZR 19-feb-2013
var
   ProdSolic : TProSolCto;
begin
   if (not Objeto.Active) or (Objeto.Id_Contrato.AsInteger <= 0) then
   begin
      MessageDlg('No existe un Contrato Activo', mtInformation, [mbOK], 0);
      exit;
   end;
   if Objeto.ValidaAccesoEsp('CTTO_PROSOL', True, True) then
   begin
      ProdSolic := TProSolCto.Create(Self);
      with ProdSolic do
         try
            MasterSource := Objeto;
            GetParams(Objeto);
            pContrato    := Objeto;
            Catalogo;
         finally
            if ProdSolic <> nil then   ProdSolic.Free;   ProdSolic := nil;
         end;
   end;
end;

procedure TWContrato.bTransClick(Sender: TObject); // CZR 18-feb-2013
var
   Transaccionalidad : TCtoOp;
begin
   if (not Objeto.Active) or (Objeto.Id_Contrato.AsInteger <= 0) then
   begin
      MessageDlg('No existe un Contrato Activo', mtInformation, [mbOK], 0);
      exit;
   end;
   if Objeto.ValidaAccesoEsp('CTTO_OPERATIVID', True, True) then
   begin
      Transaccionalidad := TCtoOp.Create(Self);
      with Transaccionalidad do
         try
            MasterSource := Objeto;
            GetParams(Objeto);
            pContrato    := Objeto;
            Catalogo;
         finally
            if Transaccionalidad <> nil then   Transaccionalidad.Free;   Transaccionalidad := nil;

         end;
   end;
end;

procedure TWContrato.bPerExtClick(Sender: TObject); // CZR 12-abr-2013
var
   PerExtranjera : TCtoPerExt;
begin
   try
      if (not Objeto.Active) or (Objeto.Id_Contrato.AsInteger <= 0) then
         raise EInterFrame.Create('No existe un Contrato Activo');
      if Objeto.ValidaAccesoEsp('CTTO_PEREXT', True, True) then
      begin
         if not GetSQL('select * '
                     + '  from persona '
                     + ' where id_persona        = ' + Objeto.Titular.ID_Persona.AsSQL
                     + '   and cve_nacionalidad <> ' + QuotedStr(cPaisMexico),
                       Objeto.SeguDataBaseName, Objeto.SeguSessionName, True) then
            raise EInterFrame.Create('Esta información es requerida, solo en contratos con Titular Extranjero');
         PerExtranjera := TCtoPerExt.Create(Self);
         with PerExtranjera do
            try
               MasterSource := Objeto;
               GetParams(Objeto);
               pContrato    := Objeto;
               Catalogo;
            finally
               if PerExtranjera <> nil then   PerExtranjera.Free;   PerExtranjera := nil;
            end;
      end;
   except
      on e: EInterFrame do
         MessageDlg(e.Message, mtInformation, [mbOK], 0);
   end;
end;

procedure TWContrato.bRecExtClick(Sender: TObject); // CZR 15-abr-2013
var
   RecExt : TCtoRecExt;
begin
   try
      if (not Objeto.Active) or (Objeto.Id_Contrato.AsInteger <= 0) then
         raise EInterFrame.Create('No existe un Contrato Activo');
      if Objeto.ValidaAccesoEsp('CTTO_RECEXT', True, True) then
      begin
         if not GetSQL('select * '
                     + '  from persona '
                     + ' where id_persona        = ' + Objeto.Titular.ID_Persona.AsSQL
                     + '   and cve_per_juridica  = ' + QuotedStr(cPerMoral)
                     + '   and cve_nacionalidad <> ' + QuotedStr(cPaisMexico)
                     + '   and cve_residencia   <> ' + QuotedStr(cPaisMexico),
                       Objeto.SeguDataBaseName, Objeto.SeguSessionName, False) then
            raise EInterFrame.Create('Esta información es requerida, solo en contratos con Titular Moral Extranjero');
         RecExt := TCtoRecExt.Create(Self);
         with RecExt do
            try
               MasterSource := Objeto;
               GetParams(Objeto);
               pContrato    := Objeto;
               Catalogo;
            finally
               if RecExt <> nil then   RecExt.Free;   RecExt := nil;
            end;
      end;
   except
      on e: EInterFrame do
         MessageDlg(e.Message, mtInformation, [mbOK], 0);
   end;
end;

procedure TWContrato.bTipOpClick(Sender: TObject); // CZR 03-abr-2013
var
   TipoOp : TCtoOpAux;
begin
   if (not Objeto.Active) or (Objeto.Id_Contrato.AsInteger <= 0) then
   begin
      MessageDlg('No existe un Contrato Activo', mtInformation, [mbOK], 0);
      exit;
   end;
   if Objeto.ValidaAccesoEsp('CTTO_TIPOOPERAC', True, True) then
   begin
      TipoOp := TCtoOpAux.Create(Self);
      with TipoOp do
         try
            MasterSource := Objeto;
            GetParams(Objeto);
            pContrato    := Objeto;
            Catalogo;
         finally
            if TipoOp <> nil then   TipoOp.Free;   TipoOp := nil;

         end;
   end;
end;

procedure TWContrato.bRelComerClick(Sender: TObject); // CZR 21-mar-2013
var
   RelComer : TCtoRelCom;
begin
   if (not Objeto.Active) or (Objeto.Id_Contrato.AsInteger <= 0) then
   begin
      MessageDlg('No existe un Contrato Activo', mtInformation, [mbOK], 0);
      exit;
   end;
   if not GetSQL('select * '
               + '  from cto_operacion '
               + ' where id_contrato        = ' + Objeto.Id_Contrato.AsSQL
               + '   and cve_tipo_operacion = ''OPTRAINT''',
                  objeto.SeguDataBaseName, objeto.SeguSessionName, True) then
   begin
      MessageDlg('Debe seleccionar el Tipo de Operacion de Transferencias Internacionales', mtInformation, [mbOK], 0);
      exit;
   end;
   if Objeto.ValidaAccesoEsp('CTTO_RELCOM', True, True) then
   begin
      RelComer := TCtoRelCom.Create(Self);
      with RelComer do
         try
            MasterSource := Objeto;
            GetParams(Objeto);
            pContrato    := Objeto;
            Catalogo;
         finally
            if RelComer <> nil then   RelComer.Free;   RelComer := nil;
         end;
   end;
end;

procedure TWContrato.bTarSolicClick(Sender: TObject); // CZR 19-feb-2013
var
   TarSolic : TCtoSolTar;
begin
   if (not Objeto.Active) or (Objeto.Id_Contrato.AsInteger <= 0) then
   begin
      MessageDlg('No existe un Contrato Activo', mtInformation, [mbOK], 0);
      exit;
   end;
   if Objeto.ValidaAccesoEsp('CTTO_SOLTAR', True, True) then
   begin
      TarSolic := TCtoSolTar.Create(Self);
      with TarSolic do
         try
            MasterSource := Objeto;
            GetParams(Objeto);
            pContrato    := Objeto;
            Catalogo;
         finally
            if TarSolic <> nil then   TarSolic.Free;   TarSolic := nil;
         end;
   end;
end;

procedure TWContrato.bImptoClick(Sender: TObject); // CZR 20-feb-2013
var
   Impuestos : TCtoImpto;
begin
   if (not Objeto.Active) or (Objeto.Id_Contrato.AsInteger <= 0) then
   begin
      MessageDlg('No existe un Contrato Activo', mtInformation, [mbOK], 0);
      exit;
   end;
   if Objeto.ValidaAccesoEsp('CTTO_IMPTO', True, True) then
   begin
      Impuestos := TCtoImpto.Create(Self);
      with Impuestos do
         try
            MasterSource := Objeto;
            GetParams(Objeto);
            pContrato    := Objeto;
            Catalogo;
         finally
            if Impuestos <> nil then   Impuestos.Free;   Impuestos := nil;
         end;
   end;
end;

procedure TWContrato.bAsigSitKYCClick(Sender: TObject); // CZR 01-abr-2013
var
   Qry           : TQuery;
   vCtoSitKYCOld : String;
   vCtoSitKYCNew : String;
   vResultado    : Boolean;
begin
   try
      if Objeto.ValidaAccesoEsp('CTTO_SITKYC', True, True) then
      begin
         vCtoSitKYCOld := trim(CtoSituacionKYC(Objeto, Objeto.ID_Contrato.AsInteger, cClave));            // Situacion Anterior
         vCtoSitKYCNew := trim(TString(Objeto.pcbSitKYC.Items.Objects[Objeto.pcbSitKYC.ItemIndex]).pStr); // Situacion Nueva

         // Validar Restricciones Principales
         if (not Objeto.Active) or (Objeto.Id_Contrato.AsInteger <= 0) then
            raise EInterFrame.Create('No existe un Contrato Activo');
         if (not objeto.TieneAcceso(cRolUsrPromocion)) and (not objeto.TieneAcceso(cRolUsrContratos)) then
            raise EInterFrame.Create('No cuenta con un rol configurado para esta Accion');
         if trim(vCtoSitKYCOld) = trim(vCtoSitKYCNew) then
            raise EInterFrame.Create('La Situación KYC no ha sido modificada');
         if trim(vCtoSitKYCNew) = cSinAutor then
            raise EInterFrame.Create('No cuenta con permisos para asignar la Situacion KYC seleccionada. Operacion Cancelada');

         // Validar Usuario
         try
            Qry := GetSQLQuery('select sit.id_contrato, sit.cve_sit_kyc, sit.cve_usr_alta, sit.fh_alta, '
                             + '       sit.cve_usr_modifica, sit.fh_modifica, per.nombre as nom_usr_alta '
                             + '  from cto_situacion_kyc  sit '
                             + '       inner join usuario usr on usr.cve_usuario = cve_usr_alta '
                             + '       inner join persona per on per.id_persona  = usr.id_persona '
                             + ' where sit.id_contrato  = ' + Objeto.ID_Contrato.AsSQL
                             + '   and sit.cve_sit_kyc  = ' + QuotedStr(cAutPromocion),
                               Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
            if Qry <> nil then
            begin
               // Validar que el usuario que Autoriza por Contratos, no es el mismo que Autorizo por Promocion
               if trim(vCtoSitKYCNew) = cAutContratos then
               begin
                  if trim(Qry.FieldByName('CVE_USR_ALTA').AsString) = trim(UpperCase(objeto.DameUsuario)) then
                     raise EInterFrame.Create('El usuario que Autoriza por Contratos, no puede ser el mismo que Autorizo por Promocion. Operacion Cancelada');
               end;
               // Validar que el usuario que Rechaza por Contratos, no es el mismo que Autorizo por Promocion
               if trim(vCtoSitKYCNew) = cRecContratos then
               begin
                  if trim(Qry.FieldByName('CVE_USR_ALTA').AsString) = trim(UpperCase(objeto.DameUsuario)) then
                     raise EInterFrame.Create('El usuario que Rechaza por Contratos, no puede ser el mismo que Autorizo por Promocion. Operacion Cancelada');
               end;
               // Validar que solo el usuario que Autorizo por Promocion, sea el que puede volver Autorizar en caso de haber sido Rechazado por Contratos
               if trim(vCtoSitKYCNew) = cAutPromocion then
               begin
                  if trim(Qry.FieldByName('CVE_USR_ALTA').AsString) <> trim(UpperCase(objeto.DameUsuario)) then
                     raise EInterFrame.Create('Solo ' + trim(Qry.FieldByName('NOM_USR_ALTA').AsString) + ' puede Autorizar por Promocion este Contrato. Operacion Cancelada');
               end;
            end;
         finally
            if Qry <> nil then
               Qry.Free;
         end;

         // Validar Asignacion
         if (trim(vCtoSitKYCNew) = cSinAutor) or (trim(vCtoSitKYCNew) = cAutPromocion) then
         begin
            if objeto.TieneAcceso(cRolUsrPromocion) then
            begin
               if (trim(vCtoSitKYCOld) = cAutPromocion) or (trim(vCtoSitKYCOld) = cAutContratos) then
                  raise EInterFrame.Create('Solo puede Asignar la Situacion KYC si esta se encuentra: ' + chr(13) + chr(13) + chr(10)
                                         + '     - Sin Autorizacion '        + chr(13) + chr(10)
                                         + '     - Rechazado por Contratos ' + chr(13) + chr(13) + chr(10)
                                         + 'Operacion Cancelada');
            end
            else
               raise EInterFrame.Create('No cuenta con permisos para asignar la Situacion KYC seleccionada. Operacion Cancelada');
         end;
         if (trim(vCtoSitKYCNew) = cAutContratos) or (trim(vCtoSitKYCNew) = cRecContratos) then
         begin
            if objeto.TieneAcceso(cRolUsrContratos) then
            begin
               if (trim(vCtoSitKYCOld) = cSinAutor) or (trim(vCtoSitKYCOld) = cRecContratos) then
                  raise EInterFrame.Create('Solo puede Asignar la Situacion KYC si esta se encuentra: ' + chr(13) + chr(13) + chr(10)
                                         + '     - Autorizado por Promocion ' + chr(13) + chr(10)
                                         + '     - Autorizado por Contratos ' + chr(13) + chr(13) + chr(10)
                                         + 'Operacion Cancelada');
            end
            else
               raise EInterFrame.Create('No cuenta con permisos para asignar la Situacion KYC seleccionada. Operacion Cancelada');
         end;

         // Validar Informacion KYC
         if (trim(vCtoSitKYCNew) = cAutPromocion) or (trim(vCtoSitKYCNew) = cAutContratos) then
         begin
            if trim(vCtoSitKYCNew) = cAutPromocion then
               vResultado := GetSQL('select * '
                                  + ' from (table(pkgKYCFunProc.ValInfoKYC(' + Objeto.ID_Contrato.AsSQL    + ', '
                                                                             + QuotedStr(cRolUsrPromocion) + ', '
                                                                             + QuotedStr(cVerdadero)       + '))) '
                                  + 'where valor = 0',
                                    Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
            if trim(vCtoSitKYCNew) = cAutContratos then
               vResultado := GetSQL('select * '
                                  + ' from (table(pkgKYCFunProc.ValInfoKYC(' + Objeto.ID_Contrato.AsSQL    + ', '
                                                                             + QuotedStr(cRolUsrContratos) + ', '
                                                                             + QuotedStr(cVerdadero)       + '))) '
                                  + 'where valor = 0',
                                    Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
            if vResultado then
            begin
               Objeto.ObtenerSituacionKYC;
               exit;
            end;
         end;

         // Asignar Situacion
         vResultado := GetSQL('select * from cto_situacion_kyc where id_contrato = ' + Objeto.ID_Contrato.AsSQL + ' and cve_sit_kyc = ' + QuotedStr(vCtoSitKYCNew),
                              Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
         if vResultado then
            RunSQL('update cto_situacion_kyc '
                 + '   set cve_usr_modifica = ' + QuotedStr(UpperCase(objeto.DameUsuario)) + ', '
                 + '       fh_modifica      = sysdate '
                 + ' where id_contrato = ' + Objeto.ID_Contrato.AsSQL
                 + '   and cve_sit_kyc = ' + QuotedStr(vCtoSitKYCNew),
                   Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True)
         else
            RunSQL('insert into cto_situacion_kyc (id_contrato, cve_sit_kyc, cve_usr_alta, fh_alta, cve_usr_modifica, fh_modifica) '
                 + 'values(' + Objeto.ID_Contrato.AsSQL                 + ', '
                             + QuotedStr(vCtoSitKYCNew)                 + ', '
                             + QuotedStr(UpperCase(objeto.DameUsuario)) + ', '
                             + 'sysdate, '
                             + QuotedStr(UpperCase(objeto.DameUsuario)) + ', '
                             + 'sysdate)',
                   Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
         raise EInterFrame.Create('La Situacion KYC se asigno con exito');
      end;
   except
      on e: EInterFrame do
      begin
         MessageDlg(e.Message, mtInformation, [mbOK], 0);
         if (Objeto.Active) and (Objeto.Id_Contrato.AsInteger <> 0) then
            Objeto.ObtenerSituacionKYC;
      end;
   end;
end;

procedure TWContrato.sbServicioFinClick(Sender: TObject);
begin
  Objeto.Servicio.Busca;
end;

procedure TWContrato.sbTipCteClick(Sender: TObject);
begin
  Objeto.TipoServicio.BuscaWhereString := ' (sit_tip_cte = ' + Quotedstr('AC') + ') ';
  Objeto.TipoServicio.Busca;
  Objeto.CVE_DISCRECIONAL.AsString := Objeto.TipoServicio.CVE_DISCRECIONAL.AsString;
  Objeto.Servicio.FindKey([Objeto.TipoServicio.CVE_SERVICIO_FIN.AsString]);
//  Objeto.Cve_ServicioFin.AsString  := Objeto.TipoServicio.CVE_SERVICIO_FIN.AsString;
  solicitaCuestionario();                                                      //rohs4279 nov/2015 req. PMO150817
end;

procedure TWContrato.edCveServicioFinChange(Sender: TObject);
begin
//   Objeto.TipoServicio.BuscaWhereString := '(CVE_SERVICIO_FIN = TRIM('''+  edCveServicioFin.Text +'''))' ;
//   edCveTipCte.Text  := '';
//   edDescTipCte.Text := '';
end;

procedure TWContrato.sbMotCamPromClick(Sender: TObject);
begin
    Objeto.MotCambPromotor.Busca;
end;

procedure TWContrato.edNombrePromotorChange(Sender: TObject);
begin
   if Interforma1.IsNewData then
      cambProm := False
   else
   begin
      if (objeto.Modo = moAppend) then
      begin
         edReact.ReadOnly    := True;
         edReact.Color       := clBtnFace;
         edReact.Text        := '';
         DatePicker4.Enabled := False;
      end;
      if (objeto.Modo = moAppend) or (objeto.Modo = moEdit) then
      begin
         cambProm                  := True;
         tabMotivo.Caption         := 'Motivos';
         tabMotivo.PageControl     := pageInfo;
         gpoMotCambioProm.Visible  := cambProm;
         edCveMotivoProm.Text      := '';
         edMotivoProm.Text         :='';
         edCveGpoMotivo.Text       := '';
         if sitCambio = False then gpoMotCambioProm.Top := 8;
      end;
   end;
end;

procedure TWContrato.edNombrePromotorDblClick(Sender: TObject);
begin
   if objeto.Active And  (objeto.Modo <> moAppend) And (objeto.Modo <> moEdit) then
      ExecuteRepCProm(Objeto, True, '', 0, 0, '', '', '', edContrato.Text, '');
end;

procedure TWContrato.sbPsiEvaluaClick(Sender: TObject);
begin
        if (objeto.Modo = moEdit) then
        begin
             if ( MessageDlg('Si usted realiza modificaciones al folio de cuestionario se recalcularan los montos maximos permitidos '  +  chr(13)
                           + 'para todos los rubros configurados para este contrato' +  chr(13)
                           + '¿ Esta seguro de continuar con la modificación ?', mtConfirmation, [mbYes, mbNO], 0) = mrYes) Then
             Begin
                objeto.PsiEvaluacion.Busca;
                edIdTipoPerfil.Text   := '';
                edDescTipoPerfil.Text := '';
             End
        end
        Else
        Begin
           objeto.PsiEvaluacion.Busca;
           edIdTipoPerfil.Text   := '';
           edDescTipoPerfil.Text := '';
        End;
end;

procedure TWContrato.sbMaxPerfilClick(Sender: TObject);
var sSql : String;
    Qry  : TQuery;
begin
  If edIdEvaluacion.Text = '' then Begin
    MessageDlg('Debe de proporcionar un folio de Cuestionario antes de seleccionar un perfil',mtError,[mbOK],0);
    InterForma1.ShowError:=False;
    exit;
  End
  Else Begin
    if (objeto.Modo = moEdit) And (objeto.Id_Evaluacion.AsString = edIdEvaluacion.Text) then begin
      if ( MessageDlg('Si realiza modificaciones al perfil asignado se recalcularan los montos maximos permitidos' +  chr(13)
                      + 'para todos los rubros configurados para este contrato' +  chr(13)
                      + '¿ Esta seguro de continuar con la modificación ?', mtConfirmation, [mbYes, mbNO], 0) = mrYes) Then Begin
                {Si os documentos adicionales no estan completos no dejar cambiar el Perfil mas de 101 (I-BASICO)}
{                 sSql := 'Select Count(1) as N_DOC_ADIC '
                       + ' From Psi_Doc_Adic_Empresa a, Psi_Evaluacion e'
                       + ' Where 1 = 1 '
                       +   ' And e.id_evaluacion   = ' +  edIdEvaluacion.Text
                       +   ' And a.Id_Empresa      = e.id_empresa '
                       +   ' And a.Id_Cuestionario = e.Id_Cuestionario '
                       +   ' And Sit_Documento   = ''AC'' '
                       +   ' And a.Cve_Documento Not In ( Select Cve_Documento '
                       +                                ' From Doc_Adic_Persona '
                       +                               ' Where 1 = 1 '
                       +                                 ' And Id_Contrato = ' + edContrato.Text
                       +                               ' )' ;
                try
                   Qry := GetSQLQuery( sSql ,Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
                   if Qry <> nil then
                   begin
                      if trim(Qry.FieldByName('N_DOC_ADIC').AsString) = '0' Then
                      Begin
                         Objeto.PsiMaxPerfil.BuscaWhereString := 'Eval.Id_Evaluacion = ' + edIdEvaluacion.Text;
                      End
                      Else
                      Begin
                         if ( objeto.Sit_Contrato.ComboDatos.Strings[rgSituacion.ItemIndex] = 'AC' ) Then
                         Begin
{                             MessageDlg('Es necesario capturar los documentos adicionales para que se desplieguen todos los perfiles del folio de cuestionario', mtInformation, [mbOK], 0);
                             Objeto.PsiMaxPerfil.BuscaWhereString := 'Eval.Id_Evaluacion = 1';
                         End
                         Else
                         Begin}
        Objeto.PsiMaxPerfil.BuscaWhereString        := 'Eval.Id_Evaluacion = ' + edIdEvaluacion.Text;
{                         End;
                      End; }
        Objeto.PsiMaxPerfil.Busca;
{                   End;
                finally
                   Qry.Free;
                End; }

      End
    end
    Else Begin
      Objeto.PsiMaxPerfil.BuscaWhereString := 'Eval.Id_Evaluacion = ' + edIdEvaluacion.Text;
      Objeto.PsiMaxPerfil.Busca;
    End;
  End;
end;

procedure TWContrato.BitBtn3Click(Sender: TObject);
var
MtosMaximosPerfil: TPcLimDisc;
begin
if objeto.Active then
    begin
       MtosMaximosPerfil:= TPcLimDisc.Create(self);
       Try
         MtosMaximosPerfil.Apli            :=  objeto.Apli;
         MtosMaximosPerfil.GetParams(objeto);
         MtosMaximosPerfil.plv_PcLimDicLim := lv_PcLimDicLim;
         MtosMaximosPerfil.FindKey([objeto.ID_Contrato.AsString]);
         MtosMaximosPerfil.Catalogo;
       finally
         MtosMaximosPerfil.Free;
       end;
    end
    else Raise EInterFrame.Create('No hay un contrato activo');
end;


procedure TWContrato.cbTipoCuentaChange(Sender: TObject);
begin

 {*if cbTipoCuenta.Text = 'ADMINISTRATIVO' Then
 Begin
     gpPerfilCuestionario.Visible := False;
 End
 Else
 Begin
  if Not chkCteInstitucional.Checked Then
  Begin
     gpPerfilCuestionario.Visible := True;
  End
 End;*}
 solicitaCuestionario(); 

end;

procedure TWContrato.chkCIClick(Sender: TObject);
begin
{*if chkCteInstitucional.Checked Then
 Begin
     gpPerfilCuestionario.Visible := False;
 End
 Else
 Begin
  if cbTipoCuenta.Text <> 'ADMINISTRATIVO' Then
  Begin
     gpPerfilCuestionario.Visible := True;
  End
 End;*}
 solicitaCuestionario();
end;

function TWContrato.solicitaCuestionario: Boolean;
var vResultado : Boolean;
begin
{*
 * Validamos si solicita folio de cuestionario y asignacion de perfil
 * 1.- Solo contratos Bursatiles ICB, OMSC, IFON
 * 2.- Que no sean contratos Administrativos
 * 3.- Que no sean Clientes Institucionales
 * 3.- Que no sean Clientes Sofisticado
 * 4.- Que no sean Contratos Propios
 * 5.- Que no sean contratos liquidadores
 * 6.- Que no sean contratos de contrapartidas
 *}

  If ((Objeto.Cve_Tip_Contrato.AsString = 'CIBC') Or (Objeto.Cve_Tip_Contrato.AsString = 'OMSC') Or
      (Objeto.Cve_Tip_Contrato.AsString = 'IFON')) And
      ((cbTipoCuenta.Text <> 'ADMINISTRATIVO') And (chkCI.Checked = False ) And
        {(chkCteSofisticado.Checked   = False )   And}
       (Objeto.Cve_Segmento.AsString <> 'PR') And (Objeto.Cve_Segmento.AsString <> 'CP') And
       (Objeto.Cve_Segmento.AsString <> 'LQ') And                              //rohs4279 nov/2015 req. PMO150817
       (Objeto.TipoServicio.CVE_TIP_CTE.AsString <> 'EJEOPE')) then Begin      //rohs4279 nov/2015 req. PMO150817
    gpPerfilCuestionario.Visible := True;
    if Objeto.Id_Tipo_Perfil.AsInteger = -1 then Begin
      Objeto.Id_Evaluacion.AsString  := '';
      Objeto.Id_Tipo_Perfil.AsString := '';
    end;
    vResultado := True;
  End
  Else Begin
    gpPerfilCuestionario.Visible := False;
    vResultado                   := False;
  End;

  Result :=  vResultado;
End;

function TWContrato.validacionesPerfil : Boolean;
var vResultado      : Boolean;
    qValidaCuest    : TQuery;
    qValidaDocAdic  : TQuery;
    pResCambiPerf   : Integer;
    qValidaPerfil   : TQuery;
    pResValPerf     : Integer;
begin
     vResultado := True;

     { *
       * Verificamos que la situacion del folio de cuestionario este Autorizado
       * Si esta autorizado verificamos que tenga los documentos adicionales necesarios
       * Si no tiene los doc cargados le avisamos que sera cambiado a I-BASICO
       * Si no esta autorizado y el Perfil es mayor a I-BASICO avisamos del cambio a I-BASICO
       *}

     qValidaCuest := TQuery.Create(nil);
     qValidaCuest.DatabaseName := Objeto.DataBaseName;
     qValidaCuest.SessionName  := Objeto.SessionName;
     qValidaCuest.SQL.Clear;
     qValidaCuest.SQL.Add('SELECT EV.SIT_EVALUACION, SB.ID_TIPO_PERFIL  ' );
     qValidaCuest.SQL.Add( ' FROM PSI_EVALUACION EV '  );
     qValidaCuest.SQL.Add(    ' , SB_CONTRATO SB '     );
     qValidaCuest.SQL.Add(' WHERE EV.ID_EVALUACION = ' ); qValidaCuest.SQL.Add(Objeto.Id_Evaluacion.AsString);
     qValidaCuest.SQL.Add(  ' AND SB.ID_CONTRATO = '   ); qValidaCuest.SQL.Add(Objeto.Id_Contrato.AsString);
     qValidaCuest.SQL.Add(  ' AND EV.ID_EVALUACION = SB.ID_CUESTIONARIO' );
     qValidaCuest.Open;
      
     If qValidaCuest.RecordCount > 0 Then
     Begin
        if ( Trim(qValidaCuest.FieldByName('SIT_EVALUACION').AsString) <> 'AU') And
           ( Trim(qValidaCuest.FieldByName('ID_TIPO_PERFIL').AsString) <> '101' ) then
        begin
            if ( MessageDlg('El Cuestionario con el folio: ' + Objeto.Id_Evaluacion.AsString + '  asociado a este contrato aun no esta autorizado,' + chr(13)
               + 'por lo cual se modificara el perfil asignado por I-BASICO. '  + chr(13)
               + 'Esta accion recalculara todos los montos maximos permitidos para todos los rubros'  + chr(13)
               + 'configurados para este contrato.' +  chr(13)
               + '¿ Esta seguro de continuar con la activacion ?', mtConfirmation, [mbYes, mbNO], 0) = mrNo) Then
            Begin
               vResultado := False;
            End
        End;
     end;

     if  (vResultado = True) And (Objeto.Id_Evaluacion.AsInteger > 0) Then
     Begin
        qValidaDocAdic := TQuery.Create(nil);
        qValidaDocAdic.DatabaseName := Objeto.DataBaseName;
        qValidaDocAdic.SessionName  := Objeto.SessionName;
        qValidaDocAdic.SQL.Clear;
        qValidaDocAdic.SQL.Add('Select Count(1) as NODOCADIC  '                    );
        qValidaDocAdic.SQL.Add( ' From Psi_Doc_Adic_Empresa doc '                  );
        qValidaDocAdic.SQL.Add(    ' , Psi_Evaluacion       ev '                   );
        qValidaDocAdic.SQL.Add( ' Where 1 = 1 '                                    );
        qValidaDocAdic.SQL.Add( ' And doc.Id_Empresa      =  ev.id_empresa '       );
        qValidaDocAdic.SQL.Add( ' And doc.Id_Cuestionario =  ev.id_cuestionario '  );
        qValidaDocAdic.SQL.Add( ' And doc.Sit_Documento   = ''AC'' ');
        qValidaDocAdic.SQL.Add( ' And ev.id_evaluacion    = '); qValidaDocAdic.SQL.Add(Objeto.Id_Evaluacion.AsString);
        qValidaDocAdic.SQL.Add( ' And Cve_Documento Not In ( Select Cve_Documento ');
        qValidaDocAdic.SQL.Add( ' From Doc_Adic_Persona '                          );
        qValidaDocAdic.SQL.Add( ' Where 1 = 1 '                                    );
        qValidaDocAdic.SQL.Add( ' And Id_Contrato = '); qValidaDocAdic.SQL.Add(Objeto.Id_Contrato.AsString);
        qValidaDocAdic.SQL.Add( ')'                                                );

        qValidaDocAdic.Open;

        If qValidaDocAdic.RecordCount > 0 Then
        Begin
            if  (qValidaDocAdic.FieldByName('NODOCADIC').AsInteger > 0) And (edIdTipoPerfil.Text <> '101')   then
            begin
               if ( MessageDlg('Este contrato no cuenta con Documentos Adicionales por lo cual se modificara el perfil asignado por I-BASICO' +  chr(13)
                  + 'Esta accion recalculara todos los montos maximos permitidos para todos los rubros configurados para este contrato'  +  chr(13)
                  + '¿ Esta seguro de continuar con la activación ?', mtConfirmation, [mbYes, mbNO], 0) = mrNo) Then
               Begin
                  vResultado := False;
               End
           End;
        End
        Else
        Begin
        {Validacion de perfil Asignado sea menor o igual al calculado en la evaluacion}
           qValidaPerfil := TQuery.Create(nil);
           qValidaPerfil.DatabaseName := Objeto.DataBaseName;
           qValidaPerfil.SessionName  := Objeto.SessionName;
           qValidaPerfil.SQL.Clear;
           qValidaPerfil.SQL.Add(' SELECT COUNT(1) PERFILCORRECTO ');
           qValidaPerfil.SQL.Add(' FROM PSI_TIPO_PERFIL ');
           qValidaPerfil.SQL.Add(' WHERE ID_TIPO_PERFIL = '); qValidaPerfil.SQL.Add( edIdTipoPerfil.Text );
           qValidaPerfil.SQL.Add(' AND RV <=( ');
           qValidaPerfil.SQL.Add(' SELECT PF.RV ');
           qValidaPerfil.SQL.Add( '  FROM PSI_TIPO_PERFIL PF');
           qValidaPerfil.SQL.Add(    '  , PSI_EVALUACION  EV');
           qValidaPerfil.SQL.Add('  WHERE EV.ID_EVALUACION = ' ); qValidaPerfil.SQL.Add( Objeto.Id_Evaluacion.AsString );
           qValidaPerfil.SQL.Add( ' AND PF.ID_TIPO_PERFIL = EV.ID_TIPO_PERFIL_ASIGNADO )  ');

           If qValidaPerfil.RecordCount > 0 Then
           Begin
              if  (qValidaPerfil.FieldByName('PERFILCORRECTO').AsInteger <= 0)  then
              begin
                 if ( MessageDlg('A contrato se le esta tratando de asignar un perfil mayor al resultante en el folio de cuestionario' +  chr(13)
                     + 'Si continua con la activacion se cambiara al perfil resultante en el folio de cuestionario'  +  chr(13)
                     + 'Recalculando todos los montos maximos permitidos para todos los rubros configurados para este contrato'  +  chr(13)
                     + '¿ Esta seguro de continuar con la activación ?', mtConfirmation, [mbYes, mbNO], 0) = mrNo) Then
                 Begin
                    vResultado := False;
                 End
              End;
           End;
        End;
   End;

   Result :=  vResultado;
End;

procedure TWContrato.bbMotivosClick(Sender: TObject); // CZR 17-feb-2015
var
   Motivos : TCtoBitIn;
   Qry     : TQuery;
begin
   if Objeto.ValidaAccesoEsp('CLASE_TCTOBITIN', True, True) then
   begin  
      if Objeto.Active then
      begin
         try
            Qry := GetSQLQuery('select * from cto_bit_inactiva where id_contrato = ' + Objeto.ID_Contrato.AsSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            if Qry = nil then
               raise EInterFrame.Create('El contrato no cuenta con motivos')
            else
            begin
               Motivos := TCtoBitIn.Create(self);
               Motivos.GetParams(Objeto);
               Motivos.Contrato.FindKey([Objeto.ID_Contrato.AsInteger]);
               Motivos.Catalogo;
            end;
         finally
            if Qry <> nil then
               FreeAndNil(Qry);
         end;
      end
      else
         raise EInterFrame.Create('No hay un contrato activo');
   end;
end;

procedure TWContrato.bbAcuseReciboClick(Sender: TObject); // CZR 17-feb-2015
begin
  AcuseRecibo(False);
end;

function TWContrato.Verifica_Configuracion_Documentos(vTipoPerfil  : Integer;  //rohs4279 nov/2015 req. PMO150817
                                                      vCveElemento : String;
                                                      vIdCto       : Integer) : String;
var  spDocto             : TStoredProc;
     vls_perfil,
     vls_subserv         : String;

Begin
  Try
    spDocto := TStoredProc.Create(Nil);
    Try
      spDocto.DataBaseName   := Objeto.Apli.DataBaseName;
      spDocto.SessionName    := Objeto.Apli.SessionName;
      spDocto.StoredProcName := 'PKGCORPORATIVO.ISCONFIGDOCTOVALIDA';

      spDocto.Params.CreateParam(ftInteger, 'pIdTipoConfig', ptInPut);
      spDocto.Params.CreateParam(ftString,  'pCveElemento',  ptInPut);
      spDocto.Params.CreateParam(ftInteger, 'pIdContrato',   ptInPut);
      spDocto.Params.CreateParam(ftString,  'Result',        ptResult);

      spDocto.ParamByName('pIdTipoConfig').AsInteger := vTipoPerfil;
      spDocto.ParamByName('pCveElemento').AsString   := vCveElemento;
      spDocto.ParamByName('pIdContrato').AsInteger   := vIdCto;

      spDocto.Prepare;
      spDocto.ExecProc;

      Result := spDocto.ParamByName('Result').AsString;
    Finally
      spDocto.Free;
    end;
  Except
    Result := 'V';
  end;
end;

procedure TWContrato.Valida_Atributos;                                         //rohs4279 nov/2015 req. PMO150817
var sql    : String;
    qDatos : TQuery;
    MyComp : Tcomponent;

Begin
  chkCI.Enabled     := True;
  chkELE.Enabled    := True;
  chkCLISOF.Enabled := True;
  chkCLIECA.Enabled := True;
  qDatos            := TQuery.Create(nil);
  Try
    sql := 'SELECT cve_elemento ' +
            ' FROM sb_servicio_docto ' +
           ' WHERE id_tipo_config = 1 ' +
             ' AND sit_documento = ' + Quotedstr('AC') +
           ' GROUP BY cve_elemento ';
    qDatos.DatabaseName := Objeto.Apli.DataBaseName;
    qDatos.SessionName  := Objeto.Apli.SessionName;
    qDatos.Close;
    qDatos.SQL.Clear;
    qDatos.SQL.Add(sql);
    qDatos.Open;
    if Not qDatos.Fields[0].IsNull then Begin
      qDatos.First;
      While Not qDatos.Eof do Begin
        MyComp := FindComponent('chk' + UpperCase(qDatos.FieldByName('cve_elemento').AsString));
        if MyComp <> nil Then
          TCheckbox(MyComp).Enabled := False;
        qDatos.Next;
      end;
    end;
  Finally
    qDatos.Close;
    qDatos.Free;
  end;
end;

procedure TWContrato.Inhabilita_Atributos;                                     //rohs4279 nov/2015 req. PMO150817
Begin
  chkCI.Enabled     := False;
  chkELE.Enabled    := False;
  chkCLISOF.Enabled := False;
  chkCLIECA.Enabled := False;
end;

end.
