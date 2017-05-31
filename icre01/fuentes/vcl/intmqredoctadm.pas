unit IntMQrEdoCtaDM;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,InterApl,
  IntQRPreview, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  IntGenCre, UnSQL2;

type
  TQrEdoCtaDM = class(TQuickRep)
    QRGpoTitulo: TQRGroup;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRGrupoOperCte: TQRGroup;
    QRShape1: TQRShape;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel19: TQRLabel;
    QRGrupoOperProv: TQRGroup;
    QRGroupOperMes: TQRGroup;
    qbGPO_VIGENTE: TQRGroup;
    QRLabel62: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    qbGPO_CES_VIG: TQRGroup;
    qrlTasa: TQRLabel;
    qbgPO_FAC_VIG: TQRGroup;
    QRGroupDET_OPER: TQRChildBand;
    QRDBText8: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBPAGOS: TQRDBText;
    QRDBCOBRO: TQRDBText;
    qbTOT_CES_VIG: TQRBand;
    qrlTotal: TQRLabel;
    qrTVIG_NOM: TQRLabel;
    qrTVIG_AFORO: TQRLabel;
    qrTVIG_GAR: TQRLabel;
    qrTVIG_COMPRA: TQRLabel;
    qrTVIG_INT: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText6: TQRDBText;
    qbGPO_IMPAG: TQRGroup;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    bqGPO_CES_IMP: TQRGroup;
    chbFAC_VIG: TQRChildBand;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRTITULOREP: TQRBand;
    QRLabel42: TQRLabel;
    QRFOOTPROV: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel18: TQRLabel;
    QRLTOTPAGO: TQRLabel;
    QRLTOTCOBRO: TQRLabel;
    qbTOT_IMPAGADA: TQRBand;
    QRLabel41: TQRLabel;
    qrlTOT_NOM: TQRLabel;
    qrlTOT_COMPRA: TQRLabel;
    qrlTOT_INT: TQRLabel;
    qbTOT_CES_IMP: TQRBand;
    qrlTotalCes: TQRLabel;
    qrlCES_NOM: TQRLabel;
    qrlCES_COMPRA: TQRLabel;
    qrlCES_INT: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText35: TQRDBText;
    qbCOBRADO: TQRBand;
    QRShape15: TQRShape;
    QRLabel40: TQRLabel;
    qrTCOB_NOMINAL: TQRLabel;
    qrTCOB_BONIF: TQRLabel;
    qrTCOB_COBRADO: TQRLabel;
    qbTOT_VIGENTE: TQRBand;
    QRLabel1: TQRLabel;
    qrTOT_VIG_NOM: TQRLabel;
    qrTOT_VIG_AFORO: TQRLabel;
    qrTOT_VIG_GAR: TQRLabel;
    qrTOT_VIG_COMPRA: TQRLabel;
    qrTOT_VIG_INT: TQRLabel;
    qbGPO_FACT_IMP: TQRGroup;
    chbFAC_IMP: TQRChildBand;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText18: TQRDBText;
    QRGroupGPO_TRANSAC: TQRGroup;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel51: TQRLabel;
    QRGroupGPO_FOPERA: TQRGroup;
    DetailBandDET_TRANSAC: TQRChildBand;
    QRDBText23: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText12: TQRDBText;
    qbPageHeader: TQRBand;
    qrlNOTA: TQRLabel;
    qbCobFactura: TQRBand;
    qyQuery: TQuery;
    qyQueryNOMBRE: TStringField;
    qyQueryCALLE_NUMERO: TStringField;
    qyQueryCOLONIA: TStringField;
    qyQueryCVE_CIUDAD: TStringField;
    qyQueryCODIGO_POSTAL: TStringField;
    qyQueryCVE_ESTADO: TStringField;
    qyQueryCVE_PAIS: TStringField;
    qyQueryDELEGACION: TStringField;
    qyQueryESTADO: TStringField;
    qyQueryPAIS: TStringField;
    qyQueryCVE_RFC: TStringField;
    qyQueryDESC_MONEDA: TStringField;
    qyQueryCTO_DEP: TMemoField;
    qyQueryTASA_CREDITO: TFloatField;
    qyQueryGRUPO: TStringField;
    qyQueryGPO: TStringField;
    qyQueryINI_MES: TDateTimeField;
    qyQueryFIN_MES: TDateTimeField;
    qyQueryID_PROVEEDOR: TFloatField;
    qyQueryF_OPERACION: TDateTimeField;
    qyQueryID_CESION: TFloatField;
    qyQueryCONCEPTO: TStringField;
    qyQueryIMP_CONCEPTO: TFloatField;
    qyQueryTIPO: TStringField;
    qyQueryTASA_APLICADA: TFloatField;
    qyQueryF_VENCIMIENTO: TDateTimeField;
    qyQueryPLAZO: TFloatField;
    qyQueryIMP_NOMINAL: TFloatField;
    qyQueryIMP_AFORO: TFloatField;
    qyQueryREM_GAR: TFloatField;
    qyQueryIMP_COMPRA: TFloatField;
    qyQueryIMP_INTERES: TFloatField;
    qyQueryF_VALOR_PAGO: TDateTimeField;
    qyQueryDESCTOS: TFloatField;
    qyQueryPCT: TFloatField;
    qyQueryFACTURA: TStringField;
    qyQueryF_COMPRA: TDateTimeField;
    qyQueryCOUNT_VIG: TFloatField;
    qyQueryPRODUCTO: TStringField;
    qyQueryAUTORIZACION: TFloatField;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGroupDET_OPERBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGpoTituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qbGPO_VIGENTEBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qbGPO_CES_VIGBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupGPO_TRANSACBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qbGPO_IMPAGBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupGPO_FOPERABeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupOperMesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qbgPO_FAC_VIGBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bqGPO_CES_IMPBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFOOTPROVBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRTITULOREPBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qbTOT_CES_IMPBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure chbFAC_IMPBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qbTOT_IMPAGADABeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBandDET_TRANSACBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qbCOBRADOBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure chbFAC_VIGBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qbTOT_CES_VIGBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qbTOT_VIGENTEBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qbGPO_FACT_IMPBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qbCobFacturaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRlblFolioMesPrint(sender: TObject; var Value: String);
  private
     sFIniRep, sFFinRep: String;
     sFechaInicial:String;
     APli : TInterApli;
     dSuma : Double;
     VLMsg: String;

     Procedure HabilitaGrupos;
     Procedure ProductoCtoIVA(PPIDContrato : Integer; var pBAplicaIVA : String; var PctIVA : Double);
  public
     Function FormaQuery(sDisposicion, sFecha,
                         sGpoProd, sProducto, sSituacion,
                         sAcreditado, sProveedor,
                         sPromAsoc,sPromAdm,
//                         sEmpresa, sSucursal:String):String;
//////////////////// ASTECI LIEF 22/09/09 INICIO ///////////////////////////////
// Se agregó el parámetro vlOrdena
                         sEmpresa, sSucursal, vlOrdena:String):String;
//////////////////// ASTECI  LIEF 22/09/09 FINAL ///////////////////////////////
  end;

var
  QrEdoCtaDM: TQrEdoCtaDM;

  vgMuestraCtrl: Boolean;
    iTotAutoriz:  Integer;
    iTotDispos:  Integer;
    vgTotPago, vgTotCobro: Double;
    vgTotCesNom, vgTotCesAforo,vgTotCesCompra, vgTotCesRem,vgTotCesInt : Double;
    vgTotNom, vgTotAforo,vgTotCompra, vgTotRem,vgTotInt : Double;
    vgTVigNom, vgTVigAforo,vgTVigCompra, vgTVigGar,vgTVigInt : Double;
    vgTotVigNom, vgTotVigAforo, vgTotVigCompra, vgTotVigGar, vgTotVigInt : Double;
    vgTCOB_NOMINAL, vgTCOB_bonif, vgTCOB_COBRADO : Double;
    vgCesion : Integer;
    vgProveedor : Integer;

Function  RepEdoCtaDM( sDisposicion, sFecha,
                       sGpoProd, sProducto, sSituacion,
                       sAcreditado, sProveedor,
                       sPromAsoc,sPromAdm,
                       sEmpresa, sSucursal:String;
                       pAPli : TInterApli; pPreview  : Boolean;
                       grOpcion  : TGenRepOption;
//                       sArchivoDig : String
//////////////////// ASTECI LIEF 22/09/09 INICIO ///////////////////////////////
// Se agregó el parámetro vlOrdena
                       sArchivoDig,
                       vlOrdena : String
//////////////////// ASTECI  LIEF 22/09/09 FINAL ///////////////////////////////
                     ) : String;
implementation

{$R *.DFM}

Function  RepEdoCtaDM( sDisposicion, sFecha,
                       sGpoProd, sProducto, sSituacion,
                       sAcreditado, sProveedor,
                       sPromAsoc,sPromAdm,
                       sEmpresa, sSucursal:String;
                       pAPli : TInterApli; pPreview : Boolean;
                       grOpcion  : TGenRepOption;
//                       sArchivoDig : String
//////////////////// ASTECI LIEF 22/09/09 INICIO ///////////////////////////////
// Se agregó el parámetro vlOrdena
                       sArchivoDig,
                       vlOrdena : String
//////////////////// ASTECI  LIEF 22/09/09 FINAL ///////////////////////////////
                     ) : String;
Var
  QrEdoCtaDM : TQrEdoCtaDM;
  VLTitulo : String;
  Preview  : TIntQRPreview;
  VLMsg    : String;
Begin
  VLTitulo := '';
  iTotAutoriz := 0;
  iTotDispos := 0;
  //TOTAL VIGENTE
  vgTVigNom   := 0; vgTVigAforo   := 0;vgTVigCompra   := 0;vgTVigGar   := 0;vgTVigInt   := 0;
  vgTotVigNom := 0; vgTotVigAforo := 0;vgTotVigCompra := 0;vgTotVigGar := 0;vgTotVigInt := 0;

  //TOTAL IMPAGADO
  vgTotPago  := 0;
  vgTotCobro := 0;
  vgTotCesNom := 0;
  vgTotCesAforo := 0;
  vgTotCesCompra := 0;
  vgTotCesRem := 0;
  vgTotCesInt := 0;
  vgTotNom := 0;
  vgTotAforo := 0;
  vgTotCompra := 0;
  vgTotRem := 0;
  vgTotInt := 0;
  vgCesion := 0;
  //TOTALES COBRADOS
  vgTCOB_NOMINAL := 0;
  vgTCOB_bonif := 0;
  vgTCOB_COBRADO := 0;
  vgProveedor:= 0;

  VLMsg  := 'Edo Cta Crédito: '  + sDisposicion + ' NO SE PUEDE GENERAR';
  QrEdoCtaDM:=TQrEdoCtaDM.Create(Nil);
  Preview := TIntQRPreview.CreatePreview(Application, QrEdoCtaDM);
  Try
      QrEdoCtaDM.VLMsg := 'OK';
      QrEdoCtaDM.APli:= pAPli;
      QrEdoCtaDM.qyQuery.DatabaseName := pApli.DataBaseName;
      QrEdoCtaDM.qyQuery.SessionName := pApli.SessionName;
      QrEdoCtaDM.qyQuery.Active:=False;
      QrEdoCtaDM.qyQuery.SQL.Text:= QrEdoCtaDM.FormaQuery(sDisposicion, sFecha,
                                                          sGpoProd, sProducto, sSituacion,
                                                          sAcreditado, sProveedor,
                                                          sPromAsoc,sPromAdm,
  //                                                            sEmpresa, sSucursal);
  //////////////////// ASTECI LIEF 22/09/09 INICIO ///////////////////////////////
  // Se agrega el parámetro vlOrdena
                                                          sEmpresa, sSucursal,vlOrdena);
  //////////////////// ASTECI  LIEF 22/09/09 FINAL ///////////////////////////////

      QrEdoCtaDM.qyQuery.SQL.SaveToFile('c:\EdoCtaDM.txt');
      QrEdoCtaDM.qyQuery.Active:=True;

      VLMsg  := 'Edo Cta Cesión: '  + sDisposicion + ' OK ';


      If pPreview Then
          QrEdoCtaDM.Preview
      Else
          QrEdoCtaDM.Print;

      if QrEdoCtaDM.VLMsg <> 'OK' then
         VLMsg := QrEdoCtaDM.VLMsg
      //end if;
  Finally
      QrEdoCtaDM.free;
  End;
  RepEdoCtaDM := VLMsg;
End;

procedure TQrEdoCtaDM.bqGPO_CES_IMPBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  HabilitaGrupos;
  qbTOT_CES_VIG.Enabled:= False;
  qbGPO_IMPAG.Enabled:= False;
    qbTOT_VIGENTE.Enabled:= False;
  vgTotCesNom := 0;
  vgTotCesAforo := 0;
  vgTotCesCompra := 0;
  vgTotCesRem := 0;
  vgTotCesInt := 0;
end;

procedure TQrEdoCtaDM.chbFAC_IMPBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var                                                            
  vgContador: Integer;
begin
  inc(vgContador);
  HabilitaGrupos;
  qbTOT_VIGENTE.Enabled:= False;
  qbTOT_CES_VIG.Enabled:= False;
  qbGPO_IMPAG.Enabled:= False;
  qbTOT_CES_IMP.Enabled:= True;
  qbTOT_IMPAGADA.Enabled:= False;
  vgCesion:= qyQuery.FieldByName('ID_CESION').AsInteger;
end;

procedure TQrEdoCtaDM.chbFAC_VIGBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  qrTVIG_NOM.Caption := FormatFloat('###,###,###,###,##0.00',vgTVigNom);
//  qrTVIG_AFORO.Caption := FormatFloat('###,###,###,###,##0.00',vgTVigAforo);
//  qrTVIG_COMPRA.Caption := FormatFloat('###,###,###,###,##0.00',vgTVigCompra);
//  qrTVIG_GAR.Caption := FormatFloat('###,###,###,###,##0.00',vgTVigGar);
//  qrTVIG_INT.Caption := FormatFloat('###,###,###,###,##0.00',vgTVigInt);
    vgTVigNom := vgTVigNom + qyQuery.FieldByName('IMP_NOMINAL').AsFloat;
    vgTVigAforo := vgTVigAforo + qyQuery.FieldByName('IMP_AFORO').AsFloat;
    vgTVigCompra := vgTVigCompra + qyQuery.FieldByName('REM_GAR').AsFloat;
    vgTVigGar := vgTVigGar + qyQuery.FieldByName('IMP_COMPRA').AsFloat;
    vgTVigInt := vgTVigInt + qyQuery.FieldByName('IMP_INTERES').AsFloat;

    vgTotVigNom := vgTotVigNom + qyQuery.FieldByName('IMP_NOMINAL').AsFloat;
    vgTotVigAforo := vgTotVigAforo + qyQuery.FieldByName('IMP_AFORO').AsFloat;
    vgTotVigCompra := vgTotVigCompra + qyQuery.FieldByName('REM_GAR').AsFloat;
    vgTotVigGar := vgTotVigGar + qyQuery.FieldByName('IMP_COMPRA').AsFloat;
    vgTotVigInt := vgTotVigInt + qyQuery.FieldByName('IMP_INTERES').AsFloat;
end;

function TQrEdoCtaDM.FormaQuery(sDisposicion, sFecha, sGpoProd, sProducto,
  sSituacion, sAcreditado, sProveedor, sPromAsoc, sPromAdm, sEmpresa,
  sSucursal, vlOrdena: String): String;
Var
  sSQL:String;
  MesYear: String;
//    Mes : String;
begin
   MesYear := Copy(sFecha,4,2);
   MesYear := MesYear + Copy(sFecha,7,4);
   sSQL:= ' -------------------------------------------------------------------------------------------------------------------'+ coCRLF +
          ' --										DATOS CLIENTE'+ coCRLF +
          ' -------------------------------------------------------------------------------------------------------------------'+ coCRLF +
          ' SELECT P.NOMBRE, '+ coCRLF +
          '        D.CALLE_NUMERO,  D.COLONIA,'+ coCRLF +
          '        D.CVE_CIUDAD,    D.CODIGO_POSTAL,'+ coCRLF +
          '        D.CVE_ESTADO,    D.CVE_PAIS,'+ coCRLF +
          '        POBCD.DESC_POBLACION DELEGACION, EDO.DESC_POBLACION ESTADO,'+ coCRLF +
          '        PAIS.DESC_POBLACION PAIS,'+ coCRLF +
          '        R.SIGLAS_RFC||R.F_RFC||R.HOMOCLAVE_RFC  CVE_RFC,'+ coCRLF +
          '        (TO_DATE('+SQLSTR(MesYear)+',''MMYYYY'')-1)+1 INI_MES,'+ coCRLF +
          '        LAST_DAY(TO_DATE('+SQLSTR(MesYear)+' ,''MMYYYY'')) FIN_MES,'+ coCRLF +
          '        PKGCRPERIODO.STPObtChqCte(NULL,NULL,DET.ID_CESION,''AC'',''AD'',''CR'') CTO_DEP,'+ coCRLF +
          '        M.DESC_MONEDA,'+ coCRLF +
          '        CR.TASA_CREDITO,'+ coCRLF +
          '        DET.*,'+ coCRLF +
          '        NVL( (SELECT COUNT(*) COUNT FROM CR_CAPITAL'+ coCRLF +
          '        	 WHERE ID_CREDITO = CR.ID_CREDITO AND SIT_CAPITAL NOT IN (''IM'', ''LQ'', ''CA'')'+ coCRLF +
//          '           ),0) COUNT_VIG, CTO.ID_CONTRATO AUTORIZACION, PRO.DESC_L_PRODUCTO PRODUCTO'+ coCRLF +
//////////////////// ASTECI LIEF 28/09/09 INICIO ///////////////////////////////
// Se comentó la línea superior para poder agregar los datos de no. contrato y desc. producto
          '           ),0) COUNT_VIG, CTO.ID_CONTRATO AUTORIZACION, PRO.DESC_L_PRODUCTO PRODUCTO'+ coCRLF +
//////////////////// ASTECI  LIEF 28/09/09 FINAL ///////////////////////////////
          ' FROM CR_CREDITO     CR,'+ coCRLF +
          '      PERSONA        P,'+ coCRLF +
          '      RFC            R,'+ coCRLF +
          ' 	 DOMICILIO      D,'+ coCRLF +
          '      POBLACION      POBCD,'+ coCRLF +
          '      POBLACION      EDO,'+ coCRLF +
          '      POBLACION      PAIS,'+ coCRLF +
          '      MONEDA         M,'+ coCRLF +
          '      CR_CONTRATO    CCTO,'+ coCRLF +
          '      CR_PRODUCTO    PRO,'+ coCRLF +
          '      CONTRATO       CTO,'+ coCRLF +
          ' 	 ('+ coCRLF +
          '         --------------------------------------------------------------------------------------------'+ coCRLF +
          '         --	     			OPERACIONES DEL CLIENTE'+ coCRLF +
          '         --------------------------------------------------------------------------------------------'+ coCRLF +
          '         SELECT ''0'' AS GRUPO,'+ coCRLF +
          ' 		   GPO,'+ coCRLF +
          ' 		   ID_PROVEEDOR,'+ coCRLF +
          ' 		   F_OPERACION,'+ coCRLF +
          ' 		   ID_CESION,'+ coCRLF +
          ' 		   CONCEPTO,'+ coCRLF +
          ' 		   IMP_CONCEPTO,'+ coCRLF +
          ' 		   TIPO,'+ coCRLF +
          ' 		   --SEGUNDO GRUPO'+ coCRLF +
          '                0 		 AS TASA_APLICADA,'+ coCRLF +
          ' 		   '''' 	 AS FACTURA,'+ coCRLF +
          ' 		   TO_DATE(NULL) AS F_VENCIMIENTO,'+ coCRLF +
          ' 		   0		 AS PLAZO,'+ coCRLF +
          ' 		   0		 AS IMP_NOMINAL,'+ coCRLF +
          ' 		   0		 AS IMP_AFORO,'+ coCRLF +
          ' 		   0		 AS REM_GAR,'+ coCRLF +
          ' 		   0		 AS IMP_COMPRA,'+ coCRLF +
          ' 		   0		 AS IMP_INTERES,'+ coCRLF +
          ' 		   --TERCER GRUPO'+ coCRLF +
          ' 		   TO_DATE(NULL) AS F_COMPRA,'+ coCRLF +
          ' 		   TO_DATE(NULL) AS F_VALOR_PAGO,'+ coCRLF +
          '                0		 AS DESCTOS,'+ coCRLF +
          ' 		   0		 AS PCT, ROWNUM AS CONTADOR'+ coCRLF +
          '         FROM ( SELECT *'+ coCRLF +
          ' 		   FROM ('+ coCRLF +
          '                       SELECT ''A'' GPO, CS.ID_PROVEEDOR, CS.F_AUTORIZA AS F_OPERACION, CS.ID_CESION,'+ coCRLF +
          '         		         ''VALOR NOMINAL'' AS CONCEPTO, SUM(CD.IMP_NOMINAL) AS IMP_CONCEPTO, ''CARGO'' AS TIPO'+ coCRLF +
          '                  	  FROM CR_DOCUMENTO CD,'+ coCRLF +
          '           		       CR_CESION CS'+ coCRLF +
          '                  	  WHERE CS.F_AUTORIZA >= (TO_DATE('+SQLSTR(MesYear)+',''MMYYYY'')-1)+1'+ coCRLF +
          '         		    AND CS.F_AUTORIZA <= LAST_DAY(TO_DATE('+SQLSTR(MesYear)+' ,''MMYYYY''))'+ coCRLF +
          '           	  	    AND CD.SIT_DOCUMENTO <> ''CA'''+ coCRLF;
   If (Trim(sDisposicion)<>'') Then
      sSQL:= sSQL + '           	  	    AND CS.ID_CESION = '+ Trim(sDisposicion)+ coCRLF ;
   If (Trim(sProveedor)<>'') Then
      sSQL:= sSQL + '           	  	    AND CS.ID_PROVEEDOR = '+ Trim(sProveedor)+ coCRLF ;
   If Trim(sSituacion)= '0' Then
      sSQL:= sSQL + '           	  	    AND CS.SIT_CESION IN (''AU'') '+ coCRLF ;
   If Trim(sSituacion)= '1' Then
      sSQL:= sSQL + '           	  	    AND CS.SIT_CESION IN (''LQ'') '+ coCRLF ;
   If Trim(sSituacion)= '2' Then
      sSQL:= sSQL + '           	  	    AND CS.SIT_CESION IN (''AU'',''LQ'') '+ coCRLF ;
   If Trim(sAcreditado)<> '' Then
      sSQL:= sSQL + '           	  	    AND CS.ID_EMISOR ='+ Trim(sAcreditado)+ coCRLF ;

      sSQL:= sSQL +
          '         		    AND CD.ID_CESION = CS.ID_CESION'+ coCRLF +
          '                  	  GROUP BY CS.F_AUTORIZA, CS.ID_CESION, CS.ID_PROVEEDOR'+ coCRLF +

          '                  	UNION'+ coCRLF +

          '                  	  SELECT ''B'' GPO, CS.ID_PROVEEDOR,CS.F_AUTORIZA AS F_OPERACION, CS.ID_CESION,'+ coCRLF +
          '   			         ''DESCUENTO AFORO'' AS CONCEPTO, SUM(IMP_REMANENTE) AS IMP_CONCEPTO,''ABONO'' AS TIPO'+ coCRLF +
          '         		  FROM CR_REMANENTE CR,'+ coCRLF +
          '         		       CR_CESION CS'+ coCRLF +
          '                  	  WHERE CS.F_AUTORIZA >= (TO_DATE('+SQLSTR(MesYear)+',''MMYYYY'')-1)+1'+ coCRLF +
          '         		    AND CS.F_AUTORIZA <= LAST_DAY(TO_DATE('+SQLSTR(MesYear)+' ,''MMYYYY''))'+ coCRLF +
          '           	  	    AND CR.CVE_TIPO_REMAN = ''RE'''+ coCRLF;
   If (Trim(sDisposicion)<>'') Then
      sSQL:= sSQL + '         		    AND CS.ID_CESION = '+ Trim(sDisposicion)+ coCRLF ;
   If (Trim(sProveedor)<>'') Then
      sSQL:= sSQL + '         		    AND CS.ID_PROVEEDOR = '+ Trim(sProveedor)+ coCRLF ;
   If Trim(sSituacion)= '0' Then
      sSQL:= sSQL + '         		    AND CS.SIT_CESION IN (''AU'') '+ coCRLF ;
   If Trim(sSituacion)= '1' Then
      sSQL:= sSQL + '         		    AND CS.SIT_CESION IN (''LQ'') '+ coCRLF ;
   If Trim(sSituacion)= '2' Then
      sSQL:= sSQL + '         		    AND CS.SIT_CESION IN (''AU'',''LQ'') '+ coCRLF ;
   If Trim(sAcreditado)<> '' Then
      sSQL:= sSQL + '         		    AND CS.ID_EMISOR ='+ Trim(sAcreditado)+ coCRLF ;

      sSQL:= sSQL +
          '         		    AND CR.ID_CESION = CS.ID_CESION'+ coCRLF +
          '                  	  GROUP BY CS.F_AUTORIZA, CS.ID_CESION, CS.ID_PROVEEDOR'+ coCRLF +

          '                  	UNION'+ coCRLF +

          '                  	  SELECT ''C'' GPO, CS.ID_PROVEEDOR,CS.F_AUTORIZA AS F_OPERACION, CS.ID_CESION,'+ coCRLF +
          '         			 ''INTERESES COBRADOS POR ANTICIPADO'' AS CONCEPTO, SUM(IMP_PAGADO) AS IMP_CONCEPTO, ''ABONO'' AS TIPO'+ coCRLF +
          '                  	  FROM CR_INTERES CI,'+ coCRLF +
          '            		       CR_CESION CS'+ coCRLF +
          '                  	  WHERE CS.F_AUTORIZA >= (TO_DATE('+SQLSTR(MesYear)+',''MMYYYY'')-1)+1'+ coCRLF +
          '         		    AND CS.F_AUTORIZA <= LAST_DAY(TO_DATE('+SQLSTR(MesYear)+' ,''MMYYYY''))'+ coCRLF +
          '           	  	    AND CI.SIT_INTERES <> ''CA'''+ coCRLF +
          '         		    AND CS.CVE_TIPO_INTERES = ''IN'''+ coCRLF;
   If (Trim(sDisposicion)<>'') Then
      sSQL:= sSQL + '           	  	    AND CS.ID_CESION = '+ Trim(sDisposicion)+ coCRLF ;
   If (Trim(sProveedor)<>'') Then
      sSQL:= sSQL + '           	  	    AND CS.ID_PROVEEDOR = '+ Trim(sProveedor)+ coCRLF ;
   If Trim(sSituacion)= '0' Then
      sSQL:= sSQL + '           	  	    AND CS.SIT_CESION IN (''AU'') '+ coCRLF ;
   If Trim(sSituacion)= '1' Then
      sSQL:= sSQL + '           	  	    AND CS.SIT_CESION IN (''LQ'') '+ coCRLF ;
   If Trim(sSituacion)= '2' Then
      sSQL:= sSQL + '           	  	    AND CS.SIT_CESION IN (''AU'',''LQ'') '+ coCRLF ;
   If Trim(sAcreditado)<> '' Then
      sSQL:= sSQL + '           	  	    AND CS.ID_EMISOR ='+ Trim(sAcreditado)+ coCRLF ;

      sSQL:= sSQL +
          '         		    AND CI.ID_CREDITO = CS.ID_CESION'+ coCRLF +
          '                  	  GROUP BY CS.F_AUTORIZA, CS.ID_CESION, CS.ID_PROVEEDOR'+ coCRLF +

          '                  	UNION'+ coCRLF +

          '                  	  SELECT ''D'' GPO, CS.ID_PROVEEDOR, CS.F_AUTORIZA AS F_OPERACION, CS.ID_CESION,'+ coCRLF +
          '         			 ''COMISION POR DISPOSICION'' AS CONCEPTO, SUM(IMP_PAGADO) AS IMP_CONCEPTO, ''ABONO'' AS TIPO'+ coCRLF +
          '                  	  FROM CR_COMISION CC,'+ coCRLF +
          '         		       CR_CESION CS'+ coCRLF +
          '                  	  WHERE CS.F_AUTORIZA >= (TO_DATE('+SQLSTR(MesYear)+',''MMYYYY'')-1)+1'+ coCRLF +
          '         		    AND CS.F_AUTORIZA <= LAST_DAY(TO_DATE('+SQLSTR(MesYear)+' ,''MMYYYY''))'+ coCRLF +
          '           	  	    AND CC.SIT_COMISION <> ''CA'''+ coCRLF;
   If (Trim(sDisposicion)<>'') Then
      sSQL:= sSQL + '         		    AND CS.ID_CESION = '+ Trim(sDisposicion)+ coCRLF ;
   If (Trim(sProveedor)<>'') Then
      sSQL:= sSQL + '         		    AND CS.ID_PROVEEDOR = '+ Trim(sProveedor)+ coCRLF ;
   If Trim(sSituacion)= '0' Then
      sSQL:= sSQL + '         		    AND CS.SIT_CESION IN (''AU'') '+ coCRLF ;
   If Trim(sSituacion)= '1' Then
      sSQL:= sSQL + '         		    AND CS.SIT_CESION IN (''LQ'') '+ coCRLF ;
   If Trim(sSituacion)= '2' Then
      sSQL:= sSQL + '         		    AND CS.SIT_CESION IN (''AU'',''LQ'') '+ coCRLF ;
   If Trim(sAcreditado)<> '' Then
      sSQL:= sSQL + '         		    AND CS.ID_EMISOR ='+ Trim(sAcreditado)+ coCRLF ;

      sSQL:= sSQL +
          '         		    AND CC.ID_CREDITO = CS.ID_CESION'+ coCRLF +
          '                  	  GROUP BY CS.F_AUTORIZA, CS.ID_CESION, CS.ID_PROVEEDOR'+ coCRLF +

          '                  	UNION'+ coCRLF +

          '                  	  SELECT ''E'' GPO, CS.ID_PROVEEDOR, CS.F_AUTORIZA AS F_OPERACION, CS.ID_CESION,'+ coCRLF +
          '         			 ''IVA COMISION'' AS CONCEPTO, SUM(IMP_IVA_PAGADO) AS IMP_CONCEPTO, ''ABONO'' AS TIPO'+ coCRLF +
          '                  	  FROM CR_COMISION CC,'+ coCRLF +
          '         		       CR_CESION CS'+ coCRLF +
          '                  	  WHERE CS.F_AUTORIZA >= (TO_DATE('+SQLSTR(MesYear)+',''MMYYYY'')-1)+1'+ coCRLF +
          '         		    AND CS.F_AUTORIZA <= LAST_DAY(TO_DATE('+SQLSTR(MesYear)+' ,''MMYYYY''))'+ coCRLF +
          '           	  	    AND CC.SIT_COMISION <> ''CA'''+ coCRLF;
   If (Trim(sDisposicion)<>'') Then
      sSQL:= sSQL + '         		    AND CS.ID_CESION = '+ Trim(sDisposicion)+ coCRLF ;
   If (Trim(sProveedor)<>'') Then
      sSQL:= sSQL + '         		    AND CS.ID_PROVEEDOR = '+ Trim(sProveedor)+ coCRLF ;
   If Trim(sSituacion)= '0' Then
      sSQL:= sSQL + '         		    AND CS.SIT_CESION IN (''AU'') '+ coCRLF ;
   If Trim(sSituacion)= '1' Then
      sSQL:= sSQL + '         		    AND CS.SIT_CESION IN (''LQ'') '+ coCRLF ;
   If Trim(sSituacion)= '2' Then
      sSQL:= sSQL + '         		    AND CS.SIT_CESION IN (''AU'',''LQ'') '+ coCRLF ;
   If Trim(sAcreditado)<> '' Then
      sSQL:= sSQL + '         		    AND CS.ID_EMISOR ='+ Trim(sAcreditado)+ coCRLF ;

      sSQL:= sSQL +
          '         		    AND CC.ID_CREDITO = CS.ID_CESION'+ coCRLF +
          '                  	  GROUP BY CS.F_AUTORIZA, CS.ID_CESION, CS.ID_PROVEEDOR'+ coCRLF +

          '                  	UNION'+ coCRLF +

          '                  	  SELECT ''F'' GPO, CS.ID_PROVEEDOR, CT.F_VALOR AS F_OPERACION, CT.ID_CREDITO,'+ coCRLF +
          '         		         ''COBRO FACTURAS CESION'' AS CONCEPTO, SUM(CT.IMP_NETO) AS IMP_CONCEPTO, ''ABONO'' AS TIPO'+ coCRLF +
          '         		  FROM CR_TRANSACCION CT,'+ coCRLF +
          '         		       CR_CESION CS'+ coCRLF +
          '                  	  WHERE CT.F_VALOR >= (TO_DATE('+SQLSTR(MesYear)+',''MMYYYY'')-1)+1'+ coCRLF +
          '         		    AND CT.F_VALOR <= LAST_DAY(TO_DATE('+SQLSTR(MesYear)+' ,''MMYYYY''))'+ coCRLF +
          '         		    AND CT.SIT_TRANSACCION <> ''CA'''+ coCRLF +
          '         		    AND CT.CVE_OPERACION IN (''DEPODV'')'+ coCRLF +
          '         		    AND CT.ID_TRANS_CANCELA IS NULL'+ coCRLF;
   If (Trim(sDisposicion)<>'') Then
      sSQL:= sSQL + '         		    AND CS.ID_CESION = '+ Trim(sDisposicion)+ coCRLF ;
   If (Trim(sProveedor)<>'') Then
      sSQL:= sSQL + '         		    AND CS.ID_PROVEEDOR = '+ Trim(sProveedor)+ coCRLF ;
   If Trim(sSituacion)= '0' Then
      sSQL:= sSQL + '         		    AND CS.SIT_CESION IN (''AU'') '+ coCRLF ;
   If Trim(sSituacion)= '1' Then
      sSQL:= sSQL + '         		    AND CS.SIT_CESION IN (''LQ'') '+ coCRLF ;
   If Trim(sSituacion)= '2' Then
      sSQL:= sSQL + '         		    AND CS.SIT_CESION IN (''AU'',''LQ'') '+ coCRLF ;
   If Trim(sAcreditado)<> '' Then
      sSQL:= sSQL + '         		    AND CS.ID_EMISOR ='+ Trim(sAcreditado)+ coCRLF ;

      sSQL:= sSQL +
          '         		    AND CT.ID_CREDITO = CS.ID_CESION'+ coCRLF +
          '         		  GROUP BY CT.F_VALOR, CT.ID_CREDITO, CS.ID_PROVEEDOR'+ coCRLF +

          '                  	UNION'+ coCRLF +

          '                  	  SELECT ''G'' GPO, CS.ID_PROVEEDOR, CR.F_PAGO AS F_OPERACION, CR.ID_CESION,'+ coCRLF +
          '         			 ''DEVOLUCION AFORO'' AS CONCEPTO, SUM(IMP_REMANENTE) AS IMP_CONCEPTO, ''CARGO'' AS TIPO'+ coCRLF +
          '         		  FROM CR_REMANENTE CR,'+ coCRLF +
          '         		       CR_CESION CS'+ coCRLF +
          '                  	  WHERE CR.F_PAGO >= (TO_DATE('+SQLSTR(MesYear)+',''MMYYYY'')-1)+1'+ coCRLF +
          '         		    AND CR.F_PAGO <= LAST_DAY(TO_DATE('+SQLSTR(MesYear)+' ,''MMYYYY''))'+ coCRLF +
          '           	  	    AND CR.CVE_TIPO_REMAN = ''RE'''+ coCRLF;
   If (Trim(sDisposicion)<>'') Then
      sSQL:= sSQL + '           	  	    AND CS.ID_CESION = '+ Trim(sDisposicion)+ coCRLF ;
   If (Trim(sProveedor)<>'') Then
      sSQL:= sSQL + '           	  	    AND CS.ID_PROVEEDOR = '+ Trim(sProveedor)+ coCRLF ;
   If Trim(sSituacion)= '0' Then
      sSQL:= sSQL + '           	  	    AND CS.SIT_CESION IN (''AU'') '+ coCRLF ;
   If Trim(sSituacion)= '1' Then
      sSQL:= sSQL + '           	  	    AND CS.SIT_CESION IN (''LQ'') '+ coCRLF ;
   If Trim(sSituacion)= '2' Then
      sSQL:= sSQL + '           	  	    AND CS.SIT_CESION IN (''AU'',''LQ'') '+ coCRLF ;
   If Trim(sAcreditado)<> '' Then
      sSQL:= sSQL + '           	  	    AND CS.ID_EMISOR ='+ Trim(sAcreditado)+ coCRLF ;

      sSQL:= sSQL +
          '         		    AND CR.ID_CESION = CS.ID_CESION'+ coCRLF +
          '                  	  GROUP BY CR.F_PAGO, CR.ID_CESION, CS.ID_PROVEEDOR'+ coCRLF +

          '                  	UNION'+ coCRLF +

          '                  	  SELECT ''H'' GPO, CS.ID_PROVEEDOR, CR.F_PAGO AS F_OPERACION, CR.ID_CESION,'+ coCRLF +
          '			         ''DEVOLUCION INTERESES NO DEVENGADOS'' AS CONCEPTO, SUM(IMP_REMANENTE) AS IMP_CONCEPTO, ''CARGO'' AS TIPO'+ coCRLF +
          '         		  FROM CR_REMANENTE CR,'+ coCRLF +
          '         		       CR_CESION CS'+ coCRLF +
          '                  	  WHERE CR.F_PAGO >= (TO_DATE('+SQLSTR(MesYear)+',''MMYYYY'')-1)+1'+ coCRLF +
          '         		    AND CR.F_PAGO <= LAST_DAY(TO_DATE('+SQLSTR(MesYear)+' ,''MMYYYY''))'+ coCRLF +
          '                         AND CR.CVE_TIPO_REMAN = ''IN'''+ coCRLF;
   If (Trim(sDisposicion)<>'') Then
      sSQL:= sSQL + '           	  	    AND CS.ID_CESION = '+ Trim(sDisposicion)+ coCRLF ;
   If (Trim(sProveedor)<>'') Then
      sSQL:= sSQL + '           	  	    AND CS.ID_PROVEEDOR = '+ Trim(sProveedor)+ coCRLF ;
   If Trim(sSituacion)= '0' Then
      sSQL:= sSQL + '           	  	    AND CS.SIT_CESION IN (''AU'') '+ coCRLF ;
   If Trim(sSituacion)= '1' Then
      sSQL:= sSQL + '           	  	    AND CS.SIT_CESION IN (''LQ'') '+ coCRLF ;
   If Trim(sSituacion)= '2' Then
      sSQL:= sSQL + '           	  	    AND CS.SIT_CESION IN (''AU'',''LQ'') '+ coCRLF ;
   If Trim(sAcreditado)<> '' Then
      sSQL:= sSQL + '           	  	    AND CS.ID_EMISOR ='+ Trim(sAcreditado)+ coCRLF ;

      sSQL:= sSQL +
          '         		    AND CR.ID_CESION = CS.ID_CESION'+ coCRLF +
          '                  	  GROUP BY CR.F_PAGO, CR.ID_CESION, CS.ID_PROVEEDOR'+ coCRLF +
          '                     )C'+ coCRLF +
          ' 		   ORDER BY C.ID_PROVEEDOR, C.F_OPERACION, C.ID_CESION, C.GPO'+ coCRLF +
          ' 	       )'+ coCRLF +

          '      UNION'+ coCRLF +
          '         --------------------------------------------------------------------------------------------'+ coCRLF +
          '         --	     			INTEGRACION DE CESIONES VIGENTES'+ coCRLF +
          '         --------------------------------------------------------------------------------------------'+ coCRLF +
          '         SELECT  * FROM ('+ coCRLF +
          '         SELECT ''1'' AS GRUPO,'+ coCRLF +
          ' 		   GPO,'+ coCRLF +
          ' 		   ID_PROVEEDOR,'+ coCRLF +
          ' 		   TO_DATE(NULL) AS F_OPERACION,'+ coCRLF +
          ' 		   ID_CESION,'+ coCRLF +
          ' 		   ''''		 AS CONCEPTO,'+ coCRLF +
          ' 		   0		 AS IMP_CONCEPTO,'+ coCRLF +
          ' 		   ''''		 AS TIPO,'+ coCRLF +
          ' 		   --SEGUNDO GRUPO'+ coCRLF +
          '                TASA_APLICADA,'+ coCRLF +
          ' 		   FACTURA,'+ coCRLF +
          ' 		   F_VENCIMIENTO,'+ coCRLF +
          ' 		   PLAZO,'+ coCRLF +
          ' 		   IMP_NOMINAL,'+ coCRLF +
          ' 		   IMP_AFORO,'+ coCRLF +
          ' 		   REM_GAR,'+ coCRLF +
          ' 		   IMP_COMPRA,'+ coCRLF +
          ' 		   IMP_INTERES,'+ coCRLF +
          ' 		   --TERCER GRUPO'+ coCRLF +
          ' 		   F_COMPRA,'+ coCRLF +
          ' 		   TO_DATE(NULL) AS F_VALOR_PAGO,'+ coCRLF +
          '                0		 AS DESCTOS,'+ coCRLF +
          ' 		   0		 AS PCT, ROWNUM AS CONTADOR'+ coCRLF +
          '         FROM ( SELECT ''0V'' AS GPO,'+ coCRLF +
          '                       CS.ID_PROVEEDOR,CS.ID_CESION, CD.TASA_FONDEO AS TASA_APLICADA, CD.ID_DOCUMENTO AS FACTURA, CP.F_VENCIMIENTO,CP.PLAZO,'+ coCRLF +
          '                       CD.F_COMPRA, CD.IMP_NOMINAL, CP.IMP_CAPITAL IMP_AFORO,'+ coCRLF +
          '                 	  CD.IMP_NOMINAL - CP.IMP_CAPITAL AS REM_GAR, CD.IMP_COMPRA,'+ coCRLF +
          '                 	  CI.IMP_INTERES'+ coCRLF +
          '                 FROM CR_CESION  CS,'+ coCRLF +
          '                      CR_CREDITO CR,'+ coCRLF +
          '                 	 CR_CAPITAL CP,'+ coCRLF +
          '                 	 CR_DOCUMENTO CD,'+ coCRLF +
          '                  	 CR_INTERES CI'+ coCRLF +
          '                 WHERE CS.SIT_CESION(+) = ''AU'''+ coCRLF +
          '                   AND CP.SIT_CAPITAL(+) NOT IN (''IM'', ''LQ'', ''CA'')'+ coCRLF +
          '                   AND CI.SIT_INTERES(+) NOT IN (''IM'', ''LQ'', ''CA'')'+ coCRLF +
          '                   AND CD.SIT_DOCUMENTO(+) NOT IN (''IM'', ''LQ'', ''CA'')' + coCRLF;

   If (Trim(sDisposicion)<>'') Then
      sSQL:= sSQL + '                   AND CS.ID_CESION = '+ Trim(sDisposicion)+ coCRLF ;
   If (Trim(sProveedor)<>'') Then
      sSQL:= sSQL + '                   AND CS.ID_PROVEEDOR = '+ Trim(sProveedor)+ coCRLF ;
   If Trim(sAcreditado)<> '' Then
      sSQL:= sSQL + '                   AND CS.ID_EMISOR ='+ Trim(sAcreditado)+ coCRLF ;

      sSQL:= sSQL +
          ' 		      AND CS.ID_CESION = CR.ID_CREDITO'+ coCRLF +
          '                   AND CR.ID_CREDITO = CP.ID_CREDITO(+)'+ coCRLF +
          '                   AND CP.ID_CREDITO = CD.ID_CESION(+)'+ coCRLF +
          '                   AND CP.NUM_PERIODO = CD.NUM_PERIODO_DOC(+)'+ coCRLF +
          '                   AND CP.ID_CREDITO = CI.ID_CREDITO(+)'+ coCRLF +
          '                   AND CP.NUM_PERIODO = CI.NUM_PERIODO(+)'+ coCRLF +
          '               UNION'+ coCRLF +
          '                 SELECT ''I'' AS GPO,'+ coCRLF +
          '                 	  CS.ID_PROVEEDOR,CS.ID_CESION, CD.TASA_FONDEO AS TASA_APLICADA, CD.ID_DOCUMENTO AS FACTURA,'+ coCRLF +
          '                 	  CP.F_VENCIMIENTO,CP.PLAZO,'+ coCRLF +
          '                 	  CD.F_COMPRA, CD.IMP_NOMINAL, CP.IMP_CAPITAL IMP_AFORO,'+ coCRLF +
          '                 	  CD.IMP_NOMINAL - CP.IMP_CAPITAL AS REM_GAR, CD.IMP_COMPRA,'+ coCRLF +
          '                 	  CI.IMP_INTERES'+ coCRLF +
          '                 FROM CR_CESION  CS,'+ coCRLF +
          '                 	 CR_CREDITO CR,'+ coCRLF +
          '                 	 CR_CAPITAL CP,'+ coCRLF +
          '                 	 CR_DOCUMENTO CD,'+ coCRLF +
          '                 	 CR_INTERES CI'+ coCRLF +
          '                 WHERE CS.SIT_CESION  = ''AU'''+ coCRLF +
          '                   AND CP.SIT_CAPITAL(+) =''IM'''+ coCRLF +
          '                   AND CI.SIT_INTERES(+) = ''IM'''+coCRLF +
          '                   AND CD.SIT_DOCUMENTO(+) = ''IM''' + coCRLF;

   If (Trim(sDisposicion)<>'') Then
      sSQL:= sSQL + '                   AND CS.ID_CESION = '+ Trim(sDisposicion)+ coCRLF ;
   If (Trim(sProveedor)<>'') Then
      sSQL:= sSQL + '                   AND CS.ID_PROVEEDOR = '+ Trim(sProveedor)+ coCRLF ;
   If Trim(sAcreditado)<> '' Then
      sSQL:= sSQL + '                   AND CS.ID_EMISOR ='+ Trim(sAcreditado)+ coCRLF ;

      sSQL:= sSQL +
          '                   AND CS.ID_CESION   = CR.ID_CREDITO'+ coCRLF +
          '                   AND CR.ID_CREDITO  = CP.ID_CREDITO'+ coCRLF +
          '                   AND CP.ID_CREDITO  = CD.ID_CESION(+)'+ coCRLF +
          '                   AND CP.NUM_PERIODO = CD.NUM_PERIODO_DOC(+)'+ coCRLF +
          '                   AND CP.ID_CREDITO  = CI.ID_CREDITO(+)'+ coCRLF +
          '                   AND CP.NUM_PERIODO = CI.NUM_PERIODO(+)'+ coCRLF +
          '                 )'+ coCRLF +
          ' 		   ORDER BY GPO'+ coCRLF +
          '              )'+ coCRLF +

          '     UNION'+ coCRLF +
          '         --------------------------------------------------------------------------------------------'+ coCRLF +
          '         --	     			OPERACIONES  COBRADAS  EN  EL  MesYear (*)  ========================'+ coCRLF +
          '         --------------------------------------------------------------------------------------------'+ coCRLF +
          '         SELECT ''2''         AS GRUPO,'+ coCRLF +
          ' 		   ''''  	 AS GPO,'+ coCRLF +
          ' 		   ID_PROVEEDOR,'+ coCRLF +
          ' 		   TO_DATE(NULL) AS F_OPERACION,'+ coCRLF +
          ' 		   ID_CESION,'+ coCRLF +
          ' 		   ''''		 AS CONCEPTO,'+ coCRLF +
          ' 		   0		 AS IMP_CONCEPTO,'+ coCRLF +
          ' 		   ''''		 AS TIPO,'+ coCRLF +
          ' 		   --SEGUNDO GRUPO'+ coCRLF +
          '                0 		 AS TASA_APLICADA,'+ coCRLF +
          ' 		   ID_DOCUMENTO  AS FACTURA,'+ coCRLF +
          ' 		   F_VENCIMIENTO,'+ coCRLF +
          ' 		   0		 AS PLAZO,'+ coCRLF +
          ' 		   IMP_NOMINAL,'+ coCRLF +
          ' 		   IMP_NETO      AS IMP_AFORO,'+ coCRLF +
          ' 		   0		 AS REM_GAR,'+ coCRLF +
          ' 		   0		 AS IMP_COMPRA,'+ coCRLF +
          ' 		   0		 AS IMP_INTERES,'+ coCRLF +
          ' 		   --TERCER GRUPO'+ coCRLF +
          ' 		   F_COMPRA,'+ coCRLF +
          ' 		   F_VALOR_PAGO,'+ coCRLF +
          '                DESCTOS,'+ coCRLF +
          ' 		   PCT, ROWNUM AS CONTADOR'+ coCRLF +





{
          '         FROM ( SELECT CS.ID_PROVEEDOR, CS.ID_CESION, CD.ID_DOCUMENTO, CD.F_COMPRA, CP.F_VENCIMIENTO, CP.F_VALOR_PAGO,'+ coCRLF +
          '                       CD.IMP_NOMINAL, 0 DESCTOS, CT.IMP_NETO, (CT.IMP_NETO / CD.IMP_NOMINAL)*100 AS PCT'+ coCRLF +
          '                FROM ('+ coCRLF +
          ' 			  SELECT ID_CREDITO, ID_DOCUMENTO, F_VALOR, SUM(IMP_NETO) AS IMP_NETO'+ coCRLF +
          ' 			  FROM CR_TRANSACCION'+ coCRLF +
          '                	  WHERE F_VALOR >= (TO_DATE('+SQLSTR(MesYear)+',''MMYYYY'')-1)+1'+ coCRLF +
          '                         AND F_VALOR <= LAST_DAY(TO_DATE('+SQLSTR(MesYear)+' ,''MMYYYY''))'+ coCRLF +
          '                         AND CVE_OPERACION IN ( ''PAGOCP'', ''REMAGA'')'+ coCRLF +
          '                	      GROUP BY ID_CREDITO, ID_DOCUMENTO,F_VALOR'+ coCRLF +
          '                	) CT,'+ coCRLF +
          '                     CR_CESION CS,'+ coCRLF +
          '                	    CR_DOCUMENTO CD,'+ coCRLF +
          '                	    CR_CAPITAL CP'+ coCRLF +
          '                WHERE 1 = 1'+ coCRLF;
   If (Trim(sDisposicion)<>'') Then
      sSQL:= sSQL + '                  AND CS.ID_CESION = '+ Trim(sDisposicion)+ coCRLF ;
   If (Trim(sProveedor)<>'') Then
      sSQL:= sSQL + '                  AND CS.ID_PROVEEDOR = '+ Trim(sProveedor)+ coCRLF ;
   If Trim(sSituacion)= '0' Then
      sSQL:= sSQL + '                  AND CS.SIT_CESION IN (''AU'') '+ coCRLF ;
   If Trim(sSituacion)= '1' Then
      sSQL:= sSQL + '                  AND CS.SIT_CESION IN (''LQ'') '+ coCRLF ;
   If Trim(sSituacion)= '2' Then
      sSQL:= sSQL + '                  AND CS.SIT_CESION IN (''AU'',''LQ'') '+ coCRLF ;
   If Trim(sAcreditado)<> '' Then
      sSQL:= sSQL + '                  AND CS.ID_EMISOR ='+ Trim(sAcreditado)+ coCRLF ;

      sSQL:= sSQL +
          ' 		     AND CT.ID_CREDITO = CS.ID_CESION'+ coCRLF +
          '                  AND CT.ID_DOCUMENTO = CD.ID_DOCUMENTO'+ coCRLF +
          '                  AND CS.ID_CESION = CP.ID_CREDITO'+ coCRLF +
          '                  AND CP.ID_CREDITO = CD.ID_CESION'+ coCRLF +
          '                  AND CP.NUM_PERIODO = CD.NUM_PERIODO_DOC'+ coCRLF +
          '              )'+ coCRLF +     }


          '         FROM ( SELECT CS.ID_PROVEEDOR, CS.ID_CESION, CD.ID_DOCUMENTO, CD.F_COMPRA, NVL(CP.F_VENCIMIENTO,CI.F_VENCIMIENTO) AS F_VENCIMIENTO, CT.F_VALOR AS F_VALOR_PAGO,'+ coCRLF +
          '                       CD.IMP_NOMINAL, 0 DESCTOS, CT.IMP_NETO,  CT.IMP_INTERES  AS PCT'+ coCRLF +
          '                FROM (SELECT  BASET.*, BASEC.CONCEPTO AS CONCEPTOC, NVL(BASEC.IMP_NETO,0) AS IMP_NETO, BASEI.CONCEPTO  AS CONCEPTOI, NVL(BASEI.IMP_INTERES,0) AS IMP_INTERES'+ coCRLF +
          '                      FROM (SELECT ID_CREDITO, ID_DOCUMENTO, CT.F_VALOR, ID_PERIODO'+ coCRLF +
          '                            FROM   CR_TRANSACCION CT'+ coCRLF +
          '                            WHERE  CT.F_VALOR >= (TO_DATE('+SQLSTR(MesYear)+',''MMYYYY'')-1)+1'+ coCRLF +
          '                            AND    CT.F_VALOR <= LAST_DAY(TO_DATE('+SQLSTR(MesYear)+' ,''MMYYYY''))'+ coCRLF +
          '                            AND    CT.CVE_OPERACION IN ( ''PAGOCP'',''PAGOIN'', ''REMAGA'')'+ coCRLF ;

   If (Trim(sDisposicion)<>'') Then
      sSQL:= sSQL + '                  AND    CT.ID_CREDITO = '+ Trim(sDisposicion)+ coCRLF ;

      sSQL:= sSQL +
          '                            AND    CT.SIT_TRANSACCION = ''AC'''+ coCRLF +
          '                            AND    CT.ID_TRANS_CANCELA IS NULL'+ coCRLF +
          '                            GROUP BY ID_CREDITO, ID_DOCUMENTO,CT.F_VALOR, ID_PERIODO) BASET,'+ coCRLF +
          '                           (SELECT CT.F_VALOR, ''CAPITAL'' AS CONCEPTO, SUM(IMP_NETO)  AS IMP_NETO'+ coCRLF +
          '                            FROM   CR_TRANSACCION CT'+ coCRLF +
          '                            WHERE  CT.F_VALOR >= (TO_DATE('+SQLSTR(MesYear)+',''MMYYYY'')-1)+1'+ coCRLF +
          '                            AND    CT.F_VALOR <= LAST_DAY(TO_DATE('+SQLSTR(MesYear)+' ,''MMYYYY''))'+ coCRLF +
          '                            AND    CT.CVE_OPERACION IN ( ''PAGOCP'',''REMAGA'')'+ coCRLF ;

   If (Trim(sDisposicion)<>'') Then
      sSQL:= sSQL + '                  AND    CT.ID_CREDITO = '+ Trim(sDisposicion)+ coCRLF ;

      sSQL:= sSQL +
          '                            AND    CT.SIT_TRANSACCION = ''AC'''+ coCRLF +
          '                            AND    CT.ID_TRANS_CANCELA IS NULL'+ coCRLF +
          '                            GROUP BY CT.F_VALOR) BASEC,'+ coCRLF +
          '                           (SELECT CT.F_VALOR, ''INTERES'' AS CONCEPTO, SUM(IMP_NETO)  AS IMP_INTERES'+ coCRLF +
          '                            FROM   CR_TRANSACCION CT'+ coCRLF +
          '                            WHERE  CT.F_VALOR >= (TO_DATE('+SQLSTR(MesYear)+',''MMYYYY'')-1)+1'+ coCRLF +
          '                            AND    CT.F_VALOR <= LAST_DAY(TO_DATE('+SQLSTR(MesYear)+' ,''MMYYYY''))'+ coCRLF +
          '                            AND    CT.CVE_OPERACION IN ( ''PAGOIN'')'+ coCRLF ;

   If (Trim(sDisposicion)<>'') Then
      sSQL:= sSQL + '                  AND    CT.ID_CREDITO = '+ Trim(sDisposicion)+ coCRLF ;

      sSQL:= sSQL +
          '                            AND    CT.SIT_TRANSACCION = ''AC'''+ coCRLF +
          '                            AND    CT.ID_TRANS_CANCELA IS NULL'+ coCRLF +
          '                            GROUP BY CT.F_VALOR) BASEI'+ coCRLF +
          '                      WHERE	BASEC.F_VALOR (+)=  BASET.F_VALOR'+ coCRLF +
          '                      AND  	BASEI.F_VALOR (+)=  BASET.F_VALOR ) CT,'+ coCRLF +
          '                      CR_CESION CS,'+ coCRLF +
          '                      CR_DOCUMENTO CD,'+ coCRLF +
          '                     (SELECT ''CAPITAL'' AS CONCEPTO, CR_CAPITAL.* FROM CR_CAPITAL) CP,'+ coCRLF +
          '                     (SELECT ''INTERES'' AS CONCEPTO, CR_INTERES.* FROM CR_INTERES) CI'+ coCRLF +
          '                WHERE 1 = 1'+ coCRLF ;

   If (Trim(sDisposicion)<>'') Then
      sSQL:= sSQL + '                  AND CS.ID_CESION = '+ Trim(sDisposicion)+ coCRLF ;
   If (Trim(sProveedor)<>'') Then
      sSQL:= sSQL + '                  AND CS.ID_PROVEEDOR = '+ Trim(sProveedor)+ coCRLF ;
   If Trim(sSituacion)= '0' Then
      sSQL:= sSQL + '                  AND CS.SIT_CESION IN (''AU'') '+ coCRLF ;
   If Trim(sSituacion)= '1' Then
      sSQL:= sSQL + '                  AND CS.SIT_CESION IN (''LQ'') '+ coCRLF ;
   If Trim(sSituacion)= '2' Then
      sSQL:= sSQL + '                  AND CS.SIT_CESION IN (''AU'',''LQ'') '+ coCRLF ;
   If Trim(sAcreditado)<> '' Then
      sSQL:= sSQL + '                  AND CS.ID_EMISOR ='+ Trim(sAcreditado)+ coCRLF ;

      sSQL:= sSQL +
          '                AND CT.ID_CREDITO = CS.ID_CESION'+ coCRLF +
          '                AND CT.ID_CREDITO   = CD.ID_CESION'+ coCRLF +
          '                AND CT.ID_DOCUMENTO = CD.ID_DOCUMENTO'+ coCRLF +
          '                AND CP.ID_CREDITO (+)= CT.ID_CREDITO'+ coCRLF +
          '                AND CP.NUM_PERIODO    (+)= CT.ID_PERIODO'+ coCRLF +
          '                AND CP.CONCEPTO   (+)= CT.CONCEPTOC'+ coCRLF +
          '                AND CI.ID_CREDITO (+)= CT.ID_CREDITO'+ coCRLF +
          '                AND CI.NUM_PERIODO (+)= CT.ID_PERIODO'+ coCRLF +
          '                AND CI.CONCEPTO    (+)= CT.CONCEPTOI'+ coCRLF +




          '    )	 ) DET'+ coCRLF +
          ' WHERE 1= 1 '+ coCRLF;

   If (Trim(sDisposicion)<>'') Then
      sSQL:= sSQL + '   AND CR.ID_CREDITO = '+ Trim(sDisposicion)+ coCRLF ;
   If (Trim(sGpoProd)<>'') Then
      sSQL:= sSQL + '   AND PRO.CVE_PRODUCTO_GPO ='''+ Trim(sGpoProd) +''''+ coCRLF ;
   If (Trim(sProducto)<>'') Then
      sSQL:= sSQL + '   AND PRO.CVE_PRODUCTO_CRE ='''+ Trim(sProducto) +''''+ coCRLF ;
   If Trim(sSituacion)= '0' Then
      sSQL:= sSQL + '     AND CR.SIT_CREDITO IN (''AC'') '+ coCRLF ;
   If Trim(sSituacion)= '1' Then
      sSQL:= sSQL + '     AND CR.SIT_CREDITO IN (''LQ'') '+ coCRLF ;
   If Trim(sSituacion)= '2' Then
      sSQL:= sSQL + '     AND CR.SIT_CREDITO IN (''AC'',''LQ'') '+ coCRLF ;
   If Trim(sAcreditado)<> '' Then
      sSQL:= sSQL + '     AND CTO.ID_TITULAR ='+ Trim(sAcreditado)+ coCRLF ;
   If Trim(sPromAsoc)<> '' Then
      sSQL:= sSQL + '     AND CTO.ID_PERS_ASOCIAD ='+ Trim(sPromAsoc)+ coCRLF ;
   If Trim(sPromAdm)<> '' Then
      sSQL:= sSQL + '     AND CR.ID_PROM_ADM ='+ Trim(sPromAdm)+ coCRLF ;
   If Trim(sEmpresa)<> '' Then
      sSQL:= sSQL + '     AND PRO.ID_EMPRESA ='+ Trim(sEmpresa)+ coCRLF ;

      sSQL:= sSQL +
          '   AND DET.ID_CESION        = CR.ID_CREDITO'+ coCRLF +
          '   AND CR.ID_CONTRATO       = CTO.ID_CONTRATO'+ coCRLF +
          '   AND CR.ID_CONTRATO       = CCTO.ID_CONTRATO'+ coCRLF +
          '   AND CR.FOL_CONTRATO      = CCTO.FOL_CONTRATO'+ coCRLF +
          '   AND PRO.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE'+ coCRLF +
          '   AND M.CVE_MONEDA         = CTO.CVE_MONEDA'+ coCRLF +
          '   AND P.ID_PERSONA         = R.ID_PERSONA'+ coCRLF +
          '   AND P.ID_DOMICILIO       = D.ID_DOMICILIO'+ coCRLF +
          '   AND P.ID_PERSONA         = DET.ID_PROVEEDOR'+ coCRLF +
          '   AND D.CVE_CIUDAD         = POBCD.CVE_POBLACION'+ coCRLF +
          '   AND D.CVE_ESTADO         = EDO.CVE_POBLACION'+ coCRLF +
          '   AND D.CVE_PAIS           = PAIS.CVE_POBLACION'+ coCRLF;
//          ' ORDER BY DET.ID_PROVEEDOR, DET.GRUPO,DET.F_OPERACION/*, DET.ID_CESION, DET.GPO*/'+ coCRLF ;
//////////////////// ASTECI LIEF 08/09/09 INICIO ///////////////////////////////
// Se comentó la línea de código y se agregó el campo CR.ID_CREDITO al order by
// para que ordene los datos por número de crédito
//          ' ORDER BY DET.ID_PROVEEDOR, DET.GRUPO,DET.F_OPERACION/*, DET.ID_CESION, DET.GPO*/,CR.ID_CREDITO'+ coCRLF ;
//////////////////// ASTECI LIEF 22/09/09 INICIO ///////////////////////////////
// Se comentó la línea de código y se agregó el campo CR.ID_CREDITO al order by
// para que ordene los datos por número de crédito
          if vlOrdena = '0' then
            sSQL:= sSQL +
            ' ORDER BY P.NOMBRE, DET.ID_PROVEEDOR, DET.GRUPO,DET.F_OPERACION/*, DET.ID_CESION, DET.GPO*/,CR.ID_CREDITO'+ coCRLF
          else
            sSQL:= sSQL +
            ' ORDER BY D.CODIGO_POSTAL,DET.ID_PROVEEDOR, DET.GRUPO,DET.F_OPERACION/*, DET.ID_CESION, DET.GPO*/,CR.ID_CREDITO'+ coCRLF ;
//////////////////// ASTECI  LIEF 22/09/09 FINAL ///////////////////////////////
//////////////////// ASTECI  LIEF 08/09/09 FINAL ///////////////////////////////
   Result:= sSQL;
end;

procedure TQrEdoCtaDM.HabilitaGrupos;
begin
  If qyQuery.FieldByName('GRUPO').AsInteger = 0 Then Begin
    QRGrupoOperCte.Enabled:= True;
    QRGroupOperMes.Enabled:= True;
    QRGroupDET_OPER.Enabled:= True;
    QRFOOTPROV.Enabled:= True;

    qbGPO_VIGENTE.Enabled:= False;
    qbTOT_VIGENTE.Enabled:= False;
    qbGPO_CES_VIG.Enabled:= False;
    qbgPO_FAC_VIG.Enabled:= False;
    chbFAC_VIG.Enabled:= False;
    qbTOT_CES_VIG.Enabled:= False;

    qbGPO_IMPAG.Enabled:= False;
    qbTOT_IMPAGADA.Enabled:= False;
    bqGPO_CES_IMP.Enabled:= False;
    qbGPO_FACT_IMP.Enabled:= False;
    chbFAC_IMP.Enabled:= False;
    qbTOT_CES_IMP.Enabled:= False;


    QRGroupGPO_TRANSAC.Enabled:= False;
    QRGroupGPO_FOPERA.Enabled:= False;
    DetailBandDET_TRANSAC.Enabled:= False;
    qbCOBRADO.Enabled:= False;
    qbCobFactura.Enabled:= False;

  End
  Else If ( qyQuery.FieldByName('GRUPO').AsInteger = 1 )then Begin
    QRGrupoOperCte.Enabled:= False;
    QRGroupOperMes.Enabled:= False;
    QRGroupDET_OPER.Enabled:= False;
    QRFOOTPROV.Enabled:= False;

     If ( qyQuery.FieldByName('GPO').AsString = '0V' )then Begin
        qbGPO_VIGENTE.Enabled:= True;
        IF ( qyQuery.FieldByName('COUNT_VIG').AsInteger > 0 )then Begin
           qbTOT_VIGENTE.Enabled:= True;
           qbGPO_CES_VIG.Enabled:= True;
           qbGPO_FAC_VIG.Enabled:= True;
           chbFAC_VIG.Enabled:= True;
           qbTOT_CES_VIG.Enabled:= True;
        end
        ELSE BEGIN
           qbTOT_VIGENTE.Enabled:= False;
           qbGPO_CES_VIG.Enabled:= False;
           qbGPO_FAC_VIG.Enabled:= False;
           chbFAC_VIG.Enabled:= False;
           qbTOT_CES_VIG.Enabled:= False;
        END;

        qbGPO_IMPAG.Enabled:= False;
        qbTOT_IMPAGADA.Enabled:= False;
        bqGPO_CES_IMP.Enabled:= False;
        qbGPO_FACT_IMP.Enabled:= False;
        chbFAC_IMP.Enabled:= False;
        qbTOT_CES_IMP.Enabled:= False;
     end
     else begin
        qbGPO_VIGENTE.Enabled:= False;
        qbTOT_VIGENTE.Enabled:= False;
        qbGPO_CES_VIG.Enabled:= False;
        qbgPO_FAC_VIG.Enabled:= False;
        chbFAC_VIG.Enabled:= False;
        qbTOT_CES_VIG.Enabled:= False;

        qbGPO_IMPAG.Enabled:= True;
        qbTOT_IMPAGADA.Enabled:= True;
        bqGPO_CES_IMP.Enabled:= True;
        qbGPO_FACT_IMP.Enabled:= True;
        chbFAC_IMP.Enabled:= True;
        qbTOT_CES_IMP.Enabled:= True;
     end;

    QRGroupGPO_TRANSAC.Enabled:= False;
    QRGroupGPO_FOPERA.Enabled:= False;
    DetailBandDET_TRANSAC.Enabled:= False;
    qbCOBRADO.Enabled:= False;
    qbCobFactura.Enabled:= False;
  End
  Else If ( qyQuery.FieldByName('GRUPO').AsInteger = 2 )then Begin
    QRGrupoOperCte.Enabled:= False;
    QRGroupOperMes.Enabled:= False;
    QRGroupDET_OPER.Enabled:= False;
    QRFOOTPROV.Enabled:= False;

    qbGPO_VIGENTE.Enabled:= False;
    qbTOT_VIGENTE.Enabled:= False;
    qbGPO_CES_VIG.Enabled:= False;
    qbgPO_FAC_VIG.Enabled:= False;
    chbFAC_VIG.Enabled:= False;
    qbTOT_CES_VIG.Enabled:= False;

    qbGPO_IMPAG.Enabled:= False;
    qbTOT_IMPAGADA.Enabled:= False;
    bqGPO_CES_IMP.Enabled:= False;
    qbGPO_FACT_IMP.Enabled:= False;
    chbFAC_IMP.Enabled:= False;
    qbTOT_CES_IMP.Enabled:= False;

    QRGroupGPO_TRANSAC.Enabled:= True;
    QRGroupGPO_FOPERA.Enabled:= True;
    DetailBandDET_TRANSAC.Enabled:= True;
    qbCOBRADO.Enabled:= True;
    qbCobFactura.Enabled:= True;
  End;
end;

procedure TQrEdoCtaDM.ProductoCtoIVA(PPIDContrato: Integer; var pBAplicaIVA: String; var PctIVA: Double);
var qyQuery : TQuery;
    sSQL    : String;
begin
  sSQL := ' select PKGIMPUESTO.ObtPctIVA(CT.ID_CONTRATO) AS PCT_IVA, ' +
         ' PR.B_APLICA_IVA ' +
         ' FROM  (SELECT * FROM CR_CONTRATO WHERE ID_CONTRATO = ' + IntToStr(PPIDContrato) + ') CT, ' +
         '        CR_PRODUCTO PR ' +
         ' WHERE  PR.CVE_PRODUCTO_CRE = CT.CVE_PRODUCTO_CRE ';
  qyQuery:= GetSQLQuery(sSQL, APli.DataBaseName, APli.SessionName, False);
  try
    If qyQuery <> Nil Then
    Begin
         pBAplicaIVA := qyQuery.FieldByName('B_APLICA_IVA').AsString;
         PctIVA := qyQuery.FieldByName('PCT_IVA').AsFloat;
    end
    else
    begin
         pBAplicaIVA := 'F';
         PctIVA := 0;
    end;
  finally
        qyQuery.Free;
  end;
end;

procedure TQrEdoCtaDM.qbGPO_CES_VIGBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
HabilitaGrupos;
  vgCesion:= qyQuery.FieldByName('ID_CESION').AsInteger;
  vgTVigNom := 0; vgTVigAforo := 0;vgTVigCompra := 0;vgTVigGar := 0;vgTVigInt := 0;
end;

procedure TQrEdoCtaDM.qbGPO_IMPAGBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  HabilitaGrupos;
  qbTOT_CES_VIG.Enabled:= False;
  qbTOT_VIGENTE.Enabled:= False;
  vgTotNom := 0;
  vgTotAforo := 0;
  vgTotCompra := 0;
  vgTotRem := 0;
  vgTotInt := 0;
end;

procedure TQrEdoCtaDM.qbGPO_VIGENTEBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  HabilitaGrupos;
  qrlTasa.Caption := qyQuery.FieldByName('TASA_APLICADA').AsString;
  vgTotVigNom := 0; vgTotVigAforo := 0;vgTotVigCompra := 0;vgTotVigGar := 0;vgTotVigInt := 0;
end;

procedure TQrEdoCtaDM.QRGpoTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRGrupoOperCte.Enabled:= True;
  //TOTAL VIGENTE
  vgTVigNom   := 0; vgTVigAforo   := 0;vgTVigCompra   := 0;vgTVigGar   := 0;vgTVigInt   := 0;
  vgTotVigNom := 0; vgTotVigAforo := 0;vgTotVigCompra := 0;vgTotVigGar := 0;vgTotVigInt := 0;

  //TOTAL IMPAGADO
  vgTotPago  := 0;
  vgTotCobro := 0;
  vgTotCesNom := 0;
  vgTotCesAforo := 0;
  vgTotCesCompra := 0;
  vgTotCesRem := 0;
  vgTotCesInt := 0;
  vgTotNom := 0;
  vgTotAforo := 0;
  vgTotCompra := 0;
  vgTotRem := 0;
  vgTotInt := 0;

  vgCesion := 0;
  //TOTALES COBRADOS
  vgTCOB_NOMINAL := 0;
  vgTCOB_bonif := 0;
  vgTCOB_COBRADO := 0;
end;

procedure TQrEdoCtaDM.QRGroupDET_OPERBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qyQuery.FieldByName('TIPO').AsString = 'CARGO' then
  Begin
     QRDBPAGOS.Enabled := False;
     QRDBCOBRO.Enabled := True;
     vgTotCobro := vgTotCobro + qyQuery.FieldByName('IMP_CONCEPTO').AsFloat;
  end
  else
  Begin
     QRDBPAGOS.Enabled := True;
     QRDBCOBRO.Enabled := False;
     vgTotPago  := vgTotPago + qyQuery.FieldByName('IMP_CONCEPTO').AsFloat;
  end;
end;

procedure TQrEdoCtaDM.QRGroupGPO_FOPERABeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  HabilitaGrupos;
  QRGroupGPO_TRANSAC.Enabled:= False;
  qbCOBRADO.Enabled:= False;
  qbCobFactura.Enabled:= False;
end;

procedure TQrEdoCtaDM.QRGroupGPO_TRANSACBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  HabilitaGrupos;
  qbTOT_VIGENTE.Enabled:= False;
end;

procedure TQrEdoCtaDM.QRGroupOperMesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  HabilitaGrupos;
end;

procedure TQrEdoCtaDM.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRGrupoOperCte.Enabled:= True;
  QRGroupOperMes.Enabled:= True;
  QRGroupDET_OPER.Enabled:= True;

  qbGPO_VIGENTE.Enabled:= True;
  qbTOT_VIGENTE.Enabled:= True;
  qbGPO_CES_VIG.Enabled:= True;
  qbGPO_FAC_VIG.Enabled:= True;
  chbFAC_VIG.Enabled:= True;
  qbTOT_CES_VIG.Enabled:= True;

  qbGPO_IMPAG.Enabled:= True;
  qbTOT_IMPAGADA.Enabled:= True;
  bqGPO_CES_IMP.Enabled:= True;
  qbGPO_FACT_IMP.Enabled:= True;
  chbFAC_IMP.Enabled:= True;
  qbTOT_CES_IMP.Enabled:= True;


  QRGroupGPO_TRANSAC.Enabled:= True;
  QRGroupGPO_FOPERA.Enabled:= True;
  DetailBandDET_TRANSAC.Enabled:= True;
  qbCOBRADO.Enabled:= True;
  qbCobFactura.Enabled:= true;
end;

procedure TQrEdoCtaDM.qbgPO_FAC_VIGBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  HabilitaGrupos;
  qbGPO_VIGENTE.Enabled:= False;
  IF qyQueryID_CESION.AsInteger <> vgCesion then Begin
    vgTotCesNom := 0;
    vgTotCesAforo := 0;
    vgTotCesCompra := 0;
    vgTotCesRem := 0;
    vgTotCesInt := 0;
  end;
end;

procedure TQrEdoCtaDM.QRFOOTPROVBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLTOTCOBRO.Caption := FormatFloat('###,###,###,###,##0.00',vgTotCobro);
  QRLTOTPAGO.Caption := FormatFloat('###,###,###,###,##0.00',vgTotPago);
end;

procedure TQrEdoCtaDM.QRTITULOREPBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  vgTotPago  := 0;
  vgTotCobro := 0;
end;

procedure TQrEdoCtaDM.qbTOT_CES_IMPBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qbTOT_VIGENTE.Enabled:= False;
  qrlCES_NOM.Caption := FormatFloat('###,###,###,###,##0.00',vgTotCesNom);
//  qrlCES_AFORO.Caption := FormatFloat('###,###,###,###,##0.00',vgTotCesAforo);
  qrlCES_COMPRA.Caption := FormatFloat('###,###,###,###,##0.00',vgTotCesCompra);
//  qrlCES_REM.Caption := FormatFloat('###,###,###,###,##0.00',vgTotCesRem);
  qrlCES_INT.Caption := FormatFloat('###,###,###,###,##0.00',vgTotCesInt);
end;

procedure TQrEdoCtaDM.qbTOT_IMPAGADABeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qbTOT_VIGENTE.Enabled:= False;
  qrlTOT_NOM.Caption := FormatFloat('###,###,###,###,##0.00',vgTotNom);
//  qrlTOT_AFORO.Caption := FormatFloat('###,###,###,###,##0.00',vgTotAforo);
  qrlTOT_COMPRA.Caption := FormatFloat('###,###,###,###,##0.00',vgTotCompra);
//  qrlTOT_REM.Caption := FormatFloat('###,###,###,###,##0.00',vgTotRem);
  qrlTOT_INT.Caption := FormatFloat('###,###,###,###,##0.00',vgTotInt);
end;

procedure TQrEdoCtaDM.DetailBandDET_TRANSACBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  vgContador: Integer;
begin
  inc(vgContador);
  vgTCOB_NOMINAL := vgTCOB_NOMINAL + qyQuery.FieldByName('IMP_NOMINAL').AsFloat;
  vgTCOB_bonif := vgTCOB_bonif + qyQuery.FieldByName('DESCTOS').AsFloat;
  vgTCOB_COBRADO := vgTCOB_COBRADO + qyQuery.FieldByName('IMP_AFORO').AsFloat;
end;

procedure TQrEdoCtaDM.qbCOBRADOBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrTCOB_NOMINAL.Caption := FormatFloat('###,###,###,###,##0.00',vgTCOB_NOMINAL);
  qrTCOB_BONIF.Caption := FormatFloat('###,###,###,###,##0.00',vgTCOB_bonif);
  qrTCOB_COBRADO.Caption := FormatFloat('###,###,###,###,##0.00',vgTCOB_COBRADO);
end;

procedure TQrEdoCtaDM.qbTOT_CES_VIGBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrTVIG_NOM.Caption := FormatFloat('###,###,###,###,##0.00',vgTVigNom);
  qrTVIG_AFORO.Caption := FormatFloat('###,###,###,###,##0.00',vgTVigAforo);
  qrTVIG_COMPRA.Caption := FormatFloat('###,###,###,###,##0.00',vgTVigCompra);
  qrTVIG_GAR.Caption := FormatFloat('###,###,###,###,##0.00',vgTVigGar);
  qrTVIG_INT.Caption := FormatFloat('###,###,###,###,##0.00',vgTVigInt);
end;

procedure TQrEdoCtaDM.qbTOT_VIGENTEBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrTOT_VIG_NOM.Caption := FormatFloat('###,###,###,###,##0.00',vgTotVigNom);
  qrTOT_VIG_AFORO.Caption := FormatFloat('###,###,###,###,##0.00',vgTotVigAforo);
  qrTOT_VIG_COMPRA.Caption := FormatFloat('###,###,###,###,##0.00',vgTotVigCompra);
  qrTOT_VIG_GAR.Caption := FormatFloat('###,###,###,###,##0.00',vgTotVigGar);
  qrTOT_VIG_INT.Caption := FormatFloat('###,###,###,###,##0.00',vgTotVigInt);
end;

procedure TQrEdoCtaDM.qbGPO_FACT_IMPBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  HabilitaGrupos;
  qbTOT_VIGENTE.Enabled:= False;
  qbTOT_CES_VIG.Enabled:= False;
  qbGPO_IMPAG.Enabled:= False;
  qbTOT_CES_IMP.Enabled:= True;
  qbTOT_IMPAGADA.Enabled:= False;
  vgCesion:= qyQuery.FieldByName('ID_CESION').AsInteger
end;

procedure TQrEdoCtaDM.qbCobFacturaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  HabilitaGrupos;
  qbCOBRADO.Enabled := False;
end;

procedure TQrEdoCtaDM.QRlblFolioMesPrint(sender: TObject; var Value: String);
var
  VL_Contador:Integer;
begin
  //AQUI PONER RUTINA DE CONTEO DE FACTURAS 
end;

end.
