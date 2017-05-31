unit RepCttoproPMNF;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, UnGene,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, DmCttoEstado;

type
  TqrProemPMNFir = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel32: TQRLabel;
    QRBand2: TQRBand;
    qrlNomRepres: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    DetailBand1: TQRBand;
    qrmNomRepresenta: TQRMemo;
    qrlfecImpre: TQRLabel;
    qrlFecHoraImpre: TQRLabel;
    procedure qrProemPFNFirBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public
      DatosRep  : TDatosRep;
  end;

var
  qrProemPMNFir: TqrProemPMNFir;

implementation


{$R *.DFM}


procedure TqrProemPMNFir.qrProemPFNFirBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   //Inserta los valores necesarios dentro del reporte
  If DmPorta.qContrato.FieldByName('B_PROSPECTO').AsString = 'F' Then
    qrlFecHoraImpre.Caption:= FmtFecha(DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsDateTime, '@DD-@MMM-@YYYY')
  else qrlFecHoraImpre.Caption:= DmPorta.qContrato.FieldByName('FECHA_CONTRATO').AsString;
  qrlNomRepres.Caption      :=DatosRep.NomRepres;
  qrmNomRepresenta.Lines.Clear;
  qrmNomRepresenta.Lines.Add(DatosRep.RepresPrin);
end;


end.
