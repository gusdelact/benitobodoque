Unit IntMQrCreInscDeud;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport;
Type
  TQrCreInscDeud = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qyCreInscDeud: TQuery;
    QRSHPTCredito: TQRShape;
    QRLabel9: TQRLabel;
    QRSHPTCliente: TQRShape;
    QRLabel17: TQRLabel;
    QRSHPTMonto: TQRShape;
    QRLabel18: TQRLabel;
    QRSHPTSaldoIsoluto: TQRShape;
    QRLabel20: TQRLabel;
    QRSHPTF_Inicio: TQRShape;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText10: TQRDBText;
    QRSHPTChequera: TQRShape;
    QRLabel13: TQRLabel;
    QRFooterAcreditado: TQRBand;
    QRLabel23: TQRLabel;
    QRExpr27: TQRExpr;
    QRSHPTProveedor: TQRShape;
    QRLabel33: TQRLabel;
    QRDBText24: TQRDBText;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qrgrpFooterMoneda: TQRBand;
    QRLabel28: TQRLabel;
    QRGroupContador: TQRGroup;
    QRGroupMoneda: TQRGroup;
    QROrigen: TQRGroup;
    QRLabel39: TQRLabel;
    QRShape1: TQRShape;
    QRSHPOrigen: TQRShape;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRSHPMoneda: TQRShape;
    QRLabel46: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape2: TQRShape;
    QRLabel44: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel1: TQRLabel;
    qyCreInscDeudCVE_MONEDA: TFloatField;
    qyCreInscDeudDESC_MONEDA: TStringField;
    qyCreInscDeudID_TITULAR: TFloatField;
    qyCreInscDeudNOMBRE: TStringField;
    qyCreInscDeudID_CONTRATO: TFloatField;
    QRExpr1: TQRExpr;
    qyCreInscDeudIMP_AUTORIZADO: TFloatField;
    qyCreInscDeudF_ALTA: TDateTimeField;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    qyCreInscDeudF_AUT_COMITE: TDateTimeField;
    qyCreInscDeudF_VENCIMIENTO: TDateTimeField;
    qyCreInscDeudTPO_INSCR: TStringField;
    qyCreInscDeudNUM_INSCR_DEUDA: TStringField;
    qyCreInscDeudF_PROG_INSCR_D: TDateTimeField;
    qyCreInscDeudF_ALTA_INSCR_DEU: TDateTimeField;
    qyCreInscDeudDIAS_DIFER: TFloatField;

  Private
  Public
    Function FormaQuery(sMoneda, sTipoInscrDeud, sTitular, sContrato,
                        sFProgInsc, sFRealInsc,  sDiasDif, sEmpresa, sSucursal: String;
                        dFecha : TDateTime ): String;
  end;
Var
  QrCreInscDeud: TQrCreInscDeud;
  Apli : TInterApli;

Procedure RepCreInscDeud(sMoneda, sTipoInscrDeud, sTitular, sContrato,
                         sFProgInsc, sFRealInsc,  sDiasDif, sEmpresa, sSucursal: String;
                         dFecha : TDateTime;
                         pAPli     : TInterApli;
                         pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepCreInscDeud(sMoneda, sTipoInscrDeud, sTitular, sContrato,
                         sFProgInsc, sFRealInsc,  sDiasDif, sEmpresa, sSucursal: String;
                         dFecha : TDateTime;
                         pAPli     : TInterApli;
                         pPreview  : Boolean);
Var
   QrCreInscDeud: TQrCreInscDeud;
   Preview     : TIntQRPreview;
Begin
   QrCreInscDeud:=TQrCreInscDeud.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrCreInscDeud);
   Try

      Apli := pApli;
      QrCreInscDeud.QRInterEncabezado1.Apli:=pApli;
      QrCreInscDeud.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrCreInscDeud.QRInterEncabezado1.NomReporte:='IntMQrCreInscDeud';
      QrCreInscDeud.QRInterEncabezado1.Titulo1:='Créditos con Incripción de Deuda';
      QrCreInscDeud.QRInterEncabezado1.Titulo2:='Al día ' + DateToStr(dFecha);

      QrCreInscDeud.qyCreInscDeud.DatabaseName := pApli.DataBaseName;
      QrCreInscDeud.qyCreInscDeud.SessionName := pApli.SessionName;

      QrCreInscDeud.qyCreInscDeud.Active:=False;
      QrCreInscDeud.qyCreInscDeud.SQL.Text:= QrCreInscDeud.FormaQuery(sMoneda, sTipoInscrDeud, sTitular, sContrato,
                                                        sFProgInsc, sFRealInsc,  sDiasDif, sEmpresa, sSucursal,dFecha);
      QrCreInscDeud.qyCreInscDeud.SQL.SaveToFile('C:\Inscripcion.txt');
      QrCreInscDeud.qyCreInscDeud.Active:=True;

      If pPreview Then
         QrCreInscDeud.Preview
      Else
         QrCreInscDeud.Print;
   Finally
      QrCreInscDeud.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrCreInscDeud.FormaQuery(sMoneda, sTipoInscrDeud, sTitular, sContrato,
                                   sFProgInsc, sFRealInsc,  sDiasDif, sEmpresa, sSucursal: String;
                                   dFecha : TDateTime ): String;
Var
    sSQL:String;
Begin

    sSQL:= ' SELECT ' +
           '        CCTO.CVE_MONEDA, ' +
           '        MON.DESC_MONEDA, ' +
           '        CTO.ID_TITULAR, ' +
           '        TIT.NOMBRE, ' +
           '        DECODE(CCTO.CVE_MONEDA, ''840'', CCTO.IMP_AUTORIZADO * CPAR.TC_CONT_USD, ' +
           '        ''800'',CCTO.IMP_AUTORIZADO * TC_CONT_UDI, CCTO.IMP_AUTORIZADO) MONTO_AUT, ' +
           '        CCTO.ID_CONTRATO, ' +
           '        CCTO.IMP_AUTORIZADO, ' +
           '        CCTO.F_ALTA, ' +
           '        CCTO.F_AUT_COMITE, ' +
           '        CCTO.F_VENCIMIENTO, ' +
           '        CCTO.CVE_TIP_INSCR_D, ' +
           '        CGC.VALOR TPO_INSCR, ' +
           '        CCTO.NUM_INSCR_DEUDA, ' +
           '        CCTO.F_PROG_INSCR_D, ' +
           '        CCTO.F_ALTA_INSCR_DEU, ' +
           '        (CCTO.F_PROG_INSCR_D - CCTO.F_ALTA_INSCR_DEU) DIAS_DIFER ' +
           ' FROM (SELECT * FROM CR_CONTRATO ' +
           '       WHERE B_APL_INSCR_DEUD = ''V'' ' +
           '         AND F_ALTA_INSCR_DEU <= ' + SQLFecha(dFecha) + ') CCTO, ' +
           '      CONTRATO CTO, ' +
           '      PERSONA TIT, ' +
           '      CRE_PARAMETRO CPAR, ' +
           '      MONEDA MON ,(SELECT * FROM CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE = ''TIPDEU'' ) CGC' +
           ' WHERE ' +
           '       CCTO.ID_CONTRATO = CTO.ID_CONTRATO ' +
           '   AND TIT.ID_PERSONA = CTO.ID_TITULAR ' +
           '   AND CTO.CVE_TIP_CONTRATO = CPAR.CVE_TIP_CONTRATO ' +
           '   AND CCTO.CVE_MONEDA = MON.CVE_MONEDA '+
           '   AND SUBSTR(CCTO.CVE_TIP_INSCR_D,1,2) = CGC.CVE_REFERENCIA ';

        If (Trim(sMoneda)<>'') Then
           sSQL:= sSQL + '   AND CCTO.CVE_MONEDA = ' + sMoneda ;
        If (Trim(sDiasDif)<>'') Then
           sSQL:= sSQL + '   AND NVL((CCTO.F_PROG_INSCR_D - CCTO.F_ALTA_INSCR_DEU),-1) = ' + sDiasDif ;
        If (Trim(sFRealInsc)<>'') Then
           sSQL:= sSQL + '   AND NVL(CCTO.F_ALTA_INSCR_DEU,SYSDATE) = ' + SQLFecha(StrToDateTime(sFRealInsc));
        If (Trim(sFProgInsc)<>'') Then
           sSQL:= sSQL + '   AND NVL(CCTO.F_PROG_INSCR_D,SYSDATE) = ' + SQLFecha(StrToDateTime(sFProgInsc));
        If (Trim(sContrato)<>'') Then
           sSQL:= sSQL + '   AND CCTO.ID_CONTRATO = ' + sContrato;
        If (Trim(sTitular)<>'') Then
           sSQL:= sSQL + '   AND CTO.ID_TITULAR = ' + sTitular;
        If (Trim(sTipoInscrDeud)<>'') Then
           sSQL:= sSQL + '   AND NVL(CCTO.CVE_TIP_INSCR_D,NULL) = ' + SQLStr(sTipoInscrDeud);
        If (Trim(sEmpresa)<>'') Then
           sSQL:= sSQL + '   AND CTO.ID_EMPRESA = ' + sEmpresa ;

   Result:= sSQL;
End;

End.
