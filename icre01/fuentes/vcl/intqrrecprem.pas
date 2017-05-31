unit IntQrRecPrem;
interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, QRExport,IntGenCre, U_InterCustomStar, U_InterDigDoc;

type
  TQrRecPrem = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRShCredito: TQRShape;
    QRShCliente: TQRShape;
    QRLbCliente: TQRLabel;
    QRShFVto: TQRShape;
    QRLbFVto: TQRLabel;
    QRShDiasXVencer: TQRShape;
    QRLbDiasXVencer: TQRLabel;
    QRShPremOriginal: TQRShape;
    QRLbPremOriginal: TQRLabel;
    QRShPremDevAnt: TQRShape;
    QRLbPremDevAnt: TQRLabel;
    QRShPremDia: TQRShape;
    QRLbPremiodia: TQRLabel;
    QRShPremDEvengado: TQRShape;
    QRLbPremioDevengado: TQRLabel;
    QRShPremDevengar: TQRShape;
    QRLbPRemioDevengar: TQRLabel;
    QRShMoneda: TQRShape;
    QRDBTCveMoneda: TQRDBText;
    qrlbMoneda: TQRLabel;
    QRDBTDEsc_Moneda: TQRDBText;
    QRShProducto: TQRShape;
    QRLProducto: TQRLabel;
    dbProducto: TQRDBText;
    dbDesc_Producto: TQRDBText;
    qyRecPremio: TQuery;
    QRGroupProducto: TQRGroup;
    QRBDetails: TQRBand;
    dbID_CREDITO: TQRDBText;
    dbCLIENTE: TQRExpr;
    dbF_VTO: TQRDBText;
    dbPREMIO_ORIGINAL: TQRDBText;
    dbPREMIO_DIA: TQRDBText;
    dbPremDevengar: TQRDBText;
    PageFooterBMoneda: TQRBand;
    QRExPremDevengarMon: TQRExpr;
    QRExPremDevMon: TQRExpr;
    QRExSumPremDiaMon: TQRExpr;
    QRExSumPremDevAntMon: TQRExpr;
    QRExSumPremioMon: TQRExpr;
    PageFooterBProducto: TQRBand;
    QRLbPorProducto: TQRLabel;
    dbDIAS_X_VENCER: TQRDBText;
    QRLbPorMoneda: TQRLabel;
    QExpCountMoneda: TQRExpr;
    QRExPremDevProd: TQRExpr;
    QRExSumPremDiaProd: TQRExpr;
    QRExSumPremDevAntProd: TQRExpr;
    QRExSumPremioProd: TQRExpr;
    QRExPremDevengarProd: TQRExpr;
    QRLbCredito: TQRLabel;
    QRShLinea: TQRShape;
    QRExpr2: TQRExpr;
    QRDBText1: TQRDBText;
    qyRecPremioCVE_PER_JURIDICA: TStringField;
    qyRecPremioNOMBRE: TStringField;
    qyRecPremioNOMBRE_PF: TStringField;
    qyRecPremioCVE_MONEDA: TFloatField;
    qyRecPremioDESC_MONEDA: TStringField;
    qyRecPremioCVE_PRODUCTO_CRE: TStringField;
    qyRecPremioDESC_C_PRODUCTO: TStringField;
    qyRecPremioID_CREDITO: TFloatField;
    qyRecPremioCVE_CALCULO: TStringField;
    qyRecPremioF_VENCIMIENTO: TDateTimeField;
    qyRecPremioPLAZO: TFloatField;
    qyRecPremioF_AUTORIZA: TDateTimeField;
    qyRecPremioDIAS_X_VENCER: TFloatField;
    qyRecPremioTIPO_DISPOSICION: TStringField;
    qyRecPremioIMP_PREMIO: TFloatField;
    qyRecPremioIMP_X_DEV_ANT: TFloatField;
    qyRecPremioIMP_INTERES_DIA: TFloatField;
    qyRecPremioIMP_PREM_DEV: TFloatField;
    qyRecPremioIMP_X_DEVENGAR: TFloatField;
    QRDBText2: TQRDBText;
    QRExcelFilter1: TQRExcelFilter;
    qyRecPremioIMP_INT_DEV: TFloatField;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRDBText3: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRShape2: TQRShape;
    qyRecPremioIMP_INT_DEV_DIA: TFloatField;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    qyRecPremioCUENTA_VIGENTE_INT: TStringField;
    QRDBText34: TQRDBText;
    InterDigDoc1: TInterDigDoc;
  private
  public
    Function FormaQuery(sFecha_dia, sEmpresa, sSucursal :String):String;
  end;

var
  QrRecPrem: TQrRecPrem;

Procedure RepRecPremio(  sFecha_dia, sEmpresa, sSucursal :String; pAPli : TInterApli; pPreview : Boolean;
                         //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
                         grOpcion  : TGenRepOption
                         //</LOLS>
                         );

Implementation
{$R *.DFM}

Procedure RepRecPremio(  sFecha_dia, sEmpresa, sSucursal :String; pAPli : TInterApli; pPreview : Boolean;
                         //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
                         grOpcion  : TGenRepOption
                         //</LOLS>
                         );

Var
    QrRecPrem: TQrRecPrem;
    Preview     : TIntQRPreview;
    //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
    sDigDocFileName : String;
    //</LOLS>
Begin
   QrRecPrem:=TQrRecPrem.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrRecPrem);
   Try
      QrRecPrem.qyRecPremio.Active:=False;
      QrRecPrem.qyRecPremio.Close;
      QrRecPrem.qyRecPremio.SQL.Clear;

      QrRecPrem.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrRecPrem.QRInterEncabezado1.NomReporte:='IntQrRecPrem';
      QrRecPrem.QRInterEncabezado1.Titulo1:='Intereses cobrados por anticipado al día :  ' + sFecha_dia;

      QrRecPrem.qyRecPremio.SQL.Add(QrRecPrem.FormaQuery(sFecha_dia, sEmpresa, sSucursal));
      QrRecPrem.qyRecPremio.DatabaseName:= pApli.DataBaseName;
      QrRecPrem.qyRecPremio.SessionName:= pApli.SessionName;
      QrRecPrem.QRInterEncabezado1.Apli := pApli;

      QrRecPrem.qyRecPremio.Open;

      //<LOLS 19ENE2006. DIGITALIZACION DE REPORTES>
      IF ( grOpcion = grPreview ) or ( grOpcion = grPrint ) then
      begin
          If QrRecPrem.qyRecPremio.IsEmpty Then
              ShowMessage('No Existen Datos para el Reporte,  Reintente mas tarde.  Gracias !!')
          Else Begin
             If grOpcion = grPreview Then
                QrRecPrem.Preview
             Else
                QrRecPrem.Print;
             //If pPreview Then
             //   QrRecPrem.Preview
             //Else
             //QrRecPrem.Print;
          End;
      End else if grOpcion = grDigitaliza then
      Begin
            sDigDocFileName := 'INT_COB_X_ANT_AL_DIA_'  +  FormatDateTime( 'DD_MM_YYYY', StrToDate(sFecha_dia) )
                               + '_' + sEmpresa + '_' + sSucursal;
            QrRecPrem.InterDigDoc1.RootDir  := obtValorGpoCve( 'CONFRH', 'ROOTDIR',   pApli );
            QrRecPrem.InterDigDoc1.HostName := obtValorGpoCve( 'CONFRH', 'FTPSERVER', pApli );
            QrRecPrem.InterDigDoc1.UserName := obtValorGpoCve( 'CONFRH', 'USERNAME',  pApli );
            QrRecPrem.InterDigDoc1.Password := HexToStr( obtValorGpoCve( 'CONFRH', 'PASSWORD',  pApli ) );
            QrRecPrem.InterDigDoc1.SendTo   := ObtSendTo( sFecha_dia );
            QrRecPrem.InterDigDoc1.FileName := sDigDocFileName;
            QrRecPrem.PrinterSettings.PrinterIndex := QrRecPrem.InterDigDoc1.SetPrinter;
            QrRecPrem.Print;
            QrRecPrem.InterDigDoc1.Compress;
            QrRecPrem.InterDigDoc1.SendFile;
            QrRecPrem.PrinterSettings.PrinterIndex := QrRecPrem.InterDigDoc1.RestorePrinter;
      End;
      //</LOLS>
    Finally
      QrRecPrem.Free;
    End;
End;

Function TQrRecPrem.FormaQuery( sFecha_dia, sEmpresa, sSucursal :String):String;
Var
    sSQL    : String;
    vlFecha : String;
Begin
    vlFecha := 'TO_DATE ( ' + #39 + sFecha_dia + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ' )';
    sSQL:=  ' SELECT P.CVE_PER_JURIDICA         ,       P.NOMBRE, ' +
            '        PF.APELLIDO_PATERNO|| ' + #39 + ' ' + #39 +
            '        ||PF.APELLIDO_MATERNO||' + #39 + ' ' + #39 +
            '        ||PF.NOMBRE_PERSONA NOMBRE_PF, ' +
            '        M.CVE_MONEDA               ,       M.DESC_MONEDA, ' +
            '        CP.CVE_PRODUCTO_CRE        ,       CP.DESC_C_PRODUCTO, ' +
            '        CR.ID_CREDITO              ,       CR.CVE_CALCULO, ' +
            '        CR.F_AUTORIZA + PKGCRPERIODO.ObtPlazoMax(CR.ID_CREDITO) F_VENCIMIENTO, ' +
            '        PKGCRPERIODO.ObtPlazoMax(CR.ID_CREDITO) AS PLAZO, ' +
            '        CR.F_AUTORIZA              ,       CRE.IMP_INT_DEV, ' +
            '        RED.IMP_INT_DEV_DIA, ' +   //ROIM    16/04/2004  CAMPO DEL REMANENTE POR DÍA
            '        PKGCRPERIODO.StpObtDiasXVencer(CHC.ID_CREDITO,CHC.F_CIERRE)  DIAS_X_VENCER, ' +
            '        CR.TIPO_DISPOSICION, ' +
            '        NVL(PKGCRPERIODO.StpObtImpPremio(CS.ID_CESION),0) IMP_PREMIO, ' +
//            '        PKGCRPERIODO.StpObtImpXDevAnterior(CHC.ID_CREDITO,CHC.IMP_INTERES_DIA,CHC.F_CIERRE) IMP_X_DEV_ANT, ' +
            '        CPD.IMP_PRE_DEVENGAR + CHC.IMP_INTERES_DIA IMP_X_DEV_ANT, ' +
            '        CHC.IMP_INTERES_DIA, ' +
//            '        ((NVL(PKGCRPERIODO.StpObtImpPremio(CS.ID_CESION),0) - NVL(PKGCRPERIODO.StpObtImpXDevengar(CHC.ID_CREDITO,CHC.IMP_INTERES_DIA,CHC.F_CIERRE),0)))IMP_PREM_DEV, ' +
            '        ((NVL(PKGCRPERIODO.StpObtImpPremio(CS.ID_CESION),0) - CPD.IMP_PRE_DEVENGAR))IMP_PREM_DEV, ' +
//            '        NVL(PKGCRPERIODO.StpObtImpXDevengar(CHC.ID_CREDITO,CHC.IMP_INTERES_DIA,CHC.F_CIERRE),0) IMP_X_DEVENGAR ' +
            '        CPD.IMP_PRE_DEVENGAR IMP_X_DEVENGAR, ' +
            //CUENTAS CONTABLES EASA4011        14072005
            '       TABCTA.CUENTA_VIGENTE_INT  ' +

            ' FROM   PERSONA        P   ,       CONTRATO    CTO, ' +
            '        PERSONA_FISICA PF  ,       MONEDA      M, ' +
            '        CR_CONTRATO    CCTO,       CR_PRODUCTO CP, ' +
            '        CR_CREDITO     CR  ,       CRE_PROV_DIARIA CPD, ' +
            '        CR_CESION      CS  ,' +
            '        (SELECT SUM(IMP_REMANENTE) IMP_INT_DEV, ID_CESION ' +
            '         FROM CR_REMANENTE ' +
            '         WHERE CVE_TIPO_REMAN = '+ #39 +'IN'+ #39 +' AND SIT_REMANENTE <> '+ #39 +'CA'+ #39 + ' AND F_PAGO <= ' + vlFecha +
            //ROIM  SE AGREGO LA VALIDACIÓN DE FECHA PARA QUE SOLO PRESENTE LAS DEVOLUCIONES MISMO DÍA O ANTERIORES.
            '         GROUP BY ID_CESION)  CRE, '+
            '        (SELECT SUM(IMP_REMANENTE) IMP_INT_DEV_DIA, ID_CESION ' +
            '         FROM CR_REMANENTE ' +
            '         WHERE CVE_TIPO_REMAN = '+ #39 +'IN'+ #39 +' AND SIT_REMANENTE <> '+ #39 +'CA'+ #39 + ' AND F_PAGO = ' + vlFecha +
            '         GROUP BY ID_CESION)  RED, '+
            //ROIM 16/04/2004  SE AGREGO EL QUERY PARA OBTENER EL IMPORTE DE REMANENTE POR DÍA
            '        CR_HISTO_CRED CHC, ' +

            //Para Obtener cuenta de Contabilidad Vigentes
            C_QUERY_CTAS +

            ' WHERE P.ID_PERSONA        = CTO.ID_TITULAR ' +
            '   AND P.ID_PERSONA        = PF.ID_PERSONA (+)  ' +
            '   AND CTO.CVE_MONEDA      = M.CVE_MONEDA  ' +
            '   AND CTO.ID_CONTRATO     = CCTO.ID_CONTRATO  ' +
            '   AND CP.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE  ' +
            '   AND CCTO.ID_CONTRATO    = CR.ID_CONTRATO  ' +
            '   AND CCTO.FOL_CONTRATO   = CR.FOL_CONTRATO  ' +
            '   AND CR.ID_CREDITO       = CS.ID_CESION  ' +
            '   AND CR.ID_CREDITO       = CHC.ID_CREDITO  ' +
            '   AND CS.CVE_TIPO_INTERES = ' + #39 + 'IN' + #39 + '  ' +
            '   AND CPD.ID_CREDITO      = CR.ID_CREDITO  ' +
            '   AND CPD.F_PROVISION     = '+ vlFecha + '  ' +
            '   AND CRE.ID_CESION (+)   = CS.ID_CESION  ' +
            '   AND RED.ID_CESION (+)   = CS.ID_CESION  ' +
            '   AND CHC.F_CIERRE        = '+ vlFecha +
            '   AND CHC.IMP_INTERES_DIA > 0  ' +
            '   AND TABCTA.CVE_PRODUCTO_CRE(+) = CP.CVE_PRODUCTO_CRE ' + coCRLF;

   If Trim(sEmpresa)<>'' Then
      sSQL:= sSQL + ' AND CP.ID_EMPRESA ='+ Trim(sEmpresa);

   sSQL:= sSQL + 'ORDER BY M.CVE_MONEDA,CP.CVE_PRODUCTO_CRE,P.NOMBRE,CHC.ID_CREDITO';
     Result:= sSQL;
End;

End.
