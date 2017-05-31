unit IntDmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, InterApl;

type
  TdmMain = class(TDataModule)
    apMain: TInterApli;
    dbMain: TDatabase;
	apMainDWHC: TInterApli;
    dbMainDWHC: TDatabase;
    procedure dbMainBeforeConnect(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

{$R *.DFM}

procedure TdmMain.dbMainBeforeConnect(Sender: TObject);
begin
  //Parametro agregado para evitar la excepcion: "Invalid BLOB handle in record buffer"
  //en TDBGrid"
  TDatabase(Sender).Params.Add('BLOBS TO CACHE=95000');
end;

end.
