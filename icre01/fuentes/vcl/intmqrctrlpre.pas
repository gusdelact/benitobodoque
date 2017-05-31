unit IntMQrCtrlPre;
interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, unSQL2;
Const
   coCRLF      = #13#10;

type
  TQrCtrlPre = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRShape4: TQRShape;
    qrshINT: TQRShape;
    QRShape7: TQRShape;
    qrbDETALLE: TQRBand;
    QRFooterMoneda: TQRBand;
    QRDBTSituacion: TQRDBText;
    qrshMORFN: TQRShape;
    qrshF_OPERA: TQRShape;
    qrshIVA: TQRShape;
    QRGroupMoneda: TQRGroup;
    qrshMORCP: TQRShape;
    qyCtrlPre: TQuery;
    qrshTIPOCALC: TQRShape;
    qrshCVETASA: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel26: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRShape5: TQRShape;
    QRLabel27: TQRLabel;
    QRShape10: TQRShape;
    QRDBText28: TQRDBText;
    QRExpr5: TQRExpr;
    qyCtrlPreNOMBRE: TStringField;
    qyCtrlPreIMP_AUTORIZADO: TFloatField;
    qyCtrlPreIMP_CREDITO: TFloatField;
    qyCtrlPreSIT_CREDITO: TStringField;
    qyCtrlPreSDO_CAPITAL: TFloatField;
    qyCtrlPreSDO_INTERES: TFloatField;
    qyCtrlPreSDO_INSOLUTO: TFloatField;
    qyCtrlPreSALDO_INICIAL_PPO: TFloatField;
    qyCtrlPreIMP_INCREMENTOS_PPO: TFloatField;
    qyCtrlPreIMP_DECREMENTOS_PPO: TFloatField;
    qyCtrlPreSALDO_ACTUAL_PPO: TFloatField;
    qyCtrlPreTX_NOTA: TStringField;
    qyCtrlPreIMPORTE: TFloatField;
    qyCtrlPreIVA: TFloatField;
    qyCtrlPreCARGO: TFloatField;
    qyCtrlPreABONO: TFloatField;
    qyCtrlPreSALDO_PPO_A: TFloatField;
    qyCtrlPreDESC_C_PRODUCTO: TStringField;
    QRGroup1: TQRGroup;
    qyCtrlPreID_TITULAR: TFloatField;
    qyCtrlPreID_CONTRATO: TFloatField;
    qyCtrlPreID_CREDITO: TFloatField;
    qyCtrlPreDIAS_ATRASO: TFloatField;
    qyCtrlPreID_TRANSACCION: TFloatField;
    QRLabel2: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText29: TQRDBText;
    QRShape18: TQRShape;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    qyCtrlPreSIT_TRANSACCION: TStringField;
    qyCtrlPreF_INICIO: TDateTimeField;
    qyCtrlPreF_VENCIMIENTO: TDateTimeField;
    qyCtrlPreF_OPERACION: TDateTimeField;
    QRFooterAcred: TQRBand;
    QRLabel11: TQRLabel;
    QRShape6: TQRShape;
    SummaryBand1: TQRBand;
    QRLabel15: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRShape8: TQRShape;
    QRGroup3: TQRGroup;
    QRShape3: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDETALLEBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterAcredBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
   sArchivo:String;
   procedure MuestraDetalle (B: Boolean) ;
  public

    Function FormaQuery(sF_Inicio,sF_Final,sF_Al, sF_Saldos,sAcreditado,
                        sContrato,sCesion,sSitPre,sSitCred,sGpoProd,sFIniPrem,sFFinPrem: String;
                        BTransCancel:Boolean):String;
  end;

var
  QrCtrlPre: TQrCtrlPre;
  bGenArch: Boolean;
  F: TextFile;
  vlNumCred : Integer;
  vlNumCrPr : Integer;
  vlIdCred  : Integer;
  vgFechaAl, vgFechaSaldos : String ;
  contidcred,
  contidcredTOT : Integer;

  vlgimpcredi : Currency;
  vlgsdocapit : Currency;
  vlgsdointer : Currency;
  vlgsdoinsol : Currency;
  vlgsdoppoin : Currency;
  vlgincremen : Currency;
  vlgdecremen : Currency;
  vlgsdofecha : Currency;

  vlgTOTimpcredi : Currency;
  vlgTOTsdocapit : Currency;
  vlgTOTsdointer : Currency;
  vlgTOTsdoinsol : Currency;
  vlgTOTsdoppoin : Currency;
  vlgTOTincremen : Currency;
  vlgTOTdecremen : Currency;
  vlgTOTsdofecha : Currency;



Procedure RepControlPremios(sF_Inicio,sF_Final,sFechaAl, sF_Saldos, sAcreditado,sContrato,sCesion,sSitPrem,sSitCred,sNbrArch,sGpoProd,sF_Ini_Prem,sF_Fin_Prem :String;
                            pAPli : TInterApli; pPreview, Detalle, BTranCancel : Boolean);
Implementation
{$R *.DFM}

Procedure RepControlPremios(sF_Inicio,sF_Final,sFechaAl, sF_Saldos,sAcreditado,sContrato,sCesion,sSitPrem,sSitCred,sNbrArch,sGpoProd,sF_Ini_Prem,sF_Fin_Prem :String;
                            pAPli : TInterApli; pPreview, Detalle, BTranCancel : Boolean);
Var
   QrCtrlPre : TQrCtrlPre;
   Preview     : TIntQRPreview;
   VLTipoDisp  : String;

Begin
   QrCtrlPre:=TQrCtrlPre.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrCtrlPre);
   Try
      contidcred  := 0;
      contidcredTOT := 0;
      vlgimpcredi := 0;
      vlgsdocapit := 0;
      vlgsdointer := 0;
      vlgsdoinsol := 0;
      vlgsdoppoin := 0;
      vlgincremen := 0;
      vlgdecremen := 0;
      vlgsdofecha := 0;

      vlgTOTimpcredi := 0;
      vlgTOTsdocapit := 0;
      vlgTOTsdointer := 0;
      vlgTOTsdoinsol := 0;
      vlgTOTsdoppoin := 0;
      vlgTOTincremen := 0;
      vlgTOTdecremen := 0;
      vlgTOTsdofecha := 0;

      bGenArch:= False;
      QrCtrlPre.sArchivo:= sNbrArch;
      QrCtrlPre.QRInterEncabezado1.Apli:=pApli;
      QrCtrlPre.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrCtrlPre.QRInterEncabezado1.NomReporte:='IntMQrCtrlPre';
      QrCtrlPre.QRInterEncabezado1.Titulo1:='Reporte de Control de Posible Premio a Otorgar al '+sFechaAl;

      QrCtrlPre.qyCtrlPre.DatabaseName := pApli.DataBaseName;
      QrCtrlPre.qyCtrlPre.SessionName := pApli.SessionName;

      QrCtrlPre.qyCtrlPre.Active:=False;
      QrCtrlPre.qyCtrlPre.SQL.Text:= QrCtrlPre.FormaQuery(sF_Inicio,sF_Final,sFechaAl,sF_Saldos,sAcreditado,
                                                          sContrato,sCesion,sSitPrem,sSitCred,sGpoProd,
                                                          sF_Ini_Prem,sF_Fin_Prem,BTranCancel) ;
      vgFechaAl:= sFechaAl ;
      vgFechaSaldos:=sF_Saldos;
      QrCtrlPre.MuestraDetalle(Detalle);
      QrCtrlPre.qyCtrlPre.SQL.SaveToFile('C:\CtrlPre.sql');
      QrCtrlPre.qyCtrlPre.Active:=True;


      If Trim(QrCtrlPre.sArchivo)<>'' Then Begin
         AssignFile(F, QrCtrlPre.sArchivo);
         Rewrite(F);
         Writeln(F, QrCtrlPre.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F,  #09 );

      Writeln(F, 'ID TITULAR' + #09 +
                 'NOMBRE' + #09 +
                 'CONTRATO' + #09 +
                 'IMPORTE DE LINEA' + #09 +
                 'CREDITO' + #09 +
                 'PRODUCTO' + #09 +
                 'F INICIO CREDITO' + #09 +
                 'F VENCIMIENTO CREDITO' + #09 +
                 'IMPORTE DEL CREDITO' + #09 +
                 'SALDO CAPITAL (INSOLUTO)' + #09 +
                 'SALDO INTERES (INSOLUTO)' + #09 +
                 'SALDO INSOLUTO B6' + #09 +
                 'SALDO INICIAL PPO' + #09 +
                 'INCREMENTOS DE PPO' + #09 +
                 'DECREMENTOS DE PPO' + #09 +
                 'SALDO ACTUAL PPO' + #09 +
                 'ID TRANSACCION' + #09 +
                 'NOTA DE TRANS' + #09 +
                 'F OPER TRANS' + #09 +
                 'IMPORTE TRANS' + #09 +
                 'IVA TRANS' + #09 +
                 'CARGO' + #09 +
                 'ABONO' + #09 +
                 'SALDO PPO HASTA TRANS'
                 );
         Writeln(F, '');
      End;

      If pPreview Then
         QrCtrlPre.Preview
      Else
         QrCtrlPre.Print;
   Finally
       If Trim(QrCtrlPre.sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrCtrlPre.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrCtrlPre.FormaQuery(sF_Inicio,sF_Final,sF_Al,sF_Saldos,sAcreditado,
                               sContrato,sCesion,sSitPre,sSitCred,sGpoProd,
                               sFIniPrem,sFFinPrem: String;
                               BTransCancel:Boolean ):String;
Var
    sSQL, Fecha_Saldos, Fecha_Anexo, vlBTransCanela:String;
Begin  // base
    if BTransCancel then
       vlBTransCanela := 'V'
    else
       vlBTransCanela := 'F';

    sSQL:=
    'SELECT BASE.ID_TITULAR, BASE.NOMBRE, BASE.ID_CONTRATO, BASE.IMP_AUTORIZADO, BASE.ID_CREDITO, BASE.F_INICIO, BASE.F_VENCIMIENTO, '+coCRLF+
    '       BASE.IMP_CREDITO, '+coCRLF+
//    '       BASE.SIT_CREDITO, '+coCRLF+
    '       CASE WHEN BASE.SIT_CREDITO = ''LQ'' AND BASE.F_LIQUIDACION>TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Al))+''', ''DD/MM/YYYY'') THEN ''AC'' ELSE BASE.SIT_CREDITO END AS SIT_CREDITO, '+coCRLF+
    '       BASE.SIT_PPO_PREMIO, BASE.DESC_C_PRODUCTO, '+coCRLF+
    '       PKGBURO.FUN_DIAS_VEN_ICRE (BASE.ID_CREDITO, TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Al))+''', ''DD/MM/YYYY'') )AS DIAS_ATRASO, '+coCRLF+
    '       NVL(BASE.SDO_CAPITAL, pkgcrppo.FUNOBTSDO(BASE.ID_CREDITO, '''+sF_Saldos+''', ''INSOLUTO'', ''AD'')) SDO_CAPITAL, '+coCRLF+
    '	    NVL(BASE.SDO_INTERES, pkgcrppo.FUNOBTSDO(BASE.ID_CREDITO, '''+sF_Saldos+''', ''INSOLUTO'', ''IN'')) SDO_INTERES, '+coCRLF+
    '	   (NVL(BASE.SDO_CAPITAL, pkgcrppo.FUNOBTSDO(BASE.ID_CREDITO, '''+sF_Saldos+''', ''INSOLUTO'', ''AD'')) + NVL(BASE.SDO_INTERES, pkgcrppo.FUNOBTSDO(BASE.ID_CREDITO, '''+sF_Saldos+''', ''INSOLUTO'', ''IN'')) ) AS SDO_INSOLUTO, '+coCRLF+
    '	    -- '+coCRLF+
    '	    PKGCRPPO.SaldoPPPaFecha(BASE.ID_CREDITO, F_INI_PPO, ''IMPTOT'', NULL, NULL,'''+vlBTransCanela+''') AS SALDO_INICIAL_PPO, '+coCRLF+
    '       (PKGCRPPO.SaldoPPPaFecha(BASE.ID_CREDITO, TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Al))+''', ''DD/MM/YYYY''), ''IMPTOT'', ''I'', NULL,'''+vlBTransCanela+''')- '+coCRLF+
    '        PKGCRPPO.SaldoPPPaFecha(BASE.ID_CREDITO, F_INI_PPO, ''IMPTOT'', NULL, NULL,'''+vlBTransCanela+''')) AS IMP_INCREMENTOS_PPO, '+coCRLF+
    '	    PKGCRPPO.SaldoPPPaFecha(BASE.ID_CREDITO, TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Al))+''', ''DD/MM/YYYY''), ''IMPTOT'', ''D'', NULL,'''+vlBTransCanela+''') AS IMP_DECREMENTOS_PPO, '+coCRLF+
    '	    PKGCRPPO.SaldoPPPaFecha(BASE.ID_CREDITO, TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Al))+''', ''DD/MM/YYYY''), ''IMPTOT'', NULL, NULL,'''+vlBTransCanela+''') AS SALDO_ACTUAL_PPO, '+coCRLF+
    '	    -- '+coCRLF+
    '       DETALLE.ID_TRANSACCION, DETALLE.TX_NOTA, DETALLE.F_OPERACION, DETALLE.IMPORTE, DETALLE.IVA, DETALLE.CARGO, '+coCRLF+
    '       DETALLE.ABONO, DETALLE.SIT_TRANSACCION, DETALLE.SALDO_PPO_A '+coCRLF+
    'FROM '+coCRLF+
    '----- '+coCRLF+
    '/*base*/ '+coCRLF+
    '(SELECT CRH.ID_CREDITO, CR.ID_CONTRATO, CR.IMP_CREDITO, CR.F_INICIO, CR.F_VENCIMIENTO, CR.SIT_CREDITO, CR.F_LIQUIDACION, '+coCRLF+
    '        CRC.IMP_AUTORIZADO, CRC.CVE_PRODUCTO_CRE, CRP.DESC_C_PRODUCTO, CONT.ID_TITULAR, '+coCRLF+
    '        CAST (pkgcrconsolidado.fun_nom_tit_cred (cont.id_titular) AS VARCHAR2 (100)) nombre, '+coCRLF+
    '        CRH.INICIOPREM F_INI_PPO, CRH.SIT_PPO_PREMIO, HIS.SDO_CAPITAL, HIS.SDO_INTERES '+coCRLF+
    '   FROM (SELECT SDOPREM.ID_CREDITO, FINIPREM.F_OPERACION AS INICIOPREM, SDOPREM.SIT_PPO_PREMIO '+coCRLF+
    '         FROM (SELECT CTINI.ID_CREDITO, CRTR.F_OPERACION '+coCRLF+
    '               FROM (SELECT PREM.ID_CREDITO, MIN(CT.ID_TRANSACCION) ID_TRANS_INI '+coCRLF+
    '                     FROM CR_TRANSACCION CT, CR_PPO_PREMIO PREM '+coCRLF+
    '                     WHERE 1=1 '+coCRLF+
    '                       AND CT.ID_CREDITO = PREM.ID_CREDITO '+coCRLF+
    '                       AND CT.SIT_TRANSACCION = ''AC'' '+coCRLF+
    '                       AND CT.ID_TRANS_CANCELA IS NULL '+coCRLF+
    '                       AND CT.CVE_OPERACION IN (SELECT DISTINCT CP.CVE_OPERACION '+coCRLF+
    '                                                FROM CR_REL_CON_AFEC CRCA,CR_OPERACION CP '+coCRLF+
    '                                                WHERE CRCA.CVE_AFECTACION IN (''PPIMCR'') AND CRCA.CVE_CONCEPTO = ''IMPBRU'' AND CRCA.CVE_OPERACION = CP.CVE_OPERACION '+coCRLF+
    '                                                  AND CRCA.CVE_AFECTA_SDO = ''I'') '+coCRLF+
    '                     GROUP BY PREM.ID_CREDITO '+coCRLF+
    '                     ) CTINI, '+coCRLF+
    '                    CR_TRANSACCION CRTR '+coCRLF+
    '               WHERE CTINI.ID_TRANS_INI = CRTR.ID_TRANSACCION '+coCRLF+
    '                 AND CRTR.F_OPERACION <= TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Al))+''', ''DD/MM/YYYY'') '+coCRLF+
    '               )FINIPREM, '+coCRLF+
    '              (select prem.id_credito, '+coCRLF+
    '                      prem.sit_ppo_premio '+coCRLF+
    '               from cr_ppo_premio prem '+coCRLF;
    If Trim(sSitPre) <> '' then
    Begin
       If Trim(sSitPre) = 'AC' then
          sSQL:= sSQL + '               where (prem.F_LIQUIDACION is null OR prem.F_LIQUIDACION >= TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Al))+''', ''DD/MM/YYYY'') ) '+coCRLF;
       If Trim(sSitPre) = 'LQ' then
          sSQL:= sSQL + '               where (prem.F_LIQUIDACION < TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Al))+''', ''DD/MM/YYYY'') ) '+coCRLF;
       If (Trim(sSitPre) <> 'AC') and (Trim(sSitPre) <> 'LQ')then
          sSQL:= sSQL + '               where prem.SIT_PPO_PREMIO = '''+sSitPre+'''  '+coCRLF ;
    end;
sSQL:= sSQL +
    '               )SDOPREM '+coCRLF+
    '         WHERE 1=1 '+coCRLF+
    '           AND FINIPREM.ID_CREDITO = SDOPREM.ID_CREDITO '+coCRLF+
    '        ) CRH, '+coCRLF+
    '        CR_CREDITO CR, CR_CONTRATO CRC, CR_PRODUCTO CRP, CR_PRODUCTO_GPO CPG, '+coCRLF+
    '        CONTRATO CONT, (SELECT * FROM CR_PPO_HISTO WHERE F_CIERRE = TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Al))+''', ''DD/MM/YYYY'') ) HIS '+coCRLF+
    '  WHERE 1=1 '+coCRLF+
    '    AND CRH.ID_CREDITO = CR.ID_CREDITO '+coCRLF+
    '    AND CR.ID_CONTRATO = CRC.ID_CONTRATO '+coCRLF+
    '    AND CRC.ID_CONTRATO = CONT.ID_CONTRATO '+coCRLF+
    '    AND CRC.CVE_PRODUCTO_CRE = CRP.CVE_PRODUCTO_CRE '+coCRLF+
    '    AND CRP.CVE_PRODUCTO_GPO = CPG.CVE_PRODUCTO_GPO '+coCRLF+
    '    AND CRH.ID_CREDITO = HIS.ID_CREDITO(+) '+coCRLF+
    '    AND CR.SIT_CREDITO  <> ''CA'' '+coCRLF;
    //
    If Trim(sAcreditado) <> '' then
       sSQL:= sSQL + ' AND CONT.ID_TITULAR = '+sAcreditado+'  ' +coCRLF ;
    If Trim(sCesion) <> '' then
       sSQL:= sSQL + ' AND CR.ID_CREDITO = '+sCesion+'  ' +coCRLF ;
    If Trim(sContrato) <> '' then
       sSQL:= sSQL + ' AND CR.ID_CONTRATO = '+sContrato+'  ' +coCRLF ;
    If Trim(sGpoProd) <> '' then
       sSQL:= sSQL + ' AND CRP.CVE_PRODUCTO_GPO IN '+sGpoProd+'  ' +coCRLF ;
    If Trim(sSitCred) <> '' then
       sSQL:= sSQL + ' AND CR.SIT_CREDITO '+sSitCred+'  ' +coCRLF ;
    If (Trim(sF_Inicio) <> '') and (Trim(sF_Final) <> '') then
       sSQL:= sSQL + '  AND CR.F_INICIO >= TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Inicio))+''', ''DD/MM/YYYY'') '+coCRLF+
                     '  AND CR.F_INICIO <= TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Final))+''', ''DD/MM/YYYY'') ' +coCRLF ;
    //
    sSQL:= sSQL +
    '  ) BASE, '+coCRLF+
    '----- '+coCRLF+
    '/*detalle*/ '+coCRLF+
    '(SELECT B.ID_CREDITO, B.ID_TRANSACCION, B.CVE_OPERACION, B.F_OPERACION, B.TX_NOTA, B.IMP_NETO, B.CVE_AFECTA_SDO, '+coCRLF+
    '         SUM(IMPORTE) AS IMPORTE,  SUM(IVA) AS IVA, '+coCRLF+
    '         CASE WHEN CVE_AFECTA_SDO = ''I'' THEN (SUM(IMPORTE)+SUM(IVA)) ELSE 0 END AS CARGO, '+coCRLF+
    '         CASE WHEN CVE_AFECTA_SDO = ''D'' THEN (SUM(IMPORTE)+SUM(IVA)) ELSE 0 END AS ABONO, '+coCRLF+
    '	      CASE WHEN (B.SIT_TRANSACCION = ''CA'') OR (B.ID_TRANS_CANCELA IS NOT NULL)  THEN ''X'' ELSE '''' END AS SIT_TRANSACCION, '+coCRLF+
    '         PKGCRPPO.SaldoPPPaFecha(B.ID_CREDITO, B.F_OPERACION, ''IMPTOT'', null, B.ID_TRANSACCION,'''+vlBTransCanela+''') SALDO_PPO_A '+coCRLF+
    '  FROM '+coCRLF+
    '      (SELECT H.ID_CREDITO, T.ID_TRANSACCION, D.CVE_OPERACION, T.F_OPERACION, T.TX_NOTA, T.IMP_NETO, CRF.CVE_AFECTA_SDO, SIT_TRANSACCION, ID_TRANS_CANCELA, '+coCRLF+
    '              SUM(CASE WHEN D.CVE_CONCEPTO = ''IMPBRU'' THEN IMP_CONCEPTO ELSE 0 END) AS IMPORTE, '+coCRLF+
    '              SUM(CASE WHEN D.CVE_CONCEPTO = ''IMPIVA'' THEN IMP_CONCEPTO ELSE 0 END) AS IVA, '+coCRLF+
    '              CASE WHEN CRF.CVE_AFECTA_SDO = ''I'' THEN SUM(IMP_CONCEPTO) ELSE NULL END AS CARGO, '+coCRLF+
    '              CASE WHEN CRF.CVE_AFECTA_SDO = ''D'' THEN SUM(IMP_CONCEPTO) ELSE NULL END AS ABONO '+coCRLF+
    '       FROM CR_PPO_PREMIO H, CR_TRANSACCION T, CR_DET_TRANSAC D, CR_OPERACION CO, CR_REL_CON_AFEC CRF '+coCRLF+
    '       WHERE 1 = 1 '+coCRLF+
    '       AND H.ID_CREDITO = T.ID_CREDITO '+coCRLF+
    '       AND T.ID_TRANSACCION = D.ID_TRANSACCION '+coCRLF+
    '       AND T.CVE_OPERACION = CO.CVE_OPERACION '+coCRLF+
    '       AND CO.CVE_OPERACION = CRF.CVE_OPERACION '+coCRLF+
    '       AND CRF.CVE_CONCEPTO = D.CVE_CONCEPTO '+coCRLF+
    '       AND CRF.CVE_TIPO_MOVTO = T.CVE_TIPO_MOVTO '+coCRLF+
    '       AND CRF.CVE_AFECTACION IN (''PPIMCR'', ''PPIMIV'') '+coCRLF+
    '       AND CO.CVE_ACCESORIO = ''PP'' '+coCRLF;
    if BTransCancel then
       sSQL:= sSQL + '       AND (T.SIT_TRANSACCION = ''AC'') '+coCRLF
    else
       sSQL:= sSQL + '       AND (T.SIT_TRANSACCION = ''AC'' AND T.ID_TRANS_CANCELA IS NULL) '+coCRLF;
    sSQL:= sSQL +
    '       AND T.F_OPERACION <= TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Al))+''', ''DD/MM/YYYY'') '+coCRLF;
    If Trim(sSitPre) <> '' then
    begin
       If Trim(sSitPre) = 'AC' then
          sSQL:= sSQL + '	    AND ((H.SIT_PPO_PREMIO=''AC'') OR (H.SIT_PPO_PREMIO=''LQ'' AND H.F_LIQUIDACION >= TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Al))+''', ''DD/MM/YYYY'') )) '+coCRLF;
       If Trim(sSitPre) = 'LQ' then
          sSQL:= sSQL + '	    AND H.F_LIQUIDACION < TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Al))+''', ''DD/MM/YYYY'') '+coCRLF;
       If (Trim(sSitPre) <> 'AC') and (Trim(sSitPre) <> 'LQ')then
          sSQL:= sSQL + '           AND H.SIT_PPO_PREMIO = '''+sSitPre+'''  '+coCRLF ;
    end;
    sSQL:= sSQL +
    '       GROUP BY H.ID_CREDITO, T.ID_TRANSACCION, D.CVE_OPERACION, T.F_OPERACION, T.TX_NOTA, '+coCRLF+
    '                T.IMP_NETO, CRF.CVE_AFECTA_SDO, IMP_CONCEPTO, SIT_TRANSACCION, ID_TRANS_CANCELA) B '+coCRLF+
    '  GROUP BY B.ID_CREDITO, B.ID_TRANSACCION, B.CVE_OPERACION, B.F_OPERACION, B.TX_NOTA, B.IMP_NETO, B.CVE_AFECTA_SDO, B.SIT_TRANSACCION, B.ID_TRANS_CANCELA )  DETALLE '+coCRLF+
    '----- '+coCRLF+
    'WHERE 1=1 '+coCRLF+
    '  AND BASE.ID_CREDITO = DETALLE.ID_CREDITO '+coCRLF;
    If (Trim(sFIniPrem) <> '') and (Trim(sFFinPrem) <> '') then
       sSQL:= sSQL + '  AND BASE.F_INI_PPO >= TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sFIniPrem))+''', ''DD/MM/YYYY'') '+coCRLF+
                     '  AND BASE.F_INI_PPO <= TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sFFinPrem))+''', ''DD/MM/YYYY'') ' +coCRLF ;

    sSQL:= sSQL +
    'ORDER BY BASE.NOMBRE, BASE.ID_CREDITO, DETALLE.ID_TRANSACCION '+coCRLF;

    Result:= sSQL;
End;

procedure TQrCtrlPre.MuestraDetalle (B: Boolean) ;
begin
   If B then
      begin
         qrbDETALLE.Height:= 14 ;
         QrShape3.Width:= 727;
//         QrLabel18.Color:= clSilver;
         QrLabel19.Color:= clSilver;
         QrLabel20.Color:= clSilver;
         QrLabel22.Color:= clSilver;
         QrLabel23.Color:= clSilver;
         QrLabel24.Color:= clSilver;
         QrLabel25.Color:= clSilver;
         QrLabel31.Color:= clSilver;
//         QRLabel18.Font.Color := clBlack;
//         QrLabel18.Font.Color := clBlack;
         QrLabel19.Font.Color := clBlack;
         QrLabel20.Font.Color := clBlack;
         QrLabel22.Font.Color := clBlack;
         QrLabel23.Font.Color := clBlack;
         QrLabel24.Font.Color := clBlack;
         QrLabel25.Font.Color := clBlack;
         QrLabel31.Font.Color := clBlack;
//         QRGroup2.Height:= 32 ;
         QRFooterMoneda.Height:= 32;
         QRGroup3.Enabled := True;
      end
   Else
     begin
         qrbDETALLE.Height:= 0 ;
         QrShape3.Width:= 0;
//         QrLabel18.Color:= clWhite;
         QrLabel19.Color:= clWhite;
         QrLabel20.Color:= clWhite;
         QrLabel22.Color:= clWhite;
         QrLabel23.Color:= clWhite;
         QrLabel24.Color:= clWhite;
         QrLabel25.Color:= clWhite;
         QrLabel31.Color:= clWhite;
//         QRLabel18.Font.Color := clWhite;
//         QrLabel18.Font.Color := clWhite;
         QrLabel19.Font.Color := clWhite;
         QrLabel20.Font.Color := clWhite;
         QrLabel22.Font.Color := clWhite;
         QrLabel23.Font.Color := clWhite;
         QrLabel24.Font.Color := clWhite;
         QrLabel25.Font.Color := clWhite;
         QrLabel31.Font.Color := clWhite;
//         QRGroup2.Height:= 12 ;   27
         QRFooterMoneda.Height:= 0;
         QRGroup3.Enabled := False;
     end ;
end ;

procedure TQrCtrlPre.ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    QRLabel10.Caption:= 'Saldo Insoluto'+#13+'al '+vgFechaSaldos;//vgFechaAl ;
    QRLabel7.Caption:= 'Saldo PPO'+#13+'al '+vgFechaAl+#13+'(IVA Incluido)' ;
    QRLabel8.Caption:= 'Saldo Capital'+#13+'al '+vgFechaSaldos;//+vgFechaAl ;
    QRLabel9.Caption:= 'Saldo Interés'+#13+'al '+vgFechaSaldos;//+vgFechaAl ;
end;

procedure TQrCtrlPre.qrbDETALLEBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

   If (sArchivo <>'') and (qyCtrlPre.Active) then
      Writeln(F, qyCtrlPre.FieldByName('ID_TITULAR').AsString + #09 + //'No. Acreditado' + #09 +
                 qyCtrlPre.FieldByName('NOMBRE').AsString + #09 +       //'Acreditado ' + #09 +
                 qyCtrlPre.FieldByName('ID_CONTRATO').AsString + #09 +  //'Linea de Crédito ' + #09 +
                 FormatFloat('###,###,###,##0.00',qyCtrlPre.FieldByName('IMP_AUTORIZADO').AsFloat) + #09 + //'Monto de la Linea de Crédito' + #09 +
                 qyCtrlPre.FieldByName('ID_CREDITO').AsString + #09 +    //'No. Credito' + #09+
                 qyCtrlPre.FieldByName('DESC_C_PRODUCTO').AsString + #09 +   //'Tipo de Crédito' + #09 +
                 qyCtrlPre.FieldByName('F_INICIO').AsString + #09 +          //'Fecha de inicio'
                 qyCtrlPre.FieldByName('F_VENCIMIENTO').AsString + #09 +     //'Fecha de Vencimiento'
                 FormatFloat('###,###,###,##0.00',qyCtrlPre.FieldByName('IMP_CREDITO').AsFloat) + #09 + //'Monto Inicial del Credito'
                 FormatFloat('###,###,###,##0.00',qyCtrlPre.FieldByName('SDO_CAPITAL').AsFloat) + #09 + //'Saldo Capital al '+sFechaAl+' '
                 FormatFloat('###,###,###,##0.00',qyCtrlPre.FieldByName('SDO_INTERES').AsFloat) + #09 + //'Saldo Interes al '+sFechaAl+' '
                 FormatFloat('###,###,###,##0.00',qyCtrlPre.FieldByName('SDO_INSOLUTO').AsFloat) + #09 + //'Saldo insoluto al '+sFechaAl+' '
                 FormatFloat('###,###,###,##0.00',qyCtrlPre.FieldByName('SALDO_INICIAL_PPO').AsFloat) + #09 + //'Saldo Inicial PPO' +  #09 +
                 FormatFloat('###,###,###,##0.00',qyCtrlPre.FieldByName('IMP_INCREMENTOS_PPO').AsFloat) + #09 +  //'Incrementos PPO' +  #09 +
                 FormatFloat('###,###,###,##0.00',qyCtrlPre.FieldByName('IMP_DECREMENTOS_PPO').AsFloat) + #09 +    //'Decrementos PPO' +  #09 +
                 FormatFloat('###,###,###,##0.00',qyCtrlPre.FieldByName('SALDO_ACTUAL_PPO').AsFloat) + #09 +    //'Saldo Actual PPO' +  #09 +
                 qyCtrlPre.FieldByName('ID_TRANSACCION').AsString + #09 +  //'No. Transaccion' +  #09 +
                 qyCtrlPre.FieldByName('TX_NOTA').AsString + #09 +        //'Operacion' +#09 +
                 qyCtrlPre.FieldByName('F_OPERACION').AsString + #09 +   //'Fecha operacion'+ #09+
                 FormatFloat('###,###,###,##0.00',qyCtrlPre.FieldByName('IMPORTE').AsFloat) + #09 +   //'Importe Bruto Op.'+#09 +
                 FormatFloat('###,###,###,##0.00',qyCtrlPre.FieldByName('IVA').AsFloat) + #09 +      //'Iva Op.'+#09 +
                 FormatFloat('###,###,###,##0.00',qyCtrlPre.FieldByName('CARGO').AsFloat) + #09 + //'CARGO Operacion'+ #09 +
                 FormatFloat('###,###,###,##0.00',qyCtrlPre.FieldByName('ABONO').AsFloat) + #09 + //'ABONO Operacion'+ #09 +
                 FormatFloat('###,###,###,##0.00',qyCtrlPre.FieldByName('SALDO_PPO_A').AsFloat) //'Saldo a fecha op.'
                  );
end;

procedure TQrCtrlPre.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    QRLabel16.Caption := IntToStr(contidcredTOT);

    QRLabel36.Caption := FloatToStrF(vlgTOTimpcredi,ffnumber,16,2);
    QRLabel37.Caption := FloatToStrF(vlgTOTsdocapit,ffnumber,16,2);
    QRLabel38.Caption := FloatToStrF(vlgTOTsdointer,ffnumber,16,2);
    QRLabel39.Caption := FloatToStrF(vlgTOTsdoinsol,ffnumber,16,2);
    QRLabel40.Caption := FloatToStrF(vlgTOTsdoppoin,ffnumber,16,2);
    QRLabel41.Caption := FloatToStrF(vlgTOTincremen,ffnumber,16,2);
    QRLabel42.Caption := FloatToStrF(vlgTOTdecremen,ffnumber,16,2);
    QRLabel43.Caption := FloatToStrF(vlgTOTsdofecha,ffnumber,16,2);


   If qyCtrlPre.Eof Then Begin
      If Trim(sArchivo)<>'' Then
      Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;


procedure TQrCtrlPre.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vlidcred, vlidcredant : Currency;
begin

    vlidcred := qyCtrlPre.FieldByName('ID_CREDITO').AsFloat;

    if (vlidcred <> 0) AND (vlidcred <>  vlidcredant) then
    begin
    contidcred := contidcred + 1;
    contidcredTOT := contidcredTOT + 1;

    vlgimpcredi := vlgimpcredi + qyCtrlPre.FieldByName('IMP_CREDITO').AsFloat;
    vlgsdocapit := vlgsdocapit + qyCtrlPre.FieldByName('SDO_CAPITAL').AsFloat;
    vlgsdointer := vlgsdointer + qyCtrlPre.FieldByName('SDO_INTERES').AsFloat;
    vlgsdoinsol := vlgsdoinsol + qyCtrlPre.FieldByName('SDO_INSOLUTO').AsFloat;
    vlgsdoppoin := vlgsdoppoin + qyCtrlPre.FieldByName('SALDO_INICIAL_PPO').AsFloat;
    vlgincremen := vlgincremen + qyCtrlPre.FieldByName('IMP_INCREMENTOS_PPO').AsFloat;
    vlgdecremen := vlgdecremen + qyCtrlPre.FieldByName('IMP_DECREMENTOS_PPO').AsFloat;
    vlgsdofecha := vlgsdofecha + qyCtrlPre.FieldByName('SALDO_ACTUAL_PPO').AsFloat;

    vlgTOTimpcredi := vlgTOTimpcredi + qyCtrlPre.FieldByName('IMP_CREDITO').AsFloat;
    vlgTOTsdocapit := vlgTOTsdocapit + qyCtrlPre.FieldByName('SDO_CAPITAL').AsFloat;
    vlgTOTsdointer := vlgTOTsdointer + qyCtrlPre.FieldByName('SDO_INTERES').AsFloat;
    vlgTOTsdoinsol := vlgTOTsdoinsol + qyCtrlPre.FieldByName('SDO_INSOLUTO').AsFloat;
    vlgTOTsdoppoin := vlgTOTsdoppoin + qyCtrlPre.FieldByName('SALDO_INICIAL_PPO').AsFloat;
    vlgTOTincremen := vlgTOTincremen + qyCtrlPre.FieldByName('IMP_INCREMENTOS_PPO').AsFloat;
    vlgTOTdecremen := vlgTOTdecremen + qyCtrlPre.FieldByName('IMP_DECREMENTOS_PPO').AsFloat;
    vlgTOTsdofecha := vlgTOTsdofecha + qyCtrlPre.FieldByName('SALDO_ACTUAL_PPO').AsFloat;

    vlidcredant := qyCtrlPre.FieldByName('ID_CREDITO').AsFloat;
    end;
end;

procedure TQrCtrlPre.QRFooterAcredBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    QRLabel17.Caption := IntToStr(contidcred);

    QRLabel18.Caption := FloatToStrF(vlgimpcredi,ffnumber,16,2);
    QRLabel28.Caption := FloatToStrF(vlgsdocapit,ffnumber,16,2);
    QRLabel29.Caption := FloatToStrF(vlgsdointer,ffnumber,16,2);
    QRLabel30.Caption := FloatToStrF(vlgsdoinsol,ffnumber,16,2);
    QRLabel32.Caption := FloatToStrF(vlgsdoppoin,ffnumber,16,2);
    QRLabel33.Caption := FloatToStrF(vlgincremen,ffnumber,16,2);
    QRLabel34.Caption := FloatToStrF(vlgdecremen,ffnumber,16,2);
    QRLabel35.Caption := FloatToStrF(vlgsdofecha,ffnumber,16,2);
end;

procedure TQrCtrlPre.QRGroupMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    contidcred  := 0;
    vlgimpcredi := 0;
    vlgsdocapit := 0;
    vlgsdointer := 0;
    vlgsdoinsol := 0;
    vlgsdoppoin := 0;
    vlgincremen := 0;
    vlgdecremen := 0;
    vlgsdofecha := 0;
end;

procedure TQrCtrlPre.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
      contidcred  := 0;
      contidcredTOT := 0;
      vlgimpcredi := 0;
      vlgsdocapit := 0;
      vlgsdointer := 0;
      vlgsdoinsol := 0;
      vlgsdoppoin := 0;
      vlgincremen := 0;
      vlgdecremen := 0;
      vlgsdofecha := 0;

      vlgTOTimpcredi := 0;
      vlgTOTsdocapit := 0;
      vlgTOTsdointer := 0;
      vlgTOTsdoinsol := 0;
      vlgTOTsdoppoin := 0;
      vlgTOTincremen := 0;
      vlgTOTdecremen := 0;
      vlgTOTsdofecha := 0;
end;

End.
