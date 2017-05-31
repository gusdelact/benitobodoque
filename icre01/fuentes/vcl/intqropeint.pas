unit IntQrOpeInt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IntHead, UnSQL2,
  InterApl,Dialogs,
  IntQRPreview,
  Db, DBTables,
  IntGenCre,
  ComObj,
  IntXls;

type
  TQROperativoIntereses = class(TQuickRep)
    QRBand1: TQRBand;
    qOpeInteres: TQuery;
    QRInterEncabezado1: TQRInterEncabezado;
    DetailBand1: TQRBand;
    dbCveProd: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand2: TQRBand;
    qrCveProducto: TQRLabel;
    qrCartera: TQRLabel;
    qrIdCredito: TQRLabel;
    qrIdAcreditado: TQRLabel;
    qrAcreditado: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape19: TQRShape;
    QRDBText17: TQRDBText;
    QRLabel12: TQRLabel;
    QRShape20: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRShape21: TQRShape;
    QRLabel14: TQRLabel;
    QRShape22: TQRShape;
    QRLabel15: TQRLabel;
    QRShape24: TQRShape;
    QRLabel17: TQRLabel;
    QRShape25: TQRShape;
    QRLabel18: TQRLabel;
    QRDBText24: TQRDBText;
    QRShape26: TQRShape;
    QRLabel19: TQRLabel;
    qlGrupo: TQRLabel;
    qdbEncabezadoGrupo: TQRDBText;
    qrPiedeGrupoProducto: TQRBand;
    QRExpr1: TQRExpr;
    qdbPieGrupo: TQRDBText;
    qlMoneda: TQRLabel;
    qdbDesMoneda: TQRDBText;
    qrPiedeGrupoMoneda: TQRBand;
    qrGrupoMoneda: TQRGroup;
    QRExpr2: TQRExpr;
    QRLabel22: TQRLabel;
    QRDBText28: TQRDBText;
    QRShpTipoCuenta: TQRShape;
    qdbCveMoneda: TQRDBText;
    QRDBText30: TQRDBText;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel23: TQRLabel;
    QRShape29: TQRShape;
    QRLabel24: TQRLabel;
    QRShape30: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape31: TQRShape;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText12: TQRDBText;
    qrGrupoProductoS: TQRGroup;
    QRLabel20: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRShape3: TQRShape;
    QRExpr4: TQRExpr;
    QRExpr18: TQRExpr;
    qOpeInteresCVE_PRODUCTO_CRE: TStringField;
    qOpeInteresDESC_C_PRODUCTO: TStringField;
    qOpeInteresCVE_PRESUPUESTO: TStringField;
    qOpeInteresDESC_PRESUPUESTO: TStringField;
    qOpeInteresCVE_MONEDA: TFloatField;
    qOpeInteresDESC_MONEDA: TStringField;
    qOpeInteresID_CREDITO: TFloatField;
    qOpeInteresID_TITULAR: TFloatField;
    qOpeInteresCTE: TStringField;
    qOpeInteresF_INICIO: TDateTimeField;
    qOpeInteresF_VENCIMIENTO: TDateTimeField;
    qOpeInteresULT_F_CIERRE: TDateTimeField;
    qOpeInteresF_TRASPASO_VENC: TDateTimeField;
    qOpeInteresSITUACION: TStringField;
    qOpeInteresIMP_INTERES_DIA: TFloatField;
    qOpeInteresIMP_INTERES_RES: TFloatField;
    qOpeInteresIMP_INT_COB: TFloatField;
    qOpeInteresIMP_MORAS: TFloatField;
    qOpeInteresIMP_ICXA: TFloatField;
    qOpeInteresIMP_COB_MOR: TFloatField;
    qOpeInteresIMP_INT_CASTIGO: TFloatField;
    qOpeInteresIMP_MORA_CONDONA: TFloatField;
    qOpeInteresACUM_INT_DIA: TFloatField;
    qOpeInteresACUM_INT_RES: TFloatField;
    qOpeInteresACUM_INT_COB: TFloatField;
    qOpeInteresACUM_ICXA: TFloatField;
    qOpeInteresICXA_SDO: TFloatField;
    qOpeInteresACUM_MORAS: TFloatField;
    qOpeInteresACUM_COB_MOR: TFloatField;
    qOpeInteresACUM_INT_CASTIGO: TFloatField;
    qOpeInteresACUM_MORA_CONDONA: TFloatField;
    qOpeInteresIMP_INTERES_CO: TFloatField;
    qOpeInteresACUM_INT_CO: TFloatField;
    procedure qrGrupoMonedaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrGrupoProductoSAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrPiedeGrupoProductoAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrPiedeGrupoProductoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrPiedeGrupoMonedaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    vgBGeneraArchivo : Boolean;
    vgArchivoExcel : String;
    vgBPintaTotalProd : Boolean;
    vgTipoSubtotal : Integer;
    vgTitReporte : String;
    vgExcelApp : OleVariant;
    vgNumRow   : Integer;
    vgRowIni   : Integer;
    vgRowFin   : Integer;
    vgStrList  : TStringList;

    procedure IniciaArchivoExcel(peFileName : String);
    function  Cierra_Y_Guarda_ArchivoExcel : Boolean;
    procedure AgregaSaldosArchivoExcel(peCVE_SECTOR,
                                       peDESC_SECTOR,
                                       peID_OLTP_PRODUCTO_or_peCVE_CTA_CONTABLE,
                                       peDESC_OLTP_PRODUCTO : String;
                                       peIMP_SDO_COINCRE,
                                       peIMP_SDO_CONTABLE : Double
                                       );
    procedure ColocaFormulas;
  public
       Apli : TInterApli;
       Function ArmaQuery(peFe_Ini, peFe_Fin : TDateTime; peqBFechaValor :Boolean;
                          peqCveMoneda, peqCliente, peqCredito, peqTipoSubtot:Integer;
                          peqProducto:String): String;
  end;

var
  QROperativoIntereses: TQROperativoIntereses;

Procedure RepOperativoIntereses(peFeIniRango, peFeFinRango: TDateTime;
                                peCveMoneda : Integer;
                                peCliente : Integer;
                                peProducto: String;
                                peCredito : Integer;
                                peTipoSubtot : Integer;
                                peBFechaValor :Boolean;
                                pAPli     : TInterApli;
                                pPreview  : Boolean;
                                peStrArchivoXLS : String
                                );
implementation

{$R *.DFM}

Procedure RepOperativoIntereses(peFeIniRango, peFeFinRango: TDateTime;
                                peCveMoneda : Integer;
                                peCliente : Integer;
                                peProducto: String;
                                peCredito : Integer;
                                peTipoSubtot : Integer;
                                peBFechaValor :Boolean;
                                pAPli     : TInterApli;
                                pPreview  : Boolean;
                                peStrArchivoXLS : String
                                );
Var
   QROperativoIntereses: TQROperativoIntereses;
   Preview     : TIntQRPreview;
   vlLista     : TStringList;
   vlstrQRY    : String;
   vlQry       : TQuery;
   vlFecha     : TDateTime;
Begin
  QROperativoIntereses := TQROperativoIntereses.Create(Nil);
  Preview := TIntQRPreview.CreatePreview(Application, QROperativoIntereses);
  vlLista := TStringList.Create;
  vlQry   := TQuery.Create(Nil);
  QROperativoIntereses.vgBGeneraArchivo := (ExtractFileName(Trim(peStrArchivoXLS)) <> '');
  QROperativoIntereses.vgArchivoExcel   := peStrArchivoXLS;
  vlFecha := pAPli.DameFechaEmpresa;
  Try
     QROperativoIntereses.Apli := pApli;
     QROperativoIntereses.QRInterEncabezado1.Apli:=pApli;
     QROperativoIntereses.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
     QROperativoIntereses.QRInterEncabezado1.NomReporte:='IntQrOpeInt';
     If peFeIniRango = peFeFinRango then
     begin
        QROperativoIntereses.QRInterEncabezado1.Titulo2 := 'Fecha : ' + DateToStr(peFeFinRango) + '  (Cifras en moneda de origen)';
        QROperativoIntereses.vgTitReporte := 'Fecha : ' + DateToStr(peFeFinRango);
     end
     else
     begin
        QROperativoIntereses.QRInterEncabezado1.Titulo2 := 'Periodo del ' + DateToStr(peFeIniRango) +  ' al ' + DateToStr(peFeFinRango) + '  (Cifras en moneda de origen)';
        QROperativoIntereses.vgTitReporte := 'Periodo del ' + DateToStr(peFeIniRango) +  ' al ' + DateToStr(peFeFinRango);
     end;
     QROperativoIntereses.qOpeInteres.Active := False;
     QROperativoIntereses.qOpeInteres.DatabaseName := pAPli.DataBaseName;
     QROperativoIntereses.qOpeInteres.SessionName := pAPli.SessionName;

     vlstrQRY := QROperativoIntereses.ArmaQuery(peFeIniRango, peFeFinRango,
                          peBFechaValor, peCveMoneda, peCliente, peCredito,
                          peTipoSubtot, peProducto);
     QROperativoIntereses.qOpeInteres.SQL.Clear;
     QROperativoIntereses.qOpeInteres.SQL.Add(vlstrQRY);
     QROperativoIntereses.qOpeInteres.SQL.SaveToFile('c:\qOpeInteres.sql');
     QROperativoIntereses.qOpeInteres.Active := True;

     QROperativoIntereses.vgTipoSubtotal := peTipoSubtot;
     If peTipoSubtot = 0 then
     begin
       QROperativoIntereses.qrGrupoProductoS.Expression := 'qOpeInteres.CVE_PRODUCTO_CRE';
       QROperativoIntereses.qlGrupo.Caption := 'Producto : ';
       QROperativoIntereses.qdbEncabezadoGrupo.DataField := 'DESC_C_PRODUCTO';
       QROperativoIntereses.qdbPieGrupo.DataField := 'DESC_C_PRODUCTO';
     end
     else
       if peTipoSubtot = 1 then
       begin
         QROperativoIntereses.qrGrupoProductoS.Expression := 'qOpeInteres.SITUACION';
         QROperativoIntereses.qlGrupo.Caption := 'Estatus : ';
         QROperativoIntereses.qdbEncabezadoGrupo.DataField := 'SITUACION';
         QROperativoIntereses.qdbPieGrupo.DataField := 'SITUACION';
       end
       else
       begin
         QROperativoIntereses.qrGrupoProductoS.Enabled := False;
         QROperativoIntereses.qrPiedeGrupoProducto.Enabled := False;
       end;

      If (QROperativoIntereses.vgBGeneraArchivo) Then
         QROperativoIntereses.IniciaArchivoExcel(QROperativoIntereses.vgArchivoExcel);


     If pPreview Then
        QROperativoIntereses.Preview
     Else
        QROperativoIntereses.Print;

      If (QROperativoIntereses.vgBGeneraArchivo) Then
         QROperativoIntereses.Cierra_Y_Guarda_ArchivoExcel;

  Finally
     QROperativoIntereses.free;
     If Assigned(Preview) Then Preview.Free;
     vlLista.Free;
     vlQry.Free;
  End;

end;


{ TQROperativoIntereses }

procedure TQROperativoIntereses.AgregaSaldosArchivoExcel(peCVE_SECTOR,
  peDESC_SECTOR, peID_OLTP_PRODUCTO_or_peCVE_CTA_CONTABLE,
  peDESC_OLTP_PRODUCTO: String; peIMP_SDO_COINCRE,
  peIMP_SDO_CONTABLE: Double);
begin

end;

function TQROperativoIntereses.ArmaQuery(peFe_Ini, peFe_Fin: TDateTime;
  peqBFechaValor :Boolean;
  peqCveMoneda, peqCliente, peqCredito, peqTipoSubtot: Integer;
  peqProducto:String): String;
Var
  vlSalida : String;
  vlFe_IniAnio : TDateTime;
  wYear, wMonth, wDay: Word;
begin
  DecodeDate(peFe_Fin, wYear, wMonth, wDay);
  vlFe_IniAnio := StrToDate('01/01/'+IntToStr(Integer(wYear)));

  vlSalida := 'SELECT CRED.CVE_PRODUCTO_CRE, ' + coCRLF +
              '       CRED.DESC_C_PRODUCTO, ' + coCRLF +
              '       CRED.CVE_PRESUPUESTO, ' + coCRLF +
              '	      PRES.DESC_PRESUPUESTO, ' + coCRLF +
              '       CRED.CVE_MONEDA, ' + coCRLF +
              '       MON.DESC_MONEDA, ' + coCRLF +
              '       CRED.ID_CREDITO, ' + coCRLF +
              '       CRED.ID_TITULAR, ' + coCRLF +
              '	      PER.NOMBRE CTE, ' + coCRLF +
              '       CRED.F_INICIO, ' + coCRLF +
              '       CRED.F_VENCIMIENTO, ' + coCRLF +
              '	      FTRAS.ULT_F_CIERRE, ' + coCRLF +
              '       FTRAS.F_TRASPASO_VENC, ' + coCRLF +
              '	      CAST((CASE WHEN CRED.ORIGEN = ''ICRE'' THEN FN_ESTADO_CRED(' + SQLFecha(peFe_Fin) + ',CRED.ID_CREDITO) ' + coCRLF +
              '	                 ELSE (CASE WHEN FTRAS.F_TRASPASO_VENC IS NOT NULL THEN ''VDO'' ' + coCRLF +
              '                        ELSE ''VIG'' END) ' + coCRLF +
              '             END)  AS VARCHAR2(20) ) SITUACION, ' + coCRLF +
              '       -- IMPORTES ' + coCRLF +
              '       P.IMP_INTERES_DIA, ' + coCRLF +
              '       (CASE WHEN FTRAS.F_TRASPASO_VENC IS NULL THEN P.IMP_INTERES_RES + P.IMP_INTERES_CO ELSE P.IMP_INTERES_RES END) IMP_INTERES_RES, ' + coCRLF +
              '       (CASE WHEN FTRAS.F_TRASPASO_VENC IS NULL THEN 0 ELSE P.IMP_INTERES_CO END) IMP_INTERES_CO, ' + coCRLF +
              '       P.IMP_INT_COB, ' + coCRLF +
              '       P.IMP_MORAS, ' + coCRLF +
              '       (SELECT SUM(IMP_NETO) FROM CR_TRANSACCION WHERE ID_CREDITO = CRED.ID_CREDITO AND CVE_OPERACION = ''PAGOII'' AND SIT_TRANSACCION = ''AC'' AND ID_TRANS_CANCELA IS NULL) IMP_ICXA, ' + coCRLF +
              '       P.IMP_COB_MOR, ' + coCRLF +
              '       P.IMP_INT_CASTIGO, ' + coCRLF +
              '       P.IMP_MORA_CONDONA, ' + coCRLF +
              '      -- ACUMULADOS ' + coCRLF +
              '       ACUM.ACUM_INT_DIA, ' + coCRLF +
              '       (CASE WHEN FTRAS.F_TRASPASO_VENC IS NULL THEN ACUM.ACUM_INT_RES + ACUM.ACUM_INT_CO ELSE ACUM.ACUM_INT_RES END) ACUM_INT_RES, ' + coCRLF +
              '       (CASE WHEN FTRAS.F_TRASPASO_VENC IS NULL THEN 0 ELSE ACUM.ACUM_INT_CO END) ACUM_INT_CO, ' + coCRLF +
              '       ACUM.ACUM_INT_COB, ' + coCRLF +
              '       ACUM.ACUM_ICXA, ' + coCRLF +
              '       NVL((SELECT IMP_PRE_DEVENGAR FROM CRE_PROV_DIARIA WHERE ID_CREDITO = CRED.ID_CREDITO AND F_PROVISION = ' + SQLFecha(peFe_Fin) + '),0)ICXA_SDO, ' + coCRLF +
              '       ACUM.ACUM_MORAS, ' + coCRLF +
              '       ACUM.ACUM_COB_MOR, ' + coCRLF +
              '       ACUM.ACUM_INT_CASTIGO, ' + coCRLF +
              '       ACUM.ACUM_MORA_CONDONA ' + coCRLF +
              'FROM ( ' + coCRLF +
              '      SELECT ''ICRE'' AS ORIGEN, ' + coCRLF +
              '             CRCTO.CVE_PRODUCTO_CRE, ' + coCRLF +
              '             PR.DESC_C_PRODUCTO, ' + coCRLF +
              '             PR.CVE_PRESUPUESTO, ' + coCRLF +
              '             CRCTO.CVE_MONEDA, ' + coCRLF +
              '             CRE.ID_CREDITO, ' + coCRLF +
              '             CTO.ID_TITULAR, ' + coCRLF +
              '             CRE.F_INICIO, ' + coCRLF +
              '             CRE.F_VENCIMIENTO ' + coCRLF +
              '      FROM CR_CONTRATO CRCTO, ' + coCRLF +
              '           CONTRATO CTO, ' + coCRLF +
              '           CR_CREDITO CRE, ' + coCRLF +
              '           CR_PRODUCTO PR ' + coCRLF +
              '      WHERE 1=1 ' + coCRLF +
              '        AND CRE.ID_CONTRATO = CTO.ID_CONTRATO ' + coCRLF +
              '        AND CRE.ID_CONTRATO = CRCTO.ID_CONTRATO ' + coCRLF +
              '        AND CRCTO.CVE_PRODUCTO_CRE = PR.CVE_PRODUCTO_CRE ' + coCRLF +
              '        AND SIT_CREDITO <> ''CA'' ' + coCRLF +
              '      -- ' + coCRLF +
              '      UNION ALL ' + coCRLF +
              '      -- ' + coCRLF +
              '      SELECT ''INTER'' AS ORIGEN, ' + coCRLF +
              '             TO_CHAR(CRCTO.CVE_SUB_TIP_BCO) AS CVE_PRODUCTO, ' + coCRLF +
              '             CSTB.DESC_SUB_TIPO, ' + coCRLF +
              '             CRE.CVE_PRESUPUESTO, ' + coCRLF +
              '             CTO.CVE_MONEDA, ' + coCRLF +
              '             CRE.ID_CREDITO, ' + coCRLF +
              '             CTO.ID_TITULAR, ' + coCRLF +
              '             CRE.F_VALOR_CRED, ' + coCRLF +
              '             CRE.F_ULT_CAPITAL ' + coCRLF +
              '      FROM CRE_CREDITO CRE, ' + coCRLF +
              '           CRE_CONTRATO CRCTO, ' + coCRLF +
              '           CRE_SUB_TIP_BCO CSTB, ' + coCRLF +
              '      	 CONTRATO CTO ' + coCRLF +
              '      WHERE 1= 1 ' + coCRLF +
              '        AND CRE.SIT_CREDITO       NOT IN (''CA'', ''TA'') ' + coCRLF +
              '        AND CRCTO.ID_CONTRATO     = CRE.ID_CONTRATO ' + coCRLF +
              '        AND CRCTO.ID_CONTRATO     = CTO.ID_CONTRATO ' + coCRLF +
              '        AND CRCTO.CVE_SUB_TIP_BCO = CSTB.CVE_SUB_TIP_BCO ' + coCRLF +
              '     ) CRED, ' + coCRLF +
              '       -- FECHA TRASPASO PERIODO ' + coCRLF +
              '     (SELECT A.ID_CREDITO, A.ULT_F_CIERRE, B.F_TRASPASO_VENC ' + coCRLF +
              '        FROM ( SELECT ID_CREDITO, MAX(F_CIERRE) ULT_F_CIERRE ' + coCRLF +
              '                 FROM CR_HISTO_INTERES ' + coCRLF +
              '                WHERE F_CIERRE BETWEEN ' + SQLFecha(peFe_Ini) + ' AND ' + SQLFecha(peFe_Fin) + coCRLF +
              '                GROUP BY ID_CREDITO ) A, ' + coCRLF +
              '             ( SELECT ID_CREDITO, F_CIERRE, F_TRASPASO_VENC ' + coCRLF +
              '                 FROM CR_HISTO_INTERES ' + coCRLF +
              '                WHERE F_CIERRE BETWEEN ' + SQLFecha(peFe_Ini) + ' AND ' + SQLFecha(peFe_Fin) + ' ) B ' + coCRLF +
              '       WHERE A.ID_CREDITO = B.ID_CREDITO ' + coCRLF +
              '         AND A.ULT_F_CIERRE = B.F_CIERRE ' + coCRLF +
              '     ) FTRAS, ' + coCRLF +
              '     -- PERIODO ' + coCRLF +
              '     (SELECT HI.ID_CREDITO, ' + coCRLF;
  if peqBFechaValor then
  begin
    vlSalida := vlSalida +
              '             -- IMPORTES CONSIDERANDO FECHA VALOR ' + coCRLF +
              '             SUM(HI.IMP_INTERES_DIA + HI.IMP_INTERES_FV + HI.IMP_AJUSTE_IN) IMP_INTERES_DIA, ' + coCRLF +
              '             SUM(CASE WHEN HI.F_TRASPASO_VENC IS NULL THEN HI.IMP_INTERES_DIA + HI.IMP_INTERES_FV + HI.IMP_AJUSTE_IN ELSE 0 END) IMP_INTERES_RES, ' + coCRLF +
              '             SUM(CASE WHEN HI.F_TRASPASO_VENC IS NOT NULL THEN HI.IMP_INTERES_DIA + HI.IMP_INTERES_FV + HI.IMP_AJUSTE_IN ELSE 0 END) IMP_INTERES_CO, ' + coCRLF +
              '             SUM(HI.IMP_INT_COB_FV) IMP_INT_COB, ' + coCRLF +
              '             SUM((HI.IMP_MOR_CP + HI.IMP_MOR_CP_FV + HI.IMP_MOR_AJ_CP) + (HI.IMP_MOR_FN + HI.IMP_MOR_FN_FV + HI.IMP_MOR_AJ_FN) + (HI.IMP_MOR_CN + HI.IMP_MOR_CN_FV + HI.IMP_MOR_AJ_CN)) IMP_MORAS, ' + coCRLF +
              '             SUM(HI.IMP_ICXA_FV) IMP_ICXA, ' + coCRLF +
              '             SUM(HI.IMP_COB_MCP_FV + HI.IMP_COB_MFN_FV + HI.IMP_COB_MCN_FV) IMP_COB_MOR, ' + coCRLF +
              '             SUM(HI.IMP_INT_CAS_FV) IMP_INT_CASTIGO, ' + coCRLF +
              '             SUM(HI.IMP_MOR_COND_FV) IMP_MORA_CONDONA ' + coCRLF;
  end
  else
  begin
    vlSalida := vlSalida +
              '             -- IMPORTES ' + coCRLF +
              '             SUM(HI.IMP_INTERES_DIA + HI.IMP_AJUSTE_IN) IMP_INTERES_DIA, ' + coCRLF +
              '             SUM(CASE WHEN HI.F_TRASPASO_VENC IS NULL THEN HI.IMP_INTERES_DIA + HI.IMP_AJUSTE_IN ELSE 0 END) IMP_INTERES_RES, ' + coCRLF +
              '             SUM(CASE WHEN HI.F_TRASPASO_VENC IS NOT NULL THEN HI.IMP_INTERES_DIA + HI.IMP_AJUSTE_IN ELSE 0 END) IMP_INTERES_CO, ' + coCRLF +
              '             SUM(HI.IMP_INT_COB) IMP_INT_COB, ' + coCRLF +
              '             SUM((HI.IMP_MOR_CP + HI.IMP_MOR_AJ_CP) + (HI.IMP_MOR_FN + HI.IMP_MOR_AJ_FN) + (HI.IMP_MOR_CN + HI.IMP_MOR_AJ_CN)) IMP_MORAS, ' + coCRLF +
              '             SUM(HI.IMP_ICXA) IMP_ICXA, ' + coCRLF +
              '             SUM(HI.IMP_COB_MCP + HI.IMP_COB_MFN + HI.IMP_COB_MCN) IMP_COB_MOR, ' + coCRLF +
              '             SUM(HI.IMP_INT_CAS) IMP_INT_CASTIGO, ' + coCRLF +
              '             SUM(HI.IMP_MOR_COND) IMP_MORA_CONDONA ' + coCRLF;
  end;
  vlSalida := vlSalida +
              '      FROM CR_HISTO_INTERES HI ' + coCRLF +
              '      WHERE HI.F_CIERRE BETWEEN ' + SQLFecha(peFe_Ini) + ' AND ' + SQLFecha(peFe_Fin) + coCRLF +
              '      GROUP BY HI.ID_CREDITO) P, ' + coCRLF +
              '      -- ACUMULADOS ' + coCRLF +
              '     (SELECT HI.ID_CREDITO, ' + coCRLF;
  if peqBFechaValor then
  begin
    vlSalida := vlSalida +
              '             -- CONSIDERANDO FECHA VALOR ' + coCRLF +
              '             SUM(HI.IMP_INTERES_DIA + HI.IMP_INTERES_FV + HI.IMP_AJUSTE_IN) ACUM_INT_DIA, ' + coCRLF +
              '             SUM(CASE WHEN HI.F_TRASPASO_VENC IS NULL THEN HI.IMP_INTERES_DIA + HI.IMP_INTERES_FV + HI.IMP_AJUSTE_IN ELSE 0 END) ACUM_INT_RES, ' + coCRLF +
              '             SUM(CASE WHEN HI.F_TRASPASO_VENC IS NOT NULL THEN HI.IMP_INTERES_DIA + HI.IMP_INTERES_FV + HI.IMP_AJUSTE_IN ELSE 0 END) ACUM_INT_CO, ' + coCRLF +
              '             SUM(HI.IMP_INT_COB_FV) ACUM_INT_COB, ' + coCRLF +
              '             SUM(HI.IMP_ICXA_FV) ACUM_ICXA, ' + coCRLF +
              '             SUM((HI.IMP_MOR_CP + HI.IMP_MOR_CP_FV + HI.IMP_MOR_AJ_CP) + (HI.IMP_MOR_FN + HI.IMP_MOR_FN_FV + HI.IMP_MOR_AJ_FN) + (HI.IMP_MOR_CN + HI.IMP_MOR_CN_FV + HI.IMP_MOR_AJ_CN)) ACUM_MORAS, ' + coCRLF +
              '             SUM(HI.IMP_COB_MCP_FV + HI.IMP_COB_MFN_FV + HI.IMP_COB_MCN_FV) ACUM_COB_MOR, ' + coCRLF +
              '             SUM(HI.IMP_INT_CAS_FV) ACUM_INT_CASTIGO, ' + coCRLF +
              '             SUM(HI.IMP_MOR_COND_FV) ACUM_MORA_CONDONA ' + coCRLF;
  end
  else
  begin
    vlSalida := vlSalida +
              '             -- IMPORTES ' + coCRLF +
              '             SUM(HI.IMP_INTERES_DIA + HI.IMP_AJUSTE_IN) ACUM_INT_DIA, ' + coCRLF +
              '             SUM(CASE WHEN HI.F_TRASPASO_VENC IS NULL THEN HI.IMP_INTERES_DIA + HI.IMP_AJUSTE_IN ELSE 0 END) ACUM_INT_RES, ' + coCRLF +
              '             SUM(CASE WHEN HI.F_TRASPASO_VENC IS NOT NULL THEN HI.IMP_INTERES_DIA + HI.IMP_AJUSTE_IN ELSE 0 END) ACUM_INT_CO, ' + coCRLF +
              '             SUM(HI.IMP_INT_COB) ACUM_INT_COB, ' + coCRLF +
              '             SUM(HI.IMP_ICXA) ACUM_ICXA, ' + coCRLF +
              '             SUM((HI.IMP_MOR_CP + HI.IMP_MOR_AJ_CP) + (HI.IMP_MOR_FN + HI.IMP_MOR_AJ_FN) + (HI.IMP_MOR_CN + HI.IMP_MOR_AJ_CN)) ACUM_MORAS, ' + coCRLF +
              '             SUM(HI.IMP_COB_MCP + HI.IMP_COB_MFN + HI.IMP_COB_MCN) ACUM_COB_MOR, ' + coCRLF +
              '             SUM(HI.IMP_INT_CAS) ACUM_INT_CASTIGO, ' + coCRLF +
              '             SUM(HI.IMP_MOR_COND) ACUM_MORA_CONDONA ' + coCRLF;
  end;
  vlSalida := vlSalida +
              '      FROM CR_HISTO_INTERES HI ' + coCRLF +
              '      WHERE HI.F_CIERRE BETWEEN ' + SQLFecha(vlFe_IniAnio) + ' AND ' + SQLFecha(peFe_Fin) +
              '      GROUP BY HI.ID_CREDITO ' + coCRLF +
              '     ) ACUM, ' + coCRLF +
              '	 PERSONA PER, ' + coCRLF +
              '	 CRE_PRESUPUESTO PRES, ' + coCRLF +
              '	 MONEDA MON ' + coCRLF +
              'WHERE CRED.ID_TITULAR = PER.ID_PERSONA ' + coCRLF +
              '  AND CRED.ID_CREDITO = FTRAS.ID_CREDITO ' + coCRLF +
              '  AND CRED.CVE_MONEDA = MON.CVE_MONEDA ' + coCRLF +
              '  AND CRED.CVE_PRESUPUESTO = PRES.CVE_PRESUPUESTO ' + coCRLF +
              '  AND CRED.ID_CREDITO = P.ID_CREDITO ' + coCRLF +
              '  AND CRED.ID_CREDITO = ACUM.ID_CREDITO ' + coCRLF;
  if peqCveMoneda <> 0 then
     vlSalida := vlSalida +
              '  AND CRED.CVE_MONEDA = ' + IntToStr(peqCveMoneda) + coCRLF;
  if peqCliente <> 0 then
     vlSalida := vlSalida +
              '  AND CRED.ID_TITULAR = ' + IntToStr(peqCliente) + coCRLF;
  if peqProducto <> '' then
     vlSalida := vlSalida +
              '  AND CRED.CVE_PRODUCTO_CRE = ''' + peqProducto + ''' ' + coCRLF;
  if peqCredito <> 0 then
     vlSalida := vlSalida +
              '  AND CRED.ID_CREDITO = ' + IntToStr(peqCredito) + coCRLF;

  if peqTipoSubtot = 0 then
     vlSalida := vlSalida +
              'ORDER BY MON.DESC_MONEDA, CRED.CVE_PRODUCTO_CRE, CRED.ID_CREDITO ' + coCRLF
  else
  begin
    if peqTipoSubtot = 1 then
       vlSalida := vlSalida +
              'ORDER BY MON.DESC_MONEDA, SITUACION, CRED.CVE_PRODUCTO_CRE, CRED.ID_CREDITO ' + coCRLF
    else
       vlSalida := vlSalida +
              'ORDER BY MON.DESC_MONEDA, CRED.ID_CREDITO ' + coCRLF;
  end;

  result := vlSalida;
end;

function TQROperativoIntereses.Cierra_Y_Guarda_ArchivoExcel: Boolean;
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

procedure TQROperativoIntereses.ColocaFormulas;
begin

end;

procedure TQROperativoIntereses.IniciaArchivoExcel(peFileName: String);
const aColumnWidth : Array[1..22] of Double = ( 9.00, 23.00,  6.00,  8.00, 23.00,  6.00,  8.50,
                                                8.50,  8.50, 10.00, 10.00, 10.00, 10.00,
                                               10.00, 10.00, 10.00, 10.00, 10.00, 10.00,
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

   // Coloca los títulos del reporte
   vgNumRow := 1;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'BANCO INTERACCIONES, S.A. INSTITUCIÓN DE BANCA MULTIPLE G.F.I.';
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].MergeCells := True;

   // Coloca los títulos
   Inc(vgNumRow);
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'Reporte Operativo de Intereses';
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].MergeCells := True;

   // Renglon de título
   Inc(vgNumRow);
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := vgTitReporte;
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].MergeCells := True;

   // Renglon de título
   Inc(vgNumRow);
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := '(Cifras en moneda de origen)';
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].MergeCells := True;

   // Deja un renglon en blanco
   Inc(vgNumRow);

   // Titulo de columnas
   Inc(vgNumRow);
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := 'RESULTADOS DIA';
   vgExcelApp.Range['L'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['L'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].Columns.Interior.Color := clSilver;
   vgExcelApp.Range['L'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)].MergeCells := True;


   vgExcelApp.Cells[ vgNumRow , ColumnXlS('N') ].Value := 'CUENTAS ORDEN DIA';
   vgExcelApp.Range['N'+IntToStr(vgNumRow)+':P'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['N'+IntToStr(vgNumRow)+':P'+IntToStr(vgNumRow)].Columns.Interior.Color := clGray;
   vgExcelApp.Range['N'+IntToStr(vgNumRow)+':P'+IntToStr(vgNumRow)].MergeCells := True;

   vgExcelApp.Cells[ vgNumRow , ColumnXlS('Q') ].Value := 'RESULTADOS ACUMULADO';
   vgExcelApp.Range['Q'+IntToStr(vgNumRow)+':S'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['Q'+IntToStr(vgNumRow)+':S'+IntToStr(vgNumRow)].Columns.Interior.Color := clSilver;
   vgExcelApp.Range['Q'+IntToStr(vgNumRow)+':S'+IntToStr(vgNumRow)].MergeCells := True;

   vgExcelApp.Cells[ vgNumRow , ColumnXlS('T') ].Value := 'CTAS ORDEN ACUMULADO';
   vgExcelApp.Range['T'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['T'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].Columns.Interior.Color := clGray;
   vgExcelApp.Range['T'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].MergeCells := True;

   Inc(vgNumRow);
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].Font.Bold := True;
      
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'Cve Producto';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('B') ].Value := 'Cartera';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := 'Crédito';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('D') ].Value := 'Id Acreditado';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('E') ].Value := 'Acreditado';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('F') ].Value := 'Estatus';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('G') ].Value := 'Fecha Inicio';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value := 'Fecha Vento';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := 'Trasp Vencido';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := 'Interés Devengado Día';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := 'ICXA';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := 'Interés Ctas Resultado';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('M') ].Value := 'Moratorio Cobrado';
//   vgExcelApp.Cells[ vgNumRow , ColumnXlS('N') ].Value := 'Interés Castigo';    // RABA SEP 2012 ELIMINAR COLUMNA
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('N') ].Value := 'Interés Ctas Orden';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('O') ].Value := 'Moratorio';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('P') ].Value := 'Moratorio Condonado';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('Q') ].Value := 'Intereses';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('R') ].Value := 'ICXA';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('S') ].Value := 'Moras Cobrados';
//   vgExcelApp.Cells[ vgNumRow , ColumnXlS('T') ].Value := 'Castigo Interés';    // RABA SEP 2012 ELIMINAR COLUMNA
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('T') ].Value := 'Interés Ctas Orden';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('U') ].Value := 'Moratorios';
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('V') ].Value := 'Condonados';

   //Le da formato al renglón de Titulos
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].Font.Bold := True;
   vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)];
   try
     vgExcelApp.ActiveWindow.FreezePanes:=False;
   finally
   end;

   // Deja un renglon en blanco
   Inc(vgNumRow);

   // Se aumenta un renglon más en donde dara inicio la colocación de la información
   Inc(vgNumRow);

end;

procedure TQROperativoIntereses.qrGrupoMonedaAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;

  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].Font.Bold := True ;
  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].Font.Color := clWhite;
  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].Columns.Interior.ColorIndex := 1;

  vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := 'Moneda: ' +
                '  ' + qOpeInteres.FieldByName('CVE_MONEDA').AsString +
                '  ' + qOpeInteres.FieldByName('DESC_MONEDA').AsString;
end;

procedure TQROperativoIntereses.qrGrupoProductoSAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
   // Valida si se genera o no el Archivo de Excel
   If (Not vgBGeneraArchivo) Then Exit;
   //
   Inc(vgNumRow);
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].Columns.Interior.Color := clSilver;

   if vgTipoSubtotal = 0 then
   begin
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('B') ].Value := 'Producto : ';
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := qOpeInteres.FieldByName('DESC_C_PRODUCTO').AsString;
   end
   else
     if vgTipoSubtotal = 1 then
     begin
       vgExcelApp.Cells[ vgNumRow , ColumnXlS('B') ].Value := 'Estatus : ';
       vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := qOpeInteres.FieldByName('SITUACION').AsString;
     end
     else
     begin
       vgExcelApp.Cells[ vgNumRow , ColumnXlS('B') ].Value := '';
       vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := '';
     end;

   // se guarda el renglon en donde inicia el bloque para los subtotales
   vgRowIni := vgNumRow + 1;

end;

procedure TQROperativoIntereses.DetailBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
   If (Not vgBGeneraArchivo) Then Exit;
   //
   Inc(vgNumRow);
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('A') ].Value := qOpeInteres.FieldByName('CVE_PRODUCTO_CRE').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('B') ].Value := qOpeInteres.FieldByName('DESC_PRESUPUESTO').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('C') ].Value := qOpeInteres.FieldByName('ID_CREDITO').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('D') ].Value := qOpeInteres.FieldByName('ID_TITULAR').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('E') ].Value := qOpeInteres.FieldByName('CTE').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('F') ].Value := qOpeInteres.FieldByName('SITUACION').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('G') ].Value := qOpeInteres.FieldByName('F_INICIO').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('H') ].Value := qOpeInteres.FieldByName('F_VENCIMIENTO').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('I') ].Value := qOpeInteres.FieldByName('F_TRASPASO_VENC').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := qOpeInteres.FieldByName('IMP_INTERES_DIA').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := qOpeInteres.FieldByName('IMP_ICXA').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := qOpeInteres.FieldByName('IMP_INTERES_RES').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('M') ].Value := qOpeInteres.FieldByName('IMP_COB_MOR').AsString;
//   vgExcelApp.Cells[ vgNumRow , ColumnXlS('N') ].Value := qOpeInteres.FieldByName('IMP_INT_CASTIGO').AsString; // RABA SEP 2012 ELIMINAR COLUMNA
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('N') ].Value := qOpeInteres.FieldByName('IMP_INTERES_CO').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('O') ].Value := qOpeInteres.FieldByName('IMP_MORAS').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('P') ].Value := qOpeInteres.FieldByName('IMP_MORA_CONDONA').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('Q') ].Value := qOpeInteres.FieldByName('ACUM_INT_RES').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('R') ].Value := qOpeInteres.FieldByName('ICXA_SDO').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('S') ].Value := qOpeInteres.FieldByName('ACUM_COB_MOR').AsString;
//   vgExcelApp.Cells[ vgNumRow , ColumnXlS('T') ].Value := qOpeInteres.FieldByName('ACUM_INT_CASTIGO').AsString; // RABA SEP 2012 ELIMINAR COLUMNA
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('T') ].Value := qOpeInteres.FieldByName('ACUM_INT_CO').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('U') ].Value := qOpeInteres.FieldByName('ACUM_MORAS').AsString;
   vgExcelApp.Cells[ vgNumRow , ColumnXlS('V') ].Value := qOpeInteres.FieldByName('ACUM_MORA_CONDONA').AsString;
   
   // Formato de número
   vgExcelApp.Range['J'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].NumberFormat := '#,##0.00';

end;

procedure TQROperativoIntereses.qrPiedeGrupoProductoAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
   // Valida si se genera o no el Archivo de Excel
   If (Not vgBGeneraArchivo) Then Exit;
   //
   Inc(vgNumRow);
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].Font.Bold := True;
   vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].Columns.Interior.Color := clSilver;

   if vgTipoSubtotal = 0 then
   begin
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('D') ].Value := 'Total  Producto : ';
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('E') ].Value := qOpeInteres.FieldByName('DESC_C_PRODUCTO').AsString;
   end
   else
     if vgTipoSubtotal = 1 then
     begin
       vgExcelApp.Cells[ vgNumRow , ColumnXlS('D') ].Value := 'Total  Estatus : ';
       vgExcelApp.Cells[ vgNumRow , ColumnXlS('E') ].Value := qOpeInteres.FieldByName('SITUACION').AsString;
     end
     else
     begin
       vgExcelApp.Cells[ vgNumRow , ColumnXlS('D') ].Value := '';
       vgExcelApp.Cells[ vgNumRow , ColumnXlS('E') ].Value := '';
     end;


   if vgTipoSubtotal < 2 then
   begin
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := '=SUM(J'+IntToStr(vgRowIni)+':J'+IntToStr(vgRowFin)+')';
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := '=SUM(K'+IntToStr(vgRowIni)+':K'+IntToStr(vgRowFin)+')';
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := '=SUM(L'+IntToStr(vgRowIni)+':L'+IntToStr(vgRowFin)+')';
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('M') ].Value := '=SUM(M'+IntToStr(vgRowIni)+':M'+IntToStr(vgRowFin)+')';
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('N') ].Value := '=SUM(N'+IntToStr(vgRowIni)+':N'+IntToStr(vgRowFin)+')';
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('O') ].Value := '=SUM(O'+IntToStr(vgRowIni)+':O'+IntToStr(vgRowFin)+')';
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('P') ].Value := '=SUM(P'+IntToStr(vgRowIni)+':P'+IntToStr(vgRowFin)+')';
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('Q') ].Value := '=SUM(Q'+IntToStr(vgRowIni)+':Q'+IntToStr(vgRowFin)+')';
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('R') ].Value := '=SUM(R'+IntToStr(vgRowIni)+':R'+IntToStr(vgRowFin)+')';
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('S') ].Value := '=SUM(S'+IntToStr(vgRowIni)+':S'+IntToStr(vgRowFin)+')';
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('T') ].Value := '=SUM(T'+IntToStr(vgRowIni)+':T'+IntToStr(vgRowFin)+')';
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('U') ].Value := '=SUM(U'+IntToStr(vgRowIni)+':U'+IntToStr(vgRowFin)+')';
     vgExcelApp.Cells[ vgNumRow , ColumnXlS('V') ].Value := '=SUM(V'+IntToStr(vgRowIni)+':V'+IntToStr(vgRowFin)+')';

     vgExcelApp.Range['J'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].NumberFormat := '#,##0.00';
     vgStrList.Add(IntToStr(vgNumRow));

     Inc(vgNumRow);
   end;
end;

procedure TQROperativoIntereses.qrPiedeGrupoProductoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  vgRowFin := vgNumRow;
end;

procedure TQROperativoIntereses.qrPiedeGrupoMonedaAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var I : Integer;
    vlstrPlus : String;
    vlstrFormula1, vlstrFormula2, vlstrFormula3, vlstrFormula4, vlstrFormula5 : String;
    vlstrFormula6, vlstrFormula7, vlstrFormula8, vlstrFormula9, vlstrFormula10 : String;
    vlstrFormula11, vlstrFormula12, vlstrFormula13 : String;
    vlRange : Variant;
begin
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivo) Then Exit;

  if vgTipoSubtotal < 2 then
  begin
    // Coloca Formúlas de SUMATORIAS
    vlstrPlus := '';
    vlstrFormula1 := '';   vlstrFormula2 := '';   vlstrFormula3 := '';
    vlstrFormula4 := '';   vlstrFormula5 := '';   vlstrFormula6 := '';
    vlstrFormula7 := '';   vlstrFormula8 := '';   vlstrFormula9 := '';
    vlstrFormula10 := '';  vlstrFormula11 := '';  vlstrFormula12 := '';
    vlstrFormula13 := '';

    For I := 0 To vgStrList.Count-1 Do
      Begin
      vlstrFormula1 := vlstrFormula1  + vlstrPlus + 'J' + vgStrList[I];
      vlstrFormula2 := vlstrFormula2  + vlstrPlus + 'K' + vgStrList[I];
      vlstrFormula3 := vlstrFormula3  + vlstrPlus + 'L' + vgStrList[I];
      vlstrFormula4 := vlstrFormula4  + vlstrPlus + 'M' + vgStrList[I];
      vlstrFormula5 := vlstrFormula5  + vlstrPlus + 'N' + vgStrList[I];
      vlstrFormula6 := vlstrFormula6  + vlstrPlus + 'O' + vgStrList[I];
      vlstrFormula7 := vlstrFormula7  + vlstrPlus + 'P' + vgStrList[I];
      vlstrFormula8 := vlstrFormula8  + vlstrPlus + 'Q' + vgStrList[I];
      vlstrFormula9 := vlstrFormula9  + vlstrPlus + 'R' + vgStrList[I];
      vlstrFormula10 := vlstrFormula10 + vlstrPlus + 'S' + vgStrList[I];
      vlstrFormula11 := vlstrFormula11 + vlstrPlus + 'T' + vgStrList[I];
      vlstrFormula12 := vlstrFormula12 + vlstrPlus + 'U' + vgStrList[I];
      vlstrFormula13 := vlstrFormula13 + vlstrPlus + 'V' + vgStrList[I];

      vlstrPlus := '+';
      End;
    Inc(vgNumRow);
    Inc(vgNumRow);

    vgExcelApp.Cells[ vgNumRow , ColumnXlS('F') ].Value := 'TOTAL MONEDA';
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := '='+vlstrFormula1;
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := '='+vlstrFormula2;
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := '='+vlstrFormula3;
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('M') ].Value := '='+vlstrFormula4;
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('N') ].Value := '='+vlstrFormula5;
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('O') ].Value := '='+vlstrFormula6;
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('P') ].Value := '='+vlstrFormula7;
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('Q') ].Value := '='+vlstrFormula8;
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('R') ].Value := '='+vlstrFormula9;
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('S') ].Value := '='+vlstrFormula10;
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('T') ].Value := '='+vlstrFormula11;
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('U') ].Value := '='+vlstrFormula12;
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('V') ].Value := '='+vlstrFormula13;
  end
  else
  begin
    vgRowFin := vgNumRow - 1;
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('F') ].Value := 'TOTAL MONEDA';    
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('J') ].Value := '=SUM(J'+IntToStr(vgRowIni)+':J'+IntToStr(vgRowFin)+')';
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('K') ].Value := '=SUM(K'+IntToStr(vgRowIni)+':K'+IntToStr(vgRowFin)+')';
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('L') ].Value := '=SUM(L'+IntToStr(vgRowIni)+':L'+IntToStr(vgRowFin)+')';
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('M') ].Value := '=SUM(M'+IntToStr(vgRowIni)+':M'+IntToStr(vgRowFin)+')';
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('N') ].Value := '=SUM(N'+IntToStr(vgRowIni)+':N'+IntToStr(vgRowFin)+')';
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('O') ].Value := '=SUM(O'+IntToStr(vgRowIni)+':O'+IntToStr(vgRowFin)+')';
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('P') ].Value := '=SUM(P'+IntToStr(vgRowIni)+':P'+IntToStr(vgRowFin)+')';
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('Q') ].Value := '=SUM(Q'+IntToStr(vgRowIni)+':Q'+IntToStr(vgRowFin)+')';
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('R') ].Value := '=SUM(R'+IntToStr(vgRowIni)+':R'+IntToStr(vgRowFin)+')';
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('S') ].Value := '=SUM(S'+IntToStr(vgRowIni)+':S'+IntToStr(vgRowFin)+')';
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('T') ].Value := '=SUM(T'+IntToStr(vgRowIni)+':T'+IntToStr(vgRowFin)+')';
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('U') ].Value := '=SUM(U'+IntToStr(vgRowIni)+':U'+IntToStr(vgRowFin)+')';
    vgExcelApp.Cells[ vgNumRow , ColumnXlS('V') ].Value := '=SUM(V'+IntToStr(vgRowIni)+':V'+IntToStr(vgRowFin)+')';
  end;

  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].Font.Bold := True;
  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].Font.Color := clWhite;
  vgExcelApp.Range['A'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].Columns.Interior.ColorIndex := 1;
  vgExcelApp.Range['J'+IntToStr(vgNumRow)+':V'+IntToStr(vgNumRow)].NumberFormat := '#,##0.00';

  vgStrList.Clear;
  Inc(vgNumRow);
  Inc(vgNumRow);
end;

end.
