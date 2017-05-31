unit IntMailSend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Psock, NMsmtp, StdCtrls; //, IntHTML;

type
  TWMailAttach = class(TForm)
    NMSMTP1: TNMSMTP;
    edFromName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edFromAddress: TEdit;
    Label3: TLabel;
    edToAddress: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Label5: TLabel;
    edSubject: TEdit;
    LbHora: TLabel;
    Memo2: TMemo;
    Label4: TLabel;
    Label6: TLabel;
    Memo3: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure NMSMTP1SendStart(Sender: TObject);
    procedure NMSMTP1EncodeEnd(Filename: String);
    procedure NMSMTP1Success(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    OKSuccess:Boolean;
  end;

var
  WMailAttach: TWMailAttach;

Function SendEMailAttach(ServerName:string;
                        FromName:String;
                        FromAddr:String;
                        ToAddr:String;
                        Subject:String;
                        TxtMsg:String;
                        Attach:String;
                        SendDateTime:TDateTime;
                        Etiqueta:TLabel):Boolean;

Function  ISendEMailEx(ToAddress,FromAddress,FromName,Subject,Body,HostName:PChar; Tipo:Integer):Boolean; stdcall;

implementation

{$R *.DFM}

Function IEMailDate(FechaHora:TDateTime):String;
Const kMes:Array[1..12] of String=('Jan','Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov','Dec');
      kDia:Array[1..7] of String=('Sun','Mon','Tue','Wed','Thu','Fri','Sat');
var  Ano,Mes,dia:Word;
     Hora,Min,Seg,MSeg:Word;
     DiaSemana:Integer;
     lpTimeZoneInformation: TTimeZoneInformation;
     Tiempo:Integer;
     W:DWord;
begin DecodeDate(FechaHora,Ano,Mes,Dia);
      DecodeTime(FechaHora,Hora,Min,Seg,MSeg);
      DiaSemana:=DayOfWeek(FechaHora);
      W:=GetTimeZoneInformation(lpTimeZoneInformation);
      Tiempo:=lpTimeZoneInformation.Bias;
      Tiempo:=(Trunc(Tiempo/60)*-1);
      Result:=kDia[DiaSemana]+', '+FormatFloat('00',Dia)+' '+KMes[Mes]+' '+IntToStr(Ano)+' '+IntToStr(Hora)+':'+IntToStr(Min)+':'+IntToStr(Seg)+' '+FormatFloat('00',Tiempo)+'00';
end;



Function  ISendEMailEx(ToAddress,FromAddress,FromName,Subject,Body,HostName:PChar; Tipo:Integer):Boolean; stdcall;
var S:String;
    T:String;
    i:Integer;
    Linea,Boundary:String;
    WMailAttach:TWMailAttach;
    SendDateTime:TDateTime;
    ServerName:String;
    sSubject,FromAddr,sFromName,ToAddr:String;
    TxtMsg:String;
begin rESULT:=False;
      ServerName:=HostName;
      FromAddr:=FromAddress;
      sFromName:=FromName;
      sSubject:=Subject;
      ToAddr:=ToAddress;
      TxtMsg:=Body;
      WMailAttach:=TWMailAttach.Create(nil);
       Try WMailAttach.OKSuccess:=False;
           SendDateTime:=Now;
           if ServerName='' then ServerName:='inter7.gfinter.com';
           WMailAttach.NMSMTP1.Host:=ServerName;
           WMailAttach.NMSMTP1.PostMessage.Date:=IeMailDate(SendDateTime);
           WMailAttach.NMSMTP1.PostMessage.FromAddress := FromAddr;
           WMailAttach.NMSMTP1.PostMessage.FromName := sFromName;
           WMailAttach.NMSMTP1.PostMessage.ToAddress.Text:=ToAddr;
           WMailAttach.NMSMTP1.Connect;
           WMailAttach.NMSMTP1.PostMessage.Body.Text:=TxtMsg;
           WMailAttach.NMSMTP1.PostMessage.Subject := sSubject;
           WMailAttach.NMSMTP1.PostMessage.LocalProgram := 'Interacciones Mail Sender';
           WMailAttach.NMSMTP1.SendMail;
           WMailAttach.NMSMTP1.Disconnect;
           Result:=WMailAttach.OKSuccess;
       Finally WMailAttach.Free;
       end;
end;


Function SendEMailAttach(ServerName:string;
                        FromName:String;
                        FromAddr:String;
                        ToAddr:String;
                        Subject:String;
                        TxtMsg:String;
                        Attach:String;
                        SendDateTime:TDateTime;
                        Etiqueta:TLabel):Boolean;
var S:String;
    T:String;
    i:Integer;
    Linea,Boundary:String;
    WMailAttach:TWMailAttach;
    Hora:TDateTime;
begin rESULT:=False;
      WMailAttach:=TWMailAttach.Create(nil);
       Try WMailAttach.OKSuccess:=False;
           if Etiqueta<>nil then Etiqueta.Caption:='Preparando...';
           if SendDateTime=-1 then SendDateTime:=Now;
           if ServerName='' then ServerName:='inter7.gfinter.com';
           WMailAttach.NMSMTP1.Host:=ServerName;
           WMailAttach.NMSMTP1.PostMessage.Date:=IeMailDate(SendDateTime);
           WMailAttach.NMSMTP1.PostMessage.FromAddress := FromAddr;
           WMailAttach.NMSMTP1.PostMessage.FromName := FromName;
           WMailAttach.NMSMTP1.PostMessage.ToAddress.Text:=ToAddr;
           WMailAttach.NMSMTP1.Connect;
           WMailAttach.NMSMTP1.PostMessage.Body.Text:=TxtMsg;
           WMailAttach.NMSMTP1.PostMessage.Attachments.Text:=Attach;
           WMailAttach.NMSMTP1.PostMessage.Subject := Subject;
           WMailAttach.NMSMTP1.PostMessage.LocalProgram := 'Inteacciones Mail Sender';
           if Etiqueta<>nil then Etiqueta.Caption:='Enviando ...';
           WMailAttach.NMSMTP1.SendMail;
           WMailAttach.NMSMTP1.Disconnect;
           Hora:=Now-Hora;
           if Etiqueta<>nil then Etiqueta.Caption:='Tiempo de Envio '+FormatDateTime('HH:MM:SS',Hora);
           Result:=WMailAttach.OKSuccess;
       Finally WMailAttach.Free;
       end;
end;



procedure TWMailAttach.Button1Click(Sender: TObject);
var S:String;
    Hora:TDatetime;
    W:DWord;
    Tiempo:Integer;
    T:String;
    i:Integer;
    Linea,Boundary:String;
begin Hora:=Now;
      NMSMTP1.Host:='inter7.gfinter.com';
      NMSMTP1.Connect;
      NMSMTP1.PostMessage.Date:=IEMailDate(Now);
      NMSMTP1.PostMessage.FromAddress := edFromAddress.Text;
      NMSMTP1.PostMessage.FromName := edFromName.Text;
      NMSMTP1.PostMessage.ToAddress.Add(edToAddress.Text);
    //NMSMTP1.PostMessage.ToCarbonCopy.Add(CCField.Text);
    //NMSMTP1.PostMessage.ToBlindCarbonCopy.Add(BCCField.Text);
    //NMSMTP1.PostMessage.Body.Clear; //AddStrings(Memo1.Lines);

      //NMSMTP1.PostMessage.Body.Text:=T+'<HTML>'+HTPStr(Memo2.Lines.Text)+'</HTML>';
      NMSMTP1.PostMessage.Body.AddStrings(Memo1.Lines);
      NMSMTP1.PostMessage.Attachments.Text:='';
      NMSMTP1.PostMessage.Attachments.AddStrings(Memo3.Lines);
      NMSMTP1.PostMessage.Subject := edSubject.Text;

      NMSMTP1.PostMessage.LocalProgram := 'MACV-InterMail-Server';
      NMSMTP1.SendMail;
      NMSMTP1.Disconnect;
      Hora:=Now-Hora;
      lbHora.Caption:=FormatDateTime('HH:MM:SS',Hora);
end;

procedure TWMailAttach.NMSMTP1SendStart(Sender: TObject);
var P,i:Integer;
    T,Linea,S1,SS:String;
    Found:Boolean;
    Boundary:String;
begin Found:=False;
      (*
      For i:=0 to NMSMTP1.FinalHeader.Count-1 do
      begin Linea:=NMSMTP1.FinalHeader.Strings[i];
            P:=Pos('boundary="',Linea);
            if P>0
            then begin NMSMTP1.FinalHeader.Strings[i]:=Linea;
                       Boundary:=Copy(Linea,P+10,Length(Linea));
                       Boundary:=Copy(Boundary,1,Pos('"',Linea));
                       Found:=True;
                 end;
      end;
      if Found then
      begin  T:='--'+Boundary
             +#13#10+'Content-Type: text/html; charset=us-ascii';
             //NMSMTP1.PostMessage.Body.Text:=T+'<HTML>'+HTPStr(Memo2.Lines.Text)+'</HTML>';
             NMSMTP1.PostMessage.Body.AddStrings(Memo1.Lines);
             NMSMTP1.PostMessage.Body.Add('--'+Boundary);
      end;
      *)
end;

procedure TWMailAttach.NMSMTP1EncodeEnd(Filename: String);
//var File:String;
begin //FileName:=File;
end;

procedure TWMailAttach.NMSMTP1Success(Sender: TObject);
begin OKSuccess:=True;
end;

end.
 