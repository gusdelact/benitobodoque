// Sistema         : Reporte de Clase de Requisito
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Reporte Clase de Requisito
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :

unit RepTCto;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TReporteTCto = class(TQuickRep)
    Query1: TQuery;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRMacvHeader1: TQRMacvHeader;
  private

  public

  end;

Procedure Execute_RepTCto(ShowPreview:Boolean; Padre:TInterFrame);

implementation

{$R *.DFM}
Procedure Execute_RepTCto(ShowPreview:Boolean; Padre:TInterFrame);
var ReporteTCto: TReporteTCto;
begin ReporteTCto:=TReporteTCto.Create(Padre);
      Try
      ReporteTCto.Query1.DataBaseName:=Padre.DataBaseName;
      ReporteTCto.Query1.SessionName:=Padre.SessionName;
      ReporteTCto.Query1.Open;
      ReporteTCto.QRMacvHeader1.Apli := Padre.Apli;
      if ShowPreview then
         begin ReporteTCto.Preview;
         end
      else ReporteTCto.Print;
      Finally
             ReporteTCto.Free;
      end;
end;





end.
