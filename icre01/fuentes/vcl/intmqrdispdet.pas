unit IntMQrDispDet;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, jpeg;

type
  TQrDispDet = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyConsulta: TQuery;
    QRGpDisp: TQRGroup;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel53: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText47: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRShape5: TQRShape;
    QRLabel8: TQRLabel;
    QRShape8: TQRShape;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel52: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel15: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel54: TQRLabel;
    QRShape20: TQRShape;
    QRLabel57: TQRLabel;
    QRMemo1: TQRMemo;
    QRExpr4: TQRExpr;
    QRComisiones: TQRGroup;
    QREncab_2: TQRGroup;
    QRLabel51: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRShape1: TQRShape;
    QRDBText60: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel40: TQRLabel;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText43: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRDetalle: TQRGroup;
    QRDBText37: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText67: TQRDBText;
    QRDBText68: TQRDBText;
    qyConsultaORDEN: TFloatField;
    qyConsultaID_CREDITO: TFloatField;
    qyConsultaCVE_COMISION: TStringField;
    qyConsultaDESC_COMISION: TStringField;
    qyConsultaPCT_COMISION: TFloatField;
    qyConsultaIMP_COMISION: TFloatField;
    qyConsultaB_PORCENTAJE: TStringField;
    qyConsultaF_AUTORIZA: TDateTimeField;
    qyConsultaF_INICIO: TDateTimeField;
    qyConsultaID_PROM_ADM: TFloatField;
    qyConsultaID_CONTRATO: TFloatField;
    qyConsultaIMP_DISP_CRED: TFloatField;
    qyConsultaIMP_CREDITO: TFloatField;
    qyConsultaDIAS_PLAZO: TFloatField;
    qyConsultaF_VENCIMIENTO: TDateTimeField;
    qyConsultaTIPO_DISPOSICION: TStringField;
    qyConsultaCVE_TASA_REFER: TStringField;
    qyConsultaTASA_BASE: TFloatField;
    qyConsultaOPERADOR_STASA: TStringField;
    qyConsultaSOBRETASA: TFloatField;
    qyConsultaTASA_CREDITO: TFloatField;
    qyConsultaCVE_CALCULO: TStringField;
    qyConsultaCVE_AMORTIZACION: TStringField;
    qyConsultaCVE_PAG_INTERES: TStringField;
    qyConsultaB_APLICA_IVA: TStringField;
    qyConsultaID_CRE_RENUEVA: TFloatField;
    qyConsultaSIT_CREDITO: TStringField;
    qyConsultaSDO_INSOLUTO: TFloatField;
    qyConsultaID_TITULAR: TFloatField;
    qyConsultaID_PERS_ASOCIAD: TFloatField;
    qyConsultaNOMASOC: TStringField;
    qyConsultaNOMADM: TStringField;
    qyConsultaCVE_MONEDA: TFloatField;
    qyConsultaDESC_MONEDA: TStringField;
    qyConsultaCVE_PRODUCTO_CRE: TStringField;
    qyConsultaDESC_L_PRODUCTO: TStringField;
    qyConsultaIMP_AUTORIZADO: TFloatField;
    qyConsultaIMP_DISP_AUT: TFloatField;
    qyConsultaB_EVENTUAL: TStringField;
    qyConsultaB_REVOLVENTE: TStringField;
    qyConsultaB_FINANC_ADIC: TStringField;
    qyConsultaDIAS_PLAZO_1: TFloatField;
    qyConsultaF_VENCIMIENTO_1: TDateTimeField;
    qyConsultaNOMACRED: TStringField;
    qyConsultaCVE_TIPO_SECTOR: TStringField;
    qyConsultaDESC_SECTOR: TStringField;
    qyConsultaB_ACREDITADO_REL: TStringField;
    qyConsultaCVE_GRUPO_ECO: TStringField;
    qyConsultaDESC_GRUPO_ECO: TStringField;
    qyConsultaRFC: TStringField;
    qyConsultaCHEQUERA: TStringField;
    qyConsultaDESC_TASA_INDIC: TStringField;
    qyConsultaDESC_AMORTIZA: TStringField;
    qyConsultaDESC_CALCULO: TStringField;
    qyConsultaCONTAUT: TFloatField;
    qyConsultaFAUT: TDateTimeField;
    qyConsultaCREDAUT: TFloatField;
    qyConsultaCVEMONAUT: TFloatField;
    qyConsultaIMPCREDAUT: TFloatField;
    qyConsultaSDOAUT: TFloatField;
    qyConsultaFVENCAUT: TDateTimeField;
    qyConsultaRENUEAUT: TFloatField;
    qyConsultaPRODAUT: TStringField;
    qyConsultaSITCREDAUT: TStringField;
    qyConsultaMONAUT: TStringField;
    qyConsultaCVEAUTPROD: TStringField;
    qyConsultaPRUEBA: TFloatField;
    DetailBand1: TQRBand;
    qyConsultaTASA: TFloatField;
    qyConsultaIMPORTE_COMIS: TFloatField;
    qyConsultaPCTCOM: TFloatField;
    FOOTER: TQRBand;
    QRShape3: TQRShape;
    QRExpr5: TQRExpr;
    QRLabel3: TQRLabel;
    qyConsultaTASA_APLICADA: TFloatField;
    qyConsultaDESC_PAG_INTERES: TStringField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    qyConsultaCHEQUERA_LIQ: TStringField;
    qyConsultaIMP_DISPONIBLE_AUT: TFloatField;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qyConsultaIMP_A_LIQUIDAR: TFloatField;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabelAprela: TQRLabel;
    QRLabel49: TQRLabel;
    QRShape6: TQRShape;
    QRIncumpli: TQRShape;
    QRLiquidez: TQRShape;
    QRprela: TQRShape;
    QRGarantias: TQRShape;
    procedure qyConsultaCalcFields(DataSet: TDataSet);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
     VLBFirmas  : Boolean;
     VLBCapPago : Boolean;
  public
     Function FormaQuery(sFInicio,sFFin,sProducto,sMoneda,
                         sAcreditado,sPromAsoc,sPromAdmon,sCesion,
                         sSituacion,sEmpresa, sSucursal :String):String;
  end;

var
  QrDispDet: TQrDispDet;
  APli     : TInterApli;

Procedure EjecutarReporteDispDet(  sF_Inicio,sF_Fin,sProducto,sMoneda,
                            sAcreditado,sPromAsoc,sPromAdmon,sCesion,
                            sSituacion, sBFirmas, sBCapacPago, sEmpresa, sSucursal:String;
                            pAPli     : TInterApli;
                            pPreview, pBFirstPage : Boolean);
Implementation
{$R *.DFM}

Procedure EjecutarReporteDispDet(  sF_Inicio,sF_Fin,sProducto,sMoneda,
                            sAcreditado,sPromAsoc,sPromAdmon,sCesion,
                            sSituacion, sBFirmas, sBCapacPago, sEmpresa, sSucursal:String;
                            pAPli     : TInterApli;
                            pPreview, pBFirstPage  : Boolean);
Var
    QrDispDet   : TQrDispDet;
    Preview     : TIntQRPreview;
Begin
      QrDispDet   := TQrDispDet.Create(Nil);
      Preview := TIntQRPreview.CreatePreview(Application, QrDispDet);

      Try
        APli:= pAPli;
        QrDispDet.QRInterEncabezado1.Apli:=pApli;
        QrDispDet.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrDispDet.QRInterEncabezado1.NomReporte:='IntMQrDispDet';

        QrDispDet.QRInterEncabezado1.Titulo1:='Reporte de Orden de Disposición';

        QrDispDet.VLBFirmas  := sBFirmas = 'V';
        QrDispDet.VLBCapPago := sBCapacPago = 'V';


        If sF_Inicio<>'' Then
          QrDispDet.QRInterEncabezado1.Titulo2:='Periodo del '+  sF_Inicio ;
        If sF_Fin<>'' Then
          QrDispDet.QRInterEncabezado1.Titulo2:=QrDispDet.QRInterEncabezado1.Titulo2 + ' al ' + sF_Fin;

        QrDispDet.qyConsulta.DatabaseName := pApli.DataBaseName;
        QrDispDet.qyConsulta.SessionName := pApli.SessionName;

        QrDispDet.qyConsulta.Active:=False;
        QrDispDet.qyConsulta.SQL.Text:= QrDispDet.FormaQuery(sF_Inicio,sF_Fin,sProducto,sMoneda,
                        sAcreditado,sPromAsoc,sPromAdmon,sCesion,sSituacion,sEmpresa, sSucursal);
        QrDispDet.qyConsulta.SQL.SaveToFile('c:\OrdenDisp.txt');
        QrDispDet.qyConsulta.Active:=True;


        if pBFirstPage then
           QrDispDet.PrinterSettings.LastPage := 1
        else
           QrDispDet.PrinterSettings.LastPage := 0;
        //end if


        If pPreview Then
            QrDispDet.Preview
        Else
            QrDispDet.Print;
    Finally
        QrDispDet.free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrDispDet.FormaQuery(sFInicio,sFFin,sProducto,sMoneda,
                              sAcreditado,sPromAsoc,sPromAdmon,sCesion,
                              sSituacion,sEmpresa, sSucursal:String):String;
Var
    sSQL:String;
Begin

   sSQL:=
         '( '+ coCRLF +
         'SELECT '+
         '       1 ORDEN, '+
         '       CRCRED.ID_CREDITO, '+
         '       CRCRED.PCT_COMISION PCTCOM, '+
         '       CRCOM.CVE_COMISION, '+
         '       CATCOM.DESC_COMISION, '+
         '       CRCOM.PCT_COMISION, '+
         '       CRCOM.IMP_COMISION, '+
         '       DECODE(CATCOM.B_PORCENTAJE,''V'',''NO'',''F'',''SI'') AS B_PORCENTAJE, '+
         '       CRCRED.F_AUTORIZA, CRCRED.F_INICIO, '+
         '       CRCRED.ID_PROM_ADM, CRCRED.ID_CONTRATO, '+ coCRLF +   //CRCRED.IMP_DISPUESTO, '+ coCRLF +EASA4011   13072005
         '       pkgcrsaldos.stpObtDispuestoDisp(CRCRED.ID_CREDITO,''F'') IMP_DISP_CRED,'+ coCRLF +
         '       DECODE(CRCRED.SIT_CREDITO, ''NA'', 0 , CRCRED.IMP_CREDITO - ( CRCRED.IMP_COMISION_PAG + CRCRED.IMP_IVA_COM_PAG )) IMP_A_LIQUIDAR,'+ coCRLF +
         '       CRCRED.IMP_CREDITO, CRCRED.DIAS_PLAZO, CRCRED.F_VENCIMIENTO, '+
         '       DECODE(CRCRED.TIPO_DISPOSICION,''DI'',''Disposición'',''RS'',''Reestructuración'',''RE'',''Renovación'') AS TIPO_DISPOSICION, '+
         '       CRCRED.CVE_TASA_REFER, CRCRED.TASA_BASE, CRCRED.OPERADOR_STASA, '+
         '       CRCRED.SOBRETASA, CRCRED.TASA_CREDITO,   CRCRED.CVE_CALCULO, '+
         '       CRCRED.CVE_AMORTIZACION, CRCRED.CVE_PAG_INTERES, '+
         '       DECODE(CRCRED.B_APLICA_IVA,''V'',''SI'',''F'',''NO'','''',''NO'') B_APLICA_IVA , '+
         '       CRCRED.ID_CRE_RENUEVA,CRCRED.SIT_CREDITO, 0  SDO_INSOLUTO, '+  //CRCRED.SDO_INSOLUTO, '+
         '       CONT.ID_TITULAR,CONT.ID_PERS_ASOCIAD, PROMASOC.NOMBRE AS NOMASOC, '+
         '       PROMADM.NOMBRE AS NOMADM, CONT.CVE_MONEDA,       MON.DESC_MONEDA, '+
         '       CRCONT.CVE_PRODUCTO_CRE,   PROD.DESC_L_PRODUCTO, '+
         '       CRCONT.IMP_AUTORIZADO,       '+ coCRLF +//CRCONT.IMP_DISPUESTO, '+ coCRLF + EASA4011   13072005
         '       pkgcrsaldos.stpObtDispuestoAut( CRCONT.ID_CONTRATO,CRCONT.FOL_CONTRATO) IMP_DISP_AUT, '+ coCRLF + //EASA4011   13072005
         '       pkgcrsaldos.StpObtDisponibleAut(CRCONT.ID_CONTRATO,CRCONT.FOL_CONTRATO) IMP_DISPONIBLE_AUT, '+ coCRLF +//EASA4011   13072005
         '       DECODE(CRCONT.B_EVENTUAL,''F'',''NO'',''V'',''SI'','''',''NO'') AS B_EVENTUAL, '+
         '       DECODE(CRCONT.B_REVOLVENTE,''F'',''NO'',''V'',''SI'','''',''NO'') AS B_REVOLVENTE, '+
         '       DECODE(CRCONT.B_FINANC_ADIC,''F'',''NO'',''V'',''SI'','''',''NO'') AS B_FINANC_ADIC, '+
         '       CRCONT.DIAS_PLAZO, CRCONT.F_VENCIMIENTO, '+
         '       PER.NOMBRE AS NOMACRED,PER.CVE_TIPO_SECTOR, '+
         '       SECT.DESC_SECTOR, '+
         '       DECODE(ACRED.B_ACREDITADO_REL,''F'',''NO'',''V'',''SI'','''',''NO'') B_ACREDITADO_REL, '+
         '       ACRED.CVE_GRUPO_ECO,   CGPOE.DESC_GRUPO_ECO, '+
         '       (RFC.SIGLAS_RFC||RFC.F_RFC||RFC.homoclave_rfc) AS RFC, '+coCRLF +

         '       (SUBSTR((PKGCRPERIODO.STPObtchqCte( CONT.ID_TITULAR,DECODE(CP.CVE_SUB_DIVISION, NULL,''0'', CP.CVE_SUB_DIVISION),'+
         '                              CRCRED.ID_CREDITO,DECODE(CP.CVE_SUB_DIVISION, NULL,''AC'', ''AP''),''AD'',''AB'')),1,20)) AS CHEQUERA, '+ coCRLF +
         //EASA401              13072005 ADD CHEQUERA LIQUIDACION
         '       (SUBSTR((PKGCRPERIODO.STPObtchqCte( CONT.ID_TITULAR,DECODE(CP.CVE_SUB_DIVISION, NULL,''0'', CP.CVE_SUB_DIVISION),'+
         '                              CRCRED.ID_CREDITO,DECODE(CP.CVE_SUB_DIVISION,NULL,''AC'', ''AP''),''LQ'',''AB'')),1,20)) AS CHEQUERA_LIQ, '+ coCRLF +

         '       TAFIN.DESC_TASA_INDIC,       AMORT.DESC_AMORTIZA, '+
         '       CALC.DESC_CALCULO, '+
         '       0 CONTAUT, SYSDATE FAUT , '+
         '       '' '' AS CVEAUTPROD,  '' '' AS PRODAUT, '+
         '       0 CREDAUT,   '' '' AS SITCREDAUT, '+
         '       0 CVEMONAUT, '' '' AS MONAUT, '+
         '       0 IMPCREDAUT, 0 SDOAUT, '+
         '       SYSDATE FVENCAUT, 0 RENUEAUT,' +
         '       NVL(CI.TASA_APLICADA,CRCRED.TASA_CREDITO) TASA_APLICADA, '+  //EASA      03102004
         '       CPI.DESC_PAG_INTERES '+ coCRLF +  //EASA      03102004

         '  FROM CR_CREDITO CRCRED, CONTRATO CONT, PERSONA PER, CR_ACREDITADO ACRED, '+
         '       RFC, CR_GRUPO_ECO CGPOE, SECTOR SECT,   PERSONA PROMADM, '+
         '       PERSONA PROMASOC, CR_CONTRATO CRCONT, CR_PRODUCTO PROD,MONEDA MON, '+
         '       TASA_INDIC_FINAN TAFIN,   CR_CALCULO_INT CALC, CR_AMORTIZACION AMORT, '+
         '	 CR_COMIS_PROG CRCOM, CR_CAT_COMISION CATCOM, '+
         //EASA 03102001 MODIFICACION TASA OPERACION
         '	 ( SELECT ID_CREDITO, TASA_APLICADA FROM CR_INTERES ' +
         '	   WHERE SIT_INTERES = ' + SQLStr('AC') + ' ) CI, ' +
         '       CR_PAGO_INTERES CPI,  ' +
         '       ( SELECT ID_CREDITO,CVE_SUB_DIVISION  '+
         '         FROM CR_PROCAMPO ) CP ' + coCRLF +

         ' WHERE CRCOM.SIT_COMIS_PROG(+) = ''AC'' '+
         '   AND CRCRED.ID_CONTRATO = CONT.ID_CONTRATO '+
         '   AND CONT.ID_TITULAR = PER.ID_PERSONA '+
         '   AND ACRED.ID_ACREDITADO = PER.ID_PERSONA '+
         '   AND RFC.ID_PERSONA = PER.ID_PERSONA '+
         '   AND CGPOE.CVE_GRUPO_ECO = ACRED.CVE_GRUPO_ECO '+
         '   AND SECT.CVE_SECTOR = PER.CVE_TIPO_SECTOR '+
         '   AND CRCRED.ID_PROM_ADM = PROMADM.ID_PERSONA '+
         '   AND CONT.ID_PERS_ASOCIAD = PROMASOC.ID_PERSONA '+
         '   AND CRCRED.ID_CONTRATO = CRCONT.ID_CONTRATO '+
         '   AND CRCRED.FOL_CONTRATO = CRCONT.FOL_CONTRATO '+
         '   AND CRCONT.CVE_PRODUCTO_CRE = PROD.CVE_PRODUCTO_CRE '+
         '   AND CONT.CVE_MONEDA = MON.CVE_MONEDA '+
         '   AND CRCRED.CVE_TASA_REFER = TAFIN.CVE_TASA_INDICAD '+
         '   AND CRCRED.CVE_CALCULO = CALC.CVE_CALCULO_INT '+
         '   AND CRCRED.CVE_AMORTIZACION = AMORT.CVE_AMORTIZACION '+
         '	 AND CRCRED.ID_CREDITO = CRCOM.ID_CREDITO '+
         '   AND CRCOM.CVE_COMISION = CATCOM.CVE_COMISION ' +
         //EASA 03102001 MODIFICACION TASA OPERACION
         '   AND CI.ID_CREDITO (+) = CRCRED.ID_CREDITO '  +
         '   AND CPI.CVE_PAG_INTERES = CRCRED.CVE_PAG_INTERES ' +
         '   AND CP.ID_CREDITO(+) = CRCRED.ID_CREDITO ' + coCRLF  ;

       If (Trim(sFInicio)<>'') Then Begin
            sSQL:= sSQL + ' AND CRCRED.F_AUTORIZA >= TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')' + coCRLF;
        End;
        If (Trim(sFFin)<>'') Then Begin
            sSQL:= sSQL + ' AND CRCRED.F_AUTORIZA <= TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''',''DD/MM/YYYY'')'+ coCRLF;
        End;
        If (Trim(sProducto)<>'') Then
            sSQL:= sSQL + ' AND  PROD.CVE_PRODUCTO_CRE ='''+sProducto+''''+ coCRLF;
        If (Trim(sMoneda)<>'') Then
            sSQL:= sSQL + ' AND  CONT.CVE_MONEDA  ='+sMoneda+ coCRLF;
        If (Trim(sAcreditado)<>'') Then
            sSQL:= sSQL + ' AND  CONT.ID_TITULAR ='+ sAcreditado+ coCRLF;
        If (Trim(sPromAsoc)<>'') Then
            sSQL:= sSQL + ' AND  CONT.ID_PERS_ASOCIAD ='+ sPromAsoc+ coCRLF;
        If (Trim(sPromAdmon)<>'') Then
            sSQL:= sSQL + ' AND  CRCRED.ID_PROM_ADM ='+ sPromAdmon+ coCRLF;
        If (Trim(sCesion)<>'') Then
            sSQL:= sSQL + ' AND  CRCRED.ID_CREDITO ='+ sCesion+ coCRLF;
            //sSQL:= sSQL + ' AND  CRCRED.ID_CREDITO BETWEEN 18489 AND 24788'; PRUEBA
        If (Trim(sSituacion)<>'') Then
            sSQL:= sSQL + ' AND  CRCRED.SIT_CREDITO ='''+ sSituacion+''''+ coCRLF;
        If (Trim(sEmpresa)<> '') Then //SASB
            sSQL:= sSQL + ' AND  PROD.ID_EMPRESA ='+ Trim(sEmpresa)+ coCRLF;

   sSQL:= sSQL +
         ')UNION ( '+coCRLF +
         'SELECT '+
         '       2 ORDEN, '+
         '       CRCRED.ID_CREDITO, '+
         '       0 PCTCOM, '+
         '       '' '' CVE_COMISION, '+
         '       '' '' DESC_COMISION, '+
         '       0 PCT_COMISION, '+
         '       0 IMP_COMISION, '+
         '       '' '' B_PORCENTAJE, '+
         '       CRCRED.F_AUTORIZA, CRCRED.F_INICIO, '+
         '       CRCRED.ID_PROM_ADM, CRCRED.ID_CONTRATO, '+ coCRLF +   //CRCRED.IMP_DISPUESTO, '+ coCRLF +EASA4011   13072005
         '       pkgcrsaldos.stpObtDispuestoDisp(CRCRED.ID_CREDITO,''F'') IMP_DISP_CRED,'+ coCRLF +
         '       DECODE(CRCRED.SIT_CREDITO, ''NA'', 0 , CRCRED.IMP_CREDITO - ( CRCRED.IMP_COMISION_PAG + CRCRED.IMP_IVA_COM_PAG )) IMP_A_LIQUIDAR,'+ coCRLF +
         '       CRCRED.IMP_CREDITO, CRCRED.DIAS_PLAZO, CRCRED.F_VENCIMIENTO, '+
         '       DECODE(CRCRED.TIPO_DISPOSICION,''DI'',''Disposición'',''RS'',''Reestructuración'',''RE'',''Renovación'') AS TIPO_DISPOSICION, '+
         '       CRCRED.CVE_TASA_REFER, CRCRED.TASA_BASE, CRCRED.OPERADOR_STASA, '+
         '       CRCRED.SOBRETASA, CRCRED.TASA_CREDITO,   CRCRED.CVE_CALCULO, '+
         '       CRCRED.CVE_AMORTIZACION, CRCRED.CVE_PAG_INTERES, '+
         '       DECODE(CRCRED.B_APLICA_IVA,''V'',''SI'',''F'',''NO'','''',''NO'') B_APLICA_IVA , '+
         '       CRCRED.ID_CRE_RENUEVA,CRCRED.SIT_CREDITO,   CRCRED.SDO_INSOLUTO, '+
         '       CONT.ID_TITULAR,CONT.ID_PERS_ASOCIAD, PROMASOC.NOMBRE AS NOMASOC, '+
         '       PROMADM.NOMBRE AS NOMADM, CONT.CVE_MONEDA,       MON.DESC_MONEDA, '+
         '       CRCONT.CVE_PRODUCTO_CRE,   PROD.DESC_L_PRODUCTO, '+
         '       CRCONT.IMP_AUTORIZADO,       '+ coCRLF +//CRCONT.IMP_DISPUESTO, '+ coCRLF + EASA4011   13072005
         '       pkgcrsaldos.stpObtDispuestoAut( CRCONT.ID_CONTRATO,CRCONT.FOL_CONTRATO) IMP_DISP_AUT, '+ coCRLF + //EASA4011   13072005
         '       pkgcrsaldos.StpObtDisponibleAut(CRCONT.ID_CONTRATO,CRCONT.FOL_CONTRATO) IMP_DISPONIBLE_AUT, '+ coCRLF +//EASA4011   13072005
         '       DECODE(CRCONT.B_EVENTUAL,''F'',''NO'',''V'',''SI'','''',''NO'') AS B_EVENTUAL, '+
         '       DECODE(CRCONT.B_REVOLVENTE,''F'',''NO'',''V'',''SI'','''',''NO'') AS B_REVOLVENTE, '+
         '       DECODE(CRCONT.B_FINANC_ADIC,''F'',''NO'',''V'',''SI'','''',''NO'') AS B_FINANC_ADIC, '+
         '       CRCONT.DIAS_PLAZO, CRCONT.F_VENCIMIENTO, '+
         '       PER.NOMBRE AS NOMACRED,PER.CVE_TIPO_SECTOR, '+
         '       SECT.DESC_SECTOR, '+
         '       DECODE(ACRED.B_ACREDITADO_REL,''F'',''NO'',''V'',''SI'','''',''NO'') B_ACREDITADO_REL, '+
         '       ACRED.CVE_GRUPO_ECO,   CGPOE.DESC_GRUPO_ECO, '+
         '       (RFC.SIGLAS_RFC||RFC.F_RFC||RFC.homoclave_rfc) AS RFC, '+
         '       (SUBSTR((PKGCRPERIODO.STPObtchqCte( CONT.ID_TITULAR,DECODE(CP.CVE_SUB_DIVISION, NULL,''0'', CP.CVE_SUB_DIVISION),'+
         '                                      CRCRED.ID_CREDITO,DECODE(CP.CVE_SUB_DIVISION,NULL,''AC'', ''AP''),''AD'',''AB'')),1,20)) AS CHEQUERA, '+ coCRLF +
         //EASA401              13072005 ADD CHEQUERA LIQUIDACION
         '       (SUBSTR((PKGCRPERIODO.STPObtchqCte( CONT.ID_TITULAR,DECODE(CP.CVE_SUB_DIVISION, NULL,''0'', CP.CVE_SUB_DIVISION),'+
         '                              CRCRED.ID_CREDITO,DECODE(CP.CVE_SUB_DIVISION,NULL,''AC'', ''AP''),''LQ'',''AB'')),1,20)) AS CHEQUERA_LIQ, '+ coCRLF +

         '       TAFIN.DESC_TASA_INDIC,       AMORT.DESC_AMORTIZA, '+
         '       CALC.DESC_CALCULO, '+
         '       INFOAUT.ID_CONTRATO CONTAUT, INFOAUT.F_AUTORIZA FAUT , '+
         '       INFOAUT.CVE_PRODUCTO_CRE CVEAUTPROD,  INFOAUT.DESC_L_PRODUCTO PRODAUT, '+
         '       INFOAUT.ID_CREDITO CREDAUT,   INFOAUT.SIT_CREDITO SITCREDAUT, '+
         '       INFOAUT.CVE_MONEDA CVEMONAUT, INFOAUT.DESC_MONEDA MONAUT, '+
         '       INFOAUT.IMP_CREDITO IMPCREDAUT, INFOAUT.SDO_INSOLUTO SDOAUT, '+
         '       INFOAUT.F_VENCIMIENTO FVENCAUT, INFOAUT.ID_CRE_RENUEVA RENUEAUT, ' +
         '       NVL(CI.TASA_APLICADA,CRCRED.TASA_CREDITO) TASA_APLICADA, '+  //EASA      03102004
         '       CPI.DESC_PAG_INTERES '+  coCRLF +//EASA      03102004

         '  FROM CR_CREDITO CRCRED, CONTRATO CONT, PERSONA PER, CR_ACREDITADO ACRED, '+
         '       RFC, CR_GRUPO_ECO CGPOE, SECTOR SECT,   PERSONA PROMADM, '+
         '       PERSONA PROMASOC, CR_CONTRATO CRCONT, CR_PRODUCTO PROD,MONEDA MON, '+
         '       TASA_INDIC_FINAN TAFIN,   CR_CALCULO_INT CALC, CR_AMORTIZACION AMORT, '+
         '        ( SELECT CRCRED.ID_CONTRATO,CRCRED.FOL_CONTRATO, CONT.ID_TITULAR, '+
         '                CRCRED.F_AUTORIZA, CRCONT.CVE_PRODUCTO_CRE,  PROD.DESC_L_PRODUCTO, '+
         '                CRCRED.ID_CREDITO, CRCRED.SIT_CREDITO, '+
         '                CONT.CVE_MONEDA, MON.DESC_MONEDA, CRCRED.IMP_CREDITO, '+
         '                CRCRED.SDO_INSOLUTO,CRCRED.F_VENCIMIENTO, '+
         '                CRCRED.ID_CRE_RENUEVA '+ coCRLF +
         '           FROM CR_CREDITO  CRCRED, CR_CONTRATO CRCONT, CR_PRODUCTO PROD, '+
         '                CONTRATO CONT, MONEDA MON '+ coCRLF +
         '          WHERE CRCRED.ID_CONTRATO = CRCONT.ID_CONTRATO '+
         '            AND CRCRED.FOL_CONTRATO = CRCONT.FOL_CONTRATO '+
         '            AND CRCONT.CVE_PRODUCTO_CRE = PROD.CVE_PRODUCTO_CRE '+
         '            AND CRCRED.ID_CONTRATO = CONT.ID_CONTRATO '+
         '            AND CONT.CVE_MONEDA = MON.CVE_MONEDA) INFOAUT, '+ coCRLF +
         //EASA 03102004
         '	 ( SELECT ID_CREDITO, TASA_APLICADA FROM CR_INTERES ' +
         '	   WHERE SIT_INTERES = ' + SQLStr('AC') + ' ) CI, ' + coCRLF +

         '       CR_PAGO_INTERES CPI,  ' + coCRLF +
         '       ( SELECT ID_CREDITO,CVE_SUB_DIVISION  '+
         '         FROM CR_PROCAMPO ) CP ' + coCRLF +

         ' WHERE CRCRED.ID_CONTRATO = CONT.ID_CONTRATO '+
         '   AND CONT.ID_TITULAR = PER.ID_PERSONA '+
         '   AND ACRED.ID_ACREDITADO = PER.ID_PERSONA '+
         '   AND RFC.ID_PERSONA = PER.ID_PERSONA '+
         '   AND CGPOE.CVE_GRUPO_ECO = ACRED.CVE_GRUPO_ECO '+
         '   AND SECT.CVE_SECTOR = PER.CVE_TIPO_SECTOR '+
         '   AND CRCRED.ID_PROM_ADM = PROMADM.ID_PERSONA '+
         '   AND CONT.ID_PERS_ASOCIAD = PROMASOC.ID_PERSONA '+
         '   AND CRCRED.ID_CONTRATO = CRCONT.ID_CONTRATO '+
         '   AND CRCRED.FOL_CONTRATO = CRCONT.FOL_CONTRATO '+
         '   AND CRCONT.CVE_PRODUCTO_CRE = PROD.CVE_PRODUCTO_CRE '+
         '   AND CONT.CVE_MONEDA = MON.CVE_MONEDA '+
         '   AND CRCRED.CVE_TASA_REFER = TAFIN.CVE_TASA_INDICAD '+
         '   AND CRCRED.CVE_CALCULO = CALC.CVE_CALCULO_INT '+
         '   AND CRCRED.CVE_AMORTIZACION = AMORT.CVE_AMORTIZACION '+
         '   AND CRCRED.ID_CONTRATO = INFOAUT.ID_CONTRATO '+
         '   AND CRCRED.FOL_CONTRATO = INFOAUT.FOL_CONTRATO '+
         '   AND CONT.ID_TITULAR = INFOAUT.ID_TITULAR ' +
         '   AND CPI.CVE_PAG_INTERES = CRCRED.CVE_PAG_INTERES' +
         '   AND CI.ID_CREDITO (+) = CRCRED.ID_CREDITO ' +
         '   AND CP.ID_CREDITO(+) = CRCRED.ID_CREDITO ' + coCRLF ;

       If (Trim(sFInicio)<>'') Then Begin
            sSQL:= sSQL + ' AND CRCRED.F_AUTORIZA >= TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')'+ coCRLF;
            sSQL:= sSQL + ' AND INFOAUT.F_AUTORIZA >= TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')'+ coCRLF;
        End;
        If (Trim(sFFin)<>'') Then Begin
            sSQL:= sSQL + ' AND CRCRED.F_AUTORIZA <= TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''',''DD/MM/YYYY'')'+ coCRLF;
            sSQL:= sSQL + ' AND INFOAUT.F_AUTORIZA <= TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''',''DD/MM/YYYY'')'+ coCRLF;
        End;
        If (Trim(sProducto)<>'') Then
            sSQL:= sSQL + ' AND  PROD.CVE_PRODUCTO_CRE ='''+sProducto+''''+ coCRLF;
        If (Trim(sMoneda)<>'') Then
            sSQL:= sSQL + ' AND  CONT.CVE_MONEDA  ='+sMoneda+ coCRLF;
        If (Trim(sAcreditado)<>'') Then
            sSQL:= sSQL + ' AND  CONT.ID_TITULAR ='+ sAcreditado+ coCRLF;
        If (Trim(sPromAsoc)<>'') Then
            sSQL:= sSQL + ' AND  CONT.ID_PERS_ASOCIAD ='+ sPromAsoc+ coCRLF;
        If (Trim(sPromAdmon)<>'') Then
            sSQL:= sSQL + ' AND  CRCRED.ID_PROM_ADM ='+ sPromAdmon+ coCRLF;
        If (Trim(sCesion)<>'') Then
            sSQL:= sSQL + ' AND  CRCRED.ID_CREDITO ='+ sCesion+ coCRLF;
            //sSQL:= sSQL + ' AND  CRCRED.ID_CREDITO BETWEEN 18489 AND 24788';PRUEBA
        If (Trim(sSituacion)<>'') Then
            sSQL:= sSQL + ' AND  CRCRED.SIT_CREDITO ='''+ sSituacion+''''+ coCRLF;
        If (Trim(sEmpresa)<> '') Then //SASB
            sSQL:= sSQL + ' AND  PROD.ID_EMPRESA ='+ Trim(sEmpresa)+ coCRLF;

   sSQL:= sSQL +
         ') ORDER BY ID_CREDITO, ORDEN, CREDAUT';

    Result:= sSQL;
End;

procedure TQrDispDet.qyConsultaCalcFields(DataSet: TDataSet);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   qyConsulta.FieldByName('PRUEBA').AsFloat:= qyConsulta.FieldByName('SDOAUT').AsFloat;

   If qyConsultaORDEN.AsInteger =1 Then Begin
      QREncab_2.Enabled:=False;
      QRDetalle.Enabled:=False;
      QRComisiones.Enabled:=True;
      If qyConsulta.FieldByName('CVE_COMISION').AsString = 'CODI' Then Begin
         qyConsulta.FieldByName('TASA').AsFloat:= qyConsulta.FieldByName('PCTCOM').AsFloat;
         qyConsulta.FieldByName('IMPORTE_COMIS').AsFloat:=
         GenComisDisp(qyConsulta.FieldByName('IMP_CREDITO').AsFloat,
                      qyConsulta.FieldByName('PCTCOM').AsFloat,
                      qyConsulta.FieldByName('ID_CONTRATO').AsInteger,
                      qyConsulta.FieldByName('ID_CREDITO').AsInteger,
                      Apli, vlSalida, vlMsg);
      End Else Begin
         qyConsulta.FieldByName('TASA').AsFloat:= qyConsulta.FieldByName('PCT_COMISION').AsFloat;
         qyConsulta.FieldByName('IMPORTE_COMIS').AsFloat:= qyConsulta.FieldByName('IMP_COMISION').AsFloat;
      End;
   End Else If  qyConsultaORDEN.AsInteger = 2 Then Begin
      QRComisiones.Enabled:=False;
      QREncab_2.Enabled:=True;
      QRDetalle.Enabled:=True;
   End;
end;

procedure TQrDispDet.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     PrintBand := VLBFirmas;
end;

procedure TQrDispDet.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var  vlsql  : String;
     Query1 : TQuery;
begin
     PrintBand := VLBCapPago;

 vlsql :=  ' SELECT id_acreditado, b_prob_incumpli, b_gtias_otorgadas, b_prelacion_pago,' + coCRLF +
           '        b_liquidez' + coCRLF +
           '   FROM cr_acreditado' + coCRLF +
           '  WHERE id_acreditado = '+qyConsulta.FieldByName('ID_TITULAR').AsString;

        Query1 := GetSQLQuery(vlsql, Apli.DataBaseName, Apli.SessionName, True );

     if Query1.FieldByName('b_prob_incumpli').AsString = 'F' then
     QRIncumpli.Brush.Color := clWhite
     else
     QRIncumpli.Brush.Color := clBlack;

     if Query1.FieldByName('b_gtias_otorgadas').AsString = 'F' then
     QRGarantias.Brush.Color := clWhite
     else
     QRGarantias.Brush.Color := clBlack;

     if Query1.FieldByName('b_prelacion_pago').AsString = 'F' then
     QRprela.Brush.Color := clWhite
     else
     QRprela.Brush.Color := clBlack;

     if Query1.FieldByName('b_liquidez').AsString = 'F' then
     QRLiquidez.Brush.Color := clWhite
     else
     QRLiquidez.Brush.Color := clBlack;

end;

End.

