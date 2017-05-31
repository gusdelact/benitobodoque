unit IntMQrSenicreb;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre, UnSQL2;

type
  TQrSenicreb = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qySenicreb: TQuery;
    qySenicrebDESC_MONEDA: TStringField;
    qySenicrebNOMBRE: TStringField;
    qySenicrebRFC: TStringField;
    qySenicrebLOCALIDAD: TStringField;
    qrgrpFooterPersona: TQRBand;
    QRLabel15: TQRLabel;
    qrgrpFooterCliente: TQRBand;
    QRLabel14: TQRLabel;
    qrgrpFooterGral: TQRBand;
    qrlTOT_GRAL: TQRLabel;
    qrlDOLAR_TC: TQRLabel;
    qrlUDIS_TC: TQRLabel;
    qySenicrebACTIVIDAD: TStringField;
    qySenicrebSEC_ECONOMICO: TStringField;
    qySenicrebCVE_PER_JURIDICA: TStringField;
    qySenicrebTIP_CUENTA: TStringField;
    qySenicrebSDO: TFloatField;
    qySenicrebIMP_RENOVACION: TFloatField;
    qrDetalle: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    qySenicrebEXISTE: TFloatField;
    qySenicrebCVE_MONEDA: TFloatField;
    footerCUENTA: TQRBand;
    qrGPO_1: TQRGroup;
    qrGPO_CTE: TQRGroup;
    qrGPO_PERS: TQRGroup;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    qreTOT_SDO: TQRExpr;
    qreTOT_RENUEVA: TQRExpr;
    qrsGPO: TQRShape;
    qrTotGpoCta: TQRLabel;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape8: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    qrsSDO: TQRShape;
    qreSDOCTA: TQRExpr;
    QRShape11: TQRShape;
    QRShape15: TQRShape;
    QRDBText10: TQRDBText;
    QRExpr1: TQRExpr;
    qrGPO_CTA: TQRGroup;
    QRLabel3: TQRLabel;
    qrlTIP_CLIENTE: TQRLabel;
    QRLabel13: TQRLabel;
    qrlPER_JURIDICA: TQRLabel;
    QRShape6: TQRShape;
    QRLabel4: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    procedure qrgrpFooterPersonaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpFooterClienteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpFooterGralBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGPO_PERSBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGPO_CTEBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure footerCUENTABeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
    vgFechaMesAnt  : TDate;
    vgTCambioMesAnt: Double;
    vgTCambioUDIS  : Double;

    Function FormaQuery(sSecEco, sMoneda, sAcreditado, sLocal,
                       sActiv, sTipoCred, sTipCte, sPerJur,
                       sEmpresa, sSucursal: String;
                       bResumen : Boolean;
                       dFecha: TDateTime):String;
  end;

var
  QrSenicreb: TQrSenicreb;
  sArchivo:String;
  bGenArch: Boolean;
  F: TextFile;

Procedure RepSenicreb( sSecEco, sMoneda, sAcreditado, sLocal,
                       sActiv, sTipoCred, sTipCte, sPerJur,
                       sEmpresa, sSucursal, sNbrArch: String;
                       dFecha: TDateTime;
                       bResumen : Boolean;
                       pAPli    : TInterApli;
                       pPreview : Boolean);

Implementation
{$R *.DFM}

Procedure RepSenicreb( sSecEco, sMoneda, sAcreditado, sLocal,
                       sActiv, sTipoCred, sTipCte, sPerJur,
                       sEmpresa, sSucursal, sNbrArch: String;
                       dFecha: TDateTime;
                       bResumen : Boolean;
                       pAPli    : TInterApli;
                       pPreview : Boolean);
Var
    QrSenicreb: TQrSenicreb;
    Preview     : TIntQRPreview;

   function TipoCambio(pMoneda: String; pFecha: TDateTime) : Double;
   var vlsql, vlTipoCambio : String;
   Begin
         vlsql := ' SELECT ' +
                  ' NVL( PKGCORPO.OBTTIPOCAMBIO ( pkgrptregcr.funobtfliq(''FMAC'',''D002'','+SQLFecha(pFecha)+'), ' +
                                                      pMoneda    + ' , ' + SQLStr( CVERDAD ) + ' ), 1 ) TIPO_CAMBIO' +
                  ' FROM   DUAL ' ;

         GetSQLStr(vlsql,pAPli.DataBaseName,pAPli.SessionName,'TIPO_CAMBIO', vlTipoCambio, False);
         if vlTipoCambio = CNULL then
            vlTipoCambio := '1';
         //end if
         Result := StrToFloat(vlTipoCambio);
   end;

Begin
    QrSenicreb:=TQrSenicreb.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrSenicreb);

    Try
        bGenArch:= False;
        sArchivo:= sNbrArch;
        QrSenicreb.QRInterEncabezado1.Apli:=pApli;
        QrSenicreb.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrSenicreb.QRInterEncabezado1.NomReporte:='IntMQrSenicreb';

        If (Trim(DateTimeToStr(dFecha))<>'') Then Begin
            QrSenicreb.QRInterEncabezado1.Titulo2:='Al día de '+ Copy(DateTimeToStr(dFecha),1,2) + ' de ' +
                                                   StrMesEncabRep( DateTimeToStr(dFecha) ) + ' de ' +
                                                   Copy(DateTimeToStr(dFecha),7,8);
        end;

        QrSenicreb.qrGPO_CTA.Enabled := bResumen;
        QrSenicreb.footerCUENTA.Enabled := bResumen;
        QrSenicreb.qrTotGpoCta.Enabled := bResumen;
        QrSenicreb.qreSDOCTA.Enabled := bResumen;
        QrSenicreb.qrsGPO.Enabled := bResumen;
        QrSenicreb.qrsSDO.Enabled := bResumen;
        QrSenicreb.qrGPO_1.Enabled := bResumen;

        IF bResumen THEN begin
            QrSenicreb.QRInterEncabezado1.Titulo2:='Resumen por cuentas ' +
                                                    QrSenicreb.QRInterEncabezado1.Titulo2;
           QrSenicreb.qrGPO_CTE.Enabled := False;
           QrSenicreb.qrGPO_PERS.Enabled := False;
           QrSenicreb.qrDetalle.Enabled := False;
           QrSenicreb.qrgrpFooterPersona.Enabled := False;
           QrSenicreb.qrgrpFooterCliente.Enabled := False;
           QrSenicreb.qrlTOT_GRAL.Enabled := False;
           QrSenicreb.qreTOT_SDO.Enabled := False;
           QrSenicreb.qreTOT_RENUEVA.Enabled := False;
        end
        else begin
           QrSenicreb.qrGPO_CTE.Enabled := True;
           QrSenicreb.qrGPO_PERS.Enabled := True;
           QrSenicreb.qrDetalle.Enabled := True;
           QrSenicreb.qrgrpFooterPersona.Enabled := True;
           QrSenicreb.qrgrpFooterCliente.Enabled := True;
           QrSenicreb.qrlTOT_GRAL.Enabled := True;
           QrSenicreb.qreTOT_SDO.Enabled := True;
           QrSenicreb.qreTOT_RENUEVA.Enabled := True;
           QrSenicreb.qrGPO_CTA.Enabled := False;
        end;

        QrSenicreb.vgTCambioUDIS := ObtTipoCambio( dFecha,'800' ,
                                                   pAPli.DataBaseName, pAPli.SessionName);
        QrSenicreb.vgTCambioMesAnt := TipoCambio('840', dFecha);

        QrSenicreb.qrlDOLAR_TC.Caption := FormatFloat('###,##0.0000000',QrSenicreb.vgTCambioMesAnt);
        QrSenicreb.qrlUDIS_TC.Caption  := FormatFloat('###,##0.0000000',QrSenicreb.vgTCambioUDIS);

        QrSenicreb.qySenicreb.DatabaseName := pApli.DataBaseName;
        QrSenicreb.qySenicreb.SessionName := pApli.SessionName;
        QrSenicreb.qySenicreb.Active:=False;
        QrSenicreb.qySenicreb.SQL.Text:= QrSenicreb.FormaQuery(sSecEco, sMoneda, sAcreditado, sLocal,
                                                               sActiv, sTipoCred, sTipCte, sPerJur,
                                                               sEmpresa, sSucursal, bResumen, dFecha);
        QrSenicreb.qySenicreb.SQL.SaveToFile('C:\Senicreb_1.txt');
        QrSenicreb.qySenicreb.Active:=True;

        If Trim(sArchivo)<>'' Then Begin
           AssignFile(F, sArchivo);
           Rewrite(F);
           Writeln(F, QrSenicreb.QRInterEncabezado1.Titulo1 + #09 );
           Writeln(F, QrSenicreb.QRInterEncabezado1.Titulo2+ #09 );
           Writeln(F, #09 );
           IF bResumen THEN begin
              If Trim(sArchivo)<>'' Then Begin
                 Writeln(F, #09+'CUENTA'+#09 + 'IMPORTE'+#09);
              End;
           end
           else Begin
               Writeln(F, #09#09#09#09#09#09#09#09#09#09);
               Writeln(F, #09+'Tipo de Cambio'+#09 );
               Writeln(F, #09#09#09#09#09#09#09#09#09#09);
               Writeln(F,
                   'Tipocliente'+ #09 +
                   'Personalidad'+ #09 +
                   'Sector Económico'+ #09 +
                   'Divisa'+ #09 +
                   'R.F.C.'+ #09 +
                   'Nombre del Acreditado'+ #09 +
                   'Localidad del Usuario'+ #09 +
                   'Actividad del Usuario'+ #09 +
                   'Tipo de Crédito' +#09 +
                   'Saldo Tipo Credito Miles'+#09 +
                   'Credito Renovado Reestructurado');
           end;


        End;

        If pPreview Then
            QrSenicreb.Preview
        Else
          QrSenicreb.Print;
    Finally
        If Trim(sArchivo)<>'' Then Begin
           bGenArch:= True;
           CloseFile(F);
        End;
        QrSenicreb.free;
    End;
End;

Function TQrSenicreb.FormaQuery(sSecEco, sMoneda, sAcreditado, sLocal,
                       sActiv, sTipoCred, sTipCte, sPerJur,
                       sEmpresa, sSucursal: String;
                       bResumen : Boolean;
                       dFecha: TDateTime):String;
Var sSQL,
   sSQLINTER,
   sSQLICRE : String;
Begin
  if not bResumen then begin
  sSQL:= 'SELECT * '+ coCRLF;
  end
  else Begin
    sSQL:= 'SELECT TIP_CUENTA, SUM( SDO ) SDO, 2 EXISTE, '' '' CVE_PER_JURIDICA, '' ''SEC_ECONOMICO,  '+ coCRLF +
           '       0 CVE_MONEDA, '' '' DESC_MONEDA, '' ''RFC, '' ''NOMBRE, '' ''LOCALIDAD, '' ''ACTIVIDAD, 0 IMP_RENOVACION'+ coCRLF ;
  END;

  sSQL:= sSQL +
         'FROM ( '+ coCRLF +
         ' SELECT ID_TITULAR, PKGCRCONSOLIDADO.StpAcredSENICREB(ID_TITULAR, ' + SQLFecha(dFecha) + ' ) EXISTE, '+ coCRLF +
         '	 CVE_PER_JURIDICA, SEC_ECONOMICO, CVE_MONEDA, DESC_MONEDA, '+ coCRLF +
         '       DECODE(CVE_PER_JURIDICA,''PM'', ''0''||RFC, RFC) RFC, '+ coCRLF +
         '       NOMBRE, LOCALIDAD, ACTIVIDAD, '+ coCRLF +
         '       TIP_CUENTA, '+ coCRLF +
         '       ROUND(SUM( SALDO )*( NVL( PKGCORPO.OBTTIPOCAMBIO ( pkgrptregcr.funobtfliq(''FMAC'',''D002'','+SQLFecha(dFecha)+'), CVE_MONEDA, ' + SQLStr( CVERDAD ) + ' ), 1 ))/1000) SDO, '+ coCRLF +
         '       ROUND(SUM(IMP_RENOVACION)*( NVL( PKGCORPO.OBTTIPOCAMBIO ( pkgrptregcr.funobtfliq(''FMAC'',''D002'','+SQLFecha(dFecha)+'), CVE_MONEDA, ' + SQLStr( CVERDAD ) + ' ), 1 ))/1000) IMP_RENOVACION '+ coCRLF +
         ' FROM ( '+ coCRLF +
         '     SELECT ID_TITULAR, '+ coCRLF +
         '    	      CVE_PER_JURIDICA, SEC_ECONOMICO, CVE_MONEDA, DESC_MONEDA, RFC, NOMBRE, '+ coCRLF +
         '    	      SUBSTR(PKGCRCONSOLIDADO.SptObtLocalidad(LOCALIDAD),1,8) LOCALIDAD, ACTIVIDAD, '+ coCRLF +
         '            DECODE(SDOS.TIP_CTA,''1300'',TIP_CUENTA,SDOS.TIP_CTA)  AS TIP_CUENTA, '+ coCRLF +
         '            SDOS.SALDO, '+ coCRLF +
         '	      DECODE(TIPO_DISPOSICION, ''RN'',SDOS.SALDO,0 ) IMP_RENOVACION '+ coCRLF +
         '     FROM ( --INTERCREDITOS '+ coCRLF +
         '            SELECT CAS.ID_CREDITO,CRE.TIPO_DISPOSICION, '+ coCRLF +
         '    		     PER.CVE_PER_JURIDICA, '+ coCRLF +
         '    		     CTO.ID_TITULAR, '+ coCRLF +
         '    		     SUBSTR(PKGCRCONSOLIDADO.FUN_NOM_TIT_CRED(CTO.ID_TITULAR),1,80) AS NOMBRE, '+ coCRLF +
         '                   MON.CVE_MONEDA, '+ coCRLF +
         '    		     MON.DESC_MONEDA, '+ coCRLF +
         '                   RFC.RFC, '+ coCRLF +
         '                   CAC.CVE_LOCAL_CNBV  AS LOCALIDAD, '+ coCRLF +
         '                   CS.CVE_SENICREB   	 AS ACTIVIDAD, '+ coCRLF +
         '                   PER.CVE_TIPO_SECTOR AS SEC_ECONOMICO, '+ coCRLF +
         '                   DECODE( CSB.CVE_SUB_TIP_BCO, ''57'',DECODE(CRE.TIPO_DISPOSICION,''RN'', CTA_RENOVACION, CTC.TIPO_CUENTA)||''F'', '+ coCRLF +
         '      									       ''140'',DECODE(CRE.TIPO_DISPOSICION,''RN'', CTA_RENOVACION, CTC.TIPO_CUENTA)||''R'', '+ coCRLF +
         '     										         DECODE(CRE.TIPO_DISPOSICION,''RN'', CTA_RENOVACION, CTC.TIPO_CUENTA) )					  AS TIP_CUENTA '+ coCRLF +
         '            FROM CR_CON_ADEUDO_SDO   CAS, '+ coCRLF +
         '                 CRE_CREDITO         CRE, '+ coCRLF +
         '                 CONTRATO            CTO, '+ coCRLF +
         '                 CRE_CLIENTE         CAC, '+ coCRLF +
         '                 MONEDA              MON, '+ coCRLF +
         '                 CRE_GRUPO_EMPR      CGE, '+ coCRLF +
         '                 CRE_TIPO_CREDITO    CTC, '+ coCRLF +
         '                 CRE_CAT_MINIMO      CCM, '+ coCRLF +
         '                 CRE_CONTRATO        CCTO, '+ coCRLF +
         '                 CRE_SUB_TIP_BCO     CSB, '+ coCRLF +
         '                 CRE_SUB_TIP_CNBV    CSC, '+ coCRLF +
         '                 CRE_GPO_INGRESO     CPG, '+ coCRLF +
         '                 CRE_PRESUPUESTO     CRP, '+ coCRLF +
         '                 PERSONA             PER, '+ coCRLF +
         '                 ( SELECT ID_PERSONA, RFC.SIGLAS_RFC||RFC.F_RFC||RFC.HOMOCLAVE_RFC RFC FROM RFC ) RFC, '+ coCRLF +
         '                 CRE_SENICREB 		 CS, '+ coCRLF +
         '                 CR_LOCAL_CNBV       CL '+ coCRLF +
         '           WHERE CTO.ID_EMPRESA = '+ sEmpresa + coCRLF +
         '              AND CAS.F_CIERRE  = ' + SQLFecha(dFecha) + coCRLF +
         '             AND ( ( CSB.F_TRASPASO_ICRE IS NOT NULL AND CRE.SIT_CREDITO NOT IN ( ''TA'' ) ) '+ coCRLF +
         '                  OR CSB.F_TRASPASO_ICRE IS NULL ) '+ coCRLF +
         '             AND CRE.ID_CREDITO       = CAS.ID_CREDITO '+ coCRLF +
         '             AND CCTO.ID_CONTRATO     = CRE.ID_CONTRATO '+ coCRLF +
         '             AND CSB.CVE_SUB_TIP_BCO  = CCTO.CVE_SUB_TIP_BCO '+ coCRLF +
         '             AND CCM.CVE_CAT_MIN(+)   = CCTO.CVE_CAT_MIN '+ coCRLF +
         '             AND MON.CVE_MONEDA       = CTO.CVE_MONEDA '+ coCRLF +
         '             AND CTO.ID_CONTRATO      = CCTO.ID_CONTRATO '+ coCRLF +
         '             AND CAC.ID_PERSONA       = CTO.ID_TITULAR '+ coCRLF +
         '             AND CGE.CVE_GRUPO(+)     = CAC.CVE_GRUPO '+ coCRLF +
         '             AND CSB.CVE_SUB_TIP_CNBV = CSC.CVE_SUB_TIP_CNBV '+ coCRLF +
         '             AND CTC.CVE_TIPO_CREDITO = CSC.CVE_TIPO_CREDITO '+ coCRLF +
         '             AND CPG.CVE_GPO_INGRESO  = CRP.CVE_GPO_INGRESO '+ coCRLF +
         '             AND CRP.CVE_PRESUPUESTO  = CRE.CVE_PRESUPUESTO '+ coCRLF +
         '             AND PER.ID_PERSONA       = CAC.ID_PERSONA '+ coCRLF +
         '             AND RFC.ID_PERSONA(+)    = CAC.ID_PERSONA '+ coCRLF +
         '             AND CS.CVE_SENICREB      = CAC.CVE_SENICREB '+ coCRLF +
         '             AND CL.CVE_LOCAL_CNBV(+) = CAC.CVE_LOCAL_CNBV '+ coCRLF +
         '      UNION ALL --ICRE '+ coCRLF +
         '            SELECT CAS.ID_CREDITO, CRE.TIPO_DISPOSICION, '+ coCRLF +
         '    		     PER.CVE_PER_JURIDICA, '+ coCRLF +
         '    		     CTO.ID_TITULAR, '+ coCRLF +
         '    		     SUBSTR(PKGCRCONSOLIDADO.FUN_NOM_TIT_CRED(CTO.ID_TITULAR),1,80) NOMBRE, '+ coCRLF +
         '                   MON.CVE_MONEDA, '+ coCRLF +
         '    		     MON.DESC_MONEDA, '+ coCRLF +
         '                   RFC.RFC, '+ coCRLF +
         '                   CAC.CVE_LOCAL_CNBV   AS LOCALIDAD, '+ coCRLF +
         '                   CS.CVE_SENICREB     AS ACTIVIDAD, '+ coCRLF +
         '                   PER.CVE_TIPO_SECTOR AS SEC_ECONOMICO, '+ coCRLF +
         '    	  	     SUBSTR(PKGCRCONSOLIDADO.FUN_CR_CTASCONTAB( CTO.ID_EMPRESA, MON.CVE_MONEDA, '+ coCRLF +
         '    					      	CPR.CVE_PRODUCTO_CRE, ''CI'' ),1,2) ||SUBSTR(PKGCRCONSOLIDADO.FUN_CR_CTASCONTAB( CTO.ID_EMPRESA, MON.CVE_MONEDA, '+ coCRLF +
         '    					      	CPR.CVE_PRODUCTO_CRE, ''CI'' ),7,2) AS TIP_CUENTA '+ coCRLF +
         '            FROM CR_CON_ADEUDO_SDO   CAS, '+ coCRLF +
         '                 CR_CREDITO          CRE, '+ coCRLF +
         '                 CR_CONTRATO         CCTO, '+ coCRLF +
         '                 CR_PRODUCTO         CPR, '+ coCRLF +
         '                 CR_PROD_SUB_TIPO    CPS, '+ coCRLF +
         '                 CR_FND_CREDITO      CFN, '+ coCRLF +
         '                 CONTRATO            CTO, '+ coCRLF +
         '                 CR_ACREDITADO       CAC, '+ coCRLF +
         '                 MONEDA              MON, '+ coCRLF +
         '                 CR_GRUPO_ECO        CGE, '+ coCRLF +
         '                 CR_CAT_MINIMO       CCM, '+ coCRLF +
         '                 CRE_PRESUPUESTO     CRP, '+ coCRLF +
         '                 PERSONA             PER, '+ coCRLF +
         '                 ( SELECT ID_PERSONA, RFC.SIGLAS_RFC||RFC.F_RFC||RFC.HOMOCLAVE_RFC RFC FROM RFC ) RFC, '+ coCRLF +
         '                 CRE_SENICREB 		 CS, '+ coCRLF +
         '                 CR_LOCAL_CNBV       CL '+ coCRLF +
         '            WHERE CTO.ID_EMPRESA = '+ sEmpresa + coCRLF +
         '              AND CAS.F_CIERRE           =  ' + SQLFecha(dFecha) + coCRLF +
         '              AND CRE.ID_CREDITO         = CAS.ID_CREDITO '+ coCRLF +
         '              AND CCTO.ID_CONTRATO       = CRE.ID_CONTRATO '+ coCRLF +
         '              AND CPR.CVE_PRODUCTO_CRE   = CCTO.CVE_PRODUCTO_CRE '+ coCRLF +
         '              AND CFN.ID_CREDITO(+)      = CRE.ID_CREDITO '+ coCRLF +
         '              AND CCM.CVE_CAT_MINIMO(+)  = CPR.CVE_CLAS_CONTAB '+ coCRLF +
         '              AND MON.CVE_MONEDA         = CCTO.CVE_MONEDA '+ coCRLF +
         '              AND CTO.ID_CONTRATO        = CCTO.ID_CONTRATO '+ coCRLF +
         '              AND CAC.ID_ACREDITADO      = CTO.ID_TITULAR '+ coCRLF +
         '              AND CGE.CVE_GRUPO_ECO(+)   = CAC.CVE_GRUPO_ECO '+ coCRLF +
         '              AND CPR.CVE_PRODUCTO_CRE   = CPS.CVE_PRODUCTO_CRE '+ coCRLF +
         '              AND CRP.CVE_PRESUPUESTO    = CPR.CVE_PRESUPUESTO '+ coCRLF +
         '              AND PER.ID_PERSONA         = CAC.ID_ACREDITADO '+ coCRLF +
         '              AND RFC.ID_PERSONA(+)      = CAC.ID_ACREDITADO '+ coCRLF +
         '              AND CS.CVE_SENICREB(+)     = CAC.CVE_SENICREB '+ coCRLF +
         '              AND CL.CVE_LOCAL_CNBV(+)   = CAC.CVE_LOCAL_CNBV '+ coCRLF +
         '              AND CPR.CVE_PRODUCTO_CRE   = CPS.CVE_PRODUCTO_CRE '+ coCRLF +
         '          )DATOS, '+ coCRLF +
         '         (  SELECT * '+ coCRLF +
         '            FROM ( '+ coCRLF +
         '                    SELECT ID_CREDITO, '+ coCRLF +
         '                           ''1300'' TIP_CTA, '+ coCRLF +
         '                           (IMP_CAP_VIG + IMP_CAP_IMP ) SALDO '+ coCRLF +
         '                    FROM CR_CON_ADEUDO_SDO WHERE F_CIERRE =  ' + SQLFecha(dFecha) + coCRLF +
         '                    UNION '+ coCRLF +
         '                    SELECT ID_CREDITO, '+ coCRLF +
         '                           ''1319'' TIP_CTA, '+ coCRLF +
         '                           (IMP_INT_VIG + IMP_INT_IMP ) SALDO '+ coCRLF +
         '                    FROM CR_CON_ADEUDO_SDO WHERE F_CIERRE =  ' + SQLFecha(dFecha) + coCRLF +
         '                    UNION '+ coCRLF +
         '                    SELECT ID_CREDITO, '+ coCRLF +
         '                           ''1314'' TIP_CTA, '+ coCRLF +
         '                           ( IMP_CAP_VDO_EX + IMP_CAP_VDO_NE) SALDO '+ coCRLF +
         '                    FROM CR_CON_ADEUDO_SDO WHERE F_CIERRE =  ' + SQLFecha(dFecha) + coCRLF +
         '                    UNION '+ coCRLF +
         '                    SELECT ID_CREDITO, '+ coCRLF +
         '                           ''1320'' TIP_CTA, '+ coCRLF +
         '                           ( IMP_INT_VDO_EX + IMP_INT_VDO_NE) SALDO '+ coCRLF +
         '                    FROM CR_CON_ADEUDO_SDO WHERE F_CIERRE =  ' + SQLFecha(dFecha) + coCRLF +
         '                 ) '+ coCRLF +
         '            WHERE SALDO > 0 '+ coCRLF +
         '         ) SDOS '+ coCRLF +
         '    WHERE DATOS.ID_CREDITO(+)    = SDOS.ID_CREDITO '+ coCRLF +
         '    ORDER BY CVE_MONEDA, RFC, NOMBRE, SEC_ECONOMICO '+ coCRLF +
         '    ) '+ coCRLF+
         ' GROUP BY CVE_MONEDA, CVE_PER_JURIDICA, DESC_MONEDA, NOMBRE, ID_TITULAR,'+ coCRLF +
         '   	    RFC, LOCALIDAD, ACTIVIDAD, SEC_ECONOMICO, TIP_CUENTA )'+ coCRLF;

  sSQL:= sSQL +
         ' WHERE 1 = 1 '+ coCRLF;

         //FILTROS

           If (Trim(sMoneda)<>'') Then
              sSQL := sSQL + '  AND CVE_MONEDA    = '+ sMoneda + coCRLF ;
           If (Trim(sSecEco)<>'') Then
              sSQL := sSQL + '  AND SEC_ECONOMICO = '+ sSecEco + coCRLF ;
           If (Trim(sAcreditado)<>'') Then
              sSQL := sSQL + '  AND ID_TITULAR    = '+ sAcreditado + coCRLF ;
           If (Trim(sLocal)<>'') Then
              sSQL := sSQL + '  AND LOCALIDAD = '+ SQLStr(sLocal) + coCRLF ;
           If (Trim(sActiv)<>'') Then
              sSQL := sSQL + '  AND ACTIVIDAD = '+ SQLStr(sActiv) + coCRLF ;
           If (Trim(sTipoCred)<>'') Then
              sSQL := sSQL + '  AND SUBSTR(TIP_CUENTA,1,4) = '+ SQLStr(sTipoCred) + coCRLF ;
           If (Trim(sTipCte)<>'') Then
              sSQL := sSQL + '  AND EXISTE = '+ sTipCte + coCRLF ;
           If (Trim(sPerJur)<>'') Then
              sSQL := sSQL + '  AND CVE_PER_JURIDICA = '+ SQLStr(sPerJur) + coCRLF ;

         if not bResumen then begin
  sSQL:= sSQL +
         ' ORDER BY EXISTE, CVE_PER_JURIDICA '+ coCRLF;
         END
         else begin
  sSQL:= sSQL +
         ' GROUP BY TIP_CUENTA '+ coCRLF +
         ' ORDER BY TIP_CUENTA '+ coCRLF;
         end;

   Result:= sSQL;
End;

procedure TQrSenicreb.qrgrpFooterPersonaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total por Personalidad Juridica' +#09#09#09#09#09#09+
                  FormatFloat('#################0',QRExpr2.Value.dblResult)+#09 +
                  FormatFloat('#################0',QRExpr4.Value.dblResult)+#09
             );
   End;
end;

procedure TQrSenicreb.qrgrpFooterClienteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total por Cliente' +#09#09#09#09#09#09+
                  FormatFloat('#################0',QRExpr3.Value.dblResult)+#09 +
                  FormatFloat('#################0',QRExpr5.Value.dblResult)+#09
             );
   End;
end;

procedure TQrSenicreb.qrgrpFooterGralBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      IF qrTotGpoCta.Enabled THEN begin
         Writeln(F,  'Total General' +#09#09+
                     FormatFloat('#################0',qreTOT_SDO.Value.dblResult)+#09
                );
      end
      else begin
         Writeln(F, #09#09#09 + 'Total General' +#09#09#09#09#09#09+
                     FormatFloat('#################0',qreTOT_SDO.Value.dblResult)+#09 +
                     FormatFloat('#################0',qreTOT_RENUEVA.Value.dblResult)+#09
                );
      end;
   End;
end;

procedure TQrSenicreb.qrDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var vlActividad, vlLocalidad: String;
begin
      If sArchivo <>'' Then Begin
         Writeln(F,
                  qrlTIP_CLIENTE.Caption + #09 +
                  qrlPER_JURIDICA.Caption + #09 +
                  qySenicreb.FieldByName('SEC_ECONOMICO').AsString + #09 +
                  qySenicreb.FieldByName('DESC_MONEDA').AsString + #09 +
                  qySenicreb.FieldByName('RFC').AsString + #09 +
                  qySenicreb.FieldByName('NOMBRE').AsString + #09 +
                  #39 + qySenicreb.FieldByName('LOCALIDAD').AsString + #09 +
                  #39 + qySenicreb.FieldByName('ACTIVIDAD').AsString  + #09 +
                  qySenicreb.FieldByName('TIP_CUENTA').AsString + #09 +
                  FormatFloat('#################0',qySenicreb.FieldByName('SDO').AsFloat) + #09+
                  FormatFloat('#################0',qySenicreb.FieldByName('IMP_RENOVACION').AsFloat));
        End;
end;

procedure TQrSenicreb.qrGPO_PERSBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   IF qySenicreb.FieldByName('CVE_PER_JURIDICA').AsString = 'PM' THEN
      qrlPER_JURIDICA.Caption := 'MORALES'
   ELSE
      qrlPER_JURIDICA.Caption := 'FISICAS';
end;

procedure TQrSenicreb.qrGPO_CTEBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   IF qySenicreb.FieldByName('EXISTE').AsInteger = 1 THEN
      qrlTIP_CLIENTE.Caption := 'EXISTENTE'
   ELSE
      qrlTIP_CLIENTE.Caption := 'NUEVO';
end;

procedure TQrSenicreb.footerCUENTABeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09+
                  qySenicreb.FieldByName('TIP_CUENTA').AsString + #09 +
                  FormatFloat('#################0',QRExpr1.Value.dblResult)+#09
             );
   End;

end;

End.
