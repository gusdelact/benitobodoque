unit RepCttoInterFin;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, IntFrm, InterApl,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, InterMemo;

type
  TReporteCttoInterFin = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    qContrato: TQuery;
    qTitular: TQuery;
    dsContrato: TDataSource;
    qContratante: TQuery;
    QRLabel12: TQRLabel;
    QRMacvMemo1: TQRMacvMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    lbId_Contrato: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    lbDescPerJuridica: TQRLabel;
    QRLabel3: TQRLabel;
    lbFAlta: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    edCveTipoFirma: TQRDBText;
    LineaTipoFirma: TQRShape;
    lineaFirma: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    edTipoFirma: TQRDBText;
    QRShape3: TQRShape;
    GroupHeaderBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRLabel20: TQRLabel;
    QRShape7: TQRShape;
    GroupHeaderBand2: TQRBand;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    qBeneficiario: TQuery;
    lbPctBeneficio: TQRLabel;
    qDomicilio: TQuery;
    PageHeaderBand2: TQRBand;
    ChildBand1: TQRChildBand;
    QRLabel14: TQRLabel;
    lbManejoCta: TQRLabel;
    QRLabel17: TQRLabel;
    lbTipoCuenta: TQRLabel;
    QRLabel18: TQRLabel;
    lbCveCorresp: TQRLabel;
    QRLabel19: TQRLabel;
    lbLeyenda: TQRMemo;
    qrmNomCliente: TQRMemo;
    ChildBand2: TQRChildBand;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    qrmNomRepresenta: TQRMemo;
    qrmNomBeneficiario: TQRMemo;
    qrmDomicilio: TQRMemo;
    QRLabel13: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel16: TQRLabel;
    lbTelefono: TQRLabel;
    ChildBand3: TQRChildBand;
    lbLeyendaPie: TQRMemo;
    qrmDomicilioCtto: TQRMemo;
    bandLeyendaPie: TQRChildBand;
    procedure ReporteCttoInterFinBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
      FInterFrame: TInterFrame;
      FRequery: Boolean;
  protected
  		Procedure SetInterFrame(Frame: TInterFrame);
		procedure SetRequery(Open: Boolean);
  public
  		function DameFecha(Fecha: TDateTime): String;
      Function PreparaReporte(Padre: TInterFrame): Boolean;
  published
      Property InterFrame: TInterFrame Read FInterFrame Write SetInterFrame;
      Property Requery: Boolean Read FRequery Write SetRequery;
  end;

Procedure Execute_RepIntFin(Padre: TInterFrame; Preview: Boolean);

var
  ReporteCttoInterFin: TReporteCttoInterFin;

implementation

{$R *.DFM}

Procedure Execute_RepIntFin(Padre: TInterFrame; Preview: Boolean);
var	Reporte: TReporteCttoInterFin;
begin
	Reporte:= TReporteCttoInterFin.Create(nil);
   Try
   	If Reporte.PreparaReporte(Padre) then
         if Preview then
            Reporte.Preview
         else
            Reporte.Print;
   finally
   	Reporte.Free;
   end;
end;

procedure TReporteCttoInterFin.SetInterFrame (Frame: TInterFrame);
begin
	FInterFrame := Frame;

   Requery := False;

   qContrato.DatabaseName 		:= Frame.DataBaseName;
   qTitular.DatabaseName  		:= Frame.DataBaseName;
   qContratante.DatabaseName	:= Frame.DataBaseName;
   qBeneficiario.DatabaseName	:= Frame.DataBaseName;
   qDomicilio.DatabaseName    := Frame.DataBaseName;

   qContrato.SessionName 		:= Frame.SessionName;
   qTitular.SessionName  		:= Frame.SessionName;
   qContratante.SessionName	:= Frame.SessionName;
   qBeneficiario.SessionName	:= Frame.SessionName;
   qDomicilio.SessionName		:= Frame.SessionName;
end;

procedure TReporteCttoInterFin.SetRequery(Open: Boolean);
begin
	FRequery := Open;

	If Open then
   begin
      qContrato.Open;
      qTitular.Open;
      	If Trim(qTitular.FieldByName('ID_DOM_CTE_CTO').asString) <> '' Then
      		qDomicilio.ParamByName('ID_DOMICILIO').asInteger := qTitular.FieldByName('ID_DOM_CTE_CTO').asInteger
         else
         	qDomicilio.ParamByName('ID_DOMICILIO').asInteger := qTitular.FieldByName('ID_DOMICILIO').asInteger;
      qDomicilio.Open;
      qContratante.Open;
      qBeneficiario.Open;
   end
   else
   begin
      qBeneficiario.Close;
      qContratante.Close;
      qTitular.Close;
      qDomicilio.Close;
      qContrato.Close;
   end
end;


Function TReporteCttoInterFin.PreparaReporte(Padre: TInterFrame): Boolean;
begin
	PreparaReporte:= True;
   InterFrame:= Padre;
   Try
   	Requery := False;
      qContrato.ParamByName('Id_contrato').asInteger := Padre.fieldByName('ID_CONTRATO').AsInteger;
		Requery := True;
   Except
   	PreparaReporte := False;
   end;
end;


function TReporteCttoInterFin.DameFecha(Fecha: TDateTime): String;
var
	Year, Month, Day: Word;
   FechaStr: String;
begin
   DecodeDate(Fecha, Year, Month, Day);
   FechaStr := IntToStr(Day) + ' - ';

   Case Month of
      1: FechaStr := FechaStr + 'ENERO';
      2: FechaStr := FechaStr + 'FEBRERO';
      3: FechaStr := FechaStr + 'MARZO';
      4: FechaStr := FechaStr + 'ABRIL';
      5: FechaStr := FechaStr + 'MAYO';
      6: FechaStr := FechaStr + 'JUNIO';
      7: FechaStr := FechaStr + 'JULIO';
      8: FechaStr := FechaStr + 'AGOSTO';
      9: FechaStr := FechaStr + 'SEPTIEMBRE';
      10:FechaStr := FechaStr + 'OCTUBRE';
      11:FechaStr := FechaStr + 'NOVIEMBRE';
      12:FechaStr := FechaStr + 'DICIEMBRE';
   end;

   FechaStr := FechaStr + ' - ' + IntToStr(Year);
   DameFecha := FechaStr;
end;

procedure TReporteCttoInterFin.ReporteCttoInterFinBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   lbLeyenda.Caption := '';
   lbLeyendaPie.Caption := '';
	lbLeyenda.Lines.Text := InterFrame.FieldByName('LEYENDA').asString;
   lbLeyendaPie.Lines.Text := InterFrame.FieldByName('LEYENDA_PIE').asString;

   If Trim(lbLeyendaPie.Lines.Text) = '' Then bandLeyendaPie.Enabled:= False
   else bandLeyendaPie.Enabled:= True;

																		{ID CONTRATO}
   lbId_Contrato.Caption := IntToStr(StrToInt(Copy(IntToStr(qContrato.FieldByName('Id_contrato').asInteger),3,7)));
   If lbId_Contrato.Caption = '0' then lbId_Contrato.Caption := IntToStr(qContrato.FieldByName('Id_contrato').asInteger);

																		{FECHA ALTA}
   lbFAlta.Caption := DameFecha(qContrato.FieldByName('F_Alta').asDateTime);

																		{CORRESPONDENCIA}
	If qContrato.FieldByName('Cve_Corresp').asString = 'RT' Then lbCveCorresp.Caption := 'RETENER'
   else If qContrato.FieldByName('Cve_Corresp').asString = 'CR' Then lbCveCorresp.Caption := 'CORREO'
   else If qContrato.FieldByName('Cve_Corresp').asString = 'DH' Then lbCveCorresp.Caption := 'DHL'
   else If qContrato.FieldByName('Cve_Corresp').asString = 'FX' Then lbCveCorresp.Caption := 'FEDERAL EXPRESS'
   else If qContrato.FieldByName('Cve_Corresp').asString = 'LQ' Then lbCveCorresp.Caption := 'LIQUIDACION'
   else If qContrato.FieldByName('Cve_Corresp').asString = 'RB' Then lbCveCorresp.Caption := 'RET. DE BANCO'
   else If qContrato.FieldByName('Cve_Corresp').asString = 'RP' Then lbCveCorresp.Caption := 'RET. DE CTAS. PROPIAS'
   else If qContrato.FieldByName('Cve_Corresp').asString = 'RC' Then lbCveCorresp.Caption := 'RET. DE CTES. MENSAJEROS'
   else lbCveCorresp.Caption := '';

																		{PERSONALIDAD JURIDICA}
	If qTitular.FieldByName('Cve_Per_Juridica').asString = 'PM' Then lbDescPerJuridica.Caption := 'PERSONA MORAL'
   else If qTitular.FieldByName('Cve_Per_Juridica').asString = 'PF' Then lbDescPerJuridica.Caption := 'PERSONA FISICA'
   else lbDescPerJuridica.Caption := '';

																		{MANEJO DE CUENTA}
   If qContrato.FieldByName('Cve_Discrecional').asString = 'DIS' Then
      lbManejoCta.Caption := 'DISCRECIONAL'
   Else
      If qContrato.FieldByName('Cve_Discrecional').asString = 'NDIS' Then
         lbManejoCta.Caption := 'NO DISCRECIONAL'
      else
         lbManejoCta.Caption := ' ';
{   else If qContrato.FieldByName('Cve_Discrecional').asString = 'NDIS' Then lbManejoCta.Caption := 'NO DISCRECIONAL'
   else lbManejoCta.Caption := '';}

																		{TIPO DE CUENTA}
   if (qTitular.FieldByName('Cve_Per_Juridica').asString = 'PF') and (Not qContratante.IsEmpty) Then
   	lbTipoCuenta.Caption := 'SOLIDARIA'
   else lbTipoCuenta.Caption := 'INDIVIDUAL';

																		{TELEFONO}
   If qTitular.FieldByName('Cve_Per_Juridica').asString = 'PM' then
   begin
           if Trim(qTitular.FieldByName('Telef_Oficina').asString) <> '' then lbTelefono.Caption := qTitular.FieldByName('Telef_Oficina').asString
      else if Trim(qTitular.FieldByName('Telef_Casa').asString) <> '' then lbTelefono.Caption := qTitular.FieldByName('Telef_Casa').asString
      else if Trim(qTitular.FieldByName('Telef_Fax').asString) <> '' then lbTelefono.Caption := qTitular.FieldByName('Telef_Fax').asString
      else lbTelefono.Caption := '';

      lineaFirma.Enabled := False;
      LineaTipoFirma.Enabled := False;
      edCveTipoFirma.Enabled := False;
   end
   else
   begin
      if Trim(qTitular.FieldByName('Telef_Casa').asString) <> '' then lbTelefono.Caption := qTitular.FieldByName('Telef_Casa').asString
   	else if Trim(qTitular.FieldByName('Telef_Oficina').asString) <> '' then lbTelefono.Caption := qTitular.FieldByName('Telef_Oficina').asString
      else if Trim(qTitular.FieldByName('Telef_Fax').asString) <> '' then lbTelefono.Caption := qTitular.FieldByName('Telef_Fax').asString
      else lbTelefono.Caption := '';

      lineaFirma.Enabled := True;
      LineaTipoFirma.Enabled := True;
      edCveTipoFirma.Enabled := True;
   end;

																		{DOMICILIO TITULAR}
   qrmDomicilio.Lines.Clear;
   qrmDomicilio.Lines.Add(qDomicilio.FieldByName('Calle_Numero').asString +
   	', '+ qDomicilio.FieldByName('Colonia').asString +
      ' C.P. '+ qDomicilio.FieldByName('Codigo_Postal').asString);

																		{DOMICILIO DEL CONTRATO}
   qrmDomicilioCtto.Lines.Clear;
   qrmDomicilioCtto.Lines.Add(qContrato.FieldByName('Calle_Numero').asString +
   	', '+ qContrato.FieldByName('Colonia').asString +
      ' C.P. '+ qContrato.FieldByName('Codigo_Postal').asString);
end;

procedure TReporteCttoInterFin.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
{	if (edTipoFirma.Caption = 'B') and ((lbTipoCuenta.Caption='INDIVIDUAL') or (lbTipoCuenta.Caption='MANCOMUNADA')) Then
		lbTipoCuenta.Caption := 'MANCOMUNADA'
   else
   	lbTipoCuenta.Caption := 'SOLIDARIA';}
end;

procedure TReporteCttoInterFin.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
	lbPctBeneficio.Caption := qBeneficiario.FieldByName('PCT_BENEFICIO').asString + '%';
  qrmNomBeneficiario.Lines.Clear;
  qrmNomBeneficiario.Lines.Add(qBeneficiario.FieldByName('NOMBRE').AsString);
end;


procedure TReporteCttoInterFin.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrmNomCliente.Lines.Clear;
  qrmNomCliente.Lines.Add(qTitular.FieldByName('NOMBRE').AsString);
end;

procedure TReporteCttoInterFin.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrmNomRepresenta.Lines.Clear;
  qrmNomRepresenta.Lines.Add(qContratante.FieldByName('NOMBRE').AsString);
end;

end.
