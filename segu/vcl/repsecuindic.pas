// Sistema         : Reporte Indicadores Adicionales
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Reporte Indicadores Adicionales
// Desarrollo por  : Alejandro Villalobos Bahena
// Comentarios     :

unit RepSecuIndic;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TQrSecuIndic = class(TQuickRep)
    qIndicador: TQuery;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape2: TQRShape;
    PageHeaderBand1: TQRBand;
    QRMacvHeader1: TQRMacvHeader;
    qIndicadorCVE_IND_ADIC: TStringField;
    qIndicadorDESC_IND_ADIC: TStringField;
  private

  public

  end;

  //ejecucion
Procedure Execute_RepSecuIndic(ShowPreview:Boolean; Padre:TInterFrame; Todos:Boolean);

implementation

{$R *.DFM}
Procedure Execute_RepSecuIndic(ShowPreview:Boolean; Padre:TInterFrame; Todos:Boolean);
var Reporte: TQrSecuIndic;
    SQL,SQLIF :String;
begin
   Reporte := TQrSecuIndic.Create(Padre);
   Try
      Reporte.qIndicador.DataBaseName := Padre.DataBaseName;
      Reporte.qIndicador.SessionName := Padre.SessionName;
      Reporte.qIndicador.SQL.Clear;
      if (not Todos) and (Length(Padre.FieldByName('CVE_IND_ADIC').AsString) > 0 )then SQLIF:= 'WHERE CVE_IND_ADIC = ' + Padre.FieldByName('CVE_IND_ADIC').AsSql;
      SQL:= 'Select * From SECU_INDICADOR '+
             SQLIF+
            'Order By CVE_IND_ADIC';
      Reporte.qIndicador.SQL.ADD(SQL);
      Reporte.qIndicador.Open;
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
