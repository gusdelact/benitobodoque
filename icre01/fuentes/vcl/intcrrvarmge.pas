unit IntCrRVarMge;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, IntFrm,InterApl,
  Db, DBTables,IntQRPreview, QRExport;

type
  TqrCrRVarMge = class(TQuickRep)
    QRBand1: TQRBand;
    QryConsulta: TQuery;
    QRBand2: TQRBand;
    QRBand4: TQRBand;
    QRShape5: TQRShape;
    QRInterEncabezado1: TQRInterEncabezado;
    QRImage1: TQRImage;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRDBText6: TQRDBText;
    QRExcelFilter1: TQRExcelFilter;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRSHPTitular: TQRShape;
    qrgrpHeaderAcreditado: TQRGroup;
    QRShape1: TQRShape;
    QRDBText11: TQRDBText;
    qrgrpHeaderMoneda: TQRGroup;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel11: TQRLabel;
    qrgrpFooterAcreditado: TQRBand;
    QRLabel12: TQRLabel;
    QRDBText13: TQRDBText;
    QRExpr1: TQRExpr;
    QryConsultaID_TITULAR: TFloatField;
    QryConsultaNOMBRE: TStringField;
    QryConsultaCVE_MONEDA: TFloatField;
    QryConsultaID_CREDITO: TFloatField;
    QryConsultaCVE_TASA_REFER: TStringField;
    QryConsultaIMP_CAP_VIG1: TFloatField;
    QryConsultaIMP_INTERES_DIA1: TFloatField;
    QryConsultaTASA_PROMEDIO1: TFloatField;
    QryConsultaIMP_CAP_VIG2: TFloatField;
    QryConsultaIMP_INTERES_DIA2: TFloatField;
    QryConsultaTASA_PROMEDIO2: TFloatField;
    QryConsultaTASAVARIACION: TFloatField;
    QryConsultaVARIACION: TFloatField;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel13: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel14: TQRLabel;
    QRBand3: TQRBand;
    qrlblMesAnterior: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape2: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgrpHeaderMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpFooterAcreditadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qrCrRVarMge: TqrCrRVarMge;
  procedure Execute_Reporte(peShowPreview : Boolean;
                            pePadre: TInterFrame;
                            peTitulo: String;
                            peMesAnioActual, peMesAnioAnterior: String;
                            peSqlReporte: String);

implementation

var
//  vgtipoReporte : Boolean;
  vgConsulta    : Integer;
  vgtipoReporte : Integer;


{$R *.DFM}

  procedure Execute_Reporte(peShowPreview : Boolean;
                            pePadre: TInterFrame;
                            peTitulo: String;
                            peMesAnioActual, peMesAnioAnterior: String;
                            peSqlReporte: String);

var qrCrRVarMge: TqrCrRVarMge;
    Preview   : TIntQRPreview;
Begin
  Try
//    vgtipoReporte := False;
    if peTitulo = 'Consulta de acreditados nuevos en el mes.' then
       vgtipoReporte := 0;
    if peTitulo = 'Consulta de acreditados liquidados en el mes anterior.' then
       vgtipoReporte := 1;
    if peTitulo = 'Consulta de intereses devengado en el bimestre.' then
//    begin
//       vgtipoReporte := True;
       vgtipoReporte := 2;
//    end;

    qrCrRVarMge:= TqrCrRVarMge.Create(Nil);

    Preview := TIntqrPreview.CreatePreview(Application, qrCrRVarMge);
    qrCrRVarMge.QRInterEncabezado1.IdEmpresa  := 2;
    qrCrRVarMge.ReportTitle := qrCrRVarMge.QRInterEncabezado1.Titulo1;
    qrCrRVarMge.QRInterEncabezado1.Titulo1    := peTitulo;
    qrCrRVarMge.QRInterEncabezado1.Titulo2    := 'De: '+ peMesAnioAnterior + ' a ' + peMesAnioActual;

    qrCrRVarMge.QryConsulta.Close;
    qrCrRVarMge.QryConsulta.DatabaseName := pePadre.Apli.DataBaseName;
    qrCrRVarMge.QryConsulta.SessionName  := pePadre.Apli.SessionName;

    qrCrRVarMge.QryConsulta.SQL.Clear;

    qrCrRVarMge.QryConsulta.SQL.Text := peSqlReporte;
    qrCrRVarMge.QryConsulta.open;

    if qrCrRVarMge.QryConsulta.IsEmpty then begin
      Application.MessageBox('No existe información de la Solicitud!!!','Mensaje',MB_ICONEXCLAMATION);
    end
    else begin
      if qrCrRVarMge.QRPrinter <> nil then qrCrRVarMge.QRPrinter.Free;

      if peShowPreview then
        qrCrRVarMge.Preview
      else begin
        qrCrRVarMge.Print;
      end;
       qrCrRVarMge.QryConsulta.Close;
    end;
  Finally
    If qrCrRVarMge <> nil Then qrCrRVarMge.Free;
  End;
End;

procedure TqrCrRVarMge.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
    case vgtipoReporte of
    0,1 : begin
            QRLabel6.Enabled   := False;
            QRLabel7.Enabled   := False;
            QRLabel8.Enabled   := False;
            QRLabel9.Enabled   := False;
            QRLabel10.Enabled  := False;
            QRLabel11.Enabled  := False;
            QRLabel12.Enabled  := False;
            QRLabel16.Enabled  := False;
            QRLabel17.Enabled  := False;
            QRDBText3.Enabled  := False;
            QRDBText4.Enabled  := False;
            QRDBText8.Enabled  := False;
            QRDBText9.Enabled  := False;
            QRDBText10.Enabled := False;
            QRDBText12.Enabled := False;
            QRDBText13.Enabled := False;
            QRExpr4.Enabled    := False;
            QRExpr6.Enabled    := False;
            QRExpr8.Enabled    := False;
            QRShape3.Enabled   := False;
            QRShape4.Enabled   := False;
            QRShape6.Enabled   := False;
            QRShape7.Enabled   := False;
            QRSHPTitular.Width := 401;
            QRShape1.Width     := 387;
            if vgtipoReporte = 0 then
               qrlblMesAnterior.Caption := 'COLOCACIÓN'
            else qrlblMesAnterior.Caption := 'SALIDAS';
       end;
    2: begin
//          if vgTipoReporte then
//          begin
             QRLabel6.Enabled   := True;
             QRLabel7.Enabled   := True;
             QRLabel8.Enabled   := True;
             QRLabel9.Enabled   := True;
             QRLabel10.Enabled  := True;
             QRLabel11.Enabled  := True;
             QRLabel12.Enabled  := True;
             QRLabel16.Enabled  := True;
             QRLabel17.Enabled  := True;
             QRDBText3.Enabled  := True;
             QRDBText4.Enabled  := True;
             QRDBText8.Enabled  := True;
             QRDBText9.Enabled  := True;
             QRDBText10.Enabled := True;
             QRDBText12.Enabled := True;
             QRDBText13.Enabled := True;
             QRExpr4.Enabled    := True;
             QRExpr6.Enabled    := True;
             QRExpr8.Enabled    := True;
             QRShape3.Enabled   := True;
             QRShape4.Enabled   := True;
             QRShape6.Enabled   := True;
             QRShape7.Enabled   := True;
             QRSHPTitular.Width := 953;
             QRShape1.Width     := 939;
//          end;
             qrlblMesAnterior.Caption := 'MES ACTUAL';
       end;
    end;
end;

procedure TqrCrRVarMge.qrgrpHeaderMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if QryConsulta.FieldByName('CVE_MONEDA').AsInteger = 484 then
     QRLabel14.Caption := 'MONEDA: PESOS'
  else QRLabel14.Caption := 'MONEDA: DOLARES';
end;

procedure TqrCrRVarMge.qrgrpFooterAcreditadoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   if QRExpr2.Value.intResult = 1 then
   begin
      QRLabel13.Enabled := False;
      QRExpr1.Reset;
      QRExpr1.Enabled   := False;
      QRExpr2.Reset;
      QRExpr2.Enabled   := False;
      QRExpr3.Reset;
      QRExpr3.Enabled   := False;
      if vgtipoReporte = 2 then
      begin
        QRExpr4.Reset;
        QRExpr4.Enabled   := False;
        QRExpr6.Reset;
        QRExpr6.Enabled   := False;
        QRExpr8.Reset;
        QRExpr8.Enabled   := False;
      end;
   end
   else
   begin
      QRLabel13.Enabled := True;
      QRExpr1.Enabled   := True;
      QRExpr2.Enabled   := True;
      QRExpr3.Enabled   := True;
      if vgtipoReporte = 2 then
      begin
        QRExpr4.Enabled   := True;
        QRExpr6.Enabled   := True;
        QRExpr8.Enabled   := True;
      end;
   end;
end;

end.
