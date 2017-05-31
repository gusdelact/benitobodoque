unit InCrQrMaxFnEd;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
  Forms, Quickrpt, QRCtrls, IntHead, IntQRPreview, QRExport, Db, DBTables, InterApl;

type
  TQrMaxFnEd = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QDatos: TQuery;
    QRBand1: TQRBand;
    QRBandDetail: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRBand3: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
  private
  public
  end;

var
  QrMaxFnEd: TQrMaxFnEd;

procedure RepLimiteMaximoFinanEdos (peFecha: TDateTime; peFactor: double; Apli: TInterApli; Preview: boolean);

implementation

{$R *.DFM}

procedure RepLimiteMaximoFinanEdos (peFecha: TDateTime; peFactor: double; Apli: TInterApli; Preview: boolean);
var
   QrMaxFnEd: TQrMaxFnEd;
   QrPreview: TIntQRPreview;
   Moneda: string;
begin
  QrMaxFnEd := TQrMaxFnEd.Create(Nil);
  QrPreview := TIntQRPreview.CreatePreview(Application, QrMaxFnEd);

  Moneda := 'Millones de pesos';
  if      peFactor =       1 then
    Moneda := 'Millones de pesos'
  else if peFactor =    1000 then
    Moneda := 'Miles de pesos'
  else if peFactor = 1000000 then
    Moneda := 'Pesos';

  try
    QrMaxFnEd.QDatos.Close;
    QrMaxFnEd.QDatos.DatabaseName                     := Apli.DataBaseName;
    QrMaxFnEd.QDatos.SessionName                      := Apli.SessionName;
    QrMaxFnEd.QDatos.ParamByName ('Fecha').AsDateTime := peFecha;
    QrMaxFnEd.QDatos.ParamByName ('Factor').AsFloat   := peFactor;
    QrMaxFnEd.QDatos.Open;

    QrMaxFnEd.QRInterEncabezado1.Apli       := Apli;
    QrMaxFnEd.QRInterEncabezado1.IdEmpresa  := APli.IdEmpresa;
    QrMaxFnEd.QRInterEncabezado1.NomReporte := 'InCrQrMaxFnEd';
    QrMaxFnEd.QRInterEncabezado1.Titulo1    := 'Límite Máximo de Financiamiento a Estados al ' + DateToStr(peFecha);
    QrMaxFnEd.QRInterEncabezado1.Titulo2    := 'Información expresada en ' + Moneda;

    if Preview then
      QrMaxFnEd.Preview
    else
      QrMaxFnEd.Print;

  finally
    QrMaxFnEd.Free;

    if Assigned (QrPreview) then
      QrPreview.Free;
  end;
end;


end.
