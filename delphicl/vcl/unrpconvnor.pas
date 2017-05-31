unit UnRpConvNor;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, InterMemo, Db, DBTables;

type
  TRpConvNor = class(TQuickRep)
    Qryctto: TQuery;
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRInterMemo2: TQRInterMemo;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRInterMemo3: TQRInterMemo;
    QRLabel7: TQRLabel;
    QRInterMemo4: TQRInterMemo;
    QRInterMemo5: TQRInterMemo;
    QRLabel8: TQRLabel;
    QRInterMemo6: TQRInterMemo;
    QRLabel9: TQRLabel;
    QRInterMemo7: TQRInterMemo;
    QRLabel10: TQRLabel;
    QRInterMemo8: TQRInterMemo;
    QRLabel11: TQRLabel;
    QRInterMemo9: TQRInterMemo;
    QRInterMemo10: TQRInterMemo;
    QrycttoID_CONTRATO: TFloatField;
    QrycttoID_TITULAR: TFloatField;
    QrycttoNOMBRE: TStringField;
    QrycttoFECHA: TStringField;
    QrycttoREPRESENTANTE: TStringField;
    QRChildBand1: TQRChildBand;
    QRInterMemo11: TQRInterMemo;
    QRInterMemo12: TQRInterMemo;
    QRInterMemo13: TQRInterMemo;
    QRInterMemo14: TQRInterMemo;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QREfirmaCasaBolsa: TQRExpr;
    QREfirmaCliente: TQRExpr;
    QRLabel15: TQRLabel;
    QRLabel13: TQRLabel;
    QRInterMemo15: TQRInterMemo;
    QRLabel17: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRExpr3: TQRExpr;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  RpConvNor: TRpConvNor;

implementation

{$R *.DFM}


procedure TRpConvNor.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRInterMemo15.Parametro.Strings[0]:= Qryctto.FieldByName('REPRESENTANTE').AsString;
end;

end.
