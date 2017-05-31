unit RepCttoAcuAnexos;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, InterMemo;

type
  TqrAcuAnexos = class(TQuickRep)
    QRBand1: TQRBand;
    ChildBand1: TQRChildBand;
    QRShape2: TQRShape;
    QRLabel68: TQRLabel;
    DetailBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRMacvMemo3: TQRMacvMemo;
    QRMacvMemo4: TQRMacvMemo;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrlContrato: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    qrlFechaCont: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public
      Fecha     : String;
      Hora      : String;
      Represen  : String;
      Leyenda2  : String;
      NombrePersona : String;
      dmPorta   : TDataModule
  end;

var
  qrAcuAnexos: TqrAcuAnexos;

implementation

uses DmCttoEstado;

{$R *.DFM}

procedure TqrAcuAnexos.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
{   qrlNomRepres.Caption   :=Represen;
   qrlPiePagina.Caption   :=Leyenda2;
   qrlNomEmpFec.Caption   := NombrePersona + ' EL ' + Fecha + '.'; }
end;

end.
