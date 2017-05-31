unit UnRpPerRanEmp;
//------------------------------------------------------------------------------
//  Reporte de Rangos de Empleados
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
  TqrPerRanEmp = class(TQuickRep)
    qPerRanEmp: TQuery;
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    bDetalle: TQRBand;
    qriePerRanEmp: TQRInterEncabezado;
    QRDBText18: TQRDBText;
    qPerRanEmpID_RANGO_NO_EMPL: TFloatField;
    qPerRanEmpMAXIMO: TFloatField;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
  private

  public
    Apli : TInterApli;
  end;

var
  qrPerRanEmp : TqrPerRanEmp;
  procedure EXECUTE_RP_PERRANEMP(pApli: TInterApli; pVerImprimir: String);

implementation

{$R *.DFM}

procedure EXECUTE_RP_PERRANEMP(pApli: TInterApli; pVerImprimir: String);
var
  qrPerRanEmp: TqrPerRanEmp;
begin
  qrPerRanEmp := TqrPerRanEmp.Create(Nil);
  with qrPerRanEmp do
  try
    Apli                    := pApli;
    qriePerRanEmp.Apli      := Apli;
    qPerRanEmp.DatabaseName := Apli.DataBaseName;
    qPerRanEmp.SessionName  := Apli.SessionName;
    qPerRanEmp.Open;
    if pVerImprimir = 'Ver' then
    begin
      if qPerRanEmp.IsEmpty then
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
      if not(qPerRanEmp.IsEmpty) then
      begin
        Print;
      end;
    end;
  finally
    qPerRanEmp.Close;
    Free;
  end;
end;

end.
