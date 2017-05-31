unit RepCttoILineMandato_bco;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, InterMemo, unGene, IntFrm;

type
	TRepIlineMandato_bco = class(TQuickRep)
		QRBand1: TQRBand;
		QRBand2: TQRBand;
	 lbPiePagina: TQRLabel;
		ChildBand1: TQRChildBand;
		QRShape2: TQRShape;
		QRLabel68: TQRLabel;
		QRMacvMemo1: TQRMacvMemo;
    lbNomAutoriza: TQRLabel;
    procedure RepIlineMandato_bcoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
	private
		FInterFrame: TInterFrame;
                ContratoRef : Real;
                NomAuto    : String;
                NomTit     : String;
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
  qrMandato: TRepIlineMandato_bco;
  NomTit : String;

Procedure Execute_RepILineMandato_bco(Padre: TInterFrame; Contrato_Asoc: Real; Titular : String; NombreAutoriza : String; Preview: Boolean);

implementation

{$R *.DFM}

Procedure Execute_RepILineMandato_bco(Padre: TInterFrame; Contrato_Asoc: Real; Titular : String; NombreAutoriza : String; Preview: Boolean);
Var Rep: TRepILineMandato_bco;
begin
	Rep:= TRepILineMandato_bco.Create(nil);
	Try
		Rep.InterFrame:= Padre;
                Rep.ContratoRef := Contrato_Asoc;
                Rep.NomAuto := NombreAutoriza;
                Rep.NomTit := Titular;
                NomTit := Titular;
                Rep.lbNomAutoriza.Caption := NombreAutoriza;
		if Preview then Rep.Preview
		else Rep.Print;
	finally
		If Rep <> nil Then Rep.Free;
	end;
end;

procedure TRepIlineMandato_bco.RepIlineMandato_bcoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
//	lbNomRepresentante.Caption:= InterFrame.FieldByName('NOM_CLIENTE').asString;
	lbPiePagina.Caption:= InterFrame.FieldByName('LEYENDA_PIE').asString;

//	MemoLeyenda.Parametro.Add(InterFrame.FieldByName('NOM_CLIENTE').asString);
//	MemoLeyenda.Parametro.Add(NomTit);
{	MemoLeyenda.Parametro.Add(InterFrame.FieldByName('NOM_CONTRATO').asString);
	MemoLeyenda.Parametro.Add(UpperCase(FmtFecha(InterFrame.FieldByName('F_ALTA').AsDateTime, '@d DE @mmmm de @yyyy')));
}
end;

end.
