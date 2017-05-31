Unit IntMQrDetAcred;

Interface    

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport;
Type
  TQrDetAcred = Class(TQuickRep)
    qyDetAcred: TQuery;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText24: TQRDBText;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qrgrpFooterAcreditado: TQRBand;
    QRLabel36: TQRLabel;
    QRGroupContador: TQRGroup;
    QRExpr5: TQRExpr;
    QRGroup2: TQRGroup;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText11: TQRDBText;
    qyDetAcredID_TITULAR: TFloatField;
    QRDBText14: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr3: TQRExpr;
    qyDetAcredNOMBRE: TStringField;
    qyDetAcredVIGENTE: TFloatField;
    qyDetAcredNOEXIGIBLE: TFloatField;
    qyDetAcredIMPAGADO: TFloatField;
    qyDetAcredEXIGIBLE: TFloatField;
    qyDetAcredSDO_INSOLUTO: TFloatField;
    qyDetAcredF_VENCIMIENTO: TDateTimeField;
    qyDetAcredAMORTIZACION: TFloatField;
    qyDetAcredPAGADO: TFloatField;
    qyDetAcredSDO_INSOLUTO_CP: TFloatField;
    qyDetAcredVENCIDO: TFloatField;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRLabel8: TQRLabel;
    QRShape4: TQRShape;
    QRLabel10: TQRLabel;
    QRShape6: TQRShape;
    QRLabel11: TQRLabel;
    QRShape7: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel9: TQRLabel;
    QRGroup1: TQRGroup;
    qrgrpFooterFechaVto: TQRBand;
    qrlFECHA: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    qyDetAcredMES: TStringField;
    procedure qrgrpFooterFechaVtoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  Private
  Public
    Function FormaQuery(sAcreditado, sDisp, sEmpresa, sSucursal : String;
                        dFecha   : TDateTime ): String;
  end;
Var
  QrDetAcred: TQrDetAcred;
  Apli : TInterApli;

Procedure RepDetAcred( sAcreditado, sDisp, sEmpresa, sSucursal : String;
                       dFecha   : TDateTime;
                       pAPli    : TInterApli;
                       pPreview : Boolean);
Implementation
{$R *.DFM}

Procedure RepDetAcred( sAcreditado, sDisp, sEmpresa, sSucursal : String;
                       dFecha   : TDateTime;
                       pAPli    : TInterApli;
                       pPreview : Boolean);
Var
   QrDetAcred: TQrDetAcred;
   Preview     : TIntQRPreview;
Begin
   QrDetAcred:=TQrDetAcred.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrDetAcred);
   Try

      Apli := pApli;
      QrDetAcred.QRInterEncabezado1.Apli:=pApli;
      QrDetAcred.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrDetAcred.QRInterEncabezado1.NomReporte:='IntMQrDetAcred';
      QrDetAcred.QRInterEncabezado1.Titulo1:='Resumen Detalle por Acreditado';
      QrDetAcred.QRInterEncabezado1.Titulo2:='Al ' + DateToStr(dFecha);

      QrDetAcred.qyDetAcred.DatabaseName := pApli.DataBaseName;
      QrDetAcred.qyDetAcred.SessionName := pApli.SessionName;

      QrDetAcred.qyDetAcred.Active:=False;
      QrDetAcred.qyDetAcred.SQL.Text:= QrDetAcred.FormaQuery(sAcreditado, sDisp, sEmpresa, sSucursal,dFecha);
      QrDetAcred.qyDetAcred.SQL.SaveToFile('c:\detalleAcred.txt');
      QrDetAcred.qyDetAcred.Active:=True;

      If pPreview Then
         QrDetAcred.Preview
      Else
         QrDetAcred.Print;
   Finally
      QrDetAcred.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrDetAcred.FormaQuery(sAcreditado, sDisp, sEmpresa, sSucursal : String;
                        dFecha   : TDateTime ): String;
Var
    sSQL:String;
Begin
    sSQL:= ' SELECT ' + coCRLF +
           '        ACR.*, DATOS.*, PTIT.NOMBRE, TO_CHAR(DATOS.F_VENCIMIENTO,''MMYYYY'') MES' + coCRLF +
           ' FROM' + coCRLF +
           ' (' + coCRLF +
           ' SELECT CC.ID_TITULAR,' + coCRLF +
           '        SUM(NVL(VIG.IMPORTE,0)) AS VIGENTE,' + coCRLF +
           '        SUM(NVL(NE.IMPORTE,0)) AS NOEXIGIBLE,' + coCRLF +
           '        SUM(NVL(IMP.IMPORTE,0)) AS IMPAGADO,' + coCRLF +
           '        SUM(NVL(EXIG.IMPORTE,0)) AS EXIGIBLE,' + coCRLF +
           '        (SUM(NVL(VIG.IMPORTE,0))+SUM(NVL(NE.IMPORTE,0))+' + coCRLF +
           '        SUM(NVL(IMP.IMPORTE,0))+SUM(NVL(EXIG.IMPORTE,0)))SDO_INSOLUTO' + coCRLF +

           '   FROM (SELECT CC.ID_CREDITO, CTO.ID_TITULAR FROM' + coCRLF +
           '               (SELECT * FROM CR_CREDITO CC' + coCRLF +
           '                 WHERE CC.F_AUTORIZA <=  ' + SQLFecha(dFecha) + coCRLF +
           '                   AND (CC.F_LIQUIDACION >=  ' + SQLFecha(dFecha) + coCRLF +
           '                    OR CC.F_LIQUIDACION IS NULL )' +  coCRLF ;
                  If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp + coCRLF ;
    sSQL:= sSQL +
           '                )CC, CONTRATO CTO' + coCRLF +
           '          WHERE CTO.ID_CONTRATO = CC.ID_CONTRATO' + coCRLF  ;
//         --FILTROS
   If (Trim(sAcreditado)<>'') Then
      sSQL:= sSQL + ' AND CTO.ID_TITULAR = '+ sAcreditado +  coCRLF ;
   If (Trim(sEmpresa)<>'') Then
      sSQL:= sSQL + ' AND CTO.ID_EMPRESA = '+ sEmpresa +  coCRLF ;
    sSQL:= sSQL +
           '        )CC,' + coCRLF +
           '        (SELECT CP.ID_CREDITO,' + coCRLF +
           '                SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO,' + coCRLF +
//HERJA ENERO 2013
//           '             CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V'')))AS IMPORTE' + coCRLF +
           '             CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V'')) + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) )AS IMPORTE' + coCRLF +
//
           '           FROM (SELECT * FROM CR_CAPITAL CP' + coCRLF +
           '                 WHERE CP.F_VENCIMIENTO > ' + SQLFecha(dFecha) +  coCRLF ;
                 If (Trim(sDisp)<>'') Then
//HERJA ENERO 2013
//                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp;
                    sSQL:= sSQL + ' AND CP.ID_CREDITO =  '+ sDisp + coCRLF ;
//
    sSQL:= sSQL +
           '                 ) CP,' + coCRLF +
//HERJA ENERO 2013
	   '	             (' + coCRLF +
	   '		      SELECT CT.ID_CREDITO, CT.ID_PERIODO,' + coCRLF +
	   '		             NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP' + coCRLF +
	   '		        FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT' + coCRLF +
	   '		       WHERE 1=1' + coCRLF +
	   '		         AND CT.SIT_TRANSACCION = ''AC''' + coCRLF +
	   '		         AND CT.ID_TRANS_CANCELA IS NULL' + coCRLF +
	   '		         AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION' + coCRLF +
	   '		         AND CT.CVE_OPERACION IN (''PGDMCP'')' + coCRLF +
	   '		         AND CDT.CVE_CONCEPTO IN (''IMPBRU'')' + coCRLF +
	   '		       GROUP BY CT.ID_CREDITO, CT.ID_PERIODO' + coCRLF +
	   '		      ) CA_HIST_PGDMCP,' + coCRLF +
// FIN HERJA
           '                (SELECT CHC.ID_CREDITO' + coCRLF +
           '                   FROM CR_CREDITO CC,' + coCRLF +
           '                       (SELECT * FROM CR_HISTO_CRED CHC' + coCRLF +
           '                         WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) + coCRLF +
           '                           AND CHC.F_TRASPASO_VENC IS NULL' + coCRLF +
           '                        ) CHC' + coCRLF +
           '                  WHERE CHC.ID_CREDITO = CC.ID_CREDITO' +  coCRLF ;
                  If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp +  coCRLF ;
    sSQL:= sSQL +
           '                  UNION' + coCRLF +
           '                 SELECT CC.ID_CREDITO' + coCRLF +
           '                   FROM CR_CREDITO CC' + coCRLF +
           '                  WHERE CC.F_TRASPASO_VENC IS NULL' +coCRLF ;
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp +  coCRLF ;
    sSQL:= sSQL +
           '                )CC' + coCRLF +
           '          WHERE CP.ID_CREDITO = CC.ID_CREDITO' + coCRLF +
//HERJA ENERO 2013
	   '            AND CA_HIST_PGDMCP.ID_CREDITO (+)= CP.ID_CREDITO' +  coCRLF +
	   '            AND CA_HIST_PGDMCP.ID_PERIODO (+)= CP.NUM_PERIODO' +  coCRLF +
//FIN HERJA
           '          GROUP BY CP.ID_CREDITO' + coCRLF +
           '         UNION ALL' + coCRLF +
           '         SELECT CFA.ID_CREDITO,' + coCRLF +
           '                SUM(NVL(CFA.IMP_FINAN_ADIC,0)- (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',' + coCRLF +
           '                CFA.ID_CREDITO,CFA.NUM_PERIODO, NULL,' + SQLFecha(dFecha) + ',''V''))) AS IMPORTE' + coCRLF +
           '           FROM (SELECT * FROM CR_FINAN_ADIC CFA' + coCRLF +
           '                  WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) + coCRLF +
           '                )CFA,' + coCRLF +
           '                (SELECT CHC.ID_CREDITO ' + coCRLF +
           '                   FROM CR_CREDITO CC,' + coCRLF +
           '                       (SELECT * FROM CR_HISTO_CRED CHC' + coCRLF +
           '                         WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) + coCRLF +
           '                           AND CHC.F_TRASPASO_VENC IS NULL' + coCRLF +
           '                        ) CHC' + coCRLF +
           '                  WHERE CHC.ID_CREDITO = CC.ID_CREDITO'+  coCRLF ;
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp + coCRLF ;
    sSQL:= sSQL +
           '                  UNION' + coCRLF +
           '                 SELECT CC.ID_CREDITO' + coCRLF +
           '                   FROM CR_CREDITO CC' + coCRLF +
           '                  WHERE CC.F_TRASPASO_VENC IS NULL'+ coCRLF ;
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp+ coCRLF ;
    sSQL:= sSQL +
           '                )CC' + coCRLF +
           '          WHERE CC.ID_CREDITO = CFA.ID_CREDITO' + coCRLF +
           '          GROUP BY CFA.ID_CREDITO' + coCRLF +
           '        )VIG,' + coCRLF +
           '        (SELECT CP.ID_CREDITO,' + coCRLF +
           '                SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO,' +
//HERJA ENERO 2013
//           '                CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V'')))AS IMPORTE' + coCRLF +
           '                CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V'')) + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) )AS IMPORTE' + coCRLF +
//
           '           FROM (SELECT * FROM CR_CAPITAL CP' + coCRLF +
           '                  WHERE CP.F_VENCIMIENTO > ' + SQLFecha(dFecha) + coCRLF +
           '                )CP,' + coCRLF +
//HERJA ENERO 2013
	   '   	            (' + coCRLF +
	   '		     SELECT CT.ID_CREDITO, CT.ID_PERIODO,' + coCRLF +
	   '		            NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP' + coCRLF +
	   '		       FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT' + coCRLF +
	   '		      WHERE 1=1' + coCRLF +
	   '		        AND CT.SIT_TRANSACCION = ''AC''' + coCRLF +
	   '		        AND CT.ID_TRANS_CANCELA IS NULL' + coCRLF +
	   '		        AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION' + coCRLF +
	   '		        AND CT.CVE_OPERACION IN (''PGDMCP'')' + coCRLF +
	   '		        AND CDT.CVE_CONCEPTO IN (''IMPBRU'')' + coCRLF +
	   '		      GROUP BY CT.ID_CREDITO, CT.ID_PERIODO' + coCRLF +
	   '		     ) CA_HIST_PGDMCP,' + coCRLF +
// FIN HERJA
           '                (SELECT CHC.ID_CREDITO ' + coCRLF +
           '                   FROM CR_CREDITO CC,' + coCRLF +
           '                       (SELECT * FROM CR_HISTO_CRED CHC' + coCRLF +
           '                         WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) + coCRLF +
           '                           AND CHC.F_TRASPASO_VENC IS NOT NULL' + coCRLF +
           '                        )CHC' + coCRLF +
           '                  WHERE CHC.ID_CREDITO = CC.ID_CREDITO'+ coCRLF ;
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp+ coCRLF ;
    sSQL:= sSQL +
           '                  UNION' + coCRLF +
           '                 SELECT CC.ID_CREDITO' + coCRLF +
           '                   FROM CR_CREDITO CC' + coCRLF +
           '                  WHERE CC.F_TRASPASO_VENC IS NOT NULL'+ coCRLF ;
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp+ coCRLF ;
    sSQL:= sSQL +
           '                )CC' + coCRLF +
           '          WHERE CC.ID_CREDITO = CP.ID_CREDITO' + coCRLF +
//HERJA ENERO 2013
 	   '   	        AND CA_HIST_PGDMCP.ID_CREDITO (+)= CP.ID_CREDITO'+ coCRLF +
	   '	        AND CA_HIST_PGDMCP.ID_PERIODO (+)= CP.NUM_PERIODO'+ coCRLF +
//
           '          GROUP BY CP.ID_CREDITO' + coCRLF +
           '         UNION ALL' + coCRLF +
           '         SELECT CFA.ID_CREDITO,' + coCRLF +
           '                SUM(NVL(CFA.IMP_FINAN_ADIC,0)- (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',' +
           '                CFA.ID_CREDITO,CFA.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V''))) AS IMPORTE' + coCRLF +
           '           FROM (SELECT * FROM CR_FINAN_ADIC CFA' + coCRLF +
           '                  WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) + coCRLF +
           '                )CFA,' + coCRLF +
           '                (SELECT CHC.ID_CREDITO ' + coCRLF +
           '                   FROM CR_CREDITO CC,' + coCRLF +
           '                       (SELECT * FROM CR_HISTO_CRED CHC' + coCRLF +
           '                         WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) + coCRLF +
           '                           AND CHC.F_TRASPASO_VENC IS NOT NULL' + coCRLF +
           '                        )CHC' + coCRLF +
           '                  WHERE CHC.ID_CREDITO = CC.ID_CREDITO'+ coCRLF ;
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp+ coCRLF ;
    sSQL:= sSQL +
           '                  UNION' + coCRLF +
           '                 SELECT CC.ID_CREDITO' + coCRLF +
           '                   FROM CR_CREDITO CC' + coCRLF +
           '                  WHERE CC.F_TRASPASO_VENC IS NOT NULL' + coCRLF ;
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp+ coCRLF ;
    sSQL:= sSQL +
           '                )CC' + coCRLF +
           '          WHERE CC.ID_CREDITO = CFA.ID_CREDITO' + coCRLF +
           '          GROUP BY CFA.ID_CREDITO' + coCRLF +
           '        )NE,' + coCRLF +
           '        (SELECT CP.ID_CREDITO,' + coCRLF +
           '                SUM(NVL(CP.IMP_CAPITAL,0) - (PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO,' +
//HERJA ENERO 2013
//           '                CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V'')))AS IMPORTE' + coCRLF +
           '                CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V'')) + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) )AS IMPORTE' + coCRLF +
//
           '           FROM (SELECT * FROM CR_CAPITAL CP' + coCRLF +
           '                 WHERE CP.F_PROG_PAGO <= ' + SQLFecha(dFecha) + coCRLF +
           '                  AND ((CP.F_PROG_PAGO < CP.F_PAGO AND CP.SIT_CAPITAL <> ''CA''' + coCRLF +
           '                  AND   CP.F_PAGO > ' + SQLFecha(dFecha) + ')' + coCRLF +
           '                  OR CP.SIT_CAPITAL = ''IM'')' + coCRLF +
           '                )CP,' + coCRLF +
//HERJA ENERO 2013
	   '  	            (' + coCRLF +
	   '		     SELECT CT.ID_CREDITO, CT.ID_PERIODO,' + coCRLF +
	   '		            NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP' + coCRLF +
	   '		       FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT' + coCRLF +
	   '		      WHERE 1=1' + coCRLF +
	   '		        AND CT.SIT_TRANSACCION = ''AC''' + coCRLF +
	   '		        AND CT.ID_TRANS_CANCELA IS NULL' + coCRLF +
	   '		        AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION' + coCRLF +
	   '		        AND CT.CVE_OPERACION IN (''PGDMCP'')' + coCRLF +
	   '		        AND CDT.CVE_CONCEPTO IN (''IMPBRU'')' + coCRLF +
	   '		      GROUP BY CT.ID_CREDITO, CT.ID_PERIODO' + coCRLF +
	   '		     ) CA_HIST_PGDMCP,' + coCRLF +
//
           '                (SELECT CHC.ID_CREDITO' + coCRLF +
           '                   FROM CR_CREDITO CC,' + coCRLF +
           '                       (SELECT * FROM CR_HISTO_CRED CHC' + coCRLF +
           '                         WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) + coCRLF +
           '                           AND CHC.F_TRASPASO_VENC IS NULL' + coCRLF +
           '                        ) CHC' + coCRLF +
           '                  WHERE CHC.ID_CREDITO = CC.ID_CREDITO'+ coCRLF ;
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp+ coCRLF ;
    sSQL:= sSQL +
           '                  UNION' + coCRLF +
           '                 SELECT CC.ID_CREDITO' + coCRLF +
           '                   FROM CR_CREDITO CC' + coCRLF +
           '                  WHERE CC.F_TRASPASO_VENC IS NULL'+ coCRLF ;
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp+ coCRLF ;
    sSQL:= sSQL +
           '                )CC' + coCRLF +
           '          WHERE CC.ID_CREDITO = CP.ID_CREDITO' + coCRLF +
// HERJA ENERO 2013
 	   '	        AND CA_HIST_PGDMCP.ID_CREDITO (+)= CP.ID_CREDITO'+ coCRLF +
	   '	        AND CA_HIST_PGDMCP.ID_PERIODO (+)= CP.NUM_PERIODO'+ coCRLF +
//
           '          GROUP BY CP.ID_CREDITO' + coCRLF +
           '         UNION ALL' + coCRLF +
           '         SELECT CFA.ID_CREDITO,' + coCRLF +
           '                SUM(NVL(CFA.IMP_FINAN_ADIC,0)- (PKGCRCOMUN.STPOBTIMPPAGADO( ''FN'',''IMPBRU'','  +
           '                CFA.ID_CREDITO,CFA.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V''))) AS IMPORTE' + coCRLF +
           '           FROM (SELECT * FROM CR_FINAN_ADIC CFA' + coCRLF +
           '                 WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) + coCRLF +
           '                 AND   CFA.F_PROG_PAGO <= ' + SQLFecha(dFecha) + coCRLF +
           '                 AND ((CFA.F_PROG_PAGO < CFA.F_PAGO AND CFA.SIT_FINAN_ADIC <> ''CA''' + coCRLF +
           '                 AND   CFA.F_PAGO > ' + SQLFecha(dFecha) + ')' + coCRLF +
           '                  OR   CFA.SIT_FINAN_ADIC = ''IM'')' + coCRLF +
           '                )CFA,' + coCRLF +
           '                (SELECT CHC.ID_CREDITO' + coCRLF +
           '                   FROM CR_CREDITO CC,' + coCRLF +
           '                       (SELECT * FROM CR_HISTO_CRED CHC' + coCRLF +
           '                         WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) + coCRLF +
           '                           AND CHC.F_TRASPASO_VENC IS NULL) CHC' + coCRLF +
           '                  WHERE CHC.ID_CREDITO = CC.ID_CREDITO' +coCRLF ;
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp+ coCRLF ;
    sSQL:= sSQL +
           '                  UNION' + coCRLF +
           '                 SELECT CC.ID_CREDITO' + coCRLF +
           '                   FROM CR_CREDITO CC' + coCRLF +
           '                  WHERE CC.F_TRASPASO_VENC IS NULL'+ coCRLF ;
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp+ coCRLF ;
    sSQL:= sSQL +
           '                )CC' + coCRLF +
           '          WHERE CC.ID_CREDITO = CFA.ID_CREDITO' + coCRLF +
           '          GROUP BY CFA.ID_CREDITO' + coCRLF +
           '        )IMP,' + coCRLF +
           '        (SELECT CP.ID_CREDITO,' + coCRLF +
           '                SUM(NVL(CP.IMP_CAPITAL,0) -(PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'' ,CP.ID_CREDITO,' +
// HERJA ENERO 2013
//           '                CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V'')))AS IMPORTE' + coCRLF +
          '                CP.NUM_PERIODO,NULL,' + SQLFecha(dFecha) + ',''V''))  + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) )AS IMPORTE' + coCRLF +
//
           '           FROM (SELECT * FROM CR_CAPITAL CP' + coCRLF +
           '                 WHERE   CP.F_PROG_PAGO <= ' + SQLFecha(dFecha) + coCRLF +
           '                 AND   ((CP.F_PROG_PAGO < CP.F_PAGO AND CP.SIT_CAPITAL <>''CA''' + coCRLF +
           '                 AND     CP.F_PAGO > ' + SQLFecha(dFecha) + ')' + coCRLF +
           '                  OR     CP.SIT_CAPITAL = ''IM''))CP,' + coCRLF +
// HERJA ENERO 2013
	   '		    (' + coCRLF +
	   '		     SELECT CT.ID_CREDITO, CT.ID_PERIODO,' + coCRLF +
	   '		            NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP' + coCRLF +
	   '		       FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT' + coCRLF +
	   '		      WHERE 1=1' + coCRLF +
	   '		        AND CT.SIT_TRANSACCION = ''AC''' + coCRLF +
	   '		        AND CT.ID_TRANS_CANCELA IS NULL' + coCRLF +
	   '		        AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION' + coCRLF +
	   '		        AND CT.CVE_OPERACION IN (''PGDMCP'')' + coCRLF +
	   '		        AND CDT.CVE_CONCEPTO IN (''IMPBRU'')' + coCRLF +
	   '		      GROUP BY CT.ID_CREDITO, CT.ID_PERIODO' + coCRLF +
	   '		     ) CA_HIST_PGDMCP,' + coCRLF +
//
           '                (SELECT CHC.ID_CREDITO  ' + coCRLF +
           '                   FROM CR_CREDITO CC,' + coCRLF +
           '                       (SELECT * FROM CR_HISTO_CRED CHC' + coCRLF +
           '                         WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) + coCRLF +
           '                           AND CHC.F_TRASPASO_VENC IS NOT NULL)CHC' + coCRLF +
           '                  WHERE CHC.ID_CREDITO = CC.ID_CREDITO'+ coCRLF ;
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp+ coCRLF ;
    sSQL:= sSQL +
           '                  UNION' + coCRLF +
           '                 SELECT CC.ID_CREDITO' + coCRLF +
           '                   FROM CR_CREDITO CC' + coCRLF +
           '                  WHERE CC.F_TRASPASO_VENC IS NOT NULL'+ coCRLF ;
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp+ coCRLF ;
    sSQL:= sSQL +
           '                )CC' + coCRLF +
           '          WHERE CC.ID_CREDITO = CP.ID_CREDITO' + coCRLF +
// HERJA ENERO 2013
	   '  	        AND CA_HIST_PGDMCP.ID_CREDITO (+)= CP.ID_CREDITO'+ coCRLF +
	   '	        AND CA_HIST_PGDMCP.ID_PERIODO (+)= CP.NUM_PERIODO'+ coCRLF +
//
           '          GROUP BY CP.ID_CREDITO' + coCRLF +
           '         UNION ALL' + coCRLF +
           '         SELECT CFA.ID_CREDITO,' + coCRLF +
           '                SUM(NVL(CFA.IMP_FINAN_ADIC,0)- (PKGCRCOMUN.STPOBTIMPPAGADO(''FN'', ''IMPBRU'',CFA.ID_CREDITO,CFA.NUM_PERIODO,' +
           '                 NULL,' + SQLFecha(dFecha) + ',''V''))) AS IMPORTE' + coCRLF +
           '           FROM (SELECT *  FROM CR_FINAN_ADIC CFA' + coCRLF +
           '                 WHERE CFA.F_VENCIMIENTO > ' + SQLFecha(dFecha) + coCRLF +
           '                 AND CFA.F_PROG_PAGO <= ' + SQLFecha(dFecha) + coCRLF +
           '                 AND ((CFA.F_PROG_PAGO < CFA.F_PAGO AND CFA.SIT_FINAN_ADIC <> ''CA'''+ coCRLF +
           '                 AND   CFA.F_PAGO > ' + SQLFecha(dFecha) + ')' + coCRLF +
           '                 OR CFA.SIT_FINAN_ADIC = ''IM'')) CFA,' + coCRLF +
           '                (SELECT CHC.ID_CREDITO ' + coCRLF +
           '                   FROM CR_CREDITO CC,' + coCRLF +
           '                        (SELECT * FROM CR_HISTO_CRED CHC' + coCRLF +
           '                          WHERE CHC.F_CIERRE = ' + SQLFecha(dFecha) + coCRLF +
           '                            AND CHC.F_TRASPASO_VENC IS NOT NULL' + coCRLF +
           '                        )CHC' + coCRLF +
           '                  WHERE CHC.ID_CREDITO = CC.ID_CREDITO'+ coCRLF ;
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp+ coCRLF ;
    sSQL:= sSQL +
           '                  UNION' + coCRLF +
           '                 SELECT CC.ID_CREDITO' + coCRLF +
           '                   FROM CR_CREDITO CC' + coCRLF +
           '                  WHERE CC.F_TRASPASO_VENC IS NOT NULL'+ coCRLF ;
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO = '+ sDisp+ coCRLF ;
    sSQL:= sSQL +
           '                )CC' + coCRLF +
           '          WHERE CC.ID_CREDITO = CFA.ID_CREDITO' + coCRLF +
           '          GROUP BY CFA.ID_CREDITO' + coCRLF +
           '        )EXIG' + coCRLF +
           ' WHERE VIG.ID_CREDITO (+)= CC.ID_CREDITO' + coCRLF +
           '   AND NE.ID_CREDITO (+)= CC.ID_CREDITO' + coCRLF +
           '   AND IMP.ID_CREDITO (+)= CC.ID_CREDITO' + coCRLF +
           '   AND EXIG.ID_CREDITO (+)= CC.ID_CREDITO' + coCRLF +
           ' GROUP BY CC.ID_TITULAR' + coCRLF +
           ' )ACR,' + coCRLF +
           ' (SELECT CTO.ID_TITULAR, CC.F_VENCIMIENTO, SUM(AMORTIZACION)AMORTIZACION,' + coCRLF +
// HERJA ENERO 2013
//           '         SUM(PAGADO)PAGADO, (SUM(AMORTIZACION)-SUM(PAGADO))VENCIDO,' + coCRLF +
           '         SUM(PAGADO)PAGADO, (SUM(AMORTIZACION)-SUM(PAGADO) + SUM(PAGOANT) )VENCIDO,' + coCRLF +
//
           '         SUM(SDO_INSOLUTO_CP)SDO_INSOLUTO_CP' + coCRLF +
           '    FROM' + coCRLF +
           '   (SELECT CC.*,' + coCRLF +
           '        (SELECT SUM(CP.IMP_CAPITAL) -' + coCRLF +
           '                SUM(DECODE(SIGN(CC.F_VENCIMIENTO-CP.F_VENCIMIENTO),1, CP.IMP_CAPITAL, 0)) +' + coCRLF +
           '                SUM(DECODE(SIGN(CC.F_VENCIMIENTO-CP.F_VENCIMIENTO),0, CP.IMP_CAPITAL, 0))' + coCRLF +
           '           FROM CR_CAPITAL CP' + coCRLF +
           '          WHERE CP.ID_CREDITO = CC.ID_CREDITO' + coCRLF +
           '         ) AS SDO_INSOLUTO_CP' + coCRLF +
           '    FROM (SELECT ID_CREDITO, F_VENCIMIENTO, SUM(AMORTIZACION) AMORTIZACION,' + coCRLF +
//HERJA ENERO 2013
//           '                 SUM(PAGADO)PAGADO, (SUM(AMORTIZACION)-SUM(PAGADO))VENCIDO' + coCRLF +
           '                 SUM(PAGADO)PAGADO, (SUM(AMORTIZACION)-SUM(PAGADO))VENCIDO ,NVL(SUM(PAGOANT),0) PAGOANT' + coCRLF +
//
           '            FROM (SELECT CP.ID_CREDITO, SUM(NVL(CP.IMP_CAPITAL,0)) AMORTIZACION,' + coCRLF +
           '                         SUM(PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CP.ID_CREDITO,CP.NUM_PERIODO,' + coCRLF +
           '                         NULL,' + SQLFecha(dFecha) + ',''V''))AS PAGADO,' + coCRLF +
           '                         CP.F_VENCIMIENTO' + coCRLF +
           '                         ,NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) AS PAGOANT  ' + coCRLF + //HERJA ENERO 2013
           '                    FROM (SELECT * FROM CR_CREDITO CC' + coCRLF +
           '                                  WHERE CC.F_AUTORIZA <=  ' + SQLFecha(dFecha) + coCRLF +
           '                                    AND (CC.F_LIQUIDACION >=  ' + SQLFecha(dFecha) + coCRLF +
           '                                     OR CC.F_LIQUIDACION IS NULL) '+ coCRLF ;
                 If (Trim(sDisp)<>'') Then
                    sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp+ coCRLF ;
    sSQL:= sSQL +
           '                         ) CC, CR_CAPITAL CP' + coCRLF +
//HERJA ENERO 2013
	   '			    ,(' + coCRLF +
	   '			      SELECT CT.ID_CREDITO, CT.ID_PERIODO,' + coCRLF +
	   '			             NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP' + coCRLF +
	   '			        FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT' + coCRLF +
	   '			       WHERE 1=1' + coCRLF +
	   '			         AND CT.SIT_TRANSACCION = ''AC''' + coCRLF +
	   '			         AND CT.ID_TRANS_CANCELA IS NULL' + coCRLF +
	   '			         AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION' + coCRLF +
	   '			         AND CT.CVE_OPERACION IN (''PGDMCP'')' + coCRLF +
	   '			         AND CDT.CVE_CONCEPTO IN (''IMPBRU'')' + coCRLF +
	   '			       GROUP BY CT.ID_CREDITO, CT.ID_PERIODO' + coCRLF +
	   '			      ) CA_HIST_PGDMCP' + coCRLF +
           '                   WHERE CP.ID_CREDITO = CC.ID_CREDITO' + coCRLF +
	   '  		         AND CA_HIST_PGDMCP.ID_CREDITO (+)= CP.ID_CREDITO' + coCRLF +
	   '			 AND CA_HIST_PGDMCP.ID_PERIODO (+)= CP.NUM_PERIODO' + coCRLF +
           '                   GROUP BY CP.ID_CREDITO, CP.F_VENCIMIENTO ,CA_HIST_PGDMCP.IMP_HIST_PGDMCP' + coCRLF +
//           '                   WHERE CP.ID_CREDITO = CC.ID_CREDITO' + coCRLF +
//           '                   GROUP BY CP.ID_CREDITO, CP.F_VENCIMIENTO' + coCRLF +
//
           '                  UNION ALL' + coCRLF +
           '                  SELECT CFA.ID_CREDITO, SUM(NVL(CFA.IMP_FINAN_ADIC,0)) AMORTIZACION,' + coCRLF +
           '                         SUM(PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFA.ID_CREDITO,CFA.NUM_PERIODO,' + coCRLF +
           '                         NULL,' + SQLFecha(dFecha) + ', ''V''))AS PAGADO,' + coCRLF +
           '                         CFA.F_VENCIMIENTO' + coCRLF +
           '                         , 0 AS PAGOANT ' + coCRLF +  //HERJA ENERO 2013
           '                    FROM (SELECT * FROM CR_CREDITO CC' + coCRLF +
           '                                  WHERE CC.F_AUTORIZA <=  ' + SQLFecha(dFecha) + coCRLF +
           '                                    AND (CC.F_LIQUIDACION >=  ' + SQLFecha(dFecha) + coCRLF +
           '                                     OR CC.F_LIQUIDACION IS NULL)'+ coCRLF ;

                                   If (Trim(sDisp)<>'') Then
                                      sSQL:= sSQL + ' AND CC.ID_CREDITO = '+ sDisp+ coCRLF ;

    sSQL:= sSQL +
           '                         ) CC, CR_FINAN_ADIC CFA' + coCRLF +
           '                   WHERE CFA.ID_CREDITO = CC.ID_CREDITO' + coCRLF +
           '                   GROUP BY CFA.ID_CREDITO, CFA.F_VENCIMIENTO' + coCRLF +
           '                 )' + coCRLF +
           '           GROUP BY ID_CREDITO, F_VENCIMIENTO' + coCRLF +
           '         )CC' + coCRLF +
           '   )CR, CR_CREDITO CC, CONTRATO CTO' + coCRLF +
           '  WHERE CR.ID_CREDITO = CC.ID_CREDITO' + coCRLF +
           '    AND CC.ID_CONTRATO = CTO.ID_CONTRATO ' + coCRLF ;

   If (Trim(sAcreditado)<>'') Then
      sSQL:= sSQL + ' AND CTO.ID_TITULAR = '+ sAcreditado+ coCRLF ;
   If (Trim(sEmpresa)<>'') Then
      sSQL:= sSQL + ' AND CTO.ID_EMPRESA = '+ sEmpresa+ coCRLF ;
   If (Trim(sDisp)<>'') Then
      sSQL:= sSQL + ' AND CC.ID_CREDITO =  '+ sDisp+ coCRLF ;

   sSQL:= sSQL + '  GROUP BY CTO.ID_TITULAR, CC.F_VENCIMIENTO' + coCRLF +
                ' )DATOS, PERSONA PTIT' + coCRLF +
                ' WHERE DATOS.ID_TITULAR = ACR.ID_TITULAR' + coCRLF +
                '   AND ACR.ID_TITULAR = PTIT.ID_PERSONA' + coCRLF +
                ' ORDER BY ACR.ID_TITULAR, DATOS.F_VENCIMIENTO' ;

   Result:= sSQL;
End;

procedure TQrDetAcred.qrgrpFooterFechaVtoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vlMes, vlFecha_A : String;
begin
   vlMes := Copy(qyDetAcredMES.AsString,1,2);
   vlFecha_A := Copy(qyDetAcredMES.AsString,3,6);
   qrlFECHA.Caption := 'Total mes de';
   IF vlMes = '01' THEN
     qrlFECHA.Caption := qrlFECHA.Caption + ' Enero ' + vlFecha_A
   ELSE IF vlMes = '02' THEN
     qrlFECHA.Caption := qrlFECHA.Caption + ' Febrero ' + vlFecha_A
   ELSE IF vlMes = '03' THEN
     qrlFECHA.Caption := qrlFECHA.Caption + ' Marzo ' + vlFecha_A
   ELSE IF vlMes = '04' THEN
     qrlFECHA.Caption := qrlFECHA.Caption + ' Abril ' + vlFecha_A
   ELSE IF vlMes = '05' THEN
     qrlFECHA.Caption := qrlFECHA.Caption + ' Mayo ' + vlFecha_A
   ELSE IF vlMes = '06' THEN
     qrlFECHA.Caption := qrlFECHA.Caption + ' Junio ' + vlFecha_A
   ELSE IF vlMes = '07' THEN
     qrlFECHA.Caption := qrlFECHA.Caption + ' Julio ' + vlFecha_A
   ELSE IF vlMes = '08' THEN
     qrlFECHA.Caption := qrlFECHA.Caption + ' Agosto ' + vlFecha_A
   ELSE IF vlMes = '09' THEN
     qrlFECHA.Caption := qrlFECHA.Caption + ' Septiembre ' + vlFecha_A
   ELSE IF vlMes = '10' THEN
     qrlFECHA.Caption := qrlFECHA.Caption + ' Octubre ' + vlFecha_A
   ELSE IF vlMes = '11' THEN
     qrlFECHA.Caption := qrlFECHA.Caption + ' Noviembre ' + vlFecha_A
   ELSE IF vlMes = '12' THEN
     qrlFECHA.Caption := qrlFECHA.Caption + ' Diciembre ' + vlFecha_A;

end;

End.
