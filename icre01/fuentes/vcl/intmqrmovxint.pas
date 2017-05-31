unit IntMQrMovXInt;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2;

type
  TQrMovXInt = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyConsulta: TQuery;
    GpoFOper: TQRGroup;
    GpoMon: TQRGroup;
    GpoMovto: TQRGroup;
    GpoProd: TQRGroup;
    FooMovto: TQRBand;
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
    QRLabel4: TQRLabel;
    FooProd: TQRBand;
    QRExpr15: TQRExpr;
    QRLabel8: TQRLabel;
    FooProm: TQRBand;
    QRExpr21: TQRExpr;
    QRLabel9: TQRLabel;
    QRBand2: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRDBText21: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText22: TQRDBText;
    FooMon: TQRBand;
    QRLabel1: TQRLabel;
    ExpSumMon: TQRExpr;
    QRDBText15: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    GpoProm: TQRGroup;
    QRShape14: TQRShape;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText13: TQRDBText;
    FooFOper: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    lbSdoCobranza: TQRLabel;
    lbDiferenciaSdo: TQRLabel;
    lbMsgError: TQRLabel;
    QRShape15: TQRShape;
    QRExpr2: TQRExpr;
    QRBand1: TQRBand;
    lbMsgErrFinal: TQRLabel;
    procedure FooMonBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
     Function QuerySdoCobran(sFecha, sMoneda, sPromotor, sProducto: String): String;
  public
     Apli : TInterApli;

     Function FormaQuery(sFIni, sFFin, sMoneda, sPromotor, sProducto, sAcreditado, sAutorizacion, sDisposicion,
                         sSituacion, sTpoMovto, sEmpresa, sSucursal: String; pAPli: TInterApli): String;
  end;

var
    QrMovXInt: TQrMovXInt;
    vgsEmpresa: String;
    vgsSucursal: String;
    vgsFIni: String;
    vgsFFin: String;
    vgsMoneda: String;
    vgsAutorizacion: String;
    vgsPromotor: String;
    vgsProducto: String;
    vgsAcreditado: String;
    vgsDisposicion: String;
    vgbErrorSdo: Boolean;


Procedure RepMovXInt(sFIni, sFFin, sMoneda, sPromotor, sProducto, sAcreditado, sAutorizacion, sDisposicion,
                         sSituacion, sTpoMovto, sEmpresa, sSucursal: String; pAPli: TInterApli; pPreview: Boolean);
Implementation
Uses
    IntMQrInfCobr;      //Informe de Cobranza
{$R *.DFM}

Procedure RepMovXInt(sFIni, sFFin, sMoneda, sPromotor, sProducto, sAcreditado, sAutorizacion, sDisposicion,
                         sSituacion, sTpoMovto, sEmpresa, sSucursal: String; pAPli: TInterApli; pPreview: Boolean);
Var
    QrMovXInt  : TQrMovXInt;
    Preview     : TIntQRPreview;
Begin
    QrMovXInt   := TQrMovXInt.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrMovXInt);
    QrMovXInt.Apli := pAPli;

    vgsEmpresa := sEmpresa;
    vgsSucursal := sSucursal;
    vgsFIni := sFIni;
    vgsFFin := sFFin;
    vgsMoneda := sMoneda;
    vgsAutorizacion := sAutorizacion;
    vgsPromotor := sPromotor;
    vgsProducto := sProducto;
    vgsAcreditado := sAcreditado;
    vgsDisposicion := sDisposicion;

    vgbErrorSdo := False;

    Try
        QrMovXInt.QRInterEncabezado1.Apli := pApli;
        QrMovXInt.QRInterEncabezado1.IdEmpresa := pAPli.IdEmpresa;
        QrMovXInt.QRInterEncabezado1.NomReporte :='IntMQrMovXInt';
        QrMovXInt.QRInterEncabezado1.Titulo1 := 'MOVIMIENTOS X INTERNET';
        QrMovXInt.QRInterEncabezado1.Titulo2 := 'Del ' + sFIni + ' Al ' + sFFin;
        QrMovXInt.qyConsulta.DatabaseName := pApli.DataBaseName;
        QrMovXInt.qyConsulta.SessionName := pApli.SessionName;
        QrMovXInt.qyConsulta.Active := False;

        QrMovXInt.qyConsulta.SQL.Text := QrMovXInt.FormaQuery(sFIni, sFFin, sMoneda, sPromotor, sProducto, sAcreditado, sAutorizacion,
                                                              sDisposicion, sSituacion, sTpoMovto, sEmpresa, sSucursal,pAPli);

        // QrMovXInt.qyConsulta.SQL.SaveToFile('C:\Intercase\Interacciones\ICre01\Consulta_1.txt');

        QrMovXInt.qyConsulta.Active := True;

        If pPreview Then
            QrMovXInt.Preview
        Else
            QrMovXInt.Print;
    Finally
        QrMovXInt.free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrMovXInt.FormaQuery(sFIni, sFFin, sMoneda, sPromotor, sProducto, sAcreditado, sAutorizacion, sDisposicion,
                                sSituacion, sTpoMovto, sEmpresa, sSucursal: String; pAPli: TInterApli): String;
Var
    sSQL:         String;
    sFiltros:     String;
Begin
    sFiltros := ' AND CIB.ID_EMPRESA = ' + sEmpresa + coCRLF;

    sFiltros := sFiltros + '    AND CIB.F_OPERACION >= TO_DATE('''+ sFIni +''',''DD/MM/YYYY'') ' + coCRLF +
                           '    AND CIB.F_OPERACION <= TO_DATE('''+ sFFin +''',''DD/MM/YYYY'') ' + coCRLF;

    If Trim(sSituacion) <> '' Then
        sFiltros := sFiltros + '    AND CIB.RESULTADO ' + sSituacion + ' 0 ' + coCRLF;
    If Trim(sTpoMovto) <> '' Then
        sFiltros := sFiltros + '    AND CIB.CVE_EVENTO = ''' + sTpoMovto + '''' + coCRLF;
    If Trim(sMoneda) <> '' Then
        sFiltros := sFiltros + '    AND MON.CVE_MONEDA = ''' + sMoneda + '''' + coCRLF;
    If Trim(sPromotor) <> '' Then
        sFiltros := sFiltros + '    AND CIB.ID_PROM = ' + sPromotor + coCRLF;
    If Trim(sProducto) <> '' Then
        sFiltros := sFiltros + '    AND CP.CVE_PRODUCTO_CRE = ''' + sProducto + '''' + coCRLF;
    If Trim(sAcreditado) <> '' Then
        sFiltros := sFiltros + '    AND PER.ID_PERSONA = ' + sAcreditado + coCRLF;
    If Trim(sAutorizacion) <> '' Then
        sFiltros := sFiltros + '    AND CTO.ID_CONTRATO = '+ sAutorizacion  + coCRLF;
    If Trim(sDisposicion) <> '' Then
        sFiltros := sFiltros + '    AND CIB.ID_CREDITO = ' + sDisposicion + coCRLF;

    sSQL := ' SELECT ' + coCRLF +
            '    CTO.ID_EMPRESA, ' + coCRLF +
            '    MON.CVE_MONEDA, ' + coCRLF +
            '    MON.DESC_MONEDA, ' + coCRLF +
            '    PA.ID_PERSONA, ' + coCRLF +
            '    PA.NOMBRE AS NOM_PROMOTOR, ' + coCRLF +
            '    CTO.ID_TITULAR, ' + coCRLF +
            '    PER.NOMBRE, ' + coCRLF +
            '    CCTO.CVE_PRODUCTO_CRE, ' + coCRLF +
            '    CP.DESC_L_PRODUCTO, ' + coCRLF +
            '    CIB.ID_EMPRESA, ' + coCRLF +
            '    CIB.F_OPERACION, ' + coCRLF +
            '    CIB.CVE_EVENTO, ' + coCRLF +
            '    DECODE(CIB.CVE_EVENTO, ''COLOCA'',''Colocación'',''PAGO'',''Recuperación'','' '') AS DESC_MOVTO, ' + coCRLF +
            '    DECODE(CIB.CVE_EVENTO, ''COLOCA'',CIB.ID_CONTRATO,''PAGO'',CIB.ID_CREDITO,'' '') AS AUTOR_DISP, ' + coCRLF +
            '    CIB.IMP_MOVIMIENTO, ' + coCRLF +
            '    CIB.TX_PARAMETRO, ' + coCRLF +
            '    CIB.RESULTADO || '' - '' || CIB.TX_RESULTADO AS RESUL_PROCES, ' + coCRLF +
            '    TO_CHAR(CIB.F_INICIO,''DD/MM/YYYY'') AS F_INICIO, ' + coCRLF +
            '    TO_CHAR(CIB.F_VENCIMIENTO,''DD/MM/YYYY'') AS F_VENCIMIENTO ' + coCRLF +
            ' FROM ' + coCRLF +
            '    ( ' + coCRLF +
            '     SELECT ' + coCRLF +
            '        CIB.ID_EMPRESA, ' + coCRLF +
            '        CIB.ID_FOLIO, ' + coCRLF +
            '        CIB.F_OPERACION, ' + coCRLF +
            '        CIB.CVE_EVENTO, ' + coCRLF +
            '        CCTO.ID_CONTRATO, ' + coCRLF +
            '        CIB.ID_CREDITO, ' + coCRLF +
            '        CIB.IMP_MOVIMIENTO, ' + coCRLF +
            '        CIB.TX_PARAMETRO, ' + coCRLF +
            '        CIB.RESULTADO, ' + coCRLF +
            '        CIB.TX_RESULTADO, ' + coCRLF +
            '        CC.F_INICIO, ' + coCRLF +
            '        CC.F_VENCIMIENTO, ' + coCRLF +
            '        CC.ID_PROM_ADM AS ID_PROM ' + coCRLF +
            '     FROM ' + coCRLF +
            '        CR_INET_BITACORA CIB, ' + coCRLF +
            '        CR_CREDITO CC, ' + coCRLF +
            '        CR_CONTRATO CCTO ' + coCRLF +
            '     WHERE ' + coCRLF +
            '        CIB.ID_CREDITO IS NOT NULL ' + coCRLF +
            '        AND CC.ID_CREDITO = CIB.ID_CREDITO ' + coCRLF +
            '        AND CC.ID_CONTRATO = CCTO.ID_CONTRATO ' + coCRLF +
            '     UNION ALL ' + coCRLF +
            '     SELECT ' + coCRLF +
            '        CIB.ID_EMPRESA, ' + coCRLF +
            '        CIB.ID_FOLIO, ' + coCRLF +
            '        CIB.F_OPERACION, ' + coCRLF +
            '        CIB.CVE_EVENTO, ' + coCRLF +
            '        CIB.ID_CONTRATO, ' + coCRLF +
            '        CIB.ID_CREDITO, ' + coCRLF +
            '        CIB.IMP_MOVIMIENTO, ' + coCRLF +
            '        CIB.TX_PARAMETRO, ' + coCRLF +
            '        CIB.RESULTADO, ' + coCRLF +
            '        CIB.TX_RESULTADO, ' + coCRLF +
            '        CCTO.F_AUT_COMITE AS F_INICIO, ' + coCRLF +
            '        CCTO.F_VENCIMIENTO, ' + coCRLF +
            '        NVL(CCM.ID_PROM_ADM,0) AS ID_PROM ' + coCRLF +
            '     FROM ' + coCRLF +
            '        CR_INET_BITACORA CIB, ' + coCRLF +
            '        CR_CONTRATO CCTO, ' + coCRLF +
            '        CR_CREDITO_MARCO CCM ' + coCRLF +
            '     WHERE ' + coCRLF +
            '        CIB.ID_CONTRATO IS NOT NULL ' + coCRLF +
            '        AND CIB.ID_CONTRATO = CCTO.ID_CONTRATO ' + coCRLF +
            '        AND CCTO.ID_CREDITO_MARCO = CCM.ID_CREDITO_MARCO (+) ' + coCRLF +
            '    ) CIB, ' + coCRLF +
            '    CONTRATO CTO, ' + coCRLF +
            '    CR_CONTRATO CCTO, ' + coCRLF +
            '    MONEDA MON, ' + coCRLF +
            '    PERSONA PER, ' + coCRLF +
            '    PERSONA PA, ' + coCRLF +
            '    CR_PRODUCTO CP ' + coCRLF +
            ' WHERE CIB.ID_CONTRATO = CTO.ID_CONTRATO ' + coCRLF +
            '    AND CTO.ID_CONTRATO = CCTO.ID_CONTRATO ' + coCRLF +
            '    AND CTO.CVE_MONEDA = MON.CVE_MONEDA ' + coCRLF +
            '    AND PER.ID_PERSONA = CTO.ID_TITULAR ' + coCRLF +
            '    AND CCTO.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE ' + coCRLF +
            '    AND CIB.ID_PROM = PA.ID_PERSONA (+) ' + coCRLF;

            sSQL := sSQL + sFiltros;

            sSQL := sSQL + ' ORDER BY ' + coCRLF +
                           '    CIB.F_OPERACION, MON.CVE_MONEDA, ' + coCRLF +
                           '    CIB.CVE_EVENTO, CCTO.CVE_PRODUCTO_CRE, ' + coCRLF +
                           '    CIB.ID_PROM, CTO.ID_TITULAR, ' + coCRLF +
                           '    CIB.ID_CONTRATO, CIB.ID_CREDITO ' + coCRLF;

    Result := sSQL;
End;

Function TQrMovXInt.QuerySdoCobran(sFecha, sMoneda, sPromotor, sProducto: String): String;
Var
    sSQL:         String;
    sFiltros:     String;
Begin

    sFiltros := sFiltros + '    AND CTR.F_OPERACION = TO_DATE('''+ sFecha +''',''DD/MM/YYYY'') ' + coCRLF;
    sFiltros := sFiltros + '    AND MON.CVE_MONEDA = ''' + sMoneda + '''' + coCRLF;
    sFiltros := sFiltros + '    AND PROM.ID_PROM = ' + sPromotor + coCRLF;
    sFiltros := sFiltros + '    AND CP.CVE_PRODUCTO_CRE = ''' + sProducto + '''' + coCRLF;

    If Trim(vgsAcreditado) <> '' Then
        sFiltros := sFiltros + '    AND PER.ID_PERSONA = ' + vgsAcreditado + coCRLF;
    If Trim(vgsAutorizacion) <> '' Then
        sFiltros := sFiltros + '    AND CTO.ID_CONTRATO = ''' + vgsAutorizacion + '''' + coCRLF;
    If Trim(vgsDisposicion) <> '' Then
        sFiltros := sFiltros + '    AND CC.ID_CREDITO = ''' + vgsDisposicion + '''' + coCRLF;


    sSQL := ' SELECT ' + coCRLF +
            '    NVL(SUM(NVL(CDT.IMP_CONCEPTO,0)),10000) AS IMP_CONCEPTO ' + coCRLF +
//            '    NVL(SUM(NVL(CDT.IMP_CONCEPTO,0)),0) AS IMP_CONCEPTO ' + coCRLF +
            ' FROM ' + coCRLF +
            '    CR_TRANSACCION CTR, ' + coCRLF +
            '    CR_DET_TRANSAC CDT, ' + coCRLF +
            '    CR_OPERACION COP, ' + coCRLF +
            '    CONTRATO CTO, ' + coCRLF +
            '    MONEDA MON, ' + coCRLF +
            '    CR_CONTRATO CCTO, ' + coCRLF +
            '    PERSONA PER, ' + coCRLF +
            '    PERSONA PA, ' + coCRLF +
            '    CR_PRODUCTO CP, ' + coCRLF +
            '    CR_CREDITO CC, ' + coCRLF +
            '    ( ' + coCRLF +
            '     SELECT ' + coCRLF +
            '        CCTO.ID_CONTRATO, ' + coCRLF +
            '        CC.ID_PROM_ADM AS ID_PROM ' + coCRLF +
            '     FROM ' + coCRLF +
            '        CR_CREDITO CC, ' + coCRLF +
            '        CR_CONTRATO CCTO ' + coCRLF +
            '     WHERE ' + coCRLF +
            '        CC.ID_CONTRATO = CCTO.ID_CONTRATO ' + coCRLF +

            '     UNION ALL ' + coCRLF +
            '     SELECT ' + coCRLF +
            '        CCTO.ID_CONTRATO, ' + coCRLF +
            '        NVL(CCM.ID_PROM_ADM,0) AS ID_PROM ' + coCRLF +
            '     FROM ' + coCRLF +
            '        CR_CONTRATO CCTO, ' + coCRLF +
            '        CR_CREDITO_MARCO CCM ' + coCRLF +
            '     WHERE ' + coCRLF +
            '        CCTO.ID_CREDITO_MARCO = CCM.ID_CREDITO_MARCO (+) ' + coCRLF +
            '    ) PROM ' + coCRLF +
            ' WHERE ' + coCRLF +
            '    CTR.ID_TRANSACCION = CDT.ID_TRANSACCION ' + coCRLF +
            '    AND CTR.CVE_OPERACION = CDT.CVE_OPERACION ' + coCRLF +
            '    AND CTR.CVE_COMISION IS NULL ' + coCRLF +
            '    AND CTO.ID_CONTRATO = CTR.ID_CONTRATO ' + coCRLF +
            '    AND CTO.ID_CONTRATO = CCTO.ID_CONTRATO ' + coCRLF +
            '    AND CTO.CVE_MONEDA = MON.CVE_MONEDA ' + coCRLF +
            '    AND PER.ID_PERSONA = CTO.ID_TITULAR ' + coCRLF +
            '    AND CCTO.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE ' + coCRLF +
            '    AND CCTO.ID_CONTRATO = PROM.ID_CONTRATO ' + coCRLF +
            '    AND COP.CVE_ACCESORIO <> ''CR'' ' + coCRLF +
            '    AND COP.CVE_ACCESORIO = ''CP'' ' + coCRLF +
            '    AND COP.CVE_AFEC_SALDO = ''I'' ' + coCRLF +
            '    AND PROM.ID_PROM = PA.ID_PERSONA (+) ' + coCRLF +
            '    AND CCTO.ID_CONTRATO = CC.ID_CONTRATO ' + coCRLF +
            '    AND CCTO.FOL_CONTRATO = CC.FOL_CONTRATO ' + coCRLF;

            sSQL := sSQL + sFiltros;

    Result := sSQL;
End;

procedure TQrMovXInt.FooMonBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
    sSQLCob:    String;
    dSdoCob:    Double;
    dSdoDif:    Double;
    qyQyCob:    TQuery;
//    F2           : TextFile;
begin
    lbMsgError.Caption := '';
    lbSdoCobranza.Caption := '0';
    lbDiferenciaSdo.Caption := '0';
    dSdoCob := 0.0;

    sSQLCob := QuerySdoCobran(qyConsulta.FieldByName('F_OPERACION').AsString,
                              qyConsulta.FieldByName('CVE_MONEDA').AsString,
                              qyConsulta.FieldByName('ID_PERSONA').AsString,
                              qyConsulta.FieldByName('CVE_PRODUCTO_CRE').AsString);

    qyQyCob := GetSQLQuery(sSQLCob, Apli.DataBaseName, Apli.SessionName, False);

{
    AssignFile(F2, 'C:\Intercase\Interacciones\ICre01\Consulta_2.txt');
    Rewrite(F2);
    WriteLn(F2, sSQLCob);
    CloseFile(F2);
}

    If qyQyCob <> Nil Then Begin
        dSdoCob := qyQyCob.FieldByName('IMP_CONCEPTO').AsFloat;
        qyQyCob.Free;
    End;

    dSdoDif := ExpSumMon.Value.dblResult - dSdoCob;

    lbSdoCobranza.Caption := FormatFloat('###,###,###,###,##0.00',dSdoCob);
    lbDiferenciaSdo.Caption := FormatFloat('###,###,###,###,##0.00',dSdoDif);

    If dSdoDif <> 0.0 Then Begin
        lbMsgError.Caption := 'ERROR EN CONCILIACIÓN DE SALDOS';
        vgbErrorSdo := True;
    End;
end;

procedure TQrMovXInt.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    lbMsgErrFinal.Caption := '';

    If vgbErrorSdo Then
        lbMsgErrFinal.Caption := 'ERROR EN CONCILIACIÓN DE SALDOS';
end;

End.

