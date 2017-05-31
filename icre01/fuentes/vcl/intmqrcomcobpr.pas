Unit IntMQrComCobPr;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport;
Type
  TQrComCobPr = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qyComCobPr: TQuery;
    QRSHPTCredito: TQRShape;
    QRLabel9: TQRLabel;
    QRSHPTCliente: TQRShape;
    QRLabel17: TQRLabel;
    QRSHPTMonto: TQRShape;
    QRLabel18: TQRLabel;
    QRSHPTSaldoIsoluto: TQRShape;
    QRLabel20: TQRLabel;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText19: TQRDBText;
    QRSHPTChequera: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRFooterProducto: TQRBand;
    QRLabel23: TQRLabel;
    QRSHPTProveedor: TQRShape;
    QRLabel33: TQRLabel;
    QRDBText24: TQRDBText;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qrgrpFooterPromAdm: TQRBand;
    QRLabel28: TQRLabel;
    qrgrpFooterAcreditado: TQRBand;
    QRLabel36: TQRLabel;
    QRGroupContador: TQRGroup;
    QRGroupMoneda: TQRGroup;
    QRGroupTipoOper: TQRGroup;
    QROrigen: TQRGroup;
    QRSHPOrigen: TQRShape;
    QRDBText6: TQRDBText;
    QRSHPSector: TQRShape;
    QRLabel52: TQRLabel;
    QRDBText38: TQRDBText;
    QRSHPMoneda: TQRShape;
    QRLabel46: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape2: TQRShape;
    QRLabel44: TQRLabel;
    QRDBText30: TQRDBText;
    qyComCobPrF_AUTORIZA: TDateTimeField;
    qyComCobPrDESC_MONEDA: TStringField;
    qyComCobPrNOMBRE: TStringField;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
    QRExpr5: TQRExpr;
    qyComCobPrID_CREDITO: TFloatField;
    qyComCobPrCVE_MONEDA: TFloatField;
    QRGroup1: TQRGroup;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRGroup2: TQRGroup;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText11: TQRDBText;
    qyComCobPrID_TITULAR: TFloatField;
    qyComCobPrIMP_CREDITO: TFloatField;
    qyComCobPrCVE_COMISION: TStringField;
    qyComCobPrDESC_COMISION: TStringField;
    qyComCobPrIMP_COMISION: TFloatField;
    qyComCobPrIMP_IVA: TFloatField;
    qyComCobPrID_PERS_ASOCIAD: TFloatField;
    qyComCobPrNOM_PROM_ASOC: TStringField;
    qyComCobPrID_PROM_ADM: TFloatField;
    qyComCobPrNOM_PROM_ADM: TStringField;
    qyComCobPrCVE_PRODUCTO_CRE: TStringField;
    qyComCobPrDESC_L_PRODUCTO: TStringField;
    qyComCobPrCVE_PRODUCTO_GPO: TStringField;
    qyComCobPrSIT_COMISION: TStringField;
    qyComCobPrNUM_PERIODO: TFloatField;
    qyComCobPrTOT_COM: TFloatField;
    qyComCobPrID_EMPRESA: TFloatField;
    QRDBText10: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    qrgrpFooterMoneda: TQRBand;
    QRLabel1: TQRLabel;
    qrgrpFooterPromAsoc: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;

  Private
  Public
    Function FormaQuery(sMoneda, sPromAsoc,sPromAdm, sAcreditado, sDisp, sComision,
                       sGpoProd, sProducto, sEmpresa, sCortAsoc, sCortAdm, sCortMoneda : String;
                       dFInicio, dFFin, dFecha   : TDateTime ): String;
  end;
Var
  QrComCobPr: TQrComCobPr;
  Apli : TInterApli;

Procedure RepComCobPr( sMoneda, sPromAsoc,sPromAdm, sAcreditado, sDisp, sComision,
                       sGpoProd, sProducto, sEmpresa, sCortAsoc, sCortAdm, sCortMoneda : String;
                       dFInicio, dFFin, dFecha   : TDateTime;
                       pAPli    : TInterApli;
                       pPreview : Boolean);
Implementation
{$R *.DFM}

Procedure RepComCobPr( sMoneda, sPromAsoc,sPromAdm, sAcreditado, sDisp, sComision,
                       sGpoProd, sProducto, sEmpresa, sCortAsoc, sCortAdm, sCortMoneda : String;
                       dFInicio, dFFin, dFecha   : TDateTime;
                       pAPli    : TInterApli;
                       pPreview : Boolean);
Var
   QrComCobPr: TQrComCobPr;
   Preview     : TIntQRPreview;
Begin
   QrComCobPr:=TQrComCobPr.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrComCobPr);
   Try

      Apli := pApli;
      QrComCobPr.QRInterEncabezado1.Apli:=pApli;
      QrComCobPr.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrComCobPr.QRInterEncabezado1.NomReporte:='IntMQrComCobPr';
      QrComCobPr.QRInterEncabezado1.Titulo1:='Comisiones Cobradas por Promotor';
      QrComCobPr.QRInterEncabezado1.Titulo2:='Periodo del '+  DateToStr(dFInicio) + ' al ' + DateToStr(dFFin);

      QrComCobPr.qyComCobPr.DatabaseName := pApli.DataBaseName;
      QrComCobPr.qyComCobPr.SessionName := pApli.SessionName;

      QrComCobPr.qyComCobPr.Active:=False;
      QrComCobPr.qyComCobPr.SQL.Text:= QrComCobPr.FormaQuery(sMoneda, sPromAsoc,sPromAdm, sAcreditado, sDisp, sComision,
                                                       sGpoProd, sProducto, sEmpresa, sCortAsoc, sCortAdm, sCortMoneda,
                                                       dFInicio, dFFin, dFecha);
      QrComCobPr.qyComCobPr.Active:=True;

      If pPreview Then
         QrComCobPr.Preview
      Else
         QrComCobPr.Print;
   Finally
      QrComCobPr.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrComCobPr.FormaQuery(sMoneda, sPromAsoc,sPromAdm, sAcreditado, sDisp, sComision,
                       sGpoProd, sProducto, sEmpresa, sCortAsoc, sCortAdm, sCortMoneda : String;
                       dFInicio, dFFin, dFecha   : TDateTime ): String;
Var
    sSQL:String;
Begin
    sSQL:= ' SELECT ' +
           '        CTO.ID_TITULAR, TIT.NOMBRE, COM.ID_CREDITO, CC.F_AUTORIZA,' +
           '        CC.IMP_CREDITO, COM.CVE_COMISION, CCC.DESC_COMISION,' +
           '        COM.IMP_COMISION, COM.IMP_IVA,' +
           '        CCTO.CVE_MONEDA, MON.DESC_MONEDA,' +
           '        CTO.ID_PERS_ASOCIAD, PROMASC.NOMBRE NOM_PROM_ASOC,' +
           '        CC.ID_PROM_ADM, PROMADM.NOMBRE NOM_PROM_ADM,' +
           '        CCTO.CVE_PRODUCTO_CRE, CPR.DESC_L_PRODUCTO,' +
           '        CPR.CVE_PRODUCTO_GPO, COM.SIT_COMISION,' +
           '        COM.NUM_PERIODO, NUM_TOT_COM.TOT_COM,' +
           '        CTO.ID_EMPRESA' +

           '   FROM ADMIPROD.CR_CREDITO CC, ADMIPROD.CR_COMISION COM, ADMIPROD.CR_CONTRATO CCTO, ADMIPROD.CR_PRODUCTO CPR,' +
           '        ADMIPROD.CONTRATO CTO, ADMIPROD.PERSONA TIT, ADMIPROD.CR_CAT_COMISION CCC, ADMIPROD.MONEDA MON,' +
           '        ADMIPROD.PERSONA PROMASC, ADMIPROD.PERSONA PROMADM,' +
           '        (SELECT ID_CREDITO,COUNT(*) TOT_COM' +
           '           FROM  ADMIPROD.CR_COMISION COM' +
           '          GROUP BY ID_CREDITO' +
           '        )NUM_TOT_COM' +
           '  WHERE COM.ID_CREDITO     = CC.ID_CREDITO' +
           '    AND CCTO.ID_CONTRATO  = CC.ID_CONTRATO' +
           '    AND CCTO.FOL_CONTRATO = CC.FOL_CONTRATO' +
           '    AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE' +
           '    AND CTO.ID_CONTRATO   = CC.ID_CONTRATO' +
           '    AND TIT.ID_PERSONA      = CTO.ID_TITULAR' +
           '    AND CCC.CVE_COMISION  = COM.CVE_COMISION' +
           '    AND CCTO.CVE_MONEDA   = MON.CVE_MONEDA' +
           '    AND CTO.ID_PERS_ASOCIAD = PROMASC.ID_PERSONA' +
           '    AND CC.ID_PROM_ADM    = PROMADM.ID_PERSONA ' +
           '    AND COM.ID_CREDITO = NUM_TOT_COM.ID_CREDITO' +
           '    AND COM.F_ALTA BETWEEN ' + SQLFecha(dFInicio) + ' AND ' + SQLFecha(dFFin);

   If (Trim(sMoneda)<>'') Then
      sSQL:= sSQL + ' AND  CCTO.CVE_MONEDA = '+ sMoneda ;
   If (Trim(sProducto)<>'') Then
      sSQL:= sSQL + ' AND  CCTO.CVE_PRODUCTO_CRE = '+ SQLStr(sProducto);
   If (Trim(sPromAsoc)<>'') Then
      sSQL:= sSQL + ' AND  CTO.ID_PERS_ASOCIAD =  '+ sPromAsoc;
   If (Trim(sPromAdm)<>'') Then
      sSQL:= sSQL + ' AND  CC.ID_PROM_ADM  = '+ sPromAdm;
   If (Trim(sAcreditado)<>'') Then
      sSQL:= sSQL + ' AND  CTO.ID_TITULAR = '+ sAcreditado;
   If (Trim(sEmpresa)<>'') Then
      sSQL:= sSQL + ' AND  CTO.ID_EMPRESA  = '+ sEmpresa;

   Result:= sSQL;
End;

End.
