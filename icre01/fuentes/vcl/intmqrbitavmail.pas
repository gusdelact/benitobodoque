Unit IntMQrBitAvMail;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport;
Type
  TQrBitAvMail = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qyBitAvMail: TQuery;
    QRSHPTCredito: TQRShape;
    QRLabel9: TQRLabel;
    QRSHPTCliente: TQRShape;
    QRLabel17: TQRLabel;
    QRSHPTMonto: TQRShape;
    QRLabel18: TQRLabel;
    QRSHPTSaldoIsoluto: TQRShape;
    QRLabel20: TQRLabel;
    QRBand1: TQRBand;
    QRSHPTChequera: TQRShape;
    QRLabel13: TQRLabel;
    QRSHPTProveedor: TQRShape;
    QRLabel33: TQRLabel;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRGroupMoneda: TQRGroup;
    QRShape1: TQRShape;
    QRLabel46: TQRLabel;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    qrgrpFooterTransac: TQRBand;
    QRDBText14: TQRDBText;
    qyBitAvMailID_CREDITO: TFloatField;
    qyBitAvMailID_DOCUMENTO: TStringField;
    qyBitAvMailF_AVISO: TDateTimeField;
    qyBitAvMailFH_ENVIO_MAIL: TDateTimeField;
    qyBitAvMailCVE_AVISO: TStringField;
    qyBitAvMailNUM_IMPRESION: TFloatField;
    qyBitAvMailB_MAIL: TStringField;
    qyBitAvMailTX_MAIL: TStringField;
    qyBitAvMailCVE_USUARIO: TStringField;
    QRShape2: TQRShape;
    QRLabel39: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRGroup1: TQRGroup;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText9: TQRDBText;
    qyBitAvMailDESC_AVISO: TStringField;
    qyBitAvMailF_AVISO_OPER: TDateTimeField;
    qyBitAvMailNOM_PROVEEDOR: TStringField;
    qyBitAvMailIMP_OPERACION: TFloatField;
    QRShape5: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText10: TQRDBText;

  Private
  Public
    Function FormaQuery(dFInicio, dFFin: TDateTime;
                        sDisp, sTipEvent, sEmior, sProveedor, sbmail, sEmpresa, sSucursal: String ): String;
  end;
Var
  QrBitAvMail: TQrBitAvMail;
  Apli : TInterApli;

Procedure RepBitAvMail(  dFInicio, dFFin: TDateTime;
                       sMoneda, sDisp, sProducto,  sTipEvent, sEmior, sProveedor, sbmail, sEmpresa, sSucursal: String;
                       pAPli     : TInterApli;
                       pPreview  : Boolean);

Implementation
{$R *.DFM}

Procedure RepBitAvMail(  dFInicio, dFFin: TDateTime;
                       sMoneda, sDisp, sProducto,  sTipEvent, sEmior, sProveedor, sbmail, sEmpresa, sSucursal: String;
                       pAPli     : TInterApli;
                       pPreview  : Boolean);
Var
   QrBitAvMail: TQrBitAvMail;
   Preview     : TIntQRPreview;
Begin
   QrBitAvMail:=TQrBitAvMail.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrBitAvMail);
   Try

      Apli := pApli;
      QrBitAvMail.QRInterEncabezado1.Apli:=pApli;
      QrBitAvMail.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrBitAvMail.QRInterEncabezado1.NomReporte:='IntMQrBitAvMail';
      QrBitAvMail.QRInterEncabezado1.Titulo1:='Bitácora Avisos por Mail';
      QrBitAvMail.QRInterEncabezado1.Titulo2:='Del '+  DateToStr(dFInicio) + ' al ' + DateToStr(dFFin);

      QrBitAvMail.qyBitAvMail.DatabaseName := pApli.DataBaseName;
      QrBitAvMail.qyBitAvMail.SessionName := pApli.SessionName;

      QrBitAvMail.qyBitAvMail.Active:=False;
      QrBitAvMail.qyBitAvMail.SQL.Text:= QrBitAvMail.FormaQuery(dFInicio, dFFin, sDisp,
                                                          sTipEvent, sEmior, sProveedor, sbmail, sEmpresa, sSucursal);
      QrBitAvMail.qyBitAvMail.SQL.SaveToFile('c:\BITAVIS.txt');
      QrBitAvMail.qyBitAvMail.Active:=True;

      If pPreview Then
         QrBitAvMail.Preview
      Else
         QrBitAvMail.Print;
   Finally
      QrBitAvMail.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrBitAvMail.FormaQuery(dFInicio, dFFin: TDateTime;
                               sDisp, sTipEvent, sEmior, sProveedor, sbmail, sEmpresa, sSucursal: String ): String;
Var
    sSQL,sSQLTrn:String;
Begin
    sSQL:= ' SELECT INFO.ID_CREDITO,' + coCRLF +
	   '        INFO.ID_DOCUMENTO,' + coCRLF +
	   '   	    INFO.F_AVISO,' + coCRLF +
	   '   	    INFO.F_AVISO_OPER,' + coCRLF +
	   '  	    INFO.FH_ENVIO_MAIL,' + coCRLF +
	   '  	    INFO.IMP_OPERACION,' + coCRLF +
	   '  	    INFO.CVE_AVISO,' + coCRLF +
	   '  	    DECODE(INFO.CVE_AVISO, ''CARGO'',''COLOCACION'',' + coCRLF +
	   '  	                     ''EPREAB'',''AVISO DE REMANENTE (ABONO)'',' + coCRLF +
	   '  	                     ''EPDEAB'',''AVISO DE DEV. DE INTERES (ABONO)'',' + coCRLF +
	   '  	                     ''EPMOCA'',''AVISO DE MORATORIOS (CARGO)'',''''' + coCRLF +
	   '  	         ) DESC_AVISO,' + coCRLF +
	   '  	   INFO.NUM_IMPRESION,' + coCRLF +
	   '  	   INFO.B_MAIL,' + coCRLF +
	   '  	   INFO.TX_MAIL,' + coCRLF +
	   '  	   INFO.CVE_USUARIO,' + coCRLF +
	   '  	   INFO.ID_PROVEEDOR, P.NOMBRE AS NOM_PROVEEDOR, ' + coCRLF +
	   '  	   INFO.ID_EMISOR' + coCRLF +
	   ' FROM (' + coCRLF +
	   '        SELECT CCA.*, CS.F_AUTORIZA AS F_AVISO_OPER,' + coCRLF +
	   '        	  (SELECT SUM(IMP_CAPITAL) IMP_OPERACION' + coCRLF +
	   '               FROM CR_CAPITAL' + coCRLF +
	   '               WHERE ID_CREDITO = CS.ID_CESION' + coCRLF +
	   '                 AND SIT_CAPITAL <> ''CA''' + coCRLF +
	   '               GROUP BY ID_CREDITO) IMP_OPERACION,' + coCRLF +
	   '              CS.ID_PROVEEDOR, CS.ID_EMISOR' + coCRLF +
	   '        FROM CR_CTRL_AVISO CCA,' + coCRLF +
	   '             CR_CESION CS' + coCRLF +
	   '        WHERE CCA.CVE_AVISO = ''CARGO''' + coCRLF +
	   '          AND CS.F_AUTORIZA >= '+ SQLFECHA(dFInicio) + coCRLF +
	   '          AND CS.F_AUTORIZA <= '+ SQLFECHA(dFFin) + coCRLF +
	   '          AND CCA.ID_CREDITO = CS.ID_CESION' + coCRLF +

	   '        UNION' + coCRLF +

	   '        SELECT CCA.*,CR.F_PAGO AS F_AVISO_OPER, NVL( CR.IMP_DEV_REMAN, 0 ) IMP_OPERACION,' + coCRLF +
	   '               CS.ID_PROVEEDOR, CS.ID_EMISOR' + coCRLF +
	   '        FROM CR_CTRL_AVISO CCA,' + coCRLF +
	   '             CR_REMANENTE CR,' + coCRLF +
	   '             CR_CESION CS' + coCRLF +
	   '        WHERE CCA.CVE_AVISO = ''EPREAB''' + coCRLF +
	   '          AND CR.CVE_TIPO_REMAN = ''RE''' + coCRLF +
	   '          AND CR.F_PAGO >= '+ SQLFECHA(dFInicio) + coCRLF +
	   '          AND CR.F_PAGO <= '+ SQLFECHA(dFFin) + coCRLF +
	   '          AND CR.ID_CESION = CS.ID_CESION' + coCRLF +
	   '          AND CCA.ID_CREDITO = CR.ID_CESION' + coCRLF +
	   '          AND CCA.ID_DOCUMENTO = CR.ID_DOCUMENTO' + coCRLF +

	   '        UNION' + coCRLF +

	   '        SELECT CCA.*,CR.F_PAGO AS F_AVISO_OPER, NVL( CR.IMP_DEV_REMAN, 0 ) IMP_OPERACION,' + coCRLF +
	   '        CS.ID_PROVEEDOR, CS.ID_EMISOR' + coCRLF +
	   '        FROM CR_CTRL_AVISO CCA,' + coCRLF +
	   '             CR_REMANENTE CR,' + coCRLF +
	   '             CR_CESION CS' + coCRLF +
	   '        WHERE CCA.CVE_AVISO = ''EPDEAB''' + coCRLF +
	   '          AND CR.CVE_TIPO_REMAN = ''IN''' + coCRLF +
	   '          AND CR.F_PAGO >= ' + SQLFECHA(dFInicio) + coCRLF +
	   '          AND CR.F_PAGO <= ' + SQLFECHA(dFFin) + coCRLF +
	   '          AND CS.ID_CESION = CR.ID_CESION' + coCRLF +
	   '          AND CCA.ID_CREDITO = CR.ID_CESION' + coCRLF +
	   '          AND CCA.ID_DOCUMENTO = CR.ID_DOCUMENTO' + coCRLF +

	   '        UNION' + coCRLF +

	   '        SELECT CCA.*,CT.F_PAGO AS F_AVISO_OPER, NVL( CT.IMP_MORAS, 0 ) IMP_OPERACION,' + coCRLF +
	   '               CS.ID_PROVEEDOR, CS.ID_EMISOR' + coCRLF +
	   '        FROM CR_CTRL_AVISO CCA,' + coCRLF +
	   '             CR_CESION CS,' + coCRLF +
	   '        	 (SELECT  CT.ID_CESION              ID_CESION,' + coCRLF +
	   '             		  CT.ID_DOCUMENTO           ID_DOCUMENTO,' + coCRLF +
	   '             		  CT.F_OPERACION            F_PAGO,' + coCRLF +
	   '             		  NVL(SUM(CDT.IMP_CONCEPTO), 0)  IMP_MORAS' + coCRLF +
	   '        	  FROM CR_TRANSACCION CT,' + coCRLF +
	   '                   CR_REL_CON_AFEC CRCA,' + coCRLF +
	   '                   CR_DET_TRANSAC  CDT,' + coCRLF +
	   '                   CR_PARAMETRO CP' + coCRLF +
	   '              WHERE CP.CVE_PARAMETRO   = ''CRE''' + coCRLF +
	   '                AND CT.SIT_TRANSACCION = ''AC''' + coCRLF +
	   '                AND CT.ID_TRANS_CANCELA IS NULL' + coCRLF +
	   '                AND CRCA.CVE_AFECTACION = ''CAMORP''' + coCRLF +
	   '                AND CT.F_OPERACION >= '+ SQLFECHA(dFInicio) + coCRLF +
	   '                AND CT.F_OPERACION <= '+ SQLFECHA(dFFin) + coCRLF +
	   '                AND CT.ID_TRANSACCION  = CDT.ID_TRANSACCION' + coCRLF +
	   '                AND CT.CVE_OPERACION   = CDT.CVE_OPERACION' + coCRLF +
	   '                AND CDT.CVE_OPERACION  = CRCA.CVE_OPERACION' + coCRLF +
	   '                AND CDT.CVE_CONCEPTO   = CRCA.CVE_CONCEPTO' + coCRLF +
	   '                AND CT.CVE_TIPO_MOVTO  = CRCA.CVE_TIPO_MOVTO' + coCRLF +
	   '                AND CT.CVE_OPERACION   = CP.CVE_OPE_PAG_CP' + coCRLF +
	   '        	  GROUP BY CT.ID_CESION,' + coCRLF +
	   '             		  CT.ID_DOCUMENTO,' + coCRLF +
	   '             		  CT.F_OPERACION' + coCRLF +
	   '        	 ) CT' + coCRLF +
	   '        WHERE CCA.CVE_AVISO = ''EPMOCA''' + coCRLF +
	   '          AND CS.ID_CESION = CT.ID_CESION' + coCRLF +
	   '          AND CCA.ID_CREDITO = CT.ID_CESION' + coCRLF +
	   '          AND CCA.ID_DOCUMENTO = CT.ID_DOCUMENTO' + coCRLF +
	   '      ) INFO, PERSONA P' + coCRLF+
           ' WHERE  1=1' + coCRLF;

    if sDisp <> '' then Begin
    sSQL:= sSQL +
           '   AND INFO.ID_CREDITO = ' + sDisp + coCRLF;
    end;

    if sTipEvent <> '' then Begin
    sSQL:= sSQL +
           '   AND INFO.CVE_AVISO = ' + SQLStr(sTipEvent) + coCRLF;
    end;

    if sEmior <> '' then Begin
    sSQL:= sSQL +
           '   AND INFO.ID_EMISOR = ' + sEmior + coCRLF;
    end;

    if sProveedor <> '' then Begin
    sSQL:= sSQL +
           '   AND INFO.ID_PROVEEDOR = ' + sProveedor + coCRLF;
    end;

    if sbmail <> '' then Begin
    sSQL:= sSQL +
           '   AND INFO.B_MAIL = ' + SQLStr(sbmail) + coCRLF;
    end;

    sSQL:= sSQL +
           '   AND P.ID_PERSONA = INFO.ID_PROVEEDOR ' + coCRLF +
	   ' ORDER BY INFO.F_AVISO_OPER, INFO.CVE_AVISO,INFO.ID_PROVEEDOR, INFO.ID_EMISOR' + coCRLF;
   Result:= sSQL;
End;

End.
