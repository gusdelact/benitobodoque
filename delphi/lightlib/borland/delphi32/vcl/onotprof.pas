unit Onotprof;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls;

type
  TDlgNotProf = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure CancelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DlgNotProf: TDlgNotProf;

implementation

{$R *.DFM}

procedure TDlgNotProf.CancelBtnClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TDlgNotProf.OKBtnClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

end.
