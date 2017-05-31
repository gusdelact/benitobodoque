unit Iquality;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, Spin, ExtCtrls;

type
  TQualityDlg = class(TForm)
    OKBtn: TBitBtn;
    Bevel1: TBevel;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    procedure OKBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QualityDlg: TQualityDlg;
  OldHelpFile : String;

implementation

{$R *.DFM}

procedure TQualityDlg.OKBtnClick(Sender: TObject);
begin
    ModalResult := 1;
end;

procedure TQualityDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Application.HelpFile := OldHelpFile;
end;

procedure TQualityDlg.FormCreate(Sender: TObject);
begin
    OldHelpFile := Application.HelpFile;
    Application.HelpFile := 'LLIUSER.HLP';
end;

end.
