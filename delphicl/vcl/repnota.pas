// Sistema         : Reporte de Clase de Notario
// Fecha de Inicio : Diciembe de 1997
// Función forma   : Reporte Clase de Notario
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :

unit RepNota;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TReporteNota = class(TQuickRep)
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

Procedure Execute_RepNota(ShowPreview:Boolean; Padre:TInterFrame);

implementation

{$R *.DFM}
Procedure Execute_RepNota(ShowPreview:Boolean; Padre:TInterFrame);
var Reporte: TReporteNota;
begin Reporte := TReporteNota.Create(Padre);
      Try
      Reporte.Query1.DataBaseName := Padre.DataBaseName;
      Reporte.Query1.SessionName := Padre.SessionName;
      Reporte.Query1.Open;
      Reporte.QRMacvHeader1.Apli := Padre.Apli;
      if ShowPreview then
         begin Reporte.Preview;
         end
      else Reporte.Print;
      Finally
             Reporte.Free;
      end;
end;


end.
