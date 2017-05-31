// Sistema         : Reporte de Clase de contratante
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Reporte Clase de contratante
// Desarrollo por  : Alberto Ramirez
// Comentarios     :

unit RepDCtto;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TReporteDCtto = class(TQuickRep)
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    Query1: TQuery;
    QRDBText1: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    lblSituacionDocumento: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRMacvHeader1: TQRMacvHeader;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  end;

Procedure Execute_RepDCtto(ShowPreview:Boolean; Padre:TInterFrame; Id_Contrato:Integer);

implementation

{$R *.DFM}
Procedure Execute_RepDCtto(ShowPreview:Boolean; Padre:TInterFrame; Id_Contrato:Integer);
var
  Reporte: TReporteDCtto;
begin
  Reporte:=TReporteDCtto.Create(Padre);
  Try
  Reporte.Query1.DataBaseName := Padre.DataBaseName;
  Reporte.Query1.SessionName  := Padre.SessionName;
  Reporte.Query1.ParamByName('pID_CONTRATO').asInteger := Id_Contrato;
  Reporte.Query1.Open;
  Reporte.QRMacvHeader1.apli := Padre.Apli;
  if ShowPreview then
     Reporte.Preview
  else
     Reporte.Print;
  Finally
     Reporte.Free;
  end;
end;

procedure TReporteDCtto.DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if Query1.FieldByName('SIT_DOCTO').asString = 'NP' Then
     self.lblSituacionDocumento.caption := 'No Presentado'
  else
     self.lblSituacionDocumento.caption := 'Cumplido'
end;

end.
