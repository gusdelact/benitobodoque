Unit IntMQrSdoBlqDs;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport;
Type
  TQrSdoBlqDs = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qyRelBlqDs: TQuery;
    QRSHPTCredito: TQRShape;
    QRLabel9: TQRLabel;
    QRSHPTCliente: TQRShape;
    QRLabel17: TQRLabel;
    QRSHPTMonto: TQRShape;
    QRLabel18: TQRLabel;
    QRSHPTSaldoIsoluto: TQRShape;
    QRLabel20: TQRLabel;
    QRSHPTF_Inicio: TQRShape;
    QRSHPTPlazo: TQRShape;
    QRLabel24: TQRLabel;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText10: TQRDBText;
    QRSHPTChequera: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRFooterAcreditado: TQRBand;
    QRLabel23: TQRLabel;
    QRExpr25: TQRExpr;
    QRExpr27: TQRExpr;
    QRSHPLine: TQRShape;
    QRSHPTProveedor: TQRShape;
    QRLabel33: TQRLabel;
    QRDBText24: TQRDBText;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qrgrpFooterMoneda: TQRBand;
    QRLabel28: TQRLabel;
    qrgrpFooterTipoTrn: TQRBand;
    QRLabel36: TQRLabel;
    QRGroupContador: TQRGroup;
    QRGroupMoneda: TQRGroup;
    QRGroupTipoOper: TQRGroup;
    QROrigen: TQRGroup;
    QRLabel39: TQRLabel;
    QRShape1: TQRShape;
    QRSHPOrigen: TQRShape;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
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
    qyRelBlqDsCUENTA_BANCO: TStringField;
    qyRelBlqDsTX_NOTA: TStringField;
    qyRelBlqDsF_MOV: TDateTimeField;
    qyRelBlqDsF_PROG_DESBLQ: TDateTimeField;
    qyRelBlqDsCVE_USU_AUTORIZA: TStringField;
    qyRelBlqDsDESC_MONEDA: TStringField;
    qyRelBlqDsCVE_TIP_OPERACION: TStringField;
    qyRelBlqDsNOMBRE: TStringField;
    qyRelBlqDsTIP_TRN: TStringField;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel1: TQRLabel;
    qyRelBlqDsIMP_A_BLOQUEAR: TFloatField;
    qyRelBlqDsIMP_VTO: TFloatField;
    qyRelBlqDsIMP_DIFERENCIA: TFloatField;
    qyRelBlqDsID_CREDITO: TFloatField;
    qyRelBlqDsID_ACREDITADO: TFloatField;
    qyRelBlqDsNUM_PERIODO: TFloatField;
    qyRelBlqDsDIA_RECEP_APORT: TFloatField;
    qyRelBlqDsCVE_MONEDA: TFloatField;
    QRShape4: TQRShape;
    qyRelBlqDsF_DESBLOQUEO: TDateTimeField;

  Private
  Public
    Function FormaQuery(sF_Inicio, sF_Fin, sMoneda, sAcreditado, sCtaBco,
                        sDisp, sProducto,  sFecha, sOper, sEmpresa, sSucursal: String ): String;
  end;
Var
  QrSdoBlqDs: TQrSdoBlqDs;
  Apli : TInterApli;

Procedure RepRelBlqDesBlqs( sF_Inicio, sF_Fin, sMoneda, sAcreditado, sCtaBco,
                            sDisp, sProducto,  sFecha, sOper, sEmpresa, sSucursal: String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepRelBlqDesBlqs( sF_Inicio, sF_Fin, sMoneda, sAcreditado, sCtaBco,
                            sDisp, sProducto,  sFecha, sOper, sEmpresa, sSucursal: String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Var
   QrSdoBlqDs: TQrSdoBlqDs;
   Preview     : TIntQRPreview;
Begin
   QrSdoBlqDs:=TQrSdoBlqDs.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrSdoBlqDs);
   Try

      Apli := pApli;
      QrSdoBlqDs.QRInterEncabezado1.Apli:=pApli;
      QrSdoBlqDs.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrSdoBlqDs.QRInterEncabezado1.NomReporte:='IntMQrSdoBlqDs';
      QrSdoBlqDs.QRInterEncabezado1.Titulo1:='Relación de Saldos Bloqueados / Desbloqueados';
      QrSdoBlqDs.QRInterEncabezado1.Titulo2:='Periodo del '+  sF_Inicio + ' al ' + sF_Fin;

      QrSdoBlqDs.qyRelBlqDs.DatabaseName := pApli.DataBaseName;
      QrSdoBlqDs.qyRelBlqDs.SessionName := pApli.SessionName;

      QrSdoBlqDs.qyRelBlqDs.Active:=False;
      QrSdoBlqDs.qyRelBlqDs.SQL.Text:= QrSdoBlqDs.FormaQuery(sF_Inicio, sF_Fin, sMoneda, sAcreditado, sCtaBco,
                            sDisp, sProducto,  sFecha, sOper, sEmpresa, sSucursal);
      QrSdoBlqDs.qyRelBlqDs.SQL.SaveToFile('c:\Deslblq.txt');
      QrSdoBlqDs.qyRelBlqDs.Active:=True;

      If pPreview Then
         QrSdoBlqDs.Preview
      Else
         QrSdoBlqDs.Print;
   Finally
      QrSdoBlqDs.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrSdoBlqDs.FormaQuery(sF_Inicio, sF_Fin, sMoneda, sAcreditado, sCtaBco,
                            sDisp, sProducto,  sFecha, sOper, sEmpresa, sSucursal :String ):String;
Var
    sSQL:String;
Begin
    sSQL:=  ' SELECT ' +
            '        DATOS.*, DECODE(CVE_TIP_OPERACION, ''BL'',NVL(IMP_VTO - IMP_A_BLOQUEAR,0),' +
            '        ''DB'',NVL(IMP_A_BLOQUEAR-IMP_VTO,0),0)AS IMP_DIFERENCIA' +
            ' FROM (' +
            '       SELECT CB.CUENTA_BANCO, CB.TX_NOTA, CB.F_OPERACION F_MOV, CB.IMP_A_BLOQUEAR,' +
            '              CB.F_PROG_DESBLQ,' +
            '              DECODE(CVE_TIP_OPERACION, ''BL'',(SELECT F_AUTORIZACION FROM CR_BLQ_RECEP' +
            '                                                WHERE ID_TRN_BLOQUEO = CB.ID_TRN_DESLBLQ),' +
            '                                        ''DL'',NULL )AS F_DESBLOQUEO,' +
            '              CB.ID_CREDITO, CB.NUM_PERIODO,' +
            '              NVL(PKGCRSALDOS.ObtImporteVto(CB.ID_CREDITO,3),0) AS IMP_VTO,' +
            '              CB.CVE_USU_AUTORIZA, CTO.CVE_MONEDA, MON.DESC_MONEDA,' +
            '             CB.CVE_TIP_OPERACION, CCH.ID_ACREDITADO, TIT.NOMBRE,' +
            '              DECODE(CVE_TIP_OPERACION, ''BL'',''BLOQUEO'',''DB'',''DESBLOQUEO'','''')AS TIP_TRN,' +
            '              RCCH.DIA_RECEP_APORT' +
            '       FROM ( SELECT * FROM CR_BLQ_RECEP' +
            '              WHERE SIT_BLQ_RECEP =''AU''' +
            '            )CB,' +
            '            (SELECT * FROM CR_CREDITO CC' +
            '             WHERE CC.F_AUTORIZA   <= ' + SQLFecha( StrToDateTime(sF_Fin) )+
            '             AND (CC.F_LIQUIDACION >= ' + SQLFecha( StrToDateTime(sF_Fin) )+
            '             OR CC.F_LIQUIDACION IS NULL)' +
            '            ) CC, CR_CONTRATO CCTO,' +
            '            CONTRATO CTO, MONEDA MON , CR_CRED_CHEQ CCH, PERSONA TIT,' +
            '            CR_REL_CRED_CHEQ RCCH   ' +
            '       WHERE CB.F_OPERACION BETWEEN ' + SQLFecha( StrToDateTime(sF_Inicio) ) + ' AND ' + SQLFecha( StrToDateTime(sF_Fin) )+
            '         AND CB.ID_CREDITO       = CC.ID_CREDITO  ' +
            '         AND CCTO.ID_CONTRATO    = CC.ID_CONTRATO ' +
            '         AND CCTO.FOL_CONTRATO   = CC.FOL_CONTRATO' +
            '         AND CTO.ID_CONTRATO     = CC.ID_CONTRATO ' +
            '         AND MON.CVE_MONEDA      = CTO.CVE_MONEDA ' +
            '         AND CCH.ID_CREDITO      = CB.ID_CREDITO  ' +
            '         AND CCH.CUENTA_BANCO    = CB.CUENTA_BANCO' +
            '         AND TIT.ID_PERSONA      = CCH.ID_ACREDITADO ' +
            '         AND RCCH.ID_CREDITO     = CCH.ID_CREDITO    ' +
            '         AND RCCH.ID_BANCO_CHQRA = CCH.ID_BANCO_CHQRA' +
            '         AND RCCH.CUENTA_BANCO   = CCH.CUENTA_BANCO  ';

   If (Trim(sMoneda)<>'') Then
      sSQL:= sSQL + ' AND CTO.CVE_MONEDA = '+ sMoneda ;
   If (Trim(sAcreditado)<>'') Then
      sSQL:= sSQL + ' AND CCH.ID_ACREDITADO = '+ sAcreditado ;
   If (Trim(sCtaBco)<>'') Then
      sSQL:= sSQL + ' AND CCH.CUENTA_BANCO = '+ sCtaBco ;
   If (Trim(sDisp)<>'') Then
      sSQL:= sSQL + ' AND CB.ID_CREDITO = '+ sDisp ;
   If (Trim(sProducto)<>'') Then
      sSQL:= sSQL + ' AND CCTO.CVE_PRODUCTO_CRE ='+ sProducto;
   If (Trim(sFecha)<>'') Then
      sSQL:= sSQL + ' AND CB.F_OPERACION = '+ SQLFecha( StrToDateTime( sFecha ));
   If (Trim(sEmpresa)<>'') Then
      sSQL:= sSQL + ' AND CTO.ID_EMPRESA = '+ sEmpresa ;
   If (Trim(sOper)<>'') Then
      sSQL:= sSQL + ' AND CB.CVE_TIP_OPERACION =  '+ SQLStr( sOper ) ;

   sSQL:= sSQL + ' )DATOS ORDER BY DESC_MONEDA, TIP_TRN, NOMBRE, F_MOV, CUENTA_BANCO';

   Result:= sSQL;
End;

End.
