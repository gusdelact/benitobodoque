// Sistema         : Clase de CrCierCo (Carga de Procesos COINCRE)
// Fecha de Inicio : 13/11/2013
// Función forma   : Clase de CrCierCo
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Juan F Ortega Flores
// Comentarios     :


Unit IntCrCierCo;

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
IntCrFiSoPa, Psock, NMFtp, NMsmtp, QuickRpt, Qrctrls 
;


Type
  TCrCierCo= class;

  TWCrCierCo=Class(TForm)
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
    Label5: TLabel;
    NMSMTP1: TNMSMTP;
    dtpFECHA: TInterDateTimePicker;
    Animate1: TAnimate;
    Label2: TLabel;
    Memo2: TQRMemo;
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
    procedure dtpFECHACloseUp(Sender: TObject);
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
    Objeto : TCrCierCo;
  end;
  //
  TCrCierCo= class(TInterFrame)
  private
        {-------------}
        procedure Crea_y_EjecutaProcedimiento(PFechaCierre : TDate; PNomProc : String; var PPComenta : String; var PPTodoOk : Boolean );   // JFOF
        procedure StpActualizaCtoySector(PFechaCierre : TDate; var PPComenta : String; var PPTodoOk : Boolean );   // JFOF
        procedure StpColBanderaFinCoincre(PFechaCierre : TDate; var PPComenta : String; var PPTodoOk : Boolean );   // JFOF
        procedure StpCalcIntCobAnt(PFechaCierre : TDate; var PPComenta : String; var PPTodoOk : Boolean );   // JFOF
        procedure StpSincronizaCOINCRE(PFechaCierre : TDate; var PPComenta : String; var PPTodoOk : Boolean );   // JFOF
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

constructor TCrCierCo.Create( AOwner : TComponent );
begin Inherited;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrCierCo.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCierCo.Destroy;
begin inherited;
end;


function TCrCierCo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCierCo;
begin
   W:=TWCrCierCo.Create(Self);
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


Function TCrCierCo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCierr.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;



procedure TCrCierCo.EnviaError(Error: String);
begin
   ProcesaEnvio( Self, 'CIEICR', Now, Error, 'V', 'EVENTO', 'V', 'F' );
end;


(***********************************************FORMA CrCierCo********************)
(*                                                                              *)
(*  FORMA DE CrCierCo                                                            *)
(*                                                                              *)
(***********************************************FORMA CrCierCo********************)
procedure TWCrCierCo.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;


   InterProcesos1.Apli := Objeto.Apli;
   InterProcesos1.Apli.Apli := 'COINC';
   InterProcesos1.Proceso := 'CRCIERRE_COINCRE';
   InterProcesos1.FOpera := ObtenFSiguienteCierre;
   if InterProcesos1.FOpera > Objeto.Apli.DameFechaEmpresa then
      InterProcesos1.FOpera := Objeto.Apli.DameFechaEmpresa;

   InterProcesos1.ArmaTree;
   bbApertura.SetFocus;

   Animate1.FileName := 'O:\DELPHIPR\Icre01\Flecha.avi';
end;

procedure TWCrCierCo.FormDestroy(Sender: TObject);
begin
    InterProcesos1.Apli.Apli := 'ICRE01';
end;

procedure TWCrCierCo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  InterProcesos1.Apli.Apli := 'ICRE01';
  Action := caFree;
end;


procedure TWCrCierCo.InterProcesos1GeneraProceso(Sender: TObject;
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

     if PPCveFuncion = 'CRG_CUALITATIVA' then
        vlTextProc := 'CARGA CUALITATIVA DE CREDITOS';

     if PPCveFuncion = 'CRG_CUANTITATIVA' then
        vlTextProc := 'CARGA CUANTITATIVA DE CREDITOS';

     if PPCveFuncion = 'CRGIMP_SPM_K_VIG' then
        vlTextProc := 'CARGA DE SALDO PROMEDIO VIGENTE';

     if PPCveFuncion = 'CRGIMP_SPM_K_IMP' then
        vlTextProc := 'CARGA DE SALDO PROMEDIO VIGENTE';

     if PPCveFuncion = 'CRGIMP_SPM_K_VEN' then
        vlTextProc := 'CARGA DE SALDO PROMEDIO VENCIDO';


        // INICIO COINCRE
     if (PPCveFuncion = 'CRG_CUALITATIVA') or (PPCveFuncion = 'CRG_CUANTITATIVA') or (PPCveFuncion = 'CRGIMP_SPM_K_VIG') or
        (PPCveFuncion = 'CRGIMP_SPM_K_IMP') or (PPCveFuncion = 'CRGIMP_SPM_K_VEN')
      then
     Begin
        PPTodoOk := False;
        Animate1.Active := True;
        // ENVÍO DE CORREO INICIAL PARA LA CARGA CUALITATIVA
        if (PPCveFuncion = 'CRG_CUALITATIVA') then
        begin
        EnviaNotificacion(vlTextProc,'INI');
        end;
        Objeto.Crea_y_EjecutaProcedimiento(vlFCierre, PPCveFuncion, PPComenta, PPTodoOk);
        if Not(PPTodoOk) then
        begin
           vlMsgErr := 'Problemas en el Proceso "'+vlTextProc+'": '+(TxResultado);
           MsgError(vlMsgErr);
           Animate1.Active := False;
        end
        else
        PPComenta := 'Todo OK';
        Animate1.Active := False;

        if PPComenta = 'Todo OK' then
          begin
            try
            EnviaNotificacion(vlTextProc,'OK');
            except
            on e : exception do
            begin
            end;
          end;
        end
        else
        EnviaNotificacion(vlTextProc,'ERR');
     end

     else if (PPCveFuncion = 'CRGACTCTOSECTOR') then
     Begin
        vlTextProc := '"ACTUALIZA DATOS CONTRATO Y SECTOR"';
        PPTodoOk := False;
        Animate1.Active := True;
        Objeto.StpActualizaCtoySector(vlFCierre, PPComenta, PPTodoOk);
        if Not(PPTodoOk) then
        begin
           vlMsgErr := 'Problemas en el Proceso "ACTUALIZA DATOS CONTRATO Y SECTOR": '+ (TxResultado);
           MsgError(vlMsgErr);
           Animate1.Active := False;
        end
        else
        PPComenta := 'Todo OK';
        Animate1.Active := False;

        if PPComenta = 'Todo OK' then
          begin
            try
            EnviaNotificacion(vlTextProc,'OK');
            except
            on e : exception do
            begin
            end;
          end;
        end
        else
        EnviaNotificacion(vlTextProc,'ERR');
     end

     else if (PPCveFuncion = 'CRGCOLBANDERA') then
     Begin
        vlTextProc := '"COLOCA BANDERA DE PROCESO TERMINADO"';
        PPTodoOk := False;
        Animate1.Active := True;
        Objeto.StpColBanderaFinCoincre(vlFCierre, PPComenta, PPTodoOk);
        if Not(PPTodoOk) then
        begin
           vlMsgErr := 'Problemas en el Proceso "COLOCA BANDERA DE PROCESO TERMINADO": '+ (TxResultado);
           MsgError(vlMsgErr);
        end
        else
        PPComenta := 'Todo OK';
        Animate1.Active := False;
        
        if PPComenta = 'Todo OK' then
          begin
            try
            EnviaNotificacion(vlTextProc,'OK');
            except
            on e : exception do
            begin
            end;
          end;
        end
        else
        EnviaNotificacion(vlTextProc,'ERR');
     end

     else if (PPCveFuncion = 'CRGINTCOBXANT') then
     Begin
        vlTextProc := '"CARGA DE INTERESES COBRADOS POR ANTICIPADO"';
        PPTodoOk := False;
        Animate1.Active := True;
        Objeto.StpCalcIntCobAnt(vlFCierre, PPComenta, PPTodoOk);
        if Not(PPTodoOk) then
        begin
           vlMsgErr := 'Problemas en el Proceso "CARGA DE INTERESES COBRADOS POR ANTICIPADO": '+ (TxResultado);
           MsgError(vlMsgErr);
           Animate1.Active := False;
        end
        else
        PPComenta := 'Todo OK';
        Animate1.Active := False;
                
        if PPComenta = 'Todo OK' then
          begin
            try
            EnviaNotificacion(vlTextProc,'OK');
            except
            on e : exception do
            begin
            end;
          end;
        end
        else
        EnviaNotificacion(vlTextProc,'ERR');
     end

     else if (PPCveFuncion = 'CRGSINCRONIZA') then
     Begin
        vlTextProc := '"SINCRONIZA SALDOS CONS. ADEUDO Y COINCRE"';
        PPTodoOk := False;
        Animate1.Active := True;
        Objeto.StpSincronizaCOINCRE(vlFCierre, PPComenta, PPTodoOk);
        if Not(PPTodoOk) then
        begin
           vlMsgErr := 'Problemas en el Proceso "SINCRONIZA SALDOS CONS. ADEUDO Y COINCRE": '+ (TxResultado);
           MsgError(vlMsgErr);
           Animate1.Active := False;
        end
        else
        PPComenta := 'Todo OK';
        Animate1.Active := False;
        
        if PPComenta = 'Todo OK' then
          begin
            try
            EnviaNotificacion(vlTextProc,'OK');
            except
            on e : exception do
            begin
            end;
          end;
        end
        else
        EnviaNotificacion(vlTextProc,'ERR');        
     end
     ;
     InterProcesos1.MuestraConf := False;
end;

procedure TWCrCierCo.bbAperturaClick(Sender: TObject);
var nejecuta      : Integer;
    vlUltCierre   : TDateTime;
    vlMsg,vlsql1,vlsql2, vlsql3,
    vlfvier,vlfprimdia,
    vlfproceso : String;
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
if Objeto.ValidaAccesoEsp('TCRCIERCO_INI',True,True) then
  begin
    vlsql1 := 'SELECT TRUNC(TO_DATE ('''+DateToStr(dtpFECHA.Date)+''', ''dd/mm/yyyy''), ''MON'') AS fecha  FROM DUAL';
              GetSqlStr(vlsql1, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'FECHA', vlfprimdia, False);

    vlsql2 := 'SELECT TRUNC(NEXT_DAY (TO_DATE ('''+vlfprimdia+''',''DD/MM/YYYY''), ''FRIDAY'')) fecha  FROM DUAL';
              GetSqlStr(vlsql2, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'FECHA', vlfvier, False);

    vlsql3 := 'SELECT TRUNC(TO_DATE ('''+vlfvier+''', ''dd/mm/yyyy''), ''MON'') -1 AS fecha  FROM DUAL';
              GetSqlStr(vlsql3, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'FECHA', vlfproceso, False);


  InterProcesos1.FOpera := StrToDate(vlfproceso);

  if vlfvier = DateToStr(dtpFECHA.Date) then
    begin
       nEjecuta := 1;
       vlMsg := '';
       if MessageDlg('¿ Desea realizar la  C A R G A   D E   C O I N C R E  ?',
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
                  dtpFECHA.Date := InterProcesos1.FOpera;
               end
               else
               Begin
                  nEjecuta:= 0;
               end;
            end;
          end;//END while
       end;
    end
    else
    Showmessage('¡ Proceso no aplica el día de hoy !')
  end;
end;

// Se modifica para que aplique cierre por Empresa.
function TWCrCierCo.ObtenFSiguienteCierre: TDateTime;
var vlSql       : String;
    vlResult    : String;
begin

  vlSql := 'SELECT F_CIERRE F_ULT_CIERRE ' +
           'FROM   CR_PARAM_EMPRESA ' +
           'WHERE  ID_EMPRESA = '     + IntToStr(Objeto.Apli.IdEmpresa);

  GetSQLStr( vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
             'F_ULT_CIERRE', vlResult, False);

  Result := StrToDateTime(vlResult);
end;

procedure TWCrCierCo.InterForma1DespuesShow(Sender: TObject);
begin
   dtpFECHA.Date := InterProcesos1.FOpera;
end;

procedure TWCrCierCo.InterProcesos1DespuesProceso(Sender: TObject);
begin
  if InterProcesos1.TipoError =  teNoCritico then
     Objeto.EnviaError( 'Continua: '  + vcUltErr );

  if InterProcesos1.TipoError =  teCritico then
  begin
    Objeto.EnviaError( 'Critico: ' + vcUltErr );
    vcErrCritico := ( InterProcesos1.TipoError = teCritico );
  end;
end;


procedure TWCrCierCo.EnviaNotificacion(PNomProc, PSItProc : String);
var
      cuerpoOK, cuerpoERR, cuerpoINI : string;
begin
        ObtenDestinatarios;
	cuerpoOK := '<font size="+1">Buenas noches:<br /><br />'+
	'Se ha terminado de ejecutar '+
	'correctamente el proceso: '+PNomProc+' de COINCRE, correspondiente al cierre del '+DateToStr(InterProcesos1.FOpera)+
	'</b><br /><br />Cierre ejecutado por el &aacuterea de Centro de C&oacutemputo.<br />'+
        '<br /><br />Saludos.</font>';

      	cuerpoERR := '<font size="+1">Buenas noches:<br /><br />'+
	'<font color="red"><b>Ocurri&oacute un error en la ejecuci&oacuten '+
	'del proceso: '+PNomProc+' de COINCRE, correspondiente al cierre del '+DateToStr(InterProcesos1.FOpera)+
	'</b><br /><br />';

      	cuerpoINI := '<font size="+1">Buenas noches:<br /><br />'+
	'Se ha comenzado el proceso: CARGA CUALITATIVA DE CREDITOS '+
	'de COINCRE, correspondiente al cierre del '+DateToStr(InterProcesos1.FOpera)+
	'</b><br /><br />';

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
	NMSMTP1.SendMail;
	NMSMTP1.disconnect;
end;

procedure TCrCierCo.Crea_y_EjecutaProcedimiento(PFechaCierre: TDate; PNomProc : String; 
  var PPComenta: String; var PPTodoOk: Boolean);
var vgSTP : TStoredProc;
begin
   vgSTP := TStoredProc.Create(Nil);

  If dmMain.dbMainDWHC.Connected Then
    Try
       Begin
       vgSTP.DatabaseName :=  dmMain.dbMainDWHC.DatabaseName;
       vgSTP.SessionName  :=  dmMain.dbMainDWHC.SessionName;
       vgSTP.StoredProcName := 'PKGCRNEWCOINCRE.STP_CARGA_PRINC_X_LANZ';

       With vgSTP Do
         Begin
         Params.Clear;
         Params.CreateParam( ftDate,   'peF_PROCESO',    ptInput);
         Params.CreateParam( ftString, 'peCVE_PROCESO',  ptInput);
         Params.CreateParam( ftString, 'peCVE_USUARIO',  ptInput);
         Params.CreateParam( ftString, 'peB_COMMIT',     ptInput);
         Params.CreateParam( ftFloat,  'psRESULTADO',    ptOutput);
         Params.CreateParam( ftString, 'psTX_RESULTADO', ptOutput);
         Prepare;

         ParamByName('peF_PROCESO').AsDate       :=  PFechaCierre;
         ParamByName('peCVE_PROCESO').AsString   :=  PNomProc;
         ParamByName('peCVE_USUARIO').AsString   :=  Apli.Usuario;
         ParamByName('peB_COMMIT').AsString      :=  'V';
         vgSTP.ExecProc;

           If (vgSTP.ParamByName('psRESULTADO').AsInteger > 0) Then
           begin
           PPTodoOk  := False;
           PPComenta := vgSTP.ParamByName('psTX_RESULTADO').AsString;
           end
           else begin
           PPTodoOk  := True;
           PPComenta := 'Todo OK';
           end;

         end;
         vgSTP.Free;
       End;
    Except On E:Exception Do
       PPComenta := E.Message;
    End;
end;

procedure TCrCierCo.StpActualizaCtoySector(PFechaCierre: TDate;
  var PPComenta: String; var PPTodoOk: Boolean);
var  vlwAnio, vlwMes, vlwDia : Word;
     vgSTP : TStoredProc;
Begin
   vgSTP := TStoredProc.Create(Nil);

   If dmMain.dbMainDWHC.Connected Then
   Try
     DecodeDate(PFechaCierre, vlwAnio, vlwMes, vlwDia);
     With vgSTP Do
     Begin
        vgStp.DatabaseName  := dmMain.dbMainDWHC.DatabaseName;
        vgStp.SessionName   := dmMain.dbMainDWHC.SessionName;
        vgStp.StoredProcName:= 'PKGCRNEWCOINCRE.STP_ACTUALIZA_CTO_Y_SECTOR';

        Params.Clear;
        Params.CreateParam( ftInteger, 'peANIO'         , ptInput);
        Params.CreateParam( ftInteger, 'peNUM_MES'      , ptInput);
        Params.CreateParam( ftInteger, 'peID_CREDITO'   , ptInput);
        Params.CreateParam( ftString,  'peB_COMMIT'     , ptInput);
        Params.CreateParam( ftInteger, 'psRESULTADO'    , ptOutput);
        Params.CreateParam( ftString,  'psTX_RESULTADO' , ptOutput);
        Prepare;

        ParamByName('peANIO').AsInteger    := vlwAnio;
        ParamByName('peNUM_MES').AsInteger := vlwMes;
        ParamByName('peID_CREDITO').Clear; // Se indica como NULL el parametro
        ParamByName('peB_COMMIT').AsString  := 'V';
        ExecProc;

          If (vgSTP.ParamByName('psRESULTADO').AsInteger > 0) Then
          begin
          PPTodoOk  := False;
          PPComenta := vgSTP.ParamByName('psTX_RESULTADO').AsString
          end
          Else
          begin
          PPTodoOk  := True;
          PPComenta := 'Todo OK';
          end;
     End;
   Finally
        If Assigned(vgSTP) Then
           vgStp.Free;
   End;
end;

procedure TCrCierCo.StpColBanderaFinCoincre(PFechaCierre: TDate;
  var PPComenta: String; var PPTodoOk: Boolean);
var   vgSTP : TStoredProc;
Begin
   vgSTP := TStoredProc.Create(Nil);
   If dmMain.dbMainDWHC.Connected Then
   Try
     With vgSTP Do
     Begin
        //Inicia el SPT
        vgStp.DatabaseName  := dmMain.dbMainDWHC.DatabaseName;
        vgStp.SessionName   := dmMain.dbMainDWHC.SessionName;
        vgStp.StoredProcName:= 'PKGCRNEWCOINCRE.STP_COL_BANDERA_FIN_COINCRE';

        Params.Clear;
        Params.CreateParam( ftInteger,  'peID_EMPRESA',   ptInput);
        Params.CreateParam( ftDateTime, 'peF_PROCESO',    ptInput);
        Params.CreateParam( ftString,   'peB_COMMIT',     ptInput);
        Params.CreateParam( ftInteger,  'psRESULTADO',    ptOutput);
        Params.CreateParam( ftString,   'psTX_RESULTADO', ptOutput);
        Prepare;

        ParamByName('peID_EMPRESA').AsInteger := 2;
        ParamByName('peF_PROCESO').AsDateTime := PFechaCierre;
        ParamByName('peB_COMMIT').AsString    := 'V';
        ExecProc;

        If (vgSTP.ParamByName('psRESULTADO').AsInteger > 0) Then
        begin
        PPTodoOk  := False;
        PPComenta := vgSTP.ParamByName('psTX_RESULTADO').AsString
        end
        Else
        begin
        PPTodoOk  := True;
        PPComenta := 'Todo OK';
        end;

     End;
   Finally
        If Assigned(vgSTP) Then
           vgStp.Free;
   End;
end;

procedure TCrCierCo.StpCalcIntCobAnt(PFechaCierre: TDate;
  var PPComenta: String; var PPTodoOk: Boolean);
var   vgSTP : TStoredProc;
Begin
   vgSTP := TStoredProc.Create(Nil);
   Try
     With vgSTP Do
     Begin
        //Inicia el SPT
        vgStp.DatabaseName  := apli.DataBaseName;
        vgStp.SessionName   := apli.SessionName;
        vgStp.StoredProcName:= 'ADMIPROD.PKGCRCOINCRE2.STP_CALC_INT_COB_ANT';

        Params.Clear;
        Params.CreateParam( ftDateTime, 'peF_CIERRE',     ptInput);
        Params.CreateParam( ftInteger,  'peID_CREDITO',   ptInput);
        Params.CreateParam( ftInteger,  'psRESULTADO',    ptOutput);
        Params.CreateParam( ftString,   'psTX_RESULTADO', ptOutput);
        Prepare;

        ParamByName('peF_CIERRE').AsDateTime := PFechaCierre;
        ParamByName('peID_CREDITO').Clear;
        ExecProc;

        If (vgSTP.ParamByName('psRESULTADO').AsInteger > 0) Then
        begin
        PPTodoOk  := False;
        PPComenta := vgSTP.ParamByName('psTX_RESULTADO').AsString
        end
        Else
        begin
        PPTodoOk  := True;
        PPComenta := 'Todo OK';
        end;
     End;
      If Assigned(vgSTP) Then
         vgStp.Free;

   Except
         On E : Exception Do
           Begin
           If Assigned(vgSTP) Then
              vgStp.Free;
           ShowMessage(e.Message);
          End;
   End;
end;

procedure TCrCierCo.StpSincronizaCOINCRE(PFechaCierre: TDate;
  var PPComenta: String; var PPTodoOk: Boolean);
var   vgSTP : TStoredProc;
Begin
   vgSTP := TStoredProc.Create(Nil);
   Try
     With vgSTP Do
     Begin
        //Inicia el SPT
        vgStp.DatabaseName  := apli.DataBaseName;
        vgStp.SessionName   := apli.SessionName;
        vgStp.StoredProcName:= 'ADMIPROD.PKGCRCOINCRE2.STP_SINCRONIZA_COINCRE';

        Params.Clear;
        Params.CreateParam( ftDateTime, 'peF_CIERRE',     ptInput);
        Params.CreateParam( ftInteger,  'peID_CREDITO',   ptInput);
        Params.CreateParam( ftInteger,  'psRESULTADO',    ptOutput);
        Params.CreateParam( ftString,   'psTX_RESULTADO', ptOutput);
        Prepare;

        ParamByName('peF_CIERRE').AsDateTime := PFechaCierre;
        ParamByName('peID_CREDITO').Clear;
        ExecProc;

        If (vgSTP.ParamByName('psRESULTADO').AsInteger > 0) Then
        begin
        PPTodoOk  := False;
        PPComenta := vgSTP.ParamByName('psTX_RESULTADO').AsString
        end
        Else
        begin
        PPTodoOk  := True;
        PPComenta := 'Todo OK';
        end;

     End;
      If Assigned(vgSTP) Then
         vgStp.Free;
   Except
         On E : Exception Do
           Begin
           If Assigned(vgSTP) Then
              vgStp.Free;
           ShowMessage(e.Message);
          End;
   End;
end;

function TWCrCierCo.ObtenDestinatarios: String;
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
  Result := strBuf;
end;

procedure TWCrCierCo.dtpFECHACloseUp(Sender: TObject);
begin
   InterProcesos1.Apli := Objeto.Apli;
   InterProcesos1.Apli.Apli := 'COINC';
   InterProcesos1.Proceso := 'CRCIERRE_COINCRE';
   InterProcesos1.FOpera := dtpFECHA.Date;
   InterProcesos1.ArmaTree;
   InterProcesos1.RepintaTree;
end;

end.
