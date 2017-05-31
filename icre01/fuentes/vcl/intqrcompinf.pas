unit IntQrCompInf;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, Db, DBTables, InterApl,
  IntQRPreview, TeeProcs, TeEngine, Chart, DBChart, QrTee;

type
  TQrCompInf = class(TQuickRep)
    TitleBand1: TQRBand;
    QRGroup1: TQRGroup;
    DetailBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRDesg_Grupo: TQRDBText;
    QR4TYAnt: TQRLabel;
    QRDescipcion: TQRDBText;
    QRImp_4TYAnt: TQRDBText;
    QRPct_4TYAnt: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QR1TYAct: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QR4TYAct: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel131: TQRLabel;
    QRFecha: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRImp_1TYAct: TQRDBText;
    QRPct_1TYAct: TQRDBText;
    QRImp_Fecha: TQRDBText;
    QRImp_Dif1: TQRDBText;
    QRImp_4TYAct: TQRDBText;
    QRPct_4TYAct: TQRDBText;
    QRImp_Dif2: TQRDBText;
    QRPct_Dif2: TQRDBText;
    QRBand2: TQRBand;
    QRLeyendaMoneda: TQRLabel;
    QRLCarta: TQRLabel;
    QRLIntereses: TQRLabel;
  private
    procedure QAfterScroll(DataSet: TDataSet);
  public

  end;

var
  QrCompInf: TQrCompInf;

procedure RepComparativoInfra (peFecha: TDate; peFactor: double; peLeyenda_Entidad: string; peCartasCredito, peInteresesAnt: boolean; vlQry: TQuery; Apli: TInterApli; Preview: boolean);


implementation

{$R *.DFM}

procedure RepComparativoInfra (peFecha: TDate; peFactor: double; peLeyenda_Entidad: string; peCartasCredito, peInteresesAnt: boolean; vlQry: TQuery; Apli: TInterApli; Preview: boolean);
var
  QrCompInf: TQrCompInf;
  QrPreview: TIntQRPreview;
begin
  QrCompInf := TQrCompInf.Create (nil);
  QrPreview := TIntQRPreview.CreatePreview(Application, QrCompInf);

  try
    QrCompInf.QRInterEncabezado1.Apli       := Apli;
    QrCompInf.QRInterEncabezado1.IdEmpresa  := APli.IdEmpresa;
    QrCompInf.QRInterEncabezado1.NomReporte := 'IntQrCompInf';
    QrCompInf.QRInterEncabezado1.Titulo1    := 'Comparativo por Banca (Infraestructura y Construcción) Al ' + DateToStr(peFecha);
    QrCompInf.QRInterEncabezado1.Titulo2    := peLeyenda_Entidad;

    if      peFactor = 1000000 then QrCompInf.QRLeyendaMoneda.Caption := 'Información expresada en millones de pesos'
    else if peFactor = 1000    then QrCompInf.QRLeyendaMoneda.Caption := 'Información expresada en miles de pesos'
    else if peFactor = 1       then QrCompInf.QRLeyendaMoneda.Caption := 'Información expresada en pesos';

    if peCartasCredito then
      QrCompInf.QRLCarta.Caption := 'Incluye Cartas de Crédito'
    else
      QrCompInf.QRLCarta.Caption := 'No incluye Cartas de Crédito';

    if peInteresesAnt then
      QrCompInf.QRLIntereses.Caption := 'Incluye intereses cobrados por anticipado'
    else
      QrCompInf.QRLIntereses.Caption := 'No incluye intereses cobrados por anticipado';

    QrCompInf.QR4TYAnt.Caption := Format ('(1) 4T%d', [StrToInt (FormatDateTime ('yyyy', peFecha)) - 1]);
    QrCompInf.QR1TYAct.Caption := Format ('(2) 1T%d', [StrToInt (FormatDateTime ('yyyy', peFecha))]);
    QrCompInf.QRFecha.Caption  := Format ('%s $', [FormatDateTime ('dd/mm/yyyy', peFecha)]);
    QrCompInf.QR4TYAct.Caption := Format ('(4) 4T%d', [StrToInt (FormatDateTime ('yyyy', peFecha))]);

    QrCompInf.DataSet              := vlQry;
    QrCompInf.QRDesg_Grupo.DataSet := vlQry;
    QrCompInf.QRDescipcion.DataSet := vlQry;
    QrCompInf.QRImp_4TYAnt.DataSet := vlQry;
    QrCompInf.QRPct_4TYAnt.DataSet := vlQry;
    QrCompInf.QRImp_1TYAct.DataSet := vlQry;
    QrCompInf.QRPct_1TYAct.DataSet := vlQry;
    QrCompInf.QRImp_Fecha.DataSet  := vlQry;
    QrCompInf.QRImp_Dif1.DataSet   := vlQry;
    QrCompInf.QRImp_4TYAct.DataSet := vlQry;
    QrCompInf.QRPct_4TYAct.DataSet := vlQry;
    QrCompInf.QRImp_Dif2.DataSet   := vlQry;
    QrCompInf.QRPct_Dif2.DataSet   := vlQry;
    vlQry.AfterScroll              := QrCompInf.QAfterScroll;

    if Preview then
      QrCompInf.Preview
    else
      QrCompInf.Print;

  finally
    vlQry.AfterScroll := nil;
    QrCompInf.Free;

    if Assigned (QrPreview) then
      QrPreview.Free;
  end;
end;

procedure TQrCompInf.QAfterScroll(DataSet: TDataSet);
begin
  if not DataSet.Active then exit;

  QRLCarta.Enabled     := QRLCarta.Tag     = 0;
  QRLIntereses.Enabled := QRLIntereses.Tag = 0;
  QRLCarta.Tag         := QRLCarta.Tag     + 1;
  QRLIntereses.Tag     := QRLIntereses.Tag + 1;

  {Si es un total, pinta la línea de arriba}
  QRImp_4TYAnt.Frame.DrawTop := DataSet.FieldByName ('G1').AsFloat = 1;
  QRPct_4TYAnt.Frame.DrawTop := DataSet.FieldByName ('G1').AsFloat = 1;
  QRImp_1TYAct.Frame.DrawTop := DataSet.FieldByName ('G1').AsFloat = 1;
  QRPct_1TYAct.Frame.DrawTop := DataSet.FieldByName ('G1').AsFloat = 1;
  QRImp_Fecha.Frame.DrawTop  := DataSet.FieldByName ('G1').AsFloat = 1;
  QRImp_Dif1.Frame.DrawTop   := DataSet.FieldByName ('G1').AsFloat = 1;
  QRImp_4TYAct.Frame.DrawTop := DataSet.FieldByName ('G1').AsFloat = 1;
  QRPct_4TYAct.Frame.DrawTop := DataSet.FieldByName ('G1').AsFloat = 1;
  QRImp_Dif2.Frame.DrawTop   := DataSet.FieldByName ('G1').AsFloat = 1;
  QRPct_Dif2.Frame.DrawTop   := DataSet.FieldByName ('G1').AsFloat = 1;

  {Si no es total quita las negritas, en caso de que sí, las pone}
  if DataSet.FieldByName ('G1').AsFloat = 0 then
  begin
    QRDescipcion.Font.Style := QRDescipcion.Font.Style - [fsBold];
    QRImp_4TYAnt.Font.Style := QRImp_4TYAnt.Font.Style - [fsBold];
    QRPct_4TYAnt.Font.Style := QRPct_4TYAnt.Font.Style - [fsBold];
    QRImp_1TYAct.Font.Style := QRImp_1TYAct.Font.Style - [fsBold];
    QRPct_1TYAct.Font.Style := QRPct_1TYAct.Font.Style - [fsBold];
    QRImp_Fecha.Font.Style  := QRImp_Fecha.Font.Style  - [fsBold];
    QRImp_Dif1.Font.Style   := QRImp_Dif1.Font.Style   - [fsBold];
    QRImp_4TYAct.Font.Style := QRImp_4TYAct.Font.Style - [fsBold];
    QRPct_4TYAct.Font.Style := QRPct_4TYAct.Font.Style - [fsBold];
    QRImp_Dif2.Font.Style   := QRImp_Dif2.Font.Style   - [fsBold];
    QRPct_Dif2.Font.Style   := QRPct_Dif2.Font.Style   - [fsBold];
  end
  else
  begin
    QRDescipcion.Font.Style := QRDescipcion.Font.Style + [fsBold];
    QRImp_4TYAnt.Font.Style := QRImp_4TYAnt.Font.Style + [fsBold];
    QRPct_4TYAnt.Font.Style := QRPct_4TYAnt.Font.Style + [fsBold];
    QRImp_1TYAct.Font.Style := QRImp_1TYAct.Font.Style + [fsBold];
    QRPct_1TYAct.Font.Style := QRPct_1TYAct.Font.Style + [fsBold];
    QRImp_Fecha.Font.Style  := QRImp_Fecha.Font.Style  + [fsBold];
    QRImp_Dif1.Font.Style   := QRImp_Dif1.Font.Style   + [fsBold];
    QRImp_4TYAct.Font.Style := QRImp_4TYAct.Font.Style + [fsBold];
    QRPct_4TYAct.Font.Style := QRPct_4TYAct.Font.Style + [fsBold];
    QRImp_Dif2.Font.Style   := QRImp_Dif2.Font.Style   + [fsBold];
    QRPct_Dif2.Font.Style   := QRPct_Dif2.Font.Style   + [fsBold];
  end;
end;


end.
