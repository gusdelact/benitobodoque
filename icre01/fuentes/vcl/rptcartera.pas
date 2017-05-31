// Sistema         : REPORTE CARTERA CREDITICIA INSTITUCIONAL
// Fecha de Inicio : SEP 2006
// Función forma   : REPORTE CARTERA CREDITICIA INSTITUCIONAL
// Diseñado por    : ALICIA MAYA
// Comentarios     :
unit RptCartera;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, intfrm, dialogs, Db,
  DBTables, IntHead, UnSQL2;// ComObj,IntXls;

type
  TqrCartera = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qry: TQuery;
    QRBand1: TQRBand;
    DetailBand1: TQRBand;
    qryID_OLTP_ACREDITADO: TFloatField;
    qryID_OLTP_PROM_ASOC: TFloatField;
    qryID_OLTP_PROM_ADMIN: TFloatField;
    qryPRODUCTO: TStringField;
    qryORI_REC_GBL: TStringField;
    qryID_OLTP_MONEDA: TFloatField;
    qryCVE_CAT_MINIMO: TStringField;
    qryIMP_SDO_K_VIG_VP: TFloatField;
    qryIMP_SDO_K_IMP_VP: TFloatField;
    qryIMP_SDO_K_VEN_VP: TFloatField;
    qryIMP_INT_CORTE_VP: TFloatField;
    qryIMP_SDO_IO_IMP_VP: TFloatField;
    qryID_CREDITO: TFloatField;
    qryT_PERS: TStringField;
    qryCVE_ACTIV_ECO_SITI: TStringField;
    qryLOCALIDAD: TStringField;
    qryID_CONTRATO: TFloatField;
    qryF_INICIO: TDateTimeField;
    qryF_VENCIMIENTO: TDateTimeField;
    qryCVE_OPERATIVA: TStringField;
    qryCVE_AMORTIZACION: TStringField;
    qryCVE_PAG_INTERES: TStringField;
    qryIMP_CREDITO: TFloatField;
    qryCVE_TASA_REFER: TStringField;
    qrySOBRETASA: TFloatField;
    qryCVE_GRUPO_ECO: TStringField;
    qryCVE_CAL_ACRED: TStringField;
    qryCVE_CALIFIC_CUB: TStringField;
    qryIMP_CUBIERTO: TFloatField;
    qryIMP_EXPUESTO: TFloatField;
    qryIMP_RESERVA_CUB: TFloatField;
    qryIMP_RESERVA_EXP: TFloatField;
    qryPCT_CUBIERTO: TFloatField;
    qryPCT_EXPUESTO: TFloatField;
    qryNOMBRE: TStringField;
    qryCUENTA_CONTABLE: TStringField;
    qryCUENTA_INTERES: TStringField;
    qryIMPORTEREF: TFloatField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
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
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qryTOT_RESERVA: TFloatField;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel1: TQRLabel;
    QRDBText42: TQRDBText;
    QRLabel41: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel56: TQRLabel;
    qlContrato: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel6: TQRLabel;
    QRExpr8: TQRExpr;
    qryTOTCREDITO: TFloatField;
    qryTASA_APLICADA: TFloatField;
    qryT_CREDITO: TStringField;
    QRLabel33: TQRLabel;
    QRDBText43: TQRDBText;
    qryCVE_CALIFIC_EXP: TStringField;
    QRLabel46: TQRLabel;
    qrlCliente: TQRLabel;
    qrlCuenta: TQRLabel;
    qrlSaldo: TQRLabel;
    QRShape3: TQRShape;
    qBusca: TQuery;
     Function  FunSQL:String;
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
        procedure   BuscaSDOConta2609(var sCte, sSdo, sCta:String; sFecha:String);  //MARA4356 SE AGREGA PARA SALDO CONTABLE DE LA CUENTA 26096222
  end;

var
  qrCartera: TqrCartera;
  sTipDol, sTipUDI, sFechaR, sFecha2,sFecha3 :STring; sTipoq:Integer;
  sCLIENTE, sSALDO, sCUENTA :String;

procedure  EXE_REP_CARTERA(Objeto:TInterFrame; sf_Periodo :String; Preview:Boolean);

implementation

{$R *.DFM}
procedure  EXE_REP_CARTERA(Objeto:TInterFrame; Sf_Periodo :String; Preview:Boolean);
VAR sPeriodo:String;
    Anio, Mes, Dia: Word;   rDol, rUdi:Real;
begin
  sFechaR:=sf_Periodo;
  sFecha3:=sf_Periodo;
  DecodeDate(StrToDate(sFechaR), Anio, Mes, Dia);
  CASE MES OF
   1 ,2 ,3 :sFechaR:=IntTOStr(Anio-1)+'12';
   4, 5 ,6 :sFechaR:=IntTOStr(Anio)  +'03';
   7, 8 ,9 :sFechaR:=IntTOStr(Anio)  +'06';
   10,11,12:sFechaR:=IntTOStr(Anio)  +'09';
  end;
  qrCartera:= TqrCartera.Create(nil);
  try
  qrCartera.QRInterEncabezado1.Apli:=Objeto.Apli;
  qrCartera.QRInterEncabezado1.Titulo1:='Reporte de Cartera Crediticia Institucional (1001)';
  GetSQLStr(' select TO_CHAR(TO_DATE('''+Sf_Periodo+'''),''MONTH'',''NLS_DATE_LANGUAGE=SPANISH'')||'' ''||to_char(TO_DATE('''+Sf_Periodo+'''),''YYYY'') '+
            ' as fecha  from dual ',
            Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'fecha',sPeriodo,False);
  qrCartera.QRInterEncabezado1.Titulo2:='Por Crédito. '+sPeriodo ;
  qrCartera.QRInterEncabezado1.NomReporte:='IntCrCartera.pas';
  qrCartera.qry.DatabaseName:=Objeto.Apli.DataBaseName;
  qrCartera.qry.SessionName:=Objeto.Apli.SessionName;
  qrCartera.qry.Close;

  GetSQLStr(' SELECT ID_ANIO_MES '+
            ' FROM   DM_CR_DIM_Mes@dwhc '+
            ' WHERE  ANIO  = TO_CHAR(TO_DATE('''+Sf_Periodo+'''),''YYYY'') '+
            ' AND    NUM_MES  = TO_CHAR(TO_DATE('''+Sf_Periodo+'''),''MM'') ',
            Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'ID_ANIO_MES',sFecha2,False);
   GetSQLFloat(' SELECT TIPO_CAMBIO '+
             ' FROM TIPO_CAMBIO_MON '+
             ' WHERE CVE_MONEDA_BASE  = 484 AND '+
             '       CVE_MONEDA_REFER = 840 AND '+
             '       F_LIQUIDACION    = TO_DATE('''+sf_Periodo+''',''DD/MM/YYYY'') AND '+
             '       CVE_MEDIO        = ''MK'' ',
             Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'TIPO_CAMBIO',rDol,False);
   GetSQLFloat(' SELECT TIPO_CAMBIO '+
             ' FROM TIPO_CAMBIO_MON '+
             ' WHERE CVE_MONEDA_BASE  = 484 AND '+
             '       CVE_MONEDA_REFER = 800 AND '+
             '       F_LIQUIDACION    = TO_DATE('''+sf_Periodo+''',''DD/MM/YYYY'') AND '+
             '       CVE_MEDIO        = ''MK'' ',
             Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'TIPO_CAMBIO',rUDI,False);
  sTipDol:=FloatToStr(rDol);
  sTipUDI:=FloatToStr(rUDI);

  qrCartera.qry.SQL.SaveToFile('C:\1001.TXT');
  qrCartera.qry.SQL.Text:=qrCartera.FunSQL;

  //MARA4356 BUSCA LA CUENTA CONTABLE 2609 INICIA
  qrCartera.qBusca.DataBaseName:= Objeto.Apli.DataBaseName;
  qrCartera.qBusca.SessionName := Objeto.Apli.SessionName;
  qrCartera.BuscaSDOConta2609(sCLIENTE, sSALDO, sCUENTA, Sf_Periodo);
  //MARA4356 BUSCA LA CUENTA CONTABLE 2609 TERMINA

  qrCartera.qry.Open;
  if not qrCartera.qry.IsEmpty then
  begin
     //pone encabezado a las columnas
    if Preview then qrCartera.preview else qrCartera.Print
  end
  else
    ShowMessage('No existen datos para los criterios seleccionados');

  finally
    if qrCartera.qry <> nil then qrCartera.qry.Free;
  end; //try
end;


FUNCTION  TqrCartera.FunSQL:String;
var sSql:String;
begin
  sSql:=
//ICRE CR_CREDITO 58.23
' ( '+
' SELECT A.ID_OLTP_ACREDITADO, A.ID_OLTP_PROM_ASOC,A.ID_OLTP_PROM_ADMIN, A.producto, A.ORI_REC_GBL, C.TASA_APLICADA, '+
'        A.ID_OLTP_MONEDA,A.CVE_CAT_MINIMO, TO_CHAR(C.CVE_TIPO_CRED_BC) AS t_credito,  '+
'        A.IMP_SDO_K_VIG_VP, A.IMP_SDO_K_IMP_VP, A.IMP_SDO_K_VEN_VP, A.IMP_INT_CORTE_VP, A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP AS IMP_SDO_IO_IMP_VP,    '+
'        C.ID_CREDITO, C.T_PERS, C.CVE_ACTIV_ECO_SITI, C.LOCALIDAD, C.ID_CONTRATO, C.F_INICIO,  '+
'        C.F_VENCIMIENTO, C.CVE_OPERATIVA, C.CVE_AMORTIZACION, C.CVE_PAG_INTERES,  '+
'        decode(A.ID_OLTP_MONEDA,840,C.IMP_CREDITO*'+sTipDol+',800,C.IMP_CREDITO*'+sTipUDI+',C.IMP_CREDITO) as IMP_CREDITO,  '+
'        C.CVE_TASA_REFER, C.SOBRETASA, C.CVE_GRUPO_ECO,  '+
'        D.cve_cal_acred, E.CVE_CALIFIC_CUB, E.IMP_CUBIERTO, E.IMP_EXPUESTO, E.IMP_RESERVA_CUB,  '+
'        E.IMP_RESERVA_EXP, E.PCT_CUBIERTO, E.PCT_EXPUESTO, (E.IMP_RESERVA_CUB + E.IMP_RESERVA_EXP) TOT_RESERVA,  '+
'        decode(CVE_PER_JURIDICA,''PM'',ACREDITADO,NOMBREF) AS NOMBRE,  '+
'        NVL(TABCTA.CUENTA_VIGENTE_K,TABCTAICRE.CVE_CTA_CONT_CAREVI) AS CUENTA_CONTABLE,  '+
'        NVL(TABCTA.CUENTA_VIGENTE_INT,TABCTAICRE.CVE_CTA_CONT_INREVI) AS CUENTA_INTERES,  '+
'        nvl(decode(A.ID_OLTP_MONEDA,840,TABREF.IMPORTEREF*'+sTipDol+',800,TABREF.IMPORTEREF*'+sTipUDI+',TABREF.IMPORTEREF),0) as IMPORTEREF,    '+
//'        (nvl(decode(A.ID_OLTP_MONEDA,840,TABREF.IMPORTEREF*'+sTipDol+',800,TABREF.IMPORTEREF*'+sTipUDI+',TABREF.IMPORTEREF),0) +  '+
'         (A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP) AS TOTCREDITO, CVE_CALIFIC_EXP '+
' FROM '+
//    /***** BUSCA EN DWH *****/
'     ( select ID_OLTP_ACREDITADO, ACREDITADO, ID_OLTP_PROM_ASOC,ID_OLTP_PROM_ADMIN, CREDITO, '+
'              ID_OLTP_PRODUCTO||'' ''||PRODUCTO producto, ORI_REC_GBL, ORIGEN_INFO, ID_OLTP_MONEDA,CVE_CAT_MINIMO, '+
'              IMP_SDO_K_VIG_VP, IMP_SDO_K_IMP_VP, IMP_SDO_K_VEN_VP, IMP_INT_CORTE_VP, IMP_SDO_IO_IMP_VP, IMP_INT_CORTE '+
'       from DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '+
'       where aa.ID_ANIO_MES = '+ sFecha2 +
'       and   aa.ID_CREDITO = bb.ID_CREDITO '+
'       and   ORIGEN_INFO=''ICRE'' )  A, '+
//    /***** BUSCA DATOS GENERALES EN CORPORATIVO *****/
'     ( select '+
'        P.ID_PERSONA, C.ID_CREDITO, decode(p.CVE_PER_JURIDICA,''PM'',''MORAL'',DECODE(B_ACTIV_EMPRESA,''V'',''FISICA ACT EMP'',''FISICA'')) T_PERS, '+
'        decode(p.CVE_PER_JURIDICA,''PM'','''',TRIM(APELLIDO_PATERNO)||'' ''||TRIM(APELLIDO_MATERNO)||'' ''||NOMBRE_PERSONA) NOMBREF, '+
'        p.CVE_ACTIV_ECO_SITI, PB.DESC_POBLACION AS LOCALIDAD, C.ID_CONTRATO, p.CVE_PER_JURIDICA, '+
'        C.F_INICIO,C.F_VENCIMIENTO, C.CVE_OPERATIVA, C.CVE_AMORTIZACION, C.CVE_PAG_INTERES, C.IMP_CREDITO, C.CVE_TASA_REFER, C.SOBRETASA, '+
'        CP.cve_producto_cre, CCT.cve_moneda, CT.id_empresa, CVE_GRUPO_ECO  ,CP.CVE_TIPO_CRED_BC, CH.TASA_APLICADA '+
'       from CR_CREDITO C, CONTRATO CT, cr_contrato CCT, persona p, persona_fisica pf, persona_moral pm, '+
'            DOMICILIO D, POBLACION PB, CR_ACREDITADO CA, CR_PRODUCTO  CP, CR_HISTO_CRED ch '+
'       where C.ID_CONTRATO =CT.ID_CONTRATO '+
'       AND CCT.id_contrato = CT.id_contrato '+
'       AND CT.ID_TITULAR = P.ID_PERSONA '+
'       AND (pm.ID_PERSONA(+)= p.ID_PERSONA AND pf.ID_PERSONA(+)=p.ID_PERSONA) '+
'       AND D.ID_DOMICILIO = P.ID_DOMICILIO '+
'       AND PB.CVE_POBLACION= D.CVE_ESTADO '+
'       AND CA.ID_ACREDITADO = P.ID_PERSONA '+
'       AND CCT.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE '+
'       AND CH.ID_CREDITO (+)= C.ID_CREDITO '+
'       AND CH.F_CIERRE (+)= '''+sFecha3+''' ) C, '+      
//     /***** BUSCA CALIFICACIÓN DEL DEUDOR EN SICC *****/ 
'     ( SELECT ID_ACREDITADO, cve_cal_acred   FROM cr_sicc_cal_acre csa '+
'       WHERE CSA.ANIO_MES=  '+sFechaR+' AND CSA.SIT_SICC_CAL_ACR = ''AC'') D, '+
//    /***** BUSCA DATOS DEL CREDITO EN SIC *****/ 
'     ( SELECT id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPUESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUESTO, CVE_CALIFIC_EXP '+
'       FROM CR_SICC_CAL_CRED CSC  WHERE CSC.ANIO_MES= '+sFechaR+' AND CSC.SIT_SICC_CAL_CRE = ''AC'' ' +
'       GROUP BY id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPUESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUESTO, CVE_CALIFIC_EXP '+
'      ) E, '+
//    /***** CUENTA DE CAPITAL Y CUENTA DE INTERESES *****/ 
' 	( SELECT PROD.ID_EMPRESA, PROD.CVE_PRODUCTO_CRE, PROD.CVE_MONEDA, '+
'              SUBSTR(INREVI.CVE_CTA_CONT,1,30) CVE_CTA_CONT_INREVI, SUBSTR(CAREVI.CVE_CTA_CONT,1,30) CVE_CTA_CONT_CAREVI '+
'  	  FROM '+
' 		 (SELECT CP.*, CRPM.CVE_MONEDA '+
'           FROM CR_PRODUCTO CP, '+
'               (SELECT CVE_MONEDA, CVE_PRODUCTO_CRE, COUNT(*) FROM CR_REL_PROD_MON CRPM GROUP BY CVE_MONEDA, CVE_PRODUCTO_CRE ORDER BY CVE_MONEDA, CVE_PRODUCTO_CRE) CRPM '+
'                WHERE CP.CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = ''CTICRE'') '+
'                AND   CRPM.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE) PROD, '+
'               (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran '+
'                WHERE CVE_OPER_CRED = ''INREVI'' AND   CVE_COMISION = ''NA'' AND   CVE_CONCEPTO = ''IMPBRU'' AND   CVE_TIPO_MOVTO = ''MD'' AND   TIPO_AFECTACION = ''D'') INREVI, '+
'               (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran '+
'                WHERE CVE_OPER_CRED = ''CAREVI'' AND   CVE_COMISION = ''NA'' AND   CVE_CONCEPTO = ''IMPBRU'' AND   CVE_TIPO_MOVTO = ''MD'' AND   TIPO_AFECTACION = ''D'') CAREVI '+
'           WHERE INREVI.ID_EMPRESA    (+)= PROD.ID_EMPRESA '+
'           AND   INREVI.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE '+
'           AND   INREVI.CVE_MONEDA    (+)= PROD.CVE_MONEDA  '+
'           AND   CAREVI.ID_EMPRESA    (+)= PROD.ID_EMPRESA  '+
'           AND   CAREVI.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE  '+
'           AND   CAREVI.CVE_MONEDA    (+)= PROD.CVE_MONEDA   )TABCTAICRE,  '+
'          (SELECT CP.CVE_PRODUCTO_CRE, CUENTA_VIGENTE_INT, NVL(CtaAgrK.CUENTA_VIGENTE,CtaDDK.CUENTA_VIGENTE ) CUENTA_VIGENTE_K '+
'           FROM cr_producto CP, '+
'               (SELECT ''IN'' AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, SUBSTR(GC.CUENTA_CONTABLE,1,4) || ''-''||  '+
'                       SUBSTR(GC.CUENTA_CONTABLE,5,4) || ''-''|| SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE_INT '+
'                FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC '+ // GUIA_CONTABLE@SICA GC CAMBIO POR BAJA DE BASE SICA 02/08/2012 JFOF 
'                WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '+
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%FAC'' '+
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%AGR'' '+
'                AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '+
'                AND GC.EMPRESA = ''BCO2'' '+
'                AND GC.CODIGO_TRANSACCION IN (306000, 306710) '+
'                AND GC.CAMPO_IMPORTE IN (''03'',''06'') '+
'                AND GC.CLAVE_MONEDA = ''PESOS'' '+
'                AND (GC.CUENTA_CONTABLE LIKE ''13%'' OR GC.CUENTA_CONTABLE LIKE ''26%'')) CtaInt, '+
'               (SELECT ''KA'' AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, '+
'                       SUBSTR(GC.CUENTA_CONTABLE,1,4)|| ''-''|| SUBSTR(GC.CUENTA_CONTABLE,5,4)||''-''|| SUBSTR(GC.CUENTA_CONTABLE,9,2)AS CUENTA_VIGENTE '+
'                FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC '+ // GUIA_CONTABLE@SICA GC CAMBIO POR BAJA DE BASE SICA 02/08/2012 JFOF
'                WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '+
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%FAC'' '+
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%AGR'' '+
'                AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '+
'                AND GC.EMPRESA = ''BCO2'' '+
'                AND GC.CODIGO_TRANSACCION IN (300000)    '+
'                AND GC.CLAVE_MONEDA = ''PESOS''  '+
'                AND GC.CAMPO_IMPORTE = ''02''   '+
'                AND (GC.CUENTA_CONTABLE LIKE ''13%'')) CtaAgrK,   '+
'              (SELECT ''KA'' AS CVE_CONCEPTO, CCP.CVE_PRODUCTO_CR,CTA_CONTABLE||''-''||SUBSTR(SUB_CTA_CONTABLE,1,4)||''-''||SUBSTR(SUB_CTA_CONTABLE,5,2) AS CUENTA_VIGENTE '+
'               FROM CR_CONT_PRODUCTO  CCP '+
'               WHERE CVE_PRODUCTO_CR LIKE ''%XXX'') CtaDDK '+
'           WHERE CtaInt.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '+
'           AND CtaAgrK.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '+
'           AND CtaDDK.CVE_PRODUCTO_CR (+)= cp.CVE_PRODUCTO_CRE  )TABCTA, '+
//REFINANCIAMEINTO
'          (SELECT FINAN.ID_CREDITO, '+
'                 SUM(FINAN.IMP_FINAN_ADIC - FINAN.IMP_PAGADO) IMPORTEREF '+
'            FROM CR_FINAN_ADIC FINAN, CR_CREDITO CRD, CR_CONTRATO, CR_PRODUCTO '+
'           WHERE TO_DATE('''+sFecha3+''',''DD/MM/YYYY'') > FINAN.F_VENCIMIENTO '+
'             AND FINAN.IMP_FINAN_ADIC - FINAN.IMP_PAGADO > 0 '+
'             AND CRD.ID_CREDITO = FINAN.ID_CREDITO '+
'             AND CRD.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
'             AND CRD.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+
'             AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE '+
'           GROUP BY FINAN.ID_CREDITO ) TABREF '+
'     ,( SELECT ID_CREDITO, IMP_INT_VDO_EX + IMP_INT_VDO_NE AS IMP_INTER_IMP '+
'        FROM CR_CON_ADEUDO_SDO  WHERE F_CIERRE = '''+sFecha3+''' ) F '+
//WHERE PRINCIPAL
' WHERE A.CREDITO=C.ID_CREDITO '+
' AND   D.ID_ACREDITADO(+)=A.ID_OLTP_ACREDITADO '+
' AND   E.id_credito(+)=C.ID_CREDITO  '+
' AND   C.CVE_PRODUCTO_CRE = TABCTA.CVE_PRODUCTO_CRE(+) '+
' AND   TABCTAICRE.ID_EMPRESA (+)= C.ID_EMPRESA '+
' AND   TABCTAICRE.CVE_PRODUCTO_CRE (+)= C.CVE_PRODUCTO_CRE '+
' AND   TABCTAICRE.CVE_MONEDA (+)= C.CVE_MONEDA '+
' AND   C.ID_CREDITO = TABREF.ID_CREDITO(+) '+
' AND  (nvl(decode(A.ID_OLTP_MONEDA,840,TABREF.IMPORTEREF*'+sTipDol+',800,TABREF.IMPORTEREF*'+sTipUDI+',TABREF.IMPORTEREF),0) + '+
'       A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP ) <> 0 '+
//' AND   SUBSTR(NVL(TABCTA.CUENTA_VIGENTE_K,TABCTAICRE.CVE_CTA_CONT_CAREVI),1,2)=''13'' '+ // END_EASA4011     22.AGO.2007     MOSTRAR TODO >/
' AND   A.CREDITO = F.ID_CREDITO(+) '+
' ) '+
' UNION ALL '+
//--INTERCREDITOS CRE_CREDITO 12.48
' ( '+
' SELECT A.ID_OLTP_ACREDITADO, A.ID_OLTP_PROM_ASOC,A.ID_OLTP_PROM_ADMIN, A.producto, A.ORI_REC_GBL, '+
'        DECODE(A.IMP_SDO_K_VEN_VP, 0, C.TASA_APLICADA, C.TASA_APLI) AS TASA_APLICADA, '+
'        A.ID_OLTP_MONEDA,A.CVE_CAT_MINIMO, TO_CHAR(C.TIPO_CUENTA) AS t_credito, '+
'        A.IMP_SDO_K_VIG_VP, A.IMP_SDO_K_IMP_VP, A.IMP_SDO_K_VEN_VP, A.IMP_INT_CORTE_VP, A.IMP_SDO_IO_IMP_VP+ F.IMP_INTER_IMP AS IMP_SDO_IO_IMP_VP, '+
'        C.ID_CREDITO, C.T_PERS, C.CVE_ACTIV_ECO_SITI, C.LOCALIDAD, C.ID_CONTRATO, C.F_INICIO, '+
'        C.F_VENCIMIENTO, C.CVE_OPERATIVA, C.CVE_AMORTIZACION, C.CVE_PAG_INTERES, '+
'        decode(A.ID_OLTP_MONEDA,840,C.IMP_CREDITO*'+sTipDol+',800,C.IMP_CREDITO*'+sTipUDI+',C.IMP_CREDITO) as IMP_CREDITO,  '+
'        C.CVE_TASA_REFER, C.SOBRETASA, C.CVE_GRUPO_ECO, '+
'        D.cve_cal_acred, E.CVE_CALIFIC_CUB, E.IMP_CUBIERTO, E.IMP_EXPUESTO, E.IMP_RESERVA_CUB, '+
'        E.IMP_RESERVA_EXP, E.PCT_CUBIERTO, E.PCT_EXPUESTO, (E.IMP_RESERVA_CUB + E.IMP_RESERVA_EXP) TOT_RESERVA, '+
'        decode(CVE_PER_JURIDICA,''PM'',ACREDITADO,NOMBREF) AS NOMBRE, '+
'        DECODE (TIPO_DISPOSICION,''RN'', '+
'          DECODE(CVE_SUB_TIP_BCO-47,0,TIPO_CUENTA||''-''||SUBSTR(CTA_CONTABLE,1,4)||''-''||SUBSTR(CTA_CONTABLE,5,2), '+
'                                          ''1324-''||substr(TIPO_CUENTA,4,2)||''01-00''), '+
'            TIPO_CUENTA||''-''||SUBSTR(CTA_CONTABLE,1,4)||''-''||SUBSTR(CTA_CONTABLE,5,2) )  CUENTA_CONTABLE, '+
'        DECODE (TIPO_DISPOSICION, ''RN'', '+
'          DECODE(CVE_SUB_TIP_BCO-47,0, '+
'             DECODE(CVE_CALCULO,''AN'',''2601-''||SUBSTR(CTA_INTERES,5,2)||''-0000'', '+
'                    SUBSTR(CTA_INTERES,1,4)||''-''||SUBSTR(CTA_INTERES,5,4)||''-''||SUBSTR(CTA_INTERES,9,2)), '+
'              ''1319-2000-00''),  '+
'              DECODE(CVE_CALCULO,''AN'',''2601-''||SUBSTR(CTA_INTERES,5,2)||''-0000'', '+
'              SUBSTR(CTA_INTERES,1,4)||''-''||SUBSTR(CTA_INTERES,5,4)||''-''||SUBSTR(CTA_INTERES,9,2)) )  CUENTA_INTERES, 0 AS IMPORTEREF, '+
'        (A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP) AS TOTCREDITO, CVE_CALIFIC_EXP '+
' FROM '+
//    /***** BUSCA EN DWH *****/ 
'     ( select ID_OLTP_ACREDITADO, ACREDITADO, ID_OLTP_PROM_ASOC,ID_OLTP_PROM_ADMIN, CREDITO, '+
'              ID_OLTP_PRODUCTO||'' ''||PRODUCTO producto, ORI_REC_GBL, ORIGEN_INFO, ID_OLTP_MONEDA,CVE_CAT_MINIMO,  '+
'              IMP_SDO_K_VIG_VP, IMP_SDO_K_IMP_VP, IMP_SDO_K_VEN_VP, IMP_INT_CORTE_VP, IMP_SDO_IO_IMP_VP,IMP_INT_CORTE '+
'       from DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '+
'       where aa.ID_ANIO_MES = '+ sFecha2 +
'       and   aa.ID_CREDITO = bb.ID_CREDITO '+
'       and   ORIGEN_INFO=''INTERCREDITOS'' )  A, '+
//    /***** BUSCA DATOS GENERALES EN CORPORATIVO *****/
'     ( select '+
'         P.ID_PERSONA, C.ID_CREDITO, decode(p.CVE_PER_JURIDICA,''PM'',''MORAL'',DECODE(B_ACTIV_EMPRESA,''V'',''FISICA ACT EMP'',''FISICA'')) T_PERS, '+
'         decode(p.CVE_PER_JURIDICA,''PM'','''',TRIM(APELLIDO_PATERNO)||'' ''||TRIM(APELLIDO_MATERNO)||'' ''||NOMBRE_PERSONA) NOMBREF, '+
'         p.CVE_ACTIV_ECO_SITI, PB.DESC_POBLACION AS LOCALIDAD, C.ID_CONTRATO, p.CVE_PER_JURIDICA, '+
'         C.F_AUT_OPERACION AS F_INICIO, DECODE(C.F_TRASPASO_VENC,NULL,C.F_VALOR_CRED +C.DIAS_PLAZO,C.F_TRASPASO_VENC) AS F_VENCIMIENTO, ''N/A'' AS CVE_OPERATIVA,  '+
'         DECODE(C.B_CAPITAL_PER,''V'',''POR PERIODO'',''AL VENCIMIENTO'')AS CVE_AMORTIZACION, '+
'         DECODE(B_INTERES_PER,''V'',''POR PERIODOS'',DECODE(CVE_CALCULO,''AN'',''AL INICIO'',''AL VENCIMIENTO''))AS CVE_PAG_INTERES, '+
'         C.IMP_CREDITO, C.CVE_TASA_REFER, C.SOBRETASA,CTA_INTERES,CVE_CALCULO,CST.CVE_SUB_TIP_BCO,TIPO_DISPOSICION, '+
'         CTA_CONTABLE,CTC.TIPO_CUENTA, CA.CVE_GRUPO AS CVE_GRUPO_ECO, '+
'         TA.TASA_APLICADA, (SELECT TASA_APLICADA FROM CRE_PROV_DIARIA WHERE ID_CREDITO=C.ID_CREDITO '+
'                            AND F_PROVISION = (SELECT MAX(F_PROVISION) FROM CRE_PROV_DIARIA WHERE ID_CREDITO=C.ID_CREDITO)) AS TASA_APLI '+
'       from CRE_CREDITO C, CONTRATO CT, CRE_contrato CCT, persona p, persona_fisica pf, persona_moral pm, '+
'            DOMICILIO D, POBLACION PB, CRE_SUB_TIP_BCO CST, CRE_SUB_TIP_CNBV cnbv, '+
'            CRE_TIPO_CREDITO CTC, CRE_CLIENTE CA, CRE_PROV_DIARIA TA '+
'       where C.ID_CONTRATO =CT.ID_CONTRATO '+
'       AND CCT.id_contrato = CT.id_contrato '+
'       AND CT.ID_TITULAR = P.ID_PERSONA '+
'       AND (pm.ID_PERSONA(+)= p.ID_PERSONA AND pf.ID_PERSONA(+)=p.ID_PERSONA) '+
'       AND D.ID_DOMICILIO = P.ID_DOMICILIO '+
'       AND PB.CVE_POBLACION= D.CVE_ESTADO '+
'       AND CCT.CVE_SUB_TIP_BCO  =  CST.CVE_SUB_TIP_BCO '+
'       AND CST.CVE_SUB_TIP_CNBV= CNBV.CVE_SUB_TIP_CNBV  '+
'       AND CNBV.CVE_TIPO_CREDITO = CTC.CVE_TIPO_CREDITO '+
'       AND CA.ID_PERSONA = P.ID_PERSONA '+
'       AND TA.ID_CREDITO (+)=C.ID_CREDITO '+
'       AND TA.F_PROVISION(+)='''+sFecha3+''' ) C, '+
//    /***** BUSCA CALIFICACIÓN DEL DEUDOR EN SICC *****/
'     ( SELECT ID_ACREDITADO, cve_cal_acred   FROM cr_sicc_cal_acre csa '+
'       WHERE CSA.ANIO_MES=  '+sFechaR+' AND CSA.SIT_SICC_CAL_ACR = ''AC'') D, '+
//    /***** BUSCA DATOS DEL CREDITO EN SIC *****/
'     ( SELECT id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPUESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUESTO, CVE_CALIFIC_EXP '+
'       FROM CR_SICC_CAL_CRED CSC  WHERE CSC.ANIO_MES= '+sFechaR+' AND CSC.SIT_SICC_CAL_CRE = ''AC'' ' +
'       GROUP BY id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPUESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUESTO, CVE_CALIFIC_EXP '+
'      ) E, '+
'     ( SELECT ID_CREDITO, IMP_INT_VDO_EX + IMP_INT_VDO_NE AS IMP_INTER_IMP '+
'        FROM CR_CON_ADEUDO_SDO  WHERE F_CIERRE = '''+sFecha3+''' ) F '+
//    /***** CUENTA DE CAPITAL Y CUENTA DE INTERESES *****/
' WHERE A.CREDITO=C.ID_CREDITO '+
' AND   D.ID_ACREDITADO(+)=A.ID_OLTP_ACREDITADO '+
' AND   E.id_credito(+)=C.ID_CREDITO  '+
' AND   (A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP)  <> 0 '+
//' AND  SUBSTR(TIPO_CUENTA,1,2)=''13'' '+ // END_EASA4011     22.AGO.2007     MOSTRAR TODO >/
' AND   A.CREDITO = F.ID_CREDITO(+) '+
' ) ';
  FunSQL:=sSql;
end;


procedure TqrCartera.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlCliente.Caption:= sCLIENTE;
  qrlCuenta.Caption := sCUENTA;
  qrlSaldo.Caption  := sSALDO;
  PrintBand:=True;
end;

//MARA4356 SE AGREGA PARA SALDO CONTABLE DE LA CUENTA 26096222
procedure   TqrCartera.BuscaSDOConta2609(var sCte, sSdo, sCta:String; sFecha:String);
begin 
//  qBusca:=TQuery.Create(nil);
    sCte:='Cliente 2609 no encontrado';
    sSdo:=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',0);
    sCta:='Cuenta no localizada';
    qBusca.Close;
    qBusca.SQL.Text:=
    ' SELECT substr(cp.CVE_CTA_CONTABLE,1,4) as cte, SDO_FIN_PER,DESC_CUENTAC '+
    ' FROM CG_PERIODO_CTA@CONT CP, CG_CUENTA@CONT CC '+
    ' WHERE CP.ID_EMPRESA       = 2 '+
    ' AND   CP.CVE_EJER_CONT    = TO_NUMBER(TO_CHAR(TO_DATE('''+sFecha+'''),''YYYY'')) '+
    ' AND   CP.CVE_CTA_CONTABLE = (''26096222'') '+
    ' AND   CP.NUM_PERIODOC     = TO_NUMBER(TO_CHAR(TO_DATE('''+sFecha+'''),''MM'')) '+
    ' AND   CC.ID_EMPRESA       = CP.ID_EMPRESA '+
    ' AND   CC.CVE_EJER_CONT    = CP.CVE_EJER_CONT '+
    ' AND   CC.CVE_CTA_CONTABLE = CP.CVE_CTA_CONTABLE ';  
    qBusca.Open;
    if qBusca<>nil then
    begin
      qBusca.First;
      sCte:=qBusca.FieldByName('cte').AsString;
      sSdo:=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',qBusca.FieldByName('SDO_FIN_PER').AsFloat);
      sCta:=qBusca.FieldByName('DESC_CUENTAC').AsString;
    end;
    qBusca.Close;  
end;

end.
