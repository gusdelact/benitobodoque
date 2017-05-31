unit IntCrCompSeP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, ComObj, Grids,
  Aligrid, IntCrQrCompSeP;

const ALTO_COL = 19;
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
  TCRCompSep = Class;

  TWCrCompSeP = class(TForm)
    InterForma1: TInterForma;
    dpFecha: TDateTimePicker;
    Label1: TLabel;
    rgFactorMoneda: TRadioGroup;
    btBusca: TBitBtn;
    bbImprimir: TBitBtn;
    sbExportar: TSpeedButton;
    SGCompInfra: TSGCtrl;
    QDatos: TQuery;
    QDatosTitulos: TStringField;
    QDatosImp_T4YAnt: TFloatField;
    QDatosPct_T4YAnt: TFloatField;
    QDatosImp_T1YAct: TFloatField;
    QDatosPct_T1YAct: TFloatField;
    QDatosImp_Saldo_al: TFloatField;
    QDatosPct_Saldo_al: TFloatField;
    QDatosImp_T1_Diferencia: TFloatField;
    QDatosPct_T1_Diferencia: TFloatField;
    QDatosImp_T4Yact: TFloatField;
    QDatosPct_T4YAct: TFloatField;
    QDatosImp_T4_Diferencia: TFloatField;
    QDatosPct_T4_Diferencia: TFloatField;
    QDatosOrden_Estructura: TFloatField;
    SaveXLS: TSaveDialog;
    sbExportarDetalles: TSpeedButton;
    QDetalles: TQuery;
    cbCartasCredito: TCheckBox;
    cbInteresesAnticipados: TCheckBox;
    procedure btBuscaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SGCompInfraCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure bbImprimirClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure ExportarXLS (FileName: string);
    procedure sbExportarDetallesClick(Sender: TObject);
    procedure ExportarDetalles (FileName: string);

  private
    { Private declarations }
    procedure GeneraConsulta;

  public
    { Public declarations }
    Objeto : TCrCompSep;

  end;

  TCrCompSep = class(TInterFrame)
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

{$R *.DFM}

constructor TCrCompSeP.Create( AOwner : TComponent );
begin
  Inherited;
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'InTCrCompSeP.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrCompSep.Destroy;
begin inherited;
end;

function TCrCompSeP.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCompSeP;
begin
   W:=TWCrCompSeP.Create(Self);
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

function BoolToStr (b: boolean): string;
begin
  if b then
    result := 'V'
  else
    result := 'F';
end;

procedure TWCrCompSeP.GeneraConsulta;
var
  Factor: double;
  vlF_T4YAnt: TDateTime;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  vlF_T4YAnt := EncodeDate (StrToInt (FormatDateTime ('yyyy', dpFecha.Date)) - 1, 12, 31);

  QDatos.Close;
  QDatos.DatabaseName                                    := Objeto.Apli.DataBaseName;
  QDatos.SessionName                                     := Objeto.Apli.SessionName;
  QDatos.ParamByName ('peFecha').AsDate                  := dpFecha.Date - 1;
  QDatos.ParamByName ('peFactor').AsFloat                := Factor;
  QDatos.ParamByName ('peCartas_Cred').AsString  := BoolToStr (cbCartasCredito.Checked);
  QDatos.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
  QDatos.Open;

  QDetalles.Close;
  QDetalles.DatabaseName                            := Objeto.Apli.DataBaseName;
  QDetalles.SessionName                             := Objeto.Apli.SessionName;
  QDetalles.ParamByName ('peFecha').AsDate          := dpFecha.Date - 1;
  QDetalles.ParamByName ('peFactor').AsFloat        := Factor;
  QDetalles.ParamByName ('peCartas_Cred').AsString  := BoolToStr (cbCartasCredito.Checked);
  QDetalles.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
  QDetalles.Open;

  QDatosImp_T4YAnt.DisplayLabel   := '         4T' + FormatDateTime ('yyyy', vlF_T4YAnt);
  QDatosImp_T1YAct.DisplayLabel   := '         1T' + FormatDateTime ('yyyy', dpFecha.Date);
  QDatosImp_Saldo_al.DisplayLabel := FormatDateTime ('"Saldo al" dd/mm/yyyy', dpFecha.Date);
  QDatosImp_T4YAct.DisplayLabel   := '         4T' + FormatDateTime ('yyyy', dpFecha.Date);


  SGCompInfra.AddQry(QDatos, // Query
        True, // Iniciar Grid, Limpiar Lineas Anteriores.
        True, // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
        -1,   // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
        ALTO_COL,  // Alto del Header, -1 es el Default 32 Columnas
        ALTO_DOBLE,// Alto del las Lineas, 1 es el Default 32
        True); // ShowTitle
end;



procedure TWCrCompSeP.btBuscaClick(Sender: TObject);
begin
  GeneraConsulta;
end;

procedure TWCrCompSeP.FormShow(Sender: TObject);
begin
  dpFecha.Date := Objeto.Apli.DameFechaEmpresa;
  GeneraConsulta;
end;

procedure TWCrCompSeP.SGCompInfraCalcRow(Sendet: TObject;
  DataSet: TDataSet; CurrRow: Integer; RowCaso: TRowCaso;
  var ShowRow: Boolean);
begin
 if RowCaso = rcRowBegin then
  begin
    (Sendet as TSGCtrl).SetActualHeight(ALTO_COL);

     if QDatos.FieldByName('Orden_Estructura').AsInteger In [1,4,5,15,16,26,27,30,31] Then
      (Sendet as TSGCtrl).ToHeader (CurrRow);
  end;
end;

procedure TWCrCompSeP.bbImprimirClick(Sender: TObject);
var
  Factor: double;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  RepComparativoSecPub (dpFecha.Date - 1, 'FEDERAL|ESTATAL|MUNICIPAL|ORG-DESC|' , cbCartasCredito.Checked, cbInteresesAnticipados.Checked, QDatos, Factor, Objeto.Apli, True);
end;

procedure TWCrCompSeP.sbExportarClick(Sender: TObject);
var
  XLApp: Variant;
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

procedure TWCrCompSeP.ExportarXLS (FileName: string);
var
  XLApp, XLSheet: Variant;
  Range, Chart, Chart2, Chart3, Chart4  : Variant;
  Serie1, Serie2, Serie3, Serie4, Serie5, Serie6 : Variant;
  Row : integer;
  procedure BorderRange (RangeStr: string);
  begin
    Range                                        := XLSheet.Range [RangeStr];

    Range.Borders [xlEdgeTop].LineStyle          := xlNone;
    Range.Borders [xlEdgeTop].ColorIndex         := 0;
    Range.Borders [xlEdgeTop].TintAndShade       := 0;
    Range.Borders [xlEdgeTop].Weight             := xlMedium;

    Range.Borders [xlEdgeBottom].LineStyle       := xlContinuous;
    Range.Borders [xlEdgeBottom].ColorIndex      := 0;
    Range.Borders [xlEdgeBottom].TintAndShade    := 0;
    Range.Borders [xlEdgeBottom].Weight          := xlMedium;

    Range.Borders [xlInsideVertical].LineStyle   := xlNone;
    Range.Borders [xlInsideHorizontal].LineStyle := xlNone;
  end;

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
    XLSheet.Range ['A1:M1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['F3'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Columns ['A'].columnwidth := 27;
    XLSheet.Columns ['B'].columnwidth := 16;
    XLSheet.Columns ['C'].columnwidth := 10;
    XLSheet.Columns ['D'].columnwidth := 16;
    XLSheet.Columns ['E'].columnwidth := 10;
    XLSheet.Columns ['F'].columnwidth := 16;
    XLSheet.Columns ['G'].columnwidth := 10;
    XLSheet.Columns ['H'].columnwidth := 16;
    XLSheet.Columns ['I'].columnwidth := 10;
    XLSheet.Columns ['J'].columnwidth := 16;
    XLSheet.Columns ['K'].columnwidth := 10;
    XLSheet.Columns ['L'].columnwidth := 16;
    XLSheet.Columns ['M'].columnwidth := 10;

    XLSheet.Cells [2, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Range ['B2:M2'].Merge;
    XLSheet.Range ['B3:M3'].Merge;


    XLSheet.Cells [2, 2].Formula :=  'Incluye información: Federal, Estatal, Municipal, Órganos Descentralizados';
    XLSheet.Cells [3, 2].Formula :=  'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];


    XLSheet.Range ['B2'].HorizontalAlignment    := xlHAlignRight;
    XLSheet.Range ['B3'].HorizontalAlignment    := xlHAlignRight;
    XLSheet.Range ['A2'].HorizontalAlignment    := xlHAlignLeft;
    XLSheet.Range ['C6:J6'].HorizontalAlignment := xlHAlignCenter;

    if cbCartasCredito.Checked then
      XLSheet.Cells [4, 2].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [4, 2].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 8].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 8].Formula := 'No incluye intereses cobrados por anticipado';

    XLSheet.Range ['B4:G4'].Merge;
    XLSheet.Range ['H4:M4'].Merge;
    XLSheet.Range ['H4'].HorizontalAlignment := xlHAlignRight;

    {Encabezado de las columnas}

    XLSheet.Range ['A1:M4'].Font.Bold := True;

    //Pinta los bordes para diferenciar los grupos de datos
    BorderRange ('B8:M8');
    BorderRange ('B9:M10');
    BorderRange ('B11:M12');
    BorderRange ('B13:M21');
    BorderRange ('B22:M23');
    BorderRange ('B24:M32');
    BorderRange ('B33:M34');
    BorderRange ('B35:M36');
    BorderRange ('B37:M37');

    XLSheet.Range ['B8'].Select;
    XLApp.ActiveWindow.FreezePanes := True;

    //Cambia los formatos de titulos de columnas y totales
    XLSheet.Range ['B6:C6'].Merge;
    XLSheet.Range ['D6:E6'].Merge;
    XLSheet.Range ['F6:G6'].Merge;
    XLSheet.Range ['H6:I6'].Merge;
    XLSheet.Range ['J6:K6'].Merge;
    XLSheet.Range ['L6:M6'].Merge;
    XLSheet.Range ['B6:M7'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Range ['C8:C38'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['E8:E38'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['G8:G38'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['I8:I38'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['K8:K38'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['M8:M38'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Range['B8:B38'].Style        := 'Currency';
    XLSheet.Range['D8:D38'].Style        := 'Currency';
    XLSheet.Range['F8:f38'].Style        := 'Currency';
    XLSheet.Range['H8:h38'].Style        := 'Currency';
    XLSheet.Range['J8:J38'].Style        := 'Currency';
    XLSheet.Range['L8:L38'].Style        := 'Currency';

    XLSheet.Range['C8:C38'].NumberFormat := '#.00';
    XLSheet.Range['E8:E38'].NumberFormat := '#.00';
    XLSheet.Range['G8:G38'].NumberFormat := '#.00';
    XLSheet.Range['I8:I38'].NumberFormat := '#.00';
    XLSheet.Range['K8:K38'].NumberFormat := '#.00';
    XLSheet.Range['M8:M38'].NumberFormat := '#.00';


    Range                     := XLSheet.Range ['B6:M7'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    //Genera los títulos de las columnas

      XLSheet.Cells [6,  2].Formula := Format ('(1) 4T%d', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date)) - 1]);
      XLSheet.Cells [7,  2].Formula := '$';
      XLSheet.Cells [7,  3].Formula := '%';
      XLSheet.Cells [6,  4].Formula := Format ('(2) 1T%d', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date))]);
      XLSheet.Cells [7,  4].Formula := '$';
      XLSheet.Cells [7,  5].Formula := '%';
      XLSheet.Cells [6,  6].Formula := Format ('(3) Saldo al %s', [FormatDateTime ('dd/mm/yyyy', dpFecha.Date)]);
      XLSheet.Cells [7,  6].Formula := '$';
      XLSheet.Cells [7,  7].Formula := '%';
      XLSheet.Cells [6,  8].Formula := 'Diferencia (2-3)';
      XLSheet.Cells [7,  8].Formula := '$';
      XLSheet.Cells [7,  9].Formula := '%';
      XLSheet.Cells [6, 10].Formula := Format ('(4) 4T%d', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date))]);
      XLSheet.Cells [7, 10].Formula := '$';
      XLSheet.Cells [7, 11].Formula := '%';
      XLSheet.Cells [6, 12].Formula := 'Diferencia (4-1)';
      XLSheet.Cells [7, 12].Formula := '$';
      XLSheet.Cells [7, 13].Formula := '%';

    //Carga la información
    Row      := 8;
    QDatos.First;
    while not QDatos.Eof do
    begin

      if QDatos.FieldByName('Orden_Estructura').AsInteger In [1,5,16,27] Then
      begin
        Range                     := XLSheet.Range ['A' + IntToStr(Row) + ':A' + IntToStr(Row)];
        Range.Interior.ThemeColor := xlThemeColorLight1;
        Range.Font.Bold           := True;
        Range.Font.ThemeColor     := xlThemeColorDark1;
      end;

      if QDatos.FieldByName('Orden_Estructura').AsInteger In [4,15,26,30,31] Then
      begin
        Range                     := XLSheet.Range ['A' + IntToStr(Row) + ':M' + IntToStr(Row)];
        Range.Font.Bold           := True;
      end;

      XLSheet.Cells [Row , 1].Formula := QDatos.FieldByName ('Titulos')           .AsString;
      XLSheet.Cells [Row , 2].Value   := QDatos.FieldByName ('Imp_T4YAnt')        .AsString;
      XLSheet.Cells [Row , 3].Value   := QDatos.FieldByName ('Pct_T4YAnt')        .AsString;
      XLSheet.Cells [Row , 4].Value   := QDatos.FieldByName ('Imp_T1YAct')        .AsString;

      XLSheet.Cells [Row , 5].Value   := QDatos.FieldByName ('Pct_T1YAct')        .AsString;
      XLSheet.Cells [Row , 6].Value   := QDatos.FieldByName ('Imp_Saldo_Al')      .AsString;
      XLSheet.Cells [Row , 7].Value   := QDatos.FieldByName ('Pct_Saldo_Al')      .AsString;

      XLSheet.Cells [Row , 8].Value   := QDatos.FieldByName ('Imp_T1_Diferencia') .AsString;
      XLSheet.Cells [Row , 9].Value   := QDatos.FieldByName ('Pct_T1_Diferencia') .AsString;
      XLSheet.Cells [Row , 10].Value  := QDatos.FieldByName ('Imp_T4YAct')        .AsString;

      XLSheet.Cells [Row , 11].Value  := QDatos.FieldByName ('Pct_T4YAct')        .AsString;
      XLSheet.Cells [Row , 12].Value  := QDatos.FieldByName ('Imp_T4_Diferencia') .AsString;
      XLSheet.Cells [Row , 13].Value  := QDatos.FieldByName ('Pct_T4_Diferencia') .AsString;
      QDatos.Next;
      Inc (Row);
    end;

    //Generación de las Gráficas

    {Genera una hoja oculta sin datos formateados para la gráfica}
    XLApp.Workbooks [1].WorkSheets.Add (Null, XLApp.Workbooks [1].WorkSheets [1]);
    XLSheet      := XLApp.Workbooks[1].WorkSheets[2];
    XLSheet.Name := 'Datos';

    Row := 1;
    QDatos.First;
    while not QDatos.Eof do
    begin                                                             
      XLSheet.Cells [Row , 1].Value   := QDatos.FieldByName ('Titulos')           .AsString;
      XLSheet.Cells [Row , 2].Value   := QDatos.FieldByName ('Imp_T4YAnt')        .AsString;
      XLSheet.Cells [Row , 3].Value   := QDatos.FieldByName ('Pct_T4YAnt')        .AsString;
      XLSheet.Cells [Row , 4].Value   := QDatos.FieldByName ('Imp_T1YAct')        .AsString;

      XLSheet.Cells [Row , 5].Value   := QDatos.FieldByName ('Pct_T1YAct')        .AsString;
      XLSheet.Cells [Row , 6].Value   := QDatos.FieldByName ('Imp_Saldo_Al')      .AsString;
      XLSheet.Cells [Row , 7].Value   := QDatos.FieldByName ('Pct_Saldo_Al')      .AsString;

      XLSheet.Cells [Row , 8].Value   := QDatos.FieldByName ('Imp_T1_Diferencia') .AsString;
      XLSheet.Cells [Row , 9].Value   := QDatos.FieldByName ('Pct_T1_Diferencia') .AsString;
      XLSheet.Cells [Row , 10].Value  := QDatos.FieldByName ('Imp_T4YAct')        .AsString;

      XLSheet.Cells [Row , 11].Value  := QDatos.FieldByName ('Pct_T4YAct')        .AsString;
      XLSheet.Cells [Row , 12].Value  := QDatos.FieldByName ('Imp_T4_Diferencia') .AsString;
      XLSheet.Cells [Row , 13].Value  := QDatos.FieldByName ('Pct_T4_Diferencia') .AsString;

      QDatos.Next;
      Inc (Row);
    end;

    XLSheet.Visible := False;

    {Genera la hoja para la gráfica de Organismos Descentralizados}
    XLApp.Workbooks [1].WorkSheets.Add (Null, XLApp.Workbooks [1].WorkSheets [2]);
    XLSheet      := XLApp.Workbooks[1].WorkSheets[3];
    XLSheet.Name := 'Gráfica Org. Descentralizados';

    XLSheet.Cells [1, 1].Formula := Caption;  // Título del reporte
    XLSheet.Range ['A1:N1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['A1'].Font.Bold           := True;

    XLSheet.Cells [2, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Range ['C2:N2'].Merge;
    XLSheet.Range ['A3:N3'].Merge;
    XLSheet.Range ['C2'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Range ['C3'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Cells [2, 3].Formula :=  'Incluye información: Federal, Estatal, Municipal, Órganos Descentralizados';
    XLSheet.Cells [3, 1].Formula :=  'Información de importes expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['A2:N4'].Font.Bold        := True;

    if cbCartasCredito.Checked then
      XLSheet.Cells [4, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [4, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 8].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 8].Formula := 'No incluye intereses cobrados por anticipado';

    XLSheet.Range ['A4:G4'].Merge;
    XLSheet.Range ['H4:N4'].Merge;
    XLSheet.Range ['H4'].HorizontalAlignment := xlHAlignRight;

    Chart4 := XLSheet.ChartObjects.Add (10, 70, 820, 250);
    Chart4.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[2].Range['A1:A' + IntToStr (Row - 2)], xlColumns);
    Chart4.Chart.ChartTitle.Text := 'Org. Descentralizados ' ;

    Chart4.Chart.SeriesCollection [1].Delete;

    Serie1         := Chart4.Chart.SeriesCollection.NewSeries;
    Serie1.Name    := Format ('="(2) 1T%s"', [FormatDateTime ('yyyy', dpFecha.Date)]);
    Serie1.XValues := '=Datos!$A$28:$A$30' ;
    Serie1.Values  := '=Datos!$D$28:$D$30' ;

    Serie2         := Chart4.Chart.SeriesCollection.NewSeries;
    Serie2.Name    := Format ('="(3) Saldo al %s"', [FormatDateTime ('dd/mm/yyyy', dpFecha.Date)]);
    Serie2.XValues := '=Datos!$A$28:$A$30' ;
    Serie2.Values  := '=Datos!$F$28:$F$30' ;

    Serie3         := Chart4.Chart.SeriesCollection.NewSeries;
    Serie3.Name    := '="Diferencia (2-3)"';
    Serie3.XValues := '=Datos!$A$28:$A$30' ;
    Serie3.Values  := '=Datos!$H$28:$H$30' ;

    Serie4         := Chart4.Chart.SeriesCollection.NewSeries;
    Serie4.Name    := Format ('="(4) 4T%s"', [FormatDateTime ('yyyy', dpFecha.Date)]);
    Serie4.XValues := '=Datos!$A$28:$A$30' ;
    Serie4.Values  := '=Datos!$J$28:$J$30' ;

    Serie5         := Chart4.Chart.SeriesCollection.NewSeries;
    Serie5.Name    := Format ('="(1) 4T%d"', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date)) - 1]);
    Serie5.XValues := '=Datos!$A$28:$A$30' ;
    Serie5.Values  := '=Datos!$B$28:$B$30' ;

    Serie6         := Chart4.Chart.SeriesCollection.NewSeries;
    Serie6.Name    := '="Diferencia (4-1)"';
    Serie6.XValues := '=Datos!$A$28:$A$30' ;
    Serie6.Values  := '=Datos!$L$28:$L$30' ;

    {Genera la hoja para la gráfica de Gobiernos Municipales }
    XLApp.Workbooks [1].WorkSheets.Add (Null, XLApp.Workbooks [1].WorkSheets [2]);
    XLSheet      := XLApp.Workbooks[1].WorkSheets[3];
    XLSheet.Name := 'Gráfica Gobiernos Municipales';

    XLSheet.Cells [1, 1].Formula := Caption;  // Título del reporte
    XLSheet.Range ['A1:N1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['A1'].Font.Bold           := True;

    XLSheet.Cells [2, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Range ['C2:N2'].Merge;
    XLSheet.Range ['A3:N3'].Merge;
    XLSheet.Range ['C2'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Range ['C3'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Cells [2, 3].Formula :=  'Incluye información: Federal, Estatal, Municipal, Órganos Descentralizados';
    XLSheet.Cells [3, 1].Formula :=  'Información de importes expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['A2:N4'].Font.Bold        := True;

    if cbCartasCredito.Checked then
      XLSheet.Cells [4, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [4, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 8].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 8].Formula := 'No incluye intereses cobrados por anticipado';

    XLSheet.Range ['A4:G4'].Merge;
    XLSheet.Range ['H4:N4'].Merge;
    XLSheet.Range ['H4'].HorizontalAlignment := xlHAlignRight;

    Chart := XLSheet.ChartObjects.Add (10, 70, 820, 250);
    Chart.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[2].Range['A1:A' + IntToStr (Row - 2)], xlColumns);
    Chart.Chart.ChartTitle.Text := 'Gobiernos Municipales ' ;

    Chart.Chart.SeriesCollection [1].Delete;

    Serie1         := Chart.Chart.SeriesCollection.NewSeries;
    Serie1.Name    := Format ('="(2) 1T%s"', [FormatDateTime ('yyyy', dpFecha.Date)]);
    Serie1.XValues := '=Datos!$A$17:$A$26' ;
    Serie1.Values  := '=Datos!$D$17:$D$26' ;

    Serie2         := Chart.Chart.SeriesCollection.NewSeries;
    Serie2.Name    := Format ('="(3) Saldo al %s"', [FormatDateTime ('dd/mm/yyyy', dpFecha.Date)]);
    Serie2.XValues := '=Datos!$A$17:$A$26' ;
    Serie2.Values  := '=Datos!$F$17:$F$26' ;

    Serie3         := Chart.Chart.SeriesCollection.NewSeries;
    Serie3.Name    := '="Diferencia (2-3)"';
    Serie3.XValues := '=Datos!$A$17:$A$26' ;
    Serie3.Values  := '=Datos!$H$17:$H$26' ;

    Serie4         := Chart.Chart.SeriesCollection.NewSeries;
    Serie4.Name    := Format ('="(4) 4T%s"', [FormatDateTime ('yyyy', dpFecha.Date)]);
    Serie4.XValues := '=Datos!$A$17:$A$26' ;
    Serie4.Values  := '=Datos!$J$17:$J$26' ;

    Serie5         := Chart.Chart.SeriesCollection.NewSeries;
    Serie5.Name    := Format ('="(1) 4T%d"', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date)) - 1]);
    Serie5.XValues := '=Datos!$A$17:$A$26' ;
    Serie5.Values  := '=Datos!$B$17:$B$26' ;

    Serie6         := Chart.Chart.SeriesCollection.NewSeries;
    Serie6.Name    := '="Diferencia (4-1)"';
    Serie6.XValues := '=Datos!$A$17:$A$26' ;
    Serie6.Values  := '=Datos!$L$17:$L$26' ;

       {Genera la hoja para la gráfica  de Gobiernos Estatales }
    XLApp.Workbooks [1].WorkSheets.Add (Null, XLApp.Workbooks [1].WorkSheets [2]);
    XLSheet      := XLApp.Workbooks[1].WorkSheets[3];
    XLSheet.Name := 'Gráfica Gobiernos Estatales';

    XLSheet.Cells [1, 1].Formula := Caption;  // Título del reporte
    XLSheet.Range ['A1:N1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['A1'].Font.Bold           := True;

    XLSheet.Cells [2, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Range ['C2:N2'].Merge;
    XLSheet.Range ['A3:N3'].Merge;
    XLSheet.Range ['C2'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Range ['C3'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Cells [2, 3].Formula :=  'Incluye información: Federal, Estatal, Municipal, Órganos Descentralizados';
    XLSheet.Cells [3, 1].Formula :=  'Información de importes expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['A2:N4'].Font.Bold        := True;

    if cbCartasCredito.Checked then
      XLSheet.Cells [4, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [4, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 8].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 8].Formula := 'No incluye intereses cobrados por anticipado';

    XLSheet.Range ['A4:G4'].Merge;
    XLSheet.Range ['H4:N4'].Merge;
    XLSheet.Range ['H4'].HorizontalAlignment := xlHAlignRight;

    Chart2 := XLSheet.ChartObjects.Add (10, 70 , 820, 250);
    Chart2.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[2].Range['A1:A' + IntToStr (Row - 2)], xlColumns);
    Chart2.Chart.ChartTitle.Text := 'Gobiernos Estatales' ;

    Chart2.Chart.SeriesCollection [1].Delete;

    Serie1         := Chart2.Chart.SeriesCollection.NewSeries;
    Serie1.Name    := Format ('="(2) 1T%s"', [FormatDateTime ('yyyy', dpFecha.Date)]);
    Serie1.XValues := '=Datos!$A$6:$A$15' ;
    Serie1.Values  := '=Datos!$D$6:$D$4' ;

    Serie2         := Chart2.Chart.SeriesCollection.NewSeries;
    Serie2.Name    := Format ('="(3) Saldo al %s"', [FormatDateTime ('dd/mm/yyyy', dpFecha.Date)]);
    Serie2.XValues := '=Datos!$A$6:$A$15' ;
    Serie2.Values  := '=Datos!$F$6:$F$15' ;

    Serie3         := Chart2.Chart.SeriesCollection.NewSeries;
    Serie3.Name    := '="Diferencia (2-3)"';
    Serie3.XValues := '=Datos!$A$6:$A$15' ;
    Serie3.Values  := '=Datos!$H$6:$h$15' ;

    Serie4         := Chart2.Chart.SeriesCollection.NewSeries;
    Serie4.Name    := Format ('="(4) 4T%s"', [FormatDateTime ('yyyy', dpFecha.Date)]);
    Serie4.XValues := '=Datos!$A$6:$A$15' ;
    Serie4.Values  := '=Datos!$J$6:$J$15' ;

    Serie5         := Chart2.Chart.SeriesCollection.NewSeries;
    Serie5.Name    := Format ('="(1) 4T%d"', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date)) - 1]);
    Serie5.XValues := '=Datos!$A$6:$A$15' ;
    Serie5.Values  := '=Datos!$B$6:$B$15' ;

    Serie6         := Chart2.Chart.SeriesCollection.NewSeries;
    Serie6.Name    := '="Diferencia (4-1)"';
    Serie6.XValues := '=Datos!$A$6:$A$15' ;
    Serie6.Values  := '=Datos!$L$6:$L$15' ;

    {Genera la hoja para la gráfica para Gobierno Federal }
    XLApp.Workbooks [1].WorkSheets.Add (Null, XLApp.Workbooks [1].WorkSheets [2]);
    XLSheet      := XLApp.Workbooks[1].WorkSheets[3];
    XLSheet.Name := 'Gráfica Gobierno Federal ';

    XLSheet.Cells [1, 1].Formula := Caption;  // Título del reporte
    XLSheet.Range ['A1:N1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['A1'].Font.Bold           := True;

    XLSheet.Cells [2, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Range ['C2:N2'].Merge;
    XLSheet.Range ['A3:N3'].Merge;
    XLSheet.Range ['C2'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Range ['C3'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Cells [2, 3].Formula :=  'Incluye información: Federal, Estatal, Municipal, Órganos Descentralizados';
    XLSheet.Cells [3, 1].Formula :=  'Información de importes expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['A2:N4'].Font.Bold        := True;

    if cbCartasCredito.Checked then
      XLSheet.Cells [4, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [4, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 8].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 8].Formula := 'No incluye intereses cobrados por anticipado';

    XLSheet.Range ['A4:G4'].Merge;
    XLSheet.Range ['H4:N4'].Merge;
    XLSheet.Range ['H4'].HorizontalAlignment := xlHAlignRight;

    Chart3 := XLSheet.ChartObjects.Add (10, 70 , 820, 250);
    Chart3.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[2].Range['A1:A' + IntToStr (Row - 2)], xlColumns);
    Chart3.Chart.ChartTitle.Text := 'Gobierno Federal ' ;

    Chart3.Chart.SeriesCollection [1].Delete;

    Serie1         := Chart3.Chart.SeriesCollection.NewSeries;
    Serie1.Name    := Format ('="(2) 1T%s"', [FormatDateTime ('yyyy', dpFecha.Date)]);
    Serie1.XValues := '=Datos!$A$2:$A$4' ;
    Serie1.Values  := '=Datos!$D$2:$D$4' ;

    Serie2         := Chart3.Chart.SeriesCollection.NewSeries;
    Serie2.Name    := Format ('="(3) Saldo al %s"', [FormatDateTime ('dd/mm/yyyy', dpFecha.Date)]);
    Serie2.XValues := '=Datos!$A$2:$A$4' ;
    Serie2.Values  := '=Datos!$F$2:$F$4' ;

    Serie3         := Chart3.Chart.SeriesCollection.NewSeries;
    Serie3.Name    := '="Diferencia (2-3)"';
    Serie3.XValues := '=Datos!$A$2:$A$4' ;
    Serie3.Values  := '=Datos!$H$2:$H$4' ;

    Serie4         := Chart3.Chart.SeriesCollection.NewSeries;
    Serie4.Name    := Format ('="(4) 4T%s"', [FormatDateTime ('yyyy', dpFecha.Date)]);
    Serie4.XValues := '=Datos!$A$2:$A$4' ;
    Serie4.Values  := '=Datos!$J$2:$J$4' ;

    Serie5         := Chart3.Chart.SeriesCollection.NewSeries;
    Serie5.Name    := Format ('="(1) 4T%d"', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date)) - 1]);
    Serie5.XValues := '=Datos!$A$2:$A$4' ;
    Serie5.Values  := '=Datos!$B$2:$B$4' ;

    Serie6         := Chart3.Chart.SeriesCollection.NewSeries;
    Serie6.Name    := '="Diferencia (4-1)"';
    Serie6.XValues := '=Datos!$A$2:$A$4' ;
    Serie6.Values  := '=Datos!$L$2:$L$4' ;


    XLApp.Workbooks[1].WorkSheets[1].Activate;

  finally
    Cursor := crArrow;
    XLApp.Workbooks[1].SaveAs (FileName);
    XLApp.Quit;
    XLSheet  := Unassigned;
    Range    := Unassigned;
    XLApp    := Unassigned;
  end;
end;

procedure TWCrCompSeP.sbExportarDetallesClick(Sender: TObject);
var
  XLApp: Variant;
begin
  sbExportarDetalles.Refresh;
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

procedure TWCrCompSep.ExportarDetalles (FileName: string);
var
  XLApp, XLSheet, Range: Variant;
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
    XLSheet.Range ['A1:I1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment    := xlHAlignCenter;

    XLSheet.Cells [2, 1].Formula := 'Incluye información: Federal, Estatal, Municipal, Órganos Descentralizados';
    XLSheet.Range ['A2:I2'].Merge;
    XLSheet.Range ['A2'].HorizontalAlignment    := xlHAlignCenter;

    XLSheet.Cells [3, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [3, 2].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['B3:I3'].Merge;

    if cbCartasCredito.Checked then
      XLSheet.Cells [4, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [4, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 6].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 6].Formula := 'No incluye intereses cobrados por anticipado';

    XLSheet.Range ['A4:E4'].Merge;
    XLSheet.Range ['F4:I4'].Merge;
    XLSheet.Range ['F4'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Range ['B3'].HorizontalAlignment := xlHAlignRight;

    XLSheet.Columns ['C'].columnwidth := 35;
    XLSheet.Columns ['A'].columnwidth := 20;
    XLSheet.Columns ['B'].columnwidth := 20;
    XLSheet.Columns ['D'].columnwidth := 20;
    XLSheet.Columns ['E'].columnwidth := 20;
    XLSheet.Columns ['F'].columnwidth := 20;
    XLSheet.Columns ['G'].columnwidth := 20;
    XLSheet.Columns ['H'].columnwidth := 20;
    XLSheet.Columns ['I'].columnwidth := 20;

    {Encabezado de las columnas}
    XLSheet.Cells [5, 1].Formula := 'Sector';
    XLSheet.Cells [5, 2].Formula := 'Tipo Entidad';
    XLSheet.Cells [5, 3].Formula := 'Nombre Acreditado';
    XLSheet.Cells [5, 4].Formula := 'Id Acreditado';
    XLSheet.Cells [5, 5].Formula := 'Id Contrato';
    XLSheet.Cells [5, 6].Formula := 'Id Crédito';
    XLSheet.Cells [5, 7].Formula := 'Tipo Crédito';
    XLSheet.Cells [5, 8].Formula := Format (' Saldo al %s', [FormatDateTime ('dd/mm/yyyy', dpFecha.Date)]);
    XLSheet.Cells [5, 9].Formula := Format (' 4T%d', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date)) - 1]);

    
    XLSheet.Range ['A1:I5'].Font.Bold := True;
    XLSheet.Range ['A5:I5'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range['H6:I' + IntToStr (QDetalles.RecordCount + 4)].Style  := 'Currency';

    Range                     := XLSheet.Range ['A5:I5'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row      := 6;
    RowIni   := Row;
    CurrTipo := -1;
    QDetalles.First;

    while not QDetalles.Eof do
    begin
      XLSheet.Cells [Row, 1].Formula := QDetalles.FieldByName ('Titulos')      .AsString;
      XLSheet.Cells [Row, 2].Formula := QDetalles.FieldByName ('Tipo_Entidad') .AsString;
      XLSheet.Cells [Row, 3].Formula := QDetalles.FieldByName ('Nom_Acred_Reg').AsString;
      XLSheet.Cells [Row, 4].Formula := QDetalles.FieldByName ('Id_Acreditado').AsFloat;
      XLSheet.Cells [Row, 5].Value   := QDetalles.FieldByName ('Id_Contrato')  .AsFloat;
      XLSheet.Cells [Row, 6].Value   := QDetalles.FieldByName ('Id_Credito')   .AsFloat;
      XLSheet.Cells [Row, 7].Value   := QDetalles.FieldByName ('Tipo_Credito') .AsString;
      XLSheet.Cells [Row, 8].Value   := QDetalles.FieldByName ('Saldo_Actual') .AsFloat;
      XLSheet.Cells [Row, 9].Value   := QDetalles.FieldByName ('Saldo_T4Ant')  .AsFloat;
      QDetalles.Next;
      Inc (Row);
    end;

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
