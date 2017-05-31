unit RepCttopropfx;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, UnGene, 
  StdCtrls, ExtCtrls, Forms, QRCtrls, quickrpt, DmCttoEstado, InterMemo;

type
  TqrProemPFX = class(TQuickRep)
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
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
    qrdbColonia: TQRDBText;
    qrdbCiudad: TQRDBText;
    qrdbEtado: TQRDBText;
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
    QRBand1: TQRBand;
    qrlPiePagina: TQRLabel;
    GroupHeaderBand1: TQRBand;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    qrlNombre: TQRLabel;
    qrdbNombre: TQRDBText;
    qrlNacional: TQRLabel;
    qrdbNacional: TQRDBText;
    qrlRFC: TQRLabel;
    qrdbRFC: TQRDBText;
    qrsFirma: TQRShape;
    qrdbTipFirma: TQRDBText;
    QRLabel56: TQRLabel;
    QRDBText11: TQRDBText;
    QRMacvMemo1: TQRMacvMemo;
    lbTelefonoTitular: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel41: TQRLabel;
    qr: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel27: TQRLabel;
    lbPlazaTit: TQRLabel;
    GroupHeaderBand3: TQRBand;
    QRLabel9: TQRLabel;
    lbRFCTitular: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape2: TQRShape;
    GroupFooterBand2: TQRBand;
    QRLabel24: TQRLabel;
    QRDBText8: TQRDBText;
    GroupHeaderBand2: TQRBand;
    QRLabel22: TQRLabel;
    lbRFCCotitular: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    qrlsFirma: TQRShape;
    QRLabel29: TQRLabel;
    QRDBText12: TQRDBText;
    qrlCotiCtaCh: TQRLabel;
    qrlCotiSucu: TQRLabel;
    qrlCotiPlaza: TQRLabel;
    QRShape3: TQRShape;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    qrdbCuenta: TQRDBText;
    qrdbNomBco: TQRDBText;
    qrdbCveSuc: TQRDBText;
    lbPlazaCot: TQRLabel;
    GroupFooterBand1: TQRBand;
    qrlCotiNacio: TQRLabel;
    qrdbCotiNacio: TQRDBText;
    QRLabel30: TQRLabel;
    subContratante: TQRSubDetail;
    SubCheqTitular2: TQRSubDetail;
    SubCheqCotitular2: TQRSubDetail;
    qrmDomicilio: TQRMemo;
    qrmNomCliente: TQRMemo;
    qrmNomCotitular: TQRMemo;
    qrmNomBeneficiario: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrdbtNumCont: TQRDBText;
    qrlFechaCont: TQRLabel;
    procedure qrProemPFNBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure GroupHeaderBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure GroupHeaderBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure SubCheqTitular2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SubCheqCotitular2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GroupHeaderBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
     DatosRep : TDatosRep;
  end;

var
  qrProemPFX: TqrProemPFX;

implementation


{$R *.DFM}


procedure TqrProemPFX.qrProemPFNBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
Var vlTope : Integer;
begin
  vlTope:=DatosRep.Tope;
				   //Inserta los valores necesarios dentro del reporte
  If DmPorta.qContrato.FieldByName('B_PROSPECTO').AsString = 'F' Then
    qrlFechaCont.Caption:= FmtFecha(DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsDateTime, '@DD-@MMM-@YYYY')
  else qrlFechaCont.Caption:= DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsString;
  qrlTipoCta.Caption      :=DatosRep.TipoCuenta;
  qrlManejoCta.Caption    :=DatosRep.CveCorresp;
  qrlInstEnvio.Caption    :=DatosRep.Envio;
  qrlLeyenda1.Caption     :=DatosRep.Leyenda1;
  qrlPiePagina.Caption    :=DatosRep.Leyenda2;
  qrmNomCliente.Lines.Clear;
  qrmNomCliente.Lines.Add(DatosRep.NombreCtto);


   If Trim(dmPorta.qDatosTitular.FieldByName('RFC_TITULAR').asString) <> '' Then
   	lbRFCTitular.Enabled := True
   else lbRFCTitular.Enabled := False;

   //qrlNomRepres.Caption    :=DatosRep.NomRepres;
   QRMacvMemo1.Parametro.Add(DatosRep.NomRepres);

   qrmDomicilio.Lines.Clear;
   qrmDomicilio.Lines.Add(dmPorta.spDatosDom.FieldByName('CALLE_NUMERO').asString + '   COLONIA ' + dmPorta.spDatosDom.FieldByName('COLONIA').asString);

   If Trim(dmPorta.qDatosTitular.FieldByName('TELEF_CASA').asString) <> '' Then
   	lbTelefonoTitular.Caption := dmPorta.qDatosTitular.FieldByName('TELEF_CASA').asString
   else If Trim(dmPorta.qDatosTitular.FieldByName('TELEF_OFICINA').asString) <> '' Then
			lbTelefonoTitular.Caption := dmPorta.qDatosTitular.FieldByName('TELEF_OFICINA').asString
   	else
      		lbTelefonoTitular.Caption := dmPorta.qDatosTitular.FieldByName('TELEF_FAX').asString;

				   //Asigna las alturas y topes
{   qrsbCotitul.Height      :=DatosRep.Altura;
   qrlNombre.Top           :=qrlNombre.Top + vlTope;
   qrdbNombre.Top          :=qrdbNombre.Top + vlTope;
   qrlRFC.Top              :=qrlRFC.Top + vlTope;
   qrdbRFC.Top             :=qrdbRFC.Top + vlTope;
   qrdbTipFirma.Top        :=qrdbTipFirma.Top + vlTope;
   qrsFirma.Top            :=qrsFirma.Top + vlTope;
   qrlNacional.Top         :=qrlNacional.Top + vlTope;
   qrdbNacional.Top        :=qrdbNacional.Top + vlTope;}
end;


procedure TqrProemPFX.GroupHeaderBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
	If dmPorta.qChequeraTitul.RecordCount = 0 then
   	SubCheqTitular2.Enabled := False
   else
   	SubCheqTitular2.Enabled := True;
end;

procedure TqrProemPFX.GroupHeaderBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
	If dmPorta.qCheqraCotit.RecordCount = 0 then
   	SubCheqCotitular2.Enabled := false
   else
   	SubCheqCotitular2.Enabled := True;
end;

procedure TqrProemPFX.SubCheqTitular2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
	If Trim(dmPorta.qChequeraTitul.FieldByName('NOM_PLAZA').asString) <> '' then
   	lbPlazaTit.Caption := dmPorta.qChequeraTitul.FieldByName('NOM_PLAZA').asString
	else if Trim(dmPorta.qChequeraTitul.FieldByName('NOM_PLAZA_BANCO').asString) <> '' Then
   	lbPlazaTit.Caption := dmPorta.qChequeraTitul.FieldByName('NOM_PLAZA_BANCO').asString
   else
   	lbPlazaTit.Caption := '';
end;

procedure TqrProemPFX.SubCheqCotitular2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
	If dmPorta.qCheqraCotit.RecordCount = 0 then PrintBand := false
   else
      begin
         PrintBand := True;
         If Trim(dmPorta.qCheqraCotit.FieldByName('NOM_PLAZA').asString) <> '' then
            lbPlazaCot.Caption := dmPorta.qCheqraCotit.FieldByName('NOM_PLAZA').asString
         else if Trim(dmPorta.qCheqraCotit.FieldByName('NOM_PLAZA_BANCO').asString) <> '' Then
            lbPlazaCot.Caption := dmPorta.qCheqraCotit.FieldByName('NOM_PLAZA_BANCO').asString
         else
            lbPlazaCot.Caption := '';
      end;
end;

procedure TqrProemPFX.GroupHeaderBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If Trim(dmPorta.qDatosCotitul.FieldByName('RFC_COTITULAR').asString) <> '' Then
   	lbRFCCotitular.Enabled := True
   else lbRFCCotitular.Enabled := False;
  qrmNomCotitular.Lines.Clear;
  qrmNomCotitular.Lines.Add(DmPorta.qDatosCotitul.FieldByName('NOMBRE').AsString);
end;

procedure TqrProemPFX.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmNomBeneficiario.Lines.Clear;
  qrmNomBeneficiario.Lines.Add(DmPorta.qBeneficiarios.FieldByName('NOMBRE').AsString);
end;

end.
