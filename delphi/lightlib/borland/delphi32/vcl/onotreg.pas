unit oNotReg;


interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TDlgNotRegistered = class(TForm)
    Panel1: TPanel;
    OKButton: TBitBtn;
    ProgramIcon: TImage;
    Memo1: TMemo;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DlgNotRegistered: TDlgNotRegistered;

implementation

{$R *.DFM}

end.
 
