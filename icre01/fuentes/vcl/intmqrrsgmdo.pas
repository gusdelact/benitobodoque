unit IntMQrRsgMdo;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre, UnSQL2, Dialogs, ComObj, IntXls;

type
  TQrRsgMdo = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    qrShpAdeudoTotal: TQRShape;
    qrshpCalificadoras: TQRShape;
    qrlblAdeudoTotal: TQRLabel;
    qryRsgMdo: TQuery;
    TitleBand1: TQRBand;
    qrlblCalificadoras: TQRLabel;
    qrlblSdoPromedio: TQRLabel;
    qrShpSdoPromedio: TQRShape;
    qrShpNomCalificadora1: TQRShape;
    qrShpNomCalificadora2: TQRShape;
    qrGrpCVE_MONEDA: TQRGroup;
    qrDetail: TQRBand;
    QRShape1: TQRShape;
    qrdbCVE_MONEDA: TQRDBText;
    qrlbMONEDA: TQRLabel;
    qrdbDESC_MONEDA: TQRDBText;
    SaveDialog: TSaveDialog;
    qrlbNOM_CALIFICADORA1: TQRLabel;
    qrlbNOM_CALIFICADORA2: TQRLabel;
    qrGrpFootCVE_SIT_CARTERA: TQRBand;
    qrGrpID_ACREDITADO: TQRGroup;
    qrGrpCVE_SIT_CARTERA: TQRGroup;
    qrGrpFootID_ACREDITADO: TQRBand;
    qrGrpFootCVE_MONEDA: TQRBand;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRShape6: TQRShape;
    QRLabel6: TQRLabel;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRLabel9: TQRLabel;
    QRShape10: TQRShape;
    QRLabel10: TQRLabel;
    QRShape11: TQRShape;
    QRLabel11: TQRLabel;
    QRShape12: TQRShape;
    QRLabel12: TQRLabel;
    QRShape13: TQRShape;
    QRLabel13: TQRLabel;
    QRShape17: TQRShape;
    QRLabel17: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    qrdbSDO_PROM_MES_ACT: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRShape18: TQRShape;
    QRShape20: TQRShape;
    QRLabel20: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRShape19: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRShape14: TQRShape;
    QRLabel14: TQRLabel;
    QRShape15: TQRShape;
    QRLabel15: TQRLabel;
    QRShape16: TQRShape;
    QRLabel16: TQRLabel;
    QRShape21: TQRShape;
    QRLabel21: TQRLabel;
    QRShape22: TQRShape;
    QRLabel22: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExprUsoCapital: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRDBText19: TQRDBText;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    QRExpFactCapitalizacion: TQRExpr;
    QRExpr33: TQRExpr;
    QRExpr34: TQRExpr;
    QRExpr35: TQRExpr;
    qryRsgMdoID_EMPRESA: TFloatField;
    qryRsgMdoCVE_MONEDA: TFloatField;
    qryRsgMdoDESC_MONEDA: TStringField;
    qryRsgMdoCVE_SIT_CARTERA: TStringField;
    qryRsgMdoID_ACREDITADO: TFloatField;
    qryRsgMdoNOM_ACREDITADO: TStringField;
    qryRsgMdoID_CONTRATO: TFloatField;
    qryRsgMdoID_CREDITO: TFloatField;
    qryRsgMdoF_INICIO: TDateTimeField;
    qryRsgMdoF_VENCIMIENTO: TDateTimeField;
    qryRsgMdoF_TRASPASO_VENC: TDateTimeField;
    qryRsgMdoSDO_VIG_TOTAL: TFloatField;
    qryRsgMdoIMP_INTERES_ACUM: TFloatField;
    qryRsgMdoDESC_SIT_CARTERA: TStringField;
    qryRsgMdoSDO_PROMEDIO: TFloatField;
    qryRsgMdoPCT_GTIA_LIQ_ORIG: TFloatField;
    qryRsgMdoPCT_GTIA_FEGA_ORIG: TFloatField;
    qryRsgMdoPCT_RIESGO_FEGA: TFloatField;
    qryRsgMdoPCT_RIESGO_OTR: TFloatField;
    qryRsgMdoPCT_GTIA_LIQ: TFloatField;
    qryRsgMdoPCT_GTIA_FEGA: TFloatField;
    qryRsgMdoPCT_GTIA_OTR: TFloatField;
    qryRsgMdoPCT_RIESGO_LIQ: TFloatField;
    qryRsgMdoSDO_PROM_LIQ: TFloatField;
    qryRsgMdoSDO_PROM_FEGA: TFloatField;
    qryRsgMdoSDO_PROM_OTR: TFloatField;
    qryRsgMdoSDO_REQ_PROM_LIQ: TFloatField;
    qryRsgMdoSDO_REQ_PROM_FEGA: TFloatField;
    qryRsgMdoSDO_REQ_PROM_OTR: TFloatField;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel19: TQRLabel;
    procedure qrdbPCT_20Print(sender: TObject; var Value: String);
    procedure qrDetailAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    vgB_SALIDA_EXCEL : Boolean;
    vgnRowExcel : Integer;
    vgExcelApp : OleVariant;
    vgFileName : String;
  public
    Function FormaQuery(peID_EMPRESA, peCVE_MONEDA, peID_ACREDITADO, peID_CREDITO, peID_CONTRATO : Integer;
                        peF_REFERENCIA : TDateTime; peCVE_SIT_CARTERA : String ) : String;

    Function FormaQuery_Optimizado(peID_EMPRESA, peCVE_MONEDA, peID_ACREDITADO, peID_CREDITO, peID_CONTRATO : Integer;
                                   peF_REFERENCIA : TDateTime; peCVE_SIT_CARTERA : String ) : String;
  end;

var
  QrRsgMdo: TQrRsgMdo;

procedure RiesgoMdoAgro( peID_EMPRESA, peCVE_MONEDA, peID_ACREDITADO, peID_CREDITO, peID_CONTRATO : Integer;
                         peF_REFERENCIA : TDateTime;
                         peCVE_SIT_CARTERA,
                         peFileName : String;
                         pAPli    : TInterApli;
                         pPreview : Boolean;
                         peB_SAVE_QRY_TO_FILE : Boolean);
Implementation
{$R *.DFM}

procedure RiesgoMdoAgro( peID_EMPRESA, peCVE_MONEDA, peID_ACREDITADO, peID_CREDITO, peID_CONTRATO : Integer;
                         peF_REFERENCIA : TDateTime;
                         peCVE_SIT_CARTERA,
                         peFileName : String;
                         pAPli    : TInterApli;
                         pPreview : Boolean;
                         peB_SAVE_QRY_TO_FILE : Boolean);
Var
    QrRsgMdo : TQrRsgMdo;
    VLTitulo : String;
    Preview  : TIntQRPreview;
Begin
    VLTitulo := '';
    QrRsgMdo := TQrRsgMdo.Create(Nil);
    Preview  := TIntQRPreview.CreatePreview(Application, QrRsgMdo);
    If Assigned(QrRsgMdo) Then
     With QrRsgMdo Do
      Try
        QRInterEncabezado1.Apli:=pApli;
        QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QRInterEncabezado1.NomReporte:= 'IntMQrRsgMdo';
        QRInterEncabezado1.Titulo1:='Requerimiento de Capitalización para la cartera a Créditos Agropecuarios';
        QRInterEncabezado1.Titulo2 := 'Al '+FormatDateTime('DD/MM/YYY',peF_REFERENCIA);

        qryRsgMdo.DatabaseName := pApli.DataBaseName;
        qryRsgMdo.SessionName := pApli.SessionName;
        qryRsgMdo.Active:=False;
        qryRsgMdo.SQL.Text:= FormaQuery_Optimizado(peID_EMPRESA, peCVE_MONEDA, peID_ACREDITADO, peID_CREDITO, peID_CONTRATO,
                                                   peF_REFERENCIA, peCVE_SIT_CARTERA);

        If (peB_SAVE_QRY_TO_FILE) Then
         If SaveDialog.Execute Then
          qryRsgMdo.SQL.SaveToFile(SaveDialog.FileName);

        // Válida la generación del Archivo Excel
        vgB_SALIDA_EXCEL :=(Trim(peFileName) <> '');
        If (vgB_SALIDA_EXCEL) Then
          Begin
          vgFileName := peFileName;
          vgExcelApp := CreateOleObject('Excel.Application');
          vgExcelApp.Workbooks.Add;
          End;

        qryRsgMdo.Open;

        If pPreview Then
            QrRsgMdo.Preview
        Else
            QrRsgMdo.Print;
      Finally
        If (vgB_SALIDA_EXCEL) Then
          Begin
          vgExcelApp.ActiveWorkBook.SaveAs(peFileName);
          CloseExcelFile(vgExcelApp);
          End;
        qryRsgMdo.Close;
        QrRsgMdo.Free;
      End;
      If Assigned(Preview) Then Preview.Free;
End;

Function TQrRsgMdo.FormaQuery(peID_EMPRESA, peCVE_MONEDA, peID_ACREDITADO, peID_CREDITO, peID_CONTRATO : Integer;
                              peF_REFERENCIA : TDateTime; peCVE_SIT_CARTERA : String ) : String;
Var
   vlSQL : String;
   vlID_EMPRESA, vlCVE_MONEDA, vlID_ACREDITADO,
   vlID_CREDITO, vlID_CONTRATO,
   vlF_REFERENCIA, vlF_INI_REFERENCIA,
   vlCVE_SIT_CARTERA  : String;
   wYear, wMonth, wDay : Word;
Begin
   DecodeDate(peF_REFERENCIA, wYear, wMonth, wDay);
   vlF_INI_REFERENCIA := SQLFecha(Encodedate(wYear, wMonth, 1));

   vlID_EMPRESA        := IntToStr(peID_EMPRESA);
   vlCVE_MONEDA        := IntToStr(peCVE_MONEDA);
   vlID_ACREDITADO     := IntToStr(peID_ACREDITADO);
   vlID_CREDITO        := IntToStr(peID_CREDITO);
   vlID_CONTRATO       := IntToStr(peID_CONTRATO);
   vlF_REFERENCIA      := SQLFecha(peF_REFERENCIA);
   vlCVE_SIT_CARTERA   := SQLStr(peCVE_SIT_CARTERA);

   //
   vlSQL := ' SELECT /*+ CHOOSE */ R.*,'+coCRLF+
            '        (R.SDO_PROM_LIQ  * PCT_RIESGO_LIQ)  AS SDO_REQ_PROM_LIQ,'+coCRLF+
            '        (R.SDO_PROM_FEGA * PCT_RIESGO_FEGA) AS SDO_REQ_PROM_FEGA,'+coCRLF+
            '        (R.SDO_PROM_OTR  * PCT_RIESGO_OTR)  AS SDO_REQ_PROM_OTR'+coCRLF+
            ' FROM ( SELECT /*+ CHOOSE */'+coCRLF+
            '             SALDOS.*,'+coCRLF+
            '             ROUND(SALDOS.SDO_PROMEDIO * SALDOS.PCT_GTIA_LIQ / 100, 2)  AS SDO_PROM_LIQ,'+coCRLF+
            '             ROUND(SALDOS.SDO_PROMEDIO * SALDOS.PCT_GTIA_FEGA / 100, 2) AS SDO_PROM_FEGA,'+coCRLF+
            '             ROUND(SALDOS.SDO_PROMEDIO * SALDOS.PCT_GTIA_OTR / 100, 2)  AS SDO_PROM_OTR'+coCRLF+
            '        FROM  ('+coCRLF+
            '              SELECT /*+ CHOOSE */ PCT_AGRONE.*,'+coCRLF+
            '                     RIESGO1.*,'+coCRLF+
            '                     RIESGO2.*,'+coCRLF+
            '                     PKGCRCREDITOO1.GET_RIESGO_MDO_PCT_FIRA(''PCTLIQ'', PCT_GTIA_LIQ_ORIG, PCT_GTIA_FEGA_ORIG) AS PCT_GTIA_LIQ,'+coCRLF+
            '                     PKGCRCREDITOO1.GET_RIESGO_MDO_PCT_FIRA(''PCTFEG'', PCT_GTIA_LIQ_ORIG, PCT_GTIA_FEGA_ORIG) AS PCT_GTIA_FEGA,'+coCRLF+
            '                     PKGCRCREDITOO1.GET_RIESGO_MDO_PCT_FIRA(''PCTOTR'', PCT_GTIA_LIQ_ORIG, PCT_GTIA_FEGA_ORIG) AS PCT_GTIA_OTR,'+coCRLF+
            '                     (PKGCRCREDITOO1.GET_PCT_RIESGO_LIQ(PCT_AGRONE.ID_CREDITO, '+vlF_REFERENCIA+') / 100) AS PCT_RIESGO_LIQ'+coCRLF+
            '              FROM ('+coCRLF+
            '                     SELECT /*+ CHOOSE */'+coCRLF+
            '                          CART_AGRON.ID_EMPRESA,'+coCRLF+
            '                          CART_AGRON.CVE_MONEDA,'+coCRLF+
            '                          M.DESC_MONEDA,'+coCRLF+
            '                          DECODE(CART_AGRON.ANIO_VENC, ''0'', ''VI'', ''VE'') AS CVE_SIT_CARTERA,'+coCRLF+
            '                          P.ID_PERSONA AS ID_ACREDITADO,'+coCRLF+
            '                          SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, P.ID_PERSONA),1,255) AS NOM_ACREDITADO,'+coCRLF+
            '                          CART_AGRON.ID_CONTRATO,'+coCRLF+
            '                          CART_AGRON.ID_CREDITO,'+coCRLF+
            '                          CART_AGRON.F_INICIO,'+coCRLF+
            '                          CART_AGRON.F_VENCIMIENTO,'+coCRLF+
            '                          CART_AGRON.F_TRASPASO_VENC,'+coCRLF+
            '                          CART_AGRON.SDO_VIG_TOTAL,'+coCRLF+
            '                          CFDC.IMP_INTERES_ACUM,'+coCRLF+
            '                          DECODE(CART_AGRON.ANIO_VENC, ''0'', ''Vigente, Impagada'', ''Vencida'') AS DESC_SIT_CARTERA,'+coCRLF+
            '                          PKGCRGYM.GET_SDO_PROMEDIO_COINCRE(CART_AGRON.ID_CREDITO, '+vlF_REFERENCIA+') AS SDO_PROMEDIO,'+coCRLF+
            '                          CART_AGRON.PCT_GTIA_LIQ AS PCT_GTIA_LIQ_ORIG,'+coCRLF+
            '                          PKGCRCREDITOO1.OBTEQUIVALENCIA(2, CART_AGRON.CVE_MONEDA,'+coCRLF+
            '                                                            CART_AGRON.CVE_OPERATIVA,'+coCRLF+
            '                                                            CART_AGRON.PCT_GTIA_LIQ ) AS PCT_GTIA_FEGA_ORIG'+coCRLF+
            '                     FROM PERSONA P,'+coCRLF+
            '                          MONEDA M,'+coCRLF+
            '                          ( SELECT /*+ CHOOSE */ ID_CREDITO, SUM(NVL(IMP_ACCESORIO,0)) AS IMP_INTERES_ACUM'+coCRLF+
            '                            FROM CR_FND_DHIS_CRED'+coCRLF+
            '                            WHERE F_CIERRE BETWEEN '+vlF_INI_REFERENCIA+' AND '+vlF_REFERENCIA+coCRLF+
            '                              AND CVE_ACCESORIO = ''RI'''+coCRLF+
            '                            GROUP BY ID_CREDITO'+coCRLF+
            '                          ) CFDC,'+coCRLF+
            '                          ('+coCRLF+
            '                            SELECT /*+ CHOOSE */ AGRONE.*,'+coCRLF+
            '                                   DECODE(CHC.F_CIERRE, '+vlF_REFERENCIA+','+coCRLF+
            // Se incluye el Importe de Capital Vencido SATV4766 08Feb2006 
            '                                          CHC.SDO_VIG_TOTAL + CHC.IMP_CAPITAL_VDO, 0) AS SDO_VIG_TOTAL,  --Solamente se requiere el saldo a la Fecha de Corte'+coCRLF+
            '                                   PKGCRCREDITOO1.GET_OBT_PCT_GTIA_LIQ(AGRONE.ID_CREDITO) AS PCT_GTIA_LIQ'+coCRLF+
            '                            FROM'+coCRLF+
            '                                  ( SELECT /*+ CHOOSE */ CHC1.*'+coCRLF+
            '                                    FROM  ( SELECT /*+ CHOOSE */ ID_CREDITO, MAX(F_CIERRE) AS MAX_F_CIERRE'+coCRLF+
            '                                            FROM CR_HISTO_CRED'+coCRLF+
            '                                            WHERE F_CIERRE BETWEEN '+vlF_INI_REFERENCIA+' AND '+vlF_REFERENCIA+coCRLF+
            '                                            GROUP BY ID_CREDITO'+coCRLF+
            '                                          ) CHC,'+coCRLF+
            '                                          CR_HISTO_CRED CHC1'+coCRLF+
            '                                    WHERE CHC1.ID_CREDITO = CHC.ID_CREDITO'+coCRLF+
            '                                      AND CHC1.F_CIERRE   = CHC.MAX_F_CIERRE'+coCRLF+
            '                                 ) CHC,'+coCRLF+
            '                                 ( SELECT /*+ CHOOSE */ CTO.ID_TITULAR, CTO.ID_EMPRESA, CTO.CVE_MONEDA,'+coCRLF+
            '                                          CC.ID_CREDITO, CO.ID_CONTRATO,'+coCRLF+
            '                                          CC.F_INICIO, CC.F_VENCIMIENTO,'+coCRLF+
            '                                          CC.F_TRASPASO_VENC,'+coCRLF+
            '                                          NVL(TO_CHAR(CC.F_TRASPASO_VENC,''YYYY''),''0'') AS ANIO_VENC,'+coCRLF+
            '                                          CVE_OPERATIVA'+coCRLF+
            '                                   FROM ( SELECT /*+ CHOOSE */ * FROM CR_PRODUCTO'+coCRLF+
            '                                          WHERE CVE_PRODUCTO_GPO = ''AGRONE'' ) CP,'+coCRLF+
            '                                          CR_CONTRATO CO,'+coCRLF+
            '                                          CR_CREDITO CC,'+coCRLF+
            '                                          CONTRATO CTO'+coCRLF+
            '                                   WHERE CO.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE'+coCRLF+
            '                                     AND CC.ID_CONTRATO = CO.ID_CONTRATO'+coCRLF+
            '                                     AND CTO.ID_CONTRATO = CO.ID_CONTRATO'+coCRLF+
            '                                 ) AGRONE'+coCRLF+
            '                            WHERE CHC.ID_CREDITO = AGRONE.ID_CREDITO'+coCRLF+
            '                          ) CART_AGRON'+coCRLF+
            '                    WHERE P.ID_PERSONA = CART_AGRON.ID_TITULAR'+coCRLF+
            '                         AND P.CVE_TIPO_SECTOR NOT IN (''14'')'+coCRLF+
            '                      AND M.CVE_MONEDA = CART_AGRON.CVE_MONEDA'+coCRLF+
            '                      AND CFDC.ID_CREDITO (+)= CART_AGRON.ID_CREDITO'+coCRLF+
            '                   ) PCT_AGRONE,'+coCRLF+
            '                   ( SELECT /*+ CHOOSE */ (CRM.PCT_RIESGO / 100) AS PCT_RIESGO_FEGA'+coCRLF+
            '                     FROM ( SELECT /*+ CHOOSE */ CVE_PRODUCTO_GPO, CVE_CRIT_RIESGO,'+coCRLF+
            '                                   MAX(F_INI_VIGENCIA) AS MAX_F_INI_VIGENCIA'+coCRLF+
            '                            FROM ADMIPROD.CR_RIESGO_MDO'+coCRLF+
            '                            WHERE CVE_PRODUCTO_GPO = ''AGRONE'''+coCRLF+
            '                              AND CVE_CRIT_RIESGO = ''RSGFEG'''+coCRLF+
            '                              AND F_INI_VIGENCIA <= '+vlF_REFERENCIA+coCRLF+
            '                              AND SIT_RIESGO_MDO <> ''CA'''+coCRLF+
            '                            GROUP BY CVE_PRODUCTO_GPO, CVE_CRIT_RIESGO'+coCRLF+
            '                          ) TEMP,'+coCRLF+
            '                          ADMIPROD.CR_RIESGO_MDO CRM'+coCRLF+
            '                     WHERE CRM.CVE_PRODUCTO_GPO  = TEMP.CVE_PRODUCTO_GPO'+coCRLF+
            '                       AND CRM.CVE_CRIT_RIESGO   = TEMP.CVE_CRIT_RIESGO'+coCRLF+
            '                       AND CRM.F_INI_VIGENCIA = MAX_F_INI_VIGENCIA'+coCRLF+
            '                   ) RIESGO1,'+coCRLF+
            '                   ( SELECT /*+ CHOOSE */ (CRM.PCT_RIESGO / 100) AS PCT_RIESGO_OTR'+coCRLF+
            '                     FROM ( SELECT /*+ CHOOSE */ CVE_PRODUCTO_GPO, CVE_CRIT_RIESGO,'+coCRLF+
            '                                   MAX(F_INI_VIGENCIA) AS MAX_F_INI_VIGENCIA'+coCRLF+
            '                            FROM ADMIPROD.CR_RIESGO_MDO'+coCRLF+
            '                            WHERE CVE_PRODUCTO_GPO = ''AGRONE'''+coCRLF+
            '                              AND CVE_CRIT_RIESGO = ''RSGOTR'''+coCRLF+
            '                              AND F_INI_VIGENCIA <= '+vlF_REFERENCIA+coCRLF+
            '                              AND SIT_RIESGO_MDO <> ''CA'''+coCRLF+
            '                            GROUP BY CVE_PRODUCTO_GPO, CVE_CRIT_RIESGO'+coCRLF+
            '                          ) TEMP,'+coCRLF+
            '                          ADMIPROD.CR_RIESGO_MDO CRM'+coCRLF+
            '                     WHERE CRM.CVE_PRODUCTO_GPO  = TEMP.CVE_PRODUCTO_GPO'+coCRLF+
            '                       AND CRM.CVE_CRIT_RIESGO   = TEMP.CVE_CRIT_RIESGO'+coCRLF+
            '                       AND CRM.F_INI_VIGENCIA = MAX_F_INI_VIGENCIA'+coCRLF+
            '                   ) RIESGO2'+coCRLF+
            '              ) SALDOS'+coCRLF+
            '          ) R'+coCRLF+
            '  /* Filtros */ '+coCRLF+
            '  WHERE R.ID_EMPRESA = DECODE('+vlID_EMPRESA+',0,R.ID_EMPRESA,'+vlID_EMPRESA+') '+coCRLF+
            '        AND R.ID_ACREDITADO = DECODE('+vlID_ACREDITADO+',0,R.ID_ACREDITADO,'+vlID_ACREDITADO+') '+coCRLF+
            '        AND R.CVE_MONEDA = DECODE('+vlCVE_MONEDA+',0,R.CVE_MONEDA,'+vlCVE_MONEDA+') '+coCRLF+
            '        AND R.ID_CONTRATO = DECODE('+vlID_CONTRATO+',0,R.ID_CONTRATO,'+vlID_CONTRATO+') '+coCRLF+
            '        AND R.ID_CREDITO = DECODE('+vlID_CREDITO+',0,R.ID_CREDITO,'+vlID_CREDITO+') '+coCRLF
            ;
   // Aplica el Filtro de Situación de Cartera
   If (peCVE_SIT_CARTERA <> 'AM') Then
   vlSQL := vlSQL +
            '       AND R.CVE_SIT_CARTERA = '+vlCVE_SIT_CARTERA+coCRLF;

   vlSQL := vlSQL +
            '    ORDER BY CVE_MONEDA, NOM_ACREDITADO, CVE_SIT_CARTERA DESC, ID_CONTRATO, ID_CREDITO'+coCRLF
           ;
   Result := vlSQL;
End;


Function TQrRsgMdo.FormaQuery_Optimizado(peID_EMPRESA, peCVE_MONEDA, peID_ACREDITADO, peID_CREDITO, peID_CONTRATO : Integer;
                                         peF_REFERENCIA : TDateTime; peCVE_SIT_CARTERA : String ) : String;
Var
   vlSQL : String;
   vlID_EMPRESA, vlCVE_MONEDA, vlID_ACREDITADO,
   vlID_CREDITO, vlID_CONTRATO,
   vlF_REFERENCIA, vlF_INI_REFERENCIA,
   vlCVE_SIT_CARTERA  : String;
   wYear, wMonth, wDay : Word;
Begin
   DecodeDate(peF_REFERENCIA, wYear, wMonth, wDay);
   vlF_INI_REFERENCIA := SQLFecha(Encodedate(wYear, wMonth, 1));

   vlID_EMPRESA        := IntToStr(peID_EMPRESA);
   vlCVE_MONEDA        := IntToStr(peCVE_MONEDA);
   vlID_ACREDITADO     := IntToStr(peID_ACREDITADO);
   vlID_CREDITO        := IntToStr(peID_CREDITO);
   vlID_CONTRATO       := IntToStr(peID_CONTRATO);
   vlF_REFERENCIA      := SQLFecha(peF_REFERENCIA);
   vlCVE_SIT_CARTERA   := SQLStr(peCVE_SIT_CARTERA);
   //
   vlSQL := ' SELECT /*+ CHOOSE */ R.*,'+coCRLF+
            '        (R.SDO_PROM_LIQ  * PCT_RIESGO_LIQ)  AS SDO_REQ_PROM_LIQ,'+coCRLF+
            '        (R.SDO_PROM_FEGA * PCT_RIESGO_FEGA) AS SDO_REQ_PROM_FEGA,'+coCRLF+
            '        (R.SDO_PROM_OTR  * PCT_RIESGO_OTR)  AS SDO_REQ_PROM_OTR'+coCRLF+
            ' FROM ( SELECT /*+ CHOOSE */'+coCRLF+
            '             SALDOS.*,'+coCRLF+
            '             ROUND(SALDOS.SDO_PROMEDIO * SALDOS.PCT_GTIA_LIQ / 100, 2)  AS SDO_PROM_LIQ,'+coCRLF+
            '             ROUND(SALDOS.SDO_PROMEDIO * SALDOS.PCT_GTIA_FEGA / 100, 2) AS SDO_PROM_FEGA,'+coCRLF+
            '             ROUND(SALDOS.SDO_PROMEDIO * SALDOS.PCT_GTIA_OTR / 100, 2)  AS SDO_PROM_OTR'+coCRLF+
            '        FROM  ('+coCRLF+
            '              SELECT /*+ CHOOSE */ PCT_AGRONE.*,'+coCRLF+
            '                     RIESGO1.*,'+coCRLF+
            '                     RIESGO2.*,'+coCRLF+
            '                     PKGCRCREDITOO1.GET_RIESGO_MDO_PCT_FIRA(''PCTLIQ'', PCT_GTIA_LIQ_ORIG, PCT_GTIA_FEGA_ORIG) AS PCT_GTIA_LIQ,'+coCRLF+
            '                     PKGCRCREDITOO1.GET_RIESGO_MDO_PCT_FIRA(''PCTFEG'', PCT_GTIA_LIQ_ORIG, PCT_GTIA_FEGA_ORIG) AS PCT_GTIA_FEGA,'+coCRLF+
            '                     PKGCRCREDITOO1.GET_RIESGO_MDO_PCT_FIRA(''PCTOTR'', PCT_GTIA_LIQ_ORIG, PCT_GTIA_FEGA_ORIG) AS PCT_GTIA_OTR,'+coCRLF+
            '                     (PKGCRCREDITOO1.GET_PCT_RIESGO_LIQ(PCT_AGRONE.ID_CREDITO, ' + vlF_REFERENCIA + ') / 100) AS PCT_RIESGO_LIQ'+coCRLF+
            '              FROM ('+coCRLF+
            '                     SELECT /*+ CHOOSE */'+coCRLF+
            '                          CART_AGRON.ID_EMPRESA,'+coCRLF+
            '                          CART_AGRON.CVE_MONEDA,'+coCRLF+
            '                          M.DESC_MONEDA,'+coCRLF+
            '                          DECODE(CART_AGRON.ANIO_VENC, ''0'', ''VI'', ''VE'') AS CVE_SIT_CARTERA,'+coCRLF+
            '                          P.ID_PERSONA AS ID_ACREDITADO,'+coCRLF+
            '                          SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, P.ID_PERSONA),1,255) AS NOM_ACREDITADO,'+coCRLF+
            '                          CART_AGRON.ID_CONTRATO,'+coCRLF+
            '                          CART_AGRON.ID_CREDITO,'+coCRLF+
            '                          CART_AGRON.F_INICIO,'+coCRLF+
            '                          CART_AGRON.F_VENCIMIENTO,'+coCRLF+
            '                          CART_AGRON.F_TRASPASO_VENC,'+coCRLF+
            '                          CART_AGRON.SDO_VIG_TOTAL,'+coCRLF+
            '                          CFDC.IMP_INTERES_ACUM,'+coCRLF+
            '                          DECODE(CART_AGRON.ANIO_VENC, ''0'', ''Vigente, Impagada'', ''Vencida'') AS DESC_SIT_CARTERA,'+coCRLF+
            '                          CART_AGRON.SDO_PROMEDIO,'+coCRLF+
            '                          CART_AGRON.PCT_GTIA_LIQ AS PCT_GTIA_LIQ_ORIG,'+coCRLF+
            '                          PKGCRCREDITOO1.OBTEQUIVALENCIA(2, CART_AGRON.CVE_MONEDA,'+coCRLF+
            '                                                            CART_AGRON.CVE_OPERATIVA,'+coCRLF+
            '                                                            CART_AGRON.PCT_GTIA_LIQ ) AS PCT_GTIA_FEGA_ORIG'+coCRLF+
            '                     FROM PERSONA P,'+coCRLF+
            '                          MONEDA M,'+coCRLF+
            '                          ( SELECT /*+ CHOOSE */ COINCRE.ID_CREDITO, SUM(NVL(IMP_ACCESORIO,0)) AS IMP_INTERES_ACUM'+coCRLF+
            '                            FROM CR_FND_DHIS_CRED CFDC,'+coCRLF+
            '                                 (  SELECT /*+ CHOOSE */  TO_NUMBER(DCDC.CREDITO) AS ID_CREDITO'+coCRLF+
            '                                    FROM DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
            '                                         DM_CR_DIM_CREDITO@DWHC DCDC,'+coCRLF+
            '                                         ( SELECT /*+ CHOOSE */ DCDM.ANIO, DCDM.MES, DCDM.ID_ANIO_MES'+coCRLF+
            '                                           FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
            '                                           WHERE DCDM.NUM_MES = TO_NUMBER(TO_CHAR(' + vlF_REFERENCIA + ',''MM''))'+coCRLF+
            '                                             AND DCDM.ANIO = TO_NUMBER(TO_CHAR(' + vlF_REFERENCIA + ',''YYYY''))'+coCRLF+
            '                                         ) DCDM,'+coCRLF+
            '                                         ( SELECT /*+ CHOOSE */ CVE_PRODUCTO_CRE FROM CR_PRODUCTO'+coCRLF+
            '                                           WHERE CVE_PRODUCTO_GPO = ''AGRONE'''+coCRLF+
            '                                         ) CP'+coCRLF+
            '                                    WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
            '                                      AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
            '                                      AND DCDC.ID_OLTP_PRODUCTO = CP.CVE_PRODUCTO_CRE'+coCRLF+
            '                                 ) COINCRE'+coCRLF+
            '                            WHERE CFDC.ID_CREDITO = COINCRE.ID_CREDITO'+coCRLF+
            '                              AND CFDC.F_CIERRE BETWEEN '+vlF_INI_REFERENCIA+' AND '+vlF_REFERENCIA+coCRLF+
            '                              AND CFDC.CVE_ACCESORIO = ''RI'''+coCRLF+
            '                            GROUP BY COINCRE.ID_CREDITO'+coCRLF+
            '                          ) CFDC,'+coCRLF+
            '                          ( SELECT /*+ CHOOSE */ AGRONE.*,'+coCRLF+
            '                                   NVL(CHC.SDO_VIG_TOTAL, COINCRE.SDO_VIG_TOTAL) AS SDO_VIG_TOTAL,'+coCRLF+
            '                                   COINCRE.SDO_PROMEDIO,'+coCRLF+
            '                                   PKGCRCREDITOO1.GET_OBT_PCT_GTIA_LIQ(AGRONE.ID_CREDITO) AS PCT_GTIA_LIQ'+coCRLF+
            '                            FROM'+coCRLF+
            '                                  (  SELECT /*+ CHOOSE */  TO_NUMBER(DCDC.CREDITO) AS ID_CREDITO,'+coCRLF+
            '                                           (NVL(IMP_SDO_K_VIG,0) + NVL(IMP_SDO_K_IMP,0) + NVL(IMP_SDO_K_VEN,0)) AS SDO_VIG_TOTAL,'+coCRLF+
            '                                           (NVL(IMP_SPM_K_VIG,0) + NVL(IMP_SPM_K_IMP,0) + NVL(IMP_SPM_K_VEN,0)) AS SDO_PROMEDIO'+coCRLF+
            '                                     FROM DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
            '                                          DM_CR_DIM_CREDITO@DWHC DCDC,'+coCRLF+
            '                                          ( SELECT /*+ CHOOSE */ DCDM.ANIO, DCDM.MES, DCDM.ID_ANIO_MES'+coCRLF+
            '                                            FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
            '                                            WHERE DCDM.NUM_MES = TO_NUMBER(TO_CHAR(' + vlF_REFERENCIA + ',''MM''))'+coCRLF+
            '                                              AND DCDM.ANIO = TO_NUMBER(TO_CHAR(' + vlF_REFERENCIA + ',''YYYY''))'+coCRLF+
            '                                          ) DCDM,'+coCRLF+
            '                                          ( SELECT /*+ CHOOSE */ CVE_PRODUCTO_CRE FROM CR_PRODUCTO'+coCRLF+
            '                                            WHERE CVE_PRODUCTO_GPO = ''AGRONE'''+coCRLF+
            '                                          ) CP'+coCRLF+
            '                                     WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
            '                                       AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
            '                                       AND DCDC.ID_OLTP_PRODUCTO = CP.CVE_PRODUCTO_CRE'+coCRLF+
            '                                 ) COINCRE,'+coCRLF+
            '                                 ( SELECT CHC.ID_CREDITO,'+coCRLF+
            '                                          (NVL(CHC.SDO_VIG_TOTAL,0) + NVL(CHC.IMP_CAPITAL_VDO,0)) AS SDO_VIG_TOTAL'+coCRLF+
            '                                   FROM  CR_HISTO_CRED CHC,'+coCRLF+
            '                                         CR_CREDITO CC,'+coCRLF+
            '                                         CR_CONTRATO CO,'+coCRLF+
            '                                         ( SELECT /*+ CHOOSE */ CVE_PRODUCTO_CRE FROM CR_PRODUCTO'+coCRLF+
            '                                          WHERE CVE_PRODUCTO_GPO = ''AGRONE'' ) CP'+coCRLF+
            '                                   WHERE CHC.F_CIERRE = ' + vlF_REFERENCIA + ''+coCRLF+
            '                                     AND CC.ID_CREDITO = CHC.ID_CREDITO'+coCRLF+
            '                                     AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
            '                                     AND CO.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE'+coCRLF+
            '                                 ) CHC,'+coCRLF+
            '                                 ( SELECT /*+ CHOOSE */ CTO.ID_TITULAR, CTO.ID_EMPRESA, CTO.CVE_MONEDA,'+coCRLF+
            '                                          CC.ID_CREDITO, CO.ID_CONTRATO,'+coCRLF+
            '                                          CC.F_INICIO, CC.F_VENCIMIENTO,'+coCRLF+
            '                                          CC.F_TRASPASO_VENC,'+coCRLF+
            '                                          NVL(TO_CHAR(CC.F_TRASPASO_VENC,''YYYY''),''0'') AS ANIO_VENC,'+coCRLF+
            '                                          CVE_OPERATIVA'+coCRLF+
            '                                   FROM ( SELECT /*+ CHOOSE */ CVE_PRODUCTO_CRE FROM CR_PRODUCTO'+coCRLF+
            '                                          WHERE CVE_PRODUCTO_GPO = ''AGRONE'' ) CP,'+coCRLF+
            '                                          CR_CONTRATO CO,'+coCRLF+
            '                                          CR_CREDITO CC,'+coCRLF+
            '                                          CONTRATO CTO'+coCRLF+
            '                                   WHERE CO.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE'+coCRLF+
            '                                     AND CC.ID_CONTRATO = CO.ID_CONTRATO'+coCRLF+
            '                                     AND CTO.ID_CONTRATO = CO.ID_CONTRATO'+coCRLF+
            '                                 ) AGRONE'+coCRLF+
            '                            WHERE COINCRE.ID_CREDITO = AGRONE.ID_CREDITO'+coCRLF+
            '                             AND  CHC.ID_CREDITO (+)= COINCRE.ID_CREDITO'+coCRLF+
            '                          ) CART_AGRON'+coCRLF+
            '                    WHERE P.ID_PERSONA = CART_AGRON.ID_TITULAR'+coCRLF+
            '                      AND P.CVE_TIPO_SECTOR NOT IN (''14'')'+coCRLF+
            '                      AND M.CVE_MONEDA = CART_AGRON.CVE_MONEDA'+coCRLF+
            '                      AND CFDC.ID_CREDITO (+)= CART_AGRON.ID_CREDITO'+coCRLF+
            '                   ) PCT_AGRONE,'+coCRLF+
            '                   ( SELECT /*+ CHOOSE */ (CRM.PCT_RIESGO / 100) AS PCT_RIESGO_FEGA'+coCRLF+
            '                     FROM ( SELECT /*+ CHOOSE */ CVE_PRODUCTO_GPO, CVE_CRIT_RIESGO,'+coCRLF+
            '                                   MAX(F_INI_VIGENCIA) AS MAX_F_INI_VIGENCIA'+coCRLF+
            '                            FROM ADMIPROD.CR_RIESGO_MDO'+coCRLF+
            '                            WHERE CVE_PRODUCTO_GPO = ''AGRONE'''+coCRLF+
            '                              AND CVE_CRIT_RIESGO = ''RSGFEG'''+coCRLF+
            '                              AND F_INI_VIGENCIA <= ' + vlF_REFERENCIA + ''+coCRLF+
            '                              AND SIT_RIESGO_MDO <> ''CA'''+coCRLF+
            '                            GROUP BY CVE_PRODUCTO_GPO, CVE_CRIT_RIESGO'+coCRLF+
            '                          ) TEMP,'+coCRLF+
            '                          ADMIPROD.CR_RIESGO_MDO CRM'+coCRLF+
            '                     WHERE CRM.CVE_PRODUCTO_GPO  = TEMP.CVE_PRODUCTO_GPO'+coCRLF+
            '                       AND CRM.CVE_CRIT_RIESGO   = TEMP.CVE_CRIT_RIESGO'+coCRLF+
            '                       AND CRM.F_INI_VIGENCIA = MAX_F_INI_VIGENCIA'+coCRLF+
            '                   ) RIESGO1,'+coCRLF+
            '                   ( SELECT /*+ CHOOSE */ (CRM.PCT_RIESGO / 100) AS PCT_RIESGO_OTR'+coCRLF+
            '                     FROM ( SELECT /*+ CHOOSE */ CVE_PRODUCTO_GPO, CVE_CRIT_RIESGO,'+coCRLF+
            '                                   MAX(F_INI_VIGENCIA) AS MAX_F_INI_VIGENCIA'+coCRLF+
            '                            FROM ADMIPROD.CR_RIESGO_MDO'+coCRLF+
            '                            WHERE CVE_PRODUCTO_GPO = ''AGRONE'''+coCRLF+
            '                              AND CVE_CRIT_RIESGO = ''RSGOTR'''+coCRLF+
            '                              AND F_INI_VIGENCIA <= ' + vlF_REFERENCIA + coCRLF+
            '                              AND SIT_RIESGO_MDO <> ''CA'''+coCRLF+
            '                            GROUP BY CVE_PRODUCTO_GPO, CVE_CRIT_RIESGO'+coCRLF+
            '                          ) TEMP,'+coCRLF+
            '                          ADMIPROD.CR_RIESGO_MDO CRM'+coCRLF+
            '                     WHERE CRM.CVE_PRODUCTO_GPO  = TEMP.CVE_PRODUCTO_GPO'+coCRLF+
            '                       AND CRM.CVE_CRIT_RIESGO   = TEMP.CVE_CRIT_RIESGO'+coCRLF+
            '                       AND CRM.F_INI_VIGENCIA = MAX_F_INI_VIGENCIA'+coCRLF+
            '                   ) RIESGO2'+coCRLF+
            '              ) SALDOS'+coCRLF+
            '          ) R'+coCRLF+
            '  WHERE 1 = 1 '+coCRLF;

  If (Trim(vlID_EMPRESA) <> '0') Then
   vlSQL := vlSQL +
            '        AND R.ID_EMPRESA = ' + vlID_EMPRESA +coCRLF;

  If (Trim(vlID_ACREDITADO) <> '0') Then
   vlSQL := vlSQL +
            '        AND R.ID_ACREDITADO = ' + vlID_ACREDITADO +coCRLF;

  If (Trim(vlCVE_MONEDA) <> '0') Then
   vlSQL := vlSQL +
            '        AND R.CVE_MONEDA = ' + vlCVE_MONEDA +coCRLF;

  If (Trim(vlID_CONTRATO) <> '0') Then
   vlSQL := vlSQL +
            '        AND R.ID_CONTRATO = ' + vlID_CONTRATO +coCRLF;

  If (Trim(vlID_CREDITO) <> '0') Then
   vlSQL := vlSQL +
            '        AND R.ID_CREDITO = ' + vlID_CREDITO +coCRLF;

   // Aplica el Filtro de Situación de Cartera
   If (peCVE_SIT_CARTERA <> 'AM') Then
   vlSQL := vlSQL +
            '       AND R.CVE_SIT_CARTERA = '+vlCVE_SIT_CARTERA+coCRLF;


   vlSQL := vlSQL +
            '    ORDER BY CVE_MONEDA, NOM_ACREDITADO, CVE_SIT_CARTERA DESC, ID_CONTRATO, ID_CREDITO'+coCRLF
           ;
   Result := vlSQL;
End;



procedure TQrRsgMdo.qrdbPCT_20Print(sender: TObject; var Value: String);
begin
 Try
  If Value = '0.00' Then Value := '';
 Finally
 End;
end;

procedure TQrRsgMdo.qrDetailAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
 If (vgB_SALIDA_EXCEL) Then
   With qryRsgMdo Do
    Begin
    Inc(vgnRowExcel);
    If Not (FieldByName('ID_EMPRESA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A' )].Value := FieldByName('ID_EMPRESA').AsFloat;
    If Not (FieldByName('CVE_MONEDA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('B' )].Value := FieldByName('CVE_MONEDA').DisplayText;
    If Not (FieldByName('DESC_MONEDA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('C' )].Value := FieldByName('DESC_MONEDA').DisplayText;
    If Not (FieldByName('CVE_SIT_CARTERA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('D' )].Value := FieldByName('CVE_SIT_CARTERA').DisplayText;
    If Not (FieldByName('DESC_SIT_CARTERA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('E' )].Value := FieldByName('DESC_SIT_CARTERA').DisplayText;
    If Not (FieldByName('ID_ACREDITADO').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('F' )].Value := FieldByName('ID_ACREDITADO').AsFloat;
    If Not (FieldByName('NOM_ACREDITADO').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('G' )].Value := FieldByName('NOM_ACREDITADO').DisplayText;
    If Not (FieldByName('ID_CONTRATO').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('H' )].Value := FieldByName('ID_CONTRATO').AsFloat;
    If Not (FieldByName('ID_CREDITO').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('I' )].Value := FieldByName('ID_CREDITO').AsFloat;
    If Not (FieldByName('F_INICIO').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('J' )].Value := FieldByName('F_INICIO').AsDateTime;
    If Not (FieldByName('F_VENCIMIENTO').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('K' )].Value := FieldByName('F_VENCIMIENTO').AsDateTime;
    If Not (FieldByName('F_TRASPASO_VENC').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('L' )].Value := FieldByName('F_TRASPASO_VENC').AsDateTime;
    If Not (FieldByName('SDO_VIG_TOTAL').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('M' )].Value := FieldByName('SDO_VIG_TOTAL').DisplayText;
    If Not (FieldByName('IMP_INTERES_ACUM').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('N' )].Value := FieldByName('IMP_INTERES_ACUM').AsFloat;
    If Not (FieldByName('SDO_PROMEDIO').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('O' )].Value := FieldByName('SDO_PROMEDIO').AsFloat;
    If Not (FieldByName('PCT_GTIA_LIQ').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('P' )].Value := FieldByName('PCT_GTIA_LIQ').AsFloat / 100;
    If Not (FieldByName('PCT_GTIA_FEGA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Q' )].Value := FieldByName('PCT_GTIA_FEGA').AsFloat / 100;
    If Not (FieldByName('PCT_GTIA_OTR').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('R' )].Value := FieldByName('PCT_GTIA_OTR').AsFloat / 100;
    If Not (FieldByName('SDO_PROM_LIQ').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('S' )].Value := FieldByName('SDO_PROM_LIQ').AsFloat;
    If Not (FieldByName('SDO_PROM_FEGA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('T' )].Value := FieldByName('SDO_PROM_FEGA').AsFloat;
    If Not (FieldByName('SDO_PROM_OTR').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('U' )].Value := FieldByName('SDO_PROM_OTR').AsFloat;
    If Not (FieldByName('SDO_REQ_PROM_LIQ').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('V' )].Value := FieldByName('SDO_REQ_PROM_LIQ').AsFloat;
    If Not (FieldByName('SDO_REQ_PROM_FEGA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('W' )].Value := FieldByName('SDO_REQ_PROM_FEGA').AsFloat;
    If Not (FieldByName('SDO_REQ_PROM_OTR').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('X' )].Value := FieldByName('SDO_REQ_PROM_OTR').AsFloat;

    vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Y' )].Value := QRExpFactCapitalizacion.Value.dblResult / 100;
    vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Z' )].Value := QRExprUsoCapital.Value.dblResult;
    End;
end;

procedure TQrRsgMdo.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  If (vgB_SALIDA_EXCEL) Then
      Begin
      vgnRowExcel := 1;
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A' )].Value := 'No. Empresa';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('B' )].Value := 'Moneda';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('C' )].Value := 'Desc. Moneda';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('D' )].Value := 'Situación de la Cartera';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('E' )].Value := 'Desc. Sit. Cartera';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('F' )].Value := 'Núm. Acreditado';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('G' )].Value := 'Nombre del Acreditado';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('H' )].Value := 'Número de Autorización';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('I' )].Value := 'Número de Crédito';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('J' )].Value := 'Fecha de Crédito Inicio';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('K' )].Value := 'Fecha de Crédito Vencimiento';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('L' )].Value := 'Fecha de Traspaso a Vencida';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('M' )].Value := 'Saldo Insoluto';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('N' )].Value := 'Intereses Acumulados';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('O' )].Value := 'Saldo Promedio';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('P' )].Value := '% De Garantía Líquida';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Q' )].Value := '% De Garantía FEGA Efva.';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('R' )].Value := '% de Otras Garantías';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('S' )].Value := 'Parte Proporcional de Saldo Promedio Líquida';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('T' )].Value := 'Parte Proporcional de Saldo Promedio FEGA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('U' )].Value := 'Parte Proporcional de Saldo Promedio Otras';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('V' )].Value := 'Saldo Promedio Ponderado Líquida';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('W' )].Value := 'Saldo Promedio Ponderado FEGA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('X' )].Value := 'Saldo Promedio Ponderado Otras';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Y' )].Value := 'Factor de Capitalización';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Z' )].Value := 'Uso de Capital';

      vgExcelApp.Range['A1:Z1'].Font.Bold := True;
      vgExcelApp.Range['A1:Z1'].VerticalAlignment   := xlVAlignCenter;
      vgExcelApp.Range['A1:Z1'].HorizontalAlignment := xlHAlignCenter;
      vgExcelApp.Range['A1:Z1'].Wraptext := True;
      vgExcelApp.Range['A1:Z1'].RowHeight := 45.75; // La medida esta en Pixeles
      vgExcelApp.Range['A1:Z1'].ColumnWidth := 15.14; // La medida esta en Pixeles      

      vgExcelApp.Range['A1:Z65536'].Font.Name := 'Verdana';
      vgExcelApp.Range['A1:Z65536'].Font.Size := 8;

      vgExcelApp.Range['M2:M65536'].Style := 'Currency';
      vgExcelApp.Range['N2:N65536'].Style := 'Currency';
      vgExcelApp.Range['O2:O65536'].Style := 'Currency';
      vgExcelApp.Range['S2:S65536'].Style := 'Currency';
      vgExcelApp.Range['T2:T65536'].Style := 'Currency';
      vgExcelApp.Range['U2:U65536'].Style := 'Currency';
      vgExcelApp.Range['V2:V65536'].Style := 'Currency';
      vgExcelApp.Range['W2:W65536'].Style := 'Currency';
      vgExcelApp.Range['X2:X65536'].Style := 'Currency';
      vgExcelApp.Range['Z2:Z65536'].Style := 'Currency';      

      vgExcelApp.Range['P2:P65536'].Style := 'Percent';
      vgExcelApp.Range['Q2:Q65536'].Style := 'Percent';
      vgExcelApp.Range['R2:R65536'].Style := 'Percent';
      vgExcelApp.Range['Y2:Y65536'].Style := 'Percent';      
      End;
end;

End.
