unit IntQrPlazoVencDesg;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
  Forms, Quickrpt, QRCtrls, IntHead, IntQRPreview, QRExport, Db, DBTables, InterApl;
  

type
  TQrPlazoVencDesg = class(TQuickRep)
    TitleBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QFechas: TQuery;
    QDesglosado: TQuery;
    QDesglosadoDesc_Mercado: TStringField;
    QDesglosadoDesc_Rango: TStringField;
    QDesglosadoImp_Trim_Ant: TFloatField;
    QDesglosadoPct_Trim_Ant: TFloatField;
    QDesglosadoImp_Mes_Act: TFloatField;
    QDesglosadoPct_Mes_Act: TFloatField;
    QDesglosadoImp_Diferencia: TFloatField;
    QDesglosadoPct_Diferencia: TFloatField;
    QDesglosadoImp_Trim_Ant_Anio_Sig: TFloatField;
    QDesglosadoPct_Trim_Ant_Anio_Sig: TFloatField;
    QDesglosadoG1: TFloatField;
    QRGroup1: TQRGroup;
    QRDetail1: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText1: TQRDBText;
    QRGroupFooter1: TQRBand;
    QRExpr1: TQRExpr;
    QRBand1: TQRBand;
    QRExpr4: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLTrim_Ant: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLTrim_Ant_Anio_Sig: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr5: TQRExpr;
    QRLabel18: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel19: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel20: TQRLabel;
    QRExpr8: TQRExpr;
    QRLabel21: TQRLabel;
    QRLeyendaMoneda: TQRLabel;
  private

  public
    procedure genRPTPlzVenc(peFecha: TDateTime; peLeyenda_Entidad: string; peFactor: double; vlQry: TQuery; pAPli : TInterApli; pPreview  : Boolean);
  end;

var
  QrPlazoVencDesg: TQrPlazoVencDesg;

implementation

{$R *.DFM}

procedure TQrPlazoVencDesg.genRPTPlzVenc(peFecha: TDateTime; peLeyenda_Entidad: string; peFactor: double; vlQry: TQuery; pAPli : TInterApli; pPreview  : Boolean);
var
   QrPlzVenc   : TQrPlazoVencDesg;
   Preview     : TIntQRPreview;
begin
   QrPlzVenc := TQrPlazoVencDesg.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrPlzVenc);
   try

      QrPlzVenc.QRInterEncabezado1.Apli       := pApli;
      QrPlzVenc.QRInterEncabezado1.IdEmpresa  := pAPli.IdEmpresa;
      QrPlzVenc.QRInterEncabezado1.NomReporte := 'IntQrPlazoVencDesg';
      QrPlzVenc.QRInterEncabezado1.Titulo1    := 'Cartera por Plazo de Vencimiento Al ' + DateToStr(Now);
      QrPlzVenc.QRInterEncabezado1.Titulo2    := peLeyenda_Entidad;

      try
        //Abre la consulta que determina, a partir de la fecha de parámetro, el último día del trimestre anterior,
        //así como el último día del trimestre anterior para el siguiente año.
        QrPlzVenc.QFechas.Close;
        QrPlzVenc.QFechas.DatabaseName                   := pApli.DataBaseName;
        QrPlzVenc.QFechas.SessionName                    := pApli.SessionName;
        QrPlzVenc.QFechas.ParamByName ('peFecha').AsDate := peFecha;
        QrPlzVenc.QFechas.Open;

        QrPlzVenc.QRLTrim_Ant.Caption          := QrPlzVenc.QFechas.FieldByName ('Trim_Ant').AsString;
        QrPlzVenc.QRLTrim_Ant_Anio_Sig.Caption := QrPlzVenc.QFechas.FieldByName ('Trim_AntSA').AsString;

{        QrPlzVenc.QDesglosado.Close;
        QrPlzVenc.QDesglosado.DatabaseName                            := pApli.DataBaseName;
        QrPlzVenc.QDesglosado.SessionName                             := pApli.SessionName;
        QrPlzVenc.QDesglosado.ParamByName ('peFecha').AsDate          := peFecha;
        QrPlzVenc.QDesglosado.ParamByName ('peFechaTA').AsDate        := QrPlzVenc.QFechas.FieldByName ('Fin_Trim_Ant').AsDateTime;
        QrPlzVenc.QDesglosado.ParamByName ('peFechaTASA').AsDate      := QrPlzVenc.QFechas.FieldByName ('Fin_Trim_Ant_SA').AsDateTime;
        QrPlzVenc.QDesglosado.ParamByName ('peTipo_Entidad').AsString := peTipo_Entidad;
        QrPlzVenc.QDesglosado.ParamByName ('peFactor').AsFloat        := peFactor;
        QrPlzVenc.QDesglosado.Open;}

        vlQry.Filtered := False;
        vlQry.Filter   := 'G1 = 0';
        vlQry.Filtered := True;

        QrPlzVenc.DataSet            := vlQry;
        QrPlzVenc.QRDBText1.DataSet  := vlQry;
        QrPlzVenc.QRDBText2.DataSet  := vlQry;
        QrPlzVenc.QRDBText3.DataSet  := vlQry;
        QrPlzVenc.QRDBText4.DataSet  := vlQry;
        QrPlzVenc.QRDBText5.DataSet  := vlQry;
        QrPlzVenc.QRDBText6.DataSet  := vlQry;
        QrPlzVenc.QRDBText7.DataSet  := vlQry;
        QrPlzVenc.QRDBText8.DataSet  := vlQry;
        QrPlzVenc.QRDBText10.DataSet := vlQry;
        QrPlzVenc.QRDBText11.DataSet := vlQry;

        if      peFactor = 1000000 then QrPlzVenc.QRLeyendaMoneda.Caption := 'Información expresada en millones de pesos'
        else if peFactor = 1000    then QrPlzVenc.QRLeyendaMoneda.Caption := 'Información expresada en miles de pesos'
        else if peFactor = 1       then QrPlzVenc.QRLeyendaMoneda.Caption := 'Información expresada en pesos';
      except
        on E : Exception do
           raise Exception.Create('No es posible mostrar el Reporte' + chr(13) + chr(10) + e.Message);
      end;

      if pPreview then
         QrPlzVenc.Preview
      else
         QrPlzVenc.Print;

   finally
      vlQry.Filtered := False;
      QrPlzVenc.free;
      if Assigned(Preview) then Preview.Free;
   end;
end;

end.
