unit UnRpPerRefBan;
//------------------------------------------------------------------------------
//  Reporte de referencias bancarias
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
  TqrPerRefBan = class(TQuickRep)
    qPerRefBan: TQuery;
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    bDetalle: TQRBand;
    qriePerRefBan: TQRInterEncabezado;
    qrdtID_PERSONA: TQRDBText;
    qrdtNOMBRE_PER: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    qrdtID_INTERMEDIARIO: TQRDBText;
    qrdtNOMBRE_INT: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    qPerRefBanID_PERSONA: TFloatField;
    qPerRefBanNOMBRE_PER: TStringField;
    qPerRefBanID_INTERMEDIARIO: TFloatField;
    qPerRefBanNOMBRE_INT: TStringField;
    qPerRefBanCUENTA_BANCO: TStringField;
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroup2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure bDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    Apli               : TInterApli;
    vgBPersonaNva      : Boolean;
    vgBIntermediaroNvo : Boolean;
  end;

var
  qrPerRefBan : TqrPerRefBan;
  procedure EXECUTE_RP_PERREFBAN(pApli: TInterApli; pVerImprimir: String;
        pIdPersona: Integer);

implementation

{$R *.DFM}

procedure EXECUTE_RP_PERREFBAN(pApli: TInterApli; pVerImprimir: String;
        pIdPersona: Integer);
var
  qrPerRefBan: TqrPerRefBan;
begin
  qrPerRefBan := TqrPerRefBan.Create(Nil);
  with qrPerRefBan do
  try
    Apli                    := pApli;
    qriePerRefBan.Apli      := Apli;
    qPerRefBan.DatabaseName := Apli.DataBaseName;
    qPerRefBan.SessionName  := Apli.SessionName;
    qPerRefBan.ParamByName('pIdPersona').AsInteger := pIdPersona;
    qPerRefBan.Open;
    if pVerImprimir = 'Ver' then
    begin
      if qPerRefBan.IsEmpty then
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
      if not(qPerRefBan.IsEmpty) then
      begin
        Print;
      end;
    end;
  finally
    qPerRefBan.Close;
    Free;
  end;
end;

procedure TqrPerRefBan.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  { Persona Nueva }
  vgBPersonaNva := True;
end;

procedure TqrPerRefBan.QRGroup2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  { Intermediaro Nueva }
  vgBIntermediaroNvo := True;
end;

procedure TqrPerRefBan.bDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  { Si es una persona nueva imprimir el número y nombre }
  qrdtID_PERSONA.Enabled := vgBPersonaNva;
  qrdtNOMBRE_PER.Enabled := vgBPersonaNva;
  { Si es un intermediario nuevo imprimir el número y nombre }
  qrdtID_INTERMEDIARIO.Enabled := vgBIntermediaroNvo;
  qrdtNOMBRE_INT.Enabled       := vgBIntermediaroNvo;
  { Apaga Banderas }
  vgBPersonaNva      := False;
  vgBIntermediaroNvo := False;
end;

end.
