unit Icompres;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls;

type
  TCompressionDlg = class(TForm)
    OKBtn: TBitBtn;
    Bevel1: TBevel;
    cbCompression: TComboBox;
    Label1: TLabel;
    procedure OKBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CompressionDlg: TCompressionDlg;
  OldHelpFile : String;

implementation

{$R *.DFM}

procedure TCompressionDlg.OKBtnClick(Sender: TObject);
begin
    ModalResult := 1;
end;

procedure TCompressionDlg.FormCreate(Sender: TObject);
begin
    OldHelpFile := Application.HelpFile;
    Application.HelpFile := 'LLIUSER.HLP';
end;

procedure TCompressionDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Application.HelpFile := OldHelpFile;
end;

end.
