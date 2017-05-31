unit IntMQrComCobAn;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2;

type
  TQrComCobAn = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyConsulta: TQuery;
    GpoMon: TQRGroup;
    GpoProd: TQRGroup;
    GpoCom: TQRGroup;
    GpoCli: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    FooProd: TQRBand;
    QRExpr5: TQRExpr;
    QRBand4: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel38: TQRLabel;
    QRBand5: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel53: TQRLabel;
    QRDBText7: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBText15: TQRDBText;
    FooMon: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel2: TQRLabel;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    FooCom: TQRBand;
    QRExpr15: TQRExpr;
    QRLabel8: TQRLabel;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr19: TQRExpr;
    FooCli: TQRBand;
    QRExpr21: TQRExpr;
    QRLabel9: TQRLabel;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr25: TQRExpr;
    QRBand2: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape4: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    qyConsultaCVE_MONEDA: TFloatField;
    qyConsultaDESC_MONEDA: TStringField;
    qyConsultaCVE_PRODUCTO_CRE: TStringField;
    qyConsultaDESC_L_PRODUCTO: TStringField;
    qyConsultaCVE_COMISION: TStringField;
    qyConsultaDESC_COMISION: TStringField;
    qyConsultaID_PERSONA: TFloatField;
    qyConsultaNOMBRE: TStringField;
    qyConsultaID_CREDITO: TFloatField;
    qyConsultaF_INICIO: TStringField;
    qyConsultaF_VENCIMIENTO: TStringField;
    qyConsultaDIAS_X_VENCER: TFloatField;
    qyConsultaIMP_COMISION: TFloatField;
    qyConsultaIMP_COMISION_DIA: TFloatField;
    qyConsultaIMP_COMISION_PER: TFloatField;
    qyConsultaIMP_ACUM_MENS: TFloatField;
    qyConsultaIMP_X_DEVENGAR: TFloatField;
    QRShape14: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText17: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr7: TQRExpr;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
     Apli : TInterApli;
     Function FormaQuery(sMoneda, sProducto, sDisposicion, sComision, sAcreditado, sEmpresa, sFecha, sFechdev, SNbrArch : String; pAPli: TInterApli): String;
  end;

var
    QrComCobAn: TQrComCobAn;
    sArchivo : String; // SE AGREGA SALIDA A EXCEL JFOF 02/12/2012
    bGenArch: Boolean;
    F: TextFile;

Procedure RepComCobAnt(sMoneda, sProducto, sDisposicion, sComision, sAcreditado, sEmpresa, sFecha, sFechdev, SNbrArch : String;
                       pAPli: TInterApli; pPreview: Boolean);
Implementation
{$R *.DFM}

Procedure RepComCobAnt( sMoneda, sProducto, sDisposicion, sComision, sAcreditado, sEmpresa, sFecha, sFechdev, SNbrArch : String;
                        pAPli: TInterApli; pPreview: Boolean);
Var
    QrComCobAn  : TQrComCobAn;
    Preview     : TIntQRPreview;
Begin
    QrComCobAn   := TQrComCobAn.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrComCobAn);
    QrComCobAn.Apli := pAPli;

    Try

        sArchivo := sNbrArch; // JFOF AGREGA SALIDA A EXCEL 02/12/2012
        bGenArch    := False;

        QrComCobAn.QRInterEncabezado1.Apli := pApli;
        QrComCobAn.QRInterEncabezado1.IdEmpresa := pAPli.IdEmpresa;
        QrComCobAn.QRInterEncabezado1.NomReporte :='IntMQrComCobAn';
        QrComCobAn.QRInterEncabezado1.Titulo1 := 'COMISIONES POR AMORTIZAR';
        QrComCobAn.QRInterEncabezado1.Titulo2 := 'Del ' + sFechdev + ' al ' + sFecha;
        QrComCobAn.qyConsulta.DatabaseName := pApli.DataBaseName;
        QrComCobAn.qyConsulta.SessionName := pApli.SessionName;
        QrComCobAn.qyConsulta.Active := False;

        QrComCobAn.qyConsulta.SQL.Text := QrComCobAn.FormaQuery(sMoneda,sProducto,sDisposicion,sComision,sAcreditado,sEmpresa,sFecha,sFechdev,SNbrArch,pAPli);

        QrComCobAn.qyConsulta.SQL.SaveToFile('c:\RepComis.txt'); // Guarda Query JFOF 23/11/2012
        QrComCobAn.qyConsulta.Active := True;


        If Trim(sArchivo)<>'' Then
        Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrComCobAn.QRInterEncabezado1.Titulo1+ #09 );
         Writeln(F, QrComCobAn.QRInterEncabezado1.Titulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F, 'MONEDA' + #09 +
                    'PRODUCTO' + #09 +
                    'COMISION' + #09 +
                    'CLIENTE' + #09 +
                    'NOMBRE' + #09 +
                    'CREDITO' + #09 +
                    'FH APERTURA' + #09 +
                    'FH VENCIMIENTO' + #09 +
                    'DIAS X VENCER' + #09 +
                    'IMP ORIGINAL' + #09 +
                    'COMISION DIA' + #09 +
                    'IMP. DEV PERIODO' + #09 +
                    'IMP. DEV ACUMULADO' + #09 +
                    'IMP POR DEVENGAR');
       End;

        If pPreview Then
            QrComCobAn.Preview
        Else
            QrComCobAn.Print;
    Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
        QrComCobAn.free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrComCobAn.FormaQuery(sMoneda, sProducto, sDisposicion, sComision, sAcreditado, sEmpresa, sFecha,sFechdev,SNbrArch: String; pAPli: TInterApli): String;
Var
    sSQL:         String;
    sFiltros:     String;
Begin
    sFiltros := ' AND EMP.ID_EMPRESA = ' + sEmpresa + coCRLF;

    If Trim(sMoneda) <> '' Then
        sFiltros := sFiltros + '  AND MON.CVE_MONEDA = ''' + sMoneda + '''' + coCRLF;
    If Trim(sProducto) <> '' Then
        sFiltros := sFiltros + '  AND PROD.CVE_PRODUCTO_CRE = ''' + sProducto + '''' + coCRLF;
    If Trim(sDisposicion) <> '' Then
        sFiltros := sFiltros + '  AND PROV.ID_CREDITO = ' + sDisposicion + coCRLF;
    If Trim(sComision) <> '' Then
        sFiltros := sFiltros + '  AND CCAT.CVE_COMISION = ''' + sComision + '''' + coCRLF;
    If Trim(sAcreditado) <> '' Then
        sFiltros := sFiltros + '  AND P.ID_PERSONA = ' + sAcreditado + coCRLF;

    sSQL := 'SELECT MON.CVE_MONEDA, ' + coCRLF +
            '       MON.DESC_MONEDA, ' + coCRLF +
            '       PROD.CVE_PRODUCTO_CRE, ' + coCRLF +
            '       PROD.DESC_L_PRODUCTO, ' + coCRLF +
            '       CCAT.CVE_COMISION, ' + coCRLF +
            '       CCAT.DESC_COMISION, ' + coCRLF +
            '       P.ID_PERSONA, ' + coCRLF +
            '       P.NOMBRE, ' + coCRLF +
            '       PROV.ID_CREDITO, ' + coCRLF +
            '       TO_CHAR(PROV.F_INICIO,''DD/MM/YYYY'') AS F_INICIO, ' + coCRLF +
            '       TO_CHAR(PROV.F_VENCIMIENTO,''DD/MM/YYYY'') AS F_VENCIMIENTO, ' + coCRLF +
            // INICIO QUITA NEGATIVOS DE DIAS X VENCER JFOF 05/12/2012
//            '       PROV.F_VENCIMIENTO - TO_DATE( ''' + sFecha + ''', ''DD/MM/YYYY'' ) - 1 AS DIAS_X_VENCER, ' + coCRLF +
            '       CASE WHEN PROV.F_VENCIMIENTO - TO_DATE ( ''' + sFecha + ''', ''DD/MM/YYYY'')  - 1 >= 0' + coCRLF +
            '          THEN PROV.F_VENCIMIENTO - TO_DATE ( ''' + sFecha + ''', ''DD/MM/YYYY'')  - 1 ELSE 0' + coCRLF +
            '           END AS DIAS_X_VENCER,' + coCRLF +
            // FIN    QUITA NEGATIVOS DE DIAS X VENCER JFOF 05/12/2012
            '       PROV.IMP_COMISION, ' + coCRLF +
            '       PROV.IMP_COMISION_DIA, ' + coCRLF +
            '       PROV.IMP_COMISION_PER, ' + coCRLF +
            '       PROV.IMP_ACUM_MENS,' + coCRLF + // JFOF SE AGREGA IMPORTE ACUMULADO MENSUAL 23/11/2012
            '       (PROV.IMP_COMISION - PROV.IMP_COMISION_PER) AS IMP_X_DEVENGAR ' + coCRLF +
            'FROM   ( '+ coCRLF +
            '        SELECT ''CR'' CVE_ACCESORIO, ' + coCRLF +
            '               PROV.ID_CREDITO, ' + coCRLF +
            '               PROV.F_CIERRE, ' + coCRLF +
            '               PROV.CVE_COMISION, ' + coCRLF +
            '               PROV.IMP_COMISION, ' + coCRLF +
            '               PROV.IMP_COMISION_DIA, ' + coCRLF +
            '               PROV.IMP_COMISION_PER, ' + coCRLF +
            // INICIO SE AGREGA IMPORTE ACUMULADO MENSUAL JFOF 23/11/2012
            '               (SELECT SUM(IMP_COMISION_DIA)' + coCRLF +
            '                   FROM CR_COM_PROVISION' + coCRLF +
            '                  WHERE ID_CREDITO = PROV.ID_CREDITO' + coCRLF +
            '                    and cve_comision=prov.cve_comision      ' +       //sasg4921 13/12/2015
            '                    AND F_CIERRE BETWEEN TO_DATE('''+ sFechdev +''',''dd/mm/yyyy'')' + coCRLF +
            '                    AND TO_DATE('''+ sFecha +''',''dd/mm/yyyy'')) AS IMP_ACUM_MENS,' + coCRLF +
            // FIN    SE AGREGA IMPORTE ACUMULADO MENSUAL JFOF 23/11/2012
            '               C.F_INICIO, ' + coCRLF +
            '               C.F_VENCIMIENTO, ' + coCRLF +
            '               C.ID_CONTRATO, ' + coCRLF +
            '               L.CVE_PRODUCTO_CRE '+ coCRLF +
            '        FROM   CR_COM_PROVISION PROV, ' + coCRLF +
            '               CR_CREDITO C, ' + coCRLF +
            '               CR_CONTRATO L ' + coCRLF +
            '        WHERE  PROV.ID_CREDITO  = C.ID_CREDITO ' + coCRLF +
            // INICIO CAMBIO DE F_CIERRE PARA OBTENER CREDITOS DEVENGADOS EN EL PERIODO JFOF  04/12/2012
//            '          AND  PROV.F_CIERRE    = TO_DATE( ''' + sFecha + ''', ''DD/MM/YYYY'' ) ' + coCRLF +
            '           AND (prov.id_credito, prov.f_cierre, prov.CVE_COMISION, prov.CVE_ACCESORIO) IN' + coCRLF +
            '                                                (SELECT id_credito, MAx(f_cierre) f_cierre,CVE_COMISION,CVE_ACCESORIO' + coCRLF +
            '                                                   FROM cr_com_provision' + coCRLF +
            '                                                  where 1=1' + coCRLF +
            '                                                    and f_cierre BETWEEN TO_DATE('''+ sFechdev +''',''dd/mm/yyyy'')' + coCRLF +
            '                                                    and TO_DATE('''+ sFecha +''',''dd/mm/yyyy'')' + coCRLF +
            '                                                  group by id_credito,CVE_COMISION,CVE_ACCESORIO)' + coCRLF +
            // FIN   CAMBIO DE F_CIERRE PARA OBTENER CREDITOS DEVENGADOS EN EL PERIODO JFOF  04/12/2012
            '          AND  L.ID_CONTRATO    = C.ID_CONTRATO ' + coCRLF +
            '          AND  L.FOL_CONTRATO   = C.FOL_CONTRATO ' + coCRLF +
            '        UNION ' + coCRLF +
            '        SELECT PROV.CVE_ACCESORIO, ' + coCRLF +
            '               PROV.ID_ACCESORIO, ' + coCRLF +
            '               PROV.F_CIERRE, ' + coCRLF +
            '               PROV.CVE_COMISION, ' + coCRLF +
            '               PROV.IMP_COMISION, ' + coCRLF +
            '               PROV.IMP_COMISION_DIA, ' + coCRLF +
            '               PROV.IMP_COMISION_PER, ' + coCRLF +
            // INICIO SE AGREGA IMPORTE ACUMULADO MENSUAL JFOF 23/11/2012
            '              (SELECT SUM(IMP_COMISION_DIA)' + coCRLF +
            '                 FROM CR_COM_PROV_ACC' + coCRLF +
            '                WHERE ID_ACCESORIO = PROV.ID_ACCESORIO' + coCRLF +
            '                  AND F_CIERRE BETWEEN TO_DATE('''+ sFechdev +''',''dd/mm/yyyy'')' + coCRLF +
            '                  AND TO_DATE('''+ sFecha +''',''dd/mm/yyyy'')) AS IMP_ACUM_MENS,' + coCRLF +
            // FIN    SE AGREGA IMPORTE ACUMULADO MENSUAL JFOF 23/11/2012
            '               L.F_AUT_COMITE  F_INICIO, ' + coCRLF +
            '               L.F_VENCIMIENTO F_VENCIMIENTO, ' + coCRLF +
            '               L.ID_CONTRATO, ' + coCRLF +
            '               L.CVE_PRODUCTO_CRE ' + coCRLF +
            '        FROM   CR_COM_PROV_ACC PROV, ' + coCRLF +
            '               CR_CONTRATO L ' + coCRLF +
            '        WHERE  ( ( PROV.ID_ACCESORIO  = L.ID_CONTRATO  ) AND ' + coCRLF +
            '                 ( PROV.FOL_ACCESORIO = L.FOL_CONTRATO ) AND ' + coCRLF +
            '                 ( PROV.CVE_ACCESORIO = ''LN''         ) ' + coCRLF +
            '               ) ' + coCRLF +
            // INICIO SE AGREGA IMPORTE ACUMULADO MENSUAL JFOF 23/11/2012
//            '          AND  PROV.F_CIERRE          = TO_DATE( ''' + sFecha + ''', ''DD/MM/YYYY'' ) ' + coCRLF +
            '          AND (ID_ACCESORIO, FOL_ACCESORIO, CVE_ACCESORIO, F_CIERRE, CVE_COMISION) IN' + coCRLF +
            '                                                           (SELECT ID_ACCESORIO, FOL_ACCESORIO, CVE_ACCESORIO, MAx(f_cierre) f_cierre,CVE_COMISION' + coCRLF +
            '                                                              FROM CR_COM_PROV_ACC' + coCRLF +
            '                                                             where 1=1' + coCRLF +
            '                                                               and f_cierre BETWEEN TO_DATE('''+ sFechdev +''',''dd/mm/yyyy'')' + coCRLF +
            '                                                               and TO_DATE('''+ sFecha +''',''dd/mm/yyyy'')' + coCRLF +
            '                                                             group by ID_ACCESORIO, FOL_ACCESORIO, CVE_ACCESORIO,CVE_COMISION)' + coCRLF +
            // FIN    SE AGREGA IMPORTE ACUMULADO MENSUAL JFOF 23/11/2012
            '       ) PROV, ' + coCRLF +
            '       CONTRATO CTTO, ' + coCRLF +
            '       PERSONA P, ' + coCRLF +
            '       MONEDA MON, ' + coCRLF +
            '       CR_PRODUCTO PROD, ' + coCRLF +
            '       CR_CAT_COMISION CCAT, ' + coCRLF +
            '       EMPRESA EMP ' + coCRLF +
            'WHERE  CTTO.ID_CONTRATO     = PROV.ID_CONTRATO ' + coCRLF +
            '  AND  P.ID_PERSONA          = CTTO.ID_TITULAR ' + coCRLF +
            '  AND  MON.CVE_MONEDA        = CTTO.CVE_MONEDA ' + coCRLF +
            '  AND  PROD.CVE_PRODUCTO_CRE = PROV.CVE_PRODUCTO_CRE ' + coCRLF +
            '  AND  PROV.CVE_COMISION     = CCAT.CVE_COMISION ' + coCRLF +
            // INICIO CAMBIO DE F_CIERRE PARA OBTENER CREDITOS DEVENGADOS EN EL PERIODO JFOF  04/12/2012
//            '  AND  PROV.F_CIERRE         = TO_DATE( ''' + sFecha + ''', ''DD/MM/YYYY'' ) ' + coCRLF +
            '  AND (prov.id_credito, prov.f_cierre, prov.CVE_COMISION, prov.CVE_ACCESORIO) IN' + coCRLF +
            '                                                 (SELECT id_credito, MAx(f_cierre) f_cierre,CVE_COMISION,CVE_ACCESORIO' + coCRLF +
            '                                                    FROM cr_com_provision' + coCRLF +
            '                                                   where 1=1' + coCRLF +
            '                                                     and f_cierre BETWEEN TO_DATE('''+ sFechdev +''',''dd/mm/yyyy'')' + coCRLF +
            '                                                     and TO_DATE('''+ sFecha +''',''dd/mm/yyyy'')' + coCRLF +
            '                                                  group by id_credito,CVE_COMISION,CVE_ACCESORIO)' + coCRLF +
            // FIN CAMBIO DE F_CIERRE PARA OBTENER CREDITOS DEVENGADOS EN EL PERIODO JFOF  04/12/2012
            '  AND  PROD.ID_EMPRESA       = EMP.ID_EMPRESA ' + coCRLF;
            sSQL := sSQL + sFiltros;
            //
            sSQL := coCRLF + sSQL + coCRLF +
            // INTERCREDITOS
            'UNION ALL'                                       + coCRLF +
            'SELECT MON.CVE_MONEDA, '                         + coCRLF +
            '       MON.DESC_MONEDA, '                        + coCRLF +
            '       PROD.CVE_PRODUCTO_CRE, '                  + coCRLF +
            //'       TO_CHAR(PROD.CVE_SUB_TIP_BCO ) CVE_PRODUCTO_CRE, ' + coCRLF +
            '       PROD.DESC_SUB_TIPO, '                  + coCRLF +
            '       CCAT.CVE_COMISION, '                   + coCRLF +
            '       CCAT.DESC_COMISION, '                  + coCRLF +
            '       P.ID_PERSONA, '                        + coCRLF +
            '       P.NOMBRE, '                            + coCRLF +
            '       PROV.ID_CREDITO, '                     + coCRLF +
            '       TO_CHAR(PROV.F_INICIO,''DD/MM/YYYY'') AS F_INICIO, '              + coCRLF +
            '       TO_CHAR(PROV.F_VENCIMIENTO,''DD/MM/YYYY'') AS F_VENCIMIENTO, '    + coCRLF +
            // INICIO QUITA NEGATIVOS DE DIAS X VENCER JFOF 05/12/2012
//            '       PROV.F_VENCIMIENTO - TO_DATE( ''' + sFecha + ''', ''DD/MM/YYYY'' ) - 1 AS DIAS_X_VENCER, ' + coCRLF +
            '       CASE WHEN PROV.F_VENCIMIENTO - TO_DATE ( ''' + sFecha + ''', ''DD/MM/YYYY'')  - 1 >= 0' + coCRLF +
            '          THEN PROV.F_VENCIMIENTO - TO_DATE ( ''' + sFecha + ''', ''DD/MM/YYYY'')  - 1 ELSE 0' + coCRLF +
            '           END AS DIAS_X_VENCER,' + coCRLF +
            // FIN    QUITA NEGATIVOS DE DIAS X VENCER JFOF 05/12/2012
            '       PROV.IMP_COMISION, '                                              + coCRLF +
            '       PROV.IMP_COMISION_DIA, '                                          + coCRLF +
            '       PROV.IMP_COMISION_PER, '                                          + coCRLF +
            '       PROV.IMP_ACUM_MENS,'                                              + coCRLF + // JFOF SE AGREGA IMPORTE ACUMULADO MENSUAL 23/11/2012
            '       (PROV.IMP_COMISION - PROV.IMP_COMISION_PER) AS IMP_X_DEVENGAR '   + coCRLF +
            'FROM  ( '                                                                + coCRLF +
            '       SELECT ''CR'' CVE_ACCESORIO, '                                    + coCRLF +
            '              PROV.ID_CREDITO, '                                         + coCRLF +
            '              PROV.F_CIERRE, '                                           + coCRLF +
            '              PROV.CVE_COMISION, '                                       + coCRLF +
            '              PROV.IMP_COMISION, '                                       + coCRLF +
            '              PROV.IMP_COMISION_DIA, '                                   + coCRLF +
            '              PROV.IMP_COMISION_PER, '                                   + coCRLF +
            // INICIO SE AGREGA IMPORTE ACUMULADO MENSUAL JFOF 23/11/2012
            '              (SELECT SUM(IMP_COMISION_DIA)'+ coCRLF +
            '                 FROM CRE_COM_PROVISION WHERE ID_CREDITO = PROV.ID_CREDITO'+ coCRLF +
            '                  AND F_CIERRE BETWEEN TO_DATE('''+ sFechdev +''',''dd/mm/yyyy'')'+ coCRLF +
            '                  AND TO_DATE( ''' + sFecha + ''',''dd/mm/yyyy'')) AS IMP_ACUM_MENS,'+ coCRLF +
            // FIN    SE AGREGA IMPORTE ACUMULADO MENSUAL JFOF 23/11/2012
            '              C.F_VALOR_CRED F_INICIO, '                                 + coCRLF +
            '              C.F_VALOR_CRED + C.DIAS_PLAZO F_VENCIMIENTO, '             + coCRLF +
            '              C.ID_CONTRATO, '                                           + coCRLF +
            '              L.CVE_SUB_TIP_BCO CVE_PRODUCTO_CRE '                       + coCRLF +
            '       FROM   CRE_COM_PROVISION PROV, '                                  + coCRLF +
            '              CRE_CREDITO C, '                                           + coCRLF +
            '              CRE_CONTRATO L '                                           + coCRLF +
            '       WHERE  PROV.ID_CREDITO  = C.ID_CREDITO '                          + coCRLF +
            // INICIO  CAMBIO DE F_CIERRE PARA OBTENER CREDITOS DEVENGADOS EN EL PERIODO JFOF  04/12/2012
//            '             AND  PROV.F_CIERRE    = TO_DATE( ''' + sFecha + ''', ''DD/MM/YYYY'' ) ' + coCRLF +
            '          AND (prov.ID_CREDITO, prov.F_CIERRE, prov.CVE_COMISION) IN '   + coCRLF +
            '                                                           (SELECT id_credito, MAx(f_cierre) f_cierre,CVE_COMISION ' + coCRLF +
            '                                                              FROM cre_com_provision ' + coCRLF +
            '                                                             where 1=1 ' + coCRLF +
            '                                                               and f_cierre BETWEEN TO_DATE('''+ sFechdev +''',''dd/mm/yyyy'')' + coCRLF +
            '                                                               and TO_DATE('''+ sFecha +''',''dd/mm/yyyy'')' + coCRLF +
            '                                                             group by id_credito,CVE_COMISION)' + coCRLF +
            // FIN  CAMBIO DE F_CIERRE PARA OBTENER CREDITOS DEVENGADOS EN EL PERIODO JFOF  04/12/2012
            '             AND  L.ID_CONTRATO    = C.ID_CONTRATO '                     + coCRLF +
            '      ) PROV, '                                                          + coCRLF +
            '      CONTRATO CTTO, '                                                   + coCRLF +
            '      PERSONA P, '                                                       + coCRLF +
            '      MONEDA MON, '                                                      + coCRLF +
            '      (SELECT TO_CHAR(CVE_SUB_TIP_BCO) CVE_PRODUCTO_CRE, '               + coCRLF +
            '              DESC_SUB_TIPO '                                            + coCRLF +
            '       FROM   CRE_SUB_TIP_BCO '                                          + coCRLF +
            '      )PROD, '                                                           + coCRLF +
            '      CRE_COMISION CCAT, '                                               + coCRLF +
            '      EMPRESA EMP '                                                      + coCRLF +
            'WHERE CTTO.ID_CONTRATO      = PROV.ID_CONTRATO '                         + coCRLF +
            ' AND  P.ID_PERSONA          = CTTO.ID_TITULAR '                          + coCRLF +
            ' AND  MON.CVE_MONEDA        = CTTO.CVE_MONEDA '                          + coCRLF +
            ' AND  PROD.CVE_PRODUCTO_CRE = PROV.CVE_PRODUCTO_CRE '                    + coCRLF +
            ' AND  PROV.CVE_COMISION     = CCAT.CVE_COMISION '                        + coCRLF +
            // INICIO CAMBIO DE F_CIERRE PARA OBTENER CREDITOS DEVENGADOS EN EL PERIODO JFOF  04/12/2012
//            ' AND  PROV.F_CIERRE         = TO_DATE( ''' + sFecha + ''', ''DD/MM/YYYY'' ) ';
            ' AND (prov.ID_CREDITO, prov.F_CIERRE, prov.CVE_COMISION) IN '            + coCRLF +
            '                                                   (SELECT id_credito, MAx(f_cierre) f_cierre,CVE_COMISION' + coCRLF +
            '                                                      FROM cre_com_provision' + coCRLF +
            '                                                     where 1=1' + coCRLF +
            '                                                       and f_cierre BETWEEN TO_DATE('''+ sFechdev +''',''dd/mm/yyyy'')' + coCRLF +
            '                                                       and TO_DATE('''+ sFecha +''',''dd/mm/yyyy'')' + coCRLF +
            '                                                     group by id_credito,CVE_COMISION)';
            // FIN  CAMBIO DE F_CIERRE PARA OBTENER CREDITOS DEVENGADOS EN EL PERIODO JFOF  04/12/2012
            //
            sSQL := sSQL + sFiltros;
            //sSQL := sSQL + ' ORDER BY MON.CVE_MONEDA, PROD.CVE_PRODUCTO_CRE, CCAT.CVE_COMISION, ' + coCRLF +
            //               '			 P.ID_PERSONA, PROV.ID_CREDITO ';
            sSQL := sSQL + 'ORDER BY CVE_MONEDA, CVE_PRODUCTO_CRE, CVE_COMISION, ' + coCRLF +
                           '         ID_PERSONA, ID_CREDITO ';


    Result := sSQL;
End;

procedure TQrComCobAn.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  If sArchivo <> '' Then
      Begin
        Writeln(F,
                  qyConsulta.FieldByName('DESC_MONEDA').AsString + #09 +
                  qyConsulta.FieldByName('CVE_PRODUCTO_CRE').AsString + #09 +
                  qyConsulta.FieldByName('CVE_COMISION').AsString + #09 +
                  qyConsulta.FieldByName('ID_PERSONA').AsString + #09 +
                  qyConsulta.FieldByName('NOMBRE').AsString + #09 +
                  qyConsulta.FieldByName('ID_CREDITO').AsString + #09 +
                  FormatDateTime('DD/MM/YYYY',qyConsulta.FieldByName('F_INICIO').AsDateTime) + #09 +
                  FormatDateTime('DD/MM/YYYY',qyConsulta.FieldByName('F_VENCIMIENTO').AsDateTime) + #09 +
                  qyConsulta.FieldByName('DIAS_X_VENCER').AsString + #09 +
                  FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('IMP_COMISION').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('IMP_COMISION_DIA').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('IMP_ACUM_MENS').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('IMP_COMISION_PER').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('IMP_X_DEVENGAR').AsFloat));

      End;
end;

End.

