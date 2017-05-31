unit RepCttoILineConveniobco;
// CIBC
interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, InterMemo, unGene, IntFrm,
  Db, DBTables;

type
	TRepIlineConvenioBco = class(TQuickRep)
		QRBand1: TQRBand;
		QRBand2: TQRBand;
	 lbPiePagina: TQRLabel;
		ChildBand1: TQRChildBand;
		QRShape2: TQRShape;
		QRMacvMemo1: TQRMacvMemo;
    QRMacvMemo2: TQRMacvMemo;
    QRMacvMemo3: TQRMacvMemo;
    QRMacvMemo4: TQRMacvMemo;
    QRMacvMemo5: TQRMacvMemo;
    QRMacvMemo6: TQRMacvMemo;
    QRMacvMemo7: TQRMacvMemo;
    QRMacvMemo8: TQRMacvMemo;
    QRMacvMemo9: TQRMacvMemo;
    QRMacvMemo10: TQRMacvMemo;
    QRMacvMemo11: TQRMacvMemo;
    QRMacvMemo12: TQRMacvMemo;
    QRMacvMemo13: TQRMacvMemo;
    QRMacvMemo14: TQRMacvMemo;
    QRMacvMemo15: TQRMacvMemo;
    QRMacvMemo16: TQRMacvMemo;
    lbDias: TQRLabel;
    QRMacvMemo18: TQRMacvMemo;
    lbMes: TQRLabel;
    QRMacvMemo19: TQRMacvMemo;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape1: TQRShape;
    QRMacvMemo21: TQRMacvMemo;
    QRMacvMemo22: TQRMacvMemo;
    QRMacvMemo23: TQRMacvMemo;
    QRMacvMemo24: TQRMacvMemo;
    lbAnio: TQRLabel;
    QRMacvMemo25: TQRMacvMemo;
    QRMacvMemo26: TQRMacvMemo;
    QRMacvMemo20: TQRMacvMemo;
    qrmNomAutoriza: TQRMemo;
    ChildBand2: TQRChildBand;
    ChildBand3: TQRChildBand;
    qrmNomRepresenta: TQRMemo;
    QRLabel5: TQRLabel;
    lbCtto: TQRLabel;

    procedure RepIlineConvenioBcoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
	private
		FInterFrame : TInterFrame;
                ContratoRef : Real;
                NomAuto    : String;
                NomTit     : String;                
	public
		Property InterFrame: TInterFrame Read FInterFrame Write FInterFrame;

  end;

var
  qrConvenio : TRepIlineConvenioBco;
  Base       : Real;
  NomTit     : String;

Procedure Execute_RepILineConvenioBco(Padre: TInterFrame; Contrato_Asoc: Real; Titular : String; NombreAutoriza : String; Preview: Boolean);

implementation

{$R *.DFM}

Procedure Execute_RepILineConvenioBco(Padre: TInterFrame; Contrato_Asoc: Real ; Titular : String; NombreAutoriza : String; Preview: Boolean);
Var Rep: TRepILineConvenioBco;
begin
	Rep:= TRepILineConvenioBco.Create(nil);
	Try
		Rep.InterFrame:= Padre;
                Rep.ContratoRef := Contrato_asoc;
                Rep.NomAuto := NombreAutoriza;
                Rep.NomTit := Titular;
                Rep.qrmNomRepresenta.Lines.Clear;
                Rep.qrmNomRepresenta.Lines.Add(Titular);
                Rep.qrmNomAutoriza.Lines.Clear;
                Rep.qrmNomAutoriza.Lines.Add(NombreAutoriza);
                Rep.lbCtto.Caption := IntToStr(StrToInt(Copy(FloatToStr(Contrato_Asoc),3,7)));
                Base:= Rep.ContratoRef;
		if Preview then Rep.Preview
		else Rep.Print;
	finally
		If Rep <> nil Then Rep.Free;
	end;
end;

procedure TRepIlineConvenioBco.RepIlineConvenioBcoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var Mes : String;
    Anio : String;
begin
//	lbNomRepresentante.Caption:= InterFrame.FieldByName('NOM_CLIENTE').asString;
        lbDias.Caption := copy(DatetoStr(Date),1,2);
        If copy(DatetoStr(Date),4,2) = '01' Then
           Mes := 'Enero'
        Else
           If copy(DatetoStr(Date),4,2) = '02' Then
              Mes :='Febrero'
           Else
              If copy(DatetoStr(Date),4,2) = '03' Then
                 Mes :='Marzo'
              Else
                  If copy(DatetoStr(Date),4,2) = '04' Then
                    Mes :='Abril'
                  Else
                     If copy(DatetoStr(Date),4,2) = '05' Then
                       Mes :='Mayo'
                     Else
                        If copy(DatetoStr(Date),4,2) = '06' Then
                          Mes :='Junio'
                        Else
                           If copy(DatetoStr(Date),4,2) = '07' Then
                             Mes :='Julio'
                           Else
                              If copy(DatetoStr(Date),4,2) = '08' Then
                                Mes :='Agosto'
                              Else
                                 If copy(DatetoStr(Date),4,2) = '09' Then
                                   Mes :='Septiembre'
                                 Else
                                 If copy(DatetoStr(Date),4,2) = '10' Then
                                   Mes :='Octubre'
                                 Else
                                    If copy(DatetoStr(Date),4,2) = '11' Then
                                      Mes :='Noviembre'
                                    Else
                                      Mes :='Diciembre';
        lbMes.Caption := Mes;
        lbAnio.Caption := copy(DatetoStr(Date),7,4);;
	lbPiePagina.Caption:= InterFrame.FieldByName('LEYENDA_PIE').asString;


//	MemoLeyenda.Parametro.Add(InterFrame.FieldByName('NOM_CLIENTE').asString);
end;

end.


