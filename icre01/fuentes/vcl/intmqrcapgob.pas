unit IntMQrCapGob;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre, UnSQL2, Dialogs, cOMoBJ, IntXls;

type
  TQrCapGob = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    qrShpAdeudoTotal: TQRShape;
    qrshpCalificadoras: TQRShape;
    qrlblAdeudoTotal: TQRLabel;
    qryCapGob: TQuery;
    TitleBand1: TQRBand;
    qrlblCalificadoras: TQRLabel;
    qrlblSdoPromedio: TQRLabel;
    qrShpSdoPromedio: TQRShape;
    qrShpNomCalificadora1: TQRShape;
    qrShpNomCalificadora2: TQRShape;
    qrShpNomCalificadora3: TQRShape;
    qrShpNomCalificadora4: TQRShape;
    qrshpNomCalificadora5: TQRShape;
    qrShpNomCalificadora6: TQRShape;
    qrShpPct1: TQRShape;
    qrlblPct1: TQRLabel;
    qrShpPct2: TQRShape;
    qrlblPct2: TQRLabel;
    qrShpPct3: TQRShape;
    qrlblPct: TQRLabel;
    qrShpPct4: TQRShape;
    qrlblPct3: TQRLabel;
    qrShpPct5: TQRShape;
    qrlblPct4: TQRLabel;
    qrShpPct6: TQRShape;
    qrlblPct5: TQRLabel;
    qrShpPct7: TQRShape;
    qrlblPct6: TQRLabel;
    qrShpPct8: TQRShape;
    qrlblPct7: TQRLabel;
    qrShpPct9: TQRShape;
    qrlblPct8: TQRLabel;
    qrShpPct10: TQRShape;
    qrlblPct9: TQRLabel;
    qrShpPct11: TQRShape;
    qrlblPct10: TQRLabel;
    qrShpPct12: TQRShape;
    qrlblPct11: TQRLabel;
    qrShpPct13: TQRShape;
    qrlblPct12: TQRLabel;
    qrShpTOTAL: TQRShape;
    qrlblTOTAL: TQRLabel;
    qrShpTOTAL_ANT: TQRShape;
    qrlblTOTAL_ANT: TQRLabel;
    qrShpVARIACION: TQRShape;
    qrlblVARIACION: TQRLabel;
    qrGrpCVE_MONEDA: TQRGroup;
    qrDetail: TQRBand;
    qrFootB_APL_INSCR_DEUD: TQRBand;
    qrGrpB_APL_INSCR_DEUD: TQRGroup;
    qrGrpID_ACREDITADO: TQRGroup;
    qrFootID_ACREDITADO: TQRBand;
    qrFootCVE_MONEDA: TQRBand;
    QRShape1: TQRShape;
    qrdbCVE_MONEDA: TQRDBText;
    qrlbMONEDA: TQRLabel;
    qrdbDESC_MONEDA: TQRDBText;
    QRShape2: TQRShape;
    qrdbCVE_MONEDA1: TQRDBText;
    qrlblTotalMoneda: TQRLabel;
    qrdbDESC_MONEDA1: TQRDBText;
    QRShape3: TQRShape;
    qrdbTX_B_APL_INSCR_DEUD: TQRDBText;
    QRShape4: TQRShape;
    qrdbTX_B_APL_INSCR_DEUD1: TQRDBText;
    qrlblTotal1: TQRLabel;
    qrdbID_ACREDITADO: TQRDBText;
    qrlblACREDITADO: TQRLabel;
    qrdbNOM_ACREDITADO: TQRDBText;
    qrdbADEUDO_TOTAL: TQRDBText;
    qrdbSDO_PROM_MES_ACT: TQRDBText;
    qrdbCVE_CALIFICACION1: TQRDBText;
    qrdbCVE_CALIFICACION2: TQRDBText;
    qrdbCVE_CALIFICACION3: TQRDBText;
    qrdbCVE_CALIFICACION4: TQRDBText;
    qrdbCVE_CALIFICACION5: TQRDBText;
    qrdbCVE_CALIFICACION6: TQRDBText;
    qrdbPCT_20: TQRDBText;
    qrdbPCT_50: TQRDBText;
    qrdbPCT_115: TQRDBText;
    qrdbPCT_150: TQRDBText;
    qrdbSDO_PROM_MES_ACT1: TQRDBText;
    qrdbSDO_PROM_MES_ANT: TQRDBText;
    qrdbVARIACION: TQRDBText;
    qrExpSumPCT_20: TQRExpr;
    qrExpSumPCT_50: TQRExpr;
    qrExpSumPCT_115: TQRExpr;
    qrExpSumPCT_150: TQRExpr;
    qrExpSumSDO_PROM_MES_ACT1: TQRExpr;
    qrExpSumSDO_PROM_MES_ANT: TQRExpr;
    qrExpSumVARIACION: TQRExpr;
    qrExpSum1PCT_20: TQRExpr;
    qrExpSum1PCT_50: TQRExpr;
    qrExpSum1PCT_115: TQRExpr;
    qrExpSum1PCT_150: TQRExpr;
    qrExpSum1SDO_PROM_MES_ACT1: TQRExpr;
    qrExpSum1SDO_PROM_MES_ANT: TQRExpr;
    qrExpSum1VARIACION: TQRExpr;
    qrlblADEUDO_TOTAL: TQRLabel;
    QRLabel6: TQRLabel;
    qrExpSumADEUDO_TOTAL: TQRExpr;
    qrExpSum1ADEUDO_TOTAL: TQRExpr;
    qrdbNOM_CALIFICADORA6: TQRDBText;
    SaveDialog: TSaveDialog;
    qryCapGobID_ACREDITADO: TFloatField;
    qryCapGobCVE_MONEDA: TFloatField;
    qryCapGobDESC_MONEDA: TStringField;
    qryCapGobB_APL_INSCR_DEUD: TStringField;
    qryCapGobNOM_ACREDITADO: TStringField;
    qryCapGobNOM_CALIFICADORA1: TStringField;
    qryCapGobNOM_CALIFICADORA2: TStringField;
    qryCapGobNOM_CALIFICADORA3: TStringField;
    qryCapGobNOM_CALIFICADORA4: TStringField;
    qryCapGobNOM_CALIFICADORA5: TStringField;
    qryCapGobNOM_CALIFICADORA6: TStringField;
    qryCapGobCVE_CALIFICACION1: TMemoField;
    qryCapGobCVE_CALIFICACION2: TMemoField;
    qryCapGobCVE_CALIFICACION3: TMemoField;
    qryCapGobCVE_CALIFICACION4: TMemoField;
    qryCapGobCVE_CALIFICACION5: TMemoField;
    qryCapGobCVE_CALIFICACION6: TMemoField;
    qryCapGobSDO_PROM_MES_ACT: TFloatField;
    qryCapGobSDO_PROM_MES_ANT: TFloatField;
    qryCapGobADEUDO_TOTAL: TFloatField;
    qryCapGobPCT_20: TFloatField;
    qryCapGobPCT_50: TFloatField;
    qryCapGobPCT_115: TFloatField;
    qryCapGobPCT_150: TFloatField;
    qrlbNOM_CALIFICADORA1: TQRLabel;
    qrlbNOM_CALIFICADORA2: TQRLabel;
    qrlbNOM_CALIFICADORA3: TQRLabel;
    qrlbNOM_CALIFICADORA4: TQRLabel;
    qrlbNOM_CALIFICADORA5: TQRLabel;
    qrlbNOM_CALIFICADORA6: TQRLabel;
    qryCapGobVARIACION: TFloatField;
    qryCapGobTX_B_APL_INSCR_DEUD: TStringField;
    procedure qrdbPCT_20Print(sender: TObject; var Value: String);
    procedure qrDetailAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    vgnRowExcel : Integer;
    vgB_SALIDA_EXCEL : Boolean;
    vgExcelApp : OleVariant;
    vgFileName : String;
  public
    Function FormaQuery(peID_EMPRESA, peCVE_MONEDA, peID_ACREDITADO : Integer;
                        peF_REFERENCIA : TDateTime; peREG_DEUDA_PUBLICA : String) : String;
  end;

var
  QrCapGob: TQrCapGob;

procedure RepCapGob( peID_EMPRESA, peCVE_MONEDA, peID_ACREDITADO : Integer;
                     peF_REFERENCIA : TDateTime; peREG_DEUDA_PUBLICA,
                     peFileName : String;
                     pAPli    : TInterApli;
                     pPreview : Boolean;
                     peB_SAVE_QRY_TO_FILE : Boolean);
Implementation
{$R *.DFM}

procedure RepCapGob( peID_EMPRESA, peCVE_MONEDA, peID_ACREDITADO : Integer;
                     peF_REFERENCIA : TDateTime; peREG_DEUDA_PUBLICA,
                     peFileName : String;
                     pAPli    : TInterApli;
                     pPreview : Boolean;
                     peB_SAVE_QRY_TO_FILE : Boolean);
Var
    QrCapGob : TQrCapGob;
    VLTitulo : String;
    Preview  : TIntQRPreview;
Begin
    VLTitulo := '';
    QrCapGob := TQrCapGob.Create(Nil);
    Preview  := TIntQRPreview.CreatePreview(Application, QrCapGob);
    If Assigned(QrCapGob) Then
     With QrCapGob Do
      Try
        QRInterEncabezado1.Apli:=pApli;
        QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QRInterEncabezado1.NomReporte:= 'IntMQrCapGob';
        QRInterEncabezado1.Titulo1:='Capitalización para Gobiernos y Municipios';
        QRInterEncabezado1.Titulo2 := 'Al '+FormatDateTime('DD/MM/YYY',peF_REFERENCIA);

        qryCapGob.DatabaseName := pApli.DataBaseName;
        qryCapGob.SessionName := pApli.SessionName;
        qryCapGob.Active:=False;
        qryCapGob.SQL.Text:= FormaQuery(peID_EMPRESA, peCVE_MONEDA, peID_ACREDITADO,
                                        peF_REFERENCIA, peREG_DEUDA_PUBLICA );

        If (peB_SAVE_QRY_TO_FILE) Then
         If SaveDialog.Execute Then
          qryCapGob.SQL.SaveToFile(SaveDialog.FileName);

        // Válida la generación del Archivo Excel
        vgB_SALIDA_EXCEL :=(Trim(peFileName) <> '');
        // Válida la generación del Archivo Excel
        vgB_SALIDA_EXCEL :=(Trim(peFileName) <> '');
        If (vgB_SALIDA_EXCEL) Then
          Begin
          vgFileName := peFileName;
          vgExcelApp := CreateOleObject('Excel.Application');
          vgExcelApp.Workbooks.Add;
          End;

        qryCapGob.Open;

        If pPreview Then
            QrCapGob.Preview
        Else
            QrCapGob.Print;
      Finally
        If (vgB_SALIDA_EXCEL) Then
          Begin
          vgExcelApp.ActiveWorkBook.SaveAs(peFileName);
          CloseExcelFile(vgExcelApp);
          End;
        qryCapGob.Close;
        QrCapGob.Free;
      End;
End;

Function TQrCapGob.FormaQuery(peID_EMPRESA, peCVE_MONEDA, peID_ACREDITADO : Integer;
                              peF_REFERENCIA : TDateTime; peREG_DEUDA_PUBLICA : String) : String;
Var
   vlSQL : String;
   vlID_EMPRESA, vlCVE_MONEDA, vlID_ACREDITADO, vlF_REFERENCIA : String;
Begin
   vlID_EMPRESA        := IntToStr(peID_EMPRESA);
   vlCVE_MONEDA        := IntToStr(peCVE_MONEDA);
   vlID_ACREDITADO     := IntToStr(peID_ACREDITADO);
   vlF_REFERENCIA      := SQLFecha(peF_REFERENCIA);

   //
   vlSQL :=
           {' SELECT '+coCRLF+
            '    R.*,'+coCRLF+
            '    DECODE(R.B_APL_INSCR_DEUD,''V'',''REGISTRADO EN DEUDA PÚBLICA'',''NO REGISTRADO EN DEUDA PÚBLICA'') AS TX_B_APL_INSCR_DEUD, '+coCRLF+
            '    (R.SDO_PROM_MES_ACT - R.SDO_PROM_MES_ANT) AS VARIACION'+coCRLF+
            ' FROM ('+coCRLF+
            '       SELECT '+coCRLF+
            '          R1.*, '+coCRLF+
            '          NVL(PKGCRGYM.GET_SDO_PROM_HIST_CAP_ACRED(R1.ID_ACREDITADO, ADD_MONTHS('+vlF_REFERENCIA+',-1), R1.B_APL_INSCR_DEUD), 0) AS SDO_PROM_MES_ANT '+coCRLF+
            '       FROM ( SELECT '+coCRLF+
            '                 DATOS.ID_ACREDITADO, '+coCRLF+
            '                 DATOS.CVE_MONEDA, '+coCRLF+
            '                 DATOS.DESC_MONEDA, '+coCRLF+
            '                 DATOS.B_APL_INSCR_DEUD,'+coCRLF+
            '                 DATOS.NOM_ACREDITADO, '+coCRLF+
            '                 DATOS.NOM_CALIFICADORA1, DATOS.NOM_CALIFICADORA2, '+coCRLF+
            '                 DATOS.NOM_CALIFICADORA3, DATOS.NOM_CALIFICADORA4, '+coCRLF+
            '                 DATOS.NOM_CALIFICADORA5, DATOS.NOM_CALIFICADORA6, '+coCRLF+
            '                 DATOS.CVE_CALIFICACION1, DATOS.CVE_CALIFICACION2, '+coCRLF+
            '                 DATOS.CVE_CALIFICACION3, DATOS.CVE_CALIFICACION4, '+coCRLF+
            '                 DATOS.CVE_CALIFICACION5, DATOS.CVE_CALIFICACION6, '+coCRLF+
            '                 SUM(NVL(DATOS.SDO_PROM_MES_ACT,0)) AS SDO_PROM_MES_ACT, '+coCRLF+
            '                 SUM(NVL(DATOS.ADEUDO_TOTAL,0)) AS ADEUDO_TOTAL, '+coCRLF+
            '                 SUM(DECODE(DATOS.PCT_PONDERACION,20,SDO_PROM_MES_ACT,NULL)) AS PCT_20, '+coCRLF+
            '                 SUM(DECODE(DATOS.PCT_PONDERACION,50,SDO_PROM_MES_ACT,NULL)) AS PCT_50, '+coCRLF+
            '                 SUM(DECODE(DATOS.PCT_PONDERACION,115,SDO_PROM_MES_ACT,NULL)) AS PCT_115, '+coCRLF+
            '                 SUM(DECODE(DATOS.PCT_PONDERACION,150,SDO_PROM_MES_ACT,NULL)) AS PCT_150 '+coCRLF+
            '             FROM '+coCRLF+
            '               ( SELECT '+coCRLF+
            '                     SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, CR_SECTOR_GOBMUN.ID_ACREDITADO, 2),1,255) AS NOM_ACREDITADO, '+coCRLF+
            '                     CR_SECTOR_GOBMUN.*, '+coCRLF+
            '                     ACRED_CALIFICADO_GYM.NOM_CALIFICADORA1, '+coCRLF+
            '                     ACRED_CALIFICADO_GYM.CVE_CALIFICACION1, '+coCRLF+
            '                     ACRED_CALIFICADO_GYM.NOM_CALIFICADORA2, '+coCRLF+
            '                     ACRED_CALIFICADO_GYM.CVE_CALIFICACION2, '+coCRLF+
            '                     ACRED_CALIFICADO_GYM.NOM_CALIFICADORA3, '+coCRLF+
            '                     ACRED_CALIFICADO_GYM.CVE_CALIFICACION3, '+coCRLF+
            '                     ACRED_CALIFICADO_GYM.NOM_CALIFICADORA4, '+coCRLF+
            '                     ACRED_CALIFICADO_GYM.CVE_CALIFICACION4, '+coCRLF+
            '                     ACRED_CALIFICADO_GYM.NOM_CALIFICADORA5, '+coCRLF+
            '                     ACRED_CALIFICADO_GYM.CVE_CALIFICACION5, '+coCRLF+
            '                     ACRED_CALIFICADO_GYM.NOM_CALIFICADORA6, '+coCRLF+
            '                     ACRED_CALIFICADO_GYM.CVE_CALIFICACION6, '+coCRLF+
            '                     PKGCRGYM.GET_ADEUDO_TOTAL_CAP(CR_SECTOR_GOBMUN.ID_CREDITO, '+vlF_REFERENCIA+') AS ADEUDO_TOTAL, '+coCRLF+
            '                     NVL(PKGCRSICC.GET_PCT_POND_CAPITALIZA(1, CR_SECTOR_GOBMUN.ID_CONTRATO, '+vlF_REFERENCIA+'),150) AS PCT_PONDERACION, '+coCRLF+
            '                     PKGCRGYM.GET_SDO_PROMEDIO_COINCRE(CR_SECTOR_GOBMUN.ID_CREDITO, '+vlF_REFERENCIA+') AS SDO_PROM_MES_ACT '+coCRLF+
            '                 FROM '+coCRLF+
            '                      (  /* Obtiene los ACREDITADOS CALIFICADOS POR LAS AGENCIAS CALIFICADORAS de Gobiernos y Municipios */ '+coCRLF+
            '                         SELECT '+coCRLF+
            '                             ACRED_CALIFICADO.* '+coCRLF+
            '                         FROM ( '+coCRLF+
            '                               SELECT '+coCRLF+
            '                                   CRCA.ID_ACREDITADO AS ACREDITADO, '+coCRLF+
            '                                   CALIF.NOM_CALIFICADORA1, '+coCRLF+
            '                                   PKGCRSICC.GET_ULTIMA_CALIF_ACRED(CRCA.ID_ACREDITADO, CALIF.ID_CALIFICADORA1, ''RIESGO'', '+coCRLF+
            '                                                                    '+vlF_REFERENCIA+') AS CVE_CALIFICACION1, '+coCRLF+
            '                                   CALIF.NOM_CALIFICADORA2, '+coCRLF+
            '                                   PKGCRSICC.GET_ULTIMA_CALIF_ACRED(CRCA.ID_ACREDITADO, CALIF.ID_CALIFICADORA2, ''RIESGO'', '+coCRLF+
            '                                                                    '+vlF_REFERENCIA+') AS CVE_CALIFICACION2, '+coCRLF+
            '                                   CALIF.NOM_CALIFICADORA3, '+coCRLF+
            '                                   PKGCRSICC.GET_ULTIMA_CALIF_ACRED(CRCA.ID_ACREDITADO, CALIF.ID_CALIFICADORA3, ''RIESGO'', '+coCRLF+
            '                                                                    '+vlF_REFERENCIA+') AS CVE_CALIFICACION3, '+coCRLF+
            '                                   CALIF.NOM_CALIFICADORA4, '+coCRLF+
            '                                   PKGCRSICC.GET_ULTIMA_CALIF_ACRED(CRCA.ID_ACREDITADO, CALIF.ID_CALIFICADORA4, ''RIESGO'', '+coCRLF+
            '                                                                    '+vlF_REFERENCIA+') AS CVE_CALIFICACION4, '+coCRLF+
            '                                   CALIF.NOM_CALIFICADORA5, '+coCRLF+
            '                                   PKGCRSICC.GET_ULTIMA_CALIF_ACRED(CRCA.ID_ACREDITADO, CALIF.ID_CALIFICADORA5, ''RIESGO'', '+coCRLF+
            '                                                                    '+vlF_REFERENCIA+') AS CVE_CALIFICACION5, '+coCRLF+
            '                                   CALIF.NOM_CALIFICADORA6, '+coCRLF+
            '                                   PKGCRSICC.GET_ULTIMA_CALIF_ACRED(CRCA.ID_ACREDITADO, CALIF.ID_CALIFICADORA6, ''RIESGO'', '+coCRLF+
            '                                                                    '+vlF_REFERENCIA+') AS CVE_CALIFICACION6 '+coCRLF+
            '                               FROM '+coCRLF+
            '                                   (SELECT * FROM CR_REL_CAL_ACRE) CRCA, '+coCRLF+
            '                                   (SELECT MAX(DECODE(ROWNUM,1, ID_CALIFICADORA, -1)) AS ID_CALIFICADORA1, '+coCRLF+
            '                                           MAX(DECODE(ROWNUM,1, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA1, '+coCRLF+
            '                                           MAX(DECODE(ROWNUM,2, ID_CALIFICADORA, -1)) AS ID_CALIFICADORA2, '+coCRLF+
            '                                           MAX(DECODE(ROWNUM,2, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA2, '+coCRLF+
            '                                           MAX(DECODE(ROWNUM,3, ID_CALIFICADORA, -1)) AS ID_CALIFICADORA3, '+coCRLF+
            '                                           MAX(DECODE(ROWNUM,3, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA3, '+coCRLF+
            '                                           MAX(DECODE(ROWNUM,4, ID_CALIFICADORA, -1)) AS ID_CALIFICADORA4, '+coCRLF+
            '                                           MAX(DECODE(ROWNUM,4, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA4, '+coCRLF+
            '                                           MAX(DECODE(ROWNUM,5, ID_CALIFICADORA, -1)) AS ID_CALIFICADORA5, '+coCRLF+
            '                                           MAX(DECODE(ROWNUM,5, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA5, '+coCRLF+
            '                                           MAX(DECODE(ROWNUM,6, ID_CALIFICADORA, -1)) AS ID_CALIFICADORA6, '+coCRLF+
            '                                           MAX(DECODE(ROWNUM,6, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA6 '+coCRLF+
            '                                      FROM (SELECT ID_CALIFICADORA, '+coCRLF+
            '                                                   SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, ID_CALIFICADORA), 1, 255) AS NOM_CALIFICADORA '+coCRLF+
            '                                              FROM CR_CALIFICADORA '+coCRLF+
            '                                             WHERE SIT_CALIFICADORA <> ''CA'' '+coCRLF+
            '                                             ORDER BY NOM_CALIFICADORA) '+coCRLF+
            '                                    ) CALIF '+coCRLF+
            '                               GROUP BY '+coCRLF+
            '                                   CRCA.ID_ACREDITADO, '+coCRLF+
            '                                   CALIF.NOM_CALIFICADORA1, CALIF.NOM_CALIFICADORA2, '+coCRLF+
            '                                   CALIF.NOM_CALIFICADORA3, CALIF.NOM_CALIFICADORA4, '+coCRLF+
            '                                   CALIF.NOM_CALIFICADORA5, CALIF.NOM_CALIFICADORA6, '+coCRLF+
            '                                   CALIF.ID_CALIFICADORA1, CALIF.ID_CALIFICADORA2, '+coCRLF+
            '                                   CALIF.ID_CALIFICADORA3, CALIF.ID_CALIFICADORA4, '+coCRLF+
            '                                   CALIF.ID_CALIFICADORA5, CALIF.ID_CALIFICADORA6 '+coCRLF+
            '                              ) ACRED_CALIFICADO '+coCRLF+
            '                      ) ACRED_CALIFICADO_GYM, '+coCRLF+
            '                      ( SELECT CC_SECTOR_GOBMUN.ID_EMPRESA, CC_SECTOR_GOBMUN.ID_CONTRATO,'+coCRLF+
            '                               CC_SECTOR_GOBMUN.ID_ACREDITADO, CC_SECTOR_GOBMUN.CVE_MONEDA,'+coCRLF+
            '                               CC_SECTOR_GOBMUN.DESC_MONEDA, CC_SECTOR_GOBMUN.B_APL_INSCR_DEUD,'+coCRLF+
            '                               CC_SECTOR_GOBMUN.ID_CREDITO'+coCRLF+
            '                        FROM CRE_RESUMEN CR,'+coCRLF+
            '                            ( SELECT SECTOR_GOBMUN.*, CC.ID_CREDITO'+coCRLF+
            '                              FROM ( SELECT CTO.ID_EMPRESA,'+coCRLF+
            '                                            CTO.ID_CONTRATO,'+coCRLF+
            '                                            CA.ID_ACREDITADO,'+coCRLF+
            '                                            M.CVE_MONEDA,'+coCRLF+
            '                                            M.DESC_MONEDA,'+coCRLF+
//            '                                            NVL(CO.B_APL_INSCR_DEUD,''F'') AS B_APL_INSCR_DEUD'+coCRLF+
            '                                            DECODE(UPPER(TRIM(CO.CVE_TIP_INSCR_D)), ''FE'', ''V'', ''EF'', ''V'', ''F'') AS B_APL_INSCR_DEUD'+coCRLF+
            '                                     FROM CONTRATO CTO,'+coCRLF+
            '                                          CR_CONTRATO CO,'+coCRLF+
            '                                          MONEDA M,'+coCRLF+
            '                                          (  SELECT ID_ACREDITADO'+coCRLF+
            '                                             FROM ( SELECT ID_ACREDITADO FROM CR_ACREDITADO WHERE SIT_ACREDITADO <> ''CA'') CA,'+coCRLF+
            '                                                    PERSONA P'+coCRLF+
            '                                             WHERE P.ID_PERSONA = CA.ID_ACREDITADO'+coCRLF+
            '                                               AND P.CVE_TIPO_SECTOR = ''13'''+coCRLF+
            '                                          ) CA'+coCRLF+
            '                                    WHERE CTO.ID_TITULAR = CA.ID_ACREDITADO'+coCRLF+
            '                                      AND M.CVE_MONEDA = CTO.CVE_MONEDA'+coCRLF+
            '                                      AND CO.ID_CONTRATO = CTO.ID_CONTRATO'+coCRLF+
            '                                   ) SECTOR_GOBMUN,'+coCRLF+
            '                                   ( SELECT ID_CREDITO, ID_CONTRATO FROM CR_CREDITO'+coCRLF+
            '                                     WHERE SIT_CREDITO NOT IN (''PA'',''CA'') ) CC'+coCRLF+
            '                             WHERE CC.ID_CONTRATO = SECTOR_GOBMUN.ID_CONTRATO'+coCRLF+
            '             '+coCRLF+
            '                           UNION ALL'+coCRLF+
            '             '+coCRLF+
            '                              SELECT SECTOR_GOBMUN_CRED.*, CC.ID_CREDITO'+coCRLF+
            '                              FROM ( SELECT CTO.ID_EMPRESA,'+coCRLF+
            '                                            CTO.ID_CONTRATO,'+coCRLF+
            '                                            P.ID_PERSONA AS ID_ACREDITADO,'+coCRLF+
            '                                            M.CVE_MONEDA,'+coCRLF+
            '                                            M.DESC_MONEDA,'+coCRLF+
//            '                                            NVL(COI.B_APL_INSCR_DEUD,''F'') AS B_APL_INSCR_DEUD'+coCRLF+
            '                                            DECODE(UPPER(TRIM(COI.CVE_TIP_INSCR_D)), ''FE'', ''V'', ''EF'', ''V'', ''F'') AS B_APL_INSCR_DEUD'+coCRLF+
            '                                            -- Como la Inscripción de deuda no existe en Intercréditos,'+coCRLF+
            '                                            -- se toma de ICRE en caso de que exista el contrato'+coCRLF+
            '                                     FROM CONTRATO CTO,'+coCRLF+
            '                                          CRE_CONTRATO CO,'+coCRLF+
            '                                          CR_CONTRATO COI,'+coCRLF+
            '                                          MONEDA M,'+coCRLF+
            '                                          (  SELECT * FROM PERSONA'+coCRLF+
            '                                             WHERE CVE_TIPO_SECTOR = ''13'''+coCRLF+
            '                                          ) P'+coCRLF+
            '                                    WHERE CTO.ID_TITULAR = P.ID_PERSONA'+coCRLF+
            '                                      AND M.CVE_MONEDA = CTO.CVE_MONEDA'+coCRLF+
            '                                      AND CO.ID_CONTRATO = CTO.ID_CONTRATO'+coCRLF+
            '                                      AND COI.ID_CONTRATO (+)= CO.ID_CONTRATO'+coCRLF+
            '                                   ) SECTOR_GOBMUN_CRED,'+coCRLF+
            '                                   ( SELECT ID_CREDITO, ID_CONTRATO FROM CRE_CREDITO'+coCRLF+
            '                                     WHERE SIT_CREDITO NOT IN (''CA'',''TA'') ) CC'+coCRLF+
            '                             WHERE CC.ID_CONTRATO = SECTOR_GOBMUN_CRED.ID_CONTRATO'+coCRLF+
            '                            ) CC_SECTOR_GOBMUN'+coCRLF+
            '                        WHERE CR.ID_CREDITO = CC_SECTOR_GOBMUN.ID_CREDITO'+coCRLF+
            '                          AND CR.F_RESUMEN BETWEEN TO_DATE(''01''||SUBSTR(TO_CHAR('+vlF_REFERENCIA+',''DD/MM/YYYY''),3,8),''DD/MM/YYYY'') AND LAST_DAY('+vlF_REFERENCIA+')'+coCRLF+
            '                        GROUP BY CC_SECTOR_GOBMUN.ID_EMPRESA, CC_SECTOR_GOBMUN.ID_CONTRATO,'+coCRLF+
            '                                 CC_SECTOR_GOBMUN.ID_ACREDITADO, CC_SECTOR_GOBMUN.CVE_MONEDA,'+coCRLF+
            '                                 CC_SECTOR_GOBMUN.DESC_MONEDA, CC_SECTOR_GOBMUN.B_APL_INSCR_DEUD,'+coCRLF+
            '                                 CC_SECTOR_GOBMUN.ID_CREDITO'+coCRLF+
            '                     ) CR_SECTOR_GOBMUN '+coCRLF+
            '                 WHERE ACRED_CALIFICADO_GYM.ACREDITADO (+)= CR_SECTOR_GOBMUN.ID_ACREDITADO '+coCRLF+
            '                     /* Filtros */ '+coCRLF+
            '                     AND CR_SECTOR_GOBMUN.ID_EMPRESA = DECODE('+vlID_EMPRESA+',0,CR_SECTOR_GOBMUN.ID_EMPRESA,'+vlID_EMPRESA+') '+coCRLF+
            '                     AND CR_SECTOR_GOBMUN.ID_ACREDITADO = DECODE('+vlID_ACREDITADO+',0,CR_SECTOR_GOBMUN.ID_ACREDITADO,'+vlID_ACREDITADO+') '+coCRLF+
            '                     AND CR_SECTOR_GOBMUN.CVE_MONEDA = DECODE('+vlCVE_MONEDA+',0,CR_SECTOR_GOBMUN.CVE_MONEDA,'+vlCVE_MONEDA+') '+coCRLF+
            '                     AND NVL(CR_SECTOR_GOBMUN.B_APL_INSCR_DEUD,'' '') = DECODE('+SQLStr(peREG_DEUDA_PUBLICA)+',''0'',NVL(CR_SECTOR_GOBMUN.B_APL_INSCR_DEUD,'' ''),'+SQLStr(peREG_DEUDA_PUBLICA)+') '+coCRLF+
            '                    ) DATOS '+coCRLF+
            '             GROUP BY '+coCRLF+
            '                 ID_ACREDITADO, '+coCRLF+
            '                 CVE_MONEDA,    DESC_MONEDA, '+coCRLF+
            '                 B_APL_INSCR_DEUD,  NOM_ACREDITADO, '+coCRLF+
            '                 NOM_CALIFICADORA1, DATOS.NOM_CALIFICADORA2, '+coCRLF+
            '                 NOM_CALIFICADORA3, DATOS.NOM_CALIFICADORA4, '+coCRLF+
            '                 NOM_CALIFICADORA5, DATOS.NOM_CALIFICADORA6, '+coCRLF+
            '                 CVE_CALIFICACION1, DATOS.CVE_CALIFICACION2, '+coCRLF+
            '                 CVE_CALIFICACION3, DATOS.CVE_CALIFICACION4, '+coCRLF+
            '                 CVE_CALIFICACION5, DATOS.CVE_CALIFICACION6 '+coCRLF+
            '       ) R1'+coCRLF+
            '   ) R'+coCRLF+
            ' ORDER BY '+coCRLF+
            '     R.CVE_MONEDA, '+coCRLF+
            '     TX_B_APL_INSCR_DEUD, '+coCRLF+
            '     R.NOM_ACREDITADO '+coCRLF}


            ' SELECT'+coCRLF+
            '    R.*,'+coCRLF+
            '    DECODE(R.B_APL_INSCR_DEUD,''V'',''REGISTRADO EN DEUDA PÚBLICA'',''NO REGISTRADO EN DEUDA PÚBLICA'') AS TX_B_APL_INSCR_DEUD,'+coCRLF+
            '    (R.SDO_PROM_MES_ACT - R.SDO_PROM_MES_ANT) AS VARIACION'+coCRLF+
            ' FROM ('+coCRLF+
            '       SELECT'+coCRLF+
            '          R1.*,'+coCRLF+
            '          NVL(SPM_MES_ANT.SDO_PROMEDIO, 0) AS SDO_PROM_MES_ANT'+coCRLF+
            '       FROM ( SELECT'+coCRLF+
            '                 DATOS.ID_ACREDITADO,'+coCRLF+
            '                 DATOS.CVE_MONEDA,'+coCRLF+
            '                 DATOS.DESC_MONEDA,'+coCRLF+
            '                 DATOS.B_APL_INSCR_DEUD,'+coCRLF+
            '                 DATOS.NOM_ACREDITADO,'+coCRLF+
            '                 DATOS.NOM_CALIFICADORA1, DATOS.NOM_CALIFICADORA2,'+coCRLF+
            '                 DATOS.NOM_CALIFICADORA3, DATOS.NOM_CALIFICADORA4,'+coCRLF+
            '                 DATOS.NOM_CALIFICADORA5, DATOS.NOM_CALIFICADORA6,'+coCRLF+
            '                 DATOS.CVE_CALIFICACION1, DATOS.CVE_CALIFICACION2,'+coCRLF+
            '                 DATOS.CVE_CALIFICACION3, DATOS.CVE_CALIFICACION4,'+coCRLF+
            '                 DATOS.CVE_CALIFICACION5, DATOS.CVE_CALIFICACION6,'+coCRLF+
            '                 SUM(NVL(DATOS.SDO_PROM_MES_ACT,0)) AS SDO_PROM_MES_ACT,'+coCRLF+
            '                 SUM(NVL(DATOS.ADEUDO_TOTAL,0)) AS ADEUDO_TOTAL,'+coCRLF+
            '                 SUM(DECODE(DATOS.PCT_PONDERACION,20,SDO_PROM_MES_ACT,NULL)) AS PCT_20,'+coCRLF+
            '                 SUM(DECODE(DATOS.PCT_PONDERACION,50,SDO_PROM_MES_ACT,NULL)) AS PCT_50,'+coCRLF+
            '                 SUM(DECODE(DATOS.PCT_PONDERACION,115,SDO_PROM_MES_ACT,NULL)) AS PCT_115,'+coCRLF+
            '                 SUM(DECODE(DATOS.PCT_PONDERACION,150,SDO_PROM_MES_ACT,NULL)) AS PCT_150'+coCRLF+
            '             FROM'+coCRLF+
            '               ( SELECT'+coCRLF+
            '                     SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, CR_SECTOR_GOBMUN.ID_ACREDITADO, 2),1,255) AS NOM_ACREDITADO,'+coCRLF+
            '                     CR_SECTOR_GOBMUN.*,'+coCRLF+
            '                     ACRED_CALIFICADO_GYM.NOM_CALIFICADORA1,'+coCRLF+
            '                     ACRED_CALIFICADO_GYM.CVE_CALIFICACION1,'+coCRLF+
            '                     ACRED_CALIFICADO_GYM.NOM_CALIFICADORA2,'+coCRLF+
            '                     ACRED_CALIFICADO_GYM.CVE_CALIFICACION2,'+coCRLF+
            '                     ACRED_CALIFICADO_GYM.NOM_CALIFICADORA3,'+coCRLF+
            '                     ACRED_CALIFICADO_GYM.CVE_CALIFICACION3,'+coCRLF+
            '                     ACRED_CALIFICADO_GYM.NOM_CALIFICADORA4,'+coCRLF+
            '                     ACRED_CALIFICADO_GYM.CVE_CALIFICACION4,'+coCRLF+
            '                     ACRED_CALIFICADO_GYM.NOM_CALIFICADORA5,'+coCRLF+
            '                     ACRED_CALIFICADO_GYM.CVE_CALIFICACION5,'+coCRLF+
            '                     ACRED_CALIFICADO_GYM.NOM_CALIFICADORA6,'+coCRLF+
            '                     ACRED_CALIFICADO_GYM.CVE_CALIFICACION6,'+coCRLF+
            '                     SPM_MES_ACT.SDO_TOT_K AS ADEUDO_TOTAL,'+coCRLF+
            '                     DECODE( CR_SECTOR_GOBMUN.B_APL_INSCR_DEUD, ''F'', 150, '+coCRLF+
            '                             NVL(PKGCRSICC.GET_PCT_POND_CAPITALIZA(1, CR_SECTOR_GOBMUN.ID_CONTRATO, ' + vlF_REFERENCIA + '),150) ) AS PCT_PONDERACION,'+coCRLF+
            '                     SPM_MES_ACT.SDO_PROMEDIO AS SDO_PROM_MES_ACT'+coCRLF+
            '                 FROM'+coCRLF+
            '                      (  /* Obtiene los ACREDITADOS CALIFICADOS POR LAS AGENCIAS CALIFICADORAS de Gobiernos y Municipios */'+coCRLF+
            '                         SELECT'+coCRLF+
            '                             ACRED_CALIFICADO.*'+coCRLF+
            '                         FROM ('+coCRLF+
            '                               SELECT'+coCRLF+
            '                                   CRCA.ID_ACREDITADO AS ACREDITADO,'+coCRLF+
            '                                   CALIF.NOM_CALIFICADORA1,'+coCRLF+
            '                                   PKGCRSICC.GET_ULTIMA_CALIF_ACRED(CRCA.ID_ACREDITADO, CALIF.ID_CALIFICADORA1, ''RIESGO'','+coCRLF+
            '                                                        ' + vlF_REFERENCIA + ') AS CVE_CALIFICACION1,'+coCRLF+
            '                                   CALIF.NOM_CALIFICADORA2,'+coCRLF+
            '                                   PKGCRSICC.GET_ULTIMA_CALIF_ACRED(CRCA.ID_ACREDITADO, CALIF.ID_CALIFICADORA2, ''RIESGO'','+coCRLF+
            '                                                        ' + vlF_REFERENCIA + ') AS CVE_CALIFICACION2,'+coCRLF+
            '                                   CALIF.NOM_CALIFICADORA3,'+coCRLF+
            '                                   PKGCRSICC.GET_ULTIMA_CALIF_ACRED(CRCA.ID_ACREDITADO, CALIF.ID_CALIFICADORA3, ''RIESGO'','+coCRLF+
            '                                                        ' + vlF_REFERENCIA + ') AS CVE_CALIFICACION3,'+coCRLF+
            '                                   CALIF.NOM_CALIFICADORA4,'+coCRLF+
            '                                   PKGCRSICC.GET_ULTIMA_CALIF_ACRED(CRCA.ID_ACREDITADO, CALIF.ID_CALIFICADORA4, ''RIESGO'','+coCRLF+
            '                                                        ' + vlF_REFERENCIA + ') AS CVE_CALIFICACION4,'+coCRLF+
            '                                   CALIF.NOM_CALIFICADORA5,'+coCRLF+
            '                                   PKGCRSICC.GET_ULTIMA_CALIF_ACRED(CRCA.ID_ACREDITADO, CALIF.ID_CALIFICADORA5, ''RIESGO'','+coCRLF+
            '                                                        ' + vlF_REFERENCIA + ') AS CVE_CALIFICACION5,'+coCRLF+
            '                                   CALIF.NOM_CALIFICADORA6,'+coCRLF+
            '                                   PKGCRSICC.GET_ULTIMA_CALIF_ACRED(CRCA.ID_ACREDITADO, CALIF.ID_CALIFICADORA6, ''RIESGO'','+coCRLF+
            '                                                        ' + vlF_REFERENCIA + ') AS CVE_CALIFICACION6'+coCRLF+
            '                               FROM'+coCRLF+
            '                                   (SELECT * FROM CR_REL_CAL_ACRE) CRCA,'+coCRLF+
            '                                   (SELECT MAX(DECODE(ROWNUM,1, ID_CALIFICADORA, -1)) AS ID_CALIFICADORA1,'+coCRLF+
            '                                           MAX(DECODE(ROWNUM,1, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA1,'+coCRLF+
            '                                           MAX(DECODE(ROWNUM,2, ID_CALIFICADORA, -1)) AS ID_CALIFICADORA2,'+coCRLF+
            '                                           MAX(DECODE(ROWNUM,2, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA2,'+coCRLF+
            '                                           MAX(DECODE(ROWNUM,3, ID_CALIFICADORA, -1)) AS ID_CALIFICADORA3,'+coCRLF+
            '                                           MAX(DECODE(ROWNUM,3, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA3,'+coCRLF+
            '                                           MAX(DECODE(ROWNUM,4, ID_CALIFICADORA, -1)) AS ID_CALIFICADORA4,'+coCRLF+
            '                                           MAX(DECODE(ROWNUM,4, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA4,'+coCRLF+
            '                                           MAX(DECODE(ROWNUM,5, ID_CALIFICADORA, -1)) AS ID_CALIFICADORA5,'+coCRLF+
            '                                           MAX(DECODE(ROWNUM,5, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA5,'+coCRLF+
            '                                           MAX(DECODE(ROWNUM,6, ID_CALIFICADORA, -1)) AS ID_CALIFICADORA6,'+coCRLF+
            '                                           MAX(DECODE(ROWNUM,6, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA6'+coCRLF+
            '                                      FROM (SELECT ID_CALIFICADORA,'+coCRLF+
            '                                                   SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, ID_CALIFICADORA), 1, 255) AS NOM_CALIFICADORA'+coCRLF+
            '                                              FROM CR_CALIFICADORA'+coCRLF+
            '                                             WHERE SIT_CALIFICADORA <> ''CA'''+coCRLF+
            '                                             ORDER BY NOM_CALIFICADORA)'+coCRLF+
            '                                    ) CALIF'+coCRLF+
            '                               GROUP BY'+coCRLF+
            '                                   CRCA.ID_ACREDITADO,'+coCRLF+
            '                                   CALIF.NOM_CALIFICADORA1, CALIF.NOM_CALIFICADORA2,'+coCRLF+
            '                                   CALIF.NOM_CALIFICADORA3, CALIF.NOM_CALIFICADORA4,'+coCRLF+
            '                                   CALIF.NOM_CALIFICADORA5, CALIF.NOM_CALIFICADORA6,'+coCRLF+
            '                                   CALIF.ID_CALIFICADORA1, CALIF.ID_CALIFICADORA2,'+coCRLF+
            '                                   CALIF.ID_CALIFICADORA3, CALIF.ID_CALIFICADORA4,'+coCRLF+
            '                                   CALIF.ID_CALIFICADORA5, CALIF.ID_CALIFICADORA6'+coCRLF+
            '                              ) ACRED_CALIFICADO'+coCRLF+
            '                      ) ACRED_CALIFICADO_GYM,'+coCRLF+
            '                      ( SELECT CC_SECTOR_GOBMUN.ID_EMPRESA, CC_SECTOR_GOBMUN.ID_CONTRATO,'+coCRLF+
            '                               CC_SECTOR_GOBMUN.ID_ACREDITADO, CC_SECTOR_GOBMUN.CVE_MONEDA,'+coCRLF+
            '                               CC_SECTOR_GOBMUN.DESC_MONEDA, CC_SECTOR_GOBMUN.B_APL_INSCR_DEUD,'+coCRLF+
            '                               CC_SECTOR_GOBMUN.ID_CREDITO'+coCRLF+
            '                        FROM CRE_RESUMEN CR,'+coCRLF+
            '                            ( SELECT SECTOR_GOBMUN.*, CC.ID_CREDITO'+coCRLF+
            '                              FROM ( SELECT CTO.ID_EMPRESA,'+coCRLF+
            '                                            CTO.ID_CONTRATO,'+coCRLF+
            '                                            CA.ID_ACREDITADO,'+coCRLF+
            '                                            M.CVE_MONEDA,'+coCRLF+
            '                                            M.DESC_MONEDA,'+coCRLF+
            '                                            DECODE(UPPER(TRIM(CO.CVE_TIP_INSCR_D)), ''FE'', ''V'', ''EF'', ''V'', ''F'') AS B_APL_INSCR_DEUD'+coCRLF+
            '                                     FROM CONTRATO CTO,'+coCRLF+
            '                                          CR_CONTRATO CO,'+coCRLF+
            '                                          MONEDA M,'+coCRLF+
            '                                          (  SELECT ID_ACREDITADO'+coCRLF+
            '                                             FROM ( SELECT ID_ACREDITADO FROM CR_ACREDITADO WHERE SIT_ACREDITADO <> ''CA'') CA,'+coCRLF+
            '                                                    PERSONA P'+coCRLF+
            '                                             WHERE P.ID_PERSONA = CA.ID_ACREDITADO'+coCRLF+
            '                                               AND P.CVE_TIPO_SECTOR = ''13'''+coCRLF+
            '                                          ) CA'+coCRLF+
            '                                    WHERE CTO.ID_TITULAR = CA.ID_ACREDITADO'+coCRLF+
            '                                      AND M.CVE_MONEDA = CTO.CVE_MONEDA'+coCRLF+
            '                                      AND CO.ID_CONTRATO = CTO.ID_CONTRATO'+coCRLF+
            '                                   ) SECTOR_GOBMUN,'+coCRLF+
            '                                   ( SELECT ID_CREDITO, ID_CONTRATO FROM CR_CREDITO'+coCRLF+
            '                                     WHERE SIT_CREDITO NOT IN (''PA'',''CA'') ) CC'+coCRLF+
            '                             WHERE CC.ID_CONTRATO = SECTOR_GOBMUN.ID_CONTRATO'+coCRLF+
            ''+coCRLF+
            '                           UNION ALL'+coCRLF+
            ''+coCRLF+
            '                              SELECT SECTOR_GOBMUN_CRED.*, CC.ID_CREDITO'+coCRLF+
            '                              FROM ( SELECT CTO.ID_EMPRESA,'+coCRLF+
            '                                            CTO.ID_CONTRATO,'+coCRLF+
            '                                            P.ID_PERSONA AS ID_ACREDITADO,'+coCRLF+
            '                                            M.CVE_MONEDA,'+coCRLF+
            '                                            M.DESC_MONEDA,'+coCRLF+
            '                                            DECODE(UPPER(TRIM(COI.CVE_TIP_INSCR_D)), ''FE'', ''V'', ''EF'', ''V'', ''F'') AS B_APL_INSCR_DEUD'+coCRLF+
            '                                            -- Como la Inscripción de deuda no existe en Intercréditos,'+coCRLF+
            '                                            -- se toma de ICRE en caso de que exista el contrato'+coCRLF+
            '                                     FROM CONTRATO CTO,'+coCRLF+
            '                                          CRE_CONTRATO CO,'+coCRLF+
            '                                          CR_CONTRATO COI,'+coCRLF+
            '                                          MONEDA M,'+coCRLF+
            '                                          (  SELECT * FROM PERSONA'+coCRLF+
            '                                             WHERE CVE_TIPO_SECTOR = ''13'''+coCRLF+
            '                                          ) P'+coCRLF+
            '                                    WHERE CTO.ID_TITULAR = P.ID_PERSONA'+coCRLF+
            '                                      AND M.CVE_MONEDA = CTO.CVE_MONEDA'+coCRLF+
            '                                      AND CO.ID_CONTRATO = CTO.ID_CONTRATO'+coCRLF+
            '                                      AND COI.ID_CONTRATO (+)= CO.ID_CONTRATO'+coCRLF+
            '                                   ) SECTOR_GOBMUN_CRED,'+coCRLF+
            '                                   ( SELECT ID_CREDITO, ID_CONTRATO FROM CRE_CREDITO'+coCRLF+
            '                                     WHERE SIT_CREDITO NOT IN (''CA'',''TA'') ) CC'+coCRLF+
            '                             WHERE CC.ID_CONTRATO = SECTOR_GOBMUN_CRED.ID_CONTRATO'+coCRLF+
            '                            ) CC_SECTOR_GOBMUN'+coCRLF+
            '                        WHERE CR.ID_CREDITO = CC_SECTOR_GOBMUN.ID_CREDITO'+coCRLF+
            '                          AND CR.F_RESUMEN BETWEEN TO_DATE(''01''||SUBSTR(TO_CHAR(' + vlF_REFERENCIA + ',''DD/MM/YYYY''),3,8),''DD/MM/YYYY'') AND LAST_DAY(' + vlF_REFERENCIA + ')'+coCRLF+
            '                        GROUP BY CC_SECTOR_GOBMUN.ID_EMPRESA, CC_SECTOR_GOBMUN.ID_CONTRATO,'+coCRLF+
            '                                 CC_SECTOR_GOBMUN.ID_ACREDITADO, CC_SECTOR_GOBMUN.CVE_MONEDA,'+coCRLF+
            '                                 CC_SECTOR_GOBMUN.DESC_MONEDA, CC_SECTOR_GOBMUN.B_APL_INSCR_DEUD,'+coCRLF+
            '                                 CC_SECTOR_GOBMUN.ID_CREDITO'+coCRLF+
            '                     ) CR_SECTOR_GOBMUN,'+coCRLF+
            '                     ( -- Este query es para obtener el Saldo Promedio del MES Actual por Disposición'+coCRLF+
            '                       SELECT DCDC.CREDITO AS ID_CREDITO,'+coCRLF+
            '                              (NVL(IMP_SDO_K_VIG,0) + NVL(IMP_SDO_K_IMP,0) + NVL(IMP_SDO_K_VEN,0)) AS SDO_TOT_K,'+coCRLF+
            '                              (NVL(IMP_SPM_K_VIG,0) + NVL(IMP_SPM_K_IMP,0) + NVL(IMP_SPM_K_VEN,0)) AS SDO_PROMEDIO'+coCRLF+
            '                       FROM DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
            '                            DM_CR_DIM_CREDITO@DWHC DCDC,'+coCRLF+
            '                            ( SELECT DCDM.ANIO, DCDM.MES, DCDM.ID_ANIO_MES'+coCRLF+
            '                              FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
            '                              WHERE DCDM.NUM_MES = TO_NUMBER(TO_CHAR(' + vlF_REFERENCIA + ',''MM''))'+coCRLF+
            '                                AND DCDM.ANIO = TO_NUMBER(TO_CHAR(' + vlF_REFERENCIA + ',''YYYY''))'+coCRLF+
            '                            ) DCDM'+coCRLF+
            '                       WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
            '                         AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
            '                         AND (DCDC.ID_OLTP_PRODUCTO NOT LIKE ''%N%'')'+coCRLF+
            '                    ) SPM_MES_ACT'+coCRLF+
            '                 WHERE ACRED_CALIFICADO_GYM.ACREDITADO (+)= CR_SECTOR_GOBMUN.ID_ACREDITADO'+coCRLF;

    //Filtros

    If (peID_EMPRESA > 0) Then
      vlSQL := vlSQL + '                     AND CR_SECTOR_GOBMUN.ID_EMPRESA = '+vlID_EMPRESA+coCRLF;

    If (peID_ACREDITADO > 0) Then
      vlSQL := vlSQL + '                     AND CR_SECTOR_GOBMUN.ID_ACREDITADO = '+vlID_ACREDITADO+coCRLF;

    If (peCVE_MONEDA > 0) Then
      vlSQL := vlSQL + '                     AND CR_SECTOR_GOBMUN.CVE_MONEDA = '+vlCVE_MONEDA+coCRLF;

    If (peREG_DEUDA_PUBLICA <> '0') Then
      vlSQL := vlSQL + '                     AND NVL(CR_SECTOR_GOBMUN.B_APL_INSCR_DEUD,''F'') = '+SQLStr(peREG_DEUDA_PUBLICA)+coCRLF;

    vlSQL := vlSQL+
            '                   AND SPM_MES_ACT.ID_CREDITO = CR_SECTOR_GOBMUN.ID_CREDITO'+coCRLF+
            '                    ) DATOS'+coCRLF+
            '             GROUP BY'+coCRLF+
            '                 ID_ACREDITADO,'+coCRLF+
            '                 CVE_MONEDA,    DESC_MONEDA,'+coCRLF+
            '                 B_APL_INSCR_DEUD,  NOM_ACREDITADO,'+coCRLF+
            '                 NOM_CALIFICADORA1, DATOS.NOM_CALIFICADORA2,'+coCRLF+
            '                 NOM_CALIFICADORA3, DATOS.NOM_CALIFICADORA4,'+coCRLF+
            '                 NOM_CALIFICADORA5, DATOS.NOM_CALIFICADORA6,'+coCRLF+
            '                 CVE_CALIFICACION1, DATOS.CVE_CALIFICACION2,'+coCRLF+
            '                 CVE_CALIFICACION3, DATOS.CVE_CALIFICACION4,'+coCRLF+
            '                 CVE_CALIFICACION5, DATOS.CVE_CALIFICACION6'+coCRLF+
            '       ) R1,'+coCRLF+
            '       (  -- Este query es para obtener el Saldo Promedio del MES Anterior del Acreditado'+coCRLF+
            '          SELECT DCDC.ID_OLTP_ACREDITADO,'+coCRLF+
            '                 SUM(NVL(IMP_SPM_K_VIG,0) + NVL(IMP_SPM_K_IMP,0) + NVL(IMP_SPM_K_VEN,0)) AS SDO_PROMEDIO'+coCRLF+
            '          FROM DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
            '               DM_CR_DIM_CREDITO@DWHC DCDC,'+coCRLF+
            '               ( SELECT DCDM.ANIO, DCDM.MES, DCDM.ID_ANIO_MES'+coCRLF+
            '                 FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
            '                 WHERE DCDM.NUM_MES = TO_NUMBER(TO_CHAR(ADD_MONTHS(' + vlF_REFERENCIA + ',-1),''MM''))'+coCRLF+
            '                   AND DCDM.ANIO = TO_NUMBER(TO_CHAR(ADD_MONTHS(' + vlF_REFERENCIA + ',-1),''YYYY''))'+coCRLF+
            '               ) DCDM'+coCRLF+
            '          WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
            '            AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF+
            '            AND (DCDC.ID_OLTP_PRODUCTO NOT LIKE ''%N%'')'+coCRLF+
            '          GROUP BY DCDC.ID_OLTP_ACREDITADO'+coCRLF+
            '       ) SPM_MES_ANT'+coCRLF+
            '       WHERE SPM_MES_ANT.ID_OLTP_ACREDITADO (+)= R1.ID_ACREDITADO'+coCRLF+
            '   ) R'+coCRLF+
            ' ORDER BY'+coCRLF+
            '     R.CVE_MONEDA,'+coCRLF+
            '     TX_B_APL_INSCR_DEUD,'+coCRLF+
            '     R.NOM_ACREDITADO'+coCRLF
            ;
   Result := vlSQL;
End;


procedure TQrCapGob.qrdbPCT_20Print(sender: TObject; var Value: String);
begin
 Try
  If Value = '0.00' Then Value := '';
 Finally
 End;
end;

procedure TQrCapGob.qrDetailAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  If vgB_SALIDA_EXCEL Then
   Begin
    Inc(vgnRowExcel);
    If Not (qryCapGob.FieldByName('CVE_MONEDA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A' )].Value := qryCapGob.FieldByName('CVE_MONEDA').AsFloat;
    If Not (qryCapGob.FieldByName('DESC_MONEDA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('B' )].Value := qryCapGob.FieldByName('DESC_MONEDA').AsString;
    If Not (qryCapGob.FieldByName('TX_B_APL_INSCR_DEUD').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('C' )].Value := qryCapGob.FieldByName('TX_B_APL_INSCR_DEUD').AsString;
    If Not (qryCapGob.FieldByName('ID_ACREDITADO').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('D' )].Value := qryCapGob.FieldByName('ID_ACREDITADO').AsFloat;
    If Not (qryCapGob.FieldByName('NOM_ACREDITADO').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('E' )].Value := qryCapGob.FieldByName('NOM_ACREDITADO').AsString;
    If Not (qryCapGob.FieldByName('ADEUDO_TOTAL').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('F' )].Value := qryCapGob.FieldByName('ADEUDO_TOTAL').AsFloat;
    If Not (qryCapGob.FieldByName('SDO_PROM_MES_ACT').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('G' )].Value := qryCapGob.FieldByName('SDO_PROM_MES_ACT').AsFloat;
    If Not (qryCapGob.FieldByName('CVE_CALIFICACION1').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('H' )].Value := qryCapGob.FieldByName('CVE_CALIFICACION1').AsString;
    If Not (qryCapGob.FieldByName('CVE_CALIFICACION2').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('I' )].Value := qryCapGob.FieldByName('CVE_CALIFICACION2').AsString;
    If Not (qryCapGob.FieldByName('CVE_CALIFICACION3').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('J' )].Value := qryCapGob.FieldByName('CVE_CALIFICACION3').AsString;
    If Not (qryCapGob.FieldByName('CVE_CALIFICACION4').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('K' )].Value := qryCapGob.FieldByName('CVE_CALIFICACION4').AsString;
    If Not (qryCapGob.FieldByName('CVE_CALIFICACION5').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('L' )].Value := qryCapGob.FieldByName('CVE_CALIFICACION5').AsString;
    If Not (qryCapGob.FieldByName('CVE_CALIFICACION6').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('M' )].Value := qryCapGob.FieldByName('CVE_CALIFICACION6').AsString;
    If Not (qryCapGob.FieldByName('PCT_20').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('N' )].Value := qryCapGob.FieldByName('PCT_20').AsFloat;
    If Not (qryCapGob.FieldByName('PCT_50').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('O' )].Value := qryCapGob.FieldByName('PCT_50').AsFloat;
    If Not (qryCapGob.FieldByName('PCT_115').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('P' )].Value := qryCapGob.FieldByName('PCT_115').AsFloat;
    If Not (qryCapGob.FieldByName('PCT_150').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Q' )].Value := qryCapGob.FieldByName('PCT_150').AsFloat;
    If Not (qryCapGob.FieldByName('SDO_PROM_MES_ACT').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('R' )].Value := qryCapGob.FieldByName('SDO_PROM_MES_ACT').AsFloat;
    If Not (qryCapGob.FieldByName('SDO_PROM_MES_ANT').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('S' )].Value := qryCapGob.FieldByName('SDO_PROM_MES_ANT').AsFloat;
    If Not (qryCapGob.FieldByName('VARIACION').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('T' )].Value := qryCapGob.FieldByName('VARIACION').AsFloat;
   End;
end;

procedure TQrCapGob.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qryCapGob.First;
  qrlbNOM_CALIFICADORA1.Caption := qryCapGob.FieldByName('NOM_CALIFICADORA1').AsString;
  qrlbNOM_CALIFICADORA2.Caption := qryCapGob.FieldByName('NOM_CALIFICADORA2').AsString;
  qrlbNOM_CALIFICADORA3.Caption := qryCapGob.FieldByName('NOM_CALIFICADORA3').AsString;
  qrlbNOM_CALIFICADORA4.Caption := qryCapGob.FieldByName('NOM_CALIFICADORA4').AsString;
  qrlbNOM_CALIFICADORA5.Caption := qryCapGob.FieldByName('NOM_CALIFICADORA5').AsString;
  qrlbNOM_CALIFICADORA6.Caption := qryCapGob.FieldByName('NOM_CALIFICADORA6').AsString;

  If (vgB_SALIDA_EXCEL) Then
      Begin
      vgnRowExcel := 1;
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A' )].Value := 'Moneda';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('B' )].Value := 'Desc. Moneda';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('C' )].Value := 'Inscrito en el registro de Deuda Pública';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('D' )].Value := 'Núm. Acreditado';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('E' )].Value := 'Nombre del Acreditado';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('F' )].Value := 'Adeudo Total';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('G' )].Value := 'Saldo Promedio';
      
      If Not (qryCapGob.FieldByName('NOM_CALIFICADORA1').IsNull) Then
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('H' )].Value := qryCapGob.FieldByName('NOM_CALIFICADORA1').AsString
      Else
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('H' )].Value := '(VACÍO)';

      If Not (qryCapGob.FieldByName('NOM_CALIFICADORA2').IsNull) Then
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('I' )].Value := qryCapGob.FieldByName('NOM_CALIFICADORA2').AsString
      Else
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('I' )].Value := '(VACÍO)';

      If Not (qryCapGob.FieldByName('NOM_CALIFICADORA3').IsNull) Then
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('J' )].Value := qryCapGob.FieldByName('NOM_CALIFICADORA3').AsString
      Else
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('J' )].Value := '(VACÍO)';

      If Not (qryCapGob.FieldByName('NOM_CALIFICADORA4').IsNull) Then
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('K' )].Value := qryCapGob.FieldByName('NOM_CALIFICADORA4').AsString
      Else
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('K' )].Value := '(VACÍO)';

      If Not (qryCapGob.FieldByName('NOM_CALIFICADORA5').IsNull) Then
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('L' )].Value := qryCapGob.FieldByName('NOM_CALIFICADORA5').AsString
      Else
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('L' )].Value := '(VACÍO)';

      If Not (qryCapGob.FieldByName('NOM_CALIFICADORA6').IsNull) Then
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('M' )].Value := qryCapGob.FieldByName('NOM_CALIFICADORA6').AsString
      Else
        vgExcelApp.Cells[vgnRowExcel,ColumnXlS('M' )].Value := '(VACÍO)';

      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('N' )].Value := '20%';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('O' )].Value := '50%';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('P' )].Value := '115%';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Q' )].Value := '150%';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('R' )].Value := 'Total';      
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('S' )].Value := 'Total Mes Anterior';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('T' )].Value := 'Variación';

      vgExcelApp.Range['A1:Z1'].Font.Bold := True;
      vgExcelApp.Range['A1:Z1'].VerticalAlignment   := xlVAlignCenter;
      vgExcelApp.Range['A1:Z1'].HorizontalAlignment := xlHAlignCenter;
      vgExcelApp.Range['A1:Z1'].Wraptext := True;
      vgExcelApp.Range['A1:Z1'].RowHeight := 45.75; // La medida esta en Pixeles
      vgExcelApp.Range['A1:Z1'].ColumnWidth := 15.14; // La medida esta en Pixeles

      vgExcelApp.Range['A1:Z65536'].Font.Name := 'Verdana';
      vgExcelApp.Range['A1:Z65536'].Font.Size := 8;

      vgExcelApp.Range['F2:F65536'].Style := 'Currency';      
      vgExcelApp.Range['G2:G65536'].Style := 'Currency';
      vgExcelApp.Range['N2:N65536'].Style := 'Currency';
      vgExcelApp.Range['O2:O65536'].Style := 'Currency';
      vgExcelApp.Range['P2:P65536'].Style := 'Currency';
      vgExcelApp.Range['Q2:Q65536'].Style := 'Currency';
      vgExcelApp.Range['R2:R65536'].Style := 'Currency';
      vgExcelApp.Range['S2:S65536'].Style := 'Currency';
      vgExcelApp.Range['T2:T65536'].Style := 'Currency';            
      End;
end;

End.
