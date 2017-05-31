unit RepCttoMandat;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, InterMemo;

type
  TqrMandato = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    qrlPiePagina: TQRLabel;
    ChildBand1: TQRChildBand;
    QRShape2: TQRShape;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    qrlNomEmp: TQRLabel;
    QRMacvMemo1: TQRMacvMemo;
    DetailBand1: TQRBand;
    qrmNomRepresenta: TQRMemo;
    qrlContratoFecha: TQRLabel;
    procedure qrMandatoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public
      Contrato  : String;
      Fecha     : String;
      Hora      : String;
      Represen  : String;
      Leyenda2  : String;
      NombrePersona : String;
      dmPorta   : TDataModule
  end;

var
  qrMandato: TqrMandato;

implementation

uses DmCttoEstado;

{$R *.DFM}



procedure TqrMandato.qrMandatoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
				   //Asigna los valores por default
   qrmNomRepresenta.Lines.Clear;
   qrmNomRepresenta.Lines.Add(Represen);
   qrlPiePagina.Caption:=Leyenda2;
   qrlNomEmp.Caption:= 'Y ' + NombrePersona + ',';
   qrlContratoFecha.Caption:= 'CON NÚMERO  ' + Contrato + '  DE FECHA  ' + Fecha;
end;


end.
