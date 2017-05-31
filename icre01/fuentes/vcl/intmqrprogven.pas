// Modificaciones : 23 10 2004    Importe de pago histórico
unit IntMQrProgVen;
          
interface         
                                                                                                                                                    
uses SysUtils, Windows, Messages, Classes, Graphics, Controls, unSQL2,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, Dialogs, IntGenCre, Psock, NMFtp, U_InterCustomStar,
  U_InterDigDoc;
Const
   coCRLF      = #13#10;
type                                                                                           
  TQrProgVen = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;               
    qyProgVen: TQuery;                        
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRShape3: TQRShape;
    QRLabel15: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    QRShape7: TQRShape;
    QRLabel22: TQRLabel;
    QRShape8: TQRShape;
    QRLabel24: TQRLabel;
    QRBand1: TQRBand;
    QRFooterMoneda: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape9: TQRShape;
    QRLabel6: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRFooterCesion: TQRBand;
    QRFooterProducto: TQRBand;
    QRFooterPromotor: TQRBand;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr34: TQRExpr;
    QRExpr35: TQRExpr;
    QRExpr36: TQRExpr;
    QRExpr37: TQRExpr;
    QRExpr48: TQRExpr;
    QRExpr49: TQRExpr;
    QRExpr50: TQRExpr;
    QRExpr51: TQRExpr;
    QRExpr62: TQRExpr;
    QRExpr63: TQRExpr;
    QRExpr64: TQRExpr;
    QRExpr65: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel19: TQRLabel;
    QRFooterCliente: TQRBand;
    QRLabel27: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel1: TQRLabel;
    QRShape21: TQRShape;
    QRExpr5: TQRExpr;
    QRShape19: TQRShape;
    QRLabel28: TQRLabel;
    QRDBText25: TQRDBText;
    QRBFootSector: TQRBand;
    QRLabel49: TQRLabel;
    QRExpr52: TQRExpr;
    QRLabel50: TQRLabel;
    QRDBText39: TQRDBText;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRGroupCont: TQRGroup;
    QRGroupPromotor1: TQRGroup;
    QRGroupMoneda: TQRGroup;
    QRGroupSector: TQRGroup;
    QRGroupProducto: TQRGroup;
    QRGroup1: TQRGroup;
    QRGroupNombre : TQRGroup;
    QRGroup2: TQRGroup;
    QRLabel30: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape20: TQRShape;
    QRLabel33: TQRLabel;
    QRShape22: TQRShape;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRDBText26: TQRDBText;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRDBText27: TQRDBText;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    qyProgVenDIASIMVE: TFloatField;
    qyProgVenID_CESION: TFloatField;
    qyProgVenID_DOCUMENTO: TStringField;
    qyProgVenID_CREDITO: TFloatField;
    qyProgVenACCESORIO: TStringField;
    qyProgVenNUM_PERIODO: TFloatField;
    qyProgVenPLAZO: TFloatField;
    qyProgVenF_INICIO: TDateTimeField;
    qyProgVenF_VENCIMIENTO: TDateTimeField;
    qyProgVenF_PROG_PAGO: TDateTimeField;
    qyProgVenF_PAGO: TDateTimeField;
    qyProgVenTASA_APLICADA: TFloatField;
    qyProgVenIMPORTE: TFloatField;
    qyProgVenIMP_IVA: TFloatField;
    qyProgVenSIT_CAPITAL: TStringField;
    qyProgVenIMP_BENEFICIO: TFloatField;
    qyProgVenIMP_TOTAL: TFloatField;
    qyProgVenNUM_PERIODO_PER: TStringField;
    qyProgVenCVE_MONEDA: TFloatField;
    qyProgVenDESC_MONEDA: TStringField;
    qyProgVenID_PROM_ADM: TFloatField;
    qyProgVenNOM_PROMOTOR_ADM: TStringField;
    qyProgVenID_PERS_ASOCIAD: TFloatField;
    qyProgVenNOM_PROMOTOR_ASO: TStringField;
    qyProgVenCVE_PRODUCTO_CRE: TStringField;
    qyProgVenDESC_L_PRODUCTO: TStringField;
    qyProgVenID_CREDITO_1: TFloatField;
    qyProgVenID_CONTRATO: TFloatField;
    qyProgVenNOMBRE: TStringField;
    qyProgVenID_EMISOR: TFloatField;
    qyProgVenCVE_EMISOR_NAFIN: TStringField;
    qyProgVenID_PROVEEDOR: TFloatField;
    qyProgVenNOMBRE_EMISOR: TStringField;
    qyProgVenCVE_TIPO_SECTOR: TStringField;
    qyProgVenCUENTA_BANCO: TStringField;
    qyProgVenNOM_PROVEEDOR: TStringField;
    qyProgVenID_PROV_NAFINSA: TFloatField;
    qyProgVenSDO_INSOLUTO: TFloatField;
    qyProgVenCVE_CALCULO: TStringField;
    qyProgVenNO_REFER: TFloatField;
    qyProgVenID_TITULAR: TFloatField;
    qyProgVenMORATORIOS: TFloatField;
    qyProgVenIMP_NOMINAL: TFloatField;
    qyProgVenSDO_VIG_TOTAL: TFloatField;
    qyProgVenIMP_CREDITO: TFloatField;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRCapital: TQRLabel;
    QRInteres: TQRLabel;
    QRRefin: TQRLabel;
    QRShape23: TQRShape;
    QRCapitalG: TQRLabel;
    QRInteresG: TQRLabel;
    QRRefinG: TQRLabel;
    QRCapitalT: TQRLabel;
    QRInteresT: TQRLabel;
    QRRefinT: TQRLabel;
    QRLabel39: TQRLabel;
    QRComsion: TQRLabel;
    QRComsionG: TQRLabel;
    QRComsionT: TQRLabel;
    QRShape24: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRPCapital: TQRLabel;
    QRPInteres: TQRLabel;
    QRPRefin: TQRLabel;
    QRPComsion: TQRLabel;
    QRPCapitalG: TQRLabel;
    QRPInteresG: TQRLabel;
    QRPRefinG: TQRLabel;
    QRPComsionG: TQRLabel;
    QRPCapitalT: TQRLabel;
    QRPInteresT: TQRLabel;
    QRPRefinT: TQRLabel;
    QRPComsionT: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel43: TQRLabel;
    QRDBText32: TQRDBText;
    QRExpr22: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRShape26: TQRShape;
    qyProgVenIMP_BINTER: TFloatField;
    qyProgVenIMP_FEGA: TFloatField;
    qyProgVenCVE_TIPO_CRED_BC: TFloatField;
    qyProgVenDESC_TIPO_CRED: TStringField;
    QRPCapitalM: TQRLabel;
    QRPInteresM: TQRLabel;
    QRPRefinM: TQRLabel;
    QRPComsionM: TQRLabel;
    QRCapitalM: TQRLabel;
    QRInteresM: TQRLabel;
    QRRefinM: TQRLabel;
    QRComsionM: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape25: TQRShape;
    QRPRefinCap: TQRLabel;
    QRPRefinCapG: TQRLabel;
    QRPRefinCapM: TQRLabel;
    QRPRefinCapT: TQRLabel;
    qyProgVenCUENTA_IMPAGADO_KAP: TStringField;
    qyProgVenCUENTA_IMPAGADO_INT: TStringField;
    qyProgVenCUENTA_VEN_KAP_EX: TStringField;
    qyProgVenCUENTA_VENCIDA_INT: TStringField;
    QRFooterCont: TQRBand;
    QRLabel45: TQRLabel;
    QRGroupCesion: TQRGroup;
    QRShape27: TQRShape;
    dbNomProveedor: TQRDBText;
    dbIdProveedor: TQRDBText;
    QRLProveedor: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel14: TQRLabel;
    dbMoneda: TQRDBText;
    QRLabel4: TQRLabel;
    QRShape18: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText14: TQRDBText;
    QRShape17: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape15: TQRShape;
    QRLabel2: TQRLabel;
    dbProducto: TQRDBText;
    QRDBText23: TQRDBText;
    lbCtaImp: TQRLabel;
    lbCtaVen: TQRLabel;
    qrCtaImpK: TQRDBText;
    qrCtaVenK: TQRDBText;
    qrCtaImpInt: TQRDBText;
    qrCtaVenInt: TQRDBText;
    QRShape33: TQRShape;
    QRLabel52: TQRLabel;
    QRDBText38: TQRDBText;
    QRShape16: TQRShape;
    QRDBText15: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel23: TQRLabel;
    QRShape12: TQRShape;
    qrlPromotor: TQRLabel;
    dbNom_Promotor: TQRDBText;
    dbNombre_Promotor: TQRDBText;
    QRNOMINAL: TQRLabel;
    QRBINTER: TQRLabel;
    QRIVA: TQRLabel;
    QRFEGA: TQRLabel;
    QRIMPORTE: TQRLabel;
    QRMORAS: TQRLabel;
    QRTOTAL: TQRLabel;
    QRTotCapital: TQRLabel;
    QRTotInteres: TQRLabel;
    QRTotRefin: TQRLabel;
    QRTotComsion: TQRLabel;
    QRTotCapitalG: TQRLabel;
    QRTotInteresG: TQRLabel;
    QRTotRefinG: TQRLabel;
    QRTotComsionG: TQRLabel;
    QRTotCapitalM: TQRLabel;
    QRTotInteresM: TQRLabel;
    QRTotRefinM: TQRLabel;
    QRTotComsionM: TQRLabel;
    QRTotCapitalT: TQRLabel;
    QRTotInteresT: TQRLabel;
    QRTotRefinT: TQRLabel;
    QRTotComsionT: TQRLabel;
    QRShape14: TQRShape;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    qyProgVenSALDO_CTA: TFloatField;
    chbChqras: TQRChildBand;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    qyProgVenSTATUSRECU: TStringField;
    QRDBText30: TQRDBText;
    QRShape31: TQRShape;
    QRLabel55: TQRLabel;
    QRDBText31: TQRDBText;
    qyProgVenIVA_MORATORIOS: TFloatField;
    QRExpr32: TQRExpr;
    QRExpr33: TQRExpr;
    QRExpr38: TQRExpr;
    QRExpr39: TQRExpr;
    QRExpr40: TQRExpr;
    QRExpr41: TQRExpr;
    QRIVAMORAS: TQRLabel;
    InterDigDoc1: TInterDigDoc;
    NMFTP1: TNMFTP;

    procedure qyProgVenCalcFields(DataSet: TDataSet);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;   var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterProductoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterCesionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterClienteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBFootSectorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterPromotorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupContBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterContBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure chbChqrasBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

    VLCapital : Double;
    VLInteres : Double;
    VLRefin  :  Double;
    VLComision : Double;
    VLCapitalM : Double;
    VLInteresM : Double;
    VLRefinM  :  Double;
    VLComisionM : Double;
    VLCapitalG : Double;
    VLInteresG : Double;
    VLRefinG  :  Double;
    VLComisionG : Double;
    VLCapitalT : Double;
    VLInteresT : Double;
    VLRefinT  :  Double;
    VLComisionT : Double;

    VLPCapital : Double;
    VLPInteres : Double;
    VLPRefin  :  Double;
    VLPComision : Double;
    VLPCapitalM : Double;
    VLPInteresM : Double;
    VLPRefinM  :  Double;
    VLPComisionM : Double;
    VLPCapitalG : Double;
    VLPInteresG : Double;
    VLPRefinG  :  Double;
    VLPComisionG : Double;
    VLPCapitalT : Double;
    VLPInteresT : Double;
    VLPRefinT  :  Double;
    VLPComisionT:  Double;
   //<easa4011 28.jun.2007

    VLTotCapital : Double;
    VLTotInteres : Double;
    VLTotRefin  :  Double;
    VLTotComision : Double;
    VLTotCapitalM : Double;
    VLTotInteresM : Double;
    VLTotRefinM  :  Double;
    VLTotComisionM : Double;
    VLTotCapitalG : Double;
    VLTotInteresG : Double;
    VLTotRefinG  :  Double;
    VLTotComisionG : Double;
    VLTotCapitalT : Double;
    VLTotInteresT : Double;
    VLTotRefinT  :  Double;
    VLTotComisionT : Double;

    VLTotNominal : Double;
    VLTotBinter : Double;
    VLTotIVA : Double;
    VLTotFEGA : Double;
    VLTotImporte : Double;
    VLTotMoras   : Double;
    VLTotIVAMoras   : Double;
    VLTotal   : Double;
    vgTipCambioDll: Double;
   //esas>/
    // RUCJ4248: Actualiza los datos de la temporal
//    function strUpdate : String;
  protected
    // RUCJ4248: Para guenerar el order de la sentencia SQL
    strOrderGlobal : String;
  public


    Function FormaQuery(sF_Vencimiento,sF_Programada,sProducto,sMoneda,
                        sAcreditado, sProveedor, sPromAsoc,sPromAdmon,
                        sCesion,sSituacion,sOrden,sTipoReporte,sFecRep,
                        sTipoProd,
                   //RLUMBRERAS LATBC 9/02/2011 (Se agrgegan variables para reporte de recuperados)
                     sTipRecu,
                  //-----------------------------------------------------------------------------
                        sEmpresa, sSucursal,sGpoProd, sOperDD, sTipCalInt,sSdoChqra:String;
                        bIncTipoSec,bPromAdmon,bShowChq:Boolean):String;
    end;

var
  QrProgVen: TQrProgVen;
  bGenArch: Boolean;
  sArchivo:String;
  vgFechaHoy : TDateTime;
  F: TextFile;
  B_ANTICIPADA,
  F_ANTICIPADA :String;
    Apli : TInterApli;
Procedure RepProgVen(  sF_Vencimiento,sF_Programada,sProducto,sMoneda,
                       sAcreditado, sProveedor, sPromAsoc,sPromAdmon,
                       sCesion,sSituacion,sOrden,sTipoReporte,sFecRep,
                       sTipoProd, sNbrArch
                   //RLUMBRERAS LATBC 9/02/2011 (Se agrgegan variables para reporte de recuperados)
                     ,sTipRecu
                  //-----------------------------------------------------------------------------
                       , sEmpresa, sSucursal,
                       sGpoProd, sOperDD, sTipCalInt, sSdoChqra:String;
                       bIncTipoSec,bPromAdmon,bShowChq:Boolean;
                       pAPli     : TInterApli;
//                       pPreview  : Boolean;
                       pB_ANTICIPADA : String;
                       pF_ANTICIPADA : String;
                       grOpcion  : TGenRepOption; //parametro para Digitalización JFOF
                       sArchivoDig : String
                       );
Implementation
{$R *.DFM}

function  NvlStr( pStr, pStrNvl : String ) : String;
begin
 if pStr <> '' then
   Result := pStr
  else
   Result := pStrNvl;
end;

Procedure RepProgVen(  sF_Vencimiento,sF_Programada,sProducto,sMoneda,
                       sAcreditado, sProveedor, sPromAsoc,sPromAdmon,
                       sCesion,sSituacion,sOrden,sTipoReporte,sFecRep,
                       sTipoProd, sNbrArch
                   //RLUMBRERAS LATBC 9/02/2011 (Se agrgegan variables para reporte de recuperados)
                     ,sTipRecu
                  //-----------------------------------------------------------------------------

                       , sEmpresa, sSucursal,
                       sGpoProd, sOperDD, sTipCalInt,sSdoChqra:String;
                       bIncTipoSec,bPromAdmon,bShowChq:Boolean;
                       pAPli     : TInterApli;
//                       pPreview  : Boolean;
                       pB_ANTICIPADA:String;
                       pF_ANTICIPADA: String;
                       grOpcion  : TGenRepOption; //parametro para Digitalización JFOF
                       sArchivoDig : String
                       );
Var
    QrProgVen   : TQrProgVen;
    VLTitulo    : String;
    Preview     : TIntQRPreview;
    strConsulta : String;
    sF_Calculo2 : String;

Begin
    VLTitulo := '';
    QrProgVen:=TQrProgVen.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrProgVen);
    Apli := pApli;
    Try
        F_ANTICIPADA := pF_ANTICIPADA;
        B_ANTICIPADA := pB_ANTICIPADA;
        vgFechaHoy := pAPli.DameFechaEmpresa;
        bGenArch:= False;
        sArchivo:= sNbrArch;
        QrProgVen.QRInterEncabezado1.Apli:=pApli;
        QrProgVen.VLCapital := 0;
        QrProgVen.VLInteres := 0;
        QrProgVen.VLRefin  := 0;
        QrProgVen.VLComision  := 0;

        QrProgVen.VLCapitalM := 0;
        QrProgVen.VLInteresM := 0;
        QrProgVen.VLRefinM  := 0;
        QrProgVen.VLComisionM  := 0;

        QrProgVen.VLCapitalG := 0;
        QrProgVen.VLInteresG := 0;
        QrProgVen.VLRefinG  := 0;
        QrProgVen.VLComisionG  := 0;

        QrProgVen.VLCapitalT := 0;
        QrProgVen.VLInteresT := 0;
        QrProgVen.VLRefinT  := 0;
        QrProgVen.VLComisionT  := 0;


        QrProgVen.VLPCapital := 0;
        QrProgVen.VLPInteres := 0;
        QrProgVen.VLPRefin  := 0;
        QrProgVen.VLPComision  := 0;

        QrProgVen.VLPCapitalM := 0;
        QrProgVen.VLPInteresM := 0;
        QrProgVen.VLPRefinM  := 0;
        QrProgVen.VLPComisionM  := 0;

        QrProgVen.VLPCapitalG := 0;
        QrProgVen.VLPInteresG := 0;
        QrProgVen.VLPRefinG  := 0;
        QrProgVen.VLPComisionG  := 0;

        QrProgVen.VLPCapitalT := 0;
        QrProgVen.VLPInteresT := 0;
        QrProgVen.VLPRefinT  := 0;
        QrProgVen.VLPComisionT  := 0;


        QrProgVen.VLTotCapital := 0;
        QrProgVen.VLTotInteres := 0;
        QrProgVen.VLTotRefin := 0;
        QrProgVen.VLTotComision := 0;
        QrProgVen.VLTotCapitalM := 0;
        QrProgVen.VLTotInteresM := 0;
        QrProgVen.VLTotRefinM := 0;
        QrProgVen.VLTotComisionM := 0;
        QrProgVen.VLTotCapitalG := 0;
        QrProgVen.VLTotInteresG := 0;
        QrProgVen.VLTotRefinG := 0;
        QrProgVen.VLTotComisionG := 0;
        QrProgVen.VLTotCapitalT := 0;
        QrProgVen.VLTotInteresT := 0;
        QrProgVen.VLTotRefinT := 0;
        QrProgVen.VLTotComisionT := 0;


        QrProgVen.vgTipCambioDll:= ObtTipoCambio(pAPli.DameFechaEmpresaDia('D000'), IntToStr ( C_DLLS ),
                                                   pAPli.DataBaseName, pAPli.SessionName);

        QrProgVen.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrProgVen.QRInterEncabezado1.NomReporte:='IntMQrProgVen';
        QrProgVen.QRInterEncabezado1.Titulo1:='Vencimientos al '+ sF_Vencimiento;

        //Pone titulo
//        If Trim(sF_Vencimiento)<>'' Then
//            VLTitulo := VLTitulo + ' Fecha de Vencimiento ' + sF_Vencimiento;
//            QrProgVen.QRInterEncabezado1.Titulo2:=
        If Trim(sF_Programada)<>'' Then
            VLTitulo := VLTitulo + ' Fecha de Programación ' + sF_Programada;
        If Trim(pB_ANTICIPADA)='V' THEN
             VLTitulo := VLTitulo + '  Fecha Vencimiento Anticipada:  ' + pF_ANTICIPADA;
//            QrProgVen.QRInterEncabezado1.Titulo2:=
        QrProgVen.lbCtaImp.Enabled := False;
        QrProgVen.qrCtaImpK.Enabled := False;
        QrProgVen.qrCtaImpInt.Enabled := False;
        QrProgVen.lbCtaVen.Enabled := False;
        QrProgVen.qrCtaVenK.Enabled := False;
        QrProgVen.qrCtaVenInt.Enabled := False;

        If (Trim(sProducto)<>'') Then
            VLTitulo := VLTitulo + ' Por Producto';
        If (Trim(sMoneda)<>'') Then
            VLTitulo := VLTitulo + ' Por Moneda';
        If (Trim(sAcreditado)<>'') Then
            VLTitulo := VLTitulo + ' Por Acreditado';
        If (Trim(sProveedor)<>'') Then
            VLTitulo := VLTitulo + ' Por Proveedor';
        If (Trim(sPromAsoc)<>'') Then
            VLTitulo := VLTitulo + ' Por Prom. Asoc.';
        If (Trim(sPromAdmon)<>'') Then
            VLTitulo := VLTitulo + ' Por Prom. Adm.';
        If (Trim(sCesion)<>'') Then
            VLTitulo := VLTitulo + ' Por Disposición';
        If (Trim(sSituacion)<>'') Then
        begin
             if Trim(sSituacion) = 'AC' then Begin
                VLTitulo := VLTitulo + ' No pagada';
                QrProgVen.lbCtaImp.Enabled := False;
                QrProgVen.qrCtaImpK.Enabled := False;
                QrProgVen.qrCtaImpInt.Enabled := False;
                QrProgVen.lbCtaVen.Enabled := False;
                QrProgVen.qrCtaVenK.Enabled := False;
                QrProgVen.qrCtaVenInt.Enabled := False;
             end
             else if Trim(sSituacion) = 'IM' then Begin
                VLTitulo := VLTitulo + ' Cartera Impagada';
                QrProgVen.lbCtaImp.Enabled := True;
                QrProgVen.qrCtaImpK.Enabled := True;
                QrProgVen.qrCtaImpInt.Enabled := True;
                QrProgVen.lbCtaVen.Enabled := False;
                QrProgVen.qrCtaVenK.Enabled := False;
                QrProgVen.qrCtaVenInt.Enabled := False;
             end
             else if Trim(sSituacion) = 'VE' then Begin
                VLTitulo := VLTitulo + ' Cartera Vencida Exigible';
                QrProgVen.lbCtaImp.Enabled := False;
                QrProgVen.qrCtaImpK.Enabled := False;
                QrProgVen.qrCtaImpInt.Enabled := False;
                QrProgVen.lbCtaVen.Enabled := True;
                QrProgVen.qrCtaVenK.Enabled := True;
                QrProgVen.qrCtaVenInt.Enabled := True;
             end
             else if Trim(sSituacion) = 'IV' then Begin
                VLTitulo := VLTitulo + ' Cartera Impagada más Vencida Exigible';
                QrProgVen.lbCtaImp.Enabled := True;
                QrProgVen.qrCtaImpK.Enabled := True;
                QrProgVen.qrCtaImpInt.Enabled := True;
                QrProgVen.lbCtaVen.Enabled := True;
                QrProgVen.qrCtaVenK.Enabled := True;
                QrProgVen.qrCtaVenInt.Enabled := True;
             end
             else Begin
               VLTitulo := VLTitulo + ' Por situacion de Periodo';
                QrProgVen.lbCtaImp.Enabled := False;
                QrProgVen.qrCtaImpK.Enabled := False;
                QrProgVen.qrCtaImpInt.Enabled := False;
                QrProgVen.lbCtaVen.Enabled := False;
                QrProgVen.qrCtaVenK.Enabled := False;
                QrProgVen.qrCtaVenInt.Enabled := False;
             end;
        end;

        If Trim(sTipoReporte)='O' Then
            VLTitulo := VLTitulo + ' (Operativo) ';
        If Trim(sTipoReporte)='C' Then
            VLTitulo := VLTitulo + ' (Al Cierre) ';
        If Trim(sSdoChqra) = 'V' then
            VLTitulo := VLTitulo + ' Con Saldo en Chqra.'
        else If Trim(sSdoChqra) = 'F' then
            VLTitulo := VLTitulo + ' Sin Saldo en Chqra.';


        QrProgVen.QRInterEncabezado1.Titulo2 := VLTitulo;

        if Not(bIncTipoSec) then
        begin
            QrProgVen.QRGroupSector.Enabled := False;
            QrProgVen.QRGroupSector.Expression := '';
            QrProgVen.QRBFootSector.Enabled := False;
        end;


        QrProgVen.qyProgVen.DatabaseName := pApli.DataBaseName;
        QrProgVen.qyProgVen.SessionName := pApli.SessionName;

        If (Trim(sPromAsoc)='')and(Trim(sPromAdmon)='') Then Begin
            QrProgVen.QRGroupPromotor1.Enabled:=False;
            QrProgVen.QRFooterPromotor.Enabled:=False;
            QrProgVen.QRGroupPromotor1.Expression:='';
        End
        Else If (Trim(sPromAsoc)<>'')  Then Begin
            QrProgVen.QRGroupPromotor1.Enabled:=True;
            QrProgVen.QRFooterPromotor.Enabled:=True;
            QrProgVen.QRGroupPromotor1.Expression:='qyProgVen.ID_PERS_ASOCIAD';
            QrProgVen.dbNom_Promotor.DataField:= 'ID_PERS_ASOCIAD';
            QrProgVen.dbNombre_Promotor.DataField:= 'NOM_PROMOTOR_ASO';
            QrProgVen.qrlPromotor.Caption:='Promotor Asociado';
        End Else If (Trim(sPromAdmon)<>'') Then Begin
            QrProgVen.QRGroupPromotor1.Enabled:=True;
            QrProgVen.QRFooterPromotor.Enabled:=True;
            QrProgVen.QRGroupPromotor1.Expression:='qyProgVen.ID_PROM_ADM';
            QrProgVen.dbNom_Promotor.DataField:= 'ID_PROM_ADM';
            QrProgVen.dbNombre_Promotor.DataField:= 'NOM_PROMOTOR_ADM';
            QrProgVen.qrlPromotor.Caption:='Promotor Admón';
        End;

        //start_easa4011 22.oct.2007  Req. Filtro Sdo Cheqera
        if bPromAdmon then
        begin
            QrProgVen.QRGroupPromotor1.Enabled:=True;
            QrProgVen.QRFooterPromotor.Enabled:=True;
            QrProgVen.QRGroupPromotor1.Expression:='qyProgVen.ID_PROM_ADM';
            QrProgVen.dbNom_Promotor.DataField:= 'ID_PROM_ADM';
            QrProgVen.dbNombre_Promotor.DataField:= 'NOM_PROMOTOR_ADM';
            QrProgVen.qrlPromotor.Caption:='Promotor Admón';
            sOrden := 'A';
        end;

        if bShowChq then
            QrProgVen.chbChqras.Enabled:=True
        else
            QrProgVen.chbChqras.Enabled:=False;
        //end_easa4011

        If (Trim(sOrden) = 'P') Then Begin
            QrProgVen.QRGroupPromotor1.Enabled:=True;
            QrProgVen.QRFooterPromotor.Enabled:=True;
            QrProgVen.QRGroupPromotor1.Expression:='qyProgVen.ID_PERS_ASOCIAD';
            QrProgVen.dbNom_Promotor.DataField:= 'ID_PERS_ASOCIAD';
            QrProgVen.dbNombre_Promotor.DataField:= 'NOM_PROMOTOR_ASO';
            QrProgVen.qrlPromotor.Caption:='Promotor Asociado'
        End Else If (Trim(sOrden) = 'A')  Then Begin
            QrProgVen.QRGroupPromotor1.Enabled:=True;
            QrProgVen.QRFooterPromotor.Enabled:=True;
            QrProgVen.QRGroupPromotor1.Expression:='qyProgVen.ID_PROM_ADM';
            QrProgVen.dbNom_Promotor.DataField:= 'ID_PROM_ADM';
            QrProgVen.dbNombre_Promotor.DataField:= 'NOM_PROMOTOR_ADM';
            QrProgVen.qrlPromotor.Caption:='Promotor Admón';
        END;


        // WMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM
        // WMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM
        // aqui vamos a mandar a ejecutar el SP que llena la tabla temporal
        // WMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM
        // WMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM
        // RUCJ4248
        // aqui se Actualiza los datos del saldo de la chequera       
        //QrProgVen.qyProgVen.Active:=False;
        //QrProgVen.qyProgVen.SQL.Text:= 'DELETE FROM RP_TMP_VENCIMIENTOS2';
        //QrProgVen.qyProgVen.ExecSQL;

        strConsulta := QrProgVen.FormaQuery(sF_Vencimiento,sF_Programada,sProducto,sMoneda,
                        sAcreditado, sProveedor, sPromAsoc,sPromAdmon,sCesion,sSituacion,sOrden,sTipoReporte,
                        sFecRep,sTipoProd,
                   //RLUMBRERAS LATBC 9/02/2011 (Se agrgegan variables para reporte de recuperados)
                     sTipRecu,
                  //-----------------------------------------------------------------------------
                        sEmpresa, sSucursal,sGpoProd, sOperDD, sTipCalInt,sSdoChqra,bIncTipoSec,bPromAdmon,bShowChq);

        // aqui se llena la tabla temporal
        QrProgVen.qyProgVen.Active:=False;
        QrProgVen.qyProgVen.SQL.Text:= strConsulta;
        QrProgVen.qyProgVen.SQL.SaveToFile('c:\progVto.txt');
        //QrProgVen.qyProgVen.ExecSQL;
        QrProgVen.qyProgVen.Active:=True;        

        // aqui se Actualiza los datos del saldo de la chequera
        //QrProgVen.qyProgVen.Active:=False;
        //QrProgVen.qyProgVen.SQL.Text:= QrProgVen.strUpdate;
        //QrProgVen.qyProgVen.ExecSQL;

        // Aqui se llena el query para el reporte
        //QrProgVen.qyProgVen.Active:=False;
        //QrProgVen.qyProgVen.SQL.Clear;
        //QrProgVen.qyProgVen.SQL.Text:= 'SELECT * FROM RP_TMP_VENCIMIENTOS ' + QrProgVen.strOrderGlobal;}
//******************************************************************************************
//******************************************************************************************
//JRG LatBC Incorporación de STATUSRACU al reporte
  {
    sF_Calculo2 := Trim(sF_Vencimiento);
    if Trim(sF_Vencimiento) = '' then
       sF_Calculo2 := Trim(sF_Programada);

QrProgVen.qyProgVen.SQL.Text:=
                    'SELECT * FROM '+ coCRLF +
                    '   (SELECT A.* ,'  + coCRLF +
                    '              COALESCE(' +
                    '                (SELECT  (CASE  WHEN COUNT(ID_ACREDITADO) = 0 THEN ''  '' ' + coCRLF +
                    '                     WHEN COUNT(ID_ACREDITADO) > 0 THEN ''En Recuperación'' ' + coCRLF +
                    '                     ELSE ''CE'' ' + coCRLF +
                    '                     END) AS Status_1  ' + coCRLF +
                    '                 FROM CR_ACRE_RE WHERE TO_DATE('''+sF_Calculo2+''',''DD/MM/YYYY'') >= F_ALTA_RECU ' + coCRLF +
//                    '                 AND (TO_DATE('''+sF_Calculo2+''',''DD/MM/YYYY'') <= F_BAJA_RECU OR F_BAJA_RECU IS NULL) ' + coCRLF +
                    '                 AND F_BAJA_RECU IS NULL ' + coCRLF +
                    '                 AND ID_ACREDITADO = A.ID_TITULAR),'+QuotedStr('  ') + ') AS StatusRecu ' + coCRLF +
                    '   FROM RP_TMP_VENCIMIENTOS2 A ' + QrProgVen.strOrderGlobal + ')';
if (Trim(sTipRecu)='0')     Then QrProgVen.qyProgVen.SQL.Text:= QrProgVen.qyProgVen.SQL.Text + '   WHERE StatusRecu = '+ QuotedStr('En Recuperación') + coCRLF;
if (Trim(sTipRecu)='1')     Then QrProgVen.qyProgVen.SQL.Text := QrProgVen.qyProgVen.SQL.Text + '   WHERE NOT StatusRecu = '+ QuotedStr('En Recuperación') + coCRLF;
//*********************************************************************************
        QrProgVen.qyProgVen.SQL.SaveToFile('c:\cuatro.txt');
        QrProgVen.qyProgVen.Active:=True;
    }

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrProgVen.QRInterEncabezado1.Titulo1+ #09 );
         Writeln(F, QrProgVen.QRInterEncabezado1.Titulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F,
             //Grupos
             'Promotor Asociado'+ #09#09 +
             'Moneda'+ #09#09 +
             'Sector'+ #09 +
             'Producto'+ #09#09 +
             'Tipo Crédito'+ #09#09 +           //EASA4011      28022005
             'Titular'+ #09#09 +
             'Núm. NAFINSA'+ #09 +
             'SubDivisión'+ #09 +
             'Chequera Admin'+ #09 +
             'No.Referencia'+ #09 +
             'Crédito'+ #09 +
             'Autorización'+ #09 +
             'Sdo Insoluto'+ #09 +
             'Sdo Vigente'+ #09 +
             'Imp Crédito'+ #09 +
             'Cálculo de Interés'+ #09 +
             'Prov.'+ #09#09 +
             //Registros
             'Concepto'+ #09 +
             'Periodo / Documento'+ #09 +
             'Plazo'+ #09+
             'Fecha Inicio' +#09 +
             'Fecha de Vnto.'+#09 +
             'Fecha Progra.' +#09 +
             'Días Im/Ve' + #09 +
             'Fecha Pago' + #09 +
             'Tasa Periodo' + #09+
             'Importe Nominal'+#09+
             'Importe' +#09 +
             'IVA' + #09+
             'Beneficio' +#09 +
             'Moratorios'+ #09 +
             'IVA de Moratorios' + #09+
             'Total' +  #09+
             'Situación al día'
       //RLUMBRERAS LATBC 9/02/2011 (Se agrgegan variables para reporte de recuperados)
              + #09 + 'Situacion del Acreditado'
      //-------------------------------------------------------------------------------
               );
      End;


//        If pPreview Then
//            QrProgVen.Preview
//        Else
//            QrProgVen.Print;

        If grOpcion = grPreview Then
         QrProgVen.Preview
      Else if grOpcion = grPrint Then
         QrProgVen.Print
      Else if grOpcion = grDigitaliza Then
      Begin
            QrProgVen.InterDigDoc1.RootDir  := obtValorGpoCve( 'PROGVE', 'ROOTDIR',   pApli);
            QrProgVen.InterDigDoc1.HostName := obtValorGpoCve( 'CONFRH', 'FTPSERVER', pApli);
            QrProgVen.InterDigDoc1.UserName := obtValorGpoCve( 'CONFRH', 'USERNAME',  pApli);
            QrProgVen.InterDigDoc1.Password := HexToStr( obtValorGpoCve( 'CONFRH', 'PASSWORD',  pApli) );
            QrProgVen.InterDigDoc1.SendTo   := ObtSendTo(sF_Vencimiento); //2012/01 prueba desarrollo
            QrProgVen.InterDigDoc1.FileName := sArchivoDig+'.pdf';
            QrProgVen.PrinterSettings.PrinterIndex := QrProgVen.InterDigDoc1.SetPrinter;
            QrProgVen.Print;
            QrProgVen.InterDigDoc1.Compress;
            QrProgVen.InterDigDoc1.SendFile;
            QrProgVen.PrinterSettings.PrinterIndex := QrProgVen.InterDigDoc1.RestorePrinter;

       End;

    Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrProgVen.free;
      If Assigned(Preview) Then Preview.Free;
    End;

End;

Function TQrProgVen.FormaQuery(  sF_Vencimiento,sF_Programada,sProducto,sMoneda,
                        sAcreditado, sProveedor, sPromAsoc,sPromAdmon,
                        sCesion,sSituacion,sOrden,sTipoReporte,sFecRep,sTipoProd,
                   //RLUMBRERAS LATBC 9/02/2011 (Se agrgegan variables para reporte de recuperados)
                     sTipRecu,
                  //-----------------------------------------------------------------------------
                        sEmpresa, sSucursal,sGpoProd, sOperDD, sTipCalInt,sSdoChqra:String;
                        bIncTipoSec,bPromAdmon,bShowChq:Boolean):String;
Var
    sSQL         : String;
    sSQL1        : String;
    sSQL2        : String;
    sSQL3        : String;
    sSQL4        : String;
    sSQL5        : String;
    sSQL6        : String;

    //sSQLWhere    : String;
    VlSituacion  : String;
    VLBFechaTras : Boolean;
    VLDiaHoy     : String;
    VLComparador : String;
    VLTipoRep    : String;
    sF_Calculo   : String;
    //RLUMBRERAS LATBC 9/02/2011 (Se agrgegan variables para reporte de recuperados)
    sStatus     : String;
Begin
    sStatus:='En Recuperación';
   //-------------------------------------------------------------------------------

    VLDiaHoy := 'D000';
    if sSituacion = 'VE' then
    begin
         VLBFechaTras := True;
         VlSituacion := 'IM';
    end
    else if sSituacion = 'IV' then
    begin
         VLBFechaTras := False;
         VlSituacion := 'IM';
    end
    else if sSituacion = 'AC' then
    begin
         VLBFechaTras := False;
         VlSituacion := 'AC';
    end
    else
    begin
         VLBFechaTras := False;
         VlSituacion := sSituacion;
    end;

//    if (((sSituacion = 'VE') or (sSituacion = 'IM') or (sSituacion = 'IV')) and  (sFecRep = 'A'))  then
//HERJA NUEVA LINEA PARA QUE TAMBIEN TOME LA SITUACION INDISTINTA
    if (((sSituacion = 'VE') or (sSituacion = 'IM') or (sSituacion = 'IV') or (sSituacion = '')) and  (sFecRep = 'A'))  then
       VLComparador := '<='
    else
       VLComparador := '=';
    //end if

    If Trim(sTipoReporte)='O' Then
        VLTipoRep := '';
    If Trim(sTipoReporte)='C' Then
        VLTipoRep := ' + 1 ';
    sF_Calculo := Trim(sF_Vencimiento);
    if Trim(sF_Vencimiento) = '' then
            sF_Calculo := Trim(sF_Programada);
    //end if

// WMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMW
// WMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMW
// RUCJ4248: SE GENERAN LOS DATOS EN LA TEMPORAL.
	sSQL := 'SELECT B.* FROM ( ';{ +                                                 
//		'INSERT /*+ APPEND */ INTO RP_TMP_VENCIMIENTOS2( ' +
		'INSERT INTO RP_TMP_VENCIMIENTOS2( ' +
		'DIASIMVE, ID_CESION, ID_DOCUMENTO, ORD_ACC, ID_CREDITO, ACCESORIO, NUM_PERIODO, ' +
		'PLAZO, F_INICIO, F_VENCIMIENTO, F_PROG_PAGO, F_PAGO, TASA_APLICADA, IMPORTE, ' +
		'IMP_IVA, SIT_CAPITAL, IMP_BINTER, IMP_FEGA, IMP_BENEFICIO, IMP_TOTAL, MORATORIOS, ' +
		'NUM_PERIODO_PER, CVE_MONEDA, DESC_MONEDA, ID_PROM_ADM, NOM_PROMOTOR_ADM, ID_PERS_ASOCIAD, ' +
		'NOM_PROMOTOR_ASO, CVE_PRODUCTO_CRE, DESC_L_PRODUCTO, CVE_TIPO_CRED_BC, DESC_TIPO_CRED, ' +
		'ID_CREDITO_1, ID_CONTRATO, NOMBRE, ID_EMISOR, CVE_EMISOR_NAFIN, ID_PROVEEDOR, NOMBRE_EMISOR, ' +
		'CVE_TIPO_SECTOR, CUENTA_BANCO, SALDO_CTA, NOM_PROVEEDOR, ID_PROV_NAFINSA, SDO_INSOLUTO, ' +
		'SDO_VIG_TOTAL, IMP_CREDITO, CVE_CALCULO, NO_REFER, ID_TITULAR, MORATORIOS_1, IMP_NOMINAL, ' +
		'CUENTA_VEN_KAP_EX, CUENTA_VENCIDA_INT, CUENTA_IMPAGADO_KAP, CUENTA_IMPAGADO_INT, IVA_MORATORIOS) ';
                }
    sSQL := sSQL + ' SELECT '+ coCRLF +
            '        NVL(ACCE.F_PAGO,(F_REF.F_REFERENCIA '+ VLTipoRep + ')) - ACCE.F_PROG_PAGO  diasImVe,'+ coCRLF +
            '        SUBDIV.ID_CESION        ,       CD.ID_DOCUMENTO, '+ coCRLF +
//            '        ACCE.*  '+ coCRLF +

            '        ACCE.ORD_ACC,'+ coCRLF +
            '        ACCE.ID_CREDITO,'+ coCRLF +
            '        ACCE.ACCESORIO,'+ coCRLF +
            '        ACCE.NUM_PERIODO,'+ coCRLF +
            '        ACCE.PLAZO,'+ coCRLF +
            '        ACCE.F_INICIO,'+ coCRLF +
            '        ACCE.F_VENCIMIENTO,'+ coCRLF +
            '        ACCE.F_PROG_PAGO,'+ coCRLF +
            '        ACCE.F_PAGO,'+ coCRLF +
            '        ACCE.TASA_APLICADA,'+ coCRLF +
            '        ACCE.IMPORTE,'+ coCRLF +
            '        ACCE.IMP_IVA,'+ coCRLF +
            '        ACCE.SIT_CAPITAL,'+ coCRLF +
            '        ACCE.IMP_BINTER,'+ coCRLF +
            '        ACCE.IMP_FEGA,'+ coCRLF +
            '        ACCE.IMP_BENEFICIO,'+ coCRLF +
            '        ACCE.IMP_TOTAL,'+ coCRLF +
            '        ACCE.MORATORIOS AS MORATORIOS_1,'+ coCRLF +


            '        NVL(CD.ID_DOCUMENTO, TO_CHAR(ACCE.NUM_PERIODO)) AS NUM_PERIODO_PER,'+ coCRLF +
            '        CTO.CVE_MONEDA          ,       M.DESC_MONEDA                   , '+ coCRLF +
            '        CC.ID_PROM_ADM          ,       PPR.NOMBRE NOM_PROMOTOR_ADM     , '+ coCRLF +
            '        CTO.ID_PERS_ASOCIAD     ,       PPRC.NOMBRE NOM_PROMOTOR_ASO    , '+ coCRLF +
            '        CPR.CVE_PRODUCTO_CRE    ,       CPR.DESC_L_PRODUCTO             , '+ coCRLF +
            '        CPR.CVE_TIPO_CRED_BC    ,       CTC.DESC_TIPO_CRED              , '+ coCRLF +
            '        CC.ID_CREDITO  AS ID_CREDITO_1        ,       CC.ID_CONTRATO                  , '+ coCRLF +
            '        DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PTIT.APELLIDO_PATERNO||'' ''||PTIT.APELLIDO_MATERNO||'' ''||PTIT.NOMBRE_PERSONA) NOMBRE, '+ coCRLF +
            '        SUBDIV.ID_EMISOR        ,       NVL(SUBDIV.CVE_EMISOR_NAFIN,0) CVE_EMISOR_NAFIN,'+ coCRLF +
            '        SUBDIV.ID_PROVEEDOR     ,       SUBDIV.NOMBRE_EMISOR    ,   PCE.CVE_TIPO_SECTOR, '+ coCRLF +
            '        SUBSTR(PKGCRPERIODO.STPObtChqCte(CTO.ID_TITULAR,NVL(SUBDIV.CVE_EMISOR_NAFIN,''0''),NVL(CC.ID_CREDITO,NULL),NVL(SUBDIV.TIPO_ACRED,''AC''),''AD'',''CR''),1,20) CUENTA_BANCO,'+ coCRLF +
//            '        PKGCRCUOTAS.ObtSdoCheq(SUBSTR(PKGCRPERIODO.STPObtChqCte(CTO.ID_TITULAR,NVL(SUBDIV.CVE_EMISOR_NAFIN,''0''),NVL(CC.ID_CREDITO,NULL),NVL(SUBDIV.TIPO_ACRED,''AC''),''AD'',''CR''),1,20), '+ SQLFecha( vgFechaHoy) +') SALDO_CTA,'+ coCRLF +

            '        Pkgdpvistaserv.SPTObtSaldo(SUBSTR(PKGCRPERIODO.STPObtChqCte(CTO.ID_TITULAR, NVL(SUBDIV.CVE_EMISOR_NAFIN,''0''),NVL(CC.ID_CREDITO,NULL),NVL(SUBDIV.TIPO_ACRED,''AC''),''AD'',''CR''),1,20),''D000'') AS SALDO_CTA,'+ coCRLF +
//            '        0 SALDO_CTA, '+ coCRLF +

            '        PP.NOMBRE NOM_PROVEEDOR ,       CP.ID_PROV_EXTERNO ID_PROV_NAFINSA      , '+ coCRLF +
            '        CC.SDO_INSOLUTO         ,       CC.SDO_VIG_TOTAL                        , '+ coCRLF +
            '        CC.IMP_CREDITO          ,       CC.CVE_CALCULO                          , '+ coCRLF +
            '        0 NO_REFER              ,       CTO.ID_TITULAR                          , '+ coCRLF +
            '        MORATORIOS              ,       NVL(CD.IMP_NOMINAL,0) AS IMP_NOMINAL    , '+ coCRLF +
//            '        NVL(TABVENCTA.CUENTA_VEN_KAP_EX,TABVENCTAICRE.CVE_CTA_CONT_CAVEEX)   CUENTA_VEN_KAP_EX    ,       NVL(TABVENCTA.CUENTA_VENCIDA_INT,TABVENCTAICRE.CVE_CTA_CONT_INVEEX)     CUENTA_VENCIDA_INT , '+  coCRLF +//easa4011    17072005
//            '        NVL(TABIMPCTA.CUENTA_IMPAGADO_KAP,TABIMPCTAICRE.CVE_CTA_CONT_CPIMVD)  CUENTA_IMPAGADO_KAP   ,       NVL(TABIMPCTA.CUENTA_IMPAGADO_INT,TABIMPCTAICRE.CVE_CTA_CONT_CPIMVD)  CUENTA_IMPAGADO_INT'+ coCRLF +

            '        TABVENCTAICRE.CVE_CTA_CONT_CAVEEX as CUENTA_VEN_KAP_EX    , TABVENCTAICRE.CVE_CTA_CONT_INVEEX as CUENTA_VENCIDA_INT , '+  coCRLF +//easa4011    17072005
            '        TABIMPCTAICRE.CVE_CTA_CONT_CPIMVD as CUENTA_IMPAGADO_KAP  , TABIMPCTAICRE.CVE_CTA_CONT_CPIMVD as CUENTA_IMPAGADO_INT'+ coCRLF +


            '        ,IVA_MORATORIOS ' + coCRLF + //IVA DE MORAS - HERJA 22/08/2011


            '        ,(SELECT (CASE WHEN COUNT(ID_ACREDITADO) = 0 THEN ''  '' ' + coCRLF +
            '                      WHEN COUNT(ID_ACREDITADO) > 0 THEN '''+sStatus+''' ' + coCRLF +
            '                 ELSE ''CE'' ' + coCRLF +
            '                 END) AS Status_1  ' + coCRLF +
            '           FROM CR_ACRE_RE WHERE TO_DATE('''+sF_Calculo+''',''DD/MM/YYYY'') >= F_ALTA_RECU ' + coCRLF +
            '            AND F_BAJA_RECU IS NULL ' + coCRLF +
            '            AND ID_ACREDITADO = CTO.ID_TITULAR ' + coCRLF +
            '   ) AS StatusRecu ' + coCRLF +

            //FROM DEL QUERY PRINCIPAL
            ' FROM ' + coCRLF;

            sSQL1 := sSQL;
            sSQL := '';

            //* * * * * * * * * * * * * * * * * CAPITAL * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
            sSQL:= sSQL +
            '      ( SELECT ''A'' ORD_ACC ,CCA.ID_CREDITO,''CAPITAL'' ACCESORIO,CCA.NUM_PERIODO,CCA.PLAZO,(CCA.F_VENCIMIENTO - CCA.PLAZO) F_INICIO, '+ coCRLF +
            '               CCA.F_VENCIMIENTO,CCA.F_PROG_PAGO,CCA.F_PAGO,' + coCRLF +
            '               PKGCRCOMUN.FUNOBTENTASA(''CP'',CCA.ID_CREDITO,CCA.NUM_PERIODO,CCA.F_VENCIMIENTO-1)TASA_APLICADA,' + coCRLF + //easa4011      29072005
//HERJA ENERO 2013
//            '               (CCA.IMP_CAPITAL - CCA.IMP_PAGADO_HIST ) IMPORTE,0 IMP_IVA,CCA.SIT_CAPITAL, '+ coCRLF +
//            '               (CCA.IMP_CAPITAL - CCA.IMP_PAGADO_HIST - CCA.IMP_CONCEPTO) IMP_BINTER, '+ coCRLF +
            '               (CCA.IMP_CAPITAL - CCA.IMP_PAGADO_HIST + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) ) IMPORTE,0 IMP_IVA,CCA.SIT_CAPITAL, '+ coCRLF +
            '               (CCA.IMP_CAPITAL - CCA.IMP_PAGADO_HIST - CCA.IMP_CONCEPTO + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0)) IMP_BINTER, '+ coCRLF +
//
            '               CCA.IMP_CONCEPTO IMP_FEGA, '+ coCRLF +
            '               (CCA.IMP_BENEF_BCO + CCA.IMP_BENEF_GOB) IMP_BENEFICIO, '+ coCRLF +
            '               (CCA.IMP_CAPITAL - CCA.IMP_BENEF_BCO - CCA.IMP_BENEF_GOB  + ' + coCRLF +
//HERJA ENERO 2013
//            '                CCA.MORATORIOS  + CCA.IVA_MORATORIOS - CCA.IMP_PAGADO_HIST ) IMP_TOTAL, CCA.MORATORIOS'+ coCRLF +
            '                CCA.MORATORIOS  + CCA.IVA_MORATORIOS - CCA.IMP_PAGADO_HIST + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) ) IMP_TOTAL, CCA.MORATORIOS'+ coCRLF +
//
            '               ,CCA.IVA_MORATORIOS'+ coCRLF + //IVA DE MORAS - HERJA 22/08/2011
            //<LOLS 23DIC2005 SE CAMBIA LA FORMA DE OBTENER EL IMPORTE DE GARANTIA FEGA>
            '        FROM  ( SELECT CCA.*, ' +
            '                       PKGCRCOMUN.FUNOBTENIMPGTIA( 3, ''CP'', ''IMPBRU'', CCA.ID_CREDITO, CCA.NUM_PERIODO, NULL, ' + SQLFecha( StrToDate( sF_Calculo ) ) + ', ''V'' ) IMP_CONCEPTO, ' +coCRLF +
            '                       NVL( PKGCRPERIODO.FUNOBTENMORA( 1,''V'',CCA.ID_CREDITO,CCA.NUM_PERIODO,NULL,NULL,'+ SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ',NULL), 0 ) AS MORATORIOS, '+ coCRLF +
            //IVA DE MORAS - HERJA 22/08/2011
            '                       NVL( PKGCRPERIODO.FUNOBTENMORA( 1,''F'',CCA.ID_CREDITO,CCA.NUM_PERIODO,NULL,NULL,'+ SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ',NULL), 0 ) AS IVA_MORATORIOS, '+ coCRLF +

            '                       NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( ''CP'', ''IMPBRU'',CCA.ID_CREDITO, CCA.NUM_PERIODO,NULL,' + SQLFecha(StrToDate(sF_Calculo )) + ',''V'' ), 0 ) AS IMP_PAGADO_HIST '+ coCRLF +
            '                FROM ( SELECT * FROM CR_CAPITAL CCA ' + coCRLF +
            '                       WHERE 1 = 1'+ coCRLF ;

            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + '                         AND   PKGCRACTUALIZA.STPOBTEMPRESA(CCA.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;

            If (Trim(sCesion)<>'') Then
                sSQL := sSQL + '                         AND   CCA.ID_CREDITO = '+ sCesion  +  coCRLF;
            //</LOLS>

            If Trim(sF_Vencimiento)<>'' Then
                sSQL := sSQL + '                         AND  CCA.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF
            Else If Trim(sF_Programada)<>'' Then
                sSQL := sSQL + '                         AND  CCA.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;
            //ends_if
            If (Trim(VlSituacion)='IM') Then
            begin
                sSQL := sSQL + '                         AND  ((CCA.F_PROG_PAGO < CCA.F_PAGO AND CCA.SIT_CAPITAL <> ''CA'''  + coCRLF +
                              '                          AND   CCA.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                              '                            OR   (CCA.SIT_CAPITAL = ''IM'' ))' + coCRLF ;
            end;

            sSQL := sSQL +
            '                      ) CCA' + coCRLF +

//            '              ) CCA, CR_CREDITO CR, CR_CONTRATO CCTO, CR_PRODUCTO CPR' + coCRLF +
//HERJA ENERO 2013
            '               ) CCA,' + coCRLF +
	    '               -- HERJA' + coCRLF +
            '               (' + coCRLF +
	    '		     SELECT CT.ID_CREDITO, CT.ID_PERIODO,' + coCRLF +
            '                       NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP' + coCRLF +
            '                  FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT' + coCRLF +
            '                 WHERE 1=1' + coCRLF +
            '                   AND CT.SIT_TRANSACCION = ''AC''' + coCRLF +
            '                   AND CT.ID_TRANS_CANCELA IS NULL' + coCRLF +
            '                   AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION' + coCRLF +
            '                   AND CT.CVE_OPERACION IN (''PGDMCP'')' + coCRLF +
            '                   AND CDT.CVE_CONCEPTO IN (''IMPBRU'')' + coCRLF ;
            If (Trim(sCesion)<>'') Then
                sSQL := sSQL +
            '                   AND CT.ID_CREDITO = '+ sCesion  +  coCRLF;
            sSQL := sSQL +
            '              GROUP BY CT.ID_CREDITO, CT.ID_PERIODO' + coCRLF +
	    '		   ) CA_HIST_PGDMCP, CR_CREDITO CR, CR_CONTRATO CCTO, CR_PRODUCTO CPR' + coCRLF +
	    '		   -- FIN HERJA ' + coCRLF +
//FIN HERJA
            '        WHERE 1 = 1' + coCRLF;

          If ((sSituacion = 'VE') or (sSituacion = 'IM'))  Then Begin
               If VLBFechaTras Then
                   sSQL:= sSQL + '   AND CR.F_TRASPASO_VENC IS NOT NULL '+  coCRLF
               Else
                   sSQL:= sSQL + '   AND CR.F_TRASPASO_VENC IS NULL '+  coCRLF ;
          End;

          If (Trim(sProducto)<>'') Then
              sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_CRE ='''+sProducto+''''+  coCRLF ;
          If (Trim(sMoneda)<>'') Then
              sSQL:= sSQL + '   AND CCTO.CVE_MONEDA ='+sMoneda +  coCRLF ;
          If (Trim(sPromAdmon)<>'') Then
              sSQL:= sSQL + '   AND CR.ID_PROM_ADM ='+ sPromAdmon +  coCRLF ;
          If (Trim(sCesion)<>'') Then
              sSQL:= sSQL + '   AND  CR.ID_CREDITO ='+ sCesion  +  coCRLF ;
          If ((Trim(VlSituacion)<>'') and (Trim(VlSituacion)<>'IM')) Then
              sSQL:= sSQL + '   AND CCA.SIT_CAPITAL ='''+ VlSituacion+''''+  coCRLF ;
          If (Trim(sEmpresa)<>'') Then
              sSQL:= sSQL + '   AND CPR.ID_EMPRESA ='+ Trim(sEmpresa) +coCRLF ;
          If (Trim(sGpoProd)<>'') Then
              sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd );

            sSQL := sSQL +
            '        AND CR.ID_CREDITO = CCA.ID_CREDITO' + coCRLF +
            '        AND CR.ID_CONTRATO = CCTO.ID_CONTRATO' + coCRLF +
            '        AND CR.FOL_CONTRATO = CCTO.FOL_CONTRATO' + coCRLF +
            // HERJA ENERO 2013
	    '  	     -- HERJA' + coCRLF +
	    '	     AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCA.ID_CREDITO' + coCRLF +
	    '	     AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCA.NUM_PERIODO' + coCRLF +
	    '	     -- FIN HERJA' + coCRLF +
            //
            '        AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE' + coCRLF;

            sSQL2 := sSQL;
            sSQL := '';

            //* * * * * * * * * * * * * * * * * * * * * * * * INTERES * * * * * * * * * * * * * * * * * * * *
      if B_ANTICIPADA = 'F' then
      begin
            sSQL:= sSQL +
            '      UNION '+ coCRLF + coCRLF +
            '        SELECT ''C'' ORD_ACC ,CCI.ID_CREDITO,''INTERES'' ACCESORIO,CCI.NUM_PERIODO,CCI.PLAZO,(CCI.F_VENCIMIENTO - CCI.PLAZO) F_INICIO, '+ coCRLF +
            '               CCI.F_VENCIMIENTO,CCI.F_PROG_PAGO,CCI.F_PAGO,CCI.TASA_APLICADA,'+ coCRLF +
            '               (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST) IMPORTE, '+ coCRLF +
//HERJA - CAMBIO POR IVA_PROYECTADO
//            '               CCI.IMP_IVA - CCI.IMP_IVA_PAG_HIST,CCI.SIT_INTERES, '+ coCRLF +
            '               CCI.IMP_IVA_PROY - CCI.IMP_IVA_PAG_HIST,CCI.SIT_INTERES, '+ coCRLF +
            '               (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST - NVL(CCI.IMP_CONCEPTO,0)) IMP_BINTER, '+ coCRLF +
            '               NVL(CCI.IMP_CONCEPTO,0) IMP_FEGA, '+ coCRLF +
            '               (CCI.IMP_BENEF_BCO + CCI.IMP_BENEF_GOB) IMP_BENEFICIO, '+ coCRLF +
//HERJA - CAMBIO POR IVA_PROYECTADO            
//            '               (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST + CCI.IMP_IVA + CCI.MORATORIOS + CCI.IVA_MORATORIOS + '+coCRLF +
            '               (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST + CCI.IMP_IVA_PROY + CCI.MORATORIOS '+coCRLF +
            '               - CCI.IMP_IVA_PAG_HIST - CCI.IMP_BENEF_BCO - CCI.IMP_BENEF_GOB) IMP_TOTAL,  '+  coCRLF +
            '               CCI. MORATORIOS '+ coCRLF +
            '               ,CCI.IVA_MORATORIOS'+ coCRLF + //IVA DE MORAS - HERJA 22/08/2011
            '        FROM ( SELECT CCI.*, '+ coCRLF +
            '                      PKGCRCOMUN.FUNOBTENIMPGTIA( 3, ''IN'', ''IMPBRU'', CCI.ID_CREDITO, CCI.NUM_PERIODO, NULL, ' + SQLFecha( StrToDate( sF_Calculo ) ) + ', ''V'' ) IMP_CONCEPTO, ' +coCRLF +
            '                      NVL( PKGCRPERIODO.FUNOBTENMORA( 4,''V'',CCI.ID_CREDITO,CCI.NUM_PERIODO,NULL,NULL,' + SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ',NULL), 0 ) AS MORATORIOS, '+ coCRLF + //EASA4011     26102005
           //IVA DE MORAS - HERJA 22/08/2011
            '                      NVL( PKGCRPERIODO.FUNOBTENMORA( 4,''F'',CCI.ID_CREDITO,CCI.NUM_PERIODO,NULL,NULL,' + SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ',NULL), 0 ) AS IVA_MORATORIOS, '+ coCRLF + //EASA4011     26102005

            '                      NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''IN'', ''IMPBRU'',CCI.ID_CREDITO,  CCI.NUM_PERIODO,NULL, ' + SQLFecha( StrToDate( sF_Calculo ) ) + ',''V'' ), 0 ) AS IMP_PAGADO_HIST,'+ coCRLF +
            '                      NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''IN'', ''IMPIVA'', CCI.ID_CREDITO,  CCI.NUM_PERIODO, NULL,  ' + SQLFecha( StrToDate( sF_Calculo ) ) + ',''V'' ), 0 ) AS IMP_IVA_PAG_HIST '+ coCRLF +coCRLF +
//RABA MAY 2015. REQ. FINAN_ADIC
//            '               FROM ( SELECT * FROM CR_INTERES CCI '+ coCRLF +
            '               FROM ( SELECT ID_CREDITO,          NUM_PERIODO,        B_COB_AUT,          PLAZO,          F_VENCIMIENTO, '+  coCRLF +
            '                             F_PROG_PAGO,         F_PAGO,             IMP_INTERES,        IMP_PAGADO,     IMP_INTERES_DIA, '+  coCRLF +
            '                             IMP_INTERES_PROY,    IMP_IVA,            IMP_IVA_PAGADO,     IMP_IVA_PROY,   IMP_BENEF_BCO, '+  coCRLF +
            '                             IMP_BENEF_GOB,       IMP_MORATORIO,      IMP_PAGADO_MORA,    IMP_COND_MORA,  TASA_APLICADA, '+  coCRLF +
            '                             --SIT_INTERES, '+  coCRLF +
            '                             CAST((CASE WHEN SIT_INTERES = ''LQ'' AND B_FINAN_ADIC = ''V'' THEN FUN_CR_SIT_INT(ID_CREDITO, NUM_PERIODO) '+  coCRLF +
            '                                         ELSE SIT_INTERES END) AS VARCHAR2(2)) SIT_INTERES, '+  coCRLF +
            '                             F_ALTA,              CVE_USU_ALTA,       F_MODIFICA,         CVE_USU_MODIFICA, '+  coCRLF +
            '                             IMP_IVA_MORA,        IMP_PAG_IVA_MORA,   IMP_IVA_COND_MOR,   B_FINAN_ADIC,   F_VALOR_PAGO, '+  coCRLF +
            '                             NUM_DIAS_VENCIDO,    SIT_INTERES_DET,    IMP_CONDONA,        CVE_FINAN_ADIC, TASA_APLICADA6 '+  coCRLF +
            '                      FROM CR_INTERES CCI '+ coCRLF +
//FIN RABA
            '                      WHERE 1 = 1'+ coCRLF ;
            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + '                         AND PKGCRACTUALIZA.STPOBTEMPRESA(CCI.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;

            If (Trim(sCesion)<>'') Then
                sSQL := sSQL + '                         AND   CCI.ID_CREDITO = '+ sCesion  +  coCRLF;

            If Trim(sF_Vencimiento)<>'' Then
                sSQL := sSQL + '                         AND CCI.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF
            Else If Trim(sF_Programada)<>'' Then
                sSQL := sSQL + '                         AND CCI.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;

            //ends_if
            If (Trim(VlSituacion)='IM') Then
            begin
                sSQL := sSQL + '                         AND ((CCI.F_PROG_PAGO < CCI.F_PAGO AND  CCI.SIT_INTERES <> ''CA''' +  coCRLF +
                               '                           AND CCI.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                               '                             OR  (CCI.SIT_INTERES = ''IM'' ))'+  coCRLF ;
            end;

            sSQL := sSQL + '                      ) CCI ' + coCRLF +
                           '               ) CCI, CR_CREDITO CR, CR_CONTRATO CCTO, CR_PRODUCTO CPR' + coCRLF +
            '        WHERE 1 = 1' + coCRLF;

          If ((sSituacion = 'VE') or (sSituacion = 'IM'))  Then Begin
               If VLBFechaTras Then
                   sSQL:= sSQL + '   AND CR.F_TRASPASO_VENC IS NOT NULL '+  coCRLF
               Else
                   sSQL:= sSQL + '   AND CR.F_TRASPASO_VENC IS NULL '+  coCRLF ;
          End;

          If (Trim(sProducto)<>'') Then
              sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_CRE ='''+sProducto+''''+  coCRLF ;
          If (Trim(sMoneda)<>'') Then
              sSQL:= sSQL + '   AND CCTO.CVE_MONEDA ='+sMoneda +  coCRLF ;
          If (Trim(sPromAdmon)<>'') Then
              sSQL:= sSQL + '   AND CR.ID_PROM_ADM ='+ sPromAdmon +  coCRLF ;
          If (Trim(sCesion)<>'') Then
              sSQL:= sSQL + '   AND  CR.ID_CREDITO ='+ sCesion  +  coCRLF ;
          If ((Trim(VlSituacion)<>'') and (Trim(VlSituacion)<>'IM')) Then
              sSQL:= sSQL + '   AND CCI.SIT_INTERES ='''+ VlSituacion+''''+  coCRLF ;
          If (Trim(sEmpresa)<>'') Then
              sSQL:= sSQL + '   AND CPR.ID_EMPRESA ='+ Trim(sEmpresa) +coCRLF ;
          If (Trim(sGpoProd)<>'') Then
              sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd );

            sSQL := sSQL +
            '        AND CR.ID_CREDITO = CCI.ID_CREDITO' + coCRLF +
            '        AND CR.ID_CONTRATO = CCTO.ID_CONTRATO' + coCRLF +
            '        AND CR.FOL_CONTRATO = CCTO.FOL_CONTRATO' + coCRLF +
            '        AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE' + coCRLF;
            sSQL3 := sSQL;
            sSQL := '';
     end
     else
     begin
       //Anticipados.
       sSQL:= sSQL +
            '      UNION '+ coCRLF + coCRLF +
            '        SELECT ''C'' ORD_ACC ,CCI.ID_CREDITO,''INTERES'' ACCESORIO,CCI.NUM_PERIODO,CCI.PLAZO,(CCI.F_VENCIMIENTO - CCI.PLAZO) F_INICIO, '+ coCRLF +
            '               CCI.F_VENCIMIENTO,CCI.F_PROG_PAGO,CCI.F_PAGO,CCI.TASA_APLICADA,'+ coCRLF +
            '               ( nvl( PkgCrPeriodo.obtadeudooper(CCI.ID_CREDITO,CCI.NUM_PERIODO,'+SQLFecha( vgFechaHoy)+' , '+
                                   SQLFecha( StrToDate( F_ANTICIPADA ) )+' , '+coCRLF +
                                   ' ''IN'' ),0) ) IMPORTE, '+ coCRLF +
//HERJA - CAMBIO POR IVA_PROYECTADO
//            '               CCI.IMP_IVA - CCI.IMP_IVA_PAG_HIST,CCI.SIT_INTERES, '+ coCRLF +
            '               CCI.IMP_IVA_PROY - CCI.IMP_IVA_PAG_HIST,CCI.SIT_INTERES, '+ coCRLF +
            '               ( nvl( PkgCrPeriodo.obtadeudooper(CCI.ID_CREDITO, CCI.NUM_PERIODO, '+SQLFecha( vgFechaHoy)+' , '+coCRLF +
                                   SQLFecha( StrToDate( F_ANTICIPADA ) )+' , '+coCRLF +
                                   ' ''IN'' ),0) ) IMP_BINTER , '+ coCRLF +
            '               NVL(CCI.IMP_CONCEPTO,0) IMP_FEGA, '+ coCRLF +
            '               (CCI.IMP_BENEF_BCO + CCI.IMP_BENEF_GOB) IMP_BENEFICIO, '+ coCRLF +
//HERJA - CAMBIO POR IVA_PROYECTADO
//            '               (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST + CCI.IMP_IVA + CCI.MORATORIOS '+coCRLF +
            '               (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST + CCI.IMP_IVA_PROY + CCI.MORATORIOS + CCI.IVA_MORATORIOS + '+coCRLF +
            '               - CCI.IMP_IVA_PAG_HIST - CCI.IMP_BENEF_BCO - CCI.IMP_BENEF_GOB) IMP_TOTAL,  '+  coCRLF +
            '               CCI. MORATORIOS '+ coCRLF +
            '               ,CCI.IVA_MORATORIOS'+ coCRLF + //IVA DE MORAS - HERJA 22/08/2011
            '        FROM ( SELECT CCI.*, '+ coCRLF +
            '                      PKGCRCOMUN.FUNOBTENIMPGTIA( 3, ''IN'', ''IMPBRU'', CCI.ID_CREDITO, CCI.NUM_PERIODO, NULL, ' + SQLFecha( StrToDate( F_ANTICIPADA ) ) + ', ''V'' ) IMP_CONCEPTO, ' +coCRLF +
            '                      NVL( PKGCRPERIODO.FUNOBTENMORA( 4,''V'',CCI.ID_CREDITO,CCI.NUM_PERIODO,NULL,NULL,' + SQLFecha( StrToDate( F_ANTICIPADA ) ) + VLTipoRep + ',NULL), 0 ) AS MORATORIOS, '+ coCRLF + //EASA4011     26102005

           //IVA DE MORAS - HERJA 22/08/2011
            '                      NVL( PKGCRPERIODO.FUNOBTENMORA( 4,''F'',CCI.ID_CREDITO,CCI.NUM_PERIODO,NULL,NULL,' + SQLFecha( StrToDate( F_ANTICIPADA ) ) + VLTipoRep + ',NULL), 0 ) AS IVA_MORATORIOS, '+ coCRLF +

            '                      NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''IN'', ''IMPBRU'',CCI.ID_CREDITO,  CCI.NUM_PERIODO,NULL, ' + SQLFecha( StrToDate( F_ANTICIPADA ) ) +',''V'' ), 0 ) AS IMP_PAGADO_HIST,'+ coCRLF +
            '                      NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''IN'', ''IMPIVA'', CCI.ID_CREDITO,  CCI.NUM_PERIODO, NULL, ' + SQLFecha( StrToDate( F_ANTICIPADA ) ) +',''V'' ), 0 ) AS IMP_IVA_PAG_HIST '+ coCRLF +
//RABA MAY 2015. REQ. FINAN_ADIC
//            '               FROM ( SELECT * FROM CR_INTERES CCI '+ coCRLF +
            '               FROM ( SELECT ID_CREDITO,          NUM_PERIODO,        B_COB_AUT,          PLAZO,          F_VENCIMIENTO, '+  coCRLF +
            '                             F_PROG_PAGO,         F_PAGO,             IMP_INTERES,        IMP_PAGADO,     IMP_INTERES_DIA, '+  coCRLF +
            '                             IMP_INTERES_PROY,    IMP_IVA,            IMP_IVA_PAGADO,     IMP_IVA_PROY,   IMP_BENEF_BCO, '+  coCRLF +
            '                             IMP_BENEF_GOB,       IMP_MORATORIO,      IMP_PAGADO_MORA,    IMP_COND_MORA,  TASA_APLICADA, '+  coCRLF +
            '                             --SIT_INTERES, '+  coCRLF +
            '                             CAST((CASE WHEN SIT_INTERES = ''LQ'' AND B_FINAN_ADIC = ''V'' THEN FUN_CR_SIT_INT(ID_CREDITO, NUM_PERIODO) '+  coCRLF +
            '                                         ELSE SIT_INTERES END) AS VARCHAR2(2)) SIT_INTERES, '+  coCRLF +
            '                             F_ALTA,              CVE_USU_ALTA,       F_MODIFICA,         CVE_USU_MODIFICA, '+  coCRLF +
            '                             IMP_IVA_MORA,        IMP_PAG_IVA_MORA,   IMP_IVA_COND_MOR,   B_FINAN_ADIC,   F_VALOR_PAGO, '+  coCRLF +
            '                             NUM_DIAS_VENCIDO,    SIT_INTERES_DET,    IMP_CONDONA,        CVE_FINAN_ADIC, TASA_APLICADA6 '+  coCRLF +
            '                      FROM CR_INTERES CCI '+ coCRLF +
//FIN RABA
            '                      WHERE 1 = 1'+ coCRLF ;

            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + '                         AND   PKGCRACTUALIZA.STPOBTEMPRESA(CCI.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;

            If (Trim(sCesion)<>'') Then
                sSQL := sSQL + '                         AND   CCI.ID_CREDITO = '+ sCesion  +  coCRLF;
            //</LOLS>

            If Trim(sF_Vencimiento)<>'' Then
                sSQL := sSQL + '                         AND CCI.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF
            Else If Trim(sF_Programada)<>'' Then
                sSQL := sSQL + '                         AND CCI.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;

            //ends_if
            If (Trim(VlSituacion)='IM') Then
            begin
                sSQL := sSQL + '                         AND ((CCI.F_PROG_PAGO < CCI.F_PAGO AND  CCI.SIT_INTERES <> ''CA''' +  coCRLF +
                               '                           AND CCI.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                               '                            OR (CCI.SIT_INTERES = ''IM'' ))'+  coCRLF ;
            end;

            sSQL := sSQL + '                      ) CCI ' + coCRLF +
                           '               ) CCI, CR_CREDITO CR, CR_CONTRATO CCTO, CR_PRODUCTO CPR' + coCRLF +
            '        WHERE 1 = 1' + coCRLF;

          If ((sSituacion = 'VE') or (sSituacion = 'IM'))  Then Begin
               If VLBFechaTras Then
                   sSQL:= sSQL + '   AND CR.F_TRASPASO_VENC IS NOT NULL '+  coCRLF
               Else
                   sSQL:= sSQL + '   AND CR.F_TRASPASO_VENC IS NULL '+  coCRLF ;
          End;

          If (Trim(sProducto)<>'') Then
              sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_CRE ='''+sProducto+''''+  coCRLF ;
          If (Trim(sMoneda)<>'') Then
              sSQL:= sSQL + '   AND CCTO.CVE_MONEDA ='+sMoneda +  coCRLF ;
          If (Trim(sPromAdmon)<>'') Then
              sSQL:= sSQL + '   AND CR.ID_PROM_ADM ='+ sPromAdmon +  coCRLF ;
          If (Trim(sCesion)<>'') Then
              sSQL:= sSQL + '   AND  CR.ID_CREDITO ='+ sCesion  +  coCRLF ;
          If ((Trim(VlSituacion)<>'') and (Trim(VlSituacion)<>'IM')) Then
              sSQL:= sSQL + '   AND CCI.SIT_INTERES ='''+ VlSituacion+''''+  coCRLF ;
          If (Trim(sEmpresa)<>'') Then
              sSQL:= sSQL + '   AND CPR.ID_EMPRESA ='+ Trim(sEmpresa) +coCRLF ;
          If (Trim(sGpoProd)<>'') Then
              sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd );

            sSQL := sSQL +
            '        AND CR.ID_CREDITO = CCI.ID_CREDITO' + coCRLF +
            '        AND CR.ID_CONTRATO = CCTO.ID_CONTRATO' + coCRLF +
            '        AND CR.FOL_CONTRATO = CCTO.FOL_CONTRATO' + coCRLF +
            '        AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE' + coCRLF;

            sSQL3 := sSQL;
            sSQL := '';
     end;

            // * * * * * * * * * * * * * * * * * * * * * * * * REFINANCIAMIRNTO * * * * * * * * * * * * * *

            sSQL:= sSQL +
            '      UNION '+ coCRLF + coCRLF +
            '        SELECT ''B'' ORD_ACC ,CFA.ID_CREDITO,''REFINANCIAMIENTO'' ACCESORIO,CFA.NUM_PERIODO,CFA.PLAZO,(CFA.F_VENCIMIENTO - CFA.PLAZO) F_INICIO, '+  coCRLF +
            '               CFA.F_VENCIMIENTO,CFA.F_PROG_PAGO,CFA.F_PAGO,0 TASA_APLICADA,'+ coCRLF +
            '               (CFA.IMP_FINAN_ADIC - CFA.IMP_PAGADO_HIST) IMPORTE,   0 IMP_IVA,CFA.SIT_FINAN_ADIC, '+ coCRLF +
            '               (CFA.IMP_FINAN_ADIC - CFA.IMP_PAGADO_HIST - NVL(CFA.IMP_CONCEPTO,0)) IMP_BINTER, '+ coCRLF +
            '                NVL(CFA.IMP_CONCEPTO,0) IMP_FEGA, '+ coCRLF +
            '                0 IMP_BENEFICIO, '+ coCRLF +
            '               (CFA.IMP_FINAN_ADIC + CFA.MORATORIOS + CFA.IVA_MORATORIOS - CFA.IMP_PAGADO_HIST ) IMP_TOTAL,  '+ coCRLF +
            '               CFA.MORATORIOS'+  coCRLF +
            '               ,CFA.IVA_MORATORIOS'+ coCRLF + //IVA DE MORAS - HERJA 22/08/2011
            '        FROM ( SELECT CFA.*, ' + coCRLF +
            '                      PKGCRCOMUN.FUNOBTENIMPGTIA( 3, ''FN'', ''IMPBRU'', CFA.ID_CREDITO, ' +coCRLF +
            '                      CFA.NUM_PERIODO, NULL, ' + SQLFecha( StrToDate( sF_Calculo ) ) + ', ''V'' ) IMP_CONCEPTO, ' +coCRLF +
            '                      NVL( PKGCRPERIODO.FUNOBTENMORA(3,''V'' ,CFA.ID_CREDITO, CFA.NUM_PERIODO , NULL, NULL,' + SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ',NULL), 0 ) AS MORATORIOS,'+ coCRLF +

           //IVA DE MORAS - HERJA 22/08/2011
            '                      NVL( PKGCRPERIODO.FUNOBTENMORA(3,''F'' ,CFA.ID_CREDITO, CFA.NUM_PERIODO , NULL, NULL,' + SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ',NULL), 0 ) AS IVA_MORATORIOS,'+ coCRLF +

            '                      NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''FN'', ''IMPBRU'',CFA.ID_CREDITO,CFA.NUM_PERIODO,NULL,' + SQLFecha(StrToDate(sF_Calculo )) +',''V'' ), 0 ) AS IMP_PAGADO_HIST '+ coCRLF +
            '               FROM ( SELECT * FROM CR_FINAN_ADIC  CFA ' + coCRLF +
            '                      WHERE 1 = 1'+ coCRLF ;

            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + '                         AND PKGCRACTUALIZA.STPOBTEMPRESA(CFA.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;

            If (Trim(sCesion)<>'') Then
                sSQL := sSQL + '                         AND CFA.ID_CREDITO = '+ sCesion  +  coCRLF;

            If Trim(sF_Vencimiento)<>'' Then
                sSQL := sSQL + '                         AND CFA.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF
            Else If Trim(sF_Programada)<>'' Then
                sSQL := sSQL + '                         AND  CFA.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;
            //ends_if
            //
            If (Trim(VlSituacion)='IM')Then
            begin
                sSQL := sSQL + '                         AND ((CFA.F_PROG_PAGO < CFA.F_PAGO AND ' + coCRLF +  '  CFA.SIT_FINAN_ADIC <> ''CA''' + coCRLF +
                               '                           AND CFA.F_PAGO > '+ SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                               '                           OR (CFA.SIT_FINAN_ADIC = ''IM'' ))'+  coCRLF ;
            end;
            sSQL := sSQL + '                      ) CFA ' + coCRLF +
                           '               ) CFA, CR_CREDITO CR, CR_CONTRATO CCTO, CR_PRODUCTO CPR' + coCRLF +
            '        WHERE 1 = 1' + coCRLF;

          If ((sSituacion = 'VE') or (sSituacion = 'IM'))  Then Begin
               If VLBFechaTras Then
                   sSQL:= sSQL + '   AND CR.F_TRASPASO_VENC IS NOT NULL '+  coCRLF
               Else
                   sSQL:= sSQL + '   AND CR.F_TRASPASO_VENC IS NULL '+  coCRLF ;
          End;

          If (Trim(sProducto)<>'') Then
              sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_CRE ='''+sProducto+''''+  coCRLF ;
          If (Trim(sMoneda)<>'') Then
              sSQL:= sSQL + '   AND CCTO.CVE_MONEDA ='+sMoneda +  coCRLF ;
          If (Trim(sPromAdmon)<>'') Then
              sSQL:= sSQL + '   AND CR.ID_PROM_ADM ='+ sPromAdmon +  coCRLF ;
          If (Trim(sCesion)<>'') Then
              sSQL:= sSQL + '   AND  CR.ID_CREDITO ='+ sCesion  +  coCRLF ;
          If ((Trim(VlSituacion)<>'') and (Trim(VlSituacion)<>'IM')) Then
              sSQL:= sSQL + '   AND CFA.SIT_FINAN_ADIC ='''+ VlSituacion+''''+  coCRLF ;
          If (Trim(sEmpresa)<>'') Then
              sSQL:= sSQL + '   AND CPR.ID_EMPRESA ='+ Trim(sEmpresa) +coCRLF ;
          If (Trim(sGpoProd)<>'') Then
              sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd ) +coCRLF ;

            sSQL := sSQL +
            '        AND CR.ID_CREDITO = CFA.ID_CREDITO' + coCRLF +
            '        AND CR.ID_CONTRATO = CCTO.ID_CONTRATO' + coCRLF +
            '        AND CR.FOL_CONTRATO = CCTO.FOL_CONTRATO' + coCRLF +
            '        AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE' + coCRLF;

            sSQL4 := sSQL;
            sSQL := '';
            //* * * * * * * * * * * * * *  COMISIONES * * * * * * * * * * * * * *
            sSQL:= sSQL +
            '      UNION '+ coCRLF + coCRLF +
            '        SELECT ''D'' ORD_ACC ,CCC.ID_CREDITO,CCC.DESC_COMISION,CCC.NUM_PERIODO,0 PLAZO,CCC.F_VENCIMIENTO F_INICIO, '+  coCRLF +
            '               CCC.F_VENCIMIENTO,CCC.F_PROG_PAGO,CCC.F_PAGO,CCC.TASA_APLICADA,'+ coCRLF +
            '               (CCC.IMP_COMISION - CCC.IMP_PAGADO_HIST) IMPORTE,'+ coCRLF +
            '               CCC.IMP_IVA-CCC.IMP_IVA_PAG_HIST,CCC.SIT_COMISION, '+ coCRLF +
            '               (CCC.IMP_COMISION - CCC.IMP_PAGADO_HIST - NVL(CCC.IMP_CONCEPTO,0)) IMP_BINTER, '+ coCRLF +
            '               NVL(CCC.IMP_CONCEPTO,0) IMP_FEGA, '+ coCRLF +
            '               0 IMP_BENEFICIO, '+ coCRLF +
            '               (CCC.IMP_COMISION  + CCC.IMP_IVA + CCC.MORATORIOS + CCC.IVA_MORATORIOS - CCC.IMP_PAGADO_HIST -CCC.IMP_IVA_PAG_HIST) IMP_TOTAL, '+ coCRLF +
            '               CCC.MORATORIOS'+  coCRLF +
            '               ,CCC.IVA_MORATORIOS'+ coCRLF + //IVA DE MORAS - HERJA 22/08/2011
            '        FROM ( SELECT CCC.*, '+ coCRLF +
            '                      PKGCRCOMUN.FUNOBTENIMPGTIA( 3, ''CN'', ''IMPBRU'', CCC.ID_CREDITO, ' +coCRLF +
            '                      CCC.NUM_PERIODO, CCC.CVE_COMISION, ' + SQLFecha( StrToDate( sF_Calculo ) ) + ', ''V'' ) IMP_CONCEPTO, ' + coCRLF +
            '                      CCCO.DESC_COMISION,'+ coCRLF +
            '                      NVL( PKGCRPERIODO.FUNOBTENMORA( 2 ,''V'' ,CCC.ID_CREDITO ,CCC.NUM_PERIODO , CCC.CVE_COMISION, NULL,TO_DATE('#39+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Calculo))+#39',''DD/MM/YYYY'')' + VLTipoRep + ','+' NULL), 0 ) AS MORATORIOS, '+ coCRLF +

           //IVA DE MORAS - HERJA 22/08/2011
            '                      NVL( PKGCRPERIODO.FUNOBTENMORA( 2 ,''F'' ,CCC.ID_CREDITO ,CCC.NUM_PERIODO , CCC.CVE_COMISION, NULL,TO_DATE('#39+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Calculo))+#39',''DD/MM/YYYY'')' + VLTipoRep + ','+' NULL), 0 ) AS IVA_MORATORIOS, '+ coCRLF +

            '                      NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''CN'', ''IMPBRU'', CCC.ID_CREDITO,  CCC.NUM_PERIODO, CCC.CVE_COMISION,' +  SQLFecha(StrToDate(sF_Calculo )) + ', ''V'' ), 0 ) AS IMP_PAGADO_HIST, '+ coCRLF +
            '                      NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''CN'', ''IMPIVA'', CCC.ID_CREDITO,  CCC.NUM_PERIODO, CCC.CVE_COMISION,' +  SQLFecha(StrToDate(sF_Calculo )) + ', ''V'' ), 0 ) AS IMP_IVA_PAG_HIST '+ coCRLF +
            '               FROM ( SELECT * FROM CR_COMISION CCC ' + coCRLF +
            '                      WHERE 1 = 1'+ coCRLF ;
            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + '                         AND PKGCRACTUALIZA.STPOBTEMPRESA(CCC.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;

            If (Trim(sCesion)<>'') Then
                sSQL := sSQL + '                         AND CCC.ID_CREDITO = '+ sCesion  +  coCRLF;
            //</LOLS>

            If Trim(sF_Vencimiento)<>'' Then
                sSQL := sSQL + '                         AND CCC.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF
            Else If Trim(sF_Programada)<>'' Then
               sSQL := sSQL + ' AND CCC.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF ;
            //ends_if
            If (Trim(VlSituacion)='IM')Then
            begin
                sSQL := sSQL + '                         AND ((CCC.F_PROG_PAGO < CCC.F_PAGO AND ' +  coCRLF + '  CCC.SIT_COMISION <> ''CA''' +  coCRLF +
                               '                           AND CCC.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                               '                            OR (CCC.SIT_COMISION = ''IM'' ))'+  coCRLF ;
            end;
            sSQL := sSQL + '                      ) CCC, CR_CAT_COMISION CCCO WHERE  CCCO.CVE_COMISION = CCC.CVE_COMISION  ' + coCRLF +
                           '               ) CCC, CR_CREDITO CR, CR_CONTRATO CCTO, CR_PRODUCTO CPR' + coCRLF +
            '        WHERE 1 = 1' + coCRLF;

          If ((sSituacion = 'VE') or (sSituacion = 'IM'))  Then Begin
               If VLBFechaTras Then
                   sSQL:= sSQL + '   AND CR.F_TRASPASO_VENC IS NOT NULL '+  coCRLF
               Else
                   sSQL:= sSQL + '   AND CR.F_TRASPASO_VENC IS NULL '+  coCRLF ;
          End;

          If (Trim(sProducto)<>'') Then
              sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_CRE ='''+sProducto+''''+  coCRLF ;
          If (Trim(sMoneda)<>'') Then
              sSQL:= sSQL + '   AND CCTO.CVE_MONEDA ='+sMoneda +  coCRLF ;
          If (Trim(sPromAdmon)<>'') Then
              sSQL:= sSQL + '   AND CR.ID_PROM_ADM ='+ sPromAdmon +  coCRLF ;
          If (Trim(sCesion)<>'') Then
              sSQL:= sSQL + '   AND  CR.ID_CREDITO ='+ sCesion  +  coCRLF ;
          If ((Trim(VlSituacion)<>'') and (Trim(VlSituacion)<>'IM')) Then
              sSQL:= sSQL + '   AND CCC.SIT_COMISION ='''+ VlSituacion+''''+  coCRLF ;
          If (Trim(sEmpresa)<>'') Then
              sSQL:= sSQL + '   AND CPR.ID_EMPRESA ='+ Trim(sEmpresa) +coCRLF ;
          If (Trim(sGpoProd)<>'') Then
              sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd );

            sSQL := sSQL +
            '        AND CR.ID_CREDITO = CCC.ID_CREDITO' + coCRLF +
            '        AND CR.ID_CONTRATO = CCTO.ID_CONTRATO' + coCRLF +
            '        AND CR.FOL_CONTRATO = CCTO.FOL_CONTRATO' + coCRLF +
            '        AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE' + coCRLF;

            sSQL5 := sSQL;
            sSQL := '';

            //* * * * * * * * * * * * * * FIN DE UNION * * * * * * * * * * * * * *
            //
            sSQL:= sSQL + '      ) ACCE, '+  coCRLF ;


            if Trim(sF_Vencimiento)<>'' then
               sSQL:= sSQL + '      ( SELECT ' + ' TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Vencimiento))+''',''DD/MM/YYYY'')' + ' AS F_REFERENCIA FROM DUAL) F_REF, '+  coCRLF
            else
               sSQL:= sSQL + '      (SELECT ' + ' TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Programada))+''',''DD/MM/YYYY'')' + ' AS F_REFERENCIA FROM DUAL) F_REF, '+  coCRLF ;
            //end if;

            sSQL:= sSQL +
            '       CR_CREDITO        CC, '+  coCRLF +
            //subdivision
            '       ( SELECT SUB.CVE_SUB_DIVISION CVE_EMISOR_NAFIN, SUB.NOMBRE_SUB_DIV NOMBRE_EMISOR,'+ coCRLF +
            '               ID_ACREDITADO ID_EMISOR, PROCAM.ID_CREDITO  ID_CESION,'+ coCRLF +
            '               0 ID_PROVEEDOR, ''F'' B_OPERADO_NAFIN, ''AP'' TIPO_ACRED, NULL CVE_FND_ENT_DES'+  coCRLF +
            '        FROM CR_SUBDIV_PROCAM SUB, CR_PROCAMPO PROCAM'+  coCRLF +
            '        WHERE PROCAM.CVE_SUB_DIVISION = SUB.CVE_SUB_DIVISION'+  coCRLF +
            '       UNION'+  coCRLF +
            '        SELECT CS.CVE_EMISOR_NAFIN, CE.NOMBRE_EMISOR ID_EMISOR, CE.ID_ACREDITADO , CS.ID_CESION,'+ coCRLF +
            '               CS.ID_PROVEEDOR, CS.B_OPERADO_NAFIN, ''AC'' TIPO_ACRED, CE.CVE_FND_ENT_DES'+  coCRLF +
            '        FROM CR_EMISOR CE, CR_CESION CS'+  coCRLF +
            '        WHERE CS.ID_EMISOR = CE.ID_ACREDITADO'+  coCRLF +
            '          AND CS.CVE_FND_ENT_DES = CE.CVE_FND_ENT_DES'+  coCRLF +
            '          AND CS.CVE_EMISOR_NAFIN = CE.CVE_EMISOR_EXT'+  coCRLF +
            '       )SUBDIV, '+  coCRLF +
            //
            '      ( SELECT * FROM CONTRATO WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CR_CREDITO))         CTO, '+  coCRLF +
            '      MONEDA            M, '+ coCRLF +
            '      PERSONA           PPR, '+ coCRLF +
            '      PERSONA           PPRC, '+ coCRLF +
            '      ( SELECT CCTO.*, CPRO.ID_EMPRESA FROM   CR_PRODUCTO CPRO, CR_CONTRATO CCTO WHERE  CPRO.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE) CCTO,'+ coCRLF +
            '     CR_PRODUCTO       CPR, '+ coCRLF +
            '     CR_TIP_CRED_BC    CTC, '+ coCRLF +
            '     PERSONA_FISICA    PTIT, '+ coCRLF +
            '     PERSONA           PCE, '+ coCRLF +
            '     PERSONA           PP, '+ coCRLF +
            '     CR_PROVEEDOR      CP, '+ coCRLF +
            '     CR_CESION         CS,   '+ coCRLF +

            C_QUERY_CTAS_IMP_ICRE + coCRLF +
            C_QUERY_CTAS_VEN_ICRE+ coCRLF +
            //C_QUERY_CTAS_IMP + coCRLF +
            //C_QUERY_CTAS_VEN+  coCRLF +
            '      CR_DOCUMENTO      CD '+  coCRLF +

            ' WHERE 1 = 1 '+ coCRLF ;

          If ((sSituacion = 'VE') or (sSituacion = 'IM'))  Then Begin
               If VLBFechaTras Then
                   sSQL:= sSQL + '   AND CC.F_TRASPASO_VENC IS NOT NULL '+  coCRLF
               Else
                   sSQL:= sSQL + '   AND CC.F_TRASPASO_VENC IS NULL '+  coCRLF ;
          End;

          If (Trim(sProducto)<>'') Then
              sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_CRE ='''+sProducto+''''+  coCRLF ;
          If (Trim(sMoneda)<>'') Then
              sSQL:= sSQL + '   AND CTO.CVE_MONEDA ='+sMoneda +  coCRLF ;
          If (Trim(sAcreditado)<>'') Then
              sSQL:= sSQL + '   AND CTO.ID_TITULAR ='+ sAcreditado +  coCRLF ;
          If (Trim(sProveedor)<>'') Then
              sSQL:= sSQL + '   AND SUBDIV.ID_PROVEEDOR ='+ sProveedor  +  coCRLF ;
          If (Trim(sPromAsoc)<>'') Then
              sSQL:= sSQL + '   AND CTO.ID_PERS_ASOCIAD ='+ sPromAsoc  +  coCRLF ;
          If (Trim(sPromAdmon)<>'') Then
              sSQL:= sSQL + '   AND CC.ID_PROM_ADM ='+ sPromAdmon +  coCRLF ;
          If (Trim(sCesion)<>'') Then
              sSQL:= sSQL + '   AND  CC.ID_CREDITO ='+ sCesion  +  coCRLF ;
          If ((Trim(VlSituacion)<>'') and (Trim(VlSituacion)<>'IM')) Then
              sSQL:= sSQL + '   AND ACCE.SIT_CAPITAL ='''+ VlSituacion+''''+  coCRLF ;
          If (Trim(sEmpresa)<>'') Then
              sSQL:= sSQL + '   AND CPR.ID_EMPRESA ='+ Trim(sEmpresa) +coCRLF ;

          If (Trim(sGpoProd)<>'') Then
              sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd );

          If (Trim(sOperDD)<>'') Then  Begin
             If (Trim(sOperDD) = 'F') Then
                sSQL:= sSQL + '   AND CC.ID_CREDITO NOT IN ( SELECT ID_CREDITO '+coCRLF;
             If (Trim(sOperDD) = 'V') Then
                sSQL:= sSQL + '   AND CC.ID_CREDITO IN ( SELECT ID_CREDITO '+coCRLF;

            sSQL:= sSQL + '                       FROM CR_FND_CREDITO '+coCRLF +
                          '                       WHERE CR_FND_CREDITO.PCT_REDESCONTADO > 0 ' +coCRLF+
                          '                         AND CR_FND_CREDITO.CVE_FND_ENT_DES IN ( ''0070025'') '+coCRLF +
                          '                         AND CR_FND_CREDITO.SIT_CREDITO IN (''AC'',''LQ'')) ' +coCRLF;
            end;
         If (Trim(sTipCalInt)<>'') Then
            sSQL:= sSQL + '   AND  CR_CESION.CVE_TIPO_INTERES ='+ SQLStr( sTipCalInt );


        // RUCJ4248: Siempre va a mostrar las chequeras que tengan o no saldo - sSdoChqra := '' -
        //<EASA4011 16.OCT.2007 Req. 2007 - 10 / 007
        If sSdoChqra = 'V' Then
            sSQL:= sSQL + '  AND PKGCRCUOTAS.ObtSdoCheq(SUBSTR(PKGCRPERIODO.STPObtChqCte(CTO.ID_TITULAR,NVL(SUBDIV.CVE_EMISOR_NAFIN,''0''),NVL(CC.ID_CREDITO,NULL),NVL(SUBDIV.TIPO_ACRED,''AC''),''AD'',''CR''),1,20), '+ SQLFecha( vgFechaHoy) +') > 0'+  coCRLF
        ELSE IF sSdoChqra = 'F' THEN
            sSQL:= sSQL + '  AND PKGCRCUOTAS.ObtSdoCheq(SUBSTR(PKGCRPERIODO.STPObtChqCte(CTO.ID_TITULAR,NVL(SUBDIV.CVE_EMISOR_NAFIN,''0''),NVL(CC.ID_CREDITO,NULL),NVL(SUBDIV.TIPO_ACRED,''AC''),''AD'',''CR''),1,20), '+ SQLFecha( vgFechaHoy) +') <=0'+  coCRLF;
        //EASA4011 >/


        sSQL:= sSQL +
            ' AND   CC.ID_CREDITO          = ACCE.ID_CREDITO'+ coCRLF +
            ' AND   CCTO.ID_CONTRATO       = CC.ID_CONTRATO '+ coCRLF +
            ' AND   CCTO.FOL_CONTRATO      = CC.FOL_CONTRATO ' + coCRLF +
            ' AND   CTO.ID_CONTRATO        = CC.ID_CONTRATO '+ coCRLF +
            ' AND   M.CVE_MONEDA           = CTO.CVE_MONEDA '+ coCRLF +
            ' AND   PPR.ID_PERSONA         = CC.ID_PROM_ADM '+ coCRLF +
            ' AND   PPRC.ID_PERSONA        = CTO.ID_PERS_ASOCIAD '+ coCRLF +
            ' AND   CPR.CVE_PRODUCTO_CRE   = CCTO.CVE_PRODUCTO_CRE '+ coCRLF +
            ' AND   CTC.CVE_TIPO_CRED_BC(+)= CPR.CVE_TIPO_CRED_BC '+  coCRLF +
            ' AND   PTIT.ID_PERSONA     (+)= CTO.ID_TITULAR '+ coCRLF +
            ' AND   PCE.ID_PERSONA      (+)= CTO.ID_TITULAR '+ coCRLF +
            ' AND   SUBDIV.ID_CESION    (+)= CC.ID_CREDITO '+ coCRLF +
            ' AND   PP.ID_PERSONA       (+)= SUBDIV.ID_PROVEEDOR '+ coCRLF +
            ' AND   CP.ID_ACREDITADO    (+)= SUBDIV.ID_PROVEEDOR '+ coCRLF +
            ' AND   CP.CVE_FND_ENT_DES  (+)= SUBDIV.CVE_FND_ENT_DES '+ coCRLF + //EASA4011      08.AGO.2007
            ' AND   CD.ID_CESION        (+)= ACCE.ID_CREDITO '+ coCRLF +
            ' AND   CD.NUM_PERIODO_DOC  (+)= ACCE.NUM_PERIODO '+ coCRLF +
            ' AND   CS.ID_CESION        (+)= CC.ID_CREDITO '+ coCRLF +

            ' AND TABVENCTAICRE.ID_EMPRESA (+)= CCTO.ID_EMPRESA'+ coCRLF +
            ' AND TABVENCTAICRE.CVE_PRODUCTO_CRE (+)= CCTO.CVE_PRODUCTO_CRE'+ coCRLF +
            ' AND TABVENCTAICRE.CVE_MONEDA (+)= CCTO.CVE_MONEDA'+ coCRLF +
            ' AND TABIMPCTAICRE.ID_EMPRESA (+)= CCTO.ID_EMPRESA'+ coCRLF +
            ' AND TABIMPCTAICRE.CVE_PRODUCTO_CRE (+)= CCTO.CVE_PRODUCTO_CRE'+ coCRLF +
            ' AND TABIMPCTAICRE.CVE_MONEDA (+)= CCTO.CVE_MONEDA';//+ coCRLF +

           // ' AND   TABVENCTA.CVE_PRODUCTO_CRE (+)= CPR.CVE_PRODUCTO_CRE ' + coCRLF +
           // ' AND   TABIMPCTA.CVE_PRODUCTO_CRE (+)= CPR.CVE_PRODUCTO_CRE ' + coCRLF ;


            sSQL:= sSQL + ' ) B '+  coCRLF;

    if (Trim(sTipRecu)='0')  Then sSQL := sSQL + '   WHERE B.STATUSRECU = '+ SQLStr(sStatus) + coCRLF;
    if (Trim(sTipRecu)='1')  Then sSQL := sSQL + '   WHERE NOT B.STATUSRECU = '+ SQLStr(sStatus) + coCRLF;

                           
    sSQL6:= sSQL6 +' ORDER BY B.DESC_MONEDA, B.DESC_L_PRODUCTO, '+  coCRLF ;

    if bIncTipoSec then
        sSQL6:= sSQL6 + ' B.CVE_TIPO_SECTOR, '+  coCRLF ;

    If Trim(sOrden)='C' Then
        sSQL6:= sSQL6 + ' B.NOMBRE, B.ID_CREDITO '+  coCRLF
    //<EASA4011 22.JUN.2007     Req.
    else If Trim(sOrden)='P' Then
        sSQL6:= sSQL6 + ' B.ID_PERS_ASOCIAD, B.NOMBRE, B.ID_CREDITO '+  coCRLF
    else If Trim(sOrden)='A' Then
        sSQL6:= sSQL6 + ' B.ID_PROM_ADM, B.NOMBRE, B.ID_CREDITO'+  coCRLF
    //EASA4011 >/
    Else
        sSQL6:= sSQL6 + ' B.ID_CREDITO, B.NOMBRE'+  coCRLF;

    sSQL6 := sSQL6 + ',B.ORD_ACC, B.NUM_PERIODO';
    strOrderGlobal := sSQL6;
//    sSQL6 := sSQL;

    Result:= sSQL1 + sSQL2 + sSQL3 + sSQL4 + sSQL5 + sSQL + strOrderGlobal;
End;

procedure TQrProgVen.qyProgVenCalcFields(DataSet: TDataSet);
begin
    If Trim(qyProgVenID_CESION.AsString)='' Then Begin
        QRLProveedor.Enabled:=False;
        dbIdProveedor.Enabled:=False;
        dbNomProveedor.Enabled:=False;
    End Else Begin
        QRLProveedor.Enabled:=True;
        dbIdProveedor.Enabled:=True;
        dbNomProveedor.Enabled:=True;
    End;
end;

procedure TQrProgVen.QuickRepBeforePrint(Sender: TCustomQuickRep;  var PrintReport: Boolean);
begin
        VLCapital := 0;
        VLInteres := 0;
        VLRefin  := 0;
        VLComision  := 0;

        VLCapitalM := 0;
        VLInteresM := 0;
        VLRefinM  := 0;
        VLComisionM  := 0;

        VLCapitalG := 0;
        VLInteresG := 0;
        VLRefinG  := 0;
        VLComisionG  := 0;

        VLCapitalT := 0;
        VLInteresT := 0;
        VLRefinT  := 0;
        VLComisionT  := 0;

        VLPCapital := 0;
        VLPInteres := 0;
        VLPRefin  := 0;
        VLPComision  := 0;

        VLPCapitalM := 0;
        VLPInteresM := 0;
        VLPRefinM  := 0;
        VLPComisionM  := 0;

        VLPCapitalG := 0;
        VLPInteresG := 0;
        VLPRefinG  := 0;
        VLPComisionG  := 0;

        VLPCapitalT := 0;
        VLPInteresT := 0;
        VLPRefinT  := 0;
        VLPComisionT  := 0;

end;

procedure TQrProgVen.QRBand1BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
Var
   sFInicio, sFVenc, sFProgPago, sFPago: String;
   vlTipCambio : Double;
begin
    vlTipCambio:= 1;
    if qyProgVenCVE_MONEDA.AsInteger = C_DLLS then
       vlTipCambio:= vgTipCambioDll;
   //<easa4011 28.jun.2007
    VLTotNominal := VLTotNominal + qyProgVenIMP_NOMINAL.AsFloat * (vlTipCambio);
    VLTotBinter  := VLTotBinter + qyProgVenIMP_BINTER.AsFloat * (vlTipCambio);
    VLTotIVA     := VLTotIVA + qyProgVenIMP_IVA.AsFloat * (vlTipCambio);
    VLTotFEGA     := VLTotFEGA + qyProgVenIMP_FEGA.AsFloat * (vlTipCambio);
    VLTotImporte := VLTotImporte + qyProgVenIMPORTE.AsFloat * (vlTipCambio);
    VLTotMoras   := VLTotMoras + qyProgVenMORATORIOS.AsFloat * (vlTipCambio);
    VLTotIVAMoras   := VLTotIVAMoras + qyProgVenIVA_MORATORIOS.AsFloat * (vlTipCambio);
    VLTotal      := VLTotal + qyProgVenIMP_TOTAL.AsFloat * (vlTipCambio);
   //esas>/

     if qyProgVenACCESORIO.AsString = 'CAPITAL' then
     begin
       VLCapital := VLCapital + qyProgVenIMPORTE.AsFloat;
       VLCapitalM := VLCapitalM + qyProgVenMORATORIOS.AsFloat;
       VLCapitalG := VLCapitalG + qyProgVenIMP_FEGA.AsFloat;
       VLCapitalT := VLCapitalT + qyProgVenIMP_TOTAL.AsFloat;
       VLPCapital := VLPCapital + qyProgVenIMP_BINTER.AsFloat;
       VLPCapitalM := VLPCapitalM + qyProgVenMORATORIOS.AsFloat;
       VLPCapitalG := VLPCapitalG + qyProgVenIMP_FEGA.AsFloat;
       VLPCapitalT := VLPCapitalT + qyProgVenIMP_TOTAL.AsFloat;

       VLTotCapital := VLTotCapital + ( qyProgVenIMPORTE.AsFloat * vlTipCambio);
       VLTotCapitalM := VLTotCapitalM + ( qyProgVenMORATORIOS.AsFloat * vlTipCambio);
       VLTotCapitalG := VLTotCapitalG + ( qyProgVenIMP_FEGA.AsFloat * vlTipCambio);
       VLTotCapitalT := VLTotCapitalT + ( qyProgVenIMP_TOTAL.AsFloat * vlTipCambio);
     end

     else if qyProgVenACCESORIO.AsString = 'INTERES' then
     begin
       VLInteres := VLInteres + qyProgVenIMPORTE.AsFloat;
       VLInteresM := VLInteresM + qyProgVenMORATORIOS.AsFloat;
       VLInteresG := VLInteresG + qyProgVenIMP_FEGA.AsFloat;
       VLInteresT := VLInteresT + qyProgVenIMP_TOTAL.AsFloat;
       VLPInteres := VLPInteres + qyProgVenIMP_BINTER.AsFloat;
       VLPInteresM := VLPInteresM + qyProgVenMORATORIOS.AsFloat;
       VLPInteresG := VLPInteresG + qyProgVenIMP_FEGA.AsFloat;
       VLPInteresT := VLPInteresT + qyProgVenIMP_TOTAL.AsFloat;

       VLTotInteres := VLTotInteres + ( qyProgVenIMPORTE.AsFloat * vlTipCambio);
       VLTotInteresM := VLTotInteresM + ( qyProgVenMORATORIOS.AsFloat * vlTipCambio);
       VLTotInteresG := VLTotInteresG + ( qyProgVenIMP_FEGA.AsFloat * vlTipCambio);
       VLTotInteresT := VLTotInteresT + ( qyProgVenIMP_TOTAL.AsFloat * vlTipCambio);

     end

     else if qyProgVenACCESORIO.AsString = 'REFINANCIAMIENTO' then
     begin
       VLRefin := VLRefin + qyProgVenIMPORTE.AsFloat;
       VLRefinM := VLRefinM + qyProgVenMORATORIOS.AsFloat;
       VLRefinG := VLRefinG + qyProgVenIMP_FEGA.AsFloat;
       VLRefinT := VLRefinT + qyProgVenIMP_TOTAL.AsFloat;
       VLPRefin := VLPRefin + qyProgVenIMP_BINTER.AsFloat;
       VLPRefinM := VLPRefinM + qyProgVenMORATORIOS.AsFloat;
       VLPRefinG := VLPRefinG + qyProgVenIMP_FEGA.AsFloat;
       VLPRefinT := VLPRefinT + qyProgVenIMP_TOTAL.AsFloat;

       VLTotRefin := VLTotRefin + ( qyProgVenIMPORTE.AsFloat * vlTipCambio);
       VLTotRefinM := VLTotRefinM + ( qyProgVenMORATORIOS.AsFloat * vlTipCambio);
       VLTotRefinG := VLTotRefinG + ( qyProgVenIMP_FEGA.AsFloat * vlTipCambio);
       VLTotRefinT := VLTotRefinT + ( qyProgVenIMP_TOTAL.AsFloat * vlTipCambio);

     end
     else
     begin
       VLComision := VLComision + qyProgVenIMPORTE.AsFloat;
       VLComisionM := VLComisionM + qyProgVenMORATORIOS.AsFloat;
       VLComisionG := VLComisionG + qyProgVenIMP_FEGA.AsFloat;
       VLComisionT := VLComisionT + qyProgVenIMP_TOTAL.AsFloat;
       VLPComision := VLPComision + qyProgVenIMP_BINTER.AsFloat;
       VLPComisionM := VLPComisionM + qyProgVenMORATORIOS.AsFloat;
       VLPComisionG := VLPComisionG + qyProgVenIMP_FEGA.AsFloat;
       VLPComisionT := VLPComisionT + qyProgVenIMP_TOTAL.AsFloat;

       VLTotComision := VLTotComision   + ( qyProgVenIMPORTE.AsFloat * vlTipCambio);
       VLTotComisionM := VLTotComisionM + ( qyProgVenMORATORIOS.AsFloat * vlTipCambio);
       VLTotComisionG := VLTotComisionG + ( qyProgVenIMP_FEGA.AsFloat * vlTipCambio);
       VLTotComisionT := VLTotComisionT + ( qyProgVenIMP_TOTAL.AsFloat * vlTipCambio);
     end;
   If sArchivo <>'' Then Begin
      If qyProgVen.FieldByName('F_INICIO').AsDateTime > 0 Then
         sFInicio:= FormatDateTime('dd/mm/yyyy', qyProgVen.FieldByName('F_INICIO').AsDateTime);
      If qyProgVen.FieldByName('F_VENCIMIENTO').AsDateTime > 0 Then
         sFVenc:= FormatDateTime('dd/mm/yyyy', qyProgVen.FieldByName('F_VENCIMIENTO').AsDateTime);
      If qyProgVen.FieldByName('F_PROG_PAGO').AsDateTime > 0 Then
         sFProgPago:= FormatDateTime('dd/mm/yyyy', qyProgVen.FieldByName('F_PROG_PAGO').AsDateTime);
      If qyProgVen.FieldByName('F_PAGO').AsDateTime > 0 Then
         sFPago:= FormatDateTime('dd/mm/yyyy', qyProgVen.FieldByName('F_PAGO').AsDateTime);

         Writeln(F,
                  qyProgVen.FieldByName('ID_PROM_ADM').AsString + #09 +
                  qyProgVen.FieldByName('NOM_PROMOTOR_ADM').AsString + #09 +
                  qyProgVen.FieldByName('CVE_MONEDA').AsString + #09 +
                  qyProgVen.FieldByName('DESC_MONEDA').AsString+ #09 +
                  qyProgVen.FieldByName('CVE_TIPO_SECTOR').AsString + #09 +
                  qyProgVen.FieldByName('CVE_PRODUCTO_CRE').AsString + #09 +
                  qyProgVen.FieldByName('DESC_L_PRODUCTO').AsString + #09 +
                  qyProgVen.FieldByName('CVE_TIPO_CRED_BC').AsString + #09 +            //EASA4011      28022005
                  qyProgVen.FieldByName('DESC_TIPO_CRED').AsString + #09 +            //EASA4011      28022005
                  qyProgVen.FieldByName('ID_TITULAR').AsString + #09 +
                  qyProgVen.FieldByName('NOMBRE').AsString + #09 +
                  qyProgVen.FieldByName('CVE_EMISOR_NAFIN').AsString + #09 +
                  qyProgVen.FieldByName('NOMBRE_EMISOR').AsString + #09 +
                  qyProgVen.FieldByName('CUENTA_BANCO').AsString + #09 +
                  qyProgVen.FieldByName('NO_REFER').AsString + #09 +
                  qyProgVen.FieldByName('ID_CREDITO').AsString + #09 +
                  qyProgVen.FieldByName('ID_CONTRATO').AsString + #09 +
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('SDO_INSOLUTO').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('SDO_VIG_TOTAL').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_CREDITO').AsFloat) + #09+
                  qyProgVen.FieldByName('CVE_CALCULO').AsString + #09 +
                  qyProgVen.FieldByName('ID_PROVEEDOR').AsString + #09 +
                  qyProgVen.FieldByName('NOM_PROVEEDOR').AsString + #09 +
                  qyProgVen.FieldByName('ACCESORIO').AsString + #09 +
                  qyProgVen.FieldByName('NUM_PERIODO_PER').AsString + #09 +
                  qyProgVen.FieldByName('PLAZO').AsString + #09 +
                  sFInicio + #09 +
                  sFVenc + #09 +
                  sFProgPago + #09 +
                  IntToStr(QRExpr5.Value.intResult) + #09 +
                  sFPago + #09 +
                  qyProgVen.FieldByName('TASA_APLICADA').AsString + #09 +
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_NOMINAL').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMPORTE').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_IVA').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_BENEFICIO').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('MORATORIOS').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IVA_MORATORIOS').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_TOTAL').AsFloat) + #09+
                  qyProgVen.FieldByName('SIT_CAPITAL').AsString  + #09 +
               //RLUMBRERAS LATBC 9/02/2011 (Se agrgegan variables para reporte de recuperados)
                  qyProgVen.FieldByName('StatusRecu').AsString);
               //´----------------------------------------------------------------------------
End;
end;

procedure TQrProgVen.QRFooterMonedaBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
        QRCapital.Caption := FormatFloat('###,###,###,###,###,##0.00',VLCapital);
        QRInteres.Caption := FormatFloat('###,###,###,###,###,##0.00',VLInteres);
        QRRefin.Caption := FormatFloat('###,###,###,###,###,##0.00',VLRefin);
        QRComsion.Caption := FormatFloat('###,###,###,###,###,##0.00',VLComision);

        QRCapitalM.Caption := FormatFloat('###,###,###,###,###,##0.00',VLCapitalM);
        QRInteresM.Caption := FormatFloat('###,###,###,###,###,##0.00',VLInteresM);
        QRRefinM.Caption := FormatFloat('###,###,###,###,###,##0.00',VLRefinM);
        QRComsionM.Caption := FormatFloat('###,###,###,###,###,##0.00',VLComisionM);

        QRCapitalG.Caption := FormatFloat('###,###,###,###,###,##0.00',VLCapitalG);
        QRInteresG.Caption := FormatFloat('###,###,###,###,###,##0.00',VLInteresG);
        QRRefinG.Caption := FormatFloat('###,###,###,###,###,##0.00',VLRefinG);
        QRComsionG.Caption := FormatFloat('###,###,###,###,###,##0.00',VLComisionG);

        QRCapitalT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLCapitalT);
        QRInteresT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLInteresT);
        QRRefinT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLRefinT);
        QRComsionT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLComisionT);



        VLCapital := 0;
        VLInteres := 0;
        VLRefin  := 0;
        VLComision  := 0;

        VLCapitalM := 0;
        VLInteresM := 0;
        VLRefinM  := 0;
        VLComisionM  := 0;

        VLCapitalG := 0;
        VLInteresG := 0;
        VLRefinG  := 0;
        VLComisionG  := 0;

        VLCapitalT := 0;
        VLInteresT := 0;
        VLRefinT  := 0;
        VLComisionT  := 0;
   If sArchivo <>'' Then Begin
      Writeln(F,'');
      Writeln(F,
               'Total por Moneda'+ #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
               #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
               FormatFloat('###,###,###,###,###,##0.00',QRExpr14.Value.dblResult) + #09+
               FormatFloat('###,###,###,###,###,##0.00',QRExpr62.Value.dblResult) + #09+
               FormatFloat('###,###,###,###,###,##0.00',QRExpr63.Value.dblResult) + #09+
               FormatFloat('###,###,###,###,###,##0.00',QRExpr64.Value.dblResult) + #09+
               FormatFloat('###,###,###,###,###,##0.00',QRExpr20.Value.dblResult) + #09+
               FormatFloat('###,###,###,###,###,##0.00',QRExpr65.Value.dblResult));
         Writeln(F,
                  'Total Capital'+#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  QRCapital.Caption + #09#09#09+
                  QRCapitalM.Caption + #09+
                  QRCapitalT.Caption);
         Writeln(F,
                  'Total Interes'+#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  QRInteres.Caption + #09#09#09+
                  QRInteresM.Caption + #09+
                  QRInteresT.Caption);
         Writeln(F,
                  'Total Refin'+ #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  QRRefin.Caption + #09#09#09+
                  QRRefinM.Caption + #09+
                  QRRefinT.Caption);
         Writeln(F,
                  'Total Comisión'+ #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  QRComsion.Caption + #09#09#09+
                  QRComsionM.Caption + #09+
                  QRComsionT.Caption);
   End;

end;

procedure TQrProgVen.QRFooterProductoBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
        QRPCapital.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPCapital);
        QRPInteres.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPInteres);
        QRPRefin.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPRefin);
        QRPRefinCap.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPRefin + VLPCapital);
        QRPComsion.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPComision);

        QRPCapitalM.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPCapitalM);
        QRPInteresM.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPInteresM);
        QRPRefinM.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPRefinM);
        QRPRefinCapM.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPRefinM + VLPCapitalM);
        QRPComsionM.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPComisionM);

        QRPCapitalG.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPCapitalG);
        QRPInteresG.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPInteresG);
        QRPRefinG.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPRefinG);
        QRPRefinCapG.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPRefinG + VLPCapitalG);
        QRPComsionG.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPComisionG);

        QRPCapitalT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPCapitalT);
        QRPInteresT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPInteresT);
        QRPRefinT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPRefinT);
        QRPRefinCapT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPRefinT + VLPCapitalT);
        QRPComsionT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPComisionT);



        VLPCapital := 0;
        VLPInteres := 0;
        VLPRefin  := 0;
        VLPComision  := 0;

        VLPCapitalM := 0;
        VLPInteresM := 0;
        VLPRefinM  := 0;
        VLPComisionM  := 0;

        VLPCapitalG := 0;
        VLPInteresG := 0;
        VLPRefinG  := 0;
        VLPComisionG  := 0;

        VLPCapitalT := 0;
        VLPInteresT := 0;
        VLPRefinT  := 0;
        VLPComisionT  := 0;

   If sArchivo <>'' Then Begin
         Writeln(F,
                  #09#09+'Total por Producto'+#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr12.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr34.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr35.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr36.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr18.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr37.Value.dblResult));
         Writeln(F,
                  #09+'Total Capital'+#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  QRPCapital.Caption + #09#09#09+
                  QRPCapitalM.Caption + #09+
                  QRPCapitalT.Caption);
         Writeln(F,
                  #09+'Total Interes'+#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  QRPInteres.Caption + #09#09#09+
                  QRPInteresM.Caption + #09+
                  QRPInteresT.Caption);
         Writeln(F,
                  #09+'Total Refin'+#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  QRPRefin.Caption + #09#09#09+
                  QRPRefinM.Caption + #09+
                  QRPRefinT.Caption);
         Writeln(F,
                  #09+'Total Comisión'+#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  QRPComsion.Caption + #09#09#09+
                  QRPComsionM.Caption + #09+
                  QRPComsionT.Caption);
   End;
end;

procedure TQrProgVen.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If qyProgVen.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

procedure TQrProgVen.QRFooterCesionBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
         Writeln(F,
                  #09#09+'Total por Crédito'+#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr10.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr23.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr24.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr25.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr16.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr26.Value.dblResult));
   End;
end;

procedure TQrProgVen.QRFooterClienteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
         Writeln(F,
                  #09#09+'Total por Cliente'+#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr11.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr4.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr3.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr2.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr17.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr1.Value.dblResult));
   End;
end;

procedure TQrProgVen.QRBFootSectorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
         Writeln(F,
                  'Núm. Doctos'+#09#09+
                  IntToStr(QRExpr52.Value.intResult)+ #09#09 +
                  'Total de SECTOR' +#09#09+
                  qyProgVen.FieldByName('CVE_TIPO_SECTOR').AsString +
                  #09#09#09#09#09#09#09#09#09 +
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr13.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr6.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr7.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr8.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr19.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr9.Value.dblResult));
   End;
end;

procedure TQrProgVen.QRFooterPromotorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F,
               'Total por Promotor'+ #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
               #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
               FormatFloat('###,###,###,###,###,##0.00',QRExpr15.Value.dblResult) + #09+
               FormatFloat('###,###,###,###,###,##0.00',QRExpr48.Value.dblResult) + #09+
               FormatFloat('###,###,###,###,###,##0.00',QRExpr49.Value.dblResult) + #09+
               FormatFloat('###,###,###,###,###,##0.00',QRExpr50.Value.dblResult) + #09+
               FormatFloat('###,###,###,###,###,##0.00',QRExpr21.Value.dblResult) + #09+
               FormatFloat('###,###,###,###,###,##0.00',QRExpr51.Value.dblResult));
   End;
end;

procedure TQrProgVen.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     PrintBand := (qyProgVenCVE_EMISOR_NAFIN.AsString <> '0');
end;

procedure TQrProgVen.QRGroupContBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   //<easa4011 28.jun.2007
    VLTotCapital := 0;
    VLTotInteres := 0;
    VLTotRefin := 0;
    VLTotComision := 0;
    VLTotCapitalM := 0;
    VLTotInteresM := 0;
    VLTotRefinM := 0;
    VLTotComisionM := 0;
    VLTotCapitalG := 0;
    VLTotInteresG := 0;
    VLTotRefinG := 0;
    VLTotComisionG := 0;
    VLTotCapitalT := 0;
    VLTotInteresT := 0;
    VLTotRefinT := 0;
    VLTotComisionT := 0;

    VLTotNominal := 0;
    VLTotBinter  := 0;
    VLTotIVA     := 0;
    VLTotFEGA    := 0;
    VLTotImporte := 0;
    VLTotMoras   := 0;
    VLTotIVAMoras   := 0;    
    VLTotal      := 0;
   //esas>/
end;

procedure TQrProgVen.QRFooterContBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   //<easa4011 28.jun.2007
        QRTotCapital.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotCapital);
        QRTotInteres.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotInteres);
        QRTotRefin.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotRefin);
        QRTotComsion.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotComision);

        QRTotCapitalM.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotCapitalM);
        QRTotInteresM.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotInteresM);
        QRTotRefinM.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotRefinM);
        QRTotComsionM.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotComisionM);

        QRTotCapitalG.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotCapitalG);
        QRTotInteresG.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotInteresG);
        QRTotRefinG.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotRefinG);
        QRTotComsionG.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotComisionG);

        QRTotCapitalT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotCapitalT);
        QRTotInteresT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotInteresT);
        QRTotRefinT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotRefinT);
        QRTotComsionT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotComisionT);



        VLTotCapital := 0;
        VLTotInteres := 0;
        VLTotRefin  := 0;
        VLTotComision  := 0;

        VLTotCapitalM := 0;
        VLTotInteresM := 0;
        VLTotRefinM  := 0;
        VLTotComisionM  := 0;

        VLTotCapitalG := 0;
        VLTotInteresG := 0;
        VLTotRefinG  := 0;
        VLTotComisionG  := 0;

        VLTotCapitalT := 0;
        VLTotInteresT := 0;
        VLTotRefinT  := 0;
        VLTotComisionT  := 0;

   QRNOMINAL.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotNominal);
   QRBINTER.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotBinter );
   QRIVA.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotIVA    );
   QRFEGA.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotFEGA   );
   QRIMPORTE.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotImporte);
   QRMORAS.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotMoras  );
   QRIVAMORAS.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotIVAMoras  );
   QRTOTAL.Caption := FormatFloat('###,###,###,###,###,##0.00',VLTotal     );
   //esas>/
end;

procedure TQrProgVen.chbChqrasBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vlSql, vlcadena: String;
    Qry : TQuery;
begin
   vlcadena := '';
   vlSql := ' SELECT DECODE(ID_CREDITO,0,NULL, ID_CREDITO) ID_CREDITO, CUENTA_BANCO CTA, '+coCRLF +
            '        PKGCRCUOTAS.ObtSdoCheq(SUBSTR(CUENTA_BANCO,1,20), '+ SQLFecha( vgFechaHoy) +') SDO'+ coCRLF +
	    ' FROM CR_CRED_CHEQ'+ coCRLF +
	    ' WHERE ID_ACREDITADO = '+ qyProgVen.FieldByName('ID_TITULAR').AsString+ coCRLF +
	    '   AND SIT_CHEQUERA = ''AC'''+ coCRLF +
	    '   AND CVE_TIPO_CHEQ = ''AD'''+ coCRLF +
	    ' GROUP BY ID_CREDITO, CUENTA_BANCO'+ coCRLF ;

      Qry := GetSQLQueryNoNil( vlSql, Apli.DataBaseName, Apli.SessionName, False );
      //
      if Assigned(Qry) and not( Qry.IsEmpty ) then
      begin
        while not Qry.Eof do
        begin
          QRMemo2.Lines.Add(Qry.FieldByName('ID_CREDITO').AsString);
          vlcadena := Qry.FieldByName('CTA').AsString + '                       Saldo:  ' +
                      FormatFloat('###,###,###,###,###,##0.00',Qry.FieldByName('SDO').AsFloat );
          QRMemo1.Lines.Add(vlcadena);
          Qry.Next;
        end;//ends_if
      end;
      if Assigned(Qry) then
      begin
        Qry.Close;
        Qry.Free;
      end;

end;

// RUCJ4248: Actualiza el saldo actual de la chequera sobre la tabla temporal
//           Reporte de Programación de Vencimientos
{function TQrProgVen.strUpdate: String;
var
  resultado : string;
begin
  resultado := '' +
    'UPDATE rp_tmp_Vencimientos2 SET saldo_cta = ( ' +
    '							    SELECT SDO_EFE_VIRT FROM DV_TRANSACCION ' +
    '							    WHERE ID_CONTRATO = rp_tmp_Vencimientos2.CUENTA_BANCO ' +
    '							       AND ID_COD_RESP =0 ' +
    '							       AND ROWNUM = 1 ' +
   	'		                 AND ID_TRANSACCION = (SELECT MAX(ID_TRANSACCION) FROM DV_TRANSACCION t2 ' +
   	'   				                  WHERE 1 = 1 AND t2.ID_CONTRATO = DV_TRANSACCION.ID_CONTRATO) ' +
    '             )';

  Result := resultado;
end;       }

END.
