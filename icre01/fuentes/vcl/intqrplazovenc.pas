unit IntQrPlazoVenc;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead,
  InterApl, IntQRPreview, IntGenCre,UnSQL2, QRExport, Db, DBTables,
  TeeProcs, TeEngine, Chart, DBChart, QRTee, Series;

type
  TQrPlzVenc = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    qrTxtDesc_Grupo: TQRDBText;
    TitleBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRShape2: TQRShape;
    SummaryBand2: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QResumen: TQuery;
    QResumenDesc_Mercado: TStringField;
    QResumenImpagado: TFloatField;
    QResumenHasta_12_Meses: TFloatField;
    QResumenDe_13_A_36_Meses: TFloatField;
    QResumenDe_37_A_60_Meses: TFloatField;
    QResumenMas_De_60_Meses: TFloatField;
    QResumenG1: TFloatField;
    QRLeyendaMoneda: TQRLabel;
    QRLIntereses: TQRLabel;
  private

  public
    procedure genRPTPlzVenc(peFecha: TDateTime; peLeyenda_Entidad: string; peFactor: double; peInteresesAnt: boolean; vlQry: TQuery; pAPli : TInterApli; pPreview  : Boolean);
  end;

var
  QrPlzVenc: TQrPlzVenc;

implementation

{$R *.DFM}

{ TQrAcreMax }

procedure TQrPlzVenc.genRPTPlzVenc(peFecha: TDateTime; peLeyenda_Entidad: string; peFactor: double; peInteresesAnt: boolean; vlQry: TQuery; pAPli : TInterApli; pPreview  : Boolean);
var
   QrPlzVenc   : TQrPlzVenc;
   Preview     : TIntQRPreview;
begin
   QrPlzVenc := TQrPlzVenc.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrPlzVenc);
   try

      QrPlzVenc.QRInterEncabezado1.Apli       := pApli;
      QrPlzVenc.QRInterEncabezado1.IdEmpresa  := pAPli.IdEmpresa;
      QrPlzVenc.QRInterEncabezado1.NomReporte := 'IntQrPlazoVenc';
      QrPlzVenc.QRInterEncabezado1.Titulo1    := 'Cartera por Plazo de Vencimiento Al ' + DateToStr(Now);
      QrPlzVenc.QRInterEncabezado1.Titulo2    := peLeyenda_Entidad;

      try
        QrPlzVenc.DataSet                 := vlQry;
        QrPlzVenc.qrTxtDesc_Grupo.DataSet := vlQry;
        QrPlzVenc.QRDBText2.DataSet       := vlQry;
        QrPlzVenc.QRDBText3.DataSet       := vlQry;
        QrPlzVenc.QRDBText4.DataSet       := vlQry;
        QrPlzVenc.QRDBText5.DataSet       := vlQry;
        QrPlzVenc.QRDBText6.DataSet       := vlQry;

        if      peFactor = 1000000 then QrPlzVenc.QRLeyendaMoneda.Caption := 'Información expresada en millones de pesos'
        else if peFactor = 1000    then QrPlzVenc.QRLeyendaMoneda.Caption := 'Información expresada en miles de pesos'
        else if peFactor = 1       then QrPlzVenc.QRLeyendaMoneda.Caption := 'Información expresada en pesos';

        if peInteresesAnt then
          QrPlzVenc.QRLIntereses.Caption := 'Incluye intereses cobrados por anticipado'
        else
          QrPlzVenc.QRLIntereses.Caption := 'No incluye intereses cobrados por anticipado';
      except
        on E : Exception do
           raise Exception.Create('No es posible mostrar el Reporte' + chr(13) + chr(10) + e.Message);
      end;


      if pPreview then
         QrPlzVenc.Preview
      else
         QrPlzVenc.Print;

   finally
      QrPlzVenc.free;
      if Assigned(Preview) then Preview.Free;
   end;
end;

end.
