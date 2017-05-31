unit RepCttoreproe;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, UnGene,
  StdCtrls, ExtCtrls, Forms, QRCtrls, quickrpt, InterMemo, DmCttoEstado;

type
  TqrProemPFN = class(TQuickRep)
    qrlfecImpre: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    GroupFooterBand2: TQRBand;
    GroupHeaderBand3: TQRBand;
    QRLabel21: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText1: TQRDBText;
    qrdbTipoFirma: TQRDBText;
    QRShape1: TQRShape;
    QRLabel41: TQRLabel;
    qr: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel42: TQRLabel;
    QRDBText3: TQRDBText;
    subContratante: TQRSubDetail;
    qrsdCotitular: TQRSubDetail;
    qrlCotiCtaCh: TQRLabel;
    qrlCotiSucu: TQRLabel;
    qrlCotiPlaza: TQRLabel;
    QRShape2: TQRShape;
    QRDBText8: TQRDBText;
    QRDBText12: TQRDBText;
    qrdbCuenta: TQRDBText;
    qrdbNomBco: TQRDBText;
    qrdbCveSuc: TQRDBText;
    GroupFooterBand1: TQRBand;
    qrlCotiNacio: TQRLabel;
    qrdbCotiNacio: TQRDBText;
    GroupHeaderBand1: TQRBand;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRSubDetail3: TQRSubDetail;
    QRLabel56: TQRLabel;
    QRDBText11: TQRDBText;
    QRBand1: TQRBand;
    qrlPiePagina: TQRLabel;
    GroupHeaderBand2: TQRBand;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    qrlsFirma: TQRShape;
    lbPlazaTit: TQRLabel;
    lbPlazaCot: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText6: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel28: TQRLabel;
    qrmNomCliente: TQRMemo;
    qrmNomBeneficiario: TQRMemo;
    qrmNomCotitular: TQRMemo;
    DetailBand1: TQRBand;
    qrmDomicilio: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrdbtNumCont: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    qrlLeyenda1: TQRLabel;
    QRLabel32: TQRLabel;
    qrdbCiudad: TQRDBText;
    qrdbEtado: TQRDBText;
    qrdbCP: TQRDBText;
    qrlTipoCta: TQRLabel;
    qrlManejoCta: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    qrlInstEnvio: TQRLabel;
    QRLabel35: TQRLabel;
    qrlUno: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    qrlFechaCont: TQRLabel;
    QRMacvMemo1: TQRMacvMemo;
    lbTelefonoTitular: TQRLabel;
    procedure qrProemPFNBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure GroupHeaderBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure qrsdCotitularBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure GroupFooterBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GroupHeaderBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
     DatosRep:TDatosRep;
  end;

var
  qrProemPFN: TqrProemPFN;

implementation

{$R *.DFM}

procedure TqrProemPFN.qrProemPFNBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
Var
  vlTope : Integer;
begin
  dmPorta.qContrato.First;
  //Asigna los controles del reporte
  If DmPorta.qContrato.FieldByName('B_PROSPECTO').AsString = 'F' Then
    qrlFechaCont.Caption:= FmtFecha(DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsDateTime, '@DD-@MMM-@YYYY')
  else qrlFechaCont.Caption:= DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsString;
  qrlTipoCta.Caption     :=DatosRep.TipoCuenta;
  qrlManejoCta.Caption   :=DatosRep.CveCorresp;
  qrlInstEnvio.Caption   :=DatosRep.Envio;
  qrlLeyenda1.Caption    :=DatosRep.Leyenda1;
  qrlPiePagina.Caption   :=DatosRep.Leyenda2;
  qrmNomCliente.Lines.Clear;
  qrmNomCliente.Lines.Add(DatosRep.NombreCtto);
  QRMacvMemo1.Parametro.Add(DatosRep.NomRepres);
  qrmDomicilio.Lines.Clear;
  qrmDomicilio.Lines.Add(dmPorta.spDatosDom.FieldByName('CALLE_NUMERO').asString + '   COLONIA ' + dmPorta.spDatosDom.FieldByName('COLONIA').asString);
  If Trim(dmPorta.qDatosTitular.FieldByName('TELEF_CASA').asString) <> '' Then
     lbTelefonoTitular.Caption := dmPorta.qDatosTitular.FieldByName('TELEF_CASA').asString
  else
     If Trim(dmPorta.qDatosTitular.FieldByName('TELEF_OFICINA').asString) <> '' Then
        lbTelefonoTitular.Caption := dmPorta.qDatosTitular.FieldByName('TELEF_OFICINA').asString
     else
        lbTelefonoTitular.Caption := dmPorta.qDatosTitular.FieldByName('TELEF_FAX').asString;
end;

procedure TqrProemPFN.GroupHeaderBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  If dmPorta.qCheqraCotit.RecordCount = 0 then
     qrsdCotitular.Visible := false
  else
     qrsdCotitular.Visible := True;
end;

procedure TqrProemPFN.qrsdCotitularBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if dmPorta.qCheqraCotit.RecordCount = 0 then
     PrintBand := false
  else begin
     PrintBand := True;
     If Trim(dmPorta.qCheqraCotit.FieldByName('NOM_PLAZA').asString) <> '' then
        lbPlazaCot.Caption := dmPorta.qCheqraCotit.FieldByName('NOM_PLAZA').asString
     else
        if Trim(dmPorta.qCheqraCotit.FieldByName('NOM_PLAZA_BANCO').asString) <> '' Then
           lbPlazaCot.Caption := dmPorta.qCheqraCotit.FieldByName('NOM_PLAZA_BANCO').asString
        else
           lbPlazaCot.Caption := '';
  end;
end;

procedure TqrProemPFN.QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  If Trim(dmPorta.qChequeraTitul.FieldByName('NOM_PLAZA').asString) <> '' then
     lbPlazaTit.Caption := dmPorta.qChequeraTitul.FieldByName('NOM_PLAZA').asString
  else
     if Trim(dmPorta.qChequeraTitul.FieldByName('NOM_PLAZA_BANCO').asString) <> '' Then
   	lbPlazaTit.Caption := dmPorta.qChequeraTitul.FieldByName('NOM_PLAZA_BANCO').asString
     else
   	lbPlazaTit.Caption := '';
end;

procedure TqrProemPFN.GroupFooterBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If qrlLeyenda1.Caption = 'REPRESENTADO POR SUS PADRES' Then
      ChildBand1.Enabled := True
   Else
      ChildBand1.Enabled := False;
end;

procedure TqrProemPFN.QRSubDetail3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmNomBeneficiario.Lines.Clear;
  qrmNomBeneficiario.Lines.Add(DmPorta.qBeneficiarios.FieldByName('NOMBRE').AsString);
end;

procedure TqrProemPFN.GroupHeaderBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmNomCotitular.Lines.Clear;
  qrmNomCotitular.Lines.Add(DmPorta.qDatosCotitul.FieldByName('NOMBRE').AsString);
end;

end.
