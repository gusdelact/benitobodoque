unit IntMQrDispLiq;
interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, unSQL2, cOMoBJ, IntXls;
Const
   coCRLF      = #13#10;
type
  TQrDispLiq = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyDispLiq: TQuery;
    ColumnHeaderBand1: TQRBand;
    QRShape17: TQRShape;
    QRLabel20: TQRLabel;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel4: TQRLabel;
    QRShape6: TQRShape;
    QRLabel6: TQRLabel;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRLabel9: TQRLabel;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRShape12: TQRShape;
    QRLabel13: TQRLabel;
    qrbDETALLE: TQRBand;
    QRDBText23: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape2: TQRShape;
    QRLabel11: TQRLabel;
    qyDispLiqID_CREDITO: TFloatField;
    qyDispLiqID_CONTRATO: TFloatField;
    qyDispLiqNOMBRE: TStringField;
    qyDispLiqF_AUTORIZA: TDateTimeField;
    qyDispLiqIMP_CREDITO: TFloatField;
    qyDispLiqTIPO_DISPOSICION: TStringField;
    qyDispLiqCVE_TIPO_ALTA: TStringField;
    qyDispLiqSOBRETASA: TFloatField;
    qyDispLiqTASA_APLICADA: TFloatField;
    qyDispLiqCVE_TASA: TStringField;
    qyDispLiqMONEDA: TStringField;
    qyDispLiqF_TRASPASO_VENC: TDateTimeField;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    procedure qrbDETALLEBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDETALLEAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

    Function FormaQuery(sF_Inicial, sF_Final : String):String;


  end;

var
  QrDispLiq: TQrDispLiq;
  bGenArch: Boolean;
  F: TextFile;
  sArchivo : String;

  vgnRowExcel : Integer;
  vgB_SALIDA_EXCEL : Boolean;
  vgExcelApp : OleVariant;
  vgFileName : String;
  vgfinicial, vgffinal, vgcveusu : String;

  Procedure  RepLiqDispo(sF_Inicial, sF_Final,
                        peFileName :String;
                        pAPli : TInterApli;
                        pPreview : Boolean);

  var
  vlcount : Integer;


Implementation
{$R *.DFM}

Procedure RepLiqDispo(sF_Inicial, sF_Final,
                     peFileName :String;
                     pAPli : TInterApli;
                     pPreview : Boolean);
Var
   QrDispLiq : TQrDispLiq;
   Preview   : TIntQRPreview;

Begin
   QrDispLiq:=TQrDispLiq.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrDispLiq);
   Try

      vgfinicial := sF_Inicial;
      vgffinal  :=  sF_Final;

      bGenArch:= False;
      sArchivo:= peFileName;
      QrDispLiq.QRInterEncabezado1.Apli:=pApli;
      QrDispLiq.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrDispLiq.QRInterEncabezado1.NomReporte:='IntMQrDispLiq';
      QrDispLiq.QRInterEncabezado1.Titulo1:='Reporte de Liquidaciones - Colocaciones';
      QrDispLiq.QRInterEncabezado1.Titulo2:='Fecha del '+sF_Inicial+' al '+ sF_Final;

      QrDispLiq.qyDispLiq.DatabaseName := pApli.DataBaseName;
      QrDispLiq.qyDispLiq.SessionName := pApli.SessionName;

      QrDispLiq.qyDispLiq.Active:=False;
      QrDispLiq.qyDispLiq.SQL.Text:= QrDispLiq.FormaQuery(sF_Inicial, sF_Final) ;
      QrDispLiq.qyDispLiq.SQL.SaveToFile('C:\RepLiqDispo.sql');
      QrDispLiq.qyDispLiq.Active:=True;

      // Válida la generación del Archivo Excel
        vgB_SALIDA_EXCEL :=(Trim(peFileName) <> '');
      If (vgB_SALIDA_EXCEL) Then
       Begin
        vgFileName := peFileName;
        vgExcelApp := CreateOleObject('Excel.Application');
        vgExcelApp.Workbooks.Add;
       End;

      If pPreview Then
         QrDispLiq.Preview
      Else
         QrDispLiq.Print;
   Finally
      If (vgB_SALIDA_EXCEL) Then Begin
         bGenArch:= True;
//         CloseFile(F);
        vgExcelApp.ActiveWorkBook.SaveAs(peFileName);
        CloseExcelFile(vgExcelApp);
      End;
      QrDispLiq.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrDispLiq.FormaQuery(sF_Inicial, sF_Final : String ):String;
Var
    sSQL:String;
Begin

    sSQL:= ' SELECT cc.id_credito, cc.id_contrato, p.nombre, cc.f_autoriza, cc.imp_credito,' +coCRLF+
           '        cc.tipo_disposicion, cc.cve_tipo_alta, cc.sobretasa, chc.tasa_aplicada,' +coCRLF+
           '        cc.cve_tasa_refer AS cve_tasa, (select desc_moneda from moneda where cve_moneda = cto.cve_moneda) as moneda,' +coCRLF+
           '        chc.f_traspaso_venc' +coCRLF+
           '   FROM cr_credito cc, contrato cto, persona p, cr_histo_cred chc' +coCRLF+
           '  WHERE f_autoriza BETWEEN ' +SQLFecha(StrToDate(sF_Inicial))+' and '+SQLFecha(StrToDate(sF_Final))+ coCRLF+
           '    AND cto.id_contrato = cc.id_contrato' +coCRLF+
           '    AND cto.id_titular = p.id_persona' +coCRLF+
           '    AND chc.id_credito = cc.id_credito' +coCRLF+
           '    AND chc.f_cierre = cc.f_autoriza' +coCRLF+
           ' UNION ALL' +coCRLF+
           ' SELECT cc.id_credito, cc.id_contrato, p.nombre, cc.f_liquidacion as f_autoriza,' +coCRLF+
           '        chc.sdo_vig_total, ''LQ'' AS tipo_disposicion, cc.cve_tipo_baja,' +coCRLF+
           '        cc.sobretasa, chc.tasa_aplicada,' +coCRLF+
           '        cc.cve_tasa_refer AS cve_tasa, (select desc_moneda from moneda where cve_moneda = cto.cve_moneda) as moneda,' +coCRLF+
           '        chc.f_traspaso_venc' +coCRLF+
           '   FROM cr_credito cc, contrato cto, persona p, cr_histo_cred chc' +coCRLF+
           '  WHERE f_liquidacion BETWEEN ' +SQLFecha(StrToDate(sF_Inicial))+' and '+SQLFecha(StrToDate(sF_Final))+ coCRLF+
           '    AND cto.id_contrato = cc.id_contrato' +coCRLF+
           '    AND cto.id_titular = p.id_persona' +coCRLF+
           '    AND chc.id_credito = cc.id_credito' +coCRLF+
           '    AND chc.f_cierre = cc.f_autoriza '+coCRLF;

    Result:= sSQL;
End;


procedure TQrDispLiq.qrbDETALLEBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vlfechcanc : String;
begin

end;

procedure TQrDispLiq.qrbDETALLEAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  If vgB_SALIDA_EXCEL Then
   Begin
    Inc(vgnRowExcel);
    If Not (qyDispLiq.FieldByName('ID_CREDITO').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A' )].Value := qyDispLiq.FieldByName('ID_CREDITO').AsString;
    If Not (qyDispLiq.FieldByName('ID_CONTRATO').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('B' )].Value := qyDispLiq.FieldByName('ID_CONTRATO').AsString;
    If Not (qyDispLiq.FieldByName('NOMBRE').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('C' )].Value := qyDispLiq.FieldByName('NOMBRE').AsString;
    If Not (qyDispLiq.FieldByName('F_AUTORIZA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('D' )].Value := FormatDateTime('DD/MM/YYYY',qyDispLiq.FieldByName('F_AUTORIZA').AsDateTime);
    If Not (qyDispLiq.FieldByName('IMP_CREDITO').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('E' )].Value := qyDispLiq.FieldByName('IMP_CREDITO').AsFloat;
    If Not (qyDispLiq.FieldByName('TIPO_DISPOSICION').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('F' )].Value := qyDispLiq.FieldByName('TIPO_DISPOSICION').AsString;
    If Not (qyDispLiq.FieldByName('CVE_TIPO_ALTA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('G' )].Value := qyDispLiq.FieldByName('CVE_TIPO_ALTA').AsString;
    If Not (qyDispLiq.FieldByName('SOBRETASA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('H' )].Value := FormatFloat('##0.0000',qyDispLiq.FieldByName('SOBRETASA').AsFloat);
    If Not (qyDispLiq.FieldByName('TASA_APLICADA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('I' )].Value := FormatFloat('##0.0000',qyDispLiq.FieldByName('TASA_APLICADA').AsFloat);
    If Not (qyDispLiq.FieldByName('CVE_TASA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('J' )].Value := qyDispLiq.FieldByName('CVE_TASA').AsString;
    If Not (qyDispLiq.FieldByName('MONEDA').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('K' )].Value := qyDispLiq.FieldByName('MONEDA').AsString;
    If Not (qyDispLiq.FieldByName('F_TRASPASO_VENC').IsNull) Then
     vgExcelApp.Cells[vgnRowExcel,ColumnXlS('L' )].Value := FormatDateTime('DD/MM/YYYY',qyDispLiq.FieldByName('F_TRASPASO_VENC').AsDateTime);
   End;
end;

procedure TQrDispLiq.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
    qyDispLiq.First;
 If (vgB_SALIDA_EXCEL) Then
      Begin
      vgExcelApp.Cells[1,ColumnXlS('A' )].Value := 'BANCO INTERACCIONES, S.A.';
      vgExcelApp.Cells[2,ColumnXlS('A' )].Value := 'Reporte de Liquidaciones - Colocaciones';
      vgExcelApp.Cells[3,ColumnXlS('A' )].Value := 'Fecha del '+vgfinicial+' al '+vgffinal;
                                                                                           
      vgnRowExcel := 6;
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('A' )].Value := 'CRÉDITO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('B' )].Value := 'CONTRATO';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('C' )].Value := 'NOMBRE';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('D' )].Value := 'F. AUTORIZA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('E' )].Value := 'IMPORTE';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('F' )].Value := 'TIPO DISPOSICIÓN';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('G' )].Value := 'CVE. TIPO ALTA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('H' )].Value := 'SOBRETASA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('I' )].Value := 'TASA APLICADA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('J' )].Value := 'CVE. TASA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('K' )].Value := 'MONEDA';
      vgExcelApp.Cells[vgnRowExcel,ColumnXlS('L' )].Value := 'F. TRASPASO VENC.';

      vgExcelApp.Range['A1:A4'].Font.Bold := True;
      vgExcelApp.Range['A1:A4'].Font.Name := 'Verdana';
      vgExcelApp.Range['A1:A4'].Font.Size := 8;

      vgExcelApp.Range['A6:Z6'].Font.Bold := True;
      vgExcelApp.Range['A6:Z6'].VerticalAlignment   := xlVAlignCenter;
      vgExcelApp.Range['A6:Z6'].HorizontalAlignment := xlHAlignCenter;
      vgExcelApp.Range['A6:Z6'].Wraptext := True;
      vgExcelApp.Range['A6:Z6'].RowHeight := 22.00; // La medida esta en Pixeles

      vgExcelApp.Range['A6:E6'].ColumnWidth := 15.14; // La medida esta en Pixeles
      vgExcelApp.Range['G6:K6'].ColumnWidth := 15.14; // La medida esta en Pixeles
      vgExcelApp.Range['F6'].ColumnWidth := 12.57; // La medida esta en Pixeles
      vgExcelApp.Range['L6'].ColumnWidth := 12.57; // La medida esta en Pixeles


      vgExcelApp.Range['A6:Z65536'].Font.Name := 'Verdana';
      vgExcelApp.Range['A6:Z65536'].Font.Size := 8;

      vgExcelApp.Range['E7:E65536'].Style := 'Currency';
      vgExcelApp.Range['D7:D65536'].HorizontalAlignment := xlHAlignCenter;//xlLeft;
      vgExcelApp.Range['L7:L65536'].HorizontalAlignment := xlHAlignCenter;//xlLeft;
      vgExcelApp.Range['F7:F65536'].HorizontalAlignment := xlHAlignCenter;//xlLeft;
      vgExcelApp.Range['J7:J65536'].HorizontalAlignment := xlHAlignCenter;//xlLeft;            
      End;
end;

End.
