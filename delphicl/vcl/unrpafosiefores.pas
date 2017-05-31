//------------------------------------------------------------------------------
// Función    : Proemio de Convenio para Afores y Siefores (ómnibus)
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 08 de Abril del 2011
//------------------------------------------------------------------------------

unit UnRpAfoSiefores;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
     Forms, Quickrpt, QRCtrls, InterMemo, Db, DBTables,Dialogs;

type
  TRpAfoSiefores = class(TQuickRep)
    QRBand2: TQRBand;
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
    QRInterMemo14: TQRInterMemo;
    QRLabel9: TQRLabel;
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
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel3: TQRLabel;
    QRInterMemo1: TQRInterMemo;
    QRLabel29: TQRLabel;
    QRInterMemo3: TQRInterMemo;
    QRLabel6: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
  private

  public

  end;

var
  RpAfoSiefores: TRpAfoSiefores;

implementation
   {$R *.DFM}
end.
