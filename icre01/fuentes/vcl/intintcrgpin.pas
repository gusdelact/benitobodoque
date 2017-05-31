// Sistema         : Clase de INTCRGPINFRA
// Fecha de Inicio : 09/05/2012
// Función forma   : Clase de INTCRGPINFRA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntIntCrGpIn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, IntIntCrQrGpIn,
  ShellAPI, ComObj;

const ALTO_COL = 19;
      ALTO_DOBLE = 25;

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
  TIntCrGpIn = class;

  TWIntCrGpInfra = class(TForm)
    InterForma1: TInterForma;
    QDatos: TQuery;
    lbFecha: TLabel;
    dpFecha: TDateTimePicker;
    SGCtrl1: TSGCtrl;
    QDatosTipo: TStringField;
    QDatosDescripcion: TStringField;
    QDatosPct_Minimo: TFloatField;
    QDatosPct_Maximo: TFloatField;
    QDatosPct_Real: TFloatField;
    QDatosCumplimiento: TStringField;
    QDatosID_Tipo: TFloatField;
    QDatosClave: TFloatField;
    GroupBox1: TGroupBox;
    cbEstados: TCheckBox;
    cbMunicipios: TCheckBox;
    cbOrgDesc: TCheckBox;
    cbPrivado: TCheckBox;
    btBusca: TBitBtn;
    cbFederal: TCheckBox;
    QLeyendaEntidades: TQuery;
    sbExportar: TSpeedButton;
    SaveXLS: TSaveDialog;
    QDetalle: TQuery;
    sbExportarDetalle: TSpeedButton;
    cbCartasCredito: TCheckBox;
    cbInteresesAnticipados: TCheckBox;
    rgFactorMoneda: TRadioGroup;
    QDatosImp_Real: TFloatField;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure dpFechaChange(Sender: TObject);
    procedure InterForma1BtnAyudaClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbExportarDetalleClick(Sender: TObject);
    private
      { Private declarations }
      function ConstruyeTipoEntidad: string;
      procedure ExportarXLS (FileName: string);
      procedure ExportarXLSDetalle (FileName: string);
    public
    { Public declarations }
      Objeto: TIntcrgpin;
    end;

    TIntCrGpIn = class(TInterFrame)
    private
    protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
    public
        { Public declarations }
      function    InternalBusca : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      function    Reporte:Boolean; override;
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

constructor TIntcrgpin.Create( AOwner : TComponent );
begin
  Inherited;
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntIntcrgpin.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TIntcrgpin.Destroy;
begin
  inherited;
end;


function TIntcrgpin.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W: TWIntCrGpInfra;
begin
   W := TWIntCrGpInfra.Create(Self);
   try
      W.Objeto                    := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow                  := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

function TIntCrGpIn.InternalBusca:Boolean;
var
  T: TInterFindit;
begin
  InternalBusca := False;
  T             := CreaBuscador('IIntcrgp.it','');
  try
    if Active then
    begin
    end;

    if T.Execute then
      InternalBusca := FindKey([]);
  finally
    T.Free;
  end;
end;

function TIntCrGpIn.Reporte:Boolean;
begin
  //Execute_Reporte();
end;

(***********************************************FORMA INTCRGPINFRA********************)
(*                                                                              *)
(*  FORMA DE INTCRGPINFRA                                                            *)
(*                                                                              *)
(***********************************************FORMA INTCRGPINFRA********************)

procedure TWIntCrGpInfra.FormShow(Sender: TObject);
begin
  InterForma1.BtnAyuda.Caption := '&Imprimir';
  dpFecha.Date := Objeto.Apli.DameFechaEmpresa;
  dpFechaChange(dpFecha);
end;

procedure TWIntCrGpInfra.FormDestroy(Sender: TObject);
begin
  //
end;

procedure TWIntCrGpInfra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWIntcrgpinfra.InterForma1DespuesNuevo(Sender: TObject);
begin
  //<<Control>>.SetFocus;
end;

procedure TWIntcrgpinfra.InterForma1DespuesModificar(Sender: TObject);
begin
  //<<Control>>.SetFocus;
end;

//procedure TWIntcrgpinfra.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;

function TWIntCrGpInfra.ConstruyeTipoEntidad: string;
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

procedure TWIntCrGpInfra.dpFechaChange(Sender: TObject);
var
  Factor: double;
begin
   if Objeto.ValidaAccesoEsp('TINTCRGPIN_BUSCA',True,True) then
   begin
      Factor := 1;
      case rgFactorMoneda.ItemIndex of
        0: Factor := 1000000;
        1: Factor := 1000;
        2: Factor := 1;
      end;

      QDatos.Close;
      QDatos.DatabaseName := Objeto.Apli.DataBaseName;
      QDatos.SessionName  := Objeto.Apli.SessionName;
      QDatos.ParamByName ('peFecha').AsDateTime      := Trunc (dpFecha.Date - 1);
      QDatos.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
      QDatos.ParamByName ('peCartas_Cred').AsString  := BoolToStr (cbCartasCredito.Checked);
      QDatos.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
      QDatos.ParamByName ('peFactor').AsFloat        := Factor;
      QDatos.Open;

      QLeyendaEntidades.Close;
      QLeyendaEntidades.DatabaseName := Objeto.Apli.DataBaseName;
      QLeyendaEntidades.SessionName  := Objeto.Apli.SessionName;
      QLeyendaEntidades.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
      QLeyendaEntidades.Open;

      SGCtrl1.AddQry (QDatos, True, True, -1, Alto_Col, -1, True);
   end;
end;

procedure TWIntCrGpInfra.InterForma1BtnAyudaClick(Sender: TObject);
begin
  RepCartInfraestructura (dpFecha.Date, QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString, cbCartasCredito.Checked, cbInteresesAnticipados.Checked, QDatos, Objeto.Apli, True);
end;

procedure TWIntCrGpInfra.sbExportarClick(Sender: TObject);
var
  XLApp: Variant;
begin
   if Objeto.ValidaAccesoEsp('TINTCRGPIN_EXPRS',True,True) then
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

procedure TWIntCrGpInfra.ExportarXLS (FileName: string);
type
  RecLimite = record
    Inicio, Fin: integer;
  end;
  ListLimite = array of RecLimite;

var
  XLApp, XLSheet: Variant;
  Range, Chart, Serie: Variant;
  Row, RowIni, CurrTipo, XFin, YIni: integer;
  List: ListLimite;
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
    XLSheet.Range ['A1:G1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [2, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [2, 2].Formula := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['B2:G2'].Merge;
    XLSheet.Range ['B2'].HorizontalAlignment := xlHAlignRight;

    if cbCartasCredito.Checked then
      XLSheet.Cells [3, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [3, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [3, 4].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [3, 4].Formula := 'No incluye intereses cobrados por anticipado';
    XLSheet.Range ['A3:C3'].Merge;
    XLSheet.Range ['D3:G3'].Merge;
    XLSheet.Range ['D3'].HorizontalAlignment := xlHAlignRight;

    {Encabezado de las columnas}
    XLSheet.Cells [5, 1].Formula := 'Tipo';
    XLSheet.Cells [5, 2].Formula := 'Concepto';
    XLSheet.Cells [4, 3].Formula := 'Mínimo';
    XLSheet.Cells [4, 4].Formula := 'Máximo';
    XLSheet.Cells [5, 3].Formula := '%';
    XLSheet.Cells [4, 5].Formula := 'Real';
    XLSheet.Cells [5, 5].Formula := '$';
    XLSheet.Cells [5, 6].Formula := '%';
    XLSheet.Cells [5, 7].Formula := 'Cumplimiento';

    XLSheet.Range ['E4:F4'].Merge;
    XLSheet.Range ['C5:D5'].Merge;
    XLSheet.Range ['A1:F5'].Font.Bold := True;

    Range                     := XLSheet.Range ['A4:G5'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;
    Range.HorizontalAlignment := xlHAlignCenter;

    Row      := 6;
    RowIni   := Row;
    CurrTipo := -1;
    QDatos.First;
    SetLength (List, 0);
    while not QDatos.Eof do
    begin
      {Si es corte de grupo}
      if CurrTipo <> QDatos.FieldByName ('ID_Tipo').AsInteger then
      begin
        {Si no es el primer grupo}
        if CurrTipo <> -1 then
        begin
          XLSheet.Cells [Row, 2].Formula := 'Total';
          XLSheet.Cells [Row, 5].Formula := Format ('=Sum(E%d:E%d)', [RowIni, Row - 1]);
          XLSheet.Cells [Row, 6].Formula := Format ('=Sum(F%d:F%d)', [RowIni, Row - 1]);

          Range                     := XLSheet.Range [Format ('B%d:G%d', [Row, Row])];
          Range.Interior.ThemeColor := xlThemeColorLight1;
          Range.Font.Bold           := True;
          Range.Font.ThemeColor     := xlThemeColorDark1;

          Inc (Row, 2);
          RowIni := Row;
        end;
        XLSheet.Cells [Row, 1].Formula   := QDatos.FieldByName ('Tipo').AsString;
        XLSheet.Cells [Row, 1].Font.Bold := True;
        CurrTipo                         := QDatos.FieldByName ('ID_Tipo').AsInteger;
        SetLength (List, Length (List) + 1);
        List [Length (List) - 1].Inicio := Row;
      end;
      XLSheet.Cells [Row, 2].Formula := QDatos.FieldByName ('Descripcion') .AsString;
      XLSheet.Cells [Row, 3].Value   := QDatos.FieldByName ('Pct_Minimo')  .AsFloat / 100;
      XLSheet.Cells [Row, 4].Value   := QDatos.FieldByName ('Pct_Maximo')  .AsFloat / 100;
      XLSheet.Cells [Row, 5].Value   := QDatos.FieldByName ('Imp_Real')    .AsFloat;
      XLSheet.Cells [Row, 6].Value   := QDatos.FieldByName ('Pct_Real')    .AsFloat / 100;
      XLSheet.Cells [Row, 7].Formula := QDatos.FieldByName ('Cumplimiento').AsString;

      XLSheet.Range [Format ('C%d:F%d', [Row, Row])].Style               := 'Percent';
      XLSheet.Range [Format ('C%d:F%d', [Row, Row])].NumberFormat        := '0.00%';
      XLSheet.Range [Format ('C%d:F%d', [Row, Row])].HorizontalAlignment := xlHAlignCenter;
      XLSheet.Range [Format ('E%d',     [Row]     )].Style               := 'Currency';
      XLSheet.Range [Format ('G%d',     [Row]     )].HorizontalAlignment := xlHAlignCenter;

      List [Length (List) - 1].Fin := Row;
      QDatos.Next;
      Inc (Row);
    end;

    {Resumen del último grupo si es que hubo algún grupo}
    if CurrTipo <> -1 then
    begin
      XLSheet.Cells [Row, 2].Formula := 'Total';
      XLSheet.Cells [Row, 5].Formula := Format ('=Sum(E%d:E%d)', [RowIni, Row - 1]);
      XLSheet.Cells [Row, 6].Formula := Format ('=Sum(F%d:F%d)', [RowIni, Row - 1]);
      XLSheet.Range [Format ('B%d:G%d', [Row, Row])].Font.Bold := True;

      Range                     := XLSheet.Range [Format ('B%d:G%d', [Row, Row])];
      Range.Interior.ThemeColor := xlThemeColorLight1;
      Range.Font.Bold           := True;
      Range.Font.ThemeColor     := xlThemeColorDark1;
    end;

    XLSheet.Range [Format ('C6:F%d', [Row])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Columns ['A:B'].AutoFit;
    XLSheet.Columns ['C:G'].ColumnWidth := 15;
    XLSheet.Columns ['E'].ColumnWidth   := 25;

    XLSheet.Range ['A6'].Select;
    XLApp.ActiveWindow.FreezePanes := True;

    {Si se generaron ambos grupos crea las dos gráficas, en caso contrario no crea ninguna}
    if Length (List) = 2 then
    begin
      {Genera la primer gráfica}
      YIni := XLSheet.Cells [Row + 2, 1].Top;
      XFin := XLSheet.Cells [Row + 2, 8].Left;

      Chart := XLSheet.ChartObjects.Add (0, YIni, XFin div 2, YIni + 100);
      Chart.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[1].Range['A1:H' + IntToStr (Row - 1)], xlColumns);
      Chart.Chart.HasTitle        := True;
      Chart.Chart.ChartTitle.Text := 'Por subsector';

      while Chart.Chart.SeriesCollection.Count > 0 do
        Chart.Chart.SeriesCollection [1].Delete;

      Serie         := Chart.Chart.SeriesCollection.NewSeries;
      Serie.Name    := '="Pct. Mínimo"';
      Serie.Values  := Format ('=Tabla!$C$%d:$C$%d',  [List [0].Inicio, List [0].Fin]);
      Serie.XValues := Format ('=Tabla!$B$%d:$B$%d',  [List [0].Inicio, List [0].Fin]);

      Serie         := Chart.Chart.SeriesCollection.NewSeries;
      Serie.Name    := '="Pct. Máximo"';
      Serie.Values  := Format ('=Tabla!$D$%d:$D$%d',  [List [0].Inicio, List [0].Fin]);
      Serie.XValues := Format ('=Tabla!$B$%d:$B$%d',  [List [0].Inicio, List [0].Fin]);

      Serie         := Chart.Chart.SeriesCollection.NewSeries;
      Serie.Name    := '="Pct. Real"';
      Serie.Values  := Format ('=Tabla!$F$%d:$F$%d',  [List [0].Inicio, List [0].Fin]);
      Serie.XValues := Format ('=Tabla!$B$%d:$B$%d',  [List [0].Inicio, List [0].Fin]);

      {Genera la segunda gráfica}
      YIni := XLSheet.Cells [Row + 2, 1].Top;
      XFin := XLSheet.Cells [Row + 2, 8].Left;

      Chart := XLSheet.ChartObjects.Add (XFin div 2 + 1, YIni, XFin div 2, YIni + 100);
      Chart.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[1].Range['A1:H' + IntToStr (Row - 1)], xlColumns);
      Chart.Chart.HasTitle        := True;
      Chart.Chart.ChartTitle.Text := 'Por fuente de pago';

      while Chart.Chart.SeriesCollection.Count > 0 do
        Chart.Chart.SeriesCollection [1].Delete;

      Serie         := Chart.Chart.SeriesCollection.NewSeries;
      Serie.Name    := '="Pct. Mínimo "';
      Serie.Values  := Format ('=Tabla!$C$%d:$C$%d',  [List [1].Inicio, List [1].Fin]);
      Serie.XValues := Format ('=Tabla!$B$%d:$B$%d',  [List [1].Inicio, List [1].Fin]);

      Serie         := Chart.Chart.SeriesCollection.NewSeries;
      Serie.Name    := '="Pct. Máximo "';
      Serie.Values  := Format ('=Tabla!$D$%d:$D$%d',  [List [1].Inicio, List [1].Fin]);
      Serie.XValues := Format ('=Tabla!$B$%d:$B$%d',  [List [1].Inicio, List [1].Fin]);

      Serie         := Chart.Chart.SeriesCollection.NewSeries;
      Serie.Name    := '="Pct. Real "';
      Serie.Values  := Format ('=Tabla!$F$%d:$F$%d',  [List [1].Inicio, List [1].Fin]);
      Serie.XValues := Format ('=Tabla!$B$%d:$B$%d',  [List [1].Inicio, List [1].Fin]);
    end;
  finally
    Cursor := crArrow;
    XLApp.Workbooks[1].SaveAs (FileName);
    XLApp.Quit;
    XLSheet  := Unassigned;
    Range    := Unassigned;
    XLApp    := Unassigned;
  end;
end;

procedure TWIntCrGpInfra.ExportarXLSDetalle (FileName: string);
var
  XLApp, XLSheet: Variant;
  Range, Chart, Serie: Variant;
  Row, RowIni, CurrTipo, XFin, YIni: integer;
  Factor: double;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  QDetalle.Close;
  QDetalle.DatabaseName := Objeto.Apli.DataBaseName;
  QDetalle.SessionName  := Objeto.Apli.SessionName;
  QDetalle.ParamByName ('peFecha').AsDateTime      := Trunc (dpFecha.Date - 1);
  QDetalle.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QDetalle.ParamByName ('peCartas_Cred').AsString  := BoolToStr (cbCartasCredito.Checked);
  QDetalle.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
  QDetalle.ParamByName ('peFactor').AsFloat        := Factor;
  QDetalle.Open;

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
    XLSheet.Range ['A1:K1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [2, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [2, 2].Formula := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['B2:K2'].Merge;
    XLSheet.Range ['B2'].HorizontalAlignment := xlHAlignRight;

    if cbCartasCredito.Checked then
      XLSheet.Cells [3, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [3, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [3, 6].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [3, 6].Formula := 'No incluye intereses cobrados por anticipado';
    XLSheet.Range ['A3:E3'].Merge;
    XLSheet.Range ['F3:K3'].Merge;
    XLSheet.Range ['F3'].HorizontalAlignment := xlHAlignRight;

    {Encabezado de las columnas}
    XLSheet.Cells [4,  1].Formula := 'Clasificación';
    XLSheet.Cells [4,  2].Formula := 'Concepto';
    XLSheet.Cells [4,  3].Formula := 'Acreditado';
    XLSheet.Cells [4,  4].Formula := 'ID Acreditado';
    XLSheet.Cells [4,  5].Formula := 'ID Contrato';
    XLSheet.Cells [4,  6].Formula := 'ID Crédito';
    XLSheet.Cells [4,  7].Formula := 'Tipo Crédito';
    XLSheet.Cells [4,  8].Formula := '% Mínimo';
    XLSheet.Cells [4,  9].Formula := '% Máximo';
    XLSheet.Cells [4, 10].Formula := 'Imp. Real';
    XLSheet.Cells [4, 11].Formula := '% Real';

    XLSheet.Range ['A1:K4'].Font.Bold := True;
    XLSheet.Range ['A4:K4'].HorizontalAlignment := xlHAlignCenter;

    Range                     := XLSheet.Range ['A4:K4'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row := 5;
    while not QDetalle.Eof do
    begin
      XLSheet.Cells [Row,  1].Value := QDetalle.FieldByName ('Clasificacion').AsString;
      XLSheet.Cells [Row,  2].Value := QDetalle.FieldByName ('Concepto').AsString;
      XLSheet.Cells [Row,  3].Value := QDetalle.FieldByName ('Nom_Acred_Reg').AsString;
      XLSheet.Cells [Row,  4].Value := QDetalle.FieldByName ('ID_Acreditado').AsFloat;
      XLSheet.Cells [Row,  5].Value := QDetalle.FieldByName ('ID_Contrato').AsFloat;
      XLSheet.Cells [Row,  6].Value := QDetalle.FieldByName ('ID_Credito').AsFloat;
      XLSheet.Cells [Row,  7].Value := QDetalle.FieldByName ('Tipo_Credito').AsString;
      XLSheet.Cells [Row,  8].Value := QDetalle.FieldByName ('Pct_Minimo').AsFloat / 100;
      XLSheet.Cells [Row,  9].Value := QDetalle.FieldByName ('Pct_Maximo').AsFloat / 100;
      XLSheet.Cells [Row, 10].Value := QDetalle.FieldByName ('Imp_Real').AsFloat;
      XLSheet.Cells [Row, 11].Value := QDetalle.FieldByName ('Pct_Real').AsFloat;

      QDetalle.Next;
      Inc (Row);
    end;

    XLSheet.Columns ['B:C'].ColumnWidth := 30;
    XLSheet.Columns ['D:K'].ColumnWidth := 13;
    XLSheet.Columns ['A'].AutoFit;
    XLSheet.Columns ['J'].AutoFit;
    XLSheet.Range [Format ('H5:K%d', [Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('H5:K%d', [Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('H5:K%d', [Row - 1])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('J5:J%d', [Row - 1])].Style               := 'Currency';
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

procedure TWIntCrGpInfra.sbExportarDetalleClick(Sender: TObject);
var
  XLApp: Variant;
begin
   if Objeto.ValidaAccesoEsp('TINTCRGPIN_EXPDT',True,True) then
   begin
      sbExportar.Refresh;
      if SaveXLS.Execute then
      begin
        Cursor := crHourGlass;
        try
          ExportarXLSDetalle (SaveXLS.FileName);
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

end.
