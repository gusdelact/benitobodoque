Unit IntQrCedExPg;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport, U_InterCustomStar,
  U_InterDigDoc, IntBlqCtos;
Type
  TQrCedExPg = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qyCedExPg: TQuery;
    QRSHPTCredito: TQRShape;
    QRLabel9: TQRLabel;
    QRSHPTCliente: TQRShape;
    QRLabel17: TQRLabel;
    QRSHPTChequera: TQRShape;
    QRLabel13: TQRLabel;
    QRFooterAcreditado: TQRBand;
    QRSHPTProveedor: TQRShape;
    QRLabel33: TQRLabel;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRSHPOrigen: TQRShape;
    QRShape2: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
    QRExpr9: TQRExpr;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRShape10: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText4: TQRDBText;
    qyCedExPgCVE_PRODUCTO_CRE: TStringField;
    qyCedExPgID_CONTRATO: TFloatField;
    qyCedExPgID_CREDITO: TFloatField;
    qyCedExPgID_CRE_RENOVADO: TFloatField;
    qyCedExPgIMP_AUTORIZADO: TFloatField;
    qyCedExPgIMP_CREDITO: TFloatField;
    qyCedExPgSDO_INSOLUTO: TFloatField;
    qyCedExPgCP_F_PROG_PAGO: TDateTimeField;
    qyCedExPgCP_F_PAGO: TDateTimeField;
    qyCedExPgCP_IMP_PAGADO: TFloatField;
    qyCedExPgCP_NUM_DIAS_VDO: TFloatField;
    qyCedExPgMONTO_CP: TFloatField;
    qyCedExPgCI_F_PROG_PAGO: TDateTimeField;
    qyCedExPgCI_F_PAGO: TDateTimeField;
    qyCedExPgCI_IMP_PAGADO: TFloatField;
    qyCedExPgCI_NUM_DIAS_VDO: TFloatField;
    qyCedExPgMONTO_IN: TFloatField;
    QRShape15: TQRShape;
    QRLabel18: TQRLabel;
    qyCedExPgID_PERSONA: TFloatField;
    qyCedExPgNOMBRE: TStringField;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    qrfIDCREDITO: TQRBand;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRExpr14: TQRExpr;
    QRShape18: TQRShape;
    QRLabel19: TQRLabel;
    QRShape19: TQRShape;
    QRLabel22: TQRLabel;
    qyCedExPgF_OPERACION_CP: TDateTimeField;
    qyCedExPgF_OPERACION_IN: TDateTimeField;
    qyCedExPgTX_NOTA: TStringField;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel23: TQRLabel;
    QRShape22: TQRShape;
    QRLabel24: TQRLabel;
    QRShape23: TQRShape;
    QRLabel25: TQRLabel;
    QRShape24: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    qyCedExPgF_PROG_PFN: TDateTimeField;
    qyCedExPgF_PAGO_FN: TDateTimeField;
    qyCedExPgIMP_PAG_PFN: TFloatField;
    qyCedExPgNUM_DIAS_VDO_FN: TFloatField;
    qyCedExPgDETALLE: TStringField;
    QRBand1: TQRBand;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    chbDetalle: TQRChildBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    qrlDiasMaxCP: TQRLabel;
    qrlDiasMaxIN: TQRLabel;
    QRExpr1: TQRExpr;
    QRShape25: TQRShape;
    qrlDiasMaxFN: TQRLabel;
    qrlDIAS_IMPAG_CP: TQRLabel;
    qrlDIAS_IMPAG_FN: TQRLabel;
    qrlDIAS_IMPAG_IN: TQRLabel;
    qyCedExPgNUM_DIAS_VDO: TFloatField;
    QRLabel28: TQRLabel;
    QRShape26: TQRShape;
    QRDBText2: TQRDBText;
    qrdbCVE_MONEDA: TQRDBText;
    qrshpCVE_MONEDA: TQRShape;
    qyCedExPgCVE_MONEDA: TFloatField;
    qyCedExPgDESC_MONEDA: TStringField;
    QRDBText6: TQRDBText;
    qrlblCVE_MONEDA: TQRLabel;
    QRGrpFooterMoneda: TQRBand;
    qrdbID_PROVEEDOR: TQRDBText;
    qrdbNOM_PROVEEDOR: TQRDBText;
    qrlblCVE_PROVEEDOR: TQRLabel;
    QRShape28: TQRShape;
    qrdbCVE_FND_ENT_DES: TQRDBText;
    qyCedExPgCVE_FND_ENT_DES: TStringField;
    qyCedExPgID_PROVEEDOR: TFloatField;
    qyCedExPgNOM_PROVEEDOR: TStringField;
    QRLabel29: TQRLabel;
    QRGrpFooterProveedor: TQRBand;
    QRGrpMoneda: TQRGroup;
    QRGrpProveedor: TQRGroup;

    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterAcreditadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QROrigenBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGrpProveedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGrpMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGrpFooterProveedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGrpFooterMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  Private
      vgbMuestraProveedor : Boolean;
  Public
      Function FormaQuery(peApli : TInterApli; sFIni, sFFin, sAcreditado, sDisp, sPromAsoc, sPromAdm, sGpoEconomico,
                          sProducto, sGpoProd, sFondeo, sEmpresa, sSucursal, sMoneda, sProveedor, sCveFndEntDes : String;
                          sDiasImp, sMuestraProveedor : Boolean): String;
  end;
Var
  QrCedExPg: TQrCedExPg;
  bGenArch: Boolean;
  Apli : TInterApli;
  sArchivo:String;
  F: TextFile;
  FIni     : String;
  FFin     : String;

  vgMaxDiasCP : Double;
  vgMaxDiasFN : Double;
  vgMaxDiasIN : Double;

Procedure RepCedExpPag( sFIni, sFFin, sAcreditado, sDisp, sPromAsoc, sPromAdm, sGpoEconomico,
                        sProducto, sGpoProd, sFondeo, sEmpresa, sSucursal, sMoneda, sProveedor,
                        sCveFndEntDes, sNbrArch : String; sDiasImp, sMuestraProveedor : Boolean;
                        pAPli : TInterApli; pPreview : Boolean
                      );
Implementation
{$R *.DFM}

Procedure RepCedExpPag( sFIni, sFFin, sAcreditado, sDisp, sPromAsoc, sPromAdm, sGpoEconomico,
                        sProducto, sGpoProd, sFondeo, sEmpresa, sSucursal, sMoneda, sProveedor,
                        sCveFndEntDes, sNbrArch : String; sDiasImp, sMuestraProveedor : Boolean;
                        pAPli : TInterApli; pPreview : Boolean
                      );
Var
   QrCedExPg: TQrCedExPg;
   Preview     : TIntQRPreview;
Begin
   vgMaxDiasCP :=0;
   vgMaxDiasFN :=0;
   vgMaxDiasIN :=0;
   QrCedExPg:=TQrCedExPg.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrCedExPg);
   Try
      bGenArch:= False;
      Apli := pApli;
      sArchivo:= sNbrArch;
      QrCedExPg.QRInterEncabezado1.Apli:=pApli;
      QrCedExPg.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrCedExPg.QRInterEncabezado1.NomReporte:='IntMQrCedExPg';
      QrCedExPg.QRInterEncabezado1.Titulo1:='Reporte Cédula de Experiencia de Pago';
      QrCedExPg.QRInterEncabezado1.Titulo2:=' Del ' + sFIni +' al ' + sFFin;

      if (Trim(sAcreditado)<>'')Then
         QrCedExPg.QRInterEncabezado1.Titulo1:= QrCedExPg.QRInterEncabezado1.Titulo1 + 'Por Acreditado '
      else If (Trim(sDisp)<>'')Then
         QrCedExPg.QRInterEncabezado1.Titulo1:= QrCedExPg.QRInterEncabezado1.Titulo1 + 'Por Crédito '
      else If (Trim(sPromAsoc)<>'')Then
         QrCedExPg.QRInterEncabezado1.Titulo1:= QrCedExPg.QRInterEncabezado1.Titulo1 + 'Por Promotor Asociado '
      else If (Trim(sPromAdm)<>'')Then
         QrCedExPg.QRInterEncabezado1.Titulo1:= QrCedExPg.QRInterEncabezado1.Titulo1 + 'Por Promotor Administrador '
      else If (Trim(sGpoEconomico)<>'')Then
         QrCedExPg.QRInterEncabezado1.Titulo1:= QrCedExPg.QRInterEncabezado1.Titulo1 + 'Por Grupo Económico '+ sGpoEconomico
      else If (Trim(sProducto)<>'')Then
         QrCedExPg.QRInterEncabezado1.Titulo1:= QrCedExPg.QRInterEncabezado1.Titulo1 + 'Por Producto de Crédito ' + sProducto
      else If (Trim(sGpoProd)<>'')Then
         QrCedExPg.QRInterEncabezado1.Titulo1:= QrCedExPg.QRInterEncabezado1.Titulo1 + 'Por Grupo Produto ' +  sGpoProd ;

  FIni     := sFIni;
  FFin     := sFFin;

      QrCedExPg.qyCedExPg.DatabaseName := pApli.DataBaseName;
      QrCedExPg.qyCedExPg.SessionName := pApli.SessionName;

      QrCedExPg.qyCedExPg.Active:=False;
      QrCedExPg.qyCedExPg.SQL.Text:= QrCedExPg.FormaQuery(pApli, sFIni, sFFin, sAcreditado, sDisp, sPromAsoc, sPromAdm, sGpoEconomico,
                                                          sProducto, sGpoProd, sFondeo, sEmpresa, sSucursal, sMoneda, sProveedor, sCveFndEntDes,
                                                          sDiasImp, sMuestraProveedor );
      QrCedExPg.vgbMuestraProveedor := sMuestraProveedor; // Muestra o no la Banda del Proveedor
      If QrCedExPg.vgbMuestraProveedor Then
         Begin
         QrCedExPg.QRGrpMoneda.Expression := 'qyCedExPg.CVE_MONEDA';
         QrCedExPg.QRGrpProveedor.Expression := 'qyCedExPg.ID_PROVEEDOR'
         End
      Else
         Begin
         QrCedExPg.QRGrpMoneda.Expression := '';
         QrCedExPg.QRGrpProveedor.Expression := '';
         End;

      QrCedExPg.qyCedExPg.SQL.SaveToFile('c:\CedExPg.txt');
      QrCedExPg.qyCedExPg.Active:=True;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrCedExPg.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F, QrCedExPg.QRInterEncabezado1.Titulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F, #09#09#09#09#09#09#09#09#09 + 'CAPITAL'+ #09#09#09#09#09#09 +'INTERESS'+ #09);
         Writeln(F,
             'Num. Acreditado'+ #09 +
             'Acreditado'+ #09 +
             'Sub Tipo ' +#09 +
             'No. Línea'+ #09 +
             'No. Crédito'+ #09 +
             'Crédito Renovado/Restructurado '+#09 +
             'Monto Autorización' +#09 +
             'Monto Crédito'+ #09 +
             'Saldo Insoluto' +  #09+
             'Fecha Programada de Pago' +  #09 +
             'Fecha de Pago' +  #09 +
             'Monto Pagado'+ #09 +
             'No. de Días de atraso'+ #09 +
             'Fecha de Operación' +  #09 +
             'Monto' +  #09+
             'Fecha Programada de Pago' +  #09 +
             'Fecha de Pago' +  #09 +
             'Monto Pagado'+ #09 +
             'No. de Días de atraso'+ #09 +
             'Fecha Programada de Pago' +  #09 +
             'Fecha de Pago' +  #09 +
             'Monto Pagado'+ #09 +
             'No. de Días de atraso'+ #09 +
             'Fecha de Operación' +  #09 +
             'Monto' +  #09+
             'Observaciones');
      End;

      If pPreview Then
         QrCedExPg.Preview
      Else
         QrCedExPg.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrCedExPg.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrCedExPg.FormaQuery(peApli : TInterApli; sFIni, sFFin, sAcreditado, sDisp, sPromAsoc, sPromAdm, sGpoEconomico,
                               sProducto, sGpoProd, sFondeo, sEmpresa, sSucursal, sMoneda, sProveedor, sCveFndEntDes : String;
                               sDiasImp, sMuestraProveedor : Boolean): String;
Var
    sSQL, sSQLINTER, sSQLICRE, vlFondeo,
    vlstrFilterMoneda, vlstrFilterMoneda1, 
    vlstrSQLFilterProveedor, vlstrSQLFilterCesion : String;
Begin
    // <SATV4766 23Mzo2009>
    // Se adicionan filtros por MONEDA y PROVEEDOR
    If (Trim(sMoneda) <> '') Then
        Begin
        vlstrFilterMoneda := ' AND C.CVE_MONEDA = '+sMoneda;
        vlstrFilterMoneda1 := ' AND CTO.CVE_MONEDA = '+sMoneda;
        End
    Else
        Begin
        vlstrFilterMoneda := '';
        vlstrFilterMoneda1 := '';
        End;

    If (Trim(sCveFndEntDes) <> '') Then
       Begin
       vlstrSQLFilterProveedor := ' WHERE ID_PROVEEDOR = '+sProveedor+' AND CVE_FND_ENT_DES = '+SQLStr(sCveFndEntDes);
       vlstrSQLFilterCesion := '';
       End
    Else
       Begin
       vlstrSQLFilterProveedor := '';
       vlstrSQLFilterCesion := '(+)';
       End;       
     //</SATV4766 23Mzo2009>

    //ICRE
    sSQLICRE :=  '      ( SELECT P.ID_PERSONA, P.NOMBRE, CCTO.CVE_PRODUCTO_CRE, CR.ID_CONTRATO, F.*,'+coCRLF +
                 '               CR.ID_CRE_RENOVADO, CCTO.IMP_AUTORIZADO, CR.IMP_CREDITO, CR.SDO_INSOLUTO'+coCRLF +
                 '        FROM '+coCRLF +
                 '             ( SELECT * FROM ('+coCRLF +

                 '                     SELECT ''0'' DETALLE,      NVL(A.ID_CREDITO,B.ID_CREDITO ) ID_CREDITO,        '' '' TX_NOTA, '+coCRLF +
               //MAGV 20091118 No imprime la fecha de pago si es mayor al periodo definido por el usuario
               //  '                            A.F_PROG_PAGO       CP_F_PROG_PAGO,      A.F_PAGO                  CP_F_PAGO,'+coCRLF +
                 '                            A.F_PROG_PAGO       CP_F_PROG_PAGO,      CASE WHEN A.F_PAGO > '+SQLFECHA(STRTODATETIME(SFFIN))+' THEN NULL ELSE A.F_PAGO END CP_F_PAGO,'+coCRLF +
               //<--MAGV 20091118
                 '                            NVL(A.IMP_PAGADO,0) CP_IMP_PAGADO,       NVL(A.NUM_DIAS_VENCIDO,0) CP_NUM_DIAS_VDO,'+coCRLF +
                 '                            TO_DATE(NULL,''DD/MM/YYYY'') F_OPERACION_CP ,        0 MONTO_CP,'+coCRLF +
               //MAGV 20091118 No imprime la fecha de pago si es mayor al periodo definido por el usuario
               //  '                            A.F_PROG_PFN, A.F_PAGO_FN, A.IMP_PAG_PFN,NVL(A.NUM_DIAS_VDO_FN,0) NUM_DIAS_VDO_FN,'+coCRLF +
                 '                            A.F_PROG_PFN, CASE WHEN A.F_PAGO_FN > '+SQLFECHA(STRTODATETIME(SFFIN))+' THEN NULL ELSE A.F_PAGO_FN END F_PAGO_FN, A.IMP_PAG_PFN,NVL(A.NUM_DIAS_VDO_FN,0) NUM_DIAS_VDO_FN,'+coCRLF +
               //<--MAGV 20091118
               //MAGV 20091118 No imprime la fecha de pago si es mayor al periodo definido por el usuario
               //  '                            B.F_PROG_PAGO       CI_F_PROG_PAGO,      B.F_PAGO                  CI_F_PAGO,'+coCRLF +
                 '                            B.F_PROG_PAGO       CI_F_PROG_PAGO,      CASE WHEN B.F_PAGO > '+SQLFECHA(STRTODATETIME(SFFIN))+' THEN NULL ELSE B.F_PAGO END                  CI_F_PAGO,'+coCRLF +
               //<--MAGV 20091118
                 '                            NVL(B.IMP_PAGADO,0) CI_IMP_PAGADO,       NVL(B.NUM_DIAS_VENCIDO,0) CI_NUM_DIAS_VDO,'+coCRLF +
                 '                            TO_DATE(NULL,''DD/MM/YYYY'') F_OPERACION_IN ,        0 MONTO_IN'+coCRLF +
//ARR 8SEP10                 '                     FROM ( SELECT PKGCRSALDOS.FUNREGCTAS(ID_CREDITO, ''CR'')R,  C.*'+coCRLF +
                 '                     FROM ( SELECT row_number() over (partition by ID_CREDITO order by f_prog_pago) R,  C.*'+coCRLF +
                 '                            FROM ( SELECT K.* '+coCRLF +
                 '                                   FROM ( SELECT CP.ID_CREDITO, CP.F_PROG_PAGO, ' +coCRLF +
               //MAGV 20091012 No sustituye la fecha de pago por la fecha programada de pago -->>
               //  '                                                 DECODE(CP.F_VALOR_PAGO,NULL,DECODE(CP.F_PAGO,NULL,CP.F_PROG_PAGO,CP.F_PAGO),CP.F_VALOR_PAGO) AS F_PAGO,' +coCRLF +
                 '                                                 DECODE(CP.F_VALOR_PAGO,NULL,CP.F_PAGO,CP.F_VALOR_PAGO) AS F_PAGO,' +coCRLF +
               //<-- MAGV20091012
               //end DHH 14.11.2008
               //'                                                 CP.F_PAGO,                     '+coCRLF +
               //end DHH 14.11.2008
                 '                                                 CP.IMP_PAGADO, '+coCRLF +// CP.NUM_DIAS_VENCIDO NUM_DIAS_VENCIDO,'+coCRLF + easa4011 19.05.2008 correccion
               //MAGV20091110
               //  '                                                 StpFunObtDiasVdos('+SQLFecha(StrToDateTime(sFFin)   )+', DECODE( CP.SIT_CAPITAL, ''IM'' , NULL , DECODE(CP.F_VALOR_PAGO,NULL,DECODE(CP.F_PAGO,NULL,CP.F_PROG_PAGO,CP.F_PAGO),CP.F_VALOR_PAGO) ),CP.F_PROG_PAGO,CP.SIT_CAPITAL) AS NUM_DIAS_VENCIDO,'+coCRLF+
               //RIRA 8sep10  '                                                 StpFunObtDiasVdos(DECODE( CASE WHEN (CP.F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') OR (CP.F_VALOR_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE CP.SIT_CAPITAL END, ''IM'' , '+SQLFecha(StrToDateTime(sFFin)   )+'+2, '+SQLFecha(StrToDateTime(sFFin)   )+'), DECODE( CP.SIT_CAPITAL, ''IM'' , NULL , DECODE(CP.F_VALOR_PAGO,NULL,DECODE(CP.F_PAGO,NULL,CP.F_PROG_PAGO,DECODE((CP.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((CP.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,CP.F_PAGO)),DECODE((CP.F_VALOR_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((CP.F_VALOR_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,CP.F_VALOR_PAGO)) ),CP.F_PROG_PAGO,CASE WHEN (CP.F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') OR (CP.F_VALOR_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE CP.SIT_CAPITAL END) AS NUM_DIAS_VENCIDO,'+coCRLF+ //MAGV 20091110
                 '                                                 StpFunObtDiasVdos(DECODE( CASE WHEN (NVL(CP.F_VALOR_PAGO,CP.F_PAGO) > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE CP.SIT_CAPITAL END, ''IM'' , '+SQLFecha(StrToDateTime(sFFin)   )+'+2, '+SQLFecha(StrToDateTime(sFFin)   )+'), DECODE( CP.SIT_CAPITAL, ''IM'' , NULL , DECODE(CP.F_VALOR_PAGO,NULL,DECODE(CP.F_PAGO,NULL,CP.F_PROG_PAGO,DECODE((CP.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((CP.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,CP.F_PAGO)),DECODE((CP.F_VALOR_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((CP.F_VALOR_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,CP.F_VALOR_PAGO)) ),CP.F_PROG_PAGO,CASE WHEN (NVL(CP.F_VALOR_PAGO,CP.F_PAGO) > '+SQLFecha(StrToDateTime(sFFin))+')  THEN ''IM'' ELSE CP.SIT_CAPITAL END) AS NUM_DIAS_VENCIDO,'+coCRLF+ //MAGV 20091110
               //end DHH 14.11.2008
               //'                                                 StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+', DECODE(CP.F_VALOR_PAGO,NULL,DECODE(CP.F_PAGO,NULL,CP.F_PROG_PAGO,CP.F_PAGO),CP.F_VALOR_PAGO),CP.F_PROG_PAGO,CP.SIT_CAPITAL) AS NUM_DIAS_VENCIDO,'+coCRLF+
               //end DHH 13.10.2008
               //'                                                 StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+', DECODE(CP.F_VALOR_PAGO,NULL,CP.F_PAGO,CP.F_PROG_PAGO),CP.F_PROG_PAGO,CP.SIT_CAPITAL) AS NUM_DIAS_VENCIDO,'+coCRLF+
               //end DHH 26.08.2008
               //'                                                 StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+',CP.F_VALOR_PAGO,CP.F_PROG_PAGO,CP.SIT_CAPITAL) AS NUM_DIAS_VENCIDO,'+coCRLF+
               //end easa 19.05.2008
                 '                                                 FN.F_PROG_PAGO F_PROG_PFN, ' +coCRLF +
                 '                                                 DECODE(FN.F_VALOR_PAGO,NULL,DECODE(FN.F_PAGO,NULL,FN.F_PROG_PAGO,FN.F_PAGO),FN.F_VALOR_PAGO) AS F_PAGO_FN, ' +coCRLF +
               //end DHH 14.11.2008
               //'                                                 FN.F_PAGO F_PAGO_FN,       ' +coCRLF +
               //end DHH 14.11.2008
                 '                                                 FN.IMP_PAGADO IMP_PAG_PFN,'+coCRLF +// FN.NUM_DIAS_VENCIDO NUM_DIAS_VDO_FN'+coCRLF +easa4011 19.05.2008 correccion
               //MAGV20091110
               //  '                                                 StpFunObtDiasVdos('+SQLFecha(StrToDateTime(sFFin)   )+', DECODE ( FN.SIT_FINAN_ADIC, ''IM'' , NULL ,  DECODE(FN.F_VALOR_PAGO,NULL,DECODE(FN.F_PAGO,NULL,FN.F_PROG_PAGO,FN.F_PAGO),FN.F_VALOR_PAGO) ),FN.F_PROG_PAGO,FN.SIT_FINAN_ADIC) AS NUM_DIAS_VDO_FN'+coCRLF+
               //RIRA 8Sep10  '                                                 StpFunObtDiasVdos(DECODE( CASE WHEN (FN.F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') OR (FN.F_VALOR_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE FN.SIT_FINAN_ADIC END, ''IM'' , '+SQLFecha(StrToDateTime(sFFin)   )+'+2, '+SQLFecha(StrToDateTime(sFFin)   )+'), DECODE ( FN.SIT_FINAN_ADIC, ''IM'' , NULL ,  DECODE(FN.F_VALOR_PAGO,NULL,DECODE(FN.F_PAGO,NULL,FN.F_PROG_PAGO,DECODE((FN.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((FN.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,FN.F_PAGO)),DECODE((FN.F_VALOR_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((FN.F_VALOR_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,FN.F_VALOR_PAGO)) ),FN.F_PROG_PAGO,CASE WHEN (FN.F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') OR (FN.F_VALOR_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE FN.SIT_FINAN_ADIC END) AS NUM_DIAS_VDO_FN'+coCRLF+  //MAGV 20091110
                 '                                                 StpFunObtDiasVdos(DECODE( CASE WHEN (NVL(FN.F_VALOR_PAGO,FN.F_PAGO) > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE FN.SIT_FINAN_ADIC END, ''IM'' , '+SQLFecha(StrToDateTime(sFFin)   )+'+2, '+SQLFecha(StrToDateTime(sFFin)   )+'), DECODE ( FN.SIT_FINAN_ADIC, ''IM'' , NULL ,  DECODE(FN.F_VALOR_PAGO,NULL,DECODE(FN.F_PAGO,NULL,FN.F_PROG_PAGO,DECODE((FN.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((FN.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,FN.F_PAGO)),DECODE((FN.F_VALOR_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((FN.F_VALOR_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,FN.F_VALOR_PAGO)) ),FN.F_PROG_PAGO,CASE WHEN (NVL(FN.F_VALOR_PAGO,FN.F_PAGO) > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE FN.SIT_FINAN_ADIC END) AS NUM_DIAS_VDO_FN'+coCRLF+  //MAGV 20091110
               //end DHH 14.11.2008
               //'                                                 StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+', DECODE(FN.F_VALOR_PAGO,NULL,DECODE(FN.F_PAGO,NULL,FN.F_PROG_PAGO,FN.F_PAGO),FN.F_VALOR_PAGO),FN.F_PROG_PAGO,FN.SIT_FINAN_ADIC) AS NUM_DIAS_VDO_FN'+coCRLF+
               //end DHH 13.10.2008
               //'                                                 StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+', DECODE(FN.F_VALOR_PAGO,NULL,FN.F_PAGO,FN.F_PROG_PAGO),FN.F_PROG_PAGO,FN.SIT_FINAN_ADIC) AS NUM_DIAS_VDO_FN'+coCRLF+
               //end DHH 26.08.2008
               //'                                                 StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+',FN.F_VALOR_PAGO,FN.F_PROG_PAGO,FN.SIT_FINAN_ADIC) AS NUM_DIAS_VDO_FN'+coCRLF+
               //end easa 19.05.2008
                 '                                          FROM ( SELECT * FROM CR_CAPITAL '+coCRLF +
               //RIRA4281 8Sep10  '                                                 WHERE ( ( F_PAGO >= ' + SQLFecha(StrToDateTime(sFIni)) +
                 '                                                 WHERE ( ( NVL(F_VALOR_PAGO,F_PAGO) >= ' + SQLFecha(StrToDateTime(sFIni)) +
                //RIRA4281 8SEP10                                                       ' AND F_PAGO <= ' + SQLFecha(StrToDateTime(sFFin)) + ' ) ' + coCRLF +
                                                                       ' AND NVL(F_VALOR_PAGO,F_PAGO) <= ' + SQLFecha(StrToDateTime(sFFin)) + ' ) ' + coCRLF +
               //'                                                      OR ( F_PAGO > F_PROG_PAGO )' + coCRLF +    // DHH20080915
                //RIRA4281 8sep10 '                                                      OR ( F_PAGO <= ' + SQLFecha(StrToDateTime(sFIni)) + ' AND SIT_CAPITAL = ''IM'' )'+coCRLF + //MAGV
                 '                                                      OR ( NVL(F_VALOR_PAGO,F_PAGO) <= ' + SQLFecha(StrToDateTime(sFIni)) + ' AND SIT_CAPITAL = ''IM'' )'+coCRLF + //MAGV
                //RIRA4281 8sep se comenta '                                                      OR ( F_PAGO IS NULL AND SIT_CAPITAL = ''IM'' )' + coCRLF +
               //MAGV 20091012 No considera la fecha programada de pago dentro del periodo -->>   ARR 8Sep10 se agregan las fechas programadas de pago dentro del periodo
                 '                                                      OR ( F_PROG_PAGO >=  ' + SQLFecha(StrToDateTime(sFIni)) + ' AND ' + coCRLF +
                 '                                                           F_PROG_PAGO <= '+ SQLFecha(StrToDateTime(sFFin)) + ' ) ' + coCRLF +
                 '                                                      OR ( F_PROG_PAGO <= ' + SQLFecha(StrToDateTime(sFIni)) + ' AND SIT_CAPITAL = ''IM'' )'+coCRLF + //RIRA4281 8SEP10
               //<-- MAGV20091012
                 '                                                       ) '+coCRLF +
                 '                                               ) CP,'+coCRLF +
                 '                                               ( SELECT * FROM CR_FINAN_ADIC ' +
                //RIRA4281 8sep10 '                                                 WHERE ( ( F_PAGO >= ' + SQLFecha(StrToDateTime(sFIni)) +
                 '                                                 WHERE ( ( NVL(F_VALOR_PAGO,F_PAGO) >= ' + SQLFecha(StrToDateTime(sFIni)) +
                //RIRA4281 8Sep10                                                       ' AND F_PAGO <= ' + SQLFecha(StrToDateTime(sFFin)) + ' ) ' + coCRLF +
                                                                       ' AND NVL(F_VALOR_PAGO,F_PAGO) <= ' + SQLFecha(StrToDateTime(sFFin)) + ' ) ' + coCRLF +
               //'                                                      OR ( F_PAGO > F_PROG_PAGO )' + coCRLF +  // DHH20080915
               //RIRA4281 8sep10  '                                                      OR ( F_PAGO <= ' + SQLFecha(StrToDateTime(sFIni)) + ' AND SIT_FINAN_ADIC = ''IM'' )'+coCRLF +
                 '                                                      OR ( NVL(F_VALOR_PAGO,F_PAGO) <= ' + SQLFecha(StrToDateTime(sFIni)) + ' AND SIT_FINAN_ADIC = ''IM'' )'+coCRLF +
               //RIRA4281 8Sep se comenta  '                                                      OR ( F_PAGO IS NULL AND SIT_FINAN_ADIC = ''IM'' )' + coCRLF +
                 '                                                      OR ( F_PROG_PAGO >=  ' + SQLFecha(StrToDateTime(sFIni)) + ' AND ' + coCRLF +
                 '                                                           F_PROG_PAGO <= '+ SQLFecha(StrToDateTime(sFFin)) + ' ) ' + coCRLF +
                 '                                                      OR ( F_PROG_PAGO <= ' + SQLFecha(StrToDateTime(sFIni)) + ' AND SIT_FINAN_ADIC = ''IM'' )'+coCRLF + //RIRA4281 8SEP10
                 '                                                       ) '+coCRLF +
                 '                                               ) FN'+coCRLF +
                 '                                          WHERE CP.ID_CREDITO  = FN.ID_CREDITO(+) AND CP.NUM_PERIODO = FN.NUM_PERIODO(+)';
                 If (Trim(sDisp)<>'')Then sSQLICRE := sSQLICRE + ' AND CP.ID_CREDITO = '+ sDisp ;
    sSQLICRE := sSQLICRE +
                 '                                        )K, CR_CREDITO CR, CONTRATO C '+coCRLF +
                 '                                   WHERE K.ID_CREDITO = CR.ID_CREDITO '+coCRLF +
                 '                                     AND CR.ID_CONTRATO = C.ID_CONTRATO '+coCRLF +
                 vlstrFilterMoneda+coCRLF+ //<SATV4766 23Mzo2009>
//CNBV 13112008                 ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMCEDEXPG', '                                     AND CR.ID_CONTRATO ', False ) + { < SATV4766 04/09/2006> }
                 ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMCEDEXPG', '                                     AND CR.ID_CREDITO ', False ) + { < SATV4766 04/09/2006> }
                 '                                     AND C.ID_EMPRESA  = '+ sEmpresa +coCRLF;
           If (Trim(sAcreditado)<>'')Then sSQLICRE := sSQLICRE + ' AND C.ID_TITULAR  = '+ sAcreditado ;
           If (Trim(sDisp)<>'')Then sSQLICRE := sSQLICRE + ' AND CR.ID_CREDITO = '+ sDisp ;
    sSQLICRE := sSQLICRE +
//                 '                                   ORDER BY K.ID_CREDITO, K.F_PROG_PAGO'+coCRLF +
                 '                                 )C'+coCRLF +
//ARR 8Sep10                 '                          )A,'+coCRLF +
                 '                          )A FULL OUTER JOIN '+coCRLF +
                 '                          (SELECT row_number() over (partition by ci.id_credito order by ci.f_prog_pago ) R,'+coCRLF +
                 '                                  CI.ID_CREDITO,CI.F_PROG_PAGO, '+coCRLF +
               //MAGV 20091012 No sustituye la fecha de pago por la fecha programada de pago -->>
               //  '                                  DECODE(CI.F_VALOR_PAGO,NULL,DECODE(CI.F_PAGO,NULL,CI.F_PROG_PAGO,CI.F_PAGO),CI.F_VALOR_PAGO) AS F_PAGO, '+coCRLF +
                 '                                  DECODE(CI.F_VALOR_PAGO,NULL,CI.F_PAGO,CI.F_VALOR_PAGO) AS F_PAGO, '+coCRLF +
               //<-- MAGV20091012
               //end DHH 14.11.2008
               //'                                  CI.F_VALOR_PAGO AS F_PAGO,    '+coCRLF +
               //end DHH 14.11.2008
                 '                                  CI.IMP_PAGADO,'+coCRLF +
               //MAGV 2009-10-02
                 '                                  CI.IMP_INTERES, CI.IMP_PAGADO AS IMPINTPAG ,'+coCRLF +
               //MAGV20091110
               //  '                                  StpFunObtDiasVdos('+SQLFecha(StrToDateTime(sFFin)   )+', DECODE ( CI.SIT_INTERES, ''IM'' , NULL , DECODE(CI.F_VALOR_PAGO,NULL,DECODE(CI.F_PAGO,NULL,CI.F_PROG_PAGO,CI.F_PAGO),CI.F_VALOR_PAGO) ),CI.F_PROG_PAGO,CI.SIT_INTERES) AS NUM_DIAS_VENCIDO'+coCRLF+
               //RIRA4281 8SEP10'                                  StpFunObtDiasVdos(DECODE( CASE WHEN (CI.F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') OR (CI.F_VALOR_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE CI.SIT_INTERES END, ''IM'' , '+SQLFecha(StrToDateTime(sFFin)   )+'+2, '+SQLFecha(StrToDateTime(sFFin)   )+'), DECODE ( CI.SIT_INTERES, ''IM'' , NULL , DECODE(CI.F_VALOR_PAGO,NULL,DECODE(CI.F_PAGO,NULL,CI.F_PROG_PAGO,DECODE((CI.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((CI.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,CI.F_PAGO)),DECODE((CI.F_VALOR_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((CI.F_VALOR_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,CI.F_VALOR_PAGO)) ),CI.F_PROG_PAGO,CASE WHEN (CI.F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') OR (CI.F_VALOR_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE CI.SIT_INTERES END) AS NUM_DIAS_VENCIDO'+coCRLF+  //MAGV20091110
               '                                  StpFunObtDiasVdos(DECODE( CASE WHEN (NVL(CI.F_VALOR_PAGO,CI.F_PAGO) > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE CI.SIT_INTERES END, ''IM'' , '+SQLFecha(StrToDateTime(sFFin)   )+'+2, '+SQLFecha(StrToDateTime(sFFin)   )+'), DECODE ( CI.SIT_INTERES, ''IM'' , NULL , DECODE(CI.F_VALOR_PAGO,NULL,DECODE(CI.F_PAGO,NULL,CI.F_PROG_PAGO,DECODE((CI.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((CI.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,CI.F_PAGO)),DECODE((CI.F_VALOR_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((CI.F_VALOR_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,CI.F_VALOR_PAGO)) ),CI.F_PROG_PAGO,CASE WHEN (NVL(CI.F_VALOR_PAGO,CI.F_PAGO) > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE CI.SIT_INTERES END) AS NUM_DIAS_VENCIDO'+coCRLF+  //MAGV20091110
               //end DHH 14.11.2008
               //'                                  StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+', DECODE(CI.F_VALOR_PAGO,NULL,DECODE(CI.F_PAGO,NULL,CI.F_PROG_PAGO,CI.F_PAGO),CI.F_VALOR_PAGO),CI.F_PROG_PAGO,CI.SIT_INTERES) AS NUM_DIAS_VENCIDO'+coCRLF+
               //end DHH 13.10.2008
               //'                                  StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+', DECODE(CI.F_VALOR_PAGO,NULL,CI.F_PAGO,CI.F_PROG_PAGO),CI.F_PROG_PAGO,CI.SIT_INTERES) AS NUM_DIAS_VENCIDO'+coCRLF+  // DHH 26-AGO-2008
               //end DHH 26.08.2008
               //'                                  StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+',CI.F_VALOR_PAGO,CI.F_PROG_PAGO,CI.SIT_INTERES) AS NUM_DIAS_VENCIDO'+coCRLF+  // EASA
                 '                           FROM CR_INTERES CI, CR_CREDITO CR, CONTRATO C '+coCRLF +
                //RIRA4281 8SEP10 '                           WHERE ( ( CI.F_PAGO >= ' + SQLFecha(StrToDateTime(sFIni)) + coCRLF +
                 '                           WHERE ( ( NVL(CI.F_VALOR_PAGO,CI.F_PAGO) >= ' + SQLFecha(StrToDateTime(sFIni)) + coCRLF +
                //RIRA4281 8SEP10 '                                 AND CI.F_PAGO <= ' + SQLFecha(StrToDateTime(sFFin)) + ' )' + coCRLF +
                 '                                 AND NVL(CI.F_VALOR_PAGO,CI.F_PAGO) <= ' + SQLFecha(StrToDateTime(sFFin)) + ' )' + coCRLF +
               //'                                OR ( CI.F_PAGO > CI.F_PROG_PAGO )' + coCRLF +    // DHH20080915
                //RIRA4281 8SEP10 '                                OR ( CI.F_PAGO <= ' + SQLFecha(StrToDateTime(sFIni)) +' AND CI.SIT_INTERES = ''IM'' ) '+ coCRLF + //MAGV
                 '                                OR ( NVL(CI.F_VALOR_PAGO,CI.F_PAGO) <= ' + SQLFecha(StrToDateTime(sFIni)) +' AND CI.SIT_INTERES = ''IM'' ) '+ coCRLF + //MAGV
               //RIRA4281 8SEP10 SE COMENTA  '                                OR ( CI.F_PAGO IS NULL AND CI.SIT_INTERES = ''IM'' )' + coCRLF +
                 '                                OR ( CI.F_PROG_PAGO >=  ' + SQLFecha(StrToDateTime(sFIni)) + ' AND ' + coCRLF +
                 '                                     CI.F_PROG_PAGO <= '+ SQLFecha(StrToDateTime(sFFin)) + ' )' + coCRLF + //MAGV 2009-10-02
                 '                                OR ( CI.F_PROG_PAGO <= ' + SQLFecha(StrToDateTime(sFIni)) +' AND CI.SIT_INTERES = ''IM'' )) '+ coCRLF + //RIRA4281 8SEP10
                 '                             AND CR.ID_CONTRATO = C.ID_CONTRATO '+coCRLF +
               //MAGV 2009-10-02
                 '                             and		 ( not (CI.IMP_INTERES = CI.IMP_PAGADO and CI.SIT_INTERES = ''IM'') ) '+coCRLF +
//CNBV 13112008                 ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMCEDEXPG', '                             AND CR.ID_CONTRATO ', False ) + { < SATV4766 04/09/2006> }
                 ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMCEDEXPG', '                                     AND CR.ID_CREDITO ', False ) + { < SATV4766 04/09/2006> }
                 '                             AND CI.ID_CREDITO = CR.ID_CREDITO AND  C.ID_EMPRESA  = '+ sEmpresa;
           If (Trim(sAcreditado)<>'')Then sSQLICRE := sSQLICRE + ' AND C.ID_TITULAR  = '+ sAcreditado ;
           If (Trim(sDisp)<>'')Then sSQLICRE := sSQLICRE + ' AND CR.ID_CREDITO = '+ sDisp ;
    sSQLICRE := sSQLICRE +
                 vlstrFilterMoneda+coCRLF+ //<SATV4766 23Mzo2009>
               //'                           ORDER BY ID_CREDITO, F_PROG_PAGO'+coCRLF +
                 '                          )B'+coCRLF +
//RIRA4281 8sep10               //'                     WHERE A.R(+) = B.R AND A.ID_CREDITO(+) = B.ID_CREDITO '; //MAGV 2009-10-02
                 '                     ON A.R = B.R AND A.ID_CREDITO = B.ID_CREDITO ';  //MAGV 2009-10-06
                 If sDiasImp Then  //MAGV 2009-10-06
                 sSQLICRE := sSQLICRE + 'and B.NUM_DIAS_VENCIDO > 0 '; //MAGV 2009-10-06
               //If (Trim(sDisp)<>'')Then sSQLICRE := sSQLICRE + ' AND A.ID_CREDITO = '+ sDisp ; //MAGV 2009-10-02
//RIRA4281 8Sep10                 If (Trim(sDisp)<>'')Then sSQLICRE := sSQLICRE + ' AND B.ID_CREDITO = '+ sDisp ;
                 If (Trim(sDisp)<>'')Then sSQLICRE := sSQLICRE + ' AND B.ID_CREDITO = '+ sDisp + ' AND A.ID_CREDITO = '+ sDisp;
{ ARR Adolfo 8sep10 se comenta ya que no es necesario ya que en el select anterior se implementa un "full outer join" y se evita este select
    sSQLICRE := sSQLICRE +
                 '                  UNION'+coCRLF +
                 '                     SELECT ''0'' DETALLE,      NVL(A.ID_CREDITO,B.ID_CREDITO ) ID_CREDITO,        '' '' TX_NOTA, '+coCRLF +
               //MAGV 20091118 No imprime la fecha de pago si es mayor al periodo definido por el usuario
               //  '                            A.F_PROG_PAGO       CP_F_PROG_PAGO,      A.F_PAGO                  CP_F_PAGO,'+coCRLF +
                 '                            A.F_PROG_PAGO       CP_F_PROG_PAGO,      CASE WHEN A.F_PAGO > '+SQLFECHA(STRTODATETIME(SFFIN))+' THEN NULL ELSE A.F_PAGO END CP_F_PAGO,'+coCRLF +
               //<--MAGV 20091118
                 '                            NVL(A.IMP_PAGADO,0) CP_IMP_PAGADO,       NVL(A.NUM_DIAS_VENCIDO,0) CP_NUM_DIAS_VDO,'+coCRLF +
                 '                            TO_DATE(NULL,''DD/MM/YYYY'') F_OPERACION_CP ,        0 MONTO_CP,'+coCRLF +
               //MAGV 20091118 No imprime la fecha de pago si es mayor al periodo definido por el usuario
               //  '                            A.F_PROG_PFN, A.F_PAGO_FN, A.IMP_PAG_PFN,NVL(A.NUM_DIAS_VDO_FN,0) NUM_DIAS_VDO_FN,'+coCRLF +
                 '                            A.F_PROG_PFN, CASE WHEN A.F_PAGO_FN > '+SQLFECHA(STRTODATETIME(SFFIN))+' THEN NULL ELSE A.F_PAGO_FN END F_PAGO_FN, A.IMP_PAG_PFN,NVL(A.NUM_DIAS_VDO_FN,0) NUM_DIAS_VDO_FN,'+coCRLF +
               //<--MAGV 20091118
               //MAGV 20091118 No imprime la fecha de pago si es mayor al periodo definido por el usuario
               //  '                            B.F_PROG_PAGO       CI_F_PROG_PAGO,      B.F_PAGO                  CI_F_PAGO,'+coCRLF +
                 '                            B.F_PROG_PAGO       CI_F_PROG_PAGO,      CASE WHEN B.F_PAGO > '+SQLFECHA(STRTODATETIME(SFFIN))+' THEN NULL ELSE B.F_PAGO END                  CI_F_PAGO,'+coCRLF +
               //<--MAGV 20091118
                 '                            NVL(B.IMP_PAGADO,0) CI_IMP_PAGADO,       NVL(B.NUM_DIAS_VENCIDO,0) CI_NUM_DIAS_VDO,'+coCRLF +
                 '                            TO_DATE(NULL,''DD/MM/YYYY'') F_OPERACION_IN ,        0 MONTO_IN'+coCRLF +
                 '                     FROM ( SELECT PKGCRSALDOS.FUNREGCTAS(ID_CREDITO, ''CR'')R,  C.*'+coCRLF +
                 '                            FROM ( SELECT K.* '+coCRLF +
                 '                                   FROM ( SELECT CP.ID_CREDITO, CP.F_PROG_PAGO, '+coCRLF +
               //MAGV 20091012 No sustituye la fecha de pago por la fecha programada de pago -->>
               //  '                                                 DECODE(CP.F_VALOR_PAGO,NULL,DECODE(CP.F_PAGO,NULL,CP.F_PROG_PAGO,CP.F_PAGO),CP.F_VALOR_PAGO) AS F_PAGO, '+coCRLF +
                 '                                                 DECODE(CP.F_VALOR_PAGO,NULL,CP.F_PAGO,CP.F_VALOR_PAGO) AS F_PAGO, '+coCRLF +
               //<-- MAGV20091012
               //end DHH 14.11.2008
               //'                                                 CP.F_PAGO,                     '+coCRLF +
               //end DHH 14.11.2008
                 '                                                 CP.IMP_PAGADO, '+coCRLF +//CP.NUM_DIAS_VENCIDO NUM_DIAS_VENCIDO,'+coCRLF +easa4011 19.05.2008 correccion
               //MAGV20091110
               //  '                                                 StpFunObtDiasVdos('+SQLFecha(StrToDateTime(sFFin)   )+', DECODE ( CP.SIT_CAPITAL, ''IM'' , NULL, DECODE(CP.F_VALOR_PAGO,NULL,DECODE(CP.F_PAGO,NULL,CP.F_PROG_PAGO,CP.F_PAGO),CP.F_VALOR_PAGO) ),CP.F_PROG_PAGO,CP.SIT_CAPITAL) AS NUM_DIAS_VENCIDO,'+coCRLF+
                 '                                                 StpFunObtDiasVdos(DECODE( CASE WHEN (CP.F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') OR (CP.F_VALOR_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE CP.SIT_CAPITAL END, ''IM'' , '+SQLFecha(StrToDateTime(sFFin)   )+'+2, '+SQLFecha(StrToDateTime(sFFin)   )+'), DECODE ( CP.SIT_CAPITAL, ''IM'' , NULL, DECODE(CP.F_VALOR_PAGO,NULL,DECODE(CP.F_PAGO,NULL,CP.F_PROG_PAGO,DECODE((CP.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((CP.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,CP.F_PAGO)),DECODE((CP.F_VALOR_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((CP.F_VALOR_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,CP.F_VALOR_PAGO)) ),CP.F_PROG_PAGO,CASE WHEN (CP.F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') OR (CP.F_VALOR_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE CP.SIT_CAPITAL END) AS NUM_DIAS_VENCIDO,'+coCRLF+  //MAGV20091110
               //end DHH 14.11.2008
               //'                                                 StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+', DECODE(CP.F_VALOR_PAGO,NULL,DECODE(CP.F_PAGO,NULL,CP.F_PROG_PAGO,CP.F_PAGO),CP.F_VALOR_PAGO),CP.F_PROG_PAGO,CP.SIT_CAPITAL) AS NUM_DIAS_VENCIDO,'+coCRLF+
               //end DHH 13.10.2008
               //'                                                 StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+', DECODE(CP.F_VALOR_PAGO,NULL,CP.F_PAGO,CP.F_PROG_PAGO),CP.F_PROG_PAGO,CP.SIT_CAPITAL) AS NUM_DIAS_VENCIDO,'+coCRLF+
               //end DHH 26.08.2008
               //'                                                 StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+',CP.F_VALOR_PAGO,CP.F_PROG_PAGO,CP.SIT_CAPITAL) AS NUM_DIAS_VENCIDO,'+coCRLF+
               //end easa 19.05.2008
                 '                                                 FN.F_PROG_PAGO F_PROG_PFN, '+coCRLF +
               //MAGV 20091012 No sustituye la fecha de pago por la fecha programada de pago -->>
               //  '                                                 DECODE(FN.F_VALOR_PAGO,NULL,DECODE(FN.F_PAGO,NULL,FN.F_PROG_PAGO,FN.F_PAGO),FN.F_VALOR_PAGO) AS F_PAGO_FN, '+coCRLF +
               '                                                 DECODE(FN.F_VALOR_PAGO,NULL,FN.F_PAGO,FN.F_VALOR_PAGO) AS F_PAGO_FN, '+coCRLF +
               //<-- MAGV20091012
               //end DHH 14.11.2008
               //'                                                 FN.F_PAGO F_PAGO_FN,       '+coCRLF +
               //end DHH 14.11.2008
                 '                                                 FN.IMP_PAGADO IMP_PAG_PFN, '+coCRLF +//FN.NUM_DIAS_VENCIDO NUM_DIAS_VDO_FN'+coCRLF +easa4011 19.05.2008 correccion
               //MAGV20091110
               //  '                                                 StpFunObtDiasVdos('+SQLFecha(StrToDateTime(sFFin)   )+', DECODE ( FN.SIT_FINAN_ADIC , ''IM'' , NULL , DECODE(FN.F_VALOR_PAGO,NULL,DECODE(FN.F_PAGO,NULL,FN.F_PROG_PAGO,FN.F_PAGO),FN.F_VALOR_PAGO) ),FN.F_PROG_PAGO,FN.SIT_FINAN_ADIC) AS NUM_DIAS_VDO_FN'+coCRLF+
                 '                                                 StpFunObtDiasVdos(DECODE( CASE WHEN (FN.F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') OR (FN.F_VALOR_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE FN.SIT_FINAN_ADIC END, ''IM'' , '+SQLFecha(StrToDateTime(sFFin)   )+'+2, '+SQLFecha(StrToDateTime(sFFin)   )+'), DECODE ( FN.SIT_FINAN_ADIC , ''IM'' , NULL , DECODE(FN.F_VALOR_PAGO,NULL,DECODE(FN.F_PAGO,NULL,FN.F_PROG_PAGO,DECODE((FN.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((FN.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,FN.F_PAGO)),DECODE((FN.F_VALOR_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((FN.F_VALOR_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,FN.F_VALOR_PAGO)) ),FN.F_PROG_PAGO,CASE WHEN (FN.F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') OR (FN.F_VALOR_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE FN.SIT_FINAN_ADIC END) AS NUM_DIAS_VDO_FN'+coCRLF+  //MAGV20091110
               //end DHH 14.11.2008
               //'                                                 StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+', DECODE(FN.F_VALOR_PAGO,NULL,DECODE(FN.F_PAGO,NULL,FN.F_PROG_PAGO,FN.F_PAGO),FN.F_VALOR_PAGO),FN.F_PROG_PAGO,FN.SIT_FINAN_ADIC) AS NUM_DIAS_VDO_FN'+coCRLF+
               //end DHH 13.10.2008
               //'                                                 StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+', DECODE(FN.F_VALOR_PAGO,NULL,FN.F_PAGO,FN.F_PROG_PAGO),FN.F_PROG_PAGO,FN.SIT_FINAN_ADIC) AS NUM_DIAS_VDO_FN'+coCRLF+
               //end DHH 26.08.2008
               //'                                                 StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+',FN.F_VALOR_PAGO,FN.F_PROG_PAGO,FN.SIT_FINAN_ADIC) AS NUM_DIAS_VDO_FN'+coCRLF+
               //end easa 19.05.2008
                 '                                          FROM ( SELECT * FROM CR_CAPITAL '+coCRLF +
                 '                                                 WHERE ( ( F_PAGO >= ' + SQLFecha(StrToDateTime(sFIni)) +
                                                                       ' AND F_PAGO <= ' + SQLFecha(StrToDateTime(sFFin)) + ' ) ' + coCRLF +
               //'                                                      OR ( F_PAGO > F_PROG_PAGO )' + coCRLF +    // DHH20080915
                 '                                                      OR ( F_PAGO <= ' + SQLFecha(StrToDateTime(sFIni)) + ' AND SIT_CAPITAL = ''IM'' )'+coCRLF + //MAGV
                 '                                                      OR ( F_PAGO IS NULL AND SIT_CAPITAL = ''IM'' )' + coCRLF +
                 '                                                      OR ( F_PROG_PAGO >=  ' + SQLFecha(StrToDateTime(sFIni)) + ' AND ' + coCRLF +
                 '                                                           F_PROG_PAGO <= '+ SQLFecha(StrToDateTime(sFFin)) + ' ) ' + coCRLF +
                 '                                                       ) '+coCRLF +
                 '                                               ) CP,'+coCRLF +
                 '                                               ( SELECT * FROM CR_FINAN_ADIC ' +
                 '                                                 WHERE ( ( F_PAGO >= ' + SQLFecha(StrToDateTime(sFIni)) +
                                                                       ' AND F_PAGO <= ' + SQLFecha(StrToDateTime(sFFin)) + ' ) ' + coCRLF +
               //'                                                      OR ( F_PAGO > F_PROG_PAGO )' + coCRLF +   // DHH20080915
                 '                                                      OR ( F_PAGO <= ' + SQLFecha(StrToDateTime(sFIni)) + ' AND SIT_FINAN_ADIC = ''IM'' )'+coCRLF + //MAGV
                 '                                                      OR ( F_PAGO IS NULL AND SIT_FINAN_ADIC = ''IM'' )' + coCRLF +
                 '                                                      OR ( F_PROG_PAGO >=  ' + SQLFecha(StrToDateTime(sFIni)) + ' AND ' + coCRLF +
                 '                                                           F_PROG_PAGO <= '+ SQLFecha(StrToDateTime(sFFin)) + ' ) ' + coCRLF +
                 '                                                       ) '+coCRLF +
                 '                                               ) FN'+coCRLF +
                 '                                          WHERE CP.ID_CREDITO  = FN.ID_CREDITO(+) AND CP.NUM_PERIODO = FN.NUM_PERIODO(+)';
                 If (Trim(sDisp)<>'')Then sSQLICRE := sSQLICRE + ' AND CP.ID_CREDITO = '+ sDisp ;
    sSQLICRE := sSQLICRE +
                 '                                        )K, CR_CREDITO CR, CONTRATO C '+coCRLF +
                 '                                   WHERE K.ID_CREDITO = CR.ID_CREDITO '+coCRLF +
                 vlstrFilterMoneda+coCRLF+ //<SATV4766 23Mzo2009>                 
                 '                                     AND CR.ID_CONTRATO = C.ID_CONTRATO '+coCRLF +
//CNBV 13112008                 ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMCEDEXPG', '                                     AND CR.ID_CONTRATO ', False ) + // < SATV4766 04/09/2006>
                 ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMCEDEXPG', '                                     AND CR.ID_CREDITO ', False ) + // < SATV4766 04/09/2006>
                 '                                     AND C.ID_EMPRESA  = '+ sEmpresa +coCRLF;
           If (Trim(sAcreditado)<>'')Then sSQLICRE := sSQLICRE + ' AND C.ID_TITULAR  = '+ sAcreditado ;
           If (Trim(sDisp)<>'')Then sSQLICRE := sSQLICRE + ' AND CR.ID_CREDITO = '+ sDisp ;
    sSQLICRE := sSQLICRE +
               //'                                   ORDER BY K.ID_CREDITO, K.F_PROG_PAGO'+coCRLF +
                 '                                 )C'+coCRLF +
                 '                          )A,'+coCRLF +
                 '                          (SELECT PKGCRSALDOS.FUNREGCTAS(CI.ID_CREDITO, ''DV'') R,'+coCRLF +
                 '                                  CI.ID_CREDITO,CI.F_PROG_PAGO, '+coCRLF +
               //MAGV 20091012 No sustituye la fecha de pago por la fecha programada de pago -->>
               //  '                                  DECODE(CI.F_VALOR_PAGO,NULL,DECODE(CI.F_PAGO,NULL,CI.F_PROG_PAGO,CI.F_PAGO),CI.F_VALOR_PAGO) AS F_PAGO, '+coCRLF +
                 '                                  DECODE(CI.F_VALOR_PAGO,NULL,CI.F_PAGO,CI.F_VALOR_PAGO) AS F_PAGO, '+coCRLF +
               //<-- MAGV20091012
               //end DHH 14.11.2008
               //'                                  CI.F_VALOR_PAGO as F_PAGO,    '+coCRLF +
               //end DHH 14.11.2008
                 '                                  CI.IMP_PAGADO,  '+coCRLF + // CI.NUM_DIAS_VENCIDO '+coCRLF + easa4011 19.05.2008 correccion
               //MAGV 2009-10-02
                 '                                  CI.IMP_INTERES, CI.IMP_PAGADO AS IMPINTPAG ,'+coCRLF +
               //MAGV20091110
               //  '                                  StpFunObtDiasVdos('+SQLFecha(StrToDateTime(sFFin)   )+', DECODE ( CI.SIT_INTERES, ''IM'' , NULL , DECODE(CI.F_VALOR_PAGO,NULL,DECODE(CI.F_PAGO,NULL,CI.F_PROG_PAGO,CI.F_PAGO),CI.F_VALOR_PAGO) ),CI.F_PROG_PAGO,CI.SIT_INTERES) AS NUM_DIAS_VENCIDO'+coCRLF+
                 '                                  StpFunObtDiasVdos(DECODE( CASE WHEN (CI.F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') OR (CI.F_VALOR_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE CI.SIT_INTERES END, ''IM'' , '+SQLFecha(StrToDateTime(sFFin)   )+'+2, '+SQLFecha(StrToDateTime(sFFin)   )+'), DECODE ( CI.SIT_INTERES, ''IM'' , NULL , DECODE(CI.F_VALOR_PAGO,NULL,DECODE(CI.F_PAGO,NULL,CI.F_PROG_PAGO,DECODE((CI.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((CI.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,CI.F_PAGO)),DECODE((CI.F_VALOR_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((CI.F_VALOR_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,CI.F_VALOR_PAGO)) ),CI.F_PROG_PAGO,CASE WHEN (CI.F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') OR (CI.F_VALOR_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE CI.SIT_INTERES END) AS NUM_DIAS_VENCIDO'+coCRLF+  //MAGV20091110
               //end DHH 14.11.2008
               //'                                  StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+', DECODE(CI.F_VALOR_PAGO,NULL,DECODE(CI.F_PAGO,NULL,CI.F_PROG_PAGO,CI.F_PAGO),CI.F_VALOR_PAGO),CI.F_PROG_PAGO,CI.SIT_INTERES) AS NUM_DIAS_VENCIDO'+coCRLF+
               //end DHH 13.10.2008
               //'                                  StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+', DECODE(CI.F_VALOR_PAGO,NULL,CI.F_PAGO,CI.F_PROG_PAGO),CI.F_PROG_PAGO,CI.SIT_INTERES) AS NUM_DIAS_VENCIDO'+coCRLF+
               //end DHH 26.08.2008
               //'                                  StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+',CI.F_VALOR_PAGO,CI.F_PROG_PAGO,CI.SIT_INTERES) AS NUM_DIAS_VENCIDO'+coCRLF+
               //end easa 19.05.2008
                 '                           FROM CR_INTERES CI, CR_CREDITO CR, CONTRATO C '+coCRLF +
                 '                           WHERE ( ( CI.F_PAGO >= ' + SQLFecha(StrToDateTime(sFIni)) + coCRLF +
                 '                                 AND CI.F_PAGO <= ' + SQLFecha(StrToDateTime(sFFin)) + ' )' + coCRLF +
               //'                                OR ( CI.F_PAGO > CI.F_PROG_PAGO )' + coCRLF +   // DHH20080915
                 '                                OR ( CI.F_PAGO <= ' + SQLFecha(StrToDateTime(sFIni)) +' AND CI.SIT_INTERES = ''IM'' ) '+ coCRLF + //MAGV
                 '                                OR ( CI.F_PAGO IS NULL AND CI.SIT_INTERES = ''IM'' )' + coCRLF +
                 '                                OR ( CI.F_PROG_PAGO >=  ' + SQLFecha(StrToDateTime(sFIni)) + ' AND ' + coCRLF +
                 '                                     CI.F_PROG_PAGO <= '+ SQLFecha(StrToDateTime(sFFin)) + ' ) )' + coCRLF + //MAGV 2009-10-02
                 '                             AND CR.ID_CONTRATO = C.ID_CONTRATO '+coCRLF +
               //MAGV 2009-10-02
                 '                             and		 ( not (CI.IMP_INTERES = CI.IMP_PAGADO and CI.SIT_INTERES = ''IM'') ) '+coCRLF +
                 vlstrFilterMoneda+coCRLF+ //<SATV4766 23Mzo2009>                 
//CNBV 13112008                 ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMCEDEXPG', '                             AND CR.ID_CONTRATO ', False ) + // < SATV4766 04/09/2006>
                 ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMCEDEXPG', '                                     AND CR.ID_CREDITO ', False ) + // < SATV4766 04/09/2006>
                 '                             AND CI.ID_CREDITO = CR.ID_CREDITO AND  C.ID_EMPRESA  = '+ sEmpresa;
           If (Trim(sAcreditado)<>'')Then sSQLICRE := sSQLICRE + ' AND C.ID_TITULAR  = '+ sAcreditado ;
           If (Trim(sDisp)<>'')Then sSQLICRE := sSQLICRE + ' AND CR.ID_CREDITO = '+ sDisp ;
    sSQLICRE := sSQLICRE +
               //'                           ORDER BY ID_CREDITO, F_PROG_PAGO'+coCRLF +
                 '                          )B'+coCRLF +
               //'                     WHERE A.R = B.R(+) AND A.ID_CREDITO = B.ID_CREDITO(+) '; //MAGV2009-10-02
                 '                     WHERE A.R = B.R(+) AND A.ID_CREDITO = B.ID_CREDITO(+) '; //MAGV2009-10-02
                 If (Trim(sDisp)<>'')Then sSQLICRE := sSQLICRE + ' AND A.ID_CREDITO = '+ sDisp ;
   Termina -> ARR Adolfo 8sep10 se comenta ya que no es necesario ya que en el select anterior se implementa un "full outer join" y se evita este select
   }
    sSQLICRE := sSQLICRE +
                 '                  UNION'+coCRLF +
                 '                     SELECT ''1'' DETALLE,                               CT.ID_CREDITO,                 CT.TX_NOTA,'+coCRLF +
                 '                            TO_DATE(NULL,''DD/MM/YYYY'') CP_F_PROG_PAGO, TO_DATE(NULL,''DD/MM/YYYY'') CP_F_PAGO,'+coCRLF +
                 '                            0  CP_IMP_PAGADO,       0 CP_NUM_DIAS_VDO,'+coCRLF +
                 '                            DECODE( CO.CVE_ACCESORIO,''CP'',CT.F_OPERACION, ''FN'',CT.F_OPERACION,'+coCRLF +
                 '                            TO_DATE(NULL,''DD/MM/YYYY'') ) F_OPERACION_CP,'+coCRLF +
                 '                            DECODE( CO.CVE_ACCESORIO,''CP'',CT.IMP_NETO, ''FN'',CT.IMP_NETO, 0 ) MONTO_CP,'+coCRLF +
                 '                            TO_DATE(NULL,''DD/MM/YYYY'')  F_PROG_PFN, TO_DATE(NULL,''DD/MM/YYYY'')  F_PAGO_FN, 0 IMP_PAG_PFN, 0 NUM_DIAS_VDO_FN,'+coCRLF +
                 '                            TO_DATE(NULL,''DD/MM/YYYY'') CI_F_PROG_PAGO,      TO_DATE(NULL,''DD/MM/YYYY'') CI_F_PAGO,'+coCRLF +
                 '                            0 CI_IMP_PAGADO,       0 CI_NUM_DIAS_VDO,'+coCRLF +
                 '                            DECODE( CO.CVE_ACCESORIO,''IN'', CT.F_OPERACION, TO_DATE(NULL,''DD/MM/YYYY'')  ) F_OPERACION_IN,'+coCRLF +
                 '                            DECODE( CO.CVE_ACCESORIO,''IN'',CT.IMP_NETO, 0 ) MONTO_IN'+coCRLF +
                 '                     FROM CR_TRANSACCION CT, CR_OPERACION CO, CONTRATO CTO'+coCRLF +
                 '                     WHERE CT.F_OPERACION >= ' + SQLFecha(StrToDateTime(sFIni))+coCRLF +
                 '                       AND CT.F_OPERACION <= ' + SQLFecha(StrToDateTime(sFFin))+coCRLF +
                 '                       AND CT.CVE_OPERACION IN (''CASTCN'',''CASTCP'',''CASTFN'',''CASTIN'',''CODNCN'',''CODNCP'',''CODNFN'',''CODNIN'','+coCRLF +
                 '                                                ''QUEBCN'',''QUEBCP'',''QUEBFN'',''QUEBIN'',''QUITCN'',''QUITCP'',''QUITFN'',''QUITIN'','+coCRLF +
                 '                                                ''DISPRE'',''DISPRS'')'+coCRLF +
                 '                       AND CO.CVE_ACCESORIO IN (''CP'',''IN'',''FN'')'+coCRLF +
                 '                       AND CO.CVE_OPERACION = CT.CVE_OPERACION AND CTO.ID_CONTRATO = CT.ID_CONTRATO  '+coCRLF+
                 vlstrFilterMoneda1+coCRLF + //<SATV4766 24MZO2009>                 
//CNBV 13112008                 ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMCEDEXPG', '                       AND CTO.ID_CONTRATO ', False ) { < SATV4766 04/09/2006> }
                 ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMCEDEXPG', '                                     AND CT.ID_CREDITO ', False )  { < SATV4766 04/09/2006> }
                 ;
                 If (Trim(sAcreditado)<>'')Then sSQLICRE := sSQLICRE + ' AND CTO.ID_TITULAR  = '+ sAcreditado ;
                 If (Trim(sDisp)<>'')Then sSQLICRE := sSQLICRE + ' AND CT.ID_CREDITO = '+ sDisp ;
    sSQLICRE := sSQLICRE +
                 '                     )'+coCRLF +
                 '             ) F, ' +coCRLF +
                 '             ( SELECT * FROM CR_CREDITO WHERE SIT_CREDITO <> ''CA'' '+coCRLF +
                 '                  AND ( F_LIQUIDACION >= '+ SQLFecha(StrToDateTime(sFIni))+ 'OR F_LIQUIDACION IS NULL)';
                 If (Trim(sDisp)<>'')Then sSQLICRE := sSQLICRE + ' AND ID_CREDITO = '+ sDisp ;
    sSQLICRE := sSQLICRE +
                 '             )CR, CONTRATO CTO, CR_CONTRATO CCTO, PERSONA P, CR_PRODUCTO CPP, CR_ACREDITADO CA'+coCRLF +
                 ' WHERE CCTO.ID_CONTRATO  = CR.ID_CONTRATO'+coCRLF +
                 vlstrFilterMoneda1+coCRLF + //<SATV4766 24MZO2009>                 
//CNBV 13112008                 ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMCEDEXPG', '   AND CCTO.ID_CONTRATO ', False ) + { < SATV4766 04/09/2006> }
                 ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMCEDEXPG', '                                     AND CR.ID_CREDITO ', False ) + { < SATV4766 04/09/2006> }
                 '   AND CCTO.FOL_CONTRATO = CR.FOL_CONTRATO'+coCRLF +
                 '   AND CTO.ID_CONTRATO   = CR.ID_CONTRATO'+coCRLF +
                 '   AND F.ID_CREDITO      = CR.ID_CREDITO '+coCRLF  +
                 '   AND P.ID_PERSONA      = CTO.ID_TITULAR '+coCRLF  +
                 '   AND CA.ID_ACREDITADO  = CTO.ID_TITULAR '+coCRLF +
                 '   AND CCTO.CVE_PRODUCTO_CRE = CPP.CVE_PRODUCTO_CRE '+coCRLF;

                 If (Trim(sFondeo) <> '') THEN BEGIN
                    vlFondeo := '';
                    If (Trim(sFondeo) = 'F') THEN
                       vlFondeo := ' NOT ';

                    sSQLICRE := sSQLICRE + ' AND CR.ID_CREDITO ' + vlFondeo + ' IN ( SELECT ID_CREDITO FROM CR_FND_CREDITO '+
                      ' WHERE SIT_CREDITO IN (''LQ'',''AC'') AND PCT_REDESCONTADO > 0) ' ;
                 END;

                 If (Trim(sEmpresa)<>'')   Then sSQLICRE := sSQLICRE + ' AND CTO.ID_EMPRESA  = '+ sEmpresa ;
                 If (Trim(sAcreditado)<>'')Then sSQLICRE := sSQLICRE + ' AND CTO.ID_TITULAR  = '+ sAcreditado ;
                 If (Trim(sDisp)<>'')Then sSQLICRE := sSQLICRE + ' AND CR.ID_CREDITO = '+ sDisp ;
                 If (Trim(sPromAsoc)<>'')Then sSQLICRE := sSQLICRE + ' AND CTO.ID_PERS_ASOCIAD  = '+ sPromAsoc;
                 If (Trim(sPromAdm)<>'')Then sSQLICRE := sSQLICRE + ' AND CR.ID_PROM_ADM  = '+ sPromAdm ;
                 If (Trim(sGpoEconomico)<>'')Then sSQLICRE := sSQLICRE + ' AND CA.CVE_GRUPO_ECO = '+ SQLStr( sGpoEconomico );
                 If (Trim(sProducto)<>'')Then sSQLICRE := sSQLICRE + ' AND CCTO.CVE_PRODUCTO_CRE  = '+ SQLStr( sProducto );
                 If (Trim(sGpoProd)<>'')Then sSQLICRE := sSQLICRE + ' AND CPP.CVE_PRODUCTO_GPO  = '+ SQLStr( sGpoProd );
//-----------------------------------------------------------------------------------------------------------------------------------------
    //INTERCREDITOS
//-----------------------------------------------------------------------------------------------------------------------------------------
    sSQLINTER := '        SELECT P.ID_PERSONA, P.NOMBRE, TO_CHAR(CCTO.CVE_SUB_TIP_BCO), CR.ID_CONTRATO, F.*, '+coCRLF +
                 '               CR.ID_CRE_RENOVADO, CCTO.IMP_AUTORIZADO, CR.IMP_CREDITO, CR.SDO_INSOLUTO '+coCRLF +
                 '        FROM '+coCRLF +
                 '             ( SELECT * FROM ('+coCRLF +

                 '                     SELECT ''0'' DETALLE,  NVL(A.ID_CREDITO,B.ID_CREDITO ) ID_CREDITO,     '' '' TX_NOTA, '+coCRLF +
               //MAGV 20091118 No imprime la fecha de pago si es mayor al periodo definido por el usuario
               //  '                            A.F_PROG_PAGO       CP_F_PROG_PAGO,      A.F_PAGO                  CP_F_PAGO,'+coCRLF +
                 '                            A.F_PROG_PAGO       CP_F_PROG_PAGO,      CASE WHEN A.F_PAGO > '+SQLFECHA(STRTODATETIME(SFFIN))+' THEN NULL ELSE A.F_PAGO END CP_F_PAGO,'+coCRLF +
               //<--MAGV 20091118
                 '                            NVL(A.IMP_PAGADO,0) CP_IMP_PAGADO,       NVL(A.NUM_DIAS_VENCIDO,0) CP_NUM_DIAS_VDO,'+coCRLF +
                 '                            TO_DATE(NULL,''DD/MM/YYYY'') F_OPERACION_CP ,        0 MONTO_CP,'+coCRLF +
                 '                            TO_DATE(NULL,''DD/MM/YYYY'')  F_PROG_PFN, TO_DATE(NULL,''DD/MM/YYYY'')  F_PAGO_FN, 0 IMP_PAG_PFN, 0 NUM_DIAS_VDO_FN,'+coCRLF +
               //MAGV 20091118 No imprime la fecha de pago si es mayor al periodo definido por el usuario
               //  '                            B.F_PROG_PAGO       CI_F_PROG_PAGO,      B.F_PAGO                  CI_F_PAGO,'+coCRLF +
                 '                            B.F_PROG_PAGO       CI_F_PROG_PAGO,      CASE WHEN B.F_PAGO > '+SQLFECHA(STRTODATETIME(SFFIN))+' THEN NULL ELSE B.F_PAGO END                  CI_F_PAGO,'+coCRLF +
               //<--MAGV 20091118
                 '                            NVL(B.IMP_PAGADO,0) CI_IMP_PAGADO,       NVL(B.NUM_DIAS_VENCIDO,0) CI_NUM_DIAS_VDO,'+coCRLF +
                 '                            TO_DATE(NULL,''DD/MM/YYYY'') F_OPERACION_IN ,        0 MONTO_IN'+coCRLF +
//ARR 8Sep10                 '                     FROM ( SELECT PKGCRSALDOS.FUNREGCTAS(ID_CREDITO, ''CR'')R,  C.*'+coCRLF +
                 '                     FROM ( SELECT row_number() over ( partition by id_credito order by f_prog_pago) R,  C.*'+coCRLF +
                 '                            FROM ( SELECT K.* '+coCRLF +
                 '                                   FROM ( SELECT CP.ID_CREDITO, CP.F_PROG_PAGO, CP.F_PAGO, CP.IMP_PAGADO,CP1.NUM_DIAS_VENCIDO'+coCRLF +
                 '                                          FROM CRE_CAPITAL CP,'+coCRLF +
                 '                                               ( SELECT CP.ID_CREDITO, NUM_PERIODO,'+coCRLF + //CP.F_PAGO - CP.F_PROG_PAGO  NUM_DIAS_VENCIDO'+coCRLF +easa4011 19.05.2008 correccion
               //MAGV20091110
               //  '                                                 StpFunObtDiasVdos('+SQLFecha(StrToDateTime(sFFin)   )+', DECODE ( CP.SIT_CAPITAL , ''IM'' , NULL , CP.F_PAGO ),CP.F_PROG_PAGO,CP.SIT_CAPITAL) AS NUM_DIAS_VENCIDO'+coCRLF+
                 '                                                 StpFunObtDiasVdos(DECODE( CASE WHEN (CP.F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE CP.SIT_CAPITAL END, ''IM'' , '+SQLFecha(StrToDateTime(sFFin)   )+'+2, '+SQLFecha(StrToDateTime(sFFin)   )+'), DECODE ( CP.SIT_CAPITAL , ''IM'' , NULL , DECODE((CP.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((CP.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,CP.F_PAGO) ),CP.F_PROG_PAGO,CASE WHEN (CP.F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE CP.SIT_CAPITAL END) AS NUM_DIAS_VENCIDO'+coCRLF+  //MAGV20091110
               //end DHH 14.11.2008
               //'                                                 StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+',CP.F_PAGO,CP.F_PROG_PAGO,CP.SIT_CAPITAL) AS NUM_DIAS_VENCIDO'+coCRLF+
               //end easa 19.05.2008
                 '                                                FROM CRE_CAPITAL CP'+coCRLF +
               //'                                                WHERE ( CP.F_PAGO > CP.F_PROG_PAGO ) OR ( CP.F_PAGO IS NULL )';  // DHH 20080917
                 '                                                WHERE ( CP.F_PAGO > CP.F_PROG_PAGO ) OR ( (CP.F_PAGO IS NULL)           ' + coCRLF +
               //'                                                       AND ( CP.F_PROG_PAGO >= ' + SQLFecha(StrToDateTime(sFIni)) + ' ) ' + coCRLF + // DHH 20080919
                 '                                                       AND ( CP.F_PROG_PAGO <= ' + SQLFecha(StrToDateTime(sFFin)) + ' ) ) ';

           If (Trim(sDisp)<>'')Then sSQLINTER := sSQLINTER + ' AND CP.ID_CREDITO = '+ sDisp ;
    sSQLINTER := sSQLINTER +
                 '                                               )CP1'+coCRLF +
                 '                                          WHERE ( ( CP.F_PAGO >= ' + SQLFecha(StrToDateTime(sFIni)) +
                 '                                                AND CP.F_PAGO <= ' + SQLFecha(StrToDateTime(sFFin)) + ' ) ' + coCRLF +
               //'                                               OR ( CP.F_PAGO > CP.F_PROG_PAGO )' + coCRLF +     // DHH20080915
                 '                                               OR ( CP.F_PAGO <= ' + SQLFecha(StrToDateTime(sFIni)) + ' AND CP.SIT_CAPITAL = ''IM'' ) '+coCRLF + //MAGV
                 '                                               OR ( CP.F_PAGO IS NULL AND CP.SIT_CAPITAL = ''IM'' )' + coCRLF +
                 '                                               OR ( CP.F_PROG_PAGO >=  ' + SQLFecha(StrToDateTime(sFIni)) + ' AND ' + coCRLF +
                 '                                                    CP.F_PROG_PAGO <= '+ SQLFecha(StrToDateTime(sFFin)) + ' ) ' + coCRLF + //MAGV 2009-10-02
                 '                                                ) '+coCRLF +
                 '                                             AND CP.ID_CREDITO   = CP1.ID_CREDITO(+) AND CP.NUM_PERIODO  = CP1.NUM_PERIODO(+)';
           If (Trim(sDisp)<>'')Then sSQLINTER := sSQLINTER + ' AND CP.ID_CREDITO = '+ sDisp ;
    sSQLINTER := sSQLINTER +
                 '                                        )K, CRE_CREDITO CR, CONTRATO C,CRE_CONTRATO CCTO, CRE_SUB_TIP_BCO CSB'+coCRLF +
                 '                                   WHERE CR.SIT_CREDITO NOT IN ( ''CA'', ''IN'')'+coCRLF +
                 vlstrFilterMoneda+coCRLF + //<SATV4766 24MZO2009>                 
                 '                                     AND K.ID_CREDITO = CR.ID_CREDITO '+coCRLF +
                 '                                     AND CR.ID_CONTRATO = C.ID_CONTRATO'+coCRLF +
                 '                                     AND C.ID_CONTRATO = CCTO.ID_CONTRATO'+coCRLF +
                 '                                     AND CCTO.CVE_SUB_TIP_BCO = CSB.CVE_SUB_TIP_BCO'+coCRLF +
                 '                                     AND ( ( CSB.F_TRASPASO_ICRE IS NOT NULL AND CR.SIT_CREDITO NOT IN ( ''TA'' ) )'+coCRLF +
                 '                                          OR CSB.F_TRASPASO_ICRE IS NULL )'+coCRLF +
//CNBV 13112008                 ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMCEDEXPG', '                                     AND CR.ID_CONTRATO  ', False ) + { < SATV4766 04/09/2006> }
                 ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMCEDEXPG', '                                     AND CR.ID_CREDITO ', False ) + { < SATV4766 04/09/2006> }
                 '                                     AND C.ID_EMPRESA  = '+ sEmpresa;
           If (Trim(sAcreditado)<>'')Then sSQLINTER := sSQLINTER + ' AND C.ID_TITULAR  = '+ sAcreditado ;
           If (Trim(sDisp)<>'')Then sSQLINTER := sSQLINTER + ' AND CR.ID_CREDITO = '+ sDisp ;
    sSQLINTER := sSQLINTER +
               //'                                   ORDER BY K.ID_CREDITO, K.F_PROG_PAGO'+coCRLF +
                 '                                 )C'+coCRLF +
//ARR 8Sep10                 '                          )A,'+coCRLF +
                 '                          )A FULL OUTER JOIN '+coCRLF +
//ARR 8Sep10                 '                          (SELECT PKGCRSALDOS.FUNREGCTAS(CI.ID_CREDITO, ''DV'') R,'+coCRLF +
                 '                          (SELECT row_number() over( partition by ci.id_credito order by ci.f_prog_pago) R,'+coCRLF +
                 '                                  CI.ID_CREDITO,CI.F_PROG_PAGO,CI.F_PAGO, CI.IMP_PAGADO, CI1.NUM_DIAS_VENCIDO'+coCRLF +
                 '                           FROM CRE_INTERES CI,'+coCRLF +
                 '                                ( SELECT ID_CREDITO, NUM_PERIODO, '+coCRLF + //F_PAGO - F_PROG_PAGO  NUM_DIAS_VENCIDO'+coCRLF +easa4011 19.05.2008 correccion
               //MAGV20091110
               //  '                                         StpFunObtDiasVdos('+SQLFecha(StrToDateTime(sFFin)   )+', DECODE( SIT_INTERES , ''IM'' , NULL , F_PAGO) ,F_PROG_PAGO,SIT_INTERES) AS NUM_DIAS_VENCIDO'+coCRLF+
                 '                                         StpFunObtDiasVdos(DECODE( CASE WHEN (F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE SIT_INTERES END, ''IM'' , '+SQLFecha(StrToDateTime(sFFin)   )+'+2, '+SQLFecha(StrToDateTime(sFFin)   )+'), DECODE( SIT_INTERES , ''IM'' , NULL , DECODE((F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,F_PAGO)) ,F_PROG_PAGO,CASE WHEN (F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE SIT_INTERES END) AS NUM_DIAS_VENCIDO'+coCRLF+  //MAGV20091110
               //end DHH 14.11.2008
               //'                                         StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+',F_PAGO,F_PROG_PAGO,SIT_INTERES) AS NUM_DIAS_VENCIDO'+coCRLF+
               //end easa 19.05.2008
               //'                                  FROM CRE_INTERES WHERE ( F_PAGO > F_PROG_PAGO ) OR ( F_PAGO IS NULL )';  // DHH 20080917
                 '                                  FROM CRE_INTERES ' + coCRLF +
                 '                                  WHERE ( F_PAGO > F_PROG_PAGO ) OR ( (F_PAGO IS NULL)             '     + coCRLF +
               //'                                         AND ( F_PROG_PAGO >= ' + SQLFecha(StrToDateTime(sFIni)) + ' ) ' + coCRLF +   // DHH 20080919
                 '                                         AND ( F_PROG_PAGO <= ' + SQLFecha(StrToDateTime(sFFin)) + ' ) ) ';


           If (Trim(sDisp)<>'')Then sSQLINTER := sSQLINTER + ' AND ID_CREDITO = '+ sDisp ;
    sSQLINTER := sSQLINTER +
                 '                                )CI1, CRE_CREDITO CR, CONTRATO C, CRE_CONTRATO CCTO, CRE_SUB_TIP_BCO CSB '+coCRLF +
                 '                           WHERE CR.SIT_CREDITO NOT IN ( ''CA'', ''IN'')'+coCRLF +
                 vlstrFilterMoneda+coCRLF + //<SATV4766 24MZO2009>                 
                 '                             AND ( ( F_PAGO >= ' + SQLFecha(StrToDateTime(sFIni)) + coCRLF +
                 '                                 AND F_PAGO <= ' + SQLFecha(StrToDateTime(sFFin)) + ' ) ' +coCRLF +
               //'                                OR ( F_PAGO > F_PROG_PAGO )' + coCRLF +    // DHH20080915
                 '                                OR ( F_PAGO <= ' + SQLFecha(StrToDateTime(sFIni)) + ' AND SIT_INTERES = ''IM'' ) ' +coCRLF + //MAGV
                 '                                OR ( F_PAGO IS NULL AND SIT_INTERES = ''IM'' )' + coCRLF +
                 '                                OR ( F_PROG_PAGO >=  ' + SQLFecha(StrToDateTime(sFIni)) + ' AND ' + coCRLF +
                 '                                     F_PROG_PAGO <= '+ SQLFecha(StrToDateTime(sFFin)) + ' ) ' + coCRLF +
                 '                                 ) '+coCRLF +
                 '                             AND CR.ID_CONTRATO = C.ID_CONTRATO '+coCRLF +
                 '                             AND C.ID_CONTRATO = CCTO.ID_CONTRATO'+coCRLF +
                 '                             AND CCTO.CVE_SUB_TIP_BCO = CSB.CVE_SUB_TIP_BCO'+coCRLF +
                 '                             AND ( ( CSB.F_TRASPASO_ICRE IS NOT NULL AND CR.SIT_CREDITO NOT IN ( ''TA'' ) )'+coCRLF +
                 '                                          OR CSB.F_TRASPASO_ICRE IS NULL )'+coCRLF +

//CNBV 13112008                 ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMCEDEXPG', '                             AND CR.ID_CONTRATO ', False ) + { < SATV4766 04/09/2006> }
                 ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMCEDEXPG', '                                     AND CR.ID_CREDITO ', False ) + { < SATV4766 04/09/2006> }
                 '                             AND CI.ID_CREDITO  = CI1.ID_CREDITO(+) AND CI.NUM_PERIODO = CI1.NUM_PERIODO(+)'+coCRLF +
                 '                             AND CI.ID_CREDITO  = CR.ID_CREDITO AND C.ID_EMPRESA  = '+ sEmpresa;
           If (Trim(sAcreditado)<>'')Then sSQLINTER := sSQLINTER + ' AND C.ID_TITULAR  = '+ sAcreditado ;
           If (Trim(sDisp)<>'')Then sSQLINTER := sSQLINTER + ' AND CR.ID_CREDITO = '+ sDisp ;
    sSQLINTER := sSQLINTER +
               //'                           ORDER BY ID_CREDITO, F_PROG_PAGO'+coCRLF +
                 '                          )B'+coCRLF +
 //ARR 8Sep10                '                     WHERE A.R(+)= B.R AND A.ID_CREDITO(+) = B.ID_CREDITO'+coCRLF +
                 '                     ON A.R= B.R AND A.ID_CREDITO      = B.ID_CREDITO'+coCRLF +

{   Inicia -> ARR Adolfo 8sep10 se comenta ya que no es necesario ya que en el select anterior se implementa un "full outer join" y se evita este select
                 '                  UNION'+coCRLF +
                 '                     SELECT ''0'' DETALLE,  NVL(A.ID_CREDITO,B.ID_CREDITO ) ID_CREDITO,     '' '' TX_NOTA, '+coCRLF +
               //MAGV 20091118 No imprime la fecha de pago si es mayor al periodo definido por el usuario
               //  '                            A.F_PROG_PAGO       CP_F_PROG_PAGO,      A.F_PAGO                  CP_F_PAGO,'+coCRLF +
                 '                            A.F_PROG_PAGO       CP_F_PROG_PAGO,      CASE WHEN A.F_PAGO > '+SQLFECHA(STRTODATETIME(SFFIN))+' THEN NULL ELSE A.F_PAGO END CP_F_PAGO,'+coCRLF +
               //<--MAGV 20091118
                 '                            NVL(A.IMP_PAGADO,0) CP_IMP_PAGADO,       NVL(A.NUM_DIAS_VENCIDO,0) CP_NUM_DIAS_VDO,'+coCRLF +
                 '                            TO_DATE(NULL,''DD/MM/YYYY'') F_OPERACION_CP ,        0 MONTO_CP,'+coCRLF +
                 '                            TO_DATE(NULL,''DD/MM/YYYY'')  F_PROG_PFN, TO_DATE(NULL,''DD/MM/YYYY'')  F_PAGO_FN, 0 IMP_PAG_PFN, 0 NUM_DIAS_VDO_FN,'+coCRLF +
               //MAGV 20091118 No imprime la fecha de pago si es mayor al periodo definido por el usuario
               //  '                            B.F_PROG_PAGO       CI_F_PROG_PAGO,      B.F_PAGO                  CI_F_PAGO,'+coCRLF +
                 '                            B.F_PROG_PAGO       CI_F_PROG_PAGO,      CASE WHEN B.F_PAGO > '+SQLFECHA(STRTODATETIME(SFFIN))+' THEN NULL ELSE B.F_PAGO END                  CI_F_PAGO,'+coCRLF +
               //<--MAGV 20091118
                 '                            NVL(B.IMP_PAGADO,0) CI_IMP_PAGADO,       NVL(B.NUM_DIAS_VENCIDO,0) CI_NUM_DIAS_VDO,'+coCRLF +
                 '                            TO_DATE(NULL,''DD/MM/YYYY'') F_OPERACION_IN ,        0 MONTO_IN'+coCRLF +
                 '                     FROM ( SELECT PKGCRSALDOS.FUNREGCTAS(ID_CREDITO, ''CR'')R,  C.*'+coCRLF +
                 '                            FROM ( SELECT K.* '+coCRLF +
                 '                                   FROM ( SELECT CP.ID_CREDITO, CP.F_PROG_PAGO, CP.F_PAGO, CP.IMP_PAGADO,CP1.NUM_DIAS_VENCIDO'+coCRLF +
                 '                                          FROM CRE_CAPITAL CP,'+coCRLF +
                 '                                               ( SELECT CP.ID_CREDITO, NUM_PERIODO, '+coCRLF + //CP.F_PAGO - CP.F_PROG_PAGO  NUM_DIAS_VENCIDO'+coCRLF + easa4011 19.05.2008 correccion
               //MAGV20091110
               //  '                                                        StpFunObtDiasVdos('+SQLFecha(StrToDateTime(sFFin)   )+',  DECODE(CP.SIT_CAPITAL , ''IM'' , NULL , CP.F_PAGO) ,CP.F_PROG_PAGO,CP.SIT_CAPITAL) AS NUM_DIAS_VENCIDO'+coCRLF+
                 '                                                        StpFunObtDiasVdos(DECODE( CASE WHEN (CP.F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE CP.SIT_CAPITAL END, ''IM'' , '+SQLFecha(StrToDateTime(sFFin)   )+'+2, '+SQLFecha(StrToDateTime(sFFin)   )+'),  DECODE(CP.SIT_CAPITAL , ''IM'' , NULL , DECODE((CP.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((CP.F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,CP.F_PAGO)) ,CP.F_PROG_PAGO,CASE WHEN (CP.F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE CP.SIT_CAPITAL END) AS NUM_DIAS_VENCIDO'+coCRLF+  //MAGV20091110
               //end DHH 14.11.2008
               //'                                                        StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+',CP.F_PAGO,CP.F_PROG_PAGO,CP.SIT_CAPITAL) AS NUM_DIAS_VENCIDO'+coCRLF+
               //end easa 19.05.2008
                 '                                                FROM CRE_CAPITAL CP'+coCRLF +
               //'                                                WHERE ( CP.F_PAGO > CP.F_PROG_PAGO ) OR ( CP.F_PAGO IS NULL )';  // DHH 20080917
                 '                                                WHERE ( CP.F_PAGO > CP.F_PROG_PAGO ) OR ( (CP.F_PAGO IS NULL)           ' + coCRLF +
               //'                                                       AND ( CP.F_PROG_PAGO >= ' + SQLFecha(StrToDateTime(sFIni)) + ' ) ' + coCRLF +   // DHH 20080919
                 '                                                       AND ( CP.F_PROG_PAGO <= ' + SQLFecha(StrToDateTime(sFFin)) + ' ) ) ';

           If (Trim(sDisp)<>'')Then sSQLINTER := sSQLINTER + ' AND CP.ID_CREDITO = '+ sDisp ;
    sSQLINTER := sSQLINTER +
                 '                                               )CP1'+coCRLF +
                 '                                          WHERE ( ( CP.F_PAGO >= ' + SQLFecha(StrToDateTime(sFIni)) +
                 '                                                AND CP.F_PAGO <= ' + SQLFecha(StrToDateTime(sFFin)) + ' ) ' + coCRLF +
               //'                                               OR ( CP.F_PAGO > CP.F_PROG_PAGO )' + coCRLF +   // DHH20080915
                 '                                               OR ( CP.F_PAGO <= ' + SQLFecha(StrToDateTime(sFIni)) + ' AND CP.SIT_CAPITAL = ''IM'' ) '+coCRLF + //MAGV
                 '                                               OR ( CP.F_PAGO IS NULL AND CP.SIT_CAPITAL = ''IM'' )' + coCRLF +
                 '                                               OR ( CP.F_PROG_PAGO >=  ' + SQLFecha(StrToDateTime(sFIni)) + ' AND ' + coCRLF +
                 '                                                    CP.F_PROG_PAGO <= '+ SQLFecha(StrToDateTime(sFFin)) + ' ) ' + coCRLF + //MAGV 2009-10-02
                 '                                                ) '+coCRLF +
                 '                                             AND CP.ID_CREDITO   = CP1.ID_CREDITO(+) AND CP.NUM_PERIODO  = CP1.NUM_PERIODO(+)';
           If (Trim(sDisp)<>'')Then sSQLINTER := sSQLINTER + ' AND CP.ID_CREDITO = '+ sDisp ;
    sSQLINTER := sSQLINTER +
                 '                                        )K, CRE_CREDITO CR, CONTRATO C, CRE_CONTRATO CCTO, CRE_SUB_TIP_BCO CSB'+coCRLF +
                 '                                   WHERE CR.SIT_CREDITO NOT IN ( ''CA'', ''IN'')'+coCRLF +
                 vlstrFilterMoneda+coCRLF + //<SATV4766 24MZO2009>                 
                 '                                     AND K.ID_CREDITO = CR.ID_CREDITO '+coCRLF +
                 '                                     AND CR.ID_CONTRATO = C.ID_CONTRATO '+coCRLF +
                 '                                     AND C.ID_CONTRATO = CCTO.ID_CONTRATO'+coCRLF +
                 '                                     AND CCTO.CVE_SUB_TIP_BCO = CSB.CVE_SUB_TIP_BCO'+coCRLF +
                 '                                     AND ( ( CSB.F_TRASPASO_ICRE IS NOT NULL AND CR.SIT_CREDITO NOT IN ( ''TA'' ) )'+coCRLF +
                 '                                          OR CSB.F_TRASPASO_ICRE IS NULL )'+coCRLF +
//CNBV 13112008                 ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMCEDEXPG', '                                     AND CR.ID_CONTRATO ', False ) + // < SATV4766 04/09/2006>
                 ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMCEDEXPG', '                                     AND CR.ID_CREDITO ', False ) + // < SATV4766 04/09/2006>
                 '                                     AND C.ID_EMPRESA  = '+ sEmpresa;
           If (Trim(sAcreditado)<>'')Then sSQLINTER := sSQLINTER + ' AND C.ID_TITULAR  = '+ sAcreditado ;
           If (Trim(sDisp)<>'')Then sSQLINTER := sSQLINTER + ' AND CR.ID_CREDITO = '+ sDisp ;
    sSQLINTER := sSQLINTER +
               //'                                   ORDER BY K.ID_CREDITO, K.F_PROG_PAGO'+coCRLF +
                 '                                 )C'+coCRLF +
                 '                          )A,'+coCRLF +
                 '                          (SELECT PKGCRSALDOS.FUNREGCTAS(CI.ID_CREDITO, ''DV'') R,'+coCRLF +
                 '                                  CI.ID_CREDITO,CI.F_PROG_PAGO,CI.F_PAGO, CI.IMP_PAGADO, CI1.NUM_DIAS_VENCIDO'+coCRLF +
                 '                           FROM CRE_INTERES CI,'+coCRLF +
                 '                                ( SELECT ID_CREDITO, NUM_PERIODO, '+coCRLF + //F_PAGO - F_PROG_PAGO  NUM_DIAS_VENCIDO'+coCRLF + easa4011 19.05.2008 correccion
               //MAGV20091110
               //  '                                         StpFunObtDiasVdos('+SQLFecha(StrToDateTime(sFFin)   )+', DECODE( SIT_INTERES , ''IM'' , NULL , F_PAGO ),F_PROG_PAGO,SIT_INTERES) AS NUM_DIAS_VENCIDO'+coCRLF+
                 '                                         StpFunObtDiasVdos(DECODE( CASE WHEN (F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE SIT_INTERES END, ''IM'' , '+SQLFecha(StrToDateTime(sFFin)   )+'+2, '+SQLFecha(StrToDateTime(sFFin)   )+'), DECODE( SIT_INTERES , ''IM'' , NULL , DECODE((F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+') - ABS((F_PAGO-1-'+SQLFecha(StrToDateTime(sFFin))+')),0,NULL,F_PAGO) ),F_PROG_PAGO,CASE WHEN (F_PAGO > '+SQLFecha(StrToDateTime(sFFin))+') THEN ''IM'' ELSE SIT_INTERES END) AS NUM_DIAS_VENCIDO'+coCRLF+  //MAGV20091110
               //end DHH 14.11.2008
               //'                                         StpFunObtDiasVdos('+SQLFecha(peApli.DameFechaEmpresa)+',F_PAGO,F_PROG_PAGO,SIT_INTERES) AS NUM_DIAS_VENCIDO'+coCRLF+
               //end easa 19.05.2008
               //'                                  FROM CRE_INTERES WHERE ( F_PAGO > F_PROG_PAGO ) OR ( F_PAGO IS NULL )';   // DHH 20080917
                 '                                  FROM CRE_INTERES ' + coCRLF +
                 '                                  WHERE ( F_PAGO > F_PROG_PAGO ) OR ( (F_PAGO IS NULL)             '     + coCRLF +
               //'                                         AND ( F_PROG_PAGO >= ' + SQLFecha(StrToDateTime(sFIni)) + ' ) ' + coCRLF +    // DHH 20080919
                 '                                         AND ( F_PROG_PAGO <= ' + SQLFecha(StrToDateTime(sFFin)) + ' ) ) ';


           If (Trim(sDisp)<>'')Then sSQLINTER := sSQLINTER + ' AND ID_CREDITO = '+ sDisp ;
    sSQLINTER := sSQLINTER +
                 '                                )CI1, CRE_CREDITO CR, CONTRATO C, CRE_CONTRATO CCTO, CRE_SUB_TIP_BCO CSB '+coCRLF +
                 '                           WHERE CR.SIT_CREDITO NOT IN ( ''CA'', ''IN'')'+coCRLF +
                 vlstrFilterMoneda+coCRLF + //<SATV4766 24MZO2009>                 
                 '                             AND ( ( F_PAGO >= ' + SQLFecha(StrToDateTime(sFIni)) + coCRLF +
                 '                                 AND F_PAGO <= ' + SQLFecha(StrToDateTime(sFFin)) + ' ) ' +coCRLF +
               //'                                OR ( F_PAGO > F_PROG_PAGO )' + coCRLF +    // DHH20080915
                 '                                OR ( F_PAGO <= ' + SQLFecha(StrToDateTime(sFIni)) + ' AND SIT_INTERES = ''IM'' ) ' +coCRLF + //MAGV
                 '                                OR ( F_PAGO IS NULL AND SIT_INTERES = ''IM'' )' + coCRLF +
                 '                                OR ( F_PROG_PAGO >=  ' + SQLFecha(StrToDateTime(sFIni)) + ' AND ' + coCRLF +
                 '                                     F_PROG_PAGO <= '+ SQLFecha(StrToDateTime(sFFin)) + ' ) ' + coCRLF +
                 '                                 ) '+coCRLF +
                 '                             AND CR.ID_CONTRATO = C.ID_CONTRATO '+coCRLF +
                 '                             AND C.ID_CONTRATO = CCTO.ID_CONTRATO'+coCRLF +
                 '                             AND CCTO.CVE_SUB_TIP_BCO = CSB.CVE_SUB_TIP_BCO'+coCRLF +
                 '                             AND ( ( CSB.F_TRASPASO_ICRE IS NOT NULL AND CR.SIT_CREDITO NOT IN ( ''TA'' ) )'+coCRLF +
                 '                                          OR CSB.F_TRASPASO_ICRE IS NULL )'+coCRLF +
//CNBV 13112008                 ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMCEDEXPG', '                             AND CR.ID_CONTRATO  ', False ) + // < SATV4766 04/09/2006>
                 ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMCEDEXPG', '                                     AND CR.ID_CREDITO ', False ) + // < SATV4766 04/09/2006>
                 '                             AND CI.ID_CREDITO  = CI1.ID_CREDITO(+) AND CI.NUM_PERIODO = CI1.NUM_PERIODO(+)'+coCRLF +
                 '                             AND CI.ID_CREDITO  = CR.ID_CREDITO AND C.ID_EMPRESA  = '+ sEmpresa;
           If (Trim(sAcreditado)<>'')Then sSQLINTER := sSQLINTER + ' AND C.ID_TITULAR  = '+ sAcreditado ;
           If (Trim(sDisp)<>'')Then sSQLINTER := sSQLINTER + ' AND CR.ID_CREDITO = '+ sDisp ;
    sSQLINTER := sSQLINTER +
               //'                           ORDER BY ID_CREDITO, F_PROG_PAGO'+coCRLF +
                 '                          )B'+coCRLF +
                 '                     WHERE A.R= B.R(+) AND A.ID_CREDITO = B.ID_CREDITO(+)'+coCRLF +
   Termina -> ARR Adolfo 8sep10 se comenta ya que no es necesario ya que en el select anterior se implementa un "full outer join" y se evita este select
   }
                 '                  UNION'+coCRLF +
                 '                     SELECT ''1'' DETALLE,         CT.ID_CREDITO,    SUBSTR(CT.TX_COMENTARIO,1,200) TX_NOTA,'+coCRLF +
                 '                            TO_DATE(NULL,''DD/MM/YYYY'') CP_F_PROG_PAGO, TO_DATE(NULL,''DD/MM/YYYY'') CP_F_PAGO,'+coCRLF +
                 '                            0  CP_IMP_PAGADO,       0 CP_NUM_DIAS_VDO,'+coCRLF +
                 '                            CT.F_APLICACION F_OPERACION_CP,   CT.IMP_OPERACION MONTO_CP,'+coCRLF +
                 '                            TO_DATE(NULL,''DD/MM/YYYY'')  F_PROG_PFN, TO_DATE(NULL,''DD/MM/YYYY'')  F_PAGO_FN, 0 IMP_PAG_PFN, 0 NUM_DIAS_VDO_FN,'+coCRLF +
                 '                            TO_DATE(NULL,''DD/MM/YYYY'') CI_F_PROG_PAGO,      TO_DATE(NULL,''DD/MM/YYYY'') CI_F_PAGO,'+coCRLF +
                 '                            0 CI_IMP_PAGADO,       0 CI_NUM_DIAS_VDO,'+coCRLF +
                 '                            TO_DATE(NULL,''DD/MM/YYYY'') F_OPERACION_IN,'+coCRLF +
                 '                            0 MONTO_IN'+coCRLF +
                 '                     FROM CRE_TRANSACCION CT, CRE_OPERACION CO, CONTRATO CTO '+coCRLF +
                 '                     WHERE CT.F_APLICACION >=' + SQLFecha(StrToDateTime(sFIni))+coCRLF +
                 '                       AND CT.F_APLICACION <=' + SQLFecha(StrToDateTime(sFFin))+coCRLF +
                 '                       AND CT.CVE_OPERACION IN (''CMOCON'',''CIMCFV'',''CDMCFV'',''CRCMOC'')'+coCRLF +
                 vlstrFilterMoneda1+coCRLF + //<SATV4766 24MZO2009>                 
                 '                       AND CO.CVE_OPERACION = CT.CVE_OPERACION AND CTO.ID_CONTRATO = CT.ID_CONTRATO '+coCRLF+
//CNBV 13112008                 ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMCEDEXPG', '                       AND CTO.ID_CONTRATO ', False ) { < SATV4766 04/09/2006> }
                 ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMCEDEXPG', '                                     AND CT.ID_CREDITO ', False )  { < SATV4766 04/09/2006> }
                 ;
           If (Trim(sAcreditado)<>'')Then sSQLINTER := sSQLINTER + ' AND CTO.ID_TITULAR  = '+ sAcreditado ;
           If (Trim(sDisp)<>'')Then sSQLINTER := sSQLINTER + ' AND CT.ID_CREDITO = '+ sDisp ;
    sSQLINTER := sSQLINTER +
                 '                     )'+coCRLF +
                 '             ) F,' +coCRLF +
                 '             ( SELECT * FROM CRE_CREDITO WHERE SIT_CREDITO <> ''CA'' '+coCRLF +
                 '                  AND ( F_LIQ_BNC >= '+ SQLFecha(StrToDateTime(sFIni))+ 'OR F_LIQ_BNC IS NULL)'+coCRLF +
                 '             )CR, CONTRATO CTO, CRE_CONTRATO CCTO, PERSONA P, CRE_CLIENTE CC, CRE_SUB_TIP_BCO CSB '+coCRLF +
           ' WHERE CR.SIT_CREDITO NOT IN ( ''CA'', ''IN'')'+coCRLF +
           '   AND CCTO.ID_CONTRATO = CR.ID_CONTRATO'+coCRLF +
           '   AND CTO.ID_CONTRATO  = CR.ID_CONTRATO'+coCRLF +
//CNBV 13112008           ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMCEDEXPG', '   AND CTO.ID_CONTRATO ', False ) + { < SATV4766 04/09/2006> }
                 ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMCEDEXPG', '                                     AND CR.ID_CREDITO ', False ) + { < SATV4766 04/09/2006> }
           '   AND CTO.ID_CONTRATO = CCTO.ID_CONTRATO'+coCRLF +
           '   AND CCTO.CVE_SUB_TIP_BCO = CSB.CVE_SUB_TIP_BCO'+coCRLF +
           '   AND ( ( CSB.F_TRASPASO_ICRE IS NOT NULL AND CR.SIT_CREDITO NOT IN ( ''TA'' ) )'+coCRLF +
                 '                                          OR CSB.F_TRASPASO_ICRE IS NULL )'+coCRLF +
           '   AND F.ID_CREDITO     = CR.ID_CREDITO '+coCRLF  +
           '   AND P.ID_PERSONA     = CTO.ID_TITULAR '+coCRLF  +
           '   AND CC.ID_PERSONA    = CTO.ID_TITULAR '+coCRLF ;

           If (Trim(sEmpresa)<>'')   Then sSQLINTER := sSQLINTER + ' AND CTO.ID_EMPRESA  = '+ sEmpresa ;
           If (Trim(sAcreditado)<>'')Then sSQLINTER := sSQLINTER + ' AND CTO.ID_TITULAR  = '+ sAcreditado ;
           If (Trim(sDisp)<>'')Then sSQLINTER := sSQLINTER + ' AND CR.ID_CREDITO = '+ sDisp ;
           If (Trim(sPromAsoc)<>'')Then sSQLINTER := sSQLINTER + ' AND CTO.ID_PERS_ASOCIAD  = '+ sPromAsoc;
           If (Trim(sPromAdm)<>'')Then sSQLINTER := sSQLINTER + ' AND CR.ID_PROM_ADM  = '+ sPromAdm ;
           If (Trim(sGpoEconomico)<>'')Then sSQLINTER := sSQLINTER + ' AND CC.CVE_GRUPO = '+ SQLStr( sGpoEconomico ) ;

    //CONSULTA GENERAL
    sSQL:= ' SELECT TRASP_VDO.CVE_MONEDA, M.DESC_MONEDA,'+ coCRLF +
           '        NVL(CE.CVE_FND_ENT_DES,'' '') AS CVE_FND_ENT_DES, NVL(CE.ID_PROVEEDOR, 0) AS ID_PROVEEDOR,'+ coCRLF +
           '        NVL(PROVEEDOR.NOMBRE,''SIN PROVEEDOR'') AS NOM_PROVEEDOR,'+ coCRLF +
           '        RESULT.*, TRASP_VDO.NUM_DIAS_VDO FROM  ' + sSQLICRE + coCRLF;

    IF not( ( Trim(sProducto)<>'') OR (Trim(sGpoProd)<>'') ) THEN BEGIN
       sSQL:= sSQL + ' UNION ' + coCRLF +
                     sSQLINTER + coCRLF ;
    END;

    //<SATV4766 23Mzo2009>    
    sSQL:= sSQL + coCRLF + ') RESULT,' + coCRLF +
           '    (  SELECT CC.ID_CREDITO, CTO.CVE_MONEDA,'+ coCRLF +
           '              DECODE(NVL(CC.F_TRASPASO_VENC, TO_DATE(''01/01/1900'',''DD/MM/YYYY'')), TO_DATE(''01/01/1900'',''DD/MM/YYYY''), 0, ('+SQLFecha(StrToDateTime(sFFin))+' - CC.F_TRASPASO_VENC)) AS NUM_DIAS_VDO'+ coCRLF +
           '       FROM CR_CREDITO CC,'+ coCRLF +
           '            CONTRATO CTO'+ coCRLF +
           '       WHERE CC.SIT_CREDITO <> ''CA'''+ coCRLF +
           '         AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+ coCRLF +
           '     UNION'+ coCRLF +
           '       SELECT CC.ID_CREDITO, CTO.CVE_MONEDA,'+ coCRLF +
           '              DECODE(NVL(CC.F_TRASPASO_VENC, TO_DATE(''01/01/1900'',''DD/MM/YYYY'')), TO_DATE(''01/01/1900'',''DD/MM/YYYY''), 0, ('+SQLFecha(StrToDateTime(sFFin))+' - CC.F_TRASPASO_VENC)) AS NUM_DIAS_VDO'+ coCRLF +
           '       FROM CRE_CREDITO CC,'+ coCRLF +
           '            CONTRATO CTO'+ coCRLF +
           '       WHERE CC.SIT_CREDITO NOT IN (''CA'',''TA'')'+ coCRLF +
           '         AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+ coCRLF +
           '    ) TRASP_VDO,'+ coCRLF +
           '    ( SELECT ID_CESION, ID_PROVEEDOR, CVE_FND_ENT_DES'+ coCRLF +
           '      FROM CR_CESION'+ coCRLF +
           vlstrSQLFilterProveedor + coCRLF +
           '    ) CE,'+ coCRLF +
           '    MONEDA M,'+ coCRLF +
           '    PERSONA PROVEEDOR '+ coCRLF +
           '  WHERE 1 = 1 '+ coCRLF +
           '    AND TRASP_VDO.ID_CREDITO = RESULT.ID_CREDITO' + coCRLF +
           '    AND M.CVE_MONEDA = TRASP_VDO.CVE_MONEDA' + coCRLF +
           '    AND CE.ID_CESION '+vlstrSQLFilterCesion+'= RESULT.ID_CREDITO' + coCRLF +
           '    AND PROVEEDOR.ID_PERSONA (+)= CE.ID_PROVEEDOR' + coCRLF 
           ;
           //</SATV4766 23Mzo2009>

           If sDiasImp Then
              sSQL:= sSQL + ' AND (  RESULT.CP_NUM_DIAS_VDO > 0 OR RESULT.NUM_DIAS_VDO_FN > 0  OR RESULT.CI_NUM_DIAS_VDO > 0 ) ' + coCRLF ;

   If sMuestraProveedor Then
     sSQL:= sSQL + coCRLF + ' ORDER BY TRASP_VDO.CVE_MONEDA, PROVEEDOR.NOMBRE, RESULT.NOMBRE, RESULT.ID_CREDITO, RESULT.CP_F_PROG_PAGO, RESULT.CI_F_PROG_PAGO'
   Else
     sSQL:= sSQL + coCRLF + ' ORDER BY RESULT.NOMBRE, RESULT.ID_CREDITO, RESULT.CP_F_PROG_PAGO, RESULT.CI_F_PROG_PAGO';

   Result:= sSQL;
End;

procedure TQrCedExPg.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

      IF qyCedExPg.FieldByName('DETALLE').AsString = '0' THEN BEGIN
         chbDetalle.Enabled := False;
      END
      else BEGIN
         chbDetalle.Enabled := True;
      END;

      IF qyCedExPg.FieldByName('CP_NUM_DIAS_VDO').AsInteger < 0 THEN
         qrlDIAS_IMPAG_CP.Caption := '0'
      else BEGIN
         qrlDIAS_IMPAG_CP.Caption := qyCedExPg.FieldByName('CP_NUM_DIAS_VDO').AsString;
         IF vgMaxDiasCP <= qyCedExPg.FieldByName('CP_NUM_DIAS_VDO').AsInteger THEN
            vgMaxDiasCP := qyCedExPg.FieldByName('CP_NUM_DIAS_VDO').AsInteger;
      END;

      IF qyCedExPg.FieldByName('NUM_DIAS_VDO_FN').AsInteger < 0 THEN
         qrlDIAS_IMPAG_FN.Caption := '0'
      else BEGIN
         qrlDIAS_IMPAG_FN.Caption := qyCedExPg.FieldByName('NUM_DIAS_VDO_FN').AsString;
         IF vgMaxDiasFN <= qyCedExPg.FieldByName('NUM_DIAS_VDO_FN').AsInteger THEN
            vgMaxDiasFN := qyCedExPg.FieldByName('NUM_DIAS_VDO_FN').AsInteger;
      END;

      IF qyCedExPg.FieldByName('CI_NUM_DIAS_VDO').AsInteger < 0 THEN
         qrlDIAS_IMPAG_IN.Caption := '0'
      else bEGIN
         qrlDIAS_IMPAG_IN.Caption := qyCedExPg.FieldByName('CI_NUM_DIAS_VDO').AsString;
         IF vgMaxDiasIN <= qyCedExPg.FieldByName('CI_NUM_DIAS_VDO').AsInteger THEN
            vgMaxDiasIN := qyCedExPg.FieldByName('CI_NUM_DIAS_VDO').AsInteger;
      END;


      If Trim(sArchivo)<>'' Then Begin
         Writeln(F,
                  qyCedExPg.FieldByName('ID_PERSONA').AsString + #09 +
                  qyCedExPg.FieldByName('NOMBRE').AsString + #09 +
                  qyCedExPg.FieldByName('CVE_PRODUCTO_CRE').AsString + #09 +
                  qyCedExPg.FieldByName('ID_CONTRATO').AsString + #09 +
                  qyCedExPg.FieldByName('ID_CREDITO').AsString + #09 +
                  qyCedExPg.FieldByName('ID_CRE_RENOVADO').AsString + #09 +
                  FormatFloat('###,###,###,###,##0.00',qyCedExPg.FieldByName('IMP_AUTORIZADO').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyCedExPg.FieldByName('IMP_CREDITO').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyCedExPg.FieldByName('SDO_INSOLUTO').AsFloat) + #09+
                  qyCedExPg.FieldByName('CP_F_PROG_PAGO').AsString + #09+
                  qyCedExPg.FieldByName('CP_F_PAGO').AsString + #09+
                  FormatFloat('###,###,###,###,##0.00',qyCedExPg.FieldByName('CP_IMP_PAGADO').AsFloat) + #09+
                  qyCedExPg.FieldByName('CP_NUM_DIAS_VDO').AsString + #09 +
                  qyCedExPg.FieldByName('F_OPERACION_CP').AsString + #09+
                  FormatFloat('###,###,###,###,##0.00',qyCedExPg.FieldByName('MONTO_CP').AsFloat) + #09+
                  qyCedExPg.FieldByName('F_PROG_PFN').AsString + #09+
                  qyCedExPg.FieldByName('F_PAGO_FN').AsString + #09+
                  FormatFloat('###,###,###,###,##0.00',qyCedExPg.FieldByName('IMP_PAG_PFN').AsFloat) + #09+
                  qyCedExPg.FieldByName('NUM_DIAS_VDO_FN').AsString + #09 +
                  qyCedExPg.FieldByName('CI_F_PROG_PAGO').AsString + #09+
                  qyCedExPg.FieldByName('CI_F_PAGO').AsString + #09+
                  FormatFloat('###,###,###,###,##0.00',qyCedExPg.FieldByName('CI_IMP_PAGADO').AsFloat) + #09+
                  qyCedExPg.FieldByName('CI_NUM_DIAS_VDO').AsString + #09 +
                  qyCedExPg.FieldByName('F_OPERACION_IN').AsString + #09+
                  FormatFloat('###,###,###,###,##0.00',qyCedExPg.FieldByName('MONTO_IN').AsFloat) + #09+
                  qyCedExPg.FieldByName('TX_NOTA').AsString);
      End;
end;

procedure TQrCedExPg.QRFooterAcreditadoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

      qrlDiasMaxCP.Caption:= FloatToStr(vgMaxDiasCP);
      qrlDiasMaxFN.Caption:= FloatToStr(vgMaxDiasFN);
      qrlDiasMaxIN.Caption:= FloatToStr(vgMaxDiasIN);

      If Trim(sArchivo)<>'' Then Begin
         Writeln(F, 'Total Acreditado ' + #09#09#09#09#09#09+
                    'Mayor número de días atrasado en el Periodo'+ #09#09#09#09#09+
                  FormatFloat('###,###,###,###,##0.00',QRExpr14.Value.dblResult) + #09+
                  qrlDiasMaxCP.Caption+ #09#09#09#09#09 +
                  FormatFloat('###,###,###,###,##0.00',QRExpr1.Value.dblResult) + #09+
                  qrlDiasMaxFN.Caption + #09#09#09+
                  FormatFloat('###,###,###,###,##0.00',QRExpr9.Value.dblResult) + #09+
                  qrlDiasMaxIN.Caption
                );
      end;
end;

procedure TQrCedExPg.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If qyCedExPg.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

procedure TQrCedExPg.QROrigenBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
// var vlSqlK, vlSqlF, vlSqlI, vlDiasCP, vlDiasFN : String;
begin
   //
   vgMaxDiasCP :=0;
   vgMaxDiasFN :=0;
   vgMaxDiasIN :=0;
end;

procedure TQrCedExPg.QRGrpProveedorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := vgbMuestraProveedor;
end;

procedure TQrCedExPg.QRGrpMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := vgbMuestraProveedor;
end;

procedure TQrCedExPg.QRGrpFooterProveedorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := vgbMuestraProveedor;
end;

procedure TQrCedExPg.QRGrpFooterMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := vgbMuestraProveedor;
end;

End.
