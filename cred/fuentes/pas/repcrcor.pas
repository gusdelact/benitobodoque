unit RepCrCoR;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, Db, DBTables,
  Wwquery, IntFrm, UnCrPack;

type
  TReporteCrCoR = class(TQuickRep)
    qLinea: TwwQuery;
    QRBand1: TQRBand;
    ChildBand1: TQRChildBand;
    lbAutorizacion: TQRLabel;
    lbNombre: TQRLabel;
    lbProducto: TQRLabel;
    lbImpAutorizado: TQRLabel;
    lbImpDispuesto: TQRLabel;
    lbImpDisponer: TQRLabel;
    QRShape4: TQRShape;
    lbTipoAut: TQRLabel;
    lbRevolvente: TQRLabel;
    lbFComite: TQRLabel;
    lbPlazo: TQRLabel;
    lbFVencimiento: TQRLabel;
    lbObservaciones: TQRLabel;
    QRInterEncabezado1: TQRInterEncabezado;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText11: TQRDBText;
    qLineaNOMBRE: TStringField;
    qLineaID_CONTRATO: TFloatField;
    qLineaB_EVENTUAL: TStringField;
    qLineaB_REVOLVENTE: TStringField;
    qLineaDIAS_PLAZO: TFloatField;
    qLineaF_AUT_COMITE: TDateTimeField;
    qLineaIMP_AUTORIZADO: TFloatField;
    qLineaIMP_DISPUESTO: TFloatField;
    qLineaIMP_TRANSITO: TFloatField;
    qLineaSIT_LINEA: TStringField;
    qLineaDESC_MONEDA: TStringField;
    qLineaDESC_SUB_TIPO: TStringField;
    QRDBText7: TQRDBText;
    QRDBText4: TQRDBText;
    edTipoAut: TQRLabel;
    edRevolvente: TQRLabel;
    edFVencimiento: TQRLabel;
    edObserva: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    qLineaIMP_DISPONER: TCurrencyField;
    QRDBText8: TQRDBText;
    QRGroup2: TQRGroup;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel2: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand3: TQRBand;
    QRExpr5: TQRExpr;
    QRLabel3: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRDBText10: TQRDBText;
    procedure qLineaCalcFields(DataSet: TDataSet);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
  	FDataBaseName: String;
        FSessionName: String;
  	Procedure SetDataBaseName(DataBase: String);
	Procedure SetSessionName(Session: String);
  public
  	Property DataBaseName:String Read FDataBaseName Write SetDataBaseName;
  	Property SessionName:String Read FSessionName Write SetSessionName;
  end;

procedure Execute_RepCrCoR (ShowPreview:Boolean; Padre:TInterFrame);

implementation

{$R *.DFM}

Procedure Execute_RepCrCoR (ShowPreview:Boolean; Padre:TInterFrame);
var
  Reporte : TReporteCrCoR;
begin
  Reporte := TReporteCrCoR.Create(Padre);
  try
    Reporte.DataBaseName := Padre.DataBaseName;
    Reporte.SessionName := Padre.SessionName;
    Reporte.qLinea.Close;
    Reporte.qLinea.SQL.Clear;
    Reporte.qLinea.SQL.Add(
       ' SELECT  '+
       '     PERSONA.NOMBRE, '+
       '     CONTRATO.ID_CONTRATO, '+
       '     CRE_CONTRATO.B_EVENTUAL, CRE_CONTRATO.B_REVOLVENTE, CRE_CONTRATO.DIAS_PLAZO, CRE_CONTRATO.F_AUT_COMITE, CRE_CONTRATO.IMP_AUTORIZADO, CRE_CONTRATO.IMP_DISPUESTO, CRE_CONTRATO.IMP_TRANSITO, CRE_CONTRATO.SIT_LINEA, '+
       '     MONEDA.DESC_MONEDA, '+
       '     CRE_SUB_TIP_BCO.DESC_SUB_TIPO '+
       ' FROM '+
       '     ADMIPROD.PERSONA PERSONA, '+
       '     ADMIPROD.CONTRATO CONTRATO, '+
       '     ADMIPROD.CRE_CONTRATO CRE_CONTRATO, '+
       '     ADMIPROD.MONEDA MONEDA, '+
       '     ADMIPROD.CRE_SUB_TIP_BCO CRE_SUB_TIP_BCO '+
       ' WHERE '+
       '     PERSONA.ID_PERSONA = CONTRATO.ID_TITULAR AND '+
       '     CONTRATO.ID_CONTRATO = CRE_CONTRATO.ID_CONTRATO AND '+
       '     CONTRATO.CVE_MONEDA = MONEDA.CVE_MONEDA AND '+
       '     CRE_CONTRATO.CVE_SUB_TIP_BCO = CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO ');
    if (Padre.FieldByName('SIT_LINEA').AsString = 'AC') or (Padre.FieldByName('SIT_LINEA').AsString = 'LQ') then
      Reporte.qLinea.SQL.Add(' AND CRE_CONTRATO.SIT_LINEA ='''+ Padre.FieldByName('SIT_LINEA').AsString +''' ');
    if (Padre.FieldByName('RANGO').AsString = 'ES') then
      begin
        Reporte.qLinea.SQL.Add(' AND CONTRATO.ID_CONTRATO >= ' + Padre.FieldByName('ID_CONTRATO1').AsSQL + ' ');
        Reporte.qLinea.SQL.Add(' AND CONTRATO.ID_CONTRATO <= ' + Padre.FieldByName('ID_CONTRATO2').AsSQL + ' ');
      end;
    Reporte.qLinea.SQL.Add(
       ' ORDER BY '+
       '     MONEDA.DESC_MONEDA ASC, '+
       '     PERSONA.NOMBRE ASC ');
    Reporte.qLinea.Open;

    Reporte.QRInterEncabezado1.Titulo1 := 'Grupo Financiero Interacciones';
    Reporte.QRInterEncabezado1.Titulo2 := 'Posición de Autorizaciones de Crédito';
    Reporte.QRInterEncabezado1.Apli := Padre.Apli;

    if ShowPreview then
      begin Reporte.Preview;
      end
    else Reporte.Print;
  finally
    Reporte.Free;
  end;
end;

procedure TReporteCrCoR.qLineaCalcFields(DataSet: TDataSet);
begin
  qLineaIMP_DISPONER.AsFloat := qLineaIMP_AUTORIZADO.AsFloat - qLineaIMP_DISPUESTO.AsFloat;
end;

procedure TReporteCrCoR.SetDataBaseName(DataBase: String);
begin
  FDataBaseName := DataBase;
  qLinea.DatabaseName := DataBase;
end;

procedure TReporteCrCoR.SetSessionName(Session: String);
begin
  FSessionName := Session;
  qLinea.SessionName := Session;
end;


procedure TReporteCrCoR.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qLineaB_EVENTUAL.AsString = 'V' then
    edTipoAut.Caption := 'Linea'
  else
    edTipoAut.Caption := 'Eventual';

  if qLineaB_REVOLVENTE.AsString = 'V' then
    edRevolvente.Caption := 'Revolvente'
  else
    edRevolvente.Caption := 'No Revolvente';

  edFVencimiento.Caption := DatetoStr(trunc(qLineaF_AUT_COMITE.AsDateTime) + qLineaDIAS_PLAZO.AsInteger);

  if (PreDbltoDbl(qLineaIMP_DISPUESTO.AsFloat,2) < 0) or (PreDbltoDbl(abs(qLineaIMP_DISPUESTO.AsFloat) + abs(qLineaIMP_TRANSITO.AsFloat),2) > PreDbltoDbl(qLineaIMP_AUTORIZADO.AsFloat,2)) then
    edObserva.caption := 'Error'
  else
    edObserva.caption := '';
end;



procedure TReporteCrCoR.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  QRExpr1.Reset;
end;






end.
