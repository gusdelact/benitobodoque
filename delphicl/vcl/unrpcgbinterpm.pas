unit UnRpCGBinterPM;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, InterMemo, Db, DBTables,Dialogs;

type
  TrpCGBPM = class(TQuickRep)
    QRBand2: TQRBand;
    QRInterMemo2: TQRInterMemo;
    QryCtto: TQuery;
    QryCttoID_CONTRATO: TFloatField;
    QryCttoID_TITULAR: TFloatField;
    QryCttoNOMBRE: TStringField;
    QryCttoFECHA: TStringField;
    QryCttoCORREO: TStringField;
    QRChildBand1: TQRChildBand;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel42: TQRLabel;
    QRInterMemo1: TQRInterMemo;
    QRFecha: TQRLabel;
    QRLEmpresa: TQRLabel;
    function    Reporte:Boolean; //override;
  private

  public

  end;

var
  rpCGBPM: TrpCGBPM;

implementation

{$R *.DFM}

function TrpCGBPM.Reporte:Boolean;
begin
  ShowMessage('ip...');
end;


end.
