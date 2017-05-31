unit IntQRCon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, IntHead, Qrctrls, Db, DBTables;

type
  TWQRCon = class(TForm)
    QRConcepto: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr1: TQRExpr;
    QConcepto: TQuery;
    QRLabel26: TQRLabel;
    QRShape2: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel1: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WQRCon: TWQRCon;

implementation

{$R *.DFM}







end.
