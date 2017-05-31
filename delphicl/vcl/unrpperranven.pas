unit UnRpPerRanVen;
//------------------------------------------------------------------------------
//  Reporte de Rangos de Ingreso
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
  TqrPerRanVen = class(TQuickRep)
    qPerRanVen: TQuery;
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    bDetalle: TQRBand;
    qriePerRanVen: TQRInterEncabezado;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    qPerRanVenID_RANGO_VENTAS: TFloatField;
    qPerRanVenMONTO_MAXIMO: TFloatField;
  private

  public
    Apli : TInterApli;
  end;

var
  qrPerRanVen : TqrPerRanVen;
  procedure EXECUTE_RP_PERRANVEN(pApli: TInterApli; pVerImprimir: String);

implementation

{$R *.DFM}

procedure EXECUTE_RP_PERRANVEN(pApli: TInterApli; pVerImprimir: String);
var
  qrPerRanVen: TqrPerRanVen;
begin
  qrPerRanVen := TqrPerRanVen.Create(Nil);
  with qrPerRanVen do
  try
    Apli                    := pApli;
    qriePerRanVen.Apli      := Apli;
    qPerRanVen.DatabaseName := Apli.DataBaseName;
    qPerRanVen.SessionName  := Apli.SessionName;
    qPerRanVen.Open;
    if pVerImprimir = 'Ver' then
    begin
      if qPerRanVen.IsEmpty then
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
      if not(qPerRanVen.IsEmpty) then
      begin
        Print;
      end;
    end;
  finally
    qPerRanVen.Close;
    Free;
  end;
end;

end.
