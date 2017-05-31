unit UnRpDoc;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, InterMemo, Db, DBTables;

type
  TrpDocumento = class(TQuickRep)
    QRBand2: TQRBand;
    QRInterMemo2: TQRInterMemo;
    QRInterMemo1: TQRInterMemo;
    QRFecha: TQRLabel;
    QRLEmpresa: TQRLabel;
    Query: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  rpDocumento: TrpDocumento;

implementation
{$R *.DFM}
end.
