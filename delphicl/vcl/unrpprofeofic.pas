unit UnRpProfeOfic;
//------------------------------------------------------------------------------
//  Reporte de Profesiones u Oficios
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
  TqrProfeOfic = class(TQuickRep)
    qProfeOfic: TQuery;
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    bDetalle: TQRBand;
    qrieProfeOfic: TQRInterEncabezado;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    qProfeOficID_PROFESION: TFloatField;
    qProfeOficDESC_PROFESION: TStringField;
  private

  public
    Apli : TInterApli;
  end;

var
  qrProfeOfic : TqrProfeOfic;
  procedure EXECUTE_RP_PROFEOFIC(pApli: TInterApli; pVerImprimir: String);

implementation

{$R *.DFM}

procedure EXECUTE_RP_PROFEOFIC(pApli: TInterApli; pVerImprimir: String);
var
  qrProfeOfic: TqrProfeOfic;
begin
  qrProfeOfic := TqrProfeOfic.Create(Nil);
  with qrProfeOfic do
  try
    Apli                    := pApli;
    qrieProfeOfic.Apli      := Apli;
    qProfeOfic.DatabaseName := Apli.DataBaseName;
    qProfeOfic.SessionName  := Apli.SessionName;
    qProfeOfic.Open;
    if pVerImprimir = 'Ver' then
    begin
      if qProfeOfic.IsEmpty then
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
      if not(qProfeOfic.IsEmpty) then
      begin
        Print;
      end;
    end;
  finally
    qProfeOfic.Close;
    Free;
  end;
end;

end.
