// Sistema         : Clase de CR_CREDITO
// Fecha de Inicio : 17/06/2003
// Función forma   : Clase de CR_CREDITO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
// Comentarios     : 17 AGO 2006. CREDITO EN LINEA
Unit IntCrCredito;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit, Grids,
Aligrid, Menus, IntBasicCred,

//Unidades Adicionales
    IntCrCto,               IntPers,            IntCrCalcInt,           IntCrAmortiz,
    IntCrPagInt,            IntCrLiqDis,        IntMPers,               IntParamCre,
    IntCtoPanel,            IntGenCre,          IntTasIndFin,           IntCrMotRech,
    IntCrGenCuot,           IntCrUniTie,        IntMRecTra,             intCrAcredit,
    IntCrProduct,           IntMFiraCto,        ToolWin,                IntCrDatCoCr,
    IntMDispFond
// ASTECI.hegc   15 ABRIL 2010 Se ANEXA PANTALLA DE CONFIGURACION DE MORAS
    ,
    IntCrConfMor, OleServer
// hegc
// RABA OCT 2013 PROYECTO CAMBIO TASA
   ,
   IntCrCamTasM
// FIN RABA
    ;
Const
   COL_COM = 0; //Descripción de Comisión
   COL_PCT = 1; //Porcentaje
   COL_IMP = 2; //Importe
Type
 TCrCredito= class;

  TWCrCredito=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CREDITO : TLabel;
    edID_CREDITO : TEdit;
    icpCONTRATO: TInterCtoPanel;
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
    ilCALINT: TInterLinkit;
    ilPAGINT: TInterLinkit;
    ilTIPAMORT: TInterLinkit;
    ilTIPLIQ: TInterLinkit;
    ilIDCONTRATO: TInterLinkit;
    ilTASA_REFER: TInterLinkit;
    lbID_CONTRATO: TLabel;
    iedID_CONTRATO: TInterEdit;
    btCONTRATO: TBitBtn;
    edCVE_PRODUCTO: TEdit;
    edDESC_PRODUCTO: TEdit;
    lbSITUACION: TLabel;
    lbSIT_CREDITO: TLabel;
    lbCVE_LIQUIDACION: TLabel;
    edCVE_LIQUIDACION: TEdit;
    btTIPO_LIQ: TBitBtn;
    edDESC_TIPO_LIQ: TEdit;
    lbID_PROM_ADM: TLabel;
    edID_PROM_ADM: TEdit;
    edNOMBRE_PROM_ADM: TEdit;
    Label22: TLabel;
    lbDIAS_PLAZO: TLabel;
    Label26: TLabel;
    edF_INICIO: TEdit;
    edDIAS_PLAZO: TInterEdit;
    edF_VENCIMIENTO: TEdit;
    dtpF_INICIO: TInterDateTimePicker;
    btDIASPLAZO: TBitBtn;
    dtpF_VENCIMIENTO: TInterDateTimePicker;
    lbIMP_CREDITO: TLabel;
    Label18: TLabel;
    Label24: TLabel;
    edIMP_CREDITO: TInterEdit;
    edIMP_MINISTRADO: TInterEdit;
    edIMP_DISPONIBLE: TInterEdit;
    Label12: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    iedDISPONIBLE_ACRED: TInterEdit;
    iedIMP_DISP_GPO: TInterEdit;
    iedDISPONIBLE_AUT: TInterEdit;
    Bevel1: TBevel;
    Bevel4: TBevel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    lbF_LIQUIDACION: TLabel;
    edF_LIQUIDACION: TEdit;
    lbIMP_DISPUESTO: TLabel;
    edIMP_DISPUESTO: TInterEdit;
    lbF_TRASPASO_VENC: TLabel;
    edF_TRASPASO_VENC: TEdit;
    chB_APLICA_IVA: TCheckBox;
    chB_FINANC_ADIC: TCheckBox;
    chB_APLICA_COM: TCheckBox;
    Label27: TLabel;
    edPCT_COMISION: TInterEdit;
    Label28: TLabel;
    edIMP_COMISION: TInterEdit;
    lbCVE_CALIF_CRE: TLabel;
    edCVE_CALIF_CRE: TEdit;
    Label29: TLabel;
    meTX_COMENTARIO: TMemo;
    Label3: TLabel;
    Label11: TLabel;
    edID_CRED_EXTERNO: TInterEdit;
    edID_CONTROL_EXT: TInterEdit;
    lbCVE_CALCULO: TLabel;
    edCVE_CALCULO: TEdit;
    btCALC_INT: TBitBtn;
    edDESC_CALC_INT: TEdit;
    lbFACT_MORAS: TLabel;
    edFACT_MORAS: TInterEdit;
    lbCVE_TASA_REFER: TLabel;
    edCVE_TASA_REFER: TEdit;
    btTASA_REFER: TBitBtn;
    edDESC_TASA_REFER: TEdit;
    Label6: TLabel;
    edVALOR_TASA: TInterEdit;
    lbOPERADOR_STASA: TLabel;
    cbOPERADOR_STASA: TEdit;
    Label9: TLabel;
    edSOBRETASA: TInterEdit;
    lbTASA_CREDITO: TLabel;
    edTASA_CREDITO: TInterEdit;
    Label15: TLabel;
    cbUNIDAD_TIEMPO_RE: TEdit;
    bbUNIDAD_TIEMPO_RE: TBitBtn;
    Label16: TLabel;
    edNUM_UNIDADES_RE: TInterEdit;
    Label17: TLabel;
    cbDIA_REVISION: TEdit;
    Label21: TLabel;
    edF_PROX_REVISION: TEdit;
    dtpF_PROX_REVISION: TInterDateTimePicker;
    Bevel5: TBevel;
    lbCVE_AMORTIZACION: TLabel;
    edCVE_AMORTIZACION: TEdit;
    btTIPO_AMORT: TBitBtn;
    edDESC_TIPO_AMORT: TEdit;
    Label4: TLabel;
    cbUNIDAD_TIEMPO_CP: TEdit;
    bbUNIDAD_TIEMPO_CP: TBitBtn;
    Label19: TLabel;
    edNUM_UNIDADES_CP: TInterEdit;
    Label5: TLabel;
    cbDIA_PAGO_CAP: TEdit;
    Label13: TLabel;
    edF_INI_PAG_CAP: TEdit;
    lbCVE_PAG_INTERES: TLabel;
    edCVE_PAG_INTERES: TEdit;
    btPAGO_INT: TBitBtn;
    edDESC_PAGO_INT: TEdit;
    Label7: TLabel;
    cbUNIDAD_TIEMPO_IN: TEdit;
    bbUNIDAD_TIEMPO_IN: TBitBtn;
    Label20: TLabel;
    edNUM_UNIDADES_IN: TInterEdit;
    Label8: TLabel;
    cbDIA_PAGO_INT: TEdit;
    Label14: TLabel;
    edF_INI_PAG_INT: TEdit;
    dtpF_INI_PAG_INT: TInterDateTimePicker;
    dtpF_INI_PAG_CAP: TInterDateTimePicker;
    pmAcreditado: TPopupMenu;
    ConsultaSectorPersona1: TMenuItem;
    CatlogodePersona1: TMenuItem;
    AcessoaProducto: TMenuItem;
    Autorizaciones1: TMenuItem;
    btCVE_OPERATIVA: TBitBtn;
    Label31: TLabel;
    edNOM_CVE_OPERATIVA: TEdit;
    cbTIPO_TASA: TComboBox;
    Label10: TLabel;
    pmTASAS: TPopupMenu;
    DatosAdicionalesaTasas1: TMenuItem;
    MainMenu1: TMainMenu;
    dispo1: TMenuItem;
    Rechazos1: TMenuItem;
    Consulta1: TMenuItem;
    Rechazar1: TMenuItem;
    Reactivar1: TMenuItem;
    N5: TMenuItem;
    AdministracinTasas1: TMenuItem;
    N4: TMenuItem;
    Comisiones1: TMenuItem;
    N3: TMenuItem;
    Seguros2: TMenuItem;
    Garantas2: TMenuItem;
    N2: TMenuItem;
    Documentacin2: TMenuItem;
    N1: TMenuItem;
    DatosComplementarios1: TMenuItem;
    A1: TMenuItem;
    PersonaCorporativa1: TMenuItem;
    ProductodeCrdito1: TMenuItem;
    Autorizacin1: TMenuItem;
    Impresin1: TMenuItem;
    Cuotas1: TMenuItem;
    Agronegocios1: TMenuItem;
    Procampo1: TMenuItem;
    SIEBAN1: TMenuItem;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    btCANCELA: TBitBtn;
    BitBtn1: TBitBtn;
    lbUSUA_ALTA: TLabel;
    lbF_ALTA: TLabel;
    edCVE_USUA_ALTA: TEdit;
    edF_ALTA: TEdit;
    lbUSUA_MODIF: TLabel;
    lbF_MODIF: TLabel;
    edCVE_USUA_MODIF: TEdit;
    edF_MODIF: TEdit;
    lbUSUA_AUTOR: TLabel;
    lbF_AUTOR: TLabel;
    edCVE_USUA_AUTOR: TEdit;
    edF_AUTOR: TEdit;
    edID_CRE_RENUEVA: TEdit;
    edID_CRE_RENOVADO: TEdit;
    btAUTORIZA: TBitBtn;
    Redescuento1: TMenuItem;
    Redescuento2: TMenuItem;
    RenovReest1: TMenuItem;
    RenvacinReestructuracin1: TMenuItem;
    lbTIPO_CREDITO: TLabel;
    Label23: TLabel;
    edCVE_GPO_CAPITALIZ: TEdit;
    Label25: TLabel;
    ConvenioModificatorio1: TMenuItem;
    btTX_XOMENTARIOS: TBitBtn;
    edNUM_FOL_FIDEICOM: TInterEdit;
    edPCT_CAPITALIZA: TEdit;
    Chequeras: TMenuItem;
    GarantiaNafin1: TMenuItem;
    N6: TMenuItem;
    Label30: TLabel;
    edF_RESTRINGIDO: TEdit;
    dtpF_RESTRINGIDO: TInterDateTimePicker;
    lbCVE_PER_JUR_REG: TLabel;
    edCVE_TIPO_BAJA: TEdit;
    btCVE_TIPO_BAJA: TBitBtn;
    edDESC_TIPO_BAJA: TEdit;
    N7: TMenuItem;
    TipoLiquidacin1: TMenuItem;
    ilCVE_TIPO_BAJA: TInterLinkit;
    M1: TMenuItem;
    pmOperativa: TPopupMenu;
    EliminarOperativa1: TMenuItem;
    Label32: TLabel;
    lb_Credescto: TLabel;
    edNoSolDisp: TEdit;
    lbNoSolDisp: TLabel;
    edTIPO_RENUEVA: TEdit;  // RABA 09 JUN 2011  PARA VALIDAR SI EL CREDITO ESTA EN UN PROCESO DE REESTRUCTURA
    cbCVE_CALIDAD_GTIA: TComboBox;
    Label33: TLabel;
    btValidaRSRE: TBitBtn;
    CambiodeTasa1: TMenuItem;
    chB_INT_DIASIG: TCheckBox;
    ObligadoSolidario1: TMenuItem;
    edTIPO_CARTERA: TEdit;
    //--- ASOR --- ABRIL 2016 ---
    DtpF_FIN_PERGRA_FA: TInterDateTimePicker;
    EdF_FIN_PERGRA_FA: TEdit;
    LbF_FIN_PERGRA_FA: TLabel;
    //--- FIN ---
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btCONTRATOClick(Sender: TObject);
    procedure iedID_CONTRATOExit(Sender: TObject);
//    procedure chB_COB_AUTExit(Sender: TObject);
//    procedure chB_GENERA_EDOCTAExit(Sender: TObject);
//    procedure chB_REFERENCIADOExit(Sender: TObject);
    procedure chB_APLICA_IVAExit(Sender: TObject);
    procedure chB_APLICA_COMExit(Sender: TObject);
//    procedure chB_ENVIA_BNCExit(Sender: TObject);
    procedure edCVE_CALCULOExit(Sender: TObject);
    procedure btCALC_INTClick(Sender: TObject);
    procedure ilCALINTEjecuta(Sender: TObject);
    procedure edCVE_AMORTIZACIONExit(Sender: TObject);
    procedure btTIPO_AMORTClick(Sender: TObject);
    procedure ilTIPAMORTEjecuta(Sender: TObject);
    procedure edCVE_PAG_INTERESExit(Sender: TObject);
    procedure btPAGO_INTClick(Sender: TObject);
    procedure ilPAGINTEjecuta(Sender: TObject);
    procedure edCVE_LIQUIDACIONExit(Sender: TObject);
    procedure btTIPO_LIQClick(Sender: TObject);
    procedure ilTIPLIQEjecuta(Sender: TObject);
    procedure edFACT_MORASExit(Sender: TObject);
    procedure edIMP_CREDITOExit(Sender: TObject);
    procedure edIMP_DISPUESTOExit(Sender: TObject);
    procedure edCVE_CALIF_CREExit(Sender: TObject);
//    procedure edID_PROM_ADMExit(Sender: TObject);
//    procedure btPROM_ADMClick(Sender: TObject); EASA 09.MAR.2007 >/ }
    procedure edDIAS_PLAZOExit(Sender: TObject);
//    procedure ilPROMADMEjecuta(Sender: TObject); EASA 09.MAR.2007 >/ }
    procedure ilIDCONTRATOEjecuta(Sender: TObject);
    Function  VentanaCalculo(pDato : String): string;
    procedure btDIASPLAZOClick(Sender: TObject);
//    procedure btCICLO_REVISIONClick(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure edTASA_CREDITOExit(Sender: TObject);
    procedure btTASA_REFERExit(Sender: TObject);
    procedure cbOPERADOR_STASAExit(Sender: TObject);
    procedure edSOBRETASAExit(Sender: TObject);
    procedure btTASA_REFERClick(Sender: TObject);
    procedure ilTASA_REFEREjecuta(Sender: TObject);
    procedure edF_INICIOExit(Sender: TObject);
    procedure edF_VENCIMIENTOExit(Sender: TObject);
    procedure edPCT_COMISIONExit(Sender: TObject);
    procedure chB_APLICA_COMEnter(Sender: TObject);
    procedure chB_APLICA_COMClick(Sender: TObject);
    procedure chB_FINANC_ADICExit(Sender: TObject);
    procedure meTX_COMENTARIOExit(Sender: TObject);
    procedure edID_CRED_EXTERNOExit(Sender: TObject);
    procedure cbNUM_UNIDADES_REExit(Sender: TObject);
    procedure cbDIA_REVISIONExit(Sender: TObject);
    procedure edF_PROX_REVISIONExit(Sender: TObject);
    procedure cbNUM_UNIDADES_CPExit(Sender: TObject);
    procedure cbDIA_PAGO_CAPExit(Sender: TObject);
    procedure edF_INI_PAG_CAPExit(Sender: TObject);
    procedure cbNUM_UNIDADES_INExit(Sender: TObject);
    procedure cbDIA_PAGO_INTExit(Sender: TObject);
    procedure edF_INI_PAG_INTExit(Sender: TObject);
    procedure edNUM_UNIDADES_REExit(Sender: TObject);
    procedure edNUM_UNIDADES_CPExit(Sender: TObject);
    procedure edNUM_UNIDADES_INExit(Sender: TObject);
    procedure edID_CONTROL_EXTExit(Sender: TObject);
    procedure bbUNIDAD_TIEMPO_REClick(Sender: TObject);
    procedure bbUNIDAD_TIEMPO_CPClick(Sender: TObject);
    procedure bbUNIDAD_TIEMPO_INClick(Sender: TObject);
    procedure bbUNIDAD_TIEMPO_REExit(Sender: TObject);
    procedure bbUNIDAD_TIEMPO_CPExit(Sender: TObject);
    procedure bbUNIDAD_TIEMPO_INExit(Sender: TObject);
    procedure cbDIA_REVISIONKeyPress(Sender: TObject; var Key: Char);
    procedure cbOPERADOR_STASAKeyPress(Sender: TObject; var Key: Char);
    procedure ConsultaSectorPersona1Click(Sender: TObject);
    procedure CatlogodePersona1Click(Sender: TObject);
    procedure AcessoaProductoClick(Sender: TObject);
    procedure Autorizaciones1Click(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btCVE_OPERATIVAClick(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure DatosAdicionalesaTasas1Click(Sender: TObject);
    procedure cbTIPO_TASAExit(Sender: TObject);
    procedure Consulta1Click(Sender: TObject);
    procedure btAUTORIZAClick(Sender: TObject);
    procedure btCANCELAClick(Sender: TObject);
    procedure Rechazar1Click(Sender: TObject);
    procedure Reactivar1Click(Sender: TObject);
    procedure Impresin1Click(Sender: TObject);
    procedure Procampo1Click(Sender: TObject);
    procedure SIEBAN1Click(Sender: TObject);
    procedure Garantas2Click(Sender: TObject);
    procedure Documentacin2Click(Sender: TObject);
    procedure Seguros2Click(Sender: TObject);
    procedure Cuotas1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Redescuento2Click(Sender: TObject);
    procedure RenvacinReestructuracin1Click(Sender: TObject);
    procedure Comisiones1Click(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure AdministracinTasas1Click(Sender: TObject);
    procedure edNUM_FOL_FIDEICOMExit(Sender: TObject);
    procedure btTX_XOMENTARIOSClick(Sender: TObject);
    procedure ChequerasClick(Sender: TObject);
    procedure GarantiaNafin1Click(Sender: TObject);
    procedure cbDIA_PAGO_CAPEnter(Sender: TObject);
    procedure cbDIA_PAGO_INTEnter(Sender: TObject);
    procedure btCVE_TIPO_BAJAClick(Sender: TObject);
    procedure edCVE_TIPO_BAJAExit(Sender: TObject);
    procedure edF_RESTRINGIDOExit(Sender: TObject);
    procedure TipoLiquidacin1Click(Sender: TObject);
    procedure ilCVE_TIPO_BAJAEjecuta(Sender: TObject);
    procedure EliminarOperativa1Click(Sender: TObject);
	procedure M1Click(Sender: TObject);
    procedure cbCVE_CALIDAD_GTIAExit(Sender: TObject);
    procedure edID_CREDITOChange(Sender: TObject);
    procedure btValidaRSREClick(Sender: TObject);
    procedure CambiodeTasa1Click(Sender: TObject);
    procedure chB_INT_DIASIGExit(Sender: TObject);

    // nuevos procedimientos
    procedure EdF_FIN_PERGRA_FAExit(Sender: TObject);
    procedure chB_FINANC_ADICClick(Sender: TObject);
    procedure DtpF_FIN_PERGRA_FAExit(Sender: TObject);
    //
    private
    { Private declarations }
       vgMotivo    : String;
       vgCambio    : Boolean;
       vgImpMaxAut : Double;
       vgSTant     : Double;
       //<LOLS 15 ENE 2005.GUARDA EL DIA DE PAGO QUE TIENE EL CONTROL PARA LLAMAR LA RUTINA DE ACTUALIZACION SOLO SI ESTE CAMBIA>
       vgDiaPago   : Integer;
       //</LOLS >

//       procedure InsertaCalificacion;
       Procedure VerificaTasaRefer;
       Procedure AplicaComision;
       Function  CalculaFecha : TDateTime;
       Procedure VerPagoCap;
       Procedure AsignaPagoCap;
       Procedure VerPagoInt;
       Procedure AsignaPagoInt;
       Procedure DeshabilitaBotonesXSit;
       Function  AltaMotivo: Boolean;
       function  ValorTasa(pTasa: String): String;
       Procedure ValidaUsuario;
       function  ValUnidadTiemp(pCveUniTiemp : String; pPlazo: Integer; Var pMensaje : String): Boolean;
       function  ValNumUnidades(pNumUnidades, peNumdiasMax, pPlazo: Integer; Var pMensaje : String): Boolean;
//       Function  FindComis: Boolean;
       Procedure ValorTasaCred;
       Procedure AjustaControles(PPTipoMovto : String; PPTipoEvento : String);
       Procedure ClassComisProg;
       Procedure AsignaDatosRR(PPIDCredito : String);
       Procedure ClassAdmonTasa;
       Function  FindCredOrigen : Boolean;
       Procedure ShowChequera(pAlta:Boolean);
       Procedure ActivaControlesAmortizacion(peBActiva : Boolean); // SATV4766
       Procedure AsignaValoresPagoEquivalente; // SATV4766
       Procedure TipoPagoAUsar; // SATV4766
       Procedure ActualizaValoresPagoEquivalente; // SATV4766
       Function  ValidaGarantia : String; //RIRA4281 21Oct10
       Function  ValidaTipoRenueva : Integer;  // RABA 09 JUN 2011
       Procedure RevisaAutRedescuento;  // RABA SEP 2011
       procedure MuestraValidaRSRE;
       procedure ClassCambioTasa;       // RABA OCT 2013
       Function HayVencidos(Folio_grupo :String): Boolean;  // RABA OCT 2014
       Procedure EvaluaNuevaDisp;  // RABA OCT 2014
       Procedure CambiaFechaFA;  // --- ASOR -- MAYO 2016 -- VALIDACION DE LA FECHA FIN DE PERIODO DE GRACIA DE F.A. DIA INHABIL ---
    public
    { Public declarations }
    Objeto : TCrCredito;
end;
 TCrCredito= class(TInterFrame)
      private
      protected
      public
        vgCanSieban: Boolean;
        vgModTasa: Boolean;
        vgComision: Boolean;
        //</SST>
        //03 MAYO 2011 Variables para los datos provenientes del monitor Web
        vgIdSolWeb: Integer;
        vgIdContratoWeb: Integer;
        vgFInicioWeb: TDateTime;
        vgPlazoWeb: Integer;
        vgFTerminoWeb: TDateTime;
        vgImporteWeb: Double;
        vgComDispWeb: Double;
        //<SST/>
        //<RABA>
        // SEP 2013 Se agrega variable global para identificar la procedencia de la solicitud web
        // Integración de O17
        vgCveMedio: String;
        //</RABA>
        // </ ASTECI:AARJ >
        // 15 FEB 2010  Se agrega variable global para identificar Operacion Eventual LC
        // con esta variable se podrá distinguir cuando una operación por DI (disposición)
        // es por una operación normal y cuando la operación DI se genera por la Op. Ev. LC
        // la asignación VG_OpEv_LC := True se da en IntCrResRee , en esta unidad solo se
        // asigna VG_OpEv_LC := False
        VG_OpEv_LC : Boolean;
        // < ASTECI:AARJ />

        //< RABA OCT 2014 ACTUALIZACIÓN B-6 >
        // Se agrega variable global para identificar NUEVAS DISPOSICIONES que deben nacer
        // como RENOVACIONES y que deberan calificarse como VIGENTES O VENCIDAS
        // si esta variable vgDispRen=True, se entiende que se trata de una renovación
        // pero no hay créditos activos involucrados, solo se trata de una nueva disposición
        // que se calificará como renovación
        vgDispRen : Boolean;
        vgNewDispVenc : Boolean;

        //nueva variable global para controlar los grupos de reestructuras cuando se requiere
        //dividir en varias un evento de reestructura
        vgFolSecuencia: Integer;
        //</RABA>

        { Public declarations }
        ID_CREDITO               : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        FOL_CONTRATO             : TInterCampo;
        B_COB_AUT                : TInterCampo;
        B_APLICA_COM             : TInterCampo;
        B_APLICA_IVA             : TInterCampo;
        B_GENERA_EDOCTA          : TInterCampo;
        B_REFERENCIADO           : TInterCampo;
        CVE_CALCULO              : TInterCampo;
        CVE_AMORTIZACION         : TInterCampo;
        CVE_PAG_INTERES          : TInterCampo;
        CVE_LIQUIDACION          : TInterCampo;
        CVE_TASA_REFER           : TInterCampo;
        OPERADOR_STASA           : TInterCampo;
        SOBRETASA                : TInterCampo;
        TASA_CREDITO             : TInterCampo;
//        CICLO_REVISION           : TInterCampo;
        DIAS_PLAZO               : TInterCampo;
        F_LIQUIDACION            : TInterCampo;
        FACT_MORAS               : TInterCampo;
        FACT_PROPOR_GAR          : TInterCampo;
        F_TRASPASO_VENC          : TInterCampo;
        ID_CRE_RENOVADO          : TInterCampo;
        ID_CRE_RENUEVA           : TInterCampo;
        TIPO_DISPOSICION         : TInterCampo;
        B_ENVIA_BNC              : TInterCampo;
        ID_PROM_ADM              : TInterCampo;
        IMP_CREDITO              : TInterCampo;
        IMP_DISPUESTO            : TInterCampo;
        SDO_INSOLUTO             : TInterCampo;
        IMP_CAPITAL_PAG          : TInterCampo;
        IMP_CAPITAL_VDO          : TInterCampo;
        IMP_COMISION_PAG         : TInterCampo;
        IMP_COMISION_VDO         : TInterCampo;
        IMP_INTERES_PAG          : TInterCampo;
        IMP_INTERES_VDO          : TInterCampo;
        IMP_IVA_COM_PAG          : TInterCampo;
        IMP_IVA_COM_VDO          : TInterCampo;
        IMP_IVA_INT_PAG          : TInterCampo;
        IMP_IVA_INT_VDO          : TInterCampo;
        CVE_CALIF_CRE            : TInterCampo;
        SIT_CREDITO              : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_AUTORIZA               : TInterCampo;
        CVE_USU_AUTORIZA         : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        ID_TRANSAC_DISP          : TInterCampo;
        DISPONIBLE_ACRED         : TInterCampo;
        IMP_DISP_GPO             : TInterCampo;
        DISPONIBLE_AUT           : TInterCampo;
        REF_EXTERNA_LIQ          : TInterCampo;
        TASA_BASE                : TInterCampo; //EASA 28052004
        ID_CRED_EXTERNO          : TInterCampo; //EASA 01062004
        F_INICIO                 : TInterCampo; //EASA 01062004
        F_VENCIMIENTO            : TInterCampo; //EASA 01062004
        F_FIN_PERGRA_FA          : TInterCampo; // --- ASOR --- ABRIL 2016 ---
        IMP_MINISTRADO           : TInterCampo; //EASA 01062004
        UNIDAD_TIEMPO_CP         : TInterCampo; //EASA 01062004
        NUM_UNIDADES_CP          : TInterCampo; //EASA 01062004
        DIA_PAGO_CAP             : TInterCampo; //EASA 01062004
        UNIDAD_TIEMPO_IN         : TInterCampo; //EASA 01062004
        NUM_UNIDADES_IN          : TInterCampo; //EASA 01062004
        DIA_PAGO_INT             : TInterCampo; //EASA 01062004
        UNIDAD_TIEMPO_RE         : TInterCampo; //EASA 01062004
        NUM_UNIDADES_RE          : TInterCampo; //EASA 01062004
        DIA_REVISION             : TInterCampo; //EASA 01062004
        F_PROX_REVISION          : TInterCampo; //EASA 01062004
        F_INI_PAG_CAP            : TInterCampo; //EASA 01062004
        F_INI_PAG_INT            : TInterCampo; //EASA 01062004
        B_FINANC_ADIC            : TInterCampo; //EASA 01062004
        TX_COMENTARIOS           : TInterCampo; //EASA 01062004
        PCT_COMISION             : TInterCampo; //EASA 01062004
        ID_CONTROL_EXT           : TInterCampo; //EASA 01062004
        IMP_COMISION             : TInterCampo; //ROIM 19072004
        CVE_OPERATIVA            : TInterCampo; //EASA 10092004
        CVE_TIPO_TASA            : TInterCampo; //EASA 10092004
        SIT_CREDITO_DET          : TInterCampo; //EASA 10012005
        NUM_FOL_FIDEICOM         : TInterCampo; //EASA 07042005 GOMMUN
        CVE_GPO_CAPITALIZ        : TInterCampo; //EASA 10704005 GOMMUN
        CVE_CALC_IVA_INT         : TInterCampo; //LOLS 03MAR2006
        ID_SOLICITUD             : TInterCampo; //SST 09MAY2011
        CVE_TIPO_BAJA            : TInterCampo; //ROIM748 JULIO 2009
        F_RESTRINGIDO            : TInterCampo; //ROIM748 JULIO 2009
        TIPO_RENUEVA             : TInterCampo; //RABA 09 JUN 2011

        CVE_CALIDAD_GTIA         : TInterCampo; //HERJA ABRIL 2013
        B_INT_DIASIG             : TInterCampo;  //HERJA SEPTIEMBRE 2013

        //Clases Adicionales
        ContratoCre              : TCrCto; //Contrato Crédito
        CalcInt                  : TCrCalcInt; //Calculo de intereses
        TipoAmort                : TCrAmortiz; //Tipo de Amortizacion
        PagoInt                  : TCrPagInt;  //Pago de intereses
        TipLiq                   : TCrLiqDis;  //Tipo Liquidacion
        PromotorAdm              : TMPersona;  //Promotor Administrativo
        ParamCre                 : TParamCre;
        TasaRefer                : TTasIndFin; //EASA 280052004
        UTiempoTasa              : TCrUniTie;  //Unidad de Tiempo ROIM
        UTiempoCap               : TCrUniTie;  //Unidad de Tiempo ROIM
        UTiempoInt               : TCrUniTie;  //Unidad de Tiempo ROIM
        MFiraOpe                 : TMFiraCto;  //EASA Operativa 10092004
        BasicCred                : TBasicCred;

        VGTIPO_DISPOSICION       : String;
        VGID_CREDITO_RR          : Integer;
        VGFOL_GRUPO_RENUEVA      : Integer;
        VGID_IMPORTE_RR          : Double;
        VGF_INICIO               : TDateTime;

        // </ RABA > 24 MAY 2011
        // SE AGREGA VARIABLE GLOBAL PARA GUARDAR EL CONTRATO DESTINO
        // DE UNA REESTRUCTURA, RENOVACION, CONTRATO MODIFICATIRIO,...
        VGID_CONTRATO_RR         : Integer;
        // < RABA />

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    InternalPost : Boolean; override;
        Function    InsertaCredito : Boolean;
        procedure   CambioSituacion(Sender: TObject);
        procedure   CambioTipoCredito(Sender: TObject);
        function    StpAutoriza(pIdCredito: Integer): Boolean;
        function    StpCancelaDisp(pIdCredito: Integer): Boolean;
        function    StpRechazaDisp(pIdCredito: Integer; pMotivo: String): Boolean;
        function    StpReactivaDisp(pIdCredito: Integer): Boolean;
        function    StpBusSigFecha(PPFInicioPag,PPFVencimiento : TDateTime;PPUnidadTiempo : String;
                                   PPENumUnidades,PPDiaPago : Integer;
                                   PPEDMinReqPer : Integer = 0;
                                   PPENumDiasAgrPer : Integer = 0): TDateTime;
        Procedure   ObtenSaldoDispAcred(var PPImpDispAcre, PPImpDispAcreGpo, PPImpDisponible : Double);
        Procedure   ArmaTabla;
        Procedure   StpComisProg(pIdCredito: Integer);
        Function    StpRespaldaDisp(pIdCredito: Integer; pMetodo: String): Boolean;
        Function    StpOperaConvenio(pIdCredito, pFolGpoRenovac: Integer; pMetodo: String): Boolean;
        Procedure   RestauraTabla;
        function    Nvl( S, NullValue : String ): String;
        Procedure   Inicializa_EsOpEv_LC;

        function    StpValidaRSRE(pIdCredito: Integer): Boolean;
        Procedure   StpValidaVencido(pIdCredito, pFolGpoRenovac: Integer);  //RABA MAR 2015
        //RABA MAR 2015 Para obtener los adeudos de cada crédito en impagado
        Function ObtenAdeudoCred(IdCredito:Integer; vlfecha  : string): Double;

      published
      end;

var vlsql: String;
    vlCount: Integer;

implementation
Uses IntCrComPro,  //Programación de Comisiones
     IntCrCalDia,  //Convierte en días, de aucerdo al año y meses
     IntCrDesMot,  //Ventana de Descripción de motivos de rechazo
     IntMDispSieb,
     IntMDispDet,  //Reporte de Detalle de Disposición
     IntCrProcamp, //PROCAMPO
     IntMDispGar,
     IntCrconsult,
     IntMSeguro,         //seguros
     IntCrResRee,   //Renovación y Reestructuración
     IntCrInAdTa,
     IntCrTxComen,
     IntCrCreChe,

     IntCrtiba,     //ROIM748 JULIO 2009   Tipo de Baja

     IntCrSoGtNa, IntDmMain;   //Solicitud de garantía NAFIN

{$R *.DFM}

//</SST>
//Se agrega Intercampo ID_SOLICITUD (de solicitudes web) y su asociación con edNoSolDisp
constructor TCrCredito.Create(AOwner: TComponent);
begin
  Inherited;
  ID_CREDITO:= CreaCampo('ID_CREDITO', ftFloat, tsNinguno, tsNinguno, True);
  ID_CREDITO.Caption:= 'No. Disposición';
  ID_CONTRATO:= CreaCampo('ID_CONTRATO', ftFloat, tsNinguno, tsNinguno, True);
  ID_CONTRATO.Caption:= 'Contrato / Producto';
  FOL_CONTRATO:= CreaCampo('FOL_CONTRATO', ftFloat, tsNinguno, tsNinguno, True);
  FOL_CONTRATO.Caption:= 'Folio Contrato';
  B_COB_AUT:= CreaCampo('B_COB_AUT', ftString, tsNinguno, tsNinguno, True);
  B_COB_AUT.Caption:= 'Cobranza Automática';
  B_APLICA_COM:= CreaCampo('B_APLICA_COM', ftString, tsNinguno, tsNinguno, True);
  B_APLICA_COM.Caption:= 'Aplica Comisiones';
  B_APLICA_IVA:= CreaCampo('B_APLICA_IVA', ftString, tsNinguno, tsNinguno, True);
  B_APLICA_IVA.Caption:= 'Aplica IVA';
  B_GENERA_EDOCTA:= CreaCampo('B_GENERA_EDOCTA', ftString, tsNinguno, tsNinguno, True);
  B_GENERA_EDOCTA.Caption:= 'Genera Estado Cuenta';
  B_REFERENCIADO:= CreaCampo('B_REFERENCIADO', ftString, tsNinguno, tsNinguno, True);
  B_REFERENCIADO.Caption:= 'Aviso Pago Referenciado';
  CVE_CALCULO:= CreaCampo('CVE_CALCULO', ftString, tsNinguno, tsNinguno, True);
  CVE_CALCULO.Caption:= 'Cálculo de Interés';
  CVE_AMORTIZACION:= CreaCampo('CVE_AMORTIZACION', ftString, tsNinguno, tsNinguno, True);
  CVE_AMORTIZACION.Caption:= 'Tipo de Amortización';
  CVE_PAG_INTERES:= CreaCampo('CVE_PAG_INTERES', ftString, tsNinguno, tsNinguno, True);
  CVE_PAG_INTERES.Caption:= 'Pago de Interés';
  CVE_LIQUIDACION:= CreaCampo('CVE_LIQUIDACION', ftString, tsNinguno, tsNinguno, True);
  CVE_LIQUIDACION.Caption:= 'Tipo de Liquidación';
  CVE_TASA_REFER:= CreaCampo('CVE_TASA_REFER', ftString, tsNinguno, tsNinguno, True);
  CVE_TASA_REFER.Caption:= 'Tasa de Referencia';
  OPERADOR_STASA:= CreaCampo('OPERADOR_STASA', ftString, tsNinguno, tsNinguno, True);
  OPERADOR_STASA.Caption:= 'Operador Sobre - Tasa';
  SOBRETASA:= CreaCampo('SOBRETASA', ftFloat, tsNinguno, tsNinguno, True);
  SOBRETASA.Caption:= 'Sobre - Tasa';
  TASA_CREDITO:= CreaCampo('TASA_CREDITO', ftFloat, tsNinguno, tsNinguno, True);
  TASA_CREDITO.Caption:= 'Tasa Aplicada';
  //CICLO_REVISION:= CreaCampo('CICLO_REVISION', ftFloat, tsNinguno, tsNinguno, True);
  //CICLO_REVISION.Caption:= 'Días de Revisión Tasa';
  DIAS_PLAZO:= CreaCampo('DIAS_PLAZO', ftFloat, tsNinguno, tsNinguno, True);
  DIAS_PLAZO.Caption:= 'Plazo de Disposición';
  F_LIQUIDACION:= CreaCampo('F_LIQUIDACION', ftDate, tsNinguno, tsNinguno, True);
  F_LIQUIDACION.Caption:= 'Fecha de Vencimiento';
  FACT_MORAS:= CreaCampo('FACT_MORAS', ftFloat, tsNinguno, tsNinguno, True);
  FACT_MORAS.Caption:= 'Factor de Moratorios';
  FACT_PROPOR_GAR:= CreaCampo('FACT_PROPOR_GAR', ftFloat, tsNinguno, tsNinguno, True);
  FACT_PROPOR_GAR.Caption:= 'Proporción de Garantía';
  F_TRASPASO_VENC:= CreaCampo('F_TRASPASO_VENC', ftDate, tsNinguno, tsNinguno, True);
  F_TRASPASO_VENC.Caption:= 'Fecha Traspaso Vencido';
  ID_CRE_RENOVADO:= CreaCampo('ID_CRE_RENOVADO', ftFloat, tsNinguno, tsNinguno, True);
  ID_CRE_RENOVADO.Caption:= 'Disposición Renovado';
  ID_CRE_RENUEVA:= CreaCampo('ID_CRE_RENUEVA', ftFloat, tsNinguno, tsNinguno, True);
  ID_CRE_RENUEVA.Caption:= 'Disposición Renueva';
  // </ RABA > 09 JUN 2011 REESTRUCTURA
  TIPO_RENUEVA:= CreaCampo('TIPO_RENUEVA', ftString, tsNinguno, tsNinguno, True);
  TIPO_RENUEVA.Caption:= 'Tipo de Renovacion';
  // < RABA />

  TIPO_DISPOSICION:= CreaCampo('TIPO_DISPOSICION', ftString, tsNinguno, tsNinguno, True);
  with TIPO_DISPOSICION do
  begin
    Size:= 2;
    UseCombo:= True;
    ComboLista.Add('DISPOSICIÓN');            ComboDatos.Add('DI');
    ComboLista.Add('RENOVACIÓN');             ComboDatos.Add('RE');
    ComboLista.Add('REESTRUCTURACIÓN');       ComboDatos.Add('RS');
    ComboLista.Add('CONVENIO MODIFICATORIO'); ComboDatos.Add('CM');//EASA4011  31082005
    ComboLista.Add('EVENTO ACELERACIÓN');     ComboDatos.Add('EA');//EASA4011  31082005
  end;
  TIPO_DISPOSICION.Caption:= 'Tipo Disposición';
  B_ENVIA_BNC:= CreaCampo('B_ENVIA_BNC', ftString, tsNinguno, tsNinguno, True);
  B_ENVIA_BNC.Caption:= 'Envia Bnc';
  ID_PROM_ADM:= CreaCampo('ID_PROM_ADM', ftFloat, tsNinguno, tsNinguno, True);
  ID_PROM_ADM.Caption:= 'Promotor Administrador';
  IMP_CREDITO:= CreaCampo('IMP_CREDITO', ftFloat, tsNinguno, tsNinguno, True);
  IMP_CREDITO.Caption:= 'Importe Disposición';
  IMP_DISPUESTO:= CreaCampo('IMP_DISPUESTO', ftFloat, tsNinguno, tsNinguno, True);
  IMP_DISPUESTO.Caption:= 'Importe Dispuesto';
  SDO_INSOLUTO:= CreaCampo('SDO_INSOLUTO', ftFloat, tsNinguno, tsNinguno, True);
  SDO_INSOLUTO.Caption:= 'Saldo Insoluto';
  IMP_CAPITAL_PAG:= CreaCampo('IMP_CAPITAL_PAG', ftFloat, tsNinguno, tsNinguno, True);
  IMP_CAPITAL_PAG.Caption:= 'Imp Capital Pag';
  IMP_CAPITAL_VDO:= CreaCampo('IMP_CAPITAL_VDO', ftFloat, tsNinguno, tsNinguno, True);
  IMP_CAPITAL_VDO.Caption:= 'Imp Capital Vdo';
  IMP_COMISION_PAG:= CreaCampo('IMP_COMISION_PAG', ftFloat, tsNinguno, tsNinguno, True);
  IMP_COMISION_PAG.Caption:= 'Imp Comisión Pag';
  IMP_COMISION_VDO:= CreaCampo('IMP_COMISION_VDO', ftFloat, tsNinguno, tsNinguno, True);
  IMP_COMISION_VDO.Caption:= 'Imp Comisión Vdo';
  IMP_INTERES_PAG:= CreaCampo('IMP_INTERES_PAG', ftFloat, tsNinguno, tsNinguno, True);
  IMP_INTERES_PAG.Caption:= 'Imp Interés Pag';
  IMP_INTERES_VDO:= CreaCampo('IMP_INTERES_VDO', ftFloat, tsNinguno, tsNinguno, True);
  IMP_INTERES_VDO.Caption:= 'Imp Interés Vdo';
  IMP_IVA_COM_PAG:= CreaCampo('IMP_IVA_COM_PAG', ftFloat, tsNinguno, tsNinguno, True);
  IMP_IVA_COM_PAG.Caption:= 'Imp Iva Com Pag';
  IMP_IVA_COM_VDO:= CreaCampo('IMP_IVA_COM_VDO', ftFloat, tsNinguno, tsNinguno, True);
  IMP_IVA_COM_VDO.Caption:= 'Imp Iva Com Vdo';
  IMP_IVA_INT_PAG:= CreaCampo('IMP_IVA_INT_PAG', ftFloat, tsNinguno, tsNinguno, True);
  IMP_IVA_INT_PAG.Caption:= 'Imp Iva Int Pag';
  IMP_IVA_INT_VDO:= CreaCampo('IMP_IVA_INT_VDO', ftFloat, tsNinguno, tsNinguno, True);
  IMP_IVA_INT_VDO.Caption:= 'Imp Iva Int Vdo';
  CVE_CALIF_CRE:= CreaCampo('CVE_CALIF_CRE', ftString, tsNinguno, tsNinguno, True);
  CVE_CALIF_CRE.Caption:= 'Calificación Crédito';
  SIT_CREDITO:= CreaCampo('SIT_CREDITO', ftString, tsNinguno, tsNinguno, True);
  with SIT_CREDITO do
  begin
    Size:= 2;
    UseCombo:= True;
    ComboLista.Add('NO AUTORIZADA');
    ComboDatos.Add(CSIT_NA);
    ComboLista.Add('ACTIVO');
    ComboDatos.Add(CSIT_AC);
    ComboLista.Add('CANCELADA');
    ComboDatos.Add(CSIT_CA);
    ComboLista.Add('LIQUIDADA');
    ComboDatos.Add(CSIT_LQ);
    ComboLista.Add('RECHAZADA');
    ComboDatos.Add(CSIT_RE);
    ComboLista.Add('AUTORIZADA');
    ComboDatos.Add(CSIT_AU);
    ComboLista.Add('NO PROCESADO');
    ComboDatos.Add(CSIT_NP);
  end;
  SIT_CREDITO.Caption:= 'Situación Crédito';
  F_ALTA:= CreaCampo('F_ALTA', ftDate, tsNinguno, tsNinguno, True);
  F_ALTA.Caption:= 'Fecha Alta';
  CVE_USU_ALTA:= CreaCampo('CVE_USU_ALTA', ftString, tsNinguno, tsNinguno, True);
  CVE_USU_ALTA.Caption:= 'Clave de Usu Alta';
  F_AUTORIZA:= CreaCampo('F_AUTORIZA', ftDate, tsNinguno, tsNinguno, True);
  F_AUTORIZA.Caption:= 'Fecha Autoriza';
  CVE_USU_AUTORIZA:= CreaCampo('CVE_USU_AUTORIZA', ftString, tsNinguno, tsNinguno, True);
  CVE_USU_AUTORIZA.Caption:= 'Clave de Usu Autoriza';
  F_MODIFICA:= CreaCampo('F_MODIFICA', ftDateTime, tsNinguno, tsNinguno, True);
  F_MODIFICA.Caption:= 'Fecha Modifica';
  CVE_USU_MODIFICA:= CreaCampo('CVE_USU_MODIFICA', ftString, tsNinguno, tsNinguno, True);
  CVE_USU_MODIFICA.Caption:= 'Clave de Usu Modifica';
  ID_TRANSAC_DISP:= CreaCampo('ID_TRANSAC_DISP', ftFloat, tsNinguno, tsNinguno, True);
  ID_TRANSAC_DISP.Caption:= 'No. Transacción';
  REF_EXTERNA_LIQ:= CreaCampo('REF_EXTERNA_LIQ', ftString, tsNinguno, tsNinguno, True);
  REF_EXTERNA_LIQ.Caption:= 'Ref. Externa';
  TASA_BASE:= CreaCampo('TASA_BASE', ftFloat, tsNinguno, tsNinguno, True);
  TASA_BASE.Caption:= 'Tasa Base';
  ID_CRED_EXTERNO:= CreaCampo('ID_CRED_EXTERNO', ftString, tsNinguno, tsNinguno, True);
  ID_CRED_EXTERNO.Caption:= 'Id. Credito Externo';
  F_INICIO:= CreaCampo('F_INICIO', ftDate, tsNinguno, tsNinguno, True);
  F_INICIO.Caption:= 'Fecha Inicio';
  F_VENCIMIENTO:= CreaCampo('F_VENCIMIENTO', ftDate, tsNinguno, tsNinguno, True);
  F_VENCIMIENTO.Caption:= 'Fecha Vencimiento';
  //--- ASOR -- ABRIL 2016 --- CAMPO DE FIN DE PERIODO DE GRACIA DE FINANCIAMIENTO ADICIONAL ---
  F_FIN_PERGRA_FA:= CreaCampo('F_FIN_PERGRA_FA', ftDate, tsNinguno, tsNinguno, True);
  F_FIN_PERGRA_FA.Caption:= 'Fecha Fin Periodo Gracia FA';
  //--- FIN ---
  IMP_MINISTRADO:= CreaCampo('IMP_MINISTRADO', ftFloat, tsNinguno, tsNinguno, True);
  IMP_MINISTRADO.Caption:= 'Importe Ministrado';
  UNIDAD_TIEMPO_CP:= CreaCampo('UNIDAD_TIEMPO_CP', ftString, tsNinguno, tsNinguno, True);
  UNIDAD_TIEMPO_CP.Caption:= 'Unidad Tiempo CP';
  NUM_UNIDADES_CP:= CreaCampo('NUM_UNIDADES_CP', ftFloat, tsNinguno, tsNinguno, True);
  NUM_UNIDADES_CP.Caption:= 'Num. Unidades CP';
  DIA_PAGO_CAP:= CreaCampo('DIA_PAGO_CAP', ftFloat, tsNinguno, tsNinguno, True);
  DIA_PAGO_CAP.Caption:= 'Dia Pago Capital';
  UNIDAD_TIEMPO_IN:= CreaCampo('UNIDAD_TIEMPO_IN', ftString, tsNinguno, tsNinguno, True);
  UNIDAD_TIEMPO_IN.Caption:= 'Unidad Tiempo Interés';
  NUM_UNIDADES_IN:= CreaCampo('NUM_UNIDADES_IN', ftFloat, tsNinguno, tsNinguno, True);
  NUM_UNIDADES_IN.Caption:= 'Num. Unidades Interés';
  DIA_PAGO_INT:= CreaCampo('DIA_PAGO_INT', ftFloat, tsNinguno, tsNinguno, True);
  DIA_PAGO_INT.Caption:= 'Dia Pago Interés';
  UNIDAD_TIEMPO_RE:= CreaCampo('UNIDAD_TIEMPO_RE', ftString, tsNinguno, tsNinguno, True);
  UNIDAD_TIEMPO_RE.Caption:= 'Unidad Tiempo Revisión';
  NUM_UNIDADES_RE:= CreaCampo('NUM_UNIDADES_RE', ftFloat, tsNinguno, tsNinguno, True);
  NUM_UNIDADES_RE.Caption:= 'Num. Unidades Revisión';
  DIA_REVISION:= CreaCampo('DIA_REVISION', ftFloat, tsNinguno, tsNinguno, True);
  DIA_REVISION.Caption:= 'Día de Revisión';
  F_PROX_REVISION:= CreaCampo('F_PROX_REVISION', ftDate, tsNinguno, tsNinguno, True);
  F_PROX_REVISION.Caption:= 'Fecha Próxima Revisión';
  F_INI_PAG_CAP:= CreaCampo('F_INI_PAG_CAP', ftDate, tsNinguno, tsNinguno, True);
  F_INI_PAG_CAP.Caption:= 'Fecha Pago Capital';
  F_INI_PAG_INT:= CreaCampo('F_INI_PAG_INT', ftDate, tsNinguno, tsNinguno, True);
  F_INI_PAG_INT.Caption:= 'Fecha Inicio Pago Interés';
  B_FINANC_ADIC:= CreaCampo('B_FINANC_ADIC', ftString, tsNinguno, tsNinguno, True);
  B_FINANC_ADIC.Caption:= 'Aplica Financiamiento Adicional';
  TX_COMENTARIOS:= CreaCampo('TX_COMENTARIOS', ftString, tsNinguno, tsNinguno, True);
  TX_COMENTARIOS.Caption:= 'Comentarios';
  PCT_COMISION:= CreaCampo('PCT_COMISION', ftFloat, tsNinguno, tsNinguno, True);
  PCT_COMISION.Caption:= 'Porcentaje Comisión';
  DISPONIBLE_ACRED:= CreaCampo('DISPONIBLE_ACRED', ftFloat, tsNinguno, tsNinguno, False);
  IMP_DISP_GPO:= CreaCampo('DISPONIBLE_ACRED', ftFloat, tsNinguno, tsNinguno, False);
  DISPONIBLE_AUT:= CreaCampo('DISPONIBLE_AUT', ftFloat, tsNinguno, tsNinguno, False);
  ID_CONTROL_EXT:= CreaCampo('ID_CONTROL_EXT', ftString, tsNinguno, tsNinguno, True);
  ID_CONTROL_EXT.Caption:= 'Id Control Ext.';
  IMP_COMISION:= CreaCampo('IMP_COMISION', ftFloat, tsNinguno, tsNinguno, False);
  IMP_COMISION.Caption:= 'Imp Comisión Pag';
  CVE_OPERATIVA:= CreaCampo('CVE_OPERATIVA', ftString, tsNinguno, tsNinguno, True);
  CVE_OPERATIVA.Caption:= 'Cve. Operativa';
  CVE_TIPO_TASA:= CreaCampo('CVE_TIPO_TASA', ftString, tsNinguno, tsNinguno, True);
  with CVE_TIPO_TASA do
  begin
    Size:= 2;
    UseCombo:= True;
    ComboLista.Add('FIJA');
    ComboDatos.Add(C_FIJA);
    ComboLista.Add('VARIABLE');
    ComboDatos.Add(C_VARIABLE);
  end;
  CVE_TIPO_TASA.Caption:= 'Cve. Tipo Tasa';
  SIT_CREDITO_DET:= CreaCampo('SIT_CREDITO_DET', ftString, tsNinguno, tsNinguno, True);
  SIT_CREDITO_DET.Caption:= 'Situación Credito Alternativo';
  NUM_FOL_FIDEICOM:= CreaCampo('NUM_FOL_FIDEICOM', ftString, tsNinguno, tsNinguno, True);
  NUM_FOL_FIDEICOM.Caption:= 'Num. Fol. Fideicomiso';
  CVE_GPO_CAPITALIZ:= CreaCampo('CVE_GPO_CAPITALIZ', ftString, tsNinguno, tsNinguno, True);
  CVE_GPO_CAPITALIZ.Caption:= 'Cve. Gpo Capitaliza';
  //<LOLS 03MAR2006 PARAMETRO DE CALCULO DE IVA DE INTERES>
  CVE_CALC_IVA_INT:= CreaCampo( 'CVE_CALC_IVA_INT', ftString, tsNinguno, tsNinguno, True );
  CVE_CALC_IVA_INT.Caption:= 'Cve. Calc. IVA Interes';
  //</LOLS>
  //ROIM748 JULIO 2009
  CVE_TIPO_BAJA:= CreaCampo('CVE_TIPO_BAJA', ftString, tsNinguno, tsNinguno, True);
  CVE_TIPO_BAJA.Caption:= 'CVE_TIPO_BAJA';
  F_RESTRINGIDO:= CreaCampo('F_RESTRINGIDO', ftDate, tsNinguno, tsNinguno, True);
  F_RESTRINGIDO.Caption:= 'Fecha Restringido';
  ID_SOLICITUD:= CreaCampo('ID_SOLICITUD', ftInteger, tsNinguno, tsNinguno, True);
  ID_SOLICITUD.Caption:= 'Disp. Solic. Web';

  CVE_CALIDAD_GTIA:= CreaCampo('CVE_CALIDAD_GTIA', ftString, tsNinguno, tsNinguno, True);
  with CVE_CALIDAD_GTIA do
  begin
    Size:= 4;
    UseCombo:= True;
    ComboLista.Add('MAYOR CALIDAD');
    ComboDatos.Add('MY');
    ComboLista.Add('MENOR CALIDAD');
    ComboDatos.Add('MN');
    ComboLista.Add('MISMA CALIDAD');
    ComboDatos.Add('MC');
    ComboLista.Add('NO APLICA');
    ComboDatos.Add('NA');
  end;
  //HERJA SEPTIEMBRE 2013
  B_INT_DIASIG:= CreaCampo('B_INT_DIASIG', ftString, tsNinguno, tsNinguno, True);
  B_INT_DIASIG.Caption:= 'Calculo de Interes Dia Siguiente';


  //ROIM748 JULIO 2009
  FKeyFields.Add('ID_CREDITO');
  TableName:= 'CR_CREDITO';
  UseQuery:= True;
  HelpFile:= 'IntCrCredito.Hlp';
  ShowMenuReporte:= True;
  ContratoCre := TCrCto.Create(Self);
  ContratoCre.MasterSource:= Self;
  ContratoCre.FieldByName('ID_CONTRATO').MasterField:= 'ID_CONTRATO';
  ContratoCre.FieldByName('FOL_CONTRATO').MasterField:= 'FOL_CONTRATO';
  CalcInt:= TCrCalcInt.Create(Self);
  CalcInt.MasterSource:= Self;
  CalcInt.FieldByName('CVE_CALCULO_INT').MasterField:= 'CVE_CALCULO';
  TipoAmort:= TCrAmortiz.Create(Self);
  TipoAmort.MasterSource:= Self;
  TipoAmort.FieldByName('CVE_AMORTIZACION').MasterField:= 'CVE_AMORTIZACION';
  PagoInt:= TCrPagInt.Create(Self);
  PagoInt.MasterSource:= Self;
  PagoInt.FieldByName('CVE_PAG_INTERES').MasterField:= 'CVE_PAG_INTERES';
  TipLiq:= TCrLiqDis.Create(Self);
  TipLiq.MasterSource:= Self;
  TipLiq.FieldByName('CVE_LIQUIDACION').MasterField:= 'CVE_LIQUIDACION';
  TipLiq.BuscaWhereString:= 'CR_LIQUIDA_DISP.SIT_LIQUIDA = ' + QuotedStr('AC');
  TipLiq.FilterString:= TipLiq.BuscaWhereString;
  PromotorAdm:= TMPersona.Create(Self);
  PromotorAdm.FilterBy:= fbTMPersonaEmpleado;
  PromotorAdm.MasterSource:= Self;
  PromotorAdm.FieldByName('ID_PERSONA').MasterField:= 'ID_PROM_ADM';
  PromotorAdm.BuscaWhereString:= 'SIT_EMPLEADO = ' + QuotedStr('AC');
  TasaRefer:= TTasIndFin.Create(Self);
  TasaRefer.MasterSource:= Self;
  TasaRefer.FieldByName('CVE_TASA_INDICAD').MasterField:= 'CVE_TASA_REFER';
  TasaRefer.BuscaWhereString:= 'TASA_INDIC_FINAN.B_TASA_CREDITO = ' + QuotedStr('V');
  TasaRefer.FilterString:= TasaRefer.BuscaWhereString;
  UTiempoTasa:= TCrUniTie.Create(Self);
  UTiempoTasa.MasterSource:= Self;
  UTiempoTasa.FieldByName('CVE_UNIDAD_TIEMP').MasterField:= 'UNIDAD_TIEMPO_RE';
  UTiempoCap:= TCrUniTie.Create(Self);
  UTiempoCap.MasterSource:= Self;
  UTiempoCap.FieldByName('CVE_UNIDAD_TIEMP').MasterField:= 'UNIDAD_TIEMPO_CP';
  UTiempoInt:= TCrUniTie.Create(Self);
  UTiempoInt.MasterSource:= Self;
  UTiempoInt.FieldByName('CVE_UNIDAD_TIEMP').MasterField:= 'UNIDAD_TIEMPO_IN';
  MFiraOpe:= TMFiraCto.Create(Self);
  MFiraOpe.MasterSource:= Self;
  MFiraOpe.FieldByName('CVE_OPERATIVA').MasterField:= 'CVE_OPERATIVA';
  SIT_CREDITO.OnChange:= CambioSituacion;
  TIPO_DISPOSICION.OnChange:= CambioTipoCredito;
  BasicCred:= TBasicCred.Create(Self);
  BasicCred.MasterSource:= Self;
  VGTIPO_DISPOSICION:= 'DI';
  VGFOL_GRUPO_RENUEVA:= 0;
  VGID_CREDITO_RR:= 0;
  VGID_IMPORTE_RR:= 0;
  // </ ASTECI:AARJ >
  // 15 FEB 2010
  // VG_OpEv_LC Se emplea para identificar cuando se genera
  // una DI por LC en la pantalla de Operaciones Eventuales.
  VG_OpEv_LC:= False;
  // < ASTECI:AARJ />

  // <RABA OCT 2014 ACTUALIZACION B-6>
  // se usa para identificar cuando se trata de una nueva disposición
  // pero calificada como n
  vgDispRen := False;
  vgNewDispVenc := False;
  // </RABA>

end;
//<SST/>

destructor TCrCredito.Destroy;
begin
   if ContratoCre <> nil then
      ContratoCre.Free;
   //end if
   if CalcInt <> nil then
      CalcInt.Free;
   //end if
   if TipoAmort <> nil then
      TipoAmort.Free;
   //end if
   if PagoInt <> nil then
      PagoInt.Free;
   //end if
   if TipLiq <> nil then
      TipLiq.Free;
   //end if
   if PromotorAdm <> nil then
      PromotorAdm.Free;
   //end if
    if TasaRefer <> nil then
       TasaRefer.Free;
   //end if
   If MFiraOpe <> Nil Then
      MFiraOpe.Free;
   //end if
   If BasicCred <> Nil Then
      BasicCred.Free;
   //end if
   inherited;
end;


function TCrCredito.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCredito;
begin
   W:=TWCrCredito.Create(Self);
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


Function TCrCredito.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCredi.it','F');
      Try if Active then begin T.Param(0,ID_CREDITO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;

      end;
end;

// LOLS 15 ENE 2007. ENVIO A BURO DE CREDITO
function TCrCredito.Nvl(S, NullValue: String): String;
begin
  Result := S;
  if Result = '' then Result := NullValue;
end;
// ENDS LOLS 15 ENE 2007

Function TCrCredito.InsertaCredito: Boolean;
var     vlResult      : Boolean;
        STPObtCredito : TStoredProc;
        qyQuery       : TQuery;   // RABA NOV 2014
        vlSalida      : Boolean;  // RABA NOV 2014
        stp           : TStoredProc; // RABA NOV 2014
        vlImpCred     : Double;      // RABA NOV 2014
        vlFFinPG_FA   : String;

     function ActualizaFolRRRS : Boolean;
     var vlsql    : String;
         vlSalida : Boolean;
         qyQuery  : TQuery;  // RABA 15 JUN 2011
         vlFTrasVenc : TDateTime;
     Begin
          vlSalida := False;
{
          // </ RABA > 16 JUN 2011
          // SE BUSCA SI ALGUNO DE LOS CREDITOS ORIGINALES TIENE FECHA TRASPASO VENCIDO
          // SI ES AFIRMATIVO, ENTONCES LA REESTRUCTURA NACE TAMBIEN CON FECHA TRASPASO VENCIDO = FECHA DE INICIO
          vlsql := ' SELECT COUNT(*) HAYVENCIDOS FROM CR_CREDITO ' +
                   ' WHERE F_TRASPASO_VENC IS NOT NULL ' +
                   ' AND ID_CREDITO IN (SELECT ID_CRED_RENOVADO FROM CR_RR_CREDITO WHERE FOL_GRUPO_RENUEVA = ' + IntToStr(VGFOL_GRUPO_RENUEVA) + ') ';
          qyQuery:= GetSQLQuery(vlsql, DataBaseName, SessionName, False);
          try
            If qyQuery <> Nil Then
               vlsql := ' UPDATE CR_CREDITO ' +
                        ' SET ID_CRE_RENOVADO = ' + ID_CRE_RENUEVA.AsString + ', ';

               if qyQuery.FieldByName('HAYVENCIDOS').AsInteger > 0 then
                  vlsql := vlsql + ' F_TRASPASO_VENC = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', F_INICIO.AsDateTime)  + ''', ''DD/MM/YYYY'') '
               else
                  vlsql := vlsql + ' F_TRASPASO_VENC = NULL ';
               vlsql := vlsql + ' WHERE ID_CREDITO = '+ ID_CREDITO.AsString;
          finally
            If qyQuery <> nil then qyQuery.Free;
          end;
          // < RABA />
          if RunSQL(vlsql,Apli.DataBaseName, Apli.SessionName,False) then
             vlSalida := True;

}
          // RABA este es el código original
          vlsql := ' UPDATE CR_CREDITO ' +
                   ' SET ID_CRE_RENOVADO = ' + ID_CRE_RENUEVA.AsString +
                   ' WHERE ID_CREDITO = '+ ID_CREDITO.AsString;
          if RunSQL(vlsql,Apli.DataBaseName, Apli.SessionName,False) then
             vlSalida := True;


          // </ RABA > 24 MAY 2011
          // SE MUEVE ESTE CODIGO DEL EVENTO DESPUES DE ACEPTAR DE LA INTERFORMA
          // PARA QUE SE REALICE EL COMMIT
          If vlSalida then
          begin
            // </INICIO> JJAR 24/03/2010 PARA CUANDO NO SE AUTORIZA AL MOMENTO DE LA OPERACION LC EL CREDITO
            // SE GRABA EL DATO DE ID_CRED_RENUEVA PARA CUANDO SE REQUIERA AUTORIZARLO POSTERIORMENTE
            IF (VGTIPO_DISPOSICION = 'RE') and (vgDispRen) THEN
               vlsql := ' UPDATE CR_RR_CREDITO ' +
                        ' SET ID_CRED_RENUEVA = '+ ID_CREDITO.AsString +
                        ' WHERE FOL_GRUPO_RENUEVA = '+ IntToStr(VGFOL_GRUPO_RENUEVA)
            ELSE
               vlsql := ' UPDATE CR_RR_CREDITO ' +
                        ' SET ID_CRED_RENUEVA = '+ ID_CREDITO.AsString +
                        ' WHERE FOL_GRUPO_RENUEVA = '+ IntToStr(VGFOL_GRUPO_RENUEVA) +
                        '   AND FOL_SECUENCIA = ' + IntToStr(vgFolSecuencia);    //RABA ENE 2015 ACTUALIZACIÓN B-6, PARA LA DIVISION EN VARIAS REESTRUCTURAS

            if not (RunSQL(vlsql,Apli.DataBaseName, Apli.SessionName,False)) then
               vlSalida := False;
          end;

          // A LOS CREDITOS ORIGINALES SE LES ACTULIZA EL CAMPO ID_CRED_RENUEVA CON EL FOLIO DE GRUPO
          // Y EL CAMPO TIPO_RENUEVA = CON EL TIPO DE DISPOSICION
//          if vlSalida then                                                              // RABA NOV 2014 ACTUALIZACION B-6
          if (vlSalida) and ( ((VGTIPO_DISPOSICION = 'RE') and (not vgDispRen)) OR
                              (VGTIPO_DISPOSICION = 'RS') OR
                              (VGTIPO_DISPOSICION = 'CM') OR
                              ((VGTIPO_DISPOSICION = 'DI') AND (VG_OpEv_LC))  ) then   // RABA NOV 2014 ACTUALIZACION B-6 si realmente es una renovación si va a entrar
          begin
             vlsql := 'SELECT ID_CRED_RENOVADO FROM CR_RR_CREDITO WHERE FOL_GRUPO_RENUEVA = ' + IntToStr(VGFOL_GRUPO_RENUEVA);
             qyQuery:= GetSQLQuery(VLSQL, DataBaseName, SessionName, False);
             try
               If qyQuery <> Nil Then
               Begin
                 While (not qyQuery.Eof) and (vlSalida) do
                 begin
                   vlsql := ' UPDATE CR_CREDITO ' +
                            ' SET ID_CRE_RENUEVA = ' + ID_CRE_RENUEVA.AsString + ', ' +
                                ' TIPO_RENUEVA = ''' + VGTIPO_DISPOSICION + ''' ' +
                            ' WHERE ID_CREDITO = '+ qyQuery.FieldByName('ID_CRED_RENOVADO').AsString;
                   if not (RunSQL(vlsql,Apli.DataBaseName, Apli.SessionName,False)) then
                      vlSalida := False;
                   qyQuery.Next;
                 end;
               End;
             finally
               qyQuery.Free;
             end;
          end;
          // < RABA />

          ActualizaFolRRRS := vlSalida;
     end;
//Inicio Inserta Crédito
Begin
    vlResult := False;

    //Obtiene Datos de algunos Intercampos
    B_COB_AUT.GetFromControl;
    B_APLICA_COM.GetFromControl;
    B_APLICA_IVA.GetFromControl;
    B_GENERA_EDOCTA.GetFromControl;
    B_REFERENCIADO.GetFromControl;
    B_ENVIA_BNC.GetFromControl;
//    TIPO_DISPOSICION.GetFromControl;  ROIM 090205
    CVE_TASA_REFER.GetFromControl;
    OPERADOR_STASA.GetFromControl;
    SOBRETASA.GetFromControl;
    B_INT_DIASIG.GetFromControl;

    STPObtCredito := TStoredProc.Create(Self);
    try
       with STPObtCredito do
       begin
          STPObtCredito.DatabaseName:= Apli.DatabaseName;
          STPObtCredito.SessionName:= Apli.SessionName;
          STPObtCredito.StoredProcName:='PKGCRCREDITO.STPALTADISP2';
          // Se crean los parametros del StoreProcedure
          Params.Clear;
          Params.CreateParam(ftFloat,'PEIDCONTRATO',ptInput);
          Params.CreateParam(ftFloat,'PEFOLCONTRATO',ptInput);
          Params.CreateParam(ftString,'PEBCOBAUT',ptInput);
          Params.CreateParam(ftString,'PEBAPLICACOM',ptInput);
          Params.CreateParam(ftString,'PEBAPLICAIVA',ptInput);
          Params.CreateParam(ftString,'PEBGENERAEDOCTA',ptInput);
          Params.CreateParam(ftString,'PEBREFERENCIADO',ptInput);
          Params.CreateParam(ftString,'PECVECALCULO',ptInput);
          Params.CreateParam(ftString,'PECVEAMORTIZACION',ptInput);
          Params.CreateParam(ftString,'PECVEPAGINTERES',ptInput);
          Params.CreateParam(ftString,'PECVELIQUIDACION',ptInput);
          Params.CreateParam(ftString,'PECVETASAREFER',ptInput);
          Params.CreateParam(ftString,'PEOPERADORSTASA',ptInput);
          Params.CreateParam(ftFloat,'PESOBRETASA',ptInput);
          Params.CreateParam(ftFloat,'PETASACREDITO',ptInput);
          Params.CreateParam(ftFloat,'PEDIASPLAZO',ptInput);
          Params.CreateParam(ftFloat,'PEFACTMORAS',ptInput);
          Params.CreateParam(ftFloat,'PEFACTPROPOR',ptInput);
          Params.CreateParam(ftString,'PETIPODISPOSICION',ptInput);
          Params.CreateParam(ftString,'PEBENVIABNC',ptInput);
          Params.CreateParam(ftFloat,'PEIDPROMADM',ptInput);
          Params.CreateParam(ftFloat,'PEIMPCREDITO',ptInput);
          Params.CreateParam(ftFloat,'PEIMPDISPUESTO',ptInput);
          Params.CreateParam(ftString,'PECVECALIFCRE',ptInput);
          Params.CreateParam(ftDateTime,'PEFALTA',ptInput);
          Params.CreateParam(ftString,'PECVEUSUALTA',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PETASABASE',ptInput);
          Params.CreateParam(ftFloat,'peIdCredExterno',ptInput);
          Params.CreateParam(ftDateTime,'peFInicio',ptInput);
          Params.CreateParam(ftDateTime,'peFVvto',ptInput);
          Params.CreateParam(ftFloat,'peImpMinistrado',ptInput);
          Params.CreateParam(ftString,'peUnidadTiempoCP',ptInput);
          Params.CreateParam(ftFloat,'peNumUnidadesCP',ptInput);
          Params.CreateParam(ftFloat,'peDiaPagoCap',ptInput);
          Params.CreateParam(ftString,'peUnidadTiempoIN',ptInput);
          Params.CreateParam(ftFloat,'peNumUnidadesIN',ptInput);
          Params.CreateParam(ftFloat,'peDiaPagoIint',ptInput);
          Params.CreateParam(ftString,'peUnidadTiempoRE',ptInput);
          Params.CreateParam(ftFloat,'peNumUnidadesRE',ptInput);
          Params.CreateParam(ftFloat,'peDiaRevision',ptInput);
          Params.CreateParam(ftDateTime,'peFProxRevision',ptInput);
          Params.CreateParam(ftDateTime,'peFIniPagCap',ptInput);
          Params.CreateParam(ftDateTime,'peFIniPagInt',ptInput);
          Params.CreateParam(ftString,'peBFinancAdic',ptInput);
          Params.CreateParam(ftDateTime,'peFFinPG_FA',ptInput);  //--- ASOR --- ABRIL 2016 ---
          Params.CreateParam(ftString,'peTxcomentarios',ptInput);
          Params.CreateParam(ftFloat,'pePctComision',ptInput);
          Params.CreateParam(ftString,'peIdControlExt',ptInput);
          Params.CreateParam(ftString,'peCveOperativa',ptInput);
          Params.CreateParam(ftString,'peCveTipoTasa',ptInput);
          Params.CreateParam(ftString,'peNumFolFideicom',ptInput);
          Params.CreateParam(ftString,'peCveGpoCapitaliz',ptInput);
          //<LOLS 03MAR2006 CLAVE DE CALCULO DE IVA DE INTERES>
          Params.CreateParam( ftString, 'peCveCalcIVAInt', ptInput );
          //</LOLS>
          //17AGO2006 CLAVE DE MEDIO POR LA CUAL INGRESAN LAS OPERACIONES>
          Params.CreateParam( ftString, 'peCveMedio', ptInput );
          //<LOLS/>
          //</SST>
          //06MAY2011 SOLICITUD WEB
          Params.CreateParam(ftInteger, 'peIdSolicitud', ptInput);
          //<SST/>
          Params.CreateParam(ftFloat,'PSIDCREDITO',ptOutput);
          //Params.CreateParam(ftString,'PSSITCREDITO',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
    //  Se quita el Prepare;

          ParamByName('peIdContrato').AsFloat := ID_CONTRATO.AsFloat;
          ParamByName('peFolContrato').AsFloat := FOL_CONTRATO.AsFloat;
          ParamByName('peBCobAut').AsString := B_COB_AUT.AsString;
          ParamByName('peBAplicaCom').AsString := B_APLICA_COM.AsString;
          ParamByName('peBAplicaIVA').AsString := B_APLICA_IVA.AsString;
          ParamByName('peBGeneraEdoCta').AsString := B_GENERA_EDOCTA.AsString;
          ParamByName('peBReferenciado').AsString := CFALSO;//B_REFERENCIADO.AsString;
          ParamByName('peCveCalculo').AsString := CVE_CALCULO.AsString;
          ParamByName('peCveAmortizacion').AsString := CVE_AMORTIZACION.AsString;
          ParamByName('peCvePagInteres').AsString := CVE_PAG_INTERES.AsString;
          ParamByName('peCveLiquidacion').AsString := CVE_LIQUIDACION.AsString;
          ParamByName('peCveTasaRefer').AsString := CVE_TASA_REFER.AsString;
          ParamByName('peOperadorSTasa').AsString := OPERADOR_STASA.AsString;
          ParamByName('peSobreTasa').AsFloat := SOBRETASA.AsFloat;
          ParamByName('peTasaCredito').AsFloat := TASA_CREDITO.AsFloat;
          //ParamByName('peCicloRevision').AsFloat := CICLO_REVISION.AsFloat;
          ParamByName('peDiasPlazo').AsFloat := DIAS_PLAZO.AsFloat;
          ParamByName('peFactMoras').AsFloat := FACT_MORAS.AsFloat;
          ParamByName('peFactPropor').AsFloat := FACT_PROPOR_GAR.AsFloat;
          ParamByName('peTipoDisposicion').AsString := VGTIPO_DISPOSICION;//'DI';//TIPO_DISPOSICION.AsString;ROIM 090205
          // LOLS 15 ENE 2007. ENVIO A BURO DE CREDITO
          ParamByName('peBEnviaBNC').AsString := Nvl(ContratoCre.Producto.B_ENVIA_BNC.AsString, CVERDAD );
          //ParamByName('peBEnviaBNC').AsString := CVERDAD;//B_ENVIA_BNC.AsString;
          // ENDS LOLS 15 ENE 2007
          ParamByName('peIdPromAdm').AsString := ID_PROM_ADM.AsString;
          ParamByName('peImpCredito').AsFloat := IMP_CREDITO.AsFloat;
          ParamByName('peImpdispuesto').AsFloat := IMP_DISPUESTO.AsFloat;
          ParamByName('peCveCalifCre').AsString := CVE_CALIF_CRE.AsString;
          ParamByName('peFAlta').AsDateTime := F_ALTA.AsDateTime;
          ParamByName('peCveUsuAlta').AsString := CVE_USU_ALTA.AsString;
          ParamByName('peBCommit').AsString := 'V';
          ParamByName('peTasaBase').AsFloat := TASA_BASE.AsFloat;
          ParamByName('peIdCredExterno').AsString := ID_CRED_EXTERNO.AsString;
          ParamByName('peFInicio').AsDateTime := F_INICIO.AsDateTime;
          ParamByName('peFVvto').AsDateTime := F_VENCIMIENTO.AsDateTime;
          ParamByName('peImpMinistrado').AsFloat := IMP_MINISTRADO.AsFloat;
          ParamByName('peUnidadTiempoCP').AsString := UNIDAD_TIEMPO_CP.AsString;
          ParamByName('peNumUnidadesCP').AsFloat := NUM_UNIDADES_CP.AsFloat;
          ParamByName('peDiaPagoCap').AsFloat := DIA_PAGO_CAP.AsFloat;
          ParamByName('peUnidadTiempoIN').AsString := UNIDAD_TIEMPO_IN.AsString;
          ParamByName('peNumUnidadesIN').AsFloat := NUM_UNIDADES_IN.AsFloat;
          ParamByName('peDiaPagoIint').AsFloat := DIA_PAGO_INT.AsFloat;
          ParamByName('peUnidadTiempoRE').AsString := UNIDAD_TIEMPO_RE.AsString;
          ParamByName('peNumUnidadesRE').AsFloat := NUM_UNIDADES_RE.AsFloat;
          ParamByName('peDiaRevision').AsFloat := DIA_REVISION.AsFloat;
          ParamByName('peFProxRevision').AsDateTime := F_PROX_REVISION.AsDateTime;
          ParamByName('peFIniPagCap').AsDateTime := F_INI_PAG_CAP.AsDateTime;
          ParamByName('peFIniPagInt').AsDateTime := F_INI_PAG_INT.AsDateTime;
          ParamByName('peBFinancAdic').AsString := B_FINANC_ADIC.AsString;
          //--- INICIO --- ASOR --- ABRIL 2016 ---
          IF F_FIN_PERGRA_FA.AsString = '' THEN
             ParamByName('peFFinPG_FA').Clear
          else
             ParamByName('peFFinPG_FA').AsDateTime := F_FIN_PERGRA_FA.AsDateTime;
          //--- FIN --- ASOR --- ABRIL 2016 ---
          ParamByName('peTxcomentarios').AsString := TX_COMENTARIOS.AsString;
          ParamByName('pePctComision').AsFloat := PCT_COMISION.AsFloat;
          ParamByName('peIdControlExt').AsString := ID_CONTROL_EXT.AsString;
          ParamByName('peCveOperativa').AsString := CVE_OPERATIVA.AsString;
          ParamByName('peCveTipoTasa').AsString := CVE_TIPO_TASA.AsString;
          ParamByName('peNumFolFideicom').AsString := NUM_FOL_FIDEICOM.AsString;
          ParamByName('peCveGpoCapitaliz').AsString := CVE_GPO_CAPITALIZ.AsString;
          //<LOLS 03MAR2006 CLAVE DE CALCULO DE IVA DE INTERES>
          ParamByName('peCveCalcIVAInt').AsString := CVE_CALC_IVA_INT.AsString;
          //</LOLS>
          //17AGO2006 CLAVE DE MEDIO POR LA CUAL INGRESAN LAS OPERACIONES
//          ParamByName('peCveMedio').AsString := 'CREDIT'
          //<LOLS/>
          //<RABA> SEP 2013
          // INTEGRACION DE O17
          If vgcvemedio = '' then
             ParamByName('peCveMedio').AsString := 'CREDIT'
          else
             ParamByName('peCveMedio').AsString := vgcvemedio;
          //</RABA>
          //</SST>
          //06MAY2011 SOLICITUD WEB
          ParamByName('peIdSolicitud').AsInteger:= vgIdSolWeb;
          //<SST/>
          ExecProc;
          //SI CARGA MANDA EL CREDITO Y Y LA SITUACION DEL MISMO
          if ParamByName('PSResultado').AsInteger = 0 then
          begin
             ID_CREDITO.AsInteger := ParamByName('psIdCredito').AsInteger;
             vlResult := True;
          end
          else // SI NO REALIZA LA CARGA MANDA ERRORES
          Begin
             ShowMessage('Alta de Disposición, Error [ ' +
                         ParamByName('psRESULTADO').AsString + '] ' +
                         ParamByName('psTxResultado').AsString);
             GenMsg('Alta de Disposición, Error [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                    ParamByName('psTxResultado').AsString,Apli);
          end;
          UnPrepare;
       end;
    finally
       STPObtCredito.Free;
    end;
    if vlResult then
    begin
         // RABA NOV 2014 ACTUALIZACION B-6
         // ANTES DE DAR DE ALTA LA NUEVA DISPOSICIÓN, EN CASO DE QUE SEA UNA DISPOSICIÓN CALIFICADA COMO RENOVACION
         // SE DEBEN DAR DE ALTA LOS CRÉDITOS INVOLUCRADOS EN LA EVALUACÍÓN EN LA TABLA CR_RR_CREDITO
         IF (VGTIPO_DISPOSICION = 'RE') and (vgDispRen) THEN
         begin
            ShowMessage('Renovación por nueva disposición');

            vlsql := 'SELECT DISTINCT IMPAGO.ID_CREDITO ' + coCRLF +
                     'FROM ' + coCRLF +
                     ' (SELECT CRE.ID_CREDITO, COUNT(*) TOTAL ' + coCRLF +
                     '    FROM CR_CAPITAL CP, CR_CREDITO CRE ' + coCRLF +
                     '    WHERE CP.ID_CREDITO = CRE.ID_CREDITO ' + coCRLF +
                     '      AND CRE.SIT_CREDITO = ''AC'' ' + coCRLF +
                     '      AND CP.SIT_CAPITAL = ''IM'' ' + coCRLF +
                     '      AND CRE.ID_CONTRATO = ' + ID_CONTRATO.AsString + coCRLF +
                     '    GROUP BY CRE.ID_CREDITO ' + coCRLF +
                     '   UNION ' + coCRLF +
                     '    SELECT CRE.ID_CREDITO, COUNT(*) TOTAL ' + coCRLF +
                     '    FROM CR_FINAN_ADIC FN, CR_CREDITO CRE ' + coCRLF +
                     '    WHERE FN.ID_CREDITO = CRE.ID_CREDITO ' + coCRLF +
                     '      AND CRE.SIT_CREDITO = ''AC'' ' + coCRLF +
                     '      AND FN.SIT_FINAN_ADIC = ''IM'' ' + coCRLF +
                     '      AND CRE.ID_CONTRATO = ' + ID_CONTRATO.AsString + coCRLF +
                     '    GROUP BY CRE.ID_CREDITO ' + coCRLF +
                     '   UNION ' + coCRLF +
                     '    SELECT CRE.ID_CREDITO, COUNT(*) TOTAL ' + coCRLF +
                     '    FROM CR_INTERES CI, CR_CREDITO CRE ' + coCRLF +
                     '    WHERE CI.ID_CREDITO = CRE.ID_CREDITO ' + coCRLF +
                     '      AND CRE.SIT_CREDITO = ''AC'' ' + coCRLF +
                     '      AND CI.SIT_INTERES = ''IM'' ' + coCRLF +
                     '      AND CRE.ID_CONTRATO = ' + ID_CONTRATO.AsString + coCRLF +
                     '    GROUP BY CRE.ID_CREDITO) IMPAGO ' + coCRLF +
                     'ORDER BY ID_CREDITO ' + coCRLF;

            qyQuery:= GetSQLQuery(VLSQL, DataBaseName, SessionName, False);
            try
              If qyQuery <> Nil Then
              Begin
                While (not qyQuery.Eof) and (vlResult) do
                begin
                  // RABA OCT SE DEBE OBTENER EL IMPORTE DE CADA CREDITO 
                  vlImpCred := ObtenAdeudoCred(qyQuery.FieldByName('ID_CREDITO').AsInteger, FormatDateTime('DD/MM/YYYY',Apli.DameFechaEmpresa));

                  stp := TStoredProc.Create(Nil);
                  If Assigned(stp) Then
                  begin
                      With stp Do
                      begin
                          Try
                             DatabaseName := Apli.DataBaseName;
                             SessionName  := Apli.SessionName;
                             StoredProcName := 'PKGCRPRORRCM.STPAGREGAELEMENTO';
                             Params.CreateParam(ftInteger,'PEFOLGRUPORENUEVA',ptInput);
                             Params.CreateParam(ftInteger,'PEIDCREDRENOVADO',ptInput);
                             Params.CreateParam(ftString,'PETIPODISPOSICION',ptInput);
                             Params.CreateParam(ftDate,'PEFVALOR',ptInput);
                             Params.CreateParam(ftFloat,'PEIMPOPERACION',ptInput);
                             Params.CreateParam(ftFloat,'PEIMPAUTORIZADO',ptInput);
                             Params.CreateParam(ftFloat,'PEIMPINCREMENTO',ptInput);
                             Params.CreateParam(ftInteger,'PSFOLGRUPORENUEVA',ptOutput);
                             Params.CreateParam(ftString,'PECVEOBSERVACION',ptInput);
                             Params.CreateParam(ftString,'PEBIMPIMPAGADO',ptInput);
                             Params.CreateParam(ftString,'PEBGENTRASVEN', ptInput);
                             Params.CreateParam(ftString,'PEBNUEVADISP', ptInput);
                             Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
                             Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
                             Prepare;
                             ParamByName('PEFOLGRUPORENUEVA').AsInteger := VGFOL_GRUPO_RENUEVA;
                             ParamByName('PEIDCREDRENOVADO').AsFloat := qyQuery.FieldByName('ID_CREDITO').AsFloat;
                             ParamByName('PEIMPOPERACION').AsFloat := vlImpCred;
                             ParamByName('PEIMPAUTORIZADO').AsFloat := vlImpCred;
                             ParamByName('PEIMPINCREMENTO').AsFloat := 0;
                             ParamByName('PETIPODISPOSICION').AsString := 'RE';
                             ParamByName('PEFVALOR').AsDateTime := Apli.DameFechaEmpresa;
                             ParamByName('PECVEOBSERVACION').AsString:= '';
                             ParamByName('PEBIMPIMPAGADO').AsString:= 'V';
                             ParamByName('PEBGENTRASVEN').AsString := 'F';
                             ParamByName('PEBNUEVADISP').AsString := 'V';
                             ExecProc;
                             if ParamByName('PSRESULTADO').AsInteger <> 0 then
                             begin
                                  ShowMessage(ParamByName('PSTXRESULTADO').AsString);
                                  vlResult := False;
                             end
                             else
                             begin
                                  VGFOL_GRUPO_RENUEVA := ParamByName('PSFOLGRUPORENUEVA').AsInteger;
                                  ID_CRE_RENUEVA.AsInteger := VGFOL_GRUPO_RENUEVA;
                                  vlResult := True;
                             end;
                          Finally
                             Close;
                             Params.Clear;
                             Free;
                          End;
                      end;
                  end;
                  qyQuery.Next;
                end;
              End;
            finally
              qyQuery.Free;
            end;
         end;
         // FIN RABA

//         if ((VGTIPO_DISPOSICION = 'RE') or (VGTIPO_DISPOSICION = 'RS') or (VGTIPO_DISPOSICION = 'CM')) then //RABA 18 JUL 2011 SE AGREGA LIQUIDACION/COLOCACION
         if ( (VGTIPO_DISPOSICION = 'RE') or
              (VGTIPO_DISPOSICION = 'RS') or
              (VGTIPO_DISPOSICION = 'CM') or ((VGTIPO_DISPOSICION = 'DI') AND (VG_OpEv_LC)) ) then
            vlResult := ActualizaFolRRRS;
         //end if;
    end;

    //HERJA ACTUALIZA NUEVO CAMPO CVE_CALIDAD_GTIA
    If vlResult then
    begin
      vlsql := ' UPDATE CR_CREDITO ' +
               ' SET CVE_CALIDAD_GTIA = '''+ CVE_CALIDAD_GTIA.AsString +''''+
               ' WHERE ID_CREDITO = '+ ID_CREDITO.AsString + '';
      if not (RunSQL(vlsql,Apli.DataBaseName, Apli.SessionName,False)) then
         vlResult := False;
      //HERJA SEPTIEMBRE 2013
      vlsql := ' UPDATE CR_CREDITO ' +
               ' SET B_INT_DIASIG = '''+ B_INT_DIASIG.AsString +''''+
               ' WHERE ID_CREDITO = '+ ID_CREDITO.AsString + '';
      if not (RunSQL(vlsql,Apli.DataBaseName, Apli.SessionName,False)) then
         vlResult := False;

    end;
    
    InsertaCredito := vlResult;
End;

//Sobreescribiendo el Internal Post
Function TCrCredito.InternalPost : Boolean;
Var       VLSalida     : Boolean;
begin
     InternalPost := False;
     VLSalida := False;
     if Modo=moEdit then
     begin
          Result:=Inherited InternalPost;
          VLSalida := True;
     end;
     if Modo=moAppend then
     begin
        try
           if InsertaCredito then
           Begin
              VLSalida := StpReactivaDisp(ID_CREDITO.AsInteger);
              //if vlSalida then
                 //ShowMessage('Terminó el Alta de la Disposición : ' + ID_CREDITO.AsString);
                 //HERJA SE COMENTA Y SE ENVIA EL MENSAJE EN EL DESPUES DEL ONACEPTAR YA QUE SE HALLA VALIDADO
           end;
        Except
          on e: exception do
          bEGIN
           Beep;Beep;Beep;Beep;
           ShowMessage('Problemas con el Alta de la Disposición. Avise Urgentemente a Sistemas');
           ShowMessage(e.Message);
          end;
         end;
     end;
     InternalPost := VLSalida;
End;

procedure TCrCredito.CambioSituacion(Sender: TObject);
begin
   //CAMBIA LA SITUACION DEL CREDITO
   If (SIT_CREDITO.Control<>nil) and (SIT_CREDITO.Control is TLabel) then
      TLabel(SIT_CREDITO.Control).Caption:=SIT_CREDITO.AsCombo;
   //end if
end;

procedure TCrCredito.CambioTipoCredito(Sender: TObject);
begin
   //CAMBIA LA SITUACION DEL CREDITO
   If (TIPO_DISPOSICION.Control<>nil) and (TIPO_DISPOSICION.Control is TLabel) then
      TLabel(TIPO_DISPOSICION.Control).Caption:=TIPO_DISPOSICION.AsCombo;
   //end if
end;

{--------------------------  AUTORIZA DISPOSICIÓN  ----------------------------}
function TCrCredito.StpAutoriza(pIdCredito: Integer): Boolean;
var   sptAutoriza : TStoredProc;
      vlResultado : Boolean;
Begin
   vlResultado := True;
   try
     Inicializa_EsOpEv_LC;
     sptAutoriza := TStoredProc.Create(Self);
     with sptAutoriza do
     begin
        //Inicia el SPT
        sptAutoriza.DatabaseName:= Apli.DatabaseName;
        sptAutoriza.SessionName:= Apli.SessionName;
        sptAutoriza.StoredProcName:= 'PKGCRCREDITO.STPAUTORIZADISP';
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
        Params.CreateParam(ftString,'PECVEUSUAUT',ptInput);
        Params.CreateParam(ftInteger,'PEFOLGRUPORENUEVA',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);

        // </ ASTECI:AARJ >
        // 15 FEB 2010 el parámetro PETIPODISPOSICION sólo se considerará
        // cuando se lleve a cabo la operación eventual LC (liq. colocación)
        // con lo que la variable VG_OpEv_LC estará en  True
        // El SP STPAUTORIZADISP se modificó también para poder procesar la
        // op. LC, generando primero la colocación y después la liquidación
        // esto se lleva a cabo sólo trantándose de LC. Se agregó lo siguiente:
        if (VG_OpEv_LC {True}) then
          Params.CreateParam(ftString,'PETIPODISPOSICION',ptInput);
        // < ASTECI:AARJ />

        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('peIdCredito').AsInteger := pIdCredito;
        ParamByName('peCveUsuAut').AsString := Apli.Usuario;
        // AARJ 05 DE MAYO DE 2010 inicio, dada la unificación del código contra el que tiene HEGC se implemento la siguiente validación
        // para asignarle valor al parametro de PEFOLGRUPORENUEVA
        if (VG_OpEv_LC {True}) then
	   ParamByName('PEFOLGRUPORENUEVA').AsInteger := VGFOL_GRUPO_RENUEVA
        else
          ParamByName('PEFOLGRUPORENUEVA').AsInteger := ID_CRE_RENOVADO.AsInteger;

        // AARJ 05 DE MAYO DE 2010 fin
        ParamByName('peBCommit').AsString := CVERDAD;

        // </ ASTECI:AARJ >
        // 15 FEB 2010
        // El parámetro PETIPODISPOSICION sólo se incializa cuando se
        // esté autorizando una Liquidación - Colocación
        // se agregó lo siguiente:
        if (VG_OpEv_LC {True}) then
        begin
          ParamByName('PETIPODISPOSICION').AsString := 'LC';
        // TODO: Condicionar si en funcion de VGFOL_GRUPO_RENUEVA el ID_CRED_RENOVADO
        // sigue activo, si no hacer vlResultado:= False; un ShowMessage y un GenMsg
        // SELECT ID_CREDITO, SIT_CREDITO FROM CR_CREDITO
        //  WHERE ID_CREDITO  = :(ID_CRED_RENOVADO) --265837
        //    AND SIT_CREDITO = 'AC'
        // < ASTECI:AARJ />
        end;

        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           ShowMessage( IntToStr(ParamByName('psRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
           GenMsg('Disposición' + IntToStr(pIdCredito) +
                  'Desc: [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                  ParamByName('psTxResultado').AsString,Apli);
        end;
        //end if;
     end;
   finally
      sptAutoriza.Free;
   end;
   StpAutoriza := vlResultado;
end;
{--------------------------  CANCELA DISPOSICIÓN  ----------------------------}
function TCrCredito.StpCancelaDisp(pIdCredito: Integer): Boolean;
var   sptCancela: TStoredProc;
      vlResultado : Boolean;
Begin
   vlResultado := True;
   try
     sptCancela := TStoredProc.Create(Self);
     with sptCancela do
     begin
        //Inicia el SPT
        sptCancela.DatabaseName:= Apli.DatabaseName;
        sptCancela.SessionName:= Apli.SessionName;
        sptCancela.StoredProcName:= 'PKGCRCREDITO.STPCANCELADISP';
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
        Params.CreateParam(ftString,'PECVEUSUCAN',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('peIdCredito').AsInteger := pIdCredito;
        ParamByName('peCveUsuCan').AsString := Apli.Usuario;
        ParamByName('peBCommit').AsString := CVERDAD;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           ShowMessage( IntToStr(ParamByName('psRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
           GenMsg('Disposición' + IntToStr(pIdCredito) +
                  'Desc: [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                  ParamByName('psTxResultado').AsString,Apli);
        end;
        //end if;
     end;
   finally
      sptCancela.Free;
   end;
   StpCancelaDisp := vlResultado;
end;
{--------------------------  RECHAZA DISPOSICIÓN  ----------------------------}
function TCrCredito.StpRechazaDisp(pIdCredito: Integer; pMotivo: String): Boolean;
var   sptRechaza : TStoredProc;
      vlResultado : Boolean;
Begin
   vlResultado := True;
   try
     sptRechaza := TStoredProc.Create(Self);
     with sptRechaza do
     begin
        //Inicia el SPT
        sptRechaza.DatabaseName:= Apli.DatabaseName;
        sptRechaza.SessionName:= Apli.SessionName;
        sptRechaza.StoredProcName:= 'PKGCRCREDITO.STPRECHAZADISP';
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
        Params.CreateParam(ftString,'PEDESCMOTIVO',ptInput);
        Params.CreateParam(ftString,'PECVEUSURE',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('peIdCredito').AsInteger := pIdCredito;
        ParamByName('peDescMotivo').AsString := pMotivo;
        ParamByName('peCveUsuRE').AsString := Apli.Usuario;
        ParamByName('peBCommit').AsString := CVERDAD;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           ShowMessage( IntToStr(ParamByName('psRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
           GenMsg('Disposición' + IntToStr(pIdCredito) +
                  'Desc: [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                  ParamByName('psTxResultado').AsString,Apli);
        end
        else GenMsg('Se ha rechazado la Disposición < ' + IntToStr(pIdCredito) +'>',Apli);
        //end if;
     end;
   finally
      sptRechaza.Free;
   end;
   StpRechazaDisp := vlResultado;
end;
{--------------------------  REACTIVA DISPOSICIÓN  ----------------------------}
function TCrCredito.StpReactivaDisp(pIdCredito: Integer): Boolean;
var   sptReactiva : TStoredProc;
      vlResultado : Boolean;
Begin
   vlResultado := True;
   try
     sptReactiva := TStoredProc.Create(Self);
     with sptReactiva do
     begin
        //Inicia el SPT
        sptReactiva.DatabaseName:= Apli.DatabaseName;
        sptReactiva.SessionName:= Apli.SessionName;
        sptReactiva.StoredProcName:= 'PKGCRCREDITO.STPREACTIVADISP';
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('peIdCredito').AsInteger := pIdCredito;
        ParamByName('peBCommit').AsString := CVERDAD;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           ShowMessage( IntToStr(ParamByName('psRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
           GenMsg('Disposición' + IntToStr(pIdCredito) +
                  'Desc: [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                  ParamByName('psTxResultado').AsString,Apli);
        end;
        //end if;
     end;
   finally
      sptReactiva.Free;
   end;
   StpReactivaDisp := vlResultado;
end;
{--------------------------  BUSCA SIGUIENTE FECHA  ----------------------------}
// SATV4766
function TCrCredito.StpBusSigFecha(PPFInicioPag,PPFVencimiento : TDateTime;PPUnidadTiempo : String;
                                   PPENumUnidades,PPDiaPago : Integer;
                                   PPEDMinReqPer : Integer = 0;
                                   PPENumDiasAgrPer : Integer = 0): TDateTime;

          function StpObtenFIniPago(PPFInicioPag,PPFVencimiento : TDateTime;PPUnidadTiempo : String;
                                    PPENumUnidades,PPDiaPago : Integer) : TDateTime;
          var   sptBusFecha : TStoredProc;
                vlResultado : Boolean;
                VLFVencimiento : TDateTime;
          begin
             vlResultado := True;
             try
               sptBusFecha := TStoredProc.Create(Self);
               with sptBusFecha do
               begin
                  //Inicia el SPT
                  sptBusFecha.DatabaseName:= Apli.DatabaseName;
                  sptBusFecha.SessionName:= Apli.SessionName;
                  sptBusFecha.StoredProcName:= 'PKGCRCUOTAS.STPOBTENFINIPAGO';
                  Params.Clear;
                  Params.CreateParam(ftDateTime,'PEFAUTORIZA',ptInput);
                  Params.CreateParam(ftDateTime,'PEFVENCIMIENTO',ptInput);
                  Params.CreateParam(ftString, 'PEUNIDADTIEMPO',ptInput);  //HERJA 11.06.2010
                  Params.CreateParam(ftString, 'PENUMUNIDADES',ptInput);  //HERJA 11.06.2010
                  Params.CreateParam(ftString, 'PEALTADISP',ptInput);  //HERJA 11.06.2010
                  Params.CreateParam(ftInteger,'PEDIAPAGO',ptInput);
                  Params.CreateParam(ftDateTime,'PSFINICIOPAG',ptOutput);
                  Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
                  Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
                  Prepare;
                  ParamByName('PEFAUTORIZA').AsDateTime := PPFInicioPag;
                  ParamByName('PEFVENCIMIENTO').AsDateTime := PPFVencimiento;
                  ParamByName('PEUNIDADTIEMPO').AsString := PPUnidadTiempo;     //HERJA 11.06.2010
                  ParamByName('PENUMUNIDADES').AsInteger := PPENumUnidades;     //HERJA 11.06.2010
                  ParamByName('PEALTADISP').AsString := 'V';     //HERJA 11.06.2010
                  ParamByName('PEDIAPAGO').AsInteger := PPDiaPago;
                  ExecProc;
                  if (ParamByName('PSRESULTADO').AsInteger <> 0) then
                  Begin
                     ShowMessage( IntToStr(ParamByName('PSRESULTADO').AsInteger)  + ' : ' +
                                  ParamByName('PSTXRESULTADO').AsString );
                  end
                  else
                     VLFVencimiento := ParamByName('PSFINICIOPAG').AsDateTime;
                  //end if;
               end;
             finally
                sptBusFecha.Free;
             end;
             Result := VLFVencimiento;
          end;


          function StpObtenFIniPagoMinPzo(PPFInicioPag,PPFVencimiento : TDateTime;PPUnidadTiempo : String;
                                          PPENumUnidades,PPDiaPago, PPEDMinReqPer, PPENumDiasAgrPer : Integer) : TDateTime;
          var   Stp : TStoredProc;
                vlResultado : Boolean;
                VLFVencimiento : TDateTime;
          begin
             vlResultado := True;
             try
               Stp := TStoredProc.Create(Self);
               If Assigned(Stp) Then
                 with Stp do
                 begin
                    //Inicia el SPT
                    DatabaseName := Apli.DatabaseName;
                    SessionName  := Apli.SessionName;
                    StoredProcName:= 'PKGCRCUOTAS.STPOBTENFINIPAGOMINPZO';
                    Params.Clear;
                    Params.CreateParam(ftDateTime,'PEFAUTORIZA',ptInput);
                    Params.CreateParam(ftDateTime,'PEFVENCIMIENTO',ptInput);
                    Params.CreateParam(ftInteger,'PEDIAPAGO',ptInput);
                    Params.CreateParam(ftString,'PEUNIDADTIEMPO',ptInput);
                    Params.CreateParam(ftInteger,'PENUMUNIDADES',ptInput);
                    Params.CreateParam(ftInteger,'PEDMINREQPER',ptInput);
                    Params.CreateParam(ftInteger,'PENUMDIASAGRPER',ptInput);
                    Params.CreateParam(ftDateTime,'PSFINICIOPAG',ptOutput);
                    Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
                    Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
                    ParamByName('PEFAUTORIZA').AsDateTime := PPFInicioPag;
                    ParamByName('PEFVENCIMIENTO').AsDateTime := PPFVencimiento;
                    ParamByName('PEUNIDADTIEMPO').AsString := PPUnidadTiempo;
                    ParamByName('PENUMUNIDADES').AsInteger := PPENumUnidades;
                    ParamByName('PENUMDIASAGRPER').AsInteger := PPENumDiasAgrPer;
                    ParamByName('PEDMINREQPER').AsInteger := PPEDMinReqPer;
                    ExecProc;
                    If (ParamByName('PSRESULTADO').AsInteger <> 0) Then
                    Begin
                       ShowMessage( IntToStr(ParamByName('PSRESULTADO').AsInteger) + ' : ' +
                                    ParamByName('PSTXRESULTADO').AsString );
                    End
                    Else
                       VLFVencimiento := ParamByName('PSFINICIOPAG').AsDateTime;
                 end;
               finally
                  Stp.Free;
               end;
             Result := VLFVencimiento;
          end;

begin
  If (ContratoCre.Producto.CVE_GEN_TIP_PAG.AsString = CPAGTRA) Then
     Begin
     Result := StpObtenFIniPago(PPFInicioPag, PPFVencimiento, PPUnidadTiempo, PPENumUnidades, PPDiaPago);
     End
  Else If (ContratoCre.Producto.CVE_GEN_TIP_PAG.AsString = CPAGNIV) Then
     Begin
     Result := StpObtenFIniPagoMinPzo(PPFInicioPag, PPFVencimiento, PPUnidadTiempo, PPENumUnidades, PPDiaPago,
                                      PPEDMinReqPer, PPENumDiasAgrPer);
     End;
end;


{--------------------------  AUTORIZA DISPOSICIÓN  ----------------------------}
function TCrCredito.StpValidaRSRE(pIdCredito: Integer): Boolean;
var   StpValida : TStoredProc;
      vlResultado : Boolean;
Begin
   vlResultado := True;
   try
     StpValida := TStoredProc.Create(Self);
     with StpValida do
     begin
        //Inicia el SPT
        StpValida.DatabaseName:= Apli.DatabaseName;
        StpValida.SessionName:= Apli.SessionName;
        StpValida.StoredProcName:= 'PKGCRCREDITO.STPVALIDA_RENRES';
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
        Params.CreateParam(ftString, 'PSValidacion',ptOutput);
        Params.CreateParam(ftFloat,  'PSResultado',ptOutput);
        Params.CreateParam(ftString, 'PSTxResultado',ptOutput);
        Prepare;
        ParamByName('PEIDCREDITO').AsInteger := pIdCredito;

        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;

           ShowMessage( IntToStr(ParamByName('PSResultado').AsInteger)  + ' : ' +
                        ParamByName('PSTxResultado').AsString );
           GenMsg('Disposición' + IntToStr(pIdCredito) +
                  'Desc: [' + IntToStr(ParamByName('PSResultado').AsInteger)+'] '+
                  ParamByName('PSTxResultado').AsString,Apli);
        end;
        if (ParamByName('PSResultado').AsInteger = 0) then
        begin
           if ParamByName('PSValidacion').AsString = 'V' then vlResultado:=true;

           if ParamByName('PSValidacion').AsString = 'F' then
           begin
              ShowMessage( ParamByName('PSTxResultado').AsString);
              vlResultado := False;
           end;
        end;
        //end if;
     end;
   finally
      StpValida.Free;
   end;
   StpValidaRSRE := vlResultado;
end;


Procedure   TCrCredito.ObtenSaldoDispAcred(var PPImpDispAcre, PPImpDispAcreGpo, PPImpDisponible : Double);
begin//
end;

Procedure  TCrCredito.ArmaTabla;
var STPObtSuc  : TStoredProc;
begin
     try
          STPObtSuc:=TStoredProc.Create(Nil);
          STPObtSuc.DatabaseName:= Apli.DatabaseName;
          STPObtSuc.SessionName:= Apli.SessionName;
          STPObtSuc.StoredProcName:='PKGCRCUOTAS.STPGENCRCONCEPTOS';
          STPObtSuc.Params.CreateParam(ftInteger,'PEIdCredito',ptInput);
          STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
          STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
          STPObtSuc.Prepare;
          STPObtSuc.ParamByName('PEIdCredito').AsInteger := ID_CREDITO.AsInteger;
          STPObtSuc.ExecProc;
          if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
               ShowMessage('PROBLEMAS AL ARMAR TABLA CREDITO: ' + IntToStr(STPObtSuc.ParamByName('PSResultado').AsInteger) + STPObtSuc.ParamByName('PSTXResultado').AsString);
          //end if;
     finally
            STPObtSuc.Free;
     end;
end;

procedure TCrCredito.RestauraTabla;
var stpResTab  : TStoredProc;
begin
     try
          stpResTab:=TStoredProc.Create(Nil);
          stpResTab.DatabaseName:= Apli.DatabaseName;
          stpResTab.SessionName:= Apli.SessionName;
          stpResTab.StoredProcName:='PKGCRCUOTAS.STPREESPERIODCR';
          stpResTab.Params.CreateParam(ftInteger,'peIdCredito',ptInput);
          stpResTab.Params.CreateParam(ftInteger,'peBCommit',ptInput);
          stpResTab.Params.CreateParam(ftFloat,'psResultado',ptOutput);
          stpResTab.Params.CreateParam(ftString,'psTxResultado',ptOutput);
          stpResTab.Prepare;
          stpResTab.ParamByName('peIdCredito').AsInteger := ID_CREDITO.AsInteger;
          stpResTab.ParamByName('peBCommit').AsString := 'V';
          stpResTab.ExecProc;
          if (stpResTab.ParamByName('psResultado').AsInteger <> 0) then
               ShowMessage('PROBLEMAS AL RESTAURAR TABLA DE PERIODOS: ' +
               IntToStr(stpResTab.ParamByName('psResultado').AsInteger) +
                        stpResTab.ParamByName('psTXResultado').AsString);
          //end if;
     finally
            stpResTab.Free;
     end;
end;


{--------------------------  DA DE ALTA LA PROGRAMACIÓN DE COMISIONES --------------------------}
Procedure TCrCredito.StpComisProg(pIdCredito: Integer);
var   StpComis : TStoredProc;
      vlResultado : Boolean;
Begin
   vlResultado := True;
   try
     StpComis := TStoredProc.Create(Self);
     with StpComis do
     begin
        //Inicia el SPT
        StpComis.DatabaseName:= Apli.DatabaseName;
        StpComis.SessionName:= Apli.SessionName;
        StpComis.StoredProcName:= 'PKGCRCOMISIONES.STPCOMISPROG';
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
        Params.CreateParam(ftString,'PECVEUSUALTA',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('peIdCredito').AsInteger := pIdCredito;
        ParamByName('peCveUsuAlta').AsString := Apli.Usuario;
        ParamByName('peBCommit').AsString := CVERDAD;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           ShowMessage( IntToStr(ParamByName('psRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
           GenMsg('Disposición' + IntToStr(pIdCredito) +
                  'Desc: [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                  ParamByName('psTxResultado').AsString,Apli);
        end;
        //end if;
     end;
   finally
      StpComis.Free;
   end;
end;
{--------------------------  RESPALDA DISPOSICIÓN  ----------------------------}
function TCrCredito.StpRespaldaDisp(pIdCredito: Integer; pMetodo: String): Boolean;
var   sptReespalda : TStoredProc;
      vlResultado : Boolean;
Begin
   vlResultado := True;
   try
     sptReespalda := TStoredProc.Create(Self);
     with sptReespalda do
     begin
        //Inicia el SPT
        sptReespalda.DatabaseName:= Apli.DatabaseName;
        sptReespalda.SessionName:= Apli.SessionName;
        sptReespalda.StoredProcName:= 'PKGCRPRORRCM.STPRESPALDOCREDORIG';
        Params.Clear;
        Params.CreateParam(ftString,'PEMETODO',ptInput);
        Params.CreateParam(ftInteger,'PEFOLGPORENUEVA',ptInput);
        Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('peMetodo').AsString         := pMetodo;
        ParamByName('peFolGpoRenueva').AsInteger := VGFOL_GRUPO_RENUEVA;
        ParamByName('peIdCredito').AsInteger     := pIdCredito;
        ParamByName('peBCommit').AsString        := CVERDAD;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           ShowMessage( IntToStr(ParamByName('psRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
           GenMsg('Disposición' + IntToStr(pIdCredito) +
                  'Desc: [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                  ParamByName('psTxResultado').AsString,Apli);
        end;
        //end if;
     end;
   finally
      sptReespalda.Free;
   end;
   StpRespaldaDisp := vlResultado;
end;
{--------------------------  Operaciones de Convenio o Evento de Aceleración  ----------------------------}
function TCrCredito.StpOperaConvenio(pIdCredito, pFolGpoRenovac: Integer; pMetodo: String): Boolean;
var   sptConvenio : TStoredProc;
      vlResultado : Boolean;
Begin
   vlResultado := True;
   try
     sptConvenio := TStoredProc.Create(Self);
     with sptConvenio do
     begin
        //Inicia el SPT
        sptConvenio.DatabaseName:= Apli.DatabaseName;
        sptConvenio.SessionName:= Apli.SessionName;
        sptConvenio.StoredProcName:= 'PKGCRPRORRCM.STP_OPERA_CONVENIO';
        Params.Clear;
        Params.CreateParam(ftInteger,'PEMETODO',ptInput);
        Params.CreateParam(ftInteger,'PEFOLGPORENUEVA',ptInput);
        Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
        Params.CreateParam(ftInteger,'PECVEUSUAUT',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('peMetodo').AsString := pMetodo;
        ParamByName('peFolGpoRenueva').AsInteger := pFolGpoRenovac;
        ParamByName('peIdCredito').AsInteger     := pIdCredito;
        ParamByName('peCveUsuAut').AsString      := Apli.Usuario;
        ParamByName('peBCommit').AsString        := CVERDAD;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           ShowMessage( IntToStr(ParamByName('psRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
           GenMsg('Disposición' + IntToStr(pIdCredito) +
                  'Desc: [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                  ParamByName('psTxResultado').AsString,Apli);
        end;
        //end if;
     end;
   finally
      sptConvenio.Free;
   end;
   StpOperaConvenio := vlResultado;
end;

(***********************************************FORMA CR_CREDITO********************)
(*                                                                              *)
(*  FORMA DE CR_CREDITO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CREDITO********************)

Procedure TWCrCredito.MuestraValidaRSRE;
var vlCount:integer;
begin
   btValidaRSRE.Visible:=false;
   if (Trim(edID_CREDITO.Text)<>'') AND (Trim(edID_CREDITO.Text)<>'0') then
   begin
      GetSQLInt('SELECT COUNT(*) COUNT '+
                '  FROM CR_RR_CREDITO CR, CR_CREDITO C '+
                ' WHERE CR.ID_CRED_RENUEVA = ' + Objeto.ID_CREDITO.AsString+
                '   AND CR.SIT_RENUEVA=''NA'' '+
                '   AND CR.ID_CRED_RENUEVA = C.ID_CREDITO '+
                '   AND C.SIT_CREDITO = ''NA'' ',
                Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,'COUNT',vlCount ,False);
      If vlCount > 0 Then
      begin
         btValidaRSRE.Visible:=true;
      end;
   end;
end;

Function TWCrCredito.FindCredOrigen : Boolean;
var vlsql: String;    vlCount: Integer;
Begin
     vlsql:= ' SELECT COUNT(*) COUNT FROM CR_CREDITO_REST WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsString +
             '  AND FOL_GRUPO_RENUEVA = ' + Objeto.ID_CRE_RENUEVA.AsString;
     GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlCount,False);
     if vlCount = 1 then
        Result := True
     else
        Result := False;
end;

Function TWCrCredito.ValidaGarantia : String;
var vlsql: String;    vlCount: Integer;
Begin
     if Objeto.ContratoCre.Producto.B_GARANTIA.AsString = 'V' then
     begin
        vlsql:= ' SELECT COUNT(*) COUNT FROM CR_GA_DIS_GAR WHERE ID_DISPOSICION = ' + Objeto.ID_CREDITO.AsString;
        GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlCount,False);
        if vlCount = 0 then
        begin
           {No encontro garantia}
           vlsql:= 'SELECT count(ID_CONTRATO) COUNT FROM CR_GA_FIRA_CTO WHERE  ID_CONTRATO ='+ Objeto.ID_CONTRATO.AsString;
           GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlCount,False);
           if  vlCount = 0 then
              {No encontro garantia fira}
                Result := 'Falta Adicionar Garantías a la disposición,'
           else

              if Objeto.CVE_OPERATIVA.AsString = CNULL then  //no tiene operativa
                 Result := 'Falta asociar la operativa a la disposición, '
              else
                 Result := CNULL;
        end
        else
            Result := CNULL;
     end       
     else
        Result := CNULL;
     
end;

Procedure TWCrCredito.AsignaDatosRR(PPIDCredito : String);
var qyQuery : TQuery;
    sSQL    : String;
    vlHayVencidos : Integer;
begin
     if Objeto.VGFOL_GRUPO_RENUEVA <> 0 then
     begin
          Objeto.SIT_CREDITO.AsString := 'NA';
          Objeto.TIPO_DISPOSICION.AsString := Objeto.VGTIPO_DISPOSICION;
          Objeto.ID_CRE_RENUEVA.AsInteger := Objeto.VGFOL_GRUPO_RENUEVA;
     end;

     // </ RABA> 24 MAY 2011
     // Se localiza el contrato destino indicado en la pantalla de Renovacion,
     // Reestructuración, Conv. Modificatorio,...
     If Objeto.VGID_CONTRATO_RR <> 0 then
     begin
        if Objeto.ContratoCre.FindKey([Objeto.VGID_CONTRATO_RR,'1']) then
        begin
           icpCONTRATO.RefrescaInfo;
           TipoPagoAUsar;
           iedID_CONTRATOExit(Self);
        end;
     end;
     // < RABA />

     if Objeto.VGID_CREDITO_RR <> 0 then
     begin
       // </ RABA > 24 MAY 2011
       // Se elimina el código toda vez que se agregó la busqueda del contrato
       // destino
       //if ((Objeto.VGTIPO_DISPOSICION = 'CM') or (Objeto.VGTIPO_DISPOSICION = 'EA')) then
       //begin
       //     objeto.ContratoCre.BuscaWhereString := objeto.ContratoCre.BuscaWhereString +
       //                                           'AND CR_CONTRATO.ID_CONTRATO IN (SELECT ID_CONTRATO FROM CONTRATO WHERE ID_TITULAR = ' + objeto.ContratoCre.Contrato.ID_Titular.AsString + ')';;
       //     objeto.ContratoCre.FilterString := objeto.ContratoCre.BuscaWhereString;
       //     iedID_CONTRATO.SetFocus;
       //end
       //else begin
       // < RABA />

       // </ RABA> 24 MAY 2011
       // Se cambia la condición para que ejecute el código siempre y cuando no sea CM o EA
       if ((Objeto.VGTIPO_DISPOSICION <> 'CM') and (Objeto.VGTIPO_DISPOSICION <> 'EA')) then
       begin
       // < RABA />
         sSQL := 'SELECT * FROM CR_CREDITO WHERE ID_CREDITO = ' + PPIDCredito;
         qyQuery:= GetSQLQuery(sSQL, Objeto.DataBaseName, Objeto.SessionName, False);
         try
            If qyQuery <> Nil Then
            Begin
            // </ RABA > 24 MAY 2011
            // Se quita el filtrado del contrato toda vez que ya se esta indicando
            // desde la pantalla de Renovación, Reestructura, Conv. Modificatorio,....
            // este contrato provenia del crédito base
            //     //CONTRATO
            //     if Objeto.ContratoCre.FindKey([qyQuery.FieldByName('ID_CONTRATO').AsString,'1']) then
            //     begin
            //         iedID_CONTRATOExit(Self);
            // < RABA />
                      //TIPO_LIQUIDACIÓN
                     if Objeto.TipLiq.FindKey([qyQuery.FieldByName('CVE_LIQUIDACION').AsString]) then
                     begin
                          edCVE_LIQUIDACIONExit(Self);
                          //PROMOTOR ADMINISTRADOR
                          if Objeto.PromotorAdm.FindKey([qyQuery.FieldByName('ID_PROM_ADM').AsString]) then
                          begin
                               //edID_PROM_ADMExit(Self);  EASA 09.MAR.2007
                               Objeto.B_APLICA_IVA.AsString := qyQuery.FieldByName('B_APLICA_IVA').AsString;
                               Objeto.B_COB_AUT.AsString := qyQuery.FieldByName('B_COB_AUT').AsString;
                               Objeto.B_FINANC_ADIC.AsString := qyQuery.FieldByName('B_FINANC_ADIC').AsString;
                               Objeto.B_APLICA_COM.AsString := 'F';
                               Objeto.PCT_COMISION.AsInteger := 0;
                               Objeto.CVE_OPERATIVA.AsString := qyQuery.FieldByName('CVE_OPERATIVA').AsString;
                               Objeto.ID_CRED_EXTERNO.AsString := qyQuery.FieldByName('ID_CRED_EXTERNO').AsString;
                               Objeto.ID_CONTROL_EXT.AsString := qyQuery.FieldByName('ID_CONTROL_EXT').AsString;
                               Objeto.CVE_CALIF_CRE.AsString := qyQuery.FieldByName('CVE_CALIF_CRE').AsString;
                               //CALCULO DE INTERES
                               if Objeto.CalcInt.FindKey([qyQuery.FieldByName('CVE_CALCULO').AsString]) then
                               begin
                                    Objeto.FACT_MORAS.AsString := qyQuery.FieldByName('FACT_MORAS').AsString;
                                    //TASA REFERENCIA
                                    if Objeto.TasaRefer.FindKey([qyQuery.FieldByName('CVE_TASA_REFER').AsString]) then
                                    begin
                                         Objeto.CVE_TIPO_TASA.AsString := qyQuery.FieldByName('CVE_TIPO_TASA').AsString;
                                         Objeto.OPERADOR_STASA.AsString := qyQuery.FieldByName('OPERADOR_STASA').AsString;
                                         Objeto.SOBRETASA.AsString := qyQuery.FieldByName('SOBRETASA').AsString;
                                    end;
                               end;
                          end;
                     end;

//                 end;  // RABA 24 MAY 2011
            end;
         finally
            qyQuery.Free;
         end;
       end;
     end;
end;

procedure TWCrCredito.VerificaTasaRefer;
begin

   edCVE_TASA_REFER.Color := clWindow;
   edCVE_TASA_REFER.Enabled :=True;
   btTASA_REFER.Enabled := True;
   Objeto.TasaRefer.Active := True;
   cbOPERADOR_STASA.Color := clWindow;
   cbOPERADOR_STASA.Enabled :=True;
   edSOBRETASA.Color := clWindow;
   edSOBRETASA.Enabled :=True;

   if not InterForma1.IsNewData then Begin
      if Objeto.ContratoCre.Producto.B_MOD_TASA_REF_D.AsString = CFALSO then
      Begin
         edCVE_TASA_REFER.Color := clBtnFace;
         edCVE_TASA_REFER.Enabled :=False;
         btTASA_REFER.Enabled := False;
      end
      else
      Begin
         edCVE_TASA_REFER.Color := clWindow;
         edCVE_TASA_REFER.Enabled :=True;
         btTASA_REFER.Enabled := True;
         Objeto.TasaRefer.Active := True;
      end;

      if Objeto.ContratoCre.Producto.B_MOD_OP_STASA_D.AsString = CFALSO then
      Begin
         cbOPERADOR_STASA.Color := clBtnFace;
         cbOPERADOR_STASA.Enabled :=False;
      end
      else
      Begin
         cbOPERADOR_STASA.Color := clWindow;
         cbOPERADOR_STASA.Enabled :=True;
      end;

      if Objeto.ContratoCre.Producto.B_MOD_STASA_D.AsString = CFALSO then
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
end;

procedure TWCrCredito.AplicaComision;
begin
   if chB_APLICA_COM.Checked = False then
   Begin
      edPCT_COMISION.Enabled := False;
      edPCT_COMISION.Color := clBtnFace;
      edPCT_COMISION.Text := '0.0000';
   end
   else
   Begin
      edPCT_COMISION.Enabled := True;
      edPCT_COMISION.Color := clWindow;
   end;
end;

function TWCrCredito.CalculaFecha: TDateTime;
var vlFecha     : TDateTime;
    vlUniTiempo : Integer;
    vlNumUnid   : Integer;
    vlDiaPago   : Integer;
begin
   Result :=  Objeto.Apli.DameFechaEmpresa;
end;

procedure TWCrCredito.VerPagoCap;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
{CAPITAL/COMISINN   (CP,CO)
--0	NO APLICA  OPERACIONES FUERA DE BALANCE
--1	AMORTIZACIONES PERIÓDICAS AL CAPITAL DE MONTO IDÉNTICO  ok
--2	AMORTIZACIONES PERIÓDICAS AL CAPITAL DE MONTO DIFERENTE  ok
--3	AMORTIZACIONES IRREGULARES PAGOS REALIZADOS EN ESP  DE TIEMPO DIFERENTES
--4	AMORTIZACIÓN  ÚNICA AL VENCIMIENTO}
   BEGIN
      if (objeto.CVE_AMORTIZACION.AsString = '1') OR
         (objeto.CVE_AMORTIZACION.AsString = '2') OR
         (objeto.CVE_AMORTIZACION.AsString = '3') then
      begin
         bbUNIDAD_TIEMPO_CP.Enabled := True;
         edNUM_UNIDADES_CP.Enabled := True;
         cbDIA_PAGO_CAP.Enabled := True;
         edF_INI_PAG_CAP.Enabled := True; //019
         dtpF_INI_PAG_CAP.Enabled := True;
         edNUM_UNIDADES_CP.Color := clWindow;
         cbDIA_PAGO_CAP.Color := clWindow;
         edF_INI_PAG_CAP.Color := clWindow; //019
      end;
      if objeto.CVE_AMORTIZACION.AsString = '4' then
      Begin
         bbUNIDAD_TIEMPO_CP.Enabled := False;
         cbUNIDAD_TIEMPO_CP.Text := '';
         edNUM_UNIDADES_CP.Enabled := False;
         edNUM_UNIDADES_CP.Color := clBtnFace;
         edNUM_UNIDADES_CP.Text := '1';
         cbDIA_PAGO_CAP.Enabled := False;
         cbDIA_PAGO_CAP.Color := clBtnFace;
         cbDIA_PAGO_CAP.Text :='';
         edF_INI_PAG_CAP.Enabled := False; //019
         edF_INI_PAG_CAP.Color := clBtnFace; //019
         edF_INI_PAG_CAP.Text := edF_VENCIMIENTO.Text;      //019
         dtpF_INI_PAG_CAP.Enabled := False;

          Objeto.UNIDAD_TIEMPO_CP.GetFromControl;
          Objeto.NUM_UNIDADES_CP.GetFromControl;
          Objeto.DIA_PAGO_CAP.GetFromControl;
          Objeto.F_INI_PAG_CAP.GetFromControl;
      end;
   END;
end;

Procedure TWCrCredito.AsignaPagoCap;
begin
      if objeto.CVE_AMORTIZACION.AsString = '4' then
      Begin
           Objeto.F_INI_PAG_CAP.AsDateTime := Objeto.F_VENCIMIENTO.AsDateTime;
      end;
      if (objeto.CVE_AMORTIZACION.AsString = '1') OR
         (objeto.CVE_AMORTIZACION.AsString = '2') OR
         (objeto.CVE_AMORTIZACION.AsString = '3') then
      begin
           Objeto.NUM_UNIDADES_CP.AsInteger := 1;
           Objeto.F_INI_PAG_CAP.AsDateTime := CalculaFecha;
      end;
end;

procedure TWCrCredito.VerPagoInt;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
{--INTERÉS  (IN)
--0	NO APLICA  OPERACIONES FUERA DE BALANCE
--1	SI SE COBRAN EN SU TOTALIDAD POR ANTICIPADO
--2	SI SE COBRAN EN SU TOTALIDAD AL VENCIMIENTO
--3	SI SE COBRAN EN FORMA PERIÓDICA}

   BEGIN
      if ( objeto.CVE_PAG_INTERES.AsString = '1') or ( objeto.CVE_PAG_INTERES.AsString = '2') then
      Begin
         bbUNIDAD_TIEMPO_IN.Enabled := False;
         cbUNIDAD_TIEMPO_IN.Text := '';
         edNUM_UNIDADES_IN.Enabled := False;
         edNUM_UNIDADES_IN.Text := '1';
         edNUM_UNIDADES_IN.Color := clBtnFace;

         cbDIA_PAGO_INT.Enabled := False;
         cbDIA_PAGO_INT.Text := '';
         cbDIA_PAGO_INT.Color := clBtnFace;

         edF_INI_PAG_INT.Enabled := False; //019
         edF_INI_PAG_INT.Color := clBtnFace; //019
         dtpF_INI_PAG_INT.Enabled := False;
         if ( objeto.CVE_PAG_INTERES.AsString = '1') then
             edF_INI_PAG_INT.Text := edF_INICIO.Text
         else
             edF_INI_PAG_INT.Text := edF_VENCIMIENTO.Text;

        Objeto.UNIDAD_TIEMPO_IN.GetFromControl;
        Objeto.NUM_UNIDADES_IN.GetFromControl;
        Objeto.DIA_PAGO_INT.GetFromControl;
        Objeto.F_INI_PAG_INT.GetFromControl;
      end
      else
      Begin
         bbUNIDAD_TIEMPO_IN.Enabled := True;
         edNUM_UNIDADES_IN.Enabled := True;
         cbDIA_PAGO_INT.Enabled := True;
         edF_INI_PAG_INT.Enabled := True; //019
         dtpF_INI_PAG_INT.Enabled := True;
         edNUM_UNIDADES_IN.Color := clWindow;
         cbDIA_PAGO_INT.Color := clWindow;
         edF_INI_PAG_INT.Color := clWindow; //019
      end;
   END;
end;

Procedure  TWCrCredito.AsignaPagoInt;
begin
     if objeto.CVE_PAG_INTERES.AsString <> '3' then
     Begin
          Objeto.NUM_UNIDADES_IN.AsInteger := 1;
          Objeto.F_INI_PAG_INT.AsDateTime := CalculaFecha;

     end;
end;

procedure TWCrCredito.DeshabilitaBotonesXSit;
begin
   if (Objeto.SIT_CREDITO.AsString = CSIT_NA) OR
      (Objeto.SIT_CREDITO.AsString = CSIT_NP) then //HERJA AGOSTO 2012
   Begin
      btAUTORIZA.Enabled := True;
      btCANCELA.Enabled := True;
      Rechazar1.Enabled := True;
      Reactivar1.Enabled := False;
      //RABA MARZO 2015
      edTIPO_CARTERA.Visible := True;
   end
   else if ( Objeto.SIT_CREDITO.AsString = CSIT_AU ) OR
           ( Objeto.SIT_CREDITO.AsString = CSIT_AC ) then
   Begin
      btAUTORIZA.Enabled := False;
      btCANCELA.Enabled := True;
      Rechazar1.Enabled := False;
      Reactivar1.Enabled := False;
      //RABA MARZO 2015
      edTIPO_CARTERA.Visible := False;
   end
   else if ( Objeto.SIT_CREDITO.AsString = CSIT_CA ) OR
           ( Objeto.SIT_CREDITO.AsString = CSIT_LQ )then
   Begin
      btAUTORIZA.Enabled := False;
      btCANCELA.Enabled := False;
      Rechazar1.Enabled := False;
      Reactivar1.Enabled := False;
      //RABA MARZO 2015
      edTIPO_CARTERA.Visible := False;
   end
   else if Objeto.SIT_CREDITO.AsString = CSIT_RE then
   Begin
      btAUTORIZA.Enabled := False;
      btCANCELA.Enabled := True;
      Rechazar1.Enabled := False;
      Reactivar1.Enabled := True;
      //RABA MARZO 2015
      edTIPO_CARTERA.Visible := True;
   end;

  { if ( Objeto.SIT_CREDITO.AsString = CSIT_NP ) or
      ( Objeto.SIT_CREDITO.AsString = CSIT_NA ) or
      ( Objeto.SIT_CREDITO.AsString = CSIT_RE ) then
      InterForma1.ShowBtnEliminar := True
   else
      InterForma1.ShowBtnEliminar := False; }
end;

function TWCrCredito.AltaMotivo: Boolean;
var   DesMotivo : TCrDesMot;
      vlResult  : Boolean;
begin
   vgMotivo := '';
   vlResult := False;
   DesMotivo := TCrDesMot.Create(Self);
   Try
      DesMotivo.lbDescMotivo.Caption := 'Descipción del Motivo de Rechazo';
      if DesMotivo.ShowModal = mrOk then
      Begin
         if DesMotivo.meTX_MOTIVO.Text <> '' then
         Begin
            vgMotivo := DesMotivo.meTX_MOTIVO.Text;
            vlResult := True;
         end;
      end;
   finally
      DesMotivo.Free;
   end;
   AltaMotivo := vlResult;
end;

function TWCrCredito.ValorTasa(pTasa: String): String;
var   vlsql : String;
    vlValor : String;
    StpValorTasa: TStoredProc;
begin
  if pTasa <> '' then Begin
    vlValor:='0';
    StpValorTasa := TStoredProc.Create(Nil);
    If Assigned(StpValorTasa) Then
    With StpValorTasa Do
        Try
         StoredProcName := 'PKGCRCREDITOO1.STPCALCTASAREFER';
         DatabaseName := Objeto.Apli.DataBaseName;
         SessionName := Objeto.Apli.SessionName;
         Params.Clear;
         Params.CreateParam(ftString,'peCVE_TASA_INDICAD', ptInput);
         Params.CreateParam(ftDate,'peF_CALCULO', ptInput);
         Params.CreateParam(ftFloat,'psVAL_TASA', ptOutput);
         Params.CreateParam(ftFloat,'PSRESULTADO', ptOutput);
         Params.CreateParam(ftString,'PSTX_RESULTADO', ptOutput);

         ParamByName('peCVE_TASA_INDICAD').AsString := pTasa;
         ParamByName('peF_CALCULO').AsDateTime := Objeto.F_INICIO.AsDateTime;
         ExecProc;

         If (ParamByName('PSRESULTADO').AsFloat = 0) Then
           vlValor:= ParamByName('psVAL_TASA').AsString
         else showMessage('STPCALCTASAREFER: '+ParamByName('PSTX_RESULTADO').AsString);

        Finally
         Free;
        End;
      ValorTasa := vlValor;
    end;
end;

function  TWCrCredito.ValUnidadTiemp(pCveUniTiemp : String; pPlazo: Integer; Var pMensaje : String): Boolean;
Var vlResultado     : Boolean;
    stpValUnidTiemp : TStoredProc;
begin
    vlResultado := True;
    pMensaje := '';
    stpValUnidTiemp := TStoredProc.Create(Nil);
    try
       with stpValUnidTiemp do
       begin
          stpValUnidTiemp.DatabaseName:= Objeto.Apli.DatabaseName;
          stpValUnidTiemp.SessionName:= Objeto.Apli.SessionName;
          stpValUnidTiemp.StoredProcName:='PKGCRPERIODO.SPTVALIDAUNITIEMPO';

          Params.Clear;
          Params.CreateParam(ftInteger,'PECVEUNIDTIEMPO',ptInput);
          Params.CreateParam(ftString,'PEPLAZO',ptInput);
          Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSMENSAJE',ptOutput);

          Prepare;
          ParamByName('peCveUnidTiempo').AsString := pCveUniTiemp;
          ParamByName('pePlazo').AsInteger := pPlazo;
          ExecProc;

          if ParamByName('psResultado').AsInteger <> 0 then
          begin
             pMensaje := ParamByName('psMensaje').AsString;
             vlResultado := False;
          end;
          UnPrepare;
       end;
    finally
       stpValUnidTiemp.Free;
    end;
    ValUnidadTiemp := vlResultado;
end;

function TWCrCredito.ValNumUnidades(pNumUnidades, peNumdiasMax, pPlazo: Integer;
  var pMensaje: String): Boolean;
var vlResult : Boolean;
    vlTotal  : Double;
begin
   vlResult := True;
   vlTotal := ( pPlazo / peNumdiasMax ) / pNumUnidades;
   pMensaje := '';
   if vlTotal < 1 then
   Begin
    vlResult := False;
    pMensaje := 'Número de Unidades de acuerdo al plazo no corresponde';
   end;
   ValNumUnidades:= vlResult;
end;

procedure TWCrCredito.ValidaUsuario;
Var   qyQuery   : TQuery;
      vlSQL     : String;
      vlAutDisp : Boolean;
      vlCanDisp : Boolean;
      vlRecDisp : Boolean;
      vlReaDisp : Boolean;
      vlAltProc : Boolean;
begin
   vlAutDisp  := False;
   vlCanDisp  := False;
   vlRecDisp  := False;
   vlReaDisp  := False;
   vlAltProc  := False;
   Objeto.vgComision  := False;
   Objeto.vgCanSieban := False;
   Objeto.vgModTasa   := False;
   vgImpMaxAut:= 0;
   vlSQL := ' SELECT B_AUTORIZA_DISP, ' + coCRLF +
            '        B_CANCELA_DISP,  ' + coCRLF +
            '        B_RECHAZA_DISP,  ' + coCRLF +
            '        B_REACTIVA_DISP, ' + coCRLF +
            '        IMP_MAXIMO_AUT,  ' + coCRLF +
            '        B_ALTA_PROCAM,   ' + coCRLF +
            '        B_CANCELA_SIEB,  ' + coCRLF +
            '        B_MODIF_DISP_AUT,' + coCRLF +
            '        B_MOD_INF_TASA,  ' + coCRLF +
            '        B_MOD_COMISION   ' + coCRLF +
            ' FROM  CR_PERF_PROD_USU  ' + coCRLF +
            ' WHERE CVE_PRODUCTO   =  ' + SQLStr( Objeto.ContratoCre.CVE_PRODUCTO_CRE.AsString )+ coCRLF +
            ' AND   CVE_GPO_ACCESO =  ' + IntToStr( Objeto.Apli.CvePerfil ) + coCRLF ;

   qyQuery := GetSQLQuery(vlSQL,Objeto.DataBaseName,Objeto.SessionName,True);
   If (qyQuery <> nil) Then Begin
      if qyQuery.FieldbyName('B_AUTORIZA_DISP').AsString = CVERDAD then
         vlAutDisp := True;

      if qyQuery.FieldbyName('B_CANCELA_DISP').AsString = CVERDAD then
         vlCanDisp := True;

      if qyQuery.FieldbyName('B_RECHAZA_DISP').AsString = CVERDAD then
         vlRecDisp := True;

      if qyQuery.FieldbyName('B_REACTIVA_DISP').AsString = CVERDAD then
         vlReaDisp := True;

      if qyQuery.FieldbyName('B_ALTA_PROCAM').AsString = CVERDAD then
         vlAltProc := True;

      if qyQuery.FieldbyName('B_CANCELA_SIEB').AsString = CVERDAD then
         Objeto.vgCanSieban := True;

      if qyQuery.FieldbyName('B_MOD_INF_TASA').AsString = CVERDAD then
         Objeto.vgModTasa := True;

      if qyQuery.FieldbyName('B_MODIF_DISP_AUT').AsString = CFALSO then
      Begin
         if ( Objeto.SIT_CREDITO.AsString = CSIT_AC ) OR
            ( Objeto.SIT_CREDITO.AsString = CSIT_AU ) OR
            ( Objeto.SIT_CREDITO.AsString = CSIT_CA ) OR
            ( Objeto.SIT_CREDITO.AsString = CSIT_LQ ) then
             InterForma1.ShowBtnModificar := False
         ELSE
             InterForma1.ShowBtnModificar := True;
      end
      ELSE
      Begin
         if ( Objeto.SIT_CREDITO.AsString = CSIT_CA ) OR
            ( Objeto.SIT_CREDITO.AsString = CSIT_LQ ) then
             InterForma1.ShowBtnModificar := False
         ELSE
             InterForma1.ShowBtnModificar := True;
      end;

      if qyQuery.FieldbyName('B_MOD_COMISION').AsString = CVERDAD then
         Objeto.vgComision := True;

      vgImpMaxAut := qyQuery.FieldbyName('IMP_MAXIMO_AUT').AsFloat;
   End;
   btAUTORIZA.Enabled:= vlAutDisp;
   btCANCELA.Enabled := vlCanDisp;
   Rechazar1.Enabled := vlRecDisp;
   Reactivar1.Enabled:= vlReaDisp;
   Procampo1.Enabled:= vlAltProc;
end;

procedure TWCrCredito.FormShow(Sender: TObject);
begin
      icpCONTRATO.Frame := Objeto.ContratoCre.Contrato;
      icpCONTRATO.RefrescaInfo; //REFRESCA LA INFORMACIÓN DEL CREDITO
      TipoPagoAUsar;
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.ID_CONTRATO.Control:= iedID_CONTRATO;
      Objeto.B_APLICA_COM.Control:=chB_APLICA_COM;
      Objeto.B_APLICA_IVA.Control:=chB_APLICA_IVA;
//      Objeto.B_GENERA_EDOCTA.Control:=chB_GENERA_EDOCTA;
//      Objeto.B_REFERENCIADO.Control:=chB_REFERENCIADO;
      Objeto.CVE_CALCULO.Control:=edCVE_CALCULO;
      Objeto.CVE_AMORTIZACION.Control:=edCVE_AMORTIZACION;
      Objeto.CVE_PAG_INTERES.Control:=edCVE_PAG_INTERES;
      Objeto.CVE_LIQUIDACION.Control:=edCVE_LIQUIDACION;
      Objeto.CVE_TASA_REFER.Control:=edCVE_TASA_REFER;

      Objeto.OPERADOR_STASA.Control:=cbOPERADOR_STASA;
      Objeto.SOBRETASA.Control:=edSOBRETASA;
      Objeto.TASA_CREDITO.Control:=edTASA_CREDITO;
      Objeto.DIAS_PLAZO.Control:=edDIAS_PLAZO;
      Objeto.FACT_MORAS.Control:=edFACT_MORAS;
      Objeto.F_TRASPASO_VENC.Control:=edF_TRASPASO_VENC;
      Objeto.ID_CRE_RENOVADO.Control:=edID_CRE_RENOVADO;
      Objeto.ID_CRE_RENUEVA.Control:=edID_CRE_RENUEVA;
      // </ RABA > 09 JUN 2011 REESTRUCTURA
      Objeto.TIPO_RENUEVA.Control:=edTIPO_RENUEVA;
      // < RABA />
      Objeto.TIPO_DISPOSICION.Control:=lbTIPO_CREDITO;
      Objeto.ID_PROM_ADM.Control:=edID_PROM_ADM;
      Objeto.IMP_CREDITO.Control:=edIMP_CREDITO;
      Objeto.IMP_DISPUESTO.Control:=edIMP_DISPUESTO;
      Objeto.CVE_CALIF_CRE.Control:=edCVE_CALIF_CRE;
//      Objeto.B_ENVIA_BNC.Control:=chB_ENVIA_BNC;
      Objeto.SIT_CREDITO.Control:= lbSIT_CREDITO;
      Objeto.CVE_USU_ALTA.Control := edCVE_USUA_ALTA;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.F_AUTORIZA.Control := edF_AUTOR;
      Objeto.CVE_USU_AUTORIZA.Control := edCVE_USUA_AUTOR;
      Objeto.F_MODIFICA.Control := edF_MODIF;
      Objeto.CVE_USU_MODIFICA.Control := edCVE_USUA_MODIF;
//      Objeto.TASA_BASE.Control := edTASA_BASE;
      Objeto.ID_CRED_EXTERNO.Control := edID_CRED_EXTERNO;
      Objeto.F_INICIO.Control := edF_INICIO;
      Objeto.F_VENCIMIENTO.Control := edF_VENCIMIENTO;
      Objeto.IMP_MINISTRADO.Control := edIMP_MINISTRADO;
      Objeto.UTiempoCap.DESCRIPCION.Control := cbUNIDAD_TIEMPO_CP;
      Objeto.NUM_UNIDADES_CP.Control := edNUM_UNIDADES_CP;
      Objeto.DIA_PAGO_CAP.Control := cbDIA_PAGO_CAP;
      Objeto.UTiempoInt.DESCRIPCION.Control := cbUNIDAD_TIEMPO_IN;
      Objeto.NUM_UNIDADES_IN.Control := edNUM_UNIDADES_IN;
      Objeto.DIA_PAGO_INT.Control := cbDIA_PAGO_INT;
      Objeto.UTiempoTasa.DESCRIPCION.Control := cbUNIDAD_TIEMPO_RE;
      Objeto.NUM_UNIDADES_RE.Control := edNUM_UNIDADES_RE;
      Objeto.DIA_REVISION.Control := cbDIA_REVISION;
      Objeto.F_PROX_REVISION.Control := edF_PROX_REVISION;
      Objeto.F_INI_PAG_CAP.Control := edF_INI_PAG_CAP;
      Objeto.F_INI_PAG_INT.Control := edF_INI_PAG_INT;
      Objeto.B_FINANC_ADIC.Control := chB_FINANC_ADIC;
      Objeto.F_FIN_PERGRA_FA.Control := edF_FIN_PERGRA_FA; //--- ASOR --- ABRIL 2016 --- CAMPO NUEVO --
      Objeto.TX_COMENTARIOS.Control := meTX_COMENTARIO;
      Objeto.PCT_COMISION.Control := edPCT_COMISION;
      Objeto.ID_CONTROL_EXT.Control := edID_CONTROL_EXT;
      Objeto.IMP_COMISION.Control := edIMP_COMISION;
      Objeto.CVE_TIPO_TASA.Control := cbTIPO_TASA;
      Objeto.NUM_FOL_FIDEICOM.Control := edNUM_FOL_FIDEICOM;
      Objeto.CVE_GPO_CAPITALIZ.Control := edCVE_GPO_CAPITALIZ;

      Objeto.ContratoCre.DISPONIBLE_ACRED.Control := iedDISPONIBLE_ACRED;
      Objeto.ContratoCre.DISPONIBLE_GRUPO_ECO.Control := iedIMP_DISP_GPO;
      Objeto.ContratoCre.DISPONIBLE_AUT.Control := iedDISPONIBLE_AUT;

      Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO;
      Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control :=edDESC_PRODUCTO;

      Objeto.CalcInt.DESC_CALCULO.Control :=edDESC_CALC_INT;
      Objeto.TipoAmort.DESC_AMORTIZA.Control :=edDESC_TIPO_AMORT;
      Objeto.PagoInt.DESC_PAG_INTERES.Control :=edDESC_PAGO_INT;
      Objeto.TipLiq.DESC_LIQUIDACION.Control :=edDESC_TIPO_LIQ;
      Objeto.PromotorAdm.Nombre.Control :=edNOMBRE_PROM_ADM;

      Objeto.TasaRefer.DESC_TASA_INDIC.Control := edDESC_TASA_REFER;
      Objeto.TasaRefer.GetParams(Objeto);

      Objeto.MFiraOpe.MFiraOpe.DESC_OPERATIVA.Control := edNOM_CVE_OPERATIVA;
      Objeto.MFiraOpe.GetParams(Objeto);

      //ROIM748 JULIO 2009
      Objeto.CVE_TIPO_BAJA.Control := edCVE_TIPO_BAJA;
      Objeto.F_RESTRINGIDO.Control := edF_RESTRINGIDO;
      //ROIM748 JULIO 2009
      //</SST> Intercampo Num. Sol Web
      Objeto.ID_SOLICITUD.Control:= edNoSolDisp;
      //<SST/>

      Objeto.CVE_CALIDAD_GTIA.Control := cbCVE_CALIDAD_GTIA;
      Objeto.B_INT_DIASIG.Control:=chB_INT_DIASIG;  //HERJA SEPTIEMBRE 2013

      dtpF_INICIO.Date:=Objeto.Apli.DameFechaEmpresa;
      dtpF_VENCIMIENTO.Date:=Objeto.Apli.DameFechaEmpresa;
      dtpF_PROX_REVISION.Date:=Objeto.Apli.DameFechaEmpresa;
      dtpF_INI_PAG_CAP.Date:=Objeto.Apli.DameFechaEmpresa;
      dtpF_INI_PAG_INT.Date:=Objeto.Apli.DameFechaEmpresa;

      InterForma1.MsgPanel := MsgPanel;
      vgCambio := False;

      InterForma1.BtnEliminar.Visible:=false; //HERJA AGOSTO 2012
      MuestraValidaRSRE;
end;

procedure TWCrCredito.FormDestroy(Sender: TObject);
begin
  Objeto.ID_CREDITO.Control:=nil;
  Objeto.ID_CONTRATO.Control:=nil;
  Objeto.B_APLICA_COM.Control:=nil;
  Objeto.B_APLICA_IVA.Control:=nil;
  //      Objeto.B_GENERA_EDOCTA.Control:=nil;
  //      Objeto.B_REFERENCIADO.Control:=nil;
  Objeto.CVE_CALCULO.Control:=nil;
  Objeto.CVE_AMORTIZACION.Control:=nil;
  Objeto.CVE_PAG_INTERES.Control:=nil;
  Objeto.CVE_LIQUIDACION.Control:=nil;
  Objeto.CVE_TASA_REFER.Control:=nil;
  Objeto.OPERADOR_STASA.Control:=nil;
  Objeto.SOBRETASA.Control:=nil;
  Objeto.TASA_CREDITO.Control:=nil;
  Objeto.DIAS_PLAZO.Control:=nil;
  Objeto.FACT_MORAS.Control:=nil;
  Objeto.F_TRASPASO_VENC.Control:=nil;
  Objeto.ID_CRE_RENOVADO.Control:=nil;
  Objeto.ID_CRE_RENUEVA.Control:=nil;
  // </ RABA > 09 JUN 2011 REESTRUCTURA
  Objeto.TIPO_RENUEVA.Control:=nil;
  // < RABA />
  Objeto.TIPO_DISPOSICION.Control:=nil;
  Objeto.ID_PROM_ADM.Control:=nil;
  Objeto.IMP_CREDITO.Control:=nil;
  Objeto.IMP_DISPUESTO.Control:=nil;
  Objeto.CVE_CALIF_CRE.Control:=nil;
  //      Objeto.B_ENVIA_BNC.Control:=nil;
  Objeto.SIT_CREDITO.Control:=nil;
  Objeto.CVE_USU_ALTA.Control := nil;
  Objeto.F_ALTA.Control:=nil;
  Objeto.F_AUTORIZA.Control := nil;
  Objeto.CVE_USU_AUTORIZA.Control := nil;
  Objeto.F_MODIFICA.Control := nil;
  Objeto.CVE_USU_MODIFICA.Control := nil;
  //      Objeto.TASA_BASE.Control := nil;
  Objeto.ID_CRED_EXTERNO.Control := nil;
  Objeto.F_INICIO.Control := nil;
  Objeto.F_VENCIMIENTO.Control := nil;
  Objeto.IMP_MINISTRADO.Control := nil;
  Objeto.UTiempoCap.DESCRIPCION.Control := nil;
  Objeto.UTiempoInt.DESCRIPCION.Control := nil;
  Objeto.UTiempoTasa.DESCRIPCION.Control := nil;
  Objeto.NUM_UNIDADES_CP.Control := nil;
  Objeto.DIA_PAGO_CAP.Control := nil;
  Objeto.NUM_UNIDADES_IN.Control := nil;
  Objeto.DIA_PAGO_INT.Control := nil;
  Objeto.NUM_UNIDADES_RE.Control := nil;
  Objeto.DIA_REVISION.Control := nil;
  Objeto.F_PROX_REVISION.Control := nil;
  Objeto.F_INI_PAG_CAP.Control := nil;
  Objeto.F_INI_PAG_INT.Control := nil;
  Objeto.B_FINANC_ADIC.Control := nil;
  Objeto.F_FIN_PERGRA_FA.Control := nil; //--- ASOR --- ABRIL 2016 ---
  Objeto.TX_COMENTARIOS.Control := nil;
  Objeto.PCT_COMISION.Control := nil;
  Objeto.ID_CONTROL_EXT.Control := nil;
  Objeto.CVE_TIPO_TASA.Control := nil;
  Objeto.NUM_FOL_FIDEICOM.Control := nil;
  Objeto.CVE_GPO_CAPITALIZ.Control := nil;
  Objeto.ContratoCre.DISPONIBLE_ACRED.Control := nil;
  Objeto.ContratoCre.DISPONIBLE_GRUPO_ECO.Control := nil;
  Objeto.ContratoCre.DISPONIBLE_AUT.Control := nil;
  Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control :=nil;
  Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control :=nil;
  Objeto.CalcInt.DESC_CALCULO.Control :=nil;
  Objeto.TipoAmort.DESC_AMORTIZA.Control :=nil;
  Objeto.PagoInt.DESC_PAG_INTERES.Control :=nil;
  Objeto.TipLiq.DESC_LIQUIDACION.Control :=nil;
  Objeto.PromotorAdm.Nombre.Control :=nil;
  Objeto.TasaRefer.DESC_TASA_INDIC.Control := nil;
  Objeto.IMP_COMISION.Control := nil;
  Objeto.MFiraOpe.MFiraOpe.DESC_OPERATIVA.Control := nil;
  //ROIM748 JULIO 2009
  Objeto.CVE_TIPO_BAJA.Control := nil;
  Objeto.F_RESTRINGIDO.Control := nil;
  //ROIM748 JULIO 2009
  Objeto.ID_SOLICITUD.Control:= nil; //SST090511

  Objeto.CVE_CALIDAD_GTIA.Control := nil;
  Objeto.B_INT_DIASIG.Control:=nil;   //HERJA SEPTIEMBRE 2013
end;

procedure TWCrCredito.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCredito.InterForma1DespuesNuevo(Sender: TObject);
var
  Acreditado: TCrAcredit;
begin
  //SE INICIALIZAN INTERCAMPOS
  lb_Credescto.Visible:= False;
  MuestraHints;
  Objeto.B_COB_AUT.AsString:= 'F';
  Objeto.SIT_CREDITO.AsString:= 'NP';
  Objeto.TIPO_DISPOSICION.AsString:= Objeto.VGTIPO_DISPOSICION;
  Objeto.IMP_CREDITO.AsFloat:= Objeto.VGID_IMPORTE_RR;
  // </ ASTECI:AARJ >
  // 11 FEB 2010 Para evitar ambigüedad entre la DI "normal" y la DI por LC
  // Si Objeto.VG_OpEv_LC está en False, se considera que DI es por op. normal
  // Código original antes de la modificación:
  // if Objeto.VGTIPO_DISPOSICION = 'DI' then
  if ((Objeto.VGTIPO_DISPOSICION = 'DI') and (not Objeto.VG_OpEv_LC {False}) ) then
    //<ASTECI:AARJ/>
    Objeto.F_INICIO.AsDateTime:= Objeto.Apli.DameFechaEmpresa
  else
    Objeto.F_INICIO.AsDateTime:= Objeto.VGF_INICIO;
   // end if
  Objeto.TASA_CREDITO.AsInteger:=0;
  Objeto.FACT_MORAS.AsInteger:= 2;
  Objeto.FACT_PROPOR_GAR.AsInteger:= 0;
  Objeto.DIAS_PLAZO.AsInteger:= 0;
  Objeto.IMP_DISPUESTO.AsInteger:= 0;
  Objeto.F_ALTA.AsDateTime:= Now;
  Objeto.CVE_USU_ALTA.AsString:= Objeto.Apli.Usuario;
  Objeto.TASA_BASE.AsFloat:= 0;
  Objeto.F_VENCIMIENTO.AsDateTime:= Objeto.Apli.DameFechaEmpresa;
  Objeto.IMP_MINISTRADO.AsFloat:= 0;
  Objeto.NUM_UNIDADES_CP.AsInteger:= 1;
  Objeto.NUM_UNIDADES_IN.AsInteger:= 1;
  Objeto.NUM_UNIDADES_RE.AsInteger:= 1;
  Objeto.PCT_COMISION.AsFloat:= 0;
  edNUM_UNIDADES_CP.Enabled:= True;
  cbDIA_PAGO_CAP.Enabled:= True;
  edNUM_UNIDADES_IN.Enabled:= True;
  cbDIA_PAGO_INT.Enabled:= True;
  //HERJA - FILTRADO DE OPERATIVAS ACTIVAS
  Objeto.MFiraOpe.BuscaWhereString:= ' SIT_OPERATIVA=''AC''';
  edF_INI_PAG_CAP.Enabled:= True; //019
  edF_INI_PAG_CAP.Color:= clWindow; //019
  edIMP_DISPONIBLE.Text:= '0';
  edVALOR_TASA.Text:= '0';
   //<LOLS 03MAR2006 CLAVE DE CALCULO DE IVA DE INTERES>
  Objeto.CVE_CALC_IVA_INT.AsString:= '';
   //</LOLS>
  Procampo1.Enabled:= False;
  DatosAdicionalesaTasas1.Enabled:= False;
   //ROIM748 JULIO 2009
  edCVE_TIPO_BAJA.Enabled:= False;
  btCVE_TIPO_BAJA.Enabled:= False;
   //ROIM748 JULIO 2009
  if ((Objeto.VGTIPO_DISPOSICION = 'RE') or (Objeto.VGTIPO_DISPOSICION = 'RS')or (Objeto.VGTIPO_DISPOSICION = 'CM')
   //</ASTECI:AARJ>
   // 9 FEB 2010 Se agregó la siguiente evaluación para la ejecución de AsignaDatosRR
   // Para contemplar la operación LC al ejecutar el evento "Nuevo"
     or ((Objeto.VGTIPO_DISPOSICION = 'DI') AND (Objeto.VG_OpEv_LC{=True}))
   // < ASTECI:AARJ />
       ) then
  begin
    AsignaDatosRR(IntToStr(Objeto.VGID_CREDITO_RR));
//    if (Objeto.VGTIPO_DISPOSICION = 'RE') then   // RABA 15 JUN 2011 SE AGREGA LA CONDICIÓN PARA REESTRUCTURA
    if (Objeto.VGTIPO_DISPOSICION = 'RE') or (Objeto.VGTIPO_DISPOSICION = 'RS') then
      edDIAS_PLAZO.SetFocus
    else
      iedID_CONTRATO.SetFocus;
        //end if;
  end
  else
    iedID_CONTRATO.SetFocus;
   //end if;
  //</SST>
  //03 MAYO 2011
  //Se llenan los campos con los datos del monitor Web

  if Objeto.ContratoCre.FindKey([ilIDCONTRATO.Buffer,'1']) then
   begin
      icpCONTRATO.RefrescaInfo;
      TipoPagoAUsar;
//      InsertaCalificacion;
      InterForma1.NextTab(iedID_CONTRATO);
   end;

  if Objeto.vgIdContratoWeb <> 0 then
  begin
    Objeto.Modo:= moAppend;
    Objeto.ID_CONTRATO.AsInteger:= Objeto.vgIdContratoWeb;
    Objeto.ContratoCre.FindKey([IntToStr(Objeto.vgIdContratoWeb),'1']);
    iedID_CONTRATO.Text:= IntToStr(Objeto.vgIdContratoWeb);
    icpCONTRATO.RefrescaInfo;
    TipoPagoAUsar;
    iedID_CONTRATOExit(Sender);
    edF_INICIO.Text:= DateToStr(Objeto.vgFInicioWeb);
    edF_INICIOExit(Sender);
    edDIAS_PLAZO.Text:= IntToStr(Objeto.vgPlazoWeb);
    edDIAS_PLAZOExit(Sender);
    edF_VENCIMIENTO.Text:= DateToStr(Objeto.vgFTerminoWeb);
    edF_VENCIMIENTOExit(Sender);
    edIMP_CREDITO.Text:= FloatToStr(Objeto.vgImporteWeb);
    edIMP_CREDITOExit(Sender);
    edNoSolDisp.Text:= IntToStr(Objeto.vgIdSolWeb);
    if Objeto.vgComDispWeb <> 0 then
    begin
      chB_APLICA_COM.Checked:= True;
      AplicaComision;
      edPCT_COMISION.Text:= FloatToStr(Objeto.vgComDispWeb);
    end;
    iedID_CONTRATO.SetFocus;
  end;
  //<SST/>
end;

procedure TWCrCredito.InterForma1DespuesModificar(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
     lb_Credescto.Visible:=false;
     icpCONTRATO.RefrescaInfo;

     if ( Objeto.SIT_CREDITO.AsString = CSIT_NP ) or
        ( Objeto.SIT_CREDITO.AsString = CSIT_NA ) or
        ( Objeto.SIT_CREDITO.AsString = CSIT_RE ) then
     Begin
//        validaTasaFija(Objeto.CVE_TASA_REFER.AsString,edTASA_BASE);
        VerificaTasaRefer;
        VerPagoCap;
        VerPagoInt;
        TipoPagoAUsar; // <EASA 15 DIC 2005 Corrección solo cuando el credito no este autorizado>
        if Objeto.ContratoCre.Producto.B_APLICA_IVA.AsString = CFALSO then
        Begin
           chB_APLICA_IVA.Enabled :=False;
           //chB_APLICA_IVA.Checked := False;  Este campo no se debe de mover al momento de modificar
        end
        else
        Begin
           chB_APLICA_IVA.Enabled :=True;
           //chB_APLICA_IVA.Checked := True;  Este campo no se debe de mover al momento de modificar
        end;
        edCVE_LIQUIDACION.SetFocus;
     end
     ELSE edID_CONTROL_EXT.SetFocus;

     Objeto.MFiraOpe.MFiraOpe.FindKey([Objeto.CVE_OPERATIVA.AsString]);
     edIMP_DISPONIBLE.Text := '0';
     Objeto.IMP_COMISION.AsFloat := GenComisDisp(Objeto.IMP_CREDITO.AsFloat, Objeto.PCT_COMISION.AsFloat,
                                                 Objeto.ID_CONTRATO.AsInteger,
                                                 Objeto.ID_CREDITO.AsInteger,
                                                 Objeto.Apli, vlSalida,vlMsg);
     Objeto.F_MODIFICA.AsDateTime := Now;
     Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
     if ( Objeto.ContratoCre.Acreditado.B_APLI_REL_MON.AsString = CFALSO ) OR
        ( Objeto.ContratoCre.Acreditado.B_APLI_REL_MON.AsString = CNULL  )then Begin
          Objeto.TasaRefer.BuscaWhereString := ' TASA_INDIC_FINAN.CVE_TASA_INDICAD IN  ' +
                                               ' ( SELECT CVE_TASA_REFER FROM CR_REL_PROD_MON ' +
                                               ' WHERE     CR_REL_PROD_MON.CVE_MONEDA = ' + Objeto.ContratoCre.CVE_MONEDA.AsString+
                                               ' AND CR_REL_PROD_MON.CVE_PRODUCTO_CRE = ' + #39 + Objeto.ContratoCre.CVE_PRODUCTO_CRE.AsString + #39 + ')';
          Objeto.TasaRefer.FilterString := Objeto.TasaRefer.BuscaWhereString;
     end
     else Begin
           Objeto.TasaRefer.BuscaWhereString := '';
           Objeto.TasaRefer.FilterString := Objeto.TasaRefer.BuscaWhereString;
     end;
     Objeto.MFiraOpe.BuscaWhereString := 'CR_GA_FIRA_CTO.ID_CONTRATO = ' +Objeto.ID_CONTRATO.AsString;
     Objeto.MFiraOpe.FilterString := Objeto.MFiraOpe.BuscaWhereString;

     AsignaDatosRR(IntToStr(Objeto.VGID_CREDITO_RR));
end;

procedure TWCrCredito.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var
  vlsql : String;
begin
   Objeto.F_FIN_PERGRA_FA.AsString:= EdF_FIN_PERGRA_FA.Text; //--- ASOR --- ABRIL 2016 --- VARIABLE PARA VALIDAR INFORMACION --
   // ASOR - 08/03/2016 - Validación de tipo de interes PD y asignación de Cálculo de Interés Día Siguiente.
   If (Trim(edCVE_CALCULO.text) = 'PD') and (chB_INT_DIASIG.Checked = False) then
   begin
        if MessageDlg('Para este tipo de Calculo de Interés debe de seleccionar ' + #13 +
                      '     la opción de Calculo de Interés Dia Siguiente' + #13 +
                      '                       ¿Desea continuar?',
           mtConfirmation,[mbYes, mbNo], 0) = mrNo then
        Begin
           chB_INT_DIASIG.SetFocus;
           Realizado := False;
           Exit;
        end;
   end;
   // --- INICIO --- ASOR -- ABRIL 2016 -- VALIDACION PARA INGRESAR O NO UNA FECHA DE FIN DE PERIODO DE GRACIA DE F.A. ---
   if  (chB_FINANC_ADIC.Checked)  AND  (EdF_FIN_PERGRA_FA.Text = '') then
      if MessageDlg('Esta disposición tiene activado el financiamiento adicional,' +#13 +
                    '¿Desea capturar una fecha de fin de periodo de gracia?', mtConfirmation,[mbYes,mbNo], 0) = mrYes Then
        begin
           EdF_FIN_PERGRA_FA.SetFocus;
           Realizado := False;
           Exit;
      end;
   // --- FIN --- ASOR -- ABRIL 2016 ---
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea Almacenar los Datos Capturados?',
                      mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
         // --- INICIO --- ASOR --- MAYO 2016 --- VALIDACION PARA LA FECHA DE FIN DE PERIODO DE GARCIA DIA INHABIL ---
         if (EdF_FIN_PERGRA_FA.Text <> '') and (ValidaFecha(Objeto.F_FIN_PERGRA_FA.AsDateTime,Objeto.Apli) <> 0) then
             CambiaFechaFA;
         // --- FIN --- ASOR --- MAYO 2016 ---
        if Copy(edCve_Producto.Text,4,3) = 'AGR' then
        begin

          if (trim(edCVE_TASA_REFER.Text) = 'FIJA'    ) or
             (trim(edCVE_TASA_REFER.Text) = 'TFIRA-6' ) or
             (trim(edCVE_TASA_REFER.Text) = 'TFIRA175') or
             (trim(edCVE_TASA_REFER.Text) = 'TIIEFIRA') or
             (trim(edCVE_TASA_REFER.Text) = 'LIBOR1-2') or
             (trim(edCVE_TASA_REFER.Text) = 'LIBOR3FR') or
             (trim(edCVE_TASA_REFER.Text) = 'LIBOR6FR') then
          begin

            if (trim(edID_CONTROL_EXT.Text) = '') or (trim(edID_CRED_EXTERNO.Text) = '') then
            begin

              if (trim(edID_CONTROL_EXT.Text) = '') then
              begin
                ShowMessage('Es necesario ingresar el No.Control Externo.');
                Realizado := false;
              end;

              if (trim(edID_CRED_EXTERNO.Text) = '') then
              begin
                ShowMessage('Es necesario ingresar el Id.Crédito Externo.');
                Realizado := false;
              end;

              Realizado := false;
            end
            else
            begin
              Objeto.FOL_CONTRATO.AsString := Objeto.ContratoCre.FOL_CONTRATO.AsString;
              Realizado := true;
            end;

          end
          else
          begin
            Objeto.FOL_CONTRATO.AsString := Objeto.ContratoCre.FOL_CONTRATO.AsString;
            Realizado := true;
          end;
        end
        else
        begin
          Objeto.FOL_CONTRATO.AsString := Objeto.ContratoCre.FOL_CONTRATO.AsString;
          Realizado := True;
        end;
       //Objeto.FOL_CONTRATO.AsString := Objeto.ContratoCre.FOL_CONTRATO.AsString;
       //Realizado := True;
      end
      else
        Realizado := False;
   end
   //modificacion
   else if InterForma1.CanEdit then
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
         //HERJA ABRIL 2013
         // --- INICIO --- ASOR --- MAYO 2016 --- VALIDACION PARA LA FECHA DE FIN DE PERIODO DE GARCIA DIA INHABIL ---
         if (EdF_FIN_PERGRA_FA.Text <> '') and (ValidaFecha(Objeto.F_FIN_PERGRA_FA.AsDateTime,Objeto.Apli) <> 0) then
             CambiaFechaFA;
         // --- FIN --- ASOR --- MAYO 2016 ---

          if ( objeto.CVE_PAG_INTERES.AsString = '1') or ( objeto.CVE_PAG_INTERES.AsString = '2') then
          Begin
            Objeto.UNIDAD_TIEMPO_IN.AsString:='';
            Objeto.NUM_UNIDADES_IN.AsString:='1';
            Objeto.DIA_PAGO_INT.AsString:='';
            Objeto.F_INI_PAG_INT.AsString:='';
          end;
          if objeto.CVE_AMORTIZACION.AsString = '4' then
          Begin
              Objeto.UNIDAD_TIEMPO_CP.AsString:='';
              Objeto.NUM_UNIDADES_CP.AsString:='1';
              Objeto.DIA_PAGO_CAP.AsString:='';
              Objeto.F_INI_PAG_CAP.AsString:='';
          end;
         // FIN HERJA

         //realiza un respaldo del credito original
         if Objeto.VGFOL_GRUPO_RENUEVA   <> 0 THEN Begin
           if not(FindCredOrigen) THEN Begin
              if Objeto.StpRespaldaDisp(Objeto.ID_CREDITO.AsInteger,'I') then
                 Realizado := True
              else
                 Realizado := False;
           end;
         end
         else Realizado := True;
      end
      else Realizado := False;
   end;
   // ASOR -- 11/03/2016 -- Mensaje recordatorio tipo de interes PD
   if Trim(edCVE_CALCULO.text) = 'PD' then
   begin
     vlsql:= ' Select Count(*) from cr_inf_adic_tasa where id_credito = ' + Objeto.ID_CREDITO.AsString;
     GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlCount,False);
     if vlCount = 0 then
     begin
       ShowMessage('Para el cálculo de Interés PROMEDIO ARITMETICO DÍA NATURAL' + #13 +
                   'Debe de ingresar la Información Adicional de la Tasa');
     end;
   end;
end;

// --- INICIO --- ASOR --- MAYO 2016 --- VALIDACION DE LA FECHA FIN DE PERIODO DE GRACIA DE F.A. DIA INHABIL ---
Procedure TWCrCredito.CambiaFechaFA;
var
   vlsSql, vlBOk: String;
   vliTipo: Integer;
begin
   vlBOk:= 'N';
   vlsSql:= 'SELECT CVE_AJUSTE_F_VTO  FROM   CR_PRODUCTO  WHERE  CVE_PRODUCTO_CRE = '''+ trim(edCVE_PRODUCTO.Text) +'''';
   vlQry:= GetSQLQuery(vlsSql, Objeto.DataBaseName, Objeto.SessionName, False);
   if vlQry.FieldByName('CVE_AJUSTE_F_VTO').AsString = 'AH' then
      vliTipo := 1
   else if vlQry.FieldByName('CVE_AJUSTE_F_VTO').AsString = 'PH' then
           vliTipo := 2
        else
           vliTipo := 3;

   Case vliTipo Of
      1 : begin
            While vlBOk = 'N' do
              begin
                     Objeto.F_FIN_PERGRA_FA.AsDateTime := Objeto.F_FIN_PERGRA_FA.AsDateTime -1;
                     if ValidaFecha(Objeto.F_FIN_PERGRA_FA.AsDateTime,Objeto.Apli) = 0 then
                        vlBOk:= 'S';
            end;
          end;
      2 : begin
            While vlBOk = 'N' do
              begin
                     Objeto.F_FIN_PERGRA_FA.AsDateTime := Objeto.F_FIN_PERGRA_FA.AsDateTime + 1;
                     if ValidaFecha(Objeto.F_FIN_PERGRA_FA.AsDateTime,Objeto.Apli) = 0 then
                        vlBOk:= 'S';
            end;
          end;
   end;
   EdF_FIN_PERGRA_FA.Text:= Objeto.F_FIN_PERGRA_FA.AsString;
end;
// --- FIN --- ASOR --- MAYO 2016 ---

procedure TWCrCredito.btCONTRATOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCREDITO_CTTO',True,True) then
   begin
       //BUSCADOR DE LA CLASE CONTRATO CREDITO
       Objeto.ContratoCre.ShowAll := True;
       if Objeto.ContratoCre.Busca then
       begin
          icpCONTRATO.RefrescaInfo;//Refresca la informacion del Contrato
          TipoPagoAUsar;
          InterForma1.NextTab(btCONTRATO);
       end;
   end;
end;

procedure TWCrCredito.iedID_CONTRATOExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo=moAppend)) then
   Begin
       VLMsg := '';
       VLSalida := True;
       //Verifica que capture un contrato, campo no nulo
       Objeto.ID_CONTRATO.GetFromControl;
       Objeto.CVE_TASA_REFER.GetFromControl;
       If Objeto.ID_CONTRATO.AsString = '' then
       Begin
           VLSalida := False;
           VLMsg:='Favor de Indicar la Autorización';
       end           //verifica que el contrato sea Activo
       else if (Objeto.ContratoCre.Contrato.Sit_Contrato.AsString <> 'AC') then
       Begin
          VLSalida := False;
          VLMsg:='Contrato no Activo';
       end
       else if not(objeto.ContratoCre.VerfVencimiento(Objeto.ID_CONTRATO.AsString, Objeto.ContratoCre.FOL_CONTRATO.AsString) )then
       Begin
          VLSalida := False;
          VLMsg:='El plazo de la Autorización venció el día: ' + Objeto.ContratoCre.F_VENCIMIENTO.AsString
       end
       else if not(ValTramites(Objeto.ID_CONTRATO.AsString,'ALTAUT', Objeto.Apli, VLMsg)) then
       Begin
          VLSalida := False;
       end
       else Begin
         // </ ASTECI:AARJ >
         // 11 FEB 2010 Para evitar ambigüedad entre la DI normal y la DI por LC
         // Código original antes de la modificación:
         // if Objeto.VGTIPO_DISPOSICION = 'DI' then
//         if ((Objeto.VGTIPO_DISPOSICION = 'DI') and (not Objeto.VG_OpEv_LC {= False})) then
         // < ASTECI:AARJ />
//         begin
             if Objeto.ContratoCre.Producto.B_CALI_ACRE_DISP.AsString = CVerdad then
             Begin
                edCVE_CALIF_CRE.Text := Objeto.ContratoCre.Acreditado.CVE_CALIFACION.AsString;
                edCVE_CALIF_CRE.Enabled:= False;
                edCVE_CALIF_CRE.Color := clBtnFace;
             end
             else
             Begin
                edCVE_CALIF_CRE.Text := '';
                edCVE_CALIF_CRE.Enabled:= True;
                edCVE_CALIF_CRE.Color := clWindow;
             end;
             if Objeto.ContratoCre.Producto.B_APLICA_IVA.AsString = CFALSO then
             Begin
                chB_APLICA_IVA.Enabled :=False;
                chB_APLICA_IVA.Checked := False;
             end
             else
             Begin
                chB_APLICA_IVA.Enabled :=True;
                chB_APLICA_IVA.Checked := True;
             end;
//         end;

         //raba
         if InterForma1.IsNewData then
           Begin
              Objeto.ID_PROM_ADM.AsString := Objeto.ContratoCre.Contrato.Id_Pers_Asociad.AsString;
              Objeto.PromotorAdm.FindKey([Objeto.ContratoCre.Contrato.Id_Pers_Asociad.AsString]);
              Objeto.SOBRETASA.AsFloat := Objeto.ContratoCre.SOBRETASA.AsFloat;
              Objeto.OPERADOR_STASA.AsString := Objeto.ContratoCre.OPERADOR_STASA.AsString;
              Objeto.CVE_TASA_REFER.AsString := Objeto.ContratoCre.CVE_TASA_REFER.AsString;
              Objeto.TasaRefer.FindKey([ Objeto.CVE_TASA_REFER.AsString ]);
           end;
       //raba 

         if Objeto.ContratoCre.CVE_TASA_REFER.AsString = '' then
            VerificaTasaRefer;
         //end if;

         if Objeto.CVE_TASA_REFER.AsString <> C_TASA_FIJA then
         Begin
              cbTIPO_TASA.Text := 'VARIABLE';
              cbTIPO_TASA.Enabled := True;
              edVALOR_TASA.Text := ValorTasa(Objeto.CVE_TASA_REFER.AsString);
              cbTIPO_TASA.SetFocus;
         end
         else if Objeto.CVE_TASA_REFER.AsString = C_TASA_FIJA then
         Begin
               if ( Objeto.CVE_CALCULO.AsString = 'RE' ) THEN
               Begin
                  ShowMessage('La clave de calculo de interes no puede ser Revisable');
                  edCVE_CALCULO.SetFocus;
               end;
               edVALOR_TASA.Text := Objeto.ContratoCre.TASA_BASE.AsString;
               cbTIPO_TASA.Enabled := False;
               cbTIPO_TASA.Text := 'FIJA';
               bbUNIDAD_TIEMPO_RE.Enabled := False;
               edNUM_UNIDADES_RE.Enabled := False;
               cbDIA_REVISION.Enabled := False;
               edF_PROX_REVISION.Enabled := False; //019
               dtpF_PROX_REVISION.Enabled := False;
               edNUM_UNIDADES_RE.Color := clBtnFace;
               cbDIA_REVISION.Color := clBtnFace;
               edF_PROX_REVISION.Color := clBtnFace; //019
               Objeto.F_PROX_REVISION.AsDateTime := Objeto.F_INICIO.AsDateTime;
         end;
         ValorTasaCred;
         VerificaTasaRefer;

         // RABA OCT 2014 ACTUALIZACIÓN B6
         if ((Objeto.VGTIPO_DISPOSICION= 'DI') and (not Objeto.VG_OpEv_LC{=False})) then
             EvaluaNuevaDisp;
         // FIN RABA
       end;

       if ( Objeto.ContratoCre.Acreditado.B_APLI_REL_MON.AsString = CFALSO ) OR
          ( Objeto.ContratoCre.Acreditado.B_APLI_REL_MON.AsString = CNULL  )then
       Begin
           Objeto.TasaRefer.BuscaWhereString := ' TASA_INDIC_FINAN.CVE_TASA_INDICAD IN  ' +
                                                ' ( SELECT CVE_TASA_REFER FROM CR_REL_PROD_MON ' +
                                                ' WHERE     CR_REL_PROD_MON.CVE_MONEDA = ' + Objeto.ContratoCre.CVE_MONEDA.AsString+
                                                ' AND CR_REL_PROD_MON.CVE_PRODUCTO_CRE = ' + #39 + Objeto.ContratoCre.CVE_PRODUCTO_CRE.AsString + #39 + ')';
           Objeto.TasaRefer.FilterString := Objeto.TasaRefer.BuscaWhereString;
       end
       else Begin
           Objeto.TasaRefer.BuscaWhereString := '';
           Objeto.TasaRefer.FilterString := Objeto.TasaRefer.BuscaWhereString;
       end;

       ValidaUsuario;
       //Filtra operativas de acuerdo a la Autorización EASA 10092004
       Objeto.MFiraOpe.BuscaWhereString := 'CR_GA_FIRA_CTO.ID_CONTRATO = ' +Objeto.ID_CONTRATO.AsString;
       Objeto.MFiraOpe.FilterString := Objeto.MFiraOpe.BuscaWhereString;

       // </ ASTECI:AARJ >
       // 11 FEB 2010
       // Código original antes de la modificación:
       // if Objeto.VGTIPO_DISPOSICION= 'DI' then
       if ((Objeto.VGTIPO_DISPOSICION= 'DI') and (not Objeto.VG_OpEv_LC{=False})) or
          ((Objeto.VGTIPO_DISPOSICION = 'RE') and (Objeto.vgDispRen)) then                     // RABA NOV 2014 ACTUALIZACION B-6
       // < ASTECI:AARJ />
       begin
           if InterForma1.IsNewData then
           Begin
              Objeto.ID_PROM_ADM.AsString := Objeto.ContratoCre.Contrato.Id_Pers_Asociad.AsString;
              Objeto.PromotorAdm.FindKey([Objeto.ContratoCre.Contrato.Id_Pers_Asociad.AsString]);
              Objeto.SOBRETASA.AsFloat := Objeto.ContratoCre.SOBRETASA.AsFloat;
              Objeto.OPERADOR_STASA.AsString := Objeto.ContratoCre.OPERADOR_STASA.AsString;
              Objeto.CVE_TASA_REFER.AsString := Objeto.ContratoCre.CVE_TASA_REFER.AsString;
              Objeto.TasaRefer.FindKey([ Objeto.CVE_TASA_REFER.AsString ]);
           end;
       end;

       vgSTant := Objeto.SOBRETASA.AsFloat;

       // </ ASTECI:AARJ >
       // 11 FEB 2010
       // Código original antes de la modificación:
       //if Objeto.VGTIPO_DISPOSICION= 'DI' then
       if ((Objeto.VGTIPO_DISPOSICION= 'DI') and (not Objeto.VG_OpEv_LC{=False})) OR
          ((Objeto.VGTIPO_DISPOSICION = 'RE') and (Objeto.vgDispRen)) then                     // RABA NOV 2014 ACTUALIZACION B-6
       // < ASTECI:AARJ />
       begin
           If (Objeto.ContratoCre.B_FINANC_ADIC.AsString = 'F') or
               (Objeto.ContratoCre.B_FINANC_ADIC.AsString = '') then
           Begin
              chB_FINANC_ADIC.Enabled := False;
              chB_FINANC_ADIC.Checked := False;
              // --- ASOR --- ABRIL 2016 --- INHABILIATA LOS CAMPOS DE LA FECHA DE PERIODO DE GRACIA DE FINANCIAMIENTO ADICIONAL
              EdF_FIN_PERGRA_FA.Enabled:= False;
              EdF_FIN_PERGRA_FA.Text:= '';
              LbF_FIN_PERGRA_FA.Enabled:= False;
              DtpF_FIN_PERGRA_FA.Enabled:= False;
              //-- FIN ---
           end
           ELSE
           BEGIN
              chB_FINANC_ADIC.Enabled := True;
              chB_FINANC_ADIC.Checked := True;
              // --- ASOR --- ABRIL 2016 --- HABILIATA LOS CAMPOS DE LA FECHA DE PERIODO DE GRACIA DE FINANCIAMIENTO ADICIONAL
              EdF_FIN_PERGRA_FA.Enabled:= True;
              LbF_FIN_PERGRA_FA.Enabled:= True;
              DtpF_FIN_PERGRA_FA.Enabled:= True;
              //-- FIN ---
           END;
       end;
       Objeto.B_GENERA_EDOCTA.AsString := Objeto.ContratoCre.Producto.B_GENERA_EDOCTA.AsString;

      //02DIC2004
      if Objeto.ContratoCre.Acreditado.B_AUTORIZADO.AsString = CFALSO then
         ShowMessage('El Acreditado no se encuentra Autorizado por el Área de Créditos');
      //end if

       Objeto.ContratoCre.ObtenDisponibleAcred(Objeto.ContratoCre.Contrato.ID_Titular.AsString);
       Objeto.ContratoCre.ObtenDisponibleGpo(Objeto.ContratoCre.Acreditado.CVE_GRUPO_ECO.AsString);
       Objeto.ContratoCre.ObtenDisponibleAut( Objeto.ContratoCre.ID_CONTRATO.AsString,
                                              Objeto.ContratoCre.FOL_CONTRATO.AsString);
       edCVE_GPO_CAPITALIZ.Text := Objeto.ContratoCre.CVE_GPO_CAPITALIZ.AsString;
       edPCT_CAPITALIZA.Text:= Objeto.ContratoCre.PctCapiliz.PCT_CAPITALIZA.AsString;
       Objeto.ContratoCre.ValidaDatosInscripcion;

       Objeto.ID_PROM_ADM.AsString := Objeto.ContratoCre.ID_PROM_ADMON.AsString;
       Objeto.PromotorAdm.FindKey([Objeto.ContratoCre.ID_PROM_ADMON.AsString]);

       InterForma1.ValidaExit(iedID_CONTRATO,VLSalida,VlMsg,True);
   End;
end;

procedure TWCrCredito.chB_APLICA_IVAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_APLICA_IVA,True,'',True);
end;

procedure TWCrCredito.chB_APLICA_COMExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      if chB_APLICA_COM.Checked then
         edPCT_COMISION.SetFocus;
      //end if;
      InterForma1.ValidaExit(chB_APLICA_COM,True,'',True);
      //end if
   end;
end;

procedure TWCrCredito.edCVE_CALCULOExit(Sender: TObject);
var  VLSalida,vlEnc  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     if not(vgCambio) then
     Begin
        VLMsg     := '';
        VlSalida  := True;
        Objeto.CVE_CALCULO.GetFromControl;
        if Objeto.CVE_CALCULO.AsString = '' then
        Begin
           VLMsg := 'Favor de Indicar la Clave del Calculo de Intereses';
           VlSalida   := False;
        end; //end if

        vlEnc:=Objeto.CalcInt.FindKey([Objeto.CVE_CALCULO.asString]);
        if vlEnc then
        Begin
           if (Trim(Objeto.CalcInt.B_INT_DIASIG.AsString) <> 'V') and (chB_INT_DIASIG.Checked) then
           begin
              chB_INT_DIASIG.Checked:=false;
              Objeto.B_INT_DIASIG.GetFromControl;
              ShowMessage('El tipo de Cálculo de Interés no soporta la Modalidad de Día Siguiente');
           end;
        end; //end if

        InterForma1.ValidaExit(edCVE_CALCULO,VLSalida,VLMsg,True);
     end;
   end;
end;

procedure TWCrCredito.btCALC_INTClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCREDITO_CALIN',True,True) then
   begin
     //Buscador de Calculo de interes
     Objeto.CalcInt.ShowAll := True;
     if Objeto.CalcInt.Busca then
        InterForma1.NextTab(btCALC_INT);
     //end if
   end;
end;

procedure TWCrCredito.ilCALINTEjecuta(Sender: TObject);
begin
   if Objeto.CalcInt.FindKey([ilCALINT.Buffer]) then
      InterForma1.NextTab(edCVE_CALCULO);
   //end if
end;

procedure TWCrCredito.edCVE_AMORTIZACIONExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.CVE_AMORTIZACION.GetFromControl;
      if Objeto.CVE_AMORTIZACION.AsString = '' then
      Begin
         VLMsg := 'Favor de Indicar el Tipo de Amortización';
         VlSalida   := False;
      end; //end if
      //Solo Modo Append
      if (Objeto.Modo=moAppend) and VlSalida then
      begin
           AsignaPagoCap;
      end;
      VerPagoCap;
      InterForma1.ValidaExit(edCVE_AMORTIZACION,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrCredito.btTIPO_AMORTClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCREDITO_TAMOR',True,True) then
   begin
     // Buscador de Tipos de Amortizacion
      Objeto.TipoAmort.ShowAll := True;
      if Objeto.TipoAmort.Busca then
         InterForma1.NextTab(btTIPO_AMORT);
      //end if
   end;
end;

procedure TWCrCredito.ilTIPAMORTEjecuta(Sender: TObject);
begin
   if Objeto.TipoAmort.FindKey([ilTIPAMORT.Buffer]) then
      InterForma1.NextTab(edCVE_AMORTIZACION);
   //end if
end;

procedure TWCrCredito.edCVE_PAG_INTERESExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
        VLMsg    := '';
        VlSalida := True;
        Objeto.CVE_PAG_INTERES.GetFromControl;
        if Objeto.CVE_PAG_INTERES.AsString = '' then
        Begin
             VLMsg := 'Favor de Indicar el Pago de Intereses';
             VlSalida   := False;
        end; //end if
        if (Objeto.Modo=moAppend) and (VlSalida) then
        begin
             AsignaPagoInt;
        end;
        VerPagoInt;
        InterForma1.ValidaExit(edCVE_PAG_INTERES,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrCredito.btPAGO_INTClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCREDITO_PAGIN',True,True) then
   begin
     //Buscador a la Clase de Pago de Intereses
     Objeto.PagoInt.ShowAll := True;
     if Objeto.PagoInt.Busca then
        InterForma1.NextTab(btPAGO_INT);
     //end if
   end;
end;

procedure TWCrCredito.ilPAGINTEjecuta(Sender: TObject);
begin
   if Objeto.PagoInt.FindKey([ilPAGINT.Buffer]) then
      InterForma1.NextTab(edCVE_PAG_INTERES);
   //end if
end;

procedure TWCrCredito.edCVE_LIQUIDACIONExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.CVE_LIQUIDACION.GetFromControl;
      if Objeto.CVE_LIQUIDACION.AsString = '' then
      Begin
         VLMsg := 'Favor de Indicar el Tipo de Liquidación';
         VlSalida   := False;
      end; //end if

       // </ ASTECI:AARJ >
       // 11 FEB 2010 PARA EVITAR LA AMBIEGüEDAD
       // Código original antes de la modificación:
       //if Objeto.VGTIPO_DISPOSICION= 'DI' then
       if ((Objeto.VGTIPO_DISPOSICION= 'DI') and (not Objeto.VG_OpEv_LC{=False})) then
       // < ASTECI:AARJ />
       begin
           If Objeto.ContratoCre.B_FINANC_ADIC.AsString = 'F' then
           Begin
              chB_FINANC_ADIC.Enabled := False;
              chB_FINANC_ADIC.Checked := False;
              // --- ASOR --- ABRIL 2016 --- INHABILIATA LOS CAMPOS DE LA FECHA DE PERIODO DE GRACIA DE FINANCIAMIENTO ADICIONAL
              EdF_FIN_PERGRA_FA.Enabled:= False;
              EdF_FIN_PERGRA_FA.text:= '';
              LbF_FIN_PERGRA_FA.Enabled:= False;
              DtpF_FIN_PERGRA_FA.Enabled:= False;
              //-- FIN ---
           end
           ELSE
           BEGIN
              chB_FINANC_ADIC.Enabled := True;
              chB_FINANC_ADIC.Checked := True;
              // --- ASOR --- ABRIL 2016 --- INHABILIATA LOS CAMPOS DE LA FECHA DE PERIODO DE GRACIA DE FINANCIAMIENTO ADICIONAL
              EdF_FIN_PERGRA_FA.Enabled:= True;
              LbF_FIN_PERGRA_FA.Enabled:= True;
              DtpF_FIN_PERGRA_FA.Enabled:= True;
              //-- FIN ---
           END;
       end;

       VerificaTasaRefer;

      InterForma1.ValidaExit(edCVE_LIQUIDACION,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrCredito.btTIPO_LIQClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCREDITO_TPLIQ',True,True) then
   begin
     //Buscador a la Clase de Tipos de Liquidación
     Objeto.TipLiq.ShowAll := True;
     if Objeto.TipLiq.Busca then
        InterForma1.NextTab(btTIPO_LIQ);
     //end if
   end;
end;

procedure TWCrCredito.ilTIPLIQEjecuta(Sender: TObject);
begin
   if Objeto.TipLiq.FindKey([ilTIPLIQ.Buffer]) then
      InterForma1.NextTab(edCVE_LIQUIDACION);
   //end if
end;

procedure TWCrCredito.edFACT_MORASExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      //Verifica que el dato no sea negativo
      Objeto.FACT_MORAS.GetFromControl;
      if not (ValNumPositivo(VlMsg,Objeto.FACT_MORAS.AsInteger)) then
         VLSalida := False;
      //end if
      if ((VLSalida) and (Objeto.FACT_MORAS.AsFloat > 2)) then
      begin
          if Not(MessageDlg('El factor de MORAS es mayor a 2. ¿Desea Continuar?',
             mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
          begin
               vlMsg := ' Factor de MORAS es mayor a 2';
               vlSalida := False;
          end;
      end;
      if ((VLSalida) and (Objeto.FACT_MORAS.AsFloat = 0)) then
      begin
          if Not(MessageDlg('El factor de MORAS es IGUAL a CERO. ¿Desea Continuar?',
             mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
          begin
               vlMsg := ' Factor de MORAS es IGUAL a CERO';
               vlSalida := False;
          end;
      end;
      InterForma1.ValidaExit(edFACT_MORAS,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrCredito.edIMP_CREDITOExit(Sender: TObject);
Var     vlSalida        : Boolean;
        vlMsg           : String;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.IMP_CREDITO.GetFromControl;
      if Objeto.IMP_CREDITO.AsString <> '' then
      Begin //Verifica que no sea numero negativo
         if Objeto.IMP_CREDITO.AsFloat <= 0 then
         Begin
            vlSalida := False;
            vlMsg    := 'El importe no puede ser menor o Igual a Cero';
         end
         else
         Begin //si es numero positivo verifica que se encuentre en el rango del
               //importe del producto del credito
           if Objeto.ContratoCre.Producto.B_RANGO_IMP_DISP.AsString = CVERDAD THEN
           Begin
             if ((Objeto.IMP_CREDITO.AsFloat < Objeto.ContratoCre.Producto.IMP_MIN_AUT_CRE.AsFloat)or
                 (Objeto.IMP_CREDITO.AsFloat > Objeto.ContratoCre.Producto.IMP_MAX_AUT_CRE.AsFloat)) then
             begin
                vlMsg :=' El importe autorizado disponible no se encuentra dentro del rango de los importes: ' +
                        ' ( ' + Objeto.ContratoCre.Producto.IMP_MIN_AUT_CRE.AsString + ' - ' +
                             Objeto.ContratoCre.Producto.IMP_MAX_AUT_CRE.AsString + ' ) ' ;
                vlSalida := False;
             end
           end;
         end;
      end;

       if Objeto.ContratoCre.DISPONIBLE_AUT.AsFloat < Objeto.IMP_CREDITO.AsFloat  then
       Begin
          if MessageDlg('La autorización no cuenta con Disponible suficiente. ¿Desea Continuar?',
             mtConfirmation, [mbYes, mbNo], 0) = mrNo then
          begin
             vlMsg :=' La autorización no cuenta con Disponible suficiente';
             vlSalida := False;
          end;
       end;

      InterForma1.ValidaExit(edIMP_CREDITO,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrCredito.edIMP_DISPUESTOExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.IMP_DISPUESTO.GetFromControl;
      //Verifica que no sea numero negativo
      if Objeto.IMP_DISPUESTO.AsFloat < 0 then
      Begin
         VLSalida := False;
         VLMsg    := 'El importe no puede ser negativo';
      end
      else
      Begin //si es numero positivo verifica que se encuentre en el rango del
            //importe del producto del credito
         if ((Objeto.IMP_DISPUESTO.AsFloat < Objeto.ContratoCre.Producto.IMP_MIN_AUT_DIS.AsFloat)or
             (Objeto.IMP_DISPUESTO.AsFloat > Objeto.ContratoCre.Producto.IMP_MAX_AUT_DIS.AsFloat)) then
         begin
            VLMsg :=' El Importe Dispuesto no está dentro del rango del Importe del Producto ' +
                    ' ( ' + Objeto.ContratoCre.Producto.IMP_MIN_AUT_DIS.AsString + ' - ' +
                            Objeto.ContratoCre.Producto.IMP_MAX_AUT_DIS.AsString + ' ) ' ;
            VLSalida := False;
         end;
      end;
      //end if
      InterForma1.ValidaExit(edIMP_DISPUESTO,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrCredito.edCVE_CALIF_CREExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_CALIF_CRE,True,'',True);
end;
{ < / EASA4011  09.MAR.2007      Req. Promotor asignado
procedure TWCrCredito.edID_PROM_ADMExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      //No permite nulos, verifca que debe de ingresar el promotor
      Objeto.ID_PROM_ADM.GetFromControl;
      if Objeto.ID_PROM_ADM.AsString = '' then
      Begin
          vlSalida := False;
          vlmsg := 'Favor de Indicar el Promotor Administrativo';
      end;
      InterForma1.ValidaExit(edID_PROM_ADM,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrCredito.btPROM_ADMClick(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.PromotorAdm.ShowAll := True;
      if Objeto.PromotorAdm.Busca then
         InterForma1.NextTab(btPROM_ADM);
      //end if
   end;
end;
EASA >/ }
procedure TWCrCredito.edDIAS_PLAZOExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      Objeto.DIAS_PLAZO.GetFromControl;
      Objeto.F_INICIO.GetFromControl;
      If Objeto.F_INICIO.AsString <> '' then
      Begin
         if vlSalida then
         begin
            if Objeto.DIAS_PLAZO.AsInteger <= 0  then
               Objeto.DIAS_PLAZO.AsInteger := Objeto.ContratoCre.Producto.PLAZO_MIN_CREDITO.AsInteger;
            //end if
           if Objeto.ContratoCre.Producto.B_RANGO_PLA_DISP.AsString = CVERDAD THEN
           Begin
             if ((Objeto.DIAS_PLAZO.AsInteger < Objeto.ContratoCre.Producto.PLAZO_MIN_CREDITO.AsInteger)or
                 (Objeto.DIAS_PLAZO.AsInteger > Objeto.ContratoCre.Producto.PLAZO_MAX_CREDITO.AsInteger)) then
             begin
                VLMsg :=' El Plazo de la disposición no está dentro del rango del Plazo del Producto ' +
                        ' ( ' + Objeto.ContratoCre.Producto.PLAZO_MIN_CREDITO.AsString + ' - ' +
                                Objeto.ContratoCre.Producto.PLAZO_MAX_CREDITO.AsString + ' ) ' ;
                VLSalida := False;
             end;
           end;
            Objeto.F_VENCIMIENTO.AsDateTime := Objeto.F_INICIO.AsDateTime + Objeto.DIAS_PLAZO.AsInteger;
         end;
      end
      else
      Begin
         if Objeto.ContratoCre.Producto.PLAZO_MIN_CREDITO.AsInteger <=0  then
             Objeto.DIAS_PLAZO.AsInteger := 1
         else
             Objeto.DIAS_PLAZO.AsInteger := Objeto.ContratoCre.Producto.PLAZO_MIN_CREDITO.AsInteger;
      end;

      //filtrar por plazo las unidades de tiempo
      Objeto.UTiempoTasa.BuscaWhereString := 'CR_UNIDAD_TIEMPO.NUM_DIAS < ' + Objeto.DIAS_PLAZO.AsString;
      Objeto.UTiempoTasa.FilterString := Objeto.UTiempoTasa.BuscaWhereString;

      Objeto.UTiempoCap.BuscaWhereString := 'CR_UNIDAD_TIEMPO.NUM_DIAS < ' + Objeto.DIAS_PLAZO.AsString;
      Objeto.UTiempoCap.FilterString := Objeto.UTiempoCap.BuscaWhereString;

      Objeto.UTiempoInt.BuscaWhereString := 'CR_UNIDAD_TIEMPO.NUM_DIAS < ' + Objeto.DIAS_PLAZO.AsString;
      Objeto.UTiempoInt.FilterString := Objeto.UTiempoInt.BuscaWhereString;

      InterForma1.ValidaExit(edDIAS_PLAZO,vlSalida,vlMsg,True);
   end;
end;
{ < / EASA4011  09.MAR.2007      Req. Promotor asignado
procedure TWCrCredito.ilPROMADMEjecuta(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      if Objeto.PromotorAdm.FindKey([ilPROMADM.Buffer]) then
         InterForma1.NextTab(edID_PROM_ADM);
      //end if
end;
EASA >/ }
procedure TWCrCredito.ilIDCONTRATOEjecuta(Sender: TObject);
begin
   if Objeto.ContratoCre.FindKey([ilIDCONTRATO.Buffer,'1']) then
   begin
      icpCONTRATO.RefrescaInfo;
      TipoPagoAUsar;
//      InsertaCalificacion;
      InterForma1.NextTab(iedID_CONTRATO);
   end;
end;

//Llama la ventana para convertir meses o años a Dias
Function TWCrCredito.VentanaCalculo(pDato : String): string;
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

procedure TWCrCredito.btDIASPLAZOClick(Sender: TObject);
begin
   if Objeto.Active then
      edDIAS_PLAZO.Text:= VentanaCalculo(Objeto.DIAS_PLAZO.AsString);
   //end if
end;

procedure TWCrCredito.InterForma1Buscar(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
    qyQuery : TQuery;
    sSQL    : String;
    vlCount : integer;  // RABA OCT 2013 PROYECTO CAMBIO DE TASA
begin
   if Objeto.Busca then
   Begin
      icpCONTRATO.Frame := Objeto.ContratoCre.Contrato;
      icpCONTRATO.RefrescaInfo;
      TipoPagoAUsar;
      Objeto.ContratoCre.ObtenDisponibleAcred(Objeto.ContratoCre.Contrato.ID_Titular.AsString);
      Objeto.ContratoCre.ObtenDisponibleGpo(Objeto.ContratoCre.Acreditado.CVE_GRUPO_ECO.AsString);
      MuestraHints;
      ValidaUsuario;
      DeshabilitaBotonesXSit;
      //Filtra operativas de acuerdo a la Autorización EASA 10092004
      Objeto.MFiraOpe.BuscaWhereString := 'CR_GA_FIRA_CTO.ID_CONTRATO = ' +Objeto.ID_CONTRATO.AsString;
      Objeto.MFiraOpe.FilterString := Objeto.MFiraOpe.BuscaWhereString;
      Objeto.MFiraOpe.MFiraOpe.FindKey([Objeto.CVE_OPERATIVA.AsString]);
      Objeto.IMP_COMISION.AsFloat := GenComisDisp(Objeto.IMP_CREDITO.AsFloat, Objeto.PCT_COMISION.AsFloat,
                                               Objeto.ID_CONTRATO.AsInteger,
                                               Objeto.ID_CREDITO.AsInteger,
                                               Objeto.Apli, vlSalida,vlMsg);
      Objeto.ContratoCre.ObtenDisponibleAut(Objeto.ContratoCre.ID_CONTRATO.AsString,Objeto.ContratoCre.FOL_CONTRATO.AsString); // SELECT PKGCRSALDOS.STPOBTDISPONIBLEAUT( 330019452,1) DISPONIBLE_AUT FROM DUAL
      IF ( Objeto.CVE_TASA_REFER.AsString <> CNULL ) AND                                                                       // SELECT PKGCRSALDOS.STPOBTDISPUESTOAUT( 330019452,1) DISPUESTO_AUT FROM DUAL
         ( Objeto.CVE_TASA_REFER.AsString <> C_TASA_FIJA )  THEN
         edVALOR_TASA.Text := ValorTasa(Objeto.CVE_TASA_REFER.AsString)
      else Begin
         if Objeto.OPERADOR_STASA.AsString = '+' then
            edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat - Objeto.SOBRETASA.AsFloat )
         else if Objeto.OPERADOR_STASA.AsString = '-' then
            edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat + Objeto.SOBRETASA.AsFloat )
         else if Objeto.OPERADOR_STASA.AsString = '*' then
            edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat / Objeto.SOBRETASA.AsFloat )
         else if Objeto.OPERADOR_STASA.AsString = '/' then
            edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat * Objeto.SOBRETASA.AsFloat )
         else
            edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat - Objeto.SOBRETASA.AsFloat );
      end;

      lb_Credescto.Visible:=false;
      sSQL:= 'SELECT SIT_CREDITO FROM CR_FND_CREDITO '+
             ' WHERE ID_CREDITO ='+ Objeto.ID_CREDITO.AsSQL +
             '   AND SIT_CREDITO IN (''AC'',''NA'')';

      qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      If qyQuery <> Nil Then
      begin
        lb_Credescto.Visible:=true;
        qyQuery.Close;
      End;

   End;

//ROIM748 JULIO 2009
   sSQL := 'SELECT DESC_CLAVE FROM CR_CON_CAT_DATA WHERE CVE_CON_GPO_CAT = ''CAT_TIPO_LIQUIDA'' AND CVE_CLAVE = ' + Objeto.CVE_TIPO_BAJA.AsSQL ;
   qyQuery:= GetSQLQuery(sSQL, Objeto.DataBaseName, Objeto.SessionName, False);
   try
      edDESC_TIPO_BAJA.Text := '';
      If qyQuery <> Nil Then
      Begin
           edDESC_TIPO_BAJA.Text := qyQuery.FieldByName('DESC_CLAVE').AsString;
      end;
      // </INICIO> JJAR 24/03/2010 PROCEDIMIENTO PARA DETERMINAR VALORES DE VG_OpEv_LC y   VGFOL_GRUPO_RENUEVA
      Objeto.Inicializa_EsOpEv_LC;
      // </FIN> JJAR 24/03/2010
   finally
      qyQuery.Free;
   end;
   //ROIM748 JULIO 2009

   //<RABA> OCT 2013 PROYECTO CAMBIO TASA
   sSQL:= ' SELECT COUNT(*) COUNT FROM CR_CESION WHERE ID_CESION = ' + Objeto.ID_CREDITO.AsString;
   GetSQLInt(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlCount,False);
   if vlCount <> 0 then
      CambiodeTasa1.Enabled := False
   else if Objeto.SIT_CREDITO.AsString <> CSIT_AC Then
      CambiodeTasa1.Enabled := False
   else if Objeto.CVE_PAG_INTERES.AsString = '1' Then
      CambiodeTasa1.Enabled := False
   //else if Objeto.CVE_CALCULO.AsString = 'PD' Then      //ASOR FEB-2016 PROYECTO FACTORAJE PURO
   //   CambiodeTasa1.Enabled := False
   else
      CambiodeTasa1.Enabled := True;
   //</RABA>

   // RABA OCT 2014 ACTUALIZACION B6 
   if (Objeto.SIT_CREDITO.AsString = CSIT_NA) OR
      (Objeto.SIT_CREDITO.AsString = CSIT_NP) OR
      (Objeto.SIT_CREDITO.AsString = CSIT_RE) THEN
      if HayVencidos(Objeto.ID_CRE_RENOVADO.AsString) then
         edTIPO_CARTERA.Text := 'VENCIDO'
      else
         edTIPO_CARTERA.Text := 'VIGENTE';
   // fin RABA
end;

Procedure TWCrCredito.MuestraHints;
Begin
      edDESC_PRODUCTO.Hint := Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO.ShowHint := True;
//      edDESC_TASA_REFER.Hint := Objeto.ContratoCre.TasReferPrMn.TasaRefer.DESC_TASA_INDIC.AsString;
      edDESC_TASA_REFER.Hint := Objeto.ContratoCre.TasaRefer.DESC_TASA_INDIC.AsString;
      edDESC_TASA_REFER.ShowHint := True;
      edDESC_CALC_INT.Hint := Objeto.CalcInt.DESC_CALCULO.AsString;
      edDESC_CALC_INT.ShowHint := True;
      edDESC_TIPO_AMORT.Hint := Objeto.TipoAmort.DESC_AMORTIZA.AsString;
      edDESC_TIPO_AMORT.ShowHint := True;
      edDESC_PAGO_INT.Hint := Objeto.PagoInt.DESC_PAG_INTERES.AsString;
      edDESC_PAGO_INT.ShowHint := True;
      edDESC_TIPO_LIQ.Hint := Objeto.TipLiq.DESC_LIQUIDACION.AsString;
      edDESC_TIPO_LIQ.ShowHint := True;
      edNOMBRE_PROM_ADM.Hint := Objeto.PromotorAdm.Nombre.AsString;
      edNOMBRE_PROM_ADM.ShowHint := True;
End;

procedure TWCrCredito.InterForma1DespuesAceptar(Sender: TObject);
var vlCount: Integer;
    vlsql : String;
    vlfolioRR :Integer;
begin
   MuestraHints;
   if not(FindCredOrigen) THEN Begin
        Objeto.ArmaTabla;
   end
   else Begin
      Objeto.RestauraTabla;
   end;

   //HERJA ABRIL2013
   btValidaRSRE.Visible:=false;
   GetSQLInt('SELECT COUNT(*) COUNT FROM CR_RR_CREDITO WHERE ID_CRED_RENUEVA = ' + Objeto.ID_CREDITO.AsString+' AND SIT_RENUEVA=''NA''',
             Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,'COUNT',vlCount ,False);
   If vlCount > 0 Then
   begin
      //SE OBTIENE EL FOLIO DE CR_RR_CREDITO
      btValidaRSRE.Visible:=true;
      GetSQLInt('SELECT FOL_GRUPO_RENUEVA FROM CR_RR_CREDITO WHERE ID_CRED_RENUEVA = ' + Objeto.ID_CREDITO.AsString+' AND SIT_RENUEVA=''NA''',
                Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,'FOL_GRUPO_RENUEVA',vlfolioRR ,False);

      //RABA MAR-2015 DESPUES DE CAPTURAR LAS NUEVAS CONDICIONES DEL CREDITO
      //SE VUELVE A EVALUAR SI ES VIGENTE O VENCIDO POR EL TEMA DE PERIODOS DE GRACIA
      IF ((Objeto.TIPO_DISPOSICION.AsString ='RS') or (Objeto.TIPO_DISPOSICION.AsString='RE')) and
         (Objeto.SIT_CREDITO.AsString = 'NA') THEN
      BEGIN
        Objeto.StpValidaVencido(Objeto.ID_CREDITO.AsInteger, Objeto.ID_CRE_RENOVADO.AsInteger);
        if HayVencidos(Objeto.ID_CRE_RENOVADO.AsString) then
           edTIPO_CARTERA.Text := 'VENCIDO'
        else
           edTIPO_CARTERA.Text := 'VIGENTE';
      END;
      // FIN RABA

      Objeto.StpValidaRSRE(Objeto.ID_CREDITO.AsInteger);
   end;

   DeshabilitaBotonesXSit;
   ValidaUsuario; //EASA4011    26 ABRI 2006 CORRECCION
   DatosAdicionalesaTasas1.Enabled := True;
   if InterForma1.IsNewData then
   Begin
      Objeto.StpComisProg(Objeto.ID_CREDITO.AsInteger);
      GetSQLInt('SELECT COUNT(*) COUNT FROM CR_COMIS_PROG WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsString,
                                   Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,'COUNT',vlCount ,False);
      If vlCount > 0 Then
         ClassComisProg;
      //end if

      // </ RABA > 24 MAY 2010
      // ESTE CODIGO SE PASA A LA FUNCION InsertaCredito, LA CUAL ES INVOCADA
      // EN EL INTERNALPOST CUANDO SE TRATA DE UN NUEVO REGISTRO

      // </INICIO> JJAR 24/03/2010 PARA CUANDO NO SE AUTORIZA AL MOMENTO DE LA OPERACION LC EL CREDITO
      // SE GRABA EL DATO DE ID_CRED_RENUEVA PARA CUANDO SE REQUIERA AUTORIZARLO POSTERIORMENTE
//      vlsql := ' UPDATE CR_RR_CREDITO ' +
//               ' SET ID_CRED_RENUEVA = ' + IntToStr(Objeto.ID_CREDITO.AsInteger) +
//               ' WHERE FOL_GRUPO_RENUEVA = '+ IntToStr(objeto.VGFOL_GRUPO_RENUEVA) + '';
//
//      if not (RunSQL(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,False)) then
//         ShowMessage('No se pudo vincular la disposicion con CR_RR_CREDITO');
      // <FIN/>
      // < RABA />

   end;
end;

procedure TWCrCredito.edTASA_CREDITOExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
Procedure ValidaTasaRef;
var vlSql : String;
    vlTasaFinal : String;
    vlcount    : String;
BEGIN
   //<LOLS 16ENE2006.  EL PROCESO DE TASA SE DEBE LLAMAR CUANDO B_REDONDEO = 'V' OR B_TASA_MAX_MIN = 'V'>
   GetSQLStr(' SELECT count(*) COUNT FROM CR_INF_ADIC_TASA WHERE ID_CREDITO = '+
              Objeto.ID_CREDITO.AsString + ' AND ( B_REDONDEO = ''V'' OR B_TASA_MAX_MIN = ''V'' )' ,
             Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlcount,False);
   //GetSQLStr(' SELECT count(*) COUNT FROM CR_INF_ADIC_TASA WHERE ID_CREDITO = '+ Objeto.ID_CREDITO.AsString ,
   //          Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlcount,False);
   //</LOLS>
   if vlcount > '0' then
   Begin
     vlSql := ' SELECT PKGCRCOMUN.SptObtTasaFinal( ' + Objeto.ID_CREDITO.AsString   + ',' +
                                                       Objeto.TASA_CREDITO.AsString + ') TASA_FINAL FROM DUAL ';
     GetSQLStr(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'TASA_FINAL',vlTasaFinal,False);
     If StrToFloat(vlTasaFinal) <> Objeto.TASA_CREDITO.AsFloat then
        if MessageDlg('¿Se va a actualizar la tasa de acuerdo a los datos adicionales de tasas',
                mtInformation, [mbOK], 0) = mrOK then
           Objeto.TASA_CREDITO.AsFloat := StrToFloat(vlTasaFinal);
        //end if
     //end if;
   end;
END;

begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.TASA_CREDITO.GetFromControl;
      Objeto.SOBRETASA.GetFromControl;
      //OBTIENE EL VALOR DE LA TASA DEL CREDITO
      if Objeto.CVE_TASA_REFER.AsString = C_TASA_FIJA then
       Begin
         if Objeto.OPERADOR_STASA.AsString = '+' then
            edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat - Objeto.SOBRETASA.AsFloat )
         else if Objeto.OPERADOR_STASA.AsString = '-' then
            edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat + Objeto.SOBRETASA.AsFloat )
         else if Objeto.OPERADOR_STASA.AsString = '*' then
            edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat / Objeto.SOBRETASA.AsFloat )
         else if Objeto.OPERADOR_STASA.AsString = '/' then
            edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat * Objeto.SOBRETASA.AsFloat )
         else
            edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat - Objeto.SOBRETASA.AsFloat );
      end;
      //SI SE MODIFICA LA SOBRETASA
      if Objeto.ContratoCre.Producto.B_MOD_STASA_D.AsString = CVERDAD then
      Begin
{         if Objeto.SOBRETASA.AsFloat < 0 then
            edSOBRETASA.SetFocus
         else if Objeto.SOBRETASA.AsFloat > 0 then      EASA4011        03032005}
         Objeto.SOBRETASA.AsFloat := Objeto.TASA_CREDITO.AsFloat - StrToFloat( edVALOR_TASA.Text );
      end
      //SI NO SE MODIFICA LA SOBRETASA
      else
      begin
{         IF ( Objeto.SOBRETASA.AsFloat < 0 ) and ( StrToFloat(edVALOR_TASA.Text) < 0 ) THEN
         Begin
            VLMsg    := 'La sobre tasa no puede ser menor a cero';
            VLSalida := False;
         end
         else
         Begin}
            if StrToFloat(edVALOR_TASA.Text) > 0 then
               ValorTasaCred;
//         end;
      end;
      if Objeto.TASA_CREDITO.AsFloat <= 0 then
      Begin
         VLMsg    := 'No puede ser menor a cero la tasa a aplicar';
         VLSalida := False;
      end;
      //si la sobretasa es cero no valida nada
      if Objeto.SOBRETASA.AsFloat > 0 then
         if StrToFloat( FormatFloat('###0.0000',Objeto.SOBRETASA.AsFloat ) ) <  StrToFloat( FormatFloat('###0.0000',vgSTant) ) then
        Begin
           vlSalida := False;
           vlMsg := 'La sobretasa no puede ser menor a '+  FloatToStr( vgSTant ) ;
           edSOBRETASA.SetFocus;
        end;
      //end if
      if ( Objeto.Modo = moEdit) then
         ValidaTasaRef;
      //END IF
   end;
   InterForma1.ValidaExit(edTASA_CREDITO,VLSalida,VLMsg,True);
end;

procedure TWCrCredito.btTASA_REFERExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlSalida := True;
     vlMsg := CNULL;
     Objeto.CVE_TASA_REFER.GetFromControl;
     Objeto.SOBRETASA.GetFromControl;
     if Objeto.CVE_TASA_REFER.AsString = CNULL then
     Begin
        vlSalida := False;
        vlMsg := 'Favor de Indicar la Tasa de Referencia';
     end;

     if VlSalida then
     begin
         // </ ASTECI:AARJ >
         // NOTA : 11 FEB 2010, en caso de que se tenga DI por LC entonces también entra en esta sección
         // < ASTECI:AARJ />
         if ((Objeto.VGTIPO_DISPOSICION = 'DI') OR (Objeto.VGTIPO_DISPOSICION = 'RS')) then
         begin
             VerificaTasaRefer;
             if Objeto.CVE_TASA_REFER.AsString <> C_TASA_FIJA then
             Begin
                cbTIPO_TASA.Text := 'VARIABLE';
                cbTIPO_TASA.Enabled := True;
                edVALOR_TASA.Text := ValorTasa(Objeto.CVE_TASA_REFER.AsString);
                cbTIPO_TASA.SetFocus;
             end
             else if Objeto.CVE_TASA_REFER.AsString = C_TASA_FIJA then
             Begin
                if ( Objeto.CVE_CALCULO.AsString = 'RE' ) THEN
                Begin
                   ShowMessage('La clave de calculo de interes no puede ser Revisable');
                   edCVE_CALCULO.SetFocus;
                end;
                edVALOR_TASA.Text := Objeto.ContratoCre.TASA_BASE.AsString;
                cbTIPO_TASA.Enabled := False;
                cbTIPO_TASA.Text := 'FIJA';
                bbUNIDAD_TIEMPO_RE.Enabled := False;
                edNUM_UNIDADES_RE.Enabled := False;
                cbDIA_REVISION.Enabled := False;
                edF_PROX_REVISION.Enabled := False; //019
                dtpF_PROX_REVISION.Enabled := False;
                edNUM_UNIDADES_RE.Color := clBtnFace;
                cbDIA_REVISION.Color := clBtnFace;
                edF_PROX_REVISION.Color := clBtnFace;
                Objeto.F_PROX_REVISION.AsDateTime := Objeto.F_INICIO.AsDateTime;
             end;
             //OBTIENE EL VALOR DE LA TASA DEL CREDITO
             ValorTasaCred;
         end;
     end;
//     vgSTant := Objeto.SOBRETASA.AsFloat;
     InterForma1.ValidaExit(edCVE_TASA_REFER,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrCredito.cbOPERADOR_STASAExit(Sender: TObject);
var vlSalida : Boolean;
    vlMesg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlMesg   := CNULL;
     vlSalida := True;
     Objeto.OPERADOR_STASA.GetFromControl;
     if Objeto.OPERADOR_STASA.AsString = CNULL then
     Begin
        vlSalida := False;
        vlMesg := 'Indique el Operador de la Sobretasa';
     end;
     InterForma1.ValidaExit(cbOPERADOR_STASA,vlSalida,vlMesg,True);
   end;
end;

procedure TWCrCredito.edSOBRETASAExit(Sender: TObject);
var     vlSalida        : Boolean;
        VlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlMsg   := CNULL;
     vlSalida := True;
     Objeto.SOBRETASA.GetFromControl;
     Objeto.CVE_TASA_REFER.GetFromControl;
     Objeto.TASA_CREDITO.GetFromControl;
     if Objeto.SOBRETASA.AsString = CNULL then
     Begin
        vlSalida := False;
        vlMsg := 'Indique de favor la Sobretasa';
     end

     else if Objeto.SOBRETASA.AsFloat <{=} 0 then
     Begin
        vlSalida := False;
//        vlMsg := 'La sobretasa no debe ser menor o igual a cero';
        vlMsg := 'La sobretasa no debe ser menor a cero';
     end
     else ValorTasaCred;

     if Objeto.SOBRETASA.AsFloat > 0 then
       if StrToFloat( FormatFloat('###0.0000',Objeto.SOBRETASA.AsFloat ) ) <  StrToFloat( FormatFloat('###0.0000',vgSTant) ) then
       Begin
          vlSalida := False;
          vlMsg := 'La sobretasa no puede ser menor a '+  FloatToStr( vgSTant ) ;
       end;
     //end if;
     InterForma1.ValidaExit(edSOBRETASA,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrCredito.btTASA_REFERClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCREDITO_TSREF',True,True) then
   begin
       Objeto.TasaRefer.ShowAll := True;
       if Objeto.TasaRefer.Busca then
          InterForma1.NextTab(btTASA_REFER);
       //end if
   end;
end;

procedure TWCrCredito.ilTASA_REFEREjecuta(Sender: TObject);
begin
   if Objeto.TasaRefer.FindKey([ilTASA_REFER.Buffer]) then
       InterForma1.NextTab(edCVE_TASA_REFER);
   //end if
end;

procedure TWCrCredito.edF_INICIOExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      Objeto.F_INICIO.GetFromControl;
      If Objeto.F_INICIO.AsString <> '' then
      Begin
         if ValidaFecha(Objeto.F_INICIO.AsDateTime,Objeto.Apli) <> 0 then
         begin
            vlMsg := ' La fecha de inicio es un día no hábil';
            vlSalida := False;
         end;
      end
      else      //Si la fecha es nula le asigna la fecha de la empresa
         Objeto.F_INICIO.AsDateTime := Objeto.Apli.DameFechaEmpresa;
      InterForma1.ValidaExit(edF_INICIO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrCredito.edF_VENCIMIENTOExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      Objeto.F_INICIO.GetFromControl;
      Objeto.F_VENCIMIENTO.GetFromControl;
      If Objeto.F_VENCIMIENTO.AsString = '' then
         Objeto.F_VENCIMIENTO.AsDateTime := Objeto.F_INICIO.AsDateTime + Objeto.DIAS_PLAZO.AsInteger
      else
      Begin
         if Objeto.F_INICIO.AsDateTime > Objeto.F_VENCIMIENTO.AsDateTime then
         Begin
            vlMsg := ' La fecha de vencimiento no puede ser menor a la fecha de inicio';
            vlSalida := False;
         End
         else if Objeto.F_VENCIMIENTO.AsDateTime < Objeto.Apli.DameFechaEmpresa then
         Begin
            vlMsg := ' La fecha de vencimiento no puede ser menor a la fecha de hoy';
            vlSalida := False;
         End
         else
         begin
            if ValidaFecha(Objeto.F_VENCIMIENTO.AsDateTime,Objeto.Apli) <> 0 then
            Begin
               vlMsg := ' ';
               if MessageDlg('La fecha de vencimiento es un día inhábil. ¿Desea Continuar?',
                 mtConfirmation, [mbYes, mbNo], 0) = mrNo then
               begin
                     vlMsg := ' La fecha de vencimiento es un día inhábil.';
                     vlSalida := False;
               end;
            End;
            Objeto.DIAS_PLAZO.AsInteger := Objeto.F_VENCIMIENTO.AsInteger - Objeto.F_INICIO.AsInteger;
            if Objeto.DIAS_PLAZO.AsInteger <= 0 then
            Begin
               vlMsg := 'Los días de Plazo no pueden ser menores o iguales a cero.';
               vlSalida := False;
            end
            else if Objeto.ContratoCre.Producto.B_RANGO_PLA_DISP.AsString = CVERDAD THEN
            Begin
              if ((Objeto.DIAS_PLAZO.AsInteger < Objeto.ContratoCre.Producto.PLAZO_MIN_CREDITO.AsInteger)or
                  (Objeto.DIAS_PLAZO.AsInteger > Objeto.ContratoCre.Producto.PLAZO_MAX_CREDITO.AsInteger)) then
              begin
                 VLMsg :=' El Plazo de la disposición no está dentro del rango del Plazo del Producto ' +
                         ' ( ' + Objeto.ContratoCre.Producto.PLAZO_MIN_CREDITO.AsString + ' - ' +
                                 Objeto.ContratoCre.Producto.PLAZO_MAX_CREDITO.AsString + ' ) ' ;
                 VLSalida := False;
              end;
            end;
         end;
      end;

      //filtrar por plazo las unidades de tiempo
      Objeto.UTiempoTasa.BuscaWhereString := 'CR_UNIDAD_TIEMPO.NUM_DIAS < ' + Objeto.DIAS_PLAZO.AsString;
      Objeto.UTiempoTasa.FilterString := Objeto.UTiempoTasa.BuscaWhereString;

      Objeto.UTiempoCap.BuscaWhereString := 'CR_UNIDAD_TIEMPO.NUM_DIAS < ' + Objeto.DIAS_PLAZO.AsString;
      Objeto.UTiempoCap.FilterString := Objeto.UTiempoCap.BuscaWhereString;

      Objeto.UTiempoInt.BuscaWhereString := 'CR_UNIDAD_TIEMPO.NUM_DIAS < ' + Objeto.DIAS_PLAZO.AsString;
      Objeto.UTiempoInt.FilterString := Objeto.UTiempoInt.BuscaWhereString;

      InterForma1.ValidaExit(edF_VENCIMIENTO,VLSalida,VlMsg,True);
   end;
end;

procedure TWCrCredito.edPCT_COMISIONExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
    vlImpComision : Double;
    vlImpPctIVA   : Double;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
   //Verifica que el dato no sea negativo
      Objeto.PCT_COMISION.GetFromControl;
      Objeto.ID_CREDITO.GetFromControl;
      Objeto.IMP_CREDITO.GetFromControl;
      if Objeto.PCT_COMISION.AsFloat <= 0 then
      Begin
         VLSalida := False;
         vlMsg := 'La comisión no puede ser menor o igual a cero';
      end;
      if vlSalida then
      begin
           Objeto.IMP_COMISION.AsFloat := GenComisDisp(Objeto.IMP_CREDITO.AsFloat, Objeto.PCT_COMISION.AsFloat,
                                                       Objeto.ID_CONTRATO.AsInteger,
                                                       Objeto.ID_CREDITO.AsInteger,
                                                       Objeto.Apli, vlSalida,vlMsg);
           Objeto.IMP_COMISION.DrawControl;
      end;

      InterForma1.ValidaExit(edPCT_COMISION,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrCredito.chB_APLICA_COMEnter(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      AplicaComision;
   //end if
end;

procedure TWCrCredito.chB_APLICA_COMClick(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      AplicaComision;
   //end if
end;

procedure TWCrCredito.chB_FINANC_ADICExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_FINANC_ADIC,True,'',True);
end;

procedure TWCrCredito.meTX_COMENTARIOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(meTX_COMENTARIO,True,'',True);
end;

procedure TWCrCredito.edID_CRED_EXTERNOExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
       InterForma1.ValidaExit(edID_CRED_EXTERNO,True,'',True);
   End;
end;

procedure TWCrCredito.cbNUM_UNIDADES_REExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edNUM_UNIDADES_RE,True,CNULL,True);
end;

procedure TWCrCredito.cbDIA_REVISIONExit(Sender: TObject);
var
    vlSalida  : Boolean;
    vlMsg     : String;
    VLMesPag  : String;
    VLYearPag : String;
    vlBandera : Boolean;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
     //<LOLS 15ENE2006. SE AGREGA VALIDACION PARA HACER OBLIGATORIO EL CAMPO SOLO EN TIPO DE CALCULO REVISABLE>
     vlBandera := ( Objeto.UNIDAD_TIEMPO_RE.AsString <> CNULL ) AND
                  ( Objeto.NUM_UNIDADES_RE.AsInteger  > 0 ) AND
                  ( ( Objeto.DIA_REVISION.AsInteger   > 0 ) AND ( Objeto.DIA_REVISION.AsInteger <= 31 ) );
     if ( Objeto.CVE_CALCULO.AsString = 'RE' ) or ( vlBandera ) then
     begin
       //
       Objeto.DIA_REVISION.GetFromControl;
       if ((Objeto.DIA_REVISION.AsInteger < 1) or (Objeto.DIA_REVISION.AsInteger > 31)) then
       begin
            vlSalida := False;
            vlMsg    := 'El día de revisión debe ser mayor a 0 y menor o igual a 31';
       end;
       if vlSalida then
       begin
            Objeto.F_PROX_REVISION.AsDateTime :=  Objeto.StpBusSigFecha(Objeto.F_INICIO.AsDateTime,
                                                                        Objeto.F_VENCIMIENTO.AsDateTime,
                                                                        Objeto.UNIDAD_TIEMPO_RE.AsString,
                                                                        Objeto.NUM_UNIDADES_RE.AsInteger,
                                                                        Objeto.DIA_REVISION.AsInteger);
       end;
       //
     end;
     //</LOLS>
   end;
   InterForma1.ValidaExit(cbDIA_REVISION,vlSalida,vlMsg,True);
end;

procedure TWCrCredito.edF_PROX_REVISIONExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
    VLDiaPago : String;
    VLMesPagS : String;
    VLMesPag  : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      //
      //<LOLS 15ENE2006. SE AGREGA VALIDACION PARA HACER OBLIGATORIO EL CAMPO SOLO EN TIPO DE CALCULO REVISABLE>
      if ( Objeto.CVE_CALCULO.AsString = 'RE' ) then
      begin
        Objeto.F_PROX_REVISION.GetFromControl;
        Objeto.F_INICIO.GetFromControl;
        Objeto.DIA_REVISION.GetFromControl;
        If Objeto.F_PROX_REVISION.AsString <> '' then
        Begin
           if Objeto.F_PROX_REVISION.AsDateTime <= Objeto.F_INICIO.AsDateTime then
           Begin
              vlMsg := ' La fecha próxima revisión no puede ser menor a la fecha de inicio';
              vlSalida := False;
           End;
           if ((Objeto.F_PROX_REVISION.AsDateTime > Objeto.F_VENCIMIENTO.AsDateTime ) and (vlSalida)) then
           Begin
              vlMsg := ' La fecha próxima revisión no puede ser mayor a la fecha de vencimiento';
              vlSalida := False;
           End;
           if ((ValidaFecha(Objeto.F_PROX_REVISION.AsDateTime,Objeto.Apli) <> 0) and (vlSalida)) then
           Begin
                if Not(MessageDlg('La fecha de revisión de Tasa es un día no hábil. ¿Desea Continuar?',
                   mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
                begin
                     vlMsg := ' La fecha de revisión de Tasa es un día no hábil';
                     vlSalida := False;
                end;
           End;
           DateTimeToString(VLDiaPago,'dd',Objeto.F_PROX_REVISION.AsDateTime);
           if ((Objeto.DIA_REVISION.AsInteger <> StrToInt(VLDiaPago)) and (vlSalida)) then
           begin
                DateTimeToString(VLMesPagS,'MM',Objeto.F_PROX_REVISION.AsDateTime + 1);
                DateTimeToString(VLMesPag,'MM',Objeto.F_PROX_REVISION.AsDateTime);
                if not((Objeto.DIA_REVISION.AsInteger = 31) and (StrToInt(VLMesPagS) > StrToInt(VLMesPag))) then
                begin
                    if Not(MessageDlg('La fecha de revisión de Tasa no coincide con el día de revisión de Tasa señalado. ¿Desea Continuar?',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
                    begin
                         vlMsg := ' La fecha de revisión de Tasa no coincide con el día de revisión de Tasa señalado';
                         vlSalida := False;
                    end;
                end;
           end;
        end
        else
        begin
             vlMsg := ' Debe indicar la fecha de revisión de Tasa';
             vlSalida := False;
        end;
        //
      end;
      //</LOLS>
      InterForma1.ValidaExit(edF_PROX_REVISION,VLSalida,VlMsg,True);
   end;
end;

procedure TWCrCredito.cbNUM_UNIDADES_CPExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edNUM_UNIDADES_CP,True,CNULL,True);
end;

procedure TWCrCredito.cbDIA_PAGO_CAPEnter(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.DIA_PAGO_CAP.GetFromControl;
      vgDiaPago := Objeto.DIA_PAGO_CAP.AsInteger;
   End;
end;

procedure TWCrCredito.cbDIA_PAGO_CAPExit(Sender: TObject);
var
    vlSalida : Boolean;
    vlMsg    : String;
    VLMesPag  : String;
    VLYearPag : String;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
     Objeto.DIA_PAGO_CAP.GetFromControl;
     if ((Objeto.DIA_PAGO_CAP.AsInteger < 1) or (Objeto.DIA_PAGO_CAP.AsInteger > 31)) then
     begin
          vlSalida := False;
          vlMsg    := 'El día de pago de capital debe ser mayor a 0 y menor o igual a 31';
     end;
     if vlSalida then
     begin
       //<LOLS 15 ENE 2005.GUARDA EL DIA DE PAGO QUE TIENE EL CONTROL PARA LLAMAR LA RUTINA DE ACTUALIZACION SOLO SI ESTE CAMBIA>
       if ( vgDiaPago <> Objeto.DIA_PAGO_CAP.AsInteger ) or
          ( Objeto.F_INI_PAG_CAP.AsString = ''         ) then
       //</LOLS>
          Objeto.F_INI_PAG_CAP.AsDateTime :=  Objeto.StpBusSigFecha(Objeto.F_INICIO.AsDateTime,
                                                                    Objeto.F_VENCIMIENTO.AsDateTime,
                                                                    Objeto.UNIDAD_TIEMPO_CP.AsString,
                                                                    Objeto.NUM_UNIDADES_CP.AsInteger,
                                                                    Objeto.DIA_PAGO_CAP.AsInteger,
                                                                    Objeto.ContratoCre.Producto.NUM_DMIN_REQ_PER.AsInteger,
                                                                    Objeto.ContratoCre.Producto.NUM_DIAS_AGR_PER.AsInteger
                                                                    ); // SATV4766
     end;
     If VLSalida Then ActualizaValoresPagoEquivalente; // SATV4766
     InterForma1.ValidaExit(cbDIA_PAGO_CAP,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrCredito.edF_INI_PAG_CAPExit(Sender: TObject);
var vlSalida  : Boolean;
    vlMsg     : String;
    VLDiaPago : String;
    VLMesPagS : String;
    VLMesPag  : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      VLDiaPago := '';
      vlSalida := True;
      Objeto.F_INI_PAG_CAP.GetFromControl;
      Objeto.F_INICIO.GetFromControl;
      Objeto.DIA_PAGO_CAP.GetFromControl;
      If Objeto.F_INI_PAG_CAP.AsString <> '' then
      Begin
         if Objeto.F_INI_PAG_CAP.AsDateTime < Objeto.F_INICIO.AsDateTime then
         Begin
            vlMsg := ' La fecha de primer pago de capital no puede ser menor a la fecha de inicio';
            vlSalida := False;
         End;
         if ((Objeto.F_INI_PAG_CAP.AsDateTime > Objeto.F_VENCIMIENTO.AsDateTime ) and (vlSalida)) then
         Begin
            vlMsg := ' La fecha de primer pago de capital no puede ser mayor a la fecha de vencimiento';
            vlSalida := False;
         End;
         if ((ValidaFecha(Objeto.F_INI_PAG_CAP.AsDateTime,Objeto.Apli) <> 0) and (vlSalida)) then
         Begin
              if Not(MessageDlg('La fecha de primer pago de capital es un día no hábil. ¿Desea Continuar?',
                 mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
              begin
                   vlMsg := ' La fecha de primer pago de capital es un día no hábil';
                   vlSalida := False;
              end;
         End;
         DateTimeToString(VLDiaPago,'dd',Objeto.F_INI_PAG_CAP.AsDateTime);
         if ((Objeto.DIA_PAGO_CAP.AsInteger <> StrToInt(VLDiaPago)) and (vlSalida)) then
         begin
              DateTimeToString(VLMesPagS,'MM',Objeto.F_INI_PAG_CAP.AsDateTime + 1);
              DateTimeToString(VLMesPag,'MM',Objeto.F_INI_PAG_CAP.AsDateTime);
              if not((Objeto.DIA_PAGO_CAP.AsInteger = 31) and (StrToInt(VLMesPagS) > StrToInt(VLMesPag))) then
              begin
                  if Not(MessageDlg('La fecha de primer pago de capital no coincide con el día de pago de capital señalado. ¿Desea Continuar?',
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
                  begin
                       vlMsg := ' La fecha de primer pago de capital no coincide con el día de pago de capital señalado';
                       vlSalida := False;
                  end;
              end;
         end;
      end
      else
      begin
           vlMsg := ' Debe indicar la fecha de primer pago de interés';
           vlSalida := False;
      end;
      If VLSalida Then ActualizaValoresPagoEquivalente; // SATV4766
      InterForma1.ValidaExit(edF_INI_PAG_CAP,VLSalida,VlMsg,True);
   end;
end;

procedure TWCrCredito.cbNUM_UNIDADES_INExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edNUM_UNIDADES_IN,True,CNULL,True);
end;


procedure TWCrCredito.cbDIA_PAGO_INTEnter(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.DIA_PAGO_INT.GetFromControl;
      vgDiaPago := Objeto.DIA_PAGO_INT.AsInteger;
   End;
end;

procedure TWCrCredito.cbDIA_PAGO_INTExit(Sender: TObject);
var
    vlSalida : Boolean;
    vlMsg    : String;
    VLMesPag  : String;
    VLYearPag : String;
begin
   vlSalida := True;
   vlMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
     Objeto.DIA_PAGO_INT.GetFromControl;
     if ((Objeto.DIA_PAGO_INT.AsInteger < 1) or (Objeto.DIA_PAGO_INT.AsInteger > 31)) then
     begin
          vlSalida := False;
          vlMsg    := 'El día de pago de interés debe ser mayor a 0 y menor o igual a 31';
     end;
     if vlSalida then
     begin
       //<LOLS 15 ENE 2005.GUARDA EL DIA DE PAGO QUE TIENE EL CONTROL PARA LLAMAR LA RUTINA DE ACTUALIZACION SOLO SI ESTE CAMBIA>
       if ( vgDiaPago <> Objeto.DIA_PAGO_INT.AsInteger ) or
          ( Objeto.F_INI_PAG_INT.AsString = ''         ) then
       // </LOLS>
          Objeto.F_INI_PAG_INT.AsDateTime :=  Objeto.StpBusSigFecha(Objeto.F_INICIO.AsDateTime,
                                                                    Objeto.F_VENCIMIENTO.AsDateTime,
                                                                    Objeto.UNIDAD_TIEMPO_IN.AsString,
                                                                    Objeto.NUM_UNIDADES_IN.AsInteger,
                                                                    Objeto.DIA_PAGO_INT.AsInteger,
                                                                    Objeto.ContratoCre.Producto.NUM_DMIN_REQ_PER.AsInteger,
                                                                    Objeto.ContratoCre.Producto.NUM_DIAS_AGR_PER.AsInteger ); // SATV4766
     end;
   end;
   InterForma1.ValidaExit(cbDIA_PAGO_INT,vlSalida,vlMsg,True);
end;

procedure TWCrCredito.edF_INI_PAG_INTExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
    VLDiaPago : String;
    VLMesPagS : String;
    VLMesPag  : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      VLDiaPago := '';
      vlSalida := True;
      Objeto.F_INI_PAG_INT.GetFromControl;
      Objeto.F_INICIO.GetFromControl;
      Objeto.DIA_PAGO_INT.GetFromControl;
      If Objeto.F_INI_PAG_INT.AsString <> '' then
      Begin
         if Objeto.F_INI_PAG_INT.AsDateTime < Objeto.F_INICIO.AsDateTime then
         Begin
            vlMsg := ' La fecha de primer pago de interés no puede ser menor a la fecha de inicio';
            vlSalida := False;
         End;
         if ((Objeto.F_INI_PAG_INT.AsDateTime > Objeto.F_VENCIMIENTO.AsDateTime ) and (vlSalida)) then
         Begin
            vlMsg := ' La fecha de primer pago de interés no puede ser mayor a la fecha de vencimiento';
            vlSalida := False;
         End;
         if ((ValidaFecha(Objeto.F_INI_PAG_INT.AsDateTime,Objeto.Apli) <> 0) and (vlSalida)) then
         Begin
              if Not(MessageDlg('La fecha de primer pago de interés es un día no hábil. ¿Desea Continuar?',
                 mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
              begin
                   vlMsg := ' La fecha de primer pago de interés es un día no hábil';
                   vlSalida := False;
              end;
         End;
         DateTimeToString(VLDiaPago,'dd',Objeto.F_INI_PAG_INT.AsDateTime);
         if ((Objeto.DIA_PAGO_INT.AsInteger <> StrToInt(VLDiaPago)) and (vlSalida)) then
         begin
              DateTimeToString(VLMesPagS,'MM',Objeto.F_INI_PAG_INT.AsDateTime + 1);
              DateTimeToString(VLMesPag,'MM',Objeto.F_INI_PAG_INT.AsDateTime);
              if not((Objeto.DIA_PAGO_INT.AsInteger = 31) and (StrToInt(VLMesPagS) > StrToInt(VLMesPag))) then
              begin
                  if Not(MessageDlg('La fecha de primer pago de interés no coincide con el día de pago de interés señalado. ¿Desea Continuar?',
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
                  begin
                       vlMsg := ' La fecha de primer pago de interés no coincide con el día de pago de interés señalado';
                       vlSalida := False;
                  end;
              end;
         end;
      end
      else
      begin
           vlMsg := ' Debe indicar la fecha de primer pago de interés';
           vlSalida := False;
      end;
      InterForma1.ValidaExit(edF_INI_PAG_INT,vlSalida,vlMsg,True);
   end;
end;
{
function TWCrCredito.FindComis: Boolean;
var vlCount : Integer;
begin
   Result := False;
   GetSQLInt('SELECT COUNT(*) Count FROM CR_COMIS_PROG WHERE ID_CREDITO   = ' +
              Objeto.ID_CREDITO.AsString +' AND CVE_COMISION = ''CUFEGA''',
              Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,'Count',vlCount, False);
   if vlCount = 0 then
      if MessageDlg('¿ Desea Generar Cuota Fega ? ',
               mtConfirmation, [mbYes, mbNo], 0) = mrYes then Begin
          ShowMessage('Favor de Adicionar la clave de comsión del Costo FEGA en la parte de Comisiones ');
          Result := False;
      end
      else Result := True
   else Result := True;
end;
}
procedure TWCrCredito.edNUM_UNIDADES_REExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      //<LOLS 15ENE2006. SE AGREGA VALIDACION PARA HACER OBLIGATORIO EL CAMPO SOLO EN TIPO DE CALCULO REVISABLE>
      if Objeto.CVE_CALCULO.AsString = 'RE' then
      begin
        //
        //Verifica que el dato no sea negativo
        Objeto.NUM_UNIDADES_RE.GetFromControl;
        if Objeto.NUM_UNIDADES_RE.AsInteger <= 0 then
        Begin
           VLSalida := False;
           vlMsg := 'El número de unidades debe de ser Mayor o igual a 1';
        end
        else if not (ValNumUnidades(Objeto.NUM_UNIDADES_RE.AsInteger, Objeto.UTiempoTasa.NUM_DIAS.AsInteger,
                                    Objeto.DIAS_PLAZO.AsInteger,vlMsg) ) then
             VLSalida := False;
        //
      end;
      //</LOLS>
      InterForma1.ValidaExit(edNUM_UNIDADES_RE,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrCredito.edNUM_UNIDADES_CPExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      //Verifica que el dato no sea negativo
      Objeto.NUM_UNIDADES_CP.GetFromControl;
      if Objeto.NUM_UNIDADES_CP.AsInteger <= 0 then
      Begin
         VLSalida := False;
         vlMsg := 'El número de unidades debe de ser Mayor o igual a 1';
      end
      else if not (ValNumUnidades(Objeto.NUM_UNIDADES_CP.AsInteger,Objeto.UTiempoCap.NUM_DIAS.AsInteger,
                                  Objeto.DIAS_PLAZO.AsInteger,vlMsg) ) then
           VLSalida := False;
      If VLSalida Then ActualizaValoresPagoEquivalente; // SATV4766
      InterForma1.ValidaExit(edNUM_UNIDADES_CP,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrCredito.edNUM_UNIDADES_INExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      //Verifica que el dato no sea negativo
      Objeto.NUM_UNIDADES_IN.GetFromControl;
      if Objeto.NUM_UNIDADES_IN.AsInteger <= 0 then
      Begin
         VLSalida := False;
         vlMsg := 'El número de unidades debe de ser Mayor o igual a 1';
      end
      else if not (ValNumUnidades(Objeto.NUM_UNIDADES_IN.AsInteger, Objeto.UTiempoInt.NUM_DIAS.AsInteger,
                                  Objeto.DIAS_PLAZO.AsInteger,vlMsg) ) then
           VLSalida := False;
      InterForma1.ValidaExit(edNUM_UNIDADES_IN,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrCredito.edID_CONTROL_EXTExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edID_CONTROL_EXT,True,'',True);
end;

procedure TWCrCredito.bbUNIDAD_TIEMPO_REClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCREDITO_UTPRV',True,True) then
   begin
     Objeto.UTiempoTasa.ShowAll := True;
     if Objeto.UTiempoTasa.Busca then
     begin
          Objeto.UNIDAD_TIEMPO_RE.AsString := Objeto.UTiempoTasa.CVE_UNIDAD_TIEMP.AsString;
          InterForma1.NextTab(bbUNIDAD_TIEMPO_RE);
     end;
   end;
end;

procedure TWCrCredito.bbUNIDAD_TIEMPO_CPClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCREDITO_UTPAM',True,True) then
   begin
     Objeto.UTiempoCap.ShowAll := True;
     if Objeto.UTiempoCap.Busca then
     begin
          Objeto.UNIDAD_TIEMPO_CP.AsString := Objeto.UTiempoCap.CVE_UNIDAD_TIEMP.AsString;
          InterForma1.NextTab(bbUNIDAD_TIEMPO_CP);
     end;
   end;
end;

procedure TWCrCredito.bbUNIDAD_TIEMPO_INClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCREDITO_UTPIN',True,True) then
   begin
     Objeto.UTiempoInt.ShowAll := True;
     if Objeto.UTiempoInt.Busca then
     begin
          Objeto.UNIDAD_TIEMPO_IN.AsString := Objeto.UTiempoInt.CVE_UNIDAD_TIEMP.AsString;
          InterForma1.NextTab(bbUNIDAD_TIEMPO_IN);
     end;
   end;
end;

procedure TWCrCredito.bbUNIDAD_TIEMPO_REExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlSalida := True;
     vlMsg := CNULL;
     //<LOLS 15ENE2006. SE AGREGA VALIDACION PARA HACER OBLIGATORIO EL CAMPO SOLO EN TIPO DE CALCULO REVISABLE>
     if Objeto.CVE_CALCULO.AsString = 'RE' then
     begin
       Objeto.UNIDAD_TIEMPO_RE.GetFromControl;
       Objeto.DIAS_PLAZO.GetFromControl;
       if Objeto.UNIDAD_TIEMPO_RE.AsString = CNULL then
       Begin
          vlSalida := False;
          vlMsg := 'Favor de Indicar La unidad de tiempo para la revisión de Tasa';
       end
       else if NOT ( ValUnidadTiemp(Objeto.UNIDAD_TIEMPO_RE.AsString,Objeto.DIAS_PLAZO.AsInteger,vlMsg)) then
       Begin
          vlSalida := False;
       end;
     end;
     //</LOLS>

     //HERJA
     cbDIA_REVISION.Text:='';
     edF_PROX_REVISION.Text:='';
     Objeto.DIA_REVISION.GetFromControl;
     Objeto.F_PROX_REVISION.GetFromControl;
   end;
   InterForma1.ValidaExit(bbUNIDAD_TIEMPO_RE,vlSalida,vlMsg,True);
end;

procedure TWCrCredito.bbUNIDAD_TIEMPO_CPExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlSalida := True;
     vlMsg := CNULL;
     Objeto.UNIDAD_TIEMPO_CP.GetFromControl;
     if Objeto.UNIDAD_TIEMPO_CP.AsString = CNULL then
     Begin
        vlSalida := False;
        vlMsg := 'Favor de Indicar el tipo de Amortización';
     end
     else if NOT ( ValUnidadTiemp(Objeto.UNIDAD_TIEMPO_CP.AsString,Objeto.DIAS_PLAZO.AsInteger,vlMsg)) then
     Begin
        vlSalida := False;
     end;

     //HERJA
     cbDIA_PAGO_CAP.Text:='';
     edF_INI_PAG_CAP.Text:='';
     Objeto.DIA_PAGO_CAP.GetFromControl;
     Objeto.F_INI_PAG_CAP.GetFromControl;
   end;
   InterForma1.ValidaExit(bbUNIDAD_TIEMPO_CP,vlSalida,vlMsg,True);
end;

procedure TWCrCredito.bbUNIDAD_TIEMPO_INExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlSalida := True;
     vlMsg := CNULL;
     Objeto.UNIDAD_TIEMPO_IN.GetFromControl;
     if Objeto.UNIDAD_TIEMPO_IN.AsString = CNULL then
     Begin
        vlSalida := False;
        vlMsg := 'Favor de Indicar el tipo de pago de Interés';
     end
     else if NOT ( ValUnidadTiemp(Objeto.UNIDAD_TIEMPO_IN.AsString,Objeto.DIAS_PLAZO.AsInteger,vlMsg)) then
     Begin
        vlSalida := False;
     end;

     //HERJA
     cbDIA_PAGO_INT.Text:='';
     edF_INI_PAG_INT.Text:='';
     Objeto.DIA_PAGO_INT.GetFromControl;
     Objeto.F_INI_PAG_INT.GetFromControl; 
   end;
   InterForma1.ValidaExit(bbUNIDAD_TIEMPO_IN,vlSalida,vlMsg,True);
end;

procedure TWCrCredito.cbDIA_REVISIONKeyPress(Sender: TObject;  var Key: Char);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     if Not((key=Char(48)) or (key=Char(49)) or (key=Char(50)) or (key=Char(51)) or (key=Char(52)) or (key=Char(53))
     or (key=Char(54)) or (key=Char(55)) or (key=Char(56)) or (key=Char(57)) or (key=Char(8)) or (key=Char(13)))  then
     begin
          Key:=Char(0);
          InterForma1.ShowMsgPanel('Solo se permiten números ( 1 - 31 )');
     end;
   end;
end;

procedure TWCrCredito.cbOPERADOR_STASAKeyPress(Sender: TObject;  var Key: Char);
begin
     if Not((key=Char(42)) or (key=Char(43)) or (key=Char(45)) or (key=Char(47)) or (key=Char(8)) or (key=Char(13)))  then
     begin
          Key:=Char(0);
          InterForma1.ShowMsgPanel('Solo se permiten + , - , / , * ');
     end;
end;

//ligas a pantallas
procedure TWCrCredito.ConsultaSectorPersona1Click(Sender: TObject);
Var Acreditado : TCrAcredit;
begin
      Acreditado := TCrAcredit.Create(Self);
      try
        Acreditado.GetParams(Objeto);
        Acreditado.ParamCre:=Objeto.ParamCre;
        Acreditado.FindKey([Objeto.ContratoCre.Contrato.ID_Titular.AsString]);
        Acreditado.Catalogo;
      finally
             Acreditado.Free;
             Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
             Objeto.ContratoCre.ObtenDisponibleAcred(Objeto.ContratoCre.Contrato.ID_Titular.AsString);
             Objeto.ContratoCre.ObtenDisponibleGpo(Objeto.ContratoCre.Acreditado.CVE_GRUPO_ECO.AsString);
      end;
end;

procedure TWCrCredito.CatlogodePersona1Click(Sender: TObject);
var  Persona : TPersona;
begin
      Persona := TPersona.Create(Self);
      try
        Persona.GetParams(Objeto);
        Persona.FindKey([Objeto.ContratoCre.Contrato.ID_Titular.AsString]);
        Persona.Catalogo;
      finally
             Persona.Free;
             Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
      end;
end;

procedure TWCrCredito.AcessoaProductoClick(Sender: TObject);
var  Producto : TCrProduct;
begin
      Producto := TCrProduct.Create(Self);
      try
        Producto.GetParams(Objeto);
        Producto.ParamCre:=Objeto.ParamCre;
        Producto.BuscaWhereString := ' CR_PRODUCTO.CVE_PRODUCTO_CRE IN ( '+
                                     ' SELECT CVE_PRODUCTO FROM CR_PERF_PROD_USU WHERE ' +
                                     ' CVE_GPO_ACCESO = ' + IntToStr(Objeto.Apli.CvePerfil)+ ' )';
        Producto.FilterString := Producto.BuscaWhereString ;
        Producto.FindKey([Objeto.ContratoCre.Producto.CVE_PRODUCTO_CRE.AsString]);
        Producto.Catalogo;
      finally
             Producto.Free;
             Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
      end;
end;

procedure TWCrCredito.Autorizaciones1Click(Sender: TObject);
var   VLContratoCre        : TCrCto; //Contrato Crédito
begin
      VLContratoCre := TCrCto.Create(Self);
      try
          VLContratoCre.GetParams(Objeto);
          VLContratoCre.ParamCre := Objeto.ParamCre;
          VLContratoCre.FindKey([Objeto.ID_CONTRATO.AsString,'1']);
          VLContratoCre.Acreditado.FindKey([Objeto.ContratoCre.Contrato.ID_Titular.AsString]);
          VLContratoCre.Catalogo;
      finally
             VLContratoCre.Free;
      end;
      Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
      Objeto.ContratoCre.ObtenDisponibleAut(Objeto.ContratoCre.ID_CONTRATO.AsString,Objeto.ContratoCre.FOL_CONTRATO.AsString);
end;


procedure TWCrCredito.InterForma1DespuesShow(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
//Filtra solo los productos configurados para el usuario
      edVALOR_TASA.Text := '0';
      Objeto.BuscaWhereString := ' CR_CREDITO.ID_CONTRATO IN ( SELECT ID_CONTRATO FROM CR_CONTRATO WHERE ' +
                                 ' CVE_PRODUCTO_CRE IN ( SELECT CVE_PRODUCTO FROM CR_PERF_PROD_USU WHERE ' +
                                 ' CVE_GPO_ACCESO = ' + IntToStr(Objeto.Apli.CvePerfil)+ ' ) ) ' +
                                 ' AND PKGCRACTUALIZA.STPOBTEMPCTTO(CR_CREDITO.ID_CONTRATO)= ' + // LOLS 07 SEP 2005
                                 IntToStr(Objeto.Apli.IdEmpresa);                                 // LOLS 07 SEP 2005
      Objeto.FilterString := Objeto.BuscaWhereString ;

      Objeto.ContratoCre.BuscaWhereString := ' CR_CONTRATO.CVE_PRODUCTO_CRE IN ( '+
                                             ' SELECT CVE_PRODUCTO FROM CR_PERF_PROD_USU WHERE ' +
                                             ' CVE_GPO_ACCESO = ' + IntToStr(Objeto.Apli.CvePerfil)+ ' )' +
                                             ' AND PKGCRACTUALIZA.STPOBTEMPCTTO(CR_CONTRATO.ID_CONTRATO)= ' + // LOLS 07 SEP 2005
                                             IntToStr(Objeto.Apli.IdEmpresa);                                 // LOLS 07 SEP 2005
                                             ;
      Objeto.ContratoCre.FilterString := Objeto.ContratoCre.BuscaWhereString ;

      IF Objeto.ID_CREDITO.AsString <> CNULL then
      Begin
        ValidaUsuario;
        DeshabilitaBotonesXSit;
        Objeto.ContratoCre.ObtenDisponibleAcred(Objeto.ContratoCre.Contrato.ID_Titular.AsString);  // SELECT PKGCRSALDOS.StpObtDisponibleAcre
        Objeto.ContratoCre.ObtenDisponibleGpo(Objeto.ContratoCre.Acreditado.CVE_GRUPO_ECO.AsString); // SELECT PKGCRSALDOS.StpObtDisponibleGpo
        Objeto.IMP_COMISION.AsFloat := GenComisDisp(Objeto.IMP_CREDITO.AsFloat, Objeto.PCT_COMISION.AsFloat,  {en IntGenCre : aqui se generan las comisiones verificar que comision se aplicará por la operación L-C}
                                                    Objeto.ID_CONTRATO.AsInteger,
                                                    Objeto.ID_CREDITO.AsInteger,
                                                    Objeto.Apli, vlSalida,vlMsg);
        Objeto.MFiraOpe.MFiraOpe.FindKey([Objeto.CVE_OPERATIVA.AsString]);
        Objeto.ContratoCre.ObtenDisponibleAut(Objeto.ContratoCre.ID_CONTRATO.AsString,Objeto.ContratoCre.FOL_CONTRATO.AsString); // SELECT PKGCRSALDOS.STPOBTDISPONIBLEAUT ( 330019452,1) DISPONIBLE_AUT FROM DUAL y SELECT PKGCRSALDOS.STPOBTDISPUESTOAUT( 330019452,1) DISPUESTO_AUT FROM DUAL
        IF ( Objeto.CVE_TASA_REFER.AsString <> CNULL ) AND
           ( Objeto.CVE_TASA_REFER.AsString <> C_TASA_FIJA )  THEN
           edVALOR_TASA.Text := ValorTasa(Objeto.CVE_TASA_REFER.AsString)
        else
        Begin
           if Objeto.OPERADOR_STASA.AsString = '+' then
              edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat - Objeto.SOBRETASA.AsFloat )
           else if Objeto.OPERADOR_STASA.AsString = '-' then
              edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat + Objeto.SOBRETASA.AsFloat )
           else if Objeto.OPERADOR_STASA.AsString = '*' then
              edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat / Objeto.SOBRETASA.AsFloat )
           else if Objeto.OPERADOR_STASA.AsString = '/' then
              edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat * Objeto.SOBRETASA.AsFloat )
           else
              edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat - Objeto.SOBRETASA.AsFloat );
        end;

        // RABA OCT 2014 ACTUALIZACION B6
        if (Objeto.SIT_CREDITO.AsString = CSIT_NA) OR
           (Objeto.SIT_CREDITO.AsString = CSIT_NP) OR
           (Objeto.SIT_CREDITO.AsString = CSIT_RE) THEN
           if HayVencidos(Objeto.ID_CRE_RENOVADO.AsString) then
              edTIPO_CARTERA.Text := 'VENCIDO'
           else
              edTIPO_CARTERA.Text := 'VIGENTE';
        // fin RABA
      end;

      MuestraValidaRSRE;      
end;

procedure TWCrCredito.btCVE_OPERATIVAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCREDITO_OPRTV',True,True) then
   begin
       Objeto.MFiraOpe.ShowAll := True;
       If Objeto.MFiraOpe.Busca Then
       Begin
          Objeto.CVE_OPERATIVA.AsString := Objeto.MFiraOpe.CVE_OPERATIVA.AsString;
          InterForma1.NextTab(btCVE_OPERATIVA);
       End;
   end;
end;

procedure TWCrCredito.InterForma1DespuesCancelar(Sender: TObject);
var qyQuery : TQuery;
    sSQL    : String;
begin
   if Objeto.VGFOL_GRUPO_RENUEVA <> 0 then Begin
      if FindCredOrigen THEN
         Objeto.StpRespaldaDisp(Objeto.ID_CREDITO.AsInteger,'D');
      //END
   end;

   Objeto.MFiraOpe.MFiraOpe.FindKey([Objeto.CVE_OPERATIVA.AsString]);
   DeshabilitaBotonesXSit;
   ValidaUsuario; //EASA4011    26 ABRIL CORRECCION
   DatosAdicionalesaTasas1.Enabled := True;

   lb_Credescto.Visible:=false;
   sSQL:= 'SELECT SIT_CREDITO FROM CR_FND_CREDITO '+
          ' WHERE ID_CREDITO ='+ Objeto.ID_CREDITO.AsSQL +
          '   AND SIT_CREDITO IN (''AC'',''NA'')';

   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then
   begin
     lb_Credescto.Visible:=true;
     qyQuery.Close;
   End;
end;

procedure TWCrCredito.ValorTasaCred;
var vlTasa : Boolean;
begin
   vlTasa := True;
   IF not( InterForma1.IsNewData ) AND ( Objeto.CVE_TASA_REFER.AsString = C_TASA_FIJA )THEN
      vlTasa := False;
   //end if;

   if vlTasa then BEGIN
     if Objeto.OPERADOR_STASA.AsString = '+' then
        Objeto.TASA_CREDITO.AsFloat := StrToFloat(edVALOR_TASA.Text) + Objeto.SOBRETASA.AsFloat
     else if Objeto.OPERADOR_STASA.AsString = '-' then
        Objeto.TASA_CREDITO.AsFloat := StrToFloat(edVALOR_TASA.Text) - Objeto.SOBRETASA.AsFloat
     else if Objeto.OPERADOR_STASA.AsString = '*' then
        Objeto.TASA_CREDITO.AsFloat := StrToFloat(edVALOR_TASA.Text) * Objeto.SOBRETASA.AsFloat
     else if Objeto.OPERADOR_STASA.AsString = '/' then
        Objeto.TASA_CREDITO.AsFloat := StrToFloat(edVALOR_TASA.Text) / Objeto.SOBRETASA.AsFloat
     else
        Objeto.TASA_CREDITO.AsFloat := StrToFloat(edVALOR_TASA.Text) + Objeto.SOBRETASA.AsFloat;
   END;
end;

procedure TWCrCredito.AjustaControles(PPTipoMovto : String; PPTipoEvento : String);
  Procedure ActivAllControls;
  Begin
       edCVE_LIQUIDACION.Tag := 18;     edCVE_LIQUIDACION.TabStop := True;      edCVE_LIQUIDACION.HelpContext := 2001;  edCVE_LIQUIDACION.ReadOnly := False;
       btTIPO_LIQ.Tag := 18;            btTIPO_LIQ.TabStop := True;             btTIPO_LIQ.HelpContext := 2002;
       edIMP_CREDITO.Tag := 18;         edIMP_CREDITO.TabStop := True;          edIMP_CREDITO.HelpContext := 4401;      edIMP_CREDITO.ReadOnly := False;

       edF_INICIO.Tag := 18;            edF_INICIO.TabStop := True;             edF_INICIO.HelpContext := 4001;         edF_INICIO.ReadOnly := False;
       dtpF_INICIO.Tag := 18;           dtpF_INICIO.TabStop := True;            dtpF_INICIO.HelpContext := 4002;
//       edF_INICIO.Tag := 0;            edF_INICIO.TabStop := False;             edF_INICIO.HelpContext := 0;         edF_INICIO.ReadOnly := True;
//       dtpF_INICIO.Tag := 0;           dtpF_INICIO.TabStop := False;            dtpF_INICIO.HelpContext := 0;

       edDIAS_PLAZO.Tag := 18;          edDIAS_PLAZO.TabStop := True;           edDIAS_PLAZO.HelpContext := 4101;       edDIAS_PLAZO.ReadOnly := False;
       btDIASPLAZO.Tag := 18;           btDIASPLAZO.TabStop := True;            btDIASPLAZO.HelpContext := 4102;

       edF_VENCIMIENTO.Tag := 18;       edF_VENCIMIENTO.TabStop := True;        edF_VENCIMIENTO.HelpContext := 4201;    edF_VENCIMIENTO.ReadOnly := False;
       dtpF_VENCIMIENTO.Tag := 18;      dtpF_VENCIMIENTO.TabStop := True;       dtpF_VENCIMIENTO.HelpContext := 4202;
//       edF_VENCIMIENTO.Tag := 0;       edF_VENCIMIENTO.TabStop := False;        edF_VENCIMIENTO.HelpContext := 0;    edF_VENCIMIENTO.ReadOnly :=True;
//       dtpF_VENCIMIENTO.Tag := 0;      dtpF_VENCIMIENTO.TabStop := False;       dtpF_VENCIMIENTO.HelpContext := 0;

       chB_APLICA_COM.Tag := 18;        chB_APLICA_COM.TabStop := True;         chB_APLICA_COM.HelpContext := 5301;
       edPCT_COMISION.Tag := 18;        edPCT_COMISION.TabStop := True;         edPCT_COMISION.HelpContext := 5401;     edPCT_COMISION.ReadOnly := False;
       btCVE_OPERATIVA.Tag := 18;       btCVE_OPERATIVA.TabStop := True;        btCVE_OPERATIVA.HelpContext := 5501;
       meTX_COMENTARIO.Tag := 18;       meTX_COMENTARIO.TabStop := True;        meTX_COMENTARIO.HelpContext := 5601;    meTX_COMENTARIO.ReadOnly := False;
       edCVE_CALCULO.Tag := 18;         edCVE_CALCULO.TabStop := True;          edCVE_CALCULO.HelpContext := 6001;      edCVE_CALCULO.ReadOnly := False;
       btCALC_INT.Tag := 18;            btCALC_INT.TabStop := True;             btCALC_INT.HelpContext := 6002;
       edFACT_MORAS.Tag := 18;          edFACT_MORAS.TabStop := True;           edFACT_MORAS.HelpContext := 6101;       edFACT_MORAS.ReadOnly := False;
       edCVE_TASA_REFER.Tag := 18;      edCVE_TASA_REFER.TabStop := True;       edCVE_TASA_REFER.HelpContext := 6201;   edCVE_TASA_REFER.ReadOnly := False;
       btTASA_REFER.Tag := 18;          btTASA_REFER.TabStop := True;           btTASA_REFER.HelpContext := 6202;
       cbTIPO_TASA.Tag :=18;            cbTIPO_TASA.TabStop :=True;             cbTIPO_TASA.HelpContext :=6301;
       cbOPERADOR_STASA.Tag := 18;      cbOPERADOR_STASA.TabStop := True;       cbOPERADOR_STASA.HelpContext := 6401;   cbOPERADOR_STASA.ReadOnly := False;
       edSOBRETASA.Tag := 18;           edSOBRETASA.TabStop := True;            edSOBRETASA.HelpContext := 6501;        edSOBRETASA.ReadOnly := False;
       edTASA_CREDITO.Tag := 18;        edTASA_CREDITO.TabStop := True;         edTASA_CREDITO.HelpContext := 6601;     edTASA_CREDITO.ReadOnly := False;
       bbUNIDAD_TIEMPO_RE.Tag := 18;    bbUNIDAD_TIEMPO_RE.TabStop := True;     bbUNIDAD_TIEMPO_RE.HelpContext := 6701;
       cbDIA_REVISION.Tag := 18;        cbDIA_REVISION.TabStop := True;         cbDIA_REVISION.HelpContext := 0;        cbDIA_REVISION.ReadOnly := False;
       edNUM_UNIDADES_RE.Tag := 18;     edNUM_UNIDADES_RE.TabStop := True;      edNUM_UNIDADES_RE.HelpContext := 6801;  edNUM_UNIDADES_RE.ReadOnly := False;
       cbDIA_REVISION.Tag := 18;        cbDIA_REVISION.TabStop := True;         cbDIA_REVISION.HelpContext := 6901;     cbDIA_REVISION.ReadOnly := False;

       edF_PROX_REVISION.Tag := 18;     edF_PROX_REVISION.TabStop := True;      edF_PROX_REVISION.HelpContext := 7001;  edF_PROX_REVISION.ReadOnly := False;
       dtpF_PROX_REVISION.Tag := 18;    dtpF_PROX_REVISION.TabStop := True;     dtpF_PROX_REVISION.HelpContext := 7002;
//       edF_PROX_REVISION.Tag := 0;     edF_PROX_REVISION.TabStop := False;      edF_PROX_REVISION.HelpContext := 0;  edF_PROX_REVISION.ReadOnly := True;
//       dtpF_PROX_REVISION.Tag := 0;    dtpF_PROX_REVISION.TabStop := False;     dtpF_PROX_REVISION.HelpContext := 0;

       edCVE_AMORTIZACION.Tag := 18;    edCVE_AMORTIZACION.TabStop := True;     edCVE_AMORTIZACION.HelpContext := 7101; edCVE_AMORTIZACION.ReadOnly := False;
       btTIPO_AMORT.Tag := 18;          btTIPO_AMORT.TabStop := True;           btTIPO_AMORT.HelpContext := 7102;
       bbUNIDAD_TIEMPO_CP.Tag := 18;    bbUNIDAD_TIEMPO_CP.TabStop := True;     bbUNIDAD_TIEMPO_CP.HelpContext := 7201;
       edNUM_UNIDADES_CP.Tag := 18;     edNUM_UNIDADES_CP.TabStop := True;      edNUM_UNIDADES_CP.HelpContext := 7301;  edNUM_UNIDADES_CP.ReadOnly := False;
       cbDIA_PAGO_CAP.Tag := 18;        cbDIA_PAGO_CAP.TabStop := True;         cbDIA_PAGO_CAP.HelpContext := 7401;     cbDIA_PAGO_CAP.ReadOnly := False;

       edF_INI_PAG_CAP.Tag := 18;       edF_INI_PAG_CAP.TabStop := True;        edF_INI_PAG_CAP.HelpContext := 7501;    edF_INI_PAG_CAP.ReadOnly := False;
       dtpF_INI_PAG_CAP.Tag := 18;      dtpF_INI_PAG_CAP.TabStop := True;       dtpF_INI_PAG_CAP.HelpContext := 7502;
//       edF_INI_PAG_CAP.Tag := 0;       edF_INI_PAG_CAP.TabStop := False;        edF_INI_PAG_CAP.HelpContext := 0;    edF_INI_PAG_CAP.ReadOnly := True;
//       dtpF_INI_PAG_CAP.Tag := 0;      dtpF_INI_PAG_CAP.TabStop := False;       dtpF_INI_PAG_CAP.HelpContext := 0;

       edCVE_PAG_INTERES.Tag := 18;     edCVE_PAG_INTERES.TabStop := True;      edCVE_PAG_INTERES.HelpContext := 8001;  edCVE_PAG_INTERES.ReadOnly := False;
       btPAGO_INT.Tag := 18;            btPAGO_INT.TabStop := True;             btPAGO_INT.HelpContext := 8002;
       bbUNIDAD_TIEMPO_IN.Tag := 18;    bbUNIDAD_TIEMPO_IN.TabStop := True;     bbUNIDAD_TIEMPO_IN.HelpContext := 8101;
       edNUM_UNIDADES_IN.Tag := 18;     edNUM_UNIDADES_IN.TabStop := True;      edNUM_UNIDADES_IN.HelpContext := 8201;  edNUM_UNIDADES_IN.ReadOnly := False;
       cbDIA_PAGO_INT.Tag := 18;        cbDIA_PAGO_INT.TabStop := True;         cbDIA_PAGO_INT.HelpContext := 8301;     cbDIA_PAGO_INT.ReadOnly := False;

       edF_INI_PAG_INT.Tag := 18;       edF_INI_PAG_INT.TabStop := True;        edF_INI_PAG_INT.HelpContext := 8401;    edF_INI_PAG_INT.ReadOnly := False;
       dtpF_INI_PAG_INT.Tag := 18;      dtpF_INI_PAG_INT.TabStop := True;       dtpF_INI_PAG_INT.HelpContext := 8402;
//       edF_INI_PAG_INT.Tag := 0;       edF_INI_PAG_INT.TabStop := False;        edF_INI_PAG_INT.HelpContext := 0;    edF_INI_PAG_INT.ReadOnly := True;
//       dtpF_INI_PAG_INT.Tag := 0;      dtpF_INI_PAG_INT.TabStop := False;       dtpF_INI_PAG_INT.HelpContext := 0;

       chB_APLICA_IVA.Tag := 18;        chB_APLICA_IVA.TabStop := True;         chB_APLICA_IVA.HelpContext := 5000;
       chB_FINANC_ADIC.Tag := 18;       chB_FINANC_ADIC.TabStop := True;        chB_FINANC_ADIC.HelpContext := 5050;

// --- ASOR --- ABRIL 2016 -- NUEVO CAMPO --
       EdF_FIN_PERGRA_FA.Tag  := 18;        EdF_FIN_PERGRA_FA.TabStop  := True;         EdF_FIN_PERGRA_FA.HelpContext  := 5051;        EdF_FIN_PERGRA_FA.ReadOnly:=False;
       DtpF_FIN_PERGRA_FA.Tag := 18;        DtpF_FIN_PERGRA_FA.TabStop := True;         DtpF_FIN_PERGRA_FA.HelpContext := 5052;
// -- FIN ---

       // <EASA 15 DIC 2005 deshabilita modificación del promotor administrador por la contabilidad por Centro de Costos>
//       edID_PROM_ADM.Tag := 18;          edID_PROM_ADM.TabStop := True;         edID_PROM_ADM.HelpContext := 3001;           edID_PROM_ADM.ReadOnly := False;
//       btPROM_ADM.Tag := 18;             btPROM_ADM.TabStop := True;            btPROM_ADM.HelpContext := 3002;
      // </EASA>
// RABA ABR 2013 nuevo campo
       cbCVE_CALIDAD_GTIA.Tag :=18;     cbCVE_CALIDAD_GTIA.TabStop :=True;      cbCVE_CALIDAD_GTIA.HelpContext :=8701;
// FIN RABA
// --- ASOR --- MARZO 2016 -- NUEVO CAMPO --
       chB_INT_DIASIG.Tag := 18;        chB_INT_DIASIG.TabStop := True;         chB_INT_DIASIG.HelpContext := 8702;
// --- FIN ---
  end;

  Procedure DesActivControls;
  Begin
       edCVE_LIQUIDACION.Tag := 0;      edCVE_LIQUIDACION.TabStop := False;     edCVE_LIQUIDACION.HelpContext := 0;     edCVE_LIQUIDACION.ReadOnly := True;
       btTIPO_LIQ.Tag := 0;             btTIPO_LIQ.TabStop := False;            btTIPO_LIQ.HelpContext := 0;
       edIMP_CREDITO.Tag := 0;          edIMP_CREDITO.TabStop := False;         edIMP_CREDITO.HelpContext := 0;         edIMP_CREDITO.ReadOnly := True;
       edF_INICIO.Tag := 0;             edF_INICIO.TabStop := False;            edF_INICIO.HelpContext := 0;            edF_INICIO.ReadOnly := True;
       dtpF_INICIO.Tag := 0;            dtpF_INICIO.TabStop := False;           dtpF_INICIO.HelpContext := 0;
       edDIAS_PLAZO.Tag := 0;           edDIAS_PLAZO.TabStop := False;          edDIAS_PLAZO.HelpContext := 0;          edDIAS_PLAZO.ReadOnly := True;
       btDIASPLAZO.Tag := 0;            btDIASPLAZO.TabStop := False;           btDIASPLAZO.HelpContext := 0;
       edF_VENCIMIENTO.Tag := 0;        edF_VENCIMIENTO.TabStop := False;       edF_VENCIMIENTO.HelpContext := 0;       edF_VENCIMIENTO.ReadOnly := True;
       dtpF_VENCIMIENTO.Tag := 0;       dtpF_VENCIMIENTO.TabStop := False;      dtpF_VENCIMIENTO.HelpContext := 0;
       chB_APLICA_COM.Tag := 0;         chB_APLICA_COM.TabStop := False;        chB_APLICA_COM.HelpContext := 0;
       edPCT_COMISION.Tag := 0;         edPCT_COMISION.TabStop := False;        edPCT_COMISION.HelpContext := 0;        edPCT_COMISION.ReadOnly := True;
       btCVE_OPERATIVA.Tag := 0;        btCVE_OPERATIVA.TabStop := False;       btCVE_OPERATIVA.HelpContext := 0;
       meTX_COMENTARIO.Tag := 0;        meTX_COMENTARIO.TabStop := False;       meTX_COMENTARIO.HelpContext := 0;       meTX_COMENTARIO.ReadOnly := True;
       edCVE_CALCULO.Tag := 0;          edCVE_CALCULO.TabStop := False;         edCVE_CALCULO.HelpContext := 0;         edCVE_CALCULO.ReadOnly := True;
       btCALC_INT.Tag := 0;             btCALC_INT.TabStop := False;            btCALC_INT.HelpContext := 0;
       edFACT_MORAS.Tag := 0;           edFACT_MORAS.TabStop := False;          edFACT_MORAS.HelpContext := 0;          edFACT_MORAS.ReadOnly := True;
       edCVE_TASA_REFER.Tag := 0;       edCVE_TASA_REFER.TabStop := False;      edCVE_TASA_REFER.HelpContext := 0;      edCVE_TASA_REFER.ReadOnly := True;
       btTASA_REFER.Tag := 0;           btTASA_REFER.TabStop := False;          btTASA_REFER.HelpContext := 0;
       cbTIPO_TASA.Tag :=0;             cbTIPO_TASA.TabStop :=False;            cbTIPO_TASA.HelpContext :=0;
       cbOPERADOR_STASA.Tag := 0;       cbOPERADOR_STASA.TabStop := False;      cbOPERADOR_STASA.HelpContext := 0;      cbOPERADOR_STASA.ReadOnly := True;
       edSOBRETASA.Tag := 0;            edSOBRETASA.TabStop := False;           edSOBRETASA.HelpContext := 0;           edSOBRETASA.ReadOnly := True;
       edTASA_CREDITO.Tag := 0;         edTASA_CREDITO.TabStop := False;        edTASA_CREDITO.HelpContext := 0;        edTASA_CREDITO.ReadOnly := True;
       bbUNIDAD_TIEMPO_RE.Tag := 0;     bbUNIDAD_TIEMPO_RE.TabStop := False;    bbUNIDAD_TIEMPO_RE.HelpContext := 0;
       cbDIA_REVISION.Tag := 0;         cbDIA_REVISION.TabStop := False;        cbDIA_REVISION.HelpContext := 0;        cbDIA_REVISION.ReadOnly := True;
       edNUM_UNIDADES_RE.Tag := 0;      edNUM_UNIDADES_RE.TabStop := False;     edNUM_UNIDADES_RE.HelpContext := 0;     edNUM_UNIDADES_RE.ReadOnly := True;
       cbDIA_REVISION.Tag := 0;         cbDIA_REVISION.TabStop := False;        cbDIA_REVISION.HelpContext := 0;        cbDIA_REVISION.ReadOnly := True;
       edF_PROX_REVISION.Tag := 0;      edF_PROX_REVISION.TabStop := False;     edF_PROX_REVISION.HelpContext := 0;     edF_PROX_REVISION.ReadOnly := True;
       dtpF_PROX_REVISION.Tag := 0;     dtpF_PROX_REVISION.TabStop := False;    dtpF_PROX_REVISION.HelpContext := 0;
       edCVE_AMORTIZACION.Tag := 0;     edCVE_AMORTIZACION.TabStop := False;    edCVE_AMORTIZACION.HelpContext := 0;    edCVE_AMORTIZACION.ReadOnly := True;
       btTIPO_AMORT.Tag := 0;           btTIPO_AMORT.TabStop := False;          btTIPO_AMORT.HelpContext := 0;
       bbUNIDAD_TIEMPO_CP.Tag := 0;     bbUNIDAD_TIEMPO_CP.TabStop := False;    bbUNIDAD_TIEMPO_CP.HelpContext := 0;
       edNUM_UNIDADES_CP.Tag := 0;      edNUM_UNIDADES_CP.TabStop := False;     edNUM_UNIDADES_CP.HelpContext := 0;     edNUM_UNIDADES_CP.ReadOnly := True;
       cbDIA_PAGO_CAP.Tag := 0;         cbDIA_PAGO_CAP.TabStop := False;        cbDIA_PAGO_CAP.HelpContext := 0;        cbDIA_PAGO_CAP.ReadOnly := True;
       edF_INI_PAG_CAP.Tag := 0;        edF_INI_PAG_CAP.TabStop := False;       edF_INI_PAG_CAP.HelpContext := 0;       edF_INI_PAG_CAP.ReadOnly := True;
       dtpF_INI_PAG_CAP.Tag := 0;       dtpF_INI_PAG_CAP.TabStop := False;      dtpF_INI_PAG_CAP.HelpContext := 0;
       edCVE_PAG_INTERES.Tag := 0;      edCVE_PAG_INTERES.TabStop := False;     edCVE_PAG_INTERES.HelpContext := 0;     edCVE_PAG_INTERES.ReadOnly := True;
       btPAGO_INT.Tag := 0;             btPAGO_INT.TabStop := False;            btPAGO_INT.HelpContext := 0;
       bbUNIDAD_TIEMPO_IN.Tag := 0;     bbUNIDAD_TIEMPO_IN.TabStop := False;    bbUNIDAD_TIEMPO_IN.HelpContext := 0;
       edNUM_UNIDADES_IN.Tag := 0;      edNUM_UNIDADES_IN.TabStop := False;     edNUM_UNIDADES_IN.HelpContext := 0;     edNUM_UNIDADES_IN.ReadOnly := True;
       cbDIA_PAGO_INT.Tag := 0;         cbDIA_PAGO_INT.TabStop := False;        cbDIA_PAGO_INT.HelpContext := 0;        cbDIA_PAGO_INT.ReadOnly := True;
       edF_INI_PAG_INT.Tag := 0;        edF_INI_PAG_INT.TabStop := False;       edF_INI_PAG_INT.HelpContext := 0;       edF_INI_PAG_INT.ReadOnly := True;
       dtpF_INI_PAG_INT.Tag := 0;       dtpF_INI_PAG_INT.TabStop := False;      dtpF_INI_PAG_INT.HelpContext := 0;
       chB_APLICA_IVA.Tag := 0;         chB_APLICA_IVA.TabStop := False;        chB_APLICA_IVA.HelpContext := 0;

// --- ASOR --- ABRIL 2016 -- NUEVO CAMPO --
       chB_FINANC_ADIC.Tag    := 0;        chB_FINANC_ADIC.TabStop    := False;         chB_FINANC_ADIC.HelpContext    := 0;
       EdF_FIN_PERGRA_FA.Tag  := 0;        EdF_FIN_PERGRA_FA.TabStop  := False;         EdF_FIN_PERGRA_FA.HelpContext  := 0;     EdF_FIN_PERGRA_FA.ReadOnly := True;
       DtpF_FIN_PERGRA_FA.Tag := 0;        DtpF_FIN_PERGRA_FA.TabStop := False;         DtpF_FIN_PERGRA_FA.HelpContext := 0;
// -- FIN ---

       // <EASA 15 DIC 2005 deshabilita modificación del promotor administrador por la contabilidad por Centro de Costos>
//       edID_PROM_ADM.Tag := 0;          edID_PROM_ADM.TabStop := False;         edID_PROM_ADM.HelpContext := 0;           edID_PROM_ADM.ReadOnly := True;
//       btPROM_ADM.Tag := 0;             btPROM_ADM.TabStop := False;            btPROM_ADM.HelpContext := 0;
      // </EASA>
// RABA ABR 2013 nuevo campo
       cbCVE_CALIDAD_GTIA.Tag :=0;     cbCVE_CALIDAD_GTIA.TabStop :=False;      cbCVE_CALIDAD_GTIA.HelpContext :=0;
// FIN RABA
//       chB_INT_DIASIG.Tag := 0;         chB_INT_DIASIG.TabStop := False;        chB_INT_DIASIG.HelpContext := 0;

  End;
begin
      // </ ASTECI:AARJ >
      // APLICA SOLO PARA DISPOSICIÓN
      // Para Evitar que haya ambigüedad entre las DI, por Oper Eventual de LC
      // y la Operación DI "Normal", se valida también a Objeto.VG_OpEv_LC
      // Código original antes de la modificación:
      //if (( (PPTipoMovto = 'DI') or (PPTipoMovto = 'CM') or (PPTipoMovto = 'EV') )and (PPTipoEvento = 'M')) then
      if (( ((PPTipoMovto = 'DI') and (not Objeto.VG_OpEv_LC{= False})) or (PPTipoMovto = 'CM') or (PPTipoMovto = 'EV') )and (PPTipoEvento = 'M')) then
      // < ASTECI:AARJ />
      begin
          //PERMITE MODIFICAR TODOS LOS INTERCAMPOS
          if ( Objeto.SIT_CREDITO.AsString = CSIT_NP ) or
             ( Objeto.SIT_CREDITO.AsString = CSIT_NA ) or
             ( Objeto.SIT_CREDITO.AsString = CSIT_RE ) then
          Begin
             ActivAllControls;
          end
          //PARA EL CASO DE QUE SE ENCUENTRE AUTORIZADO SE DESHABILITAN LOS CONTROLES
          else
          Begin
             if ((Objeto.VGTIPO_DISPOSICION = 'CM') or (Objeto.VGTIPO_DISPOSICION = 'EA')) then begin
                iedID_CONTRATO.Tag := 18; iedID_CONTRATO.TabStop := True; iedID_CONTRATO.HelpContext := 1001;
                iedID_CONTRATO.ReadOnly := False; btCONTRATO.Tag := 18; btCONTRATO.TabStop := True;
                btCONTRATO.HelpContext := 1002;
                ActivAllControls;
             end
             else Begin
                DesActivControls;
             end;
          end;
      end
       //RENOVACIÓN Y REESTRUCTURACIÓN
      else if ((PPTipoMovto = 'RE') or (PPTipoMovto = 'RS')
      //</ ASTECI:AARJ >
      // 09 FEB 2010 Se supone esta regla al tratarse de una operación eventual LC
                or ((PPTipoMovto = 'DI') and (Objeto.VG_OpEv_LC {= True}))
      //< ASTECI:AARJ />
       ) then
      begin
          //PERMITE MODIFICAR TODOS LOS INTERCAMPOS
          if ( Objeto.SIT_CREDITO.AsString = CSIT_NP ) or
             ( Objeto.SIT_CREDITO.AsString = CSIT_NA ) or
             ( Objeto.SIT_CREDITO.AsString = CSIT_RE ) or
             (PPTipoEvento = 'A') then
          Begin
             if (PPTipoMovto = 'RE') then
             begin
               iedID_CONTRATO.Tag := 0;                      iedID_CONTRATO.TabStop := False;                iedID_CONTRATO.HelpContext := 0;           iedID_CONTRATO.ReadOnly := True;
               btCONTRATO.Tag := 0;                          btCONTRATO.TabStop := False;             btCONTRATO.HelpContext := 0;
{ </ EASA4011  09.MAR.2007      Req. Promotor asignado
               edID_PROM_ADM.Tag := 0;                      edID_PROM_ADM.TabStop := False;                edID_PROM_ADM.HelpContext := 0;           edID_PROM_ADM.ReadOnly := True;
               btPROM_ADM.Tag := 0;                          btPROM_ADM.TabStop := False;             btPROM_ADM.HelpContext := 0;
EASA >/ }
               // RABA SE ELIMINA LA RESTRICCION QUE DESHABILITA EL TIPO DE LIQUIDACIÓN. ACTUALIZACION B-6
               //edCVE_LIQUIDACION.Tag := 0;                   edCVE_LIQUIDACION.TabStop := False;             edCVE_LIQUIDACION.HelpContext := 0;         edCVE_LIQUIDACION.ReadOnly := True;
               //btTIPO_LIQ.Tag := 0;                          btTIPO_LIQ.TabStop := False;             btTIPO_LIQ.HelpContext := 0;
               //
             end
             else if (PPTipoMovto = 'RS')
                //</ ASTECI:AARJ >
                // 09 FEB 2010  Se supone esta regla al tratarse de una operación eventual LC
                  or ((PPTipoMovto = 'DI') and (Objeto.VG_OpEv_LC {= True}))
                //< ASTECI:AARJ />
              then
             begin
               iedID_CONTRATO.Tag := 50;                      iedID_CONTRATO.TabStop := True;                iedID_CONTRATO.HelpContext := 1001;           iedID_CONTRATO.ReadOnly := False;
               btCONTRATO.Tag := 50;                          btCONTRATO.TabStop := True;             btCONTRATO.HelpContext := 1002;
               edCVE_LIQUIDACION.Tag := 18;                   edCVE_LIQUIDACION.TabStop := True;             edCVE_LIQUIDACION.HelpContext := 2001;         edCVE_LIQUIDACION.ReadOnly := False;
               btTIPO_LIQ.Tag := 18;                          btTIPO_LIQ.TabStop := True;             btTIPO_LIQ.HelpContext := 2002;
{ </ EASA4011  09.MAR.2007      Req. Promotor asignado
               edID_PROM_ADM.Tag := 18;                       edID_PROM_ADM.TabStop := True;                edID_PROM_ADM.HelpContext := 3001;           edID_PROM_ADM.ReadOnly := False;
               btPROM_ADM.Tag := 18;                          btPROM_ADM.TabStop := True;             btPROM_ADM.HelpContext := 3002;
EASA >/}
{ </ RABA >  31 MAY 2011 Para   PPTipoMovto = 'RS' los valores son diferentes
               edIMP_CREDITO.Tag := 18;                       edIMP_CREDITO.TabStop := True;          edIMP_CREDITO.HelpContext := 4401;             edIMP_CREDITO.ReadOnly := False;
}
             end;
//           edIMP_CREDITO.Tag := 0;                       edIMP_CREDITO.TabStop := False;             edIMP_CREDITO.HelpContext := 0;             edIMP_CREDITO.ReadOnly := True;
             edF_INICIO.Tag := 0;                          edF_INICIO.TabStop := False;             edF_INICIO.HelpContext := 0;                edF_INICIO.ReadOnly := True;
             dtpF_INICIO.Tag := 0;                         dtpF_INICIO.TabStop := False;             dtpF_INICIO.HelpContext := 0;
             edDIAS_PLAZO.Tag := 18;                        edDIAS_PLAZO.TabStop := True;             edDIAS_PLAZO.HelpContext := 4101;              edDIAS_PLAZO.ReadOnly := False;
             btDIASPLAZO.Tag := 18;                         btDIASPLAZO.TabStop := True;             btDIASPLAZO.HelpContext := 4102;

             edF_VENCIMIENTO.Tag := 18;                     edF_VENCIMIENTO.TabStop := True;             edF_VENCIMIENTO.HelpContext := 4201;           edF_VENCIMIENTO.ReadOnly := False;
//             edF_VENCIMIENTO.Tag := 0;                     edF_VENCIMIENTO.TabStop := False;             edF_VENCIMIENTO.HelpContext := 0;           edF_VENCIMIENTO.ReadOnly := True;

             dtpF_VENCIMIENTO.Tag := 18;                    dtpF_VENCIMIENTO.TabStop := True;             dtpF_VENCIMIENTO.HelpContext := 4202;
             chB_APLICA_IVA.Tag := 0;                         chB_APLICA_IVA.TabStop := False;             chB_APLICA_IVA.HelpContext := 0;
             chB_APLICA_COM.Tag := 0;                      chB_APLICA_COM.TabStop := False;             chB_APLICA_COM.HelpContext := 0;
             edPCT_COMISION.Tag := 0;                      edPCT_COMISION.TabStop := False;             edPCT_COMISION.HelpContext := 0;            edPCT_COMISION.ReadOnly := True;
// JJAR 12 ABRIL 2009, se condiciona la habilitación del boton de clave operativa:
// Linea Original:
//             btCVE_OPERATIVA.Tag := 0;                     btCVE_OPERATIVA.TabStop := False;             btCVE_OPERATIVA.HelpContext := 0;
// Modificación para implementar la condicion.
             if ((PPTipoMovto = 'DI') and (Objeto.VG_OpEv_LC {= True})) then
             begin
               btCVE_OPERATIVA.Tag := 18;                     btCVE_OPERATIVA.TabStop := True;             btCVE_OPERATIVA.HelpContext := 5501;
// </ RABA >  31 MAY 2011
               edIMP_CREDITO.Tag := 18;                       edIMP_CREDITO.TabStop := True;          edIMP_CREDITO.HelpContext := 4401;             edIMP_CREDITO.ReadOnly := False;
// < RABA />
             end;
//           else begin
//SEP ROIM REESTRUCTURA            btCVE_OPERATIVA.Tag := 0;                     btCVE_OPERATIVA.TabStop := False;             btCVE_OPERATIVA.HelpContext := 0;
//           end;

             meTX_COMENTARIO.Tag := 18;                     meTX_COMENTARIO.TabStop := True;             meTX_COMENTARIO.HelpContext := 5601;           meTX_COMENTARIO.ReadOnly := False;

             //RABA ABRIL 2015 SE ELIMINA LA RESTRICCION DE QUE PARA RENOVACIONES EL CAMPO CLAVE DE CALCULO SI SE MODIFIQUE
             //if (PPTipoMovto = 'RE') then
             //begin
             //    edCVE_CALCULO.Tag := 0;                       edCVE_CALCULO.TabStop := False;             edCVE_CALCULO.HelpContext := 0;             edCVE_CALCULO.ReadOnly := True;
             //    btCALC_INT.Tag := 0;                          btCALC_INT.TabStop := False;             btCALC_INT.HelpContext := 0;
             //end
             //else if (PPTipoMovto = 'RS')
             //   //</ ASTECI:AARJ >
             //   // 09 FEB 2010
             //     or ((PPTipoMovto = 'DI') and (Objeto.VG_OpEv_LC {=True}))
             //  //< ASTECI:AARJ />
             //then
             //begin
             //    edCVE_CALCULO.Tag := 18;                       edCVE_CALCULO.TabStop := True;             edCVE_CALCULO.HelpContext := 6001;             edCVE_CALCULO.ReadOnly := False;
             //    btCALC_INT.Tag := 18;                          btCALC_INT.TabStop := True;             btCALC_INT.HelpContext := 6002;
             //end;

             //RABA ABRIL 2015, ESTE CAMBPO DEBE ESTAR HABILIDATADO AUN SIENDO RENOVACION. REQUERIMIENTO B-6
             edCVE_CALCULO.Tag := 18;                       edCVE_CALCULO.TabStop := True;             edCVE_CALCULO.HelpContext := 6001;             edCVE_CALCULO.ReadOnly := False;
             btCALC_INT.Tag := 18;                          btCALC_INT.TabStop := True;             btCALC_INT.HelpContext := 6002;


             edFACT_MORAS.Tag := 0;                        edFACT_MORAS.TabStop := False;             edFACT_MORAS.HelpContext := 0;              edFACT_MORAS.ReadOnly := True;
             edCVE_TASA_REFER.Tag := 18;                    edCVE_TASA_REFER.TabStop := True;             edCVE_TASA_REFER.HelpContext := 6201;          edCVE_TASA_REFER.ReadOnly := False;
             btTASA_REFER.Tag := 18;                        btTASA_REFER.TabStop := True;             btTASA_REFER.HelpContext := 6202;
             cbTIPO_TASA.Tag :=18;                          cbTIPO_TASA.TabStop :=True;             cbTIPO_TASA.HelpContext :=6301;
             cbOPERADOR_STASA.Tag := 18;                    cbOPERADOR_STASA.TabStop := True;             cbOPERADOR_STASA.HelpContext := 6401;          cbOPERADOR_STASA.ReadOnly := False;
             edSOBRETASA.Tag := 18;                         edSOBRETASA.TabStop := True;             edSOBRETASA.HelpContext := 6501;               edSOBRETASA.ReadOnly := False;
             edTASA_CREDITO.Tag := 18;                      edTASA_CREDITO.TabStop := True;             edTASA_CREDITO.HelpContext := 6601;            edTASA_CREDITO.ReadOnly := False;
             bbUNIDAD_TIEMPO_RE.Tag := 18;                  bbUNIDAD_TIEMPO_RE.TabStop := True;             bbUNIDAD_TIEMPO_RE.HelpContext := 6701;
             cbDIA_REVISION.Tag := 18;                      cbDIA_REVISION.TabStop := True;             cbDIA_REVISION.HelpContext := 0;               cbDIA_REVISION.ReadOnly := False;
             edNUM_UNIDADES_RE.Tag := 18;                   edNUM_UNIDADES_RE.TabStop := True;             edNUM_UNIDADES_RE.HelpContext := 6801;         edNUM_UNIDADES_RE.ReadOnly := False;
             cbDIA_REVISION.Tag := 18;                      cbDIA_REVISION.TabStop := True;             cbDIA_REVISION.HelpContext := 6901;            cbDIA_REVISION.ReadOnly := False;

             edF_PROX_REVISION.Tag := 18;                   edF_PROX_REVISION.TabStop := True;             edF_PROX_REVISION.HelpContext := 7001;         edF_PROX_REVISION.ReadOnly := False;
//             edF_PROX_REVISION.Tag := 0;                   edF_PROX_REVISION.TabStop := False;             edF_PROX_REVISION.HelpContext := 0;         edF_PROX_REVISION.ReadOnly := True;

             dtpF_PROX_REVISION.Tag := 18;                  dtpF_PROX_REVISION.TabStop := True;             dtpF_PROX_REVISION.HelpContext := 7002;
             edCVE_AMORTIZACION.Tag := 18;                  edCVE_AMORTIZACION.TabStop := True;             edCVE_AMORTIZACION.HelpContext := 7101;        edCVE_AMORTIZACION.ReadOnly := False;
             btTIPO_AMORT.Tag := 18;                        btTIPO_AMORT.TabStop := True;             btTIPO_AMORT.HelpContext := 7102;
             bbUNIDAD_TIEMPO_CP.Tag := 18;                  bbUNIDAD_TIEMPO_CP.TabStop := True;             bbUNIDAD_TIEMPO_CP.HelpContext := 7201;
             edNUM_UNIDADES_CP.Tag := 18;                   edNUM_UNIDADES_CP.TabStop := True;             edNUM_UNIDADES_CP.HelpContext := 7301;         edNUM_UNIDADES_CP.ReadOnly := False;
             cbDIA_PAGO_CAP.Tag := 18;                      cbDIA_PAGO_CAP.TabStop := True;             cbDIA_PAGO_CAP.HelpContext := 7401;            cbDIA_PAGO_CAP.ReadOnly := False;

             edF_INI_PAG_CAP.Tag := 18;                     edF_INI_PAG_CAP.TabStop := True;             edF_INI_PAG_CAP.HelpContext := 7501;           edF_INI_PAG_CAP.ReadOnly := False;
//             edF_INI_PAG_CAP.Tag := 0;                     edF_INI_PAG_CAP.TabStop := False;             edF_INI_PAG_CAP.HelpContext := 0;           edF_INI_PAG_CAP.ReadOnly := True;

             dtpF_INI_PAG_CAP.Tag := 18;                    dtpF_INI_PAG_CAP.TabStop := True;             dtpF_INI_PAG_CAP.HelpContext := 7502;
             edCVE_PAG_INTERES.Tag := 18;                   edCVE_PAG_INTERES.TabStop := True;             edCVE_PAG_INTERES.HelpContext := 8001;         edCVE_PAG_INTERES.ReadOnly := False;
             btPAGO_INT.Tag := 18;                          btPAGO_INT.TabStop := True;             btPAGO_INT.HelpContext := 8002;
             bbUNIDAD_TIEMPO_IN.Tag := 18;                  bbUNIDAD_TIEMPO_IN.TabStop := True;             bbUNIDAD_TIEMPO_IN.HelpContext := 8101;
             edNUM_UNIDADES_IN.Tag := 18;                   edNUM_UNIDADES_IN.TabStop := True;              edNUM_UNIDADES_IN.HelpContext := 8201;         edNUM_UNIDADES_IN.ReadOnly := False;
             cbDIA_PAGO_INT.Tag := 18;                      cbDIA_PAGO_INT.TabStop := True;             cbDIA_PAGO_INT.HelpContext := 8301;            cbDIA_PAGO_INT.ReadOnly := False;

             edF_INI_PAG_INT.Tag := 18;                     edF_INI_PAG_INT.TabStop := True;             edF_INI_PAG_INT.HelpContext := 8401;           edF_INI_PAG_INT.ReadOnly := False;
//             edF_INI_PAG_INT.Tag := 0;                     edF_INI_PAG_INT.TabStop := False;             edF_INI_PAG_INT.HelpContext := 0;           edF_INI_PAG_INT.ReadOnly := True;

             dtpF_INI_PAG_INT.Tag := 18;                    dtpF_INI_PAG_INT.TabStop := True;             dtpF_INI_PAG_INT.HelpContext := 8402;
// </ RABA > 31 MAY 2011
             if (PPTipoMovto = 'RS') OR (PPTipoMovto = 'RE') then
             begin
               edIMP_CREDITO.Tag := 0;                        edIMP_CREDITO.TabStop := False;          edIMP_CREDITO.HelpContext := 0;             edIMP_CREDITO.ReadOnly := False;
               iedID_CONTRATO.Tag := 0;                      iedID_CONTRATO.TabStop := False;                iedID_CONTRATO.HelpContext := 0;           iedID_CONTRATO.ReadOnly := True;
               btCONTRATO.Tag := 0;                          btCONTRATO.TabStop := False;             btCONTRATO.HelpContext := 0;

             end;
// < RABA />
// RABA ABR 2013 nuevo campo
             cbCVE_CALIDAD_GTIA.Tag :=18;     cbCVE_CALIDAD_GTIA.TabStop :=True;      cbCVE_CALIDAD_GTIA.HelpContext :=8701;
// FIN RABA
//             chB_INT_DIASIG.Tag := 0;         chB_INT_DIASIG.TabStop := False;        chB_INT_DIASIG.HelpContext := 0;

//// --- ASOR --- ABRIL 2016 -- NUEVO CAMPO --
             EdF_FIN_PERGRA_FA.Tag  := 18;        EdF_FIN_PERGRA_FA.TabStop  := True;         EdF_FIN_PERGRA_FA.HelpContext  := 5051;        EdF_FIN_PERGRA_FA.ReadOnly:=False;
             DtpF_FIN_PERGRA_FA.Tag := 18;        DtpF_FIN_PERGRA_FA.TabStop := True;         DtpF_FIN_PERGRA_FA.HelpContext := 5052;
             chB_FINANC_ADIC.Tag := 18;           chB_FINANC_ADIC.TabStop := True;            chB_FINANC_ADIC.HelpContext := 5050;
// -- FIN --

          end
          //PARA EL CASO DE QUE SE ENCUENTRE AUTORIZADO SE DESHABILITAN LOS CONTROLES
          else
          Begin
             DesActivControls;
          end;
      end;
end;

procedure TWCrCredito.InterForma1AntesModificar(Sender: TObject;  var Realizado: Boolean);
begin
      AjustaControles(Objeto.TIPO_DISPOSICION.AsString,'M');

   //--- ASOR --- ABRIL 2016 ---
      if Objeto.B_FINANC_ADIC.AsString = 'F' then
         begin
           chB_FINANC_ADIC.Enabled:= False;
           EdF_FIN_PERGRA_FA.Enabled:= False;
           EdF_FIN_PERGRA_FA.Text:= '';
           dtpF_FIN_PERGRA_FA.Enabled:= False;
         end
      else
         begin
           chB_FINANC_ADIC.Enabled:= True;
           EdF_FIN_PERGRA_FA.Enabled:= True;
           EdF_FIN_PERGRA_FA.Text:=  Objeto.F_FIN_PERGRA_FA.AsString;
           dtpF_FIN_PERGRA_FA.Enabled:= True;
      end;
      chB_FINANC_ADIC.OnExit(Sender);
   //--- FIN ---
end;

procedure TWCrCredito.DatosAdicionalesaTasas1Click(Sender: TObject);
Begin
   ClassAdmonTasa;
end;

procedure TWCrCredito.cbTIPO_TASAExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.CVE_TIPO_TASA.GetFromControl;
      if Objeto.CVE_TIPO_TASA.AsString = C_FIJA then
      Begin
            bbUNIDAD_TIEMPO_RE.Enabled := False;
            edNUM_UNIDADES_RE.Enabled := False;
            cbDIA_REVISION.Enabled := False;
            edF_PROX_REVISION.Enabled := False; //019
            dtpF_PROX_REVISION.Enabled := False;
            edNUM_UNIDADES_RE.Color := clBtnFace;
            cbDIA_REVISION.Color := clBtnFace;
            edF_PROX_REVISION.Color := clBtnFace;
            if InterForma1.IsNewData then
               Objeto.F_PROX_REVISION.AsDateTime := Objeto.F_INICIO.AsDateTime;
            //end if
//            edF_PROX_REVISION.Text := '';
            if ( Objeto.CVE_CALCULO.AsString = 'RE' ) THEN
            Begin
               ShowMessage('La clave de calculo de interes no puede ser Revisable');
               edCVE_CALCULO.SetFocus;
            end;
      end
      else
      Begin
            bbUNIDAD_TIEMPO_RE.Enabled := True;
            edNUM_UNIDADES_RE.Enabled := True;
            cbDIA_REVISION.Enabled := True;
            edF_PROX_REVISION.Enabled := True; //019
            dtpF_PROX_REVISION.Enabled := True;
            edNUM_UNIDADES_RE.Color := clWindow;
            cbDIA_REVISION.Color := clWindow;
            edF_PROX_REVISION.Color := clWindow; //019
            edF_PROX_REVISION.Text := '';
      end;
   end;
   InterForma1.ValidaExit(cbTIPO_TASA,True,'',True);
end;

procedure TWCrCredito.ClassComisProg;
var
    Compro     : TCrComPro;
begin
     if Objeto.Active then
     Begin
         Compro := TCrComPro.Create(self);
         try
            Compro.Apli:=Objeto.Apli;     Compro.ParamCre:=Objeto.ParamCre;
            Objeto.BasicCred.LlenaDatos(Objeto.ID_CREDITO.AsInteger);
            Compro.BasicCred := Objeto.BasicCred;
            Compro.vgModifica := Objeto.vgComision;
            Compro.Catalogo;
         finally
                Compro.Free;
         end;
     end
     else
         ShowMessage('Seleccione una Disposición');
end;

procedure TWCrCredito.Consulta1Click(Sender: TObject);
Var   Motivo : TCrMotRech;
begin
   if Objeto.Active then
      Begin
            Motivo := TCrMotRech.Create(self);
            try
               Motivo.Apli:=Objeto.Apli;
               Motivo.ParamCre:=Objeto.ParamCre;
               Motivo.ID_CREDITO.AsString := Objeto.ID_CREDITO.AsString;
               Motivo.Catalogo;
            finally
                   Motivo.Free;
            end;
       end
   else
       ShowMessage('Debe de seleccionar una Disposición.');
   //end if;
end;

procedure TWCrCredito.btAUTORIZAClick(Sender: TObject);
var vlContinua  : Boolean;
    vlMsg       : String;
    vlvalGar    : String;
    vlclave     : String;
    vlCount     : integer;
Begin


   // ASOR -- 11/03/2016 -- Mensaje recordatorio tipo de interes PD
   if Trim(edCVE_CALCULO.text) = 'PD' then
   begin
     vlsql:= ' Select Count(*) TOTAL from cr_inf_adic_tasa where id_credito = ' + Objeto.ID_CREDITO.AsString;
     GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'TOTAL',vlCount,False);
     if vlCount = 0 then
     begin
       IF MessageDlg('Para el cálculo de Interés PROMEDIO ARITMETICO DÍA NATURAL' + #13 +
                     '    Debe de ingresar la Información Adicional de la Tasa' + #13 +
                     '                              ¿Desea Continuar?',
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
            vlContinua := True;
        end    
       else
         begin
            vlContinua := False;
            Exit;
       end;
     end;
   end;

   vlclave := '16';
//   if  IntGenCre.ValidaUsuario(Objeto.Apli, vlclave) then
   if Objeto.ValidaAccesoEsp('TCRCREDITO_AUTOR',True,True) then
   begin
     vlContinua := True;
     if Objeto.Active then
     begin
         if Objeto.SIT_CREDITO.AsString = CSIT_AU then
            ShowMessage('Disposición ya se encuentra Autorizada')
         else
         Begin
            if (Objeto.SIT_CREDITO.AsString = CSIT_NA) then          Begin

               if MessageDlg('¿Está seguro de autorizar la Disposición',
                               mtConfirmation, [mbYes, mbNo], 0) = mrYes then
               Begin
                  //RABA OCT 2013 O17
                  if vlContinua then
                  Begin
                    IF (Objeto.ID_SOLICITUD.IsNull) OR (Objeto.ID_SOLICITUD.AsInteger = 0) THEN
                      If MessageDlg('La disposición no está asociada a una solicitud. ¿Desea continuar?',
                               mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                         vlContinua:= True
                      else
                         vlContinua := False;
                  end;
                  //FIN RABA

                  //HERJA STP QUE REALIZA VALIDACIONES PARA REESTRUCTURAS Y RENOVACIONES - HERJA ABRIL 2013
                  if vlContinua then
                  Begin
                     GetSQLInt('SELECT COUNT(*) COUNT FROM CR_RR_CREDITO WHERE ID_CRED_RENUEVA = ' + Objeto.ID_CREDITO.AsString+' AND SIT_RENUEVA=''NA''',
                     Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,'COUNT',vlCount ,False);
                     If vlCount > 0 Then
                     begin
                        if (Objeto.StpValidaRSRE(Objeto.ID_CREDITO.AsInteger) = False) then vlContinua := False;
                     end;
                  end;

                  if vlContinua then
                  begin
                    vlvalGar := ValidaGarantia;
                    if  vlvalGar <> CNULL then
                    begin
                            if MessageDlg(vlvalGar + '¿Está seguro que desea continuar?',
                               mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                                     vlContinua := False;
                    end;

                    //CODIGO PARA VALIDAR QUE NO PERMITA ACCESO A ESTA PANTALLA EN CASO DE SER CESION
                    vlsql:= ' SELECT COUNT(*) COUNT FROM CR_CESION WHERE ID_CESION = ' + Objeto.ID_CREDITO.AsString;
                    GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlCount,False);
                    if vlCount <> 0 then
                    begin
                       ShowMessage('No se puede AUTORIZAR debido a que se trata de una CESION.');
                       vlContinua := False;
                    end;

                    IF (Objeto.F_INICIO.AsDateTime > Objeto.Apli.DameFechaEmpresa) and (vlContinua = True)  THEN
                    Begin
                       ShowMessage('No se puede autorizar una disposición con fecha de inicio mayor a la de hoy');
                       vlContinua := False;
                    end;
                  end;

                  if vlContinua then Begin
                    if not(ValTramites(Objeto.ID_CREDITO.AsString,'ALTDISP', Objeto.Apli, vlMsg)) then
                    Begin
                       ShowMessage(vlMsg);
                       vlContinua := False;
                    end;
                  end;

                  if vlContinua then Begin
                    if vgImpMaxAut <> 0 then Begin
                       if Objeto.IMP_CREDITO.AsFloat > vgImpMaxAut then
                       Begin
                             // ASTECI:AARJ 17 feb 2010 corrección pues se esta validando que Objeto.IMP_CREDITO.AsFloat no sea mayor a vgImpMaxAut
                             //ShowMessage('Sólo puede autorizar disposiciones mayores de ' +
                             ShowMessage('Sólo puede autorizar disposiciones menores de ' +
                                         Format(CFORMAT_DINERO,[vgImpMaxAut]));
                             vlContinua := False;
                       end;
                    end;//if

                    // <EASA 07 DIC 2005  SE INCORPORA RUTINA PAR VERIFICAR DISP IMPAGADAS DEL ACREDITADO>
                    if vlContinua then Begin
                       if not FindDispIM(Objeto.ContratoCre.Contrato.ID_Titular.AsInteger,Objeto.Apli, vlMsg) then Begin
                          if MessageDlg( vlMsg + ' ¿ Desea Continuar ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                             vlContinua := True
                          else vlContinua := False;
                       end;
                    end;
                    // </EASA>
                    if vlContinua then Begin
                       if not(FindCredOrigen) THEN Begin //se revisa tabla CR_CREDITO_REST para poder contar los elementos, si = 1 then true, si no false
                          if Objeto.StpAutoriza(Objeto.ID_CREDITO.AsInteger) then
                          Begin
                             ShowMessage('Se Autorizó la disposición : ' + Objeto.ID_CREDITO.AsString );
                             Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
                             Objeto.ContratoCre.FindKey([Objeto.ID_CONTRATO.AsString,1]);
                             DeshabilitaBotonesXSit;
                             ValidaUsuario; //EASA4011 26 ABRIL 2006 CORRECCION
                             Objeto.MFiraOpe.MFiraOpe.FindKey([Objeto.CVE_OPERATIVA.AsString]);
                             RevisaAutRedescuento;   // RABA SEP 2011  SE REVISA SI EL REDESCUENTO FUE AUTORIZADO.
                             if MessageDlg('¿La Disposición se relaciona con alguna Chequera?',
                                       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                                ShowChequera(True);
                             //end if;
                          end;
                       end
                       else Begin
                          if Objeto.StpOperaConvenio(Objeto.ID_CREDITO.AsInteger, Objeto.ID_CRE_RENUEVA.AsInteger,'A') then
                          Begin
                             ShowMessage('Se Autorizó ' + lbTIPO_CREDITO.Caption );
                             Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
                             DeshabilitaBotonesXSit;
                             ValidaUsuario; //EASA4011 26 ABRIL 2006 CORRECCION
                          end;
                       end;
                    end;//if
                  END;
               end;
            end
            else ShowMessage('No se puede autorizar la Disposición');
         END;
     end
     else
        ShowMessage('Debe de seleccionar una Disposición.');
        Objeto.ContratoCre.ObtenDisponibleAcred(Objeto.ContratoCre.Contrato.ID_Titular.AsString);
        Objeto.ContratoCre.ObtenDisponibleGpo(Objeto.ContratoCre.Acreditado.CVE_GRUPO_ECO.AsString);
        Objeto.ContratoCre.ObtenDisponibleAut(Objeto.ContratoCre.ID_CONTRATO.AsString,Objeto.ContratoCre.FOL_CONTRATO.AsString);
     end;
     {else begin
     ShowMessage('    No tiene suficientes permisos para esta Acción')
     end;}
end;

procedure TWCrCredito.btCANCELAClick(Sender: TObject);
var vlContinua : Boolean;   // RABA 14 JUN 2011
    vlclave : String;
begin
   vlclave := '17';
   //if IntGenCre.ValidaUsuario(Objeto.Apli, vlclave) then
   if Objeto.ValidaAccesoEsp('TCRCREDITO_AUTOR',True,True) then
   begin
       vlContinua := True;  // RABA 14 JUN 2011
       if Objeto.Active then
       begin
          if Objeto.SIT_CREDITO.AsString = CSIT_CA then
             ShowMessage('La Disposición ya se encuentra Cancelada')
          else
          Begin
            if ( Objeto.SIT_CREDITO.AsString <> CSIT_CA ) OR
               ( Objeto.SIT_CREDITO.AsString <> CSIT_LQ ) then
            Begin
               // </ RABA > 14 JUN 2011
               // se agreg la validación para el caso que la disposición sea por
               // reestructura o renovaciones, ésta solo se podrá cancelar en el mismo día
               //if (Objeto.TIPO_DISPOSICION.AsString = 'RS') or (Objeto.TIPO_DISPOSICION.AsString = 'RE') then  //RABA MAR/2015 NO SOLO RS Y RE TAMBIEN DISPOSICIONES
                  If (Objeto.SIT_CREDITO.AsString ='AC') and (Objeto.Apli.DameFechaEmpresa <> Objeto.F_AUTORIZA.AsDateTime) then
                  begin
                     vlContinua := False;
                     If (Objeto.TIPO_DISPOSICION.AsString = 'RS') then
                         ShowMessage('No es posible cancelar Reestructuras de días anteriores autorizadas.')
                     else
                         If (Objeto.TIPO_DISPOSICION.AsString = 'RE') then
                             ShowMessage('No es posible cancelar Renovaciones de días anteriores autorizadas.')
                         else
                             ShowMessage('No es posible cancelar Disposiciones de días anteriores autorizadas.')   //RABA MAR/2015 tambien disposiciones
                  end;

               If vlContinua then
               // < RABA />
                 if MessageDlg('¿Está seguro de cancelar la Operación',
                               mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                 Begin
                    if not(FindCredOrigen) THEN Begin
                      if Objeto.StpCancelaDisp(Objeto.ID_CREDITO.AsInteger) then
                      Begin
                         ShowMessage('Se canceló la disposición : ' + Objeto.ID_CREDITO.AsString );
                         Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
                         DeshabilitaBotonesXSit;
                         ValidaUsuario; //EASA4011 26 ABRIL 2006 CORRECCION
                      end;
                    end
                    else Begin
                      if Objeto.StpOperaConvenio(Objeto.ID_CREDITO.AsInteger, Objeto.ID_CRE_RENUEVA.AsInteger,'C') then
                      Begin
                         ShowMessage('Se Reverso la operación ');
                         Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
                         DeshabilitaBotonesXSit;
                         ValidaUsuario; //EASA4011 26 ABRIL 2006 CORRECCION
                      end;
                    end;
                 end;
            end
            else ShowMessage('La Disposición no puede ser cancelada');
          end;
       end
       else
          ShowMessage('Debe de seleccionar una Disposición.');
   end;
   {else begin
   ShowMessage('    No tiene suficientes permisos para esta Acción')
   end;}
end;

procedure TWCrCredito.Rechazar1Click(Sender: TObject);
begin
   if Objeto.Active then
   begin
      if  Objeto.SIT_CREDITO.AsString = CSIT_RE then
         ShowMessage('La Disposición ya se encuentra Rechazada')
      else
      Begin
        if ( Objeto.SIT_CREDITO.AsString <> CSIT_RE ) OR
           ( Objeto.SIT_CREDITO.AsString <> CSIT_CA ) OR
           ( Objeto.SIT_CREDITO.AsString <> CSIT_LQ ) then
        Begin
           if MessageDlg('¿Está seguro de rechazar la disposición',
                         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           Begin
                if AltaMotivo then
                Begin
                   if Objeto.StpRechazaDisp(Objeto.ID_CREDITO.AsInteger,vgMotivo) then
                   Begin
                      ShowMessage('La disposición : ' + Objeto.ID_CREDITO.AsString + ', ha sido rechazada');
                      Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
                      DeshabilitaBotonesXSit;
                      ValidaUsuario; //EASA4011 26 ABRIL 2006 CORRECCION
                   end;
                end
                else ShowMessage('Necesita dar de alta un motivo de Rechazo. Disposición No Rechazada.');
           end;
        end
        else ShowMessage('La Disposición no puede ser rechazada');
      end;
   end
   else
      ShowMessage('Debe de seleccionar una Disposición.');
end;

procedure TWCrCredito.Reactivar1Click(Sender: TObject);
begin
   if Objeto.Active then
   begin
      if ( Objeto.SIT_CREDITO.AsString = CSIT_NP ) or ( Objeto.SIT_CREDITO.AsString = CSIT_RE )then
      Begin
         if MessageDlg('¿Está seguro de reactivar la disposición',
                         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         Begin
             if Objeto.StpReactivaDisp(Objeto.ID_CREDITO.AsInteger) then
             Begin
                ShowMessage('La disposición : ' + Objeto.ID_CREDITO.AsString + ', ha sido reactivada');
                Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
                DeshabilitaBotonesXSit;
                ValidaUsuario; //EASA4011 26 ABRIL 2006 CORRECCION
             end;
         end;
      end
      else ShowMessage('La Disposición no puede ser reactivada');
   end
   else
      ShowMessage('Debe de seleccionar una Disposición.');
end;

procedure TWCrCredito.Impresin1Click(Sender: TObject);
Var RepDispDet : TMDispDet;
begin
   if Objeto.Active then
      Begin
            RepDispDet := TMDispDet.Create(self);
            try
               RepDispDet.Apli:=Objeto.Apli;
               RepDispDet.ParamCre:=Objeto.ParamCre;
               RepDispDet.vgId_Credito := Objeto.ID_CREDITO.AsInteger;
               RepDispDet.Catalogo;
            finally
                   RepDispDet.Free;
            end;
       end
   else ShowMessage('No existe una Dispoción a imprimir');
end;

procedure TWCrCredito.Procampo1Click(Sender: TObject);
Var   Procampo : TCrProcamp;
   Function ExisteRegProcam : Boolean;
   var vlSql    : String;
       vlCount  : Integer;
   Begin
      vlCount := 0;
      vlSql := ' SELECT count(*) COUNT FROM CR_PROCAMPO WHERE ID_CREDITO = ' + Objeto.ID_CREDITO.AsString;
      GetSQLInt(vlSql,Objeto.DataBaseName,Objeto.SessionName,'COUNT',vlCount,True);
      If vlCount > 0 Then
         Result := True
      else Result := False;
   END;

begin
   if Objeto.Active then
      Begin
            Procampo := TCrProcamp.Create(self);
            try
               Procampo.Apli:=Objeto.Apli;
               Procampo.ParamCre:=Objeto.ParamCre;
               Objeto.BasicCred.LlenaDatos(Objeto.ID_CREDITO.AsInteger);
               Procampo.BasicCred :=Objeto.BasicCred;
               Procampo.FindKey([Objeto.ID_CREDITO.AsString]);
               if ( Objeto.SIT_CREDITO.AsString = CSIT_AC ) or ( Objeto.SIT_CREDITO.AsString = CSIT_LQ ) THEN
                 Begin
                    If ExisteRegProcam Then
                       Procampo.Consulta
                    else ShowMessage('No existe Registro de Procampo');
                 end
               ELSE Procampo.Catalogo;
            finally
                if Procampo.G_CUOTA_CREDITO.AsFloat <> 0 then
                Begin
                   if Procampo.G_CUOTA_CREDITO.AsFloat <> Objeto.IMP_CREDITO.AsFloat then
                   Begin
                      ShowMessage('La cuota Crédito de Procampo es dirente al importe de disposición');
                      edIMP_CREDITO.SetFocus;
                   end;
                end;
                   Procampo.Free;
            end;
       end
   else
       ShowMessage('Debe de seleccionar una Disposición.');
   //end if;
end;

procedure TWCrCredito.SIEBAN1Click(Sender: TObject);
Var
   MDispSieb : TMDispSieb;
   sSQL, sSQL1: String;
   qyQuery,qyQuery1 : TQuery;
begin
   If Objeto.Active Then Begin
      MDispSieb := TMDispSieb.Create(self);
      Try
         MDispSieb.Apli :=Objeto.Apli;
         MDispSieb.ParamCre:=Objeto.ParamCre;
         MDispSieb.ID_CREDITO.AsInteger := Objeto.ID_CREDITO.AsInteger;
         MDispSieb.Disposicion := Objeto;

         sSQL:=' SELECT CTO.*, CR.ID_CREDITO '+
               '  FROM CR_REL_CTO_SIEB CTO, CR_CREDITO CR '+
               ' WHERE CR.ID_CONTRATO = CTO.ID_CONTRATO '+
               '   AND CR.ID_CREDITO = '+ Objeto.ID_CREDITO.AsString+
               '   AND CTO.SIT_REL_CTO_SIE =''AC''';
         qyQuery:= GetSQLQuery(sSQL, Objeto.DataBaseName, Objeto.SessionName, False);
         If qyQuery <> Nil Then Begin
            If Trim(qyQuery.FieldByName('SIT_REL_CTO_SIE').AsString)='AC' Then Begin
               sSQL1:='SELECT NVL(MAX(DISP.ID_SOLICITUD),0) SOLICITUD '+
                     '  FROM CR_REL_DISP_SIEB DISP'+
                     ' WHERE DISP.ID_CREDITO = '+ Objeto.ID_CREDITO.AsString +
                     '   AND DISP.SIT_REL_DISP_SIE <> ''CA''';
               qyQuery1:= GetSQLQuery(sSQL1, Objeto.DataBaseName, Objeto.SessionName, False);
               If qyQuery1 <> Nil Then Begin
                  If qyQuery1.FieldByName('SOLICITUD').AsInteger <> 0 Then Begin
                     MDispSieb.FindKey([qyQuery1.FieldByName('SOLICITUD').AsInteger,Objeto.ID_CREDITO.AsString]);
                     If (objeto.SIT_CREDITO.AsString = 'NA') OR (objeto.SIT_CREDITO.AsString = 'RE') Then Begin
                        MDispSieb.Catalogo;
                     End
                     Else Begin
                        MDispSieb.Consulta;
                     End;
                  End Else Begin
                     MDispSieb.Nuevo;
                  End;
                  qyQuery1.Free;
               End Else Begin
                  MDispSieb.Nuevo;
               End;
            End Else Begin
               ShowMessage('La línea '+ qyQuery.FieldByName('ID_CONTRATO').AsString +' no aplica SIEBAN');
            End;
            qyQuery.Free;
         End Else Begin
            ShowMessage('No ha sido dado de alta el Estímulo SIEBAN para la línea '+ Objeto.ID_CONTRATO.AsString);
         End;
      Finally
         MDispSieb.Free;
      End;
   End Else Begin
      ShowMessage('Debe seleccionar una disposición');
   End;
end;

procedure TWCrCredito.Garantas2Click(Sender: TObject);
Var
   MDispGar : TMDispGar;
begin
   If Objeto.Active Then Begin
      MDispGar := TMDispGar.Create(self);
      Try
         MDispGar.Apli :=Objeto.Apli;
         MDispGar.ParamCre:=Objeto.ParamCre;
         MDispGar.ID_CREDITO.AsInteger := Objeto.ID_CREDITO.AsInteger;
         MDispGar.CrCredito := Objeto;
         MDispGar.Catalogo;
      Finally
         MDispGar.Free;
      End;
   End Else Begin
      ShowMessage('Debe seleccionar una disposición');
   End;
end;

procedure TWCrCredito.Documentacin2Click(Sender: TObject);
Var   DoctosAcred : TMRecTra;
begin
   if Objeto.Active then
      Begin
            DoctosAcred := TMRecTra.Create(self);
            try
               DoctosAcred.Apli:=Objeto.Apli;
               DoctosAcred.ParamCre:=Objeto.ParamCre;
               DoctosAcred.iIdEmpresa:= Objeto.ContratoCre.Contrato.Id_Empresa.AsInteger;
               DoctosAcred.iIdAcreditado:= Objeto.ContratoCre.Contrato.ID_Titular.AsInteger;
               DoctosAcred.sCveMedio:= 'ALTDIS';
               DoctosAcred.iReferencia := Objeto.ID_CREDITO.AsInteger;
               DoctosAcred.sCveProduct := Objeto.ContratoCre.CVE_PRODUCTO_CRE.AsString;
               DoctosAcred.Catalogo;
            finally
                   DoctosAcred.Free;
            end;
       end
   else
       ShowMessage('Debe de seleccionar una Disposición.');
   //end if;
end;

procedure TWCrCredito.Seguros2Click(Sender: TObject);
Var
   MSeguro : TMSeguro;
begin
   If Objeto.Active Then begin
      MSeguro := TMSeguro.Create(self);
      Try
         MSeguro.Apli := Objeto.Apli;
         MSeguro.ParamCre:= Objeto.ParamCre;
         MSeguro.sCveTipoSeg := 'DI';
         MSeguro.iIdReferencia := Objeto.ID_CREDITO.AsInteger;
         MSeguro.Catalogo;
      Finally
         MSeguro.Free;
      End;
   End Else Begin
      ShowMessage('Debe seleccionar una disposición');
   End;
end;

procedure TWCrCredito.Cuotas1Click(Sender: TObject);
var GenCuot : TCrgencuot;
    Consult : TCrconsult;
begin
   if Objeto.Active then
      Begin
        if ( Objeto.SIT_CREDITO.AsString = CSIT_NP ) OR
           ( Objeto.SIT_CREDITO.AsString = CSIT_NA ) OR
           ( Objeto.SIT_CREDITO.AsString = CSIT_RE ) OR
           ( ( Objeto.SIT_CREDITO.AsString = CSIT_AC ) AND ( Objeto.TIPO_DISPOSICION.AsString = 'CM')  OR
             ( Objeto.SIT_CREDITO.AsString = CSIT_AC ) AND ( Objeto.TIPO_DISPOSICION.AsString = 'EV') ) then
        Begin

           //CODIGO PARA VALIDAR QUE NO PERMITA ACCESO A ESTA PANTALLA EN CASO DE SER CESION
           vlsql:= ' SELECT COUNT(*) COUNT FROM CR_CESION WHERE ID_CESION = ' + Objeto.ID_CREDITO.AsString;
           GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlCount,False);
           if vlCount = 0 then
           begin

            GenCuot := TCrgencuot.Create(self);
            try
               GenCuot.Apli := Objeto.Apli;
               GenCuot.ParamCre := Objeto.ParamCre;

               GenCuot.ID_CONTRATO.AsString := Objeto.ID_CONTRATO.AsString;
               GenCuot.CVE_PRODUCTO_CRE.AsString := Objeto.ContratoCre.Producto.CVE_PRODUCTO_CRE.AsString;
               GenCuot.DESC_L_PRODUCTO.AsString := Objeto.ContratoCre.Producto.DESC_L_PRODUCTO.AsString;
               GenCuot.CVE_AMORTIZACION.AsString := Objeto.CVE_AMORTIZACION.AsString;
               GenCuot.CVE_PAG_INTERES.AsString := Objeto.CVE_PAG_INTERES.AsString;
               GenCuot.UNIDAD_TIEMPO_CP.AsString := cbUNIDAD_TIEMPO_CP.Text; //Objeto.UNIDAD_TIEMPO_CP.AsString;
               GenCuot.NUM_UNIDADES_CP.AsString := Objeto.NUM_UNIDADES_CP.AsString;
               GenCuot.DIA_PAGO_CAP.AsString := Objeto.DIA_PAGO_CAP.AsString;
               GenCuot.UNIDAD_TIEMPO_IN.AsString := cbUNIDAD_TIEMPO_IN.Text; //Objeto.UNIDAD_TIEMPO_IN.AsString;
               GenCuot.NUM_UNIDADES_IN.AsString := Objeto.NUM_UNIDADES_IN.AsString;
               GenCuot.DIA_PAGO_INT.AsString := Objeto.DIA_PAGO_INT.AsString;
               GenCuot.DESC_AMORTIZA.AsString := Objeto.TipoAmort.DESC_AMORTIZA.AsString;
               GenCuot.DESC_PAG_INTERES.AsString := Objeto.PagoInt.DESC_PAG_INTERES.AsString;
               GenCuot.F_INI_PAG_CAP.AsString := Objeto.F_INI_PAG_CAP.AsString;
               GenCuot.F_INI_PAG_INT.AsString := Objeto.F_INI_PAG_INT.AsString;
               GenCuot.SIT_CREDITO.AsString := Objeto.SIT_CREDITO.AsString;
               GenCuot.IMP_CREDITO.AsString := Objeto.IMP_CREDITO.AsString;

               GenCuot.VGCredito := Objeto.id_credito.AsInteger;
               GenCuot.VGCredRenuev := Objeto.ID_CRE_RENUEVA.AsInteger;
               GenCuot.Catalogo;
               GenCuot.F_FIN_PERGRA_FA.AsDateTime:= Objeto.F_FIN_PERGRA_FA.AsDateTime;
            finally
                   GenCuot.Free;
            end;
          end
          else
            ShowMessage('No se puede acceder debido a que se trata de una CESION.');
        end
        else
        Begin
                Consulta_Credito(ftCapital,Objeto.ID_CREDITO.AsInteger,0,'',
                                 '',Objeto.Apli, Objeto.ParamCre);
        end;
        Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
      end
   else
       ShowMessage('Debe de seleccionar una Disposición.');
   //end if;
end;

procedure TWCrCredito.BitBtn1Click(Sender: TObject);
Var CatCoCr : TCrDatCoCr;
    vlclave : String;
begin
   vlclave := '15';
   //if IntGenCre.ValidaUsuario(Objeto.Apli, vlclave) then
   if Objeto.ValidaAccesoEsp('TCRCREDITO_ELMDP',True,True) then
   begin
     if Objeto.Active then
        Begin
              CatCoCr := TCrDatCoCr.Create(self);
              try
                 CatCoCr.Apli:=Objeto.Apli;
                 CatCoCr.ParamCre:=Objeto.ParamCre;
                 CatCoCr.vgIdCredito := Objeto.ID_CREDITO.AsInteger;
                 CatCoCr.vgModComision := Objeto.vgComision;
                 CatCoCr.Catalogo;
              finally
                     CatCoCr.Free;
              end;
         end
     else ShowMessage('Debe de seleccionar una Disposición.');
   end;
     {else begin
     ShowMessage('    No tiene suficientes permisos para esta Acción')
     end;}
end;

procedure TWCrCredito.Redescuento2Click(Sender: TObject);
Var
   MDispFond : TMDispFond;
begin
   If Objeto.Active Then Begin
      MDispFond := TMDispFond.Create(self);
      Try
         MDispFond.Apli := Objeto.Apli;
         MDispFond.ParamCre := Objeto.ParamCre;
         MDispFond.vgIdCredito := Objeto.ID_CREDITO.AsInteger;
         MDispFond.Catalogo;
      Finally
         MDispFond.Free;
      End;
   End Else Begin
      ShowMessage('Debe seleccionar una disposición');
   End;
end;

procedure TWCrCredito.RenvacinReestructuracin1Click(Sender: TObject);
Var
    CrResRee    : TCrResRee;
    vlCreditoRS : Integer;
begin
     If Objeto.Active Then Begin
        if ( Objeto.SIT_CREDITO.AsString = CSIT_AC ) then Begin
           // </ RABA > 09 JUN 2011
           vlCreditoRS := ValidaTipoRenueva;
           If vlCreditoRS = 0 then
           begin
           // < RABA /> 
              CrResRee := TCrResRee.Create(self);
              Try
                 CrResRee.Apli := Objeto.Apli;
                 CrResRee.ParamCre := Objeto.ParamCre;
                 CrResRee.vgIdCredito := Objeto.ID_CREDITO.AsInteger;
                 // </ RABA > 24 MAY 2011
                 // Se envia como contrato origen del crédito seleccionado
                 CrResRee.vgIdContratoOrig := Objeto.ContratoCre.ID_CONTRATO.AsInteger;
                 // < RABA />
                 CrResRee.VLACREDITADO := Objeto.ContratoCre.Contrato.ID_Titular.AsString;
                 CrResRee.VLMONEDA := Objeto.ContratoCre.Contrato.Cve_Moneda.AsString;
                 CrResRee.Catalogo;
              Finally
                 CrResRee.Free;
                 Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
              End;
           // </ RABA > 09 JUN 2011
           end
           Else ShowMessage('La disposición ya se encuentra en un proceso de reestructuración con la disposición: ' +
                            IntToStr(vlCreditoRS) + '.' + chr(13) +
                            'Primero cancele ésta disposición para hacer una nueva reestructura.' );
           // < RABA />
        end
        else ShowMessage('El crédito debe de estar activo');
     End Else Begin
        ShowMessage('Debe seleccionar una disposición');
     End;
end;

procedure TWCrCredito.Comisiones1Click(Sender: TObject);
begin
      ClassComisProg;
end;

procedure TWCrCredito.InterForma1AntesNuevo(Sender: TObject;  var Realizado: Boolean);
begin
     // RABA NOV 2014
     // CUANDO SE GENERA UNA NUEVA DISPOSICIÓN ESTA SE EVALUA SI SE QUEDA COMO RENOVACION VIGENTE O VENCIDA
     // AL TERMINAR LA CAPTURA LAS VARIABLES SE QUEDA CON LOS ULTIMOS VALORES POR LO QUE AL GENERAR UNA
     // NUEVA DISPOSICIÓN SE DEBEN RETORNAR LOS NUEVOS VALORES HASTA QUE NO SE DETERMINE LO CONTRARIO
     IF (Objeto.VGTIPO_DISPOSICION='RE') and (Objeto.vgDispRen) THEN
     begin
       Objeto.VGTIPO_DISPOSICION := 'DI';
       Objeto.TIPO_DISPOSICION.AsString := 'DI';
       Objeto.vgDispRen := False;
     end;
     // FIN RABA
     AjustaControles(Objeto.VGTIPO_DISPOSICION,'A');
end;

procedure TWCrCredito.ClassAdmonTasa;
Var InfAdicTasas : TCrInAdTa;
begin
   if Objeto.Active then
   Begin
      InfAdicTasas := TCrInAdTa.Create(Self);
      try
        InfAdicTasas.Apli := Objeto.Apli;
        InfAdicTasas.ParamCre:=Objeto.ParamCre;
        Objeto.BasicCred.LlenaDatos(Objeto.ID_CREDITO.AsInteger);
        InfAdicTasas.BasicCred := Objeto.BasicCred;
        InfAdicTasas.vgCredito :=Objeto.ID_CREDITO.AsString;
        InfAdicTasas.vgContrato :=Objeto.ID_CONTRATO.AsString;
        InfAdicTasas.vgproducto :=Objeto.ContratoCre.CVE_PRODUCTO_CRE.AsString;
        InfAdicTasas.vgDescProducto :=Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.AsString;

        IF ( Objeto.CVE_TASA_REFER.AsString <> CNULL ) AND
           ( Objeto.CVE_TASA_REFER.AsString <> C_TASA_FIJA )  THEN
           InfAdicTasas.vgTasaCredito := Objeto.SOBRETASA.AsFloat + StrToFloat(ValorTasa(Objeto.CVE_TASA_REFER.AsString))
        ELSE
           InfAdicTasas.vgTasaCredito := Objeto.TASA_CREDITO.AsFloat;

        InfAdicTasas.FindKey([Objeto.ID_CREDITO.AsString]);
        if Objeto.vgModTasa then
           InfAdicTasas.Catalogo
        else
           InfAdicTasas.Consulta;
        Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
      finally
             InfAdicTasas.Free;
             Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
            IF ( Objeto.CVE_TASA_REFER.AsString <> CNULL ) AND
               ( Objeto.CVE_TASA_REFER.AsString <> C_TASA_FIJA )  THEN
               edVALOR_TASA.Text := ValorTasa(Objeto.CVE_TASA_REFER.AsString)
            else
            Begin
               if Objeto.OPERADOR_STASA.AsString = '+' then
                  edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat - Objeto.SOBRETASA.AsFloat )
               else if Objeto.OPERADOR_STASA.AsString = '-' then
                  edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat + Objeto.SOBRETASA.AsFloat )
               else if Objeto.OPERADOR_STASA.AsString = '*' then
                  edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat / Objeto.SOBRETASA.AsFloat )
               else if Objeto.OPERADOR_STASA.AsString = '/' then
                  edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat * Objeto.SOBRETASA.AsFloat )
               else
                  edVALOR_TASA.Text := FloatToStr( Objeto.TASA_CREDITO.AsFloat - Objeto.SOBRETASA.AsFloat );
            end;
      end;
   end;
end;

procedure TWCrCredito.AdministracinTasas1Click(Sender: TObject);
begin
   ClassAdmonTasa;
end;

procedure TWCrCredito.edNUM_FOL_FIDEICOMExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edNUM_FOL_FIDEICOM,True,'',True);
end;

procedure TWCrCredito.btTX_XOMENTARIOSClick(Sender: TObject);
Var TxComent : TCrTxComen;
begin
   if Objeto.ValidaAccesoEsp('TCRCREDITO_COMEN',True,True) then
   begin
     if Objeto.Active then
     Begin
        TxComent := TCrTxComen.Create(Self);
        try
          TxComent.Apli := Objeto.Apli;
          Objeto.BasicCred.LlenaDatos(Objeto.ID_CREDITO.AsInteger);
          TxComent.BasicCred := Objeto.BasicCred;
          TxComent.Catalogo
        finally
               TxComent.Free;
        end;
     end;
   end;
end;

procedure TWCrCredito.ShowChequera(pAlta: Boolean);
Var CreCheque  : TCrCreChe;
    vlTipoAcred,vlCveSubDiv,vlTipoCheq,
    vlChqra: String;
    vlBcoChqra, vlDisp: Integer;
begin
   if Objeto.Active then
   Begin
      vlTipoCheq  := C_ADMIN;
      vlCveSubDiv := '0';  //NO DEHJAR CODIGO DURO (MODIFICAR)
      vlTipoAcred := C_ACRED;
      vlDisp      := Objeto.ID_CREDITO.AsInteger;
      ObtenChequeras(Objeto.ContratoCre.Contrato.ID_Titular.AsInteger,
                     vlDisp,vlCveSubDiv, vlTipoAcred,vlTipoCheq,C_CARGO, Objeto.Apli ,vlBcoChqra, vlChqra);
      CreCheque := TCrCreChe.Create(Self);
      try
        CreCheque.GetParams(Objeto);
        CreCheque.ParamCre:=Objeto.ParamCre;
        CreCheque.VG_ACREDITADO := Objeto.ContratoCre.Contrato.ID_Titular.AsString;
        CreCheque.VG_MONEDA     := Objeto.ContratoCre.CVE_MONEDA.AsString;
        CreCheque.VG_DISPOSICION:= IntToStr(vlDisp);
        CreCheque.VG_TIPO_ACRED := vlTipoAcred;
        CreCheque.VG_SUB_DIV    := vlCveSubDiv;
        CreCheque.VG_TIP_CHEQ   := vlTipoCheq;
        CreCheque.VG_BCO_CHQ    := IntToStr(vlBcoChqra);
        CreCheque.VG_CHEQRA     := vlChqra;
        CreCheque.VG_B_DISP_CHQ := pAlta;
        if pAlta then Begin
           CreCheque.Nuevo;
        end
        else Begin
          CreCheque.Catalogo;
        end;
      finally
             CreCheque.Free;
      end;
   end;
end;

// SATV4766
Procedure TWCrCredito.ActivaControlesAmortizacion(peBActiva : Boolean);
begin
 With Objeto Do
   If ((Modo = moEdit) Or (Modo = moAppend)) Then
   Begin
       If Not (peBActiva) Then
       Begin
          // Tipo de Amortización
          edCVE_AMORTIZACION.Enabled := False;
          edCVE_AMORTIZACION.Color   := clBtnFace;
          edCVE_AMORTIZACION.ReadOnly := True;
          btTIPO_AMORT.Enabled := False;
          // Pago de Intereses
          edCVE_PAG_INTERES.Enabled  := False;
          edCVE_PAG_INTERES.Color    := clBtnFace;
          edCVE_PAG_INTERES.ReadOnly := True;
          btPAGO_INT.Enabled         := False;
          // U. Tiempo Interés
          cbUNIDAD_TIEMPO_IN.Enabled  := False;
          bbUNIDAD_TIEMPO_IN.Enabled  := False;
          // No Unidades
          edNUM_UNIDADES_IN.Enabled  := False;
          edNUM_UNIDADES_IN.Color    := clBtnFace;
          edNUM_UNIDADES_IN.ReadOnly := True;
          // Día Pago
          cbDIA_PAGO_INT.Enabled  := False;
          cbDIA_PAGO_INT.Color    := clBtnFace;
          cbDIA_PAGO_INT.ReadOnly := True;
          // F Primer Pago
          edF_INI_PAG_INT.Enabled   := False; //019
          edF_INI_PAG_INT.Color     := clBtnFace;//019
          edF_INI_PAG_INT.ReadOnly  := True;//019
          dtpF_INI_PAG_INT.Enabled  := False;
       end
       else
       Begin
          // Tipo de Amortización
          edCVE_AMORTIZACION.Enabled := True;
          edCVE_AMORTIZACION.Color   := clWindow;
          edCVE_AMORTIZACION.ReadOnly := False;
          btTIPO_AMORT.Enabled := True;
          // Pago de Intereses
          edCVE_PAG_INTERES.Enabled  := True;
          edCVE_PAG_INTERES.Color    := clWindow;
          edCVE_PAG_INTERES.ReadOnly := False;
          btPAGO_INT.Enabled         := True;
          // U. Tiempo Interés
          cbUNIDAD_TIEMPO_IN.Enabled  := True;
          bbUNIDAD_TIEMPO_IN.Enabled  := True;
          // No Unidades
          edNUM_UNIDADES_IN.Enabled  := True;
          edNUM_UNIDADES_IN.Color    := clWindow;
          edNUM_UNIDADES_IN.ReadOnly := False;
          // Día Pago
          cbDIA_PAGO_INT.Enabled  := True;
          cbDIA_PAGO_INT.Color    := clWindow;
          cbDIA_PAGO_INT.ReadOnly := False;
          // F Primer Pago
          edF_INI_PAG_INT.Enabled   := True; //019
          edF_INI_PAG_INT.Color     := clWindow;  //019
          edF_INI_PAG_INT.ReadOnly  := False;//019
          dtpF_INI_PAG_INT.Enabled  := True;
      End;
   end;
end;

Procedure TWCrCredito.AsignaValoresPagoEquivalente;
begin
 With Objeto Do
  If ((Modo = moEdit) Or (Modo = moAppend)) Then
      Begin
      CVE_AMORTIZACION.AsInteger := 1;
      CVE_PAG_INTERES.AsInteger  := 3;
      End; 
end;

Procedure TWCrCredito.TipoPagoAUsar;
begin
 With Objeto Do
  If ((Modo = moEdit) Or (Modo = moAppend)) Then
   Begin
    // Si utiliza el Método de "Pago Tradicional"
    If (ContratoCre.Producto.CVE_GEN_TIP_PAG.AsString = CPAGTRA) Then
       Begin
       ActivaControlesAmortizacion(True);
       End
    // De lo contrario... Si utiliza el Método de "Pago Equivalente"
    Else If (ContratoCre.Producto.CVE_GEN_TIP_PAG.AsString = CPAGNIV) Then
       Begin
       AsignaValoresPagoEquivalente;
       ActivaControlesAmortizacion(False);
       End;
   End;
end;

Procedure TWCrCredito.ActualizaValoresPagoEquivalente;
begin
 With Objeto Do
   If (Modo = moAppend) Or (Modo = moEdit) Then
    // Si utiliza el Método de "Pago Equivalente"   
    If (ContratoCre.Producto.CVE_GEN_TIP_PAG.AsString = CPAGNIV) Then
      Begin
      // Si utiliza el Método de "Pago Equivalente"
      UNIDAD_TIEMPO_CP.GetFromControl;
      NUM_UNIDADES_CP.GetFromControl;
      DIA_PAGO_CAP.GetFromControl;
      F_INI_PAG_CAP.GetFromControl;
      // Iguala la selección realizada en la Amortización de "Capital" con los campos de "Interés"
      UTiempoInt.FindKey([UNIDAD_TIEMPO_CP.AsString]);
      NUM_UNIDADES_IN.AsInteger  := NUM_UNIDADES_CP.AsInteger;
      DIA_PAGO_INT.AsInteger     := DIA_PAGO_CAP.AsInteger;
      If (Trim(edF_INI_PAG_CAP.Text) <> '') Then
       F_INI_PAG_INT.AsDateTime   := F_INI_PAG_CAP.AsDateTime;
      End;
end;

procedure TWCrCredito.ChequerasClick(Sender: TObject);
begin
   if MessageDlg('¿La Disposición se relaciona con alguna Chequera?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      ShowChequera(True)
   else
      ShowChequera(False);
end;

{LOLS 18/11/2005 SE AGREGA EL LLAMADO A LA SOLICITUD DE GARANTIAS NAFIN}
procedure TWCrCredito.GarantiaNafin1Click(Sender: TObject);
var CrSoGtNa  : TCrSoGtNa;
begin
  if Objeto.Active then
  begin
    CrSoGtNa :=  TCrSoGtNa.Create(self);
    try
      CrSoGtNa.Apli        := Objeto.Apli;
      CrSoGtNa.ParamCre    := Objeto.ParamCre;
      CrSoGtNa.vgIdCredito := Objeto.ID_CREDITO.AsInteger;
      CrSoGtNa.Catalogo;
    finally
      CrSoGtNa.Free;
    end;
  end else
    ShowMessage('Debe seleccionar una disposición');
  //ends_if
end;
{/LOLS}




procedure TWCrCredito.btCVE_TIPO_BAJAClick(Sender: TObject);
Var T : TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRCREDITO_TPLQU',True,True) then
   begin
      With Objeto Do
        begin
          T := CreaBuscador('ICrCoCD.it','I');
          T.WhereString := ' CVE_CON_GPO_CAT = ''CAT_TIPO_LIQUIDA''' ;
          T.ShowAll := True;
          Try
            If T.Execute Then
               Begin
                 CVE_TIPO_BAJA.AsString := T.DameCampo(0);
                 edDESC_TIPO_BAJA.Text := T.DameCampo(1);
                 InterForma1.NextTab(btCVE_TIPO_BAJA);
               end;
          finally
            T.Free;
          end;
        end;
    end;
end;

procedure TWCrCredito.edCVE_TIPO_BAJAExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
        VLMsg    := '';
        VlSalida := True;
        InterForma1.ValidaExit(edCVE_TIPO_BAJA,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrCredito.edF_RESTRINGIDOExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      InterForma1.ValidaExit(edF_RESTRINGIDO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrCredito.TipoLiquidacin1Click(Sender: TObject);
var vlContinua  : Boolean;
    vlMsg       : String;
    CrTiBa      : TCrTiBa;
    qyQuery     : TQuery;
    sSQL        : String;
Begin
   vlContinua := True;
   if Objeto.Active then
   begin
       if Objeto.SIT_CREDITO.AsString <> CSIT_LQ then
          ShowMessage('Para Actualizar este campo, la situación debe ser liquidada')
       else
       Begin
            CrTiBa  := TCrTiBa.Create(self);
            try
                CrTiBa.Apli := dmMain.apMain;
                CrTiba.VLIDCredito := Objeto.ID_CREDITO.AsInteger;
                CrTiba.VLTipoBaja := Objeto.CVE_TIPO_BAJA.AsString;
                CrTiBa.Catalogo;
                Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
                DeshabilitaBotonesXSit;
                ValidaUsuario; //EASA4011 26 ABRIL 2006 CORRECCION
                sSQL := 'SELECT DESC_CLAVE FROM CR_CON_CAT_DATA WHERE CVE_CON_GPO_CAT = ''CAT_TIPO_LIQUIDA'' AND CVE_CLAVE = ' + Objeto.CVE_TIPO_BAJA.AsSQL ;
                qyQuery:= GetSQLQuery(sSQL, Objeto.DataBaseName, Objeto.SessionName, False);
                try
                   If qyQuery <> Nil Then
                   Begin
                        edDESC_TIPO_BAJA.Text := qyQuery.FieldByName('DESC_CLAVE').AsString;
                   end;
                finally
                   qyQuery.Free;
                end;



            finally
                CrTiBa.Free;
            end;
       end;
   end;
end;

procedure TWCrCredito.ilCVE_TIPO_BAJAEjecuta(Sender: TObject);
Var qyQuery : TQuery;
    sSQL    : String;
begin
     with Objeto do
     begin
         CVE_TIPO_BAJA.GetControl;
         edDESC_TIPO_BAJA.Text := '';
         sSQL := 'SELECT DESC_CLAVE FROM CR_CON_CAT_DATA WHERE CVE_CON_GPO_CAT = ''CAT_TIPO_LIQUIDA'' AND CVE_CLAVE = ' + Objeto.CVE_TIPO_BAJA.AsSQL ;
         qyQuery:= GetSQLQuery(sSQL, DataBaseName, SessionName, False);
         try
            If qyQuery <> Nil Then
            Begin
                 edDESC_TIPO_BAJA.Text := qyQuery.FieldByName('DESC_CLAVE').AsString;
            end;
         finally
            qyQuery.Free;
         end;
     end;
end;

procedure TCrCredito.Inicializa_EsOpEv_LC;
Var
    qyQuery : TQuery;
    sSQL    : String;
begin
      // </INICIO> JJAR 24/03/2010 MODIFICACION PARA RECUPERAR LOS REGISTROS DE CR_RR_CREDITO : SE INICIALIZARÁ LA VG_OpEv_LC
      // y   VGFOL_GRUPO_RENUEVA
      sSQL := ' SELECT FOL_GRUPO_RENUEVA, ID_CRED_RENOVADO,  ID_CRED_RENUEVA, TIPO_DISPOSICION  FROM CR_RR_CREDITO ' +
              ' WHERE ID_CRED_RENUEVA = ' + IntToStr(ID_CREDITO.AsInteger) +  ' ORDER BY FOL_GRUPO_RENUEVA DESC ';
      qyQuery:= GetSQLQuery(sSQL, DataBaseName, SessionName, False);

      If qyQuery <> Nil Then
         VG_OpEv_LC := (qyQuery.FieldByName('TIPO_DISPOSICION').AsString = 'LC')
      else
         VG_OpEv_LC := False;

      if VG_OpEv_LC then
         VGFOL_GRUPO_RENUEVA := qyQuery.FieldByName('FOL_GRUPO_RENUEVA').AsInteger;
      // < FIN/> JJAR 24/03/2010

end;

procedure TWCrCredito.EliminarOperativa1Click(Sender: TObject);
begin
     Objeto.MFiraOpe.Active:=False;
     Objeto.CVE_OPERATIVA.AsString := '';
end;

procedure TWCrCredito.M1Click(Sender: TObject);
Var CrConfMor : TCrConfMor;
begin
   if Objeto.Active then
      Begin
            CrConfMor := TCrConfMor.Create(self);
            try
               CrConfMor.Apli:=Objeto.Apli;
               CrConfMor.vgIdCredito := Objeto.ID_CREDITO.AsInteger;
               CrConfMor.Catalogo;
            finally
                   CrConfMor.Free;
            end;
       end
   else ShowMessage('Debe de seleccionar una Disposición.');
end;

function TWCrCredito.ValidaTipoRenueva: Integer;
var
    vlResultado : Integer;
    vlSQL       : String;
    qyQueryHay  : TQuery;
    qyQueryCred : TQuery;
begin
  vlResultado := 0;

  vlSQL := ' SELECT COUNT(*) HAY FROM CR_RR_CREDITO ' +
           '  WHERE ID_CRED_RENOVADO = '  + objeto.ID_CREDITO.AsString +
           //'    AND TIPO_DISPOSICION = ''RS'' ' +   //RABA FEB 2015 DEBE SER PARA CUALQUIER PROCESO RS, RE O LC
           '    AND SIT_RENUEVA <> ''CA'' ';
  qyQueryHay := GetSQLQuery(vlSQL, Objeto.DataBaseName, Objeto.SessionName, False);
  try
     If qyQueryHay <> Nil Then
       If qyQueryHay.FieldByName('HAY').AsInteger = 0 then
          vlResultado := 0
       Else
       begin
         vlSQL := ' SELECT ID_CRED_RENUEVA FROM CR_RR_CREDITO ' +
                  '  WHERE ID_CRED_RENOVADO = '  + objeto.ID_CREDITO.AsString +
                  //'    AND TIPO_DISPOSICION = ''RS'' ' +    //RABA FEB 2015 DEBE SER PARA CUALQUIER PROCESO RS, RE O LC
                  '    AND SIT_RENUEVA <> ''CA'' ';
         qyQueryCred := GetSQLQuery(vlSQL, Objeto.DataBaseName, Objeto.SessionName, False);

         vlResultado := qyQueryCred.FieldByName('ID_CRED_RENUEVA').AsInteger;
       end;
  finally
    if qyQueryHay  <> nil then qyQueryHay.Free;
    if qyQueryCred <> nil then qyQueryCred.Free;
  end;


  ValidaTipoRenueva := vlResultado;
end;

// </ RABA > SEP 2011
// SE LLAMA ESTE PROCEDIMIENTO DESPUES DE AUTORIZAR UNA DISPOSICIÓN
// PARA VALIDAR SI EL REDESCUENTO ESTA AUTORIZADO
procedure TWCrCredito.RevisaAutRedescuento;
var
  sSQL    : String;
  qyQuery : TQuery;
begin
  sSQL:= 'SELECT COUNT(*) REDESCUENTO_NA FROM CR_FND_CREDITO '+
         ' WHERE ID_CREDITO ='+ Objeto.ID_CREDITO.AsSQL +
         '   AND SIT_CREDITO = ''NA'' ';

  qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
  If qyQuery <> Nil Then
  begin
    if qyQuery.FieldByName('REDESCUENTO_NA').AsInteger > 0 then
       ShowMessage('No se autorizó el Redescuento, favor de revisar.');
    qyQuery.Close;
    qyQuery.Free;
  End;
end;

procedure TWCrCredito.cbCVE_CALIDAD_GTIAExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.TIPO_DISPOSICION.GetFromControl;
      Objeto.CVE_CALIDAD_GTIA.GetFromControl;
      if ((Objeto.TIPO_DISPOSICION.AsString='RE') OR (Objeto.TIPO_DISPOSICION.AsString='RS')) AND (Objeto.CVE_CALIDAD_GTIA.AsString = '') then
      Begin
         VLMsg := 'Favor de Indicar el Tipo de Garantía';
         VlSalida   := False;
      end;
      InterForma1.ValidaExit(cbCVE_CALIDAD_GTIA,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrCredito.edID_CREDITOChange(Sender: TObject);
begin
   MuestraValidaRSRE;
end;

procedure TWCrCredito.btValidaRSREClick(Sender: TObject);
begin
   if (Trim(edID_CREDITO.Text)<>'') AND (Trim(edID_CREDITO.Text)<>'0') then
   begin
       if (Objeto.StpValidaRSRE(StrToInt(edID_CREDITO.Text)) = True) then
          ShowMessage('Las condiciones son Correctas');
   end;
end;

procedure TWCrCredito.chB_INT_DIASIGExit(Sender: TObject);
var  VLSalida, vlEnc  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMsg     := '';
      VlSalida  := True;
      if chB_INT_DIASIG.Checked then
      begin
        Objeto.CVE_CALCULO.GetFromControl;
        vlEnc:=Objeto.CalcInt.FindKey([Objeto.CVE_CALCULO.asString]);
        if vlEnc then
        Begin
           if Trim(Objeto.CalcInt.B_INT_DIASIG.AsString) <> 'V' then
           begin
              VLMsg := 'El tipo de Cálculo de Interés no soporta la Modalidad de Día Siguiente';
              VlSalida   := False;
              chB_INT_DIASIG.Checked:=false;
              ShowMessage(VLMsg);
           end;
        end; //end if
      end;  
      InterForma1.ValidaExit(chB_INT_DIASIG,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrCredito.ClassCambioTasa;
Var CambioTasa : TCrCamTasM;
begin
   if Objeto.Active then
   Begin
      CambioTasa := TCrCamTasM.Create(Self);
      try
        CambioTasa.Apli := Objeto.Apli;
        CambioTasa.ParamCre:=Objeto.ParamCre;
        Objeto.BasicCred.LlenaDatos(Objeto.ID_CREDITO.AsInteger);
        CambioTasa.BasicCred := Objeto.BasicCred;
        CambioTasa.vgCredito :=Objeto.ID_CREDITO.AsString;
        CambioTasa.Catalogo;
      finally
        CambioTasa.Free;
        Objeto.FindKey([Objeto.ID_CREDITO.AsString]);
      end;
   end;

end;

procedure TWCrCredito.CambiodeTasa1Click(Sender: TObject);
begin
  ClassCambioTasa;
end;

function TWCrCredito.HayVencidos(Folio_grupo :String):Boolean;
var vlSql : String;
    vlHayVencidos : Integer;
    vlHayRsReVen  : Integer;
    vlResult      : Boolean;
Begin
    vlResult := False;

    vlsql:= 'SELECT COUNT(*) HAY_VENCIDOS FROM CR_RR_CREDITO WHERE FOL_GRUPO_RENUEVA = ' +
             Folio_grupo +
             ' AND B_GEN_TRASVEN =''V''';
    GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'HAY_VENCIDOS', vlHayVencidos,False);
    if vlHayVencidos > 0 then
       vlResult := True
    else
       vlResult := False;

    if not vlResult then
    begin
      vlsql := 'SELECT COUNT(*) VLHAYRSREVEN  ' + coCRLF +
               'FROM ( ' + coCRLF +
               'SELECT CR.ID_CREDITO ' + coCRLF +
               'FROM CR_CREDITO CR, CR_RR_CREDITO RR ' + coCRLF +
               'WHERE CR.ID_CRE_RENOVADO = RR.FOL_GRUPO_RENUEVA ' + coCRLF +
               '  AND RR.SIT_RENUEVA = ''AC'' ' + coCRLF +
               '  AND CR.ID_CONTRATO = ' + Objeto.ID_CONTRATO.AsString + coCRLF +
               '  AND CR.SIT_CREDITO = ''AC'' ' + coCRLF +
               '  AND CR.F_TRASPASO_VENC IS NOT NULL ' + coCRLF +
               '  AND CR.CVE_TIP_TRAS_VENC = ''RR'' ' + coCRLF +
               '  AND RR.PCT_LINEA >= (SELECT PCT_LIN_RSRE_VEN FROM CR_PARAM_TRASCAR WHERE CVE_PAR_TRASCAR = ''CRE'') ' + coCRLF +
               'UNION ' + coCRLF +
               'SELECT RSRE.ID_CREDITO ' + coCRLF +
               'FROM CR_CREDITO CR, CR_RR_CREDITO RR, CR_CREDITO RSRE ' + coCRLF +
               'WHERE 1=1 ' + coCRLF +
               '  AND CR.ID_CREDITO = RR.ID_CRED_RENOVADO ' + coCRLF +
               '  AND RR.ID_CRED_RENUEVA = RSRE.ID_CREDITO ' + coCRLF +
               '  AND CR.ID_CONTRATO = ' + Objeto.ID_CONTRATO.AsString + coCRLF +
               '  AND RR.SIT_RENUEVA = ''AC'' ' + coCRLF +
               '  AND RSRE.CVE_TIP_TRAS_VENC = ''RR'' ' + coCRLF +
               '  AND (CASE WHEN RSRE.SIT_CREDITO = ''LQ'' THEN NULL ELSE RSRE.F_TRASPASO_VENC END) IS NOT NULL ' + coCRLF +
               '  AND RR.PCT_LINEA >= (SELECT PCT_LIN_RSRE_VEN FROM CR_PARAM_TRASCAR WHERE CVE_PAR_TRASCAR = ''CRE'')  ' + coCRLF +
               ') ';

      GetSQLInt(vlsql,Objeto.DataBaseName,Objeto.SessionName,'VLHAYRSREVEN',vlHayRsReVen,True);
      if vlHayRsReVen > 0 then
         vlResult := True
      else
         vlResult := False;
    end;

    HayVencidos := vlResult;
end;

procedure TWCrCredito.EvaluaNuevaDisp;
var vlSql    : String;
    vlSql2   : String;
    vlHayImpagos  : Integer;
    vlHayRsReVen  : Integer;
    vlHayVencidos : Integer;
    vlPctLinRsReVen : Real;
begin
  edTIPO_CARTERA.Text := 'VIGENTE';

  vlSql2 := 'SELECT COUNT(*) VLHAYRSREVEN  ' + coCRLF +
            'FROM ( ' + coCRLF +
            'SELECT CR.ID_CREDITO ' + coCRLF +
            'FROM CR_CREDITO CR, CR_RR_CREDITO RR ' + coCRLF +
            'WHERE CR.ID_CRE_RENOVADO = RR.FOL_GRUPO_RENUEVA ' + coCRLF +
            '  AND RR.SIT_RENUEVA = ''AC'' ' + coCRLF +
            '  AND CR.ID_CONTRATO = ' + Objeto.ID_CONTRATO.AsString + coCRLF +
            '  AND CR.SIT_CREDITO = ''AC'' ' + coCRLF +
            '  AND CR.F_TRASPASO_VENC IS NOT NULL ' + coCRLF +
            '  AND CR.CVE_TIP_TRAS_VENC = ''RR'' ' + coCRLF +
            '  AND RR.PCT_LINEA >= (SELECT PCT_LIN_RSRE_VEN FROM CR_PARAM_TRASCAR WHERE CVE_PAR_TRASCAR = ''CRE'') ' + coCRLF +
            'UNION ' + coCRLF +
            'SELECT RSRE.ID_CREDITO ' + coCRLF +
            'FROM CR_CREDITO CR, CR_RR_CREDITO RR, CR_CREDITO RSRE ' + coCRLF +
            'WHERE 1=1 ' + coCRLF +
            '  AND CR.ID_CREDITO = RR.ID_CRED_RENOVADO ' + coCRLF +
            '  AND RR.ID_CRED_RENUEVA = RSRE.ID_CREDITO ' + coCRLF +
            '  AND CR.ID_CONTRATO = ' + Objeto.ID_CONTRATO.AsString + coCRLF +
            '  AND RR.SIT_RENUEVA = ''AC'' ' + coCRLF +
            '  AND RSRE.CVE_TIP_TRAS_VENC = ''RR'' ' + coCRLF +
            '  AND (CASE WHEN RSRE.SIT_CREDITO = ''LQ'' THEN NULL ELSE RSRE.F_TRASPASO_VENC END) IS NOT NULL ' + coCRLF +
            '  AND RR.PCT_LINEA >= (SELECT PCT_LIN_RSRE_VEN FROM CR_PARAM_TRASCAR WHERE CVE_PAR_TRASCAR = ''CRE'')  ' + coCRLF +
            ') ';
  GetSQLInt(vlSql2,Objeto.DataBaseName,Objeto.SessionName,'VLHAYRSREVEN',vlHayRsReVen,True);

  vlSql := 'SELECT NVL(MAX(IMPAGO.TOTAL),0) HAY_IMPAGOS ' + coCRLF +
           'FROM ' + coCRLF +
           ' (SELECT CRE.ID_CREDITO, COUNT(*) TOTAL ' + coCRLF +
           '    FROM CR_CAPITAL CP, CR_CREDITO CRE ' + coCRLF +
           '    WHERE CP.ID_CREDITO = CRE.ID_CREDITO ' + coCRLF +
           '      AND CRE.SIT_CREDITO = ''AC'' ' + coCRLF +
           '      AND CP.SIT_CAPITAL = ''IM'' ' + coCRLF +
           '      AND CRE.ID_CONTRATO = ' + Objeto.ID_CONTRATO.AsString + coCRLF +
           '    GROUP BY CRE.ID_CREDITO ' + coCRLF +
           '   UNION ' + coCRLF +
           '    SELECT CRE.ID_CREDITO, COUNT(*) TOTAL ' + coCRLF +
           '    FROM CR_FINAN_ADIC FN, CR_CREDITO CRE ' + coCRLF +
           '    WHERE FN.ID_CREDITO = CRE.ID_CREDITO ' + coCRLF +
           '      AND CRE.SIT_CREDITO = ''AC'' ' + coCRLF +
           '      AND FN.SIT_FINAN_ADIC = ''IM'' ' + coCRLF +
           '      AND CRE.ID_CONTRATO = ' + Objeto.ID_CONTRATO.AsString + coCRLF +
           '    GROUP BY CRE.ID_CREDITO  ' + coCRLF +
           '   UNION ' + coCRLF +
           '    SELECT CRE.ID_CREDITO, COUNT(*) TOTAL ' + coCRLF +
           '    FROM CR_INTERES CI, CR_CREDITO CRE ' + coCRLF +
           '    WHERE CI.ID_CREDITO = CRE.ID_CREDITO ' + coCRLF +
           '      AND CRE.SIT_CREDITO = ''AC'' ' + coCRLF +
           '      AND CI.SIT_INTERES = ''IM'' ' + coCRLF +
           '      AND CRE.ID_CONTRATO = ' + Objeto.ID_CONTRATO.AsString + coCRLF +
           '    GROUP BY CRE.ID_CREDITO) IMPAGO ' + coCRLF;

  GetSQLInt(vlSql,Objeto.DataBaseName,Objeto.SessionName,'HAY_IMPAGOS',vlHayImpagos,True);

  If vlHayImpagos > 0 Then
  begin
    Objeto.TIPO_DISPOSICION.AsString := 'RE';
    Objeto.VGTIPO_DISPOSICION := 'RE';
    Objeto.vgDispRen := True;

    vlSql := 'SELECT COUNT(*) HAYVENCIDOS ' + coCRLF +
             'FROM (SELECT ID_CREDITO, PKGCRTRASCARTERA.FUNISVENCIDO(ID_CREDITO, TO_DATE('''+
                    FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresa) + ''',''DD/MM/YYYY''), ''F'', NULL) ESVENCIDO ' + coCRLF +
             '      FROM CR_CREDITO ' + coCRLF +
             '      WHERE ID_CONTRATO = ' + Objeto.ID_CONTRATO.AsString + coCRLF +
             '        AND SIT_CREDITO = ''AC'') C ' + coCRLF +
             'WHERE C.ESVENCIDO = ''V'' ' + coCRLF;
    GetSQLInt(vlSql,Objeto.DataBaseName,Objeto.SessionName,'HAYVENCIDOS',vlHayVencidos,True);

    If vlHayVencidos > 0 then
    begin
       ShowMessage('La nueva disposición es una RENOVACIÓN VENCIDA');
       edTIPO_CARTERA.Text := 'VENCIDO';
       Objeto.vgNewDispVenc := True;
    end
    else
    begin
       ShowMessage('La nueva disposición es una RENOVACIÓN VIGENTE');
       edTIPO_CARTERA.Text := 'VIGENTE';
       Objeto.vgNewDispVenc := False;
    end;
  end
  else
  begin
    if vlHayRsReVen > 0 then
    begin
       vlSql := 'SELECT PCT_LIN_RSRE_VEN FROM CR_PARAM_TRASCAR WHERE CVE_PAR_TRASCAR = ''CRE'' ';
       GetSQLFloat(vlSql,Objeto.DataBaseName,Objeto.SessionName,'PCT_LIN_RSRE_VEN',vlPctLinRsReVen,True );

       ShowMessage('La nueva disposición debe nacer en cartera vencida por efecto de una reestructura o ' + chr(13) +
                   'renovación vencida con importe mayor al ' + FloatToStr(vlPctLinRsReVen) + ' del importe dispuesto de la línea de crédito.');
       edTIPO_CARTERA.Text := 'VENCIDO';
       Objeto.vgNewDispVenc := True;
    end;
  end;
end;

procedure TCrCredito.StpValidaVencido(pIdCredito, pFolGpoRenovac: Integer);
var   sptValidaVencido : TStoredProc;
      vlResultado : Boolean;
Begin
   vlResultado := True;
   try
     sptValidaVencido := TStoredProc.Create(Self);
     with sptValidaVencido do
     begin
        sptValidaVencido.DatabaseName:= Apli.DatabaseName;
        sptValidaVencido.SessionName:= Apli.SessionName;
        sptValidaVencido.StoredProcName:= 'PKGCRTRASCARTERA.STPVALIDAVENCIDO';
        Params.Clear;
        Params.CreateParam(ftInteger, 'PEFOLGRUPO',    ptInput);
        Params.CreateParam(ftInteger, 'PENEWIDCRED',   ptInput);
        Params.CreateParam(ftDate,    'PEFCIERRE',     ptInput);
        Params.CreateParam(ftString,  'PECVEUSUARIO',  ptInput);
        Params.CreateParam(ftString,  'PEBCOMMIT',     ptInput);
        Params.CreateParam(ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam(ftString,  'PSTXRESULTADO', ptOutput);
        Prepare;
        ParamByName('PEFOLGRUPO').AsInteger   :=  pFolGpoRenovac;
        ParamByName('PENEWIDCRED').AsInteger  :=  pIdCredito;
        ParamByName('PEFCIERRE').AsDate       :=  F_INICIO.AsDateTime;
        ParamByName('PECVEUSUARIO').AsString  :=  CVE_USU_ALTA.AsString;
        ParamByName('PEBCOMMIT').AsString     :=  CVE_USU_ALTA.AsString;

        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           ShowMessage( IntToStr(ParamByName('psRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
           GenMsg('Disposición' + IntToStr(pIdCredito) +
                  'Desc: [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                  ParamByName('psTxResultado').AsString,Apli);
        end;
     end;
   finally
      sptValidaVencido.Free;
   end;
end;

Function TCrCredito.ObtenAdeudoCred(IdCredito: Integer; vlfecha: string): Double;
var
  STPAdeudoCredito : TStoredProc;
  vlResultado : Double;
begin
  vlResultado := 0;

  STPAdeudoCredito := TStoredProc.Create(Self);
  try
     with STPAdeudoCredito do
     begin
        STPAdeudoCredito.DatabaseName:= Apli.DatabaseName;
        STPAdeudoCredito.SessionName:= Apli.SessionName;
        STPAdeudoCredito.StoredProcName:='PKGCRCREDITO.STPADEUDOCREDITO';
        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftInteger, 'PEIDCREDITO',   ptInput);
        Params.CreateParam(ftString,  'PEFECHACIERRE', ptInput);
        Params.CreateParam(ftString,  'PEBMORAS', ptInput);
        Params.CreateParam(ftString,  'PEBCONCEPTOS', ptInput);
        Params.CreateParam(ftString,  'PEBCONIVA', ptInput); //FJR 19.09.2012 Adecuacion de bandera para calcular con Iva
        Params.CreateParam(ftFloat,   'PSADEUDO',      ptOutput);
        Params.CreateParam(ftFloat,   'PSINTERES',     ptOutput);
        Params.CreateParam(ftFloat,   'PSADEUDOVDO',      ptOutput);
        Params.CreateParam(ftFloat,   'PSINTERESVDO',     ptOutput);
        Params.CreateParam(ftFloat,   'PSPREPAGOSCAPITAL',     ptOutput);
        Params.CreateParam(ftInteger, 'PSRESULTADO',   ptOutput);
        Params.CreateParam(ftString,  'PSTXRESULTADO', ptOutput);

        // Se asignan parámetros
        ParamByName('peIdCredito').AsInteger  := IdCredito;
        ParamByName('peFechaCierre').AsString := vlfecha;
        ParamByName('peBMoras').AsString := 'V';
        ParamByName('peBConceptos').AsString := 'V';
        ParamByName('peBConIva').AsString := 'V';  //FJR 19.09.2012 Adecuacion de bandera para calcular con Iva

        ExecProc;

        If ParamByName('psResultado').AsInteger = 0 then
        begin
           vlResultado := ParamByName('psAdeudo').AsFloat +
                          ParamByName('psInteres').AsFloat +
                          ParamByName('psAdeudoVdo').AsFloat +
                          ParamByName('psInteresVdo').AsFloat +
                          ParamByName('psPrePAgosCapital').AsFloat;
        end
        else
        begin
          ShowMessage('Adeudo de crédito ' + IntToStr(IdCredito) + ', Error [ ' +
                      ParamByName('psRESULTADO').AsString + '] ' +
                      ParamByName('psTxResultado').AsString);
        end;
        UnPrepare;
     end;
  finally
     STPAdeudoCredito.Free;
  end;

  ObtenAdeudoCred := vlResultado;

end;

procedure TWCrCredito.EdF_FIN_PERGRA_FAExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   Objeto.F_FIN_PERGRA_FA.AsString:= EdF_FIN_PERGRA_FA.Text;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
        vlMsg := '';
        vlSalida := True;
        Objeto.F_FIN_PERGRA_FA.GetFromControl;
        if EdF_FIN_PERGRA_FA.Text <> '' then
        begin
           if Objeto.F_FIN_PERGRA_FA.AsDateTime > Objeto.F_VENCIMIENTO.AsDateTime then
           Begin
                 vlMsg := ' La fecha de fin de periodo de gracia de financiamiento adicional no puede ser mayor a la fecha de Vencimiento';
                 vlSalida := False;
           end;

           if Objeto.F_FIN_PERGRA_FA.AsDateTime < Objeto.F_INICIO.AsDateTime then
           Begin
                vlMsg := ' La fecha de fin de periodo de gracia de financiamiento adicional no puede ser menor a la fecha Inicio';
                vlSalida := False;
           end;

           if ValidaFecha(Objeto.F_FIN_PERGRA_FA.AsDateTime,Objeto.Apli) <> 0 then
           Begin
               vlMsg := ' ';
               if MessageDlg('La fecha de fin de periodo de gracia de financiamiento adicional es un día inhábil. ¿Desea Continuar?',
                 mtConfirmation, [mbYes, mbNo], 0) = mrNo then
               begin
                     vlMsg := ' La fecha de fin de periodo de gracia de financiamiento adicional es un día inhábil.';
                     vlSalida := False;
               end;
           End;
          end
        Else
          begin
               if chB_FINANC_ADIC.Checked = true then
                  if MessageDlg('Esta activada la opción de financiamiento adicional' + #13 +
                                '¿Deseas ingresar la fecha de fin del periodo de gracia' + #13 +
                                'del financiamiento adicional?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                  DtpF_FIN_PERGRA_FA.SetFocus;
        end;
   End;
   InterForma1.ValidaExit(EdF_FIN_PERGRA_FA,VLSalida,VlMsg,True);
end;

procedure TWCrCredito.chB_FINANC_ADICClick(Sender: TObject);
begin
 If Objeto.Modo <> moBrowse then
   begin
      If (chB_FINANC_ADIC.Checked) then
        begin
           EdF_FIN_PERGRA_FA.Enabled:= True;
           DtpF_FIN_PERGRA_FA.Enabled:= True;
        end
      else
        begin
           EdF_FIN_PERGRA_FA.Enabled:= False;
           EdF_FIN_PERGRA_FA.Text:= '';
           DtpF_FIN_PERGRA_FA.Enabled:= False;
      end;
 end;
end;

procedure TWCrCredito.DtpF_FIN_PERGRA_FAExit(Sender: TObject);
begin
  if  EdF_FIN_PERGRA_FA.Text <> '' then
      EdF_FIN_PERGRA_FAExit(Sender);
end;

end.

