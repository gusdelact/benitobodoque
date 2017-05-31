unit UnRpPerRanIng;
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
  TqrPerRanIng = class(TQuickRep)
    qPerRanIng: TQuery;
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    bDetalle: TQRBand;
    qriePerRanIng: TQRInterEncabezado;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    qPerRanIngID_RANGO_INGRESO: TFloatField;
    qPerRanIngMONTO_MAXIMO: TFloatField;
  private

  public
    Apli : TInterApli;
  end;

var
  qrPerRanIng : TqrPerRanIng;
  procedure EXECUTE_RP_PERRANING(pApli: TInterApli; pVerImprimir: String);

implementation

{$R *.DFM}

procedure EXECUTE_RP_PERRANING(pApli: TInterApli; pVerImprimir: String);
var
  qrPerRanIng: TqrPerRanIng;
begin
  qrPerRanIng := TqrPerRanIng.Create(Nil);
  with qrPerRanIng do
  try
    Apli                    := pApli;
    qriePerRanIng.Apli      := Apli;
    qPerRanIng.DatabaseName := Apli.DataBaseName;
    qPerRanIng.SessionName  := Apli.SessionName;
    qPerRanIng.Open;
    if pVerImprimir = 'Ver' then
    begin
      if qPerRanIng.IsEmpty then
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
      if not(qPerRanIng.IsEmpty) then
      begin
        Print;
      end;
    end;
  finally
    qPerRanIng.Close;
    Free;
  end;
end;

end.
