Unit IntQrDiasCartVda;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport, U_InterCustomStar,
  U_InterDigDoc,uRedigitalizacion;
Type
  TQrDiasCartVda = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qyDiasCartVda: TQuery;
    QRSHPTCliente: TQRShape;
    QRLabel17: TQRLabel;
    QRFooterAcreditado: TQRBand;
    QRSHPTProveedor: TQRShape;
    QRLabel33: TQRLabel;                                      
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRShape2: TQRShape;
    QRLabel44: TQRLabel;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRLabel10: TQRLabel;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRShape15: TQRShape;
    QRLabel18: TQRLabel;
    QRFooterCatMinimo: TQRBand;
    QRLabel20: TQRLabel;
    QRShape21: TQRShape;
    QRLabel23: TQRLabel;
    QRBand1: TQRBand;
    QRDBText22: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText47: TQRDBText;
    QRGrpFooterMoneda: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    QRShape6: TQRShape;
    QRLabel6: TQRLabel;
    QRShape10: TQRShape;
    QRLabel11: TQRLabel;
    QRShape12: TQRShape;
    QRLabel13: TQRLabel;
    QRShape13: TQRShape;
    QRLabel14: TQRLabel;
    QRShape14: TQRShape;
    QRLabel15: TQRLabel;
    QRFooterProducto: TQRBand;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    qyDiasCartVdaCVE_MONEDA: TFloatField;
    qyDiasCartVdaDESC_MONEDA: TStringField;
    qyDiasCartVdaID_ACREDITADO: TFloatField;
    qyDiasCartVdaNOMBRE_ACREDITADO: TStringField;
    qyDiasCartVdaNUM_AUTORIZACION: TFloatField;
    qyDiasCartVdaID_CREDITO: TFloatField;
    qyDiasCartVdaF_TRASPASO_VEN: TDateTimeField;
    qyDiasCartVdaIMP_CAP_EXIG: TFloatField;
    qyDiasCartVdaIMP_CAP_NO_EXIG: TFloatField;
    qyDiasCartVdaIMP_INT_EXIG: TFloatField;
    qyDiasCartVdaTOTAL: TFloatField;
    qyDiasCartVdaCVE_PRODUCTO: TStringField;
    qyDiasCartVdaDESC_PRODUCTO: TStringField;
    qyDiasCartVdaCVE_CAT_MINIMO: TStringField;
    qyDiasCartVdaDESC_CAT_MINIMO: TStringField;
    qyDiasCartVdaID_PROM_ADM: TFloatField;
    qyDiasCartVdaNOMBRE_PROM_ADM: TStringField;
    qyDiasCartVdaGAR_EJERCIDA: TStringField;
    qyDiasCartVdaCVE_TIP_GARANTIA: TStringField;
    qyDiasCartVdaTIPO_GARANTIA: TStringField;
    qyDiasCartVdaID_PERIODO: TFloatField;
    qyDiasCartVdaF_APLICA_GAR: TDateTimeField;
    qyDiasCartVdaIMP_GARANTIA: TFloatField;
    qyDiasCartVdaCVE_PRESUPUESTO: TStringField;
    qyDiasCartVdaDESC_PRESUPUESTO: TStringField;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText23: TQRDBText;
    qyDiasCartVdaNUM_PERIODO: TFloatField;
    qyDiasCartVdaF_VENCIMIENTO: TDateTimeField;
    qreCapExig: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel24: TQRLabel;
    qyDiasCartVdaNUM_DIAS_VDO: TFloatField;
    QRShape16: TQRShape;
    QRLabel19: TQRLabel;
    InterDigDoc1: TInterDigDoc;
    QRLabel21: TQRLabel;
    lbTipoCambio: TQRLabel;
    QRShape17: TQRShape;
    QRLabel47: TQRLabel;
    qrMonCapExigTC: TQRLabel;
    qrMonCapNoExigTC: TQRLabel;
    qrMonIntExigTC: TQRLabel;
    qrMonTotalTC: TQRLabel;
    qrMonImpGarantia: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText9: TQRDBText;
    QRFooterCont: TQRBand;
    QRLabel45: TQRLabel;
    QRGranTotCapExg: TQRLabel;
    QRGranTotCapNoExg: TQRLabel;
    QRGranTotIntExg: TQRLabel;
    QRGranTotGarantia: TQRLabel;
    QRTotCapExgDlls: TQRLabel;
    QRTotCapExg: TQRLabel;
    QRTotCapExgUdis: TQRLabel;
    QRTotCapNoExgDlls: TQRLabel;
    QRTotCapNoExg: TQRLabel;
    QRTotCapNoExgUdis: TQRLabel;
    QRTotIntExgDlls: TQRLabel;
    QRTotIntExg: TQRLabel;
    QRTotIntExgUdis: TQRLabel;
    QRTotalDlls: TQRLabel;
    QRTotal: TQRLabel;
    QRTotalUdis: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel51: TQRLabel;
    QRDBText10: TQRDBText;
    QRTotGarantiaDlls: TQRLabel;
    QRTotGarantia: TQRLabel;
    QRTotGarantiaUdis: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape18: TQRShape;
    QRGranTotal: TQRLabel;
    QRShape19: TQRShape;
    QRLabel16: TQRLabel;

    QRGrupoMoneda: TQRGroup;
    QRGrupoProducto: TQRGroup;
    QRGrupoAcreditado: TQRGroup;
    QRGRupoCatMinimo: TQRGroup;
    QRGroup1: TQRGroup;
    QRGroupCred: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText29: TQRDBText;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;

{    QRGrupoMoneda: TQRGroup;
    QRGrupoProducto: TQRGroup;
    QRGrupoAcreditado: TQRGroup;
    QRGRupoCatMinimo: TQRGroup;}

    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterCatMinimoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterProductoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterAcreditadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGrpFooterMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGrupoMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterContBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupCredBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  Private
        dTipoCambio,vgTCambioMes,vgTCambioUDIS  : Double;
        vlCapExigDlls, vlCapNoExigdlls, vlIntExigDlls, vlTotalDlls, vlImpGarDlls :Double;
        vlCapExigPesos, vlCapNoExigPesos, vlIntExigPesos, vlTotalPesos, vlImpGarPesos :Double;
        vlCapExigUdis, vlCapNoExigUdis, vlIntExigUdis, vlTotalUdis, vlImpGarUdis :Double;
        VGAgrupa: Integer;

  Public
      Function ObtenQryPerIntercreditos(sFFin: String): String;
      Function ObtenQryPerICre(sFFin: String): String;
      Function ObtenQryGarantia(sFFin: String): String;
      Function ObtenQryGarantiaIN(sFFin: String): String;      
      Function ObtenQryDatosIntercreditos(sFFin,TCartera: String): String;
      Function ObtenQryDatosICre(sFFin,TCartera: String): String;

      Function FormaQuery(sFFin, sAcreditado, sDisp, sContrato, sMercObj,
                          sProducto, sEmpresa, sSucursal, sMoneda, sCatMinimo,sTipGar,
                          sRangoIni, sRangoFin,TCartera: String
                         ): String;
  end;
Var
  QrDiasCartVda: TQrDiasCartVda;
  bGenArch: Boolean;
  Apli : TInterApli;
  sArchivo:String;
  F: TextFile;

Procedure RepDiasCarVda( sFFin, sAcreditado, sDisp, sContrato, sMercObj, sProducto,
                         sEmpresa, sSucursal, sMoneda, sCatMinimo, sTipGar, sRangoIni, sRangoFin, sNbrArch, sTipoCambio,Agrupa,TCartera : String;
                         pAPli : TInterApli; pPreview : Boolean ;
                         grOpcion  : TGenRepOption;
                         sArchivoDig : String
                       );
Implementation
{$R *.DFM}

Procedure RepDiasCarVda( sFFin, sAcreditado, sDisp, sContrato, sMercObj, sProducto,
                         sEmpresa, sSucursal, sMoneda, sCatMinimo, sTipGar, sRangoIni, sRangoFin, sNbrArch,sTipoCambio,Agrupa,TCartera : String;
                         pAPli : TInterApli; pPreview : Boolean;
                         grOpcion  : TGenRepOption;
                         sArchivoDig : String
                       );
Var
   QrDiasCartVda: TQrDiasCartVda;
   Preview     : TIntQRPreview;
  //DIGITALIZACION DE REPORTES
   sDigDocFileName : String;
   bDigitalizaCorrecta : Boolean;
   dFechaTipoCambio: String;
   a : string;

Begin


   QrDiasCartVda:=TQrDiasCartVda.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrDiasCartVda);
   Try
      bGenArch:= False;
      Apli := pApli;
      sArchivo:= sNbrArch;
      QrDiasCartVda.QRInterEncabezado1.Apli:=pApli;
      QrDiasCartVda.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrDiasCartVda.QRInterEncabezado1.NomReporte:='IntMQrDiasCartVda';
      sDigDocFileName := 'DIASANTIGVDOS';
      QrDiasCartVda.QRInterEncabezado1.Titulo1:='Cartera Vencida por Rangos de Antigüedad al día ' + sFFin;

      QrDiasCartVda.VGAgrupa := StrToInt(Agrupa);

      if QrDiasCartVda.VGAgrupa = 0 then
      begin
         QrDiasCartVda.QRBand1.Enabled := False;
         QrDiasCartVda.QRBand1.Visible := False;
      end
      else
      begin
         QrDiasCartVda.QRGroupCred.Enabled := False;
         QrDiasCartVda.QRGroupCred.Visible := False;
      end;

      if sTipoCambio = 'MD' THEN
         dFechaTipoCambio := DateToStr(pAPli.DameFechaEmpresaDia('D000'))
      ELSE
         dFechaTipoCambio := sFFin;

      QrDiasCartVda.vlCapExigDlls:= 0;  QrDiasCartVda.vlCapNoExigdlls:= 0;   QrDiasCartVda.vlIntExigDlls:= 0;  QrDiasCartVda.vlTotalDlls:= 0;  QrDiasCartVda.vlImpGarDlls:= 0;
      QrDiasCartVda.vlCapExigPesos:= 0; QrDiasCartVda.vlCapNoExigPesos:= 0;  QrDiasCartVda.vlIntExigPesos:= 0; QrDiasCartVda.vlTotalPesos:= 0; QrDiasCartVda.vlImpGarPesos:= 0;
      QrDiasCartVda.vlCapExigUdis:= 0;  QrDiasCartVda.vlCapNoExigUdis:= 0;   QrDiasCartVda.vlIntExigUdis:= 0;  QrDiasCartVda.vlTotalUdis:= 0;  QrDiasCartVda.vlImpGarUdis:= 0;


      IF sTipoCambio = 'FM' THEN Begin
         if  IncMonth(StrToDate('01/'+FormatDateTime('MM/YYYY',StrToDate(dFechaTipoCambio))),1)- 1 = StrToDate(dFechaTipoCambio)  then
         begin
             if ValidaFecha (StrToDate(dFechaTipoCambio),pAPli) = 0 then
                 QrDiasCartVda.vgTCambioMes :=  ObtTipoCambio( FechaHabil(FechaHabil(StrToDate(dFechaTipoCambio),pAPli ),pAPli ),
                                                               IntToStr ( 840 ) ,
                                                               pAPli.DataBaseName, pAPli.SessionName)
             else
                 QrDiasCartVda.vgTCambioMes :=  ObtTipoCambio( FechaHabil(StrToDate(dFechaTipoCambio),pAPli ),
                                                               IntToStr ( 840 ) ,
                                                               pAPli.DataBaseName, pAPli.SessionName);

             QrDiasCartVda.vgTCambioUDIS := ObtTipoCambio( StrToDate(dFechaTipoCambio),
                                                           IntToStr ( 800 ) ,
                                                           pAPli.DataBaseName, pAPli.SessionName);
         end
         else
         begin
             if ValidaFecha (StrToDate(dFechaTipoCambio),pAPli) = 0 then
                 QrDiasCartVda.vgTCambioMes :=  ObtTipoCambio( FechaHabil(FechaHabil(StrToDate('01/'+FormatDateTime('MM/YYYY',StrToDate(dFechaTipoCambio))) - 1,pAPli ),pAPli ),
                                                               IntToStr ( 840 ) ,
                                                               pAPli.DataBaseName, pAPli.SessionName)
             else
                 QrDiasCartVda.vgTCambioMes :=  ObtTipoCambio( FechaHabil(StrToDate('01/'+FormatDateTime('MM/YYYY',StrToDate(dFechaTipoCambio))) - 1,pAPli ),
                                                               IntToStr ( 840 ) ,
                                                               pAPli.DataBaseName, pAPli.SessionName);

             QrDiasCartVda.vgTCambioUDIS := ObtTipoCambio( StrToDate('01/'+FormatDateTime('MM/YYYY',StrToDate(dFechaTipoCambio))) - 1,
                                                           IntToStr ( 800 ) ,
                                                           pAPli.DataBaseName, pAPli.SessionName);
         end;
      end
      else Begin
         QrDiasCartVda.vgTCambioMes :=  ObtTipoCambio( FechaHabil(FechaHabil(StrToDate(dFechaTipoCambio),pAPli ),pAPli),
                                                       IntToStr ( 840 ) ,
                                                       pAPli.DataBaseName, pAPli.SessionName);

         QrDiasCartVda.vgTCambioUDIS := ObtTipoCambio( StrToDate(dFechaTipoCambio),
                                                       IntToStr ( 800 ) ,
                                                       pAPli.DataBaseName, pAPli.SessionName);
      end;

      QrDiasCartVda.QRInterEncabezado1.Titulo2:='Rango de ' + sRangoIni + ' a ' + sRangoFin;

       If (strtoint(sRangoIni) > 0) AND ( strtoint(sRangoFin) = 0) Then
            QrDiasCartVda.QRInterEncabezado1.Titulo2:='Rango de ' + sRangoIni + ' a ...';



     //<DIGITALIZACION DE REPORTES>
      sDigDocFileName := sDigDocFileName  + '_' + FormatDateTime( 'DD_MM_YYYY', StrToDate(sFFin))
                         + '_' + sProducto  + '_' + sMoneda    + '_' +  sAcreditado   + '_' +
                         sEmpresa + '_' + sSucursal;

      if (Trim(sAcreditado)<>'')Then
         QrDiasCartVda.QRInterEncabezado1.Titulo1:= QrDiasCartVda.QRInterEncabezado1.Titulo1 + ' Por Acreditado '
      else If (Trim(sDisp)<>'')Then
         QrDiasCartVda.QRInterEncabezado1.Titulo1:= QrDiasCartVda.QRInterEncabezado1.Titulo1 + ' Por Crédito '
      else If (Trim(sProducto)<>'')Then
         QrDiasCartVda.QRInterEncabezado1.Titulo1:= QrDiasCartVda.QRInterEncabezado1.Titulo1 + ' Por Producto de Crédito ' + sProducto
      else If (Trim(sMoneda)<>'')Then
         QrDiasCartVda.QRInterEncabezado1.Titulo1:= QrDiasCartVda.QRInterEncabezado1.Titulo1 + ' Por Moneda ' +  sMoneda
      else If (Trim(sCatMinimo)<>'')Then
         QrDiasCartVda.QRInterEncabezado1.Titulo1:= QrDiasCartVda.QRInterEncabezado1.Titulo1 + ' Por Catálogo Mínimo ' +  sCatMinimo
      else If (Trim(sMercObj)<>'')Then
         QrDiasCartVda.QRInterEncabezado1.Titulo1:= QrDiasCartVda.QRInterEncabezado1.Titulo1 + ' Por Área de Negocio ' +  sMercObj
      else If (Trim(sTipGar)<>'')Then
         QrDiasCartVda.QRInterEncabezado1.Titulo1:= QrDiasCartVda.QRInterEncabezado1.Titulo1 + ' Por Tipo de Garantía ' +  sTipGar ;

      if TCartera = '0' Then
         QrDiasCartVda.QRInterEncabezado1.Titulo1:= QrDiasCartVda.QRInterEncabezado1.Titulo1 + ' (Bancaria)'
      else
         QrDiasCartVda.QRInterEncabezado1.Titulo1:= QrDiasCartVda.QRInterEncabezado1.Titulo1 + ' (NO Bancaria)';
      //end if;


      QrDiasCartVda.qyDiasCartVda.DatabaseName := pApli.DataBaseName;
      QrDiasCartVda.qyDiasCartVda.SessionName := pApli.SessionName;

      QrDiasCartVda.qyDiasCartVda.Active:=False;
      QrDiasCartVda.qyDiasCartVda.SQL.Text:= QrDiasCartVda.FormaQuery(sFFin, sAcreditado, sDisp, sContrato, sMercObj,
                                                                  sProducto, sEmpresa, sSucursal, sMoneda, sCatMinimo,sTipGar,
                                                                  sRangoIni, sRangoFin,  TCartera);

      QrDiasCartVda.qyDiasCartVda.SQL.SaveToFile('c:\DiasCartVda.txt');
      QrDiasCartVda.qyDiasCartVda.Active:=True;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrDiasCartVda.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F, QrDiasCartVda.QRInterEncabezado1.Titulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F, #09#09#09#09#09#09#09#09#09#09#09 + 'CAPITAL'+ #09#09 + 'INTERES' +#09#09#09#09#09#09#09#09#09 +'GARANTIA'+ #09);
         Writeln(F,
             'Clave Moneda'+ #09 +
             'Desc. Moneda'+ #09 +
             'Tipo de Cambio'+ #09 +
             'Id. Acreditado ' +#09 +
             'Nombre Acred.'+ #09 +
             'Num. Autorización'+ #09 +
             'Id. Crédito'+#09 +
             'Fecha Traspaso Vencido' +#09 +
             'Número Dias Vencido'+ #09 +
             'Número Periodo'+ #09 +
//             'Fecha de Vencimiento' +  #09+
             'Fecha Ultimo Adeudo' +  #09+
             'Imp. Cap. Exigible' +  #09 +
             'Imp. Cap. No Exigible' +  #09 +
             'Imp. Int. Exigible'+ #09 +
             'Total'+ #09 +
             'Clave Producto' +  #09 +
             'Desc. Producto' +  #09+
             'Clave Cat. Mínimo' +  #09 +
             'Desc. Cat. Mínimo' +  #09 +
             'Id. Prom. Admón.'+ #09 +
             'Nombre Prom. Admón.'+ #09 +
             'Gar. Ejercida' +  #09 +
             'Clave Tipo Gar. ' +  #09 +
             'Tipo Garantía'+ #09 +
             'Num. Periodo'+ #09 +
             'Fecha Aplica Gar.' +  #09 +
             'Imp. Garantía' +  #09+
             'Clave Presupuesto' +  #09+
             'Desc. Presupuesto'
             );
      End;

      //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
      If grOpcion = grPreview Then
         QrDiasCartVda.Preview
      Else if grOpcion = grPrint Then
         QrDiasCartVda.Print
      Else if grOpcion = grDigitaliza Then
      Begin
            QrDiasCartVda.InterDigDoc1.RootDir  := obtValorGpoCve( 'CONFRH', 'ROOTDIR',   pApli );
            QrDiasCartVda.InterDigDoc1.HostName := obtValorGpoCve( 'CONFRH', 'FTPSERVER', pApli );
            QrDiasCartVda.InterDigDoc1.UserName := obtValorGpoCve( 'CONFRH', 'USERNAME',  pApli );
            QrDiasCartVda.InterDigDoc1.Password := HexToStr( obtValorGpoCve( 'CONFRH', 'PASSWORD',  pApli ) );
            QrDiasCartVda.InterDigDoc1.SendTo   := ObtSendTo( sFFin );
            QrDiasCartVda.InterDigDoc1.FileName := sArchivoDig; // sDigDocFileName; //<LOLS 17FEB2006. DIGITALIZACION DE REPORTES>
            QrDiasCartVda.PrinterSettings.PrinterIndex := QrDiasCartVda.InterDigDoc1.SetPrinter;
            QrDiasCartVda.Print;
            bDigitalizaCorrecta := (QrDiasCartVda.InterDigDoc1.Compress and QrDiasCartVda.InterDigDoc1.SendFile);
            QrDiasCartVda.PrinterSettings.PrinterIndex := QrDiasCartVda.InterDigDoc1.RestorePrinter;
      End;
   Finally
//    ----------------------------------------------
//    Rastreo de digitalización
      if trim(sArchivoDig) <> '' then
      begin
         TRecolectaDatos.Recoleccion(FormatDateTime( 'dd/mm/yyyy', StrToDate(sFFin)),
         TRecolectaDatos.delString(sArchivoDig), 'CONFRH', pAPli.NomAplicacion,
         TRecolectaDatos.BooleanToByte(bDigitalizaCorrecta),pAPli);
      end;
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrDiasCartVda.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrDiasCartVda.ObtenQryPerIntercreditos(sFFin: String): String;
Var
    vlSql: String;
Begin

        vlSQL := '   SELECT *'+coCRLF +
                 '   FROM ( SELECT CI.ID_CREDITO,'+coCRLF +
	   	 '                 CP_IMP.NUM_PERIODO AS NUM_PER_CP, CP_IMP.F_VENCIMIENTO AS F_VTO_CP, CP_IMP.IMP_CAPITAL, CP_IMP.NUM_DIAS_VENCIDO AS NUM_DIAS_VDO_CP,'+coCRLF +
	   	 '	           CI_IMP.NUM_PERIODO AS NUM_PER_CI, CI_IMP.F_VENCIMIENTO AS F_VTO_CI, CI_IMP.IMP_INTERES_PER AS IMP_INTERES, CI_IMP.NUM_DIAS_VENCIDO AS NUM_DIAS_VDO_IN'+coCRLF +
	   	 '          FROM CRE_INTERES CI,'+coCRLF +
	   	 '	        ( SELECT cre_capital.ID_CREDITO, NUM_PERIODO, F_PROG_PAGO, '+coCRLF +//cre_capital.F_VENCIMIENTO,'+coCRLF +
                 //15/08/2011 SE PONDE EL CASE PARA QUE TOME LA FECHA DE INICIO DEL CREDITO EN CASO DE REESTRUCTURAS
                 '                       (CASE WHEN cre_credito.tipo_disposicion = ''DI'' THEN cre_capital.F_VENCIMIENTO'+coCRLF +
                 '                             WHEN (cre_credito.TIPO_DISPOSICION<>''DI'') AND (cre_credito.F_VALOR_CRED = cre_credito.F_TRASPASO_VENC) THEN cre_credito.F_VALOR_CRED '+coCRLF +
                 '                             WHEN (cre_credito.TIPO_DISPOSICION<>''DI'') AND (cre_credito.F_VALOR_CRED < cre_credito.F_TRASPASO_VENC) THEN (CASE WHEN cre_capital.F_VENCIMIENTO > TO_DATE('''+sFFin+''',''DD/MM/YYYY'') THEN cre_credito.F_TRASPASO_VENC '+coCRLF +
                 '                                                                                                                                            ELSE cre_capital.F_VENCIMIENTO '+coCRLF +
                 '                                                                                                                                            END)'+coCRLF +
                 '                     END) AS F_VENCIMIENTO, '+coCRLF +
                 //FIN - 15/08/2011
	   	 '	                F_PAGO,'+coCRLF +
	   	 '	                IMP_CAPITAL - IMP_PAGADO AS IMP_CAPITAL,'+coCRLF +
//	   	 '	                pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY'') , F_PAGO,F_PROG_PAGO,SIT_CAPITAL)AS NUM_DIAS_VENCIDO'+coCRLF +
                 '                           (CASE WHEN cre_credito.tipo_disposicion = ''DI'' THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cre_capital.f_pago, cre_capital.f_vencimiento, cre_capital.sit_capital)'+coCRLF +
                 '                                 WHEN (cre_credito.TIPO_DISPOSICION<>''DI'') AND (cre_credito.F_VALOR_CRED = cre_credito.F_TRASPASO_VENC) OR (cre_capital.F_VENCIMIENTO > TO_DATE('''+sFFin+''',''DD/MM/YYYY'')) THEN pkgcrcomun.stpfunobtdiasree( TO_DATE('''+sFFin+''',''DD/MM/YYYY''),cre_credito.f_traspaso_venc)'+coCRLF +
                 '                                 WHEN (cre_credito.TIPO_DISPOSICION<>''DI'') AND (cre_credito.F_VALOR_CRED < cre_credito.F_TRASPASO_VENC) THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cre_capital.f_pago, cre_capital.f_vencimiento, cre_capital.sit_capital)'+coCRLF +
                 '                        END) AS num_dias_vencido'+coCRLF +
                 '                from cre_capital, cre_credito, (SELECT DISTINCT ID_CREDITO, F_TRASPASO_VEN FROM ( SELECT ID_CREDITO, F_TRASPASO_VEN FROM CRE_PROV_DIARIA CHC'+coCRLF +
                 '                                   WHERE CHC.F_PROVISION = TO_DATE('''+sFFin+''',''DD/MM/YYYY'')'+coCRLF +
                 '                                   AND    CHC.F_TRASPASO_VEN IS NOT NULL '+coCRLF +
                 '                                   UNION SELECT ID_CREDITO, F_TRASPASO_VENC AS F_TRASPASO_VEN FROM CRE_CREDITO  '+coCRLF +
                 '                                         WHERE F_TRASPASO_VENC IS NOT NULL)) CHC'+coCRLF +
                 '                where  1 = 1'+coCRLF +
//		 '		  AND    SIT_CAPITAL <> ''CA'''+coCRLF +
		 '		  AND    SIT_CAPITAL NOT IN (''CA'',''LQ'',''TL'',''TI'',''TP'',''TA'') '+coCRLF +
                 '                AND    CRE_CREDITO.SIT_CREDITO IN (''AC'') '+coCRLF +
                 '                AND    cre_credito.id_credito = cre_capital.id_credito'+coCRLF +
                 '                AND    (f_pago is null or       imp_capital > imp_pagado)'+coCRLF +
                 '                AND    CHC.ID_CREDITO = crE_capital.ID_CREDITO'+coCRLF +
                 '               ) CP_IMP,'+coCRLF +
                 '               ( SELECT CI.ID_CREDITO, NUM_PERIODO, F_PROG_PAGO, F_PAGO, IMP_INTERES_PER - IMP_PAGADO AS IMP_INTERES_PER,'+coCRLF +
                 //15/08/2011 - SE PONDE EL CASE PARA QUE TOME LA FECHA DE INICIO DEL CREDITO EN CASO DE REESTRUCTURAS
//                  '                       CI.F_VENCIMIENTO, '+coCRLF +
                 '                       (CASE WHEN cc.tipo_disposicion = ''DI'' THEN ci.F_VENCIMIENTO'+coCRLF +
                 '                             WHEN (cc.TIPO_DISPOSICION <>''DI'') AND (cc.F_VALOR_CRED = cc.F_TRASPASO_VENC) THEN cc.F_VALOR_CRED '+coCRLF +
                 '                             WHEN (cc.TIPO_DISPOSICION <>''DI'') AND (cc.F_VALOR_CRED < cc.F_TRASPASO_VENC) THEN (CASE WHEN ci.F_VENCIMIENTO > TO_DATE('''+sFFin+''',''DD/MM/YYYY'') THEN cc.F_TRASPASO_VENC '+coCRLF +
                 '                                                                                                                       ELSE ci.F_VENCIMIENTO '+coCRLF +
                 '                                                                                                                        END)'+coCRLF +
                 '                     END) AS F_VENCIMIENTO, '+coCRLF +
                 //FIN - 15/08/2011
//                 '                        pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY'') , F_PAGO,F_PROG_PAGO,SIT_INTERES)AS NUM_DIAS_VENCIDO '+coCRLF +
                 '                           (CASE WHEN cc.tipo_disposicion = ''DI'' THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), ci.f_pago, ci.f_vencimiento, ci.sit_interes)'+coCRLF +
                 '                                 WHEN (cc.TIPO_DISPOSICION<>''DI'') AND (cc.F_VALOR_CRED = cc.F_TRASPASO_VENC) OR (ci.F_VENCIMIENTO > TO_DATE('''+sFFin+''',''DD/MM/YYYY'')) THEN pkgcrcomun.stpfunobtdiasree( TO_DATE('''+sFFin+''',''DD/MM/YYYY''),cc.f_traspaso_venc)'+coCRLF +
                 '                                 WHEN (cc.TIPO_DISPOSICION<>''DI'') AND (cc.F_VALOR_CRED < cc.F_TRASPASO_VENC) THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), ci.f_pago, ci.f_vencimiento, ci.sit_interes)'+coCRLF +
                 '                        END) AS num_dias_vencido '+coCRLF +
                 '                 FROM CRE_INTERES CI, cre_credito cc, '+coCRLF +
                 '                       (SELECT DISTINCT ID_CREDITO, F_TRASPASO_VEN FROM ( SELECT ID_CREDITO, F_TRASPASO_VEN FROM CRE_PROV_DIARIA CHC'+coCRLF +
                 '                                   WHERE CHC.F_PROVISION = TO_DATE('''+sFFin+''',''DD/MM/YYYY'')'+coCRLF +
                 '                                   AND    CHC.F_TRASPASO_VEN IS NOT NULL '+coCRLF +
                 '                                   UNION SELECT ID_CREDITO, F_TRASPASO_VENC AS F_TRASPASO_VEN FROM CRE_CREDITO  '+coCRLF +
                 '                                         WHERE F_TRASPASO_VENC IS NOT NULL)) CHC'+coCRLF +
                 '                where  1 = 1'+coCRLF +
                 '                 AND   SIT_INTERES = ''IM'' '+coCRLF +
                 '                 AND   CC.SIT_CREDITO IN (''AC'') '+coCRLF +
                 '                 AND   cc.id_credito = ci.id_credito'+coCRLF +
                 '                 AND   CHC.ID_CREDITO = CI.ID_CREDITO'+coCRLF +
                 '           	   ) CI_IMP'+coCRLF +
	   	 '	    WHERE CP_IMP.ID_CREDITO(+) = CI.ID_CREDITO'+coCRLF +
	   	 '	    AND CP_IMP.F_VENCIMIENTO(+) = CI.F_VENCIMIENTO'+coCRLF +
	   	 '	    AND CI_IMP.ID_CREDITO(+) = CI.ID_CREDITO'+coCRLF +
	   	 '	    AND CI_IMP.NUM_PERIODO(+) = CI.NUM_PERIODO'+coCRLF +
	   	 '	    )'+coCRLF ;
Result:= vlSQL;
End;

Function TQrDiasCartVda.ObtenQryPerICre(sFFin: String): String;
Var
    vlSql: String;
Begin
    vlSQL :=  ' SELECT *'+coCRLF +
             ' FROM ('+coCRLF +
             '      SELECT CI_IMP.ID_CREDITO,'+coCRLF +
             '             CI_IMP.NUM_PER_CP, CI_IMP.F_VTO_CP, CI_IMP.IMP_CAPITAL, CI_IMP.NUM_DIAS_VDO_CP,'+coCRLF +
             '             CI_IMP.NUM_PER_CI, CI_IMP.F_VTO_CI, CI_IMP.IMP_INTERES, CI_IMP.NUM_DIAS_VDO_IN'+coCRLF +
             '      FROM'+coCRLF +
             '        ( SELECT ID_CREDITO,'+coCRLF +
             '                 NUM_PERIODO AS NUM_PER_CP,F_VENCIMIENTO AS F_VTO_CP,IMP_CAPITAL,NUM_DIAS_VENCIDO AS NUM_DIAS_VDO_CP,'+coCRLF +
             '                 NULL AS NUM_PER_CI, NULL AS F_VTO_CI,NULL AS IMP_INTERES,NULL AS NUM_DIAS_VDO_IN'+coCRLF +
             '          from ('+coCRLF +
             '                SELECT ID_CREDITO, NUM_PERIODO, F_VENCIMIENTO,'+coCRLF +
             '                       MIN(F_PROG_PAGO) AS F_PROG_PAGO,'+coCRLF +
             '                       MAX(F_PAGO ) AS F_PAGO,'+coCRLF +
             '                       SUM(IMP_CAPITAL) AS IMP_CAPITAL,'+coCRLF +
             '                       MAX(NUM_DIAS_VENCIDO) AS NUM_DIAS_VENCIDO,SIT_CAPITAL'+coCRLF +
             '                FROM ( select cr_capital.ID_CREDITO, NUM_PERIODO, F_PROG_PAGO, '+coCRLF + //cr_capital.F_VENCIMIENTO,'+coCRLF +
                 //15/08/2011 - SE PONE EL CASE PARA QUE TOME LA FECHA DE INICIO DEL CREDITO EN CASO DE REESTRUCTURAS
             '                           (CASE WHEN cr_credito.tipo_disposicion = ''DI'' THEN cr_capital.F_VENCIMIENTO'+coCRLF +
             '                                 WHEN (cr_credito.TIPO_DISPOSICION<>''DI'') AND (cr_credito.F_INICIO = cr_credito.F_TRASPASO_VENC) THEN cr_credito.F_INICIO '+coCRLF +
             '                                 WHEN (cr_credito.TIPO_DISPOSICION<>''DI'') AND (cr_credito.F_INICIO < cr_credito.F_TRASPASO_VENC) THEN (CASE WHEN cr_capital.F_VENCIMIENTO > TO_DATE('''+sFFin+''',''DD/MM/YYYY'') THEN cr_credito.F_TRASPASO_VENC '+coCRLF +
             '                                                                                                                                              ELSE cr_capital.F_VENCIMIENTO '+coCRLF +
             '                                                                                                                                               END)'+coCRLF +
             '                        END) AS F_VENCIMIENTO, '+coCRLF +
                 //FIN - 15/08/2011
             '                              DECODE(F_VALOR_PAGO,NULL,F_PAGO,F_VALOR_PAGO) AS F_PAGO,'+coCRLF +
             '                              IMP_CAPITAL - IMP_PAGADO AS IMP_CAPITAL,'+coCRLF +
//             '                              DECODE(SIT_CAPITAL,''IM'',pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY'') , F_PAGO,F_PROG_PAGO,SIT_CAPITAL),0) AS NUM_DIAS_VENCIDO,'+coCRLF +
             '                           (CASE WHEN cr_credito.tipo_disposicion = ''DI'' THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cr_capital.f_pago, cr_capital.f_vencimiento, cr_capital.sit_capital)'+coCRLF +
             '                                 WHEN (cr_credito.TIPO_DISPOSICION<>''DI'') AND (cr_credito.F_INICIO = cr_credito.F_TRASPASO_VENC) OR (cr_capital.F_VENCIMIENTO > TO_DATE('''+sFFin+''',''DD/MM/YYYY'')) THEN pkgcrcomun.stpfunobtdiasree( TO_DATE('''+sFFin+''',''DD/MM/YYYY''),cr_credito.f_traspaso_venc)'+coCRLF +
             '                                 WHEN (cr_credito.TIPO_DISPOSICION<>''DI'') AND (cr_credito.F_INICIO < cr_credito.F_TRASPASO_VENC) THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cr_capital.f_pago, cr_capital.f_vencimiento, cr_capital.sit_capital)'+coCRLF +
             '                       END ) AS num_dias_vencido,'+coCRLF +
             '                              SIT_CAPITAL'+coCRLF +
             '                       from cr_capital, cr_credito, (SELECT ID_CREDITO FROM CR_HISTO_CRED CHC'+coCRLF +
             '                                         WHERE CHC.F_CIERRE = TO_DATE('''+sFFin+''',''DD/MM/YYYY'')'+coCRLF +
             '                                         AND    CHC.F_TRASPASO_VENC IS NOT NULL) CHC'+coCRLF +
             '                       where  1 = 1'+coCRLF +
             '                       AND    SIT_CAPITAL <> ''CA'''+coCRLF +
             '                       AND cr_credito.id_credito = cr_capital.id_credito'+coCRLF +
             '                       AND    (f_pago is null or       imp_capital > imp_pagado)'+coCRLF +
             '                       AND    CHC.ID_CREDITO = cr_capital.ID_CREDITO'+coCRLF +
             '                       union'+coCRLF +
             '                       select cr_finan_adic.ID_CREDITO, NUM_PERIODO, F_PROG_PAGO, ' +coCRLF + //cr_finan_adic.F_VENCIMIENTO,'+coCRLF +
                 //15/08/2011 - SE PONDE EL CASE PARA QUE TOME LA FECHA DE INICIO DEL CREDITO EN CASO DE REESTRUCTURAS
             '                           (CASE WHEN cr_credito.tipo_disposicion = ''DI'' THEN cr_finan_adic.F_VENCIMIENTO'+coCRLF +
             '                                 WHEN (cr_credito.TIPO_DISPOSICION <>''DI'') AND (cr_credito.F_INICIO = cr_credito.F_TRASPASO_VENC) THEN cr_credito.F_INICIO '+coCRLF +
             '                                 WHEN (cr_credito.TIPO_DISPOSICION <>''DI'') AND (cr_credito.F_INICIO < cr_credito.F_TRASPASO_VENC) THEN (CASE WHEN cr_finan_adic.F_VENCIMIENTO > TO_DATE('''+sFFin+''',''DD/MM/YYYY'') THEN cr_credito.F_TRASPASO_VENC '+coCRLF +
             '                                                                                                                                               ELSE cr_finan_adic.F_VENCIMIENTO '+coCRLF +
             '                                                                                                                                                END)'+coCRLF +
             '                                 ELSE cr_credito.F_INICIO END) AS F_VENCIMIENTO, '+coCRLF +
                 //FIN 15/08/2011
             '                              DECODE(F_VALOR_PAGO,NULL,DECODE(F_PAGO,NULL,F_PROG_PAGO,F_PAGO),F_VALOR_PAGO) AS F_PAGO_FN,'+coCRLF +
             '                              IMP_FINAN_ADIC - (IMP_PAGADO + NVL(FINCO.IMP_CAP_CO,0)) AS IMP_CAPITAL,'+coCRLF +
//             '                              DECODE(SIT_FINAN_ADIC,''IM'',pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY'') , F_PAGO,F_PROG_PAGO,SIT_FINAN_ADIC),0) AS NUM_DIAS_VENCIDO,'+coCRLF +
             '                                (CASE WHEN cr_credito.tipo_disposicion = ''DI'' THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cr_finan_adic.f_pago, cr_finan_adic.f_vencimiento, cr_finan_adic.sit_finan_adic)'+coCRLF +
             '                                      WHEN (cr_credito.TIPO_DISPOSICION <>''DI'') AND (cr_credito.F_INICIO = cr_credito.F_TRASPASO_VENC) OR (cr_finan_adic.F_VENCIMIENTO > TO_DATE('''+sFFin+''',''DD/MM/YYYY'')) THEN pkgcrcomun.stpfunobtdiasree( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cr_credito.f_traspaso_venc)'+coCRLF +
             '                                      WHEN (cr_credito.TIPO_DISPOSICION <>''DI'') AND (cr_credito.F_INICIO < cr_credito.F_TRASPASO_VENC) THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cr_finan_adic.f_pago, cr_finan_adic.f_vencimiento, cr_finan_adic.sit_finan_adic)'+coCRLF +
             '                             END) AS num_dias_vencido,'+coCRLF +
             '                              SIT_FINAN_ADIC AS SIT_CAPITAL'+coCRLF +
             '                       from  cr_finan_adic, cr_credito, (SELECT ID_CREDITO FROM CR_HISTO_CRED CHC'+coCRLF +
             '                                             WHERE CHC.F_CIERRE = TO_DATE('''+sFFin+''',''DD/MM/YYYY'')'+coCRLF +
             '                                             AND    CHC.F_TRASPASO_VENC IS NOT NULL) CHC,'+coCRLF +
             '                                            (SELECT CT.ID_CREDITO, CT.ID_PERIODO, SUM(CDT.IMP_CONCEPTO) AS IMP_CAP_CO'+coCRLF +
             '                                             FROM   CR_HISTO_CRED CC,'+coCRLF +
             '                                             	  CR_TRANSACCION CT,'+coCRLF +
             '                                                    CR_DET_TRANSAC CDT'+coCRLF +
             '                                             WHERE  CC.F_CIERRE = TO_DATE('''+sFFin+''',''DD/MM/YYYY'')'+coCRLF +
             '                                             AND    CC.F_TRASPASO_VENC IS NOT NULL'+coCRLF +
             '                                             AND    CT.ID_CREDITO = CC.ID_CREDITO'+coCRLF +
             '                                             AND    CT.F_OPERACION > CC.F_TRASPASO_VENC + 5'+coCRLF +
             '                                             AND    CT.CVE_OPERACION = ''AFIADI'''+coCRLF +
             '                                             AND    CT.SIT_TRANSACCION = ''AC'''+coCRLF +
             '                                             AND    CT.ID_TRANS_CANCELA IS NULL'+coCRLF +
             '                                             AND    CDT.ID_TRANSACCION = CT.ID_TRANSACCION'+coCRLF +
             '                                             AND    CDT.CVE_CONCEPTO = ''IMPBRU'''+coCRLF +
             '                                             GROUP BY CT.ID_CREDITO, CT.ID_PERIODO ) FINCO'+coCRLF +
             '                       where  1 = 1'+coCRLF +
             '                       AND    SIT_FINAN_ADIC <> ''CA'''+coCRLF +
             '                       AND    cr_credito.id_credito = cr_finan_adic.id_credito '+coCRLF +
             '                       AND    (f_pago is null or       imp_finan_adic > imp_pagado)'+coCRLF +
             '                       AND    CHC.ID_CREDITO = cr_finan_adic.ID_CREDITO'+coCRLF +
             '                       AND    FINCO.ID_CREDITO (+)= cr_finan_adic.ID_CREDITO'+coCRLF +
             '                       AND    FINCO.ID_PERIODO (+)= cr_finan_adic.NUM_PERIODO'+coCRLF +
             '                       )'+coCRLF +
             '                GROUP BY ID_CREDITO, NUM_PERIODO, F_VENCIMIENTO,SIT_CAPITAL'+coCRLF +
             '                     )'+coCRLF +

             '                UNION'+coCRLF +
             
             '                SELECT CI.ID_CREDITO,'+coCRLF +
             '                       NULL AS NUM_PER_CP,	NULL AS F_VTO_CP, NULL AS IMP_CAPITAL,NULL AS NUM_DIAS_VDO_CP,'+coCRLF +
                //15/08/2011 LINEA COMENTADA PARA CASE DE F_VENCIMIENTO
//             '                       NUM_PERIODO AS NUM_PER_CI, CI.F_VENCIMIENTO AS F_VTO_CI,(CI.IMP_INTERES - CI.IMP_PAGADO)IMP_INTERES,'+coCRLF +
             '                       NUM_PERIODO AS NUM_PER_CI, '+coCRLF +
                 //SE PONDE EL CASE PARA QUE TOME LA FECHA DE INICIO DEL CREDITO EN CASO DE REESTRUCTURAS
             '                      (CASE WHEN cr_credito.tipo_disposicion = ''DI'' THEN ci.F_VENCIMIENTO'+coCRLF +
             '                            WHEN (cr_credito.TIPO_DISPOSICION <>''DI'') AND (cr_credito.F_INICIO = cr_credito.F_TRASPASO_VENC) THEN cr_credito.F_INICIO '+coCRLF +
             '                            WHEN (cr_credito.TIPO_DISPOSICION <>''DI'') AND (cr_credito.F_INICIO < cr_credito.F_TRASPASO_VENC) THEN (CASE WHEN ci.F_VENCIMIENTO > TO_DATE('''+sFFin+''',''DD/MM/YYYY'') THEN cr_credito.F_TRASPASO_VENC '+coCRLF +
             '                                                                                                                                               ELSE ci.F_VENCIMIENTO '+coCRLF +
             '                                                                                                                                               END)'+coCRLF +
             '                    END) AS F_VTO_CI, '+coCRLF +
             '                      (CI.IMP_INTERES - CI.IMP_PAGADO)IMP_INTERES,'+coCRLF +
                //FIN 15/08/2011 LINEA COMENTADA PARA CASE DE F_VENCIMIENTO
//             '                       DECODE(SIT_INTERES,''IM'',pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY'') , F_PAGO,F_PROG_PAGO,SIT_INTERES),0) AS NUM_DIAS_VDO_IN'+coCRLF +
             '                           (CASE WHEN cr_credito.tipo_disposicion = ''DI'' THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), CI.f_pago, CI.f_vencimiento, CI.sit_interes)'+coCRLF +
             '                                 WHEN (cr_credito.TIPO_DISPOSICION <>''DI'') AND (cr_credito.F_INICIO = cr_credito.F_TRASPASO_VENC) OR (ci.F_VENCIMIENTO > TO_DATE('''+sFFin+''',''DD/MM/YYYY'')) THEN pkgcrcomun.stpfunobtdiasree( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cr_credito.f_traspaso_venc)'+coCRLF +
             '                                 WHEN (cr_credito.TIPO_DISPOSICION <>''DI'') AND (cr_credito.F_INICIO < cr_credito.F_TRASPASO_VENC) THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), CI.f_pago, CI.f_vencimiento, CI.sit_interes)'+coCRLF +
             '                        END ) AS num_dias_vencido'+coCRLF +
             '                FROM CR_INTERES CI, cr_credito, (SELECT ID_CREDITO FROM CR_HISTO_CRED CHC'+coCRLF +
             '                                     WHERE CHC.F_CIERRE = TO_DATE('''+sFFin+''',''DD/MM/YYYY'')'+coCRLF +
             '                                     AND    CHC.F_TRASPASO_VENC IS NOT NULL) CHC'+coCRLF +
             '                WHERE  1 = 1'+coCRLF +
             '                AND    SIT_INTERES = ''IM'''+coCRLF +
             '                AND    cr_credito.id_credito = ci.id_credito'+coCRLF +
             '                AND    CHC.ID_CREDITO = CI.ID_CREDITO'+coCRLF +
             '              ) CI_IMP'+coCRLF +
             '       ) WHERE NUM_PER_CP IS NOT NULL OR NUM_PER_CI IS NOT NULL'+coCRLF ;


Result:= vlSQL;
End;

Function TQrDiasCartVda.ObtenQryGarantia(sFFin: String): String;
Var
    vlSql: String;
Begin
        vlSQL := '  SELECT ''V'' EJERCIDA, GA.*'+coCRLF +
                 '  FROM ( SELECT FG_I.ID_CREDITO, FG_I.ID_PERIODO, FG_I.F_OPERACION, (NVL(FG_I.IMP_CONCEPTO,0) - NVL(FG_D.IMP_CONCEPTO,0)) AS IMP_OPERACION'+coCRLF +
                 '         FROM ( SELECT CC.ID_CREDITO, CT.ID_PERIODO,MAX(F_OPERACION) AS F_OPERACION,SUM(CDT.IMP_CONCEPTO) AS IMP_CONCEPTO'+coCRLF +
                 '                FROM ( SELECT * FROM CR_TRANSACCION'+coCRLF +
                 '                       WHERE SIT_TRANSACCION = ''AC'' '+coCRLF +
                 '                         AND ID_TRANS_CANCELA IS NULL AND F_VALOR <=  TO_DATE('' '+ sFFin + ' '',''DD/MM/YYYY'')'+coCRLF +
                 '                     ) CT,'+coCRLF +
                 '                     ( SELECT * FROM CR_DET_TRANSAC WHERE CVE_CONCEPTO = ''IMPBRU'') CDT,'+coCRLF +
                 '                     ( SELECT * FROM CR_CREDITO'+coCRLF +
                 '                       WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_HISTO_CRED'+coCRLF +
                 '                                            WHERE F_CIERRE =  TO_DATE('''+sFFin+''',''DD/MM/YYYY'')'+coCRLF +
                 '                                           )'+coCRLF +
                 '                         AND ID_CONTRATO IN (SELECT ID_CONTRATO FROM CONTRATO WHERE ID_EMPRESA =  2)'+coCRLF +
                 '                     ) CC,'+coCRLF +
                 '                     ( select ID_SOLICITUD, ID_CREDITO FROM CR_GA_SOL_FEGA CGF'+coCRLF +
                 '                      UNION'+coCRLF +
                 '                       select ID_SOLICITUD, ID_CREDITO FROM CR_GA_SOL_NAFIN CGP'+coCRLF +
                 '                     )CGSF,'+coCRLF +
                 '                     CR_XTRANSACCION CXT,'+coCRLF +
                 '                     CONTRATO CTTO,'+coCRLF +
                 '                     CR_CONTRATO CTO,'+coCRLF +
                 '                     CR_CVE_OPERACION CCO'+coCRLF +
                 '                WHERE CCO.CVE_PARAMETRO  IN  (''PGCPGF'', ''PGCPGP'',''PGFNGF'',''PGFNGP'')'+coCRLF +
                 '                  AND CT.ID_CREDITO      = CC.ID_CREDITO         AND CT.CVE_OPERACION   = CCO.CVE_OPERACION'+coCRLF +
                 '                  AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION     AND CDT.CVE_OPERACION  = CT.CVE_OPERACION'+coCRLF +
                 '                  AND CXT.ID_SOLICITUD   = CGSF.ID_SOLICITUD     AND CXT.ID_TRANSACCION = CT.ID_TRANSACCION'+coCRLF +
                 '                  AND CGSF.ID_CREDITO    = CC.ID_CREDITO         AND CTTO.ID_CONTRATO   = CC.ID_CONTRATO'+coCRLF +
                 '                  AND CTO.ID_CONTRATO    = CC.ID_CONTRATO        AND CTO.FOL_CONTRATO   = CC.FOL_CONTRATO'+coCRLF +
                 '                  AND CCO.CVE_PRODUCTO   = CTO.CVE_PRODUCTO_CRE  AND CCO.CVE_MONEDA     = CTTO.CVE_MONEDA'+coCRLF +
                 '                GROUP BY CC.ID_CREDITO, CT.ID_PERIODO'+coCRLF +
                 '              )FG_I,'+coCRLF +
                 '              ( SELECT CC.ID_CREDITO, CT.ID_PERIODO,  NULL AS F_OPERACION, SUM(CDT.IMP_CONCEPTO) AS IMP_CONCEPTO'+coCRLF +
                 '                FROM ( SELECT * FROM CR_TRANSACCION'+coCRLF +
                 '              	    WHERE SIT_TRANSACCION = ''AC'''+coCRLF +
                 '                	      AND ID_TRANS_CANCELA IS NULL AND F_VALOR <= TO_DATE('''+sFFin+''',''DD/MM/YYYY'')'+coCRLF +
                 '              	  ) CT, '+coCRLF +
                 '                     ( SELECT * FROM CR_DET_TRANSAC WHERE CVE_CONCEPTO = ''IMPBRU'') CDT,'+coCRLF +
                 '                     ( select ID_SOLICITUD, ID_CREDITO FROM CR_GA_SOL_FEGA CGF'+coCRLF +
                 '                     UNION'+coCRLF +
                 '                       select ID_SOLICITUD, ID_CREDITO FROM CR_GA_SOL_NAFIN CGP'+coCRLF +
                 '                     )CGSF,'+coCRLF +
                 '                     CR_XTRANSACCION CXT,'+coCRLF +
                 '                     CONTRATO CTTO,'+coCRLF +
                 '                     CR_CONTRATO CTO,'+coCRLF +
                 '                     ( SELECT * FROM CR_CREDITO'+coCRLF +
                 '                       WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_HISTO_CRED WHERE F_CIERRE = TO_DATE('''+sFFin+''',''DD/MM/YYYY''))'+coCRLF +
                 '                         AND ID_CONTRATO IN (SELECT ID_CONTRATO FROM CONTRATO WHERE ID_EMPRESA =  2)'+coCRLF +
                 '                     ) CC,'+coCRLF +
                 '                     CR_CVE_OPERACION CCO'+coCRLF +
                 '                WHERE CCO.CVE_PARAMETRO  IN (''RCGFCP'', ''RCGPCP'',''RCGFFN'',''RCGPFN'')'+coCRLF +
                 '                  AND CT.ID_CREDITO      = CC.ID_CREDITO         AND CT.CVE_OPERACION = CCO.CVE_OPERACION'+coCRLF +
                 '                  AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION     AND CDT.CVE_OPERACION = CT.CVE_OPERACION'+coCRLF +
                 '                  AND CXT.ID_TRANSACCION = CT.ID_TRANSACCION     AND CXT.ID_SOLICITUD = CGSF.ID_SOLICITUD'+coCRLF +
                 '                  AND CC.ID_CREDITO      = CGSF.ID_CREDITO       AND CTTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF +
                 '                  AND CTO.ID_CONTRATO    = CC.ID_CONTRATO        AND CTO.FOL_CONTRATO = CC.FOL_CONTRATO'+coCRLF +
                 '                  AND CCO.CVE_PRODUCTO   = CTO.CVE_PRODUCTO_CRE  AND CCO.CVE_MONEDA  = CTTO.CVE_MONEDA'+coCRLF +
                 '                GROUP BY CC.ID_CREDITO, CT.ID_PERIODO'+coCRLF +
                 '              ) FG_D'+coCRLF +
                 '         WHERE FG_D.ID_CREDITO (+)= FG_I.ID_CREDITO'+coCRLF +
                 '           AND FG_D.ID_PERIODO (+)= FG_I.ID_PERIODO'+coCRLF +
                 '       )GA'+coCRLF;
Result:= vlSQL;
End;

Function TQrDiasCartVda.ObtenQryGarantiaIN(sFFin: String): String;
Var
    vlSql: String;
Begin

        vlSQL := '  SELECT ''V'' EJERCIDA, GA.*'+coCRLF +
                 '  FROM ( SELECT FG_I.ID_CREDITO, FG_I.ID_PERIODO, FG_I.F_OPERACION, (NVL(FG_I.IMP_CONCEPTO,0) - NVL(FG_D.IMP_CONCEPTO,0)) AS IMP_OPERACION'+coCRLF +
                 '         FROM ( SELECT CC.ID_CREDITO, CT.ID_PERIODO,MAX(F_OPERACION) AS F_OPERACION,SUM(CDT.IMP_CONCEPTO) AS IMP_CONCEPTO'+coCRLF +
                 '                FROM ( SELECT * FROM CR_TRANSACCION'+coCRLF +
                 '                       WHERE SIT_TRANSACCION = ''AC'' '+coCRLF +
                 '                         AND ID_TRANS_CANCELA IS NULL AND F_VALOR <=  TO_DATE('' '+ sFFin + ' '',''DD/MM/YYYY'')'+coCRLF +
                 '                     ) CT,'+coCRLF +
                 '                     ( SELECT * FROM CR_DET_TRANSAC WHERE CVE_CONCEPTO = ''IMPBRU'') CDT,'+coCRLF +
                 '                     ( SELECT * FROM CR_CREDITO'+coCRLF +
                 '                       WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_HISTO_CRED'+coCRLF +
                 '                                            WHERE F_CIERRE =  TO_DATE('''+sFFin+''',''DD/MM/YYYY'')'+coCRLF +
                 '                                           )'+coCRLF +
                 '                         AND ID_CONTRATO IN (SELECT ID_CONTRATO FROM CONTRATO WHERE ID_EMPRESA =  2)'+coCRLF +
                 '                     ) CC,'+coCRLF +
                 '                     ( select ID_SOLICITUD, ID_CREDITO FROM CR_GA_SOL_FEGA CGF'+coCRLF +
                 '                      UNION'+coCRLF +
                 '                       select ID_SOLICITUD, ID_CREDITO FROM CR_GA_SOL_NAFIN CGP'+coCRLF +
                 '                     )CGSF,'+coCRLF +
                 '                     CR_XTRANSACCION CXT,'+coCRLF +
                 '                     CONTRATO CTTO,'+coCRLF +
                 '                     CR_CONTRATO CTO,'+coCRLF +
                 '                     CR_CVE_OPERACION CCO'+coCRLF +
                 '                WHERE CCO.CVE_PARAMETRO  IN  (''PGINGF'', ''PGINGP'')'+coCRLF +
                 '                  AND CT.ID_CREDITO      = CC.ID_CREDITO         AND CT.CVE_OPERACION   = CCO.CVE_OPERACION'+coCRLF +
                 '                  AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION     AND CDT.CVE_OPERACION  = CT.CVE_OPERACION'+coCRLF +
                 '                  AND CXT.ID_SOLICITUD   = CGSF.ID_SOLICITUD     AND CXT.ID_TRANSACCION = CT.ID_TRANSACCION'+coCRLF +
                 '                  AND CGSF.ID_CREDITO    = CC.ID_CREDITO         AND CTTO.ID_CONTRATO   = CC.ID_CONTRATO'+coCRLF +
                 '                  AND CTO.ID_CONTRATO    = CC.ID_CONTRATO        AND CTO.FOL_CONTRATO   = CC.FOL_CONTRATO'+coCRLF +
                 '                  AND CCO.CVE_PRODUCTO   = CTO.CVE_PRODUCTO_CRE  AND CCO.CVE_MONEDA     = CTTO.CVE_MONEDA'+coCRLF +
                 '                GROUP BY CC.ID_CREDITO, CT.ID_PERIODO'+coCRLF +
                 '              )FG_I,'+coCRLF +
                 '              ( SELECT CC.ID_CREDITO, CT.ID_PERIODO,  NULL AS F_OPERACION, SUM(CDT.IMP_CONCEPTO) AS IMP_CONCEPTO'+coCRLF +
                 '                FROM ( SELECT * FROM CR_TRANSACCION'+coCRLF +
                 '              	    WHERE SIT_TRANSACCION = ''AC'''+coCRLF +
                 '                	      AND ID_TRANS_CANCELA IS NULL AND F_VALOR <= TO_DATE('''+sFFin+''',''DD/MM/YYYY'')'+coCRLF +
                 '              	  ) CT, '+coCRLF +
                 '                     ( SELECT * FROM CR_DET_TRANSAC WHERE CVE_CONCEPTO = ''IMPBRU'') CDT,'+coCRLF +
                 '                     ( select ID_SOLICITUD, ID_CREDITO FROM CR_GA_SOL_FEGA CGF'+coCRLF +
                 '                     UNION'+coCRLF +
                 '                       select ID_SOLICITUD, ID_CREDITO FROM CR_GA_SOL_NAFIN CGP'+coCRLF +
                 '                     )CGSF,'+coCRLF +
                 '                     CR_XTRANSACCION CXT,'+coCRLF +
                 '                     CONTRATO CTTO,'+coCRLF +
                 '                     CR_CONTRATO CTO,'+coCRLF +
                 '                     ( SELECT * FROM CR_CREDITO'+coCRLF +
                 '                       WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_HISTO_CRED WHERE F_CIERRE = TO_DATE('''+sFFin+''',''DD/MM/YYYY''))'+coCRLF +
                 '                         AND ID_CONTRATO IN (SELECT ID_CONTRATO FROM CONTRATO WHERE ID_EMPRESA =  2)'+coCRLF +
                 '                     ) CC,'+coCRLF +
                 '                     CR_CVE_OPERACION CCO'+coCRLF +
                 '                WHERE CCO.CVE_PARAMETRO  IN (''RCGFIN'', ''RCGPIN'')'+coCRLF +
                 '                  AND CT.ID_CREDITO      = CC.ID_CREDITO         AND CT.CVE_OPERACION = CCO.CVE_OPERACION'+coCRLF +
                 '                  AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION     AND CDT.CVE_OPERACION = CT.CVE_OPERACION'+coCRLF +
                 '                  AND CXT.ID_TRANSACCION = CT.ID_TRANSACCION     AND CXT.ID_SOLICITUD = CGSF.ID_SOLICITUD'+coCRLF +
                 '                  AND CC.ID_CREDITO      = CGSF.ID_CREDITO       AND CTTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF +
                 '                  AND CTO.ID_CONTRATO    = CC.ID_CONTRATO        AND CTO.FOL_CONTRATO = CC.FOL_CONTRATO'+coCRLF +
                 '                  AND CCO.CVE_PRODUCTO   = CTO.CVE_PRODUCTO_CRE  AND CCO.CVE_MONEDA  = CTTO.CVE_MONEDA'+coCRLF +
                 '                GROUP BY CC.ID_CREDITO, CT.ID_PERIODO'+coCRLF +
                 '              ) FG_D'+coCRLF +
                 '         WHERE FG_D.ID_CREDITO (+)= FG_I.ID_CREDITO'+coCRLF +
                 '           AND FG_D.ID_PERIODO (+)= FG_I.ID_PERIODO'+coCRLF +
                 '       )GA'+coCRLF;
Result:= vlSQL;
End;

Function TQrDiasCartVda.ObtenQryDatosIntercreditos(sFFin,TCartera: String): String;
Var
    vlSql: String;
Begin
        vlSQL := '      SELECT CPD.ID_CREDITO, CPD.F_TRASPASO_VEN, '+coCRLF +
	         '             CC.ID_CONTRATO, TO_CHAR(CTO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO, CSTB.DESC_SUB_TIPO AS DESC_PRODUCTO, '+coCRLF +
	         '             CTO.CVE_CAT_MIN AS CVE_CAT_MINIMO, CCM.DESC_CAT_MIN AS DESC_CAT_MINIMO, '+coCRLF +
	         '             CC.ID_PROM_ADM, '+coCRLF +
	         '             NVL(PER.NUM_PER_CP,PER.NUM_PER_CI) AS NUM_PERIODO,'+coCRLF +
	         '             NVL(PER.F_VTO_CP,PER.F_VTO_CI) AS F_VENCIMIENTO,'+coCRLF +
	         '             DECODE(PER.NUM_DIAS_VDO_CP,0,PER.NUM_DIAS_VDO_IN, NULL, PER.NUM_DIAS_VDO_IN,PER.NUM_DIAS_VDO_CP) AS NUM_DIAS_VDO,'+coCRLF +
	         '             PER.IMP_CAPITAL, '+coCRLF +
	         '             PER.IMP_INTERES, '+coCRLF +
	         '             NULL AS GAR_EJERCIDA,'+coCRLF +
	         '             NULL AS ID_PERIODO, '+coCRLF +
	         '             NULL AS F_APLICA_GAR, '+coCRLF +
	         '             0 AS IMP_GARANTIA,'+coCRLF +
	         '             NULL AS CVE_TIP_GARANTIA,'+coCRLF +
	         '             NULL AS TIPO_GARANTIA,'+coCRLF +
	         '             CC.CVE_PRESUPUESTO,'+coCRLF +
	         '             dias.NUM_MAX_VENCIDOS'+coCRLF +
	         '      FROM (SELECT DISTINCT ID_CREDITO, F_TRASPASO_VEN FROM ( SELECT ID_CREDITO, F_TRASPASO_VEN FROM CRE_PROV_DIARIA CHC'+coCRLF +
                 '                                   WHERE CHC.F_PROVISION = TO_DATE('''+sFFin+''',''DD/MM/YYYY'')'+coCRLF +
                 '                                   AND    CHC.F_TRASPASO_VEN IS NOT NULL '+coCRLF +
                 '                                   UNION SELECT ID_CREDITO, F_TRASPASO_VENC AS F_TRASPASO_VEN FROM CRE_CREDITO  '+coCRLF +
                 '                                         WHERE F_TRASPASO_VENC IS NOT NULL)) CPD, '+coCRLF +
	         '           CRE_CREDITO CC,'+coCRLF +
	         '           CRE_CONTRATO CTO, '+coCRLF +
	         '           CRE_SUB_TIP_BCO CSTB, '+coCRLF +
	         '           CRE_CAT_MINIMO CCM, '+coCRLF +
	         '           ( '+coCRLF +
                                     ObtenQryPerIntercreditos(sFFin)+coCRLF +
	         '           ) PER,'+coCRLF +
	         '           (select NUM_DIAS.ID_CREDITO, MAX(NUM_DIAS.NUM_DIAS_VENCIDO) AS NUM_MAX_VENCIDOS'+coCRLF +
	         '            from'+coCRLF +
//	         '               ( SELECT ID_CREDITO, pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY'') , F_PAGO,F_PROG_PAGO,SIT_CAPITAL) AS NUM_DIAS_VENCIDO'+coCRLF +
	         '               ( SELECT cre_capital.ID_CREDITO, (CASE WHEN cre_credito.tipo_disposicion = ''DI'' THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cre_capital.f_pago, cre_capital.f_vencimiento, cre_capital.sit_capital)'+coCRLF +
                 '                                                      WHEN (cre_credito.TIPO_DISPOSICION <>''DI'') AND (cre_credito.F_VALOR_CRED = cre_credito.F_TRASPASO_VENC) OR (cre_capital.F_VENCIMIENTO > TO_DATE('''+sFFin+''',''DD/MM/YYYY'')) THEN pkgcrcomun.stpfunobtdiasree( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cre_credito.f_traspaso_venc)'+coCRLF +
                 '                                                      WHEN (cre_credito.TIPO_DISPOSICION <>''DI'') AND (cre_credito.F_VALOR_CRED < cre_credito.F_TRASPASO_VENC) THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cre_capital.f_pago, cre_capital.f_vencimiento, cre_capital.sit_capital)'+coCRLF +
                 '             END) AS num_dias_vencido'+coCRLF +
	         '                 FROM cre_capital,cre_credito'+coCRLF +
	         '                 where SIT_CAPITAL = ''IM'''+coCRLF +
                 '                   AND cre_credito.id_credito = cre_capital.id_credito'+coCRLF +
	         '               union'+coCRLF +
//	         '                 SELECT ID_CREDITO, pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY'') , F_PAGO,F_PROG_PAGO,SIT_INTERES) AS NUM_DIAS_VENCIDO'+coCRLF +
	         '                 SELECT CI.ID_CREDITO, (CASE WHEN cc.tipo_disposicion = ''DI'' THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), CI.f_pago, CI.f_vencimiento, CI.sit_interes)'+coCRLF +
                 '                                             WHEN (cc.TIPO_DISPOSICION <>''DI'') AND (cc.F_VALOR_CRED = cc.F_TRASPASO_VENC) OR (CI.F_VENCIMIENTO > TO_DATE('''+sFFin+''',''DD/MM/YYYY'')) THEN pkgcrcomun.stpfunobtdiasree( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cc.f_traspaso_venc)'+coCRLF +
                 '                                             WHEN (cc.TIPO_DISPOSICION <>''DI'') AND (cc.F_VALOR_CRED < cc.F_TRASPASO_VENC) THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), CI.f_pago, CI.f_vencimiento, CI.sit_interes)'+coCRLF +
                 '                                     END) AS num_dias_vencido'+coCRLF +
	         '                 FROM CRE_INTERES CI, CRE_CREDITO CC'+coCRLF +
	         '                 WHERE SIT_INTERES = ''IM'''+coCRLF +
                 '                   AND CC.ID_CREDITO = CI.ID_CREDITO'+coCRLF +
	         '               )NUM_DIAS'+coCRLF +
	         '           group by  NUM_DIAS.ID_CREDITO'+coCRLF +
	         '           ) dias'+coCRLF +
	         '      WHERE CPD.ID_CREDITO      = CC.ID_CREDITO '+coCRLF +
	         '        AND CTO.ID_CONTRATO     = CC.ID_CONTRATO '+coCRLF;

        if TCartera = '0' then
           vlSQL := vlSQL + '                AND CTO.CVE_SUB_TIP_BCO NOT IN(50,59,60,118,119,120,121,51)'+coCRLF
        else
           vlSQL := vlSQL + '                AND CTO.CVE_SUB_TIP_BCO IN(50,59,60,118,119,120,121,51)'+coCRLF;
        //end if;

        vlSQL := vlSQL +
	         '        AND CTO.CVE_SUB_TIP_BCO = CSTB.CVE_SUB_TIP_BCO '+coCRLF +
	         '        AND CTO.CVE_SUB_TIP_BCO <> ''57'''+coCRLF +
	         '      AND CTO.CVE_CAT_MIN     = CCM.CVE_CAT_MIN'+coCRLF +
	         '      AND CC.ID_CREDITO       = PER.ID_CREDITO'+coCRLF+
	         '      and cc.id_credito       = dias.id_credito'+coCRLF;
        vlSQL := vlSQL +
                 '  UNION       SELECT CPD.ID_CREDITO, CPD.F_TRASPASO_VEN, '+coCRLF +
	         '             CC.ID_CONTRATO, TO_CHAR(CTO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO, CSTB.DESC_SUB_TIPO AS DESC_PRODUCTO, '+coCRLF +
	         '             CTO.CVE_CAT_MIN AS CVE_CAT_MINIMO, CCM.DESC_CAT_MIN AS DESC_CAT_MINIMO, '+coCRLF +
	         '             CC.ID_PROM_ADM, '+coCRLF +
	         '             MIN(NVL(PER.NUM_PER_CP,PER.NUM_PER_CI)) AS NUM_PERIODO,'+coCRLF +
	         '             MIN(NVL(PER.F_VTO_CP,PER.F_VTO_CI)) AS F_VENCIMIENTO,'+coCRLF +
	         '             MAX(DECODE(PER.NUM_DIAS_VDO_CP,0,PER.NUM_DIAS_VDO_IN, NULL, PER.NUM_DIAS_VDO_IN,PER.NUM_DIAS_VDO_CP)) AS NUM_DIAS_VDO,'+coCRLF +
	         '             0 AS IMP_CAPITAL, '+coCRLF +
	         '             0 AS IMP_INTERES, '+coCRLF +
	         '             NULL AS GAR_EJERCIDA,'+coCRLF +
	         '             NULL AS ID_PERIODO, '+coCRLF +
	         '             NULL AS F_APLICA_GAR, '+coCRLF +
	         '             0 AS IMP_GARANTIA,'+coCRLF +
	         '             NULL AS CVE_TIP_GARANTIA,'+coCRLF +
	         '             NULL AS TIPO_GARANTIA,'+coCRLF +
	         '             CC.CVE_PRESUPUESTO,'+coCRLF +
	         '             dias.NUM_MAX_VENCIDOS'+coCRLF +
	         '      FROM (SELECT DISTINCT ID_CREDITO, F_TRASPASO_VEN FROM ( SELECT ID_CREDITO, F_TRASPASO_VEN FROM CRE_PROV_DIARIA CHC'+coCRLF +
                 '                                   WHERE CHC.F_PROVISION = TO_DATE('''+sFFin+''',''DD/MM/YYYY'')'+coCRLF +
                 '                                   AND    CHC.F_TRASPASO_VEN IS NOT NULL '+coCRLF +
                 '                                   UNION SELECT ID_CREDITO, F_TRASPASO_VENC AS F_TRASPASO_VEN FROM CRE_CREDITO  '+coCRLF +
                 '                                         WHERE F_TRASPASO_VENC IS NOT NULL))  CPD, '+coCRLF +
	         '           CRE_CREDITO CC,'+coCRLF +
	         '           CRE_CONTRATO CTO, '+coCRLF +
	         '           CRE_SUB_TIP_BCO CSTB, '+coCRLF +
	         '           CRE_CAT_MINIMO CCM, '+coCRLF +
	         '           ( '+coCRLF +
                                     ObtenQryPerIntercreditos(sFFin)+coCRLF +
	         '           ) PER,'+coCRLF +
	         '           (select NUM_DIAS.ID_CREDITO, MAX(NUM_DIAS.NUM_DIAS_VENCIDO) AS NUM_MAX_VENCIDOS'+coCRLF +
	         '            from'+coCRLF +
//	         '               ( SELECT ID_CREDITO, pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY'') , F_PAGO,F_PROG_PAGO,SIT_CAPITAL) AS NUM_DIAS_VENCIDO'+coCRLF +
	         '               ( SELECT cre_capital.ID_CREDITO, (CASE WHEN cre_credito.tipo_disposicion = ''DI'' THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cre_capital.f_pago, cre_capital.f_vencimiento, cre_capital.sit_capital)'+coCRLF +
                 '                                                      WHEN (cre_credito.TIPO_DISPOSICION <>''DI'') AND (cre_credito.F_VALOR_CRED = cre_credito.F_TRASPASO_VENC) OR (cre_capital.F_VENCIMIENTO > TO_DATE('''+sFFin+''',''DD/MM/YYYY'')) THEN pkgcrcomun.stpfunobtdiasree( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cre_credito.f_traspaso_venc)'+coCRLF +
                 '                                                      WHEN (cre_credito.TIPO_DISPOSICION <>''DI'') AND (cre_credito.F_VALOR_CRED < cre_credito.F_TRASPASO_VENC) THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cre_capital.f_pago, cre_capital.f_vencimiento, cre_capital.sit_capital)'+coCRLF +
                 '                                               END) AS num_dias_vencido'+coCRLF +
	         '                 FROM cre_capital, cre_credito'+coCRLF +
	         '                 where SIT_CAPITAL = ''IM'''+coCRLF +
                 '                   AND cre_credito.id_credito = cre_capital.id_credito'+coCRLF +
	         '               union'+coCRLF +
//	         '                 SELECT ID_CREDITO, pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY'') , F_PAGO,F_PROG_PAGO,SIT_INTERES) AS NUM_DIAS_VENCIDO'+coCRLF +
	         '                 SELECT ci.ID_CREDITO, (CASE WHEN cc.tipo_disposicion = ''DI'' THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), ci.f_pago, ci.f_vencimiento, ci.sit_interes)'+coCRLF +
                 '                                             WHEN (cc.TIPO_DISPOSICION <>''DI'') AND (cc.F_VALOR_CRED = cc.F_TRASPASO_VENC) OR (ci.F_VENCIMIENTO > TO_DATE('''+sFFin+''',''DD/MM/YYYY'')) THEN pkgcrcomun.stpfunobtdiasree( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cc.f_traspaso_venc)'+coCRLF +
                 '                                             WHEN (cc.TIPO_DISPOSICION <>''DI'') AND (cc.F_VALOR_CRED < cc.F_TRASPASO_VENC) THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), ci.f_pago, ci.f_vencimiento, ci.sit_interes)'+coCRLF +
                 '                                     END) AS num_dias_vencido'+coCRLF +
	         '                 FROM CRE_INTERES CI, cre_credito cc'+coCRLF +
	         '                 WHERE SIT_INTERES = ''IM'''+coCRLF +
                 '                   AND CC.ID_CREDITO = CI.ID_CREDITO'+coCRLF +
	         '               )NUM_DIAS'+coCRLF +
	         '           group by  NUM_DIAS.ID_CREDITO'+coCRLF +
	         '           ) dias'+coCRLF +
	         '      WHERE CPD.ID_CREDITO      = CC.ID_CREDITO '+coCRLF +
	         '        AND CTO.ID_CONTRATO     = CC.ID_CONTRATO '+coCRLF;

        if TCartera = '0' then
           vlSQL := vlSQL + '                AND CTO.CVE_SUB_TIP_BCO NOT IN(50,59,60,118,119,120,121,51)'+coCRLF
        else
           vlSQL := vlSQL + '                AND CTO.CVE_SUB_TIP_BCO IN(50,59,60,118,119,120,121,51)'+coCRLF;
        //end if;

        vlSQL := vlSQL +
	         '        AND CTO.CVE_SUB_TIP_BCO = CSTB.CVE_SUB_TIP_BCO '+coCRLF +
	         '        AND CTO.CVE_SUB_TIP_BCO = ''57'''+coCRLF +
	         '      AND CTO.CVE_CAT_MIN     = CCM.CVE_CAT_MIN'+coCRLF +
	         '      AND CC.ID_CREDITO       = PER.ID_CREDITO'+coCRLF+
	         '      and cc.id_credito       = dias.id_credito'+coCRLF+
	         '      GROUP BY CPD.ID_CREDITO, CPD.F_TRASPASO_VEN,'+coCRLF +
	         '      CC.ID_CONTRATO, CTO.CVE_SUB_TIP_BCO, CSTB.DESC_SUB_TIPO,'+coCRLF +
	         '      CTO.CVE_CAT_MIN, CCM.DESC_CAT_MIN,'+coCRLF +
	         '      CC.ID_PROM_ADM,'+coCRLF +
	         '      CC.CVE_PRESUPUESTO,'+coCRLF +
	         '      dias.NUM_MAX_VENCIDOS'+coCRLF ;
 Result:= vlSQL;
End;

Function TQrDiasCartVda.ObtenQryDatosICre(sFFin,TCartera: String): String;
Var
    vlSql: String;
Begin
        vlSQL := ' ' +
'          SELECT CHC.ID_CREDITO, CC.F_TRASPASO_VENC AS F_TRASPASO_VEN,'+coCRLF +
	         '                     CC.ID_CONTRATO, CTO.CVE_PRODUCTO_CRE AS CVE_PRODUCTO, CP.DESC_C_PRODUCTO AS DESC_PRODUCTO,'+coCRLF +
	         '                     CP.CVE_CLAS_CONTAB AS CVE_CAT_MINIMO, CCM.DESC_CAT_MINIMO,'+coCRLF +
	         '                     CC.ID_PROM_ADM,'+coCRLF +
	         '                     NVL(PER.NUM_PER_CP,PER.NUM_PER_CI) AS NUM_PERIODO,'+coCRLF +
	         '                     NVL(PER.F_VTO_CP,PER.F_VTO_CI) AS F_VENCIMIENTO,'+coCRLF +
	         '                     DECODE(NVL(PER.NUM_DIAS_VDO_CP,0),0,PER.NUM_DIAS_VDO_IN, PER.NUM_DIAS_VDO_CP) AS NUM_DIAS_VDO,'+coCRLF +
	         '                     NVL(PER.IMP_CAPITAL,0) - NVL(GAR.IMP_OPERACION,0) AS IMP_CAPITAL,'+coCRLF +
	         '                     NVL(PER.IMP_INTERES,0) - NVL(GARI.IMP_OPERACION,0) AS IMP_INTERES,'+coCRLF +
	         '                     DECODE(NVL(GAR.EJERCIDA,''F''),''V'',''SI'',''NO'') AS GAR_EJERCIDA,'+coCRLF +
	         '                     GAR.ID_PERIODO,'+coCRLF +
	         '                     GAR.F_OPERACION AS F_APLICA_GAR,'+coCRLF +
	         '                     NVL(GAR.IMP_OPERACION,0) + NVL(GARI.IMP_OPERACION,0) AS IMP_GARANTIA,'+coCRLF +
	         '                     CC.CVE_OPERATIVA AS CVE_TIP_GARANTIA,'+coCRLF +
	         '                     ( select distinct(DESC_ENT_DES) from CR_FND_ENT_DES CFED, CR_FND_CREDITO CFC '+coCRLF +  // Se agrega distinct para registro único JFOF FEB - 2013
	         '                       WHERE  CFED.CVE_FND_ENT_DES = CFC.CVE_FND_ENT_DES'+coCRLF +
	         '                        and CFC.ID_CREDITO         = CC.ID_CREDITO'+coCRLF +
                 '                        and CFC.SIT_CREDITO = ''AC'') AS TIPO_GARANTIA,'+coCRLF + // Se agrega filtro de situación JFOF FEB-2013
	         '                     CP.CVE_PRESUPUESTO,'+coCRLF +
	         '                     dias.num_max_vencidos'+coCRLF +
	         '              FROM CR_HISTO_CRED CHC,'+coCRLF +
	         '                   CR_CREDITO CC,'+coCRLF +
	         '                   CR_CONTRATO CTO,'+coCRLF +
	         '                   CR_PRODUCTO CP,'+coCRLF +
	         '                   CR_CAT_MINIMO CCM,'+coCRLF +
	         ' 		     ( '+coCRLF +

                                     ObtenQryPerIcre(sFFin)+coCRLF +

	         '                   ) PER,'+coCRLF +
	         '                   (select NUM_DIAS.ID_CREDITO, MAX(NUM_DIAS.NUM_DIAS_VENCIDO) AS NUM_MAX_VENCIDOS'+coCRLF +
	         '                    from'+coCRLF +
//	         '                       ( SELECT ID_CREDITO, DECODE(SIT_CAPITAL,''IM'',pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY'') , F_PAGO,F_PROG_PAGO,SIT_CAPITAL),0) AS NUM_DIAS_VENCIDO'+coCRLF +
	         '                       ( SELECT cr_capital.ID_CREDITO, (CASE WHEN cr_credito.tipo_disposicion = ''DI'' THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cr_capital.f_pago, cr_capital.f_vencimiento, cr_capital.sit_capital)'+coCRLF +
                 '                                                             WHEN (cr_credito.TIPO_DISPOSICION <>''DI'') AND (cr_credito.F_INICIO = cr_credito.F_TRASPASO_VENC) OR (cr_capital.F_VENCIMIENTO > TO_DATE('''+sFFin+''',''DD/MM/YYYY'')) THEN pkgcrcomun.stpfunobtdiasree( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cr_credito.f_traspaso_venc)'+coCRLF +
                 '                                                             WHEN (cr_credito.TIPO_DISPOSICION <>''DI'') AND (cr_credito.F_INICIO < cr_credito.F_TRASPASO_VENC) THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cr_capital.f_pago, cr_capital.f_vencimiento, cr_capital.sit_capital)'+coCRLF +
                 '                                                   END ) AS num_dias_vencido'+coCRLF +
	         '                         FROM cr_capital, cr_credito '+coCRLF +
	         '                         where SIT_CAPITAL = ''IM'''+coCRLF +
                 '                           AND cr_credito.id_credito = cr_capital.id_credito'+coCRLF +
//	         '                         where 1 = 1'+coCRLF +
	         '                       union'+coCRLF +
//	         '                         SELECT ID_CREDITO, DECODE(SIT_FINAN_ADIC,''IM'',pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY'') , F_PAGO,F_PROG_PAGO,SIT_FINAN_ADIC),0) AS NUM_DIAS_VENCIDO'+coCRLF +
	         '                         SELECT CF.ID_CREDITO, (CASE WHEN cr_credito.tipo_disposicion = ''DI'' THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cf.f_pago, cf.f_vencimiento, cf.sit_finan_adic)'+coCRLF +
                 '                                                     WHEN (cr_credito.TIPO_DISPOSICION <>''DI'') AND (cr_credito.F_INICIO = cr_credito.F_TRASPASO_VENC) or (cf.F_VENCIMIENTO > TO_DATE('''+sFFin+''',''DD/MM/YYYY'')) THEN pkgcrcomun.stpfunobtdiasree( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cr_credito.f_traspaso_venc)'+coCRLF +
                 '                                                     WHEN (cr_credito.TIPO_DISPOSICION <>''DI'') AND (cr_credito.F_INICIO < cr_credito.F_TRASPASO_VENC) THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cf.f_pago, cf.f_vencimiento, cf.sit_finan_adic)'+coCRLF +
                 '                                             END ) AS num_dias_vencido'+coCRLF +
	         '                         FROM CR_FINAN_ADIC CF, cr_credito'+coCRLF +
	         '                         WHERE SIT_FINAN_ADIC = ''IM'''+coCRLF +
                 '                           AND cr_credito.id_credito = cf.id_credito'+coCRLF +
//	         '                         where 1 = 1'+coCRLF +
	         '                       union'+coCRLF +
//	         '                         SELECT ID_CREDITO, DECODE(SIT_INTERES,''IM'',pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY'') , F_PAGO,F_PROG_PAGO,SIT_INTERES),0) AS NUM_DIAS_VENCIDO'+coCRLF +
	         '                         SELECT ci.ID_CREDITO, (CASE WHEN cr_credito.tipo_disposicion = ''DI'' THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), ci.f_pago, ci.f_vencimiento, ci.sit_interes)'+coCRLF +
                 '                                                     WHEN (cr_credito.TIPO_DISPOSICION <>''DI'') AND (cr_credito.F_INICIO = cr_credito.F_TRASPASO_VENC) OR (ci.F_VENCIMIENTO > TO_DATE('''+sFFin+''',''DD/MM/YYYY'')) THEN pkgcrcomun.stpfunobtdiasree( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), cr_credito.f_traspaso_venc)'+coCRLF +
                 '                                                     WHEN (cr_credito.TIPO_DISPOSICION <>''DI'') AND (cr_credito.F_INICIO < cr_credito.F_TRASPASO_VENC) THEN pkgcrcomun.stpfunobtdiasvdos( TO_DATE('''+sFFin+''',''DD/MM/YYYY''), ci.f_pago, ci.f_vencimiento, ci.sit_interes)'+coCRLF +
                 '                                            END) AS num_dias_vencido'+coCRLF +
	         '                         FROM CR_INTERES CI, cr_credito'+coCRLF +
	         '                         WHERE SIT_INTERES = ''IM'''+coCRLF +
                 '                           AND cr_credito.id_credito = ci.id_credito'+coCRLF +
//	         '                         where 1 = 1'+coCRLF +
	         '                       )NUM_DIAS'+coCRLF +
	         '                   group by  NUM_DIAS.ID_CREDITO'+coCRLF +
	         '                   ) dias,'+coCRLF +
	         '                   ('+coCRLF +
                                     ObtenQryGarantia(sFFin)+coCRLF +
'        )GAR,'+coCRLF +
	         '                   ('+coCRLF +
                                     ObtenQryGarantiaIN(sFFin)+coCRLF +
'        )GARI'+coCRLF +
	         '              WHERE CHC.F_CIERRE          = TO_DATE('''+sFFin+''',''DD/MM/YYYY'')'+coCRLF +
	         '                AND CHC.F_TRASPASO_VENC IS NOT NULL'+coCRLF +
	         '                AND CHC.ID_CREDITO        = CC.ID_CREDITO'+coCRLF +
	         '                AND CTO.ID_CONTRATO       = CC.ID_CONTRATO'+coCRLF +
	         '                AND CP.CVE_PRODUCTO_CRE   = CTO.CVE_PRODUCTO_CRE'+coCRLF;

        if TCartera = '0' then
           vlSQL := vlSQL + '                AND CP.CVE_TIPO_CARTERA   = ''BANCAR'''+coCRLF
        else
           vlSQL := vlSQL + '                AND CP.CVE_TIPO_CARTERA   <> ''BANCAR'''+coCRLF;
        //end if;

        vlSQL := vlSQL +
	         '                AND CP.CVE_CLAS_CONTAB    = CCM.CVE_CAT_MINIMO'+coCRLF +
	         '                AND CC.ID_CREDITO         = PER.ID_CREDITO'+coCRLF +
	         '                AND GAR.ID_CREDITO     (+)= PER.ID_CREDITO'+coCRLF +
	         '                AND GAR.ID_PERIODO     (+)= NVL(PER.NUM_PER_CP,0)'+coCRLF +
	         '                AND GARI.ID_CREDITO     (+)= PER.ID_CREDITO'+coCRLF +
	         '                AND GARI.ID_PERIODO     (+)= NVL(PER.NUM_PER_CI,0)'+coCRLF +
	         '                and dias.id_credito     (+)= CHC.id_credito'+coCRLF +
                 ' ';
 Result:= vlSQL;
End;

Function TQrDiasCartVda.FormaQuery(sFFin, sAcreditado, sDisp, sContrato, sMercObj,
                                   sProducto, sEmpresa, sSucursal, sMoneda, sCatMinimo,sTipGar,
                                   sRangoIni, sRangoFin,TCartera: String
                                  ): String;
Var
    vlSql: String;
Begin
       vlSQL := 'SELECT -- DATOS CONTRATO'+coCRLF +
                '      ID_EMPRESA, ' +coCRLF +
	        '      CVE_MONEDA, DESC_MONEDA,'+coCRLF +
	        '      ID_ACREDITADO,'+coCRLF +
	        '      NOMBRE_ACREDITADO,'+coCRLF +
	        '      NUM_AUTORIZACION,'+coCRLF +

	        '      -- DETALLE PERIODOS VENCIDOS'+coCRLF +
	        '      ID_CREDITO,'+coCRLF +
	        '      F_TRASPASO_VEN,'+coCRLF +
	        '      NUM_DIAS_VDO,'+coCRLF +
	        '      NUM_PERIODO,'+coCRLF +
	        '      F_VENCIMIENTO,'+coCRLF +

	        '      --CAPITAL'+coCRLF +
	        '      CASE WHEN CVE_PRODUCTO <> ''57'' THEN NVL(IMP_CAP_EXIG,0) ELSE ICVE END AS IMP_CAP_EXIG,'+coCRLF +
	        '      CASE WHEN CVE_PRODUCTO <> ''57'' THEN NVL(IMP_CAP_NO_EXIG,0) ELSE ICVNE END AS IMP_CAP_NO_EXIG,'+coCRLF +

	        '      --INERES'+coCRLF +
	        '      CASE WHEN CVE_PRODUCTO <> ''57'' THEN NVL(IMP_INT_EXIG,0) ELSE IIVE  END  AS IMP_INT_EXIG,'+coCRLF +

	        '      -- TOTALES'+coCRLF +
	        '      CASE WHEN CVE_PRODUCTO <> ''57'' THEN NVL(IMP_CAP_EXIG,0) + NVL(IMP_CAP_NO_EXIG,0) + NVL(IMP_INT_EXIG,0) ELSE NVL(ICVE,0)+NVL(ICVNE,0)+NVL(IIVE,0) END AS TOTAL,'+coCRLF +

	        '      -- DATOS CUALITATIVOS DEL CREDITO'+coCRLF +
	        '      CVE_PRODUCTO,'+coCRLF +
	        '      DESC_PRODUCTO,'+coCRLF +
	        '      CVE_CAT_MINIMO,'+coCRLF +
	        '      DESC_CAT_MINIMO,'+coCRLF +
	        '      ID_PROM_ADM,'+coCRLF +
	        '      NOMBRE_PROM_ADM,'+coCRLF +

	        '      -- DATOS DE GARANTIA'+coCRLF +
	        '      GAR_EJERCIDA,'+coCRLF +
	        '      CVE_TIP_GARANTIA,'+coCRLF +
	        '      TIPO_GARANTIA,'+coCRLF +
	        '      ID_PERIODO,'+coCRLF +
	        '      F_APLICA_GAR,'+coCRLF +
	        '      IMP_GARANTIA,'+coCRLF +
	        '      CVE_PRESUPUESTO,'+coCRLF +
	        '      DESC_PRESUPUESTO'+coCRLF +

	        'FROM ('+coCRLF +
	        '       SELECT -- DATOS CONTRATO '+coCRLF +
	        '              CTO.CVE_MONEDA, MON.DESC_MONEDA, '+coCRLF +
	        '              ACRED.ID_PERSONA AS ID_ACREDITADO, '+coCRLF +
	        '              ACRED.NOMBRE 	AS NOMBRE_ACREDITADO, '+coCRLF +
	        '              CTO.ID_CONTRATO AS NUM_AUTORIZACION, '+coCRLF +
                '              CTO.ID_EMPRESA, ' +coCRLF +
	        '              -- DETALLE PERIODOS VENCIDOS  '+coCRLF +
	        '              CC.ID_CREDITO,  '+coCRLF +
	        '              CC.F_TRASPASO_VEN, '+coCRLF +
	        '              CC.F_VENCIMIENTO, '+coCRLF +
	        '              CC.NUM_PERIODO, '+coCRLF +
//	        '              nvl(cc.NUM_DIAS_VDO,0) as NUM_DIAS_VDO, '+coCRLF +
//15/08/2011 - SE ELIMINAN LOS 2 DIAS DE MAS QUE SE SUMAN, SE DEJA 1 DIA A PETICION DE JORGE CISNEROS PARA REALIZAR EL CALCULO DE ACUERDO AL CIERRE
//                '              CASE WHEN ( nvl(cc.NUM_DIAS_VDO,0)  ) <= 0 THEN 0 ELSE nvl(cc.NUM_DIAS_VDO,0) + 2 END AS NUM_DIAS_VDO, '+coCRLF +
                '              CASE WHEN ( nvl(cc.NUM_DIAS_VDO,0)  ) <= 0 THEN 0 ELSE nvl(cc.NUM_DIAS_VDO,0) + 1  END AS NUM_DIAS_VDO, '+coCRLF +
//FIN 15/08/2011

	        '              --CAPITAL '+coCRLF +
	        '              CASE WHEN ( F_VENCIMIENTO  ) <= TO_DATE('''+sFFin+''',''DD/MM/YYYY'') THEN CC.IMP_CAPITAL ELSE 0 END AS IMP_CAP_EXIG, '+coCRLF +
	        '              CASE WHEN ( F_VENCIMIENTO  ) > TO_DATE('''+sFFin+''',''DD/MM/YYYY'') THEN CC.IMP_CAPITAL ELSE 0 END AS IMP_CAP_NO_EXIG, '+coCRLF +
	        '              --INERES '+coCRLF +
	        '              CASE WHEN ( F_VENCIMIENTO  - 5 ) <= CC.F_TRASPASO_VEN THEN CC.IMP_INTERES ELSE 0 END AS IMP_INT_EXIG, '+coCRLF +

	        '              -- DATOS CUALITATIVOS DEL CREDITO '+coCRLF +
	        '              CC.CVE_PRODUCTO, '+coCRLF +
	        '              CC.DESC_PRODUCTO, '+coCRLF +
	        '              CC.CVE_CAT_MINIMO, '+coCRLF +
	        '              CC.DESC_CAT_MINIMO, '+coCRLF +
	        '              CC.ID_PROM_ADM, '+coCRLF +
	        '              ADMON.NOMBRE AS NOMBRE_PROM_ADM, '+coCRLF +

	        '              -- DATOS DE GARANTIA '+coCRLF +
	        '              CC.GAR_EJERCIDA, '+coCRLF +
	        '              CC.CVE_TIP_GARANTIA, '+coCRLF +
	        '              CC.TIPO_GARANTIA, '+coCRLF +
	        '              CC.ID_PERIODO, '+coCRLF +
	        '              CC.F_APLICA_GAR, '+coCRLF +
	        '              CC.IMP_GARANTIA, '+coCRLF +
	        '              CC.CVE_PRESUPUESTO, '+coCRLF +
	        '              PRESUP.DESC_PRESUPUESTO, '+coCRLF +
	        '              CC.num_max_vencidos, '+coCRLF +

	        '              CCAS.ICVE, '+coCRLF +
	        '              CCAS.ICVNE, '+coCRLF +
	        '              CCAS.IIVE '+coCRLF +


	        '       FROM ( '+coCRLF +
                               ObtenQryDatosIntercreditos(sFFin,TCartera) +

	        '         UNION '+coCRLF +
                               ObtenQryDatosICre(sFFin,TCartera) +

	        '            ) CC, '+coCRLF +
	        '            CONTRATO CTO, '+coCRLF +
	        '            ( SELECT ID_PERSONA, APELLIDO_PATERNO||'' ''||APELLIDO_MATERNO||'' ''||NOMBRE_PERSONA AS NOMBRE '+coCRLF +
	        '              FROM PERSONA_FISICA '+coCRLF +
	        '             UNION '+coCRLF +
	        '              SELECT ID_PERSONA, NOM_RAZON_SOCIAL AS NOMBRE '+coCRLF +
	        '              FROM PERSONA_MORAL ) ACRED, '+coCRLF + 
	        '            PERSONA ADMON, '+coCRLF +
	        '            CRE_PRESUPUESTO PRESUP, '+coCRLF +
	        '            MONEDA MON '+coCRLF +
                '           , (SELECT CCAS.ID_CREDITO, CCAS.F_CIERRE, CCAS.IMP_CAP_VDO_EX AS ICVE, CCAS.IMP_CAP_VDO_NE AS ICVNE,  CCAS.IMP_INT_VDO_EX  AS IIVE '+coCRLF +
                '              FROM CR_CON_ADEUDO_SDO CCAS WHERE  CCAS.F_CIERRE = TO_DATE('''+sFFin+''',''DD/MM/YYYY'') ) CCAS  '+coCRLF +
	        '       WHERE CC.ID_CONTRATO = CTO.ID_CONTRATO '+coCRLF +
	        '         AND ACRED.ID_PERSONA = CTO.ID_TITULAR '+coCRLF +
	        '         AND ADMON.ID_PERSONA = CC.ID_PROM_ADM '+coCRLF +
	        '         AND MON.CVE_MONEDA = CTO.CVE_MONEDA '+coCRLF +
	        '         AND PRESUP.CVE_PRESUPUESTO = CC.CVE_PRESUPUESTO '+coCRLF +
                '         AND  CCAS.ID_CREDITO =   CC.ID_CREDITO '+coCRLF +
	        '         AND CC.NUM_PERIODO IS NOT NULL '+coCRLF +
	        '       ) '+coCRLF +
	        ' WHERE (NVL(IMP_CAP_EXIG,0) + NVL(IMP_CAP_NO_EXIG,0) + NVL(IMP_INT_EXIG,0) > 0 ' +coCRLF +
                '    OR  NVL(ICVE,0)+NVL(ICVNE,0)+NVL(IIVE,0) > 0) ' +coCRLF;



       If (Trim(sAcreditado)<>'') Then
          vlSQL:= vlSQL + '  AND ID_ACREDITADO = '+ sAcreditado +coCRLF ;
       If (Trim(sEmpresa)<>'') Then
          vlSQL:= vlSQL + '  AND ID_EMPRESA = '+ sEmpresa+ coCRLF ;
       If (Trim(sDisp)<>'') Then
          vlSQL:= vlSQL + '  AND ID_CREDITO = '+ sDisp+ coCRLF ;
       If (Trim(sContrato)<>'') Then
          vlSQL:= vlSQL + '  AND NUM_AUTORIZACION = '+ sContrato+ coCRLF ;
       If (Trim(sMercObj)<>'') Then
          vlSQL:= vlSQL + '  AND CVE_PRESUPUESTO =  '''+ sMercObj+''''+  coCRLF ;
       If (Trim(sProducto)<>'') Then
          vlSQL:= vlSQL + '  AND CVE_PRODUCTO =  '''+ sProducto+''''+  coCRLF ;
       If (Trim(sMoneda)<>'') Then
          vlSQL:= vlSQL + '  AND CVE_MONEDA=  '''+ sMoneda +''''+  coCRLF ;
       If (Trim(sCatMinimo)<>'') Then
          vlSQL:= vlSQL + '  AND CVE_CAT_MINIMO =  '''+ sCatMinimo +''''+  coCRLF ;
       If (Trim(sTipGar)<>'') Then
          vlSQL:= vlSQL + '  AND CVE_TIP_GARANTIA = '''+ sTipGar + ''''+ coCRLF ;
       If (strtoint(sRangoIni) >= 0) AND ( strtoint(sRangoFin) > 0) Then
          vlSQL:= vlSQL + '  and num_max_vencidos >= '+ sRangoIni + coCRLF +'  AND num_max_vencidos <=' + sRangoFin + coCRLF ;
       If (strtoint(sRangoIni) > 0) AND ( strtoint(sRangoFin) = 0) Then
       begin
            If (strtoint(sRangoIni) = 1) then
                vlSQL:= vlSQL + '  and (NVL(num_max_vencidos,0) >= 0 OR  num_max_vencidos IS NULL) ' + coCRLF
            else
                vlSQL:= vlSQL + '  and NVL(num_max_vencidos,0) >= '+ sRangoIni + coCRLF;
       end;

       if VGAgrupa = 0 then
//15/08/2011 SE COMENTA PARA QUE ORDENE MOSTRANDO AL FINAL EL PERIODO MAS VIEJO
//          vlSQL:= vlSQL + ' ORDER BY DESC_MONEDA, CVE_PRODUCTO, NOMBRE_ACREDITADO, ID_CREDITO, num_dias_vdo,  NUM_PERIODO '+ coCRLF ;
          vlSQL:= vlSQL + ' ORDER BY DESC_MONEDA, CVE_PRODUCTO, NOMBRE_ACREDITADO, ID_CREDITO, num_dias_vdo,  NUM_PERIODO DESC'+ coCRLF ;
        //end if;

       if VGAgrupa = 1 then
          vlSQL:= vlSQL + ' ORDER BY DESC_MONEDA, CVE_PRODUCTO, NOMBRE_ACREDITADO, ID_CREDITO, F_VENCIMIENTO,  NUM_PERIODO'+ coCRLF ;
        //end if;


   Result:= vlSQL;
End;

procedure TQrDiasCartVda.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

      If Trim(sArchivo)<>'' Then Begin
         Writeln(F,
                  qyDiasCartVda.FieldByName('CVE_MONEDA').AsString + #09 +
                  qyDiasCartVda.FieldByName('DESC_MONEDA').AsString + #09 +
                  FormatFloat('###,##0.0000', dTipoCambio)+ #09 +
                  qyDiasCartVda.FieldByName('ID_ACREDITADO').AsString + #09 +
                  qyDiasCartVda.FieldByName('NOMBRE_ACREDITADO').AsString + #09 +
                  qyDiasCartVda.FieldByName('NUM_AUTORIZACION').AsString + #09 +
                  qyDiasCartVda.FieldByName('ID_CREDITO').AsString + #09 +
                  qyDiasCartVda.FieldByName('F_TRASPASO_VEN').AsString + #09+
                  qyDiasCartVda.FieldByName('NUM_DIAS_VDO').AsString + #09+
                  qyDiasCartVda.FieldByName('NUM_PERIODO').AsString + #09+
                  qyDiasCartVda.FieldByName('F_VENCIMIENTO').AsString + #09+
                  FormatFloat('###,###,###,###,##0.00',qyDiasCartVda.FieldByName('IMP_CAP_EXIG').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyDiasCartVda.FieldByName('IMP_CAP_NO_EXIG').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyDiasCartVda.FieldByName('IMP_INT_EXIG').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyDiasCartVda.FieldByName('TOTAL').AsFloat ) + #09+
                  qyDiasCartVda.FieldByName('CVE_PRODUCTO').AsString + #09+
                  qyDiasCartVda.FieldByName('DESC_PRODUCTO').AsString + #09+
                  qyDiasCartVda.FieldByName('CVE_CAT_MINIMO').AsString + #09+
                  qyDiasCartVda.FieldByName('DESC_CAT_MINIMO').AsString + #09+
                  qyDiasCartVda.FieldByName('ID_PROM_ADM').AsString + #09 +
                  qyDiasCartVda.FieldByName('NOMBRE_PROM_ADM').AsString + #09+
                  qyDiasCartVda.FieldByName('GAR_EJERCIDA').AsString + #09+
                  qyDiasCartVda.FieldByName('CVE_TIP_GARANTIA').AsString + #09+
                  qyDiasCartVda.FieldByName('TIPO_GARANTIA').AsString + #09 +
                  qyDiasCartVda.FieldByName('ID_PERIODO').AsString + #09+
                  qyDiasCartVda.FieldByName('F_APLICA_GAR').AsString + #09+
                  FormatFloat('###,###,###,###,##0.00',qyDiasCartVda.FieldByName('IMP_GARANTIA').AsFloat ) + #09 +
                  qyDiasCartVda.FieldByName('CVE_PRESUPUESTO').AsString + #09 +
                  qyDiasCartVda.FieldByName('DESC_PRESUPUESTO').AsString
         );
      End;
end;

procedure TQrDiasCartVda.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If qyDiasCartVda.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

procedure TQrDiasCartVda.QRFooterCatMinimoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
      //Reporte por Resumen
      if VGAgrupa = 1 then
      begin
            If Trim(sArchivo)<>'' Then Begin
                     Writeln(F, 'Total Catálogo Mínimo ' + #09#09#09#09#09#09#09#09#09#09#09+
                              FormatFloat('###,###,###,###,##0.00',qreCapExig.Value.dblResult) + #09+
                              FormatFloat('###,###,###,###,##0.00',QRExpr1.Value.dblResult) + #09+
                              FormatFloat('###,###,###,###,##0.00',QRExpr2.Value.dblResult) + #09+
                              FormatFloat('###,###,###,###,##0.00',QRExpr3.Value.dblResult) + #09#09#09#09#09#09#09#09#09#09#09#09+
                              FormatFloat('###,###,###,###,##0.00',QRExpr4.Value.dblResult)
                            );
                  end;
      end;
end;

procedure TQrDiasCartVda.QRFooterProductoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
      //Reporte por Resumen
      if VGAgrupa = 1 then
      begin

            If Trim(sArchivo)<>'' Then Begin
               Writeln(F, 'Total Producto ' + #09#09#09#09#09#09#09#09#09#09#09+
                        FormatFloat('###,###,###,###,##0.00',QRExpr9.Value.dblResult) + #09+
                        FormatFloat('###,###,###,###,##0.00',QRExpr8.Value.dblResult) + #09+
                        FormatFloat('###,###,###,###,##0.00',QRExpr7.Value.dblResult) + #09+
                        FormatFloat('###,###,###,###,##0.00',QRExpr6.Value.dblResult) + #09#09#09#09#09#09#09#09#09#09#09#09+
                        FormatFloat('###,###,###,###,##0.00',QRExpr5.Value.dblResult)
                      );
            end;
      end;
end;

procedure TQrDiasCartVda.QRFooterAcreditadoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
      //Reporte por Resumen
      if VGAgrupa = 1 then
      begin

             If Trim(sArchivo)<>'' Then Begin
                 Writeln(F, 'Total Acreditado ' + #09#09#09#09#09#09#09#09#09#09#09+
                          FormatFloat('###,###,###,###,##0.00',QRExpr24.Value.dblResult) + #09+
                          FormatFloat('###,###,###,###,##0.00',QRExpr23.Value.dblResult) + #09+
                          FormatFloat('###,###,###,###,##0.00',QRExpr22.Value.dblResult) + #09+
                          FormatFloat('###,###,###,###,##0.00',QRExpr21.Value.dblResult) + #09#09#09#09#09#09#09#09#09#09#09#09+
                          FormatFloat('###,###,###,###,##0.00',QRExpr20.Value.dblResult)
                        );
              end;
      end;
end;

procedure TQrDiasCartVda.QRGrpFooterMonedaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
Var nTipoCambio: Double;
begin

       nTipoCambio := StrToFloat(lbTipoCambio.Caption);

       qrMonCapExigTC.Caption   := FormatFloat('###,###,###,###,##0.00',QRExpr19.Value.dblResult * nTipoCambio );
       qrMonCapNoExigTC.Caption := FormatFloat('###,###,###,###,##0.00',QRExpr18.Value.dblResult * nTipoCambio);
       qrMonIntExigTC.Caption   := FormatFloat('###,###,###,###,##0.00',QRExpr17.Value.dblResult * nTipoCambio);
       qrMonTotalTC.Caption     := FormatFloat('###,###,###,###,##0.00',QRExpr16.Value.dblResult * nTipoCambio);
       qrMonImpGarantia.Caption := FormatFloat('###,###,###,###,##0.00',QRExpr15.Value.dblResult * nTipoCambio);

       If qyDiasCartVda.FieldByName('CVE_MONEDA').AsInteger = C_DLLS Then Begin
          vlCapExigDlls  := QRExpr19.Value.dblResult * nTipoCambio;
          vlCapNoExigdlls:= QRExpr18.Value.dblResult * nTipoCambio;
          vlIntExigDlls  := QRExpr17.Value.dblResult * nTipoCambio;
          vlTotalDlls    := QRExpr16.Value.dblResult * nTipoCambio;
          vlImpGarDlls   := QRExpr15.Value.dblResult * nTipoCambio;
       End Else If qyDiasCartVda.FieldByName('CVE_MONEDA').AsInteger = 800 Then Begin
          vlCapExigUdis  := QRExpr19.Value.dblResult * nTipoCambio;
          vlCapNoExigUdis:= QRExpr18.Value.dblResult * nTipoCambio;
          vlIntExigUdis  := QRExpr17.Value.dblResult * nTipoCambio;
          vlTotalUdis    := QRExpr16.Value.dblResult * nTipoCambio;
          vlImpGarUdis   := QRExpr15.Value.dblResult * nTipoCambio;
       End Else Begin
          vlCapExigPesos  := QRExpr19.Value.dblResult * nTipoCambio;
          vlCapNoExigPesos:= QRExpr18.Value.dblResult * nTipoCambio;
          vlIntExigPesos  := QRExpr17.Value.dblResult * nTipoCambio;
          vlTotalPesos    := QRExpr16.Value.dblResult * nTipoCambio;
          vlImpGarPesos   := QRExpr15.Value.dblResult * nTipoCambio;
       End;

       If Trim(sArchivo)<>'' Then Begin
         Writeln(F, 'Total Moneda ' + #09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,##0.00',QRExpr19.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,##0.00',QRExpr18.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,##0.00',QRExpr17.Value.dblResult) + #09+
                  FormatFloat('###,###,###,###,##0.00',QRExpr16.Value.dblResult) + #09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,##0.00',QRExpr15.Value.dblResult)
                );
         Writeln(F, 'Total Moneda Valorizada ' + #09#09#09#09#09#09#09#09#09#09#09+
                  qrMonCapExigTC.Caption + #09+
                  qrMonCapNoExigTC.Caption + #09+
                  qrMonIntExigTC.Caption + #09+
                  qrMonTotalTC.Caption + #09#09#09#09#09#09#09#09#09#09#09#09+
                  qrMonImpGarantia.Caption
                );

      end;
end;

procedure TQrDiasCartVda.QRGrupoMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

   If qyDiasCartVda.FieldByName('CVE_MONEDA').AsInteger = C_DLLS Then Begin
      dTipoCambio:= vgTCambioMes;
      lbTipoCambio.Caption := FormatFloat('###,##0.0000', vgTCambioMes);
   End Else If qyDiasCartVda.FieldByName('CVE_MONEDA').AsInteger = 800 Then Begin
      dTipoCambio:= vgTCambioUDIS;
      lbTipoCambio.Caption := FormatFloat('###,##0.000000',vgTCambioUDIS)
   End Else Begin
      dTipoCambio:= 1;
      lbTipoCambio.Caption := '1.0000';
   End;
end;

procedure TQrDiasCartVda.QRFooterContBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

        QRTotCapExgDlls.Caption   := FormatFloat('###,###,###,###,##0.00',vlCapExigDlls  );
        QRTotCapNoExgDlls.Caption := FormatFloat('###,###,###,###,##0.00',vlCapNoExigdlls);
        QRTotIntExgDlls.Caption   := FormatFloat('###,###,###,###,##0.00',vlIntExigDlls  );
        QRTotalDlls.Caption       := FormatFloat('###,###,###,###,##0.00',vlTotalDlls    );
        QRTotGarantiaDlls.Caption := FormatFloat('###,###,###,###,##0.00',vlImpGarDlls   );

        QRTotCapExgUdis.Caption   := FormatFloat('###,###,###,###,##0.00',vlCapExigUdis  );
        QRTotCapNoExgUdis.Caption := FormatFloat('###,###,###,###,##0.00',vlCapNoExigUdis);
        QRTotIntExgUdis.Caption   := FormatFloat('###,###,###,###,##0.00',vlIntExigUdis  );
        QRTotalUdis.Caption       := FormatFloat('###,###,###,###,##0.00',vlTotalUdis    );
        QRTotGarantiaUdis.Caption := FormatFloat('###,###,###,###,##0.00',vlImpGarUdis   );

        QRTotCapExg.Caption   := FormatFloat('###,###,###,###,##0.00',vlCapExigPesos  );
        QRTotCapNoExg.Caption := FormatFloat('###,###,###,###,##0.00',vlCapNoExigPesos);
        QRTotIntExg.Caption   := FormatFloat('###,###,###,###,##0.00',vlIntExigPesos  );
        QRTotal.Caption       := FormatFloat('###,###,###,###,##0.00',vlTotalPesos    );
        QRTotGarantia.Caption := FormatFloat('###,###,###,###,##0.00',vlImpGarPesos   );

        QRGranTotCapExg.Caption   := FormatFloat('###,###,###,###,##0.00',vlCapExigPesos   + vlCapExigDlls   + vlCapExigUdis);
        QRGranTotCapNoExg.Caption := FormatFloat('###,###,###,###,##0.00',vlCapNoExigPesos + vlCapNoExigdlls + vlCapNoExigUdis);
        QRGranTotIntExg.Caption   := FormatFloat('###,###,###,###,##0.00',vlIntExigPesos   + vlIntExigDlls   + vlIntExigPesos);
        QRGranTotal.Caption       := FormatFloat('###,###,###,###,##0.00',vlTotalPesos     + vlTotalDlls     + vlTotalUdis );
        QRGranTotGarantia.Caption := FormatFloat('###,###,###,###,##0.00',vlImpGarPesos    + vlImpGarDlls    + vlImpGarUdis );

       If Trim(sArchivo)<>'' Then Begin
         Writeln(F, '');
         Writeln(F, '----------------------------------------------------------------------');

         Writeln(F, 'Total Dólares Valorizado ' + #09#09#09#09#09#09#09#09#09#09#09+
                    QRTotCapExgDlls.Caption  + #09+
                    QRTotCapNoExgDlls.Caption + #09+
                    QRTotIntExgDlls.Caption + #09+
                    QRTotalDlls.Caption + #09#09#09#09#09#09#09#09#09#09#09#09+
                    QRTotGarantiaDlls.Caption
                );

         Writeln(F, 'Total Pesos ' + #09#09#09#09#09#09#09#09#09#09#09+
                    QRTotCapExg.Caption  + #09+
                    QRTotCapNoExg.Caption + #09+
                    QRTotIntExg.Caption + #09+
                    QRTotal.Caption + #09#09#09#09#09#09#09#09#09#09#09#09+
                    QRTotGarantia.Caption
                );

         Writeln(F, 'Total Udis Valorizado ' + #09#09#09#09#09#09#09#09#09#09#09+
                    QRTotCapExgUdis.Caption  + #09+
                    QRTotCapNoExgUdis.Caption + #09+
                    QRTotIntExgUdis.Caption + #09+
                    QRTotalUdis.Caption + #09#09#09#09#09#09#09#09#09#09#09#09+
                    QRTotGarantiaUdis.Caption
                );

         Writeln(F, '----------------------------------------------------------------------');
         Writeln(F, '----------------------------------------------------------------------');
         Writeln(F, 'Gran Total ' + #09#09#09#09#09#09#09#09#09#09#09+
                    QRGranTotCapExg.Caption  + #09+
                    QRGranTotCapNoExg.Caption + #09+
                    QRGranTotIntExg.Caption + #09+
                    QRGranTotal.Caption + #09#09#09#09#09#09#09#09#09#09#09#09+
                    QRGranTotGarantia.Caption
                );
      end;

end;

procedure TQrDiasCartVda.QRGroupCredBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
      If Trim(sArchivo)<>'' Then Begin
         Writeln(F,
                  qyDiasCartVda.FieldByName('CVE_MONEDA').AsString + #09 +
                  qyDiasCartVda.FieldByName('DESC_MONEDA').AsString + #09 +
                  FormatFloat('###,##0.0000', dTipoCambio)+ #09 +
                  qyDiasCartVda.FieldByName('ID_ACREDITADO').AsString + #09 +
                  qyDiasCartVda.FieldByName('NOMBRE_ACREDITADO').AsString + #09 +
                  qyDiasCartVda.FieldByName('NUM_AUTORIZACION').AsString + #09 +
                  qyDiasCartVda.FieldByName('ID_CREDITO').AsString + #09 +
                  qyDiasCartVda.FieldByName('F_TRASPASO_VEN').AsString + #09+
                  qyDiasCartVda.FieldByName('NUM_DIAS_VDO').AsString + #09+
                  qyDiasCartVda.FieldByName('NUM_PERIODO').AsString + #09+
                  qyDiasCartVda.FieldByName('F_VENCIMIENTO').AsString + #09+
//                  FormatFloat('###,###,###,###,##0.00',qyDiasCartVda.FieldByName('IMP_CAP_EXIG').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',QRExpr10.Value.dblResult) + #09+
//                  FormatFloat('###,###,###,###,##0.00',qyDiasCartVda.FieldByName('IMP_CAP_NO_EXIG').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',QRExpr11.Value.dblResult) + #09+
//                  FormatFloat('###,###,###,###,##0.00',qyDiasCartVda.FieldByName('IMP_INT_EXIG').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',QRExpr12.Value.dblResult) + #09+
//                  FormatFloat('###,###,###,###,##0.00',qyDiasCartVda.FieldByName('TOTAL').AsFloat ) + #09+
                  FormatFloat('###,###,###,###,##0.00',QRExpr13.Value.dblResult) + #09+
                  qyDiasCartVda.FieldByName('CVE_PRODUCTO').AsString + #09+
                  qyDiasCartVda.FieldByName('DESC_PRODUCTO').AsString + #09+
                  qyDiasCartVda.FieldByName('CVE_CAT_MINIMO').AsString + #09+
                  qyDiasCartVda.FieldByName('DESC_CAT_MINIMO').AsString + #09+
                  qyDiasCartVda.FieldByName('ID_PROM_ADM').AsString + #09 +
                  qyDiasCartVda.FieldByName('NOMBRE_PROM_ADM').AsString + #09+
                  qyDiasCartVda.FieldByName('GAR_EJERCIDA').AsString + #09+
                  qyDiasCartVda.FieldByName('CVE_TIP_GARANTIA').AsString + #09+
                  qyDiasCartVda.FieldByName('TIPO_GARANTIA').AsString + #09 +
                  qyDiasCartVda.FieldByName('ID_PERIODO').AsString + #09+
                  qyDiasCartVda.FieldByName('F_APLICA_GAR').AsString + #09+
//                  FormatFloat('###,###,###,###,##0.00',qyDiasCartVda.FieldByName('IMP_GARANTIA').AsFloat ) + #09 +
                  FormatFloat('###,###,###,###,##0.00',QRExpr14.Value.dblResult) + #09+
                  qyDiasCartVda.FieldByName('CVE_PRESUPUESTO').AsString + #09 +
                  qyDiasCartVda.FieldByName('DESC_PRESUPUESTO').AsString
         );
      End;

end;

End.

