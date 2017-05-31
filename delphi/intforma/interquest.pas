unit InterQuest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TWInterQuest = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label3: TLabel;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WInterQuest: TWInterQuest;

implementation

{$R *.DFM}


procedure TWInterQuest.Button1Click(Sender: TObject);
begin ModalResult:=mrOK;
end;

procedure TWInterQuest.Button2Click(Sender: TObject);
begin ModalResult:=mrCancel;
end;

procedure TWInterQuest.FormShow(Sender: TObject);
begin Edit1.SetFocus;
end;

end.
