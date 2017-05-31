unit IntMQrProxVenc;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2;

type
  TQrProxVenc = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyConsulta: TQuery;
    GpoSuc: TQRGroup;
    GpoMon: TQRGroup;
    GpoProm: TQRGroup;
    GpoDiaA: TQRGroup;
    FooAutor: TQRBand;
    QRExpr5: TQRExpr;
    QRBand4: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel38: TQRLabel;
    QRBand5: TQRBand;
    QRLabel39: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel48: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    FooMon: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRLabel4: TQRLabel;
    FooProm: TQRBand;
    QRExpr15: TQRExpr;
    QRLabel8: TQRLabel;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr19: TQRExpr;
    FooDiaA: TQRBand;
    QRExpr21: TQRExpr;
    QRLabel9: TQRLabel;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr25: TQRExpr;
    QRBand2: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape1: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape9: TQRShape;
    QRShape14: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape15: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    GpoAutor: TQRGroup;
    QRDBText2: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    FooSuc: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel22: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr7: TQRExpr;
    QRBand1: TQRBand;
    QRLabel23: TQRLabel;
    QRExpr11: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
  private
  public
     Apli : TInterApli;

     Function FormaQuery(sFIni, sFFin, sMoneda, sPromotor, sIncDec, sAcreditado, sAutorizacion,
                         sEmpresa, sSucursal: String; pAPli: TInterApli): String;
  end;

var
    QrProxVenc: TQrProxVenc;

Procedure RepProxVenc(sFIni, sFFin, sMoneda, sPromotor, sIncDec, sAcreditado, sAutorizacion,
                         sEmpresa, sSucursal: String; pAPli: TInterApli; pPreview: Boolean);
Implementation
{$R *.DFM}

Procedure RepProxVenc(sFIni, sFFin, sMoneda, sPromotor, sIncDec, sAcreditado, sAutorizacion,
                         sEmpresa, sSucursal: String; pAPli: TInterApli; pPreview: Boolean);
Var
    QrProxVenc  : TQrProxVenc;
    Preview     : TIntQRPreview;
Begin
    QrProxVenc   := TQrProxVenc.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrProxVenc);
    QrProxVenc.Apli := pAPli;

    Try
        QrProxVenc.QRInterEncabezado1.Apli := pApli;
        QrProxVenc.QRInterEncabezado1.IdEmpresa := pAPli.IdEmpresa;
        QrProxVenc.QRInterEncabezado1.NomReporte :='IntMQrProxVenc';
        QrProxVenc.QRInterEncabezado1.Titulo1 := 'Próximos vencimientos de incremento / decremento';
        QrProxVenc.QRInterEncabezado1.Titulo2 := 'Del ' + sFIni + ' al ' + sFFin;
        QrProxVenc.qyConsulta.DatabaseName := pApli.DataBaseName;
        QrProxVenc.qyConsulta.SessionName := pApli.SessionName;
        QrProxVenc.qyConsulta.Active := False;

        QrProxVenc.qyConsulta.SQL.Text := QrProxVenc.FormaQuery(sFIni, sFFin, sMoneda, sPromotor, sIncDec, sAcreditado,
                                                                sAutorizacion, sEmpresa, sSucursal,pAPli);
        
        QrProxVenc.qyConsulta.Active := True;

        If pPreview Then
            QrProxVenc.Preview
        Else
            QrProxVenc.Print;
    Finally
        QrProxVenc.free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrProxVenc.FormaQuery(sFIni, sFFin, sMoneda, sPromotor, sIncDec, sAcreditado, sAutorizacion,
                                sEmpresa, sSucursal: String; pAPli: TInterApli): String;
Var
    sSQL:         String;
    sFiltros:     String;
    sFechaAct:    String;
    sFilFechas:   String;
Begin
    sFiltros := '    AND CTO.ID_EMPRESA = ' + sEmpresa + coCRLF;

    sFilFechas := '        AND CSE.F_VTO_EXCESO >= TO_DATE('''+ sFIni +''',''DD/MM/YYYY'') ' + coCRLF +
                  '        AND CSE.F_VTO_EXCESO <= TO_DATE('''+ sFFin +''',''DD/MM/YYYY'') ' + coCRLF;

    sFechaAct := FormatDateTime('DD/MM/YYYY',pApli.DameFechaEmpresa);

    If (Trim(sIncDec) <> '') Then
        sFilFechas := sFilFechas + '    AND CDA.CVE_TIPO_MOVTO = ''' + sIncDec + '''' + coCRLF;

    If Trim(sMoneda) <> '' Then
        sFiltros := sFiltros + '    AND MON.CVE_MONEDA = ''' + sMoneda + '''' + coCRLF;
    If Trim(sPromotor) <> '' Then
        sFiltros := sFiltros + '    AND PA.ID_PERSONA = ' + sPromotor + coCRLF;
    If Trim(sAcreditado) <> '' Then
        sFiltros := sFiltros + '    AND PER.ID_PERSONA = ' + sAcreditado + coCRLF;
    If Trim(sAutorizacion) <> '' Then
        sFiltros := sFiltros + '    AND CTO.ID_CONTRATO = ' + sAutorizacion + coCRLF;

    sSQL := ' SELECT ' + coCRLF +
            '    CTO.ID_EMPRESA, ' + coCRLF +
            '    UN.ID_ENTIDAD, ' + coCRLF +
            '    UN.DESC_ENTIDAD, ' + coCRLF +
            '    MON.CVE_MONEDA, ' + coCRLF +
            '    MON.DESC_MONEDA, ' + coCRLF +
            '    PA.ID_PERSONA, ' + coCRLF +
            '    PA.NOMBRE AS NOM_PROMOTOR, ' + coCRLF +
            '    CTO.ID_TITULAR, ' + coCRLF +
            '    CTO.ID_CONTRATO, ' + coCRLF +
            '    PER.NOMBRE, ' + coCRLF +
            '    CCTO.CVE_PRODUCTO_CRE, ' + coCRLF +
            '    TO_CHAR(CCTO.F_AUT_COMITE,''DD/MM/YYYY'') AS F_APERTURA, ' + coCRLF +
            '    DETALLE.CVE_TPO_OPER, ' + coCRLF +
            '    DETALLE.ID_CONTRATO, ' + coCRLF +
            '    DETALLE.TIPO_OPER, ' + coCRLF +
            '    DETALLE.DESC_MONEDA_A, ' + coCRLF +
            '    DETALLE.F_INICIO, ' + coCRLF +
            '    DETALLE.F_VENCTO, ' + coCRLF +
            '    DETALLE.IMP_AUTORIZADO, ' + coCRLF +
            '    DETALLE.SDO_DISPUESTO, ' + coCRLF +
            '    DETALLE.SDO_DISPONIBLE, ' + coCRLF +
            '    DETALLE.IMP_INC_DEC, ' + coCRLF +
            '    DETALLE.IMP_DISP_INC_DEC, ' + coCRLF +
            '    (DETALLE.IMP_AUTORIZADO * NVL(PKGCORPO.OBTTIPOCAMBIO(TO_DATE('''+ sFechaAct +''',''DD/MM/YYYY''), ' + coCRLF +
            '                              MON.CVE_MONEDA, ''V''),1)) AS IMP_AUTORIZADO_MN, ' + coCRLF +
            '    (DETALLE.SDO_DISPUESTO * NVL(PKGCORPO.OBTTIPOCAMBIO(TO_DATE('''+ sFechaAct +''',''DD/MM/YYYY''), ' + coCRLF +
            '                              MON.CVE_MONEDA, ''V''),1)) AS SDO_DISPUESTO_MN, ' + coCRLF +
            '    (DETALLE.SDO_DISPONIBLE * NVL(PKGCORPO.OBTTIPOCAMBIO(TO_DATE('''+ sFechaAct +''',''DD/MM/YYYY''), ' + coCRLF +
            '                              MON.CVE_MONEDA, ''V''),1)) AS SDO_DISPONIBLE_MN, ' + coCRLF +
            '    (DETALLE.IMP_INC_DEC * NVL(PKGCORPO.OBTTIPOCAMBIO(TO_DATE('''+ sFechaAct +''',''DD/MM/YYYY''), ' + coCRLF +
            '                              MON.CVE_MONEDA, ''V''),1)) AS IMP_INC_DEC_MN, ' + coCRLF +
            '    (DETALLE.IMP_DISP_INC_DEC * NVL(PKGCORPO.OBTTIPOCAMBIO(TO_DATE('''+ sFechaAct +''',''DD/MM/YYYY''), ' + coCRLF +
            '                              MON.CVE_MONEDA, ''V''),1)) AS IMP_DISP_INC_DEC_MN, ' + coCRLF +
            '    DETALLE.IMP_AUTOR_DISP, ' + coCRLF +
            '    DETALLE.SDO_X_PAGAR, ' + coCRLF +
            '    DETALLE.DIAS_VENC ' + coCRLF +
            ' FROM ' + coCRLF +
            '   ( ' + coCRLF +
            '    SELECT ' + coCRLF +
            '        1 AS CVE_TPO_OPER, ' + coCRLF +
            '        CCTO.ID_CONTRATO, ' + coCRLF +
            '        '''' AS CVE_INC_DEC, ' + coCRLF +
            '        TO_CHAR(''Autorización ''||CCTO.ID_CONTRATO) AS TIPO_OPER, ' + coCRLF +
            '        DESC_MONEDA AS DESC_MONEDA_A, ' + coCRLF +
            '        TO_CHAR(CCTO.F_AUT_COMITE,''DD/MM/YYYY'') AS F_INICIO, ' + coCRLF +
            '        TO_CHAR(CCTO.F_VENCIMIENTO,''DD/MM/YYYY'') AS F_VENCTO, ' + coCRLF +
            '        CCTO.IMP_AUTORIZADO AS IMP_AUTORIZADO, ' + coCRLF +
            '        CCTO.IMP_DISPUESTO AS SDO_DISPUESTO, ' + coCRLF +
            '        (CCTO.IMP_AUTORIZADO - CCTO.IMP_DISPUESTO) AS SDO_DISPONIBLE, ' + coCRLF +
            '        0 AS IMP_INC_DEC, ' + coCRLF +
            '        0 AS IMP_DISP_INC_DEC, ' + coCRLF +
            '        0 AS IMP_AUTOR_DISP, ' + coCRLF +
            '        0 AS SDO_X_PAGAR, ' + coCRLF +
            '        0 AS DIAS_VENC ' + coCRLF +
            '    FROM CR_CONTRATO CCTO, ' + coCRLF +
            '        MONEDA MON ' + coCRLF +
            '    WHERE CCTO.CVE_MONEDA = MON.CVE_MONEDA ' + coCRLF +
            '        AND CCTO.ID_CONTRATO IN (SELECT DISTINCT(CDA.ID_CONTRATO) ' + coCRLF +
            '                                 FROM CR_SOL_EXCESO_AC CSE, CR_DET_EXCESO_AU CDA ' + coCRLF +
            '                                 WHERE CDA.ID_SOL_EXCESO = CSE.ID_SOL_EXCESO ' + coCRLF +
            '                                     AND CDA.ID_ACREDITADO = CSE.ID_ACREDITADO ' + coCRLF +
            sFilFechas + ')' +
            '    UNION ALL ' + coCRLF +
            '    SELECT ' + coCRLF +
            '        2 AS CVE_TPO_OPER, ' + coCRLF +
            '        CCTO.ID_CONTRATO, ' + coCRLF +
            '        CDA.CVE_TIPO_MOVTO AS CVE_INC_DEC, ' + coCRLF +
            '        DECODE(CDA.CVE_TIPO_MOVTO, ''I'', ''Incremento'', ' + coCRLF +
            '                       ''D'', ''Decremento'', ''Avisar a Sistemas'') AS TIPO_OPER, ' + coCRLF +
            '        '''' AS DESC_MONEDA_A, ' + coCRLF +
            '        TO_CHAR(CSE.F_INI_EXCESO,''DD/MM/YYYY'') AS F_INICIO, ' + coCRLF +
            '        TO_CHAR(CSE.F_VTO_EXCESO,''DD/MM/YYYY'') AS F_VENCTO, ' + coCRLF +
            '        0 AS IMP_AUTORIZADO, ' + coCRLF +
            '        0 AS SDO_DISPUESTO, ' + coCRLF +
            '        0 AS SDO_DISPONIBLE, ' + coCRLF +
            '        CSE.IMP_EXCESO_EVE AS IMP_INC_DEC, ' + coCRLF +
            '        PKGCRSALDOS.STPOBTDISPONIBLEAUT(CCTO.ID_CONTRATO, CCTO.FOL_CONTRATO) AS IMP_DISP_INC_DEC, ' + coCRLF +
            '        0 AS IMP_AUTOR_DISP, ' + coCRLF +
            '        0 AS SDO_X_PAGAR, ' + coCRLF +
            '        (CSE.F_VTO_EXCESO - TO_DATE('''+ sFechaAct +''',''DD/MM/YYYY'')) AS DIAS_VENC ' + coCRLF +
            '    FROM ' + coCRLF +
            '        CR_CONTRATO CCTO, ' + coCRLF +
            '        CR_SOL_EXCESO_AC CSE, ' + coCRLF +
            '        CR_DET_EXCESO_AU CDA ' + coCRLF +
            '    WHERE ' + coCRLF +
            '        CCTO.ID_CONTRATO = CDA.ID_CONTRATO ' + coCRLF +
            '        AND CDA.ID_SOL_EXCESO = CSE.ID_SOL_EXCESO ' + coCRLF +
            '        AND CDA.ID_ACREDITADO = CSE.ID_ACREDITADO ' + coCRLF +
            sFilFechas +
            '    UNION ALL ' + coCRLF +
            '    SELECT ' + coCRLF +
            '        3 AS CVE_TPO_OPER, ' + coCRLF +
            '        CC.ID_CONTRATO, ' + coCRLF +
            '        '''' AS CVE_INC_DEC, ' + coCRLF +
            '        TO_CHAR(''Disposición ''||CC.ID_CREDITO) AS TIPO_OPER, ' + coCRLF +
            '        '''' AS DESC_MONEDA_A, ' + coCRLF +
            '        TO_CHAR(CC.F_INICIO,''DD/MM/YYYY'') AS F_INICIO, ' + coCRLF +
            '        TO_CHAR(CC.F_VENCIMIENTO,''DD/MM/YYYY'') AS F_VENCTO, ' + coCRLF +
            '        0 AS IMP_AUTORIZADO, ' + coCRLF +
            '        0 AS SDO_DISPUESTO, ' + coCRLF +
            '        0 AS SDO_DISPONIBLE, ' + coCRLF +
            '        0 AS IMP_INC_DEC, ' + coCRLF +
            '        0 AS IMP_DISP_INC_DEC, ' + coCRLF +
            '        CC.IMP_CREDITO AS IMP_AUTOR_DISP, ' + coCRLF +
            '        CC.SDO_VIG_TOTAL AS SDO_X_PAGAR, ' + coCRLF +
            '        0 AS DIAS_VENC ' + coCRLF +
            '    FROM CR_CREDITO CC ' + coCRLF +
            '    WHERE CC.ID_CONTRATO IN (SELECT DISTINCT(CDA.ID_CONTRATO) ' + coCRLF +
            '                             FROM CR_SOL_EXCESO_AC CSE, CR_DET_EXCESO_AU CDA ' + coCRLF +
            '                             WHERE CDA.ID_SOL_EXCESO = CSE.ID_SOL_EXCESO ' + coCRLF +
            '                                 AND CDA.ID_ACREDITADO = CSE.ID_ACREDITADO ' + coCRLF +
            sFilFechas + ')' +
            '    ) DETALLE, ' + coCRLF +
            '    CONTRATO CTO, ' + coCRLF +
            '    CR_CONTRATO CCTO, ' + coCRLF +
            '    MONEDA MON, ' + coCRLF +
            '    UNIDAD_NEGOCIO UN, ' + coCRLF +
            '    PERSONA PER, ' + coCRLF +
            '    PERSONA PA ' + coCRLF +
            ' WHERE ' + coCRLF +
            '    CTO.ID_CONTRATO = DETALLE.ID_CONTRATO ' + coCRLF +
            '    AND CTO.ID_CONTRATO = CCTO.ID_CONTRATO ' + coCRLF +
            '    AND CTO.CVE_MONEDA = MON.CVE_MONEDA ' + coCRLF +
            '    AND CTO.ID_EMPRESA = UN.ID_EMPRESA ' + coCRLF +
            '    AND CTO.ID_ENTIDAD = UN.ID_ENTIDAD ' + coCRLF +
            '    AND PER.ID_PERSONA = CTO.ID_TITULAR ' + coCRLF +
            '    AND CTO.ID_PERS_ASOCIAD = PA.ID_PERSONA ' + coCRLF;

            sSQL := sSQL + sFiltros;
            sSQL := sSQL + ' ORDER BY ' + coCRLF +
                           '    UN.ID_ENTIDAD, MON.CVE_MONEDA, PA.ID_PERSONA, CCTO.F_AUT_COMITE, ' + coCRLF +
                           '    CTO.ID_TITULAR, PER.NOMBRE, DETALLE.ID_CONTRATO, CVE_TPO_OPER ' + coCRLF;

    Result := sSQL;
End;

End.

