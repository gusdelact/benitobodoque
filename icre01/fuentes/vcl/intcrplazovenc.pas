// Sistema         : Clase de CrPlzVenc
// Fecha de Inicio : 03/05/2012
// Función forma   : Clase de CrPlzVenc
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qforlxvhziifraxzhgil
// Comentarios     :
Unit IntCrPlazoVenc;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, Ungene, IntSGCtrl,
  ShellAPI, ComObj, IntQrPlazoVenc, IntQrPlazoVencDesg;

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
 TCrPlzVenc= class; 

  TWCrPlzVenc=Class(TForm)
    InterForma1             : TInterForma;
    Panel1: TPanel;
    btBusca: TBitBtn;
    QResumen: TQuery;
    QDesglosado: TQuery;
    Label1: TLabel;
    dpFecha: TDateTimePicker;
    GroupBox1: TGroupBox;
    cbEstados: TCheckBox;
    cbMunicipios: TCheckBox;
    cbOrgDesc: TCheckBox;
    cbPrivado: TCheckBox;
    rgFactorMoneda: TRadioGroup;
    QResumenDesc_Mercado: TStringField;
    QResumenImpagado: TFloatField;
    QResumenHasta_12_Meses: TFloatField;
    QResumenDe_13_A_36_Meses: TFloatField;
    QResumenDe_37_A_60_Meses: TFloatField;
    QResumenMas_De_60_Meses: TFloatField;
    QResumenG1: TFloatField;
    QFechas: TQuery;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    sgPlazoVto: TSGCtrl;
    sgPlazoDesglose: TSGCtrl;
    QDesglosadoDesc_Mercado: TStringField;
    QDesglosadoDesc_Rango: TStringField;
    QDesglosadoG1: TFloatField;
    QDesglosadoImp_Trim_Ant: TFloatField;
    QDesglosadoPct_Trim_Ant: TFloatField;
    QDesglosadoImp_Mes_Act: TFloatField;
    QDesglosadoPct_Mes_Act: TFloatField;
    QDesglosadoImp_Diferencia: TFloatField;
    QDesglosadoPct_Diferencia: TFloatField;
    QDesglosadoImp_Trim_Ant_Anio_Sig: TFloatField;
    QDesglosadoPct_Trim_Ant_Anio_Sig: TFloatField;
    cbFederal: TCheckBox;
    sbExportar: TSpeedButton;
    SaveXLS: TSaveDialog;
    QLeyendaEntidades: TQuery;
    QDesgloseCredito: TQuery;
    cbInteresesAnticipados: TCheckBox;
    sbExportarDetalleXLS: TSpeedButton;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sgPlazoVtoCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure InterForma1BtnAyudaClick(Sender: TObject);
    procedure GeneraDatosEvent(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbExportarDetalleXLSClick(Sender: TObject);
    private
    { Private declarations }
      procedure generaDatos();
      function ConstruyeTipoEntidad: string;
      procedure ExportarXLS (FileName: string);
      procedure ExportarDetalleXLS (FileName: string);
    public
    { Public declarations }
    Objeto : TCrPlzVenc;
  end;

 
 TCrPlzVenc= class(TInterFrame) 
      private
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override;
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

constructor TCrPlzVenc.Create( AOwner : TComponent );
begin
  Inherited;

  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntCrPlzVenc.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrPlzVenc.Destroy;
begin
  inherited;
end;


function TCrPlzVenc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W: TWCrPlzVenc;
begin
   W := TWCrPlzVenc.Create(Self);
   try
      W.Objeto                    := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrPlzVenc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrplzve.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrPlzVenc.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CrPlzVenc********************)
(*                                                                              *)
(*  FORMA DE CrPlzVenc                                                            *)
(*                                                                              *)
(***********************************************FORMA CrPlzVenc********************)

procedure TWCrPlzVenc.FormShow(Sender: TObject);
begin
  InterForma1.BtnAyuda.Caption := '&Imprimir';
  dpFecha.Date := Objeto.Apli.DameFechaEmpresa;
  generaDatos;
end;

procedure TWCrPlzVenc.FormDestroy(Sender: TObject);
begin
  //Objeto
end;

procedure TWCrPlzVenc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrPlzVenc.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrPlzVenc.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrPlzVenc.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;

function TWCrPlzVenc.ConstruyeTipoEntidad: string;
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

procedure TWCrPlzVenc.generaDatos;
var
  Factor: double;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  //Abre la consulta que determina, a partir de la fecha de parámetro, el último día del trimestre anterior,
  //así como el último día del trimestre anterior para el siguiente año.
  QFechas.Close;
  QFechas.DatabaseName                   := Objeto.Apli.DataBaseName;
  QFechas.SessionName                    := Objeto.Apli.SessionName;
  QFechas.ParamByName ('peFecha').AsDate := dpFecha.Date;
  QFechas.Open;

  QDesglosadoImp_Trim_Ant.DisplayLabel          := '            ' + QFechas.FieldByName ('Trim_Ant').AsString   + ' ($)';
  QDesglosadoImp_Trim_Ant_Anio_Sig.DisplayLabel := '            ' + QFechas.FieldByName ('Trim_AntSA').AsString + ' ($)';

  QResumen.Close;
  QResumen.DatabaseName                            := Objeto.Apli.DataBaseName;
  QResumen.SessionName                             := Objeto.Apli.SessionName;
  QResumen.ParamByName ('peFecha').AsDate          := dpFecha.Date;
  QResumen.ParamByName ('peFactor').AsFloat        := Factor;
  QResumen.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QResumen.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
  QResumen.Open;

  QDesglosado.Close;
  QDesglosado.DatabaseName                            := Objeto.Apli.DataBaseName;
  QDesglosado.SessionName                             := Objeto.Apli.SessionName;
  QDesglosado.ParamByName ('peFecha').AsDate          := dpFecha.Date;
  QDesglosado.ParamByName ('peFechaTA').AsDate        := QFechas.FieldByName ('Fin_Trim_Ant').AsDateTime;
  QDesglosado.ParamByName ('peFechaTASA').AsDate      := QFechas.FieldByName ('Fin_Trim_Ant_SA').AsDateTime;
  QDesglosado.ParamByName ('peFactor').AsFloat        := Factor;
  QDesglosado.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QDesglosado.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
  QDesglosado.Open;

  QLeyendaEntidades.Close;
  QLeyendaEntidades.DatabaseName                            := Objeto.Apli.DataBaseName;
  QLeyendaEntidades.SessionName                             := Objeto.Apli.SessionName;
  QLeyendaEntidades.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QLeyendaEntidades.Open;

  sgPlazoVto.BeginGrid;

  sgPlazoVto.Titulo1 := 'Cartera por Plazo de Vencimiento';
  sgPlazoVto.EndCaption;

  if QResumen.RecordCount > 0 then
    sgPlazoVto.AddQry(QResumen, // Query
        True,                   // Iniciar Grid, Limpiar Lineas Anteriores.
        True,                   // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
        -1,                     // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
        ALTO_COL,               // Alto del Header, -1 es el Default 32 Columnas
        ALTO_DOBLE,             // Alto del las Lineas, 1 es el Default 32
        True)                   // ShowTitle
  else
    sgPlazoVto.AddTitle('NO EXISTEN DATOS', TcCenter);

  sgPlazoVto.ShowTab          := True;
  sgPlazoVto.ShowBtnFirst     := True;
  sgPlazoVto.ShowBtnLast      := True;
  sgPlazoVto.ShowBtnPriorNext := True;
  sgPlazoVto.EndGrid;

  sgPlazoDesglose.BeginGrid;

  sgPlazoDesglose.Titulo1 := 'Cartera por Plazo de Vencimiento';
  sgPlazoDesglose.EndCaption;

  if QResumen.RecordCount > 0 then
    sgPlazoDesglose.AddQry(QDesglosado, // Query
        True,                           // Iniciar Grid, Limpiar Lineas Anteriores.
        True,                           // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
        -1,                             // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
        ALTO_COL,                       // Alto del Header, -1 es el Default 32 Columnas
        ALTO_DOBLE,                     // Alto del las Lineas, 1 es el Default 32
        True)                           // ShowTitle
  else
    sgPlazoDesglose.AddTitle('NO EXISTEN DATOS', TcCenter);

  sgPlazoDesglose.ShowTab          := True;
  sgPlazoDesglose.ShowBtnFirst     := True;
  sgPlazoDesglose.ShowBtnLast      := True;
  sgPlazoDesglose.ShowBtnPriorNext := True;
  sgPlazoDesglose.EndGrid;
end;

procedure TWCrPlzVenc.sgPlazoVtoCalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
begin
  if RowCaso = rcRowBegin then
  begin
    (Sendet as TSGCtrl).SetActualHeight (ALTO_COL);
    if DataSet.FieldByName ('G1').AsInteger = 1 then
      (Sendet as TSGCtrl).SetActualAsHeader;
  end;
end;

procedure TWCrPlzVenc.InterForma1BtnAyudaClick(Sender: TObject);
var
  Factor: double;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  try
    QrPlzVenc.genRPTPlzVenc(dpFecha.Date, QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString, Factor, cbInteresesAnticipados.Checked, QResumen, Objeto.Apli, True);
  except
    MessageDlg('No es posible mostrar el Reporte -IntQrPlazoVenc-', mtError, [mbOK], 0);
  end;

  try
    QrPlazoVencDesg.genRPTPlzVenc(dpFecha.Date, QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString, Factor, QDesglosado, Objeto.Apli, True);
  except
    MessageDlg('No es posible mostrar el Reporte -IntQrPlazoVencDesg-', mtError, [mbOK], 0);
  end;
end;

procedure TWCrPlzVenc.GeneraDatosEvent(Sender: TObject);
begin
  generaDatos;
end;

function Translate (s, cfrom, cto: string): string;
var
  i, p, l: integer;

begin
  result := s;
  l      := Length (cto);

  for i := 1 to Length (result) do
  begin
    p := Pos (result [i], cfrom);

    if p > 0 then
    begin
      if p <= l then
        result [i] := cto [p]
      else
        result [i] := ' ';
    end;
  end;
end;

procedure TWCrPlzVenc.ExportarXLS (FileName: string);
var
  XLApp, XLSheet, Range: Variant;
  Chart, Serie: Variant;
  Row, RowIni, XIni, YFin, Hoja: integer;
  MaxWidth: double;
  PrevBanca, CurrBanca, Banca30: string;
begin
  XLApp := CreateOleObject('Excel.Application');
  try
    Cursor              := crHourGlass;
    XLApp.Visible       := False;
    XLApp.DisplayAlerts := False;
    XLApp.Workbooks.Add(xlWBatWorkSheet);

    {Inicia la generación de la tabla resumen}
    XLSheet      := XLApp.Workbooks[1].WorkSheets[1];
    XLSheet.Name := 'Resumen';

    {Encabezado del reporte}
    XLSheet.Cells [1, 1].Formula := Caption;  // Título del reporte
    XLSheet.Range ['A1:F1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [2, 1].Formula := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['A2:F2'].Merge;
    XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [3, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [3, 2].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['B3:F3'].Merge;
    XLSheet.Range ['B3'].HorizontalAlignment := xlHAlignRight;

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 1].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 1].Formula := 'No incluye intereses cobrados por anticipado';

    {Encabezado de las columnas}
    XLSheet.Cells [6, 1].Formula := 'Banca';
    XLSheet.Cells [6, 2].Formula := 'Impagado';
    XLSheet.Cells [6, 3].Formula := 'Hasta 12 Meses';
    XLSheet.Cells [5, 4].Formula := 'De 13 Meses';
    XLSheet.Cells [6, 4].Formula := 'hasta 36 Meses';
    XLSheet.Cells [5, 5].Formula := 'De 37 Meses';
    XLSheet.Cells [6, 5].Formula := 'hasta 60 meses';
    XLSheet.Cells [5, 6].Formula := 'Mayores';
    XLSheet.Cells [6, 6].Formula := 'de 61 Meses';

    XLSheet.Range ['A1:F6'].Font.Bold           := True;
    XLSheet.Range ['A5:F6'].HorizontalAlignment := xlHAlignCenter;

    Range                     := XLSheet.Range ['A5:F6'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row    := 7;
    RowIni := Row;
    QResumen.First;
    while not QResumen.Eof do
    begin
      XLSheet.Cells [Row, 1].Formula := QResumen.FieldByName ('Desc_Mercado').AsString;
      XLSheet.Cells [Row, 2].Formula := QResumen.FieldByName ('Impagado').AsString;
      XLSheet.Cells [Row, 3].Formula := QResumen.FieldByName ('Hasta_12_Meses').AsString;
      XLSheet.Cells [Row, 4].Formula := QResumen.FieldByName ('De_13_A_36_Meses').AsString;
      XLSheet.Cells [Row, 5].Formula := QResumen.FieldByName ('De_37_A_60_Meses').AsString;
      XLSheet.Cells [Row, 6].Formula := QResumen.FieldByName ('Mas_De_60_Meses').AsString;

      {En caso de que sea total de grupo}
      if QResumen.FieldByName ('G1').AsInteger = 1 then
      begin
        Range                     := XLSheet.Range [Format ('A%d:F%d', [Row, Row])];
        Range.Interior.ThemeColor := xlThemeColorLight1;
        Range.Font.Bold           := True;
        Range.Font.ThemeColor     := xlThemeColorDark1;
      end;

      QResumen.Next;
      Inc (Row);
    end;

    XLSheet.Range [Format ('B%d:F%d', [RowIni, Row])].Style := 'Currency';
    //XLSheet.Range [Format ('B%d:F%d', [RowIni, Row])].NumberFormat := '#,##0.00';

    XLSheet.Columns ['A'].AutoFit;
    XLSheet.Columns ['B:F'].ColumnWidth := 20;

    XLSheet.Range ['A7'].Select;
    XLApp.ActiveWindow.FreezePanes := True;

    XIni := XLSheet.Cells [Row + 1, 1].Top;
    YFin := XLSheet.Cells [Row + 1, 7].Left;

    Chart := XLSheet.ChartObjects.Add (0, XIni, YFin, XIni + 100);
    Chart.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[1].Range['A1:G' + IntToStr (Row - 1)], xlColumns);

    while Chart.Chart.SeriesCollection.Count > 0 do
      Chart.Chart.SeriesCollection [1].Delete;

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := 'Impagado';
    Serie.Values  := Format ('=Resumen!$B$%d:$B$%d',  [RowIni, Row - 2]);
    Serie.XValues := Format ('=Resumen!$A$%d:$A$%d',  [RowIni, Row - 2]);

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Hasta 12 Meses"';
    Serie.Values  := Format ('=Resumen!$C$%d:$C$%d',  [RowIni, Row - 2]);
    Serie.XValues := Format ('=Resumen!$A$%d:$A$%d',  [RowIni, Row - 2]);

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="De 13 Meses hasta 36 Meses"';
    Serie.Values  := Format ('=Resumen!$D$%d:$D$%d',  [RowIni, Row - 2]);
    Serie.XValues := Format ('=Resumen!$A$%d:$A$%d',  [RowIni, Row - 2]);

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="De 37 Meses hasta 60 Meses"';
    Serie.Values  := Format ('=Resumen!$E$%d:$E$%d',  [RowIni, Row - 2]);
    Serie.XValues := Format ('=Resumen!$A$%d:$A$%d',  [RowIni, Row - 2]);

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Mayores de 60 Meses"';
    Serie.Values  := Format ('=Resumen!$F$%d:$F$%d',  [RowIni, Row - 2]);
    Serie.XValues := Format ('=Resumen!$A$%d:$A$%d',  [RowIni, Row - 2]);

    {Inicia la generación de la tabla desglosada}
    XLApp.Workbooks [1].WorkSheets.Add (Null, XLApp.Workbooks [1].WorkSheets [1]);
    XLSheet      := XLApp.Workbooks[1].WorkSheets[2];
    XLSheet.Name := 'Desglose';

    XLSheet.Cells [1, 1].Formula := Caption;  // Título del reporte
    XLSheet.Range ['A1:I1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [2, 1].Formula := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['A2:I2'].Merge;
    XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [3, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [3, 2].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['B3:I3'].Merge;
    XLSheet.Range ['B3'].HorizontalAlignment := xlHAlignRight;

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 1].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 1].Formula := 'No incluye intereses cobrados por anticipado';

    XLSheet.Range ['A1:I4'].Font.Bold := True;

    Row       := 5;
    RowIni    := Row;
    PrevBanca := '';
    QDesglosado.First;
    while not QDesglosado.Eof do
    begin
      CurrBanca := QDesglosado.FieldByName ('Desc_Mercado').AsString;

      {En caso de que sea total de grupo}
      if QDesglosado.FieldByName ('G1').AsInteger = 1 then
      begin
        Range                     := XLSheet.Range [Format ('A%d:I%d', [Row, Row])];
        Range.Interior.ThemeColor := xlThemeColorLight1;
        Range.Font.Bold           := True;
        Range.Font.ThemeColor     := xlThemeColorDark1;

        XLSheet.Range [Format ('B%d:B%d', [RowIni, Row])].Style               := 'Currency';
        XLSheet.Range [Format ('C%d:C%d', [RowIni, Row])].Style               := 'Percent';
        XLSheet.Range [Format ('C%d:C%d', [RowIni, Row])].NumberFormat        := '0.00%';
        XLSheet.Range [Format ('C%d:C%d', [RowIni, Row])].HorizontalAlignment := xlHAlignCenter;
        XLSheet.Range [Format ('D%d:D%d', [RowIni, Row])].Style               := 'Currency';
        XLSheet.Range [Format ('E%d:E%d', [RowIni, Row])].Style               := 'Percent';
        XLSheet.Range [Format ('E%d:E%d', [RowIni, Row])].NumberFormat        := '0.00%';
        XLSheet.Range [Format ('E%d:E%d', [RowIni, Row])].HorizontalAlignment := xlHAlignCenter;
        XLSheet.Range [Format ('F%d:F%d', [RowIni, Row])].Style               := 'Currency';
        XLSheet.Range [Format ('G%d:G%d', [RowIni, Row])].Style               := 'Percent';
        XLSheet.Range [Format ('G%d:G%d', [RowIni, Row])].NumberFormat        := '0.00%';
        XLSheet.Range [Format ('G%d:G%d', [RowIni, Row])].HorizontalAlignment := xlHAlignCenter;
        XLSheet.Range [Format ('H%d:H%d', [RowIni, Row])].Style               := 'Currency';
        XLSheet.Range [Format ('I%d:I%d', [RowIni, Row])].Style               := 'Percent';
        XLSheet.Range [Format ('I%d:I%d', [RowIni, Row])].NumberFormat        := '0.00%';
        XLSheet.Range [Format ('I%d:I%d', [RowIni, Row])].HorizontalAlignment := xlHAlignCenter;
      end
      {En caso de que sea encabezado de grupo}
      else if PrevBanca <> CurrBanca then
      begin
        Range                     := XLSheet.Cells [Row, 1];
        Range.Formula             := CurrBanca;
        Range.Interior.ThemeColor := xlThemeColorLight1;
        Range.Font.Bold           := True;
        Range.Font.ThemeColor     := xlThemeColorDark1;

        Inc (Row);

        XLSheet.Cells [Row,     2].Formula := QFechas.FieldByName ('Trim_Ant').AsString;
        XLSheet.Cells [Row + 1, 2].Formula := '$';
        XLSheet.Cells [Row + 1, 3].Formula := '%';
        XLSheet.Range [Format ('B%d:C%d', [Row, Row])].Merge;

        XLSheet.Cells [Row,     4].Formula := 'Mes actual';
        XLSheet.Cells [Row + 1, 4].Formula := '$';
        XLSheet.Cells [Row + 1, 5].Formula := '%';
        XLSheet.Range [Format ('D%d:E%d', [Row, Row])].Merge;

        XLSheet.Cells [Row,     6].Formula := 'Diferencia';
        XLSheet.Cells [Row + 1, 6].Formula := '$';
        XLSheet.Cells [Row + 1, 7].Formula := '%';
        XLSheet.Range [Format ('F%d:G%d', [Row, Row])].Merge;

        XLSheet.Cells [Row,     8].Formula := QFechas.FieldByName ('Trim_AntSA').AsString;
        XLSheet.Cells [Row + 1, 8].Formula := '$';
        XLSheet.Cells [Row + 1, 9].Formula := '%';
        XLSheet.Range [Format ('H%d:I%d', [Row, Row])].Merge;

        Range                     := XLSheet.Range [Format ('B%d:I%d', [Row, Row + 1])];
        Range.Interior.ThemeColor := xlThemeColorLight1;
        Range.Font.Bold           := True;
        Range.Font.ThemeColor     := xlThemeColorDark1;
        Range.HorizontalAlignment := xlHAlignCenter;

        Inc (Row, 2);
        RowIni := Row;
      end;

      if QDesglosado.FieldByName ('G1').AsInteger <> 1 then
        XLSheet.Cells [Row, 1].Formula := QDesglosado.FieldByName ('Desc_Rango')         .AsString
      else
        XLSheet.Cells [Row, 1].Formula := QDesglosado.FieldByName ('Desc_Mercado')       .AsString;

      XLSheet.Cells [Row, 2].Formula := QDesglosado.FieldByName ('Imp_Trim_Ant')         .AsFloat;
      XLSheet.Cells [Row, 3].Formula := QDesglosado.FieldByName ('Pct_Trim_Ant')         .AsFloat / 100;
      XLSheet.Cells [Row, 4].Formula := QDesglosado.FieldByName ('Imp_Mes_Act')          .AsFloat;
      XLSheet.Cells [Row, 5].Formula := QDesglosado.FieldByName ('Pct_Mes_Act')          .AsFloat / 100;
      XLSheet.Cells [Row, 6].Formula := QDesglosado.FieldByName ('Imp_Diferencia')       .AsFloat;
      XLSheet.Cells [Row, 7].Formula := QDesglosado.FieldByName ('Pct_Diferencia')       .AsFloat / 100;
      XLSheet.Cells [Row, 8].Formula := QDesglosado.FieldByName ('Imp_Trim_Ant_Anio_Sig').AsFloat;
      XLSheet.Cells [Row, 9].Formula := QDesglosado.FieldByName ('Pct_Trim_Ant_Anio_Sig').AsFloat / 100;

      PrevBanca := CurrBanca;

      {Si es total de grupo salta un renglón}
      if QDesglosado.FieldByName ('G1').AsInteger = 1 then
        Inc (Row);

      QDesglosado.Next;
      Inc (Row);
    end;

    XLSheet.Columns ['A'].AutoFit;
    MaxWidth                                                     := XLSheet.Columns ['A'].ColumnWidth;
    XLApp.Workbooks [1].WorkSheets [1].Columns ['A'].ColumnWidth := MaxWidth;
    XLSheet.Columns ['B:I'].ColumnWidth                          := 15;
    
    XLSheet.Range ['A5'].Select;
    XLApp.ActiveWindow.FreezePanes := True;

    {Inicia la generación de la información desglosada con gráfica en hojas independientes}
    Hoja      := 2;
    Row       := 8;
    RowIni    := Row;
    PrevBanca := '';
    Banca30   := '';
    QDesglosado.First;
    while not QDesglosado.Eof do
    begin
      {Si es el registro de la sumatoria final acumulada, se sale}
      if QDesglosado.FieldByName ('Desc_Mercado').AsString = 'TOTAL CARTERA' then Break;

      CurrBanca := QDesglosado.FieldByName ('Desc_Mercado').AsString;

      {Si no es sumatoria de grupo toma el nombre de la hoja}
      if QDesglosado.FieldByName ('G1').AsInteger <> 1 then
        Banca30 := Copy (Translate (CurrBanca, '\/?*[]', ''), 1, 30);

      {Si es sumatoria de grupo}
      if QDesglosado.FieldByName ('G1').AsInteger = 1 then
      begin
        Range                     := XLSheet.Range [Format ('A%d:I%d', [Row, Row])];
        Range.Interior.ThemeColor := xlThemeColorLight1;
        Range.Font.Bold           := True;
        Range.Font.ThemeColor     := xlThemeColorDark1;

        XLSheet.Range [Format ('B%d:B%d', [RowIni, Row])].Style               := 'Currency';
        XLSheet.Range [Format ('C%d:C%d', [RowIni, Row])].Style               := 'Percent';
        XLSheet.Range [Format ('C%d:C%d', [RowIni, Row])].NumberFormat        := '0.00%';
        XLSheet.Range [Format ('C%d:C%d', [RowIni, Row])].HorizontalAlignment := xlHAlignCenter;
        XLSheet.Range [Format ('D%d:D%d', [RowIni, Row])].Style               := 'Currency';
        XLSheet.Range [Format ('E%d:E%d', [RowIni, Row])].Style               := 'Percent';
        XLSheet.Range [Format ('E%d:E%d', [RowIni, Row])].NumberFormat        := '0.00%';
        XLSheet.Range [Format ('E%d:E%d', [RowIni, Row])].HorizontalAlignment := xlHAlignCenter;
        XLSheet.Range [Format ('F%d:F%d', [RowIni, Row])].Style               := 'Currency';
        XLSheet.Range [Format ('G%d:G%d', [RowIni, Row])].Style               := 'Percent';
        XLSheet.Range [Format ('G%d:G%d', [RowIni, Row])].NumberFormat        := '0.00%';
        XLSheet.Range [Format ('G%d:G%d', [RowIni, Row])].HorizontalAlignment := xlHAlignCenter;
        XLSheet.Range [Format ('H%d:H%d', [RowIni, Row])].Style               := 'Currency';
        XLSheet.Range [Format ('I%d:I%d', [RowIni, Row])].Style               := 'Percent';
        XLSheet.Range [Format ('I%d:I%d', [RowIni, Row])].NumberFormat        := '0.00%';
        XLSheet.Range [Format ('I%d:I%d', [RowIni, Row])].HorizontalAlignment := xlHAlignCenter;

        XLSheet.Columns ['A'].ColumnWidth   := MaxWidth;
        XLSheet.Columns ['B:I'].ColumnWidth := 15;
        XLSheet.Range ['A8'].Select;
        XLApp.ActiveWindow.FreezePanes := True;

        XIni := XLSheet.Cells [Row + 2,  1].Top;
        YFin := XLSheet.Cells [Row + 2, 10].Left;

        Chart := XLSheet.ChartObjects.Add (0, XIni, YFin, XIni + 100);
        Chart.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[1].Range['A1:G' + IntToStr (Row - 1)], xlColumns);

        while Chart.Chart.SeriesCollection.Count > 0 do
          Chart.Chart.SeriesCollection [1].Delete;

        Serie         := Chart.Chart.SeriesCollection.NewSeries;
        Serie.Name    := Format ('="%s"', [QFechas.FieldByName ('Trim_Ant').AsString]);
        Serie.Values  := Format ('=''%s''!$C$%d:$C$%d',  [Banca30, RowIni, Row - 1]);
        Serie.XValues := Format ('=''%s''!$A$%d:$A$%d',  [Banca30, RowIni, Row - 1]);

        Serie         := Chart.Chart.SeriesCollection.NewSeries;
        Serie.Name    := '="Mes actual"';
        Serie.Values  := Format ('=''%s''!$E$%d:$E$%d',  [Banca30, RowIni, Row - 1]);
        Serie.XValues := Format ('=''%s''!$A$%d:$A$%d',  [Banca30, RowIni, Row - 1]);

        Serie         := Chart.Chart.SeriesCollection.NewSeries;
        Serie.Name    := '="Diferencia"';
        Serie.Values  := Format ('=''%s''!$G$%d:$G$%d',  [Banca30, RowIni, Row - 1]);
        Serie.XValues := Format ('=''%s''!$A$%d:$A$%d',  [Banca30, RowIni, Row - 1]);

        Serie         := Chart.Chart.SeriesCollection.NewSeries;
        Serie.Name    := Format ('="%s"', [QFechas.FieldByName ('Trim_AntSA').AsString]);
        Serie.Values  := Format ('=''%s''!$I$%d:$I$%d',  [Banca30, RowIni, Row - 1]);
        Serie.XValues := Format ('=''%s''!$A$%d:$A$%d',  [Banca30, RowIni, Row - 1]);
      end
      {Si hay cambio de banca, es decir, cambio de hoja}
      else if PrevBanca <> CurrBanca then
      begin
        XLApp.Workbooks [1].WorkSheets.Add (Null, XLApp.Workbooks [1].WorkSheets [Hoja]);
        Inc (Hoja);
        XLSheet      := XLApp.Workbooks[1].WorkSheets[Hoja];
        XLSheet.Name := Banca30;

        XLSheet.Cells [1, 1].Formula := Caption;  // Título del reporte
        XLSheet.Range ['A1:I1'].Merge;
        XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;

        XLSheet.Cells [2, 1].Formula := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
        XLSheet.Range ['A2:I2'].Merge;
        XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignCenter;

        XLSheet.Cells [3, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
        XLSheet.Cells [3, 2].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
        XLSheet.Range ['B3:I3'].Merge;
        XLSheet.Range ['B3'].HorizontalAlignment := xlHAlignRight;
        if cbInteresesAnticipados.Checked then
          XLSheet.Cells [4, 1].Formula := 'Incluye intereses cobrados por anticipado'
        else
          XLSheet.Cells [4, 1].Formula := 'No incluye intereses cobrados por anticipado';

        XLSheet.Range ['A1:I4'].Font.Bold := True;

        XLSheet.Cells [5, 1].Formula := CurrBanca;
        XLSheet.Cells [6, 2].Formula := QFechas.FieldByName ('Trim_Ant').AsString;
        XLSheet.Cells [7, 2].Formula := '$';
        XLSheet.Cells [7, 3].Formula := '%';
        XLSheet.Range ['B6:C6'].Merge;

        XLSheet.Cells [6, 4].Formula := 'Mes actual';
        XLSheet.Cells [7, 4].Formula := '$';
        XLSheet.Cells [7, 5].Formula := '%';
        XLSheet.Range ['D6:E6'].Merge;

        XLSheet.Cells [6, 6].Formula := 'Diferencia';
        XLSheet.Cells [7, 6].Formula := '$';
        XLSheet.Cells [7, 7].Formula := '%';
        XLSheet.Range ['F6:G6'].Merge;

        XLSheet.Cells [6, 8].Formula := QFechas.FieldByName ('Trim_AntSA').AsString;;
        XLSheet.Cells [7, 8].Formula := '$';
        XLSheet.Cells [7, 9].Formula := '%';
        XLSheet.Range ['H6:I6'].Merge;

        Range                     := XLSheet.Range ['A5'];
        Range.Interior.ThemeColor := xlThemeColorLight1;
        Range.Font.Bold           := True;
        Range.Font.ThemeColor     := xlThemeColorDark1;
        //Range.HorizontalAlignment := xlHAlignCenter;

        Range                     := XLSheet.Range ['B6:I7'];
        Range.Interior.ThemeColor := xlThemeColorLight1;
        Range.Font.Bold           := True;
        Range.Font.ThemeColor     := xlThemeColorDark1;
        Range.HorizontalAlignment := xlHAlignCenter;

        Row    := 8;
        RowIni := Row;
      end;

      if QDesglosado.FieldByName ('G1').AsInteger <> 1 then
        XLSheet.Cells [Row, 1].Formula := QDesglosado.FieldByName ('Desc_Rango')         .AsString
      else
        XLSheet.Cells [Row, 1].Formula := QDesglosado.FieldByName ('Desc_Mercado')       .AsString;

      XLSheet.Cells [Row, 2].Formula := QDesglosado.FieldByName ('Imp_Trim_Ant')         .AsFloat;
      XLSheet.Cells [Row, 3].Formula := QDesglosado.FieldByName ('Pct_Trim_Ant')         .AsFloat / 100;
      XLSheet.Cells [Row, 4].Formula := QDesglosado.FieldByName ('Imp_Mes_Act')          .AsFloat;
      XLSheet.Cells [Row, 5].Formula := QDesglosado.FieldByName ('Pct_Mes_Act')          .AsFloat / 100;
      XLSheet.Cells [Row, 6].Formula := QDesglosado.FieldByName ('Imp_Diferencia')       .AsFloat;
      XLSheet.Cells [Row, 7].Formula := QDesglosado.FieldByName ('Pct_Diferencia')       .AsFloat / 100;
      XLSheet.Cells [Row, 8].Formula := QDesglosado.FieldByName ('Imp_Trim_Ant_Anio_Sig').AsFloat;
      XLSheet.Cells [Row, 9].Formula := QDesglosado.FieldByName ('Pct_Trim_Ant_Anio_Sig').AsFloat / 100;

      PrevBanca := CurrBanca;
      QDesglosado.Next;
      Inc (Row);
    end;

    XLApp.Workbooks[1].WorkSheets[1].Activate
  finally
    Cursor := crArrow;
    XLApp.Workbooks[1].SaveAs (FileName);
    XLApp.Quit;
    XLSheet  := Unassigned;
    Range    := Unassigned;
    Chart    := Unassigned;
    Serie    := Unassigned;
    XLApp    := Unassigned;
  end;
end;


procedure TWCrPlzVenc.sbExportarClick(Sender: TObject);
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

procedure TWCrPlzVenc.sbExportarDetalleXLSClick(Sender: TObject);
var
  XLApp: Variant;
begin
  sbExportarDetalleXLS.Refresh;
  if SaveXLS.Execute then
  begin
    Cursor := crHourGlass;
    try
      ExportarDetalleXLS (SaveXLS.FileName);
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

procedure TWCrPlzVenc.ExportarDetalleXLS (FileName: string);
var
  XLApp, XLSheet, Range: Variant;
  Chart, Serie: Variant;
  Row, RowIni, XIni, YFin, Hoja: integer;
  MaxWidth: double;
  PrevBanca, CurrBanca, Banca30: string;
var
  Factor: double;
begin
  Factor := 1;
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

    QDesgloseCredito.Close;
    QDesgloseCredito.DatabaseName                            := Objeto.Apli.DataBaseName;
    QDesgloseCredito.SessionName                             := Objeto.Apli.SessionName;
    QDesgloseCredito.ParamByName ('peFecha').AsDate          := dpFecha.Date;
    QDesgloseCredito.ParamByName ('peFactor').AsFloat        := Factor;
    QDesgloseCredito.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
    QDesgloseCredito.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
    QDesgloseCredito.Open;

    {Inicia la generación de la tabla resumen}
    XLSheet      := XLApp.Workbooks[1].WorkSheets[1];
    XLSheet.Name := 'Resumen';

    {Encabezado del reporte}
    XLSheet.Cells [1, 1].Formula := Caption;  // Título del reporte
    XLSheet.Range ['A1:K1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [2, 1].Formula := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['A2:K2'].Merge;
    XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [3, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [3, 3].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['C3:K3'].Merge;
    XLSheet.Range ['C3'].HorizontalAlignment := xlHAlignRight;

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 1].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 1].Formula := 'No incluye intereses cobrados por anticipado';

    {Encabezado de las columnas}
    XLSheet.Cells [6,  1].Formula := 'Tipo Entidad';
    XLSheet.Cells [6,  2].Formula := 'Banca';
    XLSheet.Cells [6,  3].Formula := 'ID Acreditado';
    XLSheet.Cells [6,  4].Formula := 'Acreditado';
    XLSheet.Cells [6,  5].Formula := 'ID Contrato';
    XLSheet.Cells [6,  6].Formula := 'ID Crédito';
    XLSheet.Cells [6,  7].Formula := 'Impagado';
    XLSheet.Cells [6,  8].Formula := 'Hasta 12 Meses';
    XLSheet.Cells [5,  9].Formula := 'De 13 Meses';
    XLSheet.Cells [6,  9].Formula := 'hasta 36 Meses';
    XLSheet.Cells [5, 10].Formula := 'De 37 Meses';
    XLSheet.Cells [6, 10].Formula := 'hasta 60 meses';
    XLSheet.Cells [5, 11].Formula := 'Mayores';
    XLSheet.Cells [6, 11].Formula := 'de 61 Meses';

    XLSheet.Range ['A1:K6'].Font.Bold           := True;
    XLSheet.Range ['A5:K6'].HorizontalAlignment := xlHAlignCenter;

    Range                     := XLSheet.Range ['A5:K6'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row := 7;
    while not QDesgloseCredito.Eof do
    begin
      XLSheet.Cells [Row,  1].Value := QDesgloseCredito.FieldByName ('Tipo_Entidad').AsString;
      XLSheet.Cells [Row,  2].Value := QDesgloseCredito.FieldByName ('Desc_Mercado').AsString;
      XLSheet.Cells [Row,  3].Value := QDesgloseCredito.FieldByName ('ID_Acreditado').AsFloat;
      XLSheet.Cells [Row,  4].Value := QDesgloseCredito.FieldByName ('Nom_Acred_Reg').AsString;
      XLSheet.Cells [Row,  5].Value := QDesgloseCredito.FieldByName ('ID_Contrato').AsFloat;
      XLSheet.Cells [Row,  6].Value := QDesgloseCredito.FieldByName ('ID_Credito').AsFloat;
      XLSheet.Cells [Row,  7].Value := QDesgloseCredito.FieldByName ('Impagado').AsFloat;
      XLSheet.Cells [Row,  8].Value := QDesgloseCredito.FieldByName ('Hasta_12_Meses').AsFloat;
      XLSheet.Cells [Row,  9].Value := QDesgloseCredito.FieldByName ('De_13_A_36_Meses').AsFloat;
      XLSheet.Cells [Row, 10].Value := QDesgloseCredito.FieldByName ('De_37_A_60_Meses').AsFloat;
      XLSheet.Cells [Row, 11].Value := QDesgloseCredito.FieldByName ('Mas_De_60_Meses').AsFloat;

      Inc (Row);
      QDesgloseCredito.Next;
    end;

    XLSheet.Range [Format ('G7:K%d', [Row - 1])].Style := 'Currency';
    XLSheet.Columns ['A:B'].ColumnWidth                := 20;
    XLSheet.Columns ['C:F'].ColumnWidth                := 12;
    XLSheet.Columns ['D'].ColumnWidth                  := 35;
    XLSheet.Columns ['G:K'].ColumnWidth                := 16;
    XLSheet.Range ['A7'].Select;
    XLApp.ActiveWindow.FreezePanes := True;

    XLApp.Workbooks[1].WorkSheets[1].Activate
  finally
    Cursor := crArrow;
    XLApp.Workbooks[1].SaveAs (FileName);
    XLApp.Quit;
    XLSheet  := Unassigned;
    Range    := Unassigned;
    Chart    := Unassigned;
    Serie    := Unassigned;
    XLApp    := Unassigned;
  end;
end;

end.
