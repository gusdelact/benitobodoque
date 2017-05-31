//PKGCRPRORRCM
// Sistema         : Clase de CrResRee
// Fecha de Inicio : 09/02/2005
// Función forma   : Clase de CrResRee
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :      

//RENOVACIONES DE UNO A UNO
//      No tenga Adeudos de Interés
//      Haya pagado mas del 25 del monto original del crédito
//REESTRUCTURACIÓN DE VARIOS O UNO A UNO   
//MODIFICACIONES:
//31/08/2005    EASA4011        CONVENIO MODIFICATORIO Y EVENTO DE ACELERACION
//17/05/2011    RABA            REESTRUCTURACION
//De varias líneas a una de reestructuración, validando el monto de lo disponible
//de la línea origen se muestran en un grid todos los créditos autorizados
//posibles de reestructurar, validando que si es más de uno se seleccionen
//todos y solo se pueden seleccionar aquellos créditos que no tengan garintias
//o redescuentos aplicados o que no se encuentren en otro proceso de reestructura
// El grid afecta a todos los tipos de operación
Unit IntCrResRee;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,InterApl,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, IntLinkit, Ungene,
InterEdit, Menus, Grids,
scktcomp, DBClient, MConnect, SConnect, IdBaseComponent, IdComponent,
IdTCPConnection, IdTCPClient, IdHTTP,

IntGenCre,
IntParamCre,    //Parametros
IntMensaje,     //Ventana Mensaje Error
IntCrCto,       //Contrato
IntCrCredito,   //Disposición;
IntMProAdeudo,  //Pronóstico de Adeudo
intCrAcredit,   //Acreditado
IntCrProduct,   //Producto
IntPers, ImgList, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook, Wwdbdlg;        //Persona

Const
   coCRLF      = #13#10;
   CO_COL_CHECK      = 0;
   CO_COL_IDCREDITO  = CO_COL_CHECK + 1;
   CO_COL_F_INICIO   = CO_COL_IDCREDITO + 1;
   CO_COL_F_VNTO     = CO_COL_F_INICIO + 1;
   CO_COL_F_TRAS     = CO_COL_F_VNTO + 1;
   CO_COL_IMP_DISP   = CO_COL_F_TRAS + 1;
//   CO_COL_INT_VIG    = CO_COL_IMP_DISP + 1;
//   CO_COL_SDO_VIG    = CO_COL_INT_VIG + 1;
//   CO_COL_ADE_VENC   = CO_COL_SDO_VIG + 1;
//   CO_COL_ADE_TOT    = CO_COL_ADE_VENC + 1;
   CO_COL_ADE_TOT    = CO_COL_IMP_DISP + 1;
   CO_COL_REDESC     = CO_COL_ADE_TOT + 1;
   CO_COL_GARANTIA   = CO_COL_REDESC + 1;
   CO_COL_RR         = CO_COL_GARANTIA + 1;
   CO_COL_PAGOS      = CO_COL_RR + 1;
   CO_COL_VIGVEN     = CO_COL_PAGOS + 1;
   CO_COL_GRACIA     = CO_COL_VIGVEN + 1;
   CO_COL_IMPIMPAGADO  = CO_COL_GRACIA + 1;
   CO_COL_PCT        = CO_COL_IMPIMPAGADO + 1;

   CO_ERROR     = 'ERR';  // Mensaje de Error
   CO_CHECKED   = 'V';
   CO_UNCHECKED = 'F';
   CO_NOTCHECK  = '-';

Type
   Registro=  Record C   : String ;
                     Disp: String ;
                     Adeu: String ;
                     Cal : String ;
                     Baja: String ;
                     Cve : String ;
                     Grup: String ;
                     NewD: String ;
end ;

Type
 TCrResRee= class;

  TWCrResRee=Class(TForm)
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
    rgTipoOper: TRadioGroup;
    bbAgregar: TBitBtn;
    bbEliminaCredito: TBitBtn;
    SGCRenRee: TSGCtrl;
    bbEliminaTodo: TBitBtn;
    Label7: TLabel;
    iedID_CONTRATO: TInterEdit;
    btCONTRATO: TBitBtn;
    edCVE_PRODUCTO: TEdit;
    edDESC_PRODUCTO: TEdit;
    ilIDCONTRATO: TInterLinkit;
    edNombreAcreditado: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    bbGenRenRee: TBitBtn;
    BitBtn1: TBitBtn;
    Label9: TLabel;
    edF_INICIO: TEdit;
    dtpF_INICIO: TInterDateTimePicker;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    edFOL_GRUPO_RENUEVA: TEdit;
    pmAcreditado: TPopupMenu;
    ConsultaSectorPersona1: TMenuItem;
    CatlogodePersona1: TMenuItem;
    AcessoaProducto: TMenuItem;
    Autorizaciones1: TMenuItem;
    Label12: TLabel;
    Label13: TLabel;
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    Label15: TLabel;
    edIMP_INCREMENTO: TInterEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label32: TLabel;
    iedID_CONTRATO_DEST: TInterEdit;
    btCONTRATO_DEST: TBitBtn;
    Label19: TLabel;
    edNombreAcreditado_dest: TEdit;
    edCVE_PRODUCTO_dest: TEdit;
    edDESC_PRODUCTO_dest: TEdit;
    ilIDCONTRATO_dest: TInterLinkit;
    iedDISPONIBLE_AUT: TInterEdit;
    GBAutorizacion: TGroupBox;
    Shape6: TShape;
    Label20: TLabel;
    strgrdCreditos: TStringGrid;
    Shape2: TShape;
    Label26: TLabel;
    ImageList: TImageList;
    Shape11: TShape;
    Label30: TLabel;
    Label25: TLabel;
    Shape1: TShape;
    Shape4: TShape;
    Label22: TLabel;
    Shape8: TShape;
    Label23: TLabel;
    Label29: TLabel;
    lbINCREMENTO: TLabel;
    Label16: TLabel;
    iedIMP_NUEVADISP: TInterEdit;
    Shape9: TShape;
    Label2: TLabel;
    Label31: TLabel;
    Label21: TLabel;
    Shape7: TShape;
    Label24: TLabel;
    Label27: TLabel;
    lbTotalIncremento: TLabel;
    lbTotalNuevaDisp: TLabel;
    Label28: TLabel;
    Shape3: TShape;
    Label33: TLabel;
    lbParametrosIniciales: TLabel;
    Label34: TLabel;
    Shape5: TShape;
    Lleylindest: TLabel;
    Panel1: TPanel;
    Label35: TLabel;
    EdCred: TEdit;
    BtnOk: TButton;
    BtnCancel: TButton;
    Label36: TLabel;
    ChbTodos: TCheckBox;
    StringGrid1: TStringGrid;
    Shape10: TShape;
    Shape12: TShape;
    Label37: TLabel;
    Label38: TLabel;
    Shape13: TShape;
    Label39: TLabel;
    Memo1: TMemo;
    QCat: TQuery;
    DSQCat: TDataSource;
    wwDBLookupComboDlg1: TwwDBLookupComboDlg;
    Shape14: TShape;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Shape15: TShape;
    Shape16: TShape;
    Label44: TLabel;
    Label45: TLabel;
    ieCheqAbono: TInterEdit;
    Label46: TLabel;
    ieCheqLiqu: TInterEdit;
    Label47: TLabel;
    iedIMP_AUROTIZADO: TInterEdit;
    Label48: TLabel;
    Shape17: TShape;
    chB_VariasDisposiciones: TCheckBox;
    pmSeleccion: TPopupMenu;
    Calificaccin1: TMenuItem;
    Agrupador1: TMenuItem;
    paSecuencia: TPanel;
    Label49: TLabel;
    btnOKSecuencia: TButton;
    Button1: TButton;
    edSecuencia: TInterEdit;
    EdCredSeq: TEdit;
    bbObtDisp: TBitBtn;
    lbAplicaTodaLinea: TLabel;
    rgTipoAcreditados: TRadioGroup;
    Shape18: TShape;
    Label50: TLabel;
    Label51: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure bbAgregarClick(Sender: TObject);
    procedure btCONTRATOClick(Sender: TObject);
    procedure ilIDCONTRATOEjecuta(Sender: TObject);
    procedure bbEliminaCreditoClick(Sender: TObject);
    procedure bbEliminaTodoClick(Sender: TObject);
    procedure SGCRenReeCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure bbGenRenReeClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ConsultaSectorPersona1Click(Sender: TObject);
    procedure CatlogodePersona1Click(Sender: TObject);
    procedure AcessoaProductoClick(Sender: TObject);
    procedure Autorizaciones1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edF_INICIOChange(Sender: TObject);
    procedure dtpF_INICIOChange(Sender: TObject);
    procedure rgTipoOperClick(Sender: TObject);
    procedure edF_INICIOEnter(Sender: TObject);
    procedure edF_INICIOExit(Sender: TObject);
    procedure edIMP_INCREMENTOExit(Sender: TObject);
    procedure iedID_CONTRATOExit(Sender: TObject);
    procedure btCONTRATO_DESTClick(Sender: TObject);
    procedure iedID_CONTRATO_DESTExit(Sender: TObject);
    procedure ilIDCONTRATO_destEjecuta(Sender: TObject);
    // </ RABA >
    // 17 MAY 2011
    // Se agregan procedimientos para la muestra de los créditos de la línea
    // origen en un grid
    procedure strgrdCreditosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strgrdCreditosMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    function  QuitaComas(PPCadena : String):String;
    function  ValidaImporteDisponible(ppValorIncremento:Double):String;
    procedure edIMP_INCREMENTOEnter(Sender: TObject);
    procedure InterForma1BtnSalirClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure SGCRenReeDblClick(Sender: TObject);
    procedure strgrdCreditosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Calificaccin1Click(Sender: TObject);
    procedure Agrupador1Click(Sender: TObject);
    procedure btnOKSecuenciaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    Procedure CrtFiltroContratoDest(sTitular, sTipoProdRS, sTipoProdRE, sMoneda, sRiesgoComun, sOSolidario :String);
    // < RABA />
    Procedure CrtBanderas(sOpcion:Integer);
    procedure bbObtDispClick(Sender: TObject);
    procedure rgTipoAcreditadosClick(Sender: TObject); // RABA ENE 2015 ACTUALIZACIÓN B-6
    private
    { Private declarations }
    procedure AsignaFVAlor( peFecha : TDateTime);
    // FJR 26.07.2012
    procedure LlenaClavesRestruc ;
    Procedure CreditoTipoRestruc (IdCredito: String) ;
    function GeneraPC(paso: integer): String ;
    Function HaySinNuevoCredito: Boolean ;
    Procedure BuscaCambiosLinea;
    public
    { Public declarations }
    Objeto : TCrResRee;

    VLIMP_DISPUESTO : Double;
    VLSDO_INSOLUTO  : Double;
    VLSDO_INTVIG    : Double;
    VLSDO_VIG_TOTAL : Double;
    VLADEUDO_VENC   : Double;
    VLADEUDO_TOTAL  : Double;
    VLADEUDO_DISP   : Double;

    VGRESTRUC       : String ;
    VGBAJA          : String ;
    VGCLAVE         : String ;

//    Arr_Calif : Array of Registro ;
    Arr_Montos: Array of Registro ;

    Function  ValidaDispRenov : String;
    Function  DameCreditoBase : Integer;
    Procedure Agregar;
    Procedure AgregaEliminaCredito(PPIDCredito : Integer; PPAccion : String);
    Procedure EliminaTodo;
    Procedure AgregaEliminaCreditoBD(PPIDCredito : Integer; PPAccion, PPCveObs : String;
                                     PPBGenTrasVen :String;
                                     PPImpOperacion, PPImpAutoriza, PPImpIncremento: Double);
    Procedure EliminaTodoBD;
    Function  ValidaTipOperAutorizacion : String;
    Procedure AdeudoDisp;
    // </ RABA >
    // 17 MAY 2011
    // Se agregan procedimientos para la muestra de los créditos de la línea
    // origen
    procedure ConfGrid( SGrid : TStringGrid );
    procedure MuestraDatos;
    function  ValidaCredSelec : String;
    //procedure CalculaImportes; FJR 11.09.2012 COMENTADO PARA OPTIMIZAR CODIGO
    function  ValidaCreditosReestruc : String;
    procedure BarreArreglo(Credito, Calif, Baja, Clave: String; Index, Accion: Integer);
    function BuscaImporteEnGrid(Credito: String; ImpBuscado: Integer): Double ;
    // < RABA />
end;
 TCrResRee= class(TInterFrame)
      private
        fCurrentValue  : Double;
        fCurrentDate   : TDate;
      private
        Procedure AsignaTipoFiltro( Sender: TRadioGroup);
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }

        ParamCre                 : TParamCre;
        Credito                  : TCrCredito;//Disposición
        ContratoCre              : TCrCto; //Contrato Crédito
        Acreditado               : TCrAcredit; // RABA FEB 2015 para el manejo de renovaciones del mismo riesgo comun
      // </ RABA >
      // 17 MAY 2011
      // Se agreaga clase de contrato para la filtración del contrato destino
      // y variables globales para hacer referencia rápida a sus valores
        ContratoDest             : TCrCto; //
        vgIdContratoOrig         : Integer;
        vgNuevaDisposicion       : Integer;
      // < RABA />

        vgIdCredito              : Integer;
        VLACREDITADO    : String;
        VLMONEDA        : String;

        VGInteres : Double;
        VGInteresIva : Double;
        VGInteresProy : Double;
        VGInteresIvaProy : Double;

        vgGrupoEco               : String;  //RABA FEB 2015 Para obtener líneas de crédito del mismo grupo económico

        F_INICIO                 : TInterCampo; //EASA 01062004
        FOL_GRUPO_RENUEVA        : TInterCampo; //EASA 01062004
        IMP_AUTORIZADO           : TInterCampo; //EASA 05092005
        IMP_INCREMENTO           : TInterCampo; //EASA 05092005
        IMP_OPERACION            : TInterCampo; //EASA 05092005

        DISPONIBLE_AUT           : TInterCampo; //RABA  17052011
        IMP_NUEVADISP            : TInterCampo; //RABA  17052011
        B_APL_TODA_LIN           : TInterCampo; //RABA  FEB 2015 LOS CAMBIOS APLICAN A TODA LA LINEA DE CREDITO

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

        Function    Valida25ImportePagado(PPIDCredito : Integer; PPFecha : TDateTime): String;
        Function    ValidaInteresPagado(PPIDCredito : Integer; PPFecha : TDateTime): String;
        Procedure   Intereses(sCesion,sFechaIni:String);
        Procedure   LlenaEncabezado(sCesion,sFechaIni:String;var PPSaldoVenc : Double; var PPSaldoTotal : Double; var PPImpIntVig : Double);
        procedure   setCurrentValue( Sender: TInterCampo );
        function    getCurrentValue: Double;
        procedure   setCurrentDate( Sender: TInterCampo );
        function    getCurrentDate: TDate;
        function    BuildSQLStr( BInicio : Boolean ) : String;
        procedure   stpObtAdeudo(peIdCredito  : Integer; peNumPeriodo : Integer;
                                 peCveComision: String;  pFCalculo    : TDate;
                                 pFactor      : Double;  pBIVA        : String;
                                 pCveAccesorio: String;  var vlTotal,  vlImporte,
                                 vlIVA,     vlBenBco,    vlBenGob,     vlMoras,
                                 vlIVAMoras   :   Double;var vlError  : String );

       Procedure   ObtenAdeudos(IdCredito:Integer;
                                vlfecha  : string;
                                var psImpAdeudo, psImpInteres,psImpAdeudoVdo, psImpInteresVdo, psImpPrepagoCP : Double);
       Procedure   ActualizaSecuencia(peIdCredito, peIdCredRenovado, peValorSec:Integer);
      published
      end;

//HERJA
var  vlHoy, vlFValor : TDateTime;
     vlsql: String;
     vlCount: Integer;

     VLBIMP_IMPAGADO : String; //HERJA ABRIL 2013
     vlTempCheq      : String; //HERJA JUNIO 2014
     vlTempTrasVenc  : String; //RABA FEB 2015
     
implementation
Uses
IntMDispDet;    //Orden de Disposición/Detalle de Crédito

{$R *.DFM}
CONST
C_MSG_GRID_NULL = 'Indique una Disposición a Renovar / Reestructurar / Conv. Modf. / Event. Aceler.'#30'>C';
C_MSG_VALID_AUT = 'La Autorización no aplica ';
C_MSG_RENOVA    = 'Renovación ';
C_MSG_REESTRUC  = 'Reestructuración ';
C_MSG_CONV_MOD  = 'Convenio Modificatorio ';
C_MSG_EVEN_ACEL = 'Evento de Aceleración ';
C_MSG_LIQ_COLOC = 'Liquidación - Colocación ';
coUpdFValor     = '¿Deseas actualizar la fecha de aplicación?';
coValFechaIni   = 'La Fecha de operación no puede ser menor a la fecha de inicio de la Disposición';
C_MSG_AUT_DEST  = 'Debe seleccionar una autorización destino';   // RABA 24 MAY 2011
C_MSG_NO_DISP   = 'La Autorización destino no cuenta con Disponible suficiente'; // RABA 24 MAY 2011
C_MSG_RS_TODOS  = 'Para la Reestructura debe seleccionar todos los créditos de todas las líneas seleccionadas';
C_MSG_LIN_CRED  = 'Se deben indicar la Autorización Origen y la Autorización Destino';
C_MSG_SALIDA    = 'La operación se debe capturar en varias RS o RE, que no se han capturado, '+ char(13) +
                  ' si sale sin capturar la captura se cancelará. ¿Desea salir?';

C_CVE_OPERACION = ' ''PAGOCN'', ''PAGOCP'', ''PAGOFN'', ''PAGOIN'', ' + coCRLF +
                  ' ''PGCNGF'', ''PGINGF'', ''PGFNGF'', ''PGCPGF'', ' + coCRLF +
                  ' ''RCGFCN'', ''RCGFIN'', ''RCGFFN'', ''RCGFCP'', ' + coCRLF +
                  ' ''PGCNGP'', ''PGINGP'', ''PGFNGP'', ''PGCPGP'', ' + coCRLF +
                  ' ''RCGPCN'', ''RCGPIN'', ''RCGPFN'', ''RCGPCP'', ' + coCRLF +
                  ' ''PGAPCN'', ''PGAPIN'', ''PGAPFN'', ''PGAPCP'', ' + coCRLF +
                  ' ''PGDMCN'', ''PGDMIN'', ''PGDMFN'', ''PGDMCP'', ' + coCRLF +
                  ' ''PGCTCN'', ''PGCTIN'', ''PGCTFN'', ''PGCTCP'', ' + coCRLF +
                  ' ''PGSTCN'', ''PGSTIN'', ''PGSTFN'', ''PGSTCP'', ' + coCRLF +
                  ' ''RTCPGF'', ''RTINGF'', ''RTFNGF'', ''RTCNGF'', ' + coCRLF +
                  ' ''RTCPGP'', ''RTINGP'', ''RTFNGP'', ''RTCNGP'', ' + coCRLF +
                  ' ''RSCPGF'', ''RSINGF'', ''RSFNGF'', ''RSCNGF'', ' + coCRLF +
                  ' ''RSCPGP'', ''RSINGP'', ''RSFNGP'', ''RSCNGP'', ' + coCRLF +
                  ' ''INCPGF'', ''ININGF'', ''INFNGF'', ''INCNGF'', ' + coCRLF +
                  ' ''INCPGP'', ''ININGP'', ''INFNGP'', ''INCNGP'', ' + coCRLF +
                  ' ''CODNCP'', ''CODNFN'', ''CODNIN'', ''CODNCN'', ' + coCRLF +   //CONDONACIONES
                  ' ''QUITCP'', ''QUITFN'', ''QUITIN'', ''QUITCN'', ' + coCRLF +   //QUITAS
                  ' ''QUEBCP'', ''QUEBFN'', ''QUEBCN'', ''QUEBIN'', ' + coCRLF +   //QUEBRANTOS
                  ' ''CASTCP'', ''CASTFN'', ''CASTCN'', ''CASTIN'', ' + coCRLF +   //CASTIGOS
                  ' ''DACICN'', ''DACIIN'', ''DACIFN'', ''DACICP'', ' + coCRLF +   //Dacion
                  ' ''ADJUCN'', ''ADJUIN'', ''ADJUFN'', ''ADJUCP'', ' + coCRLF +   //Adjudicacion
                  ' ''VTCTCN'', ''VTCTIN'', ''VTCTFN'', ''VTCTCP'', ' + coCRLF +   //Adjudicacion
                  ' ''AFIADI'', ''PAINFA'' ';

constructor TCrResRee.Create( AOwner : TComponent );
begin Inherited;

      F_INICIO :=CreaCampo('F_INICIO',ftDate,tsNinguno,tsNinguno,False);
                F_INICIO.Caption:='Fecha inicio';

      FOL_GRUPO_RENUEVA :=CreaCampo('FOL_GRUPO_RENUEVA',ftInteger,tsNinguno,tsNinguno,False);
                FOL_GRUPO_RENUEVA.Caption:='FOL_GRUPO_RENUEVA';
      IMP_AUTORIZADO :=CreaCampo('IMP_AUTORIZADO',ftFloat,tsNinguno,tsNinguno,False);
                IMP_AUTORIZADO.Caption:='IMP_AUTORIZADO';
      IMP_INCREMENTO :=CreaCampo('IMP_INCREMENTO',ftFloat,tsNinguno,tsNinguno,False);
                IMP_INCREMENTO.Caption:='IMP_INCREMENTO';
      IMP_OPERACION :=CreaCampo('IMP_OPERACION',ftFloat,tsNinguno,tsNinguno,False);
                IMP_OPERACION.Caption:='IMP_OPERACION';
      // </ RABA >
      // 17 MAY 2011
      DISPONIBLE_AUT :=CreaCampo('DISPONIBLE_AUT',ftFloat,tsNinguno,tsNinguno,False);
                DISPONIBLE_AUT.Caption:='DISPONIBLE_AUT';
      IMP_NUEVADISP  := CreaCampo('IMP_NUEVADISP',ftFloat,tsNinguno,tsNinguno,False);
                IMP_AUTORIZADO.Caption:='IMP_NUEVADISP';
      // < RABA />

      // RABA FEB 2015 SE CREA BANDERA PARA REVISAR SI LOS CAMBIOS APLICAN A TODA LA LINEA DE CREDITO
      B_APL_TODA_LIN :=CreaCampo('B_APL_TODA_LIN',ftString,tsNinguno,tsNinguno,False);
                B_APL_TODA_LIN.Caption:='B_APL_TODA_LIN';
      // FIN RABA
      
      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:=Self;

      //RABA FEB 2015
      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;
      //FIN RABA

      // </ RABA >
      // 17 MAY 2011
      // Se crea ContratoDest para localizar el contrato destino a donde se va a reestructurar
      ContratoDest := TCrCto.Create(Self);
      ContratoDest.MasterSource:=Self;
      
      vgNuevaDisposicion := 0;
      // < RABA />

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrResRee.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrResRee.Destroy;
begin
   if Credito <> nil then
      Credito.Free;
   if ContratoCre <> nil then
      ContratoCre.Free;
   // </ RABA >
   // 17 MAY 2011
   if ContratoDest <> nil then
      ContratoDest.Free;
   // < RABA />

   inherited;
end;


function TCrResRee.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrResRee;
begin
   W:=TWCrResRee.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;
{------------------------------ Valida el 25% dell importe Pagado ------------------------------------------}
Function    TCrResRee.Valida25ImportePagado(PPIDCredito : Integer; PPFecha : TDateTime): String;
Var VLSQL, VLSalida   :  String;
    qyQuery           : TQuery;
    VLImpCredito      : Double;
    VLImpPagado       : Double;
    VL25PCT           : String;
Begin
     VLSalida := 'V';   // YA PAGO EL 25 DE CAPITAL ORIGINAL
     //HERJA REVISA PRIMERO SI EL PRODUCTO REQUIERE EL PAGO DEL 25% HERJA MARZO 2013
     VL25PCT:='F';
     VLSQL := ' SELECT NVL(CP.B_RE_25PCT,''F'') B_RE_25PCT ' + coCRLF +
              '    FROM CR_PRODUCTO CP, ' + coCRLF +
              '         CR_CONTRATO CC, ' + coCRLF +
              '             CR_CREDITO C ' + coCRLF +
              '  WHERE C.ID_CONTRATO = CC.ID_CONTRATO ' + coCRLF +
              '    AND C.FOL_CONTRATO = CC.FOL_CONTRATO ' + coCRLF +
              '    AND CC.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE ' + coCRLF +
              '    AND C.ID_CREDITO =  ' +  IntToStr(PPIDCredito);
     qyQuery:= GetSQLQuery(VLSQL, DataBaseName, SessionName, False);
     try
       If qyQuery <> Nil Then
       Begin
            VL25PCT :=  qyQuery.FieldByName('B_RE_25PCT').AsString;
       End;
     finally
       qyQuery.Free;
     end;
     // FIN HERJA MARZO 2013

     if (VL25PCT='V') then   //HERJA MARZO 2013
     begin

       VLSQL := ' SELECT CC.ID_CREDITO, CC.IMP_CREDITO,CK_PAG.IMP_PAGADO_HIST ' + coCRLF +
                '   FROM ' + coCRLF +
                '       (SELECT SUM(NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''CP'', ''IMPBRU'',CK.ID_CREDITO, CK.NUM_PERIODO, ' + coCRLF +
                '               NULL,' + SQLFecha(PPFecha) + ',''V'' ), 0 )) AS IMP_PAGADO_HIST, ID_CREDITO ' +  coCRLF +
                '          FROM CR_CAPITAL CK ' +  coCRLF +
                '         WHERE CK.ID_CREDITO = ' + IntToStr(PPIDCredito) + coCRLF +
                '           AND CK.SIT_CAPITAL <> ''CA'' ' + coCRLF +
                '      GROUP BY CK.ID_CREDITO) CK_PAG, ' +  coCRLF +
                '     (SELECT * FROM CR_CREDITO WHERE ID_CREDITO = ' + IntToStr(PPIDCredito) + ')  CC ' + coCRLF +
                '  WHERE CC.ID_CREDITO = CK_PAG.ID_CREDITO ';

       qyQuery:= GetSQLQuery(VLSQL, DataBaseName, SessionName, False);
       try
         If qyQuery <> Nil Then
         Begin
              VLImpCredito :=  StrToFloat(FormatFloat('#############0.00',(qyQuery.FieldByName('IMP_CREDITO').Asfloat * 0.25))) ;
              VLImpPagado  := StrToFloat(FormatFloat('#############0.00',qyQuery.FieldByName('IMP_PAGADO_HIST').Asfloat));
              if VLImpPagado < VLImpCredito then
                 VLSalida := 'F';
              //end if;
         End;
       finally
         qyQuery.Free;
       end;
     end;
     Valida25ImportePagado := VLSalida;
end;
{-------------------------------------- Valida Interes Pagado ----------------------------------------------}
Function    TCrResRee.ValidaInteresPagado(PPIDCredito : Integer; PPFecha : TDateTime): String;
Var VLSQL, VLSalida   :  String;
    qyQuery           : TQuery;
    VLImpVencido      : Double;
Begin
     VLSalida := 'V';   //TIENE TODOS LOS INTERESES PAGADOS

     VLSQL := '  SELECT SUM(NVL(CI.IMP_INTERES,0) - NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( ''IN'', ''IMPBRU'',CI.ID_CREDITO, CI.NUM_PERIODO, ' +  coCRLF +
              '         NULL,' + SQLFecha(PPFecha) + ',''V'' ), 0 )) AS IMP_VENCIDO_HIST, ID_CREDITO ' + coCRLF +
              '    FROM CR_INTERES CI ' + coCRLF +
              '   WHERE CI.ID_CREDITO = ' + IntToStr(PPIDCredito) + coCRLF +
              '     AND CI.SIT_INTERES <> ''CA'' ' + coCRLF +
              '  GROUP BY CI.ID_CREDITO ';

     qyQuery:= GetSQLQuery(VLSQL, DataBaseName, SessionName, False);
     try
       If qyQuery <> Nil Then
       Begin
            VLImpVencido := StrToFloat(FormatFloat('#############0.00',qyQuery.FieldByName('IMP_VENCIDO_HIST').Asfloat));
            if VLImpVencido > 0 then
               VLSalida := 'F';
            //end if;
       End;
     finally
       qyQuery.Free;
     end;
     ValidaInteresPagado := VLSalida;
End;
{-------------------------------------- Datos de Periodos de Interes ----------------------------------------------}
Procedure TCrResRee.Intereses(sCesion,sFechaIni:String);
var stpDigVer : TStoredProc;
    Qry       : Tquery;
begin
 VGInteres := 0;
 VGInteresIva := 0;
 VGInteresProy := 0;
 VGInteresIvaProy := 0;
 Qry := GetSQLQueryNoNil(' SELECT NUM_PERIODO, F_VENCIMIENTO FROM CR_INTERES ' +  coCRLF +
                         ' WHERE ID_CREDITO = '+ sCesion + coCRLF +
                         ' AND TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') BETWEEN  F_VENCIMIENTO - PLAZO AND F_VENCIMIENTO '
                         , Apli.DataBaseName,  Apli.SessionName, False );
 if Assigned(Qry) and not( Qry.IsEmpty ) then
 begin
    while not Qry.Eof do
    begin
       //INTERES AL DÍA
       stpDigVer := TStoredProc.Create(Nil);
       If Assigned(stpDigVer) Then
        With stpDigVer Do
         Try
         DatabaseName := Apli.DataBaseName;
         SessionName  := Apli.SessionName;
         StoredProcName := 'PKGCRCOMUN.STPINTERES';
         Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
         Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
         Params.CreateParam(ftDate,'PEFREFERENCIA',ptInput);
         Params.CreateParam(ftDate,'PEFCALCULO',ptInput);
         Params.CreateParam(ftString,'PEBFINDIA',ptInput);
         Params.CreateParam(ftString,'PEBSOLOFONDEO',ptInput);
         Params.CreateParam(ftFloat,'PSTASA',ptOutput);
         Params.CreateParam(ftFloat,'PSINTDIA',ptOutput);
         Params.CreateParam(ftFloat,'PSINTERES',ptOutput);
         Params.CreateParam(ftFloat,'PSINTPROY',ptOutput);
         Params.CreateParam(ftFloat,'PSIMPIVA',ptOutput);
         Params.CreateParam(ftFloat,'PSIVAPROY',ptOutput);
         Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
         Prepare;
         ParamByName('PEIDCREDITO').AsInteger := StrToInt(sCesion);
         ParamByName('PENUMPERIODO').AsFloat := Qry.FieldByName('NUM_PERIODO').AsFloat;
         ParamByName('PEFREFERENCIA').AsDateTime := Apli.DameFechaEmpresa;
         ParamByName('PEFCALCULO').AsDateTime :=  Apli.DameFechaEmpresa;
         ParamByName('PEBFINDIA').AsString := 'F';
         ParamByName('PEBSOLOFONDEO').AsString := 'F';
         ExecProc;
         VGInteres := VGInteres + ParamByName('PSINTERES').AsFloat;
         VGInteresIva := VGInteresIva + ParamByName('PSIMPIVA').AsFloat;
        Finally
         Close;
         Params.Clear;
         Free;
        End;
       //INTERES AL DÍA PAGADO
       stpDigVer := TStoredProc.Create(Nil);
       If Assigned(stpDigVer) Then
        With stpDigVer Do
         Try
         DatabaseName := Apli.DataBaseName;
         SessionName  := Apli.SessionName;
         StoredProcName := 'PKGCRCOMUN.STPOBTENIMPPAGADO';
         Params.CreateParam(ftString,'PECVEACCESORIO',ptInput);
         Params.CreateParam(ftString,'PECVECONCEPTO',ptInput);
         Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
         Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
         Params.CreateParam(ftString,'PECVECOMISION',ptInput);
         Params.CreateParam(ftDate,'PEFCALCULO',ptInput);
         Params.CreateParam(ftString,'PEBFINDIA',ptInput);
         Params.CreateParam(ftFloat,'PSIMPPAGADO',ptOutput);
         Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
         Prepare;
         ParamByName('PECVEACCESORIO').AsString := 'IN';
         ParamByName('PECVECONCEPTO').AsString := 'IMPBRU';
         ParamByName('PEIDCREDITO').AsInteger := StrToInt(sCesion);
         ParamByName('PENUMPERIODO').AsFloat := Qry.FieldByName('NUM_PERIODO').AsFloat;
         ParamByName('PEFCALCULO').AsDateTime := Apli.DameFechaEmpresa;
         ParamByName('PEBFINDIA').AsString := 'V';
         ExecProc;
         VGInteres := VGInteres - ParamByName('PSIMPPAGADO').AsFloat;
        Finally
         Close;
         Params.Clear;
         Free;
        End;
       //IVA INTERES AL DÍA PAGADO
       stpDigVer := TStoredProc.Create(Nil);
       If Assigned(stpDigVer) Then
        With stpDigVer Do
         Try
         DatabaseName := Apli.DataBaseName;
         SessionName  := Apli.SessionName;
         StoredProcName := 'PKGCRCOMUN.STPOBTENIMPPAGADO';
         Params.CreateParam(ftString,'PECVEACCESORIO',ptInput);
         Params.CreateParam(ftString,'PECVECONCEPTO',ptInput);
         Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
         Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
         Params.CreateParam(ftString,'PECVECOMISION',ptInput);
         Params.CreateParam(ftDate,'PEFCALCULO',ptInput);
         Params.CreateParam(ftString,'PEBFINDIA',ptInput);
         Params.CreateParam(ftFloat,'PSIMPPAGADO',ptOutput);
         Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
         Prepare;
         ParamByName('PECVEACCESORIO').AsString := 'IN';
         ParamByName('PECVECONCEPTO').AsString := 'IMPIVA';
         ParamByName('PEIDCREDITO').AsInteger := StrToInt(sCesion);
         ParamByName('PENUMPERIODO').AsFloat := Qry.FieldByName('NUM_PERIODO').AsFloat;
         ParamByName('PEFCALCULO').AsDateTime := Apli.DameFechaEmpresa;
         ParamByName('PEBFINDIA').AsString := 'V';
         ExecProc;
         VGInteresIva := VGInteresIva - ParamByName('PSIMPPAGADO').AsFloat;
        Finally
         Close;
         Params.Clear;
         Free;
        End;

        begin
           //INTERES PROYECTADO
           stpDigVer := TStoredProc.Create(Nil);
           If Assigned(stpDigVer) Then
            With stpDigVer Do
             Try
             DatabaseName := Apli.DataBaseName;
             SessionName  := Apli.SessionName;
             StoredProcName := 'PKGCRCOMUN.STPINTERES';
             Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
             Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
             Params.CreateParam(ftDate,'PEFREFERENCIA',ptInput);
             Params.CreateParam(ftDate,'PEFCALCULO',ptInput);
             Params.CreateParam(ftString,'PEBFINDIA',ptInput);
             Params.CreateParam(ftString,'PEBSOLOFONDEO',ptInput);
             Params.CreateParam(ftFloat,'PSTASA',ptOutput);
             Params.CreateParam(ftFloat,'PSINTDIA',ptOutput);
             Params.CreateParam(ftFloat,'PSINTERES',ptOutput);
             Params.CreateParam(ftFloat,'PSINTPROY',ptOutput);
             Params.CreateParam(ftFloat,'PSIMPIVA',ptOutput);
             Params.CreateParam(ftFloat,'PSIVAPROY',ptOutput);
             Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
             Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
             Prepare;
             ParamByName('PEIDCREDITO').AsInteger := StrToInt(sCesion);
             ParamByName('PENUMPERIODO').AsFloat := Qry.FieldByName('NUM_PERIODO').AsFloat;
             ParamByName('PEFREFERENCIA').AsDateTime := Apli.DameFechaEmpresa;
             ParamByName('PEFCALCULO').AsDateTime :=  StrToDateTime(sFechaIni);
             ParamByName('PEBFINDIA').AsString := 'F';
             ParamByName('PEBSOLOFONDEO').AsString := 'F';
             ExecProc;
             VGInteresProy := VGInteresProy + ParamByName('PSINTERES').AsFloat;
             VGInteresIvaProy := VGInteresIvaProy + ParamByName('PSIMPIVA').AsFloat;
            Finally
             Close;
             Params.Clear;
             Free;
            End;
             //INTERES AL PROYECTADO PAGADO
             stpDigVer := TStoredProc.Create(Nil);
             If Assigned(stpDigVer) Then
              With stpDigVer Do
               Try
               DatabaseName := Apli.DataBaseName;
               SessionName  := Apli.SessionName;
               StoredProcName := 'PKGCRCOMUN.STPOBTENIMPPAGADO';
               Params.CreateParam(ftString,'PECVEACCESORIO',ptInput);
               Params.CreateParam(ftString,'PECVECONCEPTO',ptInput);
               Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
               Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
               Params.CreateParam(ftString,'PECVECOMISION',ptInput);
               Params.CreateParam(ftDate,'PEFCALCULO',ptInput);
               Params.CreateParam(ftString,'PEBFINDIA',ptInput);
               Params.CreateParam(ftFloat,'PSIMPPAGADO',ptOutput);
               Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
               Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
               Prepare;
               ParamByName('PECVEACCESORIO').AsString := 'IN';
               ParamByName('PECVECONCEPTO').AsString := 'IMPBRU';
               ParamByName('PEIDCREDITO').AsInteger := StrToInt(sCesion);
               ParamByName('PENUMPERIODO').AsFloat := Qry.FieldByName('NUM_PERIODO').AsFloat;
               ParamByName('PEFCALCULO').AsDateTime := StrToDateTime(sFechaIni);
               ParamByName('PEBFINDIA').AsString := 'V';
               ExecProc;
               VGInteresProy := VGInteresProy - ParamByName('PSIMPPAGADO').AsFloat;
              Finally
               Close;
               Params.Clear;
               Free;
              End;
             //IVA INTERES AL DÍA PROYECTADO
             stpDigVer := TStoredProc.Create(Nil);
             If Assigned(stpDigVer) Then
              With stpDigVer Do
               Try
               DatabaseName := Apli.DataBaseName;
               SessionName  := Apli.SessionName;
               StoredProcName := 'PKGCRCOMUN.STPOBTENIMPPAGADO';
               Params.CreateParam(ftString,'PECVEACCESORIO',ptInput);
               Params.CreateParam(ftString,'PECVECONCEPTO',ptInput);
               Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
               Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
               Params.CreateParam(ftString,'PECVECOMISION',ptInput);
               Params.CreateParam(ftDate,'PEFCALCULO',ptInput);
               Params.CreateParam(ftString,'PEBFINDIA',ptInput);
               Params.CreateParam(ftFloat,'PSIMPPAGADO',ptOutput);
               Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
               Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
               Prepare;
               ParamByName('PECVEACCESORIO').AsString := 'IN';
               ParamByName('PECVECONCEPTO').AsString := 'IMPIVA';
               ParamByName('PEIDCREDITO').AsInteger := StrToInt(sCesion);
               ParamByName('PENUMPERIODO').AsFloat := Qry.FieldByName('NUM_PERIODO').AsFloat;
               ParamByName('PEFCALCULO').AsDateTime := StrToDateTime(sFechaIni);
               ParamByName('PEBFINDIA').AsString := 'V';
               ExecProc;
               VGInteresIvaProy := VGInteresIvaProy - ParamByName('PSIMPPAGADO').AsFloat;
              Finally
               Close;
               Params.Clear;
               Free;
              End;
        end;
        Qry.Next;
    end;//ends_if
 end;
 if Assigned(Qry) then
 begin
      Qry.Close;        Qry.Free;
 end;
End;

procedure TCrResRee.ObtenAdeudos(IdCredito: Integer;
                                 vlfecha  : string;
                                 var psImpAdeudo, psImpInteres, psImpAdeudoVdo, psImpInteresVdo, psImpPrepagoCP : Double);
var
  STPAdeudoCredito : TStoredProc;
begin
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
           psImpAdeudo  := ParamByName('psAdeudo').AsFloat;
           psImpInteres := ParamByName('psInteres').AsFloat;
           psImpAdeudoVdo  := ParamByName('psAdeudoVdo').AsFloat;
           psImpInteresVdo := ParamByName('psInteresVdo').AsFloat;
           psImpPrepagoCP  := ParamByName('psPrePAgosCapital').AsFloat;
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
end;

Procedure   TCrResRee.LlenaEncabezado(sCesion,sFechaIni:String;var PPSaldoVenc : Double; var PPSaldoTotal : Double; var PPImpIntVig : Double);
Var
    sSQL1       : String;
    sSQL2       : String;
    sSQL21      : String;
    sSQL211     : String;
    sSQL22      : String;
    sSQL3       : String;
    Q           : TQuery;
    VLTotalVig  : Double;
    VLTotalVen  : Double;
    VLIntIVAPro : Double;
    VLComIVAPro : Double;
    VLTotPro    : Double;

    vlImpInteres    : Double;
    vlImpAdeudo     : Double;
    vlImpInteresVdo : Double;
    vlImpAdeudoVdo  : Double;
    vlImpVencido    : Double;
    vlImpPrepagoCP  : Double;
Begin
    ObtenAdeudos(StrToInt(sCesion), sFechaIni, vlImpAdeudo, vlImpInteres, vlImpAdeudoVdo, vlImpInteresVdo, vlImpPrepagoCP);

    PPImpIntVig := vlImpInteres;
    PPSaldoVenc := vlImpAdeudoVdo + vlImpInteresVdo + vlImpPrepagoCP;
    PPSaldoTotal := vlImpAdeudo + vlImpInteres + vlImpAdeudoVdo + vlImpInteresVdo + vlImpPrepagoCP;
End;

function TCrResRee.getCurrentDate: TDate;
begin
  Result := fCurrentDate;
end;

function TCrResRee.getCurrentValue: Double;
begin
  Result := fCurrentValue;
end;

procedure TCrResRee.setCurrentDate(Sender: TInterCampo);
begin
  fCurrentDate := Sender.AsDateTime;
end;

procedure TCrResRee.setCurrentValue(Sender: TInterCampo);
begin
  fCurrentValue := Sender.AsFloat;
end;
// Construye la cadena
function TCrResRee.BuildSQLStr( BInicio : Boolean ): String;
var vlBuscaCred  : String;
    vlBuscaCon   : String;
    vlBuscaInt   : String;
    vlBuscaFin   : String;
    vlBuscaCap   : String;
    vlsql        : String;
Begin
  IF not( Credito.Active ) THEN
    exit;
  //
  vlBuscaCred:= 'AND CR.ID_CREDITO = ' + Credito.ID_CREDITO.AsString;
  vlBuscaCon := ' WHERE CO.ID_CREDITO   = '   + Credito.ID_CREDITO.AsString +
                '   AND CO.SIT_COMISION   NOT IN ( ''CA'', ''LQ'' ) ';
  vlBuscaInt := ' WHERE I.ID_CREDITO    = '   + Credito.ID_CREDITO.AsString +
                '   AND I.SIT_INTERES     NOT IN ( ''CA'', ''LQ'' ) ' + 
                '   AND ( ( I.IMP_INTERES + I.IMP_IVA ) - ( I.IMP_PAGADO  + I.IMP_IVA_PAGADO ) <> 0 )';
  vlBuscaFin := ' WHERE FN.ID_CREDITO   = '   + Credito.ID_CREDITO.AsString +
                '   AND FN.SIT_FINAN_ADIC NOT IN ( ''CA'', ''LQ'' ) ';
  vlBuscaCap := ' WHERE C.ID_CREDITO    = '   + Credito.ID_CREDITO.AsString +
                '   AND C.SIT_CAPITAL     NOT IN ( ''CA'', ''LQ'' ) ';
  //
  if BInicio then
  begin
      // Arma la sentencia SQL.
      vlsql :=' SELECT CR.ID_CREDITO, '      +
              '        PERIODO.IMP_CAPITAL,  '    +
              '        PERIODO.IMP_FIN_ADIC,  '   +
              '        PERIODO.IMP_INTERES,  '    +
              '        PERIODO.IMP_COMISION, '    +
              '        PERIODO.IMP_COMISION + PERIODO.IMP_INTERES + '        +
              '        PERIODO.IMP_FIN_ADIC + PERIODO.IMP_CAPITAL TOTAL, '   +
              '        PERIODO.IMP_MOR_CP,  '     +
              '        PERIODO.IMP_MOR_FN,  '     +
              '        PERIODO.IMP_MOR_IN,  '     +
              '        PERIODO.IMP_MOR_CN,  '     +
              '        PKGCRCOBRANZA.STPOBTBGARFEGA( CR.ID_CREDITO ) GAR_FEGA  '  + 
              ' FROM  CR_CREDITO CR, '            +
              '       ( '                         +
              '        SELECT ID_CREDITO,'        +
              '               SUM(IMP_CAPITAL)  IMP_CAPITAL,'   +
              '               SUM(IMP_FIN_ADIC) IMP_FIN_ADIC, ' +
              '               SUM(IMP_INTERES)  IMP_INTERES,'   +
              '               SUM(IMP_COMISION) IMP_COMISION,'  +
              '               SUM(IMP_MOR_CP) IMP_MOR_CP,'      +
              '               SUM(IMP_MOR_FN) IMP_MOR_FN,'      +
              '               SUM(IMP_MOR_IN) IMP_MOR_IN,'      +
              '               SUM(IMP_MOR_CN) IMP_MOR_CN'       +
              '        FROM   ( ' +
              '                 SELECT ID_CREDITO,  C.F_PROG_PAGO, C.NUM_PERIODO, '    +
              '                        C.F_VENCIMIENTO, '                              +
              '                        PKGCRPERIODO.ObtenImpCob( C.ID_CREDITO,    '    +
              '                          C.NUM_PERIODO, NULL, ''CP'') IMP_CAPITAL,'    +
              '                        0 IMP_FIN_ADIC, 0 IMP_INTERES, 0 IMP_COMISION,' +
              '                        IMP_MORATORIO - ( IMP_PAGADO_MORA + IMP_COND_MORA ) IMP_MOR_CP, ' +
              '                        0 IMP_MOR_FN,  0 IMP_MOR_IN, 0 IMP_MOR_CN   ' +
              '                 FROM   CR_CAPITAL C   '   +
                                vlBuscaCap +
              '                 UNION '    +
              '                 SELECT FN.ID_CREDITO,  FN.F_PROG_PAGO, FN.NUM_PERIODO, ' +
              '                        FN.F_VENCIMIENTO, '                               +
              '                        0 IMP_CAPITAL, '                                  +
              '                        PKGCRPERIODO.ObtenImpCob( FN.ID_CREDITO, '        +
              '                        FN.NUM_PERIODO, NULL, ''FN'' ) IMP_FIN_ADIC, '    +
              '                        0 IMP_INTERES,  0 IMP_COMISION, 0 IMP_MOR_CP,  '  +
              '                        IMP_MORATORIO - ( IMP_PAGADO_MORA + IMP_COND_MORA ) IMP_MOR_FN, ' +
              '                        0 IMP_MOR_IN, 0 IMP_MOR_CN   '   +
              '                 FROM   CR_FINAN_ADIC FN ' +
                                vlBuscaFin                + 
              '                 UNION '                   +
              '                 SELECT I.ID_CREDITO,  I.F_PROG_PAGO, I.NUM_PERIODO,' +
              '                        I.F_VENCIMIENTO, '                            +
              '                        0 IMP_CAPITAL, 0 IMP_FIN_ADIC, '              +
              '                        PKGCRPERIODO.ObtenImpCob( I.ID_CREDITO,  '    +
              '                          I.NUM_PERIODO, NULL, ''IN'' ) IMP_INTERES,' +
              '                        0 IMP_COMISION, 0 IMP_MOR_CP,  0 IMP_MOR_FN,' +
              '                        IMP_MORATORIO - ( IMP_PAGADO_MORA + IMP_COND_MORA ) IMP_MOR_IN, ' +
              '                        0 IMP_MOR_CN   ' +
              '                 FROM   CR_INTERES I   ' +
                                vlBuscaInt              +
              '                 UNION '                 +
              '                 SELECT CO.ID_CREDITO, CO.F_PROG_PAGO, CO.NUM_PERIODO, ' +
              '                        CO.F_VENCIMIENTO, '                              +
              '                        0 IMP_CAPITAL,  0 IMP_FIN_ADIC, 0 IMP_INTERES, ' +
              '                        SUM( PKGCRPERIODO.ObtenImpCob( CO.ID_CREDITO, CO.NUM_PERIODO, CO.CVE_COMISION, ''CN'' ) ) IMP_COMISION, ' +
              '                        0 IMP_MOR_CP, 0 IMP_MOR_FN,  '   +
              '                        0 IMP_MOR_IN, ' +
              '                        SUM( IMP_MORATORIO - ( IMP_PAGADO_MORA + IMP_COND_MORA ) ) IMP_MOR_CN   '   +
              '                 FROM   CR_COMISION CO ' +
                                vlBuscaCon              +
              '                 GROUP  BY CO.ID_CREDITO, CO.F_PROG_PAGO, CO.F_VENCIMIENTO, CO.NUM_PERIODO ' +
              '               ) CRE '                                              +

              '        GROUP BY ID_CREDITO '                                       +
              '       ) PERIODO  '                                                 +
              ' WHERE CR.ID_CREDITO     = PERIODO.ID_CREDITO '                     + 
              ' ORDER BY CR.ID_CREDITO '
              ;
  end else begin
      // Arma la sentencia SQL.
      vlsql :=' SELECT PERIODO.* '    +
              ' FROM '                         +
              '       ( '                      +
              '        SELECT ID_CREDITO,   '  +
              '               NUM_PERIODO,  '  +
              '               CVE_COMISION, '  +
              '               CVE_ACCESORIO '  +

              '        FROM   ( ' +
              '                 SELECT C.ID_CREDITO, C.NUM_PERIODO,   NULL CVE_COMISION, ' +
              '                        ''CP'' CVE_ACCESORIO ' +
              '                 FROM   CR_CAPITAL C   '       +
                                vlBuscaCap +
              '                 UNION '    +
              '                 SELECT FN.ID_CREDITO, FN.NUM_PERIODO, NULL CVE_COMISION, ' +
              '                        ''FN'' CVE_ACCESORIO ' +
              '                 FROM   CR_FINAN_ADIC FN ' +
                                vlBuscaFin                +
              '                 UNION '                   +
              '                 SELECT I.ID_CREDITO,  I.NUM_PERIODO,  NULL CVE_COMISION, ' +
              '                        ''IN'' CVE_ACCESORIO ' +
              '                 FROM   CR_INTERES I   ' +
                                vlBuscaInt              +
              '                 UNION '                 +
              '                 SELECT CO.ID_CREDITO, CO.NUM_PERIODO, CO.CVE_COMISION, ' +
              '                        ''CN'' CVE_ACCESORIO ' +
              '                 FROM   CR_COMISION CO ' +
                                vlBuscaCon              + 
              '               ) CRE '                                              +
              '       ) PERIODO  '
              ;
  end;
  //
  Result := vlsql;
end;

{-------------------- OBTIENE  EL ADEUDO DEL CREDITO DE ACUERDO A LA FECHA VALOR -----------------------------}
procedure TCrResRee.stpObtAdeudo(peIdCredito, peNumPeriodo: Integer;
  peCveComision: String; pFCalculo: TDate; pFactor: Double; pBIVA,
  pCveAccesorio: String; var vlTotal, vlImporte, vlIVA, vlBenBco, vlBenGob,
  vlMoras, vlIVAMoras: Double; var vlError: String);
var  STPObtAdeudo : TStoredProc;
Begin
  vlError := '';
  STPObtAdeudo := TStoredProc.Create(Nil);
  try
    with STPObtAdeudo do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:='PKGCRPERIODO.STPINTOBTADEUDO';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam( ftInteger, 'peIdCredito',    ptInput  );
      Params.CreateParam( ftInteger, 'peNumPeriodo',   ptInput  );
      Params.CreateParam( ftString,  'peCveComision',  ptInput  );
      Params.CreateParam( ftDate,    'peFReferencia',  ptInput  );
      Params.CreateParam( ftDate,    'peFCalculo',     ptInput  );
      Params.CreateParam( ftFloat,   'peFactor',       ptInput  );
      Params.CreateParam( ftString,  'peBIVA',         ptInput  );
      Params.CreateParam( ftString,  'peCveAccesorio', ptInput  );
      Params.CreateParam( ftString,  'peBCobranza',    ptInput  );
      Params.CreateParam( ftFloat,   'psImporte',      ptOutput );
      Params.CreateParam( ftFloat,   'psIVA',          ptOutput );
      Params.CreateParam( ftFloat,   'psBenBco',       ptOutput );
      Params.CreateParam( ftFloat,   'psBenGob',       ptOutput );
      Params.CreateParam( ftFloat,   'psMoras',        ptOutput );
      Params.CreateParam( ftFloat,   'psIVAMoras',     ptOutput );
      Params.CreateParam( ftFloat,   'psTotal',        ptOutput );
      Params.CreateParam( ftFloat,   'psTasa',         ptOutput );
      //
      Params.CreateParam( ftFloat,   'psResultado',   ptOutput);
      Params.CreateParam( ftString,  'psTxResultado', ptOutput);
      //
      ParamByName('peIdCredito').AsInteger  := peIdCredito;
      ParamByName('peNumPeriodo').AsInteger := peNumPeriodo;
      ParamByName('peCveComision').AsString := peCveComision;
      ParamByName('peFReferencia').AsDateTime := Apli.DameFechaEmpresa;
      ParamByName('peFCalculo').AsDate        := pFCalculo;
      ParamByName('peFactor').AsFloat         := pFactor;
      ParamByName('peBIVA').AsString          := pBIVA;
      ParamByName('peCveAccesorio').AsString  := pCveAccesorio;
      ParamByName('peBCobranza').AsString     := 'V';
      ExecProc;

      if (ParamByName('PSResultado').AsInteger = 0) then
      begin
        vlImporte := ParamByName('psImporte').AsFloat;
        vlIVA     := ParamByName('psIVA').AsFloat;
        vlBenBco  := ParamByName('psBenBco').AsFloat;
        vlBenGob  := ParamByName('psBenGob').AsFloat;
        vlMoras   := ParamByName('psMoras').AsFloat;
        vlIVAMoras:= ParamByName('psIVAMoras').AsFloat;
        vlTotal   := ParamByName('psTotal').AsFloat;
      end
      else
      begin
        vlError := 'Problemas al obtener el adeudo: ' +
                   'Código : ' + ParamByName('psRESULTADO').AsString +
                   'Mensaje: ' + ParamByName('psTxResultado').AsString;
      end;
    end;
  finally
    STPObtAdeudo.Free;
  end;
end;

procedure TCrResRee.AsignaTipoFiltro(Sender: TRadioGroup);
begin
   Sender.OnClick(Sender);
end;

(***********************************************FORMA CrResRee********************)
(*                                                                              *)
(*  FORMA DE CrResRee                                                            *)
(*                                                                              *)
(***********************************************FORMA CrResRee********************)

Function TWCrResRee.DameCreditoBase : Integer;
var MAX      : Integer;
    VLSalida : Integer;
begin
     VLSalida := 0;
     MAX := SGCRenRee.SG.RowCount;
     try
        if ((MAX = 3) and (Length(SGCRenRee.CellStr['ID_CREDITO',2]) > 0)) then
            VLSalida := StrToInt(SGCRenRee.CellStr['ID_CREDITO',2]);
        //end if;
     except
        VLSalida := 0;
     end ;
     DameCreditoBase := VLSalida;
end;

Procedure TWCrResRee.Agregar;
Var  VLAgrega   : Boolean;
     VLRestruc: String ;
begin
   Objeto.F_INICIO.GetFromControl;
   IF Objeto.Credito.Active THEN BEGIN
      VLAgrega := True;

      //RABA A PARTIR DE ENE 2015 POR ACTUALIZACIÓN DE B-6
      //LA RENOVACIÓN SI PUEDE SER DE MAS DE UNA DISPOSICIÓN
      // POR LO QUE SE SEPARAN LOS EVENTOS DE RENOVACIÓN Y EVENTO DE ACELERACIÓN

      //RENOVACIÓN Y EVENTO DE ACELERACION
      //if ( rgTipoOper.ItemIndex = 0 ) OR (rgTipoOper.ItemIndex = 3) then begin
      if ( rgTipoOper.ItemIndex = 0 ) then begin
         //YA PAGO MAS DEL 25 % DE CAPITAL ORIGINAL
         IF Objeto.Valida25ImportePagado(Objeto.Credito.ID_CREDITO.AsInteger,Objeto.Apli.DameFechaEmpresa) = 'F' THEN BEGIN
            VLAgrega := MessageDlg('El crédito no tiene pagado el 25% de Capital Original.  ¿Desea continuar?',   mtConfirmation, [mbYes, mbNo], 0) = mrYes;
         END;
         //YA PAGO TODO EL INTERES
         IF VLAgrega THEN BEGIN
            if Objeto.ValidaInteresPagado(Objeto.Credito.ID_CREDITO.AsInteger,Objeto.Apli.DameFechaEmpresa) = 'F' then begin
               VLAgrega:= MessageDlg('El crédito no tiene pagado sus intereses.  ¿Desea continuar?',   mtConfirmation, [mbYes, mbNo], 0) = mrYes;
            end;
         END;
      end;
      //EVENTO DE ACELERACION
      if (rgTipoOper.ItemIndex = 3) then begin
         //VALIDA NUMERO DE RENOVACIONES
         if ValidaDispRenov <> 'V' then begin
            VLAgrega := False;
            ShowMessage('Para Evento de Aceleración solo se puede seleccionar una Disposición a la vez');
         end;
      end;

      //VALIDACIONES DE CONVENIO MODIFICATORIO
      if ( rgTipoOper.ItemIndex = 2 )then begin
        //VALIDA ACREDITADO
        IF ( Objeto.VLACREDITADO <> '' )  THEN BEGIN
           if Objeto.VLACREDITADO <> Objeto.Credito.ContratoCre.Contrato.ID_Titular.AsString then begin
              VLAgrega := False;
              ShowMessage('Solo se permite adicionar disposiciones del mismo Acreditado');
           end;
        END;
        //VALIDA MONEDA
        IF ( Objeto.VLMONEDA <> '' )  THEN BEGIN
           if Objeto.VLMONEDA <> Objeto.Credito.ContratoCre.CVE_MONEDA.AsString then begin
              VLAgrega := False;
              ShowMessage('Solo se permite adicionar disposiciones de la misma moneda');
           end;
        END;
      end;

      //|------------------------------------------|
      //|  VALIDACIONES DE REESTRUCTURACION        |
      //|------------------------------------------|


      //|------------------------------------------|
      //|  VALIDACIONES DE LIQUIDACION-COLOCACION  |
      //|------------------------------------------|
      // </ ASTECI:AARJ >
      // 3 FEB 10 SOLO COMENTARIOS
      // Para el caso de Liquidación-Colocación también se llegará a esta linea,
      // puesto que solo estan condicionadas: 0, 2 y 3. En caso de requerise se
      // condicionará 4. Se notó que la opción 1: Reestructuración no se encuentra
      // condicionada
      // < ASTECI:AARJ />

      //AGREGA REGISTRO
      if VLAgrega then begin
         AgregaEliminaCredito(Objeto.Credito.ID_CREDITO.AsInteger,'A');
// < /RABA > 18 JUL 2011
// SE CAMBIAN LAS DESHABILITACIONES PARA QUE SEA DESPUES DE AGREGAR EFECTIVAMENTE EL REGISTRO
         rgTipoOper.Enabled := False;
         iedID_CONTRATO_DEST.Enabled := False; // RABA 24 MAY 2011
         btCONTRATO_DEST.Enabled := False;  //RABA FEB 2015
         edF_INICIO.Enabled := False; // RABA 24 MAY 2011
         dtpF_INICIO.Enabled := False; // RABA 24 MAY 2011
         if rgTipoOper.ItemIndex = 0 then
            rgTipoAcreditados.Enabled := False;  //RABA FEB 2015 PARA CONTROL DE ACREDITADOS MISMO RIESGO COMUN
         lbParametrosIniciales.Visible := True;
// < RABA />
      end;
   END
   ELSE
      ShowMessage('Debe seleccionar una disposición');
   //END IF
end;
{----------------       ADEUDO POR DISPOSICION  ----------------------}
procedure TWCrResRee.AdeudoDisp;
var Qry       : TQuery;
    vlFacMora : Double;
    vlTotal,
    vlImpDmy,
    vlImpBru,
    vlImpMor,
    vlIVAMor  : Double;
    vlStrErr  : String;
begin
  Objeto.IMP_AUTORIZADO.AsFloat := 0;
  Objeto.IMP_OPERACION.AsFloat := 0;
  VLADEUDO_DISP := 0;
  // SECCION DE IMPORTES
  Qry := GetSQLQueryNoNil( Objeto.BuildSQLStr(False), Objeto.Apli.DataBaseName,
                           Objeto.Apli.SessionName,  False );
  if Assigned(Qry) and not( Qry.IsEmpty ) then
  begin
    Qry.First;
    while not Qry.Eof do
    begin
      with Objeto do
      begin
        vlStrErr  := '';
        vlFacMora := Credito.FACT_MORAS.AsFloat;
        //
        stpObtAdeudo( Qry.FieldByName('ID_CREDITO').AsInteger,
                      Qry.FieldByName('NUM_PERIODO').AsInteger,
                      Qry.FieldByName('CVE_COMISION').AsString,
                      F_INICIO.AsDateTime,
                      vlFacMora,
                      Credito.B_APLICA_IVA.AsString,
                      Qry.FieldByName('CVE_ACCESORIO').AsString,
                      vlTotal,
                      vlImpBru,
                      vlImpDmy,
                      vlImpDmy,
                      vlImpDmy,
                      vlImpMor,
                      vlIVAMor,
                      vlStrErr
                    );
        //
        if vlStrErr <> '' then begin
          EXECUTE_MUESTRAMENSAJE( vlStrErr );
          Break;
        end else begin
           IF Qry.FieldByName('CVE_ACCESORIO').AsString = 'CP' THEN  BEGIN
              VLADEUDO_DISP := VLADEUDO_DISP + vlImpBru;
              if rgTipoOper.ItemIndex = 2 then Begin
                 Objeto.IMP_AUTORIZADO.AsFloat := vlImpBru + Objeto.IMP_AUTORIZADO.AsFloat;
              end
              else Begin
                 Objeto.IMP_OPERACION.AsFloat := vlImpBru  + Objeto.IMP_OPERACION.AsFloat;
              end;
           END;
        end;//ends_if_vlStrErr_<>_''_then
        //
      end;//ends_with_Qry,_Objeto_do
      Qry.Next;
    end;
  end;
  //
end;

Procedure TWCrResRee.AgregaEliminaCredito(PPIDCredito : Integer; PPAccion : String);
var VLSQLStr, Cad1, Cad2  : String;
    VLLista               : String;
    Q                     : TQuery;
    MAX, VLCont           : Integer;
    VLBContinua           : Boolean;
    vlBGenVigVen          : String;   // RABA ABR 2013 PARA REVISAR SI SE GENERA EN VIGENTE O VENCIDO
begin
     VLBContinua := True;
     VLLista := '-0,';
     MAX := SGCRenRee.SG.RowCount;


     if ((PPAccion = 'A') or (PPAccion = 'R')) then  // FJR 10.09.2012 'R' SOLO REFRESCA EL QUERY
     begin
         for VLCont := 2 to MAX do
         begin
              if SGCRenRee.CellStr['ID_CREDITO',VLCont] = IntToStr(PPIDCredito) then
              begin
                 If PPAccion = 'R' then  // FJR 10.09.2012 'R' SOLO REFRESCA EL QUERY
                    VLBContinua := True  // FJR 10.09.2012 'R' SOLO REFRESCA EL QUERY
                 else begin              // FJR 10.09.2012 'R' SOLO REFRESCA EL QUERY
                    ShowMessage('La Disposición: ' + IntToStr(PPIDCredito) + ' ya está seleccionado.');
                    VLBContinua := False;
                 end ;              // FJR 10.09.2012 'R' SOLO REFRESCA EL QUERY
              end;
              if Length(SGCRenRee.CellStr['ID_CREDITO',VLCont]) > 0 then
                 VLLista := VLLista + SGCRenRee.CellStr['ID_CREDITO',VLCont] + ',';
              //end id
         end;
         VLLista := VLLista + IntToStr(PPIDCredito);
     end;

     if PPAccion = 'E' then
     begin
         for VLCont := 2 to MAX - 1 do
         begin
              if SGCRenRee.CellStr['ID_CREDITO',VLCont] <> IntToStr(PPIDCredito) then
              begin
                   if VLCont > 2 then
                       VLLista := VLLista + '-0,';
                   //end if;
                   VLLista := VLLista + SGCRenRee.CellStr['ID_CREDITO',VLCont];
              end;
         end;

         if VLLista = '-0,' then VLLista := '' ;

         if Length(VLLista) = 0 then
         begin
            EliminaTodo;
            VLBContinua := False;
         end;
     end;

     if VLBContinua then
     begin
         // </ RABA > 24 MAY 2011
         // Solo se grabará el importe de incremento para el primer registro
         // los siguientes ya no hay importe de incremento
         if MAX = 1  then
         begin
           Objeto.IMP_INCREMENTO.GetFromControl;
           edIMP_INCREMENTO.Enabled := False;
           edIMP_INCREMENTO.Visible := False;
           lbINCREMENTO.Caption  := FormatFloat('####,####,####,###,##0.00',Objeto.IMP_INCREMENTO.AsFloat);
           lbINCREMENTO.Visible := True;
           lbTotalIncremento.Caption := lbINCREMENTO.Caption;
         end
         else
               Objeto.IMP_INCREMENTO.AsFloat := 0; // FJR LINEA ORIGINAL

         Cad1 := ' SELECT ' +           coCRLF+
                 ' CRC.ID_CONTRATO, ' + coCRLF+
                 ' CRC.ID_CREDITO, '  + coCRLF+
                 ' CRC.IMP_DISPUESTO, DUAL.SDO_INSOLUTO, DUAL.SDO_VIG_TOTAL, CRC.F_INICIO, CRC.F_VENCIMIENTO, CRC.F_TRASPASO_VENC ' + coCRLF+
                 ', NVL(DUAL.CVE_OBSERVACION, CRC.CVE_OBSERVACION) AS CVE_OBSERVACION ' + coCRLF+
                 ', (CASE WHEN PKGCRTRASCARTERA.FUNISVENCIDO(CRC.ID_CREDITO, TO_DATE('''+edF_INICIO.Text+''',''DD/MM/YYYY''), '''+ Objeto.B_APL_TODA_LIN.AsString +''', NULL) = ''V'' THEN ''VENCIDO'' ' + coCRLF+
                 '        WHEN PKGCRTRASCARTERA.FUNISVENCIDO(CRC.ID_CREDITO, TO_DATE('''+edF_INICIO.Text+''',''DD/MM/YYYY''), '''+ Objeto.B_APL_TODA_LIN.AsString +''', NULL) = ''F'' THEN ''VIGENTE'' ' + coCRLF+
                 '        ELSE ''ERROR'' END) ISVENCIDO, ' + coCRLF+  // RABA ABR 2013
                 ' DUAL.AGRUPAR '; //RABA ENE 2015
         Cad2:=  ' FROM ' +GeneraPC(1)+ ' '+ coCRLF+
                 ' (SELECT * FROM CR_CREDITO WHERE ID_CREDITO IN ( ' + VLLista + '))  CRC '+ coCRLF +GeneraPC(2)
                 + ' ORDER BY DUAL.AGRUPAR ';

         VLSQLStr:= Cad1 + Cad2 ;    // FJR 02.08.2012 CONCATENACION DE CAMPOS "CALCULADOS"

         Q :=  GetSQLQuery(VLSQLStr,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
         try
             if Q <> nil then
             begin
                 //COLUMNAS OCULTAS
                 Q.SQL.SaveToFile('C:\QRESREE.SQL') ;
                 //ASIGNACION DE ETIQUETAS
                 Q.FieldByName('ID_CONTRATO').DisplayLabel := 'Contrato' + #30 +'>C';  // RABA 24 MAY 2011
                 Q.FieldByName('ID_CREDITO').DisplayLabel := 'Crédito' + #30 +'>C';
                 Q.FieldByName('IMP_DISPUESTO').DisplayLabel := 'Imp Dispuesto' + #30 +'>C';
                 Q.FieldByName('SDO_INSOLUTO').DisplayLabel := 'Saldo Insoluto' + #30 +'>C';
                 Q.FieldByName('SDO_VIG_TOTAL').DisplayLabel := 'Saldo Vigente' + #30 +'>C';
                 Q.FieldByName('F_INICIO').DisplayLabel := 'F Inicio' + #30 +'>C';
                 Q.FieldByName('F_VENCIMIENTO').DisplayLabel := 'F Vento.' + #30 +'>C';
                 Q.FieldByName('F_TRASPASO_VENC').DisplayLabel := 'F Tras Venc' + #30 +'>C';
                 Q.fieldByName('CVE_OBSERVACION').DisplayLabel := 'T. Restruc.' +#30 +'>C' ;
                 Q.fieldByName('ISVENCIDO').DisplayLabel := 'Gen Vig/Ven' +#30 +'>C' ;
                 Q.fieldByName('AGRUPAR').DisplayLabel := 'Agrupar' +#30 +'>C' ;
                 //ASIGNACION DE MASCARAS DE EDICION
                 TNumericField(Q.FieldByName('IMP_DISPUESTO')).DisplayFormat := '###,###,###,##0.00';
                 TNumericField(Q.FieldByName('SDO_INSOLUTO')).DisplayFormat := '###,###,###,##0.00';
                 TNumericField(Q.FieldByName('SDO_VIG_TOTAL')).DisplayFormat := '###,###,###,##0.00';
                 TDateField(Q.FieldByName('F_INICIO')).DisplayFormat := 'DD/MM/YYYY';
                 TDateField(Q.FieldByName('F_VENCIMIENTO')).DisplayFormat := 'DD/MM/YYYY';
                 TDateField(Q.FieldByName('F_TRASPASO_VENC')).DisplayFormat := 'DD/MM/YYYY';
                 //ASIGNACION DE LONGITUD DE COLUMNAS
                 Q.FieldByName('ID_CONTRATO').DisplayWidth := 10;  // RABA 24 MAY 2011
                 Q.FieldByName('ID_CREDITO').DisplayWidth := 8;
                 Q.FieldByName('IMP_DISPUESTO').DisplayWidth := 13;
                 Q.FieldByName('SDO_INSOLUTO').DisplayWidth := 13;
                 Q.FieldByName('SDO_VIG_TOTAL').DisplayWidth := 13;
                 Q.FieldByName('F_INICIO').DisplayWidth := 11;
                 Q.FieldByName('F_VENCIMIENTO').DisplayWidth := 11;
                 Q.FieldByName('F_TRASPASO_VENC').DisplayWidth := 11;
                 Q.FieldByName('CVE_OBSERVACION').DisplayWidth := 8 ;
                 Q.FieldByName('ISVENCIDO').DisplayWidth := 13 ;
                 Q.FieldByName('AGRUPAR').DisplayWidth := 10 ;

                 if  (rgTipoOper.ItemIndex = 0) OR (rgTipoOper.ItemIndex = 1) then
                     Q.FieldByName('ISVENCIDO').Visible := True
                 else
                     Q.FieldByName('ISVENCIDO').Visible := False;

                 SGCRenRee.Titulo1 := 'Disposiciones Seleccionadas';
                 SGCRenRee.addQry(Q,True,True,-1,-1,-1,True);

             end
             else
                 SGCRenRee.Clear(C_MSG_GRID_NULL);
            //end if
         finally
            if Q<>nil then Q.free;
         end;

         // </ RABA > 24 MAY 2011
         // Se agrega el calculo de importes para cada crédito seleccionado
         // en la grid antes de grabar en la base de datos.
         SGCRenRee.SG.DefaultDrawing:= false ;
         //CalculaImportes;  FJR 11.09.2012 COMENTADO PARA OPTIMIZAR CODIGO
         // < RABA />

         //FJR 07.09.2012 Estas lineas siguientes pretenden desplazar a CalculaImportes. Validar correcciones y saldos en insercion
         Objeto.IMP_AUTORIZADO.AsFloat:= BuscaImporteEnGrid(Objeto.Credito.ID_CREDITO.AsString, CO_COL_ADE_TOT);
         Objeto.IMP_OPERACION.AsFloat := Objeto.IMP_AUTORIZADO.AsFloat + Objeto.IMP_INCREMENTO.AsFloat;

         //Agrega o elimina de la Base de datos
         If (PPAccion = 'A') or (PPAccion = 'E') then
         AgregaEliminaCreditoBD(PPIDCredito,PPAccion, '', vlTempTrasVenc,
                                Objeto.IMP_OPERACION.AsFloat,
                                Objeto.IMP_AUTORIZADO.AsFloat, Objeto.IMP_INCREMENTO.AsFloat);

         //ShowMessage(IntToStr(vgPrimero)+' - '+Objeto.IMP_INCREMENTO.AsString+' - '+) ;
     end;
end;



Procedure TWCrResRee.EliminaTodo;
begin
     EliminaTodoBD;
     SGCRenRee.Clear(C_MSG_GRID_NULL);
     Label5.Caption  := FormatFloat('####,####,####,###,##0.00',0);
     Label6.Caption  := FormatFloat('####,####,####,###,##0.00',0);
     Label8.Caption  := FormatFloat('####,####,####,###,##0.00',0);
     Label11.Caption := FormatFloat('####,####,####,###,##0.00',0);
     Label13.Caption := FormatFloat('####,####,####,###,##0.00',0);
     Label18.Caption := FormatFloat('####,####,####,###,##0.00',0);
     // </ RABA > 20 JUN 2011
     lbTotalIncremento.Caption := FormatFloat('####,####,####,###,##0.00',0);
     lbTotalNuevaDisp.Caption  := FormatFloat('####,####,####,###,##0.00',0);
     // < RABA />
     Objeto.IMP_NUEVADISP.AsFloat := 0 ;  //FJR 22.08.2012
end;

Procedure TWCrResRee.AgregaEliminaCreditoBD(PPIDCredito : Integer; PPAccion, PPCveObs : String;
                                            PPBGenTrasVen :String;
                                            PPImpOperacion, PPImpAutoriza, PPImpIncremento: Double);
var stp : TStoredProc;
begin
     if PPAccion = 'A' then
     begin
          stp := TStoredProc.Create(Nil);
          If Assigned(stp) Then
          begin
              With stp Do
              begin
                  Try
                     DatabaseName := Objeto.Apli.DataBaseName;
                     SessionName  := Objeto.Apli.SessionName;
                     StoredProcName := 'PKGCRPRORRCM.STPAGREGAELEMENTO';
                     Params.CreateParam(ftInteger,'PEFOLGRUPORENUEVA',ptInput);
                     Params.CreateParam(ftInteger,'PEIDCREDRENOVADO',ptInput);
                     Params.CreateParam(ftString,'PETIPODISPOSICION',ptInput);
                     Params.CreateParam(ftDate,'PEFVALOR',ptInput);
                     Params.CreateParam(ftFloat,'PEIMPOPERACION',ptInput);
                     Params.CreateParam(ftFloat,'PEIMPAUTORIZADO',ptInput);
                     Params.CreateParam(ftFloat,'PEIMPINCREMENTO',ptInput);
                     Params.CreateParam(ftInteger,'PSFOLGRUPORENUEVA',ptOutput);
                     // FJR 04.09.2012 ADICION DE CLAVE DE OBSERVACION
                     Params.CreateParam(ftString,'PECVEOBSERVACION',ptInput);
                     Params.CreateParam(ftString,'PEBIMPIMPAGADO',ptInput);   //HERJA ABRIL 2013
                     Params.CreateParam(ftString,'PEBGENTRASVEN', ptInput);    // RABA NOV 2014 ACTUALIZACION B-6
                     Params.CreateParam(ftString,'PEBNUEVADISP', ptInput);    // RABA NOV 2014 ACTUALIZACION B-6
                     Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
                     Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
                     Prepare;
                     ParamByName('PEFOLGRUPORENUEVA').AsInteger := Objeto.FOL_GRUPO_RENUEVA.AsInteger;
                     ParamByName('PEIDCREDRENOVADO').AsFloat := PPIDCredito;
                     ParamByName('PEIMPOPERACION').AsFloat := PPImpOperacion;
                     ParamByName('PEIMPAUTORIZADO').AsFloat := PPImpAutoriza;
                     ParamByName('PEIMPINCREMENTO').AsFloat := PPImpIncremento;
                     //SOLO PARA RENOVACIÓN
                     if rgTipoOper.ItemIndex = 0 then
                        ParamByName('PETIPODISPOSICION').AsString := 'RE'
                     //SOLO PARA REESTRUCTURACION
                     else if rgTipoOper.ItemIndex = 1 then
                        ParamByName('PETIPODISPOSICION').AsString := 'RS'
                     //SOLO PARA CONVENIO MODIFICATORIO
                     else if rgTipoOper.ItemIndex = 2 then
                        ParamByName('PETIPODISPOSICION').AsString := 'CM'
                     //SOLO PARA EVENTO DE ACELERACION
                     else if rgTipoOper.ItemIndex = 3 then
                        ParamByName('PETIPODISPOSICION').AsString := 'EA' //; ASTECI :AARJ 4/05/2010
                     //end if;
                     //</ ASTECI: AARJ >
                     // 3 FEB 10
                     // En "agregar" el elemento credito, se tiene que especificar una clave para reconocer el
                     // Tipo de Diposición, se propone 'LC' para indicar la operación Liquidación - Colocación
                     // Una vez que se haya procesado este credito como 'LC' se verá la forma en que quede como
                     // si fuera una nueva disposición con la respectiva clave.
                     else if rgTipoOper.ItemIndex = 4 then
                        ParamByName('PETIPODISPOSICION').AsString := 'LC';
                     //< ASTECI: AARJ />

                     ParamByName('PEFVALOR').AsDateTime :=  Objeto.F_INICIO.AsDateTime;
                     // FJR 04.09.2012 ADICION DE CLAVE DE OBSERVACION
                     ParamByName('PECVEOBSERVACION').AsString:= PPCveObs;
                     ParamByName('PEBIMPIMPAGADO').AsString:= VLBIMP_IMPAGADO;   //HERJA ABRIL 2013
                     ParamByName('PEBGENTRASVEN').AsString:= PPBGenTrasVen;    // RABA NOV 2014 ACTUALIZACION B-6
                     ParamByName('PEBNUEVADISP').AsString := 'F';  // RABA NOV 2014 ACTUALIZACION B-6
                     ExecProc;
                     if ParamByName('PSRESULTADO').AsInteger <> 0 then
                     begin
                          ShowMessage(ParamByName('PSTXRESULTADO').AsString);
                     end
                     else
                     begin
                          Objeto.FOL_GRUPO_RENUEVA.AsInteger := ParamByName('PSFOLGRUPORENUEVA').AsInteger;
                          Objeto.FOL_GRUPO_RENUEVA.DrawControl;
                     end;
                  Finally
                     Close;
                     Params.Clear;
                     Free;
                  End;
              end;
          end;
     end;

     if PPAccion = 'E' then
     begin
          stp := TStoredProc.Create(Nil);
          If Assigned(stp) Then
          begin
              With stp Do
              begin
                  Try
                     DatabaseName := Objeto.Apli.DataBaseName;
                     SessionName  := Objeto.Apli.SessionName;
                     StoredProcName := 'PKGCRPRORRCM.STPELIMINAELEMENTO';
                     Params.CreateParam(ftInteger,'PEFOLGRUPORENUEVA',ptInput);
                     Params.CreateParam(ftInteger,'PEIDCREDRENOVADO',ptInput);
                     Params.CreateParam(ftString,'PECVEUSUMODIFICA',ptInput);
                     Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
                     Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
                     Prepare;
                     ParamByName('PEFOLGRUPORENUEVA').AsInteger := Objeto.FOL_GRUPO_RENUEVA.AsInteger;
                     ParamByName('PEIDCREDRENOVADO').AsInteger  := PPIDCredito;
                     ParamByName('PECVEUSUMODIFICA').AsString   := Objeto.Apli.Usuario;
                     ExecProc;
                     if ParamByName('PSRESULTADO').AsInteger <> 0 then
                        ShowMessage(ParamByName('PSTXRESULTADO').AsString);
                     //end if;
                  Finally
                     Close;
                     Params.Clear;
                     Free;
                  End;
              end;
          end;
     end;
end;

Procedure TWCrResRee.EliminaTodoBD;
var stp : TStoredProc;
begin
     stp := TStoredProc.Create(Nil);
     If Assigned(stp) Then
     begin
         With stp Do
         begin
              Try
                 DatabaseName := Objeto.Apli.DataBaseName;
                 SessionName  := Objeto.Apli.SessionName;
                 StoredProcName := 'PKGCRPRORRCM.STPELIMINAELEMENTO';
                 Params.CreateParam(ftInteger,'PEFOLGRUPORENUEVA',ptInput);
                 Params.CreateParam(ftInteger,'PEIDCREDRENOVADO',ptInput);
                 Params.CreateParam(ftString,'PECVEUSUMODIFICA',ptInput);
                 Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
                 Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
                 Prepare;
                 ParamByName('PEFOLGRUPORENUEVA').AsInteger := Objeto.FOL_GRUPO_RENUEVA.AsInteger;
                 ParamByName('PEIDCREDRENOVADO').AsInteger := 0;
                 ParamByName('PECVEUSUMODIFICA').AsString   := Objeto.Apli.Usuario;
                 ExecProc;
                 if ParamByName('PSRESULTADO').AsInteger <> 0 then
                    ShowMessage(ParamByName('PSTXRESULTADO').AsString);
                 //end if;
              Finally
                 Close;
                 Params.Clear;
                 Free;
              End;
         end;
     end;
end;

Function TWCrResRee.ValidaDispRenov : String;
var
   Y, X, MAX, VLCont, VLRegAut : Integer;
   VLSalida   :  String;
begin
     VLSalida := 'V';   //NO TIENE MAS DE 1 REGISTRO
     X:= SGCRenRee.SG.Selection.Left;
     Y:= SGCRenRee.SG.Selection.Top;
     MAX := SGCRenRee.SG.RowCount;
     VLRegAut := 0;
     for VLCont := 1 to MAX do
     begin
          VLRegAut :=  VLRegAut + 1;
     end;
     if VLRegAut > 1 then
     begin
         VLSalida := 'F';
     end;
     ValidaDispRenov := VLSalida;
end;


procedure TWCrResRee.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.F_INICIO.Control := edF_INICIO;
      Objeto.FOL_GRUPO_RENUEVA.Control := edFOL_GRUPO_RENUEVA;
      Objeto.IMP_INCREMENTO.Control := edIMP_INCREMENTO;

      Objeto.F_INICIO.AsDateTime := Objeto.Apli.DameFechaEmpresa;
      dtpF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresa;

      Objeto.ContratoCre.ID_CONTRATO.Control := iedID_CONTRATO;
      Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO;
      Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control :=edDESC_PRODUCTO;
      Objeto.ContratoCre.Contrato.TITNombre.Control := edNombreAcreditado;
      Objeto.ContratoCre.GetParams(Objeto);

      // </ RABA >
      // 17 MAY 2011
      If not(Objeto.ContratoCre.Active) then
      begin
        if objeto.ContratoCre.FindKey([objeto.vgIdContratoOrig,'1']) then
        begin
           objeto.ContratoCre.ObtenDisponibleAut(inttostr(objeto.vgIdContratoOrig),'1');
//           iedID_CONTRATO.OnExit(self);
        end;
        rgTipoOper.SetFocus;
      end;

      If not(Objeto.Acreditado.Active) Then
      begin
        if Objeto.Acreditado.FindKey([Objeto.VLACREDITADO]) then
           Objeto.vgGrupoEco := Objeto.Acreditado.CVE_GRUPO_ECO.AsString;
      end;

      Objeto.ContratoDest.ID_CONTRATO.Control := iedID_CONTRATO_DEST;
      Objeto.ContratoDest.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_dest;
      Objeto.ContratoDest.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO_dest;
      Objeto.ContratoDest.Contrato.TITNombre.Control := edNombreAcreditado_dest;
      Objeto.ContratoDest.DISPONIBLE_AUT.Control := iedDISPONIBLE_AUT;
//      Objeto.ContratoCre.IMP_AUTORIZADO.Control  := iedIMP_AUROTIZADO;
      Objeto.ContratoCre.IMP_DISPUESTO.Control  := iedIMP_AUROTIZADO;
      Objeto.IMP_NUEVADISP.Control := iedIMP_NUEVADISP;
      Objeto.ContratoDest.GetParams(Objeto);

      Objeto.IMP_NUEVADISP.AsFloat := 0;
      // < RABA />

      // </ RABA >
      // 24 MAY 2011 - El campo de selección de crédito o cesion se elimina
      // para cambiar la selección en un grid
      //Objeto.Credito.ID_CREDITO.Control := edID_CESION;
      //Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
      //Objeto.Credito.GetParams(Objeto);
      // < RABA />

      Objeto.ContratoCre.FilterString := '(CR_CONTRATO.SIT_LINEA = ''AU'')' +
                                         ' AND (CR_CONTRATO.ID_CONTRATO IN ( '+
                                         ' SELECT ID_CONTRATO FROM CONTRATO WHERE ID_TITULAR = ' +
                                           Objeto.VLACREDITADO + ' ) ) ';
      Objeto.ContratoCre.BuscaWhereString := Objeto.ContratoCre.FilterString;
      edDESC_PRODUCTO.Hint := Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO.ShowHint := True;

      // </ RABA >  17 MAY 2011
      Objeto.ContratoDest.FilterString := '(CR_CONTRATO.SIT_LINEA = ''AU'')' +
                                          ' AND (CR_CONTRATO.ID_CONTRATO IN ( '+
                                          ' SELECT ID_CONTRATO FROM CONTRATO WHERE ID_TITULAR = ' +
                                            Objeto.VLACREDITADO + ' ) ) ';
      Objeto.ContratoDest.BuscaWhereString := Objeto.ContratoDest.FilterString;
      edDESC_PRODUCTO_dest.Hint := Objeto.ContratoDest.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO_dest.ShowHint := True;
      // < RABA />

      Objeto.Credito.FilterString := '(CR_CREDITO.SIT_CREDITO = ''AC'')';
      Objeto.Credito.BuscaWhereString := Objeto.Credito.FilterString;

      // </ RABA >
      // 24 MAY 2011 - El campo de selección de crédito o cesion se elimina
      // para cambiar la selección en un grid
      //edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      //edCESION.ShowHint := True;
      // < RABA />

      Objeto.AsignaTipoFiltro(rgTipoOper);
//      Objeto.VLMONEDA := '';
//      Objeto.VLACREDITADO := '';
      rgTipoOper.Enabled := True;
      rgTipoAcreditados.Enabled := True;
      iedID_CONTRATO_DEST.Enabled := True;
      btCONTRATO_DEST.Enabled := True;
end;

procedure TWCrResRee.FormDestroy(Sender: TObject);
begin
    Objeto.F_INICIO.Control := nil;
    Objeto.FOL_GRUPO_RENUEVA.Control := NIL;
    Objeto.IMP_INCREMENTO.Control := NIL;

    // </ RABA >
    // 24 MAY 2011
    // Objeto.IMP_AUTORIZADO.Control := NIL;
    // Objeto.IMP_OPERACION.Control := NIL;
    // Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
    // Objeto.Credito.ID_CREDITO.Control := nil;
    // < RABA />

    Objeto.ContratoCre.ID_CONTRATO.Control := nil;
    Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control :=nil;
    Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control :=nil;
    Objeto.ContratoCre.Contrato.TITNombre.Control := nil;

    // </ RABA >
    // 17 MAY 2011
    Objeto.ContratoDest.ID_CONTRATO.Control := nil;
    Objeto.ContratoDest.CVE_PRODUCTO_CRE.Control := nil;
    Objeto.ContratoDest.Producto.DESC_C_PRODUCTO.Control := nil;
    Objeto.ContratoDest.Contrato.TITNombre.Control := nil;
    Objeto.ContratoDest.DISPONIBLE_AUT.Control := nil;
    Objeto.IMP_NUEVADISP.Control := nil;
    // < RABA />

end;

procedure TWCrResRee.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrResRee.bbAgregarClick(Sender: TObject);
var
  nRows, x : Integer;
  VLCont      : Integer;   //RABA ENE 2015
  VLBContinua : Boolean;

  label lfin; //HERJA JUNIO 2014

begin
   if Objeto.ValidaAccesoEsp('TCRESREE_AGREG',True,True) then
   begin
       // </ RABA > 24 MAY 2011
       // Se agrega ciclo para recorrer el grid de creditos seleccionados y
       // agregarlos al grid de seleccionados para generar operación
       // primero se ve si hay créditos seleccionado para agregar

       //HERJA JUNIO 2014
       if rgTipoOper.ItemIndex = 0 then
       begin
          if Trim(ieCheqAbono.Text)<>Trim(ieCheqLiqu.Text) then
          begin
             ShowMessage('En Renovacion las Chequeras deben de ser las mismas');
             goto lfin;
          end;   
       end;

       LlenaClavesRestruc ; //FJR 26.07.2012

//       Memo1.Lines.Clear ;  //FJR 26.07.2012

       //BarreArreglo('', '', '', '', 0, -2) ;   // RABA ENE 2015
//       BarreArreglo('', '', '', '', 0, -1) ;

       If ValidaCredSelec = 'V' then
       begin
           for nRows := 0 to strgrdCreditos.RowCount - 1 do
           begin
             if strgrdCreditos.Cells[CO_COL_CHECK, nRows] = CO_CHECKED then
             begin
               if Objeto.Credito.FindKey([strgrdCreditos.Cells[CO_COL_IDCREDITO, nRows]]) then
               begin
                     // RABA 24 MAY 2011     esto ya estaba
                     //******************************************
                     IF ValidaTipOperAutorizacion = 'V' THEN
                     BEGIN
                        // RABA ENE 2015
                        VLBContinua := True;
                        for VLCont := 2 to SGCRenRee.SG.RowCount do
                        begin
                          if SGCRenRee.CellStr['ID_CREDITO',VLCont] = strgrdCreditos.Cells[CO_COL_IDCREDITO, nRows] then
                          begin
                            ShowMessage('La Disposición: ' + strgrdCreditos.Cells[CO_COL_IDCREDITO, nRows] + ' ya está agregada.');
                            VLBContinua := False;
                          end;
                        end;
                        // FIN RABA

                        IF VLBContinua THEN
                        Begin
                          BarreArreglo('', '', '', '', nRows, -2) ;   // RABA ENE 2015
                          BarreArreglo('', '', '', '', 0, -1) ;   // RABA ENE 2015
                          
                          //SE GUARDA EN VARIABLE GLOBAL LA BANDERA DE IMPORTE PAGADO HERJA ABRIL 2013
                          IF strgrdCreditos.Cells[CO_COL_IMPIMPAGADO,nRows]='SI' THEN VLBIMP_IMPAGADO :='V'
                          ELSE VLBIMP_IMPAGADO :='F';
                          //SE GUARDA EN VARIABLE GLOBAL LA BANDERA DE SI ES VENCIDO O NO    RABA FEB 2015
                          IF strgrdCreditos.Cells[CO_COL_VIGVEN,nRows]='VENCIDO' THEN vlTempTrasVenc :='V'
                          ELSE vlTempTrasVenc :='F';
                          //FIN HERJA ABRIL 2013
                          Agregar; // AARJ Además de la validación que aparece aqui, Agregar también tiene validaciones para Tipo oper 0,2,3 antes de Agregar el registro.
                          //VALIDACIONES DE CONVENIO MODIFICATORIO
                          if ( rgTipoOper.ItemIndex = 2 )then begin
                            IF Objeto.VLACREDITADO = '' THEN
                               Objeto.VLACREDITADO := Objeto.Credito.ContratoCre.Contrato.ID_Titular.AsString;

                            IF Objeto.VLMONEDA = '' THEN
                               Objeto.VLMONEDA := Objeto.Credito.ContratoCre.CVE_MONEDA.AsString;

                            Objeto.ContratoCre.BuscaWhereString := Objeto.ContratoCre.BuscaWhereString +
                                                                   ' AND (CR_CONTRATO.ID_CONTRATO IN ( '+
                                                                   ' SELECT ID_CONTRATO FROM CONTRATO WHERE ID_TITULAR = ' +
                                                                     Objeto.VLACREDITADO + ' ) ) '+
                                                                   ' AND (CR_CONTRATO.CVE_MONEDA = '+ Objeto.VLMONEDA + ' )';
                            Objeto.ContratoCre.FilterString := Objeto.ContratoCre.BuscaWhereString;
                          end;
                          BarreArreglo('', '', '', '', 0, 4);   //RABA ENE 2015
                        End; // del IF vlContinua
                     END
                     ELSE BEGIN
                       if rgTipoOper.ItemIndex = 0 then
                          ShowMessage(C_MSG_VALID_AUT + C_MSG_RENOVA)
                       else if rgTipoOper.ItemIndex = 1 then
                          ShowMessage(C_MSG_VALID_AUT + C_MSG_REESTRUC)
                       else if rgTipoOper.ItemIndex = 2 then
                          ShowMessage(C_MSG_VALID_AUT + C_MSG_CONV_MOD)
                       else if rgTipoOper.ItemIndex = 3 then
                          ShowMessage(C_MSG_VALID_AUT + C_MSG_EVEN_ACEL)
                       // </ ASTECI:AARJ >
                       // 3 FEB 10
                       // Implementación correspondiente a rgTipoOper.ItemIndex = 4
                       else if rgTipoOper.ItemIndex = 4 then
                          ShowMessage(C_MSG_VALID_AUT + C_MSG_LIQ_COLOC);
                       // < ASTECI:AARJ />
                     END;

                 //******************************************
                 //
               end; // del IF FindKey
             end; // del IF Checked
           end; //del FOR nRows
           // FJR 27.07.2012 BLOQUE DE CONSTRUCCION DE CAMPOS CALCULADOS PARA REESTRUCTURA.
//           SetLength(Arr_Calif, SGCRenRee.MaxRow) ;
//           BarreArreglo('', '', '', '', 0, 0);
//           BarreArreglo('', '', '', '', 0, 1);
           // FJR 27.07.2012
       end
       else
       begin
         ShowMessage(C_MSG_GRID_NULL);
       end;

         // < RABA />
       lfin:
   end;
end;

procedure TWCrResRee.btCONTRATOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRESREE_AUTORO',True,True) then
   begin
     Objeto.ContratoCre.ShowAll := True;
     if Objeto.ContratoCre.Busca then
     begin
        Objeto.Credito.FilterString     := '(CR_CREDITO.SIT_CREDITO = ''AC'' AND CR_CREDITO.ID_CONTRATO = ' +
                                           Objeto.ContratoCre.ID_CONTRATO.AsString + ')';
        Objeto.Credito.BuscaWhereString := Objeto.Credito.FilterString;
        InterForma1.NextTab(btCONTRATO);
     end;
   end;
end;

procedure TWCrResRee.ilIDCONTRATOEjecuta(Sender: TObject);
begin
   if Objeto.ContratoCre.FindKey([ilIDCONTRATO.Buffer,'1']) then begin
      Objeto.Credito.FilterString := '(CR_CREDITO.SIT_CREDITO = ''AC'' AND CR_CREDITO.ID_CONTRATO = ' +
                                        Objeto.ContratoCre.ID_CONTRATO.AsString + ')';
      Objeto.Credito.BuscaWhereString := Objeto.Credito.FilterString;
      InterForma1.NextTab(iedID_CONTRATO);
   End;
end;


procedure TWCrResRee.bbEliminaCreditoClick(Sender: TObject);
var
   Y          :  Integer;
   X          :  Integer;
   g          :  String ;
begin
   if Objeto.ValidaAccesoEsp('TCRESREE_ELIM',True,True) then
   begin
     X:=SGCRenRee.SG.Selection.Left;
     Y:=SGCRenRee.SG.Selection.Top;

     Memo1.Lines.Clear ;

     // FJR AGOSTO 2012 BLOQUE DE ELIMINACION VIRTUAL DE UN CREDITO A REESTRUCTURAR SELECCIONADO
     If MessageDlg('¿Desea eliminar el crédito : ' + SGCRenRee.CellStr['ID_CREDITO',Y] +'?'+#13+
                   'Nota: Por seguridad, debe asignar nuevamente claves de observacion restantes.',   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
         g:= SGCRenRee.CellStr['ID_CREDITO',Y] ;
         BarreArreglo(g, '', '', '', 0, 3);
         BarreArreglo('', '', '', '', 0, 4);
         AgregaEliminaCredito(StrToInt(SGCRenRee.CellStr['ID_CREDITO',Y]),'E');
     end;
     // FJR AGOSTO 2012

     BarreArreglo('', '', '', '', 0, 4);  // FJR AGOSTO 2012 POBLAR GRID

     if SGCRenRee.SG.RowCount = 1 then  Begin
// RABA 24 JUN 2011 EL ACREDITADO SIGUE SIENDO EL MISMO QUE EL SELECCIONADO EN LA DISPOSICIÓN
//        Objeto.VLACREDITADO := '';
//        Objeto.VLMONEDA := '';
//        Objeto.ContratoCre.FilterString := '(CR_CONTRATO.SIT_LINEA = ''AU'')';
        Objeto.ContratoCre.FilterString := '(CR_CONTRATO.SIT_LINEA = ''AU'')' +
                                           ' AND (CR_CONTRATO.ID_CONTRATO IN ( '+
                                           ' SELECT ID_CONTRATO FROM CONTRATO WHERE ID_TITULAR = ' +
                                             Objeto.VLACREDITADO + ' ) ) ';
// RABA
        Objeto.ContratoCre.BuscaWhereString := Objeto.ContratoCre.FilterString;
        rgTipoOper.Enabled := True;
        rgTipoAcreditados.Enabled := True;  //RABA FEB 2015 PARA ADMINISTRACIÓN DE MISMO RIESGO COMUN
        // </ RABA > 24 MAY 2011
        iedID_CONTRATO_DEST.Enabled := True;
        btCONTRATO_DEST.Enabled := True;
        edF_INICIO.Enabled := True;
        dtpF_INICIO.Enabled := True;
        edIMP_INCREMENTO.Enabled := True;
        edIMP_INCREMENTO.Text := lbINCREMENTO.Caption;
        edIMP_INCREMENTO.Visible := True;
        lbINCREMENTO.Visible := False;
        lbParametrosIniciales.Visible := False;        
        // < RABA />

     end;
   end;
end;

procedure TWCrResRee.bbEliminaTodoClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRESREE_ELIMT',True,True) then
   begin
     If MessageDlg('¿Desea eliminar todos los créditos seleccionados?',   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin // RABA  24 MAY 2011 FALTA BEGIN - END PARA QUE SI LA RESPUESTA ES SI,
           // ENTONCES SE REALICEN TODAS LAS LINEAS DE ESTE PROCEDIEMIENTO
         EliminaTodo;
         //end if;
// RABA 24 JUN 2011 EL ACREDITADO SIGUE SIENDO EL MISMO QUE EL SELECCIONADO EN LA DISPOSICIÓN
//         Objeto.VLACREDITADO := '';
//         Objeto.VLMONEDA := '';
//         Objeto.ContratoCre.FilterString := '(CR_CONTRATO.SIT_LINEA = ''AU'')';
        Objeto.ContratoCre.FilterString := '(CR_CONTRATO.SIT_LINEA = ''AU'')' +
                                           ' AND (CR_CONTRATO.ID_CONTRATO IN ( '+
                                           ' SELECT ID_CONTRATO FROM CONTRATO WHERE ID_TITULAR = ' +
                                             Objeto.VLACREDITADO + ' ) ) ';
// RABA
         Objeto.ContratoCre.BuscaWhereString := Objeto.ContratoCre.FilterString;
         rgTipoOper.Enabled := True;
         rgTipoAcreditados.Enabled := True;  //RABA FEB 2015 PARA ADMINISTRACIÓN DE MISMO RIESGO COMUN
         // </ RABA > 24 MAY 2011
         iedID_CONTRATO_DEST.Enabled := True;
         btCONTRATO_DEST.Enabled := True;
         edF_INICIO.Enabled := True;
         dtpF_INICIO.Enabled := True;
         edIMP_INCREMENTO.Enabled := True;
         edIMP_INCREMENTO.Text := lbINCREMENTO.Caption;
         edIMP_INCREMENTO.Visible := True;
         lbINCREMENTO.Visible := False;
         lbParametrosIniciales.Visible := False;         
         Objeto.IMP_INCREMENTO.AsFloat := 0;
         Objeto.IMP_NUEVADISP.AsFloat := 0;
         iedID_CONTRATO.OnExit(self);
         // < RABA />
     end;  // RABA 24 MAY 2011

     // FJR AGOSTO 2012 BLOQUE DE "REINICIALIZACION" DE ARREGLOS DE REESTRUCTURAS.
     Memo1.Lines.Clear ;
//     SetLength(Arr_Calif, 0) ;
     StringGrid1.RowCount := 1 ;
     StringGrid1.ColCount := 1 ;
     StringGrid1.Cells[0, 0]:= '' ;
     // FJR AGOSTO 2012
   end;
end;

procedure TWCrResRee.SGCRenReeCalcRow(Sendet: TObject; DataSet: TDataSet;  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
var {vlPPSaldoVenc : Double;
    vlPPSaldoTotal: Double;
    PPSaldoVenc   : Double;
    PPSaldoTotal  : Double;}  // FJR 11.09.2012 Comentado para optimizar
    vlCredito     : String;
begin
    Case RoWCaso of
    rcQueryBegin : begin
                      VLIMP_DISPUESTO := 0;
                      VLSDO_INSOLUTO  := 0;
                      VLSDO_INTVIG    := 0;
                      VLSDO_VIG_TOTAL := 0;
                      VLADEUDO_VENC   := 0;
                      VLADEUDO_TOTAL  := 0;
                   end;
    rcRowBegin : begin
                      if ((length(DataSet.FieldByName('ID_CREDITO').AsString) > 0) and  (DataSet.FieldByName('ID_CREDITO').AsInteger <> 0) ) then
                      begin
                           VLIMP_DISPUESTO := VLIMP_DISPUESTO + DataSet.FieldByName('IMP_DISPUESTO').AsFloat;
                           VLSDO_INSOLUTO  := VLSDO_INSOLUTO + DataSet.FieldByName('SDO_INSOLUTO').AsFloat;
                           VLSDO_VIG_TOTAL := VLSDO_VIG_TOTAL + DataSet.FieldByName('SDO_VIG_TOTAL').AsFloat;
                           //FJR 11.09.2012 CODIGO COMENTADO
                           //  Objeto.LlenaEncabezado(DataSet.FieldByName('ID_CREDITO').AsString,Objeto.F_INICIO.AsString,PPSaldoVenc,PPSaldoTotal,VLSDO_INTVIG );  FJR 11.09.2012 comentado para optimizar
                           //  VLADEUDO_VENC  := VLADEUDO_VENC + PPSaldoVenc;   FJR 11.09.2012 Comentado para optimizar
                             //28.12.2011 REVISAR CON ARA
                             //VLADEUDO_TOTAL := VLADEUDO_TOTAL + PPSaldoTotal + PPSaldoVenc;  FJR 11.09.2012 Comentado para optimizar
                           //  VLADEUDO_TOTAL := VLADEUDO_TOTAL + PPSaldoTotal ;               FJR 11.09.2012 Comentado para optimizar
//                           VLADEUDO_VENC  := VLADEUDO_VENC + BuscaImporteEnGrid(DataSet.FieldByName('ID_CREDITO').AsString, CO_COL_IMP_DISP);
//                           VLADEUDO_TOTAL := VLADEUDO_TOTAL + BuscaImporteEnGrid(DataSet.FieldByName('ID_CREDITO').AsString, CO_COL_ADE_TOT) ;
//RABA                           VLADEUDO_VENC  := VLADEUDO_VENC + DataSet.FieldByName('IMP_DISPUESTO').AsFloat;   // RABA ENE 2015
                           VLADEUDO_TOTAL := VLADEUDO_TOTAL + DataSet.FieldByName('SDO_VIG_TOTAL').AsFloat;  // RABA ENE 2015

                      end;
                 end;
    rcQueryEnd: begin
                      Label5.Caption := FormatFloat('####,####,####,###,##0.00',VLIMP_DISPUESTO);
                      Label6.Caption := FormatFloat('####,####,####,###,##0.00',VLSDO_INSOLUTO);
//RABA                      Label18.Caption := FormatFloat('####,####,####,###,##0.00',VLSDO_INTVIG);
                      Label8.Caption := FormatFloat('####,####,####,###,##0.00',VLSDO_VIG_TOTAL);
//RABA                      Label11.Caption := FormatFloat('####,####,####,###,##0.00',VLADEUDO_VENC);
                      Label13.Caption := FormatFloat('####,####,####,###,##0.00',VLADEUDO_TOTAL);
                      lbTotalNuevaDisp.Caption := FormatFloat('####,####,####,###,##0.00',(VLADEUDO_TOTAL + StrToFloat(quitacomas(trim(lbTotalIncremento.Caption))) ));
                      Objeto.IMP_NUEVADISP.AsFloat := VLADEUDO_TOTAL + StrToFloat(quitacomas(trim(lbTotalIncremento.Caption)))  ; // FJR 22.08.2012
                end;
    end; // Case
end;

procedure TWCrResRee.bbGenRenReeClick(Sender: TObject);
Var
   Credito : TCrCredito;
   Continua : Boolean;   // JJAR 09 Abril 2009, se agrega esta varible para validar los importes de operación vs. tabla CR_RR_CREDITO
   ImporteOperacion : Double;
   vlstrSQLRenueva  : String;
   vlQryRenueva     : TQuery;
   C                : Integer ;

   //RABA ENE 2015 ACTUALIZACIÓN B-6
   vltxtsql : String;
   qyQuery  : TQuery;
   vlSecuencia : Integer;
   // FIN RABA

   // ***** //
   //Function ObtImpDisp : Double; //RABA ENE 2015 Se agrega parámetro
   Function ObtImpDisp(vlNumSec:Integer) : Double;
   var vlSql : String;
       vlImpTotal : String;
   Begin
       vlsql:= 'SELECT nvl(SUM(IMP_RENUEVA),0) IMP_TOTAL FROM CR_RR_CREDITO WHERE FOL_GRUPO_RENUEVA = ' +
               Objeto.FOL_GRUPO_RENUEVA.AsString + ' AND FOL_SECUENCIA = ' + IntToStr(vlNumSec);
       GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'IMP_TOTAL', vlImpTotal,False);
       ObtImpDisp := StrToFloat(vlImpTotal);
   end;
   // ***** //
   Function HayVencidos : Boolean;
   var vlSql : String;
       vlHayVencidos : Integer;
   Begin
       vlsql:= 'SELECT COUNT(*) HAY_VENCIDOS FROM CR_RR_CREDITO WHERE FOL_GRUPO_RENUEVA = ' +
                Objeto.FOL_GRUPO_RENUEVA.AsString +
                ' AND B_GEN_TRASVEN =''V''';
       GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'HAY_VENCIDOS', vlHayVencidos,False);
       if vlHayVencidos > 0 then
          HayVencidos := True
       else
          HayVencidos := False;
   end;
//   SELECT COUNT(*) HAY_VENCIDOS FROM CR_RR_CREDITO WHERE FOL_GRUPO_RENUEVA = 1412 AND B_GEN_TRASVEN ='V'
   // ***** //
   Function Lista: String ;
   var Texto: String;
       i: integer ;
   begin
      For i:= 2 to SGCRenRee.MaxRow do begin
          Texto:= Texto + ','+SGCRenRee.CellStr['ID_CREDITO', i] ;
      end ;
      Texto:= Copy(Texto, 2, Length(Texto)-1) ;
      Lista := '('+Texto+')' ;
   end ;
   // ***** //
   Function HaySinCalificar: Boolean ;
   var j: Integer ;
       b: Boolean ;
   begin
      b:= False;
      For j:=0 to StringGrid1.RowCount -1 do begin
          //ShowMessage(IntToStr(j)+' '+StringGrid1.Cells[0, j]+' '+StringGrid1.Cells[1, j]+' '+StringGrid1.Cells[2, j]);
          If (StringGrid1.Cells[0, j] = '') then Break ;
          If (StringGrid1.Cells[0, j] <> '-1')  and ((StringGrid1.Cells[1, j] = '') or (StringGrid1.Cells[2, j] = '')) Then
             b:= True ;
      end ;
      HaySinCalificar:= b;
   end ;

begin
   if Objeto.ValidaAccesoEsp('TCRESREE_GENOPE',True,True) then
   begin
       Continua:= False;   // JJAR 09 abril 2009, por defult para el evento Genera Operación
       ImporteOperacion := 0;

       if SGCRenRee.SG.RowCount > 1 then Begin

         If  (rgTipoOper.ItemIndex = 1) then begin
              If HaySinCalificar then begin
                 ShowMessage('Existen créditos a reestructurar a los cuales no les ha sido asignada una clave de observacion.') ;
                 Continua:= False ;
                 Exit ;
              end
         end ;  //FJR ESCALONADO PARA FUTURAS COMPARACIONES

         Objeto.F_INICIO.GetFromControl;

         // INCIO : JJAR 09 abril 2009, Si se trata de la operación Liquidación - Colocación
         if rgTipoOper.ItemIndex = 4 then
         begin
           //ImporteOperacion := ObtImpDisp;  //RABA ENE 2015 ACTUALIZACION B-6
           ImporteOperacion := ObtImpDisp(1);
           if (FloatToStr(VLADEUDO_TOTAL) = FloatToStr(ImporteOperacion)) then
             Continua := True
           else begin
             If MessageDlg('El Importe de Liquidación y el importe de Colocación son diferentes ' + #13#10 +
                           'Importe Liquidación = ' + FloatToStr(VLADEUDO_TOTAL ) + #13#10 +
                           'Importe Colocación  = ' + FloatToStr(ImporteOperacion) + #13#10 +
                            #13#10 + '¿Desea continuar?',
                           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
               Continua := True
             else begin
               MessageDlg( 'Elimine los registros del Grid  y vuelva a pasar TAB por Autorización y ' + #13#10 +
                           'Disposición / Cesión , para que se actualicen correctamente los importes.'+ #13#10 +
                           'Después ejecute Agregar para generar nuevamente el Folio para la operación '+ #13#10 +
                           ' ',
                           mtInformation, [mbOk], 0);
               Continua := False;
             end;
           end;
         end
         else
           Continua := True;
         // FIN   : JJAR 09 abril 2009, Si se trata de la operación Liquidación - Colocación

         // </ RABA > 31 MAY 2011
         // Para reestruccturación es necesario validar que se seleccionaron todos los créditos
         // de todas las líneas a reestructurar
         if rgTipoOper.ItemIndex = 1 then
         begin
           If ValidaCreditosReestruc = 'F' then
           begin
              ShowMessage(C_MSG_RS_TODOS);
              Continua := False;
           end
           else
              Continua := True;
         end
         else
           Continua := True;
         // < RABA />

         if Continua then  // JJAR 4 MAYO 2010
         Begin  //JJAR: INICIO DE BLOQUE IF CONTINUA

           vltxtsql := ' SELECT FOL_SECUENCIA   ' + coCRLF +
                       ' FROM CR_RR_CREDITO     ' + coCRLF +
                       ' WHERE FOL_GRUPO_RENUEVA = ' + Objeto.FOL_GRUPO_RENUEVA.AsString + coCRLF +
                       '   AND ID_CRED_RENUEVA   = 0 ' + coCRLF +
                       ' GROUP BY FOL_SECUENCIA ' + coCRLF +
                       ' ORDER BY FOL_SECUENCIA ' + coCRLF;

           qyQuery:= GetSQLQuery(vltxtsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
           try
             If qyQuery <> Nil Then
             Begin
               While (not qyQuery.Eof) do
               begin
                  vlSecuencia := qyQuery.FieldByName('FOL_SECUENCIA').AsInteger;

                  Credito := TCrCredito.Create(self);
                  Try
                     Credito.Apli := Objeto.Apli;
                     Credito.ParamCre:= Objeto.ParamCre;

                     // </ RABA > 24 MAY 2011
                     // SE ENVIA EL NUEVO CONTRATO DESTINO DE LA OPERACIÓN A REALIZAR
                     //NÚMERO DE CONTRATO (AUTORIZACIÓN) DESTINO
                     Credito.VGID_CONTRATO_RR := objeto.ContratoDest.ID_CONTRATO.AsInteger;
                     // < RABA />

                     //NUMERO DE CRÉDITO SIMILAR
                     Credito.VGID_CREDITO_RR := DameCreditoBase;
                     //Credito.VGID_IMPORTE_RR := ObtImpDisp; //RABA ENE 2015, se debe obtener importe por grupo de evento, ahora reestructuras
                     Credito.VGID_IMPORTE_RR := ObtImpDisp(vlSecuencia);
                     //TIPO DE OPERACION
                     if rgTipoOper.ItemIndex = 0 then
                     begin
                        Credito.VGTIPO_DISPOSICION := 'RE';
                        Credito.vgDispRen := False;  // RABA NOV 2014 ACTUALIZACION B-6
                     end
                     else if rgTipoOper.ItemIndex = 1 then
                        Credito.VGTIPO_DISPOSICION := 'RS'
                     else if rgTipoOper.ItemIndex = 2 then Begin
                        Credito.VGTIPO_DISPOSICION := 'CM';

                        if SGCRenRee.SG.RowCount <= 3 then
                           Credito.FindKey([Credito.VGID_CREDITO_RR]);

                        Credito.ContratoCre.Contrato.BuscaWhereString := ' CONTRATO.ID_TITULAR = ' + Objeto.VLACREDITADO +
                                                                         ' AND CONTRATO.CVE_MONEDA = '+ Objeto.VLMONEDA ;
                        Credito.ContratoCre.Contrato.FilterString := Credito.ContratoCre.Contrato.BuscaWhereString;
                     end
                     else if rgTipoOper.ItemIndex = 3 then Begin
                        Credito.FindKey([Credito.VGID_CREDITO_RR]);
                        Credito.VGTIPO_DISPOSICION := 'EA';
                     end //;
                     // </ ASTECI:AARJ >
                     // 3 FEB 10 Modificación para considerar el caso de la operación L-C
                     else if rgTipoOper.ItemIndex = 4 then Begin
                       // Se comentario la siguiente LINEA PUES SE PRESENTAN LOS DATOS Y SE INHIBE EL BOTON DE AUTORIZACION
                       // Credito.FindKey([Credito.VGID_CREDITO_RR]);
                        Credito.VGTIPO_DISPOSICION := 'DI';
                       // Para que se distinga la disposición que se Origina por una LC,
                       // se prende esta bandera, en otro caso la bandera queda con valor
                       // False por Default pues es el valor con el que se inicializa la
                       // variable en TCrCredito.Create(self);
                        Credito.VG_OpEv_LC := True;
                     end;
                     // < ASTECI:AARJ />
                     //end if
                     Credito.VGFOL_GRUPO_RENUEVA := Objeto.FOL_GRUPO_RENUEVA.AsInteger;
                     Credito.VGF_INICIO := Objeto.F_INICIO.AsDateTime;
                     Credito.vgFolSecuencia := vlSecuencia;  //RABA ENE 2015 PARA REESTRUCTURAR EN VARIAS REESTRUCTURAS

                     Credito.Catalogo;
                  Finally
                     Credito.Free;
                  End;

                  // </ RABA > 24 MAY 2011
                  // si se agregaron creditos a la grid SGCRenRee.SG entonces hay registros
                  // en la base de datos en la tabla CR_RR_CREDITO
                  // si los registros de esa tabla del grupo indicado tienen un ID de crédito
                  // en el campo ID_CRED_RENUEVA, quiere decir que se dió de alta la disposición
                  // por lo que se cierra la ventana
                  if SGCRenRee.SG.RowCount > 1 then
                  begin
                    vlstrSQLRenueva := ' SELECT MAX(ID_CRED_RENUEVA) AS NUEVOCREDITO ' +
                                       ' FROM CR_RR_CREDITO WHERE FOL_GRUPO_RENUEVA = ' +
                                       Objeto.FOL_GRUPO_RENUEVA.AsString +
                                       '   AND FOL_SECUENCIA = ' + IntToStr(vlSecuencia) ;

                    vlQryRenueva:= GetSQLQuery(vlstrSQLRenueva, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
                    try
                      if vlQryRenueva <> nil then
                      begin
                         objeto.vgNuevaDisposicion := vlQryRenueva.FieldByName('NUEVOCREDITO').AsInteger;
                         BarreArreglo(IntToStr(vlSecuencia), vlQryRenueva.FieldByName('NUEVOCREDITO').AsString,'','',0,7);
                      end;
                    finally
                      If vlQryRenueva <> Nil Then vlQryRenueva.Free;
                    end;
                  end;
                  // < RABA />

                  qyQuery.Next;
               End; //Del While
             End; //Del If
           finally
             qyQuery.Free;
           end;

           // SE DEBE VALIDAR QUE NO EXISTA NINGUN GRUPO SIN CREDITO RELACIONADO (NUEVO) PARA PORDER SALIR
           // Y PREGUNTAR SI SE QUIERE SALIR, SI ES ASÍ, ENTONCES SE DEBE CANCELAR TODO           
           If objeto.vgNuevaDisposicion > 0 then
              InterForma1.Salir;
           //FIN RABA ENE 2015
         End; //JJAR: FIN DE BLOQUE IF CONTINUA
       end;
   end;
end;

procedure TWCrResRee.BitBtn1Click(Sender: TObject);
Var     MPrAdeudo :TMPrAdeudo;
   Y          :  Integer;
   X          :  Integer;
begin
      X:=SGCRenRee.SG.Selection.Left;
      Y:=SGCRenRee.SG.Selection.Top;
      MPrAdeudo := TMPrAdeudo.Create(self);
      Try
         MPrAdeudo.Apli := Objeto.Apli;
         MPrAdeudo.ParamCre:= Objeto.ParamCre;
         MPrAdeudo.VGID_CREDITO := StrToInt(SGCRenRee.CellStr['ID_CREDITO',Y]);
         MPrAdeudo.VGfecha := Objeto.F_INICIO.AsDateTime;
         MPrAdeudo.Catalogo;
      Finally
         MPrAdeudo.Free;
      End;
end;

procedure TWCrResRee.ConsultaSectorPersona1Click(Sender: TObject);
Var Acreditado : TCrAcredit;
begin
      Acreditado := TCrAcredit.Create(Self);
      try
        Acreditado.GetParams(Objeto);
        Acreditado.ParamCre:=Objeto.ParamCre;
        Acreditado.FindKey([Objeto.Credito.ContratoCre.Contrato.ID_Titular.AsString]);
        Acreditado.Catalogo;
      finally
             Acreditado.Free;
      end;
end;

procedure TWCrResRee.CatlogodePersona1Click(Sender: TObject);
var  Persona : TPersona;
begin
      Persona := TPersona.Create(Self);
      try
        Persona.GetParams(Objeto);
        Persona.FindKey([Objeto.Credito.ContratoCre.Contrato.ID_Titular.AsString]);
        Persona.Catalogo;
      finally
             Persona.Free;
      end;
end;

procedure TWCrResRee.AcessoaProductoClick(Sender: TObject);
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
        Producto.FindKey([Objeto.Credito.ContratoCre.Producto.CVE_PRODUCTO_CRE.AsString]);
        Producto.Catalogo;
      finally
        Producto.Free;
      end;
end;

procedure TWCrResRee.Autorizaciones1Click(Sender: TObject);
var   VLContratoCre        : TCrCto; //Contrato Crédito
begin
      VLContratoCre := TCrCto.Create(Self);
      try
          VLContratoCre.GetParams(Objeto);
          VLContratoCre.ParamCre := Objeto.ParamCre;
          VLContratoCre.FindKey([Objeto.Credito.ID_CONTRATO.AsString,'1']);
          VLContratoCre.Acreditado.FindKey([Objeto.Credito.ContratoCre.Contrato.ID_Titular.AsString]);
          VLContratoCre.Catalogo;
      finally
          VLContratoCre.Free;
      end;
end;

procedure TWCrResRee.BitBtn2Click(Sender: TObject);
var
   MDispDet  :TMDispDet;
   Y          :  Integer;
   X          :  Integer;
begin
    X:=SGCRenRee.SG.Selection.Left;
    Y:=SGCRenRee.SG.Selection.Top;
    MDispDet := TMDispDet.Create(self);
    try
       MDispDet.Apli :=Objeto.Apli;
       MDispDet.ParamCre := Objeto.ParamCre;
       MDispDet.VGID_CREDITO := StrToInt(SGCRenRee.CellStr['ID_CREDITO',Y]);
       MDispDet.Catalogo;
    finally
       MDispDet.Free;
    end;
end;

procedure TWCrResRee.edF_INICIOChange(Sender: TObject);
begin
   EliminaTodo;
end;

procedure TWCrResRee.dtpF_INICIOChange(Sender: TObject);
begin
     EliminaTodo;
end;

procedure TWCrResRee.rgTipoOperClick(Sender: TObject);
  Procedure ControlImportes(sOnOff: String);
  Begin
     if sOnOff = 'V' THEN Begin
        //edIMP_AUTORIZADO.Enabled := True;       edIMP_AUTORIZADO.Color := clWindow;
        edIMP_INCREMENTO.Enabled := True;       edIMP_INCREMENTO.Color := clWindow;
     end
     else Begin
        //edIMP_AUTORIZADO.Enabled := False;      edIMP_AUTORIZADO.Color := clBtnFace;
        edIMP_INCREMENTO.Enabled := False;      edIMP_INCREMENTO.Color := clBtnFace;
     end;
     Objeto.IMP_AUTORIZADO.AsFloat := 0;
     Objeto.IMP_INCREMENTO.AsFloat := 0;
     Objeto.IMP_OPERACION.AsFloat := 0;
     VLADEUDO_DISP := 0;
  end;
begin
   ClearGrid(strgrdCreditos,0);
   ConfGrid(strgrdCreditos);

   if rgTipoOper.ItemIndex = 1 then Lleylindest.visible:=true
   else Lleylindest.visible:=false;

   iedID_CONTRATO_DEST.Text:='';
   edNombreAcreditado_dest.Text:='';
   iedDISPONIBLE_AUT.Text:='';
   edCVE_PRODUCTO_dest.Text:='';
   edDESC_PRODUCTO_dest.Text:='';

   if rgTipoOper.ItemIndex = 0 then Begin
      bbGenRenRee.Caption := 'Genera '  + C_MSG_RENOVA;
      Label27.Caption     := 'Importe ' + C_MSG_RENOVA; // RABA 22 JUN 2011
//      ControlImportes('F');
      ControlImportes('V'); //HERJA SE HABILITA PARA RENOVACION MARZO 2013
      //CrtFiltroContratoDest('V', 'F', 'V', 'V'); // RABA 09 JUN 2011
      CrtFiltroContratoDest('V', 'F', 'V', 'V', 'F', 'F'); // RABA FEB 2015 SE MODIFICA PARA CONSIDERAR MISMO RIESGO COMUN U OBLIGADO SOLIDARIO
   end
   else if rgTipoOper.ItemIndex = 1 then Begin
      bbGenRenRee.Caption := 'Genera '  + C_MSG_REESTRUC;
      Label27.Caption     := 'Importe ' + C_MSG_REESTRUC; // RABA 22 JUN 2011
//      ControlImportes('F');
      // </ RABA >
      // 17 MAY 2011
//      ControlImportes('V');
      ControlImportes('F'); //HERJA SE DESHABILITA PARA REESTRUCTURAS ABRIL  2013
      //CrtFiltroContratoDest('V', 'V', 'F', 'V');  // RABA 09 JUN 2011
      CrtFiltroContratoDest('V', 'V', 'F', 'V', 'F', 'F'); // RABA FEB 2015 SE MODIFICA PARA CONSIDERAR MISMO RIESGO COMUN U OBLIGADO SOLIDARIO

      Objeto.ContratoCre.BuscaWhereString := Objeto.ContratoCre.BuscaWhereString +
                                             ' AND (CR_CONTRATO.ID_CONTRATO IN ( '+
                                             ' SELECT ID_CONTRATO FROM CONTRATO WHERE ID_TITULAR = ' +
                                               Objeto.VLACREDITADO + ' ) ) '+
                                             ' AND(CR_CONTRATO.CVE_MONEDA = '+ Objeto.VLMONEDA + ' )';
      Objeto.ContratoCre.FilterString := Objeto.ContratoCre.BuscaWhereString;
      // < RABA />
   end
   else if rgTipoOper.ItemIndex = 2 then Begin
      bbGenRenRee.Caption := 'Genera '  + C_MSG_CONV_MOD;
      Label27.Caption     := 'Importe ' + C_MSG_CONV_MOD; // RABA 22 JUN 2011
      ControlImportes('V');
      //CrtFiltroContratoDest('V', 'F', 'F', 'V'); // RABA 09 JUN 2011
      CrtFiltroContratoDest('V', 'F', 'F', 'V', 'F', 'F'); // RABA FEB 2015 SE MODIFICA PARA CONSIDERAR MISMO RIESGO COMUN U OBLIGADO SOLIDARIO
      Objeto.ContratoCre.BuscaWhereString := Objeto.ContratoCre.BuscaWhereString +
                                             ' AND (CR_CONTRATO.ID_CONTRATO IN ( '+
                                             ' SELECT ID_CONTRATO FROM CONTRATO WHERE ID_TITULAR = ' +
                                               Objeto.VLACREDITADO + ' ) ) '+
                                             ' AND(CR_CONTRATO.CVE_MONEDA = '+ Objeto.VLMONEDA + ' )';
      Objeto.ContratoCre.FilterString := Objeto.ContratoCre.BuscaWhereString;
   end
   else if rgTipoOper.ItemIndex = 3 then Begin
      bbGenRenRee.Caption := 'Genera '  + C_MSG_EVEN_ACEL;
      Label27.Caption     := 'Importe ' + C_MSG_EVEN_ACEL; // RABA 22 JUN 2011
      ControlImportes('F');
      //CrtFiltroContratoDest('V', 'F', 'F', 'V'); // RABA 09 JUN 2011
      CrtFiltroContratoDest('V', 'F', 'F', 'V', 'F', 'F'); // RABA FEB 2015 SE MODIFICA PARA CONSIDERAR MISMO RIESGO COMUN U OBLIGADO SOLIDARIO
      Objeto.ContratoCre.BuscaWhereString := Objeto.ContratoCre.BuscaWhereString +
                                             ' AND (CR_CONTRATO.ID_CONTRATO IN ( '+
                                             ' SELECT ID_CONTRATO FROM CONTRATO WHERE ID_TITULAR = ' +
                                               Objeto.VLACREDITADO + ' ) ) '+
                                             ' AND (CR_CONTRATO.CVE_MONEDA = '+ Objeto.VLMONEDA + ' )';
      Objeto.ContratoCre.FilterString := Objeto.ContratoCre.BuscaWhereString;
   end//;
   // </ ASTECI: AARJ >
   // Se agregó el siguiente bloque y ControlImportes('F') se invoca con el
   // mismo parámetros de como se hace para cuando la operación es RE o RS
   // edID_CESIONExit(self); es para forzar que se presenten las cantidades
   // en  edIMP_OPERACION necesaria para grabar registro en CR_RR_CREDITO
   else if rgTipoOper.ItemIndex = 4 then
   begin
      bbGenRenRee.Caption := 'Genera '  + C_MSG_LIQ_COLOC;
      Label27.Caption     := 'Importe ' + C_MSG_LIQ_COLOC; // RABA 22 JUN 2011
      ControlImportes('F');
      //CrtFiltroContratoDest('V', 'F', 'F', 'V');  // RABA 09 JUN 2011
      CrtFiltroContratoDest('V', 'F', 'F', 'V', 'F', 'F'); // RABA FEB 2015 SE MODIFICA PARA CONSIDERAR MISMO RIESGO COMUN U OBLIGADO SOLIDARIO
      // </ RABA >
      // 24 MAY 2011 -  Se quita el campo de crédito o cesión y se cambia por un
      // grid en donde se seleccionan los créditos
      // edID_CESIONExit(self);
      // < RABA />
   end;
   // < ASTECI: AARJ />

   CrtBanderas(rgTipoOper.ItemIndex);  //RABA ENE 2015 ACTUALIZACIÓN B-6

   bbeliminaCredito.Enabled:= not(rgTipoOper.ItemIndex = 1) ; // FJR 20.09.2012 en las reestructuras, o todos o ninguno.

   if Objeto.ContratoCre.Active then
      iedID_CONTRATO.OnExit(self);
end;

function TWCrResRee.ValidaTipOperAutorizacion: String;
Var vlResult : String;
begin
   vlResult:= 'F';
   if rgTipoOper.ItemIndex = 0 then
      vlResult:= Objeto.ContratoCre.B_APL_RENOVACION.AsString
   else if rgTipoOper.ItemIndex = 1 then
      vlResult:= Objeto.ContratoCre.B_REESTRUCTURA.AsString
   else if rgTipoOper.ItemIndex = 2 then
      vlResult:= Objeto.ContratoCre.B_APL_CONVE_MOD.AsString
   else if rgTipoOper.ItemIndex = 3 then
      vlResult:= Objeto.ContratoCre.B_APL_EVEN_ACEL.AsString//;
// </ ASTECI:AARJ >
// 03 FEB 10
// Implementacion else para grTipoOper.ItemIndex = 4 Liquidacion / Colocación
// Esta regla de negocio es para emular la primer validación que hacen para
// los demás tipos de operaciones 
   else if rgTipoOper.ItemIndex = 4 then
      vlResult:= Objeto.ContratoCre.B_REVOLVENTE.AsString;
// <ASTECI:AARJ />
   ValidaTipOperAutorizacion:= vlResult;
end;


procedure TWCrResRee.edF_INICIOEnter(Sender: TObject);
begin
  Objeto.setCurrentDate(Objeto.F_INICIO);
end;

procedure TWCrResRee.edF_INICIOExit(Sender: TObject);
begin
    Objeto.F_INICIO.GetFromControl;
    if Objeto.F_INICIO.AsDateTime <> Objeto.getCurrentDate then
      if MessageDlg( coUpdFValor, mtConfirmation, [mbYes, mbCancel], 0 ) = mrYes then
      begin
        Objeto.setCurrentDate(Objeto.F_INICIO);
//        AdeudoDisp;
        // </ RABA > 24 JUN 2011
        if Objeto.ContratoCre.Active then
           iedID_CONTRATO.OnExit(self);
        // < RABA />
      end else
        Objeto.F_INICIO.AsDateTime := Objeto.getCurrentDate;
      //
    // </ RABA > 24 JUN 2011
    // Esta validación ya no aplica, toda vez que ahora se muestran todos los
    // créditos en un grid y ahí se valida la fecha de operación vs fecha de
    // inicio de cada uno de los créditos.
    //Valida que la Fecha Valor no se menor a la Fecha de inicio de la disposición
    {
    if Objeto.F_INICIO.AsDateTime < Objeto.Credito.F_INICIO.AsDateTime then
    Begin
       ShowMessage(coValFechaIni);
       AsignaFVAlor(Objeto.Apli.DameFechaEmpresa);
    end;
    }
    // < RABA />
end;

procedure TWCrResRee.AsignaFVAlor(peFecha: TDateTime);
begin
  dtpF_INICIO.DateTime := peFecha;
  Objeto.F_INICIO.AsDateTime := peFecha;
end;

procedure TWCrResRee.edIMP_INCREMENTOExit(Sender: TObject);
begin
    Objeto.IMP_INCREMENTO.GetFromControl;
    if Objeto.IMP_INCREMENTO.AsFloat < 0 then Begin
       ShowMessage('El incremento debe de ser mayor a 0');
       edIMP_INCREMENTO.SetFocus;
    end
    else if Objeto.IMP_INCREMENTO.AsFloat > 0 then
    begin
      If Objeto.ContratoDest.Active then
      begin
        if ValidaImporteDisponible(Objeto.IMP_INCREMENTO.AsFloat) = 'F' then
        begin
           Objeto.IMP_INCREMENTO.AsFloat := 0;
           edIMP_INCREMENTO.SetFocus;
        end
      end
      else
      begin
        ShowMessage(C_MSG_AUT_DEST);
        iedID_CONTRATO_DEST.SetFocus;
        //vgImp_Incremento:= Objeto.IMP_INCREMENTO.AsFloat;
      end;

    end;

    //</ RABA > 24 MAY 2011
    // EL INCREMENTO DEJA DE SER POR CADA CREDITO SELECCIONADO Y SE CONVIERTE
    // EN UN INCREMENTO PARA LA NUEVA REESTRUCTURA
    //else Begin
    //   Objeto.IMP_AUTORIZADO.AsFloat := Objeto.IMP_INCREMENTO.AsFloat + VLADEUDO_DISP;
    //   Objeto.IMP_OPERACION.AsFloat := Objeto.IMP_AUTORIZADO.AsFloat;
    //end;
    // < RABA />
end;


procedure TWCrResRee.iedID_CONTRATOExit(Sender: TObject);
begin
   Objeto.IMP_AUTORIZADO.AsFloat := 0;
   Objeto.IMP_OPERACION.AsFloat := 0;
   Objeto.IMP_INCREMENTO.AsFloat := 0;
   VLADEUDO_DISP := 0;

   // </ RABA >
   // 17 MAY 2011- el filtro se comenta ya que se cambia por un grid con todos
   // los créditos del contrato origen, por lo que ya no es necesaria la búsqueda
   //Objeto.Credito.FilterString     := '(CR_CREDITO.SIT_CREDITO = ''AC'' AND CR_CREDITO.ID_CONTRATO = ' +
   //                                    Objeto.ContratoCre.ID_CONTRATO.AsString + ')';
   //Objeto.Credito.BuscaWhereString := Objeto.Credito.FilterString;
   // < RABA />


   // </ RABA >
   // 17 MAY 2011- Se llena la grid de créditos con todos los créditos AC
   // de la autorización de origen indicada

   if iedID_CONTRATO.Text <> '' then
   begin
      MuestraDatos;

      //HERJA JUNIO 2014
      try
        GetSQLStr('SELECT NVL(PKGCRPERIODO.FncObtChqCte(NULL, '+Trim(iedID_CONTRATO.Text)+', ''AD'', ''CR''),0) AS CHEQ FROM DUAL',
                   Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
                  'CHEQ',vlTempCheq, True);
        ieCheqLiqu.Text := vlTempCheq;
      except
        ieCheqLiqu.Text := '0';
      end;
   end;

   if SGCRenRee.SG.RowCount = 1 then
      Objeto.IMP_NUEVADISP.AsFloat := 0;

   BuscaCambiosLinea;

   InterForma1.NextTab(btCONTRATO);
   // < RABA />
end;

procedure TWCrResRee.btCONTRATO_DESTClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRESREE_AUTORD',True,True) then
   begin
     Objeto.ContratoDest.ShowAll := True;
     if Objeto.ContratoDest.Busca then
     begin
        InterForma1.NextTab(btCONTRATO_DEST);
     end;
   end;
end;

procedure TWCrResRee.iedID_CONTRATO_DESTExit(Sender: TObject);
var vcontinua:boolean;

begin
  If iedID_CONTRATO_DEST.Text <> '' then
  begin

     //HERJA ABRIL 2013
     vcontinua:=false;

     if (rgTipoOper.ItemIndex=0) then
     begin
        vcontinua:=true;
{        if (Trim(iedID_CONTRATO.Text) <> Trim(iedID_CONTRATO_DEST.Text)) then
           vcontinua:=true
        else
           ShowMessage('Las lineas deben de ser diferentes');}
     end;

     if (rgTipoOper.ItemIndex=1) then
     begin
        if (Trim(iedID_CONTRATO.Text) <> Trim(iedID_CONTRATO_DEST.Text)) then
           vcontinua:=true
        else
           ShowMessage('Las lineas deben de ser diferentes');
     end;

     if (rgTipoOper.ItemIndex=3) then
     begin
        if (Trim(iedID_CONTRATO.Text) = Trim(iedID_CONTRATO_DEST.Text)) then
           vcontinua:=true
        else
           ShowMessage('Las lineas deben de ser iguales');
     end;

     if (rgTipoOper.ItemIndex=4) then
     begin
        if (Trim(iedID_CONTRATO.Text) = Trim(iedID_CONTRATO_DEST.Text)) then
           vcontinua:=true
        else
           ShowMessage('Las lineas deben de ser iguales');
     end;


    if vcontinua then
    begin
      Objeto.ContratoDest.ObtenDisponibleAut(
                          objeto.ContratoDest.ID_CONTRATO.AsString,
                          objeto.ContratoDest.FOL_CONTRATO.AsString);
      if Objeto.ContratoCre.Active then
         if edIMP_INCREMENTO.Enabled then
            edIMP_INCREMENTO.SetFocus
         else
            strgrdCreditos.SetFocus;
    end
    else
    begin
       iedID_CONTRATO_DEST.Text := '';
       edNombreAcreditado_dest.Text := '';
       iedDISPONIBLE_AUT.Text := '';
       edCVE_PRODUCTO_dest.Text := '';
       edDESC_PRODUCTO_dest.Text := '';
    end;

    //HERJA JUNIO 2014
    try
        GetSQLStr('SELECT NVL(PKGCRPERIODO.FncObtChqCte(NULL, '+Trim(iedID_CONTRATO_DEST.Text)+', ''AD'', ''AB''),0) AS CHEQ FROM DUAL',
                   Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
                  'CHEQ',vlTempCheq, True);
        ieCheqAbono.Text:= vlTempCheq;
    except
        ieCheqAbono.Text := '0';
    end;

    // RABA FEB 2015 SE BUSCA SI LOS CAMBIOS APLICAN A TODA LA LÍNEA DE CREDITO
    BuscaCambiosLinea;
  end;
end;

procedure TWCrResRee.ilIDCONTRATO_destEjecuta(Sender: TObject);
begin
   if Objeto.ContratoDest.FindKey([ilIDCONTRATO_dest.Buffer,'1']) then begin
      InterForma1.NextTab(iedID_CONTRATO_DEST);
   End

end;

procedure TWCrResRee.ConfGrid(SGrid: TStringGrid);
begin
   With SGrid Do
   Begin
      ColCount := 15;

      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;

      ColWidths[CO_COL_CHECK] := 33;
      ColWidths[CO_COL_IDCREDITO] := 43;
      ColWidths[CO_COL_F_INICIO] := 65;
      ColWidths[CO_COL_F_VNTO] := 65;
      ColWidths[CO_COL_F_TRAS] := 65;
      ColWidths[CO_COL_IMP_DISP] := 85;
      ColWidths[CO_COL_ADE_TOT] := 85;
      ColWidths[CO_COL_REDESC] := 43;
      ColWidths[CO_COL_GARANTIA] := 85;
      ColWidths[CO_COL_RR] := 42;
      ColWidths[CO_COL_PAGOS] := 62;
      ColWidths[CO_COL_VIGVEN] := 61;
      ColWidths[CO_COL_GRACIA] := 61;
      ColWidths[CO_COL_IMPIMPAGADO] := 55;
      ColWidths[CO_COL_PCT] := 65;
    End;
end;

procedure TWCrResRee.MuestraDatos;
var
    vlstrSQLCred, vlstrSQLRedesc : String;
    vlstrSQLRR :String;
    vlQryCred, vlQryRedesc  : TQuery;
    vlQryRR : TQuery;
    nRow, x : Integer;
    PPSaldoVenc  : Double;
    PPSaldoTotal : Double;
    PPAdeudoTotal: Double;
    PPSdo_IntVig : Double;
    vlTipoRenueva: String;
    vlPorcentaje : Double;
begin
 If (iedID_CONTRATO_DEST.Text <> '') and (iedID_CONTRATO.Text <> '') then
 begin
  ClearGrid(strgrdCreditos,0);
  ConfGrid(strgrdCreditos);
  vlstrSQLCred :=
                 ' SELECT'+coCRLF+
                 ' CRC.ID_CREDITO,'+coCRLF+
//                 ' CRC.IMP_DISPUESTO,'+coCRLF+  // RABA DIC 2014 ACTUALIZACIÓN B-6
                 ' CRC.IMP_CREDITO AS IMP_DISPUESTO,'+coCRLF+      // RABA EL DISPUESTO NO NECESARIAMENTE ES IGUAL QUE EL IMPORTE DEL CRÉDITO,
                 ' CRC.SDO_INSOLUTO,'+coCRLF+
                 ' CRC.SDO_VIG_TOTAL,'+coCRLF+
                 ' CRC.F_INICIO,'+coCRLF+
                 ' CRC.F_VENCIMIENTO,'+coCRLF+
                 ' CRC.F_TRASPASO_VENC'+coCRLF+
                 ' FROM   CR_CREDITO CRC'+coCRLF+
                 ' WHERE  CRC.ID_CONTRATO ='+objeto.ContratoCre.ID_CONTRATO.AsString +coCRLF+
                 ' AND  CRC.SIT_CREDITO = ''AC'''+coCRLF;
  vlQryCred := GetSQLQuery(vlstrSQLCred, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
  If Assigned(vlQryCred) Then
     With vlQryCred Do
     Begin
         nRow := 0;
         While Not Eof Do
         Begin
           // se obtienen importes
           Objeto.LlenaEncabezado(FieldByName('ID_CREDITO').AsString,
                                  Objeto.F_INICIO.AsString,
                                  PPSaldoVenc,
                                  PPSaldoTotal,
                                  PPSdo_IntVig );

           //HERJA ABRIL 2012 SE AUMENTA BANDERA DE IMPORTES VENCIDOS
           IF (PPSaldoVenc > 0) THEN
              strgrdCreditos.Cells[CO_COL_IMPIMPAGADO,nRow] := 'SI'
           else
              strgrdCreditos.Cells[CO_COL_IMPIMPAGADO,nRow] := 'NO';

           // se busca si hay redescuentos para cada crédito
           vlstrSQLRedesc:= 'SELECT SIT_CREDITO FROM CR_FND_CREDITO '+coCRLF+
                            ' WHERE ID_CREDITO ='+ FieldByName('ID_CREDITO').AsString +coCRLF+
                            '   AND SIT_CREDITO IN (''AC'',''NA'')';

           vlQryRedesc:= GetSQLQuery(vlstrSQLRedesc, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
           try
             If vlQryRedesc <> Nil Then
             begin
               strgrdCreditos.Cells[CO_COL_REDESC,nRow] := 'SI';
               vlQryRedesc.Close;
             end
             Else
             begin
               strgrdCreditos.Cells[CO_COL_REDESC,nRow] := 'NO';
             end;
           finally
             If vlQryRedesc <> Nil Then vlQryRedesc.Free;
           end;

           // se busca si hay garantías aplicadas
           vlstrSQLRedesc:= ' SELECT FN_IMPORTE_GARANTIAS('+FieldByName('ID_CREDITO').AsString +
                            ', ''TODOS'', ''TODOS'', ''TODOS'', TO_DATE(''' +
//</RABA > 30 AGO 2011      Objeto.F_INICIO.AsString + ''', ''DD/MM/YYYY''), ''FO'', '''', '''') IMP_GARANTIAS '+ // RABA 30/08/2011 SE AGREGA PARAMETRO TIPO_IMPORTE
                            Objeto.F_INICIO.AsString + ''', ''DD/MM/YYYY''), ''FO'', '''', '''', '''') IMP_GARANTIAS '+
                            ' FROM DUAL';
           vlQryRedesc:= GetSQLQuery(vlstrSQLRedesc, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
           try
             If vlQryRedesc <> Nil Then
             begin
               strgrdCreditos.Cells[CO_COL_GARANTIA,nRow] := Format(CFORMAT_DINERO,[vlQryRedesc.FieldByName('IMP_GARANTIAS').AsFloat]);
               vlQryRedesc.Close;
             end
             Else
             begin
               strgrdCreditos.Cells[CO_COL_GARANTIA,nRow] := '0.00';
             end;
           finally
             If vlQryRedesc <> Nil Then vlQryRedesc.Free;
           end;

           // se busca si el crédito esta en algún proceso de reestructura
           vlstrSQLRR := ' SELECT NVL(MAX(FOL_GRUPO_RENUEVA),0) FOLIOGRUPO ' +
                         ' FROM CR_RR_CREDITO WHERE ID_CRED_RENOVADO = ' + FieldByName('ID_CREDITO').AsString +
                         ' AND SIT_RENUEVA <> ''CA'' AND ID_CRED_RENUEVA > 0 ' +
                         ' AND TIPO_DISPOSICION = ''RS'' ';
           vlQryRR := GetSQLQuery(vlstrSQLRR, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
           try
             if (vlQryRR <> nil) and (vlQryRR.FieldByName('FOLIOGRUPO').AsInteger > 0) then
             begin
               vlstrSQLRR := ' SELECT TIPO_DISPOSICION, ID_CRED_RENUEVA, SIT_RENUEVA ' +
                             ' FROM CR_RR_CREDITO WHERE ID_CRED_RENOVADO = ' + FieldByName('ID_CREDITO').AsString +
                             ' AND FOL_GRUPO_RENUEVA = ' + vlQryRR.FieldByName('FOLIOGRUPO').AsString;
               vlQryRR := GetSQLQuery(vlstrSQLRR, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
               if (vlQryRR <> nil) then
                 strgrdCreditos.Cells[CO_COL_RR,nRow] := vlQryRR.FieldByName('ID_CRED_RENUEVA').AsString
               else
                 strgrdCreditos.Cells[CO_COL_RR,nRow] := '0';
             end
             Else
               strgrdCreditos.Cells[CO_COL_RR,nRow] := '0';
           finally
             if vlQryRR <> nil then vlQryRR.Free;
           end;


           //HERJA - VALIDACION PARA QUE VALIDE QUE NO HALLA PAGOS INTERMEDIOS EN REESTRUCTURAS FECHA-VALOR
           vlHoy:=Objeto.Apli.DameFechaEmpresa;
           vlFValor:=StrToDate(edF_INICIO.Text);

           IF ( vlHoy <> vlFValor )  THEN
           BEGIN
              vlsql:= ' SELECT COUNT(*) COUNT FROM CR_TRANSACCION WHERE ID_CREDITO = ' + FieldByName('ID_CREDITO').AsString +
                      '  AND SIT_TRANSACCION = ''AC'' ' +
                      '  AND ID_TRANS_CANCELA IS NULL ' +
                      '  AND CVE_OPERACION IN ( ' + C_CVE_OPERACION + ' ) ' +
                      '  AND F_VALOR > TO_DATE('''+edF_INICIO.Text+''',''DD/MM/YYYY'') ';

              GetSQLInt(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'COUNT',vlCount,False);
              if vlCount > 0 then
              begin
                 strgrdCreditos.Cells[CO_COL_PAGOS,nRow] := 'SI';
              end
              else
                 strgrdCreditos.Cells[CO_COL_PAGOS,nRow] := 'NO';
           END
           ELSE
              strgrdCreditos.Cells[CO_COL_PAGOS,nRow] := 'NO';

           //RABA ABRIL 2013 SE AGREGA EN REESTRUCTURAS Y RENOVACIONES SI SE GENERA EN CARTERA VENCIDA O NO
           if ( rgTipoOper.ItemIndex = 0 ) OR (rgTipoOper.ItemIndex = 1) then
           begin
             // RABA OCTUBRE 2014 ACTUALIZACION B6

             vlstrSQLRR := ' SELECT CASE WHEN PKGCRTRASCARTERA.FUNISVENCIDO(' + FieldByName('ID_CREDITO').AsString + ', ' +
                           '  TO_DATE('''+edF_INICIO.Text+''',''DD/MM/YYYY''), '''+ Objeto.B_APL_TODA_LIN.AsString +''', NULL)= ''V'' THEN ''VENCIDO'' ELSE ''VIGENTE'' END ISVENCIDO FROM DUAL';

             vlQryRR := GetSQLQuery(vlstrSQLRR, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
             try
               if (vlQryRR <> nil) then
                   strgrdCreditos.Cells[CO_COL_VIGVEN,nRow] := vlQryRR.FieldByName('ISVENCIDO').AsString
               else
                   strgrdCreditos.Cells[CO_COL_VIGVEN,nRow] := '';
             finally
               if vlQryRR <> nil then vlQryRR.Free;
             end;

//             strgrdCreditos.Cells[CO_COL_VIGVEN,nRow] := OperacionEsVencida( FieldByName('ID_CREDITO').AsString, edF_INICIO.Text);
             // FIN RABA
           end
           else
             strgrdCreditos.Cells[CO_COL_VIGVEN,nRow] := 'NA';
           // FIN RABA

           //RABA FEB 2015 ACTUALIZACIÓN B-6
           if ( rgTipoOper.ItemIndex = 0 ) OR (rgTipoOper.ItemIndex = 1) then
           begin
             vlstrSQLRR := 'SELECT CASE WHEN PKGCRTRASCARTERA.FUNHAYPERIODOGRACIA(' + FieldByName('ID_CREDITO').AsString + ', ' +
                            '  TO_DATE('''+edF_INICIO.Text+''',''DD/MM/YYYY'')) = ''V'' THEN ''SI'' ELSE ''NO'' END HAYPERIODOGRACIA FROM DUAL ';

             vlQryRR := GetSQLQuery(vlstrSQLRR, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
             try
               if (vlQryRR <> nil) then
                   strgrdCreditos.Cells[CO_COL_GRACIA,nRow] := vlQryRR.FieldByName('HAYPERIODOGRACIA').AsString
               else
                   strgrdCreditos.Cells[CO_COL_GRACIA,nRow] := '';
             finally
               if vlQryRR <> nil then vlQryRR.Free;
             end;
           end
           else
             strgrdCreditos.Cells[CO_COL_VIGVEN,nRow] := 'NA';
           //FIN RABA

           // RABA OCT 2014 SE AGREGA PORCENTAJE DEL ADEUDO TOTAL CON RELACIÓN AL IMPORTE DISPUESTO DE LA LINEA DE CREDITO ORIGINAL
           //vlPorcentaje := (PPSaldoTotal / Objeto.ContratoCre.IMP_AUTORIZADO.AsFloat)*100;
           vlPorcentaje := (PPSaldoTotal / Objeto.ContratoCre.IMP_DISPUESTO.AsFloat)*100;
           // FIN RABA

           strgrdCreditos.Cells[CO_COL_CHECK,nRow]     := CO_UNCHECKED;
           strgrdCreditos.Cells[CO_COL_IDCREDITO,nRow] := FieldByName('ID_CREDITO').AsString;
           strgrdCreditos.Cells[CO_COL_F_INICIO,nRow]  := FieldByName('F_INICIO').AsString;
           strgrdCreditos.Cells[CO_COL_F_VNTO,nRow]    := FieldByName('F_VENCIMIENTO').AsString;
           strgrdCreditos.Cells[CO_COL_F_TRAS,nRow]    := FieldByName('F_TRASPASO_VENC').AsString;
           strgrdCreditos.Cells[CO_COL_IMP_DISP,nRow]  := Format(CFORMAT_DINERO,[FieldByName('IMP_DISPUESTO').AsFloat]);
//           strgrdCreditos.Cells[CO_COL_INT_VIG,nRow]   := Format(CFORMAT_DINERO,[PPSdo_IntVig]);
//           strgrdCreditos.Cells[CO_COL_SDO_VIG,nRow]   := Format(CFORMAT_DINERO,[FieldByName('SDO_VIG_TOTAL').AsFloat]);
//           strgrdCreditos.Cells[CO_COL_ADE_VENC,nRow]  := Format(CFORMAT_DINERO,[PPSaldoVenc]);
//           strgrdCreditos.Cells[CO_COL_ADE_TOT,nRow]   := Format(CFORMAT_DINERO,[PPSaldoTotal + PPSaldoVenc]);
           strgrdCreditos.Cells[CO_COL_ADE_TOT,nRow]   := Format(CFORMAT_DINERO,[PPSaldoTotal]);
           strgrdCreditos.Cells[CO_COL_PCT,nRow]       := Format(CFORMAT_DINERO,[vlPorcentaje]);
           Inc(nRow);
           Next;
         End;
         If (nRow = 0) Then strgrdCreditos.RowCount := 1
         Else strgrdCreditos.RowCount := nRow;

         Free;
     End;
 End;
end;

procedure TWCrResRee.strgrdCreditosDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
    Bmp : TBitmap;            // Imagen para COL_CHECK
    sTexto: String;           // Texto que va a imprimir en la celda actual
    Alineacion: TAlignment;   // Alineación que le vamos a dar al texto
    iAnchoTexto: Integer;     // Ancho del texto a imprimir en pixels
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin
     If (gdSelected In State) Then Canvas.Brush.Color := clWhite;

     Canvas.Font.Color := clBlack;

     If (trim(Cells[CO_COL_GARANTIA,ARow]) <> '0.00')
       or (Cells[CO_COL_REDESC,ARow] = 'SI')
       or (trim(Cells[CO_COL_RR,ARow]) <> '0')
       or (StrToDate(trim(Cells[CO_COL_F_INICIO,ARow])) > Objeto.F_INICIO.asDateTime)
       or ( (Trim(Cells[CO_COL_F_TRAS,ARow])<> '') and (StrToDate(trim(Cells[CO_COL_F_TRAS,ARow])) > Objeto.F_INICIO.asDateTime)  )
       or (trim(Cells[CO_COL_PAGOS,ARow]) = 'SI')
       then
     begin
        Canvas.Font.Color := clRed;
     end;

     Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);

     if (ACol = CO_COL_F_VNTO)or(ACol = CO_COL_REDESC)or(ACol = CO_COL_F_INICIO)or(ACol = CO_COL_F_TRAS)or(ACol = CO_COL_PAGOS)
        OR (ACol = CO_COL_IMPIMPAGADO) OR (ACol = CO_COL_GRACIA) then
        Alineacion := taCenter;

     if (ACol = CO_COL_IMP_DISP) or (ACol = CO_COL_PCT)
         or(ACol = CO_COL_ADE_TOT) or(ACol = CO_COL_GARANTIA) then
        Alineacion := taRightJustify;

     if (ACol = CO_COL_IDCREDITO)or(ACol = CO_COL_RR) then
        Alineacion := taLeftJustify;

     sTexto := Cells[ACol,ARow];
     Canvas.FillRect( Rect );
     iAnchoTexto := Canvas.TextWidth( sTexto );

     case Alineacion of
       taLeftJustify:  Canvas.TextOut( Rect.Left + 5, Rect.Top + 2, sTexto );
       taCenter:       Canvas.TextOut( Rect.Left + ( ( Rect.Right - Rect.Left ) - iAnchoTexto ) div 2, Rect.Top + 2, sTexto );
       taRightJustify: Canvas.TextOut( Rect.Right - iAnchoTexto - 2, Rect.Top + 2, sTexto );
     end;

     If (ACol = CO_COL_CHECK) Then
     Begin
        Bmp := TBitmap.Create;
        If (Cells[CO_COL_CHECK,ARow] = CO_CHECKED) Then



           ImageList.GetBitmap(1,Bmp)
        Else
           ImageList.GetBitmap(0,Bmp);
        Canvas.Draw(Rect.Left,Rect.Top,Bmp);
        Bmp.FreeImage;
        Bmp.Free;
     End;
   End;
end;

procedure TWCrResRee.strgrdCreditosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  nCol, nRow : Integer;
  bContinua  : Boolean;
begin
   objeto.IMP_INCREMENTO.GetFromControl;
   strgrdCreditos.MouseToCell(X, Y, nCol, nRow);
   if nCol = CO_COL_CHECK then
   begin
     // se valida que exista una Autorización destino seleccionada
     If Objeto.ContratoDest.Active then
     begin
        bContinua := True;
        // se valida que no existan garantias aplicadas o redescuentos o proceso de reestructur
        // o que la fecha de operación sea menor a la fecha de inicio del crédito
        If (trim(strgrdCreditos.Cells[CO_COL_GARANTIA,nRow]) <> '0.00') then    begin
          ShowMessage('El registro no puede ser seleccionado: Existen garantias aplicadas.');
          bContinua := False;
        end;

        If (strgrdCreditos.Cells[CO_COL_REDESC,nRow] = 'SI') then   begin
          ShowMessage('El registro no puede ser seleccionado: Existen redescuentos.');
          bContinua := False;
        end;

        if (trim(strgrdCreditos.Cells[CO_COL_RR,nRow]) <> '0') then   begin
          ShowMessage('El registro no puede ser seleccionado: Ya existe un proceso de reestructura.');
          bContinua := False;
        end;

        if (StrToDate(trim(strgrdCreditos.Cells[CO_COL_F_INICIO,nRow])) > Objeto.F_INICIO.asDateTime) then   begin
          ShowMessage('El registro no puede ser seleccionado: La fecha de operación es menor a la fecha de inicio de la disposición.');
          bContinua := False;
        end;

        if ((trim(strgrdCreditos.Cells[CO_COL_F_TRAS,nRow])<> '') and (StrToDate(trim(strgrdCreditos.Cells[CO_COL_F_TRAS,nRow])) > Objeto.F_INICIO.asDateTime)) then
        begin
          ShowMessage('El registro no puede ser seleccionado: La fecha de operación es menor a la fecha de traspaso a vencido.');
          bContinua := False;
        end;

        If (strgrdCreditos.Cells[CO_COL_PAGOS,nRow] = 'SI') then   begin
          ShowMessage('Existen Pagos Intermedios entre la Fecha Valor y el Día de Hoy, hay que eliminarlos.');
          bContinua := False;
        end;

        If bContinua then
        begin
           // se afecta el importe de la nueva disposición + o -
            With (strgrdCreditos) Do
              If (Cells[CO_COL_CHECK, nRow] <>  CO_NOTCHECK) Then
              Begin
                 If (Cells[CO_COL_CHECK, nRow] = CO_CHECKED) Then
                 begin
                    objeto.IMP_INCREMENTO.GetFromControl;
                    Cells[CO_COL_CHECK, nRow] := CO_UNCHECKED;
                    Objeto.IMP_NUEVADISP.AsFloat := Objeto.IMP_NUEVADISP.AsFloat - StrToFloat(quitacomas(trim(Cells[CO_COL_ADE_TOT,nRow])));
                    if Objeto.IMP_NUEVADISP.AsFloat < 0 then
                       Objeto.IMP_NUEVADISP.AsFloat := 0 ;
                 end
                 Else
                 begin
                    if ValidaImporteDisponible(StrToFloat(quitacomas(trim(Cells[CO_COL_ADE_TOT,nRow])))) = 'V' then
                       begin
                          Cells[CO_COL_CHECK, nRow] := CO_CHECKED;
                       end
                    else
                       strgrdCreditos.SetFocus;
                 end;
              End;
        end;
     end
     Else
     begin
       ShowMessage(C_MSG_AUT_DEST);
       iedID_CONTRATO_DEST.SetFocus;
     End;
   end;

end;

function TWCrResRee.ValidaCredSelec: String;
var
  VLSalida   :  String;
  vlRow, vlMax : Integer;
begin
  VLSalida := 'F';   //No hay créditos seleccionados en la grid
  vlMax := strgrdCreditos.RowCount;
  vlRow := 0;

  while (vlRow < vlMax) and (VLSalida = 'F') do
  begin
    if strgrdCreditos.Cells[CO_COL_CHECK, vlRow] = CO_CHECKED then
       vlSalida := 'V';
    inc(VlRow);
  end;
  ValidaCredSelec := VLSalida;
end;

//FJR 10.09.2012 CODIGO COMENTADO
{procedure TWCrResRee.CalculaImportes;
var PPSaldoVenc  : Double;
    PPSaldoTotal : Double;
    PPAdeudoTotal: Double;
begin}

   // </ RABA > 24 MAY 2011
   // Este código estaba en el  edID_CESIONExit, el control edID_CESION se
   // sustituyó por la grid  strgrdCreditos
   // < RABA />

   //   AdeudoDisp;
   //IF Objeto.Credito.ID_CREDITO.AsString <> '' THEN BEGIN
   //  VLADEUDO_DISP := 0;
     //IF wBCalcula THEN BEGIN   //FJR
     //     Objeto.LlenaEncabezado(Objeto.Credito.ID_CREDITO.AsString,Objeto.F_INICIO.AsString,PPSaldoVenc,PPSaldoTotal,VLSDO_INTVIG );
     //REVISAR CON ARACELI DUPLICA SALDO VENCIDO
     //     VLADEUDO_DISP := PPSaldoTotal + PPSaldoVenc;
     //     VLADEUDO_DISP := PPSaldoTotal;
     //END  //FJR
     //ELSE // FJR
     //     VLADEUDO_DISP := BuscaImporteEnGrid(Objeto.Credito.ID_CREDITO.AsString, CO_COL_ADE_TOT) ;; //FJR

     // </ ASTECI:AARJ>
     // En la siguiente sección de código, se agregó el caso de cuando
     // se elige la operación Liquidación-Colocación , por lo que la asignación
     // Objeto.IMP_AUTORIZADO.AsFloat := VLADEUDO_DISP es la misma que se
     // aplica para RE y RS
     // Código original:
     // if ( rgTipoOper.ItemIndex = 0 ) or( rgTipoOper.ItemIndex = 1 ) then
     //if ( rgTipoOper.ItemIndex = 0 ) or( rgTipoOper.ItemIndex = 1 ) or ( rgTipoOper.ItemIndex = 4 ) then
     // < ASTECI:AARJ />
     //   Objeto.IMP_AUTORIZADO.AsFloat := VLADEUDO_DISP
     //else if ( rgTipoOper.ItemIndex = 2 ) or( rgTipoOper.ItemIndex = 3 ) then
     //   begin  // FJR
           //if wBCalcula then   //FJR
           //   Objeto.IMP_AUTORIZADO.AsFloat := PPSaldoTotal//;
           //else  // FJR
     //         Objeto.IMP_AUTORIZADO.AsFloat := VLADEUDO_DISP ; // FJR
     //   end ; //FJR

     //Objeto.IMP_OPERACION.AsFloat := Objeto.IMP_AUTORIZADO.AsFloat + Objeto.IMP_INCREMENTO.AsFloat;
   //END; //FJR
//end;
//FJR 03.09.2012 CODIGO COMENTADO

function TWCrResRee.QuitaComas(PPCadena: String): String;
var
   vlIndex, vlTotal : Integer;
   vlCar,vlRenglon: String;
begin
   vlTotal:= Length (Trim(PPCadena));
   vlRenglon:='';

   for vlIndex := 1 to vlTotal do
   begin
      vlCar:= Copy(PPCadena, vlIndex, 1);
      if  vlCar <> ',' then vlRenglon:=vlRenglon+vlCar;
   end;

   try
      QuitaComas:=vlRenglon;
   except
      QuitaComas:='0' ;
   end ;
end;

function TWCrResRee.ValidaImporteDisponible(
  ppValorIncremento: Double): String;
begin
  if Objeto.IMP_NUEVADISP.AsFloat + ppValorIncremento <= Objeto.ContratoDest.DISPONIBLE_AUT.AsFloat then
  begin
    Objeto.IMP_NUEVADISP.AsFloat := Objeto.IMP_NUEVADISP.AsFloat + ppValorIncremento;
    Result := 'V'
  end
  else
  begin
    If MessageDlg(C_MSG_NO_DISP + ' ¿Desea continuar?',   mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    begin
      Objeto.IMP_NUEVADISP.AsFloat := Objeto.IMP_NUEVADISP.AsFloat + ppValorIncremento;
      Result := 'V';
    end
    else
      Result := 'F';
  end;

end;

procedure TWCrResRee.edIMP_INCREMENTOEnter(Sender: TObject);
begin
  Objeto.IMP_NUEVADISP.AsFloat := Objeto.IMP_NUEVADISP.AsFloat - Objeto.IMP_INCREMENTO.AsFloat;
  Objeto.IMP_INCREMENTO.AsFloat := 0;
end;

procedure TWCrResRee.InterForma1BtnSalirClick(Sender: TObject);
var
   vlstrSQLRenueva : String;
   vlQryRenueva    : TQuery;
   VLBContinua     : Boolean;     //RABA PARA CONTROLAR LA SALIDA
begin
   VLBContinua := False;
   // si se agregaron creditos a la grid SGCRenRee.SG entonces hay registros
   // en la base de datos en la tabla CR_RR_CREDITO
   // si los registros de esa tabla del grupo indicado no tienen un ID de crédito
   // en el campo ID_CRED_RENUEVA, quiere decir que no se dió de alta la disposición
   // por lo que al salir hay que eliminarlos para que no quede basura que pueda
   // intervenir en validaciones posteriores.
   if SGCRenRee.SG.RowCount > 1 then
   begin
     //vlstrSQLRenueva := ' SELECT MAX(ID_CRED_RENUEVA) AS NUEVOCREDITO ' +
     vlstrSQLRenueva := ' SELECT MIN(ID_CRED_RENUEVA) SINCREDITO, MAX(ID_CRED_RENUEVA) AS NUEVOCREDITO ' +
                        ' FROM CR_RR_CREDITO WHERE FOL_GRUPO_RENUEVA = ' + Objeto.FOL_GRUPO_RENUEVA.AsString;

     vlQryRenueva:= GetSQLQuery(vlstrSQLRenueva, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
     try
       // si no hay nueva disposición creada se eliminan los registros de CR_RR_CREDITO
       If vlQryRenueva.FieldByName('NUEVOCREDITO').AsInteger = 0 then
       begin
         EliminaTodo;
         VLBContinua := True;
       end
       Else
         if vlQryRenueva.FieldByName('SINCREDITO').AsInteger = 0 then
         begin
           If MessageDlg(C_MSG_SALIDA,   mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
              EliminaTodo;
         end;
     finally
       If vlQryRenueva <> Nil Then vlQryRenueva.Free;
     end;
   end
   else
     VLBContinua := True;



   If VLBContinua then
      InterForma1.Salir;
end;

function TWCrResRee.ValidaCreditosReestruc: String;
var
  vlstrQryCred : String;
  vlQryValida  : TQuery;
  vlSalida     : String;
begin
  vlSalida := 'V';  //Todos los creditos de todas la líneas estan seleccionadas
  vlstrQryCred := 'SELECT SEL.ID_CONTRATO, SEL.SELECCIONADOS, CRED.NUM_CREDITOS ' +
                  'FROM ' +
                  '(SELECT DISTINCT CR.ID_CONTRATO, COUNT(RR.ID_CRED_RENOVADO) SELECCIONADOS ' +
                  'FROM CR_RR_CREDITO RR, CR_CREDITO CR ' +
                  'WHERE RR.ID_CRED_RENOVADO = CR.ID_CREDITO ' +
                  '  AND RR.FOL_GRUPO_RENUEVA = ' + objeto.FOL_GRUPO_RENUEVA.AsString +
                  'GROUP BY CR.ID_CONTRATO) SEL, ' +
                  '(SELECT ID_CONTRATO, COUNT(ID_CREDITO) NUM_CREDITOS ' +
                  'FROM CR_CREDITO ' +
                  'WHERE ID_CONTRATO IN ' +
                  '  (SELECT DISTINCT CR.ID_CONTRATO FROM CR_RR_CREDITO RR, CR_CREDITO CR ' +
                  '   WHERE RR.ID_CRED_RENOVADO = CR.ID_CREDITO ' +
                  '     AND RR.FOL_GRUPO_RENUEVA = ' + objeto.FOL_GRUPO_RENUEVA.AsString + ') ' +
                  '  AND SIT_CREDITO = ''AC'' ' +
                  'GROUP BY ID_CONTRATO) CRED ' +
                  'WHERE SEL.ID_CONTRATO = CRED.ID_CONTRATO ';
  vlQryValida:= GetSQLQuery(vlstrQryCred, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
  try
    if vlQryValida <> nil then
      while not vlQryValida.Eof do
      begin
        if vlQryValida.FieldByName('SELECCIONADOS').AsInteger <> vlQryValida.FieldByName('NUM_CREDITOS').AsInteger then
        begin
          vlSalida := 'F';
        end;
        vlQryValida.Next;           
      end;
  finally
    if vlQryValida <> nil then vlQryValida.Free;
  end;

  ValidaCreditosReestruc := vlSalida;
end;

// FJR 26.07.2012 Asigna al combobox las claves de los tipos de reestructuraci'on.
procedure TWCrResRee.LlenaClavesRestruc ;
var Q      : TQuery ;
    SQLText: String ;
begin
   QCat.Close ;
   QCat.DataBaseName:= Objeto.Apli.DataBaseName;
   QCat.SessionName:= Objeto.Apli.SessionName;

{   FJR JULIO 2012 CONSULTA DE TIPO DE OBSERVACION ANTERIOR
    SQLText:= 'SELECT CR_CON_CAT_DATA.CVE_VALOR_ADIC, CR_CON_CAT_DATA.DESC_CLAVE '+
             'FROM CR_CON_CAT_DATA                  '+
             'WHERE CVE_CON_GPO_CAT = ''CAT_TIPO_LQ_DET'' '+
             'AND CAST(CAST(SUBSTR(CVE_CLAVE, 2, 2) AS INTEGER)  AS VARCHAR2(20) ) '+
             ' IN      '+
             ' (SELECT CVE_CLAVE  '+
             '  FROM CR_CON_CAT_DATA '+
             '  WHERE CVE_CON_GPO_CAT =''CAT_TIPO_LIQUIDA'' '+
             '  AND CVE_CLAVE = ''3'') ' ; }

   SQLText := 'SELECT CVE_CLAVE, CVE_VALOR_ADIC, DESC_CLAVE , '+
              'CAST(CAST(SUBSTR(CVE_CLAVE, 2, 2) AS INTEGER)  AS VARCHAR2(20) ) AS CVE_TIPO_LIQUIDA,     '+
              'CAST(''(''||CVE_VALOR_ADIC||'') - ''||DESC_CLAVE AS VARCHAR2(80)) AS DESCRIPCION          '+
              'FROM CR_CON_CAT_DATA                                                                      '+
              'WHERE CVE_CON_GPO_CAT = ''CAT_TIPO_LQ_DET''                                               '+
              'AND CAST(CAST(SUBSTR(CVE_CLAVE, 2, 2) AS INTEGER)  AS VARCHAR2(20) )                      '+
              'IN                                                                                        '+
              '  (SELECT CVE_CLAVE                                                                       '+
              '   FROM CR_CON_CAT_DATA                                                                   '+
              '   WHERE CVE_CON_GPO_CAT =''CAT_TIPO_LIQUIDA''                                            '+
              '   AND CVE_CLAVE = ''3'') ' ;

   QCat.SQL.Clear ;
   QCat.SQL.Add(SQLText) ;
   QCat.Open ;
   wwDBLookupComboDlg1.LookupTable:= QCat ;
   wwDBLookupComboDlg1.LookupField:= 'DESCRIPCION' ;

end ;

Procedure TWCrResRee.CreditoTipoRestruc(IdCredito: String) ;
begin
  EdCred.Text := IdCredito ;
  LlenaClavesRestruc ;
  Panel1.Visible:= True ;
end ;

procedure TWCrResRee.BtnOkClick(Sender: TObject);
var Id: String ;
    k, X, Y : Integer ;
    Procedure Interno_Refresca(Cred: Integer) ;
    begin
      AgregaEliminaCredito(Cred,'R');  //FJR 10.09.2012 comentado      BarreArreglo('', '', '', '', 0, 4) ;
     { Objeto.Credito.FindKey([IntToStr(Cred)]);
      AgregaEliminaCredito(Cred,'E');  //FJR 10.09.2012 comentado
      AgregaEliminaCredito(Cred,'A');}  //FJR 10.09.2012 comentado
    end ;
begin
   if Objeto.ValidaAccesoEsp('TCRESREE_OKBUR',True,True) then
   begin
     X:=SGCRenRee.SG.Selection.Left;
     Y:=SGCRenRee.SG.Selection.Top;
     Panel1.Visible:= False ;
     VGRESTRUC:= Copy(Trim(QCat.FieldByName('CVE_CLAVE').AsString), 1, 9) ;
     VGBAJA:= Copy(Trim(QCat.FieldByName('CVE_TIPO_LIQUIDA').AsString), 1, 1);
     VGCLAVE:= Trim(QCat.FieldByName('CVE_VALOR_ADIC').AsString) ;

     if ChBTodos.Checked then
        begin
          For k:= 2 to SGCRenRee.MaxRow do begin
            If SGCRenRee.CellStr['ID_CREDITO', k] <> '' then begin
               BarreArreglo(SGCRenRee.CellStr['ID_CREDITO', k], VGRESTRUC, VGBAJA, VGCLAVE, k, 6 ); //FJR 10.09.2012
               BarreArreglo(SGCRenRee.CellStr['ID_CREDITO', k], VGRESTRUC, VGBAJA, VGCLAVE, k, 2 );
            end;
          end ;

          BarreArreglo('', '', '', '', 0, 4);   //RABA ENE 2015

          For k:= 2 to SGCRenRee.MaxRow do begin
            If SGCRenRee.CellStr['ID_CREDITO', k] <> '' then
               Interno_Refresca(StrToInt(SGCRenRee.CellStr['ID_CREDITO', k]) ) ;
          end ;
        end
     else
        begin
           Id:= Trim(EdCred.Text) ;
           BarreArreglo(Id, VGRESTRUC, VGBAJA, VGCLAVE, Y , 6) ;   //FJR 10.09.2012
           BarreArreglo(Id, VGRESTRUC, VGBAJA, VGCLAVE, Y , 2) ;
           BarreArreglo('', '', '', '', 0, 4);  //RABA ENE 2015

           Interno_Refresca(StrToInt(Id) ) ;
        end ;

     //SGCRenRee.Refresh ;
   end;
end;

procedure TWCrResRee.BarreArreglo(Credito, Calif, Baja, Clave: String; Index, Accion: Integer);
var h, k, x: Integer;
    vlUlt :Integer;
    vlAux : String;
begin
       Case Accion of
           // RABA ENE 2015
           -2: begin
                 vlUlt := Length(Arr_Montos);
                 SetLength(Arr_Montos,vlUlt+1);
                 Arr_Montos[High(Arr_Montos)].C:= strgrdCreditos.Cells[CO_COL_IDCREDITO, Index] ;
                 Arr_Montos[High(Arr_Montos)].Disp:= QuitaComas(Trim(strgrdCreditos.Cells[CO_COL_IMP_DISP, Index]) ) ;
                 Arr_Montos[High(Arr_Montos)].Adeu:= QuitaComas(Trim(strgrdCreditos.Cells[CO_COL_ADE_TOT, Index]) ) ;
                 Arr_Montos[High(Arr_Montos)].Grup:='1';
               end ;
           //FIN RABA
           -1: begin
                 Memo1.Lines.Clear ;
                 For x:=0 to High(Arr_Montos) do begin
                     If Arr_Montos[x].Cve = '' then
                        vlAux := 'NULL'
                     else
                        vlAux := '''' + Arr_Montos[x].Cve + '''';

                     Memo1.Lines.Add('SELECT '+Arr_Montos[x].C+' AS ID_CREDITO, ' +
                                     vlAux+' AS CVE_OBSERVACION, '+Arr_Montos[x].Disp+' AS SDO_INSOLUTO, '+
                                     Arr_Montos[x].Adeu+' AS SDO_VIG_TOTAL, '+
                                     Arr_Montos[x].Grup+' AS AGRUPAR FROM DUAL ');
                     Memo1.Lines.Add('UNION ');
                 end ;
                 Memo1.Lines.Add(' SELECT -1 AS ID_CREDITO, NULL AS CVE_OBSERVACION, NULL AS SDO_INSOLUTO, NULL AS SDO_VIG_TOTAL, NULL AGRUPAR FROM DUAL ');
               end ;
{            0: begin  // Limpia
                 vlUlt := Length(Arr_Calif);
                 SetLength(Arr_Calif, vlUlt+1);
                 Arr_Calif[High(Arr_Calif)].C    := strgrdCreditos.Cells[CO_COL_IDCREDITO, Index];
                 Arr_Calif[High(Arr_Calif)].Cal  := '' ;
                 Arr_Calif[High(Arr_Calif)].Baja := '' ;
                 Arr_Calif[High(Arr_Calif)].Cve  := '' ;

                 BarreArreglo('', '', '', '', 0, 4);
               end ;
}
{            1: begin //Agrega creditos
                  For h:= 2 to SGCRenRee.MaxRow - 1 do begin
                      if SGCRenRee.CellStr['ID_CREDITO', h] <> '' then
                         begin
                            Arr_Calif[h].C := SGCRenRee.CellStr['ID_CREDITO', h] ;
                         end ;
                  end ;
                  BarreArreglo('', '', '', '', 0, 4)
               end ;
}
            //RABA ENE 2015 SE CREA NUEVO PROCESO PARA ACTUALIZAR LA SECUENCIA
            1: begin
                  For h:= 0 to Length(Arr_Montos)-1  do begin
                      If Arr_Montos[h].C = Credito then
                      begin
                         Arr_Montos[h].Grup := Calif;
                      end ;
                  End ;
               end ;

            2: begin// Agrega Calificacion a un credito especifico
                  For h:= 0 to Length(Arr_Montos)-1  do begin
                      If Arr_Montos[h].C = Credito then
                      begin
                         Arr_Montos[h].Cal  := Calif;
                         Arr_Montos[h].Baja := Baja;
                         Arr_Montos[h].Cve  := Clave;
                      end ;
                  End ;
               end ;

            3: begin // quitar registro
                  For h:=2 to StringGrid1.RowCount do begin
                      If Arr_Montos[h].C = Credito then
                         begin
                            Arr_Montos[h].C    := '-1';
                            Arr_Montos[h].Disp := '';
                            Arr_Montos[h].Adeu := '';
                            Arr_Montos[h].Cal  := '';
                            Arr_Montos[h].Baja := '';
                            Arr_Montos[h].Cve  := '';
                            Arr_Montos[h].Grup := '';
                         end ;
                  end ;
                  BarreArreglo('', '', '', '', 0, 4);
               end ;

            4: begin // Poblar grid
                   StringGrid1.RowCount:=1;
                   StringGrid1.ColCount:=1;
                   StringGrid1.RowCount := Length(Arr_Montos);
                   StringGrid1.ColCount:= 4;
                   For h:=0 to StringGrid1.RowCount do begin
                       StringGrid1.Cells[0, h]:= '';
                       StringGrid1.Cells[1, h]:= '';
                       StringGrid1.Cells[2, h]:= '';
                       StringGrid1.Cells[3, h]:= '';
                   end ;

                   For h:=0 to StringGrid1.RowCount-1  do begin
                         StringGrid1.Cells[0, h]:= Arr_Montos[h].C;
                         StringGrid1.Cells[1, h]:= Arr_Montos[h].Cal;
                         StringGrid1.Cells[2, h]:= Arr_Montos[h].Baja;
                         StringGrid1.Cells[3, h]:= Arr_Montos[h].Cve;
                   end ;
                   BarreArreglo('', '', '', '', 0, -1);
               end ;

{            5: begin // ejecuta actualizacion de creditos FJR 11.09.2012 ENTRO EN DESUSO, SUPLIDO POR EL ITEM 6
                    For h:=0 to StringGrid1.RowCount do begin
                       If StringGrid1.Cells[0, h] = '' then break ;
                       if StringGrid1.Cells[0, h] <> '-1' then
                          AgregaEliminaCreditoBD(StrToInt(StringGrid1.Cells[0, h]),'A', Trim(StringGrid1.Cells[1, h]), -1, 0, 0); //FJR 05.09.2012 Enviando -1 como discriminador anexo en paquete
                    end ;
               end ;}
            6: begin   //para la calificacion                                           //FJR 10.09.2012
                   AgregaEliminaCreditoBD(StrToInt(Credito),'A', Calif, 'F', -1, 0, 0); //FJR 10.09.2012
               end ;                                                               //FJR 10.09.2012

            //RABA ENE 2015 SE CREA NUEVO PROCESO PARA ACTUALIZAR LA NUEVA DISPOSICIÓN RELACIONADA
            7: begin
                  For h:= 0 to Length(Arr_Montos)-1  do begin
                      If Arr_Montos[h].Grup = Credito then   //RABA ENE 2015 Credito=Secuencia o agrupación de todos los créditos que se reestructuraton en una misma nueva disposición
                      begin
                         Arr_Montos[h].NewD := Calif;
                      end ;
                  End ;
               end ;
       End ;

end ;

procedure TWCrResRee.BtnCancelClick(Sender: TObject);
begin
   Panel1.Visible:= False ;
   Exit;
end;

procedure TWCrResRee.SGCRenReeDblClick(Sender: TObject);
var X, Y: Integer;
begin
// RABA DIC 2014 EL CÓDIGO SE PASA AL MENÚ EMERGENTE 
{   If rgTipoOper.ItemIndex = 1 then
      begin
         X:=SGCRenRee.SG.Selection.Left;
         Y:=SGCRenRee.SG.Selection.Top;
         ChBTodos.Checked:= False ;
         CreditoTipoRestruc(SGCRenRee.CellStr['ID_CREDITO', Y]) ;
      end ;
      }
end;

Function TWCrResRee.GeneraPC(Paso: integer): String ;
var d: Integer ;
    Texto: String ;
begin
   CASE PASO OF
       1: BEGIN
             Try
                 For d:=0 to Memo1.Lines.Count -1 do begin
                     If Memo1.Lines.Strings[d] <> '' then
                        Texto:= Texto + Memo1.Lines.Strings[d]+ coCRLF;
                 end ;
                Texto:= ' ('+Texto+') DUAL , ' + coCRLF ;
             Except
                Texto := '' ;
             End ;
          END ; //1
      2: BEGIN
            Texto := ' WHERE CRC.ID_CREDITO = DUAL.ID_CREDITO AND DUAL.ID_CREDITO > 0 ' ;
         END ;
   END ; // CASE

   Result:= Texto ;
end ;

procedure TWCrResRee.strgrdCreditosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var nRows: Integer ;
begin
   If ((ssCtrl in Shift) and (UpperCase(Char(Key))= 'E')) then  Begin //Ctrl + E
        for nRows := 0 to strgrdCreditos.RowCount - 1 do begin
           If strgrdCreditos.Cells[CO_COL_CHECK, nRows] = CO_CHECKED then Begin
              objeto.IMP_INCREMENTO.GetFromControl;
              strgrdCreditos.Cells[CO_COL_CHECK, nRows] := CO_UNCHECKED;
              try
                 Objeto.IMP_NUEVADISP.AsFloat := Objeto.IMP_NUEVADISP.AsFloat - StrToFloat(quitacomas(trim(strgrdCreditos.Cells[CO_COL_ADE_TOT,nRows])));
                 if Objeto.IMP_NUEVADISP.AsFloat < 0 then
                    Objeto.IMP_NUEVADISP.AsFloat := 0 ;
              except
                 Objeto.IMP_NUEVADISP.AsFloat :=0;
              end ;
//              strgrdCreditos.Cells[CO_COL_CHECK, nRows] := '' ;
           End
           Else Begin
                if ValidaImporteDisponible(StrToFloat(quitacomas(trim(strgrdCreditos.Cells[CO_COL_ADE_TOT,nRows])))) = 'V' then
                   begin
                      strgrdCreditos.Cells[CO_COL_CHECK, nRows] := CO_CHECKED ;
                   end
                else begin
                   strgrdCreditos.SetFocus;
                   Exit;
                end ;
           End ;
        end ;
   End ;
end;

Function TWCrResRee.BuscaImporteEnGrid(Credito: String; ImpBuscado: Integer): Double;  //FJR 10.09.2012 NUEVA FUNCION DE IMPORTES DE SALDOS
var vlImp: Double;
        l: Integer;
begin
   For l:=0 to High(Arr_Montos) do
   begin
      If Trim(Arr_Montos[l].C)= Trim(Credito) then begin
         Case ImpBuscado of
              CO_COL_IMP_DISP: vlimp:= StrToFloat(Arr_Montos[l].Disp) ;
              CO_COL_ADE_TOT : vlimp:= StrToFloat(Arr_Montos[l].Adeu) ;
         end ;
         break;
      end ;
   end ;
   Result:= vlImp ;
end ;

procedure TWCrResRee.Calificaccin1Click(Sender: TObject);
var X, Y: Integer;
begin
   If rgTipoOper.ItemIndex = 1 then
      begin
         X:=SGCRenRee.SG.Selection.Left;
         Y:=SGCRenRee.SG.Selection.Top;
         ChBTodos.Checked:= False ;
         CreditoTipoRestruc(SGCRenRee.CellStr['ID_CREDITO', Y]) ;
      end ;
end;

procedure TWCrResRee.Agrupador1Click(Sender: TObject);
var X, Y: Integer;
begin
   If (rgTipoOper.ItemIndex = 1) and (chB_VariasDisposiciones.Checked) then
      begin
         X:=SGCRenRee.SG.Selection.Left;
         Y:=SGCRenRee.SG.Selection.Top;
         EdCredSeq.Text := SGCRenRee.CellStr['ID_CREDITO', Y];
         edSecuencia.Text := SGCRenRee.CellStr['AGRUPAR', Y];
         paSecuencia.Visible := True;
      end ;
end;

procedure TWCrResRee.btnOKSecuenciaClick(Sender: TObject);
var
    Id: String ;
    X, Y : Integer ;

    Procedure Interno_Refresca(Cred: Integer) ;
    begin
      AgregaEliminaCredito(Cred,'R');
    end ;

begin
   if Objeto.ValidaAccesoEsp('TCRESREE_OKGPO',True,True) then    
   begin
     X:=SGCRenRee.SG.Selection.Left;
     Y:=SGCRenRee.SG.Selection.Top;
     paSecuencia.Visible:= False ;

     Id:= Trim(EdCredSeq.Text) ;
     Objeto.ActualizaSecuencia(Objeto.FOL_GRUPO_RENUEVA.AsInteger, StrToInt(ID), StrToInt(edSecuencia.Text));

     BarreArreglo(Id, edSecuencia.Text, '', '', Y , 1) ;
     BarreArreglo('', '', '', '', 0, 4);  //RABA ENE 2015

     Interno_Refresca(StrToInt(Id) ) ;
   end;
end;

procedure TWCrResRee.Button1Click(Sender: TObject);
begin
   paSecuencia.Visible:= False;
end;

procedure TCrResRee.ActualizaSecuencia(peIdCredito, peIdCredRenovado,
  peValorSec: Integer);
var
  STPUpdSecuencia : TStoredProc;
begin
  STPUpdSecuencia := TStoredProc.Create(Self);
  try
     with STPUpdSecuencia do
     begin
        STPUpdSecuencia.DatabaseName:= Apli.DatabaseName;
        STPUpdSecuencia.SessionName:= Apli.SessionName;
        STPUpdSecuencia.StoredProcName:='PKGCRPRORRCM.STPUPDSECUENCIA';
        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftInteger, 'PEFolGrupoRenueva', ptInput);
        Params.CreateParam(ftInteger, 'PEIDCredRenovado',  ptInput);
        Params.CreateParam(ftInteger, 'PEValorSecuencia',  ptInput);
        Params.CreateParam(ftString,  'PEBCOMMIT',         ptInput);
        Params.CreateParam(ftInteger, 'PSRESULTADO',       ptOutput);
        Params.CreateParam(ftString,  'PSTXRESULTADO',     ptOutput);

        // Se asignan parámetros
        ParamByName('PEFolGrupoRenueva').AsInteger  := peIdCredito;
        ParamByName('PEIDCredRenovado').AsInteger := peIdCredRenovado;
        ParamByName('PEValorSecuencia').AsInteger := peValorSec;
        ParamByName('PEBCOMMIT').AsString := 'V';

        ExecProc;

        If ParamByName('psResultado').AsInteger <> 0 then
        begin
          ShowMessage('Actualiza secuencia de reestructuta ' + IntToStr(PEIDCredRenovado) + ', Error [ ' +
                      ParamByName('psRESULTADO').AsString + '] ' +
                      ParamByName('psTxResultado').AsString);
        end;
        UnPrepare;
     end;
  finally
     STPUpdSecuencia.Free;
  end;
end;

  // </ RABA > 09 JUN 2011
procedure TWCrResRee.CrtFiltroContratoDest(sTitular, sTipoProdRS,
  sTipoProdRE, sMoneda, sRiesgoComun, sOSolidario: String);
begin
      Objeto.ContratoDest.FilterString := '(CR_CONTRATO.SIT_LINEA = ''AU'') ';

      If sTitular = 'V' then
         Objeto.ContratoDest.FilterString := Objeto.ContratoDest.FilterString +
                                             ' AND (CR_CONTRATO.ID_CONTRATO IN ( '+
                                             ' SELECT ID_CONTRATO FROM CONTRATO WHERE ID_TITULAR = ' +
                                              Objeto.VLACREDITADO + ' ) ) ';
      If sTipoProdRS = 'V' then
         Objeto.ContratoDest.FilterString := Objeto.ContratoDest.FilterString +
                                             ' AND (CR_CONTRATO.B_REESTRUCTURA=''V'' ) ' + //HERJA ABRIL2013
                                             ' AND (CR_CONTRATO.CVE_PRODUCTO_CRE IN ' +
                                             ' (SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO WHERE B_REESTRUCTURA=''V'') ) ';

      If sTipoProdRE = 'V' then
         Objeto.ContratoDest.FilterString := Objeto.ContratoDest.FilterString +
                                             ' AND (CR_CONTRATO.B_APL_RENOVACION=''V'' ) ' + //HERJA ABRIL2013
                                             ' AND (CR_CONTRATO.CVE_PRODUCTO_CRE IN ' +
                                             ' (SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO WHERE B_APL_RENOVACION=''V'') ) ';

      If sMoneda = 'V' then
         Objeto.ContratoDest.FilterString := Objeto.ContratoDest.FilterString +
                                             ' AND (CR_CONTRATO.CVE_MONEDA = '+ Objeto.VLMONEDA + ' )';

      If sRiesgoComun = 'V' then
         Objeto.ContratoDest.FilterString := Objeto.ContratoDest.FilterString +
                                             ' AND (CR_CONTRATO.ID_CONTRATO IN ( '+
                                             ' SELECT CTO.ID_CONTRATO  ' +
                                             ' FROM CR_ACREDITADO AC, CONTRATO CTO, CR_CONTRATO CRCTO ' +
                                             ' WHERE AC.ID_ACREDITADO = CTO.ID_TITULAR ' +
                                             '   AND CTO.ID_CONTRATO  = CRCTO.ID_CONTRATO ' +
                                             '   AND AC.CVE_GRUPO_ECO = ' + Objeto.vgGrupoEco +
                                             '   AND CRCTO.F_VENCIMIENTO >= ' + SQLFecha(Objeto.Apli.DameFechaEmpresa) +
                                             '   AND AC.SIT_ACREDITADO = ''AC'' ' +
                                             '   AND CTO.SIT_CONTRATO = ''AC''  ' +
                                             '   AND CRCTO.SIT_LINEA = ''AU'' ) ) ';
                                             
      If sOSolidario = 'V' then
               Objeto.ContratoDest.FilterString := Objeto.ContratoDest.FilterString +
                                             ' AND (CR_CONTRATO.ID_CONTRATO IN ( '+
                                             ' SELECT ID_CONTRATO FROM CONTRATO WHERE ID_TITULAR IN ' +
                                             '   (SELECT GP.ID_AVAL ' +
                                             '    FROM CR_GA_REGISTRO GR, CR_GA_GAR_CTO GC, CR_GA_PERSONALES GP ' +
                                             '    WHERE GR.ID_SOLICITUD = GC.ID_SOLICITUD ' +
                                             '      AND GR.ID_SOLICITUD = GP.ID_SOLICITUD ' +
                                             '      AND GR.CVE_GARANTIA = ''OBLSOL'' ' +
                                             '      AND GR.SIT_REG_GARANTIA = ''AC'' ' +
                                             '      AND GC.SIT_GAR_CTO = ''AC'' ' +
                                             '      AND GP.SIT_PERSONALES = ''AC'' ' +
                                             '      AND GC.ID_CONTRATO = ' + OBJETO.ContratoCre.ID_CONTRATO.AsString + ' ) ) ) ';

      Objeto.ContratoDest.BuscaWhereString := Objeto.ContratoDest.FilterString;
end;
  // < RABA /> 09 JUN 2011

procedure TWCrResRee.CrtBanderas(sOpcion: Integer);
begin
  Case sOpcion of
       0: begin
            rgTipoAcreditados.Visible := True;
            chB_VariasDisposiciones.Visible := False;
          end;
       1: begin
            rgTipoAcreditados.Visible := False;
            chB_VariasDisposiciones.Visible := True;
          end;
       else
          begin
            rgTipoAcreditados.Visible := False;
            chB_VariasDisposiciones.Visible := False;
          end;
  end;

  chB_VariasDisposiciones.Checked := False;
  rgTipoAcreditados.ItemIndex := 0;

end;

Function TWCrResRee.HaySinNuevoCredito: Boolean ;
var j: Integer ;
    b: Boolean ;
begin
      b:= False;
      For j:=0 to Length(Arr_Montos)-1 do begin
          If (Arr_Montos[j].C <> '-1')  and (Arr_Montos[j].NewD = '') Then
             b:= True ;
      end ;
      HaySinNuevoCredito:= b;
end ;

procedure TWCrResRee.bbObtDispClick(Sender: TObject);
begin
  if Objeto.ValidaAccesoEsp('TCRESREE_OBTDIS',True,True) then
  begin
    If (iedID_CONTRATO_DEST.Text <> '') and (iedID_CONTRATO.Text <> '') then
    begin
      Objeto.IMP_AUTORIZADO.AsFloat := 0;
      Objeto.IMP_OPERACION.AsFloat := 0;
      Objeto.IMP_INCREMENTO.AsFloat := 0;
      VLADEUDO_DISP := 0;

      if iedID_CONTRATO.Text <> '' then
      begin
         MuestraDatos;

         //HERJA JUNIO 2014
         try
           GetSQLStr('SELECT NVL(PKGCRPERIODO.FncObtChqCte(NULL, '+Trim(iedID_CONTRATO.Text)+', ''AD'', ''CR''),0) AS CHEQ FROM DUAL',
                      Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
                     'CHEQ',vlTempCheq, True);
           ieCheqLiqu.Text := vlTempCheq;
         except
           ieCheqLiqu.Text := '0';
         end;
      end;

      if SGCRenRee.SG.RowCount = 1 then
         Objeto.IMP_NUEVADISP.AsFloat := 0;
    end
    else
      ShowMessage(C_MSG_LIN_CRED);
  end;
end;

procedure TWCrResRee.BuscaCambiosLinea;
var
  vlTempAplica : string;
begin
    If (iedID_CONTRATO_DEST.Text <> '') and (iedID_CONTRATO.Text <> '') then
    begin
      try
        GetSQLStr('SELECT PKGCRTRASCARTERA.FUNAPLRSRETODALIN(' + iedID_CONTRATO.Text +', ' + iedID_CONTRATO_DEST.Text +') AS APLICA FROM DUAL',
                   Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
                  'APLICA',vlTempAplica, True);
        if vlTempAplica = 'V' then
        begin
           lbAplicaTodaLinea.Caption := 'Los cambios aplican a toda la línea de crédito';
           Objeto.B_APL_TODA_LIN.AsString := 'V';
        end
        else
        begin
           lbAplicaTodaLinea.Caption := 'Los cambios NO aplican a toda la línea de crédito';
           Objeto.B_APL_TODA_LIN.AsString := 'F';
        end;
      except
        lbAplicaTodaLinea.Caption := 'Error';
        Objeto.B_APL_TODA_LIN.AsString := 'F';
      end;

    end;
end;

procedure TWCrResRee.rgTipoAcreditadosClick(Sender: TObject);
begin
  // SOLO ACREDITADO
  If rgTipoAcreditados.ItemIndex = 0 then
  begin
     CrtFiltroContratoDest('V', 'F', 'V', 'V', 'F', 'F');
     Objeto.ContratoDest.Active := false;
     ieCheqAbono.Text := '0';
  end;

  // MISMO RIESGO COMUN
  If rgTipoAcreditados.ItemIndex = 1 then
  begin
     CrtFiltroContratoDest('F', 'F', 'V', 'V', 'V', 'F');
     Objeto.ContratoDest.Active := false;
     ieCheqAbono.Text := '0';
  end;
  
  // OBLIGADO SOLIDARIO
  If rgTipoAcreditados.ItemIndex = 2 then
  begin
     CrtFiltroContratoDest('F', 'F', 'V', 'V', 'F', 'V');
     Objeto.ContratoDest.Active := false;
     ieCheqAbono.Text := '0';
  end;
end;

end.
