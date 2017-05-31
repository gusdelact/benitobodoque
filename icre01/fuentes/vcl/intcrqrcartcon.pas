unit IntCrQrCartCon;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead,
  InterApl, IntQRPreview, IntGenCre,UnSQL2, QRExport, Db, DBTables,
  TeeProcs, TeEngine, Chart, DBChart, QRTee, Series;

type
  TQrCartCon = class(TQuickRep)
    DetailBand1: TQRBand;
    qrTxtTipo_Consumo: TQRDBText;
    qrTxtSaldo: TQRDBText;
    qrTxtPorcentaje: TQRDBText;
    TitleBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    SummaryBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRLeyendaMoneda: TQRLabel;
    QLeyendaEntidades: TQuery;
    QRLCarta: TQRLabel;
    QRLIntereses: TQRLabel;
    procedure QDatosAfterScroll(DataSet: TDataSet);
  private
  public
  end;

var
  QrCartCon: TQrCartCon;

procedure RepCarteraPorConsumo(peFecha: TDateTime; peTipo_Entidad: string; peCartasCredito, peInteresesAnt: boolean; vlQry : TQuery; peFactor: double; Apli: TInterApli; Preview: boolean);

implementation

{$R *.DFM}

procedure RepCarteraPorConsumo(peFecha: TDateTime; peTipo_Entidad: string; peCartasCredito, peInteresesAnt: boolean; vlQry : TQuery; peFactor: double; Apli: TInterApli; Preview: boolean);
var
  QrCartCon: TQRCartCon;
  QrPreview: TIntQRPreview;
  FactorText : String;

begin
  QRCartCon   :=  TQRCartCon.Create(Nil);
  QrPreview   := TIntQRPreview.CreatePreview(Application, QRCartCon);

       if  peFactor = 1000000 then QrCartCon.QRLeyendaMoneda.Caption := 'Información expresada en millones de pesos'
  else if peFactor = 1000     then QrCartCon.QRLeyendaMoneda.Caption := 'Información expresada en miles de pesos'
  else if peFactor = 1        then QrCartCon.QRLeyendaMoneda.Caption := 'Información expresada en pesos';

  if peCartasCredito then
    QrCartCon.QRLCarta.Caption := 'Incluye Cartas de Crédito'
  else
    QrCartCon.QRLCarta.Caption := 'No incluye Cartas de Crédito';

  if peInteresesAnt then
    QrCartCon.QRLIntereses.Caption := 'Incluye intereses cobrados por anticipado'
  else
    QrCartCon.QRLIntereses.Caption := 'No incluye intereses cobrados por anticipado';

  try
    QrCartCon.DataSet                   := vlQry;
    QrCartCon.qrTxtTipo_Consumo.DataSet := vlQry;
    QrCartCon.qrTxtSaldo.DataSet        := vlQry;
    QrCartCon.qrTxtPorcentaje.DataSet   := vlQry;

    vlQry.AfterScroll := qrCartCon.QDatosAfterScroll;

    QRCartCon.QLeyendaEntidades.Close;
    QRCartCon.QLeyendaEntidades.DatabaseName                            := Apli.DataBaseName;
    QRCartCon.QLeyendaEntidades.SessionName                             := Apli.SessionName;
    QRCartCon.QLeyendaEntidades.ParamByName ('peTipo_Entidad').AsString := peTipo_Entidad;
    QRCartCon.QLeyendaEntidades.Open;
    QRCartCon.QRInterEncabezado1.Titulo2                                := QRCartCon.QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;

    QrCartCon.QRInterEncabezado1.Apli       := Apli;
    QrCartCon.QRInterEncabezado1.IdEmpresa  := APli.IdEmpresa;
    QrCartCon.QRInterEncabezado1.NomReporte :='IntCrQrCartCon';
    QrCartCon.QRInterEncabezado1.Titulo1    :='Cartera por Consumo Al ' + DateToStr(peFecha);

    if Preview then
      QrCartCon.Preview
    else
      QrCartCon.Print;
  finally
    vlQry.AfterScroll := Nil;
    QrCartCon.Free;


    if Assigned (QrPreview) then
      QrPreview.Free;
  end;
end;

procedure TQrCartCon.QDatosAfterScroll(DataSet: TDataSet);
begin
  if not DataSet.Active then Exit;

  if DataSet.FieldByName('Tipo_Consumo').AsString = 'Total' then
  begin
    qrTxtTipo_Consumo.Color      := clBlack;
    qrTxtTipo_Consumo.Font.Color := clWhite;
    qrTxtSaldo.Color             := clBlack;
    qrTxtSaldo.Font.Color        := clWhite;
    qrTxtPorcentaje.Color        := clBlack;
    qrTxtPorcentaje.Font.Color   := clWhite;
  end
  else
  begin
    qrTxtTipo_Consumo.Color      := clWhite;
    qrTxtTipo_Consumo.Font.Color := clBlack;
    qrTxtSaldo.Color             := clWhite;
    qrTxtSaldo.Font.Color        := clBlack;
    qrTxtPorcentaje.Color        := clWhite;
    qrTxtPorcentaje.Font.Color   := clBlack;
  end;

  qrTxtSaldo.Enabled := DataSet.FieldByName('Saldo').AsString <> '';
end;

end.
