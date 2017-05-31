unit IntMQrCatMin;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2;

type
  TQrCatMin = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyConsulta: TQuery;
    QRBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    QRGroup3: TQRGroup;
    QRGroup4: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRFoot1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr5: TQRExpr;
    QRBand4: TQRBand;
    QRShape2: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel38: TQRLabel;
    QRBand5: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel53: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRGroup5: TQRGroup;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRDBText15: TQRDBText;
    QRLabel3: TQRLabel;
    qyConsultaID_CREDITO: TFloatField;
    qyConsultaID_CONTRATO: TFloatField;
    qyConsultaID_TITULAR: TFloatField;
    qyConsultaNOMBRE: TStringField;
    qyConsultaF_INICIO: TDateTimeField;
    qyConsultaF_AUTORIZA: TDateTimeField;
    qyConsultaF_VENCIMIENTO: TDateTimeField;
    qyConsultaF_TRASPASO_VENC: TDateTimeField;
    qyConsultaCVE_MONEDA: TFloatField;
    qyConsultaDESC_MONEDA: TStringField;
    qyConsultaCVE_PRODUCTO_CRE: TStringField;
    qyConsultaDESC_L_PRODUCTO: TStringField;
    qyConsultaCVE_CAT_MINIMO: TStringField;
    qyConsultaDESC_CAT_MINIMO: TStringField;
    qyConsultaSDO_INSOLUTO: TFloatField;
    qyConsultaSUMIMPINT: TFloatField;
    qyConsultaIMP_CAPITAL_VDO: TFloatField;
    qyConsultaIMP_INTERES_VDO: TFloatField;
    qyConsultaTPOCAMBIO: TFloatField;
    QRFoot2: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel2: TQRLabel;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
  private
  public
     Apli : TInterApli;
     Function LlenaEncabezado( sFecha,sDolar,sUdis,
                               sEmpresa, sSucursal :String;
                               pAPli : TInterApli) : String;

  end;

var
  QrCatMin: TQrCatMin;

Procedure EjecutarReporteCatMinimo( sFecha,sDolar,sUdis,
                                    sEmpresa, sSucursal :String;
                                    pAPli : TInterApli; pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure EjecutarReporteCatMinimo( sFecha,sDolar,sUdis,
                                    sEmpresa, sSucursal :String;
                                    pAPli : TInterApli ; pPreview  : Boolean);
Var
    QrCatMin   : TQrCatMin;
    Preview     : TIntQRPreview;
Begin
      QrCatMin   := TQrCatMin.Create(Nil);
      Preview := TIntQRPreview.CreatePreview(Application, QrCatMin);
      QrCatMin.Apli := pAPli;
      Try

        QrCatMin.QRInterEncabezado1.Apli:=pApli;
        QrCatMin.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrCatMin.QRInterEncabezado1.NomReporte:='IntMQrCatMin';

        QrCatMin.QRInterEncabezado1.Titulo1:='Reporte por Catálogo Mínimo';
        //QrCatMin.QRInterEncabezado1.Titulo2:='Catálago mínimo al ' + DateToStr(pAPli.DameFechaEmpresa);
        QrCatMin.QRInterEncabezado1.Titulo2:='Catálago mínimo al ' + FormatDateTime('DD/MM/YYYY',StrToDate(sFecha));

        QrCatMin.qyConsulta.DatabaseName := pApli.DataBaseName;
        QrCatMin.qyConsulta.SessionName := pApli.SessionName;

        QrCatMin.qyConsulta.Active:=False;
        QrCatMin.qyConsulta.SQL.Text:= QrCatMin.LlenaEncabezado( sFecha,sDolar,sUdis,
                                                sEmpresa, sSucursal,pAPli);
        QrCatMin.qyConsulta.SQL.SaveToFile('C:\CAT_MINIMO.txt');

        QrCatMin.qyConsulta.Active:=True;

        If pPreview Then
            QrCatMin.Preview
        Else
            QrCatMin.Print;
    Finally
        QrCatMin.free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrCatMin.LlenaEncabezado( sFecha,sDolar,sUdis,
                                    sEmpresa, sSucursal :String;
                                    pAPli : TInterApli) : String;
Var
    sSQL:String;
Begin


    sSQL:= ' SELECT DISTINCT CRD.ID_CREDITO, CRD.ID_CONTRATO, CONT.ID_TITULAR, PER.NOMBRE,CRD.F_INICIO, CRD.F_AUTORIZA, CRD.F_VENCIMIENTO, ' + coCRLF +
           '        HCRD.F_TRASPASO_VENC,' + coCRLF +
           '        CONT.CVE_MONEDA, MON.DESC_MONEDA, CRCONT.CVE_PRODUCTO_CRE, PROD.DESC_L_PRODUCTO, ' + coCRLF +
           '        CATMIN.CVE_CAT_MINIMO, CATMIN.DESC_CAT_MINIMO, ' + coCRLF +
           '        (NVL(HCRD.SDO_INSOLUTO,0) * (DECODE(CONT.CVE_MONEDA,840,'+sDolar+ ',800,'+sUdis+',1))) AS SDO_INSOLUTO, ' + coCRLF +
           '        (IMPINTPER.SUMIMPINT * (DECODE(CONT.CVE_MONEDA,840,'+sDolar+',800,'+sUdis+',1))) AS SUMIMPINT, ' + coCRLF +
           '        (NVL(HCRD.IMP_CAPITAL_VDO,0) * (DECODE(CONT.CVE_MONEDA,840,'+sDolar+',800,'+sUdis+',1))) AS IMP_CAPITAL_VDO, ' + coCRLF +
           '        (NVL(HCRD.IMP_INTERES_VDO,0) * (DECODE(CONT.CVE_MONEDA,840,'+sDolar+',800,'+sUdis+',1))) AS IMP_INTERES_VDO,  ' + coCRLF +
           '        DECODE(CONT.CVE_MONEDA,840,'+sDolar+ ',800,'+sUdis+',484,1) AS TPOCAMBIO ' + coCRLF +
           ' FROM CR_CREDITO CRD, CONTRATO CONT, PERSONA PER, CR_HISTO_CRED HCRD, ' + coCRLF +
           '      (SELECT CRINT.ID_CREDITO,SUM(IMP_INTERES) AS SUMIMPINT ' + coCRLF +
           '        FROM CR_INTERES CRINT ' + coCRLF +
           '        WHERE CRINT.F_VENCIMIENTO <= TO_DATE('''+DateToStr(pAPli.DameFechaEmpresaDia('D000'))+''',''DD/MM/YYYY'')' + coCRLF +
           '        AND CRINT.SIT_INTERES = ''AC'' ' + coCRLF +
           '        GROUP BY CRINT.ID_CREDITO) IMPINTPER, ' + coCRLF +
           '       MONEDA MON, ' + coCRLF +
           '       --CR_CONTRATO CRCONT, CR_PRODUCTO PROD,   --RABA JUL 2015 B-6 HISTORICOS' + coCRLF +
           '       (SELECT CAST(CASE  WHEN AU.CVE_PRODUCTO_CRE IS NOT NULL THEN AU.CVE_PRODUCTO_CRE ELSE RAIZ.CVE_PRODUCTO_CRE END AS VARCHAR2(10)) CVE_PRODUCTO_OLD, ' + coCRLF +
           '               RAIZ.* ' + coCRLF +
           '        FROM CR_CONTRATO RAIZ ' + coCRLF +
           '                     LEFT JOIN ' + coCRLF +
           '                          (SELECT DENSE_RANK () OVER (PARTITION BY TO_NUMBER (ID_CONTRATO) ORDER BY FH_REGISTRO DESC) R, ' + coCRLF +
           '                                  CASE WHEN LAG (FH_REGISTRO) OVER (PARTITION BY TO_NUMBER (ID_CONTRATO) ORDER BY ID_AUDIT) IS NULL ' + coCRLF +
           '                                            THEN TO_DATE (1, ''J'') ' + coCRLF +
           '                                       ELSE CAST (LAG (FH_REGISTRO) OVER (PARTITION BY TO_NUMBER (ID_CONTRATO) ORDER BY ID_AUDIT) AS DATE) ' + coCRLF +
           '                                  END F_INI, ' + coCRLF +
           '                                  CASE WHEN LEAD (FH_REGISTRO) OVER (PARTITION BY TO_NUMBER (ID_CONTRATO) ORDER BY ID_AUDIT) IS NULL ' + coCRLF +
           '                                            THEN TO_DATE (''31/12/9999'', ''DD/MM/YYYY'') ' + coCRLF +
           '                                       ELSE CAST (FH_REGISTRO AS DATE) ' + coCRLF +
           '                                  END F_FIN, ' + coCRLF +
           '                                  ID_CONTRATO, ' + coCRLF +
           '                                  CVE_PRODUCTO_CRE ' + coCRLF +
           '                           FROM   (SELECT * ' + coCRLF +
           '                                   FROM   (SELECT CASE WHEN LAG (B_AD) OVER (PARTITION BY TO_NUMBER (ID_CONTRATO) ORDER BY ID_AUDIT) IS NULL ' + coCRLF +
           '                                                            AND   TO_NUMBER (ID_CONTRATO) = LEAD (TO_NUMBER (ID_CONTRATO) ) OVER (PARTITION BY TO_NUMBER (ID_CONTRATO) ORDER BY ID_AUDIT) ' + coCRLF +
           '                                                            THEN 1 ' + coCRLF +
           '                                                       ELSE 0 ' + coCRLF +
           '                                                  END L, ' + coCRLF +
           '                                                  HIS.* ' + coCRLF +
           '                                           FROM   (SELECT H.B_AD, H.FH_REGISTRO, DET.ID_AUDIT, DET.CAMPO, DET.VALOR ' + coCRLF +
           '                                                   FROM   CORP_AUDIT_CAMBIO H, CORP_AUDIT_CAMBIO_DET DET ' + coCRLF +
           '                                                   WHERE  H.ORIGEN_DATOS = ''CR_CONTRATO'' ' + coCRLF +
           '                                                   AND    H.ID_AUDIT = DET.ID_AUDIT) ' + coCRLF +
           '                                                   PIVOT(MAX(VALOR) FOR CAMPO IN(''ID_CONTRATO'' AS ID_CONTRATO, ''FOL_CONTRATO'' AS FOL_CONTRATO,''CVE_PRODUCTO_CRE'' AS CVE_PRODUCTO_CRE)) HIS ' + coCRLF +
           '                                                   ) ' + coCRLF +
           '                                           WHERE  1 = 1 ' + coCRLF +
           '                                           AND    (   B_AD = ''D'' OR L = 1) ) REGS ' + coCRLF +
           '                           ) AU ' + coCRLF +
           '                     ON  TO_NUMBER (AU.ID_CONTRATO) = RAIZ.ID_CONTRATO ' + coCRLF +
           '                     AND TO_DATE (TO_CHAR (TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sFecha))+''', ''DD/MM/YYYY''), ''DD/MM/YYYY'')||''23:59:59'', ''DD/MM/YYYY HH24:MI:SS'') BETWEEN AU.F_INI AND AU.F_FIN ' + coCRLF +
           '        )  crcont, ' + coCRLF +
           '       -- ' + coCRLF +
           '       (SELECT CAST(CASE WHEN AU.CVE_CLAS_CONTAB IS NOT NULL THEN AU.CVE_CLAS_CONTAB ELSE RAIZ.CVE_CLAS_CONTAB END AS VARCHAR2(20)) CVE_CLAS_CONTAB_OLD, ' + coCRLF +
           '               RAIZ.* ' + coCRLF +
           '        FROM   CR_PRODUCTO RAIZ ' + coCRLF +
           '                     LEFT JOIN ' + coCRLF +
           '                          (SELECT DENSE_RANK () OVER (PARTITION BY CVE_PRODUCTO_CRE ORDER BY FH_REGISTRO DESC) R, ' + coCRLF +
           '                                  CASE WHEN LAG (FH_REGISTRO) OVER (PARTITION BY CVE_PRODUCTO_CRE ORDER BY ID_AUDIT) IS NULL ' + coCRLF +
           '                                            THEN TO_DATE (1, ''J'') ' + coCRLF +
           '                                       ELSE CAST (LAG (FH_REGISTRO) OVER (PARTITION BY CVE_PRODUCTO_CRE ORDER BY ID_AUDIT) AS DATE) ' + coCRLF +
           '                                  END F_INI, ' + coCRLF +
           '                                  CASE WHEN LEAD (FH_REGISTRO) OVER (PARTITION BY CVE_PRODUCTO_CRE ORDER BY ID_AUDIT) IS NULL ' + coCRLF +
           '                                            THEN TO_DATE (''31/12/9999'', ''DD/MM/YYYY'') ' + coCRLF +
           '                                       ELSE CAST (FH_REGISTRO AS DATE) ' + coCRLF +
           '                                  END F_FIN, ' + coCRLF +
           '                                  CVE_PRODUCTO_CRE, ' + coCRLF +
           '                                  CVE_CLAS_CONTAB ' + coCRLF +
           '                           FROM   (SELECT * ' + coCRLF +
           '                                   FROM   (SELECT CASE WHEN LAG (B_AD) OVER (PARTITION BY CVE_PRODUCTO_CRE ORDER BY ID_AUDIT) IS NULL ' + coCRLF +
           '                                                            AND   CVE_PRODUCTO_CRE = LEAD (CVE_PRODUCTO_CRE) OVER (PARTITION BY CVE_PRODUCTO_CRE ORDER BY ID_AUDIT) ' + coCRLF +
           '                                                            THEN 1 ' + coCRLF +
           '                                                       ELSE 0 ' + coCRLF +
           '                                                  END L, ' + coCRLF +
           '                                                  HIS.* ' + coCRLF +
           '                                           FROM   (SELECT H.B_AD, H.FH_REGISTRO, DET.ID_AUDIT, DET.CAMPO, DET.VALOR ' + coCRLF +
           '                                                   FROM   CORP_AUDIT_CAMBIO H, CORP_AUDIT_CAMBIO_DET DET ' + coCRLF +
           '                                                   WHERE  H.ORIGEN_DATOS = ''CR_PRODUCTO'' ' + coCRLF +
           '                                                   AND    H.ID_AUDIT = DET.ID_AUDIT) ' + coCRLF +
           '                                                   PIVOT(MAX(VALOR) FOR CAMPO IN(''CVE_PRODUCTO_CRE'' AS CVE_PRODUCTO_CRE, ''CVE_CLAS_CONTAB'' AS CVE_CLAS_CONTAB)) HIS ' + coCRLF +
           '                                           ) ' + coCRLF +
           '                                   WHERE  1 = 1 ' + coCRLF +
           '                                   AND    (   B_AD = ''D'' OR L = 1) ) REGS ' + coCRLF +
           '                           ) AU ' + coCRLF +
           '                     ON  AU.CVE_PRODUCTO_CRE = RAIZ.CVE_PRODUCTO_CRE ' + coCRLF +
           '                     AND TO_DATE (TO_CHAR (TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sFecha))+''', ''DD/MM/YYYY''), ''DD/MM/YYYY'')||''23:59:59'', ''DD/MM/YYYY HH24:MI:SS'') BETWEEN AU.F_INI AND AU.F_FIN ' + coCRLF +
           '        ) prod, ' + coCRLF +
           '       CR_CAT_MINIMO CATMIN ' + coCRLF +
           ' WHERE CRD.ID_CONTRATO = CONT.ID_CONTRATO ' + coCRLF +
           ' AND CONT.ID_TITULAR = PER.ID_PERSONA ' + coCRLF +
           ' AND CRD.ID_CREDITO = HCRD.ID_CREDITO ' + coCRLF +
           ' AND CRD.ID_CREDITO = IMPINTPER.ID_CREDITO(+) ' + coCRLF +
           ' AND CONT.CVE_MONEDA = MON.CVE_MONEDA ' + coCRLF +
           ' AND CONT.ID_CONTRATO = CRCONT.ID_CONTRATO ' + coCRLF +
           ' AND CRCONT.CVE_PRODUCTO_OLD = PROD.CVE_PRODUCTO_CRE ' + coCRLF +
           ' AND PROD.CVE_CLAS_CONTAB_OLD  = CATMIN.CVE_CAT_MINIMO' + coCRLF;

    If (Trim(sFecha)<>'') Then
       sSQL:= sSQL + ' AND HCRD.F_CIERRE = TO_DATE('''+
       FormatDateTime('DD/MM/YYYY',StrToDate(sFecha))+''',''DD/MM/YYYY'')';
    If (Trim(sEmpresa)<>'') Then //SASB
       sSQL:= sSQL + ' AND PROD.ID_EMPRESA ='+ Trim(sEmpresa);

       sSQL:= sSQL + '  ORDER BY CATMIN.CVE_CAT_MINIMO, CRCONT.CVE_PRODUCTO_CRE ';
    Result:= sSQL;
End;


End.

