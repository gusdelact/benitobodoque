unit IntQrSHF;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre, UnSQL2, ComObj, IntXLS;

type
  TQrSHF = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyConsulta: TQuery;
    qrTITLE2: TQRBand;
    qrlblID_CREDITO: TQRLabel;
    qrlblIMP_CREDITO: TQRLabel;
    qrlblCVE_OPERATIVA: TQRLabel;
    qyConsultaCVE_PRODUCTO_CRE: TStringField;
    qyConsultaDESC_L_PRODUCTO: TStringField;
    qyConsultaCVE_PRODUCTO_GPO: TStringField;
    qyConsultaDESC_L_PROD_GPO: TStringField;
    qyConsultaCVE_MONEDA: TFloatField;
    qyConsultaDESC_MONEDA: TStringField;
    qyConsultaID_PERSONA: TFloatField;
    qyConsultaNOMBRE: TStringField;
    qyConsultaID_CREDITO: TFloatField;
    qyConsultaIMP_CREDITO: TFloatField;
    qyConsultaSDO_VIG_TOTAL: TFloatField;
    qyConsultaID_CONTRATO: TFloatField;
    qyConsultaCVE_OPERATIVA: TStringField;
    qyConsultaDESC_OPERATIVA: TStringField;
    qyConsultaPCT_GTIA_FEGA_EF: TFloatField;
    qyConsultaSIT_CREDITO: TStringField;
    qyConsultaIMP_GARANTIZADO: TFloatField;
    qrlblID_CONTRATO: TQRLabel;
    QRLabel2: TQRLabel;
    qrlblPCT_GTIA_FEGA_EF: TQRLabel;
    qrlblIMP_GARANTIZADO: TQRLabel;
    qrDETAIL: TQRBand;
    qrgpoCVE_MONEDA: TQRGroup;
    qrgpoID_ACREDITADO: TQRGroup;
    qrgpofootCVE_MONEDA: TQRBand;
    qrgpofootCVE_PRODUCTO_GPO: TQRBand;
    qrgpofootCVE_PRODUCTO_CRE: TQRBand;
    qrgpofootID_ACREDITADO: TQRBand;
    qrlblCVE_MONEDA: TQRLabel;
    qrdbCVE_MONEDA: TQRDBText;
    QRlblCVE_PRODUCTO_GPO: TQRLabel;
    qrdbDESC_L_PROD_GPO: TQRDBText;
    qrshpCVE_PRODUCTO_GPO: TQRShape;
    qrGpoCVE_PRODUCTO_GPO: TQRGroup;
    qrlblCVE_PRODUCTO_CRE: TQRLabel;
    qrdbDESC_L_PRODUCTO: TQRDBText;
    qrshpCVE_PRODUCTO_CRE: TQRShape;
    qrlblID_ACREDITADO: TQRLabel;
    qrdbNOMBRE: TQRDBText;
    qrshpID_ACREDITADO: TQRShape;
    qrgpoCVE_PRODUCTO_CRE: TQRGroup;
    qrlblID_ACREDITADO2: TQRLabel;
    qrdbNOMBRE2: TQRDBText;
    qrshpID_ACREDITADO2: TQRShape;
    qrlblCVE_PRODUCTO_CRE2: TQRLabel;
    qrdbDESC_L_PRODUCTO2: TQRDBText;
    qrshpCVE_PRODUCTO_CRE2: TQRShape;
    qrlblOPERATIVA: TQRLabel;
    QRlblCVE_PRODUCTO_GPO2: TQRLabel;
    qrdbDESC_L_PROD_GPO2: TQRDBText;
    qrshpCVE_PRODUCTO_GPO2: TQRShape;
    QRLabel3: TQRLabel;
    qrdbDESC_MONEDA2: TQRDBText;
    qrshpMoneda2: TQRShape;
    qrshpMoneda: TQRShape;
    qrdbID_CONTRATO: TQRDBText;
    qrdbID_CREDITO: TQRDBText;
    qrdbIMP_CREDITO: TQRDBText;
    qrdbSDO_VIG_TOTAL: TQRDBText;
    qrdbCVE_OPERATIVA: TQRDBText;
    qrdbDESC_OPERATIVA: TQRDBText;
    qrdbPCT_GTIA_FEGA_EF: TQRDBText;
    qrdbIMP_GARANTIZADO: TQRDBText;
    qrexprIMP_CREDITO1: TQRExpr;
    qrExpSDO_VIG_TOTAL1: TQRExpr;
    qrexprIMP_GARANTIZADO1: TQRExpr;
    qrexprIMP_CREDITO2: TQRExpr;
    qrExpSDO_VIG_TOTAL2: TQRExpr;
    qrexprIMP_GARANTIZADO2: TQRExpr;
    qrexprIMP_CREDITO3: TQRExpr;
    qrExpSDO_VIG_TOTAL3: TQRExpr;
    qrexprIMP_GARANTIZADO3: TQRExpr;
    qrexprIMP_CREDITO4: TQRExpr;
    qrExpSDO_VIG_TOTAL4: TQRExpr;
    qrexprIMP_GARANTIZADO4: TQRExpr;
    qrdbCVE_PRODUCTO_CRE: TQRDBText;
    qrdbCVE_PRODUCTO_GPO: TQRDBText;
    qrdbID_PERSONA: TQRDBText;
    QRDBText1: TQRDBText;
    procedure qrDETAILAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
  public
     Apli : TInterApli;
     vgExcelApp : OleVariant;
     vgbGeneraArchivo : Boolean;
     vgRow : Integer;

     Function ArmaQuery(peF_OPERACION : TDateTime; peCVE_PRODUCTO_GPO, peCVE_PRODUCTO_CRE : String;
                        peCVE_MONEDA, peID_ACREDITADO, peID_CONTRATO,
                        peID_EMPRESA, peID_ENTIDAD : Integer) : String;
  end;

var
  QrSHF: TQrSHF;

Procedure ReporteCreditosConSHF( peApli : TInterApli; pebPreview : Boolean; peStrNomArchivo : String;
                                 peF_OPERACION : TDateTime; peCVE_PRODUCTO_GPO, peCVE_PRODUCTO_CRE : String;
                                 peCVE_MONEDA, peID_ACREDITADO, peID_CONTRATO,
                                 peID_EMPRESA, peID_ENTIDAD : Integer);

Implementation
{$R *.DFM}

Procedure ReporteCreditosConSHF( peApli : TInterApli; pebPreview : Boolean; peStrNomArchivo : String;
                                 peF_OPERACION : TDateTime; peCVE_PRODUCTO_GPO, peCVE_PRODUCTO_CRE : String;
                                 peCVE_MONEDA, peID_ACREDITADO, peID_CONTRATO,
                                 peID_EMPRESA, peID_ENTIDAD : Integer);
Var
    QRSHF   : TQRSHF;
    Preview : TIntQRPreview;
    vlColumnRange : Variant;
    vlCol : Integer;
Begin
      QRSHF   := TQRSHF.Create(Nil);
      Preview := TIntQRPreview.CreatePreview(Application, QRSHF);
      QRSHF.Apli := peApli;
      QRSHF.vgbGeneraArchivo := (ExtractFileName(peStrNomArchivo) <> '');

      If QRSHF.vgbGeneraArchivo Then
         Begin
         QRSHF.vgExcelApp := CreateOleObject('Excel.Application');
         QRSHF.vgExcelApp.Workbooks.Add;
         QRSHF.vgRow := 1;
         // Coloca Header
         QRSHF.vgExcelApp.Cells[ QRSHF.vgRow , ColumnXlS('A') ].Value := 'Cve. Moneda';
         QRSHF.vgExcelApp.Cells[ QRSHF.vgRow , ColumnXlS('B') ].Value := 'Moneda';
         QRSHF.vgExcelApp.Cells[ QRSHF.vgRow , ColumnXlS('C') ].Value := 'Clave Grupo Producto';
         QRSHF.vgExcelApp.Cells[ QRSHF.vgRow , ColumnXlS('D') ].Value := 'Grupo Producto';
         QRSHF.vgExcelApp.Cells[ QRSHF.vgRow , ColumnXlS('E') ].Value := 'Cve. Producto';
         QRSHF.vgExcelApp.Cells[ QRSHF.vgRow , ColumnXlS('F') ].Value := 'Producto';
         QRSHF.vgExcelApp.Cells[ QRSHF.vgRow , ColumnXlS('G') ].Value := 'Id. Acreditado';
         QRSHF.vgExcelApp.Cells[ QRSHF.vgRow , ColumnXlS('H') ].Value := 'Acreditado';
         QRSHF.vgExcelApp.Cells[ QRSHF.vgRow , ColumnXlS('I') ].Value := 'No. Autorización';
         QRSHF.vgExcelApp.Cells[ QRSHF.vgRow , ColumnXlS('J') ].Value := 'No. Disposición';
         QRSHF.vgExcelApp.Cells[ QRSHF.vgRow , ColumnXlS('K') ].Value := 'Imp. Crédito';
         QRSHF.vgExcelApp.Cells[ QRSHF.vgRow , ColumnXlS('L') ].Value := 'Saldo Insoluto';
         QRSHF.vgExcelApp.Cells[ QRSHF.vgRow , ColumnXlS('M') ].Value := 'Cve. Operativa';
         QRSHF.vgExcelApp.Cells[ QRSHF.vgRow , ColumnXlS('N') ].Value := 'Operativa';
         QRSHF.vgExcelApp.Cells[ QRSHF.vgRow , ColumnXlS('O') ].Value := 'Porcentaje Garantía';
         QRSHF.vgExcelApp.Cells[ QRSHF.vgRow , ColumnXlS('P') ].Value := 'Imp. Garantizado';
         Inc(QRSHF.vgRow);
         End;

      Try
        QRSHF.QRInterEncabezado1.Apli:=peApli;
        QRSHF.QRInterEncabezado1.IdEmpresa:= peApli.IdEmpresa;
        QRSHF.QRInterEncabezado1.NomReporte:='IntMQRSHF';

        QRSHF.QRInterEncabezado1.Titulo1:='Reporte Disposiciones con Garantía SHF';
        QRSHF.QRInterEncabezado1.FechaInfor := peF_OPERACION;

        QRSHF.qyConsulta.DatabaseName := peApli.DataBaseName;
        QRSHF.qyConsulta.SessionName := peApli.SessionName;

        QRSHF.qyConsulta.Active:=False;
        QRSHF.qyConsulta.SQL.Text:= QRSHF.ArmaQuery(peF_OPERACION, peCVE_PRODUCTO_GPO, peCVE_PRODUCTO_CRE,
                                                    peCVE_MONEDA, peID_ACREDITADO, peID_CONTRATO,
                                                    peID_EMPRESA, peID_ENTIDAD);
        QRSHF.qyConsulta.Active:=True;

        If pebPreview Then
            QRSHF.Preview
        Else
            QRSHF.Print;

        If QRSHF.vgbGeneraArchivo Then
           Begin
           vlColumnRange := QRSHF.vgExcelApp.Workbooks[1].WorkSheets['Sheet1'].Columns;
           For vlCol := 1 To 19 Do
             vlColumnRange.Columns[vlCol].Font.Size := 8;

           // Salva el archivo   
           QRSHF.vgExcelApp.ActiveWorkBook.SaveAs(peStrNomArchivo);
           CloseExcelFile(QRSHF.vgExcelApp);
           End;

    Finally
        QRSHF.Free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrSHF.ArmaQuery(peF_OPERACION : TDateTime; peCVE_PRODUCTO_GPO, peCVE_PRODUCTO_CRE : String;
                          peCVE_MONEDA, peID_ACREDITADO, peID_CONTRATO,
                          peID_EMPRESA, peID_ENTIDAD : Integer) : String;
Var
    vlSQL, vlFECHA_EMPRESA, vlF_OPERACION : String;
Begin
    vlFECHA_EMPRESA := SQLFecha(Apli.DameFechaEmpresa);
    vlF_OPERACION := SQLFecha(peF_OPERACION);

    vlSQL :=
             ' SELECT'+coCRLF+
             '      CP.CVE_PRODUCTO_CRE,'+coCRLF+
             '      CP.DESC_L_PRODUCTO,'+coCRLF+
             '      CP.CVE_PRODUCTO_GPO,'+coCRLF+
             '      CPG.DESC_L_PROD_GPO,'+coCRLF+
             '      M.CVE_MONEDA,'+coCRLF+
             '      M.DESC_MONEDA,'+coCRLF+
             '      P.ID_PERSONA,'+coCRLF+
             '      P.NOMBRE,'+coCRLF+
             '      CC.ID_CREDITO,'+coCRLF+
             '      CC.IMP_CREDITO,'+coCRLF+
             '      CC.SDO_VIG_TOTAL,'+coCRLF+
             '      OPERATIVA2.*,'+coCRLF+
             '      CC.SIT_CREDITO,'+coCRLF+
             '      ROUND(OPERATIVA2.PCT_GTIA_FEGA_EF * CC.SDO_VIG_TOTAL / 100, 2) AS IMP_GARANTIZADO'+coCRLF+
             ' FROM (  -- Obtiene No. autorizaciones con operativas vigentes'+coCRLF+
             '         SELECT CGFC.ID_CONTRATO,'+coCRLF+
             '                CGFC.CVE_OPERATIVA,'+coCRLF+
             '                OPERATIVA.DESC_OPERATIVA,'+coCRLF+
             '                OPERATIVA.PCT_GTIA_FEGA_EF'+coCRLF+
             '         FROM CR_GA_FIRA_CTO CGFC,'+coCRLF+
             '              ( SELECT CFO.CVE_OPERATIVA,'+coCRLF+
             '                       CFO.DESC_OPERATIVA,'+coCRLF+
             '                       CFE.PCT_GTIA_LIQ,'+coCRLF+
             '                       CFE.PCT_GTIA_FEGA_EF,'+coCRLF+
             '                       CFE.PCT_GTIA_FEGA_NO'+coCRLF+
             '                FROM  ( SELECT CVE_OPERATIVA, DESC_OPERATIVA'+coCRLF+
             '                        FROM CR_FIRA_OPERA'+coCRLF+
             '                        WHERE CVE_OPERATIVA LIKE ''GPO%'''+coCRLF+
             '                      ) CFO,'+coCRLF+
             '                      CR_FIRA_EQUIV CFE'+coCRLF+
             '                WHERE CFE.CVE_OPERATIVA = CFO.CVE_OPERATIVA'+coCRLF+
             '              ) OPERATIVA'+coCRLF+
             '        WHERE CGFC.CVE_OPERATIVA = OPERATIVA.CVE_OPERATIVA'+coCRLF+
             '          AND CGFC.SIT_GA_FIRA = ''AC'''+coCRLF+
             '    )  OPERATIVA2,'+coCRLF+
             '    (  -- Si la fecha solicitada es del día de hoy, entonces...'+coCRLF+
             '       SELECT CC.ID_CREDITO, CC.SIT_CREDITO, CC.ID_CONTRATO, CC.IMP_CREDITO, CC.SDO_VIG_TOTAL'+coCRLF+
             '       FROM CR_CREDITO CC'+coCRLF+
             '       WHERE '+vlF_OPERACION+' = '+vlFECHA_EMPRESA+coCRLF+
             '     UNION ALL'+coCRLF+
             '       -- Por el contrario, si se solicita una fecha menor al día de hoy, lo toma del HISTORICO'+coCRLF+
             '       SELECT CCAS.ID_CREDITO, CC.SIT_CREDITO, CC.ID_CONTRATO, CC.IMP_CREDITO, CCAS.IMP_CAP_VIG AS SDO_VIG_TOTAL'+coCRLF+
             '       FROM CR_CON_ADEUDO_SDO CCAS,'+coCRLF+
             '            CR_CREDITO CC'+coCRLF+
             '       WHERE '+vlF_OPERACION+' < '+vlFECHA_EMPRESA+coCRLF+
             '         AND CCAS.F_CIERRE = '+vlF_OPERACION+coCRLF+
             '         AND CC.ID_CREDITO = CCAS.ID_CREDITO'+coCRLF+
             '    ) CC,'+coCRLF+
             '    MONEDA M,'+coCRLF+
             '    CONTRATO CTO,'+coCRLF+
             '    CR_CONTRATO CO,'+coCRLF+
             '    CR_PRODUCTO CP,'+coCRLF+
             '    CR_PRODUCTO_GPO CPG,'+coCRLF+
             '    PERSONA P'+coCRLF+
             ' WHERE CTO.ID_CONTRATO = OPERATIVA2.ID_CONTRATO'+coCRLF+
             '   AND CC.ID_CONTRATO = OPERATIVA2.ID_CONTRATO'+coCRLF+
             '   AND CO.ID_CONTRATO = OPERATIVA2.ID_CONTRATO'+coCRLF+
             '   AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE'+coCRLF+
             '   AND CPG.CVE_PRODUCTO_GPO = CP.CVE_PRODUCTO_GPO'+coCRLF+
             '   AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
             '   AND M.CVE_MONEDA = CTO.CVE_MONEDA'+coCRLF
             ;

    // Inicia aplicación de Filtros
    If (Trim(peCVE_PRODUCTO_GPO) <> '') Then
       vlSQL:= vlSQL + '   AND CP.CVE_PRODUCTO_GPO = '+ SQLStr(peCVE_PRODUCTO_GPO);

    If (Trim(peCVE_PRODUCTO_CRE)<>'') Then
       vlSQL:= vlSQL + '   AND CTO.CVE_PRODUCTO_CRE = '+ SQLStr(peCVE_PRODUCTO_CRE);

    If (peID_ACREDITADO <> 0) Then
       vlSQL:= vlSQL + '   AND CTO.ID_TITULAR = '+ IntToStr(peID_ACREDITADO);

    If (peCVE_MONEDA <> 0) Then
       vlSQL:= vlSQL + '   AND CTO.CVE_MONEDA = '+ IntToStr(peCVE_MONEDA);

    If (peID_CONTRATO <> 0) Then
       vlSQL:= vlSQL + '   AND CTO.ID_CONTRATO = '+ IntToStr(peID_CONTRATO);

    If (peID_EMPRESA <> 0) Then
       vlSQL:= vlSQL + '   AND CTO.ID_EMPRESA = '+ IntToStr(peID_EMPRESA);

{    If (peID_ENTIDAD <> 0) Then
       vlSQL:= vlSQL + '   AND CTO.ID_ENTIDAD = '+ IntToStr(peID_ENTIDAD); }

    vlSQL := vlSQL +
             ' ORDER BY P.NOMBRE, CTO.ID_CONTRATO, CC.ID_CREDITO'+coCRLF;

    Result:= vlSQL;
End;


procedure TQrSHF.qrDETAILAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  If vgbGeneraArchivo Then
    Begin
    vgExcelApp.Cells[ vgRow , ColumnXlS('A') ].Value := QyConsulta.FieldByName('CVE_MONEDA').AsFloat;
    vgExcelApp.Cells[ vgRow , ColumnXlS('B') ].Value := QyConsulta.FieldByName('DESC_MONEDA').AsString;
    vgExcelApp.Cells[ vgRow , ColumnXlS('C') ].Value := QyConsulta.FieldByName('CVE_PRODUCTO_GPO').AsString;
    vgExcelApp.Cells[ vgRow , ColumnXlS('D') ].Value := QyConsulta.FieldByName('DESC_L_PROD_GPO').AsString;
    vgExcelApp.Cells[ vgRow , ColumnXlS('E') ].Value := QyConsulta.FieldByName('CVE_PRODUCTO_CRE').AsString;
    vgExcelApp.Cells[ vgRow , ColumnXlS('F') ].Value := QyConsulta.FieldByName('DESC_L_PRODUCTO').AsString;
    vgExcelApp.Cells[ vgRow , ColumnXlS('G') ].Value := QyConsulta.FieldByName('ID_PERSONA').AsFloat;
    vgExcelApp.Cells[ vgRow , ColumnXlS('H') ].Value := QyConsulta.FieldByName('NOMBRE').AsString;
    vgExcelApp.Cells[ vgRow , ColumnXlS('I') ].Value := QyConsulta.FieldByName('ID_CONTRATO').AsFloat;
    vgExcelApp.Cells[ vgRow , ColumnXlS('J') ].Value := QyConsulta.FieldByName('ID_CREDITO').AsFloat;
    vgExcelApp.Cells[ vgRow , ColumnXlS('K') ].Value := QyConsulta.FieldByName('IMP_CREDITO').AsFloat;
    vgExcelApp.Cells[ vgRow , ColumnXlS('K') ].NumberFormat := '#,##0.00';
    vgExcelApp.Cells[ vgRow , ColumnXlS('L') ].Value := QyConsulta.FieldByName('SDO_VIG_TOTAL').AsFloat;
    vgExcelApp.Cells[ vgRow , ColumnXlS('L') ].NumberFormat := '#,##0.00';
    vgExcelApp.Cells[ vgRow , ColumnXlS('M') ].Value := QyConsulta.FieldByName('CVE_OPERATIVA').AsString;
    vgExcelApp.Cells[ vgRow , ColumnXlS('N') ].Value := QyConsulta.FieldByName('DESC_OPERATIVA').AsString;
    vgExcelApp.Cells[ vgRow , ColumnXlS('O') ].Value := QyConsulta.FieldByName('PCT_GTIA_FEGA_EF').AsFloat;
    vgExcelApp.Cells[ vgRow , ColumnXlS('O') ].NumberFormat := '#,##0.00';
    vgExcelApp.Cells[ vgRow , ColumnXlS('P') ].Value := QyConsulta.FieldByName('IMP_GARANTIZADO').AsFloat;
    vgExcelApp.Cells[ vgRow , ColumnXlS('P') ].NumberFormat := '#,##0.00';
    Inc(vgRow);
    End;
end;

End.

