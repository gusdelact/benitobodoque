unit UnRpCtoOriRec;
//------------------------------------------------------------------------------
//  Reporte de Origenes de Recursos
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
  TqrCtoOriRec = class(TQuickRep)
    qCtoOriRec: TQuery;
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    bDetalle: TQRBand;
    qrieCtoOriRec: TQRInterEncabezado;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    qCtoOriRecID_ORIGEN_REC: TFloatField;
    qCtoOriRecDESC_ORIGEN_REC: TStringField;
  private

  public
    Apli : TInterApli;
  end;

var
  qrCtoOriRec : TqrCtoOriRec;
  procedure EXECUTE_RP_CTOORIREC(pApli: TInterApli; pVerImprimir: String);

implementation

{$R *.DFM}

procedure EXECUTE_RP_CTOORIREC(pApli: TInterApli; pVerImprimir: String);
var
  qrCtoOriRec: TqrCtoOriRec;
begin
  qrCtoOriRec := TqrCtoOriRec.Create(Nil);
  with qrCtoOriRec do
  try
    Apli                    := pApli;
    qrieCtoOriRec.Apli      := Apli;
    qCtoOriRec.DatabaseName := Apli.DataBaseName;
    qCtoOriRec.SessionName  := Apli.SessionName;
    qCtoOriRec.Open;
    if pVerImprimir = 'Ver' then
    begin
      if qCtoOriRec.IsEmpty then
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
      if not(qCtoOriRec.IsEmpty) then
      begin
        Print;
      end;
    end;
  finally
    qCtoOriRec.Close;
    Free;
  end;
end;

end.
