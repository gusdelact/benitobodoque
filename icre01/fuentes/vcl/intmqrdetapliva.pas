unit IntMQRDetApliVA;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Dialogs, IntHead, Db, InterApl,
  DBTables,  unSQL2, IntQRPreview, IntGenCre, ComObj, IntXls;

Const
   coCRLF      = #13#10;

type
  TQRDetApliVA = class(TQuickRep)
    qyDetApliva: TQuery;
    qyDetAplivaCVE_MONEDA: TFloatField;
    qyDetAplivaDESC_MONEDA: TStringField;
    qyDetAplivaID_PERSONA: TFloatField;
    qyDetAplivaNOMBRE: TStringField;
    qyDetAplivaCVERFC: TStringField;
    qyDetAplivaMESPER: TStringField;
    qyDetAplivaANIOPER: TStringField;
    qyDetAplivaCVE_PROD: TStringField;
    qyDetAplivaID_CONTRATO: TFloatField;
    qyDetAplivaID_CREDITO: TFloatField;
    qyDetAplivaID_PERIODO: TFloatField;
    qyDetAplivaF_OPERACION: TDateTimeField;
    qyDetAplivaIVA_DEVENGADO: TFloatField;
    qyDetAplivaIVA_PAGADO: TFloatField;
    qyDetAplivaIVA_X_PAG: TFloatField;
    qyDetAplivaSIT_IVA: TStringField;
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRBand2: TQRBand;
    QRGroupCont: TQRGroup;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabelPERIODO: TQRLabel;
    QRLabelID_CREDITO: TQRLabel;
    QRLabelPRODUCTO: TQRLabel;
    QRLabelNUM_PERIODO: TQRLabel;
    QRLabel_IVA_DEV: TQRLabel;
    QRLabel_IVA_PAG: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabelSIT_IVA: TQRLabel;
    QRGroupMoneda: TQRGroup;
    QRShapeMoneda: TQRShape;
    QRLabelMoneda: TQRLabel;
    QRDBCVE_MONEDA: TQRDBText;
    QRDBDESC_MONEDA: TQRDBText;
    QRGroupAcreditado: TQRGroup;
    QRDB_NOMBRE: TQRDBText;
    QRDB_ID_PERSONA: TQRDBText;
    QRLabelACREDITADO: TQRLabel;
    QRLabelRFC: TQRLabel;
    QRDB_CVERFC: TQRDBText;
    QRBandDetalle: TQRBand;
    QRDB_MESPER: TQRDBText;
    QRDB_ID_CREDITO: TQRDBText;
    QRDB_IVA_X_PAG: TQRDBText;
    QRDB_ID_PERIODO: TQRDBText;
    QRDB_CVE_PROD: TQRDBText;
    QRDB_IVA_PAGADO: TQRDBText;
    QRDB_IVA_DEVENGADO: TQRDBText;
    QRDB_ANIOPER: TQRDBText;
    QRFooterAcreditado: TQRBand;
    QRLabelTotalXacreditado: TQRLabel;
    QRShape15: TQRShape;
    Tot_IVADEV_TA: TQRExpr;
    Tot_IVAPAG_TA: TQRExpr;
    Tot_IVA_X_PAG_TA: TQRExpr;
    QRFooterMoneda: TQRBand;
    QRShape13: TQRShape;
    QRLabel1: TQRLabel;
    Tot_IVADEV_TM: TQRExpr;
    Tot_IVAPAG_TM: TQRExpr;
    Tot_IVA_X_PAG_TM: TQRExpr;
    QRFooterCont: TQRBand;
    QRLabel45: TQRLabel;
    QRShape19: TQRShape;
    Tot_IVA_X_PAG_GT: TQRExpr;
    Tot_IVAPAG_GT: TQRExpr;
    Tot_IVADEV_GT: TQRExpr;
    SummaryBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRLabel2: TQRLabel;
    QRGroupCredito: TQRGroup;
    QRGroupPeriodo: TQRGroup;
    QRFooterPeriodo: TQRBand;
    QRFooterCredito: TQRBand;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    qyDetAplivaFIN_PERIODO: TDateTimeField;
    qyDetAplivaCVE_OPERACION: TStringField;
    qyDetAplivaFK_FECHASDO: TDateTimeField;
    qyDetAplivaINTERES: TFloatField;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
  private

  public
    function FormaQuery(sFecha_INICIO    , sFecha_FINAL    ,
                        sAcreditado      , sCredito        , sProducto ,
                        sSituacionDePago , sTipoDeConsulta ,
                        sEmpresa         , sSucursal    :String):String;

  end;

var
  QRDetApliVA: TQRDetApliVA;

  bGenArch: Boolean;
  sArchivo:String;
  vgFechaHoy : TDateTime;
  F: TextFile;
  Apli : TInterApli;
  vgnRowExcel : Integer;
  vgExcelApp  : OleVariant;

  procedure RepDetAplicIVA(sFecha_INICIO    , sFecha_FINAL ,
                           sAcreditado      , sCredito , sProducto ,
                           sSituacionDePago , sTipoDeConsulta ,
                           sEmpresa         , sSucursal,
                           sNbrArch         : String;
                           pPreview  : Boolean;
                           pAPli     : TInterApli);

  procedure EscribeInfoXLS(sF_Inicial,sF_Final, nomArchivo:String; lQuery:TQuery);


implementation

{$R *.DFM}


procedure RepDetAplicIVA(  sFecha_INICIO    , sFecha_FINAL ,
                           sAcreditado      , sCredito , sProducto ,
                           sSituacionDePago , sTipoDeConsulta ,
                           sEmpresa         , sSucursal ,
                           sNbrArch         : String;
                           pPreview  : Boolean;
                           pAPli     : TInterApli);
var
    QRDetApliVA: TQRDetApliVA;
    VLTitulo  : String;
    Preview   : TIntQRPreview;
begin
    //ShowMessage('Mostrar Reporte');
    VLTitulo := '';
    QRDetApliVA:= TQRDetApliVA.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QRDetApliVA);
    Apli := pApli;


    Try
        vgFechaHoy  :=  pAPli.DameFechaEmpresa;
        bGenArch    :=  False;
        sArchivo    :=  sNbrArch;

        QRDetApliVA.QRInterEncabezado1.Apli := pApli;

        //QRDetApliVA.vgTipCambioDll:= ObtTipoCambio(pAPli.DameFechaEmpresaDia('D000'), IntToStr ( C_DLLS ),pAPli.DataBaseName, pAPli.SessionName);

        QRDetApliVA.QRInterEncabezado1.IdEmpresa  := pAPli.IdEmpresa;
        QRDetApliVA.QRInterEncabezado1.NomReporte := 'IntMQRDetApliVA';
        QRDetApliVA.QRInterEncabezado1.Titulo1    := 'Reporte de Detalle de Aplicación de IVA ' +
                                                     ' del: '+ sFecha_INICIO + ' al: ' + sFecha_FINAL;

        VLTitulo := '';

        //VLTitulo := VLTitulo + ' Reporte Detalle de Aplicación de IVA (REPECO) ' + coCRLF;

        If (Trim(sAcreditado)<>'') Then
            VLTitulo := VLTitulo + '  Acreditado: ' + sAcreditado;

        If (Trim(sCredito)<>'') Then   // or (Trim(sIntercredito)<>'') Then begin
            VLTitulo := VLTitulo + '  Crédito: ' + sCredito ;

            {
            VLTitulo := VLTitulo + '  Crédito: ';
            if (Trim(sCredito)<>'') And (Trim(sIntercredito)<>'') then
               VLTitulo := VLTitulo + sCredito + ', ' + sIntercredito
            else
               VLTitulo := VLTitulo + sCredito + sIntercredito;
        end;
            }


        If (Trim(sProducto)<>'') Then
            VLTitulo := VLTitulo + '  Producto: ' + sProducto;


        If (sSituacionDePago = 'T') Then
            VLTitulo := VLTitulo + '  Situación: Todos';
        If (sSituacionDePago = 'P') Then
            VLTitulo := VLTitulo + '  Situación: Pagados';
        If (sSituacionDePago = 'S') Then
            VLTitulo := VLTitulo + '  Situación: Sin Pagos';

        If (sTipoDeConsulta = 'D') Then
            VLTitulo := VLTitulo + '  [Detalle]';

        If (sTipoDeConsulta = 'G') Then begin
            VLTitulo := VLTitulo + '  [Global]';
            QRDetApliVA.QRBandDetalle.Enabled := False;
        end;



        QRDetApliVA.QRInterEncabezado1.Titulo2 := VLTitulo;

        QRDetApliVA.qyDetApliva.DatabaseName := pApli.DataBaseName;
        QRDetApliVA.qyDetApliva.SessionName  := pApli.SessionName;
        QRDetApliVA.qyDetApliva.Active:=False;


        QRDetApliVA.qyDetApliva.SQL.Text:=
               QRDetApliVA.FormaQuery(sFecha_INICIO    , sFecha_FINAL ,
                                         sAcreditado      , sCredito , sProducto ,
                                         sSituacionDePago , sTipoDeConsulta ,
                                         sEmpresa         , sSucursal );

        
        QRDetApliVA.qyDetApliva.SQL.SaveToFile('c:\qyDetApliva.SQL');
        QRDetApliVA.qyDetApliva.Active:=True;

        If Trim(sArchivo)<>'' Then
          EscribeInfoXLS(sFecha_INICIO,sFecha_FINAL,sArchivo,QRDetApliVA.qyDetApliva);

        QRDetApliVA.qyDetApliva.First;

        If pPreview Then
            QRDetApliVA.Preview
        Else
            QRDetApliVA.Print;

    Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
      End;
      QRDetApliVA.free;
      If Assigned(Preview) Then Preview.Free;
    End;

end;


{ TQRDetApliVA }

function TQRDetApliVA.FormaQuery(sFecha_INICIO    , sFecha_FINAL    ,
                        sAcreditado      , sCredito        , sProducto ,
                        sSituacionDePago , sTipoDeConsulta ,
                        sEmpresa         , sSucursal    :String):String;
var
    sSQL1         : String;
    sSQL2         : String;
begin

   sSQL1:= 'SELECT '+ coCRLF +
    ' CON.CVE_MONEDA, MON.DESC_MONEDA, '+ coCRLF +
    ' PER.ID_PERSONA, PER.NOMBRE, (RFCE.SIGLAS_RFC || RFCE.F_RFC || RFCE.HOMOCLAVE_RFC) AS CVERFC,'+ coCRLF +
    ' DECODE(TO_CHAR(PIVO.F_OPERACION,''MON''),''JAN'',''ENE'',''APR'',''ABR'', '+ coCRLF +
    ' ''AUG'',''AGO'',''DEC'',''DIC'', TO_CHAR(PIVO.F_OPERACION,''MON'') ) AS MESPER , '+ coCRLF +
    ' TO_CHAR(PIVO.F_OPERACION,''YYYY'')  AS ANIOPER , '+ coCRLF +
    ' CCO.CVE_PRODUCTO_CRE AS CVE_PROD, CCR.ID_CONTRATO, '+ coCRLF +
    ' PIVO.ID_CREDITO, '+ coCRLF + // PIVO.CVE_OPERACION,
    ' PIVO.ID_PERIODO, PIVO.F_OPERACION, '+ coCRLF +
    //' NVL(DEV.IVA_DEVENGADO,0) AS IVA_DEVENGADO, '+ coCRLF +
    //' NVL(PAG.IVA_PAGADO,0) AS IVA_PAGADO, '+ coCRLF +
    ' DEV.IVA_DEVENGADO AS IVA_DEVENGADO, '+ coCRLF +
    ' PAG.IVA_PAGADO    AS IVA_PAGADO,    '+ coCRLF +
    ' NVL(DEV.IVA_DEVENGADO,0) - NVL(PAG.IVA_PAGADO,0) AS IVA_X_PAG, '+ coCRLF +
    ' SITU.SIT_IVA , ' + coCRLF + // NUEVAS COLUMNAS
    ' (CI.F_VENCIMIENTO - 1) AS FIN_PERIODO, PIVO.CVE_OPERACION , LEAST((CI.F_VENCIMIENTO - 1), PIVO.F_OPERACION) AS FK_FECHASDO, '+ coCRLF +
    ' DECODE(PIVO.CVE_OPERACION ,''IVDEPE'' ,SDO.IMP_INT_VIG,0 ) AS INTERES ' + coCRLF +
    ' FROM '+ coCRLF +
    ' (  SELECT ID_CREDITO,  ID_PERIODO , F_OPERACION, CVE_OPERACION '+ coCRLF + //CVE_OPERACION
    '    FROM CR_TRANSACCION  '+ coCRLF +
    '  	 WHERE CVE_OPERACION IN (''IVDEPE'', ''PAGIDP'')  '+ coCRLF +
    ' 	 AND F_OPERACION BETWEEN TO_DATE('''+sFecha_INICIO+''',''DD/MM/YYYY'') AND TO_DATE('''+sFecha_FINAL+''',''DD/MM/YYYY'')  '+ coCRLF +
    '    AND SIT_TRANSACCION = ''AC''  '+ coCRLF +
    ' 	 GROUP BY ID_CREDITO, ID_PERIODO, F_OPERACION, CVE_OPERACION '+ coCRLF + //CVE_OPERACION
    ' 	 ORDER BY 1,2,3  '+ coCRLF +
    '   ) PIVO  '+ coCRLF +
    ' LEFT JOIN  '+ coCRLF +
    ' (  SELECT ID_CREDITO, ID_PERIODO, DECODE(SUM(DECODE(CVE_OPERACION,''PAGIDP'', IMP_NETO*(-1),IMP_NETO)),0,''LQ'',''AC'') AS SIT_IVA ' + coCRLF +
    '  	 FROM CR_TRANSACCION  '+ coCRLF +
    '  	 WHERE CVE_OPERACION IN (''IVDEPE'', ''PAGIDP'')  '+ coCRLF +
    ' 	 AND F_OPERACION BETWEEN TO_DATE('''+sFecha_INICIO+''',''DD/MM/YYYY'') AND TO_DATE('''+sFecha_FINAL+''',''DD/MM/YYYY'')  '+ coCRLF +
    '    AND SIT_TRANSACCION = ''AC''  '+ coCRLF +
    ' 	 GROUP BY  ID_CREDITO,  ID_PERIODO  '+ coCRLF +
    '	ORDER BY 1,2 ' + coCRLF +
    ' ) SITU  ON PIVO.ID_CREDITO    = SITU.ID_CREDITO    AND PIVO.ID_PERIODO  = SITU.ID_PERIODO ' + coCRLF +
    '  LEFT JOIN  '+ coCRLF +
    ' (  SELECT ID_CREDITO, ID_PERIODO, '+ coCRLF + // CVE_OPERACION,
    '    F_OPERACION, SUM(IMP_NETO) AS IVA_DEVENGADO FROM CR_TRANSACCION '+ coCRLF +
    '    WHERE 1=1 '+ coCRLF +
    '    AND CVE_OPERACION = ''IVDEPE'' '+ coCRLF +
    '    AND F_OPERACION BETWEEN TO_DATE(''' +sFecha_INICIO+ ''',''DD/MM/YYYY'') AND TO_DATE('''+sFecha_FINAL+ ''',''DD/MM/YYYY'') '+ coCRLF +
    '    AND SIT_TRANSACCION = ''AC'' ' + coCRLF +
    '    GROUP BY   ID_CREDITO, ID_PERIODO, '+ coCRLF + // CVE_OPERACION,
    '    F_OPERACION   '+ coCRLF +
    '    ORDER BY 1,2,3  '+ coCRLF +
    ' ) DEV '+ coCRLF +
    '   ON PIVO.ID_CREDITO    = DEV.ID_CREDITO    AND PIVO.ID_PERIODO  = DEV.ID_PERIODO   ' + coCRLF +
    //'  AND PIVO.CVE_OPERACION = DEV.CVE_OPERACION ' + coCRLF +
    '  AND PIVO.F_OPERACION = DEV.F_OPERACION  ' + coCRLF +
    ' LEFT JOIN '+ coCRLF +
    ' (  SELECT ID_CREDITO, ID_PERIODO, '+ coCRLF + //CVE_OPERACION,
    '    F_OPERACION, SUM(IMP_NETO) AS IVA_PAGADO FROM CR_TRANSACCION ' + coCRLF +
    '    WHERE 1=1 '+ coCRLF +
    '    AND CVE_OPERACION = ''PAGIDP''  '+ coCRLF +
    '    AND F_OPERACION BETWEEN TO_DATE('''+sFecha_INICIO+''',''DD/MM/YYYY'') AND TO_DATE('''+sFecha_FINAL+''',''DD/MM/YYYY'') '+ coCRLF +
    '    AND SIT_TRANSACCION = ''AC'' ' + coCRLF +
    '    GROUP BY   ID_CREDITO, ID_PERIODO, '+ coCRLF + // CVE_OPERACION,
    '    F_OPERACION ' + coCRLF +
    '    ORDER BY 1,2,3  '+ coCRLF +
    ' ) PAG '+ coCRLF +
    '  ON PIVO.ID_CREDITO    = PAG.ID_CREDITO    AND  PIVO.ID_PERIODO  = PAG.ID_PERIODO  ' + coCRLF +
    //' AND PIVO.CVE_OPERACION = PAG.CVE_OPERACION ' + coCRLF +
    ' AND  PIVO.F_OPERACION = PAG.F_OPERACION ' + coCRLF +
    ' LEFT JOIN CR_CREDITO CCR ON  PIVO.ID_CREDITO = CCR.ID_CREDITO '+ coCRLF +
    ' LEFT JOIN CR_CONTRATO CCO ON CCR.ID_CONTRATO = CCO.ID_CONTRATO '+ coCRLF +
    ' LEFT JOIN CONTRATO CON  ON CCR.ID_CONTRATO = CON.ID_CONTRATO '+ coCRLF +
    ' LEFT JOIN MONEDA  MON  ON CON.CVE_MONEDA = MON.CVE_MONEDA '+ coCRLF +
    ' LEFT JOIN PERSONA PER ON CON.ID_TITULAR = PER.ID_PERSONA AND PER.CVE_PER_JURIDICA = ''PF'' '+ coCRLF +
    ' LEFT JOIN RFC RFCE ON PER.ID_PERSONA = RFCE.ID_PERSONA '+ coCRLF +
    // NUEVAS RELACIONES
    ' LEFT JOIN CR_INTERES CI ON PIVO.ID_CREDITO = CI.ID_CREDITO AND PIVO.ID_PERIODO = CI.NUM_PERIODO '+ coCRLF +
    ' LEFT JOIN CR_CON_ADEUDO_SDO SDO ON PIVO.ID_CREDITO = SDO.ID_CREDITO AND SDO.F_CIERRE = LEAST((CI.F_VENCIMIENTO-1), PIVO.F_OPERACION) '+ coCRLF +
    ' WHERE 1= 1 '+ coCRLF ;

     if Trim(sAcreditado) <> '' then
       sSQL1 :=  sSQL1 + ' AND CON.ID_TITULAR = ' + sAcreditado + ' ' + coCRLF ;

     if Trim(sCredito) <> '' then
       sSQL1 :=  sSQL1 + ' AND PIVO.ID_CREDITO = ' + sCredito + ' ' + coCRLF ;

     if Trim(sProducto) <> '' then
       sSQL1 :=  sSQL1 + ' AND CCO.CVE_PRODUCTO_CRE = ''' + Trim(sProducto) + ''' ' + coCRLF ;

     if Trim(sSituacionDePago) = 'P' then
       sSQL1 :=  sSQL1 + ' AND SITU.SIT_IVA  =  ''LQ'' ' + coCRLF
     else if Trim(sSituacionDePago) = 'S' then
       sSQL1 :=  sSQL1 + ' AND SITU.SIT_IVA  =  ''AC'' ' + coCRLF ;


   sSQL2:= ' UNION ' + coCRLF +
    '  SELECT ' + coCRLF +
    ' CON.CVE_MONEDA, MON.DESC_MONEDA, ' + coCRLF +
    ' PER.ID_PERSONA, PER.NOMBRE, (RFCE.SIGLAS_RFC || RFCE.F_RFC || RFCE.HOMOCLAVE_RFC) AS CVERFC, ' + coCRLF +
    ' DECODE(TO_CHAR(PIVO.F_OPERACION,''MON''),''JAN'',''ENE'',''APR'',''ABR'', ' + coCRLF +
    ' ''AUG'',''AGO'',''DEC'',''DIC'',TO_CHAR(PIVO.F_OPERACION,''MON'') ) AS MESPER , ' + coCRLF +
    ' TO_CHAR(PIVO.F_OPERACION,''YYYY'')  AS ANIOPER , ' + coCRLF +
    ' TO_CHAR(CCO.CVE_SUB_TIP_BCO) AS CVE_PROD, CCR.ID_CONTRATO, ' + coCRLF +
    ' PIVO.ID_CREDITO, '+ coCRLF + //PIVO.CVE_OPERACION,
    ' PIVO.ID_PERIODO, PIVO.F_OPERACION, ' + coCRLF +
  //' NVL(DEV.IVA_DEVENGADO,0) AS IVA_DEVENGADO, ' + coCRLF +
  //' NVL(PAG.IVA_PAGADO,0) AS IVA_PAGADO, ' + coCRLF +
    ' DEV.IVA_DEVENGADO AS IVA_DEVENGADO, ' + coCRLF +
    ' PAG.IVA_PAGADO AS IVA_PAGADO, ' + coCRLF +
    ' NVL(DEV.IVA_DEVENGADO,0) - NVL(PAG.IVA_PAGADO,0) AS IVA_X_PAG, ' + coCRLF +
    ' SITU.SIT_IVA, ' + coCRLF + // NUEVAS COLUMNAS
    ' (CI.F_VENCIMIENTO - 1) AS FIN_PERIODO, PIVO.CVE_OPERACION , LEAST((CI.F_VENCIMIENTO-1), PIVO.F_OPERACION) AS FK_FECHASDO, ' + coCRLF +
    ' DECODE(PIVO.CVE_OPERACION ,''IVDEPE'' ,SDO.IMP_INT_VIG,0 ) AS INTERES ' + coCRLF +
    ' FROM ' + coCRLF +
    ' ( SELECT ID_CREDITO,  NUM_PERIODO AS ID_PERIODO, '+ coCRLF +
    '   F_LIQUIDACION AS F_OPERACION, CVE_OPERACION ' + coCRLF + //CVE_OPERACION
    '   FROM CRE_TRANSACCION ' + coCRLF +
    '  	WHERE CVE_OPERACION IN (''IVDEPE'', ''PAGIDP'')  ' + coCRLF +
    '  	AND F_LIQUIDACION BETWEEN TO_DATE('''+sFecha_INICIO+''',''DD/MM/YYYY'') AND TO_DATE('''+sFecha_FINAL+''',''DD/MM/YYYY'')  ' + coCRLF +
    '      AND SIT_TRANSACCION = ''AC'' ' + coCRLF +
    '  	GROUP BY  ID_CREDITO,  NUM_PERIODO , F_LIQUIDACION, CVE_OPERACION ' + coCRLF + //CVE_OPERACION
    '  ) PIVO  ' + coCRLF +
    ' LEFT JOIN ' + coCRLF +
    ' ( SELECT ID_CREDITO, NUM_PERIODO AS ID_PERIODO, DECODE(SUM(DECODE(CVE_OPERACION,''PAGIDP'', IMP_OPERACION*(-1),IMP_OPERACION)),0,''LQ'',''AC'') AS SIT_IVA '+ coCRLF +
	'   FROM CRE_TRANSACCION '  + coCRLF +
    '  	WHERE CVE_OPERACION IN (''IVDEPE'', ''PAGIDP'')  ' + coCRLF +
    '  	AND F_LIQUIDACION BETWEEN TO_DATE('''+sFecha_INICIO+''',''DD/MM/YYYY'') AND TO_DATE('''+sFecha_FINAL+''',''DD/MM/YYYY'')  ' + coCRLF +
    '   AND SIT_TRANSACCION = ''AC'' ' + coCRLF +
    '  	GROUP BY  ID_CREDITO,  NUM_PERIODO ' + coCRLF +
    '  	ORDER BY 1,2 '  + coCRLF +
    ' ) SITU  ON PIVO.ID_CREDITO    = SITU.ID_CREDITO    AND PIVO.ID_PERIODO  = SITU.ID_PERIODO '  + coCRLF +
    ' LEFT JOIN ' + coCRLF +
    '  (  SELECT   ID_CREDITO, NUM_PERIODO AS ID_PERIODO, '+ coCRLF + // CVE_OPERACION ,
    '     F_LIQUIDACION AS F_OPERACION, SUM(IMP_OPERACION) AS IVA_DEVENGADO ' + coCRLF +
    '     FROM CRE_TRANSACCION ' + coCRLF +
    '     WHERE 1=1 ' + coCRLF +
    '     AND CVE_OPERACION = ''IVDEPE'' ' + coCRLF +
    '     AND F_LIQUIDACION BETWEEN TO_DATE('''+sFecha_INICIO+''',''DD/MM/YYYY'') AND TO_DATE('''+sFecha_FINAL+''',''DD/MM/YYYY'') ' + coCRLF +
    '     AND SIT_TRANSACCION = ''AC'' ' + coCRLF +
    ' 	GROUP BY   ID_CREDITO, NUM_PERIODO, '+ coCRLF + // CVE_OPERACION,
    '   F_LIQUIDACION ' + coCRLF +
    ' 	) DEV ' + coCRLF +
    '    ON PIVO.ID_CREDITO    = DEV.ID_CREDITO    AND PIVO.ID_PERIODO  = DEV.ID_PERIODO  ' + coCRLF +
    //'   AND PIVO.CVE_OPERACION = DEV.CVE_OPERACION ' + coCRLF +
    '   AND PIVO.F_OPERACION = DEV.F_OPERACION ' + coCRLF +
    ' LEFT JOIN ' + coCRLF +
    ' (  SELECT   ID_CREDITO, NUM_PERIODO  AS ID_PERIODO , '+ coCRLF + //CVE_OPERACION ,
    '    F_LIQUIDACION AS F_OPERACION, SUM(IMP_OPERACION) AS IVA_PAGADO ' + coCRLF +
    '    FROM CRE_TRANSACCION ' + coCRLF +
    '    WHERE 1=1 ' + coCRLF +
    '    AND CVE_OPERACION = ''PAGIDP'' ' + coCRLF +
    '    AND F_LIQUIDACION BETWEEN TO_DATE('''+sFecha_INICIO+''',''DD/MM/YYYY'') AND TO_DATE('''+sFecha_FINAL+''',''DD/MM/YYYY'') ' + coCRLF +
    '    AND SIT_TRANSACCION = ''AC'' ' + coCRLF +
    '    GROUP BY ID_CREDITO, NUM_PERIODO , '+ coCRLF + //CVE_OPERACION,
    '    F_LIQUIDACION ' + coCRLF +
    '    ) PAG ' + coCRLF +
    ' ON  PIVO.ID_CREDITO    = PAG.ID_CREDITO    AND PIVO.ID_PERIODO  = PAG.ID_PERIODO  ' + coCRLF +
    //' AND PIVO.CVE_OPERACION = PAG.CVE_OPERACION ' + coCRLF +
    ' AND PIVO.F_OPERACION = PAG.F_OPERACION ' + coCRLF +
    '   LEFT JOIN CRE_CREDITO CCR ON   PIVO.ID_CREDITO = CCR.ID_CREDITO ' + coCRLF +
    '   LEFT JOIN CRE_CONTRATO CCO ON  CCR.ID_CONTRATO = CCO.ID_CONTRATO ' + coCRLF +
    '   LEFT JOIN CONTRATO CON ON CCR.ID_CONTRATO = CON.ID_CONTRATO ' + coCRLF +
    '   LEFT JOIN MONEDA MON ON CON.CVE_MONEDA = MON.CVE_MONEDA ' + coCRLF +
    '   LEFT JOIN PERSONA PER ON CON.ID_TITULAR = PER.ID_PERSONA AND PER.CVE_PER_JURIDICA = ''PF'' ' + coCRLF +
    '   LEFT JOIN RFC RFCE ON PER.ID_PERSONA = RFCE.ID_PERSONA ' + coCRLF +
    // NUEVAS RELACIONES
    ' LEFT JOIN CRE_INTERES CI ON PIVO.ID_CREDITO = CI.ID_CREDITO AND PIVO.ID_PERIODO = CI.NUM_PERIODO ' + coCRLF +
    ' LEFT JOIN CR_CON_ADEUDO_SDO SDO ON PIVO.ID_CREDITO = SDO.ID_CREDITO AND SDO.F_CIERRE = LEAST((CI.F_VENCIMIENTO-1), PIVO.F_OPERACION) ' + coCRLF+
    '   WHERE 1=1 ' + coCRLF ;

     if Trim(sAcreditado) <> '' then
       sSQL2 :=  sSQL2 + ' AND CON.ID_TITULAR = ' + sAcreditado + ' ' + coCRLF ;

     if Trim(sCredito) <> '' then
       sSQL2 :=  sSQL2 + ' AND PIVO.ID_CREDITO = ' + sCredito + ' ' + coCRLF ;

     if Trim(sProducto) <> '' then
       sSQL2 :=  sSQL2 + ' AND TO_CHAR(CCO.CVE_SUB_TIP_BCO) = ''' + Trim(sProducto) + ''' ' + coCRLF ;

    if Trim(sSituacionDePago) = 'P' then
       sSQL2 :=  sSQL2 + ' AND SITU.SIT_IVA  =  ''LQ'' ' + coCRLF
     else if Trim(sSituacionDePago) = 'S' then
       sSQL2 :=  sSQL2 + ' AND SITU.SIT_IVA  =  ''AC'' ' + coCRLF ;

    sSQL2 :=  sSQL2 + ' ORDER BY 1,3,10,11,12 ';

    Result:= sSQL1 + sSQL2;

end;


procedure EscribeInfoXLS(sF_Inicial,sF_Final, nomArchivo:String; lQuery:TQuery);
var
   sFecInicial : String;
   sFecFinal   : String;
begin
   vgnRowExcel:=1;
   vgExcelApp := CreateOleObject('Excel.Application');
   vgExcelApp.Workbooks.Add;
   //EscribeEncabezado (fechaCierre);
     sFecInicial:=StringReplace(sF_Inicial ,'/','',[rfReplaceAll]);
     sFecFinal:=StringReplace(sF_Final ,'/','',[rfReplaceAll]);

      vgExcelApp.Workbooks[1].WorkSheets[1].Name := 'DAplIVA-'+sFecInicial+'-'+sFecFinal;

      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A')].Value := 'CLAVE MONEDA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('B')].Value := 'DESCR. MONEDA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('C')].Value := 'ID PERSONA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('D')].Value := 'NOMBRE';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('E')].Value := 'RFC';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('F')].Value := 'MES PER.';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('G')].Value := 'ANIO PER.';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('H')].Value := 'CVE. PROD.';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('I')].Value := 'CONTRATO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('J')].Value := 'CREDITO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('K')].Value := 'PERIODO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('L')].Value := 'FECHA OPERACION';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('M')].Value := 'IVA DEVENGADO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('N')].Value := 'IVA PAGADO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('O')].Value := 'IVA X PAG';
   //   vgExcelApp.Cells[vgnRowExcel,ColumnXlS('P')].Value := 'SIT. IVA';

     lQuery.First;
   
   while not(lQuery.Eof) do
   begin
     Inc(vgnRowExcel);

     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A')].Value := lQuery.FieldByName('CVE_MONEDA').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('B')].Value := lQuery.FieldByName('DESC_MONEDA').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('C')].Value := lQuery.FieldByName('ID_PERSONA').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('D')].Value := lQuery.FieldByName('NOMBRE').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('E')].Value := lQuery.FieldByName('CVERFC').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('F')].Value := lQuery.FieldByName('MESPER').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('G')].Value := lQuery.FieldByName('ANIOPER').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('H')].Value := lQuery.FieldByName('CVE_PROD').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('I')].Value := lQuery.FieldByName('ID_CONTRATO').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('J')].Value := lQuery.FieldByName('ID_CREDITO').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('K')].Value := lQuery.FieldByName('ID_PERIODO').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('L')].Value := lQuery.FieldByName('F_OPERACION').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('M')].Value := lQuery.FieldByName('IVA_DEVENGADO').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('N')].Value := lQuery.FieldByName('IVA_PAGADO').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('O')].Value := lQuery.FieldByName('IVA_X_PAG').AsString;
//   vgExcelApp.Cells[vgnRowExcel,ColumnXlS('P')].Value := lQuery.FieldByName('SIT_IVA').AsString;

     lQuery.Next;
   end;

   //Guarda archivo
   Inc(vgnRowExcel);
   vgnRowExcel:=vgnRowExcel+2;
   vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A' )].Value := 'Se generaron : ' + IntToStr(vgnRowExcel-4) +  ' registros';

   vgExcelApp.ActiveWorkBook.SaveAs(nomArchivo);
   CloseExcelFile(vgExcelApp);

   //if QRDetApliVA.qyDetApliva.FieldByName('IVA_DEVENGADO').AsFloat = 0 then
 //   QRDB_IVA_DEVENGADO.Caption  := '';
 // if QRDetApliVA.qyDetApliva.FieldByName('IVA_PAGADO').AsFloat = 0 then
 //   QRDB_IVA_PAGADO.Caption := '';

end;

end.
