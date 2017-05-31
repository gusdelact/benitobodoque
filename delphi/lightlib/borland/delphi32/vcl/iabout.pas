unit Iabout;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, SysUtils, LLO;

type
  TDlgAbout = class(TForm)
    Panel1: TPanel;
    OKButton: TBitBtn;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DlgAbout: TDlgAbout;

implementation

{$I LLI.INC}

{$R *.DFM}

procedure TDlgAbout.FormCreate(Sender: TObject);
begin
    CopyRight.Caption := LightLibCopyRightStr;
    Version.Caption   := LightLibVersionStr( LLO_LIBRARY_IMAGE );
end;

end.

