Unit IntMQrBitQCQC;       

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport;
Type
  TQrBitQCQC = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qyBitQCQC: TQuery;
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
    QRSHPTChequera: TQRShape;
    QRLabel13: TQRLabel;
    QRSHPTProveedor: TQRShape;
    QRLabel33: TQRLabel;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qrgrpFooterMoneda: TQRBand;
    QRGroupMoneda: TQRGroup;
    QRLabel39: TQRLabel;
    QRShape1: TQRShape;
    SummaryBand1: TQRBand;
    QRSHPMoneda: TQRShape;
    QRLabel46: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    qyBitQCQCDESC_MONEDA: TStringField;
    qyBitQCQCNOMBRE: TStringField;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel1: TQRLabel;
    qyBitQCQCID_CREDITO: TFloatField;
    qyBitQCQCCVE_MONEDA: TFloatField;
    qyBitQCQCID_TITULAR: TFloatField;
    qyBitQCQCCVE_PRODUCTO_CRE: TStringField;
    qyBitQCQCID_PERIODO: TFloatField;
    qrGROUP_TRANSAC: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    qyBitQCQCID_TRANSACCION: TFloatField;
    qyBitQCQCSIT_CREDITO: TStringField;
    qyBitQCQCF_VALOR: TDateTimeField;
    qyBitQCQCTX_NOTA: TStringField;
    qyBitQCQCTIPO_EVENTO: TStringField;
    qyBitQCQCETIQUETA: TStringField;
    qyBitQCQCIMP_CONCEPTO: TFloatField;
    qyBitQCQCIMP_TRANS: TFloatField;
    qyBitQCQCTASA: TFloatField;
    qyBitQCQCDIFERENCIA: TFloatField;
    qrgrpFooterTransac: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRShape2: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    qyBitQCQCPERIODO: TFloatField;
    qyBitQCQCF_INICIO: TDateTimeField;
    qyBitQCQCF_VENCIMIENTO: TDateTimeField;
    qyBitQCQCNUM_DIAS_VENCIDO: TFloatField;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText17: TQRDBText;
    qyBitQCQCCVE_USU_ALTA: TStringField;
    QRLabel14: TQRLabel;
    QRShape4: TQRShape;
    procedure QRDBText15Print(sender: TObject; var Value: String);
    procedure QRDBText13Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);

  Private
  Public
    Function FormaQuery(dFInicio, dFFin: TDateTime;
                        sMoneda, sDisp, sProducto,  sTipEvent, sEmpresa, sSucursal: String ): String;
  end;
Var
  QrBitQCQC: TQrBitQCQC;
  Apli : TInterApli;

Procedure RepBitQCQC(  dFInicio, dFFin: TDateTime;
                       sMoneda, sDisp, sProducto,  sTipEvent, sEmpresa, sSucursal: String;
                       pAPli     : TInterApli;
                       pPreview  : Boolean);

Implementation
{$R *.DFM}

Procedure RepBitQCQC(  dFInicio, dFFin: TDateTime;
                       sMoneda, sDisp, sProducto,  sTipEvent, sEmpresa, sSucursal: String;
                       pAPli     : TInterApli;
                       pPreview  : Boolean);
Var
   QrBitQCQC: TQrBitQCQC;
   Preview     : TIntQRPreview;
Begin
   QrBitQCQC:=TQrBitQCQC.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrBitQCQC);
   Try

      Apli := pApli;
      QrBitQCQC.QRInterEncabezado1.Apli:=pApli;
      QrBitQCQC.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrBitQCQC.QRInterEncabezado1.NomReporte:='IntMQrBitQCQC';
      QrBitQCQC.QRInterEncabezado1.Titulo1:='Bitácora de Quitas, Condonaciones, Quebrantos y Castigos';
      QrBitQCQC.QRInterEncabezado1.Titulo2:='Periodo del '+  DateToStr(dFInicio) + ' al ' + DateToStr(dFFin);

      QrBitQCQC.qyBitQCQC.DatabaseName := pApli.DataBaseName;
      QrBitQCQC.qyBitQCQC.SessionName := pApli.SessionName;

      QrBitQCQC.qyBitQCQC.Active:=False;
      QrBitQCQC.qyBitQCQC.SQL.Text:= QrBitQCQC.FormaQuery(dFInicio, dFFin, sMoneda, sDisp, sProducto,
                                                          sTipEvent, sEmpresa, sSucursal);
      QrBitQCQC.qyBitQCQC.SQL.SaveToFile('c:\quitas.txt');
      QrBitQCQC.qyBitQCQC.Active:=True;

      If pPreview Then
         QrBitQCQC.Preview
      Else
         QrBitQCQC.Print;
   Finally
      QrBitQCQC.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrBitQCQC.FormaQuery(dFInicio, dFFin: TDateTime;
                               sMoneda, sDisp, sProducto,  sTipEvent, sEmpresa, sSucursal: String ): String;
Var
    sSQL,sSQLTrn:String;
Begin
    sSQLTrn:=  '                     NVL(CT.IMP_NETO,0) IMPORTE, CT.CVE_TIPO_MOVTO, CO.CVE_ACCESORIO,CDT.CVE_CONCEPTO ' + coCRLF +
   	       '              FROM CR_TRANSACCION CT, CR_OPERACION CO, CR_DET_TRANSAC CDT ' + coCRLF +
	       '              WHERE 1 = 1 ' + coCRLF;
            If (Trim(sDisp)<>'') Then
              sSQLTrn:= sSQLTrn +
               '                AND CT.ID_CREDITO = '+ sDisp + coCRLF ;
    sSQLTrn:= sSQLTrn +
	       '                AND CT.F_VALOR BETWEEN ' + SQLFecha(dFInicio) + ' AND ' + SQLFecha(dFFin) + coCRLF +
	       '                AND CT.CVE_OPERACION IN(''QUITAS'',''CONINT'',''CASTCP'',''CASTIN'',''CASTCN'',''CASTFN'', ' + coCRLF +
	       '         	                        ''QBRTCP'',''QBRTIN'',''QBRTCN'', ''QBRTFN'', ' + coCRLF +
	       '        	                        ''CMORCP'', ''CMORIN'',''CMORCN'',''CMORFN'', ' + coCRLF +
               //RIRA4281 27oct10
	       '        	                        ''ADJUCN'', ''ADJUIN'',''ADJUFN'',''ADJUCP'', ' + coCRLF +
	       '        	                        ''DACICN'', ''DACIIN'',''DACIFN'',''DACICP'', ' + coCRLF +
               //FIN RIRA4281 27oct10
               //JAGF 01Dic10
	       '        	                        ''CODNCN'', ''CODNIN'',''CODNFN'',''CODNCP'', ' + coCRLF +    //Corrección para condonaciones
	       '        	                        ''QUITCN'', ''QUITIN'',''QUITCP'',''QUITFN'', ' + coCRLF +    //Corrección para quitas
	       '        	                        ''VTCTCN'', ''VTCTIN'',''VTCTFN'',''VTCTCP'') ' + coCRLF +
               //FIN JAGF 01Dic10
	       '                AND CO.CVE_OPERACION   = CT.CVE_OPERACION ' + coCRLF +
	       '                AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION ' + coCRLF +
	       '            ) CT,' + coCRLF;

    sSQL:=  'SELECT * FROM ( ' + coCRLF +
            ' SELECT CTO.CVE_MONEDA, M.DESC_MONEDA,CTO.ID_TITULAR, P.NOMBRE, ' + coCRLF +
	    '        CT.ID_CREDITO, CT.ID_PERIODO,CCTO.CVE_PRODUCTO_CRE, CR.SIT_CREDITO, ' + coCRLF +
	    '        DECODE(CT.CVE_OPERACION,''QUITAS'',''QUITA'',''QBRTCP'',''QUEBRANTOS'', ''QBRTIN'',''QUEBRANTOS'',''QBRTCN'',''QUEBRANTOS'',''QBRTFN'',''QUEBRANTOS'',' + coCRLF +
	    '         			     ''CASTCP'',''CASTIGOS'',''CASTIN'',''CASTIGOS'',''CASTCN'',''CASTIGOS'', ''CASTFN'',''CASTIGOS'',''CONINT'',''CONDONACIONES'',' + coCRLF +
	    '        			     ''CMORCP'',''CONDONACIONES'',''CMORIN'',''CONDONACIONES'', ''CMORCN'',''CONDONACIONES'',''CMORFN'',''CONDONACIONES'', ' + coCRLF +
            '          	                     ''ADJUCN'',''ADJUDICACIONES'',''ADJUIN'',''ADJUDICACIONES'',''ADJUFN'',''ADJUDICACIONES'',''ADJUCP'',''ADJUDICACIONES'', ' + coCRLF +
	    '        	                     ''DACICN'',''DACIONES'', ''DACIIN'',''DACIONES'',''DACIFN'',''DACIONES'',''DACICP'',''DACIONES'', ' + coCRLF +
               //JAGF 01Dic10
	    '        	                     ''CODNCN'',''CONDONACIONES'', ''CODNIN'',''CONDONACIONES'',''CODNFN'',''CONDONACIONES'',''CODNCP'',''CONDONACIONES'', ' + coCRLF +   //Corrección para condonaciones
	    '        	                     ''QUITCN'',''QUITA'', ''QUITIN'',''QUITA'',''QUITCP'',''QUITA'',''QUITFN'',''QUITA'', ' + coCRLF +   //Corrección para quitas
	    '        	                     ''VTCTCN'',''VTA DE CARTERA'', ''VTCTIN'',''VTA DE CARTERA'',''VTCTFN'',''VTA DE CARTERA'',''VTCTCP'',''VTA DE CARTERA'' '  + coCRLF +
               //FIN JAGF 01Dic10
            '                                 ,NULL)TIPO_EVENTO,' + coCRLF +
	    '               CT.F_VALOR, CT.TX_NOTA, ' + coCRLF +
	    '               SDO.*, DECODE(IMP_CONCEPTO,0,0,(SDO.IMP_TRANS*100)/SDO.IMP_CONCEPTO) TASA, ' + coCRLF +
	    '               IMP_CONCEPTO - IMP_TRANS DIFERENCIA, ' + coCRLF +
            '               CT.CVE_USU_ALTA ' + coCRLF +
	    ' FROM CR_TRANSACCION CT, ' + coCRLF +
	    '     ( SELECT 0 REG, ID_TRANSACCION,''CAPITAL VIGENTE'' ETIQUETA, ' + coCRLF +
	    '              NVL(SUM(CAP_VIG),0) IMP_CONCEPTO, ' + coCRLF +
	    '              DECODE(CVE_CONCEPTO,''IMPBRU'', DECODE(CVE_ACCESORIO,''CP'',DECODE(CVE_TIPO_MOVTO,''MD'',NVL(SUM(IMPORTE),0), ' + coCRLF +
	    '        				                		                             ''AN'',NVL(SUM(IMPORTE),0),0), ' + coCRLF +
	    '        							        ''FN'',DECODE(CVE_TIPO_MOVTO,''MD'',NVL(SUM(IMPORTE),0), ' + coCRLF +
	    '        	              				   		                             ''AN'',NVL(SUM(IMPORTE),0),0),0),0) IMP_TRANS, ' + coCRLF +
	    '              DECODE(PERIODO,0,CT.ID_PERIODO) PERIODO, ( CP.F_VENCIMIENTO - CP.PLAZO ) F_INICIO, CP.F_VENCIMIENTO , CP.NUM_DIAS_VENCIDO ' + coCRLF +
	    '       FROM ( SELECT CT.ID_TRANSACCION,CT.ID_CREDITO,CT.F_VALOR,CT.ID_PERIODO, ' + coCRLF +
	    '                     NVL(( SELECT ( CHC.SDO_INSOLUTO + CHC.SDO_FINAN_ADIC) ' + coCRLF +
	    '                           FROM CR_HISTO_CRED CHC ' + coCRLF +
	    '                           WHERE CHC.ID_CREDITO = CT.ID_CREDITO ' + coCRLF +
	    '                             AND F_CIERRE = CT.F_VALOR - 1 ' + coCRLF +
	    '                             AND F_TRASPASO_VENC IS NULL),0) CAP_VIG, ' + coCRLF +
	    '                     PKGCRPERIODO.ObtPerAct( ID_CREDITO, CT.F_VALOR - 1, ''CP'') PERIODO, ' + coCRLF +
        sSQLTrn +
	    '            CR_CAPITAL CP ' + coCRLF +
	    '       WHERE CT.ID_CREDITO = CP.ID_CREDITO(+) ' + coCRLF +
	    '         AND CT.PERIODO     = CP.NUM_PERIODO(+) ' + coCRLF +
	    '       GROUP BY CT.CVE_TIPO_MOVTO, CT.CVE_ACCESORIO, CT.CVE_CONCEPTO,CT.ID_TRANSACCION, CT.PERIODO, ' + coCRLF +
	    '                CP.F_VENCIMIENTO, CP.PLAZO, CP.NUM_DIAS_VENCIDO,CT.ID_PERIODO ' + coCRLF +
	    '     UNION ' + coCRLF +
	    '       SELECT 1 REG, ID_TRANSACCION,''CAPITAL IMPAGADO'' ETIQUETA, ' + coCRLF +
	    '              NVL(SUM(CAP_IMP),0) IMP_CONCEPTO, ' + coCRLF +
	    '              DECODE(CVE_CONCEPTO,''IMPBRU'',DECODE(CVE_ACCESORIO,''CP'',DECODE(CVE_TIPO_MOVTO,''IM'',NVL(SUM(IMPORTE),0),0), ' + coCRLF +
	    '          							       ''FN'',DECODE(CVE_TIPO_MOVTO,''IM'',NVL(SUM(IMPORTE),0),0),0),0) IMP_TRANS, ' + coCRLF +
	    '              DECODE(PERIODO,0,CT.ID_PERIODO - 1) PERIODO, ( CP.F_VENCIMIENTO - CP.PLAZO ) F_INICIO, CP.F_VENCIMIENTO , CP.NUM_DIAS_VENCIDO ' + coCRLF +
	    '       FROM ( SELECT CT.ID_TRANSACCION, CT.ID_CREDITO,CT.F_VALOR, CT.ID_PERIODO,' + coCRLF +
	    '                     NVL(( SELECT ( CHC.IMP_CAPITAL_VDO + CHC.IMP_VDO_FINAN_A) IMPORTE ' + coCRLF +
	    '                           FROM CR_HISTO_CRED CHC ' + coCRLF +
	    '                           WHERE CHC.ID_CREDITO = CT.ID_CREDITO ' + coCRLF +
	    '                             AND F_CIERRE = CT.F_VALOR - 1 ' + coCRLF +
	    '                             AND F_TRASPASO_VENC IS NULL),0) CAP_IMP, ' + coCRLF +
	    '                     PKGCRPERIODO.ObtPerAct( ID_CREDITO, CT.F_VALOR - 1, ''CP'') PERIODO, ' + coCRLF +
        sSQLTrn +
	    '            CR_CAPITAL CP ' + coCRLF +
	    '       WHERE CT.ID_CREDITO = CP.ID_CREDITO(+) ' + coCRLF +
	    '         AND CT.PERIODO     = CP.NUM_PERIODO(+) ' + coCRLF +
	    '       GROUP BY CT.CVE_TIPO_MOVTO, CT.CVE_ACCESORIO, CT.CVE_CONCEPTO,CT.ID_TRANSACCION, CT.PERIODO, ' + coCRLF +
	    '                CP.F_VENCIMIENTO, CP.PLAZO, CP.NUM_DIAS_VENCIDO,CT.ID_PERIODO ' + coCRLF +
	    '     UNION ' + coCRLF +
	    '       SELECT 2 REG, ID_TRANSACCION, ''CAPITAL VENCIDO EXIGIBLE'' ETIQUETA, ' + coCRLF +
	    '              NVL(SUM(CAP_EXIG),0) IMP_CONCEPTO, ' + coCRLF +
	    '              DECODE(CVE_CONCEPTO,''IMPBRU'', ' + coCRLF +
	    '       		  DECODE(CVE_ACCESORIO,''CP'',DECODE(CVE_TIPO_MOVTO,''IV'',NVL(SUM(IMPORTE),0),0), ' + coCRLF +
	    '       				       ''FN'',DECODE(CVE_TIPO_MOVTO,''IV'',NVL(SUM(IMPORTE),0),0),0),0) IMP_TRANS, ' + coCRLF +
	    '              DECODE(PERIODO,0,CT.ID_PERIODO - 1 ) PERIODO, ( CP.F_VENCIMIENTO - CP.PLAZO ) F_INICIO, CP.F_VENCIMIENTO , CP.NUM_DIAS_VENCIDO ' + coCRLF +
	    '       FROM ( SELECT CT.ID_TRANSACCION, CT.ID_CREDITO,CT.F_VALOR,CT.ID_PERIODO, ' + coCRLF +
	    '                     NVL(( SELECT ( CHC.IMP_CAPITAL_VDO + CHC.IMP_VDO_FINAN_A) IMPORTE ' + coCRLF +
	    '                           FROM CR_HISTO_CRED CHC ' + coCRLF +
	    '                           WHERE CHC.ID_CREDITO = CT.ID_CREDITO ' + coCRLF +
	    '                             AND F_CIERRE = CT.F_VALOR - 1 ' + coCRLF +
	    '                             AND F_TRASPASO_VENC IS NOT NULL),0) CAP_EXIG, ' + coCRLF +
	    '                     PKGCRPERIODO.ObtPerAct( ID_CREDITO, CT.F_VALOR - 1, ''CP'') PERIODO, ' + coCRLF +
        sSQLTrn +
	    '            CR_CAPITAL CP ' + coCRLF +
	    '       WHERE CT.ID_CREDITO = CP.ID_CREDITO(+) ' + coCRLF +
	    '         AND CT.PERIODO     = CP.NUM_PERIODO(+) ' + coCRLF +
	    '       GROUP BY CT.CVE_TIPO_MOVTO, CT.CVE_ACCESORIO, CT.CVE_CONCEPTO,CT.ID_TRANSACCION, CT.PERIODO, ' + coCRLF +
	    '                CP.F_VENCIMIENTO, CP.PLAZO, CP.NUM_DIAS_VENCIDO,CT.ID_PERIODO ' + coCRLF +
	    '     UNION ' + coCRLF +
	    '       SELECT 3 REG, ID_TRANSACCION, ''CAPITAL VENCIDO NO EXIGIBLE'' ETIQUETA, ' + coCRLF +
	    '              NVL(SUM(CAP_NE),0) IMP_CONCEPTO, ' + coCRLF +
	    '              DECODE(CVE_CONCEPTO,''IMPBRU'',DECODE(CVE_ACCESORIO,''CP'',DECODE(CVE_TIPO_MOVTO,''MV'',NVL(SUM(IMPORTE),0), ' + coCRLF +
	    ' 					                		                            ''AV'',NVL(SUM(IMPORTE),0),0), ' + coCRLF +
	    ' 	     							       ''FN'',DECODE(CVE_TIPO_MOVTO,''MV'',NVL(SUM(IMPORTE),0), ' + coCRLF +
	    '     					                		                    ''AV'',NVL(SUM(IMPORTE),0),0),0),0) IMP_TRANS, ' + coCRLF +
	    '              DECODE(PERIODO,0,CT.ID_PERIODO) PERIODO,( CP.F_VENCIMIENTO - CP.PLAZO ) F_INICIO, CP.F_VENCIMIENTO , CP.NUM_DIAS_VENCIDO ' + coCRLF +
	    '      FROM ( SELECT CT.ID_TRANSACCION, CT.ID_CREDITO,CT.F_VALOR, CT.ID_PERIODO,' + coCRLF +
	    '                    NVL(( SELECT ( CHC.SDO_INSOLUTO + CHC.SDO_FINAN_ADIC) ' + coCRLF +
	    '                          FROM CR_HISTO_CRED CHC ' + coCRLF +
	    '                          WHERE CHC.ID_CREDITO = CT.ID_CREDITO ' + coCRLF +
	    '                            AND F_CIERRE = CT.F_VALOR - 1 ' + coCRLF +
	    '                            AND F_TRASPASO_VENC IS NOT NULL),0) CAP_NE, ' + coCRLF +
	    '                     PKGCRPERIODO.ObtPerAct( ID_CREDITO, CT.F_VALOR - 1, ''CP'') PERIODO, ' + coCRLF +
        sSQLTrn +
	    '            CR_CAPITAL CP ' + coCRLF +
	    '       WHERE CT.ID_CREDITO = CP.ID_CREDITO(+) ' + coCRLF +
	    '         AND CT.PERIODO     = CP.NUM_PERIODO(+) ' + coCRLF +
	    '       GROUP BY CT.CVE_TIPO_MOVTO, CT.CVE_ACCESORIO, CT.CVE_CONCEPTO,CT.ID_TRANSACCION, CT.PERIODO, ' + coCRLF +
	    '                CP.F_VENCIMIENTO, CP.PLAZO, CP.NUM_DIAS_VENCIDO,CT.ID_PERIODO ' + coCRLF +
	    '     UNION ' + coCRLF +
	    '       SELECT 4 REG,ID_TRANSACCION,''INTERESES ORDINARIOS'' ETIQUETA, ' + coCRLF +
	    '              NVL(SUM(INT_ORD),0) IMP_CONCEPTO, ' + coCRLF +
	    '              DECODE(CVE_ACCESORIO,''IN'',DECODE(CVE_CONCEPTO,''IMPBRU'',NVL(SUM(IMPORTE),0), ' + coCRLF +
	    '  							           ''IMPIVA'',NVL(SUM(IMPORTE),0),0),0) IMP_TRANS, ' + coCRLF +
	    '              DECODE(PERIODO,0,CT.ID_PERIODO) PERIODO, ( CI.F_VENCIMIENTO - CI.PLAZO ) F_INICIO, CI.F_VENCIMIENTO , CI.NUM_DIAS_VENCIDO ' + coCRLF +
	    '       FROM ( SELECT CT.ID_TRANSACCION, CT.ID_CREDITO,CT.F_VALOR,CT.ID_PERIODO, ' + coCRLF +
	    '                     NVL(( SELECT SUM( IMP_INTERES)' + coCRLF +
	    '                           FROM CR_DET_HIST_CR' + coCRLF +
	    '                           WHERE ID_CREDITO = CT.ID_CREDITO AND F_CIERRE = CT.F_VALOR - 1),0) INT_ORD, ' + coCRLF +
	    '                     PKGCRPERIODO.ObtPerAct( ID_CREDITO, CT.F_VALOR - 1, ''IN'') PERIODO, ' + coCRLF +
        sSQLTrn +
	    '            CR_INTERES CI ' + coCRLF +
	    '       WHERE CT.ID_CREDITO = CI.ID_CREDITO(+) ' + coCRLF +
	    '         AND CT.PERIODO     = CI.NUM_PERIODO(+) ' + coCRLF +
	    '       GROUP BY CT.CVE_TIPO_MOVTO, CT.CVE_ACCESORIO, CT.CVE_CONCEPTO,CT.ID_TRANSACCION, CT.PERIODO, ' + coCRLF +
	    '                CI.F_VENCIMIENTO, CI.PLAZO, CI.NUM_DIAS_VENCIDO,CT.ID_PERIODO ' + coCRLF +
	    '     UNION ' + coCRLF +
	    '       SELECT 5 REG,ID_TRANSACCION,''INTERESES IMPAGADOS'' ETIQUETA, ' + coCRLF +
	    '              NVL(SUM(INT_IMP),0) IMP_CONCEPTO, ' + coCRLF +
	    '              DECODE(CVE_ACCESORIO,''IN'',DECODE(CVE_CONCEPTO,''IMPBRU'',NVL(SUM(IMPORTE),0), ' + coCRLF +
	    '  							           ''IMPIVA'',NVL(SUM(IMPORTE),0),0),0) IMP_TRANS, ' + coCRLF +
	    '              DECODE(PERIODO,0,CT.ID_PERIODO) PERIODO, ( CI.F_VENCIMIENTO - CI.PLAZO ) F_INICIO, CI.F_VENCIMIENTO , CI.NUM_DIAS_VENCIDO ' + coCRLF +
	    '       FROM ( SELECT CT.ID_TRANSACCION, CT.ID_CREDITO,CT.F_VALOR,CT.ID_PERIODO, ' + coCRLF +
	    '                     NVL(( SELECT ( IMP_INTERES_VDO + IMP_IVA_INT_VDO) ' + coCRLF +
	    '                           FROM CR_HISTO_CRED' + coCRLF +
	    '                           WHERE ID_CREDITO = CT.ID_CREDITO AND F_CIERRE = CT.F_VALOR - 1),0) INT_IMP,' + coCRLF +
	    '                     PKGCRPERIODO.ObtPerAct( ID_CREDITO, CT.F_VALOR - 1, ''IN'') PERIODO, ' + coCRLF +
        sSQLTrn +
	    '            CR_INTERES CI ' + coCRLF +
	    '       WHERE CT.ID_CREDITO = CI.ID_CREDITO(+) ' + coCRLF +
	    '         AND CT.PERIODO     = CI.NUM_PERIODO(+) ' + coCRLF +
	    '       GROUP BY CT.CVE_TIPO_MOVTO, CT.CVE_ACCESORIO, CT.CVE_CONCEPTO,CT.ID_TRANSACCION, CT.PERIODO, ' + coCRLF +
	    '                CI.F_VENCIMIENTO, CI.PLAZO, CI.NUM_DIAS_VENCIDO,CT.ID_PERIODO ' + coCRLF +
	    '     UNION ' + coCRLF +
	    '       SELECT 6 REG,ID_TRANSACCION,''INTERESES MORATORIOS'' ETIQUETA, ' + coCRLF +
	    '            NVL(SUM(INT_MOR),0) IMP_CONCEPTO, ' + coCRLF +
	    '            DECODE(CVE_CONCEPTO,''IMPMOR'' ,NVL(SUM(IMPORTE),0), ' + coCRLF +
	    ' 			             ''IVAMOR'',NVL(SUM(IMPORTE),0),0) IMP_TRANS, ' + coCRLF +
	    '            CT.ID_PERIODO, ' + coCRLF +
	    '            PKGCRPERIODO.ObtFechasPer(CT.ID_CREDITO, CT.ID_PERIODO,''I'',CT.CVE_ACCESORIO) F_INICIO, ' + coCRLF +
	    '            PKGCRPERIODO.ObtFechasPer(CT.ID_CREDITO, CT.ID_PERIODO,''V'',CT.CVE_ACCESORIO) F_VENCIMIENTO , ' + coCRLF +
	    '            CT.F_VALOR - PKGCRPERIODO.ObtFechasPer(CT.ID_CREDITO, CT.ID_PERIODO,''V'',CT.CVE_ACCESORIO) NUM_DIAS_VENCIDO ' + coCRLF +
	    '       FROM ' + coCRLF +
	    '         (   SELECT CT.ID_TRANSACCION, CT.ID_PERIODO, CT.ID_CREDITO,CT.F_VALOR, ' + coCRLF +
	    '                    (NVL(PKGCRPERIODO.FunObtMora( CO.CVE_ACCESORIO, ''V'', CT.ID_CREDITO, CT.ID_PERIODO, CT.CVE_COMISION, CR.FACT_MORAS,CT.F_VALOR-1, ''F'', ''V''),0) ' + coCRLF +
	    '                    ) INT_MOR, ' + coCRLF +
            '                    NVL(CT.IMP_NETO,0) IMPORTE, CT.CVE_TIPO_MOVTO, CO.CVE_ACCESORIO,CDT.CVE_CONCEPTO ' + coCRLF +
   	    '              FROM CR_TRANSACCION CT, CR_OPERACION CO, CR_DET_TRANSAC CDT, CR_CREDITO CR ' + coCRLF +
	    '              WHERE 1 = 1 ' + coCRLF;
            If (Trim(sDisp)<>'') Then
               sSQL:= sSQL +
            '                AND CT.ID_CREDITO = '+ sDisp + coCRLF ;
    sSQL:= sSQL +
	    '                AND CT.ID_CREDITO = CR.ID_CREDITO ' + coCRLF +
	    '                AND CT.F_VALOR BETWEEN ' + SQLFecha(dFInicio) + ' AND ' + SQLFecha(dFFin) + coCRLF +
	    '                AND CT.CVE_OPERACION IN(''QUITAS'',''CONINT'',''CASTCP'',''CASTIN'',''CASTCN'',''CASTFN'', ' + coCRLF +
	    '         	                        ''QBRTCP'',''QBRTIN'',''QBRTCN'', ''QBRTFN'', ' + coCRLF +
	    '        	                        ''CMORCP'', ''CMORIN'',''CMORCN'',''CMORFN'', ' + coCRLF +
            //RIRA4281 27oct10
            '          	                       ''ADJUCN'', ''ADJUIN'',''ADJUFN'',''ADJUCP'', ' + coCRLF +
	    '        	                       ''DACICN'', ''DACIIN'',''DACIFN'',''DACICP'', ' + coCRLF +
               //FIN RIRA4281 27oct10
               //JAGF 01Dic10
            '        	                       ''CODNCN'', ''CODNIN'',''CODNFN'',''CODNCP'', ' + coCRLF +    //Corrección para condonaciones
            '        	                       ''QUITCN'', ''QUITIN'',''QUITCP'',''QUITFN'', ' + coCRLF +    //Corrección para quitas
            '             	               ''VTCTCN'', ''VTCTIN'',''VTCTFN'',''VTCTCP'') ' + coCRLF +
               //FIN JAGF 01Dic10
	    '                AND CO.CVE_OPERACION   = CT.CVE_OPERACION ' + coCRLF +
	    '                AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION ' + coCRLF +
	    '            )CT ' + coCRLF +
	    '       GROUP BY CT.CVE_TIPO_MOVTO, CT.CVE_ACCESORIO, CT.CVE_CONCEPTO,CT.ID_TRANSACCION, CT.ID_PERIODO, ' + coCRLF +
	    '                CT.ID_CREDITO, CT.F_VALOR' + coCRLF +
	    '     UNION ' + coCRLF +
	    '       SELECT 7 REG,ID_TRANSACCION,''COMISIONES VIGENTES'' ETIQUETA, ' + coCRLF +
	    '              NVL(SUM(IMP_COM),0) IMP_CONCEPTO, ' + coCRLF +
	    '              DECODE(CVE_ACCESORIO,''CN'',DECODE(CVE_CONCEPTO,''IMPBRU'',NVL(SUM(IMPORTE),0), ' + coCRLF +
	    '  							           ''IMPIVA'',NVL(SUM(IMPORTE),0),0),0) IMP_TRANS, ' + coCRLF +
	    '              DECODE(PERIODO,0,CT.ID_PERIODO) PERIODO, ( CN.F_VENCIMIENTO - CN.PLAZO ) F_INICIO, CN.F_VENCIMIENTO , CN.NUM_DIAS_VENCIDO ' + coCRLF +
	    '       FROM ( SELECT CT.ID_TRANSACCION, CT.ID_CREDITO,CT.F_VALOR, CT.ID_PERIODO,' + coCRLF +
	    '                     NVL(( SELECT SUM( IMP_COMISION ) ' + coCRLF +
	    '                           FROM CR_DET_HIST_CR ' + coCRLF +
	    '                           WHERE ID_CREDITO = CT.ID_CREDITO AND F_CIERRE = CT.F_VALOR - 1),0) IMP_COM, ' + coCRLF +
	    '                     PKGCRPERIODO.ObtPerAct( ID_CREDITO, CT.F_VALOR - 1, ''CN'') PERIODO, ' + coCRLF +
        sSQLTrn +
	    '            CR_COMISION CN ' + coCRLF +
	    '       WHERE CT.ID_CREDITO = CN.ID_CREDITO(+) ' + coCRLF +
	    '         AND CT.PERIODO     = CN.NUM_PERIODO(+) ' + coCRLF +
	    '       GROUP BY CT.CVE_TIPO_MOVTO, CT.CVE_ACCESORIO, CT.CVE_CONCEPTO,CT.ID_TRANSACCION, CT.PERIODO, ' + coCRLF +
	    '                CN.F_VENCIMIENTO, CN.PLAZO, CN.NUM_DIAS_VENCIDO, CT.ID_PERIODO' + coCRLF +
	    '     UNION ' + coCRLF +
	    '       SELECT 8 REG,ID_TRANSACCION,''COMISIONES IMPAGADAS'' ETIQUETA, ' + coCRLF +
	    '              NVL(SUM(IMP_COM_IMP),0) IMP_CONCEPTO, ' + coCRLF +
	    '              DECODE(CVE_ACCESORIO,''CN'',DECODE(CVE_CONCEPTO,''IMPBRU'',NVL(SUM(IMPORTE),0), ' + coCRLF +


 '  							           ''IMPIVA'',NVL(SUM(IMPORTE),0),0),0) IMP_TRANS, ' + coCRLF +
	    '              DECODE(PERIODO,0,CT.ID_PERIODO - 1) PERIODO, ( CN.F_VENCIMIENTO - CN.PLAZO ) F_INICIO, CN.F_VENCIMIENTO , CN.NUM_DIAS_VENCIDO ' + coCRLF +
	    '       FROM ( SELECT CT.ID_TRANSACCION, CT.ID_CREDITO,CT.F_VALOR,CT.ID_PERIODO, ' + coCRLF +
	    '                     NVL(( SELECT ( IMP_COMISION_VDO + IMP_IVA_COM_VDO)  ' + coCRLF +
	    '                           FROM CR_HISTO_CRED' + coCRLF +
	    '                           WHERE ID_CREDITO = CT.ID_CREDITO AND F_CIERRE = CT.F_VALOR - 1),0) IMP_COM_IMP, ' + coCRLF +
	    '                     PKGCRPERIODO.ObtPerAct( ID_CREDITO, CT.F_VALOR - 1, ''CN'') PERIODO, ' + coCRLF +
        sSQLTrn +
	    '            CR_COMISION CN ' + coCRLF +
	    '       WHERE CT.ID_CREDITO = CN.ID_CREDITO(+) ' + coCRLF +
	    '         AND CT.PERIODO     = CN.NUM_PERIODO(+) ' + coCRLF +
	    '       GROUP BY CT.CVE_TIPO_MOVTO, CT.CVE_ACCESORIO, CT.CVE_CONCEPTO,CT.ID_TRANSACCION, CT.PERIODO, ' + coCRLF +
	    '                CN.F_VENCIMIENTO, CN.PLAZO, CN.NUM_DIAS_VENCIDO,CT.ID_PERIODO ' + coCRLF +
	    '     )SDO, CR_CREDITO CR, CONTRATO CTO,CR_CONTRATO CCTO, PERSONA P, MONEDA M ' + coCRLF +
	    ' WHERE 1 = 1' + coCRLF;
            //--- FILTROS
            If (Trim(sMoneda)<>'') Then
              sSQL:= sSQL + '   AND CTO.CVE_MONEDA        = '+ sMoneda + coCRLF ;
            If (Trim(sProducto)<>'') Then
              sSQL:= sSQL + '   AND CCTO.CVE_PRODUCTO_CRE = '+ SQLStr(sProducto)+ coCRLF ;
            If (Trim(sEmpresa)<>'') Then
              sSQL:= sSQL + '   AND CTO.ID_EMPRESA        = '+ sEmpresa+ coCRLF  ;
    sSQL:= sSQL +
    	    '   AND SDO.ID_TRANSACCION = CT.ID_TRANSACCION ' + coCRLF +
	    '   AND CT.ID_CREDITO      = CR.ID_CREDITO ' + coCRLF +
	    '   AND CTO.ID_CONTRATO    = CR.ID_CONTRATO ' + coCRLF +
	    '   AND CTO.ID_TITULAR     = P.ID_PERSONA ' + coCRLF +
	    '   AND CCTO.ID_CONTRATO   = CTO.ID_CONTRATO ' + coCRLF +
	    '   AND CTO.CVE_MONEDA     = M.CVE_MONEDA ' + coCRLF +
	    ' ORDER BY CT.ID_TRANSACCION,REG )' + coCRLF+
            'WHERE 1 = 1' + coCRLF;
            If (Trim(sTipEvent)<>'') AND (Trim(sTipEvent)<> '0') Then
               sSQL:= sSQL +
            '  AND TIPO_EVENTO = '+ SQLStr( sTipEvent )+ coCRLF ;
   Result:= sSQL;
End;

procedure TQrBitQCQC.QRDBText15Print(sender: TObject; var Value: String);
begin
   IF qyBitQCQCIMP_CONCEPTO.AsFloat <= 0 THEN
      Value := '';
end;

procedure TQrBitQCQC.QRDBText13Print(sender: TObject; var Value: String);
begin
   IF qyBitQCQCIMP_CONCEPTO.AsFloat <= 0 THEN
      Value := '';
end;

procedure TQrBitQCQC.QRDBText14Print(sender: TObject; var Value: String);
begin
   IF qyBitQCQCIMP_CONCEPTO.AsFloat <= 0 THEN
      Value := '';
end;

End.
