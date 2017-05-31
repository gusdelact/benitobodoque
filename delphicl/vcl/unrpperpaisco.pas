unit UnRpPerPaisCo;
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
  TqrPerPaisCo = class(TQuickRep)
    qPerPaisCo: TQuery;
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    bDetalle: TQRBand;
    qriePerPaisCo: TQRInterEncabezado;
    qrdtID_PERSONA: TQRDBText;
    qrdtNOMBRE_PER: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrdtCVE_POBLACION: TQRDBText;
    qrdtDESC_POBLACION: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    qPerPaisCoID_PERSONA: TFloatField;
    qPerPaisCoNOMBRE: TStringField;
    qPerPaisCoCVE_POBLACION: TStringField;
    qPerPaisCoDESC_POBLACION: TStringField;
    qPerPaisCoB_IMPORTA: TStringField;
    qPerPaisCoDESC_IMPORTA: TStringField;
    qPerPaisCoB_EXPORTA: TStringField;
    qPerPaisCoDESC_EXPORTA: TStringField;
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
    vgBPoblacionNvo    : Boolean;
  end;

var
  qrPerPaisCo : TqrPerPaisCo;
  procedure EXECUTE_RP_PERPAISCO(pApli: TInterApli; pVerImprimir: String;
        pIdPersona: Integer);

implementation

{$R *.DFM}

procedure EXECUTE_RP_PERPAISCO(pApli: TInterApli; pVerImprimir: String;
        pIdPersona: Integer);
var
  qrPerPaisCo: TqrPerPaisCo;
begin
  qrPerPaisCo := TqrPerPaisCo.Create(Nil);
  with qrPerPaisCo do
  try
    Apli                    := pApli;
    qriePerPaisCo.Apli      := Apli;
    qPerPaisCo.DatabaseName := Apli.DataBaseName;
    qPerPaisCo.SessionName  := Apli.SessionName;
    qPerPaisCo.ParamByName('pIdPersona').AsInteger := pIdPersona;
    qPerPaisCo.Open;
    if pVerImprimir = 'Ver' then
    begin
      if qPerPaisCo.IsEmpty then
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
      if not(qPerPaisCo.IsEmpty) then
      begin
        Print;
      end;
    end;
  finally
    qPerPaisCo.Close;
    Free;
  end;
end;

procedure TqrPerPaisCo.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  { Persona Nueva }
  vgBPersonaNva := True;
end;

procedure TqrPerPaisCo.QRGroup2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  { Intermediaro Nueva }
  vgBPoblacionNvo := True;
end;

procedure TqrPerPaisCo.bDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  { Si es una persona nueva imprimir el número y nombre }
  qrdtID_PERSONA.Enabled := vgBPersonaNva;
  qrdtNOMBRE_PER.Enabled := vgBPersonaNva;
  { Si es una población nueva imprimir la clave y descripción }
  qrdtCVE_POBLACION.Enabled  := vgBPoblacionNvo;
  qrdtDESC_POBLACION.Enabled := vgBPoblacionNvo;
  { Apaga Banderas }
  vgBPersonaNva   := False;
  vgBPoblacionNvo := False;
end;

end.
