Unit IntMQrRecRecib;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport, UnValDvTrans; //Unidad para obtener información de Histórico dv_transaccion 02/09/2011 JFOF
Type
  TQrRecRecib = Class(TQuickRep)
    qyRecRecib: TQuery;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qrgrpFooterGroup0: TQRBand;
    QRGroupContador: TQRGroup;
    QRGroupMoneda: TQRGroup;
    QRSHPMoneda: TQRShape;
    QRLabel46: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    qyRecRecibDESC_MONEDA: TStringField;
    qyRecRecibNOMBRE: TStringField;
    qyRecRecibID_CREDITO: TFloatField;
    qyRecRecibCVE_MONEDA: TFloatField;
    QRGroup1: TQRGroup;
    qrgCHEQ: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    qyRecRecibID_ACREDITADO: TFloatField;
    qyRecRecibCUENTA_BANCO: TStringField;
    QRLabel5: TQRLabel;
    qyRecRecibCVE_TIPO_RAMO: TStringField;
    qyRecRecibF_VENCIMIENTO: TDateTimeField;
    qyRecRecibSDO_VIG_TOTAL: TFloatField;
    qyRecRecibSDO_CHEQUERA: TFloatField;
    qyRecRecibIMP_TRANS: TFloatField;
    qyRecRecibID_TRANSACCION: TFloatField;
    qyRecRecibCONCEPTO: TStringField;
    QRLabel19: TQRLabel;
    qrSUM_IMP_TRANS: TQRLabel;
    QRShape1: TQRShape;
    QRDBText6: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    qyRecRecibSDO_COMPROMETIDO: TFloatField;
    qyRecRecibSDO_DISPONIBLE: TFloatField;
    qyRecRecibSDO_TOTAL: TFloatField;
    qyRecRecibIMP_PROX_VTO: TFloatField;
    qrshCtaChqra: TQRShape;
    qrshF_MOVTO: TQRShape;
    qrlF_MOVTO: TQRLabel;
    qrlCtaChqra: TQRLabel;
    qrshCONCEPTO: TQRShape;
    qrlCONCEPTO: TQRLabel;
    qrshIMP_TRANS: TQRShape;
    qrlIMP_TRANS: TQRLabel;
    qrshSDO_TRANS: TQRShape;
    qrshCREDITOS: TQRShape;
    qrlCREDITOS: TQRLabel;
    qrshID_CRED: TQRShape;
    qrlID_CRED: TQRLabel;
    qrshSDO_INSOL: TQRShape;
    qrshF_VTO: TQRShape;
    qrshIMP_VTO: TQRShape;
    qrlIMP_VTO: TQRLabel;
    qrlF_VTO: TQRLabel;
    qrlSDO_INSOL: TQRLabel;
    QRLabel4: TQRLabel;
    qrSUM_SDO_VIG_TOTAL: TQRLabel;
    qrSUM_IMP_PROX_VTO: TQRLabel;
    qrbDETALLE: TQRBand;
    QRDBTSituacion: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText21: TQRDBText;
    qrlSDO_TRANS: TQRLabel;
    qyRecRecibCTA_FIDEICOMISO: TStringField;
    QRDBText14: TQRDBText;
    qyRecRecibF_LIQUIDACION: TDateField;
    procedure qrgCHEQBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpFooterGroup0BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDETALLEBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText24Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);

  Private
  Public
    Function FormaQuery(dFInicio, dFFin, dFecha: TDateTime;
                        sMoneda, sAcreditado, sDisp, sCtaBco, sGpoProd, sEmpresa, sSucursal: String;
                        bFMovto, bResumenSM : Boolean;
                        pAPli     : TInterApli): String;
  end;
Var
  QrRecRecib: TQrRecRecib;
  dSdoInsoluto, dImpProxVto, dImpTransac : Double;
  Apli : TInterApli;
  sArchivo:String;
  bGenArch: Boolean;
  F: TextFile;
  bResumenGrl: Boolean;

Procedure RepRecRecib( dFInicio, dFFin, dFecha: TDateTime;
                       sMoneda, sAcreditado, sDisp, sCtaBco, sGpoProd, sEmpresa, sSucursal, sNbrArch: String;
                       bFMovto, bResumenSM : Boolean;
                       pAPli     : TInterApli;
                       pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepRecRecib( dFInicio, dFFin, dFecha: TDateTime;
                       sMoneda, sAcreditado, sDisp, sCtaBco, sGpoProd, sEmpresa, sSucursal, sNbrArch: String;
                       bFMovto,bResumenSM : Boolean;
                       pAPli     : TInterApli;
                       pPreview  : Boolean);
Var
   QrRecRecib: TQrRecRecib;
   Preview     : TIntQRPreview;
   sFileName   : String;
Begin
   QrRecRecib:=TQrRecRecib.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrRecRecib);
   Try

      Apli := pApli;
      bGenArch:= False;
      sArchivo:= sNbrArch;
      bResumenGrl:= bResumenSM;
      QrRecRecib.QRInterEncabezado1.Apli:=pApli;
      QrRecRecib.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrRecRecib.QRInterEncabezado1.NomReporte:='IntMQrRecRecib';
      if not bResumenSM then
        QrRecRecib.QRInterEncabezado1.Titulo1:='Recursos Recibidos'
      else
        QrRecRecib.QRInterEncabezado1.Titulo1:='Resumen de Chequeras sin Recursos Recibidos';
      QrRecRecib.QRInterEncabezado1.Titulo2:='Del '+  DateToStr(dFInicio) + ' al ' + DateToStr(dFFin);

      QrRecRecib.qyRecRecib.DatabaseName := pApli.DataBaseName;
      QrRecRecib.qyRecRecib.SessionName := pApli.SessionName;

      QrRecRecib.qyRecRecib.Active:=False;
      QrRecRecib.qyRecRecib.SQL.Text:= QrRecRecib.FormaQuery(dFInicio, dFFin, dFecha,
                                                sMoneda, sAcreditado, sDisp, sCtaBco, sGpoProd, sEmpresa, sSucursal,
                                                bFMovto, bResumenSM, pAPli );
      QrRecRecib.qyRecRecib.SQL.SaveToFile('c:\RecRecib.txt');
      QrRecRecib.qyRecRecib.Active:=True;

      if not bResumenSM then Begin
         QrRecRecib.qrbDETALLE.Enabled := True;
         QrRecRecib.qrshCtaChqra.Enabled := True;
         QrRecRecib.qrlCtaChqra.Enabled := True;
         QrRecRecib.qrshF_MOVTO.Enabled := True;
         QrRecRecib.qrlF_MOVTO.Enabled := True;
         QrRecRecib.qrshCONCEPTO.Enabled := True;
         QrRecRecib.qrlCONCEPTO.Enabled := True;
         QrRecRecib.qrshIMP_TRANS.Enabled := True;
         QrRecRecib.qrlIMP_TRANS.Enabled := True;
         QrRecRecib.qrshSDO_TRANS.Enabled := True;
         QrRecRecib.qrlSDO_TRANS.Enabled := True;
         QrRecRecib.qrshID_CRED.Enabled := True;
         QrRecRecib.qrlID_CRED.Enabled := True;
         QrRecRecib.qrshSDO_INSOL.Enabled := True;
         QrRecRecib.qrlSDO_INSOL.Enabled := True;
         QrRecRecib.qrshF_VTO.Enabled := True;
         QrRecRecib.qrlF_VTO.Enabled := True;
         QrRecRecib.qrshIMP_VTO.Enabled := True;
         QrRecRecib.qrlIMP_VTO.Enabled := True;
         QrRecRecib.qrlCREDITOS.Enabled := True;
         QrRecRecib.qrshCREDITOS.Enabled := True;
         QrRecRecib.qrgCHEQ.Height := 38;
         QrRecRecib.qrgrpFooterGroup0.Enabled := True;
      end
      else Begin
         QrRecRecib.qrbDETALLE.Enabled := False;
         QrRecRecib.qrbDETALLE.Enabled := False;
         QrRecRecib.qrshCtaChqra.Enabled := False;
         QrRecRecib.qrlCtaChqra.Enabled := False;
         QrRecRecib.qrshF_MOVTO.Enabled := False;
         QrRecRecib.qrlF_MOVTO.Enabled := False;
         QrRecRecib.qrshCONCEPTO.Enabled := False;
         QrRecRecib.qrlCONCEPTO.Enabled := False;
         QrRecRecib.qrshIMP_TRANS.Enabled := False;
         QrRecRecib.qrlIMP_TRANS.Enabled := False;
         QrRecRecib.qrshSDO_TRANS.Enabled := False;
         QrRecRecib.qrlSDO_TRANS.Enabled := False;
         QrRecRecib.qrshID_CRED.Enabled := False;
         QrRecRecib.qrlID_CRED.Enabled := False;
         QrRecRecib.qrshSDO_INSOL.Enabled := False;
         QrRecRecib.qrlSDO_INSOL.Enabled := False;
         QrRecRecib.qrshF_VTO.Enabled := False;
         QrRecRecib.qrlF_VTO.Enabled := False;
         QrRecRecib.qrshIMP_VTO.Enabled := False;
         QrRecRecib.qrlIMP_VTO.Enabled := False;
         QrRecRecib.qrlCREDITOS.Enabled := False;
         QrRecRecib.qrshCREDITOS.Enabled := False;
         QrRecRecib.qrgCHEQ.Height := 12;
         QrRecRecib.qrgrpFooterGroup0.Enabled := False;
      end;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrRecRecib.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F, QrRecRecib.QRInterEncabezado1.Titulo2+ #09 );
      end;
         
      if not bResumenGrl then Begin
         If Trim(sArchivo)<>'' Then Begin

         Writeln(F,  #09 );
         Writeln(F,#09#09#09#09#09#09#09#09#09#09#09 + 'Cuenta de Cheques' + #09#09+
                   'Créditos ');

         Writeln(F,
             'Moneda'+ #09 +
             'Desc. Moneda'+ #09 +
             'Id. Acreditado'+ #09 +
             'Nombre Acreditado'+ #09 +
             'Cuenta de Cheques'+ #09 +
             'Cuenta de Fideicomiso'+ #09 +
             'Ramo / Prerrogativa'+ #09 +
             'Sdo. Bloqueado:'+ #09 +
             'Sdo. Disponible:'+ #09 +
             'Sdo. Total:'+ #09 +
             'Fecha Movimiento'+ #09 +
             'Id Transacción'+ #09 +
             'Concepto'+ #09 +
             'Importe'+ #09 +
             'Saldo'+ #09 +
             'No. Disposición'+ #09 +
             'Saldo Insoluto'+ #09 +
             'Fecha Próx. Vencimiento'+ #09 +
             'Imp. Próximo Vencimiento'
             );
         End;
      END;
      If pPreview Then
         QrRecRecib.Preview
      Else
         QrRecRecib.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrRecRecib.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrRecRecib.FormaQuery(dFInicio, dFFin, dFecha: TDateTime;
                                sMoneda, sAcreditado, sDisp, sCtaBco, sGpoProd, sEmpresa, sSucursal: String;
                                bFMovto, bResumenSM : Boolean;
                                pAPli     : TInterApli): String;
Var
    sSQL    : String;
    dvValid : String;
Begin

    sSQL:=  ' SELECT DV.*, CR.* ' + coCRLF +
            ' FROM ( SELECT ' + coCRLF +
            '                PKGCRSALDOS.FunRegCtas( CCC.CUENTA_BANCO,''CR'') REG, ' + coCRLF +
            '                NVL(MAX(CRC.IMP_MIN_DEPOSITO),0) IMP_MIN_DEPOSITO, ' + coCRLF +
            '                CCC.CUENTA_BANCO,' + coCRLF +
{ROIM 09/09/2007  SE CORRIGIÓ PROBLEMA DE FORMATO PARA ARMAR FECHA}
{            '                to_date(to_char(DIA_RECEP_APORT)|| ' + coCRLF + }
{/ROIM}
            '                to_date(to_char(DIA_RECEP_APORT)||'+#39+'/'+#39+'||' + coCRLF +
            '                        to_char('+ SQLFecha(dFFin) + ',''MM/YYYY''),''DD/MM/YYYY'') AS F_ESTIMADA, ' + coCRLF +
            '                (''Depósito por Ramo ''||CRC.CVE_TIPO_RAMO) AS CVE_TIPO_RAMO, ' + coCRLF +
            '                CC.ID_CREDITO, ' + coCRLF +
            '                CC.SDO_VIG_TOTAL, ' + coCRLF +
            '                DECODE(CC.SIT_CREDITO, ''LQ'', 0, PKGCRSALDOS.ObtImporteVto(CC.ID_CREDITO,3 ) )AS IMP_PROX_VTO, ' + coCRLF +
            '                PKGCRCUOTAS.obtfproxvto(CC.ID_CREDITO) F_VENCIMIENTO, CRC.CTA_FIDEICOMISO ' + coCRLF +
            '          FROM CR_REL_CRED_CHEQ CRC, CR_CRED_CHEQ CCC,  ' + coCRLF +
            '               CR_MESES_SIN_REC CMSR, ' + coCRLF +
            '               CR_CREDITO CC, CONTRATO CTO, ' + coCRLF+
            //JFOF HISTORICO DV_TRANSACCION 02/09/2011
            ' ( ';
          dvValid:=
            '                SELECT ID_CONTRATO FROM '+ cControlDVT +'DV_TRANSACCION '+coCRLF +
            '                 WHERE ID_CONTRATO IN ( SELECT CUENTA_BANCO FROM CR_REL_CRED_CHEQ WHERE SIT_REL_CRED = ''AC''' + coCRLF;
            If (Trim(sDisp)<>'') Then
               dvValid:= dvValid + '            AND ID_CREDITO = '+ sDisp+ coCRLF ;
            If (Trim(sGpoProd)<>'') Then
               dvValid:= dvValid +
            '                   AND ID_CREDITO IN (SELECT ID_CREDITO FROM CR_CREDITO WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CR_CONTRATO WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO WHERE CVE_PRODUCTO_GPO = '+ SQLStr(sGpoProd)+')))'+  coCRLF ;
          dvValid:= dvValid +
            '                   ) AND CVE_OPERACION IN (''DPSIAC'', ''DESPEI'') ' + coCRLF+
            '                   AND F_LIQUIDACION BETWEEN '+fSetBetween(dFInicio, dFFin); //+ SQLFecha(dFInicio) + ' AND ' + SQLFecha(dFFin)+

          sSQL:= sSQL + fValidaFechasDvTransaccion(dvValid, pAPli) +
            '               )DV '; //+ coCRLF+
          sSQL:= sSQL +
                   //FIN JFOF  HISTORICO DV_TRANSACCION 02/09/2011

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
            '                CRC.CVE_TIPO_RAMO, CC.ID_CREDITO, ' + coCRLF +
            '                CC.ID_CONTRATO, CC.SDO_VIG_TOTAL,CC.SIT_CREDITO, CRC.CTA_FIDEICOMISO ' + coCRLF +
            '          ORDER BY CCC.CUENTA_BANCO, CRC.DIA_RECEP_APORT' + coCRLF ;
     sSQL:= sSQL +
            '        )CR, ' + coCRLF +
            '       ( SELECT PKGCRSALDOS.FunRegCtas( D.CUENTA_BANCO,''DV'') REG, D.*, ' + coCRLF +
            '                PKGCRCUOTAS.ObtSdoCheq(D.CUENTA_BANCO,' + SQLFecha(dFInicio) + ' ) SDO_INI_CHEQ ' + coCRLF +
            '         FROM ( ' + coCRLF +
            '               SELECT CR.CVE_MONEDA, CR.DESC_MONEDA, ' + coCRLF +
            '                      CR.ID_ACREDITADO, CR.NOMBRE, ' + coCRLF +
            '                      CR.CUENTA_BANCO, ' + coCRLF +
            '                      DV.ID_TRANSACCION, ' + coCRLF +
            '                      DV.F_LIQUIDACION, ' + coCRLF +
            '                      NVL(DV.IMP_TRANS,0)IMP_TRANS, ' + coCRLF +
            '                      DV.CONCEPTO, SDO_COMPROMETIDO, SDO_DISPONIBLE, SDO_TOTAL, /*SDO_INI_CHEQ,*/SDO_CHEQUERA ' + coCRLF +
            '               FROM ( SELECT DVT.ID_CONTRATO AS CUENTA_BANCO, ' + coCRLF +
            '                             PKGCRCUOTAS.ObtSdoCheq(DVT.ID_CONTRATO, DVT.F_LIQUIDACION) SDO_CHEQUERA, ' + coCRLF +
            '                             DVT.ID_TRANSACCION, ' + coCRLF +
            '                             DVT.F_LIQUIDACION, ' + coCRLF +
            '                             DVT.IMP_TRANS, ' + coCRLF +
            '                             DVO.DESC_L_ID_PRIM||DVT.TX_REFERENCIA CONCEPTO, ' + coCRLF +
            '                             PKGCRSALDOS.StpObtTipSdoCtaDV( DVT.ID_CONTRATO, 2) SDO_COMPROMETIDO, ' + coCRLF +
            '                             PKGCRSALDOS.StpObtTipSdoCtaDV( DVT.ID_CONTRATO, 3) SDO_DISPONIBLE, ' + coCRLF +
            '                             PKGCRSALDOS.StpObtTipSdoCtaDV( DVT.ID_CONTRATO, 1) SDO_TOTAL ' + coCRLF +
            '                      FROM ( '+  //DV_TRANSACCION DVT,  JFOF HISTORICO DV_TRANSACCION 02/09/2011
            fValidaFechasDvTransaccion(
            '                          ( SELECT ID_CONTRATO, ' + coCRLF +
            '                                   F_LIQUIDACION, ' + coCRLF +
            '                                   ID_TRANSACCION, ' + coCRLF +
            '                                   IMP_TRANS, ' + coCRLF +
            '                                    TX_REFERENCIA,' + coCRLF +
            '                                   CVE_OPERACION ' + coCRLF +
            '                              FROM '+ cControlDVT +'DV_TRANSACCION' + coCRLF +
            '                             WHERE ID_COD_RESP = 0 ' + coCRLF +
            '                               AND F_LIQUIDACION  BETWEEN '+ fSetBetween(dFInicio, dFFin) + ' ) ', pApli) +coCRLF +
            ' ) DVT, ' +coCRLF +
                // FIN HISTORICO DV_TRANSACCION 02/09/2011 JFOF
            '   DV_OPERACION DVO ' + coCRLF +
            '                      WHERE DVT.ID_CONTRATO IN( SELECT CUENTA_BANCO FROM CR_REL_CRED_CHEQ WHERE SIT_REL_CRED = ''AC'' ' + coCRLF;
                                                           //FITROS CREDITO
            If (Trim(sDisp)<>'') Then
               sSQL:= sSQL +
            '                                                  AND ID_CREDITO = '+ sDisp+ coCRLF ;
            If (Trim(sGpoProd)<>'') Then
               sSQL:= sSQL +
            '                                                  AND ID_CREDITO IN (SELECT ID_CREDITO FROM CR_CREDITO WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CR_CONTRATO WHERE CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO WHERE CVE_PRODUCTO_GPO = '+ SQLStr(sGpoProd)+')))'+  coCRLF ;
     sSQL:= sSQL +
            '                        ) AND DVT.CVE_OPERACION IN (''DPSIAC'', ''DESPEI'') ' + coCRLF +
            '                        AND DVT.F_LIQUIDACION  BETWEEN ' + SQLFecha(dFInicio) + ' AND ' + SQLFecha(dFFin)+coCRLF +
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
                  sSQL:= sSQL + '   AND NVL(DV.F_LIQUIDACION,SYSDATE) =  '+ SQLFecha(dFecha)+ coCRLF ;

              // < / EASA    12 ABRIL 2006
               IF bResumenSM THEN
                 sSQL:= sSQL + '   AND DV.IMP_TRANS <= 0 '+ coCRLF ;
              //END IF;

              //EASA > /

     sSQL:= sSQL +
            '   AND DV.REG    = CR.REG(+)' +  coCRLF +
            '   AND DV.CUENTA_BANCO = CR.CUENTA_BANCO(+)' +  coCRLF +
            '  ORDER BY DV.CVE_MONEDA, DV.NOMBRE, DV.CUENTA_BANCO, DV.REG';

   Result:= sSQL;
End;

procedure TQrRecRecib.qrgCHEQBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    dImpTransac  := 0;
    dSdoInsoluto := 0;
    dImpProxVto  := 0;
   if bResumenGrl then Begin
      If Trim(sArchivo)<>'' Then Begin
         Writeln(F,
                  'Moneda' + #09 + qyRecRecib.FieldByName('CVE_MONEDA').AsString + ' - ' +
                  qyRecRecib.FieldByName('DESC_MONEDA').AsString + #09 +
                  'Acreditado ' + #09 + qyRecRecib.FieldByName('ID_ACREDITADO').AsString + ' - ' +
                  qyRecRecib.FieldByName('NOMBRE').AsString + #09 +
                  'Cuenta ' + #09 + qyRecRecib.FieldByName('CUENTA_BANCO').AsString + #09 +
                  'Tipo de Ramo ' + #09 + qyRecRecib.FieldByName('CTA_FIDEICOMISO').AsString + ' - ' +
                  qyRecRecib.FieldByName('CVE_TIPO_RAMO').AsString + #09 +
                  'Sdo. Bloqueado ' + #09 + FormatFloat('###,###,###,###,##0.00',qyRecRecib.FieldByName('SDO_COMPROMETIDO').AsFloat) + #09+
                  'Sdo. Disponible ' + #09 + FormatFloat('###,###,###,###,##0.00',qyRecRecib.FieldByName('SDO_DISPONIBLE').AsFloat) + #09+
                  'Sdo Total ' + #09 + FormatFloat('###,###,###,###,##0.00',qyRecRecib.FieldByName('SDO_TOTAL').AsFloat)
             );
      End;
   end;
end;

procedure TQrRecRecib.qrgrpFooterGroup0BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrSUM_IMP_TRANS.Caption := FormatFloat('###,###,###,###,##0.00',dImpTransac);
   qrSUM_SDO_VIG_TOTAL.Caption := FormatFloat('###,###,###,###,##0.00',dSdoInsoluto);
   qrSUM_IMP_PROX_VTO.Caption := FormatFloat('###,###,###,###,##0.00',dImpProxVto);

   if not bResumenGrl then Begin
    If Trim(sArchivo)<>'' Then Begin
         Writeln(F,#09#09#09#09#09#09#09#09#09 +'Total Recursos Recibidos' +#09#09#09#09 +
                  FormatFloat('###,###,###,###,##0.00',dImpTransac)+
                  'Total Saldo Insoluto' + #09 +
                  FormatFloat('###,###,###,###,##0.00',dSdoInsoluto) + #09#09+
                  FormatFloat('###,###,###,###,##0.00',dImpProxVto)
             );
    End;
   End;
end;

procedure TQrRecRecib.qrbDETALLEBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   dImpTransac := dImpTransac + qyRecRecibIMP_TRANS.AsFloat;
   dSdoInsoluto := dSdoInsoluto + qyRecRecibSDO_VIG_TOTAL.AsFloat;
   dImpProxVto  := dImpProxVto + qyRecRecibIMP_PROX_VTO.AsFloat;
   if not bResumenGrl then Begin
      If Trim(sArchivo)<>'' Then Begin
         Writeln(F,
                  qyRecRecib.FieldByName('CVE_MONEDA').AsString + #09 +
                  qyRecRecib.FieldByName('DESC_MONEDA').AsString + #09 +
                  qyRecRecib.FieldByName('ID_ACREDITADO').AsString + #09 +
                  qyRecRecib.FieldByName('NOMBRE').AsString + #09 +
                  qyRecRecib.FieldByName('CUENTA_BANCO').AsString + #09 +
                  qyRecRecib.FieldByName('CTA_FIDEICOMISO').AsString + #09 +
                  qyRecRecib.FieldByName('CVE_TIPO_RAMO').AsString + #09 +
                  FormatFloat('###,###,###,###,##0.00',qyRecRecib.FieldByName('SDO_COMPROMETIDO').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyRecRecib.FieldByName('SDO_DISPONIBLE').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyRecRecib.FieldByName('SDO_TOTAL').AsFloat) + #09+
                  FormatDateTime('dd/mm/yyyy',qyRecRecib.FieldByName('F_LIQUIDACION').AsDateTime) + #09+
                  qyRecRecib.FieldByName('ID_TRANSACCION').AsString + #09 +
                  qyRecRecib.FieldByName('CONCEPTO').AsString + #09 +
                  FormatFloat('###,###,###,###,##0.00',qyRecRecib.FieldByName('IMP_TRANS').AsFloat)+ #09 +
                  FormatFloat('###,###,###,###,##0.00',qyRecRecib.FieldByName('SDO_CHEQUERA').AsFloat)+ #09 +
                  qyRecRecib.FieldByName('ID_CREDITO').AsString + #09 +
                  FormatFloat('###,###,###,###,##0.00',qyRecRecib.FieldByName('SDO_VIG_TOTAL').AsFloat) + #09+
                  FormatDateTime('dd/mm/yyyy',qyRecRecib.FieldByName('F_VENCIMIENTO').AsDateTime) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyRecRecib.FieldByName('IMP_PROX_VTO').AsFloat)
             );
      End;
   End;
end;

procedure TQrRecRecib.QRDBText24Print(sender: TObject; var Value: String);
begin
  if qyRecRecibID_TRANSACCION.AsFloat = 0 then
     Value := '';
end;

procedure TQrRecRecib.QRDBText1Print(sender: TObject; var Value: String);
begin
  if qyRecRecibID_CREDITO.AsFloat = 0 then
     Value := '';
end;

End.
