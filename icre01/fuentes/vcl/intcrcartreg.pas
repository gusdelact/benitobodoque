// Sistema         : Clase de CRCARTREGION
// Fecha de Inicio : 04/06/2012
// Función forma   : Clase de CRCARTREGION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrCartReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, IntCrQrCartReg,
  ShellAPI, ComObj;

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
  TCrCartReg = class;

  TWCrCartRegion = class(TForm)
    InterForma1             : TInterForma;
    sgRegion: TSGCtrl;
    Panel1: TPanel;
    btBusca: TBitBtn;
    dpFecha: TDateTimePicker;
    GroupBox1: TGroupBox;
    cbEstados: TCheckBox;
    cbMunicipios: TCheckBox;
    cbOrgDesc: TCheckBox;
    cbPrivado: TCheckBox;
    rgFactorMoneda: TRadioGroup;
    QDatos: TQuery;
    QDatosID_Region: TFloatField;
    QDatosDesc_Region: TStringField;
    QDatosPct_Minimo: TFloatField;
    QDatosPct_Maximo: TFloatField;
    QDatosImp_Real: TFloatField;
    QDatosPct_Real: TFloatField;
    QDatosB_Cumplimiento: TStringField;
    Label1: TLabel;
    cbFederal: TCheckBox;
    QLeyendaEntidades: TQuery;
    sbExportar: TSpeedButton;
    SaveXLS: TSaveDialog;
    QDetalles: TQuery;
    sbExportarDetalle: TSpeedButton;
    cbCartasCredito: TCheckBox;
    cbInteresesAnticipados: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btBuscaClick(Sender: TObject);
    procedure sgRegionCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure InterForma1BtnAyudaClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbExportarDetalleClick(Sender: TObject);
  private
    { Private declarations }
    flTotalImp_Real: double;
    flTotalPct_Real: double;
    procedure GeneraConsulta;
    function ConstruyeTipoEntidad: string;
    procedure ExportarXLS (FileName: string);
    procedure ExportarXLSDetalle (FileName: string);
  public
    { Public declarations }
    Objeto : TCrCartReg;
  end;

  TCrCartReg= class(TInterFrame)
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

constructor TCrCartReg.Create( AOwner : TComponent );
begin
  Inherited;
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'InTCrCartReg.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrCartReg.Destroy;
begin inherited;
end;


function TCrCartReg.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCartRegion;
begin
   W:=TWCrCartRegion.Create(Self);
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


Function TCrCartReg.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrcartr.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrCartReg.Reporte:Boolean;
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CRCARTREGION********************)
(*                                                                              *)
(*  FORMA DE CRCARTREGION                                                            *)
(*                                                                              *)
(***********************************************FORMA CRCARTREGION********************)

procedure TWCrCartRegion.FormShow(Sender: TObject);
begin
  InterForma1.BtnAyuda.Caption := '&Imprimir';
  dpFecha.Date                 := Objeto.Apli.DameFechaEmpresa;
  GeneraConsulta;
end;

procedure TWCrCartRegion.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWCrCartRegion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrCartRegion.InterForma1DespuesNuevo(Sender: TObject);
begin
  //<<Control>>.SetFocus;
end;

procedure TWCrCartRegion.InterForma1DespuesModificar(Sender: TObject);
begin
  //<<Control>>.SetFocus;
end;

function TWCrCartRegion.ConstruyeTipoEntidad: string;
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


procedure TWCrCartRegion.GeneraConsulta;
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
  QDatos.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QDatos.ParamByName ('peCartas_Cred').AsString  := BoolToStr (cbCartasCredito.Checked);
  QDatos.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
  QDatos.Open;

  QLeyendaEntidades.Close;
  QLeyendaEntidades.DatabaseName                            := Objeto.Apli.DataBaseName;
  QLeyendaEntidades.SessionName                             := Objeto.Apli.SessionName;
  QLeyendaEntidades.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QLeyendaEntidades.Open;

  sgRegion.AddQry(QDatos, // Query
        True, // Iniciar Grid, Limpiar Lineas Anteriores.
        True, // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
        -1,   // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
        ALTO_COL,  // Alto del Header, -1 es el Default 32 Columnas
        ALTO_DOBLE,// Alto del las Lineas, 1 es el Default 32
        True); // ShowTitle

end;


//procedure TWCrCartRegion.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCrCartRegion.btBuscaClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCARTREG_BUSCA',True,True) then
      GeneraConsulta;
end;

procedure TWCrCartRegion.sgRegionCalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
var
  sTitulo : String;
begin
  sTitulo := '                                          Total';

  case RowCaso of
    rcQueryBegin: begin
      flTotalImp_Real := 0;
      flTotalPct_Real := 0;
    end;
    rcRowBegin: begin
      sgRegion.SetActualHeight(ALTO_COL);
      flTotalImp_Real := flTotalImp_Real + DataSet.FieldByName ('Imp_Real').AsFloat;
      flTotalPct_Real := flTotalPct_Real + DataSet.FieldByName ('Pct_Real').AsFloat;
    end;
    rcQueryEnd: begin
      sgRegion.ToHeader(sgRegion.AddHeader(['', '', '', sTitulo,
                FormatFloat('###,###,###,###,###.00', flTotalImp_Real),
                FormatFloat('###,###.###', flTotalPct_Real)], -1, clWindowText));
    end;
  end;
end;

procedure TWCrCartRegion.InterForma1BtnAyudaClick(Sender: TObject);
var
  Factor: double;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  RepCarteraPorRegion (dpFecha.Date - 1, QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString, Factor, cbCartasCredito.Checked, cbInteresesAnticipados.Checked, QDatos, Objeto.Apli, True);
end;

procedure TWCrCartRegion.ExportarXLS (FileName: string);
var
  XLApp, XLSheet: Variant;
  Range, Chart, Serie: Variant;
  Row, RowIni, CurrTipo: integer;
  XFin, YIni: integer;
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

    XLSheet.Cells [2, 1].Formula := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['A2:F2'].Merge;
    XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [3, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [3, 2].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['B3:F3'].Merge;
    XLSheet.Range ['B3'].HorizontalAlignment := xlHAlignRight;

    if cbCartasCredito.Checked then
      XLSheet.Cells [4, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [4, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 4].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 4].Formula := 'No incluye intereses cobrados por anticipado';
    XLSheet.Range ['A4:C4'].Merge;
    XLSheet.Range ['D4:F4'].Merge;
    XLSheet.Range ['D4'].HorizontalAlignment := xlHAlignRight;

    {Encabezado de las columnas}
    XLSheet.Cells [6, 1].Formula := 'Region';
    XLSheet.Cells [5, 2].Formula := 'Mínimo';
    XLSheet.Cells [5, 3].Formula := 'Máximo';
    XLSheet.Cells [6, 2].Formula := '%';
    XLSheet.Cells [5, 4].Formula := 'Real';
    XLSheet.Cells [6, 4].Formula := '$';
    XLSheet.Cells [6, 5].Formula := '%';
    XLSheet.Cells [6, 6].Formula := 'Cumplimiento';

    XLSheet.Range ['B6:C6'].Merge;
    XLSheet.Range ['D5:E5'].Merge;
    XLSheet.Range ['A1:F6'].Font.Bold           := True;
    XLSheet.Range ['A5:F6'].HorizontalAlignment := xlHAlignCenter;

    Range                     := XLSheet.Range ['A5:F6'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row    := 7;
    RowIni := Row;
    QDatos.First;
    while not QDatos.Eof do
    begin
      XLSheet.Cells [Row, 1].Formula := QDatos.FieldByName ('Desc_Region')   .AsString;
      XLSheet.Cells [Row, 2].Formula := QDatos.FieldByName ('Pct_Minimo')    .AsFloat / 100;
      XLSheet.Cells [Row, 3].Formula := QDatos.FieldByName ('Pct_Maximo')    .AsFloat / 100;
      XLSheet.Cells [Row, 4].Formula := QDatos.FieldByName ('Imp_Real')      .AsFloat;
      XLSheet.Cells [Row, 5].Formula := QDatos.FieldByName ('Pct_Real')      .AsFloat / 100;
      XLSheet.Cells [Row, 6].Formula := QDatos.FieldByName ('B_Cumplimiento').AsString;

      QDatos.Next;
      Inc (Row);
    end;
    XLSheet.Cells [Row, 3].Formula := 'Total';
    XLSheet.Cells [Row, 4].Formula := Format ('=SUM(D%d:D%d)', [RowIni, Row - 1]);
    XLSheet.Cells [Row, 5].Formula := Format ('=SUM(E%d:E%d)', [RowIni, Row - 1]);

    Range                     := XLSheet.Range [Format ('A%d:F%d', [Row, Row])];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    XLSheet.Range [Format ('B%d:C%d', [RowIni, Row])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('B%d:B%d', [RowIni, Row])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('C%d:C%d', [RowIni, Row])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('E%d:E%d', [RowIni, Row])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('D%d:D%d', [RowIni, Row])].NumberFormat        := '#,##0.00';
    XLSheet.Range [Format ('E%d:F%d', [RowIni, Row])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Cells [Row, 3].HorizontalAlignment                            := xlHAlignRight;

    XLSheet.Columns ['A'].AutoFit;
    XLSheet.Columns ['B:F'].ColumnWidth := 23;
    XLSheet.Range ['A7'].Select;
    XLApp.ActiveWindow.FreezePanes := True;

    {Inicia la generación de la gráfica}
    XFin := XLSheet.Cells [Row + 1, 7].Left;
    YIni := XLSheet.Cells [Row + 2, 1].Top;

    Chart := XLSheet.ChartObjects.Add (0, YIni, XFin, YIni + 100);
    Chart.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[1].Range['A1:G' + IntToStr (Row - 1)], xlColumns);

    while Chart.Chart.SeriesCollection.Count > 0 do
      Chart.Chart.SeriesCollection [1].Delete;

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Pct. Mínimo"';
    Serie.Values  := Format ('=Tabla!$B$%d:$B$%d',  [RowIni, Row - 1]);
    Serie.XValues := Format ('=Tabla!$A$%d:$A$%d',  [RowIni, Row - 1]);

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Pct. Máximo"';
    Serie.Values  := Format ('=Tabla!$C$%d:$C$%d',  [RowIni, Row - 1]);
    Serie.XValues := Format ('=Tabla!$A$%d:$A$%d',  [RowIni, Row - 1]);

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Pct. Real"';
    Serie.Values  := Format ('=Tabla!$E$%d:$E$%d',  [RowIni, Row - 1]);
    Serie.XValues := Format ('=Tabla!$A$%d:$A$%d',  [RowIni, Row - 1]);
  finally
    Cursor := crArrow;
    XLApp.Workbooks[1].SaveAs (FileName);
    XLApp.Quit;
    XLSheet  := Unassigned;
    Range    := Unassigned;
    XLApp    := Unassigned;
  end;
end;

procedure TWCrCartRegion.sbExportarClick(Sender: TObject);
var
  XLApp: Variant;
begin
   if Objeto.ValidaAccesoEsp('TCRCARTREG_EXPRS',True,True) then
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

procedure TWCrCartRegion.ExportarXLSDetalle (FileName: string);
var
  Factor: double;
  XLApp, XLSheet: Variant;
  Range, Chart, Serie: Variant;
  Row, RowIni, CurrTipo: integer;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  QDetalles.Close;
  QDetalles.DatabaseName                            := Objeto.Apli.DataBaseName;
  QDetalles.SessionName                             := Objeto.Apli.SessionName;
  QDetalles.ParamByName ('peFecha').AsDate          := dpFecha.Date - 1;
  QDetalles.ParamByName ('peFactor').AsFloat        := Factor;
  QDetalles.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QDetalles.ParamByName ('peCartas_Cred').AsString  := BoolToStr (cbCartasCredito.Checked);
  QDetalles.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
  QDetalles.Open;

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

    XLSheet.Cells [2, 1].Formula := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['A2:K2'].Merge;
    XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [3, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [3, 2].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['B3:K3'].Merge;
    XLSheet.Range ['B3'].HorizontalAlignment := xlHAlignRight;

    if cbCartasCredito.Checked then
      XLSheet.Cells [4, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [4, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 6].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 6].Formula := 'No incluye intereses cobrados por anticipado';
    XLSheet.Range ['A4:E4'].Merge;
    XLSheet.Range ['F4:K4'].Merge;
    XLSheet.Range ['F4'].HorizontalAlignment := xlHAlignRight;

    {Encabezado de las columnas}
    XLSheet.Cells [5,  1].Formula := 'Region';
    XLSheet.Cells [5,  2].Formula := 'Tipo Entidad';
    XLSheet.Cells [5,  3].Formula := 'Acreditado';
    XLSheet.Cells [5,  4].Formula := 'ID Acreditado';
    XLSheet.Cells [5,  5].Formula := 'ID Contrato';
    XLSheet.Cells [5,  6].Formula := 'ID Crédito';
    XLSheet.Cells [5,  7].Formula := 'Tipo Crédito';
    XLSheet.Cells [5,  8].Formula := '% Mínimo';
    XLSheet.Cells [5,  9].Formula := '% Máximo';
    XLSheet.Cells [5, 10].Formula := 'Imp. Real';
    XLSheet.Cells [5, 11].Formula := '% Real';

    XLSheet.Range ['A1:K5'].Font.Bold           := True;
    XLSheet.Range ['A5:K5'].HorizontalAlignment := xlHAlignCenter;

    Range                     := XLSheet.Range ['A5:K5'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row := 6;
    while not QDetalles.Eof do
    begin
      XLSheet.Cells [Row,  1].Value := QDetalles.FieldByName ('Desc_Region').AsString;
      XLSheet.Cells [Row,  2].Value := QDetalles.FieldByName ('Tipo_Entidad').AsString;
      XLSheet.Cells [Row,  3].Value := QDetalles.FieldByName ('Nom_Acred_Reg').AsString;
      XLSheet.Cells [Row,  4].Value := QDetalles.FieldByName ('ID_Acreditado').AsFloat;
      XLSheet.Cells [Row,  5].Value := QDetalles.FieldByName ('ID_Contrato').AsFloat;
      XLSheet.Cells [Row,  6].Value := QDetalles.FieldByName ('ID_Credito').AsFloat;
      XLSheet.Cells [Row,  7].Value := QDetalles.FieldByName ('Tipo_Credito').AsString;
      XLSheet.Cells [Row,  8].Value := QDetalles.FieldByName ('Pct_Minimo').AsFloat / 100;
      XLSheet.Cells [Row,  9].Value := QDetalles.FieldByName ('Pct_Maximo').AsFloat / 100;
      XLSheet.Cells [Row, 10].Value := QDetalles.FieldByName ('Imp_Real').AsFloat;
      XLSheet.Cells [Row, 11].Value := QDetalles.FieldByName ('Pct_Real').AsFloat;

      QDetalles.Next;
      Inc (Row);
    end;

    XLSheet.Columns ['B:C'].ColumnWidth := 30;
    XLSheet.Columns ['D:K'].ColumnWidth := 13;
    XLSheet.Columns ['A'].AutoFit;
    XLSheet.Columns ['J'].AutoFit;
    XLSheet.Columns ['H'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Columns ['I'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Columns ['K'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('H4:K%d', [Row - 1])].Style        := 'Percent';
    XLSheet.Range [Format ('H4:K%d', [Row - 1])].NumberFormat := '0.00%';
    XLSheet.Range [Format ('J4:J%d', [Row - 1])].Style        := 'Currency';
    XLSheet.Range ['A6'].Select;
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


procedure TWCrCartRegion.sbExportarDetalleClick(Sender: TObject);
var
  XLApp: Variant;
begin
   if Objeto.ValidaAccesoEsp('TCRCARTREG_EXPDT',True,True) then
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
