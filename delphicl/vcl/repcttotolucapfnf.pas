unit RepCttoTolucaPFNF;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms,
     Quickrpt, QRCtrls, db, dbtables, RepCttoTolucaPFN, UnGene;

type
  TRepTolucaPFNF = class(TQuickRep)
    QRBand1: TQRBand;
    SubTitular: TQRSubDetail;
    SubCotitular: TQRSubDetail;
    QRLbElCliente: TQRLabel;
    qrshFirma: TQRShape;
    QRShape1: TQRShape;
    QRBand2: TQRBand;
    qrlNomRepres: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    qrlfecImpre: TQRLabel;
    qrlFecHoraImpre: TQRLabel;
    qrmNomCliente: TQRMemo;
    qrmNomCotitular: TQRMemo;
    procedure qrProemPFNFirBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure SubTitularNeedData(Sender: TObject; var MoreData: Boolean);
    procedure SubCotitularNeedData(Sender: TObject; var MoreData: Boolean);
    procedure SubTitularAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure SubCotitularAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure RepTolucaPFNFNeedData(Sender: TObject; var MoreData: Boolean);
    procedure SubTitularBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure SubCotitularBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    ReportePadre: TRepTolucaPFN;
  public
  end;

var
  RepTolucaPFNF: TRepTolucaPFNF;

Procedure Execute_TolucaFirmaPFN(Padre: TRepTolucaPFN; Preview: Boolean);

implementation

{$R *.DFM}

Procedure Execute_TolucaFirmaPFN(Padre: TRepTolucaPFN; Preview: Boolean);
Var
   Rep: TRepTolucaPFNF;
Begin
  Rep:= TRepTolucaPFNF.Create(nil);
  Try
    Rep.ReportePadre:= Padre;
      If Padre <> nil then Begin
         If Preview Then
            Rep.Preview
      	 else
            Rep.Print;
      end;
  Finally
    If Rep <> nil then Rep.Free;
  end;
end;


procedure TRepTolucaPFNF.qrProemPFNFirBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  ReportePadre.qContrato.First;
  ReportePadre.qTitular.First;
  ReportePadre.qContratante.First;

  If ReportePadre.qContrato.FieldByName('B_PROSPECTO').AsString = 'V' Then
    qrlFecHoraImpre.Caption:= ReportePadre.qContrato.FieldByName('FECHA_CONTRATO').AsString
  else qrlFecHoraImpre.Caption:= FmtFecha(ReportePadre.qContrato.FieldByName('FECHA_CONTRATO').AsDateTime, '@DD-@MMM-@YYYY');

  qrlNomRepres.Caption   := ReportePadre.InterFrame.FieldByName('NOM_REPRESENTANTE').asString;
  if (ReportePadre.InterFrame.FieldByName('TIPO_CONTRATO').AsString = 'IFON') OR
     (ReportePadre.InterFrame.FieldByName('TIPO_CONTRATO').AsString = 'PRBC') Then
     QRLabel2.Caption := 'E L     B A N C O'
  else
  if (ReportePadre.InterFrame.FieldByName('TIPO_CONTRATO').AsString = 'OFON') OR
     (ReportePadre.InterFrame.FieldByName('TIPO_CONTRATO').AsString = 'PROF') Then
  Begin
     QRLabel2.Caption := 'L A     S O C I E D A D     O P E R A D O R A';
     QRBand1.Height := 618;
     QRLbElCliente.Top := 592;
  end;
end;


procedure TRepTolucaPFNF.RepTolucaPFNFNeedData(Sender: TObject; var MoreData: Boolean);
begin
  MoreData:= Not ReportePadre.qContrato.EOF;
  ReportePadre.qContrato.Next;
end;//procedure

procedure TRepTolucaPFNF.SubTitularNeedData(Sender: TObject; var MoreData: Boolean);
begin
  MoreData := Not ReportePadre.qTitular.EOF;
end;//procedure

procedure TRepTolucaPFNF.SubTitularAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  ReportePadre.qTitular.Next;
end;//procedure

procedure TRepTolucaPFNF.SubCotitularNeedData(Sender: TObject; var MoreData: Boolean);
begin
  MoreData := Not ReportePadre.qContratante.EOF;
end;//procedure

procedure TRepTolucaPFNF.SubCotitularAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  ReportePadre.qContratante.Next;
end;//procedure

procedure TRepTolucaPFNF.SubTitularBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
Var
  s: String;
begin
  s:= ReportePadre.qTitular.FieldByName('NOMBRECONTRATO').asString;
  qrmNomCliente.Lines.Clear;
	qrmNomCliente.Lines.Add(s);
end;//procedure

procedure TRepTolucaPFNF.SubCotitularBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
Var
  s: String;
begin
  s:= ReportePadre.qContratante.FieldByName('NOMBRE').asString;
  qrmNomCotitular.Lines.Clear;
	qrmNomCotitular.Lines.Add(s);
end;//procedure

end.
