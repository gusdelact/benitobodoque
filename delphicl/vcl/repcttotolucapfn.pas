unit RepCttoTolucaPFN;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QRCtrls, quickrpt, InterMemo,
  Db, Dialogs, DBTables, UnGene, IntFrm;

Const
    cDiscrecional = 'DIS';
    cNoDiscrec    = 'NDIS';
    cLimitada     = 'LIMI';

type
  TRepTolucaPFN = class(TQuickRep)
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrdbtNumCont: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    qrlLeyenda1: TQRLabel;
    QRLabel32: TQRLabel;
    qrdbCalle: TQRDBText;
    qrdbColonia: TQRDBText;
    qrdbCiudad: TQRDBText;
    qrdbEtado: TQRDBText;
    qrdbCP: TQRDBText;
    qrlTipoCta: TQRLabel;
    qrlManejoCta: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    qrlInstEnvio: TQRLabel;
    QRLabel35: TQRLabel;
    qrlUno: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    GroupFooterBand2: TQRBand;
    GroupHeaderBand3: TQRBand;
    QRLabel21: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText1: TQRDBText;
    qrdbTipoFirma: TQRDBText;
    QRShape1: TQRShape;
    QRLabel41: TQRLabel;
    qr: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel42: TQRLabel;
    QRDBText3: TQRDBText;
    subContratante: TQRSubDetail;
    qrsdCotitular: TQRSubDetail;
    qrlCotiCtaCh: TQRLabel;
    qrlCotiSucu: TQRLabel;
    qrlCotiPlaza: TQRLabel;
    QRShape2: TQRShape;
    qrdbCuenta: TQRDBText;
    qrdbNomBco: TQRDBText;
    qrdbCveSuc: TQRDBText;
    GroupFooterBand1: TQRBand;
    qrlCotiNacio: TQRLabel;
    qrdbCotiNacio: TQRDBText;
    QRBand1: TQRBand;
    qrlPiePagina: TQRLabel;
    GroupHeaderBand2: TQRBand;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    qrlsFirma: TQRShape;
    QRMemo1: TQRMacvMemo;
    lbTelefonoTitular: TQRLabel;
    lbPlazaTit: TQRLabel;
    lbPlazaCot: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText6: TQRDBText;
    dsContrato: TDataSource;
    qChequeraCot: TQuery;
    dsContratante: TDataSource;
    qDomicilio: TQuery;
    qChequeraCotCUENTA_BANCO: TStringField;
    qChequeraCotNOMBRE: TStringField;
    qChequeraCotCVE_SUC_BANCO: TStringField;
    qChequeraCotNOM_SUC_BANCO: TStringField;
    qChequeraCotNOM_PLAZA_BANCO: TStringField;
    qChequeraCotNOM_PLAZA: TStringField;
    qDomicilioCALLE_NUMERO: TStringField;
    qDomicilioCODIGO_POSTAL: TStringField;
    qDomicilioOFICINA_POSTAL: TStringField;
    qDomicilioCVE_USUAR_MODIF: TStringField;
    qDomicilioFH_MODIFICACION: TDateTimeField;
    qChequeraTit: TQuery;
    qChequeraTitCUENTA_BANCO: TStringField;
    qChequeraTitNOMBRE: TStringField;
    qChequeraTitCVE_SUC_BANCO: TStringField;
    qChequeraTitNOM_SUC_BANCO: TStringField;
    qChequeraTitNOM_PLAZA_BANCO: TStringField;
    qChequeraTitNOM_PLAZA: TStringField;
    qContratante: TQuery;
    qContrato: TQuery;
    qContratoId_dom: TFloatField;
    qContratoID_CONTRATO: TFloatField;
    qContratoID_TITULAR: TFloatField;
    qContratoID_DOMICILIO: TFloatField;
    qContratoCVE_CORRESP: TStringField;
    qContratoCVE_TIPO_CTA: TStringField;
    qContratoF_ALTA: TDateTimeField;
    qContratoF_BAJA: TDateTimeField;
    qContratoCVE_DISCRECIONAL: TStringField;
    qContratoID_CTTO: TStringField;
    qContratoID_DOM_CTE_CTO: TFloatField;
    qTitular: TQuery;
    qTitularID_PERSONA: TFloatField;
    qTitularID_DOMICILIO: TFloatField;
    qTitularCVE_RESIDENCIA: TStringField;
    qTitularCVE_NACIONALIDAD: TStringField;
    qTitularCVE_PER_JURIDICA: TStringField;
    qTitularTELEF_CASA: TStringField;
    qTitularTELEF_FAX: TStringField;
    qTitularTELEF_OFICINA: TStringField;
    qTitularNOMBRE: TStringField;
    qTitularCVE_TIPO_FIRMA: TStringField;
    qTitularNombreContrato: TStringField;
    qTitularRFC_TITULAR: TStringField;
    HeaderBeneficiario: TQRBand;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    subBeneficiario: TQRSubDetail;
    QRLabel56: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel49: TQRLabel;
    qBeneficiario: TQuery;
    qDomicilioCOLONIA: TStringField;
    qDomicilioPAIS: TStringField;
    qDomicilioESTADO: TStringField;
    qDomicilioCIUDAD: TStringField;
    qTitularDESC_NACIONALIDAD: TStringField;
    ChildBand1: TQRChildBand;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    qrmDomicilio: TQRMemo;
    qrmNomCliente: TQRMemo;
    qrmNomCotitular: TQRMemo;
    qrmNomBeneficiario: TQRMemo;
    qContratoCONTRATO: TStringField;
    qContratoFECHA_CONTRATO: TStringField;
    qContratoB_PROSPECTO: TStringField;
    qrlFechaCont: TQRLabel;
    qContratoNOMB_CONTRATO: TStringField;
    qTitularNOMB_CONTRATO: TStringField;
    procedure qrProemPFNBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure qrsdCotitularBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qTitularCalcFields(DataSet: TDataSet);
    procedure qContratoCalcFields(DataSet: TDataSet);
    procedure GroupHeaderBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure GroupHeaderBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure subBeneficiarioBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FInterFrame: TInterFrame;
    FRequery: Boolean;
  Protected
    procedure SetRequery(Open: Boolean);
  public
    function PreparaReporte(Padre: TInterFrame): Boolean;
  published
    Property InterFrame: TInterFrame Read FInterFrame Write FInterFrame;
    Property Requery: Boolean Read FRequery Write SetRequery;
  end;

var
  RepTolucaPFN: TRepTolucaPFN;

procedure Execute_RepTolucaPFN(Padre: TInterFrame; Preview: Boolean);

implementation

{$R *.DFM}

Uses RepCttoTolucaPFNF;    { Hoja de Firmas del Proemio }

procedure Execute_RepTolucaPFN(Padre: TInterFrame; Preview: Boolean);
var
   Reporte: TRepTolucaPFN;
begin
  Reporte:= TRepTolucaPFN.Create(nil);
  Try
    if Reporte.PreparaReporte(Padre) then begin
       if Preview then
          Reporte.Preview
       else
          Reporte.Print;
       Execute_TolucaFirmaPFN(Reporte, Preview);
    end;//if
  finally
    Reporte.Free;
  end;//try & finally
end;//procedure

procedure TRepTolucaPFN.SetRequery(Open: Boolean);
begin
  FRequery := Open;
  if Open then begin
     qContrato.Open;
     qDomicilio.Open;
     qTitular.Open;
     qChequeraTit.Open;
     qContratante.Open;
     qChequeraCot.Open;
     qBeneficiario.Open;
  end//if
  else begin
     qBeneficiario.Close;
     qChequeraCot.Close;
     qContratante.Close;
     qChequeraTit.Close;
     qTitular.Close;
     qDomicilio.Close;
     qContrato.Close;
  end//else
end;//procedure

function TRepTolucaPFN.PreparaReporte(Padre: TInterFrame): Boolean;
begin
  PreparaReporte:= True;
  Try
    InterFrame:= Padre;
    Requery := False;
    qContrato.DatabaseName 	:= InterFrame.DataBaseName;
    qDomicilio.DatabaseName     := InterFrame.DataBaseName;
    qTitular.DatabaseName  	:= InterFrame.DataBaseName;
    qContratante.DatabaseName	:= InterFrame.DataBaseName;
    qChequeraTit.DatabaseName	:= InterFrame.DataBaseName;
    qChequeraCot.DatabaseName	:= InterFrame.DataBaseName;
    qBeneficiario.DatabaseName	:= InterFrame.DataBaseName;
    qContrato.SessionName 	:= InterFrame.SessionName;
    qTitular.SessionName  	:= InterFrame.SessionName;
    qContratante.SessionName	:= InterFrame.SessionName;
    qDomicilio.SessionName	:= InterFrame.SessionName;
    qChequeraCot.SessionName	:= InterFrame.SessionName;
    qChequeraTit.SessionName	:= InterFrame.SessionName;
    qBeneficiario.SessionName	:= InterFrame.SessionName;
    qContrato.ParamByName('Id_contrato').asInteger := Padre.fieldByName('ID_CONTRATO').AsInteger;
    Requery := True;
  Except
    on E: Exception do
    Begin
      MessageDlg('Error al preparar la información del Contrato. ' + E.Message, mtError, [mbOK], E.HelpContext);
      PreparaReporte := False;
    end;
  end;//Try & Except
end;//procedure

procedure TRepTolucaPFN.qrProemPFNBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
Var
   vlTope : Integer;
begin
  If qContrato.FieldByName('B_PROSPECTO').AsString = 'F' Then
    qrlFechaCont.Caption:= FmtFecha(qContrato.FieldByName('FECHA_CONTRATO').AsDateTime, '@D-@MMM-@YYYY')
  else qrlFechaCont.Caption:= qContrato.FieldByName('FECHA_CONTRATO').AsString;

  if qContratante.IsEmpty then
     qrlTipoCta.Caption:= 'INDIVIDUAL'
  else
     qrlTipoCta.Caption:= 'SOLIDARIA';

       if qContrato.fieldbyname('CVE_CORRESP').AsString = 'RT' THEN qrlInstEnvio.Caption:= 'RETENER'
  else if qContrato.fieldbyname('CVE_CORRESP').AsString = 'CR' THEN qrlInstEnvio.Caption:= 'CORREO'
  else if qContrato.fieldbyname('CVE_CORRESP').AsString = 'DH' THEN qrlInstEnvio.Caption:= 'DHL'
  else if qContrato.fieldbyname('CVE_CORRESP').AsString = 'FX' THEN qrlInstEnvio.Caption:= 'FEDERAL EXPRESS'
  else if qContrato.fieldbyname('CVE_CORRESP').AsString = 'LQ' THEN qrlInstEnvio.Caption:= 'LIQUIDACION'
  else if qContrato.fieldbyname('CVE_CORRESP').AsString = 'RB' THEN qrlInstEnvio.Caption:= 'RET. DE BANCO'
  else if qContrato.fieldbyname('CVE_CORRESP').AsString = 'RP' THEN qrlInstEnvio.Caption:= 'RET. DE CTAS. PROPIAS'
  else if qContrato.fieldbyname('CVE_CORRESP').AsString = 'RC' THEN qrlInstEnvio.Caption:= 'RET. De CTES. MENSAJEROS';

       if qContrato.FieldByName('CVE_DISCRECIONAL').AsString = cLimitada then qrlManejoCta.Caption:='LIMITADA'
  else if qContrato.FieldByName('CVE_DISCRECIONAL').AsString = cDiscrecional then qrlManejoCta.Caption:='DISCRECIONAL'
  else qrlManejoCta.Caption:='NO DISCRECIONAL';

  qrlLeyenda1.Caption := InterFrame.FieldByName('LEYENDA').asString;
  if InterFrame.FieldByName('LEYENDA').asString = 'REPRESENTADO POR SUS PADRES' then
     qrlLeyenda1.Caption := ' ';
  qrlPiePagina.Caption:= InterFrame.FieldByName('LEYENDA_PIE').asString;
  QRMemo1.Textos.Clear;
  if InterFrame.FieldByName('TIPO_CONTRATO').AsString = 'IFON' then
     QRMemo1.Textos.Append('CONTRATO DE PRESTACION DE SERVICIOS BANCARIOS ("CUENTA INTERACCIONES") QUE EN LOS TERMINOS DE '+
                           'LAS DECLARACIONES Y LAS CLAUSULAS QUE APARECEN A CONTINUACION, CELEBRAN POR UNA PARTE BANCO INTERACCIONES, S.A. INSTITUCION '+
                           'DE BANCA MULTIPLE, GRUPO FINANCIERO INTERACCIONES, REPRESENTADO POR : @@0@, EN LO SUCESIVO EL "BANCO" Y POR LA OTRA : LA PERSONA '+
                           'INDICADA EN EL PROEMIO DE ESTE CONTRATO A QUIEN SE LLAMARA EL "CLIENTE".')
  else
  if InterFrame.FieldByName('TIPO_CONTRATO').AsString = 'OFON' then
     QRMemo1.Textos.Append('CONTRATO NORMATIVO DE OPERACIONES DE COMPRAVENTA DE ACCIONES DE SOCIEDADES DE INVERSIÓN '+
                           '("CUENTA INTERACCIONES") QUE EN LOS TERMINOS DE LAS DECLARACIONES Y LAS CLAUSULAS '+
                           'QUE APARECEN A CONTINUACIÓN, CELEBRAN POR UNA PARTE INTERACCIONES SOCIEDAD OPERADORA DE SOCIEDADES DE '+
                           'INVERSIÓN, S.A. DE C.V., GRUPO FINANCIERO INTERACCIONES, REPRESENTADO POR: @@0@, EN LO SUCESIVO '+
                           '"LA OPERADORA" Y POR LA OTRA: LA PERSONA INDICADA EN EL PROEMIO DE ESTE CONTRATO A QUIEN SE LE '+
                           'LLAMARA EL "CLIENTE".');
  QRMemo1.Parametro.Add(InterFrame.FieldByName('NOM_REPRESENTANTE').asString);
  qrmDomicilio.Lines.Clear;
  qrmDomicilio.Lines.Add(qDomicilio.FieldByName('CALLE_NUMERO').asString + '   COLONIA ' + qDomicilio.FieldByName('COLONIA').asString);
  if Trim(qTitular.FieldByName('TELEF_OFICINA').asString) <> '' then
     lbTelefonoTitular.Caption := qTitular.FieldByName('TELEF_OFICINA').asString
  else
     if Trim(qTitular.FieldByName('TELEF_CASA').asString) <> '' then
        lbTelefonoTitular.Caption := qTitular.FieldByName('TELEF_CASA').asString
     else
        lbTelefonoTitular.Caption := qTitular.FieldByName('TELEF_FAX').asString;
end;//procedure

procedure TRepTolucaPFN.qrsdCotitularBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qChequeraCot.IsEmpty then
     PrintBand := false
  else begin
     PrintBand := True;
     if Trim(qChequeraCot.FieldByName('NOM_PLAZA').asString) <> '' then
        lbPlazaCot.Caption := qChequeraCot.FieldByName('NOM_PLAZA').asString
     else
        if Trim(qChequeraCot.FieldByName('NOM_PLAZA_BANCO').asString) <> '' then
           lbPlazaCot.Caption := qChequeraCot.FieldByName('NOM_PLAZA_BANCO').asString
        else
           lbPlazaCot.Caption := '';
  end;//else
end;//procedure

procedure TRepTolucaPFN.QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qChequeraTit.IsEmpty then
     PrintBand := false
  else begin
     PrintBand := True;
     if Trim(qChequeraTit.FieldByName('NOM_PLAZA').asString) <> '' then
        lbPlazaTit.Caption := qChequeraTit.FieldByName('NOM_PLAZA').asString
     else
        if Trim(qChequeraTit.FieldByName('NOM_PLAZA_BANCO').asString) <> '' then
           lbPlazaTit.Caption := qChequeraTit.FieldByName('NOM_PLAZA_BANCO').asString
        else
           lbPlazaTit.Caption := '';
  end;
end;

procedure TRepTolucaPFN.qTitularCalcFields(DataSet: TDataSet);
begin
  if Trim(qTitular.FieldByName('NOMB_CONTRATO').asString) <> '' then
     qTitular.FieldByName('NOMBRECONTRATO').asString := qTitular.FieldByName('NOMB_CONTRATO').asString
  else
     qTitular.FieldByName('NOMBRECONTRATO').asString := qTitular.FieldByName('NOMBRE').asString;
end;//procedure

procedure TRepTolucaPFN.qContratoCalcFields(DataSet: TDataSet);
begin
  if Trim(qContrato.FieldByName('ID_DOM_CTE_CTO').asString) <> '' then
     qContrato.FieldByName('ID_DOM').asString := qContrato.FieldByName('ID_DOM_CTE_CTO').asString
  else
    qContrato.FieldByName('ID_DOM').asString := qContrato.FieldByName('ID_DOMICILIO').asString;
end;//procedure

procedure TRepTolucaPFN.GroupHeaderBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qContratante.FieldByName('CVE_CONTRATANTE').asString = 'C006' then
     QRLabel29.Caption := 'REPRESENTADO POR SUS PADRES EN EJERCICIO DE LA PATRIA POTESTAD SEÑORES:'
  else
     QRLabel29.Caption := ' ';
  qrmNomCotitular.Lines.Clear;
  qrmNomCotitular.Lines.Add(qContratante.FieldByName('NOMBRE').AsString);
end;//procedure

procedure TRepTolucaPFN.GroupHeaderBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmNomCliente.Lines.Clear;
  qrmNomCliente.Lines.Add(qTitular.FieldByName('NombreContrato').AsString);
end;

procedure TRepTolucaPFN.subBeneficiarioBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmNomBeneficiario.Lines.Clear;
  qrmNomBeneficiario.Lines.Add(qBeneficiario.FieldByName('NOMBRE').AsString);
end;

end.
