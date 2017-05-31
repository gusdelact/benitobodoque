unit UnMail;

interface

uses Windows, Classes, ComCtrls, SysUtils, Controls, Forms, StdCtrls, ExtCtrls,
  Dialogs, IntHTML, Psock, NMsmtp, Ungene, UnSql2;

Type

  TMail = Class(TComponent)
  private
    fFromAddress      : String;
    fFromName         : String;
    fToAddress        : TStringList;
    fSubject          : String;
    fBody             : String;
    fNMsmtp           : TNMsmtp;
    fToCarbonCopy     : TStringList;  //Luis Hernandez Oct 2011
    fToBlindCarbonCopy: TStringList;  //Luis Hernandez Oct 2011
    fAttachments      : TStringList;  //Luis Hernandez Oct 2011

    procedure ConectarServidorCorreo(pNMSMTP: TNMSMTP; pHost: String; pIntentos: Integer);
    procedure DesconectarServidorCorreo(pNMsmtp: TNMsmtp);
    function CaracterToHtml(PECaracter: char): String;
    function CadenaToHtml(PECadena: String): String;
  public
    property FromAddress: String Read fFromAddress write fFromAddress;
    property FromName: String Read fFromName write fFromName;
    property ToAddress: TStringList Read fToAddress write fToAddress;
    property Subject: String Read fSubject write fSubject;
    property Body: String Read fBody write fBody;
    property NMsmtp: TNMsmtp Read fNMsmtp Write fNMsmtp;
    property ToCarbonCopy : TStringList Read fToCarbonCopy write fToCarbonCopy; //Luis Hernandez Oct 2011
    property ToBlindCarbonCopy : TStringList Read fToBlindCarbonCopy write fToBlindCarbonCopy;  //Luis Hernandez Oct 2011
    property Attachments : TStringList Read fAttachments write fAttachments;  //Luis Hernandez Oct 2011

    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    Procedure Send(pHost: String = '132.1.7.179'; pIntentos: Integer = 5; pSilent: Boolean = True);
  end;

  Function SendMail(pFrom, pFromName:String;
                    const pTo: array of String;
                    pSubject, pBody: String;
                    pHost: String = '132.1.7.179';
                    pIntentos: Integer = 5;
                    pSilent: Boolean = True): Boolean; overload;

  Function SendMailExt(pFrom, pFromName:String;
                    const pTo: array of String;
                    pSubject, pBody: String;
                    pHost: String = '132.1.7.179';
                    pIntentos: Integer = 5;
                    pSilent: Boolean = True): Boolean;

  Function SendMail(pFrom, pFromName:String;
                    const pTo: TStringList;
                    pSubject, pBody: String;
                    pHost: String = '132.1.7.179';
                    pIntentos: Integer = 5;
                    pSilent: Boolean = True): Boolean; overload;

  Function SendMail(pFrom, pFromName:String;
                    const pTo: TStringList;
                    pSubject, pBody: String;
                    pAttach, pToCC, pToBCC :TStringList;
                    pHost: String = '132.1.7.179';
                    pIntentos: Integer = 5;
                    pSilent: Boolean = True): Boolean; overload;

  Function getHostName(pDataBaseName: String; pSessionName: String): String;                    

implementation

Function getHostName(pDataBaseName: String; pSessionName: String): String;
Var vlHostName: String;
Begin
  //GetSQLStr(SQL:String; DataBaseName:String; SessionName:string;  Campo:String; Var Valor:String; ShowError:Boolean):Boolean;
  Try
    GetSQLStr('Select Valor From Parametros Where Id_Parametro = 117', pDataBaseName, pSessionName, 'VALOR', vlHostName, True);
      //ShowMessage('servidor de correos [' + vlHostName + ']');
  Except
    on e: Exception do
      MessageDlg('Error en la obtención del servidor de correos. ' + e.Message, mtError, [mbOK], 0);
  End;
  getHostName:= vlHostName;
end;


Function SendMail(pFrom, pFromName:String;
                  const pTo: array of String;
                  pSubject, pBody: String;
                  pHost: String = '132.1.7.179';
                  pIntentos: Integer = 5;
                  pSilent: Boolean = True): Boolean;
Var indexAddress: Integer;
    ListTo: TStringList;
Begin
  If Length(pTo) >= 0 Then
    Try
      ListTo:= TStringList.Create;
      for indexAddress:= 0 to Length(pTo) - 1 do
        ListTo.Add(pTo[indexAddress]);
      SendMail(pFrom, pFromName, ListTo, pSubject, pBody, pHost, pIntentos, pSilent);
    Finally
    If ListTo <> nil then ListTo.Free; ListTo:= nil;    end
  else Raise Exception.Create('Error al identifica la lista de los detinatarios del mensaje.');

end;

Function SendMailExt(pFrom, pFromName:String;
                  const pTo: array of String;
                  pSubject, pBody: String;
                  pHost: String = '132.1.7.179';
                  pIntentos: Integer = 5;
                  pSilent: Boolean = True): Boolean;
Var indexAddress: Integer;
    ListTo: TStringList;
Begin
  If Length(pTo) >= 0 Then
    Try
      ListTo:= TStringList.Create;
      for indexAddress:= 0 to Length(pTo) - 1 do
        ListTo.Add(pTo[indexAddress]);
      SendMail(pFrom, pFromName, ListTo, pSubject, pBody, pHost, pIntentos, pSilent);
    Finally
       ListTo:= nil;
    end
  else Raise Exception.Create('Error al identifica la lista de los detinatarios del mensaje.');
end;



Function SendMail(pFrom, pFromName:String;
                  const pTo: TStringList;
                  pSubject, pBody: String;
                  pHost: String = '132.1.7.179';
                  pIntentos: Integer = 5;
                  pSilent: Boolean = True): Boolean;
Var objMail: TMail;
Begin
  SendMail:= False;
  objMail:= TMail.Create(Nil);
  Try
    With objMail do
    Begin
      FromAddress:= pFrom;
      FromName:= pFromName;
      ToAddress:= pTo;
      Subject:= pSubject;
      Body:= pBody;
      Send(pHost, pIntentos, pSilent);
    end;
    SendMail:= True;
  Finally
    If objMail <> nil then objMail.Free; objMail:= nil;
  end;
end;


Function SendMail(pFrom, pFromName:String;
                  const pTo: TStringList;
                  pSubject, pBody: String;
                  pAttach, pToCC, pToBCC :TStringList;
                  pHost: String = '132.1.7.179';
                  pIntentos: Integer = 5;
                  pSilent: Boolean = True): Boolean;
Var objMail: TMail;
Begin
  SendMail:= False;
  objMail:= TMail.Create(Nil);
  Try
    With objMail do
    Begin
      FromAddress:= pFrom;
      FromName:= pFromName;
      ToAddress:= pTo;
      ToCarbonCopy := pToCC;
      ToBlindCarbonCopy := pToBCC;
      Attachments := pAttach;
      Subject:= pSubject;
      Body:= pBody;
      Send(pHost, pIntentos, pSilent);
    end;
    SendMail:= True;
  Finally
    If objMail <> nil then objMail.Free; objMail:= nil;
  end;
end;


Constructor TMail.Create(AOwner: TComponent);
Begin
  inherited;
  fToAddress:= TStringList.Create;
  fAttachments := TStringList.Create;
  fToCarbonCopy := TStringList.Create;
  fToBlindCarbonCopy := TStringList.Create;
end;

Destructor TMail.Destroy;
Begin
  if fToAddress <> nil then fToAddress.Free; fToAddress:= nil;
  If NMsmtp <> nil Then NMsmtp.Free; NMsmtp:= nil;
  inherited;
end;


procedure TMail.ConectarServidorCorreo(pNMSMTP: TNMSMTP; pHost: String; pIntentos: Integer);
var
   l_intentos: integer;
begin
  //Timer.Enabled := FALSE;
  l_intentos := 0;
  pNMSMTP.Host := pHOST;
  //AgregaLinea('Intentadose conectar al servidor de correo '+NMSMTP .Host);

  if pNMSMTP.Connected then pNMSMTP.Disconnect;
  while(not pNMSMTP.Connected)and(l_intentos < pIntentos)do begin
    inc(l_intentos);
    Try
       if not pNMSMTP.Connected then begin
          //AgregaLinea('Conectandose al servidor '+NMSMTP.Host+' por '+IntToStr(l_intentos));
          pNMSMTP.Connect;
          //AgregaLinea('Conectado al servidor de correo '+ pHost);
       end//if
       else begin
          //AgregaLinea('Ya está conectado al servidor de correo '+ pHost);
          Break;
       end;//else
    Except
       //AgregaLinea('ERROR: Al conectarse con el servidor de correo '+ pHost);
       Sleep(5000);
    end;//Try & Except
    Application.ProcessMessages;
  end;//while

  if l_intentos >= pIntentos then
  begin
    Raise Exception.Create('Error al conectar el servidor de correo. Se ha excedido el número máximo de intentos');
{
     AgregaLinea('Se ha excedido el número máximo de intentos, vuelva a reinicar la aplicación más tarde');
     Memo.Lines.SaveToFile('C:\LogMail.txt');
     Application.Terminate;
}
  end;
  //Timer.Enabled := TRUE;

end;//procedure


procedure TMail.DesconectarServidorCorreo(pNMSMTP: TNMSMTP);
begin
  Try
    if pNMSMTP.Connected then begin
       //AgregaLinea('Desconectándose del servidor de correo');
       pNMSMTP.Disconnect;
       //AgregaLinea('Desconectado del servidor de correo');
    end;//if
  Except
    On E: Exception do
    Begin
      Raise Exception.Create('Error al desconectar el servidor de correo. ' + e.Message);
    end;
  {
    AgregaLinea('ERROR: No se puede desconectar del servidor de correo');
    Memo.Lines.SaveToFile('C:\LogMail.txt');
    Application.Terminate;
  }
  end;//Try & Except
end;//procedure



function TMail.CaracterToHtml(PECaracter: char): String;
begin
  if(PECaracter in ['á','é','í','ó','ú','ñ','Á','É','Í','Ó','Ú','Ñ'])then begin
     case Ord(PECaracter) of
       Ord('á') : Result := '&aacute;';
       Ord('é') : Result := '&eacute;';
       Ord('í') : Result := '&iacute;';
       Ord('ó') : Result := '&oacute;';
       Ord('ú') : Result := '&uacute;';
       Ord('ñ') : Result := '&nacute;';
       Ord('Á') : Result := '&Aacute;';
       Ord('É') : Result := '&Eacute;';
       Ord('Í') : Result := '&Iacute;';
       Ord('Ó') : Result := '&Oacute;';
       Ord('Ú') : Result := '&Uacute;';
       Ord('Ñ') : Result := '&Nacute;';
       else
          Result := PECaracter;
     end;//case
  end//if
  else
     Result := PECaracter;
end;//function


function TMail.CadenaToHtml(PECadena: String): String;
var
   l_cont : integer;
   l_Cadena: String;
begin
  l_Cadena:= '';
  for l_cont := 1 to Length(PECadena) do begin
      l_Cadena := l_Cadena + CaracterToHtml(PECadena[l_cont]);
  end;//for
  Result := l_Cadena;
end;//function



Procedure TMail.Send(pHost: String = '132.1.7.179'; pIntentos: Integer = 5; pSilent: Boolean = True);
Var indexCopia: Integer;
begin
  //Result := FALSE;
  If NMsmtp = nil Then NMsmtp:= TNMSMTP.Create(Nil);

  With NMSMTP do begin
    SubType := mtHtml;
    PostMessage.Body.Clear;
    PostMessage.Attachments.Clear;
    PostMessage.FromAddress := LowerCase(FromAddress);
    PostMessage.FromName := CadenaToHtml(FromName);
    PostMessage.ToAddress:= ToAddress;
    //PostMessage.ToAddress.Add(LowerCase(pTo));
    {PostMessage.ToAddress.Add('framirez@gfinter.com');}
    //PostMessage. ToAddress. .AddStrings(ToAddress);
    PostMessage.Attachments.Clear;
    PostMessage.ToCarbonCopy.Clear;
    PostMessage.ToBlindCarbonCopy.Clear;
    PostMessage.Attachments.Text := Attachments.Text;     //Luis Hernandez Oct 2011
    PostMessage.ToCarbonCopy.Text := ToCarbonCopy.Text;   //Luis Hernandez Oct 2011
    PostMessage.ToBlindCarbonCopy.Text := ToBlindCarbonCopy.Text;  //Luis Hernandez Oct 2011
    //PostMessage.Subject := CadenaToHtml(Subject);
    PostMessage.Subject := Subject;
    PostMessage.Body.Add(Body);
  end;//with

  Try
    while not NMSMTP.Connected do
      ConectarServidorCorreo(NMSMTP, pHost, pIntentos);
    //AgregaLinea('Enviando correo ...');
    NMsmtp.SendMail;
    DesconectarServidorCorreo(NMsmtp);
    //Result := TRUE;
  Except
    Raise;
{
    on E: Exception do
    begin
      GeneraMensajeError(E.Message);
       //AgregaLinea('ERROR: '+E.Message+' #'+IntToStr(E.HelpContext));
       //Memo.Lines.SaveToFile('C:\LogMail.txt');
       //Application.Terminate;
    end;//
}
  end;//Try & Except}

  Application.ProcessMessages;
end;//procedure






end.
