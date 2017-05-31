// Sistema         : Clase de CRCOMPBANCA
// Fecha de Inicio : 09/07/2012
// Función forma   : Clase de CRCOMPBANCA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrCompBan;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
  UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, IntQrCompBan, ShellAPI, ComObj;

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

Type
  TCrCompBan = class;

  TWCrCompBanca=Class(TForm)
    InterForma1             : TInterForma;
    Panel1: TPanel;
    SGCompBanca: TSGCtrl;
    Label1: TLabel;
    dpFecha: TDateTimePicker;
    rgFactorMoneda: TRadioGroup;
    btBusca: TBitBtn;
    sbExportar: TSpeedButton;
    GroupBox1: TGroupBox;
    cbEstados: TCheckBox;
    cbMunicipios: TCheckBox;
    cbOrgDesc: TCheckBox;
    cbPrivado: TCheckBox;
    cbFederal: TCheckBox;
    SaveXLS: TSaveDialog;
    QLeyendaEntidades: TQuery;
    QCompBanca: TQuery;
    QCompBancaBanca: TStringField;
    QCompBancaDesc_Banca: TStringField;
    QCompBancaDesc_Sub_Banca: TStringField;
    QCompBancaImp_Real: TFloatField;
    QCompBancaImp_Presup: TFloatField;
    QCompBancaImp_Crecimiento: TFloatField;
    QCompBancaG1: TFloatField;
    sbExportarDetalles: TSpeedButton;
    QDetalles: TQuery;
    cbCartasCredito: TCheckBox;
    cbInteresesAnticipados: TCheckBox;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btBuscaClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure SGCompBancaCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure InterForma1BtnAyudaClick(Sender: TObject);
    procedure sbExportarDetallesClick(Sender: TObject);
    private
      { Private declarations }
      procedure GeneraConsulta;
      function ConstruyeTipoEntidad: string;
      procedure ExportarXLS (FileName: string);
      procedure ExportarDetallesXLS (FileName: string);
    public
      { Public declarations }
      Objeto : TCrCompBan;
  end;

  TCrCompBan= class(TInterFrame)
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


constructor TCrCompBan.Create( AOwner : TComponent );
begin
  Inherited;
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntCrcompban.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrCompBan.Destroy;
begin
  inherited;
end;


function TCrCompBan.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWCrCompBanca;
begin
   W:=TWCrCompBanca.Create(Self);
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


Function TCrCompBan.InternalBusca: Boolean;
var
  T: TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrcompb.it','');
  Try if Active then begin end;
      if T.Execute then InternalBusca := FindKey([]);
  finally  T.Free;
  end;
end;

function TCrCompBan.Reporte:Boolean;
begin //Execute_Reporte();
end;

function BoolToStr (b: boolean): string;
begin
  if b then
    result := 'V'
  else
    result := 'F';
end;

(***********************************************FORMA CRCOMPBANCA********************)
(*                                                                              *)
(*  FORMA DE CRCOMPBANCA                                                            *)
(*                                                                              *)
(***********************************************FORMA CRCOMPBANCA********************)

procedure TWCrCompBanca.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWCrCompBanca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrCompBanca.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrCompBanca.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCompBanca.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCrCompBanca.FormShow(Sender: TObject);
begin
  Interforma1.btnAyuda.Caption := '&Imprimir';
  dpFecha.Date                 := Objeto.Apli.DameFechaEmpresa;
  GeneraConsulta;
end;

procedure TWCrCompBanca.GeneraConsulta;
var
  Factor: double;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  QCompBanca.Close;
  QCompBanca.DatabaseName                            := Objeto.Apli.DataBaseName;
  QCompBanca.SessionName                             := Objeto.Apli.SessionName;
  QCompBanca.ParamByName ('peFecha').AsDate          := dpFecha.Date - 1;
  QCompBanca.ParamByName ('peFactor').AsFloat        := Factor;
  QCompBanca.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QCompBanca.ParamByName ('peCartas_Cred').AsString  := BoolToStr (cbCartasCredito.Checked);
  QCompBanca.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
  QCompBanca.Open;

  QCompBancaImp_Real.DisplayLabel   := FormatDateTime ('"      Saldo" mmm/yy',       dpFecha.Date);
  QCompBancaImp_Presup.DisplayLabel := FormatDateTime ('" Presupuesto" mmm/yy', dpFecha.Date);

  QLeyendaEntidades.Close;
  QLeyendaEntidades.DatabaseName                            := Objeto.Apli.DataBaseName;
  QLeyendaEntidades.SessionName                             := Objeto.Apli.SessionName;
  QLeyendaEntidades.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QLeyendaEntidades.Open;

  SGCompBanca.AddQry(QCompBanca, // Query
        True, // Iniciar Grid, Limpiar Lineas Anteriores.
        True, // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
        -1,   // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
        ALTO_COL,  // Alto del Header, -1 es el Default 32 Columnas
        ALTO_DOBLE,// Alto del las Lineas, 1 es el Default 32
        True); // ShowTitle
end;

function TWCrCompBanca.ConstruyeTipoEntidad: string;
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

procedure TWCrCompBanca.btBuscaClick(Sender: TObject);
begin
  GeneraConsulta;
end;

procedure TWCrCompBanca.sbExportarClick(Sender: TObject);
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

procedure TWCrCompBanca.SGCompBancaCalcRow(Sendet: TObject;
  DataSet: TDataSet; CurrRow: Integer; RowCaso: TRowCaso;
  var ShowRow: Boolean);
begin
  if RowCaso = rcRowBegin then
  begin
    (Sendet as TSGCtrl).SetActualHeight(ALTO_COL);
    if DataSet.FieldByName('G1').AsInteger = 1 then
      (Sendet as TSGCtrl).ToHeader (CurrRow);
  end;
end;

procedure TWCrCompBanca.InterForma1BtnAyudaClick(Sender: TObject);
var
  Factor: double;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  RepComparativoBanca (dpFecha.Date, Factor, QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString, cbCartasCredito.Checked, cbInteresesAnticipados.Checked, QCompBanca, Objeto.Apli, True);
end;

procedure TWCrCompBanca.ExportarXLS (FileName: string);
var
  XLApp, XLSheet, Range: Variant;
  Row: integer;

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
  XLApp := CreateOleObject('Excel.Application');
  try
    Cursor              := crHourGlass;
    XLApp.Visible       := False;
    XLApp.DisplayAlerts := False;
    XLApp.Workbooks.Add(xlWBatWorkSheet);

    {Inicia la generación de la tabla}
    XLSheet      := XLApp.Workbooks[1].WorkSheets[1];
    XLSheet.Name := 'Comparativo por banca';

    {Encabezado del reporte}
    XLSheet.Cells [1, 1].Formula := Caption;  // Título del reporte
    XLSheet.Range ['A1:E1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [2, 1].Formula := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['A2:E2'].Merge;
    XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [3, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [3, 2].Formula := 'Información expresada en ' + LowerCase (rgFactorMoneda.Items [rgFactorMoneda.ItemIndex]);
    XLSheet.Range ['B3:E3'].Merge;
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
    XLSheet.Range ['C4:E4'].Merge;

    {Encabezado de las columnas}
    XLSheet.Cells [6, 1].Formula := 'Banca';
    XLSheet.Cells [6, 2].Formula := 'Subdivisión';
    XLSheet.Cells [5, 3].Formula := 'Saldo';
    XLSheet.Cells [6, 3].Formula := '''' + FormatDateTime ('mmm/yy', dpFecha.Date);
    XLSheet.Cells [5, 4].Formula := 'Presupuesto';
    XLSheet.Cells [6, 4].Formula := '''' + FormatDateTime ('mmm/yy', dpFecha.Date);
    XLSheet.Cells [6, 5].Formula := 'Diferencia';

    XLSheet.Range ['A1:E6'].Font.Bold           := True;
    XLSheet.Range ['A5:E6'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['C4'].HorizontalAlignment    := xlHAlignRight;

    Range                     := XLSheet.Range ['A5:E6'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row := 7;
    QCompBanca.First;
    while not QCompBanca.Eof do
    begin
      XLSheet.Cells [Row, 1].Formula := QCompBanca.FieldByName ('Desc_Banca').AsString;
      XLSheet.Cells [Row, 2].Formula := QCompBanca.FieldByName ('Desc_Sub_Banca').AsString;
      XLSheet.Cells [Row, 3].Value   := QCompBanca.FieldByName ('Imp_Real').AsFloat;
      XLSheet.Cells [Row, 4].Value   := QCompBanca.FieldByName ('Imp_Presup').AsFloat;
      XLSheet.Cells [Row, 5].Value   := QCompBanca.FieldByName ('Imp_Crecimiento').AsFloat;

      if QCompBanca.FieldByName ('G1').AsFloat = 1 then
        XLSheet.Range [Format ('A%d:E%d', [Row, Row])].Font.Bold := True;

      if (QCompBanca.FieldByName ('G1').AsFloat = 1) and (QCompBanca.FieldByName ('Banca').AsString = 'GOB') then
      begin
        BorderRange ('A6:B' + IntToStr (Row));
        BorderRange ('C6:C' + IntToStr (Row));
        BorderRange ('D6:D' + IntToStr (Row));
        BorderRange ('E6:E' + IntToStr (Row));
      end;

      if QCompBanca.FieldByName ('Banca').AsString <> 'GOB' then
      begin
        BorderRange ('A' + IntToStr (Row));
        BorderRange ('C' + IntToStr (Row));
        BorderRange ('D' + IntToStr (Row));
        BorderRange ('E' + IntToStr (Row));
      end;


      QCompBanca.Next;
      Inc (Row);
    end;

    XLSheet.Range [Format ('C7:E%d', [Row - 1])].NumberFormat := '#,##0.00';

    XLSheet.Columns ['A:B'].AutoFit;
    XLSheet.Columns ['C:E'].ColumnWidth := 23;
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

procedure TWCrCompBanca.ExportarDetallesXLS (FileName: string);
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

  QDetalles.Close;
  QDetalles.DatabaseName := Objeto.Apli.DataBaseName;
  QDetalles.SessionName  := Objeto.Apli.SessionName;
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
    XLSheet.Cells [3, 2].Formula := 'Información expresada en ' + LowerCase (rgFactorMoneda.Items [rgFactorMoneda.ItemIndex]);
    XLSheet.Range ['B3:K3'].Merge;
    XLSheet.Range ['B3'].HorizontalAlignment := xlHAlignRight;

    if cbCartasCredito.Checked then
      XLSheet.Cells [4, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [4, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 7].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 7].Formula := 'No incluye intereses cobrados por anticipado';

    XLSheet.Range ['A4:F4'].Merge;
    XLSheet.Range ['G4:K4'].Merge;

    {Encabezado de las columnas}
    XLSheet.Cells [5,  9].Formula := 'Saldo';
    XLSheet.Cells [5, 10].Formula := 'Presupuesto';

    XLSheet.Cells [6,  1].Formula := 'Banca';
    XLSheet.Range ['A5:A6'].Merge;
    XLSheet.Cells [6,  2].Formula := 'Subdivisión';
    XLSheet.Range ['B5:B6'].Merge;
    XLSheet.Cells [6,  3].Formula := 'Tipo Entidad';
    XLSheet.Range ['C5:C6'].Merge;
    XLSheet.Cells [6,  4].Formula := 'ID Acreditado';
    XLSheet.Range ['D5:D6'].Merge;
    XLSheet.Cells [6,  5].Formula := 'Acreditado';
    XLSheet.Range ['E5:E6'].Merge;
    XLSheet.Cells [6,  6].Formula := 'ID Contrato';
    XLSheet.Range ['F5:F6'].Merge;
    XLSheet.Cells [6,  7].Formula := 'ID Credito';
    XLSheet.Range ['G5:G6'].Merge;
    XLSheet.Cells [6,  8].Formula := 'Tipo Credito';
    XLSheet.Range ['H5:H6'].Merge;
    XLSheet.Cells [6,  9].Formula := '''' + FormatDateTime ('mmm/yy', dpFecha.Date);;
    XLSheet.Cells [6, 10].Formula := '''' + FormatDateTime ('mmm/yy', dpFecha.Date);;
    XLSheet.Cells [6, 11].Formula := 'Diferencia';

    XLSheet.Range ['A1:K6'].Font.Bold := True;
    XLSheet.Range ['A5:K6'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['G4'].HorizontalAlignment := xlHAlignRight;

    Range                     := XLSheet.Range ['A5:K6'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row := 7;
    while not QDetalles.Eof do
    begin
      XLSheet.Cells [Row,  1].Value := QDetalles.FieldByName ('Desc_Banca').AsString;
      XLSheet.Cells [Row,  2].Value := QDetalles.FieldByName ('Desc_Sub_Banca').AsString;
      XLSheet.Cells [Row,  3].Value := QDetalles.FieldByName ('Tipo_Entidad').AsString;
      XLSheet.Cells [Row,  4].Value := QDetalles.FieldByName ('ID_Acreditado').AsFloat;
      XLSheet.Cells [Row,  5].Value := QDetalles.FieldByName ('Nom_Acred_Reg').AsString;
      XLSheet.Cells [Row,  6].Value := QDetalles.FieldByName ('ID_Contrato').AsFloat;
      XLSheet.Cells [Row,  7].Value := QDetalles.FieldByName ('ID_Credito').AsFloat;
      XLSheet.Cells [Row,  8].Value := QDetalles.FieldByName ('Tipo_Credito').AsString;
      XLSheet.Cells [Row,  9].Value := QDetalles.FieldByName ('Imp_Real').AsFloat;
      XLSheet.Cells [Row, 10].Value := QDetalles.FieldByName ('Imp_Presup').AsFloat;
      XLSheet.Cells [Row, 11].Value := QDetalles.FieldByName ('Imp_Crecimiento').AsFloat;

      QDetalles.Next;
      Inc (Row);
    end;

    XLSheet.Columns ['A:B'].ColumnWidth := 30;
    XLSheet.Columns ['E'].ColumnWidth := 30;
    XLSheet.Columns ['C:D'].ColumnWidth := 13;
    XLSheet.Range [Format ('I7:I%d', [Row - 1])].Style        := 'Currency';
    XLSheet.Range [Format ('J7:J%d', [Row - 1])].Style        := 'Currency';
    XLSheet.Range [Format ('K7:K%d', [Row - 1])].Style        := 'Currency';
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


procedure TWCrCompBanca.sbExportarDetallesClick(Sender: TObject);
var
  XLApp: Variant;
begin
  sbExportarDetalles.Refresh;
  if SaveXLS.Execute then
  begin
    Cursor := crHourGlass;
    try
      ExportarDetallesXLS (SaveXLS.FileName);
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
