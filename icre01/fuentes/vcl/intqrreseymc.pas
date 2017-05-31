unit IntQrResEyMC;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, Db, DBTables, InterApl,
  IntQRPreview, TeeProcs, TeEngine, Chart, DBChart, QrTee, Series;

type
  TQrResEyMC = class(TQuickRep)
    TitleBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
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
    QRLab4TYAnt: TQRLabel;
    QRLabAct: TQRLabel;
    QRLab4TYAct: TQRLabel;
    DetailBand1: TQRBand;
    QRCalificacion: TQRDBText;
    QRPct_4TYAnt_Estatal: TQRDBText;
    QRPct_4TYAnt_Municipal: TQRDBText;
    QRPct_4TYAnt_Org_Desc: TQRDBText;
    QRPct_4TYAnt_Calific: TQRDBText;
    QRPct_Act_Estatal: TQRDBText;
    QRPct_Act_Municipal: TQRDBText;
    QRPct_Act_Org_Desc: TQRDBText;
    QRPct_Act_Calific: TQRDBText;
    QRPct_4TYAct_Estatal: TQRDBText;
    QRPct_4TYAct_Municipal: TQRDBText;
    QRPct_4TYAct_Org_Desc: TQRDBText;
    QRPct_4TYAct_Calific: TQRDBText;
    SummaryBand1: TQRBand;
    Chart4TYAntDet: TQRChart;
    QRDBChart1: TQRDBChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    ChartActDet: TQRChart;
    QRDBChart2: TQRDBChart;
    Series4: TBarSeries;
    Series5: TBarSeries;
    Series6: TBarSeries;
    Chart4TYActDet: TQRChart;
    QRDBChart3: TQRDBChart;
    Series7: TBarSeries;
    Series8: TBarSeries;
    Series9: TBarSeries;
    Chart4TYAntSum: TQRChart;
    QRDBChart4: TQRDBChart;
    Series10: TPieSeries;
    ChartActSum: TQRChart;
    QRDBChart5: TQRDBChart;
    Series11: TPieSeries;
    Chart4TYActSum: TQRChart;
    QRDBChart6: TQRDBChart;
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
  QrResEyMC: TQrResEyMC;

procedure RepReservasEyMPorCalificacion (peFecha: TDate; peCartasCredito, peInteresesAnt: boolean; vlQry: TQuery; Apli: TInterApli; Preview: boolean);

implementation

{$R *.DFM}

procedure RepReservasEyMPorCalificacion (peFecha: TDate; peCartasCredito, peInteresesAnt: boolean; vlQry: TQuery; Apli: TInterApli; Preview: boolean);
var
  QrResEyMC: TQrResEyMC;
  QrPreview: TIntQRPreview;
  Year, Month, Day: word;
  List: TStringList;
begin
  QrResEyMC := TQrResEyMC.Create (nil);
  QrPreview := TIntQRPreview.CreatePreview(Application, QrResEyMC);
  List      := TStringList.Create;

  try
    QrResEyMC.QRInterEncabezado1.Apli       := Apli;
    QrResEyMC.QRInterEncabezado1.IdEmpresa  := APli.IdEmpresa;
    QrResEyMC.QRInterEncabezado1.NomReporte := 'IntQrResEyMC';
    QrResEyMC.QRInterEncabezado1.Titulo1    := 'Reservas Estados y Municipios por Calificación';
    QrResEyMC.QRInterEncabezado1.Titulo2    := ' Al ' + DateToStr(peFecha);

    if peCartasCredito then
        QrResEyMC.QRLCarta.Caption := 'Incluye Cartas de Crédito'
      else
        QrResEyMC.QRLCarta.Caption := 'No incluye Cartas de Crédito';

      if peInteresesAnt then
        QrResEyMC.QRLIntereses.Caption := 'Incluye intereses cobrados por anticipado'
      else
        QrResEyMC.QRLIntereses.Caption := 'No incluye intereses cobrados por anticipado';

    DecodeDate (peFecha, Year, Month, Day);
    QrResEyMC.QRLab4TYAnt.Caption := '4T' + IntToStr (Year - 1);
    QrResEyMC.QRLabAct.Caption    := FormatDateTime ('"al "dd" de "mmmm" del "yyyy', peFecha);
    QrResEyMC.QRLab4TYAct.Caption := 'Presupuesto ' + IntToStr (Year);
    QrResEyMC.DetailBand1.Tag     := QrResEyMC.DetailBand1.Height;
    QrResEyMC.List                := List;

    QrResEyMC.Chart4TYAntDet.Chart.Title.Text.Clear;
    QrResEyMC.Chart4TYAntDet.Chart.Title.Text.Add (QrResEyMC.QRLab4TYAnt.Caption);
    QrResEyMC.Chart4TYAntDet.Chart.Title.Text.Add ('Desglose');

    QrResEyMC.Chart4TYAntSum.Chart.Title.Text.Clear;
    QrResEyMC.Chart4TYAntSum.Chart.Title.Text.Add (QrResEyMC.QRLab4TYAnt.Caption);
    QrResEyMC.Chart4TYAntSum.Chart.Title.Text.Add ('Resumen');

    QrResEyMC.ChartActDet.Chart.Title.Text.Clear;
    QrResEyMC.ChartActDet.Chart.Title.Text.Add (QrResEyMC.QRLabAct.Caption);
    QrResEyMC.ChartActDet.Chart.Title.Text.Add ('Desglose');

    QrResEyMC.ChartActSum.Chart.Title.Text.Clear;
    QrResEyMC.ChartActSum.Chart.Title.Text.Add (QrResEyMC.QRLabAct.Caption);
    QrResEyMC.ChartActSum.Chart.Title.Text.Add ('Resumen');

    QrResEyMC.Chart4TYActDet.Chart.Title.Text.Clear;
    QrResEyMC.Chart4TYActDet.Chart.Title.Text.Add (QrResEyMC.QRLab4TYAct.Caption);
    QrResEyMC.Chart4TYActDet.Chart.Title.Text.Add ('Desglose');

    QrResEyMC.Chart4TYActSum.Chart.Title.Text.Clear;
    QrResEyMC.Chart4TYActSum.Chart.Title.Text.Add (QrResEyMC.QRLab4TYAct.Caption);
    QrResEyMC.Chart4TYActSum.Chart.Title.Text.Add ('Resumen');

    QrResEyMC.DataSet                        := vlQry;
    QrResEyMC.QRCalificacion.DataSet         := vlQry;

    QrResEyMC.QRPct_4TYAnt_Estatal.DataSet   := vlQry;
    QrResEyMC.QRPct_4TYAnt_Municipal.DataSet := vlQry;
    QrResEyMC.QRPct_4TYAnt_Org_Desc.DataSet  := vlQry;
    QrResEyMC.QRPct_4TYAnt_Calific.DataSet   := vlQry;

    QrResEyMC.QRPct_Act_Estatal.DataSet      := vlQry;
    QrResEyMC.QRPct_Act_Municipal.DataSet    := vlQry;
    QrResEyMC.QRPct_Act_Org_Desc.DataSet     := vlQry;
    QrResEyMC.QRPct_Act_Calific.DataSet      := vlQry;

    QrResEyMC.QRPct_4TYAct_Estatal.DataSet   := vlQry;
    QrResEyMC.QRPct_4TYAct_Municipal.DataSet := vlQry;
    QrResEyMC.QRPct_4TYAct_Org_Desc.DataSet  := vlQry;
    QrResEyMC.QRPct_4TYAct_Calific.DataSet   := vlQry;

    vlQry.AfterScroll                        := QrResEyMC.QAfterScroll;

    QrResEyMC.Series1.Clear;
    QrResEyMC.Series2.Clear;
    QrResEyMC.Series3.Clear;
    QrResEyMC.Series4.Clear;
    QrResEyMC.Series5.Clear;
    QrResEyMC.Series6.Clear;
    QrResEyMC.Series7.Clear;
    QrResEyMC.Series8.Clear;
    QrResEyMC.Series9.Clear;
    QrResEyMC.Series10.Clear;
    QrResEyMC.Series11.Clear;
    QrResEyMC.Series12.Clear;

    if Preview then
      QrResEyMC.Preview
    else
      QrResEyMC.Print;

  finally
    vlQry.AfterScroll := nil;
    List.Free;
    QrResEyMC.Free;

    if Assigned (QrPreview) then
      QrPreview.Free;
  end;
end;

procedure TQrResEyMC.QAfterScroll(DataSet: TDataSet);
var
  s: string;
  vlColor: TColor;
begin
  if not DataSet.Active then exit;

  if DataSet.FieldByName ('G1').AsFloat = 0 then
  begin
    DetailBand1.Height                := DetailBand1.Tag * 1;
    QRCalificacion.Font.Style         := QRCalificacion.Font.Style         - [fsBold];

    QRPct_4TYAnt_Estatal.Font.Style   := QRPct_4TYAnt_Estatal.Font.Style   - [fsBold];
    QRPct_4TYAnt_Municipal.Font.Style := QRPct_4TYAnt_Municipal.Font.Style - [fsBold];
    QRPct_4TYAnt_Org_Desc.Font.Style  := QRPct_4TYAnt_Org_Desc.Font.Style  - [fsBold];
    QRPct_4TYAnt_Calific.Font.Style   := QRPct_4TYAnt_Calific.Font.Style   - [fsBold];

    QRPct_Act_Estatal.Font.Style      := QRPct_Act_Estatal.Font.Style      - [fsBold];
    QRPct_Act_Municipal.Font.Style    := QRPct_Act_Municipal.Font.Style    - [fsBold];
    QRPct_Act_Org_Desc.Font.Style     := QRPct_Act_Org_Desc.Font.Style     - [fsBold];
    QRPct_Act_Calific.Font.Style      := QRPct_Act_Calific.Font.Style      - [fsBold];

    QRPct_4TYAct_Estatal.Font.Style   := QRPct_4TYAct_Estatal.Font.Style   - [fsBold];
    QRPct_4TYAct_Municipal.Font.Style := QRPct_4TYAct_Municipal.Font.Style - [fsBold];
    QRPct_4TYAct_Org_Desc.Font.Style  := QRPct_4TYAct_Org_Desc.Font.Style  - [fsBold];
    QRPct_4TYAct_Calific.Font.Style   := QRPct_4TYAct_Calific.Font.Style   - [fsBold];
  end
  else
  begin
    DetailBand1.Height                := DetailBand1.Tag * 2;
    QRCalificacion.Font.Style         := QRCalificacion.Font.Style         + [fsBold];

    QRPct_4TYAnt_Estatal.Font.Style   := QRPct_4TYAnt_Estatal.Font.Style   + [fsBold];
    QRPct_4TYAnt_Municipal.Font.Style := QRPct_4TYAnt_Municipal.Font.Style + [fsBold];
    QRPct_4TYAnt_Org_Desc.Font.Style  := QRPct_4TYAnt_Org_Desc.Font.Style  + [fsBold];
    QRPct_4TYAnt_Calific.Font.Style   := QRPct_4TYAnt_Calific.Font.Style   + [fsBold];

    QRPct_Act_Estatal.Font.Style      := QRPct_Act_Estatal.Font.Style      + [fsBold];
    QRPct_Act_Municipal.Font.Style    := QRPct_Act_Municipal.Font.Style    + [fsBold];
    QRPct_Act_Org_Desc.Font.Style     := QRPct_Act_Org_Desc.Font.Style     + [fsBold];
    QRPct_Act_Calific.Font.Style      := QRPct_Act_Calific.Font.Style      + [fsBold];

    QRPct_4TYAct_Estatal.Font.Style   := QRPct_4TYAct_Estatal.Font.Style   + [fsBold];
    QRPct_4TYAct_Municipal.Font.Style := QRPct_4TYAct_Municipal.Font.Style + [fsBold];
    QRPct_4TYAct_Org_Desc.Font.Style  := QRPct_4TYAct_Org_Desc.Font.Style  + [fsBold];
    QRPct_4TYAct_Calific.Font.Style   := QRPct_4TYAct_Calific.Font.Style   + [fsBold];
  end;

  s := DataSet.FieldByName ('G1').AsString + DataSet.FieldByName ('Lab_Calific').AsString;
  if List.IndexOf (s) > -1 then exit;

  if (DataSet.FieldByName ('G1').AsFloat = 0) or (DataSet.FieldByName ('Lab_Calific').AsString = 'Exc') then
  begin
    Series1.Add (DataSet.FieldByName ('Pct_4TYAnt_Estatal').AsFloat,   DataSet.FieldByName ('Lab_Calific').AsString);
    Series2.Add (DataSet.FieldByName ('Pct_4TYAnt_Municipal').AsFloat, DataSet.FieldByName ('Lab_Calific').AsString);
    Series3.Add (DataSet.FieldByName ('Pct_4TYAnt_Org_Desc').AsFloat,  DataSet.FieldByName ('Lab_Calific').AsString);

    Series4.Add (DataSet.FieldByName ('Pct_Act_Estatal').AsFloat,      DataSet.FieldByName ('Lab_Calific').AsString);
    Series5.Add (DataSet.FieldByName ('Pct_Act_Municipal').AsFloat,    DataSet.FieldByName ('Lab_Calific').AsString);
    Series6.Add (DataSet.FieldByName ('Pct_Act_Org_Desc').AsFloat,     DataSet.FieldByName ('Lab_Calific').AsString);

    Series7.Add (DataSet.FieldByName ('Pct_4TYAct_Estatal').AsFloat,   DataSet.FieldByName ('Lab_Calific').AsString);
    Series8.Add (DataSet.FieldByName ('Pct_4TYAct_Municipal').AsFloat, DataSet.FieldByName ('Lab_Calific').AsString);
    Series9.Add (DataSet.FieldByName ('Pct_4TYAct_Org_Desc').AsFloat,  DataSet.FieldByName ('Lab_Calific').AsString);
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
