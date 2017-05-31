unit uEnviaMsg;



interface

uses
  SysUtils, IntFrm, DbTables, UnSQL2, NMsmtp;

  {Windows,  Messages, }{Classes,  Graphics, Controls,}{DB,}{InterFor, }
  {StdCtrls, ExtCtrls,}{IntFind,  }{InterFun, ComCtrls, IntDtPk,  Psock,}
  



function  ProcesaEnvio(  Objeto : TInterFrame;  CveEvento : String;
                         FechaEvento: TDateTime; DescEvento, BRevisado,
                         CveRelSuc, CommRolb, BorraMsg : String  ): Integer;
function  EnviaRadio   (   Objeto : TInterFrame;  ToAddress, Mensaje : String ): Boolean;
function  GeneraEvtoErr( Objeto : TInterFrame;  CveEvento, Usuario : String;
                         FechaEvento: TDateTime; DescEvento, BRevisado,
                         CveRelSuc, CommRolb, BorraMsg : String  ): Integer;
implementation
{+========================================================================+}
{|                                                                        |}
{|                                                                        |}
{|                                                                        |}
{+========================================================================+}
function  GeneraEvtoErr( Objeto : TInterFrame; CveEvento, Usuario : String;
                         FechaEvento: TDateTime; DescEvento, BRevisado,
                         CveRelSuc, CommRolb, BorraMsg : String  ): Integer;
var stpEvtoOcu : TStoredProc;
begin
 Result := -1;
 try

    stpEvtoOcu := TStoredProc.Create( nil );
    try
      stpEvtoOcu.DatabaseName := Objeto.DataBaseName;
      stpEvtoOcu.SessionName  := Objeto.SessionName;
      stpEvtoOcu.StoredProcName := UpperCase( 'PKGSUCESOS.STPALTAEVENTOS' );
      stpEvtoOcu.Prepare;
      stpEvtoOcu.ParamByName('PE_EOCVEEV').AsString    := CveEvento;
      stpEvtoOcu.ParamByName('PE_EOCVEUS').AsString    := Usuario;
      stpEvtoOcu.ParamByName('PE_EOFHEV').AsDateTime   := FechaEvento;
      stpEvtoOcu.ParamByName('PE_EOCVEUSGE').AsString  := Objeto.DameUsuario;
      stpEvtoOcu.ParamByName('PE_EOCVEAP').AsString    := Objeto.Apli.Apli  ;
      stpEvtoOcu.ParamByName('PE_EODESEV').AsString    := Copy( DescEvento, 1, 200 );
      stpEvtoOcu.ParamByName('PE_EOCVEFU').AsString    := Objeto.Apli.LastFuncion;
      stpEvtoOcu.ParamByName('PE_EUBREV').AsString     := BRevisado;
      stpEvtoOcu.ParamByName('PE_CVERELSUC').AsString  := CveRelSuc;
      stpEvtoOcu.ParamByName('PE_COMMROLB').AsString   := CommRolb;
      stpEvtoOcu.ParamByName('PE_BORRAMESSG').AsString := BorraMsg;
      stpEvtoOcu.ParamByName('PS_VLRESI').AsInteger    := 0;
      stpEvtoOcu.ExecProc;
      Result := stpEvtoOcu.ParamByName('PS_VLRESI').AsInteger;
      stpEvtoOcu.UnPrepare;
    finally
      if assigned(stpEvtoOcu) then
         stpEvtoOcu.Free;
    end;
 except
   on e : exception do ;
 end;
end;
{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}
function  EnviaRadio( Objeto : TInterFrame;  ToAddress, Mensaje : String ): Boolean;
const
  coObtInfo = 'SELECT * FROM EMAIL_MSG WHERE CVE_MSG = ''ENV_MSG'' AND B_BLOQUEADO = ''V''';
var
   QryEnvio  : TQuery;
   NMSMTP    : TNMSMTP;
   vlContinua: Boolean;

   vlHost    : String;
   vlFromAdr : String;
   vlSubject : String;
   vlDominio : String;


begin
 Result     := False;
 try
   vlContinua := False;
   QryEnvio   := GetSQLQuery( coObtInfo, Objeto.DataBaseName, Objeto.SessionName, False );
   if assigned( QryEnvio ) then
   begin
      QryEnvio.First;
      vlHost     := QryEnvio.FieldByName('tx_query_data').AsString;
      vlFromAdr  := QryEnvio.FieldByName('tx_from_address').AsString;
      vlSubject  := QryEnvio.FieldByName('tx_subject').AsString;
      vlDominio  := QryEnvio.FieldByName('TX_QUERY_INFO').AsString;

      if pos( '@', ToAddress ) = 0 then
         ToAddress := ToAddress + vlDominio;

      vlContinua := True;
      QryEnvio.Close;
      QryEnvio.Free;
   end;//ends_if

   if vlContinua then
   begin
     NMSMTP := TNMSMTP.Create( nil );
     try
       NMSMTP.Host := vlHost;
       NMSMTP.Connect;
       if NMSMTP.Connected then
       begin
         NMSMTP.ClearParams := TRUE;
         NMSMTP.SubType     := mtPlain;
         NMSMTP.EncodeType  := uuMime;
         NMSMTP.PostMessage.FromAddress    := vlFromAdr;
         NMSMTP.PostMessage.ToAddress.Text := ToAddress;
         NMSMTP.PostMessage.Body.Text := Mensaje;
         NMSMTP.PostMessage.Subject   := vlSubject;
         NMSMTP.PostMessage.Date      := DateTimeToStr(date());
         NMSMTP.PostMessage.ReplyTo   := NMSMTP.PostMessage.FromAddress;
         NMSMTP.SendMail;
       end;
       NMSMTP.Disconnect;

       Result := True;
     finally
       if NMSMTP <> nil then
          NMSMTP.Free;
       //ends_if
     end;//ends_try..finally
   end;//ends_if
 except
  on e : exception do
     ;
 end;
end;
{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}
function  ProcesaEnvio(  Objeto : TInterFrame;  CveEvento : String;
                         FechaEvento: TDateTime; DescEvento, BRevisado,
                         CveRelSuc, CommRolb, BorraMsg : String  ): Integer;
const
   coSqlObtUsr = 'SELECT ' +
                 '  REU.CVE_USUARIO,  DE.PAGER_PIN ' +
                 'FROM   ' +
                 '  REL_EVENTO_USR REU, USUARIO U , DIREC_EMPLEADO DE ' +
                 'WHERE  ' +
                 '      REU.CVE_EVENTO      = ''%s'' ' +
                 '  AND U.CVE_USUARIO  (+)  = REU.CVE_USUARIO ' +
                 '  AND DE.ID_EMPLEADO (+)  = U.ID_PERSONA ';
var
   QryUsr    : TQuery;
   vlUsrEvto : String;
   vlPinUsr  : String;
begin
  Result := 0;
  try
     QryUsr := GetSQLQuery( Format( coSqlObtUsr, [ CveEvento ]  ),
                            Objeto.DataBaseName, Objeto.SessionName, False );
     if assigned( QryUsr ) then
     begin
        QryUsr.First;
        while not QryUsr.Eof do
        begin
          vlUsrEvto := QryUsr.FieldByName('CVE_USUARIO').AsString;
          vlPinUsr  := QryUsr.FieldByName('PAGER_PIN').AsString;
          GeneraEvtoErr( Objeto,    CveEvento, vlUsrEvto, FechaEvento, DescEvento,
                         BRevisado, CveRelSuc, CommRolb,  BorraMsg );

          if vlPinUsr <> '' then
             EnviaRadio( Objeto, vlPinUsr, DescEvento );

          QryUsr.Next;
        end;
        QryUsr.Close;
        QryUsr.Free;
     end;
  except
    on e : exception do
    begin
      Result := -1;
    end;
  end;
end;



end.
