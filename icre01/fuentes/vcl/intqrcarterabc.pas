unit IntQrCarteraBc;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead,
  InterApl, IntQRPreview, IntGenCre,UnSQL2, QRExport, Db, DBTables,
  TeeProcs, TeEngine, Chart, DBChart, QRTee, Series;

type
  TQrCartBnc = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qryCartBnc: TQuery;
    DetailBand1: TQRBand;
    qrTxtDesc_Grupo: TQRDBText;
    qrTxtImporte: TQRDBText;
    qrTxtCumple: TQRDBText;
    QRLabel2: TQRLabel;
    TitleBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRLFecha: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qryCartBncCVE_MERCADO: TStringField;
    qryCartBncDESC_MERCADO: TStringField;
    qryCartBncPCT_MINIMO: TFloatField;
    qryCartBncPCT_MAXIMO: TFloatField;
    qryCartBncIMP_REAL: TFloatField;
    qryCartBncPCT_REAL: TFloatField;
    qryCartBncB_CUMPLIMIENTO: TStringField;
    SummaryBand2: TQRBand;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRChart1: TQRChart;
    QRDBChart1: TQRDBChart;
    Series1: TBarSeries;
    Series3: TLineSeries;
    Series2: TBarSeries;
    QRLabel12: TQRLabel;
    QRLeyendaMoneda: TQRLabel;
    QLeyendaEntidades: TQuery;
    QRLCartas: TQRLabel;
    QRLIntereses: TQRLabel;
    procedure qryCartBncAfterScroll(DataSet: TDataSet);
  private

  public
    procedure genRPTCarteraBnc(peFecha: TDateTime; peFactor: double; peLeyenda_Entidad: string; peCartas, peInteresesAnt: boolean; pAPli : TInterApli; vlQry: TQuery; pPreview  : Boolean);
  end;

var
  QrCartBnc: TQrCartBnc;

implementation

{$R *.DFM}

{ TQrAcreMax }
procedure TQrCartBnc.genRPTCarteraBnc(peFecha: TDateTime; peFactor: double; peLeyenda_Entidad: string; peCartas, peInteresesAnt: boolean; pAPli: TInterApli; vlQry: TQuery; pPreview: Boolean);
var
  QrCartBnc: TQrCartBnc;
  Preview  : TIntQRPreview;
begin
   QrCartBnc := TQrCartBnc.Create(Nil);
   Preview   := TIntQRPreview.CreatePreview(Application, QrCartBnc);

   try
      QrCartBnc.QRInterEncabezado1.Apli       := pApli;
      QrCartBnc.QRInterEncabezado1.IdEmpresa  := pAPli.IdEmpresa;
      QrCartBnc.QRInterEncabezado1.NomReporte := 'IntQrCartBnc';
      QrCartBnc.QRInterEncabezado1.Titulo1    := 'Cartera por Banca Al ' + DateToStr(peFecha + 1);
      QrCartBnc.QRInterEncabezado1.Titulo2    := peLeyenda_Entidad;
      QrCartBnc.QRLFecha.Caption              := FormatDateTime ('d MMM yyyy', peFecha + 1);

      if      peFactor = 1000000 then QrCartBnc.QRLeyendaMoneda.Caption := 'Información expresada en millones de pesos'
      else if peFactor = 1000    then QrCartBnc.QRLeyendaMoneda.Caption := 'Información expresada en miles de pesos'
      else if peFactor = 1       then QrCartBnc.QRLeyendaMoneda.Caption := 'Información expresada en pesos';

      if peCartas then
        QrCartBnc.QRLCartas.Caption := 'Incluye Cartas de Crédito'
      else
        QrCartBnc.QRLCartas.Caption := 'No incluye Cartas de Crédito';

      if peInteresesAnt then
        QrCartBnc.QRLIntereses.Caption := 'Incluye intereses cobrados por anticipado'
      else
        QrCartBnc.QRLIntereses.Caption := 'No incluye intereses cobrados por anticipado';

      try
        QrCartBnc.DataSet                 := vlQry;
        QrCartBnc.qrTxtDesc_Grupo.DataSet := vlQry;
        QrCartBnc.qrTxtImporte.DataSet    := vlQry;
        QrCartBnc.QRDBText2.DataSet       := vlQry;
        QrCartBnc.QRDBText3.DataSet       := vlQry;
        QrCartBnc.QRDBText4.DataSet       := vlQry;
        QrCartBnc.qrTxtCumple.DataSet     := vlQry;
        QrCartBnc.QRExpr7.Expression      := 'SUM(IMP_REAL)';
        QrCartBnc.QRExpr8.Expression      := 'SUM(PCT_REAL)';
        QrCartBnc.Series1.Clear;
        QrCartBnc.Series2.Clear;
        QrCartBnc.Series3.Clear;
        QrCartBnc.QRDBChart1.BottomAxis.LabelStyle       := talText;
        QrCartBnc.QRDBChart1.BottomAxis.LabelsAngle      := 315;
        QrCartBnc.QRDBChart1.BottomAxis.LabelsSeparation := 0;

        vlQry.AfterScroll := QrCartBnc.qryCartBncAfterScroll;
      except
        on E : Exception do
           raise Exception.Create('No es posible mostrar el Reporte' + chr(13) + chr(10) + e.Message);
      end;

      if pPreview then
         QrCartBnc.Preview
      else
         QrCartBnc.Print;
   finally
      vlQry.AfterScroll := nil;
      QrCartBnc.free;
      if Assigned(Preview) then Preview.Free;
   end;
end;

procedure TQrCartBnc.qryCartBncAfterScroll(DataSet: TDataSet);
begin
  Series1.Add (DataSet.FieldByName ('Pct_Minimo').AsFloat, DataSet.FieldByName ('Desc_Mercado').AsString);
  Series2.Add (DataSet.FieldByName ('Pct_Maximo').AsFloat, DataSet.FieldByName ('Desc_Mercado').AsString);
  Series3.Add (DataSet.FieldByName ('Pct_Real')  .AsFloat, DataSet.FieldByName ('Desc_Mercado').AsString);
end;

end.
