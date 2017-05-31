unit RepCttoproPMNFOMSC;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, DmCttoEstado,
  IntFrm, InterMemo;

type
  TqrProemPMNFirOMSC = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel32: TQRLabel;
    QRBand2: TQRBand;
    qrlNomRepres: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    qrlfecImpre: TQRLabel;
    QRShape1: TQRShape;
    DetailBand1: TQRBand;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRMemo4: TQRMemo;
    QRMemo6: TQRMemo;
    QRMemo5: TQRMemo;
    QRMemo7: TQRMemo;
    qrlFecHoraImpre: TQRLabel;
    qrmNomRepresenta: TQRMemo;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
  private

      FInterFrame: TInterFrame;
      FRequery: Boolean;
  Protected
  public
//      Function PreparaReporte(Padre: TInterFrame): Boolean;
  published
      Property InterFrame: TInterFrame Read FInterFrame Write FInterFrame;
//      Property Requery: Boolean Read FRequery Write SetRequery;
  end;

var
  qrProemPMNFirOMSC: TqrProemPMNFirOMSC;


Procedure Execute_RepCttoproPMNFOMSC(ShowPreview:Boolean; Padre:TInterFrame;
                  Representante:String; Cliente:String; FechaContrato: String);

implementation


{$R *.DFM}

Procedure Execute_RepCttoproPMNFOMSC(ShowPreview:Boolean; Padre:TInterFrame;
                  Representante:String; Cliente:String; FechaContrato: String);
var	Reporte: TqrProemPMNFirOMSC;
begin
	Reporte:= TqrProemPMNFirOMSC.Create(nil);
   Try
       Reporte.qrlNomRepres.Caption:= Representante;
       Reporte.qrmNomRepresenta.Lines.Clear;
       Reporte.qrmNomRepresenta.Lines.Add(Cliente);
       Reporte.qrlFecHoraImpre.Caption:= FechaContrato;

      if ShowPreview then
         begin Reporte.Preview;
         end
      else Reporte.Print;
   finally
   	Reporte.Free;
   end;
end;



end.
