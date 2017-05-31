// Sistema         : Reporte de Clase de Requisito
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Reporte Clase de Requisito
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :

unit RepReq;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TReporteReq = class(TQuickRep)
    Query1: TQuery;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape2: TQRShape;
    PageHeaderBand1: TQRBand;
    QRMacvHeader1: TQRMacvHeader;
  private

  public

  end;

Procedure Execute_RepReq(ShowPreview:Boolean; Padre:TInterFrame);

implementation

{$R *.DFM}
Procedure Execute_RepReq(ShowPreview:Boolean; Padre:TInterFrame);
var ReporteReq: TReporteReq;
begin ReporteReq:=TReporteReq.Create(Padre);
      Try
      ReporteReq.Query1.DataBaseName:=Padre.DataBaseName;
      ReporteReq.Query1.SessionName:=Padre.SessionName;
      ReporteReq.Query1.Open;
      ReporteReq.QRMacvHeader1.Apli := Padre.Apli;
      if ShowPreview then
         begin ReporteReq.Preview;
         end
      else ReporteReq.Print;
      Finally
             ReporteReq.Free;
      end;
end;


end.
