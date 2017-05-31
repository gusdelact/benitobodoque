Unit IntMQrCompDep;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
    IntQRPreview, IntGenCre,UnSQL2, QRExport, UnValDvTrans; //Unidad para obtener información de Histórico dv_transaccion 01/09/2011 JFOF
Type
  TQrCompDep = Class(TQuickRep)
    qyCompDep: TQuery;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRGroupContador: TQRGroup;
    QRGroupMoneda: TQRGroup;
    qyCompDepDESC_MONEDA: TStringField;
    qyCompDepNOMBRE: TStringField;
    qyCompDepID_CREDITO: TFloatField;
    qyCompDepCVE_MONEDA: TFloatField;
    QRGroupAcreditado: TQRGroup;                                            
    QRGroupCtaBanco: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    qyCompDepID_ACREDITADO: TFloatField;
    qyCompDepCUENTA_BANCO: TStringField;
    qyCompDepCVE_TIPO_RAMO: TStringField;
    qyCompDepSECUENCIA: TFloatField;
    qyCompDepTX_OBSERVACIONES: TStringField;
    qyCompDepID_TRANSACCION: TFloatField;
    qyCompDepCONCEPTO: TStringField;
    qyCompDepIMP_TRANS: TFloatField;
    qrgrpFooterChequera: TQRBand;
    QRLabel21: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape24: TQRShape;
    QRDBText6: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRShape18: TQRShape;
    QRShape1: TQRShape;
    QRLabel13: TQRLabel;
    QRShape19: TQRShape;
    QRLabel26: TQRLabel;
    QRShape20: TQRShape;
    QRLabel27: TQRLabel;
    QRShape22: TQRShape;
    QRLabel29: TQRLabel;
    QRShape17: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRShape28: TQRShape;
    QRShape26: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel33: TQRLabel;
    QRBand1: TQRBand;
    QRDBTSituacion: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel4: TQRLabel;
    qyCompDepIMP_MIN_DEPOSITO: TFloatField;
    QRDBText10: TQRDBText;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    qrSUM_IMP_TRANS: TQRLabel;
    QRShape3: TQRShape;
    qrIMP_DEPOSIT: TQRLabel;
    qyCompDepCTA_FIDEICOMISO: TStringField;
    QRDBText14: TQRDBText;
    qyCompDepF_ESTIMADA: TStringField;
    QRDBText13: TQRDBText;
    QRDBText72: TQRDBText;
    qyCompDepF_LIQUIDACION: TDateField;
    procedure QRGroupCtaBancoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpFooterChequeraBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  Private
  Public
    Function FormaQuery(dFInicio, dFFin, dFMovto : TDateTime;
                        sMoneda, sAcreditado, sCtaBco, sDisp, sGpoProd, sEmpresa, sSucursal: String;
                        bFMovto, bResumenSM : Boolean; SitImpresion : Integer;
                        pAPli     : TInterApli): String;
  end;
Var
  QrCompDep: TQrCompDep;
  dImpTransac, dImpEsp : Double;
  Apli : TInterApli;
  sArchivo:String;
  bGenArch: Boolean;
  F: TextFile;

Procedure RepCompDep(  dFInicio, dFFin, dFMovto : TDateTime;
                       sMoneda, sAcreditado, sCtaBco, sDisp, sGpoProd, sEmpresa, sSucursal, sNbrArch: String;
                       bFMovto, bResumenSM : Boolean;
                       SitImpresion : Integer;
                       pAPli     : TInterApli;
                       pPreview  : Boolean);

Implementation
{$R *.DFM}

Procedure RepCompDep(  dFInicio, dFFin, dFMovto : TDateTime;
                       sMoneda, sAcreditado, sCtaBco, sDisp, sGpoProd, sEmpresa, sSucursal, sNbrArch: String;
                       bFMovto, bResumenSM : Boolean;
                       SitImpresion : Integer;
                       pAPli     : TInterApli;
                       pPreview  : Boolean);
Var
   QrCompDep: TQrCompDep;
   Preview     : TIntQRPreview;
   sFileName   : String;
Begin
   QrCompDep:=TQrCompDep.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrCompDep);
   Try
      Apli := pApli;
      bGenArch:= False;
      sArchivo:= sNbrArch;
      QrCompDep.QRInterEncabezado1.Apli:=pApli;
      QrCompDep.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrCompDep.QRInterEncabezado1.NomReporte:='IntMQrCompDep';

      if not bResumenSM then
         QrCompDep.QRInterEncabezado1.Titulo1:='Comparativo de Depósitos esperados contra Depósitos recibidos por Concepto de Fuente de Pago'
      else
         QrCompDep.QRInterEncabezado1.Titulo1:=' Resumen de Comparativo de Depósitos esperados contra Chequeras sin Depósitos recibidos';

      QrCompDep.QRInterEncabezado1.Titulo2:='Periodo del '+  DateToStr(dFInicio) + ' al ' + DateToStr(dFFin);

      QrCompDep.qyCompDep.DatabaseName := pApli.DataBaseName;
      QrCompDep.qyCompDep.SessionName := pApli.SessionName;

      RunSQL('alter session set optimizer_features_enable = ''8.1.7''',pApli.DataBaseName, pApli.SessionName, true);

      runsql('alter session set optimizer_mode = rule',pApli.DataBaseName, pApli.SessionName, true);

      QrCompDep.qyCompDep.Active:=False;
      QrCompDep.qyCompDep.SQL.Text:= QrCompDep.FormaQuery(dFInicio, dFFin, dFMovto,
                                                          sMoneda, sAcreditado, sCtaBco, sDisp, sGpoProd, sEmpresa, sSucursal,
                                                          bFMovto, bResumenSM,SitImpresion, pAPli);
      QrCompDep.qyCompDep.SQL.SaveToFile('c:\ComDep.txt');
      QrCompDep.qyCompDep.Active:=True;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrCompDep.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F, QrCompDep.QRInterEncabezado1.Titulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F,#09#09#09#09#09#09#09 + 'Depósitos Esperados' + #09#09#09#09#09#09 +
                   'Depósitos Recibidos ');
         Writeln(F,
             'Moneda'+ #09 +
             'Desc. Moneda'+ #09 +
             'Id. Acreditado'+ #09 +
             'Nombre Acreditado'+ #09 +
             'Cuenta de Cheques'+ #09 +
             'Cuenta de Fideicomiso'+ #09 +
             'Importe Min. Esperado'+ #09 +
             'Fecha Estimada'+ #09 +
             'Tipo de Ramo'+ #09 +
             'Disposición Relacionada'+ #09 +
             'Secuencia de Afectación'+ #09 +
             'Observaciones'+ #09 +
             'Fecha de Movimiento'+ #09 +
             'Concepto'+ #09 +
             'Importe');
      End;

      If pPreview Then
         QrCompDep.Preview
      Else
         QrCompDep.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrCompDep.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrCompDep.FormaQuery(dFInicio, dFFin, dFMovto : TDateTime;
                        sMoneda, sAcreditado, sCtaBco, sDisp, sGpoProd, sEmpresa, sSucursal: String;
                        bFMovto, bResumenSM : Boolean; SitImpresion : Integer;
                        pAPli     : TInterApli): String;
Var
    sSQL : String;
    dvValid : String;
Begin
                    
    sSQL:=  ' SELECT DV.*, CR.* ' + coCRLF +
            ' FROM ( SELECT ' + coCRLF +
            '                PKGCRSALDOS.FunRegCtas( CCC.CUENTA_BANCO,''CR'') REG, ' + coCRLF +
            '                NVL(MAX(CRC.IMP_MIN_DEPOSITO),0) IMP_MIN_DEPOSITO, ' + coCRLF +
            '                CCC.CUENTA_BANCO,' + coCRLF +
            '                to_char(DIA_RECEP_APORT)|| ' + coCRLF +
            '                        to_char('+ SQLFecha(dFFin) + ',''/MM/YYYY'') AS F_ESTIMADA, ' + coCRLF +
//            '                (''Depósito por Ramo ''||CRC.CVE_TIPO_RAMO) AS CVE_TIPO_RAMO, ' + coCRLF +
            //HERJA 29.11.2010
            '                ( CASE '+coCRLF+
            '                  WHEN CRC.CVE_TIPO_RAMO = ''28'' THEN ''Depósito por Ramo 28'' '+coCRLF+
            '                  WHEN CRC.CVE_TIPO_RAMO = ''33'' THEN ''Depósito por Ramo 33'' '+coCRLF+
            '                  WHEN CRC.CVE_TIPO_RAMO = ''00'' THEN ''Depósito por Otro Ramo (''||CRC.CTA_FIDEICOMISO||'')'' '+coCRLF+
            '                  ELSE ''Depósito por Otro Ramo'' '+coCRLF+
            '                END) CVE_TIPO_RAMO, '+coCRLF+
            //FIN HERJA 29.11.2010
            '                CRC.ID_CREDITO, CRC.SECUENCIA, CRC.CTA_FIDEICOMISO,' + coCRLF +
            '                DECODE(CRC.B_MES_SIN_REC,''V'', ''Mes de excepción sin envio de recursos '',null) AS TX_OBSERVACIONES ' + coCRLF +
            '          FROM CR_REL_CRED_CHEQ CRC, CR_CRED_CHEQ CCC,  ' + coCRLF +
            '               CR_MESES_SIN_REC CMSR, ' + coCRLF +
            '               CR_CREDITO CC, CONTRATO CTO, ' + coCRLF+
            //JFOF HISTORICO DV_TRANSACCION 01/09/2011
            ' ( '; //+ coCRLF +
           dvValid :=
            '                SELECT ID_CONTRATO FROM '+ cControlDVT +'DV_TRANSACCION '+coCRLF +
            '                 WHERE ID_CONTRATO IN ( SELECT CUENTA_BANCO FROM CR_REL_CRED_CHEQ WHERE SIT_REL_CRED = ''AC''' + coCRLF;
            If (Trim(sDisp)<>'')    Then
               dvValid:= dvValid + '            AND ID_CREDITO = '+ sDisp+ coCRLF ;
            If (Trim(sGpoProd)<>'') Then
               dvValid:= dvValid +
            '                   AND ID_CREDITO IN (SELECT ID_CREDITO FROM CR_CREDITO WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CR_CONTRATO WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO WHERE CVE_PRODUCTO_GPO = '+ SQLStr(sGpoProd)+')))'+  coCRLF ;
     dvValid:= dvValid +
            '                   ) AND CVE_OPERACION IN (''DPSIAC'', ''DESPEI'') ' + coCRLF+
            '                   AND F_LIQUIDACION BETWEEN '+fSetBetween(dFInicio, dFFin); //' + SQLFecha(dFInicio) + ' AND ' + SQLFecha(dFFin)+

            sSQL := sSQL + fValidaFechasDvTransaccion(dvValid, pAPli) +
            '               )DV ' ;//+ coCRLF+
            sSQL := sSQL +
            //FIN JFOF  HISTORICO DV_TRANSACCION 01/09/2011 
            '          WHERE CRC.SIT_REL_CRED = ''AC''' + coCRLF;
            //filtros del credito
            If (Trim(sEmpresa)<>'') Then
               sSQL:= sSQL +
            '            AND CTO.ID_EMPRESA = '+ sEmpresa+ coCRLF;
            If (Trim(sDisp)<>'') Then
               sSQL:= sSQL + '            AND CRC.ID_CREDITO = '+ sDisp+ coCRLF ;
            If (Trim(sGpoProd)<>'') Then
               sSQL:= sSQL +
            '            AND CRC.ID_CREDITO IN (SELECT ID_CREDITO FROM CR_CREDITO WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CR_CONTRATO WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO WHERE CVE_PRODUCTO_GPO = '+ SQLStr(sGpoProd)+')))'+  coCRLF ;

     //SITUACIÓN ACTIVA
     if SitImpresion = 1 then
     begin
         sSQL:= sSQL +  ' AND CC.SIT_CREDITO = ''AC''' + coCRLF;
     end;

     sSQL:= sSQL +
            '            AND CCC.ID_CREDITO         = CRC.ID_CREDITO ' + coCRLF +
            '            AND CCC.ID_BANCO_CHQRA     = CRC.ID_BANCO_CHQRA ' + coCRLF +
            '            AND CCC.CUENTA_BANCO       = CRC.CUENTA_BANCO ' + coCRLF +
            '            AND CMSR.ID_CREDITO (+)    = CRC.ID_CREDITO ' + coCRLF +
            '            AND CMSR.ID_BANCO_CHQRA(+) = CRC.ID_BANCO_CHQRA ' + coCRLF +
            '            AND CMSR.CUENTA_BANCO (+)  = CRC.CUENTA_BANCO ' + coCRLF +
            '            AND CMSR.SECUENCIA (+)     = CRC.SECUENCIA ' + coCRLF +
            '            AND CC.ID_CREDITO          = CCC.ID_CREDITO ' + coCRLF +
            '            AND CTO.ID_CONTRATO        = CC.ID_CONTRATO ' + coCRLF+
            '            AND CRC.CUENTA_BANCO       = DV.ID_CONTRATO(+) ' + coCRLF+
            '          GROUP BY CCC.CUENTA_BANCO, CCC.CUENTA_BANCO, CCC.ID_BANCO_CHQRA,' + coCRLF +
            '                CRC.B_MES_SIN_REC, CMSR.F_INI_MES, DIA_RECEP_APORT,' + coCRLF +
            '                CRC.CVE_TIPO_RAMO, CRC.ID_CREDITO, CRC.SECUENCIA, ' + coCRLF +
            '                CC.ID_CONTRATO,CRC.CTA_FIDEICOMISO ' + coCRLF +
            '          ORDER BY CCC.CUENTA_BANCO, CRC.DIA_RECEP_APORT' + coCRLF ;
     sSQL:= sSQL +
            '        )CR, ' + coCRLF +
            '       ( SELECT PKGCRSALDOS.FunRegCtas( D.CUENTA_BANCO,''DV'') REG, D.* ' + coCRLF +
            '         FROM ( ' + coCRLF +
            '               SELECT CR.CVE_MONEDA, CR.DESC_MONEDA, ' + coCRLF +
            '                      CR.ID_ACREDITADO, CR.NOMBRE, ' + coCRLF +
            '                      CR.CUENTA_BANCO, ' + coCRLF +
            '                      DV.ID_TRANSACCION, ' + coCRLF +
            '                      DV.F_LIQUIDACION, ' + coCRLF +
            '                      NVL(DV.IMP_TRANS,0) IMP_TRANS, ' + coCRLF +
            '                      DV.CONCEPTO ' + coCRLF +
            '               FROM ( SELECT DVT.ID_CONTRATO AS CUENTA_BANCO, ' + coCRLF +
            '                             DVT.ID_TRANSACCION, ' + coCRLF +
            '                             DVT.F_LIQUIDACION, ' + coCRLF +
            '                             DVT.IMP_TRANS, ' + coCRLF +
            '                             DVO.DESC_L_ID_PRIM||DVT.TX_REFERENCIA CONCEPTO ' + coCRLF +
            '                      FROM ( '+ //DV_TRANSACCION DVT, JFOF HISTORICO DV_TRANSACCION 01/09/2011
                  fValidaFechasDvTransaccion(
            '                         ( SELECT ID_CONTRATO,' + coCRLF +
            '                                  ID_TRANSACCION, ' + coCRLF +
            '                                  F_LIQUIDACION, ' + coCRLF +
            '                                  IMP_TRANS, ' + coCRLF +
            '                                  TX_REFERENCIA,' + coCRLF +
            '                                  CVE_OPERACION ' + coCRLF +
            '                             FROM '+ cControlDVT +'DV_TRANSACCION' + coCRLF +
            '                            WHERE ID_COD_RESP = 0 ' + coCRLF +
            '                              AND F_LIQUIDACION  BETWEEN '+ fSetBetween(dFInicio, dFFin) + ' ) ', pApli)+
            ' ) DVT, '+
                // FIN HISTORICO DV_TRANSACCION 01/09/2011 JFOF
            ' DV_OPERACION DVO ' + coCRLF +
            '                      WHERE DVT.ID_CONTRATO IN( SELECT CUENTA_BANCO FROM CR_REL_CRED_CHEQ WHERE SIT_REL_CRED = ''AC'' ' + coCRLF;
                                                           //FITROS CREDITO
            If (Trim(sDisp)<>'')    Then
               sSQL:= sSQL +
            '                                                  AND ID_CREDITO = '+ sDisp+ coCRLF ;
            If (Trim(sGpoProd)<>'') Then
               sSQL:= sSQL +
            '                                                  AND ID_CREDITO IN (SELECT ID_CREDITO FROM CR_CREDITO WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CR_CONTRATO WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO WHERE CVE_PRODUCTO_GPO = '+ SQLStr(sGpoProd)+')))'+  coCRLF ;
     sSQL:= sSQL +
            '                        ) AND DVT.CVE_OPERACION IN (''DPSIAC'', ''DESPEI'') ' + coCRLF +
//            '                        AND DVT.FH_OPERACION  BETWEEN ' + SQLFecha(dFInicio) + ' AND ' + SQLFecha(dFFin)+coCRLF +
            '                        AND DVO.CVE_OPERACION = DVT.CVE_OPERACION ' + coCRLF +
            '                    ) DV, ' + coCRLF +
            '                    ( SELECT C.CVE_MONEDA, M.DESC_MONEDA, ' + coCRLF +
            '                             P.ID_PERSONA ID_ACREDITADO, P.NOMBRE, CRC.CUENTA_BANCO ' + coCRLF +
            '                      FROM CR_REL_CRED_CHEQ CRC, CR_CREDITO CR, ' + coCRLF +
            '                           CONTRATO C, MONEDA M, PERSONA P ' + coCRLF +
            '                      WHERE CRC.SIT_REL_CRED = ''AC'' ' + coCRLF;
                                                           //FITROS CREDITO
            If (Trim(sDisp)<>'') Then
               sSQL:= sSQL +
            '                                                  AND CRC.ID_CREDITO = '+ sDisp+ coCRLF ;
            If (Trim(sGpoProd)<>'') Then
               sSQL:= sSQL +
            '                        AND CRC.ID_CREDITO IN (SELECT ID_CREDITO FROM CR_CREDITO WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CR_CONTRATO WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO WHERE CVE_PRODUCTO_GPO = '+ SQLStr(sGpoProd)+')))'+  coCRLF ;

     //SITUACIÓN ACTIVA
     if SitImpresion = 1 then
     begin
         sSQL:= sSQL +  ' AND CR.SIT_CREDITO = ''AC''' + coCRLF;
     end;

     sSQL:= sSQL +
            '                        AND CRC.ID_CREDITO = CR.ID_CREDITO ' + coCRLF +
            '                        AND CR.ID_CONTRATO = C.ID_CONTRATO ' + coCRLF +
            '                        AND C.ID_TITULAR   = P.ID_PERSONA ' + coCRLF +
            '                        AND C.CVE_MONEDA   = M.CVE_MONEDA ' + coCRLF +
            '                      GROUP BY C.CVE_MONEDA, M.DESC_MONEDA, ' + coCRLF +
            '                               P.ID_PERSONA , P.NOMBRE, CRC.CUENTA_BANCO ' + coCRLF +
            '                    )CR ' + coCRLF +
            '               WHERE DV.CUENTA_BANCO(+) = CR.CUENTA_BANCO ' + coCRLF +
            '               ORDER BY DV.CUENTA_BANCO, DV.F_LIQUIDACION ' + coCRLF +
            '              )D ' + coCRLF +
            '       ) DV ' + coCRLF +
            ' WHERE 1 = 1' +  coCRLF ;
            //			--- FILTROS
               If (Trim(sMoneda)<>'') Then
                  sSQL:= sSQL + '   AND DV.CVE_MONEDA = '+ sMoneda + coCRLF ;
               If (Trim(sAcreditado)<>'') Then
                  sSQL:= sSQL + '   AND DV.ID_ACREDITADO = '+ sAcreditado + coCRLF ;
               If (Trim(sCtaBco)<>'') Then
                  sSQL:= sSQL + '   AND DV.CUENTA_BANCO = '+ sCtaBco + coCRLF ;
               If bFMovto Then
                  sSQL:= sSQL + '   AND NVL(DV.F_LIQUIDACION,SYSDATE) =  '+ SQLFecha(dFMovto)+ coCRLF ;
              // < / EASA    17 ABRIL 2006
               IF bResumenSM THEN
                 sSQL:= sSQL + '   AND DV.IMP_TRANS <= 0 '+ coCRLF ;
              //END IF;

     sSQL:= sSQL +
            '   AND DV.REG    = CR.REG(+)' +  coCRLF +
            '   AND DV.CUENTA_BANCO = CR.CUENTA_BANCO(+)' +  coCRLF +
            '  ORDER BY DV.CVE_MONEDA, DV.NOMBRE, DV.CUENTA_BANCO, DV.F_LIQUIDACION, DV.REG';

    Result:= sSQL;
End;

procedure TQrCompDep.QRGroupCtaBancoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   dImpTransac := 0;
   dImpEsp:= qyCompDepIMP_MIN_DEPOSITO.AsFloat;
end;

procedure TQrCompDep.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   dImpTransac := dImpTransac + qyCompDepIMP_TRANS.AsFloat;
      If Trim(sArchivo)<>'' Then Begin
         Writeln(F,
                  qyCompDep.FieldByName('CVE_MONEDA').AsString + #09 +
                  qyCompDep.FieldByName('DESC_MONEDA').AsString + #09 +
                  qyCompDep.FieldByName('ID_ACREDITADO').AsString + #09 +
                  qyCompDep.FieldByName('NOMBRE').AsString + #09 +
                  qyCompDep.FieldByName('CUENTA_BANCO').AsString + #09 +
                  qyCompDep.FieldByName('CTA_FIDEICOMISO').AsString + #09 +
                  FormatFloat('###,###,###,###,##0.00',qyCompDep.FieldByName('IMP_MIN_DEPOSITO').AsFloat) + #09+
                  qyCompDep.FieldByName('F_ESTIMADA').AsString + #09 +
                  qyCompDep.FieldByName('CVE_TIPO_RAMO').AsString + #09 +
                  qyCompDep.FieldByName('ID_CREDITO').AsString + #09 +
                  qyCompDep.FieldByName('SECUENCIA').AsString + #09 +
                  qyCompDep.FieldByName('TX_OBSERVACIONES').AsString + #09 +
                  FormatDateTime('dd/mm/yyyy',qyCompDep.FieldByName('F_LIQUIDACION').AsDateTime) + #09+
                  qyCompDep.FieldByName('CONCEPTO').AsString + #09 +
                  FormatFloat('###,###,###,###,##0.00',qyCompDep.FieldByName('IMP_TRANS').AsFloat)
                );
      End;
end;

procedure TQrCompDep.qrgrpFooterChequeraBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrSUM_IMP_TRANS.Caption := FormatFloat('###,###,###,###,##0.00',dImpTransac);
   qrIMP_DEPOSIT.Caption :=   FormatFloat('###,###,###,###,##0.00',dImpEsp);
      If Trim(sArchivo)<>'' Then Begin
         Writeln(F,
                  #09 +
                  'Total de Depósitos Esperados' +
                  #09#09#09#09#09#09#09 +
                  FormatFloat('###,###,###,###,##0.00',dImpTransac)+ #09 +
                  'Total de Depósitos Recibidos'+ #09#09 +
                  FormatFloat('###,###,###,###,##0.00',dImpEsp)
                );
      End;
end;

End.
