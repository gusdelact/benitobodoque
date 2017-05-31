// Sistema         : Reporte de Clase de Requisito
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Reporte Clase de Requisito
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :

unit RepTEnt;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TReporteTipoEnt = class(TQuickRep)
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

Procedure Execute_RepTipoEnt(ShowPreview:Boolean; Padre:TInterFrame);

implementation

{$R *.DFM}
Procedure Execute_RepTipoEnt(ShowPreview:Boolean; Padre:TInterFrame);
var Reporte: TReporteTipoEnt;
begin Reporte:=TReporteTipoEnt.Create(Padre);
      Try
      Reporte.Query1.DataBaseName:=Padre.DataBaseName;
      Reporte.Query1.SessionName:=Padre.SessionName;
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
