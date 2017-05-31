Unit IntMQrBlqma;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport, Dialogs,

  ComObj,
  IntXls,
  ShellApi,
  IntConSaldo   // Saldo del Contrato
  ;

Type
  TQrBlqma = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qryBlqma: TQuery;
    qrlblCveOrigen: TQRShape;
    qrlblOrigen: TQRLabel;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qrshpSit: TQRShape;
    qrlblSit: TQRLabel;
    qrshpID_CREDITO: TQRShape;
    qrlblID_CREDITO: TQRLabel;
    qrshpID_CONTRATO: TQRShape;
    qrlblID_CONTRATO: TQRLabel;
    qrshpNOM_ACREDITADO: TQRShape;
    qrlblNOM_ACREDITADO: TQRLabel;
    qrshpID_ACREDITADO: TQRShape;
    qrlblID_ACREDITADO: TQRLabel;
    qrshpF_REALIZADO: TQRShape;
    qrlblF_REALIZADO: TQRLabel;
    qrShpCVE_CONCEPTO_BLQ: TQRShape;
    qrlblCVE_CONCEPTO_BLQ: TQRLabel;
    qrshpCVE_USU_REALIZADO: TQRShape;
    qrlblCVE_USU_REALIZADO: TQRLabel;
    qrshpIMP_SALDO: TQRShape;
    qrlblIMP_SALDO: TQRLabel;
    qrGrpHeaderCVE_MONEDA: TQRGroup;
    qrGrpFooterCVE_MONEDA: TQRBand;
    qrshpCVE_MONEDA: TQRShape;
    qrlblCVE_MONEDA: TQRLabel;
    qrdbCVE_MONEDA: TQRDBText;
    qrlblCVE_MONEDA1: TQRLabel;
    qrdbDESC_MONEDA: TQRDBText;
    qrGrpHeaderID_CONTRATO_DV: TQRGroup;
    qrShpID_CONTRATO_DV: TQRShape;
    qrlblID_CONTRATO_DV: TQRLabel;
    qrdbID_CONTRATO_DV: TQRDBText;
    qrdbNOM_TITULAR: TQRDBText;
    qrGrpFooterID_CONTRATO_DV: TQRBand;
    qrlblNOM_TITULAR: TQRLabel;
    QRGroup1: TQRGroup;
    qrshpDESC_AFECTACION: TQRShape;
    qrdbDESC_AFECTACION: TQRDBText;
    QrGrpB_RESUMEN: TQRGroup;
    qrlblNOM_TITULAR2: TQRLabel;
    qrdbNOM_TITULAR1: TQRDBText;
    qrdbCVE_MONEDA_DV: TQRDBText;
    qrdbDESC_MONEDA_DV: TQRDBText;
    qrlblRESUMEN: TQRLabel;
    qrlblDESC_MONEDA_DV: TQRLabel;
    QRBandDetail: TQRBand;
    qrdbCVE_ORIGEN: TQRDBText;
    qrdSIT_CREDITO: TQRDBText;
    qrdbID_CREDITO: TQRDBText;
    qrdbID_CONTRATO: TQRDBText;
    qrdbID_ACREDITADO: TQRDBText;
    qrdbNOM_ACREDITADO: TQRDBText;
    qrdbFH_ACTIVACION: TQRDBText;
    qrdbCVE_USU_ACTIVACION: TQRDBText;
    qrdbDESC_BLQ_CPTO: TQRDBText;
    qrdbIMP_SALDO: TQRDBText;
    qrGrpFooterB_RESUMEN: TQRBand;
    qrlblNOM_TITULAR3: TQRLabel;
    qrlblTXT_IMP_SUM_SALDO: TQRLabel;
    QRShape4: TQRShape;
    qrdbID_CONTRATO_DV1: TQRDBText;
    qrdbID_CONTRATO_DV2: TQRDBText;
    qrShpHorLine_B_RESUMEN: TQRShape;
    qrShpVerLine_Izq_B_RESUMEN: TQRShape;
    qrShpVerLine_Der_B_RESUMEN: TQRShape;
    qrShpVerLine_Izq_DETAIL: TQRShape;
    qrShpVerLine_Der_DETAIL: TQRShape;
    qrShpHorLine_B_RESUMEN_Foot: TQRShape;
    qrShpVerLine_Der_B_RESUMEN_Foot: TQRShape;
    qrShpVerLine_Izq_B_RESUMEN_Foot: TQRShape;
    qrlblIMP_SUM_SALDO: TQRLabel;
    qrlblIMP_DISPONIBLE: TQRLabel;
    procedure QRBandDetailAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGrpFooterID_CONTRATO_DVBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QrGrpB_RESUMENBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrdbCVE_ORIGENPrint(sender: TObject; var Value: String);
    procedure qrGrpFooterB_RESUMENBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrlblIMP_SUM_SALDOPrint(sender: TObject; var Value: String);
    procedure qrGrpFooterCVE_MONEDABeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGrpHeaderCVE_MONEDAAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrGrpHeaderID_CONTRATO_DVAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QrGrpB_RESUMENAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrGrpFooterB_RESUMENAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    vgExcelAppPlano,
    vgExcelAppReporte : OleVariant;
    vgNumRow : Integer;
    vgFileNameExcel : String;
    vgBGeneraArchivoExcel : Boolean;
    vgNumOpcion : Integer;
    vgSUM_IMP_SALDO : Double;

    ConSaldo : TConSaldo;
  public
    procedure IniciaArchivoExcel(peFileName : String; peNumOpcion : Integer);
    function  Cierra_Y_Guarda_ArchivoExcel : Boolean;
  end;
Var
  QrBlqma: TQrBlqma;
  Apli : TInterApli;

Procedure RepBlqMa(peApli : TInterApli; peSql : String;  pPreview  : Boolean;
                   peFileName : String; peNumOpcion : Integer);

Implementation
{$R *.DFM}

Procedure RepBlqMa(peApli : TInterApli; peSql : String;  pPreview  : Boolean;
                   peFileName : String; peNumOpcion : Integer);
Var
   QRBlqma  : TQRBlqma;
   vlPreview  : TIntQRPreview;
Begin
   QRBlqma :=TQRBlqma.Create(Nil);
   vlPreview := TIntQRPreview.CreatePreview(Application, QRBlqma);
   With QrBlqma Do
   Try
      Apli := peApli;
      {$WARNINGS OFF}
      ConSaldo := TConSaldo.Create(Nil);
      {$WARNINGS ON}
      ConSaldo.Apli := Apli;

      vgFileNameExcel := peFileName;
      vgBGeneraArchivoExcel := (Trim(peFileName) <> '');
      vgNumOpcion := peNumOpcion;
      vgSUM_IMP_SALDO := 0;

      QRInterEncabezado1.Apli := peApli;
      QRInterEncabezado1.IdEmpresa:= peApli.IdEmpresa;
      QRInterEncabezado1.NomReporte:='IntMQrBlqma';
      QRInterEncabezado1.Titulo1:='Reporte de "Garantía por Chequera - Disposición"';
      QRInterEncabezado1.Titulo2:=' al ' + DateToStr(peApli.DameFechaEmpresa);

      If vgBGeneraArchivoExcel Then
        IniciaArchivoExcel(peFileName, peNumOpcion);

      qryBlqma.DatabaseName := peApli.DataBaseName;
      qryBlqma.SessionName  := peApli.SessionName;
      qryBlqma.Active:=False;
      qryBlqma.SQL.Text:=peSql;
      qryBlqma.sql.SaveToFile('c:\IntMQrBlqma.txt');
      qryBlqma.Active:=True;

      If pPreview Then
         Preview
      Else
         Print;

      If vgBGeneraArchivoExcel Then
        Begin         
        If Cierra_Y_Guarda_ArchivoExcel Then
           If (MessageDlg('Se generó el archivo '+peFileName+'.'+coCRLF+
                           '¿Desea abrirlo?', mtInformation, [mbYes, mbNo], 0) = mrYes) Then
              ShellExecute(Handle, 'open', 'excel', Pchar('"'+peFileName+'"'), Nil, SW_SHOW);
           End;
   Finally
      ConSaldo.free;
      QRBlqma.free;
      If Assigned(vlPreview) Then vlPreview.Free;
   End;
End;

procedure TQrBlqma.IniciaArchivoExcel(peFileName : String; peNumOpcion : Integer);
const aColumnWidth : Array[1..13] of Double = (  5.86,  8.00, 40.00,  4.43, 11.00, 11.00, 40.00,
                                                 5.86,  9.43, 18.43, 12.86, 40.00, 8.29 );

      aColumnTitle : Array[1..13] of String = ( 'Moneda', 'Chequera', 'Titular de la Chequera', 'Origen', 'No. Diposición', 'No. Autorización',  'Acreditado',
                                                'Moneda de la Diposición', 'Clave del Bloqueo','Fecha Realizado', 'Usuario Realizado', 'Concepto de Bloqueo', 'Importe' );


      aColumnWidth1 : Array[1..14] of Double = (  2.43, 2.43, 2.43, 2.43, 2.71, 9.43, 12.86, 12.86, 33.86, 20.43, 13.00, 29.43, 10.43, 1 );

      aColumnTitle1 : Array[1..14] of String = ( '', 'Origen', '', '', 'Sit.', 'No. Disposición', 'No. Autorización',
                                                 'Id. Acreditado', 'Acreditado', 'Fecha Realizado',
                                                 'Usuario Realiza', 'Concepto', 'Importe', '');

var vlColumnRange : Variant;
    vlRange : Variant;
    vlCol : Integer;
begin
  vgNumRow := 1;

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
          vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['A1:N20000'];
          vlRange.Columns.Interior.ColorIndex := 2; // White
          //Coloca Color Gris Oscuro
          vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['O1:S20000'];
          vlRange.Columns.Interior.ColorIndex := 16; // Color Gris

          vlColumnRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Columns;
          // Coloca el ancho de las columnas
          For vlCol := 1 To High(aColumnWidth) Do
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

          // Une las celdas de Origen  
          vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['B'+IntToStr(vgNumRow)+':D'+IntToStr(vgNumRow)];
          vlRange.Merge(True);
          vlRange.Borders[xlBottom].Weight:= xlThin;                      

          vgExcelAppReporte.Range['A'+IntToStr(vgNumRow)+':'+IntToColumnXlS(High(aColumnTitle))+IntToStr(vgNumRow)].Font.Bold  := True;
          vgExcelAppReporte.Range['A'+IntToStr(vgNumRow)+':'+IntToColumnXlS(High(aColumnTitle))+IntToStr(vgNumRow)].Font.Color := clBlack;
          vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['B'+IntToStr(vgNumRow)+':'+IntToColumnXlS(High(aColumnTitle))+IntToStr(vgNumRow)];
          vlRange.Columns.Interior.ColorIndex := 2; // clWhite
          vgExcelAppReporte.Rows[vgNumRow].RowHeight := 30;
          // Se aumenta un renglon más en donde dara inicio la colocación de la información
          Inc(vgNumRow);
          Inc(vgNumRow);
        End;
   End;

end;

procedure TQrBlqma.QRBandDetailAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var vlStrBloqueo : String;
    vlRange : Variant;
begin
  If (qryBlqma.FieldByName('B_RESUMEN').AsString = 'F') Then vgSUM_IMP_SALDO := 0
  Else vgSUM_IMP_SALDO := vgSUM_IMP_SALDO + qryBlqma.FieldByName('IMP_SALDO').AsFloat;

  If Not vgBGeneraArchivoExcel Then
    Exit;

  // Arma el Archivo de Excel Tipo Plano
  If (vgNumOpcion = 0) And (qryBlqma.FieldByName('B_RESUMEN').AsString = 'F') Then
      With (qryBlqma) Do
        Begin
        If (FieldByName('CVE_BLQ_OPERACION').AsString = 'DGTIAC') Then vlStrBloqueo := 'Bloqueo'
        Else vlStrBloqueo := 'Desbloqueo';

        vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('A') ].Value := FieldByName('CVE_MONEDA').AsString;
        vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('B') ].Value := FieldByName('ID_CONTRATO_DV').AsInteger;
        vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('C') ].Value := FieldByName('NOM_TITULAR').AsString;
        vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('D') ].Value := FieldByName('CVE_ORIGEN').AsString;
        vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('E') ].Value := FieldByName('ID_CREDITO').AsInteger;
        vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('F') ].Value := FieldByName('ID_CONTRATO').AsInteger;
        vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('G') ].Value := FieldByName('NOM_ACREDITADO').AsString;
        vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('H') ].Value := FieldByName('CVE_MONEDA_DV').AsString;
        vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('I') ].Value := vlStrBloqueo;
        vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('J') ].Value := FormatDateTime('DD/MM/YYYY HH:MM:SS AM/PM',FieldByName('FH_ACTIVACION').AsDateTime);
        vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('K') ].Value := FieldByName('CVE_USU_ACTIVACION').AsString;
        vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('L') ].Value := FieldByName('DESC_BLQ_CPTO').AsString;
        vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('M') ].Value := FieldByName('IMP_SALDO').AsFloat;
        vgExcelAppPlano.Cells[ vgNumRow , ColumnXlS('M') ].NumberFormat := '#,##0.00';

        Inc(vgNumRow);
        End
  Else If (vgNumOpcion = 1) Then
          With (qryBlqma) Do
            Begin
               If (qryBlqma.FieldByName('B_RESUMEN').AsString = 'F') Then
                  Begin
                  vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('B')].Value := FieldByName('CVE_ORIGEN').AsString;
                  vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('E')].Value := FieldByName('SIT_CREDITO').AsString;
                  vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('F')].Value := FieldByName('ID_CREDITO').AsInteger;
                  vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('G')].Value := FieldByName('ID_CONTRATO').AsInteger;
                  vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('H')].Value := FieldByName('ID_ACREDITADO').AsString;
                  vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('I')].Value := FieldByName('NOM_ACREDITADO').AsString;
                  vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('J')].Value := FormatDateTime('DD/MM/YYYY HH:MM:SS AM/PM',FieldByName('FH_ACTIVACION').AsDateTime);
                  vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('K')].Value := FieldByName('CVE_USU_ACTIVACION').AsString;
                  End
               Else
                  Begin
                  vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['B'+IntToStr(vgNumRow)+':B'+IntToStr(vgNumRow)];
                  vlRange.Borders[xlLeft].Weight:= xlThin;

                  vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['M'+IntToStr(vgNumRow)+':N'+IntToStr(vgNumRow)];
                  vlRange.Borders[xlRight].Weight:= xlThin;
                  End;

            vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('L')].Value := FieldByName('DESC_BLQ_CPTO').AsString;
            vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('M')].Value := FieldByName('IMP_SALDO').AsFloat;
            vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('M') ].NumberFormat := '#,##0.00';
            Inc(vgNumRow);
            End;
end;

function TQrBlqma.Cierra_Y_Guarda_ArchivoExcel : Boolean;
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

procedure TQrBlqma.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := (qryBlqma.FieldByName('B_RESUMEN').AsString = 'F');

  With qryBlqma Do
    If (FieldByName('TIPO_AFECTACION').AsString = 'I') Then
      Begin
      qrshpDESC_AFECTACION.Brush.Color := clBlack;
      qrdbDESC_AFECTACION.Color := clBlack;
      qrdbDESC_AFECTACION.Font.Color := clWhite;
      End
    Else
      Begin
      qrshpDESC_AFECTACION.Brush.Color := clWhite;
      qrdbDESC_AFECTACION.Color := clWhite;
      qrdbDESC_AFECTACION.Font.Color := clBlack;
      End;
end;

procedure TQrBlqma.qrGrpFooterID_CONTRATO_DVBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
 PrintBand := False;
end;

procedure TQrBlqma.QrGrpB_RESUMENBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  With qryBlqma Do
    PrintBand := (FieldByName('B_RESUMEN').AsString = 'V');
end;

procedure TQrBlqma.QRBandDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vlColor : TColor;  
begin
  With qryBlqma Do
    Begin
    If (FieldByName('B_RESUMEN').AsString = 'F') Then vlColor := clWhite
    Else vlColor := clBlack;
    qrShpVerLine_Izq_DETAIL.Pen.Color := vlColor;
    qrShpVerLine_Der_DETAIL.Pen.Color := vlColor;
    End;
end;

procedure TQrBlqma.qrdbCVE_ORIGENPrint(sender: TObject; var Value: String);
begin
  With qryBlqma Do
    Begin
    If (FieldByName('B_RESUMEN').AsString = 'V') Then Value := '';
    End;
end;

procedure TQrBlqma.qrGrpFooterB_RESUMENBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  With qryBlqma Do
    Begin
    PrintBand := (FieldByName('B_RESUMEN').AsString = 'V');

    If PrintBand Then
      Begin
      ConSaldo.FindKey([FieldByName('ID_CONTRATO_DV').AsString,'V','V','F','F']);
      qrlblIMP_DISPONIBLE.Caption := Format(CFORMAT_DINERO, [ConSaldo.Contable.AsFloat]);
      End;
    End;
end;

procedure TQrBlqma.qrlblIMP_SUM_SALDOPrint(sender: TObject;
  var Value: String);
begin
  Value := Format(CFORMAT_DINERO, [vgSUM_IMP_SALDO]);
end;

procedure TQrBlqma.qrGrpFooterCVE_MONEDABeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 PrintBand := False;
end;

procedure TQrBlqma.qrGrpHeaderCVE_MONEDAAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var vlRange : Variant;  
begin
  If ((BandPrinted) And (vgBGeneraArchivoExcel) And (vgNumOpcion = 1)) Then
   With qryBlqma Do
    Begin
    vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('B')].Value :=
                                                   qrlblCVE_MONEDA.Caption + ' ' +
                                                   FieldByName('CVE_MONEDA').AsString + ' ' +
                                                   FieldByName('DESC_MONEDA').AsString;
    vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['B'+IntToStr(vgNumRow)+':G'+IntToStr(vgNumRow)];
    vlRange.Font.Bold  := True;
    vlRange.Font.Color := clWhite;
    vlRange.Columns.Interior.ColorIndex := 1; // Black

    Inc(vgNumRow);
    vgExcelAppReporte.Rows[vgNumRow].RowHeight := 3.75;
    Inc(vgNumRow);
    End;
end;

procedure TQrBlqma.qrGrpHeaderID_CONTRATO_DVAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var vlRange : Variant;  
begin
  If ((BandPrinted) And (vgBGeneraArchivoExcel) And (vgNumOpcion = 1)) Then
   With qryBlqma Do
    Begin
    vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('C')].Value :=
                                                   qrlblID_CONTRATO_DV.Caption + ' ' +
                                                   FieldByName('ID_CONTRATO_DV').AsString + '         ' +
                                                   qrlblNOM_TITULAR.Caption + ' ' +
                                                   FieldByName('NOM_TITULAR').AsString;
    vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['C'+IntToStr(vgNumRow)+':I'+IntToStr(vgNumRow)];                                                   
    vlRange.Font.Bold  := True;
    vlRange.Font.Color := clBlack;
    vlRange.Merge(True);
    // vlRange.HorizontalAlignment:= xlHAlignCenter;
    vlRange.Columns.Interior.ColorIndex := 15; // Silver
    vlRange.Borders[xlBottom].Weight:= xlThin;
    vlRange.Borders[xlLeft].Weight:= xlThin;
    vlRange.Borders[xlRight].Weight:= xlThin;
    vlRange.Borders[xlTop].Weight:= xlThin;

    Inc(vgNumRow);
    vgExcelAppReporte.Rows[vgNumRow].RowHeight := 3.75;
    Inc(vgNumRow);
    End;
end;

procedure TQrBlqma.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var vlRange : Variant;
begin
  If ((BandPrinted) And (vgBGeneraArchivoExcel) And (vgNumOpcion = 1)) Then
   With qryBlqma Do
    Begin

    vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('F')].Value := FieldByName('DESC_AFECTACION').AsString;
    vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['F'+IntToStr(vgNumRow)+':J'+IntToStr(vgNumRow)];

    If (FieldByName('TIPO_AFECTACION').AsString = 'I') Then
       Begin
       vlRange.Font.Bold  := True;
       vlRange.Font.Color := clWhite;
       vlRange.Columns.Interior.ColorIndex := 1; // Black
       End
    Else
       Begin
       vlRange.Font.Bold  := True;
       vlRange.Font.Color := clBlack;
       vlRange.Columns.Interior.ColorIndex := 2; // White
       End;

    vlRange.Merge(True);
    vlRange.Borders[xlBottom].Weight:= xlThin;
    vlRange.Borders[xlLeft].Weight:= xlThin;
    vlRange.Borders[xlRight].Weight:= xlThin;
    vlRange.Borders[xlTop].Weight:= xlThin;

    Inc(vgNumRow);

    vgExcelAppReporte.Rows[vgNumRow].RowHeight := 3.75;
    Inc(vgNumRow);
    End;
end;

procedure TQrBlqma.QrGrpB_RESUMENAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var vlRange : Variant;   
begin
  If ((BandPrinted) And (vgBGeneraArchivoExcel) And (vgNumOpcion = 1)) Then
   With qryBlqma Do
    Begin
    vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['B'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)];
    vlRange.Merge(True);
    vlRange.Borders[xlBottom].Weight:= xlThin;

    Inc(vgNumRow);
    vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('F')].Value := qrlblNOM_TITULAR2.Caption + ' ' + FieldByName('NOM_TITULAR').AsString;
    vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('J')].Value := qrlblRESUMEN.Caption;
    vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['B'+IntToStr(vgNumRow)+':B'+IntToStr(vgNumRow)];
    vlRange.Borders[xlLeft].Weight:= xlThin;
    vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['M'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)];
    vlRange.Borders[xlRight].Weight:= xlThin;

    Inc(vgNumRow);
    vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('F')].Value := FieldByName('CVE_MONEDA_DV').AsString + ' '+
                                                                 qrlblDESC_MONEDA_DV.Caption + ' '+
                                                                 FieldByName('DESC_MONEDA_DV').AsString;

    vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['B'+IntToStr(vgNumRow)+':B'+IntToStr(vgNumRow)];
    vlRange.Borders[xlLeft].Weight:= xlThin;
    vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['M'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)];
    vlRange.Borders[xlRight].Weight:= xlThin;

    Inc(vgNumRow);
    End;
end;

procedure TQrBlqma.qrGrpFooterB_RESUMENAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var vlRange : Variant;  
begin
  If ((BandPrinted) And (vgBGeneraArchivoExcel) And (vgNumOpcion = 1)) Then
   With qryBlqma Do
    Begin
    vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('F')].Value := qrlblNOM_TITULAR3.Caption + ' ' + FieldByName('ID_CONTRATO_DV').AsString;
    vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('I')].Value := Format(CFORMAT_DINERO, [ConSaldo.Contable.AsFloat]);
    vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('I')].NumberFormat := '#,##0.00';

    vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('J')].Value := qrlblTXT_IMP_SUM_SALDO.Caption + ' ' + FieldByName('ID_CONTRATO_DV').AsString;
    vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('M')].Value := vgSUM_IMP_SALDO;
    vgExcelAppReporte.Cells[ vgNumRow , ColumnXlS('M') ].NumberFormat := '#,##0.00';

    vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['M'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)];
    vlRange.Borders[xlTop].Weight:= xlThick;

    vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['B'+IntToStr(vgNumRow)+':B'+IntToStr(vgNumRow)];
    vlRange.Borders[xlLeft].Weight:= xlThin;
    vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['M'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)];
    vlRange.Borders[xlRight].Weight:= xlThin;
    Inc(vgNumRow);

    vlRange := vgExcelAppReporte.Workbooks[1].WorkSheets[1].Range['B'+IntToStr(vgNumRow)+':M'+IntToStr(vgNumRow)];
    vlRange.Columns.Interior.ColorIndex := 2; // White
    vlRange.Merge(True);
    vlRange.Borders[xlLeft].Weight:= xlThin;
    vlRange.Borders[xlRight].Weight:= xlThin;
    vlRange.Borders[xlBottom].Weight:= xlThin;
    Inc(vgNumRow);

    Inc(vgNumRow);
    End;
end;

End.
