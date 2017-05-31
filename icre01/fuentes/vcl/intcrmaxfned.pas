unit IntCrMaxFnEd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  InterFor, IntFrm, ComCtrls, StdCtrls, Grids, Aligrid, Db, DBTables,
  DBGrids, Math, ExtCtrls, TeeProcs, TeEngine, Chart, DBChart, Series,
  Buttons, Menus, ShellAPI, ComObj, InCrQrMaxFnEd;

const
  AzulClaro            = $00F1E6DC;
  AzulOscuro           = $00C67E3E;
  NaranjaClaro         = $00D9E9FD;
  NaranjaOscuro        = $000A6BE2;
  VerdeClaro           = $00DEF1EB;
  VerdeOscuro          = $003C9376;
  Gris                 = $00F2F2F2;

  Producto1            = $00F1D9C5;
  Producto2            = $00E4CCB8;
  Producto3            = $00E2B48D;
  Producto4            = $00D9E9FD;
  Producto5            = $00B4D5FC;
  Producto6            = $008FBFFA;
  Producto7            = $00BCE4D8;
  Producto8            = $009BD7C4;
  Producto9            = $0059BB9B;

  AzulGraficaClaro     = $00D58E55;
  AzulGraficaOscuro    = $00926037;
  NaranjaGraficaClaro  = $0090C0FA;
  NaranjaGraficaOscuro = $000A6CE4;
  VerdeGraficaClaro    = $009BD6C3;
  VerdeGraficaOscuro   = $003C9377;
  GrisGrafica          = $007F7F7F;

const
  Col_Entidad        =  0;
  Col_Pct_PI         =  1;
  Col_FID_PartFedPct =  2;
  Col_FID_PartFed    =  3;
  Col_FID_AporFedPct =  4;
  Col_FID_AporFed    =  5;
  Col_FID_IngPropPct =  6;
  Col_FID_IngProp    =  7;
  Col_MAN_PartFedPct =  8;
  Col_MAN_PartFed    =  9;
  Col_MAN_AporFedPct = 10;
  Col_MAN_AporFed    = 11;
  Col_MAN_IngPropPct = 12;
  Col_MAN_IngProp    = 13;
  Col_SNE_InscFedPct = 14;
  Col_SNE_InscFed    = 15;
  Col_SNE_InscEstPct = 16;
  Col_SNE_InscEst    = 17;
  Col_SNE_SinInscPct = 18;
  Col_SNE_SinInsc    = 19;

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
  TCrMaxFnEd = class;

  TWCrMaxFnEd = class(TForm)
    InterForma1: TInterForma;
    dpFecha: TDateTimePicker;
    QDatos: TQuery;
    Shape1: TShape;
    Label2: TLabel;
    Shape2: TShape;
    Label3: TLabel;
    Shape3: TShape;
    Label4: TLabel;
    Chart: TDBChart;
    cbDisplayMarks: TCheckBox;
    rgProyeccion: TRadioGroup;
    rgInfoDesplegar: TRadioGroup;
    cbFideicomiso: TCheckBox;
    cbMandato: TCheckBox;
    cbSinEstructura: TCheckBox;
    rgTipoGrafica: TRadioGroup;
    sbExportar: TSpeedButton;
    sbPopupExportar: TSpeedButton;
    sbImprimir: TSpeedButton;
    pmExportar: TPopupMenu;
    Tablaygrfica1: TMenuItem;
    Solotabla1: TMenuItem;
    SaveXLS: TSaveDialog;
    Label5: TLabel;
    edIndiceCapitalizacion: TEdit;
    QIndiceCapitalizacion: TQuery;
    Sologrfica1: TMenuItem;
    rgFactorMoneda: TRadioGroup;
    Shape4: TShape;
    Label1: TLabel;
    Shape5: TShape;
    Label6: TLabel;
    Shape6: TShape;
    Label7: TLabel;
    Shape7: TShape;
    Label8: TLabel;
    Shape8: TShape;
    Label9: TLabel;
    Shape9: TShape;
    Label10: TLabel;
    sagDatos: TStringAlignGrid;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dpFechaChange(Sender: TObject);
    procedure QDatosAfterOpen(DataSet: TDataSet);
    procedure rgProyeccionClick(Sender: TObject);
    procedure rgInfoDesplegarClick(Sender: TObject);
    procedure cbDisplayMarksClick(Sender: TObject);
    procedure sbPopupExportarClick(Sender: TObject);
    procedure PopupMenuGraficaTabla(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure QIndiceCapitalizacionAfterOpen(DataSet: TDataSet);
    procedure sbImprimirClick(Sender: TObject);
  private
    { Private declarations }

    SerieBarPctPI:                TBarSeries;

    SerieBarFIDPartFedInscFedPct: TBarSeries;
    SerieBarFIDPartFedInscFed:    TBarSeries;
    SerieBarFIDAporFedInscFedPct: TBarSeries;
    SerieBarFIDAporFedInscFed:    TBarSeries;
    SerieBarFIDIngPropInscFedPct: TBarSeries;
    SerieBarFIDIngPropInscFed:    TBarSeries;

    SerieBarMANPartFedInscFedPct: TBarSeries;
    SerieBarMANPartFedInscFed:    TBarSeries;
    SerieBarMANAporFedInscFedPct: TBarSeries;
    SerieBarMANAporFedInscFed:    TBarSeries;
    SerieBarMANIngPropInscFedPct: TBarSeries;
    SerieBarMANIngPropInscFed:    TBarSeries;

    SerieBarSNEIngPropInscFedPct: TBarSeries;
    SerieBarSNEIngPropInscFed:    TBarSeries;
    SerieBarSNEIngPropInscEstPct: TBarSeries;
    SerieBarSNEIngPropInscEst:    TBarSeries;
    SerieBarSNEIngPropSinInscPct: TBarSeries;
    SerieBarSNEIngPropSinInsc:    TBarSeries;

    SerieLinePctPI:                TLineSeries;

    SerieLineFIDPartFedInscFedPct: TLineSeries;
    SerieLineFIDPartFedInscFed:    TLineSeries;
    SerieLineFIDAporFedInscFedPct: TLineSeries;
    SerieLineFIDAporFedInscFed:    TLineSeries;
    SerieLineFIDIngPropInscFedPct: TLineSeries;
    SerieLineFIDIngPropInscFed:    TLineSeries;

    SerieLineMANPartFedInscFedPct: TLineSeries;
    SerieLineMANPartFedInscFed:    TLineSeries;
    SerieLineMANAporFedInscFedPct: TLineSeries;
    SerieLineMANAporFedInscFed:    TLineSeries;
    SerieLineMANIngPropInscFedPct: TLineSeries;
    SerieLineMANIngPropInscFed:    TLineSeries;

    SerieLineSNEIngPropInscFedPct: TLineSeries;
    SerieLineSNEIngPropInscFed:    TLineSeries;
    SerieLineSNEIngPropInscEstPct: TLineSeries;
    SerieLineSNEIngPropInscEst:    TLineSeries;
    SerieLineSNEIngPropSinInscPct: TLineSeries;
    SerieLineSNEIngPropSinInsc:    TLineSeries;

    procedure SetHeaderGrid;
    procedure ClearGrid;
    procedure ExportarExcel (FileName: string; Opciones: byte = 3);
  public
    { Public declarations }
    Objeto : TCrMaxFnEd;
  end;

  TCrMaxFnEd = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
    constructor Create (AOwner: TComponent); override;
    function    ShowWindow (FormaTipo: TFormaTipo): integer; override;
  published
  end;

var
  WCrMaxFnEd: TWCrMaxFnEd;

implementation

{$R *.DFM}

constructor TCrMaxFnEd.Create (AOwner: TComponent);
begin
  inherited;
  ShowMenuReporte := False;
end;

function    TCrMaxFnEd.ShowWindow (FormaTipo: TFormaTipo): integer;
var
  W: TWCrMaxFnEd;
begin
   W := TWCrMaxFnEd.Create(Self);
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

procedure TWCrMaxFnEd.FormCreate(Sender: TObject);
begin
  //Especificación de punto decimal y separador de miles
  DecimalSeparator  := '.';
  ThousandSeparator := ',';

  //Alineacion de TEdit a la derecha, junto con BiDiMode dbRightToLeft
  SysLocale.MiddleEast := True;

  SerieBarPctPI                                     := TBarSeries.Create (Chart);
  SerieBarPctPI.ParentChart                         := Chart;
  SerieBarPctPI.SeriesColor                         := GrisGrafica;
  SerieBarPctPI.Title                               := 'Pct PI';
  SerieBarPctPI.Marks.Style                         := smsPercent;
  SerieBarPctPI.BarPen.Color                        := GrisGrafica;

  SerieLinePctPI                                    := TLineSeries.Create (Chart);
  SerieLinePctPI.ParentChart                        := Chart;
  SerieLinePctPI.SeriesColor                        := GrisGrafica;
  SerieLinePctPI.Title                              := 'Pct PI';
  SerieLinePctPI.Marks.Style                        := smsPercent;

  {Fideicomiso}
  SerieBarFIDPartFedInscFedPct                      := TBarSeries.Create (Chart);
  SerieBarFIDPartFedInscFedPct.ParentChart          := Chart;
  SerieBarFIDPartFedInscFedPct.SeriesColor          := AzulGraficaClaro;
  SerieBarFIDPartFedInscFedPct.Title                := 'Producto 1';
  SerieBarFIDPartFedInscFedPct.Marks.Style          := smsPercent;
  SerieBarFIDPartFedInscFedPct.BarPen.Color         := AzulGraficaClaro;

  SerieLineFIDPartFedInscFedPct                     := TLineSeries.Create (Chart);
  SerieLineFIDPartFedInscFedPct.ParentChart         := Chart;
  SerieLineFIDPartFedInscFedPct.SeriesColor         := AzulGraficaClaro;
  SerieLineFIDPartFedInscFedPct.Title               := 'Producto 1';
  SerieLineFIDPartFedInscFedPct.Marks.Style         := smsPercent;

  SerieBarFIDPartFedInscFed                         := TBarSeries.Create (Chart);
  SerieBarFIDPartFedInscFed.ParentChart             := Chart;
  SerieBarFIDPartFedInscFed.SeriesColor             := AzulGraficaClaro;
  SerieBarFIDPartFedInscFed.Title                   := 'Producto 1';
  SerieBarFIDPartFedInscFed.Marks.Style             := smsValue;
  SerieBarFIDPartFedInscFed.BarPen.Color            := AzulGraficaClaro;

  SerieLineFIDPartFedInscFed                        := TLineSeries.Create (Chart);
  SerieLineFIDPartFedInscFed.ParentChart            := Chart;
  SerieLineFIDPartFedInscFed.SeriesColor            := AzulGraficaClaro;
  SerieLineFIDPartFedInscFed.Title                  := 'Producto 1';
  SerieLineFIDPartFedInscFed.Marks.Style            := smsValue;

  SerieBarFIDAporFedInscFedPct                      := TBarSeries.Create (Chart);
  SerieBarFIDAporFedInscFedPct.ParentChart          := Chart;
  SerieBarFIDAporFedInscFedPct.SeriesColor          := AzulGraficaOscuro;
  SerieBarFIDAporFedInscFedPct.Title                := 'Producto 2';
  SerieBarFIDAporFedInscFedPct.Marks.Style          := smsPercent;
  SerieBarFIDAporFedInscFedPct.BarPen.Color         := AzulGraficaOscuro;

  SerieLineFIDAporFedInscFedPct                     := TLineSeries.Create (Chart);
  SerieLineFIDAporFedInscFedPct.ParentChart         := Chart;
  SerieLineFIDAporFedInscFedPct.SeriesColor         := AzulGraficaOscuro;
  SerieLineFIDAporFedInscFedPct.Title               := 'Producto 2';
  SerieLineFIDAporFedInscFedPct.Marks.Style         := smsPercent;

  SerieBarFIDAporFedInscFed                         := TBarSeries.Create (Chart);
  SerieBarFIDAporFedInscFed.ParentChart             := Chart;
  SerieBarFIDAporFedInscFed.SeriesColor             := AzulGraficaOscuro;
  SerieBarFIDAporFedInscFed.Title                   := 'Producto 2';
  SerieBarFIDAporFedInscFed.Marks.Style             := smsValue;
  SerieBarFIDAporFedInscFed.BarPen.Color            := AzulGraficaOscuro;

  SerieLineFIDAporFedInscFed                        := TLineSeries.Create (Chart);
  SerieLineFIDAporFedInscFed.ParentChart            := Chart;
  SerieLineFIDAporFedInscFed.SeriesColor            := AzulGraficaOscuro;
  SerieLineFIDAporFedInscFed.Title                  := 'Producto 2';
  SerieLineFIDAporFedInscFed.Marks.Style            := smsValue;

  SerieBarFIDIngPropInscFedPct                      := TBarSeries.Create (Chart);
  SerieBarFIDIngPropInscFedPct.ParentChart          := Chart;
  SerieBarFIDIngPropInscFedPct.SeriesColor          := AzulGraficaClaro;
  SerieBarFIDIngPropInscFedPct.Title                := 'Producto 3';
  SerieBarFIDIngPropInscFedPct.Marks.Style          := smsPercent;
  SerieBarFIDIngPropInscFedPct.BarPen.Color         := AzulGraficaClaro;
  SerieBarFIDIngPropInscFedPct.BarBrush.Style       := bsDiagCross;

  SerieLineFIDIngPropInscFedPct                     := TLineSeries.Create (Chart);
  SerieLineFIDIngPropInscFedPct.ParentChart         := Chart;
  SerieLineFIDIngPropInscFedPct.SeriesColor         := AzulGraficaClaro;
  SerieLineFIDIngPropInscFedPct.Title               := 'Producto 3';
  SerieLineFIDIngPropInscFedPct.Marks.Style         := smsPercent;
  SerieLineFIDIngPropInscFedPct.LineBrush           := bsDiagCross;

  SerieBarFIDIngPropInscFed                         := TBarSeries.Create (Chart);
  SerieBarFIDIngPropInscFed.ParentChart             := Chart;
  SerieBarFIDIngPropInscFed.SeriesColor             := AzulGraficaClaro;
  SerieBarFIDIngPropInscFed.Title                   := 'Producto 3';
  SerieBarFIDIngPropInscFed.Marks.Style             := smsValue;
  SerieBarFIDIngPropInscFed.BarPen.Color            := AzulGraficaClaro;
  SerieBarFIDIngPropInscFed.BarBrush.Style          := bsDiagCross;

  SerieLineFIDIngPropInscFed                        := TLineSeries.Create (Chart);
  SerieLineFIDIngPropInscFed.ParentChart            := Chart;
  SerieLineFIDIngPropInscFed.SeriesColor            := AzulGraficaClaro;
  SerieLineFIDIngPropInscFed.Title                  := 'Producto 3';
  SerieLineFIDIngPropInscFed.Marks.Style            := smsValue;
  SerieLineFIDIngPropInscFed.LineBrush              := bsDiagCross;

  {Mandato}
  SerieBarMANPartFedInscFedPct                      := TBarSeries.Create (Chart);
  SerieBarMANPartFedInscFedPct.ParentChart          := Chart;
  SerieBarMANPartFedInscFedPct.SeriesColor          := NaranjaGraficaOscuro;
  SerieBarMANPartFedInscFedPct.Title                := 'Producto 4';
  SerieBarMANPartFedInscFedPct.Marks.Style          := smsPercent;
  SerieBarMANPartFedInscFedPct.BarPen.Color         := NaranjaGraficaOscuro;

  SerieLineMANPartFedInscFedPct                     := TLineSeries.Create (Chart);
  SerieLineMANPartFedInscFedPct.ParentChart         := Chart;
  SerieLineMANPartFedInscFedPct.SeriesColor         := NaranjaGraficaOscuro;
  SerieLineMANPartFedInscFedPct.Title               := 'Producto 4';
  SerieLineMANPartFedInscFedPct.Marks.Style         := smsPercent;

  SerieBarMANPartFedInscFed                         := TBarSeries.Create (Chart);
  SerieBarMANPartFedInscFed.ParentChart             := Chart;
  SerieBarMANPartFedInscFed.SeriesColor             := NaranjaGraficaOscuro;
  SerieBarMANPartFedInscFed.Title                   := 'Producto 4';
  SerieBarMANPartFedInscFed.Marks.Style             := smsValue;
  SerieBarMANPartFedInscFed.BarPen.Color            := NaranjaGraficaOscuro;

  SerieLineMANPartFedInscFed                        := TLineSeries.Create (Chart);
  SerieLineMANPartFedInscFed.ParentChart            := Chart;
  SerieLineMANPartFedInscFed.SeriesColor            := NaranjaGraficaOscuro;
  SerieLineMANPartFedInscFed.Title                  := 'Producto 4.';
  SerieLineMANPartFedInscFed.Marks.Style            := smsValue;

  SerieBarMANAporFedInscFedPct                      := TBarSeries.Create (Chart);
  SerieBarMANAporFedInscFedPct.ParentChart          := Chart;
  SerieBarMANAporFedInscFedPct.SeriesColor          := NaranjaGraficaClaro;
  SerieBarMANAporFedInscFedPct.Title                := 'Producto 5';
  SerieBarMANAporFedInscFedPct.Marks.Style          := smsPercent;
  SerieBarMANAporFedInscFedPct.BarPen.Color         := NaranjaGraficaClaro;

  SerieLineMANAporFedInscFedPct                     := TLineSeries.Create (Chart);
  SerieLineMANAporFedInscFedPct.ParentChart         := Chart;
  SerieLineMANAporFedInscFedPct.SeriesColor         := NaranjaGraficaClaro;
  SerieLineMANAporFedInscFedPct.Title               := 'Producto 5';
  SerieLineMANAporFedInscFedPct.Marks.Style         := smsPercent;

  SerieBarMANAporFedInscFed                         := TBarSeries.Create (Chart);
  SerieBarMANAporFedInscFed.ParentChart             := Chart;
  SerieBarMANAporFedInscFed.SeriesColor             := NaranjaGraficaClaro;
  SerieBarMANAporFedInscFed.Title                   := 'Producto 5';
  SerieBarMANAporFedInscFed.Marks.Style             := smsValue;
  SerieBarMANAporFedInscFed.BarPen.Color            := NaranjaGraficaClaro;

  SerieLineMANAporFedInscFed                        := TLineSeries.Create (Chart);
  SerieLineMANAporFedInscFed.ParentChart            := Chart;
  SerieLineMANAporFedInscFed.SeriesColor            := NaranjaGraficaClaro;
  SerieLineMANAporFedInscFed.Title                  := 'Producto 5';
  SerieLineMANAporFedInscFed.Marks.Style            := smsValue;

  SerieBarMANIngPropInscFedPct                      := TBarSeries.Create (Chart);
  SerieBarMANIngPropInscFedPct.ParentChart          := Chart;
  SerieBarMANIngPropInscFedPct.SeriesColor          := NaranjaGraficaOscuro;
  SerieBarMANIngPropInscFedPct.Title                := 'Producto 6';
  SerieBarMANIngPropInscFedPct.Marks.Style          := smsPercent;
  SerieBarMANIngPropInscFedPct.BarPen.Color         := NaranjaGraficaOscuro;
  SerieBarMANIngPropInscFedPct.BarBrush.Style       := bsDiagCross;

  SerieLineMANIngPropInscFedPct                     := TLineSeries.Create (Chart);
  SerieLineMANIngPropInscFedPct.ParentChart         := Chart;
  SerieLineMANIngPropInscFedPct.SeriesColor         := NaranjaGraficaOscuro;
  SerieLineMANIngPropInscFedPct.Title               := 'Producto 6';
  SerieLineMANIngPropInscFedPct.Marks.Style         := smsPercent;
  SerieLineMANIngPropInscFedPct.LineBrush           := bsDiagCross;

  SerieBarMANIngPropInscFed                         := TBarSeries.Create (Chart);
  SerieBarMANIngPropInscFed.ParentChart             := Chart;
  SerieBarMANIngPropInscFed.SeriesColor             := NaranjaGraficaOscuro;
  SerieBarMANIngPropInscFed.Title                   := 'Producto 6';
  SerieBarMANIngPropInscFed.Marks.Style             := smsValue;
  SerieBarMANIngPropInscFed.BarPen.Color            := NaranjaGraficaOscuro;
  SerieBarMANIngPropInscFed.BarBrush.Style          := bsDiagCross;

  SerieLineMANIngPropInscFed                        := TLineSeries.Create (Chart);
  SerieLineMANIngPropInscFed.ParentChart            := Chart;
  SerieLineMANIngPropInscFed.SeriesColor            := NaranjaGraficaOscuro;
  SerieLineMANIngPropInscFed.Title                  := 'Producto 6';
  SerieLineMANIngPropInscFed.Marks.Style            := smsValue;
  SerieLineMANIngPropInscFed.LineBrush              := bsDiagCross;

  {Sin Estructura}
  SerieBarSNEIngPropInscFedPct                      := TBarSeries.Create (Chart);
  SerieBarSNEIngPropInscFedPct.ParentChart          := Chart;
  SerieBarSNEIngPropInscFedPct.SeriesColor          := VerdeGraficaClaro;
  SerieBarSNEIngPropInscFedPct.Title                := 'Producto 7';
  SerieBarSNEIngPropInscFedPct.Marks.Style          := smsPercent;
  SerieBarSNEIngPropInscFedPct.BarPen.Color         := VerdeGraficaClaro;

  SerieLineSNEIngPropInscFedPct                     := TLineSeries.Create (Chart);
  SerieLineSNEIngPropInscFedPct.ParentChart         := Chart;
  SerieLineSNEIngPropInscFedPct.SeriesColor         := VerdeGraficaClaro;
  SerieLineSNEIngPropInscFedPct.Title               := 'Producto 7';
  SerieLineSNEIngPropInscFedPct.Marks.Style         := smsPercent;

  SerieBarSNEIngPropInscFed                         := TBarSeries.Create (Chart);
  SerieBarSNEIngPropInscFed.ParentChart             := Chart;
  SerieBarSNEIngPropInscFed.SeriesColor             := VerdeGraficaClaro;
  SerieBarSNEIngPropInscFed.Title                   := 'Producto 7';
  SerieBarSNEIngPropInscFed.Marks.Style             := smsValue;
  SerieBarSNEIngPropInscFed.BarPen.Color            := VerdeGraficaClaro;

  SerieLineSNEIngPropInscFed                        := TLineSeries.Create (Chart);
  SerieLineSNEIngPropInscFed.ParentChart            := Chart;
  SerieLineSNEIngPropInscFed.SeriesColor            := VerdeGraficaClaro;
  SerieLineSNEIngPropInscFed.Title                  := 'Producto 7';
  SerieLineSNEIngPropInscFed.Marks.Style            := smsValue;

  SerieBarSNEIngPropInscEstPct                      := TBarSeries.Create (Chart);
  SerieBarSNEIngPropInscEstPct.ParentChart          := Chart;
  SerieBarSNEIngPropInscEstPct.SeriesColor          := VerdeGraficaOscuro;
  SerieBarSNEIngPropInscEstPct.Title                := 'Producto 8';
  SerieBarSNEIngPropInscEstPct.Marks.Style          := smsPercent;
  SerieBarSNEIngPropInscEstPct.BarPen.Color         := VerdeGraficaOscuro;

  SerieLineSNEIngPropInscEstPct                     := TLineSeries.Create (Chart);
  SerieLineSNEIngPropInscEstPct.ParentChart         := Chart;
  SerieLineSNEIngPropInscEstPct.SeriesColor         := VerdeGraficaOscuro;
  SerieLineSNEIngPropInscEstPct.Title               := 'Producto 8';
  SerieLineSNEIngPropInscEstPct.Marks.Style         := smsPercent;

  SerieBarSNEIngPropInscEst                         := TBarSeries.Create (Chart);
  SerieBarSNEIngPropInscEst.ParentChart             := Chart;
  SerieBarSNEIngPropInscEst.SeriesColor             := VerdeGraficaOscuro;
  SerieBarSNEIngPropInscEst.Title                   := 'Producto 8';
  SerieBarSNEIngPropInscEst.Marks.Style             := smsValue;
  SerieBarSNEIngPropInscEst.BarPen.Color            := VerdeGraficaOscuro;

  SerieLineSNEIngPropInscEst                        := TLineSeries.Create (Chart);
  SerieLineSNEIngPropInscEst.ParentChart            := Chart;
  SerieLineSNEIngPropInscEst.SeriesColor            := VerdeGraficaOscuro;
  SerieLineSNEIngPropInscEst.Title                  := 'Producto 8';
  SerieLineSNEIngPropInscEst.Marks.Style            := smsValue;

  SerieBarSNEIngPropSinInscPct                      := TBarSeries.Create (Chart);
  SerieBarSNEIngPropSinInscPct.ParentChart          := Chart;
  SerieBarSNEIngPropSinInscPct.SeriesColor          := VerdeGraficaClaro;
  SerieBarSNEIngPropSinInscPct.Title                := 'Producto 9';
  SerieBarSNEIngPropSinInscPct.Marks.Style          := smsPercent;
  SerieBarSNEIngPropSinInscPct.BarPen.Color         := VerdeGraficaClaro;
  SerieBarSNEIngPropSinInscPct.BarBrush.Style       := bsDiagCross;

  SerieLineSNEIngPropSinInscPct                     := TLineSeries.Create (Chart);
  SerieLineSNEIngPropSinInscPct.ParentChart         := Chart;
  SerieLineSNEIngPropSinInscPct.SeriesColor         := VerdeGraficaClaro;
  SerieLineSNEIngPropSinInscPct.Title               := 'Producto 9';
  SerieLineSNEIngPropSinInscPct.Marks.Style         := smsPercent;
  SerieLineSNEIngPropSinInscPct.LineBrush           := bsDiagCross;

  SerieBarSNEIngPropSinInsc                         := TBarSeries.Create (Chart);
  SerieBarSNEIngPropSinInsc.ParentChart             := Chart;
  SerieBarSNEIngPropSinInsc.SeriesColor             := VerdeGraficaClaro;
  SerieBarSNEIngPropSinInsc.Title                   := 'Producto 9';
  SerieBarSNEIngPropSinInsc.Marks.Style             := smsValue;
  SerieBarSNEIngPropSinInsc.BarPen.Color            := VerdeGraficaClaro;
  SerieBarSNEIngPropSinInsc.BarBrush.Style          := bsDiagCross;

  SerieLineSNEIngPropSinInsc                        := TLineSeries.Create (Chart);
  SerieLineSNEIngPropSinInsc.ParentChart            := Chart;
  SerieLineSNEIngPropSinInsc.SeriesColor            := VerdeGraficaClaro;
  SerieLineSNEIngPropSinInsc.Title                  := 'Producto 9';
  SerieLineSNEIngPropSinInsc.Marks.Style            := smsValue;
  SerieLineSNEIngPropSinInsc.LineBrush              := bsDiagCross;
end;

procedure TWCrMaxFnEd.FormShow(Sender: TObject);
begin
  dpFecha.DateTime := Objeto.Apli.DameFechaEmpresa;
  dpFechaChange (dpFecha);
  rgProyeccionClick (rgProyeccion);
  rgInfoDesplegarClick (rgInfoDesplegar);
  cbDisplayMarksClick (cbDisplayMarks);
end;

procedure TWCrMaxFnEd.SetHeaderGrid;
begin
  if sagDatos.RowCount < 3 then
    sagDatos.RowCount := 3;

  if sagDatos.FixedRows < 2 then
    sagDatos.FixedRows := 2;

  sagDatos.ColorCol [Col_Pct_PI]         := Gris;
  sagDatos.ColorCol [Col_FID_PartFedPct] := Producto1;
  sagDatos.ColorCol [Col_FID_PartFed   ] := Producto1;
  sagDatos.ColorCol [Col_FID_AporFedPct] := Producto2;
  sagDatos.ColorCol [Col_FID_AporFed   ] := Producto2;
  sagDatos.ColorCol [Col_FID_IngPropPct] := Producto3;
  sagDatos.ColorCol [Col_FID_IngProp   ] := Producto3;
  sagDatos.ColorCol [Col_MAN_PartFedPct] := Producto4;
  sagDatos.ColorCol [Col_MAN_PartFed   ] := Producto4;
  sagDatos.ColorCol [Col_MAN_AporFedPct] := Producto5;
  sagDatos.ColorCol [Col_MAN_AporFed   ] := Producto5;
  sagDatos.ColorCol [Col_MAN_IngPropPct] := Producto6;
  sagDatos.ColorCol [Col_MAN_IngProp   ] := Producto6;
  sagDatos.ColorCol [Col_SNE_InscFedPct] := Producto7;
  sagDatos.ColorCol [Col_SNE_InscFed   ] := Producto7;
  sagDatos.ColorCol [Col_SNE_InscEstPct] := Producto8;
  sagDatos.ColorCol [Col_SNE_InscEst   ] := Producto8;
  sagDatos.ColorCol [Col_SNE_SinInscPct] := Producto9;
  sagDatos.ColorCol [Col_SNE_SinInsc   ] := Producto9;
end;

procedure TWCrMaxFnEd.ClearGrid;
var
  r, c: integer;
begin
  SetHeaderGrid;
  for r := 2 to sagDatos.RowCount - 1 do
    for c := 0 to sagDatos.ColCount - 1 do
      sagDatos.Cells [c, r] := '';

  sagDatos.RowCount := 3;
end;

procedure TWCrMaxFnEd.dpFechaChange(Sender: TObject);
var
  factor: double;
begin
  QDatos.Close;
  QDatos.DatabaseName                                  := Objeto.Apli.DataBaseName;
  QDatos.SessionName                                   := Objeto.Apli.SessionName;
  QDatos.ParamByName ('Fecha').AsString                := FormatDateTime ('dd/mm/yyyy', dpFecha.Date);
  QDatos.Open;

  factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: factor := 1;
    1: factor := 1000;
    2: factor := 1000000;
  end;

  QIndiceCapitalizacion.Close;
  QIndiceCapitalizacion.DatabaseName                   := Objeto.Apli.DataBaseName;
  QIndiceCapitalizacion.SessionName                    := Objeto.Apli.SessionName;
  QIndiceCapitalizacion.ParamByName ('Fecha').AsString := FormatDateTime ('dd/mm/yyyy', dpFecha.Date);
  QIndiceCapitalizacion.ParamByName ('Factor').AsFloat := factor;
  QIndiceCapitalizacion.Open;
end;

procedure TWCrMaxFnEd.QDatosAfterOpen(DataSet: TDataSet);
var
  row, mx: integer;
  factor: double;
  s: string;

  function Pct (f: double): string;
  begin
    result := Format ('%3.2F', [f]);
  end;

  function Money (f: double): string;
  begin
    result := Format ('%m', [f]);
    result := Copy (result, 1, Length (result) - 2);
  end;

begin
  ClearGrid;

  factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: factor := 1;
    1: factor := 1000;
    2: factor := 1000000;
  end;

  QDatos.Last;
  QDatos.First;
  sagDatos.RowCount := QDatos.RecordCount + sagDatos.FixedRows;
  row               := sagDatos.FixedRows;
  mx                := 120;

  SerieBarPctPI.Clear;
  SerieLinePctPI.Clear;

  {Fideicomiso}
  SerieBarFIDPartFedInscFedPct.Clear;
  SerieLineFIDPartFedInscFedPct.Clear;
  SerieBarFIDPartFedInscFed.Clear;
  SerieLineFIDPartFedInscFed.Clear;

  SerieBarFIDAporFedInscFedPct.Clear;
  SerieLineFIDAporFedInscFedPct.Clear;
  SerieBarFIDAporFedInscFed.Clear;
  SerieLineFIDAporFedInscFed.Clear;

  SerieBarFIDIngPropInscFedPct.Clear;
  SerieLineFIDIngPropInscFedPct.Clear;
  SerieBarFIDIngPropInscFed.Clear;
  SerieLineFIDIngPropInscFed.Clear;

  {Mandato}
  SerieBarMANPartFedInscFedPct.Clear;
  SerieLineMANPartFedInscFedPct.Clear;
  SerieBarMANPartFedInscFed.Clear;
  SerieLineMANPartFedInscFed.Clear;

  SerieBarMANAporFedInscFedPct.Clear;
  SerieLineMANAporFedInscFedPct.Clear;
  SerieBarMANAporFedInscFed.Clear;
  SerieLineMANAporFedInscFed.Clear;

  SerieBarMANIngPropInscFedPct.Clear;
  SerieLineMANIngPropInscFedPct.Clear;
  SerieBarMANIngPropInscFed.Clear;
  SerieLineMANIngPropInscFed.Clear;

  {Sin Estructura}
  SerieBarSNEIngPropInscFedPct.Clear;
  SerieLineSNEIngPropInscFedPct.Clear;
  SerieBarSNEIngPropInscFed.Clear;
  SerieLineSNEIngPropInscFed.Clear;

  SerieBarSNEIngPropInscEstPct.Clear;
  SerieLineSNEIngPropInscEstPct.Clear;
  SerieBarSNEIngPropInscEst.Clear;
  SerieLineSNEIngPropInscEst.Clear;

  SerieBarSNEIngPropSinInscPct.Clear;
  SerieLineSNEIngPropSinInscPct.Clear;
  SerieBarSNEIngPropSinInsc.Clear;
  SerieLineSNEIngPropSinInsc.Clear;

  while not QDatos.Eof do
  begin
    s := '';
    if QDatos.FieldByName ('B_Es_Acreditado').AsString = 'V' then
      sagDatos.RowFont [row].Style := sagDatos.RowFont [row].Style + [fsBold]
    else
    begin
      sagDatos.RowFont [row].Style := sagDatos.RowFont [row].Style - [fsBold];
      s := ' *';
    end;

    sagDatos.Cells [Col_Entidad,        row] := QDatos.FieldByName ('Desc_Poblacion').AsString + s;
    sagDatos.Cells [Col_Pct_PI,         row] := Pct   (QDatos.FieldByName ('Pct_PI').AsFloat);

    sagDatos.Cells [Col_FID_PartFedPct, row] := Pct   (QDatos.FieldByName ('Pct_CapBas_FID_PartFed_InscFed').AsFloat);
    sagDatos.Cells [Col_FID_PartFed,    row] := Money (QDatos.FieldByName ('Imp_CapBas_FID_PartFed_InscFed').AsFloat * factor);
    sagDatos.Cells [Col_FID_AporFedPct, row] := Pct   (QDatos.FieldByName ('Pct_CapBas_FID_AporFed_InscFed').AsFloat);
    sagDatos.Cells [Col_FID_AporFed,    row] := Money (QDatos.FieldByName ('Imp_CapBas_FID_AporFed_InscFed').AsFloat * factor);
    sagDatos.Cells [Col_FID_IngPropPct, row] := Pct   (QDatos.FieldByName ('Pct_CapBas_FID_IngProp_InscFed').AsFloat);
    sagDatos.Cells [Col_FID_IngProp,    row] := Money (QDatos.FieldByName ('Imp_CapBas_FID_IngProp_InscFed').AsFloat * factor);
    sagDatos.Cells [Col_MAN_PartFedPct, row] := Pct   (QDatos.FieldByName ('Pct_CapBas_MAN_PartFed_InscFed').AsFloat);
    sagDatos.Cells [Col_MAN_PartFed,    row] := Money (QDatos.FieldByName ('Imp_CapBas_MAN_PartFed_InscFed').AsFloat * factor);
    sagDatos.Cells [Col_MAN_AporFedPct, row] := Pct   (QDatos.FieldByName ('Pct_CapBas_MAN_AporFed_InscFed').AsFloat);
    sagDatos.Cells [Col_MAN_AporFed,    row] := Money (QDatos.FieldByName ('Imp_CapBas_MAN_AporFed_InscFed').AsFloat * factor);
    sagDatos.Cells [Col_MAN_IngPropPct, row] := Pct   (QDatos.FieldByName ('Pct_CapBas_MAN_IngProp_InscFed').AsFloat);
    sagDatos.Cells [Col_MAN_IngProp,    row] := Money (QDatos.FieldByName ('Imp_CapBas_MAN_IngProp_InscFed').AsFloat * factor);
    sagDatos.Cells [Col_SNE_InscFedPct, row] := Pct   (QDatos.FieldByName ('Pct_CapBas_SNE_IngProp_InscFed').AsFloat);
    sagDatos.Cells [Col_SNE_InscFed,    row] := Money (QDatos.FieldByName ('Imp_CapBas_SNE_IngProp_InscFed').AsFloat * factor);
    sagDatos.Cells [Col_SNE_InscEstPct, row] := Pct   (QDatos.FieldByName ('Pct_CapBas_SNE_IngProp_InscEst').AsFloat);
    sagDatos.Cells [Col_SNE_InscEst,    row] := Money (QDatos.FieldByName ('Imp_CapBas_SNE_IngProp_InscEst').AsFloat * factor);
    sagDatos.Cells [Col_SNE_SinInscPct, row] := Pct   (QDatos.FieldByName ('Pct_CapBas_SNE_IngProp_SinInsc').AsFloat);
    sagDatos.Cells [Col_SNE_SinInsc,    row] := Money (QDatos.FieldByName ('Imp_CapBas_SNE_IngProp_SinInsc').AsFloat * factor);

    SerieBarPctPI.Add  (QDatos.FieldByName ('Pct_PI').AsFloat, QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLinePctPI.Add (QDatos.FieldByName ('Pct_PI').AsFloat, QDatos.FieldByName ('Desc_C_Poblac').AsString);

    {Fideicomiso}
    SerieBarFIDPartFedInscFedPct.Add  (QDatos.FieldByName ('Pct_CapBas_FID_PartFed_InscFed').AsFloat,          QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLineFIDPartFedInscFedPct.Add (QDatos.FieldByName ('Pct_CapBas_FID_PartFed_InscFed').AsFloat,          QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieBarFIDPartFedInscFed.Add     (QDatos.FieldByName ('Imp_CapBas_FID_PartFed_InscFed').AsFloat * factor, QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLineFIDPartFedInscFed.Add    (QDatos.FieldByName ('Imp_CapBas_FID_PartFed_InscFed').AsFloat * factor, QDatos.FieldByName ('Desc_C_Poblac').AsString);

    SerieBarFIDAporFedInscFedPct.Add  (QDatos.FieldByName ('Pct_CapBas_FID_AporFed_InscFed').AsFloat,          QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLineFIDAporFedInscFedPct.Add (QDatos.FieldByName ('Pct_CapBas_FID_AporFed_InscFed').AsFloat,          QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieBarFIDAporFedInscFed.Add     (QDatos.FieldByName ('Imp_CapBas_FID_AporFed_InscFed').AsFloat * factor, QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLineFIDAporFedInscFed.Add    (QDatos.FieldByName ('Imp_CapBas_FID_AporFed_InscFed').AsFloat * factor, QDatos.FieldByName ('Desc_C_Poblac').AsString);

    SerieBarFIDIngPropInscFedPct.Add  (QDatos.FieldByName ('Pct_CapBas_FID_IngProp_InscFed').AsFloat,          QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLineFIDIngPropInscFedPct.Add (QDatos.FieldByName ('Pct_CapBas_FID_IngProp_InscFed').AsFloat,          QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieBarFIDIngPropInscFed.Add     (QDatos.FieldByName ('Imp_CapBas_FID_IngProp_InscFed').AsFloat * factor, QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLineFIDIngPropInscFed.Add    (QDatos.FieldByName ('Imp_CapBas_FID_IngProp_InscFed').AsFloat * factor, QDatos.FieldByName ('Desc_C_Poblac').AsString);

    {Mandato}
    SerieBarMANPartFedInscFedPct.Add  (QDatos.FieldByName ('Pct_CapBas_MAN_PartFed_InscFed').AsFloat,          QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLineMANPartFedInscFedPct.Add (QDatos.FieldByName ('Pct_CapBas_MAN_PartFed_InscFed').AsFloat,          QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieBarMANPartFedInscFed.Add     (QDatos.FieldByName ('Imp_CapBas_MAN_PartFed_InscFed').AsFloat * factor, QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLineMANPartFedInscFed.Add    (QDatos.FieldByName ('Imp_CapBas_MAN_PartFed_InscFed').AsFloat * factor, QDatos.FieldByName ('Desc_C_Poblac').AsString);

    SerieBarMANAporFedInscFedPct.Add  (QDatos.FieldByName ('Pct_CapBas_MAN_AporFed_InscFed').AsFloat,          QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLineMANAporFedInscFedPct.Add (QDatos.FieldByName ('Pct_CapBas_MAN_AporFed_InscFed').AsFloat,          QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieBarMANAporFedInscFed.Add     (QDatos.FieldByName ('Imp_CapBas_MAN_AporFed_InscFed').AsFloat * factor, QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLineMANAporFedInscFed.Add    (QDatos.FieldByName ('Imp_CapBas_MAN_AporFed_InscFed').AsFloat * factor, QDatos.FieldByName ('Desc_C_Poblac').AsString);

    SerieBarMANIngPropInscFedPct.Add  (QDatos.FieldByName ('Pct_CapBas_MAN_IngProp_InscFed').AsFloat,          QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLineMANIngPropInscFedPct.Add (QDatos.FieldByName ('Pct_CapBas_MAN_IngProp_InscFed').AsFloat,          QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieBarMANIngPropInscFed.Add     (QDatos.FieldByName ('Imp_CapBas_MAN_IngProp_InscFed').AsFloat * factor, QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLineMANIngPropInscFed.Add    (QDatos.FieldByName ('Imp_CapBas_MAN_IngProp_InscFed').AsFloat * factor, QDatos.FieldByName ('Desc_C_Poblac').AsString);

    {Sin Estructura}
    SerieBarSNEIngPropInscFedPct.Add  (QDatos.FieldByName ('Pct_CapBas_SNE_IngProp_InscFed').AsFloat,          QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLineSNEIngPropInscFedPct.Add (QDatos.FieldByName ('Pct_CapBas_SNE_IngProp_InscFed').AsFloat,          QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieBarSNEIngPropInscFed.Add     (QDatos.FieldByName ('Imp_CapBas_SNE_IngProp_InscFed').AsFloat * factor, QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLineSNEIngPropInscFed.Add    (QDatos.FieldByName ('Imp_CapBas_SNE_IngProp_InscFed').AsFloat * factor, QDatos.FieldByName ('Desc_C_Poblac').AsString);

    SerieBarSNEIngPropInscEstPct.Add  (QDatos.FieldByName ('Pct_CapBas_SNE_IngProp_InscEst').AsFloat,          QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLineSNEIngPropInscEstPct.Add (QDatos.FieldByName ('Pct_CapBas_SNE_IngProp_InscEst').AsFloat,          QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieBarSNEIngPropInscEst.Add     (QDatos.FieldByName ('Imp_CapBas_SNE_IngProp_InscEst').AsFloat * factor, QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLineSNEIngPropInscEst.Add    (QDatos.FieldByName ('Imp_CapBas_SNE_IngProp_InscEst').AsFloat * factor, QDatos.FieldByName ('Desc_C_Poblac').AsString);

    SerieBarSNEIngPropSinInscPct.Add  (QDatos.FieldByName ('Pct_CapBas_SNE_IngProp_SinInsc').AsFloat,          QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLineSNEIngPropSinInscPct.Add (QDatos.FieldByName ('Pct_CapBas_SNE_IngProp_SinInsc').AsFloat,          QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieBarSNEIngPropSinInsc.Add     (QDatos.FieldByName ('Imp_CapBas_SNE_IngProp_SinInsc').AsFloat * factor, QDatos.FieldByName ('Desc_C_Poblac').AsString);
    SerieLineSNEIngPropSinInsc.Add    (QDatos.FieldByName ('Imp_CapBas_SNE_IngProp_SinInsc').AsFloat * factor, QDatos.FieldByName ('Desc_C_Poblac').AsString);

    mx := Math.Max (mx, sagDatos.Canvas.TextWidth (QDatos.FieldByName ('Desc_Poblacion').AsString) + 8);
    Inc (row);
    QDatos.Next;
  end;
  sagDatos.ColWidths [Col_Entidad] := mx;
  sagDatos.SaveToFile ('c:\DataGrid.txt');
end;

procedure TWCrMaxFnEd.rgProyeccionClick(Sender: TObject);
var
  LineWidth: integer;
begin
  Chart.View3D := rgProyeccion.ItemIndex = 1;
  LineWidth    := Ord (rgProyeccion.ItemIndex = 0) + 1;

  SerieLinePctPI.LinePen.Width                := LineWidth;

  SerieLineFIDPartFedInscFedPct.LinePen.Width := LineWidth;
  SerieLineFIDPartFedInscFed.LinePen.Width    := LineWidth;
  SerieLineFIDAporFedInscFedPct.LinePen.Width := LineWidth;
  SerieLineFIDAporFedInscFed.LinePen.Width    := LineWidth;
  SerieLineFIDIngPropInscFedPct.LinePen.Width := LineWidth;
  SerieLineFIDIngPropInscFed.LinePen.Width    := LineWidth;

  SerieLineMANPartFedInscFedPct.LinePen.Width := LineWidth;
  SerieLineMANPartFedInscFed.LinePen.Width    := LineWidth;
  SerieLineMANAporFedInscFedPct.LinePen.Width := LineWidth;
  SerieLineMANAporFedInscFed.LinePen.Width    := LineWidth;
  SerieLineMANIngPropInscFedPct.LinePen.Width := LineWidth;
  SerieLineMANIngPropInscFed.LinePen.Width    := LineWidth;

  SerieLineSNEIngPropInscFedPct.LinePen.Width := LineWidth;
  SerieLineSNEIngPropInscFed.LinePen.Width    := LineWidth;
  SerieLineSNEIngPropInscEstPct.LinePen.Width := LineWidth;
  SerieLineSNEIngPropInscEst.LinePen.Width    := LineWidth;
  SerieLineSNEIngPropSinInscPct.LinePen.Width := LineWidth;
  SerieLineSNEIngPropSinInsc.LinePen.Width    := LineWidth;
end;

procedure TWCrMaxFnEd.rgInfoDesplegarClick(Sender: TObject);
begin
  SerieBarPctPI.Active                 := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 0);

  SerieBarFIDPartFedInscFedPct.Active  := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 0) and cbFideicomiso.Checked;
  SerieBarFIDPartFedInscFed.Active     := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 1) and cbFideicomiso.Checked;
  SerieBarFIDAporFedInscFedPct.Active  := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 0) and cbFideicomiso.Checked;
  SerieBarFIDAporFedInscFed.Active     := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 1) and cbFideicomiso.Checked;
  SerieBarFIDIngPropInscFedPct.Active  := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 0) and cbFideicomiso.Checked;
  SerieBarFIDIngPropInscFed.Active     := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 1) and cbFideicomiso.Checked;

  SerieBarMANPartFedInscFedPct.Active  := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 0) and cbMandato.Checked;
  SerieBarMANPartFedInscFed.Active     := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 1) and cbMandato.Checked;
  SerieBarMANAporFedInscFedPct.Active  := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 0) and cbMandato.Checked;
  SerieBarMANAporFedInscFed.Active     := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 1) and cbMandato.Checked;
  SerieBarMANIngPropInscFedPct.Active  := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 0) and cbMandato.Checked;
  SerieBarMANIngPropInscFed.Active     := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 1) and cbMandato.Checked;

  SerieBarSNEIngPropInscFedPct.Active  := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 0) and cbSinEstructura.Checked;
  SerieBarSNEIngPropInscFed.Active     := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 1) and cbSinEstructura.Checked;
  SerieBarSNEIngPropInscEstPct.Active  := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 0) and cbSinEstructura.Checked;
  SerieBarSNEIngPropInscEst.Active     := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 1) and cbSinEstructura.Checked;
  SerieBarSNEIngPropSinInscPct.Active  := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 0) and cbSinEstructura.Checked;
  SerieBarSNEIngPropSinInsc.Active     := (rgTipoGrafica.ItemIndex = 0) and (rgInfoDesplegar.ItemIndex = 1) and cbSinEstructura.Checked;

  SerieLinePctPI.Active                := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 0);

  SerieLineFIDPartFedInscFedPct.Active := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 0) and cbFideicomiso.Checked;
  SerieLineFIDPartFedInscFed.Active    := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 1) and cbFideicomiso.Checked;
  SerieLineFIDAporFedInscFedPct.Active := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 0) and cbFideicomiso.Checked;
  SerieLineFIDAporFedInscFed.Active    := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 1) and cbFideicomiso.Checked;
  SerieLineFIDIngPropInscFedPct.Active := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 0) and cbFideicomiso.Checked;
  SerieLineFIDIngPropInscFed.Active    := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 1) and cbFideicomiso.Checked;

  SerieLineMANPartFedInscFedPct.Active := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 0) and cbMandato.Checked;
  SerieLineMANPartFedInscFed.Active    := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 1) and cbMandato.Checked;
  SerieLineMANAporFedInscFedPct.Active := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 0) and cbMandato.Checked;
  SerieLineMANAporFedInscFed.Active    := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 1) and cbMandato.Checked;
  SerieLineMANIngPropInscFedPct.Active := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 0) and cbMandato.Checked;
  SerieLineMANIngPropInscFed.Active    := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 1) and cbMandato.Checked;

  SerieLineSNEIngPropInscFedPct.Active := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 0) and cbSinEstructura.Checked;
  SerieLineSNEIngPropInscFed.Active    := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 1) and cbSinEstructura.Checked;
  SerieLineSNEIngPropInscEstPct.Active := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 0) and cbSinEstructura.Checked;
  SerieLineSNEIngPropInscEst.Active    := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 1) and cbSinEstructura.Checked;
  SerieLineSNEIngPropSinInscPct.Active := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 0) and cbSinEstructura.Checked;
  SerieLineSNEIngPropSinInsc.Active    := (rgTipoGrafica.ItemIndex = 1) and (rgInfoDesplegar.ItemIndex = 1) and cbSinEstructura.Checked;
end;

procedure TWCrMaxFnEd.cbDisplayMarksClick(Sender: TObject);
begin
  SerieBarPctPI.Marks.Visible                 := cbDisplayMarks.Checked;

  SerieBarFIDPartFedInscFedPct.Marks.Visible  := cbDisplayMarks.Checked;
  SerieBarFIDPartFedInscFed.Marks.Visible     := cbDisplayMarks.Checked;
  SerieBarFIDAporFedInscFedPct.Marks.Visible  := cbDisplayMarks.Checked;
  SerieBarFIDAporFedInscFed.Marks.Visible     := cbDisplayMarks.Checked;
  SerieBarFIDIngPropInscFedPct.Marks.Visible  := cbDisplayMarks.Checked;
  SerieBarFIDIngPropInscFed.Marks.Visible     := cbDisplayMarks.Checked;

  SerieBarMANPartFedInscFedPct.Marks.Visible  := cbDisplayMarks.Checked;
  SerieBarMANPartFedInscFed.Marks.Visible     := cbDisplayMarks.Checked;
  SerieBarMANAporFedInscFedPct.Marks.Visible  := cbDisplayMarks.Checked;
  SerieBarMANAporFedInscFed.Marks.Visible     := cbDisplayMarks.Checked;
  SerieBarMANIngPropInscFedPct.Marks.Visible  := cbDisplayMarks.Checked;
  SerieBarMANIngPropInscFed.Marks.Visible     := cbDisplayMarks.Checked;

  SerieBarSNEIngPropInscFedPct.Marks.Visible  := cbDisplayMarks.Checked;
  SerieBarSNEIngPropInscFed.Marks.Visible     := cbDisplayMarks.Checked;
  SerieBarSNEIngPropInscEstPct.Marks.Visible  := cbDisplayMarks.Checked;
  SerieBarSNEIngPropInscEst.Marks.Visible     := cbDisplayMarks.Checked;
  SerieBarSNEIngPropSinInscPct.Marks.Visible  := cbDisplayMarks.Checked;
  SerieBarSNEIngPropSinInsc.Marks.Visible     := cbDisplayMarks.Checked;

  SerieLinePctPI.Marks.Visible                := cbDisplayMarks.Checked;

  SerieLineFIDPartFedInscFedPct.Marks.Visible := cbDisplayMarks.Checked;
  SerieLineFIDPartFedInscFed.Marks.Visible    := cbDisplayMarks.Checked;
  SerieLineFIDAporFedInscFedPct.Marks.Visible := cbDisplayMarks.Checked;
  SerieLineFIDAporFedInscFed.Marks.Visible    := cbDisplayMarks.Checked;
  SerieLineFIDIngPropInscFedPct.Marks.Visible := cbDisplayMarks.Checked;
  SerieLineFIDIngPropInscFed.Marks.Visible    := cbDisplayMarks.Checked;

  SerieLineMANPartFedInscFedPct.Marks.Visible := cbDisplayMarks.Checked;
  SerieLineMANPartFedInscFed.Marks.Visible    := cbDisplayMarks.Checked;
  SerieLineMANAporFedInscFedPct.Marks.Visible := cbDisplayMarks.Checked;
  SerieLineMANAporFedInscFed.Marks.Visible    := cbDisplayMarks.Checked;
  SerieLineMANIngPropInscFedPct.Marks.Visible := cbDisplayMarks.Checked;
  SerieLineMANIngPropInscFed.Marks.Visible    := cbDisplayMarks.Checked;

  SerieLineSNEIngPropInscFedPct.Marks.Visible := cbDisplayMarks.Checked;
  SerieLineSNEIngPropInscFed.Marks.Visible    := cbDisplayMarks.Checked;
  SerieLineSNEIngPropInscEstPct.Marks.Visible := cbDisplayMarks.Checked;
  SerieLineSNEIngPropInscEst.Marks.Visible    := cbDisplayMarks.Checked;
  SerieLineSNEIngPropSinInscPct.Marks.Visible := cbDisplayMarks.Checked;
  SerieLineSNEIngPropSinInsc.Marks.Visible    := cbDisplayMarks.Checked;
end;

procedure TWCrMaxFnEd.sbPopupExportarClick(Sender: TObject);
var
  sb: TSpeedButton;
begin
  if Sender is TSpeedButton then
  begin
    sb := TSpeedButton (Sender);
    sb.PopupMenu.Popup (sb.Left + ClientOrigin.x, sb.Top  + sb.Height + ClientOrigin.y);
  end;
end;

procedure TWCrMaxFnEd.PopupMenuGraficaTabla(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := True;
  (Sender as TMenuItem).GetParentMenu.Tag := (Sender as TMenuItem).Tag;
end;

procedure TWCrMaxFnEd.ExportarExcel (FileName: string; Opciones: byte = 3);
var
  XLApp, XLSheet: Variant;
  Range, Chart, Serie: Variant;
  r, c, SheetNum: integer;
  RangeName: boolean;
  s: string;
  Version: integer;

  procedure BorderRange (RangeStr: string);
  begin
    Range                                        := XLSheet.Range [RangeStr];

    Range.Borders [xlDiagonalDown].LineStyle     := xlNone;
    Range.Borders [xlDiagonalUp].LineStyle       := xlNone;
    Range.Borders [xlEdgeLeft].LineStyle         := xlContinuous;
    Range.Borders [xlEdgeLeft].ColorIndex        := 0;
    Range.Borders [xlEdgeLeft].TintAndShade      := 0;
    Range.Borders [xlEdgeLeft].Weight            := xlMedium;

    Range.Borders [xlEdgeTop].LineStyle          := xlContinuous;
    Range.Borders [xlEdgeTop].ColorIndex         := 0;
    Range.Borders [xlEdgeTop].TintAndShade       := 0;
    Range.Borders [xlEdgeTop].Weight             := xlMedium;

    Range.Borders [xlEdgeBottom].LineStyle       := xlContinuous;
    Range.Borders [xlEdgeBottom].ColorIndex      := 0;
    Range.Borders [xlEdgeBottom].TintAndShade    := 0;
    Range.Borders [xlEdgeBottom].Weight          := xlMedium;

    Range.Borders [xlEdgeRight].LineStyle        := xlContinuous;
    Range.Borders [xlEdgeRight].ColorIndex       := 0;
    Range.Borders [xlEdgeRight].TintAndShade     := 0;
    Range.Borders [xlEdgeRight].Weight           := xlMedium;

    Range.Borders [xlInsideVertical].LineStyle   := xlNone;
    Range.Borders [xlInsideHorizontal].LineStyle := xlNone;
  end;


begin
  Version := -1;
  try
    XLApp   := CreateOleObject('Excel.Application.14');
    Version := 2010;
  except on E: EOleSysError do
    if E.ErrorCode = HRESULT($800401F3) then
    try
      XLApp   := CreateOleObject('Excel.Application.12');
      Version := 2007;
    except on E: EOleSysError do
      if E.ErrorCode = HRESULT($800401F3) then
      try
        XLApp   := CreateOleObject('Excel.Application.11');
        Version := 2003;
      except on E: EOleSysError do
        if E.ErrorCode = HRESULT($800401F3) then
        try
          XLApp   := CreateOleObject('Excel.Application.10');
          Version := 1997;
        except on E: EOleSysError do;
        end;
      end;
    end;
  end;

  if Version = -1 then
  begin
    MessageDlg ('No hay una versión instalada de Excel. Favor de contactar a sistemas.', mtError, [mbOk], 0);
    exit;
  end
  else if Version < 2003 then
  begin
    MessageDlg ('Se requiere al menos una versión 2003 de Excel. Favor de contactar a sistemas.', mtError, [mbOk], 0);
    exit;
  end;

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

    XLSheet.Cells [1,  1].Formula := 'Límite Máximo de Financiamiento a Estados';

    XLSheet.Cells [2,  2].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [2, 15].Formula := 'Índice de Capitalización: $' + edIndiceCapitalizacion.Text;
    XLSheet.Cells [3, 15].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];

    XLSheet.Cells [4,  3].Formula := 'Fideicomiso';
    XLSheet.Cells [4,  9].Formula := 'Mandato';
    XLSheet.Cells [4, 15].Formula := 'Sin Estructura';

    XLSheet.Range ['A1:T1'].Merge;

    XLSheet.Range ['B2:H2'].Merge;
    XLSheet.Range ['O2:T2'].Merge;
    XLSheet.Range ['O3:T3'].Merge;

    XLSheet.Range ['C4:H4'].Merge;
    XLSheet.Range ['I4:N4'].Merge;
    XLSheet.Range ['O4:T4'].Merge;

    XLSheet.Range ['C5:D5'].Merge;
    XLSheet.Range ['E5:F5'].Merge;
    XLSheet.Range ['G5:H5'].Merge;
    XLSheet.Range ['I5:J5'].Merge;
    XLSheet.Range ['K5:L5'].Merge;
    XLSheet.Range ['M5:N5'].Merge;
    XLSheet.Range ['O5:P5'].Merge;
    XLSheet.Range ['Q5:R5'].Merge;
    XLSheet.Range ['S5:T5'].Merge;

{    XLSheet.Range ['C5'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['E5'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['G5'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['I5'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['K5'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['M5'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['O5'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['Q5'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['S5'].HorizontalAlignment    := xlHAlignCenter;}
    XLSheet.Range ['B4:T6'].HorizontalAlignment := xlHAlignCenter;

    for r := 0 to sagDatos.RowCount - 1 do
      for c := 0 to sagDatos.ColCount - 1 do
        XLSheet.Cells [r + 5, c + 1].Formula := sagDatos.Cells [c, r];

    for c := 1 to sagDatos.ColCount - 1 do
    begin
      Range                              := XLSheet.Range [Chr (Ord ('A') + c) + '4:' + Chr (Ord ('A') + c) + IntToStr (sagDatos.RowCount + 4)];
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      if      c in [2, 3, 6, 7] then
      begin
        Range.Interior.ThemeColor          := xlThemeColorAccent1;
        Range.Interior.TintAndShade        := 0.799981688894314;
      end
      else if c in [4, 5] then
      begin
        Range.Interior.ThemeColor          := xlThemeColorLight2;
        Range.Interior.TintAndShade        := 0.799981688894314;
      end
      else if c in [10, 11] then
      begin
        Range.Interior.ThemeColor          := xlThemeColorAccent6;
        Range.Interior.TintAndShade        := 0.799981688894314;
      end
      else if c in [8, 9, 12, 13] then
      begin
        Range.Interior.ThemeColor          := xlThemeColorAccent6;
        Range.Interior.TintAndShade        := 0.599993896298105;
      end
      else if c in [14, 15, 18, 19] then
      begin
        Range.Interior.ThemeColor          := xlThemeColorAccent3;
        Range.Interior.TintAndShade        := 0.799981688894314;
      end
      else if c in [16, 17] then
      begin
        Range.Interior.ThemeColor          := xlThemeColorAccent3;
        Range.Interior.TintAndShade        := 0.599993896298105;
      end
      else
      begin
        Range.Interior.ThemeColor          := xlThemeColorDark1;
        Range.Interior.TintAndShade        := -4.99893185216834E-02;
      end
    end;

    Range                      := XLSheet.Range ['A1'];
    Range.HorizontalAlignment  := xlHAlignCenter;
    Range.Font.Bold            := True;

    Range                      := XLSheet.Range ['O2:T3'];
    Range.HorizontalAlignment  := xlHAlignRight;

    Range                      := XLSheet.Range ['A4:' + Chr (Ord ('A') + sagDatos.ColCount) + '5'];
    Range.HorizontalAlignment  := xlHAlignCenter;
    Range.Font.Color           := clNavy;

    Range                      := XLSheet.Range ['C5:' + Chr (Ord ('A') + sagDatos.ColCount) + IntToStr (sagDatos.RowCount + 4)];
    Range.NumberFormat         := '#,##0.00';

    BorderRange ('A4:' + Chr (Ord ('A') - 1 + sagDatos.ColCount) + IntToStr (sagDatos.RowCount + 4));

    BorderRange ('A4:A' + IntToStr (sagDatos.RowCount + 4));
    BorderRange ('C4:H' + IntToStr (sagDatos.RowCount + 4));
    BorderRange ('I4:N' + IntToStr (sagDatos.RowCount + 4));
    BorderRange ('O4:T' + IntToStr (sagDatos.RowCount + 4));

    BorderRange ('A4:A6');
    BorderRange ('B4:B6');
    BorderRange ('C4:H6');
    BorderRange ('I4:N6');
    BorderRange ('O4:T6');

    XLSheet.UsedRange.Columns ['A'].AutoFit;
    XLSheet.Range ['B7'].Select;
    XLApp.ActiveWindow.FreezePanes := True;
    {Termina la generación de la tabla}


    {Inicia la generación de la gráfica}
    if (Opciones and $0002) = $0002 then
    begin
      XLApp.Workbooks [1].WorkSheets.Add (Null, XLApp.Workbooks [1].WorkSheets [1]);

      if rgInfoDesplegar.ItemIndex = 0 then
        s := 'P.I., '
      else
        s := '';

      if cbFideicomiso.Checked then
        s := s + 'Fideicomiso, ';

      if cbMandato.Checked then
        s := s + 'Mandato, ';

      if cbSinEstructura.Checked then
        s := s + 'Sin estructura, ';

      s := Copy (s, 1, Length (s) - 2);
      s := Format ('%s para %s.', [rgInfoDesplegar.Items [rgInfoDesplegar.ItemIndex], s]);

      XLSheet                       := XLApp.Workbooks[1].WorkSheets[SheetNum];
      XLSheet.Name                  := 'Gráfica';
      XLSheet.Cells [1,  1].Formula := 'Límite Máximo de Financiamiento a Estados';
      XLSheet.Cells [2,  1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
      XLSheet.Cells [2,  5].Formula := s;
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

      Chart := XLSheet.ChartObjects.Add (10, 50, 820, 320);

      if rgTipoGrafica.ItemIndex = 0 then
      begin
        if rgProyeccion.ItemIndex = 0 then
          Chart.Chart.ChartType := xlColumnClustered
        else
          Chart.Chart.ChartType := xl3DColumnClustered
      end
      else
      begin
        if rgProyeccion.ItemIndex = 0 then
          Chart.Chart.ChartType := xlLine
        else
          Chart.Chart.ChartType := xl3DLine
      end;

      Chart.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[1].Range['A3:A' + IntToStr (sagDatos.RowCount + 1)], xlColumns);

      Chart.Chart.SeriesCollection [1].Delete;

      if rgInfoDesplegar.ItemIndex = 0 then
      begin
        Serie         := Chart.Chart.SeriesCollection.NewSeries;
        Serie.Name    := '="Pct PI"';
        Serie.Values  := '=Tabla!$B$7:$B$' + IntToStr (sagDatos.RowCount + 4);
        Serie.XValues := '=Tabla!$A$7:$A$' + IntToStr (sagDatos.RowCount + 4);

        Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorBackground1;
        Serie.Format.Line.ForeColor.TintAndShade     := 0;

        if Version >= 2010 then
          Serie.Format.Line.ForeColor.Brightness     := 0;

        Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorBackground1;
        Serie.Format.Line.ForeColor.TintAndShade     := 0;

        if Version >= 2010 then
          Serie.Format.Line.ForeColor.Brightness     := -0.5;

        Serie.Format.Line.Transparency               := 0;

        if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
        begin
          Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorBackground1;
          Serie.Format.Fill.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Fill.ForeColor.Brightness     := 0;

          Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorBackground1;
          Serie.Format.Fill.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Fill.ForeColor.Brightness     := -0.5;

          Serie.Format.Fill.Transparency               := 0;
        end;

        if cbDisplayMarks.Checked then
          Serie.ApplyDataLabels;

        if cbFideicomiso.Checked then
        begin
          Serie        := Chart.Chart.SeriesCollection.NewSeries;
          Serie.Name   := '="FID. Part. Fed. Insc. Fed."';
          Serie.Values := '=Tabla!$C$7:$C$' + IntToStr (sagDatos.RowCount + 4);

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorText2;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorText2;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0.400000006;

          Serie.Format.Line.Transparency               := 0;

          if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
          begin
            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorText2;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0;

            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorText2;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0.400000006;

            Serie.Format.Fill.Transparency               := 0;
          end;

          if cbDisplayMarks.Checked then
            Serie.ApplyDataLabels;

          Serie        := Chart.Chart.SeriesCollection.NewSeries;
          Serie.Name   := '="FID. Apor. Fed. Insc. Fed."';
          Serie.Values := '=Tabla!$E$7:$E$' + IntToStr (sagDatos.RowCount + 4);

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent1;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent1;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := -0.25;

          Serie.Format.Line.Transparency               := 0;

          if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
          begin
            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent1;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0;

            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent1;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := -0.25;

            Serie.Format.Fill.Transparency               := 0;
          end;

          if cbDisplayMarks.Checked then
            Serie.ApplyDataLabels;

          Serie        := Chart.Chart.SeriesCollection.NewSeries;
          Serie.Name   := '="FID. Ing. Prop. Insc. Fed."';
          Serie.Values := '=Tabla!$G$7:G$' + IntToStr (sagDatos.RowCount + 4);

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorText2;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0;
          if (rgTipoGrafica.ItemIndex = 1) and (rgProyeccion.ItemIndex = 0) then
            Serie.Format.Line.DashStyle                := msoLineDash;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorText2;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0.400000006;

          Serie.Format.Line.Transparency               := 0;
          if rgTipoGrafica.ItemIndex = 1 then
          begin
            if rgProyeccion.ItemIndex = 0 then
              Serie.Format.Line.DashStyle := msoLineDash
            else
              Serie.Format.Fill.Patterned (msoPatternOutlinedDiamond);
          end;

          if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
          begin
            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorText2;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0;

            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorText2;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0.400000006;

            Serie.Format.Fill.Transparency               := 0;

            Serie.Format.Fill.Patterned (msoPatternOutlinedDiamond);
          end;

          if cbDisplayMarks.Checked then
            Serie.ApplyDataLabels;
        end;

        if cbMandato.Checked then
        begin
          Serie        := Chart.Chart.SeriesCollection.NewSeries;
          Serie.Name   := '="MAN. Part. Fed. Insc. Fed."';
          Serie.Values := '=Tabla!$I$7:$I$' + IntToStr (sagDatos.RowCount + 4);

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := -0.25;
          Serie.Format.Line.Transparency               := 0;

          if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
          begin
            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0;

            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := -0.25;

            Serie.Format.Fill.Transparency               := 0;
          end;

          if cbDisplayMarks.Checked then
            Serie.ApplyDataLabels;

          Serie        := Chart.Chart.SeriesCollection.NewSeries;
          Serie.Name   := '="MAN. Apor. Fed. Insc. Fed."';
          Serie.Values := '=Tabla!$K$7:$K$' + IntToStr (sagDatos.RowCount + 4);

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0.400000006;

          Serie.Format.Line.Transparency               := 0;

          if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
          begin
            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0;

            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0.400000006;

            Serie.Format.Fill.Transparency               := 0;
          end;

          if cbDisplayMarks.Checked then
            Serie.ApplyDataLabels;

          Serie        := Chart.Chart.SeriesCollection.NewSeries;
          Serie.Name   := '="MAN. Ing. Prop. Insc. Fed."';
          Serie.Values := '=Tabla!$M$7:M$' + IntToStr (sagDatos.RowCount + 4);

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0;

          if rgTipoGrafica.ItemIndex = 1 then
          begin
            if rgProyeccion.ItemIndex = 0 then
              Serie.Format.Line.DashStyle := msoLineDash
            else
              Serie.Format.Fill.Patterned (msoPatternOutlinedDiamond);
          end;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := -0.25;

          Serie.Format.Line.Transparency               := 0;
          if (rgTipoGrafica.ItemIndex = 1) and (rgProyeccion.ItemIndex = 0) then
            Serie.Format.Line.DashStyle                := msoLineDash;

          if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
          begin
            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0;

            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := -0.25;

            Serie.Format.Fill.Transparency               := 0;

            Serie.Format.Fill.Patterned (msoPatternOutlinedDiamond);
          end;

          if cbDisplayMarks.Checked then
            Serie.ApplyDataLabels;
        end;

        if cbSinEstructura.Checked then
        begin
          Serie        := Chart.Chart.SeriesCollection.NewSeries;
          Serie.Name   := '="SNE. Ing. Prop. Insc. Fed."';
          Serie.Values := '=Tabla!$O$7:$O$' + IntToStr (sagDatos.RowCount + 4);

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0.400000006;

          Serie.Format.Line.Transparency               := 0;

          if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
          begin
            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0;

            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0.400000006;

            Serie.Format.Fill.Transparency               := 0;
          end;

          if cbDisplayMarks.Checked then
            Serie.ApplyDataLabels;

          Serie        := Chart.Chart.SeriesCollection.NewSeries;
          Serie.Name   := '="SNE. Ing. Prop. Insc. Est."';
          Serie.Values := '=Tabla!$Q$7:$Q$' + IntToStr (sagDatos.RowCount + 4);

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := -0.25;

          Serie.Format.Line.Transparency               := 0;

          if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
          begin
            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0;

            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := -0.25;

            Serie.Format.Fill.Transparency               := 0;
          end;

          if cbDisplayMarks.Checked then
            Serie.ApplyDataLabels;

          Serie        := Chart.Chart.SeriesCollection.NewSeries;
          Serie.Name   := '="SNE. Ing. Prop. Sin Insc."';
          Serie.Values := '=Tabla!$S$7:S$' + IntToStr (sagDatos.RowCount + 4);

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0;

          if (rgTipoGrafica.ItemIndex = 1) and (rgProyeccion.ItemIndex = 0) then
            Serie.Format.Line.DashStyle                := msoLineDash;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0.400000006;

          Serie.Format.Line.Transparency               := 0;
          if rgTipoGrafica.ItemIndex = 1 then
          begin
            if rgProyeccion.ItemIndex = 0 then
              Serie.Format.Line.DashStyle := msoLineDash
            else
              Serie.Format.Fill.Patterned (msoPatternOutlinedDiamond);
          end;

          if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
          begin
            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0;

            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0.400000006;

            Serie.Format.Fill.Transparency               := 0;

            Serie.Format.Fill.Patterned (msoPatternOutlinedDiamond);
          end;

          if cbDisplayMarks.Checked then
            Serie.ApplyDataLabels;
        end;
      end
      else
      begin
        RangeName := False;
        if cbFideicomiso.Checked then
        begin
          Serie         := Chart.Chart.SeriesCollection.NewSeries;
          Serie.Name    := '="FID. Part. Fed. Insc. Fed."';
          Serie.Values  := '=Tabla!$D$7:$D$' + IntToStr (sagDatos.RowCount + 4);
          Serie.XValues := '=Tabla!$A$7:$A$' + IntToStr (sagDatos.RowCount + 4);
          RangeName     := True;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorText2;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorText2;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0.400000006;
          Serie.Format.Line.Transparency               := 0;

          if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
          begin
            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorText2;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0;

            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorText2;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0.400000006;

            Serie.Format.Fill.Transparency               := 0;
          end;

          if cbDisplayMarks.Checked then
            Serie.ApplyDataLabels;

          Serie         := Chart.Chart.SeriesCollection.NewSeries;
          Serie.Name    := '="FID. Apor. Fed. Insc. Fed."';
          Serie.Values  := '=Tabla!$F$7:$F$' + IntToStr (sagDatos.RowCount + 4);

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent1;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent1;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := -0.25;
          Serie.Format.Line.Transparency               := 0;

          if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
          begin
            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent1;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0;

            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent1;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := -0.25;
            Serie.Format.Fill.Transparency               := 0;
          end;

          if cbDisplayMarks.Checked then
            Serie.ApplyDataLabels;

          Serie         := Chart.Chart.SeriesCollection.NewSeries;
          Serie.Name    := '="FID. Ing. Prop. Insc. Fed."';
          Serie.Values  := '=Tabla!$H$7:H$' + IntToStr (sagDatos.RowCount + 4);

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorText2;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0;

          if (rgTipoGrafica.ItemIndex = 1) and (rgProyeccion.ItemIndex = 0) then
            Serie.Format.Line.DashStyle                := msoLineDash;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorText2;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0.400000006;

          Serie.Format.Line.Transparency               := 0;
          if rgTipoGrafica.ItemIndex = 1 then
          begin
            if rgProyeccion.ItemIndex = 0 then
              Serie.Format.Line.DashStyle := msoLineDash
            else
              Serie.Format.Fill.Patterned (msoPatternOutlinedDiamond);
          end;

          if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
          begin
            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorText2;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0;

            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorText2;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0.400000006;

            Serie.Format.Fill.Transparency               := 0;

            Serie.Format.Fill.Patterned (msoPatternOutlinedDiamond);
          end;

          if cbDisplayMarks.Checked then
            Serie.ApplyDataLabels;
        end;

        if cbMandato.Checked then
        begin
          Serie        := Chart.Chart.SeriesCollection.NewSeries;
          Serie.Name   := '="MAN. Part. Fed. Insc. Fed."';
          Serie.Values := '=Tabla!$J$7:$J$' + IntToStr (sagDatos.RowCount + 4);

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := -0.25;

          Serie.Format.Line.Transparency               := 0;

          if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
          begin
            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0;

            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := -0.25;

            Serie.Format.Fill.Transparency               := 0;
          end;

          if cbDisplayMarks.Checked then
            Serie.ApplyDataLabels;

          if not RangeName then
          begin
            Serie.XValues := '=Tabla!$A$7:$A$' + IntToStr (sagDatos.RowCount + 4);
            RangeName     := True;
          end;

          Serie        := Chart.Chart.SeriesCollection.NewSeries;
          Serie.Name   := '="MAN. Apor. Fed. Insc. Fed."';
          Serie.Values := '=Tabla!$L$7:$L$' + IntToStr (sagDatos.RowCount + 4);

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0.400000006;

          Serie.Format.Line.Transparency               := 0;

          if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
          begin
            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0;

            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness       := 0.400000006;

            Serie.Format.Fill.Transparency               := 0;
          end;

          if cbDisplayMarks.Checked then
            Serie.ApplyDataLabels;

          Serie        := Chart.Chart.SeriesCollection.NewSeries;
          Serie.Name   := '="MAN. Ing. Prop. Insc. Fed."';
          Serie.Values := '=Tabla!$N$7:N$' + IntToStr (sagDatos.RowCount + 4);

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0;

          if rgTipoGrafica.ItemIndex = 1 then
          begin
            if rgProyeccion.ItemIndex = 0 then
              Serie.Format.Line.DashStyle := msoLineDash
            else
              Serie.Format.Fill.Patterned (msoPatternOutlinedDiamond);
          end;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := -0.25;

          Serie.Format.Line.Transparency               := 0;
          if (rgTipoGrafica.ItemIndex = 1) and (rgProyeccion.ItemIndex = 0) then
            Serie.Format.Line.DashStyle                := msoLineDash;

          if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
          begin
            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0;

            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent6;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := -0.25;

            Serie.Format.Fill.Transparency               := 0;

            Serie.Format.Fill.Patterned (msoPatternOutlinedDiamond);
          end;

          if cbDisplayMarks.Checked then
            Serie.ApplyDataLabels;
        end;

        if cbSinEstructura.Checked then
        begin
          Serie        := Chart.Chart.SeriesCollection.NewSeries;
          Serie.Name   := '="SNE. Ing. Prop. Insc. Fed."';
          Serie.Values := '=Tabla!$P$7:$P$' + IntToStr (sagDatos.RowCount + 4);

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0.400000006;

          Serie.Format.Line.Transparency               := 0;

          if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
          begin
            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0;

            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0.400000006;

            Serie.Format.Fill.Transparency               := 0;
          end;

          if cbDisplayMarks.Checked then
            Serie.ApplyDataLabels;

          if not RangeName then
            Serie.XValues := '=Tabla!$A$7:$A$' + IntToStr (sagDatos.RowCount + 4);

          Serie        := Chart.Chart.SeriesCollection.NewSeries;
          Serie.Name   := '="SNE. Ing. Prop. Insc. Est."';
          Serie.Values := '=Tabla!$R$7:$R$' + IntToStr (sagDatos.RowCount + 4);

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := -0.25;

          Serie.Format.Line.Transparency               := 0;

          if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
          begin
            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0;

            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := -0.25;

            Serie.Format.Fill.Transparency               := 0;
          end;

          if cbDisplayMarks.Checked then
            Serie.ApplyDataLabels;

          Serie        := Chart.Chart.SeriesCollection.NewSeries;
          Serie.Name   := '="SNE. Ing. Prop. Sin Insc."';
          Serie.Values := '=Tabla!$T$7:T$' + IntToStr (sagDatos.RowCount + 4);

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0;

          if (rgTipoGrafica.ItemIndex = 1) and (rgProyeccion.ItemIndex = 0) then
            Serie.Format.Line.DashStyle                := msoLineDash;

          Serie.Format.Line.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
          Serie.Format.Line.ForeColor.TintAndShade     := 0;

          if Version >= 2010 then
            Serie.Format.Line.ForeColor.Brightness     := 0.400000006;

          Serie.Format.Line.Transparency               := 0;
          if rgTipoGrafica.ItemIndex = 1 then
          begin
            if rgProyeccion.ItemIndex = 0 then
              Serie.Format.Line.DashStyle := msoLineDash
            else
              Serie.Format.Fill.Patterned (msoPatternOutlinedDiamond);
          end;

          if (rgTipoGrafica.ItemIndex = 0) or (rgProyeccion.ItemIndex = 1) then
          begin
            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0;

            Serie.Format.Fill.ForeColor.ObjectThemeColor := msoThemeColorAccent3;
            Serie.Format.Fill.ForeColor.TintAndShade     := 0;

            if Version >= 2010 then
              Serie.Format.Fill.ForeColor.Brightness     := 0.400000006;

            Serie.Format.Fill.Transparency               := 0;

            Serie.Format.Fill.Patterned (msoPatternOutlinedDiamond);
          end;

          if cbDisplayMarks.Checked then
            Serie.ApplyDataLabels;
        end;
      end;
    end;
    {Termina la generación de la gráfica}

    {Verifica si se debe desplegar la tabla}
    if (Opciones and $0001) = $0001 then
      XLApp.Workbooks[1].WorkSheets[1].Activate
    else
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


procedure TWCrMaxFnEd.sbExportarClick(Sender: TObject);
var
  XLApp: Variant;
begin
  sbExportar.Refresh;
  if SaveXLS.Execute then
  begin
    Cursor := crHourGlass;
    try
      ExportarExcel (SaveXLS.FileName, pmExportar.Tag);
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

procedure TWCrMaxFnEd.QIndiceCapitalizacionAfterOpen(DataSet: TDataSet);
  function Money (f: double): string;
  begin
    result := Format ('%m', [f]);
    result := Copy (result, 1, Length (result) - 2);
  end;

begin
  edIndiceCapitalizacion.Text := Money (QIndiceCapitalizacion.FieldByName ('Imp_Capital_Basico').AsFloat);
end;

procedure TWCrMaxFnEd.sbImprimirClick(Sender: TObject);
var
  factor: double;
begin
  factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: factor := 1;
    1: factor := 1000;
    2: factor := 1000000;
  end;

  RepLimiteMaximoFinanEdos (dpFecha.DateTime, factor, Objeto.Apli, True);
end;

end.




