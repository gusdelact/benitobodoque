// Sistema         : Reporte de Clase de Empleados
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Reporte Clase de Empleados
// Desarrollo por  : Alberto Ramirez
// Comentarios     :

unit RepEmpl2;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TReporteEmpl2 = class(TQuickRep)
    Query1: TQuery;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape2: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRMacvHeader1: TQRMacvHeader;
  private
  public
  end;

Procedure Execute_RepEmpl2(ShowPreview:Boolean; Padre:TInterFrame);

implementation

{$R *.DFM}
Procedure Execute_RepEmpl2(ShowPreview:Boolean; Padre:TInterFrame);
var Reporte: TReporteEmpl2;
begin Reporte:=TReporteEmpl2.Create(Padre);
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


