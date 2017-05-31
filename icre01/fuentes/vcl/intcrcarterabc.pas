// Sistema         : Clase de CrCarteraBc
// Fecha de Inicio : 02/05/2012
// Función forma   : Clase de CrCarteraBc
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qforlxvhziifraxzhgil
// Comentarios     :
Unit IntCrCarteraBc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl,
IntParamCre, Ungene, ShellAPI, ComObj, IntQrCarteraBc;

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
 TCrCartBnc= class;

  TWCrCartBnc=Class(TForm)
    InterForma1             : TInterForma;
    Panel1: TPanel;
    btBusca: TBitBtn;
    sgBanca: TSGCtrl;
    vlQry: TQuery;
    dpFecha: TDateTimePicker;
    GroupBox1: TGroupBox;
    cbEstados: TCheckBox;
    cbMunicipios: TCheckBox;
    cbOrgDesc: TCheckBox;
    cbPrivado: TCheckBox;
    rgFactorMoneda: TRadioGroup;
    Label1: TLabel;
    cbFederal: TCheckBox;
    sbExportar: TSpeedButton;
    SaveXLS: TSaveDialog;
    QLeyendaEntidades: TQuery;
    QDetalle: TQuery;
    sbExportarDetalle: TSpeedButton;
    cbCartasCredito: TCheckBox;
    cbInteresesAnticipados: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btBuscaClick(Sender: TObject);
    procedure sgBancaCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure InterForma1BtnAyudaClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbExportarDetalleClick(Sender: TObject);
    private
    { Private declarations }

      fltImpReal,
      fltPctReal    : Double;

//      function  fnGeneraConsulta : string;
      function ConstruyeTipoEntidad: string;
      procedure generaDatos();
      procedure ExportarXLS (FileName: string);
      procedure ExportarXLSDetalle (FileName: string);
    public
    { Public declarations }
    Objeto : TCrCartBnc;
end;



 TCrCartBnc= class(TInterFrame)
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

constructor TCrCartBnc.Create( AOwner : TComponent );
begin Inherited; 

      StpName  := ' ';
      UseQuery := False; 
      HelpFile := 'IntCrCarteraBc.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCartBnc.Destroy;
begin inherited;
end;


function TCrCartBnc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCartBnc;
begin
   W:=TWCrCartBnc.Create(Self);
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


Function TCrCartBnc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCarteraBnc.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrCartBnc.Reporte:Boolean;
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrCarteraBc********************)
(*                                                                              *)
(*  FORMA DE CrCarteraBc                                                            *)
(*                                                                              *)
(***********************************************FORMA CrCarteraBc********************)

procedure TWCrCartBnc.FormShow(Sender: TObject);
begin
  dpFecha.Date                 := Objeto.Apli.DameFechaEmpresa;
  InterForma1.BtnAyuda.Caption := '&Imprimir';
  generaDatos;
end;

procedure TWCrCartBnc.FormDestroy(Sender: TObject);
begin
  //Objeto
end;

procedure TWCrCartBnc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCartBnc.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrCartBnc.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrcarteraBc.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


function TWCrCartBnc.ConstruyeTipoEntidad: string;
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

procedure TWCrCartBnc.generaDatos;
var
  Factor: double;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  vlQry.Close;
  vlQry.DatabaseName                            := Objeto.Apli.DataBaseName;
  vlQry.SessionName                             := Objeto.Apli.SessionName;
  vlQry.ParamByName ('peFecha').AsDateTime      := dpFecha.Date - 1;
  vlQry.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  vlQry.ParamByName ('peFactor').AsFloat        := Factor;
  vlQry.ParamByName ('peCartas_Cred').AsString  := BoolToStr (cbCartasCredito.Checked);
  vlQry.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
  vlQry.Open;

  QLeyendaEntidades.Close;
  QLeyendaEntidades.DatabaseName                            := Objeto.Apli.DataBaseName;
  QLeyendaEntidades.SessionName                             := Objeto.Apli.SessionName;
  QLeyendaEntidades.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QLeyendaEntidades.Open;

  sgBanca.BeginGrid;

  sgBanca.Titulo1 := 'Cartera a Estados y Municipios';
  sgBanca.EndCaption;

  try
    if vlQry <> nil then
    begin
      vlQry.FieldByName('CVE_MERCADO').Visible := False;

      vlQry.FieldByName('DESC_MERCADO').DisplayWidth   := 35;
      vlQry.FieldByName('PCT_MINIMO').DisplayWidth     := 11;
      vlQry.FieldByName('PCT_MAXIMO').DisplayWidth     := 11;
      vlQry.FieldByName('IMP_REAL').DisplayWidth       := 22;
      vlQry.FieldByName('PCT_REAL').DisplayWidth       := 11;
      vlQry.FieldByName('B_CUMPLIMIENTO').DisplayWidth := 10;

      vlQry.FieldByName('DESC_MERCADO').DisplayLabel           := '                         Descripción';
      vlQry.FieldByName('PCT_MINIMO').DisplayLabel             := '    Pct Min';
      vlQry.FieldByName('PCT_MINIMO').Alignment                := taCenter;
      vlQry.FieldByName('PCT_MAXIMO').DisplayLabel             := '    Pct Max';
      vlQry.FieldByName('PCT_MAXIMO').Alignment                := taCenter;
      vlQry.FieldByName('IMP_REAL').DisplayLabel               := '              Imp Real';
      vlQry.FieldByName('PCT_REAL').DisplayLabel               := '    Pct Real';
      vlQry.FieldByName('PCT_REAL').Alignment                  := taCenter;
      vlQry.FieldByName('B_CUMPLIMIENTO').DisplayLabel         := '   Cumple';
      vlQry.FieldByName('B_CUMPLIMIENTO').Alignment            := taCenter;

      TFloatField(vlQry.FieldByName('PCT_MINIMO')).DisplayFormat := '###,###,###,###,###.00';
      TFloatField(vlQry.FieldByName('PCT_MAXIMO')).DisplayFormat := '###,###,###,###,###.00';
      TFloatField(vlQry.FieldByName('PCT_REAL')).DisplayFormat   := '###,###,###,###,###.00';
      TFloatField(vlQry.FieldByName('IMP_REAL')).DisplayFormat   := '###,###,###,###,###.00';

      //grdLimites.AddQry( vlQry, True,True,0,0,0,False); // AGREGAR QUERY

      sgBanca.AddQry(vlQry, // Query
            True, // Iniciar Grid, Limpiar Lineas Anteriores.
            True, // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
            -1,   // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
            ALTO_COL,  // Alto del Header, -1 es el Default 32 Columnas
            ALTO_DOBLE,// Alto del las Lineas, 1 es el Default 32
            True); // ShowTitle
    end
    else begin
      sgBanca.AddTitle('NO EXISTEN DATOS', TcCenter);
    end;

    sgBanca.ShowTab := true;
    sgBanca.ShowBtnFirst := true;
    sgBanca.ShowBtnLast := true;
    sgBanca.ShowBtnPriorNext := true;
    sgBanca.EndGrid;

  finally
  {  if vlQry <> nil then
       vlQry.free;}
    //end if
  end;

end;

procedure TWCrCartBnc.btBuscaClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCARTBNC_INIBS',True,True) then
   begin
      generaDatos;
   end;
end;

procedure TWCrCartBnc.sgBancaCalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
var
  sTitulo : String;
begin
  sTitulo := '                                       Subtotal';
  Case RowCaso of
    rcQueryBegin : begin
        fltImpReal := 0.0;
        fltPctReal := 0.0;
      end; // rcQueryBegin

    rcRowBegin : begin
        sgBanca.SetActualHeight (ALTO_COL);
        fltImpReal := fltImpReal + DataSet.FieldByName('IMP_REAL').AsFloat;
        fltPctReal := fltPctReal + DataSet.FieldByName('PCT_REAL').AsFloat;
      end;  // rcRowBegin

    rcQueryEnd : begin
        sgBanca.ToHeader(sgBanca.AddHeader(['',sTitulo, '', '',
                  FormatFloat('###,###,###,###,###.00', fltImpReal),
                  FormatFloat('###,###.00', fltPctReal)], -1, clWindowText));
      end;  // rcQueryEnd

  end; // case of

end;

procedure TWCrCartBnc.InterForma1BtnAyudaClick(Sender: TObject);
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
    QrCartBnc.genRPTCarteraBnc(dpFecha.Date - 1, Factor, QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString, cbCartasCredito.Checked, cbInteresesAnticipados.Checked, Objeto.Apli, vlQry, true)
  except
    MessageDlg('No es posible mostrar el Reporte -IntCrCarteraBc-', mtError, [mbOK], 0);
  end;
end;

procedure TWCrCartBnc.ExportarXLS (FileName: string);
var
  XLApp, XLSheet, Range: Variant;
  Chart, Serie: Variant;
  Row, RowIni: integer;
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
      XLSheet.Cells [4, 3].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 3].Formula := 'No incluye intereses cobrados por anticipado';
    XLSheet.Range ['A4:B4'].Merge;
    XLSheet.Range ['C4:F4'].Merge;
    XLSheet.Range ['C4'].HorizontalAlignment := xlHAlignRight;

    {Encabezado de las columnas}
    XLSheet.Cells [6, 1].Formula := 'Concepto';
    XLSheet.Cells [5, 2].Formula := 'Mínimo';
    XLSheet.Cells [5, 3].Formula := 'Máximo';
    XLSheet.Cells [6, 2].Formula := '%';
    XLSheet.Cells [5, 4].Formula := 'Real';
    XLSheet.Cells [6, 4].Formula := '$';
    XLSheet.Cells [6, 5].Formula := '%';
    XLSheet.Cells [6, 6].Formula := 'Cumplimiento';

    XLSheet.Range ['B6:C6'].Merge;
    XLSheet.Range ['D5:E5'].Merge;
    XLSheet.Range ['A1:F6'].Font.Bold := True;

    Range                     := XLSheet.Range ['A5:F6'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;
    Range.HorizontalAlignment := xlHAlignCenter;

    Row    := 7;
    RowIni := Row;
    vlQry.First;
    while not vlQry.Eof do
    begin
      XLSheet.Cells [Row, 1].Formula := vlQry.FieldByName ('DESC_MERCADO').AsString;
      XLSheet.Cells [Row, 2].Value   := vlQry.FieldByName ('PCT_MINIMO').AsFloat / 100;
      XLSheet.Cells [Row, 3].Value   := vlQry.FieldByName ('PCT_MAXIMO').AsFloat / 100;
      XLSheet.Cells [Row, 4].Formula := vlQry.FieldByName ('IMP_REAL').AsString;
      XLSheet.Cells [Row, 5].Value   := vlQry.FieldByName ('PCT_REAL').AsFloat   / 100;
      XLSheet.Cells [Row, 6].Formula := vlQry.FieldByName ('B_CUMPLIMIENTO').AsString;

      XLSheet.Range [Format ('D%d',    [Row])].Style               := 'Currency';
      XLSheet.Range [Format ('B7:C%d', [Row])].Style               := 'Percent';
      XLSheet.Range [Format ('B7:C%d', [Row])].NumberFormat        := '0.00%';
      XLSheet.Range [Format ('B7:C%d', [Row])].HorizontalAlignment := xlHAlignCenter;

      XLSheet.Range [Format ('E%d', [Row])].Style                  := 'Percent';
      XLSheet.Range [Format ('E%d', [Row])].NumberFormat           := '0.00%';
      XLSheet.Range [Format ('E%d', [Row])].HorizontalAlignment    := xlHAlignCenter;

      Inc (Row);
      vlQry.Next;
    end;
    XLSheet.Cells [Row, 1].Formula := 'Total';
    XLSheet.Cells [Row, 4].Formula := Format ('=Sum(D%d:D%d)', [RowIni, Row - 1]);
    XLSheet.Cells [Row, 5].Formula := Format ('=Sum(E%d:E%d)', [RowIni, Row - 1]);

    XLSheet.Range [Format ('D%d',    [Row])].Style               := 'Currency';
    XLSheet.Range [Format ('B7:C%d', [Row])].Style               := 'Percent';
    XLSheet.Range [Format ('B7:C%d', [Row])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('B7:C%d', [Row])].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Range [Format ('E%d', [Row])].Style                  := 'Percent';
    XLSheet.Range [Format ('E%d', [Row])].NumberFormat           := '0.00%';
    XLSheet.Range [Format ('E%d', [Row])].HorizontalAlignment    := xlHAlignCenter;


    Range                     := XLSheet.Range [Format ('A%d', [Row])];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Range                     := XLSheet.Range [Format ('D%d:E%d', [Row, Row])];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    XLSheet.Range [Format ('B%d:C%d', [RowIni, Row])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('D%d:D%d', [RowIni, Row])].NumberFormat        := '#,##0.00';
    XLSheet.Range [Format ('E%d:F%d', [RowIni, Row])].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Columns ['A'].AutoFit;
    XLSheet.Columns ['B:F'].ColumnWidth := 20;
    XLSheet.Range ['A7'].Select;
    XLApp.ActiveWindow.FreezePanes := True;

    {Genera la hoja para la gráfica}
    XLApp.Workbooks [1].WorkSheets.Add (Null, XLApp.Workbooks [1].WorkSheets [1]);
    XLSheet      := XLApp.Workbooks[1].WorkSheets[2];
    XLSheet.Name := 'Gráfica';

    XLSheet.Cells [1, 1].Formula := Caption;  // Título del reporte
    XLSheet.Range ['A1:N1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [2, 1].Formula := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['A2:N2'].Merge;
    XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [3, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [3, 3].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['C3:N3'].Merge;
    XLSheet.Range ['C3'].HorizontalAlignment := xlHAlignRight;

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
    XLSheet.Range ['A1:N4'].Font.Bold        := True;

    Chart := XLSheet.ChartObjects.Add (10, 65, 820, 300);
    Chart.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[1].Range['A1:G' + IntToStr (Row - 1)], xlColumns);

    Chart.Chart.SeriesCollection [1].Delete;

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Pct Mínimo"';
    Serie.Values  := '=Tabla!$B$5:$B$' + IntToStr (Row - 1);
    Serie.XValues := '=Tabla!$A$5:$A$' + IntToStr (Row - 1);

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Pct Máximo"';
    Serie.Values  := '=Tabla!$C$5:$C$' + IntToStr (Row - 1);
    Serie.XValues := '=Tabla!$A$5:$A$' + IntToStr (Row - 1);

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Pct Real"';
    Serie.Values  := '=Tabla!$E$5:$E$' + IntToStr (Row - 1);
    Serie.XValues := '=Tabla!$A$5:$A$' + IntToStr (Row - 1);

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


procedure TWCrCartBnc.sbExportarClick(Sender: TObject);
var
  XLApp: Variant;
begin
   if Objeto.ValidaAccesoEsp('TCRCARTBNC_EXPRS',True,True) then
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

procedure TWCrCartBnc.sbExportarDetalleClick(Sender: TObject);
var
  XLApp: Variant;
begin
   if Objeto.ValidaAccesoEsp('TCRCARTBNC_EXPDT',True,True) then
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

procedure TWCrCartBnc.ExportarXLSDetalle (FileName: string);
var
  Factor: double;
  XLApp, XLSheet, Range: Variant;
  Chart, Serie: Variant;
  Row, RowIni: integer;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  QDetalle.Close;
  QDetalle.DatabaseName                            := Objeto.Apli.DataBaseName;
  QDetalle.SessionName                             := Objeto.Apli.SessionName;
  QDetalle.ParamByName ('peFecha').AsDateTime      := dpFecha.Date - 1;
  QDetalle.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QDetalle.ParamByName ('peFactor').AsFloat        := Factor;
  QDetalle.ParamByName ('peCartas_Cred').AsString  := BoolToStr (cbCartasCredito.Checked);
  QDetalle.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
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
    XLSheet.Range ['A1:K4'].Font.Bold        := True;

    {Encabezado de las columnas}
    XLSheet.Cells [5,  1].Formula := 'Mercado';
    XLSheet.Cells [5,  2].Formula := 'Tipo Entidad';
    XLSheet.Cells [5,  3].Formula := 'Acreditado';
    XLSheet.Cells [5,  4].Formula := 'ID Acreditado';
    XLSheet.Cells [5,  5].Formula := 'ID Contrato';
    XLSheet.Cells [5,  6].Formula := 'ID Crédito';
    XLSheet.Cells [5,  7].Formula := 'Tipo Crédito';
    XLSheet.Cells [5,  8].Formula := '% Mínimo';
    XLSheet.Cells [5,  9].Formula := '% Máximo';
    XLSheet.Cells [5, 10].Formula := 'Importe';
    XLSheet.Cells [5, 11].Formula := '% Real';

    XLSheet.Range ['A5:K5'].HorizontalAlignment := xlHAlignCenter;

    Range                     := XLSheet.Range ['A5:K5'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row := 6;
    while not QDetalle.Eof do
    begin
      XLSheet.Cells [Row,  1].Value := QDetalle.FieldByName ('Desc_Mercado').AsString;
      XLSheet.Cells [Row,  2].Value := QDetalle.FieldByName ('Tipo_Entidad').AsString;
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

    XLSheet.Columns ['A:C'].ColumnWidth := 20;
    XLSheet.Columns ['D:K'].ColumnWidth := 13;
    XLSheet.Range [Format ('J4:J%d', [Row - 1])].Style               := 'Currency';
    XLSheet.Range [Format ('H4:I%d', [Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('H4:I%d', [Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('H4:I%d', [Row - 1])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('K4:K%d', [Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('K4:K%d', [Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('K4:K%d', [Row - 1])].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Range ['A6'].Select;
    XLApp.ActiveWindow.FreezePanes := True;
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
