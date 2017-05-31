// Reporte de Seguimiento de Garantía Liquida
// AARJ 26 Oct. 2009
unit IntMQrSegGarLiq;

interface
                   
uses Windows, SysUtils, Messages, Classes, Graphics, Controls, unSQL2,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, Dialogs, IntGenCre, ComObj, IntXls;
Const
   coCRLF      = #13#10;
type
  TQrSegGarLiq = class(TQuickRep)
    qySegGarLiq: TQuery;

    QRBandDetalle: TQRBand;
    SummaryBand1: TQRBand;
    QRBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qySegGarLiqID_CREDITO: TFloatField;
    qySegGarLiqNOM_ACREDITADO: TStringField;
    qySegGarLiqNOM_TITULAR: TStringField;
    qySegGarLiqID_CONTRATO: TFloatField;
    qySegGarLiqID_CONTRATO_DV: TFloatField;
    qySegGarLiqCVE_MONEDA_DV: TFloatField;
    qySegGarLiqDESC_MONEDA_DV: TStringField;
    qySegGarLiqCVE_ORIGEN: TStringField;
    qySegGarLiqIMP_BLOQ: TFloatField;
    qySegGarLiqCVE_PRODUCTO_CRE: TStringField;
    qySegGarLiqCVE_PRODUCTO: TStringField;
    qySegGarLiqCVE_PRODUCTO_GPO: TStringField;
    qySegGarLiqSDO_DISP_CHEQ: TFloatField;
    qySegGarLiqIMP_DISPUESTO: TFloatField;
    qySegGarLiqF_INICIO_CRE: TDateTimeField;
    qySegGarLiqF_VENCIMIENTO_CRE: TDateTimeField;
    qySegGarLiqSDO_INSOLUTO: TFloatField;
    qySegGarLiqPROPORCION: TFloatField;
    qySegGarLiqID_CONT_CGFC: TFloatField;
    qySegGarLiqCVE_OPERATIVA: TStringField;
    qySegGarLiqSDO_GAR_SI: TFloatField;
    qySegGarLiqSDO_GAR_DISP: TFloatField;
    qySegGarLiqVARIACN_SI: TFloatField;
    qySegGarLiqVARIACN_INI: TFloatField;
    QRFooterMoneda: TQRBand;
    QRFooterProducto: TQRBand;
    QRGroupMoneda: TQRGroup;
    QRGroupProducto: TQRGroup;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabelCREDITO: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabelACREDITADO: TQRLabel;
    QRLabelSaldoAGarantizarSI: TQRLabel;
    QRLabelIMP_FEGA: TQRLabel;
    QRLabelVariacionSI: TQRLabel;
    QRLabelDIASIMVE: TQRLabel;
    QRShape14: TQRShape;
    QRLabelFVencimiento: TQRLabel;
    QRShape23: TQRShape;
    QRShape10: TQRShape;
    QRLabelChequera: TQRLabel;
    QRShape9: TQRShape;
    QRLabelSistema: TQRLabel;
    QRLabelImpBloqueado: TQRLabel;
    QRShape11: TQRShape;
    QRLabelSdoChequera: TQRLabel;
    QRLabelImpDispuesto: TQRLabel;
    QRShape15: TQRShape;
    QRLabelFInicio: TQRLabel;
    QRShape16: TQRShape;
    QRLabelSaldoInsoluto: TQRLabel;
    QRShape17: TQRShape;
    QRLabelProporcion: TQRLabel;
    QRLabelTITULAR: TQRLabel;
    qySegGarLiqDESC_C_PRODUCTO: TStringField;
    QRShape20: TQRShape;
    QRDBDESC_MONEDA: TQRDBText;
    QRLabelMoneda: TQRLabel;
    QRDBCVE_MONEDA: TQRDBText;
    QRShape19: TQRShape;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBID_CREDITO: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBIMPORTE: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRExprSumaMON_IMPORTE: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRShape12: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRShape13: TQRShape;
    QRShape18: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;

  private

  public


    function  FormaQuery(sF_Cierre ,
                        sProducto , sProd_Grupo ,
                        sMoneda   , sSistema    ,
                        sEmpresa  , sSucursal   ,
                        sMGposProd, sMProductos :String):String;
  end;

var
  QrSegGarLiq : TQrSegGarLiq;
  bGenArch    : Boolean;
  sArchivo    : String;
  vgFechaHoy  : TDateTime;
  F           : TextFile;
  Apli        : TInterApli;
  vgnRowExcel : Integer;
  vgExcelApp  : OleVariant;

  procedure RepSegGtiaLiq(sF_Cierre ,
                          sProducto , sProd_Grupo ,
                          sMoneda   , sSistema    ,
                          sEmpresa  , sSucursal   ,
                          sNbrArch:String;
                          pPreview  : Boolean;
                          pAPli     : TInterApli;
                          sMGposProd  ,
                          sMProductos : String );

  procedure EscribeInfoXLS(fechaCierre, nomArchivo:String; lQuery:TQuery);

implementation

{$R *.DFM}

{ TQrSegGarLiq }

procedure RepSegGtiaLiq(sF_Cierre ,
                        sProducto , sProd_Grupo ,
                        sMoneda   , sSistema    ,
                        sEmpresa  , sSucursal   ,
                        sNbrArch  :String ;
                        pPreview  : Boolean;
                        pAPli     : TInterApli;
                        sMGposProd  ,
                        sMProductos : String      );
var
    QrSegGarLiq : TQrSegGarLiq;
    VLTitulo    : String;
    Preview     : TIntQRPreview;
begin
    VLTitulo    := '';
    QrSegGarLiq := TQrSegGarLiq.Create(Nil);
    Preview     := TIntQRPreview.CreatePreview(Application, QrSegGarLiq);
    Apli        := pApli;
      Try
        vgFechaHoy  :=  pAPli.DameFechaEmpresa;
        bGenArch    :=  False;
        sArchivo    :=  sNbrArch;
        QrSegGarLiq.QRInterEncabezado1.Apli := pApli;

        //QrSegGarLiq.vgTipCambioDll:= ObtTipoCambio(pAPli.DameFechaEmpresaDia('D000'), IntToStr ( C_DLLS ),pAPli.DataBaseName, pAPli.SessionName);
        QrSegGarLiq.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrSegGarLiq.QRInterEncabezado1.NomReporte:='IntMQrSegGarLiq';
        QrSegGarLiq.QRInterEncabezado1.Titulo1:='Fecha de Reporte : '+ sF_Cierre;
        {
        If (Trim(sProducto)<>'') Then
            VLTitulo := VLTitulo + ' Por Producto :' + sProducto ;
        If (Trim(sProd_Grupo)<>'') Then
            VLTitulo := VLTitulo + ' Por Grupo de Producto :' + sProd_Grupo ;
        }
        If (Trim(sMProductos)<>'') Then
            VLTitulo := VLTitulo + ' Por Productos : (Selección Multiple)'; // + sMProductos ;
        If (Trim(sMGposProd)<>'') Then
            VLTitulo := VLTitulo + ' Por Grupos de Producto : (Selección Multiple)';// + sMGposProd ;

        If (Trim(sMoneda)<>'') Then
            VLTitulo := VLTitulo + ' Por Moneda :' + sMoneda ;
        If (Trim(sSistema)<>'') Then
            VLTitulo := VLTitulo + ' Por Sistema :' + sSistema ;

        QrSegGarLiq.QRInterEncabezado1.Titulo2 := VLTitulo;
        QrSegGarLiq.qySegGarLiq.DatabaseName := pApli.DataBaseName;
        QrSegGarLiq.qySegGarLiq.SessionName  := pApli.SessionName;

        QrSegGarLiq.qySegGarLiq.Active:=False;

        QrSegGarLiq.qySegGarLiq.SQL.Text:= QrSegGarLiq.FormaQuery(sF_Cierre ,
                                           sProducto , sProd_Grupo ,
                                           sMoneda   , sSistema    ,
                                           sEmpresa  , sSucursal,
                                           sMGposProd, sMProductos );

        QrSegGarLiq.qySegGarLiq.SQL.SaveToFile('c:\SQLSegGtiaLiq.txt');
        QrSegGarLiq.qySegGarLiq.Active:=True;

        If Trim(sArchivo)<>'' Then
          EscribeInfoXLS(sF_Cierre,sArchivo,QrSegGarLiq.qySegGarLiq);

        QrSegGarLiq.qySegGarLiq.First;

        If pPreview Then
            QrSegGarLiq.Preview
        Else
            QrSegGarLiq.Print;

     Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         //CloseFile(F);
      End;
      QrSegGarLiq.free;
      If Assigned(Preview) Then Preview.Free;
    End;

end;

procedure EscribeInfoXLS(fechaCierre, nomArchivo:String; lQuery:TQuery);
var sFecExc : String;
begin
   vgnRowExcel:=1;
   vgExcelApp := CreateOleObject('Excel.Application');
   vgExcelApp.Workbooks.Add;
   //EscribeEncabezado (fechaCierre);
     sFecExc:=StringReplace(fechaCierre ,'/','',[rfReplaceAll]);
     vgExcelApp.Workbooks[1].WorkSheets[1].Name := 'SegGtiaLiq_'+sFecExc;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A')].Value := 'ID_CREDITO';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('B')].Value := 'NOM_ACREDITADO';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('C')].Value := 'NOM_TITULAR';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('D')].Value := 'ID_CONTRATO_DV';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('E')].Value := 'CVE_MONEDA_DV';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('F')].Value := 'DESC_MONEDA_DV';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('G')].Value := 'CVE_ORIGEN';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('H')].Value := 'IMP_BLOQ';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('I')].Value := 'CVE_PRODUCTO_CRE';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('J')].Value := 'SDO_DISP_CHEQ';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('K')].Value := 'IMP_DISPUESTO';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('L')].Value := 'F_INICIO_CRE';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('M')].Value := 'F_VENCIMIENTO_CRE';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('N')].Value := 'SDO_INSOLUTO';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('O')].Value := 'Clave Operativa';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('P')].Value := 'Proporción del Crédito';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Q')].Value := 'Saldo a Garantizar SI';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('R')].Value := 'Saldo a Garantizar Disp';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('S')].Value := 'Variación SI';
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('T')].Value := 'Variación Inicial';


     lQuery.First;

   while not(lQuery.Eof) do
   begin
     Inc(vgnRowExcel);
     //EscribeRegistro;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A')].Value := lQuery.FieldByName('ID_CREDITO').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('B')].Value := lQuery.FieldByName('NOM_ACREDITADO').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('C')].Value := lQuery.FieldByName('NOM_TITULAR').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('D')].Value := lQuery.FieldByName('ID_CONTRATO_DV').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('E')].Value := lQuery.FieldByName('CVE_MONEDA_DV').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('F')].Value := lQuery.FieldByName('DESC_MONEDA_DV').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('G')].Value := lQuery.FieldByName('CVE_ORIGEN').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('H')].Value := lQuery.FieldByName('IMP_BLOQ').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('I')].Value := lQuery.FieldByName('CVE_PRODUCTO_CRE').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('J')].Value := lQuery.FieldByName('SDO_DISP_CHEQ').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('K')].Value := lQuery.FieldByName('IMP_DISPUESTO').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('L')].Value := lQuery.FieldByName('F_INICIO_CRE').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('M')].Value := lQuery.FieldByName('F_VENCIMIENTO_CRE').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('N')].Value := lQuery.FieldByName('SDO_INSOLUTO').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('O')].Value := lQuery.FieldByName('CVE_OPERATIVA').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('P')].Value := lQuery.FieldByName('PROPORCION').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('Q')].Value := lQuery.FieldByName('SDO_GAR_SI').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('R')].Value := lQuery.FieldByName('SDO_GAR_DISP').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('S')].Value := lQuery.FieldByName('VARIACN_SI').AsString;
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('T')].Value := lQuery.FieldByName('VARIACN_INI').AsString;


     lQuery.Next;
   end;

   //Guarda archivo
   Inc(vgnRowExcel);
   vgnRowExcel:=vgnRowExcel+2;
   vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A' )].Value := 'Se generaron : ' + IntToStr(vgnRowExcel-4) +  ' registros';

   vgExcelApp.ActiveWorkBook.SaveAs(nomArchivo);
   CloseExcelFile(vgExcelApp);
end;

function TQrSegGarLiq.FormaQuery(sF_Cierre, sProducto, sProd_Grupo,
  sMoneda, sSistema, sEmpresa, sSucursal, sMGposProd, sMProductos: String): String;
Var
    sSQL         : String;
    sSQL1        : String;
    sSQL2        : String;
    sSQL3        : String;
    sSQL4        : String;
    sSQL5        : String;
    sSQL6        : String;
begin
//
  sSQL:=
  ' SELECT '+ coCRLF +
  '   BASE.ID_CREDITO, BASE.NOM_ACREDITADO, BASE.NOM_TITULAR, BASE.ID_CONTRATO, BASE.ID_CONTRATO_DV, '+ coCRLF +
  '   BASE.CVE_MONEDA_DV, BASE.DESC_MONEDA_DV, BASE.CVE_ORIGEN, BASE.IMP_BLOQ,  CCAC.CVE_PRODUCTO_CRE, '+ coCRLF +
  '   BASE.CVE_PRODUCTO_CRE AS CVE_PRODUCTO, BASE.DESC_C_PRODUCTO, BASE.CVE_PRODUCTO_GPO ,DVC.SDO_DISP_CHEQ, '+ coCRLF +
  '   NVL(CICRE.IMP_DISPUESTO, CCRED.IMP_DISPUESTO ) AS IMP_DISPUESTO, '+ coCRLF +
  '   NVL(CICRE.F_INICIO, CCRED.F_VALOR_CRED		) AS F_INICIO_CRE, '+ coCRLF +
  '   NVL(CICRE.F_VENCIMIENTO, CCRED.F_VENCIMIENTO ) AS F_VENCIMIENTO_CRE, '+ coCRLF +
  '   NVL(CICRE.SDO_VIG_TOTAL, CCRED.SDO_INSOLUTO  ) AS SDO_INSOLUTO, '+ coCRLF +
  '   NVL(CGFC.PCT_GTIA_LIQ,0) AS PROPORCION, '+ coCRLF +
  '   NVL(CGFC.ID_CONTRATO,0) AS ID_CONT_CGFC, '+ coCRLF +
  '   NVL(CGFC.CVE_OPERATIVA, ''NULA'') AS CVE_OPERATIVA, '+ coCRLF +
  '   DECODE( BASE.CVE_ORIGEN,''CRED'',0, DECODE ( NVL(CGFC.PCT_GTIA_LIQ,0) , 0, 0 , (                  (NVL(CGFC.PCT_GTIA_LIQ,0)/100) * NVL(CICRE.SDO_VIG_TOTAL,CCRED.SDO_INSOLUTO)  ) ) ) AS SDO_GAR_SI  , '+ coCRLF +
  '   DECODE( BASE.CVE_ORIGEN,''CRED'',0, DECODE ( NVL(CGFC.PCT_GTIA_LIQ,0) , 0, 0 , (                  (NVL(CGFC.PCT_GTIA_LIQ,0)/100) * NVL(CICRE.IMP_DISPUESTO,CCRED.IMP_DISPUESTO) ) ) ) AS SDO_GAR_DISP, '+ coCRLF +
  '   DECODE( BASE.CVE_ORIGEN,''CRED'',0, DECODE ( NVL(CGFC.PCT_GTIA_LIQ,0) , 0, 0 , ( BASE.IMP_BLOQ - ((NVL(CGFC.PCT_GTIA_LIQ,0)/100) * NVL(CICRE.SDO_VIG_TOTAL,CCRED.SDO_INSOLUTO)) ) ) ) AS VARIACN_SI  , '+ coCRLF +
  '   DECODE( BASE.CVE_ORIGEN,''CRED'',0, DECODE ( NVL(CGFC.PCT_GTIA_LIQ,0) , 0, 0 , ( BASE.IMP_BLOQ - ((NVL(CGFC.PCT_GTIA_LIQ,0)/100) * NVL(CICRE.IMP_DISPUESTO,CCRED.IMP_DISPUESTO))) ) ) AS VARIACN_INI   '+ coCRLF +
  ' FROM ( '+ coCRLF +
  '        SELECT R.ID_CREDITO, R.NOM_ACREDITADO, R.NOM_TITULAR, R.ID_CONTRATO, R.ID_CONTRATO_DV, R.CVE_PRODUCTO_CRE, R.DESC_C_PRODUCTO, '+ coCRLF +
  '               R.CVE_PRODUCTO_GPO, R.CVE_MONEDA_DV, R.DESC_MONEDA_DV, R.CVE_ORIGEN, SUM(R.IMP_SALDO) AS IMP_BLOQ   '+ coCRLF +
  '        FROM ( '+ coCRLF +
  '               SELECT '+ coCRLF +
  '                 CTO.ID_TITULAR AS ID_ACREDITADO,  P.NOMBRE AS NOM_ACREDITADO, PDV.NOMBRE AS NOM_TITULAR, '+ coCRLF +
  '                 CTO.CVE_MONEDA    , CTODV.CVE_MONEDA AS CVE_MONEDA_DV, M.DESC_MONEDA, MDV.DESC_MONEDA AS DESC_MONEDA_DV, '+ coCRLF +
  '                 TEMP.CVE_ORIGEN   , TEMP.CVE_PRODUCTO_GPO , TEMP.CVE_PRODUCTO_CRE  , TEMP.DESC_C_PRODUCTO , TEMP.ID_CONTRATO       , '+ coCRLF +
  '                 TEMP.ID_CREDITO   , TEMP.SIT_CREDITO      , TEMP.F_INICIO          , TEMP.F_VENCIMIENTO   , TEMP.ID_BLQ_TRANSAC    , '+ coCRLF +
  '                 TEMP.CVE_BLQ_CPTO , TEMP.CVE_BLQ_OPERACION, TEMP.ID_CONTRATO_DV    , TEMP.IMP_SALDO       , TEMP.FH_ACTIVACION     , ' + coCRLF +
  '                 TEMP.CVE_USU_ACTIVACION, TEMP.DESC_BLQ_CPTO, TEMP.TIPO_AFECTACION  , ' + coCRLF +
  '                 DECODE(TEMP.TIPO_AFECTACION, ''I'', ''Bloqueados'', ''Desbloqueados'') AS DESC_AFECTACION, ''F'' AS B_RESUMEN '+ coCRLF +
  '               FROM ( '+ coCRLF ;
                    // -------------------------------------------------------------------------------------
                    // -- INICIO DE LA UNION
                    // -------------------------------------------------------------------------------------
					// -- Obtiene las diposiciones que están en ICRE --
  sSQL1 := sSQL;
  sSQL  := '';
  sSQL :=
  '                      SELECT ''ICRE'' AS CVE_ORIGEN, CP.CVE_PRODUCTO_GPO, CO.CVE_PRODUCTO_CRE, CP.DESC_C_PRODUCTO, CO.ID_CONTRATO,        '+ coCRLF +
  '                         CC.ID_CREDITO, CC.SIT_CREDITO, CC.F_INICIO, CC.F_VENCIMIENTO, CBT.ID_BLQ_TRANSAC, CBT.CVE_BLQ_CPTO,              '+ coCRLF +
  '                         CBT.CVE_BLQ_OPERACION, CBT.ID_CONTRATO_DV, (CBT.IMP_SALDO * DECODE(CBT.TIPO_AFECTACION,''I'',1,-1)) AS IMP_SALDO,'+ coCRLF +
  '                         CBT.FH_ACTIVACION, CBT.CVE_USU_ACTIVACION, CBT.DESC_BLQ_CPTO, CBT.TIPO_AFECTACION '+ coCRLF +
  '                      FROM (  SELECT CBT.*, CBO.TIPO_AFECTACION, CBC.DESC_BLQ_CPTO '+ coCRLF +
  '                              FROM CR_BLQ_TRANSAC CBT, '+ coCRLF +
  '                                   CR_BLQ_OPERACION CBO, '+ coCRLF +
  '                                   CR_BLQ_CONCEPTO CBC '+ coCRLF +
  '                              WHERE CBO.CVE_BLQ_OPERACION = CBT.CVE_BLQ_OPERACION '+ coCRLF +
  '                                AND CBT.SIT_TRANS_BLOQ NOT IN (''PA'',''ER'') '+ coCRLF + //-- Se muestran las transacciones procesadas
  '                                AND CBC.CVE_BLQ_CPTO = CBT.CVE_BLQ_CPTO '+ coCRLF +
  '                                AND CBC.CVE_BLQ_CPTO NOT IN (''BLOTRO'',''BLSEGU'',''BLPREI'',''BLCOBR'',''BLSVID'',''SUSTGT'') '+ coCRLF +
  '                           ) CBT, '+ coCRLF +
  '                           CR_CREDITO CC, '+ coCRLF +
  '                           CR_CONTRATO CO, '+ coCRLF +
  '                           CR_PRODUCTO CP '+ coCRLF +
  '                      WHERE 1 = 1 '+ coCRLF +
  '                        AND CC.ID_CREDITO = CBT.ID_CREDITO '+ coCRLF +
  '                        AND CO.ID_CONTRATO = CC.ID_CONTRATO '+ coCRLF +
  '                        AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE '+ coCRLF +  coCRLF;

  sSQL2 := sSQL;
  sSQL  := '';
                    //  -- Obtiene las diposiciones que están en INTERCRÉDITOS
  sSQL  :=
  '                    UNION '+ coCRLF +  coCRLF +
  '                      SELECT ''CRED'' AS CVE_ORIGEN, TO_CHAR(CO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_GPO, ' + coCRLF +
  '                          TO_CHAR(CO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO_CRE, TO_CHAR(CO.CVE_SUB_TIP_BCO) AS DESC_C_PRODUCTO, ' + coCRLF +
  '                          CO.ID_CONTRATO, CC.ID_CREDITO, CC.SIT_CREDITO, CC.F_VALOR_CRED AS F_INICIO, '+ coCRLF +
  '                          (CC.F_VALOR_CRED + CC.DIAS_PLAZO) F_VENCIMIENTO, CBT.ID_BLQ_TRANSAC, CBT.CVE_BLQ_CPTO, CBT.CVE_BLQ_OPERACION, CBT.ID_CONTRATO_DV, '+ coCRLF +
  '                         (CBT.IMP_SALDO * DECODE(CBT.TIPO_AFECTACION, ''I'', 1, -1)) AS IMP_SALDO, CBT.FH_ACTIVACION, CBT.CVE_USU_ACTIVACION, CBT.DESC_BLQ_CPTO, CBT.TIPO_AFECTACION '+ coCRLF +
  '                      FROM ( ' + coCRLF +
  '                             SELECT CBT.*, CBO.TIPO_AFECTACION, CBC.DESC_BLQ_CPTO '+ coCRLF +
  '                             FROM CR_BLQ_TRANSAC CBT, '+ coCRLF +
  '                               CR_BLQ_OPERACION CBO, '+ coCRLF +
  '                               CR_BLQ_CONCEPTO CBC '+ coCRLF +
  '                             WHERE CBO.CVE_BLQ_OPERACION = CBT.CVE_BLQ_OPERACION '+ coCRLF +
  '                               AND CBT.SIT_TRANS_BLOQ NOT IN (''PA'',''ER'') '+ coCRLF +   //-- Se muestran las transacciones procesadas
  '                               AND CBC.CVE_BLQ_CPTO = CBT.CVE_BLQ_CPTO '+ coCRLF +
  '                               AND CBC.CVE_BLQ_CPTO NOT IN (''BLOTRO'',''BLSEGU'',''BLPREI'',''BLCOBR'',''BLSVID'',''SUSTGT'') '+ coCRLF +
  '                           ) CBT, '+ coCRLF +
  '                           CRE_CREDITO CC, '+ coCRLF +
  '                           CRE_CONTRATO CO '+ coCRLF +
  '                      WHERE 1 = 1 '+ coCRLF +
  '                        AND CC.ID_CREDITO = CBT.ID_CREDITO '+ coCRLF +
  '                        AND CO.ID_CONTRATO = CC.ID_CONTRATO '+ coCRLF +
					    //		-------------------------------------------------------------------------------------
						//		-- FIN DE LA UINION
						//		-------------------------------------------------------------------------------------
  '                    ) TEMP,  '+ coCRLF +
  '                      CONTRATO CTO,  '+ coCRLF +
  '                      PERSONA P,  '+ coCRLF +
  '                      CONTRATO CTODV,  '+ coCRLF +
  '                      PERSONA PDV,  '+ coCRLF +
  '                      MONEDA M, '+ coCRLF +
  '                      MONEDA MDV  '+ coCRLF +  coCRLF +
  //
  '               WHERE CTO.ID_CONTRATO   = TEMP.ID_CONTRATO '+ coCRLF +
  '                 AND P.ID_PERSONA      = CTO.ID_TITULAR '+ coCRLF +
  '                 AND CTODV.ID_CONTRATO = TEMP.ID_CONTRATO_DV '+ coCRLF +
  '                 AND PDV.ID_PERSONA    = CTODV.ID_TITULAR '+ coCRLF +
  '                 AND M.CVE_MONEDA      = CTO.CVE_MONEDA '+ coCRLF +
  '                 AND MDV.CVE_MONEDA    = CTODV.CVE_MONEDA '+ coCRLF +  coCRLF +  coCRLF ;

  sSQL3 := sSQL;
  sSQL  := '';
  sSQL  :=
  '            UNION ALL ' + coCRLF +  coCRLF +
  //
  '               SELECT 0 AS ID_ACREDITADO,  '' '' AS NOM_ACREDITADO, PDV.NOMBRE AS NOM_TITULAR, ' + coCRLF +
  '                  0 AS CVE_MONEDA, CTODV.CVE_MONEDA AS CVE_MONEDA_DV,  '' '' AS DESC_MONEDA, MDV.DESC_MONEDA AS DESC_MONEDA_DV, ' + coCRLF +
  '                  '' '' AS CVE_ORIGEN,  '' '' AS CVE_PRODUCTO_GPO, '' '' AS CVE_PRODUCTO_CRE, '' '' AS  DESC_C_PRODUCTO,' + coCRLF +
  '                  0 AS ID_CONTRATO, 0 AS ID_CREDITO,  '' '' AS SIT_CREDITO, ' + coCRLF +
  '                  TO_DATE(''01/01/1980'',''DD/MM/YYYY'') AS F_INICIO, TO_DATE(''01/01/1980'',''DD/MM/YYYY'') AS F_VENCIMIENTO, ' + coCRLF +
  '                  0 AS ID_BLQ_TRANSAC, CBSC.CVE_BLQ_CPTO,  '' '' AS CVE_BLQ_OPERACION, CBSC.ID_CONTRATO_DV, ' + coCRLF +
  '                  CBSC.IMP_SDO_BLOQUEO AS IMP_SALDO, TO_DATE(''01/01/1980'',''DD/MM/YYYY'') AS FH_ACTIVACION, '' '' AS CVE_USU_ACTIVACION,' + coCRLF +
  '                  CBC.DESC_BLQ_CPTO,  ''D'' AS TIPO_AFECTACION,  '' '' AS DESC_AFECTACION,  ''V'' AS B_RESUMEN ' + coCRLF +
  '               FROM ( SELECT CBT.ID_CONTRATO_DV ' + coCRLF +
  '                      FROM CR_BLQ_TRANSAC CBT, ' + coCRLF +
  '                         CR_BLQ_OPERACION CBO, ' + coCRLF +
  '                         CR_BLQ_CONCEPTO CBC, ' + coCRLF +
  '                         CONTRATO CTO ' + coCRLF +
  '                      WHERE CBO.CVE_BLQ_OPERACION = CBT.CVE_BLQ_OPERACION ' + coCRLF +
  '                        AND CBT.SIT_TRANS_BLOQ NOT IN (''PA'',''ER'') ' + coCRLF + //-- Se muestran las transacciones procesadas
  '                        AND CBC.CVE_BLQ_CPTO = CBT.CVE_BLQ_CPTO ' + coCRLF +
  '                        AND CTO.ID_CONTRATO = CBT.ID_CONTRATO ' + coCRLF +
  '                        AND CBC.CVE_BLQ_CPTO NOT IN (''BLOTRO'',''BLSEGU'',''BLPREI'',''BLCOBR'',''BLSVID'',''SUSTGT'') ' + coCRLF +
  '                      GROUP BY CBT.ID_CONTRATO_DV ' + coCRLF +
  '                    ) CTO_DV_MOSTRAR, ' + coCRLF +
  '                    ( SELECT CBSC.ID_CONTRATO_DV, CBSC.CVE_BLQ_CPTO, SUM(CBSC.IMP_SDO_BLOQUEO) AS IMP_SDO_BLOQUEO ' + coCRLF +
  '                      FROM CR_BLQ_SDO_CHEQ CBSC ' + coCRLF +
  '                      WHERE 1 = 1 ' + coCRLF +
  '                      GROUP BY CBSC.ID_CONTRATO_DV, CBSC.CVE_BLQ_CPTO ' + coCRLF +
  '                    ) CBSC, ' + coCRLF +
  '                      CR_BLQ_CONCEPTO CBC, ' + coCRLF +
  '                      CONTRATO CTODV, ' + coCRLF +
  '                      PERSONA PDV, ' + coCRLF +
  '                      MONEDA MDV ' + coCRLF +
  '               WHERE CTODV.ID_CONTRATO = CBSC.ID_CONTRATO_DV ' + coCRLF +
  '                 AND CTO_DV_MOSTRAR.ID_CONTRATO_DV = CBSC.ID_CONTRATO_DV ' + coCRLF +
  '                 AND PDV.ID_PERSONA = CTODV.ID_TITULAR ' + coCRLF +
  '                 AND CBC.CVE_BLQ_CPTO = CBSC.CVE_BLQ_CPTO ' + coCRLF +
  '                 AND MDV.CVE_MONEDA = CTODV.CVE_MONEDA ' + coCRLF +
  '                 AND CBC.CVE_BLQ_CPTO NOT IN (''BLOTRO'',''BLSEGU'',''BLPREI'',''BLCOBR'',''BLSVID'',''SUSTGT'') ' + coCRLF +
  '             ) R ' + coCRLF +coCRLF +
  //
  '        WHERE 1 = 1 ' + coCRLF +
  '          AND R.ID_ACREDITADO NOT IN (0) ' + coCRLF +
  '        GROUP BY  R.ID_CREDITO, R.NOM_ACREDITADO,R.NOM_TITULAR,R.ID_CONTRATO, R.ID_CONTRATO_DV, R.CVE_PRODUCTO_CRE, R.DESC_C_PRODUCTO, ' + coCRLF +
  '                  R.CVE_PRODUCTO_GPO, R.CVE_MONEDA_DV, R.DESC_MONEDA_DV, R.CVE_ORIGEN ' + coCRLF +
  '      )BASE, ' + coCRLF ;

  sSQL4 := sSQL;
  sSQL  := '';
  sSQL  :=
  '      (SELECT ''ICRE'' AS SISTEMA, CCI.ID_CREDITO, CCI.IMP_DISPUESTO, CCI.F_INICIO    , CCI.F_VENCIMIENTO, CCI.SDO_VIG_TOTAL, CCI.ID_CONTRATO, CCI.CVE_OPERATIVA  FROM CR_CREDITO CCI) CICRE, ' + coCRLF +
  '      (SELECT ''CRED'' AS SISTEMA, CCN.ID_CREDITO, CCN.IMP_DISPUESTO, CCN.F_VALOR_CRED, (CCN.F_VALOR_CRED +  CCN.DIAS_PLAZO) AS F_VENCIMIENTO, CCN.SDO_INSOLUTO   FROM CRE_CREDITO CCN) CCRED, ' + coCRLF +
  '      (SELECT ID_CONTRATO, ' + coCRLF +
  '          + SDO_EFE_VIRT	  ' + coCRLF + //--EFECTIVO
  '          - SDO_DEUD_VIRT  ' + coCRLF + //--DEUDOR
  '          - SDO_BLOQ_VIRT  ' + coCRLF + //--BLOQUEADO
  '          - SDO_COMP_VIRT  ' + coCRLF + //--COMPROMETIDO
  '          + SDO_SBC_VIRT	  ' + coCRLF +  //--SBC
  '          + SDO_SOBGIRO_VIRT ' + coCRLF + //--SOBREGIRO
  '          - PKGSICIERRE.OBTSALDOMAESTRO(ID_CONTRATO) AS SDO_DISP_CHEQ ' + coCRLF +
  '       FROM DV_CONTRATO) DVC, ' + coCRLF +
  // Consideración del parámetro de fecha de cierre.
  '      (SELECT ID_CREDITO FROM CR_CON_ADEUDO_SDO WHERE F_CIERRE = TO_DATE('''+ sF_Cierre +''',''DD/MM/YYYY'')) CCAS, ' + coCRLF +
  '      (SELECT ID_CREDITO, CVE_PRODUCTO_CRE  FROM CR_CON_ADEU_CLTV WHERE ID_REG_VIGENTE = 1 ) CCAC, ' + coCRLF +
          //-- Para obtener la Proporcion
  '      (SELECT DISTINCT  ID_CONTRATO, CVE_OPERATIVA, SIT_GA_FIRA,  PCT_GTIA_LIQ FROM CR_GA_FIRA_CTO WHERE SIT_GA_FIRA = ''AC'' ) CGFC ' + coCRLF +
  ' WHERE 1 = 1 ' + coCRLF +
  '   AND CICRE.ID_CREDITO  (+)= BASE.ID_CREDITO   AND CICRE.SISTEMA  (+)= BASE.CVE_ORIGEN ' + coCRLF +
  '   AND CCRED.ID_CREDITO  (+)= BASE.ID_CREDITO   AND CCRED.SISTEMA  (+)= BASE.CVE_ORIGEN ' + coCRLF +
  '   AND DVC.ID_CONTRATO      = BASE.ID_CONTRATO_DV ' + coCRLF +
  '   AND CCAS.ID_CREDITO      = BASE.ID_CREDITO     ' + coCRLF +
  '   AND CCAC.ID_CREDITO   (+)= BASE.ID_CREDITO     ' + coCRLF +
  '   AND CGFC.ID_CONTRATO  (+)= CICRE.ID_CONTRATO AND CGFC.CVE_OPERATIVA (+)= CICRE.CVE_OPERATIVA ' + coCRLF ;
  sSQL5 := sSQL;
  sSQL  := '';
  {
  //-- AND  BASE.CVE_PRODUCTO_CRE = '035AGR'
  If (Trim(sProducto)<>'') Then
   sSQL:= sSQL +
   '   AND BASE.CVE_PRODUCTO_CRE = '''+ sProducto + '''' + coCRLF ;

  //-- AND BASE.CVE_PRODUCTO_GPO = 'CBINTE'
  If (Trim(sProd_Grupo)<>'') Then
   sSQL:= sSQL +
   '   AND BASE.CVE_PRODUCTO_GPO = '''+ sProd_Grupo + '''' + coCRLF ;
   }

   //-- AND  BASE.CVE_PRODUCTO_CRE = '035AGR'
  If (Trim(sMProductos)<>'') Then
   sSQL:= sSQL +
   '   AND BASE.CVE_PRODUCTO_CRE IN ('+ sMProductos + ')' + coCRLF ;

  //-- AND BASE.CVE_PRODUCTO_GPO = 'CBINTE'
  If (Trim(sMGposProd)<>'') Then
   sSQL:= sSQL +
   '   AND BASE.CVE_PRODUCTO_GPO IN ('+ sMGposProd + ')' + coCRLF ;



  //-- AND  BASE.CVE_MONEDA_DV = 484
  If (Trim(sMoneda)<>'') Then
   sSQL:= sSQL +
   '   AND BASE.CVE_MONEDA_DV = '+ sMoneda +  coCRLF ;

  //-- AND BASE.CVE_ORIGEN = 'ICRE'|'CRED'
  If (Trim(sSistema)<>'') Then
   sSQL:= sSQL +
   '   AND BASE.CVE_ORIGEN = '''+ sSistema + '''' + coCRLF ;

   sSQL:= sSQL +
   ' ORDER BY BASE.CVE_MONEDA_DV, BASE.CVE_PRODUCTO_CRE, BASE.NOM_ACREDITADO, BASE.ID_CREDITO, BASE.NOM_TITULAR, BASE.ID_CONTRATO_DV ' + coCRLF ;

   sSQL6 := sSQL;
   sSQL  := '';

// Para armar la sentencia SQL para la impresión del reporte
   Result:= sSQL1 + sSQL2 + sSQL3 + sSQL4 + sSQL5 + sSQL6;

end;


end.
