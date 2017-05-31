unit IntCrQrCartDiv;

interface


uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
  Forms, Quickrpt, QRCtrls, IntHead, IntQRPreview, QRExport, Db, DBTables, InterApl,
  TeEngine, Series, TeeProcs, Chart, DBChart, QrTee;

type
  TQRCrCartDiv = class(TQuickRep)
    QDatos: TQuery;
    TitleBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRExpr3: TQRExpr;
    QRLabel12: TQRLabel;
    QRChildBand1: TQRChildBand;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRChildBand2: TQRChildBand;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QDatos2: TQuery;
    QLeyendaEntidades: TQuery;
    QRDBChart1: TQRDBChart;
    QRChart1: TQRChart;
    QDatosPct_Saldo_pesos: TFloatField;
    QDatosPct_Saldo_Dls: TFloatField;
    Series1: TBarSeries;
    QDatosMaximo: TFloatField;
    QDatosIdPlazo: TStringField;
    QDatosTotal: TFloatField;
    QDatosCumplimiento: TStringField;
    Series2: TBarSeries;
    Series3: TBarSeries;
    QDatos2Saldo: TStringField;
    QDatos2Pct_Saldo_Imp_Nal: TFloatField;
    QDatos2Pct_Saldo_Imp_Dls: TFloatField;
    QDatos2Pct_Total: TFloatField;
    QRLCarta: TQRLabel;
    QRLIntereses: TQRLabel;
  private
  public


  end;

var
  QRCrCartDiv: TQRCrCartDiv;

procedure RepCarteraPorDivisa (peFecha: TDateTime; peTipo_Entidad: string; peCartasCredito, peInteresesAnt: boolean; vlQry1 : TQuery; vlQry2 : TQuery; peFactor: double; Apli: TInterApli; Preview: boolean);

implementation

{$R *.DFM}

procedure RepCarteraPorDivisa (peFecha: TDateTime; peTipo_Entidad: string; peCartasCredito, peInteresesAnt: boolean; vlQry1 : TQuery;  vlQry2 : TQuery; peFactor: double; Apli: TInterApli; Preview: boolean);
var
  QRCrCartDiv: TQRCrCartDiv;
  QrPreview: TIntQRPreview;
begin
  QRCrCartDiv   :=  TQRCrCartDiv.Create(Nil);
  QrPreview   := TIntQRPreview.CreatePreview(Application, QRCrCartDiv);

  try
    vlQry1.Filter := 'B_Total <> 1';
    vlQry1.Filtered := True;

    if peCartasCredito then
      QRCrCartDiv.QRLCarta.Caption := 'Incluye Cartas de Crédito'
    else
      QRCrCartDiv.QRLCarta.Caption := 'No incluye Cartas de Crédito';

    if peInteresesAnt then
      QRCrCartDiv.QRLIntereses.Caption := 'Incluye intereses cobrados por anticipado'
    else
      QRCrCartDiv.QRLIntereses.Caption := 'No incluye intereses cobrados por anticipado';

    QRCrCartDiv.DataSet           := vlQry1;
    QRCrCartDiv.QRDBText1.DataSet := vlQry1;
    QRCrCartDiv.QRDBText2.DataSet := vlQry1;
    QRCrCartDiv.QRDBText3.DataSet := vlQry1;
    QRCrCartDiv.QRDBText4.DataSet := vlQry1;
    QRCrCartDiv.QRDBText5.DataSet := vlQry1;
    QRCrCartDiv.QRDBText6.DataSet := vlQry1;

    QRCrCartDiv.QRDBText7.DataSet  := vlQry2;
    QRCrCartDiv.QRDBText8.DataSet  := vlQry2;
    QRCrCartDiv.QRDBText9.DataSet  := vlQry2;
    QRCrCartDiv.QRDBText10.DataSet := vlQry2;

    //Asigna la información de la gráfica
    QRCrCartDiv.Series1.DataSource := vlQry1;
    QRCrCartDiv.Series2.DataSource := vlQry1;
    QRCrCartDiv.Series3.DataSource := vlQry1;

    QRCrCartDiv.QLeyendaEntidades.Close;
    QRCrCartDiv.QLeyendaEntidades.DatabaseName                            := Apli.DataBaseName;
    QRCrCartDiv.QLeyendaEntidades.SessionName                             := Apli.SessionName;
    QRCrCartDiv.QLeyendaEntidades.ParamByName ('peTipo_Entidad').AsString := peTipo_Entidad;
    QRCrCartDiv.QLeyendaEntidades.Open;
    QRCrCartDiv.QRInterEncabezado1.Titulo1                                := 'Cartera por Divisas Al ' + DateToStr(peFecha);
    QRCrCartDiv.QRInterEncabezado1.Titulo2                                := QRCrCartDiv.QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;

    QRCrCartDiv.QRInterEncabezado1.Apli       := Apli;
    QRCrCartDiv.QRInterEncabezado1.IdEmpresa  := APli.IdEmpresa;
    QRCrCartDiv.QRInterEncabezado1.NomReporte :='IntCrQrCartDiv';

    if Preview then
      QRCrCartdiv.Preview
    else
      QRCrCartDiv.Print;
  finally
    vlQry1.Filtered := False;
    QRCrCartDiv.Free;

    if Assigned (QrPreview) then
      QrPreview.Free;
  end;
end;

end.
