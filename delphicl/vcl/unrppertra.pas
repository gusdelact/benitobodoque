//------------------------------------------------------------------------------
// Función    : Proemio de Convenio Perfil Transccional
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 29 de Noviembre del 2010
//------------------------------------------------------------------------------

unit UnRpPerTra;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
     Forms, Quickrpt, QRCtrls, InterMemo, Db, DBTables,Dialogs;

type
  TrpPerTra = class(TQuickRep)
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRInterMemo2: TQRInterMemo;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRInterMemo4: TQRInterMemo;
    QRInterMemo5: TQRInterMemo;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRInterMemo9: TQRInterMemo;
    QRInterMemo10: TQRInterMemo;
    QRInterMemo6: TQRInterMemo;
    QryCtto: TQuery;
    QryCttoID_CONTRATO: TFloatField;
    QryCttoID_TITULAR: TFloatField;
    QryCttoNOMBRE: TStringField;
    QryCttoFECHA: TStringField;
    QryCttoCORREO: TStringField;
    QRInterMemo14: TQRInterMemo;
    QRLabel9: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel22: TQRLabel;
    QRInterMemo24: TQRInterMemo;
    QRLabel12: TQRLabel;
    QRInterMemo25: TQRInterMemo;
    QRLabel16: TQRLabel;
    QRInterMemo26: TQRInterMemo;
    QRInterMemo27: TQRInterMemo;
    QRLabel10: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
  private

  public

  end;

var
  rpPerTra: TrpPerTra;

implementation
   {$R *.DFM}
end.
