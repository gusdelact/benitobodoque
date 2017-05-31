unit unfirma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  llo, lli, Db, DBTables, StdCtrls, Buttons, ExtCtrls;

type
  TFirmaCtte = class(TForm)
    ImageWindow1: TImageWindow;
    DataSource1: TDataSource;
    Table1: TTable;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    lbNombre: TLabel;
    procedure FormDblClick(Sender: TObject);
    procedure ImageWindow1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  protected
  public
    { Public declarations }
  end;

var
  FirmaCtte: TFirmaCtte;


implementation

{$R *.DFM}

procedure TFirmaCtte.FormDblClick(Sender: TObject);
begin
	close;
end;

procedure TFirmaCtte.ImageWindow1DblClick(Sender: TObject);
begin
	close;
end;

procedure TFirmaCtte.BitBtn1Click(Sender: TObject);
begin
	Close;
end;

end.
