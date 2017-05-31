// Sistema         : Clase de NINGUNO
// Fecha de Inicio : 17/04/2012
// Función forma   : Clase de NINGUNO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qforlxvhziifraxzhgil
// Comentarios     :
Unit IntCrSecPubl;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, Ungene, IntQrSecPubl,
IntParamCre,ComObj;

const ALTO_COL = 16;
      ALTO_DOBLE = 20;

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
 TCrSecPubl= class;

  TWCrSecPubl=Class(TForm)
    Panel1: TPanel;
    sgSecPubl: TSGCtrl;
    QDatos: TQuery;
    dpFecha: TDateTimePicker;
    Label1: TLabel;
    QDatostitulo: TStringField;
    QDatosSaldo: TFloatField;
    QDatosPct_Saldo: TFloatField;
    rgFactorMoneda: TRadioGroup;
    bbImprimir: TBitBtn;
    InterForma1: TInterForma;
    sbExportar: TSpeedButton;
    SaveXLS: TSaveDialog;
    sbExportarDetalles: TSpeedButton;
    QDetalles: TQuery;
    btBusca: TBitBtn;
    cbCartasCredito: TCheckBox;
    cbInteresesAnticipados: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure InterForma1BtnAyudaClick(Sender: TObject);
    procedure sgSecPublCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure bbImprimirClick(Sender: TObject);
    procedure btBuscaClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure ExportarXLS (FileName: string);
    procedure ExportarDetalles (FileName: string);
    procedure sbExportarDetallesClick(Sender: TObject);
    private
    { Private declarations }
      procedure Generaconsulta;
    public
    { Public declarations }
    Objeto : TCrSecPubl;
end;

 TCrSecPubl= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ParamCre                 : TParamCre;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

{$R *.DFM}

function BoolToStr (b: boolean): string;
begin
  if b then
    result := 'V'
  else
    result := 'F';
end;

constructor TCrSecPubl.Create( AOwner : TComponent );
begin Inherited;
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrSecPubl.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrSecPubl.Destroy;
begin inherited;
end;


function TCrSecPubl.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrSecPubl;
begin
   W:=TWCrSecPubl.Create(Self);
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

procedure TWCrSecPubl.FormShow(Sender: TObject);
begin
  dpFecha.Date := Objeto.Apli.DameFechaEmpresa;
  Generaconsulta;
end;

procedure TWCrSecPubl.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrSecPubl.GeneraConsulta;
var
  Factor: double;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  QDatos.Close;
  QDatos.DatabaseName                            := Objeto.Apli.DataBaseName;
  QDatos.SessionName                             := Objeto.Apli.SessionName;
  QDatos.ParamByName ('peFecha').AsDate          := dpFecha.Date - 1;
  QDatos.ParamByName ('peFactor').AsFloat        := Factor;
  QDatos.ParamByName ('peCartas_Cred').AsString  := BoolToStr (cbCartasCredito.Checked);
  QDatos.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
  QDatos.Open;


  sgSecPubl.AddQry(QDatos, // Query
                    True, // Iniciar Grid, Limpiar Lineas Anteriores.
                    True, // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
                    -1,   // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
                    ALTO_COL,  // Alto del Header, -1 es el Default 32 Columnas
                    ALTO_DOBLE,// Alto del las Lineas, 1 es el Default 32
                    True); // ShowTitle
end;

procedure TWCrSecPubl.InterForma1BtnAyudaClick(Sender: TObject);
begin
  RepCarteraPorSectorPublico (dpFecha.Date - 1, '', cbCartasCredito.Checked, cbInteresesAnticipados.Checked, QDatos, 1, Objeto.Apli, True);
end;

procedure TWCrSecPubl.sgSecPublCalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
begin
    if RowCaso = rcRowBegin then
  begin
    sgSecPubl.SetActualHeight (ALTO_COL);
    if DataSet.FieldByName ('Titulo').AsString = 'Total' then
       sgSecPubl.SetActualAsHeader;
    end;
end;

procedure TWCrSecPubl.bbImprimirClick(Sender: TObject);
var
  Factor: double;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  RepCarteraPorSectorPublico (dpFecha.Date - 1, '', cbCartasCredito.Checked, cbInteresesAnticipados.Checked, QDatos, Factor, Objeto.Apli, True);
end;

procedure TWCrSecPubl.btBuscaClick(Sender: TObject);
begin
  GeneraConsulta;
end;

procedure TWCrSecPubl.sbExportarClick(Sender: TObject);
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

procedure TWCrSecPubl.ExportarXLS (FileName: string);
var
  XLApp, XLSheet: Variant;
  Range, Chart, Serie: Variant;
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
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [2, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [2, 2].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];

    if cbCartasCredito.Checked then
      XLSheet.Cells [3, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [3, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [3, 2].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [3, 2].Formula := 'No incluye intereses cobrados por anticipado';

    XLSheet.Range ['A1:C1'].Merge;
    XLSheet.Range ['B2:C2'].Merge;
    XLSheet.Range ['B3:C3'].Merge;
    XLSheet.Range ['A4:C4'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['B2'].HorizontalAlignment    := xlHAlignRight;
    XLSheet.Range ['B3'].HorizontalAlignment    := xlHAlignRight;
    XLSheet.Columns ['C'].columnwidth           := 20;
    XLSheet.Columns ['A'].columnwidth           := 46;
    XLSheet.Columns ['B'].columnwidth           := 30;

    {Encabezado de las columnas}
    XLSheet.Cells [4, 1].Formula := 'Entidad';
    XLSheet.Cells [4, 2].Formula := '$';
    XLSheet.Cells [4, 3].Formula := '%';

    XLSheet.Range ['A1:G4'].Font.Bold := True;
    XLSheet.Range ['E3'].HorizontalAlignment     := xlHAlignCenter;
    XLSheet.Range ['C4:D4'].HorizontalAlignment  := xlHAlignCenter;
    XLSheet.Range ['B5:B14'].Style               := 'Currency';
    XLSheet.Range ['C5:C14'].Style               := 'Percent';
    XLSheet.Range ['C5:C14'].NumberFormat        := '0.00%';
    XLSheet.Range ['C5:c14'].HorizontalAlignment := xlHAlignCenter;

    Range                     := XLSheet.Range ['A4:C4'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Range                     := XLSheet.Range ['A14:C14'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row      := 5;
    RowIni   := Row;
    CurrTipo := -1;
    QDatos.First;
    while not QDatos.Eof do
    begin
      XLSheet.Cells [Row, 1].Formula := QDatos.FieldByName ('Titulo').AsString;
      XLSheet.Cells [Row, 2].Value   := QDatos.FieldByName ('Saldo').AsFloat;
      XLSheet.Cells [Row, 3].Value   := QDatos.FieldByName ('Pct_Saldo').AsFloat / 100;
      QDatos.Next;
      Inc (Row);
    end;

    XLSheet.Range ['A5'].Select;
    XLApp.ActiveWindow.FreezePanes := True;
  finally
    Cursor := crArrow;
    XLApp.Workbooks[1].SaveAs (FileName);
    XLApp.Quit;
    XLSheet  := Unassigned;
    Range    := Unassigned;
    XLApp    := Unassigned;
  end;
end;


procedure TWCrSecPubl.ExportarDetalles (FileName: string);
var
  XLApp, XLSheet: Variant;
  Range: Variant;
  Row, RowIni, CurrTipo: integer;
  Factor :  Double;
begin
  XLApp := CreateOleObject('Excel.Application');

  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  try
    QDetalles.Close;
    QDetalles.DatabaseName                           := Objeto.Apli.DataBaseName;
    QDetalles.SessionName                            := Objeto.Apli.SessionName;
    QDetalles.ParamByName ('peFecha').AsDate         := dpFecha.Date - 1;
    QDetalles.ParamByName ('peFactor').AsFloat       := Factor;
    QDetalles.ParamByName ('peCartas_Cred').AsString := BoolToStr (cbCartasCredito.Checked);
    QDetalles.ParamByName ('peInt_Cob_Ant').AsString := BoolToStr (cbInteresesAnticipados.Checked);
    QDetalles.Open;

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
    XLSheet.Range ['B2:I2'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [2, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [2, 2].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['B2'].HorizontalAlignment     := xlHAlignRight;

    if cbCartasCredito.Checked then
      XLSheet.Cells [3, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [3, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [3, 5].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [3, 5].Formula := 'No incluye intereses cobrados por anticipado';

    XLSheet.Range ['A3:D3'].Merge;
    XLSheet.Range ['E3:I3'].Merge;
    XLSheet.Range ['E3'].HorizontalAlignment := xlHAlignRight;

    {Encabezado de las columnas}
    XLSheet.Cells [4, 1].Formula := 'Sector';
    XLSheet.Cells [4, 2].Formula := 'Tipo Entidad';
    XLSheet.Cells [4, 3].Formula := 'Nombre Acreditado';
    XLSheet.Cells [4, 4].Formula := 'Id Acreditado';
    XLSheet.Cells [4, 5].Formula := 'Id Contrato';
    XLSheet.Cells [4, 6].Formula := 'Id Crédito';
    XLSheet.Cells [4, 7].Formula := 'Tipo Crédito';
    XLSheet.Cells [4, 8].Formula := 'Saldo';
    XLSheet.Cells [4, 9].Formula := 'Porcentaje';

    XLSheet.Range ['A1:I4'].Font.Bold := True;
    XLSheet.Range ['A4:I4'].HorizontalAlignment := xlHAlignCenter;

    Range                     := XLSheet.Range ['A4:I4'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row      := 5;
    RowIni   := Row;
    CurrTipo := -1;
    QDetalles.First;

    while not QDetalles.Eof do
    begin
      XLSheet.Cells [Row, 1].Formula := QDetalles.FieldByName ('Titulo')       .AsString;
      XLSheet.Cells [Row, 2].Formula := QDetalles.FieldByName ('Tipo_Entidad') .AsString;
      XLSheet.Cells [Row, 3].Formula := QDetalles.FieldByName ('Nom_Acred_Reg').AsString;
      XLSheet.Cells [Row, 4].Value   := QDetalles.FieldByName ('Id_Acreditado').AsFloat;
      XLSheet.Cells [Row, 5].Value   := QDetalles.FieldByName ('Id_Contrato')  .AsFloat;
      XLSheet.Cells [Row, 6].Value   := QDetalles.FieldByName ('Id_Credito')   .AsFloat;
      XLSheet.Cells [Row, 7].Value   := QDetalles.FieldByName ('Tipo_Credito') .AsString;
      XLSheet.Cells [Row, 8].Value   := QDetalles.FieldByName ('Saldos')       .AsFloat;
      XLSheet.Cells [Row, 9].Value   := QDetalles.FieldByName ('Porcentaje')   .AsFloat;
      QDetalles.Next;
      Inc (Row);
    end;

    XLSheet.Columns ['A:I'].ColumnWidth := 20;
    XLSheet.Columns ['C'].ColumnWidth   := 35;
    XLSheet.Range['H4:H' + IntToStr (QDetalles.RecordCount + 4)].Style               := 'Currency';
    XLSheet.Range['I4:I' + IntToStr (QDetalles.RecordCount + 4)].Style               := 'Percent';
    XLSheet.Range['I4:I' + IntToStr (QDetalles.RecordCount + 4)].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range['I4:I' + IntToStr (QDetalles.RecordCount + 4)].Style               := 'Percent';
    XLSheet.Range['I4:I' + IntToStr (QDetalles.RecordCount + 4)].NumberFormat        :=  '0.00%';

    XLSheet.Range ['A5'].Select;
    XLApp.ActiveWindow.FreezePanes := True;

  finally
    Cursor := crArrow;
    XLApp.Workbooks[1].SaveAs (FileName);
    XLApp.Quit;
    XLSheet  := Unassigned;
    Range    := Unassigned;
    XLApp    := Unassigned;
  end;
end;

procedure TWCrSecPubl.sbExportarDetallesClick(Sender: TObject);
var
  XLApp: Variant;
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

end.
