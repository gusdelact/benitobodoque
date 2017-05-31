unit IntMQrDevCom;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre, UnSQL2,
  //UNIDAD DE CALCULO DEL IVA     
  UnTasaimp
  ;

type
  TQrDevCom = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qyRelDevCom: TQuery;
    QRGroupEmisor: TQRGroup;
    QRGroupProveedor: TQRGroup;
    QRBandProveedor: TQRBand;
    QRBandEmisor: TQRBand;
    QRLabel8: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel4: TQRLabel;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
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
    QRShape19: TQRShape;
    QRLabel36: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText18: TQRDBText;
    qrlTCambio: TQRLabel;
    lbTCambioEmis: TQRLabel;
    qyRelDevComID_EMISOR: TFloatField;
    qyRelDevComNOM_EMISOR: TStringField;
    qyRelDevComCVE_EMISOR_NAFIN: TStringField;
    qyRelDevComNOMBRE_EMISOR: TStringField;
    qyRelDevComID_PROVEEDOR: TFloatField;
    qyRelDevComNOM_PROVEEDOR: TStringField;
    qyRelDevComID_PROV_NAFINSA: TFloatField;
    qyRelDevComID_DOCUMENTO: TStringField;
    qyRelDevComDESC_DOCUMENTO: TStringField;
    qyRelDevComCVE_TIPO_INTERES: TStringField;
    qyRelDevComID_CESION: TFloatField;
    qyRelDevComCVE_USU_DEV: TStringField;
    qyRelDevComSIT_REMANENTE: TStringField;
    qyRelDevComCVE_MONEDA: TFloatField;
    qyRelDevComDESC_MONEDA: TStringField;
    qyRelDevComCHEQUERA_EMI: TMemoField;
    qyRelDevComCHEQUERA_PROV: TMemoField;
    qrBandMoneda: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    qrGroupMoneda: TQRGroup;
    QRShape10: TQRShape;
    QRLabel14: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel11: TQRLabel;
    lbTCambioProv: TQRLabel;
    qyRelDevComIMP_COMISION_MN: TFloatField;
    qyRelDevComIMP_COMISION: TFloatField;
    qyRelDevComIMP_IVA_MN: TFloatField;
    qyRelDevComIMP_IVA: TFloatField;
    qyRelDevComIMP_TOTAL_MN: TFloatField;
    qyRelDevComIMP_TOTAL: TFloatField;
    qyRelDevComF_COMPRA: TDateTimeField;
    qyRelDevComF_DEV_REMANENTE: TDateTimeField;
    qyRelDevComF_VENCIMIENTO: TDateTimeField;
    qyRelDevComF_PAGO: TDateTimeField;
    procedure QRBandProveedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandEmisorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
    vgFechaMesAnt  : TDate;
    vgTCambioMesAnt: Double;
    Function FormaQuery(sF_LiqIni,sF_LiqFin,sF_DevIni,sF_DevFin,sF_ComIni,sF_ComFin,
                        sEmisor,sProveedor,sAutorizacion,sDisposicion,
                        sSitDoc,sSitDev,sTipoRep,sOrden, sEmpresa, sSucursal:String;
   // ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
                        pAPli     : TInterApli):String;
   // FIN cambio de IVA de 15 a 16
  end;

var
  QrDevCom: TQrDevCom;

// ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
  kTasaIVA : string;
//Fin HERJA IVA

Procedure RepRelDevCom( sF_LiqIni,sF_LiqFin,sF_DevIni,sF_DevFin,sF_ComIni,sF_ComFin,
                        sEmisor,sProveedor,sAutorizacion,sDisposicion,
                        sSitDoc,sSitDev,sTipoRep,sOrden, sEmpresa, sSucursal :String;
                        pAPli     : TInterApli;
                        pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepRelDevCom( sF_LiqIni,sF_LiqFin,sF_DevIni,sF_DevFin,sF_ComIni,sF_ComFin,
                        sEmisor,sProveedor,sAutorizacion,sDisposicion,
                        sSitDoc,sSitDev,sTipoRep,sOrden, sEmpresa, sSucursal:String;
                        pAPli     : TInterApli;
                        pPreview  : Boolean);
Var
    QrDevCom: TQrDevCom;
    Preview     : TIntQRPreview;
Begin
    QrDevCom:=TQrDevCom.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrDevCom);
    Try

        QrDevCom.QRInterEncabezado1.Apli:=pApli;
        QrDevCom.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrDevCom.QRInterEncabezado1.NomReporte:='IntMQrDevCom';
//        QrDevCom.QRInterEncabezado1.Titulo1:='Relación de Devoluciones de Comisión por Pago Oportuno';
        QrDevCom.QRInterEncabezado1.Titulo1:='Gastos de Administración';

        If (Trim(sF_LiqIni)<>'')and(Trim(sF_LiqFin)<>'') Then Begin
            QrDevCom.QRInterEncabezado1.Titulo2:='Fecha de Liquidación del '+
                                                 sF_LiqIni+ ' al '+sF_LiqFin;
        End Else If (Trim(sF_DevIni)<>'')and(Trim(sF_DevFin)<>'') Then Begin
            QrDevCom.QRInterEncabezado1.Titulo2:='Fecha de Devolución de Remanente del '+
                                                 sF_DevIni+ ' al '+sF_DevFin;
        End Else If (Trim(sF_ComIni)<>'')and(Trim(sF_ComFin)<>'') Then Begin
            QrDevCom.QRInterEncabezado1.Titulo2:='Fecha de Compra del '+
                                                 sF_ComIni+ ' al '+sF_ComFin;
        End;

        QrDevCom.qyRelDevCom.DatabaseName := pApli.DataBaseName;
        QrDevCom.qyRelDevCom.SessionName := pApli.SessionName;
        {obtine el tipo de cambio del mes anterior}
        QrDevCom.vgFechaMesAnt := ObtFechaMesAnt( C_FMAN, pApli );
        QrDevCom.vgTCambioMesAnt := ObtTipoCambio( QrDevCom.vgFechaMesAnt,
                                                   IntToStr ( C_DLLS ) ,
                                                   pAPli.DataBaseName, pAPli.SessionName);

        {}
        QrDevCom.qyRelDevCom.Active:=False;
        QrDevCom.qyRelDevCom.SQL.Text:= QrDevCom.FormaQuery(sF_LiqIni,sF_LiqFin,
                        sF_DevIni,sF_DevFin,sF_ComIni,sF_ComFin,
                        sEmisor,sProveedor,sAutorizacion,sDisposicion,
                        sSitDoc,sSitDev,sTipoRep,sOrden, sEmpresa, sSucursal,
   // ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
                        pAPli);
   // FIN cambio de IVA de 15 a 16


        QrDevCom.qyRelDevCom.Active:=False;
        QrDevCom.qyRelDevCom.Active:=True;

        If pPreview Then
            QrDevCom.Preview
        Else
            QrDevCom.Print;
    Finally
        QrDevCom.free;
    End;
End;

Function TQrDevCom.FormaQuery(  sF_LiqIni,sF_LiqFin,sF_DevIni,sF_DevFin,sF_ComIni,sF_ComFin,
                        sEmisor,sProveedor,sAutorizacion,sDisposicion,
                        sSitDoc,sSitDev,sTipoRep,sOrden, sEmpresa, sSucursal :String;
   // ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
                        pAPli     : TInterApli):String;
   // FIN cambio de IVA de 15 a 16

Var
    sSQL:String;
Begin
   // ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
   kTasaIVA :=  fDameIVA(pAPli);
   //Fin HERJA IVA

    sSQL:=  ' SELECT '+ coCRLF +
            '   CD.ID_DOCUMENTO,        '+ coCRLF +
            '   CD.CVE_TIPO_INTERES,    '+ coCRLF +
            '   CD.ID_CESION,           '+ coCRLF +
            '   CD.F_COMPRA,            '+ coCRLF +
            '   CD.TASA_COMISION,       '+ coCRLF +
            '   CTD.DESC_DOCUMENTO,     '+ coCRLF +
            '   CCA.F_VENCIMIENTO,      '+ coCRLF +
            '   CCA.F_PAGO,             '+ coCRLF +
         //CORRECCION DE IVA DE 15 A 16
         //ASTECI HERJA 16/12/2009
         //   '   (   CR.IMP_REMANENTE / 1.15) IMP_COMISION,   '+ coCRLF +
            '   (   CR.IMP_REMANENTE / 1.'+kTasaIVA+') IMP_COMISION,   '+ coCRLF +
         //FIN DE CORRECCION

         //CORRECCION DE IVA DE 15 A 16
         //ASTECI HERJA 16/12/2009
         //   '   ((   CR.IMP_REMANENTE / 1.15) * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  ' + SQLFecha(vgFechaMesAnt)    +
            '   ((   CR.IMP_REMANENTE / 1.'+kTasaIVA+') * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  ' + SQLFecha(vgFechaMesAnt)    +
         //FIN DE CORRECCION

                        ' , CTO.CVE_MONEDA, ''V''), 1 ))) IMP_COMISION_MN,    ' + coCRLF + //EASA4011 DLLS 28/04/2004

         //CORRECCION DE IVA DE 15 A 16
         //ASTECI HERJA 16/12/2009
         //   '   ( ( CR.IMP_REMANENTE * .15) / 1.15) IMP_IVA, '+ coCRLF +
            '   ( ( CR.IMP_REMANENTE * .'+kTasaIVA+') / 1.'+kTasaIVA+') IMP_IVA, '+ coCRLF +
         //FIN DE CORRECCION

         //CORRECCION DE IVA DE 15 A 16
         //ASTECI HERJA 16/12/2009
         //   '   (( ( CR.IMP_REMANENTE * .15) / 1.15) * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  ' + SQLFecha(vgFechaMesAnt)    +
            '   (( ( CR.IMP_REMANENTE * .'+kTasaIVA+') / 1.'+kTasaIVA+') * ( NVL( PKGCORPO.OBTTIPOCAMBIO (  ' + SQLFecha(vgFechaMesAnt)    +
         //FIN DE CORRECCION

                        ' , CTO.CVE_MONEDA, ''V''), 1 ))) IMP_IVA_MN,   ' + coCRLF + //EASA4011 DLLS 28/04/2004
            '   CR.IMP_REMANENTE IMP_TOTAL,     '+ coCRLF +
            '   (CR.IMP_REMANENTE * ( NVL( PKGCORPO.OBTTIPOCAMBIO (      ' + SQLFecha(vgFechaMesAnt)    +
                        ' , CTO.CVE_MONEDA, ''V''), 1 ))) IMP_TOTAL_MN, ' + coCRLF + //EASA4011 DLLS 28/04/2004
            '   CR.F_DEV_REMANENTE,             '+ coCRLF +
            '   CR.CVE_USU_DEV,                 '+ coCRLF +
            '   CR.SIT_REMANENTE,               '+ coCRLF +
            '   CCE.ID_EMISOR,                  '+ coCRLF +
            '   CCE.CVE_EMISOR_NAFIN,           '+ coCRLF +
            '   CCE.ID_PROVEEDOR,               '+ coCRLF +
            '   DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PE.APELLIDO_PATERNO||'' ''||PE.APELLIDO_MATERNO||'' ''||PE.NOMBRE_PERSONA) NOM_EMISOR, '+ coCRLF +
            '   CE.NOMBRE_EMISOR,               '+ coCRLF +
            '   PKGCRPERIODO.STPObtChqCte(CCE.ID_EMISOR,CCE.CVE_EMISOR_NAFIN,CCE.ID_CESION,''AC'',''AD'',''CR'') CHEQUERA_EMI,'+ coCRLF +
            '   PP.NOMBRE NOM_PROVEEDOR,        '+ coCRLF +
            '   PKGCRPERIODO.STPObtChqCte(CCE.ID_PROVEEDOR,NULL,CCE.ID_CESION,''PR'',''AD'',''AB'') CHEQUERA_PROV, '+ coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//            '   CP.ID_PROV_NAFINSA, '+ coCRLF +
            '   CP.ID_PROV_EXTERNO AS ID_PROV_NAFINSA, '+ coCRLF +
{/ROIM}
            '   CTO.CVE_MONEDA,     '+ coCRLF +
            '   M.DESC_MONEDA       '+ coCRLF +

            ' FROM '+ coCRLF +
            '   CR_DOCUMENTO   CD, '+ coCRLF +
            '   CR_TIPO_DOCTO  CTD,'+ coCRLF +
            '   CR_CAPITAL     CCA,'+ coCRLF +
            '   CR_REMANENTE   CR, '+ coCRLF +
            '   CR_CESION      CCE,'+ coCRLF +
            '   PERSONA_FISICA PE, '+ coCRLF +
            '   PERSONA        PCE,'+ coCRLF +
            '   CR_EMISOR      CE, '+ coCRLF +
            '   PERSONA        PP, '+ coCRLF +
            '   CR_PROVEEDOR   CP, '+ coCRLF +
            '   CR_CREDITO     CC, '+ coCRLF +
            '   CONTRATO       CTO,'+ coCRLF +
            '   MONEDA         M,   '+ coCRLF +
            '   CR_CONTRATO     , '+ coCRLF +
            '   CR_PRODUCTO '+ coCRLF +

            ' WHERE CTD.CVE_DOCUMENTO = CD.CVE_DOCUMENTO        '+ coCRLF +
            ' AND      CCA.ID_CREDITO = CD.ID_CESION            '+ coCRLF +
            ' AND     CCA.NUM_PERIODO = CD.NUM_PERIODO_DOC      '+ coCRLF +
            ' AND        CR.ID_CESION = CD.ID_CESION            '+ coCRLF +
            ' AND     CR.ID_DOCUMENTO = CD.ID_DOCUMENTO         '+ coCRLF +
            ' AND       CCE.ID_CESION = CD.ID_CESION            '+ coCRLF +
            ' AND    PE.ID_PERSONA(+) = CCE.ID_EMISOR           '+ coCRLF +
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
//        sSQL:= sSQL + ' AND CR.F_DEV_REMANENTE BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_DevIni))+
        sSQL:= sSQL + ' AND CR.F_PAGO BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_DevIni))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_DevFin))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_DevIni)<>'')And(Trim(sF_DevFin)='') Then Begin
//        sSQL:= sSQL + ' AND CR.F_DEV_REMANENTE > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_DevIni))+
        sSQL:= sSQL + ' AND CR.F_PAGO > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_DevIni))+
        ''',''DD/MM/YYYY'')';
    End Else If (Trim(sF_DevIni)='')And(Trim(sF_DevFin)<>'') Then Begin
//        sSQL:= sSQL + ' AND CR.F_DEV_REMANENTE < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_DevFin))+
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
        sSQL:= sSQL + ' ORDER BY NOM_EMISOR,NOM_PROVEEDOR,CC.ID_CREDITO'
    Else
        sSQL:= sSQL + ' ORDER BY NOM_EMISOR,NOM_PROVEEDOR,CD.ID_DOCUMENTO,CC.ID_CREDITO';
    Result:= sSQL;

End;

procedure TQrDevCom.QRBandProveedorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   lbTCambioProv.Caption := FloatToStr(vgTCambioMesAnt);
end;

procedure TQrDevCom.QRBandEmisorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   lbTCambioEmis.Caption := FloatToStr(vgTCambioMesAnt);
end;

End.
