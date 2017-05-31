// Sistema         : Reporte de Clase de Actividades
// Fecha de Inicio : Abril del 2000
// Función forma   : Reporte Clase de Actividades
// Desarrollo por  : Rocío Berenice Muñoz Ríos
// Comentarios     :

unit RepActi;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TReporteActi = class(TQuickRep)
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
    Query1CVE_ACTIV_CTO: TStringField;
    Query1CVE_ACTIV_ORIG: TStringField;
    Query1DESC_ACTIVIDAD: TStringField;
    Query1B_PRESENTA: TStringField;
    procedure QRDBText3Print(sender: TObject; var Value: String);
  private

  public

  end;

Procedure Execute_RepActi(ShowPreview:Boolean; Padre:TInterFrame);

implementation

{$R *.DFM}
Procedure Execute_RepActi(ShowPreview:Boolean; Padre:TInterFrame);
var Reporte: TReporteActi;
begin Reporte:=TReporteActi.Create(Padre);
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




procedure TReporteActi.QRDBText3Print(sender: TObject; var Value: String);
begin if Trim(Query1.FieldByName('B_PRESENTA').AsString)='V'
         Then Value:='Verdadero'
         else Value:='Falso';
end;

end.
