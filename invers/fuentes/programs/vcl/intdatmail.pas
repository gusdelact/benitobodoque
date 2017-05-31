unit IntDatMail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, InterApl, Buttons, ComCtrls, UnConInv;

type
  TWDatosMail = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    edOrigen: TEdit;
    edDestino: TEdit;
    Label3: TLabel;
    edHost: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    function  ValidaCampos:Boolean;
    procedure LlenaCamposOrigen;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Apli   : TInterApli;
    BEnvia : Boolean;
    Host,
    MailOrig,
    MailDest : String;

  end;

var
  WDatosMail: TWDatosMail;

procedure MuestraDatMail(pApli : TInterApli; Var psBEnvia : Boolean; Var psHost:String; Var psMailOrig : String; Var psMailDest : String);

implementation

{$R *.DFM}

procedure MuestraDatMail(pApli : TInterApli; Var psBEnvia : Boolean; Var psHost:String; Var psMailOrig : String; Var psMailDest : String);
var WDatosMail: TWDatosMail;
begin
   WDatosMail:= TWDatosMail.Create(Nil);
   try
     WDatosMail.Apli:=pAPli;
     WDatosMail.ShowModal;
     psBEnvia   :=WDatosMail.BEnvia;
     psHost     :=WDatosMail.Host;
     psMailOrig :=WDatosMail.MailOrig;
     psMailDest :=WDatosMail.MailDest;
   finally
     if WDatosMail <> nil then WDatosMail.free;
   end;
end;

function TWDatosMail.ValidaCampos:Boolean;
begin ValidaCampos:=False;
      if TrimRight(edHost.Text) = '' then
      begin
        ShowMessage('No ha especificado el Host de Salida');
        Exit;
      end;
      if TrimRight(edOrigen.Text) = '' then
      begin
        ShowMessage('No ha especificado el e-mail origen');
        Exit;
      end;
      if TrimRight(edDestino.Text) = '' then
      begin
        ShowMessage('No ha especificado el e-mail destino');
        Exit;
      end;
      ValidaCampos:=True;
end;

procedure TWDatosMail.BitBtn1Click(Sender: TObject);
begin if ValidaCampos then
      begin
           BEnvia  :=True;
           Host    :=edHost.Text;
           MailOrig:=edOrigen.Text;
           MailDest:=edDestino.Text;
           Close;
      end;
end;

procedure TWDatosMail.LlenaCamposOrigen;
begin
    //parametrizar en la base de datos
    edOrigen.text:=DLookup(apli.databasename,apli.SessionName,'E_MAIL','EMAIL_PERSONA','ID_PERSONA ='+ IntToStr(apli.UsuarioID));
    edHost.Text:=DLookup(apli.databasename,apli.SessionName,'TX_QUERY_DATA','EMAIL_MSG','CVE_MSG=''ENV_MSG''');
end;

procedure TWDatosMail.FormShow(Sender: TObject);
begin BEnvia  :=False;
      LlenaCamposOrigen;
      edDestino.Setfocus;
end;

procedure TWDatosMail.BitBtn2Click(Sender: TObject);
begin Close;
end;

end.
