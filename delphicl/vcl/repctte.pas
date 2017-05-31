// Sistema         : Reporte de Clase de contratante
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Reporte Clase de contratante
// Desarrollo por  : Alberto Ramirez
// Comentarios     :

unit RepCtte;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TReporteCtte = class(TQuickRep)
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    Query1: TQuery;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRMacvHeader1: TQRMacvHeader;
  private

  public

  end;

Procedure Execute_RepCtte(ShowPreview:Boolean; Padre:TInterFrame; Id_Contrato:Integer);

implementation

{$R *.DFM}
Procedure Execute_RepCtte(ShowPreview:Boolean; Padre:TInterFrame; Id_Contrato:Integer);
var Reporte: TReporteCtte;
begin Reporte:=TReporteCtte.Create(Padre);
      Try
      Reporte.Query1.DataBaseName:=Padre.DataBaseName;
      Reporte.Query1.SessionName:=Padre.SessionName;
      Reporte.Query1.ParamByName('ID_CONTRATO').asInteger := Id_Contrato;
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


