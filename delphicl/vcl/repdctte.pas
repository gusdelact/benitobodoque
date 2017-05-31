// Sistema         : Reporte de Clase de contratante
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Reporte Clase de contratante
// Desarrollo por  : Alberto Ramirez
// Comentarios     :

unit RepDCtte;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TReporteDCtte = class(TQuickRep)
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    Query1: TQuery;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText3: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRMacvHeader1: TQRMacvHeader;
  private

  public

  end;

Procedure Execute_RepDCtte(ShowPreview:Boolean; Padre:TInterFrame; Id_Contrato:Integer);

implementation

{$R *.DFM}
Procedure Execute_RepDCtte(ShowPreview:Boolean; Padre:TInterFrame; Id_Contrato:Integer);
var Reporte: TReporteDCtte;
begin Reporte:=TReporteDCtte.Create(Padre);
      Try
      Reporte.Query1.DataBaseName:=Padre.DataBaseName;
      Reporte.Query1.SessionName:=Padre.SessionName;
      Reporte.Query1.ParamByName('ID_CONTRATO').AsInteger := Id_Contrato;
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

