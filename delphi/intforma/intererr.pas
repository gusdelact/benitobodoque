unit InterErr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  InterMemo, quickrpt, IntHead, StdCtrls, ExtCtrls, Qrctrls;


type
  TWInterErr = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Regresar: TButton;
    Panel3: TPanel;
    QrErrRep: TQuickRep;
    QrTitulo: TQRBand;
    QRBand1: TQRBand;
    QRMemo1: TQRMemo;
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure QrErrRepNeedData(Sender: TObject; var MoreData: Boolean);
    procedure QrErrRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RegresarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Printeado:Boolean;
  end;

var
  WInterErr: TWInterErr;

implementation

{$R *.DFM}


procedure TWInterErr.Button4Click(Sender: TObject);
begin ModalResult:=mrOK;
end;

procedure TWInterErr.Button2Click(Sender: TObject);
begin QrMemo1.Lines.Assign(Memo1.Lines);
      QrErrRep.Print;
end;

procedure TWInterErr.QrErrRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin  if Printeado then MoreData:=True
                    else MoreData:=False;
       Printeado:=False;
end;

procedure TWInterErr.QrErrRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin PrintReport:=True;
      Printeado:=True;
end;

procedure TWInterErr.Button3Click(Sender: TObject);
begin ShowMessage('Debe de Avisar a Sistemas Inmediatamente, Gracias!!');
end;

procedure TWInterErr.Button1Click(Sender: TObject);
begin Panel1.Visible:=False;
      Panel2.Visible:=True;
      Panel2.BringToFront;
end;

procedure TWInterErr.RegresarClick(Sender: TObject);
begin Panel2.Visible:=False;
      Panel1.Visible:=True;
      Panel1.BringToFront;
end;


end.
