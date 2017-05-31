unit IntMQrEmiProVPN;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview;
Const
   coCRLF      = #13#10;
type
  TQrEmiProVPN = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PFooterMoneda: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
    qyRelEmiProVPN: TQuery;
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
    qyRelEmiProVPNID_DOCUMENTO: TStringField;
    qyRelEmiProVPNID_CREDITO: TFloatField;
    qyRelEmiProVPNID_CESION: TFloatField;
    qyRelEmiProVPNF_EMISION: TDateTimeField;
    qyRelEmiProVPNF_COMPRA: TDateTimeField;
    qyRelEmiProVPNTASA_AFORO: TFloatField;
    qyRelEmiProVPNTASA_COMISION: TFloatField;
    qyRelEmiProVPNTASA_DESCUENTO: TFloatField;
    qyRelEmiProVPNIMP_NOMINAL: TFloatField;
    qyRelEmiProVPNSIT_DOCUMENTO: TStringField;
    qyRelEmiProVPNDESC_DOCUMENTO: TStringField;
    qyRelEmiProVPNF_VENCIMIENTO: TDateTimeField;
    qyRelEmiProVPNF_PROG_PAGO: TDateTimeField;
    qyRelEmiProVPNF_PAGO: TDateTimeField;
    qyRelEmiProVPNPLAZO: TFloatField;
    qyRelEmiProVPNIMP_PAGADO: TFloatField;
    qyRelEmiProVPNIMP_AFORADO: TFloatField;
    qyRelEmiProVPNIMP_INTERES: TFloatField;
    qyRelEmiProVPNIMP_COMPRA: TFloatField;
    qyRelEmiProVPNIMP_COMISION: TFloatField;
    qyRelEmiProVPNID_PROM_ADM: TFloatField;
    qyRelEmiProVPNID_CONTRATO: TFloatField;
    qyRelEmiProVPNNOM_PROMOTOR: TStringField;
    qyRelEmiProVPNCVE_MONEDA: TFloatField;
    qyRelEmiProVPNDESC_MONEDA: TStringField;
    qyRelEmiProVPNID_EMISOR: TFloatField;
    qyRelEmiProVPNCVE_TIPO_INTERES: TStringField;
    qyRelEmiProVPNCVE_EMISOR_EXT: TStringField;
    qyRelEmiProVPNID_PROVEEDOR: TFloatField;
    qyRelEmiProVPNPCT_COMISION: TFloatField;
    qyRelEmiProVPNIMP_COMIS_PROV: TFloatField;
    qyRelEmiProVPNB_OPERADO_NAFIN: TStringField;
    qyRelEmiProVPNNOM_EMISOR: TStringField;
    qyRelEmiProVPNNOMBRE_EMISOR: TStringField;
    qyRelEmiProVPNCVE_TIPO_SECTOR: TStringField;
    qyRelEmiProVPNCHEQUERA_EMI: TStringField;
    qyRelEmiProVPNNOM_PROVEEDOR: TStringField;
    qyRelEmiProVPNCHEQUERA_PROV: TStringField;
    qyRelEmiProVPNCHEQUERA_PROV_L: TStringField;
    qyRelEmiProVPNID_PROV_EXTERNO: TFloatField;
    qyRelEmiProVPNIMP_REMANENTE: TFloatField;
    qyRelEmiProVPNIMP_X_PAGAR: TFloatField;
    qyRelEmiProVPNIMP_COM_EMIS: TFloatField;
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
    qyRelEmiProVPNIMPORTE_IMPAGADO: TFloatField;
    QRExpr67: TQRExpr;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    qyRelEmiProVPNCVE_FND_ENT_DES: TStringField;
    qyRelEmiProVPNDESC_ENT_DES: TStringField;
    QRSumaProveedor: TQRExpr;

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
                        sSituacion,sOrden,vlOper,sEntDesc:String):String;
  end;

var
  QrEmiProVPN: TQrEmiProVPN;
  bGenArch: Boolean;
  F: TextFile;

Procedure RepRelDocEmiProVPN(  sF_LiqIni,sF_LiqFin,sF_ComIni,sF_ComFin,
                            sMoneda,sEmisor,sProveedor,sPromotor,sAutorizacion,
                            sDisposicion,vlTipoDocto, sEmpresa, sSucursal:String;
                            bIncOrigenRec,bIncpromAdmin,bIncTipoSec:Boolean;
                            sSituacion,sOrden,vlOper, sEntDesc, sNbrArch:String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);

Implementation
{$R *.DFM}

Procedure RepRelDocEmiProVPN(  sF_LiqIni,sF_LiqFin,sF_ComIni,sF_ComFin,
                            sMoneda,sEmisor,sProveedor,sPromotor,sAutorizacion,
                            sDisposicion,vlTipoDocto, sEmpresa, sSucursal:String;
                            bIncOrigenRec,bIncpromAdmin,bIncTipoSec:Boolean;
                            sSituacion,sOrden,vlOper, sEntDesc, sNbrArch:String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Var
   QrEmiProVPN: TQrEmiProVPN;
   VLTitulo : String;
   Preview     : TIntQRPreview;
Begin
   VLTitulo := '';
   QrEmiProVPN:=TQrEmiProVPN.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrEmiProVPN);
   Try
      bGenArch:= False;
      QrEmiProVPN.sArchivo:= sNbrArch;
      QrEmiProVPN.VLCesion:= 0;
      QrEmiProVPN.QRInterEncabezado1.Apli:=pApli;
      QrEmiProVPN.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrEmiProVPN.QRInterEncabezado1.NomReporte:='IntMQrEmiProVPN';
      QrEmiProVPN.QRInterEncabezado1.Titulo1:='Relación de Documentos por Emisor - Proveedor (Programados)';

     // Agrupador de Tipo Entidad Descontadora
     // Tiene que cambiar 'qyRelEmiPro.B_OPERADO_NAFIN';

      If  bIncOrigenRec Then Begin
         QrEmiProVPN.QRGroupOrigen.Enabled:= True;
         QrEmiProVPN.QRGroupOrigen.Expression:= 'qyRelEmiPro.CVE_FND_ENT_DES';
         QrEmiProVPN.QRBandRecursos.Enabled:=True;
      End Else Begin
         QrEmiProVPN.QRGroupOrigen.Enabled:= False;
         QrEmiProVPN.QRGroupOrigen.Expression:= '';
         QrEmiProVPN.QRBandRecursos.Enabled:=False;
      End;


      If  bIncpromAdmin Then Begin
         QrEmiProVPN.QRGroupPromotor.Enabled:= True;
         QrEmiProVPN.QRGroupPromotor.Expression:='qyRelEmiPro.ID_PROM_ADM';
         QrEmiProVPN.QRBandPromotor.Enabled:= True;
      End Else Begin
         QrEmiProVPN.QRGroupPromotor.Enabled:= False;
         QrEmiProVPN.QRGroupPromotor.Expression:='';
         QrEmiProVPN.QRBandPromotor.Enabled:= False;
      End;


      If Not(bIncTipoSec) Then Begin
         QrEmiProVPN.QRGroupSector.Enabled := False;
         QrEmiProVPN.QRGroupSector.Expression := '';
         QrEmiProVPN.QRBFootSector.Enabled := False;
      End;

      QrEmiProVPN.qyRelEmiProVPN.DatabaseName := pApli.DataBaseName;
      QrEmiProVPN.qyRelEmiProVPN.SessionName := pApli.SessionName;
      QrEmiProVPN.qyRelEmiProVPN.Active:=False;
      QrEmiProVPN.qyRelEmiProVPN.SQL.Text:= QrEmiProVPN.FormaQuery(sF_LiqIni,sF_LiqFin,sF_ComIni,sF_ComFin,
                                                          sMoneda,sEmisor,sProveedor,sPromotor,sAutorizacion,
                                                          sDisposicion,vlTipoDocto,sEmpresa, sSucursal,
                                                          bIncOrigenRec,bIncpromAdmin,bIncTipoSec,sSituacion,
                                                          sOrden,vlOper,sEntDesc);
      QrEmiProVPN.qyRelEmiProVPN.SQL.SaveToFile('C:\RepEmisProvVPN.TXT');
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
      If (Trim(vlOper)<>'') Then
          VLTitulo := VLTitulo + ' Por Cadenas Productivas';

      QrEmiProVPN.QRInterEncabezado1.Titulo2 := VLTitulo;

      QrEmiProVPN.qyRelEmiProVPN.Active:=False;
      QrEmiProVPN.qyRelEmiProVPN.Active:=True;

      QrEmiProVPN.VLProveedor := 0;
      QrEmiProVPN.VLEmisor := 0;
      QrEmiProVPN.VLPromotor := 0;
      { Entindad Contenedora (Origen de Recursos) }
      QrEmiProVPN.VLRecursos := 0;
      QrEmiProVPN.VLMoneda := 0;
      QrEmiProVPN.VLSubDiv := 0;
      QrEmiProVPN.VLSector := 0;

      {Impresión a Excel}
      If Trim(QrEmiProVPN.sArchivo)<>'' Then Begin
         AssignFile(F, QrEmiProVPN.sArchivo);
         Rewrite(F);
         Writeln(F, QrEmiProVPN.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F, QrEmiProVPN.QRInterEncabezado1.Titulo2 + #09 );
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
            QrEmiProVPN.Preview
        Else
            QrEmiProVPN.Print;
    Finally
      If Trim(QrEmiProVPN.sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrEmiProVPN.free;
    End;
End;

Function TQrEmiProVPN.FormaQuery(  sF_LiqIni,sF_LiqFin,sF_ComIni,sF_ComFin,
                        sMoneda,sEmisor,sProveedor,sPromotor,sAutorizacion,
                        sDisposicion,vlTipoDocto, sEmpresa, sSucursal:String;
                        bIncOrigenRec,bIncpromAdmin,bIncTipoSec:Boolean;
                        sSituacion,sOrden,vlOper,sEntDesc:String):String;
Var
   sSQL:String;
   VLBFVen, VLBFCom  : String;
Begin
   VLBFVen := 'F';
   VLBFCom  := 'F';
   sSQL:=  ' SELECT  TO_CHAR(CA.NUM_PERIODO) AS ID_DOCUMENTO, CC.ID_CREDITO, CS.ID_CESION, '+ coCRLF +
            '        CC.F_INICIO AS F_EMISION, CC.F_INICIO AS F_COMPRA, 100 AS TASA_AFORO, 0 AS TASA_COMISION, '+ coCRLF +
            '        0 AS IMP_COM_EMIS, '+ coCRLF +
            '        CC.TASA_CREDITO AS TASA_DESCUENTO, NVL(CA.IMP_CUOTA,0) + NVL(CI.IMP_CUOTA,0) AS IMP_NOMINAL, CA.SIT_CAPITAL AS SIT_DOCUMENTO, '+ coCRLF +
            '        (SELECT DESC_DOCUMENTO FROM CR_TIPO_DOCTO WHERE CVE_DOCUMENTO = ''PAGA'') AS DESC_DOCUMENTO, CA.F_VENCIMIENTO, CA.F_PROG_PAGO, '+ coCRLF +
            '        TO_DATE(NULL,''DD/MM/YYYY'') AS F_PAGO, CA.PLAZO, 0 AS IMP_PAGADO, CA.IMP_CUOTA AS IMP_AFORADO, '+ coCRLF +
            '        NVL(CI.IMP_CUOTA,0) AS IMP_INTERES, '+ coCRLF +
            '        NVL(CA.IMP_CUOTA,0) AS IMP_COMPRA, '+ coCRLF +
            '        0 AS IMP_COMISION, '+ coCRLF +
            '        CC.ID_PROM_ADM, CC.ID_CONTRATO, PPR.NOMBRE NOM_PROMOTOR,'+ coCRLF +
            '        CTO.CVE_MONEDA, M.DESC_MONEDA, CS.ID_EMISOR,'+ coCRLF +
            '        DECODE(CS.CVE_TIPO_INTERES,''IN'',''INICIO'',''VE'',''VENCIMIENTO'') CVE_TIPO_INTERES, '+ coCRLF +
            '        CS.CVE_EMISOR_NAFIN CVE_EMISOR_EXT, CS.ID_PROVEEDOR, CS.PCT_COMISION, '+ coCRLF +
            '        PKGIMPUESTO.ObtCalculaIVA(CTO.ID_CONTRATO, CA.IMP_CUOTA * (CS.PCT_COMISION/100))+ CA.IMP_CUOTA * (CS.PCT_COMISION/100) AS IMP_COMIS_PROV, ' + coCRLF +
            '        DECODE(CS.B_OPERADO_NAFIN,''F'',''RECURSOS PROPIOS'',''V'',''OPERADO POR NAFIN'','''') B_OPERADO_NAFIN,'+ coCRLF +
            '        DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PE.APELLIDO_PATERNO||'' ''||PE.APELLIDO_MATERNO||'' ''||PE.NOMBRE_PERSONA) NOM_EMISOR, '+ coCRLF +
            '        CE.NOMBRE_EMISOR, PCE.CVE_TIPO_SECTOR, '+ coCRLF +
            '        SUBSTR(PKGCRPERIODO.STPObtChqCte(CS.ID_EMISOR,CS.CVE_EMISOR_NAFIN,CS.ID_CESION,''AC'',''AD'',''CR''),1,20) CHEQUERA_EMI,'+ coCRLF +
            '        PP.NOMBRE NOM_PROVEEDOR, '+ coCRLF +
            '        SUBSTR(PKGCRPERIODO.STPObtChqCte(CS.ID_PROVEEDOR,NULL,CS.ID_CESION,''PR'',''AD'',''AB''),1,20) CHEQUERA_PROV, '+ coCRLF +
            '        SUBSTR(PKGCRPERIODO.STPObtChqCte(CS.ID_PROVEEDOR,NULL,CS.ID_CESION,''PR'',''LQ'',''AB''),1,20) CHEQUERA_PROV_L, '+ coCRLF +
            '        CP.ID_PROV_EXTERNO, 0 AS IMP_REMANENTE, '+ coCRLF +
            '        NVL(CA.IMP_CUOTA,0) + NVL(CI.IMP_CUOTA,0) AS IMP_X_PAGAR ,'+ coCRLF +
            '        CED.CVE_FND_ENT_DES,CED.DESC_ENT_DES, ' + coCRLF +
            '        0 AS IMPORTE_IMPAGADO '+ coCRLF +
            ' FROM '+ coCRLF +
            '     ( SELECT * FROM CR_SOL_CUOTA WHERE CVE_ACCESORIO = ''CP'') CA, '+ coCRLF +
            '     (SELECT * FROM CR_SOL_CUOTA  WHERE CVE_ACCESORIO = ''IN'') CI, '+ coCRLF +
            '     CR_CREDITO     CC, '+ coCRLF +
            '     PERSONA        PPR, '+ coCRLF +
            '     CONTRATO       CTO, '+ coCRLF +
            '     MONEDA         M, '+ coCRLF +
            '     CR_CESION      CS, '+ coCRLF +
            '     PERSONA_FISICA PE, '+ coCRLF +
            '     PERSONA        PCE,'+ coCRLF +
            '     CR_EMISOR      CE, '+ coCRLF +
            '     PERSONA        PP, '+ coCRLF +
            '     CR_PROVEEDOR   CP, '+ coCRLF +
            '     CR_CONTRATO    CCTO,'+ coCRLF +
            '     CR_PRODUCTO    CPROD, '+ coCRLF +
            '     CR_FND_ENT_DES CED'+ coCRLF +

            ' WHERE CA.ID_REF_SOL_CUOTA   = CS.ID_CESION'+ coCRLF +
            '   AND CI.ID_REF_SOL_CUOTA   = CS.ID_CESION'+ coCRLF +
            '   AND CI.NUM_PERIODO        = CA.NUM_PERIODO'+ coCRLF +
            '   AND CC.ID_CREDITO         = CS.ID_CESION '+ coCRLF +
            '   AND PPR.ID_PERSONA        = CC.ID_PROM_ADM '+ coCRLF +
            '   AND CTO.ID_CONTRATO       = CC.ID_CONTRATO '+ coCRLF +
            '   AND M.CVE_MONEDA          = CTO.CVE_MONEDA '+ coCRLF +
            '   AND PE.ID_PERSONA(+)      = CS.ID_EMISOR '+ coCRLF +
            '   AND PCE.ID_PERSONA        = CS.ID_EMISOR '+ coCRLF +
            '   AND CE.CVE_FND_ENT_DES    = CS.CVE_FND_ENT_DES '+ coCRLF +
            '   AND CE.ID_ACREDITADO      = CS.ID_EMISOR '+ coCRLF +
            '   AND CE.CVE_EMISOR_EXT     = CS.CVE_EMISOR_NAFIN '+ coCRLF +
            '   AND PP.ID_PERSONA         = CS.ID_PROVEEDOR '+ coCRLF +
            '   AND CP.CVE_FND_ENT_DES    = CS.CVE_FND_ENT_DES '+ coCRLF +
            '   AND CP.ID_ACREDITADO      = CS.ID_PROVEEDOR '+ coCRLF +
            '   AND CC.ID_CONTRATO        = CCTO.ID_CONTRATO '+ coCRLF +
            '   AND CC.FOL_CONTRATO       = CCTO.FOL_CONTRATO '+ coCRLF +
            '   AND CCTO.CVE_PRODUCTO_CRE = CPROD.CVE_PRODUCTO_CRE ' + coCRLF +
            '   AND CED.CVE_FND_ENT_DES   = CS.CVE_FND_ENT_DES '+ coCRLF;

    If (Trim(sF_LiqIni)<>'')And(Trim(sF_LiqFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CA.F_VENCIMIENTO BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_LiqIni))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_LiqFin))+
        ''',''DD/MM/YYYY'')' + coCRLF ;
        VLBFVen := 'V';
    End Else If (Trim(sF_LiqIni)<>'')And(Trim(sF_LiqFin)='') Then Begin
         sSQL:= sSQL + ' AND CA.F_VENCIMIENTO > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_LiqIni))+
        ''',''DD/MM/YYYY'')'+ coCRLF ;
        VLBFVen := 'V';
    End Else If (Trim(sF_LiqIni)='')And(Trim(sF_LiqFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CA.F_VENCIMIENTO < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_LiqFin))+
        ''',''DD/MM/YYYY'')'+ coCRLF ;
        VLBFVen := 'V';
    End;

    If (Trim(sF_ComIni)<>'')And(Trim(sF_ComFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CC.F_INICIO BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_ComIni))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_ComFin))+
        ''',''DD/MM/YYYY'')'+ coCRLF ;
        VLBFCom  := 'V';
    End Else If (Trim(sF_ComIni)<>'')And(Trim(sF_ComFin)='') Then Begin
        sSQL:= sSQL + ' AND CC.F_INICIO > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_ComIni))+
        ''',''DD/MM/YYYY'')'+ coCRLF ;
        VLBFCom  := 'V';
    End Else If (Trim(sF_ComIni)='')And(Trim(sF_ComFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CC.F_INICIO < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_ComFin))+
        ''',''DD/MM/YYYY'')'+ coCRLF ;
        VLBFCom  := 'V';
    End;

    If (Trim(sMoneda)<>'') Then
        sSQL:= sSQL + ' AND   CTO.CVE_MONEDA  ='+sMoneda + coCRLF;
    If (Trim(sEmisor)<>'') Then
        sSQL:= sSQL + ' AND   CS.ID_EMISOR    ='+sEmisor+ coCRLF;
    If (Trim(sProveedor)<>'') Then
        sSQL:= sSQL + ' AND CS.ID_PROVEEDOR   ='+ sProveedor+ coCRLF;
    If (Trim(sPromotor)<>'') Then
        sSQL:= sSQL + ' AND   CC.ID_PROM_ADM  ='+ sPromotor+ coCRLF;
    If (Trim(sAutorizacion)<>'') Then
        sSQL:= sSQL + ' AND   CTO.ID_CONTRATO ='+ sAutorizacion+ coCRLF;
    If (Trim(sDisposicion)<>'') Then
        sSQL:= sSQL + ' AND   CC.ID_CREDITO   ='+ sDisposicion+ coCRLF;
    If (Trim(sSituacion)<>'') Then
        sSQL:= sSQL + ' AND   CA.SIT_CAPITAL  ='''+ sSituacion +''''+ coCRLF;
    If (Trim(sEntDesc)<>'') Then
        sSQL:= sSQL + ' AND   CS.CVE_FND_ENT_DES='''+ sEntDesc +''''+ coCRLF;
    If (Trim(vlOper)<>'') Then
        sSQL:= sSQL + ' AND   CS.B_OPERADO_NAFIN='''+ vlOper +'''';
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
            sSQL:= sSQL + ' ,CA.F_VENCIMIENTO';

    if VLBFCom  = 'F' then
            sSQL:= sSQL + ' ,CC.F_INICIO';

    Result:= sSQL;
End;

procedure TQrEmiProVPN.rbFooterCesionBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If VLCesion <> qyRelEmiProVPNID_CESION.AsInteger Then Begin
//      VLProveedor := VLProveedor + qyRelEmiProVPNIMP_COMIS_PROV.AsFloat;
      VLEmisor :=    VLEmisor    + qyRelEmiProVPNIMP_COMIS_PROV.AsFloat;
      VLPromotor :=  VLPromotor  + qyRelEmiProVPNIMP_COMIS_PROV.AsFloat;
    { Entindad Contenedora (Origen de Recursos) }
      VLRecursos :=  VLRecursos  + qyRelEmiProVPNIMP_COMIS_PROV.AsFloat;
      VLMoneda :=    VLMoneda    + qyRelEmiProVPNIMP_COMIS_PROV.AsFloat;
      VLSubDiv :=    VLSubDiv    + qyRelEmiProVPNIMP_COMIS_PROV.AsFloat;
      VLSector :=    VLSector    + qyRelEmiProVPNIMP_COMIS_PROV.AsFloat;
   End;
   VLCesion := qyRelEmiProVPNID_CESION.AsInteger;

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

procedure TQrEmiProVPN.QRBandProveedorBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
//   QRSumaProveedor.Caption :=  FormatFloat('###,###,###,###,###,##0.00',VLProveedor);
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

procedure TQrEmiProVPN.QRBandEmisorBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
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

procedure TQrEmiProVPN.QRBandPromotorBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
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

procedure TQrEmiProVPN.QRBandRecursosBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
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

procedure TQrEmiProVPN.PFooterMonedaBeforePrint(Sender: TQRCustomBand;   var PrintBand: Boolean);
begin
//   QRSumaMoneda.Caption :=  FormatFloat('###,###,###,###,###,##0.00',VLMoneda);
   VLMoneda := 0;
   VLCesion:= 0;

   If (sArchivo <>'')Then Begin
      Writeln(F,#09#09 +
                QRLabel12.Caption + #09#09 +
                QRExpr30.Value.strResult + #09#09 +
                QRLabel23.Caption + #09+
                qyRelEmiProVPN.FieldByName('DESC_MONEDA').AsString +
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

procedure TQrEmiProVPN.QRGSubDivBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   PrintBand := qyRelEmiProVPNCVE_EMISOR_EXT.AsString <> '0';
end;

procedure TQrEmiProVPN.QRBFootSubdivBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   PrintBand := qyRelEmiProVPNCVE_EMISOR_EXT.AsString <> '0';
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

procedure TQrEmiProVPN.QRBFootSectorBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
//   QRSumaSector.Caption :=  FormatFloat('###,###,###,###,###,##0.00',VLSector);
   VLSector := 0;
   If (sArchivo <>'')Then Begin
      Writeln(F,#09#09 +
                QRLabel49.Caption + #09#09 +
                QRExpr52.Value.strResult + #09#09 +
                QRLabel50.Caption + #09+
                qyRelEmiProVPN.FieldByName('CVE_TIPO_SECTOR').AsString +
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

procedure TQrEmiProVPN.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If (sArchivo <>'')Then Begin
      Writeln(F,qyRelEmiProVPN.FieldByName('CVE_MONEDA').AsString + #09 +
                qyRelEmiProVPN.FieldByName('DESC_MONEDA').AsString + #09 +
                qyRelEmiProVPN.FieldByName('CVE_TIPO_SECTOR').AsString + #09 +
                qyRelEmiProVPN.FieldByName('CVE_FND_ENT_DES').AsString + #09 +
                qyRelEmiProVPN.FieldByName('DESC_ENT_DES').AsString + #09 +
                qyRelEmiProVPN.FieldByName('ID_PROM_ADM').AsString + #09 +
                qyRelEmiProVPN.FieldByName('NOM_PROMOTOR').AsString + #09 +
{/ROIM}
                qyRelEmiProVPN.FieldByName('ID_EMISOR').AsString + #09 +
                qyRelEmiProVPN.FieldByName('NOM_EMISOR').AsString + #09 +
                qyRelEmiProVPN.FieldByName('NOMBRE_EMISOR').AsString + #09 +
                qyRelEmiProVPN.FieldByName('CVE_EMISOR_EXT').AsString + #09 +
                qyRelEmiProVPN.FieldByName('CHEQUERA_EMI').AsString + #09 +
                qyRelEmiProVPN.FieldByName('ID_PROVEEDOR').AsString + #09 +
                qyRelEmiProVPN.FieldByName('NOM_PROVEEDOR').AsString + #09 +
                qyRelEmiProVPN.FieldByName('ID_PROV_EXTERNO').AsString + #09 +
                qyRelEmiProVPN.FieldByName('CHEQUERA_PROV').AsString + #09 +
                qyRelEmiProVPN.FieldByName('CHEQUERA_PROV_L').AsString + #09 +
                qyRelEmiProVPN.FieldByName('ID_CESION').AsString + #09 +
                qyRelEmiProVPN.FieldByName('CVE_TIPO_INTERES').AsString + #09 +
                qyRelEmiProVPN.FieldByName('ID_CONTRATO').AsString + #09 +
                qyRelEmiProVPN.FieldByName('ID_DOCUMENTO').AsString + #09 +
                qyRelEmiProVPN.FieldByName('DESC_DOCUMENTO').AsString + #09 +
                qyRelEmiProVPN.FieldByName('F_COMPRA').AsString + #09 +
                qyRelEmiProVPN.FieldByName('F_VENCIMIENTO').AsString + #09 +
                qyRelEmiProVPN.FieldByName('F_PAGO').AsString + #09 +
                qyRelEmiProVPN.FieldByName('PLAZO').AsString + #09 +
                qyRelEmiProVPN.FieldByName('TASA_AFORO').AsString + #09 +
                qyRelEmiProVPN.FieldByName('TASA_DESCUENTO').AsString + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiProVPN.FieldByName('IMP_NOMINAL').AsFloat) + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiProVPN.FieldByName('IMP_AFORADO').AsFloat) + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiProVPN.FieldByName('IMP_REMANENTE').AsFloat) + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiProVPN.FieldByName('IMP_COMPRA').AsFloat) + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiProVPN.FieldByName('IMP_INTERES').AsFloat) + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiProVPN.FieldByName('PCT_COMISION').AsFloat) + #09 + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiProVPN.FieldByName('TASA_COMISION').AsFloat) + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiProVPN.FieldByName('IMP_COM_EMIS').AsFloat) + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiProVPN.FieldByName('IMP_X_PAGAR').AsFloat) + #09 +
                FormatFloat('###,###,###,##0.00',qyRelEmiProVPN.FieldByName('IMP_PAGADO').AsFloat) + #09 +
                qyRelEmiProVPN.FieldByName('SIT_DOCUMENTO').AsString + #09);
   End;
end;

End.
