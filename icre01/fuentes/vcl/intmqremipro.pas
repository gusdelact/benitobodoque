unit IntMQrEmiPro;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview,
  //UNIDAD DE CALCULO DEL IVA
  UnTasaimp  ; 
Const
   coCRLF      = #13#10;
type
  TQrEmiPro = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PFooterMoneda: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
    qyRelEmiPro: TQuery;
    QRBandPromotor: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr6: TQRExpr;
    QRBandProveedor: TQRBand;
    QRBandEmisor: TQRBand;
    QRLabel2: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel4: TQRLabel;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    QRShape7: TQRShape;
    QRLabel22: TQRLabel;
    QRShape8: TQRShape;
    QRLabel24: TQRLabel;
    QRShape9: TQRShape;
    QRLabel25: TQRLabel;
    QRShape10: TQRShape;
    QRLabel27: TQRLabel;
    QRShape11: TQRShape;
    QRLabel28: TQRLabel;
    QRShape12: TQRShape;
    QRLabel29: TQRLabel;
    QRShape13: TQRShape;
    QRLabel30: TQRLabel;
    QRShape14: TQRShape;
    QRLabel31: TQRLabel;
    QRShape15: TQRShape;
    QRLabel32: TQRLabel;
    QRShape16: TQRShape;
    QRLabel33: TQRLabel;
    QRShape17: TQRShape;
    QRLabel34: TQRLabel;
    QRShape18: TQRShape;
    QRLabel35: TQRLabel;
    QRShape19: TQRShape;
    QRLabel36: TQRLabel;
    QRShape20: TQRShape;
    QRDBText17: TQRDBText;
    QRLabel5: TQRLabel;
    QRShape21: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText29: TQRDBText;
    QRShape22: TQRShape;
    QRDBText28: TQRDBText;
    QRShape23: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape24: TQRShape;
    QRLabel26: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText34: TQRDBText;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRBandRecursos: TQRBand;
    QRLabel19: TQRLabel;
    QRExpr11: TQRExpr;
    QRLabel39: TQRLabel;
    QRExpr12: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRShape29: TQRShape;
    rbFooterCesion: TQRBand;
    QRExpr31: TQRExpr;
    QRExpr32: TQRExpr;
    QRExpr33: TQRExpr;
    QRExpr34: TQRExpr;
    QRExpr35: TQRExpr;
    QRDBText12: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText35: TQRDBText;
    QRLabel41: TQRLabel;
    QRShape31: TQRShape;
    QRShape4: TQRShape;
    QRDBText36: TQRDBText;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRDBText37: TQRDBText;
    QRExpr36: TQRExpr;
    QRExpr37: TQRExpr;
    QRExpr38: TQRExpr;
    QRExpr39: TQRExpr;
    QRExpr40: TQRExpr;
    QRExpr41: TQRExpr;
    QRExpr48: TQRExpr;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRExpr49: TQRExpr;
    QRLabel46: TQRLabel;
    QRSumaProveedor: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText13: TQRDBText;
    QRBFootSubdiv: TQRBand;
    QRShape3: TQRShape;
    QRLabel47: TQRLabel;
    QRExpr42: TQRExpr;
    QRLabel48: TQRLabel;
    QRExpr43: TQRExpr;
    QRExpr44: TQRExpr;
    QRExpr45: TQRExpr;
    QRExpr46: TQRExpr;
    QRExpr47: TQRExpr;
    QRExpr51: TQRExpr;
    QRShape30: TQRShape;
    QRBFootSector: TQRBand;
    QRDBText38: TQRDBText;
    QRShape32: TQRShape;
    QRLabel49: TQRLabel;
    QRExpr52: TQRExpr;
    QRLabel50: TQRLabel;
    QRExpr53: TQRExpr;
    QRExpr54: TQRExpr;
    QRExpr55: TQRExpr;
    QRExpr56: TQRExpr;
    QRExpr57: TQRExpr;
    QRExpr58: TQRExpr;

    QRGroupMoneda: TQRGroup;
    QRGroupSector: TQRGroup;
    QRGroupOrigen: TQRGroup;
    QRGroupPromotor: TQRGroup;
    QRGroupEmisor: TQRGroup;
    QRGSubDiv: TQRGroup;
    QRGroupProveedor: TQRGroup;
    QRCesion: TQRGroup;
    QRLabel52: TQRLabel;
    QRDBText39: TQRDBText;
    QRShape33: TQRShape;
    QRDBText40: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    qyRelEmiProID_DOCUMENTO: TStringField;
    qyRelEmiProID_CREDITO: TFloatField;
    qyRelEmiProID_CESION: TFloatField;
    qyRelEmiProF_EMISION: TDateTimeField;
    qyRelEmiProF_COMPRA: TDateTimeField;
    qyRelEmiProTASA_AFORO: TFloatField;
    qyRelEmiProTASA_COMISION: TFloatField;
    qyRelEmiProTASA_DESCUENTO: TFloatField;
    qyRelEmiProIMP_NOMINAL: TFloatField;
    qyRelEmiProSIT_DOCUMENTO: TStringField;
    qyRelEmiProDESC_DOCUMENTO: TStringField;
    qyRelEmiProF_VENCIMIENTO: TDateTimeField;
    qyRelEmiProF_PROG_PAGO: TDateTimeField;
    qyRelEmiProF_PAGO: TDateTimeField;
    qyRelEmiProPLAZO: TFloatField;
    qyRelEmiProIMP_PAGADO: TFloatField;
    qyRelEmiProIMP_AFORADO: TFloatField;
    qyRelEmiProIMP_INTERES: TFloatField;
    qyRelEmiProIMP_COMPRA: TFloatField;
    qyRelEmiProIMP_COMISION: TFloatField;
    qyRelEmiProID_PROM_ADM: TFloatField;
    qyRelEmiProID_CONTRATO: TFloatField;
    qyRelEmiProNOM_PROMOTOR: TStringField;
    qyRelEmiProCVE_MONEDA: TFloatField;
    qyRelEmiProDESC_MONEDA: TStringField;
    qyRelEmiProID_EMISOR: TFloatField;
    qyRelEmiProCVE_TIPO_INTERES: TStringField;
    qyRelEmiProCVE_EMISOR_EXT: TStringField;
    qyRelEmiProID_PROVEEDOR: TFloatField;
    qyRelEmiProPCT_COMISION: TFloatField;
    qyRelEmiProIMP_COMIS_PROV: TFloatField;
    qyRelEmiProB_OPERADO_NAFIN: TStringField;
    qyRelEmiProNOM_EMISOR: TStringField;
    qyRelEmiProNOMBRE_EMISOR: TStringField;
    qyRelEmiProCVE_TIPO_SECTOR: TStringField;
    qyRelEmiProCHEQUERA_EMI: TStringField;
    qyRelEmiProNOM_PROVEEDOR: TStringField;
    qyRelEmiProCHEQUERA_PROV: TStringField;
    qyRelEmiProCHEQUERA_PROV_L: TStringField;
    qyRelEmiProID_PROV_EXTERNO: TFloatField;
    qyRelEmiProIMP_REMANENTE: TFloatField;
    qyRelEmiProIMP_X_PAGAR: TFloatField;
    qyRelEmiProIMP_COM_EMIS: TFloatField;
    QRExpr59: TQRExpr;
    QRExpr60: TQRExpr;
    QRExpr61: TQRExpr;
    QRExpr62: TQRExpr;
    QRExpr63: TQRExpr;
    QRExpr64: TQRExpr;
    QRExpr65: TQRExpr;
    QRExpr66: TQRExpr;
    QRShape36: TQRShape;
    QRDBText41: TQRDBText;
    QRLabel51: TQRLabel;
    QRShape37: TQRShape;
    QRLabel53: TQRLabel;
    QRDBText42: TQRDBText;
    qyRelEmiProIMPORTE_IMPAGADO: TFloatField;
    QRExpr67: TQRExpr;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    qyRelEmiProCVE_FND_ENT_DES: TStringField;
    qyRelEmiProDESC_ENT_DES: TStringField;

    procedure rbFooterCesionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandProveedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandEmisorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandPromotorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandRecursosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PFooterMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGSubDivBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBFootSubdivBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBFootSectorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);


  private
  public
    VLProveedor : Double;
    VLEmisor : Double;
    VLPromotor : Double;
    VLRecursos : Double;
    VLMoneda : Double;
    VLSubDiv : Double;
    VLSector : Double;
    VLCesion : Integer;

    sArchivo:String;
    
    Function FormaQuery(sF_LiqIni,sF_LiqFin,sF_ComIni,sF_ComFin,
                        sMoneda,sEmisor,sProveedor,sPromotor,sAutorizacion,
                        sDisposicion,vlTipoDocto, sEmpresa, sSucursal:String;
                        bIncOrigenRec,bIncpromAdmin,bIncTipoSec:Boolean;
                        sSituacion,sOrden,vlOper,sEntDesc:String;
   // ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
                        pAPli     : TInterApli):String;
   // FIN cambio de IVA de 15 a 16                        
  end;

var
  QrEmiPro: TQrEmiPro;
  bGenArch: Boolean;
  F: TextFile;

// ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
  kTasaIVA : string;
//Fin HERJA IVA

Procedure RepRelDocEmiPro(  sF_LiqIni,sF_LiqFin,sF_ComIni,sF_ComFin,
                            sMoneda,sEmisor,sProveedor,sPromotor,sAutorizacion,
                            sDisposicion,vlTipoDocto, sEmpresa, sSucursal:String;
                            bIncOrigenRec,bIncpromAdmin,bIncTipoSec:Boolean;
                            sSituacion,sOrden,vlOper, sEntDesc, sNbrArch:String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);

Implementation
{$R *.DFM}

Procedure RepRelDocEmiPro(  sF_LiqIni,sF_LiqFin,sF_ComIni,sF_ComFin,
                            sMoneda,sEmisor,sProveedor,sPromotor,sAutorizacion,
                            sDisposicion,vlTipoDocto, sEmpresa, sSucursal:String;
                            bIncOrigenRec,bIncpromAdmin,bIncTipoSec:Boolean;
                            sSituacion,sOrden,vlOper, sEntDesc, sNbrArch:String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Var
   QrEmiPro: TQrEmiPro;
   VLTitulo : String;
   Preview     : TIntQRPreview;
Begin
   VLTitulo := '';
   QrEmiPro:=TQrEmiPro.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrEmiPro);
   Try
      bGenArch:= False;
      QrEmiPro.sArchivo:= sNbrArch;
      QrEmiPro.VLCesion:= 0;
      QrEmiPro.QRInterEncabezado1.Apli:=pApli;
      QrEmiPro.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrEmiPro.QRInterEncabezado1.NomReporte:='IntMQrEmiPro';
      QrEmiPro.QRInterEncabezado1.Titulo1:='Relación de Documentos por Emisor - Proveedor (Programados)';

     // Agrupador de Tipo Entidad Descontadora
     // Tiene que cambiar 'qyRelEmiPro.B_OPERADO_NAFIN';

      If  bIncOrigenRec Then Begin
         QrEmiPro.QRGroupOrigen.Enabled:= True;
         QrEmiPro.QRGroupOrigen.Expression:= 'qyRelEmiPro.CVE_FND_ENT_DES';
         QrEmiPro.QRBandRecursos.Enabled:=True;
      End Else Begin
         QrEmiPro.QRGroupOrigen.Enabled:= False;
         QrEmiPro.QRGroupOrigen.Expression:= '';
         QrEmiPro.QRBandRecursos.Enabled:=False;
      End;


      If  bIncpromAdmin Then Begin
         QrEmiPro.QRGroupPromotor.Enabled:= True;
         QrEmiPro.QRGroupPromotor.Expression:='qyRelEmiPro.ID_PROM_ADM';
         QrEmiPro.QRBandPromotor.Enabled:= True;
      End Else Begin
         QrEmiPro.QRGroupPromotor.Enabled:= False;
         QrEmiPro.QRGroupPromotor.Expression:='';
         QrEmiPro.QRBandPromotor.Enabled:= False;
      End;


      If Not(bIncTipoSec) Then Begin
         QrEmiPro.QRGroupSector.Enabled := False;
         QrEmiPro.QRGroupSector.Expression := '';
         QrEmiPro.QRBFootSector.Enabled := False;
      End;

      QrEmiPro.qyRelEmiPro.DatabaseName := pApli.DataBaseName;
      QrEmiPro.qyRelEmiPro.SessionName := pApli.SessionName;
      QrEmiPro.qyRelEmiPro.Active:=False;
      QrEmiPro.qyRelEmiPro.SQL.Text:= QrEmiPro.FormaQuery(sF_LiqIni,sF_LiqFin,sF_ComIni,sF_ComFin,
                                                          sMoneda,sEmisor,sProveedor,sPromotor,sAutorizacion,
                                                          sDisposicion,vlTipoDocto,sEmpresa, sSucursal,
                                                          bIncOrigenRec,bIncpromAdmin,bIncTipoSec,sSituacion,
                                                          sOrden,vlOper,sEntDesc,
   // ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
                                                          pAPli);
   // FIN cambio de IVA de 15 a 16                                                          
      QrEmiPro.qyRelEmiPro.SQL.SaveToFile('C:\Emisor-Proveedor.sql');
      //Pone titulo
      If ((Trim(sF_LiqIni)<>'') or (Trim(sF_LiqFin)<>'')) Then Begin
         VLTitulo := VLTitulo + ' F Venc: ';
         If Trim(sF_LiqIni)<>'' Then
            VLTitulo := VLTitulo + sF_LiqIni;
         If (Trim(sF_LiqFin)<>'') Then Begin
            If Trim(sF_LiqIni)<>'' Then
               VLTitulo := VLTitulo + ' al ';
            VLTitulo := VLTitulo + sF_LiqFin;
         End;
      End;
      If ((Trim(sF_ComIni)<>'') or (Trim(sF_ComIni)<>'')) Then Begin
         VLTitulo := VLTitulo + ' F Compra: ';
         If Trim(sF_ComIni)<>'' Then
            VLTitulo := VLTitulo + sF_ComIni;
         If Trim(sF_ComIni)<>'' Then Begin
            If Trim(sF_ComIni)<>'' Then
               VLTitulo := VLTitulo + ' al ';
            VLTitulo := VLTitulo + sF_ComFin;
         End;
      End;

      If (Trim(sMoneda)<>'') Then
          VLTitulo := VLTitulo + ' Por Moneda';
      If (Trim(sEmisor)<>'') Then
          VLTitulo := VLTitulo + ' Por Emisor';
      If (Trim(sProveedor)<>'') Then
          VLTitulo := VLTitulo + ' Por Prov.';
      If (Trim(sPromotor)<>'') Then
          VLTitulo := VLTitulo + ' Por Prom. Adm.';
      If (Trim(sAutorizacion)<>'') Then
          VLTitulo := VLTitulo + ' Por Autorización';
      If (Trim(sDisposicion)<>'') Then
          VLTitulo := VLTitulo + ' Por Disposición';
      If (Trim(vlTipoDocto)<>'') Then
          VLTitulo := VLTitulo + ' Por Tipo de Documento';
      If (Trim(sSituacion)<>'') Then
          VLTitulo := VLTitulo + ' Por Situación';
      If (Trim(sEntDesc)<>'') Then
          VLTitulo := VLTitulo + ' Por Entidad Descontadora';
      {If (Trim(vlOper)<>'') Then
          VLTitulo := VLTitulo + ' Por Cadenas Productivas';}

      QrEmiPro.QRInterEncabezado1.Titulo2 := VLTitulo;

      QrEmiPro.qyRelEmiPro.Active:=False;
      QrEmiPro.qyRelEmiPro.Active:=True;

      QrEmiPro.VLProveedor := 0;
      QrEmiPro.VLEmisor := 0;
      QrEmiPro.VLPromotor := 0;
      { Entindad Contenedora (Origen de Recursos) }
      QrEmiPro.VLRecursos := 0;
      QrEmiPro.VLMoneda := 0;
      QrEmiPro.VLSubDiv := 0;
      QrEmiPro.VLSector := 0;

      {Impresión a Excel}
      If Trim(QrEmiPro.sArchivo)<>'' Then Begin
         AssignFile(F, QrEmiPro.sArchivo);
         Rewrite(F);
         Writeln(F, QrEmiPro.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F, QrEmiPro.QRInterEncabezado1.Titulo2 + #09 );
         Writeln(F,  #09 );
         Writeln(F,
               //Grupos
               'Moneda' + #09#09 +
               'Sector' + #09 +
               'Entidad Descontadora' + #09#09 +
               'Promotor' + #09#09 +
               'Emisor ' + #09#09 +
               'SubDivisión' + #09 +
               'Núm Externo'+ #09 +
               'Chequera Admi'+ #09 +
               'Proveedor' + #09#09 +
               'Núm Externo'+ #09 +
               'Chequera Admi'+ #09 +
               'Chequera Liq'+ #09 +
               'Cesion/Crédito' + #09 +
               'Tipo de Interés' + #09 +
               'Autorización' + #09 +
               //Registros
               'Número de Documento' +  #09+
               'Tipo de Documento' +  #09 +
               'Fecha de Compra' +  #09 +
               'Fecha de Vencimiento' +  #09 +
               'Fecha de Pago' +  #09 +
               'Plazo' +  #09 +
               'Tasa Aforo' +  #09 +
               'Tasa de Descuento / Interés'+  #09 +
               'Importe Nominal' +  #09 +
               'Importe Aforo' +  #09 +
               'Remanante de Garantía' +#09 +
               'Importe Compra'+ #09+
               'Importe Interés'+ #09 +
               'Comisión Disp Proveedor'+#09 +
               'Importe Comisión Disposición'+#09 +
               'Tasa de Comisión Emisor'+ #09 +
               'Importe Comisión Emisor (+IVA)'+ #09 +
               'Total por Cobrar'+ #09 +
               'Importe Pagado'+ #09 +
               'Sit.'+ #09);
           Writeln(F, '');
        End;


        If pPreview Then
            QrEmiPro.Preview
        Else
            QrEmiPro.Print;
    Finally
      If Trim(QrEmiPro.sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrEmiPro.free;
    End;
End;

Function TQrEmiPro.FormaQuery(  sF_LiqIni,sF_LiqFin,sF_ComIni,sF_ComFin,
                        sMoneda,sEmisor,sProveedor,sPromotor,sAutorizacion,
                        sDisposicion,vlTipoDocto, sEmpresa, sSucursal:String;
                        bIncOrigenRec,bIncpromAdmin,bIncTipoSec:Boolean;
                        sSituacion,sOrden,vlOper,sEntDesc:String;
   // ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
                        pAPli     : TInterApli):String;
   // FIN cambio de IVA de 15 a 16
Var
   sSQL:String;
   VLBFVen, VLBFCom  : String;
Begin

   // ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
   kTasaIVA :=  fDameIVA(pAPli);
   //Fin HERJA IVA

   VLBFVen := 'F';
   VLBFCom  := 'F';
   sSQL:=  ' SELECT  CD.ID_DOCUMENTO, CC.ID_CREDITO, CD.ID_CESION, '+ coCRLF +
            ' CD.F_EMISION, CD.F_COMPRA, CD.TASA_AFORO, CD.TASA_COMISION, '+ coCRLF +
         //CORRECCION DE IVA DE 15 A 16
         //ASTECI HERJA 16/12/2009
         //   ' ROUND((ROUND(CCA.IMP_CAPITAL * (CD.TASA_COMISION / 36000) * CCA.PLAZO ,2) * 1.15),2) IMP_COM_EMIS, '+ coCRLF +
            ' ROUND((ROUND(CCA.IMP_CAPITAL * (CD.TASA_COMISION / 36000) * CCA.PLAZO ,2) * 1.'+kTasaIVA+'),2) IMP_COM_EMIS, '+ coCRLF +
         //FIN DE CORRECCION
            ' CD.TASA_DESCUENTO, CD.IMP_NOMINAL, CD.SIT_DOCUMENTO, '+ coCRLF +
            ' CTD.DESC_DOCUMENTO, CCA.F_VENCIMIENTO, CCA.F_PROG_PAGO, '+ coCRLF +
            ' CCA.F_PAGO, CCA.PLAZO, CCA.IMP_PAGADO, CCA.IMP_CAPITAL IMP_AFORADO, '+ coCRLF +
            ' NVL(CCI.IMP_INTERES,0) IMP_INTERES, '+ coCRLF +
            ' ((CCA.IMP_CAPITAL) - (NVL(CCI.IMP_INTERES,0))) IMP_COMPRA, '+ coCRLF +
            ' (NVL(CCC.IMP_COMISION,0) + NVL(CCC.IMP_IVA,0)) IMP_COMISION, '+ coCRLF +
            ' CC.ID_PROM_ADM, CC.ID_CONTRATO, PPR.NOMBRE NOM_PROMOTOR, '+ coCRLF +
            ' CTO.CVE_MONEDA, M.DESC_MONEDA, CCE.ID_EMISOR, '+ coCRLF +
//            ' CCE.CVE_TIPO_INTERES, '+
            ' DECODE(CCE.CVE_TIPO_INTERES,''IN'',''INICIO'',''VE'',''VENCIMIENTO'') CVE_TIPO_INTERES, '+ coCRLF +
            ' CCE.CVE_EMISOR_NAFIN CVE_EMISOR_EXT, CCE.ID_PROVEEDOR, CCE.PCT_COMISION, '+ coCRLF +
            ' (CCCO.IMP_COMISION + CCCO.IMP_IVA) IMP_COMIS_PROV, ' + coCRLF +
            ' DECODE(CCE.B_OPERADO_NAFIN,''F'',''RECURSOS PROPIOS'',''V'',''OPERADO POR NAFIN'','''') B_OPERADO_NAFIN,'+ coCRLF +
            ' DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PE.APELLIDO_PATERNO||'' ''||PE.APELLIDO_MATERNO||'' ''||PE.NOMBRE_PERSONA) NOM_EMISOR, '+ coCRLF +
            ' CE.NOMBRE_EMISOR, PCE.CVE_TIPO_SECTOR, '+ coCRLF +
//            ' CE.CUENTA_BANCO CHEQUERA_EMI, '+
            ' SUBSTR(PKGCRPERIODO.STPObtChqCte(CCE.ID_EMISOR,CCE.CVE_EMISOR_NAFIN,CCE.ID_CESION,''AC'',''AD'',''CR''),1,20) CHEQUERA_EMI,'+ coCRLF +
            ' PP.NOMBRE NOM_PROVEEDOR, '+ coCRLF +
//            ' CP.CUENTA_BANCO CHEQUERA_PROV, '+
            ' SUBSTR(PKGCRPERIODO.STPObtChqCte(CCE.ID_PROVEEDOR,NULL,CCE.ID_CESION,''PR'',''AD'',''AB''),1,20) CHEQUERA_PROV, '+ coCRLF +
            ' SUBSTR(PKGCRPERIODO.STPObtChqCte(CCE.ID_PROVEEDOR,NULL,CCE.ID_CESION,''PR'',''LQ'',''AB''),1,20) CHEQUERA_PROV_L, '+ coCRLF +
            ' CP.ID_PROV_EXTERNO, CR.IMP_REMANENTE, '+ coCRLF +
            ' ((CD.IMP_NOMINAL + NVL(CCI.IMP_INTERES,0) + NVL(CCI.IMP_IVA,0)) '+
            '  - CCA.IMP_PAGADO '+
            '  - NVL(CCI.IMP_PAGADO,0) '+
            '  - NVL(CCI.IMP_IVA_PAGADO,0))  IMP_X_PAGAR ,'+ coCRLF +
            {/Intercase-AMM Selección}
            ' CED.CVE_FND_ENT_DES,CED.DESC_ENT_DES, ' + coCRLF +
            ' DECODE(CCA.SIT_CAPITAL,''IM'',(CCA.IMP_CAPITAL - CCA.IMP_PAGADO),0) AS IMPORTE_IMPAGADO '+ coCRLF +
            ' FROM '+ coCRLF +
            ' CR_DOCUMENTO  CD, '+ coCRLF +
            ' CR_TIPO_DOCTO CTD, '+ coCRLF +
            ' CR_CAPITAL    CCA, '+ coCRLF +
            ' CR_INTERES    CCI, '+ coCRLF +
            ' CR_COMISION   CCC, '+ coCRLF +
            ' CR_CREDITO    CC, '+ coCRLF +
            ' PERSONA       PPR, '+ coCRLF +
            ' CONTRATO      CTO, '+ coCRLF +
            ' MONEDA        M, '+ coCRLF +
            ' CR_CESION     CCE, '+ coCRLF +
//            ' CR_CESION_COMIS CCCO, '+ EASA4011 FEB2005
            ' CR_COMISION   CCCO, '+ coCRLF +
            ' PERSONA_FISICA PE, '+ coCRLF +
            ' PERSONA       PCE,'+ coCRLF +
            ' CR_EMISOR     CE, '+ coCRLF +
            ' PERSONA       PP, '+ coCRLF +
            ' CR_PROVEEDOR  CP, '+ coCRLF +
            ' CR_REMANENTE  CR, '+ coCRLF +
            ' CR_CONTRATO ,     '+ coCRLF +
            ' CR_PRODUCTO CPROD, '+ coCRLF +
            {Intercase-AMM 27112006 agregar el nombre del Entidad Descontadora}
            ' CR_FND_ENT_DES    CED'+ coCRLF +

            ' WHERE CTD.CVE_DOCUMENTO = CD.CVE_DOCUMENTO '+ coCRLF +
            ' AND   CCA.ID_CREDITO = CD.ID_CESION '+ coCRLF +
            ' AND   CCA.NUM_PERIODO = CD.NUM_PERIODO_DOC '+ coCRLF +
            ' AND   CCI.ID_CREDITO (+)= CD.ID_CESION '+ coCRLF +
            ' AND   CCI.NUM_PERIODO (+)= CD.NUM_PERIODO_DOC '+ coCRLF +
            ' AND   CCC.ID_CREDITO (+)= CD.ID_CESION '+ coCRLF +
            ' AND   CCC.NUM_PERIODO (+)= CD.NUM_PERIODO_DOC '+ coCRLF +
            ' AND   CC.ID_CREDITO = CD.ID_CESION '+ coCRLF +
            ' AND   PPR.ID_PERSONA = CC.ID_PROM_ADM '+ coCRLF +
            ' AND   CTO.ID_CONTRATO = CC.ID_CONTRATO '+ coCRLF +
            ' AND   M.CVE_MONEDA = CTO.CVE_MONEDA '+ coCRLF +
            ' AND   CCE.ID_CESION = CD.ID_CESION '+ coCRLF +

//BORRO PARA PRUEBA
            //            ' AND   CCCO.ID_CESION (+)= CCE.ID_CESION '+
{
            ' AND   CCCO.ID_CREDITO(+)= CCE.ID_CESION '+ coCRLF +
            ' AND   CCCO.CVE_COMISION (+)= ''CODIPR'''+ coCRLF +
}
//BORRO PARA PRUEBA
//PRUEBA
            ' AND   CCCO.ID_CREDITO(+)= CD.ID_CESION '+ coCRLF +
            ' AND   CCCO.NUM_PERIODO (+)= CD.NUM_PERIODO_DOC '+ coCRLF +
            ' AND   CCCO.CVE_COMISION (+)= ''CODIPR'''+ coCRLF +
//PRUEBA

            ' AND   PE.ID_PERSONA(+)= CCE.ID_EMISOR '+ coCRLF +
            ' AND   PCE.ID_PERSONA = CCE.ID_EMISOR '+ coCRLF +
            {Intercase-BSS 21112006 se cambio la llave de la tabla de cr_emisor}
            ' AND   CE.CVE_FND_ENT_DES = CCE.CVE_FND_ENT_DES '+ coCRLF +
            ' AND   CE.ID_ACREDITADO = CCE.ID_EMISOR '+ coCRLF +
            ' AND   CE.CVE_EMISOR_EXT = CCE.CVE_EMISOR_NAFIN '+ coCRLF +
            {/Intercase-BSS}
            ' AND   PP.ID_PERSONA = CCE.ID_PROVEEDOR '+ coCRLF +
            {Intercase-BSS 21112006 se cambio la llave de la tabla de cr_proveedor}
            ' AND   CP.CVE_FND_ENT_DES = CCE.CVE_FND_ENT_DES '+ coCRLF +
            ' AND   CP.ID_ACREDITADO = CCE.ID_PROVEEDOR '+ coCRLF +
            {/Intercase-BSS}
            ' AND   CR.ID_CESION (+)= CD.ID_CESION '+ coCRLF +
            ' AND   CR.ID_DOCUMENTO (+)= CD.ID_DOCUMENTO '+ coCRLF +
            ' AND   CR.CVE_TIPO_REMAN (+)= ''RE'''+ coCRLF +
            ' AND   CC.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+ coCRLF +
            ' AND   CC.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+ coCRLF +
            ' AND   CR_CONTRATO.CVE_PRODUCTO_CRE = CPROD.CVE_PRODUCTO_CRE ' + coCRLF +
            {/Intercase-AMM}
            ' AND   CED.CVE_FND_ENT_DES = CCE.CVE_FND_ENT_DES '+ coCRLF;

    If (Trim(sF_LiqIni)<>'')And(Trim(sF_LiqFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CCA.F_VENCIMIENTO BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_LiqIni))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_LiqFin))+
        ''',''DD/MM/YYYY'')' + coCRLF ;
        VLBFVen := 'V';
    End Else If (Trim(sF_LiqIni)<>'')And(Trim(sF_LiqFin)='') Then Begin
         sSQL:= sSQL + ' AND CCA.F_VENCIMIENTO > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_LiqIni))+
        ''',''DD/MM/YYYY'')'+ coCRLF ;
        VLBFVen := 'V';
    End Else If (Trim(sF_LiqIni)='')And(Trim(sF_LiqFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CCA.F_VENCIMIENTO < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_LiqFin))+
        ''',''DD/MM/YYYY'')'+ coCRLF ;
        VLBFVen := 'V';
    End;

    If (Trim(sF_ComIni)<>'')And(Trim(sF_ComFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CD.F_COMPRA BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_ComIni))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_ComFin))+
        ''',''DD/MM/YYYY'')'+ coCRLF ;
        VLBFCom  := 'V';
    End Else If (Trim(sF_ComIni)<>'')And(Trim(sF_ComFin)='') Then Begin
        sSQL:= sSQL + ' AND CD.F_COMPRA > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_ComIni))+
        ''',''DD/MM/YYYY'')'+ coCRLF ;
        VLBFCom  := 'V';
    End Else If (Trim(sF_ComIni)='')And(Trim(sF_ComFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CD.F_COMPRA < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_ComFin))+
        ''',''DD/MM/YYYY'')'+ coCRLF ;
        VLBFCom  := 'V';
    End;

    If (Trim(sMoneda)<>'') Then
        sSQL:= sSQL + ' AND   CTO.CVE_MONEDA ='+sMoneda + coCRLF;
    If (Trim(sEmisor)<>'') Then
        sSQL:= sSQL + ' AND   CCE.ID_EMISOR  ='+sEmisor+ coCRLF;
    If (Trim(sProveedor)<>'') Then
        sSQL:= sSQL + ' AND CCE.ID_PROVEEDOR  ='+ sProveedor+ coCRLF;
    If (Trim(sPromotor)<>'') Then
        sSQL:= sSQL + ' AND   CC.ID_PROM_ADM  ='+ sPromotor+ coCRLF;
    If (Trim(sAutorizacion)<>'') Then
        sSQL:= sSQL + ' AND   CTO.ID_CONTRATO ='+ sAutorizacion+ coCRLF;
    If (Trim(sDisposicion)<>'') Then
        sSQL:= sSQL + ' AND   CC.ID_CREDITO   ='+ sDisposicion+ coCRLF;
    If (Trim(vlTipoDocto)<>'') Then
        sSQL:= sSQL + ' AND   CTD.CVE_DOCUMENTO   ='''+ vlTipoDocto + ''''+ coCRLF;
    If (Trim(sSituacion)<>'') Then
        //sSQL:= sSQL + ' AND   CD.SIT_DOCUMENTO='''+ sSituacion +''''+ coCRLF;
        sSQL:= sSQL + ' AND   CD.SIT_DOCUMENTO IN ('''+ sSituacion +''')'+ coCRLF;
    {Intercase - BSS 21112006 nuevo filtro}
    If (Trim(sEntDesc)<>'') Then
        sSQL:= sSQL + ' AND   CCE.CVE_FND_ENT_DES='''+ sEntDesc +''''+ coCRLF;

    If (Trim(vlOper)<>'') Then
        sSQL:= sSQL + ' AND   CCE.B_OPERADO_NAFIN='''+ vlOper +'''';

    If (Trim(sEmpresa)<>'')Then
        sSQL:= sSQL + ' AND CPROD.ID_EMPRESA = '+ sEmpresa+ coCRLF;

    sSQL:= sSQL + ' ORDER BY M.DESC_MONEDA';

    if bIncTipoSec then
        sSQL:= sSQL + ' ,PCE.CVE_TIPO_SECTOR';
    If  bIncOrigenRec Then
      {Intercase - AMM 27112006 cambio al Filtro }
        sSQL:= sSQL + ' ,CED.CVE_FND_ENT_DES ';
    If  bIncpromAdmin Then
        sSQL:= sSQL + ' ,NOM_PROMOTOR ';
    If Trim(sOrden)='C' Then
        sSQL:= sSQL + ',CC.ID_CREDITO, NOM_PROVEEDOR '
    Else
        sSQL:= sSQL + ',NOM_EMISOR,CVE_EMISOR_EXT,NOM_PROVEEDOR,CC.ID_CREDITO';

    if VLBFVen = 'F' then
            sSQL:= sSQL + ' ,CCA.F_VENCIMIENTO';

    if VLBFCom  = 'F' then
            sSQL:= sSQL + ' ,CD.F_COMPRA';

    Result:= sSQL;
End;

procedure TQrEmiPro.rbFooterCesionBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If VLCesion <> qyRelEmiProID_CESION.AsInteger Then Begin
      VLProveedor := VLProveedor + qyRelEmiProIMP_COMIS_PROV.AsFloat;
      VLEmisor :=    VLEmisor    + qyRelEmiProIMP_COMIS_PROV.AsFloat;
      VLPromotor :=  VLPromotor  + qyRelEmiProIMP_COMIS_PROV.AsFloat;
    { Entindad Contenedora (Origen de Recursos) }
      VLRecursos :=  VLRecursos  + qyRelEmiProIMP_COMIS_PROV.AsFloat;
      VLMoneda :=    VLMoneda    + qyRelEmiProIMP_COMIS_PROV.AsFloat;
      VLSubDiv :=    VLSubDiv    + qyRelEmiProIMP_COMIS_PROV.AsFloat;
      VLSector :=    VLSector    + qyRelEmiProIMP_COMIS_PROV.AsFloat;
   End;
   VLCesion := qyRelEmiProID_CESION.AsInteger;

   If (sArchivo <>'')Then Begin
      Writeln(F,#09#09 +
                QRLabel45.Caption + #09#09 +
                QRExpr49.Value.strResult + #09#09 +
                QRLabel46.Caption +
                #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                FormatFloat('###,###,###,##0.00',QRExpr31.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr35.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr32.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr36.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr33.Value.dblResult) + #09#09 +
                FormatFloat('###,###,###,##0.00',QRExpr67.Value.dblResult) + #09#09 +
                FormatFloat('###,###,###,##0.00',QRExpr59.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr34.Value.dblResult) + #09 +
                QRLabel44.Caption + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr48.Value.dblResult) + #09);
   End;
end;

procedure TQrEmiPro.QRBandProveedorBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   QRSumaProveedor.Caption :=  FormatFloat('###,###,###,###,###,##0.00',VLProveedor);
   VLProveedor := 0;

   If (sArchivo <>'')Then Begin
      Writeln(F,#09#09 +
                QRLabel4.Caption + #09#09 +
                QRExpr10.Value.strResult + #09#09 +
                QRLabel16.Caption +
                #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                FormatFloat('###,###,###,##0.00',QRExpr9.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr8.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr7.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr37.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr3.Value.dblResult) + #09#09 +
                QRSumaProveedor.Caption + #09#09 +
                FormatFloat('###,###,###,##0.00',QRExpr60.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr2.Value.dblResult) + #09#09#09);
   End;
end;

procedure TQrEmiPro.QRBandEmisorBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
//   QRSumaEmisor.Caption :=  FormatFloat('###,###,###,###,###,##0.00',VLEmisor);
   VLEmisor := 0;

   If (sArchivo <>'')Then Begin
      Writeln(F,#09#09 +
                QRLabel7.Caption + #09#09 +
                QRExpr24.Value.strResult + #09#09 +
                QRLabel21.Caption +
                #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                FormatFloat('###,###,###,##0.00',QRExpr23.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr22.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr21.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr38.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr20.Value.dblResult) + #09#09 +
//                QRSumaEmisor.Caption + #09#09 +
                FormatFloat('###,###,###,##0.00',QRExpr62.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr19.Value.dblResult) + #09#09#09);
   End;
end;

procedure TQrEmiPro.QRBandPromotorBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
//   QRSumaProm.Caption :=  FormatFloat('###,###,###,###,###,##0.00',VLPromotor);
   VLPromotor := 0;

   If (sArchivo <>'')Then Begin
      Writeln(F,#09#09 +
                QRLabel11.Caption + #09#09 +
                QRExpr1.Value.strResult + #09#09 +
                QRLabel14.Caption +
                #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                FormatFloat('###,###,###,##0.00',QRExpr6.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr4.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr5.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr39.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr13.Value.dblResult) + #09#09 +
//                QRSumaProm.Caption + #09#09 +
                FormatFloat('###,###,###,##0.00',QRExpr63.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr14.Value.dblResult) + #09#09#09);
   End;
end;

procedure TQrEmiPro.QRBandRecursosBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   {Entindad Contenedora (Origen de Recursos)}
//   QRSumaRecursos.Caption :=  FormatFloat('###,###,###,###,###,##0.00',VLRecursos);
   VLRecursos := 0;
   If (sArchivo <>'')Then Begin
      Writeln(F,#09#09 +
                QRLabel19.Caption + #09#09 +
                QRExpr11.Value.strResult + #09#09 +
                QRLabel39.Caption +
                #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                FormatFloat('###,###,###,##0.00',QRExpr12.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr15.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr16.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr40.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr17.Value.dblResult) + #09#09 +
//                QRSumaRecursos.Caption + #09#09 +
                FormatFloat('###,###,###,##0.00',QRExpr64.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr18.Value.dblResult) + #09#09#09);
   End;
end;

procedure TQrEmiPro.PFooterMonedaBeforePrint(Sender: TQRCustomBand;   var PrintBand: Boolean);
begin
//   QRSumaMoneda.Caption :=  FormatFloat('###,###,###,###,###,##0.00',VLMoneda);
   VLMoneda := 0;
   VLCesion:= 0;

   If (sArchivo <>'')Then Begin
      Writeln(F,#09#09 +
                QRLabel12.Caption + #09#09 +
                QRExpr30.Value.strResult + #09#09 +
                QRLabel23.Caption + #09+
                qyRelEmiPro.FieldByName('DESC_MONEDA').AsString +
                #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                FormatFloat('###,###,###,##0.00',QRExpr29.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr28.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr27.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr41.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr26.Value.dblResult) + #09#09 +
//                QRSumaMoneda.Caption + #09#09 +
                FormatFloat('###,###,###,##0.00',QRExpr66.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr25.Value.dblResult) + #09#09#09);
   End;
end;

procedure TQrEmiPro.QRGSubDivBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   PrintBand := qyRelEmiProCVE_EMISOR_EXT.AsString <> '0';
end;

procedure TQrEmiPro.QRBFootSubdivBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   PrintBand := qyRelEmiProCVE_EMISOR_EXT.AsString <> '0';
//   QRSumaSubDiv.Caption :=  FormatFloat('###,###,###,###,###,##0.00',VLSubDiv);
   VLSubDiv := 0;

   If (sArchivo <>'')Then Begin
      Writeln(F,#09#09 +
                QRLabel47.Caption + #09#09 +
                QRExpr42.Value.strResult + #09#09 +
                QRLabel48.Caption +
                #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                FormatFloat('###,###,###,##0.00',QRExpr43.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr44.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr45.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr46.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr47.Value.dblResult) + #09#09 +
//                QRSumaSubDiv.Caption + #09#09 +
                FormatFloat('###,###,###,##0.00',QRExpr61.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr51.Value.dblResult) + #09#09#09);
   End;
end;

procedure TQrEmiPro.QRBFootSectorBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
//   QRSumaSector.Caption :=  FormatFloat('###,###,###,###,###,##0.00',VLSector);
   VLSector := 0;
   If (sArchivo <>'')Then Begin
      Writeln(F,#09#09 +
                QRLabel49.Caption + #09#09 +
                QRExpr52.Value.strResult + #09#09 +
                QRLabel50.Caption + #09+
                qyRelEmiPro.FieldByName('CVE_TIPO_SECTOR').AsString +
                #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                FormatFloat('###,###,###,##0.00',QRExpr53.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr54.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr55.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr56.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr57.Value.dblResult) + #09#09 +
//                QRSumaSector.Caption + #09#09 +
                FormatFloat('###,###,###,##0.00',QRExpr65.Value.dblResult) + #09 +
                FormatFloat('###,###,###,##0.00',QRExpr58.Value.dblResult) + #09#09#09);
   End;
end;

procedure TQrEmiPro.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If (sArchivo <>'')Then Begin
      Writeln(F,qyRelEmiPro.FieldByName('CVE_MONEDA').AsString + #09 +
                qyRelEmiPro.FieldByName('DESC_MONEDA').AsString + #09 +
                qyRelEmiPro.FieldByName('CVE_TIPO_SECTOR').AsString + #09 +
                qyRelEmiPro.FieldByName('CVE_FND_ENT_DES').AsString + #09 +
                qyRelEmiPro.FieldByName('DESC_ENT_DES').AsString + #09 +
                qyRelEmiPro.FieldByName('ID_PROM_ADM').AsString + #09 +
{ROIM 23/04/2007 ERROR REPORTADO POR KATIA GONZÁLEZ EN NOMBRE DE CAMPO}
//                qyRelEmiPro.FieldByName('NOM_PROMOTOR_ADM').AsString + #09 +
                qyRelEmiPro.FieldByName('NOM_PROMOTOR').AsString + #09 +
{/ROIM}
                qyRelEmiPro.FieldByName('ID_EMISOR').AsString + #09 +
                qyRelEmiPro.FieldByName('NOM_EMISOR').AsString + #09 +
                qyRelEmiPro.FieldByName('NOMBRE_EMISOR').AsString + #09 +
                qyRelEmiPro.FieldByName('CVE_EMISOR_EXT').AsString + #09 +
                qyRelEmiPro.FieldByName('CHEQUERA_EMI').AsString + #09 +
                qyRelEmiPro.FieldByName('ID_PROVEEDOR').AsString + #09 +
                qyRelEmiPro.FieldByName('NOM_PROVEEDOR').AsString + #09 +
                qyRelEmiPro.FieldByName('ID_PROV_EXTERNO').AsString + #09 +
                qyRelEmiPro.FieldByName('CHEQUERA_PROV').AsString + #09 +
                qyRelEmiPro.FieldByName('CHEQUERA_PROV_L').AsString + #09 +
                qyRelEmiPro.FieldByName('ID_CESION').AsString + #09 +
                qyRelEmiPro.FieldByName('CVE_TIPO_INTERES').AsString + #09 +
                qyRelEmiPro.FieldByName('ID_CONTRATO').AsString + #09 +
                qyRelEmiPro.FieldByName('ID_DOCUMENTO').AsString + #09 +
                qyRelEmiPro.FieldByName('DESC_DOCUMENTO').AsString + #09 +
                qyRelEmiPro.FieldByName('F_COMPRA').AsString + #09 +
                qyRelEmiPro.FieldByName('F_VENCIMIENTO').AsString + #09 +
                qyRelEmiPro.FieldByName('F_PAGO').AsString + #09 +
                qyRelEmiPro.FieldByName('PLAZO').AsString + #09 +
                qyRelEmiPro.FieldByName('TASA_AFORO').AsString + #09 +
                qyRelEmiPro.FieldByName('TASA_DESCUENTO').AsString + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiPro.FieldByName('IMP_NOMINAL').AsFloat) + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiPro.FieldByName('IMP_AFORADO').AsFloat) + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiPro.FieldByName('IMP_REMANENTE').AsFloat) + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiPro.FieldByName('IMP_COMPRA').AsFloat) + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiPro.FieldByName('IMP_INTERES').AsFloat) + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiPro.FieldByName('PCT_COMISION').AsFloat) + #09 + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiPro.FieldByName('TASA_COMISION').AsFloat) + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiPro.FieldByName('IMP_COM_EMIS').AsFloat) + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiPro.FieldByName('IMP_X_PAGAR').AsFloat) + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiPro.FieldByName('IMP_PAGADO').AsFloat) + #09 +
                qyRelEmiPro.FieldByName('SIT_DOCUMENTO').AsString + #09);
   End;
end;

End.
