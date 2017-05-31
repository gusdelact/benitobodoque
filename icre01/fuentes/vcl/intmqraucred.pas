unit IntMQrAuCred;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre, UnSQL2;

type
  TQrAuCred = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PFooterProducto: TQRBand;
    QRGroupProducto: TQRGroup;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qyRelAutCred: TQuery;
    QRGroupMoneda: TQRGroup;
    QRGroupPromotor: TQRGroup;
    QRBandPromotor: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr6: TQRExpr;
    QRBandMoneda: TQRBand;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText27: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr30: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRShape3: TQRShape;
    QRLabel15: TQRLabel;
    QRShape4: TQRShape;
    QRLabel17: TQRLabel;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRShape8: TQRShape;
    QRLabel24: TQRLabel;
    QRShape9: TQRShape;
    QRLabel25: TQRLabel;
    QRShape12: TQRShape;
    QRLabel29: TQRLabel;
    QRShape13: TQRShape;
    QRLabel30: TQRLabel;
    QRShape14: TQRShape;
    QRLabel31: TQRLabel;
    QRShape19: TQRShape;
    QRLabel36: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText25: TQRDBText;
    QRShape6: TQRShape;
    QRDBText17: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRShape7: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRShape10: TQRShape;
    QRLabel26: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText9: TQRDBText;
    lbTIPO_CAMBIO: TQRLabel;
    qrlTCambio: TQRLabel;
    QRExpr12: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    qyRelAutCredCVE_PRODUCTO_CRE: TStringField;
    qyRelAutCredDESC_L_PRODUCTO: TStringField;
    qyRelAutCredCVE_MONEDA: TFloatField;
    qyRelAutCredDESC_MONEDA: TStringField;
    qyRelAutCredID_PERS_ASOCIAD: TFloatField;
    qyRelAutCredNOM_PROMOTOR: TStringField;
    qyRelAutCredID_CONTRATO: TFloatField;
    qyRelAutCredNOMBRE: TStringField;
    qyRelAutCredTIPO_AUTORIZACION: TStringField;
    qyRelAutCredIMP_AUTORIZADO: TFloatField;
    qyRelAutCredIMP_AUTORIZADO_MN: TFloatField;
    qyRelAutCredIMP_DISPUESTO: TFloatField;
    qyRelAutCredIMP_DISPUESTO_MN: TFloatField;
    qyRelAutCredIMP_POR_DISP: TFloatField;
    qyRelAutCredIMP_POR_DISP_MN: TFloatField;
    qyRelAutCredREV: TStringField;
    qyRelAutCredDIAS_PLAZO: TFloatField;
    qyRelAutCredSIT_LINEA: TStringField;
    qyRelAutCredF_AUT_COMITE: TDateTimeField;
    qyRelAutCredF_VENCIMIENTO: TDateTimeField;
    QRShape11: TQRShape;
    QRLabel2: TQRLabel;
    QRShape15: TQRShape;
    QRLabel3: TQRLabel;
    QRShape16: TQRShape;
    QRLabel4: TQRLabel;
    QRShape17: TQRShape;
    QRLabel6: TQRLabel;
    QRShape18: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr14: TQRExpr;
    qyRelAutCredF_INI_INCDEC: TDateTimeField;
    qyRelAutCredF_VENCTO_INCDEC: TDateTimeField;
    qyRelAutCredIMP_INC_DEC: TFloatField;
    qyRelAutCredIMP_INC_DEC_MN: TFloatField;
    qyRelAutCredIMP_TOT_AUT: TFloatField;
    qyRelAutCredIMP_TOT_AUT_MN: TFloatField;
    qyRelAutCredIMP_TOT_DIS: TFloatField;
    qyRelAutCredIMP_TOT_DIS_MN: TFloatField;
    procedure PFooterProductoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
    vgFechaMesAnt  : TDate;
    vgTCambioMesAnt: Double;
    Function FormaQuery(sF_AutIni,sF_AutFin,sF_VenIni,sF_VenFin,
                            sProducto,sMoneda,sAcreditado,sPromotor,
                            sAutorizacion,sSituacion, sEmpresa, sSucursal:String):String;
  end;

var
  QrAuCred: TQrAuCred;

Procedure RepRelDocEmiPro(  sF_AutIni,sF_AutFin,sF_VenIni,sF_VenFin,
                            sProducto,sMoneda,sAcreditado,sPromotor,
                            sAutorizacion,sSituacion, sEmpresa, sSucursal:String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepRelDocEmiPro(  sF_AutIni,sF_AutFin,sF_VenIni,sF_VenFin,
                            sProducto,sMoneda,sAcreditado,sPromotor,
                            sAutorizacion,sSituacion, sEmpresa, sSucursal:String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Var
    QrAuCred: TQrAuCred;
    Preview     : TIntQRPreview;
Begin
    QrAuCred:=TQrAuCred.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrAuCred);
    Try

        QrAuCred.QRInterEncabezado1.Apli:=pApli;
        QrAuCred.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrAuCred.QRInterEncabezado1.NomReporte:='IntMQrAuCred';
        QrAuCred.QRInterEncabezado1.Titulo1:='Reporte de Autorizaciones de Crédito';
        If (Trim(sF_AutIni)<>'')and(Trim(sF_AutFin)<>'') Then Begin
            QrAuCred.QRInterEncabezado1.Titulo2:='Fecha de Liquidación del '+
                                                 sF_AutIni+ ' al '+sF_AutFin;
        End Else If (Trim(sF_VenIni)<>'')and(Trim(sF_VenFin)<>'') Then Begin
            QrAuCred.QRInterEncabezado1.Titulo2:='Fecha de Compra del '+
                                                 sF_VenIni+ ' al '+sF_VenFin;
        End;

        QrAuCred.qyRelAutCred.DatabaseName := pApli.DataBaseName;
        QrAuCred.qyRelAutCred.SessionName := pApli.SessionName;
        {obtine el tipo de cambio del mes anterior}

        QrAuCred.vgFechaMesAnt := ObtFechaMesAnt( C_FMAN, pApli );
        QrAuCred.vgTCambioMesAnt := ObtTipoCambio( QrAuCred.vgFechaMesAnt,
                                                   IntToStr ( C_DLLS ) ,
                                                   pAPli.DataBaseName, pAPli.SessionName);
        {}
        QrAuCred.qyRelAutCred.Active:=False;
        QrAuCred.qyRelAutCred.SQL.Text:= QrAuCred.FormaQuery(sF_AutIni,sF_AutFin,sF_VenIni,sF_VenFin,
                            sProducto,sMoneda,sAcreditado,sPromotor,
                            sAutorizacion,sSituacion, sEmpresa, sSucursal);

        QrAuCred.qyRelAutCred.Active:=False;
        QrAuCred.qyRelAutCred.Active:=True;

        If pPreview Then
            QrAuCred.Preview
        Else
            QrAuCred.Print;
    Finally
        QrAuCred.free;
    End;
End;

Function TQrAuCred.FormaQuery(  sF_AutIni,sF_AutFin,sF_VenIni,sF_VenFin,
                            sProducto,sMoneda,sAcreditado,sPromotor,
                            sAutorizacion,sSituacion, sEmpresa, sSucursal:String):String;
Var
    sSQL:String;
Begin
   //EASA4011 20072005 OPTIMIZACION DEL QUERY
    sSQL:=  ' SELECT '+
            '           CCTO.ID_CONTRATO,                                        ' + coCRLF +
            '           P.NOMBRE, '+ coCRLF +
            '           CCTO.IMP_AUTORIZADO,                                     ' + coCRLF +
            '           ( CCTO.IMP_AUTORIZADO * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  ' + SQLFecha(vgFechaMesAnt)    +
                        ' , CTO.CVE_MONEDA, ''V''), 1 ))) IMP_AUTORIZADO_MN,     ' + coCRLF + //EASA4011 DLLS 28/04/2004
//            '           CCTO.IMP_DISPUESTO,                                      ' + coCRLF +
            '           PKGCRSALDOS.STPOBTDISPUESTOAUT(CCTO.ID_CONTRATO, CCTO.FOL_CONTRATO) IMP_DISPUESTO,' + coCRLF +
//            '           ( CCTO.IMP_DISPUESTO * ( NVL( PKGCORPO.OBTTIPOCAMBIO (   ' + SQLFecha(vgFechaMesAnt) +
            '           ( PKGCRSALDOS.STPOBTDISPUESTOAUT(CCTO.ID_CONTRATO, CCTO.FOL_CONTRATO) * ( NVL( PKGCORPO.OBTTIPOCAMBIO (   ' + SQLFecha(vgFechaMesAnt) +
                        ' , CTO.CVE_MONEDA, ''V''), 1 ))) IMP_DISPUESTO_MN,      ' + coCRLF + //EASA4011 DLLS 28/04/2004
//            '           ( CCTO.IMP_AUTORIZADO - CCTO.IMP_DISPUESTO) IMP_POR_DISP,' + coCRLF +
            '           PKGCRSALDOS.STPOBTDISPONIBLEAUT(CCTO.ID_CONTRATO, CCTO.FOL_CONTRATO) IMP_POR_DISP,' + coCRLF +
            '           ( CCTO.IMP_AUTORIZADO * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  ' + SQLFecha(vgFechaMesAnt) +
//                        ' , CTO.CVE_MONEDA, ''V''), 1 ))) - ( CCTO.IMP_DISPUESTO * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  ' + SQLFecha(vgFechaMesAnt) +
                        ' , CTO.CVE_MONEDA, ''V''), 1 ))) - ( PKGCRSALDOS.STPOBTDISPUESTOAUT(CCTO.ID_CONTRATO, CCTO.FOL_CONTRATO) * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  ' + SQLFecha(vgFechaMesAnt) +
                        ' , CTO.CVE_MONEDA, ''V''), 1 ))) IMP_POR_DISP_MN,       ' + coCRLF + //EASA4011 DLLS 28/04/2004
            '           DECODE(CCTO.B_EVENTUAL,''V'',''EVENTUAL'',''NO EVENTUAL'') TIPO_AUTORIZACION, '+ coCRLF +
            '           DECODE(CCTO.B_REVOLVENTE,''V'',''REVOLVENTE'',''NO REVOLVENTE'') REV, '+ coCRLF +
            '           CCTO.F_AUT_COMITE,      '+ coCRLF +
            '           CCTO.DIAS_PLAZO,        '+ coCRLF +
            '           CCTO.F_VENCIMIENTO,     '+ coCRLF +

            // <ICASE JMML 22/Septiembre/2006>   Nuevos campos

            '           CSE.ID_SOL_EXCESO, '+ coCRLF +
            '           CDA.CVE_TIPO_MOVTO, '+ coCRLF +
            '           DECODE(CDA.CVE_TIPO_MOVTO, ''I'', ''Incremento'', '+ coCRLF +
            '                                      ''D'', ''Decremento'', ''Avisar a Sistemas'') AS TIPO_MOVTO, '+ coCRLF +
            '           CSE.F_INI_EXCESO AS F_INI_INCDEC, '+ coCRLF +
            '           CSE.F_VTO_EXCESO AS F_VENCTO_INCDEC, '+ coCRLF +
            '           CSE.IMP_EXCESO_EVE  AS IMP_INC_DEC,     '+ coCRLF +
            '           ( CSE.IMP_EXCESO_EVE * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  ' + SQLFecha(vgFechaMesAnt)    +
                        ' , CTO.CVE_MONEDA, ''V''), 1 ))) AS IMP_INC_DEC_MN,     ' + coCRLF +
            '           (CCTO.IMP_AUTORIZADO + CSE.IMP_EXCESO_EVE) AS IMP_TOT_AUT,     '+ coCRLF +
            '           ( CCTO.IMP_AUTORIZADO * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  ' + SQLFecha(vgFechaMesAnt) +
                        ' , CTO.CVE_MONEDA, ''V''), 1 ))) + ( CSE.IMP_EXCESO_EVE * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  ' + SQLFecha(vgFechaMesAnt) +
                        ' , CTO.CVE_MONEDA, ''V''), 1 ))) AS IMP_TOT_AUT_MN,       ' + coCRLF +
            '           CCTO.IMP_AUTORIZADO + CSE.IMP_EXCESO_EVE - CCTO.IMP_DISPUESTO AS IMP_TOT_DIS,     '+ coCRLF +
            '           ( CCTO.IMP_AUTORIZADO * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  ' + SQLFecha(vgFechaMesAnt) +
                        ' , CTO.CVE_MONEDA, ''V''), 1 ))) + ( CSE.IMP_EXCESO_EVE * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  ' + SQLFecha(vgFechaMesAnt) +
                        ' , CTO.CVE_MONEDA, ''V''), 1 ))) - ( CCTO.IMP_DISPUESTO * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  ' + SQLFecha(vgFechaMesAnt) +
                        ' , CTO.CVE_MONEDA, ''V''), 1 ))) AS IMP_TOT_DIS_MN,       ' + coCRLF +
            '           DECODE(SIGN((CCTO.IMP_AUTORIZADO + CSE.IMP_EXCESO_EVE) - CCTO.IMP_DISPUESTO),-1,''SG'',CCTO.SIT_LINEA) AS SIT_LINEA,       '+ coCRLF +

            // </ICASE JMML 22/Septiembre/2006>   Nuevos campos

            '           CPR.DESC_L_PRODUCTO,    '+ coCRLF +
            '           M.DESC_MONEDA,          '+ coCRLF +
            '           PPR.NOMBRE NOM_PROMOTOR,'+ coCRLF +
            '           CTO.CVE_MONEDA,         '+ coCRLF +
            '           CPR.CVE_PRODUCTO_CRE,   '+ coCRLF +
            '           CTO.ID_PERS_ASOCIAD     '+ coCRLF +
            ' FROM '+ coCRLF +
            '           (SELECT * FROM CONTRATO) CTO,'+ coCRLF +
            '           (SELECT * FROM PERSONA) P, '+ coCRLF +
            '           CR_CONTRATO CCTO, '+ coCRLF +
            '           CR_PRODUCTO CPR, '+ coCRLF +
            '           (SELECT * FROM PERSONA) PPR, '+ coCRLF +
            '           MONEDA          M,   '+ coCRLF +
            '           CR_SOL_EXCESO_AC CSE,   '+ coCRLF + // </ICASE JMML 22/Septiembre/2006>
            '           CR_DET_EXCESO_AU CDA   '+ coCRLF +  // </ICASE JMML 22/Septiembre/2006>
            ' WHERE 1=1 ';

            If (Trim(sSituacion)= 'AU') Then
              sSQL:= sSQL + ' AND   pkgcrperiodo.stpverifctoac(CCTO.ID_CONTRATO,CCTO.FOL_CONTRATO) = '+ SQLStr(CVERDAD)
            else If (Trim(sSituacion)= 'IN') Then
              sSQL:= sSQL + ' AND   pkgcrperiodo.stpverifctoac(CCTO.ID_CONTRATO,CCTO.FOL_CONTRATO) = '+ SQLStr(CFALSO);

    sSQL:= sSQL +
            ' AND P.ID_PERSONA         = CTO.ID_TITULAR   '+ coCRLF +
            ' AND CCTO.ID_CONTRATO     = CTO.ID_CONTRATO  '+ coCRLF +
            ' AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE '+ coCRLF +
            ' AND PPR.ID_PERSONA       = CTO.ID_PERS_ASOCIAD ' + coCRLF +
            ' AND M.CVE_MONEDA         = CTO.CVE_MONEDA ' + coCRLF +

            // <ICASE JMML 22/Septiembre/2006>   Nuevas Tablas

            ' AND CDA.ID_CONTRATO (+) = CCTO.ID_CONTRATO ' + coCRLF +
            ' AND CDA.ID_SOL_EXCESO = CSE.ID_SOL_EXCESO (+) ' + coCRLF +
            ' AND CDA.ID_ACREDITADO = CSE.ID_ACREDITADO (+) ' + coCRLF;

            // </ICASE JMML 22/Septiembre/2006>   Nuevas Tablas

    If (Trim(sF_AutIni)<>'')And(Trim(sF_AutFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CCTO.F_AUT_COMITE BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_AutIni))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_AutFin))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_AutIni)<>'')And(Trim(sF_AutFin)='') Then Begin
        sSQL:= sSQL + ' AND CCTO.F_AUT_COMITE > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_AutIni))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_AutIni)='')And(Trim(sF_AutFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CCTO.F_AUT_COMITE < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_AutFin))+
        ''',''DD/MM/YYYY'')';
    End;

    If (Trim(sF_VenIni)<>'')And(Trim(sF_VenFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CCTO.F_VENCIMIENTO BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_VenIni))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_VenFin))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_VenIni)<>'')And(Trim(sF_VenFin)='') Then Begin
        sSQL:= sSQL + ' AND CCTO.F_VENCIMIENTO > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_VenIni))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_VenIni)='')And(Trim(sF_VenFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CCTO.F_VENCIMIENTO < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_VenFin))+
        ''',''DD/MM/YYYY'')';
    End;

    If (Trim(sProducto)<>'') Then
        sSQL:= sSQL + ' AND   CPR.CVE_PRODUCTO_CRE  ='''+sProducto+'''';
    If (Trim(sMoneda)<>'') Then
        sSQL:= sSQL + ' AND   CTO.CVE_MONEDA ='+sMoneda;
    If (Trim(sAcreditado)<>'') Then
        sSQL:= sSQL + ' AND CTO.ID_TITULAR  ='+ sAcreditado;
    If (Trim(sPromotor)<>'') Then
        sSQL:= sSQL + ' AND   CTO.ID_PERS_ASOCIAD ='+ sPromotor;
    If (Trim(sAutorizacion)<>'') Then
        sSQL:= sSQL + ' AND   CCTO.ID_CONTRATO ='+ sAutorizacion;

    If (Trim(sEmpresa)<>'') Then
        sSQL:= sSQL + ' AND   CPR.ID_EMPRESA ='+ sEmpresa;

    sSQL:= sSQL + ' ORDER BY CPR.DESC_L_PRODUCTO,M.DESC_MONEDA,NOM_PROMOTOR,CCTO.ID_CONTRATO,NOMBRE ';
    Result:= sSQL;
End;

procedure TQrAuCred.PFooterProductoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   lbTIPO_CAMBIO.Caption := FloatToStr(vgTCambioMesAnt);
end;

End.
