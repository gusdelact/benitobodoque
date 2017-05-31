// Sistema         : Reporte de Clase de Poblaciones
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Reporte Clase de Poblaciones
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :

unit RepInter;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TReporteIntermediario = class(TQuickRep)
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
    QRGroup1: TQRGroup;
    lbEmpresa: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
  end;

Procedure Execute_RepInterm(ShowPreview:Boolean; Padre:TInterFrame);

implementation

{$R *.DFM}
Procedure Execute_RepInterm(ShowPreview:Boolean; Padre:TInterFrame);
var Reporte: TReporteIntermediario;
begin
	Reporte:=TReporteIntermediario.Create(Padre);
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

procedure TReporteIntermediario.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
	If Query1.fieldByName('CVE_TIPO_INTERM').asString = 'BA' Then
   	lbEmpresa.Caption := 'BANCO'
   else If Query1.fieldByName('CVE_TIPO_INTERM').asString = 'CB' Then
   	lbEmpresa.Caption := 'CASA DE BOLSA'
   else
   	lbEmpresa.Caption := 'NO ESPECIFICADA';
   end;



end.
