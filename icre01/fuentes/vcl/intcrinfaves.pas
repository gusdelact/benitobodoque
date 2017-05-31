unit IntCrInfAves;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, ComObj, Grids,
  Aligrid, IntCrQrInfAves;

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
  TCrInfAves  = class;

  TWCRInfAves = class(TForm)
    InterForma1: TInterForma;
    Label1: TLabel;
    sbExportar: TSpeedButton;
    dpFecha: TDateTimePicker;
    rgFactorMoneda: TRadioGroup;
    GroupBox1: TGroupBox;
    cbEstados: TCheckBox;
    cbMunicipios: TCheckBox;
    cbOrgDesc: TCheckBox;
    cbPrivado: TCheckBox;
    cbFederal: TCheckBox;
    btBusca: TBitBtn;
    bbImprimir: TBitBtn;
    QDatos: TQuery;
    SaveXLS: TSaveDialog;
    sagDatos: TStringAlignGrid;
    QLeyendaEntidades: TQuery;
    sbExportarDetalles: TSpeedButton;
    QDetalles: TQuery;
    cbCartasCredito: TCheckBox;
    cbInteresesAnticipados: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btBuscaClick(Sender: TObject);
    procedure bbImprimirClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure ExportarXLS (FileName: string);
    procedure sbExportarDetallesClick(Sender: TObject);
    procedure ExportarDetalles (FileName: string);
  private
    { Private declarations }
    procedure GeneraConsulta;
    function ConstruyeTipoEntidad: string;
    function Money (f: double): string;
  public
    { Public declarations }
    Objeto : TCrInfAves;

  end;

  TCrInfAves = class(TInterFrame)
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

function BoolToStr (b: boolean): string;
begin
  if b then
    result := 'V'
  else
    result := 'F';
end;

constructor TCrInfAves.Create( AOwner : TComponent );
begin
  Inherited;
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'InTCrInfAves.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrInfAves.Destroy;
begin inherited;
end;

function TCrInfAves.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrInfAves;
begin
   W:=TWCrInfAves.Create(Self);

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




procedure TWCRInfAves.FormShow(Sender: TObject);
begin
  dpFecha.Date := Objeto.Apli.DameFechaEmpresa;
  GeneraConsulta;
end;


function TWCrInfAves.ConstruyeTipoEntidad: string;
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

procedure TWCrInfAves.GeneraConsulta;
var
  Factor: double;
  Row : integer;
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
  QDatos.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QDatos.ParamByName ('peCartas_Cred').AsString := BoolToStr (cbCartasCredito.Checked);
  QDatos.ParamByName ('peInt_Cob_Ant').AsString := BoolToStr (cbInteresesAnticipados.Checked);
  QDatos.Open;

  SagDatos.Refresh;
  DecimalSeparator:= '.';
  thousandseparator:=',';
  SagDatos.RowCount := qDatos.RecordCount * 3 + 2;

  //Ajusta el alto de las filas
  Row:= 2;
  while Row <  qDatos.RecordCount * 3 + 2 do
  begin
  SagDatos.RowHeights[Row] := 17;
  Inc (Row);
  end;

  //Carga la informacion en el Grid
  Row := 0;
  while not QDatos.Eof do
  begin
    SagDatos.Cells[1,2 + 3 * Row]   := qDatos.FieldByName('Region').AsString;
    SagDatos.Cells[2,2 + 3 * Row]   := 'Importe';
    SagDatos.Cells[2,3 + 3 * Row]   := 'Acreditados';
    SagDatos.Cells[2,4 + 3 * Row]   := 'Lineas';
    SagDatos.Cells[3,2 + 3 * Row]   := Money (qDatos.FieldByName ('Importe_Normal')   .AsFloat);
    SagDatos.Cells[3,3 + 3 * Row]   :=        qDatos.FieldByName ('Acreds_Normal')    .AsString;
    SagDatos.Cells[3,4 + 3 * Row]   :=        qDatos.FieldByName ('Lineas_Normal')    .AsString;
    SagDatos.Cells[4,2 + 3 * Row]   := Money (qDatos.FieldByName ('Importe_Ave1')     .AsFloat);
    SagDatos.Cells[4,3 + 3 * Row]   :=        qDatos.FieldByName ('Acreds_Ave1')      .AsString;
    SagDatos.Cells[4,4 + 3 * Row]   :=        qDatos.FieldByName ('Lineas_Ave1')      .AsString;
    SagDatos.Cells[5,2 + 3 * Row]   := Money (qDatos.FieldByName ('Importe_Ave2')     .AsFloat);
    SagDatos.Cells[5,3 + 3 * Row]   :=        qDatos.FieldByName ('Acreds_Ave2')      .AsString;
    SagDatos.Cells[5,4 + 3 * Row]   :=        qDatos.FieldByName ('Lineas_Ave2')      .AsString;
    SagDatos.Cells[6,2 + 3 * Row]   := Money (qDatos.FieldByName ('Importe_Ave3')     .AsFloat);
    SagDatos.Cells[6,3 + 3 * Row]   :=        qDatos.FieldByName ('Acreds_Ave3')      .AsString;
    SagDatos.Cells[6,4 + 3 * Row]   :=        qDatos.FieldByName ('Lineas_Ave3')      .AsString;
    SagDatos.Cells[7,2 + 3 * Row]   := Money (qDatos.FieldByName ('Importe_Ave4')     .AsFloat);
    SagDatos.Cells[7,3 + 3 * Row]   :=        qDatos.FieldByName ('Acreds_Ave4')      .AsString;
    SagDatos.Cells[7,4 + 3 * Row]   :=        qDatos.FieldByName ('Lineas_Ave4')      .AsString;
    SagDatos.Cells[8,2 + 3 * Row]   := Money (qDatos.FieldByName ('Importe_Ave5')     .Asfloat);
    SagDatos.Cells[8,3 + 3 * Row]   :=        qDatos.FieldByName ('Acreds_Ave5')      .AsString;
    SagDatos.Cells[8,4 + 3 * Row]   :=        qDatos.FieldByName ('Lineas_Ave5')      .AsString;
    SagDatos.Cells[9,2 + 3 * Row]   := Money (qDatos.FieldByName ('Total_Cal_Importe').AsFloat);
    SagDatos.Cells[9,3 + 3 * Row]   :=        qDatos.FieldByName ('Total_Cal_Acreds') .AsString;
    SagDatos.Cells[9,4 + 3 * Row]   :=        qDatos.FieldByName ('Total_Cal_Lineas') .AsString;
    SagDatos.Cells[10,2 + 3 * Row]  := Money (qDatos.FieldByName ('Importe_No_Rev')   .AsFloat);
    SagDatos.Cells[10,3 + 3 * Row]  :=        qDatos.FieldByName ('Acred_No_Rev')     .AsString;
    SagDatos.Cells[10,4 + 3 * Row]  :=        qDatos.FieldByName ('Lineas_No_Rev')    .AsString;

    //Intercala el Color de las Filas
    if  (Row Mod 2) > 0   Then
    begin
      sagDatos.ColorRow [2 + 3 * Row] := $00E5F9F3;
      sagDatos.ColorRow [3 + 3 * Row] := $00E5F9F3;
      sagDatos.ColorRow [4 + 3 * Row] := $00E5F9F3;
    end;

    //Cambia el color de fondo para las filas de total
    if qDatos.FieldByName ('Region').AsString = 'Total' Then
    begin
      sagDatos.ColorRow [2 + 3 * Row] := sagDatos.ColorRow [1];
      sagDatos.ColorRow [3 + 3 * Row] := sagDatos.ColorRow [1];
      sagDatos.ColorRow [4 + 3 * Row] := sagDatos.ColorRow [1];
    end;

    QDatos.Next;
    Inc (Row);
  end;

end;

procedure TWCRInfAves.btBuscaClick(Sender: TObject);
begin
  GeneraConsulta;
end;

procedure TWCRInfAves.bbImprimirClick(Sender: TObject);
var
  Factor: double;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  RepSeguimientoAves (dpFecha.Date - 1, ConstruyeTipoEntidad, cbCartasCredito.Checked, cbInteresesAnticipados.Checked, QDatos, Factor, Objeto.Apli, True);
end;

function TWCRInfAves.Money (f: double): string;
begin
  result := Format ('%m', [f]);
  result := Copy (result, 1, Length (result) - 2);
end;

procedure TWCRInfAves.sbExportarClick(Sender: TObject);
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

procedure TWCrInfAves.ExportarXLS (FileName: string);
var
  XLApp, XLSheet: Variant;
  Range, Chart, Chart2, Chart3 : Variant;
  Serie1, Serie2, Serie3, Serie4, Serie5, Serie6, Serie7: Variant;
  Row,  B_Total : integer;

  procedure BorderRange (RangeStr: string);
  begin
    Range                                        := XLSheet.Range [RangeStr];

    Range.Borders [xlDiagonalDown].LineStyle     := xlNone;
    Range.Borders [xlDiagonalUp].LineStyle       := xlNone;
    Range.Borders [xlEdgeLeft].LineStyle         := xlContinuous;
    Range.Borders [xlEdgeLeft].ColorIndex        := 0;
    Range.Borders [xlEdgeLeft].TintAndShade      := 0;
    Range.Borders [xlEdgeLeft].Weight            := xlMedium;

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
    QLeyendaEntidades.Close;
    QLeyendaEntidades.DatabaseName                            := Objeto.Apli.DataBaseName;
    QLeyendaEntidades.SessionName                             := Objeto.Apli.SessionName;
    QLeyendaEntidades.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
    QLeyendaEntidades.Open;

    Cursor              := crHourGlass;
    XLApp.Visible       := False;
    XLApp.DisplayAlerts := False;
    XLApp.Workbooks.Add(xlWBatWorkSheet);

    {Inicia la generación de la tabla}
    XLSheet      := XLApp.Workbooks[1].WorkSheets[1];
    XLSheet.Name := 'Tabla';

    {Encabezado del reporte}
    XLSheet.Cells [1, 1].Formula             := Caption;  // Título del reporte
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['A1:J1'].Merge;

    XLSheet.Cells [2, 1].Formula             := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['A2:J2'].Merge;

    XLSheet.Cells [3, 1].Formula             := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [3, 2].Formula             := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['B3'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Range ['B3:J3'].Merge;

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
    XLSheet.Range ['A1:J4'].Font.Bold        := True;

    {Encabezado de las columnas}
    XLSheet.Cells [6, 3].Formula  := 'Calificados';
    XLSheet.Cells [7, 1].Formula  := 'Región ';
    XLSheet.Cells [7, 2].Formula  := 'Acreditados  ';
    XLSheet.Cells [7, 3].Formula  := 'Normal';
    XLSheet.Cells [7, 4].Formula  := 'Ave 1';
    XLSheet.Cells [7, 5].Formula  := 'Ave 2';
    XLSheet.Cells [7, 6].Formula  := 'Ave 3';
    XLSheet.Cells [7, 7].Formula  := 'Ave 4';
    XLSheet.Cells [7, 8].Formula  := 'Ave 5';
    XLSheet.Cells [7, 9].Formula  := 'Total Calificado';
    XLSheet.Cells [7, 10].Formula := 'No Sujetos a Revisión ';

    //Cambia los formatos de titulos de columnas y totales
    Range                     := XLSheet.Range ['C6:I6'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;
    Range.HorizontalAlignment := xlHAlignCenter;
    Range.Merge;

    Range                     := XLSheet.Range ['A7:J7'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    XLSheet.Range ['A6:J6'].HorizontalAlignment := xlHAlignCenter;


    //Carga la información
    Row      := 0;
    QDatos.First;
    while not QDatos.Eof do
    begin
      XLSheet.Range ['C' + IntToStr(8 + 3 * Row) + ':J'+ IntToStr(8 + 3 * Row) ].NumberFormat := '#,##0.00';

      XLSheet.Cells [ 8 + 3 * Row, 1].Formula := QDatos.FieldByName ('Region').AsString;

      XLSheet.Cells [ 8 + 3 * Row, 2].Formula := 'Importe';
      XLSheet.Cells [ 9 + 3 * Row, 2].Formula := 'Acreditados';
      XLSheet.Cells [10 + 3 * Row, 2].Formula := 'Lineas';

      XLSheet.Cells [ 8 + 3 * Row, 3].Value   := QDatos.FieldByName ('Importe_Normal').AsString;
      XLSheet.Cells [ 9 + 3 * Row, 3].Value   := QDatos.FieldByName ('Acreds_Normal').AsString;
      XLSheet.Cells [10 + 3 * Row, 3].Value   := QDatos.FieldByName ('Lineas_Normal').AsString;

      XLSheet.Cells [ 8 + 3 * Row, 4].Value   := QDatos.FieldByName ('Importe_Ave1').AsString;
      XLSheet.Cells [ 9 + 3 * Row, 4].Value   := QDatos.FieldByName ('Acreds_Ave1').AsString;
      XLSheet.Cells [10 + 3 * Row, 4].Value   := QDatos.FieldByName ('Lineas_Ave1').AsString;

      XLSheet.Cells [ 8 + 3 * Row, 5].Value   := QDatos.FieldByName ('Importe_Ave2').AsString;
      XLSheet.Cells [ 9 + 3 * Row, 5].Value   := QDatos.FieldByName ('Acreds_Ave2').AsString;
      XLSheet.Cells [10 + 3 * Row, 5].Value   := QDatos.FieldByName ('Lineas_Ave2').AsString;

      XLSheet.Cells [ 8 + 3 * Row, 6].Value   := QDatos.FieldByName ('Importe_Ave3').AsString;
      XLSheet.Cells [ 9 + 3 * Row, 6].Value   := QDatos.FieldByName ('Acreds_Ave3').AsString;
      XLSheet.Cells [10 + 3 * Row, 6].Value   := QDatos.FieldByName ('Lineas_Ave3').AsString;

      XLSheet.Cells [ 8 + 3 * Row, 7].Value   := QDatos.FieldByName ('Importe_Ave4').AsString;
      XLSheet.Cells [ 9 + 3 * Row, 7].Value   := QDatos.FieldByName ('Acreds_Ave4').AsString;
      XLSheet.Cells [10 + 3 * Row, 7].Value   := QDatos.FieldByName ('Lineas_Ave4').AsString;

      XLSheet.Cells [ 8 + 3 * Row, 8].Value   := QDatos.FieldByName ('Importe_Ave5').AsString;
      XLSheet.Cells [ 9 + 3 * Row, 8].Value   := QDatos.FieldByName ('Acreds_Ave5').AsString;
      XLSheet.Cells [10 + 3 * Row, 8].Value   := QDatos.FieldByName ('Lineas_Ave5').AsString;

      XLSheet.Cells [ 8 + 3 * Row, 9].Value   := QDatos.FieldByName ('Total_Cal_Importe').AsString;
      XLSheet.Cells [ 9 + 3 * Row, 9].Value   := QDatos.FieldByName ('Total_Cal_Acreds').AsString;
      XLSheet.Cells [10 + 3 * Row, 9].Value   := QDatos.FieldByName ('Total_Cal_Lineas').AsString;

      XLSheet.Cells [ 8 + 3 * Row, 10].Value  := QDatos.FieldByName ('Importe_No_Rev').AsString;
      XLSheet.Cells [ 9 + 3 * Row, 10].Value  := QDatos.FieldByName ('Acred_No_Rev').AsString;
      XLSheet.Cells [10 + 3 * Row, 10].Value  := QDatos.FieldByName ('Lineas_No_Rev').AsString;

      if QDatos.FieldByName ('Region').AsString = 'Total' then
         B_Total := 8 + 3 * Row;

      QDatos.Next;
      Inc (Row);
    end;

    Range                     := XLSheet.Range ['A' + IntToStr(B_Total) + ':J'+ IntToStr(B_Total + 2)];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    //Pinta los bordes para diferenciar los grupos de datos
    BorderRange ('A8:J10');
    BorderRange ('A11:J13');
    BorderRange ('A14:J16');
    BorderRange ('A17:J19');
    BorderRange ('A20:J22');
    XLSheet.Range ['A5:J5'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Columns ['A'].ColumnWidth   := 20;
    XLSheet.Columns ['B:I'].ColumnWidth := 16;
    XLSheet.Columns ['J'].ColumnWidth   := 20;

    //Generación de las Gráficas

    {Genera una hoja oculta sin datos formateados para la gráfica}
    XLApp.Workbooks [1].WorkSheets.Add (Null, XLApp.Workbooks [1].WorkSheets [1]);
    XLSheet      := XLApp.Workbooks[1].WorkSheets[2];
    XLSheet.Name := 'Datos';

    Row := 1;
    QDatos.First;
    while not QDatos.Eof do
    begin
      XLSheet.Cells [Row, 1].Value   := QDatos.FieldByName ('Region')        .AsString;
      XLSheet.Cells [Row, 2].Value   := QDatos.FieldByName ('Importe_Normal').AsString;
      XLSheet.Cells [Row, 3].Value   := QDatos.FieldByName ('Acreds_Normal') .AsString;
      XLSheet.Cells [Row, 4].Value   := QDatos.FieldByName ('Lineas_Normal') .AsString;

      XLSheet.Cells [Row, 5].Value   := QDatos.FieldByName ('Importe_Ave1')  .AsString;
      XLSheet.Cells [Row, 6].Value   := QDatos.FieldByName ('Acreds_Ave1')   .AsString;
      XLSheet.Cells [Row, 7].Value   := QDatos.FieldByName ('Lineas_Ave1')   .AsString;

      XLSheet.Cells [Row, 8].Value   := QDatos.FieldByName ('Importe_Ave2')  .AsString;
      XLSheet.Cells [Row, 9].Value   := QDatos.FieldByName ('Acreds_Ave2')   .AsString;
      XLSheet.Cells [Row, 10].Value  := QDatos.FieldByName ('Lineas_Ave2')   .AsString;

      XLSheet.Cells [Row, 11].Value  := QDatos.FieldByName ('Importe_Ave3')  .AsString;
      XLSheet.Cells [Row, 12].Value  := QDatos.FieldByName ('Acreds_Ave3')   .AsString;
      XLSheet.Cells [Row, 13].Value  := QDatos.FieldByName ('Lineas_Ave3')   .AsString;

      XLSheet.Cells [Row, 14].Value  := QDatos.FieldByName ('Importe_Ave4')  .AsString;
      XLSheet.Cells [Row, 15].Value  := QDatos.FieldByName ('Acreds_Ave4')   .AsString;
      XLSheet.Cells [Row, 16].Value  := QDatos.FieldByName ('Lineas_Ave4')   .AsString;

      XLSheet.Cells [Row, 17].Value  := QDatos.FieldByName ('Importe_Ave5')  .AsString;
      XLSheet.Cells [Row, 18].Value  := QDatos.FieldByName ('Acreds_Ave5')   .AsString;
      XLSheet.Cells [Row, 19].Value  := QDatos.FieldByName ('Lineas_Ave5')   .AsString;

      XLSheet.Cells [Row, 20].Value  := QDatos.FieldByName ('Total_Cal_Importe').AsString;
      XLSheet.Cells [Row, 21].Value  := QDatos.FieldByName ('Total_Cal_Acreds') .AsString;
      XLSheet.Cells [Row, 22].Value  := QDatos.FieldByName ('Total_Cal_Lineas') .AsString;

      XLSheet.Cells [Row, 23].Value  := QDatos.FieldByName ('Importe_No_Rev').AsString;
      XLSheet.Cells [Row, 24].Value  := QDatos.FieldByName ('Acred_No_Rev')  .AsString;
      XLSheet.Cells [Row, 25].Value  := QDatos.FieldByName ('Lineas_No_Rev') .AsString;

      QDatos.Next;
      Inc (Row);
    end;

    XLSheet.Visible := False;

    {Genera la hoja para la gráfica para las Lineas }
    XLApp.Workbooks [1].WorkSheets.Add (Null, XLApp.Workbooks [1].WorkSheets [2]);
    XLSheet      := XLApp.Workbooks[1].WorkSheets[3];
    XLSheet.Name := 'Gráfica Lineas';

    XLSheet.Cells [1, 1].Formula             := Caption;  // Título del reporte
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['A1:N1'].Merge;

    XLSheet.Cells [2, 1].Formula             := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [2, 3].Formula             := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['C2'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Range ['C2:N2'].Merge;

    if cbCartasCredito.Checked then
      XLSheet.Cells [3, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [3, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [3, 7].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [3, 7].Formula := 'No incluye intereses cobrados por anticipado';
    XLSheet.Range ['A3:F3'].Merge;
    XLSheet.Range ['G3:N3'].Merge;
    XLSheet.Range ['G3'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Range ['A1:N3'].Font.Bold := True;

    Chart3 := XLSheet.ChartObjects.Add (10, 80, 820, 250);
    Chart3.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[2].Range['A1:A' + IntToStr (Row - 2)], xlColumns);
    Chart3.Chart.ChartTitle.Text := 'Seguimiento (AVES) Lineas' ;

    Chart3.Chart.SeriesCollection [1].Delete;

    Serie1         := Chart3.Chart.SeriesCollection.NewSeries;
    Serie1.Name    := '="Lineas Normal"';
    Serie1.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie1.Values  := '=Datos!$D$1:$D$' + IntToStr (Row - 1);

    Serie2         := Chart3.Chart.SeriesCollection.NewSeries;
    Serie2.Name    := '="Lineas Ave 1"';
    Serie2.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie2.Values  := '=Datos!$G$1:$G$' + IntToStr (Row - 1);

    Serie3         := Chart3.Chart.SeriesCollection.NewSeries;
    Serie3.Name    := '="Lineas Ave 2"';
    Serie3.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie3.Values  := '=Datos!$J$1:$J$' + IntToStr (Row - 1);

    Serie4         := Chart3.Chart.SeriesCollection.NewSeries;
    Serie4.Name    := '="Lineas Ave 3"';
    Serie4.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie4.Values  := '=Datos!$M$1:$M$' + IntToStr (Row - 1);

    Serie5         := Chart3.Chart.SeriesCollection.NewSeries;
    Serie5.Name    := '="Lineas Ave 4"';
    Serie5.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie5.Values  := '=Datos!$P$1:$P$' + IntToStr (Row - 1);

    Serie6         := Chart3.Chart.SeriesCollection.NewSeries;
    Serie6.Name    := '="Lineas Ave 5"';
    Serie6.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie6.Values  := '=Datos!$S$1:$S$' + IntToStr (Row - 1);

    Serie7         := Chart3.Chart.SeriesCollection.NewSeries;
    Serie7.Name    := '="Lineas N/S a Revisión"';
    Serie7.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie7.Values  := '=Datos!$Y$1:$Y$' + IntToStr (Row - 1);

    {Genera la hoja para la gráfica  de Acreditados}
    XLApp.Workbooks [1].WorkSheets.Add (Null, XLApp.Workbooks [1].WorkSheets [2]);
    XLSheet      := XLApp.Workbooks[1].WorkSheets[3];
    XLSheet.Name := 'Gráfica Acreditados';

    XLSheet.Cells [1, 1].Formula             := Caption;  // Título del reporte
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['A1:N1'].Merge;

    XLSheet.Cells [2, 1].Formula             := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [2, 3].Formula             := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['C2'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Range ['C2:N2'].Merge;

    if cbCartasCredito.Checked then
      XLSheet.Cells [3, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [3, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [3, 7].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [3, 7].Formula := 'No incluye intereses cobrados por anticipado';
    XLSheet.Range ['A3:F3'].Merge;
    XLSheet.Range ['G3:N3'].Merge;
    XLSheet.Range ['G3'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Range ['A1:N3'].Font.Bold := True;

    Chart2 := XLSheet.ChartObjects.Add (10, 80, 820, 250);
    Chart2.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[2].Range['A1:A' + IntToStr (Row - 2)], xlColumns);
    Chart2.Chart.ChartTitle.Text := 'Seguimiento (AVES) Acreditados' ;

    Chart2.Chart.SeriesCollection [1].Delete;

    Serie1         := Chart2.Chart.SeriesCollection.NewSeries;
    Serie1.Name    := '="Acreditados Normal"';
    Serie1.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie1.Values  := '=Datos!$C$1:$C$' + IntToStr (Row - 1);

    Serie2         := Chart2.Chart.SeriesCollection.NewSeries;
    Serie2.Name    := '="Acreditados Ave 1"';
    Serie2.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie2.Values  := '=Datos!$F$1:$F$' + IntToStr (Row - 1);

    Serie3         := Chart2.Chart.SeriesCollection.NewSeries;
    Serie3.Name    := '="Acreditados Ave 2"';
    Serie3.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie3.Values  := '=Datos!$I$1:$I$' + IntToStr (Row - 1);

    Serie4         := Chart2.Chart.SeriesCollection.NewSeries;
    Serie4.Name    := '="Acreditados Ave 3"';
    Serie4.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie4.Values  := '=Datos!$L$1:$L$' + IntToStr (Row - 1);

    Serie5         := Chart2.Chart.SeriesCollection.NewSeries;
    Serie5.Name    := '="Acreditados Ave 4"';
    Serie5.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie5.Values  := '=Datos!$O$1:$O$' + IntToStr (Row - 1);

    Serie6         := Chart2.Chart.SeriesCollection.NewSeries;
    Serie6.Name    := '="Acreditados Ave 5"';
    Serie6.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie6.Values  := '=Datos!$R$1:$R$' + IntToStr (Row - 1);

    Serie7         := Chart2.Chart.SeriesCollection.NewSeries;
    Serie7.Name    := '="Acreditados N/S a Revisión"';
    Serie7.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie7.Values  := '=Datos!$X$1:$X$' + IntToStr (Row - 1);

    {Genera la hoja para la gráfica de Importes }
    XLApp.Workbooks [1].WorkSheets.Add (Null, XLApp.Workbooks [1].WorkSheets [2]);
    XLSheet      := XLApp.Workbooks[1].WorkSheets[3];
    XLSheet.Name := 'Gráfica Importes';

    XLSheet.Cells [1, 1].Formula             := Caption;  // Título del reporte
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['A1:N1'].Merge;

    XLSheet.Cells [2, 1].Formula             := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['A2:N2'].Merge;

    XLSheet.Cells [3, 1].Formula             := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [3, 3].Formula             := 'Información de importes expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['C3'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Range ['C3:N3'].Merge;

    if cbCartasCredito.Checked then
      XLSheet.Cells [4, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [4, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 7].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 7].Formula := 'No incluye intereses cobrados por anticipado';
    XLSheet.Range ['A4:F4'].Merge;
    XLSheet.Range ['G4:N4'].Merge;
    XLSheet.Range ['G4'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Range ['A1:N4'].Font.Bold        := True;

    Chart := XLSheet.ChartObjects.Add (10, 80, 820, 250);
    Chart.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[2].Range['A1:A' + IntToStr (Row - 2)], xlColumns);
    Chart.Chart.ChartTitle.Text := 'Seguimiento (AVES) Importes' ;

    Chart.Chart.SeriesCollection [1].Delete;

    Serie1         := Chart.Chart.SeriesCollection.NewSeries;
    Serie1.Name    := '="Importes Normal"';
    Serie1.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie1.Values  := '=Datos!$B$1:$B$' + IntToStr (Row - 1);

    Serie2         := Chart.Chart.SeriesCollection.NewSeries;
    Serie2.Name    := '="Importes Ave 1"';
    Serie2.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie2.Values  := '=Datos!$E$1:$E$' + IntToStr (Row - 1);

    Serie3         := Chart.Chart.SeriesCollection.NewSeries;
    Serie3.Name    := '="Importes Ave 2"';
    Serie3.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie3.Values  := '=Datos!$H$1:$H$' + IntToStr (Row - 1);

    Serie4         := Chart.Chart.SeriesCollection.NewSeries;
    Serie4.Name    := '="Importes Ave 3"';
    Serie4.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie4.Values  := '=Datos!$K$1:$K$' + IntToStr (Row - 1);

    Serie5         := Chart.Chart.SeriesCollection.NewSeries;
    Serie5.Name    := '="Importes Ave 4"';
    Serie5.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie5.Values  := '=Datos!$N$1:$n$' + IntToStr (Row - 1);

    Serie6         := Chart.Chart.SeriesCollection.NewSeries;
    Serie6.Name    := '="Importes Ave 5"';
    Serie6.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie6.Values  := '=Datos!$Q$1:$Q$' + IntToStr (Row - 1);

    Serie7         := Chart.Chart.SeriesCollection.NewSeries;
    Serie7.Name    := '="Importes N/S a Revisión"';
    Serie7.XValues := '=Datos!$A$1:$A$' + IntToStr (Row - 1);
    Serie7.Values  := '=Datos!$W$1:$W$' + IntToStr (Row - 1);

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

procedure TWCRInfAves.sbExportarDetallesClick(Sender: TObject);
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

procedure TWCrInfAves.ExportarDetalles (FileName: string);
var
  XLApp, XLSheet: Variant;
  Range : Variant;
  Row, RowIni, CurrTipo: integer;
  Factor: double;
begin
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;
  
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
    QDetalles.ParamByName ('peFactor').AsFloat        := Factor;
    QDetalles.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
    QDetalles.ParamByName ('peCartas_Cred').AsString := BoolToStr (cbCartasCredito.Checked);
    QDetalles.ParamByName ('peInt_Cob_Ant').AsString := BoolToStr (cbInteresesAnticipados.Checked);
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
    XLSheet.Range ['A1:I1'].Merge;

    XLSheet.Cells [2, 1].Formula             := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['A2:I2'].Merge;

    XLSheet.Cells [3, 1].Formula             := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [3, 2].Formula             := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['B3'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Range ['B3:I3'].Merge;

    if cbCartasCredito.Checked then
      XLSheet.Cells [4, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [4, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 5].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 5].Formula := 'No incluye intereses cobrados por anticipado';
    XLSheet.Range ['A4:D4'].Merge;
    XLSheet.Range ['E4:I4'].Merge;
    XLSheet.Range ['E4'].HorizontalAlignment := xlHAlignRight;

    {Encabezado de las columnas}
    XLSheet.Cells [5, 1].Formula := 'Región';
    XLSheet.Cells [5, 2].Formula := 'Clave AVE';
    XLSheet.Cells [5, 3].Formula := 'Tipo Entidad';
    XLSheet.Cells [5, 4].Formula := 'Nombre Acreditado';
    XLSheet.Cells [5, 5].Formula := 'Id Acreditado';
    XLSheet.Cells [5, 6].Formula := 'Id Contrato';
    XLSheet.Cells [5, 7].Formula := 'Id Crédito';
    XLSheet.Cells [5, 8].Formula := 'Tipo Crédito';
    XLSheet.Cells [5, 9].Formula := 'Saldo';

    XLSheet.Range ['A1:I5'].Font.Bold                                   := True;
    XLSheet.Range ['A5:I5'].HorizontalAlignment                         := xlHAlignCenter;
    XLSheet.Range ['I5:I' + IntToStr (QDetalles.RecordCount + 5)].Style := 'Currency';

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
      XLSheet.Cells [Row, 1].Formula := QDetalles.FieldByName ('Region')       .AsString;
      XLSheet.Cells [Row, 2].Formula := QDetalles.FieldByName ('Cve_Ave')      .AsString;
      XLSheet.Cells [Row, 3].Formula := QDetalles.FieldByName ('Tipo_Entidad') .AsString;
      XLSheet.Cells [Row, 4].Formula := QDetalles.FieldByName ('Nom_Acred_Reg').AsString;
      XLSheet.Cells [Row, 5].Formula := QDetalles.FieldByName ('Id_Acreditado').AsFloat;
      XLSheet.Cells [Row, 6].Value   := QDetalles.FieldByName ('Id_Contrato')  .AsFloat;
      XLSheet.Cells [Row, 7].Value   := QDetalles.FieldByName ('Id_Credito')   .AsFloat;
      XLSheet.Cells [Row, 8].Value   := QDetalles.FieldByName ('Tipo_Credito') .AsString;
      XLSheet.Cells [Row, 9].Value   := QDetalles.FieldByName ('Saldo')        .AsFloat;
      QDetalles.Next;
      Inc (Row);
    end;

    XLSheet.Columns ['A:I'].ColumnWidth := 20;
    XLSheet.Columns ['D'].ColumnWidth   := 35;
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
