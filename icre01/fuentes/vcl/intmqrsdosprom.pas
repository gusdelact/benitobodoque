Unit IntMQrSdosProm;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport;
Type
  TQrSdosProm = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qySdosProm: TQuery;
    QRSHPTCredito: TQRShape;
    QRLabel9: TQRLabel;
    QRSHPTF_Inicio: TQRShape;
    QRSHPTPlazo: TQRShape;
    QRLabel24: TQRLabel;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRSHPTChequera: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRFooterPromAsoc: TQRBand;
    QRLabel23: TQRLabel;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qrgrpFooterProducto: TQRBand;
    QRLabel36: TQRLabel;
    QRShape1: TQRShape;
    QRSHPOrigen: TQRShape;
    SummaryBand1: TQRBand;
    QRSHPSector: TQRShape;
    QRLabel52: TQRLabel;
    QRDBText38: TQRDBText;
    QRSHPMoneda: TQRShape;
    QRLabel46: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    qySdosPromDESC_MONEDA: TStringField;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel1: TQRLabel;
    qySdosPromCVE_MONEDA: TFloatField;
    QRDBText2: TQRDBText;
    qySdosPromCVE_PRODUCTO_CRE: TStringField;
    qySdosPromDESC_L_PRODUCTO: TStringField;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText20: TQRDBText;
    qySdosPromID_PERS_ASOCIAD: TFloatField;
    QRDBText6: TQRDBText;
    qySdosPromNOMBRE_ASOC: TStringField;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    qySdosPromID_PROM_ADM: TFloatField;
    QRPromAdmon: TQRGroup;
    qySdosPromNOMBRE_ADM: TStringField;
    QRFooterPromAdmon: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr41: TQRExpr;
    QRExpr42: TQRExpr;
    QRExpr43: TQRExpr;
    QRExpr44: TQRExpr;
    qySdosPromNOMBRE_TIT: TStringField;
    qySdosPromID_CREDITO: TFloatField;
    qySdosPromVIGENTE: TFloatField;
    qySdosPromNOEXIGIBLE: TFloatField;
    qySdosPromIMPAGADO: TFloatField;
    qySdosPromEXIGIBLE: TFloatField;
    QRLabel6: TQRLabel;
    QRShape5: TQRShape;
    QRLabel39: TQRLabel;
    QRShape6: TQRShape;
    QRLabel7: TQRLabel;
    QRShape7: TQRShape;
    QRLabel8: TQRLabel;
    QRShape8: TQRShape;
    QRLabel10: TQRLabel;
    qrgrpFooterMoneda: TQRBand;
    QRLabel28: TQRLabel;
    qySdosPromID_TITULAR: TFloatField;
    QRExpr13: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    qrlNUM_DIAS_VDOS: TQRLabel;
    qySdosPromDIAS_IMP: TFloatField;
    qySdosPromDIAS_NE: TFloatField;
    qySdosPromDIAS_EXIG: TFloatField;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  Private
  Public
    Function FormaQuery(sMoneda, sProducto, sPromAdm, sPromAsoc, sTitular,sEmpresa: String;
                        dFecha: TDateTime ): String;
  end;
Var
  QrSdosProm: TQrSdosProm;
  Apli : TInterApli;

Procedure RepSdosProm(sMoneda, sProducto, sPromAdm, sPromAsoc, sTitular,sEmpresa: String;
                      dFecha: TDateTime;
                      pAPli     : TInterApli;
                      pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepSdosProm(sMoneda, sProducto, sPromAdm, sPromAsoc, sTitular,sEmpresa: String;
                      dFecha: TDateTime;
                      pAPli     : TInterApli;
                      pPreview  : Boolean);
Var
   QrSdosProm: TQrSdosProm;
   Preview     : TIntQRPreview;
Begin
   QrSdosProm:=TQrSdosProm.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrSdosProm);
   Try

      Apli := pApli;
      QrSdosProm.QRInterEncabezado1.Apli:=pApli;
      QrSdosProm.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrSdosProm.QRInterEncabezado1.NomReporte:='IntMQrSdosProm';
      QrSdosProm.QRInterEncabezado1.Titulo1:='Reporte de Saldos por Promotor';
      QrSdosProm.QRInterEncabezado1.Titulo2:=' Al ' + DateToStr(dFecha);

      QrSdosProm.qySdosProm.DatabaseName := pApli.DataBaseName;
      QrSdosProm.qySdosProm.SessionName := pApli.SessionName;

      QrSdosProm.qySdosProm.Active:=False;
      QrSdosProm.qySdosProm.SQL.Text:= QrSdosProm.FormaQuery(sMoneda, sProducto, sPromAdm, sPromAsoc,
                                                             sTitular,sEmpresa, dFecha);
      QrSdosProm.qySdosProm.SQL.SaveToFile('c:\SdosProm.txt');
      QrSdosProm.qySdosProm.Active:=True;

      If pPreview Then
         QrSdosProm.Preview
      Else
         QrSdosProm.Print;
   Finally
      QrSdosProm.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrSdosProm.FormaQuery(sMoneda, sProducto, sPromAdm, sPromAsoc, sTitular,sEmpresa: String;
                                dFecha: TDateTime ): String;
Var
    sSQL:String;
Begin
    IF sMoneda   = '' THEN sMoneda   := 'NULL';
    IF sProducto = '' THEN sProducto := 'NULL';
    IF sPromAdm  = '' THEN sPromAdm  := 'NULL';
    IF sPromAsoc = '' THEN sPromAsoc := 'NULL';
    IF sTitular  = '' THEN sTitular  := 'NULL';
    IF sEmpresa  = '' THEN sEmpresa  := 'NULL';

    sSQL:= ' SELECT DATOS.ID_CREDITO, ' +
           '        DATOS.CVE_MONEDA, DATOS.DESC_MONEDA, ' +
           '        DATOS.CVE_PRODUCTO_CRE, DATOS.DESC_L_PRODUCTO, ' +
           '        DATOS.ID_PERS_ASOCIAD, DATOS.NOMBRE_ASOC, ' +
           '        DATOS.ID_PROM_ADM, DATOS.NOMBRE_ADM, ' +
           '        SUM(NVL(VIG.IMPORTE,0)) AS VIGENTE, ' +
           '        SUM(NVL(NE.IMPORTE,0)) AS NOEXIGIBLE, ' +
           '        SUM(NVL(IMP.IMPORTE,0)) AS IMPAGADO, ' +
           '        SUM(NVL(EXIG.IMPORTE,0)) AS EXIGIBLE, ' +
           '        DATOS.ID_EMPRESA, DATOS.ID_TITULAR, ' +
           '        DATOS.NOMBRE_TIT, ' +
           '        DECODE(SUM(NVL(NE.IMPORTE,0)),0,0,NE.DIAS) AS DIAS_NE, ' +
           '        DECODE(SUM(NVL(IMP.IMPORTE,0)),0,0,IMP.DIAS) AS DIAS_IMP, ' +
           '        DECODE(SUM(NVL(EXIG.IMPORTE,0)),0,0,EXIG.DIAS) AS DIAS_EXIG ' +

           ' FROM (SELECT CC.ID_CREDITO, CC.ID_CONTRATO, ' +
           '              CTO.CVE_MONEDA, MON.DESC_MONEDA, ' +
           '              CCTO.CVE_PRODUCTO_CRE, CPR.DESC_L_PRODUCTO, ' +
           '              CTO.ID_PERS_ASOCIAD, PASOC.NOMBRE NOMBRE_ASOC, ' +
           '              CC.ID_PROM_ADM, PADM.NOMBRE NOMBRE_ADM, CPR.ID_EMPRESA, ' +
           '              CTO.ID_TITULAR, PTIT.NOMBRE NOMBRE_TIT ' +
           '       FROM (SELECT * FROM CR_CREDITO CC ' +
           '             WHERE CC.F_AUTORIZA <=  ' + SQLFecha(dFecha) +
           '               AND (CC.F_LIQUIDACION >=  ' + SQLFecha(dFecha) +
           '               OR CC.F_LIQUIDACION IS NULL)) CC, ' +
           '            CR_CONTRATO CCTO, CONTRATO CTO, CR_PRODUCTO CPR, ' +
           '            MONEDA MON, PERSONA PASOC, PERSONA PADM, PERSONA PTIT ' +

           '       WHERE CCTO.ID_CONTRATO = CC.ID_CONTRATO ' +
           '         AND CCTO.FOL_CONTRATO = CC.FOL_CONTRATO ' +
           '         AND CTO.ID_CONTRATO = CCTO.ID_CONTRATO ' +
           '         AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE ' +
           '         AND MON.CVE_MONEDA = CTO.CVE_MONEDA ' +
           '         AND PASOC.ID_PERSONA = CTO.ID_PERS_ASOCIAD ' +
           '         AND PADM.ID_PERSONA = CC.ID_PROM_ADM ' +
           '         AND PTIT.ID_PERSONA = CTO.ID_TITULAR ' +

           '         AND CTO.CVE_MONEDA = DECODE(' + sMoneda + ',0,CTO.CVE_MONEDA,' + sMoneda + ') ' +
           '         AND CCTO.CVE_PRODUCTO_CRE = DECODE(' + SQLStr(sProducto) + ',0,CCTO.CVE_PRODUCTO_CRE,' + SQLStr(sProducto) + ') ' +
           '         AND CTO.ID_PERS_ASOCIAD= DECODE(' + sPromAsoc + ',0,CTO.ID_PERS_ASOCIAD,' + sPromAsoc + ') ' +
           '         AND CC.ID_PROM_ADM = DECODE(' + sPromAdm + ',0,CC.ID_PROM_ADM,' + sPromAdm + ') ' +
           '         AND  CTO.ID_EMPRESA = DECODE(' + sEmpresa + ',0,CTO.ID_EMPRESA,' + sEmpresa + ') ' +
           '         AND CTO.ID_TITULAR = DECODE(' + sTitular + ',0,CTO.ID_TITULAR,' + sTitular + ') ' +
           '      )DATOS, ' +
           '      (SELECT CP.ID_CREDITO, ' +
           '              SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' +
           '              CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) +',''V'')))AS IMPORTE ' +
           '       FROM (SELECT * FROM CR_CAPITAL CP ' +
           '             WHERE CP.F_VENCIMIENTO > ' + SQLFecha(dFecha) +
           '            ) CP, ' +
           '            (SELECT CHC.ID_CREDITO ' +
           '             FROM CR_CREDITO CC, ' +
           '                (SELECT * FROM CR_HISTO_CRED CHC ' +
           '                 WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
           '                   AND CHC.F_TRASPASO_VENC IS NULL ' +
           '                ) CHC ' +
           '             WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
           '            UNION ' +
           '             SELECT CC.ID_CREDITO ' +
           '             FROM CR_CREDITO CC ' +
           '             WHERE CC.F_TRASPASO_VENC IS NULL ' +
           '            )CC ' +
           '       WHERE CP.ID_CREDITO = CC.ID_CREDITO ' +
           '       GROUP BY CP.ID_CREDITO,CP.F_VENCIMIENTO ' +
           '      UNION ALL ' +
           '       SELECT CFA.ID_CREDITO, ' +
           '              SUM(NVL(CFA.IMP_FINAN_ADIC,0)- (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'', ' +
           '              CFA.ID_CREDITO,CFA.NUM_PERIODO, NULL,' + SQLFecha(dFecha) +',''V''))) AS IMPORTE ' +
           '       FROM (SELECT * FROM CR_FINAN_ADIC CFA ' +
           '             WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) +
           '            )CFA, ' +
           '            (SELECT CHC.ID_CREDITO ' +
           '             FROM CR_CREDITO CC, ' +
           '                  (SELECT * FROM CR_HISTO_CRED CHC ' +
           '                   WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
           '                     AND CHC.F_TRASPASO_VENC IS NULL ' +
           '                  ) CHC ' +
           '             WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
           '            UNION ' +
           '             SELECT CC.ID_CREDITO ' +
           '             FROM CR_CREDITO CC ' +
           '             WHERE CC.F_TRASPASO_VENC IS NULL ' +
           '            )CC ' +
           '       WHERE CC.ID_CREDITO = CFA.ID_CREDITO ' +
           '       GROUP BY CFA.ID_CREDITO,CFA.F_VENCIMIENTO ' +
           '      )VIG, ' +
           '      (SELECT CP.ID_CREDITO, ' +
           '              SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' +
           '              CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) +',''V'')))AS IMPORTE, ' +
           '              CP.F_VENCIMIENTO, ' + SQLFecha(dFecha) + ' -CP.F_VENCIMIENTO AS DIAS ' +

           '       FROM (SELECT * FROM CR_CAPITAL CP ' +
           '             WHERE CP.F_VENCIMIENTO > ' + SQLFecha(dFecha) +
           '            )CP, ' +
           '            (SELECT CHC.ID_CREDITO ' +
           '             FROM CR_CREDITO CC, ' +
           '                  (SELECT * FROM CR_HISTO_CRED CHC ' +
           '                   WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
           '                     AND CHC.F_TRASPASO_VENC IS NOT NULL ' +
           '                  )CHC ' +
           '             WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
           '            UNION ' +
           '             SELECT CC.ID_CREDITO ' +
           '             FROM CR_CREDITO CC ' +
           '             WHERE CC.F_TRASPASO_VENC IS NOT NULL ' +
           '            )CC ' +
           '       WHERE CC.ID_CREDITO = CP.ID_CREDITO ' +
           '       GROUP BY CP.ID_CREDITO,CP.F_VENCIMIENTO ' +
           '      UNION ALL ' +
           '       SELECT CFA.ID_CREDITO, ' +
           '              SUM(NVL(CFA.IMP_FINAN_ADIC,0)- (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'', ' +
           '              CFA.ID_CREDITO,CFA.NUM_PERIODO,NULL,' + SQLFecha(dFecha) +',''V''))) AS IMPORTE, ' +
           '              CFA.F_VENCIMIENTO, ' + SQLFecha(dFecha) +' - CFA.F_VENCIMIENTO AS DIAS ' +
           '       FROM (SELECT * FROM CR_FINAN_ADIC CFA ' +
           '             WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) +
           '            )CFA, ' +
           '            (SELECT CHC.ID_CREDITO ' +
           '             FROM CR_CREDITO CC, ' +
           '                 (SELECT * FROM CR_HISTO_CRED CHC ' +
           '                  WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
           '                    AND CHC.F_TRASPASO_VENC IS NOT NULL ' +
           '                 )CHC ' +
           '             WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
           '            UNION ' +
           '             SELECT CC.ID_CREDITO ' +
           '             FROM CR_CREDITO CC ' +
           '             WHERE CC.F_TRASPASO_VENC IS NOT NULL ' +
           '            )CC ' +
           '       WHERE CC.ID_CREDITO = CFA.ID_CREDITO ' +
           '       GROUP BY CFA.ID_CREDITO,CFA.F_VENCIMIENTO ' +
           '      )NE, ' +
           '      (SELECT CP.ID_CREDITO, ' +
           '              SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' +
           '              CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) +' ,''V'')))AS IMPORTE, ' +
           '              CP.F_VENCIMIENTO, ' + SQLFecha(dFecha) +' -CP.F_VENCIMIENTO AS DIAS ' +
           '       FROM (SELECT * FROM CR_CAPITAL CP ' +
           '             WHERE CP.F_PROG_PAGO <= ' + SQLFecha(dFecha) +
           '               AND ((CP.F_PROG_PAGO < CP.F_PAGO AND CP.SIT_CAPITAL <>''CA'' ' +
           '               AND   CP.F_PAGO > ' + SQLFecha(dFecha) + ' ) ' +
           '                   OR CP.SIT_CAPITAL = ''IM'') ' +
           '            )CP, ' +
           '           (SELECT CHC.ID_CREDITO ' +
           '            FROM CR_CREDITO CC, ' +
           '                (SELECT * FROM CR_HISTO_CRED CHC ' +
           '                 WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
           '                    AND CHC.F_TRASPASO_VENC IS NULL ' +
           '                ) CHC ' +
           '            WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
           '           UNION ' +
           '            SELECT CC.ID_CREDITO ' +
           '            FROM CR_CREDITO CC ' +
           '            WHERE CC.F_TRASPASO_VENC IS NULL ' +
           '           )CC ' +
           '       WHERE CC.ID_CREDITO = CP.ID_CREDITO ' +
           '       GROUP BY CP.ID_CREDITO,CP.F_VENCIMIENTO ' +
           '      UNION ALL ' +
           '       SELECT CFA.ID_CREDITO, ' +
           '              SUM(NVL(CFA.IMP_FINAN_ADIC,0)- (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'', ' +
           '              CFA.ID_CREDITO,CFA.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ' ,''V''))) AS IMPORTE, ' +
           '              CFA.F_VENCIMIENTO, ' + SQLFecha(dFecha) + ' - CFA.F_VENCIMIENTO AS DIAS ' +

           '       FROM (SELECT * FROM CR_FINAN_ADIC CFA ' +
           '             WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) +
           '               AND   CFA.F_PROG_PAGO <= ' + SQLFecha(dFecha) +
           '               AND ((CFA.F_PROG_PAGO < CFA.F_PAGO AND CFA.SIT_FINAN_ADIC <> ''CA'' ' +
           '               AND   CFA.F_PAGO > ' + SQLFecha(dFecha) + ' ) ' +
           '                   OR   CFA.SIT_FINAN_ADIC = ''IM'') ' +
           '            )CFA, ' +
           '            (SELECT CHC.ID_CREDITO ' +
           '             FROM CR_CREDITO CC, ' +
           '                  (SELECT * FROM CR_HISTO_CRED CHC ' +
           '                   WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
           '                     AND CHC.F_TRASPASO_VENC IS NULL) CHC ' +
           '             WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
           '            UNION ' +
           '             SELECT CC.ID_CREDITO ' +
           '             FROM CR_CREDITO CC ' +
           '             WHERE CC.F_TRASPASO_VENC IS NULL ' +
           '            )CC ' +
           '       WHERE CC.ID_CREDITO = CFA.ID_CREDITO ' +
           '       GROUP BY CFA.ID_CREDITO,CFA.F_VENCIMIENTO ' +
           '      )IMP, ' +
           '      (SELECT CP.ID_CREDITO, ' +
           '              SUM(NVL(CP.IMP_CAPITAL,0) -(PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' +
           '              CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ' ,''V'')))AS IMPORTE, ' +
           '              CP.F_VENCIMIENTO, ' + SQLFecha(dFecha) + ' - CP.F_VENCIMIENTO AS DIAS ' +
           '       FROM (SELECT * FROM CR_CAPITAL CP ' +
           '             WHERE   CP.F_PROG_PAGO <= ' + SQLFecha(dFecha) +
           '               AND   ((CP.F_PROG_PAGO < CP.F_PAGO AND CP.SIT_CAPITAL <>''CA'' ' +
           '               AND     CP.F_PAGO > ' + SQLFecha(dFecha) +' ) ' +
           '                    OR     CP.SIT_CAPITAL = ''IM''))CP, ' +
           '            (SELECT CHC.ID_CREDITO ' +
           '             FROM CR_CREDITO CC, ' +
           '                  (SELECT * FROM CR_HISTO_CRED CHC ' +
           '                   WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
           '                     AND CHC.F_TRASPASO_VENC IS NULL)CHC ' +
           '             WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
           '            UNION ' +
           '             SELECT CC.ID_CREDITO ' +
           '             FROM CR_CREDITO CC ' +
           '             WHERE CC.F_TRASPASO_VENC IS NULL ' +
           '            )CC ' +
           '       WHERE CC.ID_CREDITO = CP.ID_CREDITO ' +
           '       GROUP BY CP.ID_CREDITO,CP.F_VENCIMIENTO ' +
           '      UNION ALL ' +
           '       SELECT CFA.ID_CREDITO, ' +
           '              SUM(NVL(CFA.IMP_FINAN_ADIC,0)- (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFA.ID_CREDITO,CFA.NUM_PERIODO, ' +
           '              NULL,' + SQLFecha(dFecha) + ' ,''V''))) AS IMPORTE, ' +
           '              CFA.F_VENCIMIENTO, ' + SQLFecha(dFecha) + ' - CFA.F_VENCIMIENTO AS DIAS ' +
           '       FROM (SELECT *  FROM CR_FINAN_ADIC CFA ' +
           '             WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) +
           '               AND CFA.F_PROG_PAGO <= ' + SQLFecha(dFecha) +
           '               AND ((CFA.F_PROG_PAGO < CFA.F_PAGO AND CFA.SIT_FINAN_ADIC <> ''CA'' ' +
           '               AND   CFA.F_PAGO > ' + SQLFecha(dFecha) + ') ' +
           '                    OR CFA.SIT_FINAN_ADIC = ''IM'')) CFA, ' +
           '            (SELECT CHC.ID_CREDITO ' +
           '             FROM CR_CREDITO CC, ' +
           '                 (SELECT * FROM CR_HISTO_CRED CHC ' +
           '                  WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
           '                    AND CHC.F_TRASPASO_VENC IS NOT NULL ' +
           '                 )CHC ' +
           '             WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
           '            UNION ' +
           '             SELECT CC.ID_CREDITO ' +
           '             FROM CR_CREDITO CC ' +
           '             WHERE CC.F_TRASPASO_VENC IS NOT NULL ' +
           '           )CC ' +
           '       WHERE CC.ID_CREDITO = CFA.ID_CREDITO ' +
           '       GROUP BY CFA.ID_CREDITO,CFA.F_VENCIMIENTO ' +
           '      )EXIG ' +

           ' WHERE VIG.ID_CREDITO (+)= DATOS.ID_CREDITO ' +
           '   AND NE.ID_CREDITO (+)= DATOS.ID_CREDITO ' +
           '   AND IMP.ID_CREDITO (+)= DATOS.ID_CREDITO ' +
           '   AND EXIG.ID_CREDITO (+)= DATOS.ID_CREDITO ' +
           ' GROUP BY DATOS.ID_CREDITO, ' +
           '        DATOS.CVE_MONEDA, DATOS.DESC_MONEDA, ' +
           '        DATOS.CVE_PRODUCTO_CRE, DATOS.DESC_L_PRODUCTO, ' +
           '        DATOS.ID_PERS_ASOCIAD, DATOS.NOMBRE_ASOC, ' +
           '        DATOS.ID_PROM_ADM, DATOS.NOMBRE_ADM, ' +
           '        DATOS.ID_EMPRESA, DATOS.ID_TITULAR, ' +
           '        DATOS.NOMBRE_TIT, NE.DIAS, IMP.DIAS, EXIG.DIAS ';

   Result:= sSQL;
End;

procedure TQrSdosProm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrlNUM_DIAS_VDOS.Caption := '';
   IF ( qySdosPromDIAS_IMP.AsInteger > 0) OR (qySdosPromDIAS_EXIG.AsInteger > 0)OR (qySdosPromDIAS_NE.AsInteger > 0) THEN BEGIN
      IF qySdosPromDIAS_IMP.AsInteger >= qySdosPromDIAS_EXIG.AsInteger THEN BEGIN
         IF qySdosPromDIAS_IMP.AsInteger >= qySdosPromDIAS_NE.AsInteger THEN
            qrlNUM_DIAS_VDOS.Caption := qySdosPromDIAS_IMP.AsString
         else
            qrlNUM_DIAS_VDOS.Caption :=  qySdosPromDIAS_NE.AsString;
      END
      ELSE BEGIN
         IF qySdosPromDIAS_EXIG.AsInteger >= qySdosPromDIAS_NE.AsInteger THEN
            qrlNUM_DIAS_VDOS.Caption := qySdosPromDIAS_EXIG.AsString
         else
            qrlNUM_DIAS_VDOS.Caption := qySdosPromDIAS_NE.AsString
      END;
   END;
end;

End.
