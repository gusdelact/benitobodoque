Unit IntMQrCtrlColoca;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport, U_InterCustomStar,
  U_InterDigDoc, uRedigitalizacion;
Type
  TQrCtrlColoca = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qyColoca: TQuery;
    QRLabel9: TQRLabel;
    QRSHPTCliente: TQRShape;
    QRLabel17: TQRLabel;
    QRSHPTMonto: TQRShape;
    QRLabel18: TQRLabel;
    QRSHPTSaldoIsoluto: TQRShape;
    QRLabel20: TQRLabel;
    QRBand1: TQRBand;
    QRFooterMoneda: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRFooterOrigen: TQRBand;
    QRFooterProducto: TQRBand;
    QRFooterPromotor: TQRBand;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    qrlTOTAL: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    qyColocaID_CREDITO: TFloatField;
    qyColocaCHEQUERA: TFloatField;
    qyColocaSALDO_AL: TFloatField;
    qyColocaIMP_CRED: TFloatField;
    qyColocaSDO_INSOL: TFloatField;
    qyColocaPLAZO: TFloatField;
    qyColocaSITUACION: TStringField;
    qyColocaORIGEN: TStringField;
    qyColocaB_OPERADO_NAFIN: TStringField;
    qyColocaF_INICIO: TDateTimeField;
    qyColocaF_VENCIMIENTO: TDateTimeField;
    qyColocaTITULAR: TStringField;
    qyColocaID_PROM_ADM: TFloatField;
    qyColocaNOM_PROMOTOR_ADM: TStringField;
    qyColocaID_PERS_ASOCIAD: TFloatField;
    qyColocaNOM_PROMOTOR_ASO: TStringField;
    qyColocaDESC_MONEDA: TStringField;
    qyColocaCVE_PRODUCTO_CRE: TStringField;
    qyColocaDESC_L_PRODUCTO: TStringField;
    qyColocaCVE_MONEDA: TFloatField;
    QRSHPTImpDispuesto: TQRShape;
    QrlSaldo: TQRLabel;
    QRDBText10: TQRDBText;
    qyColocaIMP_DISPUESTO: TFloatField;
    QRExpr4: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel3: TQRLabel;
    QRExpr8: TQRExpr;
    QRLabel4: TQRLabel;
    QRExpr9: TQRExpr;
    QRLabel5: TQRLabel;
    QRExpr10: TQRExpr;
    QRFechaFooter: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr11: TQRExpr;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr19: TQRExpr;
    qyColocaTASA: TStringField;
    qyColocaDESC_CAT_MINIMO: TStringField;
    qyColocaCVE_CLAS_CONTAB: TStringField;
    QRSHPTChequera: TQRShape;
    QRLabel13: TQRLabel;
    qyColocaID_CONTRATO: TFloatField;
    QRBFootSector: TQRBand;
    QRSHPTotalSector: TQRShape;
    QRLabel49: TQRLabel;
    QRExpr52: TQRExpr;
    QRLabel50: TQRLabel;
    QRDBText39: TQRDBText;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    qyColocaCVE_TIPO_SECTOR: TStringField;
    QRFooterPromAsoc: TQRBand;
    QRLabel23: TQRLabel;
    QRExpr24: TQRExpr;
    QRLabel25: TQRLabel;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRSHPLine: TQRShape;
    QRFootContador: TQRBand;
    QRLabel26: TQRLabel;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRSHPTProveedor: TQRShape;
    QRLabel33: TQRLabel;
    QRDBText24: TQRDBText;
    qyColocaPROVEEDOR: TStringField;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qrgrpFooterEmisor: TQRBand;
    QRLabel28: TQRLabel;
    QRExpr32: TQRExpr;
    QRLabel34: TQRLabel;
    QRExpr33: TQRExpr;
    QRExpr34: TQRExpr;
    QRExpr35: TQRExpr;
    qrgrpFooterProveedor: TQRBand;
    qrgrpHeaderProveedor: TQRGroup;
    QRLabel36: TQRLabel;
    QRExpr36: TQRExpr;
    QRLabel37: TQRLabel;
    QRExpr37: TQRExpr;
    QRExpr38: TQRExpr;
    QRExpr39: TQRExpr;
    QRGroupContador: TQRGroup;
    qrgrpHeaderEmisor: TQRGroup;
    QRGroupPromAsoc: TQRGroup;
    QRGroupPromAdmin: TQRGroup;
    QRGroupFecha: TQRGroup;
    QRGroupMoneda: TQRGroup;
    QRGroupSector: TQRGroup;
    QROrigen: TQRGroup;
    QRGroupProducto: TQRGroup;
    QRLabel22: TQRLabel;
    QRShape1: TQRShape;
    qyColocaF_LIQUIDACION: TDateTimeField;
    QRLMsgErr: TQRLabel;
    QRLMsgErr1: TQRLabel;
    QRSHPTitular: TQRShape;
    QRDBText25: TQRDBText;
    QRLabel27: TQRLabel;
    QRSHPProveedor: TQRShape;
    QRDBText26: TQRDBText;
    QRLabel35: TQRLabel;
    QRSHPPromAsoc: TQRShape;
    QRDBText16: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel15: TQRLabel;
    QRSHPPromAdm: TQRShape;
    dbNombre_Promotor: TQRDBText;
    dbNom_Promotor: TQRDBText;
    qrlPromotor: TQRLabel;
    QRSHPFecha: TQRShape;
    QRDBText11: TQRDBText;
    QRFecha: TQRLabel;
    QRSHPOrigen: TQRShape;
    QRDBText6: TQRDBText;
    QRSHPProducto: TQRShape;
    QRLabel2: TQRLabel;
    dbProducto: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel29: TQRLabel;
    QRExpr40: TQRExpr;
    QRExpr42: TQRExpr;
    QRLabel41: TQRLabel;
    SummaryBand1: TQRBand;
    qyColocaIMP_CRED_VAL: TFloatField;
    qyColocaSDO_INSOL_VAL: TFloatField;
    qyColocaIMP_DISPUESTO_VAL: TFloatField;
    QRLabel42: TQRLabel;
    QRTCMAT: TQRLabel;
    QRLabel43: TQRLabel;
    QRTCMASec: TQRLabel;
    qyColocaSOTASA: TFloatField;
    QRSHPSector: TQRShape;
    QRLabel52: TQRLabel;
    QRDBText38: TQRDBText;
    QRSHPMoneda: TQRShape;
    QRLabel46: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel38: TQRLabel;
    QRTCMA: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    qyColocaCUENTA_VIGENTE_K: TStringField;
    qyColocaCUENTA_VIGENTE_INT: TStringField;
    qyColocaTIPO_DISPOSICION: TStringField;
    InterDigDoc1: TInterDigDoc;
    qyColocaF_FIN: TDateTimeField;
    qyColocaIMP_CONTRATO: TFloatField;
    qyColocaId_Emisor: TFloatField;
    qyColocaId_Proveedor: TFloatField;
    qyColocaId_Cliente: TFloatField;
    qyColocaF_ALTA_CTO: TStringField;
    qyColocaF_VENC_CTO: TStringField;
    qyColocaF_AUT_CTO: TStringField;
    qyColocaF_AUT_DISP: TStringField;
    qyColocaCVE_COMITE_AUT: TStringField;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    qyColocaCON: TFloatField;
    qyColocaNUM: TFloatField;
    qyColocaTPOC: TFloatField;
    QRDBText5: TQRDBText;
    qyColocaTpoChq: TStringField;
    qyColocaCHEQ_COBR: TStringField;


    Procedure qyColocaCalcFields(DataSet: TDataSet);
    Procedure QRFootContadorBeforePrint(SEnder: TQRCustomBand;
      Var PrintBand: Boolean);
    Procedure QRBand1BeforePrint(SEnder: TQRCustomBand;
      Var PrintBand: Boolean);
    Procedure QuickRepBeforePrint(SEnder: TCustomQuickRep;
      Var PrintReport: Boolean);
    procedure QRGroupSectorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterProductoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterOrigenBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBFootSectorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFechaFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterPromotorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterPromAsocBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpFooterProveedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpFooterEmisorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  Private
  Public
    vgImpDispuesto : Double;
    vgSdoInsoluto  : Double;
    vgSumIntInLq   : Double;
    vgFechaMesAnt  : TDate;
    vgTCambioMesAnt: Double;
    Function FormaQuery(sFInicio,sFFin,sProducto,sMoneda,
                        sAcreditado,sPromAsoc,sPromAdmon,
                        sCesion,sSituacion,sGpoProd, sProcam, sOperDD,sTipoDisp,
                        sEmpresa, sSucursal,
                        sMedio:String;      // <ICASE JMML 28/Septiembre/2006>   Nuevo parámetro
                        sPromotorAso,sPromotorAdm,bIncTipoSec, bEmisorProv:Boolean):String;
    Function ObtTotIntInLq(sSit,sFIni,sFFin : String;pAPli: TInterApli) :Double;
  End;
Var
  QrCtrlColoca: TQrCtrlColoca;
  bGenArch: Boolean;
  Apli : TInterApli;
  sCampoF, sArchivo:String;
  F: TextFile;

Procedure RepColocaciones(  sF_Inicio, sF_Fin,sProducto, sMoneda,
                            sAcreditado, sPromAsoc, sPromAdmon,
                            sCesion, sSituacion, sGpoProd, sProcam:String;
                            sPromotorAso, sPromotorAdm, bIncTipoSec, bEmisorProv:Boolean;
                            sNbrArch, sOperDD, sTipoDisp, sEmpresa, sSucursal,
                            sMedio: String;     // <ICASE JMML 28/Septiembre/2006>   Nuevo parámetro
                            pAPli     : TInterApli;
                            pPreview  : Boolean;
                            //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
                            grOpcion  : TGenRepOption;
                            //</LOLS>
                            //
                            //<LOLS 17FEB2006. DIGITALIZACION DE REPORTES>
                            sArchivoDig : String
                            //</LOLS>
                            );
Implementation
{$R *.DFM}

Procedure RepColocaciones(  sF_Inicio, sF_Fin, sProducto, sMoneda,
                            sAcreditado, sPromAsoc, sPromAdmon,
                            sCesion, sSituacion, sGpoProd, sProcam :String;
                            sPromotorAso, sPromotorAdm, bIncTipoSec, bEmisorProv:Boolean;
                            sNbrArch, sOperDD,sTipoDisp, sEmpresa, sSucursal,
                            sMedio: String;     // <ICASE JMML 28/Septiembre/2006>   Nuevo parámetro
                            pAPli     : TInterApli;
                            pPreview  : Boolean;
                            //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
                            grOpcion  : TGenRepOption;
                            //</LOLS>
                            //
                            //<LOLS 17FEB2006. DIGITALIZACION DE REPORTES>
                            sArchivoDig : String
                            //</LOLS>
                            );
Var
   QrCtrlColoca: TQrCtrlColoca;
   Preview     : TIntQRPreview;
   sTitulo1, sTitulo2:String;
   VLTipoDisp    : String;
   //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
   sDigDocFileName : String;
   //</LOLS>

   // RUCJ4248: Variable para la validación de la digitalización;
   bDigitalizaCorrecta : Boolean;
Begin
   QrCtrlColoca:=TQrCtrlColoca.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrCtrlColoca);
   Try

      bGenArch:= False;
      Apli := pApli;
      sArchivo:= sNbrArch;
      QrCtrlColoca.QRInterEncabezado1.Apli:=pApli;
      QrCtrlColoca.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrCtrlColoca.QRInterEncabezado1.NomReporte:='IntMQrCtrlColoca';
      //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
      sDigDocFileName := 'CTRLCOLOCACION';
      //</LOLS>

      If Trim(sF_Inicio)<>'' Then Begin
         If sSituacion <> SQLStr('LQ') Then Begin
            QrCtrlColoca.QRInterEncabezado1.Height:= 104;
            QrCtrlColoca.QRInterEncabezado1.Titulo1:='Reporte de Control de Colocaciones';
            QrCtrlColoca.QRGroupFecha.Expression := 'qyColoca.F_INICIO';
            QrCtrlColoca.QRDBText11.DataField := 'F_INICIO';
            sTitulo1:= 'Reporte de Control de Colocaciones';
            sCampoF:= 'F_INICIO';
            //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
            sDigDocFileName := 'COLOCACION';
            //</LOLS>
         End Else Begin
            QrCtrlColoca.QRInterEncabezado1.Titulo1:='Reporte de Liquidaciones';
            QrCtrlColoca.QRGroupFecha.Expression := 'qyColoca.F_FIN';
            QrCtrlColoca.QRDBText11.DataField := 'F_FIN';
            sTitulo1:= 'Reporte de Liquidaciones';
            sCampoF:= 'F_FIN';
            //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
            sDigDocFileName := 'LIQUIDACION';
            //</LOLS>
         End;
      End;

      QrCtrlColoca.QRInterEncabezado1.Titulo2:='Periodo del '+  sF_Inicio + ' al ' + sF_Fin;
      sTitulo2:= 'Periodo del '+  sF_Inicio + ' al ' + sF_Fin;

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

      //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
      sDigDocFileName := sDigDocFileName  + '_' + FormatDateTime( 'DD_MM_YYYY', StrToDate(sF_Inicio))
                         + '_' + FormatDateTime( 'DD_MM_YYYY', StrToDate(sF_Fin))   + '_' +
                         sProducto  + '_' + sMoneda    + '_' +  sAcreditado   + '_' +
                         sPromAsoc  + '_' + sPromAdmon + '_' + sCesion  + '_' +
                         sSituacion + '_' + sGpoProd   + '_' + sProcam  + '_' +
                         BoolToStr(sPromotorAso) + '_' + BoolToStr(sPromotorAdm) + '_' +
                         BoolToStr(bIncTipoSec ) + '_' + BoolToStr(bEmisorProv ) + '_' +
                         sOperDD    + '_' + sTipoDisp  + '_' + sEmpresa + '_' + sSucursal;
      //</LOLS>

      QrCtrlColoca.QRInterEncabezado1.Titulo2 := QrCtrlColoca.QRInterEncabezado1.Titulo2 + VLTipoDisp;
      sTitulo2 := sTitulo2 + VLTipoDisp;

      QrCtrlColoca.qrlSaldo.Caption:='Saldo al '+ FormatDateTime('dd/mm/yyyy',pAPli.DameFechaEmpresa);
      QrCtrlColoca.qyColoca.DatabaseName := pApli.DataBaseName;
      QrCtrlColoca.qyColoca.SessionName := pApli.SessionName;



      QrCtrlColoca.vgFechaMesAnt := ObtFechaMesAnt( C_FMAN, pApli );
      QrCtrlColoca.vgTCambioMesAnt := ObtTipoCambio( QrCtrlColoca.vgFechaMesAnt,
                                                   IntToStr ( C_DLLS ) ,
                                                   pAPli.DataBaseName, pAPli.SessionName);

      If Not(sPromotorAso) Then Begin
         QrCtrlColoca.QRGroupPromAsoc.Enabled:=False;
         QrCtrlColoca.QRGroupPromAsoc.Expression:='';
         QrCtrlColoca.QRFooterPromAsoc.Enabled:=False;
      End;

      If Not(sPromotorAdm) Then Begin
         QrCtrlColoca.QRGroupPromAdmin.Enabled:=False;
         QrCtrlColoca.QRGroupPromAdmin.Expression:='';
         QrCtrlColoca.QRFooterPromotor.Enabled:=False;
      End;

      If (sOperDD = 'F') or (sProcam <> '') then Begin
         QrCtrlColoca.QROrigen.Enabled := False;
         QrCtrlColoca.QROrigen.Expression := '';
         QrCtrlColoca.QROrigen.Enabled := False;
      End;

      If Not(bIncTipoSec) then Begin
         QrCtrlColoca.QRGroupSector.Enabled := False;
         QrCtrlColoca.QRGroupSector.Expression := '';
         QrCtrlColoca.QRBFootSector.Enabled := False;
      End;

      If (bEmisorProv) then Begin
         QrCtrlColoca.QRGroupMoneda.Enabled := False;
         QrCtrlColoca.QRGroupMoneda.Expression := '';
         QrCtrlColoca.QRFooterMoneda.Enabled := False;

         QrCtrlColoca.QROrigen.Enabled := False;
         QrCtrlColoca.QROrigen.Expression := '';
         QrCtrlColoca.QRFooterOrigen.Enabled := False;

         QrCtrlColoca.QRGroupProducto.Enabled := False;
         QrCtrlColoca.QRGroupProducto.Expression := '';
         QrCtrlColoca.QRFooterProducto.Enabled := False;
      End Else Begin
         QrCtrlColoca.qrgrpHeaderEmisor.Enabled := False;
         QrCtrlColoca.qrgrpHeaderEmisor.Expression := '';
         QrCtrlColoca.qrgrpFooterEmisor.Enabled := False;

         QrCtrlColoca.qrgrpHeaderProveedor.Enabled := False;
         QrCtrlColoca.qrgrpHeaderProveedor.Expression := '';
         QrCtrlColoca.qrgrpFooterProveedor.Enabled := False;
      End;

      QrCtrlColoca.qyColoca.Active:=False;
      QrCtrlColoca.qyColoca.SQL.Text:= QrCtrlColoca.FormaQuery(sF_Inicio,sF_Fin,sProducto,sMoneda,
                                      sAcreditado,sPromAsoc,sPromAdmon,sCesion,sSituacion,sGpoProd,sProcam, sOperDD,sTipoDisp,
                                      sEmpresa, sSucursal, sMedio,        // <ICASE JMML 28/Septiembre/2006>   Nuevo parámetro
                                      sPromotorAso,sPromotorAdm,bIncTipoSec, bEmisorProv);
      QrCtrlColoca.qyColoca.SQL.SaveToFile('C:\CtrlColoca.sql');
      QrCtrlColoca.qyColoca.Active:=True;

      QrCtrlColoca.vgSdoInsoluto  := 0;
      QrCtrlColoca.vgImpDispuesto := 0;
      QrCtrlColoca.vgSumIntInLq   := QrCtrlColoca.ObtTotIntInLq(sSituacion, sF_Inicio, sF_Fin, pAPli);

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, sTitulo1+ #09 );
         Writeln(F, sTitulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F,
             'Fecha' + #09 +
             'Moneda' + #09+'Descripción Moneda'+#09+
             'Con'+ #09+
             'Num. Crédito' +  #09+
             'Cliente' +  #09 +
             'Proveedor' +#09 +
             'Monto Dispuesto' + #09 +
             'Chequera de Abono'+ #09 +
             'Saldo al '+ FormatDateTime('dd/mm/yyyy',Apli.DameFechaEmpresaDia('D000'))+  #09 +
             'Chequera de Cobranza');      // <<< CAMPOS EN REPORTE DE EXCEL FJR 06/01/2012

      End;

      //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
      If grOpcion = grPreview Then
         QrCtrlColoca.Preview
      Else if grOpcion = grPrint Then
         QrCtrlColoca.Print
      Else if grOpcion = grDigitaliza Then
      Begin
            QrCtrlColoca.InterDigDoc1.RootDir  := obtValorGpoCve( 'CONFRH', 'ROOTDIR',   pApli );
            QrCtrlColoca.InterDigDoc1.HostName := obtValorGpoCve( 'CONFRH', 'FTPSERVER', pApli );
            QrCtrlColoca.InterDigDoc1.UserName := obtValorGpoCve( 'CONFRH', 'USERNAME',  pApli );
            QrCtrlColoca.InterDigDoc1.Password := HexToStr( obtValorGpoCve( 'CONFRH', 'PASSWORD',  pApli ) );
            QrCtrlColoca.InterDigDoc1.SendTo   := ObtSendTo( sF_Inicio );
            QrCtrlColoca.InterDigDoc1.FileName := sArchivoDig; // sDigDocFileName; //<LOLS 17FEB2006. DIGITALIZACION DE REPORTES>
            QrCtrlColoca.PrinterSettings.PrinterIndex := QrCtrlColoca.InterDigDoc1.SetPrinter;
            QrCtrlColoca.Print;
//            RUCJ4248 : validar que la digitalización se genere de forma correcta
            bDigitalizaCorrecta := (QrCtrlColoca.InterDigDoc1.Compress and QrCtrlColoca.InterDigDoc1.SendFile);

//            QrCtrlColoca.InterDigDoc1.Compress;
//            QrCtrlColoca.InterDigDoc1.SendFile;
            QrCtrlColoca.PrinterSettings.PrinterIndex := QrCtrlColoca.InterDigDoc1.RestorePrinter;
      End;
      //If pPreview Then
      //   QrCtrlColoca.Preview
      //Else
      //   QrCtrlColoca.Print;
      //</LOLS>
   Finally
//    ----------------------------------------------
//    RUCJ4248 03/12/2009: Rastreo de digitalización
      if trim(sArchivoDig) <> '' then
      begin
      TRecolectaDatos.Recoleccion(FormatDateTime( 'dd/mm/yyyy', StrToDate(sF_Inicio)),
         TRecolectaDatos.delString(sArchivoDig), 'CONFRH', pAPli.NomAplicacion,
         TRecolectaDatos.BooleanToByte(bDigitalizaCorrecta),pAPli);
      end;

      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrCtrlColoca.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrCtrlColoca.FormaQuery(sFInicio,sFFin,sProducto,sMoneda,
                              sAcreditado,sPromAsoc,sPromAdmon,
                              sCesion,sSituacion,sGpoProd, sProcam,
                              sOperDD,sTipoDisp,sEmpresa, sSucursal,
                              sMedio:String;        // <ICASE JMML 28/Septiembre/2006>   Nuevo parámetro
                              sPromotorAso,sPromotorAdm,bIncTipoSec,
                              bEmisorProv:Boolean):String;
Var
    sSQL:String;
Begin
    sSQL:=  'SELECT '+
            // FJR
            '       ROWNUM AS CON, -- AGREGAR CONSECUTIVO '+ coCRLF +
            '  TODO.* '+ coCRLF +
            ' FROM ( '+ coCRLF +
            '       SELECT  '  + coCRLF +
            // FJR
            '       CR_CONTRATO.IMP_AUTORIZADO AS IMP_CONTRATO,'+  // >>> CAMPOS EN REPORTE DE EXCEL JFOF 03/08/2011
            '       To_Char(CR_CONTRATO.F_ALTA,''dd/mm/yyyy'') AS F_ALTA_CTO,'+
            '       To_Char(CR_CONTRATO.F_VENCIMIENTO,''dd/mm/yyyy'') AS F_VENC_CTO,'+
            '       To_Char(CR_CONTRATO.F_AUT_COMITE,''dd/mm/yyyy'') AS F_AUT_CTO,'+
            '       To_Char(CR_CREDITO.F_AUTORIZA,''dd/mm/yyyy'') AS F_AUT_DISP,'+
            '       CR_CESION.ID_EMISOR,'+
            '       CR_CESION.ID_PROVEEDOR,'+
            '       CONTRATO.ID_TITULAR AS ID_CLIENTE,'+
            '       '''' || to_char(CVE_COMITE_AUT) as CVE_COMITE_AUT,'+ // <<<CAMPOS EN REPORTE DE EXCEL JFOF 03/08/2011
            '       CR_CREDITO.ID_CREDITO,'+
            '       CR_TRANSACCION.ID_CTO_LIQ CHEQUERA,'+
            '	    NVL(PKGCORPO.OBTTIPOCAMBIO (PKGCRCOMUN.STPOBTENFECHA(2,''FMAN'') ,CONTRATO.CVE_MONEDA,''V'' ), 1 ) AS TPOC,' +
            '       (PKGDPVISTASERV.SPTObtSaldo(CR_TRANSACCION.ID_CTO_LIQ,''D000'') * NVL(PKGCORPO.OBTTIPOCAMBIO (PKGCRCOMUN.STPOBTENFECHA(2,''FMAN'') ,CONTRATO.CVE_MONEDA,''V'' ), 1 ) ) SALDO_AL,'+
            '       CR_CONTRATO.ID_CONTRATO,  DECODE(PTF.CVE_PER_JURIDICA,''PM'', PTF.NOMBRE,'+
            '       PTIT.APELLIDO_PATERNO||'' ''||PTIT.APELLIDO_MATERNO||'' ''||PTIT.NOMBRE_PERSONA) TITULAR,'+
            '       DECODE(PP.CVE_PER_JURIDICA,''PM'',PP.NOMBRE,'+
            '       PFP.APELLIDO_PATERNO||'' ''||PFP.APELLIDO_MATERNO||'' ''||PFP.NOMBRE_PERSONA) PROVEEDOR,'+
            '       PTF.CVE_TIPO_SECTOR,  CR_EMISOR.NOMBRE_EMISOR ,  ' +
            '       CR_TRANSACCION.IMP_NETO IMP_CRED,'+
            '       CR_CREDITO.SDO_INSOLUTO SDO_INSOL,'+
            '       CR_CREDITO.IMP_DISPUESTO,'+
            '       (CR_TRANSACCION.IMP_NETO * NVL(PKGCORPO.OBTTIPOCAMBIO (PKGCRCOMUN.STPOBTENFECHA(2,''FMAN'') ,CONTRATO.CVE_MONEDA,''V'' ), 1 ))  IMP_CRED_VAL,'+
            '       (CR_CREDITO.SDO_INSOLUTO * NVL(PKGCORPO.OBTTIPOCAMBIO (PKGCRCOMUN.STPOBTENFECHA(2,''FMAN'') ,CONTRATO.CVE_MONEDA,''V'' ), 1 )) SDO_INSOL_VAL,'+
            '       (CR_CREDITO.IMP_DISPUESTO * NVL(PKGCORPO.OBTTIPOCAMBIO (PKGCRCOMUN.STPOBTENFECHA(2,''FMAN'') ,CONTRATO.CVE_MONEDA,''V'' ), 1 )) IMP_DISPUESTO_VAL,'+
{ROIM 07122005 SE CAMBIA LA COLUMNA DE FECHA DE INICIO DEL DATO DE FECHA DE AUTORIZACIÓN A FECHA DE INICIO}
//            '       TRUNC(CR_CREDITO.F_AUTORIZA) F_INICIO, CR_CREDITO.F_LIQUIDACION,'+
            '       TRUNC(CR_CREDITO.F_INICIO) F_INICIO, CR_CREDITO.F_LIQUIDACION,'+
{/ROIM}
            '       TRUNC(CR_CREDITO.F_LIQUIDACION) F_FIN,'+
            '       NVL(PKGCRPERIODO.ObtPlazoMax(CR_CREDITO.ID_CREDITO),0) PLAZO,'+
            '       CR_CREDITO.F_VENCIMIENTO,'+
            '       (CR_CREDITO.CVE_TASA_REFER||DECODE(CR_CREDITO.CVE_TASA_REFER,''FIJA'',''(''||CR_CREDITO.TASA_BASE||'')'','' '')||CR_CREDITO.OPERADOR_STASA||''(''||CR_CREDITO.SOBRETASA||'')'') TASA,'+
            '       CR_CREDITO.TASA_CREDITO SOTASA,'+
            '       SIT_CREDITO SITUACION, CR_CREDITO.ID_PROM_ADM ,  PPR.NOMBRE NOM_PROMOTOR_ADM,'+
            '       CONTRATO.ID_PERS_ASOCIAD, PPRC.NOMBRE NOM_PROMOTOR_ASO, CONTRATO.CVE_MONEDA,'+
            '       MONEDA.DESC_MONEDA, CR_PRODUCTO.CVE_PRODUCTO_CRE,  CR_PRODUCTO.DESC_L_PRODUCTO,'+
            '       CR_PRODUCTO.CVE_CLAS_CONTAB,  CR_CAT_MINIMO.DESC_CAT_MINIMO,'+
            '       NVL(CR_CESION.B_OPERADO_NAFIN,''F'')B_OPERADO_NAFIN, '+
            '       CR_PRODUCTO.CVE_PRODUCTO_GPO, ' + coCRLF +
//            '       TABCTA.CUENTA_VIGENTE_INT, ' + coCRLF +
//            '       TABCTA.CUENTA_VIGENTE_K,' + coCRLF +
            '       NVL(TABCTA.CUENTA_VIGENTE_K,TABCTAICRE.CVE_CTA_CONT_CAREVI) AS CUENTA_VIGENTE_K     ,'+
            '       NVL(TABCTA.CUENTA_VIGENTE_INT,TABCTAICRE.CVE_CTA_CONT_INREVI) AS CUENTA_VIGENTE_INT,'+ coCRLF +
            '       CR_CREDITO.TIPO_DISPOSICION, '+ coCRLF +
            ' -- FJR  ' + coCRLF +
            '       CAST(NVL(PKGCRPERIODO.STPObtChqCte(NULL,NULL, CR_CREDITO.ID_CREDITO, ''AC'', ''AD'', ''CR''), ''S/C'' ) AS VARCHAR2(20) )AS CHEQ_COBR,   -- AGREGAR CHEQUERA DE COBRO '+ coCRLF +
            '	    /*CAST(COUNT (*) OVER ( PARTITION BY NVL(PKGCRPERIODO.STPObtChqCte(NULL,NULL, CR_CREDITO.ID_CREDITO, ''AC'', ''AD'', ''CR''), ''S/C'' ), CR_CREDITO.F_INICIO, DESC_MONEDA  '+ coCRLF +
	    '                                  ORDER BY NVL(PKGCRPERIODO.STPObtChqCte(NULL,NULL, CR_CREDITO.ID_CREDITO, ''AC'', ''AD'', ''CR''), ''S/C'' )  ) AS INTEGER)*/ 1  AS NUM, '+ coCRLF +
            '       CAST (NVL(PKGCRCREDITO.STPObtChqTip(NULL,NULL, CR_CREDITO.ID_CREDITO, ''AC'', ''AD'', ''CR''), ''S/C'' ) AS VARCHAR2(2) )  AS TpoChq   -- AGREGAR CHEQUERA DE COBRO '+ coCRLF +

            ' -- FJR  ' + coCRLF +
            '  FROM CR_TRANSACCION, CR_CREDITO, CONTRATO, PERSONA_FISICA PTIT,'+
            '       PERSONA  PTF, CR_CESION, CR_EMISOR, PERSONA PPR, PERSONA PPRC, MONEDA,'+
//            '       CR_CONTRATO,  '+
            '      (SELECT CCTO.*, CPRO.ID_EMPRESA FROM   CR_PRODUCTO CPRO, CR_CONTRATO CCTO WHERE  CPRO.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE) CR_CONTRATO,'+
            '       CR_PRODUCTO,  CR_CAT_MINIMO, PERSONA_FISICA PFP, PERSONA PP,'+
            '       CR_PRODUCTO_GPO, ' + coCRLF +
                C_QUERY_CTAS_ICRE +
                C_QUERY_CTAS +

//            ' WHERE CR_TRANSACCION.CVE_OPERACION IN (''DISPCS'',''DISPCR'',''DISPRE'',''DISPRS'',''DSCSDL'')'+ //EASA4011
            ' WHERE CR_TRANSACCION.CVE_OPERACION IN (''DISPCS'',''DISPCR'',''DISPRE'',''DISPRS'',''DSCSDL'', ''DSCRDL'')'+
            '   AND CR_CREDITO.ID_CREDITO = CR_TRANSACCION.ID_CREDITO'+
            '   AND CONTRATO.ID_CONTRATO = CR_TRANSACCION.ID_CONTRATO'+
            '   AND PTIT.ID_PERSONA(+)= CONTRATO.ID_TITULAR'+
            '   AND PTF.ID_PERSONA = CONTRATO.ID_TITULAR'+
            '   AND CR_CESION.ID_CESION (+)= CR_TRANSACCION.ID_CREDITO'+
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
            '   AND CR_EMISOR.CVE_FND_ENT_DES (+)= CR_CESION.CVE_FND_ENT_DES'+
            '   AND CR_EMISOR.ID_ACREDITADO (+)= CR_CESION.ID_EMISOR'+
//            '   AND CR_EMISOR.CVE_EMISOR_NAFIN (+)= CR_CESION.CVE_EMISOR_NAFIN'+
            '   AND CR_EMISOR.CVE_EMISOR_EXT (+)= CR_CESION.CVE_EMISOR_NAFIN'+
{/ROIM}
            '   AND PPR.ID_PERSONA = CR_CREDITO.ID_PROM_ADM'+
            '   AND PPRC.ID_PERSONA = CONTRATO.ID_PERS_ASOCIAD'+
            '   AND PP.ID_PERSONA (+)= CR_CESION.ID_PROVEEDOR'+
            '   AND PFP.ID_PERSONA (+)= PP.ID_PERSONA'+
            '   AND MONEDA.CVE_MONEDA = CONTRATO.CVE_MONEDA'+
            '   AND CR_CONTRATO.ID_CONTRATO = CR_CREDITO.ID_CONTRATO'+
            '   AND CR_CONTRATO.FOL_CONTRATO = CR_CREDITO.FOL_CONTRATO'+
            '   AND CR_PRODUCTO.CVE_PRODUCTO_CRE = CR_CONTRATO.CVE_PRODUCTO_CRE'+
            '   AND CR_CAT_MINIMO.CVE_CAT_MINIMO (+)= CR_PRODUCTO.CVE_CLAS_CONTAB'+
            '   AND CR_PRODUCTO_GPO.CVE_PRODUCTO_GPO (+)= CR_PRODUCTO.CVE_PRODUCTO_GPO ' + coCRLF +
            '   AND TABCTAICRE.ID_EMPRESA (+)= CR_CONTRATO.ID_EMPRESA'+ coCRLF +
            '   AND TABCTAICRE.CVE_PRODUCTO_CRE (+)= CR_CONTRATO.CVE_PRODUCTO_CRE'+ coCRLF +
            '   AND TABCTAICRE.CVE_MONEDA (+)= CR_CONTRATO.CVE_MONEDA'+ coCRLF +
            '   AND TABCTA.CVE_PRODUCTO_CRE(+) = CR_PRODUCTO.CVE_PRODUCTO_CRE ' + coCRLF;

   If sSituacion <> SQLStr('LQ') Then Begin
      If (Trim(sFInicio)<>'') Then Begin
         sSQL:= sSQL + ' AND TRUNC(CR_CREDITO.F_AUTORIZA) >= TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')';
      End;

      If (Trim(sFFin)<>'') Then Begin
            sSQL:= sSQL + ' AND TRUNC(CR_CREDITO.F_AUTORIZA) <= TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''',''DD/MM/YYYY'')';
      End;
   End Else If sSituacion = SQLStr('LQ') Then Begin
      If (Trim(sFInicio)<>'') Then Begin
         sSQL:= sSQL + ' AND TRUNC(CR_CREDITO.F_LIQUIDACION) >= TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')';
      End;

      If (Trim(sFFin)<>'') Then Begin
         sSQL:= sSQL + ' AND TRUNC(CR_CREDITO.F_LIQUIDACION) <= TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''',''DD/MM/YYYY'')';
      End;
   End;

   If (Trim(sProducto)<>'') Then
      sSQL:= sSQL + ' AND  CR_PRODUCTO.CVE_PRODUCTO_CRE ='+ SQLStr( sProducto );
   If (Trim(sMoneda)<>'') Then
      sSQL:= sSQL + ' AND  CONTRATO.CVE_MONEDA ='+sMoneda;
   If (Trim(sAcreditado)<>'') Then
      //sSQL:= sSQL + ' AND  CR_EMISOR.ID_ACREDITADO ='+ sAcreditado;  // LOLS 20 SEP 2005
      sSQL:= sSQL + ' AND  CONTRATO.ID_TITULAR ='+ sAcreditado;    // LOLS 20 SEP 2005
   If (Trim(sPromAsoc)<>'') Then
      sSQL:= sSQL + ' AND  CONTRATO.ID_PERS_ASOCIAD ='+ sPromAsoc;
   If (Trim(sPromAdmon)<>'') Then
      sSQL:= sSQL + ' AND  CR_CREDITO.ID_PROM_ADM ='+ sPromAdmon;
   If (Trim(sCesion)<>'') Then
      sSQL:= sSQL + ' AND  CR_CREDITO.ID_CREDITO ='+ sCesion;
   If (Trim(sSituacion)<>'') Then
      Begin
         sSQL:= sSQL + ' AND ( CR_CREDITO.SIT_CREDITO IN ( ' + sSituacion + ' )';
         if ( sSituacion = 'AC' ) OR ( sSituacion = 'CA') THEN
            sSQL:= sSQL + ' AND  CR_TRANSACCION.SIT_TRANSACCION IN ( ' + sSituacion + ' ))'
         ELSE sSQL:= sSQL + ' )';
      END;
   If (Trim(sGpoProd)<>'') Then
      sSQL:= sSQL + ' AND CR_PRODUCTO.CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd );
   If (Trim(sOperDD)<>'') Then
      sSQL:= sSQL + ' AND  CR_CESION.B_OPERADO_NAFIN ='+ SQLStr( sOperDD );
   If (Trim(sTipoDisp)<>'') Then
      sSQL:= sSQL + ' AND  CR_CREDITO.TIPO_DISPOSICION ='+ SQLStr( sTipoDisp );
   If (Trim(sEmpresa)<>'') Then
      sSQL:= sSQL + ' AND  CR_PRODUCTO.ID_EMPRESA ='+  Trim(sEmpresa);
   If (Trim(sMedio)<>'') Then       // <ICASE JMML 28/Septiembre/2006>   Nuevo filtro
      sSQL:= sSQL + ' AND  CR_CREDITO.CVE_MEDIO ='''+ Trim(sMedio) + '''';




   sSQL:= sSQL + ' ORDER BY ';
   If sPromotorAso Then
      sSQL:= sSQL + ' NOM_PROMOTOR_ASO,';
   If sPromotorAdm Then
      sSQL:= sSQL + ' NOM_PROMOTOR_ADM,';

   If bEmisorProv Then
      sSQL:= sSQL + ' TITULAR, PROVEEDOR, '; // SATV4766

   sSQL:= sSQL + ' F_INICIO, DESC_MONEDA, CR_CESION.B_OPERADO_NAFIN, DESC_L_PRODUCTO, ';

   If bIncTipoSec Then
      sSQL:= sSQL + ' PTF.CVE_TIPO_SECTOR,';

   sSQL:= sSQL + ' TITULAR, CR_CREDITO.ID_CREDITO';

   sSQL := sSQL + ' ) TODO WHERE 1=1 ' ;
   Result:= sSQL;
End;

Procedure TQrCtrlColoca.qyColocaCalcFields(DataSet: TDataSet);
var TpoChq: String ;
Begin
   If (Trim(qyColocaB_OPERADO_NAFIN.AsString) = 'V')Then Begin
        qyColocaORIGEN.AsString:='Operado por NAFIN';
   End Else Begin
        qyColocaORIGEN.AsString:='Recursos Propios';
   End;
   qrlTOTAL.Caption:= 'Total '+ qyColocaORIGEN.AsString;
{
   GetSQLStr('SELECT CVE_TIP_OPE_CHQ FROM CR_CRED_CHEQ WHERE CUENTA_BANCO = '''+qyColocaCHEQ_COBR.AsString+''' '+
             ' AND ID_ACREDITADO = '+qyColocaID_CLIENTE.AsString+' '+
             ' AND CVE_EMISOR_NAFIN = (SELECT CVE_EMISOR_NAFIN '+
             '                         FROM CR_CESION WHERE ID_CESION = '+qyColocaID_CREDITO.AsString+' AND ID_EMISOR = '+qyColocaID_CLIENTE.AsString+' ) ',
              Apli.DataBaseName, Apli.SessionName, 'CVE_TIP_OPE_CHQ', TpoChq , False);

   If Trim(TpoChq)= '' then
   GetSQLStr('SELECT DISTINCT CVE_TIP_OPE_CHQ FROM CR_CRED_CHEQ WHERE CUENTA_BANCO = '''+qyColocaCHEQ_COBR.AsString+''' '+
             ' AND ID_ACREDITADO = '+qyColocaID_CLIENTE.AsString+' AND CVE_EMISOR_NAFIN = 0 ',
              Apli.DataBaseName, Apli.SessionName, 'CVE_TIP_OPE_CHQ', TpoChq , False);

   qyColocaTpoChq.AsString := TpoChq ; }
End;

Procedure TQrCtrlColoca.QRFootContadorBeforePrint(SEnder: TQRCustomBand;
  Var PrintBand: Boolean);
Var vlDif : Double;
    vlResta : Double;
    sDif, sInt : String;
Begin
   QRTCMAT.Caption := FormatFloat('###,##0.0000',vgTCambioMesAnt);

   QRLMsgErr.Caption  := ' ';
   QRLMsgErr1.Caption := ' ';
   vlDif := 0;
   vlResta := 0;
   sDif := '';
   sInt := '';
   If vgSdoInsoluto > 0  Then Begin
      vlDif := vgSdoInsoluto - vgImpDispuesto;
      sDif := FormatFloat('###,###,###,###,###,##0.00',vlDif);
      sInt := FormatFloat('###,###,###,###,###,##0.00',vgSumIntInLq);
      vlResta := CurrFromFrmFloat(sDif) - CurrFromFrmFloat(sInt);
{     if ( vlResta <> 0 ) then
     Begin
        QRLMsgErr.Caption  := ' ¡ ¡ ¡  E R R O R   E N   S A L D O S  ! ! ! ' ;
        QRLMsgErr1.Caption := ' Monto Cred. - Imp.Disp.: ' + sDif + '                ' +
                              ' Calculado : ' + sInt;
     End else Begin
        QRLMsgErr.Caption  := '';
        QRLMsgErr1.Caption := '';
     End;}
   End Else Begin
      //QRExpIntPagXAnt.Caption :=  FormatFloat('###,###,###,###,###,##0.00',vlDif);
      QRLMsgErr.Caption  := '';
      QRLMsgErr1.Caption := '';
   End;

   If sArchivo <>'' Then Begin
      Writeln(F, #09);
      Writeln(F, #09+'GRAN TOTAL:' + #09#09#09+
                  FormatFloat('###,###,###,###,###,##0',QRExpr28.Value.intResult) + #09+
                  '' +#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr29.Value.dblResult) +#09#09+
                  //FormatFloat('###,###,###,###,###,##0.00',QRExpr30.Value.dblResult)+#09+
                  //FormatFloat('###,###,###,###,###,##0.00',QRExpr31.Value.dblResult));// +#09#09+
                  'TIPO DE CAMBIO (MES ANT.)'+#09+FormatFloat('###,###,###,###,###,##0.0000',StrToFloat(QRTCMAT.Caption) ))  ; //+#09+#09+
                  //'Int. Pag. x Ant.' +#09+
                  //FormatFloat('###,###,###,###,###,##0.00',QRExpIntPagXAnt.Value.dblResult));
      Writeln(F, #09 );
      Writeln(F, #09+#09+#09+ QRLMsgErr.Caption);
      Writeln(F, #09+#09+#09+ QRLMsgErr1.Caption);
   End;

End;

Procedure TQrCtrlColoca.QRBand1BeforePrint(SEnder: TQRCustomBand;
  Var PrintBand: Boolean);
Begin

   vgImpDispuesto := vgImpDispuesto + qyColocaIMP_DISPUESTO.AsFloat;
   vgSdoInsoluto := vgSdoInsoluto + qyColocaSDO_INSOL.AsFloat;
   If sArchivo <>'' Then Begin
         Writeln(F,

                  FormatDateTime('dd/mm/yyyy',qyColoca.FieldByName('F_INICIO').AsDateTime) + #09 +
                  //qyColoca.FieldByName('CVE_TIPO_SECTOR').AsString + #09 +
                  qyColoca.FieldByName('CVE_MONEDA').AsString + #09 +
                  qyColoca.FieldByName('DESC_MONEDA').AsString + #09 +
                  //qyColoca.FieldByName('ORIGEN').AsString + #09 +
                  //qyColoca.FieldByName('CVE_PRODUCTO_CRE').AsString + #09 +
                  //qyColoca.FieldByName('DESC_L_PRODUCTO').AsString + #09 +
                  //qyColoca.FieldByName('CVE_CLAS_CONTAB').AsString + #09 +
                  qyColoca.FieldByName('CON').AsString + #09 +
                  qyColoca.FieldByName('ID_CREDITO').AsString  + #09+
                  qyColoca.FieldByName('TITULAR').AsString    + #09 +
                  qyColoca.FieldByName('PROVEEDOR').AsString + #09 +
                  FormatFloat('###,###,###,###,###,##0.00',qyColoca.FieldByName('IMP_DISPUESTO').AsFloat) + #09+
                  qyColoca.FieldByName('CHEQUERA').AsString + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyColoca.FieldByName('SALDO_AL').AsFloat) + #09+
                  qyColoca.FieldByName('CHEQ_COBR').AsString);
                 // <<< FJR 06/01/2012

   End;
End;

Procedure TQrCtrlColoca.QuickRepBeforePrint(SEnder: TCustomQuickRep;
  Var PrintReport: Boolean);
Begin
   vgSdoInsoluto  := 0;
   vgImpDispuesto := 0;
End;

Function TQrCtrlColoca.ObtTotIntInLq(sSit, sFIni, sFFin: String; pAPli : TInterApli): Double;
Var vlImpInt : String;
    vlSQL    : String;
Begin
   vlsql := 'SELECT NVL(SUM(NVL(IMP_INTERES,0)),0) SUMA_INT           ' +
            '  FROM CR_INTERES CI, CR_DOCUMENTO CD, CR_CREDITO CC     ' +
            ' WHERE CI.ID_CREDITO = CD.ID_CESION                     ' +
            '   AND CI.NUM_PERIODO = CD.NUM_PERIODO_DOC              ' +
            '   AND CD.CVE_TIPO_INTERES = ''IN''                       ' +
            '   AND CI.SIT_INTERES = ''LQ''                            ' +
            '   AND CC.ID_CREDITO = CD.ID_CESION                       ';
   If sSit <> 'LQ' Then Begin
      vlSQL:= vlSQL + ' AND CC.F_AUTORIZA >= TO_DATE('''+
                       FormatDateTime('DD/MM/YYYY',StrToDate(sFIni))+''',''DD/MM/YYYY'')';

      If (Trim(sFFin)<>'') Then Begin
                vlSQL:= vlSQL + ' AND CC.F_AUTORIZA <= TO_DATE('''+
                       FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''',''DD/MM/YYYY'')';
      End;
   End Else If sSit = 'LQ' Then Begin
      If (Trim(sFIni)<>'') Then Begin
         vlSQL:= vlSQL + ' AND CC.F_LIQUIDACION >= TO_DATE('''+
                       FormatDateTime('DD/MM/YYYY',StrToDate(sFIni))+''',''DD/MM/YYYY'')';
      End;
      If (Trim(sFFin)<>'') Then Begin
         vlSQL:= vlSQL + ' AND CC.F_LIQUIDACION <= TO_DATE('''+
                       FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''',''DD/MM/YYYY'')';
      End;
   End;
   GetSQLStr(vlSQL,pAPli.DataBaseName,pAPli.SessionName,'SUMA_INT',vlimpInt,False);
   Result := StrToFloat(vlImpInt);
End;

procedure TQrCtrlColoca.QRGroupSectorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if qyColoca.FieldByName('CVE_MONEDA').AsInteger <> 484 then
   begin
        QRLabel38.Caption := 'Tipo de Cambio (Mes Ant.)';
       QRTCMA.Caption := FormatFloat('###,##0.0000',vgTCambioMesAnt);
   end
   else
   begin
        QRLabel38.Caption := '';
        QRTCMA.Caption := '';
   end;
end;

procedure TQrCtrlColoca.QRFooterProductoBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
{   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total de Disposiciones:' + #09 +
                  FormatFloat('###,###,###,###,###,##0',QRExpr7.Value.intResult) +#09+
                  'Total por Producto' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr13.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr14.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr4.Value.dblResult)+#09+#09+
                  'Int. Pag. x Ant.' +#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr40.Value.dblResult));
   End; }
end;

procedure TQrCtrlColoca.QRFooterOrigenBeforePrint(Sender: TQRCustomBand;    var PrintBand: Boolean);
begin
{   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total de Disposiciones:' + #09 +
                  FormatFloat('###,###,###,###,###,##0',QRExpr10.Value.intResult) +#09 +
                  'Total '+ qyColoca.FieldByName('ORIGEN').AsString + #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr1.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr6.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr17.Value.dblResult));
   End;  }
end;

procedure TQrCtrlColoca.QRFooterMonedaBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total de Disposiciones:'+ #09 +
                  FormatFloat('###,###,###,###,###,##0',QRExpr8.Value.intResult) +#09 +
                  'Total por Moneda' + #09#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr2.Value.dblResult)+#09 +
                  {FormatFloat('###,###,###,###,###,##0.00',QRExpr12.Value.dblResult)+}#09+
                  //FormatFloat('###,###,###,###,###,##0.00',QRExpr18.Value.dblResult  )+#09+#09+
                  //FormatFloat('###,###,###,###,###,##0.00',StrToFloat(QRLSAM.Caption) )+#09+#09+
                  {'Int. Pag. x Ant.' +}#09) ;
                  {FormatFloat('###,###,###,###,###,##0.00',QRExpr41.Value.dblResult));}
   End;
end;

procedure TQrCtrlColoca.QRBFootSectorBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
{   QRTCMASec.Caption := FormatFloat('###,##0.0000',vgTCambioMesAnt);
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 +'Total de Disposiciones:' +#09+
                  FormatFloat('###,###,###,###,###,##0',QRExpr52.Value.intResult) +#09+
                  'Total de SECTOR' +#09+
                  qyColoca.FieldByName('CVE_TIPO_SECTOR').AsString +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr21.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr22.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr23.Value.dblResult)+#09+#09+
                  'Int. Pag. x Ant.' +#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr42.Value.dblResult));
   End;  }
end;

procedure TQrCtrlColoca.QRFechaFooterBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total de Disposiciones:' +#09 +
                  FormatFloat('###,###,###,###,###,##0',QRExpr11.Value.intResult) +#09+
                  'Total por DIA' +#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr5.Value.dblResult) );//+#09+
                  {FormatFloat('###,###,###,###,###,##0.00',QRExpr16.Value.dblResult)+}//#09 +
                  //FormatFloat('###,###,###,###,###,##0.00',QRExpr20.Value.dblResult)  );
                  //FormatFloat('###,###,###,###,###,##0.00',StrToFloat(QRLSAD.Caption) ));
   End;
end;

procedure TQrCtrlColoca.QRFooterPromotorBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
{   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total de Disposiciones:' +#09+
                  FormatFloat('###,###,###,###,###,##0',QRExpr9.Value.intResult) +#09+
                  'Total por Promotor Administrador' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr3.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr15.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr19.Value.dblResult));
   End; }
end;

procedure TQrCtrlColoca.QRFooterPromAsocBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
{   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09+ 'Total de Disposiciones:' +#09+
                  FormatFloat('###,###,###,###,###,##0',QRExpr24.Value.intResult) +#09+
                  'Total por Promotor Asociado' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr25.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr26.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr27.Value.dblResult));
   End; }
end;

procedure TQrCtrlColoca.qrgrpFooterProveedorBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
{   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09+ 'Total de Disposiciones:' +#09 +
                  FormatFloat('###,###,###,###,###,##0',QRExpr36.Value.intResult) +#09+
                  'Total por Proveedor' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr37.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr38.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr39.Value.dblResult));
   End;}
end;

procedure TQrCtrlColoca.qrgrpFooterEmisorBeforePrint(Sender: TQRCustomBand;     var PrintBand: Boolean);
begin
{   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09+'Total de Disposiciones:' +#09+
                  FormatFloat('###,###,###,###,###,##0',QRExpr32.Value.intResult) +#09+
                  'Total por Emisor' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr33.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr34.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr35.Value.dblResult));
   End;  }
end;

procedure TQrCtrlColoca.SummaryBand1BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If qyColoca.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

procedure TQrCtrlColoca.QRGroupMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if qyColoca.FieldByName('CVE_MONEDA').AsInteger <> 484 then
   begin
        QRLabel38.Caption := 'Tipo de Cambio (Mes Ant.)';
       QRTCMA.Caption := FormatFloat('###,##0.0000',vgTCambioMesAnt);
   end
   else
   begin
        QRLabel38.Caption := '';
        QRTCMA.Caption := '';
   end;

end;

End.
