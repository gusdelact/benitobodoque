// Sistema         : REPORTE CARTERA CREDITICIA INSTITUCIONAL
// Fecha de Inicio : SEP 2006
// Función forma   : REPORTE CARTERA CREDITICIA INSTITUCIONAL
// Diseñado por    : ALICIA MAYA
// Comentarios     :
unit RptCartTot;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, intfrm, dialogs, Db,
  DBTables, IntHead, UnSQL2, IntGenCre;// ComObj,IntXls;

type
  TqrCartTot = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qry: TQuery;
    header4: TQRBand;
    h59: TQRLabel;
    h58: TQRLabel;
    h57: TQRLabel;
    h56: TQRLabel;
    h55: TQRLabel;
    h54: TQRLabel;
    h53: TQRLabel;
    h52: TQRLabel;
    h51: TQRLabel;
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
    qryTOT_RESERVA: TFloatField;
    qGroupCte: TQRGroup;
    grFooterCto: TQRBand;
    qGroupCto: TQRGroup;
    grFooterCte: TQRBand;
    DetailBand1: TQRBand;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel33: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText41: TQRDBText;
    QRLabel43: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRBand2: TQRBand;
    QRLabel46: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr1: TQRExpr;
    QRLabel54: TQRLabel;
    qlIMP_CREDITO: TQRLabel;
    qlIMP_SDO_K_VIG_VP: TQRLabel;
    qlIMP_SDO_K_IMP_VP: TQRLabel;
    qlIMP_SDO_K_VEN_VP: TQRLabel;
    qlIMPORTEREF: TQRLabel;
    qlIMP_INT_CORTE_VP: TQRLabel;
    qlIMP_SDO_IO_IMP_VP: TQRLabel;
    QRLabel55: TQRLabel;
    qloIMP_CREDITO: TQRLabel;
    qloIMP_SDO_K_VIG_VP: TQRLabel;
    qloIMP_SDO_K_IMP_VP: TQRLabel;
    qloIMP_SDO_K_VEN_VP: TQRLabel;
    qloIMPORTEREF: TQRLabel;
    qloIMP_INT_CORTE_VP: TQRLabel;
    qloIMP_SDO_IO_IMP_VP: TQRLabel;
    QRDBText42: TQRDBText;
    qryTOTCREDITO: TFloatField;
    qloTOTCREDITO: TQRLabel;
    qlTOTCREDITO: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    qdContrato: TQRDBText;
    QRExpr8: TQRExpr;
    h11: TQRLabel;
    h12: TQRLabel;
    h13: TQRLabel;
    h14: TQRLabel;
    h15: TQRLabel;
    h16: TQRLabel;
    h17: TQRLabel;
    h18: TQRLabel;
    h21: TQRLabel;
    h31: TQRLabel;
    h22: TQRLabel;
    h32: TQRLabel;
    h33: TQRLabel;
    h34: TQRLabel;
    h23: TQRLabel;
    h35: TQRLabel;
    h24: TQRLabel;
    h36: TQRLabel;
    h25: TQRLabel;
    h37: TQRLabel;
    h26: TQRLabel;
    h28: TQRLabel;
    h38: TQRLabel;
    h27: TQRLabel;
    h29: TQRLabel;
    h41: TQRLabel;
    h42: TQRLabel;
    h43: TQRLabel;
    h44: TQRLabel;
    h45: TQRLabel;
    h46: TQRLabel;
    h47: TQRLabel;
    h48: TQRLabel;
    qryTASA_APLICADA: TFloatField;
    qryT_CREDITO: TStringField;
    QRLabel4: TQRLabel;
    QRDBText43: TQRDBText;
    qryCVE_CALIFIC_EXP: TStringField;
    qrlSaldo: TQRLabel;
    qrlCuenta: TQRLabel;
    qrlCliente: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape3: TQRShape;
    qBusca: TQuery;
    qryNUM_DIAS_VDO: TFloatField;
     Function  FunSQL:String;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qGroupCteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qGroupCtoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure grFooterCtoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure grFooterCteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
        procedure   BuscaSDOConta2609(var sCte, sSdo, sCta:String; sFecha:String);  //MARA4356 SE AGREGA PARA SALDO CONTABLE DE LA CUENTA 26096222
  end;

var
  qrCartTot: TqrCartTot;
  sTipDol, sTipUDI, sFechaR, sFecha2,sFecha3 :STring; sTipoq:Integer;
  //CLIENTE
  dIMP_CREDITO,  dIMP_SDO_K_VIG_VP,  dIMP_SDO_K_IMP_VP,  dIMP_SDO_K_VEN_VP,  dIMPORTEREF, dIMP_INT_CORTE_VP, dIMP_SDO_IO_IMP_VP:Double;
  //CONTRATO
  doIMP_CREDITO, doIMP_SDO_K_VIG_VP, doIMP_SDO_K_IMP_VP, doIMP_SDO_K_VEN_VP, doIMPORTEREF,doIMP_INT_CORTE_VP,doIMP_SDO_IO_IMP_VP:Double;
  sCLIENTE, sSALDO, sCUENTA :String;

procedure  EXE_REP_CARTERA_TOT(Objeto:TInterFrame; sf_Periodo :String; sTipo:Integer; Preview:Boolean);

implementation

{$R *.DFM}
procedure  EXE_REP_CARTERA_TOT(Objeto:TInterFrame; Sf_Periodo :String; sTipo:Integer; Preview:Boolean);
VAR sPeriodo:String;
    Anio, Mes, Dia: Word;  rDol, rUdi:Real;
begin
  sFechaR:=sf_Periodo;
  sFecha3:=sf_Periodo;
  sTipoq:=sTipo;
  DecodeDate(StrToDate(sFechaR), Anio, Mes, Dia);
  CASE MES OF
   1 ,2 ,3 :sFechaR:=IntTOStr(Anio-1)+'12';
   4, 5 ,6 :sFechaR:=IntTOStr(Anio)  +'03';
   7, 8 ,9 :sFechaR:=IntTOStr(Anio)  +'06';
   10,11,12:sFechaR:=IntTOStr(Anio)  +'09';
  end;
  qrCartTot:= TqrCartTot.Create(nil);
  try
  qrCartTot.QRInterEncabezado1.Apli:=Objeto.Apli;
  qrCartTot.QRInterEncabezado1.Titulo1:='Reporte de Cartera Crediticia Institucional (1001)';
  GetSQLStr(' select TO_CHAR(TO_DATE('''+Sf_Periodo+'''),''MONTH'',''NLS_DATE_LANGUAGE=SPANISH'')||'' ''||to_char(TO_DATE('''+Sf_Periodo+'''),''YYYY'') '+
            ' as fecha  from dual ',
            Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'fecha',sPeriodo,False);
  if sTipoq = 0  //agrupación por cliente
  then qrCartTot.QRInterEncabezado1.Titulo2:='Por Cliente. '+sPeriodo 
  else if sTipoq = 1
       then qrCartTot.QRInterEncabezado1.Titulo2:='Por Contrato. '+sPeriodo 
       else qrCartTot.QRInterEncabezado1.Titulo2:='Por Contrato y Por Cliente '+sPeriodo ;
  qrCartTot.QRInterEncabezado1.NomReporte:='IntCrCartera.pas';
  qrCartTot.qry.DatabaseName:=Objeto.Apli.DataBaseName;
  qrCartTot.qry.SessionName:=Objeto.Apli.SessionName;
  qrCartTot.qry.Close;
                                                                    
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
  //MARA4356 BUSCA LA CUENTA CONTABLE 2609 INICIA
  qrCartTot.qBusca.DataBaseName:= Objeto.Apli.DataBaseName;
  qrCartTot.qBusca.SessionName := Objeto.Apli.SessionName;
  qrCartTot.BuscaSDOConta2609(sCLIENTE, sSALDO, sCUENTA, Sf_Periodo);
  //MARA4356 BUSCA LA CUENTA CONTABLE 2609 TERMINA
  sTipDol:=FloatToStr(rDol);
  sTipUDI:=FloatToStr(rUDI);
  qrCartTot.qry.SQL.Text:=qrCartTot.FunSQL;
  qrCartTot.qry.SQL.SaveToFile('C:\1001.TXT');
  
  dIMP_CREDITO:=0;  dIMP_SDO_K_VIG_VP:=0;  dIMP_SDO_K_IMP_VP:=0;  dIMP_SDO_K_VEN_VP:=0;  dIMPORTEREF:=0;  dIMP_INT_CORTE_VP:=0;  dIMP_SDO_IO_IMP_VP:=0;
  doIMP_CREDITO:=0; doIMP_SDO_K_VIG_VP:=0; doIMP_SDO_K_IMP_VP:=0; doIMP_SDO_K_VEN_VP:=0; doIMPORTEREF:=0; doIMP_INT_CORTE_VP:=0; doIMP_SDO_IO_IMP_VP:=0;
  qrCartTot.qry.Open;
  if not qrCartTot.qry.IsEmpty then
  begin
    CASE sTipo OF
    0:begin  //agrupación por cliente
        with qrCartTot do begin
        qGroupCto.Enabled:=False;
        grFooterCto.Enabled:=False;
        qdContrato.Enabled:=True;
        h38.Enabled:=True;
        grFooterCte.Enabled:=True;
        DetailBand1.Height:=0;
        h21.Enabled:=False; h22.Enabled:=False; h23.Enabled:=False; h24.Enabled:=False; h25.Enabled:=False; h26.Enabled:=False; h27.Enabled:=False; h28.Enabled:=False; h29.Enabled:=False;
        h41.Top:=16; h42.Top:=16; h43.Top:=16; h44.Top:=16; h45.Top:=16; h46.Top:=16; h47.Top:=16; h48.Top:=16;
        header4.Height:=32;
        end;
      end;
     1:begin //agrupación por contrato
       with qrCartTot do begin
        grFooterCte.Enabled:=False;
        qGroupCto.Enabled:=True;
        grFooterCto.Enabled:=True;
        qdContrato.Enabled:=False;
        h38.Enabled:=False;
        DetailBand1.Height:=0;
        h21.Enabled:=False; h22.Enabled:=False; h23.Enabled:=False; h24.Enabled:=False; h25.Enabled:=False; h26.Enabled:=False; h27.Enabled:=False; h28.Enabled:=False; h29.Enabled:=False;
        h41.Top:=16; h42.Top:=16; h43.Top:=16; h44.Top:=16; h45.Top:=16; h46.Top:=16; h47.Top:=16; h48.Top:=16;
        header4.Height:=32;
        end;
       end;
     -1:begin //agrupación por contrato y por cliente
       with qrCartTot do begin
        grFooterCte.Enabled:=True;
        qGroupCto.Enabled:=True;
        grFooterCto.Enabled:=True;
        qdContrato.Enabled:=False;
        h38.Enabled:=False;
        DetailBand1.Height:=66;
        h21.Enabled:=True; h22.Enabled:=True; h23.Enabled:=True; h24.Enabled:=True; h25.Enabled:=True; h26.Enabled:=True; h27.Enabled:=True; h28.Enabled:=True; h29.Enabled:=True;
        h41.Top:=48; h42.Top:=48; h43.Top:=48; h44.Top:=48; h45.Top:=48; h46.Top:=48; h47.Top:=48; h48.Top:=48;
        header4.Height:=80;
        end;
       end;
     end;
    if Preview then qrCartTot.preview else qrCartTot.Print    
  end
  else
    ShowMessage('No existen datos para los criterios seleccionados');

  finally
    if qrCartTot.qry <> nil then qrCartTot.qry.Free;
  end; //try
end;


FUNCTION  TqrCartTot.FunSQL:String;
var sSql:String;
begin
  sSql:=
//ICRE CR_CREDITO 58.23
' ( '+ coCRLF +
' SELECT A.ID_OLTP_ACREDITADO, A.ID_OLTP_PROM_ASOC,A.ID_OLTP_PROM_ADMIN, A.producto, A.ORI_REC_GBL, C.TASA_APLICADA, '+ coCRLF +
'        A.ID_OLTP_MONEDA,A.CVE_CAT_MINIMO, TO_CHAR(C.CVE_TIPO_CRED_BC) AS t_credito,  '+ coCRLF +
'        A.IMP_SDO_K_VIG_VP, A.IMP_SDO_K_IMP_VP, A.IMP_SDO_K_VEN_VP, A.IMP_INT_CORTE_VP, A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP AS IMP_SDO_IO_IMP_VP, '+ coCRLF +
'        C.ID_CREDITO, C.T_PERS, C.CVE_ACTIV_ECO_SITI, C.LOCALIDAD, C.ID_CONTRATO, C.F_INICIO,  '+ coCRLF +
'        C.F_VENCIMIENTO, C.CVE_OPERATIVA, C.CVE_AMORTIZACION, C.CVE_PAG_INTERES,  '+ coCRLF +
'        decode(A.ID_OLTP_MONEDA,840,C.IMP_CREDITO*'+sTipDol+',800,C.IMP_CREDITO*'+sTipUDI+',C.IMP_CREDITO) as IMP_CREDITO,  '+ coCRLF +
'        C.CVE_TASA_REFER, C.SOBRETASA, C.CVE_GRUPO_ECO,  '+ coCRLF +
'        D.cve_cal_acred, E.CVE_CALIFIC_CUB, E.IMP_CUBIERTO, E.IMP_EXPUESTO, E.IMP_RESERVA_CUB,  '+ coCRLF +
'        E.IMP_RESERVA_EXP, E.PCT_CUBIERTO, E.PCT_EXPUESTO, (E.IMP_RESERVA_CUB + E.IMP_RESERVA_EXP) TOT_RESERVA,  '+ coCRLF +
'        decode(CVE_PER_JURIDICA,''PM'',ACREDITADO,NOMBREF) AS NOMBRE,  '+ coCRLF +
'        NVL(TABCTA.CUENTA_VIGENTE_K,TABCTAICRE.CVE_CTA_CONT_CAREVI) AS CUENTA_CONTABLE,  '+ coCRLF +
'        NVL(TABCTA.CUENTA_VIGENTE_INT,TABCTAICRE.CVE_CTA_CONT_INREVI) AS CUENTA_INTERES,  '+ coCRLF +
'        nvl(decode(A.ID_OLTP_MONEDA,840,TABREF.IMPORTEREF*'+sTipDol+',800,TABREF.IMPORTEREF*'+sTipUDI+',TABREF.IMPORTEREF),0) as IMPORTEREF,    '+ coCRLF +
//       (nvl(decode(A.ID_OLTP_MONEDA,840,TABREF.IMPORTEREF*'+sTipDol+',800,TABREF.IMPORTEREF*'+sTipUDI+',TABREF.IMPORTEREF),0) +  '+
'        (A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP) AS TOTCREDITO,  CVE_CALIFIC_EXP,  '+ coCRLF +




' FROM '+ coCRLF +
//    /***** BUSCA EN DWH *****/
'     ( select ID_OLTP_ACREDITADO, ACREDITADO, ID_OLTP_PROM_ASOC,ID_OLTP_PROM_ADMIN, CREDITO, '+ coCRLF +
'              ID_OLTP_PRODUCTO||'' ''||PRODUCTO producto, ORI_REC_GBL, ORIGEN_INFO, ID_OLTP_MONEDA,CVE_CAT_MINIMO, '+ coCRLF +
'              IMP_SDO_K_VIG_VP, IMP_SDO_K_IMP_VP, IMP_SDO_K_VEN_VP, IMP_INT_CORTE_VP, IMP_SDO_IO_IMP_VP, IMP_INT_CORTE '+ coCRLF +
'       from DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '+ coCRLF +
'       where aa.ID_ANIO_MES = '+ sFecha2 + coCRLF +
'       and   aa.ID_CREDITO = bb.ID_CREDITO '+ coCRLF +
'       and   ORIGEN_INFO=''ICRE'' )  A, '+ coCRLF +
//    /***** BUSCA DATOS GENERALES EN CORPORATIVO *****/
'     ( select '+ coCRLF +
'        P.ID_PERSONA, C.ID_CREDITO, decode(p.CVE_PER_JURIDICA,''PM'',''MORAL'',DECODE(B_ACTIV_EMPRESA,''V'',''FISICA ACT EMP'',''FISICA'')) T_PERS, '+ coCRLF +
'        decode(p.CVE_PER_JURIDICA,''PM'','''',TRIM(APELLIDO_PATERNO)||'' ''||TRIM(APELLIDO_MATERNO)||'' ''||NOMBRE_PERSONA) NOMBREF, '+ coCRLF +
'        p.CVE_ACTIV_ECO_SITI, PB.DESC_POBLACION AS LOCALIDAD, C.ID_CONTRATO, p.CVE_PER_JURIDICA, '+ coCRLF +
'        C.F_INICIO,C.F_VENCIMIENTO, C.CVE_OPERATIVA, C.CVE_AMORTIZACION, C.CVE_PAG_INTERES, C.IMP_CREDITO, C.CVE_TASA_REFER, C.SOBRETASA, '+ coCRLF +
'        CP.cve_producto_cre, CCT.cve_moneda, CT.id_empresa, CVE_GRUPO_ECO  ,CP.CVE_TIPO_CRED_BC, CH.TASA_APLICADA '+ coCRLF +
'       from CR_CREDITO C, CONTRATO CT, cr_contrato CCT, persona p, persona_fisica pf, persona_moral pm, '+ coCRLF +
'            DOMICILIO D, POBLACION PB, CR_ACREDITADO CA, CR_PRODUCTO  CP, CR_HISTO_CRED ch '+ coCRLF +
'       where C.ID_CONTRATO =CT.ID_CONTRATO '+ coCRLF +
'       AND CCT.id_contrato = CT.id_contrato '+ coCRLF +
'       AND CT.ID_TITULAR = P.ID_PERSONA '+ coCRLF +
'       AND (pm.ID_PERSONA(+)= p.ID_PERSONA AND pf.ID_PERSONA(+)=p.ID_PERSONA) '+ coCRLF +
'       AND D.ID_DOMICILIO = P.ID_DOMICILIO '+ coCRLF +
'       AND PB.CVE_POBLACION= D.CVE_ESTADO '+ coCRLF +
'       AND CA.ID_ACREDITADO = P.ID_PERSONA '+ coCRLF +
'       AND CCT.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE '+ coCRLF +
'       AND CH.ID_CREDITO (+)= C.ID_CREDITO '+ coCRLF +
'       AND CH.F_CIERRE (+)= '''+sFecha3+''' ) C, '+ coCRLF +
//     /***** BUSCA CALIFICACIÓN DEL DEUDOR EN SICC *****/
'     ( SELECT ID_ACREDITADO, cve_cal_acred   FROM cr_sicc_cal_acre csa '+ coCRLF +
'       WHERE CSA.ANIO_MES=  '+sFechaR+' AND CSA.SIT_SICC_CAL_ACR = ''AC'') D, '+ coCRLF +
//    /***** BUSCA DATOS DEL CREDITO EN SIC *****/
'     ( SELECT id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPUESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUESTO, CVE_CALIFIC_EXP '+ coCRLF +
'       FROM CR_SICC_CAL_CRED CSC  WHERE CSC.ANIO_MES= '+sFechaR+' AND CSC.SIT_SICC_CAL_CRE = ''AC'' ' +
'       GROUP BY id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPUESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUESTO, CVE_CALIFIC_EXP '+
'      ) E, '+ coCRLF +
//    /***** CUENTA DE CAPITAL Y CUENTA DE INTERESES *****/
' 	( SELECT PROD.ID_EMPRESA, PROD.CVE_PRODUCTO_CRE, PROD.CVE_MONEDA, '+ coCRLF +
'              SUBSTR(INREVI.CVE_CTA_CONT,1,30) CVE_CTA_CONT_INREVI, SUBSTR(CAREVI.CVE_CTA_CONT,1,30) CVE_CTA_CONT_CAREVI '+ coCRLF +
'  	  FROM '+ coCRLF +
' 		 (SELECT CP.*, CRPM.CVE_MONEDA '+ coCRLF +
'           FROM CR_PRODUCTO CP, '+ coCRLF +
'               (SELECT CVE_MONEDA, CVE_PRODUCTO_CRE, COUNT(*) FROM CR_REL_PROD_MON CRPM GROUP BY CVE_MONEDA, CVE_PRODUCTO_CRE ORDER BY CVE_MONEDA, CVE_PRODUCTO_CRE) CRPM '+ coCRLF +
'                WHERE CP.CVE_PRODUCTO_CRE IN (SELECT CVE_PRODUCTO_CRE FROM CR_CONT_SIS_PROD  WHERE CVE_CONT_SISTEMA = ''CTICRE'') '+ coCRLF +
'                AND   CRPM.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE) PROD, '+ coCRLF +
'               (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran '+ coCRLF +
'                WHERE CVE_OPER_CRED = ''INREVI'' AND   CVE_COMISION = ''NA'' AND   CVE_CONCEPTO = ''IMPBRU'' AND   CVE_TIPO_MOVTO = ''MD'' AND   TIPO_AFECTACION = ''D'') INREVI, '+ coCRLF +
'               (SELECT ID_EMPRESA,       CVE_PRODUCTO,       CVE_MONEDA,       PKGCRCONTA.STPOBTCUENTACONTA(CVE_CTA_CONTABLE,CVE_PRODUCTO,CVE_MONEDA,NULL) CVE_CTA_CONT  FROM cr_cont_cnf_tran '+ coCRLF +
'                WHERE CVE_OPER_CRED = ''CAREVI'' AND   CVE_COMISION = ''NA'' AND   CVE_CONCEPTO = ''IMPBRU'' AND   CVE_TIPO_MOVTO = ''MD'' AND   TIPO_AFECTACION = ''D'') CAREVI '+ coCRLF +
'           WHERE INREVI.ID_EMPRESA    (+)= PROD.ID_EMPRESA '+ coCRLF +
'           AND   INREVI.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE '+ coCRLF +
'           AND   INREVI.CVE_MONEDA    (+)= PROD.CVE_MONEDA  '+ coCRLF +
'           AND   CAREVI.ID_EMPRESA    (+)= PROD.ID_EMPRESA  '+ coCRLF +
'           AND   CAREVI.CVE_PRODUCTO  (+)= PROD.CVE_PRODUCTO_CRE  '+ coCRLF +
'           AND   CAREVI.CVE_MONEDA    (+)= PROD.CVE_MONEDA   )TABCTAICRE,  '+ coCRLF +
'          (SELECT CP.CVE_PRODUCTO_CRE, CUENTA_VIGENTE_INT, NVL(CtaAgrK.CUENTA_VIGENTE,CtaDDK.CUENTA_VIGENTE ) CUENTA_VIGENTE_K '+ coCRLF +
'           FROM cr_producto CP, '+ coCRLF +
'               (SELECT ''IN'' AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, SUBSTR(GC.CUENTA_CONTABLE,1,4) || ''-''||  '+ coCRLF +
'                       SUBSTR(GC.CUENTA_CONTABLE,5,4) || ''-''|| SUBSTR(GC.CUENTA_CONTABLE,9,2) AS CUENTA_VIGENTE_INT '+ coCRLF +
'                FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC '+ coCRLF + //GUIA_CONTABLE@SICA GC '+ coCRLF + CAMBIO POR BAJA DE BASE SICA 02/08/2012 JFOF
'                WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '+ coCRLF +
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%FAC'' '+ coCRLF +
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%AGR'' '+ coCRLF +
'                AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '+ coCRLF +
'                AND GC.EMPRESA = ''BCO2'' '+ coCRLF +
'                AND GC.CODIGO_TRANSACCION IN (306000, 306710) '+ coCRLF +
'                AND GC.CAMPO_IMPORTE IN (''03'',''06'') '+ coCRLF +
'                AND GC.CLAVE_MONEDA = ''PESOS'' '+ coCRLF +
'                AND (GC.CUENTA_CONTABLE LIKE ''13%'' OR GC.CUENTA_CONTABLE LIKE ''26%'')) CtaInt, '+ coCRLF +
'               (SELECT ''KA'' AS CVE_CONCEPTO, CP.CVE_PRODUCTO_CRE, '+ coCRLF +
'                       SUBSTR(GC.CUENTA_CONTABLE,1,4)|| ''-''|| SUBSTR(GC.CUENTA_CONTABLE,5,4)||''-''|| SUBSTR(GC.CUENTA_CONTABLE,9,2)AS CUENTA_VIGENTE '+ coCRLF +
'                FROM CR_PRODUCTO CP, CR_CONT_PRODUCTO CCP, Z_CRED_PASIVA GC '+ coCRLF + //GUIA_CONTABLE@SICA GC '+ coCRLF + CAMBIO POR BAJA DE BASE SICA 02/08/2012 JFOF
'                WHERE CCP.CVE_PRODUCTO_CR = CP.CVE_PRODUCTO_CRE '+ coCRLF +
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%FAC'' '+ coCRLF +
'                AND CCP.CVE_PRODUCTO_CR NOT LIKE ''%AGR'' '+ coCRLF +
'                AND GC.CLAVE_TIPO_CREDITO = CCP.TIPO_CUENTAO '+ coCRLF +
'                AND GC.EMPRESA = ''BCO2'' '+ coCRLF +
'                AND GC.CODIGO_TRANSACCION IN (300000)    '+ coCRLF +
'                AND GC.CLAVE_MONEDA = ''PESOS''  '+ coCRLF +
'                AND GC.CAMPO_IMPORTE = ''02''   '+ coCRLF +
'                AND (GC.CUENTA_CONTABLE LIKE ''13%'')) CtaAgrK,   '+ coCRLF +
'              (SELECT ''KA'' AS CVE_CONCEPTO, CCP.CVE_PRODUCTO_CR,CTA_CONTABLE||''-''||SUBSTR(SUB_CTA_CONTABLE,1,4)||''-''||SUBSTR(SUB_CTA_CONTABLE,5,2) AS CUENTA_VIGENTE '+ coCRLF +
'               FROM CR_CONT_PRODUCTO  CCP '+ coCRLF +
'               WHERE CVE_PRODUCTO_CR LIKE ''%XXX'') CtaDDK '+ coCRLF +
'           WHERE CtaInt.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '+ coCRLF +
'           AND CtaAgrK.CVE_PRODUCTO_CRE (+)= cp.CVE_PRODUCTO_CRE '+ coCRLF +
'           AND CtaDDK.CVE_PRODUCTO_CR (+)= cp.CVE_PRODUCTO_CRE  )TABCTA, '+ coCRLF +
//REFINANCIAMEINTO
'          (SELECT FINAN.ID_CREDITO, '+ coCRLF +
'                 SUM(FINAN.IMP_FINAN_ADIC - FINAN.IMP_PAGADO) IMPORTEREF '+ coCRLF +
'            FROM CR_FINAN_ADIC FINAN, CR_CREDITO CRD, CR_CONTRATO, CR_PRODUCTO '+ coCRLF +
'           WHERE TO_DATE('''+sFecha3+''',''DD/MM/YYYY'') > FINAN.F_VENCIMIENTO '+ coCRLF +
'             AND FINAN.IMP_FINAN_ADIC - FINAN.IMP_PAGADO > 0 '+ coCRLF +
'             AND CRD.ID_CREDITO = FINAN.ID_CREDITO '+ coCRLF +
'             AND CRD.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+ coCRLF +
'             AND CRD.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+ coCRLF +
'             AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE '+ coCRLF +
'           GROUP BY FINAN.ID_CREDITO ) TABREF '+ coCRLF +
'     ,( SELECT ID_CREDITO, IMP_INT_VDO_EX + IMP_INT_VDO_NE AS IMP_INTER_IMP '+ coCRLF +
'        FROM CR_CON_ADEUDO_SDO  WHERE F_CIERRE = '''+sFecha3+''' ) F '+ coCRLF +
//WHERE PRINCIPAL
' WHERE A.CREDITO=C.ID_CREDITO '+ coCRLF +
' AND   D.ID_ACREDITADO(+)=A.ID_OLTP_ACREDITADO '+ coCRLF +
' AND   E.id_credito(+)=C.ID_CREDITO  '+ coCRLF +
' AND   C.CVE_PRODUCTO_CRE = TABCTA.CVE_PRODUCTO_CRE(+) '+ coCRLF +
' AND   TABCTAICRE.ID_EMPRESA (+)= C.ID_EMPRESA '+ coCRLF +
' AND   TABCTAICRE.CVE_PRODUCTO_CRE (+)= C.CVE_PRODUCTO_CRE '+ coCRLF +
' AND   TABCTAICRE.CVE_MONEDA (+)= C.CVE_MONEDA '+ coCRLF +
' AND   C.ID_CREDITO = TABREF.ID_CREDITO(+) '+ coCRLF +
' AND  (nvl(decode(A.ID_OLTP_MONEDA,840,TABREF.IMPORTEREF*'+sTipDol+',800,TABREF.IMPORTEREF*'+sTipUDI+',TABREF.IMPORTEREF),0) + '+ coCRLF +
'       A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP) <> 0 '+ coCRLF +
//' AND   SUBSTR(NVL(TABCTA.CUENTA_VIGENTE_K,TABCTAICRE.CVE_CTA_CONT_CAREVI),1,2)=''13'' '+ coCRLF + // END_EASA4011     22.AGO.2007     MOSTRAR TODO >/
' AND   A.CREDITO = F.ID_CREDITO(+) '+ coCRLF +
' ) '+ coCRLF +
' UNION ALL '+ coCRLF +
//--INTERCREDITOS CRE_CREDITO 12.48
' ( '+ coCRLF +
' SELECT A.ID_OLTP_ACREDITADO, A.ID_OLTP_PROM_ASOC,A.ID_OLTP_PROM_ADMIN, A.producto, A.ORI_REC_GBL, '+ coCRLF +
'        DECODE(A.IMP_SDO_K_VEN_VP, 0, C.TASA_APLICADA, C.TASA_APLI) AS TASA_APLICADA, '+ coCRLF +
'        A.ID_OLTP_MONEDA,A.CVE_CAT_MINIMO, TO_CHAR(C.TIPO_CUENTA) AS t_credito, '+ coCRLF +
'        A.IMP_SDO_K_VIG_VP, A.IMP_SDO_K_IMP_VP, A.IMP_SDO_K_VEN_VP, A.IMP_INT_CORTE_VP, A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP AS IMP_SDO_IO_IMP_VP, '+ coCRLF +
'        C.ID_CREDITO, C.T_PERS, C.CVE_ACTIV_ECO_SITI, C.LOCALIDAD, C.ID_CONTRATO, C.F_INICIO, '+ coCRLF +
'        C.F_VENCIMIENTO, C.CVE_OPERATIVA, C.CVE_AMORTIZACION, C.CVE_PAG_INTERES, '+ coCRLF +
'        decode(A.ID_OLTP_MONEDA,840,C.IMP_CREDITO*'+sTipDol+',800,C.IMP_CREDITO*'+sTipUDI+',C.IMP_CREDITO) as IMP_CREDITO,  '+ coCRLF +
'        C.CVE_TASA_REFER, C.SOBRETASA, C.CVE_GRUPO_ECO, '+ coCRLF +
'        D.cve_cal_acred, E.CVE_CALIFIC_CUB, E.IMP_CUBIERTO, E.IMP_EXPUESTO, E.IMP_RESERVA_CUB, '+ coCRLF +
'        E.IMP_RESERVA_EXP, E.PCT_CUBIERTO, E.PCT_EXPUESTO, (E.IMP_RESERVA_CUB + E.IMP_RESERVA_EXP) TOT_RESERVA, '+ coCRLF +
'        decode(CVE_PER_JURIDICA,''PM'',ACREDITADO,NOMBREF) AS NOMBRE, '+ coCRLF +
'        DECODE (TIPO_DISPOSICION,''RN'', '+ coCRLF +
'          DECODE(CVE_SUB_TIP_BCO-47,0,TIPO_CUENTA||''-''||SUBSTR(CTA_CONTABLE,1,4)||''-''||SUBSTR(CTA_CONTABLE,5,2), '+ coCRLF +
'                                          ''1324-''||substr(TIPO_CUENTA,4,2)||''01-00''), '+ coCRLF +
'            TIPO_CUENTA||''-''||SUBSTR(CTA_CONTABLE,1,4)||''-''||SUBSTR(CTA_CONTABLE,5,2) )  CUENTA_CONTABLE, '+ coCRLF +
'        DECODE (TIPO_DISPOSICION, ''RN'', '+ coCRLF +
'          DECODE(CVE_SUB_TIP_BCO-47,0, '+ coCRLF +
'             DECODE(CVE_CALCULO,''AN'',''2601-''||SUBSTR(CTA_INTERES,5,2)||''-0000'', '+ coCRLF +
'                    SUBSTR(CTA_INTERES,1,4)||''-''||SUBSTR(CTA_INTERES,5,4)||''-''||SUBSTR(CTA_INTERES,9,2)), '+ coCRLF +
'              ''1319-2000-00''),  '+ coCRLF +
'              DECODE(CVE_CALCULO,''AN'',''2601-''||SUBSTR(CTA_INTERES,5,2)||''-0000'', '+ coCRLF +
'              SUBSTR(CTA_INTERES,1,4)||''-''||SUBSTR(CTA_INTERES,5,4)||''-''||SUBSTR(CTA_INTERES,9,2)) )  CUENTA_INTERES, 0 AS IMPORTEREF, '+ coCRLF +
'        (A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP) AS TOTCREDITO,  CVE_CALIFIC_EXP, '+ coCRLF +
//< EASA4011     20.JUN.2007     ADD COLUM NUMBER DAY VDO
'        ( SELECT NVL( MAX(DIAS_VENTTO), 0 )'+ coCRLF +
'          FROM   ('+ coCRLF +
'                   SELECT ID_CREDITO, ( ' + SQLFecha(StrToDateTime(sFecha3)) + ' - F_VENCIMIENTO ) + 1 DIAS_VENTTO'+ coCRLF +
'                   FROM   CRE_CAPITAL'+ coCRLF +
'                   WHERE  ( ( SIT_CAPITAL = ''IM'' ) OR'+ coCRLF +
'                            ( SIT_CAPITAL = ''LQ''   AND'+ coCRLF +
'                              F_PAGO > F_PROG_PAGO AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + ' AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                            )'+ coCRLF +
'                          )'+ coCRLF +
'                     AND  F_VENCIMIENTO <= ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                   UNION'+ coCRLF +
'                   SELECT ID_CREDITO, ( ' + SQLFecha(StrToDateTime(sFecha3)) + ' - F_VENCIMIENTO ) + 1'+ coCRLF +
'                   FROM   CRE_INTERES'+ coCRLF +
'                   WHERE ( ( SIT_INTERES = ''IM'' )OR'+ coCRLF +
'                            ( SIT_INTERES = ''LQ'' AND'+ coCRLF +
'                              F_PAGO > F_PROG_PAGO AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + ' AND'+ coCRLF +
'                              F_PAGO > ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                            ) )'+ coCRLF +
'                     AND  F_VENCIMIENTO <= ' + SQLFecha(StrToDateTime(sFecha3)) + coCRLF +
'                  )'+ coCRLF +
'          WHERE ID_CREDITO  =  C.ID_CREDITO'+ coCRLF +
'          )AS NUM_DIAS_VDO'+ coCRLF +

// END_EASA4011     20.JUN.2007     ADD COLUM NUMBER DAY VDO >/
' FROM '+ coCRLF +
//    /***** BUSCA EN DWH *****/
'     ( select ID_OLTP_ACREDITADO, ACREDITADO, ID_OLTP_PROM_ASOC,ID_OLTP_PROM_ADMIN, CREDITO, '+ coCRLF +
'              ID_OLTP_PRODUCTO||'' ''||PRODUCTO producto, ORI_REC_GBL, ORIGEN_INFO, ID_OLTP_MONEDA,CVE_CAT_MINIMO,  '+ coCRLF +
'              IMP_SDO_K_VIG_VP, IMP_SDO_K_IMP_VP, IMP_SDO_K_VEN_VP, IMP_INT_CORTE_VP, IMP_SDO_IO_IMP_VP,IMP_INT_CORTE '+ coCRLF +
'       from DM_CR_FAC_Credito@DWHC aa, DM_CR_DIM_Credito@DWHC bb '+ coCRLF +
'       where aa.ID_ANIO_MES = '+ sFecha2 + coCRLF +
'       and   aa.ID_CREDITO = bb.ID_CREDITO '+ coCRLF +
'       and   ORIGEN_INFO=''INTERCREDITOS'' )  A, '+ coCRLF +
//    /***** BUSCA DATOS GENERALES EN CORPORATIVO *****/
'     ( select '+ coCRLF +
'         P.ID_PERSONA, C.ID_CREDITO, decode(p.CVE_PER_JURIDICA,''PM'',''MORAL'',DECODE(B_ACTIV_EMPRESA,''V'',''FISICA ACT EMP'',''FISICA'')) T_PERS, '+ coCRLF +
'         decode(p.CVE_PER_JURIDICA,''PM'','''',TRIM(APELLIDO_PATERNO)||'' ''||TRIM(APELLIDO_MATERNO)||'' ''||NOMBRE_PERSONA) NOMBREF, '+ coCRLF +
'         p.CVE_ACTIV_ECO_SITI, PB.DESC_POBLACION AS LOCALIDAD, C.ID_CONTRATO, p.CVE_PER_JURIDICA, '+ coCRLF +
'         C.F_AUT_OPERACION AS F_INICIO, DECODE(C.F_TRASPASO_VENC,NULL,C.F_VALOR_CRED +C.DIAS_PLAZO,C.F_TRASPASO_VENC) AS F_VENCIMIENTO, ''N/A'' AS CVE_OPERATIVA,  '+ coCRLF +
'         DECODE(C.B_CAPITAL_PER,''V'',''POR PERIODO'',''AL VENCIMIENTO'')AS CVE_AMORTIZACION, '+ coCRLF +
'         DECODE(B_INTERES_PER,''V'',''POR PERIODOS'',DECODE(CVE_CALCULO,''AN'',''AL INICIO'',''AL VENCIMIENTO''))AS CVE_PAG_INTERES, '+ coCRLF +
'         C.IMP_CREDITO, C.CVE_TASA_REFER, C.SOBRETASA,CTA_INTERES,CVE_CALCULO,CST.CVE_SUB_TIP_BCO,TIPO_DISPOSICION, '+ coCRLF +
'         CTA_CONTABLE,CTC.TIPO_CUENTA, CA.CVE_GRUPO AS CVE_GRUPO_ECO, '+ coCRLF +
'         TA.TASA_APLICADA, (SELECT TASA_APLICADA FROM CRE_PROV_DIARIA WHERE ID_CREDITO=C.ID_CREDITO '+ coCRLF +
'                            AND F_PROVISION = (SELECT MAX(F_PROVISION) FROM CRE_PROV_DIARIA WHERE ID_CREDITO=C.ID_CREDITO)) AS TASA_APLI '+ coCRLF +
'       from CRE_CREDITO C, CONTRATO CT, CRE_contrato CCT, persona p, persona_fisica pf, persona_moral pm, '+ coCRLF +
'            DOMICILIO D, POBLACION PB, CRE_SUB_TIP_BCO CST, CRE_SUB_TIP_CNBV cnbv, '+ coCRLF +
'            CRE_TIPO_CREDITO CTC, CRE_CLIENTE CA, CRE_PROV_DIARIA TA '+ coCRLF +
'       where C.ID_CONTRATO =CT.ID_CONTRATO '+ coCRLF +
'       AND CCT.id_contrato = CT.id_contrato '+ coCRLF +
'       AND CT.ID_TITULAR = P.ID_PERSONA '+ coCRLF +
'       AND (pm.ID_PERSONA(+)= p.ID_PERSONA AND pf.ID_PERSONA(+)=p.ID_PERSONA) '+ coCRLF +
'       AND D.ID_DOMICILIO = P.ID_DOMICILIO '+ coCRLF +
'       AND PB.CVE_POBLACION= D.CVE_ESTADO '+ coCRLF +
'       AND CCT.CVE_SUB_TIP_BCO  =  CST.CVE_SUB_TIP_BCO '+ coCRLF +
'       AND CST.CVE_SUB_TIP_CNBV= CNBV.CVE_SUB_TIP_CNBV  '+ coCRLF +
'       AND CNBV.CVE_TIPO_CREDITO = CTC.CVE_TIPO_CREDITO '+ coCRLF +
'       AND CA.ID_PERSONA = P.ID_PERSONA '+ coCRLF +
'       AND TA.ID_CREDITO (+)=C.ID_CREDITO '+ coCRLF +
'       AND TA.F_PROVISION(+)='''+sFecha3+''' ) C, '+ coCRLF +
//    /***** BUSCA CALIFICACIÓN DEL DEUDOR EN SICC *****/
'     ( SELECT ID_ACREDITADO, cve_cal_acred   FROM cr_sicc_cal_acre csa '+
'       WHERE CSA.ANIO_MES=  '+sFechaR+' AND CSA.SIT_SICC_CAL_ACR = ''AC'') D, '+ coCRLF +
//    /***** BUSCA DATOS DEL CREDITO EN SIC *****/
'     ( SELECT id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPUESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUESTO, CVE_CALIFIC_EXP '+ coCRLF +
'       FROM CR_SICC_CAL_CRED CSC  WHERE CSC.ANIO_MES= '+sFechaR+' AND CSC.SIT_SICC_CAL_CRE = ''AC'' ' +
'       GROUP BY id_credito, CVE_CALIFIC_CUB, IMP_CUBIERTO, IMP_EXPUESTO, IMP_RESERVA_CUB, IMP_RESERVA_EXP, PCT_CUBIERTO, PCT_EXPUESTO, CVE_CALIFIC_EXP '+
'     ) E, '+ coCRLF +
'     ( SELECT ID_CREDITO, IMP_INT_VDO_EX + IMP_INT_VDO_NE AS IMP_INTER_IMP '+ coCRLF +
'        FROM CR_CON_ADEUDO_SDO  WHERE F_CIERRE = '''+sFecha3+''' ) F '+ coCRLF +
//    /***** CUENTA DE CAPITAL Y CUENTA DE INTERESES *****/
' WHERE A.CREDITO=C.ID_CREDITO '+ coCRLF +
' AND   D.ID_ACREDITADO(+)=A.ID_OLTP_ACREDITADO '+ coCRLF +
' AND   E.id_credito(+)=C.ID_CREDITO  '+ coCRLF +
' AND   (A.IMP_SDO_K_VIG_VP + A.IMP_SDO_K_IMP_VP + A.IMP_SDO_K_VEN_VP + A.IMP_INT_CORTE_VP + A.IMP_SDO_IO_IMP_VP + F.IMP_INTER_IMP)  <> 0 '+ coCRLF +
//' AND  SUBSTR(TIPO_CUENTA,1,2)=''13'' '+ coCRLF + // END_EASA4011     22.AGO.2007     MOSTRAR TODO >/
' AND   A.CREDITO = F.ID_CREDITO(+) '+ coCRLF +
' ) '+ coCRLF ;
  FunSQL:=sSql;
end;


procedure TqrCartTot.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //totales cliente
  dIMP_CREDITO      :=dIMP_CREDITO      +qryIMP_CREDITO.AsFloat;
  dIMP_SDO_K_VIG_VP :=dIMP_SDO_K_VIG_VP +qryIMP_SDO_K_VIG_VP.AsFloat;
  dIMP_SDO_K_IMP_VP :=dIMP_SDO_K_IMP_VP +qryIMP_SDO_K_IMP_VP.AsFloat;
  dIMP_SDO_K_VEN_VP :=dIMP_SDO_K_VEN_VP +qryIMP_SDO_K_VEN_VP.AsFloat;
  dIMPORTEREF       :=dIMPORTEREF       +qryIMPORTEREF.AsFloat;
  dIMP_INT_CORTE_VP :=dIMP_INT_CORTE_VP +qryIMP_INT_CORTE_VP.AsFloat;
  dIMP_SDO_IO_IMP_VP:=dIMP_SDO_IO_IMP_VP+qryIMP_SDO_IO_IMP_VP.AsFloat;
  //totales contrato
  doIMP_CREDITO      :=doIMP_CREDITO      +qryIMP_CREDITO.AsFloat;
  doIMP_SDO_K_VIG_VP :=doIMP_SDO_K_VIG_VP +qryIMP_SDO_K_VIG_VP.AsFloat;
  doIMP_SDO_K_IMP_VP :=doIMP_SDO_K_IMP_VP +qryIMP_SDO_K_IMP_VP.AsFloat;
  doIMP_SDO_K_VEN_VP :=doIMP_SDO_K_VEN_VP +qryIMP_SDO_K_VEN_VP.AsFloat;
  doIMPORTEREF       :=doIMPORTEREF       +qryIMPORTEREF.AsFloat;
  doIMP_INT_CORTE_VP :=doIMP_INT_CORTE_VP +qryIMP_INT_CORTE_VP.AsFloat;
  doIMP_SDO_IO_IMP_VP:=doIMP_SDO_IO_IMP_VP+qryIMP_SDO_IO_IMP_VP.AsFloat;
end;

procedure TqrCartTot.qGroupCteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //inicializa totales de cliente
  dIMP_CREDITO:=0;
  dIMP_SDO_K_VIG_VP:=0;
  dIMP_SDO_K_IMP_VP:=0;
  dIMP_SDO_K_VEN_VP:=0;
  dIMPORTEREF:=0;
  dIMP_INT_CORTE_VP:=0;
  dIMP_SDO_IO_IMP_VP:=0;
end;

procedure TqrCartTot.qGroupCtoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //inicializa totales contrato
  doIMP_CREDITO:=0;
  doIMP_SDO_K_VIG_VP:=0;
  doIMP_SDO_K_IMP_VP:=0;
  doIMP_SDO_K_VEN_VP:=0;
  doIMPORTEREF:=0;
  doIMP_INT_CORTE_VP:=0;
  doIMP_SDO_IO_IMP_VP:=0;
end;

procedure TqrCartTot.grFooterCtoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var total:double;
begin
  qloIMP_CREDITO.Caption      :=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',doIMP_CREDITO);
  qloIMP_SDO_K_VIG_VP.Caption :=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',doIMP_SDO_K_VIG_VP );
  qloIMP_SDO_K_IMP_VP.Caption :=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',doIMP_SDO_K_IMP_VP );
  qloIMP_SDO_K_VEN_VP.Caption :=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',doIMP_SDO_K_VEN_VP );
  qloIMPORTEREF.Caption       :=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',doIMPORTEREF       );
  qloIMP_INT_CORTE_VP.Caption :=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',doIMP_INT_CORTE_VP );
  qloIMP_SDO_IO_IMP_VP.Caption:=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',doIMP_SDO_IO_IMP_VP);
  total:=doIMP_SDO_K_VIG_VP +  doIMP_SDO_K_IMP_VP + doIMP_SDO_K_VEN_VP +
         doIMPORTEREF       +  doIMP_INT_CORTE_VP + doIMP_SDO_IO_IMP_VP;
  qloTOTCREDITO.Caption       :=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',total);
end;

procedure TqrCartTot.grFooterCteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var total:double;
begin
  qlIMP_CREDITO.Caption      :=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',dIMP_CREDITO);
  qlIMP_SDO_K_VIG_VP.Caption :=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',dIMP_SDO_K_VIG_VP );
  qlIMP_SDO_K_IMP_VP.Caption :=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',dIMP_SDO_K_IMP_VP );
  qlIMP_SDO_K_VEN_VP.Caption :=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',dIMP_SDO_K_VEN_VP );
  qlIMPORTEREF.Caption       :=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',dIMPORTEREF       );
  qlIMP_INT_CORTE_VP.Caption :=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',dIMP_INT_CORTE_VP );
  qlIMP_SDO_IO_IMP_VP.Caption:=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',dIMP_SDO_IO_IMP_VP);
  total:=dIMP_SDO_K_VIG_VP +  dIMP_SDO_K_IMP_VP + dIMP_SDO_K_VEN_VP +
         dIMPORTEREF       +  dIMP_INT_CORTE_VP + dIMP_SDO_IO_IMP_VP;
  qlTOTCREDITO.Caption       :=FormatFloat('$ ###,###,##0.00;-###,###,##0.00',total);
end;

procedure TqrCartTot.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlCliente.Caption:= sCLIENTE;
  qrlCuenta.Caption := sCUENTA;
  qrlSaldo.Caption  := sSALDO;       
  PrintBand:=True;
end;

//MARA4356 SE AGREGA PARA SALDO CONTABLE DE LA CUENTA 26096222
procedure   TqrCartTot.BuscaSDOConta2609(var sCte, sSdo, sCta:String; sFecha:String);
begin 
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
