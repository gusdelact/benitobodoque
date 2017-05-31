unit RepCttoTolucaPMNF;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms,
     Quickrpt, QRCtrls, db, dbtables, UnGene, RepCttoTolucaPMN;

type
  TRepTolucaPMNF = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel32: TQRLabel;
    QRBand2: TQRBand;
    qrlNomRepres: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    qrlfecImpre: TQRLabel;
    qrlFecHoraImpre: TQRLabel;
    qrshFirma: TQRShape;
    qrmNomCliente: TQRMemo;
    procedure qrProemPFNFirBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure RepTolucaPFNFNeedData(Sender: TObject; var MoreData: Boolean);
  private
    ReportePadre: TRepTolucaPMN;
  public
  end;

var
  RepTolucaPMNF: TRepTolucaPMNF;

Procedure Execute_TolucaFirmaPMN(Padre: TRepTolucaPMN; Preview: Boolean);

implementation

{$R *.DFM}

Procedure Execute_TolucaFirmaPMN(Padre: TRepTolucaPMN; Preview: Boolean);
Var
   Rep: TRepTolucaPMNF;
Begin
  Rep := TRepTolucaPMNF.Create(nil);
  Try
    Rep.ReportePadre:= Padre;
    If Padre <> nil then Begin
       If Preview Then
          Rep.Preview
       else
          Rep.Print;
    end;//if
  Finally
    If Rep <> nil then
       Rep.Free;
  end;//try & finally
end;//procedure

procedure TRepTolucaPMNF.qrProemPFNFirBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
Var
  s: String;
begin
  ReportePadre.qContrato.First;
  s := ReportePadre.InterFrame.FieldByName('NOM_CLIENTE').asString;
  qrmNomCliente.Lines.Clear;
  qrmNomCliente.Lines.Add(s);

  If ReportePadre.qContrato.FieldByName('B_PROSPECTO').AsString = 'V' Then
    qrlFecHoraImpre.Caption:= ReportePadre.qContrato.FieldByName('FECHA_CONTRATO').AsString
  else qrlFecHoraImpre.Caption:= FmtFecha(ReportePadre.qContrato.FieldByName('FECHA_CONTRATO').AsDateTime, '@DD-@MMM-@YYYY');

  qrlNomRepres.Caption    := ReportePadre.InterFrame.FieldByName('NOM_REPRESENTANTE').asString;
  if (ReportePadre.InterFrame.FieldByName('TIPO_CONTRATO').AsString = 'IFON') OR
     (ReportePadre.InterFrame.FieldByName('TIPO_CONTRATO').AsString = 'PRBC') then
     QRLabel2.Caption := 'E L     B A N C O'
  else
  if (ReportePadre.InterFrame.FieldByName('TIPO_CONTRATO').AsString = 'OFON') OR
     (ReportePadre.InterFrame.FieldByName('TIPO_CONTRATO').AsString = 'PROF') Then
  Begin
     QRLabel2.Caption := 'L A     S O C I E D A D     O P E R A D O R A';
     QRBand1.Height := 625;
     QRLabel32.Top := 552;
     qrmNomCliente.Top := 607;
     qrshFirma.Top := 610;
  end;//if
end;//procedure

procedure TRepTolucaPMNF.RepTolucaPFNFNeedData(Sender: TObject; var MoreData: Boolean);
begin
  MoreData:= Not ReportePadre.qContrato.EOF;
  ReportePadre.qContrato.Next;
end;//procedure

end.
