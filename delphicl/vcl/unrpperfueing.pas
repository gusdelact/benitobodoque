unit UnRpPerFueIng;
//------------------------------------------------------------------------------
//  Reporte Fuentes de Ingreso
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
  TqrPerFueIng = class(TQuickRep)
    qPerFueIng: TQuery;
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    bDetalle: TQRBand;
    qriePerFueIng: TQRInterEncabezado;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    qPerFueIngID_FUENTE_INGR: TFloatField;
    qPerFueIngDESC_FUENTE_INGR: TStringField;
  private

  public
    Apli : TInterApli;
  end;

var
  qrPerFueIng : TqrPerFueIng;
  procedure EXECUTE_RP_PERFUEING(pApli: TInterApli; pVerImprimir: String);

implementation

{$R *.DFM}

procedure EXECUTE_RP_PERFUEING(pApli: TInterApli; pVerImprimir: String);
var
  qrPerFueIng: TqrPerFueIng;
begin
  qrPerFueIng := TqrPerFueIng.Create(Nil);
  with qrPerFueIng do
  try
    Apli                    := pApli;
    qriePerFueIng.Apli      := Apli;
    qPerFueIng.DatabaseName := Apli.DataBaseName;
    qPerFueIng.SessionName  := Apli.SessionName;
    qPerFueIng.Open;
    if pVerImprimir = 'Ver' then
    begin
      if qPerFueIng.IsEmpty then
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
      if not(qPerFueIng.IsEmpty) then
      begin
        Print;
      end;
    end;
  finally
    qPerFueIng.Close;
    Free;
  end;
end;

end.
