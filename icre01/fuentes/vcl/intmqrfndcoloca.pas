Unit IntMQrFndColoca;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport;
Type
  TQrFndColoca = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qyColoca: TQuery;
    QRSHPTCredito: TQRShape;
    QRLabel9: TQRLabel;
    QRSHPTContrato: TQRShape;
    QRSHPTSaldo: TQRShape;
    qrlSaldo: TQRLabel;
    QRSHPTCliente: TQRShape;
    QRLabel17: TQRLabel;
    QRSHPTMonto: TQRShape;
    QRLabel18: TQRLabel;
    QRSHPTSaldoIsoluto: TQRShape;
    QRLabel20: TQRLabel;
    QRSHPTF_Inicio: TQRShape;
    QRSHPTPlazo: TQRShape;
    QRLabel24: TQRLabel;
    QRBand1: TQRBand;
    QRFooterMoneda: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRSHPF_Vencimiento: TQRShape;
    QRLabel6: TQRLabel;
    QRSHPTTasa: TQRShape;
    QRSHPTSobretasa: TQRShape;
    QRSHPTSituacion: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRFooterOrigen: TQRBand;
    QRFooterProducto: TQRBand;
    QRFooterPromotor: TQRBand;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    qrlTOTAL: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRSHPTImpDispuesto: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText10: TQRDBText;
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
    QRExpr12: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRLabel10: TQRLabel;
    QRSHPTChequera: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRBFootSector: TQRBand;
    QRSHPTotalSector: TQRShape;
    QRLabel49: TQRLabel;
    QRExpr52: TQRExpr;
    QRLabel50: TQRLabel;
    QRDBText39: TQRDBText;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
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
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    QRSHPTProveedor: TQRShape;
    QRLabel33: TQRLabel;
    QRDBText24: TQRDBText;
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
    QRLabel39: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape1: TQRShape;
    QRDBText27: TQRDBText;
    QRLabel30: TQRLabel;
    QRExpIntPagXAnt: TQRExpr;
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
    QRExpr41: TQRExpr;
    QRLabel40: TQRLabel;
    QRExpr42: TQRExpr;
    QRLabel41: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel42: TQRLabel;
    QRTCMAT: TQRLabel;
    QRLabel43: TQRLabel;
    QRTCMASec: TQRLabel;
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
    QRGroupEntDes: TQRGroup;
    QRFooterEntDes: TQRBand;
    QRGroupPrograma: TQRGroup;
    QRFooterPrograma: TQRBand;
    QRShape2: TQRShape;
    QRLabel44: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText30: TQRDBText;
    QRShape3: TQRShape;
    QRLabel45: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRExpr43: TQRExpr;
    QRLabel51: TQRLabel;
    QRExpr44: TQRExpr;
    QRExpr45: TQRExpr;
    QRExpr46: TQRExpr;
    QRLabel53: TQRLabel;
    QRExpr47: TQRExpr;
    QRExpr48: TQRExpr;
    QRLabel54: TQRLabel;
    QRExpr49: TQRExpr;
    QRExpr50: TQRExpr;
    QRExpr51: TQRExpr;
    QRLabel55: TQRLabel;
    QRExpr53: TQRExpr;
    qyColocaID_CREDITO: TFloatField;
    qyColocaCHEQUERA: TFloatField;
    qyColocaSALDO_AL: TFloatField;
    qyColocaID_CONTRATO: TFloatField;
    qyColocaTITULAR: TStringField;
    qyColocaPROVEEDOR: TStringField;
    qyColocaCVE_TIPO_SECTOR: TStringField;
    qyColocaNOMBRE_EMISOR: TStringField;
    qyColocaIMP_CRED: TFloatField;
    qyColocaSDO_INSOL: TFloatField;
    qyColocaIMP_DISPUESTO: TFloatField;
    qyColocaIMP_CRED_VAL: TFloatField;
    qyColocaSDO_INSOL_VAL: TFloatField;
    qyColocaIMP_DISPUESTO_VAL: TFloatField;
    qyColocaF_INICIO: TDateTimeField;
    qyColocaF_AUTORIZA: TDateTimeField;
    qyColocaF_LIQUIDACION: TDateTimeField;
    qyColocaF_FIN: TDateTimeField;
    qyColocaPLAZO: TFloatField;
    qyColocaF_VENCIMIENTO: TDateTimeField;
    qyColocaTASA: TStringField;
    qyColocaSOTASA: TFloatField;
    qyColocaSITUACION: TStringField;
    qyColocaID_PROM_ADM: TFloatField;
    qyColocaNOM_PROMOTOR_ADM: TStringField;
    qyColocaID_PERS_ASOCIAD: TFloatField;
    qyColocaNOM_PROMOTOR_ASO: TStringField;
    qyColocaCVE_MONEDA: TFloatField;
    qyColocaDESC_MONEDA: TStringField;
    qyColocaCVE_PRODUCTO_CRE: TStringField;
    qyColocaDESC_L_PRODUCTO: TStringField;
    qyColocaCVE_FND_ENT_DES: TStringField;
    qyColocaDESC_ENT_DES: TStringField;
    qyColocaCVE_FND_PROGRAMA: TStringField;
    qyColocaDESC_PROGRAMA: TStringField;
    qyColocaCVE_ORIGEN_REC: TStringField;
    qyColocaDESC_ORIGEN_REC: TStringField;
    qyColocaCVE_CLAS_CONTAB: TStringField;
    qyColocaDESC_CAT_MINIMO: TStringField;
    qyColocaB_OPERADO_NAFIN: TStringField;
    qyColocaTIPO_CAMBIO: TFloatField;
    qyColocaCVE_PRODUCTO_GPO: TStringField;
    qyColocaCUENTA_VIGENTE_K: TStringField;
    qyColocaCUENTA_VIGENTE_INT: TStringField;
    QRDBTCMA: TQRDBText;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    qyColocaCANC_FVALOR: TStringField;
    qyColocaCOL_FVALOR: TStringField;
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
  Private
  Public
    vgImpDispuesto : Double;
    vgSdoInsoluto  : Double;
    vgSumIntInLq   : Double;
    vgFechaMesAnt  : TDate;
    vgTCambioMesAnt: Double;
    Function FormaQuery(sFInicio,sFFin,sProducto,sMoneda,
                        sAcreditado,sPromAsoc,sPromAdmon,
                        sCesion,sSituacion,sGpoProd, sProcam, sOperDD,
                        sEmpresa, sSucursal,sRecurso, sEntidad, sPrograma:String;
                        sPromotorAso,sPromotorAdm,bIncTipoSec, bEmisorProv:Boolean):String;
    Function ObtTotIntInLq(sSit,sFIni,sFFin : String;pAPli: TInterApli) :Double;
  End;
Var
  QrFndColoca: TQrFndColoca;
  bGenArch: Boolean;
  Apli : TInterApli;
  sCampoF, sArchivo:String;
  F: TextFile;

Procedure RepFndColocaciones(  sF_Inicio, sF_Fin,sProducto, sMoneda,
                            sAcreditado, sPromAsoc, sPromAdmon,
                            sCesion, sSituacion, sGpoProd, sProcam:String;
                            sPromotorAso, sPromotorAdm, bIncTipoSec, bEmisorProv:Boolean;
                            sNbrArch, sOperDD, sEmpresa, sSucursal,
                            sRecurso, sEntidad, sPrograma: String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepFndColocaciones(  sF_Inicio, sF_Fin, sProducto, sMoneda,
                            sAcreditado, sPromAsoc, sPromAdmon,
                            sCesion, sSituacion, sGpoProd, sProcam :String;
                            sPromotorAso, sPromotorAdm, bIncTipoSec, bEmisorProv:Boolean;
                            sNbrArch, sOperDD, sEmpresa, sSucursal,
                            sRecurso, sEntidad, sPrograma: String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Var
   QrFndColoca: TQrFndColoca;
   Preview     : TIntQRPreview;
   sTitulo1, sTitulo2:String;
Begin
   QrFndColoca:=TQrFndColoca.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrFndColoca);
   Try

      bGenArch:= False;
      Apli := pApli;
      sArchivo:= sNbrArch;
      QrFndColoca.QRInterEncabezado1.Apli:=pApli;
      QrFndColoca.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrFndColoca.QRInterEncabezado1.NomReporte:='IntMQrFndColoca';

      If Trim(sF_Inicio)<>'' Then Begin
         If sSituacion <> SQLStr('LQ') Then Begin
            QrFndColoca.QRInterEncabezado1.Titulo1:='Reporte de Colocaciones Pasivas';
            QrFndColoca.QRGroupFecha.Expression := 'qyColoca.F_AUTORIZA';
            QrFndColoca.QRDBText11.DataField := 'F_AUTORIZA';
            sTitulo1:= 'Reporte de Colocaciones';
            sCampoF:= 'F_AUTORIZA';
         End Else Begin
            QrFndColoca.QRInterEncabezado1.Titulo1:='Reporte de Liquidaciones Pasivas';
            QrFndColoca.QRGroupFecha.Expression := 'qyColoca.F_FIN';
            QrFndColoca.QRDBText11.DataField := 'F_FIN';
            sTitulo1:= 'Reporte de Liquidaciones';
            sCampoF:= 'F_FIN';
         End;
      End;

      QrFndColoca.QRInterEncabezado1.Titulo2:='Periodo del '+  sF_Inicio + ' al ' + sF_Fin;
      sTitulo2:= 'Periodo del '+  sF_Inicio + ' al ' + sF_Fin;
      QrFndColoca.qrlSaldo.Caption:='Saldo al '+ FormatDateTime('dd/mm/yyyy',pAPli.DameFechaEmpresa);
      QrFndColoca.qyColoca.DatabaseName := pApli.DataBaseName;
      QrFndColoca.qyColoca.SessionName := pApli.SessionName;


      QrFndColoca.vgFechaMesAnt := ObtFechaMesAnt( C_FMAN, pApli );
{      QrFndColoca.vgTCambioMesAnt := ObtTipoCambio( QrFndColoca.vgFechaMesAnt,
                                                   IntToStr ( C_DLLS ) ,
                                                   pAPli.DataBaseName, pAPli.SessionName);
                                                   }

      QrFndColoca.vgTCambioMesAnt := ObtTipoCambio( StrToDateTime(sF_Inicio),
                                                   IntToStr ( C_DLLS ) ,
                                                   pAPli.DataBaseName, pAPli.SessionName);
      If Not(sPromotorAso) Then Begin
         QrFndColoca.QRGroupPromAsoc.Enabled:=False;
         QrFndColoca.QRGroupPromAsoc.Expression:='';
         QrFndColoca.QRFooterPromAsoc.Enabled:=False;
      End;

      If Not(sPromotorAdm) Then Begin
         QrFndColoca.QRGroupPromAdmin.Enabled:=False;
         QrFndColoca.QRGroupPromAdmin.Expression:='';
         QrFndColoca.QRFooterPromotor.Enabled:=False;
      End;

      If (sOperDD = 'F') or (sProcam <> '') then Begin
         QrFndColoca.QROrigen.Enabled := False;
         QrFndColoca.QROrigen.Expression := '';
         QrFndColoca.QROrigen.Enabled := False;
      End;

      If Not(bIncTipoSec) then Begin
         QrFndColoca.QRGroupSector.Enabled := False;
         QrFndColoca.QRGroupSector.Expression := '';
         QrFndColoca.QRBFootSector.Enabled := False;
      End;

      If (bEmisorProv) then Begin
         QrFndColoca.QRGroupMoneda.Enabled := False;
         QrFndColoca.QRGroupMoneda.Expression := '';
         QrFndColoca.QRFooterMoneda.Enabled := False;

         QrFndColoca.QROrigen.Enabled := False;
         QrFndColoca.QROrigen.Expression := '';
         QrFndColoca.QRFooterOrigen.Enabled := False;

         QrFndColoca.QRGroupProducto.Enabled := False;
         QrFndColoca.QRGroupProducto.Expression := '';
         QrFndColoca.QRFooterProducto.Enabled := False;
      End Else Begin
         QrFndColoca.qrgrpHeaderEmisor.Enabled := False;
         QrFndColoca.qrgrpHeaderEmisor.Expression := '';
         QrFndColoca.qrgrpFooterEmisor.Enabled := False;

         QrFndColoca.qrgrpHeaderProveedor.Enabled := False;
         QrFndColoca.qrgrpHeaderProveedor.Expression := '';
         QrFndColoca.qrgrpFooterProveedor.Enabled := False;
      End;

      QrFndColoca.qyColoca.Active:=False;
      QrFndColoca.qyColoca.SQL.Text:= QrFndColoca.FormaQuery(sF_Inicio,sF_Fin,sProducto,sMoneda,
                        sAcreditado,sPromAsoc,sPromAdmon,sCesion,sSituacion,sGpoProd,sProcam, sOperDD,
                        sEmpresa, sSucursal,sRecurso, sEntidad, sPrograma,
                        sPromotorAso,sPromotorAdm,bIncTipoSec, bEmisorProv);
      QrFndColoca.qyColoca.SQL.SaveToFile('C:\COLOCA FND.SQL'); // LOLS 02 05 2005
      QrFndColoca.qyColoca.Active:=True;

      QrFndColoca.vgSdoInsoluto  := 0;
      QrFndColoca.vgImpDispuesto := 0;
      QrFndColoca.vgSumIntInLq   := QrFndColoca.ObtTotIntInLq(sSituacion, sF_Inicio, sF_Fin, pAPli);

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, sTitulo1+ #09 );
         Writeln(F, sTitulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F,
             'Emisor'+ #09 +
             'Proveedor'+ #09 +
             'Promotor Asociado'+ #09+ 'Nombre Promotor Asociado' +#09 +
             'Promotor Administrador'+#09 + 'Nombre Promotor Administrador' +#09 +
             'Fecha' + #09 +
             'Sector' + #09 +
             'Moneda' + #09+'Descripción Moneda'+#09+ 'Origen' +#09 +
             'Producto' + #09+ 'Descripción Producto' +#09 +
             'Clasificación Contable:'+ #09#09 +
             'Cesion/Crédito' +  #09+
             'Chequera' +  #09 +
             'Saldo al '+ FormatDateTime('dd/mm/yyyy',Apli.DameFechaEmpresaDia('D000'))+  #09 +
             'Contrato' +  #09 +
             'Cliente' +  #09 +
             'Proveedor' +#09 +
             'Monto del Crédito'+ #09+
             'Saldo Insoluto'+ #09 +
             'Importe Redescontado'+#09 +
             'Fecha Liquidación'+ #09 +
             'Fecha Inicio'+ #09 +
             'Plazo'+ #09 +
             'Fecha de Vencimiento'+ #09 +
             'Tasa/Sobretasa'+ #09 +
             'Tasa Disp.'+ #09 +
             'Situación');
      End;

      If pPreview Then
         QrFndColoca.Preview
      Else
         QrFndColoca.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrFndColoca.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrFndColoca.FormaQuery(sFInicio,sFFin,sProducto,sMoneda,
                              sAcreditado,sPromAsoc,sPromAdmon,
                              sCesion,sSituacion,sGpoProd, sProcam,
                              sOperDD,sEmpresa, sSucursal,
                              sRecurso, sEntidad, sPrograma:String;
                              sPromotorAso,sPromotorAdm,bIncTipoSec,
                              bEmisorProv:Boolean):String;
Var
    sSQL:String;
Begin
    sSQL:=  'SELECT ' + coCRLF +
            //HERJA AGOSTO 2012
            '        ( CASE'+ coCRLF +
            '                 WHEN (CR_TRANSACCION.ID_TRANS_CANCELA IS NOT NULL) THEN ''CA'' '+ coCRLF +
            '                     ELSE ''AC'' '+ coCRLF +
            '              END'+ coCRLF +
            '            ) SITUACION,'+ coCRLF +
            '        ( CASE'+ coCRLF +
            '                 WHEN (CR_TRANSACCION.ID_TRANS_CANCELA IS NOT NULL) THEN TO_CHAR(CR_FND_CREDITO.F_INICIO,''DD/MM/YYYY'') '+ coCRLF +
            '                     ELSE '' '' '+ coCRLF +
            '              END'+ coCRLF +
            '            ) CANC_FVALOR,'+ coCRLF +
            '        ( CASE'+ coCRLF +
            '                 WHEN (CR_TRANSACCION.F_OPERACION <> CR_TRANSACCION.F_VALOR) THEN TO_CHAR(CR_TRANSACCION.F_VALOR,''DD/MM/YYYY'') '+ coCRLF +
            '                     ELSE '' '' '+ coCRLF +
            '              END'+ coCRLF +
            '            ) COL_FVALOR,'+ coCRLF +
            //FIN HERJA
            '       CR_CREDITO.ID_CREDITO,'+ coCRLF +
            '       CR_TRANSACCION.ID_CTO_LIQ CHEQUERA,'+ coCRLF +
            '       PKGDPVISTASERV.SPTObtSaldo(CR_TRANSACCION.ID_CTO_LIQ,''D000'') SALDO_AL,'+ coCRLF +
            '       CR_CONTRATO.ID_CONTRATO,  DECODE(PTF.CVE_PER_JURIDICA,''PM'', PTF.NOMBRE,'+ coCRLF +
            '       PTIT.APELLIDO_PATERNO||'' ''||PTIT.APELLIDO_MATERNO||'' ''||PTIT.NOMBRE_PERSONA) TITULAR,'+ coCRLF +
            '       DECODE(PP.CVE_PER_JURIDICA,''PM'',PP.NOMBRE,'+ coCRLF +
            '       PFP.APELLIDO_PATERNO||'' ''||PFP.APELLIDO_MATERNO||'' ''||PFP.NOMBRE_PERSONA) PROVEEDOR,'+ coCRLF +
            '       PTF.CVE_TIPO_SECTOR,  CR_EMISOR.NOMBRE_EMISOR ,  ' + coCRLF +
            '       CR_TRANSACCION.IMP_NETO IMP_CRED,'+ coCRLF +
            '       CR_FND_CREDITO.SDO_INSOLUTO SDO_INSOL,'+ coCRLF +
            '       CR_FND_CREDITO.IMP_REDESCONTADO  IMP_DISPUESTO,'+ coCRLF +
//            '       ROUND((CR_TRANSACCION.IMP_NETO * NVL(PKGCORPO.OBTTIPOCAMBIO (PKGCRCOMUN.STPOBTENFECHA(2,''FMAN'') ,CONTRATO.CVE_MONEDA,''V'' ), 1 )),2)  IMP_CRED_VAL,'+ coCRLF +
            '       ROUND((CR_TRANSACCION.IMP_NETO * NVL(PKGCORPO.OBTTIPOCAMBIO (CR_FND_CREDITO.F_AUTORIZA ,CONTRATO.CVE_MONEDA,''V'' ), 1 )),2) IMP_CRED_VAL,'+ coCRLF +
//            '       ROUND((CR_FND_CREDITO.SDO_INSOLUTO * NVL(PKGCORPO.OBTTIPOCAMBIO (PKGCRCOMUN.STPOBTENFECHA(2,''FMAN'') ,CONTRATO.CVE_MONEDA,''V'' ), 1 )),2) SDO_INSOL_VAL,'+ coCRLF +
            '       ROUND((CR_FND_CREDITO.SDO_INSOLUTO * NVL(PKGCORPO.OBTTIPOCAMBIO (CR_FND_CREDITO.F_AUTORIZA,CONTRATO.CVE_MONEDA,''V'' ), 1 )),2) SDO_INSOL_VAL,'+ coCRLF +
//            '       ROUND((CR_FND_CREDITO.IMP_REDESCONTADO * NVL(PKGCORPO.OBTTIPOCAMBIO (PKGCRCOMUN.STPOBTENFECHA(2,''FMAN'') ,CONTRATO.CVE_MONEDA,''V'' ), 1 )),2) IMP_DISPUESTO_VAL,'+ coCRLF +
            '       ROUND((CR_FND_CREDITO.IMP_REDESCONTADO * NVL(PKGCORPO.OBTTIPOCAMBIO (CR_FND_CREDITO.F_AUTORIZA,CONTRATO.CVE_MONEDA,''V'' ), 1 )),2) IMP_DISPUESTO_VAL,'+ coCRLF +
            '       TRUNC(CR_FND_CREDITO.F_INICIO) F_INICIO, CR_FND_CREDITO.F_AUTORIZA, CR_FND_CREDITO.F_LIQUIDACION,'+ coCRLF +
            '       TRUNC(CR_FND_CREDITO.F_LIQUIDACION) F_FIN,'+ coCRLF +
            '       NVL(CR_FND_CREDITO.DIAS_PLAZO,0) PLAZO,'+ coCRLF +
            '       CR_FND_CREDITO.F_VENCIMIENTO,'+ coCRLF +
            '       (CR_FND_CREDITO.CVE_TASA_REFER||DECODE(CR_FND_CREDITO.CVE_TASA_REFER,''FIJA'',''(''||CR_FND_CREDITO.TASA_CREDITO||'')'','' '')||CR_FND_CREDITO.OPERADOR_STASA||''(''||CR_FND_CREDITO.SOBRETASA||'')'') TASA,'+ coCRLF +
            '       CR_FND_CREDITO.TASA_CREDITO SOTASA,' + coCRLF +
//            '       CR_FND_CREDITO.SIT_CREDITO SITUACION, //HERJA AGOSTO 2012 SE CAMBIA EL CALCULO DE LA SITUACION
            '       CR_CREDITO.ID_PROM_ADM ,  PPR.NOMBRE NOM_PROMOTOR_ADM,'+ coCRLF +
            '       CONTRATO.ID_PERS_ASOCIAD, PPRC.NOMBRE NOM_PROMOTOR_ASO, CONTRATO.CVE_MONEDA,'+ coCRLF +
            '       MONEDA.DESC_MONEDA, CR_PRODUCTO.CVE_PRODUCTO_CRE,  CR_PRODUCTO.DESC_L_PRODUCTO,'+ coCRLF +
            '       CR_FND_ENT_DES.CVE_FND_ENT_DES, CR_FND_ENT_DES.DESC_ENT_DES, '+ coCRLF +
            '       CR_FND_PROGRAMA.CVE_FND_PROGRAMA, CR_FND_PROGRAMA.DESC_PROGRAMA, '+ coCRLF +
            '       CR_FND_CREDITO.CVE_ORIGEN_REC, ' + coCRLF +
            '       CR_ORIGEN_REC.DESC_ORIGEN_REC, ' + coCRLF +
            '       CR_PRODUCTO.CVE_CLAS_CONTAB,  CR_CAT_MINIMO.DESC_CAT_MINIMO,'+ coCRLF +
            '       NVL(CR_CESION.B_OPERADO_NAFIN,''F'')B_OPERADO_NAFIN, '+ coCRLF +
//            '       NVL( PKGCORPO.OBTTIPOCAMBIO(PKGCRCOMUN.STPOBTENFECHA(CONTRATO.ID_EMPRESA,''FMAN''), CONTRATO.CVE_MONEDA,''V'' ), 1 ) TIPO_CAMBIO, ' + coCRLF +
            '       NVL( PKGCORPO.OBTTIPOCAMBIO(CR_FND_CREDITO.F_AUTORIZA, CONTRATO.CVE_MONEDA,''V'' ), 1 ) TIPO_CAMBIO, ' + coCRLF +
            '       CR_PRODUCTO.CVE_PRODUCTO_GPO, ' + coCRLF +
            '       SUBSTR( PKGCRREDESCTO.FUNOBTCTAREDESC ( ''RK'',  CR_PRODUCTO.CVE_PRODUCTO_GPO, ' + coCRLF +
            '               CCPD.TIPO_CUENTAO, CONTRATO.CVE_MONEDA ), 1, 20 ) CUENTA_VIGENTE_K, ' + coCRLF +
            '       SUBSTR( PKGCRREDESCTO.FUNOBTCTAREDESC ( ''RI'',  CR_PRODUCTO.CVE_PRODUCTO_GPO, ' + coCRLF +
            '            CCPD.TIPO_CUENTAO, CONTRATO.CVE_MONEDA ), 1, 20 ) CUENTA_VIGENTE_INT ' + coCRLF +
            '  FROM CR_FND_ENT_DES, CR_FND_PROGRAMA, CR_ORIGEN_REC, CR_XTRANSACCION,CR_TRANSACCION, ' + coCRLF +
            '       CR_CREDITO, CR_FND_CREDITO, CONTRATO, PERSONA_FISICA PTIT,'+ coCRLF +
            '       PERSONA  PTF, CR_CESION, CR_EMISOR, PERSONA PPR, PERSONA PPRC, MONEDA,'+ coCRLF +
            '       CR_CONTRATO,  CR_PRODUCTO,  CR_CAT_MINIMO, PERSONA_FISICA PFP, PERSONA PP,'+ coCRLF +
            '       CR_PRODUCTO_GPO, ' + coCRLF +
            '       CR_CONT_PRODUCTO CCPD ' + coCRLF +
                //C_QRY_CTAS_REDESC +
            ' WHERE CR_XTRANSACCION.ID_TRANSACCION = CR_TRANSACCION.ID_TRANSACCION '+ coCRLF +
            '   AND CR_TRANSACCION.CVE_OPERACION IN ( ''DISPFD'' )'+ coCRLF +
            '   AND CR_TRANSACCION.SIT_TRANSACCION = ''AC'' '+ coCRLF + // LOLS 11 03 2005
            //'   AND CR_TRANSACCION.ID_TRANS_CANCELA IS NULL  '+ coCRLF + // LOLS 11 03 2005 //HERJA AGOSTO 2012 SE COMENTA PARA QUE MUESTRE FECHA VALOR
            '   AND CR_CREDITO.ID_CREDITO = CR_TRANSACCION.ID_CREDITO'+ coCRLF +
            '   AND CR_CREDITO.ID_CREDITO = CR_FND_CREDITO.ID_CREDITO '+ coCRLF +
            '   AND CR_XTRANSACCION.CVE_FND_ENT_DES = CR_FND_CREDITO.CVE_FND_ENT_DES '  + coCRLF +
            '   AND CR_XTRANSACCION.CVE_FND_PROGRAMA = CR_FND_CREDITO.CVE_FND_PROGRAMA '+ coCRLF +
            '   AND CR_FND_PROGRAMA.CVE_FND_ENT_DES  = CR_FND_CREDITO.CVE_FND_ENT_DES ' + coCRLF +
            '   AND CR_FND_PROGRAMA.CVE_FND_PROGRAMA = CR_FND_CREDITO.CVE_FND_PROGRAMA '+ coCRLF +
            '   AND CR_FND_ENT_DES.CVE_FND_ENT_DES   = CR_FND_PROGRAMA.CVE_FND_ENT_DES '+ coCRLF +
            '   AND CONTRATO.ID_CONTRATO = CR_TRANSACCION.ID_CONTRATO'+ coCRLF +
            '   AND PTIT.ID_PERSONA(+)= CONTRATO.ID_TITULAR'+ coCRLF +
            '   AND PTF.ID_PERSONA = CONTRATO.ID_TITULAR'+ coCRLF +
            '   AND CR_CESION.ID_CESION (+)= CR_TRANSACCION.ID_CREDITO'+ coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
            '   AND CR_EMISOR.CVE_FND_ENT_DES (+)= CR_CESION.CVE_FND_ENT_DES'+ coCRLF +
            '   AND CR_EMISOR.ID_ACREDITADO (+)= CR_CESION.ID_EMISOR'+ coCRLF +
//            '   AND CR_EMISOR.CVE_EMISOR_NAFIN (+)= CR_CESION.CVE_EMISOR_NAFIN'+ coCRLF +
            '   AND CR_EMISOR.CVE_EMISOR_EXT (+)= CR_CESION.CVE_EMISOR_NAFIN'+ coCRLF +
{/ROIM}
            '   AND PPR.ID_PERSONA = CR_CREDITO.ID_PROM_ADM'+ coCRLF +
            '   AND PPRC.ID_PERSONA = CONTRATO.ID_PERS_ASOCIAD'+ coCRLF +
            '   AND PP.ID_PERSONA (+)= CR_CESION.ID_PROVEEDOR'+ coCRLF +
            '   AND PFP.ID_PERSONA (+)= PP.ID_PERSONA'+ coCRLF +
            '   AND MONEDA.CVE_MONEDA = CONTRATO.CVE_MONEDA'+ coCRLF +
            '   AND CR_CONTRATO.ID_CONTRATO = CR_CREDITO.ID_CONTRATO'+ coCRLF +
            '   AND CR_CONTRATO.FOL_CONTRATO = CR_CREDITO.FOL_CONTRATO'+ coCRLF +
            '   AND CR_PRODUCTO.CVE_PRODUCTO_CRE = CR_CONTRATO.CVE_PRODUCTO_CRE'+ coCRLF +
            '   AND CR_CAT_MINIMO.CVE_CAT_MINIMO (+)= CR_PRODUCTO.CVE_CLAS_CONTAB'+ coCRLF +
            '   AND CR_PRODUCTO_GPO.CVE_PRODUCTO_GPO (+)= CR_PRODUCTO.CVE_PRODUCTO_GPO ' + coCRLF +
            '   AND CCPD.CVE_PRODUCTO_CR(+) = CR_PRODUCTO.CVE_PRODUCTO_GPO -- PRODUCTO VS GRUPO PRODUCTO ' + coCRLF +
            '   AND CR_ORIGEN_REC.CVE_ORIGEN_REC(+) = CR_FND_CREDITO.CVE_ORIGEN_REC ' + coCRLF +
            '   AND CR_TRANSACCION.IMP_NETO > 0 ' + coCRLF +
            '   AND ( (CR_FND_CREDITO.PCT_REDESCONTADO > 0) OR (CR_FND_CREDITO.IMP_REDESCONTADO > 0) )  ' + coCRLF    //HERJA AGOSTO 2012
            //'   AND CR_FND_CREDITO.PCT_REDESCONTADO > 0 ' + coCRLF; // PORECENTAJE REDESCUENTO JFOF
            ;

   If sSituacion <> SQLStr('LQ') Then Begin
      If (Trim(sFInicio)<>'') Then Begin
         sSQL:= sSQL + ' AND CR_FND_CREDITO.F_AUTORIZA >= ' + SQLFecha( StrToDate(sFInicio) );
      End;

      If (Trim(sFFin)<>'') Then Begin
            sSQL:= sSQL + ' AND CR_FND_CREDITO.F_AUTORIZA <= ' + SQLFecha( StrToDate(sFFin) );
      End;
   End Else If sSituacion = SQLStr('LQ') Then Begin
      If (Trim(sFInicio)<>'') Then Begin
         sSQL:= sSQL + ' AND TRUNC(CR_FND_CREDITO.F_LIQUIDACION) >= ' + SQLFecha( StrToDate(sFInicio) );
      End;

      If (Trim(sFFin)<>'') Then Begin
         sSQL:= sSQL + ' AND TRUNC(CR_FND_CREDITO.F_LIQUIDACION) <= ' + SQLFecha( StrToDate(sFFin) );
      End;
   End;

   If (Trim(sProducto)<>'') Then
      sSQL:= sSQL + ' AND  CR_PRODUCTO.CVE_PRODUCTO_CRE ='+ SQLStr( sProducto );
   If (Trim(sMoneda)<>'') Then
      sSQL:= sSQL + ' AND  CONTRATO.CVE_MONEDA ='+sMoneda;
   If (Trim(sAcreditado)<>'') Then
      sSQL:= sSQL + ' AND  CONTRATO.ID_TITULAR ='+ sAcreditado;  // LOLS4601 20 SEP 2005
   If (Trim(sPromAsoc)<>'') Then
      sSQL:= sSQL + ' AND  CONTRATO.ID_PERS_ASOCIAD ='+ sPromAsoc;
   If (Trim(sPromAdmon)<>'') Then
      sSQL:= sSQL + ' AND  CR_CREDITO.ID_PROM_ADM ='+ sPromAdmon;
   If (Trim(sCesion)<>'') Then
      sSQL:= sSQL + ' AND  CR_CREDITO.ID_CREDITO ='+ sCesion;
   If (Trim(sSituacion)<>'') Then
      Begin
         sSQL:= sSQL + ' AND ( CR_FND_CREDITO.SIT_CREDITO IN ( ' + sSituacion + ' )';
         if ( sSituacion = 'AC' ) OR ( sSituacion = 'CA') THEN
            sSQL:= sSQL + ' AND  CR_TRANSACCION.SIT_TRANSACCION IN ( ' + sSituacion + ' ))'
         ELSE sSQL:= sSQL + ' )';
      END;
   If (Trim(sGpoProd)<>'') Then
      sSQL:= sSQL + ' AND CR_PRODUCTO.CVE_PRODUCTO_GPO ='+ SQLStr( sGpoProd );
   If (Trim(sOperDD)<>'') Then
      sSQL:= sSQL + ' AND  CR_CESION.B_OPERADO_NAFIN ='+ SQLStr( sOperDD );
   If (Trim(sEmpresa)<>'') Then
      sSQL:= sSQL + ' AND  CR_PRODUCTO.ID_EMPRESA ='+  Trim(sEmpresa);
   If (Trim(sRecurso)<>'') Then
      sSQL:= sSQL + ' AND  CR_FND_CREDITO.CVE_ORIGEN_REC ='+  SQLStr( sRecurso );
   If (Trim(sEntidad)<>'') Then
      sSQL:= sSQL + ' AND  CR_XTRANSACCION.CVE_FND_ENT_DES ='+  SQLStr( sEntidad );
   If (Trim(sPrograma)<>'') Then
      sSQL:= sSQL + ' AND  CR_XTRANSACCION.CVE_FND_PROGRAMA ='+  SQLStr( sPrograma );


   sSQL:= sSQL + ' ORDER BY ';
   If sPromotorAso Then
      sSQL:= sSQL + ' NOM_PROMOTOR_ASO,';
   If sPromotorAdm Then
      sSQL:= sSQL + ' NOM_PROMOTOR_ADM,';

   If bEmisorProv Then
      sSQL:= sSQL + ' TITULAR, PROVEEDOR, '; // SATV4766

   sSQL:= sSQL + ' CR_FND_CREDITO.F_AUTORIZA,';
   If bIncTipoSec Then
      sSQL:= sSQL + ' PTF.CVE_TIPO_SECTOR,';

   sSQL:= sSQL + ' DESC_MONEDA, CR_FND_ENT_DES.DESC_ENT_DES, CR_FND_PROGRAMA.DESC_PROGRAMA, ' +
                 ' CR_ORIGEN_REC.DESC_ORIGEN_REC, DESC_L_PRODUCTO, TITULAR, CR_CREDITO.ID_CREDITO';



   Result:= sSQL;
End;

{
   If (Trim(qyColocaB_OPERADO_NAFIN.AsString) = 'V')Then Begin
        qyColocaORIGEN.AsString:='Operado por NAFIN';
   End Else Begin
        qyColocaORIGEN.AsString:='Recursos Propios';
   End;
   qrlTOTAL.Caption:= 'Total '+ qyColocaORIGEN.AsString;
}


Procedure TQrFndColoca.QRFootContadorBeforePrint(SEnder: TQRCustomBand;
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
      QRExpIntPagXAnt.Caption :=  FormatFloat('###,###,###,###,###,##0.00',vlDif);
      QRLMsgErr.Caption  := '';
      QRLMsgErr1.Caption := '';
   End;

   If sArchivo <>'' Then Begin
      Writeln(F, #09);
      Writeln(F, #09+'GRAN TOTAL:' + #09+
                  FormatFloat('###,###,###,###,###,##0',QRExpr28.Value.intResult) + #09+
                  '' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr29.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr30.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr31.Value.dblResult)
                  //+#09+#09+'Int. Pag. x Ant.'+#09+ FormatFloat('###,###,###,###,###,##0.00',QRExpIntPagXAnt.Value.dblResult)
                  );
      Writeln(F, #09 );
      Writeln(F, #09+#09+#09+ QRLMsgErr.Caption);
      Writeln(F, #09+#09+#09+ QRLMsgErr1.Caption);
   End;

End;

Procedure TQrFndColoca.QRBand1BeforePrint(SEnder: TQRCustomBand;
  Var PrintBand: Boolean);
Begin

   vgImpDispuesto := vgImpDispuesto + qyColocaIMP_DISPUESTO.AsFloat;
   vgSdoInsoluto := vgSdoInsoluto + qyColocaSDO_INSOL.AsFloat;
   If sArchivo <>'' Then Begin
         Writeln(F,

                  qyColoca.FieldByName('TITULAR').AsString + #09 +
                  qyColoca.FieldByName('PROVEEDOR').AsString + #09 +
                  qyColoca.FieldByName('ID_PERS_ASOCIAD').AsString + #09 +
                  qyColoca.FieldByName('NOM_PROMOTOR_ASO').AsString+ #09 +
                  qyColoca.FieldByName('ID_PROM_ADM').AsString + #09 +
                  qyColoca.FieldByName('NOM_PROMOTOR_ADM').AsString + #09 +
                  FormatDateTime('dd/mm/yyyy',qyColoca.FieldByName(sCampoF).AsDateTime) + #09 +
                  qyColoca.FieldByName('CVE_TIPO_SECTOR').AsString + #09 +
                  qyColoca.FieldByName('CVE_MONEDA').AsString + #09 +
                  qyColoca.FieldByName('DESC_MONEDA').AsString + #09 +
                  qyColoca.FieldByName('DESC_ORIGEN_REC').AsString + #09 +
                  qyColoca.FieldByName('CVE_PRODUCTO_CRE').AsString + #09 +
                  qyColoca.FieldByName('DESC_L_PRODUCTO').AsString + #09 +
                  qyColoca.FieldByName('CVE_CLAS_CONTAB').AsString + #09 +
                  qyColoca.FieldByName('DESC_CAT_MINIMO').AsString + #09 +
                  qyColoca.FieldByName('ID_CREDITO').AsString  + #09+
                  qyColoca.FieldByName('CHEQUERA').AsString    + #09 +
                  qyColoca.FieldByName('SALDO_AL').AsString + #09 +
                  qyColoca.FieldByName('ID_CONTRATO').AsString + #09+
                  qyColoca.FieldByName('TITULAR').AsString +#09 +
                  qyColoca.FieldByName('PROVEEDOR').AsString + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyColoca.FieldByName('IMP_CRED').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyColoca.FieldByName('SDO_INSOL').AsFloat) + #09 +
                  FormatFloat('###,###,###,###,###,##0.00',qyColoca.FieldByName('IMP_DISPUESTO').AsFloat) + #09+
                  FormatDateTime('dd/mm/yyyy',qyColoca.FieldByName('F_LIQUIDACION').AsDateTime) + #09+
                  FormatDateTime('dd/mm/yyyy',qyColoca.FieldByName('F_AUTORIZA').AsDateTime) + #09+
                  qyColoca.FieldByName('PLAZO').AsString + #09 +
                  FormatDateTime('dd/mm/yyyy',qyColoca.FieldByName('F_VENCIMIENTO').AsDateTime) + #09 +
                  qyColoca.FieldByName('TASA').AsString + #09+
                  qyColoca.FieldByName('SOTASA').AsString + #09+
                  qyColoca.FieldByName('SITUACION').AsString);
   End;
End;

Procedure TQrFndColoca.QuickRepBeforePrint(SEnder: TCustomQuickRep;
  Var PrintReport: Boolean);
Begin
   vgSdoInsoluto  := 0;
   vgImpDispuesto := 0;
End;

Function TQrFndColoca.ObtTotIntInLq(sSit, sFIni, sFFin: String; pAPli : TInterApli): Double;
Var vlImpInt : String;
    vlSQL    : String;
Begin
   vlsql := 'SELECT NVL(SUM(NVL(IMP_INTERES,0)),0) SUMA_INT           ' +
            '  FROM CR_FND_INTERES CI, CR_DOCUMENTO CD, CR_FND_CREDITO CC     ' +
            ' WHERE CI.ID_CREDITO = CD.ID_CESION                     ' +
            '   AND CI.NUM_PERIODO = CD.NUM_PERIODO_DOC              ' +
            '   AND CD.CVE_TIPO_INTERES = ''IN''                       ' +
            '   AND CI.SIT_INTERES = ''LQ''                            ' +
            '   AND CC.ID_CREDITO = CD.ID_CESION                       ';
   If sSit <> 'LQ' Then Begin
      vlSQL:= vlSQL + ' AND CC.F_INICIO >= TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sFIni))+''',''DD/MM/YYYY'')';

      If (Trim(sFFin)<>'') Then Begin
                vlSQL:= vlSQL + ' AND CC.F_INICIO <= TO_DATE('''+
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

procedure TQrFndColoca.QRGroupSectorBeforePrint(Sender: TQRCustomBand;
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

procedure TQrFndColoca.QRFooterProductoBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total de Disposiciones:' + #09 +
                  FormatFloat('###,###,###,###,###,##0',QRExpr7.Value.intResult) +#09+
                  'Total por Producto' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr13.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr14.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr4.Value.dblResult)
                  //+#09+#09+'Int. Pag. x Ant.' +#09+ FormatFloat('###,###,###,###,###,##0.00',QRExpr40.Value.dblResult)
                  );
   End;
end;

procedure TQrFndColoca.QRFooterOrigenBeforePrint(Sender: TQRCustomBand;    var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total de Disposiciones:' + #09 +
                  FormatFloat('###,###,###,###,###,##0',QRExpr10.Value.intResult) +#09 +
                  'Total '+ qyColoca.FieldByName('DESC_ORIGEN_REC').AsString +
                  #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr1.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr6.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr17.Value.dblResult));
   End;
end;

procedure TQrFndColoca.QRFooterMonedaBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total de Disposiciones:'+ #09 +
                  FormatFloat('###,###,###,###,###,##0',QRExpr8.Value.intResult) +#09 +
                  'Total por Moneda' + #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr2.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr12.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr18.Value.dblResult)
                  //+#09+#09+'Int. Pag. x Ant.' +#09+FormatFloat('###,###,###,###,###,##0.00',QRExpr41.Value.dblResult)
                  );
   End;
end;

procedure TQrFndColoca.QRBFootSectorBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   QRTCMASec.Caption := FormatFloat('###,##0.0000',vgTCambioMesAnt);
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 +'Total de Disposiciones:' +#09+
                  FormatFloat('###,###,###,###,###,##0',QRExpr52.Value.intResult) +#09+
                  'Total de SECTOR' +#09+
                  qyColoca.FieldByName('CVE_TIPO_SECTOR').AsString +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr21.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr22.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr23.Value.dblResult)
                  //+#09+#09+'Int. Pag. x Ant.' +#09+FormatFloat('###,###,###,###,###,##0.00',QRExpr42.Value.dblResult)
                  );
   End;
end;

procedure TQrFndColoca.QRFechaFooterBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total de Disposiciones:' +#09 +
                  FormatFloat('###,###,###,###,###,##0',QRExpr11.Value.intResult) +#09+
                  'Total por DIA' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr5.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr16.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr20.Value.dblResult));
   End;
end;

procedure TQrFndColoca.QRFooterPromotorBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total de Disposiciones:' +#09+
                  FormatFloat('###,###,###,###,###,##0',QRExpr9.Value.intResult) +#09+
                  'Total por Promotor Administrador' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr3.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr15.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr19.Value.dblResult));
   End;
end;

procedure TQrFndColoca.QRFooterPromAsocBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09+ 'Total de Disposiciones:' +#09+
                  FormatFloat('###,###,###,###,###,##0',QRExpr24.Value.intResult) +#09+
                  'Total por Promotor Asociado' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr25.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr26.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr27.Value.dblResult));
   End;
end;

procedure TQrFndColoca.qrgrpFooterProveedorBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09+ 'Total de Disposiciones:' +#09 +
                  FormatFloat('###,###,###,###,###,##0',QRExpr36.Value.intResult) +#09+
                  'Total por Proveedor' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr37.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr38.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr39.Value.dblResult));
   End;
end;

procedure TQrFndColoca.qrgrpFooterEmisorBeforePrint(Sender: TQRCustomBand;     var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09+'Total de Disposiciones:' +#09+
                  FormatFloat('###,###,###,###,###,##0',QRExpr32.Value.intResult) +#09+
                  'Total por Emisor' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr33.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr34.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr35.Value.dblResult));
   End;
end;

procedure TQrFndColoca.SummaryBand1BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   If qyColoca.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

End.
