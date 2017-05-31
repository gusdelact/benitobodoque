// Sistema         : Clase de CrCieEdc (Genera Estados de Cuenta)
// Fecha de Inicio : 25/02/2014
// Función forma   : Clase de CrCieEdc
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Juan F Ortega Flores
// Comentarios     :


Unit IntCrCieEdc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntDmMain,
InterProcesos,
IntParamCre,
IntGenCre,
uEnviaMsg,
IntMensaje,
IntMsgConfirm,
IntCrFiSoPa, Psock, NMFtp, NMsmtp, QuickRpt, Qrctrls,

IntMQrEdoCta // ESTADOS DE CUENTA
;

const
  NOMPAKAGE = 'PKGCRCIERRE';

  
Type
  TCrCieEdc= class;

  TWCrCieEdc=Class(TForm)
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
    Label1: TLabel;
    NMFTP1: TNMFTP;
    Label5: TLabel;
    NMSMTP1: TNMSMTP;
    Memo2: TQRMemo;
    edFECHA_CIERRE: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure InterProcesos1GeneraProceso(Sender: TObject;
      PPCveProceso: String; PPNumSecuencia: Integer; PPCveProcesoRel,
      PPCveFuncion: String; PPDigitaliza: Boolean; var PPComenta: String;
      var PPTodoOk: Boolean);
    procedure bbAperturaClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterProcesos1DespuesProceso(Sender: TObject);
  private
    { Private declarations }
    vcUltErr       : String;
    vcErrCritico   : Boolean;

    NumFilesFTP    : Integer;


    Function ObtenFSiguienteCierre :  TDateTime;
    function ObtenDestinatarios : String;
    procedure EnviaNotificacion(PNomProc, PSItProc : String);

  public
    { Public declarations }
    Objeto : TCrCieEdc;
  end;
  //
  TCrCieEdc= class(TInterFrame)
  private
        {-------------}
        Function  FunGenEdoCta(pFecha : TDateTime; var PPResultado: String) : Boolean; // JFOF 25/02/2014 GENERA ESTADO DE CUENTA
        Procedure DigitAbcd(pFecha : TDateTime; var PPResultado: String);
        Function  FunActFCierre(pFecha : TDateTime; var PPResultado: String): Boolean; //
        {-------------}
        procedure EnviaError( Error : String  );


  protected
  public
        { Public declarations }

        ParamCre        : TParamCre;
        vgDatabaseCONT  : TDatabase;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;

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

constructor TCrCieEdc.Create( AOwner : TComponent );
begin Inherited;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrCieEdc.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCieEdc.Destroy;
begin inherited;
end;


function TCrCieEdc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCieEdc;
begin
   W:=TWCrCieEdc.Create(Self);
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


Function TCrCieEdc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCierr.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;



procedure TCrCieEdc.EnviaError(Error: String);
begin
   ProcesaEnvio( Self, 'CIEICR', Now, Error, 'V', 'EVENTO', 'V', 'F' );
end;


(***********************************************FORMA CrCieEdc********************)
(*                                                                              *)
(*  FORMA DE CrCieEdc                                                            *)
(*                                                                              *)
(***********************************************FORMA CrCieEdc********************)
procedure TWCrCieEdc.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;


   InterProcesos1.Apli := Objeto.Apli;
   InterProcesos1.Proceso := 'CR_EDOCTA';
   InterProcesos1.FOpera := ObtenFSiguienteCierre;
   if InterProcesos1.FOpera > Objeto.Apli.DameFechaEmpresa then
      InterProcesos1.FOpera := Objeto.Apli.DameFechaEmpresa;

   InterProcesos1.ArmaTree;
   bbApertura.SetFocus;

end;

procedure TWCrCieEdc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure TWCrCieEdc.InterProcesos1GeneraProceso(Sender: TObject;
  PPCveProceso: String; PPNumSecuencia: Integer; PPCveProcesoRel,
  PPCveFuncion: String; PPDigitaliza: Boolean; var PPComenta: String;
  var PPTodoOk: Boolean);
var TxResultado : String;
    vlFCierre   : TDateTime;
    vlMsgErr    : String;
    vlTextProc  : String;

    procedure  MsgError(vlError : String);
    Begin
         PPComenta := vlError;
         vcUltErr := vlError;
         EXECUTE_MUESTRAMENSAJE(vlError);
    end;

begin
     vlFCierre := InterProcesos1.FOpera;
     vcUltErr := '';
     vlTextProc := '';

     //GENERA ESTADOS DE CUENTA
     if PPCveFuncion = 'GENEDOCTA' then
     begin
       PPTodoOk  := Objeto.FunGenEdoCta(vlFCierre,TxResultado);
       if PPTodoOk then
       begin
         PPComenta := 'Todo OK';
       end else begin
         PPComenta := 'Problemas al Generar el Edo. de Cta. :'+ (TxResultado);
         MsgError(PPComenta);
       end;
     end

     //DIGITALIZA ESTADOS DE CUENTA ABCD´s
     else if PPCveFuncion = 'DIGEDOCTA' then
     begin
       Objeto.DigitAbcd(vlFCierre,TxResultado);
       if PPTodoOk then
          PPComenta := 'Todo OK'
       else
       begin
         PPComenta := 'DIGEDOCTA:'+ (PPComenta);
         MsgError(PPComenta);
       end;
     end

     //ACTUALIZA FECHA DE CIERRE EDOCTA
     else if PPCveFuncion = 'ACTFCIEDCTA' then
     begin
        PPTodoOk := Objeto.FunActFCierre(vlFCierre + 1,TxResultado);
        if Not(PPTodoOk) then
        begin
             vlMsgErr := 'Problemas al actualizar la fecha del cierre '+ (TxResultado);
             MsgError(vlMsgErr);
        end
        else
           PPComenta := 'Todo OK';
       end
     ;
     InterProcesos1.MuestraConf := False;
end;

procedure TWCrCieEdc.bbAperturaClick(Sender: TObject);
var nejecuta      : Integer;
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
if Objeto.ValidaAccesoEsp('TCRCIEEDC_INI',True,True) then
  begin
       nEjecuta := 1;
       vlMsg := '';
       if MessageDlg('¿ Está seguro que desea iniciar el proceso  ?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       begin
          vlMsg := 'SE REALIZARA EL PROCESO DEL DIA ';
          showMessage(vlMsg + DateToStr(InterProcesos1.FOpera   ));
          InterProcesos1.Interm.Lines.Add(vlMsg + DateToStr(InterProcesos1.FOpera));
          while nEjecuta > 0 do
          Begin
            vcErrCritico     := False;                    { Limpia la bandera de error critico }
            BarreGridAfter;
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

// Se modifica para que aplique cierre por Empresa.
function TWCrCieEdc.ObtenFSiguienteCierre: TDateTime;
var vlSql       : String;
    vlResult    : String;
begin

  vlSql := 'SELECT F_CIERRE_EDOCTA F_ULT_CIERRE ' +
           'FROM   CR_PARAM_EMPRESA ' +
           'WHERE  ID_EMPRESA = '     + IntToStr(Objeto.Apli.IdEmpresa);

  GetSQLStr( vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
             'F_ULT_CIERRE', vlResult, False);

  Result := StrToDateTime(vlResult);
end;

procedure TWCrCieEdc.InterForma1DespuesShow(Sender: TObject);
begin
   edFECHA_CIERRE.Text := DateTimeToStr(InterProcesos1.FOpera);
end;

procedure TWCrCieEdc.InterProcesos1DespuesProceso(Sender: TObject);
begin
  if InterProcesos1.TipoError =  teNoCritico then
     Objeto.EnviaError( 'Continua: '  + vcUltErr );

  if InterProcesos1.TipoError =  teCritico then
  begin
    Objeto.EnviaError( 'Critico: ' + vcUltErr );
    vcErrCritico := ( InterProcesos1.TipoError = teCritico );
  end;
end;


procedure TWCrCieEdc.EnviaNotificacion(PNomProc, PSItProc : String);
var
      cuerpoOK, cuerpoERR, cuerpoINI : string;
begin
  {      ObtenDestinatarios;
	cuerpoOK := '<font size="+1">Buenas noches:<br /><br />'+
	'Se ha terminado de ejecutar '+
	'correctamente el proceso: '+PNomProc+' de COINCRE, correspondiente al cierre del '+DateToStr(InterProcesos1.FOpera)+
	'</b><br /><br />Cierre ejecutado por el &aacuterea de Centro de C&oacutemputo.<br />'+
        '<br /><br />Saludos.</font>';

	NMSMTP1.Host := obtValorGpoCve('CIECOI', 'HOST', Objeto.Apli);
	NMSMTP1.connect;
	NMSMTP1.SubType:=mtHtml;
	NMSMTP1.PostMessage.FromAddress := obtValorGpoCve('CIECOI', 'MAIL_SEND', Objeto.Apli);
	NMSMTP1.PostMessage.FromName := obtValorGpoCve('CIECOI', 'FROM_NAME', Objeto.Apli);
	NMSMTP1.PostMessage.Subject := obtValorGpoCve('CIECOI', 'SUBJECT', Objeto.Apli);
	NMSMTP1.PostMessage.ToAddress.text := obtValorGpoCve('CIECOI', 'MAIL_TO', Objeto.Apli);
	NMSMTP1.PostMessage.ToBlindCarbonCopy.Assign(Memo2.Lines);
        //
        if PSItProc = 'INI' then
	NMSMTP1.PostMessage.Body.Text := cuerpoINI
        else begin
        if PSItProc = 'OK' then
	NMSMTP1.PostMessage.Body.Text := cuerpoOK
        else
      	NMSMTP1.PostMessage.Body.Text := cuerpoERR;
        end;
        //
//	NMSMTP1.SendMail;
	NMSMTP1.disconnect;    }
end;

function TCrCieEdc.FunGenEdoCta(pFecha: TDateTime;
  var PPResultado: String): Boolean;
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
     end;
   finally
        if StpGenEdoCta <> nil then
           StpGenEdoCta.Free;
   end;
   FunGenEdoCta := vlResult;
end;


Function getWindowsTempDir:String;
var r : Longint;
    c : Array[0..500] of Char;
begin
   r := GetTempPathA(500, c);
   result := '';
   If r <> 0 Then
     result := c;
end;

function TWCrCieEdc.ObtenDestinatarios: String;
var Qry : TQuery;
    strBuf, strSeparator : String;
    VLSQL : String;
begin
{ strSeparator := ''; strBuf := '';
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
              '   WHERE cve_grupo_clave = ''CIECOI'' '+
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
  Result := strBuf;  }
end;

procedure TCrCieEdc.DigitAbcd(pFecha: TDateTime; var PPResultado: String);
var PPTodoOk       : Boolean;
    PPComenta      : String;

    sArchivo   : String;
    sFileName  : String;
    Directorio : String;

    VLMsg     : String;
    vlF_INICIO: String;
    vlF_FIN   : String;
    vlmmyy    : string;
    vlsql,
    vlsql2     : string;
    Query1, Query2: TQuery;

    vlmesant, vlfinmesant, vlFcierre, vlSdiacierre, vlprimdiames :string;
begin
      if Apli.IsProd = False then
      begin
         if MessageDlg('No existe un ambiente de digitalización en DESARROLLO.' + #13#10 +
           '¡¡¡ El proceso va a actualizar información en el Servidor FTP que puede afectar los reportes de Producción ya generados !!!'
            + #13#10 + '¿Desea continuar?', mtWarning, [mbAbort, mbYes, mbNo, mbCancel], 0 ) = mrYes then
         begin
           if not ( MessageDlg('¿Estás seguro?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes ) then
             Exit;
         end else begin
           PPTodoOk  := True;
           PPComenta := 'Todo OK+';
           Exit;
         end;

      end;


     if PPTodoOk then
     begin
        vlsql := 'SELECT TO_CHAR(ADD_MONTHS(TO_DATE('''+DateToStr(pFecha)+''',''DD/MM/YYYY''),-1),''DD/MM/YYYY'') "FECHA" FROM DUAL';
        GetSqlStr(vlsql, Apli.DataBaseName, Apli.SessionName, 'FECHA', vlmesant, False);

        vlsql := 'SELECT LAST_DAY(TO_DATE('''+vlmesant+''',''DD/MM/YYYY'')) "FECHA" FROM DUAL';
        GetSqlStr(vlsql, Apli.DataBaseName, Apli.SessionName, 'FECHA', vlfinmesant, False);

        vlsql2 := 'SELECT TRUNC(TO_DATE ('''+vlfinmesant+''',''DD/MM/YYYY''), ''MON'') AS fecha  FROM DUAL';
        GetSqlStr(vlsql2, Apli.DataBaseName, Apli.SessionName, 'FECHA', vlprimdiames, False);


        vlsql:=        'SELECT CC.ID_CREDITO '+
                       '       ,CEC.F_CORTE, CEC.FOLIO_CORTE, CP.DIA_GEN_EDO_CTA ' +
                       '  FROM CR_CREDITO CC '+
                       '       ,CR_EC_CREDITO CEC, CR_PRODUCTO CP, CR_CONTRATO CRC ' +
                       ' WHERE 1=1 '+
                       '   AND CC.SIT_CREDITO in (''AC'',''LQ'') ' +
                       '   AND (CC.F_LIQUIDACION IS NULL OR CC.F_LIQUIDACION >= TO_DATE('''+vlprimdiames+''',''DD/MM/YYYY'')) ' +
                       '   AND CC.ID_CONTRATO IN ( '+
                       '                       SELECT ID_CONTRATO '+
                       '                         FROM CR_CONTRATO WHERE 1=1 '+
                       '                          AND CVE_PRODUCTO_CRE IN ( '+
                       '                                                   SELECT CVE_CLAVE '+
                       '                                                     FROM CR_CON_CAT_DATA '+
                       '                                                    WHERE CVE_CON_GPO_CAT = ''CAT_PROD_ABCD'' '+
                       '                                                   ) '+
                       '                      ) ' +
                       '   AND CC.B_GENERA_EDOCTA = ''V'' '+
                       '   AND CEC.ID_CREDITO = cc.ID_CREDITO ' +
                       '   AND CEC.F_CORTE = TO_DATE('''+vlfinmesant+''',''DD/MM/YYYY'') ' +
                       '   AND CC.ID_CONTRATO = CRC.ID_CONTRATO ' +
                       '   AND CRC.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE ' +
                       '   ORDER BY CC.ID_CREDITO'
                       ;
        Query1 := GetSQLQuery(vlsql, Apli.DataBaseName, Apli.SessionName, True );

      if Query1 <> nil then
      begin
        try
        while not Query1.EOF do
        begin
           vlFcierre:=DateToStr(pFecha);

           vlSdiacierre:=vlFcierre[1] + vlFcierre[2];

           //ENTRA A DIGITALIZAR MISMO DÍA QUE GENERA LOS ESTADOS DE CUENTA
           if (StrToInt(vlSdiacierre) = StrToInt(Query1.FieldByName('DIA_GEN_EDO_CTA').AsString) ) then
           begin
              vlmmyy := Query1.FieldByName('F_CORTE').AsString;

              sFileName := 'EDOCTA_' +vlmmyy[4]+vlmmyy[5]+'_'+vlmmyy[7]+vlmmyy[8]+vlmmyy[9]+vlmmyy[10]+'__'+Query1.FieldByName('ID_CREDITO').AsString;
              sArchivo  := getWindowsTempDir + sFileName + '.PRN';

              vlF_INICIO := '01/'+vlmmyy[4]+vlmmyy[5]+'/'+vlmmyy[7]+vlmmyy[8]+vlmmyy[9]+vlmmyy[10];
              vlF_FIN   := Query1.FieldByName('F_CORTE').AsString;

              VLMsg :=
                       RepEdoCta(
                                 Query1.FieldByName('ID_CREDITO').AsString     ,
                                 vlF_INICIO ,  //FINICIO
                                 vlF_FIN   ,  //FFIN
                                 '', '',
                                 '2' , //SITUACION 0=ACTIVOS, 1=LIQUIDADOS, 2=AMBOS
                                 Query1.FieldByName('F_CORTE').AsString    ,
                                 Query1.FieldByName('FOLIO_CORTE').AsString,
                                 '', '', '',
                                 IntToStr(Apli.IdEmpresa), ParamCre.IDENTIDAD.AsString,
                                 '1', //ORDENAMIENTO POR CP=0, O NOMBRE=1
                                 True,
                                 False,
                                 Apli,
                                 False,
                                 False,
                                 grDigitaliza,
                                 sFileName,
                                 '');   
           end;
           Query1.Next;
        end;
        Query1.Close;
        PPResultado := 'Todo OK';
       finally
         if Query1 <> nil then
            Query1.free;
       end;
        Application.ProcessMessages;
      end;
   end;
end;

function TCrCieEdc.FunActFCierre(pFecha: TDateTime;
  var PPResultado: String): Boolean;
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
          StpActFCierre.StoredProcName := NOMPAKAGE + '.STPACTFCIEECTA';
          Params.Clear;
          Params.CreateParam(ftFloat,  'PEIDEMPRESA',   ptInput);
          Params.CreateParam(ftDate,   'PEFCIERRE',     ptInput);
          Params.CreateParam(ftString, 'PEBCOMMIT',     ptInput);
          Params.CreateParam(ftFloat,  'PSRESULTADO',   ptOutput);
          Params.CreateParam(ftString, 'PSTXRESULTADO', ptOutput);
          ParamByName('PEIDEMPRESA').AsInteger := Apli.IdEmpresa;
          ParamByName('PEFCIERRE').AsDateTime  := pFecha;
          ParamByName('PEBCOMMIT').asString    := 'V';
          try
          ExecProc;
          except
            on E: EXCEPTION do
            begin
              ShowMessage(E.Message);
              raise E.Create( E.Message );

            end;
          end;

          if ParamByName('PSRESULTADO').AsInteger = 0 then
             vlResult := True
          else
              PPResultado := 'Error No ' + ParamByName('PSTXRESULTADO').AsString;
        end;
     finally
            if StpActFCierre <> nil then
               StpActFCierre.Free;
     end;
     FunActFCierre := vlResult;
end;     

end.
