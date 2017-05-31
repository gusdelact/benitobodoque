unit IntCrQrCrtScPu;

interface                                   

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
  Forms, Quickrpt, QRCtrls, IntHead, IntQRPreview, QRExport, Db, DBTables, InterApl;

type
  TQIntCrQrCrtScPu = class(TQuickRep)
    QDatos: TQuery;
    PageHeaderBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRDetail1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRGroupFooter1: TQRBand;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand1: TQRBand;
    QRExpr4: TQRExpr;
    QRInterEncabezado1: TQRInterEncabezado;
    QRLabel15: TQRLabel;
    QRLeyendaMoneda: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel16: TQRLabel;
    QRLCartas: TQRLabel;
    QRLIntereses: TQRLabel;
  private
  public
  end;

var
  QIntCrQrCrtScPu: TQIntCrQrCrtScPu;

procedure RepCartSectorPublico (peFecha: TDateTime; SectorPublico: boolean; peFactor: double; peCartas, peInteresesAnt: boolean; vlQry: TQuery; Apli: TInterApli; Preview: boolean);

implementation

procedure RepCartSectorPublico (peFecha: TDateTime; SectorPublico: boolean; peFactor: double; peCartas, peInteresesAnt: boolean; vlQry: TQuery; Apli: TInterApli; Preview: boolean);
var
  QIntCrQrCrtScPu: TQIntCrQrCrtScPu;
  QrPreview: TIntQRPreview;
begin
  QIntCrQrCrtScPu := TQIntCrQrCrtScPu.Create(Nil);
  QrPreview := TIntQRPreview.CreatePreview(Application, QIntCrQrCrtScPu);

  try
    if SectorPublico then
      QIntCrQrCrtScPu.QRInterEncabezado1.Titulo1 := 'Cartera por Sector Económico (Sector Público)'
    else
      QIntCrQrCrtScPu.QRInterEncabezado1.Titulo1 := 'Cartera por Sector Económico (Sector Privado)';

    QIntCrQrCrtScPu.QRInterEncabezado1.Apli       := Apli;
    QIntCrQrCrtScPu.QRInterEncabezado1.IdEmpresa  := APli.IdEmpresa;
    QIntCrQrCrtScPu.QRInterEncabezado1.NomReporte := 'IntCrQrCrtScPu';
    QIntCrQrCrtScPu.QRInterEncabezado1.Titulo2    := ' Al ' + DateToStr(peFecha);

    if      peFactor = 1000000 then QIntCrQrCrtScPu.QRLeyendaMoneda.Caption := 'Información expresada en millones de pesos'
    else if peFactor = 1000    then QIntCrQrCrtScPu.QRLeyendaMoneda.Caption := 'Información expresada en miles de pesos'
    else if peFactor = 1       then QIntCrQrCrtScPu.QRLeyendaMoneda.Caption := 'Información expresada en pesos';

    if peCartas then
      QIntCrQrCrtScPu.QRLCartas.Caption := 'Incluye Cartas de Crédito'
    else
      QIntCrQrCrtScPu.QRLCartas.Caption := 'No incluye Cartas de Crédito';

    if peInteresesAnt then
      QIntCrQrCrtScPu.QRLIntereses.Caption := 'Incluye intereses cobrados por anticipado'
    else
      QIntCrQrCrtScPu.QRLIntereses.Caption := 'No incluye intereses cobrados por anticipado';

    QIntCrQrCrtScPu.DataSet            := vlQry;
    QIntCrQrCrtScPu.QRDBText1.DataSet  := vlQry;
    QIntCrQrCrtScPu.QRDBText2.DataSet  := vlQry;
    QIntCrQrCrtScPu.QRDBText8.DataSet  := vlQry;
    QIntCrQrCrtScPu.QRDBText9.DataSet  := vlQry;
    QIntCrQrCrtScPu.QRDBText10.DataSet := vlQry;
    QIntCrQrCrtScPu.QRDBText11.DataSet := vlQry;
    QIntCrQrCrtScPu.QRDBText12.DataSet := vlQry;
    vlQry.Filtered := False;
    vlQry.Filter   := 'G1 = 0';
    vlQry.Filtered := True;

    if Preview then
      QIntCrQrCrtScPu.Preview
    else
      QIntCrQrCrtScPu.Print;

  finally
    vlQry.Filtered := False;
    QIntCrQrCrtScPu.Free;

    if Assigned (QrPreview) then
      QrPreview.Free;
  end;
end;


{$R *.DFM}

end.
