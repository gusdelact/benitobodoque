unit IntQrResCali;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, Db, DBTables, InterApl,
  IntQRPreview, TeeProcs, TeEngine, Chart, DBChart, QrTee, Series;

type
  TQrResCali = class(TQuickRep)
    TitleBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRCalificacion: TQRDBText;
    QRLab4TYAnt: TQRLabel;
    QRLabAct: TQRLabel;
    QRLab4TYAct: TQRLabel;
    QRPct_4TYAnt_Gobierno: TQRDBText;
    QRPct_4TYAnt_Infra: TQRDBText;
    QRPct_4TYAnt_Otros: TQRDBText;
    QRPct_4TYAnt_Calific: TQRDBText;
    QRPct_Act_Gobierno: TQRDBText;
    QRPct_Act_Infra: TQRDBText;
    QRPct_Act_Otros: TQRDBText;
    QRPct_Act_Calific: TQRDBText;
    QRPct_4TYAct_Gobierno: TQRDBText;
    QRPct_4TYAct_Infra: TQRDBText;
    QRPct_4TYAct_Otros: TQRDBText;
    QRPct_4TYAct_Calific: TQRDBText;
    Chart4TYAntDet: TQRChart;
    QRDBChart1: TQRDBChart;
    ChartActDet: TQRChart;
    QRDBChart2: TQRDBChart;
    Chart4TYActDet: TQRChart;
    QRDBChart3: TQRDBChart;
    Chart4TYAntSum: TQRChart;
    QRDBChart4: TQRDBChart;
    ChartActSum: TQRChart;
    QRDBChart5: TQRDBChart;
    Chart4TYActSum: TQRChart;
    QRDBChart6: TQRDBChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Series5: TBarSeries;
    Series6: TBarSeries;
    Series7: TBarSeries;
    Series8: TBarSeries;
    Series9: TBarSeries;
    Series10: TPieSeries;
    Series11: TPieSeries;
    Series12: TPieSeries;
    QRShape1: TQRShape;
    ShapeGobierno: TQRShape;
    QRLabel14: TQRLabel;
    QRShape2: TQRShape;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    QRLabel16: TQRLabel;
    QRLCarta: TQRLabel;
    QRLIntereses: TQRLabel;
  private
    List: TStringList;
    procedure QAfterScroll(DataSet: TDataSet);
  public

  end;

var
  QrResCali: TQrResCali;

procedure RepReservasPorCalificacion (peFecha: TDate; peLeyenda_Entidad: string; peCartasCredito, peInteresesAnt: boolean; vlQry: TQuery; Apli: TInterApli; Preview: boolean);

implementation

{$R *.DFM}

procedure RepReservasPorCalificacion (peFecha: TDate; peLeyenda_Entidad: string; peCartasCredito, peInteresesAnt: boolean; vlQry: TQuery; Apli: TInterApli; Preview: boolean);
var
  QrResCali: TQrResCali;
  QrPreview: TIntQRPreview;
  Year, Month, Day: word;
  List: TStringList;
begin
  QrResCali := TQrResCali.Create (nil);
  QrPreview := TIntQRPreview.CreatePreview(Application, QrResCali);
  List      := TStringList.Create;

  try
    QrResCali.QRInterEncabezado1.Apli       := Apli;
    QrResCali.QRInterEncabezado1.IdEmpresa  := APli.IdEmpresa;
    QrResCali.QRInterEncabezado1.NomReporte := 'IntQrResCali';
    QrResCali.QRInterEncabezado1.Titulo1    := 'Reservas Totales por Calificación Al ' + DateToStr(peFecha);
    QrResCali.QRInterEncabezado1.Titulo2    := peLeyenda_Entidad;

    if peCartasCredito then
        QrResCali.QRLCarta.Caption := 'Incluye Cartas de Crédito'
      else
        QrResCali.QRLCarta.Caption := 'No incluye Cartas de Crédito';

      if peInteresesAnt then
        QrResCali.QRLIntereses.Caption := 'Incluye intereses cobrados por anticipado'
      else
        QrResCali.QRLIntereses.Caption := 'No incluye intereses cobrados por anticipado';

    DecodeDate (peFecha, Year, Month, Day);
    QrResCali.QRLab4TYAnt.Caption := '4T' + IntToStr (Year - 1);
    QrResCali.QRLabAct.Caption    := FormatDateTime ('"al "dd" de "mmmm" del "yyyy', peFecha);
    QrResCali.QRLab4TYAct.Caption := 'Presupuesto ' + IntToStr (Year);
    QrResCali.DetailBand1.Tag     := QrResCali.DetailBand1.Height;
    QrResCali.List                := List;

    QrResCali.Chart4TYAntDet.Chart.Title.Text.Clear;
    QrResCali.Chart4TYAntDet.Chart.Title.Text.Add (QrResCali.QRLab4TYAnt.Caption);
    QrResCali.Chart4TYAntDet.Chart.Title.Text.Add ('Desglose');

    QrResCali.Chart4TYAntSum.Chart.Title.Text.Clear;
    QrResCali.Chart4TYAntSum.Chart.Title.Text.Add (QrResCali.QRLab4TYAnt.Caption);
    QrResCali.Chart4TYAntSum.Chart.Title.Text.Add ('Resumen');

    QrResCali.ChartActDet.Chart.Title.Text.Clear;
    QrResCali.ChartActDet.Chart.Title.Text.Add (QrResCali.QRLabAct.Caption);
    QrResCali.ChartActDet.Chart.Title.Text.Add ('Desglose');

    QrResCali.ChartActSum.Chart.Title.Text.Clear;
    QrResCali.ChartActSum.Chart.Title.Text.Add (QrResCali.QRLabAct.Caption);
    QrResCali.ChartActSum.Chart.Title.Text.Add ('Resumen');

    QrResCali.Chart4TYActDet.Chart.Title.Text.Clear;
    QrResCali.Chart4TYActDet.Chart.Title.Text.Add (QrResCali.QRLab4TYAct.Caption);
    QrResCali.Chart4TYActDet.Chart.Title.Text.Add ('Desglose');

    QrResCali.Chart4TYActSum.Chart.Title.Text.Clear;
    QrResCali.Chart4TYActSum.Chart.Title.Text.Add (QrResCali.QRLab4TYAct.Caption);
    QrResCali.Chart4TYActSum.Chart.Title.Text.Add ('Resumen');

    QrResCali.DataSet                       := vlQry;
    QrResCali.QRCalificacion.DataSet        := vlQry;

    QrResCali.QRPct_4TYAnt_Gobierno.DataSet := vlQry;
    QrResCali.QRPct_4TYAnt_Infra.DataSet    := vlQry;
    QrResCali.QRPct_4TYAnt_Otros.DataSet    := vlQry;
    QrResCali.QRPct_4TYAnt_Calific.DataSet  := vlQry;

    QrResCali.QRPct_Act_Gobierno.DataSet    := vlQry;
    QrResCali.QRPct_Act_Infra.DataSet       := vlQry;
    QrResCali.QRPct_Act_Otros.DataSet       := vlQry;
    QrResCali.QRPct_Act_Calific.DataSet     := vlQry;

    QrResCali.QRPct_4TYAct_Gobierno.DataSet := vlQry;
    QrResCali.QRPct_4TYAct_Infra.DataSet    := vlQry;
    QrResCali.QRPct_4TYAct_Otros.DataSet    := vlQry;
    QrResCali.QRPct_4TYAct_Calific.DataSet  := vlQry;

    vlQry.AfterScroll                       := QrResCali.QAfterScroll;

    QrResCali.Series1.Clear;
    QrResCali.Series2.Clear;
    QrResCali.Series3.Clear;
    QrResCali.Series4.Clear;
    QrResCali.Series5.Clear;
    QrResCali.Series6.Clear;
    QrResCali.Series7.Clear;
    QrResCali.Series8.Clear;
    QrResCali.Series9.Clear;
    QrResCali.Series10.Clear;
    QrResCali.Series11.Clear;
    QrResCali.Series12.Clear;

    if Preview then
      QrResCali.Preview
    else
      QrResCali.Print;

  finally
    vlQry.AfterScroll := nil;
    List.Free;
    QrResCali.Free;

    if Assigned (QrPreview) then
      QrPreview.Free;
  end;
end;

procedure TQrResCali.QAfterScroll(DataSet: TDataSet);
var
  s: string;
  vlColor: TColor;
begin
  if not DataSet.Active then exit;

  if DataSet.FieldByName ('G1').AsFloat = 0 then
  begin
    DetailBand1.Height               := DetailBand1.Tag * 1;
    QRCalificacion.Font.Style        := QRCalificacion.Font.Style        - [fsBold];

    QRPct_4TYAnt_Gobierno.Font.Style := QRPct_4TYAnt_Gobierno.Font.Style - [fsBold];
    QRPct_4TYAnt_Infra.Font.Style    := QRPct_4TYAnt_Infra.Font.Style    - [fsBold];
    QRPct_4TYAnt_Otros.Font.Style    := QRPct_4TYAnt_Otros.Font.Style    - [fsBold];
    QRPct_4TYAnt_Calific.Font.Style  := QRPct_4TYAnt_Calific.Font.Style  - [fsBold];

    QRPct_Act_Gobierno.Font.Style    := QRPct_Act_Gobierno.Font.Style    - [fsBold];
    QRPct_Act_Infra.Font.Style       := QRPct_Act_Infra.Font.Style       - [fsBold];
    QRPct_Act_Otros.Font.Style       := QRPct_Act_Otros.Font.Style       - [fsBold];
    QRPct_Act_Calific.Font.Style     := QRPct_Act_Calific.Font.Style     - [fsBold];

    QRPct_4TYAct_Gobierno.Font.Style := QRPct_4TYAct_Gobierno.Font.Style - [fsBold];
    QRPct_4TYAct_Infra.Font.Style    := QRPct_4TYAct_Infra.Font.Style    - [fsBold];
    QRPct_4TYAct_Otros.Font.Style    := QRPct_4TYAct_Otros.Font.Style    - [fsBold];
    QRPct_4TYAct_Calific.Font.Style  := QRPct_4TYAct_Calific.Font.Style  - [fsBold];
  end
  else
  begin
    DetailBand1.Height               := DetailBand1.Tag * 2;
    QRCalificacion.Font.Style        := QRCalificacion.Font.Style        + [fsBold];

    QRPct_4TYAnt_Gobierno.Font.Style := QRPct_4TYAnt_Gobierno.Font.Style + [fsBold];
    QRPct_4TYAnt_Infra.Font.Style    := QRPct_4TYAnt_Infra.Font.Style    + [fsBold];
    QRPct_4TYAnt_Otros.Font.Style    := QRPct_4TYAnt_Otros.Font.Style    + [fsBold];
    QRPct_4TYAnt_Calific.Font.Style  := QRPct_4TYAnt_Calific.Font.Style  + [fsBold];

    QRPct_Act_Gobierno.Font.Style    := QRPct_Act_Gobierno.Font.Style    + [fsBold];
    QRPct_Act_Infra.Font.Style       := QRPct_Act_Infra.Font.Style       + [fsBold];
    QRPct_Act_Otros.Font.Style       := QRPct_Act_Otros.Font.Style       + [fsBold];
    QRPct_Act_Calific.Font.Style     := QRPct_Act_Calific.Font.Style     + [fsBold];

    QRPct_4TYAct_Gobierno.Font.Style := QRPct_4TYAct_Gobierno.Font.Style + [fsBold];
    QRPct_4TYAct_Infra.Font.Style    := QRPct_4TYAct_Infra.Font.Style    + [fsBold];
    QRPct_4TYAct_Otros.Font.Style    := QRPct_4TYAct_Otros.Font.Style    + [fsBold];
    QRPct_4TYAct_Calific.Font.Style  := QRPct_4TYAct_Calific.Font.Style  + [fsBold];
  end;

  s := DataSet.FieldByName ('G1').AsString + DataSet.FieldByName ('Lab_Calific').AsString;
  if List.IndexOf (s) > -1 then exit;

  if (DataSet.FieldByName ('G1').AsFloat = 0) or (DataSet.FieldByName ('Lab_Calific').AsString = 'Exc') then
  begin
    Series1.Add (DataSet.FieldByName ('Pct_4TYAnt_Gobierno').AsFloat, DataSet.FieldByName ('Lab_Calific').AsString);
    Series2.Add (DataSet.FieldByName ('Pct_4TYAnt_Infra').AsFloat,    DataSet.FieldByName ('Lab_Calific').AsString);
    Series3.Add (DataSet.FieldByName ('Pct_4TYAnt_Otros').AsFloat,    DataSet.FieldByName ('Lab_Calific').AsString);

    Series4.Add (DataSet.FieldByName ('Pct_Act_Gobierno').AsFloat,    DataSet.FieldByName ('Lab_Calific').AsString);
    Series5.Add (DataSet.FieldByName ('Pct_Act_Infra').AsFloat,       DataSet.FieldByName ('Lab_Calific').AsString);
    Series6.Add (DataSet.FieldByName ('Pct_Act_Otros').AsFloat,       DataSet.FieldByName ('Lab_Calific').AsString);

    Series7.Add (DataSet.FieldByName ('Pct_4TYAct_Gobierno').AsFloat, DataSet.FieldByName ('Lab_Calific').AsString);
    Series8.Add (DataSet.FieldByName ('Pct_4TYAct_Infra').AsFloat,    DataSet.FieldByName ('Lab_Calific').AsString);
    Series9.Add (DataSet.FieldByName ('Pct_4TYAct_Otros').AsFloat,    DataSet.FieldByName ('Lab_Calific').AsString);
  end;

  if DataSet.FieldByName ('G1').AsFloat = 1 then
  begin
    vlColor := clWhite;
    if      DataSet.FieldByName ('Lab_Calific').AsString = 'Total A' then
      vlColor := clRed
    else if DataSet.FieldByName ('Lab_Calific').AsString = 'Total B' then
      vlColor := clGreen
    else if DataSet.FieldByName ('Lab_Calific').AsString = 'Total Otros' then
      vlColor := clYellow
    else if DataSet.FieldByName ('Lab_Calific').AsString = 'Exc' then
      vlColor := clBlue;

    Series10.Add (DataSet.FieldByName ('Pct_4TYAnt_Calific').AsFloat, DataSet.FieldByName ('Lab_Calific').AsString, vlColor);
    Series11.Add (DataSet.FieldByName ('Pct_Act_Calific').AsFloat,    DataSet.FieldByName ('Lab_Calific').AsString, vlColor);
    Series12.Add (DataSet.FieldByName ('Pct_4TYAct_Calific').AsFloat, DataSet.FieldByName ('Lab_Calific').AsString, vlColor);
  end;
  List.Add (s);
end;


end.
