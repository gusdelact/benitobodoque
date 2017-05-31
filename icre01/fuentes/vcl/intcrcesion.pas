// Sistema         : Clase de CR_CESION
// Fecha de Inicio : 01/07/2003
// Función forma   : Clase de CR_CESION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :     
// Comentarios     :   
Unit IntCrCesion;     
                           
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntCtoPanel, IntLinkit,

  //Unidades Adicionales
  IntCrCto, IntCrEmisor, IntCrEmiPro, IntCrLiqDis, IntParamCre, IntCrCredito,
  InterEdit, IntGenCre,IntMPers, Menus, IntCrProveed, IntCrCreChe
  //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
  , IntCrCalcInt, IntTasIndFin, IntCrUniTie, IntCrAmortiz, IntCrAcredit,
  IntMPersonal, IntCrProduct, IntMQrEmiPro, IntMQrEmiProVPN, IntPers
   //--END    DEINTEC.DF
   ;

CONST
  //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
  C_TRADICIONAL = 'TRA';//CVE_CAL_CAPITAL
  C_VPN         = 'VPN';//CVE_CAL_CAPITAL
  P_FISICA      = 'PF'; //CVE_PER_JURIDICA
  P_MORAL      = 'PM';  //CVE_PER_JURIDICA
  C_CES_AUTOR   = 'AU';//CVE_CESION_AUTORIZADA
  //--END    DEINTEC.DF

Type
 TCrCesion = class;
  TWCrCesion = Class(TForm)
    InterForma1             : TInterForma;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    lbUSUA_AUTOR: TLabel;
    lbF_AUTOR: TLabel;
    edF_ALTA: TEdit;
    edF_MODIF: TEdit;
    edCVE_USUA_ALTA: TEdit;
    edCVE_USUA_MODIF: TEdit;
    edCVE_USUA_AUTOR: TEdit;
    edF_AUTOR: TEdit;
    lbSITUACION: TLabel;
    lbSIT_CESION: TLabel;
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
    Label29: TLabel;
    icpCONTRATO: TInterCtoPanel;
    edID_CESION: TEdit;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    btCONTRATO: TBitBtn;
    edPRODUCTO: TEdit;
    edDESC_PRODUCTO: TEdit;
    btPROVEEDOR: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    edNOM_PROVEEDOR: TEdit;
    btEMISOR: TBitBtn;
    btLIQUIDACION: TBitBtn;
    edDESC_LIQUIDACION: TEdit;
    edID_EMISOR: TEdit;
    edCVE_LIQUIDACION: TEdit;
    edID_PROV_NAFINSA: TEdit;
    edNOMBRE_EMISOR: TEdit;
    edCVE_EMISOR_NAFIN: TEdit;
    lbCVE_EMISOR_NAFIN: TLabel;
    Label2: TLabel;
    chB_OPERADO_NAFIN: TCheckBox;
    chB_APLICA_COM: TCheckBox;
    Label1: TLabel;
    lbTX_INSTRUC_LIQ: TLabel;
    edTX_INSTRUC_LIQ: TEdit;
    ilEMISOR: TInterLinkit;
    ilPROVEEDOR: TInterLinkit;
    ilLIQUIDACION: TInterLinkit;
    ilCONTRATO: TInterLinkit;
    lbID_PROM_ADM: TLabel;
    edNOMBRE_PROM_ADM: TEdit;
    ilPROMADM: TInterLinkit;
    btPROM_ADM: TBitBtn;
    edID_PROM_ADM: TInterEdit;
    btDOCTO: TBitBtn;
    btAUTORIZA_CESION: TBitBtn;
    btOPERA_BLOQUE: TBitBtn;
    btCANCELA_CESION: TBitBtn;
    iedID_CONTRATO: TInterEdit;
    edPCT_COMISION: TInterEdit;
    GroupBox2: TGroupBox;
    edIMP_CESION: TInterEdit;
    lbIMP_DISPUESTO: TLabel;
    Label12: TLabel;
    iedDISPONIBLE_ACRED: TInterEdit;
    Label3: TLabel;
    iedDISPONIBLE_GRUPO_ECO: TInterEdit;
    Label4: TLabel;
    iedDISPONIBLE_AUT: TInterEdit;
    lbIMP_CESION: TLabel;
    Label6: TLabel;
    edIDISPONIBLE_PROV: TInterEdit;
    Label9: TLabel;
    edIMP_DISP_GPO_PROV: TInterEdit;
    edIMP_DISPUESTO: TInterEdit;
    pmEMISOR: TPopupMenu;
    Catlogo1: TMenuItem;
    ChequeraCargo1: TMenuItem;
    ChequeraLiquidacinCargo1: TMenuItem;
    RelacinEmisorProvedor1: TMenuItem;
    Bevel2: TBevel;
    edID_PROVEEDOR: TEdit;
    rgCVE_TIPO_INTERES: TRadioGroup;
    pmPROVEEDOR: TPopupMenu;
    Catlogo2: TMenuItem;
    CatlogoRelacinEmisorProveedor1: TMenuItem;
    ChequeraAdministradorAbono1: TMenuItem;
    ChequeraLiquidacinAbono1: TMenuItem;
    Label13: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    edDISP_PROV_PJ: TInterEdit;
    edDISP_PCT_PRO_SEC: TInterEdit;
    edDISP_PROV_SEC: TInterEdit;
    Label14: TLabel;
    edCVE_FND_ENT_DES: TEdit;
    Autorizacin1: TMenuItem;
    CarteraImpagada1: TMenuItem;
    MErrores: TMemo;
    //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
    gbDataCalc: TGroupBox;
    textCalInt: TLabel;
    textRefer: TLabel;
    textTimeRevTas: TLabel;
    textTypeAmort: TLabel;
    textTimeAmort: TLabel;
    edCVE_CALCULO: TEdit;
    btCALC_INT: TBitBtn;
    edDESC_CALC_INT: TEdit;
    edCVE_TASA_REFER: TEdit;
    edDESC_TASA_REFER: TEdit;
    btTASA_REFER: TBitBtn;
    Label15: TLabel;
    cbTIPO_TASA: TComboBox;
    edVALOR_TASA: TInterEdit;
    cbUNIDAD_TIEMPO_RE: TEdit;
    bbUNIDAD_TIEMPO_RE: TBitBtn;
    Label16: TLabel;
    edNUM_UNIDADES_RE: TInterEdit;
    Label17: TLabel;
    cbDIA_REVISION: TEdit;
    Label21: TLabel;
    edF_PROX_REVISION: TEdit;
    edCVE_AMORTIZACION: TEdit;
    btTIPO_AMORT: TBitBtn;
    edDESC_TIPO_AMORT: TEdit;
    cbUNIDAD_TIEMPO_CP: TEdit;
    bbUNIDAD_TIEMPO_CP: TBitBtn;
    Label19: TLabel;
    edNUM_UNIDADES_CP: TInterEdit;
    Label18: TLabel;
    cbDIA_PAGO_CAP: TEdit;
    Label20: TLabel;
    edF_INI_PAG_CAP: TEdit;
    dtpF_INI_PAG_CAP: TInterDateTimePicker;
    dtpF_PROX_REVISION: TInterDateTimePicker;
    Label22: TLabel;
    lbOPERADOR_STASA: TLabel;
    cbOPERADOR_STASA: TEdit;
    Label23: TLabel;
    edSOBRETASA: TInterEdit;
    lbTASA_CREDITO: TLabel;
    edTASA_CREDITO: TInterEdit;
    edF_INICIO: TEdit;
    dtpF_INICIO: TInterDateTimePicker;
    edDIAS_PLAZO: TInterEdit;
    btDIASPLAZO: TBitBtn;
    dtpF_VENCIMIENTO: TInterDateTimePicker;
    Label26: TLabel;
    lbDIAS_PLAZO: TLabel;
    Label24: TLabel;
    PopupCesion: TPopupMenu;
    RegistroDoc: TMenuItem;
    N1: TMenuItem;
    DatosComplementarios1: TMenuItem;
    Acreditado1: TMenuItem;
    PersonaCorporativa1: TMenuItem;
    ProductodeCredito1: TMenuItem;
    Autorizacion1: TMenuItem;
    Chequeras1: TMenuItem;
    Impresion1: TMenuItem;
    ilCALINT: TInterLinkit;
    ilTASA_REFER: TInterLinkit;
    ilTIPAMORT: TInterLinkit;
    edF_VENCIMIENTO: TEdit;
    Label25: TLabel;
    edSolDisp: TEdit;
    lbSolDisp: TLabel;
    RA1: TMenuItem;
    Button1: TButton;
    lbTipo_Disp: TLabel;
    lbEstadoCesion: TLabel;
    Label32: TLabel;
    //--END    DEINTEC.DF
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCONTRATOClick(Sender: TObject);
    procedure ilCONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCONTRATOEjecuta(Sender: TObject);
    procedure iedID_CONTRATOExit(Sender: TObject);
    procedure btEMISORClick(Sender: TObject);
    procedure ilEMISORCapture(Sender: TObject; var Show: Boolean);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure edID_EMISORExit(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure ilPROVEEDORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure btLIQUIDACIONClick(Sender: TObject);
    procedure ilLIQUIDACIONCapture(Sender: TObject; var Show: Boolean);
    procedure ilLIQUIDACIONEjecuta(Sender: TObject);
    procedure edLIQUIDACIONExit(Sender: TObject);
    procedure chB_OPERADO_NAFINExit(Sender: TObject);
    procedure chB_APLICA_COMClick(Sender: TObject);
    procedure chB_APLICA_COMEnter(Sender: TObject);
    procedure chB_APLICA_COMExit(Sender: TObject);
    Procedure AplicaComision;
    procedure edPCT_COMISIONExit(Sender: TObject);
    procedure edTX_INSTRUC_LIQExit(Sender: TObject);
    procedure btPROM_ADMClick(Sender: TObject);
    procedure ilPROMADMCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROMADMEjecuta(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure btDOCTOClick(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure edID_PROM_ADMExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btOPERA_BLOQUEClick(Sender: TObject);
    procedure btAUTORIZA_CESIONClick(Sender: TObject);
    procedure btCANCELA_CESIONClick(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure Catlogo1Click(Sender: TObject);
    procedure Catlogo2Click(Sender: TObject);
    procedure ChequeraCargo1Click(Sender: TObject);
    procedure ChequeraLiquidacinCargo1Click(Sender: TObject);
    procedure ChequeraAdministradorAbono1Click(Sender: TObject);
    procedure ChequeraLiquidacinAbono1Click(Sender: TObject);
    procedure CatlogoRelacinEmisorProveedor1Click(Sender: TObject);
    procedure RelacinEmisorProvedor1Click(Sender: TObject);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure edID_PROVEEDORExit(Sender: TObject);
    procedure rgCVE_TIPO_INTERESExit(Sender: TObject);
    procedure Autorizacin1Click(Sender: TObject);
    procedure CarteraImpagada1Click(Sender: TObject);

    //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
    procedure edCVE_CALCULOExit(Sender: TObject);
    procedure btCALC_INTClick(Sender: TObject);
    procedure cbTIPO_TASAExit(Sender: TObject);
    procedure btTASA_REFERClick(Sender: TObject);
    procedure btTASA_REFERExit(Sender: TObject);
    procedure bbUNIDAD_TIEMPO_REClick(Sender: TObject);
    procedure bbUNIDAD_TIEMPO_REExit(Sender: TObject);
    procedure edNUM_UNIDADES_REExit(Sender: TObject);
    procedure cbDIA_REVISIONExit(Sender: TObject);
    procedure cbDIA_REVISIONKeyPress(Sender: TObject; var Key: Char);
    procedure edF_PROX_REVISIONExit(Sender: TObject);
    procedure cbOPERADOR_STASAExit(Sender: TObject);
    procedure cbOPERADOR_STASAKeyPress(Sender: TObject; var Key: Char);
    procedure edSOBRETASAExit(Sender: TObject);
    procedure edTASA_CREDITOExit(Sender: TObject);
    procedure btTIPO_AMORTClick(Sender: TObject);
    procedure btTIPO_AMORTExit(Sender: TObject);
    procedure edCVE_AMORTIZACIONExit(Sender: TObject);
    procedure bbUNIDAD_TIEMPO_CPClick(Sender: TObject);
    procedure bbUNIDAD_TIEMPO_CPExit(Sender: TObject);
    procedure edNUM_UNIDADES_CPExit(Sender: TObject);
    procedure cbDIA_PAGO_CAPEnter(Sender: TObject);
    procedure cbDIA_PAGO_CAPExit(Sender: TObject);
    procedure edF_INI_PAG_CAPExit(Sender: TObject);
    procedure edF_INICIOExit(Sender: TObject);
    procedure edDIAS_PLAZOExit(Sender: TObject);
    procedure btDIASPLAZOClick(Sender: TObject);
    procedure edF_VENCIMIENTOExit(Sender: TObject);
    Function  VentanaCalculo(pDato : String): string;
    procedure ilCALINTEjecuta(Sender: TObject);
    procedure RegistroDocClick(Sender: TObject);
    procedure Acreditado1Click(Sender: TObject);
    procedure PersonaCorporativa1Click(Sender: TObject);
    procedure ProductodeCredito1Click(Sender: TObject);
    procedure Autorizacion1Click(Sender: TObject);
    procedure Chequeras1Click(Sender: TObject);
    procedure Impresion1Click(Sender: TObject);
    procedure LimpiaTabla;
    procedure edIMP_CESIONExit(Sender: TObject);
    procedure ilTASA_REFEREjecuta(Sender: TObject);
    procedure ilTIPAMORTEjecuta(Sender: TObject);
    procedure RA1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    //--END    DEINTEC.DF

    private
      { Private declarations }
      vgLiqMoneda : String;

      //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
      vgCambio    : Boolean;
      vgSTant     : Double;
      vgDiaPago   : Integer;
      //--END    DEINTEC.DF

      procedure autorizaces;
      procedure Actualizaimportes;
      function  IsPlazoMayor : Boolean;

      //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
      Procedure VerificaTasaRefer;
      Procedure ValorTasaCred;
      function  ValorTasa(pTasa: String): String;
      Procedure VerPagoCap;
      Procedure AsignaPagoCap;
      Function  CalculaFecha : TDateTime;
      Procedure ActualizaValoresPagoEquivalente;
      function  ValNumUnidades(pNumUnidades, peNumdiasMax, pPlazo: Integer; Var pMensaje : String): Boolean;
      function  ValUnidadTiemp(pCveUniTiemp : String; pPlazo: Integer; Var pMensaje : String): Boolean;
      //--END    DEINTEC.DF
      // FJR 23.07.2012 Agregar funcion de envio de correo al momento de autorizar la cesion
      Function EnviaMail: Boolean ;
    public
    { Public declarations }
    Objeto : TCrCesion;
    procedure verificaSituacion;
    Procedure VerChequera(IdCliente : Integer; peCveEmisNafin,pCveTipoAcred, pCveTipoCheq: String);
    Procedure VerRelEmisProv;
    //HERJA
    Function RevisaFacturasElectronicas(peidcesion:string):integer;

    // RABA DIC 2014 ACTUALIZACION B-6
    Procedure EvaluaNuevaDisp;
    Function HayVencidos(Folio_grupo :String): Boolean;  // RABA DIC 2014
    // FIN RABA    

end;
 TCrCesion= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        //</SST>
        //10 MAY 2011 Variables provenientes del monitor Web
        vgIdSolWeb        : Integer;
        vgIdContratoWeb   : Integer;
        vgIdEmisorWeb     : Integer;
        vgIdProveedor     : Integer;
        vgComDispWeb      : Double;
        vgIdTipoInteres   : Integer;
        //<SST/>
        //<RABA>
        // SEP 2013 Se agrega variable global para identificar la procedencia de la solicitud web
        // Integración de O17
        vgCveMedio: String;
        //</RABA>

        //< RABA >
        // DIC 2014  Actualización B-6
        vgTipo_Disposicion: String;
        //< /RABA >

        vlCesion          : String;
        ID_CESION         : TInterCampo;
        CVE_LIQUIDACION   : TInterCampo;
        ID_EMISOR         : TInterCampo;
        CVE_EMISOR_NAFIN  : TInterCampo;
        ID_PROVEEDOR      : TInterCampo;
        IMP_CESION        : TInterCampo;
        TX_INSTRUC_LIQ    : TInterCampo;
        B_OPERADO_NAFIN   : TInterCampo;
        B_APLICA_COM      : TInterCampo;
        PCT_COMISION      : TInterCampo;
        SIT_CESION        : TInterCampo;
        F_ALTA            : TInterCampo;
        CVE_USU_ALTA      : TInterCampo;
        F_AUTORIZA        : TInterCampo;
        CVE_USU_AUTORIZA  : TInterCampo;
        F_MODIFICA        : TInterCampo;
        CVE_USU_MODIFICA  : TInterCampo;
        ID_CONTRATO       : TInterCampo;
        FOL_CONTRATO      : TInterCampo;
        ID_PROM_ADM       : TInterCampo;
        CVE_TIPO_INTERES  : TInterCampo;
        IMP_COMPRA        : TInterCampo;
        DISPONIBLE_PROV   : TInterCampo;
        B_VAL_IMP_CES     : String;
        IMP_MAX_AUT_CES   : Double;
        DISPONIBLE_PROV_PJ: TInterCampo;
        PCT_PROV_SEC      : TInterCampo;
        IMP_PROV_SEC      : TInterCampo;
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
        CVE_FND_ENT_DES   : TInterCampo;
{/ROIM}

        //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
        CVE_CALCULO              : String;
        CVE_TIPO_TASA            : String;
        CVE_TASA_REFER           : TInterCampo; {EASA4011       20-JUN-2008}
        F_PROX_REVISION          : TDateTime;
        UNIDAD_TIEMPO_RE         : String;
        DIAS_PLAZO               : Integer;
        NUM_UNIDADES_RE          : Integer;
        DIA_REVISION             : Integer;
        OPERADOR_STASA           : String;
        SOBRETASA                : Double;
        TASA_CREDITO             : Double;
        CVE_AMORTIZACION         : String;
        F_INI_PAG_CAP            : TDateTime;
        NUM_UNIDADES_CP          : Integer;
        UNIDAD_TIEMPO_CP         : String;
        DIA_PAGO_CAP             : Integer;
        F_INICIO                 : TDateTime;
        F_VENCIMIENTO            : TDateTime;
        //--END    DEINTEC.DF

        //Clases Adicionales
        ParamCre                 : TParamCre;
        CreCto                   : TCrCto;
        Emisor                   : TCrEmisor;
        EmiProv                  : TCrEmiPro;
        LiqDisp                  : TCrLiqDis;
        PromotorAdm              : TMPersona;
        Credito                  : TCrCredito;

        //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
        CalcInt                  : TCrCalcInt; //Calculo de intereses
        TasaRefer                : TTasIndFin;
        UTiempoTasa              : TCrUniTie;  //Unidad de Tiempo
        TipoAmort                : TCrAmortiz; //Tipo de Amortizacion
        UTiempoCap               : TCrUniTie;  //Unidad de Tiempo
        ObjectForm               : TWCrCesion;
        //--END    DEINTEC.DF

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        procedure   CambioSituacion(Sender: TObject);
        Function    InternalPost : Boolean; override;
        Function    InsertaCesion: Boolean;
        function    STPAUTORIZACESION( peIdCesion : Integer; pImpCompra : Double; peCVE_CAL_CAPITAL : String; Var vlErr: String ) : Boolean;
        function    STPCANCELACESION( peIdCesion : Integer; Var vlErr: String) : Boolean;
        procedure   ObtSaldosCesion(pIdCesion : String);
        procedure   ObtenDispProveedor;
        Function    verifExisDoctos(peCesion : Integer) : Integer;
        Procedure   ObtenChequeras(pIdCliente, pCesion: Integer; pCveEmisNafin,pCveTipoAcred,pCveTipoCheq,pMetodo : String;
                                   var psIdBancoChqra : Integer; var psCuentaBanco : String);
        Function    ValidaPerfilUsuario: Boolean;
        function    ValCanPerfilUsu: Boolean;
        function    STPACTUALIZACES( peIdCesion : Integer; Var vlErr: String) : Boolean;
        function    ValidaImpMaxCes(pIdCesion : Integer): Boolean;
        function    STPOBTIMPPROV( peIdCesion : String) : Boolean;

        //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
        function    StpBusSigFecha(PPFInicioPag,PPFVencimiento : TDateTime;PPUnidadTiempo : String;
                                   PPENumUnidades,PPDiaPago : Integer;
                                   PPEDMinReqPer : Integer = 0;
                                   PPENumDiasAgrPer : Integer = 0): TDateTime;     
        Function    InsertaCesionMer: Boolean;
        Function    UpdateCesionMer: Boolean;
        //--END    DEINTEC.DF
        function  ValidaPlazosVPN(pid_credito:string):boolean;
      published

      end;

//---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
var
   vgVPN: Boolean;
//--END    DEINTEC.DF

implementation
Uses IntCrDocto, // registra documentos
     IntCrAuCaCs, // Cancela o autoriza en bloque cesiones
     IntCrdocsmas, // Carga Masiva de Documentos por cesión

     //---BEGIN   DEINTEC.DF 22.ABRIL.2008    DESCUENTO MERCANTIL
     IntCrCalDia,  //Convierte en días, de aucerdo al año y meses
     IntCrGenVto, IntCrconsult
     //--END    DEINTEC.DF

{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
     ,IntMRepVenc, IntDmMain    //Reporte de Cartera Vencida
{/ROIM}
     , IntCrNotific     // FJR 23.07.2012 para funcionalidad de envio de correo.
     ;
{$R *.DFM}

function TCrCesion.ValidaPlazosVPN(pid_credito:string):boolean;
var vlsql, vlfinicio: String;
    vlCount: Integer;
begin
   ValidaPlazosVPN:=true;

   vlsql:= ' SELECT COUNT(*) AS NCOUNT FROM CR_CESION WHERE ID_CESION= '+pid_credito;
   GetSQLInt(vlsql,Apli.DataBaseName,Apli.SessionName,'NCOUNT', vlCount, False);

   if vlCount > 0 then
   begin
      vlsql:= ' SELECT F_INICIO FROM CR_CESION WHERE ID_CESION= '+pid_credito;
      GetSQLStr(vlsql,Apli.DataBaseName,Apli.SessionName,'F_INICIO', vlfinicio, False);

      vlsql:= ' SELECT COUNT(*) COUNT FROM CR_CAPITAL WHERE ID_CREDITO = ' + pid_credito +
              '    AND (F_VENCIMIENTO - PLAZO) <> TO_DATE('''+vlfinicio+''',''DD/MM/YYYY'')';
      GetSQLInt(vlsql, Apli.DataBaseName, Apli.SessionName,'COUNT',vlCount,False);
      if vlCount > 0 then
      begin
         ShowMessage('Las Fechas de Inicio de Capital de la Cesion '+pid_credito+' deben de ser las mismas que la Fecha de Inicio del credito');
         ValidaPlazosVPN := False;
      end;

      vlsql:= ' SELECT COUNT(*) COUNT FROM CR_INTERES WHERE ID_CREDITO = ' + pid_credito +
              '    AND (F_VENCIMIENTO - PLAZO) <> TO_DATE('''+vlfinicio+''',''DD/MM/YYYY'')';
      GetSQLInt(vlsql, Apli.DataBaseName, Apli.SessionName,'COUNT',vlCount,False);
      if vlCount > 0 then
      begin
         ShowMessage('Las Fechas de Inicio de Interes de la Cesion '+pid_credito+' deben de ser las mismas que la Fecha de Inicio del credito');
         ValidaPlazosVPN := False;
      end;
   end;
end;



constructor TCrCesion.Create( AOwner : TComponent );
begin Inherited;
      ID_CESION :=CreaCampo('ID_CESION',ftFloat,tsNinguno,tsNinguno,True);
                ID_CESION.Caption:='Número de Cesion';
      CVE_LIQUIDACION :=CreaCampo('CVE_LIQUIDACION',ftString,tsNinguno,tsNinguno,True);
                CVE_LIQUIDACION.Caption:='Clave de Liquidacion';
      ID_EMISOR :=CreaCampo('ID_EMISOR',ftFloat,tsNinguno,tsNinguno,True);
                ID_EMISOR.Caption:='Emisor';
      CVE_EMISOR_NAFIN :=CreaCampo('CVE_EMISOR_NAFIN',ftString,tsNinguno,tsNinguno,True);
                CVE_EMISOR_NAFIN.Caption:='Identificador Nafinsa';
      ID_PROVEEDOR :=CreaCampo('ID_PROVEEDOR',ftFloat,tsNinguno,tsNinguno,True);
                ID_PROVEEDOR.Caption:='Proveedor';
      IMP_CESION :=CreaCampo('IMP_CESION',ftFloat,tsNinguno,tsNinguno,True);
                IMP_CESION.Caption:='Importe Cesion';
      TX_INSTRUC_LIQ :=CreaCampo('TX_INSTRUC_LIQ',ftString,tsNinguno,tsNinguno,True);
                TX_INSTRUC_LIQ.Caption:='Instruc Liq';
      B_OPERADO_NAFIN :=CreaCampo('B_OPERADO_NAFIN',ftString,tsNinguno,tsNinguno,True);
                B_OPERADO_NAFIN.Caption:='Operador Nafin';
      B_APLICA_COM :=CreaCampo('B_APLICA_COM',ftString,tsNinguno,tsNinguno,True);
                B_APLICA_COM.Caption:='Aplica Comisión';
      PCT_COMISION :=CreaCampo('PCT_COMISION',ftFloat,tsNinguno,tsNinguno,True);
                PCT_COMISION.Caption:='Comisión';
      SIT_CESION :=CreaCampo('SIT_CESION',ftString,tsNinguno,tsNinguno,True);
         With SIT_CESION do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('NO AUTORIZADO'); ComboDatos.Add('NA');
                ComboLista.Add('AUTORIZADO');    ComboDatos.Add('AU');
                ComboLista.Add('ACTIVO');        ComboDatos.Add('AC');
                ComboLista.Add('CANCELADO');     ComboDatos.Add('CA');
                ComboLista.Add('LIQUIDADO');     ComboDatos.Add('LQ');
          end;
                SIT_CESION.Caption:='Situación Cesión';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_AUTORIZA :=CreaCampo('F_AUTORIZA',ftDate,tsNinguno,tsNinguno,True);
                F_AUTORIZA.Caption:='Fecha Autoriza';
      CVE_USU_AUTORIZA :=CreaCampo('CVE_USU_AUTORIZA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_AUTORIZA.Caption:='Clave de Usu Autoriza';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,False);
      FOL_CONTRATO :=CreaCampo('FOL_CONTRATO',ftFloat,tsNinguno,tsNinguno,False);
      ID_PROM_ADM :=CreaCampo('ID_PROM_ADM',ftFloat,tsNinguno,tsNinguno,False);
      CVE_TIPO_INTERES :=CreaCampo('CVE_TIPO_INTERES',ftString,tsNinguno,tsNinguno,True);
         With CVE_TIPO_INTERES do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add('IN');
                ComboLista.Add('1'); ComboDatos.Add('VE');
          end;
                CVE_TIPO_INTERES.Caption:='Tipo Interés';
      IMP_COMPRA :=CreaCampo('IMP_COMPRA',ftFloat,tsNinguno,tsNinguno,False);
      DISPONIBLE_PROV :=CreaCampo('DISPONIBLE_PROV',ftFloat,tsNinguno,tsNinguno,False);
      DISPONIBLE_PROV_PJ :=CreaCampo('DISPONIBLE_PROV_PJ',ftFloat,tsNinguno,tsNinguno,False);
      PCT_PROV_SEC :=CreaCampo('PCT_PROV_SEC',ftFloat,tsNinguno,tsNinguno,False);
      IMP_PROV_SEC :=CreaCampo('IMP_PROV_SEC',ftFloat,tsNinguno,tsNinguno,False);
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
      CVE_FND_ENT_DES :=CreaCampo('CVE_FND_ENT_DES',ftString,tsNinguno,tsNinguno,True);
                CVE_FND_ENT_DES.Caption:='CVE_FND_ENT_DES';
{/ROIM}


      FKeyFields.Add('ID_CESION');

      TableName := 'CR_CESION';
      UseQuery := True;
      HelpFile := 'IntCrCesion.Hlp';
      ShowMenuReporte:=True;

      CreCto := TCrCto.Create(Self);
      CreCto.MasterSource:=Self;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CESION';

      Emisor := TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
      Emisor.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
{/ROIM}
      Emisor.FieldByName('ID_ACREDITADO').MasterField:='ID_EMISOR';
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
      Emisor.FieldByName('CVE_EMISOR_EXT').MasterField:='CVE_EMISOR_NAFIN';
{/ROIM}

{EASA4011       20-JUN-2008}
      CVE_TASA_REFER :=CreaCampo('CVE_TASA_REFER',ftString,tsNinguno,tsNinguno,False);
                CVE_TASA_REFER.Caption:='CVE_TASA_REFER';
{EASA4011}


      EmiProv := TCrEmiPro.Create(Self);
      EmiProv.MasterSource:=Self;
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
      EmiProv.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
{/ROIM}
      EmiProv.FieldByName('ID_EMISOR').MasterField:='ID_EMISOR';
      EmiProv.FieldByName('ID_PROVEEDOR').MasterField:='ID_PROVEEDOR';

      LiqDisp := TCrLiqDis.Create(Self);
      LiqDisp.MasterSource:=Self;
      LiqDisp.FieldByName('CVE_LIQUIDACION').MasterField:='CVE_LIQUIDACION';
      LiqDisp.BuscaWhereString := 'CR_LIQUIDA_DISP.SIT_LIQUIDA = ''AC''';
      LiqDisp.FilterString := LiqDisp.BuscaWhereString;

      PromotorAdm := TMPersona.Create(Self);
      PromotorAdm.FilterBy := fbTMPersonaEmpleado;
      PromotorAdm.MasterSource := Self;
      PromotorAdm.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      SIT_CESION.OnChange := CambioSituacion;

      //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
      CalcInt := TCrCalcInt.Create(Self);
      CalcInt.MasterSource:=Self;

      TasaRefer := TTasIndFin.Create(Self);
      TasaRefer.MasterSource:=Self;
      TasaRefer.FieldByName('CVE_TASA_INDICAD').MasterField:='CVE_TASA_REFER';
      TasaRefer.BuscaWhereString := 'TASA_INDIC_FINAN.B_TASA_CREDITO =' + #39 + 'V'+ #39;
      TasaRefer.FilterString := TasaRefer.BuscaWhereString;

      UTiempoTasa := TCrUniTie.Create(Self);
      UTiempoTasa.MasterSource:=Self;

      TipoAmort := TCrAmortiz.Create(Self);
      TipoAmort.MasterSource:=Self;

      UTiempoCap  := TCrUniTie.Create(Self);
      UTiempoCap.MasterSource:=Self;
      //--END    DEINTEC.DF

      //< RABA > DIC 2014 ACTUALIZACIÓN B-6
      vgTipo_Disposicion := 'DI';
      // < /RABA >
end;

Destructor TCrCesion.Destroy;
begin
   if CreCto <> nil then
      CreCto.Free;
   //end if

   if Credito <> nil then
      Credito.Free;
   //end if

   if Emisor <> nil then
      Emisor.Free;
   //end if

   if EmiProv <> nil then
      EmiProv.Free;
   //end if

   if LiqDisp <> nil then
      LiqDisp.Free;
   //end if

   if PromotorAdm <> nil then
      PromotorAdm.Free;
   //end if

   //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
   if TasaRefer <> nil then
       TasaRefer.Free;
   //--END    DEINTEC.DF

   inherited;
end;


function TCrCesion.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCesion;
begin
   W:=TWCrCesion.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      ObjectForm := W;              // DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrCesion.InternalBusca:Boolean;
Var
    T        : TInterFindit;
    vlSalida : Boolean;
Begin
      InternalBusca := False;
      T := CreaBuscador('ICrCesio.it','F,F');
      Try if Active then begin T.Param(0,ID_CESION.AsString);
                               end;
          if T.Execute then
          Begin
             VLSalida := FindKey([T.DameCampo(0)]);
             if VLSalida then
             begin
                  PromotorAdm.FindKey([Credito.ID_PROM_ADM.AsString]);
                  CreCto.FindKey([credito.ContratoCre.ID_CONTRATO.AsString,'1']);
                  //## BEGIN DIENTEC.DF  30.MAYO.2008   DESCUENTOS MERCANTILES
                  IF (CreCto.Producto.CVE_CAL_CAPITAL.AsString = C_VPN) THEN
                  BEGIN
                     Credito.FindKey([ID_CESION.AsString]);
                     // RABA DIC 2014 ACTUALIZACION B-6
                     if Credito.TIPO_DISPOSICION.AsString = 'DI' then
                        ObjectForm.lbTipo_Disp.Caption := 'DISPOSICION';
                     if Credito.TIPO_DISPOSICION.AsString = 'RE' then
                        ObjectForm.lbTipo_Disp.Caption := 'RENOVACION';
                     // FIN RABA
                  END
                  ELSE
                  BEGIN
                     try
                     Credito.FindKey([ID_CESION.AsString]);
                     // RABA DIC 2014 ACTUALIZACION B-6
                     if Credito.TIPO_DISPOSICION.AsString = 'DI' then
                        ObjectForm.lbTipo_Disp.Caption := 'DISPOSICION';
                     if Credito.TIPO_DISPOSICION.AsString = 'RE' then
                        ObjectForm.lbTipo_Disp.Caption := 'RENOVACION';
                     // FIN RABA
                       ObjectForm.edCVE_CALCULO.Text:= CNULL;
                       ObjectForm.edDESC_CALC_INT.Text:= CNULL;
                       ObjectForm.edCVE_TASA_REFER.Text:= CNULL;
                       ObjectForm.edDESC_TASA_REFER.Text:= CNULL;
                       ObjectForm.edVALOR_TASA.Text:= CNULL;
                       ObjectForm.cbOPERADOR_STASA.Text:= CNULL;
                       ObjectForm.edSOBRETASA.Text:= CNULL;
                       ObjectForm.edTASA_CREDITO.Text:= CNULL;
                       ObjectForm.cbUNIDAD_TIEMPO_RE.Text:= CNULL;
                       ObjectForm.edNUM_UNIDADES_RE.Text:= CNULL;
                       ObjectForm.cbDIA_REVISION.Text:= CNULL;
                       ObjectForm.edF_PROX_REVISION.Text:= CNULL;
                       ObjectForm.edCVE_AMORTIZACION.Text:= CNULL;
                       ObjectForm.edDESC_TIPO_AMORT.Text:= CNULL;
                       ObjectForm.cbUNIDAD_TIEMPO_CP.Text:= CNULL;
                       ObjectForm.edNUM_UNIDADES_CP.Text:= CNULL;
                       ObjectForm.cbDIA_PAGO_CAP.Text:= CNULL;
                       ObjectForm.edF_INI_PAG_CAP.Text:= CNULL;
                       ObjectForm.cbUNIDAD_TIEMPO_CP.ReadOnly:= True;
                       ObjectForm.cbUNIDAD_TIEMPO_CP.Enabled:= True;
                       ObjectForm.cbUNIDAD_TIEMPO_RE.ReadOnly:= True;
                       ObjectForm.cbUNIDAD_TIEMPO_RE.Enabled:= True;
                     except
                        CVE_CALCULO:= CNULL;
                     end;
                  END;
                  //## END   DIENTEC.DF  30.MAYO.2008   DESCUENTOS MERCANTILES
             end;
             InternalBusca := VLSalida;
          end;

      finally  T.Free;
      end;
end;

//Cambia la situación de la Cesión
procedure TCrCesion.CambioSituacion(Sender: TObject);
begin
     If (SIT_CESION.Control<>nil) and (SIT_CESION.Control is TLabel) then
        TLabel(SIT_CESION.Control).Caption:=SIT_CESION.AsCombo;
     //END IF
end;

//Inserta la Cesion
//</SST>
//11 MAY 2011 Se cambia el llamado al procedimiento para guardar el id de solicitud de disposiciones web
function TCrCesion.InsertaCesion: Boolean;
var
  vlSalida: Boolean;
  STPObtCesion: TStoredProc;

  qyQuery       : TQuery;      // RABA NOV 2014
  stp           : TStoredProc; // RABA NOV 2014
  vlFolGpoRenueva : Integer;   // RABA NOV 2014

  vlsql2        : String;      // RABA NOV 2014
  vlEsVencido   : String;      // RABA NOV 2014
begin
  vlSalida:= False;
  vlFolGpoRenueva := 0;
  //Obtiene Datos de algunos Intercampos
  B_OPERADO_NAFIN.GetFromControl;
  B_APLICA_COM.GetFromControl;
  CVE_TIPO_INTERES.GetFromControl;
  ID_PROM_ADM.GetFromControl;
  //Inicia el SPT
  STPObtCesion:= TStoredProc.Create(Self);
  try
    with STPObtCesion do
    begin
      STPObtCesion.DatabaseName:= Apli.DatabaseName;
      STPObtCesion.SessionName:= Apli.SessionName;
      //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
      //STPObtCesion.StoredProcName:= 'PKGCRCREDITO.STPALTACESION';//SST Se comenta.
      STPObtCesion.StoredProcName:= 'PKGCRCREDITO.STPALTACESION1';//SST Nuevo Store.
      //STPObtCesion.StoredProcName:= 'PKGCRCREDITO.STPALTACESIONTRAD';                   //REMOVED  DEINTEC.DF   ROIM  SE CAMBIA AL ORIGINAL
      //--END    DEINTEC.DF
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam(ftFloat, 'peIdContrato', ptInput);
      Params.CreateParam(ftFloat, 'peFolContrato', ptInput);
      Params.CreateParam(ftString, 'peCveLiquidacion', ptInput);
      {ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
      Params.CreateParam(ftString, 'peCveEntDesc', ptInput);
      {/ROIM}
      Params.CreateParam(ftFloat, 'peIdEmisor', ptInput);
      Params.CreateParam(ftString, 'peCveEmisorNafin', ptInput);
      Params.CreateParam(ftFloat, 'peIdProveedor', ptInput);
      Params.CreateParam(ftFloat, 'peImpCesion', ptInput);
      Params.CreateParam(ftString, 'peTxInstrucLiq', ptInput);
      Params.CreateParam(ftString, 'peBOperadoNafin', ptInput);
      Params.CreateParam(ftString, 'peBAplicaCom', ptInput);
      Params.CreateParam(ftFloat, 'pePctComision', ptInput);
      Params.CreateParam(ftFloat, 'pePromAuto', ptInput);
      Params.CreateParam(ftDate, 'peFAlta', ptInput);
      Params.CreateParam(ftString, 'peCveUsuAlta', ptInput);
      Params.CreateParam(ftString, 'peCveTipoInteres', ptInput);
      Params.CreateParam(ftString, 'peBCommit', ptInput);
      //</SST> //11 MAY 2011 se agrega nuevo parámetro
      Params.CreateParam(ftInteger, 'peIdSolicitud', ptInput);
      //<SST/>
      //<RABA> SEP 2013 integración de O17
      Params.CreateParam(ftString, 'peCveMedio', ptInput);
      //<RABA/>
      Params.CreateParam(ftFloat, 'psIdCesion', ptOutput);
      Params.CreateParam(ftString, 'psSitCesion', ptOutput);
      Params.CreateParam(ftFloat, 'PSRESULTADO', ptOutput);
      Params.CreateParam(ftString, 'PSTXRESULTADO', ptOutput);
      //Se asignan valores
      ParamByName('peIdContrato').AsFloat:= ID_CONTRATO.AsFloat;
      ParamByName('peFolContrato').AsFloat:= FOL_CONTRATO.AsFloat;
      ParamByName('peCveLiquidacion').AsString:= CVE_LIQUIDACION.AsString;
      {ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
      ParamByName('peCveEntDesc').AsString:= Emisor.CVE_FND_ENT_DES.AsString;
      {/ROIM}
      ParamByName('peIdEmisor').AsFloat:= ID_EMISOR.AsFloat;
      ParamByName('peCveEmisorNafin').AsString:= CVE_EMISOR_NAFIN.AsString;
      ParamByName('peIdProveedor').AsFloat:= ID_PROVEEDOR.AsFloat;
      ParamByName('peImpCesion').AsFloat:= IMP_CESION.AsFloat;
      ParamByName('peTxInstrucLiq').AsString:= TX_INSTRUC_LIQ.AsString;
      ParamByName('peBOperadoNafin').AsString:= B_OPERADO_NAFIN.AsString;
      ParamByName('peBAplicaCom').AsString:= B_APLICA_COM.AsString;
      ParamByName('pePctComision').AsFloat:= PCT_COMISION.AsFloat;
      ParamByName('pePromAuto').AsString:= ID_PROM_ADM.AsString;
      ParamByName('peFAlta').AsDateTime:= F_ALTA.AsDateTime;
      ParamByName('peCveUsuAlta').AsString:= CVE_USU_ALTA.AsString;
      ParamByName('peCveTipoInteres').AsString:= CVE_TIPO_INTERES.AsString;
      ParamByName('peBCommit').AsString:= 'V';
      //</SST>
      ParamByName('peIdSolicitud').AsInteger:= StrToInt(ObjectForm.edSolDisp.Text);
      //<SST/>
      //<RABA> SEP 2013 integración de O17
      If vgcvemedio = '' then
         ParamByName('peCveMedio').AsString := 'CREDIT'
      else
         ParamByName('peCveMedio').AsString := vgCveMedio;
     //<RABA/>
      ExecProc;
      //SI CARGA MANDA LA CESION Y Y LA SITUACION DEL MISMO
      if (STPObtCesion.ParamByName('PSResultado').AsInteger = 0) then
      begin
        vlSalida:= True;
        ID_CESION.AsInteger:= ParamByName('psIdCesion').AsInteger;
        SIT_CESION.AsString:= ParambyName('psSitCesion').AsString;
      end
      else // SI NO REALIZA LA CARGA MANDA ERRORES
      begin
        ShowMessage('PROBLEMAS AL OBTENER LA CESION: ' +
          IntToStr(ParamByName('psRESULTADO').AsInteger));
        ShowMessage(ParamByName('psTxResultado').AsString);
        GenMsg(ParamByName('psTxResultado').AsString, Apli);
      end;
    end;
  finally
    STPObtCesion.Free;
  end;

  InsertaCesion:= vlSalida;
end;

//Sobreescribiendo el Internal Post
function TCrCesion.InternalPost: Boolean;
var
  vlSalida: Boolean;
begin
  InternalPost:= False;
  vlSalida:= False;
  if Modo = moEdit then
  begin
    Result:= Inherited InternalPost;
    //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
    try
      if vgVPN then
        VLSalida:= UpdateCesionMer;
    except
      Beep;Beep;Beep;Beep;
      ShowMessage('Problemas con la Actualizacion de Cesión. Avise Urgentemente a Sistemas');
    end;
    //--END    DEINTEC.DF
  end;
  if Modo = moAppend then
  begin
    try
      //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
      if ( vgVPN = False) then
        vlSalida:= InsertaCesion
      else
        VLSalida:= InsertaCesionMer;
      //--END    DEINTEC.DF
    except
      Beep;Beep;Beep;Beep;
      ShowMessage('Problemas con el Alta de Cesión. Avise Urgentemente a Sistemas');
    end;
  end;
  InternalPost:= vlSalida;
end;
{-------------------------------------------------------------------------------------------
        AUTORIZACION DE LA CESION EN BLOQUE
-------------------------------------------------------------------------------------------}
function TCrCesion.STPAUTORIZACESION( peIdCesion : Integer; pImpCompra : Double; peCVE_CAL_CAPITAL : String; Var vlErr: String ) : Boolean;
var   sptAutorizaCes : TStoredProc;
      vlResultado    : Boolean;
Begin
   vlResultado := True;
   vlErr := '';
   try
     sptAutorizaCes := TStoredProc.Create(Self);
     with sptAutorizaCes do
     begin
        //Inicia el SPT
        sptAutorizaCes.DatabaseName:= Apli.DatabaseName;
        sptAutorizaCes.SessionName:= Apli.SessionName;
//        if(ObjectForm.Objeto.CreCto.Producto.CVE_CAL_CAPITAL.AsString = C_VPN) THEN //#### DEINTEC.DF    19.MAYO.2008
        if (peCVE_CAL_CAPITAL = C_VPN) THEN //#### DEINTEC.DF    19.MAYO.2008
            sptAutorizaCes.StoredProcName:= 'PKGCRCREDITO.STPAUTORIZACESIONMER'     //#### DEINTEC.DF    19.MAYO.2008
        else                                                                        //#### DEINTEC.DF    19.MAYO.2008
            sptAutorizaCes.StoredProcName:= 'PKGCRCREDITO.STPAUTORIZACESION';

        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCESION',ptInput);
        Params.CreateParam(ftString,'PECVEUSUAUT',ptInput);
        Params.CreateParam(ftDate,'PEFAUTORIZA',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
                ParamByName('peIdCesion').AsInteger := peIdCesion;
        ParamByName('peCveUsuAut').AsString := Apli.Usuario;
        ParamByName('peFAutoriza').AsDateTime := Apli.DameFechaEmpresa;
        ParamByName('peBCommit').AsString := CVERDAD;
        ExecProc;

        If (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           //<EASA 25.ABR.2007     Req. Dolares
           vlErr := 'PROBLEMAS AL AUTORIZAR LA CESION : ' + IntToStr(peIdCesion) +
                     IntToStr(ParamByName('psRESULTADO').AsInteger)
                    + ' - ' + ParamByName('psTxResultado').AsString;
           ShowMessage( vlErr );
           GenMsg(vlErr,Apli);
           //end_EASA>/
        End ;
        //end if;
     end;
   finally
      sptAutorizaCes.Free;
   end;
   STPAUTORIZACESION := vlResultado;
end;

{-------------------------------------------------------------------------------------------
        CANCELACION DE LA CESION EN BLOQUE
-------------------------------------------------------------------------------------------}
function TCrCesion.STPCANCELACESION( peIdCesion : Integer; Var vlErr: String) : Boolean;
var   sptCancelaCes : TStoredProc;
      vlResultado    : Boolean;
Begin
   vlResultado := True;
   vlErr := '';
   try
     sptCancelaCes := TStoredProc.Create(Self);
     with sptCancelaCes do
     begin
        //Inicia el SPT
        sptCancelaCes.DatabaseName:= Apli.DatabaseName;
        sptCancelaCes.SessionName:= Apli.SessionName;

//        if(ObjectForm.Objeto.CreCto.Producto.CVE_CAL_CAPITAL.AsString = C_VPN) THEN //#### DEINTEC.DF    20.MAYO.2008
        if(CreCto.Producto.CVE_CAL_CAPITAL.AsString = C_VPN) THEN //#### DEINTEC.DF    20.MAYO.2008
            sptCancelaCes.StoredProcName:= 'PKGCRCREDITO.STPCANCELACESIONMER'       //#### DEINTEC.DF    20.MAYO.2008
        else                                                                        //#### DEINTEC.DF    20.MAYO.2008
            sptCancelaCes.StoredProcName:= 'PKGCRCREDITO.STPCANCELACESION';

        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCESION',ptInput);
        Params.CreateParam(ftString,'PECVEUSUMOD',ptInput);
        Params.CreateParam(ftDate,'PEFMODIFICA',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('peIdCesion').AsInteger := peIdCesion;
        ParamByName('peCveUsuMod').AsString := Apli.Usuario;
        ParamByName('peFModifica').AsDateTime := Apli.DameFechaEmpresa;
        ParamByName('peBCommit').AsString := CVERDAD;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           vlErr := 'PROBLEMAS AL CANCELAR LA CESION : ' +
                      IntToStr(ParamByName('psRESULTADO').AsInteger) + ' - ' +
                     ParamByName('psTxResultado').AsString;
           ShowMessage(vlErr);
           GenMsg(vlErr,Apli);
        end
        else if ParamByName('psTxResultado').AsString <> '' then
        begin
             ShowMessage(ParamByName('psTxResultado').AsString);
             GenMsg('Credito' + IntToStr(peIdCesion) + 'Desc: ' +ParamByName('psTxResultado').AsString,Apli);
        end;
     end;
   finally
      sptCancelaCes.Free;
   end;
   STPCANCELACESION := vlResultado;
end;

{----------------------------------------------------------------------------------------------------------------------
                OBTIENE EL IMPORTE DE COMPRA DE LA SESION
----------------------------------------------------------------------------------------------------------------------}
procedure TCrCesion.ObtSaldosCesion(pIdCesion : String);
var vlSql         : String;
    vlImpCompra   : String;
Begin
   vlSql := 'SELECT PKGCRPERIODO.ObtImpCompra( '+ pIdCesion +') IMP_COMPRA FROM DUAL';
   GetSqlStr(vlSqL,Apli.DataBaseName,Apli.SessionName,'IMP_COMPRA',vlImpCompra,False);
   if ( vlImpCompra = '' ) then
      vlImpCompra := '0';
   //end if
   IMP_COMPRA.AsFloat := StrToFloat(vlImpCompra);
end;                                                  
{----------------------------------------------------------------------------------------------------------------------
                OBTIENE EL DISPONIBLE DEL PROVEEDOR
----------------------------------------------------------------------------------------------------------------------}
Procedure TCrCesion.ObtenDispProveedor;
var vlSql         : String;
    vlDispProv    : String;
//    vlDispRelEP   : Integer;
Begin
   vlSql := 'SELECT PKGCRPERIODO.STPOBTDISPPROVEEDOR( '+ ID_EMISOR.AsString + ',' +
                                                         ID_PROVEEDOR.AsString +') DISP_PROV FROM DUAL';
   GetSqlStr(vlSqL,Apli.DataBaseName,Apli.SessionName,'DISP_PROV',vlDispProv,False);
//   if vlDispProv <> ''  then vlDispRelEP
   if ( vlDispProv = '' ) {OR ( StrToFloat(vlDispProv) < 0 )} then
      vlDispProv := '0';
   //end if
   DISPONIBLE_PROV.AsFloat := StrToFloat(vlDispProv);
end;
{----------------------------------------------------------------------------------------------------------------------
                VERIFICA SI EXISTEN DOCUMENTOS DE LA CESION
----------------------------------------------------------------------------------------------------------------------}
function TCrCesion.verifExisDoctos(peCesion : Integer): Integer;
var vlSql         : String;
    vlCount       : Integer;
Begin
   vlSql := 'SELECT COUNT(*) FROM CR_DOCUMENTO WHERE ID_CESION = ' + IntToStr(peCesion);
   GetSqlInt(vlSqL,Apli.DataBaseName,Apli.SessionName,'COUNT(*)',vlCount,False);
   verifExisDoctos := vlCount;
end;
{----------------------------------------------------------------------------------------------------------------------
                SE OBTIENEN DATOS DE LA CHEQUERA SEGUN EL CASO EMISOR O PROVEEDOR
----------------------------------------------------------------------------------------------------------------------}
procedure TCrCesion.ObtenChequeras(pIdCliente, pCesion: Integer; pCveEmisNafin,pCveTipoAcred,pCveTipoCheq,pMetodo : String;
                                   var psIdBancoChqra : Integer; var psCuentaBanco : String);
var ObtenChequeras :  TStoredProc;
Begin
    ObtenChequeras := TStoredProc.Create(Self);
    try
       with ObtenChequeras do
       begin
          ObtenChequeras.DatabaseName:= Apli.DatabaseName;
          ObtenChequeras.SessionName:= Apli.SessionName;
          ObtenChequeras.StoredProcName:='PKGCRPERIODO.STPOBTENCHQCTE';

          Params.Clear;
          Params.CreateParam(ftInteger,'PEIDCLIENTE',ptInput);
          Params.CreateParam(ftString,'PECVEEMISNAFIN',ptInput);
          Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftString,'PECVETIPOACRED',ptInput);
          Params.CreateParam(ftString,'PECVETIPOCHEQ',ptInput);
          Params.CreateParam(ftString,'PEMETODO',ptInput);
          Params.CreateParam(ftInteger,'PSIDBANCOCHQRA',ptOutput);
          Params.CreateParam(ftString,'PSCUENTABANCO',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peIdCliente').AsInteger := pIdCliente;
          ParamByName('PECveEmisNafin').AsString := pCveEmisNafin;
          ParamByName('peIdCredito').AsInteger := pCesion;
          ParamByName('peCveTipoAcred').AsString := pCveTipoAcred;
          ParamByName('peCveTipoCheq').AsString := pCveTipoCheq;
          ParamByName('peMetodo').AsString := pMetodo;
          ExecProc;

          if ParamByName('PSResultado').AsInteger = 0 then
          begin
             psIdBancoChqra := ParamByName('PSIDBANCOCHQRA').AsInteger;
             psCuentaBanco := ParamByName('PSCUENTABANCO').AsString;
          end
          else // SI NO REALIZA LA CARGA MANDA ERRORES
          Begin
             ShowMessage('PROBLEMAS AL OBTENER LA CHEQUERA DEL EMISOR: ' +  IntToStr(pIdCliente) +
                         ParamByName('psRESULTADO').AsString);
             ShowMessage(ParamByName('psTxResultado').AsString);
          end;
          UnPrepare;
       end;
    finally
       ObtenChequeras.Free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------
                                        VALIDA PERFIL USUARIO A AUTORIZAR
----------------------------------------------------------------------------------------------------------------------}
function TCrCesion.ValidaPerfilUsuario: Boolean;
Var vlResultado     : Boolean;
    stpValidaPerfil : TStoredProc;
    begin
    vlResultado := True;
    stpValidaPerfil := TStoredProc.Create(Self);
    try
       with stpValidaPerfil do
       begin
          stpValidaPerfil.DatabaseName:= Apli.DatabaseName;
          stpValidaPerfil.SessionName:= Apli.SessionName;
          stpValidaPerfil.StoredProcName:='PKGCRPERIODO.STPVALIDAPERFIL';

          Params.Clear;
          Params.CreateParam(ftString,'PECVEUSUAR',ptInput);
          Params.CreateParam(ftString,'PECVEAPLI',ptInput);
          Params.CreateParam(ftInteger,'PEIDEMPRESA',ptInput);
          Params.CreateParam(ftString,'PECVEINDADIC',ptInput);
          Params.CreateParam(ftString,'PSBVALIMPCES',ptOutput);
          Params.CreateParam(ftFloat,'PSIMPMAXAUTCES',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peCveUsuar').AsString := Apli.Usuario;
          ParamByName('peCveApli').AsString := Apli.Apli;
          ParamByName('peIdEmpresa').AsInteger := Apli.IdEmpresa;
          ParamByName('peCveIndAdic').AsString := Apli.Indicador;
          ExecProc;

          if ParamByName('PSResultado').AsInteger <> 0 then
          begin
             vlResultado := False;
             MessageDlg(ParamByName('psRESULTADO').AsString + ': ' + ParamByName('psTxResultado').AsString ,
                                mtInformation, [mbOK], 0  );
          end;
          B_VAL_IMP_CES := ParamByName('psBValImpCes').AsString;
          IMP_MAX_AUT_CES := ParamByName('psImpMaxAutCes').AsFloat;
          UnPrepare;
       end;
    finally
       stpValidaPerfil.Free;
    end;
    ValidaPerfilUsuario := vlResultado;
end;
{----------------------------------------------------------------------------------------------------------------------
                                        VALIDA IMPORTE MAXIMO AUTORIZADO DE CESION
----------------------------------------------------------------------------------------------------------------------}
function TCrCesion.ValidaImpMaxCes(pIdCesion : Integer): Boolean;
Var vlResultado     : Boolean;
    StpValImpMaxCes : TStoredProc;
begin
    vlResultado := True;
    StpValImpMaxCes := TStoredProc.Create(Self);
    try
       with StpValImpMaxCes do
       begin
          StpValImpMaxCes.DatabaseName:= Apli.DatabaseName;
          StpValImpMaxCes.SessionName:= Apli.SessionName;
          StpValImpMaxCes.StoredProcName:='PKGCRPERIODO.STPVALIMPMAXCES';

          Params.Clear;
          Params.CreateParam(ftInteger,'PEIDCESION',ptInput);
          Params.CreateParam(ftString,'PEBVALIMPCES',ptInput);
          Params.CreateParam(ftFloat,'PEIMPMAXAUTCES',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peIdCesion').AsInteger := pIdCesion;
          ParamByName('peBValImpCes').AsString := B_VAL_IMP_CES;
          ParamByName('peImpMaxAutCes').AsFloat := IMP_MAX_AUT_CES;
          ExecProc;

          if ParamByName('PSResultado').AsInteger <> 0 then
          begin
             vlResultado := False;
             MessageDlg(ParamByName('psRESULTADO').AsString + ': ' + ParamByName('psTxResultado').AsString ,
                                mtInformation, [mbOK], 0  );
          end;
          UnPrepare;
       end;
    finally
       StpValImpMaxCes.Free;
    end;
    ValidaImpMaxCes := vlResultado;
end;
{----------------------------------------------------------------------------------------------------------------------
                                        VALIDA PERFIL USUARIO A CANCELAR
----------------------------------------------------------------------------------------------------------------------}
function TCrCesion.ValCanPerfilUsu: Boolean;
Var vlResultado     : Boolean;
    stpValCanPerUsu : TStoredProc;
begin
    vlResultado := True;
    stpValCanPerUsu := TStoredProc.Create(Self);
    try
       with stpValCanPerUsu do
       begin
          stpValCanPerUsu.DatabaseName:= Apli.DatabaseName;
          stpValCanPerUsu.SessionName:= Apli.SessionName;
          stpValCanPerUsu.StoredProcName:='PKGCRPERIODO.STPVALPERFILCANC';

          Params.Clear;
          Params.CreateParam(ftString,'PECVEUSUAR',ptInput);
          Params.CreateParam(ftString,'PECVEAPLI',ptInput);
          Params.CreateParam(ftInteger,'PEIDEMPRESA',ptInput);
          Params.CreateParam(ftString,'PECVEINDADIC',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peCveUsuar').AsString := Apli.Usuario;
          ParamByName('peCveApli').AsString := Apli.Apli;
          ParamByName('peIdEmpresa').AsInteger := Apli.IdEmpresa;
          ParamByName('peCveIndAdic').AsString := Apli.Indicador;
          ExecProc;

          if ParamByName('PSResultado').AsInteger <> 0 then
          begin
             vlResultado := False;
             MessageDlg(ParamByName('psRESULTADO').AsString + ': ' + ParamByName('psTxResultado').AsString ,
                                mtInformation, [mbOK], 0  );
          end;
          UnPrepare;
       end;
    finally
       stpValCanPerUsu.Free;
    end;
    ValCanPerfilUsu := vlResultado;
end;
{-------------------------------------------------------------------------------------------
                AJUSTA CESION DE DIAS ANTRIORES
-------------------------------------------------------------------------------------------}
function TCrCesion.STPACTUALIZACES( peIdCesion : Integer; Var vlErr: String) : Boolean;
var   sptActualizaCes : TStoredProc;
      vlResultado    : Boolean;
Begin
   vlResultado := True;
   vlErr := '';
   try
     sptActualizaCes := TStoredProc.Create(Self);
     with sptActualizaCes do
     begin
        //Inicia el SPT
        sptActualizaCes.DatabaseName:= Apli.DatabaseName;
        sptActualizaCes.SessionName:= Apli.SessionName;
        if(ObjectForm.Objeto.CreCto.Producto.CVE_CAL_CAPITAL.AsString = C_VPN) THEN //#### DEINTEC.DF    20.MAYO.2008
            sptActualizaCes.StoredProcName:= 'PKGCRCREDITO.STPACTUALIZACESMER'      //#### DEINTEC.DF    20.MAYO.2008
        else                                                                        //#### DEINTEC.DF    20.MAYO.2008
            sptActualizaCes.StoredProcName:= 'PKGCRCREDITO.STPACTUALIZACES';

        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCESION',ptInput);
        Params.CreateParam(ftDate,'PEFAUTORIZA',ptInput);
        Params.CreateParam(ftDate,'PECVEUSUMOD',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('peIdCesion').AsInteger := peIdCesion;
        ParamByName('peFAutoriza').AsDateTime := Apli.DameFechaEmpresa;
        ParamByName('peCveUsuMod').AsString := Apli.Usuario;
        ParamByName('peBCommit').AsString := CVERDAD;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           vlErr := 'PROBLEMAS EN LOS AJUSTES DE LA AUTORIZACION DE LA CESION : ' +
                    IntToStr(ParamByName('psRESULTADO').AsInteger) + ' - ' +
                    ParamByName('psTxResultado').AsString;
           ShowMessage(vlErr);
           GenMsg(vlErr,Apli);
        end;
        //end if;
     end;
   finally
      sptActualizaCes.Free;
   end;
   STPACTUALIZACES := vlResultado;
   if vlResultado THEN
   Begin
      MessageDlg('Se han realizado los ajustes correspondientes a la cesión y sus documentos' ,
                  mtInformation, [ mbOK ] , 0 );
   end;
end;
{-------------------------------------------------------------------------------------------
         OBTIENE EL IMPORTES Y PORCENTAJES DEL PROVEEDOR
-------------------------------------------------------------------------------------------}
function TCrCesion.STPOBTIMPPROV( peIdCesion : String) : Boolean;
var   sptObtImpProv : TStoredProc;
      vlResultado    : Boolean;
Begin
   vlResultado := True;
   try
     sptObtImpProv := TStoredProc.Create(Self);
     with sptObtImpProv do
     begin
        //Inicia el SPT
        sptObtImpProv.DatabaseName:= Apli.DatabaseName;
        sptObtImpProv.SessionName:= Apli.SessionName;
        sptObtImpProv.StoredProcName:= 'PKGCRPERIODO.OBTIMPDISPPROVPJSEC';
        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCESION',ptInput);
        Params.CreateParam(ftFloat,'PSIMPDISPPROVPJ',ptOutput);
        Params.CreateParam(ftFloat,'PSPCTDISPPROVSEC',ptOutput);
        Params.CreateParam(ftFloat,'PSIMPDISPPROVSEC',ptOutput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('PEIDCESION').AsString := peIdCesion;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger = 0) then
        Begin
            DISPONIBLE_PROV_PJ.AsFloat := ParamByName('PSIMPDISPPROVPJ').AsFloat;
            PCT_PROV_SEC.AsFloat :=ParamByName('PSPCTDISPPROVSEC').AsFloat;
            IMP_PROV_SEC.AsFloat :=ParamByName('PSIMPDISPPROVSEC').AsFloat;
        end
        else
        Begin
           vlResultado := False;
           ShowMessage('PROBLEMAS AL OBTENER LOS IMPORTES DISPONIBLES DEL PROVEEDOR : ' +
                      IntToStr(ParamByName('psRESULTADO').AsInteger));
           ShowMessage(ParamByName('psTxResultado').AsString);
        end;
        //end if;
     end;
   finally
      sptObtImpProv.Free;
   end;
   STPOBTIMPPROV := vlResultado;
end;

(***********************************************FORMA CR_CESION********************)
(*                                                                              *)
(*  FORMA DE CR_CESION                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CESION********************)

Function TWCrCesion.RevisaFacturasElectronicas(peidcesion:string):integer;
var vlsql :  String;
    vlQry : TQuery;
    vlBencfact:boolean;
begin
   vlBencfact:=false;
   vlsql:=' SELECT SERIE_RECIBO, SIT_COMPROBANTE, SIT_PROCESO, F_OPERACION '+coCRLF+
          '   FROM SFE_COMPROBANTE '+coCRLF+
          '  WHERE ID_CESION = '+peidcesion+' ';
//          '   AND SIT_COMPROBANTE = 1 '+coCRLF+
//          '   AND SIT_PROCESO IN (1,0) ';

   vlQry := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   try
      if vlQry <> nil then
      begin
        {
         if vlQry.FieldByName('SIT_COMPROBANTE').AsString = '1' then RevisaFacturasElectronicas:=1;
         begin
            if vlQry.FieldByName('SIT_PROCESO').AsString = '1' then RevisaFacturasElectronicas:=1;
            if vlQry.FieldByName('SIT_PROCESO').AsString = '0' then RevisaFacturasElectronicas:=2;
         end;
         }
         while NOT vlQry.Eof do
         begin
             //if vlQry.FieldByName('SIT_COMPROBANTE').AsString <> '0' then
            if vlQry.FieldByName('SIT_PROCESO').AsString = '0' then  //HERJA AGOSTO 2013
                vlBencfact:=true;
            vlQry.Next;
         end;
      end
      else
         vlBencfact:=false;
   finally
      if vlQry <> nil then vlQry.free;
   end;

   if vlBencfact=false then RevisaFacturasElectronicas:=0    //NO HAY FACTURAS ELECTRONICAS
   else  RevisaFacturasElectronicas:=3;
end;


procedure TWCrCesion.FormShow(Sender: TObject);
begin
      icpCONTRATO.Frame := Objeto.CreCto.Contrato;
      icpCONTRATO.RefrescaInfo; //Refresca la información del Contrato

      //Pinta los datos del panel inferior
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_CESION.Control:=edID_CESION;
      Objeto.CVE_LIQUIDACION.Control:=edCVE_LIQUIDACION;
      Objeto.ID_EMISOR.Control:=edID_EMISOR;
      Objeto.CVE_EMISOR_NAFIN.Control := edCVE_EMISOR_NAFIN;
      Objeto.ID_PROVEEDOR.Control:=edID_PROVEEDOR;
      Objeto.IMP_CESION.Control:=edIMP_CESION;
      Objeto.TX_INSTRUC_LIQ.Control:=edTX_INSTRUC_LIQ;
      Objeto.B_OPERADO_NAFIN.Control:=chB_OPERADO_NAFIN;
      Objeto.B_APLICA_COM.Control:=chB_APLICA_COM;
      Objeto.PCT_COMISION.Control:=edPCT_COMISION;
      Objeto.SIT_CESION.Control:=lbSIT_CESION;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USUA_ALTA;
      Objeto.F_AUTORIZA.Control:=edF_AUTOR;
      Objeto.CVE_USU_AUTORIZA.Control:=edCVE_USUA_AUTOR;
      Objeto.F_MODIFICA.Control:=edF_MODIF;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USUA_MODIF;
      Objeto.IMP_COMPRA.Control := edIMP_DISPUESTO;
      Objeto.DISPONIBLE_PROV.Control := edIDISPONIBLE_PROV;
      Objeto.CVE_TIPO_INTERES.Control := rgCVE_TIPO_INTERES;
      Objeto.DISPONIBLE_PROV_PJ.Control := edDISP_PROV_PJ;
      Objeto.PCT_PROV_SEC.Control := edDISP_PCT_PRO_SEC;
      Objeto.IMP_PROV_SEC.Control := edDISP_PROV_SEC;

      Objeto.CreCto.DISPONIBLE_ACRED.Control := iedDISPONIBLE_ACRED;
      Objeto.CreCto.DISPONIBLE_GRUPO_ECO.Control := iedDISPONIBLE_GRUPO_ECO;
      Objeto.CreCto.DISPONIBLE_AUT.Control := iedDISPONIBLE_AUT;
      Objeto.CreCto.ID_CONTRATO.Control:= iedID_CONTRATO;
      Objeto.CreCto.CVE_PRODUCTO_CRE.Control := edPRODUCTO;
      Objeto.CreCto.Producto.DESC_C_PRODUCTO.Control :=edDESC_PRODUCTO;
      Objeto.CreCto.GetParams(Objeto);

      Objeto.Emisor.Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;
      Objeto.Emisor.NOMBRE_EMISOR.Control := edNOMBRE_EMISOR;
      Objeto.EmiProv.CVE_FND_ENT_DES.Control := edCVE_FND_ENT_DES;
      Objeto.Emisor.GetParams(Objeto);

      Objeto.EmiProv.Proveedor.Persona.Nombre.Control :=edNOM_PROVEEDOR;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//      Objeto.EmiProv.Proveedor.ID_PROV_NAFINSA.Control := edID_PROV_NAFINSA;
      Objeto.EmiProv.Proveedor.ID_PROV_EXTERNO.Control := edID_PROV_NAFINSA;
{/ROIM}
      Objeto.EmiProv.ID_PROMOTOR.Control := edID_PROM_ADM;
      Objeto.EmiProv.Promotor.Persona.Nombre.Control :=  edNOMBRE_PROM_ADM;
      Objeto.EmiProv.IMP_RIESGO_ACUM.Control := edIMP_DISP_GPO_PROV;
      Objeto.EmiProv.GetParams(Objeto);

      Objeto.LiqDisp.DESC_LIQUIDACION.Control := edDESC_LIQUIDACION;
      Objeto.LiqDisp.GetParams(Objeto);

      Objeto.PromotorAdm.ID_Persona.Control := edID_PROM_ADM;
      Objeto.ID_PROM_ADM.Control := edID_PROM_ADM;
      Objeto.PromotorAdm.Nombre.Control :=edNOMBRE_PROM_ADM;
      Objeto.PromotorAdm.GetParams(Objeto);

      InterForma1.MsgPanel := MsgPanel;

      //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
      vgCambio := False;
      Objeto.CalcInt.CVE_CALCULO_INT.Control:=edCVE_CALCULO;
      Objeto.CalcInt.DESC_CALCULO.Control :=edDESC_CALC_INT;
      Objeto.CVE_TASA_REFER.Control:=edCVE_TASA_REFER;
      Objeto.TasaRefer.DESC_TASA_INDIC.Control := edDESC_TASA_REFER;
      Objeto.TasaRefer.GetParams(Objeto);
      Objeto.UTiempoTasa.CVE_UNIDAD_TIEMP.Control := cbUNIDAD_TIEMPO_RE;
      Objeto.TipoAmort.CVE_AMORTIZACION.Control:=edCVE_AMORTIZACION;
      Objeto.TipoAmort.DESC_AMORTIZA.Control :=edDESC_TIPO_AMORT;
      Objeto.UTiempoCap.CVE_UNIDAD_TIEMP.Control := cbUNIDAD_TIEMPO_CP;

      Objeto.Credito.CVE_CALCULO.Control:=edCVE_CALCULO;
      Objeto.Credito.CalcInt.DESC_CALCULO.Control :=edDESC_CALC_INT;
      Objeto.Credito.CVE_TIPO_TASA.Control := cbTIPO_TASA;
      Objeto.Credito.CVE_TASA_REFER.Control:=edCVE_TASA_REFER;
      Objeto.Credito.TasaRefer.DESC_TASA_INDIC.Control := edDESC_TASA_REFER;
      Objeto.Credito.TasaRefer.GetParams(Objeto);
      Objeto.Credito.UTiempoTasa.CVE_UNIDAD_TIEMP.Control := cbUNIDAD_TIEMPO_RE;
      Objeto.Credito.NUM_UNIDADES_RE.Control := edNUM_UNIDADES_RE;
      Objeto.Credito.DIA_REVISION.Control := cbDIA_REVISION;
      Objeto.Credito.F_PROX_REVISION.Control := edF_PROX_REVISION;
      Objeto.Credito.OPERADOR_STASA.Control:=cbOPERADOR_STASA;
      Objeto.Credito.SOBRETASA.Control:=edSOBRETASA;
      Objeto.Credito.TASA_CREDITO.Control:=edTASA_CREDITO;
      Objeto.Credito.CVE_AMORTIZACION.Control:=edCVE_AMORTIZACION;
      Objeto.Credito.TipoAmort.DESC_AMORTIZA.Control :=edDESC_TIPO_AMORT;
      Objeto.Credito.UTiempoCap.CVE_UNIDAD_TIEMP.Control := cbUNIDAD_TIEMPO_CP;
      Objeto.Credito.NUM_UNIDADES_CP.Control := edNUM_UNIDADES_CP;
      Objeto.Credito.DIA_PAGO_CAP.Control := cbDIA_PAGO_CAP;
      Objeto.Credito.F_INI_PAG_CAP.Control := edF_INI_PAG_CAP;
      Objeto.Credito.F_INICIO.Control := edF_INICIO;
      Objeto.Credito.DIAS_PLAZO.Control:=edDIAS_PLAZO;
      Objeto.Credito.F_VENCIMIENTO.Control := edF_VENCIMIENTO;
      Objeto.Credito.TASA_BASE.Control:= edVALOR_TASA;
      //</SST>
      //10 MAY 2011 Se Asocia Número de Solicitud Web
      Objeto.Credito.ID_SOLICITUD.Control:= edSolDisp;
      //<SST/>
      //--END    DEINTEC.DF

      dtpF_INICIO.Date:=Objeto.Apli.DameFechaEmpresa;
      dtpF_VENCIMIENTO.Date:=Objeto.Apli.DameFechaEmpresa;
      dtpF_PROX_REVISION.Date:=Objeto.Apli.DameFechaEmpresa;
      dtpF_INI_PAG_CAP.Date:=Objeto.Apli.DameFechaEmpresa;
end;

procedure TWCrCesion.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CESION.Control:=nil;
      Objeto.CVE_LIQUIDACION.Control:=nil;
      Objeto.ID_EMISOR.Control:=nil;
      Objeto.CVE_EMISOR_NAFIN.Control := nil;
      Objeto.ID_PROVEEDOR.Control:=nil;
      Objeto.IMP_CESION.Control:=nil;
      Objeto.TX_INSTRUC_LIQ.Control:=nil;
      Objeto.B_OPERADO_NAFIN.Control:=nil;
      Objeto.B_APLICA_COM.Control:=nil;
      Objeto.PCT_COMISION.Control:=nil;
      Objeto.SIT_CESION.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_AUTORIZA.Control:=nil;
      Objeto.CVE_USU_AUTORIZA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
      Objeto.IMP_COMPRA.Control := NIL;
      Objeto.DISPONIBLE_PROV.Control := NIL;
      Objeto.CVE_TIPO_INTERES.Control := NIL;
      Objeto.DISPONIBLE_PROV_PJ.Control := NIL;
      Objeto.PCT_PROV_SEC.Control := NIL;
      Objeto.IMP_PROV_SEC.Control := NIL;

      Objeto.CreCto.DISPONIBLE_ACRED.Control := nil;
      Objeto.CreCto.DISPONIBLE_GRUPO_ECO.Control := nil;
      Objeto.CreCto.DISPONIBLE_AUT.Control := nil;

      Objeto.CreCto.ID_CONTRATO.Control := nil;
      Objeto.CreCto.CVE_PRODUCTO_CRE.Control := nil;
      Objeto.CreCto.Producto.DESC_C_PRODUCTO.Control :=nil;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := nil;
      Objeto.Emisor.NOMBRE_EMISOR.Control := nil;
      Objeto.EmiProv.CVE_FND_ENT_DES.Control := nil;

      Objeto.EmiProv.Proveedor.Persona.Nombre.Control :=nil;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//      Objeto.EmiProv.Proveedor.ID_PROV_NAFINSA.Control := nil;
      Objeto.EmiProv.Proveedor.ID_PROV_EXTERNO.Control := nil;
{/ROIM}
      Objeto.EmiProv.ID_PROMOTOR.Control := nil;
      Objeto.EmiProv.Promotor.Persona.Nombre.Control :=  nil;
      Objeto.EmiProv.IMP_RIESGO_ACUM.Control := nil;
      Objeto.LiqDisp.DESC_LIQUIDACION.Control := nil;
      Objeto.PromotorAdm.ID_Persona.Control := nil;
      Objeto.ID_PROM_ADM.Control := nil;
      Objeto.PromotorAdm.Nombre.Control :=nil;

      //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
      Objeto.CalcInt.CVE_CALCULO_INT.Control:=nil;
      Objeto.CalcInt.DESC_CALCULO.Control :=nil;
      Objeto.CVE_TASA_REFER.Control:=nil;
      Objeto.TasaRefer.DESC_TASA_INDIC.Control := nil;
      Objeto.UTiempoTasa.CVE_UNIDAD_TIEMP.Control := nil;
      Objeto.UTiempoCap.CVE_UNIDAD_TIEMP.Control := nil;
      Objeto.TipoAmort.CVE_AMORTIZACION.Control:=nil;
      Objeto.TipoAmort.DESC_AMORTIZA.Control :=nil;
      Objeto.Credito.ID_SOLICITUD.Control:= nil; //SST100511
      //--END    DEINTEC.DF
   //Objeto
end;

procedure TWCrCesion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action:= caFree; end;

procedure TWCrCesion.InterForma1DespuesNuevo(Sender: TObject);
begin
  //SE INICIALIZAN INTERCAMPOS
  Objeto.VGTIPO_DISPOSICION := 'DI';  //RABA MAY 2014 ACTUALIZACIÓN B-6
  lbTipo_Disp.Caption := '|';
  lbEstadoCesion.Caption := '|';
  Objeto.SIT_CESION.AsString := 'NA';
  Objeto.CVE_TIPO_INTERES.AsString := 'IN';
  Objeto.IMP_CESION.AsFloat :=0;
  Objeto.PCT_COMISION.AsFloat := 0;
  Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
  Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
  if chB_APLICA_COM.Checked = False then
  begin
    edPCT_COMISION.Enabled := False;
    edPCT_COMISION.Color := clBtnFace;
  end
  else
  begin
    edPCT_COMISION.Enabled := True;
    edPCT_COMISION.Color := clWindow;
  end;
  MuestraHints;
  iedID_CONTRATO.SetFocus;
  //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
  gbDataCalc.Enabled:= False;
  edCVE_CALCULO.Color:= clBtnFace;
  cbTIPO_TASA.Color:= clBtnFace;
  edCVE_TASA_REFER.Color:= clBtnFace;
  edNUM_UNIDADES_RE.Color:= clBtnFace;
  cbDIA_REVISION.Color:= clBtnFace;
  edF_PROX_REVISION.Color:= clBtnFace;
  edCVE_AMORTIZACION.Color:= clBtnFace;
  edNUM_UNIDADES_CP.Color:= clBtnFace;
  cbDIA_PAGO_CAP.Color:= clBtnFace;
  edF_INI_PAG_CAP.Color:= clBtnFace;
  cbOPERADOR_STASA.Color:= clBtnFace;
  edSOBRETASA.Color:= clBtnFace;
  edTASA_CREDITO.Color:= clBtnFace;
  edF_INICIO.Color:= clBtnFace;
  edDIAS_PLAZO.Color:= clBtnFace;
  edF_VENCIMIENTO.Color:= clBtnFace;
  cbUNIDAD_TIEMPO_CP.Color:=clBtnFace;
  edIMP_CESION.Color:= clBtnFace;
  edCVE_CALCULO.ReadOnly:= True;
  edCVE_TASA_REFER.ReadOnly:= True;
  edCVE_AMORTIZACION.ReadOnly:= True;
  cbUNIDAD_TIEMPO_CP.ReadOnly:= True;
  edF_INICIO.ReadOnly:= True;
  edDIAS_PLAZO.ReadOnly:= True;
  //F_VENCIMIENTO.ReadOnly:= True;
  edIMP_CESION.ReadOnly:= True;
  btCALC_INT.Enabled:= False;
  cbTIPO_TASA.Enabled:= False;
  btTASA_REFER.Enabled:= False;
  bbUNIDAD_TIEMPO_RE.Enabled:= False;
  btTIPO_AMORT.Enabled:= False;
  bbUNIDAD_TIEMPO_CP.Enabled:= False;
  dtpF_PROX_REVISION.Enabled:= False;
  dtpF_INI_PAG_CAP.Enabled:= False;
  cbOPERADOR_STASA.Enabled:= False;
  edSOBRETASA.Enabled:= False;
  edTASA_CREDITO.Enabled:= False;
  edF_INICIO.Enabled:= False;
  dtpF_INICIO.Enabled:= False;
  edDIAS_PLAZO.Enabled:= False;
  btDIASPLAZO.Enabled:= False;
  edF_VENCIMIENTO.Enabled:= False;
  dtpF_VENCIMIENTO.Enabled:= False;
  edIMP_CESION.Enabled:= False;
  edF_INICIO.Text := DateTimeToStr(Objeto.Apli.DameFechaEmpresa);
  edF_VENCIMIENTO.Text := DateTimeToStr(Objeto.Apli.DameFechaEmpresa);
  edNUM_UNIDADES_RE.Text := '1';
  edTASA_CREDITO.Text :='0';
  edNUM_UNIDADES_CP.Text := '1';
  edDIAS_PLAZO.Text := '0';
  cbDIA_REVISION.Text:= '31';
  cbDIA_PAGO_CAP.Text:= '31';
  vgVPN:= False;
  //--ENDDEINTEC.DF
  //</SST>
  //11 MAYO 2011
  //Se llenan los campos con los datos del monitor Web
  edSolDisp.Text:= '0';
  if Objeto.vgIdContratoWeb <> 0 then
  begin
    Objeto.Modo:= moAppend;
    Objeto.CreCto.ID_CONTRATO.AsInteger:= Objeto.vgIdContratoWeb;
    Objeto.CreCto.FindKey([Objeto.vgIdContratoWeb,'1']);
    iedID_CONTRATO.Text:= IntToStr(Objeto.vgIdContratoWeb);
    icpCONTRATO.RefrescaInfo;
    Objeto.ID_CONTRATO.AsFloat:= Objeto.CreCto.ID_CONTRATO.AsFloat;
    Objeto.FOL_CONTRATO.AsFloat:= Objeto.CreCto.FOL_CONTRATO.AsFloat;
    vgLiqMoneda:= ObtLiqMoneda(Objeto.CreCto.Contrato.Cve_Moneda.AsString,Objeto.Apli);
    if  vgLiqMoneda = CLIQ_LD then
    begin
      Objeto.CVE_LIQUIDACION.AsString:= C_MANUAL;
      Objeto.LiqDisp.FindKey([C_MANUAL]);
      Objeto.LiqDisp.BuscaWhereString:= 'CR_LIQUIDA_DISP.CVE_LIQUIDACION = ' + SQLStr(C_MANUAL);
      Objeto.LiqDisp.FilterString:= Objeto.LiqDisp.BuscaWhereString;
    end;
    iedID_CONTRATOExit(Sender);
    Objeto.Emisor.FindKeyNear([Objeto.vgIdEmisorWeb], ['ID_ACREDITADO']);
    Objeto.ID_EMISOR.AsString:= IntToStr(Objeto.vgIdEmisorWeb);
    edID_EMISORExit(Sender);
    //Objeto.EmiProv.FindKey([Objeto.vgIdEmisorWeb, Objeto.vgIdProveedor]); //Inicializa Id_Emisor
    edID_PROVEEDOR.Text:= IntToStr(Objeto.vgIdProveedor);
    edID_PROVEEDORExit(Sender);
    if Objeto.vgComDispWeb <> 0 then
    begin
      chB_APLICA_COM.Checked:= True;
      AplicaComision;
      edPCT_COMISION.Text:= FloatToStr(Objeto.vgComDispWeb);
    end;
    edSolDisp.Text:= FloatToStr(Objeto.vgIdSolWeb);
    if Objeto.vgIdTipoInteres = 1 then
      rgCVE_TIPO_INTERES.ItemIndex:= 0 //Al Inicio
    else
      rgCVE_TIPO_INTERES.ItemIndex:= 1; //Al Vencimiento
    iedID_CONTRATO.SetFocus;
  end;
  //<SST/>
end;

procedure TWCrCesion.InterForma1DespuesModificar(Sender: TObject);
begin
   icpCONTRATO.RefrescaInfo;
   iedID_CONTRATO.SetFocus;
   Objeto.PromotorAdm.FindKey([Objeto.Credito.ID_PROM_ADM.AsString]);
   //### BEGIN    DEINTEC.DF 29.ABRIL.2008    DESCUENTO MERCANTIL
   IF (Objeto.CreCto.Producto.CVE_CAL_CAPITAL.AsString = C_VPN) THEN
   BEGIN
      Objeto.Credito.FindKey([edID_CESION.Text]);
      Objeto.UTiempoTasa.FindKey([Objeto.Credito.UTiempoTasa.CVE_UNIDAD_TIEMP.asString]);
      Objeto.TasaRefer.FindKey([Objeto.Credito.CVE_TASA_REFER.asString]);
      Objeto.TipoAmort.FindKey([Objeto.Credito.CVE_AMORTIZACION.AsString]);
      Objeto.UTiempoCap.FindKey([Objeto.Credito.UTiempoCap.CVE_UNIDAD_TIEMP.asString]);

      if Objeto.Credito.CVE_TASA_REFER.AsString <> C_TASA_FIJA then
      Begin
           cbTIPO_TASA.Text := 'VARIABLE';
      end
      else if Objeto.Credito.CVE_TASA_REFER.AsString = C_TASA_FIJA then
      Begin
            edVALOR_TASA.Text := Objeto.CreCto.TASA_BASE.AsString;
      end;
   END
   ELSE
   BEGIN
       gbDataCalc.Enabled:= False;
       edCVE_CALCULO.Color:= clBtnFace;
       cbTIPO_TASA.Color:= clBtnFace;
       edCVE_TASA_REFER.Color:= clBtnFace;
       edNUM_UNIDADES_RE.Color:= clBtnFace;
       cbDIA_REVISION.Color:= clBtnFace;
       edF_PROX_REVISION.Color:= clBtnFace;
       edCVE_AMORTIZACION.Color:= clBtnFace;
       edNUM_UNIDADES_CP.Color:= clBtnFace;
       cbDIA_PAGO_CAP.Color:= clBtnFace;
       edF_INI_PAG_CAP.Color:= clBtnFace;
       cbOPERADOR_STASA.Color:= clBtnFace;
       edSOBRETASA.Color:= clBtnFace;
       edTASA_CREDITO.Color:= clBtnFace;
       edF_INICIO.Color:= clBtnFace;
       edDIAS_PLAZO.Color:= clBtnFace;
       edF_VENCIMIENTO.Color:= clBtnFace;
       cbUNIDAD_TIEMPO_CP.Color:=clBtnFace;
       edIMP_CESION.Color:= clBtnFace;

       edCVE_CALCULO.ReadOnly:= True;
       edCVE_TASA_REFER.ReadOnly:= True;
       edCVE_AMORTIZACION.ReadOnly:= True;
       cbUNIDAD_TIEMPO_CP.ReadOnly:= True;
       edF_INICIO.ReadOnly:= True;
       edDIAS_PLAZO.ReadOnly:= True;
       edIMP_CESION.ReadOnly:= True;

       btCALC_INT.Enabled:= False;
       cbTIPO_TASA.Enabled:= False;
       btTASA_REFER.Enabled:= False;
       bbUNIDAD_TIEMPO_RE.Enabled:= False;
       btTIPO_AMORT.Enabled:= False;
       bbUNIDAD_TIEMPO_CP.Enabled:= False;
       dtpF_PROX_REVISION.Enabled:= False;
       dtpF_INI_PAG_CAP.Enabled:= False;
       cbOPERADOR_STASA.Enabled:= False;
       edSOBRETASA.Enabled:= False;
       edTASA_CREDITO.Enabled:= False;
       edF_INICIO.Enabled:= False;
       dtpF_INICIO.Enabled:= False;
       edDIAS_PLAZO.Enabled:= False;
       btDIASPLAZO.Enabled:= False;
       edF_VENCIMIENTO.Enabled:= False;
       dtpF_VENCIMIENTO.Enabled:= False;
       edIMP_CESION.Enabled:= False;

       edF_INICIO.Text := DateTimeToStr(Objeto.Apli.DameFechaEmpresa);
       edF_VENCIMIENTO.Text := DateTimeToStr(Objeto.Apli.DameFechaEmpresa);
       edNUM_UNIDADES_RE.Text := '1';
       edTASA_CREDITO.Text :='0';
       edNUM_UNIDADES_CP.Text := '1';
       edDIAS_PLAZO.Text := '0';
       cbDIA_REVISION.Text:= '31';
       cbDIA_PAGO_CAP.Text:= '31';
       vgVPN:= False;
       edCVE_CALCULO.Text:= CNULL;
       edDESC_CALC_INT.Text:= CNULL;
       edCVE_TASA_REFER.Text:= CNULL;
       edDESC_TASA_REFER.Text:= CNULL;
       edVALOR_TASA.Text:= CNULL;
       cbOPERADOR_STASA.Text:= CNULL;
       edSOBRETASA.Text:= CNULL;
       edTASA_CREDITO.Text:= CNULL;
       cbUNIDAD_TIEMPO_RE.Text:= CNULL;
       edNUM_UNIDADES_RE.Text:= CNULL;
       cbDIA_REVISION.Text:= CNULL;
       edF_PROX_REVISION.Text:= CNULL;
       edCVE_AMORTIZACION.Text:= CNULL;
       edDESC_TIPO_AMORT.Text:= CNULL;
       cbUNIDAD_TIEMPO_CP.Text:= CNULL;
       edNUM_UNIDADES_CP.Text:= CNULL;
       cbDIA_PAGO_CAP.Text:= CNULL;
       edF_INI_PAG_CAP.Text:= CNULL;
   END;
   //### END      DEINTEC.DF 29.ABRIL.2008    DESCUENTO MERCANTIL
   AplicaComision;
end;


procedure TWCrCesion.btCONTRATOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCESION_PRODUC',True,True) then
   begin
     Objeto.CreCto.ShowAll := True;
     if Objeto.CreCto.Busca then
     begin
          Objeto.ID_CONTRATO.AsFloat := Objeto.CreCto.ID_CONTRATO.AsFloat;
          Objeto.FOL_CONTRATO.AsFloat := Objeto.CreCto.FOL_CONTRATO.AsFloat;
          icpCONTRATO.RefrescaInfo;//Refresca la informacion del Contrato
          Objeto.CreCto.ObtenDisponibleAut(Objeto.CreCto.ID_CONTRATO.AsString,Objeto.CreCto.FOL_CONTRATO.AsString);
          vgLiqMoneda := ObtLiqMoneda(Objeto.CreCto.Contrato.Cve_Moneda.AsString,Objeto.Apli);
          Objeto.CVE_TASA_REFER.AsString := Objeto.CreCto.CVE_TASA_REFER.AsString;
          Objeto.TasaRefer.FindKey([Objeto.CVE_TASA_REFER.asString]);
          edDESC_TASA_REFER.Text := Objeto.TasaRefer.DESC_TASA_INDIC.AsString;
          cbOPERADOR_STASA.Text := Objeto.CreCto.OPERADOR_STASA.AsString;
          Objeto.CVE_LIQUIDACION.AsString := '';
          Objeto.LiqDisp.BuscaWhereString := 'CR_LIQUIDA_DISP.SIT_LIQUIDA = ''AC''';
          Objeto.LiqDisp.FilterString := Objeto.LiqDisp.BuscaWhereString;
          if  vgLiqMoneda = CLIQ_LD then
          Begin
             Objeto.CVE_LIQUIDACION.AsString := C_MANUAL;
             Objeto.LiqDisp.FindKey([C_MANUAL]);
             Objeto.LiqDisp.BuscaWhereString := Objeto.LiqDisp.BuscaWhereString +
                                               ' AND CR_LIQUIDA_DISP.CVE_LIQUIDACION = ' + SQLStr(C_MANUAL);
             Objeto.LiqDisp.FilterString := Objeto.LiqDisp.BuscaWhereString;
          end;
          InterForma1.NextTab(iedID_CONTRATO);
     end;
   end;
end;

procedure TWCrCesion.ilCONTRATOCapture(Sender: TObject; var Show: Boolean);
begin
   Show := (InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrCesion.ilCONTRATOEjecuta(Sender: TObject);
begin
   if Objeto.CreCto.FindKey([ilCONTRATO.Buffer,'1']) then
   begin
        icpCONTRATO.RefrescaInfo;
        Objeto.ID_CONTRATO.AsFloat := Objeto.CreCto.ID_CONTRATO.AsFloat;
        Objeto.FOL_CONTRATO.AsFloat := Objeto.CreCto.FOL_CONTRATO.AsFloat;
        vgLiqMoneda := ObtLiqMoneda(Objeto.CreCto.Contrato.Cve_Moneda.AsString,Objeto.Apli);
        if  vgLiqMoneda = CLIQ_LD then
        Begin
           Objeto.CVE_LIQUIDACION.AsString := C_MANUAL;
           Objeto.LiqDisp.FindKey([C_MANUAL]);
           Objeto.LiqDisp.BuscaWhereString := 'CR_LIQUIDA_DISP.CVE_LIQUIDACION = ' + SQLStr(C_MANUAL);
           Objeto.LiqDisp.FilterString := Objeto.LiqDisp.BuscaWhereString;
        end;
        InterForma1.NextTab(iedID_CONTRATO);
   end;
end;

procedure TWCrCesion.iedID_CONTRATOExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      VLMsg := '';
      VLSalida := True;
      Objeto.ID_CONTRATO.GetFromControl;
      Objeto.FOL_CONTRATO.AsFloat := Objeto.CreCto.FOL_CONTRATO.AsFloat;
      If Objeto.CreCto.ID_CONTRATO.AsString = '' then
      Begin
         VLSalida := False;
         VLMsg:='Favor de Indicar la autorización';
      end
      else if (Objeto.CreCto.Contrato.Sit_Contrato.AsString <> 'AC') then
      Begin
         VLSalida := False;
         VLMsg:='Autorizacón no Activa';
      end
      else if not(objeto.CreCto.VerfVencimiento(Objeto.CreCto.ID_CONTRATO.AsString, Objeto.FOL_CONTRATO.AsString) )then
      Begin
          VLSalida := False;
          VLMsg:='El plazo de la Autorización venció el día: ' + edF_VENCIMIENTO.Text;
      end;


      //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
      vgSTant := strtofloat(edSOBRETASA.Text);
      if (Objeto.Modo=moAppend) then
      begin
           Objeto.CVE_TASA_REFER.AsString := Objeto.CreCto.CVE_TASA_REFER.AsString;
           Objeto.TasaRefer.FindKey([Objeto.CVE_TASA_REFER.asString]);
           edDESC_TASA_REFER.Text := Objeto.TasaRefer.DESC_TASA_INDIC.AsString;
           cbOPERADOR_STASA.Text := Objeto.CreCto.OPERADOR_STASA.AsString;
      end;

      if (VLSalida = True) AND (Objeto.CreCto.Producto.CVE_CAL_CAPITAL.AsString = C_VPN) then
      begin
         vgVPN:= True;
         gbDataCalc.Enabled:= True;
         cbTIPO_TASA.Color:= clWindow;
         edNUM_UNIDADES_RE.Color:= clWindow;
         cbDIA_REVISION.Color:= clWindow;
         edF_PROX_REVISION.Color:= clWindow;
         edNUM_UNIDADES_CP.Color:= clWindow;
         cbDIA_PAGO_CAP.Color:= clWindow;
         edF_INI_PAG_CAP.Color:= clWindow;
         cbOPERADOR_STASA.Color:= clWindow;
         edSOBRETASA.Color:= clWindow;
         edIMP_CESION.Color:= clWindow;
         edF_INICIO.Color:= clWindow;
         edDIAS_PLAZO.Color:= clWindow;
         edF_VENCIMIENTO.Color:= clWindow;
         edCVE_CALCULO.Color:= clWindow;
         edCVE_TASA_REFER.Color:= clWindow;

         btCALC_INT.Enabled:= True;
         cbTIPO_TASA.Enabled:= True;
         btTASA_REFER.Enabled:= True;
         bbUNIDAD_TIEMPO_RE.Enabled:= True;
         btTIPO_AMORT.Enabled:= True;
         bbUNIDAD_TIEMPO_CP.Enabled:= True;
         dtpF_PROX_REVISION.Enabled:= True;
         dtpF_INI_PAG_CAP.Enabled:= True;
         cbOPERADOR_STASA.Enabled:= True;
         edSOBRETASA.Enabled:= True;
         dtpF_INICIO.Enabled:= True;
         btDIASPLAZO.Enabled:= True;
         edF_INICIO.Enabled:= True;
         edDIAS_PLAZO.Enabled:= True;
         edF_VENCIMIENTO.Enabled:= True;
         dtpF_VENCIMIENTO.Enabled:= True;
         edIMP_CESION.Enabled:= True;
         edIMP_CESION.Enabled:= True;
         edCVE_TASA_REFER.Enabled:= True;

         rgCVE_TIPO_INTERES.ItemIndex:= 1;
         rgCVE_TIPO_INTERES.Enabled:= False;

         edIMP_CESION.ReadOnly:= False;
         edDIAS_PLAZO.ReadOnly:= False;

         chB_OPERADO_NAFIN.Enabled:= False;

         if Objeto.CreCto.CVE_TASA_REFER.AsString = '' then
            VerificaTasaRefer;
         //end if;
         if Objeto.CVE_TASA_REFER.AsString <> C_TASA_FIJA then
         Begin
              cbTIPO_TASA.Text := 'VARIABLE';
              cbTIPO_TASA.Enabled := True;
              edVALOR_TASA.Text := ValorTasa(Objeto.TasaRefer.CVE_TASA_INDICAD.AsString);
         end
         else if Objeto.CVE_TASA_REFER.AsString = C_TASA_FIJA then
         Begin
               edVALOR_TASA.Text := Objeto.CreCto.TASA_BASE.AsString;
               cbTIPO_TASA.Enabled := False;
               cbTIPO_TASA.Text := 'FIJA';
               bbUNIDAD_TIEMPO_RE.Enabled := False;
               edNUM_UNIDADES_RE.Enabled := False;
               cbDIA_REVISION.Enabled := False;
               edF_PROX_REVISION.Enabled := False;
               dtpF_PROX_REVISION.Enabled := False;
               edNUM_UNIDADES_RE.Color := clBtnFace;
               cbDIA_REVISION.Color := clBtnFace;
               edF_PROX_REVISION.Color := clBtnFace;
               edF_PROX_REVISION.Text := edF_INICIO.Text;
         end;
         ValorTasaCred;
         VerificaTasaRefer;
      end;

      if (VLSalida = True) AND (Objeto.CreCto.Producto.CVE_CAL_CAPITAL.AsString <> C_VPN) then
      begin

         Objeto.CalcInt.Active := false;
         Objeto.TasaRefer.Active := false;
         Objeto.UTiempoTasa.Active := false;
         Objeto.TipoAmort.Active := false;
         Objeto.UTiempoCap.Active := false;

         vgVPN:= False;
         gbDataCalc.Enabled:= False;
         cbTIPO_TASA.Color:= clBtnFace;
         edNUM_UNIDADES_RE.Color:= clBtnFace;
         cbDIA_REVISION.Color:= clBtnFace;
         edF_PROX_REVISION.Color:= clBtnFace;
         edNUM_UNIDADES_CP.Color:= clBtnFace;
         cbDIA_PAGO_CAP.Color:= clBtnFace;
         edF_INI_PAG_CAP.Color:= clBtnFace;
         cbOPERADOR_STASA.Color:= clBtnFace;
         edSOBRETASA.Color:= clBtnFace;
         edIMP_CESION.Color:= clBtnFace;
         edF_INICIO.Color:= clBtnFace;
         edDIAS_PLAZO.Color:= clBtnFace;
         edF_VENCIMIENTO.Color:= clBtnFace;
         edCVE_CALCULO.Color:= clBtnFace;
         edCVE_TASA_REFER.Color:= clBtnFace;

         btCALC_INT.Enabled:= False;
         cbTIPO_TASA.Enabled:= False;
         btTASA_REFER.Enabled:= False;
         bbUNIDAD_TIEMPO_RE.Enabled:= False;
         btTIPO_AMORT.Enabled:= False;
         bbUNIDAD_TIEMPO_CP.Enabled:= False;
         dtpF_PROX_REVISION.Enabled:= False;
         dtpF_INI_PAG_CAP.Enabled:= False;
         cbOPERADOR_STASA.Enabled:= False;
         edSOBRETASA.Enabled:= False;
         dtpF_INICIO.Enabled:= False;
         btDIASPLAZO.Enabled:= False;
         edF_INICIO.Enabled:= False;
         edDIAS_PLAZO.Enabled:= False;
         edF_VENCIMIENTO.Enabled:= False;
         dtpF_VENCIMIENTO.Enabled:= False;
         edIMP_CESION.Enabled:= False;
         edIMP_CESION.Enabled:= False;
         edCVE_TASA_REFER.Enabled:= False;

         rgCVE_TIPO_INTERES.Enabled := True;

         edIMP_CESION.ReadOnly:= True;
         edDIAS_PLAZO.ReadOnly:= True;

         chB_OPERADO_NAFIN.Enabled := True;

         edCVE_TASA_REFER.Text := CNULL;
         edVALOR_TASA.Text := CNULL;
         edTASA_CREDITO.Text := CNULL;
         edSOBRETASA.Text := CNULL;
      end;

      //--END    DEINTEC.DF
      //end if

      if ( Objeto.CreCto.Acreditado.B_APLI_REL_MON.AsString = CFALSO ) OR
          ( Objeto.CreCto.Acreditado.B_APLI_REL_MON.AsString = CNULL  )then
       Begin
           Objeto.TasaRefer.BuscaWhereString := ' TASA_INDIC_FINAN.CVE_TASA_INDICAD IN  ' +
                                                ' ( SELECT CVE_TASA_REFER FROM CR_REL_PROD_MON ' +
                                                ' WHERE     CR_REL_PROD_MON.CVE_MONEDA = ' + Objeto.CreCto.CVE_MONEDA.AsString+
                                                ' AND CR_REL_PROD_MON.CVE_PRODUCTO_CRE = ' + #39 + Objeto.CreCto.CVE_PRODUCTO_CRE.AsString + #39 + ')';
           Objeto.TasaRefer.FilterString := Objeto.TasaRefer.BuscaWhereString;
       end
       else Begin
           Objeto.TasaRefer.BuscaWhereString := '';
           Objeto.TasaRefer.FilterString := Objeto.TasaRefer.BuscaWhereString;
       end;

      Objeto.Emisor.BuscaWhereString := ' CR_EMISOR.SIT_EMISOR = ' + #39 + CSIT_AC + #39+
                                        ' AND CR_EMISOR.ID_ACREDITADO = ' +
                                        Objeto.CreCto.Contrato.ID_Titular.AsString;
      Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;


      //02DIC2004
      if Objeto.CreCto.Acreditado.B_AUTORIZADO.AsString = CFALSO then
      begin
           VLSalida := False;
           ShowMessage('El Acreditado no se encuentra Autorizado por el Área de Créditos');
      end;

      // RABA OCT 2014 ACTUALIZACIÓN B6
      if (VLSalida = True) and (Objeto.VGTIPO_DISPOSICION = 'DI') then
         EvaluaNuevaDisp;
      // FIN RABA


      InterForma1.ValidaExit(btCONTRATO,VLSalida,VlMsg,True);
   End;
end;

procedure TWCrCesion.btEMISORClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCESION_EMISOR',True,True) then
   begin
     Objeto.Emisor.ShowAll := True;
     if Objeto.Emisor.Busca then
     Begin
  {ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
  //      Objeto.CVE_EMISOR_NAFIN.AsString := Objeto.Emisor.CVE_EMISOR_NAFIN.AsString;
        Objeto.CVE_EMISOR_NAFIN.AsString := Objeto.Emisor.CVE_EMISOR_EXT.AsString;
  {/ROIM}
        InterForma1.NextTab(edID_EMISOR);
     end;
  end;
end;

procedure TWCrCesion.ilEMISORCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrCesion.ilEMISOREjecuta(Sender: TObject);
begin
   if Objeto.Emisor.FindKeyNear([ilEMISOR.Buffer],['ID_ACREDITADO']) then
   Begin
      Objeto.ID_EMISOR.AsString := Objeto.Emisor.ID_ACREDITADO.AsString;
      InterForma1.NextTab(edID_EMISOR);
   end;
end;

procedure TWCrCesion.edID_EMISORExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMesg     := '';
      VLSalida := True;
      Objeto.ID_EMISOR.GetFromControl;
      if Objeto.ID_EMISOR.AsString = '' then
      Begin
         VLSalida  := False;
         VLMesg    := 'Favor de Indicar al Emisor';
      end
      else if Objeto.Emisor.SIT_EMISOR.AsString <> 'AC' then
      Begin
         VLSalida  := False;
         VLMesg     := 'Emisor no Activo';
      end
      else
      Begin
        Actualizaimportes;
      end;
      InterForma1.ValidaExit(edID_EMISOR,VLSalida,VLMesg,True);
   end; //end if
end;

procedure TWCrCesion.btPROVEEDORClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCESION_PROVEE',True,True) then
   begin
  {ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
     Objeto.EmiProv.BuscaWhereString := ' CR_EMISOR_PROV.ID_EMISOR IN ' +
                                        ' (SELECT ID_EMISOR FROM CR_EMISOR ' +
  //                                      '  WHERE  ID_EMISOR =  ' + Objeto.ID_EMISOR.AsString  +
  //                                      '  AND    CVE_EMISOR_NAFIN = ' +  Objeto.CVE_EMISOR_NAFIN.AsString +') ';
                                        '  WHERE  CVE_FND_ENT_DES =  ' + Objeto.Emisor.CVE_FND_ENT_DES.AsSQL  +
                                        '  AND    ID_EMISOR =  ' + Objeto.ID_EMISOR.AsSQL  +
                                        '  AND    CVE_EMISOR_EXT = ' +  Objeto.CVE_EMISOR_NAFIN.AsSQL +') ';
  {/ROIM}
     Objeto.EmiProv.FilterString := Objeto.EmiProv.BuscaWhereString;

     Objeto.EmiProv.ShowAll := True;
     if Objeto.EmiProv.Busca then
     Begin
        InterForma1.NextTab(edID_PROVEEDOR);
        Actualizaimportes;
     end;
   end;  
end;

procedure TWCrCesion.ilPROVEEDORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrCesion.ilPROVEEDOREjecuta(Sender: TObject);
begin
   if Objeto.EmiProv.FindKey([Objeto.ID_EMISOR.AsString,ilPROVEEDOR.Buffer]) then
       InterForma1.NextTab(edID_PROVEEDOR);
   //end if
end;

procedure TWCrCesion.edID_PROVEEDORExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMesg   := '';
      VLSalida := True;
      Objeto.ID_PROVEEDOR.GetFromControl;
      if Objeto.ID_PROVEEDOR.AsString = '' then
      Begin
         VLSalida  := False;
         VLMesg    := 'Favor de Indicar el Proveedor';
      end
      else if Objeto.EmiProv.SIT_EMISOR_PROV.AsString <> 'AC' then
      Begin
         VLSalida  := False;
         VLMesg     := 'Proveedor no Activo';
      end; //end if
      InterForma1.ValidaExit(edID_PROVEEDOR,VLSalida,VLMesg,True);
   end; //end if
end;

procedure TWCrCesion.btLIQUIDACIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCESION_LIQUI',True,True) then
   begin
     Objeto.LiqDisp.ShowAll := True;
     if Objeto.LiqDisp.Busca then
        InterForma1.NextTab(edCVE_LIQUIDACION);
     //end if
   end;
end;

procedure TWCrCesion.ilLIQUIDACIONCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrCesion.ilLIQUIDACIONEjecuta(Sender: TObject);
begin
   if Objeto.LiqDisp.FindKey([ilLIQUIDACION.Buffer]) then
       InterForma1.NextTab(edCVE_LIQUIDACION);
   //end if
end;

procedure TWCrCesion.edLIQUIDACIONExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMesg   := '';
      VLSalida := True;
      Objeto.CVE_LIQUIDACION.GetFromControl;
      if Objeto.CVE_LIQUIDACION.AsString = '' then
      Begin
         VLSalida  := False;
         VLMesg    := 'Favor de Indicar el Tipo de Liquidación';
      end;
      InterForma1.ValidaExit(edCVE_LIQUIDACION,VLSalida,VLMesg,True);
   end; //end if
end;

procedure TWCrCesion.chB_OPERADO_NAFINExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_OPERADO_NAFIN,True,'',True);
end;

procedure TWCrCesion.AplicaComision;
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

procedure TWCrCesion.chB_APLICA_COMClick(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      AplicaComision
   //end if
end;

procedure TWCrCesion.chB_APLICA_COMEnter(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      AplicaComision
   //end if
end;

procedure TWCrCesion.chB_APLICA_COMExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      InterForma1.ValidaExit(chB_APLICA_COM,True,'',True);
      if chB_APLICA_COM.Checked then
         edPCT_COMISION.SetFocus;
      //end if
   end;
end;

procedure TWCrCesion.edPCT_COMISIONExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
  VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
   //Verifica que el dato no sea negativo
      Objeto.PCT_COMISION.GetFromControl;
      if Objeto.PCT_COMISION.AsFloat <= 0 then
      Begin
         VLSalida := False;
         vlMsg := 'La comisión no puede ser menor o igual a cero';
      end;
      InterForma1.ValidaExit(edPCT_COMISION,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrCesion.edTX_INSTRUC_LIQExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edTX_INSTRUC_LIQ,True,'',True);
end;

procedure TWCrCesion.btPROM_ADMClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCESION_PRMADM',True,True) then
   begin
     Objeto.PromotorAdm.ShowAll := True;
     if Objeto.PromotorAdm.Busca then
     Begin
        Objeto.ID_PROM_ADM.AsString := Objeto.PromotorAdm.ID_Persona.AsString;
        InterForma1.NextTab(edID_PROM_ADM);
     end;
  end;   
end;

procedure TWCrCesion.ilPROMADMCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrCesion.ilPROMADMEjecuta(Sender: TObject);
begin
   if Objeto.PromotorAdm.FindKey([ilPROMADM.Buffer]) then
   Begin
      Objeto.ID_PROM_ADM.AsString := Objeto.PromotorAdm.ID_Persona.AsString;
      InterForma1.NextTab(edID_PROM_ADM);
   end;
end;

procedure TWCrCesion.InterForma1Buscar(Sender: TObject);
var vlProm : String;
begin
     if Objeto.Busca then
     Begin
       icpCONTRATO.RefrescaInfo; //Refresca la información del Contrato
       MuestraHints;
       vlProm := Objeto.Credito.ID_PROM_ADM.AsString;
       Objeto.PromotorAdm.FindKey([Objeto.Credito.ID_PROM_ADM.AsString]);
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//       Objeto.Emisor.FindKey([Objeto.ID_EMISOR.AsString,Objeto.CVE_EMISOR_NAFIN.AsString]);
//       Objeto.EmiProv.Proveedor.FindKey([Objeto.ID_PROVEEDOR.AsString]);
       Objeto.Emisor.FindKey([Objeto.CVE_FND_ENT_DES.AsString,Objeto.ID_EMISOR.AsString,Objeto.CVE_EMISOR_NAFIN.AsString]);
       Objeto.EmiProv.Proveedor.FindKey([Objeto.CVE_FND_ENT_DES.AsString,Objeto.ID_PROVEEDOR.AsString]);
{/ROIM}
       Actualizaimportes; //actualiza los saldos de la cesion
       verificaSituacion;

       // RABA OCT 2014 ACTUALIZACION B6 E INTEGRACION DE WEB SERVICES
       if HayVencidos(Objeto.Credito.ID_CRE_RENOVADO.AsString) then
          lbEstadoCesion.Caption := 'VENCIDO'
       else
          lbEstadoCesion.Caption := 'VIGENTE';
       // fin RABA
    end;
end;

procedure TWCrCesion.btDOCTOClick(Sender: TObject);
var
  //---DEINTEC.DF        REMOVED TO DESCUENTO MERCANTIL         Docto: TCrDocto;
  P:      TPoint;       //---   DEINTEC.DF 22.ABRIL.2008    DESCUENTO MERCANTIL
begin
   if Objeto.ValidaAccesoEsp('TCRCESION_CESION',True,True) then
   begin
     //---   DEINTEC.DF 22.ABRIL.2008    DESCUENTO MERCANTIL
     GetCursorPos(P);
     PopupCesion.Popup(P.X, P.Y);
     //--END    DEINTEC.DF

     {   if Objeto.Active then
     begin
        Docto := TCrDocto.Create(self);
        try
           Docto.Apli:=Objeto.Apli;
           Docto.ParamCre:=Objeto.ParamCre;
           Objeto.vlCesion := Objeto.ID_CESION.AsString;
           Docto.vgCesion := Objeto.vlCesion;
           Docto.Cesion := Objeto;
           Docto.CVE_TIPO_INTERES.AsString := Objeto.CVE_TIPO_INTERES.AsString;
           Docto.Catalogo;
        finally
               Docto.Free;
               Objeto.FindKey([Docto.Cesion.ID_CESION.AsString]);
               Actualizaimportes;
        end;
     end
     else
        ShowMessage('Debe de seleccionar una cesión.');
     //end if;}//--       DEINTEC.DF              REMOVED TO DESCUENTO MERCANTIL
   end;  
end;

Procedure TWCrCesion.MuestraHints;
Begin
      edDESC_PRODUCTO.Hint := Objeto.CreCto.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO.ShowHint := True;
      edNOM_ACREDITADO.Hint := Objeto.Emisor.Acreditado.Persona.Nombre.AsString;
      edNOM_ACREDITADO.ShowHint := True;
      edNOMBRE_EMISOR.Hint := Objeto.Emisor.NOMBRE_EMISOR.AsString;
      edNOMBRE_EMISOR.ShowHint := True;
      edNOM_PROVEEDOR.Hint := Objeto.EmiProv.Proveedor.Persona.Nombre.AsString;
      edNOM_PROVEEDOR.ShowHint := True;
      edDESC_LIQUIDACION.Hint := Objeto.LiqDisp.DESC_LIQUIDACION.AsString;
      edDESC_LIQUIDACION.ShowHint := True;
      edTX_INSTRUC_LIQ.Hint := Objeto.TX_INSTRUC_LIQ.AsString;
      edTX_INSTRUC_LIQ.ShowHint := True;
      edNOMBRE_PROM_ADM.Hint := Objeto.PromotorAdm.Nombre.AsString;
      edNOMBRE_PROM_ADM.ShowHint := True;

      //---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
      edDESC_CALC_INT.Hint := Objeto.CalcInt.DESC_CALCULO.AsString;
      edDESC_CALC_INT.ShowHint := True;
      edDESC_TASA_REFER.Hint := Objeto.CreCto.TasaRefer.DESC_TASA_INDIC.AsString;
      edDESC_TASA_REFER.ShowHint := True;
      edDESC_TIPO_AMORT.Hint := Objeto.TipoAmort.DESC_AMORTIZA.AsString;
      edDESC_TIPO_AMORT.ShowHint := True;
      //--END    DEINTEC.DF
End;

procedure TWCrCesion.InterForma1DespuesAceptar(Sender: TObject);
begin
  MuestraHints;
  if not Objeto.ValidaImpMaxCes(Objeto.ID_CESION.AsInteger) then
     btAUTORIZA_CESION.Enabled := False;
  //end if
  Actualizaimportes;
end;

procedure TWCrCesion.edID_PROM_ADMExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      //No permite nulos, verifca que debe de ingresar el promotor
      Objeto.ID_PROM_ADM.GetFromControl;
      if Objeto.ID_PROM_ADM.AsString = '' then
      Begin
          VLSalida := False;
          VLmsg := 'Favor de indicar el promotor administrativo';
      end;
      InterForma1.ValidaExit(edID_PROM_ADM,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrCesion.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
        Procedure ValidaComis;
        Begin
           if (chB_APLICA_COM.Checked) and (Objeto.PCT_COMISION.AsFloat <= 0) then
           Begin
                edPCT_COMISION.SetFocus;
                Realizado := False;
                ShowMessage('El % de comisión no puede ser menor o igual a cero');
           end
           else Realizado := True;
        end;
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           ValidaComis;
      end
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           ValidaComis;
      end
      else Realizado := False;
   end
end;

procedure TWCrCesion.btOPERA_BLOQUEClick(Sender: TObject);
var  AutCanCes: TCraucacs;
begin
   if Objeto.ValidaAccesoEsp('TCRCESION_BUBLOQ',True,True) then
   begin
      AutCanCes := TCraucacs.Create(self);
      try
         AutCanCes.Apli:=Objeto.Apli;
         AutCanCes.ParamCre:=Objeto.ParamCre;
         AutCanCes.Cesion := Objeto;
         AutCanCes.Catalogo;
      finally
             AutCanCes.Free;
             icpCONTRATO.RefrescaInfo; //Refresca la información del Contrato
             btCANCELA_CESION.Enabled  := True;
             btAUTORIZA_CESION.Enabled := True;
             Actualizaimportes;
      end;
   end;   
end;

procedure TWCrCesion.btAUTORIZA_CESIONClick(Sender: TObject);
var vlContinua : Boolean;
    vlMsg, vlErr : String;
    temporal: TCrGenVto;
    vlclave : String;

    BerrorPLD:boolean;
    vlError  :string;
    vlQry : TQuery;
    vlsql :string;
Begin
//   begin
    vlclave := '18';
//JFOF VALIDA USUARIO 12/10/2011
  if Objeto.ValidaAccesoEsp('TCRCESION_AUTORI',True,True) then
//  if ValidaUsuario(Objeto.Apli, vlClave) then
//JFOF VALIDA USUARIO 12/10/2011  
  begin
   vlMsg := '';
   vlErr := '';
   vlContinua := True;

   MErrores.Lines.Clear; //<EASA 25.ABR.2007     Req. Dolares
   if Objeto.Active then
   begin
       if Objeto.SIT_CESION.AsString = CSIT_AU then
          ShowMessage('La situación ya ha sido Autorizada')
       ELSE IF not Objeto.ValidaPerfilUsuario then
       Begin
          btAUTORIZA_CESION.Enabled := False;
       end
       else
       Begin
          btAUTORIZA_CESION.Enabled := True;

          //HERJA - VALIDA QUE LOS PLAZOS DE CAPITAL E INTERES INICIEN AL MISMO TIEMPO EN CASO DE SER UN VPN
//          vlContinua:=Objeto.ValidaPlazosVPN(Objeto.ID_CESION.AsString);

          if (Objeto.SIT_CESION.AsString = CSIT_NA) AND (vlContinua) then
          Begin
             if MessageDlg('¿Está seguro de autorizar la cesión',
                             mtConfirmation, [mbYes, mbNo], 0) = mrYes then
             Begin
                 MessageIniFinProceso( MErrores, cInicio ); //<EASA 25.ABR.2007     Req. Dolares
                // <EASA 07 DIC 2005  SE INCORPORA RUTIRNA PAR VERIFICAR DISP IMPAGADAS DEL ACREDITADO>
//                if not FindDispIM(Objeto.CreCto.Acreditado.ID_ACREDITADO.AsInteger,Objeto.Apli, vlMsg) then Begin
                if not FindDispIMPProv(Objeto.ID_PROVEEDOR.AsInteger,Objeto.Apli, vlMsg) then Begin
                   if MessageDlg( vlMsg + ' ¿ Desea Continuar ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                      vlContinua := True
                   else begin
                     vlContinua := False;
                     exit;
                   end
                end;

                //</EAS4A011    22.AGO.2007     Valida Tasa a una fecha determinada
                if not ValidaExisTasaFnd(Objeto.Credito.ID_CREDITO.AsString,Objeto.Apli.DameFechaEmpresa, Objeto.Apli) then Begin
                   if MessageDlg( ' El valor de la tasa de fondeo es nula. ¿ Desea Continuar ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                      vlContinua := True
                   else begin
                     vlContinua := False;
                     exit;
                   end
                end;
                //end_EASA>/

               //HERJA - VALIDA QUE LOS PLAZOS DE CAPITAL E INTERES INICIEN AL MISMO TIEMPO EN CASO DE SER UN VPN
               if vlContinua then
                  vlContinua:=Objeto.ValidaPlazosVPN(Objeto.ID_CESION.AsString);

               //RABA OCT 2013 O17
               //VALIDA EXISTENCIA DE SOLICITUD WEB
               If vlContinua then
               Begin
                 IF (Objeto.Credito.ID_SOLICITUD.IsNull) OR (Objeto.Credito.ID_SOLICITUD.AsInteger = 0) THEN
                 Begin
                   If MessageDlg('La cesión no está asociada a una solicitud. ¿Desea continuar? ',
                      mtConfirmation,[mbYes, mbNo], 0) = mrYes then
                      vlContinua:= True
                   else
                      vlContinua := False;
                 end;
               end;
               //FIN RABA

               //VALIDA PLD HERJA FEBRERO 2013
               if vlContinua then
               Begin
                  if Objeto.B_OPERADO_NAFIN.AsString = 'V' then
                  begin
                      vlsql := ' SELECT CS.ID_CESION, ' +
                               '        DECODE(PKGCRPERIODO.ObtImpNeto(CS.ID_CESION), 0,NVL(PKGCRPERIODO.ObtImpNetoVPN(CS.ID_CESION),0), NVL(PKGCRPERIODO.ObtImpNeto(CS.ID_CESION),0)) AS ObtImpNeto ' +
                               '   FROM CR_CESION CS ' +
                               '  WHERE CS.ID_CESION = ' + Objeto.ID_CESION.AsString;
                      vlQry := GetSQLQuery(vlsql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
                      try
                         if vlQry <> nil then
                         Begin
                            BerrorPLD := ValidaPLD(Objeto.ID_CESION.AsString, vlQry.FieldByName('ObtImpNeto').asFloat, 'COLO',
                                                   Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, Objeto.Apli.Usuario, 'V',
                                                   vlError);
                         end;
                      finally
                         if vlQry <> nil then
                            vlQry.free;
                         end;
                  end;
                end;

                if vlContinua then Begin
                  if Objeto.F_ALTA.AsDateTime = Objeto.Apli.DameFechaEmpresa THEN
                  Begin
                     autorizaces;
                  end
                  else
                  Begin
                     if MessageDlg('¿Desea continuar con el proceso de autorización, debido a que no es una cesión del día ' +
                                    'y se realizaran los ajustes correspondientes a la cesión y sus documentos?',
                        mtConfirmation,[mbYes, mbNo], 0) = mrYes then
                     Begin
                        IF Objeto.STPACTUALIZACES(Objeto.ID_CESION.AsInteger, vlErr) THEN BEGIN
                           //##  BEGIN    DEINTEC.DF  21.MAYO.2008      DESCUENTOS MERCANTILES
                           IF Objeto.CreCto.Producto.CVE_CAL_CAPITAL.AsString = C_VPN THEN
                           BEGIN
                               ShowMessage('Debera actualizar nuevamente la tabla de vencimientos');
                               temporal := TCrGenVto.Create(self);
                               try
                                   temporal.Apli:=Objeto.Apli;
                                   temporal.ParamCre := Objeto.ParamCre;
                                   temporal.vgCesion := Objeto.ID_CESION.AsString;
                                   temporal.VGCredito:= Objeto.ID_CESION.AsInteger;
                                   temporal.FindKey([Objeto.ID_CESION.AsString]);
                                   LimpiaTabla;
                                   temporal.Catalogo;
                               finally
                                   temporal.Free;
                               end;
                           END;
                           //##  END    DEINTEC.DF  21.MAYO.2008      DESCUENTOS MERCANTILES
                           autorizaces;
                        END
                        ELSE AddLine( MErrores, vlErr ); //<EASA 25.ABR.2007     Req. Dolares
                     end;
                  END;
                end;// </EASA>
             end;
          end
          ELSE ShowMessage('No se puede autorizar la cesión');
          MessageIniFinProceso( MErrores, cFinal ); //<EASA 25.ABR.2007     Req. Dolares
       END;
   end
   else
      ShowMessage('Debe de seleccionar una cesión para realizar la acción.');
  end
//  else begin
//  ShowMessage('    No tiene suficientes permisos para esta Acción')
//  end;
end;

procedure TWCrCesion.btCANCELA_CESIONClick(Sender: TObject);
var vlTransacc  : Integer;
    vlErr       : String;
    vlRevFacElec:Integer;
    vlErrFacElec:string;
    vlclave : String;
Begin
   vlclave := '19';
//   if ValidaUsuario(Objeto.Apli, vlClave) then
   if Objeto.ValidaAccesoEsp('TCRCESION_CANC',True,True) then
Begin
   vlErr := '';
   MErrores.Lines.Clear; //<EASA 25.ABR.2007     Req. Dolares
   if Objeto.Active then
   begin
      if Objeto.SIT_CESION.AsString = CSIT_CA then
         ShowMessage('La situación ya ha sido Cancelada')
      else if not Objeto.ValCanPerfilUsu  then
      Begin
         btCANCELA_CESION.Enabled := False;
      end
      else
      Begin
        if (Objeto.SIT_CESION.AsString <> CSIT_CA) then
        Begin
           showMessage('Al cancelar la cesión se cancelarán todos sus documentos respectivos.');
           if MessageDlg('¿Está seguro de cancelar la cesión',
                         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           Begin
              MessageIniFinProceso( MErrores, cInicio ); //<EASA 25.ABR.2007     Req. Dolares

              vlRevFacElec:= RevisaFacturasElectronicas(IntToStr(Objeto.ID_CESION.AsInteger));
              if vlRevFacElec = 0 then
              begin
                 if Objeto.STPCANCELACESION(Objeto.ID_CESION.AsInteger, vlErr) then
                 Begin
                    AddLine( MErrores, 'Se canceló la cesión : ' + Objeto.ID_CESION.AsString ); //<EASA 25.ABR.2007     Req. Dolares
                    ShowMessage('Se canceló la cesión : ' + Objeto.ID_CESION.AsString );
                    Objeto.FindKey([Objeto.ID_CESION.AsString]);
                    btCANCELA_CESION.Enabled := False;
                    btAUTORIZA_CESION.Enabled := False;
                    Actualizaimportes;
                 end
                 ELSE AddLine( MErrores, vlErr ); //<EASA 25.ABR.2007     Req. Dolares
             end
             else
             begin
                //if vlRevFacElec = 1 then vlErrFacElec:= 'Existen Facturas Electronicas asociadas, es necesario CANCELARLAS';
                //if vlRevFacElec = 2 then vlErrFacElec:= 'Existen Facturas Electronicas asociadas por procesar, es necesario PROCESARLAS y CANCELARLAS';

                //vlErrFacElec:= 'Existen Facturas Electronicas asociadas a la Cesion '+Objeto.ID_CESION.AsString+', es necesario CANCELARLAS';
                vlErrFacElec:= 'Existen Facturas Electronicas '+Objeto.ID_CESION.AsString+' SIN PROCESAR, revise el Servicio de Factura Electronica'; //AGOSTO 2013 
                ShowMessage(vlErrFacElec);
                if vlRevFacElec = 1 then AddLine( MErrores, vlErrFacElec);
             end;
           end;
        end
        else ShowMessage('La cesión no puede ser cancelada');
        MessageIniFinProceso( MErrores, cFinal ); //<EASA 25.ABR.2007     Req. Dolares
      end;
   end
   else
      ShowMessage('Debe de seleccionar una cesión para realizar la acción.');
  end;
//  else begin
//  ShowMessage('    No tiene suficientes permisos para esta Acción')
//  end;
end;

procedure TWCrCesion.verificaSituacion;
begin
      if Objeto.SIT_CESION.AsString = CSIT_NA then
      Begin
         btAUTORIZA_CESION.Enabled:= True;
         btDOCTO.Enabled := True;
      end
      else
      Begin
         btAUTORIZA_CESION.Enabled:= False;
         btDOCTO.Enabled := False;
      end;
      if (Objeto.SIT_CESION.AsString <> CSIT_CA) then
         btCANCELA_CESION.Enabled := True
      else btAUTORIZA_CESION.Enabled:= False;
end;

procedure TWCrCesion.InterForma1DespuesCancelar(Sender: TObject);
begin
   Objeto.CreCto.FindKey([Objeto.credito.ContratoCre.ID_CONTRATO.AsString,'1']);
   icpCONTRATO.RefrescaInfo; //Refresca la información del Contrato
   MuestraHints;
   verificaSituacion;
   Objeto.PromotorAdm.FindKey([Objeto.Credito.ID_PROM_ADM.AsString]);
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//   Objeto.Emisor.FindKey([,Objeto.ID_EMISOR.AsString,Objeto.CVE_EMISOR_NAFIN.AsString]);
//   Objeto.EmiProv.Proveedor.FindKey([Objeto.ID_PROVEEDOR.AsString]);
   Objeto.Emisor.FindKey([Objeto.CVE_FND_ENT_DES.AsString,Objeto.ID_EMISOR.AsString,Objeto.CVE_EMISOR_NAFIN.AsString]);
   Objeto.EmiProv.Proveedor.FindKey([Objeto.CVE_FND_ENT_DES.AsString,Objeto.ID_PROVEEDOR.AsString]);
{/ROIM}

   Actualizaimportes; //actualiza los saldos de la cesion
end;

procedure TWCrCesion.InterForma1DespuesShow(Sender: TObject);
begin
   //LOLS_06_09_2005
   Objeto.BuscaWhereString := 'PKGCRACTUALIZA.STPOBTEMPRESA(CR_CESION.ID_CESION) =' + IntToStr(Objeto.Apli.IdEmpresa);
   Objeto.FilterString     := Objeto.BuscaWhereString;
   Objeto.CreCto.BuscaWhereString := ' PKGCRACTUALIZA.STPOBTEMPCTTO(CR_CONTRATO.ID_CONTRATO)= ' + IntToStr(Objeto.Apli.IdEmpresa);
   Objeto.CreCto.FilterString := Objeto.CreCto.BuscaWhereString ;
   //ENDS_LOLS_06_09_2005

   icpCONTRATO.RefrescaInfo;
   Actualizaimportes;
end;

procedure TWCrCesion.Catlogo1Click(Sender: TObject);
begin
      Objeto.Emisor.GetParams(Objeto);
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//      Objeto.Emisor.FindKey([Objeto.ID_EMISOR.AsString,Objeto.CVE_EMISOR_NAFIN.AsString]);
      Objeto.Emisor.FindKey([Objeto.CVE_FND_ENT_DES.AsString,Objeto.ID_EMISOR.AsString,Objeto.CVE_EMISOR_NAFIN.AsString]);
{/ROIM}
      Objeto.Emisor.ParamCre := Objeto.ParamCre;
      Objeto.Emisor.Catalogo;
      Objeto.FindKey([Objeto.ID_CESION.AsString]);
      Actualizaimportes;
end;

procedure TWCrCesion.Catlogo2Click(Sender: TObject);
var  Proveedor : TCrProveed;
begin
   Proveedor := TCrProveed.Create(self);
   Try
      Proveedor.Apli:=Objeto.Apli;
      Proveedor.FindKey([Objeto.ID_PROVEEDOR.AsString]);
      Proveedor.ParamCre:=Objeto.ParamCre;
      Proveedor.Catalogo;
   finally
      Proveedor.Free;
      Objeto.FindKey([Objeto.ID_CESION.AsString]);
      Actualizaimportes;
   end;
end;

procedure TWCrCesion.ChequeraCargo1Click(Sender: TObject);
begin
   VerChequera(Objeto.ID_EMISOR.AsInteger,Objeto.CVE_EMISOR_NAFIN.AsString,C_ACRED,C_ADMIN);
end;

procedure TWCrCesion.VerChequera(IdCliente : Integer; peCveEmisNafin,pCveTipoAcred, pCveTipoCheq: String);
var CrChequera     : TCrCreChe;
    vlIdBancoChqra : Integer;
    vlCuentaBanco  : String;
begin
   with objeto do
   Begin
   ObtenChequeras(IdCliente,ID_CESION.AsInteger,peCveEmisNafin,pCveTipoAcred,pCveTipoCheq,C_ABONO,vlIdBancoChqra,vlCuentaBanco);
   if vlCuentaBanco = CNULL THEN
      MessageDlg('Favor de Configurar Chequera del Acreditado',mtInformation, [ mbOK ], 0);
   //end if
     Begin
        CrChequera := TCrCreChe.Create(Self);
        Try
           CrChequera.Apli:=Objeto.Apli;
           IF NOT CrChequera.FindKey([IdCliente,
                                      pCveTipoAcred,
                                      peCveEmisNafin,
                                      pCveTipoCheq,
                                      Objeto.ID_CESION.AsString,
                                      vlIdBancoChqra,
                                      vlCuentaBanco]) THEN
               CrChequera.FindKey([IdCliente,
                                   pCveTipoAcred,
                                   peCveEmisNafin,
                                   pCveTipoCheq,
                                   0,
                                   vlIdBancoChqra,
                                   vlCuentaBanco]);
           //end if
           CrChequera.ParamCre:=Objeto.ParamCre;
           CrChequera.Catalogo;
        Finally
           CrChequera.Free;
           Objeto.FindKey([Objeto.ID_CESION.AsString]);
        end;
     end;
   end;
end;

procedure TWCrCesion.ChequeraLiquidacinCargo1Click(Sender: TObject);
begin
   VerChequera(Objeto.ID_EMISOR.AsInteger,Objeto.CVE_EMISOR_NAFIN.AsString,C_ACRED,C_LIQUI);
end;

procedure TWCrCesion.ChequeraAdministradorAbono1Click(Sender: TObject);
begin
   VerChequera(Objeto.ID_PROVEEDOR.AsInteger,'0',C_PROVE,C_ADMIN);
end;

procedure TWCrCesion.ChequeraLiquidacinAbono1Click(Sender: TObject);
begin
   VerChequera(Objeto.ID_PROVEEDOR.AsInteger,'0',C_PROVE,C_LIQUI);
end;

procedure TWCrCesion.CatlogoRelacinEmisorProveedor1Click(Sender: TObject);
begin
   VerRelEmisProv;
end;

procedure TWCrCesion.RelacinEmisorProvedor1Click(Sender: TObject);
begin
   VerRelEmisProv;
end;

procedure TWCrCesion.VerRelEmisProv;
begin
   with Objeto do
   Begin
      EmiProv.GetParams(Objeto);
//      EmiProv.CVE_EMISOR_NAFIN.AsString := Objeto.CVE_EMISOR_NAFIN.AsString;
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//      EmiProv.FindKey([ID_EMISOR.AsString,ID_PROVEEDOR.AsString]);
      EmiProv.FindKey([Objeto.CVE_FND_ENT_DES.AsString,ID_EMISOR.AsString,ID_PROVEEDOR.AsString]);
{/ROIM}
      EmiProv.ParamCre := Objeto.ParamCre;
      EmiProv.Catalogo;
      Objeto.FindKey([Objeto.ID_CESION.AsString]);
      Actualizaimportes;
   end;
end;

procedure TWCrCesion.autorizaces;
Var vlErr, vlErrMail : String;
    vlCount: Integer;
begin
     vlErr:= '';
     if Objeto.STPAUTORIZACESION(Objeto.ID_CESION.AsInteger, Objeto.IMP_COMPRA.AsFloat, Objeto.CreCto.Producto.CVE_CAL_CAPITAL.AsString, vlErr) then
     Begin
       //EnviaMail ;  //FJR 23.07.2012  Para habilitar envio de correo informativo
       AddLine( MErrores, 'Se autorizó la cesión : ' + Objeto.ID_CESION.AsString );//<EASA 25.ABR.2007     Req. Dolares
       
       GetSQLInt('SELECT COUNT(*) AS TOT_ELEC FROM CR_DOCUMENTO '+
       'WHERE ID_CESION = '+Objeto.ID_CESION.AsString+' AND CVE_DOCUMENTO = ''ELEC'' ', Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
       'TOT_ELEC', vlCount, False ) ; // FJR 24.07.2012 solo manda correo de documentos 'ELEC'
       If (vlCount > 0) then
           begin
               if EnviaMail then
                  vlErrMail:= 'Envio de correo confirmatorio hecho correctamente.'
               Else
                  vlErrMail:= 'No se concreto el envio de correo confirmatorio.' ;
               AddLine(MErrores, vlErrMail);
           end ;
       ShowMessage('Se autorizó la cesión : ' + Objeto.ID_CESION.AsString +#13#13+vlErrMail );
       Objeto.FindKey([Objeto.ID_CESION.AsString]);
       //##  BEGIN    DEINTEC.DF  21.MAYO.2008      DESCUENTOS MERCANTILES
       IF Objeto.CreCto.Producto.CVE_CAL_CAPITAL.AsString = C_VPN THEN
         Objeto.Credito.FindKey([edID_CESION.Text]);
       //##  END    DEINTEC.DF  21.MAYO.2008      DESCUENTOS MERCANTILES
       btAUTORIZA_CESION.Enabled := False;
     end
     else AddLine( MErrores, vlErr );//<EASA 25.ABR.2007     Req. Dolares 
end;

// FJR 23.07.2012 proceso de envio de correo informativo
Function TWCrCesion.EnviaMail: Boolean ;
var CrNotific: TCrNotific;
    Enviado: Boolean;
begin
   CrNotific:= TCrNotific.Create(nil) ;
   try
      CrNotific.Apli :=Objeto.Apli;
      CrNotific.ParamCre:=Objeto.ParamCre;
      CrNotific.Cesion:= Objeto;
      Enviado:= CrNotific.Envio(1) ;  // SIEMPRE SER'A TOMADO EL FORMATO RECIENTE
      CrNotific:= nil;
   except
      Enviado:= False ;
      CrNotific:= nil ;
   end;

   Result:= Enviado;
end ;

procedure TWCrCesion.Actualizaimportes;
begin
     IF Objeto.SIT_CESION.AsString <> CSIT_CA then
        if Objeto.ID_CESION.AsString <> '' then
           if Objeto.verifExisDoctos(Objeto.ID_CESION.AsInteger) > 0 THEN
              Objeto.ObtSaldosCesion(Objeto.ID_CESION.AsString);
           //end if
        //end if
     //END IF
     Objeto.ObtenDispProveedor;
     Objeto.EmiProv.ObtenRiesgoAcumulado;
     IF Objeto.ID_EMISOR.AsString <> CNULL then
     Begin
       Objeto.CreCto.Acreditado.FindKey([Objeto.ID_EMISOR.AsString]);
       Objeto.CreCto.ObtenDisponibleAcred(Objeto.ID_EMISOR.AsString);
       Objeto.CreCto.ObtenDisponibleGpo(Objeto.CreCto.Acreditado.CVE_GRUPO_ECO.AsString);
       Objeto.CreCto.ObtenDisponibleAut(Objeto.CreCto.ID_CONTRATO.AsString,Objeto.CreCto.FOL_CONTRATO.AsString);
     end;
     IF ( Objeto.ID_PROVEEDOR.AsString <> CNULL ) AND
        ( Objeto.ID_CESION.AsString <> CNULL ) THEN
          Objeto.STPOBTIMPPROV(Objeto.ID_CESION.AsString);
end;

procedure TWCrCesion.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
  var vlMsg : String;
      vlSql : String;
      vlCount : Integer;
begin
   vlMsg := 'No se puede modificar la cesión. Es operada por Cadenas Productivas';
   vlSql := 'SELECT COUNT(*) FROM CR_ARCHIVO_NAFIN WHERE ID_CESION = ' + Objeto.ID_CESION.AsString;
   GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT(*)',vlCount, False);
   Realizado := True;
   if objeto.B_OPERADO_NAFIN.AsString = CVERDAD then
   Begin
      if IsPlazoMayor then
      Begin
         ShowMessage('La cesión contiene docuemntos con plazos mayores al estipulado en los parámetros');
         Realizado := True;
      end
      else
      Begin
        ShowMessage(vlMsg);
        Realizado := False;
      end;
   end
   else if vlCount >= 1 then
   Begin
      if IsPlazoMayor then
      Begin
         ShowMessage('La cesión contiene docuemntos con plazos mayores al estipulado en los parámetros');
         Realizado := True;
      end
      else
      Begin
        ShowMessage(vlMsg);
        Realizado := False;
      end;
   end;
end;

function TWCrCesion.IsPlazoMayor: Boolean;
var vlsql       : String;
    vlResult    : Boolean;
    Qry         : TQuery;
    vlPlazoMax  : Integer;
begin
   vlsql:= 'SELECT DIAS_MAX_DD_NAFIN FROM CR_PARAMETRO WHERE CVE_PARAMETRO = ' + #39 + 'CRE' + #39;
   GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'DIAS_MAX_DD_NAFIN',vlPlazoMax,False);
   vlResult:= False;
   vlsql:= 'SELECT PLAZO FROM CR_CAPITAL WHERE ID_CREDITO = ' +  Objeto.ID_CESION.AsString;
   Qry := TQuery.Create(Self);
   Try
     Qry.SessionName := Objeto.SessionName;
     Qry.DataBaseName := Objeto.DataBaseName;
     Qry.SQL.Clear;
     Qry.SQL.Add(vlSql);
     Qry.Open;
     While Not Qry.Eof Do
      Begin
         if Qry.FieldByName('PLAZO').AsInteger > vlPlazoMax THEN
            vlResult := True;
     Qry.Next;
     End;
   Finally
     If Assigned(Qry) Then
     Begin Qry.Close; Qry.Free; End;
   End;
   IsPlazoMayor := vlResult;
end;

procedure TWCrCesion.rgCVE_TIPO_INTERESExit(Sender: TObject);
begin
    InterForma1.ValidaExit(rgCVE_TIPO_INTERES,True,'',True);
end;

{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
procedure TWCrCesion.Autorizacin1Click(Sender: TObject);
var   VLContratoCre        : TCrCto; //Contrato Crédito
begin
      VLContratoCre := TCrCto.Create(Self);
      try
          VLContratoCre.GetParams(Objeto);
          VLContratoCre.ParamCre := Objeto.ParamCre;
          VLContratoCre.FindKey([Objeto.CreCto.ID_CONTRATO.AsString,'1']);
          VLContratoCre.Acreditado.FindKey([Objeto.CreCto.Contrato.ID_Titular.AsString]);
          VLContratoCre.Catalogo;
      finally
             VLContratoCre.Free;
      end;
end;
{/ROIM}


{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
procedure TWCrCesion.CarteraImpagada1Click(Sender: TObject);
var     MRepVenc  : TMRepVenc;
begin
     MRepVenc := TMRepVenc.Create(self);
     try
        MRepVenc.GetParams(Objeto);
        MRepVenc.ParamCre := Objeto.ParamCre;
        MRepVenc.VLID_ACREDITADO := Objeto.ID_EMISOR.AsInteger;
        MRepVenc.Catalogo;
     finally
        MRepVenc.Free;
     end;
end;
{/ROIM}

//---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.edCVE_CALCULOExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     if not(vgCambio) then
     Begin
        VLMsg     := '';
        VlSalida  := True;
        IF Objeto.Modo = moAppend THEN
           Objeto.Credito.CVE_CALCULO.GetFromControl;
        if Objeto.Credito.CVE_CALCULO.AsString = '' then
        Begin
           VLMsg := 'Favor de Indicar la Clave del Calculo de Intereses';
           VlSalida   := False;
        end
        else if Objeto.Credito.CVE_CALCULO.AsString = 'RE' Then
        begin
           bbUNIDAD_TIEMPO_RE.Enabled:= True;
           edNUM_UNIDADES_RE.Enabled:= True;
           cbDIA_REVISION.Enabled:= True;
           edF_PROX_REVISION.Enabled:= True;
           dtpF_PROX_REVISION.Enabled:= True;

           edNUM_UNIDADES_RE.Color:= clWindow;
           cbDIA_REVISION.Color:= clWindow;
           edF_PROX_REVISION.Color:= clWindow;
        end
        else
        begin
           bbUNIDAD_TIEMPO_RE.Enabled:= False;
           edNUM_UNIDADES_RE.Enabled:= False;
           cbDIA_REVISION.Enabled:= False;
           edF_PROX_REVISION.Enabled:= False;
           dtpF_PROX_REVISION.Enabled:= False;

           edNUM_UNIDADES_RE.Color:= clBtnFace;
           cbDIA_REVISION.Color:= clBtnFace;
           edF_PROX_REVISION.Color:= clBtnFace;
        end;
        InterForma1.ValidaExit(edCVE_CALCULO,VLSalida,VLMsg,True);
     end;
   end;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.btCALC_INTClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCESION_CALCIN',True,True) then
   begin
     Objeto.CalcInt.ShowAll := True;
     if Objeto.CalcInt.Busca then
        InterForma1.NextTab(btCALC_INT);
   end;     
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.cbTIPO_TASAExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      if cbTIPO_TASA.ItemIndex = 0 then
      Begin
            bbUNIDAD_TIEMPO_RE.Enabled := False;
            edNUM_UNIDADES_RE.Enabled := False;
            cbDIA_REVISION.Enabled := False;
            edF_PROX_REVISION.Enabled := False;
            dtpF_PROX_REVISION.Enabled := False;
            edNUM_UNIDADES_RE.Color := clBtnFace;
            cbDIA_REVISION.Color := clBtnFace;
            edF_PROX_REVISION.Color := clBtnFace;
            if InterForma1.IsNewData then
               edF_PROX_REVISION.Text := edF_INICIO.Text;
            //end if
      end
      else
      Begin
            bbUNIDAD_TIEMPO_RE.Enabled := True;
            edNUM_UNIDADES_RE.Enabled := True;
            cbDIA_REVISION.Enabled := True;
            edF_PROX_REVISION.Enabled := True;
            dtpF_PROX_REVISION.Enabled := True;
            edNUM_UNIDADES_RE.Color := clWindow;
            cbDIA_REVISION.Color := clWindow;
            edF_PROX_REVISION.Color := clWindow;
      end;

      if Objeto.Credito.CVE_CALCULO.AsString = 'RE' then
      Begin
            bbUNIDAD_TIEMPO_RE.Enabled := True;
            edNUM_UNIDADES_RE.Enabled := True;
            cbDIA_REVISION.Enabled := True;
            edF_PROX_REVISION.Enabled := True;
            dtpF_PROX_REVISION.Enabled := True;
            bbUNIDAD_TIEMPO_RE.Enabled := True;
            edNUM_UNIDADES_RE.Color := clWindow;
            cbDIA_REVISION.Color := clWindow;
            edF_PROX_REVISION.Color := clWindow;
      end
      else
      begin
         bbUNIDAD_TIEMPO_RE.Enabled := FALSE;
            edNUM_UNIDADES_RE.Enabled := FALSE;
            cbDIA_REVISION.Enabled := FALSE;
            edF_PROX_REVISION.Enabled := FALSE;
            dtpF_PROX_REVISION.Enabled := FALSE;
            bbUNIDAD_TIEMPO_RE.Enabled := False;
            edNUM_UNIDADES_RE.Color := clBtnFace;
            cbDIA_REVISION.Color := clBtnFace;
            edF_PROX_REVISION.Color := clBtnFace;
            edF_PROX_REVISION.Text := '';
      end;
   end;
   InterForma1.ValidaExit(cbTIPO_TASA,True,'',True);
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.btTASA_REFERClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCESION_TASARF',True,True) then
   begin
     Objeto.TasaRefer.ShowAll := True;
     if Objeto.TasaRefer.Busca then
        InterForma1.NextTab(btTASA_REFER);
   end;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.btTASA_REFERExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlSalida := True;
     vlMsg := CNULL;
     if Objeto.TasaRefer.CVE_TASA_INDICAD.AsString = CNULL then
     Begin
        vlSalida := False;
        vlMsg := 'Favor de Indicar la Tasa de Referencia';
     end;

        if VlSalida then
     begin
         //if ((Objeto.VGTIPO_DISPOSICION = 'DI') OR (Objeto.VGTIPO_DISPOSICION = 'RS')) then  //--DEINTEC.DF   REMOVED TO DESC. MERCANTILES
         //begin        //--DEINTEC.DF   REMOVED TO DESC. MERCANTILES
             VerificaTasaRefer;
             if Objeto.CVE_TASA_REFER.AsString <> C_TASA_FIJA then
             Begin
                cbTIPO_TASA.Text := 'VARIABLE';
                cbTIPO_TASA.Enabled := True;
                edVALOR_TASA.Text := ValorTasa(Objeto.TasaRefer.CVE_TASA_INDICAD.AsString);
                cbTIPO_TASA.SetFocus;
             end
             else if Objeto.CVE_TASA_REFER.AsString = C_TASA_FIJA then
             Begin
                edVALOR_TASA.Text := Objeto.CreCto.TASA_BASE.AsString;
                cbTIPO_TASA.Enabled := False;
                cbTIPO_TASA.Text := 'FIJA';
                bbUNIDAD_TIEMPO_RE.Enabled := False;
                edNUM_UNIDADES_RE.Enabled := False;
                cbDIA_REVISION.Enabled := False;
                edF_PROX_REVISION.Enabled := False;
                dtpF_PROX_REVISION.Enabled := False;
                edNUM_UNIDADES_RE.Color := clBtnFace;
                cbDIA_REVISION.Color := clBtnFace;
                edF_PROX_REVISION.Color := clBtnFace;
                edF_PROX_REVISION.Text := edF_INICIO.Text;
             end;
             //OBTIENE EL VALOR DE LA TASA DEL CREDITO
             ValorTasaCred;
         //end;         //--DEINTEC.DF   REMOVED TO DESC. MERCANTILES
     end;
     InterForma1.ValidaExit(edCVE_TASA_REFER,vlSalida,vlMsg,True);
   end;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.VerificaTasaRefer;
begin
   //--DEINTEC.DF   REMOVED TO DESC. MERCANTILES        edCVE_TASA_REFER.Color := clWindow;
   edCVE_TASA_REFER.Color := clWindow;
   //--DEINTEC.DF   REMOVED TO DESC. MERCANTILES        edCVE_TASA_REFER.Enabled :=True;
   edCVE_TASA_REFER.Enabled :=True;
   btTASA_REFER.Enabled := True;
   Objeto.TasaRefer.Active := True;
   cbOPERADOR_STASA.Color := clWindow;
   cbOPERADOR_STASA.Enabled :=True;
   edSOBRETASA.Color := clWindow;
   edSOBRETASA.Enabled :=True;

   if not InterForma1.IsNewData then Begin
      if Objeto.CreCto.Producto.B_MOD_TASA_REF_D.AsString = CFALSO then
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

      if Objeto.CreCto.Producto.B_MOD_OP_STASA_D.AsString = CFALSO then
      Begin
         cbOPERADOR_STASA.Color := clBtnFace;
         cbOPERADOR_STASA.Enabled :=False;
      end
      else
      Begin
         cbOPERADOR_STASA.Color := clWindow;
         cbOPERADOR_STASA.Enabled :=True;
      end;

      if Objeto.CreCto.Producto.B_MOD_STASA_D.AsString = CFALSO then
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
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 15.ABRIL.2008    DESCUENTO MERCANTIL
function TWCrCesion.ValorTasa(pTasa: String): String;
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
         ParamByName('peF_CALCULO').AsDateTime := StrToDateTime(edF_INICIO.Text);
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
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 18.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.bbUNIDAD_TIEMPO_REClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCESION_RVTASA',True,True) then
   begin
     Objeto.UTiempoTasa.ShowAll := True;
     if Objeto.UTiempoTasa.Busca then
     begin
          //--Objeto.Credito.UNIDAD_TIEMPO_RE.AsString := Objeto.UTiempoTasa.CVE_UNIDAD_TIEMP.AsString;
          //--Objeto.UTiempoTasa.UNIDAD_TIEMPO_RE.AsString := Objeto.UTiempoTasa.CVE_UNIDAD_TIEMP.AsString;
          InterForma1.NextTab(bbUNIDAD_TIEMPO_RE);
     end;
   end;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 18.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.bbUNIDAD_TIEMPO_REExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlSalida := True;
     vlMsg := CNULL;
     //<LOLS 15ENE2006. SE AGREGA VALIDACION PARA HACER OBLIGATORIO EL CAMPO SOLO EN TIPO DE CALCULO REVISABLE>
     if Objeto.Credito.CVE_CALCULO.AsString = 'RE' then   ////////
     begin
       if Objeto.UTiempoTasa.CVE_UNIDAD_TIEMP.AsString = CNULL then
       Begin
          vlSalida := False;
          vlMsg := 'Favor de Indicar La unidad de tiempo para la revisión de Tasa';
       end
       else if NOT ( ValUnidadTiemp(cbUNIDAD_TIEMPO_RE.Text,StrToInt(edDIAS_PLAZO.Text),vlMsg)) then
       Begin
          vlSalida := False;
       end;
       //
     end;
     //</LOLS>
   end;
   InterForma1.ValidaExit(bbUNIDAD_TIEMPO_RE,vlSalida,vlMsg,True);
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 18.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.edNUM_UNIDADES_REExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      //<LOLS 15ENE2006. SE AGREGA VALIDACION PARA HACER OBLIGATORIO EL CAMPO SOLO EN TIPO DE CALCULO REVISABLE>
      if Objeto.Credito.CVE_CALCULO.AsString = 'RE' then
      begin
        //
        //Verifica que el dato no sea negativo
        if StrToInt(edNUM_UNIDADES_RE.Text) <= 0 then
        Begin
           VLSalida := False;
           vlMsg := 'El número de unidades debe de ser Mayor o igual a 1';
        end
        else if not (ValNumUnidades(StrToInt(edNUM_UNIDADES_RE.Text), Objeto.UTiempoTasa.NUM_DIAS.AsInteger,
                                    StrToInt(edDIAS_PLAZO.Text),vlMsg) ) then
             VLSalida := False;
        //
      end;
      //</LOLS>
      InterForma1.ValidaExit(edNUM_UNIDADES_RE,VLSalida,VLMsg,True);
   end;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 18.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.cbDIA_REVISIONExit(Sender: TObject);
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
     /////  vlBandera := ( Objeto.Credito.UNIDAD_TIEMPO_RE.AsString <> CNULL ) AND
     vlBandera := ( Objeto.UTiempoTasa.CVE_UNIDAD_TIEMP.AsString <> CNULL ) AND
                  ( StrToInt(edNUM_UNIDADES_RE.Text)  > 0 ) AND
                  ( ( StrToInt(cbDIA_REVISION.Text)  > 0 ) AND ( StrToInt(cbDIA_REVISION.Text) <= 31 ) );
     if ( Objeto.Credito.CVE_CALCULO.AsString = 'RE' ) or ( vlBandera ) then   /////////////////
     begin
       if ((StrToInt(cbDIA_REVISION.Text) < 1) or (StrToInt(cbDIA_REVISION.Text) > 31)) then
       begin
            vlSalida := False;
            vlMsg    := 'El día de revisión debe ser mayor a 0 y menor o igual a 31';
       end;
       if vlSalida then
       begin
            edF_PROX_REVISION.Text :=  DateTimeToStr(Objeto.StpBusSigFecha(StrToDateTime(edF_INICIO.Text),
                                                                        StrToDateTime(edF_VENCIMIENTO.Text),
                                                                        Objeto.UTiempoTasa.CVE_UNIDAD_TIEMP.AsString,
                                                                        StrToInt(edNUM_UNIDADES_RE.Text),
                                                                        StrToInt(cbDIA_REVISION.Text)) );
       end;
       //
     end;
     //</LOLS>
   end;
   InterForma1.ValidaExit(cbDIA_REVISION,vlSalida,vlMsg,True);
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 18.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.cbDIA_REVISIONKeyPress(Sender: TObject; var Key: Char);
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
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 18.ABRIL.2008    DESCUENTO MERCANTIL
        {--------------------------  BUSCA SIGUIENTE FECHA  ----------------------------}
        // SATV4766
function TCrCesion.StpBusSigFecha(PPFInicioPag,PPFVencimiento : TDateTime;PPUnidadTiempo : String;
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
                    Params.CreateParam(ftInteger,'PEIDEMPRESA',ptInput);
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
  If (CreCto.Producto.CVE_GEN_TIP_PAG.AsString = CPAGTRA) Then
     Begin
     Result := StpObtenFIniPago(PPFInicioPag, PPFVencimiento, PPUnidadTiempo, PPENumUnidades, PPDiaPago);
     End
  Else If (CreCto.Producto.CVE_GEN_TIP_PAG.AsString = CPAGNIV) Then
     Begin
     Result := StpObtenFIniPagoMinPzo(PPFInicioPag, PPFVencimiento, PPUnidadTiempo, PPENumUnidades, PPDiaPago,
                                      PPEDMinReqPer, PPENumDiasAgrPer);
     End;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 21.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.edF_PROX_REVISIONExit(Sender: TObject);
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
      if ( Objeto.Credito.CVE_CALCULO.AsString = 'RE' ) then
      begin
        If edF_PROX_REVISION.Text <> '' then
        Begin
           if StrToDateTime(edF_PROX_REVISION.Text) <= StrToDateTime(edF_INICIO.Text) then
           Begin
              vlMsg := ' La fecha próxima revisión no puede ser menor a la fecha de inicio';
              vlSalida := False;
           End;
           if ((StrToDateTime(edF_PROX_REVISION.Text) > StrToDateTime(edF_VENCIMIENTO.Text) ) and (vlSalida)) then
           Begin
              vlMsg := ' La fecha próxima revisión no puede ser mayor a la fecha de vencimiento';
              vlSalida := False;
           End;
           if ((ValidaFecha(StrToDateTime(edF_PROX_REVISION.Text),Objeto.Apli) <> 0) and (vlSalida)) then
           Begin
                if Not(MessageDlg('La fecha de revisión de Tasa es un día no hábil. ¿Desea Continuar?',
                   mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
                begin
                     vlMsg := ' La fecha de revisión de Tasa es un día no hábil';
                     vlSalida := False;
                end;
           End;
           DateTimeToString(VLDiaPago,'dd',StrToDateTime(edF_PROX_REVISION.Text));
           if ((StrToInt(cbDIA_REVISION.Text) <> StrToInt(VLDiaPago)) and (vlSalida)) then
           begin
                DateTimeToString(VLMesPagS,'MM',StrToDateTime(edF_PROX_REVISION.Text) + 1);
                DateTimeToString(VLMesPag,'MM',StrToDateTime(edF_PROX_REVISION.Text));
                if not((StrToInt(cbDIA_REVISION.Text) = 31) and (StrToInt(VLMesPagS) > StrToInt(VLMesPag))) then
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
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 21.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.cbOPERADOR_STASAExit(Sender: TObject);
var vlSalida : Boolean;
    vlMesg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlMesg   := CNULL;
     vlSalida := True;
     if cbOPERADOR_STASA.Text = CNULL then
     Begin
        vlSalida := False;
        vlMesg := 'Indique el Operador de la Sobretasa';
     end;
     //if InterForma1.ValidaExit(cbOPERADOR_STASA,vlSalida,vlMesg,True) then            &&&&&&&&&&&&&&&&&&&&&&
     //    InterForma1.NextTab(edSOBRETASA);                                            &&&&&&&&&&&&&&&&&&&&&&
     InterForma1.ValidaExit(cbOPERADOR_STASA,vlSalida,vlMesg,True);
   end;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 21.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.cbOPERADOR_STASAKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Not((key=Char(42)) or (key=Char(43)) or (key=Char(45)) or (key=Char(47)) or (key=Char(8)) or (key=Char(13)))  then
     begin
          Key:=Char(0);
          InterForma1.ShowMsgPanel('Solo se permiten + , - , / , * ');
     end;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 21.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.ValorTasaCred;
var vlTasa : Boolean;
begin
   vlTasa := True;
   IF not( InterForma1.IsNewData ) AND ( Objeto.TasaRefer.CVE_TASA_INDICAD.AsString = C_TASA_FIJA )THEN
      vlTasa := False;
   //end if;

   if vlTasa then BEGIN
     if cbOPERADOR_STASA.Text = '+' then
        edTASA_CREDITO.Text := FloatToStr( StrToFloat(edVALOR_TASA.Text) + StrToFloat(edSOBRETASA.Text) )
     else if cbOPERADOR_STASA.Text = '-' then
        edTASA_CREDITO.Text := FloatToStr( StrToFloat(edVALOR_TASA.Text) - StrToFloat(edSOBRETASA.Text) )
     else if cbOPERADOR_STASA.Text = '*' then
        edTASA_CREDITO.Text := FloatToStr( StrToFloat(edVALOR_TASA.Text) * StrToFloat(edSOBRETASA.Text) )
     else if cbOPERADOR_STASA.Text = '/' then
        edTASA_CREDITO.Text := FloatToStr( StrToFloat(edVALOR_TASA.Text) / StrToFloat(edSOBRETASA.Text) )
     else
        edTASA_CREDITO.Text := FloatToStr( StrToFloat(edVALOR_TASA.Text) + StrToFloat(edSOBRETASA.Text) );
   END;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 21.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.edSOBRETASAExit(Sender: TObject);
var     vlSalida        : Boolean;
        VlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlMsg   := CNULL;
     vlSalida := True;
     if edSOBRETASA.Text = CNULL then
     Begin
        vlSalida := False;
        vlMsg := 'Indique de favor la Sobretasa';
     end
     //&&&&&&&&&&&& else if Objeto.SOBRETASA.AsFloat <{=} 0 then     //REMOVED   DEINTEC.DF DESCUENTOS MERCANTILES
     else if strtofloat(edSOBRETASA.Text) <{=} 0 then
     Begin
        vlSalida := False;
//        vlMsg := 'La sobretasa no debe ser menor o igual a cero';
        vlMsg := 'La sobretasa no debe ser menor a cero';
     end
     else ValorTasaCred;

     if strtofloat(edSOBRETASA.Text) > 0 then
       if StrToFloat( FormatFloat('###0.0000',strtofloat(edSOBRETASA.Text) ) ) <  StrToFloat( FormatFloat('###0.0000',vgSTant) ) then
       Begin
          vlSalida := False;
          vlMsg := 'La sobretasa no puede ser menor a '+  FloatToStr( vgSTant ) ;
       end;
     //end if;

     InterForma1.ValidaExit(edSOBRETASA,vlSalida,vlMsg,True);
   end;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 21.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.edTASA_CREDITOExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
Procedure ValidaTasaRef;
var vlSql : String;
    vlTasaFinal : String;
    vlcount    : String;
BEGIN
   //<LOLS 16ENE2006.  EL PROCESO DE TASA SE DEBE LLAMAR CUANDO B_REDONDEO = 'V' OR B_TASA_MAX_MIN = 'V'>
   GetSQLStr(' SELECT count(*) COUNT FROM CR_INF_ADIC_TASA WHERE ID_CREDITO = '+
              Objeto.ID_CESION.AsString + ' AND ( B_REDONDEO = ''V'' OR B_TASA_MAX_MIN = ''V'' )' ,
             Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlcount,False);
   //GetSQLStr(' SELECT count(*) COUNT FROM CR_INF_ADIC_TASA WHERE ID_CREDITO = '+ Objeto.ID_CREDITO.AsString ,
   //          Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlcount,False);
   //</LOLS>
   if vlcount > '0' then
   Begin
     vlSql := ' SELECT PKGCRCOMUN.SptObtTasaFinal( ' + Objeto.ID_CESION.AsString   + ',' +
                                                       edTASA_CREDITO.Text + ') TASA_FINAL FROM DUAL ';
     GetSQLStr(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'TASA_FINAL',vlTasaFinal,False);
     If StrToFloat(vlTasaFinal) <> StrToFloat(edTASA_CREDITO.Text) then
        if MessageDlg('¿Se va a actualizar la tasa de acuerdo a los datos adicionales de tasas',
                mtInformation, [mbOK], 0) = mrOK then
           edTASA_CREDITO.Text := vlTasaFinal;
        //end if
     //end if;
   end;
END;

begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      //OBTIENE EL VALOR DE LA TASA DEL CREDITO
      if Objeto.TasaRefer.CVE_TASA_INDICAD.AsString = C_TASA_FIJA then
       Begin
         if cbOPERADOR_STASA.Text = '+' then
            edVALOR_TASA.Text := FloatToStr( strtofloat(edTASA_CREDITO.text) - strtofloat(edSOBRETASA.Text) )
         else if cbOPERADOR_STASA.Text = '-' then
            edVALOR_TASA.Text := FloatToStr( strtofloat(edTASA_CREDITO.text) + strtofloat(edSOBRETASA.Text) )
         else if cbOPERADOR_STASA.Text = '*' then
            edVALOR_TASA.Text := FloatToStr( strtofloat(edTASA_CREDITO.text) / strtofloat(edSOBRETASA.Text) )
         else if cbOPERADOR_STASA.Text = '/' then
            edVALOR_TASA.Text := FloatToStr( strtofloat(edTASA_CREDITO.text) * strtofloat(edSOBRETASA.Text) )
         else
            edVALOR_TASA.Text := FloatToStr( strtofloat(edTASA_CREDITO.text) - strtofloat(edSOBRETASA.Text) );
      end;
      //SI SE MODIFICA LA SOBRETASA
      if Objeto.CreCto.Producto.B_MOD_STASA_D.AsString = CVERDAD then
      Begin
{         if Objeto.SOBRETASA.AsFloat < 0 then
            edSOBRETASA.SetFocus
         else if Objeto.SOBRETASA.AsFloat > 0 then      EASA4011        03032005}
         //&&& Objeto.SOBRETASA.AsFloat := Objeto.TASA_CREDITO.AsFloat - StrToFloat( edVALOR_TASA.Text );    // REMOVED DEINTEC.DF
         edSOBRETASA.Text := FloatToStr(StrToFloat(edTASA_CREDITO.Text) - StrToFloat( edVALOR_TASA.Text ));
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
      if StrToFloat(edTASA_CREDITO.Text) <= 0 then
      Begin
         VLMsg    := 'No puede ser menor a cero la tasa a aplicar';
         VLSalida := False;
      end;
      //si la sobretasa es cero no valida nada
      //&&&&&if Objeto.SOBRETASA.AsFloat > 0 then                    // REMOVED DEINTEC.DF
      if strtofloat(edSOBRETASA.Text) > 0 then
         if StrToFloat( FormatFloat('###0.0000',strtofloat(edSOBRETASA.Text) ) ) <  StrToFloat( FormatFloat('###0.0000',vgSTant) ) then
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
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 21.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.btTIPO_AMORTClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCESION_TAMORT',True,True) then
   begin
      // Buscador de Tipos de Amortizacion
      Objeto.TipoAmort.ShowAll := True;
      if Objeto.TipoAmort.Busca then
         InterForma1.NextTab(btTIPO_AMORT);
   end;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 21.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.btTIPO_AMORTExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMsg     := '';
      VlSalida  := True;
      if edCVE_AMORTIZACION.Text = '' then
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
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 21.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.edCVE_AMORTIZACIONExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMsg     := '';
      VlSalida  := True;
      if Objeto.TipoAmort.CVE_AMORTIZACION.AsString = '' then
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
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 21.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.VerPagoCap;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
{CAPITAL/COMISINN   (CP,CO)
--0	NO APLICA  OPERACIONES FUERA DE BALANCE
--1	AMORTIZACIONES PERIÓDICAS AL CAPITAL DE MONTO IDÉNTICO  ok
--2	AMORTIZACIONES PERIÓDICAS AL CAPITAL DE MONTO DIFERENTE  ok
--3	AMORTIZACIONES IRREGULARES PAGOS REALIZADOS EN ESP  DE TIEMPO DIFERENTES
--4	AMORTIZACIÓN  ÚNICA AL VENCIMIENTO}
   BEGIN
      if (objeto.TipoAmort.CVE_AMORTIZACION.AsString = '1') OR
         (objeto.TipoAmort.CVE_AMORTIZACION.AsString = '2') OR
         (objeto.TipoAmort.CVE_AMORTIZACION.AsString = '3') then
      begin
         bbUNIDAD_TIEMPO_CP.Enabled := True;
         edNUM_UNIDADES_CP.Enabled := True;
         cbDIA_PAGO_CAP.Enabled := True;
         edF_INI_PAG_CAP.Enabled := True;
         dtpF_INI_PAG_CAP.Enabled := True;
         edNUM_UNIDADES_CP.Color := clWindow;
         cbDIA_PAGO_CAP.Color := clWindow;
         edF_INI_PAG_CAP.Color := clWindow;
      end;
      if objeto.TipoAmort.CVE_AMORTIZACION.AsString = '4' then
      Begin
         bbUNIDAD_TIEMPO_CP.Enabled := False;
         cbUNIDAD_TIEMPO_CP.Text := '';
         edNUM_UNIDADES_CP.Enabled := False;
         edNUM_UNIDADES_CP.Color := clBtnFace;
         edNUM_UNIDADES_CP.Text := '1';
         cbDIA_PAGO_CAP.Enabled := False;
         cbDIA_PAGO_CAP.Color := clBtnFace;
         cbDIA_PAGO_CAP.Text :='';
         edF_INI_PAG_CAP.Enabled := False;
         edF_INI_PAG_CAP.Color := clBtnFace;
         edF_INI_PAG_CAP.Text := edF_VENCIMIENTO.Text;
         dtpF_INI_PAG_CAP.Enabled := False;
      end;
   END;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 21.ABRIL.2008    DESCUENTO MERCANTIL
Procedure TWCrCesion.AsignaPagoCap;
begin
      if objeto.TipoAmort.CVE_AMORTIZACION.AsString = '4' then
      Begin
           edF_INI_PAG_CAP.Text := edF_VENCIMIENTO.Text;
      end;
      if (objeto.TipoAmort.CVE_AMORTIZACION.AsString = '1') OR
         (objeto.TipoAmort.CVE_AMORTIZACION.AsString = '2') OR
         (objeto.TipoAmort.CVE_AMORTIZACION.AsString = '3') then
      begin
           edNUM_UNIDADES_CP.Text := '1';
           edF_INI_PAG_CAP.Text := DateTimeToStr(CalculaFecha);
      end;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 21.ABRIL.2008    DESCUENTO MERCANTIL
function TWCrCesion.CalculaFecha: TDateTime;
var vlFecha     : TDateTime;
    vlUniTiempo : Integer;
    vlNumUnid   : Integer;
    vlDiaPago   : Integer;
begin
   Result :=  Objeto.Apli.DameFechaEmpresa;
end;
//--END    DEINTEC.DF

//---BEGIN   DEINTEC.DF 21.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.bbUNIDAD_TIEMPO_CPClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCESION_UAMORT',True,True) then
   begin
     Objeto.UTiempoCap.ShowAll := True;
     if Objeto.UTiempoCap.Busca then
     begin
          //Objeto.UNIDAD_TIEMPO_CP.AsString := Objeto.UTiempoCap.CVE_UNIDAD_TIEMP.AsString;         // REMOVED DEINTEC.DF
          InterForma1.NextTab(bbUNIDAD_TIEMPO_CP);
     end;
   end;  
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 21.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.bbUNIDAD_TIEMPO_CPExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlSalida := True;
     vlMsg := CNULL;
     if Objeto.UTiempoCap.CVE_UNIDAD_TIEMP.AsString = CNULL then
     Begin
        vlSalida := False;
        vlMsg := 'Favor de Indicar el tipo de Amortización';
     end
     else if NOT ( ValUnidadTiemp(cbUNIDAD_TIEMPO_CP.Text,StrToInt(edDIAS_PLAZO.Text),vlMsg)) then
     Begin
        vlSalida := False;
     end;
   end;
   InterForma1.ValidaExit(bbUNIDAD_TIEMPO_CP,vlSalida,vlMsg,True);
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 21.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.edNUM_UNIDADES_CPExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      //Verifica que el dato no sea negativo
      if StrToInt(edNUM_UNIDADES_CP.Text) <= 0 then
      Begin
         VLSalida := False;
         vlMsg := 'El número de unidades debe de ser Mayor o igual a 1';
      end
      else if not (ValNumUnidades(StrToInt(edNUM_UNIDADES_CP.Text),Objeto.UTiempoCap.NUM_DIAS.AsInteger,
                                  StrToInt(edDIAS_PLAZO.Text),vlMsg) ) then
           VLSalida := False;
      If VLSalida Then ActualizaValoresPagoEquivalente; // SATV4766
      InterForma1.ValidaExit(edNUM_UNIDADES_CP,VLSalida,VLMsg,True);
   end;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 22.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.cbDIA_PAGO_CAPEnter(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vgDiaPago := StrToInt(cbDIA_PAGO_CAP.Text);
   End;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 22.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.cbDIA_PAGO_CAPExit(Sender: TObject);
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
     if ((StrToInt(cbDIA_PAGO_CAP.Text) < 1) or (StrToInt(cbDIA_PAGO_CAP.Text) > 31)) then
     begin
          vlSalida := False;
          vlMsg    := 'El día de pago de capital debe ser mayor a 0 y menor o igual a 31';
     end;
     if vlSalida then
     begin
       //<LOLS 15 ENE 2005.GUARDA EL DIA DE PAGO QUE TIENE EL CONTROL PARA LLAMAR LA RUTINA DE ACTUALIZACION SOLO SI ESTE CAMBIA>
       //if ( vgDiaPago <> StrToInt(cbDIA_PAGO_CAP.Text) ) or           ###   REMOVED     DEINTEC.DF  28.MAYO.2008
       //   ( edF_INI_PAG_CAP.Text = ''         ) then                  ###   REMOVED     DEINTEC.DF  28.MAYO.2008
       //</LOLS>
          edF_INI_PAG_CAP.Text :=  DateTimeToStr( Objeto.StpBusSigFecha(StrToDateTime(edF_INICIO.Text),
                                                                    StrToDateTime(edF_VENCIMIENTO.Text),
                                                                    Objeto.UTiempoCap.CVE_UNIDAD_TIEMP.AsString,
                                                                    StrToInt(edNUM_UNIDADES_CP.Text),
                                                                    StrToInt(cbDIA_PAGO_CAP.Text),
                                                                    Objeto.CreCto.Producto.NUM_DMIN_REQ_PER.AsInteger,
                                                                    Objeto.CreCto.Producto.NUM_DIAS_AGR_PER.AsInteger
                                                                    ) ); // SATV4766
     end;
     If VLSalida Then ActualizaValoresPagoEquivalente; // SATV4766
     InterForma1.ValidaExit(cbDIA_PAGO_CAP,vlSalida,vlMsg,True);
   end;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 22.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.edF_INI_PAG_CAPExit(Sender: TObject);
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
      If edF_INI_PAG_CAP.Text <> '' then
      Begin
         if StrToDateTime(edF_INI_PAG_CAP.Text) < StrToDateTime(edF_INICIO.Text) then
         Begin
            vlMsg := ' La fecha de primer pago de capital no puede ser menor a la fecha de inicio';
            vlSalida := False;
         End;
         if ((StrToDateTime(edF_INI_PAG_CAP.Text) > StrToDateTime(edF_VENCIMIENTO.Text) ) and (vlSalida)) then
         Begin
            vlMsg := ' La fecha de primer pago de capital no puede ser mayor a la fecha de vencimiento';
            vlSalida := False;
         End;
         if ((ValidaFecha(StrToDateTime(edF_INI_PAG_CAP.Text),Objeto.Apli) <> 0) and (vlSalida)) then
         Begin
              if Not(MessageDlg('La fecha de primer pago de capital es un día no hábil. ¿Desea Continuar?',
                 mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
              begin
                   vlMsg := ' La fecha de primer pago de capital es un día no hábil';
                   vlSalida := False;
              end;
         End;
         DateTimeToString(VLDiaPago,'dd',StrToDateTime(edF_INI_PAG_CAP.Text));
         if ((StrToInt(cbDIA_PAGO_CAP.Text) <> StrToInt(VLDiaPago)) and (vlSalida)) then
         begin
              DateTimeToString(VLMesPagS,'MM',StrToDateTime(edF_INI_PAG_CAP.Text) + 1);
              DateTimeToString(VLMesPag,'MM',StrToDateTime(edF_INI_PAG_CAP.Text) );
              if not((StrToInt(cbDIA_PAGO_CAP.Text) = 31) and (StrToInt(VLMesPagS) > StrToInt(VLMesPag))) then
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
      if vlSalida then
         edIMP_CESION.SetFocus;
   end;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 22.ABRIL.2008    DESCUENTO MERCANTIL
Procedure TWCrCesion.ActualizaValoresPagoEquivalente;
begin
 With Objeto Do
   If (Modo = moAppend) Or (Modo = moEdit) Then
    // Si utiliza el Método de "Pago Equivalente"
    If (CreCto.Producto.CVE_GEN_TIP_PAG.AsString = CPAGNIV) Then
      Begin
      // Si utiliza el Método de "Pago Equivalente"
      // Iguala la selección realizada en la Amortización de "Capital" con los campos de "Interés"
      {UTiempoInt.FindKey([UNIDAD_TIEMPO_CP.AsString]);
      NUM_UNIDADES_IN.AsInteger  := NUM_UNIDADES_CP.AsInteger;
      DIA_PAGO_INT.AsInteger     := DIA_PAGO_CAP.AsInteger;
      If (Trim(edF_INI_PAG_CAP.Text) <> '') Then
       F_INI_PAG_INT.AsDateTime   := F_INI_PAG_CAP.AsDateTime;} //--DEINTEC    REMOVED NO EXISTEN ESTOS DATOS EN LA FORMA
      End;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 22.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.edF_INICIOExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      If edF_INICIO.Text <> '' then
      Begin
         if ValidaFecha(StrToDateTime(edF_INICIO.Text),Objeto.Apli) <> 0 then
         begin
            vlMsg := ' La fecha de inicio es un día no hábil';
            vlSalida := False;
         end;
      end
      else      //Si la fecha es nula le asigna la fecha de la empresa
         edF_INICIO.Text := DateTimeToStr(Objeto.Apli.DameFechaEmpresa);
      InterForma1.ValidaExit(edF_INICIO,vlSalida,vlMsg,True);
   end;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 22.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.edDIAS_PLAZOExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      If edF_INICIO.Text <> '' then
      Begin
         if vlSalida then
         begin
            if StrToInt(edDIAS_PLAZO.Text) <= 0  then
               edDIAS_PLAZO.Text := IntToStr(Objeto.CreCto.Producto.PLAZO_MIN_CREDITO.AsInteger);
            //end if
           if Objeto.CreCto.Producto.B_RANGO_PLA_DISP.AsString = CVERDAD THEN
           Begin
             if ((StrToInt(edDIAS_PLAZO.Text) < Objeto.CreCto.Producto.PLAZO_MIN_CREDITO.AsInteger)or
                 (StrToInt(edDIAS_PLAZO.Text) > Objeto.CreCto.Producto.PLAZO_MAX_CREDITO.AsInteger)) then
             begin
                VLMsg :=' El Plazo de la disposición no está dentro del rango del Plazo del Producto ' +
                        ' ( ' + Objeto.CreCto.Producto.PLAZO_MIN_CREDITO.AsString + ' - ' +
                                Objeto.CreCto.Producto.PLAZO_MAX_CREDITO.AsString + ' ) ' ;
                VLSalida := False;
             end;
           end;
            edF_VENCIMIENTO.Text := DateTimeToStr( StrToDateTime(edF_INICIO.Text) + StrToInt(edDIAS_PLAZO.Text) );
         end;
      end
      else
      Begin
         if Objeto.CreCto.Producto.PLAZO_MIN_CREDITO.AsInteger <=0  then
             edDIAS_PLAZO.Text := '1'
         else
             edDIAS_PLAZO.Text := IntToStr(Objeto.CreCto.Producto.PLAZO_MIN_CREDITO.AsInteger);
      end;

      //filtrar por plazo las unidades de tiempo
      Objeto.UTiempoTasa.BuscaWhereString := 'CR_UNIDAD_TIEMPO.NUM_DIAS < ' + edDIAS_PLAZO.Text;
      Objeto.UTiempoTasa.FilterString := Objeto.UTiempoTasa.BuscaWhereString;

      Objeto.UTiempoCap.BuscaWhereString := 'CR_UNIDAD_TIEMPO.NUM_DIAS < ' + edDIAS_PLAZO.Text;
      Objeto.UTiempoCap.FilterString := Objeto.UTiempoCap.BuscaWhereString;

      //--DEINTEC    REMOVED NO EXISTEN ESTOS DATOS EN LA FORMA         Objeto.UTiempoInt.BuscaWhereString := 'CR_UNIDAD_TIEMPO.NUM_DIAS < ' + Objeto.DIAS_PLAZO.AsString;
      //--DEINTEC    REMOVED NO EXISTEN ESTOS DATOS EN LA FORMA         Objeto.UTiempoInt.FilterString := Objeto.UTiempoInt.BuscaWhereString;

      InterForma1.ValidaExit(edDIAS_PLAZO,vlSalida,vlMsg,True);
   end;
end;
//--END    DEINTEC.DF

//---BEGIN   DEINTEC.DF 22.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.btDIASPLAZOClick(Sender: TObject);
begin
   if Objeto.Active then
      edDIAS_PLAZO.Text:= VentanaCalculo(edDIAS_PLAZO.Text);
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 22.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.edF_VENCIMIENTOExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      If edF_VENCIMIENTO.Text = '' then
         edF_VENCIMIENTO.Text := DateTimeToStr( StrToDateTime(edF_INICIO.Text) + StrToInt(edDIAS_PLAZO.Text) )
      else
      Begin
         if StrToDateTime(edF_INICIO.Text) > StrToDateTime(edF_VENCIMIENTO.Text) then
         Begin
            vlMsg := ' La fecha de vencimiento no puede ser menor a la fecha de inicio';
            vlSalida := False;
         End
         else if StrToDateTime(edF_VENCIMIENTO.Text) < Objeto.Apli.DameFechaEmpresa then
         Begin
            vlMsg := ' La fecha de vencimiento no puede ser menor a la fecha de hoy';
            vlSalida := False;
         End
         else
         begin
            if ValidaFecha(StrToDateTime(edF_VENCIMIENTO.Text),Objeto.Apli) <> 0 then
            Begin
               vlMsg := ' ';
               if MessageDlg('La fecha de vencimiento es un día inhábil. ¿Desea Continuar?',
                 mtConfirmation, [mbYes, mbNo], 0) = mrNo then
               begin
                     vlMsg := ' La fecha de vencimiento es un día inhábil.';
                     vlSalida := False;
               end;
            End;
            edDIAS_PLAZO.Text := FloatToStr(StrToDate(edF_VENCIMIENTO.Text) - StrToDate(edF_INICIO.Text));
            if StrToInt(edDIAS_PLAZO.Text) <= 0 then
            Begin
               vlMsg := 'Los días de Plazo no pueden ser menores o iguales a cero.';
               vlSalida := False;
            end
            else if Objeto.CreCto.Producto.B_RANGO_PLA_DISP.AsString = CVERDAD THEN
            Begin
              if ((StrToInt(edDIAS_PLAZO.Text) < Objeto.CreCto.Producto.PLAZO_MIN_CREDITO.AsInteger)or
                  (StrToInt(edDIAS_PLAZO.Text) > Objeto.CreCto.Producto.PLAZO_MAX_CREDITO.AsInteger)) then
              begin
                 VLMsg :=' El Plazo de la disposición no está dentro del rango del Plazo del Producto ' +
                         ' ( ' + Objeto.CreCto.Producto.PLAZO_MIN_CREDITO.AsString + ' - ' +
                                 Objeto.CreCto.Producto.PLAZO_MAX_CREDITO.AsString + ' ) ' ;
                 VLSalida := False;
              end;
            end;
         end;
      end;

      //filtrar por plazo las unidades de tiempo
      Objeto.UTiempoTasa.BuscaWhereString := 'CR_UNIDAD_TIEMPO.NUM_DIAS < ' + edDIAS_PLAZO.Text;
      Objeto.UTiempoTasa.FilterString := Objeto.UTiempoTasa.BuscaWhereString;

      Objeto.UTiempoCap.BuscaWhereString := 'CR_UNIDAD_TIEMPO.NUM_DIAS < ' + edDIAS_PLAZO.Text;
      Objeto.UTiempoCap.FilterString := Objeto.UTiempoCap.BuscaWhereString;

      InterForma1.ValidaExit(edF_VENCIMIENTO,VLSalida,VlMsg,True);
   end;
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 22.ABRIL.2008    DESCUENTO MERCANTIL
Function TWCrCesion.VentanaCalculo(pDato : String): string;
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
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 22.ABRIL.2008    DESCUENTO MERCANTIL
function TWCrCesion.ValNumUnidades(pNumUnidades, peNumdiasMax, pPlazo: Integer;
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
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 22.ABRIL.2008    DESCUENTO MERCANTIL
function  TWCrCesion.ValUnidadTiemp(pCveUniTiemp : String; pPlazo: Integer; Var pMensaje : String): Boolean;
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
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 22.ABRIL.2008    DESCUENTO MERCANTIL
        //Inserta la Cesion para VPN
function TCrCesion.InsertaCesionMer: Boolean;
var     VLSalida      : Boolean;
        STPObtCesion  : TStoredProc;

  qyQuery       : TQuery;      // RABA NOV 2014
  stp           : TStoredProc; // RABA NOV 2014
  vlFolGpoRenueva : Integer;   // RABA NOV 2014

  vlsql2        : String;      // RABA NOV 2014
  vlEsVencido   : String;      // RABA NOV 2014
Begin
     VLSalida := False;
     B_OPERADO_NAFIN.GetFromControl;
     B_APLICA_COM.GetFromControl;
     CVE_TIPO_INTERES.GetFromControl;
     ID_PROM_ADM.GetFromControl;

     //Inicia el SPT
     STPObtCesion := TStoredProc.Create(Self);
     try
        with STPObtCesion do
        begin
          STPObtCesion.DatabaseName:= Apli.DatabaseName;
          STPObtCesion.SessionName:= Apli.SessionName;
          STPObtCesion.StoredProcName:='PKGCRCREDITO.STPALTACESIONMERC';

          // Se crean los parametros del StoreProcedure
          Params.Clear;
          Params.CreateParam(ftFloat,'peIdContrato',ptInput);
          Params.CreateParam(ftFloat,'peFolContrato',ptInput);
          Params.CreateParam(ftString,'peCveLiquidacion',ptInput);
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
          Params.CreateParam(ftString,'peCveEntDesc',ptInput);
{/ROIM}
          Params.CreateParam(ftFloat,'peIdEmisor',ptInput);
          Params.CreateParam(ftString,'peCveEmisorNafin',ptInput);
          Params.CreateParam(ftFloat,'peIdProveedor',ptInput);
          Params.CreateParam(ftFloat,'peImpCesion',ptInput);
          Params.CreateParam(ftString,'peTxInstrucLiq',ptInput);
          Params.CreateParam(ftString,'peBOperadoNafin',ptInput);
          Params.CreateParam(ftString,'peBAplicaCom',ptInput);
          Params.CreateParam(ftFloat,'pePctComision',ptInput);
          Params.CreateParam(ftFloat,'pePromAuto',ptInput);
          Params.CreateParam(ftDate,'peFAlta',ptInput);
          Params.CreateParam(ftString,'peCveUsuAlta',ptInput);
          Params.CreateParam(ftString,'peCveTipoInteres',ptInput);
          Params.CreateParam(ftString,'peBCommit',ptInput);

          Params.CreateParam(ftDate,'peFInicio',ptInput);
          Params.CreateParam(ftDate,'peFVvto',ptInput);
          Params.CreateParam(ftFloat,'peDiasPlazo',ptInput);
          Params.CreateParam(ftString,'peCveCalculo',ptInput);
          Params.CreateParam(ftString,'peCveTipoTasa',ptInput);
          Params.CreateParam(ftString,'peCveTasaRefer',ptInput);
          Params.CreateParam(ftString,'peOperadorSTasa',ptInput);
          Params.CreateParam(ftFloat,'peSobreTasa',ptInput);
          Params.CreateParam(ftFloat,'peTasaCredito',ptInput);
          Params.CreateParam(ftString,'peUnidadTiempoRE',ptInput);
          Params.CreateParam(ftFloat,'peNumUnidadesRE',ptInput);
          Params.CreateParam(ftFloat,'peDiaRevision',ptInput);
          Params.CreateParam(ftDate,'peFProxRevision',ptInput);
          Params.CreateParam(ftString,'peCveAmortizacion',ptInput);
          Params.CreateParam(ftString,'peUnidadTiempoCP',ptInput);
          Params.CreateParam(ftFloat,'peNumUnidadesCP',ptInput);
          Params.CreateParam(ftFloat,'peDiaPagoCap',ptInput);
          Params.CreateParam(ftDate,'peFIniPagCap',ptInput);
          Params.CreateParam(ftDate,'peTasaBase',ptInput);

          Params.CreateParam(ftFloat,'psIdCesion',ptOutput);
          Params.CreateParam(ftString,'psSitCesion',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          //
          ParamByName('peIdContrato').AsFloat := ID_CONTRATO.AsFloat;
          ParamByName('peFolContrato').AsFloat := FOL_CONTRATO.AsFloat;
          ParamByName('peCveLiquidacion').AsString := CVE_LIQUIDACION.AsString;
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
          ParamByName('peCveEntDesc').AsString := Emisor.CVE_FND_ENT_DES.AsString;
{/ROIM}
          ParamByName('peIdEmisor').AsFloat := ID_EMISOR.AsFloat;
          ParamByName('peCveEmisorNafin').AsString := CVE_EMISOR_NAFIN.AsString;
          ParamByName('peIdProveedor').AsFloat := ID_PROVEEDOR.AsFloat;
          ParamByName('peImpCesion').AsFloat := IMP_CESION.AsFloat;
          ParamByName('peTxInstrucLiq').AsString := TX_INSTRUC_LIQ.AsString;
          ParamByName('peBOperadoNafin').AsString := B_OPERADO_NAFIN.AsString;
          ParamByName('peBAplicaCom').AsString := B_APLICA_COM.AsString;
          ParamByName('pePctComision').AsFloat:= PCT_COMISION.AsFloat;
          ParamByName('pePromAuto').AsString:= ID_PROM_ADM.AsString;
          ParamByName('peFAlta').AsDateTime := F_ALTA.AsDateTime;
          ParamByName('peCveUsuAlta').AsString := CVE_USU_ALTA.AsString;
          ParamByName('peCveTipoInteres').AsString := CVE_TIPO_INTERES.AsString;
          ParamByName('peBCommit').AsString := 'V';
          ParamByName('peFInicio').AsDateTime := StrToDateTime(ObjectForm.edF_INICIO.Text);
          ParamByName('peFVvto').AsDateTime := StrToDateTime(ObjectForm.edF_VENCIMIENTO.Text);
          ParamByName('peDiasPlazo').AsFloat := StrToFloat(ObjectForm.edDIAS_PLAZO.Text);
          ParamByName('peCveCalculo').AsString := ObjectForm.edCVE_CALCULO.Text;

          if (ObjectForm.cbTIPO_TASA.Text = 'VARIABLE') then
            ParamByName('peCveTipoTasa').AsString := C_VARIABLE
          else
            ParamByName('peCveTipoTasa').AsString := C_FIJA;

//          ParamByName('peCveTipoTasa').AsString := Credito.CVE_TASA_REFER.AsString;

          ParamByName('peCveTasaRefer').AsString := ObjectForm.edCVE_TASA_REFER.Text;
          ParamByName('peOperadorSTasa').AsString := ObjectForm.cbOPERADOR_STASA.Text;
          ParamByName('peSobreTasa').AsFloat:= StrToFloat(ObjectForm.edSOBRETASA.Text);
          ParamByName('peTasaCredito').AsFloat:= StrToFloat(ObjectForm.edTASA_CREDITO.Text);
          if(ObjectForm.cbUNIDAD_TIEMPO_RE.Enabled) then
            ParamByName('peUnidadTiempoRE').AsString := ObjectForm.cbUNIDAD_TIEMPO_RE.Text
          else
            ParamByName('peUnidadTiempoRE').AsString := CNULL;

          if(ObjectForm.edNUM_UNIDADES_RE.Enabled) then
            ParamByName('peNumUnidadesRE').AsString := ObjectForm.edNUM_UNIDADES_RE.Text
          else
            ParamByName('peNumUnidadesRE').AsString := CNULL;

          if(ObjectForm.cbDIA_REVISION.Enabled) then
            ParamByName('peDiaRevision').AsString := ObjectForm.cbDIA_REVISION.Text
          else
            ParamByName('peDiaRevision').AsString := CNULL;

          if(ObjectForm.edF_PROX_REVISION.Enabled) then
            ParamByName('peFProxRevision').AsString := ObjectForm.edF_PROX_REVISION.Text
          else
            ParamByName('peFProxRevision').AsString := CNULL;

          ParamByName('peCveAmortizacion').AsString := ObjectForm.edCVE_AMORTIZACION.Text;

          if(ObjectForm.bbUNIDAD_TIEMPO_CP.Enabled) then
            ParamByName('peUnidadTiempoCP').AsString := ObjectForm.cbUNIDAD_TIEMPO_CP.Text
          else
            ParamByName('peUnidadTiempoCP').AsString := CNULL;

          if(ObjectForm.edNUM_UNIDADES_CP.Enabled) then
            ParamByName('peNumUnidadesCP').AsString := ObjectForm.edNUM_UNIDADES_CP.Text
          else
            ParamByName('peNumUnidadesCP').AsString := CNULL;

          if(ObjectForm.cbDIA_PAGO_CAP.Enabled) then
            ParamByName('peDiaPagoCap').AsString := ObjectForm.cbDIA_PAGO_CAP.Text
          else
            ParamByName('peDiaPagoCap').AsString := CNULL;

          if(ObjectForm.edF_INI_PAG_CAP.Enabled) then
            ParamByName('peFIniPagCap').AsString := ObjectForm.edF_INI_PAG_CAP.Text
          else
            ParamByName('peFIniPagCap').AsString := CNULL;

          ParamByName('peTasaBase').AsFloat:= StrToFloat(ObjectForm.edVALOR_TASA.Text);

          ExecProc;

          //SI CARGA MANDA LA CESION Y Y LA SITUACION DEL MISMO
          if (STPObtCesion.ParamByName('PSResultado').AsInteger = 0) then
          begin
             VLSalida := True;
             ID_CESION.AsInteger :=ParamByName('psIdCesion').AsInteger;
             SIT_CESION.AsString:= ParambyName('psSitCesion').AsString;
          end
          else // SI NO REALIZA LA CARGA MANDA ERRORES
          Begin
             ShowMessage('PROBLEMAS AL OBTENER LA CESION: ' +
             IntToStr(ParamByName('psRESULTADO').AsInteger));
             ShowMessage(ParamByName('psTxResultado').AsString);
             GenMsg(ParamByName('psTxResultado').AsString,Apli);
          end;
        end;
     finally
          STPObtCesion.Free;
     end;

     InsertaCesionMer := VLSalida;
end;
//--END    DEINTEC.DF

//---BEGIN   DEINTEC.DF 30.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.ilCALINTEjecuta(Sender: TObject);
begin
   if Objeto.CalcInt.FindKey([ilCALINT.Buffer]) then
      InterForma1.NextTab(edCVE_CALCULO);
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 30.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.Autorizacion1Click(Sender: TObject);
var
   Autoriza: TCrCto;
begin
   if Objeto.Active then
   begin
     Autoriza := TCrCto.Create(self);
     try
         Autoriza.Apli:=Objeto.Apli;
         Autoriza.ParamCre:=Objeto.ParamCre;
         Autoriza.FindKey([Objeto.credito.ContratoCre.ID_CONTRATO.AsString,Objeto.Credito.FOL_CONTRATO.AsString]);
         Autoriza.Acreditado.FindKey([Objeto.CreCto.Contrato.ID_Titular.asString]);
         Autoriza.Catalogo;
     finally
             Autoriza.Free;
     end;
   end
   else
      ShowMessage('Debe de seleccionar una cesión.');
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 30.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.Chequeras1Click(Sender: TObject);
var
   Chequera: TCrCreChe;
   vlChqra: String;
   vlBcoChqra: Integer;
const
   CVE_TIPO_ACRED = C_ACRED;
   CVE_TIPO_CHEQ = C_ADMIN;
   CVE_ZERO = '0';
begin
   if Objeto.Active then
   begin
     Chequera := TCrCreChe.Create(self);
     try
      ObtenChequeras(Objeto.CreCto.Contrato.ID_Titular.AsInteger,
           Objeto.ID_CESION.AsInteger,Objeto.EmiProv.Proveedor.ID_PROV_EXTERNO.AsString,
           CVE_TIPO_ACRED,CVE_TIPO_CHEQ,C_CARGO, Objeto.Apli ,vlBcoChqra, vlChqra);

         Chequera.GetParams(Objeto);
         Chequera.ParamCre:=Objeto.ParamCre;
         Chequera.VG_ACREDITADO := Objeto.CreCto.Contrato.ID_Titular.AsString;
         Chequera.VG_MONEDA     := Objeto.CreCto.Contrato.Cve_Moneda.AsString;
         Chequera.VG_DISPOSICION:= CVE_ZERO;
         Chequera.VG_TIPO_ACRED := C_ACRED;
         Chequera.VG_SUB_DIV    := CVE_ZERO;
         Chequera.VG_TIP_CHEQ   := C_ADMIN;
         Chequera.VG_BCO_CHQ    := IntToStr(vlBcoChqra);
         Chequera.VG_CHEQRA     := vlChqra;
         Chequera.VG_B_DISP_CHQ := False;

         {Chequera.Apli:=Objeto.Apli;
         Chequera.ParamCre:=Objeto.ParamCre;
         Chequera.FindKey([Objeto.CreCto.Contrato.ID_Titular.AsInteger,
            C_ACRED, Objeto.EmiProv.Proveedor.ID_PROV_EXTERNO.AsString, C_ADMIN,
            0, vlBcoChqra, vlChqra]);
         //Chequera.Persona.FindKey([Objeto.CreCto.Contrato.ID_Titular.asString]);}
         Chequera.Catalogo;
     finally
             Chequera.Free;
     end;
   end
   else
      ShowMessage('Debe de seleccionar una cesión.');
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 30.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.Impresion1Click(Sender: TObject);
var vlIdCesion : String;
begin
//    vlIdCesion := sgcDATOS.CellStr['ID_CESION', sgcDATOS.SG.Row];
    vlIdCesion := Objeto.ID_CESION.AsString;
    if vlIdCesion <> CNULL then
    Begin
       IF ( Objeto.CreCto.Producto.CVE_CAL_CAPITAL.AsString = C_VPN ) and
          ( Objeto.SIT_CESION.AsString = 'NA')then
       begin
          RepRelDocEmiProVPN(     '' ,               '' ,             '' ,
                                  '' ,               '' ,             '' ,
                                  '' ,               '' ,             '' ,
                          vlIdCesion ,               '' , IntToStr(Objeto.Apli.IdEmpresa),
                                   '',            FALSE ,          FALSE ,
                               FALSE ,               '' ,            'C' ,
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//                                  '' ,      Objeto.Apli ,         FALSE );
                                   '' ,              '',               '',
                           Objeto.Apli,           FALSE);
{/ROIM}
       end
       else begin
          RepRelDocEmiPro(        '' ,               '' ,             '' ,
                                  '' ,               '' ,             '' ,
                                  '' ,               '' ,             '' ,
                          vlIdCesion ,               '' , IntToStr(Objeto.Apli.IdEmpresa),
                                   '',            FALSE ,          FALSE ,
                               FALSE ,               '' ,            'C' ,
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//                                  '' ,      Objeto.Apli ,         FALSE );
                                   '' ,              '',               '',
                           Objeto.Apli,           FALSE);
       end;
{/ROIM}
    end
    else ShowMessage('No existe una cesión a imprimir');
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 30.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.PersonaCorporativa1Click(Sender: TObject);
var
   Personal: TPersona;
Const
   I_PFISICA = 1;
   I_PMORAL = 2;
begin
   if Objeto.Active then
   begin
     Personal := TPersona.Create(self);
     try
         Personal.Apli:=Objeto.Apli;
         if Objeto.CreCto.Contrato.TITCVE_PER_JURIDICA.AsString = P_FISICA THEN
            Personal.FilterBy:= I_PFISICA   //Filtro de Persona Fisica
         else
            Personal.FilterBy:= I_PMORAL;  //Filtro de Persona Moral
         Personal.FindKey([Objeto.CreCto.Contrato.ID_Titular.asString]);
         Personal.Catalogo;
     finally
             Personal.Free;
     end;
   end
   else
      ShowMessage('Debe de seleccionar una cesión.');
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 30.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.Acreditado1Click(Sender: TObject);
var
   Acreditado: TCrAcredit;
begin
   if Objeto.Active then
   begin
     Acreditado := TCrAcredit.Create(self);
     try
         Acreditado.Apli:=Objeto.Apli;
         Acreditado.ParamCre:=Objeto.ParamCre;
         Acreditado.FindKey([Objeto.CreCto.Contrato.ID_Titular.asString]);
         Acreditado.Catalogo;
     finally
         Acreditado.Free;
     end;
   end
   else
      ShowMessage('Debe de seleccionar una cesión.');
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 25.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.RegistroDocClick(Sender: TObject);
var
   Docto: TCrDocto;
   temporal: TCrGenVto;
   Consult : TCrconsult;
begin
if Objeto.Active then
   begin
      IF (Objeto.CreCto.Producto.CVE_CAL_CAPITAL.AsString <> C_VPN) then
      begin
         Docto := TCrDocto.Create(self);
         try
             Docto.Apli:=Objeto.Apli;
             Docto.ParamCre:=Objeto.ParamCre;
             Objeto.vlCesion := Objeto.ID_CESION.AsString;
             Docto.vgCesion := Objeto.vlCesion;
             Docto.Cesion := Objeto;
             Docto.CVE_TIPO_INTERES.AsString := Objeto.CVE_TIPO_INTERES.AsString;
             Docto.Catalogo;
         finally
                 Docto.Free;
                 Objeto.FindKey([Docto.Cesion.ID_CESION.AsString]);
                 Actualizaimportes;
         end;
      END
      ELSE
      BEGIN
         IF Objeto.SIT_CESION.AsString = C_CES_AUTOR THEN
         BEGIN
             Consulta_Credito(ftCapital,Objeto.ID_CESION.AsInteger,0,'',
                                     '',Objeto.Apli, Objeto.ParamCre);
         END
         ELSE
         BEGIN
           temporal := TCrGenVto.Create(self);
           try
               temporal.Apli:=Objeto.Apli;
               temporal.ParamCre:=Objeto.ParamCre;
               temporal.vgCesion := Objeto.ID_CESION.AsString;
               temporal.VGCredito:= Objeto.ID_CESION.AsInteger;
               temporal.FindKey([Objeto.ID_CESION.AsString]);
               temporal.Catalogo;
           finally
               temporal.Free;
           end;
         END;
      END;
   end
   else
      ShowMessage('Debe de seleccionar una cesión.');
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 30.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.ProductodeCredito1Click(Sender: TObject);
var
   Producto: TCrProduct;
begin
   if Objeto.Active then
   begin
     Producto := TCrProduct.Create(self);
     try
         Producto.Apli:=Objeto.Apli;
         Producto.ParamCre:=Objeto.ParamCre;
         Producto.FindKey([Objeto.CreCto.CVE_PRODUCTO_CRE.AsString]);
         Producto.Catalogo;
     finally
             Producto.Free;
     end;
   end
   else
      ShowMessage('Debe de seleccionar una cesión.');
end;
//--END    DEINTEC.DF   DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 26.MAYO.2008    DESCUENTO MERCANTIL
Procedure TWCrCesion.LimpiaTabla;
var STPObtSuc  : TStoredProc;
begin
     try
          STPObtSuc:=TStoredProc.Create(Nil);
          STPObtSuc.DatabaseName:=Objeto.Apli.DatabaseName;
          STPObtSuc.SessionName:=Objeto.Apli.SessionName;
          STPObtSuc.StoredProcName:='PKGCRCUOTAS.STPLIMPIATABLACUOTA';
          STPObtSuc.Params.CreateParam(ftInteger,'PEIDRefSolCuota',ptInput);
          STPObtSuc.Params.CreateParam(ftFloat,'PSResultado',ptOutput);
          STPObtSuc.Params.CreateParam(ftString,'PSTXResultado',ptOutput);
          STPObtSuc.Prepare;
          STPObtSuc.ParamByName('PEIDRefSolCuota').AsInteger := Objeto.ID_CESION.AsInteger;
          STPObtSuc.ExecProc;
          if (STPObtSuc.ParamByName('PSResultado').AsInteger <> 0) then
               ShowMessage('PROBLEMAS AL LIMPIAR LA TABLA DE DISPOSICIÓN: ' + IntToStr(STPObtSuc.ParamByName('PSResultado').AsInteger) + STPObtSuc.ParamByName('PSTXResultado').AsString);
     finally
            STPObtSuc.Free;
     end;
end;
//---END   DEINTEC.DF 30.ABRIL.2008    DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 26.MAYO.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.edIMP_CESIONExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      if StrToFloat(edIMP_CESION.Text) <= 0 then
      Begin
        vlSalida := False;
        VLMsg := 'El importe de cesion no puede ser menor o igual a cero';
      end;
      InterForma1.ValidaExit(edIMP_CESION,VLSalida,VLMsg,True);
   end;
end;
//---END   DEINTEC.DF 26.MAYO.2008    DESCUENTO MERCANTIL

//---BEGIN   DEINTEC.DF 29.ABRIL.2008    DESCUENTO MERCANTIL
        //Actualiza la Cesion para VPN
function TCrCesion.UpdateCesionMer: Boolean;
var     VLSalida      : Boolean;
        STPObtCesion  : TStoredProc;
Begin
     VLSalida := False;
     STPObtCesion := TStoredProc.Create(Self);
     try
        with STPObtCesion do
        begin
          STPObtCesion.DatabaseName:= Apli.DatabaseName;
          STPObtCesion.SessionName:= Apli.SessionName;
          STPObtCesion.StoredProcName:='PKGCRCREDITO.STPMODIFICACESIONMER';
          Params.Clear;

          Params.CreateParam(ftInteger,'psIdCesion',ptInput);
          Params.CreateParam(ftDate,'peFInicio',ptInput);
          Params.CreateParam(ftDate,'peFVvto',ptInput);
          Params.CreateParam(ftFloat,'peDiasPlazo',ptInput);
          Params.CreateParam(ftString,'peCveCalculo',ptInput);
          Params.CreateParam(ftString,'peCveTipoTasa',ptInput);
          Params.CreateParam(ftString,'peCveTasaRefer',ptInput);
          Params.CreateParam(ftString,'peOperadorSTasa',ptInput);
          Params.CreateParam(ftFloat,'peSobreTasa',ptInput);
          Params.CreateParam(ftFloat,'peTasaCredito',ptInput);
          Params.CreateParam(ftString,'peUnidadTiempoRE',ptInput);
          Params.CreateParam(ftFloat,'peNumUnidadesRE',ptInput);
          Params.CreateParam(ftFloat,'peDiaRevision',ptInput);
          Params.CreateParam(ftDate,'peFProxRevision',ptInput);
          Params.CreateParam(ftString,'peCveAmortizacion',ptInput);
          Params.CreateParam(ftString,'peUnidadTiempoCP',ptInput);
          Params.CreateParam(ftFloat,'peNumUnidadesCP',ptInput);
          Params.CreateParam(ftFloat,'peDiaPagoCap',ptInput);
          Params.CreateParam(ftDate,'peFIniPagCap',ptInput);
          Params.CreateParam(ftDate,'peTasaBase',ptInput);
          Params.CreateParam(ftString,'peBCommit',ptInput);
          Params.CreateParam(ftDate,'peFAutoriza',ptInput);
          Params.CreateParam(ftString,'peCveUsuMod',ptInput);
          Params.CreateParam(ftFloat,'peImpCredito',ptInput);
          Params.CreateParam(ftFloat,'psResultado',ptOutput);
          Params.CreateParam(ftString,'psTxResultado',ptOutput);

          ParamByName('psIdCesion').AsInteger := StrToInt(ObjectForm.edID_CESION.Text);
          ParamByName('peFInicio').AsDateTime := StrToDateTime(ObjectForm.edF_INICIO.Text);
          ParamByName('peFVvto').AsDateTime := StrToDateTime(ObjectForm.edF_VENCIMIENTO.Text);
          ParamByName('peDiasPlazo').AsFloat := StrToFloat(ObjectForm.edDIAS_PLAZO.Text);
          ParamByName('peCveCalculo').AsString := ObjectForm.edCVE_CALCULO.Text;
          if (ObjectForm.cbTIPO_TASA.Text = 'VARIABLE') then
            ParamByName('peCveTipoTasa').AsString := C_VARIABLE
          else
            ParamByName('peCveTipoTasa').AsString := C_FIJA;
          ParamByName('peCveTasaRefer').AsString := ObjectForm.edCVE_TASA_REFER.Text;
          ParamByName('peOperadorSTasa').AsString := ObjectForm.cbOPERADOR_STASA.Text;
          ParamByName('peSobreTasa').AsFloat:= StrToFloat(ObjectForm.edSOBRETASA.Text);
          ParamByName('peTasaCredito').AsFloat:= StrToFloat(ObjectForm.edTASA_CREDITO.Text);
          if(ObjectForm.cbUNIDAD_TIEMPO_RE.Enabled) then
            ParamByName('peUnidadTiempoRE').AsString := ObjectForm.cbUNIDAD_TIEMPO_RE.Text
          else
            ParamByName('peUnidadTiempoRE').AsString := CNULL;

          if(ObjectForm.edNUM_UNIDADES_RE.Enabled) then
            ParamByName('peNumUnidadesRE').AsString := ObjectForm.edNUM_UNIDADES_RE.Text
          else
            ParamByName('peNumUnidadesRE').AsString := CNULL;

          if(ObjectForm.cbDIA_REVISION.Enabled) then
            ParamByName('peDiaRevision').AsString := ObjectForm.cbDIA_REVISION.Text
          else
            ParamByName('peDiaRevision').AsString := CNULL;

          if(ObjectForm.edF_PROX_REVISION.Enabled) then
            ParamByName('peFProxRevision').AsString := ObjectForm.edF_PROX_REVISION.Text
          else
            ParamByName('peFProxRevision').AsString := CNULL;

          ParamByName('peCveAmortizacion').AsString := ObjectForm.edCVE_AMORTIZACION.Text;

          if(ObjectForm.bbUNIDAD_TIEMPO_CP.Enabled) then
            ParamByName('peUnidadTiempoCP').AsString := ObjectForm.cbUNIDAD_TIEMPO_CP.Text
          else
            ParamByName('peUnidadTiempoCP').AsString := CNULL;

          if(ObjectForm.edNUM_UNIDADES_CP.Enabled) then
            ParamByName('peNumUnidadesCP').AsString := ObjectForm.edNUM_UNIDADES_CP.Text
          else
            ParamByName('peNumUnidadesCP').AsString := CNULL;

          if(ObjectForm.cbDIA_PAGO_CAP.Enabled) then
            ParamByName('peDiaPagoCap').AsString := ObjectForm.cbDIA_PAGO_CAP.Text
          else
            ParamByName('peDiaPagoCap').AsString := CNULL;

          if(ObjectForm.edF_INI_PAG_CAP.Enabled) then
            ParamByName('peFIniPagCap').AsString := ObjectForm.edF_INI_PAG_CAP.Text
          else
            ParamByName('peFIniPagCap').AsString := CNULL;

          ParamByName('peTasaBase').AsFloat:= StrToFloat(ObjectForm.edVALOR_TASA.Text);
          ParamByName('peBCommit').AsString := 'V';
          ParamByName('peFAutoriza').AsDateTime := Apli.DameFechaEmpresa;
          ParamByName('peCveUsuMod').AsString := Apli.Usuario;
          ParamByName('peImpCredito').AsFloat := StrToFloat(ObjectForm.edIMP_CESION.Text);

          ExecProc;

          if (STPObtCesion.ParamByName('PSResultado').AsInteger = 0) then
          begin
             VLSalida := True;
          end
          else // SI NO REALIZA LA CARGA MANDA ERRORES
          Begin
             ShowMessage('PROBLEMAS AL OBTENER LA CESION: ' +
             IntToStr(ParamByName('psRESULTADO').AsInteger));
             ShowMessage(ParamByName('psTxResultado').AsString);
             GenMsg(ParamByName('psTxResultado').AsString,Apli);
          end;
        end;
     finally
          STPObtCesion.Free;
     end;
     UpdateCesionMer := VLSalida;
end;
//--END    DEINTEC.DF

//---BEGIN   DEINTEC.DF 29.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.ilTASA_REFEREjecuta(Sender: TObject);
begin
   if Objeto.TasaRefer.FindKey([ilTASA_REFER.Buffer]) then
       InterForma1.NextTab(edCVE_TASA_REFER);
end;
//--END    DEINTEC.DF

//---BEGIN   DEINTEC.DF 29.ABRIL.2008    DESCUENTO MERCANTIL
procedure TWCrCesion.ilTIPAMORTEjecuta(Sender: TObject);
begin
   if Objeto.TipoAmort.FindKey([ilTIPAMORT.Buffer]) then
      InterForma1.NextTab(edCVE_AMORTIZACION);
end;
//--END    DEINTEC.DF

procedure TWCrCesion.RA1Click(Sender: TObject);
var
   Docsmas : TCrdocsmas; 
   temporal: TCrGenVto;
   Consult : TCrconsult;
begin
   if Objeto.Active then
   begin
    IF (Objeto.CreCto.Producto.CVE_CAL_CAPITAL.AsString <> C_VPN) then
      begin
       Docsmas := TCrdocsmas.Create(self);
       try
           Docsmas.apli     := Objeto.Apli;
           Docsmas.ParamCre :=Objeto.ParamCre;
           Objeto.vlCesion  := Objeto.ID_CESION.AsString;
           Docsmas.vgCesion := Objeto.vlCesion;
           Docsmas.Cesion   := Objeto;
//           Docsmas.CVE_TIPO_INTERES.AsString := Objeto.CVE_TIPO_INTERES.AsString;
           Docsmas.Catalogo;
   finally
           Docsmas.Free;
           Objeto.FindKey([Docsmas.Cesion.ID_CESION.AsString]);
           Actualizaimportes;
         end;
      end
      ELSE
      BEGIN
         IF Objeto.SIT_CESION.AsString = C_CES_AUTOR THEN
         BEGIN
             Consulta_Credito(ftCapital,Objeto.ID_CESION.AsInteger,0,'',
                                     '',Objeto.Apli, Objeto.ParamCre);
         END
         ELSE
         BEGIN
           temporal := TCrGenVto.Create(self);
           try
           temporal.Apli:=Objeto.Apli;
           temporal.ParamCre:=Objeto.ParamCre;
           temporal.vgCesion := Objeto.ID_CESION.AsString;
           temporal.VGCredito:= Objeto.ID_CESION.AsInteger;
           temporal.FindKey([Objeto.ID_CESION.AsString]);
           temporal.Catalogo;
           finally
               temporal.Free;
         end;
      end;
  end;
  end
  else
  ShowMessage('   Debe de seleccionar una cesión ');
end;


procedure TWCrCesion.Button1Click(Sender: TObject);
begin
  If EnviaMail then
     ShowMessage('Enviado')
  Else
     ShowMessage('No enviado')
end;

procedure TWCrCesion.EvaluaNuevaDisp;
var vlSql    : String;
    vlSql2   : String;
    vlHayImpagos  : Integer;
    vlHayRsReVen  : Integer;
    vlHayVencidos : Integer;
    vlPctLinRsReVen : Real;
begin
//  edTIPO_CARTERA.Text := 'VIGENTE';

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
    Objeto.VGTIPO_DISPOSICION := 'RE';
    lbTipo_Disp.Caption := 'RENOVACION';

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
       ShowMessage('La nueva Cesión es una RENOVACIÓN VENCIDA');
       lbEstadoCesion.Caption := 'VENCIDA';
    end
    else
    begin
       ShowMessage('La nueva Cesión es una RENOVACIÓN VIGENTE');
       lbEstadoCesion.Caption := 'VIGENTE';
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
       lbEstadoCesion.Caption := 'VENCIDA';
    end;
  end;
end;


function TWCrCesion.HayVencidos(Folio_grupo: String): Boolean;
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

end.



