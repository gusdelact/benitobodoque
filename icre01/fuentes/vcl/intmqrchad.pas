unit IntMQrChAd;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, Dialogs, IntGenCre, UnSQL2;
type
  TQrChqraAdm = class(TQuickRep)
    QyChqraAdm: TQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    QyChqraAdmDESC_MONEDA: TStringField;
    QyChqraAdmDESC_TIPO_ACRED: TStringField;
    QyChqraAdmCVE_GPO_CHEQ: TStringField;
    QyChqraAdmDESC_GPO_CHEQ: TStringField;
    QyChqraAdmNOMBRE_EMISOR: TStringField;
    QRBand4: TQRBand;
    qrshpDiferencia: TQRShape;
    qrshpSaldoFinal: TQRShape;
    qrshpInteresesDevengados: TQRShape;
    qrshpAbonos: TQRShape;
    qrshpCargos: TQRShape;
    qrshpSaldoInicial: TQRShape;
    qrshpNombre: TQRShape;
    qrshpContrato: TQRShape;
    qrlblContrato: TQRLabel;
    qrlblNombre: TQRLabel;
    qrlblSaldoInicial: TQRLabel;
    qrlblCargos: TQRLabel;
    qrlblAbonos: TQRLabel;
    qrlblInteresesDevengados: TQRLabel;
    qrlblSaldoFinal: TQRLabel;
    qrlblDiferencia: TQRLabel;
    qrGrpCVE_GPO_CHEQ: TQRGroup;
    qrshpCVE_GPO_CHEQ: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    qrGrpCVE_MONEDA: TQRGroup;
    qrshpCVE_MONEDA: TQRShape;
    qrlblMoneda: TQRLabel;
    qrdbtxtDESC_MONEDA: TQRDBText;
    qrGrpCVE_TIPO_ACRED: TQRGroup;
    QRShape1: TQRShape;
    qrlblTipoAcreditado: TQRLabel;
    QRDBText1: TQRDBText;
    qrGrpNOMBRE: TQRGroup;
    QRShape5: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRBand1: TQRBand;
    qrdbtxtSALDO_INICIAL: TQRDBText;
    qrdbtxtNOMBRE: TQRDBText;
    qrdbtxtCARGOS: TQRDBText;
    qrdbtxtABONOS: TQRDBText;
    qrdbtxtINTERESES_DEV: TQRDBText;
    qrdbtxtSALDO_FINAL: TQRDBText;
    qrdbtxtDIFERENCIA: TQRDBText;
    qrdbtxtID_CONTRATO: TQRDBText;
    qrGrpFooterNOMBRE: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr22: TQRExpr;
    QRLabel10: TQRLabel;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRShape6: TQRShape;
    qrGrpFooterCVE_TIPO_ACRED: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr11: TQRExpr;
    QRLabel8: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRShape2: TQRShape;
    qrGrpFooterCVE_MONEDA: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel2: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRShape3: TQRShape;
    qrGrpFooterCVE_GPO_CHEQ: TQRBand;
    QRLabel3: TQRLabel;
    QRExpr15: TQRExpr;
    QRLabel4: TQRLabel;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRShape4: TQRShape;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRShape7: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
  private
  public
    Function FormaQuery(sIdAcreditado, sIdEmisor, sCveEmisorNAFIN, sIdProveedor,
                        sTipoAcred, sTipoCheqra, sOpeChequera, sCveGpoCheq, sMovimientos, sOrden :String;
                        sUsuario : String; FOperacion : TDateTime) : String;
  end;

var
  QrChqraAdm: TQrChqraAdm;

Procedure RepChqraAdmin(sIdAcreditado, sIdEmisor, sCveEmisorNAFIN, sIdProveedor,
                        sTipoAcred, sTipoCheqra, sOpeChequera, sCveGpoCheq, sMovimientos, sOrden :String;
                        pAPli     : TInterApli;
                        pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepChqraAdmin(sIdAcreditado, sIdEmisor, sCveEmisorNAFIN, sIdProveedor,
                        sTipoAcred, sTipoCheqra, sOpeChequera, sCveGpoCheq, sMovimientos, sOrden :String;
                        pAPli     : TInterApli;
                        pPreview  : Boolean);
Var
    QrChqraAdm  : TQrChqraAdm;
    Preview     : TIntQRPreview;
Begin
    QrChqraAdm:=TQrChqraAdm.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrChqraAdm);
    Try
        If (Trim(sCveGpoCheq) = '') Then
           Begin
           QrChqraAdm.qrGrpCVE_TIPO_ACRED.Enabled := True;
           QrChqraAdm.qrGrpCVE_TIPO_ACRED.Expression := 'CVE_TIPO_ACRED';
           QrChqraAdm.qrGrpFooterCVE_TIPO_ACRED.Enabled := True;
           End
        Else
           Begin
           QrChqraAdm.qrGrpCVE_TIPO_ACRED.Enabled := False;
           QrChqraAdm.qrGrpCVE_TIPO_ACRED.Expression := '';
           QrChqraAdm.qrGrpFooterCVE_TIPO_ACRED.Enabled := False;
           End; 

        If (Trim(sCveGpoCheq) <> '') Then
         Begin
         QrChqraAdm.qrGrpCVE_GPO_CHEQ.Enabled := True;
         QrChqraAdm.qrGrpCVE_GPO_CHEQ.Expression := 'CVE_GPO_CHEQ';
         QrChqraAdm.qrGrpFooterCVE_GPO_CHEQ.Enabled := True;
         End
        Else
         Begin
         QrChqraAdm.qrGrpCVE_GPO_CHEQ.Enabled := False;
         QrChqraAdm.qrGrpCVE_GPO_CHEQ.Expression := '';
         QrChqraAdm.qrGrpFooterCVE_GPO_CHEQ.Enabled := False;
         End;

        If (sTipoAcred = 'EM') Or (Trim(sIdEmisor) <> '') Then
         Begin
         QrChqraAdm.qrGrpNOMBRE.Enabled := True;
         QrChqraAdm.qrGrpNOMBRE.Expression := 'NOMBRE';
         QrChqraAdm.qrGrpFooterNOMBRE.Enabled := True;
         QrChqraAdm.qrdbtxtNOMBRE.DataField := 'NOMBRE_EMISOR';
         End
        Else
         Begin
         QrChqraAdm.qrGrpNOMBRE.Enabled := False;
         QrChqraAdm.qrGrpNOMBRE.Expression := '';
         QrChqraAdm.qrGrpFooterNOMBRE.Enabled := False;
         QrChqraAdm.qrdbtxtNOMBRE.DataField := 'NOMBRE';
         End;

        QrChqraAdm.qyChqraAdm.DatabaseName := pApli.DataBaseName;
        QrChqraAdm.qyChqraAdm.SessionName := pApli.SessionName;

        QrChqraAdm.qyChqraAdm.Active:=False;
        QrChqraAdm.qyChqraAdm.SQL.Text:= QrChqraAdm.FormaQuery(sIdAcreditado, sIdEmisor, sCveEmisorNAFIN, sIdProveedor,
                                                               sTipoAcred, sTipoCheqra, sOpeChequera, sCveGpoCheq, sMovimientos,
                                                               sOrden, pApli.Usuario, pApli.DameFechaEmpresa);

        QrChqraAdm.QRInterEncabezado1.Apli := pApli;
        QrChqraAdm.QRInterEncabezado1.Titulo1:='Reporte de Chequeras Administrativas';
        QrChqraAdm.QRInterEncabezado1.Titulo2:= FormatDateTime('"MÉXICO D.F. A " dd " DE " mmmm " DEL " yyyy',
                                                pAPli.DameFechaEmpresaDia('D000'));

//        QrChqraAdm.qyChqraAdm.sql.savetofile('C:\SQL.TXT');

        QrChqraAdm.qyChqraAdm.Active:=True;

        If QrChqraAdm.qyChqraAdm.IsEmpty Then
         ShowMessage('No hay datos que mostrar')
        Else
         Begin
            If pPreview Then
                QrChqraAdm.Preview
            Else
                QrChqraAdm.Print;
         End;

    Finally
        QrChqraAdm.free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrChqraAdm.FormaQuery(sIdAcreditado, sIdEmisor, sCveEmisorNAFIN, sIdProveedor,
                                sTipoAcred, sTipoCheqra, sOpeChequera, sCveGpoCheq, sMovimientos, sOrden :String;
                                sUsuario : String; FOperacion : TDateTime) : String;
Var sSQL, sSQLOrder : String;
    bOcupaGrupo : Boolean;
Begin
   bOcupaGrupo := (Trim(sCveGpoCheq) <> '');

   sSQL :=
          ' SELECT CTO.CVE_MONEDA,'+coCRLF+
          '        M.DESC_MONEDA,'+coCRLF;

          If Not bOcupaGrupo Then
           sSQL := sSQL + '        CCC.CVE_TIPO_ACRED,'+coCRLF+
                          '        DECODE(CCC.CVE_TIPO_ACRED,''PR'',''Proveedor'',''Acreditado'') AS DESC_TIPO_ACRED,'+coCRLF
          Else
           sSQL := sSQL + '        '' ''  AS CVE_TIPO_ACRED,'+coCRLF+
                          '        '' ''  AS DESC_TIPO_ACRED,'+coCRLF;

          sSQL := sSQL +
          '        DCTO.ID_CONTRATO              AS ID_CONTRATO,'+coCRLF+
          '        DECODE(P.CVE_PER_JURIDICA,''PF'','+coCRLF+
          '               PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO || '' '' || PF.NOMBRE_PERSONA,'+coCRLF+
          '               PM.NOM_RAZON_SOCIAL)   AS NOMBRE,'+coCRLF;

          If (sTipoAcred = 'EM') Or (Trim(sIdEmisor) <> '') Then
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//           sSQL := sSQL + '             CE.CVE_EMISOR_NAFIN, '+coCRLF+
           sSQL := sSQL + '             CE.CVE_EMISOR_EXT AS CVE_EMISOR_NAFIN, '+coCRLF+
{/ROIM}
                          '             CE.NOMBRE_EMISOR, '+coCRLF
          Else
           sSQL := sSQL + '             '' '' AS CVE_EMISOR_NAFIN, '+coCRLF+
                          '             '' '' AS NOMBRE_EMISOR, '+coCRLF;

         If (Trim(sCveGpoCheq) <> '') Then
          sSQL := sSQL + '        CAC.CVE_GPO_CHEQ, '+coCRLF+
                         '        CGC.DESC_GPO_CHEQ, '+coCRLF
         Else
          sSQL := sSQL + '        '' '' AS CVE_GPO_CHEQ, '+coCRLF+
                         '        '' '' AS DESC_GPO_CHEQ, '+coCRLF;

          sSQL := sSQL +
          '        SDO_EFE_REAL                  AS SALDO_INICIAL,'+coCRLF+
          '        (IMP_CAR_VIRT - IMP_CAR_REAL) AS CARGOS,'+coCRLF+
          '        (IMP_ABO_VIRT - IMP_ABO_REAL) - NVL(CT.SUM_IMP_NETO,0) AS ABONOS,'+coCRLF+
          '        NVL(CT.SUM_IMP_NETO,0)        AS INTERESES_DEV,'+coCRLF+
          '        SDO_EFE_VIRT                  AS SALDO_FINAL,'+coCRLF+
          '        (SDO_EFE_VIRT - SDO_EFE_REAL) AS DIFERENCIA'+coCRLF+
          ' FROM '+coCRLF;

        If (sTipoAcred = 'AC') Or (Trim(sIdAcreditado) <> '') Then
         sSQL := sSQL + '      CR_ACREDITADO CA, '+coCRLF;
        If (sTipoAcred = 'EM') Or (Trim(sIdEmisor) <> '') Then
         sSQL := sSQL + '      CR_EMISOR CE, '+coCRLF;
        If (sTipoAcred = 'PR') Or (Trim(sIdProveedor) <> '') Then
         sSQL := sSQL + '      CR_PROVEEDOR CP, '+coCRLF;
        If (Trim(sCveGpoCheq) <> '') Then
         sSQL := sSQL + '      CR_AGRUPA_CHEQ CAC, '+coCRLF+
                        '      CR_GPO_CHEQ CGC, '+coCRLF;

        sSQL := sSQL + '      CONTRATO CTO,'+coCRLF+
                       '      DV_CONTRATO DCTO,'+coCRLF;

        If Not bOcupaGrupo Then
        sSQL := sSQL + '      CR_CRED_CHEQ CCC,'+coCRLF;


        sSQL := sSQL + '      PERSONA P,'+coCRLF+
                       '      PERSONA_FISICA PF,'+coCRLF+
                       '      PERSONA_MORAL PM,'+coCRLF+
                       '      MONEDA M,'+coCRLF+
                       '      USUARIO U,'+coCRLF+
                       '      EMPLEADO E,'+coCRLF+
                       '      ('+coCRLF+
                       '          SELECT ID_CTO_LIQ, SUM(IMP_NETO) AS SUM_IMP_NETO'+coCRLF+
                       '          FROM CR_TRANSACCION'+coCRLF+
                       '          WHERE F_OPERACION = '+SQLFecha(FOperacion)+coCRLF+
                       '            AND CVE_OPERACION = (SELECT CVE_OPE_REM_INT FROM CR_PARAMETRO'+coCRLF+
                       '                                 WHERE CVE_PARAMETRO = ''CRE'')'+coCRLF+
                       '            AND SIT_TRANSACCION = ''AC'''+coCRLF+
                       '            AND ID_TRANS_CANCELA IS NULL ' + coCRLF + //LOLS
                       '          GROUP BY ID_CTO_LIQ'+coCRLF+
                       '      )  CT'+coCRLF+
                       ' WHERE 1=1'+coCRLF;

        // Filtros
        If (Trim(sIdAcreditado) <> '') Then
         sSQL := sSQL + '      AND CA.ID_ACREDITADO = '+sIdAcreditado+coCRLF;
        If (Trim(sIdEmisor) <> '') Then
         sSQL := sSQL + '      AND CE.ID_ACREDITADO = '+sIdEmisor+coCRLF+
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//                        '      AND CE.CVE_EMISOR_NAFIN = '+SQLSTR(sCveEmisorNAFIN)+coCRLF;
                        '      AND CE.CVE_EMISOR_EXT = '+SQLSTR(sCveEmisorNAFIN)+coCRLF;
{/ROIM}
        If (Trim(sIdProveedor) <> '') Then
         sSQL := sSQL + '      AND CP.ID_ACREDITADO = '+sIdProveedor+coCRLF;

        If (sTipoAcred = 'AC') Or (Trim(sIdAcreditado) <> '') Then
         sSQL := sSQL + '      AND CTO.ID_TITULAR = CA.ID_ACREDITADO '+coCRLF;

        If (sTipoAcred = 'EM') Or (Trim(sIdEmisor) <> '') Then
         Begin
         sSQL := sSQL + '      AND CTO.ID_TITULAR = CE.ID_ACREDITADO '+coCRLF;
         If Not bOcupaGrupo Then
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//            sSQL := sSQL + '      AND CCC.CVE_EMISOR_NAFIN = CE.CVE_EMISOR_NAFIN '+coCRLF;
            sSQL := sSQL + '      AND CCC.CVE_EMISOR_NAFIN = CE.CVE_EMISOR_EXT '+coCRLF;
{/ROIM}
         End;

        If ((sTipoAcred = 'AC') Or (sTipoAcred = 'EM')) And Not bOcupaGrupo Then
         sSQL := sSQL + '      AND CCC.CVE_TIPO_ACRED = ''AC'''+coCRLF;

        If (sTipoAcred = 'PR') Or (Trim(sIdProveedor) <> '') Then
         Begin
         sSQL := sSQL + '      AND CTO.ID_TITULAR = CP.ID_ACREDITADO '+coCRLF;
         If Not bOcupaGrupo Then
         sSQL := sSQL + '      AND CCC.CVE_TIPO_ACRED = ''PR'''+coCRLF;
         End;

         sSQL := sSQL + '      AND CTO.ID_CONTRATO = DCTO.ID_CONTRATO '+coCRLF+
                        '      AND CT.ID_CTO_LIQ (+)= DCTO.ID_CONTRATO '+coCRLF;

         If Not bOcupaGrupo Then               
           sSQL := sSQL + '      AND CCC.SIT_CHEQUERA (+)= ''AC'''+coCRLF+
                          '      AND CTO.ID_CONTRATO = CCC.CUENTA_BANCO (+)'+coCRLF+
                          '      AND CCC.ID_ACREDITADO (+)= CTO.ID_TITULAR '+coCRLF;

         sSQL := sSQL + '      AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
                        '      AND PF.ID_PERSONA (+)= P.ID_PERSONA'+coCRLF+
                        '      AND PM.ID_PERSONA (+)= P.ID_PERSONA'+coCRLF+
                        '      AND M.CVE_MONEDA = CTO.CVE_MONEDA'+coCRLF
                        ;


        If (Trim(sTipoCheqra) <> '') And Not bOcupaGrupo Then
         sSQL := sSQL +  '     AND CCC.B_PREDETERMINADA (+)= '+SQLSTR(sTipoCheqra)+coCRLF;

        If (Trim(sOpeChequera) <> '') And Not bOcupaGrupo Then
         sSQL := sSQL +  '     AND CCC.CVE_TIP_OPE_CHQ (+)= '+SQLSTR(sOpeChequera)+coCRLF;

        If (Trim(sCveGpoCheq) <> '') Then
         sSQL := sSQL +  '     AND CAC.CVE_GPO_CHEQ = '+SQLSTR(sCveGpoCheq)+coCRLF+
                         '     AND CTO.ID_CONTRATO = CAC.ID_CONTRATO '+coCRLF+
                         '     AND CGC.CVE_GPO_CHEQ = CAC.CVE_GPO_CHEQ'+coCRLF;
                         
         sSQL := sSQL +  '     AND U.CVE_USUARIO = '+SQLSTR(sUsuario)+coCRLF+
                         '     AND E.ID_PERSONA = U.ID_PERSONA '+coCRLF+
                         '     AND ( PKG_ACCECONTRATO.TIENEACCESO(U.CVE_USUARIO,CTO.ID_CONTRATO,1,'+coCRLF+
                         '                 CTO.ID_ENTIDAD,'+coCRLF+
                         '                 CTO.ID_EMPRESA,'+coCRLF+
                         '                 CTO.B_RESTRINGIDO,'+coCRLF+
                         '                 CTO.ID_PERS_ASOCIAD,'+coCRLF+
                         '                 CTO.CVE_SEGMENTO,'+coCRLF+
                         '                 CTO.ID_GRUPO,'+coCRLF+
                         '                 U.CVE_TIPO_USUARIO,'+coCRLF+
                         '                 U.B_EMPRESA,'+coCRLF+
                         '                 U.B_CONTRATO,'+coCRLF+
                         '                 U.B_UNID_NEG,'+coCRLF+
                         '                 U.B_USR_USR,'+coCRLF+
                         '                 U.ID_PERSONA,'+coCRLF+
                         '                 U.ID_EMPRESA,'+coCRLF+
                         '                 E.ID_EMPRESA,'+coCRLF+
                         '                 E.ID_ENTIDAD) = 1 )'+coCRLF;

         If (Trim(sMovimientos) = 'SM') Then
           sSQL := sSQL +  '     AND ((IMP_CAR_VIRT - IMP_CAR_REAL) = 0)'+coCRLF+
                           '     AND ((IMP_ABO_VIRT - IMP_ABO_REAL) - NVL(CT.SUM_IMP_NETO,0) = 0)'
         Else If (Trim(sMovimientos) = 'CM') Then
           sSQL := sSQL +  '     AND ( ((IMP_CAR_VIRT - IMP_CAR_REAL) <> 0) '+coCRLF+
                           '            OR ((IMP_ABO_VIRT - IMP_ABO_REAL) - NVL(CT.SUM_IMP_NETO,0) <> 0) )';

         If (sOrden = 'TA') Then
          sSQLOrder := ', CVE_TIPO_ACRED '
         Else If (sOrden = 'NC') Then
           sSQLOrder := ', DCTO.ID_CONTRATO ';

         Result:= sSQL + ' ORDER BY CTO.CVE_MONEDA '+sSQLOrder +', NOMBRE, NOMBRE_EMISOR';
{
   sSQL :=
          ' SELECT CTO.CVE_MONEDA,'+coCRLF+
          '        M.DESC_MONEDA,'+coCRLF;

          If bOcupaTablaCheq Then
           sSQL := sSQL + '        CCC.CVE_TIPO_ACRED,'+coCRLF+
                          '        DECODE(CCC.CVE_TIPO_ACRED,''PR'',''Proveedor'',''Acreditado'') AS DESC_TIPO_ACRED,'+coCRLF
          Else
           If (Trim(sTipoAcred) <> '') Then
             Begin
             If  (Trim(sTipoAcred) = 'EM') Then sTipoAcred := 'AC';
             sSQL := sSQL + '         '#39+sTipoAcred+#39' AS CVE_TIPO_ACRED,'+coCRLF+
                            '         DECODE('#39+sTipoAcred+#39',''PR'',''Proveedor'',''Acreditado'') AS DESC_TIPO_ACRED,'+coCRLF;
             End
           Else
             sSQL := sSQL + '         '' '' AS CVE_TIPO_ACRED,'+coCRLF+
                            '         '' '' AS DESC_TIPO_ACRED,'+coCRLF;

         If (Trim(sCveGpoCheq) <> '') Then
          sSQL := sSQL + '        CAC.CVE_GPO_CHEQ, '+coCRLF+
                         '        CGC.DESC_GPO_CHEQ, '+coCRLF
         Else
          sSQL := sSQL + '        '' '' AS CVE_GPO_CHEQ, '+coCRLF+
                         '        '' '' AS DESC_GPO_CHEQ, '+coCRLF;
                         
          sSQL := sSQL +
          '        DCTO.ID_CONTRATO              AS ID_CONTRATO,'+coCRLF+
          '        DECODE(P.CVE_PER_JURIDICA,''PF'','+coCRLF+
          '               PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO || '' '' || PF.NOMBRE_PERSONA,'+coCRLF+
          '               PM.NOM_RAZON_SOCIAL)   AS NOMBRE,'+coCRLF;

          If (sTipoAcred = 'EM') Or (Trim(sIdEmisor) <> '') Then
           sSQL := sSQL + '        CE.CVE_EMISOR_NAFIN, '+coCRLF+
                          '        CE.NOMBRE_EMISOR, '+coCRLF
          Else
           sSQL := sSQL + '  '' '' AS CVE_EMISOR_NAFIN, '+coCRLF+
                          '  '' '' AS NOMBRE_EMISOR, '+coCRLF;

          sSQL := sSQL +                
          '        SDO_EFE_REAL                  AS SALDO_INICIAL,'+coCRLF+
          '        (IMP_CAR_VIRT - IMP_CAR_REAL) AS CARGOS,'+coCRLF+
          '        (IMP_ABO_VIRT - IMP_ABO_REAL) - CT.SUM_IMP_NETO AS ABONOS,'+coCRLF+
          '        CT.SUM_IMP_NETO               AS INTERESES_DEV,'+coCRLF+
          '        SDO_EFE_VIRT                  AS SALDO_FINAL,'+coCRLF+
          '        (SDO_EFE_VIRT - SDO_EFE_REAL) AS DIFERENCIA'+coCRLF+
          ' FROM '+coCRLF;

        If (sTipoAcred = 'AC') Or (Trim(sIdAcreditado) <> '') Then
         sSQL := sSQL + '      CR_ACREDITADO CA, '+coCRLF;
        If (sTipoAcred = 'EM') Or (Trim(sIdEmisor) <> '') Then
         sSQL := sSQL + '      CR_EMISOR CE, '+coCRLF;
        If (sTipoAcred = 'PR') Or (Trim(sIdProveedor) <> '') Then
         sSQL := sSQL + '      CR_PROVEEDOR CP, '+coCRLF;
        If (Trim(sCveGpoCheq) <> '') Then
         sSQL := sSQL + '      CR_AGRUPA_CHEQ CAC, '+coCRLF+
                        '      CR_GPO_CHEQ CGC, '+coCRLF;

         sSQL := sSQL + '      CONTRATO CTO,'+coCRLF+
                        '      DV_CONTRATO DCTO,'+coCRLF;

        If bOcupaTablaCheq Then
         sSQL := sSQL + '      CR_CRED_CHEQ CCC,'+coCRLF;

         sSQL := sSQL + 
                       '      PERSONA P,'+coCRLF+
                       '      PERSONA_FISICA PF,'+coCRLF+
                       '      PERSONA_MORAL PM,'+coCRLF+
                       '      MONEDA M,'+coCRLF+
                       '      ('+coCRLF+
                       '          SELECT ID_CTO_LIQ, SUM(IMP_NETO) AS SUM_IMP_NETO'+coCRLF+
                       '          FROM CR_TRANSACCION'+coCRLF+
                       '          WHERE F_OPERACION = TO_DATE('#39+FormatDateTime('DD/MM/YYYY',FOperacion)+#39',''DD/MM/YYYY'')'+coCRLF+
                       '            AND CVE_OPERACION = (SELECT CVE_OPE_REM_INT FROM CR_PARAMETRO'+coCRLF+
                       '                                 WHERE CVE_PARAMETRO = ''CRE'')'+coCRLF+
                       '            AND SIT_TRANSACCION = ''AC'''+coCRLF+
                       '          GROUP BY ID_CTO_LIQ'+coCRLF+
                       '      )  CT'+coCRLF+
                       ' WHERE 1=1'+coCRLF;

        If (Trim(sIdAcreditado) <> '') Then
         sSQL := sSQL + '      AND CA.ID_ACREDITADO = '+sIdAcreditado+coCRLF;
        If (Trim(sIdEmisor) <> '') Then
         sSQL := sSQL + '      AND CE.ID_ACREDITADO = '+sIdEmisor+coCRLF+
                        '      AND CE.CVE_EMISOR_NAFIN = '#39+sCveEmisorNAFIN+#39+coCRLF;
        If (Trim(sIdProveedor) <> '') Then
         sSQL := sSQL + '      AND CP.ID_ACREDITADO = '+sIdProveedor+coCRLF;

        If (sTipoAcred = 'AC') Or (Trim(sIdAcreditado) <> '') Then
         sSQL := sSQL + '      AND CTO.ID_TITULAR = CA.ID_ACREDITADO '+coCRLF;

        If (sTipoAcred = 'EM') Or (Trim(sIdEmisor) <> '') Then
         Begin
         sSQL := sSQL + '      AND CTO.ID_TITULAR = CE.ID_ACREDITADO '+coCRLF;

         If bOcupaTablaCheq Then
         sSQL := sSQL + '      AND CCC.CVE_EMISOR_NAFIN = CE.CVE_EMISOR_NAFIN '+coCRLF+
                        '      AND CCC.CVE_TIPO_ACRED = ''AC'''+coCRLF;
         End;

        If (sTipoAcred = 'PR') Or (Trim(sIdProveedor) <> '') Then
         Begin
         sSQL := sSQL + '      AND CTO.ID_TITULAR = CP.ID_ACREDITADO '+coCRLF;
         If bOcupaTablaCheq Then
         sSQL := sSQL + '      AND CCC.CVE_TIPO_ACRED = ''PR'''+coCRLF;
         End;

         sSQL := sSQL + '      AND DCTO.ID_CONTRATO = CTO.ID_CONTRATO '+coCRLF+
                        '      AND CT.ID_CTO_LIQ (+)= DCTO.ID_CONTRATO '+coCRLF;

         If bOcupaTablaCheq Then
          sSQL := sSQL + '      AND CCC.ID_ACREDITADO = CTO.ID_TITULAR '+coCRLF+
                         '      AND CCC.SIT_CHEQUERA = ''AC'''+coCRLF+
                         '      AND CTO.ID_CONTRATO = CCC.CUENTA_BANCO';

         sSQL := sSQL + '      AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
                        '      AND PF.ID_PERSONA (+)= P.ID_PERSONA'+coCRLF+
                        '      AND PM.ID_PERSONA (+)= P.ID_PERSONA'+coCRLF+
                        '      AND M.CVE_MONEDA = CTO.CVE_MONEDA'+coCRLF;

        If (Trim(sTipoCheqra) <> '') Then
         sSQL := sSQL +  '     AND CCC.B_PREDETERMINADA = '#39+sTipoCheqra+#39+coCRLF;

        If (Trim(sOpeChequera) <> '') Then
         sSQL := sSQL +  '     AND CCC.CVE_TIP_OPE_CHQ = '#39+sOpeChequera+#39+coCRLF;

        If (Trim(sCveGpoCheq) <> '') Then
         sSQL := sSQL +  '     AND CAC.CVE_GPO_CHEQ = '#39+sCveGpoCheq+#39+coCRLF+
                         '     AND CTO.ID_CONTRATO = CAC.ID_CONTRATO '+coCRLF+
                         '     AND CGC.CVE_GPO_CHEQ =  CAC.CVE_GPO_CHEQ'+coCRLF;

         If (sOrden = 'TA') Then
          sSQLOrder := ', CVE_TIPO_ACRED '
         Else If (sOrden = 'NC') Then
           sSQLOrder := ', DCTO.ID_CONTRATO ';

         Result:= sSQL + ' ORDER BY CTO.CVE_MONEDA '+sSQLOrder +', NOMBRE, NOMBRE_EMISOR'; }
End;

End.
