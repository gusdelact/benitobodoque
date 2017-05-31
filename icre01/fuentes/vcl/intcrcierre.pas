{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
// Sistema         : Clase de CRCIERRE
// Fecha de Inicio : 09/12/2003
// Función forma   : Clase de CRCIERRE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
// Modificado      : 25 10 2004. Actualización de importes x acreditado
// Modificado      : 11 03 2005. Habilita Redescuento
// Modificado      : 06 05 2005. Modificación a polizas contables
// Modificado      : 27 06 2005. Se incorpora cierre por empresa
// Modificado      : 15 08 2005. Cierre de GYM
// Modificado      : 12 01 2006. Carga Buró de Crédito
// Modificado      : 20 01 2006. Digitaliza reportes
// Modificado      : 24 01 2006. Vencimientos de Excesos
// Modificado      : 28 04 2006. Validación a la digitalización de reportes
// Modificado      : 01 08 2006. Crédito en Linea
// Modificado      : 27 10 2006. Carga Consolidado de Adeudos
// Modificado      : 27 08 2007. SATV Carga de COINCRE a Cierre Fin de MES
// Modificado      : 25 10 2007. EASA CARGA INFORMACION PARA REPORTE DE INGRESOS
// Modificado      : 06 06 2008. EASA CARGA ACTIVA DISPOSICIONES LIQUIDADAS INCORRECTAMENTE
// Modificado      : 16 06 2008. ROUY CALCULO DE CONTRATOS CON ACTIVIDAD
// Modificado      : 17 07 2008. ROUY CALCULO DE CONTRATOS CON ACTIVIDAD
// Modificado      : 23 10 2008. ROUY SE INCLUYE PROCESO DE PYMES, SALDOS PROMEDIOS Y CARGA CUALITATIVA DE DATOS
// Modificado      : 01 05 2013. Traspaso entre carteras proyecto B-6

Unit IntCrcierre;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

InterProcesos,
IntParamCre,
IntGenCre,
uEnviaMsg,
IntMensaje,
IntMsgConfirm,
IntCrFiSoPa, Psock, NMFtp, NMsmtp,  //SASG4921 se agrega la libreria para el envio de correo  08/sep/2011
//<LOLS 19ENE2006 Digitalización de reportes>
IntMQProvDiaria,
IntMQrInCoCob,
IntMQrContVenc,
IntQrRecPrem,
IntMQrColoca, 
//</LOLS>
//<EASA DIGITALIZA AVISOS
IntMQrAvMail,
IntMQrAvMailDoc
// ENVIO DE AVISOS ****
,IntCrnotfact     //CIERRE DE FACTURACION ELECTRONICA
,IntCrmailven, QuickRpt, Qrctrls     //ENVIO DE ALERTAS FECHA DE VENCIMIENTO REAL JFOF FEBRERO 2013
;

const
  NOMPAKAGE = 'PKGCRCIERRE';
  //<LOLS 19ENE2006 Digitalización de reportes>
  coNumRepFTP = 21;
  //</LOLS>


Type
  TCrCierre= class;

  TWCrCierre=Class(TForm)
    InterForma1             : TInterForma;
    InterProcesos1: TInterProcesos;
    bbApertura: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edFECHA_CIERRE: TEdit;
    Label1: TLabel;
    NMFTP1: TNMFTP;
    DatabasePCONT: TDatabase;
    DatabaseDCONT: TDatabase;
    Label5: TLabel;
    NMSMTP1: TNMSMTP;
    Memo2: TQRMemo; //SASG4921  SE AGREGA PARA EL ENVIO DE CORREOS 08/SEP/2011
//  Button1: TButton;
//  dtpFecha: TDateTimePicker;
//  CheckBox1: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterProcesos1GeneraProceso(Sender: TObject;
      PPCveProceso: String; PPNumSecuencia: Integer; PPCveProcesoRel,
      PPCveFuncion: String; PPDigitaliza: Boolean; var PPComenta: String;
      var PPTodoOk: Boolean);
    procedure bbAperturaClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterProcesos1DespuesProceso(Sender: TObject);
    procedure NMFTP1ListItem(Listing: String);
//  procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    vcUltErr       : String;
    vcErrCritico   : Boolean;

    //<LOLS 19ENE2006 Digitalización de reportes>
    NumFilesFTP    : Integer;
    //</LOLS>


    Function ObtenFSiguienteCierre :  TDateTime;

    //<LOLS 19ENE2006 Digitalización de reportes>
    procedure FunDigitalizaRep( PFechaCierre : TDate; var PPComenta : String; var PPTodoOk : Boolean );
    //</LOLS>

    //<LOLS 19ENE2006 Digitalización de reportes>
    procedure  ValDigitalizaRep(PFechaCierre: TDate; NumFiles : Integer;
                                var PPComenta: String; var PPTodoOk: Boolean );
    //</LOLS>
    //<EASA     DIGITALIZA AVISOS 31.10.2007
    function  AbreConexion( pCURPATH: String): Boolean;    
    procedure FunDigAvColocacion( PFechaCierre : TDate; var PPComenta : String; var PPTodoOk : Boolean );
    procedure FunDigAvRemanentes( PFechaCierre : TDate; var PPComenta : String; var PPTodoOk : Boolean );
    procedure FunDigAvDevInteres( PFechaCierre : TDate; var PPComenta : String; var PPTodoOk : Boolean );
    procedure FunDigAvMoratorios( PFechaCierre : TDate; var PPComenta : String; var PPTodoOk : Boolean );
    //EASA>/
    Function ObtieneHost(peSistema: String): String; //SASG4921 Se agrega para el envio de correos 08/sep/2011
    procedure EnviaNotificacion ();
            // JFOF ENERO 2014
    procedure EnviaMailInicio(PNomProc : String);
    function ObtenDestinatarios : String;
    procedure ObtenPrimProc();

  public
    { Public declarations }
    Objeto : TCrCierre;
  end;
  //
  TCrCierre= class(TInterFrame)
  private
        Function  FunEsFinDeMes(pFecha : TDateTime) : Boolean;
        //
        Function  FuncValVenc(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FuncGenIntDiario(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FuncGenMoraDiario(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FuncCargaHisto(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FuncTraspasoICR(pFecha : TDateTime; var PPResultado: String) : Boolean;

        function  FuncContProvDiaria(pFecha : TDateTime; var PPResultado: String): Boolean;
        function  FuncContProvVenc(pFecha : TDateTime; var PPResultado: String): Boolean;
        function  FuncContaVencidos(pFecha : TDateTime; var PPResultado: String): Boolean;
        function  FuncContColocGtia(pFecha : TDateTime; var PPResultado: String): Boolean;
        function  FuncContPagoGtia(pFecha : TDateTime; var PPResultado: String): Boolean;
        function  FuncContTransacc(pFecha : TDateTime; var PPResultado: String): Boolean;
        function  FunContAgrComision(pFecha : TDateTime; var PPResultado: String): Boolean;
        function  FunContCapiGtia(pFecha : TDateTime; var PPResultado: String): Boolean;

        function  FuncAltaSeguimiento(pFecha : TDateTime; var PPResultado: String): Boolean;
        function  FunActFCierre(pFecha : TDateTime; var PPResultado: String): Boolean;
        function  FunFinanAdic(pFecha : TDateTime; var PPResultado: String): Boolean;
        function  FunEstadisticasHist(pFecha : TDateTime; var PPResultado: String): Boolean;
        function  FunDepuraCred(pFecha : TDateTime; var PPResultado: String): Boolean;
        function  FunGeneraTasas(pFecha : TDateTime; var PPResultado: String): Boolean;
        function  stpUpdImpDispuesto(pFecha : TDateTime; var PPComenta: String; var PPTodoOk: Boolean): Boolean;
        // Funciones para redescuento
        Function  FunValVencPasivo(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FunIntDiarioPasivo(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FunCargaHistPasiva(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FunCapitalizaPasivo(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FunGenLoteCont(pFecha : TDateTime; var PPResultado: String) : Boolean;
//        Function  FunContColoPasiva(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FunBorraDatosSAP(pFecha : TDateTime; pClaseDoc: String; var PPResultado: String) : Boolean; //EASA4011   12/02/2008
        Function  FunContColoPasiva(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FunContProvPasiva(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FunContProvRetPasiva(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FunContCapiPasiva(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FunContVenttoCAPasivo(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FunContVenttoINPasivo(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FunContVenttoCNPasivo(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FunContVenttoCNPVCI(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  stpCargaComPYME(pFecha: TDateTime; var PPResultado: String): Boolean;
        Function  FunCargaHistoCaucion(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FunCierreComis(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FunTrCartera(pFecha : TDateTime; var PPResultado: String) : Boolean;
        function  FunActCalAcred(pFecha: TDateTime;  var PPResultado: String): Boolean;
        function  FunActivBusqChqras(pFecha: TDateTime;  var PPResultado: String): Boolean; //EASA4011 11102005
        function  FunAltaFidSolCuotas(pFecha: TDateTime;  var PPResultado: String): Boolean; // SATV4766
        Function  FunGenEdoCta(pFecha : TDateTime; var PPResultado: String) : Boolean; // EASA4011 22/11/2005 GENERA ESTADO DE CUENTA
        function  FunActIntPagNiv(pFecha: TDateTime;  var PPResultado: String): Boolean; // SATV4766
        Function  stpContaPasiva(pFecha: TDateTime; var PPResultado: String): Boolean;//EASA4011   01/02/2008

        //<ROIM> 18/04/2006 GENERACIÓN DE CONCEPTOS Y PROVISIÓN VALORIZADOS
        function  FunGenProVal(pFecha : TDateTime; var PPResultado: String) : Boolean;
        function  FunGenConVal(pFecha : TDateTime; var PPResultado: String) : Boolean;
        //</ROIM>


        //<ROIM 19/05/2006 GENERACIÓN TRANSACCION DE GARANTÍAS
        Function FunGenTranGar(pFecha : TDateTime; var PPResultado: String) : Boolean;
        //</ROIM>


        //<LOLS 12ENE2006 Carga información de buro de crédito>
        procedure FunCargaBCCred( PFechaCierre : TDate; var PPComenta : String; var PPTodoOk : Boolean );
        //</LOLS>

        //
        //<EASA 20ENE2006 Vencimientos de excesos>
        Function  FunVtosExcesos( pFecha : TDateTime; var PPResultado: String) : Boolean;
        //</EASA>

        //<LOLS 01AGO2006 CREDITO EN LINEA Provisión de comisiones>
        procedure FunProvComision( PFechaCierre : TDate; var PPComenta : String; var PPTodoOk : Boolean );
        procedure FunBloqAuto( PFechaCierre : TDate; var PPComenta : String; var PPTodoOk : Boolean );
        //</LOLS>

        //<EASA 27OCT2006 PROCESOS CONSOLIDADO DE ADEUDOS>
        Function  FunConsAdeudo( pFecha : TDateTime; var PPResultado: String) : Boolean; //INSERTA REGISTRO
        Function  FunCapVigImp( pFecha : TDateTime; var PPResultado: String) : Boolean;  //CAPITAL VIGENTE E IMPAGDO ICRE
        Function  FunCapExig( pFecha : TDateTime; var PPResultado: String) : Boolean; // CAPITAL EXIGIBLE
        Function  FunCapNoExig( pFecha : TDateTime; var PPResultado: String) : Boolean; //CAPITAL NO EXIGIBLE
        Function  FunIntVigImp( pFecha : TDateTime; var PPResultado: String) : Boolean; //INTERES VIGENTE E IMPAGADO
        Function  FunIntExiNoE( pFecha : TDateTime; var PPResultado: String) : Boolean; //INTERES VENCIDO EXIGIBLE Y NO EXIGIBLE ICRE
        Function  FunCtasOrden( pFecha : TDateTime; var PPResultado: String) : Boolean; //CUENTAS DE ORDEN ICRE
        Function  FunVigImpInter( pFecha : TDateTime; var PPResultado: String) : Boolean; //SALDOS VIGENTES INTER
        Function  FunVdoNoEInter( pFecha : TDateTime; var PPResultado: String) : Boolean; //SALDOS VENCIDOS INTER
        //</EASA>


        //</JAGF 15DIC2010 REGENERACION DE CONSOLIDADO DE ADEUDOS>
        Function  FunRegenConsAdeudoSdo( pFecha : TDateTime; var PPResultado: String) : Boolean; //REGENERACION DE CONSOLIDADO DE ADEUDOS
        //</JAGF>

        //<SATV>
        Function  FunCargaCOINCRE( pFecha : TDateTime; peCveProceso, peCveUsuario :  String;
                                     var PPResultado: String) : Boolean; //CARGA DE COINCRE
        //</SATV>

        //<EASA 25OCT2007 PROCESOS REPORTE DE INGRESOS>
        Function  FunRepIngresos( pFecha : TDateTime; var PPResultado: String) : Boolean;
        //EASA>

        //<SATV 13FEB2008 PROCESO PARA CONTABILIDAD SAP>
        Function  FunGenMovtosSAP( pFecha : TDateTime; var PPResultado: String ) : Boolean; // GENERA MOVTOS EN DLLS
        Function  FunGenContaDllsICRE(pFecha: TDateTime; var PPResultado: String): Boolean; // TRASPAS A SAP MOVTOS EN DLLS
        //</SATV>

        //<EASA 06jun2008 ACTIVA DISPOSCIONES LIQUIDADAS POR VTO EN DIA INHÁBIL>
        Function  FunActivaDispLQ( pFecha : TDateTime; var PPResultado: String) : Boolean;
        //EASA>

        //<ROUY 16jun2008 CALCULA CONTRATOS CON ACTIVIDAD - IG>
        Function  FunIgCtoActiv( pFecha : TDateTime; var PPResultado: String) : Boolean;
        //ROUY>

        //<SATV  23OCT2008>
        Function  FunActSdoPyMES       ( pFecha : TDateTime; var PPResultado: String ) : Boolean;
        Function  FunActSdoPromedio    ( pFecha : TDateTime; var PPResultado: String ) : Boolean;
        Function  FunInsInfoCualitativa( pFecha : TDateTime; var PPResultado: String ) : Boolean;
        //</SATV>

        //<MOAA 26MAR2009>
        Procedure FunCargaBCeBureau( PFechaCierre : TDate;     var PPComenta  : String; var PPTodoOk : Boolean );
        //<MOAA>

        procedure EnviaError( Error : String  );


        //<DESARROLLO 20100908>  PLAZO RESIDUAL
        Function  FunCargaPlazoRes     ( pFecha : TDateTime; var PPResultado: String ) : Boolean;
        //<DESARROLLO 20100908>  FACTORAJE ELECTRÓNICO
//        Function  FunCierreFacEle      ( pFecha : TDateTime; var PPResultado: String ) : Boolean;
        //<DESARROLLO 20100922>  Anexo 8,9 Nafin
        Function  FunCargaAn89Naf      ( pFecha : TDateTime; var PPResultado: String ) : Boolean;
        //<DESARROLLO 20101110>  Carga de IVA Repecos
        Function  FunCargaIvaRepecos   ( pFecha : TDateTime; var PPResultado: String ) : Boolean;
        //<DESARROLLO 20101110>  Carga garantias liquidas RIRA4281
        Function  FunCargaGarLiq   ( pFecha : TDateTime; var PPResultado: String ) : Boolean;

        // < / RABA > 29 SEP 2011
        Function  FunContaPasivaED(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FunContaProvPasivaED(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FunContProvComPymeED(pFecha : TDateTime; var PPResultado: String) : Boolean;
        // < RABA />

        // HERJA AGOSTO 2012
        Function  FunHistoInteres(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FunAjustesContables(pFecha : TDateTime; var PPResultado: String) : Boolean;
        Function  FunCierreFactElect(pFecha : TDateTime; var PPResultado: String) : Boolean;
        // FIN HERJA AGOSTO 2012
        Function  FunEnvioAlertasVenc(pFecha : TDateTime; var PPResultado: String) : Boolean; // ENVIO DE ALERTAS FECHA DE VENCIMIENTO REAL JFOF FEBRERO 2013

        Function  FunCierrePremioPO(pFecha : TDateTime; var PPResultado: String) : Boolean;   // CIERRE DE PREMIO POSIBLE A OTORGAR JFOF ABRIL 2013

        // < / ROIM > abril 2013
        Function  FunContaPPO(pFecha : TDateTime; var PPResultado: String) : Boolean;
        // < ROIM /> abril 2013

        // </RABA> Mayo 2013
        Function  FunEnvioAlertaPSos(pFecha : TDateTime; var PPResultado: String) : Boolean;  //ENVIO DE CORREO ELECTRÓNICO CON CREDITOS QUE CUMPLEN CON PAGO SOSTENIDO
        // < RABA />

        // </RABA> Agosto 2016
        Function  FunCarteraPlazos(pFecha : TDateTime; var PPResultado: String) : Boolean;  //PROCESO QUE INSERTA EN CR_CONSO_CRED_ACC
        // < RABA />


        // </RABA> Mayo 2014
        //ENVIO DE CORREO ELECTRÓNICO CON CREDITOS EN DONDE EXISTE DIFERENCIA EN PERIODOS DE INTERES VS HISTO_INTERES
        Function  FunEnvioAlertHInt(pFecha : TDateTime; var PPResultado: String) : Boolean;
        // < RABA />

  protected
  public
        { Public declarations }

        ParamCre        : TParamCre;
        vgDatabaseDWHC  : TDatabase;
        vgDatabaseCONT  : TDatabase;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;

  var
  vgnumsecu, vgcvefunc, vgdescfun : String;  // jfof

procedure Delay(ms :  Longword);
function WinExecAndWait32(FileName:String; Visibility : integer; bWait : Boolean) : Boolean;

implementation

{$R *.DFM}

procedure Delay(ms :  Longword);
var
  TheTime : Longword;
begin
  TheTime := GetTickCount + ms;
 While GetTickCount < TheTime do
 Application.ProcessMessages;
end;

function WinExecAndWait32(FileName:String; Visibility : integer; bWait : Boolean) : Boolean;
var zAppName:array[0..512] of char;
    zCurDir:array[0..255] of char;
    WorkDir:String;
    StartupInfo:TStartupInfo;
    ProcessInfo:TProcessInformation;
begin
 Result := False;
 
 StrPCopy(zAppName,FileName);
 GetDir(0,WorkDir);
 StrPCopy(zCurDir,WorkDir);
 FillChar(StartupInfo,Sizeof(StartupInfo),#0);

 StartupInfo.cb := Sizeof(StartupInfo);
 StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
 StartupInfo.wShowWindow := Visibility;

 If CreateProcess(Nil, zAppName, { pointer to command line string }
                  Nil, { pointer to process security attributes }
                  Nil, { pointer to thread security attributes }
                  False, { handle inheritance flag }
                  CREATE_NEW_CONSOLE or { creation flags }
                  NORMAL_PRIORITY_CLASS,
                  Nil, { pointer to new environment block }
                  Nil, { pointer to current directory name }
                  StartupInfo, { pointer to STARTUPINFO }
                  ProcessInfo) Then { pointer to PROCESS_INFO }
  Begin
     // Si desea que espere a que se ejecute y termine el proceso, entonces...
     If (bWait) Then
       Begin
           Delay(3000);
           While (WaitforSingleObject(ProcessInfo.hProcess,1000) > 0) Do
            Begin
             Delay(1000);
             Application.ProcessMessages;
            End;
       End;
     Result := True;
  End;
end;

constructor TCrCierre.Create( AOwner : TComponent );
begin Inherited;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrcierre.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCierre.Destroy;
begin inherited;
end;


function TCrCierre.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCierre;
begin
   W:=TWCrCierre.Create(Self);
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


Function TCrCierre.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCierr.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

//
function TCrCierre.FunEsFinDeMes(pFecha: TDateTime): Boolean;
const coSqlBCarga = 'SELECT DECODE( %s, LAST_DAY( %s ), ''V'', ''F'' ) B_CARGA_BC FROM DUAL';
var   vlSqlCarga : String;
      vlBcarga   : String;
begin
  Result     := False;
  vlBcarga   := '';
  vlSqlCarga := Format( coSqlBCarga, [ SQLFecha( pFecha ), SQLFecha( pFecha ) ] );
  GetSQLStr( vlSqlCarga, Apli.DataBaseName, Apli.SessionName, 'B_CARGA_BC', vlBcarga, True );
  Result     := ( vlBcarga = 'V' );
end;
//

{--------------------------------------------------------------------------------------------------------------------
                        VALIDACION DE VENCIMEINTOS
--------------------------------------------------------------------------------------------------------------------}
Function TCrCierre.FuncValVenc(pFecha : TDateTime; var PPResultado: String) : Boolean;
var  StpValVenc : TStoredProc;
     StpValVencIR : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   FuncValVenc := False;
   try
     StpValVenc := TStoredProc.Create(Self);
     with StpValVenc do
     begin
        //Inicia el SPT
        StpValVenc.DatabaseName:= Apli.DatabaseName;
        StpValVenc.SessionName:= Apli.SessionName;
        //StpValVenc.StoredProcName:= NOMPAKAGE + '.STPVALIDAVENC';
        StpValVenc.StoredProcName:= NOMPAKAGE + '.STPVALVENCTOS';
        Params.Clear;
        Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput);
        Params.CreateParam( ftDate,   'PEFPROCESO',    ptInput);
        Params.CreateParam( ftString, 'PECVEUSUARIO',  ptInput);
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);
        Prepare;
        ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDateTime  := pFecha;
        ParamByName('PECVEUSUARIO').asString  := Apli.Usuario;
        ParamByName('PEBCOMMIT').asString     := 'V';
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
           vlResult := False;
        end;
        //end if;
     end;
   finally
        if StpValVenc <> nil then
           StpValVenc.Free;
        //end if;
   end;
   FuncValVenc := vlResult;
end;

{--------------------------------------------------------------------------------------------------------------------
                                     DESARROLLO 20100908>  PLAZO RESIDUAL
--------------------------------------------------------------------------------------------------------------------}
Function  TCrCierre.FunCargaPlazoRes     ( pFecha : TDateTime; var PPResultado: String ) : Boolean;
var
     vlResult     : Boolean;
     vlStpCargaPlazoRes : TStoredProc;
     VLDate: String;
begin
     vlResult := True;
     FunCargaPlazoRes := True;

     DateTimeToString(VLDate,'DD',pFecha);
     if StrToInt(VLDate) = 8 then
     begin
             vlResult := False;
             FunCargaPlazoRes := False;
             vlStpCargaPlazoRes := tStoredProc.Create(Self);
             Try
                with vlStpCargaPlazoRes do
                Begin
                  vlStpCargaPlazoRes.DatabaseName   := Apli.DataBaseName;
                  vlStpCargaPlazoRes.SessionName    := Apli.SessionName;
                  vlStpCargaPlazoRes.StoredProcName := 'PKGCRPLAZORESIDUAL' + '.STPCARGAPLAZOR';

                  Params.Clear;
                  Params.CreateParam(ftFloat,  'PEANIOMES',   ptInput);
                  Params.CreateParam(ftFloat,  'PSRESULTADO',   ptOutput);
                  Params.CreateParam(ftString, 'PSTXRESULTADO', ptOutput);

                  DateTimeToString(VLDate,'YYYYMM',pFecha);
                  ParamByName('PEANIOMES').asString    :=  VLDate;
                  ExecProc;

                  if ParamByName('PSRESULTADO').AsInteger = 0 then
                     vlResult := True
                  else
                      PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
                  //end if
                end;
             finally
                    if vlStpCargaPlazoRes <> nil then
                       vlStpCargaPlazoRes.Free;
                    //end if;
             end;
     end;

     FunCargaPlazoRes := vlResult;
end;

{--------------------------------------------------------------------------------------------------------------------
                                     DESARROLLO 20100922>  ANEXOS 8,9 NAFIN
--------------------------------------------------------------------------------------------------------------------}
Function  TCrCierre.FunCargaAn89Naf     ( pFecha : TDateTime; var PPResultado: String ) : Boolean;
var
     vlResult     : Boolean;
     vlStpCargaAn89Naf : TStoredProc;
     VLDate: String;
     vlSQL : String;
     num : Integer;
begin
     vlResult := True;
     FunCargaAn89Naf := True;

     DateTimeToString(VLDate,'DD',pFecha);
     vlsql := 'select count(dia_cierre) as num from	 BIT_PROCESO_DIAS where dia_cierre = ' + VLDate;
     GetSQLInt(vlsql,Apli.DataBaseName,Apli.SessionName,'num',num,False);

     if num > 0 then
     begin
             vlResult := False;
             FunCargaAn89Naf := False;
             vlStpCargaAn89Naf := tStoredProc.Create(Self);
             Try
                with vlStpCargaAn89Naf do
                Begin
                  vlStpCargaAn89Naf.DatabaseName   := Apli.DataBaseName;
                  vlStpCargaAn89Naf.SessionName    := Apli.SessionName;
                  vlStpCargaAn89Naf.StoredProcName := 'PKGCRRGLNAFIN' + '.STPCARGAANEXO89';

                  Params.Clear;
                  Params.CreateParam(ftFloat,'PEID_EMPRESA',ptInput);
                  Params.CreateParam( ftString, 'PEANIO_MES', ptInput );
                  Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
                  Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

                  DateTimeToString(VLDate,'YYYYMM',pFecha);
                  ParamByName('PEANIO_MES').asString    :=  VLDate;
                  ParamByName('PEID_EMPRESA').AsInteger := Apli.IdEmpresa;
                  ExecProc;

                  if ParamByName('PSRESULTADO').AsInteger = 0 then
                     vlResult := True
                  else
                      PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
                  //end if
                end;
             finally
                    if vlStpCargaAn89Naf <> nil then
                       vlStpCargaAn89Naf.Free;
                    //end if;
             end;
     end;

     FunCargaAn89Naf := vlResult;
end;


{--------------------------------------------------------------------------------------------------------------------
                                     <DESARROLLO 20101116>  CARGA IVA REPECOS
--------------------------------------------------------------------------------------------------------------------}
Function  TCrCierre.FunCargaIvaRepecos   ( pFecha : TDateTime; var PPResultado: String ) : Boolean;
var
     vlResult     : Boolean;
     vlSTPCargaIvaRepecos : TStoredProc;
     VLDate: String;
     vlSQL : String;
     num : Integer;
begin
     vlResult := True;
     FunCargaIvaRepecos := False;

     //CAMBIO  PARA IVA REPECOS ROIM    201008
     if FunEsFinDeMes(pFecha) then
     begin
         vlResult := False;
         try
             try
               vlSTPCargaIvaRepecos := TStoredProc.Create(Self);
               with vlSTPCargaIvaRepecos do
               begin
                    //Inicia el SPT
                    vlSTPCargaIvaRepecos.DatabaseName:= Apli.DatabaseName;
                    vlSTPCargaIvaRepecos.SessionName:= Apli.SessionName;
                    vlSTPCargaIvaRepecos.StoredProcName:= 'PKGCRIVAREPECOS.STPCIERREICREIVAREPECOS';
                    Params.Clear;
                    Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput);
                    Params.CreateParam( ftDate,   'PEFPROCESO',    ptInput);
                    Params.CreateParam( ftString, 'PECVEUSUARIO',  ptInput);
                    Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
                    Params.CreateParam( ftString, 'PEOPERACION',     ptInput);
                    Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
                    Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);
                    Prepare;
                    ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
                    ParamByName('PEFPROCESO').AsDateTime  := pFecha;
                    ParamByName('PECVEUSUARIO').asString  := Apli.Usuario;
                    ParamByName('PEBCOMMIT').asString     := 'V';
                    ParamByName('PEOPERACION').asString     := 'AMBOS';
                    ExecProc;

                    if ParamByName('PSRESULTADO').AsInteger = 0 then
                       vlResult := True
                    else
                        PPResultado := 'Error No: ' + ParamByName('PSRESULTADO').AsString + ' ' + ParamByName('PSTXRESULTADO').AsString;
                    //end if

               end;
             finally
                  if vlSTPCargaIvaRepecos <> nil then
                     vlSTPCargaIvaRepecos.Free;
                  //end if;
             end;
         except
               ShowMessage( 'Error IVA Repecos... Se puede continuar con el cierre ');
         end;

     end;
     //FIN CAMBIO IVA REPECOS

     FunCargaIvaRepecos := vlResult;
end;

{--------------------------------------------------------------------------------------------------------------------
                                     <DESARROLLO 20101116>  CARGA GARANTIAS LIQUIDAS
--------------------------------------------------------------------------------------------------------------------}
Function  TCrCierre.FunCargaGarLiq   ( pFecha : TDateTime; var PPResultado: String ) : Boolean;
var
     vlResult     : Boolean;
     vlSTPInsGarLiq : TStoredProc;
     VLDate: String;
     vlSQL : String;
     num : Integer;

     stpActivaSPEINormal : TStoredProc;   //HERJA MARZO 2015
begin
     vlResult := True;
     FunCargaGarLiq := False;

     //CAMBIO  PARA IVA REPECOS RIRA4281    17Nov 2010
     if FunEsFinDeMes(pFecha) then
     begin
         vlResult := False;
         try
             try
               vlSTPInsGarLiq := TStoredProc.Create(Self);
               with vlSTPInsGarLiq do
               begin
                    //Inicia el SPT
                    vlSTPInsGarLiq.DatabaseName:= Apli.DatabaseName;
                    vlSTPInsGarLiq.SessionName:= Apli.SessionName;
                    vlSTPInsGarLiq.StoredProcName:= 'PKGCRCONSOLIDADO1.STP_INS_GAR_LIQ';
                    Params.Clear;
                    Params.CreateParam( ftFloat,  'PEID_CREDITO',   ptInput);
                    Params.CreateParam( ftDate,   'PEF_OPERACION',    ptInput);
                    Params.CreateParam( ftString, 'PECVE_USU_ALTA',  ptInput);
                    Params.CreateParam( ftString, 'PSRESULTADO',     ptOutput);
                    Params.CreateParam( ftString, 'PSTX_RESULTADO',     ptOutput);
                    Prepare;
                    ParamByName('PEF_OPERACION').AsDateTime  := pFecha;
                    ParamByName('PECVE_USU_ALTA').asString  := Apli.Usuario;
                    ExecProc;

                    if ParamByName('PSRESULTADO').AsInteger = 0 then
                       vlResult := True
                    else
                        PPResultado := 'Error No: ' + ParamByName('PSRESULTADO').AsString + ' ' + ParamByName('PSTXRESULTADO').AsString;
                    //end if

               end;
             finally
                  if vlSTPInsGarLiq <> nil then
                     vlSTPInsGarLiq.Free;
                  //end if;
             end;
         except
         on e : exception do
            begin
               PPResultado := e.Message;
               vlResult := False ;
            end;
         end;

     end;

     //HERJA MARZO 2015
     //PROCEDIMIENTO PARA CAMBIAR DE MODALIDAD AL SPEI
      try
         try
            stpActivaSPEINormal := TStoredProc.Create(Self);
            with stpActivaSPEINormal do
            begin
               //Inicia el SPT
               stpActivaSPEINormal.DatabaseName:= Apli.DatabaseName;
               stpActivaSPEINormal.SessionName:= Apli.SessionName;
               stpActivaSPEINormal.StoredProcName:= 'PKG_SPEIBX.STPACTIVASPEINORMAL';
               Params.Clear;
               Params.CreateParam( ftString, 'PEmodoNormal',   ptInput);
               Params.CreateParam( ftString, 'PSResultado',    ptOutput);
               Params.CreateParam( ftString, 'PSTXResultado',  ptOutput);
               Prepare;
               ParamByName('PEmodoNormal').AsString  := 'V';
               ExecProc;

               if ParamByName('PSResultado').AsInteger = 0 then
                  vlResult := True
               else
                  vlResult := True
            end;
         finally
            if stpActivaSPEINormal <> nil then
               stpActivaSPEINormal.Free;
            end;
      except
         on e : exception do
            begin

               vlResult := True
            end;
         end;
     //FIN HERJA

     FunCargaGarLiq := vlResult;
end;

{--------------------------------------------------------------------------------------------------------------------
                                     DESARROLLO 20100908>  FACTORAJE ELECTRÓNICO
--------------------------------------------------------------------------------------------------------------------}
{Function  TCrCierre.FunCierreFacEle      ( pFecha : TDateTime; var PPResultado: String ) : Boolean;
var
     vlResult     : Boolean;
     vlStpCierreFacEle : TStoredProc;
begin
     vlResult := False;
     FunCierreFacEle := False;
     vlStpCierreFacEle := tStoredProc.Create(Self);
     Try
        with vlStpCierreFacEle do
        Begin
          vlStpCierreFacEle.DatabaseName   := Apli.DataBaseName;
          vlStpCierreFacEle.SessionName    := Apli.SessionName;
          vlStpCierreFacEle.StoredProcName := 'PKGCRCIERREFE' + '.STPCIERREFACTOARJE';

          Params.Clear;
          Params.CreateParam(ftFloat,  'PEIDEMPRESA',   ptInput);
          Params.CreateParam(ftDate,   'PEFPROCESO',    ptInput);
          Params.CreateParam(ftString, 'PECVEUSUARIO',  ptInput);
          Params.CreateParam(ftString, 'PEBCOMMIT',     ptInput);
          Params.CreateParam(ftFloat,  'PSRESULTADO',   ptOutput);
          Params.CreateParam(ftString, 'PSTXRESULTADO', ptOutput);


          ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
          ParamByName('PEFPROCESO').AsDateTime := pFecha;
          ParamByName('PECVEUSUARIO').asString := Apli.Usuario;
          ParamByName('PEBCOMMIT').asString    := 'V';
          ExecProc;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
              PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
          //end if
        end;
     finally
            if vlStpCierreFacEle <> nil then
               vlStpCierreFacEle.Free;
            //end if;
     end;

     FunCierreFacEle := vlResult;

end;
           }
{--------------------------------------------------------------------------------------------------------------------
                                     CALCULA INTERES DIARIO
--------------------------------------------------------------------------------------------------------------------}
function TCrCierre.FuncGenIntDiario(pFecha : TDateTime; var PPResultado: String): Boolean;
var
     vlResult     : Boolean;
     vlStpGenIntDiario : TStoredProc;
begin
     vlResult := False;
     FuncGenIntDiario := False;
     vlStpGenIntDiario := tStoredProc.Create(Self);
     Try
        with vlStpGenIntDiario do
        Begin
          vlStpGenIntDiario.DatabaseName   := Apli.DataBaseName;
          vlStpGenIntDiario.SessionName    := Apli.SessionName;
          vlStpGenIntDiario.StoredProcName := NOMPAKAGE + '.STPGENINTDIARIO';

          Params.Clear;
          Params.CreateParam(ftFloat,  'PEIDEMPRESA',   ptInput);
          Params.CreateParam(ftDate,   'PEFPROCESO',    ptInput);
          Params.CreateParam(ftString, 'PECVEUSUARIO',  ptInput);
          Params.CreateParam(ftString, 'PEBCOMMIT',     ptInput);
          Params.CreateParam(ftFloat,  'PSRESULTADO',   ptOutput);
          Params.CreateParam(ftString, 'PSTXRESULTADO', ptOutput);


          ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
          ParamByName('PEFPROCESO').AsDateTime := pFecha;
          ParamByName('PECVEUSUARIO').asString := Apli.Usuario;
          ParamByName('PEBCOMMIT').asString    := 'V';
          ExecProc;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
              PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
          //end if
        end;
     finally
            if vlStpGenIntDiario <> nil then
               vlStpGenIntDiario.Free;
            //end if;
     end;

     FuncGenIntDiario := vlResult;
end;

{--------------------------------------------------------------------------------------------------------------------
                                     CALCULA MORATORIOS DIARIO
--------------------------------------------------------------------------------------------------------------------}
function TCrCierre.FuncGenMoraDiario(pFecha : TDateTime; var PPResultado: String): Boolean;
var
     vlResult     : Boolean;
     vlStpGenMoraDiario : TStoredProc;
begin
     vlResult := False;
     FuncGenMoraDiario := False;
     vlStpGenMoraDiario := tStoredProc.Create(Self);
     Try
        with vlStpGenMoraDiario do                                             
        Begin
          vlStpGenMoraDiario.DatabaseName   := Apli.DataBaseName;
          vlStpGenMoraDiario.SessionName    := Apli.SessionName;
          vlStpGenMoraDiario.StoredProcName := NOMPAKAGE + '.STPGENMORADIARIO';
          Params.Clear;
          Params.CreateParam(ftFloat,  'PEIDEMPRESA',   ptInput  );
          Params.CreateParam(ftDate,   'PEFPROCESO',    ptInput  );
          Params.CreateParam(ftString, 'PECVEUSUARIO',  ptInput  );
          Params.CreateParam(ftString, 'PEBCOMMIT',     ptInput  );
          Params.CreateParam(ftFloat,  'PSRESULTADO',   ptOutput );
          Params.CreateParam(ftString, 'PSTXRESULTADO', ptOutput );

          ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
          ParamByName('PEFPROCESO').AsDateTime := pFecha;
          ParamByName('PECVEUSUARIO').asString := Apli.Usuario;
          ParamByName('PEBCOMMIT').asString    := 'V';
          ExecProc;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
              PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
          //end if
        end;
     finally
            if vlStpGenMoraDiario <> nil then
               vlStpGenMoraDiario.Free;
            //end if;
     end;

     FuncGenMoraDiario := vlResult;
end;

{--------------------------------------------------------------------------------------------------------------------
                                        CARGA HISTORICA
--------------------------------------------------------------------------------------------------------------------}
function TCrCierre.FuncCargaHisto(pFecha : TDateTime; var PPResultado: String): Boolean;
var
     vlResult     : Boolean;
     vlStpCargaHisto : TStoredProc;
begin
     vlResult := False;
     FuncCargaHisto := False;
     Try
        with vlStpCargaHisto do
        Begin
          vlStpCargaHisto := tStoredProc.Create(Self);
          vlStpCargaHisto.DatabaseName   := Apli.DataBaseName;
          vlStpCargaHisto.SessionName    := Apli.SessionName;
          vlStpCargaHisto.StoredProcName := NOMPAKAGE + '.STPCARGAHISTO';
          Params.Clear;
          Params.CreateParam(ftFloat,  'PEIDEMPRESA',   ptInput);
          Params.CreateParam(ftDate,   'PEFPROCESO',    ptInput);
          Params.CreateParam(ftString, 'PECVEUSUARIO',  ptInput);
          Params.CreateParam(ftString, 'PEBCOMMIT',     ptInput);
          Params.CreateParam(ftFloat,  'PSRESULTADO',   ptOutput);
          Params.CreateParam(ftString, 'PSTXRESULTADO', ptOutput);
          ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
          ParamByName('PEFPROCESO').AsDateTime := pFecha;
          ParamByName('PECVEUSUARIO').asString := Apli.Usuario;
          ParamByName('PEBCOMMIT').asString    := 'V';
          ExecProc;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
              PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
          //end if
        end;
     finally
            if vlStpCargaHisto <> nil then
               vlStpCargaHisto.Free;
            //end if;
     end;
     FuncCargaHisto := vlResult;
end;
{--------------------------------------------------------------------------------------------------------------------
                                           TRASPASO ICR
--------------------------------------------------------------------------------------------------------------------}
function TCrCierre.FuncTraspasoICR(pFecha : TDateTime; var PPResultado: String): Boolean;
var
     vlResult     : Boolean;
     vlStpTraspasoICR : TStoredProc;
begin
     vlResult := False;
     FuncTraspasoICR := False;
     vlStpTraspasoICR := tStoredProc.Create(Self);
     Try
        with vlStpTraspasoICR do
        Begin
          vlStpTraspasoICR.DatabaseName   := Apli.DataBaseName;
          vlStpTraspasoICR.SessionName    := Apli.SessionName;
          vlStpTraspasoICR.StoredProcName := NOMPAKAGE + '.STPTRASPASOICR';

          Params.Clear;
          Params.CreateParam(ftFloat,  'PEIDEMPRESA',   ptInput);
          Params.CreateParam(ftDate,   'PEFPROCESO',    ptInput);
          Params.CreateParam(ftString, 'PECVEUSUARIO',  ptInput);
          Params.CreateParam(ftString, 'PEBCOMMIT',     ptInput);
          Params.CreateParam(ftFloat,  'PSRESULTADO',   ptOutput);
          Params.CreateParam(ftString, 'PSTXRESULTADO', ptOutput);

          ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
          ParamByName('PEFPROCESO').AsDateTime := pFecha;
          ParamByName('PECVEUSUARIO').asString := Apli.Usuario;
          ParamByName('PEBCOMMIT').asString    := 'V';
          ExecProc;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
              PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
          //end if
        end;
     finally
            if vlStpTraspasoICR <> nil then
               vlStpTraspasoICR.Free;
            //end if;
     end;
     FuncTraspasoICR := vlResult;
end;
{--------------------------------------------------------------------------------------------------------------------
                               PROVISION DIARIA (CONTABILIDAD)
--------------------------------------------------------------------------------------------------------------------}
function TCrCierre.FuncContProvDiaria(pFecha : TDateTime; var PPResultado: String): Boolean;
var
     vlResult     : Boolean;
     StpContProvDiaria : TStoredProc;
begin
     vlResult := False;
     FuncContProvDiaria := False;
     StpContProvDiaria := tStoredProc.Create(Self);
     Try
        with StpContProvDiaria do
        Begin
          StpContProvDiaria.DatabaseName   := Apli.DataBaseName;
          StpContProvDiaria.SessionName    := Apli.SessionName;
          StpContProvDiaria.StoredProcName := 'PKGCRCONTA.STPCONTAPROVISIONDIARIA';

          Params.Clear;
          Params.CreateParam( ftFloat,   'PEIDEMPRESA',    ptInput );
          Params.CreateParam(ftDate,'PEFINICIO',ptInput);
          Params.CreateParam(ftDate,'PEFFIN',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
          ParamByName('peFInicio').AsDateTime  := pFecha;
          ParamByName('peFFin').AsDateTime  := pFecha;
          ParamByName('PEBCOMMIT').asString    := 'V';
          ExecProc;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
              PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
          //end if
        end;
     finally
            if StpContProvDiaria <> nil then
               StpContProvDiaria.Free;
            //end if;
     end;
     FuncContProvDiaria := vlResult;
end;
{--------------------------------------------------------------------------------------------------------------------
                               PROVISION VENCIDOS (CONTABILIDAD)
--------------------------------------------------------------------------------------------------------------------}
function TCrCierre.FuncContProvVenc(pFecha : TDateTime; var PPResultado: String): Boolean;
var
     vlResult     : Boolean;
     StpContProvVenc : TStoredProc;
begin
     vlResult := False;
     FuncContProvVenc := False;
     StpContProvVenc := tStoredProc.Create(Self);
     Try
        with StpContProvVenc do
        Begin
          StpContProvVenc.DatabaseName   := Apli.DataBaseName;
          StpContProvVenc.SessionName    := Apli.SessionName;
          StpContProvVenc.StoredProcName := 'PKGCRCONTA.STPCONTAPROVISIONVENC';

          Params.Clear;
          Params.CreateParam( ftFloat,   'PEIDEMPRESA',    ptInput );
          Params.CreateParam(ftDate,'PEFINICIO',ptInput);
          Params.CreateParam(ftDate,'PEFFIN',ptInput);
          Params.CreateParam(ftDate,'PEFCIERRE',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
          ParamByName('peFInicio').AsDateTime  := pFecha;
          ParamByName('peFFin').AsDateTime  := pFecha;
          ParamByName('peFCierre').AsDateTime  := pFecha;
          ParamByName('PEBCOMMIT').asString    := 'V';
          ExecProc;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
              PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
          //end if
        end;
     finally
            if StpContProvVenc <> nil then
               StpContProvVenc.Free;
            //end if;
     end;
     FuncContProvVenc := vlResult;
end;
{--------------------------------------------------------------------------------------------------------------------
                                       CONTA VENCIDOS
--------------------------------------------------------------------------------------------------------------------}
function TCrCierre.FuncContaVencidos(pFecha : TDateTime; var PPResultado: String): Boolean;
var
     vlResult     : Boolean;
     StpContaVencidos : TStoredProc;
begin
     vlResult := False;
     FuncContaVencidos := False;
     StpContaVencidos := tStoredProc.Create(Self);
     Try
        with StpContaVencidos do
        Begin
          StpContaVencidos.DatabaseName   := Apli.DataBaseName;
          StpContaVencidos.SessionName    := Apli.SessionName;
          StpContaVencidos.StoredProcName := 'PKGCRCONTA.STPCONTAVENCIDOS';

          Params.Clear;
          Params.CreateParam( ftFloat,   'PEIDEMPRESA',    ptInput );
          Params.CreateParam(ftDate,'PEFCIERRE',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
          ParamByName('peFCierre').AsDateTime  := pFecha;
          ParamByName('PEBCOMMIT').asString    := 'V';
          ExecProc;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
              PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
          //end if
        end;
     finally
            if StpContaVencidos <> nil then
               StpContaVencidos.Free;
            //end if;
     end;
     FuncContaVencidos := vlResult;
end;
{--------------------------------------------------------------------------------------------------------------------
                                     CONTABILIDAD - COLOCACION DE GARANTIAS
--------------------------------------------------------------------------------------------------------------------}
function TCrCierre.FuncContColocGtia(pFecha : TDateTime; var PPResultado: String): Boolean;
var
     vlResult     : Boolean;
     StpContColoc : TStoredProc;
begin
     vlResult := False;
     FuncContColocGtia := False;
     StpContColoc := tStoredProc.Create(Self);
     Try
        with StpContColoc do
        Begin
          StpContColoc.DatabaseName   := Apli.DataBaseName;
          StpContColoc.SessionName    := Apli.SessionName;
          StpContColoc.StoredProcName := 'PKGCRCONTA.STPCONTCOLOCGTIA';

          Params.Clear;
          Params.CreateParam( ftFloat,   'PEIDEMPRESA',    ptInput );
          Params.CreateParam(ftDate,'PEFCIERRE',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
          ParamByName('peFCierre').AsDateTime  := pFecha;
          ParamByName('PEBCOMMIT').asString    := 'V';
          ExecProc;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
              PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
          //end if
        end;
     finally
            if StpContColoc <> nil then
               StpContColoc.Free;
            //end if;
     end;
     FuncContColocGtia := vlResult;
end;
{--------------------------------------------------------------------------------------------------------------------
                                     CONTABILIDAD - PAGO DE GARANTIAS
--------------------------------------------------------------------------------------------------------------------}
function TCrCierre.FuncContPagoGtia(pFecha : TDateTime; var PPResultado: String): Boolean;
var
     vlResult     : Boolean;
     StpContPagoGtia : TStoredProc;
begin
     vlResult := False;
     FuncContPagoGtia := False;
     StpContPagoGtia := tStoredProc.Create(Self);
     Try
        with StpContPagoGtia do
        Begin
          StpContPagoGtia.DatabaseName   := Apli.DataBaseName;
          StpContPagoGtia.SessionName    := Apli.SessionName;
          StpContPagoGtia.StoredProcName := 'PKGCRCONTA.STPCONTPAGOGTIA';

          Params.Clear;
          Params.CreateParam( ftFloat,   'PEIDEMPRESA',    ptInput );
          Params.CreateParam(ftDate,'PEFCIERRE',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
          ParamByName('peFCierre').AsDateTime  := pFecha;
          ParamByName('PEBCOMMIT').asString    := 'V';
          ExecProc;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
              PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
          //end if
        end;
     finally
            if StpContPagoGtia <> nil then
               StpContPagoGtia.Free;
            //end if;
     end;
     FuncContPagoGtia := vlResult;
end;
{--------------------------------------------------------------------------------------------------------------------
                                     CONTABILIDAD - COMISIÓN AGRONEGOCIOS
--------------------------------------------------------------------------------------------------------------------}
function  TCrCierre.FunContAgrComision(pFecha : TDateTime; var PPResultado: String): Boolean;
var
     vlResult     : Boolean;
     StpContaAgrComision : TStoredProc;
begin
     Result := False;
     vlResult := False;
     StpContaAgrComision := TStoredProc.Create(Self);
     Try
        with StpContaAgrComision do
        Begin
          StpContaAgrComision.DatabaseName   := Apli.DataBaseName;
          StpContaAgrComision.SessionName    := Apli.SessionName;
          StpContaAgrComision.StoredProcName := 'PKGCRCONTA.STPCONTA_AGR_COMISION';

          Params.Clear;
          Params.CreateParam( ftFloat,   'PEIDEMPRESA',    ptInput );
          Params.CreateParam(ftDate,'PEFCIERRE',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
          ParamByName('PEFCIERRE').AsDateTime  := pFecha;
          ParamByName('PEBCOMMIT').asString    := 'V';
          ExecProc;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
             PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
          //end if
        end;
     finally
            if StpContaAgrComision <> nil then
               StpContaAgrComision.Free;
            //end if;
     end;
     Result := vlResult;
end;
{--------------------------------------------------------------------------------------------------------------------
                                     CONTABILIDAD - CAPITALIZACIÓN AGRONEGOCIOS
--------------------------------------------------------------------------------------------------------------------}
function TCrCierre.FunContCapiGtia(pFecha : TDateTime; var PPResultado: String): Boolean;
var
     vlResult     : Boolean;
     StpContCapiGtia : TStoredProc;
begin
     Result := False;
     vlResult := False;
     StpContCapiGtia := TStoredProc.Create(Self);
     Try
        with StpContCapiGtia do
        Begin
          StpContCapiGtia.DatabaseName   := Apli.DataBaseName;
          StpContCapiGtia.SessionName    := Apli.SessionName;
          StpContCapiGtia.StoredProcName := 'PKGCRCONTA.STPCONTCAPIGTIA';

          Params.Clear;
          Params.CreateParam( ftFloat,   'PEIDEMPRESA',    ptInput );
          Params.CreateParam(ftDate,'PEFCIERRE',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
          ParamByName('PEFCIERRE').AsDateTime  := pFecha;
          ParamByName('PEBCOMMIT').asString    := 'V';
          ExecProc;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
              PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
          //end if
        end;
     finally
            if StpContCapiGtia <> nil then
               StpContCapiGtia.Free;
            //end if;
     end;
     Result := vlResult;
end;

{--------------------------------------------------------------------------------------------------------------------
                                     TRANSACCION CONTABLE
--------------------------------------------------------------------------------------------------------------------}
function TCrCierre.FuncContTransacc(pFecha : TDateTime; var PPResultado: String): Boolean;
var
     vlResult     : Boolean;
     StpContTransacc : TStoredProc;
begin
     vlResult := False;
     FuncContTransacc := False;
     StpContTransacc := tStoredProc.Create(Self);
     Try
        with StpContTransacc do
        Begin
          StpContTransacc.DatabaseName   := Apli.DataBaseName;
          StpContTransacc.SessionName    := Apli.SessionName;
          StpContTransacc.StoredProcName := 'PKGCRCONTA.STPCONT_TRANSACCION';

          Params.Clear;
          Params.CreateParam( ftFloat,   'PEIDEMPRESA',    ptInput );
          Params.CreateParam(ftDate,'PEFCIERRE',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
          ParamByName('peFCierre').AsDateTime  := pFecha;
          ParamByName('PEBCOMMIT').asString    := 'V';
          ExecProc;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
              PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
          //end if
        end;
     finally
            if StpContTransacc <> nil then
               StpContTransacc.Free;
            //end if;
     end;
     FuncContTransacc := vlResult;
end;
{--------------------------------------------------------------------------------------------------------------------
                                     BITACORA DE SEGUIMIENTO DE COBRANZA
--------------------------------------------------------------------------------------------------------------------}
function TCrCierre.FuncAltaSeguimiento(pFecha : TDateTime; var PPResultado: String): Boolean;
var
     vlResult     : Boolean;
     StpAltaBitSegmto : TStoredProc;
begin
     vlResult := False;
     FuncAltaSeguimiento := False;
     StpAltaBitSegmto := tStoredProc.Create(Self);
     Try
        with StpAltaBitSegmto do
        Begin
          StpAltaBitSegmto.DatabaseName   := Apli.DataBaseName;
          StpAltaBitSegmto.SessionName    := Apli.SessionName;
          StpAltaBitSegmto.StoredProcName := NOMPAKAGE + '.STPALTABITSEGMTO';

          Params.Clear;
          Params.CreateParam(ftFloat,  'PEIDEMPRESA',   ptInput  );
          Params.CreateParam(ftDate,   'PEFCOBRANZA',   ptInput  );
          Params.CreateParam(ftString, 'PECVEUSUALTA',  ptInput  );
          Params.CreateParam(ftString, 'PEBCOMMIT',     ptInput  );
          Params.CreateParam(ftFloat,  'PSRESULTADO',   ptOutput );
          Params.CreateParam(ftString, 'PSTXRESULTADO', ptOutput );

          ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
          ParamByName('PEFCOBRANZA').AsDateTime := pFecha;
          ParamByName('PECVEUSUALTA').asString  := Apli.Usuario;
          ParamByName('PEBCOMMIT').asString     := 'V';
          TRY
          ExecProc;
          EXCEPT
            ON E: EXCEPTION DO
            BEGIN
              ShowMessage(E.Message);
              RAISE E.Create( E.Message );

            END;
          END;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
              PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
          //end if
        end;
     finally
            if StpAltaBitSegmto <> nil then
               StpAltaBitSegmto.Free;
            //end if;
     end;
     FuncAltaSeguimiento := vlResult;
end;

{--------------------------------------------------------------------------------------------------------------------
                                      ACTUALIZA FECHA ULTIMO CIERRE
--------------------------------------------------------------------------------------------------------------------}
function TCrCierre.FunActFCierre(pFecha : TDateTime; var PPResultado: String): Boolean;
var
     vlResult      : Boolean;
     StpActFCierre : TStoredProc;
begin
     vlResult := False;
     FunActFCierre := False;
     StpActFCierre := tStoredProc.Create(Self);
     Try
        with StpActFCierre do
        Begin
          StpActFCierre.DatabaseName   := Apli.DataBaseName;
          StpActFCierre.SessionName    := Apli.SessionName;
          StpActFCierre.StoredProcName := NOMPAKAGE + '.STPACTFCIERRE';
          Params.Clear;
          Params.CreateParam(ftFloat,  'PEIDEMPRESA',   ptInput);
          Params.CreateParam(ftDate,   'PEFCIERRE',     ptInput);
          Params.CreateParam(ftString, 'PEBCOMMIT',     ptInput);
          Params.CreateParam(ftFloat,  'PSRESULTADO',   ptOutput);
          Params.CreateParam(ftString, 'PSTXRESULTADO', ptOutput);
          ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
          ParamByName('PEFCIERRE').AsDateTime  := pFecha;
          ParamByName('PEBCOMMIT').asString    := 'V';
          TRY
          ExecProc;
          EXCEPT
            ON E: EXCEPTION DO
            BEGIN
              ShowMessage(E.Message);
              RAISE E.Create( E.Message );

            END;
          END;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
              PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
          //end if
        end;
     finally
            if StpActFCierre <> nil then
               StpActFCierre.Free;
            //end if;
     end;
     FunActFCierre := vlResult;
end;
{}
{--------------------------------------------------------------------------------------------------------------------
                                      Genera Estadísticas Históricas (Intercase - Javier Martínez)
--------------------------------------------------------------------------------------------------------------------}
function TCrCierre.FunEstadisticasHist(pFecha : TDateTime; var PPResultado: String): Boolean;
var
     vlResult      : Boolean;
     StpEstadHist  : TStoredProc;
     VLFechaMes    : String;
     VLFechaAnio   : String;
begin
     vlResult := False;
     FunEstadisticasHist := False;
     //VALIDA SI ES FIN DE MES
     if FunEsFinDeMes(pFecha) then
     begin
         //CORRE CARGA DE INTERCREDITOS
         //CORRE CARGA DE INTERCREDITOS
         StpEstadHist := tStoredProc.Create(Self);
         Try
            with StpEstadHist do
            Begin
              StpEstadHist.DatabaseName   := Apli.DataBaseName;
              StpEstadHist.SessionName    := Apli.SessionName;
              StpEstadHist.StoredProcName := 'PKGCOINCRE.STPETLINTERCREDITO@DWHC';
              Params.Clear;
              Params.CreateParam(ftFloat,  'PEANIO',        ptInput);
              Params.CreateParam(ftFloat,  'PEMES',         ptInput);
              Params.CreateParam(ftFloat,  'PEID_CREDITO',  ptInput);
              Params.CreateParam(ftString, 'PEB_CARGA_XCR', ptInput);
              Params.CreateParam(ftString, 'PECVEUSUARIO',  ptInput);
              Params.CreateParam(ftFloat,  'PSRESULTADO',   ptOutput);
              Params.CreateParam(ftString, 'PSTXRESULTADO', ptOutput);

              ParamByName('PEANIO').AsInteger := StrtoInt(FormatDateTime('YYYY',pFecha));
              ParamByName('PEMES').AsInteger := StrToInt(FormatDateTime('MM',pFecha));
              //ParamByName('PEID_CREDITO').AsInteger :=
              ParamByName('PEB_CARGA_XCR').asString := 'V';
              ParamByName('PECVEUSUARIO').asString  := Apli.Usuario;

              TRY
              ExecProc;
              EXCEPT
                ON E: EXCEPTION DO
                BEGIN
                  ShowMessage(E.Message);
                  RAISE E.Create( E.Message );

                END;
              END;

              if ParamByName('PSRESULTADO').AsInteger = 0 then
                 vlResult := True
              else
                  PPResultado := ParamByName('PSTXRESULTADO').AsString;
              //end if
            end;
         finally
                if StpEstadHist <> nil then
                   StpEstadHist.Free;
                //end if;
         end;
         //CORRE CARGA DE ICRE
         //CORRE CARGA DE ICRE
         StpEstadHist := tStoredProc.Create(Self);
         Try
            with StpEstadHist do
            Begin
              StpEstadHist.DatabaseName   := Apli.DataBaseName;
              StpEstadHist.SessionName    := Apli.SessionName;
              StpEstadHist.StoredProcName := 'PKGCOINCRE.STPETLICRE@DWHC';
              Params.Clear;
              Params.CreateParam(ftFloat,  'PEANIO',        ptInput);
              Params.CreateParam(ftFloat,  'PEMES',         ptInput);
              Params.CreateParam(ftFloat,  'PEID_CREDITO',  ptInput);
              Params.CreateParam(ftString, 'PEB_CARGA_XCR', ptInput);
              Params.CreateParam(ftString, 'PECVEUSUARIO',  ptInput);
              Params.CreateParam(ftFloat,  'PSRESULTADO',   ptOutput);
              Params.CreateParam(ftString, 'PSTXRESULTADO', ptOutput);

              ParamByName('PEANIO').AsInteger := StrtoInt(FormatDateTime('YYYY',pFecha));
              ParamByName('PEMES').AsInteger := StrToInt(FormatDateTime('MM',pFecha));
              //ParamByName('PEID_CREDITO').AsInteger :=
              ParamByName('PEB_CARGA_XCR').asString := 'V';
              ParamByName('PECVEUSUARIO').asString  := Apli.Usuario;

              TRY
              ExecProc;
              EXCEPT
                ON E: EXCEPTION DO
                BEGIN
                  ShowMessage(E.Message);
                  RAISE E.Create( E.Message );

                END;
              END;

              if ParamByName('PSRESULTADO').AsInteger = 0 then
                 vlResult := True
              else
                  PPResultado := ParamByName('PSTXRESULTADO').AsString;
              //end if
            end;
         finally
                if StpEstadHist <> nil then
                   StpEstadHist.Free;
                //end if;
         end;
         //CORRE CARGA ESTADISTICOS
         //CORRE CARGA ESTADISTICOS
         StpEstadHist := tStoredProc.Create(Self);
         Try
            with StpEstadHist do
            Begin
              StpEstadHist.DatabaseName   := Apli.DataBaseName;
              StpEstadHist.SessionName    := Apli.SessionName;
              StpEstadHist.StoredProcName := 'PKGCOINCRE.STPETLFONDEOGBL@DWHC';
              Params.Clear;
              Params.CreateParam(ftFloat,  'PEANIO',        ptInput);
              Params.CreateParam(ftFloat,  'PEMES',         ptInput);
              Params.CreateParam(ftString, 'PECVEUSUARIO',  ptInput);
              Params.CreateParam(ftFloat,  'PSRESULTADO',   ptOutput);
              Params.CreateParam(ftString, 'PSTXRESULTADO', ptOutput);

              ParamByName('PEANIO').AsInteger := StrtoInt(FormatDateTime('YYYY',pFecha));
              ParamByName('PEMES').AsInteger := StrToInt(FormatDateTime('MM',pFecha));
              ParamByName('PECVEUSUARIO').asString  := Apli.Usuario;

              TRY
              ExecProc;
              EXCEPT
                ON E: EXCEPTION DO
                BEGIN
                  ShowMessage(E.Message);
                  RAISE E.Create( E.Message );
                END;
              END;
              if ParamByName('PSRESULTADO').AsInteger = 0 then
                 vlResult := True
              else
                  PPResultado := ParamByName('PSTXRESULTADO').AsString;
              //end if
            end;
         finally
                if StpEstadHist <> nil then
                   StpEstadHist.Free;
                //end if;
         end;
    end
    else
        vlResult := True;
    //end if;

    //SALIDA
    FUNESTADISTICASHIST := VLRESULT;
END;


{--------------------------------------------------------------------------------------------------------------------
                                      FINANCIAMIENTO ADICIONAL AUTOMATICO
--------------------------------------------------------------------------------------------------------------------}
function TCrCierre.FunFinanAdic(pFecha : TDateTime; var PPResultado: String): Boolean;
var
     vlResult      : Boolean;
     StpFinanAdic : TStoredProc;
begin
     vlResult := False;
     FunFinanAdic := False;
     StpFinanAdic := tStoredProc.Create(Self);
     Try
        with StpFinanAdic do
        Begin
          StpFinanAdic.DatabaseName   := Apli.DataBaseName;
          StpFinanAdic.SessionName    := Apli.SessionName;
          StpFinanAdic.StoredProcName := NOMPAKAGE + '.STPPROCGBLFINANADIC';

          Params.Clear;
          Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput);
          Params.CreateParam( ftDate,   'PEFAPLICACION', ptInput);
          Params.CreateParam( ftDate,   'PEFHOY',        ptInput);
          Params.CreateParam( ftString, 'PECVEUSUARIO',  ptInput);
          Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
          Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
          Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);

          ParamByName('PEIDEMPRESA').AsInteger    := Apli.IdEmpresa;
          ParamByName('PEFAPLICACION').AsDateTime := pFecha;
          ParamByName('PEFHOY').AsDateTime        := pFecha;
          ParamByName('PECVEUSUARIO').asString    := Apli.Usuario;
          ParamByName('PEBCOMMIT').asString       := 'V';
          TRY
          ExecProc;
          EXCEPT
            ON E: EXCEPTION DO
            BEGIN
              ShowMessage(E.Message);
              RAISE E.Create( E.Message );

            END;
          END;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
              PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
          //end if
        end;
     finally
            if StpFinanAdic <> nil then
               StpFinanAdic.Free;
            //end if;
     end;
     FunFinanAdic := vlResult;
end;
{}
{--------------------------------------------------------------------------------------------------------------------
                                        CARGA HISTORICA
--------------------------------------------------------------------------------------------------------------------}
function TCrCierre.FunDepuraCred(pFecha : TDateTime; var PPResultado: String): Boolean;
var
     vlResult     : Boolean;
     vlStpDepuraCred : TStoredProc;
begin
     vlResult := False;
     FunDepuraCred := False;
     Try
        with vlStpDepuraCred do
        Begin
          vlStpDepuraCred := tStoredProc.Create(Self);
          vlStpDepuraCred.DatabaseName   := Apli.DataBaseName;
          vlStpDepuraCred.SessionName    := Apli.SessionName;
          vlStpDepuraCred.StoredProcName := NOMPAKAGE + '.STPDEPURACRED';

          Params.Clear;
          Params.CreateParam(ftFloat,  'PEIDEMPRESA',   ptInput );
          Params.CreateParam(ftDate,   'PEFPROCESO',    ptInput );
          Params.CreateParam(ftString, 'PECVEUSUARIO',  ptInput );
          Params.CreateParam(ftString, 'PEBCOMMIT',     ptInput );
          Params.CreateParam(ftFloat,  'PSRESULTADO',   ptOutput);
          Params.CreateParam(ftString, 'PSTXRESULTADO', ptOutput);

          ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
          ParamByName('PEFPROCESO').AsDateTime := pFecha;
          ParamByName('PECVEUSUARIO').asString := Apli.Usuario;
          ParamByName('PEBCOMMIT').asString    := 'V';
          ExecProc;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
              PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
          //end if
        end;
     finally
            if vlStpDepuraCred <> nil then
               vlStpDepuraCred.Free;
            //end if;
     end;
     FunDepuraCred := vlResult;
end;
{--------------------------------------------------------------------------------------------------------------------
                                        GENERA TASAS
--------------------------------------------------------------------------------------------------------------------}
function TCrCierre.FunGeneraTasas(pFecha : TDateTime; var PPResultado: String): Boolean;
var
     vlResult     : Boolean;
     vlStpGeneraTasas : TStoredProc;
begin
     vlResult := False;
     FunGeneraTasas := False;
     Try
        with vlStpGeneraTasas do
        Begin
          vlStpGeneraTasas := tStoredProc.Create(Self);
          vlStpGeneraTasas.DatabaseName   := Apli.DataBaseName;
          vlStpGeneraTasas.SessionName    := Apli.SessionName;
          vlStpGeneraTasas.StoredProcName := NOMPAKAGE + '.STPGENERATASAS';

          Params.Clear;
          Params.CreateParam(ftDate,'PEFCIERRE',ptInput);
          Params.CreateParam(ftString,'PECVEUSUARIO',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          ParamByName('PEFCIERRE').AsDateTime  := pFecha;
          ParamByName('PECVEUSUARIO').asString := Apli.Usuario;
          ParamByName('PEBCOMMIT').asString    := 'V';
          ExecProc;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
              PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
          //end if
        end;
     finally
            if vlStpGeneraTasas <> nil then
               vlStpGeneraTasas.Free;
            //end if;
     end;
     FunGeneraTasas := vlResult;
end;
// +---------------------------------------------------------------------------+
// |                    ACTUALIZA IMPORTES X ACREDITADO                        |
// +---------------------------------------------------------------------------+
function TCrCierre.stpUpdImpDispuesto( pFecha : TDateTime; var PPComenta: String;
                                       var PPTodoOk: Boolean): Boolean;
var  vlResult    : Boolean;
     vlStpUpdImp : TStoredProc;
begin
  PPTodoOk := False;
  try
    try
      with vlStpUpdImp do
      Begin
            vlStpUpdImp := TStoredProc.Create(Self);
            vlStpUpdImp.DatabaseName   := Apli.DataBaseName;
            vlStpUpdImp.SessionName    := Apli.SessionName;
            vlStpUpdImp.StoredProcName := 'PKGCRCIERRE.STPUPDIMPDISPUESTO';
            Params.Clear;
            //
            Params.CreateParam(ftInteger, 'PEIDEMPRESA',   ptInput  );
            Params.CreateParam(ftDate,    'PEFPROCESO',    ptInput  );
            Params.CreateParam(ftString,  'PECVEUSUARIO',  ptInput  );
            Params.CreateParam(ftString,  'PEBCOMMIT',     ptInput  );
            Params.CreateParam(ftInteger, 'PSRESULTADO',   ptOutput );
            Params.CreateParam(ftString,  'PSTXRESULTADO', ptOutput );
            //
            ParamByName('PEIDEMPRESA' ).AsInteger := Apli.IdEmpresa;
            ParamByName('PEFPROCESO'  ).AsDate    := pFecha;
            ParamByName('PECVEUSUARIO').AsString  := Apli.Usuario;
            ParamByName('PEBCOMMIT'   ).AsString  := 'V';
            ExecProc;
            //
            if ParamByName('PSRESULTADO').AsInteger = 0 then
            begin
              PPComenta := 'Todo OK';
              PPTodoOk  := True;
            end else
            begin
              PPComenta := ParamByName('PSRESULTADO').AsString + ':' + ParamByName('PSTXRESULTADO').AsString;
              PPTodoOk  := False;
            end;
            //
      end;
    finally
      if vlStpUpdImp <> nil then
        vlStpUpdImp.Free;
      //end if;
    end;
  except
    on e : exception do
    begin
      PPComenta := e.Message;
      PPTodoOk  := False;
    end;
  end;
  Result := PPTodoOk;
end;

procedure TCrCierre.EnviaError(Error: String);
begin
   ProcesaEnvio( Self, 'CIEICR', Now, Error, 'V', 'EVENTO', 'V', 'F' );
end;
{
                      PARTES DEL CIERRE PASIVO
}
//  Valida los vencimientos de la disposición pasiva
function TCrCierre.FunValVencPasivo(pFecha: TDateTime;  var PPResultado: String): Boolean;
var  vlStpVentto : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpVentto := TStoredProc.Create(nil);
    try
      with vlStpVentto do
      begin
        StoredProcName := UpperCase('ADMIPROD.PKGCRREDESCTO.STPVENTTOPERFND');
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDEMPRESA',   ptInput );
        Params.CreateParam( ftFloat,   'PEIDCREDITO',   ptInput );
        Params.CreateParam( ftString,  'PECVEENTDES',   ptInput );
        Params.CreateParam( ftString,  'PEPROGRAMA',    ptInput );
        Params.CreateParam( ftFloat,   'PENUMPERIODO',  ptInput );
        Params.CreateParam( ftDate,    'PEFREFERENCIA', ptInput );
        Params.CreateParam( ftDate,    'PEFCIERRE',     ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
        Params.CreateParam( ftFloat,   'PEGPOTRANSAC',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
        ParamByName('PEIDCREDITO').Clear;
        ParamByName('PECVEENTDES').Clear;
        ParamByName('PEPROGRAMA').Clear;
        ParamByName('PENUMPERIODO').Clear;
        ParamByName('PEGPOTRANSAC').Clear;
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFREFERENCIA').AsDate  := pFecha;
        ParamByName('PEFCIERRE').AsDate      := pFecha;
        ParamByName('PECVEUSUARIO').AsString := Apli.Usuario;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpVentto) then
        vlStpVentto.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;

function TCrCierre.FunIntDiarioPasivo(pFecha: TDateTime;  var PPResultado: String): Boolean;
var  vlStpProvPas : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpProvPas := TStoredProc.Create(nil);
    try
      with vlStpProvPas do
      begin
        StoredProcName := UpperCase('ADMIPROD.PKGCRREDESCTO.STPINTDIARIOFND');
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDEMPRESA',   ptInput );
        Params.CreateParam( ftFloat,   'PEIDCREDITO',   ptInput );
        Params.CreateParam( ftString,  'PECVEENTDES',   ptInput );
        Params.CreateParam( ftString,  'PEPROGRAMA',    ptInput );
        Params.CreateParam( ftFloat,   'PENUMPERIODO',  ptInput );
        Params.CreateParam( ftDate,    'PEFREFERENCIA', ptInput );
        Params.CreateParam( ftDate,    'PEFCIERRE',     ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
        Params.CreateParam( ftString,  'PEBASIGNASIT',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
        ParamByName('PEIDCREDITO').Clear;
        ParamByName('PECVEENTDES').Clear;
        ParamByName('PEPROGRAMA').Clear;
        ParamByName('PENUMPERIODO').Clear;
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFREFERENCIA').AsDate  := pFecha;
        ParamByName('PEFCIERRE').AsDate      := pFecha;
        ParamByName('PECVEUSUARIO').AsString := Apli.Usuario;
        ParamByName('PEBASIGNASIT').AsString := 'F';
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpProvPas) then
        vlStpProvPas.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;


function TCrCierre.FunCargaHistPasiva(pFecha: TDateTime;  var PPResultado: String): Boolean;
var  vlStpCargaPas : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpCargaPas := TStoredProc.Create(nil);
    try
      with vlStpCargaPas do
      begin
        StoredProcName := UpperCase('ADMIPROD.PKGCRREDESCTO.STPCARGAFNDHIST');
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDEMPRESA',   ptInput );
        Params.CreateParam( ftDate,    'PEFCIERRE',     ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFCIERRE').AsDate      := pFecha;
        ParamByName('PECVEUSUARIO').AsString := Apli.Usuario;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpCargaPas) then
        vlStpCargaPas.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;
//
function TCrCierre.FunCapitalizaPasivo(pFecha: TDateTime;   var PPResultado: String): Boolean;
var  vlStpCapPasiva : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpCapPasiva := TStoredProc.Create(nil);
    try
      with vlStpCapPasiva do
      begin
        StoredProcName := UpperCase('ADMIPROD.PKGCRREDESCTO.STPINTCAPITALIZA');
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDEMPRESA',   ptInput );
//        Params.CreateParam( ftFloat,   'PEIDCREDITO',   ptInput );
//        Params.CreateParam( ftString,  'PECVEENTDES',   ptInput );
//        Params.CreateParam( ftString,  'PEPROGRAMA',    ptInput );
//        Params.CreateParam( ftFloat,   'PENUMPERIODO',  ptInput );
        Params.CreateParam( ftDate,    'PEFAPLICACION', ptInput );
        Params.CreateParam( ftDate,    'PEFHOY',     ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
//        Params.CreateParam( ftFloat,   'PEGPOTRANSAC',  ptInput );
//        Params.CreateParam( ftString,  'PEBREPROCESA',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
//        ParamByName('PEIDCREDITO').Clear;
//        ParamByName('PECVEENTDES').Clear;
//        ParamByName('PEPROGRAMA').Clear;
//        ParamByName('PENUMPERIODO').Clear;
//        ParamByName('PEGPOTRANSAC').Clear;
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFAPLICACION').AsDate  := pFecha;
        ParamByName('PEFHOY').AsDate      := pFecha;
        ParamByName('PECVEUSUARIO').AsString := Apli.Usuario;
//        ParamByName('PEBREPROCESA').AsString := 'F';
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpCapPasiva) then
        vlStpCapPasiva.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;

function TCrCierre.FunGenLoteCont(pFecha: TDateTime;  var PPResultado: String): Boolean;
var  vlStpGenLote : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpGenLote := TStoredProc.Create(nil);
    try
      with vlStpGenLote do
      begin
        StoredProcName := UpperCase('ADMIPROD.PKGCRREDESCTO.STPGENLOTE');
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDEMPRESA',   ptInput );
        Params.CreateParam( ftDate,    'PEFCIERRE',     ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSIDLOTE',      ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
        ParamByName('PSIDLOTE').Clear;
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFCIERRE').AsDate      := pFecha;
        ParamByName('PECVEUSUARIO').AsString := Apli.Usuario;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpGenLote) then
        vlStpGenLote.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;
//< EASA4011   12/02/2008
Function TCrCierre.FunBorraDatosSAP(pFecha : TDateTime; pClaseDoc: String; var PPResultado: String) : Boolean;
var  FunBorrado : TStoredProc;
     vlResult     : Boolean;
     vlMandante   : String;
Begin
   vlResult := True;
   FunBorraDatosSAP := False;
   vlMandante := obtValorGpoCve( 'CONTAS', 'MANDANTE', Apli );
   try
     FunBorrado := TStoredProc.Create(Self);
     with FunBorrado do
     begin
        If Not vgDatabaseCONT.Connected Then vgDatabaseCONT.Connected := True;

        //Inicia el SPT
        FunBorrado.DatabaseName:= vgDatabaseCONT.DatabaseName;
        FunBorrado.SessionName:= vgDatabaseCONT.SessionName;
        FunBorrado.StoredProcName:= 'ADMIPROD.PKGINTERFAZSAP.BORRA_DATOS_SAP';
        Params.Clear;
        Params.CreateParam( ftString, 'PEMANDT',  ptInput);
        Params.CreateParam( ftDate,   'peF_OPERACION',    ptInput);
        Params.CreateParam( ftFloat,  'peID_EMPRESA',   ptInput);
        Params.CreateParam( ftString, 'PECLASE_DOC',   ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString, 'PSTX_RESULTADO',ptOutput);
        Prepare;
        ParamByName('PEMANDT').AsString  := vlMandante;
        ParamByName('peF_OPERACION').AsDateTime  := pFecha;
        ParamByName('peID_EMPRESA').AsInteger  := Apli.IdEmpresa;
        ParamByName('PECLASE_DOC').AsString  := pClaseDoc;
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTX_RESULTADO').AsString;
           vlResult := False;
        end;
        //end if;
     end;
   finally
        if FunBorrado <> nil then
           FunBorrado.Free;
        //end if;
   end;
   FunBorraDatosSAP := vlResult;
end;
//</EASA>
//
function TCrCierre.FunContColoPasiva(pFecha: TDateTime;  var PPResultado: String): Boolean;
var  vlStpContCol : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpContCol := TStoredProc.Create(Self);
    try
      with vlStpContCol do
      begin
        vlStpContCol.StoredProcName := UpperCase('ADMIPROD.PKGCRREDESCTO.STPCONTCOLREDESC');
        //Inicia el SPT
        vlStpContCol.DatabaseName   := Apli.DataBaseName;
        vlStpContCol.SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDEMPRESA',   ptInput );
        Params.CreateParam( ftDate,    'PEFPROCESO',    ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDate     := pFecha;
        ParamByName('PECVEUSUARIO').Clear;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpContCol) then
        vlStpContCol.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;

function TCrCierre.FunContProvPasiva(pFecha: TDateTime;  var PPResultado: String): Boolean;
var  vlStpContProvPas : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpContProvPas := TStoredProc.Create(nil);
    try
      with vlStpContProvPas do
      begin
        StoredProcName := UpperCase('ADMIPROD.PKGCRREDESCTO.STPCONTPROVREDESC');
        //Inicia el SPT
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDEMPRESA',   ptInput );
        Params.CreateParam( ftDate,    'PEFPROCESO',    ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDate     := pFecha;
        ParamByName('PECVEUSUARIO').Clear;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpContProvPas) then
        vlStpContProvPas.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;

function TCrCierre.FunContProvRetPasiva(pFecha: TDateTime;  var PPResultado: String): Boolean;
var  vlStpContProvRetPas : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpContProvRetPas := TStoredProc.Create(nil);
    try
      with vlStpContProvRetPas do
      begin
        StoredProcName := UpperCase('ADMIPROD.PKGCRREDESCTO.STPCONTACTPROVREDESCTO');
        //Inicia el SPT
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDEMPRESA',   ptInput );
        Params.CreateParam( ftDate,    'PEFPROCESO',    ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDate     := pFecha;
        ParamByName('PECVEUSUARIO').Clear;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpContProvRetPas) then
        vlStpContProvRetPas.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;
//
function TCrCierre.FunContCapiPasiva(pFecha: TDateTime;  var PPResultado: String): Boolean;
var  vlStpContCapiPas : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpContCapiPas := TStoredProc.Create(nil);
    try
      with vlStpContCapiPas do
      begin
        StoredProcName := UpperCase('ADMIPROD.PKGCRREDESCTO.STPCONTCAPITALIZA');

        //Inicia el SPT
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDEMPRESA',   ptInput );
        Params.CreateParam( ftDate,    'PEFPROCESO',    ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDate     := pFecha;
        ParamByName('PECVEUSUARIO').Clear;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpContCapiPas) then
        vlStpContCapiPas.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;




function TCrCierre.FunContVenttoCAPasivo(pFecha: TDateTime;  var PPResultado: String): Boolean;
var  vlStpContVenttoCA : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpContVenttoCA := TStoredProc.Create(nil);
    try
      with vlStpContVenttoCA do
      begin

        StoredProcName := UpperCase('ADMIPROD.PKGCRREDESCTO.STPCONTVENTTO');// STPCONTVENTTOCA');
        //Inicia el SPT

        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDEMPRESA',   ptInput );
        Params.CreateParam( ftDate,    'PEFPROCESO',    ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDate     := pFecha;
        ParamByName('PECVEUSUARIO').Clear;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpContVenttoCA) then
        vlStpContVenttoCA.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;
//
function TCrCierre.FunContVenttoINPasivo(pFecha: TDateTime;  var PPResultado: String): Boolean;
var  vlStpContVenttoIN : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpContVenttoIN := TStoredProc.Create(nil);
    try
      with vlStpContVenttoIN do
      begin

        StoredProcName := UpperCase('ADMIPROD.PKGCRREDESCTO.STPCONTVENTTOIN');
        //Inicia el SPT

        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDEMPRESA',   ptInput );
        Params.CreateParam( ftDate,    'PEFPROCESO',    ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDate     := pFecha;
        ParamByName('PECVEUSUARIO').Clear;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpContVenttoIN) then
        vlStpContVenttoIN.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;

function TCrCierre.FunContVenttoCNPasivo(pFecha: TDateTime;  var PPResultado: String): Boolean;
var  vlStpContVenttoCN : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpContVenttoCN := TStoredProc.Create(nil);
    try
      with vlStpContVenttoCN do
      begin

        StoredProcName := UpperCase('ADMIPROD.PKGCRREDESCTO.STPCONTVENTTOCN');
        //Inicia el SPT
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDEMPRESA',   ptInput );
        Params.CreateParam( ftDate,    'PEFPROCESO',    ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDate     := pFecha;
        ParamByName('PECVEUSUARIO').Clear;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpContVenttoCN) then
        vlStpContVenttoCN.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;

//<LOLS 28 ABR 2006. CONTABILIDAD DE LA PROVISION DE GTIAS PYME>
function TCrCierre.FunContVenttoCNPVCI(pFecha: TDateTime; var PPResultado: String): Boolean;
var  vlStpContPVCICN : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpContPVCICN := TStoredProc.Create(nil);
    try
      with vlStpContPVCICN do
      begin
        
        StoredProcName := UpperCase('ADMIPROD.PKGCRREDESCTO.STPCONTPVCICN');
        //Inicia el SPT

        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDEMPRESA',   ptInput );
        Params.CreateParam( ftDate,    'PEFPROCESO',    ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDate     := pFecha;
        ParamByName('PECVEUSUARIO').Clear;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpContPVCICN) then
        vlStpContPVCICN.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;
//
function TCrCierre.stpCargaComPYME(pFecha: TDateTime; var PPResultado: String): Boolean;
var stpCargaCnCr : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    stpCargaCnCr := TStoredProc.Create(nil);
    try
      with stpCargaCnCr do
      begin
        DatabaseName := Apli.DatabaseName;
        SessionName  := Apli.SessionName;
        StoredProcName:='PKGCRCREDITOO1.STPCARGACOMNAFIN';
        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam( ftDate,    'PEFCORTE',       ptInput   );
        Params.CreateParam( ftString,  'PECVEUSUARIO',   ptInput   );
        Params.CreateParam( ftString,  'PEBCOMMIT',      ptInput   );
        Params.CreateParam( ftInteger, 'PSRESULTADO',    ptOutput  );
        Params.CreateParam( ftString,  'PSTXRESULTADO',  ptOutput  );
        //
        ParamByName('PEFCORTE').AsDate       := pFecha;
        ParamByName('PECVEUSUARIO').AsString := Apli.Usuario;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        ExecProc;
        if ParamByName('PSRESULTADO' ).asInteger = 0 then
          Result := True
        else begin
          Result := False;
          PPResultado := 'Problemas al generar los saldos de la cartera : ' + coCRLF +
                         'Código : ' + ParamByName('PSRESULTADO').AsString  + coCRLF +
                         'Mensaje: ' + ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;
    finally
      stpCargaCnCr.Free;
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;
//</LOLS>



Function  TCrCierre.FunCargaHistoCaucion(pFecha : TDateTime; var PPResultado: String) : Boolean;
var  vlStpCargaHistoCaucion : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpCargaHistoCaucion := TStoredProc.Create(nil);
    try
      with vlStpCargaHistoCaucion do
      begin
        StoredProcName := UpperCase('PKGCRSICC.STP_GA_HISTO_CAUCION');
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDEMPRESA',    ptInput );
        Params.CreateParam( ftDate,    'PEFPROCESO',     ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',   ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',      ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',    ptOutput);
        Params.CreateParam( ftString,  'psTX_RESULTADO', ptOutput);
        //
        ParamByName('PSRESULTADO').Clear;
        ParamByName('psTX_RESULTADO').Clear;
        //
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDate     := pFecha;
        ParamByName('PECVEUSUARIO').Clear;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('psTX_RESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpCargaHistoCaucion) then
        vlStpCargaHistoCaucion.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;
{}
function TCrCierre.FunCierreComis(pFecha: TDateTime;  var PPResultado: String): Boolean;
var stpComisCierre : TStoredProc;
begin
  Result := False;
  PPResultado := 'Error desconocido';
  try
    stpComisCierre := TStoredProc.Create(nil);
    try
      with stpComisCierre do
      begin
        StoredProcName := 'PKGCRCIERRE.STPCOMISCIERRE';
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput  );
        Params.CreateParam( ftDate,   'PEFPROCESO',    ptInput  );
        Params.CreateParam( ftString, 'PECVEUSUARIO',  ptInput  );
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput  );
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput );
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput );
        //
        ParamByName( 'PEIDEMPRESA'  ).AsInteger := Apli.IdEmpresa;
        ParamByName( 'PEFPROCESO'   ).AsDate    := pFecha;
        ParamByName( 'PECVEUSUARIO' ).AsString  := Apli.Usuario;
        ParamByName( 'PEBCOMMIT' ).AsString     := 'V';
        //
        ExecProc;
        //
        Result := ( ParamByName('PSRESULTADO').AsInteger = 0 );
        PPResultado := ParamByName( 'PSTXRESULTADO' ).AsString;
      end;
    finally
      if stpComisCierre <> nil then
        stpComisCierre.Free;
      // ends_if
    end;
  except
    on e : exception do begin
      Result      := False;
      PPResultado := e.Message;
    end;
  end;
end;


function TCrCierre.FunTrCartera(pFecha: TDateTime;  var PPResultado: String): Boolean;
var stpTrCartera : TStoredProc;
begin
  Result := False;
  PPResultado := 'Error desconocido';
  try
    stpTrCartera := TStoredProc.Create(nil);
    try
      with stpTrCartera do
      begin
// RABA ABR 2013 PROYECTO B6
//        StoredProcName := 'PKGCRCIERRE.STPTRASPASOCARTERA';
        StoredProcName := 'PKGCRTRASCARTERA.STPTRASPASOCARTERA';
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput  );
// RABA ABR 2013 NUEVOS PARAMETROS -- PROYECTO B6
        Params.CreateParam( ftFloat,  'PEIDCREDITO',   ptInput  );
        Params.CreateParam( ftFloat,  'PEIDGPOTRANS',  ptInput  );
// FIN RABA
        Params.CreateParam( ftDate,   'PEFCIERRE',     ptInput  );
        Params.CreateParam( ftString, 'PECVEUSUARIO',  ptInput  );
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput  );
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput );
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput );
        //
        ParamByName( 'PEIDEMPRESA'  ).AsInteger := Apli.IdEmpresa;
// RABA ABR 2013 NUEVOS PARAMETROS -- PROYECTO B6
        ParamByName( 'PEIDCREDITO'  ).Clear;
        ParamByName( 'PEIDGPOTRANS' ).Clear;
// FIN RABA
        ParamByName( 'PEFCIERRE'   ).AsDate     := pFecha;
        ParamByName( 'PECVEUSUARIO' ).AsString  := Apli.Usuario;
        ParamByName( 'PEBCOMMIT' ).AsString     := 'V';
        //
        ExecProc;
        //
        Result := ( ParamByName('PSRESULTADO').AsInteger = 0 );
        PPResultado := ParamByName( 'PSTXRESULTADO' ).AsString;
      end;
    finally
      if stpTrCartera <> nil then
        stpTrCartera.Free;
      // ends_if
    end;
  except
    on e : exception do begin
      Result      := False;
      PPResultado := e.Message;
    end;
  end;
end;


function TCrCierre.FunActCalAcred(pFecha: TDateTime;  var PPResultado: String): Boolean;
var vlStp : TStoredProc;
begin
  Result := False;
  PPResultado := 'Error desconocido';
  try
    vlStp := TStoredProc.Create(nil);
    try
      with vlStp do
      begin
        StoredProcName := 'PKGCRSICC.STP_ACT_CAL_ACRED';
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput  );
        Params.CreateParam( ftDate,   'PEFPROCESO',     ptInput  );
        Params.CreateParam( ftString, 'PECVEUSUARIO',  ptInput  );
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput  );
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput );
        Params.CreateParam( ftString, 'psTX_RESULTADO', ptOutput );
        //
        ParamByName( 'PEIDEMPRESA'  ).AsInteger := Apli.IdEmpresa;
        ParamByName( 'PEFPROCESO'   ).AsDate     := pFecha;
        ParamByName( 'PECVEUSUARIO' ).AsString  := Apli.Usuario;
        ParamByName( 'PEBCOMMIT' ).AsString     := 'V';
        //
        ExecProc;
        //
        Result := ( ParamByName('PSRESULTADO').AsInteger = 0 );
        PPResultado := ParamByName( 'psTX_RESULTADO' ).AsString;
      end;
    finally
      if vlStp <> nil then
        vlStp.Free;
      // ends_if
    end;
  except
    on e : exception do begin
      Result      := False;
      PPResultado := e.Message;
    end;
  end;
end;
{--------------------------------------------------------------------------------------------------------------------
                            ACTIVA BUSQUEDA CHEQUERAS PARA BLOQUEO DE SALDOS
                                                EASA4011 11102005
--------------------------------------------------------------------------------------------------------------------}
function TCrCierre.FunActivBusqChqras(pFecha: TDateTime;  var PPResultado: String): Boolean;
var vlStp : TStoredProc;
begin
  Result := False;
  PPResultado := 'Error desconocido';
  try
    vlStp := TStoredProc.Create(nil);
    try
      with vlStp do
      begin
        StoredProcName := NOMPAKAGE + '.SPTACTBUSQCHQ';
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftDate,   'PEFPROCESO',     ptInput  );
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput  );
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput );
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput );
        //
        ParamByName( 'peFProceso'   ).AsDateTime    := pFecha;
        ParamByName( 'peBcommit' ).AsString     := 'V';
        //
        ExecProc;
        //
        Result := ( ParamByName('psResultado').AsInteger = 0 );
        PPResultado := ParamByName( 'psTxResultado' ).AsString;
      end;
    finally
      if vlStp <> nil then
        vlStp.Free;
      // ends_if
    end;
  except
    on e : exception do begin
      Result      := False;
      PPResultado := e.Message;
    end;
  end;
end;

function TCrCierre.FunAltaFidSolCuotas(pFecha: TDateTime;  var PPResultado: String): Boolean;
var vlStp : TStoredProc;
begin
  Result := False;
  PPResultado := 'Error desconocido';
  try
    vlStp := TStoredProc.Create(nil);
    try
      with vlStp do
      begin
        StoredProcName := 'PKGCRGYM.STP_ALTA_FID_SOL_CUOTAS';
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput  );
        Params.CreateParam( ftDate,   'PEFPROCESO',    ptInput  );
        Params.CreateParam( ftString, 'PECVEUSUARIO',  ptInput  );
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput  );
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput );
        Params.CreateParam( ftString, 'psTX_RESULTADO', ptOutput );
        //
        ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDateTime  := pFecha;
        ParamByName('PECVEUSUARIO').asString  := Apli.Usuario;
        ParamByName('PEBCOMMIT').asString     := 'V';
        //
        ExecProc;
        //
        Result := ( ParamByName('PSRESULTADO').AsInteger = 0 );
        PPResultado := ParamByName( 'psTX_RESULTADO' ).AsString;
      end;
    finally
      if vlStp <> nil then
        vlStp.Free;
      // ends_if
    end;
  except
    on e : exception do begin
      Result      := False;
      PPResultado := e.Message;
    end;
  end;
end;
{ EASA4011        22/11/2005              GENERA ESTADO DE CUENTA              }
Function TCrCierre.FunGenEdoCta(pFecha : TDateTime; var PPResultado: String) : Boolean;
var  StpGenEdoCta : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   FunGenEdoCta := False;
   try
     StpGenEdoCta := TStoredProc.Create(Self);
     with StpGenEdoCta do
     begin
        //Inicia el SPT
        StpGenEdoCta.DatabaseName:= Apli.DatabaseName;
        StpGenEdoCta.SessionName:= Apli.SessionName;
        StpGenEdoCta.StoredProcName:= NOMPAKAGE + '.STPGENEDOCTA';
        Params.Clear;
        Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput);
        Params.CreateParam( ftDate,   'PEFPROCESO',    ptInput);
        Params.CreateParam( ftString, 'PECVEUSUARIO',  ptInput);
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);
        Prepare;
        ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDateTime  := pFecha;
        ParamByName('PECVEUSUARIO').asString  := Apli.Usuario;
        ParamByName('PEBCOMMIT').asString     := 'V';
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
           vlResult := False;
        end;
        //end if;
     end;
   finally
        if StpGenEdoCta <> nil then
           StpGenEdoCta.Free;
        //end if;
   end;
   FunGenEdoCta := vlResult;
end;
{ /EASA4011}


function TCrCierre.FunActIntPagNiv(pFecha: TDateTime;  var PPResultado: String): Boolean; // SATV4766
var vlStp : TStoredProc;
begin
  Result := False;
  PPResultado := 'Error desconocido';
  try
    vlStp := TStoredProc.Create(nil);
    try
      with vlStp do
      begin
        StoredProcName := 'PKGCRCIERRE.STP_ACT_INT_PAGNIV';
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput  );
        Params.CreateParam( ftDate,   'PEFPROCESO',    ptInput  );
        Params.CreateParam( ftString, 'PECVEUSUARIO',  ptInput  );
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput  );
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput );
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput );
        //
        ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDateTime  := pFecha;
        ParamByName('PECVEUSUARIO').asString  := Apli.Usuario;
        ParamByName('PEBCOMMIT').asString     := 'V';
        //
        ExecProc;
        //
        Result := ( ParamByName('PSRESULTADO').AsInteger = 0 );
        PPResultado := ParamByName( 'PSTXRESULTADO' ).AsString;
      end;
    finally
      if vlStp <> nil then
        vlStp.Free;
      // ends_if
    end;
  except
    on e : exception do begin
      Result      := False;
      PPResultado := e.Message;
    end;
  end;
end;

//EASA4011   CONTABILIDAD PASIVA SAP 01/02/2008
Function  TCrCierre.stpContaPasiva(pFecha: TDateTime; var PPResultado: String): Boolean;
var stpContaPasiva : TStoredProc;
    vlMANDANTE : String;
    vlTCODE : String;
    vlCLASEDOCTO : String;
    vlSOCIEDAD : String;
begin
  Result := False;
  PPResultado := '';

  vlMANDANTE := obtValorGpoCve( 'CONTAS', 'MANDANTE', Apli );
  vlTCODE :=  obtValorGpoCve( 'CONTAS', 'TCODE', Apli );
  vlCLASEDOCTO :=  obtValorGpoCve( 'CONTPS', 'CLASEDOCTO', Apli );
  vlSOCIEDAD :=  obtValorGpoCve( 'CONTAS', 'SOCIEDAD', Apli );

  try
    stpContaPasiva := TStoredProc.Create(nil);
    try
      with stpContaPasiva do
      begin
        If Not vgDatabaseCONT.Connected Then vgDatabaseCONT.Connected := True;
        stpContaPasiva.StoredProcName:='ADMIPROD.PKGINTERFAZSAP.CONTAPASIVACREDITOS';
        //Inicia el SPT
        stpContaPasiva.DatabaseName:= vgDatabaseCONT.DatabaseName;
        stpContaPasiva.SessionName:= vgDatabaseCONT.SessionName;

        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam( ftInteger, 'PIDEMPRESA',  ptInput   );
        Params.CreateParam( ftDate,    'PFECHA',  ptInput   );
        Params.CreateParam( ftString,  'PMANDANTE',  ptInput   );
        Params.CreateParam( ftString,  'PTCODE',  ptInput   );
        Params.CreateParam( ftString,  'PCLASEDOCTO',  ptInput   );
        Params.CreateParam( ftString,  'PSOCIEDAD',  ptInput   );
        Params.CreateParam( ftInteger, 'PNUMRESULTADO',  ptOutput  );
        Params.CreateParam( ftString,  'PTXTRESULTADO',  ptOutput  );

        //
        ParamByName('PIDEMPRESA').AsInteger   := Apli.IdEmpresa;
        ParamByName('PFECHA').AsDate          := pFecha;
        ParamByName('PMANDANTE').AsString     := vlMANDANTE;
        ParamByName('PTCODE').AsString        := vlTCODE;
        ParamByName('PCLASEDOCTO').AsString   := vlCLASEDOCTO;
        ParamByName('PSOCIEDAD').AsString     := vlSOCIEDAD;

        ExecProc;
        if ParamByName('PNUMRESULTADO' ).asInteger = 0 then
          Result := True
        else begin
          Result := False;
          PPResultado := 'Problemas al generar la Contabilidad Pasiva : ' + coCRLF +
                         'Código : ' + ParamByName('PNUMRESULTADO').AsString  + coCRLF +
                         'Mensaje: ' + ParamByName('PTXTRESULTADO').AsString;
        end;
        //
      end;
    finally
      stpContaPasiva.Free;
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;
//</EASA4011>

//<LOLS 12ENE2006 Carga información de buro de crédito>
procedure TCrCierre.FunCargaBCCred(PFechaCierre: TDate; var PPComenta: String; var PPTodoOk: Boolean);
const coSqlBCarga = 'SELECT DECODE( %s, LAST_DAY( %s ), ''V'', ''F'' ) B_CARGA_BC FROM DUAL';
var   spCBCCred  : TStoredProc;
      vlSqlCarga : String;
      vlBcarga   : String;
      Year, Month, Day: Word;
begin
  PPTodoOk  := False;
  PPComenta := 'Error';
  try
    vlBcarga   := '';
    vlSqlCarga := Format( coSqlBCarga, [ SQLFecha( PFechaCierre ), SQLFecha( PFechaCierre ) ] );
    GetSQLStr( vlSqlCarga, Apli.DataBaseName, Apli.SessionName, 'B_CARGA_BC', vlBcarga, True );
    if vlBcarga = 'V' then
    begin
        spCBCCred := TStoredProc.Create( self );
        try
          spCBCCred.DatabaseName   := Apli.DataBaseName;
          spCBCCred.SessionName    := Apli.SessionName;
          spCBCCred.StoredProcName := UpperCase('PKGBURO.STP_CARGA_REPOSITORIO');
          //
          spCBCCred.Params.Clear;
          spCBCCred.Params.CreateParam( ftInteger,  'P_ID_EMPRESA',   ptInput );
          spCBCCred.Params.CreateParam( ftInteger,  'P_ANIO_MES',     ptInput );
          spCBCCred.Params.CreateParam( ftString,   'P_APLICACION',   ptInput );
          spCBCCred.Params.CreateParam( ftString,   'P_BCOMMIT',      ptInput );
          spCBCCred.Params.CreateParam( ftFloat,    'P_CANTIDAD',     ptOutput );
          spCBCCred.Params.CreateParam( ftFloat,    'P_RESULTADO',    ptOutput );
          spCBCCred.Params.CreateParam( ftString,   'P_TX_RESULTADO', ptOutput );
          //
          DecodeDate(PFechaCierre,  Year, Month, Day );
          spCBCCred.ParamByName( 'P_ID_EMPRESA' ).AsInteger := Apli.IdEmpresa;
          spCBCCred.ParamByName( 'P_ANIO_MES'   ).AsInteger := StrToInt( Format('%.4d%.2d', [ Year, Month ] ) );
          spCBCCred.ParamByName( 'P_APLICACION' ).AsString  := 'ICRE';
          spCBCCred.ParamByName( 'P_BCOMMIT'    ).AsString  := 'V';
          spCBCCred.ParamByName( 'P_CANTIDAD'     ).AsFloat  := 0;
          spCBCCred.ParamByName( 'P_RESULTADO'    ).AsFloat  := 0;
          spCBCCred.ParamByName( 'P_TX_RESULTADO' ).AsString := '';
          //
          spCBCCred.ExecProc;
          //
          if spCBCCred.ParamByName('P_RESULTADO').AsFloat = 0  then
          begin
            PPTodoOk  := True;
            PPComenta := 'Todo OK';
          end else
          begin
            PPTodoOk  := False;
            PPComenta := Format( 'Código SQL: [%d]  Descripción: [%s]',
                           [ spCBCCred.ParamByName('P_RESULTADO').AsInteger,
                             spCBCCred.ParamByName('P_TX_RESULTADO').AsString ] );
          end;
        finally
          if spCBCCred <> nil then
             spCBCCred.Free;
        end;
        //
    end else begin
      PPTodoOk  := True;
      PPComenta := 'Todo OK';
    end;//ends_if_vlBcarga_=_'V'_then
    //
  except
    on e : Exception do
    begin
      PPTodoOk  := False;
      PPComenta := e.Message;
    end;
  end;
  //
end;
//</LOLS>

//<LOLS 01AGO2006 Provisión de comisiones>
procedure TCrCierre.FunProvComision(PFechaCierre: TDate; var PPComenta: String; var PPTodoOk: Boolean);
var   spProvCn   : TStoredProc;
begin
  PPTodoOk  := False;
  PPComenta := 'Error';
  try
    spProvCn := TStoredProc.Create( self );
    try
      with spProvCn do
      Begin
          DatabaseName   := Apli.DataBaseName;
          SessionName    := Apli.SessionName;
          StoredProcName := UpperCase('PKGCRCIERRE.STPGENPROVCOM');
          //
          Params.Clear;
          Params.CreateParam( ftInteger,  'PEIDEMPRESA',     ptInput  );
          Params.CreateParam( ftDate,     'PEFPROCESO',      ptInput  );
          Params.CreateParam( ftString,   'PECVEUSUARIO',    ptInput  );
          Params.CreateParam( ftString,   'PEBCOMMIT',       ptInput  );
          Params.CreateParam( ftInteger,  'PSRESULTADO',     ptOutput );
          Params.CreateParam( ftString,   'PSTXRESULTADO',   ptOutput );
          //
          ParamByName( 'PEIDEMPRESA' ).AsInteger  := Apli.IdEmpresa;
          ParamByName( 'PEFPROCESO'   ).AsDate    := PFechaCierre;
          ParamByName( 'PECVEUSUARIO' ).AsString  := Apli.Usuario;
          ParamByName( 'PEBCOMMIT'    ).AsString  := 'V';
          ParamByName( 'PSRESULTADO'   ).AsFloat  := 0;
          ParamByName( 'PSTXRESULTADO' ).AsString := '';
          //
          ExecProc;
          //
          if ParamByName('PSRESULTADO').AsFloat = 0  then
          begin
            PPTodoOk  := True;
            PPComenta := 'Todo OK';
          end else
          begin
            PPTodoOk  := False;
            PPComenta := Format( 'Código SQL: [%d]  Descripción: [%s]',
                           [ ParamByName('PSRESULTADO').AsInteger,
                             ParamByName('PSTXRESULTADO').AsString ] );
          end;
          //
      end;
      //
    finally
      if spProvCn <> nil then
         spProvCn.Free;
    end;
    //
  except
    on e : Exception do
    begin
      PPTodoOk  := False;
      PPComenta := e.Message;
    end;
  end;
  //
end;

procedure TCrCierre.FunBloqAuto(PFechaCierre: TDate; var PPComenta: String; var PPTodoOk: Boolean);
var   spBloq   : TStoredProc;
begin
  PPTodoOk  := False;
  PPComenta := 'Error';
  try
    spBloq := TStoredProc.Create( self );
    try
      with spBloq do
      Begin
          DatabaseName   := Apli.DataBaseName;
          SessionName    := Apli.SessionName;
          StoredProcName := UpperCase('PKGCRCIERRE.STPBLOQDISPONIBLE');
          //
          Params.Clear;
          Params.CreateParam( ftInteger,  'PEIDEMPRESA',     ptInput  );
          Params.CreateParam( ftDate,     'PEFPROCESO',      ptInput  );
          Params.CreateParam( ftString,   'PECVEUSUARIO',    ptInput  );
          Params.CreateParam( ftString,   'PEBCOMMIT',       ptInput  );
          Params.CreateParam( ftInteger,  'PSRESULTADO',     ptOutput );
          Params.CreateParam( ftString,   'PSTXRESULTADO',   ptOutput );
          //
          ParamByName( 'PEIDEMPRESA' ).AsInteger  := Apli.IdEmpresa;
          ParamByName( 'PEFPROCESO'   ).AsDate    := PFechaCierre;
          ParamByName( 'PECVEUSUARIO' ).AsString  := Apli.Usuario;
          ParamByName( 'PEBCOMMIT'    ).AsString  := 'V';
          ParamByName( 'PSRESULTADO'   ).AsFloat  := 0;
          ParamByName( 'PSTXRESULTADO' ).AsString := '';
          //
          ExecProc;
          //
          if ParamByName('PSRESULTADO').AsFloat = 0  then
          begin
            PPTodoOk  := True;
            PPComenta := 'Todo OK';
          end else
          begin
            PPTodoOk  := False;
            PPComenta := Format( 'Código SQL: [%d]  Descripción: [%s]',
                           [ ParamByName('PSRESULTADO').AsInteger,
                             ParamByName('PSTXRESULTADO').AsString ] );
          end;
          //
      end;
      //
    finally
      if spBloq <> nil then
         spBloq.Free;
    end;
    //
  except
    on e : Exception do
    begin
      PPTodoOk  := False;
      PPComenta := e.Message;
    end;
  end;
  //
end;

//</LOLS>

//<LOLS 16FEB2006 Digitalización de reportes>
Function getWindowsTempDir:String;
var r : Longint;
    c : Array[0..500] of Char;
begin
   r := GetTempPathA(500, c);
   result := '';
   If r <> 0 Then
     result := c;
end;
//</LOLS>


//<ROIM 18/04/2006 GENERACIÓN DE PROVISIÓN Y CONCEPTOS VALORIZADOS>


Function TCrCierre.FunGenProVal(pFecha : TDateTime; var PPResultado: String) : Boolean;
var  StpGenProVal : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   FunGenProVal := False;
   try
     StpGenProVal := TStoredProc.Create(Self);
     with StpGenProVal do
     begin
        //Inicia el SPT
        StpGenProVal.DatabaseName:= Apli.DatabaseName;
        StpGenProVal.SessionName:= Apli.SessionName;
        StpGenProVal.StoredProcName:= NOMPAKAGE + '.STPGENPROVVAL';
        Params.Clear;
        Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput);
        Params.CreateParam( ftDate,   'PEFPROCESO',    ptInput);
        Params.CreateParam( ftString, 'PECVEUSUARIO',  ptInput);
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);
        Prepare;
        ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDateTime  := pFecha;
        ParamByName('PECVEUSUARIO').asString  := Apli.Usuario;
        ParamByName('PEBCOMMIT').asString     := 'V';
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
           vlResult := False;
        end;
        //end if;
     end;
   finally
        if StpGenProVal <> nil then
           StpGenProVal.Free;
        //end if;
   end;
   FunGenProVal := vlResult;
end;


Function TCrCierre.FunGenConVal(pFecha : TDateTime; var PPResultado: String) : Boolean;
var  StpGenConVal : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   FunGenConVal := False;
   try
     StpGenConVal := TStoredProc.Create(Self);
     with StpGenConVal do
     begin
        //Inicia el SPT
        StpGenConVal.DatabaseName:= Apli.DatabaseName;
        StpGenConVal.SessionName:= Apli.SessionName;
        StpGenConVal.StoredProcName:= NOMPAKAGE + '.STPGENCONCVAL';
        Params.Clear;
        Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput);
        Params.CreateParam( ftDate,   'PEFPROCESO',    ptInput);
        Params.CreateParam( ftString, 'PECVEUSUARIO',  ptInput);
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);
        Prepare;
        ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDateTime  := pFecha;
        ParamByName('PECVEUSUARIO').asString  := Apli.Usuario;
        ParamByName('PEBCOMMIT').asString     := 'V';
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
           vlResult := False;
        end;
        //end if;
     end;
   finally
        if StpGenConVal <> nil then
           StpGenConVal.Free;
        //end if;
   end;
   FunGenConVal := vlResult;
end;


//</ROIM>



//<ROIM 19/05/2006 GENERACIÓN TRANSACCION DE GARANTÍAS

Function TCrCierre.FunGenTranGar(pFecha : TDateTime; var PPResultado: String) : Boolean;
var  StpGenTranGar : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   FunGenTranGar := False;
   try
     StpGenTranGar := TStoredProc.Create(Self);
     with StpGenTranGar do
     begin
        //Inicia el SPT
        StpGenTranGar.DatabaseName:= Apli.DatabaseName;
        StpGenTranGar.SessionName:= Apli.SessionName;
        StpGenTranGar.StoredProcName:= NOMPAKAGE + '.STPGENCONGAR';
        Params.Clear;
        Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput);
        Params.CreateParam( ftDate,   'PEFPROCESO',    ptInput);
        Params.CreateParam( ftString, 'PECVEUSUARIO',  ptInput);
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);
        Prepare;
        ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDateTime  := pFecha;
        ParamByName('PECVEUSUARIO').asString  := Apli.Usuario;
        ParamByName('PEBCOMMIT').asString     := 'V';
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
           vlResult := False;
        end;
        //end if;
     end;
   finally
        if StpGenTranGar <> nil then
           StpGenTranGar.Free;
        //end if;
   end;
   FunGenTranGar := vlResult;
end;

//</ROIM>



//<EASA 20ENE2006 Vencimientos de excesos>
Function TCrCierre.FunVtosExcesos(pFecha : TDateTime; var PPResultado: String) : Boolean;
var  StpCtoExcesos : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   FunVtosExcesos := False;
   try
     StpCtoExcesos := TStoredProc.Create(Self);
     with StpCtoExcesos do
     begin
        //Inicia el SPT
        StpCtoExcesos.DatabaseName:= Apli.DatabaseName;
        StpCtoExcesos.SessionName:= Apli.SessionName;
        StpCtoExcesos.StoredProcName:= NOMPAKAGE + '.STPVTOEXCESOS';
        Params.Clear;
        Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput);
        Params.CreateParam( ftDate,   'PEFPROCESO',    ptInput);
        Params.CreateParam( ftString, 'PECVEUSUARIO',  ptInput);
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);
        Prepare;
        ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDateTime  := pFecha;
        ParamByName('PECVEUSUARIO').asString  := Apli.Usuario;
        ParamByName('PEBCOMMIT').asString     := 'V';
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
           vlResult := False;
        end;
        //end if;
     end;
   finally
        if StpCtoExcesos <> nil then
           StpCtoExcesos.Free;
        //end if;
   end;
   FunVtosExcesos := vlResult;
end;
//</EASA>

//<EASA 27OCT2006 PROCESOS CONSOLIDADO DE ADEUDOS>
//INSERTA REGISTRO
Function TCrCierre.FunConsAdeudo( pFecha : TDateTime; var PPResultado: String) : Boolean;
var  StpConsAdeudo : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   FunConsAdeudo := False;
   try
     StpConsAdeudo := TStoredProc.Create(Self);
     with StpConsAdeudo do
     begin
        //Inicia el SPT
        StpConsAdeudo.DatabaseName:= Apli.DatabaseName;
        StpConsAdeudo.SessionName:= Apli.SessionName;
        StpConsAdeudo.StoredProcName:= 'PKGCRCONSOLIDADO.STPINSERTCONS';
        Params.Clear;
        Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput);
        Params.CreateParam( ftDate,   'PEFCIERRE',    ptInput);
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);
        Prepare;
        ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
        ParamByName('PEFCIERRE').AsDateTime  := pFecha;
        ParamByName('PEBCOMMIT').asString     := 'V';
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
           vlResult := False;
        end;
        //end if;
     end;
   finally
        if StpConsAdeudo <> nil then
           StpConsAdeudo.Free;
        //end if;
   end;
   FunConsAdeudo := vlResult;
end;

//CAPITAL VIGENTE E IMPAGDO ICRE
Function TCrCierre.FunCapVigImp( pFecha : TDateTime; var PPResultado: String) : Boolean;
var  StpCapVigImp : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   FunCapVigImp := False;
   try
     StpCapVigImp := TStoredProc.Create(Self);
     with StpCapVigImp do
     begin
        //Inicia el SPT
        StpCapVigImp.DatabaseName:= Apli.DatabaseName;
        StpCapVigImp.SessionName:= Apli.SessionName;
        StpCapVigImp.StoredProcName:= 'PKGCRCONSOLIDADO.STPCAP_VIG_IMP_ICRE';
        Params.Clear;
        Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput);
        Params.CreateParam( ftDate,   'PEFCIERRE',    ptInput);
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);
        Prepare;
        ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
        ParamByName('PEFCIERRE').AsDateTime  := pFecha;
        ParamByName('PEBCOMMIT').asString     := 'V';
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
           vlResult := False;
        end;
        //end if;
     end;
   finally
        if StpCapVigImp <> nil then
           StpCapVigImp.Free;
        //end if;
   end;
   FunCapVigImp := vlResult;
end;

// CAPITAL EXIGIBLE
Function TCrCierre.FunCapExig( pFecha : TDateTime; var PPResultado: String) : Boolean;
var  StpCapExig : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   FunCapExig := False;
   try
     StpCapExig := TStoredProc.Create(Self);
     with StpCapExig do
     begin
        //Inicia el SPT
        StpCapExig.DatabaseName:= Apli.DatabaseName;
        StpCapExig.SessionName:= Apli.SessionName;
        StpCapExig.StoredProcName:= 'PKGCRCONSOLIDADO.STPCAP_EXIG_ICRE';
        Params.Clear;
        Params.CreateParam( ftDate,   'PEFCIERRE',    ptInput);
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);
        Prepare;
        ParamByName('PEFCIERRE').AsDateTime  := pFecha;
        ParamByName('PEBCOMMIT').asString     := 'V';
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
           vlResult := False;
        end;
        //end if;
     end;
   finally
        if StpCapExig <> nil then
           StpCapExig.Free;
        //end if;
   end;
   FunCapExig := vlResult;
end;

//CAPITAL NO EXIGIBLE
Function TCrCierre.FunCapNoExig( pFecha : TDateTime; var PPResultado: String) : Boolean;
var  StpCapNoExig : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   FunCapNoExig := False;
   try
     StpCapNoExig := TStoredProc.Create(Self);
     with StpCapNoExig do
     begin
        //Inicia el SPT
        StpCapNoExig.DatabaseName:= Apli.DatabaseName;
        StpCapNoExig.SessionName:= Apli.SessionName;
        StpCapNoExig.StoredProcName:= 'PKGCRCONSOLIDADO.STPCAP_NO_EXIG_ICRE';
        Params.Clear;
        Params.CreateParam( ftDate,   'PEFCIERRE',    ptInput);
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);
        Prepare;
        ParamByName('PEFCIERRE').AsDateTime  := pFecha;
        ParamByName('PEBCOMMIT').asString     := 'V';
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
           vlResult := False;
        end;
        //end if;
     end;
   finally
        if StpCapNoExig <> nil then
           StpCapNoExig.Free;
        //end if;
   end;
   FunCapNoExig := vlResult;
end;

//INTERES VIGENTE E IMPAGADO
Function TCrCierre.FunIntVigImp( pFecha : TDateTime; var PPResultado: String) : Boolean;
var  StpIntVigImp : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   FunIntVigImp := False;
   try
     StpIntVigImp := TStoredProc.Create(Self);
     with StpIntVigImp do
     begin
        //Inicia el SPT
        StpIntVigImp.DatabaseName:= Apli.DatabaseName;
        StpIntVigImp.SessionName:= Apli.SessionName;
        StpIntVigImp.StoredProcName:= 'PKGCRCONSOLIDADO.STP_INT_VIG_IMP_ICRE';
        Params.Clear;
        Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput);
        Params.CreateParam( ftDate,   'PEFCIERRE',    ptInput);
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);
        Prepare;
        ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
        ParamByName('PEFCIERRE').AsDateTime  := pFecha;
        ParamByName('PEBCOMMIT').asString     := 'V';
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
           vlResult := False;
        end;
        //end if;
     end;
   finally
        if StpIntVigImp <> nil then
           StpIntVigImp.Free;
        //end if;
   end;
   FunIntVigImp := vlResult;
end;

//INTERES VENCIDO EXIGIBLE Y NO EXIGIBLE ICRE
Function TCrCierre.FunIntExiNoE( pFecha : TDateTime; var PPResultado: String) : Boolean;
var  StpIntExiNoE : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   FunIntExiNoE := False;
   try
     StpIntExiNoE := TStoredProc.Create(Self);
     with StpIntExiNoE do
     begin
        //Inicia el SPT
        StpIntExiNoE.DatabaseName:= Apli.DatabaseName;
        StpIntExiNoE.SessionName:= Apli.SessionName;
        StpIntExiNoE.StoredProcName:= 'PKGCRCONSOLIDADO.STP_INT_EXIG_NE_ICRE';
        Params.Clear;
        Params.CreateParam( ftDate,   'PEFCIERRE',    ptInput);
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);
        Prepare;
        ParamByName('PEFCIERRE').AsDateTime  := pFecha;
        ParamByName('PEBCOMMIT').asString     := 'V';
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
           vlResult := False;
        end;
        //end if;
     end;
   finally
        if StpIntExiNoE <> nil then
           StpIntExiNoE.Free;
        //end if;
   end;
   FunIntExiNoE := vlResult;
end;

//CUENTAS DE ORDEN ICRE
Function TCrCierre.FunCtasOrden( pFecha : TDateTime; var PPResultado: String) : Boolean;
var  StpCtasOrden : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   FunCtasOrden := False;
   try
     StpCtasOrden := TStoredProc.Create(Self);
     with StpCtasOrden do
     begin
        //Inicia el SPT
        StpCtasOrden.DatabaseName:= Apli.DatabaseName;
        StpCtasOrden.SessionName:= Apli.SessionName;
        StpCtasOrden.StoredProcName:= 'PKGCRCONSOLIDADO.STP_CTAS_ORDEN_ICRE';
        Params.Clear;
        Params.CreateParam( ftDate,   'PEFCIERRE',    ptInput);
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);
        Prepare;
        ParamByName('PEFCIERRE').AsDateTime  := pFecha;
        ParamByName('PEBCOMMIT').asString     := 'V';
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
           vlResult := False;
        end;
        //end if;
     end;
   finally
        if StpCtasOrden <> nil then
           StpCtasOrden.Free;
        //end if;
   end;
   FunCtasOrden := vlResult;
end;

//SALDOS VIGENTES INTER
Function TCrCierre.FunVigImpInter( pFecha : TDateTime; var PPResultado: String) : Boolean;
var  StpVigImpInter : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   FunVigImpInter := False;
   try
     StpVigImpInter := TStoredProc.Create(Self);
     with StpVigImpInter do
     begin
        //Inicia el SPT
        StpVigImpInter.DatabaseName:= Apli.DatabaseName;
        StpVigImpInter.SessionName:= Apli.SessionName;
        StpVigImpInter.StoredProcName:= 'PKGCRCONSOLIDADO.STPCAP_VIG_IMP_INTER';
        Params.Clear;
        Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput);
        Params.CreateParam( ftDate,   'PEFCIERRE',    ptInput);
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);
        Prepare;
        ParamByName('PEIDEMPRESA').AsInteger  := Apli.IdEmpresa;
        ParamByName('PEFCIERRE').AsDateTime  := pFecha;
        ParamByName('PEBCOMMIT').asString     := 'V';
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
           vlResult := False;
        end;
        //end if;
     end;
   finally
        if StpVigImpInter <> nil then
           StpVigImpInter.Free;
        //end if;
   end;
   FunVigImpInter := vlResult;
end;

//SALDOS VENCIDOS INTER
Function TCrCierre.FunVdoNoEInter( pFecha : TDateTime; var PPResultado: String) : Boolean;
var  StpVdoNoEInter : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   FunVdoNoEInter := False;
   try
     StpVdoNoEInter := TStoredProc.Create(Self);
     with StpVdoNoEInter do
     begin
        //Inicia el SPT
        StpVdoNoEInter.DatabaseName:= Apli.DatabaseName;
        StpVdoNoEInter.SessionName:= Apli.SessionName;
        StpVdoNoEInter.StoredProcName:= 'PKGCRCONSOLIDADO.STP_VDO_INTER';
        Params.Clear;
        Params.CreateParam( ftDate,   'PEFCIERRE',    ptInput);
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);
        Prepare;
        ParamByName('PEFCIERRE').AsDateTime  := pFecha;
        ParamByName('PEBCOMMIT').asString     := 'V';
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
           vlResult := False;
        end;
        //end if;
     end;
   finally
        if StpVdoNoEInter <> nil then
           StpVdoNoEInter.Free;
        //end if;
   end;
   FunVdoNoEInter := vlResult;
end;
//</EASA>

//</JAGF REGENERACION DE CONSOLIDADO DE ADEUDOS>
Function TCrCierre.FunRegenConsAdeudoSdo( pFecha : TDateTime; var PPResultado: String) : Boolean; //REGENERACION DE CONSOLIDADO DE ADEUDOS
var  StpConsAdeudoSdo : TStoredProc;
     StpBajasLineas   : TStoredProc;
     vlResult         : Boolean;
Begin
   vlResult := True;
   result   := False;
   try
     StpConsAdeudoSdo := TStoredProc.Create(Self);
     with StpConsAdeudoSdo do
     begin
        //Inicia el SPT
        StpConsAdeudoSdo.DatabaseName:= Apli.DatabaseName;
        StpConsAdeudoSdo.SessionName:= Apli.SessionName;
        StpConsAdeudoSdo.StoredProcName:= 'PKGCRCONSOLIDADO.STPREGENHISTCRED';
        Params.Clear;
        Params.CreateParam( ftDate,   'PEFPIVOTE',     ptInput);
        Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);

        Prepare;
        ParamByName('PEFPIVOTE').AsDateTime  := pFecha;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
           vlResult := False;
        end;
        //end if;
     end;
   finally
        if StpConsAdeudoSdo <> nil then
           StpConsAdeudoSdo.Free;
        //end if;
   end;

   if vlResult then
   begin
     StpBajasLineas := TStoredProc.Create (Self);
     try
       StpBajasLineas.DatabaseName   := Apli.DatabaseName;
       StpBajasLineas.SessionName    := Apli.SessionName;
       StpBajasLineas.StoredProcName := 'PKGCRCIERRE.STP_CALC_BAJA_LINEA';
       StpBajasLineas.Params.Clear;
       StpBajasLineas.Params.CreateParam( ftDate,   'PEFCIERRE',     ptInput);
       StpBajasLineas.Params.CreateParam( ftString, 'PEBCOMMIT',     ptInput);
       StpBajasLineas.Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
       StpBajasLineas.Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);

       StpBajasLineas.Prepare;
       StpBajasLineas.ParamByName('PEFCIERRE').AsDateTime  := pFecha;
       StpBajasLineas.ParamByName('PEBCOMMIT').AsString    := 'V';
       StpBajasLineas.ExecProc;

       if (StpBajasLineas.ParamByName('PSRESULTADO').AsInteger <> 0) then
       Begin
          PPResultado := 'Error No ' + StpBajasLineas.ParamByName('PSTXRESULTADO').AsString;
          vlResult := False;
       end;
     finally
       if StpBajasLineas <> nil then
         StpBajasLineas.Free;
     end;
   end;

   Result := vlResult;
End;
//</JAGF>

// Carga de Saldos COINCRE
Function  TCrCierre.FunCargaCOINCRE( pFecha : TDateTime; peCveProceso, peCveUsuario :  String;
                                     var PPResultado: String) : Boolean; //CARGA DE COINCRE
var  vlStp : TStoredProc;
     vlResult, vlbFinDeMes : Boolean;
     vlstrPrefijoBase, vlStrCommand, vlstrPathExePCOINCRE : String;
Begin
   vlResult := False;
   //Valida si es fin de mes para poder hacer la carga de COINCRE
   vlbFinDeMes := FunEsFinDeMes(pFecha);
   // Si no Es Fin de Mes, entonces...
   If Not vlbFinDeMes Then
     Begin
     Result := True;
     Exit;
     End;

   // Si es Producción el prefijo es 'P'
   If (Apli.IsProd) Then vlstrPrefijoBase := 'P'
   Else vlstrPrefijoBase := 'D';

   // Obtiene la ubicación de la aplicación a ejecutar de COINCRE
   GetSQLStr('    SELECT R.VALOR FROM CR_GRUPO_CLAVE R '+coCRLF+
             '      WHERE CVE_GRUPO_CLAVE = '+SQLStr('COINCR')+coCRLF+
             '        AND CVE_REFERENCIA = '+SQLStr('PATH')+coCRLF,
              Apli.DatabaseName, Apli.SessionName, 'VALOR', vlstrPathExePCOINCRE, False);

   // Si no encontró ninguna configuración, entonces toma la siguiente como DEFAULT
   If (Trim(vlstrPathExePCOINCRE) = '') Then
     vlstrPathExePCOINCRE := 'O:\Delphide\ICRE01\Out\PCoincre.exe';

   // Si no encontró la aplicación en el PATH indicado
   If Not FileExists(vlstrPathExePCOINCRE) Then
      Begin
      PPResultado := 'No encontró la aplicación de "'+vlstrPathExePCOINCRE+'"';
      End
   Else
      Begin
       // Ejecuta la aplicación de Cierre Nocturno de COINCRE
       vlStrCommand := '"'+vlstrPathExePCOINCRE + '" '+
                            vlstrPrefijoBase+' '+peCveUsuario+' 0 '+DateToStr(pFecha)+' A';
                                                                                 //     |
                                                                                 //     |----- Esta 'A' indica inicio Automático
       If (WinExecAndWait32( vlStrCommand, SW_SHOWNORMAL, False)) Then
           vlResult := True
       Else
           PPResultado := 'Error: No se encontró la aplicación de "'+Trim(vlstrPathExePCOINCRE)+'"';
       End;    

   Result := vlResult;
end;
//</SATV>

function TCrCierre.FunRepIngresos(pFecha: TDateTime; var PPResultado: String): Boolean;
var  StpIngresos : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   FunRepIngresos := False;
   try
     StpIngresos := TStoredProc.Create(Self);
     with StpIngresos do
     begin
        //Inicia el SPT
        StpIngresos.DatabaseName:= Apli.DatabaseName;
        StpIngresos.SessionName:= Apli.SessionName;
        StpIngresos.StoredProcName:= NOMPAKAGE + '.STPINGRESOCIERRE';
        Params.Clear;
        Params.CreateParam( ftDate,   'PFCIERRE',    ptInput);
        Params.CreateParam( ftString, 'PECVEUSUARIO',  ptInput);
        Params.CreateParam( ftFloat,  'PIDEMPRESA',   ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);

        Prepare;
        ParamByName('PFCIERRE').AsDateTime  := pFecha;
        ParamByName('PECVEUSUARIO').asString  := 'CR' + FormatDateTime('DDMMYY',pFecha);
        ParamByName('PIDEMPRESA').AsInteger  := Apli.IdEmpresa;
        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
           vlResult := False;
        end;
        //end if;
     end;
   finally
        if StpIngresos <> nil then
           StpIngresos.Free;
        //end if;
   end;
   FunRepIngresos := vlResult;
end;


(***********************************************FORMA CRCIERRE********************)
(*                                                                              *)
(*  FORMA DE CRCIERRE                                                            *)
(*                                                                              *)
(***********************************************FORMA CRCIERRE********************)

//<LOLS 19ENE2006 Digitalización de reportes>
procedure TWCrCierre.FunDigitalizaRep(PFechaCierre: TDate; var PPComenta: String; var PPTodoOk: Boolean);
var sArchivo   : String;
    sFileName  : String;
    Directorio : String;
    //<LOLS 28 ABR 2006. VALIDACION PARA EL ENVIO DE ARCHIVOS EN EXCEL>
    procedure SendFileFTP(RemotePath, LocalFile, RemoteFile : String);
    begin
      if NMFTP1.Connected then NMFTP1.Disconnect;
      //
      NMFTP1.Connect;
      NMFTP1.ChangeDir( RemotePath );
      NMFTP1.Upload( LocalFile, RemoteFile );
      NMFTP1.Disconnect;
    end;
    //</LOLS>
begin
    PPTodoOk  := True;
    PPComenta := 'Todo OK+';
    //SASG4921 SE VALIDA QUE LA FECHA No VAYA VACIA O NULL 13 SEP 2011
    if (DateToStr(PFechaCierre)='') then
    begin
        PFechaCierre := InterProcesos1.FOpera;
    end;
    try
        EnviaNotificacion();
    except
        on e : exception do
        begin
        end;
    end;
    //
    if Objeto.Apli.IsProd = False then
    begin
      if MessageDlg('No existe un ambiente de digitalización en DESARROLLO.' + #13#10 +
        '¡¡¡ El proceso va a actualizar información en el Servidor FTP que puede afectar los reportes de Producción ya generados !!!'
         + #13#10 + '¿Desea continuar?', mtWarning, [mbAbort, mbYes, mbNo, mbCancel], 0 ) = mrYes then
      begin
        if not ( MessageDlg('¿Estás seguro?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes ) then
          Exit;
        //ends_if
      end else begin
        PPTodoOk  := True;
        PPComenta := 'Todo OK+';
        Exit;
      end;
      //
    end;//Ends_if
    //
    Try
      if NMFTP1.Connected then NMFTP1.Disconnect;
      //
      NMFTP1.Host     := obtValorGpoCve( 'CONFRH', 'FTPSERVER', Objeto.Apli );
      NMFTP1.UserID   := obtValorGpoCve( 'CONFRH', 'USERNAME',  Objeto.Apli );
      NMFTP1.Password := HexToStr( obtValorGpoCve( 'CONFRH', 'PASSWORD',  Objeto.Apli ) );
      //<LOLS 28 ABR 2006. VALIDACION PARA EL ENVIO DE ARCHIVOS EN EXCEL>
      //NMFTP1.Connect;
      //</LOLS>
      //
      Directorio := obtValorGpoCve( 'CONFRH', 'ROOTDIR',   Objeto.Apli );
      if Directorio[ length( Directorio ) ] = '/' then Delete( Directorio, length( Directorio ), 1 );
      //
      Directorio := Directorio + ObtSendTo( DateToStr(PFechaCierre) );

      //<LOLS 28 ABR 2006. VALIDACION PARA EL ENVIO DE ARCHIVOS EN EXCEL>
      //NMFTP1.ChangeDir( Directorio );
      //</LOLS>
      //
      // Digitaliza el reporte de provisión diaria.
      sFileName := 'PROV_AL_' + FormatDateTime('dd_mm_yyyy', PFechaCierre );
      sArchivo  := getWindowsTempDir + sFileName + '.PRN';
      EjecutarReporteProvisionDiaria(  DateToStr( PFechaCierre ), DateToStr( PFechaCierre ),
        '', '', '', '', '', '', sArchivo, 'GL', '', IntToStr(Objeto.Apli.IdEmpresa), Objeto.ParamCre.IDENTIDAD.AsString,
        False, False, False, False, False, False, False, False, Objeto.Apli, False, grDigitaliza, sFileName );
      //<LOLS 28 ABR 2006. VALIDACION PARA EL ENVIO DE ARCHIVOS EN EXCEL>
      SendFileFTP( Directorio, sArchivo, ExtractFileName(sArchivo) );
      //NMFTP1.Upload( sArchivo, ExtractFileName(sArchivo) );
      //</LOLS>
      Application.ProcessMessages;
      // Intereses cobrados x anticipado
      RepRecPremio( DateToStr( PFechaCierre ),
                    IntToStr(Objeto.Apli.IdEmpresa), Objeto.ParamCre.IDENTIDAD.AsString, Objeto.Apli,
                    False, grDigitaliza );
      Application.ProcessMessages;
      //
      // Digitaliza el reporte de cobranza contable
        // Informe de cobranza Pagos Binter - Activos
        sFileName := 'COB_BINTER_AC_AL_' + FormatDateTime('dd_mm_yyyy', PFechaCierre );
        sArchivo  := getWindowsTempDir + sFileName + '.PRN';
        RepInfCobrConta(  DateToStr( PFechaCierre ), DateToStr( PFechaCierre ), '', '',
        '', '', '', 'AC', sArchivo, 'A', IntToStr(Objeto.Apli.IdEmpresa), Objeto.ParamCre.IDENTIDAD.AsString,
        '', True, False, False, 0, Objeto.Apli, False, grDigitaliza, sFileName );

        //<LOLS 28 ABR 2006. VALIDACION PARA EL ENVIO DE ARCHIVOS EN EXCEL>
        SendFileFTP( Directorio, sArchivo, ExtractFileName(sArchivo) );
        //NMFTP1.Upload( sArchivo, ExtractFileName(sArchivo) );
        //</LOLS>
        Application.ProcessMessages;
        // Informe de cobranza Pagos Binter - Cancelados
        sFileName := 'COB_BINTER_CA_AL_' + FormatDateTime('dd_mm_yyyy', PFechaCierre );
        sArchivo := getWindowsTempDir + sFileName + '.PRN';
        RepInfCobrConta(  DateToStr( PFechaCierre ), DateToStr( PFechaCierre ), '', '',
        '', '', '', 'CA', sArchivo, 'A', IntToStr(Objeto.Apli.IdEmpresa), Objeto.ParamCre.IDENTIDAD.AsString,
        '', True, False, False, 0, Objeto.Apli, False, grDigitaliza, sFileName );
        //<LOLS 28 ABR 2006. VALIDACION PARA EL ENVIO DE ARCHIVOS EN EXCEL>
        SendFileFTP( Directorio, sArchivo, ExtractFileName(sArchivo) );
        //NMFTP1.Upload( sArchivo, ExtractFileName(sArchivo) );
        //</LOLS>
        Application.ProcessMessages;
        // Informe de cobranza Pagos FIRA - Activos
        sFileName := 'COB_FIRA_AC_AL_' + FormatDateTime('dd_mm_yyyy', PFechaCierre );
        sArchivo  := getWindowsTempDir + sFileName + '.PRN';
        RepInfCobrConta(  DateToStr( PFechaCierre ), DateToStr( PFechaCierre ), '', '',
        '', '', '', 'AC', sArchivo, 'A', IntToStr(Objeto.Apli.IdEmpresa), Objeto.ParamCre.IDENTIDAD.AsString,
        '', True, False, False, 1, Objeto.Apli, False, grDigitaliza, sFileName );
        //<LOLS 28 ABR 2006. VALIDACION PARA EL ENVIO DE ARCHIVOS EN EXCEL>
        SendFileFTP( Directorio, sArchivo, ExtractFileName(sArchivo) );
        //NMFTP1.Upload( sArchivo, ExtractFileName(sArchivo) );
        //</LOLS>
        Application.ProcessMessages;
        // Informe de cobranza Pagos FIRA - Cancelados
        sFileName := 'COB_FIRA_CA_AL_' + FormatDateTime('dd_mm_yyyy', PFechaCierre );
        sArchivo  := getWindowsTempDir + sFileName + '.PRN';
        RepInfCobrConta(  DateToStr( PFechaCierre ), DateToStr( PFechaCierre ), '', '',
        '', '', '', 'CA', sArchivo, 'A', IntToStr(Objeto.Apli.IdEmpresa), Objeto.ParamCre.IDENTIDAD.AsString,
        '', True, False, False, 1, Objeto.Apli, False, grDigitaliza, sFileName );
        //<LOLS 28 ABR 2006. VALIDACION PARA EL ENVIO DE ARCHIVOS EN EXCEL>
        SendFileFTP( Directorio, sArchivo, ExtractFileName(sArchivo) );
        //NMFTP1.Upload( sArchivo, ExtractFileName(sArchivo) );
        //</LOLS>
        Application.ProcessMessages;
      //
      // Digitaliza el reporte de vencimientos contable
        // Vencimientos Contable por cartera impagada - cartera de crédito
        sFileName := 'VTO_IMP_CC_AL_'  + FormatDateTime('dd_mm_yyyy', PFechaCierre );
        sArchivo  := getWindowsTempDir + sFileName + '.PRN';
        RepVencimientos(  DateToStr( PFechaCierre ), DateToStr( PFechaCierre ), '',
                          'IM', 'A', 'C', 'A',
                          sArchivo, IntToStr(Objeto.Apli.IdEmpresa), Objeto.ParamCre.IDENTIDAD.AsString,
                           '', '', '', True, False, False, False, False,
                           0, Objeto.Apli, False, grDigitaliza, sFileName );
        //<LOLS 28 ABR 2006. VALIDACION PARA EL ENVIO DE ARCHIVOS EN EXCEL>
        SendFileFTP( Directorio, sArchivo, ExtractFileName(sArchivo) );
        //NMFTP1.Upload( sArchivo, ExtractFileName(sArchivo) );
        //<LOLS>
        Application.ProcessMessages;
        // Vencimientos Contable por cartera vencida exigible - cartera de crédito
        sFileName := 'VTO_VDA_CC_AL_'  + FormatDateTime('dd_mm_yyyy', PFechaCierre );
        sArchivo  := getWindowsTempDir + sFileName + '.PRN';
        RepVencimientos(  DateToStr( PFechaCierre ), DateToStr( PFechaCierre ), '',
                          'VE', 'A', 'C', 'A',
                          sArchivo, IntToStr(Objeto.Apli.IdEmpresa), Objeto.ParamCre.IDENTIDAD.AsString,
                           '', '', '', True, False, False, False, False,
                           0, Objeto.Apli, False, grDigitaliza, sFileName );
        //<LOLS 28 ABR 2006. VALIDACION PARA EL ENVIO DE ARCHIVOS EN EXCEL>
        SendFileFTP( Directorio, sArchivo, ExtractFileName(sArchivo) );
        //NMFTP1.Upload( sArchivo, ExtractFileName(sArchivo) );
        //</LOLS>
        Application.ProcessMessages;
        // Vencimientos Contable por cartera impagada - garantía de fondos
        sFileName := 'VTO_IMP_GF_AL_'  + FormatDateTime('dd_mm_yyyy', PFechaCierre );
        sArchivo  := getWindowsTempDir + sFileName + '.PRN';
        RepVencimientos(  DateToStr( PFechaCierre ), DateToStr( PFechaCierre ), '',
                          'IM', 'A', 'C', 'A',
                          sArchivo, IntToStr(Objeto.Apli.IdEmpresa), Objeto.ParamCre.IDENTIDAD.AsString,
                           '', '', '', True, False, False, False, False,
                           1, Objeto.Apli, False, grDigitaliza, sFileName );
        //<LOLS 28 ABR 2006. VALIDACION PARA EL ENVIO DE ARCHIVOS EN EXCEL>
        SendFileFTP( Directorio, sArchivo, ExtractFileName(sArchivo) );
        //NMFTP1.Upload( sArchivo, ExtractFileName(sArchivo) );
        //<LOLS>
        Application.ProcessMessages;
        // Vencimientos Contable por cartera vencida exigible - garantía de fondos
        sFileName := 'VTO_VDA_GF_AL_'  + FormatDateTime('dd_mm_yyyy', PFechaCierre );
        sArchivo  := getWindowsTempDir + sFileName + '.PRN';
        RepVencimientos(  DateToStr( PFechaCierre ), DateToStr( PFechaCierre ), '',
                          'VE', 'A', 'C', 'A',
                          sArchivo, IntToStr(Objeto.Apli.IdEmpresa), Objeto.ParamCre.IDENTIDAD.AsString,
                           '', '', '', True, False, False, False, False,
                           1, Objeto.Apli, False, grDigitaliza, sFileName );
        //<LOLS 28 ABR 2006. VALIDACION PARA EL ENVIO DE ARCHIVOS EN EXCEL>
        SendFileFTP( Directorio, sArchivo, ExtractFileName(sArchivo) );
        //NMFTP1.Upload( sArchivo, ExtractFileName(sArchivo) );
        //<LOLS>
        Application.ProcessMessages;
      // Colocacióin y/o vencimientos
      sFileName := 'COLOCA_AL_' + FormatDateTime('dd_mm_yyyy', PFechaCierre );
      sArchivo  := getWindowsTempDir + sFileName + '.PRN';
      RepColocaciones( DateToStr( PFechaCierre ), DateToStr( PFechaCierre ), '',
                       '', '', '', '', '', '''LQ'',''AC''', '', '', False, False, True,
                       False, sArchivo, '',  '', IntToStr(Objeto.Apli.IdEmpresa),
                       Objeto.ParamCre.IDENTIDAD.AsString,
                       '', // sMedio: String;     // <LOLS 17NOV2006>
                       Objeto.Apli, False, grDigitaliza,
                       sFileName
                     );
      //<LOLS 28 ABR 2006. VALIDACION PARA EL ENVIO DE ARCHIVOS EN EXCEL>
      SendFileFTP( Directorio, sArchivo, ExtractFileName(sArchivo) );
      //NMFTP1.Upload( sArchivo, ExtractFileName(sArchivo) );
      //</LOLS>
      Application.ProcessMessages;
      //
      if NMFTP1.Connected then NMFTP1.Disconnect;
    Except
      on e : exception do
      begin
        PPTodoOk  := False;
        PPComenta := e.Message;
      end;
    End;//Ends_Try..Except
    //
end;
//</LOLS>

function TWCrCierre.AbreConexion( pCURPATH: String): Boolean;
begin
  Result := False;
  // Si no esta conectado abre la conexion
  if not NMFTP1.Connected then
  begin
    NMFTP1.Connect;
    NMFTP1.Mode(MODE_IMAGE);
    Result := True;
  end else begin
    NMFTP1.DoCommand('PWD');
    Result := True;
  end;
  //
  //
  if NMFTP1.Connected then
  Begin
    NMFTP1.ChangeDir( pCURPATH);
  End;
  //
end;
//</LOLS>


//<EASA * * * * * * * * * * * * D I G I T A L I Z A    A V I S O S  * * * * * * * * * * * * * * *
//AVISOS DE COLOCACION ( CARGO )
procedure TWCrCierre.FunDigAvColocacion(PFechaCierre: TDate; var PPComenta: String; var PPTodoOk: Boolean);
var sFileName  : String;
    Directorio : String;
    vlSql      : String;
    Qry : TQuery;
    s, d, ss : ShortString;
    Count2, nCount  : Integer;
    sLocalFile : String;
    sAcrobatFile : String;
    sRemoteFile  : String;
begin
    PPTodoOk  := True;
    PPComenta := 'Todo OK+';
    nCount := 1;
    //
    if Objeto.Apli.IsProd = False then
    begin
      if MessageDlg('No existe un ambiente de digitalización en DESARROLLO.' + #13#10 +
        '¡¡¡ El proceso va a actualizar información en el Servidor FTP que puede afectar los reportes de Producción ya generados !!!'
         + #13#10 + '¿Desea continuar?', mtWarning, [mbAbort, mbYes, mbNo, mbCancel], 0 ) = mrYes then
      begin
        if not ( MessageDlg('¿Estás seguro?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes ) then
          Exit;
        //ends_if
      end else begin
        PPTodoOk  := True;
        PPComenta := 'Todo OK+';
        Exit;
      end;
      //
    end;//Ends_if
    //
      vlSql := ObtQryAviso('V','', coCveColoca,'CARGO', 'F', '','', PFechaCierre,PFechaCierre);
      if vlSql = '' then
        exit;
      //end

      Qry := GetSQLQueryNoNil( vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
      //
      if Assigned(Qry) and not( Qry.IsEmpty ) then
      begin
        while not Qry.Eof do
        begin
          sFileName := 'CESION_' + Qry.FieldByName('ID_CESION').AsString +'_'+ FormatDateTime('dd_mm_yyyy', PFechaCierre );
          RepAvisosxCsMail( DateToStr( PFechaCierre ), DateToStr( PFechaCierre ),    '',        '',
                            Qry.FieldByName('ID_CESION').AsInteger,  Qry.FieldByName('ID_CESION').AsInteger,
                            'CARGO', coEP,  0,  '0',  'EM',
                            Objeto.Apli, False, grDigitaliza, sFileName, Qry.FieldByName('MAIL_PROV').AsString );
          Qry.Next;
        end;//ends_if
      end;
      if Assigned(Qry) then
      begin
        Qry.Close;
        Qry.Free;
      end;
end;

//AVISOS DE REMANENTES ( ABONO )
procedure TWCrCierre.FunDigAvRemanentes(PFechaCierre: TDate; var PPComenta: String; var PPTodoOk: Boolean);
var sFileName  : String;
    Directorio : String;
    vlSql      : String;
    Qry : TQuery;
    s, d, ss : ShortString;
    Count2, nCount   : Integer;
    //
    sLocalFile : String;
    sAcrobatFile : String;
    sRemoteFile  : String;
    vlMsg : String;
begin
    PPTodoOk  := True;
    PPComenta := 'Todo OK+';
    nCount := 1;
    //
    if Objeto.Apli.IsProd = False then
    begin
      if MessageDlg('No existe un ambiente de digitalización en DESARROLLO.' + #13#10 +
        '¡¡¡ El proceso va a actualizar información en el Servidor FTP que puede afectar los reportes de Producción ya generados !!!'
         + #13#10 + '¿Desea continuar?', mtWarning, [mbAbort, mbYes, mbNo, mbCancel], 0 ) = mrYes then
      begin
        if not ( MessageDlg('¿Estás seguro?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes ) then
          Exit;
        //ends_if
      end else begin
        PPTodoOk  := True;
        PPComenta := 'Todo OK+';
        Exit;
      end;
      //
    end;//Ends_if
    //

      vlSql := ObtQryAviso('V','', coCveReman, 'EPREAB', 'F', '','',  PFechaCierre,PFechaCierre);
      if vlSql = '' then
        exit;
      //end

      Qry := GetSQLQueryNoNil( vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
      //
      if Assigned(Qry) and not( Qry.IsEmpty ) then
      begin
        while not Qry.Eof do
        begin
          //limpia tabla cesion
          if not LimpiaTblAviso(Objeto.Apli.DatabaseName, Objeto.Apli.SessionName,PPComenta) then
          Begin
            PPTodoOk  := False;
            Exit;
          end;

          //adiciona cesion
          if not AgregaAviso( Qry.FieldByName('ID_CESION').AsInteger,
                              Qry.FieldByName('ID_DOCUMENTO').AsString,
                              coCveReman,
                              Objeto.Apli.DatabaseName,
                              Objeto.Apli.SessionName,
                              vlMsg ) then
          Begin
            PPComenta :=vlMsg;
            PPTodoOk  := False;
            Exit;
          end;
          //genera reporte
          sFileName := 'REMAB_' + Qry.FieldByName('ID_CESION').AsString +'_'+ FormatDateTime('dd_mm_yyyy', PFechaCierre );
//          showmessage('Genera Archivo '+sFileName);

          RepAvMailxDoc( Qry.FieldByName('ID_CESION').AsString, coREMAB, coCveReman, coEP,'EPREAB',FormatDateTime('dd/mm/yyyy', PFechaCierre ),
                         Objeto.Apli, False, grDigitaliza, sFileName, Qry.FieldByName('MAIL_PROV').AsString );

          Qry.Next;
        end;//ends_if
      end;
      if Assigned(Qry) then
      begin
        Qry.Close;
        Qry.Free;
      end;
   //
end;
//AVISOS DE DEVOLUCION DE INTERESES ( ABONO )
procedure TWCrCierre.FunDigAvDEvInteres(PFechaCierre: TDate; var PPComenta: String; var PPTodoOk: Boolean);
var sFileName  : String;
    Directorio : String;
    vlSql      : String;
    Qry : TQuery;
    s, d, ss : ShortString;
    Count2, nCount   : Integer;
    //
    sLocalFile : String;
    sAcrobatFile : String;
    sRemoteFile  : String;
begin
    PPTodoOk  := True;
    PPComenta := 'Todo OK+';
    nCount := 1;
    //
    if Objeto.Apli.IsProd = False then
    begin
      if MessageDlg('No existe un ambiente de digitalización en DESARROLLO.' + #13#10 +
        '¡¡¡ El proceso va a actualizar información en el Servidor FTP que puede afectar los reportes de Producción ya generados !!!'
         + #13#10 + '¿Desea continuar?', mtWarning, [mbAbort, mbYes, mbNo, mbCancel], 0 ) = mrYes then
      begin
        if not ( MessageDlg('¿Estás seguro?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes ) then
          Exit;
        //ends_if
      end else begin
        PPTodoOk  := True;
        PPComenta := 'Todo OK+';
        Exit;
      end;
      //
    end;//Ends_if
    //
      vlSql := ObtQryAviso('V','',coCveIntXDev,  'EPDEAB', 'F',  '','', PFechaCierre,PFechaCierre);
      if vlSql = '' then
        exit;
      //end
      Qry := GetSQLQueryNoNil( vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
      //
      if Assigned(Qry) and not( Qry.IsEmpty ) then
      begin
        while not Qry.Eof do
        begin
          //limpia tabla cesion
          if not LimpiaTblAviso(Objeto.Apli.DatabaseName, Objeto.Apli.SessionName,PPComenta) then
          Begin
            PPTodoOk  := False;
            Exit;
          end;
          //adiciona cesion
          if not AgregaAviso( Qry.FieldByName('ID_CESION').AsInteger,
                              Qry.FieldByName('ID_DOCUMENTO').AsString,
                              coCveIntXDev,
                              Objeto.Apli.DatabaseName,
                              Objeto.Apli.SessionName,
                              PPComenta ) then
          Begin
            PPTodoOk  := False;
            Exit;
          end;

          //genera reporte
          sFileName := 'DEVAB_' + Qry.FieldByName('ID_CESION').AsString +'_'+ FormatDateTime('dd_mm_yyyy', PFechaCierre );
//          showmessage('Genera Archivo '+sFileName);

          RepAvMailxDoc( Qry.FieldByName('ID_CESION').AsString,coDEVAB, coCveIntXDev, coEP, 'EPDEAB', FormatDateTime('dd/mm/yyyy', PFechaCierre ),
                         Objeto.Apli, False, grDigitaliza, sFileName, Qry.FieldByName('MAIL_PROV').AsString );

          Qry.Next;
        end;//ends_if
      end;
      if Assigned(Qry) then
      begin
        Qry.Close;
        Qry.Free;
      end;
    //
end;
//AVISOS DE MORATORIOS ( CARGO )
procedure TWCrCierre.FunDigAvMoratorios(PFechaCierre: TDate; var PPComenta: String; var PPTodoOk: Boolean);
var sFileName  : String;
    Directorio : String;
    vlSql      : String;
    Qry : TQuery;
    s, d, ss : ShortString;
    Count2, nCount : Integer;
    //
    sLocalFile : String;
    sAcrobatFile : String;
    sRemoteFile  : String;
begin
    PPTodoOk  := True;
    PPComenta := 'Todo OK+';
    nCount := 1;
    //
    if Objeto.Apli.IsProd = False then
    begin
      if MessageDlg('No existe un ambiente de digitalización en DESARROLLO.' + #13#10 +
        '¡¡¡ El proceso va a actualizar información en el Servidor FTP que puede afectar los reportes de Producción ya generados !!!'
         + #13#10 + '¿Desea continuar?', mtWarning, [mbAbort, mbYes, mbNo, mbCancel], 0 ) = mrYes then
      begin
        if not ( MessageDlg('¿Estás seguro?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes ) then
          Exit;
        //ends_if
      end else begin
        PPTodoOk  := True;
        PPComenta := 'Todo OK+';
        Exit;
      end;
      //
    end;//Ends_if
    //
      vlSql := ObtQryAviso('V','', coCveMoras, 'EPMOCA', 'F', '','', PFechaCierre,PFechaCierre);
      if vlSql = '' then
        exit;
      //end

      Qry := GetSQLQueryNoNil( vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
      //
      if Assigned(Qry) and not( Qry.IsEmpty ) then
      begin
        while not Qry.Eof do
        begin
          //limpia tabla cesion
          if not LimpiaTblAviso(Objeto.Apli.DatabaseName, Objeto.Apli.SessionName,PPComenta) then
          Begin
            PPTodoOk  := False;
            Exit;
          end;
          //adiciona cesion
          if not AgregaAviso( Qry.FieldByName('ID_CESION').AsInteger, Qry.FieldByName('ID_DOCUMENTO').AsString,
                              coCveMoras,Objeto.Apli.DatabaseName, Objeto.Apli.SessionName,PPComenta ) then
          Begin
            PPTodoOk  := False;
            Exit;
          end;
          //genera reporte
          sFileName := 'MORCA_' + Qry.FieldByName('ID_CESION').AsString +'_'+ FormatDateTime('dd_mm_yyyy', PFechaCierre );
//          showmessage('Genera Archivo '+sFileName);

          RepAvMailxDoc( Qry.FieldByName('ID_CESION').AsString, coMORCA, coCveMoras, coEP, 'EPMOCA', FormatDateTime('dd/mm/yyyy', PFechaCierre ),
                         Objeto.Apli, False, grDigitaliza, sFileName, Qry.FieldByName('MAIL_PROV').AsString );

          Qry.Next;
        end;//ends_if
      end;
      if Assigned(Qry) then
      begin
        Qry.Close;
        Qry.Free;
      end;
    //
end;

// Procesos contables para SAP
// <Inician Cambios SATV4766 del 13FEB2008>
function TCrCierre.FunGenMovtosSAP(pFecha: TDateTime; var PPResultado: String): Boolean;
var  StpGenMovtosSAP : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   Result := False;
   Try
     StpGenMovtosSAP := TStoredProc.Create(Self);
     With StpGenMovtosSAP Do
     Begin
        //Inicia el SPT
        StpGenMovtosSAP.DatabaseName:= Apli.DatabaseName;
        StpGenMovtosSAP.SessionName:= Apli.SessionName;
        StpGenMovtosSAP.StoredProcName:= 'ADMIPROD.PKGCRSAP.STP_GENERA_MOVTOS_SAP';

        Params.Clear;
        Params.CreateParam( ftFloat,  'peID_EMPRESA',   ptInput);
        Params.CreateParam( ftDate,   'peF_OPERACION',  ptInput);
        Params.CreateParam( ftString, 'peCVE_USUARIO',  ptInput);
        Params.CreateParam( ftFloat,  'psRESULTADO',    ptOutput);
        Params.CreateParam( ftString, 'psTX_RESULTADO', ptOutput);

        Prepare;
        ParamByName('peID_EMPRESA').AsInteger   := Apli.IdEmpresa;
        ParamByName('peF_OPERACION').AsDateTime := pFecha;
        ParamByName('peCVE_USUARIO').asString   := Apli.Usuario;
        ExecProc;

        If (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('psTX_RESULTADO').AsString;
           vlResult := False;
        End;
        //end if;
     end;
   Finally
        If Assigned(StpGenMovtosSAP) Then
           StpGenMovtosSAP.Free;
        //end if;
   End;
   Result := vlResult;
end;

function TCrCierre.FunGenContaDllsICRE(pFecha: TDateTime; var PPResultado: String): Boolean;
var  StpGenMovtosSAP : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   Result := False;
   Try
     StpGenMovtosSAP := TStoredProc.Create(Self);
     With StpGenMovtosSAP Do
     Begin
        If Not vgDatabaseCONT.Connected Then vgDatabaseCONT.Connected := True;

        //Inicia el SPT
        StpGenMovtosSAP.DatabaseName:= vgDatabaseCONT.DatabaseName;
        StpGenMovtosSAP.SessionName:= vgDatabaseCONT.SessionName;
        StpGenMovtosSAP.StoredProcName:= 'ADMIPROD.PKGINTERFAZSAP.STP_CONTA_DLLS_ICRE01';

        Params.Clear;
        Params.CreateParam( ftFloat,  'peID_EMPRESA',   ptInput);
        Params.CreateParam( ftDate,   'peF_OPERACION',  ptInput);
        Params.CreateParam( ftFloat,  'psRESULTADO',    ptOutput);
        Params.CreateParam( ftString, 'psTX_RESULTADO', ptOutput);

        Prepare;
        ParamByName('peID_EMPRESA').AsInteger   := Apli.IdEmpresa;
        ParamByName('peF_OPERACION').AsDateTime := pFecha;
        ExecProc;

        If (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('psTX_RESULTADO').AsString;
           vlResult := False;
        End;
        //end if;
     end;
   Finally
        If Assigned(StpGenMovtosSAP) Then
           StpGenMovtosSAP.Free;
        //end if;
   End;
   Result := vlResult;
end;
// </Termina Cambios SATV4766>

//<EASA 06jun2008 ACTIVA DISPOSCIONES LIQUIDADAS POR VTO EN DIA INHÁBIL>
Function  TCrCierre.FunActivaDispLQ( pFecha : TDateTime; var PPResultado: String) : Boolean;
var  StpActivaDispLQ : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   Result := False;
   Try
     StpActivaDispLQ := TStoredProc.Create(Self);
     With StpActivaDispLQ Do
     Begin
        //Inicia el SPT
        StpActivaDispLQ.DatabaseName:= Apli.DatabaseName;
        StpActivaDispLQ.SessionName:= Apli.SessionName;
        StpActivaDispLQ.StoredProcName:= 'PKGCRCIERRE.STP_ACT_VTO_CRED';

        Params.Clear;
        Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput);
        Params.CreateParam( ftDate,   'PEFPROCESO',  ptInput);
        Params.CreateParam( ftString, 'PEBCOMMIT',  ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',    ptOutput);
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput);

        Prepare;
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDateTime := pFecha;
        ParamByName('PEBCOMMIT').AsString := 'V';
        ExecProc;

        If (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
           vlResult := False;
        End;
        //end if;
     end;
   Finally
        If Assigned(StpActivaDispLQ) Then
           StpActivaDispLQ.Free;
        //end if;
   End;
   Result := vlResult;
end;
        //EASA>

//<ROUY 16jun2008 CALCULA CONTRATOS CON ACTIVIDAD - IG>
Function  TCrCierre.FunIgCtoActiv( pFecha : TDateTime; var PPResultado: String) : Boolean;
var  StpIgCtoActiv : TStoredProc;
     vlResult      : Boolean;
Begin
   vlResult := True;
   Result := False;
   Try
     StpIgCtoActiv := TStoredProc.Create(Self);
     With StpIgCtoActiv Do
     Begin
        //Inicia el SPT
        StpIgCtoActiv.DatabaseName:= Apli.DatabaseName;
        StpIgCtoActiv.SessionName:= Apli.SessionName;
        StpIgCtoActiv.StoredProcName:= 'PKGCR_IG_CTO_ACTIV.SP_PROCESA_CTO_ACTIVIDAD';

        Params.Clear;
        Params.CreateParam( ftString, 'PEORIGEN',   ptInput);
        Params.CreateParam( ftDate,   'PEF_REPROCESO',  ptInput);
        Params.CreateParam( ftString, 'PEB_REPROC_LINE',  ptInput);
        Params.CreateParam( ftString, 'PECVE_USU_ALTA',  ptInput);
        Params.CreateParam( ftFloat,  'PSRESULTADO',    ptOutput);
        Params.CreateParam( ftString, 'PSTX_RESULTADO', ptOutput);

        Prepare;
        ParamByName('PEORIGEN').AsString        := 'QRY';
        ParamByName('PEF_REPROCESO').AsDateTime := pFecha; //revisar paso de parámetro
        ParamByName('PEB_REPROC_LINE').AsString := 'F';
        ParamByName('PECVE_USU_ALTA').AsString  := Apli.Usuario;
        ExecProc;

        If (ParamByName('PSRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('PSTX_RESULTADO').AsString;
           vlResult := False;
        End;
        //end if;
     end;
   Finally
        If Assigned(StpIgCtoActiv) Then
           StpIgCtoActiv.Free;
        //end if;
   End;
   Result := vlResult;
end;
        //ROUY>


//<LOLS 19ENE2006 Digitalización de reportes>
procedure TWCrCierre.ValDigitalizaRep(PFechaCierre: TDate;
  NumFiles: Integer; var PPComenta: String; var PPTodoOk: Boolean);
var Directorio : String;
begin
  PPTodoOk  := True;
  PPComenta := 'Todo OK';
  try
     if NMFTP1.Connected then NMFTP1.Disconnect;
     //
     NMFTP1.Host     := obtValorGpoCve( 'CONFRH', 'FTPSERVER', Objeto.Apli );
     NMFTP1.UserID   := obtValorGpoCve( 'CONFRH', 'USERNAME',  Objeto.Apli );
     NMFTP1.Password := HexToStr( obtValorGpoCve( 'CONFRH', 'PASSWORD',  Objeto.Apli ) );
     NMFTP1.Connect;
     Directorio := obtValorGpoCve( 'CONFRH', 'ROOTDIR',   Objeto.Apli );
     if Directorio[length(Directorio)] = '/' then
       delete(Directorio, length(Directorio), 1 );
     //
     Directorio := Directorio + ObtSendTo( DateToStr(PFechaCierre) );
     NMFTP1.ChangeDir( Directorio );
     NumFilesFTP := 0;
     NMFTP1.NList;
     if NumFiles <> NumFilesFTP then
     begin
       PPTodoOk  := False;
       PPComenta := Format( 'Número de reportes a digitalizar %d Número de reportes digitalizados %d',
                            [ NumFiles, NumFilesFTP ] );
     end;
     //
     if NMFTP1.Connected then NMFTP1.Disconnect;
  except
     on e : exception do
     begin
       PPTodoOk  := True;
       PPComenta := e.Message;
     end;
  end;
end;
//</LOLS>

procedure TWCrCierre.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;


   InterProcesos1.Apli := Objeto.Apli;
   InterProcesos1.Proceso := 'CR_NCIERRE';
   InterProcesos1.FOpera := ObtenFSiguienteCierre;
   if InterProcesos1.FOpera > Objeto.Apli.DameFechaEmpresa then
      InterProcesos1.FOpera := Objeto.Apli.DameFechaEmpresa;

   InterProcesos1.ArmaTree;
   bbApertura.SetFocus;

  //<SATV4766> 13Feb2008
   If Objeto.Apli.IsProd Then Objeto.vgDatabaseCONT := DatabasePCONT
   Else Objeto.vgDatabaseCONT := DatabaseDCONT;
  //</SATV4766>
end;

procedure TWCrCierre.FormDestroy(Sender: TObject);
begin
//
end;

procedure TWCrCierre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  //<SATV4766>
  If Assigned(Objeto.vgDatabaseDWHC) Then
    Begin
    Objeto.vgDatabaseDWHC.Close;
    Objeto.vgDatabaseDWHC.Free;
    End;

  DatabasePCONT.Close;
  DatabaseDCONT.Close;  
  //</SATV4766>
end;

//<LOLS 17FEB2006 Digitalización de reportes>
procedure TWCrCierre.NMFTP1ListItem(Listing: String);
var sScan : String;
begin
  sScan  := FormatDateTime('dd_mm_yyyy', InterProcesos1.FOpera );
  if Pos( sScan, Listing ) > 0 then
     Inc(NumFilesFTP);
  //Ends_if
{}
end;
//</LOLS>


procedure TWCrCierre.InterProcesos1GeneraProceso(Sender: TObject;
  PPCveProceso: String; PPNumSecuencia: Integer; PPCveProcesoRel,
  PPCveFuncion: String; PPDigitaliza: Boolean; var PPComenta: String;
  var PPTodoOk: Boolean);
var TxResultado : String;
    vlFCierre   : TDateTime;
    vlMsgErr    : String;

    procedure  MsgError(vlError : String);
    Begin
         PPComenta := vlError;
         vcUltErr := vlError;
         EXECUTE_MUESTRAMENSAJE(vlError);
    end;

begin
     vlFCierre := InterProcesos1.FOpera;
     vcUltErr := '';


     if (vgcvefunc = PPCveFuncion) and (vgnumsecu = IntToStr(PPNumSecuencia)) then   // ENVÍA NOTIFICACIÓN DE INICIO DE PRIMER PROCESO JFOF 04/02/2014
         EnviaMailInicio(PPCveFuncion);


     if PPCveFuncion = 'VALVENC' then
     Begin
        PPTodoOk := Objeto.FuncValVenc(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en la validación de vencimientos. '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end

//20100908 Desarrollo Factoraje Electrónico y Plazo residual
     else    if PPCveFuncion = 'CIERREFACELE' then
     Begin
        //PPTodoOk := Objeto.FunCierreFacEle(vlFCierre,TxResultado);
        PPTodoOk := Objeto.FunCierreFactElect(vlFCierre, TxResultado);
        if Not(PPTodoOk) then
        begin
           vlMsgErr := 'Problemas en el Proceso de Cierre de Factoraje Electrónico: '+ (TxResultado);
           MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
     end

// INICIO ENVIO DE ALERTAS FECHA DE VENCIMIENTO REAL JFOF FEBRERO 2013
     else    if PPCveFuncion = 'ENVALERVEN' then
     Begin
        PPTodoOk := Objeto.FunEnvioAlertasVenc(vlFCierre, TxResultado);
        PPComenta := 'Todo OK';
     end
// FIN  ENVIO DE ALERTAS FECHA DE VENCIMIENTO REAL JFOF FEBRERO 2013


// INICIO CIERRE DE PREMIO POSIBLE A OTORGAR JFOF ABRIL 2013
     else    if PPCveFuncion = 'CIERREPPO' then
     Begin
        PPTodoOk := Objeto.FunCierrePremioPO(vlFCierre, TxResultado);
        if Not(PPTodoOk) then
        begin
           vlMsgErr := 'Problemas en el Proceso de Cierre de Premio Posible a Otorgar: '+ (TxResultado);
           MsgError(vlMsgErr);
        end
        else
        PPComenta := 'Todo OK';
     end
// FIN  CIERRE DE PREMIO POSIBLE A OTORGAR JFOF ABRIL 2013

     else    if PPCveFuncion = 'CARGAPLARES' then
     Begin
        PPTodoOk := Objeto.FunCargaPlazoRes(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en la carga de Plazo Residual'+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end
//20100908 Desarrollo Factoraje Electrónico y Plazo residual
//--> 20100922 Desarrollo Anexos 8 9 Nafin
     else    if PPCveFuncion = 'CARGAAN89NAF' then
     Begin
        PPTodoOk := Objeto.FunCargaAn89Naf(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en la carga de anexos 8,9 Nafin'+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end
//<-- 20100922 Desarrollo Anexos 8 9 Nafin
//--> 20101116 Carga IVA Repecos
     else    if PPCveFuncion = 'CARGAIVAREPE' then
     Begin
        PPTodoOk := Objeto.FunCargaIvaRepecos(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en la carga IVA Repecos '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end
//<-- 20101116 Carga IVA Repecos
     else    if PPCveFuncion = 'GENINTDIARIO' then
     Begin
        PPTodoOk := Objeto.FuncGenIntDiario(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en la Generación de Interes Diario'+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end
     else    if PPCveFuncion = 'GENMORADIARIO' then
     Begin
        PPTodoOk := Objeto.FuncGenMoraDiario(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en la Generación de Moratorios Diario'+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end
     else    if PPCveFuncion = 'CARGAHISTO' then
     Begin
        PPTodoOk := Objeto.FuncCargaHisto(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en la Carga Historica'+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end
     else    if PPCveFuncion = 'TRASPASOICR' then
     Begin
        PPTodoOk := Objeto.FuncTraspasoICR(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en el Traspaso del ICR '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end
     else    if PPCveFuncion = 'CONTPROVDIARIA' then
     Begin
        PPTodoOk := Objeto.FuncContProvDiaria(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en la Provisión diaria de la contabilidad '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end
     else    if PPCveFuncion = 'CONTPROVVENC' then
     Begin
        PPTodoOk := Objeto.FuncContProvVenc(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en la Provisión de Vencimientos de la contabilidad '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end
     else    if PPCveFuncion = 'CONTAVENC' then
     Begin
        PPTodoOk := Objeto.FuncContaVencidos(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en los Vencidos  de la contabilidad '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end

     else    if PPCveFuncion = 'CONTAGRCOMIS' then
     Begin
        PPTodoOk := Objeto.FunContAgrComision(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en la Comisión de Agronegocios '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end

     else    if PPCveFuncion = 'CONTCOLGAR' then
     Begin
        PPTodoOk := Objeto.FuncContColocGtia(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en la Colocación de Garantías '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end

     else    if PPCveFuncion = 'CONTPAGOGAR' then
     Begin
        PPTodoOk := Objeto.FuncContPagoGtia(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en el Pago de Garantías '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end

     else    if PPCveFuncion = 'CONTCAPIGAR' then
     Begin
        PPTodoOk := Objeto.FunContCapiGtia(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en la Capitalización de Garantías '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end
     
     else    if PPCveFuncion = 'CONTTRANSACC' then
     Begin
        PPTodoOk := Objeto.FuncContTransacc(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en la Transacción Contable '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end
     else    if PPCveFuncion = 'ALTABITSEGUIMIEN' then
     Begin
        PPTodoOk := Objeto.FuncAltaSeguimiento(vlFCierre + 1, {carga siguiente dia}
                                               TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en el Alta de Seguimientos '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end
     else if PPCveFuncion = 'FINAN_ADIC' then
     begin
        PPTodoOk := Objeto.FunFinanAdic(vlFCierre + 1,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en Financiamiento Adicional Automático '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
     end
     else if PPCveFuncion = 'ACTFCIERRE' then
     begin
        PPTodoOk := Objeto.FunActFCierre(vlFCierre + 1,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas al actualizar la fecha del cierre '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
     end
     else if PPCveFuncion = 'DEPURACRED' then
     begin
        PPTodoOk := Objeto.FunDepuraCred(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas al realizar depuración de contratos '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
     end
     else if PPCveFuncion = 'GENERATASAS' then
     begin
        PPTodoOk := Objeto.FunGeneraTasas(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas al generar tasas '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
     end
     else if PPCveFuncion = 'CRUPDIMPDIS' then
     begin
       PPTodoOk := False;
       Objeto.stpUpdImpDispuesto( vlFCierre, PPComenta, PPTodoOk );
       //
       if Not(PPTodoOk) then
       begin
         vlMsgErr := 'Problemas al actualizar el importe dispuesto: ' + (PPComenta);
         MsgError(vlMsgErr);
       end;
     end
     else if PPCveFuncion = 'ESTADHIST' then
     begin
        PPTodoOk := Objeto.FunEstadisticasHist(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas al generar estadísticas históricas: '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
     end
     else if PPCveFuncion = 'VENTTOPASIVO' then
     begin
        PPTodoOk := Objeto.FunValVencPasivo(vlFCierre, TxResultado);
        if Not(PPTodoOk) then
        begin
          vlMsgErr := 'Problemas al generar vencimientos pasivos: '+ (TxResultado);
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
     end
     else if PPCveFuncion = 'INTPASIVO' then
     begin
        PPTodoOk := Objeto.FunIntDiarioPasivo(vlFCierre, TxResultado);
        if Not(PPTodoOk) then
        begin
          vlMsgErr := 'Problemas al calcular el interés diario pasivo: '+ (TxResultado);
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
     end
     else if PPCveFuncion = 'CARGAPASIVA' then
     begin
        PPTodoOk := Objeto.FunCargaHistPasiva(vlFCierre, TxResultado);
        if Not(PPTodoOk) then
        begin
          vlMsgErr := 'Problemas al realizar la carga histórica pasiva: '+ (TxResultado);
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
     end
     else if PPCveFuncion = 'CAPIPASIVA' then
     begin
        PPTodoOk := Objeto.FunCapitalizaPasivo(vlFCierre, TxResultado);
        if Not(PPTodoOk) then
        begin
          vlMsgErr := 'Problemas al realizar la capitalización pasiva: '+ (TxResultado);
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
     end
     else if PPCveFuncion = 'GENLOTECONT' then
     begin
        PPTodoOk := Objeto.FunGenLoteCont(vlFCierre, TxResultado);
        if Not(PPTodoOk) then
        begin
          vlMsgErr := 'Problemas al generar el lote contable : '+ (TxResultado);
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
     end
     //< EASA4011   BORRA DATOS SAP 12/02/2008
     else if PPCveFuncion = 'CLEARCONTASAP' then
     begin
        PPTodoOk := Objeto.FunBorraDatosSAP(vlFCierre, obtValorGpoCve( 'CONTAC', 'CLASEDOCTO', Objeto.Apli ), TxResultado);
        if Not(PPTodoOk) then
        begin
          vlMsgErr := 'Problemas al Borrar datos en SAP clase docto : '+obtValorGpoCve( 'CONTAC', 'CLASEDOCTO', Objeto.Apli )+ (TxResultado);
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if

        PPTodoOk := Objeto.FunBorraDatosSAP(vlFCierre, obtValorGpoCve( 'CONTPS', 'CLASEDOCTO', Objeto.Apli ), TxResultado);
        if Not(PPTodoOk) then
        begin
          vlMsgErr := 'Problemas al Borrar datos en SAP clase docto : '+obtValorGpoCve( 'CONTPS', 'CLASEDOCTO', Objeto.Apli )+ (TxResultado);
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if

     end
     else if PPCveFuncion = 'CONTCOLOCA' then
     begin
// </ RABA > SEP  2011
//        PPTodoOk := Objeto.FunContColoPasiva(vlFCierre, TxResultado);
        PPTodoOk := Objeto.FunContaPasivaED(vlFCierre, TxResultado);
// < RABA />
        if Not(PPTodoOk) then
        begin
// </ RABA > SEP  2011
//          vlMsgErr := 'Problemas en la contabilidad de la  colocación pasiva: '+ (TxResultado);
          vlMsgErr := 'Problemas en la contabilidad pasiva: '+ (TxResultado);
// < RABA />
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
     end

    //HERJA AGOSTO 2012
     else if PPCveFuncion = 'HISTOINTERES' then
     begin
        PPTodoOk := Objeto.FunHistoInteres(vlFCierre, TxResultado);
        if Not(PPTodoOk) then
        begin
           vlMsgErr := 'Problemas en la Carga Historica de Intereses: '+ (TxResultado);
           MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
     end
     else if PPCveFuncion = 'AJUSTESCONT' then
     begin
        PPTodoOk := Objeto.FunAjustesContables(vlFCierre, TxResultado);
        if Not(PPTodoOk) then
        begin
           vlMsgErr := 'Problemas en el Proceso de Ajustes Contables: '+ (TxResultado);
           MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
     end
    //FIN HERJA AGOSTO 2012

     // CARGA CONTABLE CONT SAP     SATV13FEB2008
     else if PPCveFuncion = 'CRCONTSAP' then
     begin
       PPTodoOk  := Objeto.FunGenContaDllsICRE(vlFCierre, TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas Traspasa a SAP movtos en DLLS :'+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end
     //END_SATV

     else if PPCveFuncion = 'CONTPROVISION' then
     begin
// </ RABA > SEP 2011
//        PPTodoOk := Objeto.FunContProvPasiva(vlFCierre, TxResultado);
        PPTodoOk := Objeto.FunContaProvPasivaED(vlFCierre, TxResultado);
// < RABA />
        if Not(PPTodoOk) then
        begin
          vlMsgErr := 'Problemas en la contabilidad de la provisión pasiva: '+ (TxResultado);
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
     end
     else if PPCveFuncion = 'CONTPROVRETRO' then
     begin
// </ RABA > SEP 2011
// SE DESHABILITA EL LLAMADO. SE INTEGRA EN 'CONTCOLOCA'
        PPTodoOk  := True;
        PPComenta := 'Todo OK';
        {
        PPTodoOk := Objeto.FunContProvRetPasiva(vlFCierre, TxResultado);
        if Not(PPTodoOk) then
        begin
          vlMsgErr := 'Problemas en la contabilidad de la provisión retroactiva pasiva: '+ (TxResultado);
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
        }
     end
     else if PPCveFuncion = 'CONTCAPITALIZA' then
     begin
// </ RABA > SEP 2011
// SE DESHABILITA EL LLAMADO. SE INTEGRA EN 'CONTCOLOCA'
        PPTodoOk  := True;
        PPComenta := 'Todo OK';
        {
        PPTodoOk := Objeto.FunContCapiPasiva(vlFCierre, TxResultado);
        if Not(PPTodoOk) then
        begin
          vlMsgErr := 'Problemas en la contabilidad de la capitalización pasiva: '+ (TxResultado);
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
        }
     end
     else if PPCveFuncion = 'CONTVENTTOCA' then
     begin
// </ RABA > SEP 2011
// SE DESHABILITA EL LLAMADO. SE INTEGRA EN 'CONTCOLOCA'
        PPTodoOk  := True;
        PPComenta := 'Todo OK';
        {
        PPTodoOk := Objeto.FunContVenttoCAPasivo(vlFCierre, TxResultado);
        if Not(PPTodoOk) then
        begin
          vlMsgErr := 'Problemas en la contabilidad de la capitalización pasiva: '+ (TxResultado);
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
        }
     end
     else if PPCveFuncion = 'CONTVENTTOIN' then
     begin
// </ RABA > SEP 2011
// ESTO ESTA DESHABILITADO CON ANTERIORIDAD 
        PPTodoOk  := True;
        PPComenta := 'Todo OK';
        {
        PPTodoOk := Objeto.FunContVenttoINPasivo(vlFCierre, TxResultado);
        if Not(PPTodoOk) then
        begin
          vlMsgErr := 'Problemas en la contabilidad de la capitalización pasiva: '+ (TxResultado);
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
        }
     end
     else if PPCveFuncion = 'CONTVENTTOCN' then
     begin
// </ RABA > SEP 2011
// SE DESHABILITA EL LLAMADO. SE INTEGRA EN 'CONTCOLOCA'
        PPTodoOk  := True;
        PPComenta := 'Todo OK';
        {
        PPTodoOk := Objeto.FunContVenttoCNPasivo(vlFCierre, TxResultado);
        if Not(PPTodoOk) then
        begin
          vlMsgErr := 'Problemas en la contabilidad de la capitalización pasiva: '+ (TxResultado);
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
        }
     end
     //<LOLS 28 ABR 2006 PROVISION DE GTIA PYME>
     else if PPCveFuncion = 'CONTPVCIFNDCN' then
     begin
// </ RABA > SEP 2011
//        PPTodoOk := Objeto.FunContVenttoCNPVCI(vlFCierre, TxResultado);
        PPTodoOk := Objeto.FunContProvComPymeED(vlFCierre, TxResultado);
// < RABA />
        if Not(PPTodoOk) then
        begin
          vlMsgErr := 'Problemas en la provisión de las comisiones: '+ (TxResultado);
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
     end
     else if PPCveFuncion = 'CRCARGACOMPYME' then
     begin
        PPTodoOk  := True;
        PPComenta := 'Todo OK';
        if Objeto.FunEsFinDeMes(vlFCierre) then
        Begin
          //
          PPTodoOk := Objeto.stpCargaComPYME(vlFCierre, TxResultado);
          if Not(PPTodoOk) then
          begin
            vlMsgErr := 'Problemas al cargar la comisión PYME: '+ (TxResultado);
            MsgError(vlMsgErr);
          end else begin
             PPComenta := 'Todo OK';
          end;//end if
          //
        End;
     end
     //</LOLS>
     else  if PPCveFuncion = 'CARGAHISTOCAU' then
     Begin
        PPTodoOk := Objeto.FunCargaHistoCaucion(vlFCierre,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas en la Carga Histórica de Garantías en Caución Bursátil'+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end
     //
     else if PPCveFuncion = 'CRGENCOMIS' then
     begin
       PPTodoOk  := Objeto.FunCierreComis(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         PPComenta := 'Problemas en la generación de comisiones : '+ (TxResultado);
         MsgError(PPComenta);
       end;
     end
     //
     else if PPCveFuncion = 'CRTRCARTERA' then
     begin
       PPTodoOk  := Objeto.FunTrCartera(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         PPComenta := 'Problemas en el traspaso de cartera :'+ (TxResultado);
         MsgError(PPComenta);
       end;
     end
     //
     else if PPCveFuncion = 'CRACTCALACR' then
     begin
       PPTodoOk  := Objeto.FunActCalAcred(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         PPComenta := 'Problemas al Actualizar la Calificación de los Acreditados :'+ (TxResultado);
         MsgError(PPComenta);
       end;
     end
     //Activa Chequeras bloqueo de saldos       EASA4011 11102005
     else if PPCveFuncion = 'CRACTIVBUSQ' then
     begin
       PPTodoOk  := Objeto.FunActivBusqChqras(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         PPComenta := 'Problemas al Activar Búsqueda de Chequeras :'+ (TxResultado);
         MsgError(PPComenta);
       end;
     end
     //Da de Alta las Solicitudes de Pago de FIDEICOMISO    SATV4766 02102005
     else if PPCveFuncion = 'CRALTASOLFI' then
     begin
       PPTodoOk  := Objeto.FunAltaFidSolCuotas(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         PPComenta := 'Problemas al Dar de Alta las Solicitudes de Pago FIDEICOMISO :'+ (TxResultado);
         MsgError(PPComenta);
       end;
     end
     //Da de Alta las Solicitudes de Pago de FIDEICOMISO    SATV4766 15Feb2006
     else if PPCveFuncion = 'CRACTPAGNIV' then
     begin
       PPTodoOk  := Objeto.FunActIntPagNiv(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         PPComenta := 'Problemas al Actualizar el Intéres de los Pagos Nivelados :'+ (TxResultado);
         MsgError(PPComenta);
       end;
     end

     //< EASA4011   CONTABILIDAD PASIVA SAP 01/02/2008
     else if PPCveFuncion = 'CRCONTPASIVA' then
     begin
        PPTodoOk := Objeto.stpContaPasiva(vlFCierre, TxResultado);
        PPComenta := 'Todo OK';
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas al GENERAR LA CONTABILIDAD PASIVA << SAP >> '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
             PPComenta := 'Todo OK';
        //end if
     end
     // EASA4011 >/

     { EASA4011        22/11/2005              GENERA ESTADO DE CUENTA              }

     {INICIO            JFOF 06/03/2014 }
     // SE COMENTA CÓDIGO PARA OPTIMIZAR TIEMPOS EN CIERRE DIARIO. ESTA FUNCIÓN SE MIGRA A LA APLICACIÓN DE GENERA ESTADOS DE CUENTA "IntCrCieEdc"
     else if PPCveFuncion = 'GENEDOCTA' then
     begin
      PPTodoOk  := True;
      PPComenta := 'Todo OK';
{       PPTodoOk  := Objeto.FunGenEdoCta(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         PPComenta := 'Problemas al Generar el Edo. de Cta. :'+ (TxResultado);
         MsgError(PPComenta);
       end;}
     end
     {FIN               JFOF 06/03/2014 }

     { /EASA4011 }

     //<LOLS 12ENE2006 Carga información de buro de crédito>
     else if PPCveFuncion = 'CRCARGABCICRE' then
     begin
       Objeto.FunCargaBCCred(vlFCierre, PPComenta, PPTodoOk);
       //<LOLS 28 ABR 2006>
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         PPComenta := 'CRCARGABCICRE:'+ (PPComenta);
         MsgError(PPComenta);
       end;
       //</LOLS>
     end

     //<MOAA 26MAR2009 Carga información de buro de crédito>
     else if PPCveFuncion = 'CRCARGABCEBUREAU' then
     begin
       Objeto.FunCargaBCeBureau(vlFCierre, PPComenta, PPTodoOk);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         PPComenta := 'CRCARGABCEBUREAU:'+ (PPComenta);
         MsgError(PPComenta);
       end;
     end
     //<MOAA>

     //<LOLS 19ENE2006 Digitalización de reportes>
     else if PPCveFuncion = 'CRDIGITALIZAREP' then
     begin
       FunDigitalizaRep(vlFCierre, PPComenta, PPTodoOk);
       //<LOLS 28 ABR 2006>
       if PPTodoOk then
       Begin
         ValDigitalizaRep(vlFCierre, coNumRepFTP, PPComenta, PPTodoOk );
         if PPTodoOk then
         begin
           PPComenta := 'Todo OK';
         end else begin
           PPComenta := 'CRVALDIGREP:'+ (PPComenta);
           MsgError(PPComenta);
         end;
       End Else
       Begin
         PPComenta := 'CRDIGITALIZAREP:'+ (PPComenta);
         MsgError(PPComenta);
       End;
       //</LOLS>
     end
     //</LOLS>
     //<EASA    31.10.2007      DIGITALIZA AVISOS COLOCACION(CARGO) Y COBRANZA (ABONO Y CARGO)
     //<EASA    DIGITALIZA AVISOS COLOCACION(CARGO)
     else if PPCveFuncion = 'CRDIGAVCOLOCA' then
     begin
       FunDigAvColocacion(vlFCierre, PPComenta, PPTodoOk);
       if PPTodoOk then
           PPComenta := 'Todo OK'
       Else
       Begin
         PPComenta := 'CRDIGAVCOLOCA:'+ (PPComenta);
         MsgError(PPComenta);
       End;
     END
     //<EASA    DIGITALIZA AVISOS REMANETES(ABONO)
     else if PPCveFuncion = 'CRDIGAVREMAB' then
     begin
       FunDigAvRemanentes(vlFCierre, PPComenta, PPTodoOk);
       if PPTodoOk then
           PPComenta := 'Todo OK'
       Else
       Begin
         PPComenta := 'CRDIGAVREMAB:'+ (PPComenta);
         MsgError(PPComenta);
       End;
     END
     //<EASA    DIGITALIZA AVISOS DEV. INTERESES (ABONO)
     else if PPCveFuncion = 'CRDIGAVDEVAB' then
     begin
       FunDigAvDevInteres(vlFCierre, PPComenta, PPTodoOk);
       if PPTodoOk then
           PPComenta := 'Todo OK'
       Else
       Begin
         PPComenta := 'CRDIGAVDEVAB:'+ (PPComenta);
         MsgError(PPComenta);
       End;
     END
     //<EASA    DIGITALIZA AVISOS MORATORIOS (CARGO)
     else if PPCveFuncion = 'CRDIGAVMORCA' then
     begin
       FunDigAvMoratorios(vlFCierre, PPComenta, PPTodoOk);
       if PPTodoOk then
           PPComenta := 'Todo OK'
       Else
       Begin
         PPComenta := 'CRDIGAVMORCA:'+ (PPComenta);
         MsgError(PPComenta);
       End;
     END
       //</EASA>
     // Envia por correo las solicitudes de Pago de Fideicomiso SATV4766 01102005
     else if PPCveFuncion = 'CRENVSOLPAG' then
     begin
        EnviaCorreos_SolicitudPago(Objeto.Apli);
     end
     // <ROIM>  18/04/2006 GENERA PROVISIÓN VALORIZADA
     else if PPCveFuncion = 'CRGENPROVAL' then
     begin
       PPTodoOk  := Objeto.FunGenProVal(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         PPComenta := 'Problemas en generación de provisión valorizada :'+ (TxResultado);
         MsgError(PPComenta);
       end;
     end
     //</ROIM>
     // <ROIM>  18/04/2006 GENERA CONCEPTOS VALORIZADOS
     else if PPCveFuncion = 'CRGENCONVAL' then
     begin
       PPTodoOk  := Objeto.FunGenConVal(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         PPComenta := 'Problemas en generación de conceptos valorizados :'+ (TxResultado);
         MsgError(PPComenta);
       end;
     end
     //</ROIM>
     //<ROIM 19/05/2006 GENERACIÓN TRANSACCION DE GARANTÍAS
     else if PPCveFuncion = 'CRGENTRAGAR' then
     begin
       PPTodoOk  := Objeto.FunGenTranGar(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         PPComenta := 'Problemas en generación de garantías contabilidad :'+ (TxResultado);
         MsgError(PPComenta);
       end;
     end
     //</ROIM>
     //<EASA4011 24ENE2006 Genera Vencimientos de Excesos
     else if PPCveFuncion = 'CRVTOEXCESOS' then
     begin
       PPTodoOk  := Objeto.FunVtosExcesos(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         PPComenta := 'Problemas al vencimientos de excesos :'+ (TxResultado);
         MsgError(PPComenta);
       end;
     end
     //</EASA>
     //<LOLS 01 AGO 2006 Provision de comisiones>
     else if PPCveFuncion = 'CRPVCICOMIS' then
     begin
       Objeto.FunProvComision(vlFCierre,TxResultado, PPTodoOk);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         PPComenta := 'Provisión de comisiones :' +  TxResultado ;
         MsgError(PPComenta);
       end;
     end
     else if PPCveFuncion = 'CRBLOQAUTSDO' then
     begin
       Objeto.FunBloqAuto(vlFCierre,TxResultado, PPTodoOk);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         PPComenta := 'Bloqueo de autorizaciones :' +  TxResultado ;
         MsgError(PPComenta);
       end;
     end
     //</LOLS>

     //<EASA 27OCT2006 PROCESOS CONSOLIDADO DE ADEUDOS>
     //INSERTA REGISTRO
     else if PPCveFuncion = 'CRCONSADEUD' then
     begin
       PPTodoOk  := Objeto.FunConsAdeudo(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas al Insertar el registro en consolidado de adeudos :'+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end
     //CAPITAL VIGENTE E IMPAGDO ICRE
     else if PPCveFuncion = 'CRCAPVIGIMP' then
     begin
       PPTodoOk  := Objeto.FunCapVigImp(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas al actualizar el capital vigente e impagado:'+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end
     // CAPITAL EXIGIBLE
     else if PPCveFuncion = 'CRCAPEXIG' then
     begin
       PPTodoOk  := Objeto.FunCapExig(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas al actualizar el capital exigible:'+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end
     //CAPITAL NO EXIGIBLE
     else if PPCveFuncion = 'CRCAPNOEXIG' then
     begin
       PPTodoOk  := Objeto.FunCapNoExig(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas al actualizar el capital No exigible:'+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end
     //INTERES VIGENTE E IMPAGADO
     else if PPCveFuncion = 'CRINTVIGIMP' then
     begin
       PPTodoOk  := Objeto.FunIntVigImp(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas al actualizar el Interes Vig. e Imp.:'+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end
     //INTERES VENCIDO EXIGIBLE Y NO EXIGIBLE ICRE
     else if PPCveFuncion = 'CRINTEXGNEX' then
     begin
       PPTodoOk  := Objeto.FunIntExiNoE(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         PPComenta := 'Problemas al actualizar el Interes Exig. y No Exig.:'+ (TxResultado);
         MsgError(PPComenta);
       end;
     end
     //CUENTAS DE ORDEN ICRE
     else if PPCveFuncion = 'CRCTASORDEN' then
     begin
       PPTodoOk  := Objeto.FunCtasOrden(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         vlMsgErr := 'Todo OK';
       end else begin
         PPComenta := 'Problemas al actualizar el Interes Exig. y No Exig.:'+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end
     //CAPITAL VIGENTE E IMPAGDO INTER
     else if PPCveFuncion = 'CRVIGINTER' then
     begin
       PPTodoOk  := Objeto.FunVigImpInter(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas al actualizar sdos vigentes de intercreditos :'+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end
     //CAPITAL VENCIDOS INTER
     else if PPCveFuncion = 'CRVDOSINTER' then
     begin
       PPTodoOk  := Objeto.FunVdoNoEInter(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas al actualizar sdos vdos de intercreditos :'+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end
     //</EASA>

     //</JAGF 15DIC2010 REGENERACION DE CONSOLIDADO>
     else if PPCveFuncion = 'REGENCONSADEUDO' then
     begin
       PPTodoOk  := Objeto.FunRegenConsAdeudoSdo(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas al regenerar el consolidado de adeudos :'+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end
     //</JAGF>

      //< 27Ago2007 SATV >
      // CARGA DE COINCRE
     else if PPCveFuncion = 'CIERRECOINCRE' then
     begin
       PPTodoOk  := Objeto.FunCargaCOINCRE(vlFCierre, PPCveFuncion, Objeto.Apli.Usuario, TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas Carga COINCRE :'+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end
     //</SATV>
     // CARGA REPORTE INGRESOS  EASA4011        25.OCT.2007
     else if PPCveFuncion = 'CRINGRESOS' then
     begin
       PPTodoOk  := Objeto.FunRepIngresos(vlFCierre, TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas Carga de Ingresos :'+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end
     //END_EASA

     // CARGA CONTABLE ICRE SAP     SATV13FEB2008
     else if PPCveFuncion = 'CRICRESAP' then
     begin
       PPTodoOk  := Objeto.FunGenMovtosSAP(vlFCierre, TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas Genera Movtos en Dlls :'+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end
     //END_SATV

     // CARGA CONTABLE CONT SAP     SATV13FEB2008
     else if PPCveFuncion = 'CRCONTSAP' then
     begin
       PPTodoOk  := Objeto.FunGenContaDllsICRE(vlFCierre, TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas Traspasa a SAP movtos en DLLS :'+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end
     //END_SATV

     //<EASA 06jun2008 ACTIVA DISPOSCIONES LIQUIDADAS POR VTO EN DIA INHÁBIL>
     else if PPCveFuncion = 'CRACTIVADISPLQ' then
     begin
       PPTodoOk  := Objeto.FunActivaDispLQ(vlFCierre, TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas en la activación de Disp: '+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end

     // <Inician cambios SATV13OCT2008>
     else if PPCveFuncion = 'ACTPYMES' then
     begin
       PPTodoOk  := Objeto.FunActSdoPyMES(vlFCierre, TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas al Actualizar los Saldos de PYMES :'+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end

     else if PPCveFuncion = 'ACTSPROM' then
     begin
       PPTodoOk  := Objeto.FunActSdoPromedio(vlFCierre, TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas al Actualizar los Saldos de Promedio :'+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end

     else if PPCveFuncion = 'INSCUALI' then
     begin
       PPTodoOk  := Objeto.FunInsInfoCualitativa(vlFCierre, TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas al Actualizar la información CUALITATIVA :'+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end


     // </Terminan cambios SATV13OCT2008>


     //RIRA4281 17Nov10, obtiene garantias liquidas a fin de mes para enviarlas al R04
     else if PPCveFuncion = 'CON_GAR_LIQ' then
     begin
       PPTodoOk  := Objeto.FunCargaGarLiq(vlFCierre, TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas al obtener las garantias liquidas, pero puede continuar sin problema :'+ (TxResultado) ;
         MsgError(vlMsgErr);
       end;
     end

     // < / ROIM > abril 2013
     else if PPCveFuncion = 'CONTPPO' then
     begin
        PPTodoOk := Objeto.FunContaPPO(vlFCierre, TxResultado);
        if Not(PPTodoOk) then
        begin
          vlMsgErr := 'Problemas en la contabilidad de premios: '+ (TxResultado);
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        //end if
     end
     // < ROIM /> abril 2013

     // < / RABA > Mayo 2013
     else if PPCveFuncion = 'ALERTAPSOS' then
     begin
        PPTodoOk := Objeto.FunEnvioAlertaPSos(vlFCierre, TxResultado);
        if Not(PPTodoOk) then
        begin
          vlMsgErr := 'Problemas al enviar alerta de créditos que cumplen pago sostenido, pero puede continuar sin problema: '+ (TxResultado);
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        // < RABA > Mayo 2014
        PPTodoOk := Objeto.FunEnvioAlertHInt(vlFCierre, TxResultado);
        if Not(PPTodoOk) then
        begin
          vlMsgErr := 'Problemas al enviar alerta de créditos con diferencias en histórico de interés, pero puede continuar sin problema: '+ (TxResultado);
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
        // < RABA />
        //end if
     end
     // < RABA /> Mayo 2013

     // < RABA > AGOSTO 2016
     else if PPCveFuncion = 'CRCARTERAPLAZOS' then
     begin
        PPTodoOk := Objeto.FunCarteraPlazos(vlFCierre, TxResultado);
        if Not(PPTodoOk) then
        begin
          vlMsgErr := 'Problemas al generar la cartera por plazos de vencimiento, pero puede continuar sin problema: '+ (TxResultado);
          MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
     end
     // < RABA /> AGOSTO 2016

     //END_EASA

     //<ROUY 16jun2008 CALCULA CONTRATOS CON ACTIVIDAD - IG>
     {
     //Se excluye proceso del Cierre 17/07/2008 ROUY4095
     else if PPCveFuncion = 'CRIGCTOACTIV' then
     begin
       PPTodoOk  := Objeto.FunIgCtoActiv(vlFCierre, TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         vlMsgErr := 'Problemas en Ctos Actividad: '+ (TxResultado);
         MsgError(vlMsgErr);
       end;
     end
     }
     //END_ROUY

     ;
     InterProcesos1.MuestraConf := False;
end;

procedure TWCrCierre.bbAperturaClick(Sender: TObject);
var vlOK          : Boolean;
    vlTxResultado : String;
    nejecuta, i   : Integer;
    vlUltCierre   : TDateTime;
    vlMsg         : String;
    vlContinua    : Boolean;
    procedure BarreGridBefore;
    begin
      InterProcesos1.DescubreArbol;
      InterProcesos1.RepintaTree;
      Application.ProcessMessages;
    end;
    //
    procedure BarreGridAfter;
    begin
      Application.ProcessMessages;
      InterProcesos1.DescubreArbol;
    end;
begin
   if Objeto.ValidaAccesoEsp('TCRCIERRE_INI',True,True) then
   begin
       nEjecuta := 1;
       vlMsg := '';
       if MessageDlg('¿ Desea realizar el  C I E R R E   D E   C R E D I T O S  ?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       begin
          BarreGridBefore;
          vlMsg := 'SE REALIZARA EL PROCESO DEL DIA ';
          showMessage(vlMsg + DateToStr(InterProcesos1.FOpera));
          InterProcesos1.Interm.Lines.Add(vlMsg + DateToStr(InterProcesos1.FOpera));
          while nEjecuta > 0 do
          Begin
            vcErrCritico     := False;                    { Limpia la bandera de error critico }
            BarreGridAfter;
            ObtenPrimProc();                              { Obtiene primer proceso para envío de correo JFOF FEB-2014} 
            if InterProcesos1.ActivaProcesos then
            Begin
               vlContinua := not vcErrCritico;            {Puede continuar con el proceso      }
               if not vlContinua then                     { Si ocurrio un error en el cierre entonces ... }
               begin
                  Break;                                  { Rompe el ciclo para corregir errores }
               end;//ends_if
               vlUltCierre := ObtenFSiguienteCierre;
               if validaFecha(vlUltCierre, Objeto.Apli) <> 0 then
               Begin
                  nEjecuta:= 1;
                  InterProcesos1.FOpera := vlUltCierre;
                  BarreGridBefore;
                  SHOW_MENSAJE(vlMsg + DateToStr(InterProcesos1.FOpera)); {!!!! no quitar¡¡¡¡}
                  InterProcesos1.Interm.Lines.Add(vlMsg + DateToStr(InterProcesos1.FOpera));
                  edFECHA_CIERRE.Text := DateTimeToStr(InterProcesos1.FOpera);
               end
               else
               Begin
                  nEjecuta:= 0;
               end;
            end;
          end;//END while
       end;
    end;   
end;

//
// Se modifica para que aplique cierre por Empresa.
function TWCrCierre.ObtenFSiguienteCierre: TDateTime;
var vlSql       : String;
    vlResult    : String;
begin
  //
  vlSql := 'SELECT F_CIERRE F_ULT_CIERRE ' +
           'FROM   CR_PARAM_EMPRESA ' +
           'WHERE  ID_EMPRESA = '     + IntToStr(Objeto.Apli.IdEmpresa);
  //
  GetSQLStr( vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
             'F_ULT_CIERRE', vlResult, False);
  //
  Result := StrToDateTime(vlResult);
  // ObtenFSiguienteCierre
end;

procedure TWCrCierre.InterForma1DespuesShow(Sender: TObject);
begin
   edFECHA_CIERRE.Text := DateTimeToStr(InterProcesos1.FOpera);  
end;

procedure TWCrCierre.InterProcesos1DespuesProceso(Sender: TObject);
begin
  if InterProcesos1.TipoError =  teNoCritico then
     Objeto.EnviaError( 'Continua: '  + vcUltErr );
  //ends_if

  if InterProcesos1.TipoError =  teCritico then
  begin
    Objeto.EnviaError( 'Critico: ' + vcUltErr );
    vcErrCritico := ( InterProcesos1.TipoError = teCritico );
  end;//ends_if
end;

{
procedure TWCrCierre.Button1Click(Sender: TObject);
var vlPPResultado : String;
begin
 If CheckBox1.Checked Then
   Begin
   Objeto.FunGenMovtosSAP(Trunc(dtpFecha.Date), vlPPResultado);
   ShowMessage(vlPPResultado);
   End;

 Objeto.FunGenContaDllsICRE(Trunc(dtpFecha.Date), vlPPResultado);
 ShowMessage(vlPPResultado);
end;
}

// <Inician Cambios SATV4766 del 23OCT2008>
function TCrCierre.FunActSdoPromedio(pFecha: TDateTime; var PPResultado: String): Boolean;
var  StpGenMovtosSAP : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   Result := False;
   Try
     StpGenMovtosSAP := TStoredProc.Create(Self);
     With StpGenMovtosSAP Do
     Begin
        //Inicia el SPT
        StpGenMovtosSAP.DatabaseName:= Apli.DatabaseName;
        StpGenMovtosSAP.SessionName:= Apli.SessionName;
        StpGenMovtosSAP.StoredProcName:= 'ADMIPROD.PKGCRCONSOLIDADO1.STP_ACT_SDO_PROMEDIO';

        Params.Clear;
        Params.CreateParam( ftDate,   'peF_CIERRE',     ptInput);
        Params.CreateParam( ftInteger,'peID_CREDITO',   ptInput);
        Params.CreateParam( ftFloat,  'psRESULTADO',    ptOutput);
        Params.CreateParam( ftString, 'psTX_RESULTADO', ptOutput);

        Prepare;
        ParamByName('peF_CIERRE').AsDateTime    := pFecha;
        ParamByName('peID_CREDITO').Clear;  // Se indica como NULL el parametro
        ExecProc;

        If (ParamByName('psRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('psTX_RESULTADO').AsString;
           vlResult := False;
        End;
        //end if;
     end;
   Finally
        If Assigned(StpGenMovtosSAP) Then
           StpGenMovtosSAP.Free;
        //end if;
   End;
   Result := vlResult;
end;

function TCrCierre.FunActSdoPyMES(pFecha: TDateTime; var PPResultado: String): Boolean;
var  StpGenMovtosSAP : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   Result := False;
   Try
     StpGenMovtosSAP := TStoredProc.Create(Self);
     With StpGenMovtosSAP Do
     Begin
        //Inicia el SPT
        StpGenMovtosSAP.DatabaseName:= Apli.DatabaseName;
        StpGenMovtosSAP.SessionName:= Apli.SessionName;
        StpGenMovtosSAP.StoredProcName:= 'ADMIPROD.PKGCRCONSOLIDADO1.STP_ACT_SDO_PYMES';

        Params.Clear;
        Params.CreateParam( ftDate,   'peF_CIERRE',     ptInput);
        Params.CreateParam( ftFloat,  'psRESULTADO',    ptOutput);
        Params.CreateParam( ftString, 'psTX_RESULTADO', ptOutput);

        Prepare;
        ParamByName('peF_CIERRE').AsDateTime    := pFecha;        
        ExecProc;

        If (ParamByName('psRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('psTX_RESULTADO').AsString;
           vlResult := False;
        End;
        //end if;
     end;
   Finally
        If Assigned(StpGenMovtosSAP) Then
           StpGenMovtosSAP.Free;
        //end if;
   End;
   Result := vlResult;
 end;

function TCrCierre.FunInsInfoCualitativa(pFecha: TDateTime; var PPResultado: String): Boolean;
var  StpGenMovtosSAP : TStoredProc;
     vlResult     : Boolean;
Begin
   vlResult := True;
   Result := False;
   Try
     StpGenMovtosSAP := TStoredProc.Create(Self);
     With StpGenMovtosSAP Do
     Begin
        //Inicia el SPT
        StpGenMovtosSAP.DatabaseName:= Apli.DatabaseName;
        StpGenMovtosSAP.SessionName:= Apli.SessionName;
        StpGenMovtosSAP.StoredProcName:= 'ADMIPROD.PKGCRCONSOLIDADO1.STP_INS_INFO_CLTV';

        Params.Clear;
        Params.CreateParam( ftFloat,  'peID_CREDITO',   ptInput);
        Params.CreateParam( ftDate,   'peF_OPERACION',  ptInput);
        Params.CreateParam( ftString, 'peCVE_USU_ALTA',  ptInput);
        Params.CreateParam( ftFloat,  'psRESULTADO',    ptOutput);
        Params.CreateParam( ftString, 'psTX_RESULTADO', ptOutput);

        Prepare;
        ParamByName('peID_CREDITO').Clear; // Se indica como NULL el parametro
        ParamByName('peF_OPERACION').AsDateTime := pFecha;
        ParamByName('peCVE_USU_ALTA').asString  := Apli.Usuario;
        ExecProc;

        If (ParamByName('psRESULTADO').AsInteger <> 0) then
        Begin
           PPResultado := 'Error No ' + ParamByName('psTX_RESULTADO').AsString;
           vlResult := False;
        End;
        //end if;
     end;
   Finally
        If Assigned(StpGenMovtosSAP) Then
           StpGenMovtosSAP.Free;
        //end if;
   End;
   Result := vlResult;
end;
// </Terminan Cambios SATV4766 del 23OCT2008>

//<MOAA 26MAR2009 Carga Información de Buro de Crédito para eBureau>
procedure TCrCierre.FunCargaBCeBureau(PFechaCierre: TDate; var PPComenta: String; var PPTodoOk: Boolean);
const coSqlBCarga = 'SELECT DECODE( %s, LAST_DAY( %s ), ''V'', ''F'' ) B_CARGA_BC FROM DUAL';
var   spCBCCred  : TStoredProc;
      vlSqlCarga : String;
      vlBcarga   : String;
      Year, Month, Day: Word;
begin
  PPTodoOk  := False;
  PPComenta := 'Error';
  try
    vlBcarga   := '';
    vlSqlCarga := Format( coSqlBCarga, [ SQLFecha( PFechaCierre ), SQLFecha( PFechaCierre ) ] );
    GetSQLStr( vlSqlCarga, Apli.DataBaseName, Apli.SessionName, 'B_CARGA_BC', vlBcarga, True );
    if vlBcarga = 'V' then
    begin
        spCBCCred := TStoredProc.Create( self );
        try
          spCBCCred.DatabaseName   := Apli.DataBaseName;
          spCBCCred.SessionName    := Apli.SessionName;
          spCBCCred.StoredProcName := UpperCase('PKGBURO.STP_CARGA_EBUREAU');
          //
          spCBCCred.Params.Clear;
          spCBCCred.Params.CreateParam( ftInteger,  'P_ID_EMPRESA',   ptInput );
          spCBCCred.Params.CreateParam( ftInteger,  'P_ANIO_MES',     ptInput );
          spCBCCred.Params.CreateParam( ftString,   'P_APLICACION',   ptInput );
          spCBCCred.Params.CreateParam( ftString,   'P_BCOMMIT',      ptInput );
          spCBCCred.Params.CreateParam( ftFloat,    'P_CANTIDAD',     ptOutput );
          spCBCCred.Params.CreateParam( ftFloat,    'P_RESULTADO',    ptOutput );
          spCBCCred.Params.CreateParam( ftString,   'P_TX_RESULTADO', ptOutput );
          //
          DecodeDate(PFechaCierre,  Year, Month, Day );
          spCBCCred.ParamByName( 'P_ID_EMPRESA' ).AsInteger := Apli.IdEmpresa;
          spCBCCred.ParamByName( 'P_ANIO_MES'   ).AsInteger := StrToInt( Format('%.4d%.2d', [ Year, Month ] ) );
          spCBCCred.ParamByName( 'P_APLICACION' ).AsString  := 'ICRE';
          spCBCCred.ParamByName( 'P_BCOMMIT'    ).AsString  := 'V';
          spCBCCred.ParamByName( 'P_CANTIDAD'     ).AsFloat  := 0;
          spCBCCred.ParamByName( 'P_RESULTADO'    ).AsFloat  := 0;
          spCBCCred.ParamByName( 'P_TX_RESULTADO' ).AsString := '';
          //
          spCBCCred.ExecProc;
          //
          if spCBCCred.ParamByName('P_RESULTADO').AsFloat = 0  then
          begin
            PPTodoOk  := True;
            PPComenta := 'Todo OK';
          end else
          begin
            PPTodoOk  := False;
            PPComenta := Format( 'Código SQL: [%d]  Descripción: [%s]',
                           [ spCBCCred.ParamByName('P_RESULTADO').AsInteger,
                             spCBCCred.ParamByName('P_TX_RESULTADO').AsString ] );
          end;
        finally
          if spCBCCred <> nil then
             spCBCCred.Free;
        end;
        //
    end else begin
      PPTodoOk  := True;
      PPComenta := 'Todo OK';
    end;//ends_if_vlBcarga_=_'V'_then
    //
  except
    on e : Exception do
    begin
      PPTodoOk  := False;
      PPComenta := e.Message;
    end;
  end;
  //
end;
//<MOAA>

//SASG4921 - SE AGREGA PROCEDIMIENTO PARA EL ENVIO DE NOTIFICACION DE CIERRE NOCTURNO 08/SEP/2011
procedure TWCrCierre.EnviaNotificacion();
var
      cuerpo : string;
begin
//	cuerpo := '<font size="+1"><font color="red"><b>CORREO DE PRUEBA, HACER CASO OMISO .</b></font><br /><br />'+
	cuerpo := '<font size="+1">Buenas noches.<br /><br />'+
	'<font color="red"><b>Se ha terminado de ejecutar '+
	'correctamente el Cierre Diario Nocturno de ICRE01 correspondiente al dia '+DateToStr(InterProcesos1.FOpera)+
	'</b></font><br /><br />Cierre ejecutado por el area de Centro de Computo.<br />'+
        '<br />A continuacion se procedera con la Digitalizacion de Reportes Historicos.</br>'+
        '<br /><br />Saludos.</font>'+
	'<br /><br /><font size="-1"> Observacion: Si no es la primera ocasion que recibes este correo durante'+
	' la fecha de cierre indicada, significa que el proceso de Digitalizacion de Reportes Historicos'+
	' ocasiono un error y se ha tenido que volver a lanzar el cierre. El cierre va a comenzar a partir'+
	' de donde se ocasiono el error, es decir, comenzara a partir de la Digitalizacion de Reportes Historicos.'+
	'<br />Los procesos anteriores a la Digitalizacion que ya fueron ejecutados correctamente en el cierre de'+
        ' este dia no se volveran a ejecutar.</font>';
	NMSMTP1.Host := ObtieneHost('PAGO_TEL'); //132.1.6.62
	NMSMTP1.connect;
	NMSMTP1.SubType:=mtHtml;
	NMSMTP1.PostMessage.FromAddress := 'ccomputo@interacciones.com';
	NMSMTP1.PostMessage.FromName := 'Centro de Computo';
	NMSMTP1.PostMessage.Subject := 'Notificacion Cierre Nocturno de ICRE';
	NMSMTP1.PostMessage.ToAddress.text := 'operacionesTI@interacciones.com';
	NMSMTP1.PostMessage.ToCarbonCopy.text:='mromeroi@interacciones.com';
	NMSMTP1.PostMessage.ToBlindCarbonCopy.Add('jahernandezr@interacciones.com');
      	NMSMTP1.PostMessage.ToBlindCarbonCopy.Add('aramosb@interacciones.com');
	NMSMTP1.PostMessage.Body.Text := cuerpo;
	NMSMTP1.SendMail;
	NMSMTP1.disconnect;
end;

//SASG4921 - SE AGREGA FUNCION QUE RECUPERA EL HOST DEL SERVIDOR DE CORREO 08/SEP/2011
function TWCrCierre.ObtieneHost(peSistema: String): String;
var QryHost: Tquery;
    vlstring : String;
begin
  result := '132.1.7.179';
  QryHost:= Tquery.Create(nil);
  QryHost.DataBaseName  := Objeto.Apli.DatabaseName;  //Objeto.apli.DataBaseName;
  QryHost.SessionName  := Objeto.Apli.SessionName; //Objeto.apli.
  Try
    With QryHost  do begin
      sql.clear;
      vlstring := 'Select TX_QUERY_DATA from EMAIL_MSG where CVE_MSG = ''' + peSistema + '''';
      sql.text := vlstring ;
      open;
      If ( FieldByName('TX_QUERY_DATA').AsString <> '' ) then
        result := Copy(FieldByName('TX_QUERY_DATA').AsString,1,20)
      Else
        result := '132.1.4.130';
    end;
  Finally
    QryHost.free;
  End {try finally}
end;

// </ RABA > SEP 2011
// ESTA FUNCION SUSTITUYE A LAS FUNCIONES
// FunContColoPasiva
// FunContProvRetPasiva
// FunContCapiPasiva
// FunContVenttoCAPasivo
// FunContVenttoINPasivo
// FunContVenttoCNPasivo
function TCrCierre.FunContaPasivaED(pFecha: TDateTime; var PPResultado: String): Boolean;
var
  vlStpContaPas : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpContaPas := TStoredProc.Create(Self);
    try
      with vlStpContaPas do
      begin
        vlStpContaPas.StoredProcName := UpperCase('ADMIPROD.PKGCRREDESCTO.STPCONTAPASIVA');
        //Inicia el SPT
        vlStpContaPas.DatabaseName   := Apli.DataBaseName;
        vlStpContaPas.SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDEMPRESA',   ptInput );
        Params.CreateParam( ftDate,    'PEFPROCESO',    ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDate     := pFecha;
        ParamByName('PECVEUSUARIO').Clear;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpContaPas) then
        vlStpContaPas.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;
//
// </ RABA > SEP 2011
// ESTA FUNCION SUSTITUYE A LA FUNCION
// FunContProvPasiva
//
function TCrCierre.FunContaProvPasivaED(pFecha: TDateTime; var PPResultado: String): Boolean;
var
  vlStpContaProvPasED : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpContaProvPasED := TStoredProc.Create(nil);
    try
      with vlStpContaProvPasED do
      begin
        StoredProcName := UpperCase('ADMIPROD.PKGCRREDESCTO.STPCONTPROVFNDED');
        //Inicia el SPT
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDEMPRESA',   ptInput );
        Params.CreateParam( ftDate,    'PEFPROCESO',    ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDate     := pFecha;
        ParamByName('PECVEUSUARIO').Clear;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpContaProvPasED) then
        vlStpContaProvPasED.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;
//
// </ RABA > SEP 2011
// ESTA FUNCION SUSTITUYE A LA FUNCION
// FunContVenttoCNPVCI
//



//HERJA AGOSTO 2012
function TCrCierre.FunHistoInteres(pFecha: TDateTime; var PPResultado: String): Boolean;
var
  vlStpHistoInt : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpHistoInt := TStoredProc.Create(Self);
    try
      with vlStpHistoInt do
      begin
        vlStpHistoInt.StoredProcName := NOMPAKAGE + '.STPCARGAHISTINT';
        //Inicia el SPT
        vlStpHistoInt.DatabaseName   := Apli.DataBaseName;
        vlStpHistoInt.SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDCREDITO',   ptInput );   // RABA JUL 2014
        Params.CreateParam( ftDate,    'PEFCIERRE',     ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
        ParamByName('PEIDCREDITO').Clear;   // RABA JUL 2014
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEFCIERRE').AsDate     := pFecha;
        ParamByName('PECVEUSUARIO').AsString := Apli.Usuario;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpHistoInt) then
        vlStpHistoInt.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;


function TCrCierre.FunAjustesContables(pFecha: TDateTime; var PPResultado: String): Boolean;
var
  vlStpAjusteCont : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpAjusteCont := TStoredProc.Create(Self);
    try
      with vlStpAjusteCont do
      begin
        vlStpAjusteCont.StoredProcName := NOMPAKAGE + '.STPLLAMAAJUSTESCONT';
        //Inicia el SPT
        vlStpAjusteCont.DatabaseName   := Apli.DataBaseName;
        vlStpAjusteCont.SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDEMPRESA',   ptInput );
        Params.CreateParam( ftDate,    'PEFCIERRE',     ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFCIERRE').AsDate      := pFecha;
        ParamByName('PECVEUSUARIO').AsString := Apli.Usuario;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpAjusteCont) then
        vlStpAjusteCont.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;


function TCrCierre.FunCierreFactElect(pFecha: TDateTime; var PPResultado: String): Boolean;
var   NotFact : TWCrnotfact;
begin
  Result := False;
  PPResultado := '';
  try
   NotFact := TWCrnotfact.Create(Self);
   Try
      NotFact.EjecutaProceso(Apli, pFecha);
   finally
      NotFact.Free;
   end;

    Result      := True;
    PPResultado := '';
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;

//FIN HERJA AGOSTO 2012

// INICIO ENVIO DE ALERTAS FECHA DE VENCIMIENTO REAL JFOF FEBRERO 2013
function TCrCierre.FunEnvioAlertasVenc(pFecha: TDateTime;var PPResultado: String): Boolean;
var MailVen : TWCrmailven;
begin
  Result := False;
  PPResultado := '';
  try
   MailVen := TWCrmailven.Create(NIL);
   Try
    MailVen.EnviaCorreos(Apli, pFecha);
   finally
      MailVen := nil ;
   end;
    Result      := True;
    PPResultado := '';
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;

end;
// FIN    ENVIO DE ALERTAS FECHA DE VENCIMIENTO REAL JFOF FEBRERO 2013


// INICIO CIERRE DE PREMIO POSIBLE A OTORGAR JFOF ABRIL 2013
function TCrCierre.FunCierrePremioPO(pFecha: TDateTime;
  var PPResultado: String): Boolean;
var
  vlStpCierrePremioPO : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpCierrePremioPO := TStoredProc.Create(nil);
    try
      with vlStpCierrePremioPO do
      begin
//        StoredProcName := UpperCase('PKGCRPPO.STPACTUALIZAHISTOPPO');
        StoredProcName := UpperCase('PKGCRCIERRE.STPCIERREDIARIOPPO');  // RABA JUN 2013 SE CAMBIA EL LLAMADO PARA QUE SE REALIZE LA CONTABILIDAD
        //
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
//        Params.CreateParam( ftFloat,   'PEIDCREDITO',   ptInput );
//        Params.CreateParam( ftDate,    'PEFECHA',    ptInput );
        Params.CreateParam( ftDate,    'PEFCIERRE',    ptInput );
//        Params.CreateParam( ftString,  'PETIPOPROC',  ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
//        ParamByName('PEIDCREDITO').Clear;
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEFCIERRE').AsDate   := pFecha;
//        ParamByName('PETIPOPROC').AsString := 'DI';
        ParamByName('PECVEUSUARIO').AsString :=  Apli.Usuario;
        ParamByName('PEBCOMMIT').AsString   := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
      end;
    finally
      if Assigned(vlStpCierrePremioPO) then
        vlStpCierrePremioPO.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
end;
// FIN CIERRE DE PREMIO POSIBLE A OTORGAR JFOF ABRIL 2013



function TCrCierre.FunContProvComPymeED(pFecha: TDateTime; var PPResultado: String): Boolean;
var
  vlStpContaProvPyme : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpContaProvPyme := TStoredProc.Create(nil);
    try
      with vlStpContaProvPyme do
      begin
        StoredProcName := UpperCase('ADMIPROD.PKGCRREDESCTO.STPCONTPROVCOMIS');
        //Inicia el SPT
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,   'PEIDEMPRESA',   ptInput );
        Params.CreateParam( ftDate,    'PEFPROCESO',    ptInput );
        Params.CreateParam( ftString,  'PECVEUSUARIO',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'PSRESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'PSTXRESULTADO', ptOutput);
        //
        ParamByName('PSRESULTADO').Clear;
        ParamByName('PSTXRESULTADO').Clear;
        //
        ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
        ParamByName('PEFPROCESO').AsDate     := pFecha;
        ParamByName('PECVEUSUARIO').Clear;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('PSRESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('PSTXRESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpContaProvPyme) then
        vlStpContaProvPyme.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;

// < / ROIM > abril 2013
function TCrCierre.FunContaPPO(pFecha: TDateTime; var PPResultado: String): Boolean;
var
  vlStpContaPas : TStoredProc;
begin
  Result := False;
  PPResultado := '';
  try
    vlStpContaPas := TStoredProc.Create(Self);
    try
      with vlStpContaPas do
      begin
        vlStpContaPas.StoredProcName := UpperCase('ADMIPROD.PKGCRCONTA.STPALTAMOVTOPP');
        //Inicia el SPT
        vlStpContaPas.DatabaseName   := Apli.DataBaseName;
        vlStpContaPas.SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftDate,    'PEF_OPERACION',    ptInput );
        Params.CreateParam( ftString,  'PECVE_USU_ALTA',  ptInput );
        Params.CreateParam( ftString,  'PEBCOMMIT',     ptInput );
        Params.CreateParam( ftFloat,   'P_RESULTADO',   ptOutput);
        Params.CreateParam( ftString,  'P_TX_RESULTADO', ptOutput);
        //
        ParamByName('P_RESULTADO').Clear;
        ParamByName('P_TX_RESULTADO').Clear;
        //
        ParamByName('PEF_OPERACION').AsDate     := pFecha;
        ParamByName('PECVE_USU_ALTA').AsString := Apli.Usuario;
        ParamByName('PEBCOMMIT').AsString    := 'V';
        //
        ExecProc;
        if ParamByName('P_RESULTADO').AsInteger = 0 then
        begin
          Result      := True;
          PPResultado := '';
        end else begin
          Result := False;
          PPResultado := ParamByName('P_TX_RESULTADO').AsString;
        end;
        //
      end;// ends_with
      //
    finally
      if Assigned(vlStpContaPas) then
        vlStpContaPas.Free;
      //
    end;
  except
    on e : exception do
    begin
      Result := False;
      PPResultado := e.Message;
    end;
  end;
  //
end;

// < / RABA > Mayo 2013
function TCrCierre.FunEnvioAlertaPSos(pFecha: TDateTime;
  var PPResultado: String): Boolean;
var stpTrCartera : TStoredProc;
begin
  Result := False;
  PPResultado := 'Error desconocido';
  try
    stpTrCartera := TStoredProc.Create(nil);
    try
      with stpTrCartera do
      begin
        StoredProcName := 'PKGCRTRASCARTERA.STPAVISOMAILPSOS';
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput  );
        Params.CreateParam( ftFloat,  'PEIDCREDITO',   ptInput  );
        Params.CreateParam( ftDate,   'PEFCIERRE',     ptInput  );
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput );
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput );
        //
        ParamByName( 'PEIDEMPRESA'  ).AsInteger := Apli.IdEmpresa;
        ParamByName( 'PEIDCREDITO'  ).Clear;
        ParamByName( 'PEFCIERRE'   ).AsDate     := pFecha;
        //
        ExecProc;
        //
        // RABA MAY 2014
        If ParamByName('PSRESULTADO').AsInteger <> 0 then
        Begin
           ShowMessage('Ocurrió un error en el envío de correo de Pagos Sostenido: ' + chr(13) +
                       ParamByName('PSTXRESULTADO').AsString + chr(13) +
                       'No es un proceso crítico, favor de continuar con el cierre.');
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
        end;
//        Result := ( ParamByName('PSRESULTADO').AsInteger = 0 );
        Result := true;
        // FIN RABA
        PPResultado := ParamByName( 'PSTXRESULTADO' ).AsString;
      end;
    finally
      if stpTrCartera <> nil then
        stpTrCartera.Free;
      // ends_if
    end;
  except
    on e : exception do begin
      Result      := False;
      PPResultado := e.Message;
    end;
  end;
//
end;
// < RABA / >

procedure TWCrCierre.EnviaMailInicio(PNomProc : String);
var
      cuerpoOK, cuerpoERR, cuerpoINI : string;
begin

        ObtenDestinatarios;
      	cuerpoINI := '<font size="+1">Buenas noches:<br /><br />'+
	'Se ha comenzado el proceso: '+ vgcvefunc + ' ('+vgdescfun+'), '+
	'correspondiente al cierre del '+DateToStr(InterProcesos1.FOpera)+
	'</b><br /><br />'+
        'Saludos.</font>';

	NMSMTP1.Host := obtValorGpoCve('CIERRC', 'HOST', Objeto.Apli);
	NMSMTP1.connect;
	NMSMTP1.SubType:=mtHtml;
	NMSMTP1.PostMessage.FromAddress := obtValorGpoCve('CIERRC', 'MAIL_SEND', Objeto.Apli);
	NMSMTP1.PostMessage.FromName := obtValorGpoCve('CIERRC', 'FROM_NAME', Objeto.Apli);
	NMSMTP1.PostMessage.Subject := obtValorGpoCve('CIERRC', 'SUBJECT', Objeto.Apli);
	NMSMTP1.PostMessage.ToAddress.text := obtValorGpoCve('CIERRC', 'MAIL_TO', Objeto.Apli);
	NMSMTP1.PostMessage.ToBlindCarbonCopy.Assign(Memo2.Lines);
	NMSMTP1.PostMessage.Body.Text := cuerpoINI;
	NMSMTP1.SendMail;
	NMSMTP1.disconnect;
        //end;
end;

function TWCrCierre.ObtenDestinatarios: String;
var Qry : TQuery;
    strBuf, strSeparator : String;
    VLSQL : String;
begin
 strSeparator := ''; strBuf := '';
 Qry := TQuery.Create(Nil);
 If Assigned(Qry) Then
  With (Qry) Do
   Try
    Memo2.Lines.Clear;
    DatabaseName := Objeto.Apli.DataBaseName;
    SessionName := Objeto.Apli.SessionName;
    SQL.Clear;
    VLSQL :=  '  SELECT valor '+
              '    FROM cr_grupo_clave '+
              '   WHERE cve_grupo_clave = ''CIERRC'' '+
              '     AND cve_referencia LIKE ''BLNCOPY%''';

    SQL.Add(VLSQL);

    Open; First;
    While Not Eof Do
     Begin
     strBuf := strBuf + strSeparator + FieldByName('VALOR').AsString;
     strSeparator := C_SEPARATOR_MAIL + ' ';
     Memo2.Lines.Add(FieldByName('VALOR').AsString);
     Next;
     End;

   Finally
    Close;
    Free;
   End;
  Result := strBuf;
end;


procedure TWCrCierre.ObtenPrimProc();
var
vlsql : String;
query1 : TQuery;
begin
  vlsql :=  '  SELECT bitr.num_secuencia, bit.cve_funcion, bit.desc_proceso '+
            '    FROM (  SELECT min (num_secuencia) num_secuencia, cve_proceso_rel '+
            '              FROM bit_rel_proceso '+
            '             WHERE id_empresa = '+IntToStr(Interprocesos1.Apli.idEmpresa)+
            '               AND cve_proceso = '''+InterProcesos1.Proceso+''''+
            '               AND cve_aplicacion = '''+InterProcesos1.Apli.Apli+''''+
            '               AND situacion = ''AC'' '+
            '               AND num_secuencia > 0 '+
            '          GROUP BY cve_proceso_rel '+
            '          ORDER BY num_secuencia) bitr, '+
            '         bit_proceso bit '+
            '   WHERE bit.cve_proceso = bitr.cve_proceso_rel '+
            '     AND ROWNUM = 1 ';

        Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

        vgcvefunc := Query1.FieldByName('cve_funcion').AsString;
        vgdescfun := Query1.FieldByName('desc_proceso').AsString;
        vgnumsecu := Query1.FieldByName('num_secuencia').AsString;
end;

// < / RABA > Mayo 2013
function TCrCierre.FunEnvioAlertHInt(pFecha: TDateTime;
  var PPResultado: String): Boolean;
var stpCierre : TStoredProc;
begin
  Result := False;
  PPResultado := 'Error desconocido';
  try
    stpCierre := TStoredProc.Create(nil);
    try
      with stpCierre do
      begin
        StoredProcName := 'PKGCRCIERRE.STPAVISOMAILHINT';
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftFloat,  'PEIDEMPRESA',   ptInput  );
        Params.CreateParam( ftFloat,  'PEIDCREDITO',   ptInput  );
        Params.CreateParam( ftDate,   'PEFCIERRE',     ptInput  );
        Params.CreateParam( ftFloat,  'PSRESULTADO',   ptOutput );
        Params.CreateParam( ftString, 'PSTXRESULTADO', ptOutput );
        //
        ParamByName( 'PEIDEMPRESA'  ).AsInteger := Apli.IdEmpresa;
        ParamByName( 'PEIDCREDITO'  ).Clear;
        ParamByName( 'PEFCIERRE'   ).AsDate     := pFecha;
        //
        ExecProc;
        //
        If ParamByName('PSRESULTADO').AsInteger <> 0 then
        Begin
           ShowMessage('Ocurrió un error en el envío de correo de diferencias en el histórico de interes: ' + chr(13) +
                       ParamByName('PSTXRESULTADO').AsString + chr(13) +
                       'No es un proceso crítico, favor de continuar con el cierre.');
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
        end;
        Result := true;
        PPResultado := ParamByName( 'PSTXRESULTADO' ).AsString;
      end;
    finally
      if stpCierre <> nil then
        stpCierre.Free;
      // ends_if
    end;
  except
    on e : exception do begin
      Result      := False;
      PPResultado := e.Message;
    end;
  end;
//
end;
// < RABA / >

// < /RABA  > AGOSTO 2016 CARTERA DE CRÉDITO POR PLAZOS DE VENCIMIENTO
function TCrCierre.FunCarteraPlazos(pFecha: TDateTime;
  var PPResultado: String): Boolean;
  var stpTrCartera : TStoredProc;
begin
  Result := False;
  PPResultado := 'Error desconocido';
  try
    stpTrCartera := TStoredProc.Create(nil);
    try
      with stpTrCartera do
      begin
        StoredProcName := 'PKGCRCIERRE.STP_CART_PLAZOS_DIARIO';
        DatabaseName   := Apli.DataBaseName;
        SessionName    := Apli.SessionName;
        Params.Clear;
        //
        Params.CreateParam( ftDate,   'PEF_CIERRE',     ptInput  );
        Params.CreateParam( ftFloat,  'PEID_CREDITO',   ptInput  );
        Params.CreateParam( ftString, 'PEB_COMMIT',     ptInput );
        Params.CreateParam( ftString, 'PECVE_USUARIO',  ptInput );
        Params.CreateParam( ftFloat,  'PSRESULTADO',    ptOutput );
        Params.CreateParam( ftString, 'PSTXRESULTADO',  ptOutput );
        //
        ParamByName( 'PEF_CIERRE'   ).AsDate     := pFecha;
        ParamByName( 'PEID_CREDITO'  ).Clear;
        ParamByName( 'PEB_COMMIT' ).asString     := 'V';
        ParamByName( 'PECVE_USUARIO' ).asString  := Apli.Usuario;
        //
        ExecProc;
        //
        If ParamByName('PSRESULTADO').AsInteger <> 0 then
        Begin
           ShowMessage('Ocurrió un error en la generación de la cartera de crédito por plazos: ' + chr(13) +
                       ParamByName('PSTXRESULTADO').AsString + chr(13) +
                       'No es un proceso crítico, favor de continuar con el cierre.');
           PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
        end;
        Result := true;
        PPResultado := ParamByName( 'PSTXRESULTADO' ).AsString;
      end;
    finally
      if stpTrCartera <> nil then
        stpTrCartera.Free;
      // ends_if
    end;
  except
    on e : exception do begin
      Result      := False;
      PPResultado := e.Message;
    end;
  end;



end;

end.
