unit IntQColCob;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,   UNSQL2, InterApl,Dialogs,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead,IntQRPreview,IntGenCre;

type
  TQrInColCob = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    qyInfCobConta: TQuery;
    QRInterEncabezado1: TQRInterEncabezado;
    qyInfCobContaCVE_MONEDA: TFloatField;
    qyInfCobContaDESC_MONEDA: TStringField;
    qyInfCobContaCVE_PRODUCTO_CRE: TStringField;
    qyInfCobContaDESC_L_PRODUCTO: TStringField;
    qyInfCobContaID_TITULAR: TFloatField;
    qyInfCobContaNOMBRE: TStringField;
    qyInfCobContaCVE_ACCESORIO: TStringField;
    qyInfCobContaCVE_TIPO_MOVTO: TStringField;
    qyInfCobContaCVE_OPERACION_ORI: TStringField;
    qyInfCobContaCVE_CONCEPTO: TStringField;
    qyInfCobContaIMP_CONCEPTO: TFloatField;
    qyInfCobContaCVE_PRODUCTO_GPO: TStringField;
    qyInfCobContaDESC_L_PROD_GPO: TStringField;
    qyInfCobContaCVE_PRESUPUESTO: TStringField;
    qyInfCobContaDESC_PRESUPUESTO: TStringField;
    qyInfCobContaCVE_FONDEO: TStringField;
    qyInfCobContaDESC_ENT_DES: TStringField;
    qyInfCobContaTIPO_OPER: TStringField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand2: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRAcred: TQRBand;
    QRLabel13: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel16: TQRLabel;
    QRMoneda: TQRBand;
    QRLabel19: TQRLabel;
    QRShape6: TQRShape;
    QRFondeo: TQRBand;
    QRLabel24: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape1: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape2: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel66: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRfbProducto: TQRBand;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel74: TQRLabel;
    QRfbMercObj2: TQRBand;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel82: TQRLabel;
    qyInfCobContaCVE_PRESUPUESTO_2: TStringField;
    QRLabel83: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRGMoneda:TQRGroup;
    QRGProducto:TQRGroup;
    QRMercObjSup:TQRGroup;
    QRGAcreditado:TQRGroup;
    QRGFondeo:TQRGroup;
    QRGPAsoc: TQRGroup;
    QRGPAdm: TQRGroup;
    qyInfCobContaID_PERSONA_PAD: TFloatField;
    qyInfCobContaNOMBRE_PAD: TStringField;
    qyInfCobContaID_PERSONA_PAS: TFloatField;
    qyInfCobContaNOMBRE_PAS: TStringField;
    QRFPAD: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRFPAS: TQRBand;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel61: TQRLabel;
    QRShape10: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;


{
    QRGMoneda:TQRGroup;
    QRGProducto:TQRGroup;
    QRMercObjSup:TQRGroup;
    QRGAcreditado:TQRGroup;
    QRGMdoObj:TQRGroup;
    QRGFondeo:TQRGroup;
    QRGPAsoc: TQRGroup;
    QRGPAdm: TQRGroup;

}

    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFondeoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRAcredBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRfbProductoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRfbMercObj2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGMonedaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRFPADBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFPASBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    sArchivo : String;
  public

    VLDisF : Double;    VLRerF : Double;    VLCapF : Double;    VLFadF : Double;    VLIntF : Double;
    VLDisM : Double;    VLRerM : Double;    VLCapM : Double;    VLFadM : Double;    VLIntM : Double;
    VLDisA : Double;    VLRerA : Double;    VLCapA : Double;    VLFadA : Double;    VLIntA : Double;
    VLDisC : Double;    VLRerC : Double;    VLCapC : Double;    VLFadC : Double;    VLIntC : Double;
    VLDisP : Double;    VLRerP : Double;    VLCapP : Double;    VLFadP : Double;    VLIntP : Double;
    VLDisS : Double;    VLRerS : Double;    VLCapS : Double;    VLFadS : Double;    VLIntS : Double;
    VLDisD : Double;    VLRerD : Double;    VLCapD : Double;    VLFadD : Double;    VLIntD : Double;


    VLDisCSF : Double;    VLRerCSF : Double;    VLCapCSF : Double;    VLFadCSF : Double;    VLIntCSF : Double;
    VLDisCCF : Double;    VLRerCCF : Double;    VLCapCCF : Double;    VLFadCCF : Double;    VLIntCCF : Double;

    VLImprime : Boolean;  VLMerObjAnt : String;

    Function FormaQuery(sF_Inicio,sF_Final:String;
                        sProducto, sMoneda, sGpoProducto, sEntDes, sAcreditado, sPromAso, sPromAdm ,sPresupuesto: String;
                        nOperado, nAgrupacion, nPromotor : Integer;
                        pAPli     : TInterApli):String;

  end;

var
  QrInColCob: TQrInColCob;
  F: TextFile;


Procedure   RepInfCobCol(  sF_Inicio,sF_Final:String;
                           sProducto, sMoneda, sGpoProducto,
                           sEntDes, sEntDesDesc,
                           sAcreditado, sAcreditadoDesc,
                           sPromAso, sPromAsoDesc,
                           sPromAdm, sPromAdmDesc,
                           sPresupuesto,
                           sNbrArch : String;
                           nOperado, nAgrupacion, nPromotor : Integer;
                           pAPli     : TInterApli;
                           pPreview  : Boolean);


implementation

{$R *.DFM}


Function TQrInColCob.FormaQuery(sF_Inicio,sF_Final:String;
                                sProducto, sMoneda, sGpoProducto, sEntDes, sAcreditado, sPromAso, sPromAdm, sPresupuesto: String;
                                nOperado, nAgrupacion, nPromotor : Integer;
                                pAPli     : TInterApli):String;
Var
    sSQL                : String;
    sSQL2               : String;
Begin


//COBRANZA ICRE
    sSQL:=  ' SELECT * FROM( ' + coCRLF +
            ' SELECT TEMP1.*, ' + coCRLF +
            '        CVE_ACCESORIO AS TIPO_OPER ' + coCRLF +
            ' FROM  (SELECT  M.CVE_MONEDA    , ' + coCRLF +
            '                M.DESC_MONEDA           , ' + coCRLF +
            '                CP.CVE_PRODUCTO_CRE     , ' + coCRLF +
            '                CP.DESC_L_PRODUCTO      , ' + coCRLF +
            '                CTO.ID_TITULAR          , ' + coCRLF +
            '                PT.NOMBRE               , ' + coCRLF +
            '                TRA.CVE_ACCESORIO       , ' + coCRLF +
            '                TRA.CVE_TIPO_MOVTO      , ' + coCRLF +
            '                TRA.CVE_OPERACION_ORI   , ' + coCRLF +
            '                TRA.CVE_CONCEPTO        , ' + coCRLF +
            '                TRA.IMP_CONCEPTO        , ' + coCRLF +
            '                CP.CVE_PRODUCTO_GPO     , ' + coCRLF +
            '                CPG.DESC_L_PROD_GPO     , ' + coCRLF +
            '                NVL(CRP.CVE_PRESUPUESTO,''NO-CLA'') AS CVE_PRESUPUESTO    , ' + coCRLF +
            '                NVL(CRP.CVE_PRESUPUESTO,''NO-CLA'') AS CVE_PRESUPUESTO_2    , ' + coCRLF +
            '                NVL(CRP.DESC_PRESUPUESTO,''NO-CLASIFICADO'') AS DESC_PRESUPUESTO, ' + coCRLF +
            '                DECODE(CFND.ID_CREDITO,NULL,''SIN FONDEO'',CFND.CVE_FND_ENT_DES ) AS CVE_FONDEO, ' + coCRLF +
            '                DECODE(CFND.ID_CREDITO,NULL,''SIN FONDEO'',CFED.DESC_ENT_DES ) AS DESC_ENT_DES, ' + coCRLF +
            '                PAD.ID_PERSONA AS ID_PERSONA_PAD, ' + coCRLF +
            '                PAD.NOMBRE AS NOMBRE_PAD, ' + coCRLF +
            '                PAS.ID_PERSONA AS ID_PERSONA_PAS, ' + coCRLF +
            '                PAS.NOMBRE AS NOMBRE_PAS ' + coCRLF +
            '          FROM  CR_CREDITO CC      , ' + coCRLF +
            '                CR_CESION CS       , ' + coCRLF +
            '               ( SELECT CT.ID_CREDITO             ,       CT.ID_TRANSACCION, ' + coCRLF +
            '                        CT.CVE_TIPO_MOVTO         ,       CT.CVE_OPERACION, ' + coCRLF +
            '                        CT.CVE_COMISION           ,       CT.ID_CONTRATO, ' + coCRLF +
            '                        CDT.CVE_CONCEPTO          ,       CDT.IMP_CONCEPTO  , ' + coCRLF +
            '                        CO.CVE_ACCESORIO          ,       CO.DESC_C_OPERACION , ' + coCRLF +
            '                        CO.CVE_OPERACION CVE_OPERACION_ORI ' + coCRLF +
            '                 FROM    CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_OPERACION CO, CONTRATO CTO ' + coCRLF +
            '                 WHERE   CT.F_OPERACION BETWEEN ' + SQLFecha(StrToDate(sF_Inicio)) + ' AND ' + SQLFecha(StrToDate(sF_Final )) + ' ' + coCRLF +
            '                   AND   CT.SIT_TRANSACCION = ''AC''                AND   CT.ID_TRANS_CANCELA IS NULL ' + coCRLF +
            '                   AND   CTO.ID_CONTRATO = CT.ID_CONTRATO           AND   CTO.ID_EMPRESA  = ' + IntToStr(pAPli.IdEmpresa) + ' ' + coCRLF;

    if not(trim('<'+sAcreditado+'>') = trim('<>')) then
    sSQL := sSQL +
            '            AND   CTO.ID_TITULAR        =  ' + sAcreditado + coCRLF ;

    sSQL := sSQL +
            '                   AND   CO.CVE_OPERACION = CT.CVE_OPERACION        AND   CO.CVE_AFEC_SALDO    = ''I'' ' + coCRLF +
            '                   AND   CO.CVE_ACCESORIO IN (''CP'',''IN'',''FN'')        AND   CDT.ID_TRANSACCION = CT.ID_TRANSACCION) TRA, ' + coCRLF ;

    if trim('<'+sEntDes+'>') = trim('<>') then
    sSQL := sSQL +
            '               ( SELECT * FROM CR_FND_CREDITO WHERE PCT_REDESCONTADO = 100)  CFND , ' + coCRLF
    else
    sSQL := sSQL +
            '               ( SELECT * FROM CR_FND_CREDITO WHERE PCT_REDESCONTADO = 100 AND CVE_FND_ENT_DES = ''' + sEntDes + ''' )  CFND , ' + coCRLF;

    sSQL := sSQL +
            '                CR_FND_ENT_DES  CFED , ' + coCRLF +
            '                CR_CONTRATO     CRCTO, ' + coCRLF +
            '                CR_PRODUCTO     CP   , ' + coCRLF +
            '                CR_PRODUCTO_GPO CPG  , CONTRATO           CTO , ' + coCRLF +
            '                MONEDA          M    , PERSONA            PT  , ' + coCRLF +
            '                CR_CAT_COMISION    COM , ' + coCRLF;

    if not(trim('<'+sPromAso+'>') = trim('<>')) then
    sSQL := sSQL +
            '               (SELECT ID_PERSONA, NOMBRE FROM PERSONA WHERE ID_PERSONA = ' + sPromAso + ' ) PAS  , ' + coCRLF
    else
    sSQL := sSQL +
            '                PERSONA         PAS  , ' + coCRLF;
    //end if;

    if not(trim('<'+sPromAdm+'>') = trim('<>')) then
    sSQL := sSQL +
            '               (SELECT ID_PERSONA, NOMBRE FROM PERSONA WHERE ID_PERSONA = ' + sPromAdm + ' ) PAD  , ' + coCRLF
    else
    sSQL := sSQL +
            '                PERSONA         PAD  , ' + coCRLF;
    //end if;

    sSQL := sSQL +
            '                CRE_PRESUPUESTO CRP ' + coCRLF +
            '          WHERE TRA.ID_CREDITO                 = CC.ID_CREDITO ' + coCRLF +
            '            AND CS.ID_CESION(+)                = CC.ID_CREDITO ' + coCRLF ;

    if ((nOperado = 0) OR (nOperado = 2)) then
    sSQL := sSQL +
            '            AND CFND.ID_CREDITO(+)             = CC.ID_CREDITO ' + coCRLF +
            '            AND CFED.CVE_FND_ENT_DES(+)        = CFND.CVE_FND_ENT_DES ' + coCRLF ;

    if nOperado = 1 then
    sSQL := sSQL +
            '            AND CFND.ID_CREDITO                = CC.ID_CREDITO ' + coCRLF +
            '            AND CFED.CVE_FND_ENT_DES(+)        = CFND.CVE_FND_ENT_DES ' + coCRLF ;


    sSQL := sSQL +
            '            AND CRCTO.ID_CONTRATO              = CC.ID_CONTRATO ' + coCRLF +
            '            AND CRCTO.FOL_CONTRATO             = CC.FOL_CONTRATO ' + coCRLF +
            '            AND CP.CVE_PRODUCTO_CRE            = CRCTO.CVE_PRODUCTO_CRE ' + coCRLF +
            '            AND CPG.CVE_PRODUCTO_GPO           = CP.CVE_PRODUCTO_GPO ' + coCRLF ;

    if not(trim('<'+sGpoProducto+'>') = trim('<>')) then
    sSQL := sSQL + '    AND CPG.CVE_PRODUCTO_GPO            = ''' + sGpoProducto + '''' + coCRLF ;

    sSQL := sSQL +
            '            AND CTO.ID_CONTRATO                = CRCTO.ID_CONTRATO ' + coCRLF +
            '            AND M.CVE_MONEDA                   = CTO.CVE_MONEDA ' + coCRLF +
            '            AND PT.ID_PERSONA                  = CTO.ID_TITULAR ' + coCRLF +
            '            AND PAD.ID_PERSONA                 = CC.ID_PROM_ADM ' + coCRLF +
            '            AND PAS.ID_PERSONA                 = CTO.ID_PERS_ASOCIAD ' + coCRLF +
            '            AND COM.CVE_COMISION(+)            = TRA.CVE_COMISION ' + coCRLF +
            '            AND CRP.CVE_PRESUPUESTO(+)         = CP.CVE_PRESUPUESTO ' + coCRLF ;

    if not(trim('<'+sPresupuesto+'>') = trim('<>')) then
    sSQL := sSQL + '    AND CP.CVE_PRESUPUESTO              = ''' + sPresupuesto + '''' + coCRLF ;

    sSQL := sSQL +
            '            )  TEMP1, ' + coCRLF +
            '       (SELECT CVE_PRODUCTO CVE_PRODUCTO_CCO,CVE_MONEDA CVE_MONEDA_CCO,CVE_OPERACION CVE_OPERACION_CCO ' + coCRLF +
            '        FROM CR_CVE_OPERACION ' + coCRLF +
            '        WHERE CVE_PARAMETRO  NOT IN (''PGCPGF'',''PGINGF'',''PGCNGF'',''PGFNGF'',''PGCPGP'',''PGINGP'',''PGCNGP'',''PGFNGP''))   CCO ' + coCRLF +
            '  WHERE   1 = 1 ' + coCRLF +
            '    AND   CCO.CVE_PRODUCTO_CCO  = TEMP1.CVE_PRODUCTO_CRE ' + coCRLF +
            '    AND   CCO.CVE_MONEDA_CCO    = TEMP1.CVE_MONEDA ' + coCRLF +
            '    AND   CCO.CVE_OPERACION_CCO = TEMP1.CVE_OPERACION_ORI ' + coCRLF +
            ' UNION ALL ' + coCRLF ;


//COBRANZA INTERCREDITOS
    sSQL := sSQL +
            ' SELECT ' + coCRLF +
            '   MO.CVE_MONEDA, ' + coCRLF +
            '   MO.DESC_MONEDA, ' + coCRLF +
            '   TO_CHAR(SB.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO, ' + coCRLF +
            '   SB.DESC_SUB_TIPO, ' + coCRLF +
            '   PF.ID_PERSONA, ' + coCRLF +
            '   PF.NOMBRE, ' + coCRLF +
            '   NULL AS CVE_ACCESORIO, ' + coCRLF +
            '   NULL AS CVE_TIPO_MOVTO, ' + coCRLF +
            '   NULL AS CVE_OPERACION, ' + coCRLF +
            '   NULL AS CVE_CONCEPTO, ' + coCRLF +
            '   CT.IMP_OPERACION, ' + coCRLF +
            '   ''INTCRE'' AS CVE_PRODUCTO_GPO, ' + coCRLF +
            '   ''INTCRE'' AS DESC_L_PROD_GPO, ' + coCRLF +
            '   NVL(CRP.CVE_PRESUPUESTO,''NO-CLA'') AS CVE_PRESUPUESTO, ' + coCRLF +
            '   NVL(CRP.CVE_PRESUPUESTO,''NO-CLA'') AS CVE_PRESUPUESTO_2, ' + coCRLF +
            '   NVL(CRP.DESC_PRESUPUESTO,''NO-CLASIFICADO'') AS DESC_PRESUPUESTO, ' + coCRLF +
            '   ''SIN FONDEO'' AS CVE_FONDEO, ' + coCRLF +
            '   ''SIN FONDEO'' AS DESC_ENT_DES, ' + coCRLF +
            '   PAD.ID_PERSONA AS ID_PERSONA_PAD, ' + coCRLF +
            '   PAD.NOMBRE AS NOMBRE_PAD, ' + coCRLF +
            '   PAS.ID_PERSONA AS ID_PERSONA_PAS, ' + coCRLF +
            '   PAS.NOMBRE AS NOMBRE_PAS, ' + coCRLF +
            '   DECODE(CT.CVE_OPERACION,''CPCAPP'',''CP'',''CAMCAP'',''CP'',''CARECA'',''CP'',''CAUTRE'',''CP'',''CPADDC'',''CP'', ' + coCRLF +
            '                           ''CPCAPV'',''CP'',''CPCAPI'',''CP'',''CARECV'',''CP'', ' + coCRLF +
            '                           ''CPINTP'',''IN'',''CPINTE'',''IN'',''CAMINT'',''IN'',''CAREIN'',''IN'',''CCAPIT'',''IN'', ' + coCRLF +
            ' 				''CPADDI'',''IN'',''CPINTV'',''IN'',''CAREIV'',''IN'',''CPENVI'',''IN'',''CMORAC'',''IN'', ' + coCRLF +
            ' 				''CMORAS'',''IN'',''CMORAD'',''IN'',''CMORAI'',''IN'')   AS TIPO_DISPOSICION ' + coCRLF +
            ' FROM ' + coCRLF +
            '   PERSONA PF, ' + coCRLF +
            '   CONTRATO CON, ' + coCRLF +
            '   MONEDA MO, ' + coCRLF +
            '   CRE_CONTRATO CC, ' + coCRLF +
            '   CRE_SUB_TIP_BCO SB, ' + coCRLF +
            '   CRE_CREDITO C, ' + coCRLF +
            '   CRE_TRANSACCION CT, ' + coCRLF +
            '   CRE_OPERACION CO, ' + coCRLF +
            '   CRE_CAT_MINIMO CCM, ' + coCRLF +
            '   CRE_PRESUPUESTO CRP, ' + coCRLF ;

    if not(trim('<'+sPromAso+'>') = trim('<>')) then
    sSQL := sSQL +
            '               (SELECT ID_PERSONA, NOMBRE FROM PERSONA WHERE ID_PERSONA = ' + sPromAso + ' ) PAS  , ' + coCRLF
    else
    sSQL := sSQL +
            '                PERSONA         PAS  , ' + coCRLF;
    //end if;

    if not(trim('<'+sPromAdm+'>') = trim('<>')) then
    sSQL := sSQL +
            '               (SELECT ID_PERSONA, NOMBRE FROM PERSONA WHERE ID_PERSONA = ' + sPromAdm + ' ) PAD   ' + coCRLF
    else
    sSQL := sSQL +
            '                PERSONA         PAD   ' + coCRLF;
    //end if;

    sSQL := sSQL +
            ' WHERE 1 = 1 ' + coCRLF +
            '   AND  F_LIQUIDACION BETWEEN ' + SQLFecha(StrToDate(sF_Inicio)) + ' AND ' + SQLFecha(StrToDate(sF_Final )) + '  ' + coCRLF +
            '   AND  CT.CVE_OPERACION IN ' + coCRLF +
//            '   --Capital Vigente ' + coCRLF +
            '   (''CPCAPP'',''CAMCAP'',''CARECA'',''CAUTRE'',''CPADDC'', ' + coCRLF +
//            '   --Capital Vencido ' + coCRLF +
            '    ''CPCAPV'',''CPCAPI'',''CARECV'', ' + coCRLF +
//            '   --Interes Vigente ' + coCRLF +
            '    ''CPINTP'',''CPINTE'',''CAMINT'',''CAREIN'',''CCAPIT'',''CPADDI'', ' + coCRLF +
//            '   --Interés Vencido ' + coCRLF +
            '    ''CPINTV'',''CAREIV'',''CPENVI'', ' + coCRLF +
//            '   --Moratorios ' + coCRLF +
            '    ''CMORAC'',''CMORAS'',''CMORAD'',''CMORAI'') ' + coCRLF +
            '   AND  CVE_SUB_CARTERA <> ''FIDAYF'' ' + coCRLF +
            '   AND  CT.SIT_TRANSACCION = ''AC'' ' + coCRLF +
            '   AND  PF.ID_PERSONA = CON.ID_TITULAR ' + coCRLF +
            '   AND  CON.CVE_MONEDA = MO.CVE_MONEDA ' + coCRLF ;
    if not(trim('<'+sMoneda+'>') = trim('<>')) then
    sSQL := sSQL + '    AND M.CVE_MONEDA            = ''' + sMoneda + '''' + coCRLF ;

    sSQL := sSQL +
            '   AND  CC.ID_CONTRATO = CON.ID_CONTRATO ' + coCRLF;

    if not(trim('<'+sAcreditado+'>') = trim('<>')) then
    sSQL := sSQL +
            '            AND   CON.ID_TITULAR        =  ' + sAcreditado + coCRLF ;

    sSQL := sSQL +
            '   AND  CC.CVE_SUB_TIP_BCO = SB.CVE_SUB_TIP_BCO ' + coCRLF +
            '   AND  C.ID_CONTRATO = CC.ID_CONTRATO ' + coCRLF +
            '   AND  C.ID_CREDITO = CT.ID_CREDITO ' + coCRLF +
            '   AND  CT.CVE_OPERACION = CO.CVE_OPERACION ' + coCRLF +
            '   AND  CO.B_INF_COBRANZA = ''V'' ' + coCRLF +
            '   AND  CCM.CVE_CAT_MIN(+) = CC.CVE_CAT_MIN ' + coCRLF +
            '   AND  PAD.ID_PERSONA                 = C.ID_PROM_ADM ' + coCRLF +
            '   AND  PAS.ID_PERSONA                 = CON.ID_PERS_ASOCIAD ' + coCRLF +
            '   AND  CRP.CVE_PRESUPUESTO(+)         = C.CVE_PRESUPUESTO ' + coCRLF ;

    if not(trim('<'+sPresupuesto+'>') = trim('<>')) then
    sSQL := sSQL + '    AND C.CVE_PRESUPUESTO              = ''' + sPresupuesto + '''' + coCRLF ;

    if ((nOperado = 1) OR (not(trim('<'+sProducto+'>') = trim('<>'))) OR (not(trim('<'+sGpoProducto+'>') = trim('<>')))) then
    sSQL := sSQL +
            '     AND CC.CVE_SUB_TIP_BCO = 0 ' + coCRLF;

    sSQL := sSQL +
            '  UNION ALL ' + coCRLF ;

//COLOCACIÓN INTERCREDITOS

    sSQL := sSQL +
            '  SELECT ' + coCRLF +
            '      M.CVE_MONEDA, ' + coCRLF +
            '      M.DESC_MONEDA, ' + coCRLF +
            '      TO_CHAR(STB.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO, ' + coCRLF +
            '      STB.DESC_SUB_TIPO, ' + coCRLF +
            '      P.ID_PERSONA, ' + coCRLF +
            '      P.NOMBRE, ' + coCRLF +
            '      NULL AS CVE_ACCESORIO, ' + coCRLF +
            '      NULL AS CVE_TIPO_MOVTO, ' + coCRLF +
            '      NULL AS CVE_OPERACION, ' + coCRLF +
            '      NULL AS CVE_CONCEPTO, ' + coCRLF +
            '      C.IMP_CREDITO, ' + coCRLF +
            '      ''INTCRE'' AS CVE_PRODUCTO_GPO, ' + coCRLF +
            '      ''INTCRE'' AS DESC_L_PROD_GPO, ' + coCRLF +
            '      NVL(CRP.CVE_PRESUPUESTO,''NO-CLA'') AS CVE_PRESUPUESTO, ' + coCRLF +
            '      NVL(CRP.CVE_PRESUPUESTO,''NO-CLA'') AS CVE_PRESUPUESTO_2, ' + coCRLF +
            '      NVL(CRP.DESC_PRESUPUESTO,''NO-CLASIFICADO'') AS DESC_PRESUPUESTO, ' + coCRLF +
            '      ''SIN FONDEO'' AS CVE_FONDEO, ' + coCRLF +
            '      ''SIN FONDEO'' AS DESC_ENT_DES, ' + coCRLF +
            '      PAD.ID_PERSONA AS ID_PERSONA_PAD, ' + coCRLF +
            '      PAD.NOMBRE AS NOMBRE_PAD, ' + coCRLF +
            '      PAS.ID_PERSONA AS ID_PERSONA_PAS, ' + coCRLF +
            '      PAS.NOMBRE AS NOMBRE_PAS, ' + coCRLF +
            '      TIPO_DISPOSICION ' + coCRLF +
            '  FROM ' + coCRLF +
            '      PERSONA P, ' + coCRLF +
            '      CONTRATO CON, ' + coCRLF +
            '      CRE_CONTRATO CC, ' + coCRLF +
            '      MONEDA M, ' + coCRLF +
            '      CRE_SUB_TIP_BCO STB, ' + coCRLF +
            '      CRE_CREDITO C, ' + coCRLF ;

    if not(trim('<'+sPromAso+'>') = trim('<>')) then
    sSQL := sSQL +
            '               (SELECT ID_PERSONA, NOMBRE FROM PERSONA WHERE ID_PERSONA = ' + sPromAso + ' ) PAS  , ' + coCRLF
    else
    sSQL := sSQL +
            '                PERSONA         PAS  , ' + coCRLF;
    //end if;

    if not(trim('<'+sPromAdm+'>') = trim('<>')) then
    sSQL := sSQL +
            '               (SELECT ID_PERSONA, NOMBRE FROM PERSONA WHERE ID_PERSONA = ' + sPromAdm + ' ) PAD  , ' + coCRLF
    else
    sSQL := sSQL +
            '                PERSONA         PAD  , ' + coCRLF;
    //end if;

    sSQL := sSQL +
            '      CRE_PRESUPUESTO CRP ' + coCRLF +
            '  WHERE   1 = 1 ' + coCRLF +
            '      AND P.ID_PERSONA = CON.ID_TITULAR ' + coCRLF +
            '      AND CON.ID_CONTRATO = CC.ID_CONTRATO ' + coCRLF ;

    if not(trim('<'+sAcreditado+'>') = trim('<>')) then
    sSQL := sSQL +
            '            AND   CON.ID_TITULAR        =  ' + sAcreditado + coCRLF ;

    sSQL := sSQL +
            '      AND CON.CVE_MONEDA = M.CVE_MONEDA ' + coCRLF ;
    if not(trim('<'+sMoneda+'>') = trim('<>')) then
    sSQL := sSQL + '    AND M.CVE_MONEDA            = ''' + sMoneda + '''' + coCRLF ;

    sSQL := sSQL +
            '      AND CC.CVE_SUB_TIP_BCO = STB.CVE_SUB_TIP_BCO ' + coCRLF +
            '      AND CC.CVE_SUB_TIP_BCO NOT IN(52) ' + coCRLF +
            '      AND CC.ID_CONTRATO = C.ID_CONTRATO ' + coCRLF +
            '      AND C.F_AUT_OPERACION BETWEEN ' + SQLFecha(StrToDate(sF_Inicio)) + ' AND ' + SQLFecha(StrToDate(sF_Final )) + '  ' + coCRLF +
            '      AND C.SIT_CREDITO IN (''AC'',''LQ'') ' + coCRLF +
            '      AND PAD.ID_PERSONA                 = C.ID_PROM_ADM ' + coCRLF +
            '      AND PAS.ID_PERSONA                 = CON.ID_PERS_ASOCIAD ' + coCRLF +
            '      AND CRP.CVE_PRESUPUESTO(+)         = C.CVE_PRESUPUESTO ' + coCRLF ;

    if not(trim('<'+sPresupuesto+'>') = trim('<>')) then
    sSQL := sSQL + '    AND C.CVE_PRESUPUESTO              = ''' + sPresupuesto + '''' + coCRLF ;

    if ((nOperado = 1) OR (not(trim('<'+sProducto+'>') = trim('<>'))) OR (not(trim('<'+sGpoProducto+'>') = trim('<>')))) then
    sSQL := sSQL +
            '     AND CC.CVE_SUB_TIP_BCO = 0 ' + coCRLF;

    sSQL := sSQL +
            '  UNION ALL ' + coCRLF ;

//COLOCACIÓN ICRE
    sSQL := sSQL +
            ' SELECT     CONTRATO.CVE_MONEDA     , ' + coCRLF +
            '            MONEDA.DESC_MONEDA      , ' + coCRLF +
            '            CP.CVE_PRODUCTO_CRE     , ' + coCRLF +
            '            CP.DESC_L_PRODUCTO      , ' + coCRLF +
            '            PTF.ID_PERSONA AS ID_TITULAR, ' + coCRLF +
            '            PTF.NOMBRE              , ' + coCRLF +
            '            CO.CVE_ACCESORIO        , ' + coCRLF +
            '            TRA.CVE_TIPO_MOVTO      , ' + coCRLF +
            '            TRA.CVE_OPERACION       , ' + coCRLF +
            '            TRAD.CVE_CONCEPTO       , ' + coCRLF +
            '            TRAD.IMP_CONCEPTO       , ' + coCRLF +
            '            CP.CVE_PRODUCTO_GPO     , ' + coCRLF +
            '            CPG.DESC_L_PROD_GPO     , ' + coCRLF +
            '            NVL(CRP.CVE_PRESUPUESTO,''NO-CLA'') AS CVE_PRESUPUESTO    , ' + coCRLF +
            '            NVL(CRP.CVE_PRESUPUESTO,''NO-CLA'') AS CVE_PRESUPUESTO_2    , ' + coCRLF +
            '            NVL(CRP.DESC_PRESUPUESTO,''NO-CLASIFICADO'') AS DESC_PRESUPUESTO, ' + coCRLF +
            '            DECODE(CFND.ID_CREDITO,NULL,''SIN FONDEO'',CFND.CVE_FND_ENT_DES ) AS CVE_FONDEO, ' + coCRLF +
            '            DECODE(CFND.ID_CREDITO,NULL,''SIN FONDEO'',CFED.DESC_ENT_DES ) AS DESC_ENT_DES, ' + coCRLF +
            '            PAD.ID_PERSONA AS ID_PERSONA_PAD, ' + coCRLF +
            '            PAD.NOMBRE AS NOMBRE_PAD, ' + coCRLF +
            '            PAS.ID_PERSONA AS ID_PERSONA_PAS, ' + coCRLF +
            '            PAS.NOMBRE AS NOMBRE_PAS, ' + coCRLF +
            '            CC.TIPO_DISPOSICION AS TIPO_OPER ' + coCRLF +
            ' FROM       CR_TRANSACCION TRA      , ' + coCRLF +
            '            CR_DET_TRANSAC TRAD     , ' + coCRLF +
            '            CR_CREDITO CC      , ' + coCRLF +
            '            CONTRATO                , ' + coCRLF +
            '            PERSONA  PTF            , ' + coCRLF ;

    if not(trim('<'+sPromAso+'>') = trim('<>')) then
    sSQL := sSQL +
            '               (SELECT ID_PERSONA, NOMBRE FROM PERSONA WHERE ID_PERSONA = ' + sPromAso + ' ) PAS  , ' + coCRLF
    else
    sSQL := sSQL +
            '                PERSONA         PAS  , ' + coCRLF;
    //end if;

    if not(trim('<'+sPromAdm+'>') = trim('<>')) then
    sSQL := sSQL +
            '               (SELECT ID_PERSONA, NOMBRE FROM PERSONA WHERE ID_PERSONA = ' + sPromAdm + ' ) PAD  , ' + coCRLF
    else
    sSQL := sSQL +
            '                PERSONA         PAD  , ' + coCRLF;
    //end if;

    sSQL := sSQL +
            '            MONEDA                  , ' + coCRLF +
            '            CR_CONTRATO             , ' + coCRLF +
            '            CR_PRODUCTO CP          , ' + coCRLF +
            '            CR_PRODUCTO_GPO CPG     , ' + coCRLF ;

    if trim('<'+sEntDes+'>') = trim('<>') then
    sSQL := sSQL +
            '           ( SELECT * FROM CR_FND_CREDITO WHERE PCT_REDESCONTADO = 100)  CFND , ' + coCRLF
    else
    sSQL := sSQL +
            '           ( SELECT * FROM CR_FND_CREDITO WHERE PCT_REDESCONTADO = 100 AND CVE_FND_ENT_DES = ''' + sEntDes + ''' )  CFND , ' + coCRLF;

    sSQL := sSQL +
            '            CR_FND_ENT_DES  CFED, ' + coCRLF +
            '            CRE_PRESUPUESTO CRP, ' + coCRLF +
            '            CR_OPERACION CO ' + coCRLF +
            '  WHERE 1 = 1 ' + coCRLF +
            '    AND TRA.F_OPERACION BETWEEN ' + SQLFecha(StrToDate(sF_Inicio)) + ' AND ' + SQLFecha(StrToDate(sF_Final )) + ' ' + coCRLF +
            '    AND TRA.CVE_OPERACION IN (''DISPCS'',''DISPCR'',''DISPRE'',''DISPRS'',''DSCSDL'', ''DSCRDL'') ' + coCRLF +
            '    AND CC.ID_CREDITO                  = TRA.ID_CREDITO ' + coCRLF +
            '    AND CFND.ID_CREDITO(+)             = CC.ID_CREDITO ' + coCRLF;

    if ((nOperado = 0) OR (nOperado = 2)) then
    sSQL := sSQL +
            '    AND CFND.ID_CREDITO(+)             = CC.ID_CREDITO ' + coCRLF +
            '    AND CFED.CVE_FND_ENT_DES(+)        = CFND.CVE_FND_ENT_DES ' + coCRLF ;

    if nOperado = 1 then
    sSQL := sSQL +
            '    AND CFND.ID_CREDITO                = CC.ID_CREDITO ' + coCRLF +
            '    AND CFED.CVE_FND_ENT_DES(+)        = CFND.CVE_FND_ENT_DES ' + coCRLF ;

    sSQL := sSQL +
            '    AND CONTRATO.ID_CONTRATO           = TRA.ID_CONTRATO ' + coCRLF ;

    if not(trim('<'+sAcreditado+'>') = trim('<>')) then
    sSQL := sSQL +
            '            AND   CONTRATO.ID_TITULAR        =  ' + sAcreditado + coCRLF ;

    sSQL := sSQL +
            '    AND PTF.ID_PERSONA                 = CONTRATO.ID_TITULAR ' + coCRLF +
            '    AND PAD.ID_PERSONA                 = CC.ID_PROM_ADM ' + coCRLF +
            '    AND PAS.ID_PERSONA                 = CONTRATO.ID_PERS_ASOCIAD ' + coCRLF +
            '    AND MONEDA.CVE_MONEDA              = CONTRATO.CVE_MONEDA ' + coCRLF ;

    if not(trim('<'+sMoneda+'>') = trim('<>')) then
    sSQL := sSQL + '    AND MONEDA.CVE_MONEDA            = ''' + sMoneda + '''' + coCRLF ;

    sSQL := sSQL +
            '    AND CR_CONTRATO.ID_CONTRATO        = CC.ID_CONTRATO ' + coCRLF +
            '    AND CR_CONTRATO.FOL_CONTRATO       = CC.FOL_CONTRATO ' + coCRLF +
            '    AND CP.CVE_PRODUCTO_CRE            = CR_CONTRATO.CVE_PRODUCTO_CRE ' + coCRLF ;

    if not(trim('<'+sProducto+'>') = trim('<>')) then
    sSQL := sSQL + '    AND CP.CVE_PRODUCTO_CRE            = ''' + sProducto + '''' + coCRLF ;

    sSQL := sSQL +
            '    AND CPG.CVE_PRODUCTO_GPO (+)       = CP.CVE_PRODUCTO_GPO ' + coCRLF ;

    if not(trim('<'+sGpoProducto+'>') = trim('<>')) then
    sSQL := sSQL + '    AND CPG.CVE_PRODUCTO_GPO            = ''' + sGpoProducto + '''' + coCRLF ;

    sSQL := sSQL +
            '    AND TRUNC(CC.F_AUTORIZA)          >= ' + SQLFecha(StrToDate(sF_Inicio)) + ' ' + coCRLF +
            '    AND TRUNC(CC.F_AUTORIZA)          <= ' + SQLFecha(StrToDate(sF_Final )) + ' ' + coCRLF +
            '    AND CC.SIT_CREDITO IN ( ''LQ'',''AC'' ) ' + coCRLF +
            '    AND CP.ID_EMPRESA = ' + IntToStr(pAPli.IdEmpresa) + ' ' + coCRLF +
            '    AND CRP.CVE_PRESUPUESTO(+)         = CP.CVE_PRESUPUESTO ' + coCRLF ;

    if not(trim('<'+sPresupuesto+'>') = trim('<>')) then
    sSQL := sSQL + '    AND CP.CVE_PRESUPUESTO              = ''' + sPresupuesto + '''' + coCRLF ;

    sSQL := sSQL +
            '    AND TRAD.ID_TRANSACCION            = TRA.ID_TRANSACCION ' + coCRLF +
            '    AND TRAD.CVE_OPERACION             = TRA.CVE_OPERACION ' + coCRLF +
            '    AND TRAD.CVE_CONCEPTO              = ''IMPBRU'' ' + coCRLF +
            '    AND CO.CVE_OPERACION               = TRA.CVE_OPERACION ' + coCRLF +
            ' ) ' + coCRLF;

   sSQL := sSQL +
            '    WHERE 1 = 1 ' + coCRLF;

//FILTRO GENERICO
    IF nOperado = 2 then
    sSQL := sSQL +
            '    AND    CVE_FONDEO = ''SIN FONDEO''' + coCRLF;

// FONDEO ESPECIFICO (FILTRA INTERCREDITOS)
    if NOT(trim('<'+sEntDes+'>') = trim('<>')) then
    sSQL := sSQL +
            '    AND    CVE_FONDEO = ''' + sEntDes + '''' + coCRLF;

// OORDER BY
    sSQL := sSQL +
               '    ORDER BY CVE_MONEDA, ';
    if nPromotor = 1 then
       sSQL := sSQL +
               ' NOMBRE_PAS, ';
    //end if

    if nPromotor = 2 then
       sSQL := sSQL +
               ' NOMBRE_PAD, ';
    //end if

    if nPromotor = 3 then
       sSQL := sSQL +
               ' NOMBRE_PAS, NOMBRE_PAD, ';
    //end if

    if nAgrupacion = 0 then
       sSQL := sSQL +
               ' NOMBRE ,DESC_PRESUPUESTO,  CVE_FONDEO  ';
    //end if

    if nAgrupacion = 1 then
       sSQL := sSQL +
               ' DESC_PRESUPUESTO, NOMBRE, CVE_FONDEO  ';
    //end if

    if nAgrupacion = 2 then
       sSQL := sSQL +
               ' CVE_PRODUCTO_CRE, NOMBRE, CVE_FONDEO  ';
    //end if


    FormaQuery := sSQL;

end;

Procedure RepInfCobCol(    sF_Inicio,sF_Final:String;
                           sProducto, sMoneda, sGpoProducto,
                           sEntDes, sEntDesDesc,
                           sAcreditado, sAcreditadoDesc,
                           sPromAso, sPromAsoDesc,
                           sPromAdm, sPromAdmDesc,
                           sPresupuesto,
                           sNbrArch: String;
                           nOperado, nAgrupacion, nPromotor : Integer;
                           pAPli     : TInterApli;
                           pPreview  : Boolean);
var
   QrInColCob   : TQrInColCob;
   Preview     : TIntQRPreview;

begin
   QrInColCob:=TQrInColCob.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrInColCob);
   Try

      QrInColCob.VLImprime := False;

      QrInColCob.VLDisF := 0;      QrInColCob.VLRerF := 0;      QrInColCob.VLCapF := 0;      QrInColCob.VLFadF := 0;      QrInColCob.VLIntF := 0;
      QrInColCob.VLDisM := 0;      QrInColCob.VLRerM := 0;      QrInColCob.VLCapM := 0;      QrInColCob.VLFadM := 0;      QrInColCob.VLIntM := 0;
      QrInColCob.VLDisA := 0;      QrInColCob.VLRerA := 0;      QrInColCob.VLCapA := 0;      QrInColCob.VLFadA := 0;      QrInColCob.VLIntA := 0;
      QrInColCob.VLDisC := 0;      QrInColCob.VLRerC := 0;      QrInColCob.VLCapC := 0;      QrInColCob.VLFadC := 0;      QrInColCob.VLIntC := 0;
      QrInColCob.VLDisP := 0;      QrInColCob.VLRerP := 0;      QrInColCob.VLCapP := 0;      QrInColCob.VLFadP := 0;      QrInColCob.VLIntP := 0;
      QrInColCob.VLDisS := 0;      QrInColCob.VLRerS := 0;      QrInColCob.VLCapS := 0;      QrInColCob.VLFadS := 0;      QrInColCob.VLIntS := 0;
      QrInColCob.VLDisD := 0;      QrInColCob.VLRerD := 0;      QrInColCob.VLCapD := 0;      QrInColCob.VLFadD := 0;      QrInColCob.VLIntD := 0;

      QrInColCob.VLDisCSF := 0;      QrInColCob.VLRerCSF := 0;      QrInColCob.VLCapCSF := 0;      QrInColCob.VLFadCSF := 0;      QrInColCob.VLIntCSF := 0;
      QrInColCob.VLDisCCF := 0;      QrInColCob.VLRerCCF := 0;      QrInColCob.VLCapCCF := 0;      QrInColCob.VLFadCCF := 0;      QrInColCob.VLIntCCF := 0;

      //Promotor
      if nPromotor = 0 then
      begin
           If not(Trim(sPromAso)<>'') Then
           begin
                QrInColCob.QRGPAsoc.Enabled := False;
                QrInColCob.QRFPAS.Enabled := False;
                QrInColCob.QRGPAsoc.Free;
                QrInColCob.QRFPAS.Free;
           end;
           If not(Trim(sPromAdm)<>'') Then
           begin
                QrInColCob.QRGPAdm.Enabled := False;
                QrInColCob.QRFPAD.Enabled := False;
                QrInColCob.QRGPAdm.Free;
                QrInColCob.QRFPAD.Free;
           end;
      end;


      if nPromotor = 1 then
      begin
           QrInColCob.QRGPAdm.Enabled := False;
           QrInColCob.QRFPAD.Enabled := False;
           QrInColCob.QRGPAdm.Free;
           QrInColCob.QRFPAD.Free;
      end;

      if nPromotor = 2 then
      begin
           QrInColCob.QRGPAsoc.Enabled := False;
           QrInColCob.QRFPAS.Enabled := False;
           QrInColCob.QRGPAsoc.Free;
           QrInColCob.QRFPAS.Free;
      end;


      //Acreditado
      if nAgrupacion = 0 then
      begin
           QrInColCob.QRfbProducto.Enabled := False;
           QrInColCob.QRGProducto.Enabled := False;
           QrInColCob.QRfbMercObj2.Enabled := False;
           QrInColCob.QRMercObjSup.Enabled := False;
           QrInColCob.QRfbProducto.Free;
           QrInColCob.QRGProducto.Free;
           QrInColCob.QRfbMercObj2.Free;
           QrInColCob.QRMercObjSup.Free;
      end;

      //Mercado Objetivo
      if nAgrupacion = 1 then
      begin
           QrInColCob.QRfbProducto.Enabled := False;
           QrInColCob.QRGProducto.Enabled := False;
           QrInColCob.QRfbProducto.Free;
           QrInColCob.QRGProducto.Free;

      end;

      //Producto
      if nAgrupacion = 2 then
      begin
           QrInColCob.QRfbMercObj2.Enabled := False;
           QrInColCob.QRMercObjSup.Enabled := False;
           QrInColCob.QRfbMercObj2.Free;
           QrInColCob.QRMercObjSup.Free;
      end;

      QrInColCob.sArchivo:= sNbrArch;

      QrInColCob.QRInterEncabezado1.Apli:=pApli;
      QrInColCob.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrInColCob.QRInterEncabezado1.NomReporte:='IntQColCob';
      QrInColCob.QRInterEncabezado1.Titulo1:='Informe Cobranza - Colocación';


      If Trim(sF_Inicio)<>'' Then
         QrInColCob.QRInterEncabezado1.Titulo2:=QrInColCob.QRInterEncabezado1.Titulo2 + ' del '+
                                      sF_Inicio + ' al ' + sF_Final;

      If Trim(sProducto)<>'' Then
         QrInColCob.QRInterEncabezado1.Titulo2 := QrInColCob.QRInterEncabezado1.Titulo2 + ' - Producto : ' + sProducto + '.';

      If Trim(sMoneda)<>'' Then
         QrInColCob.QRInterEncabezado1.Titulo2 := QrInColCob.QRInterEncabezado1.Titulo2 + ' - Moneda : ' + sMoneda + '.';

      If Trim(sGpoProducto)<>'' Then
         QrInColCob.QRInterEncabezado1.Titulo2 := QrInColCob.QRInterEncabezado1.Titulo2 + ' - Grupo Prod : ' + sGpoProducto + '.';

      If Trim(sEntDes)<>'' Then
         QrInColCob.QRInterEncabezado1.Titulo2 := QrInColCob.QRInterEncabezado1.Titulo2 + ' - Ent Desc : (' + sEntDes + ')' + sEntDesDesc +'.';

      If Trim(sAcreditado)<>'' Then
         QrInColCob.QRInterEncabezado1.Titulo2 := QrInColCob.QRInterEncabezado1.Titulo2 + ' - Acreditado : (' + sAcreditado + ')' + sAcreditadoDesc + '.';

      If Trim(sPromAso)<>'' Then
         QrInColCob.QRInterEncabezado1.Titulo2 := QrInColCob.QRInterEncabezado1.Titulo2 + ' - Prom Asoc : (' + sPromAso + ')' + sPromAsoDesc + '.';

      If Trim(sPromAdm)<>'' Then
         QrInColCob.QRInterEncabezado1.Titulo2 := QrInColCob.QRInterEncabezado1.Titulo2 + ' - Prom Admin : (' + sPromAdm + ')' + sPromAdmDesc + '.';

      If nOperado = 1 Then
         QrInColCob.QRInterEncabezado1.Titulo2 := QrInColCob.QRInterEncabezado1.Titulo2 + ' - Con Ent Desc.';

      If nOperado = 2 Then
         QrInColCob.QRInterEncabezado1.Titulo2 := QrInColCob.QRInterEncabezado1.Titulo2 + ' - Sin Ent Desc.';

      If nPromotor = 1 Then
         QrInColCob.QRInterEncabezado1.Titulo2 := QrInColCob.QRInterEncabezado1.Titulo2 + ' - Por Prom Asoc.';

      If nPromotor = 2 Then
         QrInColCob.QRInterEncabezado1.Titulo2 := QrInColCob.QRInterEncabezado1.Titulo2 + ' - Por Prom Admin.';

      If nPromotor = 3 Then
         QrInColCob.QRInterEncabezado1.Titulo2 := QrInColCob.QRInterEncabezado1.Titulo2 + ' - Por Prom Asoc y Admin.';




      QrInColCob.qyInfCobConta.DatabaseName := pApli.DataBaseName;
      QrInColCob.qyInfCobConta.SessionName := pApli.SessionName;


      QrInColCob.qyInfCobConta.Active:=False;
      QrInColCob.qyInfCobConta.SQL.Text:= QrInColCob.FormaQuery(sF_Inicio, sF_Final,
                                                                sProducto, sMoneda, sGpoProducto, sEntDes, sAcreditado, sPromAso, sPromAdm, sPresupuesto,
                                                                nOperado, nAgrupacion, nPromotor,
                                                                pAPli);

      QrInColCob.qyInfCobConta.SQL.SaveToFile('C:\COBCONT.TXT');

      QrInColCob.qyInfCobConta.Active:=True;

      If Trim(QrInColCob.sArchivo)<>'' Then
      Begin
         QrInColCob.VLImprime := True;
         AssignFile(F, QrInColCob.sArchivo);
         Rewrite(F);
         Writeln(F, QrInColCob.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F, QrInColCob.QRInterEncabezado1.Titulo2 + #09 );
         Writeln(F,  #09 );

         Writeln(F, 'Clave Moneda' + #09 +
                    'Moneda' + #09 +
                    'Clave Producto' + #09 +
                    'Producto' + #09 +
                    'ID Titular' + #09 +
                    'Nombre' + #09 +
                    'Importe' + #09 +
                    'Clave Gpo Producto' + #09 +
                    'Gpo Producto' + #09 +
                    'Clave Merc Obj' + #09 +
                    'Merc Obj' + #09 +
                    'Clave Ent Desc' + #09 +
                    'Ent Desc' + #09 +
                    'ID Prom Admon' + #09 +
                    'Nombre Prom Admon' + #09 +
                    'ID Prom Asoc' + #09 +
                    'Nombre Prom Asoc' + #09 +
                    'Tipo Operacion'
                 );



      end;

      If pPreview Then
          QrInColCob.Preview
      Else
          QrInColCob.Print;

      //end if

    Finally
      If Trim(QrInColCob.sArchivo)<>'' Then Begin
         CloseFile(F);
      End;

      QrInColCob.free;
      If Assigned(Preview) Then Preview.Free;
    End;


end;



procedure TQrInColCob.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
      VLDisF := 0;      VLRerF := 0;      VLCapF := 0;      VLFadF := 0;      VLIntF := 0;
      VLDisM := 0;      VLRerM := 0;      VLCapM := 0;      VLFadM := 0;      VLIntM := 0;
      VLDisA := 0;      VLRerA := 0;      VLCapA := 0;      VLFadA := 0;      VLIntA := 0;
      VLDisC := 0;      VLRerC := 0;      VLCapC := 0;      VLFadC := 0;      VLIntC := 0;
      VLDisP := 0;      VLRerP := 0;      VLCapP := 0;      VLFadP := 0;      VLIntP := 0;
      VLDisS := 0;      VLRerS := 0;      VLCapS := 0;      VLFadS := 0;      VLIntS := 0;
      VLDisD := 0;      VLRerD := 0;      VLCapD := 0;      VLFadD := 0;      VLIntD := 0;


      VLDisCSF := 0;      VLRerCSF := 0;      VLCapCSF := 0;      VLFadCSF := 0;      VLIntCSF := 0;
      VLDisCCF := 0;      VLRerCCF := 0;      VLCapCCF := 0;      VLFadCCF := 0;      VLIntCCF := 0;
end;

procedure TQrInColCob.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     if qyInfCobContaTIPO_OPER.AsString = 'DI' then
     begin
        VLDisF := VLDisF + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLDisM := VLDisM + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLDisA := VLDisA + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLDisC := VLDisC + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLDisP := VLDisP + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLDisS := VLDisS + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLDisD := VLDisD + qyInfCobContaIMP_CONCEPTO.AsFloat;


        if qyInfCobContaCVE_FONDEO.AsString = 'SIN FONDEO' then
           VLDisCSF := VLDisCSF + qyInfCobContaIMP_CONCEPTO.AsFloat
        else
           VLDisCCF := VLDisCCF + qyInfCobContaIMP_CONCEPTO.AsFloat
        // end if
     end;

     if ((qyInfCobContaTIPO_OPER.AsString <> 'DI') AND
         (qyInfCobContaTIPO_OPER.AsString <> 'CP') AND (qyInfCobContaTIPO_OPER.AsString <> 'IN') AND (qyInfCobContaTIPO_OPER.AsString <> 'FN')) then
     begin
        VLRerF := VLRerF + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLRerM := VLRerM + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLRerA := VLRerA + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLRerC := VLRerC + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLRerP := VLRerP + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLRerS := VLRerS + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLRerD := VLRerD + qyInfCobContaIMP_CONCEPTO.AsFloat;


        if qyInfCobContaCVE_FONDEO.AsString = 'SIN FONDEO' then
           VLRerCSF := VLRerCSF + qyInfCobContaIMP_CONCEPTO.AsFloat
        else
           VLRerCCF := VLRerCCF + qyInfCobContaIMP_CONCEPTO.AsFloat
        // end if

     end;

     if qyInfCobContaTIPO_OPER.AsString = 'CP' then
     begin
        VLCapF := VLCapF + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLCapM := VLCapM + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLCapA := VLCapA + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLCapC := VLCapC + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLCapP := VLCapP + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLCapS := VLCapS + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLCapD := VLCapD + qyInfCobContaIMP_CONCEPTO.AsFloat;


        if qyInfCobContaCVE_FONDEO.AsString = 'SIN FONDEO' then
           VLCapCSF := VLCapCSF + qyInfCobContaIMP_CONCEPTO.AsFloat
        else
           VLCapCCF := VLCapCCF + qyInfCobContaIMP_CONCEPTO.AsFloat
        // end if
     end;

     if qyInfCobContaTIPO_OPER.AsString = 'FN' then
     begin
        VLFadF := VLFadF + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLFadM := VLFadM + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLFadA := VLFadA + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLFadC := VLFadC + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLFadP := VLFadP + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLFadS := VLFadS + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLFadD := VLFadD + qyInfCobContaIMP_CONCEPTO.AsFloat;


        if qyInfCobContaCVE_FONDEO.AsString = 'SIN FONDEO' then
           VLFadCSF := VLFadCSF + qyInfCobContaIMP_CONCEPTO.AsFloat
        else
           VLFadCCF := VLFadCCF + qyInfCobContaIMP_CONCEPTO.AsFloat
        // end if
     end;


     if qyInfCobContaTIPO_OPER.AsString = 'IN' then
     begin
        VLIntF := VLIntF + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLIntM := VLIntM + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLIntA := VLIntA + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLIntC := VLIntC + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLIntP := VLIntP + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLIntS := VLIntS + qyInfCobContaIMP_CONCEPTO.AsFloat;
        VLIntD := VLIntD + qyInfCobContaIMP_CONCEPTO.AsFloat;


        if qyInfCobContaCVE_FONDEO.AsString = 'SIN FONDEO' then
           VLIntCSF := VLIntCSF + qyInfCobContaIMP_CONCEPTO.AsFloat
        else
           VLIntCCF := VLIntCCF + qyInfCobContaIMP_CONCEPTO.AsFloat
        // end if

     end;

     if VLImprime then
         Writeln(F, qyInfCobConta.FieldByName('CVE_MONEDA').AsString + #09 +
                    qyInfCobConta.FieldByName('DESC_MONEDA').AsString + #09 +
                    qyInfCobConta.FieldByName('CVE_PRODUCTO_CRE').AsString + #09 +
                    qyInfCobConta.FieldByName('DESC_L_PRODUCTO').AsString + #09 +
                    qyInfCobConta.FieldByName('ID_TITULAR').AsString + #09 +
                    qyInfCobConta.FieldByName('NOMBRE').AsString + #09 +
                    qyInfCobConta.FieldByName('IMP_CONCEPTO').AsString + #09 +
                    qyInfCobConta.FieldByName('CVE_PRODUCTO_GPO').AsString + #09 +
                    qyInfCobConta.FieldByName('DESC_L_PROD_GPO').AsString + #09 +
                    qyInfCobConta.FieldByName('CVE_PRESUPUESTO').AsString + #09 +
                    qyInfCobConta.FieldByName('DESC_PRESUPUESTO').AsString + #09 +
                    qyInfCobConta.FieldByName('CVE_FONDEO').AsString + #09 +
                    qyInfCobConta.FieldByName('DESC_ENT_DES').AsString + #09 +
                    qyInfCobConta.FieldByName('ID_PERSONA_PAD').AsString + #09 +
                    qyInfCobConta.FieldByName('NOMBRE_PAD').AsString + #09 +
                    qyInfCobConta.FieldByName('ID_PERSONA_PAS').AsString + #09 +
                    qyInfCobConta.FieldByName('NOMBRE_PAS').AsString + #09 +
                    qyInfCobConta.FieldByName('TIPO_OPER').AsString
                 );
     //end if;
end;

procedure TQrInColCob.QRFondeoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     QRLabel31.Caption := FormatFloat('###,###,###,###,##0.00',VLDisF);
     QRLabel32.Caption := FormatFloat('###,###,###,###,##0.00',VLRerF);
     QRLabel33.Caption := FormatFloat('###,###,###,###,##0.00',VLCapF);
     QRLabel17.Caption := FormatFloat('###,###,###,###,##0.00',VLFadF);
     QRLabel34.Caption := FormatFloat('###,###,###,###,##0.00',VLIntF);
     QRLabel90.Caption := FormatFloat('###,###,###,###,##0.00',VLCapF+VLFadF+VLIntF);
     VLDisF := 0;
     VLRerF := 0;
     VLCapF := 0;
     VLFadF := 0;
     VLIntF := 0;
end;

procedure TQrInColCob.QRAcredBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     QRLabel39.Caption := FormatFloat('###,###,###,###,##0.00',VLDisA);
     QRLabel40.Caption := FormatFloat('###,###,###,###,##0.00',VLRerA);
     QRLabel41.Caption := FormatFloat('###,###,###,###,##0.00',VLCapA);
     QRLabel86.Caption := FormatFloat('###,###,###,###,##0.00',VLFadA);
     QRLabel42.Caption := FormatFloat('###,###,###,###,##0.00',VLIntA);
     QRLabel88.Caption := FormatFloat('###,###,###,###,##0.00',VLCapA+VLFadA+VLIntA);
     VLDisA := 0;
     VLRerA := 0;
     VLCapA := 0;
     VLFadA := 0;
     VLIntA := 0;
end;

procedure TQrInColCob.QRMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     QRLabel43.Caption := FormatFloat('###,###,###,###,##0.00',VLDisC);
     QRLabel44.Caption := FormatFloat('###,###,###,###,##0.00',VLRerC);
     QRLabel45.Caption := FormatFloat('###,###,###,###,##0.00',VLCapC);
     QRLabel103.Caption := FormatFloat('###,###,###,###,##0.00',VLFadC);
     QRLabel46.Caption := FormatFloat('###,###,###,###,##0.00',VLIntC);
     QRLabel105.Caption := FormatFloat('###,###,###,###,##0.00',VLCapC+VLFadC+VLIntC);
     VLDisC := 0;
     VLRerC := 0;
     VLCapC := 0;
     VLFadC := 0;
     VLIntC := 0;



     QRLabel50.Caption := FormatFloat('###,###,###,###,##0.00',VLDisCCF);
     QRLabel52.Caption := FormatFloat('###,###,###,###,##0.00',VLRerCCF);
     QRLabel54.Caption := FormatFloat('###,###,###,###,##0.00',VLCapCCF);
     QRLabel107.Caption := FormatFloat('###,###,###,###,##0.00',VLFadCCF);
     QRLabel56.Caption := FormatFloat('###,###,###,###,##0.00',VLIntCCF);
     QRLabel109.Caption := FormatFloat('###,###,###,###,##0.00',VLCapCCF+VLFadCCF+VLIntCCF);
     VLDisCCF := 0;
     VLRerCCF := 0;
     VLCapCCF := 0;
     VLFadCCF := 0;
     VLIntCCF := 0;


     QRLabel58.Caption := FormatFloat('###,###,###,###,##0.00',VLDisCSF);
     QRLabel60.Caption := FormatFloat('###,###,###,###,##0.00',VLRerCSF);
     QRLabel62.Caption := FormatFloat('###,###,###,###,##0.00',VLCapCSF);
     QRLabel111.Caption := FormatFloat('###,###,###,###,##0.00',VLFadCSF);
     QRLabel64.Caption := FormatFloat('###,###,###,###,##0.00',VLIntCSF);
     QRLabel113.Caption := FormatFloat('###,###,###,###,##0.00',VLCapCSF+VLFadCSF+VLIntCSF);
     VLDisCSF := 0;
     VLRerCSF := 0;
     VLCapCSF := 0;
     VLFadCSF := 0;
     VLIntCSF := 0;


end;


procedure TQrInColCob.QRfbProductoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     QRLabel68.Caption := FormatFloat('###,###,###,###,##0.00',VLDisP);
     QRLabel70.Caption := FormatFloat('###,###,###,###,##0.00',VLRerP);
     QRLabel72.Caption := FormatFloat('###,###,###,###,##0.00',VLCapP);
     QRLabel99.Caption := FormatFloat('###,###,###,###,##0.00',VLFadP);
     QRLabel74.Caption := FormatFloat('###,###,###,###,##0.00',VLIntP);
     QRLabel101.Caption := FormatFloat('###,###,###,###,##0.00',VLCapP+VLFadP+VLIntP);
     VLDisP := 0;
     VLRerP := 0;
     VLCapP := 0;
     VLFadP := 0;
     VLIntP := 0;

end;

procedure TQrInColCob.QRfbMercObj2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     QRLabel76.Caption := FormatFloat('###,###,###,###,##0.00',VLDisM);
     QRLabel78.Caption := FormatFloat('###,###,###,###,##0.00',VLRerM);
     QRLabel80.Caption := FormatFloat('###,###,###,###,##0.00',VLCapM);
     QRLabel94.Caption := FormatFloat('###,###,###,###,##0.00',VLFadM);
     QRLabel82.Caption := FormatFloat('###,###,###,###,##0.00',VLIntM);
     QRLabel96.Caption := FormatFloat('###,###,###,###,##0.00',VLCapM+VLFadM+VLIntM);
     VLDisM := 0;
     VLRerM := 0;
     VLCapM := 0;
     VLFadM := 0;
     VLIntM := 0;
end;

procedure TQrInColCob.QRGMonedaAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
     VLMerObjAnt := 'XXX';
end;

procedure TQrInColCob.QRFPADBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     QRLabel18.Caption := FormatFloat('###,###,###,###,##0.00',VLDisD);
     QRLabel20.Caption := FormatFloat('###,###,###,###,##0.00',VLRerD);
     QRLabel21.Caption := FormatFloat('###,###,###,###,##0.00',VLCapD);
     QRLabel26.Caption := FormatFloat('###,###,###,###,##0.00',VLFadD);
     QRLabel25.Caption := FormatFloat('###,###,###,###,##0.00',VLIntD);
     QRLabel27.Caption := FormatFloat('###,###,###,###,##0.00',VLCapD+VLFadD+VLIntD);
     VLDisD := 0;
     VLRerD := 0;
     VLCapD := 0;
     VLFadD := 0;
     VLIntD := 0;
end;

procedure TQrInColCob.QRFPASBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     QRLabel29.Caption := FormatFloat('###,###,###,###,##0.00',VLDisS);
     QRLabel30.Caption := FormatFloat('###,###,###,###,##0.00',VLRerS);
     QRLabel51.Caption := FormatFloat('###,###,###,###,##0.00',VLCapS);
     QRLabel59.Caption := FormatFloat('###,###,###,###,##0.00',VLFadS);
     QRLabel55.Caption := FormatFloat('###,###,###,###,##0.00',VLIntS);
     QRLabel61.Caption := FormatFloat('###,###,###,###,##0.00',VLCapS+VLFadS+VLIntS);
     VLDisS := 0;
     VLRerS := 0;
     VLCapS := 0;
     VLFadS := 0;
     VLIntS := 0;

end;

end.
