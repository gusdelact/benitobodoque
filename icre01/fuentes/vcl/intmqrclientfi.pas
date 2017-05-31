Unit IntMQrCliEntFi;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport;
Type
  TQrCliEntFi = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qyCliEntFi: TQuery;
    QRSHPTCredito: TQRShape;
    QRLabel9: TQRLabel;
    QRSHPTCliente: TQRShape;
    QRLabel17: TQRLabel;
    QRSHPTF_Inicio: TQRShape;
    QRSHPTPlazo: TQRShape;
    QRLabel24: TQRLabel;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText10: TQRDBText;
    QRSHPTChequera: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRFooterAcreditado: TQRBand;
    QRLabel23: TQRLabel;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRSHPTProveedor: TQRShape;
    QRLabel33: TQRLabel;
    QRDBText24: TQRDBText;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qrgrpFooterMoneda: TQRBand;
    QRLabel28: TQRLabel;
    qrgrpFooterTipoTrn: TQRBand;
    QRLabel36: TQRLabel;
    QRGroupContador: TQRGroup;
    QRGroupMoneda: TQRGroup;
    QRGroupTipoOper: TQRGroup;
    QROrigen: TQRGroup;
    QRLabel39: TQRLabel;
    QRShape1: TQRShape;
    QRSHPOrigen: TQRShape;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRSHPSector: TQRShape;
    QRLabel52: TQRLabel;
    QRDBText38: TQRDBText;
    QRSHPMoneda: TQRShape;
    QRLabel46: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape2: TQRShape;
    QRLabel44: TQRLabel;
    QRDBText30: TQRDBText;
    qyCliEntFiNOMBRE: TStringField;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    qyCliEntFiID_TITULAR: TFloatField;
    qyCliEntFiID_PERS_ASOCIAD: TFloatField;
    qyCliEntFiNOMBRE_ASOC: TStringField;
    qyCliEntFiID_PROM_ADM: TFloatField;
    qyCliEntFiNOMBRE_ADM: TStringField;
    qyCliEntFiCVE_GPO_CAPITALIZ: TStringField;
    qyCliEntFiNOM_CALIFICADORA1: TStringField;
    qyCliEntFiCVE_CALIFICACION1: TStringField;
    qyCliEntFiNOM_CALIFICADORA2: TStringField;
    qyCliEntFiCVE_CALIFICACION2: TStringField;
    qyCliEntFiNOM_CALIFICADORA3: TStringField;
    qyCliEntFiCVE_CALIFICACION3: TStringField;
    qyCliEntFiNOM_CALIFICADORA4: TStringField;
    qyCliEntFiCVE_CALIFICACION4: TStringField;
    qyCliEntFiNOM_CALIFICADORA5: TStringField;
    qyCliEntFiCVE_CALIFICACION5: TStringField;
    qyCliEntFiNOM_CALIFICADORA6: TStringField;
    qyCliEntFiCVE_CALIFICACION6: TStringField;
    qyCliEntFiSDO_INSOL: TFloatField;
    qyCliEntFiUSO_CAP: TFloatField;
    qyCliEntFiFECHA: TDateTimeField;
    QRDBText17: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRShape9: TQRShape;
    QRDBText22: TQRDBText;
    qyCliEntFiAPL_INSCR_DEUD: TStringField;
    qyCliEntFiDESC_FUENTE_PAGO: TStringField;
    qyCliEntFiID_CONTRATO: TFloatField;
    qyCliEntFiID_CREDITO: TFloatField;
    QRDBText23: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    qrgrpFooterCount: TQRBand;
    QRLabel3: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr28: TQRExpr;
    qyCliEntFiPCT_CAPITALIZA: TStringField;
    QRDBText25: TQRDBText;

  Private
  Public
    Function FormaQuery(sPromAsoc, sPromAdm, sAcreditado, sDisp, sContrato,
                        sGpoCapit, sBInsDeud, sEmpresa, sSucursal: String;
                        dFecha: TDateTime  ): String;
  end;
Var
  QrCliEntFi: TQrCliEntFi;
  Apli : TInterApli;

Procedure RepCliEntFinGM( sPromAsoc, sPromAdm, sAcreditado, sDisp, sContrato,
                          sGpoCapit, sBInsDeud, sEmpresa, sSucursal: String;
                          dFecha: TDateTime;
                          pAPli     : TInterApli;
                          pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepCliEntFinGM( sPromAsoc, sPromAdm, sAcreditado, sDisp, sContrato,
                          sGpoCapit, sBInsDeud, sEmpresa, sSucursal: String;
                          dFecha: TDateTime;
                          pAPli     : TInterApli;
                          pPreview  : Boolean);
Var
   QrCliEntFi: TQrCliEntFi;
   Preview     : TIntQRPreview;
Begin
   QrCliEntFi:=TQrCliEntFi.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrCliEntFi);
   Try

      Apli := pApli;
      QrCliEntFi.QRInterEncabezado1.Apli:=pApli;
      QrCliEntFi.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrCliEntFi.QRInterEncabezado1.NomReporte:='IntMQrCliEntFi';
      QrCliEntFi.QRInterEncabezado1.Titulo1:='CLIENTES DE ENTIDADES FINANCIERAS, MUNICIPIOS Y SUS ORGANISMOS DESCENTRALIZADOS';
      QrCliEntFi.QRInterEncabezado1.Titulo2:='Al ' + DateToStr(dFecha);

      QrCliEntFi.qyCliEntFi.DatabaseName := pApli.DataBaseName;
      QrCliEntFi.qyCliEntFi.SessionName := pApli.SessionName;

      QrCliEntFi.qyCliEntFi.Active:=False;
      QrCliEntFi.qyCliEntFi.SQL.Text:= QrCliEntFi.FormaQuery(sPromAsoc, sPromAdm, sAcreditado, sDisp, sContrato,
                                                              sGpoCapit, sBInsDeud, sEmpresa, sSucursal,dFecha);
      QrCliEntFi.qyCliEntFi.SQL.SaveToFile('C:\CTEGOB.TXT');
      QrCliEntFi.qyCliEntFi.Active:=True;

      If pPreview Then
         QrCliEntFi.Preview
      Else
         QrCliEntFi.Print;
   Finally
      QrCliEntFi.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrCliEntFi.FormaQuery(sPromAsoc, sPromAdm, sAcreditado, sDisp, sContrato,
                                sGpoCapit, sBInsDeud, sEmpresa, sSucursal: String;
                                dFecha: TDateTime  ): String;
Var
    sSQL:String;
Begin
    sSQL:=  ' SELECT ' +
            '        DATOS.ID_TITULAR, ' +
            '        DATOS.ID_CREDITO, ' +
            '        DATOS.ID_CONTRATO, ' +
            '        DATOS.NOMBRE, ' +
            '        DATOS.DESC_FUENTE_PAGO, ' +
            '        DATOS.APL_INSCR_DEUD, ' +
            '        DATOS.ID_PERS_ASOCIAD, ' +
            '        DATOS.NOMBRE_ASOC, ' +
            '        DATOS.ID_PROM_ADM, ' +
            '        DATOS.NOMBRE_ADM, ' +
            '        DATOS.CVE_GPO_CAPITALIZ, ' +
            '        TO_CHAR(DATOS.PCT_CAPITALIZA) || '' %'' PCT_CAPITALIZA, ' +
            '        CALIF.NOM_CALIFICADORA1, ' +
            '        SUBSTR(PKGCRSICC.GET_ULTIMA_CALIF_ACRED(DATOS.ID_TITULAR, CALIF.ID_CALIFICADORA1, ''RIESGO'', ' +
                                           SQLFecha(dFecha) + '),1,6) AS CVE_CALIFICACION1, ' +
            '        CALIF.NOM_CALIFICADORA2, ' +
            '        SUBSTR(PKGCRSICC.GET_ULTIMA_CALIF_ACRED(DATOS.ID_TITULAR, CALIF.ID_CALIFICADORA2, ''RIESGO'', ' +
                                           SQLFecha(dFecha) + '),1,6) AS CVE_CALIFICACION2, ' +
            '        CALIF.NOM_CALIFICADORA3, ' +
            '        SUBSTR(PKGCRSICC.GET_ULTIMA_CALIF_ACRED(DATOS.ID_TITULAR, CALIF.ID_CALIFICADORA3, ''RIESGO'', ' +
                                           SQLFecha(dFecha) + '),1,6) AS CVE_CALIFICACION3, ' +
            '        CALIF.NOM_CALIFICADORA4, ' +
            '        SUBSTR(PKGCRSICC.GET_ULTIMA_CALIF_ACRED(DATOS.ID_TITULAR, CALIF.ID_CALIFICADORA4, ''RIESGO'', ' +
                                           SQLFecha(dFecha) + '),1,6) AS CVE_CALIFICACION4, ' +
            '        CALIF.NOM_CALIFICADORA5, ' +
            '        SUBSTR(PKGCRSICC.GET_ULTIMA_CALIF_ACRED(DATOS.ID_TITULAR, CALIF.ID_CALIFICADORA5, ''RIESGO'', ' +
                                           SQLFecha(dFecha) + '),1,6) AS CVE_CALIFICACION5, ' +
            '        CALIF.NOM_CALIFICADORA6, ' +
            '        SUBSTR(PKGCRSICC.GET_ULTIMA_CALIF_ACRED(DATOS.ID_TITULAR, CALIF.ID_CALIFICADORA6, ''RIESGO'', ' +
                                           SQLFecha(dFecha) + '),1,6) AS CVE_CALIFICACION6, ' +
            '        SUM(NVL(VIG.IMPORTE,0) + NVL(NE.IMPORTE,0) + ' +
            '            NVL(IMP.IMPORTE,0) + NVL(EXIG.IMPORTE,0)) AS SDO_INSOL, ' +
            '        ((SUM(NVL(VIG.IMPORTE,0) + NVL(NE.IMPORTE,0) + ' +
            '             NVL(IMP.IMPORTE,0) + NVL(EXIG.IMPORTE,0))) * DATOS.PCT_CAPITALIZA)/100 AS USO_CAP, ' +
                         SQLFecha(dFecha) + ' AS FECHA ' +
            '   FROM ' +
            '        ( ' +
            '         SELECT ' +
            '            CTO.ID_TITULAR, ' +
            '            CC.ID_CREDITO, ' +
            '            CCTO.ID_CONTRATO, ' +
            '            TIT.NOMBRE, ' +
            '            FTE_PAG.DESC_FUENTE_PAGO, ' +
            '            DECODE(CCTO.B_APL_INSCR_DEUD,''F'',''NO'',''V'',''SI'',NULL) AS APL_INSCR_DEUD, ' +
            '            CTO.ID_PERS_ASOCIAD, ' +
            '            PASOC.NOMBRE NOMBRE_ASOC, ' +
            '            CC.ID_PROM_ADM, ' +
            '            PADM.NOMBRE NOMBRE_ADM, ' +
            '            CPC.CVE_GPO_CAPITALIZ, ' +
            '            NVL(CPC.PCT_CAPITALIZA,0) AS PCT_CAPITALIZA ' +
            '         FROM ' +
            '            (SELECT * FROM CR_CREDITO CC ' +
            '              WHERE CC.F_AUTORIZA <= ' + SQLFecha(dFecha) +
            '                AND (CC.F_LIQUIDACION >= ' + SQLFecha(dFecha) +
            '                OR CC.F_LIQUIDACION IS NULL)) CC, ' +
            '            CONTRATO CTO, ' +
            '            CR_CONTRATO CCTO, ' +
            '            CR_FUENTE_PAGO FTE_PAG, ' +
            '            PERSONA TIT, ' +
            '            PERSONA PASOC, ' +
            '            PERSONA PADM, ' +
            '            CR_PCT_CAPITALIZ CPC, ' +
            '            CR_ACREDITADO CACRE ' +
            '         WHERE ' +
            '            CTO.ID_CONTRATO = CCTO.ID_CONTRATO ' +
            '            AND CC.ID_CONTRATO = CCTO.ID_CONTRATO ' +
            '            AND CC.FOL_CONTRATO = CCTO.FOL_CONTRATO ' +
            '            AND CTO.ID_TITULAR = TIT.ID_PERSONA ' +
            '            AND CCTO.CVE_FUENTE_PAGO = FTE_PAG.CVE_FUENTE_PAGO (+) ' +
            '            AND PASOC.ID_PERSONA = CTO.ID_PERS_ASOCIAD ' +
            '            AND PADM.ID_PERSONA = CC.ID_PROM_ADM ' +
            '            AND CTO.ID_TITULAR = CACRE.ID_ACREDITADO ' +
            '            AND CACRE.CVE_GPO_CAPITALIZ = CPC.CVE_GPO_CAPITALIZ ';

   If (Trim(sPromAsoc)<>'') Then
      sSQL:= sSQL + ' AND CTO.ID_PERS_ASOCIAD = '+ sPromAsoc;
   If (Trim(sPromAdm)<>'') Then
      sSQL:= sSQL + ' AND CC.ID_PROM_ADM = '+ sPromAdm;
   If (Trim(sAcreditado)<>'') Then
      sSQL:= sSQL + ' AND CTO.ID_TITULAR = '+ sAcreditado;
   If (Trim(sDisp)<>'') Then
      sSQL:= sSQL + ' AND CC.ID_CREDITO = '+ sDisp;
   If (Trim(sContrato)<>'') Then
      sSQL:= sSQL + ' AND CCTO.ID_CONTRATO = '+ sContrato;
   If (Trim(sEmpresa)<>'') Then
      sSQL:= sSQL + ' AND CTO.ID_EMPRESA = '+ sEmpresa;
   If (Trim(sGpoCapit)<>'') Then
      sSQL:= sSQL + ' AND CACRE.CVE_GPO_CAPITALIZ = '+ SQLStr( sGpoCapit );
   If (Trim(sBInsDeud)<>'') OR (Trim(sBInsDeud) <> '0') Then
      sSQL:= sSQL + ' AND CCTO.B_APL_INSCR_DEUD = '+ SQLStr( sBInsDeud );

   sSQL:= sSQL +
            '        ) DATOS, ' +
            '        (SELECT MAX(DECODE(ROWNUM,1, ID_CALIFICADORA, -1)) AS ID_CALIFICADORA1, ' +
            '                MAX(DECODE(ROWNUM,1, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA1, ' +
            '                MAX(DECODE(ROWNUM,2, ID_CALIFICADORA, -1)) AS ID_CALIFICADORA2, ' +
            '                MAX(DECODE(ROWNUM,2, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA2, ' +
            '                MAX(DECODE(ROWNUM,3, ID_CALIFICADORA, -1)) AS ID_CALIFICADORA3, ' +
            '                MAX(DECODE(ROWNUM,3, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA3, ' +
            '                MAX(DECODE(ROWNUM,4, ID_CALIFICADORA, -1)) AS ID_CALIFICADORA4, ' +
            '                MAX(DECODE(ROWNUM,4, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA4, ' +
            '                MAX(DECODE(ROWNUM,5, ID_CALIFICADORA, -1)) AS ID_CALIFICADORA5, ' +
            '                MAX(DECODE(ROWNUM,5, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA5, ' +
            '                MAX(DECODE(ROWNUM,6, ID_CALIFICADORA, -1)) AS ID_CALIFICADORA6, ' +
            '                MAX(DECODE(ROWNUM,6, NOM_CALIFICADORA, NULL)) AS NOM_CALIFICADORA6 ' +
            '           FROM (SELECT ID_CALIFICADORA, ' +
            '                        SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, ID_CALIFICADORA), 1, 255) AS NOM_CALIFICADORA ' +
            '                   FROM CR_CALIFICADORA ' +
            '                  WHERE SIT_CALIFICADORA <> ''CA'' ' +
            '                  ORDER BY NOM_CALIFICADORA) ' +
            '         ) CALIF, ' +
//
            '        ( ' +
            '         SELECT CP.ID_CREDITO, ' +
            '               SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' +
            '                                            CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V'')))AS IMPORTE ' +
            '          FROM (SELECT * FROM CR_CAPITAL CP ' +
            '                 WHERE CP.F_VENCIMIENTO > ' + SQLFecha(dFecha) + ') CP, ' +
            '               (SELECT CHC.ID_CREDITO ' +
            '                  FROM CR_CREDITO CC, ' +
            '                       (SELECT * FROM CR_HISTO_CRED CHC ' +
            '                         WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
            '                               AND CHC.F_TRASPASO_VENC IS NULL) CHC ' +
            '                 WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
            '                 UNION ' +
            '                SELECT CC.ID_CREDITO ' +
            '                  FROM CR_CREDITO CC ' +
            '                 WHERE CC.F_TRASPASO_VENC IS NULL ' +
            '               )CC ' +
            '         WHERE CP.ID_CREDITO = CC.ID_CREDITO ' +
            '         GROUP BY CP.ID_CREDITO ' +
            '        UNION ALL ' +
            '        SELECT CFA.ID_CREDITO, ' +
            '               SUM(NVL(CFA.IMP_FINAN_ADIC,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFA.ID_CREDITO, ' +
            '                                                CFA.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V''))) AS IMPORTE ' +
            '          FROM (SELECT * FROM CR_FINAN_ADIC CFA ' +
            '                 WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) + ')CFA, ' +
            '               (SELECT CHC.ID_CREDITO  ' +
            '                  FROM CR_CREDITO CC, ' +
            '                      (SELECT * FROM CR_HISTO_CRED CHC ' +
            '                        WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
            '                              AND CHC.F_TRASPASO_VENC IS NULL)CHC  ' +
            '                 WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
            '                 UNION ' +
            '                SELECT CC.ID_CREDITO ' +
            '                  FROM CR_CREDITO CC ' +
            '                 WHERE CC.F_TRASPASO_VENC IS NULL ' +
            '               )CC ' +
            '         WHERE CC.ID_CREDITO = CFA.ID_CREDITO ' +
            '         GROUP BY CFA.ID_CREDITO ' +
            '       )VIG, ' +
            '       (SELECT CP.ID_CREDITO, ' +
            '               SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' +
            '                                            CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V'')))AS IMPORTE ' +
            '          FROM (SELECT * FROM CR_CAPITAL CP ' +
            '                 WHERE CP.F_VENCIMIENTO > ' + SQLFecha(dFecha) + ')CP, ' +
            '               (SELECT CHC.ID_CREDITO ' +
            '                  FROM CR_CREDITO CC, ' +
            '                      (SELECT * FROM CR_HISTO_CRED CHC ' +
            '                        WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
            '                              AND CHC.F_TRASPASO_VENC IS NOT NULL)CHC ' +
            '                 WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
            '                 UNION ' +
            '                SELECT CC.ID_CREDITO ' +
            '                  FROM CR_CREDITO CC ' +
            '                 WHERE CC.F_TRASPASO_VENC IS NOT NULL ' +
            '               )CC ' +
            '         WHERE CC.ID_CREDITO = CP.ID_CREDITO ' +
            '         GROUP BY CP.ID_CREDITO ' +
            '        UNION ALL ' +
            '        SELECT CFA.ID_CREDITO, ' +
            '               SUM(NVL(CFA.IMP_FINAN_ADIC,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFA.ID_CREDITO, ' +
            '               CFA.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V''))) AS IMPORTE ' +
            '          FROM (SELECT * FROM CR_FINAN_ADIC CFA ' +
            '                 WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) + ')CFA, ' +
            '               (SELECT CHC.ID_CREDITO  ' +
            '                  FROM CR_CREDITO CC, ' +
            '                      (SELECT * FROM CR_HISTO_CRED CHC ' +
            '                        WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
            '                              AND CHC.F_TRASPASO_VENC IS NOT NULL)CHC ' +
            '                 WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
            '                 UNION ' +
            '                SELECT CC.ID_CREDITO ' +
            '                  FROM CR_CREDITO CC ' +
            '                 WHERE CC.F_TRASPASO_VENC IS NOT NULL ' +
            '               )CC ' +
            '         WHERE CC.ID_CREDITO = CFA.ID_CREDITO ' +
            '         GROUP BY CFA.ID_CREDITO ' +
            '       )NE, ' +
            '       (SELECT CP.ID_CREDITO, ' +
            '               SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' +
            '                       CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V'')))AS IMPORTE ' +
            '          FROM (SELECT * FROM CR_CAPITAL CP ' +
            '                WHERE CP.F_PROG_PAGO <= ' + SQLFecha(dFecha) +
            '                      AND ((CP.F_PROG_PAGO < CP.F_PAGO AND CP.SIT_CAPITAL <> ''CA'' ' +
            '                      AND CP.F_PAGO > ' + SQLFecha(dFecha) + ') ' +
            '                      OR CP.SIT_CAPITAL = ''IM''))CP,  ' +
            '               (SELECT CHC.ID_CREDITO   ' +
            '                  FROM CR_CREDITO CC, ' +
            '                      (SELECT * FROM CR_HISTO_CRED CHC ' +
            '                        WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
            '                              AND CHC.F_TRASPASO_VENC IS NULL) CHC   ' +
            '                 WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
            '                 UNION ' +
            '                SELECT CC.ID_CREDITO ' +
            '                  FROM CR_CREDITO CC ' +
            '                 WHERE CC.F_TRASPASO_VENC IS NULL ' +
            '               )CC ' +
            '         WHERE CC.ID_CREDITO = CP.ID_CREDITO ' +
            '         GROUP BY CP.ID_CREDITO ' +
            '        UNION ALL ' +
            '        SELECT CFA.ID_CREDITO, ' +
            '               SUM(NVL(CFA.IMP_FINAN_ADIC,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFA.ID_CREDITO, ' +
            '                                                CFA.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V''))) AS IMPORTE ' +
            '          FROM (SELECT * FROM CR_FINAN_ADIC CFA ' +
            '                 WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) +
            '                       AND CFA.F_PROG_PAGO <= ' + SQLFecha(dFecha) +
            '                       AND ((CFA.F_PROG_PAGO < CFA.F_PAGO AND CFA.SIT_FINAN_ADIC <> ''CA'' ' +
            '                       AND CFA.F_PAGO > ' + SQLFecha(dFecha) + ') ' +
            '                       OR  CFA.SIT_FINAN_ADIC = ''IM''))CFA,  ' +
            '               (SELECT CHC.ID_CREDITO    ' +
            '                  FROM CR_CREDITO CC, ' +
            '                      (SELECT * FROM CR_HISTO_CRED CHC ' +
            '                        WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
            '                              AND CHC.F_TRASPASO_VENC IS NULL) CHC   ' +
            '                 WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
            '                 UNION ' +
            '                SELECT CC.ID_CREDITO ' +
            '                  FROM CR_CREDITO CC ' +
            '                 WHERE CC.F_TRASPASO_VENC IS NULL ' +
            '               )CC ' +
            '         WHERE CC.ID_CREDITO = CFA.ID_CREDITO ' +
            '         GROUP BY CFA.ID_CREDITO ' +
            '       )IMP, ' +
            '       (SELECT CP.ID_CREDITO, ' +
            '               SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' +
            '                                            CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V'')))AS IMPORTE ' +
            '          FROM (SELECT * FROM CR_CAPITAL CP ' +
            '                WHERE CP.F_PROG_PAGO <= ' + SQLFecha(dFecha) +
            '                AND ((CP.F_PROG_PAGO < CP.F_PAGO ' +
            '                AND CP.SIT_CAPITAL <> ''CA'' ' +
            '                AND CP.F_PAGO > ' + SQLFecha(dFecha) + ') ' +
            '                OR  CP.SIT_CAPITAL = ''IM''))CP,    ' +
            '               (SELECT CHC.ID_CREDITO    ' +
            '                  FROM CR_CREDITO CC, ' +
            '                      (SELECT * FROM CR_HISTO_CRED CHC ' +
            '                        WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
            '                              AND CHC.F_TRASPASO_VENC IS NOT NULL)CHC ' +
            '                 WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
            '                 UNION ' +
            '                SELECT CC.ID_CREDITO ' +
            '                  FROM CR_CREDITO CC ' +
            '                 WHERE CC.F_TRASPASO_VENC IS NOT NULL ' +
            '               )CC ' +
            '         WHERE CC.ID_CREDITO = CP.ID_CREDITO ' +
            '         GROUP BY CP.ID_CREDITO ' +
            '        UNION ALL ' +
            '        SELECT CFA.ID_CREDITO, ' +
            '               SUM(NVL(CFA.IMP_FINAN_ADIC,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFA.ID_CREDITO, ' +
            '                                                CFA.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V''))) AS IMPORTE ' +
            '          FROM (SELECT * FROM CR_FINAN_ADIC CFA ' +
            '                WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) +
            '                      AND CFA.F_PROG_PAGO <= ' + SQLFecha(dFecha) +
            '                      AND ((CFA.F_PROG_PAGO < CFA.F_PAGO AND CFA.SIT_FINAN_ADIC <> ''CA'' ' +
            '                      AND CFA.F_PAGO > ' + SQLFecha(dFecha) + ') ' +
            '                      OR  CFA.SIT_FINAN_ADIC = ''IM'')) CFA, ' +
            '               (SELECT CHC.ID_CREDITO ' +
            '                  FROM CR_CREDITO CC, ' +
            '                      (SELECT * FROM CR_HISTO_CRED CHC ' +
            '                        WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
            '                              AND CHC.F_TRASPASO_VENC IS NOT NULL)CHC ' +
            '                 WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
            '                 UNION ' +
            '                SELECT CC.ID_CREDITO ' +
            '                  FROM CR_CREDITO CC ' +
            '                 WHERE CC.F_TRASPASO_VENC IS NOT NULL ' +
            '               )CC ' +
            '         WHERE CC.ID_CREDITO = CFA.ID_CREDITO ' +
            '         GROUP BY CFA.ID_CREDITO ' +
            '       )EXIG ' +
            ' WHERE VIG.ID_CREDITO (+)= DATOS.ID_CREDITO ' +
            '    AND NE.ID_CREDITO (+)= DATOS.ID_CREDITO ' +
            '    AND IMP.ID_CREDITO (+)= DATOS.ID_CREDITO ' +
            '    AND EXIG.ID_CREDITO (+)= DATOS.ID_CREDITO ' +
            ' GROUP BY DATOS.ID_TITULAR, DATOS.ID_CREDITO, ' +
            '    DATOS.ID_CONTRATO, DATOS.NOMBRE, ' +
            '    DATOS.DESC_FUENTE_PAGO, DATOS.APL_INSCR_DEUD, ' +
            '    DATOS.ID_PERS_ASOCIAD, DATOS.NOMBRE_ASOC, ' +
            '    DATOS.ID_PROM_ADM, DATOS.NOMBRE_ADM, ' +
            '    DATOS.PCT_CAPITALIZA, DATOS.CVE_GPO_CAPITALIZ, ' +
            '    CALIF.NOM_CALIFICADORA1, CALIF.NOM_CALIFICADORA2, ' +
            '    CALIF.NOM_CALIFICADORA3, CALIF.NOM_CALIFICADORA4, ' +
            '    CALIF.NOM_CALIFICADORA5, CALIF.NOM_CALIFICADORA6, ' +
            '    CALIF.ID_CALIFICADORA1, CALIF.ID_CALIFICADORA2, ' +
            '    CALIF.ID_CALIFICADORA3, CALIF.ID_CALIFICADORA4, ' +
            '    CALIF.ID_CALIFICADORA5, CALIF.ID_CALIFICADORA6 ' +
            ' ORDER BY DATOS.NOMBRE_ASOC, DATOS.NOMBRE_ADM, DATOS.PCT_CAPITALIZA, DATOS.NOMBRE ';

   Result:= sSQL;
End;

End.
