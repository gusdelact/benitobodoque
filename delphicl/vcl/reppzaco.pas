// Sistema         : Reporte Monedas
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Reporte Clase de Monedas
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :

unit RepPzaCo;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TReportePzaComp = class(TQuickRep)
    Query1: TQuery;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRMacvHeader1: TQRMacvHeader;
  private

  public

  end;

Procedure Execute_RepPzaCom(ShowPreview:Boolean; Padre:TInterFrame);

implementation

{$R *.DFM}
Procedure Execute_RepPzaCom(ShowPreview:Boolean; Padre:TInterFrame);
var Reporte: TReportePzaComp;
begin
   Reporte := TReportePzaComp.Create(Padre);
   Try
      Reporte.Query1.DataBaseName := Padre.DataBaseName;
      Reporte.Query1.SessionName := Padre.SessionName;
      Reporte.Query1.Open;
      Reporte.QRMacvHeader1.Apli := Padre.Apli;
      if ShowPreview then
         begin
            Reporte.Preview;
         end
      else
         Reporte.Print;
      Finally
             Reporte.Free;
      end;
end;

end.
