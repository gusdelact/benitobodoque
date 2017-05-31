unit IntCrQrCartReg;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
  Forms, Quickrpt, QRCtrls, IntHead, IntQRPreview, QRExport, Db, DBTables, InterApl,
  Series, TeEngine, TeeProcs, Chart, DBChart, QrTee;

type
  TQRCrCartReg = class(TQuickRep)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QDatos: TQuery;
    QDatosID_Region: TFloatField;
    QDatosDesc_Region: TStringField;
    QDatosPct_Minimo: TFloatField;
    QDatosPct_Maximo: TFloatField;
    QDatosImp_Real: TFloatField;
    QDatosPct_Real: TFloatField;
    QDatosB_Cumplimiento: TStringField;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLeyendaMoneda: TQRLabel;
    QRDBChart1: TQRDBChart;
    QRChart1: TQRChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TLineSeries;
    QRLCarta: TQRLabel;
    QRLIntereses: TQRLabel;
    procedure QDatosAfterScroll(DataSet: TDataSet);
  private
    List: TStringList;
  public

  end;

var
  QRCrCartReg: TQRCrCartReg;

procedure RepCarteraPorRegion (peFecha: TDateTime; peLeyenda_Entidad: string; peFactor: double; peCartasCredito, peInteresesAnt: boolean; vlQry: TQuery; Apli: TInterApli; Preview: boolean);


implementation

{$R *.DFM}

procedure RepCarteraPorRegion (peFecha: TDateTime; peLeyenda_Entidad: string; peFactor: double; peCartasCredito, peInteresesAnt: boolean; vlQry: TQuery; Apli: TInterApli; Preview: boolean);
var
  QRCrCartReg: TQRCrCartReg;
  QrPreview: TIntQRPreview;
  List: TStringList;
begin
  List        := TStringList.Create;
  QRCrCartReg := TQRCrCartReg.Create(Nil);
  QrPreview   := TIntQRPreview.CreatePreview(Application, QRCrCartReg);

  try
    QRCrCartReg.QRInterEncabezado1.Apli       := Apli;
    QRCrCartReg.QRInterEncabezado1.IdEmpresa  := APli.IdEmpresa;
    QRCrCartReg.QRInterEncabezado1.NomReporte := 'IntCrQrCartReg';
    QRCrCartReg.QRInterEncabezado1.Titulo1    := 'Cartera por Región Al ' + DateToStr(peFecha);
    QRCrCartReg.QRInterEncabezado1.Titulo2    := peLeyenda_Entidad;

    if      peFactor = 1000000 then QRCrCartReg.QRLeyendaMoneda.Caption := 'Información expresada en millones de pesos'
    else if peFactor = 1000    then QRCrCartReg.QRLeyendaMoneda.Caption := 'Información expresada en miles de pesos'
    else if peFactor = 1       then QRCrCartReg.QRLeyendaMoneda.Caption := 'Información expresada en pesos';

    if peCartasCredito then
      QRCrCartReg.QRLCarta.Caption := 'Incluye Cartas de Crédito'
    else
      QRCrCartReg.QRLCarta.Caption := 'No incluye Cartas de Crédito';

    if peInteresesAnt then
      QRCrCartReg.QRLIntereses.Caption := 'Incluye intereses cobrados por anticipado'
    else
      QRCrCartReg.QRLIntereses.Caption := 'No incluye intereses cobrados por anticipado';

    QRCrCartReg.DataSet           := vlQry;
    QRCrCartReg.QRDBText1.DataSet := vlQry;
    QRCrCartReg.QRDBText2.DataSet := vlQry;
    QRCrCartReg.QRDBText3.DataSet := vlQry;
    QRCrCartReg.QRDBText4.DataSet := vlQry;
    QRCrCartReg.QRDBText5.DataSet := vlQry;
    QRCrCartReg.QRDBText6.DataSet := vlQry;
    QRCrCartReg.List              := List;

    QRCrCartReg.Series1.Clear;
    QRCrCartReg.Series2.Clear;
    QRCrCartReg.Series3.Clear;
    QRCrCartReg.QRDBChart1.BottomAxis.LabelStyle       := talText;
//    QRCrCartReg.QRDBChart1.BottomAxis.LabelsAngle      := 315;
    QRCrCartReg.QRDBChart1.BottomAxis.LabelsSeparation := 0;

    vlQry.First;
    vlQry.AfterScroll := QRCrCartReg.QDatosAfterScroll;

    if Preview then
      QRCrCartReg.Preview
    else
      QRCrCartReg.Print;

  finally
    vlQry.AfterScroll := nil;
    List.Free;
    QRCrCartReg.Free;

    if Assigned (QrPreview) then
      QrPreview.Free;
  end;
end;

procedure TQRCrCartReg.QDatosAfterScroll(DataSet: TDataSet);
var
  s: string;
begin
  s := DataSet.FieldByName ('Desc_Region').AsString;
  if List.IndexOf (s) >= 0 then exit;

  Series1.Add (DataSet.FieldByName ('Pct_Minimo').AsFloat, s);
  Series2.Add (DataSet.FieldByName ('Pct_Maximo').AsFloat, s);
  Series3.Add (DataSet.FieldByName ('Pct_Real').AsFloat,   s);
  List.Add (s);
end;

end.
