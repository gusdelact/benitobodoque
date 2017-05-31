// Sistema         : Reporte Tipos de Población
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Reporte Clase de Tipos de Población
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :

unit RepPMor2;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TReportePMor2 = class(TQuickRep)
    Query1: TQuery;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape2: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText4: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRMacvHeader1: TQRMacvHeader;
  private

  public

  end;

Procedure Execute_RepPMor2(ShowPreview:Boolean; Padre:TInterFrame);

implementation

{$R *.DFM}
Procedure Execute_RepPMor2(ShowPreview:Boolean; Padre:TInterFrame);
var Reporte: TReportePMor2;
begin
   Reporte := TReportePMor2.Create(Padre);
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
