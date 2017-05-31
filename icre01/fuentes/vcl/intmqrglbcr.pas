unit IntMQrGlbCr;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, UnSQL2, Dialogs,

  IntGenCre;

type
  TQrGlbCr = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRLabel25: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    qrDetalle: TQRBand;
    QRShape11: TQRShape;
    QRLabel2: TQRLabel;
    GpoCredito: TQRGroup;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape8: TQRShape;
    qrGpoMoneda: TQRGroup;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel6: TQRLabel;
    QryRepGlobal: TQuery;
    qrGpoAcreditado: TQRGroup;
    QRLabel8: TQRLabel;
    qrFootAcreditado: TQRBand;
    qrFootMoneda: TQRBand;
    qrGpoCredito: TQRGroup;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    qrFootCredito: TQRBand;
    QRDBText10: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    qrdbtxtIMP_GTIA_OTR: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel12: TQRLabel;
    qrlblGrpAcre_IMP_CREDITO: TQRLabel;
    qrlblGrpAcre_ADEUDOVIGENTE: TQRLabel;
    qrlblGrpAcre_IMP_PCT_FEG: TQRLabel;
    qrlblGrpAcre_IMP_PCT_LIQ: TQRLabel;
    qrlblGrpAcre_IMP_GTIA_LIQ: TQRLabel;
    QRShape6: TQRShape;
    QRDBText15: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel22: TQRLabel;
    qrlblGrpAcre_TOTAL_DISP: TQRLabel;
    qrlblGrpMone_IMP_CREDITO: TQRLabel;
    qrlblGrpMone_ADEUDOVIGENTE: TQRLabel;
    qrlblGrpMone_IMP_PCT_FEG: TQRLabel;
    qrlblGrpMone_IMP_PCT_LIQ: TQRLabel;
    qrlblGrpMone_IMP_GTIA_LIQ: TQRLabel;
    QRLabel31: TQRLabel;
    qrlblGrpMone_TOTAL_DISP: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    qrlblGrpAcre_IMP_GTIA_OTR: TQRLabel;
    qrlblGrpCred_IMP_GTIA_OTR: TQRLabel;
    qrlblGrpMone_IMP_GTIA_OTR: TQRLabel;
    QRShape9: TQRShape;
    QRLabel26: TQRLabel;
    QRDBText17: TQRDBText;
    QRShape13: TQRShape;
    QRLabel27: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    qrlblGrpAcre_ADEUDOVENCIDO: TQRLabel;
    qrlblGrpAcre_ADEUDOTOTAL: TQRLabel;
    qrlblGrpMone_ADEUDOVENCIDO: TQRLabel;
    qrlblGrpMone_ADEUDOTOTAL: TQRLabel;
    QRDBText5: TQRDBText;
    QryRepGlobalCVE_MONEDA: TFloatField;
    QryRepGlobalDESC_MONEDA: TStringField;
    QryRepGlobalID_CREDITO: TFloatField;
    QryRepGlobalSIT_CREDITO: TStringField;
    QryRepGlobalID_TITULAR: TFloatField;
    QryRepGlobalNOM_ACREDITADO: TStringField;
    QryRepGlobalF_INICIO: TDateTimeField;
    QryRepGlobalF_VENCIMIENTO: TDateTimeField;
    QryRepGlobalIMP_CREDITO: TFloatField;
    QryRepGlobalPCT_GTIA_LIQ: TFloatField;
    QryRepGlobalPCT_GTIA_FEGA_EF: TFloatField;
    QryRepGlobalIMP_GTIA_LIQ: TFloatField;
    QryRepGlobalTX_COMENTARIO: TStringField;
    QryRepGlobalIMP_GTIA_OTR: TFloatField;
    QryRepGlobalADEUDOVENCIDO: TFloatField;
    QryRepGlobalADEUDOVIGENTE: TFloatField;
    QryRepGlobalADEUDOTOTAL: TFloatField;
    QryRepGlobalIMP_PCT_LIQ: TFloatField;
    QryRepGlobalIMP_PCT_FEG: TFloatField;
    QryRepGlobalIMP_GTIA_TOT: TFloatField;
    qrdbIMP_GTIA_TOT: TQRDBText;
    qrlblGrpAcre_IMP_GTIA_TOT: TQRLabel;
    qrlblGrpMone_IMP_GTIA_TOT: TQRLabel;
    qrlblGrpAcre_IMP_GTIA_SOB: TQRLabel;
    qrdbIMP_GTIA_SOB: TQRDBText;
    QryRepGlobalIMP_GTIA_SOB: TFloatField;
    QRShape16: TQRShape;
    QRLabel28: TQRLabel;
    qrExprPCT: TQRExpr;
    qrlblGrpCred_IMP_GTIA_TOT1: TQRLabel;
    qrlblGrpCred_IMP_GTIA_SOB_PCT1: TQRLabel;
    qrlblGrpCred_IMP_GTIA_SOB1: TQRLabel;
    qrlblGrpAcre_IMP_GTIA_SOB_PCT: TQRLabel;
    procedure qrDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGpoAcreditadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGpoCreditoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrFootAcreditadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrFootCreditoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGpoMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrFootMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
   { Private Declarations }
   vgApli : TInterApli;

   vgGrpAcre_IMP_CREDITO  : Real;
   vgGrpAcre_ADEUDOVIGENTE  : Real;
   vgGrpAcre_ADEUDOVENCIDO  : Real;
   vgGrpAcre_ADEUDOTOTAL  : Real;
   vgGrpAcre_IMP_PCT_FEG  : Real;
   vgGrpAcre_IMP_PCT_LIQ  : Real;
   vgGrpAcre_IMP_GTIA_LIQ : Real;
   vgGrpAcre_IMP_GTIA_OTR : Real;
   vgGrpAcre_TOTAL_DISP : Integer;


   vgGrpMone_IMP_CREDITO  : Real;
   vgGrpMone_ADEUDOVIGENTE  : Real;
   vgGrpMone_ADEUDOVENCIDO  : Real;
   vgGrpMone_ADEUDOTOTAL  : Real;
   vgGrpMone_IMP_PCT_FEG  : Real;
   vgGrpMone_IMP_PCT_LIQ  : Real;
   vgGrpMone_IMP_GTIA_LIQ : Real;
   vgGrpMone_IMP_GTIA_OTR : Real;
   vgGrpMone_TOTAL_DISP : Integer;

   vgGrpCred_IMP_GTIA_OTR : Real;
   vgGrpCred_COUNT_OTR_GTIA : Integer;

   vgbPrintFootCredito : Boolean;

   function ObtenTotaldeOtrasGtias( peID_CREDITO : Integer ) : Integer;
  public
   { Public Declarations }
  end;


function ArmaQuery(  peCVE_MONEDA, peID_ACREDITADO, peID_CREDITO,
                     peID_EMPRESA, peID_SUCURSAL : Integer;
                     peSIT_CREDITO, peF_INI, peF_FIN : String;
                     peApli     : TInterApli ) : String;

procedure RepGlbGtias(  peCVE_MONEDA, peID_ACREDITADO, peID_CREDITO,
                        peID_EMPRESA, peID_SUCURSAL : Integer;
                        peSIT_CREDITO, peF_INI, peF_FIN, pestrFileName : String;
                        peApli     : TInterApli;
                        pePreview  : Boolean);

implementation
{$R *.DFM}


function ArmaQuery(  peCVE_MONEDA, peID_ACREDITADO, peID_CREDITO,
                     peID_EMPRESA, peID_SUCURSAL : Integer;
                     peSIT_CREDITO, peF_INI, peF_FIN : String; peApli : TInterApli ) : String;
var vlstrSQL : String;
begin
 vlstrSQL :=
              '  SELECT R.*,'+coCRLF+
              '         ROUND(R.ADEUDOTOTAL * R.PCT_GTIA_LIQ / 100, 2)    AS IMP_PCT_LIQ,'+coCRLF+
              '         ROUND(R.ADEUDOTOTAL * R.PCT_GTIA_FEGA_EF / 100,2) AS IMP_PCT_FEG,'+coCRLF+
              '         ( ROUND(R.ADEUDOTOTAL * R.PCT_GTIA_FEGA_EF / 100,2) +'+coCRLF+
              '           R.IMP_GTIA_LIQ + R.IMP_GTIA_OTR ) AS IMP_GTIA_TOT,'+coCRLF+
              '         ( ROUND(R.ADEUDOTOTAL * R.PCT_GTIA_FEGA_EF / 100,2) +'+coCRLF+
              '           R.IMP_GTIA_LIQ + R.IMP_GTIA_OTR ) - R.ADEUDOTOTAL AS IMP_GTIA_SOB'+coCRLF+
              '  FROM ('+coCRLF+
              '         SELECT GARANTIAS.*,'+coCRLF+
              '                SALDOS.ADEUDOVENCIDO,'+coCRLF+
              '                SALDOS.ADEUDOVIGENTE,'+coCRLF+
              '                SALDOS.ADEUDOVENCIDO + SALDOS.ADEUDOVIGENTE AS ADEUDOTOTAL'+coCRLF+
              '         FROM '+coCRLF+
              '              -- Inicio de Query para GARANTIAS'+coCRLF+
              '              ( SELECT '+coCRLF+
              '                       CTO.CVE_MONEDA,'+coCRLF+
              '                       M.DESC_MONEDA,'+coCRLF+
              '                       CC.ID_CREDITO,'+coCRLF+
              '                       CC.SIT_CREDITO,'+coCRLF+
              '                       CTO.ID_TITULAR,'+coCRLF+
              '                       CTO.ID_TITULAR AS ID_ACREDITADO,'+coCRLF+
              '                       CTO.ID_EMPRESA,'+coCRLF+
              '                       CTO.ID_ENTIDAD,'+coCRLF+
              '                       SUBSTR(PKGCRCREDITOO1.STP_OBT_NOM_TITULAR(NULL, NULL, CTO.ID_TITULAR),1,250) AS NOM_ACREDITADO,'+coCRLF+
              '                       CC.F_INICIO,'+coCRLF+
              '                       CC.F_VENCIMIENTO,'+coCRLF+
              '                       CC.IMP_CREDITO,'+coCRLF+
              '                       NVL(CGF.PCT_GTIA_LIQ,0) AS PCT_GTIA_LIQ,'+coCRLF+
              '                       NVL(PKGCRCREDITOO1.OBTEQUIVALENCIA( 2, CTO.CVE_MONEDA, CGF.CVE_OPERATIVA, CGF.PCT_GTIA_LIQ'+coCRLF+
              '                                                         ),0) AS PCT_GTIA_FEGA_EF,'+coCRLF+
              '                       NVL(GTIA_LIQ_DISP.IMP_VALUACION,0) AS IMP_GTIA_LIQ,'+coCRLF+
              '                       SUBSTR(GTIA_OTR_DISP.TX_COMENTARIO,1,250) AS TX_COMENTARIO,'+coCRLF+
              '                       NVL(GTIA_OTR_DISP.IMP_VALUACION,0) AS IMP_GTIA_OTR'+coCRLF+
              '               FROM CR_CREDITO       CC,'+coCRLF+
              '                    CR_CONTRATO      CCT,'+coCRLF+
              '                    CR_PRODUCTO      CPR,'+coCRLF+
              '                    CONTRATO         CTO,'+coCRLF+
              '                    MONEDA           M,'+coCRLF+
              '                    CR_GA_FIRA_CTO   CGF,'+coCRLF+
              '       -------------------- ON Disposiciones con Gtia. Real Líquida ---------------------'+coCRLF+
              '                    ( SELECT GTIA_LIQ.ID_CREDITO, SUM(IMP_VALUACION) AS IMP_VALUACION'+coCRLF+
              '                      FROM ( -- Obtiene todo lo que se encuentra Garantizado en Pagarés'+coCRLF+
              '                             SELECT CRPD.ID_CREDITO,'+coCRLF+
              '                                    IP.IMP_NETO_VTO AS IMP_VALUACION'+coCRLF+
              '                             FROM ( SELECT ID_CREDITO, ID_CONTRATO, ID_PAGARE FROM CR_REL_PAG_DISP'+coCRLF+
              '                                    WHERE SIT_REL_PAG_DISP = ''AC'''+coCRLF+
              '                                  ) CRPD, -- Vínculos Activos de Pagaré-Disposición'+coCRLF+
              '                                  ( SELECT IP.ID_CONTRATO, IP.ID_PAGARE, IP.IMP_NETO_VTO'+coCRLF+
              '                                    FROM INV_PAGARE IP,'+coCRLF+
              '                                         ( SELECT ID_EMPRESA_PRLV, ID_SUCURSAL_PRLV FROM CR_PARAMETRO'+coCRLF+
              '                                           WHERE CVE_PARAMETRO = ''CRE'''+coCRLF+
              '                                         ) CP -- Parametros de PRLV'+coCRLF+
              '                                    WHERE IP.ID_EMPRESA     = CP.ID_EMPRESA_PRLV'+coCRLF+
              '                                      AND IP.ID_SUCURSAL    = CP.ID_SUCURSAL_PRLV'+coCRLF+
              '                                      AND IP.CVE_SIT_PAGARE = ''AC'''+coCRLF+
              '                                  ) IP'+coCRLF+
              '                             WHERE IP.ID_CONTRATO = CRPD.ID_CONTRATO'+coCRLF+
              '                               AND IP.ID_PAGARE   = CRPD.ID_PAGARE'+coCRLF+
              '                            UNION ALL'+coCRLF+
              '                             -- Obtiene todo lo que se encuentra Garantizado en Caución Bursátil'+coCRLF+
              '                             SELECT SDCR.ID_REFERENCIA,'+coCRLF+
              '                                    ROUND( NVL(PKGFUNPROCCORP.PRECIOMERCADO(PKGCRACTUALIZA.STPD000,'+coCRLF+
              '                                    SDCR.EMISORA, SDCR.SERIE, SDCR.TIPO_VALOR),0) * SDCR.NUM_TITULOS_VIRT, 2) AS IMP_VALUACION'+coCRLF+
              '                             FROM ( SELECT ID_CONTRATO, ID_REFERENCIA, NUM_TITULOS_VIRT,'+coCRLF+
              '                                           EMISORA, SERIE, TIPO_VALOR'+coCRLF+
              '                                    FROM SB_DET_CART_REF'+coCRLF+
              '                                    WHERE CVE_DIA_LIQUIDA = ''D000'''+coCRLF+
              '                                      AND CVE_TIP_POSIC = ''GTCR'''+coCRLF+
              '                                      AND NUM_TITULOS_VIRT > 0'+coCRLF+
              '                                  ) SDCR,'+coCRLF+
              '                                  ( SELECT GPE.ID_CONTRATO, GPE.ID_CTO_EXTERNO, GPE.EMISORA,'+coCRLF+
              '                                           GPE.SERIE, GPE.TIPO_VALOR'+coCRLF+
              '                                    FROM GAR_PROP_EMIS GPE,'+coCRLF+
              '                                         CR_CREDITO CC'+coCRLF+
              '                                    WHERE GPE.ID_CTO_EXTERNO = CC.ID_CREDITO'+coCRLF+
              '                                  ) GPE'+coCRLF+
              '                             WHERE SDCR.ID_CONTRATO   = GPE.ID_CONTRATO'+coCRLF+
              '                               AND SDCR.ID_REFERENCIA = GPE.ID_CTO_EXTERNO'+coCRLF+
              '                               AND SDCR.EMISORA       = GPE.EMISORA'+coCRLF+
              '                               AND SDCR.SERIE         = GPE.SERIE'+coCRLF+
              '                               AND SDCR.TIPO_VALOR = GPE.TIPO_VALOR'+coCRLF+
              '                           ) GTIA_LIQ'+coCRLF+
              '                      GROUP BY GTIA_LIQ.ID_CREDITO'+coCRLF+
              '                    ) GTIA_LIQ_DISP,'+coCRLF+
              '                    -------------------- OFF Disposiciones con Gtia. Real Líquida ---------------------'+coCRLF+
              '                    -------------------- ON Disposiciones con Garantía -------------------------------'+coCRLF+
              '                    ( SELECT CGDR.ID_DISPOSICION,'+coCRLF+
              '                             TX_COMENTARIO,'+coCRLF+
              '                             NVL(CGDR.IMP_GARANTIA,0) AS IMP_VALUACION'+coCRLF+
              '                      FROM ( SELECT CVE_GTIA_LIQ FROM CR_PARAM_AGRO'+coCRLF+
              '                             WHERE CVE_PARAMETRO = ''CRE'''+coCRLF+
              '                           ) CPA, -- Parametros de configuración de ICRE'+coCRLF+
              '                           ( SELECT ID_SOLICITUD, CVE_GARANTIA, VALOR_PONDERADO, TX_COMENTARIO FROM CR_GA_REGISTRO'+coCRLF+
              '                             WHERE SIT_REG_GARANTIA = ''AC'''+coCRLF+
              '                           ) CGR,'+coCRLF+
              '                           ( SELECT ID_REG_SOL_GAR, ID_DISPOSICION, IMP_GARANTIA FROM CR_GA_DIS_GAR'+coCRLF+
              '                             WHERE SIT_REL_DIS_GAR = ''AC'''+coCRLF+
              '                           ) CGDR'+coCRLF+
              '                      WHERE CGR.CVE_GARANTIA <> CPA.CVE_GTIA_LIQ'+coCRLF+
              '                        AND CGR.ID_SOLICITUD = CGDR.ID_REG_SOL_GAR'+coCRLF+
              '                    ) GTIA_OTR_DISP'+coCRLF+
              '                    -------------------- OFF Disposiciones con Garantía -------------------------------'+coCRLF+
              '               WHERE CTO.ID_EMPRESA                 = '+IntToStr(peID_EMPRESA)+coCRLF;
   If (peID_CREDITO > 0) Then
    vlstrSQL := vlstrSQL + '                 AND CC.ID_CREDITO = '+IntToStr(peID_CREDITO)+coCRLF;

 vlstrSQL := vlstrSQL +
              '                 AND CPR.CVE_PRODUCTO_CRE           IN ( SELECT CVE_PRODUCTO_CRE FROM CR_GA_REL_PRO_GA'+coCRLF+
              '                                                         WHERE SIT_REL_PRO_GAR = ''AC'' GROUP BY CVE_PRODUCTO_CRE)'+coCRLF;
   If (Trim(peSIT_CREDITO) <> '') Then
    vlstrSQL := vlstrSQL + '                 AND CC.SIT_CREDITO = '+SQLStr(peSIT_CREDITO)+coCRLF;

 vlstrSQL := vlstrSQL +
              '                 AND CGF.SIT_GA_FIRA                = ''AC'''+coCRLF+
              '                 AND CC.ID_CONTRATO                 = CTO.ID_CONTRATO'+coCRLF+
              '                 AND CC.ID_CONTRATO                 = CCT.ID_CONTRATO'+coCRLF+
              '                 AND CC.FOL_CONTRATO                = CCT.FOL_CONTRATO'+coCRLF+
              '                 AND CCT.CVE_PRODUCTO_CRE           = CPR.CVE_PRODUCTO_CRE'+coCRLF+
              '                 AND CGF.ID_CONTRATO(+)             = CC.ID_CONTRATO'+coCRLF+
              '                 AND CGF.CVE_OPERATIVA(+)           = CC.CVE_OPERATIVA'+coCRLF+
              '                 AND GTIA_LIQ_DISP.ID_CREDITO(+)    = CC.ID_CREDITO'+coCRLF+
              '                 AND GTIA_OTR_DISP.ID_DISPOSICION(+)= CC.ID_CREDITO'+coCRLF+
              '                 AND CTO.CVE_MONEDA                 = M.CVE_MONEDA'+coCRLF+
              '              ) GARANTIAS,'+coCRLF+
              '             -- Inicio de Query para SALDOS'+coCRLF+
              '              ('+coCRLF+
              '                 SELECT  CC.ID_CREDITO,'+coCRLF+
              '                         NVL(CC.SDO_INSOLUTO,0)  AS SDO_INSOLUTO,'+coCRLF+
              '                         -- SALDOS VIGENTES'+coCRLF+
              '                         NVL(CC.SDO_VIG_TOTAL,0) +'+coCRLF+
              '                         --       Interés Vigente'+coCRLF+
              '                        ( SELECT NVL(SUM(IMP_INTERES + IMP_IVA ),0)'+coCRLF+
              '                          FROM CR_INTERES'+coCRLF+
              '                          WHERE ' + SQLFecha(peApli.DameFechaEmpresa)+' BETWEEN F_VENCIMIENTO - (PLAZO-1)'+coCRLF+
              '                                                                         AND F_VENCIMIENTO'+coCRLF+
              '                          AND ID_CREDITO = CC.ID_CREDITO'+coCRLF+
              '                        ) -'+coCRLF+
              '                        -- INTERES PAGADO'+coCRLF+
              '                        ( SELECT NVL(SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL,' + SQLFecha(peApli.DameFechaEmpresa)+',''V''),0)),0)+'+coCRLF+
              '                                 NVL(SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPIVA'',ID_CREDITO,NUM_PERIODO,NULL,' + SQLFecha(peApli.DameFechaEmpresa)+',''V''),0)),0)'+coCRLF+
              '                          FROM CR_INTERES'+coCRLF+
              '                          WHERE ' + SQLFecha(peApli.DameFechaEmpresa)+' BETWEEN F_VENCIMIENTO - (PLAZO-1)'+coCRLF+
              '                                                                       AND F_VENCIMIENTO'+coCRLF+
              '                            AND ID_CREDITO = CC.ID_CREDITO'+coCRLF+
              '                        ) +'+coCRLF+
              '                        --COMISION VIGENTE'+coCRLF+
              '                        ( SELECT  NVL(SUM(IMP_COMISION) + SUM(IMP_IVA),0)'+coCRLF+
              '                          FROM CR_COMISION'+coCRLF+
              '                          WHERE ' + SQLFecha(peApli.DameFechaEmpresa)+' BETWEEN  F_ALTA AND F_VENCIMIENTO'+coCRLF+
              '                            AND ID_CREDITO = CC.ID_CREDITO'+coCRLF+
              '                        ) -'+coCRLF+
              '                        --COMISION PAGADO'+coCRLF+
              '                        ( SELECT NVL(SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL, ' + SQLFecha(peApli.DameFechaEmpresa)+' ,''V''),0)),0) +'+coCRLF+
              '                                 NVL(SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPIVA'',ID_CREDITO,NUM_PERIODO,NULL, ' + SQLFecha(peApli.DameFechaEmpresa)+' ,''V''),0)),0)'+coCRLF+
              '                          FROM CR_COMISION'+coCRLF+
              '                          WHERE ' + SQLFecha(peApli.DameFechaEmpresa)+' BETWEEN  F_ALTA AND F_VENCIMIENTO'+coCRLF+
              '                            AND ID_CREDITO = CC.ID_CREDITO'+coCRLF+
              '                        ) AS ADEUDOVIGENTE,'+coCRLF+
              '                        --SALDOS VENCIDOS'+coCRLF+
              '                        ( SELECT NVL(SUM(IMP_CAPITAL - NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL, ' + SQLFecha(peApli.DameFechaEmpresa)+' ,''V''),0)),0) +'+coCRLF+
              '                                 NVL(SUM(PKGCRPERIODO.FUNOBTENMORA(1,''V'',ID_CREDITO ,NUM_PERIODO ,NULL,NULL, ' + SQLFecha(peApli.DameFechaEmpresa)+' ,NULL)),0) +'+coCRLF+
              '                                 NVL(SUM(PKGCRPERIODO.FUNOBTENMORA(1,''F'',ID_CREDITO ,NUM_PERIODO ,NULL,NULL, ' + SQLFecha(peApli.DameFechaEmpresa)+' ,NULL)),0) CAP_VDO'+coCRLF+
              '                          FROM CR_CAPITAL'+coCRLF+
              '                          WHERE ' + SQLFecha(peApli.DameFechaEmpresa)+' > F_VENCIMIENTO'+coCRLF+
              '                            AND IMP_CAPITAL - IMP_PAGADO > 0'+coCRLF+
              '                            AND ID_CREDITO = CC.ID_CREDITO'+coCRLF+
              '                        ) +'+coCRLF+
              '                        --       Financiamiento Vencido'+coCRLF+
              '                        ( SELECT NVL(SUM(IMP_FINAN_ADIC - NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL, ' + SQLFecha(peApli.DameFechaEmpresa)+' ,''V''),0)),0)+'+coCRLF+
              '                              NVL(SUM(PKGCRPERIODO.FUNOBTENMORA(3,''V'',ID_CREDITO ,NUM_PERIODO ,NULL,NULL, ' + SQLFecha(peApli.DameFechaEmpresa)+' ,NULL)),0)+'+coCRLF+
              '                              NVL(SUM(PKGCRPERIODO.FUNOBTENMORA(3,''F'',ID_CREDITO ,NUM_PERIODO ,NULL,NULL, ' + SQLFecha(peApli.DameFechaEmpresa)+' ,NULL)),0)'+coCRLF+
              '                          FROM CR_FINAN_ADIC'+coCRLF+
              '                          WHERE ' + SQLFecha(peApli.DameFechaEmpresa)+' > F_VENCIMIENTO'+coCRLF+
              '                            AND IMP_FINAN_ADIC - IMP_PAGADO > 0'+coCRLF+
              '                            AND ID_CREDITO = CC.ID_CREDITO'+coCRLF+
              '                        ) +'+coCRLF+
              '                        --       Interés Vencido'+coCRLF+
              '                        ( SELECT NVL(SUM(IMP_INTERES - NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL, ' + SQLFecha(peApli.DameFechaEmpresa)+' ,''V''),0)),0) +'+coCRLF+
              '                                 NVL(SUM(IMP_IVA - NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPIVA'',ID_CREDITO,NUM_PERIODO,NULL, ' + SQLFecha(peApli.DameFechaEmpresa)+' ,''V''),0)),0)'+coCRLF+
              '                          FROM CR_INTERES'+coCRLF+
              '                          WHERE ' + SQLFecha(peApli.DameFechaEmpresa)+' > F_VENCIMIENTO'+coCRLF+
              '                            AND IMP_INTERES - IMP_PAGADO > 0'+coCRLF+
              '                            AND ID_CREDITO = CC.ID_CREDITO'+coCRLF+
              '                        ) +'+coCRLF+
              '                        --       Comisión Vencido'+coCRLF+
              '                        ( SELECT NVL(SUM(IMP_COMISION - NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL, ' + SQLFecha(peApli.DameFechaEmpresa)+' ,''V''),0)),0)+'+coCRLF+
              '                                 NVL(SUM(IMP_IVA - NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPIVA'',ID_CREDITO,NUM_PERIODO,NULL, ' + SQLFecha(peApli.DameFechaEmpresa)+' ,''V''),0)),0)+'+coCRLF+
              '                                 NVL(SUM(PKGCRPERIODO.FUNOBTENMORA(2,''V'',ID_CREDITO ,NUM_PERIODO ,NULL,NULL, ' + SQLFecha(peApli.DameFechaEmpresa)+' ,NULL)),0)+'+coCRLF+
              '                                 NVL(SUM(PKGCRPERIODO.FUNOBTENMORA(2,''F'',ID_CREDITO ,NUM_PERIODO ,NULL,NULL, ' + SQLFecha(peApli.DameFechaEmpresa)+' ,NULL)),0)'+coCRLF+
              '                          FROM CR_COMISION'+coCRLF+
              '                          WHERE ' + SQLFecha(peApli.DameFechaEmpresa)+' > F_VENCIMIENTO'+coCRLF+
              '                            AND IMP_COMISION - IMP_PAGADO > 0'+coCRLF+
              '                            AND ID_CREDITO = CC.ID_CREDITO'+coCRLF+
              '                        ) AS ADEUDOVENCIDO'+coCRLF+
              '                 FROM CR_CREDITO       CC,'+coCRLF+
              '                      CR_CONTRATO      CCT,'+coCRLF+
              '                      CR_PRODUCTO      CPR,'+coCRLF+
              '                      CONTRATO         CTO'+coCRLF+
              '               WHERE CTO.ID_EMPRESA                 = '+IntToStr(peID_EMPRESA)+coCRLF;

   If (Trim(peSIT_CREDITO) <> '') Then
    vlstrSQL := vlstrSQL + '                 AND CC.SIT_CREDITO = '+SQLStr(peSIT_CREDITO)+coCRLF;

 vlstrSQL := vlstrSQL +
              '                 AND CPR.CVE_PRODUCTO_CRE           IN ( SELECT CVE_PRODUCTO_CRE FROM CR_GA_REL_PRO_GA'+ coCRLF +
              '                                                         WHERE SIT_REL_PRO_GAR = ''AC'' GROUP BY CVE_PRODUCTO_CRE)' + coCRLF;

   If (Trim(peSIT_CREDITO) <> '') Then
    vlstrSQL := vlstrSQL + '                 AND CC.SIT_CREDITO = '+SQLStr(peSIT_CREDITO)+coCRLF;

 vlstrSQL := vlstrSQL +
              '                 AND CC.ID_CONTRATO                 = CTO.ID_CONTRATO'+coCRLF+
              '                 AND CC.ID_CONTRATO                 = CCT.ID_CONTRATO'+coCRLF+
              '                 AND CC.FOL_CONTRATO                = CCT.FOL_CONTRATO'+coCRLF+
              '                 AND CCT.CVE_PRODUCTO_CRE           = CPR.CVE_PRODUCTO_CRE'+coCRLF;
   If (peID_CREDITO > 0) Then
    vlstrSQL := vlstrSQL + '                            AND CC.ID_CREDITO = '+IntToStr(peID_CREDITO)+coCRLF;

 vlstrSQL := vlstrSQL +

              '              ) SALDOS'+coCRLF+
              '          WHERE SALDOS.ID_CREDITO = GARANTIAS.ID_CREDITO'+coCRLF+
              '       ) R'+coCRLF+
              ' WHERE 1 = 1 '+coCRLF ;

   If (peCVE_MONEDA > 0) Then
    vlstrSQL := vlstrSQL + '            AND R.CVE_MONEDA = '+IntToStr(peCVE_MONEDA)+coCRLF;

   If (peID_ACREDITADO > 0) Then
    vlstrSQL := vlstrSQL + '            AND R.ID_ACREDITADO = '+IntToStr(peID_ACREDITADO)+coCRLF;

   If (peID_CREDITO > 0) Then
    vlstrSQL := vlstrSQL + '            AND R.ID_CREDITO = '+IntToStr(peID_CREDITO)+coCRLF;

   If (peID_EMPRESA > 0) Then
    vlstrSQL := vlstrSQL + '            AND R.ID_EMPRESA = '+IntToStr(peID_EMPRESA)+coCRLF;

   { No Aplica
   If (peID_SUCURSAL > 0) Then
    vlstrSQL := vlstrSQL + '            AND R.ID_ENTIDAD = '+IntToStr(peID_SUCURSAL)+coCRLF;
   }

   If (Trim(peSIT_CREDITO) <> '') Then
    vlstrSQL := vlstrSQL + '            AND R.SIT_CREDITO = '+SQLStr(peSIT_CREDITO)+coCRLF;

   If (Trim(peF_INI) <> '') And (Trim(peF_FIN) <> '') Then
          vlstrSQL := vlstrSQL + '            AND R.F_INICIO BETWEEN '+SQLFecha(StrToDate(peF_INI))+' AND '+SQLFecha(StrToDate(peF_FIN))+coCRLF
   Else If  (Trim(peF_INI) <> '') Then
          vlstrSQL := vlstrSQL + '            AND R.F_INICIO >= '+SQLFecha(StrToDate(peF_INI))+coCRLF;

  vlstrSQL := vlstrSQL + '  ORDER BY R.NOM_ACREDITADO, R.ID_TITULAR, R.ID_CREDITO'+coCRLF;
  Result := vlstrSQL;
end;

procedure RepGlbGtias(  peCVE_MONEDA, peID_ACREDITADO, peID_CREDITO,
                        peID_EMPRESA, peID_SUCURSAL : Integer;
                        peSIT_CREDITO, peF_INI, peF_FIN, pestrFileName : String;
                        peApli     : TInterApli;
                        pePreview  : Boolean);
var QrGlbCr : TQrGlbCr;
    QrPreview : TIntQRPreview;
    vlstrSQL : String;
Begin
  QrGlbCr   := TQrGlbCr.Create(Nil);
  QrPreview := TIntQRPreview.CreatePreview(Application, QrGlbCr);
  If Assigned (QrGlbCr) And Assigned(QrPreview) Then
   With QrGlbCr Do
    Try
      vgApli := peApli;
      QRInterEncabezado1.Apli       := peApli;
      QRInterEncabezado1.IdEmpresa  := peApli.IdEmpresa;
      QRInterEncabezado1.NomReporte :='IntMQrGlbCr';
      QRInterEncabezado1.Titulo1    :='Garantías Global de Créditos al Sector Agropecuario';

      QryRepGlobal.DatabaseName := peApli.DatabaseName;
      QryRepGlobal.SessionName  := peApli.SessionName;
      vlstrSQL := ArmaQuery( peCVE_MONEDA, peID_ACREDITADO, peID_CREDITO,
                             peID_EMPRESA, peID_SUCURSAL,
                             peSIT_CREDITO, peF_INI, peF_FIN, peApli );

      QryRepGlobal.SQL.Clear;
      QryRepGlobal.SQL.Add(vlstrSQL);
      QryRepGlobal.SQL.SaveToFile('C:\GARANTIAS.SQL');
      QryRepGlobal.Open;

      // Si no trajo datos el Query, entonces...
      If QryRepGlobal.IsEmpty Then
        ShowMessage(CERROR_NOEXISTEN)
      Else
        Begin
          If pePreview Then
             QrGlbCr.Preview
          Else
             QrGlbCr.Print;
        End;

      QryRepGlobal.Close; // Únicamente utilizado para pruebas
    Finally
      If Assigned(QrGlbCr) Then QrGlbCr.Free;
      If Assigned(QrPreview) Then QrPreview.Free;
    End;

  {
   VLTitulo := '';
   QrGlbCr:=TQrGlbCr.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrGlbCr);
   Try
      bGenArch:= False;
      sArchivo:= sNbrArch;
      QrGlbCr.QRInterEncabezado1.Apli:=pAPli;
      QrGlbCr.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrGlbCr.QRInterEncabezado1.NomReporte:='IntMQrGlbCr';
      QrGlbCr.QRInterEncabezado1.Titulo1:='Garantías Global de Créditos al Sector Agropecuario';

      QrGlbCr.stp.DatabaseName := pApli.DataBaseName;
      QrGlbCr.stp.SessionName := pApli.SessionName;
      QrGlbCr.stp.Active:=False;
      QrGlbCr.stp.Params.Clear;
      QrGlbCr.stp.StoredProcName:='PKGCRDOCUMENTACION.STP_REP_GLOB_GAR';
      QrGlbCr.stp.Params.CreateParam(ftFloat,'PE_MONEDA',ptInput);
      QrGlbCr.stp.Params.CreateParam(ftFloat,'PE_ACREDITADO',ptInput);
      QrGlbCr.stp.Params.CreateParam(ftFloat,'PE_ID_CREDITO',ptInput);
      QrGlbCr.stp.Params.CreateParam(ftFloat,'PE_SOBRANTE',ptInput);
      QrGlbCr.stp.Params.CreateParam(ftDate,'PE_F_INICIO',ptInput);
      QrGlbCr.stp.Params.CreateParam(ftDate,'PE_F_FIN',ptInput);
      QrGlbCr.stp.Params.CreateParam(ftDate,'PE_ID_EMPRESA',ptInput);
      QrGlbCr.stp.Params.CreateParam(ftCursor,'PCURSOR',ptInputOutput);

      QrGlbCr.stp.ParamByName('PE_MONEDA').AsString := sMoneda;
      QrGlbCr.stp.ParamByName('PE_ACREDITADO').AsString := sAcreditado;
      QrGlbCr.stp.ParamByName('PE_ID_CREDITO').AsString := sDisposicion;
      QrGlbCr.stp.ParamByName('PE_SOBRANTE').AsString := sSobrante;
      QrGlbCr.stp.ParamByName('PE_F_INICIO').AsString := sFInicio;
      QrGlbCr.stp.ParamByName('PE_F_FIN').AsString := sFFin;
      QrGlbCr.stp.ParamByName('PE_ID_EMPRESA').AsString := sEmpresa;
      QrGlbCr.stp.Open;

      If (Trim(sMoneda)<>'') Then
          VLTitulo := VLTitulo + ' Por Moneda';
      If (Trim(sAcreditado)<>'') Then
          VLTitulo := VLTitulo + ' Por Acreditado';
      If (Trim(sDisposicion)<>'') Then
          VLTitulo := VLTitulo + ' Por Disposición';
      If (Trim(sSobrante)<>'') Then
          VLTitulo := VLTitulo + ' Por Sobrante';
      If (Trim(sFInicio)<>'')and(Trim(sFFin)<>'') Then
          VLTitulo := VLTitulo + ' Por Fechas';
      QrGlbCr.QRInterEncabezado1.Titulo2 := VLTitulo;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrGlbCr.QRInterEncabezado1.Titulo1);
         Writeln(F, QrGlbCr.QRInterEncabezado1.Titulo2);
         Writeln(F,  #09 );
         Writeln(F,#09#09#09#09#09#09#09#09 +
             'GARANTIA FEGA'+ #09#09 +
             'GARANTIA LIQUIDA'+ #09#09#09 +
             'OTRAS GARANTIAS');

         Writeln(F,
             'Moneda' + #09#09 +
             'No. Crédito' +  #09+
             'Acreditado' +  #09 +
             'Fecha de inicio'+  #09 +
             'Fecha de vencimiento' +  #09 +
             'Monto original' +  #09 +
             'Saldo insoluto' +#09 +
             '%'+ #09+
             'Importe garantizado'+ #09 +
             '%'+#09 +
             'No.Cto. ICB'+ #09 +
             'Importe garantizado'+ #09 +
             'Descripción'+ #09 +
             'Importe'+ #09 +
             'Total garantías'+ #09 +
             'Sobrante y/o faltante');
         Writeln(F, '');
      End;
      If pPreview Then
         QrGlbCr.Preview
      Else
         QrGlbCr.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrGlbCr.free;
      If Assigned(Preview) Then Preview.Free;
   End;
   }
End;

procedure TQrGlbCr.qrDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  With QryRepGlobal Do
    Begin
    // Acumulado de Importe de Otras Garantías  
    vgGrpCred_IMP_GTIA_OTR := vgGrpCred_IMP_GTIA_OTR + FieldByname('IMP_GTIA_OTR').AsFloat;
    vgGrpAcre_IMP_GTIA_OTR := vgGrpAcre_IMP_GTIA_OTR + FieldByname('IMP_GTIA_OTR').AsFloat;
    vgGrpMone_IMP_GTIA_OTR := vgGrpMone_IMP_GTIA_OTR + FieldByname('IMP_GTIA_OTR').AsFloat;

    PrintBand := (FieldByname('TX_COMENTARIO').AsString <> '')
                  And (vgGrpCred_COUNT_OTR_GTIA > 1);
    vgbPrintFootCredito := PrintBand;
    Inc(vgGrpCred_COUNT_OTR_GTIA);
    End;
  {
   If sArchivo <>'' Then Begin
      If stp.FieldByName('F_ALTA').AsDateTime > 0 Then
         sFAlta:= FormatDateTime('dd/mm/yyyy',stp.FieldByName('F_ALTA').AsDateTime);
      If stp.FieldByName('F_VENCIMIENTO').AsDateTime > 0 Then
         sFVen:= FormatDateTime('dd/mm/yyyy',stp.FieldByName('F_VENCIMIENTO').AsDateTime);

      Writeln(F,
                 stp.FieldByName('CVE_MONEDA').AsString + #09 +
                 stp.FieldByName('DESC_MONEDA').AsString + #09 +
                 stp.FieldByName('ID_CREDITO').AsString + #09 +
                 stp.FieldByName('NOMBRE').AsString + #09 +
                 sFAlta + #09 +
                 sFVen + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('IMP_CREDITO').AsFloat)+ #09 +
                 FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('SDO_INSOLUTO').AsFloat) + #09 +
                 FormatFloat('###,###,###,##0.0000',stp.FieldByName('PCT_GTIA_FEGA_EF').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('IMP_GAR_FEGA').AsFloat) + #09 +
                 FormatFloat('###,###,###,##0.0000',stp.FieldByName('PCT_GTIA_LIQ').AsFloat) + #09 +
                 stp.FieldByName('CONTRATO').AsString + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('IMP_GAR_LIQ').AsFloat) + #09 +
                 stp.FieldByName('DESC_GAR').AsString + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('VALOR_PONDERADO').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('TOTAL_GAR').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',stp.FieldByName('SOBRANTE').AsFloat) );
   End;
   }
end;

{
procedure TQrGlbCr.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F,  'TOTALES' + #09#09#09#09#09#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr7.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr8.Value.dblResult)+#09+ #09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr9.Value.dblResult)+#09+ #09 + #09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr10.Value.dblResult)+#09+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr12.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr13.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr14.Value.dblResult));
   End;
   If stp.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

}

procedure TQrGlbCr.qrGpoMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  // Totales por Moneda
   vgGrpMone_IMP_CREDITO  := 0;
   vgGrpMone_ADEUDOVIGENTE  := 0;
   vgGrpMone_ADEUDOVENCIDO  := 0;
   vgGrpMone_ADEUDOTOTAL  := 0;
   vgGrpMone_IMP_PCT_FEG  := 0;
   vgGrpMone_IMP_PCT_LIQ  := 0;
   vgGrpMone_IMP_GTIA_LIQ := 0;
   vgGrpMone_TOTAL_DISP   := 0;
   vgGrpMone_IMP_GTIA_OTR := 0;
end;


procedure TQrGlbCr.qrGpoAcreditadoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  // Totales por Acreditado
  With QryRepGlobal Do
   Begin
   vgGrpAcre_IMP_CREDITO  := 0;
   vgGrpAcre_ADEUDOVIGENTE  := 0;
   vgGrpAcre_ADEUDOVENCIDO  := 0;
   vgGrpAcre_ADEUDOTOTAL  := 0;
   vgGrpAcre_IMP_PCT_FEG  := 0;
   vgGrpAcre_IMP_PCT_LIQ  := 0;
   vgGrpAcre_IMP_GTIA_LIQ := 0;
   vgGrpAcre_IMP_GTIA_OTR := 0;
   vgGrpAcre_TOTAL_DISP   := 0;
   End;
end;

procedure TQrGlbCr.qrGpoCreditoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 With QryRepGlobal Do
  Begin
  vgbPrintFootCredito := False;
  // Totales por Acreditado
  vgGrpAcre_IMP_CREDITO  := vgGrpAcre_IMP_CREDITO  + FieldByName('IMP_CREDITO').AsFloat;
  vgGrpAcre_ADEUDOVIGENTE  := vgGrpAcre_ADEUDOVIGENTE  + FieldByName('ADEUDOVIGENTE').AsFloat;
  vgGrpAcre_ADEUDOVENCIDO  := vgGrpAcre_ADEUDOVENCIDO  + FieldByName('ADEUDOVENCIDO').AsFloat;
  vgGrpAcre_ADEUDOTOTAL    := vgGrpAcre_ADEUDOTOTAL  + FieldByName('ADEUDOTOTAL').AsFloat;
  vgGrpAcre_IMP_PCT_FEG    := vgGrpAcre_IMP_PCT_FEG  + FieldByName('IMP_PCT_FEG').AsFloat;
  vgGrpAcre_IMP_PCT_LIQ    := vgGrpAcre_IMP_PCT_LIQ  + FieldByName('IMP_PCT_LIQ').AsFloat;
  vgGrpAcre_IMP_GTIA_LIQ   := vgGrpAcre_IMP_GTIA_LIQ + FieldByName('IMP_GTIA_LIQ').AsFloat;
  Inc(vgGrpAcre_TOTAL_DISP);

  // Totales por Moneda
  vgGrpMone_IMP_CREDITO    := vgGrpMone_IMP_CREDITO  + FieldByName('IMP_CREDITO').AsFloat;
  vgGrpMone_ADEUDOVIGENTE  := vgGrpMone_ADEUDOVIGENTE  + FieldByName('ADEUDOVIGENTE').AsFloat;
  vgGrpMone_ADEUDOVENCIDO  := vgGrpMone_ADEUDOVENCIDO  + FieldByName('ADEUDOVENCIDO').AsFloat;
  vgGrpMone_ADEUDOTOTAL    := vgGrpMone_ADEUDOTOTAL  + FieldByName('ADEUDOTOTAL').AsFloat;
  vgGrpMone_IMP_PCT_FEG    := vgGrpMone_IMP_PCT_FEG  + FieldByName('IMP_PCT_FEG').AsFloat;
  vgGrpMone_IMP_PCT_LIQ    := vgGrpMone_IMP_PCT_LIQ  + FieldByName('IMP_PCT_LIQ').AsFloat;
  vgGrpMone_IMP_GTIA_LIQ   := vgGrpMone_IMP_GTIA_LIQ + FieldByName('IMP_GTIA_LIQ').AsFloat;
  Inc(vgGrpMone_TOTAL_DISP);

  vgGrpCred_IMP_GTIA_OTR   := 0;
  vgGrpCred_COUNT_OTR_GTIA := 1;

  qrdbIMP_GTIA_TOT.Font.Color := clWindowText;
  If (FieldByName('TX_COMENTARIO').AsString) <> '' Then
    If (ObtenTotaldeOtrasGtias(FieldByName('ID_CREDITO').AsInteger) > 1) Then
      qrdbIMP_GTIA_TOT.Font.Color := clWhite;
  End;
  qrdbIMP_GTIA_SOB.Font.Color := qrdbIMP_GTIA_TOT.Font.Color;
  qrExprPCT.Font.Color := qrdbIMP_GTIA_TOT.Font.Color;
end;

procedure TQrGlbCr.qrFootAcreditadoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vlAcreIMP_GTIA_SOB : Real;
begin
 With QryRepGlobal Do
  Begin
  qrlblGrpAcre_IMP_CREDITO.Caption   := Format(CFORMAT_DINERO,[vgGrpAcre_IMP_CREDITO]);
  qrlblGrpAcre_ADEUDOVIGENTE.Caption := Format(CFORMAT_DINERO,[vgGrpAcre_ADEUDOVIGENTE]);
  qrlblGrpAcre_ADEUDOVENCIDO.Caption := Format(CFORMAT_DINERO,[vgGrpAcre_ADEUDOVENCIDO]);
  qrlblGrpAcre_ADEUDOTOTAL.Caption   := Format(CFORMAT_DINERO,[vgGrpAcre_ADEUDOTOTAL]);
  qrlblGrpAcre_IMP_PCT_FEG.Caption   := Format(CFORMAT_DINERO,[vgGrpAcre_IMP_PCT_FEG]);
  qrlblGrpAcre_IMP_PCT_LIQ.Caption   := Format(CFORMAT_DINERO,[vgGrpAcre_IMP_PCT_LIQ]);
  qrlblGrpAcre_IMP_GTIA_LIQ.Caption  := Format(CFORMAT_DINERO,[vgGrpAcre_IMP_GTIA_LIQ]);
  qrlblGrpAcre_IMP_GTIA_OTR.Caption  := Format(CFORMAT_DINERO,[vgGrpAcre_IMP_GTIA_OTR]);
  qrlblGrpAcre_TOTAL_DISP.Caption    := IntToStr(vgGrpAcre_TOTAL_DISP);
  qrlblGrpAcre_IMP_GTIA_TOT.Caption  := Format(CFORMAT_DINERO, [vgGrpAcre_IMP_PCT_FEG +
                                                                vgGrpAcre_IMP_GTIA_LIQ +
                                                                vgGrpAcre_IMP_GTIA_OTR]);

                            // Adeudo Total - Total de Garantías
  vlAcreIMP_GTIA_SOB := (vgGrpAcre_IMP_PCT_FEG +
                         vgGrpAcre_IMP_GTIA_LIQ + vgGrpAcre_IMP_GTIA_OTR) - vgGrpAcre_ADEUDOTOTAL;
  qrlblGrpAcre_IMP_GTIA_SOB.Caption := Format(CFORMAT_DINERO,[vlAcreIMP_GTIA_SOB]);
  If (vgGrpAcre_ADEUDOTOTAL > 0) Then
    qrlblGrpAcre_IMP_GTIA_SOB_PCT.Caption := Format('%4.2n', [vlAcreIMP_GTIA_SOB/vgGrpAcre_ADEUDOTOTAL*100])
  Else
    qrlblGrpAcre_IMP_GTIA_SOB_PCT.Caption := '0';
  End;
end;

procedure TQrGlbCr.qrFootMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 With QryRepGlobal Do
  Begin
  qrlblGrpMone_IMP_CREDITO.Caption   := Format(CFORMAT_DINERO,[vgGrpMone_IMP_CREDITO]);
  qrlblGrpMone_ADEUDOVIGENTE.Caption := Format(CFORMAT_DINERO,[vgGrpMone_ADEUDOVIGENTE]);
  qrlblGrpMone_ADEUDOVENCIDO.Caption := Format(CFORMAT_DINERO,[vgGrpMone_ADEUDOVENCIDO]);
  qrlblGrpMone_ADEUDOTOTAL.Caption   := Format(CFORMAT_DINERO,[vgGrpMone_ADEUDOTOTAL]);
  qrlblGrpMone_IMP_PCT_FEG.Caption   := Format(CFORMAT_DINERO,[vgGrpMone_IMP_PCT_FEG]);
  qrlblGrpMone_IMP_PCT_LIQ.Caption   := Format(CFORMAT_DINERO,[vgGrpMone_IMP_PCT_LIQ]);
  qrlblGrpMone_IMP_GTIA_LIQ.Caption  := Format(CFORMAT_DINERO,[vgGrpMone_IMP_GTIA_LIQ]);
  qrlblGrpMone_IMP_GTIA_OTR.Caption  := Format(CFORMAT_DINERO,[vgGrpMone_IMP_GTIA_OTR]);
  qrlblGrpMone_TOTAL_DISP.Caption    := IntToStr(vgGrpMone_TOTAL_DISP);
  qrlblGrpMone_IMP_GTIA_TOT.Caption  := Format(CFORMAT_DINERO,[vgGrpMone_IMP_PCT_FEG + vgGrpMone_IMP_GTIA_LIQ + vgGrpMone_IMP_GTIA_OTR]);
  End;
end;

procedure TQrGlbCr.qrFootCreditoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vlCred_IMP_GTIA_SOB : Real;
begin
  PrintBand := vgbPrintFootCredito;
  With QryRepGlobal Do
    If PrintBand Then
     Begin
     qrlblGrpCred_IMP_GTIA_OTR.Caption  := Format(CFORMAT_DINERO,[vgGrpCred_IMP_GTIA_OTR]);
     qrlblGrpCred_IMP_GTIA_TOT1.Caption  := Format(CFORMAT_DINERO,[vgGrpCred_IMP_GTIA_OTR +
                                                                  FieldByName('IMP_GTIA_LIQ').asFloat  +
                                                                  FieldByName('IMP_PCT_FEG').AsFloat
                                                                 ]);

     vlCred_IMP_GTIA_SOB := ( vgGrpCred_IMP_GTIA_OTR + FieldByName('IMP_GTIA_LIQ').asFloat  +
                              FieldByName('IMP_PCT_FEG').AsFloat ) - FieldByName('ADEUDOTOTAL').asFloat;
                              
     qrlblGrpCred_IMP_GTIA_SOB1.Caption  := Format(CFORMAT_DINERO,[vlCred_IMP_GTIA_SOB]);

     If (FieldByName('ADEUDOTOTAL').asFloat > 0) Then
       qrlblGrpCred_IMP_GTIA_SOB_PCT1.Caption := Format('%4.2n', [vlCred_IMP_GTIA_SOB/FieldByName('ADEUDOTOTAL').asFloat*100])
     Else
       qrlblGrpCred_IMP_GTIA_SOB_PCT1.Caption := '0';
     End;
end;

function TQrGlbCr.ObtenTotaldeOtrasGtias(peID_CREDITO: Integer): Integer;
var vlstrSQL : String;
    vlTotalOtrGtias : Integer;
begin
  vlTotalOtrGtias := 0;
  vlstrSQL :=   '  SELECT COUNT(*) AS TOTAL ' +coCRLF+
                '  FROM CR_GA_DIS_GAR CGDG, ' +coCRLF+
                '       CR_GA_REGISTRO CGR ' +coCRLF+
                '  WHERE CGDG.ID_DISPOSICION = '+IntToStr(peID_CREDITO)+coCRLF+
                '    AND CGDG.SIT_REL_DIS_GAR = ''AC'' ' +coCRLF+
                '    AND CGR.ID_SOLICITUD = CGDG.ID_REG_SOL_GAR ' +coCRLF+
                '    AND CGR.SIT_REG_GARANTIA = ''AC'' ' +coCRLF+
                '    AND CVE_GARANTIA NOT IN ( SELECT CVE_GTIA_LIQ ' +coCRLF+
                '                              FROM CR_PARAM_AGRO ' +coCRLF+
                '                              WHERE CVE_PARAMETRO = ''CRE'') ';
  GetSQLInt(vlstrSQL, vgApli.DatabaseName, vgApli.SessionName, 'TOTAL', vlTotalOtrGtias, False);
  Result := vlTotalOtrGtias;
end;

End.
