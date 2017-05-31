unit IntQrSecPubl;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead,
  InterApl, IntQRPreview, IntGenCre,UnSQL2, QRExport, Db, DBTables,
  TeeProcs, TeEngine, Chart, DBChart, QRTee, Series;

type
  TQrSecPubl = class(TQuickRep)
    QDatos: TQuery;
    TitleBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QDatosSaldo: TFloatField;
    QDatosTitulo: TStringField;
    QDatosPct_Saldo: TFloatField;
    QRLabel11: TQRLabel;
    QRLeyendaMoneda: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    DetailBand1: TQRBand;
    qrTxtDesc_Grupo: TQRDBText;
    qrTxtImporte: TQRDBText;
    qrTxtCumple: TQRDBText;
    QRExpr2: TQRExpr;
    QRLCartas: TQRLabel;
    QRLIntereses: TQRLabel;
  private

  public
  end;

var
  QrSecPubl: TQrSecPubl;

procedure RepCarteraPorSectorPublico(peFecha: TDateTime; peTipo_Entidad: string; peCartas, peInteresesAnt: boolean; vlQry : TQuery; peFactor: double; Apli: TInterApli; Preview: boolean);

implementation

{$R *.DFM}

{ TQrAcreMax }

procedure RepCarteraPorSectorPublico(peFecha: TDateTime; peTipo_Entidad: string; peCartas, peInteresesAnt: boolean; vlQry : TQuery; peFactor: double; Apli: TInterApli; Preview: boolean);
var
  QRSecPubl: TQRSecPubl;
  QrPreview: TIntQRPreview;
  FactorText : String;
begin
  QRSecPubl   :=  TQRSecPubl.Create(Nil);
  QrPreview   := TIntQRPreview.CreatePreview(Application, QRSecPubl);

       if  peFactor = 1000000 then QrSecPubl.QRLeyendaMoneda.Caption := 'Información expresada en millones de pesos'
  else if peFactor = 1000     then QrSecPubl.QRLeyendaMoneda.Caption := 'Información expresada en miles de pesos'
  else if peFactor = 1        then QrSecPubl.QRLeyendaMoneda.Caption := 'Información expresada en pesos';

  try
    vlQry.Filter   := 'Titulo <> ''Total''';
    vlQry.Filtered := True;

    QrSecPubl.DataSet                 := vlQry;
    QrSecPubl.qrTxtDesc_Grupo.DataSet := vlQry;
    QrSecPubl.qrTxtImporte.DataSet    := vlQry;
    QrSecPubl.qrTxtCumple.DataSet     := vlQry;

    QrSecPubl.QRInterEncabezado1.Apli       := Apli;
    QrSecPubl.QRInterEncabezado1.IdEmpresa  := APli.IdEmpresa;
    QrSecPubl.QRInterEncabezado1.NomReporte :='IntQrSecPubl';
    QrSecPubl.QRInterEncabezado1.Titulo2    :=' Al ' + DateToStr(peFecha);

    if peCartas then
      QrSecPubl.QRLCartas.Caption := 'Incluye Cartas de Crédito'
    else
      QrSecPubl.QRLCartas.Caption := 'No incluye Cartas de Crédito';

    if peInteresesAnt then
      QrSecPubl.QRLIntereses.Caption := 'Incluye intereses cobrados por anticipado'
    else
      QrSecPubl.QRLIntereses.Caption := 'No incluye intereses cobrados por anticipado';

    if Preview then
      QrSecPubl.Preview
    else
      QrSecPubl.Print;
  finally
    vlQry.Filtered := False;
    QrSecPubl.Free;

    if Assigned (QrPreview) then
      QrPreview.Free;
  end;
end;

end.
