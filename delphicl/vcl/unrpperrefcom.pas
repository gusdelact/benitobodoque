unit UnRpPerRefCom;
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
  TqrPerRefCom = class(TQuickRep)
    qPerRefCom: TQuery;
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    bDetalle: TQRBand;
    qriePerRefCom: TQRInterEncabezado;
    qrdtID_PERSONA: TQRDBText;
    qrdtNOMBRE_PER: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrdtID_INTERMEDIARIO: TQRDBText;
    qrdtNOMBRE_INT: TQRDBText;
    QRGroup1: TQRGroup;
    qPerRefComID_PERSONA: TFloatField;
    qPerRefComID_REF_COMERCIAL: TFloatField;
    qPerRefComNOMBRE: TStringField;
    qPerRefComDOMICILIO: TStringField;
    qPerRefComTELEFONO: TStringField;
    qPerRefComNOMBRE_PER: TStringField;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText3: TQRDBText;
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
  qrPerRefCom : TqrPerRefCom;
  procedure EXECUTE_RP_PERREFCOM(pApli: TInterApli; pVerImprimir: String;
        pIdPersona: Integer);

implementation

{$R *.DFM}

procedure EXECUTE_RP_PERREFCOM(pApli: TInterApli; pVerImprimir: String;
        pIdPersona: Integer);
var
  qrPerRefCom: TqrPerRefCom;
begin
  qrPerRefCom := TqrPerRefCom.Create(Nil);
  with qrPerRefCom do
  try
    Apli                    := pApli;
    qriePerRefCom.Apli      := Apli;
    qPerRefCom.DatabaseName := Apli.DataBaseName;
    qPerRefCom.SessionName  := Apli.SessionName;
    qPerRefCom.ParamByName('pIdPersona').AsInteger := pIdPersona;
    qPerRefCom.Open;
    if pVerImprimir = 'Ver' then
    begin
      if qPerRefCom.IsEmpty then
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
      if not(qPerRefCom.IsEmpty) then
      begin
        Print;
      end;
    end;
  finally
    qPerRefCom.Close;
    Free;
  end;
end;

procedure TqrPerRefCom.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  { Persona Nueva }
  vgBPersonaNva := True;
end;

procedure TqrPerRefCom.bDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  { Si es una persona nueva imprimir el número y nombre }
  qrdtID_PERSONA.Enabled := vgBPersonaNva;
  qrdtNOMBRE_PER.Enabled := vgBPersonaNva;
  { Apaga Banderas }
  vgBPersonaNva      := False;
end;

end.
