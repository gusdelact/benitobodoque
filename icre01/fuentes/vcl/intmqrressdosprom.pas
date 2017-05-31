Unit IntMQrResSdosProm;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport;
Type
  TQrResSdosProm = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qyResSdosProm: TQuery;
    QRSHPTF_Inicio: TQRShape;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRSHPTChequera: TQRShape;
    QRLabel13: TQRLabel;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qrgrpFooterProducto: TQRBand;
    QRLabel36: TQRLabel;
    QRShape1: TQRShape;
    SummaryBand1: TQRBand;
    QRSHPSector: TQRShape;
    QRLabel52: TQRLabel;
    QRDBText38: TQRDBText;
    QRSHPMoneda: TQRShape;
    QRLabel46: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    qyResSdosPromDESC_MONEDA: TStringField;
    QRLabel1: TQRLabel;
    qyResSdosPromCVE_MONEDA: TFloatField;
    qyResSdosPromCVE_PRODUCTO_CRE: TStringField;
    qyResSdosPromDESC_L_PRODUCTO: TStringField;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText20: TQRDBText;
    qyResSdosPromID_PERS_ASOCIAD: TFloatField;
    qyResSdosPromID_PROM_ADM: TFloatField;
    qyResSdosPromVIGENTE: TFloatField;
    qyResSdosPromNOEXIGIBLE: TFloatField;
    qyResSdosPromIMPAGADO: TFloatField;
    qyResSdosPromEXIGIBLE: TFloatField;
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
    QRExpr13: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRDBText2: TQRDBText;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    qrlEtiq_NOM_PROM: TQRLabel;
    qrlNOM_PROMOTOR: TQRLabel;
    qyResSdosPromNOMBRE_ASOC: TStringField;
    qyResSdosPromNOMBRE_ADM: TStringField;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  Private
  Public
    Function FormaQuery(sMoneda, sProducto, sPromAdm, sPromAsoc, sTipPromotor, sEmpresa: String;
                        dFecha: TDateTime ): String;
  end;
Var
  QrResSdosProm: TQrResSdosProm;
  Apli : TInterApli;
  sTipoProm: String;

Procedure RepResSdosProm(sMoneda, sProducto, sPromAdm, sPromAsoc, sTipPromotor, sEmpresa: String;
                      dFecha: TDateTime;
                      pAPli     : TInterApli;
                      pPreview  : Boolean);

Implementation
{$R *.DFM}

Procedure RepResSdosProm(sMoneda, sProducto, sPromAdm, sPromAsoc, sTipPromotor, sEmpresa: String;
                      dFecha: TDateTime;
                      pAPli     : TInterApli;
                      pPreview  : Boolean);
Var
   QrResSdosProm: TQrResSdosProm;
   Preview     : TIntQRPreview;
Begin
   QrResSdosProm:=TQrResSdosProm.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrResSdosProm);
   Try

      Apli := pApli;
      QrResSdosProm.QRInterEncabezado1.Apli:=pApli;
      QrResSdosProm.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrResSdosProm.QRInterEncabezado1.NomReporte:='IntMQrResSdosProm';

      sTipoProm := sTipPromotor;

      IF sTipPromotor = 'ASC' THEN
         QrResSdosProm.QRInterEncabezado1.Titulo1:='Reporte de Saldos por Promotor Asociado'
      ELSE IF sTipPromotor = 'ADM' THEN
         QrResSdosProm.QRInterEncabezado1.Titulo1:='Reporte de Saldos por Promotor Administrador';
      //END IF;

      QrResSdosProm.QRInterEncabezado1.Titulo2:=' Al ' + DateToStr(dFecha);

      QrResSdosProm.qyResSdosProm.DatabaseName := pApli.DataBaseName;
      QrResSdosProm.qyResSdosProm.SessionName := pApli.SessionName;

      QrResSdosProm.qyResSdosProm.Active:=False;
      QrResSdosProm.qyResSdosProm.SQL.Text:= QrResSdosProm.FormaQuery(sMoneda, sProducto, sPromAdm, sPromAsoc,
                                                                      sTipPromotor, sEmpresa, dFecha);
      QrResSdosProm.qyResSdosProm.SQL.SaveToFile('c:\ResSdosProm.txt');
      QrResSdosProm.qyResSdosProm.Active:=True;

      If pPreview Then
         QrResSdosProm.Preview
      Else
         QrResSdosProm.Print;
   Finally
      QrResSdosProm.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrResSdosProm.FormaQuery(sMoneda, sProducto, sPromAdm, sPromAsoc, sTipPromotor, sEmpresa: String;
                                dFecha: TDateTime ): String;
Var
    sSQL:String;
Begin
    IF sMoneda   = '' THEN sMoneda   := 'NULL';
    IF sProducto = '' THEN sProducto := 'NULL';
    IF sPromAdm  = '' THEN sPromAdm  := 'NULL';
    IF sPromAsoc = '' THEN sPromAsoc := 'NULL';
    IF sEmpresa  = '' THEN sEmpresa  := 'NULL';

    sSQL:= ' SELECT ' +
           '       DATOS.CVE_MONEDA, DATOS.DESC_MONEDA, ' +
           '       DATOS.CVE_PRODUCTO_CRE,        DATOS.DESC_L_PRODUCTO, ' +
           '       DATOS.ID_PERS_ASOCIAD, DATOS.NOMBRE_ASOC, ' +
           '       DATOS.ID_PROM_ADM, DATOS.NOMBRE_ADM, ' +
           '       NVL(VIG.IMPORTE,0) AS VIGENTE, ' +
           '       NVL(NE.IMPORTE,0) AS NOEXIGIBLE, ' +
           '       NVL(IMP.IMPORTE,0) AS IMPAGADO, ' +
           '       NVL(EXIG.IMPORTE,0) AS EXIGIBLE, ' +
           '       DATOS.ID_EMPRESA ' +

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

           '      WHERE CCTO.ID_CONTRATO = CC.ID_CONTRATO ' +
           '        AND CCTO.FOL_CONTRATO = CC.FOL_CONTRATO ' +
           '        AND CTO.ID_CONTRATO = CCTO.ID_CONTRATO ' +
           '        AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE ' +
           '        AND MON.CVE_MONEDA = CTO.CVE_MONEDA ' +
           '        AND PASOC.ID_PERSONA = CTO.ID_PERS_ASOCIAD ' +
           '        AND PADM.ID_PERSONA = CC.ID_PROM_ADM ' +
           '        AND PTIT.ID_PERSONA = CTO.ID_TITULAR ' +
           '        AND CTO.CVE_MONEDA = DECODE(' + sMoneda + ',0,CTO.CVE_MONEDA,' + sMoneda + ') ' +
           '        AND CCTO.CVE_PRODUCTO_CRE = DECODE(' + sProducto + ',0,CCTO.CVE_PRODUCTO_CRE,' + sProducto + ') ' +
           '        AND CTO.ID_PERS_ASOCIAD = DECODE(' + sPromAsoc + ',0,CTO.ID_PERS_ASOCIAD,' + sPromAsoc + ') ' +
           '        AND CC.ID_PROM_ADM = DECODE(' + sPromAdm + ',0,CC.ID_PROM_ADM,' + sPromAdm + ') ' +
           '        AND CTO.ID_EMPRESA = DECODE(' + sEmpresa + ',0,CTO.ID_EMPRESA,' + sEmpresa + ') ' +
           '      )DATOS, ' +
           '     (SELECT CP.ID_CREDITO, ' +
           '             SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' +
           '             CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V'')))AS IMPORTE ' +
           '      FROM (SELECT * FROM CR_CAPITAL CP ' +
           '            WHERE CP.F_VENCIMIENTO > ' + SQLFecha(dFecha) +
           '           ) CP, ' +
           '           (SELECT CHC.ID_CREDITO ' +
           '            FROM CR_CREDITO CC, ' +
           '                (SELECT * FROM CR_HISTO_CRED CHC ' +
           '                 WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
           '                   AND CHC.F_TRASPASO_VENC IS NULL ' +
           '                ) CHC ' +
           '            WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
           '           UNION ' +
           '            SELECT CC.ID_CREDITO ' +
           '            FROM CR_CREDITO CC ' +
           '            WHERE CC.F_TRASPASO_VENC IS NULL ' +
           '           )CC ' +
           '      WHERE CP.ID_CREDITO = CC.ID_CREDITO ' +
           '      GROUP BY CP.ID_CREDITO ' +
           '     UNION ALL ' +
           '      SELECT CFA.ID_CREDITO, ' +
           '             SUM(NVL(CFA.IMP_FINAN_ADIC,0)- (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'', ' +
           '             CFA.ID_CREDITO,CFA.NUM_PERIODO, NULL,' + SQLFecha(dFecha) + ',''V''))) AS IMPORTE ' +
           '      FROM (SELECT * FROM CR_FINAN_ADIC CFA ' +
           '            WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) +
           '           )CFA, ' +
           '          (SELECT CHC.ID_CREDITO ' +
           '           FROM CR_CREDITO CC, ' +
           '                (SELECT * FROM CR_HISTO_CRED CHC ' +
           '                 WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
           '                   AND CHC.F_TRASPASO_VENC IS NULL ' +
           '                ) CHC ' +
           '           WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
           '          UNION ' +
           '           SELECT CC.ID_CREDITO ' +
           '           FROM CR_CREDITO CC ' +
           '           WHERE CC.F_TRASPASO_VENC IS NULL ' +
           '          )CC ' +
           '      WHERE CC.ID_CREDITO = CFA.ID_CREDITO ' +
           '      GROUP BY CFA.ID_CREDITO ' +
           '     )VIG, ' +
           '     (SELECT CP.ID_CREDITO, ' +
           '             SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' +
           '             CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V'')))AS IMPORTE ' +
           '      FROM (SELECT * FROM CR_CAPITAL CP ' +
           '            WHERE CP.F_VENCIMIENTO > ' + SQLFecha(dFecha) +
           '           )CP, ' +
           '          (SELECT CHC.ID_CREDITO ' +
           '           FROM CR_CREDITO CC, ' +
           '               (SELECT * FROM CR_HISTO_CRED CHC ' +
           '                WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
           '                AND CHC.F_TRASPASO_VENC IS NOT NULL ' +
           '               )CHC ' +
           '           WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
           '          UNION ' +
           '           SELECT CC.ID_CREDITO ' +
           '           FROM CR_CREDITO CC ' +
           '           WHERE CC.F_TRASPASO_VENC IS NOT NULL ' +
           '          )CC ' +
           '      WHERE CC.ID_CREDITO = CP.ID_CREDITO ' +
           '      GROUP BY CP.ID_CREDITO ' +
           '     UNION ALL ' +
           '      SELECT CFA.ID_CREDITO, ' +
           '             SUM(NVL(CFA.IMP_FINAN_ADIC,0)- (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'', ' +
           '             CFA.ID_CREDITO,CFA.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V''))) AS IMPORTE ' +
           '      FROM (SELECT * FROM CR_FINAN_ADIC CFA ' +
           '            WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) +
           '           )CFA, ' +
           '          (SELECT CHC.ID_CREDITO ' +
           '           FROM CR_CREDITO CC, ' +
           '                (SELECT * FROM CR_HISTO_CRED CHC ' +
           '                 WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
           '                   AND CHC.F_TRASPASO_VENC IS NOT NULL ' +
           '                )CHC ' +
           '           WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
           '          UNION ' +
           '           SELECT CC.ID_CREDITO ' +
           '           FROM CR_CREDITO CC ' +
           '           WHERE CC.F_TRASPASO_VENC IS NOT NULL ' +
           '          )CC ' +
           '      WHERE CC.ID_CREDITO = CFA.ID_CREDITO ' +
           '      GROUP BY CFA.ID_CREDITO ' +
           '     )NE, ' +
           '     (SELECT CP.ID_CREDITO, ' +
           '             SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' +
           '             CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V'')))AS IMPORTE ' +
           '      FROM (SELECT * FROM CR_CAPITAL CP ' +
           '            WHERE CP.F_PROG_PAGO <= ' + SQLFecha(dFecha) +
           '              AND ((CP.F_PROG_PAGO < CP.F_PAGO AND CP.SIT_CAPITAL <>''CA'' ' +
           '              AND   CP.F_PAGO > ' + SQLFecha(dFecha) + ') ' +
           '                 OR CP.SIT_CAPITAL = ''IM'') ' +
           '           )CP, ' +
           '          (SELECT CHC.ID_CREDITO ' +
           '           FROM CR_CREDITO CC, ' +
           '                (SELECT * FROM CR_HISTO_CRED CHC ' +
           '                 WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
           '                   AND CHC.F_TRASPASO_VENC IS NULL ' +
           '                ) CHC ' +
           '           WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
           '          UNION ' +
           '           SELECT CC.ID_CREDITO ' +
           '           FROM CR_CREDITO CC ' +
           '           WHERE CC.F_TRASPASO_VENC IS NULL ' +
           '         )CC ' +
           '      WHERE CC.ID_CREDITO = CP.ID_CREDITO ' +
           '      GROUP BY CP.ID_CREDITO ' +
           '     UNION ALL ' +
           '      SELECT CFA.ID_CREDITO, ' +
           '             SUM(NVL(CFA.IMP_FINAN_ADIC,0)- (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'', ' +
           '             CFA.ID_CREDITO,CFA.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V''))) AS IMPORTE ' +
           '             FROM (SELECT * FROM CR_FINAN_ADIC CFA ' +
           '                   WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) +
           '                     AND   CFA.F_PROG_PAGO <= ' + SQLFecha(dFecha) +
           '                     AND ((CFA.F_PROG_PAGO < CFA.F_PAGO AND CFA.SIT_FINAN_ADIC <> ''CA'' ' +
           '                     AND   CFA.F_PAGO > ' + SQLFecha(dFecha) + ') ' +
           '                        OR   CFA.SIT_FINAN_ADIC = ''IM'') ' +
           '                  )CFA, ' +
           '                  (SELECT CHC.ID_CREDITO ' +
           '                   FROM CR_CREDITO CC, ' +
           '                        (SELECT * FROM CR_HISTO_CRED CHC ' +
           '                         WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
           '                         AND CHC.F_TRASPASO_VENC IS NULL) CHC ' +
           '                   WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
           '                  UNION ' +
           '                   SELECT CC.ID_CREDITO ' +
           '                   FROM CR_CREDITO CC ' +
           '                   WHERE CC.F_TRASPASO_VENC IS NULL ' +
           '                  )CC ' +
           '             WHERE CC.ID_CREDITO = CFA.ID_CREDITO ' +
           '             GROUP BY CFA.ID_CREDITO ' +
           '     )IMP, ' +
           '     (SELECT CP.ID_CREDITO, ' +
           '             SUM(NVL(CP.IMP_CAPITAL,0) -(PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' +
           '             CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V'')))AS IMPORTE ' +
           '      FROM (SELECT * FROM CR_CAPITAL CP ' +
           '            WHERE   CP.F_PROG_PAGO <= ' + SQLFecha(dFecha) +
           '              AND   ((CP.F_PROG_PAGO < CP.F_PAGO AND CP.SIT_CAPITAL <>''CA'' ' +
           '              AND     CP.F_PAGO > ' + SQLFecha(dFecha) + ') ' +
           '                  OR     CP.SIT_CAPITAL = ''IM''))CP, ' +
           '           (SELECT CHC.ID_CREDITO ' +
           '            FROM CR_CREDITO CC, ' +
           '                (SELECT * FROM CR_HISTO_CRED CHC ' +
           '                 WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) + 
           '                   AND CHC.F_TRASPASO_VENC IS NULL)CHC ' +
           '            WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
           '           UNION ' +
           '            SELECT CC.ID_CREDITO ' +
           '            FROM CR_CREDITO CC ' +
           '            WHERE CC.F_TRASPASO_VENC IS NULL ' +
           '           )CC ' +
           '      WHERE CC.ID_CREDITO = CP.ID_CREDITO ' +
           '      GROUP BY CP.ID_CREDITO ' +
           '     UNION ALL ' +
           '      SELECT CFA.ID_CREDITO, ' +
           '             SUM(NVL(CFA.IMP_FINAN_ADIC,0)- (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFA.ID_CREDITO,CFA.NUM_PERIODO, ' +
           '             NULL,' + SQLFecha(dFecha) + ',''V''))) AS IMPORTE ' +
           '      FROM (SELECT *  FROM CR_FINAN_ADIC CFA ' +
           '            WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) +
           '              AND CFA.F_PROG_PAGO <= ' + SQLFecha(dFecha) +
           '              AND ((CFA.F_PROG_PAGO < CFA.F_PAGO AND CFA.SIT_FINAN_ADIC <> ''CA'' ' +
           '              AND   CFA.F_PAGO > ' + SQLFecha(dFecha) + ') ' +
           '                 OR CFA.SIT_FINAN_ADIC = ''IM'')) CFA, ' +
           '           (SELECT CHC.ID_CREDITO ' +
           '            FROM CR_CREDITO CC, ' +
           '                (SELECT * FROM CR_HISTO_CRED CHC ' +
           '                 WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
           '                 AND CHC.F_TRASPASO_VENC IS NOT NULL ' +
           '                )CHC ' +
           '            WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' +
           '           UNION ' +
           '            SELECT CC.ID_CREDITO ' +
           '            FROM CR_CREDITO CC ' +
           '            WHERE CC.F_TRASPASO_VENC IS NOT NULL ' +
           '           )CC ' +
           '      WHERE CC.ID_CREDITO = CFA.ID_CREDITO ' +
           '      GROUP BY CFA.ID_CREDITO ' +
           '     )EXIG ' +
           ' WHERE VIG.ID_CREDITO (+)= DATOS.ID_CREDITO ' +
           '   AND NE.ID_CREDITO (+)= DATOS.ID_CREDITO ' +
           '   AND IMP.ID_CREDITO (+)= DATOS.ID_CREDITO ' +
           '   AND EXIG.ID_CREDITO (+)= DATOS.ID_CREDITO ';

   Result:= sSQL;
End;

procedure TQrResSdosProm.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
      IF sTipoProm = 'ASC' THEN
         qrlEtiq_NOM_PROM.Caption :='Nombre Promotor Asociado'
      ELSE IF sTipoProm = 'ADM' THEN
         qrlEtiq_NOM_PROM.Caption :='Nombre Promotor Administrador'
      //END IF;
end;

procedure TQrResSdosProm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
      IF sTipoProm = 'ASC' THEN
         qrlNOM_PROMOTOR.Caption := qyResSdosPromNOMBRE_ASOC.AsString
      ELSE IF sTipoProm = 'ADM' THEN
         qrlNOM_PROMOTOR.Caption := qyResSdosPromNOMBRE_ADM.AsString;
      //END IF;
end;

End.
