unit UnRpPerEmpre;
//------------------------------------------------------------------------------
//  Reporte de información de las empresas
//  Realizó  : Carlos Adrian Mejía Ledón
//  Fecha    : Noviembre 2003
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  InterApl, IntHead, UnGene;

type
  TqrPerEmpre = class(TQuickRep)
    qPerEmpre: TQuery;
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    bDetalle: TQRBand;
    qriePerEmpre: TQRInterEncabezado;
    qrdtID_PERSONA: TQRDBText;
    qrdtNOMBRE_PER: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qPerEmpreID_PERSONA: TFloatField;
    qPerEmpreNOMBRE: TStringField;
    qPerEmpreID_RANGO_NO_EMPL: TFloatField;
    qPerEmpreMAXIMO: TFloatField;
    qPerEmpreID_RANGO_VENTAS: TFloatField;
    qPerEmpreMONTO_MAXIMO: TFloatField;
    qPerEmpreCVE_COB_GEOG: TStringField;
    qPerEmpreDESC_COB_GEOG: TStringField;
    qPerEmpreNUM_SUCURSALES: TFloatField;
    qPerEmpreIMP_ACTIVO: TFloatField;
    qPerEmpreIMP_PASIVO: TFloatField;
    qPerEmpreIMP_CAPITAL: TFloatField;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
  private

  public
    Apli               : TInterApli;
  end;

var
  qrPerEmpre : TqrPerEmpre;
  procedure EXECUTE_RP_PEREMPRE(pApli: TInterApli; pVerImprimir: String;
        pIdPersona: Integer);

implementation

{$R *.DFM}

procedure EXECUTE_RP_PEREMPRE(pApli: TInterApli; pVerImprimir: String;
        pIdPersona: Integer);
var
  qrPerEmpre: TqrPerEmpre;
begin
  qrPerEmpre := TqrPerEmpre.Create(Nil);
  with qrPerEmpre do
  try
    Apli                   := pApli;
    qriePerEmpre.Apli      := Apli;
    qPerEmpre.DatabaseName := Apli.DataBaseName;
    qPerEmpre.SessionName  := Apli.SessionName;
    qPerEmpre.ParamByName('pIdPersona').AsInteger := pIdPersona;
    qPerEmpre.Open;
    if pVerImprimir = 'Ver' then
    begin
      if qPerEmpre.IsEmpty then
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
      if not(qPerEmpre.IsEmpty) then
      begin
        Print;
      end;
    end;
  finally
    qPerEmpre.Close;
    Free;
  end;
end;

end.
