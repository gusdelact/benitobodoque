unit IntMQrGtia;

//------------------------------------------------------------------
// Autor : Victor Hugo Santillán Trejo.
// Fecha : Octubre 2002.
//------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, IntHead, StdCtrls, QRExport,
  
  ComObj,
  IntXls,
  IntGenCre
  ;

type TOutputType = (toAcreditado, toCredito, toNone);

type
  TFRpIntGtia = class(TForm)
    qCredIntGtia: TQuery;
    dsCredIntGtia: TDataSource;
    qGarantias: TQuery;
    QuickRep: TQuickRep;
    PageHeaderBand1: TQRBand;
    qrieCredIntGtia: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape2: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel29: TQRLabel;
    qrlblFilter: TQRLabel;
    qrlblPromotor: TQRLabel;
    qrdbNOMBRE_PROMOTOR: TQRDBText;
    QRBand1: TQRBand;
    QRFooterPromotor: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText19: TQRDBText;
    QRBandDetail: TQRBand;
    QRDBText12: TQRDBText;
    QRDBText17: TQRDBText;
    qrdbImp_Valuacion: TQRDBText;
    QRDBText28: TQRDBText;
    qrExprSumImpVal1: TQRExpr;
    QRExpr1: TQRExpr;
    qrExprSumImpVal4: TQRExpr;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    qrlblContrato: TQRLabel;
    qrlblOTORGANTE: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    qrExprSumImpVal6: TQRLabel;
    QRShape7: TQRShape;
    QRLabel28: TQRLabel;
    qrImp_Credito: TQRDBText;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    qrExprSumImpVal7: TQRLabel;
    QRSummary: TQRBand;
    QryTemp: TQuery;
    qrdbPROMOTOR: TQRDBText;
    QrRectangle: TQRShape;
    QRLabel30: TQRLabel;
    qrFooterAcreditado: TQRBand;
    QRLabel38: TQRLabel;
    QRShape8: TQRShape;
    qrlblAcredIMP_CREDITO: TQRLabel;
    qrlblAcredSDO_GTIA: TQRLabel;
    qrlblImp_Valuacion: TQRLabel;
    qrlblTotalGroup: TQRLabel;
    QRLabel40: TQRLabel;
    qrlblGpoPercent: TQRLabel;
    qrlblImp_Credito: TQRLabel;
    qrlblTotalSdo_Gtia: TQRLabel;
    qrlblTotalImp_Valuacion: TQRLabel;
    qrlblTotal: TQRLabel;
    qrlblTotalSobrante: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel37: TQRLabel;
    qrExprSumImpVal5: TQRExpr;
    qrExprSumImpVal3: TQRExpr;
    QRLabel41: TQRLabel;
    qrlblTotalSdo_Insoluto: TQRLabel;
    qrlblAcredSDO_INSOLUTO: TQRLabel;
    qrlblTipoCambio: TQRLabel;
    QryRESUMEN: TQuery;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    qrlblPromotor1: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRShape6: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape10: TQRShape;
    QRShape9: TQRShape;
    QRDBText18: TQRDBText;
    qrExprSumImpValCorte1: TQRExpr;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText21: TQRDBText;
    qrdbCVE_MONEDA: TQRDBText;
    qrdbDESC_MONEDA: TQRDBText;
    QRDBText24: TQRDBText;
    qrExprSumImpVal2: TQRExpr;
    qrExprSumImpValCorte3: TQRExpr;
    qrExprSumImpValCorte5: TQRExpr;
    qrExprSumImpValCorte4: TQRExpr;
    qrExprSumImpValCorte6: TQRLabel;
    qrExprSumImpValCorte7: TQRLabel;
    qrExprSumImpValCorte2: TQRExpr;
    QRGrpFootCVE_PRESUPUESTO: TQRBand;
    QRGrpCVE_PRESUPUESTO: TQRGroup;
    qrdbDESC_PRESUPUESTO: TQRDBText;
    qrlbCVE_PRESUPUESTO: TQRLabel;
    QRShape27: TQRShape;
    qryDiasVencido: TQuery;
    QRLabel8: TQRLabel;
    qrlblDiasImpago: TQRLabel;
    procedure QRGrpAcreditadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrExprSumImpVal7Print(sender: TObject; var Value: String);
    procedure QRDBText23Print(sender: TObject; var Value: String);
    procedure QRLabel38Print(sender: TObject; var Value: String);
    procedure qrFooterAcreditadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrImp_CreditoPrint(sender: TObject; var Value: String);
    procedure QRGrpNOMBRE_ACREDITADOBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrlblImp_ValuacionPrint(sender: TObject; var Value: String);
    procedure qrdbImp_ValuacionPrint(sender: TObject; var Value: String);
    procedure qrlblTotalGroupPrint(sender: TObject; var Value: String);
    procedure QRLabel40Print(sender: TObject; var Value: String);
    procedure qrlblGpoPercentPrint(sender: TObject; var Value: String);
    procedure qrlblImp_CreditoPrint(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrlblTotalSdo_GtiaPrint(sender: TObject; var Value: String);
    procedure qrlblTotalImp_ValuacionPrint(sender: TObject;
      var Value: String);
    procedure qrlblTotalPrint(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRLabel41Print(sender: TObject; var Value: String);
    procedure qrlblTotalSdo_InsolutoPrint(sender: TObject;
      var Value: String);
    procedure qrlblTotalSobrantePrint(sender: TObject; var Value: String);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGrpNOMBRE_ACREDITADOAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGrpAcreditadoAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBandDetailAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrFooterAcreditadoAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRFooterPromotorAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSummaryAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrExprSumImpValCorte1Print(sender: TObject;
      var Value: String);
    procedure qrExprSumImpValCorte2Print(sender: TObject;
      var Value: String);
    procedure qrExprSumImpValCorte3Print(sender: TObject;
      var Value: String);
    procedure qrExprSumImpValCorte4Print(sender: TObject;
      var Value: String);
    procedure qrExprSumImpValCorte6Print(sender: TObject;
      var Value: String);
    procedure qrExprSumImpVal1Print(sender: TObject; var Value: String);
    procedure qrExprSumImpVal2Print(sender: TObject; var Value: String);
    procedure qrExprSumImpVal3Print(sender: TObject; var Value: String);
    procedure qrExprSumImpVal4Print(sender: TObject; var Value: String);
    procedure qrExprSumImpVal5Print(sender: TObject; var Value: String);
    procedure qrExprSumImpVal6Print(sender: TObject; var Value: String);
    procedure qrExprSumImpValCorte5Print(sender: TObject;
      var Value: String);
  private
    { Private declarations }
    m_dImp_Valuacion ,
    m_dGpoImp_Valuacion ,
    m_dImp_Credito ,
    m_dGranImp_Credito,
    m_dGranSdo_Gtia,
    m_dTotalImp_Valuacion,
    m_dSdo_Gtia,
    m_dSdo_Insoluto,
    m_dGranSdo_Insoluto : Double;

    m_nTotal : Integer;

    vgNumOpcion : Integer;    
    vgExcelAppPlano,
    vgExcelAppReporte : OleVariant;
    vgNumRow : Integer;
    vgFileNameExcel : String;

    vgExprSumImpValCorte1 ,
    vgExprSumImpValCorte2 ,
    vgExprSumImpValCorte3 ,
    vgExprSumImpValCorte4 ,
    vgExprSumImpValCorte5 ,
    vgExprSumImpValCorte6 ,
    vgExprSumImpVal1     ,
    vgExprSumImpVal2     ,
    vgExprSumImpVal3     ,
    vgExprSumImpVal4     ,
    vgExprSumImpVal5     ,
    vgExprSumImpVal6     ,
    vgExprSumImpVal7     : String;

    function ObtenPorcentaje : Double;
    function ObtenPorcentaje_x_Acreditado : Double;
    //</ RABA > 21 JUL 2011
    function ObtenDiasVencidos_x_credito(peIDCredito:String):String;
    // < RABA />
  public
    { Public declarations }
    vgBGeneraArchivoExcel : Boolean;
    vgBImpresionFinalizada : Boolean; // Esta bandera sirve para que no se vuelvan a grabar datos en el Excel, si se manda a imprimir fisicamente
    MostrarTotalAcreditado : Boolean;

    procedure IniciaArchivoExcel(peFileName : String; peNumOpcion : Integer);
    function  Cierra_Y_Guarda_ArchivoExcel : Boolean;
  end;

var
  FRpIntGtia: TFRpIntGtia;

implementation

uses IntMRepCau;

{$R *.DFM}

function ChangeZeroToWhiteSpace(penValue : Integer) : String;
begin
  If (penValue = 0) Then Result := ''
  Else Result := IntToStr(penValue);
end;


procedure TFRpIntGtia.QRGrpAcreditadoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 m_dImp_Valuacion := 0;
// </ RABA > 21 JUL 2011
 qrlblDiasImpago.Caption := ObtenDiasVencidos_x_credito(qCredIntGtia.FieldByName('ID_CREDITO').AsString);
// < RABA />
end;

function TFRpIntGtia.ObtenPorcentaje : Double;
var dTotal, dSdo_Grtia, dPorcentaje : Double;
begin
 dSdo_Grtia := qCredIntGtia.FieldByName('SDO_GRTIA').AsFloat;
 dTotal     := dSdo_Grtia - m_dImp_Valuacion;
 If (dSdo_Grtia = 0) Then dPorcentaje := 100
 Else dPorcentaje := (dTotal * 100) / dSdo_Grtia;
 Result := Abs(dPorcentaje);
end;

procedure TFRpIntGtia.qrExprSumImpVal7Print(sender: TObject; var Value: String);
var  strParentesis : String;
     vlValor : Double;
begin
 strParentesis := '';
 If ((qCredIntGtia.FieldByName('SDO_GRTIA').AsFloat - m_dImp_Valuacion) > 0) Then strParentesis := ')';
 vlValor := ObtenPorcentaje;
 Value := FloatToStr(vlValor) + strParentesis;
 vgExprSumImpVal7 := Format('%8.2f', [vlValor]) + strParentesis;
end;

procedure TFRpIntGtia.QRDBText23Print(sender: TObject; var Value: String);
begin
 If (UpperCase(Trim(Copy(Value,1,1))) = 'S') Then Value := '';
end;

procedure TFRpIntGtia.QRLabel38Print(sender: TObject; var Value: String);
begin
 Value := 'Total de Acreditado ' + qCredIntGtia.FieldByName('NOMBRE_ACREDITADO').AsString;
end;

procedure TFRpIntGtia.qrFooterAcreditadoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 PrintBand := MostrarTotalAcreditado;
 { Armado del LAYOUT (Archivo) del Acreditado }
 If PrintBand Then
  With qCredIntGtia Do
   Begin
   qrlblAcredIMP_CREDITO.Caption  := Format('%16.2m',[m_dImp_Credito]);
   qrlblAcredSDO_INSOLUTO.Caption := Format('%16.2m',[m_dSdo_Insoluto]);
   qrlblAcredSDO_GTIA.Caption     := Format('%16.2m',[m_dSdo_Gtia]);
   End;
end;

procedure TFRpIntGtia.qrImp_CreditoPrint(sender: TObject; var Value: String);
begin
 m_dImp_Credito     := m_dImp_Credito + qCredIntGtia.FieldByName('IMP_CREDITO').AsFloat;
 m_dGranImp_Credito := m_dGranImp_Credito + qCredIntGtia.FieldByName('IMP_CREDITO').AsFloat;
 m_dSdo_Gtia        := m_dSdo_Gtia + qCredIntGtia.FieldByName('SDO_GRTIA').AsFloat;
 m_dGranSdo_Gtia    := m_dGranSdo_Gtia + qCredIntGtia.FieldByName('SDO_GRTIA').AsFloat;
 m_dSdo_Insoluto    := m_dSdo_Insoluto + qCredIntGtia.FieldByName('SDO_INSOLUTO').AsFloat;
 m_dGranSdo_Insoluto:= m_dGranSdo_Insoluto + qCredIntGtia.FieldByName('SDO_INSOLUTO').AsFloat;
end;

procedure TFRpIntGtia.qrdbImp_ValuacionPrint(sender: TObject; var Value: String);
begin
 m_dImp_Valuacion      := m_dImp_Valuacion + qCredIntGtia.FieldByName('IMP_VALUACION').AsFloat;
 m_dGpoImp_Valuacion   := m_dGpoImp_Valuacion + qCredIntGtia.FieldByName('IMP_VALUACION').AsFloat;
 m_dTotalImp_Valuacion := m_dTotalImp_Valuacion + qCredIntGtia.FieldByName('IMP_VALUACION').AsFloat;
end;

procedure TFRpIntGtia.QRGrpNOMBRE_ACREDITADOBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 m_dImp_Credito := 0; m_dSdo_Gtia := 0; m_dGpoImp_Valuacion := 0; m_dSdo_Insoluto := 0;
 PrintBand := False;
end;

procedure TFRpIntGtia.qrlblImp_ValuacionPrint(sender: TObject; var Value: String);
begin
 Value := Format('%16.2m',[m_dGpoImp_Valuacion]);
end;

procedure TFRpIntGtia.qrlblTotalGroupPrint(sender: TObject; var Value: String);
var dTotal : Double;
begin
 dTotal := m_dSdo_Gtia - m_dGpoImp_Valuacion;
 If ((dTotal) > 0) Then Value := '('+Format('%16.2m',[Abs(dTotal)])+')'
 Else Value := Format('%16.2m',[Abs(dTotal)]);
 Value := Trim(Value);
end;

procedure TFRpIntGtia.QRLabel40Print(sender: TObject; var Value: String);
var dTotal : Double;
begin
 dTotal := m_dSdo_Gtia - m_dGpoImp_Valuacion;
 If ((dTotal) < 0) Then Value := 'SOBRANTE POR'
 Else Value := 'FALTANTE POR';
end;

function TFRpIntGtia.ObtenPorcentaje_x_Acreditado : Double;
var dTotal : Double;
begin
 dTotal   := m_dSdo_Gtia - m_dGpoImp_Valuacion;
 If (m_dSdo_Gtia = 0) Then Result := 100
 Else Result := (dTotal * 100) / m_dSdo_Gtia;
end;

procedure TFRpIntGtia.qrlblGpoPercentPrint(sender: TObject; var Value: String);
var dPorcentaje : Double;
begin
 dPorcentaje := ObtenPorcentaje_x_Acreditado;
 If (m_dSdo_Gtia - m_dGpoImp_Valuacion > 0) Then Value := ' ( %' + Format('%5.2f',[Abs(dPorcentaje)]) + ')'
 Else Value := '%' + Format('%5.2f',[Abs(dPorcentaje)]);
end;

procedure TFRpIntGtia.qrlblImp_CreditoPrint(sender: TObject; var Value: String);
begin
 Value := Format('%16.2m',[m_dGranImp_Credito]);
end;

procedure TFRpIntGtia.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 m_dGranImp_Credito := 0; m_dGranSdo_Gtia := 0; m_dTotalImp_Valuacion := 0;
 m_nTotal := 0; m_dSdo_Insoluto := 0; m_dGranSdo_Insoluto := 0;
end;

procedure TFRpIntGtia.qrlblTotalSdo_GtiaPrint(sender: TObject; var Value: String);
begin
 Value := Format('%16.2m',[m_dGranSdo_Gtia]);
end;

procedure TFRpIntGtia.qrlblTotalImp_ValuacionPrint(sender: TObject;
  var Value: String);
begin
 Value := Format('%16.2m',[m_dTotalImp_Valuacion]);
end;

procedure TFRpIntGtia.qrlblTotalPrint(sender: TObject; var Value: String);
var dValue : Real;
begin
 dValue := m_dGranSdo_Gtia - m_dTotalImp_Valuacion;
 If (dValue > 0) Then Value := '('+Format('%16.2m',[Abs(dValue)])+')'
 Else Value := Format('%16.2m',[Abs(dValue)]);
end;

procedure TFRpIntGtia.qrlblTotalSobrantePrint(sender: TObject;
  var Value: String);
var dTotal : Double;  
begin
 dTotal := m_dGranSdo_Gtia - m_dTotalImp_Valuacion;
 If ((dTotal) < 0) Then Value := 'SOBRANTE POR'
 Else Value := 'FALTANTE POR';
end;

procedure TFRpIntGtia.QRDBText11Print(sender: TObject; var Value: String);
begin
 Inc(m_nTotal);
end;

procedure TFRpIntGtia.QRLabel41Print(sender: TObject; var Value: String);
begin
 Value := 'Total de Créditos Mostrados '+IntToStr(m_nTotal);
end;

procedure TFRpIntGtia.qrlblTotalSdo_InsolutoPrint(sender: TObject;
  var Value: String);
begin
 Value := Format('%16.2m',[m_dGranSdo_Insoluto]);
end;

procedure TFRpIntGtia.QRDBText16Print(sender: TObject; var Value: String);
begin
  If qCredIntGtia.FieldByName('F_VENCIMIENTO_PAG').IsNull Then
    Value := '';
end;

procedure TFRpIntGtia.IniciaArchivoExcel(peFileName: String; peNumOpcion: Integer);
const aColumnWidth : Array[1..24] of Double = (  6.00,  3.14, 12.43, 13.14, 10.43,
                                                11.14,  29.71, 8.14, 8.14,  12.71,
                                                15.86, 15.29, 11.43,  8.57,  9.71,
                                                13.57,  9.14, 54.86, 14.57,  7.43,
//                                                 8.00,  8.86, 16.00                // RABA 21 JUL 2011 SE AGREGA LA COLUMNA DE DIAS VENCIDO
                                                 8.00,  8.86, 16.00, 14.57
                                              );

                                              // 'Promotor Diposición',  56.57,
                                              // 'Nombre del Otorgante de la Caución',   56.57,

      aColumnTitle : Array[1..24] of String = ( 'Origen de la Diposición', 'Situación de la Disposición', 'No. Disposición', 'No. Autorización', 'Cve. Moneda', 'Id. Acreditado',
                                                'Nombre del Acreditado',  'Fecha de Inicio', 'Fecha de Vencimiento'  , 'Tasa de Interés',
                                                'Importe del Crédito'  , 'Monto de la Línea' , 'Saldo Insoluto' , 'Proporción del Crédito', 'Tipo Cambio Disposición',
                                                'Saldo a Garantizar MN Valuado al Tipo de Cambio',
                                                'Contrato Otorgante de la Caución', 'Nombre del Otorgante de la Caución', 'Pagaré No Control', 'Pagaré Plazo Inversión',
                                                'Pagare Fecha Vencimiento', 'Valuación del Pagaré al Corte y al Tipo de Cambio', 'Valuación del Pagaré al Vencimiento y al Tipo de Cambio',
                                                'Días de Impago'                     // RABA 21 JUL 2011 SE AGREGA LA COLUMNA DE DIAS VENCIDO
                                                 );


      aColumnWidth1 : Array[1..28] of Double = (  3.71,  2.5,  5.86,  8.00, 29.14,
                                                  9.00, 10.29,  7.29, 11.14, 10.14,
                                                 10.43,  9.00, 12.71,  9.86, 0.17,
                                                 12.57,  6.71,  8.14,  0.75,  0.92,
                                                 11.00,  1.29,  9.86,  0.75,  0.92,
                                                 11.00,  1.29,  9.86
                                                );

      aColumnTitle1 : Array[1..28] of String = ( '','Sit.','Crédito','Contrato','Acreditado',
                                                 'Fecha de Inicio','Fecha de Vencimiento','Tasa de Interés','Importe del Crédito','Monto de la línea',
                                                 'Saldo Insoluto','Proporción del Crédito','Tipo Cambio','Saldo a Garantizar','',
                                                 'No. Control','Plazo Inv.','Fecha Venc.','Valuación al Corte','','','','',
                                                 'Valuación','','','',''
                                               );

var vlColumnRange : Variant;
    vlRange : Variant;
    vlCol : Integer;
begin
  vgNumRow := 1;
  vgFileNameExcel := peFileName;
  vgNumOpcion     := peNumOpcion;

  Case peNumOpcion  Of
    0 : Begin
          vgExcelAppPlano := CreateOleObject('Excel.Application');
          vgExcelAppPlano.Workbooks.Add;

          vlColumnRange := vgExcelAppPlano.Workbooks[1].WorkSheets[1].Columns;
          // Coloca el ancho de las columnas
          For vlCol := 1 To High(aColumnWidth) Do
            Begin
            vlColumnRange.Columns[vlCol].Font.Size     := 8;
            vlColumnRange.Columns[vlCol].ColumnWidth   := aColumnWidth[vlCol];
            vgExcelAppPlano.Cells[ vgNumRow , vlCol ].Value := aColumnTitle[vlCol]; // Coloca el título de las columna
            End;

          vgExcelAppPlano.Range['A'+IntToStr(vgNumRow)+':'+IntToColumnXlS(High(aColumnTitle))+IntToStr(vgNumRow)].Font.Bold  := True;
          vgExcelAppPlano.Range['A'+IntToStr(vgNumRow)+':'+IntToColumnXlS(High(aColumnTitle))+IntToStr(vgNumRow)].Font.Color := clWhite;
          vlRange := vgExcelAppPlano.Workbooks[1].WorkSheets[1].Range['A'+IntToStr(vgNumRow)+':'+IntToColumnXlS(High(aColumnTitle))+IntToStr(vgNumRow)];
          vlRange.Columns.Interior.ColorIndex := 1;
          // Se aumenta un renglon más en donde dara inicio la colocación de la información
          Inc(vgNumRow);
        End;

    1 : Begin
          vgExcelAppReporte := CreateOleObject('Excel.Application');
          vgExcelAppReporte.Workbooks.Add;

          //Coloca Color Blanco
          vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['A1:AB20000'];
          vlRange.Columns.Interior.ColorIndex := 2; // White
          //Coloca Color Gris Oscuro
          vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['AC1:AF20000'];
          vlRange.Columns.Interior.ColorIndex := 16; // Color Gris
          //Coloca Linea Negra
          vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['O1:O20000'];
          vlRange.Columns.Interior.ColorIndex := 1; // Color Negro

          vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['Q1:R1'];
          vlRange.MergeCells := True;
          vlRange.HorizontalAlignment:= xlHAlignCenter;
          vlRange.Value     := 'Datos del Pagaré';
          vlRange.Font.Bold := True;
          vlRange.Font.Size     := 8;

          vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['S1:W1'];
          vlRange.MergeCells := True;
          vlRange.HorizontalAlignment:= xlHAlignCenter;
          vlRange.Value     := 'Al Corte';
          vlRange.Columns.Interior.ColorIndex := 16; // Color Gris
          vlRange.Font.Bold := True;
          vlRange.Font.Size     := 8;

          vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['X1:AB1'];
          vlRange.MergeCells := True;
          vlRange.HorizontalAlignment:= xlHAlignCenter;          
          vlRange.Value     := 'Al Corte';
          vlRange.Columns.Interior.ColorIndex := 1; // Color Negro
          vlRange.Font.Bold := True;
          vlRange.Font.Color := clWhite;
          vlRange.Font.Size     := 8;

          vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['S2:W2'];
          vlRange.MergeCells := True;
          vlRange.Value     := 'Valuación al Corte';
          vlRange.Font.Bold := True;
          vlRange.Font.Size     := 8;

          vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['X2:AB2'];
          vlRange.MergeCells := True;
          vlRange.Value     := 'Valuación';
          vlRange.Font.Bold := True;
          vlRange.Font.Size     := 8;

          Inc(vgNumRow);
          vlColumnRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Columns;
          // Coloca el ancho de las columnas
          For vlCol := 1 To High(aColumnWidth1) Do
            Begin
            vlColumnRange.Columns[vlCol].Font.Size     := 8;
            vlColumnRange.Columns[vlCol].ColumnWidth   := aColumnWidth1[vlCol];
            vgExcelAppReporte.Cells[ vgNumRow , vlCol ].Value := aColumnTitle1[vlCol]; // Coloca el título de las columna

            // Si cuenta con titulo.. si coloca el marco
            If (Trim(aColumnTitle1[vlCol]) <> '') Then
              Begin
              //Coloca marco a las columnas de titulos
              vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range[IntToColumnXlS(vlCol)+IntToStr(vgNumRow)+':'+IntToColumnXlS(vlCol)+IntToStr(vgNumRow)];
              vlRange.HorizontalAlignment:= xlHAlignCenter;
              vlRange.Borders[xlLeft].Weight:= xlThin;
              vlRange.Borders[xlRight].Weight:= xlThin;
              vlRange.Borders[xlTop].Weight:= xlThin;
              vlRange.Borders[xlBottom].Weight:= xlThin;
              End;
            End;

          vgExcelAppReporte.Range['A'+IntToStr(vgNumRow)+':'+IntToColumnXlS(High(aColumnTitle1))+IntToStr(vgNumRow)].Font.Bold  := True;
          vgExcelAppReporte.Range['A'+IntToStr(vgNumRow)+':'+IntToColumnXlS(High(aColumnTitle1))+IntToStr(vgNumRow)].Font.Color := clBlack;
          vgExcelAppReporte.Range['A'+IntToStr(vgNumRow)+':'+IntToColumnXlS(High(aColumnTitle1))+IntToStr(vgNumRow)].WrapText := true;
          vgExcelAppReporte.Rows[vgNumRow].RowHeight := 40;
          // Se aumenta un renglon más en donde dara inicio la colocación de la información
          Inc(vgNumRow);
        End;
   End;
end;

function TFRpIntGtia.Cierra_Y_Guarda_ArchivoExcel: Boolean;
begin
  Result := False;
  // Valida si se genera o no el Archivo de Excel
  If (Not vgBGeneraArchivoExcel) Then Exit;

  Case vgNumOpcion Of
    0 : Begin
        vgExcelAppPlano.ActiveWorkBook.SaveAs(vgFileNameExcel);
        Result := CloseExcelFile(vgExcelAppPlano);
        End;

    1 : Begin
        vgExcelAppReporte.ActiveWorkBook.SaveAs(vgFileNameExcel);
        Result := CloseExcelFile(vgExcelAppReporte);
        End;
  End;
end;


procedure TFRpIntGtia.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var vlRange : Variant;  
begin
  If BandPrinted And (vgNumOpcion = 1) And vgBGeneraArchivoExcel And Not vgBImpresionFinalizada Then
     Begin
     vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['B'+IntToStr(vgNumRow)+':AB'+IntToStr(vgNumRow)];
     vlRange.Font.Bold := True;
     vlRange.Columns.Interior.ColorIndex := 15; // Color Renglon Gris Plata
     vgExcelAppReporte.Cells[ vgNumRow, ColumnXlS('C') ].Value := qrlblPromotor.Caption + ' ' +
                                                                         qCredIntGtia.FieldByName('NOMBRE_PROMOTOR').AsString;
     Inc(vgNumRow);
     End;
end;

procedure TFRpIntGtia.QRGrpNOMBRE_ACREDITADOAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  If BandPrinted And (vgNumOpcion = 1) And vgBGeneraArchivoExcel And Not vgBImpresionFinalizada Then
    Begin
    Inc(vgNumRow);
    End;
end;

procedure TFRpIntGtia.QRGrpAcreditadoAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var vlStrF_INICIO, vlStrF_VENCIMIENTO : String;
begin
  If BandPrinted And (vgNumOpcion = 1) And vgBGeneraArchivoExcel And Not vgBImpresionFinalizada Then
    With qCredIntGtia Do
      Begin
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('E') ].Value := FieldByName('NOMBRE_ACREDITADO').AsString;
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('J') ].Value := FieldByName('CVE_MONEDA').AsInteger;
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('K') ].Value := FieldByName('DESC_MONEDA').AsString;
      Inc(vgNumRow);

      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('A') ].Value := FieldByName('CVE_ORIGEN').AsString;
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('B') ].Value := FieldByName('SIT_CREDITO').AsString;
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('C') ].Value := FieldByName('ID_CREDITO').AsInteger;
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('D') ].Value := FieldByName('ID_CONTRATO').AsInteger;
//</ RABA > 21 JUL 2011
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('E') ].Value := 'DIAS DE IMPAGO : ' + ObtenDiasVencidos_x_credito(FieldByName('ID_CREDITO').AsString);
//< RABA />
      vlStrF_INICIO := FormatDateTime('DD/MM/YYYY',FieldByName('F_INICIO').AsDateTime);
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('F') ].Value := vlStrF_INICIO;
//      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('F') ].NumberFormat := 'dd/mm/aaaa';

      vlStrF_VENCIMIENTO := FormatDateTime('DD/MM/YYYY',FieldByName('F_VENCIMIENTO').AsDateTime);
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('G') ].Value := vlStrF_VENCIMIENTO;
//      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('G') ].NumberFormat := 'dd/mm/aaaa';
      
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('H') ].Value := FieldByName('TASA_INTERES').AsString;
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('H') ].NumberFormat := '#,##0.00';
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('I') ].Value := FieldByName('IMP_CREDITO').AsFloat;
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('I') ].NumberFormat := '#,##0.00';
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('J') ].Value := FieldByName('IMP_DISPUESTO').AsFloat;
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('J') ].NumberFormat := '#,##0.00';
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('K') ].Value := FieldByName('SDO_INSOLUTO').AsFloat;
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('K') ].NumberFormat := '#,##0.00';
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('L') ].Value := FieldByName('FACT_PROPOR_GAR').AsFloat;
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('L') ].NumberFormat := '#,##0.00';
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('M') ].Value := FieldByName('TIPO_CAMBIO_CTO').AsFloat;
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('M') ].NumberFormat := '#,##0.0000';
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('N') ].Value := FieldByName('SDO_GRTIA').AsFloat;
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('N') ].NumberFormat := '#,##0.00';
      Inc(vgNumRow);

      vgExcelAppReporte.Cells[ vgNumRow, ColumnXlS('D') ].Value := qrlblContrato.Caption;
      vgExcelAppReporte.Cells[ vgNumRow, ColumnXlS('E') ].Value := qrlblOTORGANTE.Caption;
      vgExcelAppReporte.Cells[ vgNumRow, ColumnXlS('H') ].Value := qrlblPromotor1.Caption;
      Inc(vgNumRow);
      End;
end;

procedure TFRpIntGtia.QRBandDetailAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var vlStrF_INICIO, vlStrF_VENCIMIENTO : String;
begin
  If BandPrinted And vgBGeneraArchivoExcel And Not vgBImpresionFinalizada Then
    With qCredIntGtia Do
      Case vgNumOpcion  Of
        0 : Begin
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('A') ].Value := FieldByName('CVE_ORIGEN').AsString;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('B') ].Value := FieldByName('SIT_CREDITO').AsString;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('C') ].Value := FieldByName('ID_CREDITO').AsInteger;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('D') ].Value := FieldByName('ID_CONTRATO').AsInteger;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('E') ].Value := FieldByName('CVE_MONEDA').AsInteger;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('F') ].Value := FieldByName('ID_ACREDITADO').AsInteger;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('G') ].Value := FieldByName('NOMBRE_ACREDITADO').AsString;

            vlStrF_INICIO := FormatDateTime('DD/MM/YYYY',FieldByName('F_INICIO').AsDateTime);
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('H') ].Value := vlStrF_INICIO;
            // vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('H') ].NumberFormat := 'dd/mm/aaaa';

            vlStrF_VENCIMIENTO := FormatDateTime('DD/MM/YYYY',FieldByName('F_VENCIMIENTO').AsDateTime);
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('I') ].Value := vlStrF_VENCIMIENTO;
            // vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('I') ].NumberFormat := 'dd/mm/aaaa';

            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('J') ].Value := FieldByName('TASA_INTERES').AsString;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('J') ].NumberFormat := '#,##0.00';
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('K') ].Value := FieldByName('IMP_CREDITO').AsFloat;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('K') ].NumberFormat := '#,##0.00';
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('L') ].Value := FieldByName('IMP_DISPUESTO').AsFloat;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('L') ].NumberFormat := '#,##0.00';
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('M') ].Value := FieldByName('SDO_INSOLUTO').AsFloat;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('M') ].NumberFormat := '#,##0.00';
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('N') ].Value := FieldByName('FACT_PROPOR_GAR').AsFloat;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('N') ].NumberFormat := '#,##0.00';
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('O') ].Value := FieldByName('TIPO_CAMBIO_CTO').AsFloat;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('O') ].NumberFormat := '#,##0.0000';
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('P') ].Value := FieldByName('SDO_GRTIA').AsFloat;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('P') ].NumberFormat := '#,##0.00';
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('Q') ].Value  := FieldByName('OTORGANTE').AsInteger;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('R') ].Value  := FieldByName('NOMBRE_OTORGANTE').AsString;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('S') ].Value  := FieldByName('ID_PAGARE').AsInteger;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('T') ].Value  := FieldByName('DIAS_PLAZO_PAG').AsInteger;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('T') ].NumberFormat := '#,##0';            
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('U') ].Value  := FieldByName('F_VENCIMIENTO_PAG').AsString;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('V') ].Value  := FieldByName('IMP_VALUACION_CORTE').AsFloat;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('V') ].NumberFormat := '#,##0.00';
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('W') ].Value  := FieldByName('IMP_VALUACION').AsFloat;
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('W') ].NumberFormat := '#,##0.00';
//</ RABA > 21 JUL 2011
            vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('X') ].Value := ObtenDiasVencidos_x_credito(FieldByName('ID_CREDITO').AsString);
//< RABA />
            Inc(vgNumRow);
            End;

        1 : Begin
            vgExcelAppReporte.Cells[ vgNumRow, ColumnXlS('D') ].Value := ChangeZeroToWhiteSpace(FieldByName('OTORGANTE').AsInteger);
            vgExcelAppReporte.Cells[ vgNumRow, ColumnXlS('E') ].Value := FieldByName('NOMBRE_OTORGANTE').AsString;
            vgExcelAppReporte.Cells[ vgNumRow, ColumnXlS('H') ].Value := FieldByName('PROMOTOR').AsString;

            vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('P') ].Value  := ChangeZeroToWhiteSpace(FieldByName('ID_PAGARE').AsInteger);
            vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('Q') ].Value  := ChangeZeroToWhiteSpace(FieldByName('DIAS_PLAZO_PAG').AsInteger);
            vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('Q') ].NumberFormat := '#,##0';
            vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('R') ].Value  := FieldByName('F_VENCIMIENTO_PAG').AsString;
            vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('U') ].Value  := FieldByName('IMP_VALUACION_CORTE').AsFloat;
            vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('U') ].NumberFormat := '#,##0.00';
            vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('Z') ].Value  := FieldByName('IMP_VALUACION').AsFloat;
            vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('Z') ].NumberFormat := '#,##0.00';
            Inc(vgNumRow);
            End;
      End;
end;

procedure TFRpIntGtia.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var vlRange : Variant;
begin
  // vlRange.HorizontalAlignment:= xlHAlignCenter;

  If BandPrinted And (vgNumOpcion = 1) And vgBGeneraArchivoExcel And Not vgBImpresionFinalizada Then
    With qCredIntGtia Do
      Begin
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('U') ].Value := vgExprSumImpValCorte1;
      vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['U'+IntToStr(vgNumRow)+':'+'U'+IntToStr(vgNumRow)];
      vlRange.Borders[xlTop].Weight:= xlThin;

      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('Z') ].Value := vgExprSumImpVal1;
      vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['Z'+IntToStr(vgNumRow)+':'+'Z'+IntToStr(vgNumRow)];
      vlRange.Borders[xlTop].Weight:= xlThin;

      Inc(vgNumRow);

      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('S') ].Value := vgExprSumImpValCorte2;  //
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('X') ].Value := vgExprSumImpVal2;       //
      Inc(vgNumRow);

      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('T') ].Value := vgExprSumImpValCorte3;
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('U') ].Value := vgExprSumImpValCorte4;
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('V') ].Value := Chr(39) + vgExprSumImpValCorte5 + ' ' + vgExprSumImpValCorte6 + vgExprSumImpVal7;

      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('Y') ].Value := vgExprSumImpVal3;
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('Z') ].Value := vgExprSumImpVal4;
      vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('AA') ].Value := Chr(39) + vgExprSumImpVal5 + ' ' + vgExprSumImpVal6 + vgExprSumImpVal7;
      Inc(vgNumRow);

      vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['B'+IntToStr(vgNumRow)+':AB'+IntToStr(vgNumRow)];
      vlRange.Columns.Interior.ColorIndex := 1; // Color Negro
      vgExcelAppReporte.Rows[vgNumRow].RowHeight := 1.50;
      Inc(vgNumRow);
      End;
end;

procedure TFRpIntGtia.qrFooterAcreditadoAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
 {}
end;

procedure TFRpIntGtia.QRFooterPromotorAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
 {}
end;

procedure TFRpIntGtia.QRSummaryAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
 {}
end;

procedure TFRpIntGtia.qrExprSumImpValCorte1Print(sender: TObject;
  var Value: String);
begin
  vgExprSumImpValCorte1 := Value;
end;

procedure TFRpIntGtia.qrExprSumImpValCorte2Print(sender: TObject;
  var Value: String);
begin
  vgExprSumImpValCorte2 := Value;
end;

procedure TFRpIntGtia.qrExprSumImpValCorte3Print(sender: TObject;
  var Value: String);
begin
  vgExprSumImpValCorte3 := Value;
end;

procedure TFRpIntGtia.qrExprSumImpValCorte4Print(sender: TObject;
  var Value: String);
begin
  vgExprSumImpValCorte4 := Value;
end;

procedure TFRpIntGtia.qrExprSumImpValCorte5Print(sender: TObject;
  var Value: String);
begin
  vgExprSumImpValCorte5 := Value;
end;

procedure TFRpIntGtia.qrExprSumImpValCorte6Print(sender: TObject;
  var Value: String);
begin
  vgExprSumImpValCorte6 := Value;
end;

procedure TFRpIntGtia.qrExprSumImpVal1Print(sender: TObject;
  var Value: String);
begin
  vgExprSumImpVal1 := Value;
end;

procedure TFRpIntGtia.qrExprSumImpVal2Print(sender: TObject;
  var Value: String);
begin
  vgExprSumImpVal2 := Value;
end;

procedure TFRpIntGtia.qrExprSumImpVal3Print(sender: TObject;
  var Value: String);
begin
  vgExprSumImpVal3 := Value;
end;

procedure TFRpIntGtia.qrExprSumImpVal4Print(sender: TObject;
  var Value: String);
begin
  vgExprSumImpVal4 := Value;
end;

procedure TFRpIntGtia.qrExprSumImpVal5Print(sender: TObject;
  var Value: String);
begin
  vgExprSumImpVal5 := Value;
end;

procedure TFRpIntGtia.qrExprSumImpVal6Print(sender: TObject;
  var Value: String);
begin
  vgExprSumImpVal6 := Value;
end;

function TFRpIntGtia.ObtenDiasVencidos_x_credito(peIDCredito:String): String;
var
  vlsql : string;
begin
  Result := '';
  if qCredIntGtia.FieldByName('CVE_ORIGEN').AsString = 'ICRE' then
  begin
      vlsql := 'select nvl(max(dias),0) diasvencido from ' +
               '(select nvl(num_dias_vencido,0) dias ' +
               ' from cr_capital where id_credito = ' + peIDCredito +
               '   and num_periodo = (select min(num_periodo) from cr_capital ' +
               '                      where  id_credito = ' + peIDCredito + ' and  sit_capital = ''IM'') ' +
               ' union ' +
               ' select nvl(num_dias_vencido,0) dias ' +
               ' from cr_interes where id_credito = ' + peIDCredito +
               '   and num_periodo = (select min(num_periodo) from cr_interes ' +
               '                      where  id_credito = ' + peIDCredito + ' and  sit_interes = ''IM'') ' +
               ' union ' +
               ' select nvl(num_dias_vencido,0) dias ' +
               ' from cr_comision where id_credito = ' + peIDCredito +
               '   and num_periodo = (select min(num_periodo) from cr_comision ' +
               '                      where  id_credito = ' + peIDCredito + ' and  sit_comision = ''IM'') ' +
               ' union ' +
               ' select nvl(num_dias_vencido,0) dias ' +
               ' from cr_finan_adic where id_credito = ' + peIDCredito +
               '   and num_periodo = (select min(num_periodo) from cr_finan_adic ' +
               '                      where  id_credito = ' + peIDCredito + ' and  sit_finan_adic = ''IM'') ) ';

      qryDiasVencido.SQL.Clear;
      qryDiasVencido.SQL.Add(vlsql);
      qryDiasVencido.Open;

      result := qryDiasVencido.FieldByName('DIASVENCIDO').AsString;

      qryDiasVencido.Close;
  end
  else
  begin
      vlsql := 'SELECT MAX(DIASIMPAGO) DIASVENCIDO ' +
               ' FROM(  ' +
               '   SELECT PKGCRCOMUN.STPOBTENFECHA(CTO.ID_EMPRESA,''D000'') - Min(CCP.F_VENCIMIENTO) DIASIMPAGO ' +
               '   FROM CRE_CREDITO CRE, CONTRATO CTO, CRE_CAPITAL CCP ' +
               '   WHERE CRE.ID_CONTRATO = CTO.ID_CONTRATO ' +
               '     AND CCP.ID_CREDITO  = CRE.ID_CREDITO ' +
               '     AND CRE.ID_CREDITO  = ' + peIDCredito +
               '     AND CCP.SIT_CAPITAL = ''IM''  ' +
               '   GROUP BY CTO.ID_EMPRESA ' +
               '   UNION ' +
               '   SELECT PKGCRCOMUN.STPOBTENFECHA(CTO.ID_EMPRESA,''D000'') - MIN(CIN.F_VENCIMIENTO) DIASIMPAGO ' +
               '   FROM CRE_CREDITO CRE, CONTRATO CTO, CRE_INTERES CIN ' +
               '   WHERE CRE.ID_CONTRATO = CTO.ID_CONTRATO ' +
               '     AND CIN.ID_CREDITO  = CRE.ID_CREDITO ' +
               '     AND CRE.ID_CREDITO  = ' + peIDCredito +
               '     AND CIN.SIT_INTERES = ''IM'' ' +
               '   GROUP BY CTO.ID_EMPRESA ' +
               '   UNION ' +
               '   SELECT PKGCRCOMUN.STPOBTENFECHA(CTO.ID_EMPRESA,''D000'') - MIN(CCO.F_VENCIMIENTO) DIASIMPAGO ' +
               '   FROM CRE_CREDITO CRE, CONTRATO CTO, CRE_DET_COMISION CCO ' +
               '   WHERE CRE.ID_CONTRATO = CTO.ID_CONTRATO ' +
               '     AND CCO.ID_CREDITO  = CRE.ID_CREDITO ' +
               '     AND CRE.ID_CREDITO  = ' + peIDCredito +
               '     AND CCO.SIT_COMISION = ''IM'' ' +
               '   GROUP BY CTO.ID_EMPRESA) ';
      qryDiasVencido.SQL.Clear;
      qryDiasVencido.SQL.Add(vlsql);
      qryDiasVencido.Open;

      result := qryDiasVencido.FieldByName('DIASVENCIDO').AsString;

      qryDiasVencido.Close;
  end;
end;

end.
