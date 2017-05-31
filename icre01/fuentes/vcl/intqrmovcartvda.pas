unit IntQrMovCartVda;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport, U_InterCustomStar,
  U_InterDigDoc,uRedigitalizacion,
  ComObj,
  IntXls;

type
  TQrMovCartVda = class(TQuickRep)
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyMovCartVda: TQuery;
    qyMovCartVdaMOVTOS: TStringField;
    qyMovCartVdaCVE_MONEDA: TFloatField;
    qyMovCartVdaDESC_MONEDA: TStringField;
    qyMovCartVdaCVE_TIPO_SECTOR: TStringField;
    qyMovCartVdaDESC_SECTOR: TStringField;
    qyMovCartVdaID_CREDITO: TFloatField;
    qyMovCartVdaACREDITADO: TStringField;
    qyMovCartVdaCVE_PRODUCTO_CRE: TStringField;
    qyMovCartVdaF_INICIO: TDateTimeField;
    qyMovCartVdaF_VENCIMIENTO: TDateTimeField;
    qyMovCartVdaF_TRASPASO_VENC: TDateTimeField;
    qyMovCartVdaIMP_CP: TFloatField;
    qyMovCartVdaIMP_IN: TFloatField;
    qyMovCartVdaSIT_CREDITO: TStringField;
    qyMovCartVdaF_LIQUIDACION: TDateTimeField;
    qyMovCartVdaID_CRE_RENOVADO: TFloatField;
    qyMovCartVdaID_CRE_RENUEVA: TFloatField;
    qyMovCartVdaTIPO_DISPOSICION: TStringField;
    qyMovCartVdaCVE_TIPO_BAJA: TStringField;
    qrgTipoMovto: TQRGroup;
    QRDBText1: TQRDBText;
    QRGroupMoneda: TQRGroup;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRGroupAgrupacion: TQRGroup;
    QRDBText4: TQRDBText;
    TitleBandEncabezados: TQRBand;
    DetailBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    qrbSubAgrupacion: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    qyMovCartVdaAGRUPACION: TStringField;
    qrbSubMoneda: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRShpTipoCuenta: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape11: TQRShape;
    QRLabel23: TQRLabel;
    QRShape21: TQRShape;
    QRSHPTCredito: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape14: TQRShape;
    QRShape12: TQRShape;
    QRLabel4: TQRLabel;
    QRShape4: TQRShape;
    QRLabel9: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroupMonedaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrgTipoMovtoAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroupAgrupacionAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbSubAgrupacionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbSubMonedaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbSubAgrupacionAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    vgBGeneraArchivo : Boolean;
    vgArchivoExcel : String;
    vgTitReporte : String;
    vgExcelApp : OleVariant;
    vgNumRow   : Integer;
    vgRowIni   : Integer;
    vgRowFin   : Integer;
    vgStrList  : TStringList;

    procedure IniciaArchivoExcel(peFileName : String);
    function  Cierra_Y_Guarda_ArchivoExcel : Boolean;
  public
    Function FormaQuery(sFIni, sFFin: TDateTime; sAcreditado, sDisp, sContrato, sMercObj,
                        sProducto, sMoneda, sCatMinimo, TCartera: String
                       ): String;
  end;

var
  QrMovCartVda: TQrMovCartVda;
  bGenArch: Boolean;
  Apli : TInterApli;
  sArchivo:String;
  F: TextFile;

  Procedure RepMovCarVda( sFIni, sFFin: TDateTime; sAcreditado,
                          sDisp, sContrato, sMercObj, sProducto,
                          sMoneda, sCatMinimo, TCartera : String;
                          pAPli : TInterApli; pPreview : Boolean;
                          peStrArchivoXLS : String);
implementation

{$R *.DFM}

Procedure RepMovCarVda( sFIni, sFFin: TDateTime; sAcreditado,
                        sDisp, sContrato, sMercObj, sProducto,
                        sMoneda, sCatMinimo, TCartera : String;
                        pAPli : TInterApli; pPreview : Boolean;
                        peStrArchivoXLS : String);
Var
   QrMovCartVda: TQrMovCartVda;
   Preview     : TIntQRPreview;
Begin
   QrMovCartVda:=TQrMovCartVda.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrMovCartVda);
   Try
      bGenArch:= False;
      Apli := pApli;

      QrMovCartVda.QRInterEncabezado1.Apli:=pApli;
      QrMovCartVda.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrMovCartVda.QRInterEncabezado1.NomReporte:='IntMQrMovCartVda';

      QrMovCartVda.QRInterEncabezado1.Titulo1:='Movimientos de Cartera Vencida del ' + DateToStr(sFIni) + ' al ' + DateToStr(sFFin);

      QrMovCartVda.vgBGeneraArchivo := (ExtractFileName(Trim(peStrArchivoXLS)) <> '');
      QrMovCartVda.vgArchivoExcel   := peStrArchivoXLS;

      if (Trim(sAcreditado)<>'')Then
         QrMovCartVda.QRInterEncabezado1.Titulo1:= QrMovCartVda.QRInterEncabezado1.Titulo1 + ' Por Acreditado '
      else If (Trim(sDisp)<>'')Then
         QrMovCartVda.QRInterEncabezado1.Titulo1:= QrMovCartVda.QRInterEncabezado1.Titulo1 + ' Por Crédito '
      else If (Trim(sProducto)<>'')Then
         QrMovCartVda.QRInterEncabezado1.Titulo1:= QrMovCartVda.QRInterEncabezado1.Titulo1 + ' Por Producto de Crédito ' + sProducto
      else If (Trim(sMoneda)<>'')Then
         QrMovCartVda.QRInterEncabezado1.Titulo1:= QrMovCartVda.QRInterEncabezado1.Titulo1 + ' Por Moneda ' +  sMoneda
      else If (Trim(sCatMinimo)<>'')Then
         QrMovCartVda.QRInterEncabezado1.Titulo1:= QrMovCartVda.QRInterEncabezado1.Titulo1 + ' Por Catálogo Mínimo ' +  sCatMinimo
      else If (Trim(sMercObj)<>'')Then
         QrMovCartVda.QRInterEncabezado1.Titulo1:= QrMovCartVda.QRInterEncabezado1.Titulo1 + ' Por Área de Negocio ' +  sMercObj;

      if TCartera = '0' Then
         QrMovCartVda.QRInterEncabezado1.Titulo1:= QrMovCartVda.QRInterEncabezado1.Titulo1 + ' (Bancaria)'
      else
         QrMovCartVda.QRInterEncabezado1.Titulo1:= QrMovCartVda.QRInterEncabezado1.Titulo1 + ' (NO Bancaria)';
      //end if;

      QrMovCartVda.vgTitReporte := QrMovCartVda.QRInterEncabezado1.Titulo1;

      QrMovCartVda.qyMovCartVda.DatabaseName := pApli.DataBaseName;
      QrMovCartVda.qyMovCartVda.SessionName := pApli.SessionName;

      QrMovCartVda.qyMovCartVda.Active:=False;
      QrMovCartVda.qyMovCartVda.SQL.Text:= QrMovCartVda.FormaQuery(sFIni, sFFin, sAcreditado, sDisp, sContrato, sMercObj,
                                                                  sProducto, sMoneda, sCatMinimo, TCartera);

      QrMovCartVda.qyMovCartVda.SQL.SaveToFile('c:\MovCartVda.txt');
      QrMovCartVda.qyMovCartVda.Active:=True;

      If (QrMovCartVda.vgBGeneraArchivo) Then
         QrMovCartVda.IniciaArchivoExcel(QrMovCartVda.vgArchivoExcel);

      If pPreview Then
         QrMovCartVda.Preview
      Else
         QrMovCartVda.Print;

      If (QrMovCartVda.vgBGeneraArchivo) Then
         QrMovCartVda.Cierra_Y_Guarda_ArchivoExcel;

   Finally
      QrMovCartVda.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

function TQrMovCartVda.Cierra_Y_Guarda_ArchivoExcel: Boolean;
begin
  Result := False;
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;
  //
  vgExcelApp.ActiveWorkBook.SaveAs(vgArchivoExcel);

  vgStrList.Clear;
  vgStrList.Free;
  Result := CloseExcelFile(vgExcelApp);
end;

function TQrMovCartVda.FormaQuery(sFIni, sFFin: TDateTime; sAcreditado,
  sDisp, sContrato, sMercObj, sProducto, sMoneda, sCatMinimo,
  TCartera: String): String;
Var
  vlSql: String;
Begin
  vlSQL :=
        'SELECT ''INCREMENTOS'' MOVTOS, ' + coCRLF +
        '       CAST(CASE WHEN CRE.TIPO_DISPOSICION=''DI'' THEN ''INCUMPLIMIENTO''  ' + coCRLF +
        '             WHEN CRE.TIPO_DISPOSICION=''RS'' THEN ''REESTRUCTURA''  ' + coCRLF +
        '             WHEN CRE.TIPO_DISPOSICION=''RE'' THEN ''RENOVACION''  ' + coCRLF +
        '             ELSE CRE.TIPO_DISPOSICION END AS VARCHAR2(20)) AGRUPACION,  ' + coCRLF +
        '       CTO.CVE_MONEDA,  ' + coCRLF +
        '       MON.DESC_MONEDA,  ' + coCRLF +
        '       PER.CVE_TIPO_SECTOR, SE.DESC_SECTOR,  ' + coCRLF +
        '       CRE.ID_CREDITO,  ' + coCRLF +
        '       PER.NOMBRE ACREDITADO,  ' + coCRLF +
        '       CRCTO.CVE_PRODUCTO_CRE, ' + coCRLF +
        '       CRE.F_INICIO, ' + coCRLF +
        '       CRE.F_VENCIMIENTO, ' + coCRLF +
        '       CHC.F_TRASPASO_VENC, ' + coCRLF +
        '       (SELECT IMP_CAP_VDO_EX + IMP_CAP_VDO_NE FROM CR_CON_ADEUDO_SDO WHERE ID_CREDITO = CRE.ID_CREDITO AND F_CIERRE=CHC.F_TRASPASO_VENC) IMP_CP, ' + coCRLF +
        '       (SELECT IMP_INT_VDO_EX FROM CR_CON_ADEUDO_SDO WHERE ID_CREDITO = CRE.ID_CREDITO AND F_CIERRE=CHC.F_TRASPASO_VENC) IMP_IN, ' + coCRLF +
        '       CRE.SIT_CREDITO, ' + coCRLF +
        '       CRE.F_LIQUIDACION, ' + coCRLF +
        '       CRE.ID_CRE_RENOVADO, ' + coCRLF +
        '       CRE.ID_CRE_RENUEVA, ' + coCRLF +
        '       CRE.TIPO_DISPOSICION, ' + coCRLF +
        '       CRE.CVE_TIPO_BAJA ' + coCRLF +
        'FROM (SELECT ID_CREDITO, MAX(F_TRASPASO_VENC) F_TRASPASO_VENC ' + coCRLF +
        '      FROM CR_HISTO_CRED ' + coCRLF +
        '      WHERE 1=1 ' + coCRLF +
        '        AND F_TRASPASO_VENC BETWEEN  ' + SQLFecha(sFIni) + ' AND ' + SQLFecha(sFFin) + coCRLF +
        '        AND F_TRASPASO_VENC IS NOT NULL ' + coCRLF +
        '      GROUP BY ID_CREDITO ) CHC, ' + coCRLF +
        '     CR_CREDITO CRE, ' + coCRLF +
        '     CONTRATO CTO, ' + coCRLF +
        '     CR_CONTRATO CRCTO,  ' + coCRLF +
        '     PERSONA PER, ' + coCRLF +
        '     SECTOR SE, ' + coCRLF +
        '     MONEDA MON, ' + coCRLF +
        '     CR_PRODUCTO PR ' + coCRLF +
        'WHERE 1 = 1 ' + coCRLF +
        '  AND CHC.ID_CREDITO = CRE.ID_CREDITO ' + coCRLF +
        '  AND CRE.ID_CONTRATO = CTO.ID_CONTRATO ' + coCRLF +
        '  AND CRE.ID_CONTRATO = CRCTO.ID_CONTRATO ' + coCRLF +
        '  AND CTO.ID_TITULAR = PER.ID_PERSONA ' + coCRLF +
        '  AND PER.CVE_TIPO_SECTOR = SE.CVE_SECTOR ' + coCRLF +
        '  AND CTO.CVE_MONEDA = MON.CVE_MONEDA ' + coCRLF +
        '  AND CRCTO.CVE_PRODUCTO_CRE = PR.CVE_PRODUCTO_CRE ' + coCRLF;
  if TCartera = '0' then
    vlSQL := vlSQL +
        '  AND PR.CVE_TIPO_CARTERA   = ''BANCAR'''+coCRLF
  else
    vlSQL := vlSQL +
        '  AND PR.CVE_TIPO_CARTERA   <> ''BANCAR'''+coCRLF;

  If (Trim(sAcreditado)<>'') Then
    vlSQL := vlSQL +
        '  AND CTO.ID_TITULAR = ' + sAcreditado + coCRLF ;
  If (Trim(sMoneda)<>'') Then
    vlSQL:= vlSQL +
        '  AND CTO.CVE_MONEDA = ' + sMoneda + coCRLF ;
  If (Trim(sContrato)<>'') Then
    vlSQL:= vlSQL +
        '  AND CTO.ID_CONTRATO = ' + sContrato + coCRLF ;
  If (Trim(sMercObj)<>'') Then
    vlSQL:= vlSQL +
        '  AND PR.CVE_PRESUPUESTO = '''+ sMercObj+''''+  coCRLF ;
  If (Trim(sProducto)<>'') Then
    vlSQL:= vlSQL +
        '  AND CRCTO.CVE_PRODUCTO_CRE = '''+ sProducto+''''+  coCRLF ;
  If (Trim(sCatMinimo)<>'') Then
    vlSQL:= vlSQL +
        '  AND PR.CVE_CLAS_CONTAB = '''+ sCatMinimo +''''+  coCRLF ;
  If (Trim(sDisp)<>'') Then
    vlSQL:= vlSQL +
        '  AND CRE.ID_CREDITO = '+ sDisp+ coCRLF ;

    vlSQL:= vlSQL +
        '--ORDER BY CRE.TIPO_DISPOSICION, CTO.CVE_MONEDA, PER.CVE_TIPO_SECTOR, CRE.ID_CREDITO ' + coCRLF +
        'UNION ALL ' + coCRLF +
        '-- SALIDA DE CARTERA VENCIDA POR PAGO SOSTENIDO ' + coCRLF +
        'SELECT ''DECREMENTOS'' MOVTOS, ' + coCRLF +
        '       CAST(''SALIDA POR PAGO SOSTENIDO'' AS VARCHAR2(20)) AGRUPACION, ' + coCRLF +
        '       CTO.CVE_MONEDA, ' + coCRLF +
        '       MON.DESC_MONEDA, ' + coCRLF +
        '       PER.CVE_TIPO_SECTOR, SE.DESC_SECTOR, ' + coCRLF +
        '       CRE.ID_CREDITO, ' + coCRLF +
        '           PER.NOMBRE ACREDITADO, ' + coCRLF +
        '           CRCTO.CVE_PRODUCTO_CRE, ' + coCRLF +
        '           CRE.F_INICIO, ' + coCRLF +
        '           CRE.F_VENCIMIENTO, ' + coCRLF +
        '           F_VE.F_TRASPASO_VENC, ' + coCRLF +
        '           TRAN.IMP_CP, ' + coCRLF +
        '           TRAN.IMP_IN, ' + coCRLF +
        '       CRE.SIT_CREDITO, ' + coCRLF +
        '           CRE.F_LIQUIDACION, ' + coCRLF +
        '           CRE.ID_CRE_RENOVADO, ' + coCRLF +
        '           CRE.ID_CRE_RENUEVA, ' + coCRLF +
        '           CRE.TIPO_DISPOSICION, ' + coCRLF +
        '           CRE.CVE_TIPO_BAJA ' + coCRLF +
        'FROM CR_CREDITO CRE, ' + coCRLF +
        '     -- TRANSACCIONES CAREVI ' + coCRLF +
        '     (SELECT ID_CREDITO, F_OPERACION, F_VALOR, ' + coCRLF +
        '             SUM(CASE WHEN CVE_OPERACION = ''CAREVI'' THEN IMP_NETO ELSE 0 END) IMP_CP, ' + coCRLF +
        '                  SUM(CASE WHEN CVE_OPERACION = ''INREVI'' THEN IMP_NETO ELSE 0 END) IMP_IN ' + coCRLF +
        '        FROM CR_TRANSACCION ' + coCRLF +
        '       WHERE F_VALOR BETWEEN ' + SQLFecha(sFIni) + ' AND ' + SQLFecha(sFFin) +
        '         AND CVE_OPERACION IN (''CAREVI'', ''INREVI'') ' + coCRLF +
        '       GROUP BY ID_CREDITO, F_OPERACION, F_VALOR) TRAN, ' + coCRLF +
        '         -- HISTORICO CON FECHA DE TRASPASO A VENCIDO ' + coCRLF +
        '     (SELECT DISTINCT ID_CREDITO, F_TRASPASO_VENC FROM CR_HISTO_CRED ' + coCRLF +
        '      WHERE F_CIERRE BETWEEN ' + SQLFecha(sFIni) + ' AND ' + SQLFecha(sFFin) +
        '        AND F_TRASPASO_VENC IS NOT NULL) F_VE, ' + coCRLF +
        '     CONTRATO CTO, ' + coCRLF +
        '     CR_CONTRATO CRCTO, ' + coCRLF +
        '     PERSONA PER, ' + coCRLF +
        '     SECTOR SE, ' + coCRLF +
        '     MONEDA MON, ' + coCRLF +
        '     CR_PRODUCTO PR ' + coCRLF +
        'WHERE CRE.ID_CREDITO = TRAN.ID_CREDITO ' + coCRLF +
        '  AND CRE.ID_CREDITO = F_VE.ID_CREDITO ' + coCRLF +
        '  AND CRE.ID_CONTRATO = CTO.ID_CONTRATO ' + coCRLF +
        '  AND CRE.ID_CONTRATO = CRCTO.ID_CONTRATO ' + coCRLF +
        '  AND CTO.ID_TITULAR = PER.ID_PERSONA ' + coCRLF +
        '  AND PER.CVE_TIPO_SECTOR = SE.CVE_SECTOR ' + coCRLF +
        '  AND CTO.CVE_MONEDA = MON.CVE_MONEDA ' + coCRLF +
        '  AND CRCTO.CVE_PRODUCTO_CRE = PR.CVE_PRODUCTO_CRE ' + coCRLF;
  if TCartera = '0' then
    vlSQL := vlSQL +
        '  AND PR.CVE_TIPO_CARTERA   = ''BANCAR'''+coCRLF
  else
    vlSQL := vlSQL +
        '  AND PR.CVE_TIPO_CARTERA   <> ''BANCAR'''+coCRLF;

  If (Trim(sAcreditado)<>'') Then
    vlSQL := vlSQL +
        '  AND CTO.ID_TITULAR = ' + sAcreditado + coCRLF ;
  If (Trim(sMoneda)<>'') Then
    vlSQL:= vlSQL +
        '  AND CTO.CVE_MONEDA = ' + sMoneda + coCRLF ;
  If (Trim(sContrato)<>'') Then
    vlSQL:= vlSQL +
        '  AND CTO.ID_CONTRATO = ' + sContrato + coCRLF ;
  If (Trim(sMercObj)<>'') Then
    vlSQL:= vlSQL +
        '  AND PR.CVE_PRESUPUESTO = '''+ sMercObj+''''+  coCRLF ;
  If (Trim(sProducto)<>'') Then
    vlSQL:= vlSQL +
        '  AND CRCTO.CVE_PRODUCTO_CRE = '''+ sProducto+''''+  coCRLF ;
  If (Trim(sCatMinimo)<>'') Then
    vlSQL:= vlSQL +
        '  AND PR.CVE_CLAS_CONTAB = '''+ sCatMinimo +''''+  coCRLF ;
  If (Trim(sDisp)<>'') Then
    vlSQL:= vlSQL +
        '  AND CRE.ID_CREDITO = '+ sDisp+ coCRLF ;

    vlSQL:= vlSQL +
        'UNION ALL ' + coCRLF +
        'SELECT ''DECREMENTOS'' MOVTOS, ' + coCRLF +
        '       CAST(CASE WHEN OPE.AGRUPACION = ''PAGO'' THEN ' + coCRLF +
        '              (CASE WHEN CRE.SIT_CREDITO = ''LQ'' AND MAX(TR.F_OPERACION) = CRE.F_LIQUIDACION THEN ''PAGO TOTAL''  ' + coCRLF +
        '                    ELSE OPE.AGRUPACION END)  ' + coCRLF +
	'        ELSE OPE.AGRUPACION END AS VARCHAR2(20)) AGRUPACION, ' + coCRLF +
        '       CTO.CVE_MONEDA, ' + coCRLF +
        '           MON.DESC_MONEDA, ' + coCRLF +
        '       PER.CVE_TIPO_SECTOR, SE.DESC_SECTOR, ' + coCRLF +
        '       CRE.ID_CREDITO, ' + coCRLF +
        '       PER.NOMBRE ACREDITADO, ' + coCRLF +
        '           CRCTO.CVE_PRODUCTO_CRE, ' + coCRLF +
        '           CRE.F_INICIO, ' + coCRLF +
        '           CRE.F_VENCIMIENTO, ' + coCRLF +
        '           CRE.F_TRASPASO_VENC, ' + coCRLF +
//        '           SUM(CASE WHEN OPE.CVE_ACCESORIO = ''CP'' THEN (CASE WHEN CRCA.CVE_AFECTA_SDO=''I'' THEN TR.IMP_NETO ELSE TR.IMP_NETO*-1 END) ELSE 0 END) IMP_CP, ' + coCRLF +
//        '           SUM(CASE WHEN OPE.CVE_ACCESORIO = ''IN'' THEN (CASE WHEN CRCA.CVE_AFECTA_SDO=''I'' THEN TR.IMP_NETO ELSE TR.IMP_NETO*-1 END) ELSE 0 END) IMP_IN, ' + coCRLF +
        '           SUM(CASE WHEN OPE.CVE_ACCESORIO = ''CP'' THEN (CASE WHEN CRCA.CVE_AFECTA_SDO=''I'' THEN TR.IMP_NETO ELSE TR.IMP_NETO*-1 END) ELSE 0 END) +  ' + coCRLF +
        '	    SUM(CASE WHEN OPE.CVE_ACCESORIO = ''FN'' THEN  ' + coCRLF +
        '	            (CASE WHEN pkgcrconta.stpobtcve_tipo_mov (tr.id_credito, tr.cve_operacion, tr.id_periodo, trd.cve_concepto, tr.cve_tipo_movto, tr.f_operacion)<> ''CO'' then   ' + coCRLF +
        '	                  (CASE WHEN CRCA.CVE_AFECTA_SDO=''I'' THEN TRD.IMP_CONCEPTO ELSE TRD.IMP_CONCEPTO*-1 END) else 0 end)   ' + coCRLF +
        '				ELSE 0 END) IMP_CP,  ' + coCRLF +
        '           SUM(CASE WHEN OPE.CVE_ACCESORIO = ''IN'' THEN  ' + coCRLF +
        '	            (CASE WHEN pkgcrconta.stpobtcve_tipo_mov (tr.id_credito, tr.cve_operacion, tr.id_periodo, trd.cve_concepto, tr.cve_tipo_movto, tr.f_operacion)= ''CO'' then  ' + coCRLF +
        '	                  (CASE WHEN CRCA.CVE_AFECTA_SDO=''I'' THEN TRD.IMP_CONCEPTO ELSE TRD.IMP_CONCEPTO*-1 END) ELSE 0 END) ' + coCRLF +
        '				ELSE 0 END) IMP_IN,  ' + coCRLF +
        '       CRE.SIT_CREDITO, ' + coCRLF +
        '           CRE.F_LIQUIDACION, ' + coCRLF +
        '           CRE.ID_CRE_RENOVADO, ' + coCRLF +
        '           CRE.ID_CRE_RENUEVA, ' + coCRLF +
        '           CRE.TIPO_DISPOSICION, ' + coCRLF +
        '           CRE.CVE_TIPO_BAJA ' + coCRLF +
        'FROM CR_CREDITO CRE, ' + coCRLF +
        '     CR_TRANSACCION TR, ' + coCRLF +
        '     CR_DET_TRANSAC TRD, ' + coCRLF +
        '     (SELECT CVE_CLAVE CVE_OPERACION, DESC_CLAVE AGRUPACION, CVE_VALOR_ADIC CVE_ACCESORIO ' + coCRLF +
        '      FROM CR_CON_CAT_DATA ' + coCRLF +
        '      WHERE CVE_CON_GPO_CAT =''CAT_CVEOPE_CVEN'' ' + coCRLF +
        '        AND CVE_CLAVE NOT IN (''PAINFA'', ''RPAINF'') ) OPE, ' + coCRLF +
        '     CR_REL_CON_AFEC CRCA, ' + coCRLF +
        '     (SELECT * FROM CR_HISTO_CRED WHERE F_CIERRE BETWEEN ' + SQLFecha(sFIni) + '-1  AND ' + SQLFecha(sFFin) +
        '           AND F_TRASPASO_VENC IS NOT NULL) CAR_VEN, ' + coCRLF +
        '     CONTRATO CTO, ' + coCRLF +
        '     CR_CONTRATO CRCTO, ' + coCRLF +
        '     PERSONA PER, ' + coCRLF +
        '     SECTOR SE, ' + coCRLF +
        '     MONEDA MON, ' + coCRLF +
        '     CR_PRODUCTO PR ' + coCRLF +
        'WHERE TR.ID_CREDITO = CRE.ID_CREDITO ' + coCRLF +
        '  AND CAR_VEN.ID_CREDITO = TR.ID_CREDITO ' + coCRLF +
        '  AND CAR_VEN.F_CIERRE = TR.F_OPERACION-1 ' + coCRLF +
        '  AND TR.F_OPERACION BETWEEN ' + SQLFecha(sFIni) + ' AND ' + SQLFecha(sFFin) +
        '  AND TR.ID_TRANSACCION = TRD.ID_TRANSACCION ' + coCRLF +
        '  AND TR.CVE_OPERACION = OPE.CVE_OPERACION ' + coCRLF +
        '  AND OPE.CVE_OPERACION = CRCA.CVE_OPERACION ' + coCRLF +
        '  AND TRD.CVE_CONCEPTO = ''IMPBRU'' ' + coCRLF +
        '  AND CRE.SIT_CREDITO <> ''CA'' ' + coCRLF +
        '  AND TR.SIT_TRANSACCION = ''AC'' ' + coCRLF +
        '  AND TR.ID_TRANS_CANCELA IS NULL ' + coCRLF +
        '  AND TR.CVE_OPERACION = CRCA.CVE_OPERACION ' + coCRLF +
        '  AND CRCA.CVE_AFECTACION in (''CRCAPA'',''CIIMPA'',''FNIMPA'') ' + coCRLF +
        '  AND CRCA.CVE_TIPO_MOVTO = TR.CVE_TIPO_MOVTO ' + coCRLF +
        '  AND CRCA.CVE_CONCEPTO = TRD.CVE_CONCEPTO ' + coCRLF +
        '  AND CRE.ID_CONTRATO = CTO.ID_CONTRATO ' + coCRLF +
        '  AND CRE.ID_CONTRATO = CRCTO.ID_CONTRATO ' + coCRLF +
        '  AND CTO.ID_TITULAR = PER.ID_PERSONA ' + coCRLF +
        '  AND PER.CVE_TIPO_SECTOR = SE.CVE_SECTOR ' + coCRLF +
        '  AND CTO.CVE_MONEDA = MON.CVE_MONEDA ' + coCRLF +
        '  AND CRCTO.CVE_PRODUCTO_CRE = PR.CVE_PRODUCTO_CRE ' + coCRLF;
  if TCartera = '0' then
    vlSQL := vlSQL +
        '  AND PR.CVE_TIPO_CARTERA = ''BANCAR'''+coCRLF
  else
    vlSQL := vlSQL +
        '  AND PR.CVE_TIPO_CARTERA <> ''BANCAR'''+coCRLF;

  If (Trim(sAcreditado)<>'') Then
    vlSQL := vlSQL +
        '  AND CTO.ID_TITULAR = ' + sAcreditado + coCRLF ;
  If (Trim(sMoneda)<>'') Then
    vlSQL:= vlSQL +
        '  AND CTO.CVE_MONEDA = ' + sMoneda + coCRLF ;
  If (Trim(sContrato)<>'') Then
    vlSQL:= vlSQL +
        '  AND CTO.ID_CONTRATO = ' + sContrato + coCRLF ;
  If (Trim(sMercObj)<>'') Then
    vlSQL:= vlSQL +
        '  AND PR.CVE_PRESUPUESTO = '''+ sMercObj+''''+  coCRLF ;
  If (Trim(sProducto)<>'') Then
    vlSQL:= vlSQL +
        '  AND CRCTO.CVE_PRODUCTO_CRE = '''+ sProducto+''''+  coCRLF ;
  If (Trim(sCatMinimo)<>'') Then
    vlSQL:= vlSQL +
        '  AND PR.CVE_CLAS_CONTAB = '''+ sCatMinimo +''''+  coCRLF ;
  If (Trim(sDisp)<>'') Then
    vlSQL:= vlSQL +
        '  AND CRE.ID_CREDITO = ' + sDisp + coCRLF ;

    vlSQL:= vlSQL +
        'GROUP BY OPE.AGRUPACION, CTO.CVE_MONEDA, MON.DESC_MONEDA, PER.CVE_TIPO_SECTOR, SE.DESC_SECTOR, CRE.ID_CREDITO, ' + coCRLF +
        '      PER.NOMBRE, CRCTO.CVE_PRODUCTO_CRE, CRE.F_INICIO, CRE.F_VENCIMIENTO, CRE.F_TRASPASO_VENC, ' + coCRLF +
        '      CRE.F_LIQUIDACION, CRE.CVE_TIPO_BAJA, CRE.ID_CRE_RENOVADO, CRE.ID_CRE_RENUEVA, CRE.TIPO_DISPOSICION, CRE.SIT_CREDITO ' + coCRLF +
        'ORDER BY MOVTOS DESC, DESC_MONEDA, AGRUPACION, ID_CREDITO ' + coCRLF;

   Result:= vlSQL;
end;

procedure TQrMovCartVda.IniciaArchivoExcel(peFileName: String);
const aColumnWidth : Array[1..13] of Double = (20.00,  6.00,  6.00, 25.00,  8.00,
                                               25.00,  6.00,  8.50,  8.50,  8.50,
                                               10.00, 10.00, 10.00);

    procedure IniciaArchivoExcelNuevo;
    begin
      vgExcelApp := CreateOleObject('Excel.Application');
      vgExcelApp.Workbooks.Add;
    end;

var vlColumnRange : Variant;
    vlRange : Variant;
    vlCol : Integer;
begin
  IniciaArchivoExcelNuevo;

  vlColumnRange := vgExcelApp.Workbooks[1].WorkSheets[1].Columns;
  // Coloca el ancho de las columnas
  For vlCol := 1 To High(aColumnWidth) Do
    Begin
    vlColumnRange.Columns[vlCol].Font.Size := 8;
    vlColumnRange.Columns[vlCol].ColumnWidth := aColumnWidth[vlCol];
    End;
   If Assigned(vgStrList) Then vgStrList.Clear
   Else vgStrList := TStringList.Create;

   // Coloca los títulos de las columnas
   vgNumRow := 1;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := vgTitReporte;
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].MergeCells := True;

   // Deja un renglon en blanco
   Inc(vgNumRow);

   // Titulo de columnas
   Inc(vgNumRow);
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].Font.Bold := True;
      
//   vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'Tipo Movimiento';
//   vgExcelApp.Cells[ vgNumRow , ColumnXlS('B') ].Value := 'Moneda';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := 'Cve Sector';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('D') ].Value := 'Sector Contable';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('E') ].Value := 'Crédito';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('F') ].Value := 'Acreditado';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('G') ].Value := 'Producto';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value := 'F Inicio';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := 'F Vencimiento';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := 'F Trasp Vencido';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := 'Capital';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := 'Interés';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('M') ].Value := 'Total';

   //Le da formato al renglón de Titulos
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].Font.Bold := True;
   vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['A'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)];
   try
     vgExcelApp.ActiveWindow.FreezePanes:=False;
   finally
   end;

   // Deja un renglon en blanco
   Inc(vgNumRow);

   // Se aumenta un renglon más en donde dara inicio la colocación de la información
   Inc(vgNumRow);
end;

procedure TQrMovCartVda.QRLabel1Print(sender: TObject; var Value: String);
begin
     Value := 'SUBTOTAL  ' + qyMovCartVda.FieldByName('AGRUPACION').AsString;
end;

procedure TQrMovCartVda.DetailBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   If (Not vgBGeneraArchivo) Then Exit;
   //
   Inc(vgNumRow);

//   vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := qyMovCartVda.FieldByName('AGRUPACION').AsString;
//   vgExcelApp.Cells[ vgNumRow , ColumnXlS('B') ].Value := qyMovCartVda.FieldByName('CVE_MONEDA').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := qyMovCartVda.FieldByName('CVE_TIPO_SECTOR').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('D') ].Value := qyMovCartVda.FieldByName('DESC_SECTOR').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('E') ].Value := qyMovCartVda.FieldByName('ID_CREDITO').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('F') ].Value := qyMovCartVda.FieldByName('ACREDITADO').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('G') ].Value := qyMovCartVda.FieldByName('CVE_PRODUCTO_CRE').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value := qyMovCartVda.FieldByName('F_INICIO').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := qyMovCartVda.FieldByName('F_VENCIMIENTO').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := qyMovCartVda.FieldByName('F_TRASPASO_VENC').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := qyMovCartVda.FieldByName('IMP_CP').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := qyMovCartVda.FieldByName('IMP_IN').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('M') ].Value := (qyMovCartVda.FieldByName('IMP_CP').AsFloat + qyMovCartVda.FieldByName('IMP_IN').AsFloat);

   // Formato de número
   vgExcelApp.Range['K'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].NumberFormat := '#,##0.00';

end;

procedure TQrMovCartVda.QRGroupMonedaAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;

  Inc(vgNumRow);

  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].Font.Bold := True ;
  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].Columns.Interior.Color := clSilver;

  vgExcelApp.Cells[ vgNumRow , ColumnXlS('B') ].Value := 'Moneda : ' +
                '  ' + qyMovCartVda.FieldByName('CVE_MONEDA').AsString +
                '  ' + qyMovCartVda.FieldByName('DESC_MONEDA').AsString;
end;

procedure TQrMovCartVda.qrgTipoMovtoAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;

  Inc(vgNumRow);

  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].Font.Bold := True ;
  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].Font.Color := clWhite;
  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].Columns.Interior.ColorIndex := 1;

  vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := qyMovCartVda.FieldByName('MOVTOS').AsString;

end;

procedure TQrMovCartVda.QRGroupAgrupacionAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;

  Inc(vgNumRow);

  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].Font.Bold := True ;
  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].Font.Underline := True ;

  vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := qyMovCartVda.FieldByName('AGRUPACION').AsString;

  // se guarda el renglon en donde inicia el bloque para los subtotales
  vgRowIni := vgNumRow + 1;
end;

procedure TQrMovCartVda.qrbSubAgrupacionBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  vgRowFin := vgNumRow;
end;

procedure TQrMovCartVda.qrbSubMonedaAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var I : Integer;
    vlstrPlus : String;
    vlstrFormula1, vlstrFormula2, vlstrFormula3 : String;
begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;

    // Coloca Formúlas de SUMATORIAS
    vlstrPlus := '';
    vlstrFormula1 := '';
    vlstrFormula2 := '';

    For I := 0 To vgStrList.Count-1 Do
      Begin
      vlstrFormula1 := vlstrFormula1  + vlstrPlus + 'K' + vgStrList[I];
      vlstrFormula2 := vlstrFormula2  + vlstrPlus + 'L' + vgStrList[I];
      vlstrFormula3 := vlstrFormula3  + vlstrPlus + 'M' + vgStrList[I];
      vlstrPlus := '+';
      End;
    Inc(vgNumRow);
    Inc(vgNumRow);

    vgExcelApp.Cells[ vgNumRow , ColumnXlS('B') ].Value := 'TOTAL MONEDA';
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := '='+vlstrFormula1;
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := '='+vlstrFormula2;
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('M') ].Value := '='+vlstrFormula3;

  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].Font.Bold := True;
  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].Columns.Interior.Color := clSilver;
  vgExcelApp.Range['K'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].NumberFormat := '#,##0.00';

  vgStrList.Clear;
  Inc(vgNumRow);
  Inc(vgNumRow);
end;

procedure TQrMovCartVda.qrbSubAgrupacionAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   // Valida si se genera o no el Archivo de Excel
   If (Not vgBGeneraArchivo) Then Exit;
   //
   Inc(vgNumRow);
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].Font.Underline := True ;

   vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := 'SUBTOTAL : ' + qyMovCartVda.FieldByName('AGRUPACION').AsString;

   vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := '=SUM(K'+IntToStr(vgRowIni)+':K'+IntToStr(vgRowFin)+')';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := '=SUM(L'+IntToStr(vgRowIni)+':L'+IntToStr(vgRowFin)+')';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('M') ].Value := '=SUM(M'+IntToStr(vgRowIni)+':M'+IntToStr(vgRowFin)+')';

   vgExcelApp.Range['K'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].NumberFormat := '#,##0.00';
   vgStrList.Add(IntToStr(vgNumRow));

   Inc(vgNumRow);
end;

end.

