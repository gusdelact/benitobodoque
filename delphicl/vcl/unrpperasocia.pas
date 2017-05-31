unit UnRpPerAsocia;
//------------------------------------------------------------------------------
//  Reporte de referencias comerciales
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
  TqrPerAsocia = class(TQuickRep)
    qPerAsocia: TQuery;
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    bDetalle: TQRBand;
    qriePerAsocia: TQRInterEncabezado;
    qrdtID_PERSONA: TQRDBText;
    qrdtNOMBRE_PER: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrdtID_INTERMEDIARIO: TQRDBText;
    qrdtNOMBRE_INT: TQRDBText;
    QRGroup1: TQRGroup;
    qPerAsociaID_PERSONA: TFloatField;
    qPerAsociaNOMBRE_PER: TStringField;
    qPerAsociaID_PERS_ASOCIA: TFloatField;
    qPerAsociaNOMBRE_ASO: TStringField;
    qPerAsociaPCT_PARTICIPA: TFloatField;
    QRDBText1: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
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
  qrPerAsocia : TqrPerAsocia;
  procedure EXECUTE_RP_PERASOCIA(pApli: TInterApli; pVerImprimir: String;
        pIdPersona: Integer);

implementation

{$R *.DFM}

procedure EXECUTE_RP_PERASOCIA(pApli: TInterApli; pVerImprimir: String;
        pIdPersona: Integer);
var
  qrPerAsocia: TqrPerAsocia;
begin
  qrPerAsocia := TqrPerAsocia.Create(Nil);
  with qrPerAsocia do
  try
    Apli                    := pApli;
    qriePerAsocia.Apli      := Apli;
    qPerAsocia.DatabaseName := Apli.DataBaseName;
    qPerAsocia.SessionName  := Apli.SessionName;
    qPerAsocia.ParamByName('pIdPersona').AsInteger := pIdPersona;
    qPerAsocia.Open;
    if pVerImprimir = 'Ver' then
    begin
      if qPerAsocia.IsEmpty then
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
      if not(qPerAsocia.IsEmpty) then
      begin
        Print;
      end;
    end;
  finally
    qPerAsocia.Close;
    Free;
  end;
end;

procedure TqrPerAsocia.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  { Persona Nueva }
  vgBPersonaNva := True;
end;

procedure TqrPerAsocia.bDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  { Si es una persona nueva imprimir el número y nombre }
  qrdtID_PERSONA.Enabled := vgBPersonaNva;
  qrdtNOMBRE_PER.Enabled := vgBPersonaNva;
  { Apaga Banderas }
  vgBPersonaNva      := False;
end;

end.
