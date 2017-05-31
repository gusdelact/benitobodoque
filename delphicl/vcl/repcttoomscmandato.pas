unit RepCttoOMSCMandato;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, InterMemo, unGene, IntFrm;

type
	TRepOMSCMandato = class(TQuickRep)
		QRBand2: TQRBand;
    lbPiePagina: TQRLabel;
    TitleBand1: TQRBand;
    ChildBand2: TQRChildBand;
    QRMacvMemo1: TQRMacvMemo;
    QRShape2: TQRShape;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    qrmNomRepresenta: TQRMemo;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    qrlNomEmp: TQRLabel;
    qrlContratoFecha: TQRLabel;
		procedure qrMandatoBeforePrint(Sender: TCustomQuickRep;
			var PrintReport: Boolean);
	private
		FInterFrame: TInterFrame;
	public
		Property InterFrame: TInterFrame Read FInterFrame Write FInterFrame;

  end;

var
  qrMandato: TRepOMSCMandato;

Procedure Execute_RepOMSCMandato(Padre: TInterFrame; Preview: Boolean);

implementation

{$R *.DFM}

Procedure Execute_RepOMSCMandato(Padre: TInterFrame; Preview: Boolean);
Var Rep: TRepOMSCMandato;
begin
	Rep:= TRepOMSCMandato.Create(nil);
	Try
		Rep.InterFrame:= Padre;
		if Preview then Rep.Preview
		else Rep.Print;
	finally
		If Rep <> nil Then Rep.Free;
	end;
end;



procedure TRepOMSCMandato.qrMandatoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
					//Asigna los valores por default
  qrmNomRepresenta.Lines.Clear;
  qrmNomRepresenta.Lines.Add(InterFrame.FieldByName('NOM_CLIENTE').asString);
	lbPiePagina.Caption:= InterFrame.FieldByName('LEYENDA_PIE').asString;

  qrlNomEmp.Caption:=  'Y ' + InterFrame.FieldByName('NOM_CONTRATO').asString + ',';
  If InterFrame.FieldByName('B_PROSPECTO').AsString = 'V' Then
    qrlContratoFecha.Caption:= 'CON NÚMERO  ' + InterFrame.FieldByName('CTO_AUX').asString + '  DE FECHA  ' + InterFrame.FieldByName('FECHA_CONTRATO').AsString + '.'
  else qrlContratoFecha.Caption:= 'CON NÚMERO  ' + InterFrame.FieldByName('CTO_AUX').asString + '  DE FECHA  ' + UpperCase(FmtFecha(InterFrame.FieldByName('FECHA_CONTRATO').AsDateTime, '@D DE @MMMM DE @YYYY')) + '.';

end;


end.
