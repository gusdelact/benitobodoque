// Sistema         : Clase de CRCOMPINFRA
// Fecha de Inicio : 10/07/2012
// Función forma   : Clase de CRCOMPINFRA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrCompInf;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
  UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, ShellAPI, ComObj,
  IntQrCompInf, IntQrCompInfGraph;

const ALTO_COL = 19;
      ALTO_DOBLE = 23;

const
{ XlFileFormat }
  xlWBatWorkSheet       = -4167;

{ xlHorizontalAlignment}
  xlHAlignCenter = -4108;
  xlHAlignLeft   = -4131;
  xlHAlignRight  = -4152;

{xlLineStyle}
  xlThemeColorLight1       =     2;
  xlThemeColorDark1        =     1;

Type
  TCrCompInf = class;

  TWCrCompInfra = Class(TForm)
    InterForma1: TInterForma;
    Panel1: TPanel;
    Label1: TLabel;
    sbExportar: TSpeedButton;
    dpFecha: TDateTimePicker;
    rgFactorMoneda: TRadioGroup;
    btBusca: TBitBtn;
    GroupBox1: TGroupBox;
    cbEstados: TCheckBox;
    cbMunicipios: TCheckBox;
    cbOrgDesc: TCheckBox;
    cbPrivado: TCheckBox;
    cbFederal: TCheckBox;
    QLeyendaEntidades: TQuery;
    SaveXLS: TSaveDialog;
    SGCompInfra: TSGCtrl;
    QCompInfra: TQuery;
    QCompInfraGrupo: TFloatField;
    QCompInfraDesc_Grupo: TStringField;
    QCompInfraOrden: TFloatField;
    QCompInfraDescripcion: TStringField;
    QCompInfraImp_4TYAnt: TFloatField;
    QCompInfraPct_4TYAnt: TFloatField;
    QCompInfraImp_1TYAct: TFloatField;
    QCompInfraPct_1TYAct: TFloatField;
    QCompInfraImp_Fecha: TFloatField;
    QCompInfraPct_Fecha: TFloatField;
    QCompInfraImp_Dif1: TFloatField;
    QCompInfraPct_Dif1: TFloatField;
    QCompInfraImp_4TYAct: TFloatField;
    QCompInfraPct_4TYAct: TFloatField;
    QCompInfraImp_Dif2: TFloatField;
    QCompInfraPct_Dif2: TFloatField;
    QCompInfraG1: TFloatField;
    QFechas: TQuery;
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
    procedure sbExportarClick(Sender: TObject);
    procedure SGCompInfraCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure InterForma1BtnAyudaClick(Sender: TObject);
    procedure sbExportarDetalleClick(Sender: TObject);
  private
    { Private declarations }
    procedure GeneraConsulta;
    function ConstruyeTipoEntidad: string;
    procedure ExportarXLS (FileName: string);
    procedure ExportarXLSDetalle (FileName: string);
  public
    { Public declarations }
    Objeto : TCrCompInf;
  end;

  TCrCompInf= class(TInterFrame)
  private
  protected
//  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
    { Public declarations }
    CAMPO1                   : TInterCampo;
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


constructor TCrCompInf.Create( AOwner : TComponent );
begin
  Inherited;
  StpName         := ' ';
  UseQuery        := False;
  HelpFile        := 'IntCrcompinf.Hlp';
  ShowMenuReporte := True;
end;

Destructor TCrCompInf.Destroy;
begin
  inherited;
end;


function TCrCompInf.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W: TWCrCompInfra;
begin
   W := TWCrCompInfra.Create(Self);
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


function TCrCompInf.InternalBusca:Boolean;
var
  T: TInterFindit;
begin
  InternalBusca := False;
  T             := CreaBuscador('ICrcompi.it','');
  Try
    if Active then
    begin
    end;

    if T.Execute then
      InternalBusca := FindKey([]);
  finally
    T.Free;
  end;
end;

function TCrCompInf.Reporte:Boolean;
begin
  //Execute_Reporte();
end;

function BoolToStr (b: boolean): string;
begin
  if b then
    result := 'V'
  else
    result := 'F';
end;

(***********************************************FORMA CRCOMPINFRA********************)
(*                                                                              *)
(*  FORMA DE CRCOMPINFRA                                                            *)
(*                                                                              *)
(***********************************************FORMA CRCOMPINFRA********************)

procedure TWCrCompInfra.FormShow(Sender: TObject);
begin
  InterForma1.btnAyuda.Caption := '&Imprimir';
  dpFecha.Date                 := Objeto.Apli.DameFechaEmpresa;
  GeneraConsulta;
end;

procedure TWCrCompInfra.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWCrCompInfra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrCompInfra.InterForma1DespuesNuevo(Sender: TObject);
begin
  //<<Control>>.SetFocus;
end;

procedure TWCrCompInfra.InterForma1DespuesModificar(Sender: TObject);
begin
  //<<Control>>.SetFocus;
end;

//procedure TWCrcompinfra.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;

procedure TWCrCompInfra.GeneraConsulta;
var
  Factor: double;
  vlF_T4YAnt: TDateTime;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  vlF_T4YAnt := EncodeDate (StrToInt (FormatDateTime ('yyyy', dpFecha.Date)) - 1, 12, 31);

  QFechas.Close;
  QFechas.DatabaseName                   := Objeto.Apli.DataBaseName;
  QFechas.SessionName                    := Objeto.Apli.SessionName;
  QFechas.ParamByName ('peFecha').AsDate := dpFecha.Date;
  QFechas.Open;

  QCompInfra.Close;
  QCompInfra.DatabaseName                            := Objeto.Apli.DataBaseName;
  QCompInfra.SessionName                             := Objeto.Apli.SessionName;
  QCompInfra.ParamByName ('peFecha').AsDate          := dpFecha.Date - 1;
  QCompInfra.ParamByName ('peF_4TYAnt').AsDate       := vlF_T4YAnt;
  QCompInfra.ParamByName ('peFactor').AsFloat        := Factor;
  QCompInfra.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QCompInfra.ParamByName ('peCartas_Cred').AsString  := BoolToStr (cbCartasCredito.Checked);
  QCompInfra.ParamByName ('peInt_Cob_Ant').AsString  := BoolToStr (cbInteresesAnticipados.Checked);
  QCompInfra.Open;

  QCompInfraImp_4TYAnt.DisplayLabel := '            4T' + FormatDateTime ('yyyy', vlF_T4YAnt);
  QCompInfraImp_1TYAct.DisplayLabel := '            1T' + FormatDateTime ('yyyy', dpFecha.Date);
  QCompInfraImp_Fecha.DisplayLabel  := FormatDateTime ('" Saldo al" dd/mm/yyyy', dpFecha.Date);
  QCompInfraImp_4TYAct.DisplayLabel := '            4T' + FormatDateTime ('yyyy', dpFecha.Date);

  QCompInfraPct_4TYAnt.Alignment := taCenter;
  QCompInfraPct_1TYAct.Alignment := taCenter;
  QCompInfraPct_Fecha .Alignment := taCenter;
  QCompInfraPct_Dif1  .Alignment := taCenter;
  QCompInfraPct_4TYAct.Alignment := taCenter;
  QCompInfraPct_Dif2  .Alignment := taCenter;

  QLeyendaEntidades.Close;
  QLeyendaEntidades.DatabaseName                            := Objeto.Apli.DataBaseName;
  QLeyendaEntidades.SessionName                             := Objeto.Apli.SessionName;
  QLeyendaEntidades.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
  QLeyendaEntidades.Open;

  SGCompInfra.AddQry(QCompInfra, // Query
        True, // Iniciar Grid, Limpiar Lineas Anteriores.
        True, // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
        -1,   // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
        ALTO_COL,  // Alto del Header, -1 es el Default 32 Columnas
        ALTO_DOBLE,// Alto del las Lineas, 1 es el Default 32
        True); // ShowTitle
end;

function TWCrCompInfra.ConstruyeTipoEntidad: string;
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

procedure TWCrCompInfra.btBuscaClick(Sender: TObject);
begin
  GeneraConsulta;
end;

procedure TWCrCompInfra.sbExportarClick(Sender: TObject);
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

procedure TWCrCompInfra.SGCompInfraCalcRow(Sendet: TObject;
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

procedure TWCrCompInfra.InterForma1BtnAyudaClick(Sender: TObject);
var
  Factor: double;
begin
  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  RepComparativoInfra      (dpFecha.Date, Factor, QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString, cbCartasCredito.Checked, cbInteresesAnticipados.Checked, QCompInfra, Objeto.Apli, True);
  RepComparativoInfraGraph (dpFecha.Date, Factor, QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString, QCompInfra, Objeto.Apli, True);
end;


procedure TWCrCompInfra.ExportarXLS (FileName: string);
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
  RecLimite = record
    Inicio, Fin: integer;
  end;
  ListLimite = array of RecLimite;

var
  XLApp, XLSheet, Range, Chart, Serie: Variant;
  Row, Grupo, i, YIni, XIni, XFin: integer;
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
    XLSheet.Range ['A1:M1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [2, 2].Formula := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['A2:M2'].Merge;
    XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [3, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [3, 2].Formula := 'Información expresada en ' + LowerCase (rgFactorMoneda.Items [rgFactorMoneda.ItemIndex]);
    XLSheet.Range ['B3:M3'].Merge;
    XLSheet.Range ['B3'].HorizontalAlignment := xlHAlignRight;

    if cbCartasCredito.Checked then
      XLSheet.Cells [4, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [4, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 2].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 2].Formula := 'No incluye intereses cobrados por anticipado';

    XLSheet.Range ['B4:M4'].Merge;

    QCompInfra.First;
    Row   := 5;
    Grupo := -1;
    SetLength (List, 0);
    while not QCompInfra.Eof do
    begin
      if Grupo <> QCompInfra.FieldByName ('Grupo').AsInteger then
      begin
        XLSheet.Cells [Row,      1].Formula := QCompInfra.FieldByName ('Desc_Grupo').AsString;

        Range                     := XLSheet.Range [Format ('A%d', [Row])];
        Range.Interior.ThemeColor := xlThemeColorLight1;
        Range.Font.Bold           := True;
        Range.Font.ThemeColor     := xlThemeColorDark1;
        Range.HorizontalAlignment := xlHAlignCenter;

        Inc (Row);
        XLSheet.Cells [Row,      2].Formula := Format ('(1) 4T%d', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date)) - 1]);
        XLSheet.Cells [Row + 1,  2].Formula := '$';
        XLSheet.Cells [Row + 1,  3].Formula := '%';
        XLSheet.Cells [Row,      4].Formula := Format ('(2) 1T%d', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date))]);
        XLSheet.Cells [Row + 1,  4].Formula := '$';
        XLSheet.Cells [Row + 1,  5].Formula := '%';
        XLSheet.Cells [Row,      6].Formula := Format ('(3) Saldo al %s', [FormatDateTime ('dd/mm/yyyy', dpFecha.Date)]);
        XLSheet.Cells [Row + 1,  6].Formula := '$';
        XLSheet.Cells [Row + 1,  7].Formula := '%';
        XLSheet.Cells [Row,      8].Formula := 'Diferencia (2-3)';
        XLSheet.Cells [Row + 1,  8].Formula := '$';
        XLSheet.Cells [Row + 1,  9].Formula := '%';
        XLSheet.Cells [Row,     10].Formula := Format ('(4) 4T%d', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date))]);
        XLSheet.Cells [Row + 1, 10].Formula := '$';
        XLSheet.Cells [Row + 1, 11].Formula := '%';
        XLSheet.Cells [Row,     12].Formula := 'Diferencia (4-1)';
        XLSheet.Cells [Row + 1, 12].Formula := '$';
        XLSheet.Cells [Row + 1, 13].Formula := '%';

        XLSheet.Range [Format ('B%d:C%d', [Row, Row])].Merge;
        XLSheet.Range [Format ('D%d:E%d', [Row, Row])].Merge;
        XLSheet.Range [Format ('F%d:G%d', [Row, Row])].Merge;
        XLSheet.Range [Format ('H%d:I%d', [Row, Row])].Merge;
        XLSheet.Range [Format ('J%d:K%d', [Row, Row])].Merge;
        XLSheet.Range [Format ('L%d:M%d', [Row, Row])].Merge;

        Range                     := XLSheet.Range [Format ('B%d:M%d', [Row, Row + 1])];
        Range.Interior.ThemeColor := xlThemeColorLight1;
        Range.Font.Bold           := True;
        Range.Font.ThemeColor     := xlThemeColorDark1;
        Range.HorizontalAlignment := xlHAlignCenter;

        Inc (Row, 2);
        SetLength (List, Length (List) + 1);
        List [Length (List) - 1].Inicio := Row;
      end;

      XLSheet.Cells [Row,  1].Formula := QCompInfra.FieldByName ('Descripcion').AsString;
      XLSheet.Cells [Row,  2].Value   := QCompInfra.FieldByName ('Imp_4TYAnt').AsFloat;
      XLSheet.Cells [Row,  3].Value   := QCompInfra.FieldByName ('Pct_4TYAnt').AsFloat;
      XLSheet.Cells [Row,  4].Value   := QCompInfra.FieldByName ('Imp_1TYAct').AsFloat;
      XLSheet.Cells [Row,  5].Value   := QCompInfra.FieldByName ('Pct_1TYAct').AsFloat;
      XLSheet.Cells [Row,  6].Value   := QCompInfra.FieldByName ('Imp_Fecha').AsFloat;
      XLSheet.Cells [Row,  7].Value   := QCompInfra.FieldByName ('Pct_Fecha').AsFloat;
      XLSheet.Cells [Row,  8].Value   := QCompInfra.FieldByName ('Imp_Dif1').AsFloat;
      XLSheet.Cells [Row,  9].Value   := QCompInfra.FieldByName ('Pct_Dif1').AsFloat;
      XLSheet.Cells [Row, 10].Value   := QCompInfra.FieldByName ('Imp_4TYAct').AsFloat;
      XLSheet.Cells [Row, 11].Value   := QCompInfra.FieldByName ('Pct_4TYAct').AsFloat;
      XLSheet.Cells [Row, 12].Value   := QCompInfra.FieldByName ('Imp_Dif2').AsFloat;
      XLSheet.Cells [Row, 13].Value   := QCompInfra.FieldByName ('Pct_Dif2').AsFloat;
      Grupo                           := QCompInfra.FieldByName ('Grupo').AsInteger;
      List [Length (List) - 1].Fin    := Row;

      if QCompInfra.FieldByName ('G1').AsFloat = 1 then
      begin
        XLSheet.Range [Format('A%d:N%d', [Row, Row])].Font.Bold := True;
        Inc (Row);
      end;

      QCompInfra.Next;
      Inc (Row);
    end;

    for i := 0 to Length (List) - 1 do
      XLSheet.Range [Format ('B%d:M%d', [List [i].Inicio, List [i].Fin])].NumberFormat := '#,##0.00';

    XLSheet.Columns ['A'].AutoFit;
    XLSheet.Columns ['B:L'].ColumnWidth := 15;
    XLSheet.Columns ['C'].ColumnWidth   :=  8;
    XLSheet.Columns ['E'].ColumnWidth   :=  8;
    XLSheet.Columns ['G'].ColumnWidth   :=  8;
    XLSheet.Columns ['I'].ColumnWidth   :=  8;
    XLSheet.Columns ['K'].ColumnWidth   :=  8;
    XLSheet.Columns ['M'].ColumnWidth   :=  8;
    XLSheet.Range ['B5'].Select;
    XLApp.ActiveWindow.FreezePanes               := True;
    XLSheet.Range ['B4'].HorizontalAlignment     := xlHAlignRight;
    XLSheet.Columns ['C'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Columns ['E'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Columns ['G'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Columns ['I'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Columns ['K'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Columns ['M'].HorizontalAlignment := xlHAlignCenter;

    {Si se generaron ambos grupos crea las dos gráficas, en caso contrario no crea ninguna}
    if Length (List) = 2 then
    begin
      {Genera la primer gráfica}
      YIni := XLSheet.Cells [Row + 2,  1].Top;
      XFin := XLSheet.Cells [Row + 2, 14].Left;

      Chart := XLSheet.ChartObjects.Add (0, YIni, XFin div 2, YIni + 100);
      Chart.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[1].Range['A7:B7'], xlColumns);
      Chart.Chart.HasTitle        := True;
      Chart.Chart.ChartTitle.Text := 'Por subsector';

      while Chart.Chart.SeriesCollection.Count > 0 do
        Chart.Chart.SeriesCollection [1].Delete;

      Serie         := Chart.Chart.SeriesCollection.NewSeries;
      Serie.Name    := Format ('="(2) 1T%s"', [FormatDateTime ('yyyy', dpFecha.Date)]);
      Serie.Values  := Format ('=Tabla!$D$%d:$D$%d',  [List [0].Inicio, List [0].Fin - 1]);
      Serie.XValues := Format ('=Tabla!$A$%d:$A$%d',  [List [0].Inicio, List [0].Fin - 1]);

      Serie         := Chart.Chart.SeriesCollection.NewSeries;
      Serie.Name    := Format ('="(3) Saldo al %s"', [FormatDateTime ('dd/mm/yyyy', dpFecha.Date)]);
      Serie.Values  := Format ('=Tabla!$F$%d:$F$%d',  [List [0].Inicio, List [0].Fin - 1]);
      Serie.XValues := Format ('=Tabla!$A$%d:$A$%d',  [List [0].Inicio, List [0].Fin - 1]);

      Serie         := Chart.Chart.SeriesCollection.NewSeries;
      Serie.Name    := '="Diferencia (2-3)"';
      Serie.Values  := Format ('=Tabla!$H$%d:$H$%d',  [List [0].Inicio, List [0].Fin - 1]);
      Serie.XValues := Format ('=Tabla!$A$%d:$A$%d',  [List [0].Inicio, List [0].Fin - 1]);

      Serie         := Chart.Chart.SeriesCollection.NewSeries;
      Serie.Name    := Format ('="(4) 4T%s"', [FormatDateTime ('yyyy', dpFecha.Date)]);
      Serie.Values  := Format ('=Tabla!$J$%d:$J$%d',  [List [0].Inicio, List [0].Fin - 1]);
      Serie.XValues := Format ('=Tabla!$A$%d:$A$%d',  [List [0].Inicio, List [0].Fin - 1]);

      Serie         := Chart.Chart.SeriesCollection.NewSeries;
      Serie.Name    := Format ('="(1) 4T%d"', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date)) - 1]);
      Serie.Values  := Format ('=Tabla!$B$%d:$B$%d',  [List [0].Inicio, List [0].Fin - 1]);
      Serie.XValues := Format ('=Tabla!$A$%d:$A$%d',  [List [0].Inicio, List [0].Fin - 1]);

      Serie         := Chart.Chart.SeriesCollection.NewSeries;
      Serie.Name    := '="Diferencia (4-1)"';
      Serie.Values  := Format ('=Tabla!$L$%d:$L$%d',  [List [0].Inicio, List [0].Fin - 1]);
      Serie.XValues := Format ('=Tabla!$A$%d:$A$%d',  [List [0].Inicio, List [0].Fin - 1]);

      {Genera la segunda gráfica}
      YIni := XLSheet.Cells [Row + 2,  1].Top;
      XFin := XLSheet.Cells [Row + 2, 14].Left;

      Chart := XLSheet.ChartObjects.Add (XFin div 2 + 1, YIni, XFin div 2, YIni + 100);
      Chart.Chart.SetSourceData(XLApp.Workbooks[1].WorkSheets[1].Range['A7:B7'], xlColumns);
      Chart.Chart.HasTitle        := True;
      Chart.Chart.ChartTitle.Text := 'Por fuente de pago';

      while Chart.Chart.SeriesCollection.Count > 0 do
        Chart.Chart.SeriesCollection [1].Delete;

      Serie         := Chart.Chart.SeriesCollection.NewSeries;
      Serie.Name    := Format ('="(2) 1T%s"', [FormatDateTime ('yyyy', dpFecha.Date)]);
      Serie.Values  := Format ('=Tabla!$D$%d:$D$%d',  [List [1].Inicio, List [1].Fin - 1]);
      Serie.XValues := Format ('=Tabla!$A$%d:$A$%d',  [List [1].Inicio, List [1].Fin - 1]);

      Serie         := Chart.Chart.SeriesCollection.NewSeries;
      Serie.Name    := Format ('="(3) Saldo al %s"', [FormatDateTime ('dd/mm/yyyy', dpFecha.Date)]);
      Serie.Values  := Format ('=Tabla!$F$%d:$F$%d',  [List [1].Inicio, List [1].Fin - 1]);
      Serie.XValues := Format ('=Tabla!$A$%d:$A$%d',  [List [1].Inicio, List [1].Fin - 1]);

      Serie         := Chart.Chart.SeriesCollection.NewSeries;
      Serie.Name    := '="Diferencia (2-3)"';
      Serie.Values  := Format ('=Tabla!$H$%d:$H$%d',  [List [1].Inicio, List [1].Fin - 1]);
      Serie.XValues := Format ('=Tabla!$A$%d:$A$%d',  [List [1].Inicio, List [1].Fin - 1]);

      Serie         := Chart.Chart.SeriesCollection.NewSeries;
      Serie.Name    := Format ('="(4) 4T%s"', [FormatDateTime ('yyyy', dpFecha.Date)]);
      Serie.Values  := Format ('=Tabla!$J$%d:$J$%d',  [List [1].Inicio, List [1].Fin - 1]);
      Serie.XValues := Format ('=Tabla!$A$%d:$A$%d',  [List [1].Inicio, List [1].Fin - 1]);

      Serie         := Chart.Chart.SeriesCollection.NewSeries;
      Serie.Name    := Format ('="(1) 4T%d"', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date)) - 1]);
      Serie.Values  := Format ('=Tabla!$B$%d:$B$%d',  [List [1].Inicio, List [1].Fin - 1]);
      Serie.XValues := Format ('=Tabla!$A$%d:$A$%d',  [List [1].Inicio, List [1].Fin - 1]);

      Serie         := Chart.Chart.SeriesCollection.NewSeries;
      Serie.Name    := '="Diferencia (4-1)"';
      Serie.Values  := Format ('=Tabla!$L$%d:$L$%d',  [List [1].Inicio, List [1].Fin - 1]);
      Serie.XValues := Format ('=Tabla!$A$%d:$A$%d',  [List [1].Inicio, List [1].Fin - 1]);
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

procedure TWCrCompInfra.sbExportarDetalleClick(Sender: TObject);
var
  XLApp: Variant;
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

procedure TWCrCompInfra.ExportarXLSDetalle (FileName: string);
var
  Factor: double;
  vlF_T4YAnt: TDateTime;
  XLApp, XLSheet: Variant;
  Range, Chart, Serie: Variant;
  Row, RowIni, CurrTipo, XFin, YIni: integer;
begin

  Factor := 1;
  case rgFactorMoneda.ItemIndex of
    0: Factor := 1000000;
    1: Factor := 1000;
    2: Factor := 1;
  end;

  vlF_T4YAnt := EncodeDate (StrToInt (FormatDateTime ('yyyy', dpFecha.Date)) - 1, 12, 31);

  QDetalle.Close;
  QDetalle.DatabaseName := Objeto.Apli.DataBaseName;
  QDetalle.SessionName  := Objeto.Apli.SessionName;
  QDetalle.ParamByName ('peFecha').AsDate          := dpFecha.Date - 1;
  QDetalle.ParamByName ('peF_4TYAnt').AsDate       := vlF_T4YAnt;
  QDetalle.ParamByName ('peFactor').AsFloat        := Factor;
  QDetalle.ParamByName ('peTipo_Entidad').AsString := ConstruyeTipoEntidad;
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
    XLSheet.Range ['A1:T1'].Merge;
    XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Cells [2, 1].Formula := QLeyendaEntidades.FieldByName ('Leyenda_Entidades').AsString;
    XLSheet.Range ['A2:T2'].Merge;
    XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Cells [3, 1].Formula := 'Fecha: ' + FormatDateTime ('dd/mm/yyyy', dpFecha.DateTime);
    XLSheet.Cells [3, 2].Formula := 'Información expresada en ' + LowerCase (rgFactorMoneda.Items [rgFactorMoneda.ItemIndex]);
    XLSheet.Range ['B3:T3'].Merge;
    XLSheet.Range ['B3'].HorizontalAlignment := xlHAlignRight;

    if cbCartasCredito.Checked then
      XLSheet.Cells [4, 1].Formula := 'Incluye Cartas de Crédito'
    else
      XLSheet.Cells [4, 1].Formula := 'No incluye Cartas de Crédito';

    if cbInteresesAnticipados.Checked then
      XLSheet.Cells [4, 10].Formula := 'Incluye intereses cobrados por anticipado'
    else
      XLSheet.Cells [4, 10].Formula := 'No incluye intereses cobrados por anticipado';

    XLSheet.Range ['A4:I4'].Merge;
    XLSheet.Range ['J4:T4'].Merge;

    {Encabezado de las columnas}
    XLSheet.Cells [5,   9].Formula := Format ('(1) 4T%d', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date)) - 1]);;
    XLSheet.Cells [5,  11].Formula := Format ('(2) 1T%d', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date))]);;
    XLSheet.Cells [5,  13].Formula := Format ('(3) Saldo al %s', [FormatDateTime ('dd/mm/yyyy', dpFecha.Date)]);;
    XLSheet.Cells [5,  15].Formula := 'Diferencia (2-3)';
    XLSheet.Cells [5,  17].Formula := Format ('(4) 4T%d', [StrToInt (FormatDateTime ('yyyy', dpFecha.Date))]);
    XLSheet.Cells [5,  19].Formula := 'Diferencia (4-1)';
    XLSheet.Range ['I5:J5'].Merge;
    XLSheet.Range ['K5:L5'].Merge;
    XLSheet.Range ['M5:N5'].Merge;
    XLSheet.Range ['O5:P5'].Merge;
    XLSheet.Range ['Q5:R5'].Merge;
    XLSheet.Range ['S5:T5'].Merge;

    XLSheet.Cells [6,  1].Formula := 'Grupo';
    XLSheet.Range ['A5:A6'].Merge;
    XLSheet.Cells [6,  2].Formula := 'Concepto';
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
    XLSheet.Cells [6,  9].Formula := '$';
    XLSheet.Cells [6, 10].Formula := '%';
    XLSheet.Cells [6, 11].Formula := '$';
    XLSheet.Cells [6, 12].Formula := '%';
    XLSheet.Cells [6, 13].Formula := '$';
    XLSheet.Cells [6, 14].Formula := '%';
    XLSheet.Cells [6, 15].Formula := '$';
    XLSheet.Cells [6, 16].Formula := '%';
    XLSheet.Cells [6, 17].Formula := '$';
    XLSheet.Cells [6, 18].Formula := '%';
    XLSheet.Cells [6, 19].Formula := '$';
    XLSheet.Cells [6, 20].Formula := '%';

    XLSheet.Range ['A1:T6'].Font.Bold := True;
    XLSheet.Range ['A5:T6'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Range ['J4'].HorizontalAlignment := xlHAlignRight;

    Range                     := XLSheet.Range ['A5:T6'];
    Range.Interior.ThemeColor := xlThemeColorLight1;
    Range.Font.Bold           := True;
    Range.Font.ThemeColor     := xlThemeColorDark1;

    Row := 7;
    while not QDetalle.Eof do
    begin
      XLSheet.Cells [Row,  1].Value := QDetalle.FieldByName ('Desc_Grupo').AsString;
      XLSheet.Cells [Row,  2].Value := QDetalle.FieldByName ('Descripcion').AsString;
      XLSheet.Cells [Row,  3].Value := QDetalle.FieldByName ('Tipo_Entidad').AsString;
      XLSheet.Cells [Row,  4].Value := QDetalle.FieldByName ('ID_Acreditado').AsFloat;
      XLSheet.Cells [Row,  5].Value := QDetalle.FieldByName ('Nom_Acred_Reg').AsString;
      XLSheet.Cells [Row,  6].Value := QDetalle.FieldByName ('ID_Contrato').AsFloat;
      XLSheet.Cells [Row,  7].Value := QDetalle.FieldByName ('ID_Credito').AsFloat;
      XLSheet.Cells [Row,  8].Value := QDetalle.FieldByName ('Tipo_Credito').AsString;
      XLSheet.Cells [Row,  9].Value := QDetalle.FieldByName ('Imp_4TYAnt').AsFloat;
      XLSheet.Cells [Row, 10].Value := QDetalle.FieldByName ('Pct_4TYAnt').AsFloat / 100;
      XLSheet.Cells [Row, 11].Value := QDetalle.FieldByName ('Imp_1TYAct').AsFloat;
      XLSheet.Cells [Row, 12].Value := QDetalle.FieldByName ('Pct_1TYAct').AsFloat / 100;
      XLSheet.Cells [Row, 13].Value := QDetalle.FieldByName ('Imp_Fecha').AsFloat;
      XLSheet.Cells [Row, 14].Value := QDetalle.FieldByName ('Pct_Fecha').AsFloat  / 100;
      XLSheet.Cells [Row, 15].Value := QDetalle.FieldByName ('Imp_Dif1').AsFloat;
      XLSheet.Cells [Row, 16].Value := QDetalle.FieldByName ('Pct_Dif1').AsFloat   / 100;
      XLSheet.Cells [Row, 17].Value := QDetalle.FieldByName ('Imp_4TYAct').AsFloat;
      XLSheet.Cells [Row, 18].Value := QDetalle.FieldByName ('Pct_4TYAct').AsFloat / 100;
      XLSheet.Cells [Row, 19].Value := QDetalle.FieldByName ('Imp_Dif2').AsFloat;
      XLSheet.Cells [Row, 20].Value := QDetalle.FieldByName ('Pct_Dif2').AsFloat   / 100;

      QDetalle.Next;
      Inc (Row);
    end;

    XLSheet.Columns ['B'].ColumnWidth := 30;
    XLSheet.Columns ['C:D'].ColumnWidth := 13;
    XLSheet.Columns ['E'].ColumnWidth := 30;
    XLSheet.Columns ['A'].AutoFit;
    XLSheet.Columns ['I'].AutoFit;
    XLSheet.Columns ['J'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Columns ['L'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Columns ['N'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Columns ['P'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Columns ['R'].HorizontalAlignment := xlHAlignCenter;
    XLSheet.Columns ['T'].HorizontalAlignment := xlHAlignCenter;

    XLSheet.Range [Format ('I6:I%d', [Row - 1])].Style        := 'Currency';

    XLSheet.Range [Format ('J6:J%d', [Row - 1])].Style        := 'Percent';
    XLSheet.Range [Format ('J6:J%d', [Row - 1])].NumberFormat := '0.00%';

    XLSheet.Range [Format ('K6:K%d', [Row - 1])].Style        := 'Currency';

    XLSheet.Range [Format ('L6:L%d', [Row - 1])].Style        := 'Percent';
    XLSheet.Range [Format ('L6:L%d', [Row - 1])].NumberFormat := '0.00%';

    XLSheet.Range [Format ('M6:M%d', [Row - 1])].Style        := 'Currency';

    XLSheet.Range [Format ('N6:N%d', [Row - 1])].Style        := 'Percent';
    XLSheet.Range [Format ('N6:N%d', [Row - 1])].NumberFormat := '0.00%';

    XLSheet.Range [Format ('O6:O%d', [Row - 1])].Style        := 'Currency';

    XLSheet.Range [Format ('P6:P%d', [Row - 1])].Style        := 'Percent';
    XLSheet.Range [Format ('P6:P%d', [Row - 1])].NumberFormat := '0.00%';

    XLSheet.Range [Format ('Q6:Q%d', [Row - 1])].Style        := 'Currency';

    XLSheet.Range [Format ('R6:R%d', [Row - 1])].Style        := 'Percent';
    XLSheet.Range [Format ('R6:R%d', [Row - 1])].NumberFormat := '0.00%';

    XLSheet.Range [Format ('S6:S%d', [Row - 1])].Style        := 'Currency';

    XLSheet.Range [Format ('T6:T%d', [Row - 1])].Style        := 'Percent';
    XLSheet.Range [Format ('T6:T%d', [Row - 1])].NumberFormat := '0.00%';
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

end.
