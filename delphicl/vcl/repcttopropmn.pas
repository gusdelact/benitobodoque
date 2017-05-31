unit RepCttopropmn;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, UnGene,
  StdCtrls, ExtCtrls, Forms, QRCtrls, quickrpt, DmCttoEstado, InterMemo;

type
  TqrProemPMN = class(TQuickRep)
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
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
    QRLabel41: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText1: TQRDBText;
    qrsbRepresen: TQRSubDetail;
    QRBand1: TQRBand;
    qrlPiePagina: TQRLabel;
    qrlCotiNom: TQRLabel;
    QRLabel42: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel43: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel44: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel47: TQRLabel;
    qrlRepresen: TQRLabel;
    QRDBText10: TQRDBText;
    qrlNumEsc: TQRLabel;
    qrlFecha: TQRLabel;
    qrlNotario: TQRLabel;
    qrdbNumEsc: TQRDBText;
    qrdbTipoFirma: TQRDBText;
    qrdbNotario: TQRDBText;
    GroupHeaderBand1: TQRBand;
    QRLabel48: TQRLabel;
    edFechaEscritura: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    qrsFirma: TQRShape;
    QRMacvMemo1: TQRMacvMemo;
    lbTelefonoTitular: TQRLabel;
    lbPlazaTit: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    qrlLeyenda1: TQRLabel;
    QRLabel28: TQRLabel;
    qrmNomCliente: TQRMemo;
    qrmCalle: TQRMemo;
    qrmColonia: TQRMemo;
    ChildBand1: TQRChildBand;
    QRLabel29: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel49: TQRLabel;
    QRDBText19: TQRDBText;
    qrmNomRepresenta: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrdbtNumCont: TQRDBText;
    qrlFechaCont: TQRLabel;
    procedure qrProemPFNBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsbRepresenBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
      DatosRep : TDatosRep;
  end;

var
  qrProemPMN: TqrProemPMN;

implementation

{$R *.DFM}


procedure TqrProemPMN.qrProemPFNBeforePrint(Sender: TCustomQuickRep;
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

//   qrlNomRepres.Caption    :=DatosRep.NomRepres;
   QRMacvMemo1.Parametro.Add(DatosRep.NomRepres);
   If Trim(dmPorta.qDatosTitular.FieldByName('TELEF_OFICINA').asString) <> '' Then
   	lbTelefonoTitular.Caption := dmPorta.qDatosTitular.FieldByName('TELEF_OFICINA').asString
   else If Trim(dmPorta.qDatosTitular.FieldByName('TELEF_CASA').asString) <> '' Then
			lbTelefonoTitular.Caption := dmPorta.qDatosTitular.FieldByName('TELEF_CASA').asString
   	else
    		lbTelefonoTitular.Caption := dmPorta.qDatosTitular.FieldByName('TELEF_FAX').asString;


   If Trim(dmPorta.qChequeraTitul.FieldByName('NOM_PLAZA').asString) <> '' then
   	lbPlazaTit.Caption := dmPorta.qChequeraTitul.FieldByName('NOM_PLAZA').asString
   else if Trim(dmPorta.qChequeraTitul.FieldByName('NOM_PLAZA_BANCO').asString) <> '' Then
   	lbPlazaTit.Caption := dmPorta.qChequeraTitul.FieldByName('NOM_PLAZA_BANCO').asString
   else
   	lbPlazaTit.Caption := '';


			   //Asigna las alturas y topes
{   qrsbRepresen.Height     :=DatosRep.Altura;
   qrlRepresen.Top         :=qrlRepresen.Top + vlTope;
   qrdbRepresen.Top        :=qrdbRepresen.Top + vlTope;
   qrlNumEsc.Top           :=qrlNumEsc.Top + vlTope;
   qrdbNumEsc.Top          :=qrdbNumEsc.Top + vlTope;
   qrlFecha.Top            :=qrlFecha.Top + vlTope;
   qrlNotario.Top          :=qrlNotario.Top + vlTope;
   qrdbNotario.Top         :=qrdbNotario.Top + vlTope;
   qrdbTipoFirma.Top       :=qrdbTipoFirma.Top + vlTope;
   qrlPlaza.Top            :=qrlPlaza.Top + vlTope;
   qrdbPlaza.Top           :=qrdbPlaza.Top + vlTope;
   qrlInscrip.Top          :=qrlInscrip.Top + vlTope;
   qrdbInscrip.Top         :=qrdbInscrip.Top + vlTope;
   qrlVolumen.Top          :=qrlVolumen.Top + vlTope;
   qrdbVolumen.Top         :=qrdbVolumen.Top + vlTope;
   qrlLibro.Top            :=qrlLibro.Top + vlTope;
   qrdbLibro.Top           :=qrdbLibro.Top + vlTope;
   qrsFirma.Top            :=qrsFirma.Top + vlTope;
   edFechaEscritura.Top		:=edFechaEscritura.Top + vlTope;}

end;




procedure TqrProemPMN.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmCalle.Lines.Clear;
  qrmCalle.Lines.Add(DmPorta.spDatosDom.FieldByName('CALLE_NUMERO').AsString);
  qrmColonia.Lines.Clear;
  qrmColonia.Lines.Add(DmPorta.spDatosDom.FieldByName('COLONIA').AsString);
end;

procedure TqrProemPMN.qrsbRepresenBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmNomRepresenta.Lines.Clear;
  qrmNomRepresenta.Lines.Add(DmPorta.qRepresent.FieldByName('NOMBRE_REPRES').AsString);
end;

end.
