unit RepCttopropmX;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, UnGene,
  StdCtrls, ExtCtrls, Forms, QRCtrls, quickrpt, DmCttoEstado, InterMemo;

type
  TqrProemPMX = class(TQuickRep)
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
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
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    qrlLeyenda1: TQRLabel;
    QRLabel32: TQRLabel;
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
    qrsbRepresen: TQRSubDetail;
    QRBand1: TQRBand;
    qrlPiePagina: TQRLabel;
    qrlCotiNom: TQRLabel;
    QRLabel42: TQRLabel;
    QRDBText3: TQRDBText;
    qrlRepresen: TQRLabel;
    qrdbTipoFirma: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText1: TQRDBText;
    GroupHeaderBand1: TQRBand;
    QRLabel48: TQRLabel;
    qrlinefirmaCtte: TQRShape;
    QRMacvMemo1: TQRMacvMemo;
    lbTelefonoTitular: TQRLabel;
    QRDBText2: TQRDBText;
    qrmNomCliente: TQRMemo;
    qrmCalle: TQRMemo;
    qrmNomRepresenta: TQRMemo;
    QRLabel1: TQRLabel;
    qrdbtNumCont: TQRDBText;
    QRLabel2: TQRLabel;
    qrlFechaCont: TQRLabel;
    procedure qrProemPFNBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsbRepresenBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
      DatosRep  : TDatosRep;
  end;

var
  qrProemPMX: TqrProemPMX;

implementation


{$R *.DFM}


procedure TqrProemPMX.qrProemPFNBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
Var vlTope : Integer;
begin
   vlTope:=DatosRep.Tope;

   			//Inserta los valores necesarios dentro del reporte
  If DmPorta.qContrato.FieldByName('B_PROSPECTO').AsString = 'F' Then
    qrlFechaCont.Caption:= FmtFecha(DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsDateTime, '@DD-@MMM-@YYYY')
  else qrlFechaCont.Caption:= DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsString;
  qrlTipoCta.Caption       :=DatosRep.TipoCuenta;
  qrlManejoCta.Caption     :=DatosRep.CveCorresp;
  qrlInstEnvio.Caption     :=DatosRep.Envio;
  qrlLeyenda1.Caption      :=DatosRep.Leyenda1;
  qrlPiePagina.Caption     :=DatosRep.Leyenda2;
  qrmNomCliente.Lines.Clear;
  qrmNomCliente.Lines.Add(DatosRep.NombreCtto);

   //qrlNomRepres.Caption     :=DatosRep.NomRepres;
   QRMacvMemo1.Parametro.Add(DatosRep.NomRepres);
   If Trim(dmPorta.qDatosTitular.FieldByName('TELEF_OFICINA').asString) <> '' Then
   	lbTelefonoTitular.Caption := dmPorta.qDatosTitular.FieldByName('TELEF_OFICINA').asString
   else If Trim(dmPorta.qDatosTitular.FieldByName('TELEF_CASA').asString) <> '' Then
			lbTelefonoTitular.Caption := dmPorta.qDatosTitular.FieldByName('TELEF_CASA').asString
   	else
      		lbTelefonoTitular.Caption := dmPorta.qDatosTitular.FieldByName('TELEF_FAX').asString;

		   //Asigna las alturas y topes
{   qrsbRepresen.Height      :=DatosRep.Altura;
   qrlRepresen.Top          :=qrlRepresen.Top + vlTope;
   qrdbRepresen.Top         :=qrdbRepresen.Top + vlTope;
   qrdbTipoFirma.Top        :=qrdbTipoFirma.Top + vlTope;
	qrlinefirmaCtte.Top      :=qrlinefirmaCtte.Top + vlTope;}
end;








procedure TqrProemPMX.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmCalle.Lines.Clear;
  qrmCalle.Lines.Add(DmPorta.spDatosDom.FieldByName('CALLE_NUMERO').AsString);
end;

procedure TqrProemPMX.qrsbRepresenBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmNomRepresenta.Lines.Clear;
  qrmNomRepresenta.Lines.Add(DmPorta.qRepresent.FieldByName('NOMBRE_REPRES').AsString);
end;

end.
