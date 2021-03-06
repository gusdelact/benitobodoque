unit RepCttoTolucaPMN;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QRCtrls, quickrpt, InterMemo,
  Db, DBTables, IntFrm, UnGene;

Const
    cDiscrecional = 'DIS';
    cNoDiscrec    = 'NDIS';
    cLimitada     = 'LIMI';

type
  TRepTolucaPMN = class(TQuickRep)
    DetailBand1: TQRBand;
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
    QRLabel32: TQRLabel;
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
    QRLabel41: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText1: TQRDBText;
    qrsbRepresen: TQRSubDetail;
    QRBand1: TQRBand;
    qrlPiePagina: TQRLabel;
    qrlCotiNom: TQRLabel;
    QRLabel42: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel43: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel44: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel47: TQRLabel;
    qrlRepresen: TQRLabel;
    qrlNumEsc: TQRLabel;
    qrlFecha: TQRLabel;
    qrlNotario: TQRLabel;
    qrdbNumEsc: TQRDBText;
    qrdbTipoFirma: TQRDBText;
    qrdbNotario: TQRDBText;
    GroupHeaderBand1: TQRBand;
    QRLabel48: TQRLabel;
    edFechaEscritura: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    qrsFirma: TQRShape;
    QRMemo1: TQRMacvMemo;
    lbTelefonoTitular: TQRLabel;
    lbPlazaTit: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    qrlLeyenda1: TQRLabel;
    QRLabel28: TQRLabel;
    qContrato: TQuery;
    qContratoId_dom: TFloatField;
    qContratoID_CONTRATO: TFloatField;
    qContratoID_TITULAR: TFloatField;
    qContratoNOMB_CONTRATO: TStringField;
    qContratoID_DOMICILIO: TFloatField;
    qContratoCVE_CORRESP: TStringField;
    qContratoCVE_TIPO_CTA: TStringField;
    qContratoF_ALTA: TDateTimeField;
    qContratoF_BAJA: TDateTimeField;
    qContratoCVE_DISCRECIONAL: TStringField;
    qContratoID_CTTO: TStringField;
    qContratoID_DOM_CTE_CTO: TFloatField;
    dsContrato: TDataSource;
    qDomicilio: TQuery;
    qDomicilioCALLE_NUMERO: TStringField;
    qDomicilioCODIGO_POSTAL: TStringField;
    qDomicilioOFICINA_POSTAL: TStringField;
    qDomicilioCVE_USUAR_MODIF: TStringField;
    qDomicilioFH_MODIFICACION: TDateTimeField;
    qContratante: TQuery;
    dsContratante: TDataSource;
    qChequeraTit: TQuery;
    qChequeraTitCUENTA_BANCO: TStringField;
    qChequeraTitNOMBRE: TStringField;
    qChequeraTitCVE_SUC_BANCO: TStringField;
    qChequeraTitNOM_SUC_BANCO: TStringField;
    qChequeraTitNOM_PLAZA_BANCO: TStringField;
    qChequeraTitNOM_PLAZA: TStringField;
    qChequeraCot: TQuery;
    qChequeraCotCUENTA_BANCO: TStringField;
    qChequeraCotNOMBRE: TStringField;
    qChequeraCotCVE_SUC_BANCO: TStringField;
    qChequeraCotNOM_SUC_BANCO: TStringField;
    qChequeraCotNOM_PLAZA_BANCO: TStringField;
    qChequeraCotNOM_PLAZA: TStringField;
    qEscrituraTit: TQuery;
    qEscrituraCot: TQuery;
    qEscrituraTitNOMBRE: TStringField;
    qEscrituraTitNUM_ESC_PUBLICA: TFloatField;
    qEscrituraTitFOJAS: TStringField;
    qEscrituraTitLIBRO: TStringField;
    qEscrituraTitPARTIDA: TStringField;
    qEscrituraTitTOMO: TStringField;
    qEscrituraTitVOLUMEN: TStringField;
    qEscrituraTitNUM_NOTARIA: TFloatField;
    qEscrituraTitID_PERS_NOTARIO: TFloatField;
    qEscrituraTitF_CONSTITUCION: TDateTimeField;
    qEscrituraTitTX_INSCRIPCION: TStringField;
    qEscrituraTitNUM_NOTARIA_1: TFloatField;
    qEscrituraCotNOMBRE: TStringField;
    qEscrituraCotNUM_ESC_PUBLICA: TFloatField;
    qEscrituraCotFOJAS: TStringField;
    qEscrituraCotLIBRO: TStringField;
    qEscrituraCotPARTIDA: TStringField;
    qEscrituraCotTOMO: TStringField;
    qEscrituraCotVOLUMEN: TStringField;
    qEscrituraCotNUM_NOTARIA: TFloatField;
    qEscrituraCotID_PERS_NOTARIO: TFloatField;
    qEscrituraCotF_CONSTITUCION: TDateTimeField;
    qEscrituraCotTX_INSCRIPCION: TStringField;
    qEscrituraCotNUM_NOTARIA_1: TFloatField;
    qEscrituraTitF_ALTA: TDateTimeField;
    qEscrituraCotF_ALTA: TDateTimeField;
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
    qDomicilioCOLONIA: TStringField;
    qDomicilioPAIS: TStringField;
    qDomicilioESTADO: TStringField;
    qDomicilioCIUDAD: TStringField;
    qTitularDESC_NACIONALIDAD: TStringField;
    qEscrituraTitPLAZA: TStringField;
    qEscrituraCotPLAZA: TStringField;
    qrmNomCliente: TQRMemo;
    qrmCalle: TQRMemo;
    qrmColonia: TQRMemo;
    qrmNomRepresenta: TQRMemo;
    ChildBand1: TQRChildBand;
    qrlPlaza: TQRLabel;
    qrdbPlaza: TQRDBText;
    qrlInscrip: TQRLabel;
    qrdbInscrip: TQRDBText;
    qrlVolumen: TQRLabel;
    qrdbVolumen: TQRDBText;
    qrlLibro: TQRLabel;
    qrdbLibro: TQRDBText;
    qContratoCONTRATO: TStringField;
    qContratoFECHA_CONTRATO: TStringField;
    qContratoB_PROSPECTO: TStringField;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrdbtNumCont: TQRDBText;
    qrlFechaCont: TQRLabel;
    qTitularNOMB_CONTRATO: TStringField;
    procedure qrProemPFNBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure qContratoCalcFields(DataSet: TDataSet);
    procedure qTitularCalcFields(DataSet: TDataSet);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsbRepresenBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FInterFrame: TInterFrame;
    FRequery: Boolean;
  Protected
    procedure SetRequery(Open: Boolean);
  public
    Function PreparaReporte(Padre: TInterFrame): Boolean;
  published
    Property InterFrame: TInterFrame Read FInterFrame Write FInterFrame;
    Property Requery: Boolean Read FRequery Write SetRequery;
  end;//

var
  RepTolucaPMN: TRepTolucaPMN;

Procedure Execute_RepTolucaPMN(Padre: TInterFrame; Preview: Boolean);

implementation

{$R *.DFM}

Uses RepCttoTolucaPMNF,       { Hoja de Firmas Proemio Personas Morales}
     RepCttoTolucaMandato;    { Mandato Servicios Bancarios }

Procedure Execute_RepTolucaPMN(Padre: TInterFrame; Preview: Boolean);
var
  Reporte: TRepTolucaPMN;
begin
  Reporte:= TRepTolucaPMN.Create(nil);
  Try
    if Reporte.PreparaReporte(Padre) then Begin
       if Preview then
          Reporte.Preview
       else
          Reporte.Print;
       if Padre.FieldByName('B_MANDATO').asBoolean then
          Execute_RepTolucaMandato(Padre, Preview);
       Execute_TolucaFirmaPMN(Reporte, Preview);
    end;////if
  finally
    Reporte.Free;
  end;////try & finally
end;////procedure


procedure TRepTolucaPMN.SetRequery(Open: Boolean);
begin
  FRequery := Open;
  if Open then begin
      qContrato.Open;
      qDomicilio.Open;
      qTitular.Open;
      qChequeraTit.Open;
      qEscrituraTit.Open;
      qContratante.Open;
      qChequeraCot.Open;
      qEscrituraCot.Open;
   end//if
   else begin
   	qEscrituraCot.Close;
      qChequeraCot.Close;
      qContratante.Close;
      qEscrituraTit.Close;
      qChequeraTit.Close;
      qTitular.Close;
      qDomicilio.Close;
      qContrato.Close;
   end//else
end;//procedure

Function TRepTolucaPMN.PreparaReporte(Padre: TInterFrame): Boolean;
begin
  PreparaReporte:= True;
   Try
     InterFrame:= Padre;
     Requery := False;
     qContrato.DatabaseName 	:= InterFrame.DataBaseName;
     qDomicilio.DatabaseName   := InterFrame.DataBaseName;
     qTitular.DatabaseName  	:= InterFrame.DataBaseName;
     qContratante.DatabaseName	:= InterFrame.DataBaseName;
     qChequeraTit.DatabaseName	:= InterFrame.DataBaseName;
     qChequeraCot.DatabaseName	:= InterFrame.DataBaseName;
     qEscrituraCot.DatabaseName:= InterFrame.DataBaseName;
     qEscrituraTit.DatabaseName:= InterFrame.DataBaseName;

     qContrato.SessionName 	:= InterFrame.SessionName;
     qTitular.SessionName  	:= InterFrame.SessionName;
     qContratante.SessionName	:= InterFrame.SessionName;
     qDomicilio.SessionName	:= InterFrame.SessionName;
     qChequeraCot.SessionName	:= InterFrame.SessionName;
     qChequeraTit.SessionName	:= InterFrame.SessionName;
     qEscrituraCot.SessionName	:= InterFrame.SessionName;
     qEscrituraTit.SessionName	:= InterFrame.SessionName;

     qContrato.ParamByName('Id_contrato').asInteger := Padre.fieldByName('ID_CONTRATO').AsInteger;
     Requery := True;
   Except
     PreparaReporte := False;
   end;//try & except
end;//procedure

procedure TRepTolucaPMN.qrProemPFNBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
Var
  vlTope : Integer;                                        
begin
  If qContrato.FieldByName('B_PROSPECTO').AsString = 'F' Then
    qrlFechaCont.Caption:= FmtFecha(qContrato.FieldByName('FECHA_CONTRATO').AsDateTime, '@D-@MMM-@YYYY')
  else qrlFechaCont.Caption:= qContrato.FieldByName('FECHA_CONTRATO').AsString;

  if (qTitular.FieldByName('CVE_PER_JURIDICA').AsString = 'PF') and (Not qContratante.IsEmpty) Then
    qrlTipoCta.Caption:= 'SOLIDARIA'
  else qrlTipoCta.Caption:= 'INDIVIDUAL';

{RAPA. Jul 2006. Las Personas Morales siempre son Individual
  if qContratante.IsEmpty then
     qrlTipoCta.Caption:= 'INDIVIDUAL'
  else
     qrlTipoCta.Caption:= 'SOLIDARIA';
}

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
                           'QUE APARECEN A CONTINUACIÓN, CELEBRAN POR UNA PARTE INTERACCIONES SOCIEDAD DE OPERADORA DE SOCIEDADES DE '+
                           'INVERSIÓN, S.A. DE C.V., GRUPO FINANCIERO INTERACCIONES, REPRESENTADO POR: @@0@, EN LO SUCESIVO '+
                           '"LA OPERADORA" Y POR LA OTRA: LA PERSONA INDICADA EN EL PROEMIO DE ESTE CONTRATO A QUIEN SE LE '+
                           'LLAMARA EL "CLIENTE".');
  QRMemo1.Parametro.Add(InterFrame.FieldByName('NOM_REPRESENTANTE').asString);

  if Trim(qTitular.FieldByName('TELEF_OFICINA').asString) <> '' then
     lbTelefonoTitular.Caption := qTitular.FieldByName('TELEF_OFICINA').asString
  else
     if Trim(qTitular.FieldByName('TELEF_CASA').asString) <> '' then
        lbTelefonoTitular.Caption := qTitular.FieldByName('TELEF_CASA').asString
     else
        lbTelefonoTitular.Caption := qTitular.FieldByName('TELEF_FAX').asString;
  if Trim(qChequeraTit.FieldByName('NOM_PLAZA').asString) <> '' then
     lbPlazaTit.Caption := qChequeraTit.FieldByName('NOM_PLAZA').asString
  else
     if Trim(qChequeraTit.FieldByName('NOM_PLAZA_BANCO').asString) <> '' then
        lbPlazaTit.Caption := qChequeraTit.FieldByName('NOM_PLAZA_BANCO').asString
     else
        lbPlazaTit.Caption := '';
end;//procedure

procedure TRepTolucaPMN.qContratoCalcFields(DataSet: TDataSet);
begin
  if Trim(qContrato.FieldByName('ID_DOM_CTE_CTO').asString) <> '' then
     qContrato.FieldByName('ID_DOM').asString := qContrato.FieldByName('ID_DOM_CTE_CTO').asString
  else
     qContrato.FieldByName('ID_DOM').asString := qContrato.FieldByName('ID_DOMICILIO').asString;
end;//procedure

procedure TRepTolucaPMN.qTitularCalcFields(DataSet: TDataSet);
begin
  if Trim(qTitular.FieldByName('NOMB_CONTRATO').asString) <> '' then
     qTitular.FieldByName('NOMBRECONTRATO').asString := qTitular.FieldByName('NOMB_CONTRATO').asString
  else
     qTitular.FieldByName('NOMBRECONTRATO').asString := qTitular.FieldByName('NOMBRE').asString;
end;//procedure

procedure TRepTolucaPMN.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmNomCliente.Lines.Clear;
  qrmNomCliente.Lines.Add(qTitular.FieldByName('NombreContrato').AsString);
  qrmCalle.Lines.Clear;
  qrmCalle.Lines.Add(qDomicilio.FieldByName('CALLE_NUMERO').AsString);
  qrmColonia.Lines.Clear;
  qrmColonia.Lines.Add(qDomicilio.FieldByName('COLONIA').AsString);
end;

procedure TRepTolucaPMN.qrsbRepresenBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmNomRepresenta.Lines.Clear;
  qrmNomRepresenta.Lines.Add(qContratante.FieldByName('NOMBRE').AsString);
end;

end.
