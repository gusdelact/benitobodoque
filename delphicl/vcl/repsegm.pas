// Sistema         : Reporte de Clase de Segmentos
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Reporte Clase de Segmentos
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :

unit RepSegm;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TReporteSegm = class(TQuickRep)
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
    PageHeaderBand1: TQRBand;
    QRMacvHeader1: TQRMacvHeader;
    procedure QRDBText3Print(sender: TObject; var Value: String);
  private

  public

  end;

Procedure Execute_RepSegm(ShowPreview:Boolean; Padre:TInterFrame);

implementation

{$R *.DFM}
Procedure Execute_RepSegm(ShowPreview:Boolean; Padre:TInterFrame);
var Reporte: TReporteSegm;
begin Reporte:=TReporteSegm.Create(Padre);
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




procedure TReporteSegm.QRDBText3Print(sender: TObject; var Value: String);
begin if Trim(Query1.FieldByName('SIT_SEGMENTO').AsString)='AC'
         Then Value:='ACTIVO'
         else Value:='CANCELADO';
end;

end.
