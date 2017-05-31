unit IntMQrInfCobr;
interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, unSQL2;
Const
   coCRLF      = #13#10;
type
  TQrInfCobr = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    Etiqueta1: TQRLabel;
    QRShape4: TQRShape;
    QRLabel17: TQRLabel;
    qrshINT: TQRShape;
    QRLabel20: TQRLabel;
    QRShape7: TQRShape;
    QRLabel22: TQRLabel;
    qrbDETALLE: TQRBand;
    QRFooterMoneda: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    qrdbF_OPERA: TQRDBText;
    QRDBTSituacion: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    qrexpTOT_IVA_ANT: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    qrshMORFN: TQRShape;
    qrshIVAINT: TQRShape;
    qrshMORCN: TQRShape;
    qrshTIPOCAMBIO: TQRShape;
    qrshBENGOB: TQRShape;
    qrshIVAMOR: TQRShape;
    qrshIVACN: TQRShape;
    qrshF_OPERA: TQRShape;
    qrshUSUARIO: TQRShape;
    qrlMORFN: TQRLabel;
    qrlMORCN: TQRLabel;
    qrlIVAINT: TQRLabel;
    qrlIVACN: TQRLabel;
    qrlIVAMOR: TQRLabel;
    qrlBENGOB: TQRLabel;
    qrlTIPOCAMBIO: TQRLabel;
    qrlUSUARIO: TQRLabel;
    qrlF_OPERA: TQRLabel;
    QRFooterCesion: TQRBand;
    QRFooterProducto: TQRBand;
    QRFooterPromotor: TQRBand;
    QRLProveedor: TQRLabel;
    dbIdProveedor: TQRDBText;
    dbNomProveedor: TQRDBText;
    qrdbUSUARIO: TQRDBText;
    QRDBText18: TQRDBText;
    qrdbIMPBRUCN: TQRDBText;
    qrdbIMPIVACN: TQRDBText;
    qrdbIMPIVAIN: TQRDBText;
    qrdbBENGOB: TQRDBText;
    qrdbIMPIVAMOR: TQRDBText;
    qrdbTIPOCAMBIO: TQRDBText;
    QRExprIMPMORCP2: TQRExpr;
    QRExprIMPMORFN2: TQRExpr;
    QRExprIMPMORCN2: TQRExpr;
    QRExprIMPIVAIN2: TQRExpr;
    QRExprIMPIVACN2: TQRExpr;
    QRExprIMPMORCP5: TQRExpr;
    QRExprIMPMORFN5: TQRExpr;
    QRExprIMPMORCN5: TQRExpr;
    QRExprIMPIVACN5: TQRExpr;
    QRExprIMPMORCP6: TQRExpr;
    QRExprIMPMORFN6: TQRExpr;
    QRExprIMPIVACN6: TQRExpr;
    QRExprIMPMORCP8: TQRExpr;
    QRExprIMPMORFN8: TQRExpr;
    QRExprIMPMORCN8: TQRExpr;
    QRExprIMPIVACN8: TQRExpr;
    QRExprIMPIVAMOR8: TQRExpr;
    QRExprTOTAL_B8: TQRExpr;
    QRExprTotal8: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    qrshIVA: TQRShape;
    qrlIVA: TQRLabel;
    QRShape24: TQRShape;
    QRDBText9: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText15: TQRDBText;
    QRShape27: TQRShape;
    dbNombre_Promotor: TQRDBText;
    dbNom_Promotor: TQRDBText;
    qrlPromotor: TQRLabel;
    QRShape28: TQRShape;
    QRLabel2: TQRLabel;
    dbProducto: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel4: TQRLabel;
    dbMoneda: TQRDBText;
    QRShape30: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape31: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText31: TQRDBText;
    QRShape33: TQRShape;
    QRLabel52: TQRLabel;
    QRDBText38: TQRDBText;
    QRBFootSector: TQRBand;
    QRLabel1: TQRLabel;
    QRGroupMoneda: TQRGroup;
    QRGroupSector: TQRGroup;
    QRGroupPromotor1: TQRGroup;
    QRGroupTipoProducto: TQRGroup;
    QRGrupoTitular: TQRGroup;
    QRSubDiv: TQRGroup;
    QRGroupCesion: TQRGroup;
    QRLabel41: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText14: TQRDBText;
    qrdbF_VALOR: TQRDBText;
    QRFootSubDiv: TQRBand;
    QRLabel26: TQRLabel;
    qrshMORCP: TQRShape;
    qrlMORCP: TQRLabel;
    qrshMORAS: TQRShape;
    qrlMORAS: TQRLabel;
    qrshIMPCN: TQRShape;
    qrlIMPCN: TQRLabel;
    QRDBText3: TQRDBText;
    qrdbIMPMORCP: TQRDBText;
    qrdbIMPMORFN: TQRDBText;
    qrdbIMPMORCN: TQRDBText;
    qrshTOTAL: TQRShape;
    qrlTOTAL: TQRLabel;
    QRExprIMPIVAMOR2: TQRExpr;
    QRExprIMPIVAMOR5: TQRExpr;
    QRExprIMPIVAMOR6: TQRExpr;
    QRExprTOTAL_B2: TQRExpr;
    QRExprTOTAL_B5: TQRExpr;
    QRExprTOTAL_B6: TQRExpr;
    QRExprTotal2: TQRExpr;
    QRExprTotal5: TQRExpr;
    QRExprTotal6: TQRExpr;
    QRExprIMPMORCP3: TQRExpr;
    QRExprIMPMORFN3: TQRExpr;
    QRExprIMPMORCN3: TQRExpr;
    QRExprIMPMORCN6: TQRExpr;
    QRExprIMPIVAIN3: TQRExpr;
    QRExprIMPIVAIN5: TQRExpr;
    QRExprIMPIVAIN6: TQRExpr;
    QRExprIMPIVAIN8: TQRExpr;
    QRExprIMPIVACN3: TQRExpr;
    QRExprIMPIVAMOR3: TQRExpr;
    QRExprTOTAL_B3: TQRExpr;
    QRExprTotal3: TQRExpr;
    QRFooterTitular: TQRBand;
    QRExprIMPMORCP4: TQRExpr;
    QRExprIMPMORFN4: TQRExpr;
    QRExprIMPMORCN4: TQRExpr;
    QRExprIMPIVAIN4: TQRExpr;
    QRExprIMPIVACN4: TQRExpr;
    QRLabel21: TQRLabel;
    QRExprIMPIVAMOR4: TQRExpr;
    QRExprTOTAL_B4: TQRExpr;
    QRExprTotal4: TQRExpr;
    QRDBTConcepto: TQRDBText;
    QRDBTCredito: TQRDBText;
    QRGroupMovto: TQRGroup;
    QRFooterMovto: TQRBand;
    QRExpr104: TQRExpr;
    QRExpr105: TQRExpr;
    QRExprIMPBRUCN1: TQRExpr;
    QRExprIMPMORCP1: TQRExpr;
    QRExprIMPMORFN1: TQRExpr;
    QRExprIMPMORCN1: TQRExpr;
    QRExprIMPIVAIN1: TQRExpr;
    QRExprIMPIVACN1: TQRExpr;
    QRLabel57: TQRLabel;
    QRExpr113: TQRExpr;
    QRExprIMPIVAMOR1: TQRExpr;
    QRExprTOTAL_B1: TQRExpr;
    QRExprTotal1: TQRExpr;
    QRShape10: TQRShape;
    QRLabel42: TQRLabel;
    QRDBText20: TQRDBText;
    qyInfCobranza: TQuery;
    qyInfCobranzaID_PERIODO: TFloatField;
    qyInfCobranzaTIPO_CAMBIO: TFloatField;
    qyInfCobranzaCVE_USU_ALTA: TStringField;
    qyInfCobranzaSIT_TRANSACCION: TStringField;
    qyInfCobranzaCVE_TIPO_MOVTO: TStringField;
    qyInfCobranzaCONCEPTO: TStringField;
    qyInfCobranzaCVE_MONEDA: TFloatField;
    qyInfCobranzaDESC_MONEDA: TStringField;
    qyInfCobranzaID_PROM_ADM: TFloatField;
    qyInfCobranzaNOM_PROMOTOR_ADM: TStringField;
    qyInfCobranzaID_PERS_ASOCIAD: TFloatField;
    qyInfCobranzaNOM_PROMOTOR_ASO: TStringField;
    qyInfCobranzaCVE_PRODUCTO_CRE: TStringField;
    qyInfCobranzaDESC_L_PRODUCTO: TStringField;
    qyInfCobranzaID_CREDITO: TFloatField;
    qyInfCobranzaID_CESION: TFloatField;
    qyInfCobranzaID_CONTRATO: TFloatField;
    qyInfCobranzaNOMBRE: TStringField;
    qyInfCobranzaID_EMISOR: TFloatField;
    qyInfCobranzaCVE_EMISOR_NAFIN: TStringField;
    qyInfCobranzaID_PROVEEDOR: TFloatField;
    qyInfCobranzaNOMBRE_EMISOR: TStringField;
    qyInfCobranzaNOM_PROVEEDOR: TStringField;
    qyInfCobranzaID_PROV_NAFINSA: TFloatField;
    qyInfCobranzaSALDO: TFloatField;
    qyInfCobranzaBENBCO: TFloatField;
    qyInfCobranzaBENGOB: TFloatField;
    qyInfCobranzaCAP_ANT: TFloatField;
    qyInfCobranzaCAP_PROG: TFloatField;
    qyInfCobranzaCAP_IMP: TFloatField;
    qyInfCobranzaINT_ANT: TFloatField;
    qyInfCobranzaINT_PROG: TFloatField;
    qyInfCobranzaINT_IMP: TFloatField;
    qyInfCobranzaTOT_IVA_INT_ANT: TFloatField;
    qyInfCobranzaTOT_IVA_INT_PROG: TFloatField;
    qyInfCobranzaTOT_IVA_INT_IMP: TFloatField;
    qyInfCobranzaTOT_IVA_CO_ANT: TFloatField;
    qyInfCobranzaTOT_IVA_CO_PROG: TFloatField;
    qyInfCobranzaTOT_IVA_CO_IMP: TFloatField;
    qyInfCobranzaCLAVE_CON: TStringField;
    qyInfCobranzaDESC_COMISION: TStringField;
    qyInfCobranzaID_DOCUMENTO: TStringField;
    qyInfCobranzaNUM_PERIODO_DOC: TFloatField;
    qyInfCobranzaPER_DOC: TStringField;
    qyInfCobranzaFH_ALTA: TDateTimeField;
    qyInfCobranzaID_ACREDITADO: TFloatField;
    qyInfCobranzaID_TITULAR: TFloatField;
    qyInfCobranzaCVE_TIPO_SECTOR: TStringField;
    qyInfCobranzaCHEQUERA_PROV: TStringField;
    qyInfCobranzaCHEQUERA_EMI: TStringField;
    qyInfCobranzaFH_CANCELA: TDateTimeField;
    qyInfCobranzaTIPO_MOVTO: TStringField;
    qyInfCobranzaMOR_CAPITAL: TFloatField;
    qyInfCobranzaMOR_FIN_ADIC: TFloatField;
    qyInfCobranzaMOR_CONCEPTO: TFloatField;
    qyInfCobranzaTOTAL: TFloatField;
    qyInfCobranzaIMP_CONCEPTO: TFloatField;
    qyInfCobranzaIMPBRU_CAP: TFloatField;
    qyInfCobranzaIMPBRU_INT: TFloatField;
    qyInfCobranzaIMPBRU_CN: TFloatField;
    qyInfCobranzaIMPBRU_FN: TFloatField;
    QRExpr2: TQRExpr;
    QRExpr43: TQRExpr;
    QRExpr53: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr39: TQRExpr;
    QRExpr52: TQRExpr;
    qrexpCAP_VIG: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr44: TQRExpr;
    QRExpr65: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr41: TQRExpr;
    QRExpr54: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr46: TQRExpr;
    QRExpr94: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr13: TQRExpr;
    QRExprIMPBRUCN2: TQRExpr;
    QRExprIMPBRUCN3: TQRExpr;
    QRExprIMPBRUCN4: TQRExpr;
    QRExprIMPBRUCN5: TQRExpr;
    QRExprIMPBRUCN6: TQRExpr;
    QRExprIMPBRUCN8: TQRExpr;
    QRExprIMPBRUIN8: TQRExpr;
    qrexpINT_VIG: TQRExpr;
    qyInfCobranzaIMPIVA_INT: TFloatField;
    qyInfCobranzaIMPIVA_CON: TFloatField;
    qyInfCobranzaIMPIVA_MOR: TFloatField;
    qyInfCobranzaIMPMOR_CAP: TFloatField;
    qyInfCobranzaIMPMOR_FIN: TFloatField;
    qyInfCobranzaIMPMOR_CON: TFloatField;
    QRExprTotal: TQRExpr;
    QRShape32: TQRShape;
    QRExpr117: TQRExpr;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr82: TQRExpr;
    QRExpr72: TQRExpr;
    QRExprIMPBRUIN7: TQRExpr;
    QRExprIMPBRUCN7: TQRExpr;
    QRExprIMPMORCP7: TQRExpr;
    QRExprIMPMORFN7: TQRExpr;
    QRExprIMPMORCN7: TQRExpr;
    QRExprIMPIVAIN7: TQRExpr;
    QRExprIMPIVACN7: TQRExpr;
    QRExprIMPIVAMOR7: TQRExpr;
    QRExprTOTAL_B7: TQRExpr;
    QRExprTotal7: TQRExpr;
    QRLabel49: TQRLabel;
    QRExpr10: TQRExpr;
    QRLabel50: TQRLabel;
    QRDBText39: TQRDBText;
    QRExpr4: TQRExpr;
    qyInfCobranzaCO_ANT: TFloatField;
    qyInfCobranzaCO_PROG: TFloatField;
    qyInfCobranzaCO_IMP: TFloatField;
    qyInfCobranzaCVE_COMISION: TStringField;
    QRDBText1: TQRDBText;
    QRShape18: TQRShape;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    qrshMORINT: TQRShape;
    qrlMORINT: TQRLabel;
    qrdbIMPMORINT: TQRDBText;
    QRExprIMPMORIN1: TQRExpr;
    qyInfCobranzaIMPMOR_INT: TFloatField;
    QRExprIMPMORIN2: TQRExpr;
    QRExprIMPMORIN3: TQRExpr;
    QRExprIMPMORIN4: TQRExpr;
    QRExprIMPMORIN5: TQRExpr;
    QRExprIMPMORIN6: TQRExpr;
    qyInfCobranzaMOR_INTERES: TFloatField;
    qrshTIPOCALC: TQRShape;
    qrlTIPOCALC: TQRLabel;
    qrshCVETASA: TQRShape;
    qrlCVETASA: TQRLabel;
    qrlSOBRETASA: TQRLabel;
    qrshSOBRETASA: TQRShape;
    qrlTASAAPLI: TQRLabel;
    qrshTASAAPLI: TQRShape;
    QRExprIMPMORIN7: TQRExpr;
    QRExprIMPMORIN8: TQRExpr;
    qrdbCVETASA: TQRDBText;
    qrdbSOBRETASA: TQRDBText;
    qyInfCobranzaDESC_CALCULO: TStringField;
    qyInfCobranzaCVE_TASA_REFER: TStringField;
    qyInfCobranzaSOBRETASA: TFloatField;
    qyInfCobranzaTASA_APLICADA: TFloatField;
    qrdbTIPOCALCULO: TQRDBText;
    qrdbTASAAPLICADA: TQRDBText;
    qrlET_NUM_CRED: TQRLabel;
    qrlNUM_TOT_CRED: TQRLabel;
    qrlNUM_TOT_CRED_PROD: TQRLabel;
    qrshF_VALOR: TQRShape;
    qrlF_VALOR: TQRLabel;
    procedure qyInfCobranzaCalcFields(DataSet: TDataSet);
    procedure QRSubDivBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDETALLEBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterMovtoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterCesionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFootSubDivBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterTitularBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterProductoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterPromotorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBFootSectorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupTipoProductoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
   sDetalleRep, sTipReporte, sArchivo:String;
  public

    Function FormaQuery(sF_Inicio,sF_Final,sProducto,sMoneda,
                        sAcreditado,sPromAsoc,sPromAdmon,
                        sCesion,sSitMov,sDetalle,sOrden,
                        sIdCredExt,sIdCtrlExt,sReporte,sTipoDisp,
                        sEmpresa, sSucursal,sGpoProd:String;
                        bIncTipoSec, bTasas:Boolean):String;
    // < / EASA 11 ABRIL 2006 Requerimiento 200602/014
    procedure OcultaConceptos(bTasas :Boolean);
    // EASA > /
  end;

var
  QrInfCobr: TQrInfCobr;
  bGenArch: Boolean;
  F: TextFile;
  vlNumCred : Integer;
  vlNumCrPr : Integer;
  vlIdCred  : Integer;

Procedure RepInfCobranza(   sF_Inicio,sF_Final,sProducto,sMoneda,
                            sAcreditado,sPromAsoc,sPromAdmon,
                            sCesion,sSitMov,sDetalle,sOrden,
                            sIdCredExt,sIdCtrlExt,sReporte,sTipoDisp, sNbrArch,
                            sEmpresa, sSucursal, sGpoProd:String;
                            bTasas, bIncTipoSec:Boolean;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepInfCobranza(   sF_Inicio,sF_Final,sProducto,sMoneda,
                            sAcreditado,sPromAsoc,sPromAdmon,
                            sCesion,sSitMov,sDetalle,sOrden,
                            sIdCredExt,sIdCtrlExt,sReporte,sTipoDisp, sNbrArch,
                            sEmpresa, sSucursal, sGpoProd:String;
                            bTasas, bIncTipoSec:Boolean;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Var
   QrInfCobr : TQrInfCobr;
   Preview     : TIntQRPreview;
   VLTipoDisp  : String;
Begin
   QrInfCobr:=TQrInfCobr.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrInfCobr);
   Try
      bGenArch:= False;
      QrInfCobr.sArchivo:= sNbrArch;
      QrInfCobr.sTipReporte:= sReporte;
      QrInfCobr.sDetalleRep:= sDetalle;
      QrInfCobr.QRInterEncabezado1.Apli:=pApli;
      QrInfCobr.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrInfCobr.QRInterEncabezado1.NomReporte:='IntMQrInfCobr';
      QrInfCobr.QRInterEncabezado1.Titulo1:='Informe de Cobranza';

      if Not(bIncTipoSec) then
      begin
          QrInfCobr.QRGroupSector.Enabled := False;
          QrInfCobr.QRGroupSector.Expression := '';
          QrInfCobr.QRBFootSector.Enabled := False;
      end;
      if (Trim(sReporte) = 'A') then
      begin
          QrInfCobr.QRGroupTipoProducto.Enabled := False;
          QrInfCobr.QRGroupTipoProducto.Expression := '';
          QrInfCobr.QRFooterProducto.Enabled := False;
          QrInfCobr.QRGroupMovto.Enabled := False;
          QrInfCobr.QRGroupMovto.Expression := '';
          QrInfCobr.QRFooterMovto.Enabled := False;
          QrInfCobr.QRDBTCredito.Enabled := False;
          QrInfCobr.Etiqueta1.Caption := 'Concepto';
      end
      else if (Trim(sReporte) = 'P') then
      begin
         { < / EASA4011 04 may 2006  requer Roberto Fernandez
          QrInfCobr.QRGrupoTitular.Enabled := False;
          QrInfCobr.QRGrupoTitular.Expression := '';
          QrInfCobr.QRFooterTitular.Enabled := False;
         }
         IF bTasas then Begin
            QrInfCobr.QRGrupoTitular.Enabled := True;
            QrInfCobr.QRGrupoTitular.Expression := 'ID_TITULAR';
            QrInfCobr.QRFooterTitular.Enabled := True;
         end
         else Begin
            QrInfCobr.QRGrupoTitular.Enabled := False;
            QrInfCobr.QRGrupoTitular.Expression := '';
            QrInfCobr.QRFooterTitular.Enabled := False;
         end;
          // EASAS4011 > /

          QrInfCobr.QRSubDiv.Enabled := False;
          QrInfCobr.QRSubDiv.Expression := '';
          QrInfCobr.QRFootSubDiv.Enabled := False;

          QrInfCobr.QRGroupCesion.Enabled := False;
          QrInfCobr.QRGroupCesion.Expression := '';
          QrInfCobr.QRFooterCesion.Enabled := False;
          QrInfCobr.QRDBTConcepto.Enabled := False;
          QrInfCobr.Etiqueta1.Caption := 'Cesión/Disp.';
      end;

      If (Trim(sSitMov) = 'AC') Then
          QrInfCobr.QRInterEncabezado1.Titulo2:='Movimientos ACTIVOS ';

      If (Trim(sSitMov) = 'CA') Then
          QrInfCobr.QRInterEncabezado1.Titulo2:='Movimientos CANCELADOS ';

      If Trim(sF_Inicio)<>'' Then
          QrInfCobr.QRInterEncabezado1.Titulo2:=QrInfCobr.QRInterEncabezado1.Titulo2 + ' del día '+
                                      sF_Inicio + ' al día ' + sF_Final;

      If (Trim(sTipoDisp)<>'') Then
      begin
           if sTipoDisp = 'DI' then
               VLTipoDisp := ' (DISPOSICIÓN)'
           else if sTipoDisp = 'RE' then
               VLTipoDisp := ' (RENOVACIÓN)'
           else if sTipoDisp = 'RS' then
               VLTipoDisp := ' (REESTRUCTURACIÓN)';
           //end if;
      end;

      QrInfCobr.QRInterEncabezado1.Titulo2:= QrInfCobr.QRInterEncabezado1.Titulo2 + VLTipoDisp;

      QrInfCobr.qyInfCobranza.DatabaseName := pApli.DataBaseName;
      QrInfCobr.qyInfCobranza.SessionName := pApli.SessionName;

      If (Trim(sPromAsoc)='')and(Trim(sPromAdmon)='') Then Begin
          QrInfCobr.QRGroupPromotor1.Enabled:=False;
          QrInfCobr.QRGroupPromotor1.Expression:='';
          QrInfCobr.QRFooterPromotor.Enabled:=False;
      End Else If (Trim(sPromAsoc)<>'')Then Begin
          QrInfCobr.QRGroupPromotor1.Enabled:=True;
          QrInfCobr.QRFooterPromotor.Enabled:=True;
          QrInfCobr.QRGroupPromotor1.Expression:='qyInfCobranza.ID_PERS_ASOCIAD';
          QrInfCobr.dbNom_Promotor.DataField:= 'ID_PERS_ASOCIAD';
          QrInfCobr.dbNombre_Promotor.DataField:= 'NOM_PROMOTOR_ASO';
          QrInfCobr.qrlPromotor.Caption:='Promotor Asociado';
      End Else If (Trim(sPromAdmon)<>'')Then Begin
          QrInfCobr.QRGroupPromotor1.Enabled:=True;
          QrInfCobr.QRFooterPromotor.Enabled:=True;
          QrInfCobr.QRGroupPromotor1.Expression:='qyInfCobranza.ID_PROM_ADM';
          QrInfCobr.dbNom_Promotor.DataField:= 'ID_PROM_ADM';
          QrInfCobr.dbNombre_Promotor.DataField:= 'NOM_PROMOTOR_ADM';
          QrInfCobr.qrlPromotor.Caption:='Promotor Admón';
      End;
      If Trim(sDetalle)='D' Then Begin
          QrInfCobr.qrbDETALLE.Enabled:=True;
          QrInfCobr.qrlET_NUM_CRED.Enabled:=True;
          QrInfCobr.qrlNUM_TOT_CRED.Enabled:=True;
      end
      Else Begin
          QrInfCobr.qrbDETALLE.Enabled:=False;
          QrInfCobr.qrlET_NUM_CRED.Enabled:=False;
          QrInfCobr.qrlNUM_TOT_CRED.Enabled:=False;
      end;
      // < / EASA 11 ABRIL 2006 Requerimiento 200602/014
      QrInfCobr.OcultaConceptos(bTasas);
      vlNumCred := 0;
      vlNumCrPr := 0;
      vlIdCred  := 0;
      // EASA > /

//        QrInfCobr.QRLbSituacion.Visible := False; //ales
//        QrInfCobr.QRLbSituacion.Enabled := False; //ales

      QrInfCobr.qyInfCobranza.Active:=False;
      QrInfCobr.qyInfCobranza.SQL.Text:= QrInfCobr.FormaQuery(sF_Inicio,sF_Final,sProducto,
                      sMoneda,sAcreditado,sPromAsoc,sPromAdmon,sCesion,sSitMov,sDetalle,
                      sOrden, sIdCredExt,sIdCtrlExt,sReporte,sTipoDisp,sEmpresa, sSucursal,
                      sGpoProd, bIncTipoSec, bTasas);
      QrInfCobr.qyInfCobranza.SQL.SaveToFile('c:\InfConbra.txt');
      QrInfCobr.qyInfCobranza.Active:=True;

      If Trim(QrInfCobr.sArchivo)<>'' Then Begin
         AssignFile(F, QrInfCobr.sArchivo);
         Rewrite(F);
         Writeln(F, QrInfCobr.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F, QrInfCobr.QRInterEncabezado1.Titulo2 + #09 );
         Writeln(F,  #09 );
         Writeln(F,#09#09#09#09#09#09#09#09#09#09#09#09#09+
                   #09#09#09#09#09#09#09#09#09#09#09#09#09 +
                   'Moratorios'+ #09#09#09 +
                   'IVA');

         Writeln(F,
             //Grupos
             'Moneda' + #09#09 +
             'Sector' + #09 +
             QrInfCobr.qrlPromotor.Caption + #09#09 +
             'Producto ' + #09#09 +
             'Titular ' + #09#09 +
             'SubDivisión' + #09#09 +
             'Chequera Admi:' + #09 +
             'Saldo:' + #09 +
             'Cesión / Crédito' + #09 +
             'Proveedor' + #09#09 +
             'Núm. NAFINSA' + #09 +
             'Chequera Admi:' + #09 +
             'Estado de la Disp.' + #09 +
             //Registros
             QrInfCobr.Etiqueta1.Caption +  #09+
             'Periodo / Docto' +  #09 +
             'Tipo Calculo' +  #09 +
             'Tasa Refer' +  #09 +
             'Sobretasa' +  #09 +
             'Tasa Aplicada' +  #09 +
             'Cve. Comis.' +  #09 +
             'Capital'+  #09 +
             'Financiam. Adicional' +  #09 +
             'Interés' +  #09 +
             'Conceptos' +#09 +
             'Capital'+ #09+
             'Finan. Adic.'+ #09 +
             'Concepto'+#09 +
             'Interés'+#09 +
             'Interés'+ #09 +
             'Concept.'+ #09 +
             'Moras.'+ #09 +
             'Beneficios (Banco/ Gob)'+ #09 +
             'Total'+ #09 +
             'Tipo de Cambio'+ #09 +
             'Usuario'+ #09 +
             'Fecha Opera.'+ #09 +
             'Fecha Valor');
         Writeln(F, '');
      End;

      If pPreview Then
         QrInfCobr.Preview
      Else
         QrInfCobr.Print;
   Finally
      If Trim(QrInfCobr.sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrInfCobr.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrInfCobr.FormaQuery(  sF_Inicio,sF_Final,sProducto,sMoneda,
                        sAcreditado,sPromAsoc,sPromAdmon,sCesion,sSitMov,
                        sDetalle,sOrden, sIdCredExt,sIdCtrlExt,sReporte,sTipoDisp,
                        sEmpresa, sSucursal, sGpoProd:String;
                        bIncTipoSec, bTasas:Boolean):String;
Var
    sSQL:String;
Begin
    sSQL:=  ' SELECT  ID_PERIODO        ,       TIPO_CAMBIO     ,       ' + coCRLF +
            '         CVE_USU_ALTA      ,       FH_ALTA         ,       FH_CANCELA      ,'+ coCRLF +
            '         SIT_TRANSACCION   ,       TIPO_MOVTO	,       CVE_TIPO_MOVTO  ,'+ coCRLF +
            '         ''PAGOS ''|| '' ''||TIPO_MOVTO CONCEPTO, '+ coCRLF +
            '         SUM(DECODE(CVE_ACCESORIO,''CP'',IMPBRU,0)) 	IMPBRU_CAP,'+  coCRLF +
            '         SUM(DECODE(CVE_ACCESORIO,''FN'',IMPBRU,0)) 	IMPBRU_FN,'+  coCRLF +
            '         SUM(DECODE(CVE_ACCESORIO,''IN'',IMPBRU,0)) 	IMPBRU_INT,'+  coCRLF +
            '         SUM(DECODE(CVE_ACCESORIO,''CN'',IMPBRU,0)) 	IMPBRU_CN,'+  coCRLF +

            '         SUM(DECODE(CVE_ACCESORIO,''IN'',IMPIVA,0))        IMPIVA_INT,'+  coCRLF +
            '         SUM(DECODE(CVE_ACCESORIO,''CN'',IMPIVA,0))        IMPIVA_CON,'+  coCRLF +
            '         SUM(IVAMOR)                                       IMPIVA_MOR,'+  coCRLF +

            '         SUM(DECODE(CVE_ACCESORIO,''CP'',IMPMOR,0)) 	IMPMOR_CAP,'+  coCRLF +
            '         SUM(DECODE(CVE_ACCESORIO,''FN'',IMPMOR,0)) 	IMPMOR_FIN,'+  coCRLF +
            '         SUM(DECODE(CVE_ACCESORIO,''CN'',IMPMOR,0)) 	IMPMOR_CON,'+  coCRLF +
            '         SUM(DECODE(CVE_ACCESORIO,''IN'',IMPMOR,0)) 	IMPMOR_INT,'+  coCRLF +

            '         SUM(BENBCO) 	BENBCO			,'+  coCRLF +
            '         SUM(BENGOB) 	BENGOB,'+  coCRLF +
            '         TIPO_RENUEVA, '+  coCRLF +
            '         CVE_MONEDA        ,       DESC_MONEDA     ,       ID_PROM_ADM     ,'+  coCRLF +
            '         NOM_PROMOTOR_ADM  ,       ID_PERS_ASOCIAD ,       NOM_PROMOTOR_ASO,'+  coCRLF +
            '         CVE_PRODUCTO_CRE  ,       DESC_L_PRODUCTO ,       ID_CREDITO      ,'+  coCRLF +
            '         ID_CONTRATO       ,       NOMBRE          ,       ID_EMISOR       ,'+  coCRLF +
            '         CVE_EMISOR_NAFIN  ,       ID_PROVEEDOR    ,       NOMBRE_EMISOR   ,'+  coCRLF +
            '         CVE_TIPO_SECTOR   ,       CHEQUERA_EMI    ,       NOM_PROVEEDOR   ,'+  coCRLF +
            '         ID_PROV_NAFINSA   ,       CHEQUERA_PROV   ,       SALDO           ,'+  coCRLF +
            '         ID_CESION         ,       DESC_COMISION   ,       ID_DOCUMENTO    ,'+  coCRLF +
            '         NUM_PERIODO_DOC   ,       ID_ACREDITADO   ,       ID_TITULAR      ,'+  coCRLF +
            '         F_OPERACION       ,       IMP_FINAN_ADIC  ,       CVE_COMISION    ,'+ coCRLF +
           // < / EASA 11 ABRIL 2006 Requerimiento 200602/014
            '         DESC_CALCULO      ,       CVE_TASA_REFER  ,       TASA_APLICADA     ,'+ coCRLF +
            '         SOBRETASA              '+ coCRLF +
           //  EASA > /

            ' FROM '+ coCRLF +
            '         ( SELECT '+ coCRLF +
            '                   CTR.ID_PERIODO          ,       CTR.TIPO_CAMBIO                 , ' + coCRLF +
            '                   CTR.ID_TRANSACCION      ,       CTR.CVE_USU_ALTA                , ' + coCRLF +
            '                   CTR.F_OPERACION FH_ALTA ,       TRUNC(CTR.FH_CANCELA) FH_CANCELA, ' + coCRLF +
            '                   CTR.SIT_TRANSACCION     ,       COP.CVE_ACCESORIO               , ' + coCRLF +
            '                   CTR.CVE_TIPO_MOVTO      ,       COP.CVE_OPERACION               , ' + coCRLF +
            '                   DECODE(CVE_CONCEPTO,''IMPBRU'',IMP_CONCEPTO,0) 	IMPBRU		, ' + coCRLF +
            '                   DECODE(CVE_CONCEPTO,''IMPIVA'',IMP_CONCEPTO,0) 	IMPIVA		, ' + coCRLF +
            '                   DECODE(CVE_CONCEPTO,''IMPMOR'',IMP_CONCEPTO,0) 	IMPMOR		, ' + coCRLF +
            '                   DECODE(CVE_CONCEPTO,''IVAMOR'',IMP_CONCEPTO,0) 	IVAMOR		, ' + coCRLF +
            '                   DECODE(CVE_CONCEPTO,''BENBCO'',IMP_CONCEPTO,0) 	BENBCO		, ' + coCRLF +
            '                   DECODE(CVE_CONCEPTO,''BENGOB'',IMP_CONCEPTO,0) 	BENGOB          , ' + coCRLF +
//            '                   CDT.CVE_CONCEPTO        ,       CDT.IMP_CONCEPTO                , ' + coCRLF +
            '                   CTR.CVE_COMISION        ,       CCC.DESC_COMISION               , ' + coCRLF +
            '                   CTO.CVE_MONEDA          ,       M.DESC_MONEDA                   , ' + coCRLF +
            '                   CC.ID_PROM_ADM          ,       PPR.NOMBRE NOM_PROMOTOR_ADM     , ' + coCRLF +
            '                   CC.TIPO_RENUEVA         ,' + coCRLF +
            '                   CTO.ID_PERS_ASOCIAD     ,       PPRC.NOMBRE NOM_PROMOTOR_ASO    , ' + coCRLF +
            '                   CPR.CVE_PRODUCTO_CRE    ,       CPR.DESC_L_PRODUCTO             , ' + coCRLF +
            '                   CPR.ID_EMPRESA          ,       ' + coCRLF +
//            '                   CTR.ID_CREDITO          ,       CCE.ID_CESION                   , ' + coCRLF +
            '                   CTR.ID_CREDITO          ,       CD.ID_CESION                   , ' + coCRLF +
            '                   CTR.ID_CONTRATO         ,       CTO.ID_TITULAR                  , ' + coCRLF +
//            '                   CCE.ID_EMISOR           ,       CCE.CVE_EMISOR_NAFIN            , ' + coCRLF +
            '                   SUBDIV.ID_ACREDITADO ID_EMISOR, NVL(SUBDIV.CVE_EMISOR_NAFIN,0) CVE_EMISOR_NAFIN , ' + coCRLF +
//            '                   CCE.ID_PROVEEDOR        ,       CE.NOMBRE_EMISOR                , ' + coCRLF +
            '                   SUBDIV.ID_PROVEEDOR        ,       SUBDIV.NOMBRE_EMISOR                , ' + coCRLF +
            '                   PCE.CVE_TIPO_SECTOR     ,       CTR.ID_TRANS_CANCELA            , ' + coCRLF +
            '                   CD.ID_DOCUMENTO         ,       SUBDIV.ID_ACREDITADO            , ' + coCRLF +
            '                   CD.NUM_PERIODO_DOC      ,       CTR.F_OPERACION                 , ' + coCRLF +
            '                   DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PTIT.APELLIDO_PATERNO'+ coCRLF +
            '                   ||'' ''||PTIT.APELLIDO_MATERNO||'' ''||PTIT.NOMBRE_PERSONA) NOMBRE,'+ coCRLF +
//            '                   SUBSTR(PKGCRPERIODO.STPObtChqCte(CCE.ID_EMISOR,CCE.CVE_EMISOR_NAFIN,'+coCRLF +
//            '                                CCE.ID_CESION,''AC'',''AD'',''CR''),1,20) CHEQUERA_EMI,'+coCRLF +
            '                   SUBSTR(CTR.ID_CTO_LIQ,1,20) CHEQUERA_EMI,'+coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//            '                   PP.NOMBRE NOM_PROVEEDOR ,       CP.ID_PROV_NAFINSA              , ' + coCRLF +
            '                   PP.NOMBRE NOM_PROVEEDOR ,       CP.ID_PROV_EXTERNO  AS ID_PROV_NAFINSA            , ' + coCRLF +
{/ROIM}
//            '                   SUBSTR(PKGCRPERIODO.STPObtChqCte(CCE.ID_PROVEEDOR,NULL,           ' + coCRLF +
            '                   SUBSTR(PKGCRPERIODO.STPObtChqCte(SUBDIV.ID_PROVEEDOR,NULL,          ' + coCRLF +
//            '                   CCE.ID_CESION,''PR'',''AD'',''AB''),1,20) CHEQUERA_PROV         , ' + coCRLF +
            '                   SUBDIV.ID_CESION,''PR'',''AD'',''AB''),1,20) CHEQUERA_PROV         , ' + coCRLF +
//            '                   PKGDPVISTASERV.SPTObtSaldo(PKGCRPERIODO.STPObtChqCte(CCE.ID_EMISOR,'+ coCRLF +
//            '                   CCE.CVE_EMISOR_NAFIN,CCE.ID_CESION,''AC'',''AD'',''CR''),''D000'') SALDO, '+ coCRLF +
            '                   PKGDPVISTASERV.SPTObtSaldo(CTR.ID_CTO_LIQ,''D000'') SALDO, '+ coCRLF +
            '                   DECODE(CVE_TIPO_MOVTO,''AN'',''ANTICIPADOS'',''MD'',''PROGRAMADOS'',''IMPAGADOS'') TIPO_MOVTO, '+ coCRLF +
            '                   0       IMP_FINAN_ADIC, ' + coCRLF +
           // < / EASA 11 ABRIL 2006 Requerimiento 200602/014
//            '                   CCI.DESC_CALCULO, CC.CVE_TASA_REFER, CC.SOBRETASA, CTR.TASA_APLICADA' + coCRLF +
            '                   CCI.DESC_CALCULO DESC_CALCULO, ' + coCRLF +
            '                   CC.CVE_TASA_REFER CVE_TASA_REFER, ' + coCRLF +
//            '                   CTR.TASA_APLICADA TASA_APLICADA, ' + coCRLF +
            '                   DECODE(CTR.TASA_APLICADA,0,DECODE(NVL(CI.TASA_APLICADA,0),0,CD.TASA_DESCUENTO,CI.TASA_APLICADA ),CTR.TASA_APLICADA) TASA_APLICADA, ' + coCRLF +
            '                   CC.SOBRETASA SOBRETASA ' + coCRLF +
           //  EASA > /
            '           FROM '+ coCRLF +
            '                   CR_TRANSACCION CTR      ,       CR_OPERACION    COP, '+ coCRLF +
            '                   CR_DET_TRANSAC CDT      ,       CONTRATO        CTO, '+ coCRLF +
            '                   MONEDA         M        ,       CR_CREDITO      CC,  '+ coCRLF +
            '                   PERSONA        PPR      ,       PERSONA         PPRC,'+ coCRLF +
            '                   CR_CONTRATO    CCTO     ,       CR_PRODUCTO     CPR, '+ coCRLF +
            '                   PERSONA_FISICA PTIT     ,       PERSONA         PCE, '+ coCRLF +
//            '                   CR_CESION      CCE      ,       CR_EMISOR       CE,  '+ coCRLF +
            '                   PERSONA        PP       ,       CR_PROVEEDOR    CP,  '+ coCRLF +
            '                   CR_DOCUMENTO   CD       ,       CR_CAT_COMISION CCC,  '+ coCRLF +
                        //EASA      20102004
            '                   ('+ coCRLF +
            '                    SELECT SUB.CVE_SUB_DIVISION CVE_EMISOR_NAFIN, SUB.NOMBRE_SUB_DIV NOMBRE_EMISOR,'+ coCRLF +
            '                           ID_ACREDITADO, PROCAM.ID_CREDITO  ID_CESION, 0 ID_PROVEEDOR, NULL CVE_FND_ENT_DES'+ coCRLF +
            '                    FROM CR_SUBDIV_PROCAM SUB, CR_PROCAMPO PROCAM'+ coCRLF +
            '                    WHERE PROCAM.CVE_SUB_DIVISION = SUB.CVE_SUB_DIVISION'+ coCRLF +
            '                    UNION'+ coCRLF +
            '                    SELECT CS.CVE_EMISOR_NAFIN, CE.NOMBRE_EMISOR,'+ coCRLF +
            '                           CE.ID_ACREDITADO, CS.ID_CESION, CS.ID_PROVEEDOR, CS.CVE_FND_ENT_DES'+ coCRLF +
            '                    FROM CR_EMISOR CE, CR_CESION CS'+ coCRLF +
            '                    WHERE CS.ID_EMISOR = CE.ID_ACREDITADO'+ coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
            '                    AND CS.CVE_FND_ENT_DES = CE.CVE_FND_ENT_DES'+ coCRLF +
//            '                    AND CS.CVE_EMISOR_NAFIN = CE.CVE_EMISOR_NAFIN'+ coCRLF +
            '                    AND CS.CVE_EMISOR_NAFIN = CE.CVE_EMISOR_EXT'+ coCRLF +
{/ROIM}
            '                    )SUBDIV, CR_CALCULO_INT CCI, CRE_PROV_DIARIA CPD,'+ coCRLF +
            '                    (SELECT CI.ID_CREDITO, CI.TASA_APLICADA FROM CR_INTERES CI,'+ coCRLF +
            '                           ( SELECT ID_CREDITO, MAX( NUM_PERIODO ) NUM_PERIODO'+ coCRLF +
            '                             FROM CR_INTERES WHERE F_VENCIMIENTO <= '+SQLFecha(StrToDateTime(sF_Final))+
            '                             GROUP BY ID_CREDITO'+ coCRLF +
            '                           ) CCI'+ coCRLF +
            '                     WHERE CI.ID_CREDITO = CCI.ID_CREDITO AND CI.NUM_PERIODO = CCI.NUM_PERIODO'+ coCRLF +
            '                    )CI'+ coCRLF +
            '           WHERE COP.CVE_AFEC_SALDO = ''I''                 AND    CDT.ID_TRANSACCION = CTR.ID_TRANSACCION   '+ coCRLF +
            '           AND   COP.CVE_ACCESORIO NOT IN (''CR'')'+ coCRLF + //EASA       04102004
            '           AND    CDT.CVE_OPERACION = CTR.CVE_OPERACION     AND       CTO.ID_CONTRATO = CTR.ID_CONTRATO      '+ coCRLF +
            '           AND         M.CVE_MONEDA = CTO.CVE_MONEDA        AND         CC.ID_CREDITO = CTR.ID_CREDITO       '+ coCRLF +
            '           AND       PPR.ID_PERSONA = CC.ID_PROM_ADM        AND       PPRC.ID_PERSONA = CTO.ID_PERS_ASOCIAD  '+ coCRLF +
            '           AND     CCTO.ID_CONTRATO = CC.ID_CONTRATO        AND     CCTO.FOL_CONTRATO = CC.FOL_CONTRATO      '+ coCRLF +
            '           AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE AND     PTIT.ID_PERSONA(+)= CTO.ID_TITULAR       '+ coCRLF +
//            '           AND       PCE.ID_PERSONA = CTO.ID_TITULAR        AND       CCE.ID_CESION(+)= CC.ID_CREDITO        '+ coCRLF +
            '           AND       PCE.ID_PERSONA = CTO.ID_TITULAR        AND       SUBDIV.ID_CESION(+)= CC.ID_CREDITO    '+ coCRLF +
//            '           AND   CE.ID_ACREDITADO(+)= CCE.ID_EMISOR         AND CE.CVE_EMISOR_NAFIN(+)= CCE.CVE_EMISOR_NAFIN '+ coCRLF +
//            '           AND      PP.ID_PERSONA(+)= CCE.ID_PROVEEDOR      AND    CP.ID_ACREDITADO(+)= CCE.ID_PROVEEDOR     '+ coCRLF +
            '           AND      PP.ID_PERSONA(+)= SUBDIV.ID_PROVEEDOR   AND    CP.ID_ACREDITADO(+)= SUBDIV.ID_PROVEEDOR  '+ coCRLF +
            '           AND       CD.ID_CESION(+)= CTR.ID_CESION         AND     CD.ID_DOCUMENTO(+)= CTR.ID_DOCUMENTO     '+ coCRLF +
            '           AND   CCC.CVE_COMISION(+)= CTR.CVE_COMISION      AND  CCI.CVE_CALCULO_INT = CC.CVE_CALCULO'+ coCRLF +
            '           AND    CPD.F_PROVISION(+)= CTR.F_OPERACION       AND     CPD.ID_CREDITO(+) = CTR.ID_CREDITO'+ coCRLF +
            '           AND      CI.ID_CREDITO(+)= CTR.ID_CREDITO'+ coCRLF +
            '           AND      SUBDIV.CVE_FND_ENT_DES = CP.CVE_FND_ENT_DES(+)'+ coCRLF ;

    // < / EASA 12 ABRIL 2006 Requerimiento 200602/014
    If bTasas Then
       sSQL:= sSQL + '           AND CTR.CVE_COMISION IS NULL AND COP.CVE_ACCESORIO = ''CP''' ;
    //end if
    // EASA >/

    If (Trim(sIdCredExt)<>'') Then
        sSQL:= sSQL + ' AND  CC.ID_CRED_EXTERNO ='+ sIdCredExt+ coCRLF;
    If (Trim(sIdCtrlExt)<>'') Then
        sSQL:= sSQL + ' AND  CC.ID_CONTROL_EXT ='+ sIdCtrlExt+ coCRLF;
    If (Trim(sEmpresa)<>'') Then
        sSQL:= sSQL + ' AND  CPR.ID_EMPRESA ='+ Trim(sEmpresa)+ coCRLF;
    If (Trim(sGpoProd)<>'') Then // SASB 11/01/05
        sSQL:= sSQL + ' AND  CPR.CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd )+ coCRLF;

    //EASA4011      24/02/2004
    If (Trim(sSitMov) = 'AC') Then
    begin
        sSQL:= sSQL + ' AND  COP.CVE_OPERACION  = CTR.CVE_OPERACION '+ coCRLF ;
    end
    else If (Trim(sSitMov) = 'CA') Then
    begin
        sSQL:= sSQL + ' AND ( ( CTR.SIT_TRANSACCION = '+#39+'CA'+#39+' AND  CTR.CVE_OPERACION = COP.CVE_OPERACION ) '+ coCRLF +
                      '    OR ( CTR.SIT_TRANSACCION = '+#39+'AC'+#39+' AND  CTR.CVE_OPERACION = COP.CVE_OPER_CANCELA )) '+ coCRLF ;
    end;

    sSQL:= sSQL +
            '         )UNO '+ coCRLF +
            ' WHERE 1=1 '+ coCRLF ;


    If (Trim(sSitMov) = 'AC') Then
    begin
        If (Trim(sF_Inicio)<>'') Then Begin
            sSQL:= sSQL + ' AND ((FH_ALTA BETWEEN TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sF_Inicio))+''',''DD/MM/YYYY'')' + coCRLF +
                          ' AND TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sF_Final))+''',''DD/MM/YYYY'')'+ coCRLF ;
        End;
        sSQL:= sSQL + ' AND  SIT_TRANSACCION ='+ #39 + sSitMov + #39 + ')'+ coCRLF ;
        sSQL:= sSQL + ' OR  ( '+ coCRLF ;
        sSQL:= sSQL + ' FH_ALTA BETWEEN TO_DATE('''+ coCRLF +
               FormatDateTime('DD/MM/YYYY',StrToDate(sF_Inicio))+''',''DD/MM/YYYY'')' + coCRLF +
                      ' AND TO_DATE('''+
               FormatDateTime('DD/MM/YYYY',StrToDate(sF_Final))+''',''DD/MM/YYYY'')'+ coCRLF ;
        sSQL:= sSQL + ' AND FH_ALTA < NVL(FH_CANCELA,FH_ALTA) AND  SIT_TRANSACCION = ' + #39 + 'CA' + #39 + '))' + coCRLF ;
    end;

    If (Trim(sSitMov) = 'CA') Then
    begin
        If (Trim(sF_Inicio)<>'') Then Begin
            sSQL:= sSQL + ' AND ( ( FH_CANCELA BETWEEN TO_DATE('''+ coCRLF +
                   FormatDateTime('DD/MM/YYYY',StrToDate(sF_Inicio))+''',''DD/MM/YYYY'')' + coCRLF +
                          ' AND TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sF_Final))+''',''DD/MM/YYYY'')'+ coCRLF ;
        End;
        sSQL:= sSQL + ' AND  SIT_TRANSACCION ='''+ sSitMov+'''' + ' )'+ coCRLF +

        //EASA4011      24/02/2004
                      ' OR  ( F_OPERACION BETWEEN TO_DATE('''+
                        FormatDateTime('DD/MM/YYYY',StrToDate(sF_Inicio))+''',''DD/MM/YYYY'')' + coCRLF +
                                        ' AND TO_DATE('''+
                        FormatDateTime('DD/MM/YYYY',StrToDate(sF_Final))+''',''DD/MM/YYYY'') ) )'+ coCRLF ;
    end;

    If (Trim(sProducto)<>'') Then
        sSQL:= sSQL + ' AND  CVE_PRODUCTO_CRE ='''+sProducto+''''+ coCRLF;
    If (Trim(sMoneda)<>'') Then
        sSQL:= sSQL + ' AND  CVE_MONEDA  ='+sMoneda+ coCRLF;
    If (Trim(sAcreditado)<>'') Then
        sSQL:= sSQL + ' AND  ID_ACREDITADO ='+ sAcreditado+ coCRLF;
    If (Trim(sPromAsoc)<>'') Then
        sSQL:= sSQL + ' AND  ID_PERS_ASOCIAD ='+ sPromAsoc+ coCRLF;
    If (Trim(sPromAdmon)<>'') Then
        sSQL:= sSQL + ' AND  ID_PROM_ADM ='+ sPromAdmon+ coCRLF;
    If (Trim(sCesion)<>'') Then
        sSQL:= sSQL + ' AND  ID_CREDITO  ='+ sCesion+ coCRLF;

    If (Trim(sTipoDisp)<>'')  Then
    begin
         if Trim(sTipoDisp)='DI' then
            sSQL:= sSQL + ' AND  TIPO_RENUEVA IS NULL'
         else
            sSQL:= sSQL + ' AND  TIPO_RENUEVA ='+ SQLStr( sTipoDisp );
         //end if
    end;

    sSQL:= sSQL + ' GROUP BY    ID_PERIODO      ,       TIPO_CAMBIO     ,       ' + coCRLF +
                  '             CVE_USU_ALTA    ,       FH_ALTA         ,       FH_CANCELA      ,' + coCRLF +
                  '             SIT_TRANSACCION ,       TIPO_RENUEVA    ,       CVE_MONEDA      ,' + coCRLF +
                  '             CVE_TIPO_MOVTO  ,' + coCRLF +
//                  '             CVE_OPERACION   ,       CVE_ACCESORIO   ,       ID_TRANSACCION  ,' + coCRLF +
                  '             DESC_MONEDA     ,       ID_PROM_ADM     ,       NOM_PROMOTOR_ADM,' + coCRLF +
                  '             ID_PERS_ASOCIAD ,       NOM_PROMOTOR_ASO,       CVE_PRODUCTO_CRE,' + coCRLF +
                  '             DESC_L_PRODUCTO ,       ID_CREDITO      ,       ID_CONTRATO     ,' + coCRLF +
                  '             NOMBRE          ,       ID_EMISOR       ,       CVE_EMISOR_NAFIN,' + coCRLF +
                  '             ID_PROVEEDOR    ,       NOMBRE_EMISOR   ,       CVE_TIPO_SECTOR ,' + coCRLF +
                  '             CHEQUERA_EMI    ,       NOM_PROVEEDOR   ,       ID_PROV_NAFINSA ,' + coCRLF +
                  '             CHEQUERA_PROV   ,       SALDO           ,       ID_CESION       ,' + coCRLF +
                  '             DESC_COMISION   ,       ID_DOCUMENTO    ,       ID_ACREDITADO   ,' + coCRLF +
                  '             NUM_PERIODO_DOC ,       ID_TITULAR      ,       F_OPERACION,CVE_COMISION, ' + coCRLF +
                  // < / EASA 11 ABRIL 2006 Requerimiento 200602/014
                  '             DESC_CALCULO    ,       CVE_TASA_REFER  , SOBRETASA       ,       TASA_APLICADA, '+ coCRLF +
                  '             TIPO_MOVTO      ,       IMP_FINAN_ADIC ' + coCRLF;   // RABA NOV 2011 MIGRACION BASE DATOS
           //  EASA > /

    sSQL:= sSQL + ' ORDER BY CVE_MONEDA ' ;

    // < / EASA 12 ABRIL 2006 Requerimiento 200602/014
    If bTasas Then Begin
       sSQL:= sSQL + ' , SOBRETASA DESC' ;
    end
    else begin

      if (Trim(sReporte) = 'P' ) then
          sSQL:= sSQL + ', DESC_L_PRODUCTO,TIPO_MOVTO ';

      if bIncTipoSec then
          sSQL:= sSQL + ', CVE_TIPO_SECTOR ';

      If Trim(sOrden) = 'C' Then
        //  sSQL:= sSQL + ' CVE_EMISOR_NAFIN,ID_CREDITO,ID_TRANSACCION,TIPO_MOVTO ' + coCRLF
          sSQL:= sSQL + ' , CVE_EMISOR_NAFIN,ID_CREDITO,TIPO_MOVTO ' + coCRLF
      Else
       //  sSQL:= sSQL + ' NOMBRE,CVE_EMISOR_NAFIN,ID_CREDITO,ID_TRANSACCION,TIPO_MOVTO ' + coCRLF ;
          sSQL:= sSQL + '     ' + coCRLF ;

    end;
    // EASA >/

    Result:= sSQL;
End;

procedure TQrInfCobr.qyInfCobranzaCalcFields(DataSet: TDataSet);
Var
    sFecha:String;
begin
    If (Trim(qyInfCobranzaID_CESION.AsString) = '')OR (Trim(qyInfCobranzaID_CESION.AsString) = '0') Then Begin
        QRLProveedor.Enabled:=False;
        QRLProveedor.Caption:='';
        dbIdProveedor.Enabled:=False;
        qrlPromotor.Enabled:=False;
        dbNomProveedor.Enabled:=False;
        qyInfCobranzaPER_DOC.AsString:=qyInfCobranzaID_PERIODO.AsString;
    End Else Begin
        QRLProveedor.Enabled:=True;
        QRLProveedor.Caption:='Proveedor';
        dbIdProveedor.Enabled:=True;
        qrlPromotor.Enabled:=True;
        dbNomProveedor.Enabled:=True;
        qyInfCobranzaPER_DOC.AsString:=qyInfCobranzaNUM_PERIODO_DOC.AsString + ' / ' + qyInfCobranzaID_DOCUMENTO.AsString;
    End;
    sFecha:= FormatDateTime('dd/mm/yy hh:mm AM/PM',qyInfCobranzaFH_ALTA.AsDateTime);

    If qyInfCobranzaCVE_TIPO_MOVTO.AsString = 'AN' Then
    BEGIN
       qyInfCobranzaCAP_ANT.AsFloat:= qyInfCobranzaCAP_ANT.AsFloat + qyInfCobranzaIMPBRU_CAP.AsFloat;
       qyInfCobranzaINT_ANT.AsFloat:= qyInfCobranzaINT_ANT.AsFloat + qyInfCobranzaIMPBRU_INT.AsFloat;
       qyInfCobranzaCO_ANT.AsFloat:= qyInfCobranzaCO_ANT.AsFloat + qyInfCobranzaIMPBRU_CN.AsFloat;
       qyInfCobranzaTOT_IVA_INT_ANT.AsFloat:= qyInfCobranzaTOT_IVA_INT_ANT.AsFloat + qyInfCobranzaIMPIVA_INT.AsFloat;
       qyInfCobranzaTOT_IVA_CO_ANT.AsFloat:= qyInfCobranzaTOT_IVA_CO_ANT.AsFloat + qyInfCobranzaIMPIVA_CON.AsFloat;
    END
    Else If qyInfCobranzaCVE_TIPO_MOVTO.AsString ='MD' Then
    BEGIN
       qyInfCobranzaCAP_PROG.AsFloat:= qyInfCobranzaCAP_PROG.AsFloat + qyInfCobranzaIMPBRU_CAP.AsFloat;
       qyInfCobranzaINT_PROG.AsFloat:= qyInfCobranzaINT_PROG.AsFloat + qyInfCobranzaIMPBRU_INT.AsFloat;
       qyInfCobranzaCO_PROG.AsFloat:= qyInfCobranzaCO_PROG.AsFloat + qyInfCobranzaIMPBRU_CN.AsFloat;
       qyInfCobranzaTOT_IVA_INT_PROG.AsFloat:= qyInfCobranzaTOT_IVA_INT_PROG.AsFloat + qyInfCobranzaIMPIVA_INT.AsFloat;
       qyInfCobranzaTOT_IVA_CO_PROG.AsFloat:= qyInfCobranzaTOT_IVA_CO_PROG.AsFloat + qyInfCobranzaIMPIVA_CON.AsFloat;
    END
    Else If qyInfCobranzaCVE_TIPO_MOVTO.AsString ='IM' Then
    BEGIN
       qyInfCobranzaCAP_IMP.AsFloat:= qyInfCobranzaCAP_IMP.AsFloat + qyInfCobranzaIMPBRU_CAP.AsFloat;
       qyInfCobranzaINT_IMP.AsFloat:= qyInfCobranzaINT_IMP.AsFloat + qyInfCobranzaIMPBRU_INT.AsFloat;
       qyInfCobranzaCO_IMP.AsFloat:= qyInfCobranzaCO_IMP.AsFloat + qyInfCobranzaIMPBRU_CN.AsFloat;
       qyInfCobranzaTOT_IVA_INT_IMP.AsFloat:= qyInfCobranzaTOT_IVA_INT_IMP.AsFloat + qyInfCobranzaIMPIVA_INT.AsFloat;
       qyInfCobranzaTOT_IVA_CO_IMP.AsFloat:= qyInfCobranzaTOT_IVA_CO_IMP.AsFloat + qyInfCobranzaIMPIVA_CON.AsFloat;
    End;
    QRDBTSituacion.Enabled := False; //ales
    QRDBTSituacion.Visible := True;//ales
end;

procedure TQrInfCobr.QRSubDivBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   PrintBand := qyInfCobranzaCVE_EMISOR_NAFIN.AsString <> '0' ;
end;

procedure TQrInfCobr.qrbDETALLEBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
var
   sCveCesion, sFecha  : String;
begin
   qrdbF_VALOR.Visible := qyInfCobranzaFH_CANCELA.AsString <> '';
   qrdbF_VALOR.Enabled := qyInfCobranzaFH_CANCELA.AsString <> '';
   // < / EASA 11 ABRIL 2006 Requerimiento 200602/014
   if vlIdCred <> qyInfCobranza.FieldByName('ID_CREDITO').AsInteger then
   Begin
      vlNumCred := vlNumCred + 1;
      vlNumCrPr := vlNumCrPr + 1;
      vlIdCred  := qyInfCobranza.FieldByName('ID_CREDITO').AsInteger;
   end;
   // EASA > /

   If (sArchivo <>'')and(Trim(sDetalleRep)='D') Then Begin
      If Trim(sTipReporte)= 'A' Then
         sCveCesion:= qyInfCobranza.FieldByName('CONCEPTO').AsString
      Else If Trim(sTipReporte)= 'P' Then
         sCveCesion:= qyInfCobranza.FieldByName('ID_CREDITO').AsString;
      If qrdbF_VALOR.Enabled Then
         sFecha:= qyInfCobranza.FieldByName('FH_CANCELA').AsString;
      Writeln(F,
                 qyInfCobranza.FieldByName('CVE_MONEDA').AsString + #09 +
                 qyInfCobranza.FieldByName('DESC_MONEDA').AsString + #09 +
                 qyInfCobranza.FieldByName('CVE_TIPO_SECTOR').AsString + #09 +
                 qyInfCobranza.FieldByName('ID_PROM_ADM').AsString + #09 +
                 qyInfCobranza.FieldByName('NOM_PROMOTOR_ADM').AsString + #09 +
                 qyInfCobranza.FieldByName('CVE_PRODUCTO_CRE').AsString + #09 +
                 qyInfCobranza.FieldByName('DESC_L_PRODUCTO').AsString + #09 +
                 qyInfCobranza.FieldByName('ID_TITULAR').AsString + #09 +
                 qyInfCobranza.FieldByName('NOMBRE').AsString + #09 +
                 qyInfCobranza.FieldByName('CVE_EMISOR_NAFIN').AsString + #09 +
                 qyInfCobranza.FieldByName('NOMBRE_EMISOR').AsString + #09 +
                 qyInfCobranza.FieldByName('CHEQUERA_EMI').AsString + #09 +
                 FormatFloat('###,###,###,##0.00',qyInfCobranza.FieldByName('SALDO').AsFloat) + #09 +
                 qyInfCobranza.FieldByName('ID_CREDITO').AsString + #09 +
                 qyInfCobranza.FieldByName('ID_PROVEEDOR').AsString + #09 +
                 qyInfCobranza.FieldByName('NOM_PROVEEDOR').AsString + #09 +
                 qyInfCobranza.FieldByName('ID_PROV_NAFINSA').AsString + #09 +
                 qyInfCobranza.FieldByName('CHEQUERA_PROV').AsString + #09 +
                 qyInfCobranza.FieldByName('TIPO_MOVTO').AsString + #09 +
                 sCveCesion + #09 +
                 qyInfCobranza.FieldByName('PER_DOC').AsString + #09 +
                 qyInfCobranza.FieldByName('DESC_CALCULO').AsString + #09 +
                 qyInfCobranza.FieldByName('CVE_TASA_REFER').AsString + #09 +
                 qyInfCobranza.FieldByName('TASA_APLICADA').AsString + #09 +
                 qyInfCobranza.FieldByName('SOBRETASA').AsString + #09 +

                 FormatFloat('###,###,###,##0.00',qyInfCobranza.FieldByName('IMPBRU_CAP').AsFloat) + #09 +
                 FormatFloat('###,###,###,##0.00',qyInfCobranza.FieldByName('IMPBRU_FN').AsFloat) + #09 +
                 FormatFloat('###,###,###,##0.00',qyInfCobranza.FieldByName('IMPBRU_INT').AsFloat) + #09 +
                 FormatFloat('###,###,###,##0.00',qyInfCobranza.FieldByName('IMPBRU_CN').AsFloat) + #09 +
                 FormatFloat('###,###,###,##0.00',qyInfCobranza.FieldByName('IMPMOR_CAP').AsFloat) + #09 +
                 FormatFloat('###,###,###,##0.00',qyInfCobranza.FieldByName('IMPMOR_FIN').AsFloat) + #09 +
                 FormatFloat('###,###,###,##0.00',qyInfCobranza.FieldByName('IMPMOR_CON').AsFloat) + #09 +
                 FormatFloat('###,###,###,##0.00',qyInfCobranza.FieldByName('IMPMOR_INT').AsFloat) + #09 +
                 FormatFloat('###,###,###,##0.00',qyInfCobranza.FieldByName('IMPIVA_INT').AsFloat) + #09 +
                 FormatFloat('###,###,###,##0.00',qyInfCobranza.FieldByName('IMPIVA_CON').AsFloat) + #09 +
                 FormatFloat('###,###,###,##0.00',qyInfCobranza.FieldByName('IMPIVA_MOR').AsFloat) + #09 +
                 FormatFloat('###,###,###,##0.00',qyInfCobranza.FieldByName('BENBCO').AsFloat) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprTotal.Value.dblResult)+ #09 +
                 FormatFloat('#0.0000',qyInfCobranza.FieldByName('TIPO_CAMBIO').AsFloat) + #09 +
                 qyInfCobranza.FieldByName('CVE_USU_ALTA').AsString + #09 +
                 qyInfCobranza.FieldByName('FH_ALTA').AsString + #09 +
                 sFecha);

   End;
end;

procedure TQrInfCobr.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   // < / EASA 11 ABRIL 2006 Requerimiento 200602/014
   qrlNUM_TOT_CRED.Caption := IntToStr(vlNumCred);
   //  EASA > /
   If sArchivo <>'' Then Begin
      Writeln(F,'');
      Writeln(F, #09#09 + 'Total IVA Anticipado' + #09#09 +
                 FormatFloat('###,###,###,##0.00',qrexpTOT_IVA_ANT.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr9.Value.dblResult));
      Writeln(F, #09#09 + 'Total IVA Programado' + #09#09 +
                 FormatFloat('###,###,###,##0.00',QRExpr5.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr8.Value.dblResult));
      Writeln(F, #09#09 + 'Total IVA Impagado' + #09#09 +
                 FormatFloat('###,###,###,##0.00',QRExpr6.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr7.Value.dblResult));
      Writeln(F, #09#09 + 'Total Global IVA' + #09#09 +
                 FormatFloat('###,###,###,##0.00',QRExpr12.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr11.Value.dblResult));
      Writeln(F, '');
   End;
   If qyInfCobranza.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

procedure TQrInfCobr.QRFooterMovtoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin

      Writeln(F, #09 +'Total Edo. de la Disp.' +#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                                                #09#09#09#09#09#09#09#09#09#09#09 +
                 FormatFloat('###,###,###,##0.00',QRExpr104.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr105.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr113.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPBRUCN1.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORCP1.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORFN1.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORIN1.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORCN1.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVAIN1.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVACN1.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVAMOR8.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprTOTAL_B1.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprTotal1.Value.dblResult) );
   End;
end;

procedure TQrInfCobr.QRFooterCesionBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09 +'Total por Cesión' +#09#09#09#09#09#09#09#09#09#09#09#09#09+
                                          #09#09#09#09#09#09#09#09#09#09#09 +
                 FormatFloat('###,###,###,##0.00',QRExpr2.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr16.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr1.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPBRUCN2.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORCP2.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORFN2.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORIN2.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORCN2.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVAIN2.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVACN2.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVAMOR2.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprTOTAL_B2.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprTotal2.Value.dblResult) );
   End;
end;

procedure TQrInfCobr.QRFootSubDivBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09 +'Total por SubDiv' +#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                                          #09#09#09#09#09#09#09#09#09#09#09 +
                 FormatFloat('###,###,###,##0.00',QRExpr43.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr44.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr46.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPBRUCN3.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORCP3.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORFN3.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORIN3.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORCN3.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVAIN3.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVACN3.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVAMOR3.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprTOTAL_B3.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprTotal3.Value.dblResult) );
   End;
end;

procedure TQrInfCobr.QRFooterTitularBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09 +'Total por Titular' +#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                                           #09#09#09#09#09#09#09#09#09#09#09 +
                 FormatFloat('###,###,###,##0.00',QRExpr53.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr65.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr94.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPBRUCN4.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORCP4.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORFN4.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORIN4.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORCN4.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVAIN4.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVACN4.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVAMOR4.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprTOTAL_B4.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprTotal4.Value.dblResult) );
   End;
end;

procedure TQrInfCobr.QRFooterProductoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrlNUM_TOT_CRED_PROD.Caption := IntToStr(vlNumCrPr);
   If sArchivo <>'' Then Begin
      Writeln(F,  #09 +'Total por Producto' +#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                                             #09#09#09#09#09#09#09#09#09#09#09 +
                 FormatFloat('###,###,###,##0.00',QRExpr14.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr27.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr3.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPBRUCN5.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORCP5.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORFN5.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORIN5.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORCN5.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVAIN5.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVACN5.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVAMOR5.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprTOTAL_B5.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprTotal5.Value.dblResult) );
   End;
end;

procedure TQrInfCobr.QRFooterPromotorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F,  #09 +'Total por Promotor' +#09#09#09#09#09#09#09#09#09#09#09#09#09+
                                             #09#09#09#09#09#09#09#09#09#09#09 +
                 FormatFloat('###,###,###,##0.00',QRExpr39.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr41.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr13.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPBRUCN6.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORCP6.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORFN6.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORIN6.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORCN6.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVAIN6.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVACN6.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVAMOR6.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprTOTAL_B6.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprTotal6.Value.dblResult) );
   End;
end;

procedure TQrInfCobr.QRBFootSectorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, '');
      Writeln(F, 'Núm. Doctos' + #09 + IntToStr(QRExpr10.Value.intResult) + #09 +
                 'Total de SECTOR' + #09 +
                 qyInfCobranza.FieldByName('CVE_TIPO_SECTOR').AsString);
      Writeln(F, 'Total' +#09#09#09#09#09#09#09#09#09#09#09#09#09+
                          #09#09#09#09#09#09#09#09#09#09#09 +
                 FormatFloat('###,###,###,##0.00',QRExpr117.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr72.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPBRUIN7.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPBRUCN7.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORCP7.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORFN7.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORIN7.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORCN7.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVAIN7.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVACN7.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVAMOR7.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprTOTAL_B7.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprTotal7.Value.dblResult) );
      Writeln(F, 'Vigente' + #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                 FormatFloat('###,###,###,##0.00',QRExpr82.Value.dblResult) + #09#09 +
                 FormatFloat('###,###,###,##0.00',QRExpr4.Value.dblResult));
      Writeln(F, '');
   End;
end;

procedure TQrInfCobr.QRFooterMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F,'');
      Writeln(F, #09 +'Total por Moneda' +#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                                          #09#09#09#09#09#09#09#09#09#09#09 +
                 FormatFloat('###,###,###,##0.00',QRExpr52.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExpr54.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPBRUIN8.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPBRUCN8.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORCP8.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORFN8.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORIN8.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPMORCN8.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVAIN8.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVACN8.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprIMPIVAMOR8.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprTOTAL_B8.Value.dblResult) + #09 +
                 FormatFloat('###,###,###,##0.00',QRExprTotal8.Value.dblResult) );
      Writeln(F, #09 +'Vigente' + #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                 FormatFloat('###,###,###,##0.00',qrexpCAP_VIG.Value.dblResult) + #09 + #09 +
                 FormatFloat('###,###,###,##0.00',qrexpINT_VIG.Value.dblResult));
      Writeln(F, '');
   End;
end;
// < / EASA 11 ABRIL 2006 Requerimiento 200602/014
procedure TQrInfCobr.OcultaConceptos(bTasas :Boolean);
begin
  if bTasas then Begin
     qrshIMPCN.Enabled := False;        qrlIMPCN.Enabled := False;              qrdbIMPBRUCN.Enabled := False;
     QRExprIMPBRUCN1.Enabled := False;  QRExprIMPBRUCN2.Enabled := False;
     QRExprIMPBRUCN3.Enabled := False;  QRExprIMPBRUCN4.Enabled := False;
     QRExprIMPBRUCN5.Enabled := False;  QRExprIMPBRUCN6.Enabled := False;
     QRExprIMPBRUCN7.Enabled := False;  QRExprIMPBRUCN8.Enabled := False;

     qrshMORCN.Enabled := False;        qrlMORCN.Enabled := False;              qrdbIMPMORCN.Enabled := False;
     QRExprIMPMORCN1.Enabled := False;  QRExprIMPMORCN2.Enabled := False;
     QRExprIMPMORCN3.Enabled := False;  QRExprIMPMORCN4.Enabled := False;
     QRExprIMPMORCN5.Enabled := False;  QRExprIMPMORCN6.Enabled := False;
     QRExprIMPMORCN7.Enabled := False;  QRExprIMPMORCN7.Enabled := False;

     qrlIVACN.Enabled := False;         qrshIVACN.Enabled := False;             qrdbIMPIVACN.Enabled := False;
     QRExprIMPIVACN1.Enabled := False;  QRExprIMPIVACN2.Enabled := False;
     QRExprIMPIVACN3.Enabled := False;  QRExprIMPIVACN4.Enabled := False;
     QRExprIMPIVACN5.Enabled := False;  QRExprIMPIVACN6.Enabled := False;
     QRExprIMPIVACN7.Enabled := False;  QRExprIMPIVACN8.Enabled := False;

     qrlBENGOB.Enabled := False;        qrshBENGOB.Enabled := False;            qrdbBENGOB.Enabled := False;
     QRExprTOTAL_B1.Enabled := False;   QRExprTOTAL_B2.Enabled := False;
     QRExprTOTAL_B3.Enabled := False;   QRExprTOTAL_B4.Enabled := False;
     QRExprTOTAL_B5.Enabled := False;   QRExprTOTAL_B6.Enabled := False;
     QRExprTOTAL_B7.Enabled := False;   QRExprTOTAL_B8.Enabled := False;

     qrlTIPOCAMBIO.Enabled := False;    qrshTIPOCAMBIO.Enabled := False;        qrdbTIPOCAMBIO.Enabled := False;
     qrshUSUARIO.Enabled := False;      qrlUSUARIO.Enabled := False;            qrdbUSUARIO.Enabled := False;

     //TASAS
     qrshTIPOCALC.Enabled := True;      qrlTIPOCALC.Enabled := True;
     qrshCVETASA.Enabled := True;       qrlCVETASA.Enabled := True;
     qrshSOBRETASA.Enabled := True;     qrlSOBRETASA.Enabled := True;
     qrshTASAAPLI.Enabled := True;      qrlTASAAPLI.Enabled := True;
     qrdbTIPOCALCULO.Enabled := True;   qrdbCVETASA.Enabled := True;
     qrdbSOBRETASA.Enabled := True;     qrdbTASAAPLICADA.Enabled := True;
     //
     qrlMORAS.Width := 123;             qrlMORAS.Left := 601;
     qrshMORAS.Width := 133;            qrshMORAS.Left := 593;
     qrlIVA.Width := 81;                qrlIVA.Left := 729;
     qrshIVA.Width := 89;               qrshIVA.Left := 725;

     qrshMORCP.Left := 593;             qrlMORCP.Left := 596;
     qrdbIMPMORCP.Left := 588;          QRExprIMPMORCP1.Left := 588;    QRExprIMPMORCP2.Left := 588;
     QRExprIMPMORCP3.Left := 588;       QRExprIMPMORCP4.Left := 588;    QRExprIMPMORCP5.Left := 588;
     QRExprIMPMORCP6.Left := 588;       QRExprIMPMORCP7.Left := 604;    QRExprIMPMORCP8.Left := 604;

     qrshMORFN.Left := 637;             qrlMORFN.Left := 638;
     qrdbIMPMORFN.Left := 636;          QRExprIMPMORFN1.Left := 636;    QRExprIMPMORFN2.Left := 636;
     QRExprIMPMORFN3.Left := 636;       QRExprIMPMORFN4.Left := 636;    QRExprIMPMORFN5.Left := 636;
     QRExprIMPMORFN6.Left := 636;       QRExprIMPMORFN7.Left := 648;    QRExprIMPMORFN8.Left := 648;

     qrshMORINT.Left := 681;            qrlMORINT.Left := 683;
     qrdbIMPMORINT.Left := 683;         QRExprIMPMORIN1.Left := 683;    QRExprIMPMORIN2.Left := 683;
     QRExprIMPMORIN3.Left := 683;       QRExprIMPMORIN4.Left := 683;    QRExprIMPMORIN5.Left := 683;
     QRExprIMPMORIN6.Left := 683;       QRExprIMPMORIN7.Left := 695;    QRExprIMPMORIN8.Left := 695;

     qrshIVAINT.Left := 725;            qrlIVAINT.Left := 728;
     qrdbIMPIVAIN.Left := 730;          QRExprIMPIVAIN1.Left := 730;    QRExprIMPIVAIN2.Left := 730;
     QRExprIMPIVAIN3.Left := 730;       QRExprIMPIVAIN4.Left := 730;    QRExprIMPIVAIN5.Left := 730;
     QRExprIMPIVAIN6.Left := 730;       QRExprIMPIVAIN7.Left := 740;    QRExprIMPIVAIN8.Left := 740;

     qrshIVAMOR.Left := 769;            qrlIVAMOR.Left := 772;
     qrdbIMPIVAMOR.Left  := 776;        QRExprIMPIVAMOR1.Left  := 776;  QRExprIMPIVAMOR2.Left  := 776;
     QRExprIMPIVAMOR3.Left  := 776;     QRExprIMPIVAMOR4.Left  := 722;  QRExprIMPIVAMOR5.Left  := 776;
     QRExprIMPIVAMOR6.Left  := 776;     QRExprIMPIVAMOR7.Left  := 786;  QRExprIMPIVAMOR8.Left  := 786;

     qrlTOTAL.Left := 821;              qrshTOTAL.Left := 813;
     QRExprTotal.Left  := 819;          QRExprTotal1.Left := 819;       QRExprTotal2.Left := 819;
     QRExprTotal3.Left := 819;          QRExprTotal4.Left := 819;       QRExprTotal5.Left := 819;
     QRExprTotal6.Left := 819;          QRExprTotal7.Left := 832;       QRExprTotal8.Left := 832;

     qrshF_OPERA.Left := 504;           qrlF_OPERA.Left := 507;         qrdbF_OPERA.Left := 503;
     qrshF_VALOR.Left := 550;           qrlF_VALOR.Left := 553;         qrdbF_VALOR.Left := 549;

  end
  else Begin
     qrshIMPCN.Enabled := True;        qrlIMPCN.Enabled := True;                qrdbIMPBRUCN.Enabled := True;
     QRExprIMPBRUCN1.Enabled := True;  QRExprIMPBRUCN2.Enabled := True;
     QRExprIMPBRUCN3.Enabled := True;  QRExprIMPBRUCN4.Enabled := True;
     QRExprIMPBRUCN5.Enabled := True;  QRExprIMPBRUCN6.Enabled := True;
     QRExprIMPBRUCN7.Enabled := True;  QRExprIMPBRUCN8.Enabled := True;

     qrshMORCN.Enabled := True;        qrlMORCN.Enabled := True;                qrdbIMPMORCN.Enabled := True;
     QRExprIMPMORCN1.Enabled := True;  QRExprIMPMORCN2.Enabled := True;
     QRExprIMPMORCN3.Enabled := True;  QRExprIMPMORCN4.Enabled := True;
     QRExprIMPMORCN5.Enabled := True;  QRExprIMPMORCN6.Enabled := True;
     QRExprIMPMORCN7.Enabled := True;  QRExprIMPMORCN7.Enabled := True;

     qrlIVACN.Enabled := True;          qrshIVACN.Enabled := True;              qrdbIMPIVACN.Enabled := True;
     QRExprIMPIVACN1.Enabled := True;  QRExprIMPIVACN2.Enabled := True;
     QRExprIMPIVACN3.Enabled := True;  QRExprIMPIVACN4.Enabled := True;
     QRExprIMPIVACN5.Enabled := True;  QRExprIMPIVACN6.Enabled := True;
     QRExprIMPIVACN7.Enabled := True;  QRExprIMPIVACN8.Enabled := True;

     qrlBENGOB.Enabled := True;         qrshBENGOB.Enabled := True;             qrdbBENGOB.Enabled := True;
     QRExprTOTAL_B1.Enabled := True;    QRExprTOTAL_B2.Enabled := True;
     QRExprTOTAL_B3.Enabled := True;    QRExprTOTAL_B4.Enabled := True;
     QRExprTOTAL_B5.Enabled := True;    QRExprTOTAL_B6.Enabled := True;
     QRExprTOTAL_B7.Enabled := True;    QRExprTOTAL_B8.Enabled := True;

     qrlTIPOCAMBIO.Enabled := True;     qrshTIPOCAMBIO.Enabled := True;         qrdbTIPOCAMBIO.Enabled := True;
     qrshUSUARIO.Enabled := True;       qrlUSUARIO.Enabled := True;             qrdbUSUARIO.Enabled := True;
     //TASAS
     qrshTIPOCALC.Enabled := False;     qrlTIPOCALC.Enabled := False;
     qrshCVETASA.Enabled := False;      qrlCVETASA.Enabled := False;
     qrshSOBRETASA.Enabled := False;    qrlSOBRETASA.Enabled := False;
     qrshTASAAPLI.Enabled := False;     qrlTASAAPLI.Enabled := False;
     qrdbTIPOCALCULO.Enabled := False;  qrdbCVETASA.Enabled := False;
     qrdbSOBRETASA.Enabled := False;    qrdbTASAAPLICADA.Enabled := False;
     //
     qrlMORAS.Width := 166;             qrlMORAS.Left := 371;
     qrshMORAS.Width := 179;            qrshMORAS.Left := 366;
     qrlIVA.Width := 122;               qrlIVA.Left := 544;
     qrshIVA.Width := 133;              qrshIVA.Left := 542;

     qrshMORCP.Left := 366;             qrlMORCP.Left := 369;
     qrdbIMPMORCP.Left := 370;          QRExprIMPMORCP1.Left := 370;    QRExprIMPMORCP2.Left := 370;
     QRExprIMPMORCP3.Left := 370;       QRExprIMPMORCP4.Left := 370;    QRExprIMPMORCP5.Left := 370;
     QRExprIMPMORCP6.Left := 370;       QRExprIMPMORCP7.Left := 378;    QRExprIMPMORCP8.Left := 378;

     qrshMORFN.Left := 410;             qrlMORFN.Left := 411;
     qrdbIMPMORFN.Left := 414;          QRExprIMPMORFN1.Left := 414;    QRExprIMPMORFN2.Left := 414;
     QRExprIMPMORFN3.Left := 414;       QRExprIMPMORFN4.Left := 414;    QRExprIMPMORFN5.Left := 414;
     QRExprIMPMORFN6.Left := 414;       QRExprIMPMORFN7.Left := 422;    QRExprIMPMORFN8.Left := 422;

     qrshMORINT.Left := 454;            qrlMORINT.Left := 456;
     qrdbIMPMORINT.Left := 459;         QRExprIMPMORIN1.Left := 459;    QRExprIMPMORIN2.Left := 459;
     QRExprIMPMORIN3.Left := 459;       QRExprIMPMORIN4.Left := 459;    QRExprIMPMORIN5.Left := 459;
     QRExprIMPMORIN6.Left := 459;       QRExprIMPMORIN7.Left := 467;    QRExprIMPMORIN8.Left := 467;

     qrshIVAINT.Left := 542;            qrlIVAINT.Left := 545;
     qrdbIMPIVAIN.Left := 548;          QRExprIMPIVAIN1.Left := 548;    QRExprIMPIVAIN2.Left := 548;
     QRExprIMPIVAIN3.Left := 548;       QRExprIMPIVAIN4.Left := 548;    QRExprIMPIVAIN5.Left := 548;
     QRExprIMPIVAIN6.Left := 548;       QRExprIMPIVAIN7.Left := 558;    QRExprIMPIVAIN8.Left := 558;

     qrshIVAMOR.Left := 630;            qrlIVAMOR.Left := 633;
     qrdbIMPIVAMOR.Left  := 636;        QRExprIMPIVAMOR1.Left  := 636;  QRExprIMPIVAMOR2.Left  := 636;
     QRExprIMPIVAMOR3.Left  := 636;     QRExprIMPIVAMOR4.Left  := 636;  QRExprIMPIVAMOR5.Left  := 636;
     QRExprIMPIVAMOR6.Left  := 636;     QRExprIMPIVAMOR7.Left  := 646;  QRExprIMPIVAMOR8.Left  := 646;

     qrlTOTAL.Left := 728;              qrshTOTAL.Left := 722;
     QRExprTotal.Left  := 726;          QRExprTotal1.Left := 726;       QRExprTotal2.Left := 726;
     QRExprTotal3.Left := 726;          QRExprTotal4.Left := 726;       QRExprTotal5.Left := 726;
     QRExprTotal6.Left := 726;          QRExprTotal7.Left := 736;       QRExprTotal8.Left := 736;

     qrshF_OPERA.Left := 870;           qrlF_OPERA.Left := 870;         qrdbF_OPERA.Left := 871;
     qrshF_VALOR.Left := 915;           qrlF_VALOR.Left := 918;         qrdbF_VALOR.Left := 917;

  end;

end;

procedure TQrInfCobr.QRGroupTipoProductoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   vlNumCrPr := 0;
end;

End.
