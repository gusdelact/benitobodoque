Unit IntQrCartVdaRan;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport, U_InterCustomStar,
  U_InterDigDoc,uRedigitalizacion,
  ComObj,
  IntXls;

Type
  TQrCartVdaRan = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qyCartVdaRan: TQuery;
    QRSHPTCredito: TQRShape;
    QRLabel17: TQRLabel;
    QRSHPTAutorizacion: TQRShape;
    QRLabel33: TQRLabel;                                      
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRShape2: TQRShape;
    QRLabel44: TQRLabel;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRShape15: TQRShape;
    QRLabel18: TQRLabel;
    QRShape21: TQRShape;
    QRLabel23: TQRLabel;
    QRBand1: TQRBand;
    QRDBText22: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText47: TQRDBText;
    QRGrpFooterMoneda: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRLabel28: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText23: TQRDBText;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    qlMoneda: TQRLabel;

    QRGrupoMoneda: TQRGroup;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    qyCartVdaRanCVE_MONEDA: TFloatField;
    qyCartVdaRanDESC_MONEDA: TStringField;
    qyCartVdaRanID_TITULAR: TFloatField;
    qyCartVdaRanNOMBRE: TStringField;
    qyCartVdaRanID_CREDITO: TFloatField;
    qyCartVdaRanF_INICIO: TDateTimeField;
    qyCartVdaRanF_VENCIMIENTO: TDateTimeField;
    qyCartVdaRanF_TRASPASO_VEN: TDateTimeField;
    qyCartVdaRanID_CONTRATO: TFloatField;
    qyCartVdaRanCVE_PRODUCTO: TStringField;
    qyCartVdaRanDESC_PRODUCTO: TStringField;
    qyCartVdaRanCVE_CAT_MINIMO: TStringField;
    qyCartVdaRanDESC_CAT_MINIMO: TStringField;
    qyCartVdaRanNUM_DIAS_VDO: TFloatField;
    qyCartVdaRanGRUPO: TFloatField;
    qyCartVdaRanIMP_CAP_EXIG: TFloatField;
    qyCartVdaRanIMP_CAP_NO_EXIG: TFloatField;
    qyCartVdaRanIMP_INT_EXIG: TFloatField;
    qyCartVdaRanGARANTIA_CP: TFloatField;
    qyCartVdaRanGARANTIA_IN: TFloatField;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRGrupoRango: TQRGroup;
    QRGrpFooterRango: TQRBand;
    QRLabelRangoDias: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    qlSubRango: TQRLabel;
    qyCartVdaRanCVE_PRESUPUESTO: TStringField;
    qyCartVdaRanDESC_PRESUPUESTO: TStringField;
    QRDBText3: TQRDBText;
    qyCartVdaRanTOTAL: TFloatField;
    procedure QRLabelRangoDiasPrint(sender: TObject; var Value: String);
    procedure qlSubRangoPrint(sender: TObject; var Value: String);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGrupoRangoAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGrupoMonedaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGrpFooterRangoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGrpFooterRangoAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGrpFooterMonedaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);

  Private
    vgBGeneraArchivo : Boolean;
    vgArchivoExcel : String;
    vgTitReporte : String;
    vgExcelApp : OleVariant;
    vgNumRow   : Integer;
    vgRowIni   : Integer;
    vgRowFin   : Integer;
    vgStrList  : TStringList;

    procedure IniciaArchivoExcel(peFileName : String);
    function  Cierra_Y_Guarda_ArchivoExcel : Boolean;

  Public
      Function FormaQuery(sFFin: TDateTime; sAcreditado, sDisp, sContrato, sMercObj,
                          sProducto, sMoneda, sCatMinimo, TCartera: String
                         ): String;
  end;
Var
  QrCartVdaRan: TQrCartVdaRan;
  bGenArch: Boolean;
  Apli : TInterApli;
  sArchivo:String;
  F: TextFile;

Procedure RepCarVdaRan( sFFin: TDateTime; sAcreditado, sDisp, sContrato, sMercObj, sProducto,
                        sMoneda, sCatMinimo, TCartera : String;
                        pAPli : TInterApli; pPreview : Boolean;
                        peStrArchivoXLS : String);
Implementation
{$R *.DFM}

Procedure RepCarVdaRan( sFFin: TDateTime; sAcreditado, sDisp, sContrato, sMercObj, sProducto,
                         sMoneda, sCatMinimo, TCartera : String;
                         pAPli : TInterApli; pPreview : Boolean;
                         peStrArchivoXLS : String);
Var
   QrCartVdaRan: TQrCartVdaRan;
   Preview     : TIntQRPreview;
Begin


   QrCartVdaRan:=TQrCartVdaRan.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrCartVdaRan);
   Try
      bGenArch:= False;
      Apli := pApli;

      QrCartVdaRan.QRInterEncabezado1.Apli:=pApli;
      QrCartVdaRan.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrCartVdaRan.QRInterEncabezado1.NomReporte:='IntMQrCartVdaRan';

      QrCartVdaRan.QRInterEncabezado1.Titulo1:='Cartera Vencida por Rangos de Antigüedad al día ' + DateToStr(sFFin);

      QrCartVdaRan.vgBGeneraArchivo := (ExtractFileName(Trim(peStrArchivoXLS)) <> '');
      QrCartVdaRan.vgArchivoExcel   := peStrArchivoXLS;

      if (Trim(sAcreditado)<>'')Then
         QrCartVdaRan.QRInterEncabezado1.Titulo1:= QrCartVdaRan.QRInterEncabezado1.Titulo1 + ' Por Acreditado '
      else If (Trim(sDisp)<>'')Then
         QrCartVdaRan.QRInterEncabezado1.Titulo1:= QrCartVdaRan.QRInterEncabezado1.Titulo1 + ' Por Crédito '
      else If (Trim(sProducto)<>'')Then
         QrCartVdaRan.QRInterEncabezado1.Titulo1:= QrCartVdaRan.QRInterEncabezado1.Titulo1 + ' Por Producto de Crédito ' + sProducto
      else If (Trim(sMoneda)<>'')Then
         QrCartVdaRan.QRInterEncabezado1.Titulo1:= QrCartVdaRan.QRInterEncabezado1.Titulo1 + ' Por Moneda ' +  sMoneda
      else If (Trim(sCatMinimo)<>'')Then
         QrCartVdaRan.QRInterEncabezado1.Titulo1:= QrCartVdaRan.QRInterEncabezado1.Titulo1 + ' Por Catálogo Mínimo ' +  sCatMinimo
      else If (Trim(sMercObj)<>'')Then
         QrCartVdaRan.QRInterEncabezado1.Titulo1:= QrCartVdaRan.QRInterEncabezado1.Titulo1 + ' Por Área de Negocio ' +  sMercObj;

      if TCartera = '0' Then
         QrCartVdaRan.QRInterEncabezado1.Titulo1:= QrCartVdaRan.QRInterEncabezado1.Titulo1 + ' (Bancaria)'
      else
         QrCartVdaRan.QRInterEncabezado1.Titulo1:= QrCartVdaRan.QRInterEncabezado1.Titulo1 + ' (NO Bancaria)';
      //end if;
      QrCartVdaRan.vgTitReporte := QrCartVdaRan.QRInterEncabezado1.Titulo1;
      QrCartVdaRan.QRInterEncabezado1.Titulo2:='(Cifras en moneda de origen)';

      QrCartVdaRan.qyCartVdaRan.DatabaseName := pApli.DataBaseName;
      QrCartVdaRan.qyCartVdaRan.SessionName := pApli.SessionName;

      QrCartVdaRan.qyCartVdaRan.Active:=False;
      QrCartVdaRan.qyCartVdaRan.SQL.Text:= QrCartVdaRan.FormaQuery(sFFin, sAcreditado, sDisp, sContrato, sMercObj,
                                                                  sProducto, sMoneda, sCatMinimo, TCartera);

      QrCartVdaRan.qyCartVdaRan.SQL.SaveToFile('c:\CartVdaRan.txt');
      QrCartVdaRan.qyCartVdaRan.Active:=True;

      If (QrCartVdaRan.vgBGeneraArchivo) Then
         QrCartVdaRan.IniciaArchivoExcel(QrCartVdaRan.vgArchivoExcel);

      If pPreview Then
         QrCartVdaRan.Preview
      Else
         QrCartVdaRan.Print;

      If (QrCartVdaRan.vgBGeneraArchivo) Then
         QrCartVdaRan.Cierra_Y_Guarda_ArchivoExcel;

   Finally
      QrCartVdaRan.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrCartVdaRan.FormaQuery(sFFin: TDateTime; sAcreditado, sDisp, sContrato, sMercObj,
                          sProducto, sMoneda, sCatMinimo, TCartera: String
                                  ): String;
Var
  vlSql: String;
Begin
  vlSQL :=
     'SELECT CONT.CVE_MONEDA, MON.DESC_MONEDA, CONT.ID_TITULAR, ACRED.NOMBRE, ' + coCRLF +
     '       CRE.ID_CREDITO, CRE.F_INICIO, ' + coCRLF +
     '       CRE.F_VENCIMIENTO, CRE.F_TRASPASO_VEN, ' + coCRLF +
     '       CRE.ID_CONTRATO, CRE.CVE_PRODUCTO, ' + coCRLF +
     '       CRE.DESC_PRODUCTO, CRE.CVE_CAT_MINIMO, ' + coCRLF +
     '       CRE.DESC_CAT_MINIMO, CRE.NUM_DIAS_VDO, ' + coCRLF +
     '       CRE.GRUPO, ' + coCRLF +
     '       CRE.IMP_CAP_EXIG - CRE.GARANTIA_CP AS IMP_CAP_EXIG, ' + coCRLF +
     '       CRE.IMP_CAP_NO_EXIG, ' + coCRLF +
     '       CRE.IMP_INT_EXIG - CRE.GARANTIA_IN AS IMP_INT_EXIG, ' + coCRLF +
     '       (CRE.IMP_CAP_EXIG - CRE.GARANTIA_CP) + CRE.IMP_CAP_NO_EXIG + (CRE.IMP_INT_EXIG - CRE.GARANTIA_IN) AS TOTAL, ' + coCRLF +
     '       CRE.IMP_CAP_NO_EXIG, CRE.IMP_INT_EXIG, ' + coCRLF +
     '       CRE.GARANTIA_CP, CRE.GARANTIA_IN, CRE.CVE_PRESUPUESTO, ' + coCRLF +
     '       PRES.DESC_PRESUPUESTO ' + coCRLF +
     '  FROM ( ' + coCRLF +
     '        -- INTERCREDITOS SIN HIPOTECARIOS ' + coCRLF +
     '        SELECT CPD.ID_CREDITO, CC.F_VALOR_CRED AS F_INICIO, CC.F_ULT_CAPITAL AS F_VENCIMIENTO, ' + coCRLF +
     '               CPD.F_TRASPASO_VEN, ' + coCRLF +
     '               CC.ID_CONTRATO, ' + coCRLF +
     '               TO_CHAR(CTO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO, ' + coCRLF +
     '               CSTB.DESC_SUB_TIPO AS DESC_PRODUCTO, ' + coCRLF +
     '               CTO.CVE_CAT_MIN AS CVE_CAT_MINIMO, ' + coCRLF +
     '               CCM.DESC_CAT_MIN AS DESC_CAT_MINIMO, ' + coCRLF +
     '               ' + SQLFecha(sFFin) + ' - CPD.F_TRASPASO_VEN NUM_DIAS_VDO, ' + coCRLF +
     '               (CASE WHEN (' + SQLFecha(sFFin) + ' - CPD.F_TRASPASO_VEN) BETWEEN 1 AND 180 THEN 1 ' + coCRLF +
     '                     WHEN (' + SQLFecha(sFFin) + ' - CPD.F_TRASPASO_VEN) BETWEEN 181 AND 365 THEN 2 ' + coCRLF +
     '                     WHEN (' + SQLFecha(sFFin) + ' - CPD.F_TRASPASO_VEN) BETWEEN 366 AND 730 THEN 3 ' + coCRLF +
     '                     WHEN (' + SQLFecha(sFFin) + ' - CPD.F_TRASPASO_VEN) > 730 THEN 4 ' + coCRLF +
     '					  END) GRUPO, ' + coCRLF +
     '               --CAPITAL ' + coCRLF +
     '               NVL(SUM(CASE WHEN ( PER.F_VTO_CP  ) <  ' + SQLFecha(sFFin) + ' THEN PER.IMP_CAPITAL ELSE 0 END),0) AS IMP_CAP_EXIG, ' + coCRLF +
     '               NVL(SUM(CASE WHEN ( PER.F_VTO_CP  ) >= ' + SQLFecha(sFFin) + ' THEN PER.IMP_CAPITAL ELSE 0 END),0) AS IMP_CAP_NO_EXIG, ' + coCRLF +
     '               --INERES ' + coCRLF +
     '               NVL(SUM(CASE WHEN ( PER.F_VTO_CI ) < CPD.F_TRASPASO_VEN+5 THEN PER.IMP_INTERES ELSE 0 END),0) AS IMP_INT_EXIG, ' + coCRLF +
     '               0 GARANTIA_CP, ' + coCRLF +
     '               0 GARANTIA_IN, ' + coCRLF +
     '               CC.CVE_PRESUPUESTO ' + coCRLF +
     '        FROM (SELECT DISTINCT ID_CREDITO, F_TRASPASO_VEN ' + coCRLF +
     '                FROM ( SELECT ID_CREDITO, F_TRASPASO_VEN ' + coCRLF +
     '                         FROM CRE_PROV_DIARIA CHC ' + coCRLF +
     '                        WHERE CHC.F_PROVISION = ' + SQLFecha(sFFin) + coCRLF +
     '                          AND    CHC.F_TRASPASO_VEN IS NOT NULL ' + coCRLF +
     '                       UNION ' + coCRLF +
     '                       SELECT ID_CREDITO, F_TRASPASO_VENC AS F_TRASPASO_VEN ' + coCRLF +
     '                         FROM CRE_CREDITO ' + coCRLF +
     '                        WHERE F_TRASPASO_VENC IS NOT NULL ' + coCRLF +
     '                      ) ' + coCRLF +
     '              ) CPD, ' + coCRLF +
     '             CRE_CREDITO CC, ' + coCRLF +
     '             CRE_CONTRATO CTO, ' + coCRLF +
     '             CRE_SUB_TIP_BCO CSTB, ' + coCRLF +
     '             CRE_CAT_MINIMO CCM, ' + coCRLF +
     '             (SELECT * ' + coCRLF +
     '                FROM ( SELECT CI.ID_CREDITO, ' + coCRLF +
     '                              CP_IMP.NUM_PERIODO AS NUM_PER_CP, ' + coCRLF +
     '                              CP_IMP.F_VENCIMIENTO AS F_VTO_CP, ' + coCRLF +
     '                              CP_IMP.IMP_CAPITAL, ' + coCRLF +
     '                              CI_IMP.NUM_PERIODO AS NUM_PER_CI, ' + coCRLF +
     '                              CI_IMP.F_VENCIMIENTO AS F_VTO_CI, ' + coCRLF +
     '                              CI_IMP.IMP_INTERES_PER AS IMP_INTERES ' + coCRLF +
     '                       FROM CRE_INTERES CI, ' + coCRLF +
     '                            (SELECT cre_capital.ID_CREDITO, ' + coCRLF +
     '                                    NUM_PERIODO, ' + coCRLF +
     '                                    (CASE WHEN cre_credito.tipo_disposicion = ''DI'' THEN cre_capital.F_VENCIMIENTO ' + coCRLF +
     '                                          WHEN (cre_credito.TIPO_DISPOSICION<>''DI'') AND (cre_credito.F_VALOR_CRED = cre_credito.F_TRASPASO_VENC) THEN cre_credito.F_VALOR_CRED ' + coCRLF +
     '                                          WHEN (cre_credito.TIPO_DISPOSICION<>''DI'') AND (cre_credito.F_VALOR_CRED < cre_credito.F_TRASPASO_VENC) THEN (CASE WHEN cre_capital.F_VENCIMIENTO > ' + SQLFecha(sFFin) + ' THEN cre_credito.F_TRASPASO_VENC ' + coCRLF +
     '                                                                                                                                                            ELSE cre_capital.F_VENCIMIENTO ' + coCRLF +
     '                                                                                                                                                            END) ' + coCRLF +
     '                                     END) AS F_VENCIMIENTO, ' + coCRLF +
     '                                    IMP_CAPITAL - IMP_PAGADO AS IMP_CAPITAL ' + coCRLF +
     '                             FROM cre_capital, cre_credito, ' + coCRLF +
     '                                  (SELECT DISTINCT ID_CREDITO, F_TRASPASO_VEN ' + coCRLF +
     '                                     FROM ( SELECT ID_CREDITO, F_TRASPASO_VEN ' + coCRLF +
     '                                            FROM CRE_PROV_DIARIA CHC ' + coCRLF +
     '                                            WHERE CHC.F_PROVISION = ' + SQLFecha(sFFin) + ' ' + coCRLF +
     '                                            AND    CHC.F_TRASPASO_VEN IS NOT NULL ' + coCRLF +
     '                                            UNION ' + coCRLF +
     '                                            SELECT ID_CREDITO, F_TRASPASO_VENC AS F_TRASPASO_VEN ' + coCRLF +
     '                                            FROM CRE_CREDITO ' + coCRLF +
     '                                            WHERE F_TRASPASO_VENC IS NOT NULL) ' + coCRLF +
     '                                   ) CHC ' + coCRLF +
     '                             WHERE  1 = 1 ' + coCRLF +
     '                             AND    SIT_CAPITAL NOT IN (''CA'',''LQ'',''TL'',''TI'',''TP'',''TA'') ' + coCRLF +
     '                             AND    CRE_CREDITO.SIT_CREDITO IN (''AC'') ' + coCRLF +
     '                             AND    cre_credito.id_credito = cre_capital.id_credito ' + coCRLF +
     '                             AND    (f_pago is null or imp_capital > imp_pagado) ' + coCRLF +
     '                             AND    CHC.ID_CREDITO = crE_capital.ID_CREDITO ' + coCRLF +
     '                             ) CP_IMP, ' + coCRLF +
     '                            (SELECT CI.ID_CREDITO, ' + coCRLF +
     '                                    NUM_PERIODO, ' + coCRLF +
     '                                    IMP_INTERES_PER - IMP_PAGADO AS IMP_INTERES_PER, ' + coCRLF +
     '                                    (CASE WHEN cc.tipo_disposicion = ''DI'' THEN ci.F_VENCIMIENTO ' + coCRLF +
     '                                          WHEN (cc.TIPO_DISPOSICION <>''DI'') AND (cc.F_VALOR_CRED = cc.F_TRASPASO_VENC) THEN cc.F_VALOR_CRED ' + coCRLF +
     '                                          WHEN (cc.TIPO_DISPOSICION <>''DI'') AND (cc.F_VALOR_CRED < cc.F_TRASPASO_VENC) THEN (CASE WHEN ci.F_VENCIMIENTO > ' + SQLFecha(sFFin) + ' THEN cc.F_TRASPASO_VENC ' + coCRLF +
     '                                                                                                                                  ELSE ci.F_VENCIMIENTO ' + coCRLF +
     '                                                                                                                             END) ' + coCRLF +
     '                                     END) AS F_VENCIMIENTO ' + coCRLF +
     '                             FROM CRE_INTERES CI, cre_credito cc, ' + coCRLF +
     '                                  (SELECT DISTINCT ID_CREDITO, F_TRASPASO_VEN ' + coCRLF +
     '                                     FROM ( SELECT ID_CREDITO, F_TRASPASO_VEN ' + coCRLF +
     '					         FROM CRE_PROV_DIARIA CHC ' + coCRLF +
     '                                            WHERE CHC.F_PROVISION = ' + SQLFecha(sFFin) + coCRLF +
     '                                              AND CHC.F_TRASPASO_VEN IS NOT NULL ' + coCRLF +
     '                                            UNION ' + coCRLF +
     '					         SELECT ID_CREDITO, F_TRASPASO_VENC AS F_TRASPASO_VEN ' + coCRLF +
     '					           FROM CRE_CREDITO ' + coCRLF +
     '                                             WHERE F_TRASPASO_VENC IS NOT NULL)) CHC ' + coCRLF +
     '                             WHERE  1 = 1 ' + coCRLF +
     '                               AND   SIT_INTERES = ''IM'' ' + coCRLF +
     '                               AND   CC.SIT_CREDITO IN (''AC'') ' + coCRLF +
     '                               AND   cc.id_credito = ci.id_credito ' + coCRLF +
     '                               AND   CHC.ID_CREDITO = CI.ID_CREDITO ' + coCRLF +
     '                             ) CI_IMP ' + coCRLF +
     '	                        WHERE CP_IMP.ID_CREDITO(+) = CI.ID_CREDITO ' + coCRLF +
     '                         AND CP_IMP.F_VENCIMIENTO(+) = CI.F_VENCIMIENTO ' + coCRLF +
     '	                          AND CI_IMP.ID_CREDITO(+) = CI.ID_CREDITO ' + coCRLF +
     '                         AND CI_IMP.NUM_PERIODO(+) = CI.NUM_PERIODO ' + coCRLF +
     '                     ) ' + coCRLF +
     '              ) PER ' + coCRLF +
     '        WHERE CPD.ID_CREDITO      = CC.ID_CREDITO ' + coCRLF +
     '          AND CTO.ID_CONTRATO     = CC.ID_CONTRATO ' + coCRLF +
     '          AND CTO.CVE_SUB_TIP_BCO NOT IN(50,59,60,118,119,120,121,51) ' + coCRLF +
     '          AND CTO.CVE_SUB_TIP_BCO = CSTB.CVE_SUB_TIP_BCO ' + coCRLF +
     '          AND CTO.CVE_SUB_TIP_BCO <> ''57'' ' + coCRLF +
     '          AND CTO.CVE_CAT_MIN     = CCM.CVE_CAT_MIN ' + coCRLF +
     '          AND CC.ID_CREDITO       = PER.ID_CREDITO ' + coCRLF +
     '        HAVING (SUM(CASE WHEN ( PER.F_VTO_CP  ) <  ' + SQLFecha(sFFin) + ' THEN PER.IMP_CAPITAL ELSE 0 END) <> 0 OR ' + coCRLF +
     '               SUM(CASE WHEN ( PER.F_VTO_CP  ) >= ' + SQLFecha(sFFin) + ' THEN PER.IMP_CAPITAL ELSE 0 END) <> 0  OR ' + coCRLF +
     '               --INERES ' + coCRLF +
     '               SUM(CASE WHEN ( PER.F_VTO_CI ) < CPD.F_TRASPASO_VEN+5 THEN PER.IMP_INTERES ELSE 0 END) <> 0) ' + coCRLF +
     '	      GROUP BY CPD.ID_CREDITO, CC.F_VALOR_CRED, CC.F_ULT_CAPITAL, ' + coCRLF +
     '	               CPD.F_TRASPASO_VEN, CC.ID_CONTRATO, ' + coCRLF +
     '	               TO_CHAR(CTO.CVE_SUB_TIP_BCO), CSTB.DESC_SUB_TIPO, CTO.CVE_CAT_MIN, CCM.DESC_CAT_MIN, CC.CVE_PRESUPUESTO ' + coCRLF +
     '	      -- ' + coCRLF +
     '	      UNION ' + coCRLF +
     '	      -- ' + coCRLF +
     '        -- INTERCREDITOS HIPOTECARIOS ' + coCRLF +
     '	      SELECT CPD.ID_CREDITO, CC.F_VALOR_CRED AS F_INICIO, CC.F_ULT_CAPITAL AS F_VENCIMIENTO, ' + coCRLF +
     '	             CPD.F_TRASPASO_VEN, ' + coCRLF +
     '               CC.ID_CONTRATO, ' + coCRLF +
     '	             TO_CHAR(CTO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO, ' + coCRLF +
     '		     CSTB.DESC_SUB_TIPO AS DESC_PRODUCTO, ' + coCRLF +
     '               CTO.CVE_CAT_MIN AS CVE_CAT_MINIMO, ' + coCRLF +
     '		     CCM.DESC_CAT_MIN AS DESC_CAT_MINIMO, ' + coCRLF +
     '		     (' + SQLFecha(sFFin) + ' - CPD.F_TRASPASO_VEN) AS NUM_DIAS_VDO, ' + coCRLF +
     '               (CASE WHEN (' + SQLFecha(sFFin) + ' - CPD.F_TRASPASO_VEN) BETWEEN 1 AND 180 THEN 1 ' + coCRLF +
     '		           WHEN (' + SQLFecha(sFFin) + ' - CPD.F_TRASPASO_VEN) BETWEEN 181 AND 365 THEN 2 ' + coCRLF +
     '		           WHEN (' + SQLFecha(sFFin) + ' - CPD.F_TRASPASO_VEN) BETWEEN 366 AND 730 THEN 3 ' + coCRLF +
     '			   WHEN (' + SQLFecha(sFFin) + ' - CPD.F_TRASPASO_VEN) > 730 THEN 4 ' + coCRLF +
     '		       END) GRUPO, ' + coCRLF +
     '		     NVL(CCAS.ICVE,0) AS CP_EX, ' + coCRLF +
     '		     NVL(CCAS.ICVNE,0) AS CP_NE, ' + coCRLF +
     '		     NVL(CCAS.IIVE,0) AS IN_EX, ' + coCRLF +
     '		     0 GARANTIA_CP, ' + coCRLF +
     '		     0 GARANTIA_IN, ' + coCRLF +
     '		     CC.CVE_PRESUPUESTO ' + coCRLF +
     '        FROM (SELECT DISTINCT ID_CREDITO, F_TRASPASO_VEN ' + coCRLF +
     '		      FROM ( SELECT ID_CREDITO, F_TRASPASO_VEN ' + coCRLF +
     '		             FROM CRE_PROV_DIARIA CHC ' + coCRLF +
     '                       WHERE CHC.F_PROVISION = ' + SQLFecha(sFFin) + ' ' + coCRLF +
     '                       AND    CHC.F_TRASPASO_VEN IS NOT NULL ' + coCRLF +
     '                       UNION ' + coCRLF +
     '                       SELECT ID_CREDITO, F_TRASPASO_VENC AS F_TRASPASO_VEN ' + coCRLF +
     '                       FROM CRE_CREDITO ' + coCRLF +
     '                       WHERE F_TRASPASO_VENC IS NOT NULL ' + coCRLF +
     '                      ) ' + coCRLF +
     '              ) CPD, ' + coCRLF +
     '             CRE_CREDITO CC, ' + coCRLF +
     '             CRE_CONTRATO CTO, ' + coCRLF +
     '             CRE_SUB_TIP_BCO CSTB, ' + coCRLF +
     '             CRE_CAT_MINIMO CCM, ' + coCRLF +
     '             (SELECT CCAS.ID_CREDITO, ' + coCRLF +
     '		           CCAS.F_CIERRE, ' + coCRLF +
     '		           CCAS.IMP_CAP_VDO_EX AS ICVE, ' + coCRLF +
     '			   CCAS.IMP_CAP_VDO_NE AS ICVNE, ' + coCRLF +
     '			   CCAS.IMP_INT_VDO_EX  AS IIVE ' + coCRLF +
     '                FROM CR_CON_ADEUDO_SDO CCAS ' + coCRLF +
     '		     WHERE  CCAS.F_CIERRE = ' + SQLFecha(sFFin) + ') CCAS ' + coCRLF +
     '        WHERE CPD.ID_CREDITO      = CC.ID_CREDITO ' + coCRLF +
     '          AND CTO.ID_CONTRATO     = CC.ID_CONTRATO ' + coCRLF +
     '          AND CTO.CVE_SUB_TIP_BCO NOT IN(50,59,60,118,119,120,121,51) ' + coCRLF +
     '          AND CTO.CVE_SUB_TIP_BCO = CSTB.CVE_SUB_TIP_BCO ' + coCRLF +
     '          AND CTO.CVE_SUB_TIP_BCO = ''57'' ' + coCRLF +
     '          AND CTO.CVE_CAT_MIN     = CCM.CVE_CAT_MIN ' + coCRLF +
     '		AND CCAS.ID_CREDITO     = CC.ID_CREDITO ' + coCRLF +
     '	      -- ' + coCRLF +
     '	      UNION ' + coCRLF +
     '	      -- ' + coCRLF +
     '        -- ICRE ' + coCRLF +
     '        SELECT CHC.ID_CREDITO, ' + coCRLF +
     '		     CC.F_INICIO, ' + coCRLF +
     '		     CC.F_VENCIMIENTO, ' + coCRLF +
     '		     CHC.F_TRASPASO_VENC AS F_TRASPASO_VEN, ' + coCRLF +
     '               CC.ID_CONTRATO, ' + coCRLF +
     '		     CTO.CVE_PRODUCTO_CRE AS CVE_PRODUCTO, ' + coCRLF +
     '		     CP.DESC_C_PRODUCTO AS DESC_PRODUCTO, ' + coCRLF +
     '               CP.CVE_CLAS_CONTAB AS CVE_CAT_MINIMO, ' + coCRLF +
     '		     CCM.DESC_CAT_MINIMO, ' + coCRLF +
     '		     ' + SQLFecha(sFFin) + ' - CHC.F_TRASPASO_VENC AS NUM_DIAS_VDO, ' + coCRLF +
     '		     (CASE WHEN (' + SQLFecha(sFFin) + ' - CHC.F_TRASPASO_VENC) BETWEEN 1 AND 180 THEN 1 ' + coCRLF +
     '		           WHEN (' + SQLFecha(sFFin) + ' - CHC.F_TRASPASO_VENC) BETWEEN 181 AND 365 THEN 2 ' + coCRLF +
     '		           WHEN (' + SQLFecha(sFFin) + ' - CHC.F_TRASPASO_VENC) BETWEEN 366 AND 730 THEN 3 ' + coCRLF +
     '			   WHEN (' + SQLFecha(sFFin) + ' - CHC.F_TRASPASO_VENC) > 730 THEN 4 ' + coCRLF +
     '		       END) GRUPO, ' + coCRLF +
     '		     --CAPITAL ' + coCRLF +
     '               NVL(SUM(CASE WHEN (NVL(PER.F_VTO_CP, PER.F_VTO_CI)) <= ' + SQLFecha(sFFin) + ' THEN PER.IMP_CAPITAL ELSE 0 END),0) AS IMP_CAP_EXIG, ' + coCRLF +
     '               NVL(SUM(CASE WHEN (NVL(PER.F_VTO_CP, PER.F_VTO_CI)) > ' + SQLFecha(sFFin) + ' THEN PER.IMP_CAPITAL ELSE 0 END),0) AS IMP_CAP_NO_EXIG, ' + coCRLF +
     '               --INERES ' + coCRLF +
     '               NVL(SUM(CASE WHEN (NVL(PER.F_VTO_CP, PER.F_VTO_CI)) < CHC.F_TRASPASO_VENC+5 THEN PER.IMP_INTERES ELSE 0 END),0) AS IMP_INT_EXIG, ' + coCRLF +
     '		     --GARANTIA CAPITAL ' + coCRLF +
     '		     NVL(SUM(CASE WHEN (NVL(PER.F_VTO_CP, PER.F_VTO_CI)) <= ' + SQLFecha(sFFin) + ' THEN GAR.IMP_OPERACION ELSE 0 END),0) GTIA_CP_EX, ' + coCRLF +
     '               -- GARANTIA INTERES ' + coCRLF +
     '		     NVL(SUM(CASE WHEN (NVL(PER.F_VTO_CP, PER.F_VTO_CI)) < CHC.F_TRASPASO_VENC+5 THEN GARI.IMP_OPERACION ELSE 0 END),0) AS GTIA_IN_EX, ' + coCRLF +
     '		     -- ' + coCRLF +
     '               CP.CVE_PRESUPUESTO  ' + coCRLF +
     '        FROM CR_HISTO_CRED CHC, ' + coCRLF +
     '             CR_CREDITO CC, ' + coCRLF +
     '             CR_CONTRATO CTO, ' + coCRLF +
     '             CR_PRODUCTO CP, ' + coCRLF +
     '             CR_CAT_MINIMO CCM, ' + coCRLF +
     '		   ( SELECT * ' + coCRLF +
     '               FROM ( SELECT CI_IMP.ID_CREDITO, ' + coCRLF +
     '                             CI_IMP.NUM_PER_CP, CI_IMP.F_VTO_CP, CI_IMP.IMP_CAPITAL, ' + coCRLF +
     '                             CI_IMP.NUM_PER_CI, CI_IMP.F_VTO_CI, CI_IMP.IMP_INTERES ' + coCRLF +
     '                      FROM ( SELECT ID_CREDITO, ' + coCRLF +
     '                                    NUM_PERIODO AS NUM_PER_CP, ' + coCRLF +
     '					  F_VENCIMIENTO AS F_VTO_CP, ' + coCRLF +
     '					  IMP_CAPITAL, ' + coCRLF +
     '                                    NULL AS NUM_PER_CI, ' + coCRLF +
     '					  NULL AS F_VTO_CI, ' + coCRLF +
     '					  NULL AS IMP_INTERES ' + coCRLF +
     '                             from ( SELECT ID_CREDITO, NUM_PERIODO, F_VENCIMIENTO, ' + coCRLF +
     '                                           MIN(F_PROG_PAGO) AS F_PROG_PAGO, ' + coCRLF +
     '                                           MAX(F_PAGO ) AS F_PAGO, ' + coCRLF +
     '                                           SUM(IMP_CAPITAL) AS IMP_CAPITAL ' + coCRLF +
//     '						 SIT_CAPITAL ' + coCRLF +
     '                                    FROM ( select cr_capital.ID_CREDITO, NUM_PERIODO, F_PROG_PAGO, ' + coCRLF +
     '                                                  cr_capital.F_VENCIMIENTO, ' + coCRLF +
     '                                                  DECODE(F_VALOR_PAGO,NULL,F_PAGO,F_VALOR_PAGO) AS F_PAGO, ' + coCRLF +
     '                                                  IMP_CAPITAL - PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'', cr_capital.ID_CREDITO,NUM_PERIODO,NULL, ' + SQLFecha(sFFin) + ', ''V'') AS IMP_CAPITAL, ' + coCRLF +
     '                                                  SIT_CAPITAL ' + coCRLF +
     '                                           from cr_capital, cr_credito, ' + coCRLF +
     '						      (SELECT ID_CREDITO ' + coCRLF +
     '						       FROM CR_HISTO_CRED CHC  ' + coCRLF +
     '                                                 WHERE CHC.F_CIERRE = ' + SQLFecha(sFFin) + coCRLF +
     '                                                 AND   CHC.F_TRASPASO_VENC IS NOT NULL) CHC  ' + coCRLF +
     '                                           where 1 = 1  ' + coCRLF +
     '                                           AND   SIT_CAPITAL <> ''CA''  ' + coCRLF +
     '                                           AND   cr_credito.id_credito = cr_capital.id_credito  ' + coCRLF +
     '                                           AND   CHC.ID_CREDITO = cr_capital.ID_CREDITO ' + coCRLF +
     '						 -- ' + coCRLF +
     '                                           union ' + coCRLF +
     '						 -- ' + coCRLF +
     '                                           select cr_finan_adic.ID_CREDITO, NUM_PERIODO, F_PROG_PAGO, ' + coCRLF +
     '                                                  cr_finan_adic.F_VENCIMIENTO, ' + coCRLF +
     '                                                  DECODE(F_VALOR_PAGO,NULL,DECODE(F_PAGO,NULL,F_PROG_PAGO,F_PAGO),F_VALOR_PAGO) AS F_PAGO_FN, ' + coCRLF +
//     '                                                  --IMP_FINAN_ADIC - (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'', cr_finan_adic.ID_CREDITO, NUM_PERIODO, NULL, ' + SQLFecha(sFFin) + ', ''V'')+ NVL(FINCO.IMP_CAP_CO,0)) AS IMP_CAPITAL, ' + coCRLF +
     '                                                  (CASE WHEN CR_FINAN_ADIC.F_VENCIMIENTO <= CHC.F_TRASPASO_VENC+5 THEN ' + coCRLF +
     '                                                           IMP_FINAN_ADIC-PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'', CR_FINAN_ADIC.ID_CREDITO, NUM_PERIODO, NULL, ' + SQLFecha(sFFin) + ', ''V'') ' + coCRLF +
     '                                                        ELSE  ' + coCRLF +
     '                                                           PKGCRCONSOLIDADO.fun_CapExigibleFN(CR_FINAN_ADIC.ID_CREDITO, ' + SQLFecha(sFFin) + '+1,NUM_PERIODO,''EX'',''V'') END) IMP_CAPITAL, ' + coCRLF +
     '                                                  SIT_FINAN_ADIC AS SIT_CAPITAL ' + coCRLF +
     '                                           from  cr_finan_adic, cr_credito, ' + coCRLF +
     '						       (SELECT ID_CREDITO, F_TRASPASO_VENC FROM CR_HISTO_CRED CHC ' + coCRLF +
     '                                                  WHERE CHC.F_CIERRE = ' + SQLFecha(sFFin) + coCRLF +
     '                                                  AND    CHC.F_TRASPASO_VENC IS NOT NULL) CHC  ' + coCRLF +
     '                                           where  1 = 1 ' + coCRLF +
     '                                           AND    SIT_FINAN_ADIC <> ''CA'' ' + coCRLF +
     '                                           AND    cr_credito.id_credito = cr_finan_adic.id_credito ' + coCRLF +
     '                                           AND    CHC.ID_CREDITO = cr_finan_adic.ID_CREDITO ' + coCRLF +
     '                                           AND    (CR_FINAN_ADIC.F_VENCIMIENTO-CR_FINAN_ADIC.PLAZO) <CHC.F_TRASPASO_VENC ' + coCRLF +
     '                                        ) ' + coCRLF +
     '                                    GROUP BY ID_CREDITO, NUM_PERIODO, F_VENCIMIENTO ' + coCRLF +  //   ,SIT_CAPITAL ' + coCRLF +
     '                                   ) ' + coCRLF +
     '				   --    ' + coCRLF +
     '                             UNION ' + coCRLF +
     '				   --    ' + coCRLF +
     '                             SELECT CI.ID_CREDITO, ' + coCRLF +
     '                                    NULL AS NUM_PER_CP, ' + coCRLF +
     '					  NULL AS F_VTO_CP, ' + coCRLF +
     '					  NULL AS IMP_CAPITAL, ' + coCRLF +
     '                                    NUM_PERIODO AS NUM_PER_CI, ' + coCRLF +
     '                                    CI.F_VENCIMIENTO, ' + coCRLF +
     '                                    (CI.IMP_INTERES - PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPBRU'', CI.ID_CREDITO, CI.NUM_PERIODO,NULL, ' + SQLFecha(sFFin) + ', ''V'')) IMP_INTERES ' + coCRLF +
     '                             FROM CR_INTERES CI, cr_credito, ' + coCRLF +
     '					(SELECT ID_CREDITO ' + coCRLF +
     '					 FROM CR_HISTO_CRED CHC ' + coCRLF +
     '                                   WHERE CHC.F_CIERRE = ' + SQLFecha(sFFin) +
     '                                   AND    CHC.F_TRASPASO_VENC IS NOT NULL) CHC ' + coCRLF +
     '                             WHERE 1 = 1 ' + coCRLF +
//     '                             AND    SIT_INTERES = ''IM'' ' + coCRLF +
     '                             AND   SIT_INTERES <> ''CA'' ' + coCRLF +
     '                             AND  (CI.IMP_INTERES - PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPBRU'', CI.ID_CREDITO, CI.NUM_PERIODO,NULL, ' + SQLFecha(sFFin) + ', ''V''))<> 0 ' + coCRLF +
     '                             AND   cr_credito.id_credito = ci.id_credito ' + coCRLF +
     '                             AND   CHC.ID_CREDITO = CI.ID_CREDITO ' + coCRLF +
     '                            ) CI_IMP ' + coCRLF +
     '                       ) ' + coCRLF +
     '                      WHERE NUM_PER_CP IS NOT NULL OR NUM_PER_CI IS NOT NULL ' + coCRLF +
     '                     ) PER, ' + coCRLF +
     '                     -------------------------   ' + coCRLF +
     '                    ( SELECT ''V'' EJERCIDA, GA.* ' + coCRLF +
     '                      FROM ( SELECT FG_I.ID_CREDITO, FG_I.ID_PERIODO, FG_I.F_OPERACION, ' + coCRLF +
     '                                    (NVL(FG_I.IMP_CONCEPTO,0) - NVL(FG_D.IMP_CONCEPTO,0)) AS IMP_OPERACION ' + coCRLF +
     '                             FROM ( SELECT ID_CREDITO, ID_PERIODO, MAX(F_OPERACION)AS F_OPERACION, SUM(IMP_CONCEPTO) AS IMP_CONCEPTO ' + coCRLF +
     '                                    FROM (SELECT CC.ID_CREDITO, T.ID_PERIODO, MAX(T.F_OPERACION) AS F_OPERACION, ' + coCRLF +
     '                                                 NVL(SUM(DT.IMP_CONCEPTO * DECODE(AF.CVE_AFECTA_SDO,''D'',-1,1)),0) IMP_CONCEPTO ' + coCRLF +
     '                                          FROM CR_TRANSACCION T, CR_DET_TRANSAC DT, CR_REL_CON_AFEC AF, ' + coCRLF +
     '                                              (SELECT ID_CREDITO, F_TRASPASO_VENC FROM CR_HISTO_CRED ' + coCRLF +
     '                                               WHERE F_CIERRE = ' + SQLFecha(sFFin) + ') CC ' + coCRLF +
     '                                          WHERE 1=1 ' + coCRLF +
     '                                            AND CC.ID_CREDITO     = T.ID_CREDITO ' + coCRLF +
     '                                            AND T.ID_TRANSACCION  = DT.ID_TRANSACCION ' + coCRLF +
     '                                            AND T.CVE_OPERACION   = DT.CVE_OPERACION ' + coCRLF +
     '                                            AND T.CVE_OPERACION   = AF.CVE_OPERACION ' + coCRLF +
     '                                            AND T.CVE_TIPO_MOVTO  = AF.CVE_TIPO_MOVTO ' + coCRLF +
     '                                            AND DT.CVE_OPERACION  = AF.CVE_OPERACION ' + coCRLF +
     '                                            AND DT.CVE_CONCEPTO   = AF.CVE_CONCEPTO ' + coCRLF +
     '                                            AND DT.CVE_CONCEPTO   = ''IMPBRU'' ' + coCRLF +
     '                                            AND T.SIT_TRANSACCION = ''AC'' ' + coCRLF +
     '                                            AND T.ID_TRANS_CANCELA IS NULL ' + coCRLF +
     '                                            AND T.F_VALOR <=  ' + SQLFecha(sFFin) +  coCRLF +
     '                                            AND AF.CVE_AFECTACION IN (''GPIMAP'',''GFIMAP'') ' + coCRLF +
     '                                            AND AF.CVE_OPERACION IN (SELECT CVE_OPERACION FROM CR_OPERACION WHERE CVE_ACCESORIO IN (''CP'')) ' + coCRLF +
     '                                          GROUP BY CC.ID_CREDITO, T.ID_PERIODO ' + coCRLF +
     '                                          UNION ' + coCRLF +
     '                                          SELECT CC.ID_CREDITO, T.ID_PERIODO, MAX(T.F_OPERACION) AS F_OPERACION, ' + coCRLF +
     '                                                 NVL(SUM(DT.IMP_CONCEPTO * DECODE(AF.CVE_AFECTA_SDO,''D'',-1,1)),0) IMP_CONCEPTO ' + coCRLF +
     '                                          FROM CR_TRANSACCION T, CR_DET_TRANSAC DT, CR_REL_CON_AFEC AF, CR_FINAN_ADIC FN, ' + coCRLF +
     '                                               (SELECT ID_CREDITO, F_TRASPASO_VENC FROM CR_HISTO_CRED ' + coCRLF +
     '                                                WHERE F_CIERRE = ' + SQLFecha(sFFin) + ') CC ' + coCRLF +
     '                                          WHERE 1=1 ' + coCRLF +
     '                                            AND FN.ID_CREDITO = T.ID_CREDITO ' + coCRLF +
     '                                            AND FN.NUM_PERIODO = T.ID_PERIODO ' + coCRLF +
     '                                            AND CC.ID_CREDITO     = T.ID_CREDITO ' + coCRLF +
     '                                            AND T.ID_TRANSACCION  = DT.ID_TRANSACCION ' + coCRLF +
     '                                            AND T.CVE_OPERACION   = DT.CVE_OPERACION ' + coCRLF +
     '                                            AND T.CVE_OPERACION   = AF.CVE_OPERACION ' + coCRLF +
     '                                            AND T.CVE_TIPO_MOVTO  = AF.CVE_TIPO_MOVTO ' + coCRLF +
     '                                            AND DT.CVE_OPERACION  = AF.CVE_OPERACION ' + coCRLF +
     '                                            AND DT.CVE_CONCEPTO   = AF.CVE_CONCEPTO ' + coCRLF +
     '                                            AND DT.CVE_CONCEPTO   = ''IMPBRU'' ' + coCRLF +
     '                                            AND T.SIT_TRANSACCION = ''AC'' ' + coCRLF +
     '                                            AND T.ID_TRANS_CANCELA IS NULL ' + coCRLF +
     '                                            AND T.F_VALOR <=  ' + SQLFecha(sFFin) + coCRLF +
     '                                            AND AF.CVE_AFECTACION IN (''GPIMAP'',''GFIMAP'') ' + coCRLF +
     '                                            AND AF.CVE_OPERACION IN (SELECT CVE_OPERACION FROM CR_OPERACION WHERE CVE_ACCESORIO IN (''FN'')) ' + coCRLF +
     '                                            AND FN.F_VENCIMIENTO <= CC.F_TRASPASO_VENC+5 ' + coCRLF +
     '                                          GROUP BY CC.ID_CREDITO, T.ID_PERIODO ' + coCRLF +
     '					        ) ' + coCRLF +
     '                                    GROUP BY ID_CREDITO, ID_PERIODO ' + coCRLF +
     '       			         )FG_I, ' + coCRLF +
     '                                  (  SELECT ID_CREDITO, ID_PERIODO, MAX(F_OPERACION)AS F_OPERACION, SUM(IMP_CONCEPTO) AS IMP_CONCEPTO ' + coCRLF +
     '                                     FROM ( ' + coCRLF +
     '                                           SELECT CC.ID_CREDITO, T.ID_PERIODO, MAX(T.F_OPERACION) AS F_OPERACION, ' + coCRLF +
     '                                                  NVL(SUM(DT.IMP_CONCEPTO * DECODE(AF.CVE_AFECTA_SDO,''D'',-1,1)),0) IMP_CONCEPTO ' + coCRLF +
     '                                           FROM CR_TRANSACCION T, CR_DET_TRANSAC DT, CR_REL_CON_AFEC AF, ' + coCRLF +
     '                                                (SELECT ID_CREDITO FROM CR_HISTO_CRED ' + coCRLF +
     '                                                 WHERE F_CIERRE =  ' + SQLFecha(sFFin) + ') CC ' + coCRLF +
     '                                           WHERE 1=1 ' + coCRLF +
     '                                             AND CC.ID_CREDITO     = T.ID_CREDITO ' + coCRLF +
     '                                             AND T.ID_TRANSACCION  = DT.ID_TRANSACCION ' + coCRLF +
     '                                             AND T.CVE_OPERACION   = DT.CVE_OPERACION ' + coCRLF +
     '                                             AND T.CVE_OPERACION   = AF.CVE_OPERACION ' + coCRLF +
     '                                             AND T.CVE_TIPO_MOVTO  = AF.CVE_TIPO_MOVTO ' + coCRLF +
     '                                             AND DT.CVE_OPERACION  = AF.CVE_OPERACION ' + coCRLF +
     '                                             AND DT.CVE_CONCEPTO   = AF.CVE_CONCEPTO ' + coCRLF +
     '                                             AND DT.CVE_CONCEPTO   = ''IMPBRU'' ' + coCRLF +
     '                                             AND T.SIT_TRANSACCION = ''AC'' ' + coCRLF +
     '                                             AND T.ID_TRANS_CANCELA IS NULL ' + coCRLF +
     '                                             AND T.F_VALOR <=  ' + SQLFecha(sFFin) + coCRLF +
     '                                             AND AF.CVE_AFECTACION IN (''GPIMRC'', ''GFIMRC'' ) ' + coCRLF +
     '                                             AND AF.CVE_OPERACION IN (SELECT CVE_OPERACION FROM CR_OPERACION WHERE CVE_ACCESORIO IN (''CP'')) ' + coCRLF +
     '                                           GROUP BY CC.ID_CREDITO, T.ID_PERIODO ' + coCRLF +
     '                                           UNION ' + coCRLF +
     '                                           SELECT CC.ID_CREDITO, T.ID_PERIODO, MAX(T.F_OPERACION) AS F_OPERACION, ' + coCRLF +
     '                                                  NVL(SUM(DT.IMP_CONCEPTO * DECODE(AF.CVE_AFECTA_SDO,''D'',-1,1)),0) IMP_CONCEPTO ' + coCRLF +
     '                                           FROM CR_TRANSACCION T, CR_DET_TRANSAC DT, CR_REL_CON_AFEC AF, CR_FINAN_ADIC FN, ' + coCRLF +
     '                                                (SELECT ID_CREDITO, F_TRASPASO_VENC FROM CR_HISTO_CRED ' + coCRLF +
     '                                                 WHERE F_CIERRE =  ' + SQLFecha(sFFin) + ') CC ' + coCRLF +
     '                                           WHERE 1=1 ' + coCRLF +
     '                                             AND FN.ID_CREDITO = T.ID_CREDITO ' + coCRLF +
     '                                             AND FN.NUM_PERIODO = T.ID_PERIODO ' + coCRLF +
     '                                             AND CC.ID_CREDITO     = T.ID_CREDITO ' + coCRLF +
     '                                             AND T.ID_TRANSACCION  = DT.ID_TRANSACCION ' + coCRLF +
     '                                             AND T.CVE_OPERACION   = DT.CVE_OPERACION ' + coCRLF +
     '                                             AND T.CVE_OPERACION   = AF.CVE_OPERACION ' + coCRLF +
     '                                             AND T.CVE_TIPO_MOVTO  = AF.CVE_TIPO_MOVTO ' + coCRLF +
     '                                             AND DT.CVE_OPERACION  = AF.CVE_OPERACION ' + coCRLF +
     '                                             AND DT.CVE_CONCEPTO   = AF.CVE_CONCEPTO ' + coCRLF +
     '                                             AND DT.CVE_CONCEPTO   = ''IMPBRU'' ' + coCRLF +
     '                                             AND T.SIT_TRANSACCION = ''AC'' ' + coCRLF +
     '                                             AND T.ID_TRANS_CANCELA IS NULL ' + coCRLF +
     '                                             AND T.F_VALOR <=  ' + SQLFecha(sFFin) + coCRLF +
     '                                             AND AF.CVE_AFECTACION IN (''GPIMRC'', ''GFIMRC'' ) ' + coCRLF +
     '                                             AND AF.CVE_OPERACION IN (SELECT CVE_OPERACION FROM CR_OPERACION WHERE CVE_ACCESORIO IN (''FN'')) ' + coCRLF +
     '                                             AND FN.F_VENCIMIENTO <= CC.F_TRASPASO_VENC+5 ' + coCRLF +
     '                                           GROUP BY CC.ID_CREDITO, T.ID_PERIODO ' + coCRLF +
     '                                           ) ' + coCRLF +
     '                                     GROUP BY ID_CREDITO, ID_PERIODO ' + coCRLF +
     '                                   ) FG_D ' + coCRLF +
     '                             WHERE FG_D.ID_CREDITO (+)= FG_I.ID_CREDITO ' + coCRLF +
     '                               AND FG_D.ID_PERIODO (+)= FG_I.ID_PERIODO ' + coCRLF +
     '                            )GA ' + coCRLF +
     '                     )GAR, ' + coCRLF +
     '                    ( SELECT ''V'' EJERCIDA, GA.* ' + coCRLF +
     '                      FROM ( SELECT FG_I.ID_CREDITO, FG_I.ID_PERIODO, FG_I.F_OPERACION, ' + coCRLF +
     '					  (NVL(FG_I.IMP_CONCEPTO,0) - NVL(FG_D.IMP_CONCEPTO,0)) AS IMP_OPERACION ' + coCRLF +
     '                             FROM (SELECT CC.ID_CREDITO, T.ID_PERIODO, MAX(T.F_OPERACION) AS F_OPERACION, ' + coCRLF +
     '                                           NVL(SUM(DT.IMP_CONCEPTO * DECODE(AF.CVE_AFECTA_SDO,''D'',-1,1)),0) IMP_CONCEPTO ' + coCRLF +
     '                                    FROM CR_TRANSACCION T, CR_DET_TRANSAC DT, CR_REL_CON_AFEC AF, ' + coCRLF +
     '                                         (SELECT ID_CREDITO FROM CR_HISTO_CRED ' + coCRLF +
     '                                          WHERE F_CIERRE =   ' + SQLFecha(sFFin) + ') CC ' + coCRLF +
     '                                    WHERE 1=1 ' + coCRLF +
     '                                      AND CC.ID_CREDITO     = T.ID_CREDITO ' + coCRLF +
     '                                      AND T.ID_TRANSACCION  = DT.ID_TRANSACCION ' + coCRLF +
     '                                      AND T.CVE_OPERACION   = DT.CVE_OPERACION ' + coCRLF +
     '                                      AND T.CVE_OPERACION   = AF.CVE_OPERACION ' + coCRLF +
     '                                      AND T.CVE_TIPO_MOVTO  = AF.CVE_TIPO_MOVTO ' + coCRLF +
     '                                      AND DT.CVE_OPERACION  = AF.CVE_OPERACION ' + coCRLF +
     '                                      AND DT.CVE_CONCEPTO   = AF.CVE_CONCEPTO ' + coCRLF +
     '                                      AND DT.CVE_CONCEPTO   = ''IMPBRU'' ' + coCRLF +
     '                                      AND T.SIT_TRANSACCION = ''AC'' ' + coCRLF +
     '                                      AND T.ID_TRANS_CANCELA IS NULL ' + coCRLF +
     '                                      AND T.F_VALOR <=  ' + SQLFecha(sFFin) + coCRLF +
     '                                      AND AF.CVE_AFECTACION IN (''GPIMAP'',''GFIMAP'') ' + coCRLF +
     '                                      AND AF.CVE_OPERACION IN (SELECT CVE_OPERACION FROM CR_OPERACION WHERE CVE_ACCESORIO IN (''IN'')) ' + coCRLF +
     '                                    GROUP BY CC.ID_CREDITO, T.ID_PERIODO ' + coCRLF +
     '                                   )FG_I, ' + coCRLF +
     '                                  ( SELECT CC.ID_CREDITO, T.ID_PERIODO, MAX(T.F_OPERACION) AS F_OPERACION, ' + coCRLF +
     '                                           NVL(SUM(DT.IMP_CONCEPTO * DECODE(AF.CVE_AFECTA_SDO,''D'',-1,1)),0) IMP_CONCEPTO ' + coCRLF +
     '                                      FROM CR_TRANSACCION T, CR_DET_TRANSAC DT, CR_REL_CON_AFEC AF, ' + coCRLF +
     '                                           (SELECT ID_CREDITO FROM CR_HISTO_CRED ' + coCRLF +
     '                                            WHERE F_CIERRE =  ' + SQLFecha(sFFin) + ') CC ' + coCRLF +
     '                                     WHERE 1=1 ' + coCRLF +
     '                                       AND CC.ID_CREDITO     = T.ID_CREDITO ' + coCRLF +
     '                                       AND T.ID_TRANSACCION  = DT.ID_TRANSACCION ' + coCRLF +
     '                                       AND T.CVE_OPERACION   = DT.CVE_OPERACION ' + coCRLF +
     '                                       AND T.CVE_OPERACION   = AF.CVE_OPERACION ' + coCRLF +
     '                                       AND T.CVE_TIPO_MOVTO  = AF.CVE_TIPO_MOVTO ' + coCRLF +
     '                                       AND DT.CVE_OPERACION  = AF.CVE_OPERACION ' + coCRLF +
     '                                       AND DT.CVE_CONCEPTO   = AF.CVE_CONCEPTO ' + coCRLF +
     '                                       AND DT.CVE_CONCEPTO   = ''IMPBRU'' ' + coCRLF +
     '                                       AND T.SIT_TRANSACCION = ''AC''  ' + coCRLF +
     '                                       AND T.ID_TRANS_CANCELA IS NULL ' + coCRLF +
     '                                       AND T.F_VALOR <=  ' + SQLFecha(sFFin) + coCRLF +
     '                                       AND AF.CVE_AFECTACION IN (''GPIMRC'', ''GFIMRC'' ) ' + coCRLF +
     '                                       AND AF.CVE_OPERACION IN (SELECT CVE_OPERACION FROM CR_OPERACION WHERE CVE_ACCESORIO IN (''IN'')) ' + coCRLF +
     '                                    GROUP BY CC.ID_CREDITO, T.ID_PERIODO ' + coCRLF +
     '                                   ) FG_D ' + coCRLF +
     '                             WHERE FG_D.ID_CREDITO (+)= FG_I.ID_CREDITO ' + coCRLF +
     '                               AND FG_D.ID_PERIODO (+)= FG_I.ID_PERIODO ' + coCRLF +
     '                            )GA ' + coCRLF +
     '                     )GARI ' + coCRLF +
     '               WHERE CHC.F_CIERRE          = ' + SQLFecha(sFFin) + coCRLF +
     '                 AND CHC.F_TRASPASO_VENC IS NOT NULL ' + coCRLF +
     '                 AND CHC.ID_CREDITO        = CC.ID_CREDITO ' + coCRLF +
     '                 AND CTO.ID_CONTRATO       = CC.ID_CONTRATO ' + coCRLF +
     '                 AND CP.CVE_PRODUCTO_CRE   = CTO.CVE_PRODUCTO_CRE ' + coCRLF;
  if TCartera = '0' then
    vlSQL := vlSQL +
     '                 AND CP.CVE_TIPO_CARTERA   = ''BANCAR'''+coCRLF
  else
    vlSQL := vlSQL +
     '                 AND CP.CVE_TIPO_CARTERA   <> ''BANCAR'''+coCRLF;

  If (Trim(sProducto)<>'') Then
    vlSQL:= vlSQL +
     '                 AND CP.CVE_PRODUCTO_CRE =  '''+ sProducto+''''+  coCRLF ;

  vlSql := vlSql +
     '                 AND CP.CVE_CLAS_CONTAB    = CCM.CVE_CAT_MINIMO ' + coCRLF +
     '                 AND CC.ID_CREDITO         = PER.ID_CREDITO ' + coCRLF +
     '                 AND GAR.ID_CREDITO     (+)= PER.ID_CREDITO ' + coCRLF +
     '                 AND GAR.ID_PERIODO     (+)= NVL(PER.NUM_PER_CP,0) ' + coCRLF +
     '                 AND GARI.ID_CREDITO    (+)= PER.ID_CREDITO ' + coCRLF +
     '                 AND GARI.ID_PERIODO    (+)= NVL(PER.NUM_PER_CI,0) ' + coCRLF +
     '		     GROUP BY CHC.ID_CREDITO, CC.F_INICIO, CC.F_VENCIMIENTO, CHC.F_TRASPASO_VENC, CC.ID_CONTRATO, ' + coCRLF +
     '		              CTO.CVE_PRODUCTO_CRE, CP.DESC_C_PRODUCTO, CP.CVE_CLAS_CONTAB, CCM.DESC_CAT_MINIMO, ' + coCRLF +
     '		              ' + SQLFecha(sFFin) + ' - CHC.F_TRASPASO_VENC, ' + coCRLF +
     '		              (CASE WHEN (' + SQLFecha(sFFin) + ' - CHC.F_TRASPASO_VENC) BETWEEN 1 AND 180 THEN 1 ' + coCRLF +
     '		                    WHEN (' + SQLFecha(sFFin) + ' - CHC.F_TRASPASO_VENC) BETWEEN 181 AND 365 THEN 2 ' + coCRLF +
     '		     	            WHEN (' + SQLFecha(sFFin) + ' - CHC.F_TRASPASO_VENC) BETWEEN 366 AND 730 THEN 3 ' + coCRLF +
     '				    WHEN (' + SQLFecha(sFFin) + ' - CHC.F_TRASPASO_VENC) > 730 THEN 4 ' + coCRLF +
     '				END), CP.CVE_PRESUPUESTO ' + coCRLF +
     '			) CRE, ' + coCRLF +
     '       CONTRATO CONT, ' + coCRLF +
     '	     CRE_PRESUPUESTO PRES, ' + coCRLF +
     '       ( SELECT ID_PERSONA, APELLIDO_PATERNO||'' ''||APELLIDO_MATERNO||'' ''||NOMBRE_PERSONA AS NOMBRE ' + coCRLF +
     '         FROM PERSONA_FISICA ' + coCRLF +
     '         UNION ' + coCRLF +
     '         SELECT ID_PERSONA, NOM_RAZON_SOCIAL AS NOMBRE ' + coCRLF +
     '         FROM PERSONA_MORAL ) ACRED, ' + coCRLF +
     '       MONEDA MON ' + coCRLF +
     ' WHERE CRE.ID_CONTRATO = CONT.ID_CONTRATO ' + coCRLF +
     '	    AND CONT.ID_TITULAR = ACRED.ID_PERSONA ' + coCRLF +
     '	    AND CONT.CVE_MONEDA = MON.CVE_MONEDA ' + coCRLF +
     '	    AND CRE.CVE_PRESUPUESTO = PRES.CVE_PRESUPUESTO (+) ' + coCRLF +
     '      AND (CRE.IMP_CAP_EXIG - CRE.GARANTIA_CP) + CRE.IMP_CAP_NO_EXIG + (CRE.IMP_INT_EXIG - CRE.GARANTIA_IN) <> 0 ' + coCRLF;

       If (Trim(sAcreditado)<>'') Then
          vlSQL:= vlSQL + '  AND ACRED.ID_PERSONA = '+ sAcreditado +coCRLF ;
       If (Trim(sDisp)<>'') Then
          vlSQL:= vlSQL + '  AND CRE.ID_CREDITO = '+ sDisp+ coCRLF ;
       If (Trim(sContrato)<>'') Then
          vlSQL:= vlSQL + '  AND CONT.ID_CONTRATO = '+ sContrato+ coCRLF ;
       If (Trim(sMercObj)<>'') Then
          vlSQL:= vlSQL + '  AND CRE.CVE_PRESUPUESTO =  '''+ sMercObj+''''+  coCRLF ;
       If (Trim(sProducto)<>'') Then
          vlSQL:= vlSQL + '  AND CRE.CVE_PRODUCTO =  '''+ sProducto+''''+  coCRLF ;
       If (Trim(sMoneda)<>'') Then
          vlSQL:= vlSQL + '  AND CONT.CVE_MONEDA=  '''+ sMoneda +''''+  coCRLF ;
       If (Trim(sCatMinimo)<>'') Then
          vlSQL:= vlSQL + '  AND CRE.CVE_CAT_MINIMO =  '''+ sCatMinimo +''''+  coCRLF ;

   vlSQL:= vlSQL + '	  ORDER BY MON.DESC_MONEDA, CRE.GRUPO, ACRED.NOMBRE, CRE.ID_CREDITO ' + coCRLF;

   Result:= vlSQL;
End;

procedure TQrCartVdaRan.QRLabelRangoDiasPrint(sender: TObject;
  var Value: String);
begin
  if qyCartVdaRan.FieldByName('GRUPO').AsInteger = 1 then
     Value := 'Plazo de 1 a 180 Días en Cartera Vencida';

  if qyCartVdaRan.FieldByName('GRUPO').AsInteger = 2 then
     Value := 'Plazo de 181 a 365 Días en Cartera Vencida';

  if qyCartVdaRan.FieldByName('GRUPO').AsInteger = 3 then
     Value := 'Plazo de 1 a 2 Años en Cartera Vencida';

  if qyCartVdaRan.FieldByName('GRUPO').AsInteger = 4 then
     Value := 'Plazo de más de 2 Años en Cartera Vencida';

end;

procedure TQrCartVdaRan.qlSubRangoPrint(sender: TObject; var Value: String);
begin
  if qyCartVdaRan.FieldByName('GRUPO').AsInteger = 1 then
     Value := 'Subtotal Plazo de 1 a 180 Días en Cartera Vencida';

  if qyCartVdaRan.FieldByName('GRUPO').AsInteger = 2 then
     Value := 'Subtotal Plazo de 181 a 365 Días en Cartera Vencida';

  if qyCartVdaRan.FieldByName('GRUPO').AsInteger = 3 then
     Value := 'Subtotal Plazo de 1 a 2 Años en Cartera Vencida';

  if qyCartVdaRan.FieldByName('GRUPO').AsInteger = 4 then
     Value := 'Subtotal Plazo de más de 2 Años en Cartera Vencida';
end;

function TQrCartVdaRan.Cierra_Y_Guarda_ArchivoExcel: Boolean;
begin
  Result := False;
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;
  //
  vgExcelApp.ActiveWorkBook.SaveAs(vgArchivoExcel);

  vgStrList.Clear;
  vgStrList.Free;
  Result := CloseExcelFile(vgExcelApp);
end;

procedure TQrCartVdaRan.IniciaArchivoExcel(peFileName: String);
const aColumnWidth : Array[1..14] of Double = (30.00, 25.00,  8.00,  8.00,  8.00,
                                                6.00,  8.50,  8.50, 10.00, 10.00,
                                               10.00, 10.00, 20.00, 25.00);

    procedure IniciaArchivoExcelNuevo;
    begin
      vgExcelApp := CreateOleObject('Excel.Application');
      vgExcelApp.Workbooks.Add;
    end;

var vlColumnRange : Variant;
    vlRange : Variant;
    vlCol : Integer;
begin
  IniciaArchivoExcelNuevo;

  vlColumnRange := vgExcelApp.Workbooks[1].WorkSheets[1].Columns;
  // Coloca el ancho de las columnas
  For vlCol := 1 To High(aColumnWidth) Do
    Begin
    vlColumnRange.Columns[vlCol].Font.Size := 8;
    vlColumnRange.Columns[vlCol].ColumnWidth := aColumnWidth[vlCol];
    End;
   If Assigned(vgStrList) Then vgStrList.Clear
   Else vgStrList := TStringList.Create;

   // Coloca los títulos del reporte
   vgNumRow := 1;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'BANCO INTERACCIONES, S.A. INSTITUCIÓN DE BANCA MULTIPLE G.F.I.';
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':X'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':X'+IntToStr(vgNumRow)].MergeCells := True;

   // Coloca los títulos 
   Inc(vgNumRow);
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := vgTitReporte;
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':N'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':N'+IntToStr(vgNumRow)].MergeCells := True;

      // Renglon de título
   Inc(vgNumRow);
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := '(Cifras en moneda de origen)';
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':X'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':X'+IntToStr(vgNumRow)].MergeCells := True;

   // Deja un renglon en blanco
   Inc(vgNumRow);

   // Titulo de columnas
   Inc(vgNumRow);
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := 'CAPITAL';
   vgExcelApp.Range['I'+IntToStr(vgNumRow)+':J'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['I'+IntToStr(vgNumRow)+':J'+IntToStr(vgNumRow)].MergeCells := True;

   vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := 'INTERES';
   vgExcelApp.Range['K'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['K'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)].MergeCells := True;



   Inc(vgNumRow);
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':K'+IntToStr(vgNumRow)].Font.Bold := True;
      
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'Rango';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('B') ].Value := 'Acreditado';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := 'Crédito';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('D') ].Value := 'Producto';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('E') ].Value := 'Fecha Inicio';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('F') ].Value := 'Fecha Vento';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('G') ].Value := 'Trasp Vencido';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value := 'Días en Cartera Vencida';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := 'Exigible';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := 'No Exigible';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := 'Exigible';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := 'Total';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('M') ].Value := 'Catálogo Mínimo';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('N') ].Value := 'Mercado Objetivo';

   //Le da formato al renglón de Titulos
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':N'+IntToStr(vgNumRow)].Font.Bold := True;
   vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['A'+IntToStr(vgNumRow)+':N'+IntToStr(vgNumRow)];
   try
     vgExcelApp.ActiveWindow.FreezePanes:=False;
   finally
   end;

   // Deja un renglon en blanco
   Inc(vgNumRow);

   // Se aumenta un renglon más en donde dara inicio la colocación de la información
   Inc(vgNumRow);
end;

procedure TQrCartVdaRan.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   If (Not vgBGeneraArchivo) Then Exit;
   //
   Inc(vgNumRow);

//   vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := qyCartVdaRan.FieldByName('CVE_PRODUCTO_CRE').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('B') ].Value := qyCartVdaRan.FieldByName('NOMBRE').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := qyCartVdaRan.FieldByName('ID_CREDITO').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('D') ].Value := qyCartVdaRan.FieldByName('CVE_PRODUCTO').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('E') ].Value := qyCartVdaRan.FieldByName('F_INICIO').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('F') ].Value := qyCartVdaRan.FieldByName('F_VENCIMIENTO').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('G') ].Value := qyCartVdaRan.FieldByName('F_TRASPASO_VEN').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value := qyCartVdaRan.FieldByName('NUM_DIAS_VDO').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := qyCartVdaRan.FieldByName('IMP_CAP_EXIG').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := qyCartVdaRan.FieldByName('IMP_CAP_NO_EXIG').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := qyCartVdaRan.FieldByName('IMP_INT_EXIG').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := qyCartVdaRan.FieldByName('TOTAL').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('M') ].Value := ''''+qyCartVdaRan.FieldByName('CVE_CAT_MINIMO').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('N') ].Value := qyCartVdaRan.FieldByName('DESC_PRESUPUESTO').AsString;

   // Formato de número
   vgExcelApp.Range['I'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)].NumberFormat := '#,##0.00';

//   vgExcelApp.Range['M'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)].TextFormat;
end;

procedure TQrCartVdaRan.QRGrupoRangoAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   If (Not vgBGeneraArchivo) Then Exit;
   //
   Inc(vgNumRow);
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':N'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':N'+IntToStr(vgNumRow)].Columns.Interior.Color := clSilver;

   if qyCartVdaRan.FieldByName('GRUPO').AsInteger = 1 then
      vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'Plazo de 1 a 180 Días en Cartera Vencida';

  if qyCartVdaRan.FieldByName('GRUPO').AsInteger = 2 then
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'Plazo de 181 a 365 Días en Cartera Vencida';

  if qyCartVdaRan.FieldByName('GRUPO').AsInteger = 3 then
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'Plazo de 1 a 2 Años en Cartera Vencida';

  if qyCartVdaRan.FieldByName('GRUPO').AsInteger = 4 then
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'Plazo de más de 2 Años en Cartera Vencida';

   // se guarda el renglon en donde inicia el bloque para los subtotales
   vgRowIni := vgNumRow + 1;
end;

procedure TQrCartVdaRan.QRGrupoMonedaAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;

  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':N'+IntToStr(vgNumRow)].Font.Bold := True ;
  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':N'+IntToStr(vgNumRow)].Font.Color := clWhite;
  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':N'+IntToStr(vgNumRow)].Columns.Interior.ColorIndex := 1;

  vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'Moneda : ' +
                '  ' + qyCartVdaRan.FieldByName('CVE_MONEDA').AsString +
                '  ' + qyCartVdaRan.FieldByName('DESC_MONEDA').AsString;
end;

procedure TQrCartVdaRan.QRGrpFooterRangoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  vgRowFin := vgNumRow;
end;

procedure TQrCartVdaRan.QRGrpFooterRangoAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   // Valida si se genera o no el Archivo de Excel
   If (Not vgBGeneraArchivo) Then Exit;
   //
   Inc(vgNumRow);
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':N'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':N'+IntToStr(vgNumRow)].Columns.Interior.Color := clSilver;

   if qyCartVdaRan.FieldByName('GRUPO').AsInteger = 1 then
      vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'Subtotal : Plazo de 1 a 180 Días en Cartera Vencida';

  if qyCartVdaRan.FieldByName('GRUPO').AsInteger = 2 then
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'Subtotal : Plazo de 181 a 365 Días en Cartera Vencida';

  if qyCartVdaRan.FieldByName('GRUPO').AsInteger = 3 then
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'Subtotal : Plazo de 1 a 2 Años en Cartera Vencida';

  if qyCartVdaRan.FieldByName('GRUPO').AsInteger = 4 then
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'Subtotal : Plazo de más de 2 Años en Cartera Vencida';

   vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := '=SUM(I'+IntToStr(vgRowIni)+':I'+IntToStr(vgRowFin)+')';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := '=SUM(J'+IntToStr(vgRowIni)+':J'+IntToStr(vgRowFin)+')';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := '=SUM(K'+IntToStr(vgRowIni)+':K'+IntToStr(vgRowFin)+')';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := '=SUM(L'+IntToStr(vgRowIni)+':L'+IntToStr(vgRowFin)+')';

   vgExcelApp.Range['I'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)].NumberFormat := '#,##0.00';
   vgStrList.Add(IntToStr(vgNumRow));

   Inc(vgNumRow);

end;

procedure TQrCartVdaRan.QRGrpFooterMonedaAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var I : Integer;
    vlstrPlus : String;
    vlstrFormula1, vlstrFormula2, vlstrFormula3, vlstrFormula4 : String;
begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;

    // Coloca Formúlas de SUMATORIAS
    vlstrPlus := '';
    vlstrFormula1 := '';
    vlstrFormula2 := '';
    vlstrFormula3 := '';
    vlstrFormula4 := '';

    For I := 0 To vgStrList.Count-1 Do
      Begin
      vlstrFormula1 := vlstrFormula1  + vlstrPlus + 'I' + vgStrList[I];
      vlstrFormula2 := vlstrFormula2  + vlstrPlus + 'J' + vgStrList[I];
      vlstrFormula3 := vlstrFormula3  + vlstrPlus + 'K' + vgStrList[I];
      vlstrFormula4 := vlstrFormula4  + vlstrPlus + 'L' + vgStrList[I];
      vlstrPlus := '+';
      End;
    Inc(vgNumRow);
    Inc(vgNumRow);

    vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'TOTAL MONEDA';
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := '='+vlstrFormula1;
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := '='+vlstrFormula2;
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := '='+vlstrFormula3;
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := '='+vlstrFormula4;

  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':N'+IntToStr(vgNumRow)].Font.Bold := True;
  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':N'+IntToStr(vgNumRow)].Font.Color := clWhite;
  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':N'+IntToStr(vgNumRow)].Columns.Interior.ColorIndex := 1;
  vgExcelApp.Range['I'+IntToStr(vgNumRow)+':L'+IntToStr(vgNumRow)].NumberFormat := '#,##0.00';

  vgStrList.Clear;
  Inc(vgNumRow);
  Inc(vgNumRow);
end;

End.

