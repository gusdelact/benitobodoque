// Sistema         : Reporte de Clase de Requisito
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Reporte Clase de Requisito
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :

unit RepEmpre;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntFrm,
  IntHead;

type
  TReporteEmpre = class(TQuickRep)
    Query1: TQuery;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape2: TQRShape;
    QRDBImage1: TQRDBImage;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    Query1ID_EMPRESA: TFloatField;
    Query1B_BLOQUEO_GRAL: TStringField;
    Query1F_AYER: TDateTimeField;
    Query1F_FIN_MES_ACT: TDateTimeField;
    Query1F_FIN_MES_ANT: TDateTimeField;
    Query1F_INI_MES_ACT: TDateTimeField;
    Query1F_INI_MES_ANT: TDateTimeField;
    Query1ID_REPRESENTANTE: TFloatField;
    Query1IM_LOGO_EMPRESA: TBlobField;
    Query1B_FECHA_ACT: TStringField;
    Query1NOMBRE: TStringField;
    Query1NOMBRE_1: TStringField;
    PageHeaderBand1: TQRBand;
    QRMacvHeader1: TQRMacvHeader;
    procedure Query1B_BLOQUEO_GRALGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Query1B_FECHA_ACTGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private

  public

  end;

Procedure Execute_RepEmpre(ShowPreview:Boolean; Padre:TInterFrame);

implementation

{$R *.DFM}
Procedure Execute_RepEmpre(ShowPreview:Boolean; Padre:TInterFrame);
var Reporte: TReporteEmpre;
begin Reporte:=TReporteEmpre.Create(Padre);
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















procedure TReporteEmpre.Query1B_BLOQUEO_GRALGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin if Trim(Sender.Value)='V' then Text:='SI' else Text:='NO';
end;

procedure TReporteEmpre.Query1B_FECHA_ACTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin if Trim(Sender.Value)='V' then Text:='SI' else Text:='NO';
end;

end.
