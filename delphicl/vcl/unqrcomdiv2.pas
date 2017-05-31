unit UnQrComDiv2;
//Modificado    :   MARA4356 FEBRERO 2006 SE AGREGA IMPRESORA
//                  MARA4356 FEB 2007 SE MODIFICA PARA IMPRIMIR SOLO CLIENTE Y OOPERACION
//              :   EIB2AARJ 23 nov 2010 Modificaciones para presentar los datos de sellado electrónico

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, InterApl, UnSQL2;

type
  TUnQrComDivC = class(TQuickRep)
    qContrato: TQuery;
    qContratoID_CONTRATO: TFloatField;
    qContratoID_CLIENTE: TFloatField;
    qContratoNOMBRE_CLIENTE: TStringField;
    qContratoCVE_MONEDA_BASE: TFloatField;
    qContratoF_OPERACION: TDateTimeField;
    qContratoF_LIQUIDACION: TDateTimeField;
    qContratoSIT_CONTRATO: TStringField;
    qContratoTX_COMENTARIO: TStringField;
    qContratoID_PERSONA: TFloatField;
    qContratoRFCT: TStringField;
    qContratoB_IMPR_DOMIC: TStringField;
    qContratoCALLE_NUMERO: TStringField;
    qContratoDOMIC1: TStringField;
    qContratoDOMIC2: TStringField;
    qContratoCODIGO_POSTAL: TStringField;
    qContratoCVE_OPERACION: TStringField;
    qContratoIMP_TRANS_MN: TFloatField;
    qContratoIMP_TRANS_PROD: TFloatField;
    qContratoTC_OPERACION: TFloatField;
    qContratoDESC_BENEF: TStringField;
    qContratoCTA_BENEFICIARIO: TStringField;
    qContratoNOMBRE_BCO_BENEF: TStringField;
    qContratoABA: TStringField;
    qContratoDESCOPER: TStringField;
    qContratoDESCPROD: TStringField;
    qContratoDESC_MONEDA: TStringField;
    qContratoCVE_PRODUCTO: TStringField;
    qContratoID_TRANSACCION: TFloatField;
    DetailBand1: TQRBand;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRShape10: TQRShape;
    QRDBText3: TQRDBText;
    DOMIC1: TQRDBText;
    DOMIC2: TQRDBText;
    DOMIC3: TQRDBText;
    DOMIC4: TQRDBText;
    DOMIC4A: TQRLabel;
    DOMIC4B: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape18: TQRShape;
    QRDBText24: TQRDBText;
    QRShape17: TQRShape;
    QRLabel24: TQRLabel;
    QRDBText23: TQRDBText;
    QRShape16: TQRShape;
    QRLabel23: TQRLabel;
    QRDBText19: TQRDBText;
    QRShape4: TQRShape;
    QRLabel26: TQRLabel;
    QRShape1: TQRShape;
    qrl1: TQRLabel;
    qrl2: TQRLabel;
    qrl3: TQRLabel;
    qrl4: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel15: TQRLabel;
    QRShape24: TQRShape;
    QRShape11: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText1: TQRDBText;
    QrlCopia1: TQRLabel;
    qlTotal: TQRLabel;
    QRShape6: TQRShape;
    QRLabel3: TQRLabel;
    QRBand3: TQRBand;
    qrl5: TQRLabel;
    qContratoSERIE: TStringField;
    qContratoFOLIO: TStringField;
    qContratoSELLO: TStringField;
    qContratoCADENA: TBlobField;
    QRLabelSello: TQRLabel;
    QRLabSelloP1: TQRLabel;
    QRLabSelloP2: TQRLabel;
    QRLabelFolio: TQRLabel;
    QRDBSerie: TQRDBText;
    QRDBFolio: TQRDBText;
    QRLabelCadena: TQRLabel;
    QRLabCadenaP1: TQRLabel;
    QRLabCadenaP2: TQRLabel;
    QRLabCadenaP3: TQRLabel;
    QRLabCadenaP4: TQRLabel;
    QRLabCadenaP5: TQRLabel;
    QRLabCadenaP6: TQRLabel;
    QRLabCadenaP7: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabelPagoExhib: TQRLabel;
    QRLabelFecCreacion: TQRLabel;
    QRDBFecCreacion: TQRDBText;
    QRLabelAnioAprob: TQRLabel;
    QRDBAnioAprob: TQRDBText;
    QRLabelNumAprob: TQRLabel;
    QRDBNumAprob: TQRDBText;
    QRLabelLeyenda: TQRLabel;
    QRLabelNumCert: TQRLabel;
    QRDBNumCert: TQRDBText;
    qContratoFECHA_CREACION: TStringField;
    qContratoANO_APROBACION: TStringField;
    qContratoNUM_APROBACION: TStringField;
    qContratoCERTIFICADO: TStringField;
    QRLabel33: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    qContratoTIPO_CAMBIO: TFloatField;
    qContratoMETODO_PAGO: TStringField;
    qContratoCUENTA: TStringField;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    qContratoREGIMEN: TStringField;
    qContratoNOM_PAIS_EX: TStringField;
    qContratoNOM_ESTADO_EX: TStringField;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel2: TQRLabel;
    procedure qContratoCalcFields(DataSet: TDataSet);
    procedure QRSdSeparadorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText1Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  UnQrComDivC: TUnQrComDivC;
  AApli:TInterApli;
  vBanda:Integer;

FUNCTION Execute_ImpCompCon(pApli          : TInterApli;
                            pMesa          : String;
                            pContratos     : String;
                            pPrinterIndex  : Integer):Boolean;

implementation

{$R *.DFM}

FUNCTION Execute_ImpCompCon(pApli          : TInterApli;
                            pMesa          : String;
                            pContratos     : String;
                            pPrinterIndex  : Integer):Boolean;
Var  QrComDivisas: TUnQrComDivC;
     vlNumRegs : Integer;
     vlImprime : Boolean;                          
begin QrComDivisas := TUnQrComDivC.Create(Nil);
      vBanda:=1;
      Execute_ImpCompCon:=False;
      AApli:=pApli;
      try
         QrComDivisas.qContrato.DatabaseName :=pApli.DataBaseName;
         QrComDivisas.qContrato.SessionName  :=pApli.SessionName;
         QrComDivisas.qContrato.sql.Text:=
' SELECT CONTRATO.ID_CONTRATO, CONTRATO.ID_CLIENTE,    CONTRATO.NOMBRE_CLIENTE, CONTRATO.CVE_MONEDA_BASE, CONTRATO.F_OPERACION, '+
'        CONTRATO.F_LIQUIDACION, CONTRATO.SIT_CONTRATO,CONTRATO.TX_COMENTARIO,CONTRATO.ID_PERSONA,      CONTRATO.RFCT, '+
'        CONTRATO.B_IMPR_DOMIC, CONTRATO.CALLE_NUMERO , CONTRATO.DOMIC1,CONTRATO.DOMIC2,    CONTRATO.CODIGO_POSTAL, TRANSACCION.CVE_OPERACION, '+
'        DECODE(CVE_OPERACION,''C'',IMP_TRANS_MN,''CT'',IMP_TRANS_MN,''CC'',IMP_TRANS_MN,IMP_TRANS_MN * -1) IMP_TRANS_MN, '+
'        TRANSACCION.IMP_TRANS_PROD,TRANSACCION.TC_OPERACION, '+
'        TRANSACCION.DESC_BENEF,TRANSACCION.CTA_BENEFICIARIO,TRANSACCION.NOMBRE_BCO_BENEF,TRANSACCION.ABA, '+
'        DECODE(TRANSACCION.CVE_PRODUCTO,''CO'','''',''IV'','''',TRANSACCION.DESCOPER) DESCOPER, '+
'        TRANSACCION.DESCPROD,TRANSACCION.DESC_MONEDA,TRANSACCION.CVE_PRODUCTO,TRANSACCION.ID_TRANSACCION '+
'        , CONTRATO.SERIE, CONTRATO.FOLIO, CONTRATO.SELLO, CONTRATO.CADENA, ' + // EIB2AARJ 18 nov 2010 NUEVAS COLUMNAS A INCORPORAR, notar la coma al inicio para separar de los campos originalmente considerados
'        CONTRATO.FECHA_CREACION, CONTRATO.ANO_APROBACION, CONTRATO.NUM_APROBACION , CONTRATO.CERTIFICADO, ' +
'        CONTRATO.TIPO_CAMBIO, CONTRATO.METODO_PAGO, CONTRATO.CUENTA, CONTRATO.REGIMEN, CONTRATO.NOM_PAIS_EX,CONTRATO.NOM_ESTADO_EX  ' +
' FROM '+
//EIB2AARJ 18 nov 2010 : '    (SELECT ID_CONTRATO, DI_CONTRATO.ID_CLIENTE,    NOMBRE_CLIENTE, CVE_MONEDA_BASE, F_OPERACION, F_LIQUIDACION, SIT_CONTRATO,DI_CONTRATO.TX_COMENTARIO, '+
'    (SELECT  DI_CONTRATO.ID_CONTRATO, DI_CONTRATO.ID_CLIENTE, NOMBRE_CLIENTE, CVE_MONEDA_BASE, DI_CONTRATO.F_OPERACION, F_LIQUIDACION, SIT_CONTRATO, DI_CONTRATO.TX_COMENTARIO, '+
'            PERSONA.ID_PERSONA,      RTRIM(RFC.SIGLAS_RFC) || RTRIM(RFC.F_RFC) || RTRIM(RFC.HOMOCLAVE_RFC) AS RFCT, '+
'            DI_CLIENTE.B_IMPR_DOMIC, DOMICILIO.CALLE_NUMERO , (DOMICILIO.COLONIA||'',''||CIUDAD.DESC_POBLACION) DOMIC1, '+
'            (ESTADO.DESC_POBLACION || '','' || POBLACION.DESC_POBLACION ) DOMIC2,    DOMICILIO.CODIGO_POSTAL '+
'          , RC.SERIE, RC.FOLIO, RC.SELLO, RC.CADENA  ' + // EIB2AARJ 18 nov 2010 NUEVAS COLUMNAS A INCORPORAR, notar la coma al inicio para separar de los campos originalmente considerados
'          , RC.FECHA_CREACION, RC.ANO_APROBACION, RC.NUM_APROBACION, RC.CERTIFICADO ' +
'          , RC.TIPO_CAMBIO, RC.METODO_PAGO, RC.CUENTA, RF.REGIMEN, RF.NOM_PAIS_EX,RF.NOM_ESTADO_EX' +
'     FROM DI_CONTRATO , POBLACION ESTADO, DOMICILIO, POBLACION, POBLACION CIUDAD, PERSONA, DI_CLIENTE, RFC, RFE_COMPROBANTE RC, RFE_EMISOR RF'+
'     WHERE (DI_CONTRATO.ID_MESA_CAMBIO = '+ pMesa + ') '+
'     AND   (DI_CONTRATO.ID_CONTRATO   IN ( '+ pContratos +') ) '+
'     AND   (DI_CONTRATO.ID_CLIENTE     = PERSONA.ID_PERSONA) '+
'     AND   (RFC.ID_PERSONA             (+)= PERSONA.ID_PERSONA) '+
'     AND   (DI_CLIENTE.ID_PERSONA      = DI_CONTRATO.ID_CLIENTE) '+
'     AND   (PERSONA.ID_DOMICILIO       = DOMICILIO.ID_DOMICILIO) '+
'     AND   (PERSONA.ID_DOMICILIO      = DOMICILIO.ID_DOMICILIO(+)) '+
'     AND   (DOMICILIO.CVE_PAIS        = POBLACION.CVE_POBLACION(+)) '+
'     AND   (DOMICILIO.CVE_ESTADO      = ESTADO.CVE_POBLACION(+)) '+
'     AND   (DOMICILIO.CVE_CIUDAD      = CIUDAD.CVE_POBLACION(+)) '+
'     AND   (DI_CONTRATO.ID_CONTRATO = RC.ID_CONTRATO(+) ) ' + // EIB2AARJ 18 nov 2010 Nueva linea para el join con RFE_COMPROBANTE
'     AND   (RF.ID_CONTRATO = RC.ID_CONTRATO ) ' +
'     ORDER BY DI_CONTRATO.ID_CONTRATO) CONTRATO, '+
    //TRANSACCION
'     (SELECT DI_TRANSACCION.ID_CONTRATO, DI_TRANSACCION.F_OPERACION, DI_TRANSACCION.F_LIQUIDACION, DI_TRANSACCION.CVE_MONEDA, DI_TRANSACCION.CVE_OPERACION, '+
'            DI_TRANSACCION.IMP_TRANS_MN,DI_TRANSACCION.IMP_TRANS_PROD,DI_TRANSACCION.TC_OPERACION,DI_TRANSACCION.TX_COMENTARIO,DI_TRANSACCION.DESC_BENEF, '+
'            DI_TRANSACCION.CTA_BENEFICIARIO,DI_TRANSACCION.NOMBRE_BCO_BENEF,DI_TRANSACCION.ABA,DI_OPERACION.DESC_L_ID_PRIM AS DESCOPER, '+
'            DI_PRODUCTO.DESC_L_ID_PRIM AS DESCPROD,MONEDA.DESC_MONEDA,DI_TRANSACCION.CVE_PRODUCTO,DI_TRANSACCION.ID_TRANSACCION '+
'     FROM DI_TRANSACCION , DI_OPERACION, DI_PRODUCTO, MONEDA '+
'     WHERE (DI_TRANSACCION.ID_MESA_CAMBIO= '+ pMesa + ') '+
'     AND   (DI_TRANSACCION.ID_CONTRATO   IN ( '+ pContratos + ') ) '+
'     AND   (DI_PRODUCTO.ID_MESA_CAMBIO   = '+ pMesa + ') '+
'     AND   (DI_TRANSACCION.CVE_PRODUCTO  = DI_PRODUCTO.CVE_PRODUCTO) '+
'     AND   (DI_TRANSACCION.CVE_OPERACION = DI_OPERACION.CVE_OPERACION) '+
'     AND   (DI_TRANSACCION.CVE_MONEDA    = MONEDA.CVE_MONEDA) '+
'     ORDER BY DI_TRANSACCION.ID_TRANSACCION) TRANSACCION '+
' WHERE CONTRATO.ID_CONTRATO = TRANSACCION.ID_CONTRATO '+
' ORDER BY CONTRATO.ID_CONTRATO, TRANSACCION.ID_TRANSACCION ';

         QrComDivisas.qContrato.Open;

         vlImprime :=(QrComDivisas.qContrato.FieldByName('B_IMPR_DOMIC').AsString = 'V');
         QrComDivisas.DOMIC1.Enabled:=vlImprime;
         QrComDivisas.DOMIC2.Enabled:=vlImprime;
         QrComDivisas.DOMIC3.Enabled:=vlImprime;
         QrComDivisas.DOMIC4.Enabled:=vlImprime;
         QrComDivisas.DOMIC4A.Enabled:=vlImprime;
         QrComDivisas.DOMIC4B.Enabled:=vlImprime;

         
         // EIB2AARJ : 17 DIC 2010 INICIO
         if not(QrComDivisas.qContrato.FieldByName('SELLO').IsNull) then
           begin
             QrComDivisas.QRLabel26.Enabled := False;
           end
         else
           begin
             QrComDivisas.QRLabel26.Enabled := True;
           end;
         // EIB2AARJ : 17 DIC 2010 FIN



         QrComDivisas.PrinterSettings.PrinterIndex:=pPrinterIndex;
         QrComDivisas.QrlCopia1.Caption := 'CONTABILIDAD';
         QrComDivisas.Print; //Preview; //
         Execute_ImpCompCon:=True;

      finally
        QrComDivisas.qContrato.Close;
        QrComDivisas.free;
      end;

end;

procedure TUnQrComDivC.qContratoCalcFields(DataSet: TDataSet);
begin
      if qContrato.FieldByName('SIT_CONTRATO').AsString = 'CA'
      then qContrato.FieldByName('Comentario').AsString:='Este Contrato ya fue liquidado  y se esta <CANCELANDO> en este momento'
      else qContrato.FieldByName('Comentario').AsString:=Dataset.FieldByName('TX_COMENTARIO').AsString;
end;

procedure TUnQrComDivC.QRSdSeparadorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vlNumRegs:Integer;
begin
end;

procedure TUnQrComDivC.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vSuma: Real;
begin
   if not GetSQLFloat(' SELECT SUM(IMP_TRANS_MN) IMP_TRANS_MN '+
                  ' FROM DI_TRANSACCION WHERE ID_CONTRATO = '+ qContrato.FieldByName('ID_CONTRATO').AsString +
                  ' AND  CVE_OPERACION = ''' + qContrato.FieldByName('CVE_OPERACION').AsString + ''' ',
                  AApli.DataBaseName,AApli.SessionName,'IMP_TRANS_MN',vSuma,False)
   then vSuma:=0;

   if (qContrato.FieldByName('CVE_OPERACION').AsString = 'C') OR
      (qContrato.FieldByName('CVE_OPERACION').AsString = 'CT') OR
      (qContrato.FieldByName('CVE_OPERACION').AsString = 'CC') 
   THEN qlTotal.Caption:=FormatFloat('$ ###,###,##0.00', vSuma)
   ELSE qlTotal.Caption:=FormatFloat('$ ###,###,##0.00', vSuma * -1);
   if (qContrato.FieldByName('SIT_CONTRATO').AsString = 'CA') then
   begin
      if (qContrato.FieldByName('CVE_OPERACION').AsString = 'CC') or
         (qContrato.FieldByName('CVE_OPERACION').AsString = 'CV') or
         (qContrato.FieldByName('CVE_OPERACION').AsString = 'CCT') or
         (qContrato.FieldByName('CVE_OPERACION').AsString = 'CVT') then
          PrintBand:=True
      else PrintBand:=False;
   end
   else
      PrintBand:=True;
end;

// EIB2AARJ 23 nov 2010 Modificaciones para presentar los datos de sellado electrónico
procedure TUnQrComDivC.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   vlNumRegs:Integer;
   SelloP1, SelloP2,REGIMEN, TIPO_CAMBIO,METODO_PAGO, CUENTA,MUNICIPIO, PAIS : String;
   Cadena1,Cadena2,Cadena3,Cadena4, Cadena5,
   Cadena6,Cadena7: String;
begin
   GetSQLInt(' SELECT COUNT(ID_TRANSACCION) CUENTA '+
             ' FROM DI_TRANSACCION WHERE ID_CONTRATO = '+ qContrato.FieldByName('ID_CONTRATO').AsString,
          AApli.DataBaseName,AApli.SessionName,'CUENTA',vlNumRegs,False);
   vlNumRegs:=vlNumRegs-2;
   if vBanda = 1 then
   begin
      QRBand1.Height:=283 - (18 * vlNumRegs);
      vBanda:=2;
   end
   else
   begin
      QRBand1.Height:=145;
      vBanda:=1;
   end;


   if not(qContrato.FieldByName('SELLO').IsNull) then
      begin
        SelloP1 := Copy(qContrato.FieldByName('SELLO').AsString,  1,110);
        SelloP2 := Copy(qContrato.FieldByName('SELLO').AsString,111,110);
          REGIMEN := 'TITULO II PERSONAS MORALES REGIMEN GENERAL DE LEY';
         TIPO_CAMBIO := qContrato.FieldByName('TIPO_CAMBIO').AsString;
         METODO_PAGO := qContrato.FieldByName('METODO_PAGO').AsString;
         CUENTA := qContrato.FieldByName('CUENTA').AsString;
         MUNICIPIO := '';
         PAIS := 'MÉXICO';
        QRLabSelloP1.Caption := SelloP1;
        QRLabSelloP2.Caption := SelloP2;
        QRLabel36.Caption := METODO_PAGO;
      end
      else
      begin
        QRLabelPagoExhib.Enabled := False;
        QRLabelSello.Enabled := False;
        QRLabSelloP1.Enabled := False;
        QRLabSelloP2.Enabled := False;
        QRLabelFolio.Enabled := False;
        QRDBSerie.Enabled := False;
        QRDBFolio.Enabled := False;

        QRLabelFecCreacion.Enabled := False;
        QRDBFecCreacion.Enabled := False;

        QRLAbelAnioAprob.Enabled := False;
        QRLabelNumCert.Enabled := False;
        QRLAbelNumAprob.Enabled := False;
        QRDBAnioAprob.Enabled := False;
        QRDBNumCert.Enabled := False;
        QRDBNumAprob.Enabled := False;

        QRLabelLeyenda.Enabled := False;
      end;

      if not(qContrato.FieldByName('CADENA').IsNull) then
      begin
        Cadena1 := Copy(qContrato.FieldByName('CADENA').AsString,  1,145);
        Cadena2 := Copy(qContrato.FieldByName('CADENA').AsString,146,145);
        Cadena3 := Copy(qContrato.FieldByName('CADENA').AsString,291,145);
        Cadena4 := Copy(qContrato.FieldByName('CADENA').AsString,436,145);
        Cadena5 := Copy(qContrato.FieldByName('CADENA').AsString,581,145);
        Cadena6 := Copy(qContrato.FieldByName('CADENA').AsString,726,145);
        Cadena7 := Copy(qContrato.FieldByName('CADENA').AsString,871,145);

        QRLabCadenaP1.Caption := Cadena1;
        QRLabCadenaP2.Caption := Cadena2;
        QRLabCadenaP3.Caption := Cadena3;
        QRLabCadenaP4.Caption := Cadena4;
        QRLabCadenaP5.Caption := Cadena5;
        QRLabCadenaP6.Caption := Cadena6;
        QRLabCadenaP7.Caption := Cadena7;
      end
      else
      begin
        QRLabelCadena.Enabled := False;
        QRLabCadenaP1.Enabled := False;
        QRLabCadenaP2.Enabled := False;
        QRLabCadenaP3.Enabled := False;
        QRLabCadenaP4.Enabled := False;
        QRLabCadenaP5.Enabled := False;
        QRLabCadenaP6.Enabled := False;
        QRLabCadenaP7.Enabled := False;
      end;

end;

procedure TUnQrComDivC.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  IF (qContrato.FieldByName('CVE_OPERACION').AsString = 'C') OR
     (qContrato.FieldByName('CVE_OPERACION').AsString = 'CT') OR
     (qContrato.FieldByName('CVE_OPERACION').AsString = 'CC') THEN
  BEGIN
     qrl1.Enabled:=False;
     qrl2.Enabled:=False;
     qrl3.Enabled:=False;
     qrl4.Enabled:=False;
     qrl5.Enabled:=True;
  END
  ELSE
  BEGIN
     qrl1.Enabled:=True;
     qrl2.Enabled:=True;
     qrl3.Enabled:=True;
     qrl4.Enabled:=True;
     qrl5.Enabled:=False;
  END;
  if (qContrato.FieldByName('SIT_CONTRATO').AsString = 'CA') then
  begin
      if (qContrato.FieldByName('CVE_OPERACION').AsString = 'CC') or
         (qContrato.FieldByName('CVE_OPERACION').AsString = 'CV') or
         (qContrato.FieldByName('CVE_OPERACION').AsString = 'CCT') or
         (qContrato.FieldByName('CVE_OPERACION').AsString = 'CVT') then
         PrintBand:=True
      else PrintBand:=False;
  end
  else
      PrintBand:=True;
end;

procedure TUnQrComDivC.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     if (qContrato.FieldByName('SIT_CONTRATO').AsString = 'CA') then
     begin
        if (qContrato.FieldByName('CVE_OPERACION').AsString = 'CC') or
           (qContrato.FieldByName('CVE_OPERACION').AsString = 'CV') or
           (qContrato.FieldByName('CVE_OPERACION').AsString = 'CCT') or
           (qContrato.FieldByName('CVE_OPERACION').AsString = 'CVT') then
             PrintBand:=True
        else PrintBand:=False;
     end
     else
        PrintBand:=True;
end;

procedure TUnQrComDivC.QRDBText1Print(sender: TObject; var Value: String);
begin
     if (qContrato.FieldByName('SIT_CONTRATO').AsString = 'CA') then
       Value:='Este Contrato ya fue liquidado y se esta <CANCELANDO> en este momento'
     else Value:=qContrato.FieldByName('TX_COMENTARIO').AsString;
end;

end.
