unit IntQrCompBan;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, Db, DBTables, InterApl,
  IntQRPreview;

type
  TQrCompBan = class(TQuickRep)
    TitleBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLeyendaMoneda: TQRLabel;
    QRLabel1: TQRLabel;
    QRBanca: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSubdivision: TQRDBText;
    QRLabel5: TQRLabel;
    QRSaldo: TQRLabel;
    QRLabel6: TQRLabel;
    QRPresupuesto: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRImp_Real: TQRDBText;
    QRImp_Presup: TQRDBText;
    QRCrecimiento: TQRDBText;
    qrlCarta: TQRLabel;
    qrlIntereses: TQRLabel;
  private
    procedure QAfterScroll(DataSet: TDataSet);
  public

  end;

var
  QrCompBan: TQrCompBan;

procedure RepComparativoBanca (peFecha: TDate; peFactor: double; peLeyenda_Entidad: string; peCartasCredito, peInteresesAnt: boolean; vlQry: TQuery; Apli: TInterApli; Preview: boolean);

implementation

{$R *.DFM}

procedure RepComparativoBanca (peFecha: TDate; peFactor: double; peLeyenda_Entidad: string; peCartasCredito, peInteresesAnt: boolean; vlQry: TQuery; Apli: TInterApli; Preview: boolean);
var
  QrCompBan: TQrCompBan;
  QrPreview: TIntQRPreview;
begin
  QrCompBan := TQrCompBan.Create (nil);
  QrPreview := TIntQRPreview.CreatePreview(Application, QrCompBan);

  try
    QrCompBan.QRInterEncabezado1.Apli       := Apli;
    QrCompBan.QRInterEncabezado1.IdEmpresa  := APli.IdEmpresa;
    QrCompBan.QRInterEncabezado1.NomReporte := 'IntQrCompBan';
    QrCompBan.QRInterEncabezado1.Titulo1    := 'Comparativo por Banca Al ' + DateToStr(peFecha);
    QrCompBan.QRInterEncabezado1.Titulo2    := peLeyenda_Entidad;

    if      peFactor = 1000000 then QrCompBan.QRLeyendaMoneda.Caption := 'Información expresada en millones de pesos'
    else if peFactor = 1000    then QrCompBan.QRLeyendaMoneda.Caption := 'Información expresada en miles de pesos'
    else if peFactor = 1       then QrCompBan.QRLeyendaMoneda.Caption := 'Información expresada en pesos';

    if peCartasCredito then
        QrCompBan.QRLCarta.Caption := 'Incluye Cartas de Crédito'
      else
        QrCompBan.QRLCarta.Caption := 'No incluye Cartas de Crédito';

      if peInteresesAnt then
        QrCompBan.QRLIntereses.Caption := 'Incluye intereses cobrados por anticipado'
      else
        QrCompBan.QRLIntereses.Caption := 'No incluye intereses cobrados por anticipado';

    QrCompBan.DataSet               := vlQry;
    QrCompBan.QRBanca.DataSet       := vlQry;
    QrCompBan.QRSubdivision.DataSet := vlQry;
    QrCompBan.QRImp_Real.DataSet    := vlQry;
    QrCompBan.QRImp_Presup.DataSet  := vlQry;
    QrCompBan.QRCrecimiento.DataSet := vlQry;
    QrCompBan.QRSaldo.Caption       := FormatDateTime ('mmm/yy', peFecha);
    QrCompBan.QRPresupuesto.Caption := FormatDateTime ('mmm/yy', peFecha);
    vlQry.AfterScroll               := QrCompBan.QAfterScroll;

    if Preview then
      QrCompBan.Preview
    else
      QrCompBan.Print;

  finally
    vlQry.AfterScroll := nil;
    QrCompBan.Free;

    if Assigned (QrPreview) then
      QrPreview.Free;
  end;
end;

procedure TQrCompBan.QAfterScroll(DataSet: TDataSet);
begin
  if not DataSet.Active then exit;

  DetailBand1.Frame.DrawTop      := DataSet.Bof;
  DetailBand1.Frame.DrawBottom   := (DataSet.FieldByName ('Banca').AsString = 'GOB') And
                                    (DataSet.FieldByName ('G1').AsFloat     = 1);
  QRBanca.Frame.DrawRight        := DataSet.FieldByName ('Banca').AsString <> 'GOB';
  QRBanca.Frame.DrawBottom       := DataSet.FieldByName ('Banca').AsString <> 'GOB';
  QRImp_Real.Frame.DrawBottom    := DataSet.FieldByName ('Banca').AsString <> 'GOB';
  QRImp_Presup.Frame.DrawBottom  := DataSet.FieldByName ('Banca').AsString <> 'GOB';
  QRCrecimiento.Frame.DrawBottom := DataSet.FieldByName ('Banca').AsString <> 'GOB';

  if DataSet.FieldByName ('G1').AsFloat = 1 then
  begin
    QRBanca.Font.Style       := QRBanca.Font.Style + [fsBold];
    QRImp_Real.Font.Style    := QRImp_Real.Font.Style + [fsBold];
    QRImp_Presup.Font.Style  := QRImp_Presup.Font.Style + [fsBold];
    QRCrecimiento.Font.Style := QRCrecimiento.Font.Style + [fsBold];
  end
  else
  begin
    QRBanca.Font.Style       := QRBanca.Font.Style - [fsBold];
    QRImp_Real.Font.Style    := QRImp_Real.Font.Style - [fsBold];
    QRImp_Presup.Font.Style  := QRImp_Presup.Font.Style - [fsBold];
    QRCrecimiento.Font.Style := QRCrecimiento.Font.Style - [fsBold];
  end;
end;

end.
