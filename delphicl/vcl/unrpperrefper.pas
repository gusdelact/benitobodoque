unit UnRpPerRefPer;
//------------------------------------------------------------------------------
//  Reporte de referencias personales
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
  TqrPerRefPer = class(TQuickRep)
    qPerRefPer: TQuery;
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    bDetalle: TQRBand;
    qriePerRefPer: TQRInterEncabezado;
    qrdtID_PERSONA: TQRDBText;
    qrdtNOMBRE_PER: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrdtNOMBRE_INT: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    qPerRefPerID_PERSONA: TFloatField;
    qPerRefPerID_REF_PERSONA: TFloatField;
    qPerRefPerAPELLIDO_PATERNO: TStringField;
    qPerRefPerAPELLIDO_MATERNO: TStringField;
    qPerRefPerNOMBRE_PERSONA: TStringField;
    qPerRefPerDOMICILIO: TStringField;
    qPerRefPerTELEFONO: TStringField;
    qPerRefPerREL_CON_PERSONA: TStringField;
    qPerRefPerNOMBRE_PER: TStringField;
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure bDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    Apli               : TInterApli;
    vgBPersonaNva      : Boolean;
  end;

var
  qrPerRefPer : TqrPerRefPer;
  procedure EXECUTE_RP_PERREFPER(pApli: TInterApli; pVerImprimir: String;
        pIdPersona: Integer);

implementation

{$R *.DFM}

procedure EXECUTE_RP_PERREFPER(pApli: TInterApli; pVerImprimir: String;
        pIdPersona: Integer);
var
  qrPerRefPer: TqrPerRefPer;
begin
  qrPerRefPer := TqrPerRefPer.Create(Nil);
  with qrPerRefPer do
  try
    Apli                    := pApli;
    qriePerRefPer.Apli      := Apli;
    qPerRefPer.DatabaseName := Apli.DataBaseName;
    qPerRefPer.SessionName  := Apli.SessionName;
    qPerRefPer.ParamByName('pIdPersona').AsInteger := pIdPersona;
    
    qPerRefPer.Open;
    if pVerImprimir = 'Ver' then
    begin
      if qPerRefPer.IsEmpty then
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
      if not(qPerRefPer.IsEmpty) then
      begin
        Print;
      end;
    end;
  finally
    qPerRefPer.Close;
    Free;
  end;
end;

procedure TqrPerRefPer.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  { Persona Nueva }
  vgBPersonaNva := True;
end;

procedure TqrPerRefPer.bDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  { Si es una persona nueva imprimir el número y nombre }
  qrdtID_PERSONA.Enabled := vgBPersonaNva;
  qrdtNOMBRE_PER.Enabled := vgBPersonaNva;
  { Apaga Banderas }
  vgBPersonaNva      := False;
end;

end.
