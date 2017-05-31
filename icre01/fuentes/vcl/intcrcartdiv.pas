// Sistema         : Clase de CRCARTDIV
// Fecha de Inicio : 04/06/2012
// Función forma   : Clase de CRCARTDIV
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrCartDiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, IntCrQrCartDiv, ComObj;

const ALTO_COL   = 19;
      ALTO_DOBLE = 23;

const
{ XlFileFormat }
  xlAddIn               =    18;
  xlCSV                 =     6;
  xlCSVMac              =    22;
  xlCSVMSDOS            =    24;
  xlCSVWindows          =    23;
  xlDBF2                =     7;
  xlDBF3                =     8;
  xlDBF4                =    11;
  xlDIF                 =     9;
  xlExcel2              =    16;
  xlExcel2FarEast       =    27;
  xlExcel3              =    29;
  xlExcel4              =    33;
  xlExcel5              =    39;
  xlExcel7              =    39;
  xlExcel9795           =    43;
  xlExcel4Workbook      =    35;
  xlIntlAddIn           =    26;
  xlIntlMacro           =    25;
  xlWorkbookNormal      = -4143;
  xlSYLK                =     2;
  xlTemplate            =    17;
  xlCurrentPlatformText = -4158;
  xlTextMac             =    19;
  xlTextMSDOS           =    21;
  xlTextPrinter         =    36;
  xlTextWindows         =    20;
  xlWJ2WD1              =    14;
  xlWK1                 =     5;
  xlWK1ALL              =    31;
  xlWK1FMT              =    30;
  xlWK3                 =    15;
  xlWK4                 =    38;
  xlWK3FM3              =    32;
  xlWKS                 =     4;
  xlWorks2FarEast       =    28;
  xlWQ1                 =    34;
  xlWJ3                 =    40;
  xlWJ3FJ3              =    41;
  xlWBatWorkSheet       = -4167;

{ XlBorderWeight }

  xlHairline =     1;
  xlMedium   = -4138;
  xlThick    =     4;
  xlThin     =     2;

{ xlHorizontalAlignment}
  xlHAlignCenter = -4108;
  xlHAlignLeft   = -4131;
  xlHAlignRight  = -4152;

{xlBorderIndex}
  xlEdgeLeft         =     7;
  xlEdgeTop          =     8;
  xlEdgeBottom       =     9;
  xlEdgeRight        =    10;
  xlDiagonalDown     =     5;
  xlDiagonalUp       =     6;
  xlNone             = -4142;
  xlInsideVertical   =    11;
  xlInsideHorizontal =    12;

{xlCalculationMode}
  xlCalculationManual        = -4135;
  xlCalculationAutomatic     = -4105;
  xlCalculationSemiautomatic =     2;

{xlLineStyle}
  xlContinuous             =     1;
  xlDash                   = -4115;
  xlDashDot                =     4;
  xlDashDotDot             =     5;
  xlDot                    = -4118;
  xlDouble                 = -4119;
  xlSlantDashDot           =    13;
  xlLineStyleNone          = -4142;
  xlSolid                  =     1;
  xlAutomatic              = -4105;
  xlThemeColorAccent1      =     5;
  xlThemeColorAccent3      =     7;
  xlThemeColorAccent6      =    10;
  xlThemeColorLight1       =     2;
  xlThemeColorLight2       =     4;
  xlThemeColorDark1        =     1;
  msoThemeColorAccent1     =     5;
  msoThemeColorAccent3     =     7;
  msoThemeColorAccent6     =    10;
  msoThemeColorText2       =    15;
  msoThemeColorBackground1 =    14;
  msoLineDash              =     4;

{Chart Enummeration}
  xlBarClustered      =    57;
  xlColumns           =     2;
  xlColumnClustered   =    51;
  xl3DColumnClustered =    54;
  xlLine              =     4;
  xl3DLine            = -4101;
  msoTrue             =     1;

{Fill Pattern}
  msoPattern5Percent        = 1;
  msoPatternOutlinedDiamond = 41;

type
  TCrCartDiv = class;

  TWCrCartDiv = class(TForm)
    InterForma1             : TInterForma;
    Label1: TLabel;
    dpFecha: TDateTimePicker;
    rgFactorMoneda: TRadioGroup;
    GroupBox1: TGroupBox;
    cbEstados: TCheckBox;
    cbMunicipios: TCheckBox;
    cbOrgDesc: TCheckBox;
    cbPrivado: TCheckBox;
    btBusca: TBitBtn;
    bbImprimir: TBitBtn;
    sgDivisas: TSGCtrl;
    QDatos: TQuery;
    QDatosIdPlazo: TStringField;
    QDatosPct_Saldo_Pesos: TFloatField;
    QDatosPct_Saldo_Dls: TFloatField;
    QDatosTotal: TFloatField;
    QDatosCumplimiento: TStringField;
    sgImpagado: TSGCtrl;
    QDatosB_Total: TFloatField;
    QDatos2: TQuery;
    QDatos2Pct_Saldo_Imp_Nal: TFloatField;
    QDatos2Pct_Saldo_Imp_Dls: TFloatField;
    QDatos2Pct_Total: TFloatField;
    QDatos2Saldo: TStringField;
    cbFederal: TCheckBox;
    sbExportar: TSpeedButton;
    SaveXLS: TSaveDialog;
    QLeyendaEntidades: TQuery;
    sbExportarDetalles: TSpeedButton;
    QDetalles: TQuery;
    cbCartasCredito: TCheckBox;
    cbInteresesAnticipados: TCheckBox;
    QDatosMaximo: TStringField;
    procedure btBuscaClick(Sender: TObject);
    procedure sgDivisasCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure bbImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure ExportarXLS (FileName: string);
    procedure ExportarDetalles (FileName: string);
    procedure sbExportarDetallesClick(Sender: TObject);

  private
    { Private declarations }
    procedure Generaconsulta;
    function  ConstruyeTipoEntidad: string;

  public
    { Public declarations }
    Objeto : TCrCartDiv;
  end;

  TCrCartDiv= class(TInterFrame)
      private

      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}

function BoolToStr (b: boolean): string;
begin
  if b then
    result := 'V'
  else
    result := 'F';
end;

constructor TCrCartDiv.Create( AOwner : TComponent );
begin
  Inherited;
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'InTCrCartDiv.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrCartDiv.Destroy;
begin inherited;
end;


function TCrCartDiv.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCartDiv;
begin
   W:=TWCrCartDiv.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

function TWCrCartDiv.ConstruyeTipoEntidad: string;
begin
  result := '';

  if cbFederal.Checked then
    result := result + 'FEDERAL|';

  if cbEstados.Checked then
    result := result + 'ESTATAL|';

  if cbMunicipios.Checked then
    result := result + 'MUNICIPAL|';

  if cbOrgDesc.Checked then
    result := result + 'ORG-DESC|';

  if cbPrivado.Checked then
    result := result + 'PRIVADO|';

  if result <> '' then
    Delete (result, Length (result), 1);
end;

procedure TWCrCartDiv.GeneraConsulta;
begin

  QDatos.Close;
  QDatos.DatabaseName                            := Objeto.Apli.DataBaseName;
  QDatos.SessionName                             := Objeto.Apli.SessionName;
  QDatos.ParamByName ('peFecha').AsDate          := dpFecha.Date - 1;
  QDatos.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QDatos.ParamByName ('peCartas_Cred').AsString  := BoolToStr (cbCartasCredito.Checked);
  QDatos.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
  QDatos.Open;


  sgDivisas.AddQry(QDatos, // Query
        True, // Iniciar Grid, Limpiar Lineas Anteriores.
        True, // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
        -1,   // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
        ALTO_COL,  // Alto del Header, -1 es el Default 32 Columnas
        ALTO_DOBLE,// Alto del las Lineas, 1 es el Default 32
        True); // ShowTitle

  QDatos2.Close;
  QDatos2.DatabaseName                            := Objeto.Apli.DataBaseName;
  QDatos2.SessionName                             := Objeto.Apli.SessionName;
  QDatos2.ParamByName ('peFecha').AsDate          := dpFecha.Date - 1;
  QDatos2.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QDatos2.ParamByName ('peCartas_Cred').AsString  := BoolToStr (cbCartasCredito.Checked);
  QDatos2.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
  QDatos2.Open;

  sgImpagado.AddQry(QDatos2, // Query
        True, // Iniciar Grid, Limpiar Lineas Anteriores.
        True, // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
        -1,   // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
        ALTO_COL,  // Alto del Header, -1 es el Default 32 Columnas
        ALTO_DOBLE,// Alto del las Lineas, 1 es el Default 32
        True); // ShowTitle

   Application.ProcessMessages;

end;

procedure TWCrCartDiv.btBuscaClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCARTDIV_BUSCA',True,True) then
      GeneraConsulta;
end;

procedure TWCrCartDiv.sgDivisasCalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
begin
   if RowCaso = rcRowBegin then
  begin
    sgDivisas.SetActualHeight (ALTO_COL);
    if DataSet.FieldByName ('B_Total').AsInteger = 1 then
      sgDivisas.SetActualAsHeader;
    end;
end;

procedure TWCrCartDiv.bbImprimirClick(Sender: TObject);
var
  Factor: double;
begin
   if Objeto.ValidaAccesoEsp('TCRCARTDIV_IMPRI',True,True) then
   begin
      Factor := 1;
      RepCarteraPorDivisa (dpFecha.Date - 1, ConstruyeTipoEntidad, cbCartasCredito.Checked, cbInteresesAnticipados.Checked, QDatos, QDatos2, Factor, Objeto.Apli, True);
   end;
end;

procedure TWCrCartDiv.FormShow(Sender: TObject);
begin
  dpFecha.Date := Objeto.Apli.DameFechaEmpresa;
  GeneraConsulta;
end;

procedure TWCrCartDiv.sbExportarClick(Sender: TObject);
var
  XLApp: Variant;
begin
   if Objeto.ValidaAccesoEsp('TCRCARTDIV_EXPEX',True,True) then
   begin
      sbExportar.Refresh;
      if SaveXLS.Execute then
      begin
        Cursor := crHourGlass;
        try
          ExportarXLS (SaveXLS.FileName);
          Cursor := crDefault;
          if MessageDlg ('Exportación exitosa. Deseas abrir el archivo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            XLApp         := CreateOleObject('Excel.Application');
            XLApp.Visible := False;
            XLApp.Workbooks.Open (SaveXLS.FileName);
            XLApp.Visible := True;
          end;
        finally
          Cursor := crDefault;
        end;
      end;
   end;
end;

procedure TWCrCartDiv.ExportarXLS (FileName: string);
var
  XLApp, XLSheet: Variant;
  Range, Chart, Serie1, Serie2, Serie3: Variant;
  Row, RowIni, CurrTipo: integer;
begin
  XLApp := CreateOleObject('Excel.Application');
  try
    Cursor              := crHourGlass;
    XLApp.Visible       := False;
    XLApp.DisplayAlerts := False;
    XLApp.Workbooks.Add(xlWBatWorkSheet);

    {Inicia la generación de la tabla}
    XLSheet      := XLApp.Workbooks[1].WorkSheets[1];
    XLSheet.Name := 'Tabla';

    {Encabezado del reporte}
    XLSheet.Cells [1, 1].Formula := Caption;  // Título del reporte
    XLSheet.Range ['A1:F1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['F3'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['C3:E3'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['F6:F9'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [2, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Range ['B2:F2'].Merge;

    QLeyendaEntidades.Close;
    QLeyendaEntidades.DatabaseName                            := Objeto.Apli.DataBaseName;
    QLeyendaEntidades.SessionName                             := Objeto.Apli.SessionName;
    QLeyendaEntidades.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
    QLeyendaEntidades.Open;
    XLSheet.Cells [2, 2].Formula :=  QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;

    XLSheet.Range ['B2'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignLeft;

    if cbCartasCredito.Checked then
      XLSheet.Cells [3, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [3, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [3, 4].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [3, 4].Formula := 'No incluye intereses cobrados por anticipado';
    XLSheet.Range ['A3:C3'].Merge;
    XLSheet.Range ['D3:F3'].Merge;
    XLSheet.Range ['D3'].HorizontalAlignment := xlHAlignRight;

    {Encabezado de las columnas}
    XLSheet.Cells [5, 3].Formula := 'Real';
    XLSheet.Cells [7, 1].Formula := 'Plazo';
    XLSheet.Cells [6, 2].Formula := 'Máximo';
    XLSheet.Cells [7, 2].Formula := '%';
    XLSheet.Cells [6, 3].Formula := 'Moneda Nal.';
    XLSheet.Cells [7, 3].Formula := '%';
    XLSheet.Cells [6, 4].Formula := 'Dólares';
    XLSheet.Cells [6, 5].Formula := 'Total';
    XLSheet.Cells [6, 6].Formula := 'Cumplimiento';

    {Combina las columnas para los encabezados}
    XLSheet.Range ['C5:D5'].Merge;
    XLSheet.Range ['C7:E7'].Merge;

    XLSheet.Range ['A1:F7'].Font.Bold             := True;
    XLSheet.Range ['A5:F7'].HorizontalAlignment   := xlHAlignCenter;

    Range                     := XLSheet.Range ['C5:E5'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Range                     := XLSheet.Range ['A6:F7'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row      := 8;
    RowIni   := Row;
    CurrTipo := -1;
    QDatos.First;
    while not QDatos.Eof do
    begin
      if QDatos.FieldByName ('Maximo').AsString = 'Total' then
        XLSheet.Cells [Row, 2].Value := QDatos.FieldByName ('Maximo').AsString
      else
        XLSheet.Cells [Row, 2].Value := QDatos.FieldByName ('Maximo').AsFloat / 100;

      XLSheet.Cells [Row, 1].Formula := QDatos.FieldByName ('IdPlazo')        .AsString;
      XLSheet.Cells [Row, 3].Value   := QDatos.FieldByName ('Pct_Saldo_Pesos').AsFloat / 100;
      XLSheet.Cells [Row, 4].Value   := QDatos.FieldByName ('Pct_Saldo_Dls')  .AsFloat / 100;
      XLSheet.Cells [Row, 5].Value   := QDatos.FieldByName ('Total')          .AsFloat / 100;
      XLSheet.Cells [Row, 6].Formula := QDatos.FieldByName ('Cumplimiento')   .AsString;
      QDatos.Next;
      Inc (Row);
    end;

    Range                     := XLSheet.Range [Format ('B%d:E%d', [Row - 1, Row - 1])];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    XLSheet.Range [Format ('B8:F%d',  [Row - 2])         ].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('B8:E%d',  [Row - 2])         ].Style               := 'Percent';
    XLSheet.Range [Format ('B8:E%d',  [Row - 2])         ].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('C%d:E%d', [Row - 1, Row - 1])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('C%d:E%d', [Row - 1, Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('C%d:E%d', [Row - 1, Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Cells [Row - 1, 2].HorizontalAlignment                             := xlHAlignRight;

    Inc (Row, 2);
    XLSheet.Range [Format ('C%d:E%d', [Row, Row + QDatos2.RecordCount + 1])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Cells [Row, 3].Formula := 'Moneda Nal.';
    XLSheet.Cells [Row, 4].Formula := 'Dólares';
    XLSheet.Cells [Row, 5].Formula := 'Total';

    Inc (Row);
    XLSheet.Cells [Row, 3].Formula := '%';

    XLSheet.Range [Format ('C%d:E%d', [Row, Row])].Merge;
    Range                     := XLSheet.Range [Format ('C%d:E%d', [Row - 1, Row])];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Inc (Row);
    QDatos2.First;
    while not QDatos2.Eof do
    begin
      XLSheet.Cells [Row, 2].Formula := QDatos2.FieldByName ('Saldo')            .AsString;
      XLSheet.Cells [Row, 3].Value   := QDatos2.FieldByName ('Pct_Saldo_Imp_Nal').AsFloat / 100;
      XLSheet.Cells [Row, 4].Value   := QDatos2.FieldByName ('Pct_Saldo_Imp_Dls').AsFloat / 100;
      XLSheet.Cells [Row, 5].Value   := QDatos2.FieldByName ('Pct_Total')        .AsFloat / 100;

      XLSheet.Range [Format ('C%d:E%d', [Row, Row])].HorizontalAlignment := xlHAlignCenter;
      XLSheet.Range [Format ('C%d:E%d', [Row, Row])].Style               := 'Percent';
      XLSheet.Range [Format ('C%d:E%d', [Row, Row])].NumberFormat        := '0.00%';

      QDatos2.Next;
      Inc (Row);
    end;

    XLSheet.Columns ['A:F'].ColumnWidth := 20;
    XLSheet.Columns ['B:E'].ColumnWidth := 15;

    XLSheet.Range ['A8'].Select;
    XLApp.ActiveWindow.FreezePanes := True;

    {Genera una hoja oculta sin datos formateados para la gráfica}
    XLApp.Workbooks [1].WorkSheets.Add (Null, XLApp.Workbooks [1].WorkSheets [1]);
    XLSheet      := XLApp.Workbooks[1].WorkSheets[2];
    XLSheet.Name := 'Datos';

    Row := 1;
    QDatos.First;
    while not QDatos.Eof do
    begin
      XLSheet.Cells [Row, 1].Formula := QDatos.FieldByName ('IdPlazo').AsString;
      XLSheet.Cells [Row, 2].Value   := QDatos.FieldByName ('Maximo').AsString;
      XLSheet.Cells [Row, 3].Value   := QDatos.FieldByName ('Pct_Saldo_Pesos').AsString;
      XLSheet.Cells [Row, 4].Value   := QDatos.FieldByName ('Pct_Saldo_Dls').AsString;
      XLSheet.Cells [Row, 5].Value   := QDatos.FieldByName ('Total').AsFloat;
      XLSheet.Cells [Row, 6].Formula := QDatos.FieldByName ('Cumplimiento').AsString;
      QDatos.Next;
      Inc (Row);
    end;
    XLSheet.Visible := False;

    {Genera la hoja para la gráfica}
    XLApp.Workbooks [1].WorkSheets.Add (Null, XLApp.Workbooks [1].WorkSheets [2]);
    XLSheet      := XLApp.Workbooks[1].WorkSheets[3];
    XLSheet.Name := 'Gráfica';

    XLSheet.Cells [1, 1].Formula := Caption;  // Título del reporte
    XLSheet.Range ['A1:N1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['A1'].Font.Bold           := True;

    XLSheet.Cells [2, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Range ['D2:N2'].Merge;
    XLSheet.Range ['D2'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Cells [2, 4].Formula             :=  QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['A1:N3'].Font.Bold        := True;

    if cbCartasCredito.Checked then
      XLSheet.Cells [3, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [3, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [3, 8].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [3, 8].Formula := 'No incluye intereses cobrados por anticipado';
    XLSheet.Range ['A3:G3'].Merge;
    XLSheet.Range ['H3:N3'].Merge;
    XLSheet.Range ['H3'].HorizontalAlignment := xlHAlignRight;

    Chart := XLSheet.ChartObjects.Add (10, 65, 820, 300);
    Chart.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[2].Range['A1:A' + IntToStr (Row - 2)], xlColumns);

    Chart.Chart.SeriesCollection [1].Delete;

    Serie1         := Chart.Chart.SeriesCollection.NewSeries;
    Serie1.Name    := '="Maximo"';
    Serie1.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 2);
    Serie1.Values  := '=Datos!$B$1:$B$' + IntToStr (Row - 2);

    Serie2         := Chart.Chart.SeriesCollection.NewSeries;
    Serie2.Name    := '="Porcentaje Moneda Nal"';
    Serie2.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 2);
    Serie2.Values  := '=Datos!$C$1:$C$' + IntToStr (Row - 2);

    Serie3         := Chart.Chart.SeriesCollection.NewSeries;
    Serie3.Name    := '="Porcentaje Dólares"';
    Serie3.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 2);
    Serie3.Values  := '=Datos!$D$1:$D$' + IntToStr (Row - 2);

    XLApp.Workbooks[1].WorkSheets[1].Activate
  finally
    Cursor := crArrow;
    XLApp.Workbooks[1].SaveAs (FileName);
    XLApp.Quit;
    XLSheet  := Unassigned;
    Range    := Unassigned;
    XLApp    := Unassigned;
  end;
end;

procedure TWCrCartDiv.sbExportarDetallesClick(Sender: TObject);
var
  XLApp: Variant;
begin
   if Objeto.ValidaAccesoEsp('TCRCARTDIV_EXPDT',True,True) then
   begin
      sbExportar.Refresh;
      if SaveXLS.Execute then
      begin
        Cursor := crHourGlass;
        try
          ExportarDetalles (SaveXLS.FileName);
          Cursor := crDefault;
          if MessageDlg ('Exportación exitosa. Deseas abrir el archivo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            XLApp         := CreateOleObject('Excel.Application');
            XLApp.Visible := False;
            XLApp.Workbooks.Open (SaveXLS.FileName);
            XLApp.Visible := True;
          end;
        finally
          Cursor := crDefault;
        end;
      end;
   end;
end;

procedure TWCrCartDiv.ExportarDetalles (FileName: string);
var
  XLApp, XLSheet: Variant;
  Range : Variant;
  Row, RowIni, CurrTipo: integer;
begin
  XLApp := CreateOleObject('Excel.Application');
  try
    Cursor              := crHourGlass;
    XLApp.Visible       := False;
    XLApp.DisplayAlerts := False;
    XLApp.Workbooks.Add(xlWBatWorkSheet);

    QDetalles.Close;
    QDetalles.DatabaseName                            := Objeto.Apli.DataBaseName;
    QDetalles.SessionName                             := Objeto.Apli.SessionName;
    QDetalles.ParamByName ('peFecha').AsDate          := dpFecha.Date - 1;
    QDetalles.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
    QDetalles.ParamByName ('peCartas_Cred').AsString  := BoolToStr (cbCartasCredito.Checked);
    QDetalles.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
    QDetalles.Open;

    QLeyendaEntidades.Close;
    QLeyendaEntidades.DatabaseName                            := Objeto.Apli.DataBaseName;
    QLeyendaEntidades.SessionName                             := Objeto.Apli.SessionName;
    QLeyendaEntidades.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
    QLeyendaEntidades.Open;

    {Inicia la generación de la tabla}
    XLSheet      := XLApp.Workbooks[1].WorkSheets[1];
    XLSheet.Name := 'Tabla';

    {Encabezado del reporte}
    XLSheet.Cells [1, 1].Formula             := Caption;  // Título del reporte
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['A1:J1'].Merge;

    XLSheet.Cells [2, 1].Formula             :=  QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['A2:J2'].Merge;

    XLSheet.Cells [3, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Range ['A3:B3'].Merge;

    XLSheet.Cells [3, 3].Formula             := 'Información expresada en pesos' ;
    XLSheet.Range ['C3'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Range ['C3:J3'].Merge;

    if cbCartasCredito.Checked then
      XLSheet.Cells [4, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [4, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 6].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 6].Formula := 'No incluye intereses cobrados por anticipado';
    XLSheet.Range ['A4:E4'].Merge;
    XLSheet.Range ['F4:J4'].Merge;
    XLSheet.Range ['F4'].HorizontalAlignment := xlHAlignRight;


    {Encabezado de las columnas}
    XLSheet.Cells [5,  1].Formula := 'Moneda';
    XLSheet.Cells [5,  2].Formula := 'Tipo Entidad';
    XLSheet.Cells [5,  3].Formula := 'Id Acreditado';
    XLSheet.Cells [5,  4].Formula := 'Nombre Acreditado';
    XLSheet.Cells [5,  5].Formula := 'Id Contrato';
    XLSheet.Cells [5,  6].Formula := 'Id Crédito';
    XLSheet.Cells [5,  7].Formula := 'Tipo Crédito';
    XLSheet.Cells [5,  8].Formula := 'Plazo';
    XLSheet.Cells [5,  9].Formula := 'Saldo';
    XLSheet.Cells [5, 10].Formula := '%';

    XLSheet.Range ['A1:J5'].Font.Bold                                                 := True;
    XLSheet.Range ['A5:J5'].HorizontalAlignment                                       := xlHAlignCenter;
    XLSheet.Range ['I5:I' + IntToStr (QDetalles.RecordCount + 5)].Style               := 'Currency';
    XLSheet.Range ['J5:J' + IntToStr (QDetalles.RecordCount + 5)].Style               := 'Percent';
    XLSheet.Range ['J5:J' + IntToStr (QDetalles.RecordCount + 5)].NumberFormat        := '0.00%';
    XLSheet.Range ['J5:J' + IntToStr (QDetalles.RecordCount + 5)].HorizontalAlignment := xlHAlignCenter;

    Range                     := XLSheet.Range ['A5:J5'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row      := 6;
    RowIni   := Row;
    CurrTipo := -1;
    QDetalles.First;

    while not QDetalles.Eof do
    begin
      XLSheet.Cells [Row,  1].Formula := QDetalles.FieldByName ('Moneda')       .AsString;
      XLSheet.Cells [Row,  2].Formula := QDetalles.FieldByName ('Tipo_Entidad') .AsString;
      XLSheet.Cells [Row,  3].Formula := QDetalles.FieldByName ('Id_Acreditado').AsFloat;
      XLSheet.Cells [Row,  4].Formula := QDetalles.FieldByName ('Nom_Acred_Reg').AsString;
      XLSheet.Cells [Row,  5].Value   := QDetalles.FieldByName ('Id_Contrato')  .AsFloat;
      XLSheet.Cells [Row,  6].Value   := QDetalles.FieldByName ('Id_Credito')   .AsFloat;
      XLSheet.Cells [Row,  7].Value   := QDetalles.FieldByName ('Tipo_Credito') .AsString;
      XLSheet.Cells [Row,  8].Formula := QDetalles.FieldByName ('IdPlazo')      .AsString;
      XLSheet.Cells [Row,  9].Value   := QDetalles.FieldByName ('Saldo')        .AsFloat;
      XLSheet.Cells [Row, 10].Value   := QDetalles.FieldByName ('Porcentaje')   .AsFloat;
      QDetalles.Next;
      Inc (Row);
    end;

    XLSheet.Columns ['A:G'].ColumnWidth := 15;
    XLSheet.Columns ['D'].ColumnWidth   := 35;
    XLSheet.Columns ['H:J'].ColumnWidth := 20;

    XLSheet.Range ['A6'].Select;
    XLApp.ActiveWindow.FreezePanes := True;

    XLApp.Workbooks[1].WorkSheets[1].Activate
  finally
    Cursor := crArrow;
    XLApp.Workbooks[1].SaveAs (FileName);
    XLApp.Quit;
    XLSheet  := Unassigned;
    Range    := Unassigned;
    XLApp    := Unassigned;
  end;
end;

end.
