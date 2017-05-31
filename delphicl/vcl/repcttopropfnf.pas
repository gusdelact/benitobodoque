unit RepCttoproPFNF;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms,
     Quickrpt, QRCtrls, UnGene, DmCttoEstado;

type
  TqrProemPFNFir = class(TQuickRep)
    QRBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRSubDetail2: TQRSubDetail;
    QRLabel32: TQRLabel;
    qrshFirma: TQRShape;
    FirmaCtte: TQRShape;
    QRBand2: TQRBand;
    qrlNomRepres: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    qrlfecImpre: TQRLabel;
    qrlFecHoraImpre: TQRLabel;
    qrmNomCliente: TQRMemo;
    qrmNomCotitular: TQRMemo;
    PctBeneficio: TQRLabel;
    procedure qrProemPFNFirBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
      DatosRep : TDatosRep;
  end;

var
  qrProemPFNFir: TqrProemPFNFir;

implementation

{$R *.DFM}



procedure TqrProemPFNFir.qrProemPFNFirBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   //Inserta los valores necesarios dentro del reporte
  If DmPorta.qContrato.FieldByName('B_PROSPECTO').AsString = 'F' Then
    qrlFecHoraImpre.Caption:= FmtFecha(DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsDateTime, '@DD-@MMM-@YYYY')
  else qrlFecHoraImpre.Caption:= DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsString;
  qrlNomRepres.Caption     :=DatosRep.NomRepres;
end;

procedure TqrProemPFNFir.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmNomCliente.Lines.Clear;
	If Trim(dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString) <> '' Then
    qrmNomCliente.Lines.Add(dmPorta.qContrato.FieldByName('NOMB_CONTRATO').asString)
   else
    qrmNomCliente.Lines.Add(dmPorta.qDatosTitular.FieldByName('NOMBRE').asString);
end;

procedure TqrProemPFNFir.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmNomCotitular.Lines.Clear;
  qrmNomCotitular.Lines.Add(DmPorta.qDatosCotitul.FieldByName('NOMBRE').asString);
{
  FirmaCtte.Enabled:= (DmPorta.qDatosCotitul.FieldByName('PCT_BENEFICIO').asString = '');
  If FirmaCtte.Enabled Then
    PctBeneficio.Caption:= ''
  else PctBeneficio.Caption:= 'PORCENTAJE: ' + DmPorta.qDatosCotitul.FieldByName('PCT_BENEFICIO').asString + '.00 %';
}
end;

end.
