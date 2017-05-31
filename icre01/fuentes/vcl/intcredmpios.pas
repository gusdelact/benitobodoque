// Sistema         : Clase de NINGUNO
// Fecha de Inicio : 24/04/2012
// Función forma   : Clase de NINGUNO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qforlxvhziifraxzhgil
// Comentarios     :
Unit IntCrEdMpios;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, Ungene, IntSGCtrl, Grids,
ShellAPI, ComObj, IntQrEdMpios;

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


Type
 TCrEdMpios = class;

  TWCrEdMpios=Class(TForm)
    InterForma1             : TInterForma;
    sgEdMpios: TSGCtrl;
    Panel1: TPanel;
    vlQry: TQuery;
    dpFecha: TDateTimePicker;
    rgFactorMoneda: TRadioGroup;
    Label1: TLabel;
    SaveXLS: TSaveDialog;
    sbExportar: TSpeedButton;
    btBusca: TBitBtn;
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
    procedure InterForma1BtnAyudaClick(Sender: TObject);
    procedure sgEdMpiosCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure sbExportarClick(Sender: TObject);
    procedure sbExportarDetalleClick(Sender: TObject);
    private
    { Private declarations }

      fltPctMinimo,
      fltPctMaximo,
      fltImpReal,
      fltPctReal    : Double;

      procedure generaDatos();
      procedure ExportarXLS (FileName: string);
      procedure ExportarXLSDetalle (FileName: string);
    public
    { Public declarations }
    Objeto : TCrEdMpios;
end;

 TCrEdMpios = class(TInterFrame)
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

constructor TCrEdMpios.Create( AOwner : TComponent );
begin Inherited; 

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCrEdMpios.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrEdMpios.Destroy;
begin inherited;
end;


function TCrEdMpios.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrEdMpios;
begin
   W:=TWCrEdMpios.Create(Self);
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


Function TCrEdMpios.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('INinguno.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrEdMpios.Reporte:Boolean;
begin //Execute_Reporte(); 
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TWCrEdMpios.FormShow(Sender: TObject);
begin
  InterForma1.BtnAyuda.Caption := '&Imprimir';
  dpFecha.DateTime             := Objeto.Apli.DameFechaEmpresa;
  generaDatos;
end;

procedure TWCrEdMpios.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWCrEdMpios.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrEdMpios.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrEdMpios.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrEdMpios.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrEdMpios.generaDatos;
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
  vlQry.DatabaseName                           := Objeto.Apli.DataBaseName;
  vlQry.SessionName                            := Objeto.Apli.SessionName;
  vlQry.ParamByName ('peFecha').AsDateTime     := dpFecha.DateTime - 1;
  vlQry.ParamByName ('peFactor').AsFloat       := Factor;
  vlQry.ParamByName ('peCartas_Cred').AsString := BoolToStr (cbCartasCredito.Checked);
  vlQry.ParamByName ('peInt_Cob_Ant').AsString := BoolToStr (cbInteresesAnticipados.Checked);
  vlQry.Open;

  sgEdMpios.BeginGrid;

  sgEdMpios.Titulo1 := 'Cartera a Estados y Municipios';
  sgEdMpios.EndCaption;

  try
    if vlQry <> nil then
    begin
      vlQry.FieldByName('TIPO').Visible      := False;
      vlQry.FieldByName('DESC_TIPO').Visible := False;
      vlQry.FieldByName('GRUPO').Visible     := False;

      vlQry.FieldByName('DESC_TITULO').DisplayWidth    := 30;
      vlQry.FieldByName('PCT_MINIMO').DisplayWidth     := 11;
      vlQry.FieldByName('PCT_MAXIMO').DisplayWidth     := 11;
      vlQry.FieldByName('IMP_REAL').DisplayWidth       := 22;
      vlQry.FieldByName('PCT_REAL').DisplayWidth       := 11;
      vlQry.FieldByName('B_CUMPLIMIENTO').DisplayWidth := 10;

      vlQry.FieldByName('PCT_MINIMO').Alignment     := taCenter;
      vlQry.FieldByName('PCT_MAXIMO').Alignment     := taCenter;
      vlQry.FieldByName('PCT_REAL').Alignment       := taCenter;
      vlQry.FieldByName('B_CUMPLIMIENTO').Alignment := taCenter;

      vlQry.FieldByName('DESC_TITULO').DisplayLabel    := '                      Descripción';
      vlQry.FieldByName('PCT_MINIMO').DisplayLabel     := '    Pct Min';
      vlQry.FieldByName('PCT_MAXIMO').DisplayLabel     := '    Pct Max';
      vlQry.FieldByName('IMP_REAL').DisplayLabel       := '              Imp Real';
      vlQry.FieldByName('PCT_REAL').DisplayLabel       := '    Pct Real';
      vlQry.FieldByName('B_CUMPLIMIENTO').DisplayLabel := '   Cumple';

      TFloatField(vlQry.FieldByName('IMP_REAL')).DisplayFormat   := '###,###,###,###,###.00';
      TFloatField(vlQry.FieldByName('PCT_MINIMO')).DisplayFormat := '###,###,###,###,###.00';
      TFloatField(vlQry.FieldByName('PCT_MAXIMO')).DisplayFormat := '###,###,###,###,###.00';
      TFloatField(vlQry.FieldByName('PCT_REAL')).DisplayFormat   := '###,###,###,###,###.00';

      //grdLimites.AddQry( vlQry, True,True,0,0,0,False); // AGREGAR QUERY

      sgEdMpios.AddQry(vlQry, // Query
            True, // Iniciar Grid, Limpiar Lineas Anteriores.
            True, // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
            -1,   // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
            ALTO_COL,  // Alto del Header, -1 es el Default 32 Columnas
            ALTO_DOBLE,// Alto del las Lineas, 1 es el Default 32
            True); // ShowTitle
    end
    else begin
      sgEdMpios.AddTitle('NO EXISTEN DATOS', TcCenter);
    end;

    sgEdMpios.ShowTab := true;
    sgEdMpios.ShowBtnFirst := true;
    sgEdMpios.ShowBtnLast := true;
    sgEdMpios.ShowBtnPriorNext := true;
    sgEdMpios.EndGrid;

  finally
  end;
end;

procedure TWCrEdMpios.btBuscaClick(Sender: TObject);
begin
  generaDatos;
end;

procedure TWCrEdMpios.InterForma1BtnAyudaClick(Sender: TObject);
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
    QrEdMpios.genRPTEdMpios(dpFecha.Date - 1, Factor, cbCartasCredito.Checked, cbInteresesAnticipados.Checked,vlQry, Objeto.Apli, True);
  except
    MessageDlg('No es posible mostrar el Reporte -IntCrEdMpios-', mtError, [mbOK], 0);
  end;
end;

procedure TWCrEdMpios.sgEdMpiosCalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
var
  sTitulo : String;
begin
  sTitulo := '                                       Subtotal';
  Case RowCaso of
    rcQueryBegin : begin
        fltPctMinimo := 0.0;
        fltPctMaximo := 0.0;
        fltImpReal := 0.0;
        fltPctReal := 0.0;
      end; // rcQueryBegin
    rcRowBegin : begin
        sgEdMpios.SetActualHeight(ALTO_COL);

        if (trim(DataSet.FieldByName('GRUPO').asString) = '1') and (trim(DataSet.FieldByName('TIPO').asString) = '1' ) then
        begin
          sgEdMpios.ToHeader(sgEdMpios.AddHeader(['','','',sTitulo, '',
                  '',
                  FormatFloat('###,###,###,###,###.00', fltImpReal),
                  FormatFloat('###,###.00', fltPctReal)], -1, clWindowText));
          fltPctMinimo := 0.0;
          fltPctMaximo := 0.0;
          fltImpReal := 0.0;
          fltPctReal := 0.0;

        end;

        if trim(DataSet.FieldByName('GRUPO').asString) = '1' then
          sgEdMpios.ToHeader(sgEdMpios.AddHeader(['','','',DataSet.FieldByName('DESC_TIPO').asString], -1, clWindowText));

        fltPctMinimo := fltPctMinimo + DataSet.FieldByName('PCT_MINIMO').AsFloat;
        fltPctMaximo := fltPctMaximo + DataSet.FieldByName('PCT_MAXIMO').AsFloat;
        fltImpReal := fltImpReal + DataSet.FieldByName('IMP_REAL').AsFloat;
        fltPctReal := fltPctReal + DataSet.FieldByName('PCT_REAL').AsFloat;

      end;  // rcRowBegin
    rcQueryEnd : begin
        sgEdMpios.ToHeader(sgEdMpios.AddHeader(['','','',sTitulo, '',
                  '',
                  FormatFloat('###,###,###,###,###.00', fltImpReal),
                  FormatFloat('###,###.00', fltPctReal)], -1, clWindowText));
      end;
  end; // case of
end;

procedure TWCrEdMpios.sbExportarClick(Sender: TObject);
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

procedure TWCrEdMpios.ExportarXLS (FileName: string);
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
    XLSheet.Range ['A1:G1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [2, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [2, 2].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
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

    XLSheet.Range ['C5:D5'].Merge;
    XLSheet.Range ['E4:F4'].Merge;

    Range                     := XLSheet.Range ['A4:G5'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;
    Range.HorizontalAlignment := xlHAlignCenter;

    Row      := 6;
    RowIni   := Row;
    CurrTipo := -1;
    vlQry.First;
    while not vlQry.Eof do
    begin
      {Si es corte de grupo}
      if CurrTipo <> vlQry.FieldByName ('Tipo').AsInteger then
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

          XLSheet.Range [Format ('F%d', [Row])].HorizontalAlignment := xlHAlignCenter;

          Inc (Row, 2);
          RowIni := Row;
        end;
        XLSheet.Cells [Row, 1].Formula   := vlQry.FieldByName ('Desc_Tipo').AsString;
        XLSheet.Cells [Row, 1].Font.Bold := True;
        CurrTipo                         := vlQry.FieldByName ('Tipo').AsInteger;
      end;
      XLSheet.Cells [Row, 2].Formula := vlQry.FieldByName ('Desc_Titulo').AsString;
      XLSheet.Cells [Row, 3].Value   := vlQry.FieldByName ('Pct_Minimo').AsFloat / 100;
      XLSheet.Cells [Row, 4].Value   := vlQry.FieldByName ('Pct_Maximo').AsFloat / 100;
      XLSheet.Cells [Row, 5].Value   := vlQry.FieldByName ('Imp_Real').AsFloat;
      XLSheet.Cells [Row, 6].Value   := vlQry.FieldByName ('Pct_Real').AsFloat   / 100;
      XLSheet.Cells [Row, 7].Formula := vlQry.FieldByName ('B_Cumplimiento').AsString;

      XLSheet.Range [Format ('C%d:D%d', [Row, Row])].Style               := 'Percent';
      XLSheet.Range [Format ('C%d:D%d', [Row, Row])].NumberFormat        := '0.00%';
      XLSheet.Range [Format ('C%d:D%d', [Row, Row])].HorizontalAlignment := xlHAlignCenter;

      XLSheet.Range [Format ('E%d', [Row])].Style                        := 'Currency';

      XLSheet.Range [Format ('F%d', [Row])].Style                        := 'Percent';
      XLSheet.Range [Format ('F%d', [Row])].NumberFormat                 := '0.00%';
      XLSheet.Range [Format ('F%d', [Row])].HorizontalAlignment          := xlHAlignCenter;
      vlQry.Next;
      Inc (Row);
    end;

    {Resumen del último grupo si es que hubo algún grupo}
    if CurrTipo <> -1 then
    begin
      XLSheet.Cells [Row, 2].Formula := 'Total';
      XLSheet.Cells [Row, 5].Formula := Format ('=Sum(E%d:E%d)', [RowIni, Row - 1]);
      XLSheet.Cells [Row, 6].Formula := Format ('=Sum(F%d:F%d)', [RowIni, Row - 1]);
      XLSheet.Range [Format ('B%d:F%d', [Row, Row])].Font.Bold := True;

      XLSheet.Range [Format ('F%d', [Row])].HorizontalAlignment := xlHAlignCenter;

      Range                     := XLSheet.Range [Format ('B%d:G%d', [Row, Row])];
      Range.Interior.ThemeColor := xlThemeColorLight1;
      Range.Font.Bold           := True;
      Range.Font.ThemeColor     := xlThemeColorDark1;
    end;

    XLSheet.Range [Format ('G5:G%d', [Row])].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Columns ['A:B'].AutoFit;
    XLSheet.Columns ['C:G'].ColumnWidth := 20;
    XLSheet.Range ['A6'].Select;
    XLApp.ActiveWindow.FreezePanes := True;

    {Genera una hoja oculta sin datos formateados para la gráfica}
    XLApp.Workbooks [1].WorkSheets.Add (Null, XLApp.Workbooks [1].WorkSheets [1]);
    XLSheet      := XLApp.Workbooks[1].WorkSheets[2];
    XLSheet.Name := 'Datos';

    Row := 1;
    vlQry.First;
    while not vlQry.Eof do
    begin
      XLSheet.Cells [Row, 1].Formula := vlQry.FieldByName ('Desc_Tipo').AsString;
      XLSheet.Cells [Row, 2].Formula := vlQry.FieldByName ('Desc_Titulo').AsString;
      XLSheet.Cells [Row, 3].Formula := vlQry.FieldByName ('Pct_Minimo').AsString;
      XLSheet.Cells [Row, 4].Formula := vlQry.FieldByName ('Pct_Maximo').AsString;
      XLSheet.Cells [Row, 5].Value   := vlQry.FieldByName ('Imp_Real').AsFloat;
      XLSheet.Cells [Row, 6].Value   := vlQry.FieldByName ('Pct_Real').AsFloat;
      XLSheet.Cells [Row, 7].Formula := vlQry.FieldByName ('B_Cumplimiento').AsString;
      vlQry.Next;
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
    XLSheet.Cells [2, 4].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['D2:N2'].Merge;
    XLSheet.Range ['D2'].HorizontalAlignment := xlHAlignRight;
    XLSheet.Range ['A2:N3'].Font.Bold        := True;

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

    Chart := XLSheet.ChartObjects.Add (10, 50, 820, 320);
    Chart.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[2].Range['A1:G' + IntToStr (Row - 1)], xlColumns);

    Chart.Chart.SeriesCollection [1].Delete;

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Pct Mínimo"';
    Serie.Values  := '=Datos!$C$1:$C$' + IntToStr (Row - 1);
    Serie.XValues := '=Datos!$B$1:$B$' + IntToStr (Row - 1);

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Pct Máximo"';
    Serie.Values  := '=Datos!$D$1:$D$' + IntToStr (Row - 1);
    Serie.XValues := '=Datos!$B$1:$B$' + IntToStr (Row - 1);

    Serie         := Chart.Chart.SeriesCollection.NewSeries;
    Serie.Name    := '="Pct Real"';
    Serie.Values  := '=Datos!$F$1:$F$' + IntToStr (Row - 1);
    Serie.XValues := '=Datos!$B$1:$B$' + IntToStr (Row - 1);

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

procedure TWCrEdMpios.ExportarXLSDetalle (FileName: string);
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

  QDetalle.Close;
  QDetalle.DatabaseName                           := Objeto.Apli.DataBaseName;
  QDetalle.SessionName                            := Objeto.Apli.SessionName;
  QDetalle.ParamByName ('peFecha').AsDateTime     := dpFecha.DateTime - 1;
  QDetalle.ParamByName ('peFactor').AsFloat       := Factor;
  QDetalle.ParamByName ('peCartas_Cred').AsString := BoolToStr (cbCartasCredito.Checked);
  QDetalle.ParamByName ('peInt_Cob_Ant').AsString := BoolToStr (cbInteresesAnticipados.Checked);
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
    XLSheet.Range ['A1:L1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [2, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [2, 2].Formula := 'Información expresada en ' + rgFactorMoneda.Items [rgFactorMoneda.ItemIndex];
    XLSheet.Range ['B2:L2'].Merge;
    XLSheet.Range ['B2'].HorizontalAlignment := xlHAlignRight;

    if cbCartasCredito.Checked then
      XLSheet.Cells [3, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [3, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [3, 7].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [3, 7].Formula := 'No incluye intereses cobrados por anticipado';
    XLSheet.Range ['A3:F3'].Merge;
    XLSheet.Range ['G3:L3'].Merge;
    XLSheet.Range ['G3'].HorizontalAlignment := xlHAlignRight;

    {Encabezado de las columnas}
    XLSheet.Cells [4,  1].Formula := 'Clasificación';
    XLSheet.Cells [4,  2].Formula := 'Tipo Entidad';
    XLSheet.Cells [4,  3].Formula := 'Concepto';
    XLSheet.Cells [4,  4].Formula := 'Acreditado';
    XLSheet.Cells [4,  5].Formula := 'ID Acreditado';
    XLSheet.Cells [4,  6].Formula := 'ID Contrato';
    XLSheet.Cells [4,  7].Formula := 'ID Crédito';
    XLSheet.Cells [4,  8].Formula := 'Tipo Crédito';
    XLSheet.Cells [4,  9].Formula := '% Mínimo';
    XLSheet.Cells [4, 10].Formula := '% Máximo';
    XLSheet.Cells [4, 11].Formula := 'Imp. Real';
    XLSheet.Cells [4, 12].Formula := '% Real';

    Range                     := XLSheet.Range ['A4:L4'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;
    Range.HorizontalAlignment := xlHAlignCenter;

    Row := 5;
    while not QDetalle.Eof do
    begin
      XLSheet.Cells [Row,  1].Value := QDetalle.FieldByName ('Clasificacion').AsString;
      XLSheet.Cells [Row,  2].Value := QDetalle.FieldByName ('Tipo_Entidad').AsString;
      XLSheet.Cells [Row,  3].Value := QDetalle.FieldByName ('Descripcion').AsString;
      XLSheet.Cells [Row,  4].Value := QDetalle.FieldByName ('Nom_Acred_Reg').AsString;
      XLSheet.Cells [Row,  5].Value := QDetalle.FieldByName ('ID_Acreditado').AsString;
      XLSheet.Cells [Row,  6].Value := QDetalle.FieldByName ('ID_Contrato').AsString;
      XLSheet.Cells [Row,  7].Value := QDetalle.FieldByName ('ID_Credito').AsString;
      XLSheet.Cells [Row,  8].Value := QDetalle.FieldByName ('Tipo_Credito').AsString;
      XLSheet.Cells [Row,  9].Value := QDetalle.FieldByName ('Pct_Minimo').AsFloat / 100;
      XLSheet.Cells [Row, 10].Value := QDetalle.FieldByName ('Pct_Maximo').AsFloat / 100;
      XLSheet.Cells [Row, 11].Value := QDetalle.FieldByName ('Imp_Real').AsFloat;
      XLSheet.Cells [Row, 12].Value := QDetalle.FieldByName ('Pct_Real').AsFloat   / 100;

      QDetalle.Next;
      Inc (Row);
    end;

    XLSheet.Columns ['A:D'].ColumnWidth := 20;
    XLSheet.Columns ['E:L'].ColumnWidth := 13;
    XLSheet.Range [Format ('K4:K%d', [Row - 1])].Style               := 'Currency';
    XLSheet.Range [Format ('I4:J%d', [Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('I4:J%d', [Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('I4:J%d', [Row - 1])].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range [Format ('L4:L%d', [Row - 1])].Style               := 'Percent';
    XLSheet.Range [Format ('L4:L%d', [Row - 1])].NumberFormat        := '0.00%';
    XLSheet.Range [Format ('L4:L%d', [Row - 1])].HorizontalAlignment := xlHAlignCenter;

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

procedure TWCrEdMpios.sbExportarDetalleClick(Sender: TObject);
var
  XLApp: Variant;
begin
  sbExportarDetalle.Refresh;
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

end.
