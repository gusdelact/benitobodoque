unit UnRpCtoDesRec;
//------------------------------------------------------------------------------
//  Reporte de Destino de Recursos
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
  TqrCtoDesRec = class(TQuickRep)
    qCtoDesRec: TQuery;
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    bDetalle: TQRBand;
    qrieCtoDesRec: TQRInterEncabezado;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    qCtoDesRecID_DESTINO_REC: TFloatField;
    qCtoDesRecDESC_DESTINO_REC: TStringField;
  private

  public
    Apli : TInterApli;
  end;

var
  qrCtoDesRec : TqrCtoDesRec;
  procedure EXECUTE_RP_CTODESREC(pApli: TInterApli; pVerImprimir: String);

implementation

{$R *.DFM}

procedure EXECUTE_RP_CTODESREC(pApli: TInterApli; pVerImprimir: String);
var
  qrCtoDesRec: TqrCtoDesRec;
begin
  qrCtoDesRec := TqrCtoDesRec.Create(Nil);
  with qrCtoDesRec do
  try
    Apli                    := pApli;
    qrieCtoDesRec.Apli      := Apli;
    qCtoDesRec.DatabaseName := Apli.DataBaseName;
    qCtoDesRec.SessionName  := Apli.SessionName;
    qCtoDesRec.Open;
    if pVerImprimir = 'Ver' then
    begin
      if qCtoDesRec.IsEmpty then
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
      if not(qCtoDesRec.IsEmpty) then
      begin
        Print;
      end;
    end;
  finally
    qCtoDesRec.Close;
    Free;
  end;
end;

end.
