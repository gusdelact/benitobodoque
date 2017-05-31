unit IntMQrDetCred;
                   
interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2;
        
type
  TQrDetCred = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyConsulta: TQuery;
    QRBand5: TQRBand;
    QRLabel14: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBD4: TQRDBText;
    QRDB5: TQRDBText;
    QRDB8: TQRDBText;
    QRDBText25: TQRDBText;
    QRDB10: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText47: TQRDBText;
    QRDB6: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText57: TQRDBText;
    QRDB9: TQRDBText;
    QRShape5: TQRShape;
    QRLabel16: TQRLabel;
    QRDB1: TQRDBText;
    QRDB2: TQRDBText;
    QRDB7: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRDB3: TQRDBText;
    QRLabel17: TQRLabel;
    QRDB11: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel52: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRGroup1: TQRGroup;
    QRFoot1: TQRBand;
    QRShape4: TQRShape;
    QRLabel46: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    qyEncabezado: TQuery;
    qyEncabezadoID_CREDITO: TFloatField;
    qyEncabezadoSIT_CREDITO: TStringField;
    qyEncabezadoIMP_CREDITO: TFloatField;
    qyEncabezadoF_ALTA: TDateTimeField;
    qyEncabezadoF_AUTORIZA: TDateTimeField;
    qyEncabezadoF_INICIO: TDateTimeField;
    qyEncabezadoF_VENCIMIENTO: TDateTimeField;
    qyEncabezadoDIAS_PLAZO: TFloatField;
    qyEncabezadoSDO_INSOLUTO: TFloatField;
    qyEncabezadoCVE_TASA_REFER: TStringField;
    qyEncabezadoTASA_BASE: TFloatField;
    qyEncabezadoOPERADOR_STASA: TStringField;
    qyEncabezadoSOBRETASA: TFloatField;
    qyEncabezadoTASA_CREDITO: TFloatField;
    qyEncabezadoCVE_AMORTIZACION: TStringField;
    qyEncabezadoCVE_PAG_INTERES: TStringField;
    qyEncabezadoFACT_MORAS: TFloatField;
    qyEncabezadoID_CRE_RENOVADO: TFloatField;
    qyEncabezadoID_CRE_RENUEVA: TFloatField;
    qyEncabezadoCVE_CALCULO: TStringField;
    qyEncabezadoID_TITULAR: TFloatField;
    qyEncabezadoACREDITADO: TStringField;
    qyEncabezadoCVE_PRODUCTO_CRE: TStringField;
    qyEncabezadoDESC_L_PRODUCTO: TStringField;
    qyEncabezadoCVE_MONEDA: TFloatField;
    qyEncabezadoDESC_MONEDA: TStringField;
    qyEncabezadoDESC_AMORTIZA: TStringField;
    qyEncabezadoDESC_CALCULO: TStringField;
    qyEncabezadoPERIODOINT: TFloatField;
    qyEncabezadoFECHVENINT: TDateTimeField;
    qyEncabezadoPERIODOCAP: TFloatField;
    qyEncabezadoFECHVENCAP: TDateTimeField;
    QRBand1: TQRBand;
    QRGroup2: TQRGroup;
    QRGroup3: TQRGroup;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRGroup4: TQRGroup;
    QRLabel1: TQRLabel;
    QRFoot2: TQRBand;
    QRShape1: TQRShape;
    QRLabel65: TQRLabel;
    QRExpr6: TQRExpr;
    QRFoot3: TQRBand;
    QRShape3: TQRShape;
    QRLabel69: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRFoot4: TQRBand;
    QRShape6: TQRShape;
    QRLabel73: TQRLabel;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRBand2: TQRBand;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel56: TQRLabel;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel57: TQRLabel;
    QRShape2: TQRShape;
    QRLabel54: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRBand3: TQRBand;
    QRShape8: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qyEncabezadoDESC_PAG_INTERES: TStringField;
    QRShape18: TQRShape;
    QRLabel51: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    qyConsultaIDGRUPO: TFloatField;
    qyConsultaID_CREDITO: TFloatField;
    qyConsultaPERCAPITAL: TFloatField;
    qyConsultaPLAZO: TFloatField;
    qyConsultaFHVTOCAP: TDateTimeField;
    qyConsultaF_PROG_PAGO: TDateTimeField;
    qyConsultaF_PAGO: TDateTimeField;
    qyConsultaTASA_CREDITO: TFloatField;
    qyConsultaIMP_CAPITAL: TFloatField;
    qyConsultaIMP_PAGADO: TFloatField;
    qyConsultaIMPVENCIDO: TFloatField;
    qyConsultaSDO_INSOLUTO: TFloatField;
    qyConsultaSIT_CAPITAL: TStringField;
    qyConsultaF_OPERACION: TDateTimeField;
    qyConsultaCVE_OPERACION: TStringField;
    qyConsultaDESC_L_OPERACION: TStringField;
    qyConsultaIMP_CONCEPTO: TFloatField;
    qyConsultaNUM_PERIODO: TFloatField;
    qyConsultaPLAZO_1: TFloatField;
    qyConsultaF_VENCIMIENTO: TDateTimeField;
    qyConsultaF_PROG_PAGO_1: TDateTimeField;
    qyConsultaF_PAGO_1: TDateTimeField;
    qyConsultaTASA_APLICADA: TFloatField;
    qyConsultaIMP_INTERES: TFloatField;
    qyConsultaIMP_IVA: TFloatField;
    qyConsultaIMP_PAGADO_1: TFloatField;
    qyConsultaIMPVENCIDO_1: TFloatField;
    qyConsultaSIT_INTERES: TStringField;
    qyConsultaNUM_PERIODO_1: TFloatField;
    qyConsultaCVE_COMISION: TStringField;
    qyConsultaDESC_COMISION: TStringField;
    qyConsultaF_VENCIMIENTO_1: TDateTimeField;
    qyConsultaF_PROG_PAGO_2: TDateTimeField;
    qyConsultaF_PAGO_2: TDateTimeField;
    qyConsultaPCT_COMISION: TFloatField;
    qyConsultaIMP_COMISION: TFloatField;
    qyConsultaIMP_IVA_1: TFloatField;
    qyConsultaIMP_PAGADO_2: TFloatField;
    qyConsultaIMPVENCIDO_2: TFloatField;
    qyConsultaSIT_COMISION: TStringField;
    QRGroup10: TQRGroup;
    QRDBText36: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    SummaryBand1: TQRBand;
    QRGroupFinan1: TQRGroup;
    QRGroupFinan2: TQRGroup;
    QRLabel59: TQRLabel;
    QRShape10: TQRShape;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    qyConsultaFA_NUMPER: TFloatField;
    qyConsultaFA_FVENCIM: TDateTimeField;
    qyConsultaFA_FPAGO: TDateTimeField;
    qyConsultaFA_IMPFINAN: TFloatField;
    qyConsultaFA_IMPPAGADO: TFloatField;
    qyConsultaFA_SITFINAN: TStringField;
    QRFootFinan: TQRBand;
    QRLabel62: TQRLabel;
    QRExpr13: TQRExpr;
    QRExpr15: TQRExpr;
    QRShape16: TQRShape;
    QRGroup11: TQRGroup;
    QRLabel28: TQRLabel;
    QRShape7: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel84: TQRLabel;
    QRGroup5: TQRGroup;
    QRDBText51: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText71: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText73: TQRDBText;
    QRGroup6: TQRGroup;
    QRLabel2: TQRLabel;
    QRShape9: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel58: TQRLabel;
    QRGroup7: TQRGroup;
    QRGroup9: TQRGroup;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    qyConsultaFA_IMPVENCIDO: TFloatField;
    QRLabel64: TQRLabel;
    QRDBText26: TQRDBText;
    QRExpr14: TQRExpr;
    QRLabel66: TQRLabel;
    QRDBText28: TQRDBText;
    qyEncabezadoSDO_VIG_TOTAL: TFloatField;
    qyEncabezadoPRUEBA: TFloatField;
    qyConsultaSUMA: TFloatField;
    QRSdoInsCap: TQRLabel;
    qyConsultaID_TRANSACCION: TFloatField;
    qyEncabezadoTASA_APLICADA: TFloatField;
    lbTASA_INTERES: TQRLabel;
    qyEncabezadoCHEQUERA: TStringField;
    QRDBText79: TQRDBText;
    QRLabel68: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel86: TQRLabel;
    qyEncabezadoTIPO_CREDITO: TStringField;
    QRDBText20: TQRDBText;
    QRLabel87: TQRLabel;
    QRImpVigente: TQRLabel;
    QRImpVigenteTot: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel85: TQRLabel;
    QRImpRefVig: TQRLabel;
    QRImpRefVigTot: TQRLabel;
    QRImpInter: TQRLabel;
    QRImpInterTot: TQRLabel;
    QRImpComis: TQRLabel;
    QRImpComisTot: TQRLabel;
    QRLabel90: TQRLabel;
    QRDBText29: TQRDBText;
    QRGroup8: TQRGroup;
    QRLabel91: TQRLabel;
    QRShape11: TQRShape;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    qyConsultaF_OPERACION_C: TDateTimeField;
    qyConsultaCVE_OPERACION_C: TStringField;
    qyConsultaDESC_L_OPERACION_C: TStringField;
    qyConsultaIMP_CONCEPTO_C: TFloatField;
    qyConsultaID_TRANSACCION_C: TFloatField;
    QRGroup13: TQRGroup;
    QRGroup12: TQRGroup;
    QRDBText44: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText66: TQRDBText;
    QRFoot8: TQRBand;
    QRShape12: TQRShape;
    QRLabel95: TQRLabel;
    QRExpr16: TQRExpr;
    QRLabel96: TQRLabel;
    QRDBText67: TQRDBText;
    qyConsultaB_FINAN_ADIC: TStringField;
    qyConsultaCVE_FINAN_ADIC: TStringField;
    QRDBText68: TQRDBText;
    QRLabel97: TQRLabel;
    QRGpoTramos: TQRGroup;
    QRLabel98: TQRLabel;
    QRShape21: TQRShape;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRGroup14: TQRGroup;
    QRDBText74: TQRDBText;
    QRDBText78: TQRDBText;
    qyConsultaTASA_TRAMO: TFloatField;
    qyConsultaF_REVISION: TDateTimeField;
    qyEncabezadoCVE_CALCULO_M: TStringField;
    Query1: TQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField2: TStringField;
    FloatField5: TFloatField;
    StringField3: TStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    StringField6: TStringField;
    FloatField11: TFloatField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    FloatField12: TFloatField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    FloatField13: TFloatField;
    DateTimeField5: TDateTimeField;
    FloatField14: TFloatField;
    DateTimeField6: TDateTimeField;
    StringField13: TStringField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    QRLabel101: TQRLabel;
    QRDBText69: TQRDBText;
    QRGroupEncGarantias: TQRGroup;
    QRLabel102: TQRLabel;
    QRShape22: TQRShape;
    qrlbl_gar_FOLIO: TQRLabel;
    qrlbl_gar_REFERENCIA: TQRLabel;
    qrlbl_gar_PROPORCION: TQRLabel;
    qrlbl_gar_TIPOGARANTIA: TQRLabel;
    qrlbl_gar_IMPORTE: TQRLabel;
    qrlbl_gar_DESCRIPCION: TQRLabel;
    QRGroupDetGarantias: TQRGroup;
    QRDBText75: TQRDBText;
    QRDBText82: TQRDBText;
    QRDBText76: TQRDBText;
    QRLabel103: TQRLabel;
    QRDBText77: TQRDBText;
    QRDBText80: TQRDBText;
    QRDBText81: TQRDBText;
    QRFooterGarantias: TQRBand;
    QRShape23: TQRShape;
    QRLabel104: TQRLabel;
    QRExpr17: TQRExpr;
    qyEncabezadoID_CONTRATO: TFloatField;
    QRLabel105: TQRLabel;
    qyEncabezadoF_TRASPASO_VENC: TDateTimeField;
    QRDBText83: TQRDBText;
    QRDBText84: TQRDBText;
    qyEncabezadoEVIDENCIA: TStringField;
    QRLabel106: TQRLabel;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupFinan1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup11BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFoot1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupFinan2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFootFinanBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFoot3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup9BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFoot4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupEncGarantiasBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterGarantiasBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup10BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupDetGarantiasBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
     VLBFirmas : Boolean;
  public
     Function FormaQuery(sFInicio,sFFin,sProducto,sMoneda,
                         sAcreditado,sPromAsoc,sPromAdmon, sCesion,
                         sSituacions, sBFirmas, sEmpresa,sSucursal :String):String;

     Function LlenaEncabezado(sFInicio,sFFin,sProducto,sMoneda,
                         sAcreditado,sPromAsoc,sPromAdmon, sCesion,
                         sSituacion, sBFirmas :String; pAPli : TInterApli) : String;

     Procedure  HabilitaGrupos;
  end;

var
  QrDetCred: TQrDetCred;
  dSdoInsoluto, dImpVigente, dImpVigenteTot, dImpRefVig, dImpRefVigTot,
  dImpInter, dImpInterTot, dImpComis, dImpComisTot : Double;
  bImpEncGar: boolean;
  gnumRegistros, gItera : Integer;

  sArchivo    : String;
  bGenArch    : Boolean;
  F           : TextFile;

  vlfpago, vlidcredito, vlidcontrato :string;


Procedure EjecutarReporteDetCred(  sF_Inicio,sF_Fin,sProducto,sMoneda,
                            sAcreditado,sPromAsoc,sPromAdmon, sCesion,
                            sSituacion, sBFirmas, sEmpresa, sSucursal:String;
                            pAPli     : TInterApli;
                            pPreview, ptipoFA  : Boolean
                            ;sNbrArch:string);
Implementation
{$R *.DFM}

Procedure EjecutarReporteDetCred(  sF_Inicio,sF_Fin,sProducto,sMoneda,
                            sAcreditado,sPromAsoc,sPromAdmon, sCesion,
                            sSituacion, sBFirmas, sEmpresa, sSucursal :String;
                            pAPli     : TInterApli;
                            pPreview, ptipoFA  : Boolean
                            ;sNbrArch:string);
Var
    QrDetCred   : TQrDetCred;
    Preview     : TIntQRPreview;
Begin
      QrDetCred   := TQrDetCred.Create(Nil);
      Preview := TIntQRPreview.CreatePreview(Application, QrDetCred);

      bGenArch:= False;
      sArchivo:= sNbrArch;

      Try

        QrDetCred.QRInterEncabezado1.Apli:=pApli;
        QrDetCred.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrDetCred.QRInterEncabezado1.NomReporte:='IntMQrDetCred';

        If sCesion <>'' Then
           QrDetCred.QRInterEncabezado1.Titulo1:='Reporte de Detalle de Crédito ' + sCesion ;
        //end if;

        QrDetCred.VLBFirmas := sBFirmas = 'V';

        If sF_Inicio<>'' Then
          QrDetCred.QRInterEncabezado1.Titulo2:='Periodo del '+  sF_Inicio ;
        If sF_Fin<>'' Then
          QrDetCred.QRInterEncabezado1.Titulo2:=QrDetCred.QRInterEncabezado1.Titulo2 + ' al ' + sF_Fin;

        if not(ptipoFA) then
        begin
           //Financiamiento Adicional
           QrDetCred.QRLabel96.Left:=210;
           QrDetCred.QRDBText67.Left:=210;

           //Tipo de Financiamiento Adicional
           QrDetCred.QRDBText68.Width:=0;
           QrDetCred.QRLabel97.Caption:='';
           QrDetCred.QRLabel97.Width:=0;
        end;

        QrDetCred.qyEncabezado.DatabaseName := pApli.DataBaseName;
        QrDetCred.qyEncabezado.SessionName := pApli.SessionName;

        QrDetCred.qyEncabezado.Active:=False;
        QrDetCred.qyEncabezado.SQL.Text:= QrDetCred.LlenaEncabezado(sF_Inicio,sF_Fin,sProducto,sMoneda,
                                                                  sAcreditado,sPromAsoc,sPromAdmon, sCesion,
                                                                  sSituacion,sBFirmas,pAPli );
        QrDetCred.qyEncabezado.SQL.SaveToFile('C:\DETALLE.01.SQL');
        QrDetCred.qyEncabezado.Active:=True;

        vlidcredito  := QrDetCred.qyEncabezado.FieldByName('ID_CREDITO').AsString;
        vlidcontrato := QrDetCred.qyEncabezado.FieldByName('ID_CONTRATO').AsString;

        QrDetCred.qyConsulta.DatabaseName := pApli.DataBaseName;
        QrDetCred.qyConsulta.SessionName := pApli.SessionName;

        QrDetCred.qyConsulta.Active:=False;

        QrDetCred.qyConsulta.SQL.Text:= QrDetCred.FormaQuery(sF_Inicio,sF_Fin,sProducto,sMoneda,
                        sAcreditado,sPromAsoc,sPromAdmon, sCesion,sSituacion,sBFirmas,
                        sEmpresa,sSucursal);
        QrDetCred.qyConsulta.SQL.SaveToFile('C:\DETALLE.SQL');

//        QrDetCred.qyConsulta.ParamByName('pIdCredito').AsFloat := StrToFloat(sCesion);
        QrDetCred.qyConsulta.Active:=True;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         //Writeln(F, QrDetCred.QRInterEncabezado1.Titulo1 + #09 );
         //Writeln(F, QrDetCred.QRInterEncabezado1.Titulo2+ #09 );
      {   Writeln(F,  #09 );

         Writeln(F, 'ACREDITADO:' + #09 + QrDetCred.qyEncabezado.FieldByName('ACREDITADO').AsString );
         Writeln(F, 'CREDITO:'    + #09 + QrDetCred.qyEncabezado.FieldByName('ID_CREDITO').AsString );
         Writeln(F, 'MONTO:'      + #09 + QrDetCred.qyEncabezado.FieldByName('IMP_CREDITO').AsString );
         Writeln(F, 'PLAZO:'      + #09 + QrDetCred.qyEncabezado.FieldByName('DIAS_PLAZO').AsString );
         Writeln(F, 'TASA:'       + #09 + QrDetCred.qyEncabezado.FieldByName('CVE_TASA_REFER').AsString + ' '+ QrDetCred.qyEncabezado.FieldByName('OPERADOR_STASA').AsString + ' ' + QrDetCred.qyEncabezado.FieldByName('SOBRETASA').AsString  );
         Writeln(F, 'F. INICIO:'  + #09 + QrDetCred.qyEncabezado.FieldByName('F_INICIO').AsString );
         Writeln(F, 'F. VENCIMIENTO:' + #09 + QrDetCred.qyEncabezado.FieldByName('F_VENCIMIENTO').AsString );

         Writeln(F, ' ');
         Writeln(F, ' ');  }

         Writeln(F,
             'CREDITO'+ #09 +
             'CONTRATO'+ #09 +
             'ACCESORIO'+ #09 +
             'PERIODO'+ #09 +
             'PLAZO'+ #09 +
             'F_VENCIMIENTO'+ #09 +
             'F_PROG_PAGO'+ #09 +
             'F_PAGO'+ #09 +
             'TASA'+ #09 +
             'IMP_BRUTO'+ #09 +
             'IMP_IVA'+ #09+
             'IMP_PAGADO'+ #09 +
             'IMP_VIGENTE'+ #09 +
             'IMP_VENCIDO'+ #09 +
             'SITUACION'+ #09 +
             'COMISION'+ #09 +
             'DESC_COMIS'+ #09 +
             'PCT_COMISION'
          );
      End;


        If pPreview Then
            QrDetCred.Preview
        Else
            QrDetCred.Print;
    Finally

       If Trim(sArchivo)<>'' Then Begin
          bGenArch:= True;
          CloseFile(F);
       End;

        QrDetCred.free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrDetCred.LlenaEncabezado(sFInicio,sFFin,sProducto,sMoneda,
                         sAcreditado,sPromAsoc,sPromAdmon, sCesion,
                         sSituacion, sBFirmas :String;pAPli : TInterApli) : String;
Var
  sSQL : String;
Begin

     sSQL := ' SELECT CRCRED.ID_CREDITO,CRCRED.SIT_CREDITO, CRCRED.IMP_CREDITO, CRCRED.F_ALTA, CRCRED.F_AUTORIZA, CRCRED.F_INICIO, ' +
             '        CRCRED.F_VENCIMIENTO, CRCRED.DIAS_PLAZO, CRCRED.SDO_INSOLUTO, CRCRED.CVE_TASA_REFER, CRCRED.TASA_BASE, ' +
             '        CRCRED.OPERADOR_STASA, CRCRED.SOBRETASA, CRCRED.TASA_CREDITO, CRCRED.CVE_AMORTIZACION, CRCRED.CVE_PAG_INTERES,' +
// hegc
//           '        CRCRED.FACT_MORAS, CRCRED.CVE_CALCULO, ' +
             '        DECODE(CRCRED.CVE_CALCULO_M,NULL,CRCRED.fact_moras,CRCRED.sobretasa_m) fact_moras ,  '+
             '        DECODE(CRCRED.CVE_CALCULO_M,NULL,''FIJA'',CRCRED.CVE_CALCULO_M) CVE_CALCULO_M ,         '+
// hegc
             '        CRCRED.CVE_CALCULO, ' +
// RABA ABR 2013
//             '        CRCRED.ID_CRE_RENOVADO, CRCRED.ID_CRE_RENUEVA,' +  // LOS CAMPOS TRAEN UN FOLIO QUE CORRESPONDE A LA TABLA CR_RR_CREDITO
             '        NVL((SELECT MIN(ID_CRED_RENOVADO) FROM CR_RR_CREDITO WHERE FOL_GRUPO_RENUEVA = CRCRED.ID_CRE_RENOVADO AND ID_CRED_RENUEVA = CRCRED.ID_CREDITO),CRCRED.ID_CRE_RENOVADO) ID_CRE_RENOVADO, ' +
             '        NVL((SELECT MIN(ID_CRED_RENUEVA) FROM CR_RR_CREDITO WHERE FOL_GRUPO_RENUEVA = CRCRED.ID_CRE_RENUEVA AND ID_CRED_RENOVADO = CRCRED.ID_CREDITO),CRCRED.ID_CRE_RENUEVA) ID_CRE_RENUEVA, ' +
// FIN RABA
             '        CONT.ID_TITULAR, PER.NOMBRE AS ACREDITADO, ' +
             '        CRCONT.CVE_PRODUCTO_CRE, PROD.DESC_L_PRODUCTO, ' +
             '        CONT.CVE_MONEDA, MON.DESC_MONEDA, ' +
             '        AMOR.DESC_AMORTIZA, ' +
             '        PAGINT.DESC_PAG_INTERES, ' +
             '        CALC.DESC_CALCULO, ' +
             '        DECODE(CRCRED.TIPO_DISPOSICION,''DI'',''DISPOSICIÓN'',''RE'',''RENOVACIÓN'',''RS'',''REESTRUCTURACIÓN'',''DISPOSICIÓN'') TIPO_CREDITO, ' +
             '        PERINT.PERIODOINT,PERINTANT.FECHVENINT, ' +
             '        PERCAP.PERIODOCAP,PERCAPANT.FECHVENCAP, CRCRED.SDO_VIG_TOTAL,' +
             '        NVL(CI.TASA_APLICADA,CRCRED.TASA_CREDITO) TASA_APLICADA, '+  //EASA      03102004
             '       (SUBSTR((PKGCRPERIODO.STPObtchqCte(CONT.ID_TITULAR,DECODE(CP.CVE_SUB_DIVISION, NULL,''0''), ' +
             '                                          CRCRED.ID_CREDITO,''AC'',''AD'',''CR'')),1,20)) AS CHEQUERA ' +

             //HEJRA ABRIL 2013
             '        ,CRCRED.F_TRASPASO_VENC ' +
	     '        ,(CASE ' +
	     '	           WHEN NVL(PKGCRTRASCARTERA.FUNACREDEVIDENCIA(CONT.ID_TITULAR),''F'') = ''V'' THEN ''SI'' ' +
	     '		   ELSE ''NO'' ' +
	     '	        END ' +
	     '	      ) EVIDENCIA ' +
             // FIN HERJA ABRIL 2013
             '        ,CRCRED.ID_CONTRATO ' +

             ' FROM CR_CREDITO CRCRED, CONTRATO CONT, PERSONA PER, CR_CONTRATO CRCONT, CR_PRODUCTO PROD, MONEDA MON, ' +
             '      CR_AMORTIZACION AMOR, CR_PAGO_INTERES PAGINT, CR_CALCULO_INT CALC, ' +
             '      (SELECT CRINT.ID_CREDITO,MIN(CRINT.NUM_PERIODO) AS PERIODOINT ' +
             '       FROM CR_INTERES CRINT ' +
             '       WHERE CRINT.F_VENCIMIENTO >= TO_DATE('''+DateToStr(pAPli.DameFechaEmpresaDia('D000'))+''',''DD/MM/YYYY'')' +
             '       AND CRINT.SIT_INTERES = ''AC'' ' +
             '       GROUP BY CRINT.ID_CREDITO) PERINT, ' +
             '     (SELECT CRCAP.ID_CREDITO,MIN(CRCAP.NUM_PERIODO) AS PERIODOCAP ' +
             '       FROM CR_CAPITAL CRCAP ' +
             '       WHERE CRCAP.F_VENCIMIENTO >= TO_DATE('''+DateToStr(pAPli.DameFechaEmpresaDia('D000'))+''',''DD/MM/YYYY'')' +
             '       AND CRCAP.SIT_CAPITAL = ''AC'' ' +
             '       GROUP BY CRCAP.ID_CREDITO) PERCAP, ' +
             '      (SELECT CRINT.ID_CREDITO,MAX(CRINT.F_VENCIMIENTO) AS FECHVENINT ' +
             '       FROM CR_INTERES CRINT ' +
             '       WHERE CRINT.F_VENCIMIENTO <= TO_DATE('''+DateToStr(pAPli.DameFechaEmpresaDia('D000'))+''',''DD/MM/YYYY'')' +
             '       GROUP BY CRINT.ID_CREDITO) PERINTANT, ' +
             '     (SELECT CRCAP.ID_CREDITO,MAX(CRCAP.F_VENCIMIENTO) AS FECHVENCAP ' +
             '       FROM CR_CAPITAL CRCAP ' +
             '       WHERE CRCAP.F_VENCIMIENTO <= TO_DATE('''+DateToStr(pAPli.DameFechaEmpresaDia('D000'))+''',''DD/MM/YYYY'')' +
             '       GROUP BY CRCAP.ID_CREDITO) PERCAPANT, ' +
             //EASA 03102001 MODIFICACION TASA OPERACION
             '	   ( SELECT ID_CREDITO, TASA_APLICADA FROM CR_INTERES ' +
             '	     WHERE SIT_INTERES = ' + SQLStr('AC') + ' ) CI, ' +
             '     ( SELECT ID_CREDITO,CVE_SUB_DIVISION  '+
             '       FROM CR_PROCAMPO ) CP ';

        If (Trim(sCesion)<>'') Then
            sSQL:= sSQL + ' WHERE  CRCRED.ID_CREDITO ='+ sCesion +
             ' AND CRCRED.ID_CONTRATO = CONT.ID_CONTRATO '
        else
            sSQL:= sSQL + ' WHERE CRCRED.ID_CONTRATO = CONT.ID_CONTRATO ';
        //end if;

sSQL:= sSQL +
             ' AND   CONT.ID_TITULAR = PER.ID_PERSONA (+) ' +
             ' AND   CRCONT.ID_CONTRATO = CRCRED.ID_CONTRATO ' +
             ' AND   CRCONT.CVE_PRODUCTO_CRE = PROD.CVE_PRODUCTO_CRE ' +
             ' AND   CONT.CVE_MONEDA = MON.CVE_MONEDA ' +
             ' AND   CRCRED.CVE_AMORTIZACION = AMOR.CVE_AMORTIZACION (+) ' +
             ' AND   CRCRED.CVE_PAG_INTERES = PAGINT.CVE_PAG_INTERES (+) ' +
             ' AND   CRCRED.CVE_CALCULO = CALC.CVE_CALCULO_INT (+) ' +
             ' AND   PERINT.ID_CREDITO(+) = CRCRED.ID_CREDITO ' +
             ' AND   PERCAP.ID_CREDITO(+) = CRCRED.ID_CREDITO ' +
             ' AND   PERINTANT.ID_CREDITO(+) = CRCRED.ID_CREDITO ' +
             ' AND   PERCAPANT.ID_CREDITO(+) = CRCRED.ID_CREDITO ' +
             ' AND   CI.ID_CREDITO (+) = CRCRED.ID_CREDITO ' +
             ' AND   CP.ID_CREDITO(+)        = CRCRED.ID_CREDITO ' ;           //EASA      03102004


        If (Trim(sFInicio)<>'') Then Begin
            sSQL:= sSQL + ' AND CRCRED.F_AUTORIZA >= TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')';
        End;
        If (Trim(sFFin)<>'') Then Begin
            sSQL:= sSQL + ' AND CRCRED.F_AUTORIZA <= TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''',''DD/MM/YYYY'')';
        End;
        If (Trim(sProducto)<>'') Then
            sSQL:= sSQL + ' AND  CRCONT.CVE_PRODUCTO_CRE ='''+sProducto+'''';
        If (Trim(sMoneda)<>'') Then
            sSQL:= sSQL + ' AND  CONT.CVE_MONEDA  ='+sMoneda;
        If (Trim(sAcreditado)<>'') Then
            sSQL:= sSQL + ' AND  CONT.ID_TITULAR ='+ sAcreditado;
        If (Trim(sPromAsoc)<>'') Then
            sSQL:= sSQL + ' AND  CONT.ID_PERS_ASOCIAD ='+ sPromAsoc;
        If (Trim(sPromAdmon)<>'') Then
            sSQL:= sSQL + ' AND  CRCRED.ID_PROM_ADM ='+ sPromAdmon;
        If (Trim(sSituacion)<>'') Then
            sSQL:= sSQL + ' AND  CRCRED.SIT_CREDITO ='''+ sSituacion+'''';

     Result := sSQL;

End;


Function TQrDetCred.FormaQuery(sFInicio,sFFin,sProducto,sMoneda,
                         sAcreditado,sPromAsoc,sPromAdmon, sCesion,
                         sSituacions, sBFirmas, sEmpresa,sSucursal :String):String;
Var
    sSQL, sSQL1, sSQL2, sSQL3, sSQL4, sSQL5, sSQL6, sSQL7, sSQL8  :String;
Begin
    sSQL1:= '( SELECT 1 AS IDGRUPO, '+
            '       CR_PRODUCTO.ID_EMPRESA, '+
            '        0 ID_TRANSACCION, '+
            '        0 ID_TRANSACCION_C, '+
            '        CRCRED.ID_CREDITO, '+
            '        CRCAP.NUM_PERIODO AS PERCAPITAL, '+
            '        CRCAP.PLAZO , '+
            '        CRCAP.F_VENCIMIENTO AS FHVTOCAP, '+
            '        CRCAP.F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        CRCRED.TASA_CREDITO, '+
            '        CRCAP.IMP_CUOTA IMP_CAPITAL, '+
            '        0 IMP_PAGADO, '+
            '        DECODE(IMP_CUOTA,''IM'',CRCAP.IMP_CUOTA,0) AS IMPVENCIDO, '+
            '        CRCRED.SDO_VIG_TOTAL SDO_INSOLUTO, '+
            '        CRCAP.SIT_CAPITAL, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_OPERACION, '+
            '        '''' AS CVE_OPERACION, '+
            '        '''' AS DESC_L_OPERACION, '+
            '        0 AS IMP_CONCEPTO, '+
            '        0 AS NUM_PERIODO, '+
            '        0 AS PLAZO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_VENCIMIENTO , '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS TASA_APLICADA,0 AS IMP_INTERES,0 AS IMP_IVA, '+
            '        0 AS IMP_PAGADO,0 AS IMPVENCIDO, '+
            '        '''' AS SIT_INTERES, '+
            '        0 AS NUM_PERIODO, '+
            '        '''' AS CVE_COMISION, '+
            '        '''' AS DESC_COMISION, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_VENCIMIENTO , '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS PCT_COMISION,0 AS IMP_COMISION,0 AS IMP_IVA, '+
            '        0 AS IMP_PAGADO,0  AS IMPVENCIDO, '+
            '        '''' AS SIT_COMISION, '+
            '        0 AS FA_NUMPER, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FA_FVENCIM, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FA_FPAGO, '+
            '        0 AS FA_IMPFINAN, '+
            '        0 AS FA_IMPPAGADO, '+
            '        0 AS FA_IMPVENCIDO, '+
            '        '''' AS FA_SITFINAN, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_OPERACION_C, '+
            '        '''' CVE_OPERACION_C, '+
            '        '''' DESC_L_OPERACION_C, '+
            '        0 AS IMP_CONCEPTO_C '+
            //HERJA ANEXO DEL FINANCIAMIMENTO ADICIONAL
            '       ,'''' AS B_FINAN_ADIC '+
            '       ,'''' AS CVE_FINAN_ADIC '+
            // ASTECI.hegc ANEXO DE TRAMOS
            '       , TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_REVISION, 0 TASA_TRAMO'+
            '   FROM CR_CREDITO CRCRED, '+
            '        ( SELECT    ID_REF_SOL_CUOTA,                    NUM_PERIODO     , '+
            '                    PLAZO           ,                    F_VENCIMIENTO   , '+
            '                    F_PROG_PAGO     ,                    IMP_CUOTA       , '+
            '                    SIT_CAPITAL '+
            '           FROM CR_SOL_CUOTA '+
            '           WHERE CVE_ACCESORIO = ''CP'') CRCAP, CR_CONTRATO, CR_PRODUCTO '+
            '  WHERE CRCRED.ID_CREDITO = CRCAP.ID_REF_SOL_CUOTA '+
            '    AND CRCRED.ID_CREDITO =  '+ sCesion +
            '    AND CRCRED.SIT_CREDITO = ''NA'' '+
            '    AND CRCRED.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
            '    AND CRCRED.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+
            '    AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE ';
      If Trim(sEmpresa)<> '' Then
         sSQL1:= sSQL1 + ' AND CR_PRODUCTO.ID_EMPRESA ='+ Trim(sEmpresa);

      sSQL1:= sSQL1 + ' UNION '+
            'SELECT 1 AS IDGRUPO, '+
            '       CR_PRODUCTO.ID_EMPRESA, '+
            '        0 ID_TRANSACCION, '+
            '        0 ID_TRANSACCION_C, '+
            '        CRCRED.ID_CREDITO, '+
            '        CRCAP.NUM_PERIODO AS PERCAPITAL, '+
            '        CRCAP.PLAZO , '+
            '        CRCAP.F_VENCIMIENTO AS FHVTOCAP, '+
            '        CRCAP.F_PROG_PAGO, '+
            '        CRCAP.F_PAGO, '+
            '        CRCRED.TASA_CREDITO, '+
            '        CRCAP.IMP_CAPITAL, '+
            '        CRCAP.IMP_PAGADO, '+
            '        DECODE(SIT_CAPITAL,''IM'',(CRCAP.IMP_CAPITAL - CRCAP.IMP_PAGADO),0) AS IMPVENCIDO, '+
            '        CRCRED.SDO_VIG_TOTAL SDO_INSOLUTO, '+
            '        CRCAP.SIT_CAPITAL, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_OPERACION, '+
            '        '''' AS CVE_OPERACION, '+
            '        '''' AS DESC_L_OPERACION, '+
            '        0 AS IMP_CONCEPTO, '+
            '        0 AS NUM_PERIODO, '+
            '        0 AS PLAZO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS  F_VENCIMIENTO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS TASA_APLICADA, '+
            '        0 AS IMP_INTERES, '+
            '        0 AS IMP_IVA, '+
            '        0 AS IMP_PAGADO, '+
            '        0 AS IMPVENCIDO, '+
            '        '''' AS SIT_INTERES, '+
            '        0 AS NUM_PERIODO, '+
            '        '''' AS CVE_COMISION, '+
            '        '''' AS DESC_COMISION, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_VENCIMIENTO , '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS PCT_COMISION, '+
            '        0 AS IMP_COMISION, '+
            '        0 AS IMP_IVA, '+
            '        0 AS IMP_PAGADO, '+
            '        0  AS IMPVENCIDO, '+
            '        '''' AS SIT_COMISION, '+
            '        0 AS FA_NUMPER, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FA_FVENCIM, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FA_FPAGO, '+
            '        0 AS FA_IMPFINAN, '+
            '        0 AS FA_IMPPAGADO, '+
            '        0 AS FA_IMPVENCIDO, '+
            '        '''' AS FA_SITFINAN, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_OPERACION_C, '+
            '        '''' CVE_OPERACION_C, '+
            '        '''' DESC_L_OPERACION_C, '+
            '        0 AS IMP_CONCEPTO_C '+
            //HERJA ANEXO DEL FINANCIAMIMENTO ADICIONAL
            '       ,'''' AS B_FINAN_ADIC '+
            '       ,'''' AS CVE_FINAN_ADIC '+
            // ASTECI.hegc ANEXO DE TRAMOS
            '       , TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_REVISION, 0 TASA_TRAMO'+
            '   FROM CR_CREDITO CRCRED, CR_CAPITAL CRCAP, CR_CONTRATO, CR_PRODUCTO '+
            '  WHERE CRCRED.ID_CREDITO = CRCAP.ID_CREDITO '+
            '    AND CRCRED.ID_CREDITO =  '+ sCesion +
            '    AND CRCRED.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
            '    AND CRCRED.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+
            '    AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE ';
      If Trim(sEmpresa)<> '' Then
         sSQL1:= sSQL1 + ' AND CR_PRODUCTO.ID_EMPRESA ='+ Trim(sEmpresa)+ ') '
      Else sSQL1:= sSQL1 + ') ';

    sSQL2:= 'UNION '+
            '(SELECT 2 AS IDGRUPO, '+
            '        AMORTI.ID_EMPRESA, '+
            '        AMORTI.ID_TRANSACCION, '+
            '        0 ID_TRANSACCION_C, '+
            '        AMORTI.ID_CREDITO, '+
            '        0 AS PERCAPITAL, '+
            '        0 AS PLAZO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FHVTOCAP, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS TASA_CREDITO, '+
            '        0 AS IMP_CAPITAL, '+
            '        0 AS IMP_PAGADO, '+
            '        0 AS IMPVENCIDO, '+
            '        0 AS SDO_INSOLUTO, '+
            '        '''' AS SIT_CAPITAL, '+
            '        AMORTI.F_OPERACION, '+
            '        AMORTI.CVE_OPERACION, '+
            '        AMORTI.DESC_L_OPERACION, '+
            '        AMORTI.IMP_CONCEPTO, '+
            '        0 AS NUM_PERIODO, '+
            '        0 AS PLAZO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS  F_VENCIMIENTO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS TASA_APLICADA, '+
            '        0 AS IMP_INTERES, '+
            '        0 AS IMP_IVA, '+
            '        0 AS IMP_PAGADO, '+
            '        0 AS IMPVENCIDO, '+
            '        '''' AS SIT_INTERES, '+
            '        0 AS NUM_PERIODO, '+
            '        '''' AS CVE_COMISION, '+
            '        '''' AS DESC_COMISION, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_VENCIMIENTO , '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS PCT_COMISION, '+
            '        0 AS IMP_COMISION, '+
            '        0 AS IMP_IVA, '+
            '        0 AS IMP_PAGADO, '+
            '        0  AS IMPVENCIDO, '+
            '        '''' AS SIT_COMISION, '+
            '        0 AS FA_NUMPER, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FA_FVENCIM, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FA_FPAGO, '+
            '        0 AS FA_IMPFINAN, '+
            '        0 AS FA_IMPPAGADO, '+
            '        0 AS FA_IMPVENCIDO, '+
            '        '''' AS FA_SITFINAN, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_OPERACION_C, '+
            '        '''' CVE_OPERACION_C, '+
            '        '''' DESC_L_OPERACION_C, '+
            '        0 AS IMP_CONCEPTO_C '+
            //HERJA ANEXO DEL FINANCIAMIMENTO ADICIONAL
            '       ,'''' AS B_FINAN_ADIC '+
            '       ,'''' AS CVE_FINAN_ADIC '+
            // ASTECI.hegc ANEXO DE TRAMOS
            '       , TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_REVISION, 0 TASA_TRAMO'+
            '   FROM '+
            '        (SELECT CRCRED.ID_CREDITO, CT.F_OPERACION, CT.CVE_OPERACION, '+
            '                CO.DESC_L_OPERACION, CDT.IMP_CONCEPTO,CT.ID_TRANSACCION, '+
            '                CR_PRODUCTO.ID_EMPRESA '+
            '         FROM CR_CREDITO CRCRED,CR_TRANSACCION CT,CR_DET_TRANSAC CDT,CR_OPERACION CO, '+
            '                (SELECT DISTINCT(CVE_OPERACION) '+
            '                 FROM CR_REL_CON_AFEC '+
            '                 WHERE CVE_CONCEPTO = ''IMPBRU'' '+
            '                 AND CVE_AFECTACION IN (''FNIMPA'') '+
            '                 AND CVE_AFECTA_SDO = ''I'' '+
            '                 GROUP BY CVE_OPERACION) CRCA, CR_CONTRATO, CR_PRODUCTO  '+
            '         WHERE CT.CVE_OPERACION = CRCA.CVE_OPERACION '+
            '         AND CT.SIT_TRANSACCION = ''AC'' '+
            '         AND CT.ID_TRANS_CANCELA IS NULL '+
            '         AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION '+
            '         AND CT.CVE_OPERACION = CDT.CVE_OPERACION '+
            '         AND CDT.CVE_CONCEPTO = ''IMPBRU'' '+
            '         AND CT.CVE_OPERACION = CO.CVE_OPERACION '+
            '         AND CT.ID_CREDITO = CRCRED.ID_CREDITO '+
            '         AND CRCRED.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
            '         AND CRCRED.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+
            '         AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE '+
            '         AND CRCRED.ID_CREDITO =  '+ sCesion +
            '        UNION ALL '+
            '         SELECT CRCRED.ID_CREDITO,CT.F_OPERACION, CT.CVE_OPERACION, '+
            '                CO.DESC_L_OPERACION, CDT.IMP_CONCEPTO, CT.ID_TRANSACCION, '+
            '                CR_PRODUCTO.ID_EMPRESA '+
            '         FROM CR_CREDITO CRCRED,CR_TRANSACCION CT,CR_DET_TRANSAC CDT,CR_OPERACION CO, '+
            '             (SELECT DISTINCT(CVE_OPERACION) '+
            '           FROM CR_REL_CON_AFEC '+
            '          WHERE CVE_CONCEPTO = ''IMPBRU'' '+
            '            AND ( ( CVE_AFECTACION IN (''CAIMPA'',''CIIMPA'') AND CVE_AFECTA_SDO = ''I'' ) OR '+
            '                  ( CVE_AFECTACION IN (''CAIMCA'') AND CVE_AFECTA_SDO = ''D'' ) '+
            '                ) ' +
            '          GROUP BY CVE_OPERACION) CRCA, CR_CONTRATO, CR_PRODUCTO '+
            '  WHERE CT.CVE_OPERACION = CRCA.CVE_OPERACION '+
            '    AND CT.CVE_TIPO_MOVTO IN ( ''AN'', ''AV'' ) '+
            '    AND CT.SIT_TRANSACCION = ''AC'' '+
            '    AND CT.ID_TRANS_CANCELA IS NULL '+
            '    AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION '+
            '    AND CT.CVE_OPERACION = CDT.CVE_OPERACION '+
            '    AND CDT.CVE_CONCEPTO = ''IMPBRU'' '+
            '    AND CT.CVE_OPERACION = CO.CVE_OPERACION '+
            '    AND CT.ID_CREDITO = CRCRED.ID_CREDITO '+
            '    AND CRCRED.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
            '    AND CRCRED.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+
            '    AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE '+
            '    AND CRCRED.ID_CREDITO =  '+ sCesion +
            '    AND CO.CVE_OPERACION NOT IN (SELECT DISTINCT CVE_OPERACION ' +
            '                                 FROM   CR_CVE_OPERACION ' +
            '                                 WHERE  CVE_PARAMETRO IN ( ''QUITCN'', ''QUITIN'', ''QUITFN'', ''QUITCP'', ' +
            '                                                           ''CASTCN'', ''CASTIN'', ''CASTFN'', ''CASTCP'', ' +
            '                                                           ''QUEBCN'', ''QUEBIN'', ''QUEBFN'', ''QUEBCP'', ' +
            '                                                           ''CODNCN'', ''CODNIN'', ''CODNFN'', ''CODNCP'', ' +
            '                                                           ''ADJUCN'', ''ADJUIN'', ''ADJUFN'', ''ADJUCP'', ' +
            '                                                           ''DACICN'', ''DACIIN'', ''DACIFN'', ''DACICP''  ' +
            '                                                         ) ' +
            '                                ) ' +
            ' ) AMORTI ';
      If Trim(sEmpresa)<> '' Then
         sSQL2:= sSQL2 + ' WHERE AMORTI.ID_EMPRESA ='+ Trim(sEmpresa)+ ') '
      Else sSQL2:= sSQL2 + ') ';

    sSQL3:= 'UNION '+
            '(SELECT 3 IDGRUPO, '+
            '       CR_PRODUCTO.ID_EMPRESA, '+
            '        0 ID_TRANSACCION, '+
            '        0 ID_TRANSACCION_C, '+
            '        FA.ID_CREDITO, '+
            '        0 AS PERCAPITAL, '+
            '        0 AS PLAZO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FHVTOCAP, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS TASA_CREDITO, '+
            '        0 AS IMP_CAPITAL, '+
            '        0 AS IMP_PAGADO, '+
            '        0 AS IMPVENCIDO, '+
            '        0 AS SDO_INSOLUTO, '+
            '        '''' AS SIT_CAPITAL, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_OPERACION, '+
            '        '''' AS CVE_OPERACION, '+
            '        '''' AS DESC_L_OPERACION, '+
            '        0 AS IMP_CONCEPTO, '+
            '        0 AS NUM_PERIODO, '+
            '        0 AS PLAZO, TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS  F_VENCIMIENTO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS TASA_APLICADA, '+
            '        0 AS IMP_INTERES, '+
            '        0 AS IMP_IVA, '+
            '        0 AS IMP_PAGADO, '+
            '        0 AS IMPVENCIDO, '+
            '        '''' AS SIT_INTERES, '+
            '        0 AS NUM_PERIODO, '+
            '        '''' AS CVE_COMISION, '+
            '        '''' AS DESC_COMISION, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_VENCIMIENTO , '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS PCT_COMISION, '+
            '        0 AS IMP_COMISION, '+
            '        0 AS IMP_IVA, '+
            '        0 AS IMP_PAGADO, '+
            '        0 AS IMPVENCIDO, '+
            '        '''' AS SIT_COMISION, '+
            '        FA.NUM_PERIODO AS FA_NUMPER, '+
            '        FA.F_VENCIMIENTO AS FA_FVENCIM, '+
            '        FA.F_PAGO AS FA_FPAGO, '+
            '        FA.IMP_FINAN_ADIC AS FA_IMPFINAN, '+
            '        FA.IMP_PAGADO AS FA_IMPPAGADO, '+
            '        DECODE(FA.SIT_FINAN_ADIC,''IM'',(FA.IMP_FINAN_ADIC - FA.IMP_PAGADO),0) AS FA_IMPVENCIDO, '+
            '        FA.SIT_FINAN_ADIC AS FA_SITFINAN, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_OPERACION_C, '+
            '        '''' CVE_OPERACION_C, '+
            '        '''' DESC_L_OPERACION_C, '+
            '        0 AS IMP_CONCEPTO_C '+
            //HERJA ANEXO DEL FINANCIAMIMENTO ADICIONAL
            '       ,'''' AS B_FINAN_ADIC '+
            '       ,'''' AS CVE_FINAN_ADIC '+
            // ASTECI.hegc ANEXO DE TRAMOS
            '       , TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_REVISION, 0 TASA_TRAMO'+
            '   FROM CR_FINAN_ADIC FA, CR_CREDITO, CR_CONTRATO, CR_PRODUCTO '+
            '  WHERE FA.ID_CREDITO =  '+ sCesion +
            '    AND FA.ID_CREDITO = CR_CREDITO.ID_CREDITO '+
            '    AND CR_CREDITO.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
            '    AND CR_CREDITO.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+
            '    AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE ';
      If Trim(sEmpresa)<> '' Then
         sSQL3:= sSQL3 + ' AND CR_PRODUCTO.ID_EMPRESA ='+ Trim(sEmpresa)+ ') '
      Else sSQL3:= sSQL3 + ') ';

    sSQL4:= 'UNION '+
            '(SELECT 4 IDGRUPO , '+
            '        CR_PRODUCTO.ID_EMPRESA, '+
            '        0 ID_TRANSACCION, '+
            '        0 ID_TRANSACCION_C, '+
            '        CRCRED.ID_CREDITO, '+
            '        0 AS PERCAPITAL, '+
            '        0 AS PLAZO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FHVTOCAP, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS TASA_CREDITO, '+
            '        0 AS IMP_CAPITAL, '+
            '        0 AS IMP_PAGADO, '+
            '        0 AS IMPVENCIDO, '+
            '        0 AS SDO_INSOLUTO, '+
            '        '''' AS SIT_CAPITAL, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_OPERACION, '+
            '        '''' AS CVE_OPERACION, '+
            '        '''' AS DESC_L_OPERACION, '+
            '        0 AS IMP_CONCEPTO, '+
            '        INTER.NUM_PERIODO, '+
            '        INTER.PLAZO, '+
            '        INTER.F_VENCIMIENTO, '+
            '        INTER.F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        TASA_CREDITO AS TASA_APLICADA, '+
            '        INTER.IMP_CUOTA, '+
            '        0 IMP_IVA, '+
            '        0 IMP_PAGADO, '+
            '        DECODE(SIT_CAPITAL,''IM'',INTER.IMP_CUOTA,0) AS IMPVENCIDO, '+
            '        INTER.SIT_CAPITAL, '+
            '        0 AS NUM_PERIODO, '+
            '        '''' AS CVE_COMISION, '+
            '        '''' AS DESC_COMISION, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_VENCIMIENTO , '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS PCT_COMISION, '+
            '        0 AS IMP_COMISION, '+
            '        0 AS IMP_IVA, '+
            '        0 AS IMP_PAGADO, '+
            '        0 AS IMPVENCIDO, '+
            '        '''' AS SIT_COMISION, '+
            '        0 AS FA_NUMPER, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FA_FVENCIM, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FA_FPAGO, '+
            '        0 AS FA_IMPFINAN, '+
            '        0 AS FA_IMPPAGADO, '+
            '        0 AS FA_IMPVENCIDO, '+
            '        '''' AS FA_SITFINAN, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_OPERACION_C, '+
            '        '''' CVE_OPERACION_C, '+
            '        '''' DESC_L_OPERACION_C, '+
            '        0 AS IMP_CONCEPTO_C, '+
            //HERJA ANEXO DEL FINANCIAMIMENTO ADICIONAL
            '       (CASE '+
            '         WHEN INTER.B_FINAN_ADIC = ''F'' Then ''NO'' '+
            '         WHEN INTER.B_FINAN_ADIC = ''V'' Then ''SI'' '+
            '        END) B_FINAN_ADIC, ' +
            '       (CASE '+
            '         WHEN INTER.CVE_FINAN_ADIC = ''DR'' Then ''Directo'' '+
            '         WHEN INTER.CVE_FINAN_ADIC = ''PR'' Then ''Prorrateo'' '+
            '        END) CVE_FINAN_ADIC ' +
            // ASTECI.hegc ANEXO DE TRAMOS
            '       , TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_REVISION, 0 TASA_TRAMO'+
            '   FROM CR_CREDITO CRCRED, '+
            '        ( SELECT    ID_REF_SOL_CUOTA,                    NUM_PERIODO     , '+
            '                    PLAZO           ,                    F_VENCIMIENTO   , '+
            '                    F_PROG_PAGO     ,                    IMP_CUOTA       , '+
            '                    SIT_CAPITAL     ,                    B_FINAN_ADIC    , '+
            '                    CVE_FINAN_ADIC                                         '+
            '           FROM CR_SOL_CUOTA '+
            '           WHERE CVE_ACCESORIO = ''IN'') INTER, CR_CONTRATO, CR_PRODUCTO '+
            '   WHERE CRCRED.ID_CREDITO = INTER.ID_REF_SOL_CUOTA '+
            '     AND CRCRED.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
            '     AND CRCRED.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+
            '     AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE '+
            '    AND CRCRED.ID_CREDITO =   '+  sCesion +
            '    AND CRCRED.SIT_CREDITO = ''NA'' ';

      If Trim(sEmpresa)<> '' Then
         sSQL4:= sSQL4 + ' AND CR_PRODUCTO.ID_EMPRESA ='+ Trim(sEmpresa);

      sSQL4:= sSQL4 +
            ' UNION '+
            'SELECT 4 IDGRUPO , '+
            '        CR_PRODUCTO.ID_EMPRESA, '+
            '        0 ID_TRANSACCION, '+
            '        0 ID_TRANSACCION_C, '+
            '        CRCRED.ID_CREDITO, '+
            '        0 AS PERCAPITAL, '+
            '        0 AS PLAZO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FHVTOCAP, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS TASA_CREDITO, '+
            '        0 AS IMP_CAPITAL, '+
            '        0 AS IMP_PAGADO, '+
            '        0 AS IMPVENCIDO, '+
            '        0 AS SDO_INSOLUTO, '+
            '        '''' AS SIT_CAPITAL, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_OPERACION, '+
            '        '''' AS CVE_OPERACION, '+
            '        '''' AS DESC_L_OPERACION, '+
            '        0 AS IMP_CONCEPTO, '+
            '        INTER.NUM_PERIODO, '+
            '        INTER.PLAZO, '+
            '        INTER.F_VENCIMIENTO, '+
            '        INTER.F_PROG_PAGO, '+
            '        INTER.F_PAGO, '+
            '        INTER.TASA_APLICADA, '+
            '        INTER.IMP_INTERES, '+
            '        INTER.IMP_IVA, '+
            '        INTER.IMP_PAGADO + INTER.IMP_IVA_PAGADO AS IMP_PAGADO, '+
            '        DECODE(SIT_INTERES,''IM'',(INTER.IMP_INTERES + INTER.IMP_IVA - INTER.IMP_PAGADO - INTER.IMP_IVA_PAGADO),0) AS IMPVENCIDO, '+
//            '        INTER.SIT_INTERES, '+   //RABA MAY 2015 REQ. FINAN_ADIC
            '        (CASE WHEN INTER.SIT_INTERES=''LQ'' AND INTER.B_FINAN_ADIC=''V'' THEN CAST(FUN_CR_SIT_INT(CRCRED.ID_CREDITO,INTER.NUM_PERIODO) AS VARCHAR2(2)) '+
            '              ELSE INTER.SIT_INTERES END) SIT_INTERES, '+
            '        0 AS NUM_PERIODO, '+
            '        '''' AS CVE_COMISION, '+
            '        '''' AS DESC_COMISION, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_VENCIMIENTO , '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS PCT_COMISION, '+
            '        0 AS IMP_COMISION, '+
            '        0 AS IMP_IVA, '+
            '        0 AS IMP_PAGADO, '+
            '        0 AS IMPVENCIDO, '+
            '        '''' AS SIT_COMISION, '+
            '        0 AS FA_NUMPER, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FA_FVENCIM, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FA_FPAGO, '+
            '        0 AS FA_IMPFINAN, '+
            '        0 AS FA_IMPPAGADO, '+
            '        0 AS FA_IMPVENCIDO, '+
            '        '''' AS FA_SITFINAN, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_OPERACION_C, '+
            '        '''' CVE_OPERACION_C, '+
            '        '''' DESC_L_OPERACION_C, '+
            '        0 AS IMP_CONCEPTO_C, '+
            //HERJA ANEXO DEL FINANCIAMIMENTO ADICIONAL
            '       (CASE '+
            '         WHEN INTER.B_FINAN_ADIC = ''F'' Then ''NO'' '+
            '         WHEN INTER.B_FINAN_ADIC = ''V'' Then ''SI'' '+
            '        END) B_FINAN_ADIC, ' +
            '       (CASE '+
            '         WHEN INTER.CVE_FINAN_ADIC = ''DR'' Then ''Directo'' '+
            '         WHEN INTER.CVE_FINAN_ADIC = ''PR'' Then ''Prorrateo'' '+
            '        END) CVE_FINAN_ADIC ' +
            // ASTECI.hegc ANEXO DE TRAMOS
            '       , TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_REVISION, 0 TASA_TRAMO'+
            '   FROM CR_INTERES INTER, CR_CREDITO CRCRED, CR_CONTRATO, CR_PRODUCTO '+
            '  WHERE INTER.ID_CREDITO = CRCRED.ID_CREDITO '+
            '    AND CRCRED.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
            '    AND CRCRED.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+
            '    AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE '+
            '    AND CRCRED.ID_CREDITO =  '+ sCesion;
      If Trim(sEmpresa)<> '' Then
         sSQL4:= sSQL4 + ' AND CR_PRODUCTO.ID_EMPRESA ='+ Trim(sEmpresa)+ ') '
      Else sSQL4:= sSQL4 + ') ';

    sSQL5:= 'UNION '+
            '(SELECT 5 IDGRUPO, '+
            '        CR_PRODUCTO.ID_EMPRESA, '+
            '        0 ID_TRANSACCION, '+
            '        0 ID_TRANSACCION_C, '+
            '        CRCRED.ID_CREDITO, '+
            '        0 AS PERCAPITAL, '+
            '        0 AS PLAZO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FHVTOCAP, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS TASA_CREDITO, '+
            '        0 AS IMP_CAPITAL, '+
            '        0 AS IMP_PAGADO, '+
            '        0 AS IMPVENCIDO, '+
            '        0 AS SDO_INSOLUTO, '+
            '        '''' AS SIT_CAPITAL, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_OPERACION, '+
            '        '''' AS CVE_OPERACION, '+
            '        '''' AS DESC_L_OPERACION, '+
            '        0 AS IMP_CONCEPTO, '+
            '        0 AS NUM_PERIODO, '+
            '        0 AS PLAZO, TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS  F_VENCIMIENTO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS TASA_APLICADA, '+
            '        0 AS IMP_INTERES, '+
            '        0 AS IMP_IVA, '+
            '        0 AS IMP_PAGADO, '+
            '        0 AS IMPVENCIDO, '+
            '        '''' AS SIT_INTERES, '+
            '        COM.NUM_PERIODO, '+
            '        COM.CVE_COMISION, '+
            '        CATCOM.DESC_COMISION, '+
            '        COM.F_VENCIMIENTO , '+
            '        COM.F_PROG_PAGO, '+
            '        COM.F_PAGO, '+
            '        DECODE(COM.CVE_COMISION,''CODI'',CRCRED.PCT_COMISION,COM.PCT_COMISION)PCT_COMISION, '+
            '        COM.IMP_COMISION, '+
            '        COM.IMP_IVA, '+
            '        COM.IMP_PAGADO + COM.IMP_IVA_PAGADO  IMP_PAGADO, '+
            '        DECODE(SIT_COMISION,''IM'',(COM.IMP_COMISION + COM.IMP_IVA - COM.IMP_IVA_PAGADO - COM.IMP_PAGADO),0) AS IMPVENCIDO, '+
            '        COM.SIT_COMISION, '+
            '        0 AS FA_NUMPER, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FA_FVENCIM, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FA_FPAGO, '+
            '        0 AS FA_IMPFINAN, '+
            '        0 AS FA_IMPPAGADO, '+
            '        0 AS FA_IMPVENCIDO, '+
            '        '''' AS FA_SITFINAN, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_OPERACION_C, '+
            '        '''' CVE_OPERACION_C, '+
            '        '''' DESC_L_OPERACION_C, '+
            '        0 AS IMP_CONCEPTO_C '+
            //HERJA ANEXO DEL FINANCIAMIMENTO ADICIONAL
            '       ,'''' AS B_FINAN_ADIC '+
            '       ,'''' AS CVE_FINAN_ADIC '+
            // ASTECI.hegc ANEXO DE TRAMOS
            '       , TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_REVISION, 0 TASA_TRAMO'+
            '   FROM CR_COMISION COM, CR_CREDITO CRCRED, CR_CAT_COMISION CATCOM, '+
            '        CR_CONTRATO, CR_PRODUCTO '+
            '  WHERE COM.SIT_COMISION <> ''CA'' '+//EASA4011    15/07/2005
            '    AND COM.ID_CREDITO = CRCRED.ID_CREDITO '+
            '    AND CATCOM.CVE_COMISION = COM.CVE_COMISION '+
            '    AND CRCRED.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
            '    AND CRCRED.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+
            '    AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE '+
            '    AND CRCRED.ID_CREDITO = '+  sCesion ;
      If Trim(sEmpresa)<> '' Then
         sSQL5:= sSQL5 + ' AND CR_PRODUCTO.ID_EMPRESA ='+ Trim(sEmpresa)+ ') '
      Else sSQL5:= sSQL5 + ') ';

    sSQL6:= 'UNION '+
            '(SELECT 6 AS IDGRUPO, '+
            '        COND.ID_EMPRESA, '+
            '        0 ID_TRANSACCION, '+
            '        COND.ID_TRANSACCION AS ID_TRANSACCION_C, '+
            '        COND.ID_CREDITO, '+
            '        0 AS PERCAPITAL, '+
            '        0 AS PLAZO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FHVTOCAP, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS TASA_CREDITO, '+
            '        0 AS IMP_CAPITAL, '+
            '        0 AS IMP_PAGADO, '+
            '        0 AS IMPVENCIDO, '+
            '        0 AS SDO_INSOLUTO, '+
            '        '''' AS SIT_CAPITAL, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_OPERACION, '+
            '        '''' CVE_OPERACION, '+
            '        '''' DESC_L_OPERACION, '+
            '        0 AS IMP_CONCEPTO, '+
            '        0 AS NUM_PERIODO, '+
            '        0 AS PLAZO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS  F_VENCIMIENTO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS TASA_APLICADA, '+
            '        0 AS IMP_INTERES, '+
            '        0 AS IMP_IVA, '+
            '        0 AS IMP_PAGADO, '+
            '        0 AS IMPVENCIDO, '+
            '        '''' AS SIT_INTERES, '+
            '        0 AS NUM_PERIODO, '+
            '        '''' AS CVE_COMISION, '+
            '        '''' AS DESC_COMISION, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_VENCIMIENTO , '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS PCT_COMISION, '+
            '        0 AS IMP_COMISION, '+
            '        0 AS IMP_IVA, '+
            '        0 AS IMP_PAGADO, '+
            '        0  AS IMPVENCIDO, '+
            '        '''' AS SIT_COMISION, '+
            '        0 AS FA_NUMPER, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FA_FVENCIM, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FA_FPAGO, '+
            '        0 AS FA_IMPFINAN, '+
            '        0 AS FA_IMPPAGADO, '+
            '        0 AS FA_IMPVENCIDO, '+
            '        '''' AS FA_SITFINAN, '+
            '        COND.F_OPERACION AS F_OPERACION_C, '+
            '        COND.CVE_OPERACION AS CVE_OPERACION_C, '+
            '        COND.TX_NOTA AS DESC_L_OPERACION_C,' +
            '        COND.IMP_CONCEPTO AS IMP_CONCEPTO_C '+
            //HERJA ANEXO DEL FINANCIAMIMENTO ADICIONAL
            '       ,'''' AS B_FINAN_ADIC '+
            '       ,'''' AS CVE_FINAN_ADIC '+
            // ASTECI.hegc ANEXO DE TRAMOS
            '       , TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_REVISION, 0 TASA_TRAMO'+
            '   FROM '+
            '        (SELECT CRCRED.ID_CREDITO, CT.F_OPERACION, CT.CVE_OPERACION, '+
            '                CO.DESC_L_OPERACION, CDT.IMP_CONCEPTO,CT.ID_TRANSACCION, '+
            '                CR_PRODUCTO.ID_EMPRESA,  '+
            '                CO.DESC_L_OPERACION || '' '' || DECODE( CON.CVE_CONCEPTO, ''IMPBRU'', '''', ''('' || CON.DESC_C_CONCEPTO || '')'') || '' '' || ''Per. '' || CT.ID_PERIODO || '' '' || ''('' || CT.TASA_APLICADA || '' % )'' || '' '' || ''( '' || CT.F_VALOR || '' )'' TX_NOTA ' +
            '         FROM CR_CREDITO CRCRED,CR_TRANSACCION CT,CR_DET_TRANSAC CDT,CR_OPERACION CO, '+
            '               CR_CVE_OPERACION CCVE, CR_CONTRATO, CR_PRODUCTO , CR_CONCEPTO CON ' +
            '         WHERE CT.SIT_TRANSACCION = ''AC'' '+
            '         AND CT.ID_TRANS_CANCELA IS NULL '+
            '         AND CT.ID_TRANSACCION  = CDT.ID_TRANSACCION '+
            '         AND CT.CVE_OPERACION   = CDT.CVE_OPERACION '+
            '         AND CT.CVE_OPERACION   = CO.CVE_OPERACION '+
            '         AND CT.ID_CREDITO = CRCRED.ID_CREDITO '+
            '         AND CRCRED.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
            '         AND CRCRED.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+
            '         AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE '+
            '         AND CDT.CVE_CONCEPTO = con.CVE_CONCEPTO '+
            '         AND CRCRED.ID_CREDITO =  '+ sCesion +
            '         AND CCVE.CVE_PRODUCTO  = CR_PRODUCTO.CVE_PRODUCTO_CRE '+
            '         AND CCVE.CVE_MONEDA    = CR_CONTRATO.CVE_MONEDA '+
            '         AND CCVE.CVE_PARAMETRO IN ( ''QUITCN'', ''QUITIN'', ''QUITFN'', ''QUITCP'', '+
            '                                     ''CASTCN'', ''CASTIN'', ''CASTFN'', ''CASTCP'', '+
            '                                     ''QUEBCN'', ''QUEBIN'', ''QUEBFN'', ''QUEBCP'', ' +
            '                                     ''ADJUCN'', ''ADJUIN'', ''ADJUFN'', ''ADJUCP'', ' +
            '                                     ''DACICN'', ''DACIIN'', ''DACIFN'', ''DACICP'', ' +            
            '                                     ''CODNCN'', ''CODNIN'', ''CODNFN'', ''CODNCP'') ' +
            //'                                     ''QUEBCN'', ''QUEBIN'', ''QUEBFN'', ''QUEBCP'') '+
            '         AND CCVE.CVE_OPERACION = CT.CVE_OPERACION '+
            ' ) COND ';
      If Trim(sEmpresa)<> '' Then
         sSQL6:= sSQL6 + ' WHERE COND.ID_EMPRESA ='+ Trim(sEmpresa)+ ') '
      Else sSQL6:= sSQL6 + ') ';
// hegc
sSQL7:= 'UNION '+
            '(SELECT 7 AS IDGRUPO, '+
            '        0 AS ID_EMPRESA, '+
            '        0 AS ID_TRANSACCION, '+
            '        0 AS ID_TRANSACCION_C, '+
            '        CTRAM.ID_CREDITO AS  ID_CREDITO, '+
            '        0 AS PERCAPITAL, '+
            '        0 AS PLAZO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FHVTOCAP, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS TASA_CREDITO, '+
            '        0 AS IMP_CAPITAL, '+
            '        0 AS IMP_PAGADO, '+
            '        0 AS IMPVENCIDO, '+
            '        0 AS SDO_INSOLUTO, '+
            '        '''' AS SIT_CAPITAL, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_OPERACION, '+
            '        '''' CVE_OPERACION, '+
            '        '''' DESC_L_OPERACION, '+
            '        0 AS IMP_CONCEPTO, '+
            '        0 AS NUM_PERIODO, '+
            '        0 AS PLAZO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS  F_VENCIMIENTO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS TASA_APLICADA, '+
            '        0 AS IMP_INTERES, '+
            '        0 AS IMP_IVA, '+
            '        0 AS IMP_PAGADO, '+
            '        0 AS IMPVENCIDO, '+
            '        '''' AS SIT_INTERES, '+
            '        0 AS NUM_PERIODO, '+
            '        '''' AS CVE_COMISION, '+
            '        '''' AS DESC_COMISION, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_VENCIMIENTO , '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE('''',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS PCT_COMISION, '+
            '        0 AS IMP_COMISION, '+
            '        0 AS IMP_IVA, '+
            '        0 AS IMP_PAGADO, '+
            '        0  AS IMPVENCIDO, '+
            '        '''' AS SIT_COMISION, '+
            '        0 AS FA_NUMPER, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FA_FVENCIM, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FA_FPAGO, '+
            '        0 AS FA_IMPFINAN, '+
            '        0 AS FA_IMPPAGADO, '+
            '        0 AS FA_IMPVENCIDO, '+
            '        '''' AS FA_SITFINAN, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_OPERACION_C, '+
            '        '''' CVE_OPERACION_C, '+
            '        '''' DESC_L_OPERACION_C, '+
            '        0 AS IMP_CONCEPTO_C '+
            //HERJA ANEXO DEL FINANCIAMIMENTO ADICIONAL
            '       ,'''' AS B_FINAN_ADIC '+
            '       ,'''' AS CVE_FINAN_ADIC '+            
            '       ,F_REvISION, TASA_TRAMO ' +
// HEGC ASTECI ABR 15 2010 MOSTRAR LAS TASAS DE LOS TRAMOS CAPTURADOS PARA T2 Y T3
            '   FROM '+
            '         (SELECT CTRAM.ID_CREDITO, F_REVISION, PKGCRCOMUN.FUNOBTENTASATRAMO(CCRE.CVE_TASA_REFER,F_REVISION,CVE_CALCULO)+SOBRETASA AS TASA_TRAMO '+
            '         FROM CR_TRAMO_INTER CTRAM, CR_CREDITO CCRE' +
            '         WHERE CTRAM.ID_CREDITO=CCRE.ID_CREDITO  AND SIT_TRAMO_INTER=''AC''  '+
            '         AND CTRAM.ID_CREDITO='+sCesion +
            '         UNION '+
            '           ( select ID_CREDITO, F_VENCIMIENTO, PKGCRCOMUN.FUNOBTENTASATRAMO(CVE_TASA_REFER,F_VENCIMIENTO,CVE_CALCULO)+SOBRETASA '+
            '             FROM CR_CREDITO CCR  ' +
            '             WHERE ID_cREDITO='+sCesion+
            '             AND ID_CREDITO NOT IN ( SELECT ID_cREDITO FROM CR_TRAMO_INTER WHERE F_REVISION=CCR.F_VENCIMIENTO ) '+
            '             AND CVE_CALCULO=''T3'' '+
            '             ) '+
            '         ) CTRAM';
    sSQL7:= sSQL7 + ') ';
// hegc
//    sSQL6:= sSQL6 + 'ORDER BY IDGRUPO ';


// AARJ (asteci) 23072010 para implementar la seccion de Garantias en el reporte
//    sSQL7:= sSQL7 + 'ORDER BY IDGRUPO ';

// AARJ (asteci) 23072010 Bloque para implementar la subconsulta de la seccion de Garantias en el reporte de detalle de credito
sSQL8:= ' UNION '+
            '(SELECT 8 AS IDGRUPO, '+ // CAMPO PARA AGRUPAR LAS GARANTIAS (1)
            '        0 AS ID_EMPRESA, '+
            '        GARANTIAS.FOLIO  AS ID_TRANSACCION, '+  // CAMPO: FOLIO EMPLEADO PARA GARANTIAS (2)
            '        0 AS ID_TRANSACCION_C, '+
            '        GARANTIAS.ID_CREDITO AS  ID_CREDITO, '+ // CAMPO: ID_CREDITO QUE TIENE GARANTIAS (3)
            '        0 AS PERCAPITAL, '+
            '        0 AS PLAZO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FHVTOCAP, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS TASA_CREDITO, '+
            '        0 AS IMP_CAPITAL, '+
            '        0 AS IMP_PAGADO, '+
            '        0 AS IMPVENCIDO, '+
            '        0 AS SDO_INSOLUTO, '+
            '        '''' AS SIT_CAPITAL, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_OPERACION, '+
            '        '''' CVE_OPERACION, '+
            '        GARANTIAS.DESCRIP AS DESC_L_OPERACION, '+ // CAMPO: DESCRIPCION EMPLEADO PARA GARANTIAS (4)
            '        0 AS IMP_CONCEPTO, '+
            '        0 AS NUM_PERIODO, '+
            '        0 AS PLAZO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS  F_VENCIMIENTO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PAGO, '+
            '        GARANTIAS.PROPORCION AS TASA_APLICADA, '+ // CAMPO:PROPORCION EMPLEADO PARA GARANTIAS (5)
            '        0 AS IMP_INTERES, '+
            '        0 AS IMP_IVA, '+
            '        0 AS IMP_PAGADO, '+
            '        0 AS IMPVENCIDO, '+
            '        '''' AS SIT_INTERES, '+
            '        0 AS NUM_PERIODO, '+
            '        '''' AS CVE_COMISION, '+
            '        GARANTIAS.TIPOGAR AS DESC_COMISION, '+ // CAMPO: TIPO GARANTIA EMPLEADO PARA GARANTIAS (6)
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_VENCIMIENTO , '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PAGO, '+
            '        0 AS PCT_COMISION, '+
            '        0 AS IMP_COMISION, '+
            '        0 AS IMP_IVA, '+
            '        0 AS IMP_PAGADO, '+
            '        0  AS IMPVENCIDO, '+
            '        '''' AS SIT_COMISION, '+
            '        0 AS FA_NUMPER, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FA_FVENCIM, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS FA_FPAGO, '+
            '        0 AS FA_IMPFINAN, '+
            '        0 AS FA_IMPPAGADO, '+
            '        0 AS FA_IMPVENCIDO, '+
            '        '''' AS FA_SITFINAN, '+
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_OPERACION_C, '+
            '        '''' CVE_OPERACION_C, '+
            '        '''' DESC_L_OPERACION_C, '+
            '        0 AS IMP_CONCEPTO_C '+
            '       ,'''' AS B_FINAN_ADIC '+
            '       ,'''' AS CVE_FINAN_ADIC '+
            '       ,TO_DATE(''01/01/2000'',''DD/MM/YYYY'') as F_REVISION, GARANTIAS.IMPORTE AS TASA_TRAMO ' + // CAMPO: IMPORTE PARA GARANTIAS (7)
            '   FROM '+
            '         ( SELECT ' +
			'             DIGA.ID_DISPOSICION AS ID_CREDITO, ' + //ID_CREDITO,
			'             DIGA.ID_REG_SOL_GAR AS FOLIO, ' + //ID_TRANSACCION
			'       	  '' '' AS REFERENCIA, ' + //NO SE EMPLEA SE PUEDE DEJAR EN BLANCO ESA COLUMNA EN EL REPORTE
			'             GAR.FACT_PROPOR_GAR AS PROPORCION, ' + //TASA_APLICADA,
			'             TGA.DESC_TIPO_GAR  AS TIPOGAR, ' + //DESC_COMISION,
			'             DIGA.IMP_GARANTIA 	AS IMPORTE, ' + // TASA_TRAMO : Revisar si al hacer uso de este IMP_COMISION no se afectan los totales
			'             REG.TX_COMENTARIO AS DESCRIP ' + // DESC_L_OPERACION,   TASA_TRAMO SE DEJO COMO 0
			'           FROM CR_GA_DIS_GAR DIGA  ' +
			'             LEFT JOIN CR_GA_REGISTRO REG ON DIGA.ID_REG_SOL_GAR = REG.ID_SOLICITUD   ' +
			'             LEFT JOIN CR_GA_GARANTIA GAR ON  REG.CVE_GARANTIA = GAR.CVE_GARANTIA  ' +
			'             LEFT JOIN CR_GA_TIPO_GAR TGA ON  GAR.CVE_TIPO_GAR  = TGA.CVE_TIPO_GAR  ' +
			'           WHERE 1 = 1  ' +
			'             AND SIT_REL_DIS_GAR = ''AC''   ' +
			'             AND  ID_DISPOSICION = ' + sCesion +
            '         ) GARANTIAS ';
    sSQL8:= sSQL8 + ') ';


    // AARJ (asteci) 23072010 para implementar la seccion de Garantias en el reporte
    sSQL8:= sSQL8 + 'ORDER BY IDGRUPO ';

    // AARJ (asteci) 23072010 para implementar la seccion de Garantias en el reporte
    //    sSQl:= sSQL1 + sSQL2 + sSQL3 + sSQL4 + sSQL5 + sSQL6+ sSQL7;
    sSQL:= sSQL1 + sSQL2 + sSQL3 + sSQL4 + sSQL5 + sSQL6+ sSQL7 + sSQL8;
    Result:= sSQL;

End;

Procedure  TQrDetCred.HabilitaGrupos;
Begin
  If qyConsultaIDGRUPO.AsInteger = 1 Then Begin
    QRGroup1.Enabled:= True;
    QRGroup2.Enabled:= True;

    QRGroup3.Enabled:= False;
    QRGroup4.Enabled:= False;
    QRGroup10.Enabled:= False;

    QRGroup5.Enabled:= False;
    QRGroup11.Enabled:= False;

    QRGroup6.Enabled:= False;
    QRGroup7.Enabled:= False;
    QRGroup9.Enabled:= False;
    QRFoot1.Enabled := True;
    QRFoot2.Enabled := False;
    QRFoot3.Enabled := False;
    QRFoot4.Enabled := False;
    QRFooterGarantias.Enabled := False;

    QRGroupFinan1.Enabled:= False;
    QRGroupFinan2.Enabled:= False;
    QRFootFinan.Enabled:= False;

    QRGroup8.Enabled:= False;
    QRGroup12.Enabled:= False;
    QRGroup13.Enabled:= False;
    QRFoot8.Enabled := False;

    // ASTECI.HEGC ANEXO DE TRAMOS
    QRGpoTramos.Enabled:=False;
    QRGroup14.Enabled:=false;

    // AARJ (asteci): 23072010 Para implementar las garantias en el reporte
    QRGroupEncGarantias.Enabled:=False;
    QRGroupDetGarantias.Enabled:=False;
    //QRFooterGarantias.Enabled := False;

  End
  Else If qyConsultaIDGRUPO.AsInteger = 2 Then Begin
    QRGroup1.Enabled:= False;
    QRGroup2.Enabled:= False;

    QRGroup3.Enabled:= True;
    QRGroup4.Enabled:= True;
    QRGroup10.Enabled:= True;

    QRGroup5.Enabled:= False;
    QRGroup11.Enabled:= False;

    QRGroup6.Enabled:= False;
    QRGroup7.Enabled:= False;
    QRGroup9.Enabled:= False;
    QRFoot1.Enabled := False;
    QRFoot2.Enabled := True;
    QRFoot3.Enabled := False;
    QRFoot4.Enabled := False;
    QRFooterGarantias.Enabled := False;

    QRGroupFinan1.Enabled:= False;
    QRGroupFinan2.Enabled:= False;
    QRFootFinan.Enabled:= False;

    QRGroup8.Enabled:= False;
    QRGroup12.Enabled:= False;
    QRGroup13.Enabled:= False;
    QRFoot8.Enabled := False;

    // ASTECI.HEGC ANEXO DE TRAMOS
    QRGpoTramos.Enabled:=False;
    QRGroup14.Enabled:=false;
    // AARJ (asteci): 23072010 Para implementar las garantias en el reporte
    QRGroupEncGarantias.Enabled:=False;
    QRGroupDetGarantias.Enabled:=False;
    //QRFooterGarantias.Enabled := False;

  End
  Else If qyConsultaIDGRUPO.AsInteger = 3 Then Begin
    QRGroup1.Enabled:= False;
    QRGroup2.Enabled:= False;

    QRGroup3.Enabled:= False;
    QRGroup4.Enabled:= False;
    QRGroup10.Enabled:= False;

    QRGroup5.Enabled:= False;
    QRGroup11.Enabled:= False;

    QRGroup6.Enabled:= False;
    QRGroup7.Enabled:= False;
    QRGroup9.Enabled:= False;
    QRFoot1.Enabled := False;
    QRFoot2.Enabled := False;
    QRFoot3.Enabled := False;
    QRFoot4.Enabled := False;
    QRFooterGarantias.Enabled := False;

    QRGroupFinan1.Enabled:= True;
    QRGroupFinan2.Enabled:= True;
    QRFootFinan.Enabled:= True;

    QRGroup8.Enabled:= False;
    QRGroup12.Enabled:= False;
    QRGroup13.Enabled:= False;
    QRFoot8.Enabled := False;

    // ASTECI.HEGC ANEXO DE TRAMOS
    QRGpoTramos.Enabled:=False;
    QRGroup14.Enabled:=false;
    // AARJ (asteci): 23072010 Para implementar las garantias en el reporte
    QRGroupEncGarantias.Enabled:=False;
    QRGroupDetGarantias.Enabled:=False;
    //QRFooterGarantias.Enabled := False;
  End
  Else If qyConsultaIDGRUPO.AsInteger = 4 Then Begin
    QRGroup1.Enabled:= False;
    QRGroup2.Enabled:= False;

    QRGroup3.Enabled:= False;
    QRGroup4.Enabled:= False;
    QRGroup10.Enabled:= False;

    QRGroup5.Enabled:= True;
    QRGroup11.Enabled:= True;

    QRGroup6.Enabled:= False;
    QRGroup7.Enabled:= False;
    QRGroup9.Enabled:= False;
    QRFoot1.Enabled := False;
    QRFoot2.Enabled := False;
    QRFoot3.Enabled := True;
    QRFoot4.Enabled := False;
    QRFooterGarantias.Enabled := False;

    QRGroupFinan1.Enabled:= False;
    QRGroupFinan2.Enabled:= False;
    QRFootFinan.Enabled:= False;

    QRGroup8.Enabled:= False;
    QRGroup12.Enabled:= False;
    QRGroup13.Enabled:= False;
    QRFoot8.Enabled := False;

    // ASTECI.HEGC ANEXO DE TRAMOS
    QRGpoTramos.Enabled:=False;
    QRGroup14.Enabled:=false;
    // AARJ (asteci): 23072010 Para implementar las garantias en el reporte
    QRGroupEncGarantias.Enabled:=False;
    QRGroupDetGarantias.Enabled:=False;
    //QRFooterGarantias.Enabled := False;

  End
  Else If qyConsultaIDGRUPO.AsInteger = 5 Then Begin
    QRGroup1.Enabled:= False;
    QRGroup2.Enabled:= False;

    QRGroup3.Enabled:= False;
    QRGroup4.Enabled:= False;
    QRGroup10.Enabled:= False;

    QRGroup5.Enabled:= False;
    QRGroup11.Enabled:= False;

    QRGroup6.Enabled:= True;
    QRGroup7.Enabled:= True;
    QRGroup9.Enabled:= True;
    QRFoot1.Enabled := False;
    QRFoot2.Enabled := False;
    QRFoot3.Enabled := False;
    QRFoot4.Enabled := True;
    QRFooterGarantias.Enabled := False;

    QRGroupFinan1.Enabled:= False;
    QRGroupFinan2.Enabled:= False;
    QRFootFinan.Enabled:= False;

    QRGroup8.Enabled:= False;
    QRGroup12.Enabled:= False;
    QRGroup13.Enabled:= False;
    QRFoot8.Enabled := False;

    // ASTECI.HEGC ANEXO DE TRAMOS
    QRGpoTramos.Enabled:=False;
    QRGroup14.Enabled:=false;
    // AARJ (asteci): 23072010 Para implementar las garantias en el reporte
    QRGroupEncGarantias.Enabled:=False;
    QRGroupDetGarantias.Enabled:=False;
    //QRFooterGarantias.Enabled := False;

  End
  Else If qyConsultaIDGRUPO.AsInteger = 6 Then Begin
    QRGroup1.Enabled:= False;
    QRGroup2.Enabled:= False;

    QRGroup3.Enabled:= False;
    QRGroup4.Enabled:= False;
    QRGroup10.Enabled:= False;

    QRGroup5.Enabled:= False;
    QRGroup11.Enabled:= False;

    QRGroup6.Enabled:= False;
    QRGroup7.Enabled:= False;
    QRGroup9.Enabled:= False;
    QRFoot1.Enabled := False;
    QRFoot2.Enabled := False;
    QRFoot3.Enabled := False;
    QRFoot4.Enabled := False;
    QRFooterGarantias.Enabled := False;

    QRGroupFinan1.Enabled:= False;
    QRGroupFinan2.Enabled:= False;
    QRFootFinan.Enabled:= False;

    QRGroup8.Enabled:= True;
    QRGroup12.Enabled:= True;
    QRGroup13.Enabled:= True;
    QRFoot8.Enabled := True;

    // ASTECI.HEGC ANEXO DE TRAMOS
    QRGpoTramos.Enabled:=False;
    QRGroup14.Enabled:=false;
    // AARJ (asteci): 23072010 Para implementar las garantias en el reporte
    QRGroupEncGarantias.Enabled:=False;
    QRGroupDetGarantias.Enabled:=False;
    //QRFooterGarantias.Enabled := False;
  End
  Else If qyConsultaIDGRUPO.AsInteger = 7 Then Begin
    QRGroup1.Enabled:= False;
    QRGroup2.Enabled:= False;

    QRGroup3.Enabled:= False;
    QRGroup4.Enabled:= False;
    QRGroup10.Enabled:= False;

    QRGroup5.Enabled:= False;
    QRGroup11.Enabled:= False;

    QRGroup6.Enabled:= False;
    QRGroup7.Enabled:= False;
    QRGroup9.Enabled:= False;
    QRFoot1.Enabled := False;
    QRFoot2.Enabled := False;
    QRFoot3.Enabled := False;
    QRFoot4.Enabled := False;
    QRFooterGarantias.Enabled := False;

    QRGroupFinan1.Enabled:= False;
    QRGroupFinan2.Enabled:= False;
    QRFootFinan.Enabled:= False;

    QRGroup8.Enabled:= False;
    QRGroup12.Enabled:= False;
    QRGroup13.Enabled:= False;
    QRFoot8.Enabled := False;

    QRGpoTramos.Enabled:=true;
    QRGroup14.Enabled:=True;
    // AARJ (asteci): 23072010 Para implementar las garantias en el reporte
    QRGroupEncGarantias.Enabled:=False;
    QRGroupDetGarantias.Enabled:=False;
    //QRFooterGarantias.Enabled := False;

  End

  // AARJ (asteci): 23072010 Para implementar las garantias en el reporte
  Else If qyConsultaIDGRUPO.AsInteger = 8 Then Begin
    QRGroup1.Enabled:= False;
    QRGroup2.Enabled:= False;

    QRGroup3.Enabled:= False;
    QRGroup4.Enabled:= False;
    QRGroup10.Enabled:= False;

    QRGroup5.Enabled:= False;
    QRGroup11.Enabled:= False;

    QRGroup6.Enabled:= False;
    QRGroup7.Enabled:= False;
    QRGroup9.Enabled:= False;
    QRFoot1.Enabled := False;
    QRFoot2.Enabled := False;
    QRFoot3.Enabled := False;
    QRFoot4.Enabled := False;
    //QRFooterGarantias.Enabled := True;

    QRGroupFinan1.Enabled:= False;
    QRGroupFinan2.Enabled:= False;
    QRFootFinan.Enabled:= False;

    QRGroup8.Enabled:= False;
    QRGroup12.Enabled:= False;
    QRGroup13.Enabled:= False;
    QRFoot8.Enabled := False;

    QRGpoTramos.Enabled:=False;
    QRGroup14.Enabled:=False;

    // AARJ (asteci): 23072010 Para implementar las garantias en el reporte
    QRGroupEncGarantias.Enabled:= bImpEncGar ;
    QRGroupDetGarantias.Enabled:= True;
    QRFooterGarantias.Enabled := (gItera = gnumRegistros);
  End;


End;

procedure TQrDetCred.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   Self.HabilitaGrupos;
   dSdoInsoluto := qyEncabezadoIMP_CREDITO.AsFloat;
   dImpVigente:= 0; dImpVigenteTot:= 0;
end;

procedure TQrDetCred.QRGroup3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   Self.HabilitaGrupos;
end;

procedure TQrDetCred.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
    bImpEncGar := True;
    gnumRegistros := qyConsulta.RecordCount;
    gItera := 0;

    QRGroup1.Enabled:= True;
    QRGroup2.Enabled:= True;
    QRGroup3.Enabled:= True;
    QRGroup4.Enabled:= True;
    QRGroup10.Enabled:= True;

    QRGroup5.Enabled:= True;
    QRGroup11.Enabled:= True;

    QRGroup6.Enabled:= True;
    QRGroup7.Enabled:= True;
    QRGroup9.Enabled:= True;
    QRFoot1.Enabled := True;
    QRFoot2.Enabled := True;
    QRFoot3.Enabled := True;
    QRFoot4.Enabled := True;
    QRFooterGarantias.Enabled := True;

    QRGroupFinan1.Enabled:= True;
    QRGroupFinan2.Enabled:= True;
    QRFootFinan.Enabled:= True;

    QRGroup8.Enabled:= True;
    QRGroup12.Enabled:= True;
    QRGroup13.Enabled:= True;

    // AARJ (asteci): 23072010 Para implementar las garantias en el reporte
    QRGroupEncGarantias.Enabled:=True;
    QRGroupDetGarantias.Enabled:=True;
    //QRFooterGarantias.Enabled := True;

end;

procedure TQrDetCred.QRBand2BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
     PrintBand := VLBFirmas;
end;

procedure TQrDetCred.QRGroupFinan1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   Self.HabilitaGrupos;
   dImpRefVig:= 0; dImpRefVigTot:= 0;
end;

procedure TQrDetCred.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If qyConsultaIDGRUPO.AsInteger = 1 Then Begin
      dSdoInsoluto := dSdoInsoluto - qyConsultaIMP_CAPITAL.AsFloat;
      QRSdoInsCap.Caption := FormatFloat('###,###,###,###,##0.00',dSdoInsoluto);

      If (qyConsultaSIT_CAPITAL.AsString = 'AC') Or (qyConsultaSIT_CAPITAL.AsString = 'PA') Then Begin
         dImpVigente:= qyConsultaIMP_CAPITAL.AsFloat - qyConsultaIMP_PAGADO.AsFloat;
         QRImpVigente.Caption := FormatFloat('###,###,###,###,##0.00',dImpVigente);
         dImpVigenteTot:= dImpVigenteTot + dImpVigente;
      End Else
         QRImpVigente.Caption := FormatFloat('###,###,###,###,##0.00',0);
   End;
   // AARJ 27 julio  -- seccion Capital
   gItera := gItera +1;

   if qyConsulta.FieldByName('F_PAGO').AsString ='' then vlfpago:=' '
   else  vlfpago:=FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('F_PAGO').AsDateTime);

   If sArchivo <>'' Then
   Begin
      Writeln(F,
                vlidcredito + #09 +
                vlidcontrato  + #09 +
                'CAPITAL' + #09 +
                qyConsulta.FieldByName('PERCAPITAL').AsString + #09 +
                qyConsulta.FieldByName('PLAZO').AsString + #09 +
                FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('FHVTOCAP').AsDateTime) + #09+
                FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('F_PROG_PAGO').AsDateTime) + #09 +
                vlfpago + #09+
                qyConsulta.FieldByName('TASA_CREDITO').AsString + #09 +
                FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('IMP_CAPITAL').AsFloat)+ #09+
                '0.00' + #09 +
                FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('IMP_PAGADO').AsFloat)+ #09+
                QRImpVigente.Caption + #09+
                FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('IMPVENCIDO').AsFloat)+ #09+
                qyConsulta.FieldByName('SIT_CAPITAL').AsString + #09 +
                ' ' + #09 +
                ' ' + #09 +
                '0.00' + #09
               );
    End;

end;

procedure TQrDetCred.QRBand5BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
var vTasaAplicad, vlSobretasa, vlTasaInt : Double;
begin
    vTasaAplicad:= qyEncabezadoTASA_APLICADA.AsFloat;
    vlSobretasa := qyEncabezadoSOBRETASA.AsFloat;
    vlTasaInt := vTasaAplicad - vlSobretasa;
    lbTASA_INTERES.Caption := FloatToStr(vlTasaInt);
end;

procedure TQrDetCred.QRGroup11BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   Self.HabilitaGrupos;
   dImpInter:=0; dImpInterTot:=0;
end;

procedure TQrDetCred.QRGroup6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   Self.HabilitaGrupos;
   dImpComis:=0; dImpComisTot:=0;
end;

procedure TQrDetCred.QRFoot1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRImpVigenteTot.Caption := FormatFloat('###,###,###,###,##0.00',dImpVigenteTot);
end;

procedure TQrDetCred.QRGroupFinan2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   If (qyConsultaFA_SITFINAN.AsString = 'AC') Or (qyConsultaFA_SITFINAN.AsString = 'PA') Then Begin
      dImpRefVig:= qyConsultaFA_IMPFINAN.AsFloat - qyConsultaFA_IMPPAGADO.AsFloat;
      QRImpRefVig.Caption := FormatFloat('###,###,###,###,##0.00',dImpRefVig);
      dImpRefVigTot:= dImpRefVigTot + dImpRefVig;
   End Else
      QRImpRefVig.Caption := FormatFloat('###,###,###,###,##0.00',0);

   // AARJ 27 julio -- seccion Refinanciamiento de Interes y Condonaciones
   gItera := gItera +1;

   if qyConsulta.FieldByName('FA_FPAGO').AsString ='' then vlfpago:=''
   else  vlfpago:=FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('FA_FPAGO').AsDateTime);


   If sArchivo <>'' Then
   Begin
      Writeln(F,
                vlidcredito + #09 +
                vlidcontrato  + #09 +      
                'FINAN. ADIC.' + #09 +
                qyConsulta.FieldByName('FA_NUMPER').AsString + #09 +
                '0' + #09 +
                FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('FA_FVENCIM').AsDateTime) + #09+
                ' ' + #09  +
                vlfpago + #09+
                '0.00' + #09+
                FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('FA_IMPFINAN').AsFloat)+ #09+
                '0.00' + #09 +
                FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('FA_IMPPAGADO').AsFloat)+ #09+
                QRImpRefVig.Caption+ #09+
                FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('FA_IMPVENCIDO').AsFloat)+ #09+
                qyConsulta.FieldByName('FA_SITFINAN').AsString + #09 +
                ' ' + #09 +
                ' ' + #09 +
                '0.00' + #09
               );
    End;
end;

procedure TQrDetCred.QRFootFinanBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRImpRefVigTot.Caption := FormatFloat('###,###,###,###,##0.00',dImpRefVigTot);
end;

procedure TQrDetCred.QRGroup5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If (qyConsultaSIT_INTERES.AsString = 'AC') Or (qyConsultaSIT_INTERES.AsString = 'PA') Then Begin
      dImpInter:= qyConsultaIMP_INTERES.AsFloat  + qyConsultaIMP_IVA.AsFloat
                - qyConsultaIMP_PAGADO_1.AsFloat;
      QRImpInter.Caption := FormatFloat('###,###,###,###,##0.00',dImpInter);
      dImpInterTot:= dImpInterTot + dImpInter;
   End Else
      QRImpInter.Caption := FormatFloat('###,###,###,###,##0.00',0);

   // AARJ 27 julio   -- seccion Interés y Tasas (Tramos)
   gItera := gItera +1;


   if qyConsulta.FieldByName('F_PAGO_1').AsString ='' then vlfpago:=''
   else  vlfpago:=FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('F_PAGO_1').AsDateTime);

   If sArchivo <>'' Then
   Begin
      Writeln(F,
                vlidcredito + #09 +
                vlidcontrato  + #09 +
                'INTERES' + #09 +
                qyConsulta.FieldByName('NUM_PERIODO').AsString + #09 +
                qyConsulta.FieldByName('PLAZO_1').AsString + #09 +
                FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('F_VENCIMIENTO').AsDateTime) + #09+
                FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('F_PROG_PAGO_1').AsDateTime) + #09+
                vlfpago + #09+
                qyConsulta.FieldByName('TASA_APLICADA').AsString + #09 +
                FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('IMP_INTERES').AsFloat)+ #09+
                FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('IMP_IVA').AsFloat)+ #09+
                FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('IMP_PAGADO_1').AsFloat)+ #09+
                QRImpInter.Caption + #09+
                FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('IMPVENCIDO_1').AsFloat)+ #09+
                qyConsulta.FieldByName('SIT_INTERES').AsString + #09 +
                ' ' + #09 +
                ' ' + #09 +
                '0.00' + #09
               );
    End;
end;

procedure TQrDetCred.QRFoot3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRImpInterTot.Caption := FormatFloat('###,###,###,###,##0.00',dImpInterTot);
end;

procedure TQrDetCred.QRGroup9BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If (qyConsultaSIT_COMISION.AsString = 'AC') Or (qyConsultaSIT_COMISION.AsString = 'PA') Then Begin
      dImpComis:= qyConsultaIMP_COMISION.AsFloat + qyConsultaIMP_IVA_1.AsFloat - qyConsultaIMP_PAGADO_2.AsFloat;
      QRImpComis.Caption := FormatFloat('###,###,###,###,##0.00',dImpComis);
      dImpComisTot:= dImpComisTot + dImpComis;
   End Else
      QRImpComis.Caption := FormatFloat('###,###,###,###,##0.00',0);

   // AARJ 27 julio -- seccion Conceptos
   gItera := gItera +1;

   if qyConsulta.FieldByName('F_PAGO_2').AsString ='' then vlfpago:=''
   else  vlfpago:=FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('F_PAGO_2').AsDateTime);


   If sArchivo <>'' Then
   Begin
      Writeln(F,
                vlidcredito + #09 +
                vlidcontrato  + #09 +      
                'CONCEPTOS' + #09 +
                qyConsulta.FieldByName('NUM_PERIODO_1').AsString + #09 +
                '0'+ #09 +
                FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('F_VENCIMIENTO_1').AsDateTime) + #09+
                FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('F_PROG_PAGO_2').AsDateTime) + #09+
                vlfpago + #09+
                '0.00'+ #09 +
                FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('IMP_COMISION').AsFloat)+ #09+
                FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('IMP_IVA_1').AsFloat)+ #09+
                FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('IMP_PAGADO_2').AsFloat)+ #09+
                QRImpComis.Caption+ #09+
                FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('IMPVENCIDO_2').AsFloat)+ #09+
                qyConsulta.FieldByName('SIT_COMISION').AsString + #09 +
                qyConsulta.FieldByName('CVE_COMISION').AsString + #09 +
                qyConsulta.FieldByName('DESC_COMISION').AsString + #09 +
                FormatFloat(',##0.00',qyConsulta.FieldByName('PCT_COMISION').AsFloat)+ #09
               );
    End;    

end;

procedure TQrDetCred.QRFoot4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRImpComisTot.Caption := FormatFloat('###,###,###,###,##0.00',dImpComisTot);
end;

procedure TQrDetCred.QRGroupEncGarantiasBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    if bImpEncGar then
      PrintBand:= True
    else begin
      PrintBand:= False;
    end;

    Self.HabilitaGrupos;
    bImpEncGar := False;
end;

procedure TQrDetCred.QRFooterGarantiasBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin


    if (gItera = (gnumRegistros)) then
       PrintBand := True
    else
       PrintBand := False;


end;

procedure TQrDetCred.QRGroup10BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   // AARJ 27 julio -- Seccion Amortizaciones no programadas y Refinanciamiento
   gItera := gItera +1;
end;

procedure TQrDetCred.QRGroupDetGarantiasBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   // AARJ 27 julio -- seccion Garantias
   gItera := gItera +1;
   Self.HabilitaGrupos;
end;

procedure TQrDetCred.SummaryBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   If qyConsulta.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

End.
