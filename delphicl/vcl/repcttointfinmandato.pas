unit RepCttoIntFinMandato;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, InterMemo, unGene, IntFrm;

type
	TRepIntFinMandato = class(TQuickRep)
		QRBand1: TQRBand;
		QRBand2: TQRBand;
	 lbPiePagina: TQRLabel;
		ChildBand1: TQRChildBand;
		QRShape2: TQRShape;
		QRLabel68: TQRLabel;             
		QRLabel69: TQRLabel;
		QRMacvMemo1: TQRMacvMemo;
	 MemoLeyenda: TQRMacvMemo;
    qrmNomRepresenta: TQRMemo;
		procedure qrMandatoBeforePrint(Sender: TCustomQuickRep;
			var PrintReport: Boolean);
	private
		FInterFrame: TInterFrame;
	public
		Property InterFrame: TInterFrame Read FInterFrame Write FInterFrame;
  
{		Fecha     : String;
		Hora      : String;
		Represen  : String;
		Leyenda2  : String;
		NombrePersona : String;
		dmPorta   : TDataModule}
  end;

var
  qrMandato: TRepIntFinMandato;

Procedure Execute_RepIntFinMandato(Padre: TInterFrame; Preview: Boolean);  

implementation

{$R *.DFM}

Procedure Execute_RepIntFinMandato(Padre: TInterFrame; Preview: Boolean);
Var Rep: TRepIntFinMandato;
begin
	Rep:= TRepIntFinMandato.Create(nil);
	Try
		Rep.InterFrame:= Padre;
		if Preview then Rep.Preview
		else Rep.Print;
	finally
		If Rep <> nil Then Rep.Free;
	end;
end;

procedure TRepIntFinMandato.qrMandatoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin					//Asigna los valores por default
  qrmNomRepresenta.Lines.Clear;
  qrmNomRepresenta.Lines.Add(InterFrame.FieldByName('NOM_CLIENTE').asString);
	lbPiePagina.Caption:= InterFrame.FieldByName('LEYENDA_PIE').asString;

{
	MemoLeyenda.Parametro.Add(InterFrame.FieldByName('ID_CTTO').asString);
	MemoLeyenda.Parametro.Add(InterFrame.FieldByName('NOM_CONTRATO').asString);
	MemoLeyenda.Parametro.Add(UpperCase(FmtFecha(InterFrame.FieldByName('F_ALTA').AsDateTime, '@d DE @mmmm de @yyyy')));
}	
end;


end.
