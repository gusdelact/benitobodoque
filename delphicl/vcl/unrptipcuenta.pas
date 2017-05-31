unit UnRpTipCuenta;
//------------------------------------------------------------------------------
//  Reporte de Tipos de Cuenta
//  Realizó  : Eva Martinez Hernández
//  Fecha    : Noviembre 2003
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  InterApl, IntHead, UnGene;

type
  TqrTipCuenta = class(TQuickRep)
    qTipCuenta: TQuery;
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    bDetalle: TQRBand;
    qrieTipCuenta: TQRInterEncabezado;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    qTipCuentaCVE_TIPO_CUENTA: TStringField;
    qTipCuentaDESC_TIPO_CUENTA: TStringField;
  private

  public
    Apli : TInterApli;
  end;

var
  qrTipCuenta : TqrTipCuenta;
  procedure EXECUTE_RP_TIPCUENTA(pApli: TInterApli; pVerImprimir: String);

implementation

{$R *.DFM}

procedure EXECUTE_RP_TIPCUENTA(pApli: TInterApli; pVerImprimir: String);
var
  qrTipCuenta: TqrTipCuenta;
begin
  qrTipCuenta := TqrTipCuenta.Create(Nil);
  with qrTipCuenta do
  try
    Apli                    := pApli;
    qrieTipCuenta.Apli      := Apli;
    qTipCuenta.DatabaseName := Apli.DataBaseName;
    qTipCuenta.SessionName  := Apli.SessionName;
    qTipCuenta.Open;
    if pVerImprimir = 'Ver' then
    begin
      if qTipCuenta.IsEmpty then
      begin
        InterMsg(tmInformacion,'',0,'No existe información para ser presentada.')
      end
      else
      begin
        Preview;
      end;
    end
    else if pVerImprimir = 'Imprimir' then
    begin
      if not(qTipCuenta.IsEmpty) then
      begin
        Print;
      end;
    end;
  finally
    qTipCuenta.Close;
    Free;
  end;
end;

end.
