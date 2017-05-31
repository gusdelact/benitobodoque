//------------------------------------------------------------------------------
// Función    : Acuse de Recibo (Cancelación de Contrato)
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 18 de Febrero del 2015
//------------------------------------------------------------------------------
unit unRpAcuseRec;

interface

uses
   Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls,
   ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, Db, DBTables, InterMemo,
   jpeg, U_InterCustomStar, U_InterDigDoc;

type
  TRpAcuseRec = class(TQuickRep)
    qReporte: TQuery;
    DetailBand1: TQRBand;
    QRRichText: TQRRichText;
    TitleBand1: TQRBand;
    QRDBText4: TQRDBText;
    InterDigDoc: TInterDigDoc;
    QRLabel1: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   RpAcuseRec: TRpAcuseRec;
implementation
   {$R *.DFM}
end.
