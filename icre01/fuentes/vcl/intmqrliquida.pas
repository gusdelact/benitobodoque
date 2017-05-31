Unit IntMQrLiquida;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre, UnSQL2;
Type
  TQrLiquida = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qrshpCredito: TQRShape;
    qrlblCredito: TQRLabel;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyLiquida: TQuery;
    QRBand1: TQRBand;
    qrGrpFooterCVE_MEDIO: TQRBand;
    qrGrpFooterACREDITADO: TQRBand;
    qrGrpFooterCVE_MEDIOL: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr11: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel2: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel3: TQRLabel;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel11: TQRLabel;
    qrgrpFooterID_GRUPO_LIQ: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel13: TQRLabel;
    qrshpFoliodelMovimiento: TQRShape;
    qrlblFoliodelMovimiento: TQRLabel;
    qrshpBeneficiario: TQRShape;
    qrlblBeneficiario: TQRLabel;
    qrlblImporte: TQRLabel;
    qrshpImporte: TQRShape;
    qrshpCuenta: TQRShape;
    qrlblCuenta: TQRLabel;
    qrlblBanco: TQRLabel;
    qrshpBanco: TQRShape;
    qrshpFOperacion: TQRShape;
    qrlblFOperacion: TQRLabel;
    qrshpFCaptura: TQRShape;
    qrlblFCaptura: TQRLabel;
    qrshpUsuarioCaptura: TQRShape;
    qrlblUsuarioCaptura: TQRLabel;
    qrshpSituacion: TQRShape;
    qrlSituacion: TQRLabel;
    qrdbtxtID_CREDITO: TQRDBText;
    qrdbtxtIMP_MOVTO: TQRDBText;
    qrdbtxtFOL_MOVTO: TQRDBText;
    qrdbNOMBRE_BENEFICIA: TQRDBText;
    qrdbtxtCUENTA_BANCO: TQRDBText;
    qrdbtxtNOMBRE: TQRDBText;
    qrdbtxtF_OPERACION: TQRDBText;
    qrdbtxtFH_CAPTURA: TQRDBText;
    qrdbtxtCVE_USU_ALTA: TQRDBText;
    qrdbtxtSIT_LIQ_RECEP: TQRDBText;
    QRExpr29: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    qrshHORA_CAPTURA: TQRShape;
    qrlblHORA_CAPTURA: TQRLabel;
    qrdbtxtHORA_CAPTURA: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qyLiquidaCVE_LIQUIDACION: TStringField;
    qyLiquidaDESC_LIQUIDACION: TStringField;
    qyLiquidaFOL_MOVTO: TFloatField;
    qyLiquidaID_CREDITO: TFloatField;
    qyLiquidaID_PROVEEDOR: TFloatField;
    qyLiquidaNOMBRE_PROVEEDOR: TStringField;
    qyLiquidaREF_EXTERNA: TStringField;
    qyLiquidaNOMBRE_BENEFICIA: TStringField;
    qyLiquidaID_TITULAR: TFloatField;
    qyLiquidaNOMBRE_TITULAR: TStringField;
    qyLiquidaCVE_MEDIO: TStringField;
    qyLiquidaDESC_MEDIO: TStringField;
    qyLiquidaID_GRUPO_LIQ: TFloatField;
    qyLiquidaIMP_MOVTO: TFloatField;
    qyLiquidaID_PLAZA: TStringField;
    qyLiquidaID_PZA_BANXICO: TFloatField;
    qyLiquidaCUENTA_BANCO: TStringField;
    qyLiquidaNOMBRE: TStringField;
    qyLiquidaF_OPERACION: TDateTimeField;
    qyLiquidaFH_CAPTURA: TDateTimeField;
    qyLiquidaSIT_LIQ_RECEP: TStringField;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRShape4: TQRShape;
    QRLabel9: TQRLabel;
    qyLiquidaID_CTO_LIQ: TFloatField;
    qyLiquidaCVE_SUC_BANCO: TStringField;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape5: TQRShape;
    QRLabel15: TQRLabel;
    QRDBText5: TQRDBText;
    qyLiquidaSIT_EXT: TStringField;
    qyLiquidaCVE_USU_AUTORIZA: TStringField;
    qyLiquidaH_AUTORIZACION: TStringField;
    QRGrpBENEF: TQRGroup;
    qrGpoFooterMONEDA: TQRBand;
    QRLabel17: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel18: TQRLabel;
    QRExpr6: TQRExpr;
    qyLiquidaDESC_MONEDA: TStringField;
    qyLiquidaCVE_MONEDA: TFloatField;
    QRFootContador: TQRBand;
    QRLabel26: TQRLabel;
    QRExpr28: TQRExpr;
    lbTIPO_CAMBIO: TQRLabel;
    QRLabel38: TQRLabel;
    qyLiquidaIMP_MOVTO_MN: TFloatField;
    QRExpr10: TQRExpr;
    QRGrpAGRUPACION: TQRGroup;
    qrgrpCONTADOR: TQRGroup;
    qrGrpMONEDA: TQRGroup;
    qrgrpMEDIO_LIQ: TQRGroup;
    qrgrpMEDIO_ORIGEN: TQRGroup;
    qrlblAcreditado: TQRLabel;
    qrdbtxtID_TITULAR: TQRDBText;
    qrdbdtxtNOMBRE: TQRDBText;
    QRLabel6: TQRLabel;
    qrdbtxtCVE_MEDIO: TQRDBText;
    qrdbtxtDESC_MEDIO: TQRDBText;
    qrshpCVE_MEDIO: TQRShape;
    QRShape6: TQRShape;
    QRLabel16: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape7: TQRShape;
    qrlblMediodeLiquidacion: TQRLabel;
    qrdbdtxtCVE_LIQUIDACION: TQRDBText;
    qrdbdtxtDESC_LIQUIDACION: TQRDBText;
    QRShape8: TQRShape;
    QRLabel14: TQRLabel;
    QRExpr9: TQRExpr;
    Procedure QRFootContadorBeforePrint(SEnder: TQRCustomBand;
      Var PrintBand: Boolean);
  Private
  Public
    vgFechaMesAnt  : TDate;
    vgTCambioMesAnt: Double;

    Function FormaQuery(strID_CREDITO, strCVE_MEDIO, strdACREDITADO, strID_PROVEEDOR,
                        strCVE_LIQUIDACION, strF_OPERACIONI, strF_OPERACIONF, sMoneda,
                        sEmpresa, sSucursal : String) : String;
  End;

Var
  QrLiquida: TQrLiquida;

Procedure RepLiquidaciones( strID_CREDITO, strCVE_MEDIO, strdACREDITADO,
                            strID_PROVEEDOR, strCVE_LIQUIDACION,
                            strF_OPERACIONI, strF_OPERACIONF, sMoneda,
                            sEmpresa, sSucursal : String;
                            pApli : TInterApli; pPreview : Boolean);

Implementation
{$R *.DFM}

Procedure RepLiquidaciones( strID_CREDITO, strCVE_MEDIO, strdACREDITADO,
                            strID_PROVEEDOR, strCVE_LIQUIDACION,
                            strF_OPERACIONI, strF_OPERACIONF, sMoneda,
                            sEmpresa, sSucursal : String;
                            pApli : TInterApli; pPreview : Boolean);
Var
   QrLiquida   : TQrLiquida;
   Preview     : TIntQRPreview;
Begin
   QrLiquida:=TQrLiquida.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrLiquida);
   If Assigned(QrLiquida) Then
      Try
         QrLiquida.QRInterEncabezado1.Apli:=pApli;
         QrLiquida.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
         QrLiquida.QRInterEncabezado1.NomReporte:='IntMQrLiquida';
         QrLiquida.QRInterEncabezado1.Titulo1:='Reporte de Liquidaciones';

         QrLiquida.qyLiquida.DatabaseName := pApli.DatabaseName;
         QrLiquida.qyLiquida.SessionName := pApli.SessionName;
         {obtine el tipo de cambio del mes anterior    EASA4011 04/05/2004}
         QrLiquida.vgFechaMesAnt := ObtFechaMesAnt( C_FMAN, pApli );
         QrLiquida.vgTCambioMesAnt := ObtTipoCambio( QrLiquida.vgFechaMesAnt,
                                                    IntToStr ( C_DLLS ) ,
                                                    pAPli.DataBaseName, pAPli.SessionName);
         QrLiquida.qyLiquida.Active:=False;
         QrLiquida.qyLiquida.SQL.Text:= QrLiquida.FormaQuery(strID_CREDITO, strCVE_MEDIO, strdACREDITADO,
                                                             strID_PROVEEDOR, strCVE_LIQUIDACION,
                                                             strF_OPERACIONI, strF_OPERACIONF, sMoneda,
                                                             sEmpresa, sSucursal);
         QrLiquida.qyLiquida.Active:=True;
         If pPreview Then
             QrLiquida.Preview
         Else
             QrLiquida.Print;
      Finally
         QrLiquida.free;
         If Assigned(Preview) Then Preview.Free;
      End;
End;

function TQrLiquida.FormaQuery(strID_CREDITO, strCVE_MEDIO, strdACREDITADO, strID_PROVEEDOR,
                               strCVE_LIQUIDACION, strF_OPERACIONI, strF_OPERACIONF, sMoneda,
                               sEmpresa, sSucursal : String) : String;
Var vlSQL : String;
Begin
   vlSQL :=
             ' SELECT CLD.CVE_LIQUIDACION, ' + coCRLF +
             '        CLD.DESC_LIQUIDACION,' + coCRLF +
             '        CLR.FOL_MOVTO,' + coCRLF +
             '        SUBSTR(PKGCRLIQUIDA.FUNDAMESITLIQEXT(NVL(CLMO.Fol_Movto_Liq,0), CLR.F_Operacion,CLR.Cve_Liquidacion),1,2) SIT_EXT,'+ coCRLF +
             '        CC.ID_CREDITO,' + coCRLF +
             '        NVL(CE.ID_PROVEEDOR, 0) AS ID_PROVEEDOR,             ' + coCRLF +
             '        DECODE(P.CVE_PER_JURIDICA, ''PF'', PR.NOMBRE ,' + coCRLF +
             '                                           PRM.NOM_RAZON_SOCIAL) AS NOMBRE_PROVEEDOR,'+ coCRLF +
             '        CLR.REF_EXTERNA,' + coCRLF +
             '        CLR.NOMBRE_BENEFICIA               ,' + coCRLF +
             '        CLR.ID_CONTRATANTE ID_TITULAR      ,' + coCRLF +
             '        CLR.NOMBRE_BENEFICIA NOMBRE_TITULAR,' + coCRLF +
             '        CLR.CVE_MEDIO   ,' + coCRLF +
             '        CLM.DESC_MEDIO  ,' + coCRLF +
             '        CLR.ID_GRUPO_LIQ,' + coCRLF +
             '        CLR.IMP_MOVTO   ,' + coCRLF +
             '        ( CLR.IMP_MOVTO * ( NVL( PKGCORPO.OBTTIPOCAMBIO ( ' + SQLFecha(vgFechaMesAnt) + //EASA4011 DLLS 04/05/2004
                                                  ' , CTO.CVE_MONEDA, ''V''), 1 ))) IMP_MOVTO_MN, ' + coCRLF +
             '        CHQ.PLAZA ID_PLAZA,        CHQ.BANXICO ID_PZA_BANXICO,    CHQ.SUC CVE_SUC_BANCO, ' + coCRLF +
             '        CLCR.CUENTA_BANCO,'+ coCRLF +
             '        CTR.ID_CTO_LIQ   ,'+ coCRLF +
             '        PP.NOMBRE      ,'+ coCRLF +
             '        CLR.F_OPERACION,'+ coCRLF +
             '        CLR.FH_CAPTURA ,'+ coCRLF +
             '        SUBSTR(PKGCRCOMUN.FormatoHora(CLR.H_AUTORIZACION),1,8) H_AUTORIZACION,' + coCRLF +
             '        CLR.CVE_USU_AUTORIZA,'+ coCRLF +
             '        CLR.SIT_LIQ_RECEP,   '+ coCRLF +
             '        CTO.CVE_MONEDA,      '+ coCRLF +
             '        M.DESC_MONEDA        '+ coCRLF +
             ' FROM ' +
             '      CR_LIQ_RECEP CLR,'+ coCRLF +
             '      CR_LIQ_CHE_RECEP CLCR,'+ coCRLF +
             '      CR_LIQUIDA_DISP  CLD ,'+ coCRLF +
             '      CR_CREDITO       CC  ,'+ coCRLF +
             '      CR_CESION        CE  ,'+ coCRLF +
             '      CONTRATO         CTO ,'+ coCRLF +
             '      PERSONA          P   ,'+ coCRLF +
             '      PERSONA_MORAL    PM  ,'+ coCRLF +
             '      CR_LIQ_MEDIO     CLM ,'+ coCRLF +
             '      CR_TRANSACCION   CTR ,'+ coCRLF +
             '      PERSONA          PP  ,'+ coCRLF +
             '      PERSONA          PR  ,'+ coCRLF +
             '      PERSONA_MORAL    PRM ,'+ coCRLF +
             '      MONEDA           M   ,'+ coCRLF +
             '      (   SELECT ID_PLAZA PLAZA,          CHCT.ID_PZA_BANXICO BANXICO,'+ coCRLF +
             '                 CHCT.CVE_SUC_BANCO SUC,  CHCT.CUENTA_BANCO          ,'+ coCRLF +
             '                 CHCT.ID_BANCO_CHQRA,     CHCT.ID_PERSONA             '+ coCRLF +
             '          FROM  CHEQUERA_CTE CHCT'+ coCRLF +
             '        UNION'+ coCRLF +
             '          SELECT CHD.PLAZA PLAZA,       0 BANXICO         ,'+ coCRLF +
             '                 CHD.ABA SUC,           CHD.CUENTA_BANCO  ,'+ coCRLF +
             '                 CHD.ID_BANCO_CHQRA,    CHD.ID_PERSONA     '+ coCRLF +
             '          FROM CR_CHQRA_DLLS CHD'+ coCRLF +
             '      ) CHQ, CR_CONTRATO CCTO, CR_PRODUCTO CPR, CR_LIQ_MOVTO CLMO '+ //SASB

             ' WHERE CLCR.CVE_MEDIO       = CLR.CVE_MEDIO  '+ coCRLF +
             '   AND CLCR.REF_EXTERNA     = CLR.REF_EXTERNA'+ coCRLF +
             '   AND CLCR.ID_CREDITO      = CLR.ID_CREDITO '+ coCRLF +
             '   AND CLD.CVE_LIQUIDACION  = CLR.CVE_LIQUIDACION'+ coCRLF +
             '   AND CC.ID_CREDITO        = CLR.ID_CREDITO '+ coCRLF +
             '   AND CE.ID_CESION(+)      = CC.ID_CREDITO  '+ coCRLF +
             '   AND CTO.ID_CONTRATO      = CC.ID_CONTRATO '+ coCRLF +
             '   AND P.ID_PERSONA         = CTO.ID_TITULAR '+ coCRLF +
             '   AND PM.ID_PERSONA(+)     = P.ID_PERSONA   '+ coCRLF +
             '   AND CLM.CVE_MEDIO        = CLR.CVE_MEDIO  '+ coCRLF +
             '   AND CHQ.ID_PERSONA       = CLR.ID_CONTRATANTE '+ coCRLF +
             '   AND CHQ.ID_BANCO_CHQRA   = CLCR.ID_BANCO_CHQRA'+ coCRLF +
             '   AND CHQ.CUENTA_BANCO     = CLCR.CUENTA_BANCO  '+ coCRLF +
             '   AND CTR.ID_GRUPO_TRANSAC = CC.ID_TRANSAC_DISP '+ coCRLF +
             '   AND CTR.CVE_OPERACION    IN (''DISPCS'',''DISPCR'',''DSCSDL'', ''DSCRDL'')' + coCRLF +
             '   AND PP.ID_PERSONA        = CLCR.ID_BANCO_CHQRA'+ coCRLF +
             '   AND PR.ID_PERSONA(+)     = CE.ID_PROVEEDOR'+ coCRLF +
             '   AND PRM.ID_PERSONA(+)    = CE.ID_PROVEEDOR'+ coCRLF +
             '   AND M.CVE_MONEDA         = CTO.CVE_MONEDA '+ coCRLF +
             '   AND CCTO.ID_CONTRATO     = CC.ID_CONTRATO'+ coCRLF + //SASB
             '   AND CCTO.FOL_CONTRATO    = CC.FOL_CONTRATO'+ coCRLF +
             '   AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE'+ coCRLF +
             '   AND CLMO.FOL_MOVTO(+)    = CLR.FOL_MOVTO'+ coCRLF +
             '   AND CLMO.ID_GRUPO_LIQ(+) = CLR.ID_GRUPO_LIQ'+ coCRLF;

            If (Trim(sEmpresa) <> '') Then //SASB 16112004
               vlSQL := vlSQL + ' AND CPR.ID_EMPRESA ='+ Trim(sEmpresa)+ coCRLF;

            If (Trim(strF_OPERACIONI) <> '') And (Trim(strF_OPERACIONF) <> '') Then Begin
               vlSQL := vlSQL + '   AND CLR.F_OPERACION BETWEEN ' + SQLFecha(StrToDate(strF_OPERACIONI)) +
                                                         ' AND ' + SQLFecha(StrToDate(strF_OPERACIONF)) + coCRLF;
            End;
            If Trim(strID_CREDITO) <> '' THEN
               vlSQL := vlSQL + '   AND           CC.ID_CREDITO = '+ strID_CREDITO + coCRLF;
             //End if
            If Trim(strCVE_MEDIO) <> '' THEN
               vlSQL := vlSQL + '   AND           CLM.CVE_MEDIO = '+ SQLStr( strCVE_MEDIO ) + coCRLF;
             //End if
            If Trim(strdACREDITADO) <> '' THEN
               vlSQL := vlSQL + '   AND          CTO.ID_TITULAR = '+ strdACREDITADO + coCRLF;
             //End if
            If Trim(strID_PROVEEDOR) <> '' THEN
               vlSQL := vlSQL + '   AND         CE.ID_PROVEEDOR = '+ strID_PROVEEDOR + coCRLF;
             //End if
            If Trim(strCVE_LIQUIDACION) <> '' THEN
               vlSQL := vlSQL + '   AND     CLD.CVE_LIQUIDACION = ' + SQLStr( strCVE_LIQUIDACION ) + coCRLF ;
             //End if
            If Trim(sMoneda) <> '' THEN
               vlSQL := vlSQL + '   AND          CTO.CVE_MONEDA = '+ sMoneda + coCRLF ;
             //End if

             vlSQL := vlSQL + ' ORDER BY CTO.CVE_MONEDA, CVE_LIQUIDACION ASC, CVE_MEDIO ASC, NOMBRE_TITULAR ASC, ID_GRUPO_LIQ DESC';
   Result := vlSQL;
End;

Procedure TQrLiquida.QRFootContadorBeforePrint(SEnder: TQRCustomBand;
  Var PrintBand: Boolean);
Begin
   lbTIPO_CAMBIO.Caption := FloatToStr(vgTCambioMesAnt);
End;

End.
