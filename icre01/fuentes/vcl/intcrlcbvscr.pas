unit IntCrLCbVsCr;
                                  
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  InterFor, IntFrm, ComCtrls, StdCtrls, Grids, Aligrid, Db, DBTables,
  DBGrids, Math, ExtCtrls, TeeProcs, TeEngine, Chart, DBChart, Series,
  Buttons, Menus, ShellAPI, ComObj, VirtualTrees, ImgList;

const
  FondoExcedente       = $00E2F2FF;
  AzulClaro            = $00F9EDE3;
  AzulOscuro           = $00F1E5DB;
  AzulGraficaClaro     = $00D58E55;
  AzulGraficaOscuro    = $00926037;
  NaranjaClaro         = $00E2F2FF;
  NaranjaOscuro        = $00DAEAFD;
  NaranjaGraficaClaro  = $0090C0FA;
  NaranjaGraficaOscuro = $000A6CE4;
  VerdeClaro           = $00E5F9F3;
  VerdeOscuro          = $00DDF1EB;
  VerdeGraficaClaro    = $009BD6C3;
  VerdeGraficaOscuro   = $003C9377;
  Gris                 = $00F2F2F2;
  GrisGrafica          = $007F7F7F;



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
  xlThemeColorAccent2      =     6;
  xlThemeColorAccent3      =     7;
  xlThemeColorAccent4      =     8;
  xlThemeColorAccent6      =    10;
  xlThemeColorLight2       =     4;
  xlThemeColorDark1        =     1;
  xlThemeColorLight1       =     2;
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
  PTreeData = ^TTreeData;
  TTreeData = record
    Tipo_Entidad          : String;
    Desc_Poblacion        : String;
    Pct_PI                : Real;
    Pct_Pi_Cal            : Real;
    Pct_pi_Dummy          : Real;
    P1_Pct_Capital_Basico : Real;
    P1_Imp_Capital_Basico : Real;
    P1_Sdo_Pct            : Real;
    P1_Sdo                : Real;
    P1_Dif_Pct            : Real;
    P1_Diferencia         : Real;
    P1_Pct_Excedente      : Real;
    P1_Imp_Excedente      : Real;
    P1_Pct_Remanente      : Real;
    P1_Imp_Remanente      : Real;
    P2_Pct_Capital_Basico : Real;
    P2_Imp_Capital_Basico : Real;
    P2_Sdo_Pct            : Real;
    P2_Sdo                : Real;
    P2_Dif_Pct            : Real;
    P2_Diferencia         : Real;
    P2_Pct_Excedente      : Real;
    P2_Imp_Excedente      : Real;
    P2_Pct_Remanente      : Real;
    P2_Imp_Remanente      : Real;
    P3_Pct_Capital_Basico : Real;
    P3_Imp_Capital_Basico : Real;
    P3_Sdo_Pct            : Real;
    P3_Sdo                : Real;
    P3_Dif_Pct            : Real;
    P3_Diferencia         : Real;
    P3_Pct_Excedente      : Real;
    P3_Imp_Excedente      : Real;
    P3_Pct_Remanente      : Real;
    P3_Imp_Remanente      : Real;
    P4_Pct_Capital_Basico : Real;
    P4_Imp_Capital_Basico : Real;
    P4_Sdo_Pct            : Real;
    P4_Sdo                : Real;
    P4_Dif_Pct            : Real;
    P4_Diferencia         : Real;
    P4_Pct_Excedente      : Real;
    P4_Imp_Excedente      : Real;
    P4_Pct_Remanente      : Real;
    P4_Imp_Remanente      : Real;
    P5_Pct_Capital_Basico : Real;
    P5_Imp_Capital_Basico : Real;
    P5_Sdo_Pct            : Real;
    P5_Sdo                : Real;
    P5_Dif_Pct            : Real;
    P5_Diferencia         : Real;
    P5_Pct_Excedente      : Real;
    P5_Imp_Excedente      : Real;
    P5_Pct_Remanente      : Real;
    P5_Imp_Remanente      : Real;
    P6_Pct_Capital_Basico : Real;
    P6_Imp_Capital_Basico : Real;
    P6_Sdo_Pct            : Real;
    P6_Sdo                : Real;
    P6_Dif_Pct            : Real;
    P6_Diferencia         : Real;
    P6_Pct_Excedente      : Real;
    P6_Imp_Excedente      : Real;
    P6_Pct_Remanente      : Real;
    P6_Imp_Remanente      : Real;
    P7_Pct_Capital_Basico : Real;
    P7_Imp_Capital_Basico : Real;
    P7_Sdo_Pct            : Real;
    P7_Sdo                : Real;
    P7_Dif_Pct            : Real;
    P7_Diferencia         : Real;
    P7_Pct_Excedente      : Real;
    P7_Imp_Excedente      : Real;
    P7_Pct_Remanente      : Real;
    P7_Imp_Remanente      : Real;
    P8_Pct_Capital_Basico : Real;
    P8_Imp_Capital_Basico : Real;
    P8_Sdo_Pct            : Real;
    P8_Sdo                : Real;
    P8_Dif_Pct            : Real;
    P8_Diferencia         : Real;
    P8_Pct_Excedente      : Real;
    P8_Imp_Excedente      : Real;
    P8_Pct_Remanente      : Real;
    P8_Imp_Remanente      : Real;
    P9_Pct_Capital_Basico : Real;
    P9_Imp_Capital_Basico : Real;
    P9_Sdo_Pct            : Real;
    P9_Sdo                : Real;
    P9_Dif_Pct            : Real;
    P9_Diferencia         : Real;
    P9_Pct_Excedente      : Real;
    P9_Imp_Excedente      : Real;
    P9_Pct_Remanente      : Real;
    P9_Imp_Remanente      : Real;
  end;

  TCrLCbVsCr = class;
  TWCrLCbVsCr = class(TForm)
    InterForma1: TInterForma;
    pmExportar: TPopupMenu;
    Tablaygrafica1: TMenuItem;
    Solotabla1: TMenuItem;
    Solografica1: TMenuItem;
    SaveXLS: TSaveDialog;
    QIndiceCapitalizacion: TQuery;
    qDatos: TQuery;
    VST: TVirtualStringTree;
    GroupBox1: TGroupBox;
    cbEstatal: TCheckBox;
    cbMunicipal: TCheckBox;
    cbOrgDesc: TCheckBox;
    Label1: TLabel;
    dpFecha: TDateTimePicker;
    ImageList1: TImageList;
    rgFactorMoneda: TRadioGroup;
    Label5: TLabel;
    edIndiceCapitalizacion: TEdit;
    Chart: TChart;
    rgInfoDesplegar: TRadioGroup;
    cbDisplayMarks: TCheckBox;
    rgProyeccion: TRadioGroup;
    sbPopupExportar: TSpeedButton;
    cbMuestraInfoReal: TCheckBox;
    cbMuestraCapBas: TCheckBox;
    QLeyendaEntidades: TQuery;
    cbCartasCredito: TCheckBox;
    cbInteresesAnticipados: TCheckBox;
    btBusca: TBitBtn;
    QDetalles: TQuery;
    sbExportar: TSpeedButton;
    sbExportarDetalle: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure VSTChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VSTFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: Integer);
    procedure VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: Integer; TextType: TVSTTextType; var Text: WideString);
    procedure CargaInfo;
    procedure FormShow(Sender: TObject);
    procedure VSTGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: Integer;
      var Index: Integer);
    function  Money (f: double): string;
    procedure rgInfoDesplegarClick(Sender: TObject);
    procedure rgProyeccionClick(Sender: TObject);
    procedure cbDisplayMarksClick(Sender: TObject);
    procedure ExportarExcel (FileName: string);
    procedure sbPopupExportarClick(Sender: TObject);
    procedure PopupMenuGraficaTabla(Sender: TObject);
    procedure cbMuestraInfoRealClick(Sender: TObject);
    procedure LimpiaGrafica(Sender: TObject);
    procedure cbMuestraCapBasClick(Sender: TObject);
    procedure VSTAfterItemPaint(Sender: TBaseVirtualTree; Canvas: TCanvas;
      Node: PVirtualNode; ItemRect: TRect);
    procedure btBuscaClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbExportarDetalleClick(Sender: TObject);
  private
    { Private declarations }
    //Informacón de limite de Capital Básico
    //Serie Producto 1
    SerieBarP1PctCapBas  : TBarSeries;
    SerieBarP1ImpCapBas  : TBarSeries;
    //Serie Producto 2
    SerieBarP2PctCapBas  : TBarSeries;
    SerieBarP2ImpCapBas  : TBarSeries;
    //Serie Producto 3
    SerieBarP3PctCapBas  : TBarSeries;
    SerieBarP3ImpCapBas  : TBarSeries;
    //Serie Producto 4
    SerieBarP4PctCapBas  : TBarSeries;
    SerieBarP4ImpCapBas  : TBarSeries;
    //Serie Producto 5
    SerieBarP5PctCapBas  : TBarSeries;
    SerieBarP5ImpCapBas  : TBarSeries;
    //Serie Producto 6
    SerieBarP6PctCapBas  : TBarSeries;
    SerieBarP6ImpCapBas  : TBarSeries;
    //Serie Producto 7
    SerieBarP7PctCapBas  : TBarSeries;
    SerieBarP7ImpCapBas  : TBarSeries;
    //Serie Producto 8
    SerieBarP8PctCapBas  : TBarSeries;
    SerieBarP8ImpCapBas  : TBarSeries;
    //Serie Producto 9
    SerieBarP9PctCapBas  : TBarSeries;
    SerieBarP9ImpCapBas   : TBarSeries;


    //Información Real
    //Serie Producto 1
    SerieLineP1PctExeRem  : TLineSeries;
    SerieLineP1ImpExeRem  : TLineSeries;
    //Serie Producto 2
    SerieLineP2PctExeRem   : TLineSeries;
    SerieLineP2ImpExeRem   : TLineSeries;
    //Serie Producto 3
    SerieLineP3PctExeRem   : TLineSeries;
    SerieLineP3ImpExeRem   : TLineSeries;
    //Serie Producto 4
    SerieLineP4PctExeRem   : TLineSeries;
    SerieLineP4ImpExeRem   : TLineSeries;
    //Serie Producto 5
    SerieLineP5PctExeRem   : TLineSeries;
    SerieLineP5ImpExeRem   : TLineSeries;
    //Serie Producto 6
    SerieLineP6PctExeRem   : TLineSeries;
    SerieLineP6ImpExeRem   : TLineSeries;
    //Serie Producto 7
    SerieLineP7PctExeRem   : TLineSeries;
    SerieLineP7ImpExeRem   : TLineSeries;
    //Serie Producto 8
    SerieLineP8PctExeRem   : TLineSeries;
    SerieLineP8ImpExeRem   : TLineSeries;
    //Serie Producto 9
    SerieLineP9PctExeRem   : TLineSeries;
    SerieLineP9ImpExeRem   : TLineSeries;
    
    function ConstruyeTipoEntidad: string;
    procedure ExportarXLSDetalles (FileName: string);
  public
    { Public declarations }
    Objeto : TCrLCbVsCr;
    vlEntidad :String;
  end;

  TCrLCbVsCr = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
    constructor Create (AOwner: TComponent); override;
    function    ShowWindow (FormaTipo: TFormaTipo): integer; override;

  published
  end;

var
  WCrLCbVsCr: TWCrLCbVsCr;

implementation

{$R *.DFM}

function BoolToStr (b: boolean): string;
begin
  if b then
    result := 'V'
  else
    result := 'F';
end;

constructor TCrLCbVsCr.Create (AOwner: TComponent);
begin
  inherited;
  ShowMenuReporte := False;
end;

function    TCrLCbVsCr.ShowWindow (FormaTipo: TFormaTipo): integer;
var
  W: TWCrLCbVsCr;
begin
   W := TWCrLCbVsCr.Create(Self);
   try
     W.Objeto                    := Self;
     W.InterForma1.InterFrame    := Self;
     W.InterForma1.FormaTipo     := ftConsulta;
     W.InterForma1.ShowGrid      := False;
     W.InterForma1.ShowNavigator := False;
     W.InterForma1.Funcion       := FInterFun;
     W.InterForma1.ShowModal;
     ShowWindow                  := W.InterForma1.ModalResult;
   finally
     W.Free;
   end;
end;

procedure TWCrLCbVsCr.FormCreate(Sender: TObject);
begin
  //Especificación de punto decimal y separador de miles
  DecimalSeparator  := '.';
  ThousandSeparator := ',';
  VST.NodeDataSize  := SizeOf(TTreeData);
  SysLocale.MiddleEast := True;

  {Producto 1 Capital Básico }
  SerieBarP1PctCapBas                      := TBarSeries.Create (Chart);
  SerieBarP1PctCapBas.ParentChart          := Chart;
  SerieBarP1PctCapBas.SeriesColor          := AzulGraficaClaro;
  SerieBarP1PctCapBas.Title                := 'Producto 1 Cap.Básico';
  SerieBarP1PctCapBas.Marks.Style          := smsPercent;
  SerieBarP1PctCapBas.BarPen.Color         := AzulGraficaClaro;

  SerieBarP1ImpCapBas                      := TBarSeries.Create (Chart);
  SerieBarP1ImpCapBas.ParentChart          := Chart;
  SerieBarP1ImpCapBas.SeriesColor          := AzulGraficaClaro;
  SerieBarP1ImpCapBas.Title                := 'Producto 1 Cap.Básico';
  SerieBarP1ImpCapBas.Marks.Style          := smsValue;
  SerieBarP1ImpCapBas.BarPen.Color         := AzulGraficaClaro;

  {Producto 2 Capital Básico }
  SerieBarP2PctCapBas                      := TBarSeries.Create (Chart);
  SerieBarP2PctCapBas.ParentChart          := Chart;
  SerieBarP2PctCapBas.SeriesColor          := NaranjaGraficaClaro;
  SerieBarP2PctCapBas.Title                := 'Producto 2 Cap.Básico';
  SerieBarP2PctCapBas.Marks.Style          := smsPercent;
  SerieBarP2PctCapBas.BarPen.Color         := NaranjaGraficaClaro;

  SerieBarP2ImpCapBas                      := TBarSeries.Create (Chart);
  SerieBarP2ImpCapBas.ParentChart          := Chart;
  SerieBarP2ImpCapBas.SeriesColor          := NaranjaGraficaClaro;
  SerieBarP2ImpCapBas.Title                := 'Producto 2 Cap.Básico';
  SerieBarP2ImpCapBas.Marks.Style          := smsValue;
  SerieBarP2ImpCapBas.BarPen.Color         := NaranjaGraficaClaro;

  {Producto 3 Capital Básico }
  SerieBarP3PctCapBas                      := TBarSeries.Create (Chart);
  SerieBarP3PctCapBas.ParentChart          := Chart;
  SerieBarP3PctCapBas.SeriesColor          := VerdeGraficaClaro;
  SerieBarP3PctCapBas.Title                := 'Producto 3 Cap.Básico';
  SerieBarP3PctCapBas.Marks.Style          := smsPercent;
  SerieBarP3PctCapBas.BarPen.Color         := VerdeGraficaClaro;

  SerieBarP3ImpCapBas                      := TBarSeries.Create (Chart);
  SerieBarP3ImpCapBas.ParentChart          := Chart;
  SerieBarP3ImpCapBas.SeriesColor          := VerdeGraficaClaro;
  SerieBarP3ImpCapBas.Title                := 'Producto 3 Cap.Básico';
  SerieBarP3ImpCapBas.Marks.Style          := smsValue;
  SerieBarP3ImpCapBas.BarPen.Color         := VerdeGraficaClaro;

  {Producto 4 Capital Básico }
  SerieBarP4PctCapBas                      := TBarSeries.Create (Chart);
  SerieBarP4PctCapBas.ParentChart          := Chart;
  SerieBarP4PctCapBas.SeriesColor          := AzulGraficaClaro;
  SerieBarP4PctCapBas.Title                := 'Producto 4 Cap.Básico';
  SerieBarP4PctCapBas.Marks.Style          := smsPercent;
  SerieBarP4PctCapBas.BarPen.Color         := AzulGraficaClaro;
  SerieBarP4PctCapBas.BarBrush.Style       := bsDiagCross;

  SerieBarP4ImpCapBas                      := TBarSeries.Create (Chart);
  SerieBarP4ImpCapBas.ParentChart          := Chart;
  SerieBarP4ImpCapBas.SeriesColor          := AzulGraficaClaro;
  SerieBarP4ImpCapBas.Title                := 'Producto 4 Cap.Básico';
  SerieBarP4ImpCapBas.Marks.Style          := smsValue;
  SerieBarP4ImpCapBas.BarPen.Color         := AzulGraficaClaro;
  SerieBarP4ImpCapBas.BarBrush.Style       := bsDiagCross;

  {Producto 5 Capital Básico }
  SerieBarP5PctCapBas                      := TBarSeries.Create (Chart);
  SerieBarP5PctCapBas.ParentChart          := Chart;
  SerieBarP5PctCapBas.SeriesColor          := NaranjaGraficaClaro;
  SerieBarP5PctCapBas.Title                := 'Producto 5 Cap.Básico';
  SerieBarP5PctCapBas.Marks.Style          := smsPercent;
  SerieBarP5PctCapBas.BarPen.Color         := AzulGraficaClaro;
  SerieBarP5PctCapBas.BarBrush.Style       := bsDiagCross;

  SerieBarP5ImpCapBas                      := TBarSeries.Create (Chart);
  SerieBarP5ImpCapBas.ParentChart          := Chart;
  SerieBarP5ImpCapBas.SeriesColor          := NaranjaGraficaClaro;
  SerieBarP5ImpCapBas.Title                := 'Producto 5 Cap.Básico';
  SerieBarP5ImpCapBas.Marks.Style          := smsValue;
  SerieBarP5ImpCapBas.BarPen.Color         := NaranjaGraficaClaro;
  SerieBarP5ImpCapBas.BarBrush.Style       := bsDiagCross;

  {Producto 6 Capital Básico }
  SerieBarP6PctCapBas                      := TBarSeries.Create (Chart);
  SerieBarP6PctCapBas.ParentChart          := Chart;
  SerieBarP6PctCapBas.SeriesColor          := VerdeGraficaClaro;
  SerieBarP6PctCapBas.Title                := 'Producto 6 Cap.Básico';
  SerieBarP6PctCapBas.Marks.Style          := smsPercent;
  SerieBarP6PctCapBas.BarPen.Color         := VerdeGraficaClaro;
  SerieBarP6PctCapBas.BarBrush.Style       := bsDiagCross;

  SerieBarP6ImpCapBas                      := TBarSeries.Create (Chart);
  SerieBarP6ImpCapBas.ParentChart          := Chart;
  SerieBarP6ImpCapBas.SeriesColor          := VerdeGraficaClaro;
  SerieBarP6ImpCapBas.Title                := 'Producto 6 Cap.Básico';
  SerieBarP6ImpCapBas.Marks.Style          := smsValue;
  SerieBarP6ImpCapBas.BarPen.Color         := VerdeGraficaClaro;
  SerieBarP6ImpCapBas.BarBrush.Style       := bsDiagCross;

  {Producto 7 Capital Básico }
  SerieBarP7PctCapBas                      := TBarSeries.Create (Chart);
  SerieBarP7PctCapBas.ParentChart          := Chart;
  SerieBarP7PctCapBas.SeriesColor          := AzulGraficaOscuro;
  SerieBarP7PctCapBas.Title                := 'Producto 7 Cap.Básico';
  SerieBarP7PctCapBas.Marks.Style          := smsPercent;
  SerieBarP7PctCapBas.BarPen.Color         := AzulGraficaOscuro;

  SerieBarP7ImpCapBas                      := TBarSeries.Create (Chart);
  SerieBarP7ImpCapBas.ParentChart          := Chart;
  SerieBarP7ImpCapBas.SeriesColor          := AzulGraficaOscuro;
  SerieBarP7ImpCapBas.Title                := 'Producto 7 Cap.Básico';
  SerieBarP7ImpCapBas.Marks.Style          := smsValue;
  SerieBarP7ImpCapBas.BarPen.Color         := AzulGraficaOscuro;

  {Producto 8 Capital Básico }
  SerieBarP8PctCapBas                      := TBarSeries.Create (Chart);
  SerieBarP8PctCapBas.ParentChart          := Chart;
  SerieBarP8PctCapBas.SeriesColor          := NaranjaGraficaOscuro;
  SerieBarP8PctCapBas.Title                := 'Producto 8 Cap.Básico';
  SerieBarP8PctCapBas.Marks.Style          := smsPercent;
  SerieBarP8PctCapBas.BarPen.Color         := NaranjaGraficaOscuro;

  SerieBarP8ImpCapBas                      := TBarSeries.Create (Chart);
  SerieBarP8ImpCapBas.ParentChart          := Chart;
  SerieBarP8ImpCapBas.SeriesColor          := NaranjaGraficaOscuro;
  SerieBarP8ImpCapBas.Title                := 'Producto 8 Cap.Básico';
  SerieBarP8ImpCapBas.Marks.Style          := smsValue;
  SerieBarP8ImpCapBas.BarPen.Color         := NaranjaGraficaOscuro;

  {Producto 9 Capital Básico }
  SerieBarP9PctCapBas                      := TBarSeries.Create (Chart);
  SerieBarP9PctCapBas.ParentChart          := Chart;
  SerieBarP9PctCapBas.SeriesColor          := VerdeGraficaOscuro;
  SerieBarP9PctCapBas.Title                := 'Producto 9 Cap.Básico';
  SerieBarP9PctCapBas.Marks.Style          := smsPercent;
  SerieBarP9PctCapBas.BarPen.Color         := VerdeGraficaOscuro;

  SerieBarP9ImpCapBas                      := TBarSeries.Create (Chart);
  SerieBarP9ImpCapBas.ParentChart          := Chart;
  SerieBarP9ImpCapBas.SeriesColor          := VerdeGraficaOscuro;
  SerieBarP9ImpCapBas.Title                := 'Producto 9 Cap.Básico';
  SerieBarP9ImpCapBas.Marks.Style          := smsValue;
  SerieBarP9ImpCapBas.BarPen.Color         := VerdeGraficaOscuro;


   {Producto 1 }
  SerieLineP1PctExeRem                      := TLineSeries.Create (Chart);
  SerieLineP1PctExeRem.ParentChart          := Chart;
  SerieLineP1PctExeRem.SeriesColor          := AzulGraficaOscuro;
  SerieLineP1PctExeRem.Title                := 'Producto 1';
  SerieLineP1PctExeRem.Marks.Style          := smsPercent;
  SerieLineP1PctExeRem.LinePen.Color        := AzulGraficaOscuro;


  SerieLineP1ImpExeRem                      := TLineSeries.Create (Chart);
  SerieLineP1ImpExeRem.ParentChart          := Chart;
  SerieLineP1ImpExeRem.SeriesColor          := AzulGraficaOscuro;
  SerieLineP1ImpExeRem.Title                := 'Producto 1';
  SerieLineP1ImpExeRem.Marks.Style          := smsValue;
  SerieLineP1ImpExeRem.LinePen.Color        := AzulGraficaOscuro;

  {Producto 2 }
  SerieLineP2PctExeRem                      := TLineSeries.Create (Chart);
  SerieLineP2PctExeRem.ParentChart          := Chart;
  SerieLineP2PctExeRem.SeriesColor          := NaranjaGraficaOscuro;
  SerieLineP2PctExeRem.Title                := 'Producto 2';
  SerieLineP2PctExeRem.Marks.Style          := smsPercent;
  SerieLineP2PctExeRem.LinePen.Color        := NaranjaGraficaOscuro;


  SerieLineP2ImpExeRem                      := TLineSeries.Create (Chart);
  SerieLineP2ImpExeRem.ParentChart          := Chart;
  SerieLineP2ImpExeRem.SeriesColor          := NaranjaGraficaOscuro;
  SerieLineP2ImpExeRem.Title                := 'Producto 2';
  SerieLineP2ImpExeRem.Marks.Style          := smsValue;
  SerieLineP2ImpExeRem.LinePen.Color        := NaranjaGraficaOscuro;


    {Producto 3 }
  SerieLineP3PctExeRem                      := TLineSeries.Create (Chart);
  SerieLineP3PctExeRem.ParentChart          := Chart;
  SerieLineP3PctExeRem.SeriesColor          := VerdeGraficaOscuro;
  SerieLineP3PctExeRem.Title                := 'Producto 3';
  SerieLineP3PctExeRem.Marks.Style          := smsPercent;
  SerieLineP3PctExeRem.LinePen.Color        := VerdeGraficaOscuro;


  SerieLineP3ImpExeRem                      := TLineSeries.Create (Chart);
  SerieLineP3ImpExeRem.ParentChart          := Chart;
  SerieLineP3ImpExeRem.SeriesColor          := VerdeGraficaOscuro;
  SerieLineP3ImpExeRem.Title                := 'Producto 3';
  SerieLineP3ImpExeRem.Marks.Style          := smsValue;
  SerieLineP3ImpExeRem.LinePen.Color        := VerdeGraficaOscuro;

   {Producto 4}
  SerieLineP4PctExeRem                      := TLineSeries.Create (Chart);
  SerieLineP4PctExeRem.ParentChart          := Chart;
  SerieLineP4PctExeRem.SeriesColor          := AzulGraficaOscuro;
  SerieLineP4PctExeRem.Title                := 'Producto 4';
  SerieLineP4PctExeRem.Marks.Style          := smsPercent;
  SerieLineP4PctExeRem.LineBrush            := bsDiagCross;


  SerieLineP4ImpExeRem                      := TLineSeries.Create (Chart);
  SerieLineP4ImpExeRem.ParentChart          := Chart;
  SerieLineP4ImpExeRem.SeriesColor          := AzulGraficaOscuro;
  SerieLineP4ImpExeRem.Title                := 'Producto 4';
  SerieLineP4ImpExeRem.Marks.Style          := smsValue;
  SerieLineP4ImpExeRem.LineBrush            := bsDiagCross;

  {Producto 5}
  SerieLineP5PctExeRem                      := TLineSeries.Create (Chart);
  SerieLineP5PctExeRem.ParentChart          := Chart;
  SerieLineP5PctExeRem.SeriesColor          := NaranjaGraficaOscuro;
  SerieLineP5PctExeRem.Title                := 'Producto 5';
  SerieLineP5PctExeRem.Marks.Style          := smsPercent;
  SerieLineP5PctExeRem.LineBrush            := bsDiagCross;

  SerieLineP5ImpExeRem                      := TLineSeries.Create (Chart);
  SerieLineP5ImpExeRem.ParentChart          := Chart;
  SerieLineP5ImpExeRem.SeriesColor          := NaranjaGraficaOscuro;
  SerieLineP5ImpExeRem.Title                := 'Producto 5';
  SerieLineP5ImpExeRem.Marks.Style          := smsValue;
  SerieLineP5ImpExeRem.LineBrush            := bsDiagCross;

  {Producto 6}
  SerieLineP6PctExeRem                      := TLineSeries.Create (Chart);
  SerieLineP6PctExeRem.ParentChart          := Chart;
  SerieLineP6PctExeRem.SeriesColor          := VerdeGraficaOscuro;
  SerieLineP6PctExeRem.Title                := 'Producto 6';
  SerieLineP6PctExeRem.Marks.Style          := smsPercent;
  SerieLineP6PctExeRem.LineBrush            := bsDiagCross;

  SerieLineP6ImpExeRem                      := TLineSeries.Create (Chart);
  SerieLineP6ImpExeRem.ParentChart          := Chart;
  SerieLineP6ImpExeRem.SeriesColor          := VerdeGraficaOscuro;
  SerieLineP6ImpExeRem.Title                := 'Producto 6';
  SerieLineP6ImpExeRem.Marks.Style          := smsValue;
  SerieLineP6ImpExeRem.LineBrush            := bsDiagCross;

  {Producto 7}
  SerieLineP7PctExeRem                      := TLineSeries.Create (Chart);
  SerieLineP7PctExeRem.ParentChart          := Chart;
  SerieLineP7PctExeRem.SeriesColor          := AzulGraficaClaro;
  SerieLineP7PctExeRem.Title                := 'Producto 7';
  SerieLineP7PctExeRem.Marks.Style          := smsPercent;
  SerieLineP7PctExeRem.LinePen.Color        := AzulGraficaClaro;

  SerieLineP7ImpExeRem                      := TLineSeries.Create (Chart);
  SerieLineP7ImpExeRem.ParentChart          := Chart;
  SerieLineP7ImpExeRem.SeriesColor          := AzulGraficaClaro;
  SerieLineP7ImpExeRem.Title                := 'Producto 7';
  SerieLineP7ImpExeRem.Marks.Style          := smsValue;
  SerieLineP7ImpExeRem.LinePen.Color        := AzulGraficaClaro;

  {Producto 8}
  SerieLineP8PctExeRem                      := TLineSeries.Create (Chart);
  SerieLineP8PctExeRem.ParentChart          := Chart;
  SerieLineP8PctExeRem.SeriesColor          := NaranjaGraficaClaro;
  SerieLineP8PctExeRem.Title                := 'Producto 8';
  SerieLineP8PctExeRem.Marks.Style          := smsPercent;
  SerieLineP8PctExeRem.LinePen.Color        := NaranjaGraficaClaro;

  SerieLineP8ImpExeRem                      := TLineSeries.Create (Chart);
  SerieLineP8ImpExeRem.ParentChart          := Chart;
  SerieLineP8ImpExeRem.SeriesColor          := NaranjaGraficaClaro;
  SerieLineP8ImpExeRem.Title                := 'Producto 8';
  SerieLineP8ImpExeRem.Marks.Style          := smsValue;
  SerieLineP8ImpExeRem.LinePen.Color        := NaranjaGraficaClaro;

  {Producto 9}
  SerieLineP9PctExeRem                      := TLineSeries.Create (Chart);
  SerieLineP9PctExeRem.ParentChart          := Chart;
  SerieLineP9PctExeRem.SeriesColor          := VerdeGraficaClaro;
  SerieLineP9PctExeRem.Title                := 'Producto 9';
  SerieLineP9PctExeRem.Marks.Style          := smsPercent;
  SerieLineP9PctExeRem.LinePen.Color        := VerdeGraficaClaro;


  SerieLineP9ImpExeRem                      := TLineSeries.Create (Chart);
  SerieLineP9ImpExeRem.ParentChart          := Chart;
  SerieLineP9ImpExeRem.SeriesColor          := VerdeGraficaClaro;
  SerieLineP9ImpExeRem.Title                := 'Producto 9';
  SerieLineP9ImpExeRem.Marks.Style          := smsValue;
  SerieLineP9ImpExeRem.LinePen.Color        := VerdeGraficaClaro;

end;

procedure TWCrLCbVsCr.VSTChange(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
begin
  VST.Refresh;
end;

procedure TWCrLCbVsCr.VSTFocusChanged(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: Integer);
begin
  VST.Refresh;
end;

procedure TWCrLCbVsCr.VSTGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: Integer; TextType: TVSTTextType;
  var Text: WideString);
var
  Data: PTreeData;
begin
  Data := VST.GetNodeData(Node);
  case Column of
    0:  Text := Data^.Tipo_Entidad;
    1:  Text := Data^.Desc_Poblacion;
    2:  Text := FloatToStr (Data^.Pct_Pi_Cal);
    3:  Text := FloatToStr (Data^.P1_Pct_Capital_Basico);
    4:  Text := FloatToStr (Data^.P1_Imp_Capital_Basico);
    5:  Text := FloatToStr (Data^.P1_Sdo_Pct);
    6:  Text := FloatToStr (Data^.P1_Sdo);
    7:  Text := FloatToStr (Data^.P1_Dif_Pct);
    8:  Text := FloatToStr (Data^.P1_Diferencia);
    9:  Text := FloatToStr (Data^.P1_Pct_Excedente);
    10: Text := FloatToStr (Data^.P1_Imp_Excedente);
    11: Text := FloatToStr (Data^.P1_Pct_Remanente);
    12: Text := FloatToStr (Data^.P1_Imp_Remanente);
    13: Text := FloatToStr (Data^.P2_Pct_Capital_Basico);
    14: Text := FloatToSTr (Data^.P2_Imp_Capital_Basico);
    15: Text := FloatToStr (Data^.P2_Sdo_Pct);
    16: Text := FloatToStr (Data^.P2_Sdo);
    17: Text := FloatToStr (Data^.P2_Dif_Pct);
    18: Text := FloatToStr (Data^.P2_Diferencia);
    19: Text := FloatToStr (Data^.P2_Pct_Excedente);
    20: Text := FloatToStr (Data^.P2_Imp_Excedente);
    21: Text := FloatToStr (Data^.P2_Pct_Remanente);
    22: Text := FloatToStr (Data^.P2_Imp_Remanente);
    23: Text := FloatToStr (Data^.P3_Pct_Capital_Basico);
    24: Text := FloatToStr (Data^.P3_Imp_Capital_Basico);
    25: Text := FloatToStr (Data^.P3_Sdo_Pct);
    26: Text := FloatToStr (Data^.P3_Sdo);
    27: Text := FloatToStr (Data^.P3_Dif_Pct);
    28: Text := FloatToStr (Data^.P3_Diferencia);
    29: Text := FloatToStr (Data^.P3_Pct_Excedente);
    30: Text := FloatToStr (Data^.P3_Imp_Excedente);
    31: Text := FloatToStr (Data^.P3_Pct_Remanente);
    32: Text := FloatToStr (Data^.P3_Imp_Remanente);
    33: Text := FloatToStr (Data^.P4_Pct_Capital_Basico);
    34: Text := FloatToStr (Data^.P4_Imp_Capital_Basico);
    35: Text := FloatToStr (Data^.P4_Sdo_Pct);
    36: Text := FloatToStr (Data^.P4_Sdo);
    37: Text := FloatToStr (Data^.P4_Dif_Pct);
    38: Text := FloatToStr (Data^.P4_Diferencia);
    39: Text := FloatToStr ( Data^.P4_Pct_Excedente);
    40: Text := FloatToStr (Data^.P4_Imp_Excedente);
    41: Text := FloatToStr (Data^.P4_Pct_Remanente);
    42: Text := FloatToStr (Data^.P4_Imp_Remanente);
    43: Text := FloatToStr (Data^.P5_Pct_Capital_Basico);
    44: Text := FloatToStr (Data^.P5_Imp_Capital_Basico);
    45: Text := FloatToStr (Data^.P5_Sdo_Pct);
    46: Text := FloatToStr (Data^.P5_Sdo);
    47: Text := FloatToStr (Data^.P5_Dif_Pct);
    48: Text := FloatToStr (Data^.P5_Diferencia);
    49: Text := FloatToStr (Data^.P5_Pct_Excedente);
    50: Text := FloatToStr (Data^.P5_Imp_Excedente);
    51: Text := FloatToStr (Data^.P5_Pct_Remanente);
    52: Text := FloatToStr (Data^.P5_Imp_Remanente);
    53: Text := FloatToStr (Data^.P6_Pct_Capital_Basico);
    54: Text := FloatToStr (Data^.P6_Imp_Capital_Basico);
    55: Text := FloatToStr (Data^.P6_Sdo_Pct);
    56: Text := FloatToStr (Data^.P6_Sdo);
    57: Text := FloatToStr (Data^.P6_Dif_Pct);
    58: Text := FloatToStr (Data^.P6_Diferencia);
    59: Text := FloatToStr (Data^.P6_Pct_Excedente);
    60: Text := FloatToStr (Data^.P6_Imp_Excedente);
    61: Text := FloatToStr (Data^.P6_Pct_Remanente);
    62: Text := FloatToStr (Data^.P6_Imp_Remanente);
    63: Text := FloatToStr (Data^.P7_Pct_Capital_Basico);
    64: Text := FloatToStr (Data^.P7_Imp_Capital_Basico);
    65: Text := FloatToStr (Data^.P7_Sdo_Pct);
    66: Text := FloatToStr (Data^.P7_Sdo);
    67: Text := FloatToStr (Data^.P7_Dif_Pct);
    68: Text := FloatToStr (Data^.P7_Diferencia);
    69: Text := FloatToStr (Data^.P7_Pct_Excedente);
    70: Text := FloatToStr (Data^.P7_Imp_Excedente);
    71: Text := FloatToStr (Data^.P7_Pct_Remanente);
    72: Text := FloatToStr (Data^.P7_Imp_Remanente);
    73: Text := FloatToStr (Data^.P8_Pct_Capital_Basico);
    74: Text := FloatToStr (Data^.P8_Imp_Capital_Basico);
    75: Text := FloatToStr (Data^.P8_Sdo_Pct);
    76: Text := FloatToStr (Data^.P8_Sdo);
    77: Text := FloatToStr (Data^.P8_Dif_Pct);
    78: Text := FloatToStr (Data^.P8_Diferencia);
    79: Text := FloatToStr (Data^.P8_Pct_Excedente);
    80: Text := FloatToStr (Data^.P8_Imp_Excedente);
    81: Text := FloatToStr (Data^.P8_Pct_Remanente);
    82: Text := FloatToStr (Data^.P8_Imp_Remanente);
    83: Text := FloatToStr (Data^.P9_Pct_Capital_Basico);
    84: Text := FloatToStr (Data^.P9_Imp_Capital_Basico);
    85: Text := FloatToStr (Data^.P9_Sdo_Pct);
    86: Text := FloatToStr (Data^.P9_Sdo);
    87: Text := FloatToStr (Data^.P9_Dif_Pct);
    88: Text := FloatToStr (Data^.P9_Diferencia);
    89: Text := FloatToStr (Data^.P9_Pct_Excedente);
    90: Text := FloatToStr (Data^.P9_Imp_Excedente);
    91: Text := FloatToStr (Data^.P9_Pct_Remanente);
    92: Text := FloatToStr (Data^.P9_Imp_Remanente);
  end;
end;

procedure TWCrLCbVsCr.CargaInfo;
var
  Data           : PTreeData;
  XNode          : PVirtualNode;
  Last           : PVirtualNode;
  vlTipo_Entidad : String;
  factor         : double;
begin
  vst.BeginUpdate;

  QIndiceCapitalizacion.Close;
  QIndiceCapitalizacion.DatabaseName                   := Objeto.Apli.DataBaseName;
  QIndiceCapitalizacion.SessionName                    := Objeto.Apli.SessionName;
  QIndiceCapitalizacion.ParamByName ('Fecha').AsString := FormatDateTime ('dd/mm/yyyy', dpFecha.Date);
  QIndiceCapitalizacion.Open;

  factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: factor := 1000000;
    1: factor := 1000;
    2: factor := 1;
  end;
  try
    //Actualiza el índice de capitalización
    syslocale.MiddleEast := True;
    edIndiceCapitalizacion.Text := FormatFloat ('#,##0.00', QIndiceCapitalizacion.FieldByName ('Imp_Capital_Basico').AsFloat * 1000000 / Factor );

    vst.Clear;
    qDatos.Close;
    qDatos.DatabaseName                           := Objeto.Apli.DataBaseName;
    qDatos.SessionName                            := Objeto.Apli.SessionName;
    qDatos.Filtered                               := False;
    qDatos.ParamByName ('peFecha').AsDateTime     := dpFecha.DateTime;
    qDatos.ParamByName ('peCartas_Cred').AsString := BoolToStr (cbCartasCredito.Checked);
    qDatos.ParamByName ('peInt_Cob_Ant').AsString := BoolToStr (cbInteresesAnticipados.Checked);

    //Valida que tipos de entidad se deben desplegar
    vlTipo_Entidad := '';

    if (cbEstatal.Checked   = True) and
       (cbMunicipal.Checked = True) and
       (cbOrgDesc.Checked   = True) then
       vlTipo_Entidad := 'ESTATAL,MUNICIPAL,ORG-DESC';

    if (cbEstatal.Checked   = True) and
       (cbMunicipal.Checked = True) and
       (cbOrgDesc.Checked   = False) then
       vlTipo_Entidad := 'ESTATAL,MUNICIPAL';


    if (cbEstatal.Checked   = True) and
       (cbMunicipal.Checked = False) and
       (cbOrgDesc.Checked   = True) then
       vlTipo_Entidad := 'ESTATAL,ORG-DESC';

    if (cbEstatal.Checked  = False) and
       (cbMunicipal.Checked = True) and
       (cbOrgDesc.Checked   = True) then
    begin
      qDatos.Filter       := 'Tiene_Municipio <> ''F'' And Tiene_Org_Desc = ''F''';
      qDatos.Filtered     := True;
    end;

    if (cbEstatal.Checked   = True) and
       (cbMunicipal.Checked = False) and
       (cbOrgDesc.Checked   = False) then
    begin
       vlTipo_Entidad   := 'ESTATAL';
       qDatos.Filter    := 'Pct_Pi_Cal <> 0';
       qDatos.Filtered  := True;
    end;

    if (cbEstatal.Checked   = False) and
       (cbMunicipal.Checked = False) and
       (cbOrgDesc.Checked   = False) then
    begin
       vlTipo_Entidad    := 'ESTATAL';
       qDatos.Filter     := 'Pct_Pi_Cal <> 0';
       qDatos.Filtered   := True;
       cbEstatal.Checked := True;
    end;

    if (cbEstatal.Checked   = False) and
       (cbMunicipal.Checked = True) and
       (cbOrgDesc.Checked   = False) then
    begin
       qDatos.Filter   := 'Tiene_Municipio <> ''F'' and Tiene_Org_Desc = ''F''';
       qDatos.Filtered := True;
    end;


    if (cbEstatal.Checked   = False) and
       (cbMunicipal.Checked = False) and
       (cbOrgDesc.Checked   = True) then
    begin
      qDatos.Filter    := 'Tiene_Org_Desc <> ''F''';
      qDatos.Filtered  := True;
    end;

    vlEntidad                                      := vlTipo_Entidad;
    qDatos.ParamByName ('peTipo_Entidad').AsString := vlTipo_Entidad;
    qDatos.ParamByName ('Factor').Asfloat          := factor;
    qDatos.Open;
    LimpiaGrafica(Self);


    XNode := nil;
    Last  := nil;
    while Not qDatos.Eof Do
    begin
      //Se encarga de poblar las series
      //Capital Básico
      SerieBarP1PctCapBas.Add (qDatos.FieldByName ('P1_Pct_Capital_Basico').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieBarP2PctCapBas.Add (qDatos.FieldByName ('P2_Pct_Capital_Basico').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieBarP3PctCapBas.Add (qDatos.FieldByName ('P3_Pct_Capital_Basico').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieBarP4PctCapBas.Add (qDatos.FieldByName ('P4_Pct_Capital_Basico').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieBarP5PctCapBas.Add (qDatos.FieldByName ('P5_Pct_Capital_Basico').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieBarP6PctCapBas.Add (qDatos.FieldByName ('P6_Pct_Capital_Basico').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieBarP7PctCapBas.Add (qDatos.FieldByName ('P7_Pct_Capital_Basico').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieBarP8PctCapBas.Add (qDatos.FieldByName ('P8_Pct_Capital_Basico').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieBarP9PctCapBas.Add (qDatos.FieldByName ('P9_Pct_Capital_Basico').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);

      //Informaciíon Real
      SerieLineP1PctExeRem.Add (qDatos.FieldByName ('P1_Sdo_Pct').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieLineP2PctExeRem.Add (qDatos.FieldByName ('P2_Sdo_Pct').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieLineP3PctExeRem.Add (qDatos.FieldByName ('P3_Sdo_Pct').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieLineP4PctExeRem.Add (qDatos.FieldByName ('P4_Sdo_Pct').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieLineP5PctExeRem.Add (qDatos.FieldByName ('P5_Sdo_Pct').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieLineP6PctExeRem.Add (qDatos.FieldByName ('P6_Sdo_Pct').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieLineP7PctExeRem.Add (qDatos.FieldByName ('P7_Sdo_Pct').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieLineP8PctExeRem.Add (qDatos.FieldByName ('P8_Sdo_Pct').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieLineP9PctExeRem.Add (qDatos.FieldByName ('P9_Sdo_Pct').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);

      //Capital Básico
      SerieBarP1ImpCapBas.Add (qDatos.FieldByName ('P1_Imp_Capital_Basico').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieBarP2ImpCapBas.Add (qDatos.FieldByName ('P2_Imp_Capital_Basico').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieBarP3ImpCapBas.Add (qDatos.FieldByName ('P3_Imp_Capital_Basico').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieBarP4ImpCapBas.Add (qDatos.FieldByName ('P4_Imp_Capital_Basico').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieBarP5ImpCapBas.Add (qDatos.FieldByName ('P5_Imp_Capital_Basico').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieBarP6ImpCapBas.Add (qDatos.FieldByName ('P6_Imp_Capital_Basico').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieBarP7ImpCapBas.Add (qDatos.FieldByName ('P7_Imp_Capital_Basico').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieBarP8ImpCapBas.Add (qDatos.FieldByName ('P8_Imp_Capital_Basico').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieBarP9ImpCapBas.Add (qDatos.FieldByName ('P9_Imp_Capital_Basico').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);

      //Informaciíon Real
      SerieLineP1ImpExeRem.Add (qDatos.FieldByName ('P1_Sdo').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieLineP2ImpExeRem.Add (qDatos.FieldByName ('P2_Sdo').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieLineP3ImpExeRem.Add (qDatos.FieldByName ('P3_Sdo').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieLineP4ImpExeRem.Add (qDatos.FieldByName ('P4_Sdo').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieLineP5ImpExeRem.Add (qDatos.FieldByName ('P5_Sdo').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieLineP6ImpExeRem.Add (qDatos.FieldByName ('P6_Sdo').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieLineP7ImpExeRem.Add (qDatos.FieldByName ('P7_Sdo').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieLineP8ImpExeRem.Add (qDatos.FieldByName ('P8_Sdo').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);
      SerieLineP9ImpExeRem.Add (qDatos.FieldByName ('P9_Sdo').AsFloat, qDatos.FieldByName ('Desc_Poblacion').AsString);

      //Pobla el árbol
      If  qDatos.FieldByName('Cve_Ciudad').AsString = '' Then
      begin
        XNode                       := VST.AddChild(nil);
        Data                        := Vst.GetNodeData(XNode);
        Data^.Tipo_Entidad          :=        qDatos.FieldByName ('Tipo_Entidad'         ).AsString;
        Data^.Desc_Poblacion        :=        qDatos.FieldByName ('Desc_Poblacion'       ).AsString;
        Data^.Pct_Pi                :=        qDatos.FieldByName ('Pct_Pi'               ).AsFloat;
        Data^.Pct_Pi_Cal            :=        qDatos.FieldByName ('Pct_Pi_Cal'           ).AsFloat;
        Data^.P1_Pct_Capital_Basico :=        qDatos.FieldByName ('P1_Pct_Capital_Basico').AsFloat;
        Data^.P1_Imp_Capital_Basico :=        qDatos.FieldByName ('P1_Imp_Capital_Basico').AsFloat ;
        Data^.P1_Sdo_Pct            :=        qDatos.FieldByName ('P1_Sdo_Pct'           ).AsFloat;
        Data^.P1_Sdo                :=        qDatos.FieldByName ('P1_Sdo'               ).AsFloat ;
        Data^.P1_Dif_Pct            :=        qDatos.FieldByName ('P1_Dif_Pct'           ).AsFloat;
        Data^.P1_Diferencia         :=        qDatos.FieldByName ('P1_Diferencia'        ).AsFloat ;
        Data^.P1_Pct_Excedente      :=        qDatos.FieldByName ('P1_Pct_Excedente'     ).AsFloat;
        Data^.P1_Imp_Excedente      :=        qDatos.FieldByName ('P1_Imp_Excedente'     ).AsFloat ;
        Data^.P1_Pct_Remanente      :=        qDatos.FieldByName ('P1_Pct_Remanente'     ).AsFloat;
        Data^.P1_Imp_Remanente      :=        qDatos.FieldByName ('P1_Imp_Remanente'     ).AsFloat ;
        // Info Producto 2
        Data^.P2_Pct_Capital_Basico :=        qDatos.FieldByName ('P2_Pct_Capital_Basico').AsFloat;
        Data^.P2_Imp_Capital_Basico :=        qDatos.FieldByName ('P2_Imp_Capital_Basico').AsFloat ;
        Data^.P2_Sdo_Pct            :=        qDatos.FieldByName ('P2_Sdo_Pct'           ).AsFloat;
        Data^.P2_Sdo                :=        qDatos.FieldByName ('P2_Sdo'               ).AsFloat ;
        Data^.P2_Dif_Pct            :=        qDatos.FieldByName ('P2_Dif_Pct'           ).AsFloat;
        Data^.P2_Diferencia         :=        qDatos.FieldByName ('P2_Diferencia'        ).AsFloat ;
        Data^.P2_Pct_Excedente      :=        qDatos.FieldByName ('P2_Pct_Excedente'     ).AsFloat;
        Data^.P2_Imp_Excedente      :=        qDatos.FieldByName ('P2_Imp_Excedente'     ).AsFloat ;
        Data^.P2_Pct_Remanente      :=        qDatos.FieldByName ('P2_Pct_Remanente'     ).AsFloat;
        Data^.P2_Imp_Remanente      :=        qDatos.FieldByName ('P2_Imp_Remanente'     ).AsFloat ;
        // Info Producto 3
        Data^.P3_Pct_Capital_Basico :=        qDatos.FieldByName ('P3_Pct_Capital_Basico').AsFloat;
        Data^.P3_Imp_Capital_Basico :=        qDatos.FieldByName ('P3_Imp_Capital_Basico').AsFloat ;
        Data^.P3_Sdo_Pct            :=        qDatos.FieldByName ('P3_Sdo_Pct'           ).AsFloat;
        Data^.P3_Sdo                :=        qDatos.FieldByName ('P3_Sdo'               ).AsFloat ;
        Data^.P3_Dif_Pct            :=        qDatos.FieldByName ('P3_Dif_Pct'           ).AsFloat;
        Data^.P3_Diferencia         :=        qDatos.FieldByName ('P3_Diferencia'        ).AsFloat ;
        Data^.P3_Pct_Excedente      :=        qDatos.FieldByName ('P3_Pct_Excedente'     ).AsFloat;
        Data^.P3_Imp_Excedente      :=        qDatos.FieldByName ('P3_Imp_Excedente'     ).AsFloat ;
        Data^.P3_Pct_Remanente      :=        qDatos.FieldByName ('P3_Pct_Remanente'     ).AsFloat;
        Data^.P3_Imp_Remanente      :=        qDatos.FieldByName ('P3_Imp_Remanente'     ).AsFloat ;
        // Info Producto 4
        Data^.P4_Pct_Capital_Basico :=        qDatos.FieldByName ('P4_Pct_Capital_Basico').AsFloat;
        Data^.P4_Imp_Capital_Basico :=        qDatos.FieldByName ('P4_Imp_Capital_Basico').AsFloat ;
        Data^.P4_Sdo_Pct            :=        qDatos.FieldByName ('P4_Sdo_Pct'           ).AsFloat;
        Data^.P4_Sdo                :=        qDatos.FieldByName ('P4_Sdo'               ).AsFloat ;
        Data^.P4_Dif_Pct            :=        qDatos.FieldByName ('P4_Dif_Pct'           ).AsFloat;
        Data^.P4_Diferencia         :=        qDatos.FieldByName ('P4_Diferencia'        ).AsFloat ;
        Data^.P4_Pct_Excedente      :=        qDatos.FieldByName ('P4_Pct_Excedente'     ).AsFloat;
        Data^.P4_Imp_Excedente      :=        qDatos.FieldByName ('P4_Imp_Excedente'     ).AsFloat ;
        Data^.P4_Pct_Remanente      :=        qDatos.FieldByName ('P4_Pct_Remanente'     ).AsFloat;
        Data^.P4_Imp_Remanente      :=        qDatos.FieldByName ('P4_Imp_Remanente'     ).AsFloat ;
        // Info Producto 5
        Data^.P5_Pct_Capital_Basico :=        qDatos.FieldByName ('P5_Pct_Capital_Basico').AsFloat;
        Data^.P5_Imp_Capital_Basico :=        qDatos.FieldByName ('P5_Imp_Capital_Basico').AsFloat ;
        Data^.P5_Sdo_Pct            :=        qDatos.FieldByName ('P5_Sdo_Pct'           ).AsFloat;
        Data^.P5_Sdo                :=        qDatos.FieldByName ('P5_Sdo'               ).AsFloat ;
        Data^.P5_Dif_Pct            :=        qDatos.FieldByName ('P5_Dif_Pct'           ).AsFloat;
        Data^.P5_Diferencia         :=        qDatos.FieldByName ('P5_Diferencia'        ).AsFloat ;
        Data^.P5_Pct_Excedente      :=        qDatos.FieldByName ('P5_Pct_Excedente'     ).AsFloat;
        Data^.P5_Imp_Excedente      :=        qDatos.FieldByName ('P5_Imp_Excedente'     ).AsFloat ;
        Data^.P5_Pct_Remanente      :=        qDatos.FieldByName ('P5_Pct_Remanente'     ).AsFloat;
        Data^.P5_Imp_Remanente      :=        qDatos.FieldByName ('P5_Imp_Remanente'     ).AsFloat ;
        // Info Producto 6
        Data^.P6_Pct_Capital_Basico :=        qDatos.FieldByName ('P6_Pct_Capital_Basico').AsFloat;
        Data^.P6_Imp_Capital_Basico :=        qDatos.FieldByName ('P6_Imp_Capital_Basico').AsFloat ;
        Data^.P6_Sdo_Pct            :=        qDatos.FieldByName ('P6_Sdo_Pct'           ).AsFloat;
        Data^.P6_Sdo                :=        qDatos.FieldByName ('P6_Sdo'               ).AsFloat ;
        Data^.P6_Dif_Pct            :=        qDatos.FieldByName ('P6_Dif_Pct'           ).AsFloat;
        Data^.P6_Diferencia         :=        qDatos.FieldByName ('P6_Diferencia'        ).AsFloat ;
        Data^.P6_Pct_Excedente      :=        qDatos.FieldByName ('P6_Pct_Excedente'     ).AsFloat;
        Data^.P6_Imp_Excedente      :=        qDatos.FieldByName ('P6_Imp_Excedente'     ).AsFloat ;
        Data^.P6_Pct_Remanente      :=        qDatos.FieldByName ('P6_Pct_Remanente'     ).AsFloat;
        Data^.P6_Imp_Remanente      :=        qDatos.FieldByName ('P6_Imp_Remanente'     ).AsFloat ;
        // Info Producto 7
        Data^.P7_Pct_Capital_Basico :=        qDatos.FieldByName ('P7_Pct_Capital_Basico').AsFloat;
        Data^.P7_Imp_Capital_Basico :=        qDatos.FieldByName ('P7_Imp_Capital_Basico').AsFloat ;
        Data^.P7_Sdo_Pct            :=        qDatos.FieldByName ('P7_Sdo_Pct'           ).AsFloat;
        Data^.P7_Sdo                :=        qDatos.FieldByName ('P7_Sdo'               ).AsFloat ;
        Data^.P7_Dif_Pct            :=        qDatos.FieldByName ('P7_Dif_Pct'           ).AsFloat;
        Data^.P7_Diferencia         :=        qDatos.FieldByName ('P7_Diferencia'        ).AsFloat ;
        Data^.P7_Pct_Excedente      :=        qDatos.FieldByName ('P7_Pct_Excedente'     ).AsFloat;
        Data^.P7_Imp_Excedente      :=        qDatos.FieldByName ('P7_Imp_Excedente'     ).AsFloat ;
        Data^.P7_Pct_Remanente      :=        qDatos.FieldByName ('P7_Pct_Remanente'     ).AsFloat;
        Data^.P7_Imp_Remanente      :=        qDatos.FieldByName ('P7_Imp_Remanente'     ).AsFloat ;
        // Info Producto 8
        Data^.P8_Pct_Capital_Basico :=        qDatos.FieldByName ('P8_Pct_Capital_Basico').AsFloat;
        Data^.P8_Imp_Capital_Basico :=        qDatos.FieldByName ('P8_Imp_Capital_Basico').AsFloat ;
        Data^.P8_Sdo_Pct            :=        qDatos.FieldByName ('P8_Sdo_Pct'           ).AsFloat;
        Data^.P8_Sdo                :=        qDatos.FieldByName ('P8_Sdo'               ).AsFloat ;
        Data^.P8_Dif_Pct            :=        qDatos.FieldByName ('P8_Dif_Pct'           ).AsFloat;
        Data^.P8_Diferencia         :=        qDatos.FieldByName ('P8_Diferencia'        ).AsFloat ;
        Data^.P8_Pct_Excedente      :=        qDatos.FieldByName ('P8_Pct_Excedente'     ).AsFloat;
        Data^.P8_Imp_Excedente      :=        qDatos.FieldByName ('P8_Imp_Excedente'     ).AsFloat ;
        Data^.P8_Pct_Remanente      :=        qDatos.FieldByName ('P8_Pct_Remanente'     ).AsFloat;
        Data^.P8_Imp_Remanente      :=        qDatos.FieldByName ('P8_Imp_Remanente'     ).AsFloat ;
        // Info Producto 9
        Data^.P9_Pct_Capital_Basico :=        qDatos.FieldByName ('P9_Pct_Capital_Basico').AsFloat;
        Data^.P9_Imp_Capital_Basico :=        qDatos.FieldByName ('P9_Imp_Capital_Basico').AsFloat ;
        Data^.P9_Sdo_Pct            :=        qDatos.FieldByName ('P9_Sdo_Pct'           ).AsFloat;
        Data^.P9_Sdo                :=        qDatos.FieldByName ('P9_Sdo'               ).AsFloat ;
        Data^.P9_Dif_Pct            :=        qDatos.FieldByName ('P9_Dif_Pct'           ).AsFloat;
        Data^.P9_Diferencia         :=        qDatos.FieldByName ('P9_Diferencia'        ).AsFloat ;
        Data^.P9_Pct_Excedente      :=        qDatos.FieldByName ('P9_Pct_Excedente'     ).AsFloat;
        Data^.P9_Imp_Excedente      :=        qDatos.FieldByName ('P9_Imp_Excedente'     ).AsFloat ;
        Data^.P9_Pct_Remanente      :=        qDatos.FieldByName ('P9_Pct_Remanente'     ).AsFloat;
        Data^.P9_Imp_Remanente      :=        qDatos.FieldByName ('P9_Imp_Remanente'     ).AsFloat ;
      end
      else
      begin
        Last                        := Vst.GetLastVisibleChild(XNode);
        XNode                       := VST.AddChild(Last);
        Data                        := VST.GetNodeData(Xnode);
        Data^.Tipo_Entidad          :=        qDatos.FieldByName ('Tipo_Entidad'         ).AsString;
        Data^.Desc_Poblacion        :=        qDatos.FieldByName ('Desc_Poblacion'       ).AsString;
        Data^.Pct_Pi                :=        qDatos.FieldByName ('Pct_Pi'               ).AsFloat;
        Data^.Pct_Pi_Cal            :=        qDatos.FieldByName ('Pct_Pi_Cal'           ).AsFloat;
        Data^.P1_Pct_Capital_Basico :=        qDatos.FieldByName ('P1_Pct_Capital_Basico').AsFloat;
        Data^.P1_Imp_Capital_Basico :=        qDatos.FieldByName ('P1_Imp_Capital_Basico').AsFloat;
        Data^.P1_Sdo_Pct            :=        qDatos.FieldByName ('P1_Sdo_Pct'           ).AsFloat;
        Data^.P1_Sdo                :=        qDatos.FieldByName ('P1_Sdo'               ).AsFloat;
        Data^.P1_Dif_Pct            :=        qDatos.FieldByName ('P1_Dif_Pct'           ).AsFloat;
        Data^.P1_Diferencia         :=        qDatos.FieldByName ('P1_Diferencia'        ).AsFloat;
        Data^.P1_Pct_Excedente      :=        qDatos.FieldByName ('P1_Pct_Excedente'     ).AsFloat;
        Data^.P1_Imp_Excedente      :=        qDatos.FieldByName ('P1_Imp_Excedente'     ).AsFloat;
        Data^.P1_Pct_Remanente      :=        qDatos.FieldByName ('P1_Pct_Remanente'     ).AsFloat;
        Data^.P1_Imp_Remanente      :=        qDatos.FieldByName ('P1_Imp_Remanente'     ).AsFloat;
        // Info Producto 2
        Data^.P2_Pct_Capital_Basico :=        qDatos.FieldByName ('P2_Pct_Capital_Basico').AsFloat;
        Data^.P2_Imp_Capital_Basico :=        qDatos.FieldByName ('P2_Imp_Capital_Basico').AsFloat ;
        Data^.P2_Sdo_Pct            :=        qDatos.FieldByName ('P2_Sdo_Pct'           ).AsFloat;
        Data^.P2_Sdo                :=        qDatos.FieldByName ('P2_Sdo'               ).AsFloat ;
        Data^.P2_Dif_Pct            :=        qDatos.FieldByName ('P2_Dif_Pct'           ).AsFloat;
        Data^.P2_Diferencia         :=        qDatos.FieldByName ('P2_Diferencia'        ).AsFloat ;
        Data^.P2_Pct_Excedente      :=        qDatos.FieldByName ('P2_Pct_Excedente'     ).AsFloat;
        Data^.P2_Imp_Excedente      :=        qDatos.FieldByName ('P2_Imp_Excedente'     ).AsFloat ;
        Data^.P2_Pct_Remanente      :=        qDatos.FieldByName ('P2_Pct_Remanente'     ).AsFloat;
        Data^.P2_Imp_Remanente      :=        qDatos.FieldByName ('P2_Imp_Remanente'     ).AsFloat ;
        // Info Producto 3
        Data^.P3_Pct_Capital_Basico :=        qDatos.FieldByName ('P3_Pct_Capital_Basico').AsFloat;
        Data^.P3_Imp_Capital_Basico :=        qDatos.FieldByName ('P3_Imp_Capital_Basico').AsFloat ;
        Data^.P3_Sdo_Pct            :=        qDatos.FieldByName ('P3_Sdo_Pct'           ).AsFloat;
        Data^.P3_Sdo                :=        qDatos.FieldByName ('P3_Sdo'               ).AsFloat ;
        Data^.P3_Dif_Pct            :=        qDatos.FieldByName ('P3_Dif_Pct'           ).AsFloat;
        Data^.P3_Diferencia         :=        qDatos.FieldByName ('P3_Diferencia'        ).AsFloat ;
        Data^.P3_Pct_Excedente      :=        qDatos.FieldByName ('P3_Pct_Excedente'     ).AsFloat;
        Data^.P3_Imp_Excedente      :=        qDatos.FieldByName ('P3_Imp_Excedente'     ).AsFloat ;
        Data^.P3_Pct_Remanente      :=        qDatos.FieldByName ('P3_Pct_Remanente'     ).AsFloat;
        Data^.P3_Imp_Remanente      :=        qDatos.FieldByName ('P3_Imp_Remanente'     ).AsFloat ;
        // Info Producto 4
        Data^.P4_Pct_Capital_Basico :=        qDatos.FieldByName ('P4_Pct_Capital_Basico').AsFloat;
        Data^.P4_Imp_Capital_Basico :=        qDatos.FieldByName ('P4_Imp_Capital_Basico').AsFloat ;
        Data^.P4_Sdo_Pct            :=        qDatos.FieldByName ('P4_Sdo_Pct'           ).AsFloat;
        Data^.P4_Sdo                :=        qDatos.FieldByName ('P4_Sdo'               ).AsFloat ;
        Data^.P4_Dif_Pct            :=        qDatos.FieldByName ('P4_Dif_Pct'           ).AsFloat;
        Data^.P4_Diferencia         :=        qDatos.FieldByName ('P4_Diferencia'        ).AsFloat ;
        Data^.P4_Pct_Excedente      :=        qDatos.FieldByName ('P4_Pct_Excedente'     ).AsFloat;
        Data^.P4_Imp_Excedente      :=        qDatos.FieldByName ('P4_Imp_Excedente'     ).AsFloat ;
        Data^.P4_Pct_Remanente      :=        qDatos.FieldByName ('P4_Pct_Remanente'     ).AsFloat;
        Data^.P4_Imp_Remanente      :=        qDatos.FieldByName ('P4_Imp_Remanente'     ).AsFloat ;
        // Info Producto 5
        Data^.P5_Pct_Capital_Basico :=        qDatos.FieldByName ('P5_Pct_Capital_Basico').AsFloat;
        Data^.P5_Imp_Capital_Basico :=        qDatos.FieldByName ('P5_Imp_Capital_Basico').AsFloat ;
        Data^.P5_Sdo_Pct            :=        qDatos.FieldByName ('P5_Sdo_Pct'           ).AsFloat;
        Data^.P5_Sdo                :=        qDatos.FieldByName ('P5_Sdo'               ).AsFloat ;
        Data^.P5_Dif_Pct            :=        qDatos.FieldByName ('P5_Dif_Pct'           ).AsFloat;
        Data^.P5_Diferencia         :=        qDatos.FieldByName ('P5_Diferencia'        ).AsFloat ;
        Data^.P5_Pct_Excedente      :=        qDatos.FieldByName ('P5_Pct_Excedente'     ).AsFloat;
        Data^.P5_Imp_Excedente      :=        qDatos.FieldByName ('P5_Imp_Excedente'     ).AsFloat ;
        Data^.P5_Pct_Remanente      :=        qDatos.FieldByName ('P5_Pct_Remanente'     ).AsFloat;
        Data^.P5_Imp_Remanente      :=        qDatos.FieldByName ('P5_Imp_Remanente'     ).AsFloat ;
        // Info Producto 6
        Data^.P6_Pct_Capital_Basico :=        qDatos.FieldByName ('P6_Pct_Capital_Basico').AsFloat;
        Data^.P6_Imp_Capital_Basico :=        qDatos.FieldByName ('P6_Imp_Capital_Basico').AsFloat ;
        Data^.P6_Sdo_Pct            :=        qDatos.FieldByName ('P6_Sdo_Pct'           ).AsFloat;
        Data^.P6_Sdo                :=        qDatos.FieldByName ('P6_Sdo'               ).AsFloat ;
        Data^.P6_Dif_Pct            :=        qDatos.FieldByName ('P6_Dif_Pct'           ).AsFloat;
        Data^.P6_Diferencia         :=        qDatos.FieldByName ('P6_Diferencia'        ).AsFloat ;
        Data^.P6_Pct_Excedente      :=        qDatos.FieldByName ('P6_Pct_Excedente'     ).AsFloat;
        Data^.P6_Imp_Excedente      :=        qDatos.FieldByName ('P6_Imp_Excedente'     ).AsFloat ;
        Data^.P6_Pct_Remanente      :=        qDatos.FieldByName ('P6_Pct_Remanente'     ).AsFloat;
        Data^.P6_Imp_Remanente      :=        qDatos.FieldByName ('P6_Imp_Remanente'     ).AsFloat ;
        // Info Producto 7
        Data^.P7_Pct_Capital_Basico :=        qDatos.FieldByName ('P7_Pct_Capital_Basico').AsFloat;
        Data^.P7_Imp_Capital_Basico :=        qDatos.FieldByName ('P7_Imp_Capital_Basico').AsFloat ;
        Data^.P7_Sdo_Pct            :=        qDatos.FieldByName ('P7_Sdo_Pct'           ).AsFloat;
        Data^.P7_Sdo                :=        qDatos.FieldByName ('P7_Sdo'               ).AsFloat ;
        Data^.P7_Dif_Pct            :=        qDatos.FieldByName ('P7_Dif_Pct'           ).AsFloat;
        Data^.P7_Diferencia         :=        qDatos.FieldByName ('P7_Diferencia'        ).AsFloat ;
        Data^.P7_Pct_Excedente      :=        qDatos.FieldByName ('P7_Pct_Excedente'     ).AsFloat;
        Data^.P7_Imp_Excedente      :=        qDatos.FieldByName ('P7_Imp_Excedente'     ).AsFloat ;
        Data^.P7_Pct_Remanente      :=        qDatos.FieldByName ('P7_Pct_Remanente'     ).AsFloat;
        Data^.P7_Imp_Remanente      :=        qDatos.FieldByName ('P7_Imp_Remanente'     ).AsFloat ;
        // Info Producto 8
        Data^.P8_Pct_Capital_Basico :=        qDatos.FieldByName ('P8_Pct_Capital_Basico').AsFloat;
        Data^.P8_Imp_Capital_Basico :=        qDatos.FieldByName ('P8_Imp_Capital_Basico').AsFloat ;
        Data^.P8_Sdo_Pct            :=        qDatos.FieldByName ('P8_Sdo_Pct'           ).AsFloat;
        Data^.P8_Sdo                :=        qDatos.FieldByName ('P8_Sdo'               ).AsFloat ;
        Data^.P8_Dif_Pct            :=        qDatos.FieldByName ('P8_Dif_Pct'           ).AsFloat;
        Data^.P8_Diferencia         :=        qDatos.FieldByName ('P8_Diferencia'        ).AsFloat ;
        Data^.P8_Pct_Excedente      :=        qDatos.FieldByName ('P8_Pct_Excedente'     ).AsFloat;
        Data^.P8_Imp_Excedente      :=        qDatos.FieldByName ('P8_Imp_Excedente'     ).AsFloat ;
        Data^.P8_Pct_Remanente      :=        qDatos.FieldByName ('P8_Pct_Remanente'     ).AsFloat;
        Data^.P8_Imp_Remanente      :=        qDatos.FieldByName ('P8_Imp_Remanente'     ).AsFloat ;
        // Info Producto 9
        Data^.P9_Pct_Capital_Basico :=        qDatos.FieldByName ('P9_Pct_Capital_Basico').AsFloat;
        Data^.P9_Imp_Capital_Basico :=        qDatos.FieldByName ('P9_Imp_Capital_Basico').AsFloat ;
        Data^.P9_Sdo_Pct            :=        qDatos.FieldByName ('P9_Sdo_Pct'           ).AsFloat;
        Data^.P9_Sdo                :=        qDatos.FieldByName ('P9_Sdo'               ).AsFloat ;
        Data^.P9_Dif_Pct            :=        qDatos.FieldByName ('P9_Dif_Pct'           ).AsFloat;
        Data^.P9_Diferencia         :=        qDatos.FieldByName ('P9_Diferencia'        ).AsFloat ;
        Data^.P9_Pct_Excedente      :=        qDatos.FieldByName ('P9_Pct_Excedente'     ).AsFloat;
        Data^.P9_Imp_Excedente      :=        qDatos.FieldByName ('P9_Imp_Excedente'     ).AsFloat ;
        Data^.P9_Pct_Remanente      :=        qDatos.FieldByName ('P9_Pct_Remanente'     ).AsFloat;
        Data^.P9_Imp_Remanente      :=        qDatos.FieldByName ('P9_Imp_Remanente'     ).AsFloat ;
        Xnode                       := Vst.GetLastChild(Xnode);
      end;
    Application.ProcessMessages;
    qDatos.Next;
    end;
    vst.FullExpand;
  finally
     vst.EndUpdate;
     //Valida 3d
     rgProyeccionClick (rgProyeccion);
     //Mustra la información
     cbMuestraInfoRealClick (cbMuestraInfoReal);
     //Mustra la información de Capital Básico
     cbMuestraCapBasClick (cbMuestraCapBas);
     //Valida si se muestran las etiquetas
     cbDisplayMarksClick  (cbDisplayMarks);
   end;
end;


procedure TWCrLCbVsCr.FormShow(Sender: TObject);
begin
  dpFecha.DateTime := Objeto.Apli.DameFechaEmpresa;
  CargaInfo;
end;

procedure TWCrLCbVsCr.VSTGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: Integer;
  var Index: Integer);
var
  Data: PTreeData;
begin
  Data := VST.GetNodeData(Node);

 if Kind in [ikNormal , ikSelected] then
  begin
    if (Column = 0) and (vst.GetNodeLevel(Node) = 0) then
      Index:= 0;

    if (Column = 0) and (vst.GetNodeLevel(Node) <> 0) then
      Index := 1;

    if (Column = 0) and (Data^.Tipo_Entidad = 'ORG-DESC') then
      Index :=3;
  end;
end;

function TWCrLCbVsCr.Money (f: double): string;
begin
  result := Format ('%m', [f]);
  result := Copy (result, 1, Length (result) - 2);
end;

procedure TWCrLCbVsCr.rgInfoDesplegarClick(Sender: TObject);
begin
  cbMuestraInfoRealClick(cbMuestraInfoReal);
  cbMuestraCapBasClick(cbMuestraCapBas);
end;

procedure TWCrLCbVsCr.rgProyeccionClick(Sender: TObject);
begin
  Chart.View3D := rgProyeccion.ItemIndex = 1;
end;

procedure TWCrLCbVsCr.cbDisplayMarksClick(Sender: TObject);
begin
  //Valida si las etiquetas deben de  mostrarse
  //Capital Básico
  //Producto 1
  SerieBarP1PctCapBas.Marks.Visible   := cbDisplayMarks.Checked;
  SerieBarP1ImpCapBas.Marks.Visible   := cbDisplayMarks.Checked;
  //Producto 2
  SerieBarP2PctCapBas.Marks.Visible   := cbDisplayMarks.Checked;
  SerieBarP2ImpCapBas.Marks.Visible   := cbDisplayMarks.Checked;
  //Producto 3
  SerieBarP3PctCapBas.Marks.Visible   := cbDisplayMarks.Checked;
  SerieBarP3ImpCapBas.Marks.Visible   := cbDisplayMarks.Checked;
  //Producto 4
  SerieBarP4PctCapBas.Marks.Visible   := cbDisplayMarks.Checked;
  SerieBarP4ImpCapBas.Marks.Visible   := cbDisplayMarks.Checked;
  //Producto 5
  SerieBarP5PctCapBas.Marks.Visible   := cbDisplayMarks.Checked;
  SerieBarP5ImpCapBas.Marks.Visible   := cbDisplayMarks.Checked;
  //Producto 6
  SerieBarP6PctCapBas.Marks.Visible   := cbDisplayMarks.Checked;
  SerieBarP6ImpCapBas.Marks.Visible   := cbDisplayMarks.Checked;
  //Producto 7
  SerieBarP7PctCapBas.Marks.Visible   := cbDisplayMarks.Checked;
  SerieBarP7ImpCapBas.Marks.Visible   := cbDisplayMarks.Checked;
  //Producto 8
  SerieBarP8PctCapBas.Marks.Visible   := cbDisplayMarks.Checked;
  SerieBarP8ImpCapBas.Marks.Visible   := cbDisplayMarks.Checked;
  //Producto 9
  SerieBarP9PctCapBas.Marks.Visible   := cbDisplayMarks.Checked;
  SerieBarP9ImpCapBas.Marks.Visible   := cbDisplayMarks.Checked;

  //Información Real
  //Producto 1
  SerieLineP1PctExeRem.Marks.Visible   := cbDisplayMarks.Checked;
  SerieLineP1ImpExeRem.Marks.Visible   := cbDisplayMarks.Checked;
  //Producto 2
  SerieLineP2PctExeRem.Marks.Visible   := cbDisplayMarks.Checked;
  SerieLineP2ImpExeRem.Marks.Visible   := cbDisplayMarks.Checked;
  //Producto 3
  SerieLineP3PctExeRem.Marks.Visible   := cbDisplayMarks.Checked;
  SerieLineP3ImpExeRem.Marks.Visible   := cbDisplayMarks.Checked;
  //Producto 4
  SerieLineP4PctExeRem.Marks.Visible   := cbDisplayMarks.Checked;
  SerieLineP4ImpExeRem.Marks.Visible   := cbDisplayMarks.Checked;
  //Producto 5
  SerieLineP5PctExeRem.Marks.Visible   := cbDisplayMarks.Checked;
  SerieLineP5ImpExeRem.Marks.Visible   := cbDisplayMarks.Checked;
  //Producto 6
  SerieLineP6PctExeRem.Marks.Visible   := cbDisplayMarks.Checked;
  SerieLineP6ImpExeRem.Marks.Visible   := cbDisplayMarks.Checked;
  //Producto 7
  SerieLineP7PctExeRem.Marks.Visible   := cbDisplayMarks.Checked;
  SerieLineP7ImpExeRem.Marks.Visible   := cbDisplayMarks.Checked;
  //Producto 8
  SerieLineP8PctExeRem.Marks.Visible   := cbDisplayMarks.Checked;
  SerieLineP8ImpExeRem.Marks.Visible   := cbDisplayMarks.Checked;
  //Producto 9
  SerieLineP9PctExeRem.Marks.Visible   := cbDisplayMarks.Checked;
  SerieLineP9ImpExeRem.Marks.Visible   := cbDisplayMarks.Checked;
end;

procedure TWCrLCbVsCr.LimpiaGrafica(Sender : TObject);
begin
  {Producto 1  Capital Básico}
  SerieBarP1PctCapBas.Clear;
  SerieBarP1ImpCapBas.Clear;
  {Producto 2  Capital Básico}
  SerieBarP2PctCapBas.Clear;
  SerieBarP2ImpCapBas.Clear;
  {Producto 3  Capital Básico}
  SerieBarP3PctCapBas.Clear;
  SerieBarP3ImpCapBas.Clear;
  {Producto 4  Capital Básico}
  SerieBarP4PctCapBas.Clear;
  SerieBarP4ImpCapBas.Clear;
  {Producto 5  Capital Básico}
  SerieBarP5PctCapBas.Clear;
  SerieBarP5ImpCapBas.Clear;
  {Producto 6  Capital Básico}
  SerieBarP6PctCapBas.Clear;
  SerieBarP6ImpCapBas.Clear;
  {Producto 7  Capital Básico}
  SerieBarP7PctCapBas.Clear;
  SerieBarP7ImpCapBas.Clear;
  {Producto 8  Capital Básico}
  SerieBarP8PctCapBas.Clear;
  SerieBarP8ImpCapBas.Clear;
  {Producto 9  Capital Básico}
  SerieBarP9PctCapBas.Clear;
  SerieBarP9ImpCapBas.Clear;

  {Producto 1 }
  SerieLineP1PctExeRem.Clear;
  SerieLineP1ImpExeRem.Clear;
  {Producto 2 }
  SerieLineP2PctExeRem.Clear;
  SerieLineP2ImpExeRem.Clear;
  {Producto 3}
  SerieLineP3PctExeRem.Clear;
  SerieLineP3ImpExeRem.Clear;
  {Producto 4}
  SerieLineP4PctExeRem.Clear;
  SerieLineP4ImpExeRem.Clear;
  {Producto 5}
  SerieLineP5PctExeRem.Clear;
  SerieLineP5ImpExeRem.Clear;
  {Producto 6}
  SerieLineP6PctExeRem.Clear;
  SerieLineP6ImpExeRem.Clear;
  {Producto 7}
  SerieLineP7PctExeRem.Clear;
  SerieLineP7ImpExeRem.Clear;
  {Producto 8}
  SerieLineP8PctExeRem.Clear;
  SerieLineP8ImpExeRem.Clear;
  {Producto 9}
  SerieLineP9PctExeRem.Clear;
  SerieLineP9ImpExeRem.Clear;
end;


procedure TWCrLCbVsCr.ExportarExcel (FileName: string);
var
  XLApp, XLSheet: Variant;
  Range, Chart :Variant;
  SerieP1CB, SerieP2CB, SerieP3CB, SerieP4CB, SerieP5CB, SerieP6CB, SerieP7CB, SerieP8CB, SerieP9CB : Variant;
  SerieP1IR, SerieP2IR, SerieP3IR, SerieP4IR, SerieP5IR, SerieP6IR, SerieP7IR, SerieP8IR, SerieP9IR : Variant;
  r,  SheetNum: integer;
  a, b, i, p, Opciones: Integer;
  vlEntidades : String;
  Hijos: boolean;
  s, col: string;

begin
  XLApp := CreateOleObject('Excel.Application');
  Opciones := 1;

  try
    Cursor              := crHourGlass;
    XLApp.Visible       := False;
    XLApp.DisplayAlerts := False;
    SheetNum            := 1;
    XLApp.Workbooks.Add(xlWBatWorkSheet);

    {Inicia la generación de la tabla}
    XLSheet      := XLApp.Workbooks[1].WorkSheets[SheetNum];
    XLSheet.Name := 'Tabla';
    Inc (SheetNum);

    XLSheet.Range ['A1:D1']  .Merge;
    XLSheet.Range ['A2:D2']  .Merge;
    XLSheet.Cells [1, 1].Formula := 'Límite Máximo de Capital Básico Vs Cartera Total ';

     XLSheet.Range ['A3:C3']  .Merge;
    XLSheet.Cells [2, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [2, 9].Formula := 'Índice de Capitalización: $' + edIndiceCapitalizacion.Text;
    XLSheet.Cells [3, 1].Formula := 'Incluye Información:'+ vlEntidad ;
    XLSheet.Cells [3, 9].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];

    XLSheet.Cells [4,  4] .Formula := 'Producto 1';
    XLSheet.Cells [4,  14].Formula := 'Producto 2';
    XLSheet.Cells [4,  24].Formula := 'Producto 3';
    XLSheet.Cells [4,  34].Formula := 'Producto 4';
    XLSheet.Cells [4,  44].Formula := 'Producto 5';
    XLSheet.Cells [4,  54].Formula := 'Producto 6';
    XLSheet.Cells [4,  64].Formula := 'Producto 7';
    XLSheet.Cells [4,  74].Formula := 'Producto 8';
    XLSheet.Cells [4,  84].Formula := 'Producto 9';


    XLSheet.Range ['D4:M4']  .Merge;
    XLSheet.Range ['N4:W4']  .Merge;
    XLSheet.Range ['X4:AG4'] .Merge;
    XLSheet.Range ['AH4:AQ4'].Merge;
    XLSheet.Range ['AR4:BA4'].Merge;
    XLSheet.Range ['BB4:BK4'].Merge;
    XLSheet.Range ['BL4:BU4'].Merge;
    XLSheet.Range ['BV4:CE4'].Merge;
    XLSheet.Range ['CF4:CO4'].Merge;

    XLSheet.Range ['A4:CO5'].HorizontalAlignment := xlHAlignCenter;

    //Agrega los nombres de las Columnas
    XLSheet.Cells [ 5, 1] .Formula  := 'Tipo Entidad';
    XLSheet.Cells [ 5, 2] .Formula  := 'Descripción Población ';
    XLSheet.Cells [ 5, 3] .Formula  := 'Pct_PI';
    XLSheet.Cells [ 5, 4] .Formula  := 'Capital Básico %';
    XLSheet.Cells [ 5, 5] .Formula  := 'Importe Capital Basico $';
    XLSheet.Cells [ 5, 6] .Formula  := 'Saldo %';
    XLSheet.Cells [ 5, 7] .Formula  := 'Importe Saldo $';
    XLSheet.Cells [ 5, 8] .Formula  := 'Diferencia %';
    XLSheet.Cells [ 5, 9] .Formula  := 'Importe Diferencia $';
    XLSheet.Cells [ 5, 10].Formula  := 'Excedente %';
    XLSheet.Cells [ 5, 11].Formula  := 'Importe Excedente $';
    XLSheet.Cells [ 5, 12].Formula  := 'Remanente %';
    XLSheet.Cells [ 5, 13].Formula  := 'Importe Remanente $';
    //Producto 2
    XLSheet.Cells [ 5, 14] .Formula  := 'Capital Básico %';
    XLSheet.Cells [ 5, 15] .Formula  := 'Importe Capital Basico $';
    XLSheet.Cells [ 5, 16] .Formula  := 'Saldo %';
    XLSheet.Cells [ 5, 17] .Formula  := 'Importe Saldo $';
    XLSheet.Cells [ 5, 18] .Formula  := 'Diferencia %';
    XLSheet.Cells [ 5, 19] .Formula  := 'Importe Diferencia $';
    XLSheet.Cells [ 5, 20] .Formula  := 'Excedente %';
    XLSheet.Cells [ 5, 21] .Formula  := 'Importe Excedente $';
    XLSheet.Cells [ 5, 22] .Formula  := 'Remanente %';
    XLSheet.Cells [ 5, 23] .Formula  := 'Importe Remanente $';
    //Producto 3
    XLSheet.Cells [ 5, 24] .Formula  := 'Capital Básico %';
    XLSheet.Cells [ 5, 25] .Formula  := 'Importe Capital Basico $';
    XLSheet.Cells [ 5, 26] .Formula  := 'Saldo %';
    XLSheet.Cells [ 5, 27] .Formula  := 'Importe Saldo $';
    XLSheet.Cells [ 5, 28] .Formula  := 'Diferencia %';
    XLSheet.Cells [ 5, 29] .Formula  := 'Importe Diferencia $';
    XLSheet.Cells [ 5, 30] .Formula  := 'Excedente %';
    XLSheet.Cells [ 5, 31] .Formula  := 'Importe Excedente $';
    XLSheet.Cells [ 5, 32] .Formula  := 'Remanente %';
    XLSheet.Cells [ 5, 33] .Formula  := 'Importe Remanente $';
    //Producto 4
    XLSheet.Cells [ 5, 34] .Formula  := 'Capital Básico %';
    XLSheet.Cells [ 5, 35] .Formula  := 'Importe Capital Basico $';
    XLSheet.Cells [ 5, 36] .Formula  := 'Saldo %';
    XLSheet.Cells [ 5, 37] .Formula  := 'Importe Saldo $';
    XLSheet.Cells [ 5, 38] .Formula  := 'Diferencia %';
    XLSheet.Cells [ 5, 39] .Formula  := 'Importe Diferencia $';
    XLSheet.Cells [ 5, 40] .Formula  := 'Excedente %';
    XLSheet.Cells [ 5, 41] .Formula  := 'Importe Excedente $';
    XLSheet.Cells [ 5, 42] .Formula  := 'Remanente %';
    XLSheet.Cells [ 5, 43] .Formula  := 'Importe Remanente $';
    //Producto 5
    XLSheet.Cells [ 5, 44] .Formula  := 'Capital Básico %';
    XLSheet.Cells [ 5, 45] .Formula  := 'Importe Capital Basico $';
    XLSheet.Cells [ 5, 46] .Formula  := 'Saldo %';
    XLSheet.Cells [ 5, 47] .Formula  := 'Importe Saldo $';
    XLSheet.Cells [ 5, 48] .Formula  := 'Diferencia %';
    XLSheet.Cells [ 5, 49] .Formula  := 'Importe Diferencia $';
    XLSheet.Cells [ 5, 50] .Formula  := 'Excedente %';
    XLSheet.Cells [ 5, 51] .Formula  := 'Importe Excedente $';
    XLSheet.Cells [ 5, 52] .Formula  := 'Remanente %';
    XLSheet.Cells [ 5, 53] .Formula  := 'Importe Remanente $';
    //Producto 6
    XLSheet.Cells [ 5, 54] .Formula  := 'Capital Básico %';
    XLSheet.Cells [ 5, 55] .Formula  := 'Importe Capital Basico $';
    XLSheet.Cells [ 5, 56] .Formula  := 'Saldo %';
    XLSheet.Cells [ 5, 57] .Formula  := 'Importe Saldo $';
    XLSheet.Cells [ 5, 58] .Formula  := 'Diferencia %';
    XLSheet.Cells [ 5, 59] .Formula  := 'Importe Diferencia $';
    XLSheet.Cells [ 5, 60] .Formula  := 'Excedente %';
    XLSheet.Cells [ 5, 61] .Formula  := 'Importe Excedente $';
    XLSheet.Cells [ 5, 62] .Formula  := 'Remanente %';
    XLSheet.Cells [ 5, 63] .Formula  := 'Importe Remanente $';
    //Producto 7
    XLSheet.Cells [ 5, 64] .Formula  := 'Capital Básico %';
    XLSheet.Cells [ 5, 65] .Formula  := 'Importe Capital Basico $';
    XLSheet.Cells [ 5, 66] .Formula  := 'Saldo %';
    XLSheet.Cells [ 5, 67] .Formula  := 'Importe Saldo $';
    XLSheet.Cells [ 5, 68] .Formula  := 'Diferencia %';
    XLSheet.Cells [ 5, 69] .Formula  := 'Importe Diferencia $';
    XLSheet.Cells [ 5, 70] .Formula  := 'Excedente %';
    XLSheet.Cells [ 5, 71] .Formula  := 'Importe Excedente $';
    XLSheet.Cells [ 5, 72] .Formula  := 'Remanente %';
    XLSheet.Cells [ 5, 73] .Formula  := 'Importe Remanente $';
    //Producto 8
    XLSheet.Cells [ 5, 74] .Formula  := 'Capital Básico %';
    XLSheet.Cells [ 5, 75] .Formula  := 'Importe Capital Basico $';
    XLSheet.Cells [ 5, 76] .Formula  := 'Saldo %';
    XLSheet.Cells [ 5, 77] .Formula  := 'Importe Saldo $';
    XLSheet.Cells [ 5, 78] .Formula  := 'Diferencia %';
    XLSheet.Cells [ 5, 79] .Formula  := 'Importe Diferencia $';
    XLSheet.Cells [ 5, 80] .Formula  := 'Excedente %';
    XLSheet.Cells [ 5, 81] .Formula  := 'Importe Excedente $';
    XLSheet.Cells [ 5, 82] .Formula  := 'Remanente %';
    XLSheet.Cells [ 5, 83] .Formula  := 'Importe Remanente $';
    //Producto 9
    XLSheet.Cells [ 5, 84] .Formula  := 'Capital Básico %';
    XLSheet.Cells [ 5, 85] .Formula  := 'Importe Capital Basico $';
    XLSheet.Cells [ 5, 86] .Formula  := 'Saldo %';
    XLSheet.Cells [ 5, 87] .Formula  := 'Importe Saldo $';
    XLSheet.Cells [ 5, 88] .Formula  := 'Diferencia %';
    XLSheet.Cells [ 5, 89] .Formula  := 'Importe Diferencia $';
    XLSheet.Cells [ 5, 90] .Formula  := 'Excedente %';
    XLSheet.Cells [ 5, 91] .Formula  := 'Importe Excedente $';
    XLSheet.Cells [ 5, 92] .Formula  := 'Remanente %';
    XLSheet.Cells [ 5, 93] .Formula  := 'Importe Remanente $';

    qDatos.First;
    r     := 6;
    Hijos := False;
    while Not qDatos.Eof Do
    begin
      if Hijos and (qDatos.FieldByName ('Tipo_Entidad').AsString = 'ESTATAL') then
        Inc (r);

      if (qDatos.FieldByName ('Tipo_Entidad').AsString = 'ESTATAL') then
        Hijos := qDatos.FieldByName ('Hijos').AsInteger > 0;

      XLSheet.Cells [r, 1].Formula  :=        qDatos.FieldByName ('Tipo_Entidad'         ).AsString;
      XLSheet.Cells [r, 2].Formula  :=        qDatos.FieldByName ('Desc_Poblacion'       ).AsString;
      XLSheet.Cells [r, 3].Formula  :=        qDatos.FieldByName ('Pct_Pi_Cal'           ).AsString;
      XLSheet.Cells [r, 4].Formula  :=        qDatos.FieldByName ('P1_Pct_Capital_Basico').AsString;
      XLSheet.Cells [r, 5].Formula  := Money (qDatos.FieldByName ('P1_Imp_Capital_Basico').AsFloat);
      XLSheet.Cells [r, 6].Formula  :=        qDatos.FieldByName ('P1_Sdo_Pct'           ).AsString;
      XLSheet.Cells [r, 7].Formula  := Money (qDatos.FieldByName ('P1_Sdo'               ).AsFloat);
      XLSheet.Cells [r, 8].Formula  :=        qDatos.FieldByName ('P1_Dif_Pct'           ).AsString;
      XLSheet.Cells [r, 9].Formula  := Money (qDatos.FieldByName ('P1_Diferencia'        ).AsFloat);
      XLSheet.Cells [r, 10].Formula :=        qDatos.FieldByName ('P1_Pct_Excedente'     ).AsString;
      XLSheet.Cells [r, 11].Formula := Money (qDatos.FieldByName ('P1_Imp_Excedente'     ).AsFloat);
      XLSheet.Cells [r, 12].Formula :=        qDatos.FieldByName ('P1_Pct_Remanente'     ).AsString;
      XLSheet.Cells [r, 13].Formula := Money (qDatos.FieldByName ('P1_Imp_Remanente'     ).AsFloat);
      // Info Producto 2
      XLSheet.Cells [r, 14].Formula :=        qDatos.FieldByName ('P2_Pct_Capital_Basico').AsString;
      XLSheet.Cells [r, 15].Formula := Money (qDatos.FieldByName ('P2_Imp_Capital_Basico').AsFloat);
      XLSheet.Cells [r, 16].Formula :=        qDatos.FieldByName ('P2_Sdo_Pct'           ).AsString;
      XLSheet.Cells [r, 17].Formula := Money (qDatos.FieldByName ('P2_Sdo'               ).AsFloat);
      XLSheet.Cells [r, 18].Formula :=        qDatos.FieldByName ('P2_Dif_Pct'           ).AsString;
      XLSheet.Cells [r, 19].Formula := Money (qDatos.FieldByName ('P2_Diferencia'        ).AsFloat);
      XLSheet.Cells [r, 20].Formula :=        qDatos.FieldByName ('P2_Pct_Excedente'     ).AsString;
      XLSheet.Cells [r, 21].Formula := Money (qDatos.FieldByName ('P2_Imp_Excedente'     ).AsFloat);
      XLSheet.Cells [r, 22].Formula :=        qDatos.FieldByName ('P2_Pct_Remanente'     ).AsString;
      XLSheet.Cells [r, 23].Formula := Money (qDatos.FieldByName ('P2_Imp_Remanente'     ).AsFloat);
      // Info Producto 3
      XLSheet.Cells [r, 24].Formula :=        qDatos.FieldByName ('P3_Pct_Capital_Basico').AsString;
      XLSheet.Cells [r, 25].Formula := Money (qDatos.FieldByName ('P3_Imp_Capital_Basico').AsFloat);
      XLSheet.Cells [r, 26].Formula :=        qDatos.FieldByName ('P3_Sdo_Pct'           ).AsString;
      XLSheet.Cells [r, 27].Formula := Money (qDatos.FieldByName ('P3_Sdo'               ).AsFloat);
      XLSheet.Cells [r, 28].Formula :=        qDatos.FieldByName ('P3_Dif_Pct'           ).AsString;
      XLSheet.Cells [r, 29].Formula := Money (qDatos.FieldByName ('P3_Diferencia'        ).AsFloat);
      XLSheet.Cells [r, 30].Formula :=        qDatos.FieldByName ('P3_Pct_Excedente'     ).AsString;
      XLSheet.Cells [r, 31].Formula := Money (qDatos.FieldByName ('P3_Imp_Excedente'     ).AsFloat);
      XLSheet.Cells [r, 32].Formula :=        qDatos.FieldByName ('P3_Pct_Remanente'     ).AsString;
      XLSheet.Cells [r, 33].Formula := Money (qDatos.FieldByName ('P3_Imp_Remanente'     ).AsFloat);
      // Info Producto 4
      XLSheet.Cells [r, 34].Formula :=        qDatos.FieldByName ('P4_Pct_Capital_Basico').AsString;
      XLSheet.Cells [r, 35].Formula := Money (qDatos.FieldByName ('P4_Imp_Capital_Basico').AsFloat);
      XLSheet.Cells [r, 36].Formula :=        qDatos.FieldByName ('P4_Sdo_Pct'           ).AsString;
      XLSheet.Cells [r, 37].Formula := Money (qDatos.FieldByName ('P4_Sdo'               ).AsFloat);
      XLSheet.Cells [r, 38].Formula :=        qDatos.FieldByName ('P4_Dif_Pct'           ).AsString;
      XLSheet.Cells [r, 39].Formula := Money (qDatos.FieldByName ('P4_Diferencia'        ).AsFloat);
      XLSheet.Cells [r, 40].Formula :=        qDatos.FieldByName ('P4_Pct_Excedente'     ).AsString;
      XLSheet.Cells [r, 41].Formula := Money (qDatos.FieldByName ('P4_Imp_Excedente'     ).AsFloat);
      XLSheet.Cells [r, 42].Formula :=        qDatos.FieldByName ('P4_Pct_Remanente'     ).AsString;
      XLSheet.Cells [r, 43].Formula := Money (qDatos.FieldByName ('P4_Imp_Remanente'     ).AsFloat);
      // Info Producto 5
      XLSheet.Cells [r, 44].Formula :=        qDatos.FieldByName ('P5_Pct_Capital_Basico').AsString;
      XLSheet.Cells [r, 45].Formula := Money (qDatos.FieldByName ('P5_Imp_Capital_Basico').AsFloat);
      XLSheet.Cells [r, 46].Formula :=        qDatos.FieldByName ('P5_Sdo_Pct'           ).AsString;
      XLSheet.Cells [r, 47].Formula := Money (qDatos.FieldByName ('P5_Sdo'               ).AsFloat);
      XLSheet.Cells [r, 48].Formula :=        qDatos.FieldByName ('P5_Dif_Pct'           ).AsString;
      XLSheet.Cells [r, 49].Formula := Money (qDatos.FieldByName ('P5_Diferencia'        ).AsFloat);
      XLSheet.Cells [r, 50].Formula :=        qDatos.FieldByName ('P5_Pct_Excedente'     ).AsString;
      XLSheet.Cells [r, 51].Formula := Money (qDatos.FieldByName ('P5_Imp_Excedente'     ).AsFloat);
      XLSheet.Cells [r, 52].Formula :=        qDatos.FieldByName ('P5_Pct_Remanente'     ).AsString;
      XLSheet.Cells [r, 53].Formula := Money (qDatos.FieldByName ('P5_Imp_Remanente'     ).AsFloat);
      // Info Producto 6
      XLSheet.Cells [r, 54].Formula :=        qDatos.FieldByName ('P6_Pct_Capital_Basico').AsString;
      XLSheet.Cells [r, 55].Formula := Money (qDatos.FieldByName ('P6_Imp_Capital_Basico').AsFloat);
      XLSheet.Cells [r, 56].Formula :=        qDatos.FieldByName ('P6_Sdo_Pct'           ).AsString;
      XLSheet.Cells [r, 57].Formula := Money (qDatos.FieldByName ('P6_Sdo'               ).AsFloat);
      XLSheet.Cells [r, 58].Formula :=        qDatos.FieldByName ('P6_Dif_Pct'           ).AsString;
      XLSheet.Cells [r, 59].Formula := Money (qDatos.FieldByName ('P6_Diferencia'        ).AsFloat);
      XLSheet.Cells [r, 60].Formula :=        qDatos.FieldByName ('P6_Pct_Excedente'     ).AsString;
      XLSheet.Cells [r, 61].Formula := Money (qDatos.FieldByName ('P6_Imp_Excedente'     ).AsFloat);
      XLSheet.Cells [r, 62].Formula :=        qDatos.FieldByName ('P6_Pct_Remanente'     ).AsString;
      XLSheet.Cells [r, 63].Formula := Money (qDatos.FieldByName ('P6_Imp_Remanente'     ).AsFloat);
      // Info Producto 7
      XLSheet.Cells [r, 64].Formula :=        qDatos.FieldByName ('P7_Pct_Capital_Basico').AsString;
      XLSheet.Cells [r, 65].Formula := Money (qDatos.FieldByName ('P7_Imp_Capital_Basico').AsFloat);
      XLSheet.Cells [r, 66].Formula :=        qDatos.FieldByName ('P7_Sdo_Pct'           ).AsString;
      XLSheet.Cells [r, 67].Formula := Money (qDatos.FieldByName ('P7_Sdo'               ).AsFloat);
      XLSheet.Cells [r, 68].Formula :=        qDatos.FieldByName ('P7_Dif_Pct'           ).AsString;
      XLSheet.Cells [r, 69].Formula := Money (qDatos.FieldByName ('P7_Diferencia'        ).AsFloat);
      XLSheet.Cells [r, 70].Formula :=        qDatos.FieldByName ('P7_Pct_Excedente'     ).AsString;
      XLSheet.Cells [r, 71].Formula := Money (qDatos.FieldByName ('P7_Imp_Excedente'     ).AsFloat);
      XLSheet.Cells [r, 72].Formula :=        qDatos.FieldByName ('P7_Pct_Remanente'     ).AsString;
      XLSheet.Cells [r, 73].Formula := Money (qDatos.FieldByName ('P7_Imp_Remanente'     ).AsFloat);
      // Info Producto 8
      XLSheet.Cells [r, 74].Formula :=        qDatos.FieldByName ('P8_Pct_Capital_Basico').AsString;
      XLSheet.Cells [r, 75].Formula := Money (qDatos.FieldByName ('P8_Imp_Capital_Basico').AsFloat);
      XLSheet.Cells [r, 76].Formula :=        qDatos.FieldByName ('P8_Sdo_Pct'           ).AsString;
      XLSheet.Cells [r, 77].Formula := Money (qDatos.FieldByName ('P8_Sdo'               ).AsFloat);
      XLSheet.Cells [r, 78].Formula :=        qDatos.FieldByName ('P8_Dif_Pct'           ).AsString;
      XLSheet.Cells [r, 79].Formula := Money (qDatos.FieldByName ('P8_Diferencia'        ).AsFloat);
      XLSheet.Cells [r, 80].Formula :=        qDatos.FieldByName ('P8_Pct_Excedente'     ).AsString;
      XLSheet.Cells [r, 81].Formula := Money (qDatos.FieldByName ('P8_Imp_Excedente'     ).AsFloat);
      XLSheet.Cells [r, 82].Formula :=        qDatos.FieldByName ('P8_Pct_Remanente'     ).AsString;
      XLSheet.Cells [r, 83].Formula := Money (qDatos.FieldByName ('P8_Imp_Remanente'     ).AsFloat);
      // Info Producto 9
      XLSheet.Cells [r, 84].Formula :=        qDatos.FieldByName ('P9_Pct_Capital_Basico').AsString;
      XLSheet.Cells [r, 85].Formula := Money (qDatos.FieldByName ('P9_Imp_Capital_Basico').AsFloat);
      XLSheet.Cells [r, 86].Formula :=        qDatos.FieldByName ('P9_Sdo_Pct'           ).AsString;
      XLSheet.Cells [r, 87].Formula := Money (qDatos.FieldByName ('P9_Sdo'               ).AsFloat);
      XLSheet.Cells [r, 88].Formula :=        qDatos.FieldByName ('P9_Dif_Pct'           ).AsString;
      XLSheet.Cells [r, 89].Formula := Money (qDatos.FieldByName ('P9_Diferencia'        ).AsFloat);
      XLSheet.Cells [r, 90].Formula :=        qDatos.FieldByName ('P9_Pct_Excedente'     ).AsString;
      XLSheet.Cells [r, 91].Formula := Money (qDatos.FieldByName ('P9_Imp_Excedente'     ).AsFloat);
      XLSheet.Cells [r, 92].Formula :=        qDatos.FieldByName ('P9_Pct_Remanente'     ).AsString;
      XLSheet.Cells [r, 93].Formula := Money (qDatos.FieldByName ('P9_Imp_Remanente'     ).AsFloat);

      XLSheet.Range [Format ('C%d:CO%d', [r, r])].HorizontalAlignment := xlHAlignCenter;
      XLSheet.Range [Format ('C%d:CO%d', [r, r])].NumberFormat        := '0.00';
      XLSheet.Range [Format ('C%d:CO%d', [r, r])].Style               := 'Currency';

      s := 'C,D,F,H,J,L,N,P,R,T,V,X,Z,AB,AD,AF,AH,AJ,AL,AN,AP,AR,AT,AV,AX,AZ,BB,BD,BF,BH,BJ,BL,BN,BP,BR,BT,BV,BX,BZ,CB,CD,CF,CH,CJ,CL,CN,';
      repeat
        p   := Pos (',', s);
        col := Copy (s, 1, p -1);
        Delete (s, 1, p);

        XLSheet.Range [Format ('%s%d:%s%d', [col, r, col, r])].Style               := 'Normal';
        XLSheet.Range [Format ('%s%d:%s%d', [col, r, col, r])].NumberFormat        := '0.00';
        XLSheet.Range [Format ('%s%d:%s%d', [col, r, col, r])].HorizontalAlignment := xlHAlignCenter;
      until (col = '') or (s = '');

      //Cambia el color de las celdas en caso de que se tenga un excedente para esa entidad
      if (qDatos.FieldByName ('P1_Diferencia').AsFloat < 0) or
         (qDatos.FieldByName ('P2_Diferencia').AsFloat < 0) or
         (qDatos.FieldByName ('P3_Diferencia').AsFloat < 0) or
         (qDatos.FieldByName ('P4_Diferencia').AsFloat < 0) or
         (qDatos.FieldByName ('P5_Diferencia').AsFloat < 0) or
         (qDatos.FieldByName ('P6_Diferencia').AsFloat < 0) or
         (qDatos.FieldByName ('P7_Diferencia').AsFloat < 0) or
         (qDatos.FieldByName ('P8_Diferencia').AsFloat < 0) or
         (qDatos.FieldByName ('P9_Diferencia').AsFloat < 0) then
      begin
        XlSheet.Range['A' + IntToStr(r) + ':CO' + IntToStr(r)].Select;
        XlApp.Selection.Interior.Pattern           := xlSolid;
        XlApp.Selection.Interior.PatternColorIndex := xlAutomatic;
        XlApp.Selection.Interior.ThemeColor        := xlThemeColorAccent6;
        XlApp.Selection.Interior.TintAndShade      := 0.799981688894314;
        XlApp.Selection.Interior.PatternTintAndShade := 0;
      end;

      if qDatos.FieldByName ('Hijos').AsInteger > 0 then
      begin
        XlSheet.Range['A' + IntToStr(r + 1) + ':A' + IntToStr (r + 1 + qDatos.FieldByName ('Hijos').AsInteger)].Select;
        XlApp.Selection.Rows.Group;
      end;

      Inc (r);
      qDatos.Next;
    end;


      //Rellena Columna Tipo Entidad
      Range                              := XLSheet.Range ['A4:M5'];
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.ThemeColor          := xlThemeColorAccent4;
      Range.Interior.TintAndShade        := 0.599993896298105;
      //Rellena Columna Descripción
      Range                              := XLSheet.Range ['B4:W5'];
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.ThemeColor          := xlThemeColorAccent2;
      Range.Interior.TintAndShade        := 0.599993896298105;
      //Rellena Columna Pct PI
      Range                              := XLSheet.Range ['C4:AG5'];
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.ThemeColor          := xlThemeColorAccent3;
      Range.Interior.TintAndShade        := 0.799981688894314;
      //Rellena Celdas Producto 1
      Range                              := XLSheet.Range ['D4:M5'];
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.ThemeColor          := xlThemeColorAccent1;
      Range.Interior.TintAndShade        := 0.799981688894314;
      //Rellena Celdas Producto 2
      Range                              := XLSheet.Range ['N4:W5'];
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.ThemeColor          := xlThemeColorLight2;
      Range.Interior.TintAndShade        := 0.799981688894314;
      //Rellena Celdas Producto 3
      Range                              := XLSheet.Range ['X4:AG5'];
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.ThemeColor          := xlThemeColorAccent6;
      Range.Interior.TintAndShade        := 0.799981688894314;
     //Rellena Celdas Producto 4
      Range                              := XLSheet.Range ['AH4:AQ5'];
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.ThemeColor          := xlThemeColorAccent6;
      Range.Interior.TintAndShade        := 0.599993896298105;
      //Rellena Celdas Producto 5
      Range                              := XLSheet.Range ['AR4:BA5'];
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.ThemeColor          := xlThemeColorAccent3;
      Range.Interior.TintAndShade        := 0.799981688894314;
      //Rellena Celdas Producto 6
      Range                              := XLSheet.Range ['BB4:BK5'];
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.ThemeColor          := xlThemeColorAccent3;
      Range.Interior.TintAndShade        := 0.599993896298105;
        //Rellena Celdas Producto 7
      Range                              := XLSheet.Range ['BL4:BU5'];
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.ThemeColor          := xlThemeColorAccent1;
      Range.Interior.TintAndShade        := 0.799981688894314;
      //Rellena Celdas Producto 8
      Range                              := XLSheet.Range ['BV4:CE5'];
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.ThemeColor          := xlThemeColorLight2;
      Range.Interior.TintAndShade        := 0.799981688894314;
      //Rellena Celdas Producto 9
      Range                              := XLSheet.Range ['CF4:CO5'];
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.ThemeColor          := xlThemeColorAccent6;
      Range.Interior.TintAndShade        := 0.799981688894314;

      XLSheet.UsedRange.Columns.AutoFit;

      XLSheet.Range ['D6'].Select;
      XLApp.ActiveWindow.FreezePanes := True;

      XlSheet.Outline.ShowLevels(1);
      XLSheet.Range ['A6'].Select;

    {Termina la generación de la tabla}

    {Inicia la generación de la gráfica}
    if (Opciones = 1) then
    begin
      XLApp.Workbooks [1].WorkSheets.Add (Null, XLApp.Workbooks [1].WorkSheets [1]);

      XLSheet                       := XLApp.Workbooks[1].WorkSheets[SheetNum];
      XLSheet.Name                  := 'Gráfica';
      XLSheet.Cells [1,  1].Formula := 'Límite de Capital Básico Vs Cartera Total';
      XLSheet.Cells [2,  1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
      XLSheet.Cells [2, 11].Formula := 'Índice de Capitalización: $' + edIndiceCapitalizacion.Text;
      if rgInfoDesplegar.ItemIndex = 1 then
        XLSheet.Cells [3, 11].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];

      XLSheet.Range ['A1:N1'].Merge;
      XLSheet.Range ['A2:D2'].Merge;
      XLSheet.Range ['E2:J2'].Merge;
      XLSheet.Range ['K2:N2'].Merge;
      XLSheet.Range ['K3:N3'].Merge;

      Range                      := XLSheet.Range ['A1'];
      Range.HorizontalAlignment  := xlHAlignCenter;
      Range.Font.Bold            := True;

      Range                      := XLSheet.Range ['E2'];
      Range.HorizontalAlignment  := xlHAlignCenter;

      Range                      := XLSheet.Range ['N2'];
      Range.HorizontalAlignment  := xlHAlignRight;

      Range                      := XLSheet.Range ['N3'];
      Range.HorizontalAlignment  := xlHAlignRight;

      Chart := XLSheet.ChartObjects.Add (10, 50, 820, 400);

      If cbMuestraInfoReal.Checked And cbMuestraCapBas.Checked then
         rgProyeccion.ItemIndex := 0;

      if rgProyeccion.ItemIndex = 0 then
         Chart.Chart.ChartType := xlColumnClustered
      else
         Chart.Chart.ChartType := xl3DColumnClustered;
      end;

      Chart.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[1].Range['B3:B' + IntToStr (qDatos.RecordCount + 2)], xlColumns);

      Chart.Chart.SeriesCollection [1].Delete;

      //Crea las series
      if cbMuestraCapBas.Checked =  True Then
        begin
          SerieP1CB         := Chart.Chart.SeriesCollection.NewSeries;
          SerieP2CB         := Chart.Chart.SeriesCollection.NewSeries;
          SerieP3CB         := Chart.Chart.SeriesCollection.NewSeries;
          SerieP4CB         := Chart.Chart.SeriesCollection.NewSeries;
          SerieP5CB         := Chart.Chart.SeriesCollection.NewSeries;
          SerieP6CB         := Chart.Chart.SeriesCollection.NewSeries;
          SerieP7CB         := Chart.Chart.SeriesCollection.NewSeries;
          SerieP8CB         := Chart.Chart.SeriesCollection.NewSeries;
          SerieP9CB         := Chart.Chart.SeriesCollection.NewSeries;
        end;

      if cbMuestraInfoReal.Checked =  True then
       begin
          SerieP1IR         := Chart.Chart.SeriesCollection.NewSeries;
          SerieP2IR         := Chart.Chart.SeriesCollection.NewSeries;
          SerieP3IR         := Chart.Chart.SeriesCollection.NewSeries;
          SerieP4IR         := Chart.Chart.SeriesCollection.NewSeries;
          SerieP5IR         := Chart.Chart.SeriesCollection.NewSeries;
          SerieP6IR         := Chart.Chart.SeriesCollection.NewSeries;
          SerieP7IR         := Chart.Chart.SeriesCollection.NewSeries;
          SerieP8IR         := Chart.Chart.SeriesCollection.NewSeries;
          SerieP9IR         := Chart.Chart.SeriesCollection.NewSeries;
       end;

      if rgInfoDesplegar.ItemIndex = 0 then
      begin
        if cbMuestraCapBas.Checked =  True Then
        begin
          //Series Capital Básico  Porcentajes
          SerieP1CB.Name    := '="Producto 1 Capital Básico"';
          SerieP1CB.Values  := '=Tabla!$D$6:$D$' + IntToStr (qDatos.RecordCount + 5);
          SerieP2CB.Name    := '="Producto 2 Capital Básico"';
          SerieP2CB.Values  := '=Tabla!$N$6:$N$' + IntToStr (qDatos.RecordCount + 5);
          SerieP3CB.Name    := '="Producto 3 Capital Básico"';
          SerieP3CB.Values  := '=Tabla!$X$6:$X$' + IntToStr (qDatos.RecordCount + 5);
          SerieP4CB.Name    := '="Producto 4 Capital Básico"';
          SerieP4CB.Values  := '=Tabla!$AH$6:$AH$' + IntToStr (qDatos.RecordCount + 5);
          SerieP5CB.Name    := '="Producto 5 Capital Básico"';
          SerieP5CB.Values  := '=Tabla!$AR$6:$AR$' + IntToStr (qDatos.RecordCount + 5);
          SerieP6CB.Name    := '="Producto 6 Capital Básico"';
          SerieP6CB.Values  := '=Tabla!$BB$6:$BB$' + IntToStr (qDatos.RecordCount + 5);
          SerieP7CB.Name    := '="Producto 7 Capital Básico"';
          SerieP7CB.Values  := '=Tabla!$BL$6:$BL$' + IntToStr (qDatos.RecordCount + 5);
          SerieP8CB.Name    := '="Producto 8 Capital Básico"';
          SerieP8CB.Values  := '=Tabla!$BV$6:$BV$' + IntToStr (qDatos.RecordCount + 5);
          SerieP9CB.Name    := '="Producto 9 Capital Básico"';
          SerieP9CB.Values  := '=Tabla!$CF$6:$CF$' + IntToStr (qDatos.RecordCount + 5);
        end;

        if cbMuestraInfoReal.Checked =  True then
        begin
          //Series Info Real  Porcentajes
          SerieP1IR.Name    := '="Producto 1 Info Total"';
          SerieP1IR.Values  := '=Tabla!$F$6:$F$' + IntToStr (qDatos.RecordCount + 5);
          SerieP2IR.Name    := '="Producto 2 Info Total"';
          SerieP2IR.Values  := '=Tabla!$P$6:$P$' + IntToStr (qDatos.RecordCount + 5);
          SerieP3IR.Name    := '="Producto 3 Info Total"';
          SerieP3IR.Values  := '=Tabla!$Z$6:$Z$' + IntToStr (qDatos.RecordCount + 5);
          SerieP4IR.Name    := '="Producto 4 Info Total"';
          SerieP4IR.Values  := '=Tabla!$AJ$6:$AJ$' + IntToStr (qDatos.RecordCount + 5);
          SerieP5IR.Name    := '="Producto 5 Info Total"';
          SerieP5IR.Values  := '=Tabla!$AT$6:$AT$' + IntToStr (qDatos.RecordCount + 5);
          SerieP6IR.Name    := '="Producto 6 Info Total"';
          SerieP6IR.Values  := '=Tabla!$BD$6:$BD$' + IntToStr (qDatos.RecordCount + 5);
          SerieP7IR.Name    := '="Producto 7 Info Total"';
          SerieP7IR.Values  := '=Tabla!$BN$6:$BN$' + IntToStr (qDatos.RecordCount + 5);
          SerieP8IR.Name    := '="Producto 8 Info Total"';
          SerieP8IR.Values  := '=Tabla!$BX$6:$BX$' + IntToStr (qDatos.RecordCount + 5);
          SerieP9IR.Name    := '="Producto 9 Info Total"';
          SerieP9IR.Values  := '=Tabla!$CH$6:$CH$' + IntToStr (qDatos.RecordCount + 5);
        end;

        If cbMuestraCapbas.Checked then
        begin
          SerieP1CB.XValues := '=Tabla!$B$6:$B$'   + IntToStr (qDatos.RecordCount + 5);
        end else
          SerieP1IR.XValues := '=Tabla!$B$6:$B$'   + IntToStr (qDatos.RecordCount + 5);

        if (rgProyeccion.ItemIndex = 0) and cbMuestraInfoReal.Checked then
        begin
           SerieP1IR.ChartType := xlLine;
           SerieP2IR.ChartType := xlLine;
           SerieP3IR.ChartType := xlLine;
           SerieP4IR.ChartType := xlLine;
           SerieP5IR.ChartType := xlLine;
           SerieP6IR.ChartType := xlLine;
           SerieP7IR.ChartType := xlLine;
           SerieP8IR.ChartType := xlLine;
           SerieP9IR.ChartType := xlLine;
        end;
      end else
      begin
        if cbMuestraCapBas.Checked =  True Then
        begin
          //Series Capital Básico  Importes
          SerieP1CB.Name    := '="Producto 1 Capital Básico"';
          SerieP1CB.Values  := '=Tabla!$E$6:$E$' + IntToStr (qDatos.RecordCount + 5);
          SerieP2CB.Name    := '="Producto 2 Capital Básico"';
          SerieP2CB.Values  := '=Tabla!$O$6:$O$' + IntToStr (qDatos.RecordCount + 5);
          SerieP3CB.Name    := '="Producto 3 Capital Básico"';
          SerieP3CB.Values  := '=Tabla!$Y$6:$Y$' + IntToStr (qDatos.RecordCount + 5);
          SerieP4CB.Name    := '="Producto 4 Capital Básico"';
          SerieP4CB.Values  := '=Tabla!$AI$6:$AI$' + IntToStr (qDatos.RecordCount + 5);
          SerieP5CB.Name    := '="Producto 5 Capital Básico"';
          SerieP5CB.Values  := '=Tabla!$AS$6:$AS$' + IntToStr (qDatos.RecordCount + 5);
          SerieP6CB.Name    := '="Producto 6 Capital Básico"';
          SerieP6CB.Values  := '=Tabla!$BC$6:$BC$' + IntToStr (qDatos.RecordCount + 5);
          SerieP7CB.Name    := '="Producto 7 Capital Básico"';
          SerieP7CB.Values  := '=Tabla!$BM$6:$BM$' + IntToStr (qDatos.RecordCount + 5);
          SerieP8CB.Name    := '="Producto 8 Capital Básico"';
          SerieP8CB.Values  := '=Tabla!$BW$6:$BW$' + IntToStr (qDatos.RecordCount + 5);
          SerieP9CB.Name    := '="Producto 9 Capital Básico"';
          SerieP9CB.Values  := '=Tabla!$CG$6:$CG$' + IntToStr (qDatos.RecordCount + 5);
        end;

        if cbMuestraInfoReal.Checked =  True then
        begin
          //Series Info Real   Importes
          SerieP1IR.Name    := '="Producto 1 Info Total"';
          SerieP1IR.Values  := '=Tabla!$G$6:$G$' + IntToStr (qDatos.RecordCount + 5);
          SerieP2IR.Name    := '="Producto 2 Info Total"';
          SerieP2IR.Values  := '=Tabla!$Q$6:$Q$' + IntToStr (qDatos.RecordCount + 5);
          SerieP3IR.Name    := '="Producto 3 Info Total"';
          SerieP3IR.Values  := '=Tabla!$AA$6:$AA$' + IntToStr (qDatos.RecordCount + 5);
          SerieP4IR.Name    := '="Producto 4 Info Total"';
          SerieP4IR.Values  := '=Tabla!$AK$6:$AK$' + IntToStr (qDatos.RecordCount + 5);
          SerieP5IR.Name    := '="Producto 5 Info Total"';
          SerieP5IR.Values  := '=Tabla!$AU$6:$AU$' + IntToStr (qDatos.RecordCount + 5);
          SerieP6IR.Name    := '="Producto 6 Info Total"';
          SerieP6IR.Values  := '=Tabla!$BE$6:$BE$' + IntToStr (qDatos.RecordCount + 5);
          SerieP7IR.Name    := '="Producto 7 Info Total"';
          SerieP7IR.Values  := '=Tabla!$BO$6:$BO$' + IntToStr (qDatos.RecordCount + 5);
          SerieP8IR.Name    := '="Producto 8 Info Total"';
          SerieP8IR.Values  := '=Tabla!$BY$6:$BY$' + IntToStr (qDatos.RecordCount + 5);
          SerieP9IR.Name    := '="Producto 9 Info Total"';
          SerieP9IR.Values  := '=Tabla!$CI$6:$CI$' + IntToStr (qDatos.RecordCount + 5);
        end;

        if cbMuestraCapbas.Checked then
        begin
         SerieP1CB.XValues := '=Tabla!$B$6:$B$'   + IntToStr (qDatos.RecordCount + 5);
        end else
          SerieP1IR.XValues := '=Tabla!$B$6:$B$'   + IntToStr (qDatos.RecordCount + 5);


        if (rgProyeccion.ItemIndex = 0) And cbMuestraInfoReal.Checked then
        begin
           SerieP1IR.ChartType := xlLine;
           SerieP2IR.ChartType := xlLine;
           SerieP3IR.ChartType := xlLine;
           SerieP4IR.ChartType := xlLine;
           SerieP5IR.ChartType := xlLine;
           SerieP6IR.ChartType := xlLine;
           SerieP7IR.ChartType := xlLine;
           SerieP8IR.ChartType := xlLine;
           SerieP9IR.ChartType := xlLine;
        end;
      end;

    XLApp.Workbooks[1].WorkSheets[1].Activate;

    if SoloTabla1.Checked Then
      XLApp.Workbooks[1].WorkSheets[2].Visible := False;

    if SoloGrafica1.Checked Then
      XLApp.Workbooks[1].WorkSheets[1].Visible := False;
  finally
    Cursor := crArrow;
    XLApp.Workbooks[1].SaveAs (FileName);
    XLApp.Quit;
    XLSheet  := Unassigned;
    Range    := Unassigned;
    XLApp    := Unassigned;
  end;
end;

procedure TWCrLCbVsCr.sbPopupExportarClick(Sender: TObject);
var
  sb: TSpeedButton;
begin
  if Sender is TSpeedButton then
  begin
    sb := TSpeedButton (Sender);
    sb.PopupMenu.Popup (sb.Left + ClientOrigin.x, sb.Top  + sb.Height + ClientOrigin.y);
  end;
end;

procedure TWCrLCbVsCr.cbMuestraInfoRealClick(Sender: TObject);
begin
  //Producto 1
  SerieLineP1PctExeRem.Active :=  (rgInfoDesplegar.ItemIndex = 0) and cbMuestraInfoReal.Checked;
  SerieLineP1ImpExeRem.Active :=  (rgInfoDesplegar.ItemIndex = 1) and cbMuestraInfoReal.Checked;
  //Producto 2
  SerieLineP2PctExeRem.Active :=  (rgInfoDesplegar.ItemIndex = 0) and cbMuestraInfoReal.Checked;
  SerieLineP2ImpExeRem.Active :=  (rgInfoDesplegar.ItemIndex = 1) and cbMuestraInfoReal.Checked;
  //Producto 3
  SerieLineP3PctExeRem.Active :=  (rgInfoDesplegar.ItemIndex = 0) and cbMuestraInfoReal.Checked;
  SerieLineP3ImpExeRem.Active :=  (rgInfoDesplegar.ItemIndex = 1) and cbMuestraInfoReal.Checked;
  //Producto 4
  SerieLineP4PctExeRem.Active :=  (rgInfoDesplegar.ItemIndex = 0) and cbMuestraInfoReal.Checked;
  SerieLineP4ImpExeRem.Active :=  (rgInfoDesplegar.ItemIndex = 1) and cbMuestraInfoReal.Checked;
  //Producto 5
  SerieLineP5PctExeRem.Active :=  (rgInfoDesplegar.ItemIndex = 0) and cbMuestraInfoReal.Checked;
  SerieLineP5ImpExeRem.Active :=  (rgInfoDesplegar.ItemIndex = 1) and cbMuestraInfoReal.Checked;
  //Producto 6
  SerieLineP6PctExeRem.Active :=  (rgInfoDesplegar.ItemIndex = 0) and cbMuestraInfoReal.Checked;
  SerieLineP6ImpExeRem.Active :=  (rgInfoDesplegar.ItemIndex = 1) and cbMuestraInfoReal.Checked;
  //Producto 7
  SerieLineP7PctExeRem.Active :=  (rgInfoDesplegar.ItemIndex = 0) and cbMuestraInfoReal.Checked;
  SerieLineP7ImpExeRem.Active :=  (rgInfoDesplegar.ItemIndex = 1) and cbMuestraInfoReal.Checked;
  //Producto 8
  SerieLineP8PctExeRem.Active :=  (rgInfoDesplegar.ItemIndex = 0) and cbMuestraInfoReal.Checked;
  SerieLineP8ImpExeRem.Active :=  (rgInfoDesplegar.ItemIndex = 1) and cbMuestraInfoReal.Checked;
  //Producto 9
  SerieLineP9PctExeRem.Active :=  (rgInfoDesplegar.ItemIndex = 0) and cbMuestraInfoReal.Checked;
  SerieLineP9ImpExeRem.Active :=  (rgInfoDesplegar.ItemIndex = 1) and cbMuestraInfoReal.Checked;
end;

procedure TWCrLCbVsCr.cbMuestraCapBasClick(Sender: TObject);
begin
  //Información Capital Básico
  //Producto 1
  SerieBarP1PctCapBas.Active  :=  (rgInfoDesplegar.ItemIndex = 0) and cbMuestraCapBas.Checked;
  SerieBarP1ImpCapBas.Active  :=  (rgInfoDesplegar.ItemIndex = 1) and cbMuestraCapBas.Checked;
  //Producto 2
  SerieBarP2PctCapBas.Active  :=  (rgInfoDesplegar.ItemIndex = 0) and cbMuestraCapBas.Checked;
  SerieBarP2ImpCapBas.Active  :=  (rgInfoDesplegar.ItemIndex = 1) and cbMuestraCapBas.Checked;
  //Producto 3
  SerieBarP3PctCapBas.Active  :=  (rgInfoDesplegar.ItemIndex = 0) and cbMuestraCapBas.Checked;
  SerieBarP3ImpCapBas.Active  :=  (rgInfoDesplegar.ItemIndex = 1) and cbMuestraCapBas.Checked;
  //Producto 4
  SerieBarP4PctCapBas.Active  :=  (rgInfoDesplegar.ItemIndex = 0) and cbMuestraCapBas.Checked;
  SerieBarP4ImpCapBas.Active  :=  (rgInfoDesplegar.ItemIndex = 1) and cbMuestraCapBas.Checked;
  //Producto 5
  SerieBarP5PctCapBas.Active  :=  (rgInfoDesplegar.ItemIndex = 0) and cbMuestraCapBas.Checked;
  SerieBarP5ImpCapBas.Active  :=  (rgInfoDesplegar.ItemIndex = 1) and cbMuestraCapBas.Checked;
  //Producto 6
  SerieBarP6PctCapBas.Active  :=  (rgInfoDesplegar.ItemIndex = 0) and cbMuestraCapBas.Checked;
  SerieBarP6ImpCapBas.Active  :=  (rgInfoDesplegar.ItemIndex = 1) and cbMuestraCapBas.Checked;
  //Producto 7
  SerieBarP7PctCapBas.Active  :=  (rgInfoDesplegar.ItemIndex = 0) and cbMuestraCapBas.Checked;
  SerieBarP7ImpCapBas.Active  :=  (rgInfoDesplegar.ItemIndex = 1) and cbMuestraCapBas.Checked;
  //Producto 8
  SerieBarP8PctCapBas.Active  :=  (rgInfoDesplegar.ItemIndex = 0) and cbMuestraCapBas.Checked;
  SerieBarP8ImpCapBas.Active  :=  (rgInfoDesplegar.ItemIndex = 1) and cbMuestraCapBas.Checked;
  //Producto 9
  SerieBarP9PctCapBas.Active  :=  (rgInfoDesplegar.ItemIndex = 0) and cbMuestraCapBas.Checked;
  SerieBarP9ImpCapBas.Active  :=  (rgInfoDesplegar.ItemIndex = 1) and cbMuestraCapBas.Checked;
end;

procedure TWCrLCbVsCr.PopupMenuGraficaTabla(Sender: TObject);
begin
 (Sender as TMenuItem).Checked := True;
 (Sender as TMenuItem).GetParentMenu.Tag := (Sender as TMenuItem).Tag;
end;

procedure TWCrLCbVsCr.VSTAfterItemPaint(Sender: TBaseVirtualTree;
  Canvas: TCanvas; Node: PVirtualNode; ItemRect: TRect);
var
  Data: ^TTreeData;
  r: String;
  OrigPen: TPen;
  OrigBrush: TBrush;

  i, ColAlign: integer;

  procedure DrawColumn (Col, Align: integer);
  var
    ColRect: TRect;
    s: string;
  begin
    DecimalSeparator  := '.';
    ThousandSeparator := ',';
    Data   := Vst.GetNodeData(Node);

    case Col of
      0:  r := Data^.Tipo_Entidad;
      1:  r := Data^.Desc_Poblacion;
      2:  r := FormatFloat ('#,##0.00', Data^.Pct_Pi_Cal);
      3:  r := FormatFloat ('#,##0.00', Data^.P1_Pct_Capital_Basico);
      4:  r := FormatFloat ('#,##0.00', Data^.P1_Imp_Capital_Basico);
      5:  r := FormatFloat ('#,##0.00', Data^.P1_Sdo_Pct);
      6:  r := FormatFloat ('#,##0.00', Data^.P1_Sdo);
      7:  r := FormatFloat ('#,##0.00', Data^.P1_Dif_Pct);
      8:  r := FormatFloat ('#,##0.00', Data^.P1_Diferencia);
      9:  r := FormatFloat ('#,##0.00', Data^.P1_Pct_Excedente);
      10: r := FormatFloat ('#,##0.00', Data^.P1_Imp_Excedente);
      11: r := FormatFloat ('#,##0.00', Data^.P1_Pct_Remanente);
      12: r := FormatFloat ('#,##0.00', Data^.P1_Imp_Remanente);
      13: r := FormatFloat ('#,##0.00', Data^.P2_Pct_Capital_Basico);
      14: r := FormatFloat ('#,##0.00', Data^.P2_Imp_Capital_Basico);
      15: r := FormatFloat ('#,##0.00', Data^.P2_Sdo_Pct);
      16: r := FormatFloat ('#,##0.00', Data^.P2_Sdo);
      17: r := FormatFloat ('#,##0.00', Data^.P2_Dif_Pct);
      18: r := FormatFloat ('#,##0.00', Data^.P2_Diferencia);
      19: r := FormatFloat ('#,##0.00', Data^.P2_Pct_Excedente);
      20: r := FormatFloat ('#,##0.00', Data^.P2_Imp_Excedente);
      21: r := FormatFloat ('#,##0.00', Data^.P2_Pct_Remanente);
      22: r := FormatFloat ('#,##0.00', Data^.P2_Imp_Remanente);
      23: r := FormatFloat ('#,##0.00', Data^.P3_Pct_Capital_Basico);
      24: r := FormatFloat ('#,##0.00', Data^.P3_Imp_Capital_Basico);
      25: r := FormatFloat ('#,##0.00', Data^.P3_Sdo_Pct);
      26: r := FormatFloat ('#,##0.00', Data^.P3_Sdo);
      27: r := FormatFloat ('#,##0.00', Data^.P3_Dif_Pct);
      28: r := FormatFloat ('#,##0.00', Data^.P3_Diferencia);
      29: r := FormatFloat ('#,##0.00', Data^.P3_Pct_Excedente);
      30: r := FormatFloat ('#,##0.00', Data^.P3_Imp_Excedente);
      31: r := FormatFloat ('#,##0.00', Data^.P3_Pct_Remanente);
      32: r := FormatFloat ('#,##0.00', Data^.P3_Imp_Remanente);
      33: r := FormatFloat ('#,##0.00', Data^.P4_Pct_Capital_Basico);
      34: r := FormatFloat ('#,##0.00', Data^.P4_Imp_Capital_Basico);
      35: r := FormatFloat ('#,##0.00', Data^.P4_Sdo_Pct);
      36: r := FormatFloat ('#,##0.00', Data^.P4_Sdo);
      37: r := FormatFloat ('#,##0.00', Data^.P4_Dif_Pct);
      38: r := FormatFloat ('#,##0.00', Data^.P4_Diferencia);
      39: r := FormatFloat ('#,##0.00', Data^.P4_Pct_Excedente);
      40: r := FormatFloat ('#,##0.00', Data^.P4_Imp_Excedente);
      41: r := FormatFloat ('#,##0.00', Data^.P4_Pct_Remanente);
      42: r := FormatFloat ('#,##0.00', Data^.P4_Imp_Remanente);
      43: r := FormatFloat ('#,##0.00', Data^.P5_Pct_Capital_Basico);
      44: r := FormatFloat ('#,##0.00', Data^.P5_Imp_Capital_Basico);
      45: r := FormatFloat ('#,##0.00', Data^.P5_Sdo_Pct);
      46: r := FormatFloat ('#,##0.00', Data^.P5_Sdo);
      47: r := FormatFloat ('#,##0.00', Data^.P5_Dif_Pct);
      48: r := FormatFloat ('#,##0.00', Data^.P5_Diferencia);
      49: r := FormatFloat ('#,##0.00', Data^.P5_Pct_Excedente);
      50: r := FormatFloat ('#,##0.00', Data^.P5_Imp_Excedente);
      51: r := FormatFloat ('#,##0.00', Data^.P5_Pct_Remanente);
      52: r := FormatFloat ('#,##0.00', Data^.P5_Imp_Remanente);
      53: r := FormatFloat ('#,##0.00', Data^.P6_Pct_Capital_Basico);
      54: r := FormatFloat ('#,##0.00', Data^.P6_Imp_Capital_Basico);
      55: r := FormatFloat ('#,##0.00', Data^.P6_Sdo_Pct);
      56: r := FormatFloat ('#,##0.00', Data^.P6_Sdo);
      57: r := FormatFloat ('#,##0.00', Data^.P6_Dif_Pct);
      58: r := FormatFloat ('#,##0.00', Data^.P6_Diferencia);
      59: r := FormatFloat ('#,##0.00', Data^.P6_Pct_Excedente);
      60: r := FormatFloat ('#,##0.00', Data^.P6_Imp_Excedente);
      61: r := FormatFloat ('#,##0.00', Data^.P6_Pct_Remanente);
      62: r := FormatFloat ('#,##0.00', Data^.P6_Imp_Remanente);
      63: r := FormatFloat ('#,##0.00', Data^.P7_Pct_Capital_Basico);
      64: r := FormatFloat ('#,##0.00', Data^.P7_Imp_Capital_Basico);
      65: r := FormatFloat ('#,##0.00', Data^.P7_Sdo_Pct);
      66: r := FormatFloat ('#,##0.00', Data^.P7_Sdo);
      67: r := FormatFloat ('#,##0.00', Data^.P7_Dif_Pct);
      68: r := FormatFloat ('#,##0.00', Data^.P7_Diferencia);
      69: r := FormatFloat ('#,##0.00', Data^.P7_Pct_Excedente);
      70: r := FormatFloat ('#,##0.00', Data^.P7_Imp_Excedente);
      71: r := FormatFloat ('#,##0.00', Data^.P7_Pct_Remanente);
      72: r := FormatFloat ('#,##0.00', Data^.P7_Imp_Remanente);
      73: r := FormatFloat ('#,##0.00', Data^.P8_Pct_Capital_Basico);
      74: r := FormatFloat ('#,##0.00', Data^.P8_Imp_Capital_Basico);
      75: r := FormatFloat ('#,##0.00', Data^.P8_Sdo_Pct);
      76: r := FormatFloat ('#,##0.00', Data^.P8_Sdo);
      77: r := FormatFloat ('#,##0.00', Data^.P8_Dif_Pct);
      78: r := FormatFloat ('#,##0.00', Data^.P8_Diferencia);
      79: r := FormatFloat ('#,##0.00', Data^.P8_Pct_Excedente);
      80: r := FormatFloat ('#,##0.00', Data^.P8_Imp_Excedente);
      81: r := FormatFloat ('#,##0.00', Data^.P8_Pct_Remanente);
      82: r := FormatFloat ('#,##0.00', Data^.P8_Imp_Remanente);
      83: r := FormatFloat ('#,##0.00', Data^.P9_Pct_Capital_Basico);
      84: r := FormatFloat ('#,##0.00', Data^.P9_Imp_Capital_Basico);
      85: r := FormatFloat ('#,##0.00', Data^.P9_Sdo_Pct);
      86: r := FormatFloat ('#,##0.00', Data^.P9_Sdo);
      87: r := FormatFloat ('#,##0.00', Data^.P9_Dif_Pct);
      88: r := FormatFloat ('#,##0.00', Data^.P9_Diferencia);
      89: r := FormatFloat ('#,##0.00', Data^.P9_Pct_Excedente);
      90: r := FormatFloat ('#,##0.00', Data^.P9_Imp_Excedente);
      91: r := FormatFloat ('#,##0.00', Data^.P9_Pct_Remanente);
      92: r := FormatFloat ('#,##0.00', Data^.P9_Imp_Remanente);
    end;

    s := r ;

    //Determina el área de la celda
    ColRect := Rect (Vst.Header.Columns.Items [Col].Left,
                     ItemRect.Top,
                     Vst.Header.Columns.Items [Col].Right,
                     ItemRect.Bottom);

    //Determina y dibuja el color del fondo
    if (Data^.P1_Diferencia  < 0) or
       (Data^.P2_Diferencia  < 0) or
       (Data^.P3_Diferencia  < 0) or
       (Data^.P4_Diferencia  < 0) or
       (Data^.P5_Diferencia  < 0) or
       (Data^.P6_Diferencia  < 0) or
       (Data^.P7_Diferencia  < 0) or
       (Data^.P8_Diferencia  < 0) or
       (Data^.P9_Diferencia  < 0) then
       Canvas.Brush.Color := FondoExcedente
    else if (vsSelected in Node.States) then
      Canvas.Brush.Color := Canvas.Pixels [Vst.Header.Columns.Items [0].Left, ItemRect.Top] //Toma el pixel de la esquina superior izquiera de la primer columna
    else
      Canvas.Brush.Color := Vst.Color;

    Canvas.Rectangle (ColRect.Left, ColRect.Top, ColRect.Right, ColRect.Bottom);
    //Determina el área del texto dentro de la celda
    ColRect := Rect (Vst.Header.Columns.Items [Col].Left + Vst.Margin,
                     ItemRect.Top + 2,
                     Vst.Header.Columns.Items [Col].Right - Vst.Margin,
                     ItemRect.Bottom - Vst.Margin);

    //Pinta el texto en cuestión
    case Align of
      0: Canvas.TextRect (ColRect, ColRect.Left, ColRect.Top, s);
      1: Canvas.TextRect (ColRect, ColRect.Right - ((Canvas.TextWidth (s) + (ColRect.Right - ColRect.Left)) div 2), ColRect.Top, s);
      2: Canvas.TextRect (ColRect, ColRect.Right - Canvas.TextWidth (s), ColRect.Top, s);
    end;
  end;
begin
  //Obtiene los datos del nodo
  Data   := Vst.GetNodeData(Node);
  //Respalda la información original del canvas de Pen y Brush
  OrigPen   := TPen.Create;
  OrigBrush := TBrush.Create;
  OrigPen.Assign (Canvas.Pen);
  OrigBrush.Assign (Canvas.Brush);

  try
    //Establece que no va a dibujar contornos en los rectángulos
    Canvas.Pen.Style := psClear;

    //Dibuja todas las columnas como texto con su respectiva alineación
    for i := 1 to Vst.Header.Columns.Count - 1 do
    begin
      //Determina la alineación de las columnas, por default izquierda (0)
      ColAlign := 0;
      if      i in [2,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,41,43,45,47,49,51,53,55,
                    57,59,61,63,65,67,69,71,73,75,77,79,81,83,85,87,89,91] then
        ColAlign := 1   //Centradas
      else if i in [4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,
                    54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92]   then
        ColAlign := 2;  //Alineación derecha

      //Dibuja la columna
      DrawColumn (i, ColAlign);
    end;
  finally
    //Restaura los valores originales de Pen y Brush
    Canvas.Pen.Assign (OrigPen);
    Canvas.Brush.Assign (OrigBrush);
  end;
end;

procedure TWCrLCbVsCr.btBuscaClick(Sender: TObject);
begin
  CargaInfo;
end;

procedure TWCrLCbVsCr.ExportarXLSDetalles (FileName: string);
var
  XLApp, XLSheet: Variant;
  Range, Chart, Serie: Variant;
  Row, RowIni, CurrTipo, XFin, YIni: integer;
  factor: Double;
begin


  factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: factor := 1000000;
    1: factor := 1000;
    2: factor := 1;
  end;

  QDetalles.Close;
  QDetalles.DatabaseName := Objeto.Apli.DataBaseName;
  QDetalles.SessionName  := Objeto.Apli.SessionName;
  QDetalles.ParamByName ('peFecha').AsDateTime      := Trunc (dpFecha.Date - 1);
  QDetalles.ParamByName ('peFactor').AsFloat        := factor;
  QDetalles.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QDetalles.ParamByName ('peCartas_Cred').AsString  := BoolToStr (cbCartasCredito.Checked);
  QDetalles.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
  QDetalles.Open;

  QLeyendaEntidades.Close;
  QLeyendaEntidades.DatabaseName                            := Objeto.Apli.DataBaseName;
  QLeyendaEntidades.SessionName                             := Objeto.Apli.SessionName;
  QLeyendaEntidades.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QLeyendaEntidades.Open;

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
    XLSheet.Range ['A1:AL1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [2, 1].Formula := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['A2:AL2'].Merge;
    XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Cells [3, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [3, 2].Formula := 'Información expresada en ' + LowerCase (rgFactorMoneda.Items [rgFactorMoneda.ItemIndex]);
    XLSheet.Range ['B3:AL3'].Merge;
    XLSheet.Range ['B3'].HorizontalAlignment := xlHAlignRight;

    if cbCartasCredito.Checked then
      XLSheet.Cells [4,  1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [4,  1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 20].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 20].Formula := 'No incluye intereses cobrados por anticipado';

    XLSheet.Range ['A4:S4'].Merge;
    XLSheet.Range ['T4:AL4'].Merge;

    {Encabezado de las columnas}
    XLSheet.Cells [5, 12].Formula := 'Producto 1';
    XLSheet.Range ['L5:N5'].Merge;
    XLSheet.Cells [5, 15].Formula := 'Producto 2';
    XLSheet.Range ['O5:Q5'].Merge;
    XLSheet.Cells [5, 18].Formula := 'Producto 3';
    XLSheet.Range ['R5:T5'].Merge;
    XLSheet.Cells [5, 21].Formula := 'Producto 4';
    XLSheet.Range ['U5:W5'].Merge;
    XLSheet.Cells [5, 24].Formula := 'Producto 5';
    XLSheet.Range ['X5:Z5'].Merge;
    XLSheet.Cells [5, 27].Formula := 'Producto 6';
    XLSheet.Range ['AA5:AC5'].Merge;
    XLSheet.Cells [5, 30].Formula := 'Producto 7';
    XLSheet.Range ['AD5:AF5'].Merge;
    XLSheet.Cells [5, 33].Formula := 'Producto 8';
    XLSheet.Range ['AG5:AI5'].Merge;
    XLSheet.Cells [5, 36].Formula := 'Producto 9';
    XLSheet.Range ['AJ5:AL5'].Merge;

    XLSheet.Cells [6,  1].Formula := 'Tipo Entidad';
    XLSheet.Range ['A5:A6'].Merge;
    XLSheet.Cells [6,  2].Formula := 'Clave Estado';
    XLSheet.Range ['B5:B6'].Merge;
    XLSheet.Cells [6,  3].Formula := 'Estado';
    XLSheet.Range ['C5:C6'].Merge;
    XLSheet.Cells [6,  4].Formula := 'Clave Ciudad';
    XLSheet.Range ['D5:D6'].Merge;
    XLSheet.Cells [6,  5].Formula := 'Ciudad';
    XLSheet.Range ['E5:E6'].Merge;
    XLSheet.Cells [6,  6].Formula := 'PI';
    XLSheet.Range ['F5:F6'].Merge;
    XLSheet.Cells [6,  7].Formula := 'ID Acreditado';
    XLSheet.Range ['G5:G6'].Merge;
    XLSheet.Cells [6,  8].Formula := 'Acreditado';
    XLSheet.Range ['H5:H6'].Merge;
    XLSheet.Cells [6,  9].Formula := 'ID Contrato';
    XLSheet.Range ['I5:I6'].Merge;
    XLSheet.Cells [6, 10].Formula := 'ID Crédito';
    XLSheet.Range ['J5:J6'].Merge;
    XLSheet.Cells [6, 11].Formula := 'Clave Moneda';
    XLSheet.Range ['K5:K6'].Merge;
    XLSheet.Cells [6, 12].Formula := 'Pct Capital Básico';
    XLSheet.Cells [6, 13].Formula := 'Imp Capital Básico';
    XLSheet.Cells [6, 14].Formula := 'Saldo Insoluto';
    XLSheet.Cells [6, 15].Formula := 'Pct Capital Básico';
    XLSheet.Cells [6, 16].Formula := 'Imp Capital Básico';
    XLSheet.Cells [6, 17].Formula := 'Saldo Insoluto';
    XLSheet.Cells [6, 18].Formula := 'Pct Capital Básico';
    XLSheet.Cells [6, 19].Formula := 'Imp Capital Básico';
    XLSheet.Cells [6, 20].Formula := 'Saldo Insoluto';
    XLSheet.Cells [6, 21].Formula := 'Pct Capital Básico';
    XLSheet.Cells [6, 22].Formula := 'Imp Capital Básico';
    XLSheet.Cells [6, 23].Formula := 'Saldo Insoluto';
    XLSheet.Cells [6, 24].Formula := 'Pct Capital Básico';
    XLSheet.Cells [6, 25].Formula := 'Imp Capital Básico';
    XLSheet.Cells [6, 26].Formula := 'Saldo Insoluto';
    XLSheet.Cells [6, 27].Formula := 'Pct Capital Básico';
    XLSheet.Cells [6, 28].Formula := 'Imp Capital Básico';
    XLSheet.Cells [6, 29].Formula := 'Saldo Insoluto';
    XLSheet.Cells [6, 30].Formula := 'Pct Capital Básico';
    XLSheet.Cells [6, 31].Formula := 'Imp Capital Básico';
    XLSheet.Cells [6, 32].Formula := 'Saldo Insoluto';
    XLSheet.Cells [6, 33].Formula := 'Pct Capital Básico';
    XLSheet.Cells [6, 34].Formula := 'Imp Capital Básico';
    XLSheet.Cells [6, 35].Formula := 'Saldo Insoluto';
    XLSheet.Cells [6, 36].Formula := 'Pct Capital Básico';
    XLSheet.Cells [6, 37].Formula := 'Imp Capital Básico';
    XLSheet.Cells [6, 38].Formula := 'Saldo Insoluto';

    XLSheet.Range ['A1:AL6'].Font.Bold := True;
    XLSheet.Range ['A4'].HorizontalAlignment := xlHAlignLeft;
    XLSheet.Range ['T4'].HorizontalAlignment := xlHAlignRight;

    Range                     := XLSheet.Range ['A5:AL6'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;
    Range.HorizontalAlignment := xlHAlignCenter;

    Row := 7;
    while not QDetalles.Eof do
    begin
      XLSheet.Cells [Row,  1].Value := QDetalles.FieldByName ('Tipo_Entidad').AsString;
      XLSheet.Cells [Row,  2].Value := QDetalles.FieldByName ('Cve_Estado').AsString;
      XLSheet.Cells [Row,  3].Value := QDetalles.FieldByName ('Desc_Estado').AsString;
      XLSheet.Cells [Row,  4].Value := QDetalles.FieldByName ('Cve_Ciudad').AsString;
      XLSheet.Cells [Row,  5].Value := QDetalles.FieldByName ('Desc_Ciudad').AsString;
      XLSheet.Cells [Row,  6].Value := QDetalles.FieldByName ('PCT_PI').AsFloat;
      XLSheet.Cells [Row,  7].Value := QDetalles.FieldByName ('ID_Acreditado').AsFloat;
      XLSheet.Cells [Row,  8].Value := QDetalles.FieldByName ('Nom_Acred_Reg').AsString;
      XLSheet.Cells [Row,  9].Value := QDetalles.FieldByName ('ID_Contrato').AsFloat;
      XLSheet.Cells [Row, 10].Value := QDetalles.FieldByName ('ID_Credito').AsFloat;
      XLSheet.Cells [Row, 11].Value := QDetalles.FieldByName ('Cve_Moneda').AsFloat;
      XLSheet.Cells [Row, 12].Value := QDetalles.FieldByName ('P1_Pct_Capital_Basico').AsFloat;
      XLSheet.Cells [Row, 13].Value := QDetalles.FieldByName ('P1_Imp_Capital_Basico').AsFloat;
      XLSheet.Cells [Row, 14].Value := QDetalles.FieldByName ('P1_Sdo_Insoluto').AsFloat;
      XLSheet.Cells [Row, 15].Value := QDetalles.FieldByName ('P2_Pct_Capital_Basico').AsFloat;
      XLSheet.Cells [Row, 16].Value := QDetalles.FieldByName ('P2_Imp_Capital_Basico').AsFloat;
      XLSheet.Cells [Row, 17].Value := QDetalles.FieldByName ('P2_Sdo_Insoluto').AsFloat;
      XLSheet.Cells [Row, 18].Value := QDetalles.FieldByName ('P3_Pct_Capital_Basico').AsFloat;
      XLSheet.Cells [Row, 19].Value := QDetalles.FieldByName ('P3_Imp_Capital_Basico').AsFloat;
      XLSheet.Cells [Row, 20].Value := QDetalles.FieldByName ('P3_Sdo_Insoluto').AsFloat;
      XLSheet.Cells [Row, 21].Value := QDetalles.FieldByName ('P4_Pct_Capital_Basico').AsFloat;
      XLSheet.Cells [Row, 22].Value := QDetalles.FieldByName ('P4_Imp_Capital_Basico').AsFloat;
      XLSheet.Cells [Row, 23].Value := QDetalles.FieldByName ('P4_Sdo_Insoluto').AsFloat;
      XLSheet.Cells [Row, 24].Value := QDetalles.FieldByName ('P5_Pct_Capital_Basico').AsFloat;
      XLSheet.Cells [Row, 25].Value := QDetalles.FieldByName ('P5_Imp_Capital_Basico').AsFloat;
      XLSheet.Cells [Row, 26].Value := QDetalles.FieldByName ('P5_Sdo_Insoluto').AsFloat;
      XLSheet.Cells [Row, 27].Value := QDetalles.FieldByName ('P6_Pct_Capital_Basico').AsFloat;
      XLSheet.Cells [Row, 28].Value := QDetalles.FieldByName ('P6_Imp_Capital_Basico').AsFloat;
      XLSheet.Cells [Row, 29].Value := QDetalles.FieldByName ('P6_Sdo_Insoluto').AsFloat;
      XLSheet.Cells [Row, 30].Value := QDetalles.FieldByName ('P7_Pct_Capital_Basico').AsFloat;
      XLSheet.Cells [Row, 31].Value := QDetalles.FieldByName ('P7_Imp_Capital_Basico').AsFloat;
      XLSheet.Cells [Row, 32].Value := QDetalles.FieldByName ('P7_Sdo_Insoluto').AsFloat;
      XLSheet.Cells [Row, 33].Value := QDetalles.FieldByName ('P8_Pct_Capital_Basico').AsFloat;
      XLSheet.Cells [Row, 34].Value := QDetalles.FieldByName ('P8_Imp_Capital_Basico').AsFloat;
      XLSheet.Cells [Row, 35].Value := QDetalles.FieldByName ('P8_Sdo_Insoluto').AsFloat;
      XLSheet.Cells [Row, 36].Value := QDetalles.FieldByName ('P9_Pct_Capital_Basico').AsFloat;
      XLSheet.Cells [Row, 37].Value := QDetalles.FieldByName ('P9_Imp_Capital_Basico').AsFloat;
      XLSheet.Cells [Row, 38].Value := QDetalles.FieldByName ('P9_Sdo_Insoluto').AsFloat;

      QDetalles.Next;
      Inc (Row);
    end;

    XLSheet.Columns ['A:G'].AutoFit;
    XLSheet.Columns ['H'].ColumnWidth   := 30;
    XLSheet.Columns ['I:AL'].AutoFit;

    XLSheet.Range [Format ('F6:F%d', [Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('F6:F%d', [Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('F6:F%d', [Row - 1])].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Range [Format ('L6:L%d', [Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('L6:L%d', [Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('L6:L%d', [Row - 1])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('M6:M%d', [Row - 1])].Style               := 'Currency';
    XLSheet.Range [Format ('N6:N%d', [Row - 1])].Style               := 'Currency';

    XLSheet.Range [Format ('O6:O%d', [Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('O6:O%d', [Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('O6:O%d', [Row - 1])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('P6:P%d', [Row - 1])].Style               := 'Currency';
    XLSheet.Range [Format ('Q6:Q%d', [Row - 1])].Style               := 'Currency';


    XLSheet.Range [Format ('R6:R%d', [Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('R6:R%d', [Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('R6:R%d', [Row - 1])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('S6:S%d', [Row - 1])].Style               := 'Currency';
    XLSheet.Range [Format ('T6:T%d', [Row - 1])].Style               := 'Currency';

    XLSheet.Range [Format ('U6:U%d', [Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('U6:U%d', [Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('U6:U%d', [Row - 1])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('V6:V%d', [Row - 1])].Style               := 'Currency';
    XLSheet.Range [Format ('W6:W%d', [Row - 1])].Style               := 'Currency';

    XLSheet.Range [Format ('X6:X%d', [Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('X6:X%d', [Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('X6:X%d', [Row - 1])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('Y6:Y%d', [Row - 1])].Style               := 'Currency';
    XLSheet.Range [Format ('Z6:Z%d', [Row - 1])].Style               := 'Currency';

    XLSheet.Range [Format ('AA6:AA%d', [Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('AA6:AA%d', [Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('AA6:AA%d', [Row - 1])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('AB6:AB%d', [Row - 1])].Style               := 'Currency';
    XLSheet.Range [Format ('AC6:AC%d', [Row - 1])].Style               := 'Currency';

    XLSheet.Range [Format ('AD6:AD%d', [Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('AD6:AD%d', [Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('AD6:AD%d', [Row - 1])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('AE6:AE%d', [Row - 1])].Style               := 'Currency';
    XLSheet.Range [Format ('AF6:AF%d', [Row - 1])].Style               := 'Currency';

    XLSheet.Range [Format ('AG6:AG%d', [Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('AG6:AG%d', [Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('AG6:AG%d', [Row - 1])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('AH6:AH%d', [Row - 1])].Style               := 'Currency';
    XLSheet.Range [Format ('AI6:AI%d', [Row - 1])].Style               := 'Currency';

    XLSheet.Range [Format ('AJ6:AJ%d', [Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('AJ6:AJ%d', [Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('AJ6:AJ%d', [Row - 1])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('AK6:AK%d', [Row - 1])].Style               := 'Currency';
    XLSheet.Range [Format ('AL6:AL%d', [Row - 1])].Style               := 'Currency';

    XLSheet.Range ['A7'].Select;
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

function TWCrLCbVsCr.ConstruyeTipoEntidad: string;
begin
  result := '';
  if cbEstatal.Checked then
    result := result + 'ESTATAL|';

  if cbMunicipal.Checked then
    result := result + 'MUNICIPAL|';

  if cbOrgDesc.Checked then
    result := result + 'ORG-DESC|';

  if result <> '' then
    Delete (result, Length (result), 1);
end;

procedure TWCrLCbVsCr.sbExportarClick(Sender: TObject);
var
  XLApp: Variant;
begin
  sbExportar.Refresh;
  if SaveXLS.Execute then
  begin
    Cursor := crHourGlass;
    try
      ExportarExcel (SaveXLS.FileName);
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

procedure TWCrLCbVsCr.sbExportarDetalleClick(Sender: TObject);
var
  XLApp: Variant;
begin
  sbExportar.Refresh;
  if SaveXLS.Execute then
  begin
    Cursor := crHourGlass;
    try
      ExportarXLSDetalles (SaveXLS.FileName);
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








