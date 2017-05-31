unit IntQrEdMpios;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead,
  InterApl, IntQRPreview, IntGenCre,UnSQL2, QRExport, Db, DBTables,
  TeeProcs, TeEngine, Chart, DBChart, QRTee, Series;

type
  TQrEdMpios = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qryEdMpios: TQuery;
    DetailBand1: TQRBand;
    qrTxtDesc_Grupo: TQRDBText;
    qrTxtImporte: TQRDBText;
    qrTxtCumple: TQRDBText;
    QRLabel2: TQRLabel;
    TitleBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    qryEdMpiosTIPO: TStringField;
    qryEdMpiosTITULO: TStringField;
    qryEdMpiosPCT_MINIMO: TFloatField;
    qryEdMpiosPCT_MAXIMO: TFloatField;
    qryEdMpiosIMP_REAL: TFloatField;
    qryEdMpiosPCT_REAL: TFloatField;
    qryEdMpiosB_CUMPLIMIENTO: TStringField;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    SummaryBand1: TQRBand;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    qryEdMpiosRENGLON: TFloatField;
    qryEdMpiosTITULOX: TFloatField;
    SummaryBand2: TQRBand;
    QRChart1: TQRChart;
    QRDBChart1: TQRDBChart;
    Series1: TBarSeries;
    Series3: TLineSeries;
    Series2: TBarSeries;
    QRShape1: TQRShape;
    QRLabel12: TQRLabel;
    QRShape3: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLeyendaMoneda: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLCartas: TQRLabel;
    QRLIntereses: TQRLabel;
    procedure qryEdMpiosAfterScroll(DataSet: TDataSet);
  private
    List: TStringList;
  public
    procedure genRPTEdMpios(peFecha: TDateTime; peFactor: double; peCartas, peInteresesAnt: boolean; vlQry: TQuery; pAPli : TInterApli; pPreview  : Boolean);
  end;

var
  QrEdMpios: TQrEdMpios;

implementation

{$R *.DFM}

{ TQrAcreMax }

procedure TQrEdMpios.genRPTEdMpios(peFecha: TDateTime; peFactor: double; peCartas, peInteresesAnt: boolean; vlQry: TQuery; pAPli: TInterApli; pPreview: Boolean);
var
   QrEdMpios   : TQrEdMpios;
   Preview     : TIntQRPreview;
   List        : TStringList;
begin
   List      := TStringList.Create;
   QrEdMpios := TQrEdMpios.Create(Nil);
   Preview   := TIntQRPreview.CreatePreview(Application, QrEdMpios);
   try
      QrEdMpios.QRInterEncabezado1.Apli        := pApli;
      QrEdMpios.QRInterEncabezado1.IdEmpresa   := pAPli.IdEmpresa;
      QrEdMpios.QRInterEncabezado1.NomReporte  := 'IntQrEdMpios';
      QrEdMpios.QRInterEncabezado1.Titulo1     := 'Cartera a Estados y Municipios';
      QrEdMpios.QRInterEncabezado1.Titulo2     := 'Al ' + DateToStr(peFecha);
      QrEdMpios.List                           := List;

      if      peFactor = 1000000 then QrEdMpios.QRLeyendaMoneda.Caption := 'Información expresada en millones de pesos'
      else if peFactor = 1000    then QrEdMpios.QRLeyendaMoneda.Caption := 'Información expresada en miles de pesos'
      else if peFactor = 1       then QrEdMpios.QRLeyendaMoneda.Caption := 'Información expresada en pesos';

      if peCartas then
        QrEdMpios.QRLCartas.Caption := 'Incluye Cartas de Crédito'
      else
        QrEdMpios.QRLCartas.Caption := 'No incluye Cartas de Crédito';

      if peInteresesAnt then
        QrEdMpios.QRLIntereses.Caption := 'Incluye intereses cobrados por anticipado'
      else
        QrEdMpios.QRLIntereses.Caption := 'No incluye intereses cobrados por anticipado';

      try
        QrEdMpios.DataSet                 := vlQry;
        QrEdMpios.QRDBText1.DataSet       := vlQry;
        QrEdMpios.qrTxtDesc_Grupo.DataSet := vlQry;
        QrEdMpios.qrTxtImporte.DataSet    := vlQry;
        QrEdMpios.QRDBText2.DataSet       := vlQry;
        QrEdMpios.QRDBText3.DataSet       := vlQry;
        QrEdMpios.QRDBText4.DataSet       := vlQry;
        QrEdMpios.qrTxtCumple.DataSet     := vlQry;
        QrEdMpios.Series1.Clear;
        QrEdMpios.Series2.Clear;
        QrEdMpios.Series3.Clear;
        QrEdMpios.QRDBChart1.BottomAxis.LabelStyle       := talText;
        QrEdMpios.QRDBChart1.BottomAxis.LabelsAngle      := 315;
        QrEdMpios.QRDBChart1.BottomAxis.LabelsSeparation := 0;

        vlQry.First;
        vlQry.AfterScroll := QrEdMpios.qryEdMpiosAfterScroll;
      except
        on E : Exception do
           raise Exception.Create('No es posible mostrar el Reporte' + chr(13) + chr(10) + e.Message);
      end;

      if pPreview then
         QrEdMpios.Preview
      else
         QrEdMpios.Print;
   finally
      vlQry.AfterScroll := nil;
      List.Free;
      QrEdMpios.free;
      if Assigned(Preview) then Preview.Free;
   end;
end;

procedure TQrEdMpios.qryEdMpiosAfterScroll(DataSet: TDataSet);
var
  s: string;
begin
  s := DataSet.FieldByName ('Desc_Titulo').AsString;
  if List.IndexOf (s) >= 0 then exit;

  Series1.Add (DataSet.FieldByName ('Pct_Minimo').AsFloat, s);
  Series2.Add (DataSet.FieldByName ('Pct_Maximo').AsFloat, s);
  Series3.Add (DataSet.FieldByName ('Pct_Real').AsFloat, s);
  List.Add (s);
end;

end.
