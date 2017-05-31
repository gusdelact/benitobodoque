// Sistema         : Clase de Persona
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Persona
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Modificado por  : Carlos Adrian Mejía Ledón
// Fecha de Modif. : Noviembre del 2003
// Modificacion    : Luis Alberto Hernandez Mackan Dic 09
// Modificación    : Sergio Rojas Hernández rohs4279 febrero/2016
//                   Se agregan campos Estatus Fatca/CRS y Tipo Persona req. PMO151201
//                   Se agrega pestaña Nacionalida/Residencia req. PMO151201 mar/2016

unit IntPers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, InterFun, ComCtrls, IntPob, IntDom, UnSQL2,
  Menus, RepPFis, RepPFis2, RepPMor, RepPMor2, IntLDiActEco, IntCrmTCte,
  InterEdit,  IntProfeOfic,   UnGene, Grids, DBGrids,
  UnConKYC, intActiv, IntLinkit, IntMotIna, IntValDatIds,
  IntPerRanIng,   { Catalogo de Rango de Ingresos }
  IntPerEmpLab,   { Empresa en que labora }
  IntValRFC,      { RFC }
  IntPerPepAso,   { Persona PEPS Asociado -> PER_PEPS_ASOCIADO }
  IntPerFrecue,   { Persona Frecuencia    -> PER_FRECUENCIA }
  IntPerIngPri,   { Persona Ingreso Principal ->PER_INGRESO_PRINCIPAL }
  UnFunProcICB,   { Constantes, Funciones y Procedimientos generales (ICB) }
  IntRpAvisoPriv, { Reporte de Aviso de Privacidad }
  IntPersNac      { Configuración de Nacionalidades rohs4279 feb/2016 req. PMO151201}
  ;

Const
   WM_DESPUESSHOW     = WM_USER+1;
   fbTPersonaFisica   = 1;
   fbTPersonaMoral    = 2;

   // CZR 25-FEB-09
   fbTProspectoFisica = 5;
   fbTProspectoMoral  = 6;
Type
  PerPepAsocType  = record
    Id_Registro : Integer;
    Nombre,
    Paterno,
    Materno,
    Funcion,
    CvePobl,
    CveParent,
    Relacion    : String;
end;

type
  TPersona = Class;
  TWPersona = class(TForm)
    InterForma1             : TInterForma;
    BitBtn1                 : TBitBtn;
    Catlogo1                : TMenuItem;
    Catlogo2                : TMenuItem;
    Catlogo3                : TMenuItem;
    cbCveActividadPF        : TComboBox;
    cbCveActividadPF2       : TComboBox;
    cbCveEstadoCivil        : TComboBox;
    cbCveEstadoCivil2       : TComboBox;
    cbCveRamaActiv          : TComboBox;
    cbCveRamaActiv2         : TComboBox;
    cbCveRamaPF             : TComboBox;
    cbCveRamaPF2            : TComboBox;
    cbCveSexo               : TComboBox;
    cbCveSexo2              : TComboBox;
    cbCveSubRamaAC          : TComboBox;
    cbCveSubRamaAC2         : TComboBox;
    cbCveTipoSector         : TComboBox;
    cbCveTipoSector2        : TComboBox;
    cbCveTipoSectorPM       : TComboBox;
    cbCveTipoSectorPM2      : TComboBox;
    DateTimePicker1         : TDateTimePicker;
    DateTimePicker2         : TDateTimePicker;
    DateTimePicker4         : TDateTimePicker;
    DatosPersona            : TMenuItem;
    edApellidoMaterno       : TEdit;
    edApellidoPaterno       : TEdit;
    edCalleNumero           : TEdit;
    edCveNacionalidad       : TEdit;
    edCvePerJuridica        : TEdit;
    edCveResidencia         : TEdit;
    edFAlta                 : TMaskEdit;
    edFBaja                 : TMaskEdit;
    edFConstitucion         : TMaskEdit;
    edFRFC                  : TEdit;
    edHomoclaveRFC          : TEdit;
    edIdDomicilio           : TEdit;
    edIDPersona             : TEdit;
    edModifica              : TEdit;
    edNacionalidad          : TEdit;
    edNbrSiti               : TEdit;
    edNombre                : TEdit;
    EdNombrePersona         : TEdit;
    edNomRazonSocial        : TEdit;
    edResidencia            : TEdit;
    edSiglasRFC             : TEdit;
    edSitPersona            : TEdit;
    edTelefCasa             : TEdit;
    edTelefFax              : TEdit;
    edTelefOficina          : TEdit;
    gbDomicilio             : TGroupBox;
    gbFechas                : TGroupBox;
    gbNombre                : TGroupBox;
    gbNombre2               : TGroupBox;
    gbOtros                 : TGroupBox;
    gbOtros2                : TGroupBox;
    gbRfc                   : TGroupBox;
    gbSector                : TGroupBox;
    gbTelefAnt              : TGroupBox;
    gbUbicacion             : TGroupBox;
    Generalpersonasfisicas  : TMenuItem;
    GeneralPersonasMorales  : TMenuItem;
    GroupBox2               : TGroupBox;
    GroupBoxPersona         : TGroupBox;
    Label1                  : TLabel;
    Label11                 : TLabel;
    Label2                  : TLabel;
    Label4                  : TLabel;
    Label5                  : TLabel;
    Label6                  : TLabel;
    Label7                  : TLabel;
    Label8                  : TLabel;
    lbActividad             : TLabel;
    lbApellidoMaterno       : TLabel;
    lbApellidoPaterno       : TLabel;
    lbEstadoCivil           : TLabel;
    lbFecha                 : TLabel;
    lbHomoClave             : TLabel;
    lbNacionalidad          : TLabel;
    lbNombre                : TLabel;
    lbRama                  : TLabel;
    lbResidencia            : TLabel;
    lbSexo                  : TLabel;
    lbSiglas                : TLabel;
    lbTelefCasa             : TLabel;
    lbTelefFax              : TLabel;
    lbTelefOficina          : TLabel;
    N1                      : TMenuItem;
    PgCtrl                  : TPageControl;
    PopupDomicilio          : TPopupMenu;
    PopupNacionalidad       : TPopupMenu;
    PopUpReportes           : TPopupMenu;
    PopupResidencia         : TPopupMenu;
    rgPerJuridica           : TRadioGroup;
    rgSitPersona            : TRadioGroup;
    sbSiti                  : TSpeedButton;
    SpeedButton1            : TSpeedButton;
    SpeedButton2            : TSpeedButton;
    SpeedButton3            : TSpeedButton;
    TabSheet1               : TTabSheet;
    TabSheet2               : TTabSheet;
    BitBtn2                 : TBitBtn;
    PopupFuenteIngr         : TPopupMenu;
    CatalogoFuenteIngr      : TMenuItem;
    Label13                 : TLabel;
    edCurp                  : TEdit;
    chbB_Activ_Empresa      : TCheckBox;
    edIdProfesion           : TEdit;
    spProfesion             : TSpeedButton;
    edDescProfesion         : TEdit;
    Label15                 : TLabel;
    PopupRangoIngresos      : TPopupMenu;
    CatalogoRangoIngresos   : TMenuItem;
    PopupProfesion          : TPopupMenu;
    CatalogoProfesion       : TMenuItem;
    qEmpresaLabora          : TQuery;
    LimpiarRangoIngresos    : TMenuItem;
    LimpiarProfesion        : TMenuItem;
    LimpiarFuenteIngr       : TMenuItem;
    PopupEmpLabora          : TPopupMenu;
    LimpiarEmpLabora        : TMenuItem;
    meFecCurp               : TMaskEdit;
    iedDigCurp              : TInterEdit;
    DateTimePicker5         : TDateTimePicker;
    CatalogoEmpresa         : TMenuItem;
    bbRefBancarias          : TBitBtn;
    bbRefPersonales         : TBitBtn;
    bbInfEmpresa            : TBitBtn;
    edCurpSex               : TEdit;
    edSigCurp               : TEdit;
    edLugNacCurp            : TEdit;
    edCurpLetra             : TEdit;
    bbAsociaciones          : TBitBtn;
    gbEmpLabora             : TGroupBox;
    lbEmpLabora             : TLabel;
    edIdEmpLabora           : TEdit;
    sbEmpresaLabora         : TSpeedButton;
    edDescEmpLabora         : TEdit;
    iedAnoAntigEmpr         : TInterEdit;
    iedMesAntigEmpr         : TInterEdit;
    lbMeses                 : TLabel;
    lbAnos                  : TLabel;
    lbAntiguedad            : TLabel;
    edPuestoEmpresa         : TEdit;
    lbPuesto                : TLabel;
    gbEmpresaPropia         : TGroupBox;
    Label21                 : TLabel;
    edNombreEmpPF           : TEdit;
    edDOMICILIO             : TEdit;
    Label14                 : TLabel;
    TabSheet3               : TTabSheet;
    Label34                 : TLabel;
    sbTipoCliente           : TSpeedButton;
    Label39                 : TLabel;
    Label40                 : TLabel;
    sbResidencia            : TSpeedButton;
    Label43                 : TLabel;
    Label44                 : TLabel;
    sbTipoSector            : TSpeedButton;
    sbSector                : TSpeedButton;
    sbSubSector             : TSpeedButton;
    sbRama                  : TSpeedButton;
    sbSubRama               : TSpeedButton;
    Label41                 : TLabel;
    Label42                 : TLabel;
    Label45                 : TLabel;
    Label47                 : TLabel;
    sbInciso                : TSpeedButton;
    edCve_Activ_Cto         : TEdit;
    edCveTipoCliente        : TEdit;
    edCveResidenciaAct      : TEdit;
    edCveTipoSector         : TEdit;
    edCveSector             : TEdit;
    edCveSubSector          : TEdit;
    edCveRama               : TEdit;
    edCveSubRama            : TEdit;
    edTipoCliente           : TEdit;
    edResidenciaAct         : TEdit;
    edTipoSector            : TEdit;
    edSector                : TEdit;
    edSubSector             : TEdit;
    edRama                  : TEdit;
    edSubRama               : TEdit;
    edCveInciso             : TEdit;
    edInciso                : TEdit;
    Label48                 : TLabel;
    edCveSITI               : TEdit;
    edDescSITI              : TEdit;
    chkBPEPS                : TCheckBox;
    PopUpActividad          : TPopupMenu;
    CatalogoActividad       : TMenuItem;
    LimpiarActividad        : TMenuItem;
    linkActividad           : TInterLinkit;
    GroupBox4               : TGroupBox;
    edFEA                   : TEdit;
    PopupDomFiscal          : TPopupMenu;
    CatalogoDomFiscal       : TMenuItem;
    edIdDom_Fis             : TEdit;
    SpeedButton4            : TSpeedButton;
    edCaNum_Fiscal          : TEdit;
    Label18                 : TLabel;
    tabMotivo               : TTabSheet;
    gInactiva               : TGroupBox;
    sbMotivo                : TSpeedButton;
    Label27                 : TLabel;
    Label28                 : TLabel;
    edCveMotivo             : TEdit;
    edTxMotivo              : TEdit;
    edDescMotivo            : TEdit;
    ilMotivo                : TInterLinkit;
    btnAgregapepsasoc       : TBitBtn;
    edTelefCel              : TEdit;
    Label12                 : TLabel;
    PopUpFrecuencia         : TPopupMenu;
    MenuItem1               : TMenuItem;
    MenuItem2               : TMenuItem;
    Label16                 : TLabel;
    edIdRangoIngreso        : TEdit;
    spRangoIngresos         : TSpeedButton;
    iedMontoMaximo          : TInterEdit;
    Label17                 : TLabel;
    gbIngresos              : TGroupBox;
    lvFteIngreso            : TListView;
    sbNueIngr               : TSpeedButton;
    sbModIngr               : TSpeedButton;
    sbEliIngr               : TSpeedButton;
    GroupBox3               : TGroupBox;
    edCvePaisNacim          : TEdit;
    SpeedPaisNac            : TSpeedButton;
    edLugarNacim            : TEdit;
    SpeedEdoNac             : TSpeedButton;
    edEdoNacimiento         : TEdit;
    edPaisNacimiento        : TEdit;
    Label19                 : TLabel;
    Label20                 : TLabel;
    lbFechaNacimiento       : TLabel;
    meFNacimiento           : TMaskEdit;
    DateTimePicker3         : TDateTimePicker;
    SpeedButton5            : TSpeedButton;
    edDomicilioAnt          : TEdit;
    edDesc_DomPF            : TEdit;
    PopupDomiPF             : TPopupMenu;
    MenuItem3               : TMenuItem;
    tabAvisoPriv            : TTabSheet;
    gbAvisoPriv             : TGroupBox;
    rgAvisoPriv             : TRadioGroup;
    bbAvisoPriv             : TBitBtn;
    gbEmpleado              : TGroupBox;
    lEmpleado               : TLabel;
    lITIN                   : TLabel;
    gbTelefonos             : TGroupBox;
    sbNueTel                : TSpeedButton;
    sbModTel                : TSpeedButton;
    sbEliTel                : TSpeedButton;
    lvTelefonos             : TListView;
    gbEmail                 : TGroupBox;
    edE_Mail                : TEdit;
    bPais                   : TBevel;
    lPais                   : TLabel;
    gbNumTotAcciones        : TGroupBox;
    ieNumTotAcciones        : TInterEdit;
    Label9                  : TLabel;
    edFHModificacion        : TEdit;
    gbUsuarios              : TGroupBox;
    Label3                  : TLabel;
    edCVEUsuarModif         : TEdit;
    btnAccionista           : TBitBtn;
    GroupBox1               : TGroupBox;
    cbExpediente            : TCheckBox;
    edNivelRiesgo           : TEdit;
    lNivelRiesgo            : TLabel;
    eNoIdFiscalExt          : TEdit;
    lNoIdFiscalExt          : TLabel;
    gbGIIN                  : TGroupBox;
    eGIIN                   : TEdit;
    gbCONDUSEF              : TGroupBox;
    eCONDUSEF               : TEdit;
    lCvePaisExp             : TLabel;
    eCvePaisExp             : TEdit;
    sbCvePaisExp            : TSpeedButton;
    eDescPaisExp            : TEdit;
    eITIN                   : TEdit;
    ptipopers               : TPanel;
    lbtipopers              : TLabel;
    cbtipopers              : TComboBox;
    pfatcacrs               : TPanel;
    lbfatcacrs              : TLabel;
    cbfatcacrs              : TComboBox;
    tabNacRes               : TTabSheet;
    gbNac                   : TGroupBox;
    sbNacNue                : TSpeedButton;
    sbNacMod                : TSpeedButton;
    sbNacElim               : TSpeedButton;
    dbgNac                  : TDBGrid;
    dsNac                   : TDataSource;
    qNac                    : TQuery;
    gbRes                   : TGroupBox;
    sbResNue                : TSpeedButton;
    sbResMod                : TSpeedButton;
    sbResElim               : TSpeedButton;
    dbgRes                  : TDBGrid;
    dsRes                   : TDataSource;
    qRes                    : TQuery;
    qNacCVE_NACIONALIDAD    : TStringField;
    qNacDESC_POBLACION      : TStringField;
    qNacCTA_IDFISCAL        : TStringField;
    qNacID_FISCAL           : TStringField;
    qNacTIPO                : TStringField;
    qNacCVE_PAIS_EXPEDICION : TStringField;
    qNacCVE_MOTIVO          : TStringField;
    qNacDESC_MOTIVO         : TStringField;
    qNacSIT_NACIONALIDAD    : TStringField;
    qNacB_DEFAULT           : TStringField;
    qResCVE_RESIDENCIA      : TStringField;
    qResDESC_POBLACION      : TStringField;
    qResCTA_IDFISCAL        : TStringField;
    qResID_FISCAL           : TStringField;
    qResTIPO                : TStringField;
    qResCVE_PAIS_EXPEDICION : TStringField;
    qResCVE_MOTIVO          : TStringField;
    qResDESC_MOTIVO         : TStringField;
    qResSIT_RESIDENCIA      : TStringField;
    qResB_DEFAULT           : TStringField;
    qNacDESC_PAIS_EXP       : TStringField;
    qResDESC_PAIS_EXP       : TStringField;
    qNacTX_MOTIVO           : TStringField;
    qResTX_MOTIVO           : TStringField;

    procedure BitBtn1Click(Sender: TObject);
    procedure Catlogo1Click(Sender: TObject);
    procedure Catlogo2Click(Sender: TObject);
    procedure Catlogo3Click(Sender: TObject);
    procedure cbCveActividadPF2Change(Sender: TObject);
    procedure cbCveActividadPFChange(Sender: TObject);
    procedure cbCveEstadoCivil2Change(Sender: TObject);
    procedure cbCveEstadoCivilChange(Sender: TObject);
    procedure cbCveRamaActiv2Change(Sender: TObject);
    procedure cbCveRamaActivChange(Sender: TObject);
    procedure cbCveRamaPF2Change(Sender: TObject);
    procedure cbCveRamaPFChange(Sender: TObject);
    procedure cbCveSexo2Chnage(Sender: TObject);
    procedure cbCveSexoChange(Sender: TObject);
    procedure cbCveSubRamaAC2Change(Sender: TObject);
    procedure cbCveSubRamaACChange(Sender: TObject);
    procedure cbCveTipoSector2Change(Sender: TObject);
    procedure cbCveTipoSectorChange(Sender: TObject);
    procedure cbCveTipoSectorPM2Change(Sender: TObject);
    procedure cbCveTipoSectorPMChange(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure DateTimePicker1Enter(Sender: TObject);
    procedure DateTimePicker2CloseUp(Sender: TObject);
    procedure DateTimePicker2Enter(Sender: TObject);
    procedure DateTimePicker3CloseUp(Sender: TObject);
    procedure DateTimePicker3Enter(Sender: TObject);
    procedure DateTimePicker4CloseUp(Sender: TObject);
    procedure DateTimePicker4Enter(Sender: TObject);
    procedure DatosPersonaClick(Sender: TObject);
    procedure edCvePerJuridicaChange(Sender: TObject);
    procedure edSitPersonaChange(Sender: TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure FormHide(Sender : TObject);
    procedure FormShow(Sender : TObject);
    procedure GeneralpersonasfisicasClick(Sender: TObject);
    procedure GeneralPersonasMoralesClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender : TObject);
    procedure PersonaMoralClick(Sender: TObject);
    procedure PopUpReportesPopup(Sender: TObject);
    procedure rgPerJuridicaClick(Sender: TObject);
    procedure rgSitPersonaClick(Sender: TObject);
    procedure sbSitiClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure sbFuenteIngrClick(Sender: TObject);
    procedure CatalogoFuenteIngrClick(Sender: TObject);
    procedure spRangoIngresosClick(Sender: TObject);
    procedure spProfesionClick(Sender: TObject);
    procedure sbEmpresaLaboraClick(Sender: TObject);
    procedure CatalogoRangoIngresosClick(Sender: TObject);
    procedure CatalogoProfesionClick(Sender: TObject);
    procedure iedMesAntigEmprExit(Sender: TObject);
    function ValidaMeses : Boolean;
    function ValidaCurp  : Boolean;
    function ValidaLetras(pCadena : String) : Boolean;
    function ValidaSigCurp : Boolean;
    function ValidaCurpSex : Boolean;
    function ValidaLugNacCurp : Boolean;
    function ValidaCurpLetra : Boolean;
    function ValidaDigCurp : Boolean;
    function ValidaBActivEmp : Boolean;
    procedure LimpiaCurp;
    procedure LlenaCurp;
    procedure HabilitaPopUpMenu;
    procedure ConcatenaCurp;
    procedure CapturaPromotor(pEstado : Boolean); // CZR 05-mar-2013
    procedure InterForma1BtnAceptar(Sender: TObject);
    procedure edIdEmpLaboraChange(Sender: TObject);
    procedure LimpiarRangoIngresosClick(Sender: TObject);
    procedure LimpiarProfesionClick(Sender: TObject);
    procedure LimpiarFuenteIngrClick(Sender: TObject);
    procedure LimpiarEmpLaboraClick(Sender: TObject);
    procedure edIdEmpLaboraContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure edIdDomicilioContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure edCalleNumeroContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure edCveResidenciaContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure edResidenciaContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure edCveNacionalidadContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure edNacionalidadContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure edIdRangoIngresoContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure edIdProfesionContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure edIdFuenteIngrContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure CatalogoEmpresaClick(Sender: TObject);
    procedure bbRefBancariasClick(Sender: TObject);
    procedure bbRefPersonalesClick(Sender: TObject);
    procedure bbInfEmpresaClick(Sender: TObject);
    procedure bbAsociacionesClick(Sender: TObject);
    procedure chbB_Activ_EmpresaClick(Sender: TObject);
    procedure edCurpChange(Sender: TObject);
    procedure InterForma1BtnCancelar(Sender: TObject);
    procedure GroupBoxEmpresa;
    procedure sbIncisoClick(Sender: TObject);
    procedure sbSubRamaClick(Sender: TObject);
    procedure sbRamaClick(Sender: TObject);
    procedure sbSubSectorClick(Sender: TObject);
    procedure sbSectorClick(Sender: TObject);
    procedure sbTipoSectorClick(Sender: TObject);
    procedure sbResidenciaClick(Sender: TObject);
    procedure sbTipoClienteClick(Sender: TObject);
    procedure CatalogoFrecuenciadClick(Sender: TObject);
    procedure LimpiarActividadClick(Sender: TObject);
    procedure linkActividadCapture(Sender: TObject; var Show: Boolean);
    procedure linkActividadEjecuta(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure CatalogoDomFiscalClick(Sender: TObject);
    procedure sbMotivoClick(Sender: TObject);
    procedure ilMotivoEjecuta(Sender: TObject);
    procedure chkBPEPSClick(Sender: TObject);
    procedure btnAgregapepsasocClick(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure sbNueIngrClick(Sender: TObject);
    procedure sbModIngrClick(Sender: TObject);
    procedure sbEliIngrClick(Sender: TObject);
    procedure SpeedEdoNacClick(Sender: TObject);
    procedure SpeedPaisNacClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure bbAvisoPrivClick(Sender: TObject);
    //procedure meITINChange(Sender: TObject);         medoto onChange meITINChange
    //procedure meITINKeyPress(Sender: TObject; var Key: Char);       metodo onKeyPress meITINKeyPress
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure sbNueTelClick(Sender: TObject);
    procedure sbModTelClick(Sender: TObject);
    procedure sbEliTelClick(Sender: TObject);
    procedure btnAccionistaClick(Sender: TObject);
    procedure eGIINKeyPress(Sender: TObject; var Key: Char);
    procedure eCONDUSEFKeyPress(Sender: TObject; var Key: Char);
    procedure eNoIdFiscalExtKeyPress(Sender: TObject; var Key: Char);
    procedure sbCvePaisExpClick(Sender: TObject);
    procedure eITINKeyPress(Sender: TObject; var Key: Char);
    procedure InterForma1Buscar(Sender: TObject);                              //rohs4279 feb/2016 req. PMO151201
    procedure sbNacNueClick(Sender: TObject);                                  //rohs4279 mar/2016 req. PMO151201
    procedure sbNacModClick(Sender: TObject);                                  //rohs4279 mar/2016 req. PMO151201
    procedure sbResNueClick(Sender: TObject);                                  //rohs4279 mar/2016 req. PMO151201
    procedure sbResModClick(Sender: TObject);                                  //rohs4279 mar/2016 req. PMO151201
    procedure dbgNacDrawColumnCell(Sender: TObject; const Rect: TRect;         //rohs4279 mar/2016 req. PMO151201
      DataCol: Integer; Column: TColumn; State: TGridDrawState);               //rohs4279 mar/2016 req. PMO151201
    procedure dbgResDrawColumnCell(Sender: TObject; const Rect: TRect;         //rohs4279 mar/2016 req. PMO151201
      DataCol: Integer; Column: TColumn; State: TGridDrawState);               //rohs4279 mar/2016 req. PMO151201
    procedure cbtipopersKeyPress(Sender: TObject; var Key: Char);              //rohs4279 mar/2016 req. PMO151201
    procedure cbfatcacrsKeyPress(Sender: TObject; var Key: Char);              //rohs4279 mar/2016 req. PMO151201
  private
    Procedure LocalizaActividad;
  public
    Persona        : TPersona;
    datPerPepsAsoc : array[1..20] of PerPepAsocType;
    noPerPepsAsoc  : Integer;
    vPEPsDesAct    : Boolean;

    procedure LlenaActPM(Numero:Integer);
    procedure LlenaActPF(Numero:Integer);
    procedure LlenaSubActPM(Rama,SubRama:Integer);
    procedure DespuesShow(var Message:TMessage); message WM_DESPUESSHOW;

    procedure Llena_combos_fatcacrs_tipopersona(pPerJur : String);             //rohs4279 feb/2016 req. PMO151201
    procedure RefrescaGridNac;                                                 //rohs4279 mar/2016 req. PMO151201
  end;

  TPersona = class(TInterFrame)
  private
    // CZR 17-mar-2010
    SitPersonaAnt    : String;
  protected
    vlvFteIngreso    : TListView;
    // CZR 07-ago-2013
    vpgPestanias     : TPageControl;
    vtabAvisoPriv    : TTabSheet;
    vlEmpleado       : TLabel;
    // CZR 07-oct-2013
    vlITIN           : TLabel;
    //vmeITIN          : TMaskEdit;
    vmeITIN          : TEdit;
    // CZR 14-oct-2013
    vlvTelefonos     : TListView;
    vieNumTotAcc     : TInterEdit;
    // CZR 26-ago-2014
    vlNivelRiesgo    : TLabel;
    vEdNivelRiesgo   : TEdit;
    // CZR 19-nov-2014
    vgbCONDUSEF      : TGroupBox;
    vlNoIdFiscalExt  : TLabel;
    veNoIdFiscalExt  : TEdit;
    vlCvePaisExp     : TLabel;
    veCvePaisExp     : TEdit;
    vsbCvePaisExp    : TSpeedButton;
    veDescPaisExp    : TEdit;
    vGIINVisible     : Boolean;
    vCONDUSEFVisible : Boolean;
  public
    Id_Persona           : TInterCampo;
    Id_Domicilio         : TInterCampo;
    Id_Dom_Fiscal        : TInterCampo; // CZR 03-Junio-2009
    Cve_Residencia       : TInterCampo;
    Cve_Nacionalidad     : TInterCampo;
    Residencia           : TInterCampo;
    Nacionalidad         : TInterCampo;
    Cve_Per_Juridica     : TInterCampo;
    F_Alta               : TInterCampo;
    F_Baja               : TInterCampo;
    Sit_Persona          : TInterCampo;
    Telef_Casa           : TInterCampo;
    Telef_Fax            : TInterCampo;
    Telef_Oficina        : TInterCampo;
    Telef_Cel            : TInterCampo; //SACA4984
    Cve_Tipo_Sector      : TInterCampo;
    Nombre               : TInterCampo;
    Fh_Modificacion      : TInterCampo;
    Cve_Usuar_Modif      : TInterCampo;
    Codigo_Respuesta     : TInterCampo;
    B_Captura_Aseg       : TInterCampo;
    Cve_activ_eco_siti   : TInterCampo;
    E_Mail               : TInterCampo;
    Id_Fuente_Ingr       : TInterCampo;
    Cve_Activ_Cto        : TInterCampo;
    FEA                  : TInterCampo;
    //PERSONA MORAL
    Cve_Rama_Activ       : TInterCampo;
    Cve_Sub_Rama_Ac      : TInterCampo;
    Cve_Tipo_SectorPM    : TInterCampo;
    F_Contstitucion      : TInterCampo;
    Nom_Razon_Social     : TInterCampo;
    Num_Tot_Acciones     : TInterCampo; // CZR 16-oct-2013   Numero Total de Acciones
    //PERSONA FISICA
    Apellido_Paterno     : TInterCampo;
    Apellido_Materno     : TInterCampo;
    Nombre_Persona       : TInterCampo;
    Cve_Actividad_Pf     : TInterCampo;
    Cve_Estado_Civil     : TInterCampo;
    Cve_Rama_Pf          : TInterCampo;
    Cve_Sexo             : TInterCampo;
    F_Nacimiento         : TInterCampo;
    Lugar_Nacim          : TInterCampo;
    Cve_Edo_Nacim        : TInterCampo;
    EstadoNacim          : TInterCampo;
    Cve_Pais_Nacim       : TInterCampo;
    PaisNacim            : TInterCampo;
    Curp                 : TInterCampo;
    B_Activ_Empresa      : TInterCampo;
    Id_Profesion         : TInterCampo;
    Id_Emp_Labora        : TInterCampo;
    Puesto_Empresa       : TInterCampo;
    Ano_Antig_Empr       : TInterCampo;
    Mes_Antig_Empr       : TInterCampo;
    B_PEPS               : TInterCampo;
//    ID_GPO_ING_MENS  : TInterCampo; //ERROR, QUITAR ANTES DE LIBERAR
    Id_Rango_Ingreso     : TInterCampo;
    //CORRESPONDEN A PER_EMP_PF (EMPRESA DE PERSONA FISICA CON ACTIVIDAD EMPRESARIAL)
    Nombre_Emp_Pf        : TInterCampo;
    Domicilio            : TInterCampo;
    DomicilioEmp_Pf      : TInterCampo;
    Desc_DomPF           : TInterCampo;
    //CORRESPONDEN AL RFC.
    Siglas_RFC           : TInterCampo;
    F_RFC: TInterCampo;
    Homoclave_RFC        : TInterCampo;
    //CORRESPONDEN AL DOMICILIO.
    CalleNumero          : TInterCampo;
    CaNum_Fiscal         : TInterCampo; // CZR 03-jun-2009
    PobNacionalidad      : TPoblacion;
    PobResidencia        : TPoblacion;
    PaisExpedicion       : TPoblacion;  // CZR 19-nov-2014
    PaisNacimiento       : TPoblacion;
    EstadoNacimiento     : TPoblacion;
    Cve_Motivo           : TInterCampo; // CZR 17-mar-2010
    Desc_Motivo          : TInterCampo; // CZR 17-mar-2010
    Tx_Motivo            : TInterCampo; // CZR 17-mar-2010
    B_Aviso_Priv         : TInterCampo; // CZR 07-ago-2013
    ITIN                 : TInterCampo; // CZR 07-oct-2013
    No_Id_Fiscal_Ext     : TInterCampo; // CZR 19-nov-2014
    Cve_Pais_Exp         : TInterCampo; // CZR 19-nov-2014
    GIIN                 : TInterCampo; // CZR 19-nov-2014
    CONDUSEF             : TInterCampo; // CZR 19-nov-2014
    B_EXPEDIENTE         : TInterCampo;

    cve_estatus_fatca,                                                         //rohs4279 feb/2016 req. PMO151201
    cve_tipo_persona     : TInterCampo;                                        //rohs4279 feb/2016 req. PMO151201

    Frecuencia         : TPerFrecue;

    Siti               : TLdiActEco;
    //PerFueIng:TPerFueIng;
    ProfeOfic          : TProfeOfic;
    PerEmpLab          : TPerEmpLab;
    PerRanIng          : TPerRanIng;
    Actividad          : TActividad;
    //PER_PEPS_ASOC  : TPerPepAso;
    // CZR 17-Marzo-2010
    Motivo             : TMotIna;

    PersNac            : TPersNac;                                             //rohs4279 mar/2016 req. PMO151201

    function   EsClienteAAA   : boolean;
    function   InternalBusca  : Boolean; override;
    function   InternalDelete : Boolean; override;// Proceso interno de Delete
    function   InternalPost   : Boolean; override;  // Proceso interno de Post
    function   ValidaLocaliza : Boolean; override;
    function   InternalEdit   : Boolean; override;
    function   Reporte        : Boolean; override;
    function   ShowWindow(FormaTipo:TFormaTipo):Integer; override;

    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;

    procedure  DespuesLocaliza(Sender: TObject);
    procedure  VisFiscalUbicacionExt(pOmiteRegla : Boolean; pEnabled : Boolean); // CZR 19-nov-2014   Visibilidad Fiscal (Ubicacion Extranjeros)
    procedure  DespuesLocalizaPobNac(Sender : TObject); // CZR 07-oct-2013
    procedure  DespuesLocalizaPobRes(Sender : TObject); // CZR 07-oct-2013
    procedure  AgregarFilaFteIngr(lvw : TListView; informacion : array of string);
    procedure  DataBaseChange; override;
    procedure  Post; override; // Post
    procedure  SetFilterBy(Filtro:Integer); override;
    Function   ValidaRFC(
      Nombre, ApPaterno, ApMaterno, RazonSocial: String; FechaRFC: TDateTime;
      Siglas, Numeros, Homoclave: String; ShowError: Boolean = True): Boolean; 
    // SATV4766 el 30 Ago 2006
    function StpObtSitPersona(peDatabaseName,
                              peSessionName,
                              peCVE_PER_JURIDICA,
                              peAPELLIDO_PAT,
                              peAPELLIDO_MAT,
                              peNOMBRE,
                              peSIGLAS,
                              peFECHA,
                              peHOMOCLAVE : String;
                              var psID_PER_BLOQ : Integer;
                              var psSIT_ADM_PER_BLOQ : String;
                              var psRESULTADO       : Integer;
                              var psTX_RESULTADO    : String
                            ) : Boolean;


  published
   procedure Visibilidad_NivelRiesgo(pVisible : Boolean; pObtNivelRiesgo : Boolean); // CZR 26-ago-2014

   property plvFteIngreso   : TListView    read vlvFteIngreso   write vlvFteIngreso;
   // CZR 07-ago-2013
   property ppgPestanias    : TPageControl read vpgPestanias    write vpgPestanias;
   property ptabAvisoPriv   : TTabSheet    read vtabAvisoPriv   write vtabAvisoPriv;
   property plEmpleado      : TLabel       read vlEmpleado      write vlEmpleado;
   // CZR 07-oct-2013
   property plITIN          : TLabel       read vlITIN          write vlITIN;
   //property pmeITIN         : TMaskEdit    read vmeITIN         write vmeITIN;
   property pmeITIN         : TEdit        read vmeITIN         write vmeITIN;
   // CZR 14-oct-2013
   property plvTelefonos    : TListView    read vlvTelefonos    write vlvTelefonos;
   property pieNumTotAcc    : TInterEdit   read vieNumTotAcc    write vieNumTotAcc;
   // CZR 26-ago-2014
   property  plNivelRiesgo  : TLabel       read vlNivelRiesgo   write vlNivelRiesgo;
   property  pEdNivelRiesgo : TEdit        read vEdNivelRiesgo  write vEdNivelRiesgo;
   // CZR 19-nov-2014
   property plNoIdFiscalExt : TLabel       read vlNoIdFiscalExt write vlNoIdFiscalExt;
   property peNoIdFiscalExt : TEdit        read veNoIdFiscalExt write veNoIdFiscalExt;
   property plCvePaisExp    : TLabel       read vlCvePaisExp    write vlCvePaisExp;
   property peCvePaisExp    : TEdit        read veCvePaisExp    write veCvePaisExp;
   property psbCvePaisExp   : TSpeedButton read vsbCvePaisExp   write vsbCvePaisExp;
   property peDescPaisExp   : TEdit        read veDescPaisExp   write veDescPaisExp;
  end;

implementation
{$R *.DFM}

uses
  IntPerRefBan,
  IntPerEmpre,   { Informacion de Empresa }
  IntPerAsocia,
  IntPerRefPer,  { Referencias Personales }
  IntPerAcc,
  IntTelPersona; { Telefonos por Persona }

// CZR 19-nov-2014
procedure TPersona.VisFiscalUbicacionExt(pOmiteRegla : Boolean; pEnabled : Boolean);

  procedure ExeVisFiscalUbicacionExt(pVisibleITIN          : Boolean; pEnabledITIN          : Boolean;
                                     pVisibleNoIdFiscalExt : Boolean; pEnabledNoIdFiscalExt : Boolean);
  begin
    if (plITIN <> nil) and (pmeITIN <> nil) then begin
      plITIN.Visible  := pVisibleITIN;
      pmeITIN.Visible := pVisibleITIN;
      pmeITIN.Enabled := pEnabledITIN;
      if pEnabledITIN then
        pmeITIN.Color := clWindow
      else
        pmeITIN.Color := clBtnFace;
    end;
    if (plNoIdFiscalExt <> nil) and (peNoIdFiscalExt <> nil) and
       (plCvePaisExp    <> nil) and (peCvePaisExp    <> nil) and
       (psbCvePaisExp   <> nil) and (peDescPaisExp   <> nil) then begin
      plNoIdFiscalExt.Visible := pVisibleNoIdFiscalExt;
      peNoIdFiscalExt.Visible := pVisibleNoIdFiscalExt;
      plCvePaisExp.Visible    := pVisibleNoIdFiscalExt;
      peCvePaisExp.Visible    := pVisibleNoIdFiscalExt;
      psbCvePaisExp.Visible   := pVisibleNoIdFiscalExt;
      peDescPaisExp.Visible   := pVisibleNoIdFiscalExt;
      peNoIdFiscalExt.Enabled := pEnabledNoIdFiscalExt;
      if pEnabledNoIdFiscalExt then
        peNoIdFiscalExt.Color := clWindow
      else
        peNoIdFiscalExt.Color := clBtnFace;
    end;
  end;

begin
  ExeVisFiscalUbicacionExt(False, False, False, False);
  if pOmiteRegla then
    ExeVisFiscalUbicacionExt(pEnabled, pEnabled, pEnabled, pEnabled)
  else begin // Por peticion de Victor Hugo Reyes Rodriguez, se valida por Nacionalidad o Residencia
    if (trim(PobNacionalidad.Cve_Poblacion.AsString) = cPaisEUA) or (trim(PobResidencia.Cve_Poblacion.AsString) = cPaisEUA) then
      ExeVisFiscalUbicacionExt(True, pEnabled, False, False)
    else begin
      if trim(PobNacionalidad.Cve_Poblacion.AsString) <> cPaisMexico then
        ExeVisFiscalUbicacionExt(False, False, True, pEnabled);
    end;
  end;
end;

procedure TPersona.DespuesLocalizaPobNac(Sender: TObject);
begin
//   VisFiscalUbicacionExt(False, True); // CZR 07-oct-2013       rohs4279 mar/2016 req. PMO151201
end;

procedure TPersona.DespuesLocalizaPobRes(Sender: TObject);
begin
//   VisFiscalUbicacionExt(False, True); // CZR 07-oct-2013       rohs4279 mar/2016 req. PMO151201
end;

constructor TPersona.Create(AOwner : TComponent);
begin
  inherited;
  {******************************* PERSONA ************************************}
  Id_Persona           := CreaCampo('ID_PERSONA',ftInteger,tsConsulta+tsModifica+tsElimina,tsNuevo,False);
  Id_Domicilio         := CreaCampo('ID_DOMICILIO',ftInteger,tsModifica+tsNuevo,tsConsulta,False);
  Id_Dom_Fiscal        := CreaCampo('ID_DOM_FISCAL',ftInteger,tsModifica+tsNuevo,tsConsulta,False);     // CZR 03-JUNIO-2009
  Cve_Residencia       := CreaCampo('CVE_RESIDENCIA',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Residencia           := CreaCampo('RESIDENCIA',ftString,tsNinguno,tsConsulta,False);
  Cve_Nacionalidad     := CreaCampo('CVE_NACIONALIDAD',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Nacionalidad         := CreaCampo('NACIONALIDAD',ftString,tsNinguno,tsConsulta,False);
  Cve_Per_Juridica     := CreaCampo('CVE_PER_JURIDICA',ftString,tsModifica+tsNuevo+tsElimina,tsConsulta,False);
  F_Alta               := CreaCampo('F_ALTA',ftDate,tsModifica+tsNuevo,tsConsulta,False);
  F_Baja               := CreaCampo('F_BAJA',ftDate,tsModifica+tsNuevo,tsConsulta,False);
  Sit_Persona          := CreaCampo('SIT_PERSONA',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Telef_Casa           := CreaCampo('TELEF_CASA',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Telef_Fax            := CreaCampo('TELEF_FAX',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Telef_Oficina        := CreaCampo('TELEF_OFICINA',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Telef_Cel            := CreaCampo('TELEF_CEL',ftString,tsModifica+tsNuevo,tsConsulta,False); //SACA4984
  Cve_Tipo_Sector      := CreaCampo('CVE_TIPO_SECTOR',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Nombre               := CreaCampo('NOMBRE',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Fh_Modificacion      := CreaCampo('FH_MODifICACION',ftDateTime,tsModifica+tsNuevo,tsConsulta+tsModifica+tsNuevo,False);
  Cve_Usuar_Modif      := CreaCampo('CVE_USUAR_MODif',ftString,tsModifica+tsNuevo,tsConsulta,False);
  B_Captura_Aseg       := CreaCampo('B_Captura_Aseg',ftString,tsModifica+tsNuevo,tsConsulta,False);
  E_Mail               := CreaCampo('E_Mail',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Id_Fuente_Ingr       := CreaCampo('ID_FUENTE_INGR',ftInteger,tsModifica+tsNuevo,tsConsulta,False);
  Cve_Activ_Cto        := CreaCampo('CVE_ACTIV_CTO', ftString, tsModifica+tsNuevo, tsConsulta, False);
  FEA                  := CreaCampo('FEA', ftString, tsModifica + tsNuevo, tsConsulta, False);
  {****************************** DOMICILIO ***********************************}
  CalleNumero          := CreaCampo('CALLE_NUMERO',ftString,tsNinguno,tsConsulta,False);
  CaNum_Fiscal         := CreaCampo('CANUM_FISCAL',ftString,tsNinguno,tsConsulta,False);     // CZR 03-JUNIO-2009
  {***************************** PERSONA MORAL ********************************}
  Cve_Tipo_SectorPM    := CreaCampo('CVE_TIPO_SECTORPM',ftString,  tsModifica+tsNuevo,  tsConsulta,False);
  Cve_Rama_Activ       := CreaCampo('CVE_RAMA_ACTIV',ftString,  tsModifica+tsNuevo,  tsConsulta,False);
  Cve_Sub_Rama_Ac      := CreaCampo('CVE_SUB_RAMA_AC',ftString,  tsModifica+tsNuevo,  tsConsulta,False);
  F_Contstitucion      := CreaCampo('F_CONSTITUCION',ftDate,  tsModifica+tsNuevo,  tsConsulta,False);
  Nom_Razon_Social     := CreaCampo('NOM_RAZON_SOCIAL', ftString, tsModifica+tsNuevo, tsConsulta, False);
  Num_Tot_Acciones     := CreaCampo('NUM_TOT_ACCIONES', ftFloat,  tsModifica+tsNuevo, tsConsulta, False); // CZR 16-oct-2013   Numero Total de Acciones
  {**************************** PERSONA FISICA ********************************}
  Apellido_Paterno     := CreaCampo('APELLIDO_PATERNO',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Apellido_Materno     := CreaCampo('APELLIDO_MATERNO',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Nombre_Persona       := CreaCampo('NOMBRE_PERSONA',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Cve_Actividad_Pf     := CreaCampo('CVE_ACTIVIDAD_PF',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Cve_Estado_Civil     := CreaCampo('CVE_ESTADO_CIVIL',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Cve_Rama_Pf          := CreaCampo('CVE_RAMA_PF',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Cve_Sexo             := CreaCampo('CVE_SEXO',ftString,tsModifica+tsNuevo,tsConsulta,False);
  F_Nacimiento         := CreaCampo('F_NACIMIENTO',ftDate,tsModifica+tsNuevo,tsConsulta,False);
  Lugar_Nacim          := CreaCampo('LUGAR_NACIM',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Cve_Edo_Nacim        := CreaCampo('CVE_EDO_NACIM',ftString,tsModifica+tsNuevo,tsConsulta,False);
  EstadoNacim          := CreaCampo('ESTADONACIM',ftString,tsNinguno,tsConsulta,False);
  Cve_Pais_Nacim       := CreaCampo('CVE_PAIS_NACIM',ftString,tsModifica+tsNuevo,tsConsulta,False);
  PaisNacim            := CreaCampo('PAISNACIM',ftString,tsNinguno,tsConsulta,False);
  Curp                 := CreaCampo('CURP',ftString,tsModifica+tsNuevo,tsConsulta,False);
  B_Activ_Empresa      := CreaCampo('B_ACTIV_EMPRESA',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Id_Profesion         := CreaCampo('ID_PROFESION',ftInteger,tsModifica+tsNuevo,tsConsulta,False);
  Id_Emp_Labora        := CreaCampo('ID_EMP_LABORA',ftInteger,tsModifica+tsNuevo,tsConsulta,False);
  Puesto_Empresa       := CreaCampo('PUESTO_EMPRESA',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Id_Rango_Ingreso     := CreaCampo('ID_RANGO_INGRESO',ftInteger,tsModifica+tsNuevo,tsConsulta,False);
  Ano_Antig_Empr       := CreaCampo('ANO_ANTIG_EMPR',ftInteger,tsModifica+tsNuevo,tsConsulta,False);
  Mes_Antig_Empr       := CreaCampo('MES_ANTIG_EMPR',ftInteger,tsModifica+tsNuevo,tsConsulta,False);
  B_PEPS               := CreaCampo('B_PEPS', ftString, tsModifica+tsNuevo, tsConsulta, False);

  Nombre_Emp_Pf        := CreaCampo('NOMBRE_EMP_PF',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Domicilio            := CreaCampo('DOMICILIO',ftString,tsModifica+tsNuevo,tsConsulta,False);
  DomicilioEmp_Pf      := CreaCampo('ID_DOM_EMPPF',ftInteger,tsModifica+tsNuevo,tsConsulta,False);
  Desc_DomPF           := CreaCampo('DESC_DOMPF'  ,ftString,tsNinguno,tsConsulta,False);
  {********************************* RFC **************************************}
  Siglas_RFC           := CreaCampo('SIGLAS_RFC',ftString,tsModifica+tsNuevo,tsConsulta,False);
  F_RFC                := CreaCampo('F_RFC',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Homoclave_RFC        := CreaCampo('HOMOCLAVE_RFC',ftString,tsModifica+tsNuevo,tsConsulta,False);

  Cve_activ_eco_siti   := CreaCampo('CVE_ACTIV_ECO_SITI',ftString,tsModifica+tsNuevo,tsConsulta,False);
  Codigo_Respuesta     := CreaCampo('CODRESP',           ftInteger, tsNinguno,          tsConsulta+tsNuevo+tsModifica+tsElimina,False);
  Cve_Motivo           := CreaCampo('CVE_MOTIVO',        ftString,  tsModifica,         tsNinguno,  False); // CZR 17-mar-2010
  Desc_Motivo          := CreaCampo('DESC_MOTIVO',       ftString,  tsNinguno,          tsNinguno,  False); // CZR 17-mar-2010
  Tx_Motivo            := CreaCampo('TX_MOTIVO',         ftString,  tsModifica,         tsNinguno,  False); // CZR 17-mar-2010
  B_Aviso_Priv         := CreaCampo('B_AVISO_PRIV',      ftString,  tsModifica+tsNuevo, tsConsulta, False); // CZR 07-ago-2013
  B_EXPEDIENTE         := CreaCampo('B_EXPEDIENTE',      ftString,  tsModifica+tsNuevo, tsConsulta, False); // CZR 07-ago-2013
  ITIN                 := CreaCampo('ITIN',              ftString,  tsModifica+tsNuevo, tsConsulta, False); // CZR 07-oct-2013
  No_Id_Fiscal_Ext     := CreaCampo('NO_ID_FISCAL_EXT',  ftString,  tsModifica+tsNuevo, tsConsulta, False); // CZR 19-nov-2014
  Cve_Pais_Exp         := CreaCampo('CVE_PAIS_EXP',      ftString,  tsModifica+tsNuevo, tsConsulta, False); // CZR 19-nov-2014
  GIIN                 := CreaCampo('GIIN',              ftString,  tsModifica+tsNuevo, tsConsulta, False); // CZR 19-nov-2014
  CONDUSEF             := CreaCampo('CONDUSEF',          ftString,  tsModifica+tsNuevo, tsConsulta, False); // CZR 19-nov-2014

  cve_estatus_fatca    := CreaCampo('CVE_ESTATUS_FATCA',    ftString,  tsModifica+tsNuevo, tsConsulta,  False); //rohs4279 feb/2016 req. PMO151201
  cve_tipo_persona     := CreaCampo('CVE_TIPO_PERSONA',     ftString,  tsModifica+tsNuevo, tsConsulta,  False); //rohs4279 feb/2016 req. PMO151201

  with B_Aviso_Priv do begin // CZR 07-ago-2013
    Size     := 1;
    UseCombo := True;
    ComboLista.Add('0');
    ComboDatos.Add('V');
    ComboLista.Add('1');
    ComboDatos.Add('F');
  end;

  with B_EXPEDIENTE do begin // CZR 07-ago-2013
    Size     := 1;
    UseCombo := True;
    ComboLista.Add('0');
    ComboDatos.Add('V');
    ComboLista.Add('1');
    ComboDatos.Add('F');
  end;

  with Sit_Persona do begin // CZR 17-mar-2010
    Size     := 4;
    UseCombo := True;
    ComboLista.Add('0');
    ComboDatos.Add('AC');
    ComboLista.Add('1');
    ComboDatos.Add('IN');
    ComboLista.Add('2');
    ComboDatos.Add('LD');
    ComboLista.Add('3');
    ComboDatos.Add('RE'); //---
  end;

  Cve_Residencia.Size       := 6;
  Cve_Nacionalidad.Size     := 6;
  Cve_Per_Juridica.Size     := 2;
  Telef_Casa.Size           := 20;
  Telef_Fax.Size            := 20;
  Telef_Oficina.Size        := 20;
  Telef_Cel.Size            := 20;//SACA4984
  Cve_Tipo_Sector.Size      := 2;
  Nombre.Size               := 150;
  Cve_activ_eco_siti.Size   := 7;
  Cve_Usuar_Modif.Size      := 8;
  B_Captura_Aseg.Size       := 1;
  E_Mail.Size               := 60;
  Cve_Tipo_SectorPM.Size    := 2;
  Cve_Rama_Activ.Size       := 2;
  Cve_Sub_Rama_Ac.Size      := 2;
  Apellido_Paterno.Size     := 30;
  Apellido_Materno.Size     := 30;
  Nombre_Persona.Size       := 40;
  Cve_Actividad_Pf.Size     := 2;
  Cve_Estado_Civil.Size     := 1;
  Cve_Rama_Pf.Size          := 2;
  Cve_Sexo.Size             := 1;
  Cve_Edo_Nacim.Size        := 30;
  Cve_Pais_Nacim.Size       := 6;
  Curp.Size                 := 18;
  Puesto_Empresa.Size       := 40;
  F_RFC.Size                := 6;
  cve_estatus_fatca.Size    := 15;                                             //rohs4279 feb/2016 req. PMO151201
  cve_tipo_persona.Size     := 15;                                             //rohs4279 feb/2016 req. PMO151201

  FActive := False;
  FKeyFields.Add('ID_PERSONA');
  HelpFile := 'IntPers.hlp';
  OnAfterLocaliza := DespuesLocaliza;

  //StpName := 'STPCOPERS_KYC2';
  StpName                                    := 'PKGCORPORATIVO.CONPERSONA';
  PobNacionalidad                            := TPoblacion.Create(Self);
  PobNacionalidad.MasterSource               := self;
  PobNacionalidad.Cve_Poblacion.MasterField  := 'CVE_NACIONALIDAD';
  PobNacionalidad.FilterBy                   := fbTPoblacionPais;
  PobNacionalidad.OnAfterLocaliza            := DespuesLocalizaPobNac; // CZR 07-oct-2013

  PobResidencia                              := TPoblacion.Create(Self);
  PobResidencia.MasterSource                 := self;
  PobResidencia.Cve_Poblacion.MasterField    := 'CVE_RESIDENCIA';
  PobResidencia.FilterBy                     := fbTPoblacionPais;
  PobResidencia.OnAfterLocaliza              := DespuesLocalizaPobRes; // CZR 07-oct-2013

  // CZR 19-nov-2014
  PaisExpedicion                             := TPoblacion.Create(Self);
  PaisExpedicion.MasterSource                := self;
  PaisExpedicion.Cve_Poblacion.MasterField   := 'CVE_PAIS_EXP';
  PaisExpedicion.FilterBy                    := fbTPoblacionPais;

  PaisNacimiento                             := TPoblacion.Create(Self);
  PaisNacimiento.MasterSource                := self;
  PaisNacimiento.Cve_Poblacion.MasterField   := 'CVE_PAIS_NACIM';
  PaisNacimiento.FilterBy                    := fbTPoblacionPais;

  EstadoNacimiento                           := TPoblacion.Create(Self);
  EstadoNacimiento.MasterSource              := self;
  EstadoNacimiento.Cve_Poblacion.MasterField := 'CVE_EDO_NACIM';
  EstadoNacimiento.FilterString              := '(CVE_TIPO_POBLAC = ''ES'')' ;

  Siti                                      := TLdiActEco.Create(Self);
  Siti.CVE_ACTIV_ECON.MasterField           := 'CVE_ACTIV_ECO_SITI';
  Siti.MasterSource                         := Self;

  ProfeOfic                                 := TProfeOfic.Create(Self);
  ProfeOfic.MasterSource                    := self;
  ProfeOfic.Id_Profesion.MasterField        := 'ID_PROFESION';

  PerRanIng                                 := TPerRanIng.Create(Self);
  PerRanIng.MasterSource                    := self;
  PerRanIng.Id_Rango_Ingreso.MasterField    := 'ID_RANGO_INGRESO';

  PerEmpLab                                 := TPerEmpLab.Create(Self);
  PerEmpLab.MasterSource                    := self;
  PerEmpLab.Id_Emp_Labora.MasterField       := 'ID_EMP_LABORA';

  Actividad                                 := TActividad.Create(Self, True);
  Actividad.MasterSource                    := self;
  Actividad.CVE_ACTIV_CTO.MasterField       := 'CVE_ACTIV_CTO';

  Frecuencia                                := TPerFrecue.Create(Self);
  Frecuencia.MasterSource                   := self;

  // CZR 17-Marzo-2010
  Motivo                                    := TMotIna.Create(Self);
  Motivo.MasterSource                       := Self;

  IsCorp                                    := True;

  PersNac                                   := TPersNac.Create(Self);          //rohs4279 mar/2016 req. PMO151201
end;//constructor

destructor TPersona.Destroy;
begin
  if PobNacionalidad <> nil then
    PobNacionalidad.Free;
  if PobResidencia <> nil then
    PobResidencia.Free;
  if PaisExpedicion <> nil then
    PaisExpedicion.Free; // CZR 19-nov-2014
  if PaisNacimiento <> nil then
    PaisNacimiento.Free;
  if EstadoNacimiento <> nil then
    EstadoNacimiento.Free;
  if Siti <> nil then
    Siti.Free;
  if ProfeOfic <> nil then
    ProfeOfic.Free;
  if PerEmpLab <> nil then
    PerEmpLab.Free;
  if PerRanIng <> nil then
    PerRanIng.Free;
  if Actividad <> nil then
    Actividad.Free;
  if Motivo <> nil then
    Motivo.Free;     // CZR 17-Marzo-2010
  if Frecuencia <> nil then
    Frecuencia.Free;
  if PersNac <> Nil then                                                       //rohs4279 mar/2016 req. PMO151201
    PersNac.free;
  inherited;
end;//desctructor

function TPersona.InternalEdit:Boolean;
begin
  if GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION = ''CLASE_' + Uppercase(ClassName) +
            ''') AND (CVE_USUARIO = ''' + DameUsuario + ''') and (CVE_OPER_ACC = ''MM'')',
            SeguDataBaseName,SeguSessionName,True) then begin
    if Trunc(F_Alta.AsDateTime) <> Trunc(Apli.SysDateTime) then
      raise EInterFrame.Create('Este Contrato fue Creado otro Dia. No tiene Derecho para Modificarlo, ' +
                               'Solo el Mismo día de Creación. Verifique con su Administrador');
  end;//if
  Result := inherited InternalEdit;
end;//function

procedure TPersona.DataBaseChange;
begin
  PobNacionalidad.GetParams(Self);
  PobResidencia.GetParams(Self);
  PaisExpedicion.GetParams(Self); // CZR 19-nov-2014
  PaisNacimiento.GetParams(Self);
  EstadoNacimiento.GetParams(Self);
  Siti.GetParams(Self);
  ProfeOfic.GetParams(Self);
  PerEmpLab.GetParams(Self);
  PerRanIng.GetParams(Self);
  Actividad.GetParams(Self);
  Motivo.GetParams(Self);     // CZR 17-Marzo-2010
  Frecuencia.GetParams(Self);
  PersNac.GetParams(Self);                                                     //rohs4279 mar/2016 req. PMO151201
end;//procedure

procedure TPersona.SetFilterBy(Filtro:Integer);
begin
  inherited;
  Active := False;
end;//procedure

// CZR 26-ago-2014
procedure TPersona.Visibilidad_NivelRiesgo(pVisible : Boolean; pObtNivelRiesgo : Boolean);
var vVisible : Boolean;

begin
  if (plNivelRiesgo <> nil) and (pEdNivelRiesgo <> nil) then begin
    pEdNivelRiesgo.Clear;
    vVisible := pVisible;
    //------------------------------------------------------------------------
    if Active then
      if pObtNivelRiesgo then begin // Obtener Nivel de Riesgo de la Persona
        pEdNivelRiesgo.Text := trim(NivelRiesgoPer(Self, Id_Persona.AsInteger, cDescripcion));
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

function TPersona.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWPersona;

begin
  W         := TWPersona.Create(Self);
  W.Persona := Self;
  case FilterBy of
    fbTPersonaMoral    : W.Caption := 'Personas Morales';
    fbTPersonaFisica   : W.Caption := 'Personas Físicas';

    // CZR 25-FEB-09
    fbTProspectoMoral  : W.Caption := 'Prospectos Morales';
    fbTProspectoFisica : W.Caption := 'Prospectos Fisicos';

    else
      W.Caption := 'Personas';
  end;//case
  try
    W.Persona := Self;
    W.InterForma1.InterFrame      := Self;
    W.InterForma1.ShowGrid        := False;
    W.InterForma1.ShowNavigator   := False;
    W.InterForma1.FormaTipo       := FormaTipo;
    W.InterForma1.Funcion         := FInterFun;
    W.qEmpresaLabora.DatabaseName := Apli.DataBaseName;
    plvFteIngreso                 := W.lvFteIngreso;
    // CZR 07-ago-2013
    ppgPestanias                  := W.PgCtrl;
    ptabAvisoPriv                 := W.tabAvisoPriv;
    plEmpleado                    := W.lEmpleado;
    // CZR 07-oct-2013
    plITIN                        := W.lITIN;
    //pmeITIN                       := W.meITIN;
    pmeITIN                       := W.eITIN;
    // CZR 14-oct-2013
    plvTelefonos                  := W.lvTelefonos;
    pieNumTotAcc                  := W.ieNumTotAcciones;
    // CZR 26-ago-2014
    plNivelRiesgo                 := W.lNivelRiesgo;
    pEdNivelRiesgo                := W.edNivelRiesgo;
    Visibilidad_NivelRiesgo(False, True);
    // CZR 19-nov-2014
    plNoIdFiscalExt               := W.lNoIdFiscalExt;
    peNoIdFiscalExt               := W.eNoIdFiscalExt;
    plCvePaisExp                  := W.lCvePaisExp;
    peCvePaisExp                  := W.eCvePaisExp;
    psbCvePaisExp                 := W.sbCvePaisExp;
    peDescPaisExp                 := W.eDescPaisExp;

    DespuesLocaliza(Self);        //SACA4984
    W.InterForma1.ShowModal;      //SACA4984
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

function TPersona.ValidaLocaliza:Boolean;
begin
  ValidaLocaliza := False;
  Case Codigo_Respuesta.AsInteger of
    3 : MessageDlg('La Persona seleccionada tiene más de un RFC registrado.', mtWarning, [mbOK], 0);
    Else Begin
      Case FilterBy of
        fbTPersonaFisica : begin
          if Cve_Per_Juridica.AsString <> 'PF' then begin
            State := 0;
            DrawControl;
            raise EInterFrame.Create ('Imposible localizar el registro, sólo puede seleccionar Personas Físcas');
          end;//if
        end;//case
        fbTPersonaMoral : begin
          if Cve_Per_Juridica.AsString <> 'PM' then begin
            State := 0;
            DrawControl;
            raise EInterFrame.Create ('Imposible localizar el registro, sólo puede seleccionar Personas Morales');
          end;//if
        end;//case
//       fbTProspectoFisica : begin
//                            if Cve_Per_Juridica.AsString <> 'PF' then begin
//                               State := 0;
//                               DrawControl;
//                               raise EInterFrame.Create ('Imposile localizar el registro, sólo puede seleccionar Personas Físcas');
//                            end;//if
//                          end;//case
//        fbTProspectoMoral : begin
//                            if Cve_Per_Juridica.AsString <> 'PM' then begin
//                               State := 0;
//                               DrawControl;
//                               raise EInterFrame.Create ('Imposile localizar el registro, sólo puede seleccionar Personas Morales');
//                            end;//if
//                          end;//case
//
      end;//case
      ValidaLocaliza := True;
    end;
  end;

{
  if Codigo_Respuesta.AsInteger in [0,3] then
  begin
     case FilterBy of
       fbTPersonaFisica : begin
                            if Cve_Per_Juridica.AsString <> 'PF' then begin
                               State := 0;
                               DrawControl;
                               raise EInterFrame.Create ('Imposile localizar el registro, sólo puede seleccionar Personas Físcas');
                            end;//if
                          end;//case
        fbTPersonaMoral : begin
                            if Cve_Per_Juridica.AsString <> 'PM' then begin
                               State := 0;
                               DrawControl;
                               raise EInterFrame.Create ('Imposile localizar el registro, sólo puede seleccionar Personas Morales');
                            end;//if
                          end;//case
     end;//case
     ValidaLocaliza := True;
  end;//if
}
end;//function

function TPersona.InternalBusca : Boolean;
var T : TInterFindit;

begin
  InternalBusca := False;
  T := nil;
  try
    case FilterBy of
      fbTPersonaFisica   : T := CreaBuscador('IntPFis.it','I');
      fbTPersonaMoral    : T := CreaBuscador('IntPMor.it','I');

      // CZR 25-FEB-09
      //fbTProspectoMoral  : T := CreaBuscador('IntProsM.it','I');
      //fbTProspectoFisica : T := CreaBuscador('IntProsF.it','I');
      fbTProspectoMoral  : T := CreaBuscador('INTPROSPECTOMOR.it','I'); // Luis Hernandez Abr 2013
      fbTProspectoFisica : T := CreaBuscador('INTPROSPECTOFIS.it','I'); // Luis Hernandez Abr 2013

      else
        T := CreaBuscador('IntPers.it','I');
    end;//case
    if Active then
      T.Param(0,ID_PERSONA.AsString);
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;//try & finally
end;//function

function TPersona.EsClienteAAA : boolean;
var STP : TStoredProc;

begin
  Result := FALSE;
  STP    := TStoredProc.Create(Self);
  try
    with STP do begin
      Params.Clear;
      StoredProcName := 'STPVERIFICACTEAAA';
      DatabaseName   := Apli.DataBaseName;
      SessionName    := Apli.SessionName;
      Params.CreateParam(ftInteger,'PIDENTIFICADOR',ptInput);
      Params.CreateParam(ftString,'PTIPOIDENTIFICADOR',ptInput);
      Params.CreateParam(ftString,'PESCTEAAA', ptOutput);
      Params.ParamByName('PIDENTIFICADOR').AsInteger    := ID_PERSONA.AsInteger;
      Params.ParamByName('PTIPOIDENTIFICADOR').AsString := 'P';
      ExecProc;
      if trim(Params.ParamByName('PESCTEAAA').AsString) = 'V' then
        Result := TRUE
      else
        Result := FALSE;
      Close;
    end;//with
  Finally
    STP.Free;
  end;//Finally
end;//function

Function TPersona.ValidaRFC(
      Nombre, ApPaterno, ApMaterno, RazonSocial: String; FechaRFC: TDateTime;
      Siglas, Numeros, Homoclave: String; ShowError: Boolean = True): Boolean;
var objStp : TStoredProc;

begin
  Result := False;

  If (Siglas <> '') and (Numeros <> '') and (Homoclave <> '') Then
    { Se calcula y valida el RFC }
    Try
      objStp:= TStoredProc.Create(Self);
      with objStp do begin
        Params.Clear;
        StoredProcName:= 'PKGCORPRFC.CALCULARFC';
        DatabaseName:= SeguDataBaseName;
        SessionName:= SeguSessionName;
        Params.CreateParam(ftString, 'pNomRazonSocial', ptInput);
        Params.CreateParam(ftString, 'pApellidoPaterno',ptInput);
        Params.CreateParam(ftString, 'pApellidoMaterno',ptInput);
        Params.CreateParam(ftString, 'pNombrePersona',  ptInput);
        Params.CreateParam(ftDate,   'pFRfc',           ptInput);
        Params.CreateParam(ftString, 'pSiglas',         ptOutput);
        Params.CreateParam(ftString, 'pNumeros',        ptOutput);
        Params.CreateParam(ftString, 'pHomoclave',      ptOutput);
        Params.CreateParam(ftInteger,'pResultado',      ptOutput);
        Params.CreateParam(ftString, 'pDescResultado',  ptOutput);

        Params.ParamByName('pNomRazonSocial').AsString:= RazonSocial;
        Params.ParamByName('pApellidoPaterno').AsString:= ApPaterno;
        Params.ParamByName('pApellidoMaterno').AsString:= ApMaterno;
        Params.ParamByName('pNombrePersona').AsString:= Nombre;
        Params.ParamByName('pFRfc').AsDate:= FechaRFC;

        ExecProc;

        If (Params.ParamByName('pResultado').AsInteger <> 0) Then
          { Error en el cálculo del RFC }
          Raise EInterFrame.Create(
            'Error en la validación del RFC. ' + chr(VK_RETURN) +
            Params.ParamByName('pDescResultado').asString)
        Else Begin
          { El Rfc es igual al calculado  o
            El usuario acepta la grabación del RFC diferente }
          IF ( (Trim(Params.ParamByName('pSiglas').asString) = Siglas) and
               (Trim(Params.ParamByName('pNumeros').asString) = Numeros) and
               (Trim(Params.ParamByName('pHomoclave').asString) = Homoclave)
             )
            OR
             ( ShowError and
               (MessageDlg('Error en la validación del RFC.' + chr(VK_RETURN) +
                         Params.ParamByName('pDescResultado').asString + chr(VK_RETURN) +
                         '  El RFC capturado  ' + Siglas + ' ' + Numeros + ' ' + Homoclave + '  no coincide ' + chr(VK_RETURN) +
                         '  con el calculado   ' + Trim(Params.ParamByName('pSiglas').asString) + ' ' +
                                                  Trim(Params.ParamByName('pNumeros').asString) + ' ' +
                                                  Trim(Params.ParamByName('pHomoclave').asString) + chr(VK_RETURN) + chr(VK_RETURN) +
                         '¿ Esta seguro de continuar con la modificación ?', mtConfirmation, [mbYes, mbNO], 0) = mrYes)
             ) THEN
            Result:= True;
        end;
      end;
    Finally
      If objStp <> nil Then objStp.Free; objStp:= nil;
    end
  Else If (Siglas = '') and (Numeros = '') and (Homoclave = '') Then
    { No es necesario validar el RFC porque la persona no lo requiere }
    Result:= True
  Else
    { Error... alguno de los campos del RFC no esta capturado }
    Raise EInterFrame.Create('El Registro de RFC es Incorrecto. Revise que todos los campos esten capturados.');
end;

procedure TPersona.Post;
Var FRfc: TDateTime;

begin
  GetFromControl;

  if Trim(Cve_Per_Juridica.AsString) = 'PF' then Begin
    Nombre.AsString := Trim(Trim(Nombre_Persona.AsString)+' '+Trim(Apellido_Paterno.AsString)+' '+Trim(Apellido_Materno.AsString));
    FRfc:= F_Nacimiento.AsDateTime;
  end
  else Begin
    Nombre.AsString := Nom_Razon_Social.AsString;
    FRfc:= F_Contstitucion.AsDateTime;
  end;

{  If ValidaRFC(Nombre_Persona.AsString, Apellido_Paterno.AsString, Apellido_Materno.AsString,       //rohs4279 mar/2016 req. PMO151201
               Nom_Razon_Social.AsString, FRfc, Siglas_RFC.AsString, F_RFC.asString, Homoclave_RFC.AsString) Then
    inherited Post
  Else
    Raise EInterFrame.Create('Modificación cancelada por el usuario.');}
  inherited Post
end;

function TPersona.InternalPost : Boolean;
var P : TStoredProc;
    W : TWPersona;

    vlID_PER_BLOQ      : Integer;
    vlSIT_ADM_PER_BLOQ : String;
    vlNOMBRE           : String;
    vlRESULTADO        : Integer;
    vlTX_RESULTADO     : String;

begin
  InternalPost := False;
  // Inicia Modificación por SATV4766 el 30 Ago 2006
  // Obtiene la Situación de la persona... Si el proceso la devuelve con situación Inactiva,
  // es débido a que se encuentra reportada por la autoridad
  If (Cve_Per_Juridica.AsString = 'PF') Then
    vlNOMBRE := Nombre_Persona.AsString
  Else
    vlNOMBRE := Nombre.AsString;
  // Obtiene la situación de la persona
  StpObtSitPersona( SeguDataBaseName, SeguSessionName,
                    Cve_Per_Juridica.AsString, // peCVE_PER_JURIDICA
                    Apellido_Paterno.AsString, // peAPELLIDO_PAT
                    Apellido_Materno.AsString, // peAPELLIDO_MAT
                    vlNOMBRE,                  // peNOMBRE
                    Siglas_RFC.AsString,       // peSIGLAS
                    F_RFC.AsString,            // peFECHA
                    Homoclave_RFC.AsString,    // peHOMOCLAVE
                    vlID_PER_BLOQ,             // peID_PER_BLOQ
                    vlSIT_ADM_PER_BLOQ,        // peSIT_ADM_PER_BLOQ
                    vlRESULTADO,               // peRESULTADO
                    vlTX_RESULTADO             // peTX_RESULTADO
                   );
  // Si se encuentra la persona reportada por la autoridad entonces...
  If (vlRESULTADO = 0) And (vlSIT_ADM_PER_BLOQ = 'IN') Then Begin
    Sit_Persona.AsString := vlSIT_ADM_PER_BLOQ;
    MessageDlg('La persona se encuentra bloqueada por la Autoridad. Para mayor información consultar con Auditoria',
               mtWarning, [mbOk], 0);
  End;
  // Termina Modificación por SATV4766

  if modo = moAppend then begin
    try
      //P := StpPrepara('STPALPERS_KYC2',tsNuevo);
      P := StpPrepara('PKGCORPORATIVO.ALTAPERSONA',tsNuevo);
      StpEjecuta(P,tsNuevo);
      if Codigo_Respuesta.AsInteger = 0 then begin
        InternalPost := True;
        Active       := True;
      end//if
      else begin
        InternalPost := False;
        case Codigo_Respuesta.AsInteger of
          1 : raise EInterFrame.Create('Imposible crear el registro. Revise que la persona o su RFC no esten duplicados.');
          else
            raise EInterFrame.Create('Imposible crear el registro.');
        end;//case
        exit;
      end;//else
    finally
    end;//try & finally
  end;//if
  if modo = moEdit then begin
    try
      //P := StpPrepara('STPMOPERS_KYC2',tsModifica);
      P := StpPrepara('PKGCORPORATIVO.MODPERSONA',tsModifica);
      StpEjecuta(P,tsModifica);
      if Codigo_Respuesta.AsInteger = 0 then begin
        InternalPost  := True;
      end//if
      else begin
        case Codigo_Respuesta.AsInteger of
          1 : raise EInterFrame.Create('Imposible modificar el registro. Revise que la persona o su RFC no esten duplicados.');
          else
            raise EInterFrame.Create('Imposible modificar el registro.');
        end;//case
        exit;
      end;//else
    finally
    end;//try & finally
  end;//if
end;//function

function TPersona.InternalDelete : Boolean;
var P : TStoredProc;
    W : TWPersona;

begin
  InternalDelete := False;
  if modo = moBrowse then begin
    try
      P := StpPrepara('STPBAPERS_KYC',tsElimina);
      StpEjecuta(P,tsElimina);
      if Codigo_Respuesta.AsInteger = 0 then begin
        InternalDelete :=  True;
        Active := False;
      end//if
      else begin
        InternalDelete :=  False;
        raise EInvalidOperation.Create('Imposible Eliminar a la Persona. Ocurrio un Error '+Codigo_Respuesta.AsString);
      end;//if
    finally
    end;//try & finally
  end//if
  else
    raise EInvalidOperation.Create('No Existe un Registro Activo. Imposible Eliminar a la Persona. ');
end;//function

function TPersona.Reporte: Boolean;
begin
  if (Id_persona.asstring <> '')then begin
    if (Cve_Per_Juridica.asString = 'PF')then
      Execute_RepPFis(True, Self, Id_persona.asinteger)
    else
      if (Cve_Per_Juridica.asString = 'PM')then
        Execute_RepPMor(True, Self, Id_persona.asinteger);
  end//if
  else
    raise EInterframe.Create('No ha sido seleccionada una persona para reportar sus datos');
end;//function

procedure TPersona.DespuesLocaliza(Sender: TObject);
var Qry  : TQuery;
    sSql : String;

begin
  if plvTelefonos <> nil then // CZR 15-oct-2013
    plvTelefonos.Items.Clear;
  if Active then begin
    try
      try
        plvFteIngreso.Items.Clear;
        sSql :=  'SELECT  INGP.ID_PERSONA , ' +
                 '        FTEI.ID_FUENTE_INGR, ' +
                 '        DECODE( RANG.CVE_PER_JURIDICA , ' +
                 '           ''PF'' , FTEI.DESC_FUENTE_INGR || '' '' ||INGP.DESC_OTRO,' +
		 '           ''PM'' , INGP.DESC_OTRO ) DESCRIPCION, ' +
                 '        TRIM(TO_CHAR( ' +
                 '        NVL((SELECT  MAX(MONTO_MAXIMO) + 1 ' +
                 '               FROM PER_RANG_INGRESO ' +
                 '              WHERE 1=1 ' +
                 '                AND CVE_PER_JURIDICA=RANG.CVE_PER_JURIDICA ' +
                 '                AND MONTO_MAXIMO < RANG.MONTO_MAXIMO ),''0''), '+
                 '        ''999G999G999''))  RANGO_MINIMO, ' +
                 '       TRIM(TO_CHAR( (RANG.MONTO_MAXIMO), ' +
                 '        ''999G999G999'')) RANGO_MAXIMO    '+
                 ' FROM ' +
                 '     PER_INGRESO_PRINCIPAL INGP, '+
                 '     PER_FUENTE_INGR FTEI,'+
                 '     PERSONA PER,'+
                 '     PER_RANG_INGRESO RANG,'+
                 '     MONEDA MON ' +
                 ' WHERE 1=1 ' +
                 '   AND PER.ID_PERSONA      = INGP.ID_PERSONA ' +
                 '   AND FTEI.ID_FUENTE_INGR = INGP.ID_FUENTE_INGR ' +
                 '   AND RANG.ID_RANGO_INGRESO = INGP.ID_RANGO_INGRESO ' +
                 '   AND MON.CVE_MONEDA   (+)= INGP.CVE_MONEDA ' +
                 '   AND INGP.ID_PERSONA     = ' + Id_Persona.AsSQL;

        Qry := GetSqlQuery( sSql , Apli.DataBaseName, Apli.SessionName, False);

        if Qry <> nil then
          while not Qry.eof do begin
            AgregarFilaFteIngr(plvFteIngreso, [Trim(Qry.FieldByName('ID_FUENTE_INGR').AsString),
                                               Trim(Qry.FieldByName('DESCRIPCION').AsString),
                                               Trim(Qry.FieldByName('RANGO_MINIMO').AsString),
                                               Trim(Qry.FieldByName('RANGO_MAXIMO').AsString)]);
            Qry.Next;
          end;
      finally
        if Qry <> nil then
          Qry.Free;
      end;

      // CZR 30-sep-2013
      try
        Qry := GetSqlQuery('select empleado '
                         + '  from (select decode(emp.sit_empleado, ''AC'', ''EMPLEADO ACTIVO'', ''EMPLEADO INACTIVO'') || '' - '' || pue.nombre_puesto as empleado '
                         + '          from empleado          emp '
                         + '               inner join puesto pue on pue.cve_puesto = emp.cve_puesto '
                         + '         where emp.id_persona = ' + Id_Persona.AsSQL
                         + '         union '
                         + '        select ''NO EMPLEADO'''
                         + '          from dual) '
                         + ' where rownum = 1 '
                         + ' order by empleado',
                           Apli.DataBaseName, Apli.SessionName, False);
        if Qry = nil then
          plEmpleado.Caption := ''
        else
          plEmpleado.Caption := Trim(Qry.FieldByName('EMPLEADO').AsString);
      finally
        if Qry <> nil then
          Qry.Free;
      end;

      // CZR 10-oct-2013   Cargar Teléfonos de Persona
      if plvTelefonos <> nil then
        try
          Qry := GetSqlQuery('select tipo.cve_tel_tipo, '
                           + '       lada.cve_poblac_lada, '
                           + '       tipo.desc_tel_tipo, '
                           + '       pais.prefijo_pais, '
                           + '       pais.codigo_pais, '
                           + '       lada.cve_lada, '
                           + '       per.numero, '
                           + '       per.extension '
                           + '  from tel_persona          per '
                           + '       inner join tel_tipo tipo on tipo.cve_tel_tipo    = per.cve_tel_tipo '
                           + '       inner join tel_lada lada on lada.cve_poblac_lada = per.cve_poblac_lada '
                           //-------------------------------------------------------------------------------------------------------------------------------
                           + '       inner join (select pa.cve_poblacion as cve_poblac_pais, '
                           + '                          cd.cve_poblacion as cve_poblac_lada '
                           + '                     from poblacion cd '
                           + '                          inner join poblacion re on re.cve_poblacion = cd.cve_poblac_ubic '
                           + '                          inner join poblacion ed on ed.cve_poblacion = re.cve_poblac_ubic '
                           + '                          inner join poblacion pa on pa.cve_poblacion = ed.cve_poblac_ubic '
                           + '                    where cd.cve_tipo_poblac = ' + QuotedStr(cPoblacion)
                           + '                    union '
                           + '                   select pa.cve_poblacion, '
                           + '                          re.cve_poblacion '
                           + '                     from poblacion re '
                           + '                          inner join poblacion ed on ed.cve_poblacion = re.cve_poblac_ubic '
                           + '                          inner join poblacion pa on pa.cve_poblacion = ed.cve_poblac_ubic '
                           + '                    where re.cve_tipo_poblac = ' + QuotedStr(cCiudad) + ') loc on loc.cve_poblac_lada = lada.cve_poblac_lada '
                           //-------------------------------------------------------------------------------------------------------------------------------
                           + '       inner join tel_pais pais on pais.cve_poblac_pais = loc.cve_poblac_pais '
                           + ' where per.id_persona = ' + Id_Persona.AsSQL,
                             Apli.DataBaseName, Apli.SessionName, False);
          if Qry <> nil then
            while not Qry.eof do begin
              AgregaFilaLvw(plvTelefonos, [Trim(Qry.FieldByName('CVE_TEL_TIPO').AsString),
                                           Trim(Qry.FieldByName('CVE_POBLAC_LADA').AsString),
                                           Trim(Qry.FieldByName('DESC_TEL_TIPO').AsString),
                                           Trim(Qry.FieldByName('PREFIJO_PAIS').AsString),
                                           Trim(Qry.FieldByName('CODIGO_PAIS').AsString),
                                           Trim(Qry.FieldByName('CVE_LADA').AsString),
                                           Trim(Qry.FieldByName('NUMERO').AsString),
                                           Trim(Qry.FieldByName('EXTENSION').AsString)]);
              Qry.Next;
            end;
        finally
          if Qry <> nil then
            Qry.Free;
        end;

      // CZR 07-ago-2013
      if ptabAvisoPriv <> nil then begin
        if trim(Cve_Per_Juridica.AsString) = cPerFisica then
          ptabAvisoPriv.PageControl := ppgPestanias
        else
          ptabAvisoPriv.PageControl := nil;
      end;

//         VisFiscalUbicacionExt(False, ((Modo = moAppend) or (Modo = moEdit))); // CZR 07-oct-2013  rohs4279 mar/2016 req. PMO151201

      // CZR 16-oct-2013
      if pieNumTotAcc <> nil then begin
        pieNumTotAcc.Enabled  := (trim(Cve_Per_Juridica.AsString) = cPerMoral);
        if (trim(Cve_Per_Juridica.AsString) = cPerMoral) and ((modo = moAppend) or (modo = moEdit)) then
          pieNumTotAcc.Color := clWindow
        else
          pieNumTotAcc.Color := clBtnFace;
      end;

      Visibilidad_NivelRiesgo(False, True); // CZR 26-ago-2014
    except
    end;
  end;
end;

procedure TPersona.AgregarFilaFteIngr(lvw : TListView; informacion : array of string); // CZR 07-Nov-2012
var
   fila : Tlistitem;
   n    : Integer;
begin
  for n := low(informacion) to high(informacion)-1 do
    with lvw do
      if n = 0 then begin
        fila        := Items.Add;
        fila.Caption:= informacion[n];
      end
      else begin
        if n=1 then
          fila.SubItems.Add(informacion[n])
        else
          fila.SubItems.Add('De $' + informacion[n] + ' a $' +  informacion[n+1]);
      end;
end;


(***********************************************FORMA DE PERSONA*****************)
(*                                                                              *)
(*  FORMA DE PERSONA                                                            *)
(***********************************************FORMA DE PERSONA*****************)

procedure TWPersona.DespuesShow(var Message:TMessage);
begin
  case Persona.FilterBy of
    fbTPersonaMoral : edCvePerJuridica.Text := 'PM';
    else
      edCvePerJuridica.Text := 'PF';
  end;//case
  edCvePerJuridicaChange(nil);
  chbB_Activ_EmpresaClick(nil);
  //rgPerJuridicaClick(nil);
  Refresh;

  if Persona.Id_Persona.AsString = Emptystr then                               //rohs4279 mar/2016 req. PMO151201
    tabNacRes.TabVisible := False
  else Begin
    rgPerJuridicaClick(self);
    tabNacRes.TabVisible := True;
    RefrescaGridNac;
  end;

  PgCtrl.ActivePage := TabSheet2;
  PgCtrl.ActivePage := TabSheet1;
end;//procedure

procedure TWPersona.FormShow(Sender : TObject);
begin
  Persona.PobNacionalidad.Desc_Poblacion.Control := edNacionalidad;
  Persona.PobResidencia.Desc_Poblacion.Control   := edResidencia;

  // CZR 19-nov-2014
  Persona.PaisExpedicion.Cve_Poblacion.Control   := eCvePaisExp;
  Persona.PaisExpedicion.Desc_Poblacion.Control  := eDescPaisExp;

  //Persona.PerFueIng.Desc_Fuente_Ingr.Control   := edDescFuenteIngr;
  Persona.ProfeOfic.Desc_Profesion.Control       := edDescProfesion;
  Persona.PerEmpLab.Nombre.Control               := edDescEmpLabora;
  Persona.PerRanIng.Monto_Maximo.Control         := iedMontoMaximo;
  Persona.Id_Persona.Control                     := edIdPersona;
  Persona.Id_Domicilio.Control                   := edIdDomicilio;
  Persona.Id_Dom_Fiscal.Control                  := edIdDom_Fis; // CZR 03-JUNIO-2009
  Persona.Cve_Residencia.Control                 := edCveResidencia;
  Persona.Cve_Nacionalidad.Control               := edCveNacionalidad;
  Persona.Cve_Per_Juridica.Control               := edCvePerJuridica;
  Persona.F_Alta.Control                         := edFAlta;
  Persona.F_Baja.Control                         := edFBaja;
  Persona.Sit_Persona.Control                    := edSitPersona;
  Persona.Telef_Casa.Control                     := edTelefCasa;
  Persona.Telef_Fax.Control                      := edTelefFax;
  Persona.Telef_Oficina.Control                  := edTelefOficina;
  Persona.Telef_Cel.Control                      := edTelefCel;
  Persona.Cve_Tipo_Sector.Control                := cbCveTipoSector;
  Persona.Nombre.Control                         := edNombre;
  Persona.Fh_Modificacion.Control                := edFhModificacion;
  Persona.Cve_Usuar_Modif.Control                := edCveUsuarModif;
  Persona.E_Mail.Control                         := edE_Mail;
  //Persona.Id_Fuente_Ingr.Control               := edIdFuenteIngr;
  Persona.Cve_Activ_Cto.Control                  := edCve_Activ_Cto;
  Persona.FEA.Control                            := edFea;
  Persona.Apellido_Paterno.Control               := edApellidoPaterno;
  Persona.Apellido_Materno.Control               := edApellidoMaterno;
  Persona.Nombre_Persona.Control                 := edNombrePersona;
  Persona.Cve_Actividad_Pf.Control               := cbCveActividadPF;
  Persona.Cve_Estado_Civil.Control               := cbCveEstadoCivil;
  Persona.Cve_Rama_Pf.Control                    := cbCveRamaPf;
  Persona.Cve_Sexo.Control                       := cbCveSexo;
  Persona.F_Nacimiento.Control                   := meFNacimiento;

  Persona.PaisNacimiento.Desc_Poblacion.Control  := edPaisNacimiento;
  Persona.EstadoNacimiento.Desc_Poblacion.Control:= edEdoNacimiento;

  Persona.Cve_Edo_Nacim.Control                  := edLugarNacim;
  Persona.Cve_Pais_Nacim.Control                 := edCvePaisNacim;

  Persona.Curp.Control                           := edCurp;
  Persona.B_Activ_Empresa.Control                := chbB_Activ_Empresa;
  Persona.Id_Profesion.Control                   := edIdProfesion;
  Persona.Id_Emp_Labora.Control                  := edIdEmpLabora;
  Persona.Puesto_Empresa.Control                 := edPuestoEmpresa;
  Persona.Ano_Antig_Empr.Control                 := iedAnoAntigEmpr;
  Persona.Mes_Antig_Empr.Control                 := iedMesAntigEmpr;
  Persona.B_PEPS.Control                         := chkBPEPS;
  //Persona.ID_GPO_ING_MENS.Control              := edIdRangoIngreso; //ERROR, QUITAR ANTES DE LIBERAR
  Persona.Id_Rango_Ingreso.Control               := edIdRangoIngreso;
  Persona.Nombre_Emp_Pf.Control                  := edNombreEmpPF;
  Persona.Domicilio.Control                      := edDomicilioAnt;
  Persona.DomicilioEmp_Pf.Control                := edDOMICILIO;
  Persona.Desc_DomPF .Control                    := edDesc_DomPF;
  Persona.Cve_Rama_Activ.Control                 := cbCveRamaActiv;
  Persona.Cve_Sub_Rama_Ac.Control                := cbCveSubRamaAC;
  Persona.Cve_Tipo_SectorPM.Control              := cbCveTipoSectorPM;
  Persona.F_Contstitucion.Control                := EdFConstitucion;
  Persona.Nom_Razon_Social.Control               := EdNomRazonSocial;
  Persona.Num_Tot_Acciones.Control               := ieNumTotAcciones; // CZR 16-oct-2013   Numero Total de Acciones
  Persona.Siglas_RFC.Control                     := EdSiglasRFC;
  Persona.F_RFC.Control                          := EdFRFC;
  Persona.Homoclave_RFC.Control                  := EdHomoclaveRFC;
  Persona.CalleNumero.Control                    := edCalleNumero;
  Persona.CaNum_Fiscal.Control                   := edCaNum_Fiscal;     // CZR 03-JUNIO-2009
  //Persona.B_Captura_Aseg.Control               := edb_Captura_Aseg;
  Persona.CalleNumero.Control                    := edCalleNumero;
  PostMessage(Handle,WM_DESPUESSHOW,0,0);
  Persona.Siti.DESC_ACTIV_ECON.Control           := edNbrSiti;
  Persona.Siti.MasterSourceEditControl           := sbSiti;

  btnAgregapepsasoc.Visible                      := chkBPEPS.Checked;
  btnAgregapepsasoc.Enabled                      := chkBPEPS.Checked;

  With Persona.Actividad do Begin
    Cve_Activ_SITI.Control                       := edCveSITI;
    ActividadSITI.DESC_ACTIV_ECON.Control        := edDescSITI;

    TipoCliente.CveSeccion.Control               := edCveTipoCliente;
    TipoCliente.DESC_ACTIVIDAD.Control           := edTipoCliente;
    Residencia.CveSeccion.Control                := edCveResidenciaAct;
    Residencia.DESC_ACTIVIDAD.Control            := edResidenciaAct;
    TipoSector.CveSeccion.Control                := edCveTipoSector;
    TipoSector.DESC_ACTIVIDAD.Control            := edTipoSector;
    Sector.CveSeccion.Control                    := edCveSector;
    Sector.DESC_ACTIVIDAD.Control                := edSector;
    SubSector.CveSeccion.Control                 := edCveSubSector;
    SubSector.DESC_ACTIVIDAD.Control             := edSubSector;
    Rama.CveSeccion.Control                      := edCveRama;
    Rama.DESC_ACTIVIDAD.Control                  := edRama;
    SubRama.CveSeccion.Control                   := edCveSubRama;
    SubRama.DESC_ACTIVIDAD.Control               := edSubRama;
    Inciso.CveSeccion.Control                    := edCveInciso;
    Inciso.DESC_ACTIVIDAD.Control                := edInciso;
  end;

  // CZR 17-mar-2010
  Persona.Cve_Motivo.Control                     := edCveMotivo;
  Persona.Desc_Motivo.Control                    := edDescMotivo;
  Persona.Tx_Motivo.Control                      := edTxMotivo;
  tabMotivo.PageControl                          := nil;

  Persona.B_Aviso_Priv.Control                   := rgAvisoPriv;    // CZR 07-ago-2013
  Persona.B_EXPEDIENTE.Control                   := cbExpediente;
  //Persona.ITIN.Control                           := meITIN;         // CZR 07-oct-2013
  Persona.ITIN.Control                           := eITIN;         // CZR 07-oct-2013
  Persona.No_Id_Fiscal_Ext.Control               := eNoIdFiscalExt; // CZR 19-nov-2014
  Persona.GIIN.Control                           := eGIIN;          // CZR 19-nov-2014
  Persona.CONDUSEF.Control                       := eCONDUSEF;      // CZR 19-nov-2014

  qNac.DatabaseName                              := Persona.DataBaseName;      //rohs4279 mar/2016 req. PMO151201
  qNac.SessionName                               := Persona.SessionName;       //rohs4279 mar/2016 req. PMO151201
  qRes.DatabaseName                              := Persona.DataBaseName;      //rohs4279 mar/2016 req. PMO151201
  qRes.SessionName                               := Persona.SessionName;       //rohs4279 mar/2016 req. PMO151201
  
{  if Persona.Id_Persona.AsString = Emptystr then                               //rohs4279 mar/2016 req. PMO151201
    tabNacRes.TabVisible                         := False                      //rohs4279 mar/2016 req. PMO151201
  else Begin
    rgPerJuridicaClick(sender);
    tabNacRes.TabVisible := True;
    RefrescaGridNac;
  end;}
end;//procedure

procedure TWPersona.FormHide(Sender : TObject);
begin
  {if PobResidencia <> nil then PobResidencia.Free; PobResidencia := nil;
   if PobNacionalidad <> nil then PobNacionalidad.Free; PobNacionalidad := nil;}
end;//procedure

procedure TWPersona.FormDestroy(Sender : TObject);
begin
  Persona.Id_Persona.Control                     := nil;
  Persona.Id_Domicilio.Control                   := nil;
  Persona.Id_Dom_Fiscal.Control                  := nil; // CZR 03-jun-2009
  Persona.Cve_Residencia.Control                 := nil;
  Persona.Cve_Nacionalidad.Control               := nil;
  Persona.PobNacionalidad.Desc_Poblacion.Control := nil;
  Persona.PobResidencia.Desc_Poblacion.Control   := nil;

  // CZR 19-nov-2014
  Persona.PaisExpedicion.Cve_Poblacion.Control   := nil;
  Persona.PaisExpedicion.Desc_Poblacion.Control  := nil;

  //Persona.PerFueIng.Desc_Fuente_Ingr.Control   := nil;
  Persona.ProfeOfic.Desc_Profesion.Control       := nil;
  Persona.PerEmpLab.Nombre.Control               := nil;
  Persona.PerRanIng.Monto_Maximo.Control         := nil;
  Persona.Cve_Per_Juridica.Control               := nil;
  Persona.F_Alta.Control                         := nil;
  Persona.F_Baja.Control                         := nil;
  Persona.Sit_Persona.Control                    := nil;
  Persona.Telef_Casa.Control                     := nil;
  Persona.Telef_Fax.Control                      := nil;
  Persona.Telef_Oficina.Control                  := nil;
  Persona.Telef_Cel.Control                      := nil;
  Persona.Cve_Tipo_Sector.Control                := nil;
  Persona.Nombre.Control                         := nil;
  Persona.Fh_Modificacion.Control                := nil;
  Persona.Cve_Usuar_Modif.Control                := nil;
  Persona.E_Mail.Control                         := nil;
  //Persona.Id_Fuente_Ingr.Control               := nil;
  Persona.Cve_Activ_Cto.Control                  := nil;
  Persona.FEA.Control                            := nil;
  Persona.Apellido_Paterno.Control               := nil;
  Persona.Apellido_Materno.Control               := nil;
  Persona.Nombre_Persona.Control                 := nil;
  Persona.Cve_Actividad_Pf.Control               := nil;
  Persona.Cve_Estado_Civil.Control               := nil;
  Persona.Cve_Rama_Pf.Control                    := nil;
  Persona.Cve_Sexo.Control                       := nil;
  Persona.F_Nacimiento.Control                   := nil;
  Persona.Cve_Edo_Nacim.Control                  := nil;
  Persona.Cve_Pais_Nacim.Control                 := nil;
  Persona.Curp.Control                           := nil;
  Persona.B_Activ_Empresa.Control                := nil;
  Persona.Id_Profesion.Control                   := nil;
  Persona.Id_Emp_Labora.Control                  := nil;
  Persona.Puesto_Empresa.Control                 := nil;
  Persona.Ano_Antig_Empr.Control                 := nil;
  Persona.Mes_Antig_Empr.Control                 := nil;
  Persona.B_PEPS.Control                         := nil;
//  Persona.ID_GPO_ING_MENS.Control              := nil; //ERROR, QUITAR ANTES DE LIBERAR
  Persona.Id_Rango_Ingreso.Control               := nil;
  Persona.Nombre_Emp_Pf.Control                  := nil;
  Persona.Domicilio.Control                      := nil;
  Persona.DomicilioEmp_Pf.Control                := nil;
  Persona.Desc_DomPF.Control                     := nil;
  Persona.Cve_Rama_Activ.Control                 := nil;
  Persona.Cve_Sub_Rama_Ac.Control                := nil;
  Persona.Cve_Tipo_SectorPM.Control              := nil;
  Persona.F_Contstitucion.Control                := nil;
  Persona.Nom_Razon_Social.Control               := nil;
  Persona.Num_Tot_Acciones.Control               := nil; // CZR 16-oct-2013   Numero Total de Acciones
  Persona.Siglas_RFC.Control                     := nil;
  Persona.F_RFC.Control                          := nil;
  Persona.Homoclave_RFC.Control                  := nil;
  Persona.CalleNumero.Control                    := nil;
  Persona.CaNum_Fiscal.Control                   := nil;// CZR 03-JUNIO-2009
  Persona.B_Captura_Aseg                         := nil;
  Persona.Siti.DESC_ACTIV_ECON.Control           := nil;
  Persona.Siti.MasterSourceEditControl           := nil;

  With Persona.Actividad do Begin
    Cve_Activ_SITI.Control                       := nil;
    ActividadSITI.DESC_ACTIV_ECON.Control        := nil;
    TipoCliente.CveSeccion.Control               := nil;
    TipoCliente.DESC_ACTIVIDAD.Control           := nil;
    Residencia.CveSeccion.Control                := nil;
    Residencia.DESC_ACTIVIDAD.Control            := nil;
    TipoSector.CveSeccion.Control                := nil;
    TipoSector.DESC_ACTIVIDAD.Control            := nil;
    Sector.CveSeccion.Control                    := nil;
    Sector.DESC_ACTIVIDAD.Control                := nil;
    SubSector.CveSeccion.Control                 := nil;
    SubSector.DESC_ACTIVIDAD.Control             := nil;
    Rama.CveSeccion.Control                      := nil;
    Rama.DESC_ACTIVIDAD.Control                  := nil;
    SubRama.CveSeccion.Control                   := nil;
    SubRama.DESC_ACTIVIDAD.Control               := nil;
    Inciso.CveSeccion.Control                    := nil;
    Inciso.DESC_ACTIVIDAD.Control                := nil;
  end;

  // CZR 17-mar-2010
  Persona.Cve_Motivo.Control                     := nil;
  Persona.Desc_Motivo.Control                    := nil;
  Persona.Tx_Motivo.Control                      := nil;

  Persona.B_Aviso_Priv.Control                   := nil; // CZR 07-ago-2013
  Persona.B_EXPEDIENTE.Control                   := nil;
  Persona.ITIN.Control                           := nil; // CZR 07-oct-2013
  Persona.No_Id_Fiscal_Ext.Control               := nil; // CZR 19-nov-2014
  Persona.GIIN.Control                           := nil; // CZR 19-nov-2014
  Persona.CONDUSEF.Control                       := nil; // CZR 19-nov-2014

  Persona.plvFteIngreso                          := nil;
  // CZR 07-ago-2013
  Persona.ppgPestanias                           := nil;
  Persona.ptabAvisoPriv                          := nil;
  Persona.plEmpleado                             := nil;
  // CZR 07-oct-2013
  Persona.plITIN                                 := nil;
  Persona.pmeITIN                                := nil;
  // CZR 14-oct-2013
  Persona.plvTelefonos                           := nil;
  Persona.pieNumTotAcc                           := nil;
  // CZR 26-ago-2014
  Persona.plNivelRiesgo                          := nil;
  Persona.pEdNivelRiesgo                         := nil;
  // CZR 19-nov-2014
  Persona.plNoIdFiscalExt                        := nil;
  Persona.peNoIdFiscalExt                        := nil;
  Persona.plCvePaisExp                           := nil;
  Persona.peCvePaisExp                           := nil;
  Persona.psbCvePaisExp                          := nil;
  Persona.peDescPaisExp                          := nil;
end;//procedure

procedure TWPersona.FormClose(Sender : TObject; var Action : TCloseAction);
begin
  Action := caFree;
end;//procedure

procedure TWPersona.InterForma1DespuesNuevo(Sender : TObject);
begin
  PgCtrl.ActivePage            := TabSheet2;
  PgCtrl.ActivePage            := TabSheet1;
  Persona.Sit_Persona.AsString := 'AC';
  edModifica.Text              := 'F';
  case Persona.FilterBy of
    fbTPersonaMoral : begin
      Persona.Cve_Per_Juridica.AsString := 'PM';
      edCvePerJuridica.Text             := 'PM';
      edNomRazonSocial.Enabled          := True;
      edNomRazonSocial.SetFocus;
    end;//case
    else begin
      Persona.Cve_Per_Juridica.AsString := 'PF';
      edCvePerJuridica.Text             := 'PF';
      edNombrePersona.Enabled           := True;
      edApellidoPaterno.Enabled         := True;                               //rohs4279 mar/2016 req. PM=151201
      edApellidoMaterno.Enabled         := True;                               //rohs4279 mar/2016 req. PM=151201
      edSiglasRFC.Enabled               := True;                               //rohs4279 mar/2016 req. PM=151201
      edFRFC.Enabled                    := True;                               //rohs4279 mar/2016 req. PM=151201
      edHomoclaveRFC.Enabled            := True;                               //rohs4279 mar/2016 req. PM=151201
      edNombrePersona.SetFocus;
    end;
  end;
  LimpiaCurp;
  Persona.PobNacionalidad.FindKey(['PAMEXI']);
  Persona.PobResidencia.FindKey(['PAMEXI']);
  Persona.F_Alta.AsDateTime          := Date;
  Persona.FH_Modificacion.AsDateTime := Now;
  Persona.Cve_Usuar_Modif.AsString   := Persona.DameUsuario;
  Persona.Cve_Tipo_Sector.AsString   := '32';
  Persona.SitPersonaAnt              := 'AC';  // CZR 17-mar-2010
  Persona.plvFteIngreso.Items.Clear;

  rgPerJuridicaClick(Sender); // CZR 07-ago-2013
//  Persona.VisFiscalUbicacionExt(True, False); // CZR 07-oct-2013             //rohs4279 mar/2016 req. PMO151201
  Persona.DespuesLocaliza(Sender); // CZR 14-oct-2013
  Persona.Visibilidad_NivelRiesgo(False, False); // CZR 26-ago-2014
  qNac.Close;                                                                  //rohs4279 mar/2016 req. PMO151201
  qRes.Close;                                                                  //rohs4279 mar/2016 req. PMO151201
  tabNacRes.TabVisible := False;                                               //rohs4279 mar/2016 req. PMO151201
end;//procedure

procedure TWPersona.cbCveTipoSectorChange(Sender: TObject);
begin
  cbCveTipoSector2.ItemIndex := cbCveTipoSector.ItemIndex;
end;//procedure

procedure TWPersona.cbCveTipoSector2Change(Sender: TObject);
begin
  cbCveTipoSector.ItemIndex := cbCveTipoSector2.ItemIndex;
end;//procedure

procedure TWPersona.cbCveSexoChange(Sender: TObject);
begin
  cbCveSexo2.ItemIndex := cbCveSexo.ItemIndex;
end;//procedure

procedure TWPersona.cbCveSexo2Chnage(Sender: TObject);
begin
  cbCveSexo.ItemIndex := cbCveSexo2.ItemIndex;
end;//procedure

procedure TWPersona.cbCveEstadoCivil2Change(Sender: TObject);
begin
  cbCveEstadoCivil.ItemIndex := cbCveEstadoCivil2.ItemIndex;
end;//procedure

procedure TWPersona.cbCveEstadoCivilChange(Sender: TObject);
begin
  cbCveEstadoCivil2.ItemIndex := cbCveEstadoCivil.ItemIndex;
end;//procedure

procedure TWPersona.cbCveRamaPFChange(Sender: TObject);
begin
  cbCveRamaPF2.ItemIndex := cbCveRamaPF.ItemIndex;
  LlenaActPF(cbCveRamaPF2.ItemIndex);
end;//procedure

procedure TWPersona.cbCveRamaPF2Change(Sender: TObject);
begin
  cbCveRamaPF.ItemIndex := cbCveRamaPF2.ItemIndex;
  LlenaActPF(cbCveRamaPF2.ItemIndex);
end;//procedure

procedure TWPersona.cbCveRamaActivChange(Sender: TObject);
begin
  cbCveRamaActiv2.ItemIndex := cbCveRamaActiv.ItemIndex;
  LlenaSubActPM(cbCveTipoSectorPM.ItemIndex+1,cbCveRamaActiv.ItemIndex+1);
end;//procedure

procedure TWPersona.cbCveRamaActiv2Change(Sender: TObject);
begin
  cbCveRamaActiv.ItemIndex := cbCveRamaActiv2.ItemIndex;
  LlenaSubActPM(cbCveTipoSectorPM.ItemIndex+1,cbCveRamaActiv.ItemIndex+1);
end;//procedure

procedure TWPersona.edCvePerJuridicaChange(Sender: TObject);
var vVisiblePM : Boolean;

begin
  vVisiblePM              := (edCvePerJuridica.Text = 'PM');
  gbNombre2.Visible       := vVisiblePM;
  gbNombre.Visible        := Not vVisiblePM;
  gbOtros2.Visible        := vVisiblePM;
  gbOtros.Visible         := Not vVisiblePM;
  gbGIIN.Visible          := vVisiblePM; // CZR 21-nov-2014
  gbCONDUSEF.Visible      := vVisiblePM; // CZR 21-nov-2014
  bbRefPersonales.Enabled := Not vVisiblePM;
  bbAsociaciones.Enabled  := vVisiblePM;
  btnAccionista.Enabled   := vVisiblePM;
  bbInfEmpresa.Enabled    := ((vVisiblePM) or (chbB_Activ_Empresa.Checked));
  rgPerJuridica.ItemIndex := Byte(vVisiblePM); // Valores de Byte(vVisiblePM) "0=False 1=True"
  Refresh;
end;//procedure

procedure TWPersona.rgPerJuridicaClick(Sender: TObject);
const ValX:Array[-1..1] of String = ('','PF','PM');

begin
  {MAGV 201607 Se deshabilita el botón de Personalidad Jurídica que no se utiliza}
  {
  case Persona.FilterBy of
    fbTPersonaFisica : rgPerJuridica.ItemIndex := 0;
    fbTPersonaMoral  : rgPerJuridica.ItemIndex := 1;
  end;
  }
  if Persona.FilterBy = fbTPersonaFisica then
  begin
    rgPerJuridica.ItemIndex := 0;
    rgPerJuridica.Controls[1].Enabled  := False
  end
  else if Persona.FilterBy = fbTPersonaMoral then
  begin
    rgPerJuridica.ItemIndex := 1;
    rgPerJuridica.Controls[0].Enabled  := False
  end;


  Persona.Cve_Per_Juridica.AsString := ValX[rgPerJuridica.ItemIndex];
  if(InterForma1.CanEdit) and (Persona.Modo = moAppend) then begin
    if Persona.Cve_Per_Juridica.AsString = 'PF' then
      Persona.Cve_Tipo_Sector.AsString := '32'
    else
      Persona.Cve_Tipo_Sector.AsString := '31';
  end;//if
  GroupBoxEmpresa;

  if rgPerJuridica.ItemIndex <> 0 then  // Persona Moral
    gbIngresos.Caption := ' Ingresos mensuales '
  else                                 // Persona Fisica
    gbIngresos.Caption := ' Principal Fuente de Ingresos ';

  // CZR 07-ago-2013
  if trim(Persona.Cve_Per_Juridica.AsString) = cPerFisica then
    Persona.ptabAvisoPriv.PageControl := Persona.ppgPestanias
  else
    Persona.ptabAvisoPriv.PageControl := nil;
  // CZR 16-oct-2013
  Persona.pieNumTotAcc.Enabled := (trim(Persona.Cve_Per_Juridica.AsString) = cPerMoral);
  if trim(Persona.Cve_Per_Juridica.AsString) = cPerMoral then Begin
    Persona.pieNumTotAcc.Color := clWindow;
    Llena_combos_fatcacrs_tipopersona(cPerMoral);                              //rohs4279 feb/2016 req. PMO151201
  end
  else Begin
    Persona.pieNumTotAcc.Color := clBtnFace;
    Llena_combos_fatcacrs_tipopersona(cPerFisica);                             //rohs4279 feb/2016 req. PMO151201
  end;
  PgCtrl.ActivePage := TabSheet1;                                              //rohs4279 feb/2016 req. PMO151201
end;//procedure

procedure TWPersona.edSitPersonaChange(Sender: TObject);
var sSQL:    String;
    Qry:   TQuery;

begin
  if (Trim(edSitPersona.Text) <> 'LD'  ) AND (Trim(edSitPersona.Text) <> 'RE') then begin
    rgSitPersona.ItemIndex := Byte(Trim(edSitPersona.Text) = 'IN');
    {IF Trim(edSitPersona.Text) = 'IN' THEN
       rgSitPersona.ItemIndex := 0;
    IF  Trim(edSitPersona.Text) = 'AC' THEN
       rgSitPersona.ItemIndex := 1;
    IF  Trim(edSitPersona.Text) = 'RE' THEN
       rgSitPersona.ItemIndex := 2;
     }

    if Not InterForma1.CanEdit then
      exit;
    if rgSitPersona.ItemIndex = 1 then begin
      edFBaja.Text := FormatDateTime('DD/MM/YYYY',Date);
      edFBaja.Enabled := True;
      edFBaja.Color := clWindow;
      DateTimePicker2.Enabled := True;
    end//if
    else begin
      edFBaja.Text := '';
      edFBaja.Enabled := False;
      edFBaja.Color := clBtnFace;
      DateTimePicker2.Enabled := False;
    end;//else
  end
  else begin
    if (Trim(edSitPersona.Text) <> 'RE') then begin
      rgSitPersona.ItemIndex := -1;
      rgSitPersona.Enabled := False;

      sSQL := 'SELECT NVL(B_PEPS,''F'') AS PEPS FROM PERSONA_FISICA WHERE ID_PERSONA = ' +   Persona.iD_persona.AsString;
      try
        Qry := GetSQLQuery( sSQL , Persona.Apli.DataBaseName, Persona.Apli.SessionName, False);

        if Qry <> nil then begin
          while not Qry.eof do begin
            if Qry.FieldByName('PEPS').AsString = 'V' then
              MessageDlg( 'LA PERSONA HA SIDO IDENTIFICADO COMO PERSONA POLITICAMENTE EXPUESTA (PEP).' + chr(13) +
                          'SE ENCUENTRA EN PROCESO DE VALIDACIÓN POR PARTE DE PREVENCIÓN DE LAVADO DE DINERO, ' +
                          'EL TIEMPO APROXIMADO DE RESPUESTA ES DE 90 MINUTOS.', mtWarning, [mbOk], 0)
            else
              MessageDlg( 'LA PERSONA SE ENCUENTRA EN UN PROCESO DE VALIDACIÓN POR PARTE DE LA OFICIALÍA DE CUMPLIMIENTO.' +
                          chr(13) + 'EL TIEMPO APROXIMADO DE RESPUESTA ES DE 90 MINUTOS.', mtWarning, [mbOk], 0);

            Qry.Next;
          end;
        end
        else
          MessageDlg( 'LA PERSONA SE ENCUENTRA EN UN PROCESO DE VALIDACIÓN POR PARTE DE LA OFICIALÍA DE CUMPLIMIENTO.' + chr(13) + 'EL TIEMPO APROXIMADO DE RESPUESTA ES DE 90 MINUTOS.', mtWarning, [mbOk], 0);
      finally
        if Qry <> nil then
          Qry.Free;
      end;
    end
    else begin
      edSitPersona.Text := 'RE';
      rgSitPersona.ItemIndex := 2;
    end
  end;
end;//procedure

procedure TWPersona.rgSitPersonaClick(Sender: TObject);
Const ValX:Array[-1..2] of String = ('','AC','IN','RE');

var TabCtrl : TTabSheet;   // CZR 17-Marzo-2010

begin
  edSitPersona.Text := ValX[rgSitPersona.ItemIndex];;

  if Not InterForma1.CanEdit then
    exit;
  if rgSitPersona.ItemIndex = 1 then begin
    edFBaja.Text := FormatDateTime('DD/MM/YYYY',Date);
    edFBaja.Enabled := True;
    edFBaja.Color := clWindow;
    DateTimePicker2.Enabled := True;
  end//if
  else begin
    edFBaja.Text := '';
    edFBaja.Enabled := False;
    edFBaja.Color := clBtnFace;
    DateTimePicker2.Enabled := False;
  end;//else

  // CZR 17-Marzo-2010
  if (Persona.Modo = moAppend) or (Persona.Modo = moEdit) then begin
    Persona.Motivo.Active        := False;
    Persona.Cve_Motivo.AsString  := '';
    Persona.Desc_Motivo.AsString := '';
    Persona.Tx_Motivo.AsString   := '';

    if (Persona.SitPersonaAnt <> Persona.Sit_Persona.ComboDatos.Strings[rgSitPersona.ItemIndex]) then
      tabMotivo.PageControl := PgCtrl
    else begin
      TabCtrl               := PgCtrl.ActivePage;
      tabMotivo.PageControl := nil;
      if TabCtrl <> tabMotivo then
        PgCtrl.ActivePageIndex := TabCtrl.TabIndex;
      TabCtrl:= nil;
    end;
    case rgSitPersona.ItemIndex of
      0 : tabMotivo.Caption := 'Motivo de Reactivación';
      1 : tabMotivo.Caption := 'Motivo de Inactivación';
    end;
  end
end;//procedure

procedure TWPersona.SpeedButton1Click(Sender: TObject);
var Dom : TDomicilio;

begin
  If Persona.ValidaAccesoEsp('PF_DOMPER',True,True) Then Begin
    Dom := TDomicilio.Create(Persona);
    Dom.GetParams(Persona);
    try
      if Dom.Busca then begin
        Persona.Id_Domicilio.AsInteger := Dom.IdDomicilio.AsInteger;
        Persona.CalleNumero.AsString   := Dom.CalleNumero.AsString;

        // CZR 08-JUNIO-2009     Asignar la informacion del domicilio personal al fiscal, cuando en este ultimo no se halla seleccionado nada.
        if Persona.Id_Dom_Fiscal.AsInteger = 0 then begin
          Persona.Id_Dom_Fiscal.AsInteger := Dom.IdDomicilio.AsInteger;
          Persona.CaNum_Fiscal.AsString   := Dom.CalleNumero.AsString;
        end;
      end;//if
    finally
      Dom.Free;
    end;//try & finally
  End;
end;//procedure

procedure TWPersona.SpeedButton4Click(Sender: TObject);
var Dom: TDomicilio;

begin
  If Persona.ValidaAccesoEsp('PF_DOMFIS',True,True) Then Begin
    // CZR 03-JUNIO-2009     Busqueda de Domicilio Fiscal
    Dom := TDomicilio.Create(Persona);
    Dom.GetParams(Persona);
    try
      if Dom.Busca then begin
        Persona.Id_Dom_Fiscal.AsInteger := Dom.IdDomicilio.AsInteger;
        Persona.CaNum_Fiscal.AsString   := Dom.CalleNumero.AsString;
      end;
    finally
      Dom.Free;
    end;
  End;
end;

procedure TWPersona.SpeedButton2Click(Sender: TObject);
begin
  If Persona.ValidaAccesoEsp('PF_CVEUBICA',True,True) Then Begin
    if Persona.PobNacionalidad.Busca then begin
      Persona.Cve_Nacionalidad.AsString := Persona.PobNacionalidad.Cve_Poblacion.AsString;
      Persona.Nacionalidad.AsString := Persona.PobNacionalidad.Desc_Poblacion.AsString;
    end;//if
  End;
end;//procedure

procedure TWPersona.SpeedButton3Click(Sender: TObject);
begin
  If Persona.ValidaAccesoEsp('PF_CVERESIDEN',True,True) Then Begin
    if Persona.PobResidencia.Busca then begin
      Persona.Cve_Residencia.AsString := Persona.PobResidencia.Cve_Poblacion.AsString;
      Persona.Residencia.AsString := Persona.PobResidencia.Desc_Poblacion.AsString;
    end;//if
  End;
end;//procedure

procedure TWPersona.sbFuenteIngrClick(Sender: TObject);
begin
  {*If Persona.ValidaAccesoEsp('PF_FTEING',True,True) Then
  Begin
    if Persona.PerFueIng.Busca then
    begin
       Persona.Id_Fuente_Ingr.AsString := Persona.PerFueIng.Id_Fuente_Ingr.AsString;
    end;//if
  End;*}
end;

procedure TWPersona.spRangoIngresosClick(Sender: TObject);
begin
  If Persona.ValidaAccesoEsp('PF_RGOING',True,True) Then Begin
    if Persona.PerRanIng.Busca then begin
      Persona.Id_Rango_Ingreso.AsString := Persona.PerRanIng.Id_Rango_Ingreso.AsString;
    end;//if
  End;
end;

procedure TWPersona.spProfesionClick(Sender: TObject);
begin
  If Persona.ValidaAccesoEsp('PF_PROF',True,True) Then Begin
    if Persona.ProfeOfic.Busca then begin
      Persona.Id_Profesion.AsString := Persona.ProfeOfic.Id_Profesion.AsString;
    end;//if
  End;
end;

procedure TWPersona.sbEmpresaLaboraClick(Sender: TObject);
begin
  If Persona.ValidaAccesoEsp('PF_EMPLAB',True,True) Then Begin
    if Persona.PerEmpLab.Busca then begin
      Persona.Id_Emp_Labora.AsInteger := Persona.PerEmpLab.Id_Emp_Labora.AsInteger;
    end;//if
  End;
end;

procedure TWPersona.LlenaActPF(Numero:Integer);
Const ActPF : Array[0..5,0..11] of String  = (('01 COMERCIAL','02 INDUSTRIAL','03 AGRICOLA','04 GANADERO','05 PESQUERO',
                                               '06 SILVICOLA','07 SERVICIOS','','','','',''),
                                              ('01 PROFESIONISTA','02 FUNCIONARIO PUBLICO','03 AGENTE CORREDOR',
                                               '04 AMA DE CASA','05 VIUDO(A)','06 JUBILADO(A)','07 RELIGIOSO(A)',
                                               '08 ESTUDIANTE','09 ARTISTA O DEPORTISTA','10 SIN ACTIVIDAD ECONOMICA',
                                               '11 SUCESIONES TESTAMENTARIAS','12 OTROS'),
                                              ('01 COMERCIAL','02 INDUSTRIAL','03 AGRICOLA','04 GANADERO','05 PESQUERO',
                                               '06 SILVICOLA','07 SERVICIOS','','','','',''),
                                              ('01 OTRO','','','','','','','','','','',''),
                                              ('01 OTRO','','','','','','','','','','',''),
                                              ('01 OTRO','','','','','','','','','','',''));
var i : Integer;

begin
  cbCveActividadPF2.Items.Clear;
  cbCveActividadPF2.Text := '';
  if Numero in [0..5]  then
    for i := 0 to 11 do begin
      if ActPF[Numero,i] <> '' then begin
        cbCveActividadPF2.Items.Add(ActPF[Numero,i]);
      end;//if
    end;
  cbCveActividadPF.ItemIndex  := cbCveActividadPF.Items.IndexOf(Persona.Cve_Actividad_Pf.AsString);
  cbCveActividadPF2.ItemIndex := cbCveActividadPF.ItemIndex;
end;//procedure

procedure TWPersona.LlenaActPM(Numero:Integer);
Const ActPM : Array[0..3,0..10] of String  = (('01 SOCIEDAD ANONIMA','02 ASOCIACION','03 SOCIEDAD CIVIL','','','','','','','',''),
                                              ('01 GOBIERNO FEDERAL','02 DEPARTAMENTO DEL D.F.','03 GOBIERNOS ESTATALES Y MUNICIPALES',
                                               '04 ORGANISMOS DESCENTRALIZADOS','05 EMPRESAS DE PARTICIPACION ESTATAL',
                                               '06 OTRAS ENTIDADES FINANCIERAS PUBLICAS','07 BANCA DE DESARROLLO',
                                               '08 BANCO DE MEXICO','','',''),
                                              ('01 EMPRESAS FINANCIERAS NO BANCARIAS','02 BANCA COMERCIAL','03 BANCA DE DESARROLLO',
                                               '04 SOCIEDADES DE INVIERSION','','','','','','',''),
                                              ('01 EMPRESAS PRIVADAS','02 EMPRESAS PUBLICAS','','','','','','','','',''));
var i : Integer;

begin
  cbCveRamaActiv2.Items.Clear;
  cbCveRamaActiv2.Text := '';
  if Numero in [0..3]  then
    for i := 0 to 10 do begin
      if ActPM[Numero,i] <> '' then begin
        cbCveRamaActiv2.Items.Add(ActPM[Numero,i]);
      end;//if
    end;//for
  cbCveRamaActiv.ItemIndex  := cbCveRamaActiv.Items.IndexOf(cbCveRamaActiv.Text);
  cbCveRamaActiv2.ItemIndex := cbCveRamaActiv.ItemIndex;
  LlenaSubActPM(Numero + 1, cbCveRamaActiv2.ItemIndex + 1);
end;//procedure

procedure TWPersona.LlenaSubActPM(Rama,SubRama:Integer);
Const ActPMd : Array[0..31,0..2] of String  = (('01','01','01 EMP. GRANDE'),
                                               ('01','01','02 EMP. MEDIANA'),
                                               ('01','01','03 EMP. PEQUEÑA'),
                                               ('01','01','04 EMP. HOLDING'),

                                               ('03','01','01 ASEGURADORA'),
                                               ('03','01','02 AFIANZADORA'),
                                               ('03','01','03 ARRendADORA'),
                                               ('03','01','04 ALMACENADORA'),
                                               ('03','01','05 CASA DE CAMBIO'),
                                               ('03','01','06 FACTORING'),
                                               ('03','01','07 CASA DE BOLSA'),
                                               ('03','01','08 UNION DE CREDITO'),
                                               ('03','01','09 SOCIEDAD OPERADORA DE SOC. DE INVERSION'),
                                               ('03','01','10 OTROS'),

                                               ('03','02','01 PROPIOS'),
                                               ('03','02','02 POR TERCEROS(PERSONAS FISICAS)'),
                                               ('03','02','03 POR TERCEROS(PERSONAS MORALES)'),

                                               ('03','03','01 OTROS'),

                                               ('03','04','01 SOCIEDAD DE INVERSION DE CAPITAL'),
                                               ('03','04','02 SOCIEDAD DE INVERSION DE DEUDA(PERSONAS FISICAS)'),
                                               ('03','04','03 SOCIEDAD DE INVERSION DE DEUDA(PERSONAS MORALES)'),
                                               ('03','04','04 SOCIEDAD DE INVERSION DE COMUN'),

                                               ('04','01','01 FONDOS O CAJAS DE AHORRO'),
                                               ('04','01','02 FONDOS DE PENSIONES JUBILACIONES'),
                                               ('04','01','03 FONDOS DE PREVISION SOCIAL'),
                                               ('04','01','04 FIDUCIARIOS(PERSONAS FISICAS)'),
                                               ('04','01','05 FIDUCIARIOS(PERSONAS MORALES)'),

                                               ('04','02','01 FONDOS O CAJAS DE AHORRO'),
                                               ('04','02','02 FONDOS DE PENSIONES JUBILACIONES'),
                                               ('04','02','03 FONDOS DE PREVISION SOCIAL'),
                                               ('04','02','04 FIDUCIARIOS(PERSONAS FISICAS)'),
                                               ('04','02','05 FIDUCIARIOS(PERSONAS MORALES)'));
var i  : Integer;
    S1,
    S2 : String;

begin
  S1 := IntToStr(Rama);
  if Length(S1) <= 1 then
    S1 := '0' + S1;
  S2 := IntToStr(SubRama);
  if Length(S2) <= 1 then
    S2 := '0' + S2;
  cbCveSubRamaAC2.Items.Clear; cbCveSubRamaAC2.Text := '';
  for i := 0 to 31 do begin
    if (ActPMd[i,0] = S1) and (ActPMd[i,1] = S2) then begin
      cbCveSubRamaAC2.Items.Add(ActPMd[i,2]);
    end;//if
  end;//for
  cbCveSubRamaAC.ItemIndex  := cbCveSubRamaAC.Items.IndexOf(cbCveSubRamaAC.Text);
  cbCveSubRamaAC2.ItemIndex := cbCveSubRamaAC.ItemIndex;
  cbCveSubRamaAC.ItemIndex  := cbCveSubRamaAC2.ItemIndex;
end;//procedure

procedure TWPersona.cbCveActividadPF2Change(Sender: TObject);
begin
  cbCveActividadPF.ItemIndex := cbCveActividadPF2.ItemIndex;
end;//procedure

procedure TWPersona.cbCveActividadPFChange(Sender: TObject);
begin
  cbCveActividadPF2.ItemIndex := cbCveActividadPF.ItemIndex;
end;//procedure

procedure TWPersona.cbCveSubRamaACChange(Sender: TObject);
begin
  cbCveSubRamaAC2.ItemIndex := cbCveSubRamaAC.ItemIndex;
end;//procdure

procedure TWPersona.cbCveSubRamaAC2Change(Sender: TObject);
begin
  cbCveSubRamaAC.ItemIndex := cbCveSubRamaAC2.ItemIndex;
  Persona.cve_Sub_Rama_Ac.asString := cbCveSubRamaAC.Text;
end;//procedure

procedure TWPersona.cbCveTipoSectorPM2Change(Sender: TObject);
begin
  cbCveTipoSectorPM.ItemIndex := cbCveTipoSectorPM2.ItemIndex;
  LlenaActPM(cbCveTipoSectorPM.ItemIndex);
end;//procedure

procedure TWPersona.cbCveTipoSectorPMChange(Sender: TObject);
begin
  cbCveTipoSectorPM2.ItemIndex := cbCveTipoSectorPM.ItemIndex;
  LlenaActPM(cbCveTipoSectorPM.ItemIndex);
end;//procedure

procedure TWPersona.DateTimePicker1CloseUp(Sender: TObject);
begin
  edFAlta.Text := FormatDateTime('DD/MM/YYYY',DateTimePicker1.Date);
end;//procedure

procedure TWPersona.DateTimePicker1Enter(Sender: TObject);
begin
  try
    DateTimePicker1.Date := StrToDate(edFAlta.Text);
  except
    DateTimePicker1.Date := Now;
  end;//try & except
end;//procedure

procedure TWPersona.DateTimePicker2Enter(Sender: TObject);
begin
  try
    DateTimePicker2.Date := StrToDate(edFBaja.Text);
  except
    DateTimePicker2.Date := Now;
  end;//try & except
end;//procedure

procedure TWPersona.DateTimePicker2CloseUp(Sender: TObject);
begin edFBaja.Text := FormatDateTime('DD/MM/YYYY',DateTimePicker2.Date);
end;

procedure TWPersona.DateTimePicker3Enter(Sender: TObject);
begin
  try
    DateTimePicker3.Date := StrToDate(meFNacimiento.Text);
  except
    DateTimePicker3.Date := Now;
  end;//try & except
end;//procedure

procedure TWPersona.DateTimePicker3CloseUp(Sender: TObject);
begin
  meFNacimiento.Text := FormatDateTime('DD/MM/YYYY',DateTimePicker3.Date);
end;//prtocedure

procedure TWPersona.DateTimePicker4Enter(Sender: TObject);
begin
  try
    DateTimePicker4.Date := StrToDate(edFConstitucion.Text);
  except
    DateTimePicker4.Date := Now;
  end;//try & except
end;//procedure

procedure TWPersona.DateTimePicker4CloseUp(Sender: TObject);
begin
  edFConstitucion.Text := FormatDateTime('DD/MM/YYYY',DateTimePicker4.Date);
end;//procedure

procedure TWPersona.Catlogo1Click(Sender: TObject);
var Dom : TDomicilio;

begin
  Dom := TDomicilio.Create(Persona);
  Dom.GetParams(Persona);
  try
    if edIDDomicilio.Text <> '' then
      Dom.FindKey([edIDDomicilio.Text]);
    Dom.Catalogo;
    if InterForma1.CanEdit then begin
      if Dom.Active then begin
        Persona.Id_Domicilio.AsInteger := Dom.IdDomicilio.AsInteger;
        Persona.CalleNumero.AsString   := Dom.CalleNumero.AsString;
      end;//if
    end;//if
  finally
    Dom.Free;
  end;//try & finally
end;//procedure

procedure TWPersona.CatalogoDomFiscalClick(Sender: TObject);
var Dom : TDomicilio;

begin
  // CZR 03-JUNIO-2009     Catalogo de Domicilio Fiscal
  Dom := TDomicilio.Create(Persona);
  Dom.GetParams(Persona);
  try
    if edIdDom_Fis.Text <> '' then
      Dom.FindKey([edIdDom_Fis.Text]);
    Dom.Catalogo;
    if InterForma1.CanEdit then begin
      if Dom.Active then begin
        Persona.Id_Dom_Fiscal.AsInteger := Dom.IdDomicilio.AsInteger;
        Persona.CaNum_Fiscal.AsString   := Dom.CalleNumero.AsString;
      end;
    end;
  finally
    Dom.Free;
  end;
end;

procedure TWPersona.Catlogo2Click(Sender: TObject);
begin
  if edCveNacionalidad.Text <> '' then
    Persona.PobNacionalidad.FindKey([edCveNacionalidad.Text]);
  Persona.PobNacionalidad.Catalogo;
  if InterForma1.CanEdit then begin
    if (Persona.PobNacionalidad.Active)then begin
      if (Persona.PobNacionalidad.Cve_Tipo_Poblac.AsString = 'PA') then begin
        Persona.Cve_Nacionalidad.AsString := Persona.PobNacionalidad.Cve_Poblacion.AsString;
        Persona.Nacionalidad.AsString := Persona.PobNacionalidad.Desc_Poblacion.AsString;
      end//if
      else
        raise EInterFrame.Create('Debe seleccionar un pais');
    end;//if
  end;//if
end;//procedure

procedure TWPersona.Catlogo3Click(Sender: TObject);
begin
  if edCveResidencia.Text <> '' then
    Persona.PobResidencia.FindKey([edCveResidencia.Text]);
  Persona.PobResidencia.Catalogo;
  if InterForma1.CanEdit then begin
    if Persona.PobResidencia.Active  then begin
      if (Persona.PobResidencia.Cve_Tipo_Poblac.AsString = 'PA') then begin
        Persona.Cve_Residencia.AsString := Persona.PobResidencia.Cve_Poblacion.AsString;
        Persona.Residencia.AsString := Persona.PobResidencia.Desc_Poblacion.AsString;
      end//if
      else
        raise EInterFrame.Create('Debe seleccionar un pais');
    end;//if
  end;//if
end;//procedure

procedure TWPersona.CatalogoFuenteIngrClick(Sender: TObject);
begin
  {*if edIdFuenteIngr.Text <> '' then
      Persona.PerFueIng.FindKey([edIdFuenteIngr.Text]);
  Persona.PerFueIng.Catalogo;
  if InterForma1.CanEdit then begin
     if(Persona.PerFueIng.Active)then begin
       Persona.Id_Fuente_Ingr.AsString := Persona.PerFueIng.Id_Fuente_Ingr.AsString;
     end;//if
  end;//if*}
end;

procedure TWPersona.CatalogoRangoIngresosClick(Sender: TObject);
begin
  if edIdRangoIngreso.Text <> '' then
    Persona.PerRanIng.FindKey([edIdRangoIngreso.Text]);
  Persona.PerRanIng.Catalogo;
  if InterForma1.CanEdit then begin
    if (Persona.PerRanIng.Active)then begin
      Persona.Id_Rango_Ingreso.AsString := Persona.PerRanIng.Id_Rango_Ingreso.AsString;
    end;//if
  end;//if
end;

procedure TWPersona.CatalogoProfesionClick(Sender: TObject);
begin
  if edIdProfesion.Text <> '' then
    Persona.ProfeOfic.FindKey([edIdProfesion.Text]);
  Persona.ProfeOfic.Catalogo;
  if InterForma1.CanEdit then begin
    if (Persona.ProfeOfic.Active)then begin
      Persona.Id_Profesion.AsString := Persona.ProfeOfic.Id_Profesion.AsString;
    end;//if
  end;//if
end;

procedure TWPersona.CatalogoEmpresaClick(Sender: TObject);
begin
  if edIdEmpLabora.Text <> '' then
    Persona.PerEmpLab.FindKey([edIdEmpLabora.Text]);
  Persona.PerEmpLab.Catalogo;
  if InterForma1.CanEdit then begin
    if (Persona.PerEmpLab.Active)then begin
      Persona.Id_Emp_Labora.AsInteger := Persona.PerEmpLab.Id_Emp_Labora.AsInteger;
    end;//if
  end;//if
end;

procedure TWPersona.GeneralpersonasfisicasClick(Sender: TObject);
begin
  Execute_RepPFis2(True, Persona);
end;//procedure

procedure TWPersona.GeneralPersonasMoralesClick(Sender: TObject);
begin
  Execute_RepPMor2(True, Persona);
end;//procedure

procedure TWPersona.DatosPersonaClick(Sender: TObject);
begin
  if (Persona.Id_persona.asstring <> '') then begin
    if (Persona.Cve_Per_Juridica.asString = 'PF') then
      Execute_RepPFis(True, Persona, Persona.Id_persona.asinteger)
    else
      if (Persona.Cve_Per_Juridica.asString = 'PM') and (Persona.Id_persona.asstring <> '') then
        Execute_RepPMor(True, Persona, Persona.Id_persona.asinteger);
  end//if
  else
    raise EInterframe.Create('No ha sido seleccionada una persona para reportar sus datos');
end;//procedure

procedure TWPersona.PersonaMoralClick(Sender: TObject);
begin
  Execute_RepPMor(True, Persona, Persona.Id_persona.asinteger);
end;//procedure

procedure TWPersona.PopUpReportesPopup(Sender: TObject);
begin
  case persona.FilterBy of
    fbTPersonaFisica: begin
                        GeneralPersonasMorales.Visible := False;
                        GeneralPersonasFisicas.Visible := True;
                      end;//case
    fbTPersonaMoral : begin
                        GeneralPersonasMorales.Visible := True;
                        GeneralPersonasFisicas.Visible := False;
                      end;//case
    else begin
       GeneralPersonasMorales.Visible := True;
       GeneralPersonasFisicas.Visible := True;
    end;//else
  end;//case
end;//procedure

procedure TWPersona.BitBtn1Click(Sender: TObject);
begin
  If Persona.ValidaAccesoEsp('PF_REPORT',True,True) Then
  Begin
    Persona.Reporte;
  End;
end;//procedure

procedure TWPersona.CapturaPromotor(pEstado : Boolean); // CZR 05-mar-2013
begin
   EdNombrePersona.Enabled   := True;
   edApellidoPaterno.Enabled := True;
   edApellidoMaterno.Enabled := True;
   cbCveSexo.Enabled         := True;
   cbCveSexo2.Enabled        := True;
   edNomRazonSocial.Enabled  := True;
   edSiglasRFC.Enabled       := True;
   edFRFC.Enabled            := True;
   edHomoclaveRFC.Enabled    := True;
   edIdDom_Fis.Enabled       := True;
   SpeedButton4.Enabled      := True;
   edCaNum_Fiscal.Enabled    := True;
   if trim(Persona.Cve_Per_Juridica.AsString) = 'PF' then
   begin
      EdNombrePersona.Enabled   := pEstado;
      edApellidoPaterno.Enabled := pEstado;
      edApellidoMaterno.Enabled := pEstado;
      cbCveSexo.Enabled         := pEstado;
      cbCveSexo2.Enabled        := pEstado;
   end;
   if trim(Persona.Cve_Per_Juridica.AsString) = 'PM' then
   begin
      edNomRazonSocial.Enabled  := pEstado;
      edSiglasRFC.Enabled       := pEstado;
      edFRFC.Enabled            := pEstado;
      edHomoclaveRFC.Enabled    := pEstado;
      edIdDom_Fis.Enabled       := pEstado;
      SpeedButton4.Enabled      := pEstado;
      edCaNum_Fiscal.Enabled    := pEstado;
   end;
end;

procedure TWPersona.InterForma1DespuesModificar(Sender: TObject);
var
   Qry : TQuery;
begin
   with Persona do
   begin
      Cve_Usuar_Modif.AsString  := DameUsuario;
      edModifica.Text           := 'V';
      SitPersonaAnt             := Sit_Persona.AsString; // CZR 17-mar-2010

      if trim(edSitPersona.Text) = 'LD' then                                         rgSitPersona.ItemIndex := -1;
      if (trim(edSitPersona.Text) = 'RE') or (trim(edSitPersona.Text) = 'LD') then   rgSitPersona.Enabled   := False;

      btnAgregapepsasoc.Visible := chkBPEPS.Checked;
      btnAgregapepsasoc.Enabled := chkBPEPS.Checked;

      // CZR 05-mar-2013   (PLD) Determinar informacion que puede modificar un Promotor
      CapturaPromotor(True);
      try
         Qry := GetSqlQuery('select * '
                          + '  from gpo_contrato '
                          + ' where id_pers_asociad  = ' + IntToStr(DameUsuarioID)
                          + '   and sit_gpo_contrato = ''AC''',
                            SeguDataBaseName, SeguSessionName, True);
         CapturaPromotor(Qry = nil); // Se obtiene de manera inversa para inhabilitar controles
      finally
         if Qry <> nil then
            Qry.Free;
      end;

      DespuesLocaliza(Sender); // CZR 15-oct-2013
//      VisFiscalUbicacionExt(False, True); // CZR 07-oct-2013                 rohs4279 mar/2016 req. PMO151201
   end;
end;//procedure

// Inicia Modificación por SATV4766 el 30 Ago 2006
function TPersona.StpObtSitPersona( peDatabaseName,
                                    peSessionName,
                                    peCVE_PER_JURIDICA,
                                    peAPELLIDO_PAT,
                                    peAPELLIDO_MAT,
                                    peNOMBRE,
                                    peSIGLAS,
                                    peFECHA,
                                    peHOMOCLAVE : String;
                                    var psID_PER_BLOQ : Integer;
                                    var psSIT_ADM_PER_BLOQ : String;
                                    var psRESULTADO       : Integer;
                                    var psTX_RESULTADO    : String
                                  ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := True; psID_PER_BLOQ := -1; psSIT_ADM_PER_BLOQ := '';
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGADMCTA.STP_OBT_SIT_PERSONA';
       DataBaseName   := peDataBaseName;
       SessionName    := peSessionName;
       Params.CreateParam(ftString  ,'peCVE_PER_JURIDICA', ptInput);
       Params.CreateParam(ftString  ,'peAPELLIDO_PAT'    , ptInput);
       Params.CreateParam(ftString  ,'peAPELLIDO_MAT'    , ptInput);
       Params.CreateParam(ftString  ,'peNOMBRE'          , ptInput);
       Params.CreateParam(ftString  ,'peSIGLAS'          , ptInput);
       Params.CreateParam(ftString  ,'peFECHA'           , ptInput);
       Params.CreateParam(ftString  ,'peHOMOCLAVE'       , ptInput);
       Params.CreateParam(ftInteger ,'psID_PER_BLOQ'     , ptOutput);
       Params.CreateParam(ftString  ,'psSIT_ADM_PER_BLOQ', ptOutput);
       Params.CreateParam(ftInteger ,'psRESULTADO'       , ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO'    , ptOutput);
       // Asigna Valores
       ParamByName('peCVE_PER_JURIDICA').AsString  := peCVE_PER_JURIDICA;
       ParamByName('peAPELLIDO_PAT'    ).AsString  := peAPELLIDO_PAT;
       ParamByName('peAPELLIDO_MAT'    ).AsString  := peAPELLIDO_MAT;
       ParamByName('peNOMBRE'          ).AsString  := peNOMBRE;
       ParamByName('peSIGLAS'          ).AsString  := peSIGLAS;
       ParamByName('peFECHA'           ).AsString  := peFECHA;
       ParamByName('peHOMOCLAVE'       ).AsString  := peHOMOCLAVE;
       ExecProc;
       vlbResult := (ParamByName('psRESULTADO').AsInteger = 0);
       If Not vlbResult Then
         MessageDlg(ParamByName('psTX_RESULTADO').AsString, mtError, [mbOk], 0)
       Else
         Begin
         psID_PER_BLOQ := ParamByName('psID_PER_BLOQ').AsInteger;
         psSIT_ADM_PER_BLOQ := ParamByName('psSIT_ADM_PER_BLOQ').AsString;
         End;
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
End;
// Termina Modificación por SATV4766

procedure TWPersona.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
var NumCttos: Integer;
// Inicia Modificación por SATV4766 el 30 Ago 2006
    vlID_PER_BLOQ : Integer;
    vlSIT_ADM_PER_BLOQ : String;
    vlRESULTADO       : Integer;
    vlTX_RESULTADO    : String;
// Termina Modificación por SATV4766

   // CZR 26-mar-2010
   ValDarIds : TValDatIds;
   Qry       : TQuery;

   ValRFC    : TValRFC; // CZR 10-ago-2010
   vITIN     : String;  // CZR 07-oct-2013
   sql       : String;                                                         //rohs4279 mar/2016 req. PMO151201
   qDatos    : TQuery;                                                         //rohs4279 mar/2016 req. PMO151201
   fRfc      : TDateTime;                                                      //rohs4279 mar/2016 req. PMO151201

begin
  Realizado:= False;
  Try
    Persona.GetFromControl;

    { Valida la captura de la Razón Social  }
    If (Persona.Cve_Per_Juridica.AsString = 'PM') and (Trim(edNomRazonSocial.Text) = '') Then
    Begin
      PgCtrl.ActivePageIndex:= 0;
      edNomRazonSocial.SetFocus;
      Raise EInterFrame.Create('Revise que la Razón Social de la Empresa haya sido capturada.');
    end;

    { Validaciones de la Persona Física }
    If (Persona.Cve_Per_Juridica.AsString = 'PF') then
    Begin
      If Trim(edNombrePersona.Text) = '' then
      Begin
        PgCtrl.ActivePageIndex:= 0;
        edNombrePersona.SetFocus;
        Raise EInterFrame.Create('Revise que el Nombre de la persona hayan sido capturado.');
      end;

      If Trim(edApellidoPaterno.Text) = '' Then
      Begin
        PgCtrl.ActivePageIndex:= 0;
        edApellidoPaterno.SetFocus;
        Raise EInterFrame.Create('Revise que el Apellido Paterno de la persona hayan sido capturado.');
      end;

      Persona.Cve_Sexo.GetFromControl;
      If Persona.Cve_Sexo.AsString = '' Then
      Begin
        PgCtrl.ActivePageIndex:= 1;
        cbCveSexo2.SetFocus;
        Raise EInterFrame.Create('Revise que el Genero de la persona haya sido seleccionado.');
      end;

      If IsNewData then
      begin
       Persona.F_Nacimiento.GetFromControl;
       If Persona.F_Nacimiento.AsString = '' Then
       begin
          PgCtrl.ActivePageIndex:= 1;
          meFNacimiento.SetFocus;
          Raise EInterFrame.Create('Revise que la Fecha de Nacimiento de la persona haya sido capturado.');
       end;
      end;

       Persona.Cve_Pais_Nacim.GetFromControl;
       If Persona.Cve_Pais_Nacim.AsString = '' Then
       begin
          PgCtrl.ActivePageIndex:= 1;
          edCvePaisNacim.SetFocus;
          Raise EInterFrame.Create('Revise que la Pais de Nacimiento de la persona haya sido capturado.');
       end;

       {SACA4984 - Marzo 2013}
       Persona.Cve_Edo_Nacim.GetFromControl;
       If Persona.Cve_Edo_Nacim.AsString = '' Then
       begin
          PgCtrl.ActivePageIndex:= 1;
          edLugarNacim.SetFocus;
          Raise EInterFrame.Create('Revise que la Estado de Nacimiento de la persona haya sido capturado.');
       end;

      {SACA4984 - Marzo 2013}
      Persona.Cve_Estado_Civil.GetFromControl;
      If Persona.Cve_Estado_Civil.AsString = '' Then
      Begin
        PgCtrl.ActivePageIndex:= 1;
        cbCveEstadoCivil2.SetFocus;
        Raise EInterFrame.Create('Revise que el Estado Civil de la persona haya sido seleccionado.');
      end;
    end;

    { Validación de la captura de Domicilio }
    Persona.Id_Domicilio.GetFromControl;
    If Persona.Id_Domicilio.AsInteger = 0 Then
    Begin
      PgCtrl.ActivePageIndex:= 1;
      Raise EInterFrame.Create('Revise que el domicilio haya sido capturado.');
    end;

    { Validación de la captura de Domicilio Fiscal   CZR 03-jun-2009 }
    Persona.Id_Dom_Fiscal.GetFromControl;
    If Persona.Id_Dom_Fiscal.AsInteger = 0 Then
    Begin
      PgCtrl.ActivePageIndex:= 1;
      Raise EInterFrame.Create('Revise que el domicilio fiscal haya sido capturado.');
    end;

    { Validación de la captura de telefono (Oficina o Casa) }
    {If (Trim(edTelefOficina.Text) = '') and (Trim(edTelefCasa.Text) = '') then
    Begin
      PgCtrl.ActivePageIndex:= 0;
      edTelefOficina.SetFocus;
      Raise EInterFrame.Create('Revise que el Teléfono de Oficina o de Casa haya sido capturado.');
    end;}

    // CZR 15-oct-2013   Validación de Teléfonos
    if not IsNewData then
    begin
       if Persona.plvTelefonos.Items.Count = 0  then
          raise EInterFrame.Create('Debe capturar al menos un telefono');
    end;

    Persona.Sit_Persona.GetFromControl;
    if Persona.Sit_Persona.AsString = 'RE' then
    Begin
       Raise EInterFrame.Create('La persona no se puede entrar en situacion de rechazo. Verificalo con el area de Oficialia de Cumplimiento.');
    end;
    Persona.Sit_Persona.GetFromControl;
    if Persona.Sit_Persona.AsString = 'LD' then
    Begin
       Raise EInterFrame.Create('La persona no se puede modificar, se encuantra en investigacion. Verificalo con el area de Oficialia de Cumplimiento.');
    end;
    { Validacion de los contratos activos de la persona }
    Persona.Sit_Persona.GetFromControl;
    if Persona.Sit_Persona.AsString = 'IN' then
    Begin
      if(GetSQLInt('Select Count(Id_contrato) NUM_CTTOS from contrato Where Sit_Contrato = ''AC'' and Id_Titular = '+ Persona.Id_Persona.asString,
        Persona.DataBaseName,Persona.SessionName,'NUM_CTTOS',NumCttos,False))and(NumCttos > 0)then
        Raise EInterFrame.Create('La persona no se puede inactivar porque es titular de ' + IntToStr(NumCttos) + ' contratos activos');
    end;

    { Validación actividad economica... solo claves de último nivel }
    If Persona.Actividad.Active Then
    Begin
      if Persona.Actividad.B_PRESENTA.AsString <> 'V' Then
        Raise EInterFrame.Create('Imposible modificar a la persona.' + chr(VK_RETURN) + 'La clave de actividad económica no esta especificada al último nivel');
    end;

    { Validación de la Fecha del RFC }
    if (Trim(edFRFC.Text) <> '') Then               //****************
    Begin
      If Persona.Cve_Per_Juridica.AsString = 'PF' Then
      Begin
        Try
          StrToDate(meFNacimiento.Text);
        Except
          Raise EInterFrame.Create('La fecha del RFC debe coincidir con la Fecha de Nacimiento de la Persona.' +
            chr(VK_RETURN) + 'Verifique que la Fecha de Nacimiento de la persona sea válida.');
        end;

        If FormatDateTime('YYMMDD',StrToDate(meFNacimiento.Text)) <> edFRFC.Text Then
          Raise EInterFrame.Create('Imposible modificar a la persona.' + chr(VK_RETURN) +
            'Revise que la fecha del RFC sea igual a la Fecha de Nacimiento de la Persona');
      end
      Else If Persona.Cve_Per_Juridica.AsString = 'PM' Then
      Begin
        Try
          StrToDate(edFConstitucion.Text);
        Except
          Raise EInterFrame.Create('La fecha del RFC debe coincidir con la Fecha de Constitución de la empresa.' +
            chr(VK_RETURN) + 'Verifique que la Fecha de Constitución de la empresa sea válida.');
        end;

        If FormatDateTime('YYMMDD',StrToDate(edFConstitucion.Text)) <> edFRFC.Text Then
          Raise EInterFrame.Create('Imposible modificar a la persona.' + chr(VK_RETURN) +
            'Revise que la fecha del RFC sea igual a la Fecha de Constitución de la Empresa');
      end;
    end;

    { Valida que la fecha de la curp sea la misma que la fecha de nacimiento }
    If (Persona.Cve_Per_Juridica.AsString = 'PF') and
       (Trim(StringReplace(meFecCurp.Text, '/', '', [rfReplaceAll])) <> '') Then
    Begin
        Try
          StrToDate(meFNacimiento.Text);
        Except
          Raise EInterFrame.Create('La fecha de la CURP debe coincidir con la Fecha de Nacimiento de la Persona.' +
            chr(VK_RETURN) + 'Verifique que la Fecha de Nacimiento de la persona sea válida.');
        end;

        If (FormatDateTime('YY/MM/DD',StrToDate(meFNacimiento.Text)) <> meFecCurp.Text) Then
          Raise EInterFrame.Create('Imposible modificar a la persona.' + chr(VK_RETURN) +
            'Revise que la fecha de la CURP sea igual a la Fecha de Nacimiento de la Persona');
    end;

    // CZR 17-mar-2010   Validaciones en la situacion de la Persona
    if (trim(Persona.SitPersonaAnt) = 'IN') and (trim(Persona.Sit_Persona.ComboDatos.Strings[rgSitPersona.ItemIndex]) = 'AC') then
    begin
       if not GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION = ''CLASE_' + UpperCase(Persona.ClassName) + ''') AND (CVE_USUARIO = ''' + Persona.DameUsuario + ''') and (CVE_OPER_ACC = ''SM'')',
                     Persona.SeguDataBaseName, Persona.SeguSessionName, True) then
          Raise EInterFrame.Create('El usuario no cuenta con permisos para reactivar la situacion');
    end;
    if (Persona.SitPersonaAnt <> Persona.Sit_Persona.ComboDatos.Strings[rgSitPersona.ItemIndex]) then
    begin
       if not Persona.Motivo.Active then
          Raise EInterFrame.Create('Imposible modificar la persona debido a que no ha seleccionado un ' +  tabMotivo.Caption);
       Persona.Cve_Motivo.GetFromControl;
       Persona.Desc_Motivo.GetFromControl;
       Persona.Tx_Motivo.GetFromControl;
    end
    else
    begin
       Persona.Cve_Motivo.AsString  := '';
       Persona.Desc_Motivo.AsString := '';
       Persona.Tx_Motivo.AsString   := '';
    end;

    // CZR 26-Marzo-2010   Validar si existen Personas con semejanza, a la Persona que se dara de Alta
    if (InterForma1.IsNewData) and (trim(Persona.Cve_Per_Juridica.AsString) = 'PF') then
      try
         Persona.GetFromControl;
         ValDarIds        := TValDatIds.Create(Persona);
         ValDarIds.Apli   := Persona.Apli;
         ValDarIds.pResul := ' select per.id_persona, '
                           + '        per.nombre, '
                           + '        (case '
                           + '              when pf.cve_sexo = ''M'' then ''MASCULINO'''
                           + '              when pf.cve_sexo = ''F'' then ''FEMENINO'''
                           + '              else                          ''OTRO'''
                           + '         end) as sexo, '
                           + '        pf.f_nacimiento '
                           + ' from persona per, '
                           + '      persona_fisica pf '
                           + ' where per.sit_persona     = ''AC'''
                           + '   and pf.id_persona       = per.id_persona '
                           + '   and pf.apellido_paterno = ' + Persona.Apellido_Paterno.AsSql
                           + '   and pf.apellido_materno = ' + Persona.Apellido_Materno.AsSql
                           + '   and pf.cve_sexo         = ' + Persona.Cve_Sexo.AsSql
                           + '   and pf.f_nacimiento     = ' + Persona.F_Nacimiento.AsSql;
          Qry := GetSQLQuery(ValDarIds.pResul, Persona.DataBaseName, Persona.SessionName, True);
          if Qry <> nil then
          begin
             ValDarIds.Catalogo;
             if trim(ValDarIds.pResul) = 'F' then
                Raise EInterFrame.Create('Imposible dar de alta a la persona.');
          end;
       finally
          if Qry <> nil then
             Qry.Free;
          if ValDarIds <> nil then
             ValDarIds.Free;
       end;

    // CZR 10-ago-2010   Validar si existen Personas con RFC semejantes, a la Persona que se dara de Alta
    if (InterForma1.IsNewData) and (trim(Persona.Siglas_RFC.AsString) <> '') and
       (trim(Persona.F_RFC.AsString) <> '') and (Persona.Homoclave_RFC.AsString <> '') then begin

      if Trim(Persona.Cve_Per_Juridica.AsString) = 'PF' then Begin             //rohs4279 mar/2016 req. PMO151201
        Persona.Nombre.AsString := Trim(Trim(Persona.Nombre_Persona.AsString)+' '+
                                   Trim(Persona.Apellido_Paterno.AsString)+' '+
                                   Trim(Persona.Apellido_Materno.AsString));
        FRfc:= Persona.F_Nacimiento.AsDateTime;
      end
      else Begin
        Persona.Nombre.AsString := Persona.Nom_Razon_Social.AsString;
        FRfc:= Persona.F_Contstitucion.AsDateTime;
      end;

      Persona.ValidaRFC(Persona.Nombre_Persona.AsString,                       //rohs4279 mar/2016 req. PMO151201
                        Persona.Apellido_Paterno.AsString,
                        Persona.Apellido_Materno.AsString,
                        Persona.Nom_Razon_Social.AsString,
                        FRfc,
                        Persona.Siglas_RFC.AsString,
                        Persona.F_RFC.asString,
                        Persona.Homoclave_RFC.AsString);

       with ValRFC do
          try
            Persona.GetFromControl;
            ValRFC := TValRFC.Create(Persona);
            Apli   := Persona.Apli;
            pQry   := GetSQLQuery(' select per.id_persona, '
                                + '        per.nombre, '
                                + '        rfc.siglas_rfc, '
                                + '        rfc.f_rfc, '
                                + '        rfc.homoclave_rfc '
                                + ' from persona per, '
                                + '      rfc     rfc '
                                + ' where per.id_persona    = rfc.id_persona '
                                + '   and rfc.siglas_rfc    = ' + Persona.Siglas_RFC.AsSQL
                                + '   and rfc.f_rfc         = ' + Persona.F_RFC.AsSQL
                                + '   and rfc.homoclave_rfc = ' + Persona.Homoclave_RFC.AsSQL,
                                  Persona.DataBaseName, Persona.SessionName, True);
             if pQry <> nil then
             begin
                try
                Catalogo;
                Except
                    on E:Exception do
                      MessageDlg('RFC Duplicados Imposible mostrar lista de duplicados ' + chr(10) + chr(13) + E.Message, mtError, [mbOK], 0);
                    end;
                raise EInterFrame.Create('Imposible dar de alta a la persona.');
             end;
          finally
             if ValRFC <> nil then
                Free;
          end;
    end;

    // CZR 07-oct-2013   Por peticion de Victor Hugo Reyes Rodriguez, se valida por Nacionalidad o Residencia.
    { Se elimina la siguiente validación a Petición de Victor Reyes 12-Jun-2015
    if (trim(Persona.PobNacionalidad.Cve_Poblacion.AsString) = cPaisEUA) or
       (trim(Persona.PobResidencia.Cve_Poblacion.AsString)   = cPaisEUA) then
    begin
       vITIN := trim(Persona.ITIN.AsString);
       vITIN := trim(StringReplace(vITIN, '-', '', [rfReplaceAll]));
       vITIN := trim(StringReplace(vITIN, ' ', '', [rfReplaceAll]));
       if length(vITIN) < 9 then
       begin
          Persona.ppgPestanias.ActivePageIndex := 1;
          Persona.pmeITIN.SetFocus;
          raise EInterFrame.Create('El dato ITIN tiene ' + IntToStr(length(vITIN)) + ' de 9 digitos requeridos');
       end;
    end;
    }

    // CZR 26-nov-2014   Validar captura de Registro CONDUSEF
    if (trim(Persona.Actividad.TipoCliente.B_CONDUSEF.AsString) = cVerdadero) or
       (trim(Persona.Actividad.Residencia.B_CONDUSEF.AsString)  = cVerdadero) or
       (trim(Persona.Actividad.TipoSector.B_CONDUSEF.AsString)  = cVerdadero) or
       (trim(Persona.Actividad.Sector.B_CONDUSEF.AsString)      = cVerdadero) or
       (trim(Persona.Actividad.SubSector.B_CONDUSEF.AsString)   = cVerdadero) or
       (trim(Persona.Actividad.Rama.B_CONDUSEF.AsString)        = cVerdadero) or
       (trim(Persona.Actividad.SubRama.B_CONDUSEF.AsString)     = cVerdadero) or
       (trim(Persona.Actividad.Inciso.B_CONDUSEF.AsString)      = cVerdadero) then
    begin
       if trim(Persona.CONDUSEF.AsString) = '' then
       begin
          gbCONDUSEF.Visible := True;
          raise EInterFrame.Create('Ingrese el Registro CONDUSEF en la pestaña Datos Generales');
       end;
    end;

    //Obtengo las claves de estatus fatca/crs y Tipo_Persona en caso de que exista configuración rohs4279 mar/2016 req. PMO151201
    if cbfatcacrs.Text = Emptystr then
      Persona.cve_estatus_fatca.AsString := Emptystr
    else Begin
      qDatos := TQuery.Create(nil);
      Try
        qDatos.DatabaseName := Persona.DataBaseName;
        qDatos.SessionName  := Persona.SessionName; 
        sql := 'SELECT cve_estatus ' +
                ' FROM fatca_estatus ' +
               ' WHERE UPPER(desc_estatus) = UPPER(' + Quotedstr(cbfatcacrs.Text) + ') ';
        qDatos.Close;
        qDatos.SQL.Clear;
        qDatos.SQL.Add(sql);
        qDatos.Open;
        Persona.cve_estatus_fatca.AsString := Emptystr;
        if Not qDatos.Fields[0].IsNull then
          Persona.cve_estatus_fatca.AsString := qDatos.FieldByName('cve_estatus').AsString;
      Finally
        qDatos.Close;
        qDatos.Free;
      end;
    end;
    if ptipopers.Visible then
      if cbtipopers.Text = Emptystr then
        Persona.cve_tipo_persona.AsString := Emptystr
      else Begin
        qDatos := TQuery.Create(nil);
        Try
          qDatos.DatabaseName := Persona.DataBaseName;
          qDatos.SessionName  := Persona.SessionName; 
          sql := 'SELECT cve_tipo_persona ' +
                  ' FROM tipo_persona ' +
                 ' WHERE UPPER(desc_tipo_persona) = UPPER(' + Quotedstr(cbtipopers.Text) + ') ';
          qDatos.Close;
          qDatos.SQL.Clear;
          qDatos.SQL.Add(sql);
          qDatos.Open;
          Persona.cve_tipo_persona.AsString := Emptystr;
          if Not qDatos.Fields[0].IsNull then
            Persona.cve_tipo_persona.AsString := qDatos.FieldByName('cve_tipo_persona').AsString;
        Finally
          qDatos.Close;
          qDatos.Free;
        end;
      end;
    //Obtengo las claves de estatus fatca/crs y Tipo_Persona en caso de que exista configuración rohs4279 mar/2016 req. PMO151201

    Realizado:= True;
  Except
    on E:Exception do
    begin
      Realizado := False;
      InterForma1.ShowError :=  False;
      MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

// Codigo ejecutado en el trigger trgBitPersona de la tabla Persona   CZR 12-Marzo-2010
procedure TWPersona.InterForma1DespuesAceptar(Sender: TObject);
{var
   Q      : Tquery;
   SQL    : string;
   vFolio : Integer;}
var idx : Integer;
begin
  {vFolio := 0;
  if edModifica.Text = 'V' then begin
     SQL := 'SELECT NUM_FOLIO as FOLIO FROM FOLIO_CORP WHERE ID_EMPRESA = 2 AND CVE_FOLIO = ''BITPER''';
     Q := GetSqlQuery(SQL,Persona.DataBaseName,Persona.SessionName,True);
     if Q <> nil then begin
        try
          vFolio := Q.FieldByName('FOLIO').AsInteger + 1;
        finally
          Q.Free;
        end;//try & finally
     end;
     if Q = nil then
        Q.Free;
     RunSQL('INSERT INTO PERSONA_BIT (ID_PERSONA, CONSECUTIVO, CVE_USUARIO, FH_REGISTRO, DESC_MODIF)' +
            'VALUES ( ' + edIDPersona.text                              + ','
                        + InttoStr(vFolio)                              + ','
                        + chr(39) + edCVEUsuarModif.Text + chr(39)      + ','
                        +' to_date(to_char(sysdate,''dd/mm/yyyy hh:mi:ss AM''),''dd/mm/yyyy hh:mi:ss AM'') ' + ','
                        + chr(39) + ' Nombre : '        + edNombre.Text       +
                                    ' Id Domicilio : '  + edIdDomicilio.Text  +
                                    ' Id DomFiscal : '  + edIdDom_Fis.Text    + // CZR 03-JUNIO-2009
                                    ' R.F.C. : '        + edSiglasRFC.Text    +
                                    ' - '               + edFRFC.Text         +
                                    ' - '               + edHomoclaveRFC.Text +
                          chr(39) + ')', Persona.DataBaseName, Persona.SessionName, True);
       RunSQL('UPDATE FOLIO_CORP SET NUM_FOLIO = '+ InttoStr(vFolio) +
              'WHERE ID_EMPRESA = 2 AND CVE_FOLIO = ''BITPER''', Persona.DataBaseName, Persona.SessionName, True);
  end;//if}
  tabMotivo.PageControl := nil;   // CZR 17-Marzo-2010
  btnAgregapepsasoc.Enabled := chkBPEPS.Enabled;
  btnAgregapepsasoc.Visible := chkBPEPS.Enabled;

  {--- Guardando Datos ---}
  for  idx:=1  to noPerPepsAsoc do
  begin
     RunSQL('INSERT INTO PER_PEPS_ASOCIADO(ID_PERSONA, ID_REGISTRO, NOMBRE_PEPS, PATERNO_PEPS, MATERNO_PEPS, FUNCION_PEPS, CVE_NACIONALIDAD, RELACION_PEPS, CVE_PARENTESCO)' +
            'VALUES (' + edIDPersona.Text + ','
                       + IntToStr( datPerPepsAsoc[idx].Id_Registro )             + ','
                       + chr(39) + datPerPepsAsoc[idx].Nombre        +   chr(39) + ','
                       + chr(39) + datPerPepsAsoc[idx].Paterno       +   chr(39) + ','
                       + chr(39) + datPerPepsAsoc[idx].Materno       +   chr(39) + ','
                       + chr(39) + datPerPepsAsoc[idx].Funcion       +   chr(39) + ','
                       + chr(39) + datPerPepsAsoc[idx].CvePobl       +   chr(39) + ','
                       + chr(39) + datPerPepsAsoc[idx].Relacion      +   chr(39) +' ,'
                       + chr(39) + datPerPepsAsoc[idx].CveParent     +   chr(39) +')'
            , Persona.DataBaseName, Persona.SessionName, True);

    noPerPepsAsoc := 0;
  end;
  Persona.DespuesLocaliza(Sender); // CZR 15-oct-2013
  Llena_combos_fatcacrs_tipopersona(trim(Persona.Cve_Per_Juridica.AsString));  //rohs4279 mar/2016 req. PMO151201
  RefrescaGridNac;                                                             //rohs4279 mar/2016 req. PMO151201
  tabNacRes.TabVisible := True;                                                //rohs4279 mar/2016 req. PMO151201
  Persona.Visibilidad_NivelRiesgo(False, True); // CZR 26-ago-2014
end;//procedure

procedure TWPersona.sbSitiClick(Sender: TObject);
begin
  If Persona.ValidaAccesoEsp('PF_ACTVECO',True,True) Then
  Begin
    Persona.Siti.Busca;
  End;
end;//procedure

procedure TWPersona.BitBtn2Click(Sender: TObject);
var
   CrmTCte : TCrmTCte;
begin
  If Persona.ValidaAccesoEsp('PF_CLASCTE',True,True) Then
  Begin
    if Persona.Active then begin
       CrmTCte := TCrmTCte.Create(Persona);
       try
         CrmTCte.Apli := Persona.Apli;
         CrmTCte.FrameParam := Persona;
         CrmTCte.Catalogo;
       finally
         CrmTCte.Free;
       end;//try & finally
    end;//if
  End;
end;//procedure

function TWPersona.ValidaMeses : Boolean;
begin
  if Length(iedMesAntigEmpr.Text) > 0 then
  begin
    if StrToInt(iedMesAntigEmpr.Text) >= 12 then
    begin
      ValidaMeses := False;
      MessageBeep(0);
      InterMsg(tmInformacion,'',0,'El número de meses de antigüedad es incorrecto...');
      iedMesAntigEmpr.SetFocus;
    end
    else
      ValidaMeses := True;
  end
  else
    ValidaMeses := True;
end;

procedure TWPersona.iedMesAntigEmprExit(Sender: TObject);
begin
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaMeses;

end;

procedure TWPersona.InterForma1BtnAceptar(Sender: TObject);
begin
  if ValidaMeses then
  begin
    if rgPerJuridica.ItemIndex = 0 then
    begin
      if ValidaCurp then
        if ValidaBActivEmp then
          InterForma1.Aceptar;
    end
    else
      InterForma1.Aceptar;
  end;
end;

procedure TWPersona.edIdEmpLaboraChange(Sender: TObject);
begin
  if Length(edIdEmpLabora.Text) <= 0 then
    edDescEmpLabora.Text := ''
  else
  begin
    with qEmpresaLabora do
    begin
      Close;
      ParamByName('pIdPersona').AsInteger := StrToInt(edIdEmpLabora.Text);
      Open;
      if not IsEmpty then
        edDescEmpLabora.Text := FieldByName('NOMBRE').AsString
      else
        edDescEmpLabora.Text := '';
      Close;
    end;
  end;
end;

procedure TWPersona.LimpiarRangoIngresosClick(Sender: TObject);
begin
  edIdRangoIngreso.Text := '';
  iedMontoMaximo.Text := '';
  Persona.Id_Rango_Ingreso.AsString := '';
end;

procedure TWPersona.LimpiarProfesionClick(Sender: TObject);
begin
  edIdProfesion.Text := '';
  edDescProfesion.Text := '';
  Persona.Id_Profesion.AsString := '';
end;

procedure TWPersona.LimpiarFuenteIngrClick(Sender: TObject);
begin
  {*
  edIdFuenteIngr.Text := '';
  edDescFuenteIngr.Text := '';
  Persona.Id_Fuente_Ingr.AsString := '';*}
end;

procedure TWPersona.LimpiarEmpLaboraClick(Sender: TObject);
begin
  edIdEmpLabora.Text := '';
  edDescEmpLabora.Text := '';
  Persona.Id_Emp_Labora.AsString := '';
end;

procedure TWPersona.edIdDomicilioContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  HabilitaPopUpMenu;
end;

procedure TWPersona.edCalleNumeroContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  HabilitaPopUpMenu;
end;

procedure TWPersona.edCveResidenciaContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  HabilitaPopUpMenu;
end;

procedure TWPersona.edResidenciaContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  HabilitaPopUpMenu;
end;

procedure TWPersona.edCveNacionalidadContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  HabilitaPopUpMenu;
end;

procedure TWPersona.edNacionalidadContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  HabilitaPopUpMenu;
end;

procedure TWPersona.edIdRangoIngresoContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  HabilitaPopUpMenu;
end;

procedure TWPersona.edIdProfesionContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  HabilitaPopUpMenu;
end;

procedure TWPersona.edIdFuenteIngrContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
 // HabilitaPopUpMenu;
end;

procedure TWPersona.edIdEmpLaboraContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  HabilitaPopUpMenu;
end;

procedure TWPersona.HabilitaPopUpMenu;
begin
  //PopupDomicilio.AutoPopup     := InterForma1.BtnAceptar.Enabled;
  //PopupResidencia.AutoPopup    := InterForma1.BtnAceptar.Enabled;
  //PopupNacionalidad.AutoPopup  := InterForma1.BtnAceptar.Enabled;
  PopupFrecuencia.AutoPopup    := InterForma1.BtnAceptar.Enabled;
  //PopupFuenteIngr.AutoPopup    := InterForma1.BtnAceptar.Enabled;
  PopupRangoIngresos.AutoPopup := InterForma1.BtnAceptar.Enabled;
  PopupProfesion.AutoPopup     := InterForma1.BtnAceptar.Enabled;
  PopupEmpLabora.AutoPopup     := InterForma1.BtnAceptar.Enabled;

end;

procedure TWPersona.ConcatenaCurp;
var vlCurpStr,
    vlSubStr1,
    vlSubStr2,
    vlFecStr,
    vlFDMA    : String;
    vlFecha   : tdate;
begin
  vlFDMA      := Copy(meFecCurp.Text,7,2)+'/'+ Copy(meFecCurp.Text,4,2)+'/'+ Copy(meFecCurp.Text,1,2);
  vlFecha     := StrToDate(vlFDMA);
  vlFecStr    := Copy(meFecCurp.Text,1,2)+ Copy(meFecCurp.Text,4,2)+ Copy(meFecCurp.Text,7,2);
  vlCurpStr   := edSigCurp.Text + vlFecStr+edCurpSex.Text+edLugNacCurp.Text+edCurpLetra.Text+iedDigCurp.Text;
  edCurp.text := '';
  edCurp.text := vlCurpStr;
  vlCurpStr   := '';
end;

function TWPersona.ValidaCurp : Boolean;
var
  LongitudFecCurp : Integer;
begin
  LongitudFecCurp := Length(Trim(Copy(meFecCurp.Text,1,2))) +
                     Length(Trim(Copy(meFecCurp.Text,4,2))) +
                     Length(Trim(Copy(meFecCurp.Text,7,2)));
  if (Length(edSigCurp.Text)    > 0) or
     (LongitudFecCurp           > 0) or
     (Length(edCurpSex.Text)    > 0) or
     (Length(edLugNacCurp.Text) > 0) or
     (Length(edCurpLetra.Text)  > 0) or
     (Length(iedDigCurp.Text)   > 0) then
  begin
    if ValidaSigCurp then
      if ValidaCurpSex then
        if ValidaLugNacCurp then
          if ValidaCurpLetra then
            if ValidaDigCurp then
            begin
              ConcatenaCurp;
              ValidaCurp := True;
            end
  end
  else
  begin
    edCurp.text := '';
    ValidaCurp  := True;
  end;
end;

function TWPersona.ValidaSigCurp : Boolean;
var
  vlMensaje : String;
begin
  if (Length(edSigCurp.Text)<> 4) then
    vlMensaje := 'El número de caracteres debe de ser 4 ...'
  else if not ValidaLetras(edSigCurp.Text) then
    vlMensaje := 'Solo se permiten letras...'
  else
    vlMensaje := '';
  //Presenta Mensaje
  if vlMensaje <> '' then
  begin
    ValidaSigCurp := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,vlMensaje);
    edSigCurp.SetFocus;
  end
  else
    ValidaSigCurp := True;
end;

function TWPersona.ValidaCurpSex : Boolean;
var
  vlMensaje : String;
begin
  if (Trim(edCurpSex.Text)<> 'M') and (Trim(edCurpSex.Text) <> 'H') then
    vlMensaje := 'Los valores son M o H ...'
  else
    vlMensaje := '';
  //Presenta Mensaje
  if vlMensaje <> '' then
  begin
    ValidaCurpSex := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,vlMensaje);
    edCurpSex.SetFocus;
  end
  else
    ValidaCurpSex := True;
end;

function TWPersona.ValidaLugNacCurp : Boolean;
var
  vlMensaje : String;
begin
  if (Length(edLugNacCurp.Text) <> 2) then
    vlMensaje := 'El número de caracteres debe de ser 2 ...'
  else if not ValidaLetras(edLugNacCurp.Text) then
    vlMensaje := 'Solo se permiten letras...'
  else
    vlMensaje := '';
  //Presenta Mensaje
  if vlMensaje <> '' then
  begin
    ValidaLugNacCurp := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,vlMensaje);
    edLugNacCurp.SetFocus;
  end
  else
    ValidaLugNacCurp := True;
end;

function TWPersona.ValidaCurpLetra : Boolean;
var
  vlMensaje : String;
begin
  if (Length(edCurpLetra.Text) <> 3) then
    vlMensaje := 'El número de caracteres debe de ser 3 ...'
  else if not ValidaLetras(edCurpLetra.Text) then
    vlMensaje := 'Solo se permiten letras...'
  else
    vlMensaje := '';
  //Presenta Mensaje
  if vlMensaje <> '' then
  begin
    ValidaCurpLetra := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,vlMensaje);
    edCurpLetra.SetFocus;
  end
  else
    ValidaCurpLetra := True;
end;

function TWPersona.ValidaDigCurp : Boolean;
var
  vlMensaje : String;
begin
  if (Length(iedDigCurp.Text) <> 2) then
    vlMensaje := 'La cantidad de dígitos deben de ser 2 ...'
  else
    vlMensaje := '';
  //Presenta Mensaje
  if vlMensaje <> '' then
  begin
    ValidaDigCurp := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,vlMensaje);
    iedDigCurp.SetFocus;
  end
  else
    ValidaDigCurp := True;
end;

procedure TWPersona.bbRefBancariasClick(Sender: TObject);
var
  PER_REF_BANCARIA : TPerRefBan;
begin
  If Persona.ValidaAccesoEsp('PF_REFBANC',True,True) Then
  Begin
    try
      PER_REF_BANCARIA               := TPerRefBan.Create(Self);
      PER_REF_BANCARIA.MasterSource  := Persona;
      PER_REF_BANCARIA.GetParams(Persona);
      if Length(edIDPersona.Text) > 0 then
        PER_REF_BANCARIA.vpIdPersona := StrToInt(edIDPersona.Text)
      else
        PER_REF_BANCARIA.vpIdPersona := 0;
      PER_REF_BANCARIA.Catalogo;
    finally
      if PER_REF_BANCARIA <> nil then PER_REF_BANCARIA.Free;
      PER_REF_BANCARIA := nil;
    end;
  End;
end;

procedure TWPersona.bbRefPersonalesClick(Sender: TObject);
var
  PER_REF_PERSONA : TPerRefPer;
begin
  If Persona.ValidaAccesoEsp('PF_REFPER',True,True) Then
  Begin
    try
      PER_REF_PERSONA               := TPerRefPer.Create(Self);
      PER_REF_PERSONA.MasterSource  := Persona;
      PER_REF_PERSONA.GetParams(Persona);
      if Length(edIDPersona.Text) > 0 then
        PER_REF_PERSONA.vpIdPersona := StrToInt(edIDPersona.Text)
      else
        PER_REF_PERSONA.vpIdPersona := 0;
      PER_REF_PERSONA.Catalogo;
    finally
      if PER_REF_PERSONA <> nil then PER_REF_PERSONA.Free;
      PER_REF_PERSONA := nil;
    end;
  End;
end;

procedure TWPersona.bbInfEmpresaClick(Sender: TObject);
var
  PER_EMPRESA : TPerEmpre;
begin
  If Persona.ValidaAccesoEsp('PF_INFEMP',True,True) Then
  Begin
    try
      PER_EMPRESA               := TPerEmpre.Create(Self);
      PER_EMPRESA.MasterSource  := Persona;
      PER_EMPRESA.GetParams(Persona);
      if Length(edIDPersona.Text) > 0 then
        PER_EMPRESA.vpIdPersona := StrToInt(edIDPersona.Text)
      else
        PER_EMPRESA.vpIdPersona := 0;
      PER_EMPRESA.Catalogo;
    finally
      if PER_EMPRESA <> nil then PER_EMPRESA.Free;
      PER_EMPRESA := nil;
    end;
  End;
end;

procedure TWPersona.bbAsociacionesClick(Sender: TObject);
var
  PER_ASOCIACION : TPerAsocia;
begin
  If Persona.ValidaAccesoEsp('PF_SOCIAC',True,True) Then
  Begin
    try
      PER_ASOCIACION               := TPerAsocia.Create(Self);
      PER_ASOCIACION.MasterSource  := Persona;
      PER_ASOCIACION.GetParams(Persona);
      if Length(edIDPersona.Text) > 0 then
        PER_ASOCIACION.vpIdPersona := StrToInt(edIDPersona.Text)
      else
        PER_ASOCIACION.vpIdPersona := 0;
      PER_ASOCIACION.Catalogo;
    finally
      if PER_ASOCIACION <> nil then PER_ASOCIACION.Free;
      PER_ASOCIACION := nil;
    end;
  End;
end;

procedure TWPersona.chbB_Activ_EmpresaClick(Sender: TObject);
begin
  if rgPerJuridica.ItemIndex = 0 then
    bbInfEmpresa.Enabled   := chbB_Activ_Empresa.Checked;
  GroupBoxEmpresa;
end;

function TWPersona.ValidaLetras(pCadena : String) : Boolean;
var
  vlLength   : Integer;
  vlContador : Integer;
  vlLetra    : String;
  vlCorrecto : Boolean;
begin
  vlContador := 0;
  vlLength   := Length(pCadena);
  vlCorrecto := True;
  while (vlContador < vlLength) and (vlCorrecto = True) do
  begin
    vlContador := vlContador + 1;
    vlLetra    := Copy(pCadena,vlContador,1);
    if      vlLetra = 'A' then vlCorrecto := True
    else if vlLetra = 'B' then vlCorrecto := True
    else if vlLetra = 'C' then vlCorrecto := True
    else if vlLetra = 'D' then vlCorrecto := True
    else if vlLetra = 'E' then vlCorrecto := True
    else if vlLetra = 'F' then vlCorrecto := True
    else if vlLetra = 'G' then vlCorrecto := True
    else if vlLetra = 'H' then vlCorrecto := True
    else if vlLetra = 'I' then vlCorrecto := True
    else if vlLetra = 'J' then vlCorrecto := True
    else if vlLetra = 'K' then vlCorrecto := True
    else if vlLetra = 'L' then vlCorrecto := True
    else if vlLetra = 'M' then vlCorrecto := True
    else if vlLetra = 'N' then vlCorrecto := True
    else if vlLetra = 'O' then vlCorrecto := True
    else if vlLetra = 'P' then vlCorrecto := True
    else if vlLetra = 'Q' then vlCorrecto := True
    else if vlLetra = 'R' then vlCorrecto := True
    else if vlLetra = 'S' then vlCorrecto := True
    else if vlLetra = 'T' then vlCorrecto := True
    else if vlLetra = 'U' then vlCorrecto := True
    else if vlLetra = 'V' then vlCorrecto := True
    else if vlLetra = 'W' then vlCorrecto := True
    else if vlLetra = 'X' then vlCorrecto := True
    else if vlLetra = 'Y' then vlCorrecto := True
    else if vlLetra = 'Z' then vlCorrecto := True
    else                       vlCorrecto := False;
  end;
  ValidaLetras := vlCorrecto;
end;

procedure TWPersona.edCurpChange(Sender: TObject);
begin
  LlenaCurp;
end;

procedure TWPersona.LimpiaCurp;
begin
  edSigCurp.Clear;
  meFecCurp.Clear;
  edCurpSex.Clear;
  edLugNacCurp.Clear;
  edCurpLetra.Clear;
  iedDigCurp.Clear;
end;

procedure TWPersona.LlenaCurp;
var vlCurpStr,
    vlSubStr1,
    vlSubStr2,
    vlFecStr,
    vlFecha   : tdate;
begin
  LimpiaCurp;
  edSigCurp.Text := Copy(edCurp.text,1,4);
  meFecCurp.Text := Copy(edCurp.Text,5,2)+'/'+ Copy(edCurp.Text,7,2)+'/'+ Copy(edCurp.Text,9,2);
  edCurpSex.Text := Copy(edCurp.text,11,1);
  edLugNacCurp.Text := Copy(edCurp.text,12,2);
  edCurpLetra.Text := Copy(edCurp.text,14,3);
  iedDigCurp.Text := Copy(edCurp.text,17,2);
end;

procedure TWPersona.InterForma1BtnCancelar(Sender: TObject);
begin
  LlenaCurp;
  InterForma1.Cancelar;
  tabMotivo.PageControl := nil;   // CZR 17-Marzo-2010
  btnAgregapepsasoc.Enabled := chkBPEPS.Enabled;
  btnAgregapepsasoc.Visible := chkBPEPS.Enabled;
end;

function TWPersona.ValidaBActivEmp : Boolean;
begin
  ValidaBActivEmp := True;
  if InterForma1.F.Accion = cModificar then
  begin
    // Si se intenta cambiar la situación de Actividad Empresarial a falso
    if (Persona.B_Activ_Empresa.AsString = 'V') and
       (not chbB_Activ_Empresa.Checked        ) then
    begin
      if (GetSQL('SELECT * FROM PER_EMP_PF  WHERE ID_PERSONA = ' + Persona.Id_Persona.AsString,Persona.DataBaseName,Persona.SessionName,True)) or
         (GetSQL('SELECT * FROM PER_EMPRESA WHERE ID_PERSONA = ' + Persona.Id_Persona.AsString,Persona.DataBaseName,Persona.SessionName,True)) then
      begin
        ValidaBActivEmp := False;
        InterMsg(tmInformacion,'',0,'La persona no puede ser Sin Actividad Empresarial puesto que tiene registrado información de su empresa.');
      end;
    end;
    // Si se intenta cambiar la situación de Actividad Empresarial a verdadero
    if (Persona.B_Activ_Empresa.AsString = 'F') and
       (chbB_Activ_Empresa.Checked            ) then
    begin
      if (Length(Persona.Id_Emp_Labora.AsString)  > 0) or
         (Length(Persona.Puesto_Empresa.AsString) > 0) or
         (Length(Persona.Ano_Antig_Empr.AsString) > 0) or
         (Length(Persona.Mes_Antig_Empr.AsString) > 0) then
      begin
        ValidaBActivEmp := False;
        InterMsg(tmInformacion,'',0,'La persona no puede ser Con Actividad Empresarial puesto que tiene registrado información de la empresa donde labora.');
      end;
    end;
  end;
end;

procedure TWPersona.GroupBoxEmpresa;
begin
  if rgPerJuridica.ItemIndex = 0 then //Persona Física
  begin
    gbEmpLabora.Visible     := not chbB_Activ_Empresa.Checked;
    gbEmpresaPropia.Visible := chbB_Activ_Empresa.Checked;
  end
  else
  begin
    gbEmpLabora.Visible     := False;
    gbEmpresaPropia.Visible := False;
  end;
end;

procedure TWPersona.LocalizaActividad;
Begin
  With Persona.Actividad do
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

procedure TWPersona.sbTipoClienteClick(Sender: TObject);
begin
  If Persona.ValidaAccesoEsp('PF_TPCTE',True,True) Then
  Begin
    If Persona.Actividad.TipoCliente.Busca Then LocalizaActividad;
  End;
end;

procedure TWPersona.sbResidenciaClick(Sender: TObject);
begin
  If Persona.ValidaAccesoEsp('PF_RESIDEN',True,True) Then
  Begin
    If Persona.Actividad.Residencia.Busca Then LocalizaActividad;
  End;
end;

procedure TWPersona.sbTipoSectorClick(Sender: TObject);
begin
  If Persona.ValidaAccesoEsp('PF_TSECTOR',True,True) Then
  Begin
    If Persona.Actividad.TipoSector.Busca Then LocalizaActividad;
  End;
end;

procedure TWPersona.sbSectorClick(Sender: TObject);
begin
  If Persona.ValidaAccesoEsp('PF_SECTOR',True,True) Then
  Begin
    If Persona.Actividad.Sector.Busca Then LocalizaActividad;
  End;
end;

procedure TWPersona.sbSubSectorClick(Sender: TObject);
begin
  If Persona.ValidaAccesoEsp('PF_SSECTOR',True,True) Then
  Begin
    If Persona.Actividad.SubSector.Busca Then LocalizaActividad;
  End;
end;

procedure TWPersona.sbRamaClick(Sender: TObject);
begin
  If Persona.ValidaAccesoEsp('PF_RAMA',True,True) Then
  Begin
    If Persona.Actividad.Rama.Busca Then LocalizaActividad;
  End;
end;

procedure TWPersona.sbSubRamaClick(Sender: TObject);
begin
  If Persona.ValidaAccesoEsp('PF_SRAMA',True,True) Then
  Begin
    If Persona.Actividad.SubRama.Busca Then LocalizaActividad;
  End;
end;

procedure TWPersona.sbIncisoClick(Sender: TObject);
begin
  If Persona.ValidaAccesoEsp('PF_INCISO',True,True) Then
  Begin
    If Persona.Actividad.Inciso.Busca Then LocalizaActividad;
  End;
end;

procedure TWPersona.CatalogoFrecuenciadClick(Sender: TObject);
begin Persona.Frecuencia.Catalogo;
end;



procedure TWPersona.LimpiarActividadClick(Sender: TObject);
begin
  If (Persona.Modo = moAppend) or (Persona.Modo = moEdit) Then
  Begin
    Persona.Actividad.Active:= False;
    edCve_Activ_Cto.Text:= '';
  end;
end;

procedure TWPersona.linkActividadCapture(Sender: TObject;
  var Show: Boolean);
begin Show:= (Persona.Modo = moAppend) Or (Persona.Modo = moEdit);
end;

procedure TWPersona.linkActividadEjecuta(Sender: TObject);
begin Persona.Actividad.FindKey([linkActividad.Buffer]);
end;

procedure TWPersona.sbMotivoClick(Sender: TObject);
begin
  If Persona.ValidaAccesoEsp('PF_MTVO',True,True) Then
  Begin
     // CZR 17-Marzo-2010
     with Persona do
     begin
        case rgSitPersona.ItemIndex of
           0:     Motivo.BuscaWhereString := 'Tipo_Proceso = ''AC''';
           1:     Motivo.BuscaWhereString := 'Tipo_Proceso = ''IN''';
        end;
        if Motivo.Busca then
        begin
           Cve_Motivo.AsString  := Motivo.CVE_MOTIVO.AsString;
           Desc_Motivo.AsString := Motivo.DESC_MOTIVO.AsString;
        end;
     end;
  End;
end;

procedure TWPersona.ilMotivoEjecuta(Sender: TObject);
begin
   // CZR 17-Marzo-2010
   with Persona do
   begin
      Motivo.FindKey([ilMotivo.Buffer]);
      Cve_Motivo.AsString  := Motivo.CVE_MOTIVO.AsString;
      Desc_Motivo.AsString := Motivo.DESC_MOTIVO.AsString;
   end;
end;

procedure TWPersona.chkBPEPSClick(Sender: TObject);
var
  PER_PEPS_ASOC  : TPerPepAso;
  aux            : Integer;
  indice         : Integer;
begin

  //Persona.Modo;
  
  //if InterForma1.CanEdit Or InterForma1.IsNewData then
  if (Persona.Modo = moAppend) Or (Persona.Modo = moEdit)  Then
   begin
        btnAgregapepsasoc.Visible := chkBPEPS.Checked;
        btnAgregapepsasoc.Enabled := chkBPEPS.Checked;

         if not chkBPEPS.Checked then
         begin
            if InterMsg(tmPregunta, '', 0, 'Si desmarcas la casilla de Politicamente Expuesto se eliminarán los registros Asociados a esta persona' + #13 +
                                          '¿Deseas continuar con esta acción?') = mrNo then
            begin  {Click NO}
               chkBPEPS.OnClick := nil; // Quitamos el evento temporalmente
               chkBPEPS.Checked := not chkBPEPS.Checked;
            end
            else
            begin {Click SI}
               // Borramos de la base de datos los registros con el id_persona si existe
               // Y borramos del Indice del buffer
               if  edIDPersona.Text <> '' Then
                      RunSQL('DELETE PER_PEPS_ASOCIADO WHERE ID_PERSONA=' + edIDPersona.Text
                      , Persona.DataBaseName, Persona.SessionName, True);

               noPerPepsAsoc := 0;
            end;
         end
         else
         begin
               Try
                  PER_PEPS_ASOC       := TPerPepAso.Create(nil);
                  PER_PEPS_ASOC.Apli  := Persona.Apli;

                  if Length(edIDPersona.Text) > 0 then
                     PER_PEPS_ASOC.vpIdPersona := StrToInt(edIDPersona.Text)
                  else
                     PER_PEPS_ASOC.vpIdPersona := 0;

                     PER_PEPS_ASOC.vprgPerJuridica := rgPerJuridica.ItemIndex;
                     PER_PEPS_ASOC.Catalogo;
                     indice := 1;
                     aux :=  PER_PEPS_ASOC.noRegistros;
                     {Obtenemos los registros capturados}
                     for  indice:=1 to aux do
                     begin
                       datPerPepsAsoc[indice + noPerPepsAsoc].Id_Registro := PER_PEPS_ASOC.ListPerPerpAsoc[indice].Id_Registro +  noPerPepsAsoc;
                       datPerPepsAsoc[indice + noPerPepsAsoc].Nombre      := PER_PEPS_ASOC.ListPerPerpAsoc[indice].Nombre ;
                       datPerPepsAsoc[indice + noPerPepsAsoc].Paterno     := PER_PEPS_ASOC.ListPerPerpAsoc[indice].Paterno ;
                       datPerPepsAsoc[indice + noPerPepsAsoc].Materno     := PER_PEPS_ASOC.ListPerPerpAsoc[indice].Materno ;
                       datPerPepsAsoc[indice + noPerPepsAsoc].Funcion     := PER_PEPS_ASOC.ListPerPerpAsoc[indice].Funcion ;
                       datPerPepsAsoc[indice + noPerPepsAsoc].CvePobl     := PER_PEPS_ASOC.ListPerPerpAsoc[indice].CvePobl ;
                       datPerPepsAsoc[indice + noPerPepsAsoc].CveParent   := PER_PEPS_ASOC.ListPerPerpAsoc[indice].CveParent ;
                       datPerPepsAsoc[indice + noPerPepsAsoc].Relacion    := PER_PEPS_ASOC.ListPerPerpAsoc[indice].Relacion ;
                     end;
               finally
                     noPerPepsAsoc := aux + noPerPepsAsoc;

                     if PER_PEPS_ASOC <> nil then
                     begin
                         PER_PEPS_ASOC.Free;
                         PER_PEPS_ASOC := nil;
                     end;

               end;

         end;
   end;
   
   chkBPEPS.OnClick := chkBPEPSClick;    // Dejamos las cosas como estaban
end;

procedure TWPersona.btnAgregapepsasocClick(Sender: TObject);
var
  PER_PEPS_ASOC  : TPerPepAso;
  aux, indice    : Integer;
  sSQL            : String;
  Qry            : TQuery;
begin
if InterForma1.CanEdit then
   begin

        Try
           PER_PEPS_ASOC       := TPerPepAso.Create(nil);
           PER_PEPS_ASOC.Apli  := Persona.Apli;

           // Obtenermos el numero de personas asociadas para pasarlo
           // a la forma peps asociados
           sSQL := 'SELECT MAX(ID_REGISTRO) AS NUM_PEPS_ASOCIADOS FROM PER_PEPS_ASOCIADO WHERE ID_PERSONA = ' + edIDPersona.Text;
           try
              Qry := GetSQLQuery( sSQL , Persona.Apli.DataBaseName, Persona.Apli.SessionName, False);

              if Qry <> nil then
              begin
                 PER_PEPS_ASOC.vgIdRegistro := Qry.FieldByName('NUM_PEPS_ASOCIADOS').AsInteger;
              end;

           finally
              if Qry <> nil then
                 Qry.Free;
           end;

           if Length(edIDPersona.Text) > 0 then
              PER_PEPS_ASOC.vpIdPersona := StrToInt(edIDPersona.Text)
           else
               PER_PEPS_ASOC.vpIdPersona := 0;                      

           PER_PEPS_ASOC.vprgPerJuridica := rgPerJuridica.ItemIndex;
           PER_PEPS_ASOC.Catalogo;
           indice := 1;
           aux :=  PER_PEPS_ASOC.noRegistros;

           {Obtenemos los registros capturados}
           for  indice:=1 to aux do
           begin
                       datPerPepsAsoc[indice + noPerPepsAsoc].Id_Registro := PER_PEPS_ASOC.ListPerPerpAsoc[indice].Id_Registro +  noPerPepsAsoc;
                       datPerPepsAsoc[indice + noPerPepsAsoc].Nombre      := PER_PEPS_ASOC.ListPerPerpAsoc[indice].Nombre ;
                       datPerPepsAsoc[indice + noPerPepsAsoc].Paterno     := PER_PEPS_ASOC.ListPerPerpAsoc[indice].Paterno ;
                       datPerPepsAsoc[indice + noPerPepsAsoc].Materno     := PER_PEPS_ASOC.ListPerPerpAsoc[indice].Materno ;
                       datPerPepsAsoc[indice + noPerPepsAsoc].Funcion     := PER_PEPS_ASOC.ListPerPerpAsoc[indice].Funcion ;
                       datPerPepsAsoc[indice + noPerPepsAsoc].CvePobl     := PER_PEPS_ASOC.ListPerPerpAsoc[indice].CvePobl ;
                       datPerPepsAsoc[indice + noPerPepsAsoc].CveParent   := PER_PEPS_ASOC.ListPerPerpAsoc[indice].CveParent ;
                       datPerPepsAsoc[indice + noPerPepsAsoc].Relacion    := PER_PEPS_ASOC.ListPerPerpAsoc[indice].Relacion ;
           end;
        finally
              noPerPepsAsoc := aux + noPerPepsAsoc;

              if PER_PEPS_ASOC <> nil then
              begin
                 PER_PEPS_ASOC.Free;
                 PER_PEPS_ASOC := nil;
              end;

        end;

   end;
end;

procedure TWPersona.InterForma1DespuesEliminar(Sender: TObject);
begin
  btnAgregapepsasoc.Enabled := chkBPEPS.Enabled;
  btnAgregapepsasoc.Visible := chkBPEPS.Enabled;
//  Persona.VisFiscalUbicacionExt(True, False); // CZR 07-oct-2013             rohs4279 mar/2016 req. PMO151201
  Persona.DespuesLocaliza(Sender); // CZR 14-oct-2013
end;

procedure TWPersona.sbNueIngrClick(Sender: TObject);
var
  IngresoPrincipal : TPerIngPri;
begin
try
         if not Persona.Active then
            raise EInterFrame.Create('No se encuentra una Persona Activa para esta accion');
         if trim(edIDPersona.text) = '' then
            raise EInterFrame.Create('Debe existir un Id Persona para esta accion');
         with IngresoPrincipal do
         begin
            IngresoPrincipal := TPerIngPri.Create(self);
            try
               GetParams(Persona);
               pIdPersona := StrToInt(Persona.Id_Persona.AsString);

               if rgPerJuridica.ItemIndex = 0 then
                  cvePerJuridica := 'PF'
               else
                  cvePerJuridica := 'PM';

               ShowWindow(ftCaptura);
               //Catalogo;
               Persona.DespuesLocaliza(Sender);
            finally
               Free;
            end;
         end;
      except
         on e: EInterFrame do
            MessageDlg(e.Message, mtInformation, [mbOK], 0);
      end;
end;

procedure TWPersona.sbModIngrClick(Sender: TObject);
var
    IngresoPrincipal : TPerIngPri;
begin
try
         if not Persona.Active then
            raise EInterFrame.Create('No se encuentra una Persona Activa para esta accion');
         if trim(edIDPersona.text) = '' then
            raise EInterFrame.Create('Debe existir un Id Persona para esta accion');
         if Persona.plvFteIngreso.Items.Count = 0 then
            exit;
         if Persona.plvFteIngreso.SelCount = 0 then
            raise EInterFrame.Create('Seleccione un Fuente de Ingreso');
         with IngresoPrincipal do
         begin
            IngresoPrincipal := TPerIngPri.Create(self);
            try
               GetParams(Persona);
               pIdFteIngr := StrToInt( Trim(Persona.plvFteIngreso.Selected.Caption ) );
               FindKey([Persona.ID_PERSONA.AsInteger, StrToInt( Trim(Persona.plvFteIngreso.Selected.Caption ) ) ]);

               pIdPersona := StrToInt(Persona.Id_Persona.AsString);

               if rgPerJuridica.ItemIndex = 0 then
                  cvePerJuridica := 'PF'
               else
                  cvePerJuridica := 'PM';

               ShowWindow(ftModifica);
               Persona.DespuesLocaliza(Sender);
            finally
               Free;
            end;
         end;
      except
         on e: EInterFrame do
            MessageDlg(e.Message, mtInformation, [mbOK], 0);
      end;
end;

procedure TWPersona.sbEliIngrClick(Sender: TObject);
var
    sSql  : String;
begin
      try
        if not Persona.Active then
            raise EInterFrame.Create('No se encuentra una Persona Activa para esta accion');
         if trim(edIDPersona.text) = '' then
            raise EInterFrame.Create('Debe existir un Id Persona para esta accion');
         if Persona.plvFteIngreso.Items.Count = 0 then
            exit;
         if Persona.plvFteIngreso.SelCount = 0 then
            raise EInterFrame.Create('Seleccione una Fuente de Ingreso');


         if InterMsg(tmPregunta, '', 0, '¿Seguro que deseas eliminar este registro?') = mrYes then
         begin
               sSql := ' DELETE PER_INGRESO_PRINCIPAL WHERE ID_PERSONA = ' + Persona.Id_Persona.AsSQL
                     + ' AND ID_FUENTE_INGR = ' + Trim(Persona.plvFteIngreso.Selected.Caption) ;

               RunSQL(sSQL , Persona.DataBaseName, Persona.SessionName, True);
         end;
            
               Persona.DespuesLocaliza(Sender);

      
      except
         on e: EInterFrame do
            MessageDlg(e.Message, mtInformation, [mbOK], 0);
      end;
end;

procedure TWPersona.SpeedEdoNacClick(Sender: TObject);
begin
  if edCvePaisNacim.Text <> '' then begin
    Persona.EstadoNacimiento.BuscaWhereString := ' (POBLACION.CVE_TIPO_POBLAC = ''ES'' ) '+
                                                 ' AND (POBLACION.CVE_POBLAC_UBIC =' +
                                                 #39 + edCvePaisNacim.Text + #39 +
                                                 ')' ;
  end;

  if Persona.EstadoNacimiento.Busca then begin
    Persona.Cve_Edo_Nacim.AsString := Persona.EstadoNacimiento.Cve_Poblacion.AsString;
    Persona.EstadoNacim.AsString   := Persona.EstadoNacimiento.Desc_Poblacion.AsString;
  end;//if
end;

procedure TWPersona.SpeedPaisNacClick(Sender: TObject);
begin
  if Persona.PaisNacimiento.Busca then begin
    Persona.Cve_Pais_Nacim.AsString  := Persona.PaisNacimiento.Cve_Poblacion.AsString;
    Persona.PaisNacim.AsString       := Persona.PaisNacimiento.Desc_Poblacion.AsString;
    Persona.Cve_Edo_Nacim.AsString   := '';
    Persona.EstadoNacim.AsString     := '';
    edEdoNacimiento.Text             := '';
    edLugarNacim.Text                := '';
  end;//if
end;

procedure TWPersona.SpeedButton5Click(Sender: TObject);
var Dom: TDomicilio;

begin
  Dom := TDomicilio.Create(Persona);
  Dom.GetParams(Persona);
  try
    if Dom.Busca then begin
      Persona.Domicilio.AsString         := '';
      Persona.DomicilioEmp_Pf.AsInteger  := Dom.IdDomicilio.AsInteger;
      Persona.Desc_DomPF.AsString        := Dom.CalleNumero.AsString;
    end;//if
  finally
    Dom.Free;
  end;//try & finally
end;//procedure

procedure TWPersona.MenuItem3Click(Sender: TObject);
var Dom: TDomicilio;

begin
  Dom := TDomicilio.Create(Persona);
  Dom.GetParams(Persona);
  try
    if edDOMICILIO.Text <> '' then
      Dom.FindKey([edDOMICILIO.Text]);
    Dom.Catalogo;
    if InterForma1.CanEdit then begin
      if Dom.Active then begin
        Persona.DomicilioEmp_Pf.AsInteger := Dom.IdDomicilio.AsInteger;
        Persona.Desc_DomPF.AsString   := Dom.CalleNumero.AsString;
      end;//if
    end;//if
  finally
    Dom.Free;
  end;//try & finally
end;

procedure TWPersona.bbAvisoPrivClick(Sender: TObject); // CZR 07-Agosto-2013
var RpAviPriv : TRpAviPriv;

begin
  if Persona.ValidaAccesoEsp('PF_RPAVIPRIV', True, True) then begin
    RpAviPriv := TRpAviPriv.Create(Self);
    with RpAviPriv do
      try
        MasterSource := Persona;
        GetParams(Persona);
        Catalogo;
      finally
        if RpAviPriv <> nil then
          RpAviPriv.Free; RpAviPriv := nil;
      end;
  end;
end;

{procedure TWPersona.meITINChange(Sender: TObject); // CZR 07-oct-2013
begin
   Persona.pmeITIN.Modified := False;
end;

procedure TWPersona.meITINKeyPress(Sender: TObject; var Key: Char); // CZR 07-oct-2013
begin
   if trim(Key) = '' then
      Key := '0';
end;
}

procedure TWPersona.InterForma1DespuesCancelar(Sender: TObject);
begin
{   if Persona.PobNacionalidad.Active then // CZR 07-oct-2013                  rohs4279 mar/2016 req. PMO151201
      Persona.VisFiscalUbicacionExt(False, False)
   else
      Persona.VisFiscalUbicacionExt(True, False);}
  Persona.DespuesLocaliza(Sender); // CZR 14-oct-2013
  Persona.Visibilidad_NivelRiesgo(False, True); // CZR 26-ago-2014
  if Persona.Id_Persona.AsString = Emptystr then Begin                         //rohs4279 feb/2016 req. PMO151201
    if pfatcacrs.Visible then
      cbfatcacrs.ItemIndex := -1;
    if ptipopers.Visible then
      cbtipopers.ItemIndex := -1;
    tabNacRes.TabVisible := False;
  end                                                                          //rohs4279 mar/2016 req. PMO151201
  else Begin
    Llena_combos_fatcacrs_tipopersona(trim(Persona.Cve_Per_Juridica.AsString));
    RefrescaGridNac;
    tabNacRes.TabVisible := True;
  end;
end;

procedure TWPersona.sbNueTelClick(Sender: TObject); // CZR 14-oct-2013
var Telefonos : TTelPers;

begin
  try
    if (not Persona.Active) or (Persona.Id_Persona.AsInteger <= 0) then
      raise EInterFrame.Create('No se encuentra un Persona Activa para esta Accion');
    with Telefonos do begin
      Telefonos := TTelPers.Create(self);
      try
        GetParams(Persona);
        pPersonaPadre := Persona;
        ShowWindow(ftCaptura);
        Persona.DespuesLocaliza(Sender);
      finally
        Free;
      end;
    end;
  except
    on e: EInterFrame do
      MessageDlg(e.Message, mtInformation, [mbOK], 0);
  end;
end;

procedure TWPersona.sbModTelClick(Sender: TObject); // CZR 14-oct-2013
var Telefonos : TTelPers;

begin
  try
    if (not Persona.Active) or (Persona.Id_Persona.AsInteger <= 0) then
      raise EInterFrame.Create('No se encuentra un Persona Activa para esta Accion');
    if Persona.plvTelefonos.Items.Count = 0 then
      exit;
    if Persona.plvTelefonos.SelCount = 0 then
      raise EInterFrame.Create('Seleccione un Teléfono');
    with Telefonos do begin
      Telefonos := TTelPers.Create(self);
      try
        GetParams(Persona);
        pPersonaPadre := Persona;
        FindKey([Persona.Id_Persona.AsInteger,
                 Trim(Persona.plvTelefonos.Selected.Caption),
                 Trim(Persona.plvTelefonos.Selected.SubItems[0]),
                 Trim(Persona.plvTelefonos.Selected.SubItems[5])]);
        ShowWindow(ftModifica);
        Persona.DespuesLocaliza(Sender);
      finally
        Free;
      end;
    end;
  except
    on e: EInterFrame do
      MessageDlg(e.Message, mtInformation, [mbOK], 0);
  end;
end;

procedure TWPersona.sbEliTelClick(Sender: TObject); // CZR 14-oct-2013
begin
  try
    if (not Persona.Active) or (Persona.Id_Persona.AsInteger <= 0) then
      raise EInterFrame.Create('No se encuentra un Persona Activa para esta Accion');
    if Persona.plvTelefonos.Items.Count = 0 then
      exit;
    if Persona.plvTelefonos.SelCount = 0 then
      raise EInterFrame.Create('Seleccione un Teléfono');
    if MessageDlg('¿Realmente desea eliminar el Teléfono seleccionado?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then begin
      RunSQL('delete tel_persona '
           + ' where id_persona      = ' + Persona.Id_Persona.AsSQL
           + '   and cve_tel_tipo    = ' + QuotedStr(Persona.plvTelefonos.Selected.Caption)
           + '   and cve_poblac_lada = ' + QuotedStr(Persona.plvTelefonos.Selected.SubItems[0])
           + '   and numero          = ' + QuotedStr(Trim(Persona.plvTelefonos.Selected.SubItems[5])),
             Persona.DataBaseName, Persona.SessionName, True);
      Persona.DespuesLocaliza(Sender);
    end;
  except
    on e: EInterFrame do
      MessageDlg(e.Message, mtInformation, [mbOK], 0);
  end;
end;

procedure TWPersona.btnAccionistaClick(Sender: TObject);
var Accionistas : TPerAcc;

begin
  if Persona.ValidaAccesoEsp('PF_SOCIAC',True,True) Then begin
    try
      if (not Persona.Active) or (Persona.Id_Persona.AsInteger <= 0) then
        raise EInterFrame.Create('No se encuentra un Persona Activa para esta Accion');
      if Persona.Num_Tot_Acciones.AsFloat = 0 then
        raise EInterFrame.Create('Ingrese el Numero Total de Acciones');
      with Accionistas do begin
        Accionistas := TPerAcc.Create(self);
        try
          GetParams(Persona);
          vIdPersonaPadre := Persona.Id_Persona.AsInteger;
          Accionistas.Catalogo;
        finally
          if Accionistas <> nil then
            Accionistas.Free; Accionistas := nil;
        end;
      end;
    except
      on e: EInterFrame do
        MessageDlg(e.Message, mtInformation, [mbOK], 0);
    end;
  end;
end;

// CZR 23-dic-2014   Solo permite captura AlfaNumerica
// #8 Key Delete
procedure TWPersona.eGIINKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['a'..'z', 'A'..'Z', '0'..'9', '.', '-', #8]) then
    Key := #0;
end;

procedure TWPersona.eCONDUSEFKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['a'..'z', 'A'..'Z', '0'..'9', #8]) then
    Key := #0;
end;

procedure TWPersona.eNoIdFiscalExtKeyPress(Sender: TObject; var Key: Char);
begin
{  if not (key in ['a'..'z', 'A'..'Z', '0'..'9', '.', '-', #8]) then
    Key := #0;}
end;

procedure TWPersona.sbCvePaisExpClick(Sender: TObject);
begin
  Persona.PaisExpedicion.Busca; // CZR 19-nov-2014
end;

procedure TWPersona.eITINKeyPress(Sender: TObject; var Key: Char);
begin
{  if not (key in ['a'..'z', 'A'..'Z', '0'..'9', '.', '-', #8]) then
    Key := #0; }
end;

procedure TWPersona.InterForma1Buscar(Sender: TObject);                        //rohs4279 feb/2016 req. PMO151201
begin
  Persona.InternalBusca;
  rgPerJuridicaClick(sender);
  tabNacRes.TabVisible := True;
  RefrescaGridNac;
end;

procedure TWpersona.Llena_combos_fatcacrs_tipopersona(pPerJur : String);       //rohs4279 feb/2016 req. PMO151201
var sql,
    sql1   : String;
    qDatos : TQuery;
    vli    : Integer;

Begin
  qDatos := TQuery.Create(nil);
  Try
    qDatos.DatabaseName := Persona.DataBaseName;
    qDatos.SessionName  := Persona.SessionName;  
    qDatos.Close;
    //Obtengo las claves de estatus fatca existentes
    sql := 'SELECT cve_estatus, ' +
                 ' desc_estatus ' +
            ' FROM fatca_estatus ' +
           ' WHERE sit_estatus = ' + Quotedstr('AC') +
             ' AND cve_per_juridica = ' + Quotedstr(pPerJur);
    if Persona.cve_estatus_fatca.AsString <> Emptystr then Begin
      sql1 := 'SELECT distinct(cve_estatus), ' +
                    ' desc_estatus ' +
               ' FROM ( ' + sql +
              ' UNION ' +
              'SELECT NVL(' + Quotedstr(Persona.cve_estatus_fatca.AsString) + ', null) as cve_estatus, ' +
                    ' NVL((SELECT desc_estatus ' +
                           ' FROM fatca_estatus ' +
                          ' WHERE cve_estatus = ' + Quotedstr(Persona.cve_estatus_fatca.AsString) +
                            ' AND cve_per_juridica = ' + Quotedstr(pPerJur) + '), null) as desc_estatus ' +
               ' FROM dual ';
      if Persona.cve_estatus_fatca.AsString <> Emptystr then
        sql1 := sql1 + ' UNION ' +
                ' SELECT null as cve_estatus, ' +
                       ' null as desc_estatus ' +
                  ' FROM DUAL ';
      sql1 := sql1 + ' ) ';
    end
    else
      sql1 := sql + ' UNION ' +
                   ' SELECT null as cve_estatus, ' +
                          ' null as desc_estatus ' +
                     ' FROM DUAL ';

    qDatos.SQL.Clear;
    qDatos.SQL.Add(sql1);
    qDatos.Open;
    pfatcacrs.Visible := False;
    if Not qDatos.Fields[0].IsNull then Begin
      qDatos.First;
      cbfatcacrs.Clear;
      While Not qDatos.Eof do Begin
        cbfatcacrs.Items.Add(qDatos.fieldbyName('desc_estatus').Asstring);
        qDatos.Next;
        Application.ProcessMessages;
      end;
      if Persona.cve_estatus_fatca.AsString = Emptystr then
        cbfatcacrs.ItemIndex := -1
      else Begin
        sql := 'SELECT desc_estatus ' +
                ' FROM fatca_estatus ' +
               ' WHERE cve_estatus = ' + Quotedstr(Persona.cve_estatus_fatca.AsString) +
                 ' AND cve_per_juridica = ' + Quotedstr(pPerJur);
        qDatos.Close;
        qDatos.SQL.Clear;
        qDatos.SQL.Add(sql);
        qDatos.Open;
        sql1 := Emptystr;
        if Not qDatos.Fields[0].IsNull then
          sql1 := qDatos.FieldByName('desc_estatus').Asstring;
        For vli := 0 to cbfatcacrs.Items.Count - 1 do
          if sql1 = cbfatcacrs.Items.Strings[vli] then Begin
            cbfatcacrs.ItemIndex := vli;
            break;
          end;
      end;
      pfatcacrs.Visible    := True;
    end;

    ptipopers.Visible := False;
    if pPerJur = 'PM' then Begin
      qDatos.Close;
      //Obtengo las claves de tipo persona existentes
      sql := 'SELECT cve_tipo_persona, ' +
                   ' desc_tipo_persona ' +
              ' FROM tipo_persona ' +
             ' WHERE sit_tipo_persona = ' + Quotedstr('AC');
      if Persona.cve_tipo_persona.AsString <> Emptystr then Begin
        sql1 := 'SELECT distinct(cve_tipo_persona), ' +
                      ' desc_tipo_persona ' +
                 ' FROM ( ' + sql +
                ' UNION ' +
                'SELECT NVL(' + Quotedstr(Persona.cve_tipo_persona.AsString) + ', null) as cve_tipo_persona, ' +
                      ' NVL((SELECT desc_tipo_persona ' +
                             ' FROM tipo_persona ' +
                            ' WHERE cve_tipo_persona = ' + Quotedstr(Persona.cve_tipo_persona.AsString) +
                            '), null) as desc_estatus ' +
                 ' FROM dual ';
        if Persona.cve_tipo_persona.AsString <> Emptystr then
          sql1 := sql1 + ' UNION ' +
                  ' SELECT null as cve_tipo_persona, ' +
                         ' null as desc_tipo_persona ' +
                    ' FROM DUAL ';
        sql1 := sql1 + ' ) ';
      end
      else
        sql1 := sql + ' UNION ' +
                     ' SELECT null as cve_tipo_persona, ' +
                            ' null as desc_tipo_persona ' +
                       ' FROM DUAL ';
      qDatos.SQL.Clear;
      qDatos.SQL.Add(sql1);
      qDatos.Open;
      if Not qDatos.Fields[0].IsNull then Begin
        qDatos.First;
        cbtipopers.Clear;
        While Not qDatos.Eof do Begin
          cbtipopers.Items.Add(qDatos.fieldbyName('desc_tipo_persona').Asstring);
          qDatos.Next;
          Application.ProcessMessages;
        end;
        if Persona.cve_tipo_persona.AsString = Emptystr then
          cbtipopers.ItemIndex := -1
        else Begin
          sql := 'SELECT desc_tipo_persona ' +
                  ' FROM tipo_persona ' +
                 ' WHERE cve_tipo_persona = ' + Quotedstr(Persona.cve_tipo_persona.AsString);
          qDatos.Close;
          qDatos.SQL.Clear;
          qDatos.SQL.Add(sql);
          qDatos.Open;
          sql1 := Emptystr;
          if Not qDatos.Fields[0].IsNull then
            sql1 := qDatos.FieldByName('desc_tipo_persona').Asstring;
          For vli := 0 to cbtipopers.Items.Count - 1 do
            if sql1 = cbtipopers.Items.Strings[vli] then Begin
              cbtipopers.ItemIndex := vli;
              break;
            end;
        end;
        ptipopers.Visible    := True;
      end;
    end;
  Finally
    qDatos.Close;
    qDatos.Free;
  end;
end;

procedure TWPersona.sbNacNueClick(Sender: TObject);                            //rohs4279 mar/2016 req. PMO151201
begin
  Persona.GetFromControl;
  Persona.PersNac.TableName := EmptyStr;
  Persona.PersNac.FKeyFields.Clear;
  Persona.PersNac.TableName    := 'PER_NACIONALIDAD';
  Persona.PersNac.FKeyFields.Add('ID_PERSONA');
  Persona.PersNac.FKeyFields.Add('CVE_NACIONALIDAD');
  Persona.PersNac.pidpersona   := Persona.Id_Persona.AsFloat;
  Persona.PersNac.pnombrepers  := Persona.Nombre.AsString;
  Persona.PersNac.ppersjur     := Persona.Cve_Per_Juridica.AsString;
  Persona.PersNac.pTipo        := 1;
  Persona.PersNac.pNom_Pers    := Persona.Nombre_Persona.AsString;
  Persona.PersNac.pApell_Pat   := Persona.Apellido_Paterno.AsString;
  Persona.PersNac.pApell_Mat   := Persona.Apellido_Materno.AsString;
  Persona.PersNac.pNom_Raz_Soc := Persona.Nom_Razon_Social.AsString;
  if Trim(Persona.Cve_Per_Juridica.AsString) = 'PF' then
    Persona.PersNac.pFechaRFC := Persona.F_Nacimiento.AsDateTime
  else
    Persona.PersNac.pFechaRFC := Persona.F_Contstitucion.AsDateTime;
  Persona.PersNac.pFechaNac   := Persona.F_Nacimiento.AsDateTime;
  Persona.PersNac.pFechaConst := Persona.F_Contstitucion.AsDateTime;
  Persona.PersNac.Nuevo;
  RefrescaGridNac;
end;

procedure TWPersona.sbNacModClick(Sender: TObject);                            //rohs4279 mar/2016 req. PMO151201
begin
  if qNac.RecordCount = 0 then
    Exit;
  Persona.GetFromControl;
  Persona.PersNac.TableName := EmptyStr;
  Persona.PersNac.FKeyFields.Clear;
  Persona.PersNac.TableName := 'PER_NACIONALIDAD';
  Persona.PersNac.FKeyFields.Add('ID_PERSONA');
  Persona.PersNac.FKeyFields.Add('CVE_NACIONALIDAD');
  if Persona.PersNac.FindKey([Persona.Id_Persona.AsFloat,
                              qNac.fieldByName('cve_nacionalidad').Asstring]) then begin
    Persona.PersNac.pidpersona  := Persona.Id_Persona.AsFloat;
    Persona.PersNac.pnombrepers := Persona.Nombre.AsString;
    Persona.PersNac.pNac        := qNac.fieldByName('cve_nacionalidad').Asstring;
    Persona.PersNac.ppersjur    := Persona.Cve_Per_Juridica.AsString;
    if qNac.FieldByName('b_default').AsString = 'X' then
      Persona.PersNac.pbdefault   := 'V' //qNac.FieldByName('b_default').AsString;
    else
      Persona.PersNac.pbdefault   := 'F';
    Persona.PersNac.psit        := qNac.FieldByName('sit_nacionalidad').AsString;
    Persona.PersNac.pPaisExp    := qNac.FieldbyName('cve_pais_expedicion').AsString;
    Persona.PersNac.pTipo       := 1;
    Persona.PersNac.pNom_Pers    := Persona.Nombre_Persona.AsString;
    Persona.PersNac.pApell_Pat   := Persona.Apellido_Paterno.AsString;
    Persona.PersNac.pApell_Mat   := Persona.Apellido_Materno.AsString;
    Persona.PersNac.pNom_Raz_Soc := Persona.Nom_Razon_Social.AsString;
    if Trim(Persona.Cve_Per_Juridica.AsString) = 'PF' then
      Persona.PersNac.pFechaRFC := Persona.F_Nacimiento.AsDateTime
    else
      Persona.PersNac.pFechaRFC := Persona.F_Contstitucion.AsDateTime;
    Persona.PersNac.pFechaNac   := Persona.F_Nacimiento.AsDateTime;
    Persona.PersNac.pFechaConst := Persona.F_Contstitucion.AsDateTime;
    Persona.PersNac.Modifica;
    RefrescaGridNac;
  end;
end;

procedure TWPersona.RefrescaGridNac;                                           //rohs4279 mar/2016 req. PMO151201
var sql : String;

Begin
  if Persona.Id_Persona.AsString <> Emptystr then Begin //Nacionalidad
    sql := 'SELECT a.cve_nacionalidad, ' +
                 ' b.desc_poblacion, ' +
                 ' DECODE(c.id_fiscal, null, ' + Quotedstr(EmptyStr) + ', ' + Quotedstr('X') + ') as cta_idfiscal, ' +
                 ' c.id_fiscal, ' +
                 ' NVL((SELECT etiqueta_id_fiscal ' +
                        ' FROM per_id_fiscal_config ' +
                       ' WHERE cve_per_juridica = ' + Quotedstr(Persona.Cve_Per_Juridica.AsString) +
                         ' AND cve_pais = a.cve_nacionalidad), ' +
                     ' NVL((SELECT etiqueta_id_fiscal ' +
                            ' FROM per_id_fiscal_config ' +
                           ' WHERE cve_per_juridica = ' + Quotedstr('AM') +
                             ' AND cve_pais = a.cve_nacionalidad), ' +
                         ' (SELECT etiqueta_id_fiscal ' +
                            ' FROM per_id_fiscal_config ' +
                           ' WHERE cve_per_juridica = ' + Quotedstr('AM') +
                             ' AND cve_pais = ' + Quotedstr('PAOTRO') + '))) tipo, ' +
                 ' c.cve_pais_expedicion, ' +
                 ' NVL((SELECT desc_poblacion ' +
                        ' FROM poblacion ' +
                       ' WHERE cve_poblacion = c.cve_pais_expedicion), null) desc_pais_exp, ' +
                 ' c.cve_motivo, ' +
                 ' NVL((SELECT desc_motivo ' +
                        ' FROM motivo_no_id_fiscal ' +
                       ' WHERE cve_motivo = c.cve_motivo), null) desc_motivo, ' +
                 ' SUBSTR(c.tx_motivo, 1, 200) as tx_motivo, ' +
                 ' a.sit_nacionalidad, ' +
                 ' DECODE(a.b_default, ' + Quotedstr('V') + ', ' + Quotedstr('X') + ', ' +
                                           Quotedstr('') + ') as b_default ' +
            ' FROM per_nacionalidad a, ' +
                 ' poblacion b, ' +
                 ' per_id_fiscal c ' +
           ' WHERE b.cve_poblacion = a.cve_nacionalidad ' +
             ' AND c.id_persona(+) = a.id_persona ' +
             ' AND c.cve_pais(+) = a.cve_nacionalidad ' +
             ' AND a.id_persona = ' + Persona.Id_Persona.AsSQL +
           ' ORDER BY 12, 11, 1 ';
    qNac.Close;
    qNac.SQL.Clear;
    qNac.SQL.Add(sql);
    qNac.Open;

    qRes.Close; //Residencia
    sql := 'SELECT a.cve_residencia, ' +
                 ' b.desc_poblacion, ' +
                 ' DECODE(c.id_fiscal, null, ' + Quotedstr(EmptyStr) + ', ' + Quotedstr('X') + ') as cta_idfiscal, ' +
                 ' c.id_fiscal, ' +
                 ' NVL((SELECT etiqueta_id_fiscal ' +
                        ' FROM per_id_fiscal_config ' +
                       ' WHERE cve_per_juridica = ' + Quotedstr(Persona.Cve_Per_Juridica.AsString) +
                         ' AND cve_pais = a.cve_residencia), ' +
                     ' NVL((SELECT etiqueta_id_fiscal ' +
                            ' FROM per_id_fiscal_config ' +
                           ' WHERE cve_per_juridica = ' + Quotedstr('AM') +
                             ' AND cve_pais = a.cve_residencia), ' +
                         ' (SELECT etiqueta_id_fiscal ' +
                            ' FROM per_id_fiscal_config ' +
                           ' WHERE cve_per_juridica = ' + Quotedstr('AM') +
                             ' AND cve_pais = ' + Quotedstr('PAOTRO') + '))) tipo, ' +
                 ' c.cve_pais_expedicion, ' +
                 ' NVL((SELECT desc_poblacion ' +
                        ' FROM poblacion ' +
                       ' WHERE cve_poblacion = c.cve_pais_expedicion), null) desc_pais_exp, ' +
                 ' c.cve_motivo, ' +
                 ' NVL((SELECT desc_motivo ' +
                        ' FROM motivo_no_id_fiscal ' +
                       ' WHERE cve_motivo = c.cve_motivo), null) desc_motivo, ' +
                 ' SUBSTR(c.tx_motivo, 1, 200) as tx_motivo, ' +
                 ' a.sit_residencia, ' +
                 ' DECODE(a.b_default, ' + Quotedstr('V') + ', ' + Quotedstr('X') + ', ' +
                                           Quotedstr('') + ') as b_default ' +
            ' FROM per_residencia a, ' +
                 ' poblacion b, ' +
                 ' per_id_fiscal c ' +
           ' WHERE b.cve_poblacion = a.cve_residencia ' +
             ' AND c.id_persona(+) = a.id_persona ' +
             ' AND c.cve_pais(+) = a.cve_residencia ' +
             ' AND a.id_persona = ' + Persona.Id_Persona.AsString +
           ' ORDER by 12, 11, 1 ';
    qRes.SQL.Clear;
    qRes.SQL.Add(sql);
    qRes.Open;
  end;
end;

procedure TWPersona.sbResNueClick(Sender: TObject);                            //rohs4279 mar/2016 req. PMO151201
begin
  Persona.GetFromControl;
  Persona.PersNac.TableName := EmptyStr;
  Persona.PersNac.FKeyFields.Clear;
  Persona.PersNac.TableName := 'PER_RESIDENCIA';
  Persona.PersNac.FKeyFields.Add('ID_PERSONA');
  Persona.PersNac.FKeyFields.Add('CVE_RESIDENCIA');
  Persona.PersNac.pidpersona   := Persona.Id_Persona.AsFloat;
  Persona.PersNac.pnombrepers  := Persona.Nombre.AsString;
  Persona.PersNac.ppersjur     := Persona.Cve_Per_Juridica.AsString;
  Persona.PersNac.pTipo        := 2;
  Persona.PersNac.pNom_Pers    := Persona.Nombre_Persona.AsString;
  Persona.PersNac.pApell_Pat   := Persona.Apellido_Paterno.AsString;
  Persona.PersNac.pApell_Mat   := Persona.Apellido_Materno.AsString;
  Persona.PersNac.pNom_Raz_Soc := Persona.Nom_Razon_Social.AsString;
  if Trim(Persona.Cve_Per_Juridica.AsString) = 'PF' then
    Persona.PersNac.pFechaRFC := Persona.F_Nacimiento.AsDateTime
  else
    Persona.PersNac.pFechaRFC := Persona.F_Contstitucion.AsDateTime;
  Persona.PersNac.pFechaNac   := Persona.F_Nacimiento.AsDateTime;
  Persona.PersNac.pFechaConst := Persona.F_Contstitucion.AsDateTime;
  Persona.PersNac.Nuevo;
  RefrescaGridNac;
end;

procedure TWPersona.sbResModClick(Sender: TObject);                            //rohs4279 mar/2016 req. PMO151201
begin
  if qRes.RecordCount = 0 then
    Exit;
  Persona.GetFromControl;
  Persona.PersNac.TableName := EmptyStr;
  Persona.PersNac.FKeyFields.Clear;
  Persona.PersNac.TableName := 'PER_RESIDENCIA';
  Persona.PersNac.FKeyFields.Add('ID_PERSONA');
  Persona.PersNac.FKeyFields.Add('CVE_RESIDENCIA');
  if Persona.PersNac.FindKey([Persona.Id_Persona.AsFloat,
                              qRes.fieldByName('cve_residencia').Asstring]) then begin
    Persona.PersNac.pidpersona  := Persona.Id_Persona.AsFloat;
    Persona.PersNac.pnombrepers := Persona.Nombre.AsString;
    Persona.PersNac.pNac        := qRes.fieldByName('cve_residencia').Asstring;
    Persona.PersNac.ppersjur    := Persona.Cve_Per_Juridica.AsString;
    if qRes.FieldByName('b_default').AsString = 'X' then
      Persona.PersNac.pbdefault   := 'V' //qRes.FieldByName('b_default').AsString;
    else
      Persona.PersNac.pbdefault   := 'F';
    Persona.PersNac.psit         := qRes.FieldByName('sit_residencia').AsString;
    Persona.PersNac.pPaisExp     := qRes.FieldbyName('cve_pais_expedicion').AsString;
    Persona.PersNac.pTipo        := 2;
    Persona.PersNac.pNom_Pers    := Persona.Nombre_Persona.AsString;
    Persona.PersNac.pApell_Pat   := Persona.Apellido_Paterno.AsString;
    Persona.PersNac.pApell_Mat   := Persona.Apellido_Materno.AsString;
    Persona.PersNac.pNom_Raz_Soc := Persona.Nom_Razon_Social.AsString;
    if Trim(Persona.Cve_Per_Juridica.AsString) = 'PF' then
      Persona.PersNac.pFechaRFC := Persona.F_Nacimiento.AsDateTime
    else
      Persona.PersNac.pFechaRFC := Persona.F_Contstitucion.AsDateTime;
    Persona.PersNac.pFechaNac   := Persona.F_Nacimiento.AsDateTime;
    Persona.PersNac.pFechaConst := Persona.F_Contstitucion.AsDateTime;
    Persona.PersNac.Modifica;
    RefrescaGridNac;
  end;
end;

procedure TWPersona.dbgNacDrawColumnCell(Sender: TObject;                      //rohs4279 mar/2016 req. PMO151201
                                         const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if qNac.FieldByName('sit_nacionalidad').AsString = 'AC' then Begin
    if qNac.FieldByName('b_default').Asstring = 'X' then
      dbgNac.Canvas.Font.Color := clBlue
    else
      dbgNac.Canvas.Font.Color := clBlack;
  end
  else
    dbgNac.Canvas.Font.Color := clRed;
  dbgNac.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TWPersona.dbgResDrawColumnCell(Sender: TObject;                      //rohs4279 mar/2016 req. PMO151201
                                         const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if qres.FieldByName('sit_residencia').AsString = 'AC' then Begin
    if qRes.FieldByName('b_default').AsString = 'X' then
      dbgRes.Canvas.Font.Color := clBlue
    else
      dbgRes.Canvas.Font.Color := clBlack;
  end
  else
    dbgRes.Canvas.Font.Color := clRed;
  dbgRes.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TWPersona.cbtipopersKeyPress(Sender: TObject; var Key: Char);        //rohs4279 mar/2016 req. PMO151201
begin
  Key := #0
end;

procedure TWPersona.cbfatcacrsKeyPress(Sender: TObject; var Key: Char);        //rohs4279 mar/2016 req. PMO151201
begin
  Key := #0;
end;

end.
