unit IntMQrConsImpa;

interface        

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, unSQL2,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead,InterApl,
  IntQRPreview, Dialogs, IntGenCre;

type
  TQrConsImpa = class(TQuickRep)
    qyConsImpa: TQuery;
    qyConsImpaDIASIMVE: TFloatField;
    qyConsImpaID_CREDITO: TFloatField;
    qyConsImpaF_VENCIMIENTO: TDateTimeField;
    qyConsImpaIMP_CAPITAL: TFloatField;
    qyConsImpaIMP_IVA: TFloatField;
    qyConsImpaIMP_TOTAL: TFloatField;
    qyConsImpaCVE_MONEDA: TFloatField;
    qyConsImpaDESC_MONEDA: TStringField;
    qyConsImpaID_PROM_ADM: TFloatField;
    qyConsImpaNOM_PROMOTOR_ADM: TStringField;
    qyConsImpaID_PERS_ASOCIAD: TFloatField;
    qyConsImpaNOM_PROMOTOR_ASO: TStringField;
    qyConsImpaCVE_PRODUCTO_CRE: TStringField;
    qyConsImpaDESC_L_PRODUCTO: TStringField;
    qyConsImpaID_CREDITO_1: TFloatField;
    qyConsImpaID_CONTRATO: TFloatField;
    qyConsImpaNOMBRE: TStringField;
    qyConsImpaID_EMISOR: TFloatField;
    qyConsImpaCVE_EMISOR_NAFIN: TStringField;
    qyConsImpaID_PROVEEDOR: TFloatField;
    qyConsImpaNOMBRE_EMISOR: TStringField;
    qyConsImpaCVE_TIPO_SECTOR: TStringField;
    qyConsImpaNOM_PROVEEDOR: TStringField;
    qyConsImpaID_PROV_NAFINSA: TFloatField;
    qyConsImpaSDO_INSOLUTO: TFloatField;
    qyConsImpaCVE_CALCULO: TStringField;
    qyConsImpaNO_REFER: TFloatField;
    qyConsImpaID_TITULAR: TFloatField;
    qyConsImpaMORATORIOS: TFloatField;
    qyConsImpaIMP_NOMINAL: TFloatField;
    qyConsImpaSDO_VIG_TOTAL: TFloatField;
    qyConsImpaIMP_CREDITO: TFloatField;
    qyConsImpaIMP_BINTER: TFloatField;
    qyConsImpaIMP_FEGA: TFloatField;
    qyConsImpaCVE_TIPO_CRED_BC: TFloatField;
    qyConsImpaDESC_TIPO_CRED: TStringField;
    qyConsImpaNOM_DRCN: TStringField;
    qyConsImpaNOM_DRTR: TStringField;
    qyConsImpaESTADO: TStringField;
    qyConsImpaDESC_POBLACION: TStringField;
    qyConsImpaIMP_FA: TFloatField;
    qyConsImpaIMP_INTERES: TFloatField;
    qyConsImpaIMP_COMISIONES: TFloatField;
    qyConsImpaF_PROG_PAGO: TDateField;
    QRBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape14: TQRShape;
    QRShape25: TQRShape;
    QRShape24: TQRShape;
    QRShape22: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabelNOMBRE: TQRLabel;
    QRLabelNOM_PROVEEDOR: TQRLabel;
    QRLabelID_CREDITO: TQRLabel;
    QRLabelIMP_FEGA: TQRLabel;
    QRLabelIMP_BINTER: TQRLabel;
    QRLabelDIASIMVE: TQRLabel;
    QRLabelF_PROG_PAGO: TQRLabel;
    QRShape23: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabelIMPORTE: TQRLabel;
    QRShape28: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape31: TQRShape;
    QRLabel7: TQRLabel;
    QRBandDetalle: TQRBand;
    QRDBNOM_PROVEEDOR: TQRDBText;
    QRDBID_CREDITO: TQRDBText;
    QRDBIMP_FEGA: TQRDBText;
    QRDBIMP_BINTER: TQRDBText;
    QRDBDIASIMVE: TQRDBText;
    QRDBText1: TQRDBText;
    QRDB_CVE_PRODUCTO_CRE: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRGroupDireccion: TQRGroup;
    QRGroupRegion: TQRGroup;
    QRGroupMoneda: TQRGroup;
    QRGroupPromAsoc: TQRGroup;
    QRGroupPromAdm: TQRGroup;
    QRGNombre: TQRGroup;
    QRLabelNOM_DRCN: TQRLabel;
    QRDBNOM_DRCN: TQRDBText;
    QRLabelNOM_DRTR: TQRLabel;
    QRDBNOM_DRTR: TQRDBText;
    QRShape11: TQRShape;
    QRLabelREGION: TQRLabel;
    QRDBESTADO: TQRDBText;
    QRDBDESC_POBLACION: TQRDBText;
    QRShape12: TQRShape;
    QRLabelMoneda: TQRLabel;
    QRDBCVE_MONEDA: TQRDBText;
    QRDBDESC_MONEDA: TQRDBText;
    QRShape20: TQRShape;
    QRLabelPromAsoc: TQRLabel;
    QRDBID_PERS_ASOCIAD: TQRDBText;
    QRDBNOM_PROMOTOR_ASO: TQRDBText;
    QRShape21: TQRShape;
    QRLabelPromAdm: TQRLabel;
    QRDBID_PROM_ADM: TQRDBText;
    QRDBNOM_PROMOTOR_ADM: TQRDBText;
    QRFooterPromAdm: TQRBand;
    QRLabel2: TQRLabel;
    QRShape15: TQRShape;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRFooterPromAsoc: TQRBand;
    QRLabel3: TQRLabel;
    QRShape16: TQRShape;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRFooterMoneda: TQRBand;
    QRShape13: TQRShape;
    QRLabel1: TQRLabel;
    TotGarMON: TQRExpr;
    TotBINMon: TQRExpr;
    TotCapMON: TQRExpr;
    TotIntMON: TQRExpr;
    TotComMON: TQRExpr;
    TotIVAMON: TQRExpr;
    TotMORMON: TQRExpr;
    TotSIMON: TQRExpr;
    TotCreMon: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRFooterRegion: TQRBand;
    QRLabel4: TQRLabel;
    QRShape17: TQRShape;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    QRExpr32: TQRExpr;
    QRExpr33: TQRExpr;
    QRExpr34: TQRExpr;
    QRExpr35: TQRExpr;
    QRExpr36: TQRExpr;
    QRExpr37: TQRExpr;
    QRExpr38: TQRExpr;
    QRFooterDireccion: TQRBand;
    QRLabel5: TQRLabel;
    QRShape18: TQRShape;
    QRExpr39: TQRExpr;
    QRExpr40: TQRExpr;
    QRExpr41: TQRExpr;
    QRExpr42: TQRExpr;
    QRExpr43: TQRExpr;
    QRExpr44: TQRExpr;
    QRExpr45: TQRExpr;
    QRExpr46: TQRExpr;
    QRExpr47: TQRExpr;
    QRExpr48: TQRExpr;
    QRExpr49: TQRExpr;
    QRFooterCont: TQRBand;
    QRShape19: TQRShape;
    QRLabel45: TQRLabel;
    QRExpr50: TQRExpr;
    QRExpr51: TQRExpr;
    QRExpr52: TQRExpr;
    QRExpr53: TQRExpr;
    QRExpr54: TQRExpr;
    QRExpr55: TQRExpr;
    QRExpr56: TQRExpr;
    QRExpr57: TQRExpr;
    QRExpr58: TQRExpr;
    QRExpr59: TQRExpr;
    QRExpr60: TQRExpr;
    QRBNombre: TQRBand;
    QRExpr61: TQRExpr;
    QRExpr62: TQRExpr;
    QRExpr63: TQRExpr;
    QRExpr64: TQRExpr;
    QRExpr65: TQRExpr;
    QRExpr66: TQRExpr;
    QRExpr67: TQRExpr;
    QRExpr68: TQRExpr;
    QRExpr69: TQRExpr;
    QRExpr70: TQRExpr;
    QRExpr71: TQRExpr;
    QRDBText9: TQRDBText;
    qyConsImpaSTATUSRECU: TStringField;
    QRExpr72: TQRExpr;
    QRExpr73: TQRExpr;
    QRLabel15: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape32: TQRShape;
    qyConsImpaF_ALTA_RECU: TDateTimeField;
    QRShape37: TQRShape;
    QRLabel16: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    procedure QRGroupDireccionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupRegionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupPromAsocBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupPromAdmBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterContBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

     //para el footer de Moneda
    VL_M_Binter : Double;
    VL_M_FEGA   : Double;
    VL_M_Importe: Double;

     //para el footer de P Administrador
    VL_PAD_Binter : Double;
    VL_PAD_FEGA   : Double;
    VL_PAD_Importe: Double;

     //para el footer de P Asociado
    VL_PAS_Binter : Double;
    VL_PAS_FEGA   : Double;
    VL_PAS_Importe: Double;

     //para el footer de Region
    VL_REG_Binter : Double;
    VL_REG_FEGA   : Double;
    VL_REG_Importe: Double;

     //para el footer de Direccion
    VL_DIR_Binter : Double;
    VL_DIR_FEGA   : Double;
    VL_DIR_Importe: Double;

    // Gran Total
    VLTotBinter : Double;
    VLTotFEGA : Double;
    VLTotImporte : Double;

    // Factor (tipo de cambio) para la conversion de Dlls a Pesos
    vgTipCambioDll: Double;

    VGBRegion: Boolean;


  public
    function FormaQuery(sF_Vencimiento,sID_Direccion, sID_Director, sID_Region,
                        sPromAsoc,sPromAdmon,sMoneda, sSituacion,
                        sOrden, sProducto, sGpoProducto, sEmpresa, sSucursal,sAcreditado, sCredito
     //RLUMBRERAS LATBC 8/02/2011 (Se agrgegan variables para reporte de recuperados)
                     ,sTipRecu
    //-----------------------------------------------------------------------------

                     ,sFRegion :String):String;

  end;

var
  QrConsImpa: TQrConsImpa;
  bGenArch: Boolean;
  sArchivo:String;
  vgFechaHoy : TDateTime;
  F: TextFile;
  Apli : TInterApli;

  procedure RepConsImpa(sF_Vencimiento,
                       sID_Direccion ,sID_Director,sID_Region,
                       sPromAsoc,sPromAdmon,sMoneda, sSituacion,
                       sOrden,  sProducto, sGpoProducto, sEmpresa, sSucursal,
                       sAcreditado, sCredito, sAgrupa ,sFRegion,
                       sNbrArch
      //RLUMBRERAS LATBC 8/02/2011 (Se agrgegan variables para reporte de recuperados)
                     ,sTipRecu
    //-----------------------------------------------------------------------------
                       :String;
                       pPreview  : Boolean;
                       pAPli     : TInterApli);

implementation

{$R *.DFM}

procedure RepConsImpa( sF_Vencimiento,
                       sID_Direccion ,sID_Director,sID_Region,
                       sPromAsoc,sPromAdmon,sMoneda, sSituacion,
                       sOrden, sProducto, sGpoProducto,  sEmpresa, sSucursal,
                       sAcreditado, sCredito, sAgrupa, sFRegion,
                       sNbrArch
      //RLUMBRERAS LATBC 8/02/2011 (Se agrgegan variables para reporte de recuperados)
                     ,sTipRecu
     //-----------------------------------------------------------------------------
                       :String;
                       pPreview  : Boolean;
                       pAPli     : TInterApli);
var
    QrConsImpa: TQrConsImpa;
    VLTitulo  : String;
    Preview   : TIntQRPreview;
begin
    VLTitulo := '';
    QrConsImpa:= TQrConsImpa.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrConsImpa);
    Apli := pApli;
      Try
        vgFechaHoy  :=  pAPli.DameFechaEmpresa;
        bGenArch    :=  False;
        sArchivo    :=  sNbrArch;
        QrConsImpa.QRInterEncabezado1.Apli := pApli;

        QrConsImpa.vgTipCambioDll:= ObtTipoCambio(pAPli.DameFechaEmpresaDia('D000'), IntToStr ( C_DLLS ),pAPli.DataBaseName, pAPli.SessionName);
        QrConsImpa.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrConsImpa.QRInterEncabezado1.NomReporte:='IntMQrConsImpa';
        QrConsImpa.QRInterEncabezado1.Titulo1:='Fecha de Corte : '+ sF_Vencimiento;

        If (Trim(sID_Direccion)<>'') Then
            VLTitulo := VLTitulo + ' Por Dirección';
        //If (Trim(sID_Director)<>'') Then  // Se encuentra cubierta este parámetro cuando se pasa valor <> '' para Direccion
        //    VLTitulo := VLTitulo + ' Por Director';
        If (Trim(sID_Region)<>'') Then
            VLTitulo := VLTitulo + ' Por Región';
        If (Trim(sPromAsoc)<>'') Then
            VLTitulo := VLTitulo + ' Por Prom. Asociado';
        If (Trim(sPromAdmon)<>'') Then
            VLTitulo := VLTitulo + ' Por Prom. Administrador';
        If (Trim(sMoneda)<>'') Then
            VLTitulo := VLTitulo + ' Por Moneda';

        if Trim(sSituacion) = 'IV' then
        begin
          VLTitulo := VLTitulo + ' Reporte Consolidado de Cartera Impagada';
        end;

        QrConsImpa.QRInterEncabezado1.Titulo2 := VLTitulo;
        QrConsImpa.qyConsImpa.DatabaseName := pApli.DataBaseName;
        QrConsImpa.qyConsImpa.SessionName  := pApli.SessionName;

        QrConsImpa.qyConsImpa.Active:=False;

        QrConsImpa.VGBRegion :=  sFRegion = '0';

        QrConsImpa.QRGroupRegion.enabled :=  QrConsImpa.VGBRegion;
        QrConsImpa.QRFooterRegion.enabled :=  QrConsImpa.VGBRegion;

        if QrConsImpa.VGBRegion then
           QrConsImpa.QRGroupRegion.Expression := 'qyConsImpa.DESC_POBLACION';
        // end if;

        if sAgrupa = '0' then
        begin
             QrConsImpa.QRExpr72.Height := 0;
             QrConsImpa.QRBNombre.Height := 0;
             QrConsImpa.QRBandDetalle.Height := 10;
        end;

        if sAgrupa = '1' then
        begin
             QrConsImpa.QRExpr72.Height := 14;
             QrConsImpa.QRBNombre.Height := 14;
             QrConsImpa.QRBandDetalle.Height := 0;             
        end;


        QrConsImpa.qyConsImpa.SQL.Text:= QrConsImpa.FormaQuery(sF_Vencimiento,
                                         sID_Direccion,sID_Director,sID_Region,
                                         sPromAsoc,sPromAdmon,sMoneda,sSituacion,
                                         sOrden, sProducto, sGpoProducto, sEmpresa, sSucursal,
                                         sAcreditado, sCredito
     //RLUMBRERAS LATBC 8/02/2011 (Se agrgegan variables para reporte de recuperados)
                     ,sTipRecu
    //-----------------------------------------------------------------------------
                        ,sFRegion );

        QrConsImpa.qyConsImpa.SQL.SaveToFile('c:\ConsImpag.txt');
        QrConsImpa.qyConsImpa.Active:=True;


        If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrConsImpa.QRInterEncabezado1.Titulo1+ #09 );
         Writeln(F, QrConsImpa.QRInterEncabezado1.Titulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F,
                  'NOM_DRCN' + #09 +
                  'NOM_DRTR' + #09 +
                  'ESTADO' + #09 +
                  'DESC_POBLACION' + #09 +
                  'ID_PERS_ASOCIAD' + #09 +
                  'NOM_PROMOTOR_ASO' + #09 +
                  'ID_PROM_ADM' + #09 +
                  'NOM_PROMOTOR_ADM' + #09 +
                  'CVE_MONEDA' + #09 +
                  'DESC_MONEDA' + #09 +
                  'NOMBRE' + #09 +
                  'ID_PROVEEDOR' + #09 +
                  'NOM_PROVEEDOR' + #09 +
                  'CVE_PRODUCTO_CRE' + #09 +
                  'ID_CREDITO' + #09 +
                  'IMP_CREDITO' + #09+
                  'SDO_VIG_TOTAL' + #09+
                  'F_VENCIMIENTO' + #09+
                  'IMP_CAPITAL' + #09+
                  'IMP_FA' + #09+
                  'IMP_INTERES' + #09+
                  'IMP_COMISIONES' + #09+
                  'IMP_IVA' + #09+
                  'IMP_MORAS' + #09+
                  'IMP_FEGA' + #09+
                  'IMP_BINTER' + #09+
                  'IMP_TOTAL' + #09+
                  'DIASIMVE'
           //RLUMBRERAS LATBC 8/02/2011 (Se agrgegan variables para reporte de recuperados)
                   + #09 + 'EN RECUPERACION'
          //-------------------------------------------------------------------------------
                  );
      End;
        If pPreview Then
            QrConsImpa.Preview
        Else
            QrConsImpa.Print;

     Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrConsImpa.free;
      If Assigned(Preview) Then Preview.Free;
    End;

end;

function TQrConsImpa.FormaQuery(sF_Vencimiento,sID_Direccion, sID_Director, sID_Region,
                        sPromAsoc,sPromAdmon,sMoneda, sSituacion,
                        sOrden,  sProducto, sGpoProducto, sEmpresa, sSucursal,sAcreditado, sCredito
     //RLUMBRERAS LATBC 8/02/2011 (Se agrgegan variables para reporte de recuperados)
                     ,sTipRecu
    //-----------------------------------------------------------------------------
                     ,sFRegion:String):String;

Var
    sSQL         : String;
    sSQL1        : String;
    sSQL2        : String;
    sSQL3        : String;
    sSQL4        : String;
    sSQL5        : String;
    sSQL6        : String;
    sSQL7        : String;

    VlSituacion  : String;
    VLBFechaTras : Boolean;
    VLDiaHoy     : String;
    VLComparador : String;
    VLTipoRep    : String;
    sF_Calculo   : String;
    //RLUMBRERAS LATBC 8/02/2011 (Se agrgegan variables para reporte de recuperados)
    sStatus     : String;
begin
    sStatus:='En Recuperación';
   //-------------------------------------------------------------------------------

    VLDiaHoy := 'D000';
    if sSituacion = 'IV' then
    begin
      VLBFechaTras := False;
      VlSituacion := 'IM';
    end;

   {if (((sSituacion = 'VE') or (sSituacion = 'IM') or (sSituacion = 'IV')) and  (sFecRep = 'A'))  then
      VLComparador := '<='
    else
      VLComparador := '='; }

    // no interviene la variable  (sFecRep = 'A'), que estaba implementada para considerar Fechas del Reporte:
    // A : Acumulado, D : Al Día
    VLComparador := '<=';

   {If Trim(sTipoReporte)='O' Then
        VLTipoRep := '';
    If Trim(sTipoReporte)='C' Then
        VLTipoRep := ' + 1 '; }

    // no interviene la variable  (sTipoReporte ), que estaba implementada para considerar Tipo del Reporte:
    // O : Operativo, C: Al Cierre del Día.
   //    VLTipoRep := '';

    // 09 NOV 2009 HEGC La variable vlTipoRep se considera como al cierre del dia
    VLTipoRep := ' ';

    sF_Calculo := Trim(sF_Vencimiento);
    // La fecha de Vencimiento es requerida en el reporte, por lo que no podrá estar en blanco este valor
   {if Trim(sF_Vencimiento) = '' then
      sF_Calculo := Trim(sF_Programada); }

    sSQL:=  ' SELECT '+ coCRLF +
            '        NVL(DIR.DESC_DIRECCION,''NO ASIGNADA'') AS NOM_DRCN ,NVL(PDIR.NOMBRE,''NO ASIGNADO'') AS NOM_DRTR, '+ coCRLF +
            '        DOM.CVE_ESTADO  AS ESTADO, POB.DESC_POBLACION, '+ coCRLF +
            '        NVL(DIR.CVE_DIRECCION,''NOASIG'') AS CVE_DIRECCION, NVL(DIR.ID_DIRECTOR,0) AS ID_DIRECTOR, CTO.ID_TITULAR, '+ coCRLF +
//            '        NVL(ACCE.F_PAGO,(F_REF.F_REFERENCIA '+ VLTipoRep + ')) - ACCE.F_PROG_PAGO  diasImVe,'+ coCRLF +
              // HEGC: CALCULA LOS DIAS DE IMPAGADO EN BASE A LA FECHA DEL REPORTE
            '        F_REF.F_REFERENCIA '+ VLTipoRep +' - ACCE.F_VENCIMIENTO  diasImVe,'+ coCRLF +
            // HEGC COMENTO DESDE AQUI 03/NOV/2009
            {

            '        SUBDIV.ID_CESION        ,       CD.ID_DOCUMENTO, '+ coCRLF +
            '        ACCE.*                  ,       NVL(CD.ID_DOCUMENTO, TO_CHAR(ACCE.NUM_PERIODO)) AS NUM_PERIODO_PER,'+ coCRLF +
            }
            '            ACCE.ID_CREDITO, ACCE.F_VENCIMIENTO, acce.F_PROG_PAGO,    '+ coCRLF +
	    '     	 SUM(DECODE(ACCE.ORD_ACC,''A'',ACCE.IMPORTE,0)) IMP_CAPITAL, '+ coCRLF +
            '            SUM(DECODE(ACCE.ORD_ACC,''B'',ACCE.IMPORTE,0)) IMP_FA,      '+ coCRLF +
            '            SUM(DECODE(ACCE.ORD_ACC,''C'',ACCE.IMPORTE,0)) IMP_INTERES, '+ coCRLF +
            '            SUM(DECODE(ACCE.ORD_ACC,''D'',ACCE.IMPORTE,0)) IMP_COMISIONES, '+ coCRLF +
            '            sum(acce.imp_iva) imp_iva,                                 '+ coCRLF +
            '            SUM(acce.Imp_Binter) IMP_BINTER,                           '+ coCRLF +
            '            SUM(acce.IMP_FEGA) IMP_FEGA,                               '+ coCRLF +
            '            SUM(acce.Imp_Total) IMP_TOTAL,                             '+ coCRLF +
            '            SUM( acce.MORATORIOS) MORATORIOS,                          '+ coCRLF +
            // HASTA AQUI 03/NOV/2009 HEGC
            '        CTO.CVE_MONEDA          ,       M.DESC_MONEDA                   , '+ coCRLF +
            '        CC.ID_PROM_ADM          ,       PPR.NOMBRE NOM_PROMOTOR_ADM     , '+ coCRLF +
            '        CTO.ID_PERS_ASOCIAD     ,       PPRC.NOMBRE NOM_PROMOTOR_ASO    , '+ coCRLF +
            '        CPR.CVE_PRODUCTO_CRE    ,       CPR.DESC_L_PRODUCTO             , '+ coCRLF +
            '        CPR.CVE_TIPO_CRED_BC    ,       CTC.DESC_TIPO_CRED              , '+ coCRLF +
            '        CC.ID_CREDITO           ,       CC.ID_CONTRATO                  , '+ coCRLF +
            '        DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PTIT.APELLIDO_PATERNO||'' ''||PTIT.APELLIDO_MATERNO||'' ''||PTIT.NOMBRE_PERSONA) NOMBRE, '+ coCRLF +
            '        SUBDIV.ID_EMISOR        ,       NVL(SUBDIV.CVE_EMISOR_NAFIN,0) CVE_EMISOR_NAFIN,'+ coCRLF +
            '        SUBDIV.ID_PROVEEDOR     ,       PP.NOMBRE NOM_PROVEEDOR         , '+ coCRLF +
            '        SUBDIV.NOMBRE_EMISOR    ,       PCE.CVE_TIPO_SECTOR             , '+ coCRLF +
          // Las lineas comentadas de este bloque corresponden a columnas que no se requieren en el reporte de Consolidados de Impagados
          //'        SUBSTR(PKGCRPERIODO.STPObtChqCte(CTO.ID_TITULAR,NVL(SUBDIV.CVE_EMISOR_NAFIN,''0''),NVL(CC.ID_CREDITO,NULL),NVL(SUBDIV.TIPO_ACRED,''AC''),''AD'',''CR''),1,20) CUENTA_BANCO,'+ coCRLF +
          //'        PKGCRCUOTAS.ObtSdoCheq(SUBSTR(PKGCRPERIODO.STPObtChqCte(CTO.ID_TITULAR,NVL(SUBDIV.CVE_EMISOR_NAFIN,''0''),NVL(CC.ID_CREDITO,NULL),NVL(SUBDIV.TIPO_ACRED,''AC''),''AD'',''CR''),1,20), '+ SQLFecha( vgFechaHoy) +') SALDO_CTA,'+ coCRLF +
            '        CP.ID_PROV_EXTERNO ID_PROV_NAFINSA                              , '+ coCRLF +
            '        CC.SDO_INSOLUTO         ,       CC.SDO_VIG_TOTAL                , '+ coCRLF +
//            '        CC.IMP_CREDITO          ,       CC.CVE_CALCULO                  , '+ coCRLF +
         //HEGC: EL IMPORTE DEL CREDITO SE TOMARA DEL CAMPO IMP_DISPUESTO
            '        CC.IMP_DISPUESTO AS IMP_CREDITO   ,       CC.CVE_CALCULO                  , '+ coCRLF +
            '        0 NO_REFER              ,       CTO.ID_TITULAR                  , '+ coCRLF +
            {'        MORATORIOS              , }
            '     NVL(CD.IMP_NOMINAL,0) AS IMP_NOMINAL  '{,} + coCRLF +
          //'        NVL(TABVENCTA.CUENTA_VEN_KAP_EX,TABVENCTAICRE.CVE_CTA_CONT_CAVEEX)   CUENTA_VEN_KAP_EX    ,       NVL(TABVENCTA.CUENTA_VENCIDA_INT,TABVENCTAICRE.CVE_CTA_CONT_INVEEX)     CUENTA_VENCIDA_INT , '+ coCRLF +
          //'        NVL(TABIMPCTA.CUENTA_IMPAGADO_KAP,TABIMPCTAICRE.CVE_CTA_CONT_CPIMVD)  CUENTA_IMPAGADO_KAP   ,       NVL(TABIMPCTA.CUENTA_IMPAGADO_INT,TABIMPCTAICRE.CVE_CTA_CONT_CPIMVD)  CUENTA_IMPAGADO_INT  '+ coCRLF +
          // FROM DEL QUERY PRINCIPAL
            //****INICIO JRG LatBC---
            '           ,NVL(RECU.STATUS_RECU,'' '') AS STATUS_RECU ' + coCRLF +
            '           ,RECU.F_ALTA_RECU AS F_ALTA_RECU ' + coCRLF +
            //****FIN JRG LatBC---
            ' FROM ' + coCRLF+ coCRLF;
            sSQL1 := sSQL;
            sSQL := '';

            //* * * * * * * * * * * * * * * * * CAPITAL * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
            sSQL:= sSQL +
            '      ( SELECT ''A'' ORD_ACC ,CCA.ID_CREDITO,''CAPITAL'' ACCESORIO,CCA.NUM_PERIODO,CCA.PLAZO,(CCA.F_VENCIMIENTO - CCA.PLAZO) F_INICIO, '+ coCRLF +
            '               CCA.F_VENCIMIENTO,CCA.F_PROG_PAGO,CCA.F_PAGO,' + coCRLF +
            '               PKGCRCOMUN.FUNOBTENTASA(''CP'',CCA.ID_CREDITO,CCA.NUM_PERIODO,CCA.F_VENCIMIENTO-1)TASA_APLICADA,' + coCRLF + //easa4011      29072005
//HERJA ENERO 2013
//            '               (CCA.IMP_CAPITAL - CCA.IMP_PAGADO_HIST ) IMPORTE, '+ coCRLF +
            '               (CCA.IMP_CAPITAL - CCA.IMP_PAGADO_HIST + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0)) IMPORTE, '+ coCRLF +
//FIN HERJA
            '                0 IMP_IVA,CCA.SIT_CAPITAL, '+ coCRLF +
//HERJA ENERO 2013
//            '               (CCA.IMP_CAPITAL - CCA.IMP_PAGADO_HIST - CCA.IMP_CONCEPTO) IMP_BINTER, '+ coCRLF +
            '               (CCA.IMP_CAPITAL - CCA.IMP_PAGADO_HIST - CCA.IMP_CONCEPTO + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0)) IMP_BINTER, '+ coCRLF +
// FIN HERJA
            '               CCA.IMP_CONCEPTO IMP_FEGA, '+ coCRLF +
            //'             (CCA.IMP_BENEF_BCO + CCA.IMP_BENEF_GOB) IMP_BENEFICIO, '+ coCRLF +
            //'             (CCA.IMP_CAPITAL - CCA.IMP_BENEF_BCO - CCA.IMP_BENEF_GOB + CCA.MORATORIOS - CCA.IMP_PAGADO_HIST) IMP_TOTAL, '+ coCRLF +
//HERJA ENERO 2013
//            '              (CCA.IMP_CAPITAL + CCA.MORATORIOS - CCA.IMP_PAGADO_HIST) IMP_TOTAL, '+ coCRLF +
            '              (CCA.IMP_CAPITAL + CCA.MORATORIOS - CCA.IMP_PAGADO_HIST + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0)) IMP_TOTAL, '+ coCRLF +
// FIN HERJA
            '               CCA.MORATORIOS'+ coCRLF +
            '        FROM  ( SELECT CCA.*, ' + coCRLF +
            '                       PKGCRCOMUN.FUNOBTENIMPGTIA( 3, ''CP'', ''IMPBRU'', CCA.ID_CREDITO, CCA.NUM_PERIODO, NULL, ' +
                                    SQLFecha( StrToDate( sF_Calculo ) ) + ', ''V'' ) IMP_CONCEPTO, ' +coCRLF +
            '                       NVL( PKGCRPERIODO.FUNOBTENMORA( 1,''V'',CCA.ID_CREDITO,CCA.NUM_PERIODO,NULL,NULL,' +
                                    SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep + ',NULL), 0 ) AS MORATORIOS, '+ coCRLF +
            '                       NVL(  PKGCRCOMUN.STPOBTIMPPAGADO( ''CP'', ''IMPBRU'',CCA.ID_CREDITO, CCA.NUM_PERIODO,NULL,' +
                                    SQLFecha(StrToDate(sF_Calculo )) +',''V'' ), 0 ) AS IMP_PAGADO_HIST '+ coCRLF +
            '                FROM ( SELECT * FROM CR_CAPITAL CCA ' + coCRLF +
            '                       WHERE 1 = 1'+ coCRLF ;

            If (Trim(sEmpresa)<>'') Then
              sSQL := sSQL + '                         AND PKGCRACTUALIZA.STPOBTEMPRESA(CCA.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;

            // No se implemento en la pantalla del filtro del reporte
            //If (Trim(sCesion)<>'') Then  sSQL := sSQL + ' AND CCA.ID_CREDITO = '+ sCesion  +  coCRLF;

            //If Trim(sF_Vencimiento)<>'' Then
                sSQL := sSQL + '                         AND  CCA.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF ;
            //Else If Trim(sF_Programada)<>'' Then
            //    sSQL := sSQL + '                         AND  CCA.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;

            If (Trim(VlSituacion)='IM') Then
            begin
                sSQL := sSQL + '                         AND  ((CCA.F_PROG_PAGO < CCA.F_PAGO AND CCA.SIT_CAPITAL <> ''CA'''  + coCRLF +
                            // '                         AND   CCA.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                               '                         AND   CCA.F_PAGO > ' + SQLFecha( StrToDate( sF_Vencimiento ) ) + ')' + coCRLF +
                               '                          OR   (CCA.SIT_CAPITAL = ''IM'' ))' + coCRLF ;
            end;

            sSQL := sSQL +
            '                      ) CCA' + coCRLF +
            '              ) CCA, CR_CREDITO CR, CR_CONTRATO CCTO, CR_PRODUCTO CPR' + coCRLF +
//HERJA ENERO 2013
            ',            (' + coCRLF +
	    '		    SELECT CT.ID_CREDITO, CT.ID_PERIODO,' + coCRLF +
            '                      NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP' + coCRLF +
            '                 FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT' + coCRLF +
            '                WHERE 1=1' + coCRLF +
            '                  AND CT.SIT_TRANSACCION = ''AC''' + coCRLF +
            '                  AND CT.ID_TRANS_CANCELA IS NULL' + coCRLF +
            '                  AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION' + coCRLF +
            '                  AND CT.CVE_OPERACION IN (''PGDMCP'')' + coCRLF +
	    '		       AND CDT.CVE_CONCEPTO IN (''IMPBRU'')' + coCRLF +
            '             GROUP BY CT.ID_CREDITO, CT.ID_PERIODO' + coCRLF +
	    '		  ) CA_HIST_PGDMCP' + coCRLF +
//FIN HERJA
            '        WHERE 1 = 1' + coCRLF;
          // No intervienen en este reporte pues sSituacion = 'IV'
         {If ((sSituacion = 'VE') or (sSituacion = 'IM'))  Then Begin
               If VLBFechaTras Then
                   sSQL:= sSQL + '   AND CR.F_TRASPASO_VENC IS NOT NULL '+  coCRLF
               Else
                   sSQL:= sSQL + '   AND CR.F_TRASPASO_VENC IS NULL '+  coCRLF ;
          End;          }

          //If (Trim(sProducto)<>'') Then sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_CRE ='''+sProducto+''''+  coCRLF ;
          If (Trim(sMoneda)<>'') Then
              sSQL:= sSQL + '        AND CCTO.CVE_MONEDA ='+sMoneda +  coCRLF ;
          If (Trim(sPromAdmon)<>'') Then
              sSQL:= sSQL + '        AND CR.ID_PROM_ADM ='+ sPromAdmon +  coCRLF ;
          //If (Trim(sCesion)<>'') Then sSQL:= sSQL + '   AND  CR.ID_CREDITO ='+ sCesion  +  coCRLF ;
          //If ((Trim(VlSituacion)<>'') and (Trim(VlSituacion)<>'IM')) Then sSQL:= sSQL + '   AND CCA.SIT_CAPITAL ='''+ VlSituacion+''''+  coCRLF ;
          If (Trim(sEmpresa)<>'') Then
              sSQL:= sSQL + '        AND CPR.ID_EMPRESA ='+ Trim(sEmpresa) +coCRLF ;
          //If (Trim(sGpoProd)<>'') Then sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd ); // grupo del producto

            sSQL := sSQL +
//HERJA ENERO 2013
	    '  	     AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCA.ID_CREDITO' + coCRLF +
	    '	     AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCA.NUM_PERIODO' + coCRLF +
// FIN HERJA
            '        AND CR.ID_CREDITO = CCA.ID_CREDITO' + coCRLF +
            '        AND CR.ID_CONTRATO = CCTO.ID_CONTRATO' + coCRLF +
            '        AND CR.FOL_CONTRATO = CCTO.FOL_CONTRATO' + coCRLF +
            '        AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE' + coCRLF + coCRLF;

            sSQL2 := sSQL;
            sSQL := '';

            //* * * * * * * * * * * * * * * * * * * * * * * * INTERES * * * * * * * * * * * * * * * * * * * *
            // No interviene la variable Fecha Anticipada, entonces se omite la validacion:
            // if B_ANTICIPADA = 'F' then para Armar el Query de intereses

            sSQL:= sSQL +
            '      UNION '+ coCRLF + coCRLF +

            '        SELECT ''C'' ORD_ACC ,CCI.ID_CREDITO,''INTERES'' ACCESORIO,CCI.NUM_PERIODO,CCI.PLAZO,(CCI.F_VENCIMIENTO - CCI.PLAZO) F_INICIO, '+ coCRLF +
            '               CCI.F_VENCIMIENTO,CCI.F_PROG_PAGO,CCI.F_PAGO,CCI.TASA_APLICADA,'+ coCRLF +
            '               (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST) IMPORTE, '+ coCRLF +
//HERJA - CAMBIO POR IVA_PROYECTADO
//            '               CCI.IMP_IVA - CCI.IMP_IVA_PAG_HIST,CCI.SIT_INTERES, '+ coCRLF +
            '               CCI.IMP_IVA_PROY  - CCI.IMP_IVA_PAG_HIST AS IMP_IVA, CCI.SIT_INTERES, '+ coCRLF +
            '               (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST - NVL(CCI.IMP_CONCEPTO,0)) IMP_BINTER, '+ coCRLF +
            '               NVL(CCI.IMP_CONCEPTO,0) IMP_FEGA, '+ coCRLF +
            //'             (CCI.IMP_BENEF_BCO + CCI.IMP_BENEF_GOB) IMP_BENEFICIO, '+ coCRLF +
            //'             (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST + CCI.IMP_IVA + CCI.MORATORIOS - CCI.IMP_IVA_PAG_HIST - CCI.IMP_BENEF_BCO - CCI.IMP_BENEF_GOB) IMP_TOTAL,  '+  coCRLF +
//HERJA - CAMBIO POR IVA_PROYECTADO
//            '              (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST + CCI.IMP_IVA + CCI.MORATORIOS - CCI.IMP_IVA_PAG_HIST) IMP_TOTAL, ' + coCRLF +
            '              (CCI.IMP_INTERES_PROY - CCI.IMP_PAGADO_HIST + CCI.IMP_IVA_PROY + CCI.MORATORIOS - CCI.IMP_IVA_PAG_HIST) IMP_TOTAL, ' + coCRLF +
            '               CCI. MORATORIOS '+ coCRLF +
            '        FROM ( SELECT CCI.*, '+ coCRLF +
            '                      PKGCRCOMUN.FUNOBTENIMPGTIA( 3, ''IN'', ''IMPBRU'', CCI.ID_CREDITO, CCI.NUM_PERIODO, NULL, ' +
                                   SQLFecha( StrToDate( sF_Calculo ) ) + ', ''V'' ) IMP_CONCEPTO, ' +coCRLF +
            '                      NVL( PKGCRPERIODO.FUNOBTENMORA( 4,''V'',CCI.ID_CREDITO,CCI.NUM_PERIODO,NULL,NULL,' +
                                   SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep +',NULL), 0 ) AS MORATORIOS, '+ coCRLF +
            '                      NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''IN'', ''IMPBRU'',CCI.ID_CREDITO,  CCI.NUM_PERIODO,NULL, ' +
                                   SQLFecha( StrToDate( sF_Calculo ) ) +',''V'' ), 0 ) AS IMP_PAGADO_HIST,'+ coCRLF +
            '                      NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''IN'', ''IMPIVA'', CCI.ID_CREDITO,  CCI.NUM_PERIODO, NULL,  ' +
                                   SQLFecha( StrToDate( sF_Calculo ) ) + ',''V'' ), 0 ) AS IMP_IVA_PAG_HIST '+ coCRLF +coCRLF +

            '               FROM ( SELECT * FROM CR_INTERES CCI '+ coCRLF +
            '                      WHERE 1 = 1'+ coCRLF ;

            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + '                         AND PKGCRACTUALIZA.STPOBTEMPRESA(CCI.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;
            // If (Trim(sCesion)<>'') Then sSQL := sSQL + ' AND CCI.ID_CREDITO = '+ sCesion  +  coCRLF;

            // If Trim(sF_Vencimiento)<>'' Then
                sSQL := sSQL + '                         AND CCI.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF ;
            // Else If Trim(sF_Programada)<>'' Then  sSQL := sSQL + ' AND CCI.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;

            If (Trim(VlSituacion)='IM') Then
            begin
                sSQL := sSQL + '                         AND ((CCI.F_PROG_PAGO < CCI.F_PAGO AND  CCI.SIT_INTERES <> ''CA''' +  coCRLF +
                               //'                       AND CCI.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                               '                         AND CCI.F_PAGO > ' + SQLFecha( StrToDate( sF_Vencimiento ) ) + ')' + coCRLF +
                               '                          OR (CCI.SIT_INTERES = ''IM'' ))'+  coCRLF ;
            end;

            sSQL := sSQL + '                      ) CCI ' + coCRLF +
                           '               ) CCI, CR_CREDITO CR, CR_CONTRATO CCTO, CR_PRODUCTO CPR' + coCRLF +
            '        WHERE 1 = 1' + coCRLF;

         // No intervienen en este reporte pues sSituacion = 'IV'
         {If ((sSituacion = 'VE') or (sSituacion = 'IM'))  Then Begin
               If VLBFechaTras Then
                   sSQL:= sSQL + '   AND CR.F_TRASPASO_VENC IS NOT NULL '+  coCRLF
               Else
                   sSQL:= sSQL + '   AND CR.F_TRASPASO_VENC IS NULL '+  coCRLF ;
          End;  }
          
          //If (Trim(sProducto)<>'') Then sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_CRE ='''+sProducto+''''+  coCRLF ;
          If (Trim(sMoneda)<>'') Then
              sSQL:= sSQL + '        AND CCTO.CVE_MONEDA =' + sMoneda + coCRLF ;
          If (Trim(sPromAdmon)<>'') Then
              sSQL:= sSQL + '        AND CR.ID_PROM_ADM =' + sPromAdmon + coCRLF ;
          //If (Trim(sCesion)<>'') Then sSQL:= sSQL + '   AND  CR.ID_CREDITO ='+ sCesion  +  coCRLF ;
          //If ((Trim(VlSituacion)<>'') and (Trim(VlSituacion)<>'IM')) Then sSQL:= sSQL + '   AND CCI.SIT_INTERES ='''+ VlSituacion+''''+  coCRLF ;
          If (Trim(sEmpresa)<>'') Then
              sSQL:= sSQL + '        AND CPR.ID_EMPRESA =' + Trim(sEmpresa) + coCRLF ;

          //If (Trim(sGpoProd)<>'') Then sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd );

            sSQL := sSQL +
            '        AND CR.ID_CREDITO = CCI.ID_CREDITO' + coCRLF +
            '        AND CR.ID_CONTRATO = CCTO.ID_CONTRATO' + coCRLF +
            '        AND CR.FOL_CONTRATO = CCTO.FOL_CONTRATO' + coCRLF +
            '        AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE' + coCRLF+ coCRLF;
            sSQL3 := sSQL;
            sSQL := '';


            // * * * * * * * * * * * * * * * * * * * * * * * * REFINANCIAMIENTO * * * * * * * * * * * * * *

            sSQL:= sSQL +
            '      UNION '+ coCRLF + coCRLF +
            '        SELECT ''B'' ORD_ACC ,CFA.ID_CREDITO,''REFINANCIAMIENTO'' ACCESORIO,CFA.NUM_PERIODO,CFA.PLAZO,(CFA.F_VENCIMIENTO - CFA.PLAZO) F_INICIO, '+  coCRLF +
            '               CFA.F_VENCIMIENTO,CFA.F_PROG_PAGO,CFA.F_PAGO,0 TASA_APLICADA,'+ coCRLF +
            '               (CFA.IMP_FINAN_ADIC - CFA.IMP_PAGADO_HIST) IMPORTE,  '+ coCRLF +
            '                0 IMP_IVA,CFA.SIT_FINAN_ADIC, '+ coCRLF +
            '               (CFA.IMP_FINAN_ADIC - CFA.IMP_PAGADO_HIST - NVL(CFA.IMP_CONCEPTO,0)) IMP_BINTER, '+ coCRLF +
            '                NVL(CFA.IMP_CONCEPTO,0) IMP_FEGA, '+ coCRLF +
            //'                0 IMP_BENEFICIO, '+ coCRLF +
            '               (CFA.IMP_FINAN_ADIC + CFA.MORATORIOS - CFA.IMP_PAGADO_HIST ) IMP_TOTAL,  '+ coCRLF +
            '               CFA.MORATORIOS'+  coCRLF +
            '        FROM ( SELECT CFA.*, ' + coCRLF +
            '                      PKGCRCOMUN.FUNOBTENIMPGTIA( 3, ''FN'', ''IMPBRU'', CFA.ID_CREDITO, CFA.NUM_PERIODO, NULL, ' +
                                   SQLFecha( StrToDate( sF_Calculo ) ) + ', ''V'' ) IMP_CONCEPTO, ' +coCRLF +
            '                      NVL( PKGCRPERIODO.FUNOBTENMORA(3,''V'' ,CFA.ID_CREDITO, CFA.NUM_PERIODO , NULL, NULL,' +
                                   SQLFecha( StrToDate( sF_Calculo ) ) + VLTipoRep +',NULL), 0 ) AS MORATORIOS,'+ coCRLF +
            '                      NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''FN'', ''IMPBRU'',CFA.ID_CREDITO,CFA.NUM_PERIODO,NULL,' +
                                   SQLFecha(StrToDate(sF_Calculo )) + ',''V'' ), 0 ) AS IMP_PAGADO_HIST '+ coCRLF + coCRLF +
            '               FROM ( SELECT * FROM CR_FINAN_ADIC  CFA ' + coCRLF +
            '                      WHERE 1 = 1'+ coCRLF ;

            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + '                         AND PKGCRACTUALIZA.STPOBTEMPRESA(CFA.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;

            //If (Trim(sCesion)<>'') Then sSQL := sSQL + '                         AND CFA.ID_CREDITO = '+ sCesion  +  coCRLF;

            //If Trim(sF_Vencimiento)<>'' Then
                sSQL := sSQL + '                         AND CFA.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF ;
            //Else If Trim(sF_Programada)<>'' Then
            //    sSQL := sSQL + '                         AND  CFA.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF;

            //
            If (Trim(VlSituacion)='IM')Then
            begin
                sSQL := sSQL + '                         AND ((CFA.F_PROG_PAGO < CFA.F_PAGO ' + coCRLF +
                               '                               AND CFA.SIT_FINAN_ADIC <> ''CA''' + coCRLF +
                           //  '                               AND CFA.F_PAGO > '+ SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                               '                               AND CFA.F_PAGO > '+ SQLFecha( StrToDate( sF_Vencimiento ) ) + ')' + coCRLF +
                               '                              OR (CFA.SIT_FINAN_ADIC = ''IM'' ))'+  coCRLF ;
            end;
            sSQL := sSQL + '                      ) CFA ' + coCRLF +
                           '               ) CFA, CR_CREDITO CR, CR_CONTRATO CCTO, CR_PRODUCTO CPR' + coCRLF +
            '        WHERE 1 = 1' + coCRLF;
          // No intervienen en este reporte pues sSituacion = 'IV'
         {If ((sSituacion = 'VE') or (sSituacion = 'IM'))  Then Begin
               If VLBFechaTras Then
                   sSQL:= sSQL + '   AND CR.F_TRASPASO_VENC IS NOT NULL '+  coCRLF
               Else
                   sSQL:= sSQL + '   AND CR.F_TRASPASO_VENC IS NULL '+  coCRLF ;
          End; }

          //If (Trim(sProducto)<>'') Then sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_CRE ='''+sProducto+''''+  coCRLF ;
          If (Trim(sMoneda)<>'') Then
              sSQL:= sSQL + '        AND CCTO.CVE_MONEDA ='+sMoneda +  coCRLF ;
          If (Trim(sPromAdmon)<>'') Then
              sSQL:= sSQL + '        AND CR.ID_PROM_ADM ='+ sPromAdmon +  coCRLF ;
          //If (Trim(sCesion)<>'') Then sSQL:= sSQL + '   AND  CR.ID_CREDITO ='+ sCesion  +  coCRLF ;
          //If ((Trim(VlSituacion)<>'') and (Trim(VlSituacion)<>'IM')) Then sSQL:= sSQL + '   AND CFA.SIT_FINAN_ADIC ='''+ VlSituacion+''''+  coCRLF ;
          If (Trim(sEmpresa)<>'') Then
              sSQL:= sSQL + '        AND CPR.ID_EMPRESA ='+ Trim(sEmpresa) +coCRLF ;
          //If (Trim(sGpoProd)<>'') Then sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd );

            sSQL := sSQL +
            '        AND CR.ID_CREDITO = CFA.ID_CREDITO' + coCRLF +
            '        AND CR.ID_CONTRATO = CCTO.ID_CONTRATO' + coCRLF +
            '        AND CR.FOL_CONTRATO = CCTO.FOL_CONTRATO' + coCRLF +
            '        AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE' + coCRLF + coCRLF;

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
            //'               0 IMP_BENEFICIO, '+ coCRLF +
            '               (CCC.IMP_COMISION  + CCC.IMP_IVA + CCC.MORATORIOS - CCC.IMP_PAGADO_HIST -CCC.IMP_IVA_PAG_HIST) IMP_TOTAL, '+ coCRLF +
            '               CCC.MORATORIOS'+  coCRLF +
            '        FROM ( SELECT CCC.*, '+ coCRLF +
            '                      PKGCRCOMUN.FUNOBTENIMPGTIA( 3, ''CN'', ''IMPBRU'', CCC.ID_CREDITO, CCC.NUM_PERIODO, CCC.CVE_COMISION, ' +
                                   SQLFecha( StrToDate( sF_Calculo ) ) + ', ''V'' ) IMP_CONCEPTO, ' + coCRLF +
            '                      CCCO.DESC_COMISION,'+ coCRLF +
            '                      NVL( PKGCRPERIODO.FUNOBTENMORA( 2 ,''V'' ,CCC.ID_CREDITO ,CCC.NUM_PERIODO , CCC.CVE_COMISION ,'+
                                 ' NULL,TO_DATE('#39+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Calculo))+#39',''DD/MM/YYYY'')' + VLTipoRep + ','+
                                 ' NULL), 0 ) AS MORATORIOS, '+ coCRLF +
            '                      NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''CN'', ''IMPBRU'', CCC.ID_CREDITO,  CCC.NUM_PERIODO, CCC.CVE_COMISION,' +
                                   SQLFecha(StrToDate(sF_Calculo )) + ', ''V'' ), 0 ) AS IMP_PAGADO_HIST, '+ coCRLF +
            '                      NVL( PKGCRCOMUN.STPOBTIMPPAGADO( ''CN'', ''IMPIVA'', CCC.ID_CREDITO,  CCC.NUM_PERIODO, CCC.CVE_COMISION,' +
                                   SQLFecha(StrToDate(sF_Calculo )) + ',''V'' ), 0 ) AS IMP_IVA_PAG_HIST '+ coCRLF +
            '               FROM ( SELECT * FROM CR_COMISION CCC ' + coCRLF +
            '                      WHERE 1 = 1'+ coCRLF ;
            If (Trim(sEmpresa)<>'') Then
                sSQL := sSQL + '                         AND PKGCRACTUALIZA.STPOBTEMPRESA(CCC.ID_CREDITO) = ' + Trim(sEmpresa) +coCRLF ;

            //If (Trim(sCesion)<>'') Then sSQL := sSQL + '                         AND CCC.ID_CREDITO = '+ sCesion  +  coCRLF;

            //If Trim(sF_Vencimiento)<>'' Then
                sSQL := sSQL + '                         AND CCC.F_VENCIMIENTO ' + VLComparador + SQLFecha( StrToDate(sF_Vencimiento) ) + coCRLF;
            //Else If Trim(sF_Programada)<>'' Then
            //   sSQL := sSQL + ' AND CCC.F_PROG_PAGO '   + VLComparador + SQLFecha( StrToDate(sF_Programada)  ) + coCRLF ;

            If (Trim(VlSituacion)='IM')Then
            begin
                sSQL := sSQL + '                         AND ((CCC.F_PROG_PAGO < CCC.F_PAGO  ' +  coCRLF +
                               '                                AND CCC.SIT_COMISION <> ''CA''' +  coCRLF +
                            // '                         AND CCC.F_PAGO > ' + SQLFecha( StrToDate( NvlStr( sF_Vencimiento, sF_Programada ) ) ) + ')' + coCRLF +
                               '                                AND CCC.F_PAGO > ' + SQLFecha( StrToDate( sF_Vencimiento ) ) + ')' + coCRLF +
                               '                                OR (CCC.SIT_COMISION = ''IM'' ))'+  coCRLF ;
            end;

            sSQL := sSQL + '                      ) CCC, CR_CAT_COMISION CCCO WHERE  CCCO.CVE_COMISION = CCC.CVE_COMISION  ' + coCRLF +
                           '               ) CCC, CR_CREDITO CR, CR_CONTRATO CCTO, CR_PRODUCTO CPR' + coCRLF +
            '        WHERE 1 = 1' + coCRLF;

          // No intervienen en este reporte pues sSituacion = 'IV'
          {
          If ((sSituacion = 'VE') or (sSituacion = 'IM'))  Then Begin
               If VLBFechaTras Then
                   sSQL:= sSQL + '   AND CR.F_TRASPASO_VENC IS NOT NULL '+  coCRLF
               Else
                   sSQL:= sSQL + '   AND CR.F_TRASPASO_VENC IS NULL '+  coCRLF ;
          End;
          }

          //If (Trim(sProducto)<>'') Then sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_CRE ='''+sProducto+''''+  coCRLF ;
          If (Trim(sMoneda)<>'') Then
              sSQL:= sSQL + '        AND CCTO.CVE_MONEDA ='+sMoneda +  coCRLF ;
          If (Trim(sPromAdmon)<>'') Then
              sSQL:= sSQL + '        AND CR.ID_PROM_ADM ='+ sPromAdmon +  coCRLF ;
          //If (Trim(sCesion)<>'') Then sSQL:= sSQL + '   AND  CR.ID_CREDITO ='+ sCesion  +  coCRLF ;
          //If ((Trim(VlSituacion)<>'') and (Trim(VlSituacion)<>'IM')) Then sSQL:= sSQL + '   AND CCC.SIT_COMISION ='''+ VlSituacion+''''+  coCRLF ;
          If (Trim(sEmpresa)<>'') Then
              sSQL:= sSQL + '        AND CPR.ID_EMPRESA ='+ Trim(sEmpresa) +coCRLF ;
          //If (Trim(sGpoProd)<>'') Then sSQL:= sSQL + '   AND CPR.CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd );

            sSQL := sSQL +
            '        AND CR.ID_CREDITO = CCC.ID_CREDITO     ' + coCRLF +
            '        AND CR.ID_CONTRATO = CCTO.ID_CONTRATO  ' + coCRLF +
            '        AND CR.FOL_CONTRATO = CCTO.FOL_CONTRATO' + coCRLF +
            '        AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE' + coCRLF;

            sSQL5 := sSQL;
            sSQL := '';

            //* * * * * * * * * * * * * * FIN DE UNION * * * * * * * * * * * * * *
            //
            sSQL:= sSQL + '      )            ACCE  '+ coCRLF ;
            sSQL:= sSQL + '                         '+ coCRLF +
            '      LEFT JOIN  CR_DOCUMENTO    CD    ON  CD.ID_CESION         = ACCE.ID_CREDITO         '+ coCRLF +
            '                                       AND CD.NUM_PERIODO_DOC   = ACCE.NUM_PERIODO        '+ coCRLF +
            '           JOIN  CR_CREDITO      CC    ON  CC.ID_CREDITO        = ACCE.ID_CREDITO         '+ coCRLF +
            '           JOIN  ( SELECT CCTO.*, CPRO.ID_EMPRESA FROM CR_PRODUCTO CPRO, CR_CONTRATO CCTO WHERE CPRO.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE ) '+ coCRLF +
            '                                 CCTO  ON  CCTO.ID_CONTRATO     = CC.ID_CONTRATO          '+ coCRLF +
            '                                       AND CCTO.FOL_CONTRATO    = CC.FOL_CONTRATO         '+ coCRLF +
            '           JOIN  ( SELECT * FROM CONTRATO WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CR_CREDITO) ) '+ coCRLF +
            '                                 CTO   ON  CTO.ID_CONTRATO      = CC.ID_CONTRATO          '+ coCRLF +
//********** ****JRG LatBC---
'      LEFT JOIN (SELECT  ID_ACREDITADO, F_ALTA_RECU,         '+ coCRLF +
'	                    (CASE  WHEN COUNT(ID_ACREDITADO) = 0 THEN ''  ''         '+ coCRLF +
'                               WHEN COUNT(ID_ACREDITADO) > 0 THEN ''SI''         '+ coCRLF +
'                               ELSE ''  ''         '+ coCRLF +
'                         END) AS STATUS_RECU         '+ coCRLF +
'                   FROM CR_ACRE_RE         '+ coCRLF +
'	  	          WHERE '+ SQLFecha(StrToDate(sF_Calculo))+' >= F_ALTA_RECU         '+ coCRLF +
'                    AND F_BAJA_RECU IS NULL         '+ coCRLF +
'               GROUP BY ID_ACREDITADO, F_ALTA_RECU         '+ coCRLF +
'                ) RECU ON RECU.ID_ACREDITADO = CTO.ID_TITULAR         '+ coCRLF +

//********** ****JRG LatBC---
            '        	JOIN  MONEDA          M     ON  M.CVE_MONEDA         = CTO.CVE_MONEDA          '+ coCRLF +
            '        	JOIN  PERSONA         PPR   ON  PPR.ID_PERSONA       = CC.ID_PROM_ADM          '+ coCRLF +
            '        	JOIN  PERSONA         PPRC  ON  PPRC.ID_PERSONA      = CTO.ID_PERS_ASOCIAD     '+ coCRLF +
            '        	JOIN  CR_PRODUCTO     CPR   ON  CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE   '+ coCRLF +
            '      LEFT JOIN ' + coCRLF +     {subdivision}
            '           (   SELECT SUB.CVE_SUB_DIVISION CVE_EMISOR_NAFIN, SUB.NOMBRE_SUB_DIV NOMBRE_EMISOR,     '+ coCRLF +
            '                   ID_ACREDITADO ID_EMISOR, PROCAM.ID_CREDITO  ID_CESION,                          '+ coCRLF +
            '                   0 ID_PROVEEDOR, ''F'' B_OPERADO_NAFIN, ''AP'' TIPO_ACRED, NULL CVE_FND_ENT_DES  '+ coCRLF +
            '               FROM CR_SUBDIV_PROCAM SUB, CR_PROCAMPO PROCAM                                       '+ coCRLF +
            '               WHERE PROCAM.CVE_SUB_DIVISION = SUB.CVE_SUB_DIVISION                       '+ coCRLF + coCRLF +
            '           UNION                                                                          '+ coCRLF + coCRLF +
            '               SELECT CS.CVE_EMISOR_NAFIN, CE.NOMBRE_EMISOR ID_EMISOR, CE.ID_ACREDITADO , CS.ID_CESION,'+ coCRLF +
            '                   CS.ID_PROVEEDOR, CS.B_OPERADO_NAFIN, ''AC'' TIPO_ACRED, CE.CVE_FND_ENT_DES          '+ coCRLF +
            '               FROM CR_EMISOR CE, CR_CESION CS                                            '+ coCRLF +
            '               WHERE CS.ID_EMISOR = CE.ID_ACREDITADO                                      '+ coCRLF +
            '               AND CS.CVE_FND_ENT_DES = CE.CVE_FND_ENT_DES                                '+ coCRLF +
            '               AND CS.CVE_EMISOR_NAFIN = CE.CVE_EMISOR_EXT                                '+ coCRLF +
            '           )                    SUBDIV ON  SUBDIV.ID_CESION     = CC.ID_CREDITO           '+ coCRLF +
            '      LEFT JOIN PERSONA          PP    ON  PP.ID_PERSONA        = SUBDIV.ID_PROVEEDOR     '+ coCRLF +
            '      LEFT JOIN CR_PROVEEDOR     CP    ON  CP.ID_ACREDITADO     = SUBDIV.ID_PROVEEDOR     '+ coCRLF +
            '                                       AND CP.CVE_FND_ENT_DES   = SUBDIV.CVE_FND_ENT_DES  '+ coCRLF +
            '      LEFT JOIN CR_CESION        CS    ON  CS.ID_CESION         = CC.ID_CREDITO           '+ coCRLF +
            '      LEFT JOIN PERSONA_FISICA   PTIT  ON  CTO.ID_TITULAR       = PTIT.ID_PERSONA         '+ coCRLF +
            '      LEFT JOIN PERSONA          PCE   ON  CTO.ID_TITULAR       = PCE.ID_PERSONA          '+ coCRLF +
            '      LEFT JOIN DOMICILIO        DOM   ON  CTO.ID_DOMICILIO     = DOM.ID_DOMICILIO        '+ coCRLF +
            '      LEFT JOIN POBLACION        POB   ON  DOM.CVE_PAIS         = POB.CVE_POBLAC_UBIC     '+ coCRLF +
            '                                       AND DOM.CVE_ESTADO       = POB.CVE_POBLACION       '+ coCRLF +
            '      LEFT JOIN CR_IMP_DIR_PROD  DPROD ON  CPR.CVE_PRODUCTO_CRE = DPROD.CVE_PRODUCTO_CRE  '+ coCRLF +
            '      LEFT JOIN CR_IMP_DIRECCION DIR   ON  DPROD.CVE_DIRECCION  = DIR.CVE_DIRECCION       '+ coCRLF +
            '      LEFT JOIN PERSONA          PDIR  ON  DIR.ID_DIRECTOR      = PDIR.ID_PERSONA         '+ coCRLF +
            '      LEFT JOIN CR_TIP_CRED_BC   CTC   ON  CTC.CVE_TIPO_CRED_BC = CPR.CVE_TIPO_CRED_BC ,  '+ coCRLF +
            '      ( SELECT ' + ' TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Vencimiento))+''',''DD/MM/YYYY'')' + ' AS F_REFERENCIA FROM DUAL) F_REF '+  coCRLF ;
            sSQL:= sSQL + '     '+ coCRLF +
            '      WHERE 1 = 1  '+ coCRLF ;


          If (Trim(sID_Direccion)<>'')  Then
              sSQL:= sSQL + '      AND DPROD.CVE_DIRECCION ='''+sID_Direccion+''''+  coCRLF ;

          If (Trim(sID_Region)<>'')     Then
              sSQL:= sSQL + '      AND DOM.CVE_ESTADO ='''+sID_Region+''''+  coCRLF ;

          If (Trim(sMoneda)<>'') Then
              sSQL:= sSQL + '      AND CTO.CVE_MONEDA ='+sMoneda +  coCRLF ;

          If (Trim(sPromAsoc)<>'') Then
              sSQL:= sSQL + '      AND CTO.ID_PERS_ASOCIAD ='+ sPromAsoc  +  coCRLF ;

          If (Trim(sPromAdmon)<>'') Then
              sSQL:= sSQL + '      AND CC.ID_PROM_ADM ='+ sPromAdmon +  coCRLF ;

          If (Trim(sEmpresa)<>'') Then
              sSQL:= sSQL + '      AND CPR.ID_EMPRESA ='+ Trim(sEmpresa) +coCRLF ;

          If (Trim(sProducto)<>'') Then
              sSQL:= sSQL + '      AND CPR.CVE_PRODUCTO_CRE ='+ SQLStr(Trim(sProducto)) +coCRLF ;

          If (Trim(sGpoProducto)<>'') Then
              sSQL:= sSQL + '      AND  CPR.CVE_PRODUCTO_GPO ='+ SQLStr(Trim(sGpoProducto)) +coCRLF ;

          If (Trim(sAcreditado)<>'') Then
              sSQL:= sSQL + '      AND CTO.ID_TITULAR ='+ sAcreditado  +  coCRLF ;

          If (Trim(sCredito)<>'') Then
              sSQL:= sSQL + '      AND CC.ID_CREDITO ='+ sCredito +  coCRLF ;

      //RLUMBRERAS LATBC 8/02/2011 (Se agrgegan variables para reporte de recuperados)
           if (Trim(sTipRecu)='0')     Then sSQL := sSQL + '   AND STATUS_RECU = '+ SQLStr(sStatus) + coCRLF;
           if (Trim(sTipRecu)='1')     Then sSQL := sSQL + '   AND NOT STATUS_RECU = '+ SQLStr(sStatus) + coCRLF;
    //-----------------------------------------------------------------------------




          sSQL6 := sSQL;


       // hegc MODIFICACION DE REPORTE DE IMPAGADOS AGRUPADO POR CREDITO Y FECHA DE VENCIMIENTO
       ssql:='';
       ssql := ssql+ ' GROUP BY                                                                     '+ coCRLF +
                     ' NVL(DIR.DESC_DIRECCION,''NO ASIGNADA'')  ,NVL(PDIR.NOMBRE,''NO ASIGNADO'') , '+ coCRLF +
                     ' DOM.CVE_ESTADO  , POB.DESC_POBLACION,                                        '+ coCRLF +
                     ' NVL(DIR.CVE_DIRECCION,''NOASIG'') , NVL(DIR.ID_DIRECTOR,0) , CTO.ID_TITULAR, '+ coCRLF +
                     ' F_REF.F_REFERENCIA '+ VLTipoRep +' - ACCE.F_VENCIMIENTO       ,              '+ coCRLF +
                     ' ACCE.ID_CREDITO, ACCE.F_VENCIMIENTO, acce.F_PROG_PAGO,                       '+ coCRLF +
                     ' CTO.CVE_MONEDA          ,       M.DESC_MONEDA                   ,            '+ coCRLF +
                     ' CC.ID_PROM_ADM          ,       PPR.NOMBRE     ,                             '+ coCRLF +
                     ' CTO.ID_PERS_ASOCIAD     ,       PPRC.NOMBRE ,                                '+ coCRLF +
                     ' CPR.CVE_PRODUCTO_CRE    ,       CPR.DESC_L_PRODUCTO             ,            '+ coCRLF +
                     ' CPR.CVE_TIPO_CRED_BC    ,       CTC.DESC_TIPO_CRED              ,            '+ coCRLF +
                     ' CC.ID_CREDITO           ,       CC.ID_CONTRATO                  ,            '+ coCRLF +
                     ' DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PTIT.APELLIDO_PATERNO||'' ''||PTIT.APELLIDO_MATERNO||'' ''||PTIT.NOMBRE_PERSONA) , '+ coCRLF +
                     ' SUBDIV.ID_EMISOR        ,       NVL(SUBDIV.CVE_EMISOR_NAFIN,0) ,             '+ coCRLF +
                     ' SUBDIV.ID_PROVEEDOR     ,       PP.NOMBRE     ,                              '+ coCRLF +
                     ' SUBDIV.NOMBRE_EMISOR    ,       PCE.CVE_TIPO_SECTOR             ,            '+ coCRLF +
                     ' CP.ID_PROV_EXTERNO ,                                                         '+ coCRLF +
                     ' CC.SDO_INSOLUTO         ,       CC.SDO_VIG_TOTAL                ,            '+ coCRLF +
                     ' CC.IMP_DISPUESTO        ,       CC.CVE_CALCULO                  ,            '+ coCRLF +
                     ' 0               ,       CTO.ID_TITULAR                  ,                    '+ coCRLF +
                     ' NVL(CD.IMP_NOMINAL,0)                                   ,                   '+ coCRLF +
                     ' NVL(RECU.STATUS_RECU,'+QuotedStr(' ')+'), '+ coCRLF +
                     ' RECU.F_ALTA_RECU ';

       // HEGC

    if sFRegion = '0' then
       sSQL:= sSQL +' ORDER BY NOM_DRCN, ESTADO, DESC_POBLACION,'+  coCRLF ;

    if sFRegion = '1' then
       sSQL:= sSQL +' ORDER BY NOM_DRCN, '+  coCRLF ;

    If Trim(sOrden)='C' Then        // Ordenar por nombre del Acreditado
        sSQL:= sSQL + ' NOMBRE, CC.ID_CREDITO, CTO.ID_PERS_ASOCIAD, CC.ID_PROM_ADM,  CTO.CVE_MONEDA, DESC_L_PRODUCTO '+  coCRLF     // quite la coma al final de estos ordenamientos porque ya no se va a usar el del orc_Acc y periodo
    else If Trim(sOrden)='P' Then   // Ordenar por Promotor Asociado
        sSQL:= sSQL + '  CTO.CVE_MONEDA , CTO.ID_PERS_ASOCIAD,   CC.ID_PROM_ADM , NOMBRE, DESC_L_PRODUCTO,   CC.ID_CREDITO '+  coCRLF
    else If Trim(sOrden)='A' Then   // Ordenar por Promotor Administrador
        sSQL:= sSQL + ' CC.ID_PROM_ADM     ,   CTO.ID_PERS_ASOCIAD, CTO.CVE_MONEDA, DESC_L_PRODUCTO,  NOMBRE , CC.ID_CREDITO '+  coCRLF
    else  //Trim(sOrden)='D'        // Ordenar por numero de Disposición
        sSQL:= sSQL + ' CC.ID_CREDITO, NOMBRE, CTO.ID_PERS_ASOCIAD, CC.ID_PROM_ADM,  CTO.CVE_MONEDA, DESC_L_PRODUCTO '+  coCRLF;

    // hegc quitar    este orrdenamniento
       //sSQL := sSQL + ' ORD_ACC, NUM_PERIODO ';

    sSQL7 := sSQL;


   // Para armar la sentencia SQL para la impresión del reporte
   Result:= sSQL1 + sSQL2 + sSQL3 + sSQL4 + sSQL5 + sSQL6+ sSQL7;  //

end;

procedure TQrConsImpa.QRGroupDireccionBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        VL_DIR_Binter  := 0;
        VL_DIR_FEGA    := 0;
        VL_DIR_Importe := 0;
end;

procedure TQrConsImpa.QRGroupRegionBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        VL_REG_Binter  := 0;
        VL_REG_FEGA    := 0;
        VL_REG_Importe := 0;
end;

procedure TQrConsImpa.QRGroupMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        VL_M_Binter  := 0;
        VL_M_FEGA    := 0;
        VL_M_Importe := 0;
end;

procedure TQrConsImpa.QRGroupPromAsocBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        VL_PAS_Binter  := 0;
        VL_PAS_FEGA    := 0;
        VL_PAS_Importe := 0;
end;

procedure TQrConsImpa.QRGroupPromAdmBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        VL_PAD_Binter  := 0;
        VL_PAD_FEGA    := 0;
        VL_PAD_Importe := 0;
end;

procedure TQrConsImpa.QRBandDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
   sFInicio, sFVenc, sFProgPago, sFPago: String;
   vlTipCambio : Double;
begin

   If qyConsImpaSTATUSRECU.AsString='SI' Then
   begin
      QRDBText11.Height:=11;
      QRDBText11.Width:=37;
      QRDBText12.Height:=11;
      QRDBText12.Width:=37;
   end
   else
   begin
      QRDBText11.Height:=0;
      QRDBText11.Width:=0;
      QRDBText12.Height:=0;
      QRDBText12.Width:=0;
   end;

    vlTipCambio:= 1;
    if qyConsImpaCVE_MONEDA.AsInteger = C_DLLS then
       vlTipCambio:= vgTipCambioDll;

    VL_DIR_Binter  := VL_DIR_Binter  + qyConsImpaIMP_BINTER.AsFloat  * (vlTipCambio);
    VL_DIR_FEGA    := VL_DIR_FEGA    + qyConsImpaIMP_FEGA.AsFloat    * (vlTipCambio);
    VL_DIR_Importe := VL_DIR_Importe + qyConsImpaIMP_CAPITAL.AsFloat     * (vlTipCambio);

    VL_REG_Binter  := VL_REG_Binter  + qyConsImpaIMP_BINTER.AsFloat  * (vlTipCambio);
    VL_REG_FEGA    := VL_REG_FEGA    + qyConsImpaIMP_FEGA.AsFloat    * (vlTipCambio);
    VL_REG_Importe := VL_REG_Importe + qyConsImpaIMP_CAPITAL.AsFloat     * (vlTipCambio);

    VL_PAS_Binter  := VL_PAS_Binter  + qyConsImpaIMP_BINTER.AsFloat  * (vlTipCambio);
    VL_PAS_FEGA    := VL_PAS_FEGA    + qyConsImpaIMP_FEGA.AsFloat    * (vlTipCambio);
    VL_PAS_Importe := VL_PAS_Importe + qyConsImpaIMP_CAPITAL.AsFloat     * (vlTipCambio);

    VL_PAD_Binter  := VL_PAD_Binter  + qyConsImpaIMP_BINTER.AsFloat  * (vlTipCambio);
    VL_PAD_FEGA    := VL_PAD_FEGA    + qyConsImpaIMP_FEGA.AsFloat    * (vlTipCambio);
    VL_PAD_Importe := VL_PAD_Importe + qyConsImpaIMP_CAPITAL.AsFloat     * (vlTipCambio);

    VL_M_Binter  := VL_M_Binter  + qyConsImpaIMP_BINTER.AsFloat  * (vlTipCambio);
    VL_M_FEGA    := VL_M_FEGA    + qyConsImpaIMP_FEGA.AsFloat    * (vlTipCambio);
    VL_M_Importe := VL_M_Importe + qyConsImpaIMP_CAPITAL.AsFloat     * (vlTipCambio);

    VLTotBinter  := VLTotBinter  + qyConsImpaIMP_BINTER.AsFloat  * (vlTipCambio);
    VLTotFEGA    := VLTotFEGA    + qyConsImpaIMP_FEGA.AsFloat    * (vlTipCambio);
    VLTotImporte := VLTotImporte + qyConsImpaIMP_CAPITAL.AsFloat     * (vlTipCambio);

// Adecuación  de  los campos del query

If sArchivo <>'' Then Begin
//      If qyConsImpa.FieldByName('F_INICIO').AsDateTime > 0 Then sFInicio:= FormatDateTime('dd/mm/yyyy', qyConsImpa.FieldByName('F_INICIO').AsDateTime);
//      If qyConsImpa.FieldByName('F_PROG_PAGO').AsDateTime > 0 Then sFProgPago:= FormatDateTime('dd/mm/yyyy', qyConsImpa.FieldByName('F_PROG_PAGO').AsDateTime);
//      If qyConsImpa.FieldByName('F_PAGO').AsDateTime > 0 Then sFPago:= FormatDateTime('dd/mm/yyyy', qyConsImpa.FieldByName('F_PAGO').AsDateTime);

      If qyConsImpa.FieldByName('F_VENCIMIENTO').AsDateTime > 0 Then
         sFVenc:= FormatDateTime('dd/mm/yyyy', qyConsImpa.FieldByName('F_VENCIMIENTO').AsDateTime);

         Writeln(F,
                  qyConsImpa.FieldByName('NOM_DRCN').AsString + #09 +
                  qyConsImpa.FieldByName('NOM_DRTR').AsString + #09 +
                  qyConsImpa.FieldByName('ESTADO').AsString + #09 +
                  qyConsImpa.FieldByName('DESC_POBLACION').AsString + #09 +
                  qyConsImpa.FieldByName('ID_PERS_ASOCIAD').AsString + #09 +
                  qyConsImpa.FieldByName('NOM_PROMOTOR_ASO').AsString + #09 +
                  qyConsImpa.FieldByName('ID_PROM_ADM').AsString + #09 +
                  qyConsImpa.FieldByName('NOM_PROMOTOR_ADM').AsString + #09 +
                  qyConsImpa.FieldByName('CVE_MONEDA').AsString + #09 +
                  qyConsImpa.FieldByName('DESC_MONEDA').AsString+ #09 +
                  qyConsImpa.FieldByName('NOMBRE').AsString + #09 +
                  qyConsImpa.FieldByName('ID_PROVEEDOR').AsString + #09 +
                  qyConsImpa.FieldByName('NOM_PROVEEDOR').AsString + #09 +
                  qyConsImpa.FieldByName('CVE_PRODUCTO_CRE').AsString + #09 +
                  qyConsImpa.FieldByName('ID_CREDITO').AsString + #09 +
                  FormatFloat('###,###,###,###,###,##0.00',qyConsImpa.FieldByName('IMP_CREDITO').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsImpa.FieldByName('SDO_VIG_TOTAL').AsFloat) + #09+
                  FormatDateTime('DD/MM/YYYY',qyConsImpa.FieldByName('F_VENCIMIENTO').AsDateTime) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsImpa.FieldByName('IMP_CAPITAL').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsImpa.FieldByName('IMP_FA').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsImpa.FieldByName('IMP_INTERES').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsImpa.FieldByName('IMP_COMISIONES').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsImpa.FieldByName('IMP_IVA').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsImpa.FieldByName('MORATORIOS').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsImpa.FieldByName('IMP_FEGA').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsImpa.FieldByName('IMP_BINTER').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsImpa.FieldByName('IMP_CAPITAL').AsFloat +
                                                           qyConsImpa.FieldByName('IMP_FA').AsFloat +
                                                           qyConsImpa.FieldByName('IMP_INTERES').AsFloat +
                                                           qyConsImpa.FieldByName('IMP_COMISIONES').AsFloat +
                                                           qyConsImpa.FieldByName('IMP_IVA').AsFloat +
                                                           qyConsImpa.FieldByName('MORATORIOS').AsFloat) + #09+
                  qyConsImpa.FieldByName('DIASIMVE').AsString  + #09 +
               //RLUMBRERAS LATBC 8/02/2011 (Se agrgegan variables para reporte de recuperados)
                  qyConsImpa.FieldByName('STATUS_RECU').AsString);
               //´----------------------------------------------------------------------------
                  


   End;
end;

procedure TQrConsImpa.QRFooterContBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If qyConsImpa.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

end.
