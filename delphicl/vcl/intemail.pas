unit IntEMail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Psock, NMsmtp, StdCtrls, ExtCtrls,DbTables,UnSQL2;
  
type
  TFrmEmail = class(TForm)
    NMSMTP1: TNMSMTP;
    Button1: TButton;
    Edit2: TEdit;
    Memo1: TMemo;
    Memo2: TMemo;
    Edit1: TEdit;
    Edit3: TEdit;
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    Label1: TLabel;
    Edit4: TEdit;
    Panel2: TPanel;
    Label2: TLabel;
    Panel3: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    Image1: TImage;
    Edit5: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
  public
     // CZR 09-Nov-2010
     vHost : String;
     vPort : Integer;
     vCCO  : String;
  end;

var
  FrmEmail : TFrmEmail;
  vlCerrar : Boolean = False;
  vlEnviado: Boolean = False;

Function ISendEMailEx(ToAddress,FromAddress,FromName,Subject,Body,HostName:PChar; Tipo:Integer):Boolean; stdcall;

implementation

Function ISendEMailEx(ToAddress,FromAddress,FromName,Subject,Body,HostName:PChar; Tipo:Integer):Boolean;

Function SinFin13(S:String):String;
var
   T:Integer;
begin
  T := Length(S);
  if T>=2 then begin
     if(S[T]=#10) and (S[T-1]=#13) then
        Result := Copy(S,1,T-2)
     else
        Result := S;
  end//if
  else
     Result := S;
end;//function

var
   Forma1:TFrmEmail;

begin
  Result := False;
  Application.CreateForm(TFrmEmail,Forma1);
  Try
    With Forma1 do begin
      Memo2.Text := Trim(StrPas(Body));
      if Trim(StrPas(HostName))='' then HostName := '132.1.4.130';
      NMSMTP1.Host := Trim(StrPas(HostName));
      NMSMTP1.Connect;
      NMSMTP1.PostMessage.ToAddress.Clear;
      NMSMTP1.PostMessage.ToAddress.Text := Trim(SinFin13(StrPas(ToAddress)));
      NMSMTP1.PostMessage.FromAddress := Trim(StrPas(FromADdress));
      NMSMTP1.PostMessage.FromName := Trim(StrPas(FromName));
      NMSMTP1.PostMessage.Subject := Trim(StrPas(Subject));
      NMSMTP1.PostMessage.Date  :=  FormatDateTime('dd/mm/yyyy hh:nn am/pm',Now);
      NMSMTP1.PostMessage.Body.Text :=  Trim(SinFin13(StrPas(Body)));
      RadioGroup1.ItemIndex := Tipo;
      Case RadioGroup1.ItemIndex of
        0:NMSMTP1.SubType := mtPlain;
      end;//case
      NMSMTP1.SendMail;
      NMSMTP1.Disconnect;
    end;//with
  Finally
    Forma1.Free;
  end;//Try & Finally
  Result := True;
end;//begin

{$R *.DFM}

procedure TFrmEmail.Button1Click(Sender: TObject);
begin
   try // CZR 19-OCT-2010   Try - Except
      ShortDateFormat := 'dd/mm/yyyy hh:nn am/pm';
      with NMSMTP1 do
      begin
         //Host := '132.1.4.130';
         //if Trim(Host) = '' then Host := '132.1.6.62';
         PostMessage.ToAddress.text         := '';
         PostMessage.ToCarbonCopy.Text      := '';
         PostMessage.ToBlindCarbonCopy.Text := '';

         Host := trim(vHost);   // CZR 19-OCT-2010   Host
         Port := vPort;         // CZR 19-OCT-2010   Puerto

         Connect;
         PostMessage.ToAddress.Assign(Memo1.Lines);

         PostMessage.ToBlindCarbonCopy.Text := trim(vCCO);   // CZR 19-OCT-2010   Copia Oculta

         PostMessage.FromAddress := Edit2.Text;
         PostMessage.FromName    := Edit3.Text;
         PostMessage.Subject     := Edit1.Text;
         PostMessage.Date        :=  FormatDateTime('dd/mm/yyyy hh:nn am/pm',Now);
         PostMessage.Body.Assign(Memo2.Lines);
         Case RadioGroup1.ItemIndex of
            0:   SubType := mtPlain;
            1:   SubType := mtHTML;
         end;
         SendMail;
         vlEnviado := True;
         Disconnect;
      end;
      if vlCerrar then
         Close
      else
         ShowMessage('E-Mail envíado exitosamente... Gracias');
   except
      on e: Exception do
         MessageDlg(e.Message, mtInformation, [mbOK], 0);
   end
end;//procedure

procedure TFrmEmail.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if ord(key) = VK_RETURN then
    SelectNext(ActiveControl as TWinControl,True,True);
end;//procedure
end.
