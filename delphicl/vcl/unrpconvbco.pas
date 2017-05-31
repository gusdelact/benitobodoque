//------------------------------------------------------------------------------
// Función    : Proemio de Convenio para Envío de Estados de Cuenta por Medios Electrónicos (BCO)
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 09 de Noviembre del 2010
//------------------------------------------------------------------------------

unit UnRpConvBco;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
     Forms, Quickrpt, QRCtrls, InterMemo, Db, DBTables,Dialogs;

type
  TrpConvBco = class(TQuickRep)
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
    QRLabel11: TQRLabel;
    QRInterMemo9: TQRInterMemo;
    QRInterMemo10: TQRInterMemo;
    QRInterMemo6: TQRInterMemo;
    QRInterMemo7: TQRInterMemo;
    QRInterMemo8: TQRInterMemo;
    QRInterMemo11: TQRInterMemo;
    QRInterMemo12: TQRInterMemo;
    QRInterMemo13: TQRInterMemo;
    QryCtto: TQuery;
    QryCttoID_CONTRATO: TFloatField;
    QryCttoID_TITULAR: TFloatField;
    QryCttoNOMBRE: TStringField;
    QryCttoFECHA: TStringField;
    QryCttoCORREO: TStringField;
    QRChildBand1: TQRChildBand;
    QRInterMemo21: TQRInterMemo;
    QRInterMemo22: TQRInterMemo;
    QRInterMemo23: TQRInterMemo;
    QRInterMemo24: TQRInterMemo;
    QRInterMemo25: TQRInterMemo;
    QRInterMemo26: TQRInterMemo;
    QRInterMemo27: TQRInterMemo;
    QRLabel10: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRInterMemo14: TQRInterMemo;
    QRLabel9: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel23: TQRLabel;
    QRInterMemo1: TQRInterMemo;
    QRInterMemo15: TQRInterMemo;
    QRLabel24: TQRLabel;
  private

  public

  end;

var
  rpConvBco: TrpConvBco;

implementation
   {$R *.DFM}
end.
