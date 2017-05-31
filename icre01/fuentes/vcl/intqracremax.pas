unit IntQrAcreMax;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead,
  InterApl, IntQRPreview, IntGenCre,UnSQL2, QRExport, Db, DBTables;

type
  TQrAcreMax = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    qrTxtGrupo: TQRDBText;
    qrTxtDesc_Grupo: TQRDBText;
    qrTxtImporte: TQRDBText;
    qrTxtCumple: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    TitleBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRGroupLinea: TQRGroup;
    qrFooterLinea: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QAcreditados: TQuery;
    QAcreditadosDesc_Grupo: TStringField;
    QAcreditadosDesc_Concepto: TStringField;
    QAcreditadosImporte: TFloatField;
    QAcreditadosCumplimiento: TStringField;
    QAcreditadosGrupo: TFloatField;
    SummaryBand1: TQRBand;
    QRLeyendaMoneda: TQRLabel;
    QLeyendaEntidades: TQuery;
    QRLCartas: TQRLabel;
    QRLIntereses: TQRLabel;
  private

  public
    procedure genRPTAcreditadoMaximo(dFecha: TDateTime;
                                     peFactor: double;
                                     peTipo_Entidad: string;
                                     peCartas,
                                     peInteresesAnt: boolean;
                                     vlQry: TQuery;
                                     pAPli : TInterApli;
                                     pPreview  : Boolean);
  end;

var
  QrAcreMax: TQrAcreMax;

implementation

{$R *.DFM}

{ TQrAcreMax }

procedure TQrAcreMax.genRPTAcreditadoMaximo(dFecha: TDateTime;
                                            peFactor: double;
                                            peTipo_Entidad: string;
                                            peCartas,
                                            peInteresesAnt: boolean;
                                            vlQry: TQuery;
                                            pAPli : TInterApli;
                                            pPreview  : Boolean);
var
   QrAcreMax   : TQrAcreMax;
   Preview     : TIntQRPreview;
begin
   QrAcreMax := TQrAcreMax.Create(Nil);
   Preview   := TIntQRPreview.CreatePreview(Application, QrAcreMax);
   try

      QrAcreMax.QRInterEncabezado1.Apli:=pApli;
      QrAcreMax.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrAcreMax.QRInterEncabezado1.NomReporte:='IntQrAcreMax';
      QrAcreMax.QRInterEncabezado1.Titulo1:='Cartera de Acreditados Mayores al ' + DateToStr(dFecha);

      if      peFactor = 1000000 then QrAcreMax.QRLeyendaMoneda.Caption := 'Información expresada en millones de pesos'
      else if peFactor = 1000    then QrAcreMax.QRLeyendaMoneda.Caption := 'Información expresada en miles de pesos'
      else if peFactor = 1       then QrAcreMax.QRLeyendaMoneda.Caption := 'Información expresada en pesos';

      if peCartas then
        QrAcreMax.QRLCartas.Caption := 'Incluye Cartas de Crédito'
      else
        QrAcreMax.QRLCartas.Caption := 'No incluye Cartas de Crédito';

      if peInteresesAnt then
        QrAcreMax.QRLIntereses.Caption := 'Incluye intereses cobrados por anticipado'
      else
        QrAcreMax.QRLIntereses.Caption := 'No incluye intereses cobrados por anticipado';

      try
        QrAcreMax.QLeyendaEntidades.Close;
        QrAcreMax.QLeyendaEntidades.DatabaseName                            := pApli.DataBaseName;
        QrAcreMax.QLeyendaEntidades.SessionName                             := pApli.SessionName;
        QrAcreMax.QLeyendaEntidades.ParamByName ('peTipo_Entidad').AsString := peTipo_Entidad;
        QrAcreMax.QLeyendaEntidades.Open;
        QrAcreMax.QRInterEncabezado1.Titulo2                                := QrAcreMax.QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;

        QrAcreMax.DataSet                 := vlQry;
        QrAcreMax.qrTxtGrupo.DataSet      := vlQry;
        QrAcreMax.qrTxtDesc_Grupo.DataSet := vlQry;
        QrAcreMax.qrTxtImporte.DataSet    := vlQry;
        QrAcreMax.qrTxtCumple.DataSet     := vlQry;
      except
        on E : Exception do
           raise Exception.Create('No es posible mostrar el Reporte' + chr(13) + chr(10) + e.Message);
      end;

      if pPreview then
         QrAcreMax.Preview
      else
         QrAcreMax.Print;
   finally
      QrAcreMax.free;
      if Assigned(Preview) then Preview.Free;
   end;
end;

end.
