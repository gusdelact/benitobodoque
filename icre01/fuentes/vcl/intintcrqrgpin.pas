unit IntIntCrQrGpIn;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
  Forms, Quickrpt, QRCtrls, IntHead, IntQRPreview, QRExport, Db, DBTables, InterApl,
  TeeProcs, TeEngine, Chart, DBChart, QrTee, Series;

type
  TQIntCrGpIn = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QDatos: TQuery;
    QDatosID_Tipo: TFloatField;
    QDatosTipo: TStringField;
    QDatosClave: TFloatField;
    QDatosDescripcion: TStringField;
    QDatosPct_Minimo: TFloatField;
    QDatosPct_Maximo: TFloatField;
    QDatosPct_Real: TFloatField;
    QDatosCumplimiento: TStringField;
    DetailBand1: TQRBand;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBTipo: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRExpr3: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    SummaryBand1: TQRBand;
    QRDBChart1: TQRDBChart;
    QRChart1: TQRChart;
    QRDBChart2: TQRDBChart;
    QRChart2: TQRChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TLineSeries;
    Series4: TBarSeries;
    Series5: TBarSeries;
    Series6: TLineSeries;
    QRLCarta: TQRLabel;
    QRLIntereses: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRExpr1: TQRExpr;
    procedure QDatosAfterScroll(DataSet: TDataSet);
  private
    List: TStringList;
  public

  end;

var
  QIntCrGpIn: TQIntCrGpIn;

procedure RepCartInfraestructura (peFecha: TDateTime; peLeyenda_Entidad: string; peCartasCredito, peInteresesAnt: boolean; vlQry: TQuery; Apli: TInterApli; Preview: boolean);


implementation

{$R *.DFM}

procedure RepCartInfraestructura (peFecha: TDateTime; peLeyenda_Entidad: string; peCartasCredito, peInteresesAnt: boolean; vlQry: TQuery; Apli: TInterApli; Preview: boolean);
var
  QIntCrGpIn: TQIntCrGpIn;
  QrPreview: TIntQRPreview;
  List: TStringList;
begin
  List       := TStringList.Create;
  QIntCrGpIn := TQIntCrGpIn.Create(Nil);
  QrPreview  := TIntQRPreview.CreatePreview(Application, QIntCrGpIn);

  try
    QIntCrGpIn.QRDBTipo.Tag                                     := QIntCrGpIn.QRDBTipo.Width;

    QIntCrGpIn.QRInterEncabezado1.Apli       := Apli;
    QIntCrGpIn.QRInterEncabezado1.IdEmpresa  := APli.IdEmpresa;
    QIntCrGpIn.QRInterEncabezado1.NomReporte := 'IntIntCrQrGpIn';
    QIntCrGpIn.QRInterEncabezado1.Titulo1    := 'Cartera de Infraestructura y Construcción Al ' + DateToStr(peFecha + 1);
    QIntCrGpIn.QRInterEncabezado1.Titulo2    := peLeyenda_Entidad;

    if peCartasCredito then
      QIntCrGpIn.QRLCarta.Caption := 'Incluye Cartas de Crédito'
    else
      QIntCrGpIn.QRLCarta.Caption := 'No incluye Cartas de Crédito';

    if peInteresesAnt then
      QIntCrGpIn.QRLIntereses.Caption := 'Incluye intereses cobrados por anticipado'
    else
      QIntCrGpIn.QRLIntereses.Caption := 'No incluye intereses cobrados por anticipado';

    QIntCrGpIn.DataSet           := vlQry;
    QIntCrGpIn.QRDBTipo.DataSet  := vlQry;
    QIntCrGpIn.QRDBText1.DataSet := vlQry;
    QIntCrGpIn.QRDBText2.DataSet := vlQry;
    QIntCrGpIn.QRDBText3.DataSet := vlQry;
    QIntCrGpIn.QRDBText4.DataSet := vlQry;
    QIntCrGpIn.QRDBText5.DataSet := vlQry;
    QIntCrGpIn.QRDBText6.DataSet := vlQry;

    QIntCrGpIn.Series1.Clear;
    QIntCrGpIn.Series2.Clear;
    QIntCrGpIn.Series3.Clear;
    QIntCrGpIn.Series4.Clear;
    QIntCrGpIn.Series5.Clear;
    QIntCrGpIn.Series6.Clear;
    QIntCrGpIn.QRDBChart1.BottomAxis.LabelStyle       := talText;
    QIntCrGpIn.QRDBChart1.BottomAxis.LabelsAngle      := 315;
    QIntCrGpIn.QRDBChart1.BottomAxis.LabelsSeparation := 0;
    QIntCrGpIn.QRDBChart2.BottomAxis.LabelStyle       := talText;
    QIntCrGpIn.QRDBChart2.BottomAxis.LabelsAngle      := 315;
    QIntCrGpIn.QRDBChart2.BottomAxis.LabelsSeparation := 0;
    QIntCrGpIn.List                                   := List;

    vlQry.AfterScroll := QIntCrGpIn.QDatosAfterScroll;

    if Preview then
      QIntCrGpIn.Preview
    else
      QIntCrGpIn.Print;

  finally
    vlQry.AfterScroll := nil;
    List.Free;
    QIntCrGpIn.Free;

    if Assigned (QrPreview) then
      QrPreview.Free;
  end;
end;


procedure TQIntCrGpIn.QDatosAfterScroll(DataSet: TDataSet);
var
  s: string;
begin
  if not DataSet.Active then exit;

  QRDBTipo.Enabled := not DataSet.FieldByName ('Tipo').IsNull;

  s := DataSet.FieldByName ('Descripcion').AsString;
  if List.IndexOf (s) >= 0 then exit;

  if DataSet.FieldByName ('ID_Tipo').AsInteger = 1 then
  begin
    Series1.Add (DataSet.FieldByName ('Pct_Minimo').AsFloat, s);
    Series2.Add (DataSet.FieldByName ('Pct_Maximo').AsFloat, s);
    Series3.Add (DataSet.FieldByName ('Pct_Real').AsFloat, s);
  end
  else
  begin
    Series4.Add (DataSet.FieldByName ('Pct_Minimo').AsFloat, s);
    Series5.Add (DataSet.FieldByName ('Pct_Maximo').AsFloat, s);
    Series6.Add (DataSet.FieldByName ('Pct_Real').AsFloat, s);
  end;
  List.Add (s);
end;

end.
