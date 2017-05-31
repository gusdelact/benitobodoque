unit IntMQrDevRem;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre, UnSQL2;

type
  TQrDevRem = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qyRelDevRem: TQuery;
    QRGroupEmisor: TQRGroup;
    QRBandProveedor: TQRBand;
    QRBandEmisor: TQRBand;
    QRDBText12: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel4: TQRLabel;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr24: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRShape3: TQRShape;
    QRLabel15: TQRLabel;
    QRShape4: TQRShape;
    QRLabel17: TQRLabel;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    QRShape7: TQRShape;
    QRLabel22: TQRLabel;
    QRShape12: TQRShape;
    QRLabel29: TQRLabel;
    QRShape13: TQRShape;
    QRLabel30: TQRLabel;
    QRShape15: TQRShape;
    QRLabel32: TQRLabel;
    QRShape16: TQRShape;
    QRLabel33: TQRLabel;
    QRShape19: TQRShape;
    QRLabel36: TQRLabel;
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    QRBandReman: TQRBand;
    QRLabel2: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel3: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRShape8: TQRShape;
    QRDBText7: TQRDBText;
    qyRelDevRemTIPO_REMANENTE: TStringField;
    qyRelDevRemID_EMISOR: TFloatField;
    qyRelDevRemNOM_EMISOR: TStringField;
    qyRelDevRemCVE_EMISOR_NAFIN: TStringField;
    qyRelDevRemNOMBRE_EMISOR: TStringField;
    qyRelDevRemID_PROVEEDOR: TFloatField;
    qyRelDevRemNOM_PROVEEDOR: TStringField;
    qyRelDevRemID_PROV_NAFINSA: TFloatField;
    qyRelDevRemID_DOCUMENTO: TStringField;
    qyRelDevRemDESC_DOCUMENTO: TStringField;
    qyRelDevRemCVE_TIPO_INTERES: TStringField;
    qyRelDevRemID_CESION: TFloatField;
    qyRelDevRemIMP_REMANENTE: TFloatField;
    qyRelDevRemIMP_DEV_REMAN: TFloatField;
    qyRelDevRemCVE_USU_DEV: TStringField;
    qyRelDevRemSIT_REMANENTE: TStringField;
    qyRelDevRemIMP_REMANENTE_MN: TFloatField;
    qyRelDevRemIMP_DEV_REMAN_MN: TFloatField;
    qrlTCambio: TQRLabel;
    lbTIPO_CAMBIO: TQRLabel;
    QRLabel1: TQRLabel;
    lbTCambioEmis: TQRLabel;
    qrGroupMoneda: TQRGroup;
    qrMoneda: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel24: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRShape9: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText17: TQRDBText;
    QRShape10: TQRShape;
    QRLabel14: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText28: TQRDBText;
    QRShape11: TQRShape;
    QRLabel27: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    qyRelDevRemCVE_MONEDA: TFloatField;
    qyRelDevRemDESC_MONEDA: TStringField;
    lbTCamb: TQRLabel;
    lbTCambioProv: TQRLabel;
    qyRelDevRemCHEQUERA_EMI: TMemoField;
    qyRelDevRemCHEQUERA_PROV: TMemoField;
    qyRelDevRemF_COMPRA: TDateTimeField;
    qyRelDevRemF_VENCIMIENTO: TDateTimeField;
    qyRelDevRemF_PAGO: TDateTimeField;
    qyRelDevRemF_DEV_REMANENTE: TDateTimeField;
    procedure QRBandProveedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandEmisorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandRemanBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
    vgFechaMesAnt  : TDate;
    vgTCambioMesAnt: Double;
    Function FormaQuery(sF_LiqIni,sF_LiqFin,sF_DevIni,sF_DevFin,sF_ComIni,sF_ComFin,
                        sEmisor,sProveedor,sAutorizacion,sDisposicion,
                        sSitDoc,sSitDev,sTipoRep,sOrden, sEmpresa, sSucursal :String):String;
  end;

var
  QrDevRem: TQrDevRem;

Procedure RepRelDevRem( sF_LiqIni,sF_LiqFin,sF_DevIni,sF_DevFin,sF_ComIni,sF_ComFin,
                        sEmisor,sProveedor,sAutorizacion,sDisposicion,
                        sSitDoc,sSitDev,sTipoRep,sOrden, sEmpresa, sSucursal :String;
                        pAPli     : TInterApli;
                        pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepRelDevRem( sF_LiqIni,sF_LiqFin,sF_DevIni,sF_DevFin,sF_ComIni,sF_ComFin,
                        sEmisor,sProveedor,sAutorizacion,sDisposicion,
                        sSitDoc,sSitDev,sTipoRep,sOrden, sEmpresa, sSucursal :String;
                        pAPli     : TInterApli;
                        pPreview  : Boolean);
Var
    QrDevRem: TQrDevRem;
    Preview     : TIntQRPreview;
Begin
    QrDevRem:=TQrDevRem.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrDevRem);
    Try

        QrDevRem.QRInterEncabezado1.Apli:=pApli;
        QrDevRem.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrDevRem.QRInterEncabezado1.NomReporte:='IntMQrDevRem';
        QrDevRem.QRInterEncabezado1.Titulo1:='Relación de Devoluciones de Remanante e Intereses Devengados';

        If (Trim(sF_LiqIni)<>'')and(Trim(sF_LiqFin)<>'') Then Begin
            QrDevRem.QRInterEncabezado1.Titulo2:='Fecha de Liquidación del '+
                                                 sF_LiqIni+ ' al '+sF_LiqFin;
        End Else If (Trim(sF_DevIni)<>'')and(Trim(sF_DevFin)<>'') Then Begin
            QrDevRem.QRInterEncabezado1.Titulo2:='Fecha de Devolución de Remanente del '+
                                                 sF_DevIni+ ' al '+sF_DevFin;
        End Else If (Trim(sF_ComIni)<>'')and(Trim(sF_ComFin)<>'') Then Begin
            QrDevRem.QRInterEncabezado1.Titulo2:='Fecha de Compra del '+
                                                 sF_ComIni+ ' al '+sF_ComFin;
        End;

        QrDevRem.qyRelDevRem.DatabaseName := pApli.DataBaseName;
        QrDevRem.qyRelDevRem.SessionName := pApli.SessionName;
        {obtine el tipo de cambio del mes anterior}
        QrDevRem.vgFechaMesAnt := ObtFechaMesAnt( C_FMAN, pApli );
        QrDevRem.vgTCambioMesAnt := ObtTipoCambio( QrDevRem.vgFechaMesAnt,
                                                   IntToStr ( C_DLLS ) ,
                                                   pAPli.DataBaseName, pAPli.SessionName);

        {}
        QrDevRem.qyRelDevRem.Active:=False;
        QrDevRem.qyRelDevRem.SQL.Text:= QrDevRem.FormaQuery(sF_LiqIni,sF_LiqFin,
                        sF_DevIni,sF_DevFin,sF_ComIni,sF_ComFin,
                        sEmisor,sProveedor,sAutorizacion,sDisposicion,
                        sSitDoc,sSitDev,sTipoRep,sOrden, sEmpresa, sSucursal);

        QrDevRem.qyRelDevRem.Active:=False;
        QrDevRem.qyRelDevRem.Active:=True;

        If pPreview Then
            QrDevRem.Preview
        Else
            QrDevRem.Print;
    Finally
        QrDevRem.free;
    End;

End;

Function TQrDevRem.FormaQuery(  sF_LiqIni,sF_LiqFin,sF_DevIni,sF_DevFin,sF_ComIni,sF_ComFin,
                        sEmisor,sProveedor,sAutorizacion,sDisposicion,
                        sSitDoc,sSitDev,sTipoRep,sOrden, sEmpresa, sSucursal :String):String;
Var
    sSQL:String;
Begin
    sSQL:=  ' SELECT '+ coCRLF +
            '   CD.ID_DOCUMENTO,        '+ coCRLF +
            '   CD.CVE_TIPO_INTERES,    '+ coCRLF +
            '   CD.ID_CESION,           '+ coCRLF +
            '   CD.F_COMPRA,            '+ coCRLF +
            '   CTD.DESC_DOCUMENTO,     '+ coCRLF +
            '   CCA.F_VENCIMIENTO,      '+ coCRLF +
            '   CCA.F_PAGO,             '+ coCRLF +
            '   CR.IMP_REMANENTE,       '+ coCRLF +
            '   ( CR.IMP_REMANENTE * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  ' + SQLFecha(vgFechaMesAnt)    +
                        ' , CTO.CVE_MONEDA, ''V''), 1 ))) IMP_REMANENTE_MN,    ' + coCRLF + //EASA4011 DLLS 28/04/2004
            '   CR.IMP_DEV_REMAN,       '+ coCRLF +
            '   ( CR.IMP_DEV_REMAN * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  ' + SQLFecha(vgFechaMesAnt)    +
                        ' , CTO.CVE_MONEDA, ''V''), 1 ))) IMP_DEV_REMAN_MN,    ' + coCRLF + //EASA4011 DLLS 28/04/2004
            '   CR.F_DEV_REMANENTE,     '+ coCRLF +
            '   CR.CVE_USU_DEV,         '+ coCRLF +
            '   CR.SIT_REMANENTE,       '+ coCRLF +
            '   DECODE(CVE_TIPO_REMAN,''RE'',''REMANENTE'',''IN'',''INTERESES'',''NO IDENTIFICADO'') TIPO_REMANENTE, '+ coCRLF +
            '   CCE.ID_EMISOR,          '+ coCRLF +
            '   CCE.CVE_EMISOR_NAFIN,   '+ coCRLF +
            '   CCE.ID_PROVEEDOR,       '+ coCRLF +
            '   DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PE.APELLIDO_PATERNO||'' ''||PE.APELLIDO_MATERNO||'' ''||PE.NOMBRE_PERSONA) NOM_EMISOR, '+ coCRLF +
            '   CE.NOMBRE_EMISOR,       '+ coCRLF +
            '   PKGCRPERIODO.STPObtChqCte(CCE.ID_EMISOR,CCE.CVE_EMISOR_NAFIN,CCE.ID_CESION,''AC'',''AD'',''CR'') CHEQUERA_EMI,'+ coCRLF +
            '   PP.NOMBRE NOM_PROVEEDOR,'+ coCRLF +
            '   PKGCRPERIODO.STPObtChqCte(CCE.ID_PROVEEDOR,NULL,CCE.ID_CESION,''PR'',''AD'',''AB'') CHEQUERA_PROV, '+ coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//            '   CP.ID_PROV_NAFINSA, '+ coCRLF +
            '   CP.ID_PROV_EXTERNO AS ID_PROV_NAFINSA, '+ coCRLF +
{/ROIM}
            '   CTO.CVE_MONEDA,     '+ coCRLF +
            '   M.DESC_MONEDA       '+ coCRLF +

            ' FROM '+ coCRLF +
            '   CR_DOCUMENTO   CD,  '+ coCRLF +
            '   CR_TIPO_DOCTO  CTD, '+ coCRLF +
            '   CR_CAPITAL     CCA, '+ coCRLF +
            '   CR_REMANENTE   CR,  '+ coCRLF +
            '   CR_CESION      CCE, '+ coCRLF +
            '   PERSONA_FISICA PE,  '+ coCRLF +
            '   PERSONA        PCE, '+ coCRLF +
            '   CR_EMISOR      CE,  '+ coCRLF +
            '   PERSONA        PP,  '+ coCRLF +
            '   CR_PROVEEDOR   CP,  '+ coCRLF +
            '   CR_CREDITO     CC,  '+ coCRLF +
            '   CONTRATO       CTO, '+ coCRLF +
            '   MONEDA         M,   '+ coCRLF +
            '   CR_CONTRATO,        '+ coCRLF +
            '   CR_PRODUCTO         '+ coCRLF +

            ' WHERE CTD.CVE_DOCUMENTO = CD.CVE_DOCUMENTO        '+ coCRLF +
            ' AND      CCA.ID_CREDITO = CD.ID_CESION            '+ coCRLF +
            ' AND     CCA.NUM_PERIODO = CD.NUM_PERIODO_DOC      '+ coCRLF +
            ' AND        CR.ID_CESION = CD.ID_CESION            '+ coCRLF +
            ' AND     CR.ID_DOCUMENTO = CD.ID_DOCUMENTO         '+ coCRLF +
            ' AND       CCE.ID_CESION = CD.ID_CESION            '+ coCRLF +
            ' AND     PE.ID_PERSONA(+)= CCE.ID_EMISOR           '+ coCRLF +
            ' AND      PCE.ID_PERSONA = CCE.ID_EMISOR           '+ coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
            ' AND    CE.CVE_FND_ENT_DES = CCE.CVE_FND_ENT_DES           '+ coCRLF +
            ' AND    CE.ID_ACREDITADO = CCE.ID_EMISOR           '+ coCRLF +
//            ' AND CE.CVE_EMISOR_NAFIN = CCE.CVE_EMISOR_NAFIN    '+ coCRLF +
            ' AND CE.CVE_EMISOR_EXT = CCE.CVE_EMISOR_NAFIN    '+ coCRLF +
{/ROIM}
            ' AND       PP.ID_PERSONA = CCE.ID_PROVEEDOR        '+ coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
            ' AND    CP.CVE_FND_ENT_DES = CCE.CVE_FND_ENT_DES           '+ coCRLF +
{/ROIM}
            ' AND    CP.ID_ACREDITADO = CCE.ID_PROVEEDOR        '+ coCRLF +
            ' AND       CC.ID_CREDITO = CD.ID_CESION            '+ coCRLF +
            ' AND     CTO.ID_CONTRATO = CC.ID_CONTRATO          '+ coCRLF +
            ' AND        M.CVE_MONEDA = CTO.CVE_MONEDA          '+ coCRLF +
            ' AND    CC.ID_CONTRATO   = CR_CONTRATO.ID_CONTRATO '+ coCRLF +
            ' AND    CC.FOL_CONTRATO  = CR_CONTRATO.FOL_CONTRATO '+ coCRLF +
            ' AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE ';

    If (Trim(sF_LiqIni)<>'')And(Trim(sF_LiqFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CCA.F_PAGO BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_LiqIni))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_LiqFin))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_LiqIni)<>'')And(Trim(sF_LiqFin)='') Then Begin
        sSQL:= sSQL + ' AND CCA.F_PAGO > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_LiqIni))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_LiqIni)='')And(Trim(sF_LiqFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CCA.F_PAGO < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_LiqFin))+
        ''',''DD/MM/YYYY'')';
    End;

    If (Trim(sF_DevIni)<>'')And(Trim(sF_DevFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CR.F_PAGO BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_DevIni))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_DevFin))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_DevIni)<>'')And(Trim(sF_DevFin)='') Then Begin
        sSQL:= sSQL + ' AND CR.F_PAGO > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_DevIni))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_DevIni)='')And(Trim(sF_DevFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CR.F_PAGO < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_DevFin))+
        ''',''DD/MM/YYYY'')';
    End;

    If (Trim(sF_ComIni)<>'')And(Trim(sF_ComFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CD.F_COMPRA BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_ComIni))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_ComFin))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_ComIni)<>'')And(Trim(sF_ComFin)='') Then Begin
        sSQL:= sSQL + ' AND CD.F_COMPRA > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_ComIni))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_ComIni)='')And(Trim(sF_ComFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CD.F_COMPRA < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_ComFin))+
        ''',''DD/MM/YYYY'')';
    End;

    If (Trim(sEmisor)<>'') Then
        sSQL:= sSQL + ' AND   CCE.ID_EMISOR  ='+sEmisor;
    If (Trim(sProveedor)<>'') Then
        sSQL:= sSQL + ' AND CCE.ID_PROVEEDOR  ='+ sProveedor;
    If (Trim(sAutorizacion)<>'') Then
        sSQL:= sSQL + ' AND   CTO.ID_CONTRATO ='+ sAutorizacion;
    If (Trim(sDisposicion)<>'') Then
        sSQL:= sSQL + ' AND   CC.ID_CREDITO   ='+ sDisposicion;
    If (Trim(sSitDoc)<>'') Then
        sSQL:= sSQL + ' AND   CD.SIT_DOCUMENTO='''+ sSitDoc +'''';
    If (Trim(sSitDev)<>'') Then
        sSQL:= sSQL + ' AND   CR.SIT_REMANENTE='''+ sSitDev +'''';
    If (Trim(sTipoRep)<>'') Then
        sSQL:= sSQL + ' AND   CR.CVE_TIPO_REMAN IN('+ sTipoRep +')';
    If (Trim(sEmpresa)<>'') Then
        sSQL:= sSQL + ' AND CR_PRODUCTO.ID_EMPRESA ='+ Trim(sEmpresa);


    If Trim(sOrden)='C' Then
        sSQL:= sSQL + ' ORDER BY TIPO_REMANENTE, NOM_EMISOR, NOM_PROVEEDOR,CC.ID_CREDITO'
    Else
        sSQL:= sSQL + ' ORDER BY TIPO_REMANENTE, NOM_EMISOR, NOM_PROVEEDOR,CD.ID_DOCUMENTO,CC.ID_CREDITO';
    Result:= sSQL;
End;

procedure TQrDevRem.QRBandProveedorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   lbTCambioProv.Caption := FloatToStr(vgTCambioMesAnt);
end;

procedure TQrDevRem.QRBandEmisorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   lbTCambioEmis.Caption := FloatToStr(vgTCambioMesAnt);
end;

procedure TQrDevRem.QRBandRemanBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   lbTIPO_CAMBIO.Caption := FloatToStr(vgTCambioMesAnt);
end;

End.
