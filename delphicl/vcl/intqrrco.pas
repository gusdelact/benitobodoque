unit IntQRRCO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  quickrpt, IntHead, ExtCtrls, Qrctrls, Db, DBTables;

type
  TWQRRelConOpe = class(TForm)
    QRRelConOpe: TQuickRep;
    QRBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRBand2: TQRBand;
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRShape7: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr1: TQRExpr;
    QRelConOpe: TQuery;
    QRShape8: TQRShape;
    QRLabel9: TQRLabel;
    QRShape3: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WQRRelConOpe: TWQRRelConOpe;

implementation

{$R *.DFM}









end.
