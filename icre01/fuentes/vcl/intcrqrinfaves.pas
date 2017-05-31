unit IntCrQrInfAves;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead,
  InterApl, IntQRPreview, IntGenCre,UnSQL2, QRExport, Db, DBTables,
  TeeProcs, TeEngine, Chart, DBChart, QRTee, Series;

type
  TQrCrInfAves = class(TQuickRep)
    TitleBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel12: TQRLabel;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    qDatos: TQuery;
    QRLeyendaMoneda: TQRLabel;
    qrTxtRegion: TQRDBText;
    qrTxtImp_Normal: TQRDBText;
    lbImporte: TQRLabel;
    lbAcreditados: TQRLabel;
    lbLineas: TQRLabel;
    qrTxtAcr_Normal: TQRDBText;
    qrTxtLin_Normal: TQRDBText;
    qrTxtImp_Ave1: TQRDBText;
    qrTxtAcr_Ave1: TQRDBText;
    qrTxtLin_Ave1: TQRDBText;
    qrTxtImp_Ave2: TQRDBText;
    qrTxtAcr_Ave2: TQRDBText;
    qrTxtLin_Ave2: TQRDBText;
    QLeyendaEntidades: TQuery;
    qrTxtImp_Ave3: TQRDBText;
    qrTxtAcr_Ave3: TQRDBText;
    qrTxtLin_Ave3: TQRDBText;
    qrTxtImp_Ave4: TQRDBText;
    qrTxtAcr_Ave4: TQRDBText;
    qrTxtLin_Ave4: TQRDBText;
    qrTxtImp_Ave5: TQRDBText;
    qrTxtAcr_Ave5: TQRDBText;
    qrTxtLin_Ave5: TQRDBText;
    qrTxtImp_Total: TQRDBText;
    qrTxtAcr_Total: TQRDBText;
    qrTxtLin_Total: TQRDBText;
    qrTxtImp_NoRev: TQRDBText;
    qrTxtAcr_NoRev: TQRDBText;
    qrTxtLin_NoRev: TQRDBText;
    ChildBand1: TQRChildBand;
    QRChart1: TQRChart;
    QRDBChart1: TQRDBChart;
    Series1: TBarSeries;
    qDatosRegion: TStringField;
    qDatosAcred_No_Rev: TFloatField;
    qDatosLineas_No_Rev: TFloatField;
    qDatosImporte_No_Rev: TFloatField;
    qDatosAcreds_Normal: TFloatField;
    qDatosLineas_Normal: TFloatField;
    qDatosImporte_Normal: TFloatField;
    qDatosAcreds_Ave1: TFloatField;
    qDatosLineas_Ave1: TFloatField;
    qDatosImporte_Ave1: TFloatField;
    qDatosAcreds_Ave2: TFloatField;
    qDatosLineas_Ave2: TFloatField;
    qDatosImporte_Ave2: TFloatField;
    qDatosAcreds_Ave3: TFloatField;
    qDatosLineas_Ave3: TFloatField;
    qDatosImporte_Ave3: TFloatField;
    qDatosAcreds_Ave4: TFloatField;
    qDatosLineas_Ave4: TFloatField;
    qDatosImporte_Ave4: TFloatField;
    qDatosAcreds_Ave5: TFloatField;
    qDatosLineas_Ave5: TFloatField;
    qDatosImporte_Ave5: TFloatField;
    qDatosTotal_Cal_Acreds: TFloatField;
    qDatosTotal_Cal_Lineas: TFloatField;
    qDatosTotal_Cal_Importe: TFloatField;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Series5: TBarSeries;
    Series6: TBarSeries;
    QRChart2: TQRChart;
    QRDBChart2: TQRDBChart;
    SerieAcresNormal: TBarSeries;
    SerieAcresAve1: TBarSeries;
    SerieAcresAve2: TBarSeries;
    SerieAcresAve3: TBarSeries;
    SerieAcresAve4: TBarSeries;
    SerieAcresAve5: TBarSeries;
    QRChart3: TQRChart;
    QRDBChart3: TQRDBChart;
    SerieLineaNormal: TBarSeries;
    SerieLineaAve1: TBarSeries;
    SerieLineaAve2: TBarSeries;
    SerieLineaAve3: TBarSeries;
    SerieLineaAve4: TBarSeries;
    SerieLineaAve5: TBarSeries;
    Series7: TBarSeries;
    SerieAcresNoRev: TBarSeries;
    SerieLineasNoRev: TBarSeries;
    QRLCarta: TQRLabel;
    QRLIntereses: TQRLabel;
    procedure qDatosAfterScroll(DataSet: TDataSet);
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
  private
    NumPagina :Integer;
  public

  end;

var
  QrCrInfAves: TQrCrInfAves;

procedure RepSeguimientoAves (peFecha: TDateTime; peTipo_Entidad: string; peCartasCredito, peInteresesAnt: boolean; vlQry: TQuery; peFactor: double; Apli: TInterApli; Preview: boolean);

implementation

{$R *.DFM}


procedure RepSeguimientoAves  (peFecha: TDateTime; peTipo_Entidad: string; peCartasCredito, peInteresesAnt: boolean; vlQry: TQuery; peFactor: double; Apli: TInterApli; Preview: boolean);
var
  QRCrInfAves: TQrCrInfAves;
  QrPreview: TIntQRPreview;
begin
  QRCrInfAves :=  TQRCrInfAves.Create(Nil);
  QrPreview   := TIntQRPreview.CreatePreview(Application, QRCrInfAves);

  if      peFactor = 1000000 then QrCrInfAves.QRLeyendaMoneda.Caption := 'Información expresada en millones de pesos'
  else if peFactor = 1000     then QrCrInfAves.QRLeyendaMoneda.Caption := 'Información expresada en miles de pesos'
  else if peFactor = 1        then QrCrInfAves.QRLeyendaMoneda.Caption := 'Información expresada en pesos';

  if peCartasCredito then
    QRCrInfAves.QRLCarta.Caption := 'Incluye Cartas de Crédito'
  else
    QRCrInfAves.QRLCarta.Caption := 'No incluye Cartas de Crédito';

  if peInteresesAnt then
    QRCrInfAves.QRLIntereses.Caption := 'Incluye intereses cobrados por anticipado'
  else
    QRCrInfAves.QRLIntereses.Caption := 'No incluye intereses cobrados por anticipado';

  try
    QRCrInfAves.DataSet                 := vlQry;
    QRCrInfAves.qrTxtRegion.DataSet     := vlQry;
    QRCrInfAves.qrTxtImp_Normal.DataSet := vlQry;
    QRCrInfAves.qrTxtAcr_Normal.DataSet := vlQry;
    QRCrInfAves.qrTxtLin_Normal.DataSet := vlQry;
    QRCrInfAves.qrTxtImp_Ave1.DataSet   := vlQry;
    QRCrInfAves.qrTxtAcr_Ave1.DataSet   := vlQry;
    QRCrInfAves.qrTxtLin_Ave1.DataSet   := vlQry;
    QRCrInfAves.qrTxtImp_Ave2.DataSet   := vlQry;
    QRCrInfAves.qrTxtAcr_Ave2.DataSet   := vlQry;
    QRCrInfAves.qrTxtLin_Ave2.DataSet   := vlQry;
    QRCrInfAves.qrTxtImp_Ave3.DataSet   := vlQry;
    QRCrInfAves.qrTxtAcr_Ave3.DataSet   := vlQry;
    QRCrInfAves.qrTxtLin_Ave3.DataSet   := vlQry;
    QRCrInfAves.qrTxtImp_Ave4.DataSet   := vlQry;
    QRCrInfAves.qrTxtAcr_Ave4.DataSet   := vlQry;
    QRCrInfAves.qrTxtLin_Ave4.DataSet   := vlQry;
    QRCrInfAves.qrTxtImp_Ave5.DataSet   := vlQry;
    QRCrInfAves.qrTxtAcr_Ave5.DataSet   := vlQry;
    QRCrInfAves.qrTxtLin_Ave5.DataSet   := vlQry;
    QRCrInfAves.qrTxtImp_Total.DataSet  := vlQry;
    QRCrInfAves.qrTxtAcr_Total.DataSet  := vlQry;
    QRCrInfAves.qrTxtLin_Total.DataSet  := vlQry;
    QRCrInfAves.qrTxtImp_NoRev.DataSet  := vlQry;
    QRCrInfAves.qrTxtAcr_NoRev.DataSet  := vlQry;
    QRCrInfAves.qrTxtLin_NoRev.DataSet  := vlQry;



     //Asigna la información de la gráfica
    QRCrInfAves.Series1.DataSource := vlQry;
    QRCrInfAves.Series2.DataSource := vlQry;
    QRCrInfAves.Series3.DataSource := vlQry;
    QRCrInfAves.Series4.DataSource := vlQry;
    QRCrInfAves.Series5.DataSource := vlQry;
    QRCrInfAves.Series6.DataSource := vlQry;
    QRCrInfAves.Series7.DataSource := vlQry;

    QRCrInfAves.SerieAcresNormal.DataSource := vlQry;
    QRCrInfAves.SerieAcresAve1.DataSource   := vlQry;
    QRCrInfAves.SerieAcresAve2.DataSource   := vlQry;
    QRCrInfAves.SerieAcresAve3.DataSource   := vlQry;
    QRCrInfAves.SerieAcresAve4.DataSource   := vlQry;
    QRCrInfAves.SerieAcresAve5.DataSource   := vlQry;
    QRCrInfAves.SerieAcresNoRev.DataSource  := vlQry;

    QRCrInfAves.SerieLineaNormal.DataSource := vlQry;
    QRCrInfAves.SerieLineaAve1.DataSource   := vlQry;
    QRCrInfAves.SerieLineaAve2.DataSource   := vlQry;
    QRCrInfAves.SerieLineaAve3.DataSource   := vlQry;
    QRCrInfAves.SerieLineaAve4.DataSource   := vlQry;
    QRCrInfAves.SerieLineaAve5.DataSource   := vlQry;
    QRCrInfAves.SerieLineasNoRev.DataSource := vlQry;

    vlQry.AfterScroll := QRCrInfAves.QDatosAfterScroll;


    QRCrInfAves.QRInterEncabezado1.Apli       := Apli;
    QRCrInfAves.QRInterEncabezado1.IdEmpresa  := APli.IdEmpresa;
    QRCrInfAves.QRInterEncabezado1.NomReporte :='IntQrSecPubl';
    QRCrInfAves.QRInterEncabezado1.Titulo1    := 'Informe de Seguimiento (AVES)' + '  al ' + DateToStr(peFecha);
    QRCrInfAves.QLeyendaEntidades.Close;
    QRCrInfAves.QLeyendaEntidades.DatabaseName                            := Apli.DataBaseName;
    QRCrInfAves.QLeyendaEntidades.SessionName                             := Apli.SessionName;
    QRCrInfAves.QLeyendaEntidades.ParamByName ('peTipo_Entidad').AsString := peTipo_Entidad;
    QRCrInfAves.QLeyendaEntidades.Open;
    QRCrInfAves.QRInterEncabezado1.Titulo2    := QRCrInfAves.QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;

    if Preview then
      QRCrInfAves.Preview
    else
      QRCrInfAves.Print;

  finally
     vlQry.AfterScroll := Nil;
    QRCrInfAves.Free;


    if Assigned (QrPreview) then
      QrPreview.Free;
  end;
end;

procedure TQrCrInfAves.qDatosAfterScroll(DataSet: TDataSet);
begin
  if not DataSet.Active then Exit;

  if DataSet.FieldByName('Region').AsString = 'Total' then
    begin
      lbImporte.Color             := clBlack;
      lbImporte.Font.Color        := clWhite;
      lbAcreditados.Color         := clBlack;
      lbAcreditados.Font.Color    := clWhite;
      lbLineas.Color              := clBlack;
      lbLineas.Font.Color         := clWhite;

      qrTxtRegion.Color           := clBlack;
      qrTxtRegion.Font.Color      := clWhite;
      qrTxtImp_Normal.Color       := clBlack;
      qrTxtImp_Normal.Font.Color  := clWhite;
      qrTxtAcr_Normal.Color       := clBlack;
      qrTxtAcr_Normal.Font.Color  := clWhite;
      qrTxtLin_Normal.Color       := clBlack;
      qrTxtLin_Normal.Font.Color  := clWhite;
      qrTxtImp_Ave1.Color         := clBlack;
      qrTxtImp_Ave1.Font.Color    := clWhite;
      qrTxtAcr_Ave1.Color         := clBlack;
      qrTxtAcr_Ave1.Font.Color    := clWhite;
      qrTxtLin_Ave1.Color         := clBlack;
      qrTxtLin_Ave1.Font.Color    := clWhite;
      qrTxtImp_Ave2.Color         := clBlack;
      qrTxtImp_Ave2.Font.Color    := clWhite;
      qrTxtAcr_Ave2.Color         := clBlack;
      qrTxtAcr_Ave2.Font.Color    := clWhite;
      qrTxtLin_Ave2.Color         := clBlack;
      qrTxtLin_Ave2.Font.Color    := clWhite;
      qrTxtImp_Ave3.Color         := clBlack;
      qrTxtImp_Ave3.Font.Color    := clWhite;
      qrTxtAcr_Ave3.Color         := clBlack;
      qrTxtAcr_Ave3.Font.Color    := clWhite;
      qrTxtLin_Ave3.Color         := clBlack;
      qrTxtLin_Ave3.Font.Color    := clWhite;
      qrTxtImp_Ave4.Color         := clBlack;
      qrTxtImp_Ave4.Font.Color    := clWhite;
      qrTxtAcr_Ave4.Color         := clBlack;
      qrTxtAcr_Ave4.Font.Color    := clWhite;
      qrTxtLin_Ave4.Color         := clBlack;
      qrTxtLin_Ave4.Font.Color    := clWhite;
      qrTxtImp_Ave5.Color         := clBlack;
      qrTxtImp_Ave5.Font.Color    := clWhite;
      qrTxtAcr_Ave5.Color         := clBlack;
      qrTxtAcr_Ave5.Font.Color    := clWhite;
      qrTxtLin_Ave5.Color         := clBlack;
      qrTxtLin_Ave5.Font.Color    := clWhite;
      qrTxtImp_Total.Color        := clBlack;
      qrTxtImp_Total.Font.Color   := clWhite;
      qrTxtAcr_Total.Color        := clBlack;
      qrTxtAcr_Total.Font.Color   := clWhite;
      qrTxtLin_Total.Color        := clBlack;
      qrTxtLin_Total.Font.Color   := clWhite;
      qrTxtImp_NoRev.Color        := clBlack;
      qrTxtImp_NoRev.Font.Color   := clWhite;
      qrTxtAcr_NoRev.Color        := clBlack;
      qrTxtAcr_NoRev.Font.Color   := clWhite;
      qrTxtLin_NoRev.Color        := clBlack;
      qrTxtLin_NoRev.Font.Color   := clWhite;
   end;
end;

procedure TQrCrInfAves.QuickRepStartPage(Sender: TCustomQuickRep);
begin
  Inc (NumPagina);
  ColumnHeaderBand1.Enabled := (NumPagina = 1);
end;

end.
