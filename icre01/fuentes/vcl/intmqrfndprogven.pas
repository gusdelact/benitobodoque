// Modificaciones : 020 01 2005    Importe de pago histórico
unit IntMQrFndProgVen;

interface              
                
uses SysUtils, Windows, Messages, Classes, Graphics, Controls, unSQL2,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, Dialogs, IntGenCre;
Const
   coCRLF      = #13#10;
type                             
  TQrFndProgVen = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
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
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRFooterCesion: TQRBand;
    QRFooterProducto: TQRBand;
    QRFooterPromotor: TQRBand;
    QRDBText17: TQRDBText;
    qrtTasaAplicada: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr70: TQRExpr;
    QRExpr71: TQRExpr;
    QRExpr72: TQRExpr;
    QRExpr73: TQRExpr;
    QRExpr60: TQRExpr;
    QRExpr61: TQRExpr;
    QRExpr62: TQRExpr;
    QRExpr63: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel19: TQRLabel;
    QRFooterCliente: TQRBand;
    QRLabel27: TQRLabel;
    QRExpr13: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr10: TQRExpr;
    QRShape12: TQRShape;
    dbNombre_Promotor: TQRDBText;
    dbNom_Promotor: TQRDBText;
    qrlPromotor: TQRLabel;
    QRShape14: TQRShape;
    QRDBText15: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel23: TQRLabel;
    QRShape15: TQRShape;
    dbProducto: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel4: TQRLabel;
    dbMoneda: TQRDBText;
    QRLProveedor: TQRLabel;
    dbIdProveedor: TQRDBText;
    dbNomProveedor: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText16: TQRDBText;
    QRShape17: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText12: TQRDBText;
    QRShape18: TQRShape;
    QRShape16: TQRShape;
    QRLabel1: TQRLabel;
    QRShape21: TQRShape;
    QRExpr5: TQRExpr;
    QRShape19: TQRShape;
    QRLabel28: TQRLabel;
    QRDBText25: TQRDBText;
    QRShape33: TQRShape;
    QRLabel52: TQRLabel;
    QRDBText38: TQRDBText;
    QRBFootSector: TQRBand;
    QRLabel49: TQRLabel;
    QRExpr100: TQRExpr;
    QRLabel50: TQRLabel;
    QRDBText39: TQRDBText;
    QRExpr50: TQRExpr;
    QRExpr51: TQRExpr;
    QRExpr52: TQRExpr;
    QRExpr53: TQRExpr;

    QRGroupPromotor1 : TQRGroup;
    QRGroupMoneda : TQRGroup;
    QRGroupSector : TQRGroup;
    QRGroupProducto : TQRGroup;
    QRGroup1 : TQRGroup;
    QRGroup2 : TQRGroup;
    QRGroupNombre : TQRGroup;
    QRGroupCesion : TQRGroup;
    QRLabel5: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRCapital: TQRLabel;
    QRInteres: TQRLabel;
    QRRefin: TQRLabel;
    QRShape23: TQRShape;
    QRCapitalT: TQRLabel;
    QRInteresT: TQRLabel;
    QRRefinT: TQRLabel;
    QRLabel39: TQRLabel;
    QRComsion: TQRLabel;
    QRIVAComis: TQRLabel;
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
    QRPIVAComis: TQRLabel;
    QRPCapitalT: TQRLabel;
    QRPInteresT: TQRLabel;
    QRPRefinT: TQRLabel;
    QRPComsionT: TQRLabel;
    SummaryBand1: TQRBand;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRGroupEntidad: TQRGroup;
    QRGroupPrograma: TQRGroup;
    QRFooterEntidad: TQRBand;
    QRFooterPrograma: TQRBand;
    QRShape9: TQRShape;
    QRShape20: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText33: TQRDBText;
    QRExpr40: TQRExpr;
    QRExpr41: TQRExpr;
    QRExpr42: TQRExpr;
    QRExpr43: TQRExpr;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    QRExpr32: TQRExpr;
    QRExpr33: TQRExpr;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
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
    qyProgVenSITUACION: TStringField;
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
    qyProgVenSDO_VIG_TOTAL: TFloatField;
    qyProgVenIMP_CREDITO: TFloatField;
    qyProgVenCVE_CALCULO: TStringField;
    qyProgVenNO_REFER: TFloatField;
    qyProgVenID_TITULAR: TFloatField;
    qyProgVenCVE_FND_ENT_DES: TStringField;
    qyProgVenDESC_ENT_DES: TStringField;
    qyProgVenCVE_FND_PROGRAMA: TStringField;
    qyProgVenDESC_PROGRAMA: TStringField;
    qyProgVenCUENTA_VIGENTE_INT: TStringField;
    qyProgVenCUENTA_VIGENTE_K: TStringField;
    QRShape25: TQRShape;
    QRLabel45: TQRLabel;
    QRDBText18: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr21: TQRExpr;
    QRShape26: TQRShape;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel51: TQRLabel;
    QRPrCapital: TQRLabel;
    QRPrInteres: TQRLabel;
    QRPrRefin: TQRLabel;
    QRPrComsion: TQRLabel;
    QRPrCapitalT: TQRLabel;
    QRPrInteresT: TQRLabel;
    QRPrRefinT: TQRLabel;
    QRPrComsionT: TQRLabel;
    QRShape27: TQRShape;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRECapital: TQRLabel;
    QREInteres: TQRLabel;
    QRERefin: TQRLabel;
    QREComis: TQRLabel;
    QRECapitalT: TQRLabel;
    QREInteresT: TQRLabel;
    QRERefinT: TQRLabel;
    QREComisT: TQRLabel;
    QRPrIVAComis: TQRLabel;
    QREIVAComis: TQRLabel;
    QRShape10: TQRShape;
    QRLabel21: TQRLabel;
    QRShape22: TQRShape;
    QRLabel33: TQRLabel;
    QRDBText19: TQRDBText;
    //
    procedure qyProgVenCalcFields(DataSet: TDataSet);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;   var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRFooterMonedaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRFooterProductoBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
    procedure QRFooterCesionBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRFooterClienteBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBFootSectorBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRFooterPromotorBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRFooterEntidadBeforePrint(Sender: TQRCustomBand;var PrintBand: Boolean);
    procedure QRFooterProgramaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
   VLCapital : Double;
   VLInteres : Double;
   VLRefin  :  Double;
   VLComision : Double;
   VLIVAComision : Double;
   VLCapitalM : Double;
   VLInteresM : Double;
   VLRefinM  :  Double;
   VLComisionM : Double;
   VLCapitalT : Double;
   VLInteresT : Double;
   VLRefinT  :  Double;
   VLComisionT : Double;

   VLPCapital : Double;
   VLPInteres : Double;
   VLPRefin  :  Double;

   // Producto
   VLPComision  : Double;
   VLPIVAComis  : Double;
   VLPCapitalM  : Double;
   VLPInteresM  : Double;
   VLPRefinM    :  Double;
   VLPComisionM : Double;
   VLPCapitalT  : Double;
   VLPInteresT  : Double;
   VLPRefinT    :  Double;
   VLPComisionT : Double;

   // Programa de apoyo
   VLPrCapital   : Double;
   VLPrInteres   : Double;
   VLPrRefin     : Double;
   VLPrComision  : Double;

   VLPrIVAComis  : Double;

   VLPrCapitalT  : Double;
   VLPrInteresT  : Double;
   VLPrRefinT    : Double;
   VLPrComisionT : Double;
   // Entidad descontadora
   VLECapital   : Double;
   VLEInteres   : Double;
   VLERefin     : Double;
   VLEComision  : Double;

   VLEIVAComis  : Double;

   VLECapitalT  : Double;
   VLEInteresT  : Double;
   VLERefinT    : Double;
   VLEComisionT : Double;




   public


   Function FormaQuery(sF_Vencimiento,sF_Programada,sProducto,sMoneda,
                        sAcreditado, sProveedor, sPromAsoc,sPromAdmon,
                        sCesion,sSituacion,sOrden,sTipoReporte,sFecRep,
                        sTipoProd, sEmpresa, sSucursal,sGpoProd, sOperDD,
                        sOrigen, sEntidad, sPrograma:String;
                        sSituacionAC, sSituacionPS:string; //HERJA 16.12.2010
                        bIncTipoSec:Boolean):String;
   end;

var
   QrFndProgVen: TQrFndProgVen;
   bGenArch: Boolean;
   sArchivo:String;
   F: TextFile;
Procedure RepFndProgVen(  sF_Vencimiento,sF_Programada,sProducto,sMoneda,
                       sAcreditado, sProveedor, sPromAsoc,sPromAdmon,
                       sCesion,sSituacion,sOrden,sTipoReporte,sFecRep,
                       sTipoProd, sNbrArch, sEmpresa, sSucursal,
                       sGpoProd, sOperDD, sOrigen, sEntidad, sPrograma:String;
                       sSituacionAC, sSituacionPS:string; //HERJA 16.12.2010
                       bIncTipoSec:Boolean;
                       pAPli     : TInterApli;
                       pPreview  : Boolean);
Implementation
{$R *.DFM}

function  NvlStr( pStr, pStrNvl : String ) : String;
begin
   If pStr <> '' Then
      Result := pStr
   Else
      Result := pStrNvl;
end;

Procedure RepFndProgVen(  sF_Vencimiento,sF_Programada,sProducto,sMoneda,
                       sAcreditado, sProveedor, sPromAsoc,sPromAdmon,
                       sCesion,sSituacion,sOrden,sTipoReporte,sFecRep,
                       sTipoProd, sNbrArch, sEmpresa, sSucursal,
                       sGpoProd, sOperDD, sOrigen, sEntidad, sPrograma:String;
                       sSituacionAC, sSituacionPS:string; //HERJA 16.12.2010
                       bIncTipoSec:Boolean;
                       pAPli     : TInterApli;
                       pPreview  : Boolean);
Var
   QrFndProgVen: TQrFndProgVen;
   VLTitulo : String;
   Preview     : TIntQRPreview;
Begin
   VLTitulo := '';
   QrFndProgVen:=TQrFndProgVen.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrFndProgVen);

   Try
      bGenArch:= False;
      sArchivo:= sNbrArch;
      QrFndProgVen.QRInterEncabezado1.Apli:=pApli;
      QrFndProgVen.VLCapital := 0;
      QrFndProgVen.VLInteres := 0;
      QrFndProgVen.VLRefin  := 0;
      QrFndProgVen.VLComision  := 0;
      QrFndProgVen.VLIVAComision := 0;

      QrFndProgVen.VLCapitalM := 0;
      QrFndProgVen.VLInteresM := 0;
      QrFndProgVen.VLRefinM  := 0;
      QrFndProgVen.VLComisionM  := 0;

      QrFndProgVen.VLCapitalT := 0;
      QrFndProgVen.VLInteresT := 0;
      QrFndProgVen.VLRefinT  := 0;
      QrFndProgVen.VLComisionT  := 0;

      QrFndProgVen.VLPCapital := 0;
      QrFndProgVen.VLPInteres := 0;
      QrFndProgVen.VLPRefin  := 0;
      QrFndProgVen.VLPComision  := 0;
      QrFndProgVen.VLPIVAComis  := 0;




      QrFndProgVen.VLPCapitalM := 0;
      QrFndProgVen.VLPInteresM := 0;
      QrFndProgVen.VLPRefinM  := 0;
      QrFndProgVen.VLPComisionM  := 0;

      QrFndProgVen.VLPCapitalT := 0;
      QrFndProgVen.VLPInteresT := 0;
      QrFndProgVen.VLPRefinT  := 0;
      QrFndProgVen.VLPComisionT  := 0;



      QrFndProgVen.VLPrCapital   := 0;
      QrFndProgVen.VLPrInteres   := 0;
      QrFndProgVen.VLPrRefin     := 0;
      QrFndProgVen.VLPrComision  := 0;
      QrFndProgVen.VLPrIVAComis  := 0;
      QrFndProgVen.VLPrCapitalT  := 0;
      QrFndProgVen.VLPrInteresT  := 0;
      QrFndProgVen.VLPrRefinT    := 0;
      QrFndProgVen.VLPrComisionT := 0;
      // Entidad descontadora
      QrFndProgVen.VLECapital    := 0;
      QrFndProgVen.VLEInteres    := 0;
      QrFndProgVen.VLERefin      := 0;
      QrFndProgVen.VLEComision   := 0;
      QrFndProgVen.VLEIVAComis   := 0;
      QrFndProgVen.VLECapitalT   := 0;
      QrFndProgVen.VLEInteresT   := 0;
      QrFndProgVen.VLERefinT     := 0;
      QrFndProgVen.VLEComisionT  := 0;




      QrFndProgVen.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrFndProgVen.QRInterEncabezado1.Titulo1 := 'Vencimientos Pasivos';

      //Pone titulo
      If Trim(sF_Vencimiento)<>'' Then
         VLTitulo := VLTitulo + ' Fecha de Vencimiento ' + sF_Vencimiento;
      If Trim(sF_Programada)<>'' Then
         VLTitulo := VLTitulo + ' Fecha de Programación ' + sF_Programada;

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
      If (Trim(sSituacion)<>'') Then Begin
         If Trim(sSituacion) = 'AC' Then
            VLTitulo := VLTitulo + ' No pagada'
         Else If Trim(sSituacion) = 'IM' Then
            VLTitulo := VLTitulo + ' Cartera Impagada'
         Else If Trim(sSituacion) = 'VE' Then
            VLTitulo := VLTitulo + ' Cartera Vencida Exigible'
         Else If Trim(sSituacion) = 'IV' Then
            VLTitulo := VLTitulo + ' Cartera Impagada más Vencida Exigible'
         Else
            VLTitulo := VLTitulo + ' Por situacion de Periodo';
      End;

      If Trim(sTipoReporte)='O' Then
         VLTitulo := VLTitulo + ' (Operativo) ';
      If Trim(sTipoReporte)='C' Then
         VLTitulo := VLTitulo + ' (Al Cierre) ';

      QrFndProgVen.QRInterEncabezado1.Titulo2 := VLTitulo;

      If Not(bIncTipoSec) Then Begin
         QrFndProgVen.QRGroupSector.Enabled := False;
         QrFndProgVen.QRGroupSector.Expression := '';
         QrFndProgVen.QRBFootSector.Enabled := False;
      End;

      QrFndProgVen.qyProgVen.DatabaseName := pApli.DataBaseName;
      QrFndProgVen.qyProgVen.SessionName := pApli.SessionName;

      If (Trim(sPromAsoc)='')And(Trim(sPromAdmon)='') Then Begin
         QrFndProgVen.QRGroupPromotor1.Enabled:=False;
         QrFndProgVen.QRFooterPromotor.Enabled:=False;
         QrFndProgVen.QRGroupPromotor1.Expression:='';
      End Else If (Trim(sPromAsoc)<>'')Then Begin
         QrFndProgVen.QRGroupPromotor1.Enabled:=True;
         QrFndProgVen.QRFooterPromotor.Enabled:=True;
         QrFndProgVen.QRGroupPromotor1.Expression:='qyProgVen.ID_PERS_ASOCIAD';
         QrFndProgVen.dbNom_Promotor.DataField:= 'ID_PERS_ASOCIAD';
         QrFndProgVen.dbNombre_Promotor.DataField:= 'NOM_PROMOTOR_ASO';
         QrFndProgVen.qrlPromotor.Caption:='Promotor Asociado';
      End Else If (Trim(sPromAdmon)<>'')Then Begin
         QrFndProgVen.QRGroupPromotor1.Enabled:=True;
         QrFndProgVen.QRFooterPromotor.Enabled:=True;
         QrFndProgVen.QRGroupPromotor1.Expression:='qyProgVen.ID_PROM_ADM';
         QrFndProgVen.dbNom_Promotor.DataField:= 'ID_PROM_ADM';
         QrFndProgVen.dbNombre_Promotor.DataField:= 'NOM_PROMOTOR_ADM';
         QrFndProgVen.qrlPromotor.Caption:='Promotor Admón';
      End;

      QrFndProgVen.qyProgVen.Active:=False;
      QrFndProgVen.qyProgVen.SQL.Text:= QrFndProgVen.FormaQuery(sF_Vencimiento,sF_Programada,sProducto,sMoneda,
                      sAcreditado, sProveedor, sPromAsoc,sPromAdmon,sCesion,sSituacion,sOrden,sTipoReporte,
                      sFecRep,sTipoProd, sEmpresa, sSucursal,sGpoProd, sOperDD,
                      sOrigen, sEntidad, sPrograma,
                      sSituacionAC, sSituacionPS,
                      bIncTipoSec);
       QrFndProgVen.qyProgVen.SQL.SaveToFile('C:\QRY_FND_VENTTO.CHK.SQL');  // LOLS 02 05 2005
      QrFndProgVen.qyProgVen.Active:=True;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrFndProgVen.QRInterEncabezado1.Titulo1+ #09 );
         Writeln(F, QrFndProgVen.QRInterEncabezado1.Titulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F,
             //Grupos
             'Promotor Asociado'+ #09#09 +
             'Moneda'+ #09#09 +
             'Sector'+ #09 +
             'Producto'+ #09#09 +
             'Titular'+ #09#09 +
             'Núm. EXTERNO'+ #09 +
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
             'Total' +  #09+
             'Situación al día');
      End;
      If pPreview Then
          QrFndProgVen.Preview
      Else
          QrFndProgVen.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrFndProgVen.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrFndProgVen.FormaQuery(  sF_Vencimiento,sF_Programada,sProducto,sMoneda,
                        sAcreditado, sProveedor, sPromAsoc,sPromAdmon,
                        sCesion,sSituacion,sOrden,sTipoReporte,sFecRep,sTipoProd,
                        sEmpresa, sSucursal,sGpoProd, sOperDD,sOrigen, sEntidad,
                        sPrograma:String;
                        sSituacionAC, sSituacionPS:string; //HERJA 16.12.2010
                        bIncTipoSec:Boolean):String;
Var
   sSQL, sSQLWhere, VlSituacion, VLDiaHoy, VLComparador, vlBFinDia,
   VLTipoRep, sF_Calculo :String;
   VLBFechaTras : Boolean;
Begin
   VLDiaHoy := 'D000';
   If sSituacion = 'VE' Then Begin
      VLBFechaTras := True;
      VlSituacion := 'IM';
   End Else If sSituacion = 'IV' Then Begin
      VLBFechaTras := False;
      VlSituacion := 'IM';
   End Else If sSituacion = 'AC' Then Begin
      VLBFechaTras := False;
      VlSituacion := 'AC';
   End Else Begin
      VLBFechaTras := False;
      VlSituacion := sSituacion;
   End;

   If (((sSituacion = 'VE') Or (sSituacion = 'IM') Or (sSituacion = 'IV')) And  (sFecRep = 'A'))  Then
      VLComparador := '<='
   Else
      VLComparador := '=';

   If Trim(sTipoReporte)='O' Then
   begin
      VLTipoRep := '';
      vlBFinDia := 'F';
   end;
   If Trim(sTipoReporte)='C' Then
   begin
      VLTipoRep := ' + 1 ';
      vlBFinDia := 'V';
   end;

   sF_Calculo := Trim(sF_Vencimiento);
   If Trim(sF_Vencimiento) = '' Then
      sF_Calculo := Trim(sF_Programada);

   sSQL:=   ' SELECT '+ coCRLF +
            '   0 DIASIMVE,'+ coCRLF +
            '   SUBDIV.ID_CESION        ,       CD.ID_DOCUMENTO, '+ coCRLF +
            //HERJA
            '   ACCE.*                  , '+ coCRLF +

            '   NVL(CD.ID_DOCUMENTO, TO_CHAR(ACCE.NUM_PERIODO)) AS NUM_PERIODO_PER, '+ coCRLF +
//            '   CTO.CVE_MONEDA          ,       M.DESC_MONEDA                   , '+ coCRLF +
            '   CTO.CVE_MONEDA          , '+ coCRLF +
            '   (SELECT DESC_MONEDA FROM MONEDA WHERE CVE_MONEDA=CTO.CVE_MONEDA) AS DESC_MONEDA, '+ coCRLF +
            //FIN HERJA
            '   CC.ID_PROM_ADM          ,       PPR.NOMBRE NOM_PROMOTOR_ADM     , '+ coCRLF +
            '   CTO.ID_PERS_ASOCIAD     ,       PPRC.NOMBRE NOM_PROMOTOR_ASO    , '+ coCRLF +
            '   CPR.CVE_PRODUCTO_CRE    ,       CPR.DESC_L_PRODUCTO             , '+ coCRLF +
            '   CC.ID_CREDITO           ,       CC.ID_CONTRATO                  , '+ coCRLF +
            '   DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PTIT.APELLIDO_PATERNO||'' ''||PTIT.APELLIDO_MATERNO||'' ''||PTIT.NOMBRE_PERSONA) NOMBRE, '+ coCRLF +
            '   SUBDIV.ID_EMISOR        ,       NVL(SUBDIV.CVE_EMISOR_NAFIN,0) CVE_EMISOR_NAFIN,'+ coCRLF +
            '   SUBDIV.ID_PROVEEDOR     ,       SUBDIV.NOMBRE_EMISOR    ,   PCE.CVE_TIPO_SECTOR, '+ coCRLF +
            '   SUBSTR(PKGCRPERIODO.STPObtChqCte(SUBDIV.ID_EMISOR,SUBDIV.CVE_EMISOR_NAFIN,SUBDIV.ID_CESION,SUBDIV.TIPO_ACRED,''AD'',''CR''),1,20) CUENTA_BANCO,'+ coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
            '   PP.NOMBRE NOM_PROVEEDOR ,       CP.ID_PROV_EXTERNO AS ID_PROV_NAFINSA                      , '+ coCRLF +
{/ROIM}
            '   CC.SDO_INSOLUTO         ,       CC.SDO_VIG_TOTAL                        , '+ coCRLF +
            '   CC.IMP_CREDITO          ,       CC.CVE_CALCULO                          , '+ coCRLF +
            '   0 NO_REFER              ,       CTO.ID_TITULAR                          , '+ coCRLF +
            //HERJA
//            '   CR_FND_ENT_DES.CVE_FND_ENT_DES,   CR_FND_ENT_DES.DESC_ENT_DES, '+ coCRLF +
//            '   CR_FND_PROGRAMA.CVE_FND_PROGRAMA, CR_FND_PROGRAMA.DESC_PROGRAMA, '+ coCRLF +
//
//            '   CFC.CVE_FND_ENT_DES, '+ coCRLF +
            '   (SELECT DESC_ENT_DES FROM CR_FND_ENT_DES WHERE CVE_FND_ENT_DES=CFC.CVE_FND_ENT_DES ) AS DESC_ENT_DES, '+ coCRLF +
//            '   CFC.CVE_FND_PROGRAMA, '+ coCRLF +
            '   (SELECT DESC_PROGRAMA FROM CR_FND_PROGRAMA WHERE CVE_FND_ENT_DES=CFC.CVE_FND_ENT_DES AND CVE_FND_PROGRAMA=CFC.CVE_FND_PROGRAMA ) AS DESC_PROGRAMA, '+ coCRLF +
            //FIN HERJA
            '   SUBSTR( PKGCRREDESCTO.FUNOBTCTAREDESC ( ''RK'',  CPR.CVE_PRODUCTO_GPO,'+ coCRLF +
            '     CCPD.TIPO_CUENTAO, CTO.CVE_MONEDA ), 1, 20 ) CUENTA_VIGENTE_K,'+ coCRLF +
            '   SUBSTR( PKGCRREDESCTO.FUNOBTCTAREDESC ( ''RI'',  CPR.CVE_PRODUCTO_GPO,'+ coCRLF +
            '     CCPD.TIPO_CUENTAO, CTO.CVE_MONEDA ), 1, 20 ) CUENTA_VIGENTE_INT'+ coCRLF +

            //FROM DEL QUERY PRINCIPAL
            ' FROM ' + coCRLF;
            //************************CAPITAL

            sSQL:= sSQL +
            ' (SELECT CCA.ID_CREDITO,' + coCRLF +
            '         CCA.CVE_FND_ENT_DES, CCA.CVE_FND_PROGRAMA,' + coCRLF + //HERJA
            '         ''CAPITAL'' ACCESORIO,' + coCRLF +
            '         CCA.NUM_PERIODO,' + coCRLF +
            '         CCA.PLAZO,' + coCRLF +
            '         (CCA.F_VENCIMIENTO - CCA.PLAZO) F_INICIO,' + coCRLF +
            '         CCA.F_VENCIMIENTO,' + coCRLF +
            '         CCA.F_PROG_PAGO,' + coCRLF +
            '         CCA.F_PAGO,' + coCRLF +
            '         CCA.TASA_APLICADA,' + coCRLF +
            '         (CCA.IMP_CAPITAL - CCA.IMP_PAGADO_HIST ) IMPORTE,' + coCRLF +
            '         0 IMP_IVA,' + coCRLF +
            '         CCA.SIT_CAPITAL SITUACION,' + coCRLF +
            '         0 IMP_BENEFICIO,' + coCRLF +
            '         (CCA.IMP_CAPITAL - CCA.IMP_PAGADO_HIST ) IMP_TOTAL' + coCRLF +
            '  FROM  (SELECT CCA.*,' + coCRLF +
            '                0  TASA_APLICADA,' + coCRLF +
            '                NVL(PKGCRCOMUN.STPOBTFNDIMPPAGADO( ''RK'', ''IMPBRU'', CCA.ID_CREDITO,' + coCRLF +
            '                  CCA.CVE_FND_ENT_DES, CCA.CVE_FND_PROGRAMA,   CCA.NUM_PERIODO,' + coCRLF +
            '                  NULL, ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) )+
                               ',' + SQLStr(vlBFinDia) + '), 0) AS IMP_PAGADO_HIST ' + coCRLF +
            '         FROM   CR_FND_CAPITAL CCA' + coCRLF+
            '           WHERE CCA.SIT_CAPITAL <> ''CA''';//EASA4011 21.08.2007 CORRECICON NO MOSTRAR FONDEO CANCELADO


   sSQLWhere := '';
   If Trim(sF_Vencimiento)<>'' Then
      AddSQL( sSQLWhere, '  AND CCA.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF )
   Else If Trim(sF_Programada)<>'' Then
      AddSQL( sSQLWhere, '  AND CCA.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF );

   If (Trim(VlSituacion)='IM') Then Begin
      AddSQL( sSQLWhere, '  AND ((CCA.F_PROG_PAGO < CCA.F_PAGO AND '   +
                         '      CCA.SIT_CAPITAL <> ''CA'' AND '  + coCRLF +
                         '      CCA.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                         '      OR (CCA.SIT_CAPITAL = ''IM'' ))' + coCRLF );
   End;

   If sSQLWhere <> '' Then
      sSQL := sSQL + sSQLWhere;

   If (Trim(sEntidad)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND CCA.CVE_FND_ENT_DES    ='+ SQLStr( sEntidad );

   If (Trim(sPrograma)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND CCA.CVE_FND_PROGRAMA   ='+ SQLStr( sPrograma );

   sSQL := sSQL + '        )CCA' + coCRLF;

   //************************INTERES

   sSQL:= sSQL + '  UNION '+ coCRLF +
         '  SELECT CCI.ID_CREDITO, '+ coCRLF +
         '         CCI.CVE_FND_ENT_DES, CCI.CVE_FND_PROGRAMA,' + coCRLF + //HERJA
         '         ''INTERES'' ACCESORIO, '+ coCRLF +
         '         CCI.NUM_PERIODO, '+ coCRLF +
         '         CCI.PLAZO, '+ coCRLF +
         '         (CCI.F_VENCIMIENTO - CCI.PLAZO) F_INICIO, '+ coCRLF +
         '         CCI.F_VENCIMIENTO, '+ coCRLF +
         '         CCI.F_PROG_PAGO, '+ coCRLF +
         '         CCI.F_PAGO,CCI.TASA_APLICADA, '+ coCRLF +
         '         (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST) IMPORTE, '+ coCRLF +
//HERJA - CAMBIO POR IVA_PROYECTADO
//         '         CCI.IMP_IVA - CCI.IMP_IVA_PAG_HIST, '+ coCRLF +
         '         NVL(CCI.IMP_IVA_PROY,0) - CCI.IMP_IVA_PAG_HIST AS IMP_IVA, '+ coCRLF +
         '         CCI.SIT_INTERES SITUACION, '+ coCRLF +
         '         0 IMP_BENEFICIO, '+ coCRLF +
//HERJA - CAMBIO POR IVA_PROYECTADO
//         '         (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST + CCI.IMP_IVA - CCI.IMP_IVA_PAG_HIST) IMP_TOTAL'+  coCRLF +
         '         (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST + NVL(CCI.IMP_IVA_PROY,0) - CCI.IMP_IVA_PAG_HIST) IMP_TOTAL'+  coCRLF +
         '  FROM  (SELECT CCI.*, '+ coCRLF +
         '                NVL(PKGCRCOMUN.STPOBTFNDIMPPAGADO( ''RI'', ''IMPBRU'', CCI.ID_CREDITO,' + coCRLF +
         '                  CCI.CVE_FND_ENT_DES, CCI.CVE_FND_PROGRAMA, CCI.NUM_PERIODO,' + coCRLF +
         '                  NULL, ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) )+
                            ',' + SQLStr(vlBFinDia) + '),0) AS IMP_PAGADO_HIST, ' + coCRLF +
         '                NVL(PKGCRCOMUN.STPOBTFNDIMPPAGADO( ''RI'', ''IMPIVA'', CCI.ID_CREDITO,' + coCRLF +
         '                  CCI.CVE_FND_ENT_DES, CCI.CVE_FND_PROGRAMA, CCI.NUM_PERIODO,' + coCRLF +
         '                  NULL, ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) )+
                            ',' + SQLStr(vlBFinDia) + '), 0) AS IMP_IVA_PAG_HIST ' + coCRLF +
         '          FROM  CR_FND_INTERES    CCI ' + coCRLF +
         '          WHERE CCI.SIT_INTERES <> ''CA'' ' + coCRLF; //EASA4011 21.08.2007 CORRECICON NO MOSTRAR FONDEO CANCELADO

   sSQLWhere := '';
   If Trim(sF_Vencimiento)<>'' Then
      AddSQL( sSQLWhere, '  AND CCI.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF )
   Else If Trim(sF_Programada)<>'' Then
      AddSQL( sSQLWhere, '  AND CCI.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF );

   If (Trim(VlSituacion)='IM') Then Begin
      AddSQL( sSQLWhere, ' AND  ((CCI.F_PROG_PAGO < CCI.F_PAGO AND '  +
                         ' CCI.SIT_INTERES <> ''CA'' AND ' +  coCRLF +
                         ' CCI.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                         ' OR (CCI.SIT_INTERES = ''IM'' ))'+  coCRLF );
   End;

   If sSQLWhere <> '' Then
       sSQL := sSQL + sSQLWhere;

   If (Trim(sEntidad)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND CCI.CVE_FND_ENT_DES    ='+ SQLStr( sEntidad );
   If (Trim(sPrograma)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND CCI.CVE_FND_PROGRAMA   ='+ SQLStr( sPrograma );

   sSQL := sSQL + '         )CCI' + coCRLF;

    //************************REFINANCIAMIRNTO

   sSQL:= sSQL + '  UNION '+ coCRLF +
         '  SELECT CFA.ID_CREDITO, '+  coCRLF +
         '         CFA.CVE_FND_ENT_DES, CFA.CVE_FND_PROGRAMA,' + coCRLF + //HERJA
         '         ''REFINANCIAMIENTO'' ACCESORIO, '+  coCRLF +
         '         CFA.NUM_PERIODO, '+  coCRLF +
         '         CFA.PLAZO, '+  coCRLF +
         '         (CFA.F_VENCIMIENTO - CFA.PLAZO) F_INICIO, '+  coCRLF +
         '         CFA.F_VENCIMIENTO, '+  coCRLF +
         '         CFA.F_PROG_PAGO, '+  coCRLF +
         '         CFA.F_PAGO, '+  coCRLF +
         '         0 TASA_APLICADA,'+  coCRLF +
         '         (CFA.IMP_FINAN_ADIC - CFA.IMP_PAGADO_HIST) IMPORTE, '+  coCRLF +
         '         0 IMP_IVA,CFA.SIT_FINAN_ADIC SITUACION, '+  coCRLF +
         '         0 IMP_BENEFICIO, '+  coCRLF +
         '         (CFA.IMP_FINAN_ADIC - CFA.IMP_PAGADO_HIST ) IMP_TOTAL'+  coCRLF +
         '  FROM ( SELECT CFA.*, ' +  coCRLF +
         '                NVL(PKGCRCOMUN.STPOBTFNDIMPPAGADO( ''RF'', ''IMPBRU'', CFA.ID_CREDITO,' + coCRLF +
         '                  CFA.CVE_FND_ENT_DES, CFA.CVE_FND_PROGRAMA, CFA.NUM_PERIODO,' + coCRLF +
         '                  NULL, ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) )+
                            ',' + SQLStr(vlBFinDia) + '), 0) AS IMP_PAGADO_HIST ' + coCRLF +
         '         FROM CR_FND_FIN_ADIC    CFA '+  coCRLF +
         '          WHERE CFA.SIT_FINAN_ADIC <> ''CA'' ' + coCRLF;//EASA4011 21.08.2007 CORRECICON NO MOSTRAR FONDEO CANCELADO

   sSQLWhere := '';
   If Trim(sF_Vencimiento)<>'' Then
      AddSQL( sSQLWhere, '  AND CFA.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF )
   Else If Trim(sF_Programada)<>'' Then
      AddSQL( sSQLWhere, '  AND CFA.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF );

   If (Trim(VlSituacion)='IM')Then Begin
      AddSQL( sSQLWhere, '  AND ((CFA.F_PROG_PAGO < CFA.F_PAGO AND ' + coCRLF +
                         '    CFA.SIT_FINAN_ADIC <> ''CA'' AND ' + coCRLF +
                         '    CFA.F_PAGO > '+ SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                         '   OR (CFA.SIT_FINAN_ADIC = ''IM'' ))'+  coCRLF );
   End;

   If sSQLWhere <> '' Then
      sSQL := sSQL + sSQLWhere;
   If (Trim(sEntidad)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND CFA.CVE_FND_ENT_DES    ='+ SQLStr( sEntidad );
   If (Trim(sPrograma)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND CFA.CVE_FND_PROGRAMA   ='+ SQLStr( sPrograma );      
   sSQL := sSQL + '         )CFA' + coCRLF;

    //************************COMISIONES

   sSQL:= sSQL + '  UNION '+  coCRLF +
         '  SELECT CCC.ID_CREDITO, '+  coCRLF +
         '         CCC.CVE_FND_ENT_DES, CCC.CVE_FND_PROGRAMA,' + coCRLF + //HERJA
         '         CCC.DESC_COMISION, '+  coCRLF +
         '         CCC.NUM_PERIODO, '+  coCRLF +
         '         CCC.PLAZO, '+  coCRLF +
         '         (CCC.F_VENCIMIENTO - CCC.PLAZO) F_INICIO, '+  coCRLF +
         '         CCC.F_VENCIMIENTO, '+  coCRLF +
         '         CCC.F_PROG_PAGO, '+  coCRLF +
         '         CCC.F_PAGO, '+  coCRLF +
         '         CCC.TASA_APLICADA,'+  coCRLF +
         '         (CCC.IMP_COMISION - CCC.IMP_PAGADO_HIST ) IMPORTE,'+  coCRLF +
         '         CCC.IMP_IVA-CCC.IMP_IVA_PAG_HIST, '+  coCRLF +
         '         CCC.SIT_COMISION SITUACION, '+  coCRLF +
         '         0 IMP_BENEFICIO, '+  coCRLF +
         '         (CCC.IMP_COMISION  + CCC.IMP_IVA - CCC.IMP_PAGADO_HIST -CCC.IMP_IVA_PAG_HIST) IMP_TOTAL'+  coCRLF +
         '  FROM ( SELECT CCC.*, CCCO.DESC_COMISION,'+  coCRLF +
         '                NVL(PKGCRCOMUN.STPOBTFNDIMPPAGADO( ''RN'', ''IMPBRU'', CCC.ID_CREDITO,' + coCRLF +
         '                  CCC.CVE_FND_ENT_DES, CCC.CVE_FND_PROGRAMA, CCC.NUM_PERIODO,' + coCRLF +
         '                  CCC.CVE_COMISION, ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) )+
                            ',' + SQLStr(vlBFinDia) + '), 0) AS IMP_PAGADO_HIST, ' + coCRLF +
         '                NVL(PKGCRCOMUN.STPOBTFNDIMPPAGADO( ''RN'', ''IMPIVA'', CCC.ID_CREDITO,' + coCRLF +
         '                  CCC.CVE_FND_ENT_DES, CCC.CVE_FND_PROGRAMA, CCC.NUM_PERIODO,' + coCRLF +
         '                  CCC.CVE_COMISION, ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) )+
                            ',' + SQLStr(vlBFinDia) + '), 0) AS IMP_IVA_PAG_HIST ' + coCRLF +
         '           FROM CR_FND_COMISION   CCC, CR_CAT_COMISION CCCO ' +  coCRLF +
         '           WHERE CCC.SIT_COMISION <> ''CA'' ' + coCRLF+
         '             AND CCCO.SIT_CAT_COMISION <> ''CA'' ' + coCRLF+
         '             AND CCCO.CVE_COMISION = CCC.CVE_COMISION '+  coCRLF;//EASA4011 21.08.2007 CORRECICON NO MOSTRAR FONDEO CANCELADO

   sSQLWhere := '';
   If Trim(sF_Vencimiento)<>'' Then
      AddSQL( sSQLWhere, ' AND CCC.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF )
   Else If Trim(sF_Programada)<>'' Then
      AddSQL( sSQLWhere, ' AND CCC.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF );

   If (Trim(VlSituacion)='IM')Then Begin
      AddSQL( sSQLWhere, ' AND  ((CCC.F_PROG_PAGO < CCC.F_PAGO AND ' +  coCRLF +
                         '    CCC.SIT_COMISION <> ''CA'' AND ' +  coCRLF +
                         '    CCC.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                         '   OR (CCC.SIT_COMISION = ''IM'' ))'+  coCRLF );
   End;

   If sSQLWhere <> '' Then
      sSQL := sSQL + sSQLWhere;
   If (Trim(sEntidad)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND CCC.CVE_FND_ENT_DES    ='+ SQLStr( sEntidad );
   If (Trim(sPrograma)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND CCC.CVE_FND_PROGRAMA   ='+ SQLStr( sPrograma );
   sSQL := sSQL + '         )CCC' + coCRLF;


   if NvlStr( sF_Vencimiento, sF_Programada ) <> '' then
   sSQL:= sSQL +    '  UNION '+  coCRLF +
                    '          SELECT  RK.ID_CREDITO,' +  coCRLF +
                    '    RK.CVE_FND_ENT_DES, RK.CVE_FND_PROGRAMA,' +  coCRLF + //HERJA/
                    '    ''CAPITAL'' ACCESORIO,' +  coCRLF +
                    '    RK.NUM_PERIODO,' +  coCRLF +
                    '    RK.PLAZO,' +  coCRLF +
                    '    (RK.F_VENCIMIENTO - RK.PLAZO) F_INICIO,' +  coCRLF +
                    '    RK.F_VENCIMIENTO,' +  coCRLF +
                    '    RK.F_PROG_PAGO,' +  coCRLF +
                    '    RK.F_PAGO,' +  coCRLF +
                    '    0 TASA_APLICADA,' +  coCRLF +
                    '    A.IMP_CONCEPTO,' +  coCRLF +
                    '    A.IMP_IVA,' +  coCRLF +
                    '    RK.SIT_CAPITAL SITUACION,' +  coCRLF +
                    '    0 IMP_BENEFICIO,' +  coCRLF +
                    '    A.IMP_CONCEPTO + A.IMP_IVA IMP_TOTAL' +  coCRLF +
                    '          FROM   (SELECT CT.ID_CREDITO,    CTX.CVE_FND_ENT_DES, CTX.CVE_FND_PROGRAMA,' +  coCRLF +
                    '           CT.ID_PERIODO,    ' +  coCRLF +
                    '           SUM( DECODE(CDT.CVE_CONCEPTO, ''IMPBRU'', CDT.IMP_CONCEPTO, 0 ) ) IMP_CONCEPTO,' +  coCRLF +
                    '           SUM( DECODE(CDT.CVE_CONCEPTO, ''IMPIVA'', CDT.IMP_CONCEPTO, 0 ) ) IMP_IVA' +  coCRLF +
                    '    FROM   CR_CVE_OPERACION CV,' +  coCRLF +
                    '           CR_TRANSACCION   CT,' +  coCRLF +
                    '           CR_XTRANSACCION CTX,' +  coCRLF +
                    '           CR_DET_TRANSAC CDT,' +  coCRLF +
                    '           CR_CREDITO C,' +  coCRLF +
                    '           CR_CONTRATO L,' +  coCRLF +
                    '           CONTRATO CTTO,' +  coCRLF +
                    '           CR_FND_CREDITO CR' +  coCRLF +
                    '    WHERE  CV.CVE_PARAMETRO IN( ''FNDFCP'' )' +  coCRLF +
                    '      AND  CT.F_OPERACION   = ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + coCRLF;

   If (Trim(sEntidad)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND CR.CVE_FND_ENT_DES    ='+ SQLStr( sEntidad );
   If (Trim(sPrograma)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND CR.CVE_FND_PROGRAMA   ='+ SQLStr( sPrograma );
      sSQL:= sSQL +
                    '      AND  CT.SIT_TRANSACCION = ''AC''' +  coCRLF +
                    '      AND  CR.SIT_CREDITO <> ''CA''' +  coCRLF +//EASA4011 21.08.2007 CORRECICON NO MOSTRAR FONDEO CANCELADO
                    '      AND  CT.ID_TRANS_CANCELA IS NULL' +  coCRLF +
                    '      AND  CV.CVE_PRODUCTO  = L.CVE_PRODUCTO_CRE' +  coCRLF +
                    '      AND  CV.CVE_MONEDA    = CTTO.CVE_MONEDA' +  coCRLF +
                    '      AND  CV.CVE_OPERACION = CT.CVE_OPERACION' +  coCRLF +
                    '      AND  CDT.ID_TRANSACCION = CT.ID_TRANSACCION' +  coCRLF +
                    '      AND  CDT.CVE_OPERACION = CT.CVE_OPERACION' +  coCRLF +
                    '      AND  C.ID_CREDITO     = CR.ID_CREDITO' +  coCRLF +
                    '      AND  C.ID_CONTRATO    = L.ID_CONTRATO' +  coCRLF +
                    '      AND  C.FOL_CONTRATO   = L.FOL_CONTRATO' +  coCRLF +
                    '      AND  C.ID_CONTRATO    = CTTO.ID_CONTRATO' +  coCRLF +
                    '      AND  CT.ID_CREDITO    = C.ID_CREDITO' +  coCRLF +
                    '      AND  CTX.CVE_FND_ENT_DES  = CR.CVE_FND_ENT_DES' +  coCRLF +
                    '      AND  CTX.CVE_FND_PROGRAMA = CR.CVE_FND_PROGRAMA' +  coCRLF +
                    '      AND  CTX.ID_TRANSACCION   = CT.ID_TRANSACCION' +  coCRLF +
                    '    GROUP BY CT.ID_CREDITO,    CTX.CVE_FND_ENT_DES, CTX.CVE_FND_PROGRAMA,' +  coCRLF +
                    '             CT.ID_PERIODO,    CDT.CVE_CONCEPTO' +  coCRLF +
                    '   )A,' +  coCRLF +
                    '   CR_FND_CAPITAL RK' +  coCRLF +
                    '          WHERE  RK.ID_CREDITO = A.ID_CREDITO' +  coCRLF +
                    '            AND  RK.CVE_FND_ENT_DES  = A.CVE_FND_ENT_DES' +  coCRLF +
                    '            AND  RK.CVE_FND_PROGRAMA = A.CVE_FND_PROGRAMA' +  coCRLF +
                    '            AND  RK.NUM_PERIODO      = A.ID_PERIODO' +  coCRLF;

   If (Trim(sEntidad)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND RK.CVE_FND_ENT_DES    ='+ SQLStr( sEntidad );
   If (Trim(sPrograma)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND RK.CVE_FND_PROGRAMA   ='+ SQLStr( sPrograma );
      sSQL:= sSQL +
                    '          ' +  coCRLF +
                    '          UNION' +  coCRLF +
                    '          ' +  coCRLF +
                    '          SELECT  RF.ID_CREDITO,' +  coCRLF +
                    '    RF.CVE_FND_ENT_DES, RF.CVE_FND_PROGRAMA,' +  coCRLF + //HERJA/
                    '    ''REFINANCIAMIENTO'' ACCESORIO, ' +  coCRLF +
                    '    RF.NUM_PERIODO,' +  coCRLF +
                    '    RF.PLAZO,' +  coCRLF +
                    '    (RF.F_VENCIMIENTO - RF.PLAZO) F_INICIO,' +  coCRLF +
                    '    RF.F_VENCIMIENTO,' +  coCRLF +
                    '    RF.F_PROG_PAGO,' +  coCRLF +
                    '    RF.F_PAGO,' +  coCRLF +
                    '    0 TASA_APLICADA,' +  coCRLF +
                    '    A.IMP_CONCEPTO,' +  coCRLF +
                    '    A.IMP_IVA,' +  coCRLF +
                    '    RF.SIT_FINAN_ADIC SITUACION,' +  coCRLF +
                    '    0 IMP_BENEFICIO,' +  coCRLF +
                    '    A.IMP_CONCEPTO + A.IMP_IVA IMP_TOTAL' +  coCRLF +
                    '          FROM   (SELECT CT.ID_CREDITO,    CTX.CVE_FND_ENT_DES, CTX.CVE_FND_PROGRAMA,' +  coCRLF +
                    '           CT.ID_PERIODO,    ' +  coCRLF +
                    '           SUM( DECODE(CDT.CVE_CONCEPTO, ''IMPBRU'', CDT.IMP_CONCEPTO, 0 ) ) IMP_CONCEPTO,' +  coCRLF +
                    '           SUM( DECODE(CDT.CVE_CONCEPTO, ''IMPIVA'', CDT.IMP_CONCEPTO, 0 ) ) IMP_IVA' +  coCRLF +
                    '    FROM   CR_CVE_OPERACION CV,' +  coCRLF +
                    '           CR_TRANSACCION   CT,' +  coCRLF +
                    '           CR_XTRANSACCION CTX,' +  coCRLF +
                    '           CR_DET_TRANSAC CDT,' +  coCRLF +
                    '           CR_CREDITO C,' +  coCRLF +
                    '           CR_CONTRATO L,' +  coCRLF +
                    '           CONTRATO CTTO,' +  coCRLF +
                    '           CR_FND_CREDITO CR' +  coCRLF +
                    '    WHERE  CV.CVE_PARAMETRO IN( ''FNDFFN'' )' +  coCRLF +
                    '      AND  CT.F_OPERACION   = ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + coCRLF;
   If (Trim(sEntidad)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND CR.CVE_FND_ENT_DES    ='+ SQLStr( sEntidad );
   If (Trim(sPrograma)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND CR.CVE_FND_PROGRAMA   ='+ SQLStr( sPrograma );
      sSQL:= sSQL +
                    '      AND  CT.SIT_TRANSACCION = ''AC''' +  coCRLF +
                    '      AND  CR.SIT_CREDITO <> ''CA''' +  coCRLF +//EASA4011 21.08.2007 CORRECICON NO MOSTRAR FONDEO CANCELADO
                    '      AND  CT.ID_TRANS_CANCELA IS NULL' +  coCRLF +
                    '      AND  CV.CVE_PRODUCTO  = L.CVE_PRODUCTO_CRE' +  coCRLF +
                    '      AND  CV.CVE_MONEDA    = CTTO.CVE_MONEDA' +  coCRLF +
                    '      AND  CV.CVE_OPERACION = CT.CVE_OPERACION' +  coCRLF +
                    '      AND  CDT.ID_TRANSACCION = CT.ID_TRANSACCION' +  coCRLF +
                    '      AND  CDT.CVE_OPERACION = CT.CVE_OPERACION' +  coCRLF +
                    '      AND  C.ID_CREDITO     = CR.ID_CREDITO' +  coCRLF +
                    '      AND  C.ID_CONTRATO    = L.ID_CONTRATO' +  coCRLF +
                    '      AND  C.FOL_CONTRATO   = L.FOL_CONTRATO' +  coCRLF +
                    '      AND  C.ID_CONTRATO    = CTTO.ID_CONTRATO' +  coCRLF +
                    '      AND  CT.ID_CREDITO    = C.ID_CREDITO' +  coCRLF +
                    '      AND  CTX.CVE_FND_ENT_DES  = CR.CVE_FND_ENT_DES' +  coCRLF +
                    '      AND  CTX.CVE_FND_PROGRAMA = CR.CVE_FND_PROGRAMA' +  coCRLF +
                    '      AND  CTX.ID_TRANSACCION   = CT.ID_TRANSACCION' +  coCRLF +
                    '    GROUP BY CT.ID_CREDITO,    CTX.CVE_FND_ENT_DES, CTX.CVE_FND_PROGRAMA,' +  coCRLF +
                    '             CT.ID_PERIODO,    CDT.CVE_CONCEPTO' +  coCRLF +
                    '   )A,' +  coCRLF +
                    '   CR_FND_FIN_ADIC RF' +  coCRLF +
                    '          WHERE  RF.ID_CREDITO = A.ID_CREDITO' +  coCRLF +
                    '            AND  RF.CVE_FND_ENT_DES  = A.CVE_FND_ENT_DES' +  coCRLF +
                    '            AND  RF.CVE_FND_PROGRAMA = A.CVE_FND_PROGRAMA' +  coCRLF +
                    '            AND  RF.NUM_PERIODO      = A.ID_PERIODO' +  coCRLF;
   If (Trim(sEntidad)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND RF.CVE_FND_ENT_DES    ='+ SQLStr( sEntidad );
   If (Trim(sPrograma)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND RF.CVE_FND_PROGRAMA   ='+ SQLStr( sPrograma );      
      sSQL:= sSQL +
                    '          ' +  coCRLF +
                    '          UNION' +  coCRLF +
                    '          ' +  coCRLF +
                    '          SELECT  RI.ID_CREDITO,' +  coCRLF +
                    '    RI.CVE_FND_ENT_DES, RI.CVE_FND_PROGRAMA,' +  coCRLF + //HERJA/
                    '    ''INTERES'' ACCESORIO, ' +  coCRLF +
                    '    RI.NUM_PERIODO,' +  coCRLF +
                    '    RI.PLAZO,' +  coCRLF +
                    '    (RI.F_VENCIMIENTO - RI.PLAZO) F_INICIO,' +  coCRLF +
                    '    RI.F_VENCIMIENTO,' +  coCRLF +
                    '    RI.F_PROG_PAGO,' +  coCRLF +
                    '    RI.F_PAGO,' +  coCRLF +
                    '    RI.TASA_APLICADA,' +  coCRLF +
                    '    A.IMP_CONCEPTO,' +  coCRLF +
                    '    A.IMP_IVA,' +  coCRLF +
                    '    RI.SIT_INTERES SITUACION,' +  coCRLF +
                    '    0 IMP_BENEFICIO,' +  coCRLF +
                    '    A.IMP_CONCEPTO + A.IMP_IVA IMP_TOTAL' +  coCRLF +
                    '          FROM   (SELECT CT.ID_CREDITO,    CTX.CVE_FND_ENT_DES, CTX.CVE_FND_PROGRAMA,' +  coCRLF +
                    '           CT.ID_PERIODO,    ' +  coCRLF +
                    '           SUM( DECODE(CDT.CVE_CONCEPTO, ''IMPBRU'', CDT.IMP_CONCEPTO, 0 ) ) IMP_CONCEPTO,' +  coCRLF +
                    '           SUM( DECODE(CDT.CVE_CONCEPTO, ''IMPIVA'', CDT.IMP_CONCEPTO, 0 ) ) IMP_IVA' +  coCRLF +
                    '    FROM   CR_CVE_OPERACION CV,' +  coCRLF +
                    '           CR_TRANSACCION   CT,' +  coCRLF +
                    '           CR_XTRANSACCION CTX,' +  coCRLF +
                    '           CR_DET_TRANSAC CDT,' +  coCRLF +
                    '           CR_CREDITO C,' +  coCRLF +
                    '           CR_CONTRATO L,' +  coCRLF +
                    '           CONTRATO CTTO,' +  coCRLF +
                    '           CR_FND_CREDITO CR' +  coCRLF +
                    '    WHERE  CV.CVE_PARAMETRO IN( ''FNDFIN'' )' +  coCRLF +
                    '      AND  CT.F_OPERACION   = ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + coCRLF ;
   If (Trim(sEntidad)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND CR.CVE_FND_ENT_DES    ='+ SQLStr( sEntidad );
   If (Trim(sPrograma)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND CR.CVE_FND_PROGRAMA   ='+ SQLStr( sPrograma );
      sSQL:= sSQL +
                    '      AND  CT.SIT_TRANSACCION = ''AC''' +  coCRLF +
                    '      AND  CR.SIT_CREDITO <> ''CA''' +  coCRLF +//EASA4011 21.08.2007 CORRECICON NO MOSTRAR FONDEO CANCELADO
                    '      AND  CT.ID_TRANS_CANCELA IS NULL' +  coCRLF +
                    '      AND  CV.CVE_PRODUCTO  = L.CVE_PRODUCTO_CRE' +  coCRLF +
                    '      AND  CV.CVE_MONEDA    = CTTO.CVE_MONEDA' +  coCRLF +
                    '      AND  CV.CVE_OPERACION = CT.CVE_OPERACION' +  coCRLF +
                    '      AND  CDT.ID_TRANSACCION = CT.ID_TRANSACCION' +  coCRLF +
                    '      AND  CDT.CVE_OPERACION = CT.CVE_OPERACION' +  coCRLF +
                    '      AND  C.ID_CREDITO     = CR.ID_CREDITO' +  coCRLF +
                    '      AND  C.ID_CONTRATO    = L.ID_CONTRATO' +  coCRLF +
                    '      AND  C.FOL_CONTRATO   = L.FOL_CONTRATO' +  coCRLF +
                    '      AND  C.ID_CONTRATO    = CTTO.ID_CONTRATO' +  coCRLF +
                    '      AND  CT.ID_CREDITO    = C.ID_CREDITO' +  coCRLF +
                    '      AND  CTX.CVE_FND_ENT_DES  = CR.CVE_FND_ENT_DES' +  coCRLF +
                    '      AND  CTX.CVE_FND_PROGRAMA = CR.CVE_FND_PROGRAMA' +  coCRLF +
                    '      AND  CTX.ID_TRANSACCION   = CT.ID_TRANSACCION' +  coCRLF +
                    '    GROUP BY CT.ID_CREDITO,    CTX.CVE_FND_ENT_DES, CTX.CVE_FND_PROGRAMA,' +  coCRLF +
                    '             CT.ID_PERIODO,    CDT.CVE_CONCEPTO' +  coCRLF +
                    '   )A,' +  coCRLF +
                    '   CR_FND_INTERES RI' +  coCRLF +
                    '          WHERE  RI.ID_CREDITO = A.ID_CREDITO' +  coCRLF +
                    '            AND  RI.CVE_FND_ENT_DES  = A.CVE_FND_ENT_DES' +  coCRLF +
                    '            AND  RI.CVE_FND_PROGRAMA = A.CVE_FND_PROGRAMA' +  coCRLF +
                    '            AND  RI.NUM_PERIODO      = A.ID_PERIODO' +  coCRLF;
   If (Trim(sEntidad)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND RI.CVE_FND_ENT_DES    ='+ SQLStr( sEntidad );
   If (Trim(sPrograma)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND RI.CVE_FND_PROGRAMA   ='+ SQLStr( sPrograma );

      sSQL:= sSQL +
                    '            ' +  coCRLF +
                    '          UNION' +  coCRLF +
                    '          ' +  coCRLF +
                    '          SELECT  RN.ID_CREDITO,' +  coCRLF +
                    '    RN.CVE_FND_ENT_DES, RN.CVE_FND_PROGRAMA,' +  coCRLF + //HERJA/
                    '    CCCO.DESC_COMISION ACCESORIO,' +  coCRLF +
                    '    RN.NUM_PERIODO,' +  coCRLF +
                    '    RN.PLAZO,' +  coCRLF +
                    '    (RN.F_VENCIMIENTO - RN.PLAZO) F_INICIO,' +  coCRLF +
                    '    RN.F_VENCIMIENTO,' +  coCRLF +
                    '    RN.F_PROG_PAGO,' +  coCRLF +
                    '    RN.F_PAGO,' +  coCRLF +
                    '    RN.TASA_APLICADA,' +  coCRLF +
                    '    A.IMP_CONCEPTO,' +  coCRLF +
                    '    A.IMP_IVA,' +  coCRLF +
                    '    RN.SIT_COMISION  SITUACION,' +  coCRLF +
                    '    0 IMP_BENEFICIO,' +  coCRLF +
                    '    A.IMP_CONCEPTO + A.IMP_IVA IMP_TOTAL' +  coCRLF +
                    '          FROM   (SELECT CT.ID_CREDITO,    CTX.CVE_FND_ENT_DES, CTX.CVE_FND_PROGRAMA,' +  coCRLF +
                    '           CT.ID_PERIODO,    CT.CVE_COMISION,' +  coCRLF +
                    '           SUM( DECODE(CDT.CVE_CONCEPTO, ''IMPBRU'', CDT.IMP_CONCEPTO, 0 ) ) IMP_CONCEPTO,' +  coCRLF +
                    '           SUM( DECODE(CDT.CVE_CONCEPTO, ''IMPIVA'', CDT.IMP_CONCEPTO, 0 ) ) IMP_IVA' +  coCRLF +
                    '    FROM   CR_CVE_OPERACION CV,' +  coCRLF +
                    '           CR_TRANSACCION   CT,' +  coCRLF +
                    '           CR_XTRANSACCION CTX,' +  coCRLF +
                    '           CR_DET_TRANSAC CDT,' +  coCRLF +
                    '           CR_CREDITO C,' +  coCRLF +
                    '           CR_CONTRATO L,' +  coCRLF +
                    '           CONTRATO CTTO,' +  coCRLF +
                    '           CR_FND_CREDITO CR' +  coCRLF +
                    '    WHERE  CV.CVE_PARAMETRO IN( ''FNDFCN'' )' +  coCRLF +
                    '      AND  CT.F_OPERACION   = ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + coCRLF;
   If (Trim(sEntidad)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND CR.CVE_FND_ENT_DES    ='+ SQLStr( sEntidad );
   If (Trim(sPrograma)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND CR.CVE_FND_PROGRAMA   ='+ SQLStr( sPrograma );
      sSQL:= sSQL +
                    '      AND  CT.SIT_TRANSACCION = ''AC''' +  coCRLF +
                    '      AND  CR.SIT_CREDITO <> ''CA''' +  coCRLF +//EASA4011 21.08.2007 CORRECICON NO MOSTRAR FONDEO CANCELADO
                    '      AND  CT.ID_TRANS_CANCELA IS NULL' +  coCRLF +
                    '      AND  CV.CVE_PRODUCTO  = L.CVE_PRODUCTO_CRE' +  coCRLF +
                    '      AND  CV.CVE_MONEDA    = CTTO.CVE_MONEDA' +  coCRLF +
                    '      AND  CV.CVE_OPERACION = CT.CVE_OPERACION' +  coCRLF +
                    '      AND  CDT.ID_TRANSACCION = CT.ID_TRANSACCION' +  coCRLF +
                    '      AND  CDT.CVE_OPERACION = CT.CVE_OPERACION' +  coCRLF +
                    '      AND  C.ID_CREDITO     = CR.ID_CREDITO' +  coCRLF +
                    '      AND  C.ID_CONTRATO    = L.ID_CONTRATO' +  coCRLF +
                    '      AND  C.FOL_CONTRATO   = L.FOL_CONTRATO' +  coCRLF +
                    '      AND  C.ID_CONTRATO    = CTTO.ID_CONTRATO' +  coCRLF +
                    '      AND  CT.ID_CREDITO    = C.ID_CREDITO' +  coCRLF +
                    '      AND  CTX.CVE_FND_ENT_DES  = CR.CVE_FND_ENT_DES' +  coCRLF +
                    '      AND  CTX.CVE_FND_PROGRAMA = CR.CVE_FND_PROGRAMA' +  coCRLF +
                    '      AND  CTX.ID_TRANSACCION   = CT.ID_TRANSACCION' +  coCRLF +
                    '    GROUP BY CT.ID_CREDITO,    CTX.CVE_FND_ENT_DES, CTX.CVE_FND_PROGRAMA,' +  coCRLF +
                    '             CT.ID_PERIODO,    CT.CVE_COMISION,     CDT.CVE_CONCEPTO' +  coCRLF +
                    '   )A,' +  coCRLF +
                    '   CR_CAT_COMISION CCCO,' +  coCRLF +
                    '   CR_FND_COMISION RN' +  coCRLF +
                    '          WHERE  RN.ID_CREDITO = A.ID_CREDITO' +  coCRLF +
                    '            AND  RN.CVE_FND_ENT_DES  = A.CVE_FND_ENT_DES' +  coCRLF +
                    '            AND  RN.CVE_FND_PROGRAMA = A.CVE_FND_PROGRAMA' +  coCRLF +
                    '            AND  RN.NUM_PERIODO      = A.ID_PERIODO' +  coCRLF +
                    '            AND  RN.CVE_COMISION     = A.CVE_COMISION' +  coCRLF +
                    '            AND  CCCO.CVE_COMISION   = RN.CVE_COMISION';
   If (Trim(sEntidad)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND RN.CVE_FND_ENT_DES    ='+ SQLStr( sEntidad );
   If (Trim(sPrograma)<>'') Then //easa4011 01.08.2007
      sSQL:= sSQL + ' AND RN.CVE_FND_PROGRAMA   ='+ SQLStr( sPrograma );

    //************************ FIN DE UNION
   sSQL:= sSQL + ') ACCE, '+  coCRLF ;

   if Trim(sF_Vencimiento)<>'' then
      sSQL:= sSQL + ' (SELECT ' + ' TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Vencimiento))+''',''DD/MM/YYYY'')' + ' AS F_REFERENCIA FROM DUAL) F_REF, '+  coCRLF
   else
      sSQL:= sSQL + ' (SELECT ' + ' TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Programada))+''',''DD/MM/YYYY'')' + ' AS F_REFERENCIA FROM DUAL) F_REF, '+  coCRLF ;

   sSQL:= sSQL +
//         ' CR_FND_ENT_DES,  ' + coCRLF +
//         ' CR_FND_PROGRAMA, ' + coCRLF +
         ' CR_FND_CREDITO  CFC, '+  coCRLF +
         ' CR_CREDITO    CC, '+  coCRLF +
         ' CONTRATO      CTO, '+  coCRLF +
//         ' MONEDA        M, '+  coCRLF +
         ' PERSONA       PPR, '+  coCRLF +
         ' PERSONA       PPRC, '+  coCRLF +
         ' CR_CONTRATO   CCTO, '+  coCRLF +
         ' CR_PRODUCTO   CPR, '+  coCRLF +
         ' CR_CONT_PRODUCTO CCPD, '+  coCRLF +
         ' PERSONA_FISICA PTIT, '+  coCRLF +
         ' PERSONA       PCE, '+  coCRLF +
         ' PERSONA       PP, '+  coCRLF +
         ' CR_PROVEEDOR  CP, '+  coCRLF +
         ' CR_DOCUMENTO  CD, '+  coCRLF +
         ' (SELECT SUB.CVE_SUB_DIVISION CVE_EMISOR_NAFIN,'+  coCRLF +
         '         SUB.NOMBRE_SUB_DIV NOMBRE_EMISOR,'+  coCRLF +
         '         ID_ACREDITADO ID_EMISOR,'+  coCRLF +
         '         PROCAM.ID_CREDITO  ID_CESION,'+  coCRLF +
         '         0 ID_PROVEEDOR,'+  coCRLF +
         '         ''F'' B_OPERADO_NAFIN, ''AP'' TIPO_ACRED'+  coCRLF +
         '  FROM CR_SUBDIV_PROCAM SUB, CR_PROCAMPO PROCAM'+  coCRLF +
         '  WHERE PROCAM.CVE_SUB_DIVISION = SUB.CVE_SUB_DIVISION'+  coCRLF +
         '  UNION'+  coCRLF +
         '  SELECT CS.CVE_EMISOR_NAFIN,'+  coCRLF +
         '         CE.NOMBRE_EMISOR ID_EMISOR,'+  coCRLF +         
         '         CE.ID_ACREDITADO ,'+  coCRLF +
         '         CS.ID_CESION,'+  coCRLF +
         '         CS.ID_PROVEEDOR,'+  coCRLF +
         '         CS.B_OPERADO_NAFIN, ''AC'' TIPO_ACRED'+  coCRLF +
         '  FROM CR_EMISOR CE, CR_CESION CS'+  coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
         '  WHERE CS.CVE_FND_ENT_DES = CE.CVE_FND_ENT_DES'+  coCRLF +
         '  AND   CS.ID_EMISOR = CE.ID_ACREDITADO'+  coCRLF +
         '  AND   CS.CVE_EMISOR_NAFIN = CE.CVE_EMISOR_EXT'+  coCRLF +
{/ROIM}
         ' )SUBDIV, CR_CESION '+  coCRLF +
         ' WHERE CFC.ID_CREDITO    = CC.ID_CREDITO '+  coCRLF;

         if sSituacionAC='' then
            sSQL:= sSQL + ' AND   CC.SIT_CREDITO NOT IN (''CA'')  '          +  coCRLF;  // HERJA 02.12.2010
         if sSituacionAC<>'' then
            sSQL:= sSQL + ' AND   CC.SIT_CREDITO = '''+sSituacionAC+'''  '          +  coCRLF;  // LOLS 02 05 2005

         if sSituacionPS='' then
            sSQL:= sSQL + //' AND   CFC.SIT_CREDITO NOT IN (''CA'')  '          +  coCRLF;  // HERJA 02.12.2010
                          ' AND ('+  coCRLF+
                          '          (CFC.SIT_CREDITO NOT IN (''CA'') )'+  coCRLF+ // JFOF 27/04/2012
                          '                  OR'+  coCRLF+
                          '          ('+ SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) )+' < CFC.F_PROC_CANCPAS)'+  coCRLF+
                          '            )'+  coCRLF;
         if sSituacionPS<>'' then
            sSQL:= sSQL +  ' AND   CFC.SIT_CREDITO = '''+sSituacionPS+'''  '           +  coCRLF;  // HERJA 02.12.2010
//AND   CFC.SIT_CREDITO NOT IN (''CA'',''LQ'')  '          +  coCRLF +  // HERJA 02.12.2010

        sSQL:= sSQL +
         { /< EASA4011      03.JUL.2007     CORRECCIÓN
         '   AND  (( CC.SIT_CREDITO = ''AC'')  '+  coCRLF +
         '     OR  ( CC.SIT_CREDITO = ''LQ'' AND CC.F_LIQUIDACION >= ' + ' TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Vencimiento))+''',''DD/MM/YYYY'')' + ')) '+  coCRLF +
         {EASA4011 >/ }
         ' AND   CCTO.ID_CONTRATO  = CC.ID_CONTRATO '+  coCRLF +
         ' AND   CCTO.FOL_CONTRATO = CC.FOL_CONTRATO ' +  coCRLF ;
         //

   sSQL:= sSQL +
//         ' AND  CR_FND_PROGRAMA.CVE_FND_ENT_DES  = CFC.CVE_FND_ENT_DES '+ coCRLF +
//         ' AND  CR_FND_PROGRAMA.CVE_FND_PROGRAMA = CFC.CVE_FND_PROGRAMA '+ coCRLF +
//         ' AND  CR_FND_ENT_DES.CVE_FND_ENT_DES   = CFC.CVE_FND_ENT_DES '+ coCRLF +
         ' AND ACCE.ID_CREDITO       = CC.ID_CREDITO '+  coCRLF +
         //HERJA
         ' AND ACCE.ID_CREDITO       = CFC.ID_CREDITO '+  coCRLF +
         ' AND ACCE.CVE_FND_ENT_DES  = CFC.CVE_FND_ENT_DES '+  coCRLF +
         ' AND ACCE.CVE_FND_PROGRAMA = CFC.CVE_FND_PROGRAMA '+  coCRLF +
         //FIN HERJA
         ' AND CTO.ID_CONTRATO       = CC.ID_CONTRATO '+  coCRLF +
//         ' AND M.CVE_MONEDA          = CTO.CVE_MONEDA '+  coCRLF +
         ' AND PPR.ID_PERSONA        = CC.ID_PROM_ADM '+  coCRLF +
         ' AND PPRC.ID_PERSONA       = CTO.ID_PERS_ASOCIAD '+  coCRLF +
         ' AND CPR.CVE_PRODUCTO_CRE  = CCTO.CVE_PRODUCTO_CRE '+  coCRLF +
         ' AND PTIT.ID_PERSONA    (+)= CTO.ID_TITULAR '+  coCRLF +
         ' AND PCE.ID_PERSONA     (+)= CTO.ID_TITULAR '+  coCRLF +
         ' AND SUBDIV.ID_CESION   (+)= CC.ID_CREDITO '+  coCRLF +
         ' AND PP.ID_PERSONA      (+)= SUBDIV.ID_PROVEEDOR '+  coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
         ' AND CP.CVE_FND_ENT_DES   (+)= CR_CESION.CVE_FND_ENT_DES '+  coCRLF +
         ' AND CP.ID_ACREDITADO     (+)= CR_CESION.ID_PROVEEDOR '+  coCRLF +
{/ROIM}
         ' AND CD.ID_CESION       (+)= ACCE.ID_CREDITO '+ coCRLF +
         ' AND CD.NUM_PERIODO_DOC (+)= ACCE.NUM_PERIODO '+  coCRLF +
         ' AND CR_CESION.ID_CESION(+)= CC.ID_CREDITO '+  coCRLF +
         ' AND CCPD.CVE_PRODUCTO_CR(+) = CPR.CVE_PRODUCTO_GPO '+  coCRLF;

   If ((sSituacion = 'VE') or (sSituacion = 'IM'))  Then Begin
      If VLBFechaTras Then
         sSQL:= sSQL + ' AND   CC.F_TRASPASO_VENC IS NOT NULL '+  coCRLF
      Else
         sSQL:= sSQL + ' AND   CC.F_TRASPASO_VENC IS NULL '+  coCRLF ;
   End;

   If (Trim(sProducto)<>'') Then
       sSQL:= sSQL + ' AND   CPR.CVE_PRODUCTO_CRE ='''+sProducto+''''+  coCRLF ;
   If (Trim(sMoneda)<>'') Then
       sSQL:= sSQL + ' AND   CTO.CVE_MONEDA ='+sMoneda +  coCRLF ;
   If (Trim(sAcreditado)<>'') Then
       sSQL:= sSQL + ' AND  CTO.ID_TITULAR ='+ sAcreditado +  coCRLF ;
   If (Trim(sProveedor)<>'') Then
       sSQL:= sSQL + ' AND  SUBDIV.ID_PROVEEDOR ='+ sProveedor  +  coCRLF ;
   If (Trim(sPromAsoc)<>'') Then
       sSQL:= sSQL + ' AND  CTO.ID_PERS_ASOCIAD ='+ sPromAsoc  +  coCRLF ;
   If (Trim(sPromAdmon)<>'') Then
       sSQL:= sSQL + ' AND  CC.ID_PROM_ADM ='+ sPromAdmon +  coCRLF ;
   If (Trim(sCesion)<>'') Then
       sSQL:= sSQL + ' AND   CC.ID_CREDITO ='+ sCesion  +  coCRLF ;
   If ((Trim(VlSituacion)<>'') and (Trim(VlSituacion)<>'IM')) Then
       sSQL:= sSQL + ' AND  ACCE.SITUACION ='''+ VlSituacion+''''+  coCRLF ;
   If (Trim(sEmpresa)<>'') Then
       sSQL:= sSQL + ' AND   CPR.ID_EMPRESA ='+ Trim(sEmpresa) +coCRLF ;

   If (Trim(sGpoProd)<>'') Then
      sSQL:= sSQL + ' AND CPR.CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd );
   If (Trim(sOperDD)<>'') Then
      sSQL:= sSQL + ' AND  NVL(CR_CESION.B_OPERADO_NAFIN,''F'') ='+ SQLStr( sOperDD );

   If (Trim(sOrigen)<>'') Then //SASB 20-01-2004
      sSQL:= sSQL + ' AND CFC.CVE_ORIGEN_REC     ='+ SQLStr( sOrigen );
   If (Trim(sEntidad)<>'') Then //SASB 20-01-2004
      sSQL:= sSQL + ' AND CFC.CVE_FND_ENT_DES    ='+ SQLStr( sEntidad );
   If (Trim(sPrograma)<>'') Then //SASB 20-01-2004
      sSQL:= sSQL + ' AND CFC.CVE_FND_PROGRAMA   ='+ SQLStr( sPrograma );

   sSQL:= sSQL + ' ORDER BY DESC_MONEDA, ' +
//                 ' CR_FND_ENT_DES.CVE_FND_ENT_DES, ' +
//                 ' CR_FND_PROGRAMA.CVE_FND_PROGRAMA, ' +
                 ' CFC.CVE_FND_ENT_DES, ' +  //HERJA
                 ' CFC.CVE_FND_PROGRAMA, ' +  //HERJA
                 ' DESC_L_PRODUCTO,'+  coCRLF ;

   If bIncTipoSec Then
      sSQL:= sSQL + ' PCE.CVE_TIPO_SECTOR,'+  coCRLF ;
   If Trim(sOrden)='A' Then
      sSQL:= sSQL + ' NOMBRE,CC.ID_CREDITO'+  coCRLF
   Else
      sSQL:= sSQL + ' CC.ID_CREDITO,NOMBRE'+  coCRLF ;

   Result:= sSQL;
End;

procedure TQrFndProgVen.qyProgVenCalcFields(DataSet: TDataSet);
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

procedure TQrFndProgVen.QRGroup2BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   PrintBand := (qyProgVenCVE_EMISOR_NAFIN.AsString <> '0');
end;

procedure TQrFndProgVen.QuickRepBeforePrint(Sender: TCustomQuickRep;  var PrintReport: Boolean);
begin
   VLCapital := 0;
   VLInteres := 0;
   VLRefin  := 0;
   VLComision  := 0;
   VLIVAComision := 0;

   VLCapitalM := 0;
   VLInteresM := 0;
   VLRefinM  := 0;
   VLComisionM  := 0;

   VLCapitalT := 0;
   VLInteresT := 0;
   VLRefinT  := 0;
   VLComisionT  := 0;

   VLPCapital := 0;
   VLPInteres := 0;
   VLPRefin  := 0;
   VLPComision  := 0;
   VLPIVAComis  := 0;



   VLPCapitalM := 0;
   VLPInteresM := 0;
   VLPRefinM  := 0;
   VLPComisionM  := 0;

   VLPCapitalT := 0;
   VLPInteresT := 0;
   VLPRefinT  := 0;
   VLPComisionT  := 0;
   //

   VLPrCapital   := 0;
   VLPrInteres   := 0;
   VLPrRefin     := 0;
   VLPrComision  := 0;
   VLPrIVAComis  := 0;
   VLPrCapitalT  := 0;
   VLPrInteresT  := 0;
   VLPrRefinT    := 0;
   VLPrComisionT := 0;
   // Entidad descontadora
   VLECapital    := 0;
   VLEInteres    := 0;
   VLERefin      := 0;
   VLEComision   := 0;
   VLEIVAComis   := 0;
   VLECapitalT   := 0;
   VLEInteresT   := 0;
   VLERefinT     := 0;
   VLEComisionT  := 0;
end;

procedure TQrFndProgVen.QRBand1BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
Var
   sFInicio, sFVenc, sFProgPago, sFPago: String;
begin
   qrtTasaAplicada.Enabled := ( qyProgVenACCESORIO.AsString <> ('CAPITAL') ) and
                              ( qyProgVenACCESORIO.AsString <> ('REFINANCIAMIENTO'));
   //
   If qyProgVenACCESORIO.AsString = 'CAPITAL' Then Begin
      VLCapital   := VLCapital + qyProgVenIMPORTE.AsFloat;
      VLCapitalT  := VLCapitalT + qyProgVenIMP_TOTAL.AsFloat;
      //
      VLPCapital  := VLPCapital + qyProgVenIMPORTE.AsFloat;
      VLPCapitalT := VLPCapitalT + qyProgVenIMP_TOTAL.AsFloat;

      // Programa
      VLPrCapital := VLPrCapital  + qyProgVenIMPORTE.AsFloat;
      VLPrCapitalT:= VLPrCapitalT + qyProgVenIMP_TOTAL.AsFloat;
      // Entidad
      VLECapital  := VLECapital  + qyProgVenIMPORTE.AsFloat;
      VLECapitalT := VLECapitalT + qyProgVenIMP_TOTAL.AsFloat;
   End Else If qyProgVenACCESORIO.AsString = 'INTERES' Then Begin
      VLInteres := VLInteres + qyProgVenIMPORTE.AsFloat;
      VLInteresT := VLInteresT + qyProgVenIMP_TOTAL.AsFloat;
      //
      VLPInteres := VLPInteres + qyProgVenIMPORTE.AsFloat;
      VLPInteresT := VLPInteresT + qyProgVenIMP_TOTAL.AsFloat;

      // Programa
      VLPrInteres   := VLPrInteres  + qyProgVenIMPORTE.AsFloat;
      VLPrInteresT  := VLPrInteresT + qyProgVenIMP_TOTAL.AsFloat;
      // Entidad
      VLEInteres    := VLEInteres  + qyProgVenIMPORTE.AsFloat;
      VLEInteresT   := VLEInteresT + qyProgVenIMP_TOTAL.AsFloat;
   End Else If qyProgVenACCESORIO.AsString = 'REFINANCIAMIENTO' Then Begin
      VLRefin := VLRefin + qyProgVenIMPORTE.AsFloat;
      VLRefinT := VLRefinT + qyProgVenIMP_TOTAL.AsFloat;
      //
      VLPRefin := VLPRefin + qyProgVenIMPORTE.AsFloat;
      VLPRefinT := VLPRefinT + qyProgVenIMP_TOTAL.AsFloat;

      // Programa
      VLPrRefin     := VLPrRefin  + qyProgVenIMPORTE.AsFloat;
      VLPrRefinT    := VLPrRefinT + qyProgVenIMP_TOTAL.AsFloat;
      // Entidad
      VLERefin      := VLERefin  + qyProgVenIMPORTE.AsFloat;
      VLERefinT     := VLERefinT + qyProgVenIMP_TOTAL.AsFloat;
   End Else Begin
      VLComision    := VLComision + qyProgVenIMPORTE.AsFloat;
      VLIVAComision := VLIVAComision + qyProgVenIMP_IVA.AsFloat;
      VLComisionT   := VLComisionT + qyProgVenIMP_TOTAL.AsFloat;
      //
      VLPComision  :=  VLPComision  + qyProgVenIMPORTE.AsFloat;
      VLPIVAComis  :=  VLPIVAComis  + qyProgVenIMP_IVA.AsFloat;
      VLPComisionT :=  VLPComisionT + qyProgVenIMP_TOTAL.AsFloat;

      // Programa
      VLPrComision  := VLPrComision  + qyProgVenIMPORTE.AsFloat;
      VLPrIVAComis  := VLPrIVAComis  + qyProgVenIMP_IVA.AsFloat;
      VLPrComisionT := VLPrComisionT + qyProgVenIMP_TOTAL.AsFloat;
      // Entidad
      VLEComision   := VLEComision   + qyProgVenIMPORTE.AsFloat;
      VLEIVAComis   := VLEIVAComis   + qyProgVenIMP_IVA.AsFloat;
      VLEComisionT  := VLEComisionT  + qyProgVenIMP_TOTAL.AsFloat;
   End;

   {}
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
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMPORTE').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_IVA').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_BENEFICIO').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyProgVen.FieldByName('IMP_TOTAL').AsFloat) + #09+
                  qyProgVen.FieldByName('SITUACION').AsString);
   End;
end;


procedure TQrFndProgVen.QRFooterCesionBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F,
                #09#09+'Total por Crédito'+#09#09#09#09#09#09#09#09#09#09#09#09#09+
                #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                FormatFloat('###,###,###,###,###,##0.00',QRExpr1.Value.dblResult) + #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr2.Value.dblResult) + #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr3.Value.dblResult) + #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr4.Value.dblResult));
   End;
end;

procedure TQrFndProgVen.QRFooterClienteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F,
                #09#09+'Total por Cliente'+#09#09#09#09#09#09#09#09#09#09#09#09#09+
                #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                FormatFloat('###,###,###,###,###,##0.00',QRExpr10.Value.dblResult) + #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr11.Value.dblResult) + #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr12.Value.dblResult) + #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr13.Value.dblResult));
   End;
end;

procedure TQrFndProgVen.QRFooterProductoBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   QRPCapital.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPCapital);
   QRPInteres.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPInteres);
   QRPRefin.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPRefin);
   QRPComsion.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPComision);
   QRPIVAComis.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPIVAComis);



{}
   QRPCapitalT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPCapitalT);
   QRPInteresT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPInteresT);
   QRPRefinT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPRefinT);
   QRPComsionT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLPComisionT);



   VLPCapital  := 0;
   VLPInteres  := 0;
   VLPRefin    := 0;
   VLPComision := 0;

   VLPCapitalM  := 0;
   VLPInteresM  := 0;
   VLPRefinM    := 0;
   VLPComisionM := 0;

   VLPCapitalT := 0;
   VLPInteresT := 0;
   VLPRefinT    := 0;
   VLPComisionT := 0;


   
   If sArchivo <>'' Then Begin
         Writeln(F,
                  #09#09+'Total por Producto'+#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr20.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr21.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr22.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr23.Value.dblResult));
         Writeln(F,
                  #09+'Total Capital'+#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  QRPCapital.Caption + #09#09#09+
                  QRPCapitalT.Caption);
         Writeln(F,
                  #09+'Total Interes'+#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  QRPInteres.Caption + #09#09#09+
                  QRPInteresT.Caption);
         Writeln(F,
                  #09+'Total Refin'+#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  QRPRefin.Caption + #09#09#09+
                  QRPRefinT.Caption);
         Writeln(F,
                  #09+'Total Comisión'+#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  QRPComsion.Caption + #09#09#09+
                   QRPComsionT.Caption);
   End;
end;

procedure TQrFndProgVen.QRFooterProgramaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRPrCapital.Caption := FormatFloat('###,###,###,###,###,##0.00', VLPrCapital );
  QRPrInteres.Caption := FormatFloat('###,###,###,###,###,##0.00', VLPrInteres );
  QRPrRefin.Caption   := FormatFloat('###,###,###,###,###,##0.00', VLPrRefin );
  QRPrComsion.Caption := FormatFloat('###,###,###,###,###,##0.00', VLPrComision );
  //
  QRPrIVAComis.Caption:= FormatFloat('###,###,###,###,###,##0.00', VLPrIVAComis );
  //
  QRPrCapitalT.Caption := FormatFloat('###,###,###,###,###,##0.00', VLPrCapitalT );
  QRPrInteresT.Caption := FormatFloat('###,###,###,###,###,##0.00', VLPrInteresT );
  QRPrRefinT.Caption   := FormatFloat('###,###,###,###,###,##0.00', VLPrRefinT );
  QRPrComsionT.Caption := FormatFloat('###,###,###,###,###,##0.00', VLPrComisionT );


  VLPrCapital   := 0;
  VLPrInteres   := 0;
  VLPrRefin     := 0;
  VLPrComision  := 0;
  VLPrIVAComis  := 0;
  VLPrCapitalT  := 0;
  VLPrInteresT  := 0;
  VLPrRefinT    := 0;
  VLPrComisionT := 0;
end;

procedure TQrFndProgVen.QRFooterEntidadBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRECapital.Caption := FormatFloat('###,###,###,###,###,##0.00', VLECapital );
  QREInteres.Caption := FormatFloat('###,###,###,###,###,##0.00', VLEInteres );
  QRERefin.Caption := FormatFloat('###,###,###,###,###,##0.00', VLERefin );
  QREComis.Caption := FormatFloat('###,###,###,###,###,##0.00', VLEComision );
  //
  QREIVAComis.Caption := FormatFloat('###,###,###,###,###,##0.00', VLEIVAComis );
  //
  QRECapitalT.Caption := FormatFloat('###,###,###,###,###,##0.00', VLECapitalT );
  QREInteresT.Caption := FormatFloat('###,###,###,###,###,##0.00', VLEInteresT );
  QRERefinT.Caption := FormatFloat('###,###,###,###,###,##0.00', VLERefinT );
  QREComisT.Caption := FormatFloat('###,###,###,###,###,##0.00', VLEComisionT );

  //
  VLECapital   := 0;
  VLEInteres   := 0;
  VLERefin     := 0;
  VLEComision  := 0;
  VLEIVAComis  := 0;
  VLECapitalT  := 0;
  VLEInteresT  := 0;
  VLERefinT    := 0;
  VLEComisionT := 0;
end;

procedure TQrFndProgVen.QRBFootSectorBeforePrint(Sender: TQRCustomBand;
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
                FormatFloat('###,###,###,###,###,##0.00',QRExpr50.Value.dblResult) + #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr51.Value.dblResult) + #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr52.Value.dblResult) + #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr53.Value.dblResult));
   End;
end;


procedure TQrFndProgVen.QRFooterMonedaBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   QRCapital.Caption := FormatFloat('###,###,###,###,###,##0.00',VLCapital);
   QRInteres.Caption := FormatFloat('###,###,###,###,###,##0.00',VLInteres);
   QRRefin.Caption := FormatFloat('###,###,###,###,###,##0.00',VLRefin);
   QRComsion.Caption := FormatFloat('###,###,###,###,###,##0.00',VLComision);

   QRIVAComis.Caption := FormatFloat('###,###,###,###,###,##0.00',VLIVAComision);

   QRCapitalT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLCapitalT);
   QRInteresT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLInteresT);
   QRRefinT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLRefinT);
   QRComsionT.Caption := FormatFloat('###,###,###,###,###,##0.00',VLComisionT);

   VLCapital     := 0;
   VLInteres     := 0;
   VLRefin       := 0;
   VLComision    := 0;
   VLIVAComision := 0;

   VLCapitalM := 0;
   VLInteresM := 0;
   VLRefinM  := 0;
   VLComisionM  := 0;

   VLCapitalT := 0;
   VLInteresT := 0;
   VLRefinT  := 0;
   VLComisionT  := 0;
   If sArchivo <>'' Then Begin
      Writeln(F,'');
      Writeln(F,
               'Total por Moneda'+ #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
               #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
               FormatFloat('###,###,###,###,###,##0.00',QRExpr60.Value.dblResult) + #09+
               FormatFloat('###,###,###,###,###,##0.00',QRExpr61.Value.dblResult) + #09+
               FormatFloat('###,###,###,###,###,##0.00',QRExpr62.Value.dblResult) + #09+
               FormatFloat('###,###,###,###,###,##0.00',QRExpr63.Value.dblResult));
         Writeln(F,
                  'Total Capital'+#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  QRCapital.Caption + #09#09#09+
                  QRCapitalT.Caption);
         Writeln(F,
                  'Total Interes'+#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  QRInteres.Caption + #09#09#09+
                  QRInteresT.Caption);
         Writeln(F,
                  'Total Refin'+ #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  QRRefin.Caption + #09#09#09+
                  QRRefinT.Caption);
         Writeln(F,
                  'Total Comisión'+ #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  QRComsion.Caption + #09#09#09+
                  QRIVAComis.Caption + #09#09#09+
                  QRComsionT.Caption);
   End;
end;

procedure TQrFndProgVen.SummaryBand1BeforePrint(Sender: TQRCustomBand;
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



procedure TQrFndProgVen.QRFooterPromotorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F,
                'Total por Promotor'+ #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                FormatFloat('###,###,###,###,###,##0.00',QRExpr70.Value.dblResult) + #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr71.Value.dblResult) + #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr72.Value.dblResult) + #09+
                FormatFloat('###,###,###,###,###,##0.00',QRExpr73.Value.dblResult));
   End;
end;


End.
