Unit IntMQrMovEntFe;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport;
Type
  TQrMovEntFe = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qyMovEntFe: TQuery;
    QRSHPTCredito: TQRShape;
    QRLabel9: TQRLabel;
    QRSHPTMonto: TQRShape;
    QRLabel18: TQRLabel;
    QRSHPTSaldoIsoluto: TQRShape;
    QRLabel20: TQRLabel;
    QRSHPTF_Inicio: TQRShape;
    QRBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText10: TQRDBText;
    QRSHPTProveedor: TQRShape;
    QRLabel33: TQRLabel;
    QRDBText24: TQRDBText;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qrgrpFooterMoneda: TQRBand;
    QRGroupContador: TQRGroup;
    QRGroupMoneda: TQRGroup;
    QRLabel39: TQRLabel;
    QRShape1: TQRShape;
    SummaryBand1: TQRBand;
    QRSHPMoneda: TQRShape;
    QRLabel46: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    qyMovEntFeDESC_MONEDA: TStringField;
    qyMovEntFeNOMBRE: TStringField;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel1: TQRLabel;
    qyMovEntFeID_CREDITO: TFloatField;
    qyMovEntFeCVE_MONEDA: TFloatField;
    qyMovEntFeID_TITULAR: TFloatField;
    qyMovEntFeCVE_PRODUCTO_CRE: TStringField;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    qrgrpFooterProducto: TQRBand;
    QRGroup2: TQRGroup;
    qrgrpFooterAcreditado: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    qyMovEntFeDESC_L_PRODUCTO: TStringField;
    qyMovEntFeSDO_INICIAL: TFloatField;
    qyMovEntFeIMP_DISP_MES: TFloatField;
    qyMovEntFePAG_MES: TFloatField;
    qyMovEntFeSDO_FINAL: TFloatField;
    qyMovEntFeB_PARAMETRICO: TStringField;
    QRExpr2: TQRExpr;
    QRExpr1: TQRExpr;
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

  Private
  Public
    Function FormaQuery(sMoneda, sProducto, sAcreditado, sDisp, sEmpresa, sSucursal: String;
                        dFecha   : TDateTime ): String;
  end;
Var
  QrMovEntFe: TQrMovEntFe;
  Apli : TInterApli;

Procedure RepMovEntFe( sMoneda, sProducto, sAcreditado, sDisp, sEmpresa, sSucursal: String;
                       dFecha   : TDateTime;
                       pAPli    : TInterApli;
                       pPreview : Boolean);

Implementation
{$R *.DFM}

Procedure RepMovEntFe( sMoneda, sProducto, sAcreditado, sDisp, sEmpresa, sSucursal: String;
                       dFecha   : TDateTime;
                       pAPli    : TInterApli;
                       pPreview : Boolean);
Var
   QrMovEntFe: TQrMovEntFe;
   Preview     : TIntQRPreview;
Begin
   QrMovEntFe:=TQrMovEntFe.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrMovEntFe);
   Try

      Apli := pApli;
      QrMovEntFe.QRInterEncabezado1.Apli:=pApli;
      QrMovEntFe.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrMovEntFe.QRInterEncabezado1.NomReporte:='IntMQrMovEntFe';
      QrMovEntFe.QRInterEncabezado1.Titulo1:=' REPORTE MENSUAL DE MOVIMIENTOS DE CREDITOS A ';
      QrMovEntFe.QRInterEncabezado1.Titulo2:=' ENTIDADES FEDERATIVAS, MUNICIPIOS Y SUS ORGANISMOS DESCENTRALIZADOS';
      QrMovEntFe.QRInterEncabezado1.Titulo3:=' Al ' + DateToStr(dFecha);

      QrMovEntFe.qyMovEntFe.DatabaseName := pApli.DataBaseName;
      QrMovEntFe.qyMovEntFe.SessionName := pApli.SessionName;

      QrMovEntFe.qyMovEntFe.Active:=False;
      QrMovEntFe.qyMovEntFe.SQL.Text:= QrMovEntFe.FormaQuery(sMoneda, sProducto, sAcreditado, sDisp,
                                                                sEmpresa, sSucursal, dFecha);
      QrMovEntFe.qyMovEntFe.SQL.SaveToFile('c:\MovEntFe.txt');
      QrMovEntFe.qyMovEntFe.Active:=True;

      If pPreview Then
         QrMovEntFe.Preview
      Else
         QrMovEntFe.Print;
   Finally
      QrMovEntFe.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrMovEntFe.FormaQuery(sMoneda, sProducto, sAcreditado, sDisp, sEmpresa, sSucursal: String;
                                dFecha   : TDateTime ): String;
Var
    sSQL:String;
Begin
    sSQL:=  ' SELECT  ' + coCRLF +
            '       DATOS.ID_TITULAR, ' + coCRLF +
            '       DATOS.NOMBRE_TIT, ' + coCRLF +
            '       DATOS.ID_CREDITO, ' + coCRLF +
            '       DATOS.B_PARAMETRICO, ' + coCRLF +
            '       DATOS.CVE_MONEDA, ' + coCRLF +
            '       DATOS.DESC_MONEDA, ' + coCRLF +
            '       DATOS.CVE_PRODUCTO_CRE, ' + coCRLF +
            '       DATOS.DESC_L_PRODUCTO, ' + coCRLF +
            '       SUM(NVL(VIG.IMP_MES_ANT,0) + NVL(NE.IMP_MES_ANT,0) + ' + coCRLF +
            '           NVL(IMP.IMP_MES_ANT,0) + NVL(EXIG.IMP_MES_ANT,0)) AS SDO_INICIAL, ' + coCRLF +
            '       SUM(NVL(DATOS.IMP_DISP_MES,0)) AS IMP_DISP_MES, ' + coCRLF +
            '       SUM((NVL(VIG.IMP_MES_REF,0) + NVL(NE.IMP_MES_REF,0) + ' + coCRLF +
            '            NVL(IMP.IMP_MES_REF,0) + NVL(EXIG.IMP_MES_REF,0)) - ' + coCRLF +
            '           (NVL(VIG.IMP_MES_ANT,0) + NVL(NE.IMP_MES_ANT,0) + ' + coCRLF +
            '            NVL(IMP.IMP_MES_ANT,0) + NVL(EXIG.IMP_MES_ANT,0))) AS PAG_MES, ' + coCRLF +
            '       SUM((NVL(VIG.IMP_MES_ANT,0) + NVL(NE.IMP_MES_ANT,0) + ' + coCRLF +
            '            NVL(IMP.IMP_MES_ANT,0) + NVL(EXIG.IMP_MES_ANT,0)) + ' + coCRLF +
            '            NVL(DATOS.IMP_DISP_MES,0) - ' + coCRLF +
            '          ((NVL(VIG.IMP_MES_REF,0) + NVL(NE.IMP_MES_REF,0) + ' + coCRLF +
            '            NVL(IMP.IMP_MES_REF,0) + NVL(EXIG.IMP_MES_REF,0)) - ' + coCRLF +
            '           (NVL(VIG.IMP_MES_ANT,0) + NVL(NE.IMP_MES_ANT,0) + ' + coCRLF +
            '            NVL(IMP.IMP_MES_ANT,0) + NVL(EXIG.IMP_MES_ANT,0)))) AS SDO_FINAL ' + coCRLF +
            ' FROM ' + coCRLF +
            '       ( ' + coCRLF +
            '        SELECT ' + coCRLF +
            '           CTO.ID_TITULAR, PTIT.NOMBRE NOMBRE_TIT, ' + coCRLF +
            '           CC.ID_CREDITO, NVL(CC_MES.IMP_CREDITO,0) AS IMP_DISP_MES, ' + coCRLF +
            '           DECODE(CCTO.B_PARAMETRICO,''V'',''SI'',''F'',''NO'',NULL) B_PARAMETRICO, ' + coCRLF +
            '           CTO.CVE_MONEDA, MON.DESC_MONEDA, CCTO.CVE_PRODUCTO_CRE, ' + coCRLF +
            '           CPR.DESC_L_PRODUCTO, CC.ID_CONTRATO ' + coCRLF +
            '       FROM ' + coCRLF +
            '           (SELECT * FROM CR_CREDITO CC ' + coCRLF +
            '             WHERE CC.F_AUTORIZA <= ' + SQLFecha(dFecha) +
            '               AND (CC.F_LIQUIDACION >= ' + SQLFecha(dFecha) +
            '                   OR CC.F_LIQUIDACION IS NULL) ' + coCRLF +
            '           ) CC, ' + coCRLF +
            ' 		  CR_CONTRATO CCTO, CONTRATO CTO, CR_PRODUCTO CPR, ' + coCRLF +
            '           (SELECT CC.ID_CREDITO, SUM (CC.IMP_CREDITO) IMP_CREDITO ' + coCRLF +
            '              FROM CR_CREDITO CC ' + coCRLF +
            '             WHERE CC.F_AUTORIZA BETWEEN LAST_DAY(ADD_MONTHS(' + SQLFecha(dFecha) + ',-1)) + 1 ' + coCRLF +
            '                                     AND LAST_DAY(' + SQLFecha(dFecha) + ') ' + coCRLF +
            '             GROUP BY CC.ID_CREDITO ' + coCRLF +
            ' 		  )CC_MES, MONEDA MON, PERSONA PTIT ' + coCRLF +
            '       WHERE   CCTO.ID_CONTRATO = CC.ID_CONTRATO ' + coCRLF +
            '           AND CCTO.FOL_CONTRATO = CC.FOL_CONTRATO ' + coCRLF +
            '           AND CTO.ID_CONTRATO = CCTO.ID_CONTRATO ' + coCRLF +
            '           AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE ' + coCRLF +
            '           AND CC_MES.ID_CREDITO (+)= CC.ID_CREDITO ' + coCRLF +
            '           AND MON.CVE_MONEDA = CTO.CVE_MONEDA ' + coCRLF +
            '           AND PTIT.ID_PERSONA = CTO.ID_TITULAR ' + coCRLF ;
//--FILTROS
                 If (Trim(sMoneda)<>'') Then
                    sSQL:= sSQL + ' AND CCTO.CVE_MONEDA =  '+ sMoneda+ coCRLF ;
                 If (Trim(sAcreditado)<>'') Then
                    sSQL:= sSQL + ' AND CTO.ID_TITULAR = '+ sAcreditado + coCRLF ;
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp + coCRLF ;
                 If (Trim(sEmpresa)<>'') Then
                    sSQL:= sSQL + ' AND CTO.ID_EMPRESA =  '+ sEmpresa + coCRLF ;
                 If (Trim(sProducto)<>'') Then
                    sSQL:= sSQL + ' AND CCTO.CVE_PRODUCTO_CRE =  '+ SQLStr(sProducto) + coCRLF ;
         sSQL:= sSQL +
            '       ) DATOS, ' + coCRLF +
            '       ( ' + coCRLF +
            '        SELECT CP.ID_CREDITO, ' + coCRLF +
            '              SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' + coCRLF +
            '                                           CP.NUM_PERIODO,NULL,LAST_DAY(' + SQLFecha(dFecha) + '),''V'')))AS IMP_MES_REF, ' + coCRLF +
            '              SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' + coCRLF +
            '                                           CP.NUM_PERIODO,NULL,LAST_DAY(ADD_MONTHS(' + SQLFecha(dFecha) + ',-1)),''V'')))AS IMP_MES_ANT ' + coCRLF +
            '         FROM (SELECT * FROM CR_CAPITAL CP ' + coCRLF +
            '                WHERE CP.F_VENCIMIENTO > ' + SQLFecha(dFecha) +
            '              ) CP,  ' + coCRLF +
            '              (SELECT CHC.ID_CREDITO  ' + coCRLF +//  -- VIGENTE
            '                 FROM CR_CREDITO CC, ' + coCRLF +
            '                      (SELECT * FROM CR_HISTO_CRED CHC ' + coCRLF +
            '                        WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
            '                          AND CHC.F_TRASPASO_VENC IS NULL ' + coCRLF +
            '                      ) CHC  ' + coCRLF +
            '                WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' + coCRLF +
            '                UNION ' + coCRLF +
            '               SELECT CC.ID_CREDITO ' + coCRLF +
            '                 FROM CR_CREDITO CC ' + coCRLF +
            '                WHERE CC.F_TRASPASO_VENC IS NULL ' + coCRLF +
            '              )CC ' + coCRLF +
            '        WHERE CP.ID_CREDITO = CC.ID_CREDITO ' + coCRLF +
            '        GROUP BY CP.ID_CREDITO ' + coCRLF +
            '       UNION ALL ' + coCRLF +
            '       SELECT CFA.ID_CREDITO, ' + coCRLF +
            '              SUM(NVL(CFA.IMP_FINAN_ADIC,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFA.ID_CREDITO, ' + coCRLF +
            '                                               CFA.NUM_PERIODO,NULL,LAST_DAY(' + SQLFecha(dFecha) + '),''V''))) AS IMP_MES_REF, ' + coCRLF +
            '              SUM(NVL(CFA.IMP_FINAN_ADIC,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFA.ID_CREDITO, ' + coCRLF +
            '                                               CFA.NUM_PERIODO,NULL,LAST_DAY(ADD_MONTHS(' + SQLFecha(dFecha) + ',-1)),''V''))) AS IMP_MES_ANT ' + coCRLF +
            '         FROM (SELECT * FROM CR_FINAN_ADIC CFA ' + coCRLF +
            '                WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha);

                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CFA.ID_CREDITO =  '+ sDisp + coCRLF ;

         sSQL:= sSQL +
            '              )CFA,  ' + coCRLF +
            '              (SELECT CHC.ID_CREDITO  ' + coCRLF +//  -- VIGENTE
            '                 FROM CR_CREDITO CC, ' + coCRLF +
            '                     (SELECT * FROM CR_HISTO_CRED CHC ' + coCRLF +
            '                       WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
            '                         AND CHC.F_TRASPASO_VENC IS NULL ' + coCRLF +
            '                     )CHC  ' + coCRLF +
            '                WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' + coCRLF +
            '                UNION ' + coCRLF +
            '               SELECT CC.ID_CREDITO ' + coCRLF +
            '                 FROM CR_CREDITO CC ' + coCRLF +
            '                WHERE CC.F_TRASPASO_VENC IS NULL ' + coCRLF +
            '              )CC ' + coCRLF +
            '        WHERE CC.ID_CREDITO = CFA.ID_CREDITO ' + coCRLF +
            '        GROUP BY CFA.ID_CREDITO ' + coCRLF +
            '      )VIG , ' + coCRLF +
            '      (SELECT CP.ID_CREDITO, ' + coCRLF +
            '              SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' + coCRLF +
            '                                           CP.NUM_PERIODO,NULL,LAST_DAY(' + SQLFecha(dFecha) + '),''V'')))AS IMP_MES_REF, ' + coCRLF +
            '              SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' + coCRLF +
            '                                           CP.NUM_PERIODO,NULL,LAST_DAY(ADD_MONTHS(' + SQLFecha(dFecha) + ',-1)),''V'')))AS IMP_MES_ANT ' + coCRLF +
            '         FROM (SELECT * FROM CR_CAPITAL CP ' + coCRLF +
            '                WHERE CP.F_VENCIMIENTO > ' + SQLFecha(dFecha) +
            '              )CP,  ' + coCRLF +
            '              (SELECT CHC.ID_CREDITO  ' + coCRLF +//  -- NO EXIGIBLE
            '                 FROM CR_CREDITO CC, ' + coCRLF +
            '                     (SELECT * FROM CR_HISTO_CRED CHC ' + coCRLF +
            '                       WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
            '                             AND CHC.F_TRASPASO_VENC IS NOT NULL)CHC  ' + coCRLF +
            '                WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' + coCRLF +
            '                UNION ' + coCRLF +
            '               SELECT CC.ID_CREDITO ' + coCRLF +
            '                 FROM CR_CREDITO CC ' + coCRLF +
            '                WHERE CC.F_TRASPASO_VENC IS NOT NULL ' + coCRLF +
            '              )CC ' + coCRLF +
            '        WHERE CC.ID_CREDITO = CP.ID_CREDITO ' + coCRLF +
            '        GROUP BY CP.ID_CREDITO ' + coCRLF +
            '       UNION ALL ' + coCRLF +
            '       SELECT CFA.ID_CREDITO, ' + coCRLF +
            '              SUM(NVL(CFA.IMP_FINAN_ADIC,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFA.ID_CREDITO, ' + coCRLF +
            '                                               CFA.NUM_PERIODO,NULL,LAST_DAY(' + SQLFecha(dFecha) + '),''V''))) AS IMP_MES_REF, ' + coCRLF +
            '              SUM(NVL(CFA.IMP_FINAN_ADIC,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFA.ID_CREDITO, ' + coCRLF +
            '                                               CFA.NUM_PERIODO,NULL,LAST_DAY(ADD_MONTHS(' + SQLFecha(dFecha) + ',-1)),''V''))) AS IMP_MES_ANT ' + coCRLF +
            '         FROM (SELECT * FROM CR_FINAN_ADIC CFA ' + coCRLF +
            '                WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) ;
            
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CFA.ID_CREDITO =  '+ sDisp + coCRLF ;

         sSQL:= sSQL +

            '              )CFA,  ' + coCRLF +
            '              (SELECT CHC.ID_CREDITO  ' + coCRLF +//  -- NO EXIGIBLE
            '                 FROM CR_CREDITO CC, ' + coCRLF +
            '                     (SELECT * FROM CR_HISTO_CRED CHC ' + coCRLF +
            '                       WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
            '                             AND CHC.F_TRASPASO_VENC IS NOT NULL)CHC  ' + coCRLF +
            '                WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' + coCRLF +
            '                UNION ' + coCRLF +
            '               SELECT CC.ID_CREDITO ' + coCRLF +
            '                 FROM CR_CREDITO CC ' + coCRLF +
            '                WHERE CC.F_TRASPASO_VENC IS NOT NULL ' + coCRLF +
            '              )CC ' + coCRLF +
            '        WHERE CC.ID_CREDITO = CFA.ID_CREDITO ' + coCRLF +
            '        GROUP BY CFA.ID_CREDITO ' + coCRLF +
            '      )NE, ' + coCRLF +
            '      (SELECT CP.ID_CREDITO, ' + coCRLF +
            '              SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' + coCRLF +
            '                                           CP.NUM_PERIODO,NULL,LAST_DAY(' + SQLFecha(dFecha) + '),''V'')))AS IMP_MES_REF, ' + coCRLF +
            '              SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' + coCRLF +
            '                                           CP.NUM_PERIODO,NULL,LAST_DAY(ADD_MONTHS(' + SQLFecha(dFecha) + ',-1)),''V'')))AS IMP_MES_ANT ' + coCRLF +
            '         FROM (SELECT * FROM CR_CAPITAL CP ' + coCRLF +
            '                WHERE CP.F_PROG_PAGO <= ' + SQLFecha(dFecha) +
            '                  AND ((CP.F_PROG_PAGO < CP.F_PAGO AND CP.SIT_CAPITAL <> ''CA'' ' + coCRLF +
            '                  AND CP.F_PAGO > ' + SQLFecha(dFecha) + ') ' + coCRLF +
            '                   OR CP.SIT_CAPITAL = ''IM'') ' + coCRLF +
            '              )CP,  ' + coCRLF +
            '              (SELECT CHC.ID_CREDITO   ' + coCRLF + //IMPAGADO
            '                 FROM CR_CREDITO CC, ' + coCRLF +
            '                     (SELECT * FROM CR_HISTO_CRED CHC ' + coCRLF +
            '                       WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
            '                             AND CHC.F_TRASPASO_VENC IS NULL ' + coCRLF +
            '                      ) CHC  ' + coCRLF +
            '                WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' + coCRLF +
            '                UNION ' + coCRLF +
            '               SELECT CC.ID_CREDITO ' + coCRLF +
            '                 FROM CR_CREDITO CC ' + coCRLF +
            '                WHERE CC.F_TRASPASO_VENC IS NULL ' + coCRLF +
            '              )CC ' + coCRLF +
            '        WHERE CC.ID_CREDITO = CP.ID_CREDITO ' + coCRLF +
            '        GROUP BY CP.ID_CREDITO ' + coCRLF +
            '       UNION ALL ' + coCRLF +
            '       SELECT CFA.ID_CREDITO, ' + coCRLF +
            '              SUM(NVL(CFA.IMP_FINAN_ADIC,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFA.ID_CREDITO, ' + coCRLF +
            '                                               CFA.NUM_PERIODO,NULL,LAST_DAY(' + SQLFecha(dFecha) + '),''V''))) AS IMP_MES_REF, ' + coCRLF +
            '              SUM(NVL(CFA.IMP_FINAN_ADIC,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFA.ID_CREDITO, ' + coCRLF +
            '                                               CFA.NUM_PERIODO,NULL,LAST_DAY(ADD_MONTHS(' + SQLFecha(dFecha) + ',-1)),''V''))) AS IMP_MES_ANT ' + coCRLF +
            '         FROM (SELECT * FROM CR_FINAN_ADIC CFA ' + coCRLF +
            '                WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) +
            '                  AND CFA.F_PROG_PAGO <= ' + SQLFecha(dFecha) +
            '                  AND ((CFA.F_PROG_PAGO < CFA.F_PAGO AND CFA.SIT_FINAN_ADIC <> ''CA'' ' + coCRLF +
            '                  AND CFA.F_PAGO > ' + SQLFecha(dFecha) + ') ' + coCRLF +
            '                   OR  CFA.SIT_FINAN_ADIC = ''IM'') ' + coCRLF;
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CFA.ID_CREDITO =  '+ sDisp + coCRLF ;

         sSQL:= sSQL +
            '              )CFA, ' + coCRLF +
            '              (SELECT CHC.ID_CREDITO  ' + coCRLF +
            '                 FROM CR_CREDITO CC, ' + coCRLF +
            '                     (SELECT * FROM CR_HISTO_CRED CHC ' + coCRLF +
            '                       WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
            '                             AND CHC.F_TRASPASO_VENC IS NULL) CHC  ' + coCRLF +
            '                WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' + coCRLF +
            '                UNION ' + coCRLF +
            '               SELECT CC.ID_CREDITO ' + coCRLF +
            '                 FROM CR_CREDITO CC ' + coCRLF +
            '                WHERE CC.F_TRASPASO_VENC IS NULL ' + coCRLF +
            '              )CC ' + coCRLF +
            '        WHERE CC.ID_CREDITO = CFA.ID_CREDITO ' + coCRLF +
            '        GROUP BY CFA.ID_CREDITO ' + coCRLF +
            '      )IMP, ' + coCRLF +
            '      (SELECT CP.ID_CREDITO, ' + coCRLF +
            '              SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' + coCRLF +
            '                                           CP.NUM_PERIODO,NULL,LAST_DAY(' + SQLFecha(dFecha) + '),''V'')))AS IMP_MES_REF, ' + coCRLF +
            '              SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO, ' + coCRLF +
            '                                           CP.NUM_PERIODO,NULL,LAST_DAY(ADD_MONTHS(' + SQLFecha(dFecha) + ',-1)),''V'')))AS IMP_MES_ANT ' + coCRLF +
            '         FROM (SELECT * FROM CR_CAPITAL CP ' + coCRLF +
            '               WHERE CP.F_PROG_PAGO <= ' + SQLFecha(dFecha) +
            '               AND ((CP.F_PROG_PAGO < CP.F_PAGO ' + coCRLF +
            '               AND CP.SIT_CAPITAL <> ''CA'' ' + coCRLF +
            '               AND CP.F_PAGO > ' + SQLFecha(dFecha) + ') ' + coCRLF +
            '               OR  CP.SIT_CAPITAL = ''IM'') ' + coCRLF +
            '               )CP, ' + coCRLF +
            '              (SELECT CHC.ID_CREDITO ' + coCRLF +
            '                 FROM CR_CREDITO CC, ' + coCRLF +
            '                     (SELECT * FROM CR_HISTO_CRED CHC ' + coCRLF +
            '                       WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
            '                             AND CHC.F_TRASPASO_VENC IS NOT NULL)CHC ' + coCRLF +
            '                WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' + coCRLF +
            '                UNION ' + coCRLF +
            '               SELECT CC.ID_CREDITO ' + coCRLF +
            '                 FROM CR_CREDITO CC ' + coCRLF +
            '                WHERE CC.F_TRASPASO_VENC IS NOT NULL ' + coCRLF +
            '              )CC ' + coCRLF +
            '        WHERE CC.ID_CREDITO = CP.ID_CREDITO ' + coCRLF +
            '        GROUP BY CP.ID_CREDITO ' + coCRLF +
            '       UNION ALL ' + coCRLF +
            '       SELECT CFA.ID_CREDITO, ' + coCRLF +
            '              SUM(NVL(CFA.IMP_FINAN_ADIC,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFA.ID_CREDITO, ' + coCRLF +
            '                                               CFA.NUM_PERIODO,NULL,LAST_DAY(' + SQLFecha(dFecha) + '),''V''))) AS IMP_MES_REF, ' + coCRLF +
            '              SUM(NVL(CFA.IMP_FINAN_ADIC,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFA.ID_CREDITO, ' + coCRLF +
            '                                               CFA.NUM_PERIODO,NULL,LAST_DAY(ADD_MONTHS(' + SQLFecha(dFecha) + ',-1)),''V''))) AS IMP_MES_ANT ' + coCRLF +
            '         FROM (SELECT * FROM CR_FINAN_ADIC CFA ' + coCRLF +
            '               WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) +
            '                     AND CFA.F_PROG_PAGO <= ' + SQLFecha(dFecha) +
            '                     AND ((CFA.F_PROG_PAGO < CFA.F_PAGO AND CFA.SIT_FINAN_ADIC <> ''CA''' + coCRLF +
            '                     AND CFA.F_PAGO > ' + SQLFecha(dFecha) + ')' + coCRLF +
            '                     OR  CFA.SIT_FINAN_ADIC = ''IM'') ' + coCRLF ;
            
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CFA.ID_CREDITO =  '+ sDisp + coCRLF ;

         sSQL:= sSQL +
            '                    ) CFA, ' + coCRLF +
            '              (SELECT CHC.ID_CREDITO   ' + coCRLF +// -- EXIGIBLE
            '                 FROM CR_CREDITO CC, ' + coCRLF +
            '                     (SELECT * FROM CR_HISTO_CRED CHC ' + coCRLF +
            '                       WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) +
            '                             AND CHC.F_TRASPASO_VENC IS NOT NULL)CHC ' + coCRLF +
            '                WHERE CHC.ID_CREDITO = CC.ID_CREDITO ' + coCRLF +
            '                UNION ' + coCRLF +
            '               SELECT CC.ID_CREDITO ' + coCRLF +
            '                 FROM CR_CREDITO CC ' + coCRLF +
            '                WHERE CC.F_TRASPASO_VENC IS NOT NULL ' + coCRLF +
            '              )CC ' + coCRLF +
            '        WHERE CC.ID_CREDITO = CFA.ID_CREDITO ' + coCRLF +
            '        GROUP BY CFA.ID_CREDITO ' + coCRLF +
            '      )EXIG ' + coCRLF +
            ' WHERE ' + coCRLF +
            '     DATOS.ID_CREDITO = VIG.ID_CREDITO (+) ' + coCRLF +
            '     AND DATOS.ID_CREDITO = NE.ID_CREDITO (+) ' + coCRLF +
            '     AND DATOS.ID_CREDITO = IMP.ID_CREDITO (+) ' + coCRLF +
            '     AND DATOS.ID_CREDITO = EXIG.ID_CREDITO (+) ' + coCRLF +
            ' GROUP BY ' + coCRLF +
            '       DATOS.ID_TITULAR, DATOS.NOMBRE_TIT, ' + coCRLF +
            '       DATOS.ID_CREDITO, DATOS.IMP_DISP_MES, ' + coCRLF +
            '       DATOS.B_PARAMETRICO, DATOS.CVE_MONEDA, ' + coCRLF +
            '       DATOS.DESC_MONEDA, DATOS.CVE_PRODUCTO_CRE, ' + coCRLF +
            '       DATOS.DESC_L_PRODUCTO ' + coCRLF +
            ' ORDER BY DATOS.ID_TITULAR, DATOS.NOMBRE_TIT ' + coCRLF ;
   Result:= sSQL;
End;

End.
